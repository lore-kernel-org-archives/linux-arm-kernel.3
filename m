Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C906CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhYz/5fgMINq4cCb6y6f21WdcPvdaHa7LDsVjxXH4Gk=; b=HAr8fgUpCIPSCBzv4ie4TwdmZ9
	5WJAGPeU7Z2umjFO1erraPCtzvZb4yydKcMfLxJziMPhUG508H2S0GJuvZ0trZ6tbBw2pvjiHDlMu
	UPBNdf9iAWgvuTeoZBUoyw7y6LnvwHHUuuQd4Mov1ESn8VcxSQnqqm6fV1g0Yipp68meq1cpjU+xh
	9yvkF/WtUWvdm+tuvjdsGafK0V00gvbCaKQZ0aZAf9dzHCCvaMWoTChqOoTKn53s81+Jg3UylNlcC
	/fhLjR2nadCuYBqtP+qtZonWuAU6Zpv0VhQ36HuSMXlY9nEbsH9rfGVupBO/4dR6poXijShh+sFSJ
	NHxMKU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb1I-00000001oAI-1zEX;
	Mon, 23 Jun 2025 06:51:08 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTay9-00000001nB3-41Ci;
	Mon, 23 Jun 2025 06:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750661274; x=1782197274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YS5QfchkXQuDpizebXwc+i/GQO/Ujou+O/e0qMENePo=;
  b=llZsTLidIR1hmI/BOI2wnG4GVALzva+Lp0Up2TcJW8DPfTwyvF+jSJJB
   NYl5LKsGKh7M2HjricPRM8dq1T4QyCwXE5kxrlLyI34/zxqdQlgYuxwE0
   QItjxUwI0avsETwTIITNmHdoilAzVC+Vu1H7Be3UfRZ5VRAIYNGNTENdn
   nOQekEq1FfuialJK7roI4L64RFCwExDS5fH77CuezB/I7sM+t9HMUEDr+
   tT729RkZdiJyHBMLghcRDiAFmaByX0HQVXgEtjNbdiXy+47ZdzqH0mczz
   hTCgjv8qVR8/eJfKfEFPvEOzQIwbFizRWyhxmBKe8BHF7IW9lH5hYvepQ
   A==;
X-CSE-ConnectionGUID: y05lE7cfQzuTGn/8iizCZw==
X-CSE-MsgGUID: ink3BfkiSTyvdCwOU78IHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52991731"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52991731"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:47:52 -0700
X-CSE-ConnectionGUID: mNrnjtrWSK6xeohGlUJjsw==
X-CSE-MsgGUID: Pz/9sXzLRiW91MMh1pUT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="150924944"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:47:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9431E1201F7;
	Mon, 23 Jun 2025 09:47:44 +0300 (EEST)
Date: Mon, 23 Jun 2025 06:47:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev, ~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Message-ID: <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_234754_034579_7995FCA6 
X-CRM114-Status: GOOD (  17.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Olivier,

On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> This series has raised a question about the proper label name for the
> front/user camera and rear/world camera for phones.
> This series is using "ucam" and "wcam", which is used in a few other
> Rockship DTBs:
>  - arch/arm64/boot/dts/rockchip/px30-evb.dts
>  - rk3399-gru-scarlet.dtsi
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

Thanks for the patches.

I've picked the first two in the set, presumably the rest will be merged
via another tree?

-- 
Regards,

Sakari Ailus


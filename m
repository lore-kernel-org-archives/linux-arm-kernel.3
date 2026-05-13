Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WH5tMg43IHTkC++3kpNnCUeisd6lf0/zGFKoAbKRy4=; b=HWjwyoh5299XVpM01/AQ/H60cb
	L5WPXjLPngpdfcgCL3Ebb0ULYzjNggBycuCERQemPqKFPEExucuDe4u9QBJMWWq3qs1sledxweesU
	ZAj6tkVmth4DJltseABj1X4nRsOgEYP3z9yG4OyDirKYYr4lAgR82SX9KeHezewjYpk97TRTCaUza
	aPVrAVL4ffmJ0Fp+EMNfPFfpD8JwSEfLFL6Rw7SG55WxFNZi6UxKCh+SwJ2Pahk/TBTGxg59wTmhE
	OikfxfbdK1nMcJDsNEdB/1kN7fwUIPYTWxi/mWbO2mZ9vulo6JkGz05I50ovLnxRDdk5ysk4cTKVA
	3kQxPk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA8s-00000002rSt-2sus;
	Wed, 13 May 2026 14:00:54 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA8n-00000002rRz-0cTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778680850; x=1810216850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bw1C9JL2piKJzvwC5VL//CVGEW1j0mlc7RMZSghq6tM=;
  b=l85VcgBhjW/dVDl4uysFQmipDaHc/UCKK+shVTF/oIXhxzGBIBiXx5aY
   42qb1g1tGubHUGIsEVHcsM6AgFbeoNXZB7Z9OLfSTAwEwfuWVACYQVnVx
   vJVu3wxB+otSxiMu3KR2MxOTYZcIZhYL7k2ft+qrwavNVTwHovqm4VsBU
   9nXkHQ78IFBdTlyIH4adgnwCI1buh17PyrrV7y6YJCFW7ir7pTqUHcHHr
   PTwgMA5vHLU3bWXJ1P6qNwAFqKJTMPwSXdLGuqgEmfz/mPmdDWArEj7SX
   pbP26mCEWcwhnizbr+rQIZvlK3i8aIrsvUH3afGEawVs6cArsgBr1/1cW
   Q==;
X-CSE-ConnectionGUID: Ewr4VJ1YRnOzJJH2Fcxu7w==
X-CSE-MsgGUID: qgZAMYUaTqKQ7QpfXgavag==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79786084"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79786084"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:49 -0700
X-CSE-ConnectionGUID: 0GOQXddWRsmNK6MjzDE6vA==
X-CSE-MsgGUID: mqz3WQyNQiGCqUCReIfDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="239902049"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 012BF121C9E;
	Wed, 13 May 2026 17:00:43 +0300 (EEST)
Date: Wed, 13 May 2026 17:00:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: hi846: fix modes handling for different
 lane cases
Message-ID: <agSECpQ2xiP80E24@kekkonen.localdomain>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
 <20260511103927.279550-4-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_070049_219922_19E11321 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Hi Pengyu,

On Mon, May 11, 2026 at 06:39:25PM +0800, Pengyu Luo wrote:
> When using 4-lane, v4l2_find_nearest_size may return an unsupported
> mode, 640x480 mode, and it is set to the default mode.

Could you use v4l2_find_nearest_size_conditional()?

Ideally we should get rid of the cur_mode field altogether.

-- 
Regards,

Sakari Ailus


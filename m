Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E8FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI8mlFAwFAVzCcldU069BwkXTnK9RQyK5mpHPIMejJ8=; b=ehKU1iRo2LBDnYrRmxHrKkcBDX
	QMtjJur/1fmKtlsr63PfZEYWTSR4Eu3s5yfcFCkR8oq26/pzJPLEKaAI5WfuYLM+CUrH8HmT9j+E8
	u30P3HJfYVgIJ7Jh+JmWXohK5F1dkhTx1eupckmE2mFBMczAwvFiKZhzagG9okj5+MloIoF073HOo
	BsF+1uuS8p4zKilbbIfLiR24JUFRDpLQ5ej80AXJV7E/zSxCbEte96qqX5aZKR52+oP7tUWhZcfOA
	OZw+TRGicsT2xX7azD/BS9VJlgFMjGm/o3FP1JYNMvedxUlKSbaLvlYch6JvwfXFFSWyC28be6zGd
	vijK8tgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OLr-00000008b5R-2c1W;
	Wed, 23 Sep 2026 14:53:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OLo-00000008b52-1Trc;
	Wed, 23 Sep 2026 14:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175217; x=1821711217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rtgRXOJibX/Ng8wRfBILO1C3FM5qnu9zYTXLpzgUldw=;
  b=brgbl4OFOitCQ/VGGww7u59VfBahH3vVT16+dXPN93JCLa70e+cUL843
   L4P4/c71mRuokFTEE53AwhNAjTcgU3AguPq3j3KOaPcSEf7QFOEMcQKEE
   D/ZO8YUYi//yTZXCQmA9/FMe7H9FhSTAxsu0m4nmLm1JCpDB3KTcNmEBB
   Tp9TAjQJ2gCfrLm1JRazFab+noFWDssTC9LDW22DgYQY+DexbYNRqH88U
   GM9VFN3/e71FncNY/euUwK/o264NGNc78haw9pcGaGJmFnVOPtRJ9mCHO
   vj4JD0oXmuegi8uHnyzOvhlRkLwWU1LKXTXsZ7hWdsusScUcY4VxPhdCH
   A==;
X-CSE-ConnectionGUID: XGhqeg+zRbasAYXiSpQgzw==
X-CSE-MsgGUID: Hq6pR9E+SBueEpXM7avsfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101541365"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101541365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:53:36 -0700
X-CSE-ConnectionGUID: AICcPkvZQO+s+aSZ5YkSDw==
X-CSE-MsgGUID: Twm0/f/ERxSynu2tD3NGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272251112"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:53:33 -0700
Date: Wed, 23 Sep 2026 16:53:26 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the
 MIPI ID_CTRL1 register
Message-ID: <arPnvi6y5j-xPO_U@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075336_782586_4D175CBF 
X-CRM114-Status: GOOD (  12.56  )
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

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:29:59PM +0200, Amin Gattout wrote:
> The contents of the MIPI ID_CTRL1 register differ between variants. The
> RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
> for the virtual channel and data type filter.
> 
> Let each variant provide a callback that builds the register value, in
> preparation for the RK3576 support. Variants that do not provide one
> keep writing the capture size, so their behavior is unchanged.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait


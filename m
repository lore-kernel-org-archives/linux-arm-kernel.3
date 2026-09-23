Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C604C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aGtwU6jbVRbDIjhzv5hdjL3SWqtkzHCgIbz5MJMmrY=; b=dd9uNhCAkLt2ZVGuUEgECzAOC0
	JcUlPlEgBZWRbsAvd6kNPiepd3wxBt/kKif/+j36NqkVeZzPHCwIAEAHRqTVMuXYwSTlQhv1EISi1
	vI09qqYX/2S0sG6+F1GNCMVaYTAs+Yu5D3Kliq2SpuTBwga7wCjsA692EVwij5sPfVBaT+ZKtLSZv
	WAwES2Mul6kbImu+d6HSRKEXJSPfc4AnlX4xrKub6WsfMHAD+jb4N+1fhNLvvAFfsG2dp2q9aI4EV
	fhGaQuysu90jdMK9SWmbZp8jE720encgf1BWoBt8cIDCeIaJAKEgGbpC9xciJXF9QwqZcQ14HSIk6
	EqbISGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OJz-00000008acz-46ZC;
	Wed, 23 Sep 2026 14:51:44 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OJx-00000008acL-1tlR;
	Wed, 23 Sep 2026 14:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175101; x=1821711101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xK2MlXxgtxYCpbwBk+vL+8tf5gPJ59nrPDl4GsNLsdk=;
  b=LOkbNWA53C/MgO1iYrd59y1f1tWWE+mTjfcEH+NkeMOYZz5SCiiTXefc
   NNpOYaqXFS5ZFvsTw7o+Gp9VQR8Zh0jTPClv73pRVf3wXoD+ad7J/ySlX
   3eay7i7b/kD0lxD4KE8uz9wo/Ut9so5ZZwFT+FBAsiXqBP/PkCyPi6KM7
   vpWNrLV3BYZMSwIKyPkeH/N/Qs7cQJeHyzlI54GuPjmguX6HOrgaJSKnX
   8sdFMGc/uGT72gRz5cRoiNvEXf4XKiC9Ia2lBdwRmEdSn4UtC+UpghgAS
   gHdHZIfYxuINeG+OAvO/+UTH28ZZ6xk/vnfptR3l6asvmVUixyMua4UMw
   g==;
X-CSE-ConnectionGUID: mXpb0PvDTjWbnUVbmq6eCw==
X-CSE-MsgGUID: 3EoGGFc8RcufrRI8AA6pxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90993971"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90993971"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:51:41 -0700
X-CSE-ConnectionGUID: m6CmCC/rT2SBGzb12fmptQ==
X-CSE-MsgGUID: vGPljTpYRP67n1RxHKwLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4728488"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:51:38 -0700
Date: Wed, 23 Sep 2026 16:51:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: add rockchip rk3576 vicap
Message-ID: <arPnJ0WQPEojPDBV@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075141_585495_9192018E 
X-CRM114-Status: GOOD (  10.76  )
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

On Mon, Sep 21, 2026 at 05:29:57PM +0200, Amin Gattout wrote:
> Add the compatible for the Video Capture (VICAP) unit of the Rockchip
> RK3576. This variant features five MIPI CSI-2 ports and a connection
> to the image signal processor (ISP). The pixel clock of each MIPI port
> enters the VICAP through a dedicated gate in the clock and reset unit,
> so the variant takes five interface clocks and five interface resets
> in addition to the aclk, hclk and dclk of the other variants.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCDDC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYkvVDSHUJ0Lf7w0cAbP4dyw2lhYOIrP7SoQsUUyJRI=; b=j7hkbrxDjjWno7XEcZO31Yrf5/
	caTZ8wezxYZclkvcNKBj1jbZP5kvvxjf68DYND+lgvI+MKJr7cpsd6yF3fc6orKB/R7qivVsZEKKw
	3aTGaTj4SFwnRyH4XNfMfH7PigsMgBr8IZzTqyLVlrBW8gG6Uk7wQnPzp1nspFBzXQWXYSsiMjgUi
	i26nsKzpZMu5V/E1PaYvQC0LENiZr3JjNJaTEeB5ybZTCxYqecDbWxfhZMmikrjVg0QPwEjVwPZXl
	0wRLaoRlA0VhTZ8vR6q8roCYVhpCTFkBEi4GQdQOopAblxQME/H5oIYPGvMABigpQqP0g/oE+lY6j
	PClnsd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjUm-00000002fHk-3pRP;
	Tue, 11 Feb 2025 06:11:44 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjT1-00000002f6m-1A2L;
	Tue, 11 Feb 2025 06:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739254195; x=1770790195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ce5Ji/WXQMDkmcJjDCJf+Ub6K+lODSKEHTLEvD1ibhI=;
  b=K4EjruX8Sp/kDNehV1aaGheyaSZE23CdJRXErlXqF+zFKs3nh7TYZgaM
   CYJWHiq4ZABLCKVmcVSqYqCLNRoUCMd2YXSi8kaIHM4j/vUr6C0iNhTu8
   xyGZUK56EArW1qzC14PSOAx2i62+iFwJgjL54fDjlAiP1kWhrjZ4ndFsl
   /YYaybm2s9mYtER4js0MDX5qVLE04trYX/Mj2CcmDvVRZl8uC9J9CNBtO
   gxXV0N5HDDsIYIL99Q3mBkUP8M3NG+TWWzvRBT4FYziFv0UZjiPmZJmVy
   OdIAhOfXRjTZ0QaA+LL/xM5t0S2bIZ04i6RTta08BstFq/o1g/v8WGvPH
   A==;
X-CSE-ConnectionGUID: 5YGgGdhPQVWJ6Abd8Zx4sA==
X-CSE-MsgGUID: xrKygpMERDKHjvIcCdgq/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57271604"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="57271604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 22:09:50 -0800
X-CSE-ConnectionGUID: KjhHhETEQwW6nEdSX5vO5w==
X-CSE-MsgGUID: W7KoF7IvT3CDUO0isJnv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="117493893"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 22:09:47 -0800
Date: Tue, 11 Feb 2025 07:06:11 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	dave.stevenson@raspberrypi.com, popcornmix@gmail.com,
	mripard@kernel.org, u.kleine-koenig@baylibre.com, nathan@kernel.org,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, zzjas98@gmail.com
Subject: Re: [PATCH] clk: bcm: rpi: Fix potential NULL pointer dereference
Message-ID: <Z6ro06dd81bGO77a@mev-dev.igk.intel.com>
References: <20250211000917.1739835-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211000917.1739835-1-chenyuan0y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_220955_397646_1A0E4E60 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, Feb 10, 2025 at 06:09:17PM -0600, Chenyuan Yang wrote:
> The `init.name` could be NULL. Add missing check in the
> raspberrypi_clk_register().
> This is similar to commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> Besides, bcm2835_register_pll_divider() under the same directory also
> has a very similar check.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>  	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
>  				   "fw-clk-%s",
>  				   rpi_firmware_clk_names[id]);
> +	if (!init.name)
> +		return ERR_PTR(-ENOMEM);
>  	init.ops = &raspberrypi_firmware_clk_ops;
>  	init.flags = CLK_GET_RATE_NOCACHE;

Thanks for the fix. There is a need for a fixes tag in case like that.
Please add it in commit message. Take a look here for example [1].

[1] https://lore.kernel.org/netdev/DM3PR11MB8736BC7EF3A66720427F3775ECF22@DM3PR11MB8736.namprd11.prod.outlook.com/T/#mbc8028620ecffb2f3a23c96130fe03708e679b25

Beside that:
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

>  
> -- 
> 2.34.1


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC04CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxDYFL2dsLW85vwar9FFYeqE0u0LrxjreO0X7QBjS9A=; b=Py7X3Zg28r4GiLREg9VLMLBkq5
	j8dTUP//OH6NlPDjf6TrvRqary0zNlxcpyplVt1y9bHhf+7nRe3Wp641VyAcNsJE5RGjK+QtN8XDW
	Co7yA9Qew2AWjvCIglQ3wze+olhP6Q6bwSg7EKDCK4uRWLvZ6HI7aTwQLCoGx5M9RJn3rSSdaYP80
	UgZJ79a/VJcsd6CyCsRBB6BnURBG8bWgXRMSFV4YP12Og1RQ9AngvD946riOCq8/b6XEoRxvQYQXG
	y2uXLn6RIiguiW/QPlZirjBZhZVmRVhwUtEw69Sn9h6DtoIrkyofdziLpEc8WWPOgujKEMDBCVp2Q
	yuuxENug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHNK-0000000Gpei-1SsJ;
	Fri, 07 Nov 2025 07:59:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHNJ-0000000GpeU-0EVv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D68860143;
	Fri,  7 Nov 2025 07:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C259CC113D0;
	Fri,  7 Nov 2025 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502352;
	bh=HXlBUhOYIBOJ9oilCjQB+f6cehxoQEttizxFn4B+Cto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9HYsZ+Lmm9GfC3MxOV1sNLDbn4kenQ73MfZlxKJcIOTUMEYT1652SlE0hPM5aiws
	 aUqi7iyBBJbnaV3/3OHDsI0zF7X2XwRVmjLrNZdh9eNjRhhEvaYykNT3IMKbrkCew3
	 LmHUK1PGarhf+kvLN21wHGwGc2zoLEAmghvd4soPHrURl0RmJhIm+AYXIen1jTolmK
	 t0xhTz2N947fGcHxM+yHue9DvV8u7LY98eeHARZqP4fbnlEhPyDr80cPYMLwcqow+w
	 ydSP3MxnADjXtlQD+RoD07QouakaxyECnijWFoaoEGXDlwoGiwgYByBjH3G+/R4ZW6
	 YFrJizH1yXREg==
Date: Fri, 7 Nov 2025 08:59:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, louis.chauvet@bootlin.com, 
	aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
Message-ID: <20251107-sparkling-brown-bison-be7fca@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-6-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-6-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:27PM +0530, Swamil Jain wrote:
>  
>  void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
> @@ -3003,6 +3009,14 @@ int dispc_init(struct tidss_device *tidss)
>  
>  	dispc_init_errata(dispc);
>  
> +	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
> +								   "ti,clk-ctrl");
> +	if (IS_ERR(dispc->clk_ctrl)) {
> +		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
> +				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
> +		return r;

NAK. Read previous comments instead of silently ignoring them.

Best regards,
Krzysztof



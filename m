Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F883C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oon13sUUJaLBBHt33XiRqpwiqGJmBJ1ZlxXybmNciIU=; b=A+zCgiVHTPyM4s8+EHbzxoEY7P
	iZBVepOUMxjZbVf/PBN1yBLXUVFzRFrYcWJBbP5+hq2OWWPH3SYBKabkThnnOcjGDUCeJ8CPiu5yF
	zx5zlZ8ns6T7cgcG+Nk1FZHFJHQSsxsak1vgXmQiDZpBX/Uzw3dbZDAJjucoeOG47MFCwP5IosK1i
	oGeBs7NdJi7++aC022+ss5WJxoMf/oS/c8mNZeOqwzb1IoTubzduZIvtiFPplKDiPRtvy+PTFFflL
	6vhIp9wzXAKfRqzmLDI9mqpxYeoLlEU/fGvsDC48p8A7rEW7GwR8+hGAIwX3D0303l8YABE4f9YUQ
	bJafwsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14aB-00000009yN0-2lGi;
	Mon, 31 Aug 2026 16:10:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14a8-00000009yLX-1dnG;
	Mon, 31 Aug 2026 16:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788192569; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UB61ER+pWQTpRPNGrqj376Ipp16JzNa7Yl5QbjOrU5joWPdBenc6M8jUOljzwSAM7hdsTLrEp71CqWwI2HJDmbpsivHjZGXFr5fHQ1y4d6rpY/CuViXTmv4k2rDKjCggkKEV3ROaoTmKPdxtExMPwdDqeMDY3XiY5VBuOtOF030=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788192569; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oon13sUUJaLBBHt33XiRqpwiqGJmBJ1ZlxXybmNciIU=; 
	b=noQLbt0Zut2INYexDZl9j4ktLKWnABF0jGm3qs8LYBCi+LWvykYGGnPZuuu/umxaKDNN0bVqvdkpdvThLC6Ml2vTuDCwBaZRTEXGzNPQZDxaasHpmUCnWDedOqhw5wjNwZ3Voj1ETZUG2v6E8za+WbYVRYz3KsuiJUj2CqnI8zo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788192569;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=oon13sUUJaLBBHt33XiRqpwiqGJmBJ1ZlxXybmNciIU=;
	b=ZLyI6OrlH4B+wHOArIu9Tgw0HLyK6f7PMAvZY8M5qgcOJ74x0Z6Qsogu3ZlAh9NQ
	WPA0BC+S/BpLuxmC91dI9ShcSXCTI5KAdcIuEi3QpOGl0zuxA5qS2JyVKJ/awGvRZk4
	s6lmxPel6nbUKlsBfSi0YSahKYCCresQEdaz6HIM=
Received: by mx.zohomail.com with SMTPS id 1788192566656889.3740455905123;
	Mon, 31 Aug 2026 09:09:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: rockchip: propagate reset errors
Date: Mon, 31 Aug 2026 18:09:22 +0200
Message-ID: <g-bFxA6aS-CpTGGZJIq8QQ@collabora.com>
In-Reply-To: <20260830133652.7618-1-pengpeng@iscas.ac.cn>
References: <20260830133652.7618-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091000_509626_486B5B5A 
X-CRM114-Status: GOOD (  17.33  )
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

On Sunday, 30 August 2026 15:36:52 Central European Summer Time Pengpeng Hou wrote:
> rk_rng_probe() pulses the optional or required reset array before
> registering
> the hardware RNG, but discards errors from both reset operations.
> 
> Return reset failures before publishing the RNG device.
> 
> Fixes: 8eff8eb83fc0 ("hwrng: rockchip - add support for rk3588's standalone TRNG")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/char/hw_random/rockchip-rng.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/hw_random/rockchip-rng.c b/drivers/char/hw_random/rockchip-rng.c
> index 6e3ed4b856051..ff98fcdc68911 100644
> --- a/drivers/char/hw_random/rockchip-rng.c
> +++ b/drivers/char/hw_random/rockchip-rng.c
> @@ -412,9 +412,14 @@ static int rk_rng_probe(struct platform_device *pdev)
>  		if (IS_ERR(rst))
>  			return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset property\n");
>  
> -		reset_control_assert(rst);
> +		ret = reset_control_assert(rst);
> +		if (ret)
> +			return ret;
> +
>  		udelay(2);
> -		reset_control_deassert(rst);
> +		ret = reset_control_deassert(rst);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, rk_rng);
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> 

The reset controller on rockchip SoCs does not return anything other
than 0 on the assert/deassert ops, and even if it did, the probe
function should use dev_err_probe to report those failures.

In other words, this patch only adds (non-ideal) dead code.

Kind regards,
Nicolas Frattaroli




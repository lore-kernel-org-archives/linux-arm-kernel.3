Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A3FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=; b=oo3Fy1s/4HlWQWOfAE1HAjJYS6
	K57rT500fCUl0rgKBALIWD81Yw/2zOEl71VsWRLt/UeYUgyd6//ki0f+mfOiTt7HPEdq9Q1pugZlL
	96WsTAJtUaIcH8+88WnNWCQHjOcFcxRwHHKDfiCO+XNkHj0RLS1Gypn4+eh5BEDuy6dwRruxcUcNZ
	6kxo9xuz5W0ZX0PLkHmASsaKvYpBgB3u4QvFaOulFz01cbG7RkUDqfLbAqtRsD0Jtztm093i1om3W
	RvjzuuCHKogNulKSUy64rG6vEjQou5+k60uKGfl+AXr0DI/rGJ/cR6hy4gyimKI0GPcRMUGhKNzv4
	7vNzw9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1F3-0000000BToJ-2JxW;
	Thu, 20 Aug 2026 11:47:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1Ez-0000000BTmd-2AYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:47:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c167aa9500dso303942966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226441; cv=none;
        d=google.com; s=arc-20260327;
        b=EZnc2IdFxnUdO3j4sHzeVXcTvlYR9Lz9G/rCTLKon/asFDMXEFyTXHRJOz0ClKTVBB
         HLLxdPCJXm3jAWcqcCu1iN8zh2egRZkG+9Aq0ujHPhRdrcvAw+w5XR5EIObaXTE8ibWF
         ftBvAMY6RdHAQE66rzMubcOhvFnD4jr/zEcXEqChXMO2zjPfd54JEg6dYTrvGtoH517A
         gqXottBUv1+JJXNRGAMBpeDoyYjhyDB1ML8l6+HccERf8kmgx4H/X7iqYH9sDDkHnTr8
         xJLNshFfyzR7ghGIdW8lBZOgRKP1UA5LG8pZ+c6Ku2YiGrnSO6vtm+NeGKbVaHjEAPeX
         Ia2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        fh=RrxyfNQvlFnUxLWSQhpBWbWNSmLZJxU1TS8rdQ/mfvA=;
        b=jMHeVkF0QGdvG0PTr3WWafF01uz6NuUq/PinIW3jMweflUVyL5ZQqDk4YG9F4oEJyu
         WVhGT+fueNvBvzZKSjbVafPT470+JR1W7i2u5Hd2pQxAGpH/qFali9Z3OTTemL6nPCE8
         OQf9yp0QNd6XIXtgcwHL+8mhZLN0WRjJ3ncQfbSFT02Hu2+GOcDl7jzDBqT9w4q/VRQj
         l2EkX2K6wJAhx7o9SlGLJ+iYi13uS/r19y4LN5BKuya5WPdcqUQBSeX+1QhMY7ioTY9w
         KCGHoy3IX7HCfXQ+kD9EeCrrSKwFVDWGd0y2VhBDfMqcgYkm7KGUag9OD1DQQ8YjcCk/
         CiYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226441; x=1787831241; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=YJYc+iMOUOjVAr2UDoLMjNih+SQD151AtjdTGbuXuIsOQjLaQNaUgPn2OROW85s8lx
         B/wRX+PV9e0HmV0lFD2Zzwezp2o5djAyVhZB81rRR82jwMfLBRVaJuWAFeHkMqeudL0M
         o8iQTZNkc4Z+PYptL8484ZsZHKqSbIUDvKw34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226441; x=1787831241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=jJHfXXuCK6B0IpuRPNvSKFpkXgAlIydJhTrjVCEIVwp2MV0qMIj4bX2ep9ZD6+2MrD
         mm0yrxvldx13Q76OhwU2iM6B4bfJNb4nfwIEbiGo5ztE5rLHp0fdiu0vlHPJAp6BVLcC
         ygAP3q+15VZHGU7wNvUtysd+WQa1ITaRjuM8H5F3GLRcqS5PmNO/3lJfAnLKM35ujJED
         l33r/ti/nbSn4xrp6BeRbeWaQqaU1tPGU0K/bg2Sgk6YnQbyFvqfXNcI6C6mWfR9I4wi
         1buaxV/3XyfS2NQD5WOXxpTD96i4TBhM9AYv09Zv+y2lz/QkMkVwacNpmEYj290YG7DK
         29jQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2HMo+6x7dL4zWi3BdHDFQ5T1KK+D9zA2uUN0dJ2dcDwuMML6bD/pUUvBPUgAZ3No6ry6lAJLPxaVTnTZswqCB@lists.infradead.org
X-Gm-Message-State: AOJu0YxwsL8ilqdBYhAQ9PWaTQ7VF6xy70Tph/ixtnwIeMWtUFXDjgeT
	m2/2m5HaYdaORFULXTMdchMXK4w0vfRbnDnCUpLndL/s2i8vYpQyk/pxhlluwLd+FJMWU7wotDW
	NF8J3X2CrVmqm9e8+zcUFB5KeWG5gAVzC8883N/xp
X-Gm-Gg: AR+sD13m4xHGNcsdWkf1lR9cQvurW5PJoP6PHyG0XO75KH04d879zinqpN7HhT6t878
	ZFNdw31TmXsWbB5tdg/0ra1fQ7NQhexXxjRME4pksmJGh39IMS+AOPqr1IRdWN25iiiGBHwtuR0
	H3LmR5oiuKm4kjEYLoBo3UJ+zxKMcSR+auX1cT42RSuMRolikA4jl/7U6qF87A/p7wcTvM8E+Zx
	BVyz6o4HeoB5f60dCPNKHj0QYpgQA05f78yeIkOU8KTFHCGay/JD9yvhtu1jNRA/+mPfKkYvpwc
	TnQhTku+ZKDEdiEIHp4Sho4QGkvITtoATAN8Z9VwIUc=
X-Received: by 2002:a17:906:99cd:b0:c21:74ed:4608 with SMTP id
 a640c23a62f3a-c23f9750de3mr814724566b.10.1787226441540; Thu, 20 Aug 2026
 04:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-24-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-24-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:09 -0600
X-Gm-Features: AcwNN1UCnC12nuoA1x1viqpRcNtcnZpIWhvuLlHFbx5J3DwZqfYkTadrWwnjlvQ
Message-ID: <CAFLszTiExzcYKBpe5h2SorR5OJEJgRx9x1bSCdwTtw4mN0Fcfw@mail.gmail.com>
Subject: Re: [PATCH 23/25] ARM: dts: rockchip: add arm,cpu-registers-not-fw-configured
 to RV1106 timer node
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_044725_604602_2714A1F7 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:16, Vladislav Leonov <vlad@zlab.su> wrote:
>
> The firmware on RV1106 does not initialize CNTVOFF, so the virtual
> counter may have a bogus offset relative to the physical one.
>
> Add the arm,cpu-registers-not-fw-configured property to the arch timer
> node so the kernel does not trust firmware-configured timer registers
> and uses the physical timer instead of the virtual one.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index b31cdb1c19d4..12e87d25c72b 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -57,6 +57,7 @@ timer {
>                 clock-frequency = <24000000>;
>                 interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
>                              <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +               arm,cpu-registers-not-fw-configured;
>         };
>
>         xin24m: oscillator {
> --
> 2.47.3
>

I know I am using different hardware from you, but in case it is
useful, I just wanted to mention that my boot log says "cp15 timer
running at 24.00MHz (sec-phys)" both with and without this patch, and
userspace time seems unchanged either way. I am using a board powered
by USB and that power is removed on each boot.

I do have a Luckfox Pico Pi now and I will make time soon to add it to
my lab (lab.deinde.dev).

Regards,
Simon


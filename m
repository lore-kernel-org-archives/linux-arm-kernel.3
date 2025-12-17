Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF65ED65C48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Am0LHG9AFMTHY53IOE1ujfJ8n+RIbg6P8g4jzIMdmU=; b=kiJXOofj3woy+fAkQRGe+KrEt3
	1g1AmpVeW7tFhdGQn0/LiJH12Xjy52N7kGFIeKc3UM8M9wfeyssnqcCD5fiLbKerPUoZ/Dkr0kTTn
	GJ4ADwinoJ9Xrtmw8vXND2bzaTHg+KNcswQFKl5XrYaSXQvKyBkEJudKOV+UFB50IfyRuff8+u+U5
	qNOli0p+x8dH1y5pmNbN4fLNIzGoZHIiDz8JCL9KM8N8BY5VG8mFhohnCj7ZLLOJyDfpyobBnd+WA
	pdtiHw0dS9b1HkRC3R4z7bNPKHti7+4suMa+PpVQxG9a4J1VYw5k+XVnqNxxE9ZsaKV/ULFGXnrXM
	dNb63z5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrqY-00000006sWS-2cHX;
	Wed, 17 Dec 2025 13:45:42 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrqV-00000006sW6-2wJm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:45:41 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-37a34702a20so40923231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765979137; x=1766583937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Am0LHG9AFMTHY53IOE1ujfJ8n+RIbg6P8g4jzIMdmU=;
        b=SVl2JZ6MEYQ/DdzRS8v5UJ8av66YHya+T9EGDUrFVHOK0z7+hRHagBNGgpmp2RdVPV
         zAYru18q1kRCUxpUnEue2z3fnTnttLYvg7Wd1pKcyBv2NzJSbUkA9C96ZRrN3ns6daJr
         /UB+RCBgRmnha3mJlIFaeXmkxUavb6VDmSiVlOK6Mm/sfqoFnsvbsPtSoxPwA9z5HqcW
         R9lYSKc1blyYFMhvPvMZ7Sp8+RncGYQ7XTc49I99IdTIqUJiNMcu+Fw/St3j+/f8APkq
         hJTChYXGIzbT6M0B5UBpN4lDTxxgXDowxn6qx+ylp4GjhzDnokE5cjm1pJBhB2Zahkfg
         vdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979137; x=1766583937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Am0LHG9AFMTHY53IOE1ujfJ8n+RIbg6P8g4jzIMdmU=;
        b=EYmjCP6OphLufTpNcoR87GMAP8V9EJS6v8+ERC9pL6PP5tlrUXPCf1zuWBslCg7fYb
         Y/yRrdjkA5anyMrkQ6DkMf/5l2PlQzjcO7TwBvB/IRt3QQH+KAoOjhFtBiLD35s3012M
         voSFeDJcianriqFkTE66gDrbXMRZxq0mVMeWM4NR7RZs6XDSRGi1WKJ5Yo9qdolSZ7zW
         Y2D9JLQLWWyWvsqk0mI7NVWckTxwepP9wdIbhtr5mCnnmd0OvmHyX+Ct9N6Z1m/CYA4I
         4FYaZRJgGk3mQH90NA8rttuodT0vlKIVLfr6T4Bfla8aLEVfAq1bPGwRuT/y9lwr/VpC
         Zv/w==
X-Forwarded-Encrypted: i=1; AJvYcCXI6do8XPlUm2tBx3PJi9Z9/puvfUxSdzmwocifAg+EFQSKDXHOiPZ6KTqgKqPboonhbbP4yaKWJDMhaOBDArh3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw07gQOhqw7lVwgmYxImYJwx36HxBO4kDWoZGxIVavUCRJm4x51
	ZKQrWb3CWM/Rr1PzYNZTKPxWG8xT+43pgBtEdYRsIcNMa0h2oPh2WZ7kTQaF1wzUJB0tmx+DDCb
	X87OgJs530dSQE/siFUnDyXCazm73+GsFLfJjgcg47Q==
X-Gm-Gg: AY/fxX6U7Q35xnLxRQmatiFtKyspQWTArIsNeVTXHSQ+4RBVjvBhwT1LICXVFVUSg4S
	jwwwJkbPQ0m4PDnHNvNfT0H5gEQBltgkkw1T8iUnEQ3IfIsHaFbELnmq8F+yxv81sBuOM57kfTe
	uyh+lvSaoun5HT8MqYfJOCH6vXSjlfpuJ9w/ngJoFxsmNLLAjn9/Lba+yZPz36KXMwsqTV95lVG
	d/rVO8h+kWnT/9ukueZ35jd3wKtc2Tnrb6nX5API/CsEqo0YUxCoD9fSFp40Uiy78/QhpQ=
X-Google-Smtp-Source: AGHT+IE4pUbxjRyhy6TNzG/Nfd5tcjceyB6SpLIAjY9OMlINt8NVyYcF87vH5C6t0W6FjsUPLlCSHxNZJapmN0vvQKs=
X-Received: by 2002:a2e:bc12:0:b0:37b:8bee:87f6 with SMTP id
 38308e7fff4ca-37fd08c6eecmr54455011fa.38.1765979137280; Wed, 17 Dec 2025
 05:45:37 -0800 (PST)
MIME-Version: 1.0
References: <20251215212736.3321550-1-robh@kernel.org>
In-Reply-To: <20251215212736.3321550-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:45:01 +0100
X-Gm-Features: AQt7F2qrXt3fjvzfhy2YNvWmdMIJYPs4GlYbGWjBbEeh5dwzllyrWc_OzDcLLbY
Message-ID: <CAPDyKFrQ0Pm6524L15wrtAh_yyH4URWUf-hVELKsKYt=DiQ_WA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: Allow "dma-coherent"
 and "iommus" properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>, 
	Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_054540_630927_6A610769 
X-CRM114-Status: GOOD (  13.56  )
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

On Mon, 15 Dec 2025 at 22:27, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The Broadcom iProc SDHCI controller is DMA coherent and/or behind an IOMMU
> on some Broadcom SoCs, so allow the dma-coherent and iommus properties.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> index 2f63f2cdeb71..65bb2f66f8cf 100644
> --- a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> @@ -26,9 +26,14 @@ properties:
>    reg:
>      minItems: 1
>
> +  dma-coherent: true
> +
>    interrupts:
>      maxItems: 1
>
> +  iommus:
> +    maxItems: 1
> +
>    clocks:
>      maxItems: 1
>      description:
> --
> 2.51.0
>


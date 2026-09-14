Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB510C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=; b=ToWRpXlInmRa1vLGmvfXO32+yB
	j/h/qqwKiJ9HBpDtxSEB3IruGhxQOrtJgtktUb24Ck2LkdIc1CjGlU7oduZ+1yz7BQ/WaxcjvEMFE
	bxgdLeTtDA6kY2qjzOAUXtj8FUDz0e0gpIjl4lW0YsWnjLdUJulIOLEBZYZqKsFjx8sgkiZeMuYrC
	i2ag4eQgjusc3rlG7gXPbPhuGQKDOHEJ7854N/Ta+BIWAc67TJKUVveaVqGQYZiVzx9DHGnjbIZci
	liqE6ZBaLyaXrIXKFOM51+Ulo+aSmPK9Cn46iOQwdMEslJMEWov8XHhyO4/l5QTU5yMpG9LnOgiSY
	UxJO8I+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BeT-00000004TE9-21Bp;
	Mon, 14 Sep 2026 18:43:37 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BeQ-00000004TDH-2tpC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 18:43:35 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6714af30a2cso1485277d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 11:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789411413; cv=none;
        d=google.com; s=arc-20260327;
        b=dOtd+1Nm2akUzW5OaVymCxNyT6xpR5PJA61Cvxgt0SNnOArrttRNPtNeJNRX/T0MvI
         UktdpGHijkGru25Rx3vGlYddVnarUVC4vdzQTH9GrmuJaxoOj7vMoWrMf36pge8FFiOl
         ddzMLTOqQVYgiJ7221JBU8FTBm45x2yrpFfh2gZPyOSve+V783FFwWpH6KYJmrFHZAG3
         cKc7GcE48XgWdeWhZQ5lQmICYtn6fr7HzxfbO2lRcWXslSUZb35kKooE+32H/+kgCQjK
         5wKfUbCqimbf46+0Dd+QcXg2lxt6uF7ca0/w8XtQdHf3bCEVKuNNTmeh8ImbGGDSHAaf
         ciIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        fh=dSskXSTRmqRhHKhJXQdQwT4VU3EDL2eBAabZNHc+KS0=;
        b=bDUNKU1VJfmkbDvOF+KSHXzzSmOHAxRwWXduwyU/O6Q7fZjeUZHp5eSC6SjRMd2PD8
         uhrj8D5pUK5usaVFjvGoaXJHiP5FatypxIETzsWewJtNTgNpD9Y03HqpBpS+camyW2kB
         3G5yT4WknjnhwppIzcNlnuEpXJKcv+/g4Cl85/o99QPrhe5thnd8RX6wnbNrhW3nE7SJ
         yHbpB5zaE5q+PKUFlbJyGHrkp5R0Lz+knonc6kKu8kZkUxmRIadZT68KRIUXwA6p0U0W
         iM9HCcZeyv8PTqESaQzSZR0ZOwAJraYZPiiewbP7BnJH6E6YESZodgb0rfyCj6ay/paR
         jBXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789411413; x=1790016213; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=RF1ytXEOUu63SiLkkZvvliSaO9Y7wSQ/AoL4T+zFOUPg5CwqsXr0itSkQ6i2ozNEXZ
         0YtyooMQkW560IGSoq/ypWcoEAkPUDU7IHYYKChHaUleVP2RsOU/O6UKFbjl229WMhSm
         Sf0CGM/nPCYb/oh3QLHKr8kkcLmvZH9Alms/VrFbs7UO0KOluKJktjKQhz8e/bCXZBMD
         KX3B1IrLLNVUU8WNeO75IPH4BCyekafBbCGSipfDry+4k/EpxreLnNJsgK4L6p8j3kus
         zJZEmS8pSN9a0Hx7myArulGmrYiq1GvDLAKzU0kLvoI/78tc6ZHuf3WyHW235a2DkauX
         yvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411413; x=1790016213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=h9it9rKsDo6SGLRg9M9IUmBpEiqQXO98E26iQc/XHZL89SeMLju/QCRSnlDD38abKf
         FOQ/JcNf4PwJHb3mdhmCVQysOUKNkBX09yXYltiEOiKNok0CofpQCgIPVoomGgdECm2D
         80K5Z/K5gH6wPVqXgfMhS24nl4WN9xmP4IUYs6qrdYZ1KFb3UrGThFtuk3Caa1EnCZtV
         9MCN0zMKoAUghUfRKtWm159EcsJXCwGgb3Chz5OdZi+1v/UtIkUnIFL6+vbXq+8XWqK9
         2jtfEnQ+O7hPOiTRz3n8wvMDYeEFvOOi3K58vmqLJ7kVBjK1tHL7DhfM3wfWgjMjOVsH
         udcA==
X-Forwarded-Encrypted: i=1; AKwUvBwRKXMtMQuCQsZIoz+4Wn4qD1m9w3FVvwM9OIhR8gTSVFcbSYZvKAEnxBlnx01xMw6GqtxVPHtQMnckPBywQRVV@lists.infradead.org
X-Gm-Message-State: AFuF++mYXnZZRgwcGSjGAB0v/sJ00xU7KNMavM5XPyCZNut2j5H242Vy
	tb7milxXkY3lT0KWDN0IU4t/dl+5Hqq78p5jLo2ND+s64UFRAUVKMUsp9iXADygpXDP65QWeQKB
	NDPY30OgU2PTzrrqiJ6dVlFdf4hEeNS3akrMXXfDeVw==
X-Gm-Gg: AYBFou2ODZQrzXrzsMW5aaI8GlKJ/ryBiTM2Pdo/QA6N9hPXpC+dQIpc/FpA7nv9pEr
	jxwIJfTxYGd7NVXyWZuItRh8tffiRzb/3wcqXXofJfe8qtbXh+xGRZ5gKF1IXajNfnHBxDsRWAc
	pMuV8owuzQ2c/vK/03gO+nviijFA0VNjMeNtbVCnXjK9HpRU0a05pTG2VmkjluqEuqCP9HmvQ+E
	MMzcvvzSmtegkOrPMeGp5sw8G2nrOf+krbpwX1+3NmjSZmZoMAXXMrE/unH3km/c8ahmaZtQYd4
	sJxQWzkrwZI6hiRgY92rHg/knl66dOnOQQgGk0T/tR5+BaQiwvAT3AT8LyDUgQAJLCllDhGDUCW
	QzJUHw4k/s3E8jZT2DL1FX0uM
X-Received: by 2002:a05:690e:43cd:b0:671:2d01:48e3 with SMTP id
 956f58d0204a3-6714dff5dd3mr885822d50.29.1789411412494; Mon, 14 Sep 2026
 11:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 14 Sep 2026 13:43:18 -0500
X-Gm-Features: AcwNN1X6rEhWyvGZGxC5VaFgYQL-l7UNaKIM-imvsW05a09IZ7DLJYvbUNRH2HQ
Message-ID: <CAPLW+4=5KqfFxUQ5Td6PXfoKG-vdTkzYDF-sDAyODdXKSripzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_114334_748017_3D96F92F 
X-CRM114-Status: GOOD (  15.36  )
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

On Mon, Sep 14, 2026 at 11:58=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>


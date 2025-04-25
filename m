Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6596C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xtlWzmg2HNhGfo1n6j6VZxV97pQa994I7X0fglbPbg=; b=gUjnzcHukBFBWJeEl9oqjOxwbs
	H/+t0z/1Upc1BjauPdpTm32qw7xB6Sup5AHw2oaeD/WbNuySwhiWCV81JlQ2E0sS1xd8n4VJo30SC
	0T6g21yY80lPpO+ChvmWoPg1DACToCQOIniR/4jBFPfet+QWtVb3kh5k+WJDidzq3EvTmiiwiZTYx
	7+C6VYlkrgrhIFFIto0U2g1HWfnakH+V99uQotwCO5aVrIzkuz59Jio624rRLkfbGqbJoYeOPJY/p
	ZjdGa4JWOdURoMXsMRktRd0NtdoS07vvRXvJKPhAS+KUDCJStG3GtI7AIdhMRi2BdaUcdZqV1yqKu
	SvPNDTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HmE-0000000H3ba-3COd;
	Fri, 25 Apr 2025 12:03:30 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GBJ-0000000GiJr-2C5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:21:19 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e637edaa652so1479887276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745576476; x=1746181276; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xtlWzmg2HNhGfo1n6j6VZxV97pQa994I7X0fglbPbg=;
        b=Yy8ecAJStDKxr0VlSCvze6aDWRrfx/0ISPoXFkrhGZtOGY9Tx1YQO5ZjT9B+9jSioV
         qgCYxs8Ct+X/QWZG7h4yJ9spXoqT2y8nCdhQnIqBBm78dPPvQEDY1gQ6sStXXT50k1wx
         FSddQ4vxzmLB4RcQITmPGt2aW+xQO3+/Rh0al5F3JrxPBCctpKT1dPDQ3tZ3/SD4rmat
         BrP1sudhcflZ2VaUnhJr7FKxOJyygE+qc/KKXrRKSyWazwwii+gRY+rNbEVIa0E55iKJ
         l0BNmsu9o0YP7OwdmiyVJB06emBjCxKR2NXZmZ8jr8Xc+ayAZPjq3nhwMAR7/XiOUeyQ
         UERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576476; x=1746181276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xtlWzmg2HNhGfo1n6j6VZxV97pQa994I7X0fglbPbg=;
        b=l8EmtjCEzzOUUCufrmrrAFXYyEKVp8dTSHCezHY7cTygJiyTyFU1obT4hV6sB7kPNS
         T2g3bapsz9PhIzrOpQwvbrSwgb3pAVMFa3wDeQ+T9ZL0KozAt88ooPs6W1k6b3e0qeBq
         AoVnJXuincMtR/aglMxatsMYTuibGZzQ2uVTFa717COcLNAvC+6pmFsLr5BqC5Lh+R5G
         SQ1bg4dE7xbeMHtBvsPEelC7sRlX7l7p2vV8SBU523TjEFIQWYevIUOpmRg7uo2hAjmC
         YQZvHMLzz1Z2LkXLD+uEYUOlSoe/cjXHyc2QsTJhNWOcrjBCdUDNZO56GlV3bhLhq1E2
         xXlg==
X-Forwarded-Encrypted: i=1; AJvYcCVNMwUaZeYITWSGu8IjkJZm6nEH2vTr7Ef2wujqiu33xDngYdrVlPCG1geL/m4iU8paPuygtq4NYB/UefPzYNOV@lists.infradead.org
X-Gm-Message-State: AOJu0YyUrjDhxaxlPKNs+Iw4L2jhbp4B/y67i3dCOdU5vhswOY82RJBg
	wstylqdIwqXzZYhuzKoAHqNj0jbnZqTUP7gzASXDIcc1cdp0QIRc5YWOEyunkGiUJM7L0h9EhSX
	BqZGZsXxilJ/HbYKnb3lEa69rFuuM/zkx0N85Sg==
X-Gm-Gg: ASbGncu8ESDt8EPflAB37+XheCu4FC7pI0pfCwqvIJLaYSWZmXSrC9nK3TBB6Nykxfq
	3tPJ9L7RRA5arVnW9IUdRBJzfE+4WZVPRacKfVKoFA/jsTGNHi1xExtM1Heo6iSZZl7jZ5qAcmk
	6mykcHoKtKWVYe/ruqnPnDOHg=
X-Google-Smtp-Source: AGHT+IFwzWvVcQW2OIuOPuNm7S3wzxb/4DZpY2/AfSEZfPmecvdAWyRMS5KH+2afz+oKQvj6DmCUtklI/lnuHoLlgh8=
X-Received: by 2002:a05:6902:2411:b0:e6d:e8d4:681f with SMTP id
 3f1490d57ef6-e73168936fdmr2304939276.35.1745576476343; Fri, 25 Apr 2025
 03:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 12:20:40 +0200
X-Gm-Features: ATxdqUFX3-aj6uGzZ6MjZfzJuyAtiwi1E0if2kOJDDTWutgbL5RxXK5HHoQxSiU
Message-ID: <CAPDyKFpTKxA1fvppkADP=XVbU5YroczNMfYtjELK_TyGR54f2A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032117_585710_EC794452 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, 17 Apr 2025 at 09:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> For longer rationale:
> https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
> ---
>  drivers/pmdomain/arm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
> index efa139c34e08..afed10d382ad 100644
> --- a/drivers/pmdomain/arm/Kconfig
> +++ b/drivers/pmdomain/arm/Kconfig
> @@ -2,7 +2,7 @@
>  config ARM_SCMI_PERF_DOMAIN
>         tristate "SCMI performance domain driver"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCMI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCMI performance domains which can be
> @@ -14,7 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
>  config ARM_SCMI_POWER_DOMAIN
>         tristate "SCMI power domain driver"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCMI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCMI power domains which can be
> @@ -27,7 +27,7 @@ config ARM_SCMI_POWER_DOMAIN
>  config ARM_SCPI_POWER_DOMAIN
>         tristate "SCPI power domain driver"
>         depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
> -       default y
> +       default ARM_SCPI_PROTOCOL
>         select PM_GENERIC_DOMAINS if PM
>         help
>           This enables support for the SCPI power domains which can be
> --
> 2.45.2
>


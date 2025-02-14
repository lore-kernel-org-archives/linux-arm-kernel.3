Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C687C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqP9v9jg7baLiU2+93UgvbM9b74Tce3qrWwn1lgosFQ=; b=uSSQ/3wfNjvkWZZ3zHmbBppOXn
	IYN1bHLJZ/4Z2m5wNUGJbhE4iCV3bnah1MIXjzaykvPz2wnPBo0p7ivKwzP+mcDHTL/bHflr0lP/G
	sI0zHKTrwzTrNszPwgcNYJrO9ir9SPzEZD/CL0YWvgMuL7rbYv0XTnVkciYfAPDreHD32MU/dFh+0
	EF83ow13qdy/oHXNMv3niFtjHiMzHq2zxZV6cOGBKHfXOgdEaXAZZATC+xmQNfGSqXVn4C/Bw6PQi
	Z9l/+3uZJ/vv+YKKbR0D9geuIFHZ/nHk8OpoJR/rddAwQ0Qqr0dsmILIa//btRr4jwsrlbq2aqRRa
	S0YT9a9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tijIp-0000000D1Mm-2w0g;
	Fri, 14 Feb 2025 00:11:31 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tijHF-0000000D17c-3d8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 00:09:54 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e3983426f80so1232169276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739491793; x=1740096593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqP9v9jg7baLiU2+93UgvbM9b74Tce3qrWwn1lgosFQ=;
        b=tAjwRZ9GXe7+5VPApRuRdrAx3rB+meVmnQpdH/P5KI1CL6saKxCtzPIpDk8x6BOeDg
         re4wyDtiJB4zRBZGDk92VTxsRAutOhVl0kmU1QWQ5TfhznRnLIdhh9aFcETvm5WcQ5vW
         K1PHN5vOI2e9GHYXxQtRDj9KU/D+w2eSzftcL67Pa7ryINKk5z2krf4ZYrAvbu0vYwwL
         0rVDOd5LjKJpp4P8F+TOa1aYnSWnMtYMaCrDmy2ZEwUUA7D7UqqzrgA0GqSgmM6SsUZ6
         FvHmbvLGIFFvFIWbjUtr9GXAEIIq14+Qyn469K4+ags0tj7o4JTVbHE0cEY4cB1+xpoY
         TMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739491793; x=1740096593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqP9v9jg7baLiU2+93UgvbM9b74Tce3qrWwn1lgosFQ=;
        b=a/oXbFOVEoAioPw6NFHWCj0nfeXiVHS6u6PtGc/zYMBB4QyszMCgSCFkcfJCFS3Bfu
         D3VTDcW7SIB64FtThyUURbkHzHoRqjxYKcC7tD93rPV2t7ctjr7/JQjvRJKq/oe0YaI/
         xAaMrJHtOl7m4WvChjEmLHjxrq6dJMphsAgKyBahsFMfkDWL0Iym9u6SIX+gQK72EAoU
         0tkQuOCfwnIIvDmG6JSZOyAm3p3OhTHx6JLRcaLfImma0DK2Q/mhJrIq7ahjBAVg3WKn
         66uoTwgptN2SCy5cXg4YJxMkwfTlrywuszAzguzt/iIDglKfAwHxxnCDIfofVDwS54VU
         H5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYPcbHD/5Aphk/ZrKIwcAm0s1FDgx6SAnN7gSVwVrMXyhLdXxBcBMdpHexSNbADP7+rN2b1tgOVAZjiC+7ooe@lists.infradead.org
X-Gm-Message-State: AOJu0YzSfSI6meGvNHQm/TIhQE5wWnUVMJR/sG+ppFhs7ZD5IS2C09XC
	PJ0l2xKTb8qA82tY5DjcKXk9aorMZwXymZs4aF98VsFMrJ0zVjllKm7CB5O0rcKd6VHz0LCBLx9
	1dIoJde5UsPnKgX7ysWr/i/W29NLjRj9TyEhRkz3fR5qBIOAS
X-Gm-Gg: ASbGncugwCuiynd20zqvikNd+hj3wpPT/CTCg7V6Fn4qZ8wUtH7kNvAgQB8XkDDQ4WX
	HWeDjVc3v0h8L9NWm/+c9IeJcdBnWaPVCUEisCbvSDHoGNPMhPrdzqkHZ8fgf1oOJJij2LlLmhS
	+K4wUE/6d9Msq4SxPhf4eiH0K0RVMXLPQ=
X-Google-Smtp-Source: AGHT+IFd1EJtDVBHgzWdjgXFsf5jdNOMTYWQT9HHkgAZZC7VuvxH9RsRYnYxxoGtNZLN5u0QJ7cWcZkPmK0FyJYTFow=
X-Received: by 2002:a05:6902:13c6:b0:e5b:3f8e:9e65 with SMTP id
 3f1490d57ef6-e5d9f0f9e38mr9401293276.12.1739491792768; Thu, 13 Feb 2025
 16:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20250213204044.660-1-wachiturroxd150@gmail.com> <20250213204044.660-2-wachiturroxd150@gmail.com>
In-Reply-To: <20250213204044.660-2-wachiturroxd150@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 13 Feb 2025 18:09:42 -0600
X-Gm-Features: AWEUYZnCMGwjd-AHWAZ_AQIcjbuE5HV5DBnJ9ZGUM8sZFqDGixnVhaKZX3Cd9ko
Message-ID: <CAPLW+4=STm0=K8s+BTxiHWP9F_waw2H=fQ4W9_NTm7a4JcFy=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: samsung: add samsung,exynos990-spi
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_160953_901870_0A66DED1 
X-CRM114-Status: GOOD (  12.84  )
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

On Thu, Feb 13, 2025 at 2:41=E2=80=AFPM Denzeel Oliva <wachiturroxd150@gmai=
l.com> wrote:
>
> Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
> on Exynos990 SoC. This ensures proper representation of the hardware
> in the device tree.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Doc=
umentation/devicetree/bindings/spi/samsung,spi.yaml
> index 3c206a64d..1d3c95bd2 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -24,6 +24,7 @@ properties:
>            - samsung,exynos4210-spi
>            - samsung,exynos5433-spi
>            - samsung,exynos850-spi
> +          - samsung,exynos990-spi
>            - samsung,exynosautov9-spi
>            - tesla,fsd-spi
>        - items:
> --
> 2.48.1
>
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94249CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=; b=UqrrWtGNymr+ka9EF08GRh/JgZ
	qaBhI1L4dECNb1pVX+Mll2xBKNqfVTnweGIugkmMyfFVVy8hs3gO7BjuEQf8+LrXh3ZJ1Xh4jLRlF
	HkSvlV0nNiT3bynee5u9GoveStLqj7bkevZXrHIjbLd5s2Iqw+BAjv2A6yKSB4q7/1m3HJx4sdIol
	WaBwSHwI0ob/jGmxkNpYEHUwQxyPTDqUbniAV4WI+4WjQv87KyhACOqtAHw/GSHL133ZIeyuMtusa
	CFGAIwch106vdandxam9Mp4iPLk2DMhyExCnMK3cN/L7b28Y0odg5FuR72XcKX6/IwgWt8UFA10HV
	aCPHWgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFr4-00000001Xyf-2iVe;
	Wed, 07 Oct 2026 00:49:58 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFr2-00000001XyG-16wb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:49:57 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8ab3d3c5761so13422037b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 17:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334195; cv=none;
        d=google.com; s=arc-20260327;
        b=jXra26Flcnbc4oMuYJGyTEQ4Lz4N8L2nbU8iNiTQ+4Q1vELhUvcstrl0Jx99J5w83L
         Z4ti9v+p/nI2D/NK3qUnZmgCw813sBRCWUTOqgfkg6/HvRtht/aN4lQdb64DfsrT0iT8
         5rhAPT8SHjzgoj88gmoP2RgqvCKVHmFvwc99TND8Onvys3VB3YR/5Z8b/Giho7p6PxXI
         EuVI3675zyI5Aw/6ZweSrk6cavpdMi35rkXJOc1f/+VY1pYXAXB2uuxUDOg7ZHs9QduE
         UDqYXjY0FR++HPhlHo6VzUV6tcaL/lOmxbEXknC/Nfnj9sIt5QqnCJ3XwgfbRQ5YkRA9
         oRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        fh=Wteu+IoQ1hcRCRNPXrjD2oYIVevOhPGiXpaiaIX4KtM=;
        b=FI155N5cBpTDl3Dlo4eDTqpv/XATIQQfC0aKkGYbj7COWYjgdmw8ALjWKuPYPPuLYf
         qjKW7oG/qQLc9qwOh+YxvamP1zoJLdaBUBgrlJxB7skwkgICnw14cHnQ/RWq7MW+cCPV
         lc6PVhpOGqCZB1jBwnXng9T4KWHnYS0GqwF/XIuYqLYxQJIg/YGAvSql9oBv3DJ7mJNH
         190NaoE/1dClOAglKuHT83Ccrxi9/BXSsdGf6x8tXfTWVnVRoMEoPu0nWUub4OWB8uXe
         /TX0bV/J6CRxVDgi8Xxzum6HXSMfLuA6b4xP6izhyKztw97xuDRDqogvw6WWRgWusRUv
         s5GA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334195; x=1791938995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=qJKjqPFp07QPTrWrK0gProyWARJOFZrSZ7uCzzn850Wls7L7OjYueWaJbN81JNgH0L
         AWamROc6nISD6hUketCQiBPrN+lCFkPOpx5aiXWinxIeMtdVwBOXdZSEZQbYWnCDXiWV
         Z+HyhPc6phMDQCBGnNNlgE18xjUg4bUAaZTuLZXjwNxoQ1IedXO0JRkSyhj7j/RSTtuP
         5cIY7ver6N3Z6tyRX9lvS3e2Jv0OVpltWw3OOhKAmCQBD1Nke/qpiPW5k+GJHFhFmuw1
         OomSf8s/nw0LS6WrXka3PtOj4NYiQQWvg/Zm+xuLeKWhfPFjkQGyvzuqxeqJg+dgfPDn
         ms6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334195; x=1791938995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=u/czqesIr93r6ZhNbV35lHek/zpkzdvF5Siya4EfiCVoKBchvxC7Ru/wProI5PG+Pi
         pizoqeUuvdu73XTO2m13aRLUmok/WiE6ou/6EBixdQ0f/y+c1yujt7mAxA5GAIFidC4M
         aeBSF69+dpYptxpEpYlhWPqA+FYHF3JwXrDVTserrtpSyH0Rzms//GMmbE0Vl4t6Yl2H
         rj9wSqH0hU6NFbL7Nzye1/+iL5RgMyl+N8TlyRYaWUrmwCwbPRcBv5zzo26G8bpRNUpn
         8uHuz+Ycr6PJCkf9EJEMAIu3thqgqj6Idf8qDBQBWXsLKh8yiQEmCg2FELegOPm3oiTR
         KDeA==
X-Forwarded-Encrypted: i=1; AKwUvBwcKFWQW3Os6mMIjQ7/BnbtCbwQbmTKxgLd8TI9E9WC/qez1EjIwgNup8gkh2+Tq/fDHdJ4uZ/Q1pKEHAxJSAJi@lists.infradead.org
X-Gm-Message-State: AFq9FYKJOQoK8exuCiif6o4GpXz9tdfvlsEo1F6lHoE42k9v2laKV5F+
	wd0IP5+XEpPAAqAfv47yFEZ9vqQvisTKzWntSeBtLVDeaEkJJT+gvCEf/oAMbfac/YkkrDvW3ar
	jnqI+3Zp+4Yssnsn7Oehs7TZYjgZ4qD75cvmhIfL7yw==
X-Gm-Gg: AYBFou0n6tQwaFatTFV7xhWCpq3VM7k8KA/AYpNBVveD6VloHpLqOvXn3pASE4vkdYV
	owKyupyr65e5z+H8L0ohxES6jc5CNR5VhuaagXW9e/Lxucw3sbKgv/Pk7dnOKIVNHO0EUmNVhsv
	R0zxZZPpYuuVVXCiBlPuUx9+2hRIXGCH7FrA/piBEItkFvZH+7fB7gP5eEeXf2qvpjqzN3Y6wNy
	LRalUAWJY10kJOFv/lLYozs5EGBVXUcW8J+NmBojk44K2vGCl/6c4yqA85sWBgfUCvuQFdR3MhT
	j7LYlJhue4N/crJSLIjYtoO9ArHr+KNqzDvQohhLxQFMLicwHbm+svl3uG3vWLYLALhFBwp3G7M
	P58B5CyNpWXX1eOU=
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id
 00721157ae682-8b05ac458e3mr9173847b3.2.1791334194577; Tue, 06 Oct 2026
 17:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:49:41 -0500
X-Gm-Features: AclHuK9KAi2YbRrGI4BgLSa88-aMtBCudk5hm_jOIiAtHKuwiCVmb4TkmJdVAQo
Message-ID: <CAPLW+4kQ2M11VbUBkr6ktjfRGRnbdUWRuOK=ek4-3MJxSwGPAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_174956_327097_0FD31432 
X-CRM114-Status: GOOD (  18.71  )
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

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct =
device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 =3D {
> +       .initdata_base =3D ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name =3D "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 =3D {
>         .initdata_base =3D ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name =3D "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] =3D {
>                 .compatible =3D "google,gs101-acpm-ipc",
>                 .data =3D &acpm_gs101,
>         },
> +       {
> +               .compatible =3D "samsung,exynos850-acpm-ipc",
> +               .data =3D &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>


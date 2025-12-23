Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0815EE6F07B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YO5Uvts04jHxPH1E+Sg8oVaj5XxMMKC7fUH8OS5AS0=; b=m5J0YudY24jegbiZpQZUvoBRZd
	BqrEphG71kZkG35nFbkljyci94PTHoNL0C3fqnEQYat7msdkexNOxp5RStx7WHUOoXP8qhkkSaLje
	Gle+omoL1drhDbzFrdds8yXi5keHUHYa4O3LHcXx6SBxlymDXC9wA22JKKdsyG9Pemo61Fefj5B5U
	ktTslz0PGuWmOwugYHe1uUKr6DBMBioLwRtkEEJ3RXt1ImMiSJ1fHIq2ZowmxOyc4pxJWAoBuYpA9
	CcsRVcdrW9TLuy3HNGXIlnBLBtmB5z0eqWT+hV++74xxttqXL/U+rB6Eyn0nOlAQLSkUINW2tzcNy
	htADbWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6n-0000000Enim-3Cpd;
	Tue, 23 Dec 2025 09:55:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz6g-0000000Eng0-2Gu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:55:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2768094f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766483704; x=1767088504; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YO5Uvts04jHxPH1E+Sg8oVaj5XxMMKC7fUH8OS5AS0=;
        b=hBObUJEZOSS5DeA9mKHg6YDievxvc3m8igXo4WkwsftPX4benSYhZvL/R70VYyw4KM
         EDZSRr/Un4UsSCJrs73iQggYEnraKQtH+6CgwCUMmfYZ+Dl1ZCUIA6IW2K4QS0K7elvy
         TGs+5fBgWDGWX5XRyl0dWhGgXibIOZ1G2D81jAjqyl00X1WSD/dHN970Ut/iHkqKh54X
         vRcYnMfjNOBX1UNMl4fcf1XGcNz60EFRq2izjQEQUrx5jetiVNHgrGpzekA9BF0H9v6i
         hi0ZfQ4tPqn3mE5C9odWmi+Lr1E5pBiZujJ3Uy27M4noSbSlloIVQwiXlZlzzoYsYPjX
         xpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483704; x=1767088504;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YO5Uvts04jHxPH1E+Sg8oVaj5XxMMKC7fUH8OS5AS0=;
        b=AyNgS4BdQpr98bCo3YVubiN2whbARvVQDKX1UuM544uF6ABZX8Qaa8wzo+EeDlGukQ
         sbfL1SPQ0Q0t5ZXwuGrn+R5deLX/ef2OU1nLkE2lBzT+2YojQPqaWkU/GmN4IV2rTovM
         5VGjgDCcmVvDRufpoVAl0y8EdO3omjqUNKDuYljDvr8VbWclF97cOc/IE1MODyDzNhyF
         sSJpkBegKt/2ZBM8p3IF+dP2LK3WpGIXv8ESqqOzKqRMYxQ/XYO7cylWDFEXpqoqmjtA
         AVEhqqdu9K1toywT7T4NjBpyfjFWCy/gaOvSM4NPIuRzgERjTSrMJ5qzADnPrQ/CH7eO
         hc8g==
X-Forwarded-Encrypted: i=1; AJvYcCU4NT0RX9Fg/hzlSNQhFeIeGKY0gv8JcOEfhCpgrjZqXZUbbkUr0AF+qW2ylJrHs0sQOzfEeo8ucq5Wy8ocMY6I@lists.infradead.org
X-Gm-Message-State: AOJu0YxAqTEt/Op77pqGu+w89gdupTL/iOG09R/wXfUtE7ZqH85FjC9+
	VqvjL+g1YyPDsEyarwvGA8j6ii7YNcp6w52+TyOsUh3q3bb7llOJvGSwomt7WT03Zpg=
X-Gm-Gg: AY/fxX7/14mILAQ3WrUyaUrgfIbVxJy5dtmhXdd6NtRadagxfVCVXl40etElMvm++vv
	O5PKKQCSglXYB0d6HulkciJWvAf0Fc3vCH0UzFuFjr7HhDVXgYn6+Yar+72itMVvvVqkKZy8ye3
	CGQa8BFosUXY+RcdYZaTGdZN0Kc3aeABMgK1w/JCqpZhfYTWn0W9BBZafIq2ZRLdjF84/iUzKzB
	tlrBTBzBRGoTMexxS+j5ZNKEzDRqcnIgqSC8inLyiISWt7Gk7GQLvqRaRZrt5+GSElZ7icmbF2x
	8WhRmSFNpQgHy1WMA2J0my6e97mlvW1uvT5aBfIHuIi6wOcRBC6oA0m0dL4s5AtjBOmFxRw+c8j
	q2LmF2Wy/lk0dMkHuoicS2MplcfYRGKvsht7na2s0TOCo0WNQOE9v6ViRR4MIx/df+gOw7t+s0U
	5xQA8t21CdtFbFNFeG
X-Google-Smtp-Source: AGHT+IHn1GlPRf1Fniuh1RmFfsJ96HpQRvJXXzVmZFTdyuEV9fySR+khcoZkMgxQXIqdh1loSsJh8Q==
X-Received: by 2002:a05:6000:25c1:b0:430:c76b:fadd with SMTP id ffacd0b85a97d-4324e4d3f7dmr14473947f8f.28.1766483704413;
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm26479438f8f.22.2025.12.23.01.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:55:04 -0800 (PST)
Message-ID: <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Subject: Re: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 09:55:15 +0000
In-Reply-To: <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015506_645000_F42F2BFB 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> s/product_id_to_soc_id/exynos_product_id_to_name.
> Prepend exynos_ to avoid name space pollution. The method translates the
> product id to a name, rename the method to make that clear. While
> touching the code where it is called, add a blank line for readability
> purposes.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)

I'm not sure this change helps with anything, in particular as the
return value is used to assign to soc_id, but in case it gets applied:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

>=20
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/ex=
ynos-chipid.c
> index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a=
31f5b3de20f74ea 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -71,7 +71,7 @@ static const struct exynos_soc_id {
> =C2=A0	{ "EXYNOSAUTOV920", 0x0A920000 },
> =C2=A0};
> =C2=A0
> -static const char *product_id_to_soc_id(unsigned int product_id)
> +static const char *exynos_product_id_to_name(unsigned int product_id)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> @@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device=
 *pdev)
> =C2=A0						soc_info.revision);
> =C2=A0	if (!soc_dev_attr->revision)
> =C2=A0		return -ENOMEM;
> -	soc_dev_attr->soc_id =3D product_id_to_soc_id(soc_info.product_id);
> +
> +	soc_dev_attr->soc_id =3D exynos_product_id_to_name(soc_info.product_id)=
;
> =C2=A0	if (!soc_dev_attr->soc_id)
> =C2=A0		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
> =C2=A0


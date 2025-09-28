Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DEBCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tFa7WxEyG8YI7FSexEJyws9wA4xNHe5uTvi0eQ2K3I=; b=KreGYGAgmE+9cxr54DfFKzZsw2
	ZBOgc1o81btHgKymnZt24FpLF6yKs8npKm2KX84qUyz9QKiaHiFYCclB5b9G0T9OuE0a/6ZH6g/Ye
	wVTShy48/UkXuisX7jEQeY2VN5wjcT6B2RjhqivDn5v08uWk9QBGNhGOZ4VmHPr4kEw2d/qmY0BBW
	9Wr4cZXVEeSbdv3HjP6z41cDvbJN4wMwpu/zQG3wY3NsG1LIn9MKdr6hR0rn6cpqyWSkzwP8Goyof
	ktwuBbozHwX6ehKLrC8PKJU/gtgulbGdV+rdQ4T7z1WJ5xOza+R3jq5x4OoLMd9eTKl66eOvCEKqw
	qKGzMuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2j7n-0000000Du2F-05Z8;
	Sun, 28 Sep 2025 04:35:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2j7k-0000000Du1W-1KCm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 04:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39D4945B5F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 04:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1617FC116D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 04:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759034099;
	bh=x/iAMEfhFQ96nT4EsXIin8xHsP3iS1/961id7m6vOAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C3a+OCW7agSsSUJrWxa9qUULhZ0/T7cRubYvfrzrcy4VpxNK5YNUm8HtyIu/79O6W
	 F+HCAaeXuYK3Nd39x4U3v2LhI9bm0KVJRCsgz25OnqXkrdqv34ZXXIADvab9oYWdGt
	 njnmTXIoZHJJ506cs91VhvFqYp+G2CMtcmpkWgqAMM4v5lGNgmbB99YghPSXD3ArTe
	 XXD9ePVYafs2DfRwRTeZsoIP/6DhENBCS3M+J7DOL+aADV1reyWHM2Xf+8g37HsJ7v
	 jr/PH4wgK0BPYy1O+p0L3Zsi4CQZwBtE1uxv0S7kqJYb5RPQChcs9taXOgU5PcTGl8
	 npl/XZH8qc4Pw==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27eed7bdfeeso28380675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 21:34:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjpoVdocpGe9dBZDnBuyJbJaI2/KOj4xbWrRlgqy+rg+z5cS0obBIummm9OZ9+5rgS/kfqZS+0aa+5NZLcoRu4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc+Om7aDOu69wLpQokhGeBNC5LXT861mziXXtYIjGvyxA4jV2L
	/KhlpjE+YPMKK5uByU+XsTl23XEhqxyN2VOlGvfUcxTgCMC6OhEcOk8nrdHyw+YbAaHraAEOueA
	LpYZK+wxa+fE7swN2fpjOTumfHN0vPWI=
X-Google-Smtp-Source: AGHT+IEvpC+fZhKriALPhAAHYn0OG8EEAGcMYQkIgjBYmtXlINnzWABnAmfFm/NDNUhpqe9it9R7ngTXVVvTZEYqySk=
X-Received: by 2002:a17:903:298b:b0:24b:270e:56d4 with SMTP id
 d9443c01a7336-27ed6ad0684mr143987145ad.4.1759034098565; Sat, 27 Sep 2025
 21:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250928035108.10432-1-make24@iscas.ac.cn>
In-Reply-To: <20250928035108.10432-1-make24@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 28 Sep 2025 13:34:45 +0900
X-Gmail-Original-Message-ID: <CAJKOXPehQ+nsPk_JsNGCwZdfYCrdJ7c6x-mLgn-VaissiSQycw@mail.gmail.com>
X-Gm-Features: AS18NWBkJsznHwnBuF6ULH6dpVms9-ecEezN84hhkizvBeyEC7vnkdoTdHYfrOk
Message-ID: <CAJKOXPehQ+nsPk_JsNGCwZdfYCrdJ7c6x-mLgn-VaissiSQycw@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
To: Ma Ke <make24@iscas.ac.cn>
Cc: alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	peter.griffin@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_213500_403258_5EE62725 
X-CRM114-Status: GOOD (  20.60  )
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

Best regards,
Krzysztof

On Sun, 28 Sept 2025 at 12:51, Ma Ke <make24@iscas.ac.cn> wrote:
>
> In exynos_get_pmu_regmap_by_phandle(), driver_find_device_by_of_node()
> utilizes driver_find_device_by_fwnode() which internally calls
> driver_find_device() to locate the matching device.
> driver_find_device() increments the reference count of the found
> device by calling get_device(), but exynos_get_pmu_regmap_by_phandle()
> fails to call put_device() to decrement the reference count before
> returning. This results in a reference count leak of the device each
> time exynos_get_pmu_regmap_by_phandle() is executed, which may prevent
> the device from being properly released and cause a memory leak.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index a77288f49d24..ed903a2dd416 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -302,6 +302,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  {
>         struct device_node *pmu_np;
>         struct device *dev;
> +       struct regmap *regmap;
>
>         if (propname)
>                 pmu_np = of_parse_phandle(np, propname, 0);
> @@ -325,7 +326,10 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>         if (!dev)
>                 return ERR_PTR(-EPROBE_DEFER);
>
> -       return syscon_node_to_regmap(pmu_np);
> +       regmap = syscon_node_to_regmap(pmu_np);
> +       put_device(regmap);
> +
> +       return regmap;
>  }
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>
> --
> 2.17.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E4FCB615
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=; b=YKl/ir2nSGExfYxjUnlCZWiQHT
	7zvufiN7P3FNIIt6r3AktKAVWE7NeLxlRzRSttZ51bYwo0/ArscqK2S61nwB/q+94ih0q4iwRc1I+
	wkCI3wE8uzl1bIJzyf6RFq7S+Xz9+iOeVuR7LGdXxgcwjtw2poWvDlfE7Hdomzx0gCqqkl6kHhlW5
	jcVUsyJLWFJJMMj4mk1hDJzY6VyrRRkN0MaD3fz0OEmUuw2KgFUPIm0Vy4RR1uOaxlMSAZCOj6PY8
	oMUol1gAs3NgQTpz02r1ciqWhwZrCvGP8P/xVkj3hBFJ/SsovuITuz0jZQd/1U3DRs52Mv4B4Y9wV
	W+aNX0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWzT-0000000417D-2SVs;
	Fri, 06 Mar 2026 15:21:23 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWzP-0000000416Q-4278
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:21:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b9358dd7f79so507017166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772810478; cv=none;
        d=google.com; s=arc-20240605;
        b=K23BqXUua+DpzNt4qT0tMj/vyag4gvSpQV+1Q2Kv9KDZUo5FbeIL3eSFIVk1ngCCHZ
         bQqOT8j7TbVBrDv+/62SSdqgP0qY8CuONh/FP8rOlrNkUFQBQ49Th1GTroNk535D5w3s
         gE38kKyk/QFUrSp9z+NQC3ejsMG7AjG27dWqOqd1MiMzCSv9Drll9BkyGwdKoasubF/9
         aZhiHbv9VhriHHjeikrW6ftM8THcLYgz9Egf1Gj8SxOjuoZnPnL7PamrOL8A/YJqvaoL
         mBzaZKuwQcZUM/1VzDfTg7dRFFMJFBSeCyL9x8g5r2hbRBqcX+z51yKRIsH7PSdzKHTp
         cJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        fh=PgZu+AKUUTOXI8fvItj2bJHBBfRXBwAKvA14s8frv9c=;
        b=FM/MjZ8pqaI+RTXdhpi9jF99yhu2wqzuTXwNtaQjqgDeBxoFtZpNaDp/cA6yfXPgE8
         QyoOTmBsvZokVbKzEeSkRxqGz/sl/oZMpzRhZZ1kaOTAhT2pcfh6SA2TL5CbOkFEiyQ9
         7N06wQrQY0bnxZ8lokWuUA2jH/vTtN+SU5RRqGqyTr2El1hQu+4mcmaSWn2lI1XvdwJS
         ZPn2ipEYg4rTTz8mVafYvLiMKmJNoFigswuoR4/yp5XqosLfVEs+tT+2j2Q/8jcodNvD
         MxDxTkL8PkZ2hK5BONwpGRYFdD2WdHgwzDtgzrdt9xK62VGbYNXD92KmK48EfdL6BERK
         cu0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772810478; x=1773415278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        b=m5t4SSRd/JKzhcb4j+2cCi+mEbBs4+32jma7QikwwQzSphnlzi2XQ5SLWW9lGVzVpL
         mtNd+lyOT9HSWYyvMOmqbeGDZ4Xq5Hdy6nP9Zxu4QxBfjND/x5zSzLNdYzRafJMwEtSj
         z6vD7p2QOGzwhcbVq9DBFW1qGVfJDt0pKQFrBRizmrg5xpWqnkqMD5Ly0jDkAFCTkjZG
         vgAvGX/KZXy9ByrNSyupkvBCWaC/R59McOPv42sxnccI8RLjuxeShsUFXbt6JVbPK/ag
         5RQ9P2Ust6z03COWprWz9kguyUStA7Fnh7hCWR0rs/WBEpuhW2lvfZWhF3c8IhNDV4ND
         Jvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772810478; x=1773415278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVf18GuOCj4KUJQyL5+kDdyR0nQ8PeWTy0/PXRvmRP0=;
        b=JTiTEAN6EL3bBjzE1jIEXby0GVmBSbK3dwPnP9/VfKFGIbPYWS1dvhIBa8FAg1aBeW
         qWFd022Da8dZbnMHyNmfkHzzfMyGi27q6d5PEggJ/g2HN/rMGTDX3JuwiApO0Emrn+ZY
         mKIqAWWxxYXwOJOiI7lSpLkbA3jcYcTilnohvDqAuEzW1d9MKSe5iK9H4p3fw8PoNIEi
         PP6cDEwvJfdyVVbsCJQoR8IN91FE7b68aWo62ut5vRjGMCqi3PSceITis+4FyUIvTA2+
         WsQs5gUQdAHcMikOrxneQjjLy/hm7YeStX7X7h3GV8O3EPlNQIVZE+SYEvYZH2mduFld
         PPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmISshx2CD33QxZ+M5JHPmk7iW+jH7N1gLJPfV80y8Dt92q2GRPjcS6tqpDILwTDy8VIov+JmQib0obb93qsff@lists.infradead.org
X-Gm-Message-State: AOJu0YynZLEp8uz8Gd+LCzVQ2naUen4Txjwevg+/0Tk5lazBKuJU58W8
	895OoHtY0UZOV5qfgLvnUKImg64wf1tD0EKtbJr1j0IY9PKFlQJJRFpDI61yJH8/uD5GABzRx1D
	YO5doMjZtDbKWdpKC/V2PcOR7ogHrHGa2pb91N+ixKg==
X-Gm-Gg: ATEYQzwFnUP/8oZh1tnxnxQqPb/IwUUP4ZLCKgwiDrf65hT+ZtdgfRlSTloKxyfVH+M
	J2jxo2MNXphYhmjJfZgWik8sMr7F+vpeBauQGwSW0exWMM8bZwc6PbJ4ox+pvHLkJocuiYTDUP/
	6hINm0vVOAGTFRzbi+ofwYlECAmK71Oqxmi1hA2KIJ3YvvXumS+4gfYJVt0EMl4W+ac2HLmpXIn
	LDWvQvMqnfPEx3Kpqik4c+RUiPw25gncdshAp27e1/4vo90yPc1wyGcA9kgJLxr9xQ+jdCPzjU/
	KrPOV/kAQQsGi/XtucqrEBuuf/Iu20k/CKbNSN46SQ==
X-Received: by 2002:a17:906:6a0c:b0:b8e:3d49:25db with SMTP id
 a640c23a62f3a-b942e00db25mr143796466b.54.1772810477794; Fri, 06 Mar 2026
 07:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-8-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-8-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:21:06 +0000
X-Gm-Features: AaiRm53NoJSram8HquKNMruwU8Hhr-XYeKCTUDRI7ADZLhZOeyB6oV1YUnbVV6A
Message-ID: <CADrjBPqnf9YVeOgY=uSETnbcQLgi5OY2N3usPOjzJx4o0hGEPA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] pmdomain: samsung: use dev_err() instead of pr_err()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_072120_031176_D00986B8 
X-CRM114-Status: GOOD (  18.51  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> dev_err() gives us more consistent error messages, which include the
> device. Switch to using dev_err().
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 2214d9f32d59..41a232b3cdaf 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
>   */
>  struct exynos_pm_domain {
>         struct regmap *regmap;
> +       struct device *dev;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
>         u32 configuration_reg;
> @@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
>         err =3D regmap_write(pd->regmap, pd->configuration_reg, pwr);
>         if (err) {
> -               pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
> -                      domain->name, power_on ? "en" : "dis", err);
> +               dev_err(pd->dev,
> +                       "Regmap write for power domain %s %sable failed: =
%d\n",
> +                       domain->name, power_on ? "en" : "dis", err);
>                 return err;
>         }
>
> @@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>                 /* Only return timeout if no other error also occurred. *=
/
>                 err =3D -ETIMEDOUT;
>         if (err)
> -               pr_err("Power domain %s %sable failed: %d\n", domain->nam=
e,
> -                      power_on ? "en" : "dis", err);
> +               dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
> +                       domain->name, power_on ? "en" : "dis", err);
>
>         return err;
>  }
> @@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>         if (!pd)
>                 return -ENOMEM;
>
> +       pd->dev =3D dev;
> +
>         pd->pd.name =3D exynos_get_domain_name(dev, np);
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
> --
> 2.53.0.473.g4a7958ca14-goog
>


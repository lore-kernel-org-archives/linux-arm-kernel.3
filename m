Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE54C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 22:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9RUjiVyXXCN2eHfX1I53hQWCYFwzgd7w4b5P9lpT/E=; b=tPKhg3wSl8S5shg7F0c0FvqWB/
	Pj8geerqQogaY+wNiFwCF3NX+qz90NOZxLWZgO0v3TGHUUJxwDeXcOVr+BBb+ricceZKP11O1VPyR
	0PqIDQBwen8f/0U8iJgk7RCdhiKSsZcwt7sYXvuZGSc66F5MGpCQM5bcWkaY3KG+TWohuJXF92i3q
	RVxKjLAEZ9ti7SUyPitwtdEsZyowC2XLeXPTZsoDVE5UnIBaVcrxx1u3uWPRSzYUyYn5YGNkAXqTo
	uc3/5DdvGnatthkBsXb0H62RdZYEDXOTkLMWrAsI5Id7vwL9mLQMPcHBuG6YwF+EAMuw3F3ZonFqB
	bpG5RNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeY5-0000000G5fA-0DnI;
	Sun, 02 Aug 2026 22:20:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeY2-0000000G5eo-1Q7T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 22:20:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49558ce01afso11318095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709244; x=1786314044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9RUjiVyXXCN2eHfX1I53hQWCYFwzgd7w4b5P9lpT/E=;
        b=E/upWg0LpLFH56ySpywVF0fzwX+8SnACJOEOtZtMY6HnW74srfoCpw1FdokzS5N0Fg
         yo/ypxfMy9eIJ+Lz0XyitiNAEF0zrj8O6U0U362DAiKJtQZ1BRLDBdi9pGDiRXP28/NO
         JsjUmKt+7nhSTWGRolDA2TJH7rIHJTj9VBhel5ka06JpjuTviyME99gnbEtKsBGwzFoe
         GH0RKL/qQOBALYUPpdsU09ovLvY6DKyjN9hvzX40vc2YjKYlpeV3SCu0ekyV2gGYd8SY
         a3Y1+BAipbvuXpTJgZUyvdQW+kg/dIV4yu++/Gv0shN9HzB4z+aPblHjXfBqwqPb7iEo
         DOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709244; x=1786314044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9RUjiVyXXCN2eHfX1I53hQWCYFwzgd7w4b5P9lpT/E=;
        b=hB2p796oIbeoT9FBcwBOOKCLRgCzxLekrbtoX+lQcqGdBunKtTKfQTvGn87T42IZH+
         JtyVFr0VhHcz87kuvwKKmin2DmwMmy8WvC8aM+goLyjsbS4CPJ3P/rO4D5tUrDmmqSuu
         2zq8LBqv+PiX++mEFQxS1fAz7KZLbAUMHx06N+ur8vUFfFyW21RSkrhhn+gMVYPsy8Tq
         orws4eLrrBMa8KWrAk7NoRg7k1tfhEbBFwvEQmbYsRUhBj7MnibJHAVqF+hZXdDoOw8y
         YlC0UxkO45odV5CoC5loQnRf1JdxqUVCN2/3Q7+28UHGigscGEFN3mmCe1FXrW7TPZnT
         y0Pw==
X-Forwarded-Encrypted: i=1; AHgh+RryQwwWj+9sy7kQsasrcILD+g4a0/njfJ1hkFnRHitiI7nQRwjnAuFMt427siJpkYw3Jfz1FhGkI0N4r3BbNVWP@lists.infradead.org
X-Gm-Message-State: AOJu0YzHPhHdTYW5jn3AZRX81sxZ6IOM8MpJsTGs93sjYxaP9nl5Irre
	39NWcS5+PhGQzLUNUDzwRq+hIcQMXmYulR6Y/R88nB1IfhKo+TostJIO0Xhv10BBImsquxt8s8k
	1+KKA
X-Gm-Gg: AR+sD10flujAgHrEX2Q8banvF8TpRdcNH2vUN/38hN/SngugeDgqLf1H9R5SgWg4+g4
	xD+LA1O1YFJ9+Aq21TvWXEpQtX2DCzvOz+vbEVX/5gme1gzJd4E3XtAa4XhV5exYgMBjyh6pedc
	/CWa+oqUWw6f2HHAs2rj9EYclXVi3nlRlxLzaVXjaVFgSSIVjbSS17tGKepGj4uhWqDDZHxUslC
	h7Yf8LVUIFkPx8OXLr9YLOr5OUq216NGePzNj6iLNe25BOtBnMEiAL3dqPuRMZNL+9+NpK7avsk
	VvIEdTSZEuXzoN45ZgE4aRPkEBX9IWsBPJ1BA/cGclDexmwgqIcQIeUIGaswfqhmsxuvmeiN4/X
	DIFcNLyuqXNa58cP4indDOm1X4tq895GYLvZ9IUYvkcnxvTiZj/xxhxVd6BeyP1cH0KEdOjXPHv
	VHwoD30jRu0I4NhM0z8RG0haUXz5MLXP3fLA5ujPTirXP4o9wo9MIQdMDFkuEpelasAw==
X-Received: by 2002:a05:600c:564b:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-4980c675370mr125127215e9.11.1785709243887;
        Sun, 02 Aug 2026 15:20:43 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456a6besm25058203f8f.22.2026.08.02.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:20:41 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:20:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <am_CG_kR24lpos6D@monoceros>
References: <20260731050838.158825-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ll56pjw5fggcc5xl"
Content-Disposition: inline
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_152046_394414_5D00C692 
X-CRM114-Status: GOOD (  20.01  )
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


--ll56pjw5fggcc5xl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
MIME-Version: 1.0

Hello,

On Thu, Jul 30, 2026 at 10:08:38PM -0700, Eric Biggers wrote:
> diff --git a/drivers/crypto/qce/qcrypto.c b/drivers/crypto/qce/qcrypto.c
> new file mode 100644
> index 000000000000..d526902b3060
> --- /dev/null
> +++ b/drivers/crypto/qce/qcrypto.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id is
available, so don't include <linux/mod_devicetable.h> which will go away
soon.

Also I wonder why/if you need <linux/device.h> here.

> +static int qce_crypto_probe(struct platform_device *pdev)
> +{
> +	struct icc_path *mem_path;
> +
> +	mem_path = devm_of_icc_get(&pdev->dev, "memory");
> +	if (IS_ERR(mem_path))
> +		return PTR_ERR(mem_path);
> +
> +	return icc_set_bw(mem_path, 0, 0);
> +}
> +
> +static const struct of_device_id qce_crypto_of_match[] = {
> +	{ .compatible = "qcom,crypto-v5.1", },

No , before a closing } please

> +	{ .compatible = "qcom,crypto-v5.4", },
> +	{ .compatible = "qcom,qce", },
> +	{}

A single space between { and } is the most usual form, please stick to
that.

> +};
> +MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
> +
> +static struct platform_driver qce_crypto_driver = {
> +	.probe = qce_crypto_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = qce_crypto_of_match,
> +	},
> +};
> +module_platform_driver(qce_crypto_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm crypto engine stub driver");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_AUTHOR("The Linux Foundation");

Best regards
Uwe

--ll56pjw5fggcc5xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvwrUACgkQj4D7WH0S
/k67nQf+OehFcZIDtgFxkyFvQZvZvj8xuSmIv0XdUJH05uJUlrPzdkpGEIhFcanz
X8NT6EKrJBiBvrf3pUe00j0mjuhrKvSlNwD/OIOfIyKO/vqCUA7I9I7Z2rytufiF
ctDEwPQm1DhHjgqODVsHjkhxh8GL/DJRZfJI5rlD/owrDhjUVV23+9el/AnKy9Pa
rbNI92rAQ0E6Oqn6PzhUz7szbSaZwNOIHHwEDSKza6Nz2ReOBoqmNzb+wtiSV0Zw
ZU88/nUiGRYBZohrjw28Vog4+tLMFK5yqZunqMgevvJNdVSkJCt/6DSH0F5uI4py
p1VS4MphWJzPY13zmlS5FUlxowzcFQ==
=dBQw
-----END PGP SIGNATURE-----

--ll56pjw5fggcc5xl--


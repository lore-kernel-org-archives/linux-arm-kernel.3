Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CF5EC1EA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=; b=eyWuvDOlrjNM/i9Yw8+zukQwJH
	p7zAAKMWBSYvY+V19DdYyc9r5cbv5tDFmNRSPBNT+41ipaxfqq/56V7WsYPtUv1S7Q6cTu62McUpo
	KMXtMrnBVnMYBNvVkcIlIVwlCxH/UB6RLbubDNiqDb6vPte13nadHAzd8NvXI+lasLHkEAQMW8c2/
	jGn7RUC59Zxoi+Fxp1yaAQR6pPxMTYSc9f/3GXETFcbhIpF+o0Q2cGeOhJCHoPjWF7DYsnl4WWRm7
	tasihANd+/b9oeT23x4TAXE/D/Tr06jkJ6uzJgLyDNYMuI1nHqZ5BLJYVtwFK8uOSLAqw30XEUy2X
	UnOw4yKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vny7u-00000009rQI-2AtY;
	Thu, 05 Feb 2026 12:06:26 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vny7r-00000009rPu-3QVm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 12:06:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59de8155501so1129365e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 04:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770293180; cv=none;
        d=google.com; s=arc-20240605;
        b=YtN+pOTt+/H5sFDB0J+aboJchI+ytVWLcV/twzAMM9twpyLMQs7pkS8CTqoHdl7lG8
         bNH+Qy37ZzVLzMOIQLazTR9JPv8gbh7/kcm3HbIhXGVRtq+0WCsbSd2MAeDIn+MKfl7j
         uZlCHxvjcJGrpMTichjT+7fktqINa9DFjkNK5w1U02c949olb7hPIsnhM0KQMrYPoIzk
         UdNPxhwWty0WnRJhdlD1cRxL7oAAsPs0YfriIGzBvGoy2yZ2S+FByuDgfgod11yDvdlk
         HQhk9jAzNdTYj7VCCsP3YyhIgDatoWpOBJAaQnN3e/uI2k4PlCe7xapOmA5V/FvY5c6A
         9DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        fh=Q4U03EXMcpPxtGNLeEDQMbXNLNdBtmmK47RShO1+v3s=;
        b=eygBUB7oMckKKCZSRrxUtWjfqugsZkJ/sWeyhY3EfhIZue9YCdWyZyZ5U9JMybE4V/
         /+CEhJlZw9TMTltaTpY09/yS/fublZLQrpfgNTKkE5rX//cbbPOR4e3gnVnJVyPNbZ99
         FqejjlH/qERjU5/FvnPVZj4R6TgeL7YJz/pWlRxVQ1DV2iRLSsC3NkKlJU/Ea1oHcDUo
         sp/Smtw20ZmNH9lInDOc9ZYjZq3s9uTly3A84r9GqdQpRRqukxyXKkOcVupcy+mpOCGP
         +59+KEkwlc9eRjmILiazBG92mHLAoDQvyADoWELKK7dHuQE2qNAJ3oFITZlNVruuPUe1
         jorw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770293180; x=1770897980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        b=OZAmd5Lk5IUUA71AmEDyYYOpTUpLvLM2wI3XkNiazy7xju7HPJm1KIHlBn39Il3/up
         P6aeV0OSgjGufti5J4Xnjyd5KdGp9IdUrUfwb8dqpE6gycMZxdiT0OfIEePbay4eUNXl
         yPtaIs2rohCSs5Iaj+c0l31vaT74ZFLiJ7BGzXN1MaJ/ocUZsEoEKHNpOwvvmzgqVTxO
         0ywewFPQub5qvCW2S31ZgJRIimy8q96EvfQqzVgPQ+TXbrt2T99JflYG2xvXoWRJJKl8
         UcquU0oMK/MBc/fOArKKM6KOaGu5ZtVH4P/Aq0CPu7uCHfZnihwvtH9UQ8BblkkFGhSh
         t3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293180; x=1770897980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdO9CFNu6vQJNd/2WSszJmp2jWHwNCxretKor7RUNos=;
        b=vjiob2w8fKrIMFuFo604jMD+KuiOgfG8UVZ/GJaU/LxGDMsS4ihBaj8mGnEC7oIfsV
         eva844/Y0uD1JgveyXwhOU+sf8RWXgGxd3w3MrF/E6H9Q63DJqxdQj6VcjcjHyhdHnCF
         y6LUdWpWxSY2Us2b7SBvl3DX4Ct3Bi9rfhL5UJUy4NN3hGLRTRhWfrIdU7gjF9FR6Gr4
         clTodqKPs2hlKaiY8mqhslO7p99J6A9kKvwAP9o6ledk4+wwdsKQcWSFkHOydRpBotVo
         vJDwFOpIMIWtzgY3XaVkr60dAmFrSyqlHZSfcJY5hrM6ksmYHaEBD5si0HIIrUHCEOF4
         Vqmg==
X-Forwarded-Encrypted: i=1; AJvYcCWHd0jr8H2vFQSMT3R78xPKv3Ra7FYRelry+k5iaGrFC5GDq31yUs4MMHe/OMsahljaDHS2C8duYPGLbRmHMowN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VSlDAIsDZ6WVv5in8GXCpdAAzxQMvAXTCMYC2qSvTczsuHqj
	6cAoZ61gqzQraunF+xMvd+B78pJaQa0NE+ETUSlURkS9MjZtHkNE3rABjZgo9yPCZDHHqUpkMon
	G1KcK5uMW8lI27n0SVhNAsmaa8jcBp6HRjevqcZJNgQ==
X-Gm-Gg: AZuq6aL8j14vhWn9K9iIJ00IftOL8p8G8nCtGk1tZe3eNQJlXAgwGrfBA4T40oxr3TN
	L08BfqmkCP1T9Baznuj8PdKhv3WrfJyqN/Ky0Edjbix+B1KfBZjHUWKO+97EPtIMMBeyLUC99xC
	p6sXQXql6bXGraw1RnrsUy22GKAgvmdnl3wrPtNIFdAbrxLIUSJcm5kGzttB5DiMBAIxALB41mt
	B+pFnnGHGhbUHaMNu8SLr7fVVUHVMcbTy4H1nA60uI1Tq/J+84hebwg3H9JQKXyurAJqEhV
X-Received: by 2002:a05:6512:10ce:b0:59d:ea35:bc8e with SMTP id
 2adb3069b0e04-59e38c2955bmr2270537e87.24.1770293180225; Thu, 05 Feb 2026
 04:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 13:05:44 +0100
X-Gm-Features: AZwV_Qio0mUxbt1hdbXGSjmWyyPdwpqKntqpt17Vt_Fu987EJSjXGSrypfMmYU0
Message-ID: <CAPDyKFoRXaiZiZw0NmmgnJzfw3sCYi1cNAuLHUU6fyF-4gxDuA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] pmdomain: samsung: add support for Google GS101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_040623_940227_967AD8DF 
X-CRM114-Status: GOOD (  32.64  )
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

On Wed, 28 Jan 2026 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi,
>
> This series adds support for the power domains on Google GS101.
>
> There are a few differences compared to SoCs already supported by this
> driver:
> * register access does not work via plain ioremap() / readl() /
>   writel().
>   Instead, the regmap created by the PMU driver must be used (which
>   uses Arm SMCC calls under the hood).
> * DTZPC: a call needs to be made before and after power domain off/on,
>   to inform the EL3 firmware of the request.
> * power domains can and are fed by a regulator rail and therefore
>   regulator control needed be implemented.
>
> Bullet points 2 and 3 are new compared to previous versions of this
> series, and related changes are in patches 1, 2, 9, and 10. I can merge
> patch 9 (SMC call) into the gs101 patch (patch 7) if preferred, but for
> now I kept them independent to make it easier to see changes compared
> to previous versions of this series, and because patch 8 actually
> applies to not only gs101, but to many newer Exynos SoCs, and to make
> the two patches themselves easier to review and reason about.
>
> The DT update to add the new required properties on gs101 will be
> posted separately.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - drop unneeded or already merged patches
> - drop patch "pmdomain: samsung: convert to regmap_read_poll_timeout()"
>   as Marek reported issues on some platforms
> - rebase
> - DTZPC related changes
> - Link to v3: https://lore.kernel.org/r/20251016-gs101-pd-v3-0-7b30797396=
e7@linaro.org
>
> Changes in v3:
> - use additionalProperties, not unevaluatedProperties in patch 2
> - fix path in $id in patch 2 (Rob)
> - drop comment around 'select' in patch 2 (Rob)
> - collect tags
> - Link to v2: https://lore.kernel.org/r/20251009-gs101-pd-v2-0-3f4a6db2af=
39@linaro.org
>
> Changes in v2:
> - Krzysztof:
>   - move google,gs101-pmu binding into separate file
>   - mark devm_kstrdup_const() patch as fix
>   - use bool for need_early_sync_state
>   - merge patches 8 and 10 from v1 series into one patch
> - collect tags
> - Link to v1: https://lore.kernel.org/r/20251006-gs101-pd-v1-0-f0cb0c01ea=
7b@linaro.org
>
> ---
> Andr=C3=A9 Draszik (10):
>       dt-bindings: soc: google: add google,gs101-dtzpc
>       dt-bindings: power: samsung: add google,gs101-pd
>       dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separate=
 binding
>       dt-bindings: soc: google: gs101-pmu: allow power domains as childre=
n
>       pmdomain: samsung: convert to using regmap
>       pmdomain: samsung: don't hard-code offset for registers to 0 and 4
>       pmdomain: samsung: add support for google,gs101-pd
>       pmdomain: samsung: use dev_err() instead of pr_err()
>       pmdomain: samsung: implement SMC to save / restore TZ config
>       pmdomain: samsung: implement domain-supply regulator
>
>  .../devicetree/bindings/power/pd-samsung.yaml      |  29 ++-
>  .../bindings/soc/google/google,gs101-dtzpc.yaml    |  42 ++++
>  .../bindings/soc/google/google,gs101-pmu.yaml      |  97 ++++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           |  20 --
>  MAINTAINERS                                        |   2 +
>  drivers/pmdomain/samsung/exynos-pm-domains.c       | 254 +++++++++++++++=
+++---
>  6 files changed, 395 insertions(+), 49 deletions(-)
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20251001-gs101-pd-d4dc97d70a84
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

I have looked through the series and it looks good to me. I will be
awaiting a new version and to get the DT patches acked, before I
continue to apply patches.

Kind regards
Uffe


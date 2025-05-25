Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18049C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++2YpVIWSfdyU9wkP36ZaRD+uvghyqrOoMuB3yBAyQQ=; b=Kz1UkWbWDN28XJF2VCU9WR7ELZ
	X/TqWRJ56Og5kSfUp32FfBA/CJB/DdwQ+mwlB7I8Ua0BBsmI8vGOZ9XpxDTB0XykpMxHdXh2hFhXS
	cPSisleVKkWyYsNuMpC6kRcPlzPE+4MhQ4oUCCNMLpgY5MxLwFouewtbeFehmmwHwoCDWFXXr6ZtX
	s3arCndK5iCsBJKSW/80QJm8QdVXNVsWICXC5FHk11ihsu6GJwGvPr65rNTPMgK7i67OwVcDe4kEa
	MsV3A1yevenAOSMV4raTjcbC6RMclN/ml+AYksNID12D58NqiTv17zdKKFsumgAKSGmTd00eCEXoX
	AxJKQe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5PT-00000006edr-14r5;
	Sun, 25 May 2025 07:04:39 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ5NO-00000006eSI-2T1d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 07:02:31 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-400fa6b3012so1396312b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 00:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156549; x=1748761349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++2YpVIWSfdyU9wkP36ZaRD+uvghyqrOoMuB3yBAyQQ=;
        b=ITLCg3jxyRsow11n549Gx/EhZlwYpDspjj9hgYGSll2z8B/+FfQFMObXLd3mRwI/QT
         GN7F8kwe9iulmJ+BJbChhOtonr5GF7iuX4js66rdYPD+Fe34neQl6z7MhzLJN1DKq2Dt
         +uimekvp2N41VwJ0p1W33pZHp/sHhlNL63QK0xgFdko29evYuPgjO+pVx2Bg39H0ex97
         i0Xll7D0UrCGKeX04fcSorCosmoE+GQeilWlB9goedrR2Yx68JxVL669ACpYzENF+9kN
         v2tvH8z1QmokxwQ9SRcETu9+D/EZNvnjJsOt8X/OvdY6u01FXjy123n7rNf3OOHcnZCp
         Gurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156549; x=1748761349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++2YpVIWSfdyU9wkP36ZaRD+uvghyqrOoMuB3yBAyQQ=;
        b=Vys0494rkqD+cn+sHFLJw8sDYmRWI1Os1bvmeqKAdPFEQqM+b8f7aU2ysIrhxdlQUX
         W06nWHCAo7tX/Xaq3+d6olhDGqOuC+PeCvp0/GJt5kytYvjhkiEc+dH69rzT35M18fa5
         a2pH2uxHhBqsR8ja0YqRczseVm+ZTQB/PmN5G9crl+w0Ovra8p/sQ7xzXnFbjRCWj3tG
         enMltf2R1BPPC7/kC35I5PF0gibdOvZdVvSC5wp+A8W78UApQSaNniiv64QTgZ3vAd8l
         91GJmGyl/gvKaeN1pbPPNU3iqL8NLLDQO5WYJlq4IPkXM3OTyNr4qvdyFblNph4gcNhC
         bBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQX45Tk+OdX5FeHSnrem34o6OCIaLgePdBh0ZqdrpnTYJ2ZTfauhjDdu6wrV42DPnA8ks8jagdSdHNlJ7DbOiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy+vo16Q9LP+ssnO3YOlq1Gjq0317NZvbMRKWBUlBM4j5hp7RP
	3EBbszu27RD78sReVssompnvrKWxS5f0kySKHsqCgdn7k7MPBgPVS2Smix+9eSrZEsPYFOn45LW
	id+Z84FPkRgyhwPUWMORqknWypSiIpOPqYU1g4kawOw==
X-Gm-Gg: ASbGncuwaH4AY81xmd8Qq7Xv+GoNph3q3Dv8htLlVLKz20Z4DjnhF4zg88GhIeblitG
	zxq79slBzWGmyXnN9HYpgm/f3gOT7jYSyQQwO6Ik8o2IPhF3w/pz3sil0gD27KxC6V1n8MMlVUt
	CKNd142E9bC/SlYvijUZvfTohU5GRPW4ug4HwonLmUbeMpPxrQHnOLpPhN0eSSkaP3Rg==
X-Google-Smtp-Source: AGHT+IGr/xoVtnGmyX8qGFJo5xUSZHa6jevK9WgX6XTSiHo/5DgFtJ9gSQBs5D6r1l1zV6o1b9oFwpI2DMroSyKfCf4=
X-Received: by 2002:a05:6808:1b85:b0:400:d71c:ca26 with SMTP id
 5614622812f47-4063cf85609mr5281162b6e.7.1748156549522; Sun, 25 May 2025
 00:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:02:18 +0100
X-Gm-Features: AX0GCFvvZm3ZpbAlMbK7Jst1a1IiZ6IBCab2RcTFflgx7AbbvRBIsrph-OCoOqE
Message-ID: <CADrjBPqVJDBS1pYMhSy8L5sOEkA+UVKNc6N7oY9oiv_twUKt1A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_000230_629263_52AF448D 
X-CRM114-Status: GOOD (  13.23  )
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

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
> applications is used, which contains four functional blocks (at
> distinct I2C addresses):
>   * top (including GPIO & NVMEM)
>   * charger
>   * fuel gauge
>   * TCPCi
>
> This change adds the PMIC and the subnodes for the GPIO expander and
> NVMEM, and defines the NVMEM layout.
>
> The NVMEM layout is declared such that it matches downstream's
> open-coded configuration [1].
>
> Note:
> The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
> than node name, as I think that makes it easier to look at and to add
> new nodes unambiguously in the future. Its label is prefixed with 'if'
> (for interface), because there are three PMICs in total in use on
> Pixel 6 (Pro).
>
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729=
a83817/max77759_maxq.c#67 [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>


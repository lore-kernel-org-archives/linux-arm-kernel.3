Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3671EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=; b=Srkwi5YNTAZqGrO3raSJOzmOEM
	27v9j8F/lHdGqiTejLdwwqUxBEy+8Z3deJdu8iwOdyCxDy/Zk4wl7h79IJ2xQZbJL/Hh548p0BhGa
	WMJCGadjZ3nlJovpcNuAbB2m2HrawdXPv4heV84W6N8/72WO+ghjG1wp6g1OVQzuUH5v644DMOSB8
	m7KQHEs5Gh6dB/JCJv+qkbxaIZ3LNS8rUKEvtd32zjLSJ6HdcTM+TN06Q6nE9+LrVwgE7652bhA6o
	xKAysXySToRY2A7UKAvV1vd7NWRzGWugT2VqtfOMEveZoxppY0lIafSsYHV9G9Muqy290G53LGbzm
	pDWZdwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBio-0000000FnRx-0Jml;
	Tue, 07 Jul 2026 19:44:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBii-0000000FnMr-0REE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:44:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so46191385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453479; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXAH9efOzPg4B2lLG5dUDR9eI/47NWgU05Xs5LIB9Qoo6PW/v/seiXZqtiN5spNDdv
         d27s+o9ZtMbSURjknAaZ4B63RJRuZU+fTweGAmZ+9xKSCEnJV5uI7rD3H0QUWUrv/R87
         z/U+zBJ7sxJG88bPVHcdhc5xTV+v/vycPvFUaZtVV1e+ZYkNykJJSLi7k8mH2te1P2mK
         0m7pqZg1H28NHCfL7NJbEWX4gbvM2ebDMA1mdBrrzyBKOc/IHLIORrjN+51Zp1Aeewtg
         mKZfYJHxYwkzCeXoMl5Pr49vPQ4RSBfHEJvfEGHfXQ0dkoJnukCweEz5E/ClzpofI8Ms
         /wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        fh=FgR17epNc/6QdOCCX3JXSdOUOPX+MFSLyNbjf0OIPe4=;
        b=VEBgQroL/9bKVVdJqRpUTaHyyEV/uNaIr0BL6Ejx12f2JeXAp7daC07w66KMIAqlUZ
         hjAvZpsT7ji2VTP0i6wppW6pgiWtYEtM2lm0qX6UJQclIZ/YktSU5Y1b6LGA4YSaytQs
         7C9jipBnYrwrhkDF6wiM2L6Z0TAQTA7Otu8MO1dorDbPD9B1+0oOvZOwGnP8ksIhIK5N
         hTN8W8xtf6SU9JIuYijkvxkU18+xETR5GlcPamBEMKcI/tmPj0i+rfsaQrNOPOvXal0x
         ILFINk0dO5uC4xU3AlbLdcOfXm/fSpQ0rmiaBmk2eY3dxPW/15qsnGYfK/j12agJ9FLu
         mpdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453479; x=1784058279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        b=T2D0UUO83VDVSE4QeR/24xezCkfm22A8fLiEK0EwMi4c6pd03zzTGTspEYcfsUPpir
         R744gE0UvhjUtURof3k0Zw25OEHkgKLEIuj7eXghI1Gw4iSbMynW15p1xnr9VJJad6pH
         onHhGICD6teAmglB1IgNrdDJyn1q+tZf7oU581aE6bBnOqMr9C5Ob0aKqWaxhPrWNoR/
         ADALF7BHCOJ4g8p0i3qnoQFcmoAlQBIGkZ0K9GXXxKUpdaUsP34graINBLn/es0i8NGn
         59mwt27DTxAVd0dfxPTGyYaZPTVvfYJmegQEpaS6XCKkw24Iiv5wJA6tSyBWh5+F3T45
         JXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453479; x=1784058279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        b=fHhL29rQaBth5sgi2Djv4RBdCQg5ztpdwCPQh9SdYoC3WaHK5/5tsd4lcumNkUtbfF
         LZmBr/UN4gn4jgeyYXKVwNMqLTz2iW/KYIfEWnogFwnvnPaNxtpwAzRzdvP+fnOaM+++
         PASa5kdqZqR96u/NHP9aDdfnT79WEMQq3l0xbaobYfBZPTAIQTEi2G6vXWxqic6uhMV8
         Vn20N99lpzL+UpKtyn7Dp94xf3NIaCagqVpPh7A0SO6QPY51w6vbTm0NnDW65biZPdbE
         1+prH6LdgPPZX6WVZtuZoWXiM1Z0q1slJyf4k0GaiYr/mejbDbqCUlHlS4qDcXuRhFwH
         rsSg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ5JFJZD8ZH9bUaJGgpQRc8JvSeQqfKWqd8kqKNDYByApix3MjMN6uo+F8bYO78DWjaUo5KENh3ctepCRk10Wb@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJ3Lm4N0wk5Tj8buC+2JwtuZRHfzHjyHzrlq0f9P2DnRi+2vL
	8md9Uk8wJEuDYWuTL35zYXB8WrJrCZ0SRwrLBr37XIoqdf/4pgfcjk/8b7olvTDV3TDVHRVc0RQ
	BHG6XUWd1cfemaGE+2nd6BYhEVJT0XuA=
X-Gm-Gg: AfdE7clmKtjfvoWQm66dRwNZGl0hj+XEQpb3UkaMCtfdNwvLN0heoLqyPNXiefawyqt
	l1iAPTjQEcYfj0oIkHZ3I9SvtRzSxVM9GVBpdMpWe72yJdTE+POzYxN/pFRsXnNKlq9XlsU2EaS
	GcBUP8sjO4Nmfu6N64u0vTRb0uddHs32fgDkmihELpG5NrPPuV1Fo5Tdl/h9mLZyacGVvBmdzo5
	PFm8cMTiR+0SRRH8r2L/pH40JFY+rmoeHcDLB/pZczYGK7oFKHtm8i2iQeoIzvFE/9+sza9L6LA
	Aq3ZWdTczwU05yGCaH9ieRg8iQ==
X-Received: by 2002:a17:902:f645:b0:2ca:9d5a:8b6c with SMTP id
 d9443c01a7336-2ccbe3fcc82mr64122445ad.5.1783453479150; Tue, 07 Jul 2026
 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr> <20260702-add-mcu-fan-khadas-vim4-v8-8-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-8-244feee91a36@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:44:28 +0200
X-Gm-Features: AVVi8CdKrhqOEXxfOyDGizCGSCM2_7htBspGi7RIbYxEuj_pMgbN59CYzvH2GP4
Message-ID: <CAFBinCCkpgta_QfqDzye2cD46_Wad=2FO=oBcw9_zkxzQp3OAA@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124440_207965_61664E8A 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 2, 2026 at 11:57=E2=80=AFAM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


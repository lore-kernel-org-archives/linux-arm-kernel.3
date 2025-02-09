Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB928C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au6zQLeh68QVpuJTfw781W0Z1sj2OEff0MPZwPdF+qs=; b=RGsmCkrUNBaDq8l3PsWpp2oYQ/
	WMugSliq2EYPOcRQxAYNevXgqsStR8TGscjf6pLJ94csBBkVLcwVjDFNOZTdndqPefmYeO1NiEymR
	CcjFpXtD/l1zNbLYrMu8YGfgwj2cYcLU6FEtkG7dce+59GBiputFWTr/JYwa5oKmOro4GICDbhVQ3
	HVbBEmskhhmCPCGZ9eGKqbQ0yqGskAoCqFuOTN/gbrHoaPitwWEvXcabXx4I1ABSN/wlfvW32YBBy
	UqddfeOE2D7IUk3HfIkQ4LzASW00RjZbUsZmjFuIRoiLof068/t3jHPLf4LRI8de8mTy3dd3tzHIN
	OA8uHTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th50G-0000000EcqS-11Nn;
	Sun, 09 Feb 2025 10:57:32 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th4vM-0000000Eb5A-41gc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 10:52:30 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so514478366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 02:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098347; x=1739703147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au6zQLeh68QVpuJTfw781W0Z1sj2OEff0MPZwPdF+qs=;
        b=mRikxxjESBCy/ZWcrgiko2E0cnJM9KgGJPI/dcugg9Z4E0WUyipWvss4TQ7jMi3egG
         VvHtDLNsissbO0/MFt69YfD8iSXY2uAX01Rzk+59Veodg8DvZ5IE+QtMGE78o/zD7PEQ
         CythyBFEPmZC/Q326nU4bIfgxuaCuTUh0e813V+2SkYOw1h+qptDW8UhAg/dC9m8EfRb
         NtBIobACaRUiVs26aa7cL52j1jlqEY9YwWuNB3nWv0W+NDpGu7VIlQYomSRY1zeouGd5
         ocdUatKL7AiCTOrDHPtEg4wwHO9Q+n/x+r6PsSzfPfKDVTxhliozD93TUOG2UravWnfs
         xgSw==
X-Forwarded-Encrypted: i=1; AJvYcCXqhvyCwrzo/Y+rN0f8A/0LlHnjHefkrPclqCIicRVyP2Q76fiuKofbGJODAdtO4qHBe7uvmztHy+M74LXzX5aS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi4mfg/xFQKra32p2/T6OhipIa34YQn0y3IRsvvAI5GIXY35fR
	1qm1qG55g6+9HRzywI3TW0HE1kHRSaPZ45AnIe7/D0YWk84TwNpMc2N+9q+1pUU=
X-Gm-Gg: ASbGncv6oN0wvRh/oyKtkRcubGAPLs/okwSgE4VFkJJSAHnzY27yoMGAQbORDu7NVSt
	mS2f+8GpbCtm9onlK8ZN6jUgJFJZCxsAz7tP+vUWSBY8V0TTulSNOjn9KTqFE37K07FVQkV0kP1
	sc61O+JXy5wzrXqr2+UlPNeYu/4BXKzvP6ptJ05keVFWUewgoj9xKwTBOYeHZhELEckppB4+0YR
	k+FQZfUarxpTY0l6+3ZEMRPl63hH4aAQKJPSOFEsJC+FJJ0WxdfZMtyrsYec9ap0CJHrjypOH1u
	ZI7fk2dfKDZXhAb53Uhy4c3L4Q0G97Mt+9C8pU45fIAJ4Q==
X-Google-Smtp-Source: AGHT+IH+6uEpLj3rmVzeLcxIleFyihRm7gptvKfyvlLxN+Kok1Sy9hOTYMjfSWWeOdgc8eEfkRX74w==
X-Received: by 2002:a17:907:980c:b0:ab7:758c:b398 with SMTP id a640c23a62f3a-ab789ac0dacmr1046118966b.20.1739098346769;
        Sun, 09 Feb 2025 02:52:26 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a5a78369sm288145966b.136.2025.02.09.02.52.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 02:52:26 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de727f7f05so362420a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 02:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK/omRdL2bWemw28lwe69+yxQ1UFc04gHHyJoujMmIT+Yrq6DJPB9W1FDHNyZK6wK3pLkrcH+z40d3eNusg3zY@lists.infradead.org
X-Received: by 2002:a05:6402:e8a:b0:5d9:f9b8:e7e5 with SMTP id
 4fb4d7f45d1cf-5de45019c14mr12109880a12.15.1739098346131; Sun, 09 Feb 2025
 02:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20250203124747.41541-1-towinchenmi@gmail.com>
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 05:51:49 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88vu26f_c5oE+MfedOw-bvmAO_v7YYhbaEiX-p3oivYA@mail.gmail.com>
X-Gm-Features: AWEUYZkreSJI3JUypO3Y6OVLfPm7TpTxsqhTmgRkrr1SmVO3qusxGLiZ7hKNs1I
Message-ID: <CAEg-Je88vu26f_c5oE+MfedOw-bvmAO_v7YYhbaEiX-p3oivYA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_025228_996034_65C18D06 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Feb 3, 2025 at 7:51=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds performance-controller and operating-points-v2 cpufreq
> nodes for Apple A7-A11, T2 SoCs.
>
> Dependencies:
>
> - arm64: dts: apple: Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.co=
m/T
>
> - Device Tree for Apple T2 (T8012) SoC devices
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.co=
m/T
>
> Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due t=
o
> both of the series adding things to the same part of the .dts files, they=
 are
> unrelated, so keep both of additions.
>
> 1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (9):
>   arm64: dts: apple: s5l8960x: Add cpufreq nodes
>   arm64: dts: apple: t7000: Add cpufreq nodes
>   arm64: dts: apple: t7001: Add cpufreq nodes
>   arm64: dts: apple: Add cpufreq nodes for S8000/S8003
>   arm64: dts: apple: s8001: Add cpufreq nodes
>   arm64: dts: apple: t8010: Add cpufreq nodes
>   arm64: dts: apple: t8011: Add cpufreq nodes
>   arm64: dts: apple: t8012: Add cpufreq nodes
>   arm64: dts: apple: t8015: Add cpufreq nodes
>
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
>  arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
>  21 files changed, 773 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
>
>
> base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e
> --
> 2.48.1
>
>

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>

I've also CC'd in the new tree maintainer Janne so they can see this series=
.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


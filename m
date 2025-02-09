Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC02C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG9OSYVRZ3++ywrXL3F1Sigy1gOA1N63fgWGxmeELDY=; b=rteMXgZcwAAiRnlvtZYxq5G4Kk
	9hdYdFfg2l+Fe5YEP38EgNixiCRU3AKOygJi645PDL1sZi4HvzpF9sfi5Fafvs1+u8664X/oCDg3i
	qsoDboL0ntqnKVUKKes7wgJKZ/hGYPWNwzC8qEIUWQ9nPEDePHFAPa+x6fWrjW9pSL5SYw+2c5YQQ
	PjMcc27VxIRQOZhP8AO2KXZKNlMdy6FOqSBm+dBNdTQcaGXvVS8WIJeeJckuB7UFM5oKxyUSAPhvr
	PmM1EYXH2NHsop5IKDFLOW4bTIR9/IuMcTWQXbxVQymeiLXoop9PXuNgyCjy/x2q3y2s9y0j8YmHn
	oqjZcdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5ap-0000000Eka2-0DSH;
	Sun, 09 Feb 2025 11:35:19 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5II-0000000EiBj-2dQ6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 11:16:11 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa68b513abcso659850266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099768; x=1739704568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG9OSYVRZ3++ywrXL3F1Sigy1gOA1N63fgWGxmeELDY=;
        b=QND6pRqtXvfxSoKf9wsceQFBvSeEfr2nXOBgspl/akSUDPfZUAw3L9zKfITHpfscaI
         jvvpMtPotxHHiOOKZh5HmTVD2UNqF5EWuQE1iC/pFUIryj/mG+n+iwZzfAW/Xy69au4M
         Ik93uXimKvXC7PIJgiXCXmR0j2GJkPvIOJ9yG2Jz0M8H8KsuZegKMKEDwUqH00gvbX9T
         Y56dMKW57kpoCkmVSufGNGC+ktWig++f+tOjIwoPHQDWWlxViZhxJSbthheLJ7QkexI5
         uP0U7HvG4w2e5WUFBdDx1oqhm/2F3vwfWp1d+5aCk5tmUqkv0eMmH+xvinLcravXI8q4
         vxwA==
X-Forwarded-Encrypted: i=1; AJvYcCWHzrv9Bk+DXMdWv6Ev6TF1C4FrVYs9HBZE5p1M08+EPQhoLMkYDmIG9RbxPRSHM85JQxDOTy5KKsEaZMqTVgeJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIATewJEvA9F8RC/crbNQ5DDaMH9xbqBN43re7/W/f4nDEE5ey
	c+RRaty23QKJlfEL2wUUDRrm5MVYn+QQ+bLTxPv5qC4tSKdE2cQR1tyeBKefT5g=
X-Gm-Gg: ASbGncsvkBOm6KEqFt4aA15W+248cVeRKnfVmLWoYt2CG2Ca5b5+KzPT9Fpk4aUf0rk
	gYA77pVD1NSa9ZmwornDgLCrbNhThAlA6YQDL1aiAcL8UYsHPICJBnaWVvCdP486XQ0O0LT/9fQ
	eKGScrulBuEB64loe+DAg1Slkcj5BnWIMAFiBFELaBi3dSeIFEopeFWrpzM0nEtBACkREx1AzB1
	Mj90sbX9T59oyBTncYmg2i2m8/R/FqeQ5AkuTOUhAuaR0PbnH9lUAoOU0z5+NXUxSPp8qkvDZvf
	Z5OCLRXKbxeweaJCRhAenqqXGaub7cU5jOmyRmi1lbSFqg==
X-Google-Smtp-Source: AGHT+IH6piBxOPds/ZVfG5gcIpSrea9I8Idp53i9fJyk/hKk07IrBM37du/m+VL0v0xcn4mLbx8Rgg==
X-Received: by 2002:a17:907:7b9c:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-ab789c62da8mr1127617266b.35.1739099768360;
        Sun, 09 Feb 2025 03:16:08 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm47881166b.135.2025.02.09.03.16.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:16:07 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de6e26db8eso865482a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:16:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxHKbyJnWCBeWVG+601GmSRiWnPRxeullFCVl/GkdP/4tl1ov7jzhAUm0toxls2/ikyb0NiKs0iaswZQL3eNC3@lists.infradead.org
X-Received: by 2002:a05:6402:2106:b0:5dc:58ad:b8d5 with SMTP id
 4fb4d7f45d1cf-5de450028ccmr9278045a12.9.1739099767175; Sun, 09 Feb 2025
 03:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20250203121831.36053-1-towinchenmi@gmail.com>
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:15:30 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
X-Gm-Features: AWEUYZkSDgSvnihPMz58EG7aGE05QsB0MtC-oDAO7_jhkBlKmWapE15sU421zUA
Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031610_667853_CF4E3E2F 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, Feb 3, 2025 at 7:20=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11, T2 SoCs, along with the associated dt-bindings.
>
> Dependencies:
> - Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.co=
m/T
>
> - Device Tree for Apple T2 (T8012) devices.
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.co=
m/T
>
> Changes since v6:
> - Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
> under the radar this whole time...
>
> Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinch=
enmi@gmail.com/T
>
> Changes since v5:
> - Rebase the series such that splitting s8000/s8003 device trees is the
> first patch to be applied. Now this series depends on Apple A9 device
> tree being split, and the T2 SoC PMGR nodes are added in this series.
>
> Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinch=
enmi@gmail.com/T
>
> Changes since v4:
> - Use imperative mood in commit messages.
>
> Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> Changes since v3:
> - Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
> This is required for cpufreq to function correctly which will be added
> in a later series.
>
> Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinche=
nmi@gmail.com/T
>
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
>
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinche=
nmi@gmail.com/T
>
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
>
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinche=
nmi@gmail.com/T
>
> Nick Chan
> ---
>
> Nick Chan (11):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
>     compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s800-0-3: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8012: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
>
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  42 files changed, 7097 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
>
>
> base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
> --
> 2.48.1
>
>

Series looks good to me, so...

Reviewed-by: Neal Gompa <neal@gompa.dev>

I've also looped in the new Apple ARM maintainer Janne so they see the
patch set.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


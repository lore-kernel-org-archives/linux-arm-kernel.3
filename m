Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E935C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3H7l2zQeJCQ6IJMd5f13r5y864trAdM17LlrOlM0f8=; b=pfNgt/tKQJLZe4X0Fo/tBD2tHZ
	Sb/O8Ed0yHrYgeEJiH8tkpRS5BgsvJzBT4+4GwdBnjKnxxzA5w0D54t6npYZe5BCA1coA81n0tQRE
	EXmKCx4zrCUXo2VIRwRQ+S1p5x8dSGXEnh1aXUdxtvorYV/r4AH/FHDV3A5voppG4grVX2sZyLJ5C
	MmDBnxpdd6VNzSJhyzBXEjYc3AvQoDHDGIGnUTaMyDI72w2+GflQl4/si5d0qsUMngsj8ayJjPxxj
	B4xm5TSGl6ExA9bJsRhKf/5JHe586baVvdUZnGXZ2nbPgrUklxLscsOVeJdMF22TLFLX4HkjiDtoj
	+MfIivZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5da-0000000EkyK-2tPc;
	Sun, 09 Feb 2025 11:38:10 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5N6-0000000Eiuu-3AnO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 11:21:10 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so189332766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100066; x=1739704866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3H7l2zQeJCQ6IJMd5f13r5y864trAdM17LlrOlM0f8=;
        b=c9nvdGrHSpkCVIf/zameXmddbcz+CsL9AhrebWPyIZW9G8NLUPo9hqimXY9ihqKLzM
         qslZquGEt4M80/PeSYykXgI1cwnLSh/1CRjNm/Le4CXsyHWBXFG0ELGZE3vlx6BQcsB4
         Cec7bE/1FrfA5ljP1h3Ks2BOLLMVgWPS+S2OTCJGE9z+lgxRj8fgSCe4IwXqNMEVjwHY
         MfjtIXOhuo3JnmIPkjEoPn41B9NYLfDi3+0AUquvCiF/SaJTNOVDtZiWkKNkmJ7LB/wP
         96tkw43I3sWMCV4NjjvOd/8R7fMZRpcTxFX0PCbWd2aJYd5u+qVw8Vb4cDaPeUDl5Yvz
         BuoA==
X-Forwarded-Encrypted: i=1; AJvYcCVRtrgg+JJ3xCtStzTdJzqIpYMkEpMCzKSnFDsckXztKMi78v9wS4Iv/Exdw9y3LnkLeeXH2QRWPQhbbCtxFZGh@lists.infradead.org
X-Gm-Message-State: AOJu0YyBqDBJURgOtCcIS/X418a5xS58TvyHqeg8KIEeawC73msjyfk8
	EzB8NMo5oiE3ljtmBjQrW8r4zAeEOiPXrmK0uOaCYcZBr4Yg7uO0a8tKSOimWxg=
X-Gm-Gg: ASbGncs8LHTBrYmGm0+VlS0Lb8sQM0Q+4aCvyf76C3yQktc62DtfqAXmX5esYYJlTnc
	fhFmLJ2qJGZHDEJxULQB4GLavpCJ7Bg3RuduMeI1kSW3CPOyvTvTTUGEWnNU9rzmDKohawu6kqz
	V3urxnYbxtvedORWpG+/hy+xu/vrVM8K/K46jdmcd45/3qdCqS60vuP6f9aTGghEfIV7tyKQ380
	iWCsBw5P0YHvMpfRDimatFq5sPFtaLOgFd/5MRne6fBqH57t0dxXTs3mzIhDv9DzyzxwB29s3VG
	F4sPvSWgXPbp8myFG8QcT6S2ZQp2wlQp23kyCjEyF+GOyQ==
X-Google-Smtp-Source: AGHT+IHp+uFPEb0jwQq8+LyyM5vEoUHHv2JS/THbzkE4GjYyHA6xuwzCh2mc/qL+cISEq0y0duHqEQ==
X-Received: by 2002:a17:906:6a22:b0:ab7:9aa2:5043 with SMTP id a640c23a62f3a-ab79aa25288mr616751166b.46.1739100066526;
        Sun, 09 Feb 2025 03:21:06 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e701asm647347866b.120.2025.02.09.03.21.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:21:05 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so1448990a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCQ0W7reqngKwVY7zgGeK6oN6pt4xcmrIuygUOt+nXBJUiklKBj+EELxZ51lRtVmQ296puTjfi4gPMffqcrd1Q@lists.infradead.org
X-Received: by 2002:a05:6402:4615:b0:5dc:cf9b:b033 with SMTP id
 4fb4d7f45d1cf-5de44fea8aemr10414132a12.5.1739100065489; Sun, 09 Feb 2025
 03:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20250203114417.16453-1-towinchenmi@gmail.com>
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:20:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
X-Gm-Features: AWEUYZkUL7KIDLWrANT2GMLY2aCBOSjId3KzpFCyyGq6xdbnQ16cXMqe9iLjzl8
Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aun-Ali Zaidi <admin@kodeit.net>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_032108_816963_F7A7214F 
X-CRM114-Status: GOOD (  13.85  )
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

On Mon, Feb 3, 2025 at 6:45=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds device trees for the Apple T2 Security Chip found on
> some Intel Macs released after 2017. This SoC is based on Apple A10
> (T8010) SoC and, for many hardware blocks, can share the A10 compatibles.
>
> Changes since v2:
> - Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.
>
> Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinch=
enmi@gmail.com/T
>
> Changes since v1:
> - Use imperative mood in commit messages
>
> Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> [1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gm=
ail.com/T
>
> Nick Chan
>
> Cc: Aun-Ali Zaidi <admin@kodeit.net>
>
> ---
> Nick Chan (2):
>   dt-bindings: arm: apple: Add T2 devices
>   arm64: dts: apple: Add T2 devices
>
>  .../devicetree/bindings/arm/apple.yaml        |  41 ++++
>  arch/arm64/boot/dts/apple/Makefile            |  16 ++
>  arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
>  arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
>  21 files changed, 527 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


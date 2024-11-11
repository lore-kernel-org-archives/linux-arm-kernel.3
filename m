Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E848D3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoDzvlx2GyrUnpWb/9CYgrrN/oyvLRseqggCeLj7hL8=; b=40vl73xpkRJeT/L8jQGSqlrkZX
	FKU73z15yLbOseQxGZhSc7WIRn0rmndY1jb69L5r2N2tBY4V+Hk/2Yq9uTbMRW0j/9bCoOt60/hHW
	KV83C7P/6QtoOFjjjcfoCCfGFueeeppU/jUlTAyXAsqeWwcT6swt9ELhyHpnaSPnQRHqBfL80xtQU
	mPM35p12XDQBrlbLVo+2mvhf/KUlkU72UAeOKQubq4vMFhUEqsqw6yaZXnRLGAuY858dqcx1R6Tgc
	HynLLM9zmUUf8WRelJ0B8WuAxdhqFljDW13ovMu4OLDpMNHiOCKUrRwKqfw1NrmBo7KTrrrh8YtCY
	Xol4vZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXIK-00000000a26-0gKV;
	Mon, 11 Nov 2024 16:29:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXED-00000000ZMS-2Qb2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67CE3A40C3F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEEAC4CED9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731342324;
	bh=Wwua9rM/eFjlcLBoqht7hKp/jTU0DE2ZmMf2om0pkZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gwCAwIah0XWESGZkINHTyQONcGjWsr17M3Nkdxmicdt5J0LWNYRckE/6O9H1FoEQQ
	 6yEjFE0lI0CRyrZN6gcYpB7/6TZCEXy8gmbfETDhAain94qkDgrg5GvujYgSpdakdw
	 gVjfuqa9eFpHral/HyN9sRLo1PEKohks5W9ZcE9GLV99C/9d0QgF2RsrCChevk+swp
	 r8hxWHMx7giIvSb67NI1D5es0KsJA6LZI+z9MuYnxtjRKu2wrwkq9RMMYulnf3DHsz
	 iVnz8cmakjHxfSSxQT6poq1sPhUMdXrF8+sZpbneXN+zXlfAPWuw8dwpohlz7iC3MG
	 7iPO2Z7cHuDuw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e8063533b5so38449727b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 08:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzUBFy2yK1k4Kw3BCw7YqWXaAknvjIHIKQeN1rhE5nBYaskaAncwhPv9n9Kfzp/SP1b2gjDoBya7Xn6x3WHzcM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23fo4xYt5hXWBS/aKjD7tcRSUGMTF41HRVYP3WxeQC3ZHM667
	8AF+pD0hTMaXk0/GvnMrcVHScMaKl5EnDR1INJVRZXaaL6KP7VcHl2N9L+CXC55nUXwXoczZIKx
	v9qnTv0UVW8ME3hEgCy2xes0oFQ==
X-Google-Smtp-Source: AGHT+IF4kcrYPr6qGNlb61JHlqDrziPuuMKkOuCDy9aGGNeK0oSpWCmd5c+AxY1XqkIut1o43W6AINGN8ePvB0xLAJI=
X-Received: by 2002:a05:690c:690f:b0:6d3:be51:6d03 with SMTP id
 00721157ae682-6eadddbced8mr119662107b3.23.1731342323163; Mon, 11 Nov 2024
 08:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20241109094623.37518-1-linux@fw-web.de> <20241109094623.37518-2-linux@fw-web.de>
 <e534c723-6d65-433f-8ab5-1c0d424d7367@lunn.ch> <9B1A5D20-3DE5-40C1-8B2D-B1C4F53FA5F4@public-files.de>
In-Reply-To: <9B1A5D20-3DE5-40C1-8B2D-B1C4F53FA5F4@public-files.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Nov 2024 10:25:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
Message-ID: <CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNraVxXQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional failed
To: frank-w@public-files.de
Cc: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <linux@fw-web.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_082525_771340_64B387F8 
X-CRM114-Status: GOOD (  18.50  )
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

On Sun, Nov 10, 2024 at 3:25=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Am 9. November 2024 18:29:44 MEZ schrieb Andrew Lunn <andrew@lunn.ch>:
> >On Sat, Nov 09, 2024 at 10:46:19AM +0100, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>
> >> after converting the ahci-platform binding to yaml the following files
> >> reporting "'anyOf' conditional failed" on
> >>
> >> sata@540000: sata-port@0
> >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm=
64/boot/dts/marvell/armada-7040-db.dts
> >> index 1e0ab35cc686..2b5e45d2c5a6 100644
> >> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> >> @@ -214,6 +214,7 @@ &cp0_sata0 {
> >>
> >>      sata-port@1 {
> >>              phys =3D <&cp0_comphy3 1>;
> >> +            status =3D "okay";
> >>      };
> >>  };
> >
> >>
> >> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/ar=
ch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> >> index 7af949092b91..6bdc4f1e6939 100644
> >> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> >> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> >> @@ -433,11 +433,13 @@ &cp0_sata0 {
> >>      /* 7 + 12 SATA connector (J24) */
> >>      sata-port@0 {
> >>              phys =3D <&cp0_comphy2 0>;
> >> +            status =3D "okay";
> >>      };
> >>
> >>      /* M.2-2250 B-key (J39) */
> >>      sata-port@1 {
> >>              phys =3D <&cp0_comphy3 1>;
> >> +            status =3D "okay";
> >>      };
> >>  };
> >> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm6=
4/boot/dts/marvell/armada-cp11x.dtsi
> >> index 7e595ac80043..161beec0b6b0 100644
> >> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> >> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> >> @@ -347,10 +347,12 @@ CP11X_LABEL(sata0): sata@540000 {
> >>
> >>                      sata-port@0 {
> >>                              reg =3D <0>;
> >> +                            status =3D "disabled";
> >>                      };
> >
> >I don't know the yaml too well, but it is not obvious how adding a few
> >status =3D "disabled"; status =3D "okay"; fixes a "'anyOf' conditional f=
ailed".
> >
> >Maybe you can expand the explanation a bit?
> >
> >       Andrew
>
> Hi angelo,
>
> I guess the dtbs_check only checks required properties from yaml if the n=
ode is enabled.

Yes, that is exactly how it works.

Rob


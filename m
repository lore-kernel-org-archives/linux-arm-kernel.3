Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM1j74yODPhJMYhAe8Gysw58b33HB8UlPnD7jYgM3wc=; b=GrUilpLeYoQp9QD9JI7r1mpVEF
	YTLstNe5NXv3O3QoOAXx6MvLze4glp5tjnre2OMow9BjEpcrCUGFhTM5d7Ag16+GFKFqZ6kZAlAgf
	Jvs6AlK06w6c6FzsSLBtmFIBdjyss0+rri6DhCXLbIPrjVmkLZWt/KptRUtTFXKZWPnyzpeyw9k28
	pFEjwskrd9crBSKlf+oB9tItdKFvQdzvyjJRMtySo5H82LpXpC+OSbowVKDIIetYyUyo4QH2SQPee
	Fi8KA7zaHcA4HlLEVtcZbAXtgSuuALU4DsOukbizJ1yvpVP/JuprUjeDvN2z8e47+snkqVGIqCGO0
	yzAfSTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weghV-00000000IN6-39Wj;
	Tue, 30 Jun 2026 22:13:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weghU-00000000IMs-2MTW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 22:13:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D519644072
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924DA1F01562
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782857583;
	bh=HM1j74yODPhJMYhAe8Gysw58b33HB8UlPnD7jYgM3wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PJgsHN6yFCy6uM8OzJ5er++rKVozMaAHvyDqrhtYfMPCCxrpB8AXLUA6uGg+5VklC
	 9duGS1uMgl4p3p5uoQL7TK9MhvxKTa2dKSCMTkS2w2VwjlYEbiWAkQa2L67HL5VVVd
	 9uvKdyQ3g4QVOBg20tia94Xcv+JC3R0uEMn+QJKcGoYACQdi1ovvRcZqMegBGiFT4p
	 hLtNn0IurWdCmVibLCpjZx2NvYHdoGJBdwYHxHXG+WkxypEPGGiZsPFfWJoND2Kal+
	 98zSH13AxZSGRmzDL3hBFy5vxpfe1HN4oOXaZk4ptIHXrsgqLoTMTFxyer7juhoAp7
	 7YulToC5Pm34w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso3721533e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 15:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6dCBtwMTNqytSiDhJVTzzu3AvFJkng1To8hA0susdNUCSau1wPTWKdqjO6ef02F0pk09iljIZrlL1r7yLwmPt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5XQqsKri4cIZAxS5kR3KL1OidE0GYDaS8A5XH/esJKxf2djvR
	v863o/vFvvQVnaudh9bm5KCEtGy3VhyAlTDHdgHgafW2EXU48i1FBx9sOPEBtDNSBBIBKBafbvc
	JoT7cAp/CXBPvTYyERs+ooQkUNumCcd0=
X-Received: by 2002:a05:6512:1248:b0:5ae:b2cf:8204 with SMTP id
 2adb3069b0e04-5aec10a3841mr657448e87.2.1782857582274; Tue, 30 Jun 2026
 15:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-2-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-2-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:12:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
X-Gm-Features: AVVi8CcLJOfvOFl8jmVmAP_uzLY_UWoBigmB1_kTp6EN1gm7rCEox0bV8PbTeSw
Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Manikandan,

thanks for your patch!

On Tue, Jun 30, 2026 at 11:24=E2=80=AFAM Manikandan Muralidharan
<manikandan.m@microchip.com> wrote:

> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
> contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

I would expect it to follow nvmem conventions like this, notice
compatibles specific-to-general with sfdp first:

sfdp {
    /* NVMEM provided by SFDP */
    compatible =3D "jedec,sfdp", "nvmem-cells";
    label =3D "SFDP";
    read-only;
    #address-cells =3D <1>;
    #size-cells =3D <1>;

    mac0: macaddr@0x00 {
        reg =3D <0x00 0x06>;
    };
    mac1: macaddr@0x06 {
        reg =3D <0x06 0x06>;
    };
};

Your example should definitely be more elaborate like this,
just an opaque sfdp node will not suffice. Maybe a separate
example?

Yours,
Linus Walleij


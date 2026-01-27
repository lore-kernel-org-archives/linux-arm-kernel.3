Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4097D3409E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bua8c1UGrI+zgn1WqlGz/u0OQhxxrT20uGtvZM7gB4=; b=dsNsIc8KdixS9fn5wsmzKh+v9Q
	BzolflZ0Ekfo3FmBzx61PJKNaQE0RVXcWAQ91zpSDC1vXpIJ52NA2XjwujWW/7NLmXphMSjnqYbXP
	YRawkEjCm1qhQH+6F22B8Ny8UK7ghrtieN5KjCYtYRSZF8pkeOLskl/Z3twT5a/qKb6qa9t4o+9WB
	hDqgGdWAEcUyiKyPm9iMO+dsYMDgEjfV0o74veIuQaMadHVVuH6+rpxHtHjEO5da2IFk0XUQFiKMB
	k/stCTOJJeY2JaTWPd/7SaWTUq76qoxAjh68PMJfNJih0Dm97mi9A7DfjHa7d+POhxjIjLk0Hvtm2
	3fauwJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklqo-0000000Eec1-2iAy;
	Tue, 27 Jan 2026 16:23:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklql-0000000Eebd-1Zlr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0283E40336
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 16:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89EDC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769531010;
	bh=ng3TUTTTBDRy0rtbqF7smmu0BJ+VQvXZsYUzEv2KdBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MAtnJ3jr1qpG23YBtt1vwxvLAvIZV99UmbDN0DTjAoU5wISKYZa5NPO3wYUMh72S2
	 84diZyhKFsg0aUzwXDAn7RSiSeTcRMNwAP98Jew2k7fGIpYD4GDmfgGvmMmIJPyUVd
	 CCisRMeKMUQZCJyYDkf9A/U8FwlXRezaiyYNWijJPMCcDegusKfrP3a+EtWOaimFg8
	 et7oBsrOLlIvwzEYd07CHtqEHogOPopzFoXuR0UdYGlqbcUT/pWoOPAZKBWMFeattt
	 JNtDFPGmWu3/XvDTbh8HPsuidO5QNirDq9Zr6wPP6Mwvn9jVl0KXOUEeapij+h5eht
	 hFoAXGaLBUxgQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b87f00ec06aso936445466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 08:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+Z4LIeSKoNUY0oR9uv8iKSearQbe62skEg7U4D+hdriaO1MJPNrZZFjAmJY3O3CrMT/T3BfD3srMl8MtBbxW0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg3KQZvjyn2Oz7fQCbb+/3LHatXPjarD8JYwiDOgTFp5ZD/z6B
	C9V5oV3Os14YJDWi0qCGkej8fQBLWLA0uPrziyNhn7Dvd2Nw7GcZ5/Ncigo31AEqY1GHuUSBun+
	v+aqGayJoyQdCESBvSdkhBLHiYfP49A==
X-Received: by 2002:a17:907:3f22:b0:b87:4c74:b316 with SMTP id
 a640c23a62f3a-b8dab45e21emr179295566b.50.1769531009427; Tue, 27 Jan 2026
 08:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20260122165923.2316510-1-enachman@marvell.com>
 <176910484185.3007016.14688980539020105749.robh@kernel.org>
 <87a4y4lmn4.fsf@BLaptop.bootlin.com> <dc6e60ec-f460-4713-b1cc-97ceb2d344f5@bootlin.com>
 <877bt8llvn.fsf@BLaptop.bootlin.com>
In-Reply-To: <877bt8llvn.fsf@BLaptop.bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 10:23:17 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+xwk3vwS3UzT1sTMcHs6dUT49OiN0wtRiCY0k-gZ4QhA@mail.gmail.com>
X-Gm-Features: AZwV_Qg9CRzmlnHWWeVpZp3ZzH3qb4tDrMOrLR3D447WP5EbvsXYT4DgGzTNCbM
Message-ID: <CAL_Jsq+xwk3vwS3UzT1sTMcHs6dUT49OiN0wtRiCY0k-gZ4QhA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: a7k: add COM Express boards
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Elad Nachman <enachman@marvell.com>, andrew@lunn.ch, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	chris.packham@alliedtelesis.co.nz, pali@kernel.org, 
	devicetree@vger.kernel.org, mrkiko.rs@gmail.com, 
	sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_082331_601070_D8F5363D 
X-CRM114-Status: GOOD (  23.24  )
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

On Fri, Jan 23, 2026 at 3:27=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
>
> > Hi,
> >
> > On 23/01/2026 10:10, Gregory CLEMENT wrote:
> >> Hello,
> >>
> >>> On Thu, 22 Jan 2026 18:59:20 +0200, Elad Nachman wrote:
> >>>> From: Elad Nachman <enachman@marvell.com>
> >>>>
> >>>> Add support for Armada 7020 Express Type 7 CPU module board by Marve=
ll.
> >>>> Add device tree bindings for this board.
> >>>> Define this COM Express CPU module as dtsi and provide a dtsi file f=
or
> >>>> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier bo=
ard).
> >>>> Add the Falcon DB to the MAINTAINERS list
> >>>>
> >>>> Since memory is soldered on CPU module, memory node is on CPU module
> >>>> dtsi file.
> >>>>
> >>>> This Carrier board only utilizes the PCIe link, hence no special dev=
ice
> >>>> or driver support is provided by this dtsi file.
> >>>> Devise a dts file for the combined com express carrier and CPU modul=
e.
> >>>>
> >>>> The Aramda 7020 CPU COM Express board offers the following features:
> >>>>
> >>>> 1.  Armada 7020 CPU, with dual ARM A72 cores
> >>>> 2.  DDR4 memory, 8GB, on board soldered
> >>>> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
> >>>>     all are present on A7K CPU module (none on the carrier)
> >>>> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connec=
tor
> >>>> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
> >>>> 6.  On-board 512 Mbit SPI flash
> >>>> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
> >>>>     COM Express type 7 connector
> >>>> 8.  m.2 SATA connector
> >>>> 9.  Micro-SD card connector
> >>>> 10. USB 2.0 via COM Express type 7 connector
> >>>> 11. Two i2c interfaces - one to the CPU module, and one to the
> >>>>     carrier board via the COM Express type 7 connector
> >>>> 12. UART (mini USB connector by virtue of FT2232D UART to USB
> >>>>     converter, connected to the Armada 7020 UART0)
> >>>>
> >
> >  [...]

> >>
> >> Does this mean we should add 10gbase-kr to the phy-mode enum list in
> >> Documentation/devicetree/bindings/net/marvell?
> >
> > No, 10gbase-kr is legacy, one should use "10gbase-r" instead, cf commit
> >
> > e0f909bc3a24 ("net: switch to using PHY_INTERFACE_MODE_10GBASER rather =
than 10GKR")
> >
> > That should probably be documented in the bindings at some point :)
>
> Thanks, Maxime!
>
> Elad, I=E2=80=99ll amend the commit unless you have a strong reason again=
st it.

You applied the .dts, but not the binding. So now more warnings...
Please apply the binding too.

Rob


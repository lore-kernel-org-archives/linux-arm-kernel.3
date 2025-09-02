Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0FFCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUH3hKBGBMf/pIveP3QzHoZ1J0gJRqgw9aKaWY+MxPo=; b=aZvxUAdBY9yL53sgGqYeRidP8T
	uo3Z2OVmSQg4USD0uOARmzTLNSRS3lrnEVkvFZrMlMiIIov2FRHOFnAzGTYLI1iO5oIiL63ykHMCw
	pkznSgA09zZInTIV56nE0kxkEEvXmbrpLv18Appv4YWzXc/xL/CsUw1BDs5YHW0zjq6SmMWR34ear
	LnjMLDywoVzqCrO4HPMwJWYwBzp0pnMiDru6scGXxou06VlbCXlcPrSyiIGqjwTxHWMq6gxF9ARpR
	4C6bf8X5tQ7YkXId7axH43ERbnXFAjB5rPxobvsevRcMBe6pmTcVNJAHeddv5i7kdnXXb66Th8VB6
	hwDFQUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQBi-0000000HK65-2dfG;
	Tue, 02 Sep 2025 12:32:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utOK8-0000000GhGL-3LIU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:33:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3cf48bde952so3586793f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756809191; x=1757413991; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nUH3hKBGBMf/pIveP3QzHoZ1J0gJRqgw9aKaWY+MxPo=;
        b=YN3Z8ahpd0Uee96TwBAyX4CwVLjegXxB0v89pWgv204i+K+kOSbMkyWQPCjn7n5MMo
         M3WHVAUw0WolyBQyPwl+hK7S2u8Juk+mNe7e2CyDLLaA3f4qNKq+Z4aVS/JnJRnsm3V6
         DX1TVCfbiSuJnXD80YeGovGnh6YuCsG21cHdiMaE1BNJc1rmgyYRH7Q4ZrGbnDPCbi/i
         umZJu+/JOxnRgZ4rMMcR9ZecgAMVIXU98M1mfxRf5SjZ/T9e2hBLyAHUDW/mD3KuMASa
         87cCAY1d72nYitqWEEhXnSXb+PyyBESSBZEyInLPPlHUxoyAibE+R8jr96iTWOtBsvXP
         Hx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809191; x=1757413991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUH3hKBGBMf/pIveP3QzHoZ1J0gJRqgw9aKaWY+MxPo=;
        b=RsbpEy98qWOwg/DOgbJXcsCaWRSfSTG6uy3clLtq1zOzmUSnrA3gRy4uWKq393c0sv
         sw22f+86tS/r5dnzkj1JIwQqgidGFsDvJnWa40Bu1efT4rlSQ4A26bUSvOlK/gGKYdZk
         S6tJbByo0qTRksBL9QXgJ5BifrYMxKU0FBNXfI2163qGb2DqIG+9g4666ibxiki6RC8P
         uJ3XGKPwGgngpm5TcJQCNV57Hn/deWIFG+KTBY087zS9Z7PKeCtg484RCdwggxVlV/+r
         84JQgrN84Y+883nmlYj1r/mJjzPAUcNQiEUQU/jyus+3jlkTT9pzKgxsoZjkGWbKyIMr
         XGrg==
X-Forwarded-Encrypted: i=1; AJvYcCXLlgLFkw2VklEFc43rRMztvysmWjXqsm+fweo39HsneJ29yiugYIW4pD88mGU7X8wc0ZhF0K5TJoSKYfnNUJBF@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmwINcBWrqunAqoa6OopMecDg0jote8iTYGKZ7x5eb73mpOXr
	BH5QHptw6iQ2q6PoyBBu0Eaytgh3lTZAuaokBuP9EyuI8TAzsrINLzQZ76NyX/Qn
X-Gm-Gg: ASbGnctdWcpSAfwMNNrSqvy4hyxpFL7oVwYFNDg/X9PR6fyI7L5H4vxNqpn41+uKYhB
	lEZCXdragzF2HEhB7vdofW/I7a1WsywHsGmj5MqZsa3PeuRmY0Ta7qe9DZZJP8hpgUFAA6WmAS3
	8BaZt3alhqWGDhK8TuoY6JThnVRzUjhP69OnavtfzbYE3PivL9Ca3H39ydKsatD4RgXKTnY4rQe
	tY+dFfGTLzo0dtJfPMOB4yPrJgNPdBT+iFnxp2kLUhkk/V5pmIYOZuv1iRcVSV40RFlGgjT2UJG
	ORnc7NjNzGnhoYdOgHagx/xrB7SDx5zXPZln40cLtJ5J2kCJxNaV7+7WQaYI9U8rhcv4ppfSo05
	aa3OIIWWqnm8BO57eJV0osDaXU02oS462WAxn3gr1NMAfmW83eS3F+LLE2UTyEgQdCyhVw8D9G6
	vkuKmylKSmGozXEYA=
X-Google-Smtp-Source: AGHT+IHAQoKS3kQS6aPIjL5KoMCjfW1ghSpx1C+y/3keGn9VbWBBe28FMc6gH+07RyC/PgYLdjR8DQ==
X-Received: by 2002:a05:6000:430c:b0:3d3:9b18:227e with SMTP id ffacd0b85a97d-3d39b1825a8mr8939060f8f.10.1756809190834;
        Tue, 02 Sep 2025 03:33:10 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:3f02:d36b:e22e:74c6? ([2a02:168:6806:0:3f02:d36b:e22e:74c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm10118932f8f.0.2025.09.02.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 03:33:10 -0700 (PDT)
Message-ID: <aa3f03dcb1240d43820c9b75501c092a7732b22d.camel@gmail.com>
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jan Palus <jpalus@fastmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, 	regressions@lists.linux.dev
Date: Tue, 02 Sep 2025 12:33:09 +0200
In-Reply-To: <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
		 <20250820184603.GA633069@bhelgaas>
		 <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
	 <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_033312_864712_C7DD2B7D 
X-CRM114-Status: GOOD (  13.71  )
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

On Tue, 2025-09-02 at 11:09 +0200, Klaus Kudielka wrote:
> Something like this on top of mainline - completely untested, but maybe w=
orth a try.
>=20
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/=
pci-mvebu.c
> index 755651f338..3fce4a2b63 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struc=
t platform_device *pdev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_ioremap_resource(&=
pdev->dev, &port->regs);
> =C2=A0}
> =C2=A0
> -#define DT_FLAGS_TO_TYPE(flags)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (((f=
lags) >> 24) & 0x03)
> -#define=C2=A0=C2=A0=C2=A0 DT_TYPE_IO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1
> -#define=C2=A0=C2=A0=C2=A0 DT_TYPE_MEM32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2
> =C2=A0#define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
> =C2=A0#define DT_CPUADDR_TO_ATTR(cpuaddr)=C2=A0=C2=A0 (((cpuaddr) >> 48) =
& 0xFF)
> =C2=A0
> @@ -1189,17 +1186,9 @@ static int mvebu_get_tgt_attr(struct device_node *=
np, int devfn,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -EINVAL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_of_range(&parser, &ra=
nge) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long rtype;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u32 slot =3D upper_32_bits(range.bus_addr);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtype =3D IORE=
SOURCE_IO;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtype =3D IORE=
SOURCE_MEM;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D range.flags) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tgt =3D=
 DT_CPUADDR_TO_TARGET(range.cpu_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *attr =
=3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0=
;
>=20

Following up myself. With this patch on top of 6.17.0-rc4, I do see the PCI=
 bridges for the two free slots on my Turris Omnia.
One slot is occupied by mSATA. I don't have any suitable Mini-PCIe card to =
test, though.

$ lspci
00:02.0 PCI bridge: Marvell Technology Group Ltd. 88F6820 [Armada 385] ARM =
SoC (rev 04)
00:03.0 PCI bridge: Marvell Technology Group Ltd. 88F6820 [Armada 385] ARM =
SoC (rev 04)
$ dmesg | head -5
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.17.0-rc4+ (klaus@mars) (arm-linux-gnueabihf-=
gcc (Debian 14.3.0-5) 14.3.0, GNU ld (GNU Binutils for Debian) 2.45) #10 SM=
P Tue Sep  2 11:49:13 CEST 2025
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Turris Omnia
$ dmesg | grep -i pci
[    0.015195] PCI: CLS 0 bytes, default 64
[    0.026199] mvebu-pcie soc:pcie: host bridge /soc/pcie ranges:
[    0.026224] mvebu-pcie soc:pcie:      MEM 0x00f1080000..0x00f1081fff -> =
0x0000080000
[    0.026240] mvebu-pcie soc:pcie:      MEM 0x00f1040000..0x00f1041fff -> =
0x0000040000
[    0.026253] mvebu-pcie soc:pcie:      MEM 0x00f1044000..0x00f1045fff -> =
0x0000044000
[    0.026265] mvebu-pcie soc:pcie:      MEM 0x00f1048000..0x00f1049fff -> =
0x0000048000
[    0.026278] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0100000000
[    0.026290] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0100000000
[    0.026302] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0200000000
[    0.026314] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0200000000
[    0.026326] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0300000000
[    0.026338] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0300000000
[    0.026350] mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00ffffff=
fe -> 0x0400000000
[    0.026358] mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00ffffff=
fe -> 0x0400000000
[    0.026554] mvebu-pcie soc:pcie: pcie1.0: Slot power limit 10.0W
[    0.026743] mvebu-pcie soc:pcie: pcie2.0: Slot power limit 10.0W
[    0.026955] mvebu-pcie soc:pcie: PCI host bridge to bus 0000:00
[    0.026963] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.026970] pci_bus 0000:00: root bus resource [mem 0xf1080000-0xf1081ff=
f] (bus address [0x00080000-0x00081fff])
[    0.026976] pci_bus 0000:00: root bus resource [mem 0xf1040000-0xf1041ff=
f] (bus address [0x00040000-0x00041fff])
[    0.026981] pci_bus 0000:00: root bus resource [mem 0xf1044000-0xf1045ff=
f] (bus address [0x00044000-0x00045fff])
[    0.026986] pci_bus 0000:00: root bus resource [mem 0xf1048000-0xf1049ff=
f] (bus address [0x00048000-0x00049fff])
[    0.026991] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7fffff=
f]
[    0.026995] pci_bus 0000:00: root bus resource [io  0x1000-0xeffff]
[    0.027113] pci 0000:00:02.0: [11ab:6820] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.027127] pci 0000:00:02.0: PCI bridge to [bus 00]
[    0.027134] pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
[    0.027138] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff=
]
[    0.027277] /soc/pcie/pcie@2,0: Fixed dependency cycle(s) with /soc/pcie=
/pcie@2,0/interrupt-controller
[    0.027311] pci 0000:00:03.0: [11ab:6820] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.027323] pci 0000:00:03.0: PCI bridge to [bus 00]
[    0.027329] pci 0000:00:03.0:   bridge window [io  0x0000-0x0fff]
[    0.027333] pci 0000:00:03.0:   bridge window [mem 0x00000000-0x000fffff=
]
[    0.027443] /soc/pcie/pcie@3,0: Fixed dependency cycle(s) with /soc/pcie=
/pcie@3,0/interrupt-controller
[    0.028311] PCI: bus0: Fast back to back transfers disabled
[    0.028319] pci 0000:00:02.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[    0.028327] pci 0000:00:03.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[    0.028418] PCI: bus1: Fast back to back transfers enabled
[    0.028424] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    0.028506] PCI: bus2: Fast back to back transfers enabled
[    0.028510] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[    0.028526] pci 0000:00:02.0: PCI bridge to [bus 01]
[    0.028535] pci 0000:00:03.0: PCI bridge to [bus 02]
[    0.028542] pci_bus 0000:00: resource 4 [mem 0xf1080000-0xf1081fff]
[    0.028547] pci_bus 0000:00: resource 5 [mem 0xf1040000-0xf1041fff]
[    0.028552] pci_bus 0000:00: resource 6 [mem 0xf1044000-0xf1045fff]
[    0.028556] pci_bus 0000:00: resource 7 [mem 0xf1048000-0xf1049fff]
[    0.028560] pci_bus 0000:00: resource 8 [mem 0xe0000000-0xe7ffffff]
[    0.028564] pci_bus 0000:00: resource 9 [io  0x1000-0xeffff]





Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D554C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlq3xrmJybNGHTlEg3leG0n0c2Nftdiq6DZq7VAdes8=; b=uXV9ovMI3eGXHlzmtl6LJ1bdvi
	eNX4g4BKDj2sGw6gtsGACvgrtALzTlt7qokYTxE1eBTdec6CHmHh0MNmNhYzzz4Knvos2DQIZoTWN
	DU86rb6VTNSFKX3gjX4qtq0hoYEuMKJuQ7ayaOdVykaaDe2qjKdAcKyaOjDXrp5G1xPqZIgWnONIx
	hUvg3g4qxsS/1GRuWwHMF7cNN2mrJa3EhnfIWXsO2QDhhxAbat2m3PdjKl/Qx2KY7Vwt/rHLb3GVd
	SJGzGHGeju3rvgRGqbisZXCzMGflOrAuhg+YKyeJFs+tBT4b6mAk7Y4YhJXe1JYdS6Wcb/AA46gsE
	nHZM/RZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnTT-00000000VPW-06bo;
	Fri, 17 Jan 2025 14:37:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnRT-00000000V9p-13HZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 14:35:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2164b1f05caso42822265ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 06:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737124522; x=1737729322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlq3xrmJybNGHTlEg3leG0n0c2Nftdiq6DZq7VAdes8=;
        b=RwLDZaLIj3xK/64/Z/lKRpRr4hAt1+ai2fOqXDif0R8hGIEeXA5jzBga3FE5pvAdBz
         J6uvFqAk6JFop2FYy+j4p8H87xHMyLiJAn5/FhOs/2MsQ0C+jz9uAhKAWCRCiQpZbCsK
         Rutrl2/8GLXsorcfzwVsN8KJ4VtdghlgHKgL5zmLG8Amvlq5Y0UdLJaDD9E8ToH6PsKq
         JsAua/D4tYrCtLVN0jUQbBDFrG71/s2hHW/nIORx8p6XyY+pJZGdFunBRxf2AlZjzoHi
         c8AnheJQEBZ4gxLuIVcZQeb10c6UDI9IcuB0q4fLxhNrFtsI5KsQUGLggNsibP6u4eKh
         f/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737124522; x=1737729322;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlq3xrmJybNGHTlEg3leG0n0c2Nftdiq6DZq7VAdes8=;
        b=PKTJQBZrhRgxCuIi1xgdO8CcxkaulS8ySfQcN0LU5sG8B769HrCREs3AWk4KeXA7fd
         SGPQd2RWNg/jafB/SwRuzrWRkHZ9TnZ9FGJlN19ZLoIxAKlfTAvvcjJ6yiJje+Gqu/oZ
         96gJuli/bBbUgXp8IqF7kwdtJNmTC/GmMh0XFwSN1F8sfMhBwpZqZvV/z4n99Qt/wi3E
         5Svx7k8lSAoQtyzt4QXZ+FMPL6CFupJ5evLqgndtC61kR9H8a18syvGBjq61lhlX8ytj
         qVX9Lfx0tH79Hb3EDH+VKaI1cczoPx38YzeC1nPeurJQwftdn76UNq5tgwDRwYh3JPKC
         TJzw==
X-Forwarded-Encrypted: i=1; AJvYcCUMfiS3PlJKxnKgAUdfsIbRxSCMuulMpbndJxQF5+O5FwGGhgPmjWgxjxkWZdWSe6+LNb3gv2qJAqKO23fFqoBj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ezutfUvvRa90ri3SIXuj5sC8bVTUz5lJgLOBYINoI4Y3dOSa
	nUw3gzPh1fKbfzSUkrD88uTX4030OkqK5Z4vN7eQZH5njkfJjyMTsPGdvTNeMw==
X-Gm-Gg: ASbGncsEAeey5h+Q9eKK4DqaaUwRGsUC9pvOCvnD5Isll5Xed8ZnhMr9aSBVm1nbC3R
	/6rXiYasYXqQH/WddZvdH8VgpRRlLrgTYqZ39PqJBZ7WmBe0N6TDoigICHRqJzC0ONdgunMQhfp
	T6UemFqybuD8MTYrTh46rcKrOElcQtdPNVVPLPe9NoKHI966tVApUXRZ5CZkrickDeVpkROXrw3
	4bLcL5mhxhewqbOLX0yeRp7u1F5GjqYDsM5cX1sE9f/L3xCVATbE1wQ
X-Google-Smtp-Source: AGHT+IHlB551XWZHdO9O4WS29tWteAQIvgFmi288a2C7lARMeFn9tDysn3gpdV4PSXFUwKhBO9Rkhw==
X-Received: by 2002:a17:903:2284:b0:215:ac55:fd72 with SMTP id d9443c01a7336-21c355e3500mr41887205ad.37.1737124521909;
        Fri, 17 Jan 2025 06:35:21 -0800 (PST)
Received: from ?IPv6:::1? ([2409:40f4:3042:3329:8000::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a883asm16599625ad.151.2025.01.17.06.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 06:35:21 -0800 (PST)
Date: Fri, 17 Jan 2025 20:05:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_3/7=5D_PCI=3A_dwc=3A_ep=3A_Ad?=
 =?US-ASCII?Q?d_bus=5Faddr=5Fbase_for_outbound_window?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250116224902.GA614046@bhelgaas>
References: <20250116224902.GA614046@bhelgaas>
Message-ID: <266CE37A-A50B-498F-8BE7-5D6449F72E5B@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_063523_296735_885DE98E 
X-CRM114-Status: GOOD (  29.99  )
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



On January 17, 2025 4:19:02 AM GMT+05:30, Bjorn Helgaas <helgaas@kernel=2E=
org> wrote:
>On Thu, Jan 16, 2025 at 03:02:44PM -0500, Frank Li wrote:
>> On Thu, Jan 16, 2025 at 01:45:58PM -0600, Bjorn Helgaas wrote:
>> > On Thu, Jan 16, 2025 at 01:04:16PM -0500, Frank Li wrote:
>> > > On Thu, Jan 16, 2025 at 09:32:39AM -0600, Bjorn Helgaas wrote:
>> > > > On Tue, Nov 19, 2024 at 02:44:21PM -0500, Frank Li wrote:
>> > > > >                    Endpoint
>> > > > >   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=90
>> > > > >   =E2=94=82                             pcie-ep@5f010000  =E2=
=94=82
>> > > > >   =E2=94=82                             =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   Endpoint   =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   PCIe       =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   Controller =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           bus@5f000000      =E2=94=82              =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =
=E2=94=82                =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           =E2=94=82          =E2=94=82 Outbound Tra=
nsfer     =E2=94=82=E2=94=82
>> > > > >   =E2=94=82=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90    =E2=94=82  Bus     =E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=96=BA=E2=94=82 ATU  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA
>> > > > >   =E2=94=82=E2=94=82     =E2=94=82    =E2=94=82  Fabric  =E2=94=
=82Bus   =E2=94=82                =E2=94=82=E2=94=82PCI Addr
>> > > > >   =E2=94=82=E2=94=82 CPU =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=96=BA=E2=94=82          =E2=94=82Addr  =E2=94=82                =E2=94=
=82=E2=94=820xA000_0000
>> > > > >   =E2=94=82=E2=94=82     =E2=94=82CPU =E2=94=82          =E2=94=
=820x8000_0000            =E2=94=82=E2=94=82
>> > > > >   =E2=94=82=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98Addr=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=82         =
       =E2=94=82=E2=94=82
>> > > > >   =E2=94=82       0x7000_0000           =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=E2=94=82
>> > > > >   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98
>> > > > >
>> > > > > Use 'ranges' property in DT to configure the iATU outbound wind=
ow address=2E
>> > > > > The bus fabric generally passes the same address to the PCIe EP=
 controller,
>> > > > > but some bus fabrics map the address before sending it to the P=
CIe EP
>> > > > > controller=2E
>> > > > >
>> > > > > Above diagram, CPU write data to outbound windows address 0x700=
0_0000, Bus
>> > > > > fabric map it to 0x8000_0000=2E ATU should use bus address 0x80=
00_0000 as
>> > > > > input address and map to PCI address 0xA000_0000=2E
>> > > > >
>> > > > > Previously, 'cpu_addr_fixup()' was used to handle address conve=
rsion=2E Now,
>> > > > > the device tree provides this information, preferring a common =
method=2E
>> > > > >
>> > > > > bus@5f000000 {
>> > > > > 	compatible =3D "simple-bus";
>> > > > > 	ranges =3D <0x80000000 0x0 0x70000000 0x10000000>;
>> > > > >
>> > > > > 	pcie-ep@5f010000 {
>> > > > > 		reg =3D <0x80000000 0x10000000>;
>> > > > > 		reg-names =3D"addr_space";
>> > > > > 		=2E=2E=2E
>> > > > > 	};
>> > > > > 	=2E=2E=2E
>> > > > > };
>> > > > >
>> > > > > 'ranges' in bus@5f000000 descript how address map from CPU addr=
ess to bus
>> > > > > address=2E
>> > > >
>> > > > Shouldn't there also be a pcie-ep@5f010000 'ranges' property to
>> > > > describe the translation for the window from bus addr 0x8000_0000=
 to
>> > > > PCI addr 0xA000_0000?
>> > >
>> > > Needn't 'ranges' under pcie-ep@5f010000 because history reason=2E D=
WC use
>> > > reg-names "addr_space" descript outbound windows space=2E
>> >
>> > If reg-name "addr_space" is used instead of 'ranges' for some
>> > historical reason, we should mention that in the commit log so people
>> > don't assume that this difference is the way it's *supposed* to be
>> > done=2E
>>=20
>> How about add comments after
>>=20
>> reg-names =3D"addr_space"; // Indicate EP outbound windows space instea=
d use
>> ranges by histortical reason=2E
>
>OK, that seems reasonable=2E
>

Unfortunately not=2E Please see below=2E

>Where does the 0xA000_0000 PCI address come from?  I assume that's in
>DT somewhere too?
>

No, PCI address is from host address space, hence it cannot be described i=
n DT=2E That's the reason why 'addr_space' reg property is used to define o=
utbound window region=2E iATU will map the host PCI address to endpoint out=
bound window region dynamically based on usecase (like mapping the buffer i=
n host address space)=2E

The translation between CPU:BUS address space is a hardware property, henc=
e using 'ranges' to describe them makes sense=2E

But the same cannot be applied for BUS:PCI address space=2E Maybe the diag=
ram had misled you thinking that PCI address is also static=2E

- Mani

>Is there a binding in the tree that would take advantage of this patch
>that I can look at?  arch/arm64/boot/dts/freescale/imx8-ss-hsio=2Edtsi=20
>has bus@5f000000 that does this translation, but I don't see any
>endpoint mode that uses it=2E
>
>> > > All regs need call of_property_read_reg() to get untranslated addre=
ss=2E
>> > > ranges:  use "parent_bus_addr" in [1]=2E
>> >
>> > I think we should at least use the same name ("parent_bus_addr", not
>> > "bus_addr_base") and probably also figure out a wrapper or similar wa=
y
>> > to use 'ranges' for future endpoint drivers and fall back to
>> > "addr_space" for DWC=2E
>>=20
>> Okay for name parent_bus_addr=2E
>> Do you need me to respin it? Or you change it by yourself?
>
>I can do that=2E
>
>Bjorn
>
>> > > > [1] https://lore=2Ekernel=2Eorg/r/20241119-pci_fixup_addr-v8-1-c4=
bfa5193288@nxp=2Ecom

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB01C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=; b=QfjoZBU0EpF36ybDscTT0FrEJl
	I+vzaeEiTVEPwZeAGtGrQHMPfjWn6untig4L+PiiNt8emRd2jE9QhbsnpK1miw2k6JNCjzUYEZMzf
	f/djrrur+Sw+hO8h/5kkr1rxDRvXRqwkBZO/mrmkgD2I15bl90u4yx7MVva4m7st7FQJ43yjKMiJf
	xHP+bcwlKJ44PXPZT+k6EeGuC0KGcfp0plQgm5OoFPJVJepgmXTlykVgi09RtliPZZWFJ2tLO1iVf
	MGKe7d2cbvdYIKYfxj3nJnhQILalCrGWZuY8FRPKJoOLcieXkz9qDA28hUAf0IBxitQOZEd1RFAPj
	abLsznDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmn-000000027nU-2hsJ;
	Mon, 27 Jul 2026 07:30:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmk-000000027mj-0aVD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:30:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496b7622a83so9161315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137400; x=1785742200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=NDZEudQBajS+M5lmUpycXjMrA/Ul5A+IQ73dTjVnBqFJQeQIkw6mbwXHsVeRpSZzJw
         5a2arybxWaMdTPFINAR0aOZ2viWYje/AJ4tG7uElTjxwjF+ng+4Z9U57leTM8zeTnEpw
         jUjOg6zlB7Lgb+tcOvbp+Bt8IZe0W58YYb4mBbwde1AwJMaMI4CW1Jaxocsl1nqoR5dR
         e8xW+TFg4BrKj/eISDzUAFId3GJgUo7mX3/DGYgd6acTgnQoWxTaxEvBF3lRL/hZhl1j
         9gJr4d4QP5xaqMmYtHc+G77LMRRTdBfU/LGGzm198SIfhL7g/bCVIUZbfZKTK74AW4qm
         pxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137400; x=1785742200;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=mXtqqrGWuJA/1LACjbABLwuyLxaI3G+0K7WrZvTXZymKrNCyKCfwATNklv1pF827c+
         hKHtWQhhv38ERsTeteYtdfkCvhplAKmYBQiBq413ZlcJNwUIPgwhZBRHFZLdbhtAMIcf
         QaK8PXOhZYa56FIa3911D9SE8n7geGxpLA9HcpiiB7semW5cztzgfUWKLbmqMrxboRxp
         pF3T7WhDfphubXZJ2kHv0G98zyMNPRnaQ/ZOI2Oz5qAwYOeHITPs98yaS9hPMroNESlh
         ZicV+CK0dcJndqOFnqf1EeRymeQzO4tYZYc/jUUiqwdeHBKeFMcplW19mYHUlIjNGCMw
         2cJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCDzDW/tQ/aCdF5jt8otqPpWysSo/vnSRZIi57ybXPZwKRpMRmwVOrQ1M/mqcFTMuS8h4cP5W8ZF0tB81pv4cv@lists.infradead.org
X-Gm-Message-State: AOJu0YwhhvvMCAw2JFQL0xVGZJFpLz76mKbz6KD17RofUqzFWr/8eXL7
	MeXyr1ScsKhzkweVpTuJX2wnbE37Bs8eaqKf45nFnPnFk8Nizd/n3x1THeYkdZ2mKGw=
X-Gm-Gg: AR+sD10T+yNMsJbzY4wE4Qn58ums9iAUyRIbVYnYqsd/N2kMhmtSJDSzfjcWmzU6mZ0
	i3uR5Efd4rGw01Z8XzY8WNJr4U3CyoaX6Wrx75BUnk9gju0hUctp33H5gSjEWx8Z1hVr8Fd2M+r
	0T2NLJNf6ueuBHQPenJL5TxkyBnUxiQouKAdBIvAEw/Osr03AEzzlmtnypRiw+URy7MYqmQI304
	hIFhejLzJOXDGeHLySiIlo7E6CrEr754VldafJkRd79U+Snxs1zWBks6p5uGnW2EqAXARR5cq83
	ptrTAUk4cD/mUluDfwpcoCV5veZ9UL5yobpercy8fULJWtZunRkuWVbQYF91J3wzJLTa0Azi2Tl
	bbCRhqBzLYHt6s7wXSjml3mU3uFxRmtdrSWXxzBBC38s4L5F1NiCxZ+VQ137DuQVVlioInFI2Pf
	JFQpubml1dmef/4G+MpWFiCehj7MilYbiT7K+x2nCX7PwI8Y3zux4QrKRG07tgTcexkqlJe5iwf
	z+xDmNSHFaxIT5aNDX9g1Tg+hEQ
X-Received: by 2002:a05:600c:45d5:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-496b570fc0cmr84095365e9.5.1785137399785;
        Mon, 27 Jul 2026 00:29:59 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:29:59 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 0/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Mon, 27 Jul 2026 09:27:39 +0200
Message-ID: <cover.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003002_294805_761D201E 
X-CRM114-Status: GOOD (  16.23  )
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

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

Add pcie_kcs4 to existing LPC bus in aspeed-g6.dtsi.
Modify kcs_bmc_aspeed driver to detect the PCIe over LPC channel.

In the driver, this PCIe over LPC channel will be detected as Channel 5.
In the datasheet this is defined as Channel 4 over PCIe.

The Channel 4 name is still referenced in the offsets macros.

The host need a driver to activate the MSI interrupts with the PCIe BMC
Device.

Tests:
With the patch [1] adding PCIe BMC device for Virtual UART, the MSI
interrupts are correctly setups. The Host driver is build and side
loaded on the host. The ipmi_si driver on the host is loaded manually
with the KCS address given by hand. 'ipmitool mc info' is run to confirm
it's working.

Tested on : Asus IPMI Expansion Card, AST2600.
```
$ insmod aspeed-host-bmc-dev.ko
$ lspci -vvv -d 1a03:2402
02:01.0 Unassigned class [ff00]: ASPEED Technology, Inc. Device 2402
	Subsystem: ASPEED Technology, Inc. Device 2402
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 154
	IOMMU group: 12
	Region 0: Memory at 82080000 (32-bit, non-prefetchable) [size=4K]
	Region 1: Memory at 82040000 (32-bit, non-prefetchable) [size=256K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=32/32 Maskable- 64bit+
		Address: 00000000fee00818  Data: 0000
	Kernel driver in use: aspeed-host-bmc-dev

$ modprobe ipmi_si type=kcs addrs=0x82040E88 regspacings=4 regsizes=1 regshifts=0

$ ipmitool mc info
Device ID                 : 32
Device Revision           : 1
Firmware Revision         : 26.04
IPMI Version              : 2.0
Manufacturer ID           : 2623
Manufacturer Name         : ASUSTek Computer Inc.
...
```

Changes since v2 [2]:
 - Put pcie_kcs4 node in ascending address order.
 - Add missing "case PCIE_LPC_ODR4" in aspeed_kcs_outb.

An RFC [3] is in discussion for implementing multiple LPC controller support
in kcs_bmc_aspeed. This would change the implementation of the pcie_lpc.
This series adds the pcie_kcs4 to have devices like the Asus IPMI Expansion Card
use it, before waiting to have full PCIe LPC support.

[1] https://lore.kernel.org/linux-aspeed/51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com/
[2] https://lore.kernel.org/linux-aspeed/cover.1784732161.git.gregoire.layet@9elements.com/
[3] https://lkml.org/lkml/2026/7/23/429

Grégoire Layet (2):
  ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
  ARM: dts: aspeed-g6: add pcie-kcs4

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  8 +++++
 drivers/char/ipmi/kcs_bmc_aspeed.c      | 41 +++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)


base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0


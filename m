Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9150EC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=; b=QFoSHzVSgBT8TeKJ23wflae8Mz
	XkCnKv9uceiomgDuVGPrSjWO+VqZZRi1XUFVhAOBbGRFRf/4lWY/BP8G2tGv7INoAfI/5TldJfVHL
	EDI9/Tc3WLROALhXeAI9JqJCFgXFxKjMWdyZei3DIKbfC0iFiiQKj2kf8EE8P28mBL8yi4qElISOI
	++0Ryz/cv0v3maKqhch/U+zeMZriy0DHB5diRJsgeibzJ4/8At8KEjhwyFCyIEi4vArh1UPFItK4j
	VJ3t7XF7y7qwF2RU39G+qnh5DAOnpOoLgoo/89tfHP4Dc/SX8t5sg5GgMvlOwcBv0NcnUDrVy0vUp
	G6S707cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqM-00000003WAC-2z5H;
	Wed, 05 Aug 2026 08:19:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqJ-00000003W8G-2iEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:19:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-496b7622a83so5203115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785917953; x=1786522753; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=XdKiun+4/4XgiCye9yDylIcXEshD6xZYsZRBXHGFneSAaqpq2qIWIccgdosF4GXkTZ
         IzH/vwzY+BwlF/tW79ddrLrYaIx5o53QxnJFspVipLDLBTOTPB8KLIZHx7/aHrf8+96I
         NcgUgAfCbRS46XFlvR4hqzVTTa+WdxFwQTlEtxCzeANjnt34ibPhvjMw3wjBrMDBr3Xj
         fZy/gaumlYSLQxr+DdR2k+wLhwJHGaTPPpBI8UkdgQuMqjXhHd70q65QQwtOVQVkUX4E
         6JMNohW6Ce0HXz42bc6R+5fyC8Dekt/EFmfPVg8Y4BOsXoSOGv/fodU+1q4+jHhrEiHn
         Tu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917953; x=1786522753;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=oX3kES9JgwjFpEk8nk/YdUDolafSZcM22sIb7xUWboArKgi6cLdbNVQfvF1RuL4U0H
         8kPSdpkJmqNxDmatbdkhS2nDetjZo+G6iMhj5pB7+2q864G/awPARjoQCjwvBz8Sol+M
         Ok8xGB/fc8YS4VAyCHmoIxTTbCXW9ihS00BEJwfzAyCAlvHJIlj7c1BVWr579YDi1Ode
         4TtMlG9Jk4CQ9LD4oBjBBeoKkZqIUM99E+uNmtA6/6v+UZ/8uSYI4T+H2LWPZ2u5fm9s
         eCEiB1frrGxPaHmfZI7z4XudazfvgDLZFD3fEntQwArHsT5r/+GogYnV0Od/28HRPYJm
         nFGA==
X-Forwarded-Encrypted: i=1; AHgh+RomAMhhBE5+IChZnDoraSacyFD6AZ9UaHPcCe2T+8yzZ31aa1u0i53qSEGIeyIVhTLpsf4ZUQood0FEGVoG31OE@lists.infradead.org
X-Gm-Message-State: AOJu0YzggDndxU8akmMN5yiWY0Wazdm8kLBgJH5c9xFbmwh1Xe/GlS8D
	1eiGvudYWAFYT0kgGEkXmXnWYRfmG+PD5hsUURBm6sx5dFtsssD3pxlmzUMcp7Zfn/c=
X-Gm-Gg: AR+sD11MTnzsjMdN7tYFtGQMjaooi/1PvRBb/AxeVRVsgF/XZpoSj1AU1+xq3d05fmx
	U+UrBxNNy6da3EpMt+jWqD6m/FNKhCkcFtho/w2eM3MlpxBn25dizoeWZ6G/tTfTIRgDy8/GX1i
	n8PmMRlcGRIi5juRuvEkYCRks0wwb7oAXHKLZ7ae3pJCTbrTDy1pMcVlYdV5AwXmGbJyH1afRY+
	YwzWMvsFiNNW+utHkUKYauEX3ET9FfDnthPb9+8oeZmEGGucv+ThO6yr2dHcNLxpA+zlKaq7VdE
	6PLuN7ei76+dBSF6CQsd5U0UzjeRQgKRVEgU/xs3KpaCaiwo7dFQk+qL4aUVLZ65M7OTRUP5U6T
	+ZusK8F56TAMx+HsehsW0EtgWGEVz4mhc0E3A6JTDN9jjWU3HpLFluDS4m6y1lXbMNdE6FmC027
	aTCGqRZ+6BXwyJtdvGgO/kHNTDVNBM+QmwHxRc97fFlj6nyu4F5qmFIYMhMULoMNvE9gRUKgtTe
	ULPqC5aH0Zz0vBKzMkSCKzHyeFDsBi7d1AJlPTPwUwvfdzLll7G0hCL1ByHKrBgvHqbEel7Dwrf
X-Received: by 2002:a05:600c:474a:b0:495:7888:281c with SMTP id 5b1f17b1804b1-4994e6d4a13mr49305745e9.0.1785917952680;
        Wed, 05 Aug 2026 01:19:12 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm74745695e9.10.2026.08.05.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:19:12 -0700 (PDT)
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
Subject: [PATCH v3 0/2 RESEND] soc: aspeed: ipmi: add KCS Channel 4 over PCIe
Date: Wed,  5 Aug 2026 10:18:59 +0200
Message-ID: <cover.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_011916_134886_24679852 
X-CRM114-Status: GOOD (  16.26  )
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
Message-ID: <20260805081859.BMonsZNvpVpzv-lER5z3KXf-oQNpGJ8o5a-wTWoT4JQ@z>

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


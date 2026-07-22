Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D9C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIC+L9SRUgouwms6wXkTg2Wb9d2ocgYi1ZK4mto5XS0=; b=msChLQuPqUNtl2aXMqnTk9ttEL
	6oMn4kyIzsUasbJUo2ZCN3lnCUqlh2MOylNpVh+sDzOWc1ZsJaV2Pa29f9LIdwtQwrCUJ4kA0LaMB
	yu0ycQywZUPZiA1XvGJ9Xaodc3SYLYP7NOlhB9hVVrUATbGovqr0GzxdH9a5CZOM4b+cHgdfYoNvQ
	Ty5gYK+UcSxe2Bx2qzKpI4x7L+vhAnf/qZrCZ8YTuEXY4GehYmyjVkOAdQy0GCt+81zaKxHa5zdg/
	Wzjp5bKduvlKl6luoOXS1YTRT+z1Mwh8mrHVytmovHcXVW7pS0++hsKVCGruyWr7+t4587kpH+nhY
	2xFpQTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYeU-0000000C7SU-0MdO;
	Wed, 22 Jul 2026 15:14:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYeP-0000000C7Rs-1bST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:14:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so32941195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733263; x=1785338063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIC+L9SRUgouwms6wXkTg2Wb9d2ocgYi1ZK4mto5XS0=;
        b=FE+I5Tx7C3dG3gEgNWFsd7amj+rLoyX9CCr33mACU1jqzy9PSryCpLqjZLtVfkkuHf
         dzOnoA3CH5RcAT9oI9pnyGwDtoai+gBEoiOxPGQAvuj6npCnOEG1gH6DfT01WTpkWkfq
         rcjUwg7tS+cziP+otwGVA4LykOpn0pCLHXgxDS6G9hlmgEGcdF7aqG4Iy9uTCTMhKRUy
         jIZUG6jhbN6hb51pC0ByMWzX3EfsIbP0S2tmfyoVzREYXNRa2slebmCbeOjCr1Mvxg3m
         K9j9Q4ttO8s0iOqPndiEXNNw2r6EYPAu/FKD+FDBB5K5wYr9QfaZU1M12IPhFCkHtsmN
         4YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733263; x=1785338063;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIC+L9SRUgouwms6wXkTg2Wb9d2ocgYi1ZK4mto5XS0=;
        b=YtKRrBqIkmdX0V5IJJnfjVrj1y9sbHpvn2kSjol6oZSnSSz7q9djABwE9KhhEpxK+k
         sYlMr9M8kWqtwMWcOE6sqf5gRZuP185s4HONYrjhotnqKIYtbrAhsnl6FO5jO6Q9QuNO
         v5+Zes5FGSQzszsiyvQ7DyK2Dz7zKQJ74u0xjK/KAUZOMp55ba7huQ14hrx6OH2FtnUZ
         N9VaY/6qi5E6IcLnNbDlVrb6Pl3oyH04SRdqgmSnzDq0fBFc8cxAwMv94iDAQxRtZZ7X
         Xbc/9gnvy6JMBh4d69sTJGk8eF5UU6+ZaK83wAvUyrjU72mqSlu8WfxPN2kM0KzFxLbd
         Wuqg==
X-Forwarded-Encrypted: i=1; AHgh+RqCwHIHhyx64xWGmd5AE0Ky1sOfi/FtjsSac7svDqbDIZOZyxNVK3g/9Ad6Q4yTyeHFR2wWYRAk1hj1wWlQMXPI@lists.infradead.org
X-Gm-Message-State: AOJu0YzEEj9vWkSbl79TI2kQ23mww16HTFyIcDqjSPeVHqa/KEyAymXG
	Lez0lAfQcQjx7twyRK4ysTiVqldEMq/95JtIhr/qzwo/z7pt2F7Btlfx5yowH4oOCZE=
X-Gm-Gg: AR+sD13wHiGvfPo5ogcMVNkEoOuR9o6Lzlglsnq9bS6DaYowlgcMStppMQbHTatTumm
	V6a5oDwXuJTWH4m6qAIJmZ9RMLidesuKQQcoVWWsUo+foUJBsXTwnvo9McHgyEZBpKIGxSi3oeO
	ckfoUimPa9oeo2idVpuEnUnNMcMC11FQEE9G5XOtXffMi2p1lYzoQFuUi6UV7zj0NzGQkji5bdX
	QvEHk0ilKE4PIgejTht3J+ujqVuL9xl66ar9iR4YrR1yPuz93fnTA2Cq/Zi3Nj9Y6F37HGgmmna
	Y4hWP4dTDVN1vw64VYlTC0/PXvO2dO++dGi55G995GeoDjkef+JRVeuGoszw371lK4p7lN/+DIi
	Q5pl6yUUYK1afeHNGebJXR9z2UF1All5oRJG5lyOmQGQFgvUZfrVb9OLWt9oEdkCZo0i0nvVEnK
	/QDbKeUpQAyT9vJgCx3V98iXx2TH9uV7FPvcNN5Uy1hpPonTPX+UmUUhKO9QtOQWLm1jvPpOUac
	u0p8rU0qeBHxlOW/w==
X-Received: by 2002:a05:600c:c84:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4954a3ed426mr259964805e9.10.1784733263489;
        Wed, 22 Jul 2026 08:14:23 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:14:23 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 0/2] soc: aspeed: ipmi: add KCS Channel 4 over PCIe
Date: Wed, 22 Jul 2026 15:11:56 +0000
Message-ID: <cover.1784732161.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081425_545273_78C8A496 
X-CRM114-Status: GOOD (  15.69  )
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
With the patch [2] adding PCIe BMC device for Virtual UART, the MSI
interrupts are correctly setups. The Host driver is build and side
loaded on the host. The ipmi_si driver on the host is loaded manually
with the KCS address given by hand. 'ipmitool mc info' is run to confirm
it's working.

Tested on : Asus IPMI Expansion Card, AST2600.
```
# insmod aspeed-host-bmc-dev.ko
# lspci -vvv -d 1a03:2402
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

# modprobe ipmi_si type=kcs addrs=0x82040E88 regspacings=4 regsizes=1 regshifts=0

# ipmitool mc info
Device ID                 : 32
Device Revision           : 1
Firmware Revision         : 26.04
IPMI Version              : 2.0
Manufacturer ID           : 2623
Manufacturer Name         : ASUSTek Computer Inc.
...
```

The original patch [1] review set to use the existing LPC bus and
modify the kcs_bmc_aspeed driver.

[1] https://lore.kernel.org/linux-aspeed/de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com/
[2] https://lore.kernel.org/linux-aspeed/51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com/

Grégoire Layet (2):
  ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
  ARM: dts: aspeed-g6: add pcie-kcs4

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  7 +++++
 drivers/char/ipmi/kcs_bmc_aspeed.c      | 39 +++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)


base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0


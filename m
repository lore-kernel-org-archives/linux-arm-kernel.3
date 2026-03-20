Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848DF1099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T49qL0HGrnbYIpVdO5mePRM8nuu1rEpsHgwxsmb6OnA=; b=aYMqcoThkfsWXO9ODooPbapacE
	Kjk3enCGPrd6X+6FcMUryJ1fXszgyRKYJZFI24UwvhXA41WGhz/ymFGf+tN06nYt6s4z+WS15jX3s
	g02WJKuvLu9Xtk4jDUS9CngNG9UtK6dpI04Io9TElUn7IFI1FMfScJrF2zT6+wNeBmyxEPuh0qkK+
	5xCLlKqOX9mlr39W+jadXLPi+ZO2fS4dXMl8ISl5iL6ril64rJj1XkPOJ8VMu0i8pFBkDKnrdB9av
	76PVb/i/s8nsEA3aarC4Ifa1XvEPBnyHufpea1Nc5tL6zCB7T40SxhDvNG83o25oDRV2+69eTmF+k
	0JzjSaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hHw-0000000DcMA-3Hw3;
	Fri, 20 Mar 2026 21:21:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hHt-0000000DcLV-0n9R
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T49qL0HGrnbYIpVdO5mePRM8nuu1rEpsHgwxsmb6OnA=; b=TVEE+LV6hrBgoue/7f2INATuVa
	vp7hKcvFTa72axf3s3/wQ4ngbarOifiwm9O5gGdGnYgbkiNeWowZGJ4QF202k6OBqq3IGNFAi+7OV
	P30b2HfcB7qJLBrvnppDPkKHeOwwsSnaoHsrAQHWO+WAhBk/Y42y+CcxgGrWheFXGlzWKIqzXtPPy
	ozh7k7AZPwgd8zmllHReilVjI3CS1C3J8zdpuo8gLL5bAmOhP0/FCxAN6M4ezgG1YGzvXdvS8ohpy
	ORfyd2uSXw48niU0nEN19g7EXP42C4Jhy+2tSny/Cq2JoWrWncLe+7xqBZvfABI2BKpv8XT7uSvyY
	3L7gpHMA==;
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hGQ-0000000GV7H-0xt2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:21:41 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B1F1DC0017F3;
	Fri, 20 Mar 2026 14:20:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B1F1DC0017F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774041605;
	bh=zN4dslV6Zxx5Z3smcDyjIRq0uqjSqffHvQQbZlwmYuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=upHD9kEqFdaugDS2A9zgdf5u8GPsL2vZGU7PTa+kuYgkasB43jPL6uRUUbOJ7HGN4
	 cH1t4wrkR0VviW/8Z+zV+F3zAv5jyCJsVz0RWI74nRAcHIeYtEjRO3OGHCsZv47NBZ
	 rwKTZg3kQfNBs6UteckaKJvYb8JRh1MYfEc2ziDs=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net [10.17.214.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 81537AE80;
	Fri, 20 Mar 2026 17:20:02 -0400 (EDT)
From: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	jitendra.vegiraju@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: [PATCH net-next v8 6/6] Add BCM8958x driver to build system
Date: Fri, 20 Mar 2026 14:19:21 -0700
Message-ID: <20260320211921.1202058-7-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_212113_130131_2BD7B634 
X-CRM114-Status: GOOD (  12.78  )
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Add PCI driver for BCM8958x to the linux build system and
update MAINTAINERS file.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 MAINTAINERS                                  |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig  | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/Makefile |  1 +
 3 files changed, 20 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a09bf30a057d..9ca631fe78f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5120,6 +5120,14 @@ N:	brcmstb
 N:	bcm7038
 N:	bcm7120
 
+BROADCOM BCM8958X ETHERNET DRIVER
+M:	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/stmicro/stmmac/dw25gmac.*
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
+
 BROADCOM BCMBCA ARM ARCHITECTURE
 M:	William Zhang <william.zhang@broadcom.com>
 M:	Anand Gore <anand.gore@broadcom.com>
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index d3a6ab7383fc..94ab9f13d542 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -386,6 +386,17 @@ config DWMAC_LOONGSON
 	  This selects the LOONGSON PCI bus support for the stmmac driver,
 	  Support for ethernet controller on Loongson-2K1000 SoC and LS7A1000 bridge.
 
+config DWMAC_BRCM
+	tristate "Broadcom XGMAC support"
+	depends on STMMAC_ETH && PCI
+	depends on COMMON_CLK
+	select STMMAC_LIBPCI
+	help
+	  Support for ethernet controllers on Broadcom BCM8958x SoCs.
+	  This selects Broadcom XGMAC specific PCI bus support for the
+	  stmmac driver. This driver provides the glue layer on top of the
+	  stmmac driver required for the Broadcom BCM8958x SoC devices.
+
 config DWMAC_MOTORCOMM
 	tristate "Motorcomm PCI DWMAC support"
 	depends on PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index a99bb0dfe5ab..a50a1bb04b0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -50,4 +50,5 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
 obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
+obj-$(CONFIG_DWMAC_BRCM)       += dwmac-brcm.o
 stmmac-pci-objs:= stmmac_pci.o
-- 
2.34.1



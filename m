Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C452D3E779
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELy6ICW2TEmM6hKJfcyhmgjGc/1ElUN1EwN/EW7ULAc=; b=QqR1ZfMjNDKEkQIalgVajntrkH
	R9lzFuOMZ1Zhg2iUpD5I+thucapnrI72I07gvBEfK2PRWvI+yZVCBt+9OVICE1IXqHfamGut6oO5R
	3J8v5C/K9jnWVZ++H693GodP1v6Qvozbs7G5rgPQ8vY5ndnrwIp+UVOAarDTLOhQ9vRPqC6rPirJS
	R4kGg4hRUUPT08Uc/XpQJ19l3bWcwpcFvu/smoQt6VXbBEBuA4XMuqWeHJM/MosOcBRX6ch4ZI1Os
	sOjTkfn8lmkS6AIdpQRn/8oyNNR8tRF1F6RzG/UO1iU9YzEYqrKw0j3QKf7cvP9pAOuZncsaOVBKW
	BVL55G6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SMn-000000012nR-1tIk;
	Tue, 05 Nov 2024 22:49:41 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SL2-000000012W7-3nP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 22:47:54 +0000
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 73B4089048;
	Tue,  5 Nov 2024 23:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730846870;
	bh=ELy6ICW2TEmM6hKJfcyhmgjGc/1ElUN1EwN/EW7ULAc=;
	h=From:To:Cc:Subject:Date:From;
	b=qdTytCw9HYDNNCpo/hKZmctyr8xs//XHJDpyDtGWf0bzAUZcRplGLXX/fP4trdvyN
	 E1lgAnqr2WTz4A3wE6csTdn9vWBHoFGdKCB22uaTUEBtUJ0P+0co6NU2IKPE6ZByZQ
	 oQKqWPXmhpebNQnk/WPGw5pqE/x9bmdKtY5NlsbWOysVU+uw9+uAknyt/VlITqx/Iy
	 MjGGlZR9SKVl+ASW1rCHdA9Dt4JAvQ7yM48uE/s2jrOuIfAbZlC962cnP9G5PeCrzb
	 ldR9sK85NgqEsN4ug8UFGb0WoQoJnwVwz2ZPRKxte/J0b464ZAHtDeqy8yxc6HLVdO
	 tAvouHy3XVz5Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Increase CPU core voltage on STM32MP13xx DHCOR SoM
Date: Tue,  5 Nov 2024 23:46:22 +0100
Message-ID: <20241105224728.147384-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_144753_142413_8B7F3A24 
X-CRM114-Status: GOOD (  14.41  )
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

The STM32MP13xx DHCOR DHSBC is populated with STM32MP13xx part capable
of 1 GHz operation, increase the CPU core voltage to 1.35 V to make
sure the SoC is stable even if the blobs unconditionally force the CPU
to 1 GHz operation.

It is not possible to make use of CPUfreq on the STM32MP13xx because
the SCMI protocol 0x13 is not implemented by upstream OpTee-OS which
is the SCMI provider.

Fixes: 6331bddce649 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 07133bd82efa6..8630de147a52b 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -85,8 +85,8 @@ regulators {
 
 			vddcpu: buck1 { /* VDD_CPU_1V2 */
 				regulator-name = "vddcpu";
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <1250000>;
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-- 
2.45.2



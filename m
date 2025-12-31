Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3080EE644A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bBtCPA30ebdutMRXzIsFYbMo3m7bo8sSvdhd/4paok=; b=q/XyeyyPjRXJeHxEaRntW+8OwA
	HpW7P+ZoiFZJg+lOYWG7iDclsf/PhL3q2QqPh+SJYItGEw3Hk8kkyQqCZMH3YjkjgclSbNXHyxdGE
	0pZRTC/4aCnpRj1QrndV11CogJnm5Z7bwH8M71oFOUWRemKF9ozBiotHciA67KWluo3voOo59yIJ+
	nbR7WCTa/P2RVvkXonU6cnt++79pBUcGYkra/Rp+eJq1/TLHL73FEMGqSk2XD1YP+6yzs+RMdVb/V
	96WkfSqBYtAajR9ABULi3ODMlZEu+6QkXwPGpjEMwQEuc71YeuArw4WnvR4gL8nCQwcW5Q6W9vPhw
	bgQW+QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4D8-00000006NMH-0CVI;
	Wed, 31 Dec 2025 21:58:32 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4Cz-00000006NIR-42ph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218300; bh=m+mdNbHBwSu7JNOSxE57TwouE4jZO/PptGoxHs28w1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfVxD4Vl40LWt1+x3YeEcNvL8mp9yvmqrVrVyA5yG4lRBeFLyt+yE+ME4zStY85lc
	 91si9N7iJY7R4ShWdRp1Eul0svyEFjce+cUqyAVf53hemKUlFX64MNuPtmnWPqUqDS
	 hXE0jH001SMCk2bm+9HqJWc80UgeKxohwxu0X45ZZFSj8/ke2CxAouAAgDOvnEU+V7
	 eUNLBXorvaqE7UXiovMQ32ZH2Q2OdNOG+f41d5yQ+478+54uZ9uRvwEaJqSFFraG5X
	 FO2Gi9Y2Cd/CAFVkK12DT21RE7C5h1jn8SaU4y3B+ezlI4V9LV9ScI/EuPS4hLM1Vb
	 zShuEYBLg19RQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5A6F73E99A9;
	Wed, 31 Dec 2025 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767218300; bh=m+mdNbHBwSu7JNOSxE57TwouE4jZO/PptGoxHs28w1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfVxD4Vl40LWt1+x3YeEcNvL8mp9yvmqrVrVyA5yG4lRBeFLyt+yE+ME4zStY85lc
	 91si9N7iJY7R4ShWdRp1Eul0svyEFjce+cUqyAVf53hemKUlFX64MNuPtmnWPqUqDS
	 hXE0jH001SMCk2bm+9HqJWc80UgeKxohwxu0X45ZZFSj8/ke2CxAouAAgDOvnEU+V7
	 eUNLBXorvaqE7UXiovMQ32ZH2Q2OdNOG+f41d5yQ+478+54uZ9uRvwEaJqSFFraG5X
	 FO2Gi9Y2Cd/CAFVkK12DT21RE7C5h1jn8SaU4y3B+ezlI4V9LV9ScI/EuPS4hLM1Vb
	 zShuEYBLg19RQ==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id CB2A83E99AB;
	Wed, 31 Dec 2025 21:58:19 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: lpc32xx: Add missing properties to I2S device tree nodes
Date: Wed, 31 Dec 2025 23:57:54 +0200
Message-ID: <20251231215754.2222308-6-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231215754.2222308-1-vz@mleia.com>
References: <20251231215754.2222308-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251231_215820_410486_3C6531FE 
X-CRM114-Status: GOOD (  11.54  )
/bin/ln: failed to access 'reaver_cache/texts/20251231_215820_410486_3C6531FE': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_215820_410486_3C6531FE 
X-CRM114-Status: GOOD (  10.45  )
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

From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

Add NXP LPC32xx I2S controller device tree properties in accordance to
nxp,lpc3220-i2s.yaml.

Link to the original change:
* https://lore.kernel.org/linux-arm-kernel/20240627150046.258795-7-piotr.wojtaszczyk@timesys.com/

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
[vzapolskiy: changes to the commit message]
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 389777ee6850..53e12679ba5b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -238,8 +238,11 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
 				dmas = <&dma 0 1>, <&dma 13 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -256,8 +259,11 @@ sd: mmc@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
 				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.43.0



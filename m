Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55186C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLCyXf4fSaul0KJMCLi1kEMoFgnLRGwVU3DVuKnCCcU=; b=U2JGZ4pvvyeMYyz3Xkfn8uLyoz
	zA6H/ILs13O4EPYpRFu/QnXH2FX8tiTu1Yd5Md/kI9zIRlKrJY5f9v5636P/uhu9GYsW07loe7gGn
	mbSbWY9aJOeQMORVlc4jNocnzTtq0P2GXofsH+wmNfeeNTKhl3JSvTDAwSSJJjUwKdU9A6AEe01nR
	oGH+6zyCWkWMhW8oxvp/6E6JI5K/u9rQe3L8M6rX8T3YNfc1X+cT56wt1xhcnLSjP63IK9FvL67jd
	cWYKo3oQyKfKVZbs83+rbbHouRzB+m/ZAQ1YllI1VOlY4UAY2lTQWOr+ZoQkRHMc/RtfExhVkOudN
	Lj7Tw5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepn-00000006t4u-492r;
	Sat, 11 Jul 2026 21:02:03 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieph-00000006t0A-36Pm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA05711984F;
	Sat, 11 Jul 2026 23:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803711; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sLCyXf4fSaul0KJMCLi1kEMoFgnLRGwVU3DVuKnCCcU=;
	b=b6nquMRojWyPdQHGg8IzliPYNnFVNTXutLtEoMZb5Kg34ut3o5p2yVHL23YoHDwxVlCO9z
	UNNxud59Y2/3I8o2oPxjNMVYlbnmgOs5HSZgHfombumdoKMFef3kPI4chfWZWtEqSoPGcz
	0L9X7omWlNj1sZHcTBdCvyCuyTzmp+e/dZT66POo5p9AgilTriMehuWUonKpI6+7bF0eJK
	HSu1CpDxEvL/l3RNihtoFnLxxbypRexIPJzK074RV4wBOUZqMKVVpA2kspHN3fTQvtOwuv
	y1d9AqZdSeryGUFU005rC9td1Ftr52wfqIOa2GriT/PwhAAmXyJBTZK7Zn+doA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 05/10] arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
Date: Sat, 11 Jul 2026 22:59:34 +0200
Message-ID: <20260711210131.236025-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140157_938629_5B4B04A2 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Add DT nodes for the remaining SDMMC controllers 2 and 3.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index a9de9fc5eb411..d70812f094142 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -730,6 +730,36 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <166000000>;
+				access-controllers = <&rifsc 77>;
+				status = "disabled";
+			};
+
+			sdmmc3: mmc@48240000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48240000 0x400>, <0x44230c00 0x8>;
+				interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC3>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC3_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <166000000>;
+				access-controllers = <&rifsc 78>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.53.0



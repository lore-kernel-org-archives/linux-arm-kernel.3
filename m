Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8BFCA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vMBKkvm6k3gmJ6Qe3oDHVl+mCgwYJYz+Jp8UVTdokc=; b=bWW2CR6s/i77rEul8zOkV80gvB
	1lrXeiDLo6c53PAtwRSwEMXVMyxCD0221+/7wNMce7KsaG7xZcmrJC2b1vBHiF1V2B16CD0o5eHFY
	MCYCnqFwdiwbQ/82gky0VMTYdASPH4F2aYzsp1fTzQE/+7COfCPGv9nDNPwguN33avPSB3n/LetYU
	kP80Sf6dpmfrohRdyTqbp88ozw5c4wcXQ5QWkKEgLte0i29KkZm2pgfzXn3AUaw89Nl4Netzo5ccH
	uXLutr0nmFR5doSeNomXYVxMza77RNNuVUx6MBhfWJM85exryp5NqCfuINMChZQOy2zSUMkSf/L4K
	ydcKUMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqR-00000004G1t-1EB5;
	Tue, 20 Jan 2026 17:48:47 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFqL-00000004Fz7-0s5k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:48:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FAA8148ABD0;
	Tue, 20 Jan 2026 18:48:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5vMBKkvm6k3gmJ6Qe3oDHVl+mCgwYJYz+Jp8UVTdokc=;
	b=OMxkNh93XArjOYe9qyeEqLB1bx7/aoP5yvVdUFj4WJItIGLh/iMqDc+7hSO7hSrG+RVHjz
	FR9umWLBBaoFdVfdNQSPOGAwpLG2WQCWG8/lH2bchzPaPjFQFw/uh0m6isWrcgyjjYfqHg
	EUOEuda/On8b/M+xPinElT99QFYWVU3hMWZABgJdkieRA1IxSKcf/oN7AmZIbuI+OxqTIb
	BWKgMecizUu/1aIQrqEs0prt2bRN/qngcdzDVY2kQwgJrxUyvy/i15tgoVNWtmX/X5yy5Y
	pG8C8lJ4hAJnwDldUoQFm776NaQ05bn/TpwlTOZJcl+ixV2wAClISLhWNUlxAA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 17/19] ARM: dts: microchip: sam9x60: Add OTPC node
Date: Tue, 20 Jan 2026 16:44:51 +0100
Message-ID: <20260120154502.1280938-11-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_094841_406285_72A6126B 
X-CRM114-Status: GOOD (  10.34  )
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

The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
interface between the system and the OTP memory.  It also features the
Unique Product ID (UID) registers containing a unique serial number.

See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
Controller (OTPC)" for reference.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Removed needless header include
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - squashed with patch adding the clock properties

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index f9e3962faca3f..098996739a62f 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -157,6 +157,14 @@ sdmmc1: sdio-host@90000000 {
 			status = "disabled";
 		};
 
+		otpc: efuse@eff00000 {
+			compatible = "microchip,sam9x60-otpc", "syscon";
+			reg = <0xeff00000 0xec>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.47.3



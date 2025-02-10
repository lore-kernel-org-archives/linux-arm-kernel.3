Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555D7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgd4lUDSFWZi+mMBEAIolQwUzvJ3Y9D9P+qJLoy3Uug=; b=IPatPhRMCZkthgYK+Je2zeCQwt
	lMkvJZn84WNaAFE67C6w4UJW9E2/S+3vASjvhU/wnKZAtkttp9rQmKEpXghJAT/HAebTMHk3s/366
	9PHBRdf+fuwYchYjm/AS5BO3fyP+ret7w58lL284BUkunhs/FldCzI2CyHGc3NvWxaSzM0v2MAP7u
	CGIW/pXakIFD8pEtyrJXiVj4Wystre8gZO9rIGttwEgLdZ3zzbhQ84sRkz1npzozrQOZX6l2exiPx
	b+RO6szEb3yqgqLIlmEMwb6VRI4IG6o4HJdXvPBrIwj4l8DG6ae6v8YY2+a82bfgyxqf93n2oQWd1
	d97RT+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcNV-00000001g5I-0OC3;
	Mon, 10 Feb 2025 22:35:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc4D-00000001cTy-1EIp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xgd4lUDSFWZi+mMBEAIolQwUzvJ3Y9D9P+qJLoy3Uug=; b=kcs0bQyU3IdBGxY7c0JeNPpRYg
	Ni2ZUNF1Kyf7vsV9RXoMer7xpOu8fWmqOSsvIDz7cZHuG/0FUnlRGI81EIgGT/dn4s199Fs3gWc0q
	5oErV1LNtYcUtLLpR6OAiOghfgNh8Gv2DtHEsUoy4ht/Zo1PAr0SZkOSkHhlv7YBqpL1U7e/htmIS
	1dPeEEVq2GFtHAf4Pz7Y4ltdpCPYe6oAu4h4qL0W/vpAb5FXseDvfvUjUtXSFQ60nvZf8pyM9tUtZ
	rOMovg+kY2Vk2rzO4fZHeFLY0kjIpOjAV27cJnORnPgOyqXUGxMdmANZlKK+AX2RVpCRtwhrnAp+U
	TD9/XXDQ==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc45-00000000JUF-2fA0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:15:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFU7s121113
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 16:15:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=xgd4lUDSFWZi+mMBEAIolQwUzvJ3Y9D9P+qJLoy3Uug=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z+vYO7ASgPj8j6p0hc6kYwd29ma26Uz6BNPdxRdmsiRGBT6+jmLY/cpsCSfIfECcg
	 o4LUIKDxxmqbk0jzsWmZmlR1TEhn13uhIx74lbQKrQJsYPgxZFR7y6+JKOOMJMI7cv
	 NzdG9OcsZfrt3dFrLcXwwbX4Hqo3aufeHULrC7Jc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUXn001775;
	Mon, 10 Feb 2025 16:15:30 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZ4112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 02/10] arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
Date: Mon, 10 Feb 2025 16:15:22 -0600
Message-ID: <20250210221530.1234009-3-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_221544_521874_B8B3519A 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Hari Nagalla <hnagalla@ti.com>

AM62A SoCs have a single R5F core in the MCU voltage domain.
Add the R5FSS node with the child node for core0 in MCU voltage
domain .dtsi file.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- Drop SRAM node for am62ax MCU R5fSS0 core0
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e..1178cc6a9be8c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -175,4 +175,29 @@ mcu_mcan1: can@4e18000 {
 		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
 		status = "disabled";
 	};
+
+	mcu_r5fss0: r5fss@79000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x79000000 0x00 0x79000000 0x8000>,
+			 <0x79020000 0x00 0x79020000 0x8000>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		mcu_r5fss0_core0: r5f@79000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x79000000 0x00008000>,
+			      <0x79020000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <9>;
+			ti,sci-proc-ids = <0x03 0xff>;
+			resets = <&k3_reset 9 1>;
+			firmware-name = "am62a-mcu-r5f0_0-fw";
+			ti,atcm-enable = <0>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <0>;
+		};
+	};
 };
-- 
2.48.0



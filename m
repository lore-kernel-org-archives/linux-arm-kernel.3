Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EADC5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g97MLXgboSWX3Rdmb4CPNQY862mBBRdDnTP12afVH5w=; b=KPPKUk55Sea27PMgITyrlDTxL3
	hGFo+78fAtUjuWJbgsCB2wLxn9IwQGp3tJ0quH2e2gvROkbi/fzJ/a185XPR5fidcPtp28ph9ifBI
	5+8+LvyyZ3oXfUdwYgS31yFUnWZjde0TiTPvYnBqD63jpxF//KPlFTmS+ilk9Phx/c0AENhPO3y7h
	KeGTxtosTl/BCjbLX0ZbFlgotockLqmfTsWk5C2CqPu5DIeab+PQ8TBpah8nDE/yLyj1iCik4Wa3A
	Gegc0YPXXkf/rFc+F81Z0rwjmw/UXJFE+3Dc95QyqLsqX+wrxOSzHf0m7zF5o6o37Bys4Z0DO3feY
	9DLhHWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFT-0000000AC8f-1JyP;
	Wed, 19 Aug 2026 16:34:43 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFN-0000000AC5e-1x3g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:34:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2EEE11C4DB;
	Wed, 19 Aug 2026 18:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787157271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=g97MLXgboSWX3Rdmb4CPNQY862mBBRdDnTP12afVH5w=;
	b=Ngtwb1FhX1deeduOun3mMzi9ZNala3o1HWFHA8EJ3GwBrOtIJykLJy7UUEx+MeAQd43F1k
	Bc0bfh4mhN6H1TBPDGd2PxMNFPMMBoS0TT1XcEjHziqnJejZnm9Hsr6AUHg+9eEwTgVHEh
	VBcH6YGF1DOB46jovvwhrWhEkr5LcB+KlP+F9O6dl+Fo32qhPX5sTqZy0eiNRf+iSeDw1Z
	o6rMYQfbX/um2dOINdow1WtRnkX06urrSGS9p/m3uw3tKGYql0qKxKmlQ4rRp8Ds5VcJIv
	i7EDbH/M1lWedBIEHWolk1iXDspWiNjyB8NLqbE4vHRMvGI4UDUA9X0ft/Ixqg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/4] arm64: dts: st: Add UCPD node on stm32mp231
Date: Wed, 19 Aug 2026 18:33:54 +0200
Message-ID: <20260819163410.119755-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093437_644924_89BC1E49 
X-CRM114-Status: GOOD (  10.56  )
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

Add ST UCPD Type-C block node on stm32mp231. The UCPD integrates the
physical layer of the Power Delivery (PD), with CC signaling method,
for operation with Type-C cables. Vbus and Vconn control is performed
using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
The UCPD Rp/Rd resistor trimming values are part of OTP, add the nvmem
subnode and include a phandle to it.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff2..5049e031a38dd 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -715,6 +715,21 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			ucpd: phy@480a0000 {
+				compatible = "st,stm32mp25-ucpd";
+				reg = <0x480a0000 0x1000>;
+				access-controllers = <&rifsc 69>;
+				clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+				clock-names = "apb", "ker";
+				interrupts-extended = <&exti1 46 IRQ_TYPE_LEVEL_HIGH>;
+				nvmem-cells = <&ucpdtrim>;
+				nvmem-cell-names = "trim";
+				power-domains = <&cluster_pd>;
+				resets = <&rcc USBTC_R>;
+				reset-names = "phy";
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
@@ -794,6 +809,11 @@ package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;
 			};
+
+			ucpdtrim: atrim3@1e8 {
+				reg = <0x1e8 0x4>;
+				bits = <4 16>;
+			};
 		};
 
 		rcc: clock-controller@44200000 {
-- 
2.53.0



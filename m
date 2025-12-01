Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A8DD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99bK/6S8l1el6CzlV3pLVtqvBAQomyECv4YA2i3If2k=; b=CehP8SJlpfv1sDIgfoVCSk6EJ5
	jSuINUHYwpCLoJxyT2lZ6Drif20sjFjmDmh0i6G/iXpxvB4oGjKRjgLFrYOk6ZT171Oz29DrT3AGP
	j11HyKevBAkbSDlZmFVXwsR47RM4N48pOuZG0yflfE4qrfhYTbN3wyCNe1SWaZUbkbKuzrPEXPdd/
	81MEv4/g1oCrbGazFC9GiAizSRdZLFBbt9jidyMzcvACVPld2VKwGjo8JbSewgQ1C+LnCxOrs/7Iz
	wHPLikQWkhHAT/99G2MHrYdqy5PoxQffitZ9GmtqsQYftkQMNReipfa4tQBmkKgRXXf4qK6NXAc5W
	ozd+55cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vz-00000003NGG-1WRY;
	Mon, 01 Dec 2025 10:52:19 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vv-00000003NDy-0mpR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:52:17 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=99bK/6S8l1el6CzlV3pLVtqvBAQomyECv4YA2i3If2k=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764586325;
 b=YeFOm/zowy8LvRp/rgugZo4BOE/6RclV2UIG/T1QN5rO+BunBZvIGVrmnjrVkgzyF9Isl2iO
 RKE1RCSiCHmkWPgB//RDuTGLdFdyhNi/gYR5WhgtwDEuor0z+43nkIFv5j60eHosj1/tEe+hV+U
 AsYig1DVl5IJae2X2cHK1RmuE5a2VvN1xgVK1LYV/dL1sKwtJ21bFoR3rPPmNUXvX1C4+XHKHCE
 d2h/mKewlslCtbWDwVK2AK10LGWXq0xA6K8K4ccHbZUVuPJv6mnGMILfjSA9hdUVvSUgd+cGXin
 OzuUl9nW0HZfvliTxX5J3uLFqnnd2g/c2tPz15ehxu9Bg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764586325;
 b=Ij3ohNp4FTZCXs+TdA6ju9quM6VD9VtHGFSJkkBQ5gHNMshe27o0e6WoIfjuEnR3sHPavptH
 JTTHtkb2fxhJH2vg8ULh7ewgaAaNICtUKs84KQfUqBtsJWsolZXXuHBa6Oz+DSy/jNbOvNawD9F
 DwI8isuvy9rAdYnUNOcmOY8aEb9YIOMrWHKYXvBTzXd8v4GGKnj9SowLB7A+XMFqVk7yrYeu6s5
 RsBIE86cUNJ9s3nh7xmnA2axtC10XVOWSa0SZOb5luiX8Ak9hblv5cFNs/X/uQMT5/V/aHbnPX0
 eBHayYAPDl5GgNSkHGjDN7sJjxdwyS2cUfBFdPPNZhHRw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 01 Dec 2025 11:52:05 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 788CBCC0E95;
	Mon,  1 Dec 2025 11:51:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] arm64: dts: ls1088a: Move extirq outside of syscon
Date: Mon,  1 Dec 2025 11:51:42 +0100
Message-ID: <20251201105144.539450-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
References: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dKghD0Brvz1kR2JY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fc74f991ee314d4cb6cc75d1a5d14677
X-cloud-security: scantime:1.858
DKIM-Signature: a=rsa-sha256;
 bh=99bK/6S8l1el6CzlV3pLVtqvBAQomyECv4YA2i3If2k=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764586325; v=1;
 b=gygduS8Rb+YqT0lFxf7A+/O3Mx675WOAnb1Pw9S7wKCpEosdd8MxHgc5wfeT4yDiF6kNrZPD
 7WvDxq345ZLT6ZV0Cuw4L/rc7OU5Sny58cdfYGSFUa0CP/ES97fE7n2SsfGlXSoxTCF/pZELrQj
 xDiQHUDQzWCItEWNsFQf7lTe/ZnSzy8oniW+DGHoFeCJ73sYbHm9OfQ0+6ZOyyM77rUrlHNYDr9
 QCW3RbeR5rNtrsjUvE3eGNm6GJ++hI/im9QKdhzx3LVHYDxS+IXzf90O4QP53kTyKHtPpSM3zo/
 2isSv+67fvE5QB8zbkW5tD6E2qot6NJAyc0yL+Dp3u9Bw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_025215_362066_2E704E42 
X-CRM114-Status: GOOD (  12.03  )
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

To make fsl,ls1088a-extirq a dedicated platform device this needs to
moved outside the syscon node.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index b2f6cd237be04..6eafd86459c7a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -246,28 +246,28 @@ isc: syscon@1f70000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x1f70000 0x10000>;
+		};
 
-			extirq: interrupt-controller@14 {
-				compatible = "fsl,ls1088a-extirq";
-				#interrupt-cells = <2>;
-				#address-cells = <0>;
-				interrupt-controller;
-				reg = <0x14 4>;
-				interrupt-map =
-					<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
-					<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-					<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
-					<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-					<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-					<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-					<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-					<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-					<8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-					<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-					<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-					<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-map-mask = <0xf 0x0>;
-			};
+		extirq: interrupt-controller@1f70014 {
+			compatible = "fsl,ls1088a-extirq";
+			reg = <0x0 0x1f70014 0x0 0x4>;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupt-map =
+				<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				<8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0xf 0x0>;
 		};
 
 		sfp: efuse@1e80000 {
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652E109B475
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yin7QTODeLEANEuaKfncPGh4+OMZRlDs+DysIl//GIU=; b=xXCVdOcPx1j45fYH4oIIRFKWQF
	RU1LCzrcxpEjLuiEIweRFtScwtSuBelbfNvPPn3gvZ+HFHBmpQjqy9WVMCpHc7vu+WSZLxshqLxhV
	53ubWC8hNcfW4Xjdmgw6VyU8RxrQEVzwk9Jun9juvkIar8m6eUHXeNBclqjGZR58pVYDMRnPnSc2n
	aANH8cC02/VuDWHK0DXdyzcgYA+ew++FHFXZS24ceA0+EZcXKr6YS6niw3S2oVAQ3h9g8gyXvr98e
	W2NQtHinCDzF9kw12wevAqZ4ZdF27LFrpfLtzb2Rpfk/EJ043CmTeN413aM2E/VH71+zlTsGKjpX4
	iG0EASvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwX-0000000D4QN-339A;
	Tue, 31 Mar 2026 14:19:45 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwJ-0000000D4Jf-0eYK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yin7QTODeLEANEuaKfncPGh4+OMZRlDs+DysIl//GIU=; b=Rlj+TE5kKpuS0AZr04/VJXkhAa
	WQDSWU1MO6+jcftNj7ERkP5dp3+cWQDZD/K0lTezgS2zW+Bqdgm6tDk63c/oTr7ZjJbPSIPqGXKu7
	ij5+47Fx+hNImV6vbicUdhn7sdq8u2AlFsJqLaxvskGbc171t2Qt+L01qmzC4d855hIhE4oKyXwpF
	Oko+sJrzocvS0V0XIBcPOOhBZc/UXQ1tv84xOJ9EG4vPyxAo8P5eCOkglOE/fmnimSv7tNkPSiuly
	R1h9+QN8ZWREdQDYTwtHFz7TosSAb62B1V7SiM0GXdjQojzvP+PHR59HOazpnde8b5+5qu8S4Kpca
	a2XGnwXg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwD-000JsJ-15;
	Tue, 31 Mar 2026 16:19:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwC-000Mdz-25;
	Tue, 31 Mar 2026 16:19:24 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC instances
Date: Tue, 31 Mar 2026 16:19:04 +0200
Message-ID: <20260331141915.2918927-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_071931_193286_132D0019 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Each TQMX2160A comes with a block of 18 MAC addresses. Define aliases
to allow firmware to statically assign these addresses to the Ethernet
interfaces.

In addition, udev can use these aliases for predicable interface names.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index 89a4765737b4f..5ca950ff908e7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -8,6 +8,27 @@
 #include "fsl-lx2160a.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &dpmac1;
+		ethernet1 = &dpmac2;
+		ethernet2 = &dpmac3;
+		ethernet3 = &dpmac4;
+		ethernet4 = &dpmac5;
+		ethernet5 = &dpmac6;
+		ethernet6 = &dpmac7;
+		ethernet7 = &dpmac8;
+		ethernet8 = &dpmac9;
+		ethernet9 = &dpmac10;
+		ethernet10 = &dpmac11;
+		ethernet11 = &dpmac12;
+		ethernet12 = &dpmac13;
+		ethernet13 = &dpmac14;
+		ethernet14 = &dpmac15;
+		ethernet15 = &dpmac16;
+		ethernet16 = &dpmac17;
+		ethernet17 = &dpmac18;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
-- 
2.43.0



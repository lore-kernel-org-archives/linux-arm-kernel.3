Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1F6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CoJTTc4LifgVvH1iZUJDue9e9zSt7Dnw1uU0HFW4Jnw=; b=iyQfa68msTdnx6FQt/jmYAlhxp
	L5gZgChjcyNwWPXXCrFNfoNpOSfmKtpzrz00VtWLuoN3m4fn8uVNFakmYuIKg44z8NmSBWGZJwM32
	dJgsdAyXOU0bB/Jco9iJgVEXiE6Yogwg/O0SROvt35m+KiZHkMkwESFyBgIfqB2xEdJOKYMgrByAg
	WBtB+Pob62yqmKtMxzWsLcnF1BN9m4nuoW8mSGEw2PtXLLo0qnfrRDWETln9mO7lqRn+DCblTqEGY
	S/k0RsrvN2o2mivlFBBLkZYDCyvaw3vSnbl6seX9rix3P8nYhi/tp1m8uO2yYsX9H7hZU58SC43CA
	CPwxGjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2BT-0000000EX23-05V5;
	Mon, 04 May 2026 22:54:39 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2BQ-0000000EX1I-2RWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:54:37 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cQy53D5z9smc;
	Tue,  5 May 2026 00:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CoJTTc4LifgVvH1iZUJDue9e9zSt7Dnw1uU0HFW4Jnw=;
	b=H9hQAFCgFDBHWoHMU9Di6/x+AmBsnCUGRoJKEaxEIlXEDKLNDJxCmbCqMsdWZluujmIkWa
	6aOFqjzQky9wSjowdkIKBSGMI3MyeaEVUwRWT6x8t9iNfLYxoTlIn8ANBH/Gme3iah2nTg
	JIB2iHwOaBIcw3bm/bIoXEkOzbrqnSTgtNXft5hATCrfP2rgF+AUETJhyNR8ZqQOAhzV+8
	gycB+1q+1dnNC2nvt9V9FPvCDWy8jK4qFCDDAor5PhjDR7NiEx7n6n3yG9OrLlUJYm5QgJ
	92NSCFp7LASEJmwjGLgtdHUb5iRR9fvV9Ro0UQ3Rgh+Z7BFbMESiPoVzU3Ye3g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CoJTTc4LifgVvH1iZUJDue9e9zSt7Dnw1uU0HFW4Jnw=;
	b=Zct78XmZHHRIeg+une4mXPEyiOtapbEQaJpMR9ZLypoHtiFZgmMPtNd9TbeD+Mh/YqPh09
	N+8cUptxTBUbRwM4bzDj0nNQ7Wf0BcAwle72YlgOcj9MTp+B+BiDvv4XmlAx9jJfzA1QXj
	PWUstiBRFy4AwNKsJTb7tFJEYy+/gUZOXm77NNl5LJWMOclFDe8FZaHdmnIeMNycyMEIEd
	f6yRZlMd6+OPN9L0BgIu+jrVWRroL8Cu4ESuIrlPPTdSw0zajRq4j+Yu5YoyKu++IHyzb8
	dwScRUMKm1ZIKoiNjaIVa5eCxX2scCxMYIXsiMKt9aAMV2gMlMDWRAPCjCxf6A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
Date: Tue,  5 May 2026 00:54:11 +0200
Message-ID: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e0f6812975bef9ca280
X-MBO-RS-META: 84iub63huudmao9odd5n1z1htpgr7cpb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155436_764888_688AA62F 
X-CRM114-Status: UNSURE (   9.51  )
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

Trivially fix PHY node alignment. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 2edb5cb3407b4..792a4aa8f4a9d 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -208,11 +208,11 @@ mdio {
 
 		avb0_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id0022.1622",
-				"ethernet-phy-ieee802.3-c22";
-				rxc-skew-ps = <1500>;
-				reg = <0>;
-				interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
-				reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+				     "ethernet-phy-ieee802.3-c22";
+			rxc-skew-ps = <1500>;
+			reg = <0>;
+			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.53.0



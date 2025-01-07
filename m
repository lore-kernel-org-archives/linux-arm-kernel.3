Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F17E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HLrowf87IJ/iEUGNu6amLUT44qNCJHXHBhDTjn+bYFk=; b=gw1RO3CN5j8CNTPUVz5hnairVj
	hXZe7JXn4Sas8bojEQd2eNGqyEb5TE49Pw1JrEHEDpl4d+IT234DzzsD5uaKGspEdskktdDCVQgUf
	bJFndcPAC51VeDPD0FdGXdUafyJwts5lIuveTYTmQrdv6myRoTnQZvocNqdJ6iS4nPPOH9UtukgoE
	ARv/Xc5K+oLYzqYh62uyI3FdQvp6+ZE0kfQ9SxAURqAS8Lvh+iA2z2ixI45t6zkSQ0GCodHb7EgV7
	yCNDAUp0vd+lKyRwlcnPs0QHovTJju4PRmDDITnJFxDqShPzsLe41eoyagohdhP4wYEUZguI2ilnR
	akE/l2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB9f-00000005MJU-31wI;
	Tue, 07 Jan 2025 15:06:03 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB74-00000005LdY-2L63
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736262202; x=1767798202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HLrowf87IJ/iEUGNu6amLUT44qNCJHXHBhDTjn+bYFk=;
  b=d+SDNil8Ue7FhnA8DHhJ4tT0qwcma9RMP6sKfZ8OFPScso5IvTvwcQZU
   ZH0l3qCJ9f0JzIjrVfCdFev+i2OCyUVc5jW5Pbdfj0tyWbqlBIW7pCaja
   yykkFumOih+yr+6K+D7DLOn2kzx5oTawXuU0SjalJTJLlAyDbrf19ETSM
   Zy4+edY5CdIAVLAFVliN9vR9pMPz9IopVpdZNFO8LtAxsjgcrIgpZbtfP
   1BO81MtWo6aFbGcPsyXtHM3jN+zssgb6c1sp4pk2Joc4n6sKU8vhsuOaY
   3HE8Bo1GLW7HAC2W/Wpwh3tXNIaCuMN4OF5AI0Af29mgWInGma8zV7JAg
   w==;
X-CSE-ConnectionGUID: L7Y1DMbKR7uKJg3v5fMTeA==
X-CSE-MsgGUID: xaJUp4jLTxmvxXNJ22QtHA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897904"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 16:03:20 +0100
X-CheckPoint: {677D4238-19-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 007E3B14CC095F732CFAD06DFFD57F2F_2
X-Control-Analysis: str=0001.0A682F23.677D4238.008F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8FAC164C4D;
	Tue,  7 Jan 2025 16:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736262196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HLrowf87IJ/iEUGNu6amLUT44qNCJHXHBhDTjn+bYFk=;
	b=gp73qdS1ahkWqCUZi9RsJYRJikkGMQcM6DY3jXujrNs4fWIOej6/CDqWHy132AmWcQIS0J
	3AA9pZNY2tJTZpSXPbB7nfW2Fe7eW3kCc0hLW0bD7pI9q2+3PWIEH6n8ByqmUL71aCp7IT
	FxyGSEiOYqC/JCZo6hS/dlB6zmALiKKLLtG/d3iPo2zVYSt2JnCZ1u1k5FBxGgZG92hYpF
	mMWned9vd3d9u61Y1f0vW3yawnRlwN3vS9RFSoUiTwCan43xUq2+UQo8DevlLcQK4LFn3+
	7YtCn98XfGvkUj454v7alR3T6dkJ+m2zcXunXWZD4tef7K/1J4cqcB/JsB41Yw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
Date: Tue,  7 Jan 2025 16:03:09 +0100
Message-Id: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_070323_087438_81BDBD4E 
X-CRM114-Status: GOOD (  11.98  )
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

eMMC is supplied by BUCK5 rail. Use the actual regulator instead of
a virtual fixed regulator.

Fixes: 418d1d840e421 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi     | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index e26f996b028b8..2ca87d2f0b590 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 #include "imx8mp.dtsi"
@@ -23,15 +24,6 @@ reg_vcc3v3: regulator-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
-
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
 };
 
 &A53_0 {
@@ -217,7 +209,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&reg_vcc3v3>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897E5C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfXF65VdztcSJTC4kpz1f29TTD70Bhrei46yRBrAXw4=; b=DC81AApgQmNQ0vp0P/o7YOCXui
	gQvyE2GLWwR/IQZAeNgK3ec0r0rCu/91u0tqk7MlS3HXjXXnSVjFdbif0gE3sBYY4ETLzkgCjYgJf
	eMrw5ydWdiYPZbS73eT0KwzftyHbijdK1Qf+l3MD57sn8IjCNktY0aML5+/nm86F6yTBymUKR6IBw
	nIn2loxPFp8w71Z2TcujHCn0YvRB6eUZUVeZuiRIc6A9OAmiu3cYpb2nMIt0AS5HPNvtO1qa3mGgm
	zozRvb2avJkWHERueobuMg3qcDwj8W3jIaf47R5TJji7mzOuKlfcfusgTojeBQkPdxDidtBjIYXFo
	uJAY5dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SO-0000000EfQD-1AjT;
	Tue, 07 Jul 2026 09:51:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SG-0000000EfKW-1GkJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lfXF65VdztcSJTC4kpz1f29TTD70Bhrei46yRBrAXw4=; b=leYrZ0XdDsd561wv1j4ui0tePF
	6FmWBzsnnNNcGElAts5SpSNujWtKEFr3l9cEHFup243iHK+6i8Uz661sS7I1DdVekmv6EOdr7XB72
	JYo1Vqw7GqEIDU4VeStELu6bmNV4bfx5op4mqWhpZMvmu2MjvwBXzggVY2vhd8FkxwQNbRQVmccjO
	91th5xkPrDY0ojuBSr+/oVh41YV7DMzspBWtgbmXz50yRGCZCHPW79zTKz6yLpV9ms6mbEt48PEVg
	2DG4aoyBgZRaklPWsvVH4YAFrHqZFLZCJ6gpUe7Nti4VK9SBdoV9PkSw9omT+uoAs+4GHDUj6tVKf
	RNUuFOGQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000PWc-29;
	Tue, 07 Jul 2026 11:51:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SE-000Ck1-01;
	Tue, 07 Jul 2026 11:51:02 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and pcs_mdio18 in appropriate overlays
Date: Tue,  7 Jul 2026 11:50:52 +0200
Message-ID: <20260707095057.1745867-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025104_345804_A923C2E3 
X-CRM114-Status: GOOD (  10.52  )
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

The pcs_mdio* instances are only needed with phy-connection-type =
"sgmii" and managed = "in-band-status". Move setting status = "okay" for
pcs_mdio17 and pcs_mdio18 to the appropriate overlays, for consistency
with the other pcs_mdio* instances.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts    | 8 --------
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso          | 8 ++++++++
 .../freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso | 8 ++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index 431e4ed2a8b86..46a9fdc92bb56 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -545,14 +545,6 @@ i2c@3 {
 	};
 };
 
-&pcs_mdio17 {
-	status = "okay";
-};
-
-&pcs_mdio18 {
-	status = "okay";
-};
-
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
index 0847c786dc1ca..497ea4ddef3e6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
@@ -59,3 +59,11 @@ &pcs_mdio14 {
 &pcs_mdio16 {
 	status = "okay";
 };
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
index 7520f105d5d8c..a51edef83317f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
@@ -58,6 +58,14 @@ &pcs_mdio16 {
 	status = "okay";
 };
 
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
 &sfp_xfi1 {
 	status = "okay";
 };
-- 
2.54.0



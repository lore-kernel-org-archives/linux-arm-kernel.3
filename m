Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F70C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5vvIPN0i7igeYao9N4kvOMHqVQYE6ooVXn/DKXCct4=; b=M6GmYm0IvsiozbOinNTjWbvyEB
	RjNja72tOxHE0fCvfQQ2VohUEkPk39U45iwSxtHNV1D9LpfOzBnar73T2Slm1I0xepXS9tfYolvOp
	gCJMFedmbb1PQiInzTZZFf5pEmlplJ6aMb2Q3Lr6CO95FvRiXii3LJQmsf3+UdIttj/uRVrFOrbZX
	9tVMRxysJiNUTGy2GcZgugq9mLdEEXWgIyKK0zsvsAaUyPUgMjnHNoju1kFEdV0VQ42rXfWW1IRTy
	qTxWiSZkTBTNebHP87oJwDvwdINA2ypmIy3orRKkSxy6WIvp5iW9J4pUlNvOpDIdMT2l2Gk3L2bbV
	7kgt8SeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SM-0000000EfP5-0GzW;
	Tue, 07 Jul 2026 09:51:10 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SF-0000000EfJz-0wbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=X5vvIPN0i7igeYao9N4kvOMHqVQYE6ooVXn/DKXCct4=; b=Puk+aG877U1c+Gns/FVdFkWPKg
	eDJAtu6RaeHE+FbLhIEo5M07cEmcZPfWE4er4rvf8trBlQsi+TwhzMj6WbWPyRS6PqkftZDe3vU26
	LubWjlWuwMHVLoLYDsj9ITsMQ2ko/SZ5eCe/Ny+5EweFcsrUmQk5Vxlh+D+32H1MBRHMFARFEZB+I
	OQ6R+q+vWSMS77OnK1dsnKpetYffcX8faZUdcspsQwaB1OKqMSmxz++MkV5Q8REaXvjZtC26Qw81W
	cG4gx/GzLCC8xZg/oP1crZWZqB1gML+c7J8DN64VXjjNfTNjVzlKOB78oOdZEayS4Af3R0y4ugT75
	5MS+W0Qg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SD-000PVX-1m;
	Tue, 07 Jul 2026 11:51:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000Ck1-2u;
	Tue, 07 Jul 2026 11:51:01 +0200
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
Subject: [PATCH v2 2/8] arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for SGMII in SERDES2 configs 7 and 11
Date: Tue,  7 Jul 2026 11:50:49 +0200
Message-ID: <20260707095057.1745867-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025103_266340_38350439 
X-CRM114-Status: UNSURE (   9.88  )
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

We have been informed that using DPMAC 17 and 18 for RGMII when SERDES2
is configured to provide SGMII lanes for these MACs is unsupported and
will cause errors in certain DPAA2 configurations. Update these
configurations to use SGMII instead.

The total number of available Gbit Ethernet ports does not change, but
the PHYs and physical ports corresponding to DPMAC 17 and 18 do.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso     | 12 ++++++++++++
 .../fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso      | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
index 6d0c808cd840f..0847c786dc1ca 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso
@@ -32,6 +32,18 @@ &dpmac16 {
 	managed = "in-band-status";
 };
 
+&dpmac17 {
+	phy-handle = <&dp83867_1_2>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
+&dpmac18 {
+	phy-handle = <&dp83867_1_3>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
 &pcs_mdio12 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
index db88a86ff69cd..7520f105d5d8c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso
@@ -30,6 +30,18 @@ &dpmac16 {
 	managed = "in-band-status";
 };
 
+&dpmac17 {
+	phy-handle = <&dp83867_1_2>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
+&dpmac18 {
+	phy-handle = <&dp83867_1_3>;
+	phy-connection-type = "sgmii";
+	managed = "in-band-status";
+};
+
 &pcs_mdio12 {
 	status = "okay";
 };
-- 
2.54.0



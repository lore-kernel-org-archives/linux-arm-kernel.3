Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97738D58CCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=TrMHeW1/GUrI/vcizYD42BYydH
	oh2RSJ284zQvIF/4oCx6N3LiqBl0Fw+ZJFrL3Bgy2GrCP2FV8lExRGx3vXDbSr6vdpsEXFqFigvn+
	dXeVCtu71jeXd0i510GFTI3dBQTYO6XrEdcDhuSMZBNQOqCLJmBvch+ocn1gfAoXLEwT0ZltescaS
	SOhhPYSWZ5uXyUiYGH0nHQL64dlS8JsMuVbAxRYt03TvKuZDMzqlDP3J3iTH5TpSzds/Yrz3iso1Q
	On7SFNFZOYj0VnSW+tr8DdvayVHoiY8UffBRc06h42MApZnrXznSKHAXce2rvWenDGPopwtucMLWg
	LZADxOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50uC-00000001Ngo-28yB;
	Tue, 24 Mar 2026 12:30:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50u3-00000001NZn-0pKb;
	Tue, 24 Mar 2026 12:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=i8UNoNA/hxhadaLGm/d4Fd1G2q
	7j7JO8AiRKHRhHJah+uzxob5FYsJPyJv/uUPCbfxeads49JImor+2fkEXe5IchZEJRbVXvIr9nKKb
	v/u4PtYRFqbFeEq/55oZGvWW1E3o7/gQacHEq/betjnZ2fnVZtBcFkxbWc++bRkVGhvI0WblC1CmN
	UrxdxOqMGtU72ADk4p+vmh5st84pBdjy3mOKFSBUfmXAO+U6GfhyDV9iqfeMP7SXndyNzJ1+ZoGQf
	i3dlyk30C5oxZB3jgVbP98/KnLYjneFZC1u+dKVom9UNaO+d/PbAEmzrzOBqEuoQuFj89jPFG1PlY
	bIkU2hQA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50tz-000000041qP-3yBE;
	Tue, 24 Mar 2026 12:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=L9OxChIfuhMcJbtZretGycJO+z
	JSbzBTUdCha7XnaSzSAiqoFcCDkr+ijHtD8MktLNAkhXIAnlt2HzODXXJZRxMJ8uSYHoPFTtUInq5
	000sJiTlP9o4p+1CURJZzAPGjdTgx1a95cd/aF7PqSjZrvdWqFa9wJpAIQ9QXaaCQEQFQxsXcyWlJ
	cjmh9oFIEy3Dd/unvAeYjTEb9l/HbHY/3I5SHAFj5bBCfylVR6LpY3P2Di37MGy/VdFAvmivyhzdJ
	s9V5pwaZFJXPxk5sit8JRZOBi/XOmE/pGLEJsE0EIx4HysbBREMYkCvQTSYqaZkdVvmpuxevTKlDh
	flE7j8MA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tt-0005r6-1s;
	Tue, 24 Mar 2026 13:30:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tt-000Pna-1M;
	Tue, 24 Mar 2026 13:30:24 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel and CPSW3G
Date: Tue, 24 Mar 2026 13:29:43 +0100
Message-ID: <f978c27ab4ad2b9bd9828ce50be13a72a1b58942.1774354734.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_123032_074303_CD290A50 
X-CRM114-Status: UNSURE (   8.82  )
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

Update WIZ, gmii-sel and CPSW3G to use the J722S-specific compatible
strings, enabling SGMII support. The fallback compatibles preserve
compatibility of the updated Device Trees with older kernels.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 9ee5d0c8ffd1e..70f430aa3a944 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -18,7 +18,7 @@ serdes_refclk: clk-0 {
 
 &cbass_main {
 	serdes_wiz0: phy@f000000 {
-		compatible = "ti,am64-wiz-10g";
+		compatible = "ti,j722s-wiz-10g", "ti,am64-wiz-10g";
 		ranges = <0x0f000000 0x0 0x0f000000 0x00010000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -56,7 +56,7 @@ serdes0: serdes@f000000 {
 	};
 
 	serdes_wiz1: phy@f010000 {
-		compatible = "ti,am64-wiz-10g";
+		compatible = "ti,j722s-wiz-10g", "ti,am64-wiz-10g";
 		ranges = <0x0f010000 0x0 0x0f010000 0x00010000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -451,6 +451,14 @@ pcie0_ctrl: pcie0-ctrl@4070 {
 	};
 };
 
+&cpsw3g {
+	compatible = "ti,j722s-cpsw-nuss", "ti,am642-cpsw-nuss";
+};
+
+&phy_gmii_sel {
+	compatible = "ti,j722s-phy-gmii-sel", "ti,am654-phy-gmii-sel";
+};
+
 &oc_sram {
 	reg = <0x00 0x70000000 0x00 0x40000>;
 	ranges = <0x00 0x00 0x70000000 0x40000>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/



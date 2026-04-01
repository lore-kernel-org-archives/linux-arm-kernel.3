Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F94D3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=fUjDW7T6S7qdXvSr1fBFqhtjFw
	guBoRN5J+K9xmZG/RXI3N7YaPDqtKoh6VhDcGiTGkvoqkZ5baJyLZCOXLTUaNnd2a+ieeSvRtVwey
	0XVR3u+RUZgsAI0vSM3pB8JtJFq0htwwOwuV7pUje6pYkelR1i/RlAxvBKE3XbpKkCspqn+QWU7XS
	ZKeP+vzIQUTr3ovp35ZGITsNAUsD7ZvHfvcXn8zArEVVk1nf9os6YACZtThUyVen2g849M1dWpIko
	M/v4Q9PvP1Rhv1uAGtvaiVb0u+U68WT9HYgCBcO8To5iJSUJ96WT1ck8Sw8bBNTghU/SQyyc3sVzV
	Ah5K1mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upl-0000000FCcV-3V9T;
	Wed, 01 Apr 2026 12:38:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ueC-0000000F3pc-0mVK;
	Wed, 01 Apr 2026 12:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=CzE1+RiJp9owbRT7QzmuT74XRc
	f3l7KfeC17N5ABlVGcu4tCeuTkIELfjQT75H+8Rzh74XI2uoG0Eyp4Zcxl6zX8v7Rp3dMwKETbpDe
	T1OavuDk04eE/BaFhnkgBnbp2W2mzoV2yFNX0r69epFcbYDG4HdDb5N6grYZGTlT1WVMi02wjBSX8
	/zRYyrbMF57OYYpM5LFhfwDQUO8PoOfdbR9Fdj61MVnwHP1WWK0rVGCpnNrfWIFxMoqFn186icv63
	c13zwu21J9NzNfzM9WiklIMa97mkfVGh0qzLEqJMEpB1XVzxkL15Sk4PiPUaHq63LLFN+aJa0VUnm
	MS6fu4Kw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ue7-00000000Kts-1NXK;
	Wed, 01 Apr 2026 12:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=cY/aMbdtyM7606X2A+IiHSBqXd
	Gx1sHTKTaYJDjkJRa+JgRFvk/dUSEYTeNJbzFdV6Pfy/0gFTKq1l8yHFL+rN+YuaqLlCn+YLXjL5N
	3wexm59ZPQjxoWswaGfuyiybwJekliqtE2RQXPK4URSmkJW1H33stARljCt4FjYwAEpAwhzYTCrS8
	z9HtTjX//SRyMXBKnFS9QUgpngFo6haEyF28w2froKsDDJMzg3k9F5Fvm6QKjS9me8uFAg08QhioA
	+oKadGNiQqS3ETWLLkOnQTn8oyrxbfYZNCY+5T0cYAMJQJszlI/5qHN8IOj7CNJlkZvxMwhZSA6J0
	pCTApuWw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue5-000IRC-1N;
	Wed, 01 Apr 2026 14:26:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue4-00089b-35;
	Wed, 01 Apr 2026 14:26:04 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 5/5] arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel and CPSW3G
Date: Wed,  1 Apr 2026 14:25:25 +0200
Message-ID: <55607ba1ca2bcf5c60a7d1e3c88fd20053a8be5c.1775045279.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
References: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_132607_511264_20C7BD88 
X-CRM114-Status: UNSURE (   9.35  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3899F106FD92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M94y6ilQsc8nLgZ5GB5cv6AO62Bh3J+z1BgOUeMqnI=; b=M6oHVYskPaMsN+alrfvOvERMiE
	nvX1c9ugtJyW635haane6dEpszt1hdhGbjP9CN8HCVXyyc1pR1PF+ARK7zq1IbG/lkMITvaTDOfUw
	2oCGF30TI2nLoEah+iryE18N1fk3RsrQ3aM5iERs7Mt4elp+GcsmWK9FPQMePoH2XHDoy1Ohi/6Qi
	PgTZIK8k4u6Ym7v6AIfcawK8XCkYPqTEzB5PD5rljF8ePKWBGoYKQEqOjgYDDgIkLHP3AT5SZZLA7
	B3KU1BHez/RBxeq3Awc5p7ZzFztTAU3CB+s0yo0cRPqZdfeZI+I4EtNN16eGay6Yqieg7L9EQTvHJ
	E3165VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfR-0000000GzH8-3yCy;
	Fri, 13 Mar 2026 07:10:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfM-0000000GzD7-0VJ9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7M94y6ilQsc8nLgZ5GB5cv6AO62Bh3J+z1BgOUeMqnI=; b=GWuSUL9FoQq5/4kNhM3VFJe5Jy
	Ap+JAu6VYZVe2ZtyI+tiY4Nq9/SZunrHM0/BTj+5KfZ8gsTDwIorJ58iKfj1NoqsViZMsmiif6yZD
	q2Ix3ev1GC2Fba5cMetVkv2WUpTbYwezrGUIxmgf5kIFDnRmvu6uSwUJWh/AOfqHa4DXkEBDQujRO
	YHG3wtom5woYsD5/TkmJe0WdKUN2jazf9nkly7EVSANVLqAZFZY+f1iSkw4uF8GIKgKOD/toVZsK1
	bAORC1MvlpIljzHw2oUcYrhvs1bnrog9hG2FlWoaXs/P/Aiw0ufS7I3bepUlBjKZp/RE+UeEwx2IV
	+x+GACPg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfI-00000002jDI-2p4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7M94y6ilQsc8nLgZ5GB5cv6AO62Bh3J+z1BgOUeMqnI=; b=NYOlbBWYGx3P2OykMDnYF9KrhF
	Hjg298j+nAt8JKwoGfm86xCqFwCgR9NGHLVZzovikXB46phEN7SQ965Uy/4O6m1D/W48KU5XfhZdq
	plSfYUjAzkHqoxoTiuMkuUi0w28X39RcjyrlEhQaesgLL3VCkFDwvWTLOZTesbtCr/dAN6Js6J/3U
	fFpFSZnKd0B1cjOJVRYv/VKBAqyO2jBivmDniSZSURViaBoYANtezIo2l4B3lKLqUNCVNbBuNkLas
	KKQWjzsyvWmX7cBbFDfCbkRJUhf3chtyv+rSDqsOiIomxb+UC6e3c+YiKwwLz5EOdNligZpPoHbms
	ssioTG8g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfH-000D1H-2y;
	Fri, 13 Mar 2026 08:10:31 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfH-000Eou-1L;
	Fri, 13 Mar 2026 08:10:31 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx8mn-tqma8mqnl-mba8mx: LVDS overlay: LVDS overlay: Reduce DSI burst clock to 600Mhz
Date: Fri, 13 Mar 2026 08:10:25 +0100
Message-ID: <20260313071027.587992-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
References: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071033_284222_F09918F1 
X-CRM114-Status: GOOD (  10.35  )
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

The DSI burst clock frequency is too high resulting in flickering. Reduce
the frequency.
While at it, remove the burst clock from board configuration as it is
display specific.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improve commit message and fix typo

 .../dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso  | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts        | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
index 0f4cf1855bf3a..046399a455ba1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
@@ -32,6 +32,7 @@ &lcdif {
 };
 
 &mipi_dsi {
+	samsung,burst-clock-frequency = <600000000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index 664f4a6950a82..01d565cdbfea0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -65,7 +65,6 @@ expander2: gpio@27 {
 };
 
 &mipi_dsi {
-	samsung,burst-clock-frequency = <891000000>;
 	samsung,esc-clock-frequency = <20000000>;
 };
 
-- 
2.43.0



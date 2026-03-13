Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC73106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUvP+PLVODb+ieOKtek0pZZYyg9UhY5kr3fWr/Wlssk=; b=zomSfds7aY6Cd8hkBDjXsJsozx
	JXsssRvRi7dEfTkfXTjY/HF1Ft3EA5Uk5aK3afnGDHEnVoAuBv1OdzJRWbnsol5WvYvzaImZkzlDU
	BSEHlR/mVjg7RHKi+zJTstehobgEuBbIVFWbyrYP77V35LFlW4hqrJKNijQ00auYIAbqw7+myrs0z
	Qat+pzm9ZJTVUSytMOe58Hu9/7FFkQA2IR0I4WLnD4r0t33sEKKkcAHbd+vG9wM1DnM4tp6lXjiUS
	4FzCL6u8Kqe7CnG7fca5fmemNaUKZmdTVCNVyTdTp7hCyTSUWZugpCUnh7v1G/8uZm5Wgke3/+Wj4
	B+KHvMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfM-0000000GzDZ-06AT;
	Fri, 13 Mar 2026 07:10:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfK-0000000GzCJ-1plC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RUvP+PLVODb+ieOKtek0pZZYyg9UhY5kr3fWr/Wlssk=; b=He4cE+BZUGUQ1FEqH/w9kpQhhu
	gdjw6UnYDovQyUAq8PiYWVpWo5MazYtkmgp6t1B4PmT/MrvuPqQuHDXJ03xINqBLw08omrxehlnL8
	WPzO27z1B1/XL/HlneOtaBA7wE8CkgJ52PBJPVYyCTn6AafCQVlxBqaQ7uaYF4kax5SiNyBP9wtAd
	LSGrJtCSSNL3JfJzywj8Zv6LUFTpjs7wjaIFjvp8E5Mh7Mj6hF/xzxkyXND/MSuDIk48v03KvgrYf
	GbdrqJzbAG/7BVpyO/TuGR6eMyd70XWCM/JFTqmvp8wyMqmFQNuB+1r1fLRJRX+CSMFX/FqXsUOa0
	QXyi/qzQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wfG-00000002jD2-1mZX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RUvP+PLVODb+ieOKtek0pZZYyg9UhY5kr3fWr/Wlssk=; b=Vwa8XHAsYt2p3Nlf4ZAfxZSjec
	sXXWaxButbpQ1XPmpw6glWoWj0lRdHtSlPpDACL/LMdCHveB9hd9PeEHA+l7DoUCiNr/idXpJaQvt
	YHVm43KZAHQHzPXeeDKDE5PajYQQqvj1nO3IojrZjKlEIgPoiSoSEpVYsUahrS+VY4+Y2LuTdWNd5
	j5+C+dlNyvQK7AGif6stLCPAou8Xh4PEmnRQh31rWOGeH6AphXK7Z/1Quute7TXzlee3dcsi+owH+
	IsKRmwr+og2x+1LOqezMJ93XU5/c7GIMYAVu3S+Iw8sNc0j5mtgGpE4RIkRS48ZIUBCfwPfOTQuS5
	oPaCs7Tg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfF-000D0x-3D;
	Fri, 13 Mar 2026 08:10:30 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfF-000Eou-1Y;
	Fri, 13 Mar 2026 08:10:29 +0100
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
Subject: [PATCH v2 1/3] arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
Date: Fri, 13 Mar 2026 08:10:23 +0100
Message-ID: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071030_779729_952C6E3F 
X-CRM114-Status: UNSURE (   8.46  )
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

Since commits a0deedcc0cf0 ("arm64: dts: imx8mm: Slow default video_pll1
clock rate") and 5fe6ec93f10b0 ("clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL
set parent rate") VIDEO_PLL1 is dynamically programmed by CLK_LCDIF_PIXEL.
On imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso this results in a
VIDEO_PLL1 frequency of 68.2 MHz and DSI_PHY_REF of 17.05MHz (1/4).
Instead use the 24 MHz clock as parent for DSI PHY reference clock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f2e1854f38a0a..eb23ca27e8597 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1149,8 +1149,10 @@ mipi_dsi: dsi@32e10000 {
 				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
 					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
 				clock-names = "bus_clk", "sclk_mipi";
-				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>;
+				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+							 <&clk IMX8MM_CLK_24M>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
 				status = "disabled";
-- 
2.43.0



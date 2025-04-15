Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DF5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 04:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBrqu8dawpFRxkYx/IpqliKF5Jg80VJRWxrBs1j8g9I=; b=ksSg8NNZwuPTq1VRy4hG/P5hxL
	4j3XIfsaqJHyklSkIkGUqBrS2puSWJISVK9RnKFjINzFhRTK3bleZNt2v8QWzBcUNcTXbnsYChRXw
	Vs5TMq0vzu02rNhsi2OPpH38RHDq0war5jsLVbLDJuw0vSlK0F9urR8pjrDTgug6rY6iD44GETdeW
	cOXw19CnVwI2ZEDkGW4RZLdg5/X2KosomdYLJuMjViuNoZD2V73MCio8GjCotJoDz5mUoVNTFzpPE
	idtF9ahX9CPqZGNqdQv/JIbHgM8bpd8Hy5CphmReqHHBBCITHLdTly6M17sDnatEyRuukOQeRAeaQ
	2GebruZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YO9-00000004V8n-3uuG;
	Tue, 15 Apr 2025 04:59:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4XzK-00000004Rp7-08YN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 04:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zBrqu8dawpFRxkYx/IpqliKF5Jg80VJRWxrBs1j8g9I=; b=Eyq/VSMfFmS2M+2SYaCGXwyMOZ
	EaTZ5hfetRcUZAIu1n2shXM0YZyafXbMOl9g0RkwKzwlpPlbat1/NRCHKkB7VFx+gccT3FInfJvFu
	gfOZ3c8B2meUHnUU2jL0MQLpjBX9FzjWNwpaBcWf6dZnp8gwbIChnMYp19n6jCZE0IUpFiPnrXP2R
	lMRAb9SKMP0B0IFGWtAohp60I7rPcY56p3sZbgYUSn2mVACqe9n2HxgUkjUdYzubsszpVgDDjlVvA
	H1gWoXg3CCNuhE4TR1VZJGn5o+CK/goWVfudDH+XHH5srVJDqqh/tnefpyRUxMNgoPDyLtkgPnDTe
	Ilzk6cnw==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4XzF-00000009omG-2cEl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:33:32 +0000
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4XzA-00Gb4I-2e;
	Tue, 15 Apr 2025 06:33:24 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 12/15] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Tue, 15 Apr 2025 06:33:08 +0200
Message-Id: <20250415043311.3385835-13-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053331_163214_C231F31B 
X-CRM114-Status: UNSURE (   7.02  )
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

Add support for both USB controllers. Set first controller in OTG mode
(USB micro-AB connector X8) and the second one in host mode (USB type A
connector X7) by default.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit message

 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index be9c0a436734..e4f959f665b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -80,6 +80,19 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* USB  */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1



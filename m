Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CDC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqCgdIXnolt8Hj+M/Rl5lA7jVTUYjukkdEEU4Hoad3o=; b=HpHOyxdT7nfzryl20hEdp8iJMS
	cGxIxbOz0OEL50OBFL3FIizTK/+5/qOkN3I1ahzdj8XMTDYWKXiFAkb3zoI3hVi5MXAHPxE/YcKEs
	/rHLZFim2oQY/kfKGgOzpWxdkiLppbA8lVkgzHpbugejNyqr5ep7nT/AxGPvS9JJ61Gz9CVM+8eZA
	O0cOow+ZdzXCm6MapIp1h8AHt8XwbR3s+zNIdNqjEEJKf39k9eq3/eoMoGhUMfQFJXrvv6qy+tGAJ
	mNYgztpwQLF5wzA6TZF25Ui80lNJJh2of0mlmElG+gfFBFHx2TAF3VoMfjUv9L0oiJPg07ec0gsb7
	zk1dMMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL93-00000002gNR-3Yah;
	Mon, 14 Jul 2025 15:31:09 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2X-00000002SIF-14mn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51936C7540;
	Mon, 14 Jul 2025 16:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502819; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PqCgdIXnolt8Hj+M/Rl5lA7jVTUYjukkdEEU4Hoad3o=;
	b=MDRIbgDoFShISqNquPaYVdV1sGz4UgwFtQPFjZbRn3ViAmy6hjPXHQqIEha9PwNfx5iOzD
	HMuUUBaxpOOvkLjOP/JErUleE7RqDOOvCr6h46ufMm46/1AM6DM1vfjlcelnsfg+hHMJco
	iJlSePid4D0voOTmmcwZpD+xZgsIPlzQpq7pRtLm5a3BCifunuTBUJmLjVZbjGe5AfI52k
	GNVC18qP2+6mZMB33jsMDKETeLLf+zWU8Fo+Hbp285hcu934XqRMx9h3tISXPE2La0LMJJ
	um3JrBsHlSIQqBMM/4hAZ1SNiMCN6MCuXfCtdRyGZ8WnQjjh0Kj4MKHnrQHHMA==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Oualid Derouiche <oualid.derouiche@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 04/12] arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL devicetree
Date: Mon, 14 Jul 2025 16:17:30 +0200
Message-ID: <20250714141852.116455-5-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072021_445897_3A085DED 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Some new panels have the Sitronix touch instead of Goodix. Support them
by adding a node for the new controller. The bootloader needs to detect
the correct controller and enable/disable the nodes accordingly.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
index 1db27731b581c..5682ea9c5c7f7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
@@ -117,6 +117,17 @@ touchscreen@5d {
 		reset-gpios = <&gpio3 23 0>;
 		irq-gpios = <&gpio3 22 0>;
 	};
+
+	st1633@55 {
+		compatible = "sitronix,st1633";
+		reg = <0x55>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupts = <22 8>;
+		interrupt-parent = <&gpio3>;
+		gpios = <&gpio3 22 0>;
+		status = "disabled";
+	};
 };
 
 &lvds {
-- 
2.50.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD3CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htwcYAHQIOqaxElDjDYg+njAl/ofitRP9nvq1PHSWrQ=; b=r30WHnCRliynEoHvHj5WCP0v5Z
	KLQaj/plNut80or+88XG1iIj1OIaWFbRtELdlR/tzxwGGoN1MZmehwg1cRZXCkn5DtcyWRFYWs/oR
	dWlJ560gjPP+N/57wJlEzV2j7qIYS9/yCI7WCiigccEpnLiSEjKaDeT19Yxr41wjAqT/ulrForuXN
	RG04K37I1j6fs96itVf0ESlaXsVglUPnv6YGtoI40cEHR8evcgzvDjECHgOj9dOUFw1xWS4u9MjMn
	Z5ArYi4ETxYY8VSpRoY4TRDIFF/na2x+tRmhYCYpif9pS937RwlNynYoHsskDgzELpdXPaNwTH410
	BaTqRmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx12-0000000DpjI-0Dvo;
	Mon, 04 May 2026 17:23:32 +0000
Received: from [2a03:4000:b:d08:14a9:1bff:fedc:75ad] (helo=mail.kernel-space.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx0y-0000000Dpd7-3aB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1777915006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htwcYAHQIOqaxElDjDYg+njAl/ofitRP9nvq1PHSWrQ=;
	b=AdIGNAC/f8eX5Nk4/DYRKJ47wDOaG5+Tm6BE7r0ce9U566IdBy2yLs6p8pj3MvelWbnPLz
	7Eok+5yzAdilxJ2cWdXWxP3de5HbS4RP7rcRyCLLUWkjYv8xQ2o6d/rSHkh1zxK0TP8xd/
	4Dj3Hvu8ShfBwj6Cyg9g7ZITiB/Q0Jw=
Received: from [192.168.0.2] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 2d248f23 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 4 May 2026 17:16:46 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
Date: Mon, 04 May 2026 19:16:46 +0200
Subject: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
In-Reply-To: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_102329_210285_1C5D9129 
X-CRM114-Status: GOOD (  10.13  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/stmark2.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 85502b81175e..30da9bcbfd63 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dspi_dac0_resource[] = {
+	[0] = {
+		.start = MCFDAC_BASE0,
+		.end   = MCFDAC_BASE0 + 0xFF,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+/* DAC controller, id = bus number */
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dspi_dac0_resource),
+	.resource = dspi_dac0_resource,
+};
+
+static struct resource dspi_dac1_resource[] = {
+	[0] = {
+		.start = MCFDAC_BASE1,
+		.end   = MCFDAC_BASE1 + 0xFF,
+		.flags = IORESOURCE_MEM,
+	},
+};
+
+/* DAC controller, id = bus number */
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dspi_dac1_resource),
+	.resource = dspi_dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0



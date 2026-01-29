Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E914AD358F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3pgM6avLqsCtrGK80NsdaWmYzCzxVsls3CgWCMhqdM=; b=P25aZTLLx//JxRaCQHhI4TVwE4
	O/l3g79UV6zMGHGDVcVGNhy+4AJUIfj4P3FE8wJ6YWVXkr8mKi034TKgnRrxm3GW1Izrke7eklqGl
	hyl9PmyjaLUI2t859HpqD/PDTRTpmCjBBBh3TR+4WSdNFqJQW/9v/6qDZtIIga9QXRAKswC5YBnQr
	RwrEyyMadb07ubLu3cp/wYGw6waRQkv2rR7LuPFM1WNMPNJ7W3gSyUrVq83C+i34iqOY8dvYr3UM/
	vCdJ7/fEaCmdACuAVkJ1B0LmirYUegGQ9CMrV1hLRawfwAZDwAF/fhKmIhA7l8pMNLY9ncSKu4ekh
	vv0G4+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOkB-0000000HXW1-46u5;
	Thu, 29 Jan 2026 09:55:19 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOk2-0000000HXQy-3KYK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:55:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 627CC10E738;
	Thu, 29 Jan 2026 10:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680502; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3pgM6avLqsCtrGK80NsdaWmYzCzxVsls3CgWCMhqdM=;
	b=JCuUXI5LhJvz3XA3QtFZ92Wk2jd4+yJtK2ZWn+UWPC95107rElRbberBdr1cvRzOJCv/N7
	odMfZ5VGzRCynomjSyRoW70z/oi0kVj5aQt/8nUtUL6SwpEWtPge/GSeXotmrUqDnlMfru
	OkoQUc5w7MchZkwrZIkiJRGUuV19vCea5wCamBszOxwGl357E2aEIHoS4uoUhY7QO6l1kn
	zXm/KuPg2wSaxWkCyTnZ77SwpmQIq07goAvvnHJS8VAwcqE6qav3VdZFc4dI+zsMgtqAjn
	JQBOf5CsKGOTIXud6lwzw2VgdmJYwJZGg/TSk6QINYOdO1FHS3epjspblXOYjg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 1/4] clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
Date: Thu, 29 Jan 2026 10:54:39 +0100
Message-Id: <20260129095442.1646748-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_015510_989676_E478DAD0 
X-CRM114-Status: GOOD (  11.14  )
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

The VF610_CLK_END was previously defined in vf610-clock.h to indicate
the number of clocks.

It is solely used in the clk driver to allocate proper size of the clk
table.

Moreover, when new clocks (like e.g. ones for MTIP L2 switch) are defined
its value also changes, so it shall be locally adjusted.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v4:
- Separate patch
- Add comment regarding value of VF610_CLK_END
---
 drivers/clk/imx/clk-vf610.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..457156944c67 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -11,6 +11,13 @@
 
 #include "clk.h"
 
+/*
+ * The VF610_CLK_END corresponds to ones defined in
+ * include/dt-bindings/clock/vf610-clock.h
+ * It shall be the value of the last defined clock +1
+ */
+#define VF610_CLK_END 191
+
 #define CCM_CCR			(ccm_base + 0x00)
 #define CCM_CSR			(ccm_base + 0x04)
 #define CCM_CCSR		(ccm_base + 0x08)
-- 
2.39.5



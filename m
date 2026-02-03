Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF00E8304A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eficn5SUDprprqXIyWY8ZmcbLH8EHfhxDKGE8oULaPk=; b=k9mPBQAV7pw2TZZ4fTB/yivU29
	epOG0jwzwI3W6AFIh6J04gxhuuWthO+YApIQoZiKV1gT/DE+kWvtrFgGMIJekbnj3//Skeen88GsF
	bJxQFZISeDJ89+8W3n30usK0hsoxsIi+gM9utss3GDM2htnfdpZ/t2kYCuMpEWUeUoau6DS57XJMu
	Rw3OJKW4e84/Yls751klT0O+p34JlhRvdaJ8hWW0ks0V8GueNx7fHbQhbZ4wwY0fzkjjqr8gWhQf6
	Gc9wg0yd6w/hwVUJ+6H8OIoaPJiiBJD3QUGM/DOFFR9PskJOemlahLyNkwuoOz3wRjG7RP1ggluTM
	EO3KhmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7Vj-000000062Aj-2awN;
	Tue, 03 Feb 2026 03:55:31 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7Vb-0000000627o-0Ug0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:55:30 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Feb
 2026 11:55:11 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Feb 2026 11:55:11 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Tue, 3 Feb 2026 11:55:09 +0800
Subject: [PATCH 2/2] soc: aspeed: uart-routing: Add AST27xx dual node
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uart_routing-v1-2-6bd5dd75ee3b@aspeedtech.com>
References: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
In-Reply-To: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Oskar
 Senft" <osk@google.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jammy Huang
	<jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770090911; l=12415;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=C+gKHTXPGEeSoSOHR1iwE6giVzW3rWmmmHtDD/QYRfU=;
 b=fZlFakSoNkWt98SJsU/kor2vLlCtWPDjRhDRsuZ0UkZIDIg9I/UzrLDx/WWAIVs7xDPa/K+ST
 Db8fOKbX5i+BykSeIS6I9iVQ64Yh8PcN4369URfifXi6ScstLnQCa4v
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_195529_489357_E2D3DC59 
X-CRM114-Status: GOOD (  10.46  )
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

From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Add dual node support for AST27xx SoCs.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/soc/aspeed/aspeed-uart-routing.c | 424 +++++++++++++++++++++++++++++++
 1 file changed, 424 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index 0191e36e66..9b648f5a1b 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -15,20 +15,30 @@
 #define HICRA	0x9c
 
 /* attributes options */
+#define UART_ROUTING_IO0	"io0"
 #define UART_ROUTING_IO1	"io1"
 #define UART_ROUTING_IO2	"io2"
 #define UART_ROUTING_IO3	"io3"
 #define UART_ROUTING_IO4	"io4"
 #define UART_ROUTING_IO5	"io5"
 #define UART_ROUTING_IO6	"io6"
+#define UART_ROUTING_IO7	"io7"
+#define UART_ROUTING_IO8	"io8"
+#define UART_ROUTING_IO9	"io9"
 #define UART_ROUTING_IO10	"io10"
+#define UART_ROUTING_IO12	"io12"
+#define UART_ROUTING_UART0	"uart0"
 #define UART_ROUTING_UART1	"uart1"
 #define UART_ROUTING_UART2	"uart2"
 #define UART_ROUTING_UART3	"uart3"
 #define UART_ROUTING_UART4	"uart4"
 #define UART_ROUTING_UART5	"uart5"
 #define UART_ROUTING_UART6	"uart6"
+#define UART_ROUTING_UART7	"uart7"
+#define UART_ROUTING_UART8	"uart8"
+#define UART_ROUTING_UART9	"uart9"
 #define UART_ROUTING_UART10	"uart10"
+#define UART_ROUTING_UART12	"uart12"
 #define UART_ROUTING_RES	"reserved"
 
 struct aspeed_uart_routing {
@@ -488,6 +498,416 @@ static const struct attribute_group ast2600_uart_routing_attr_group = {
 	.attrs = ast2600_uart_routing_attrs,
 };
 
+/* routing selector for AST27xx node 0 */
+static struct aspeed_uart_routing_selector ast2700n0_uart9_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART9),
+	.reg = HICR9,
+	.shift = 12,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO9,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART12,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_io9_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO9),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART12,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_uart3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO9,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_uart2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_uart1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_uart0_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART0),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_io3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART9,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_io2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART9,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO0,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_io1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART9,
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n0_io0_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO0),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART0,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART9,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO9,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2700n0_uart_routing_attrs[] = {
+	&ast2700n0_uart9_sel.dev_attr.attr,
+	&ast2700n0_io9_sel.dev_attr.attr,
+	&ast2700n0_uart3_sel.dev_attr.attr,
+	&ast2700n0_uart2_sel.dev_attr.attr,
+	&ast2700n0_uart1_sel.dev_attr.attr,
+	&ast2700n0_uart0_sel.dev_attr.attr,
+	&ast2700n0_io3_sel.dev_attr.attr,
+	&ast2700n0_io2_sel.dev_attr.attr,
+	&ast2700n0_io1_sel.dev_attr.attr,
+	&ast2700n0_io0_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2700n0_uart_routing_attr_group = {
+	.attrs = ast2700n0_uart_routing_attrs,
+};
+
+/* routing selector for AST27xx node 1 */
+static struct aspeed_uart_routing_selector ast2700n1_uart10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART10),
+	.reg = HICR9,
+	.shift = 12,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO10,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART12,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_io10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO10),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART12,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_uart8_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART8),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_IO10,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_uart7_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART7),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_uart6_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART6),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_uart5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART5),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_io8_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO8),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_io7_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO7),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO6,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_io6_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO6),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2700n1_io5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO5),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART6,
+		    UART_ROUTING_UART7,
+		    UART_ROUTING_UART8,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_IO7,
+		    UART_ROUTING_IO8,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2700n1_uart_routing_attrs[] = {
+	&ast2700n1_uart10_sel.dev_attr.attr,
+	&ast2700n1_io10_sel.dev_attr.attr,
+	&ast2700n1_uart8_sel.dev_attr.attr,
+	&ast2700n1_uart7_sel.dev_attr.attr,
+	&ast2700n1_uart6_sel.dev_attr.attr,
+	&ast2700n1_uart5_sel.dev_attr.attr,
+	&ast2700n1_io8_sel.dev_attr.attr,
+	&ast2700n1_io7_sel.dev_attr.attr,
+	&ast2700n1_io6_sel.dev_attr.attr,
+	&ast2700n1_io5_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2700n1_uart_routing_attr_group = {
+	.attrs = ast2700n1_uart_routing_attrs,
+};
+
 static ssize_t aspeed_uart_routing_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -580,6 +1000,10 @@ static const struct of_device_id aspeed_uart_routing_table[] = {
 	  .data = &ast2500_uart_routing_attr_group },
 	{ .compatible = "aspeed,ast2600-uart-routing",
 	  .data = &ast2600_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2700n0-uart-routing",
+	  .data = &ast2700n0_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2700n1-uart-routing",
+	  .data = &ast2700n1_uart_routing_attr_group },
 	{ },
 };
 

-- 
2.34.1



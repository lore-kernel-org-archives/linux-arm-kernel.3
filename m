Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CD6CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sepzVr7nrgpA5EsitZmOH/K5pNYxCBWC0wVtKkdKrB8=; b=tVhwZZ6wWIuHnLGP7lIg9c8Sax
	lNio1LqF+8qm1/+LzSwA0Khd9nEClqzXAISRXtveEdk6brw0jNxNhjYiQqsIJCbQD68+MWpHHpAqr
	pBxwwp1eJUeBG3W2qXi8AXadBokIJivb3NMCSCzzErsiKFVF9GAMbQM+0LV75uT+IKNZCWp1uVC+w
	flGMTwMCzNbgIdNYbHLhbUyl6sp1CZclLeRyy8L3moG3UbMwz1u/2Al9MUlIuenm3OZHIA0YZQ1hj
	/6lo6EkcBWlI73JFOShJ35ykYmunNjUZ7hEmyotnqlr+3H/ZmF8C6PMykJsVCFhBO16nK07H0/DTM
	9qAFgU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImFj-00000007MH0-3zAS;
	Mon, 19 Oct 2026 12:14:07 +0000
Received: from mail-westeuropeazon11010054.outbound.protection.outlook.com ([52.101.69.54] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImFh-00000007MFa-2ntC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvrrsJ+4i2MfJhNJY5HznyYbGY1EEQQbJoW8syEOsETpgkF3XvOnSpW8LgyBp3kKrIxmD/7zYBvBDv158aTwugnsENKZ5QtGUoWvbeXyD/JytQnV6N9Py+i3InyWWRxws2YHuVTW1h/Q8Du1Uqdc+APg7dqbpn0H6hHDo0V+K1nGs58dhizkMPX7JmT9nmrZa8rmIKPSLDbzqw7PA2sl5Oc1xzZO35dx8iu54loPsC3eg+EwSRsuJz0kKvuHAD3o7WjJH7TtkPT51wRtHzSMhVa4EM1nTxD2t3X6FBSbE03xJOEP4X0mjrlOJqwnKm0qP4xKTBrvT4SpCFVIlRXnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sepzVr7nrgpA5EsitZmOH/K5pNYxCBWC0wVtKkdKrB8=;
 b=lxcsSoCPt7TQy4YJVMSqDk8LCVXxGTJZwRLQe0zPH9yTGh0uUkXUiKZNtH5m7lm+IMNzYHEj2iJpSJm1U1+C0wZb583VzEW9heAf7mn5kvO+I310gV8SZt9Laeffpwb2au2DSahLYWtYwYPUriquqrAS5UamXSvQG9kHnv99ZMig3UssVzd0vH+TFuWuflQNGe9hUE1MOAubhai+cH5BFmOeNEKFQNOTfQRZ+F4cOl4H/w44AveghrncT/h7jVOpJjputF5SWbpOsIlP4+l2bvSWRl4ej+MecSPnULLmVuk0RHyMwbg3JajHv8bp6Y2IzjYS0qsF3DdspXHQRwI+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sepzVr7nrgpA5EsitZmOH/K5pNYxCBWC0wVtKkdKrB8=;
 b=cRl/OsFfItltPeuYMiki+K0t9DK3b6HrKSvgM03vQhrI6IMzbW8J1ldL6lc/TmJn7qRAnvhPNtSokhTzhiKotjcQclGwUAqgDScSRTPAu87cbkmUbY4K2sO5CstkBaC2Rv0rWiZ5v+moyRJfYsyKnE/J7Hqa1s9EpocgMu7ly3iOgsIT5SdQYnDX86vFH5tcQltCS1Z/ZeudaYSNcwcwH54nF9jJSm9JkwepcCLOW01OtLnv9j6GkZejJA3g/9KFXPA+PFVBCM+jN+qA6IZDzOsABIUhXpDBm6GVLns2v5M1BvuRr6bWVexCy5aTQHoPbRJJfm9CzWXlU99DlSWR3Q==
Received: from AS4P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::9)
 by CPJPR10MB947795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:380:10::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:13:59 +0000
Received: from AMS1EPF00000097.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::1) by AS4P192CA0023.outlook.office365.com
 (2603:10a6:20b:5e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 12:13:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000097.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:13:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 19 Oct
 2026 14:14:17 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 19 Oct
 2026 14:13:58 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Mon, 19 Oct 2026 14:13:58 +0200
Subject: [PATCH v2] clk: stm32: add support for reset_control_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261019-ups_reset_control_reset-v2-1-be4ccf511cbb@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIUJ1moC/4XNUQ6CMBAE0KuQ/bakWwwSv7wHIQSXrTRRSrq10
 RDubsUD+PkmmZkVhINjgXOxQuDkxPk5wxwKoGmYb6zcmA1Gmxo1Vuq5SB9YOPbk5xj8/Sd1JGP
 xqptxtAi5vQS27rUvt1325CT68N6PEn7T/5sJFSrbDDWdbE1U0cV6kVJiSf4B3bZtH+Md/VfAA
 AAA
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792412038; l=2469;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=LU5nImmjKs0iTUGLeucW2SKzxw38mrTBcc9ZzLnb7K4=;
 b=VaxfgZYn+ZvIqViQssLrzdbJtPyKRU6ihrapdAuk3oh42nkTf4BEUt/JF/y5SZ7JeEAnPGoX8
 rXLpznFYpOkDlcHu1cqGQX97nMjygg9lIpHmNJpWVsWPt+pcLeAJFAe
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-Originating-IP: [10.48.87.14]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000097:EE_|CPJPR10MB947795:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f66807b-fda1-48d5-3044-08df2dda74bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: MwwvMMBlWlWp5rP/wqyW5SdESzuNyvKyAHt7OetRspF7djszZi2z4dscGfpiGlE4Hkx1G2LAMBMLq8bQDx1hf3Wm8SPr+jsL0dlUend/YR2cKI2WmWpstxoiOBbS5pBy+RLzUA/oEa82i+XpyLRBTfM2wsOwz9wZqRs2LApejTlYLjbT20ky9MV26ANrUzKjVBNyL8LHKbewZLigIQtV9zho37Ye9wAgVWdChGGwG2jd8jA7PqE6AIH43IrX2cH7RiJ5gT4k8mhPLk5jsZ3Y1Czk+H3KNQ9KhEwPPMbVL+ipwMirQ9Rmrbypy3D2D3+BuFk8HCdoQ1TOQHksAG6/rmO3KDe/XxYdNPC7kYNv14EzXLx8uULuAcZYIp9qX6K+5inEXzopwqlnbTPriTg2Wep6kVt3W5dFPNW/GeJHGorB3MlCmVd/tRDoX6WFtzehkPPch+HYqpQzdNEfZT6UUTw4kFpSeSOtzTJSUG+NwKAcw/la+/oieB+GhpaZs/Ca9oikVObh6AUKWHdliGoZ3J3tJ5YC/JLSpQT0xVvwYkAB0G4yOmoMsGw/5K8LwiGnuRpn7rfzl4ANSQT5Ijt070wo8b2NkoZqxjd4MoWo3BDLXIhop+LPZdJQ7y2Rv6fiFFrl6lH7ykzjhK9vj7Kb9am2a0i4Lo2rwL7dTDZSB3o=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yCWBmK6v/7gMcw78PaXusRwtROz2hnzat3nUhY85ZLdnHf608k5066nAL7JyVspGnmZuNI0umKQVqkkMh4gFkeNPddlFWsHGMznpBbSt0+9vZn+EZqknk4tBiDDizTEfKchTbH6a4OX6K3A7u4qzhAc7UyKGf1Vc3DGFLpJPh7TRYYih6P8xF4HrafLiHGDRPfGK72T8KhinivzZ3I9D3xbfbr2q8KbVsK1vAPH4RVpySMqze9UhdDoF+ORXJ1vH0IiFhr8k9CsdAadi0WQoWSS9V501oa6/57BQnit9ere2UVSF98WZvKTTeIzIIz2EApmUZ/55aHVh0rgLR7HSnHBOKTikCxu2OAThoCHTpDuIVhSrtEySgNQoUi8HeA0eK41B8dTSudJ9w4WjnGsjP26zx0wsyato62AFZKFGvSCi9EcYmBg4SD6sp5c/DW7w
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:13:59.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f66807b-fda1-48d5-3044-08df2dda74bf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000097.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR10MB947795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_051405_945945_3A4CCEC3 
X-CRM114-Status: GOOD (  13.00  )
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

The STM32 RCC reset controller currently implements only .assert(),
.deassert(), and .status().

As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
to open-code the assert / delay / deassert sequence.
rs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Changes in v2:
- Increase the assert delay from 2 us to 50 us, a value that suits all
  STM32 IPs
- Remove the polling of the reset status bit after deassertion and,
  therefore, the deassert timeout: .reset() now only asserts the reset,
  waits for the assert delay, and deasserts it.
  If polling after deassertion is needed, it will be addressed in a
  separate patch, as it affects all reset deassertions on STM32
  platforms.
 
- Link to v1: https://lore.kernel.org/r/20261013-ups_reset_control_reset-v1-1-f8a6c7f6cc3c@foss.st.com
---
 drivers/clk/stm32/reset-stm32.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
index fc237fccae68..774d77d6de5c 100644
--- a/drivers/clk/stm32/reset-stm32.c
+++ b/drivers/clk/stm32/reset-stm32.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -13,6 +14,12 @@
 
 #include "reset-stm32.h"
 
+/*
+ * Hold time between reset assertion and deassertion.
+ * This is a compromise value that suits all STM32 IPs.
+ */
+#define STM32_RESET_ASSERT_DELAY_US		50
+
 struct stm32_reset_data {
 	/* reset lock */
 	spinlock_t			lock;
@@ -119,9 +126,23 @@ static int stm32_reset_status(struct reset_controller_dev *rcdev,
 	return !!(reg & BIT(ptr_line->bit_idx));
 }
 
+static int stm32_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = stm32_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	fsleep(STM32_RESET_ASSERT_DELAY_US);
+
+	return stm32_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops stm32_reset_ops = {
 	.assert		= stm32_reset_assert,
 	.deassert	= stm32_reset_deassert,
+	.reset		= stm32_reset,
 	.status		= stm32_reset_status,
 };
 

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261013-ups_reset_control_reset-4c2f1b08ddf1

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>



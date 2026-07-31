Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A81C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCdLZVjTlaRKlWFfj9PM3Rpmp4ZU+vahASlvomEtAtI=; b=2yZuJzuBwwGzGRogN+OdpGU0Av
	0T+TY0So8fwYLTXyLEFdMaOZAuWv4f6Nc2itFDY7GuOzpyj0jDpnpDpyd59kmZeeC+ONQ9OZDMD9j
	lID9gUV1FhbpICQ0BdIYxr7zVP/csQByQFcEitpzTJ+X56TSLTvTgiOjypp0MTOE5l0jHP329G+AU
	D03eNxGaIhqgOCUnvJLvagCBzlsAOkLgEnOYZ9cPnu5CXvYgDIY9mpfEW9Dr413YRLPZjIloYzHYz
	tUKZC7bp5F3w9ng3dHIKxyR/jHFyz8vAK3Tz3klXFRJdNIqCWkiig+LPIu22KuwuX3H10gcx8BPzd
	CUbOiBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphYn-0000000Bwwo-3BgF;
	Fri, 31 Jul 2026 07:21:37 +0000
Received: from mail-northcentralusazon11012032.outbound.protection.outlook.com ([40.107.200.32] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphYU-0000000Bwmt-38j8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grZPP29Cb5OJdCPXH5FinsyHEmnYT5dw5aE52RxLjYm9/K5K4GuzxUA+y0uX75nXGiGfxEQWG3dpkSXtKZkjfsYqZ0UA9svx8Vj1AQTZIK/uDAFovVa/UdsUQKL32o2GzabBSOpSVtkSn9DK+gb6KzLHd31xIruM8FT8TaJ0fRO1akjWz2ZTtY/dQd3Vm5hRNfQ86tK9mh7MRfVzxEyp4yv+ugn8j5IUX+8PFOVgxKJl48xnA4D/UPJHI4sEkHb/Nm/ziGCxNSa56WsxmqxSQppOINNNbr78ONHLav+7a2T6A6fTdItZ3eFSECZDc463ZU6VF1lVXgePAC5DOymuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCdLZVjTlaRKlWFfj9PM3Rpmp4ZU+vahASlvomEtAtI=;
 b=OLIGwA4PKRw0L7W8tA4KrNTzICoHXvFG6Y7a+V30SlG8RXD8UE7Y215zOpdNIoubxOpFt6Gzdx9AhxKd9Qou8MDWFhBT+zdQ5eSJ+TFRzSx4iB8dQ9KItfx3m5mFJxehw9+GLZfdAFW6ieMMDK12k+nt33NxD7d5QOaDLEmCAJRdtjzs3H6Iz4lhsqjrGr4CLc6R+zS9pgxZYbYU6+fOv+IxpEBf8MQblVe8ATx8WytDKfecUlJ7Y/XC/p67NgSPEbaEsxKoUtoxIAQyCA6EqTBRl9Ag2UJKm4hmUvSGdEU/g3bDAEdzpx9drfwbnwGEvx4S/3AuaD1A3mKVNu7Smw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCdLZVjTlaRKlWFfj9PM3Rpmp4ZU+vahASlvomEtAtI=;
 b=46CCtZK3Z5MAegGVi+bi2RS1xrlPAXCMXTTORCfxSd8pTa5+dxgJ54p2Dn4na0OsoRFaDWR31JKZk1gr/PmR6C8TZa6wKsjQv7MLg+kQtN9ikgfONidCnSYHW5vgzAH6NSj0Qy88GjMXTlIHK7nWWC9WGkng3YRSbwC35Uuuqgw=
Received: from DS7PR03CA0028.namprd03.prod.outlook.com (2603:10b6:5:3b8::33)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 07:21:10 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::6) by DS7PR03CA0028.outlook.office365.com
 (2603:10b6:5:3b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:09 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:05 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 4/8] clk: clocking-wizard: Add static-config clock provider support
Date: Fri, 31 Jul 2026 12:50:45 +0530
Message-ID: <20260731072049.957624-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: df7517ad-3786-4c72-01a1-08deeed44bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|56012099006|3023799007|5023799004|11063799006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qjXYIbCilrgCEmtArDXVyXUqUR3W9HMS+5xm9kb+hMhZW1ilRfdb1R749eDhy5Q3K7c3TWpqh4zzjrrWWmJW6Y/HMwQzUYx8NnDr1klOYDgBhHhsOb6GG5SabCypiSKOGbqhE1HU4AND3sA6tINUcackKQDg7UgNyvq5C4L0f9h1MnrtXltYCZtqG4wX8XJjZmfkKk0nzDGAcLMpcZ7V/nTbMDHhkepBF2hqg79au2up1G4KuOsffMfQm2qWpq7Y7Kv23exiql/cqWvU8YgCsu1mS3iCXrYgVjjNx7XwfGjRG9/mzgTWFsyPN7ONwURUhwZ6qxO4zmPKVu2gUW41ZRjtzw6XXG8lSflg5QYBHs4Hu2nvx04MEH446NYt85aP81n3ZVI6oLQxw/V5ELMPucVNu1uTfYOHqtkc5MsirqMPwNji+4QquCjfUKH9Z02hGTcA+IC+IKTSo3XXmZJWwoWLx5a0GT9VB43WQMFth0wqW5KClSi//4VLajrvdcww76Dv3CYoqSQ0XDERrsbBI7S9ZibM0Q/iSepP9a4OUiYeWOXePGDwcZQHIWCkjgPugqxAppqvRaTX4sF55qQTDLSWhREw81ETbYqEJO09bSQKMR8JsGgt/aYzuS9aP//IYbgrG1cMirVt2al/F3gXUbyQ3F1SsegHqbrAOoSjZysY3woLLnt6zUtCS2BoTqKCSiJ5oa+TWSJJ0c8AM6sSwg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(56012099006)(3023799007)(5023799004)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QeEeZn/4ahImjboCF0T+TrDKzK+wUeUtadqwwA8Y319EEh2zuqJEjrtpXaDMSDyfRhKPxxPqPTavlYLnqWmDQrZn5bwilupPK2KgtHqLWb1V3JPeiyLIY7QnBR1gKR07xNZCb/YO//2T7r4+DiAoXLUNsmdbwy3rnJjW6D4LQWv33ttdr9usPOLY+5mprCGGTl7QZ3iMZW0W0Yyal2/avE/YkT0VCPBft8t+6q9vJrNhtplH1///3P56sAaED+n0x2zl37eIeHJGqEHlVwVKlpTeq6O32LFkZnVUdU+XyUt3iIwe4AfGtErF+Pn9DoVpjcTtm9s2V2tHJH3Pz9RmooKI/z7o33spzW27kqZ1xTr/4K4/OPM2O/l8hghZDbNWV9ZCvdb+eIsoc8/hhhjQX9pSobA1V4FNPdUka2oQUWcir48HXDIZb9zFtqqSCjQJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:10.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7517ad-3786-4c72-01a1-08deeed44bae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_002118_793701_6C623553 
X-CRM114-Status: GOOD (  23.55  )
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

When xlnx,static-config is present the divider/multiplier path is
synthesized inside the Wizard without exposing runtime MMIO
reconfiguration, so omit the AXI register mapping and advertise each
routed output clock as a clk_fixed_factor child of clk_in1 using the
synthesized ratios exported through xlnx,clk-mul-div.

However the parent clock of clk_in1 can still be gated, disabled, or
(re-)enabled after FPGA programming (typical FPGA Manager flows,
CCF-managed parents, PLL fabric power sequencing).

Add a 10 us delay in each output clock's .enable() hook so consumers
wait for reference settling before first access.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

Changes in v3:
the number of outputs duplication removed

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 137 ++++++++++++++++++++-
 1 file changed, 135 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index ffc78c90bee6..1332abc8a950 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -107,6 +108,7 @@
 #define VER_WZRD_O_MAX			511
 #define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
+#define WZRD_ENABLE_DELAY_US		10
 
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
@@ -697,6 +699,13 @@ static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_wzrd_enable(struct clk_hw *hw)
+{
+	/* Allow the output clock to settle after enable */
+	udelay(WZRD_ENABLE_DELAY_US);
+	return 0;
+}
+
 static const struct clk_ops clk_wzrd_ver_divider_ops = {
 	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_ver_dynamic_reconfig,
@@ -790,6 +799,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
 	.recalc_rate = clk_wzrd_recalc_ratef,
 };
 
+static unsigned long
+clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * fix->mult;
+	do_div(rate, fix->div);
+	return (unsigned long)rate;
+}
+
+static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (req->rate / fix->mult) * fix->div;
+		req->best_parent_rate =
+			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	}
+
+	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
+
+	return 0;
+}
+
+static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	return 0;
+}
+
+static const struct clk_ops clk_wzrd_static_fixed_factor_ops = {
+	.enable = clk_wzrd_enable,
+	.determine_rate = clk_wzrd_static_factor_determine_rate,
+	.set_rate = clk_wzrd_static_factor_set_rate,
+	.recalc_rate = clk_wzrd_static_factor_recalc_rate,
+};
+
+static struct clk_hw *
+clk_wzrd_devm_register_static_fixed_factor(struct device *dev,
+					   const char *name,
+					   const struct clk_parent_data *parent_data,
+					   unsigned long flags,
+					   unsigned int mult,
+					   unsigned int div)
+{
+	struct clk_init_data init = {};
+	struct clk_fixed_factor *fix;
+	struct clk_hw *hw;
+	int ret;
+
+	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	fix->mult = mult;
+	fix->div = div;
+
+	init.name = name;
+	init.ops = &clk_wzrd_static_fixed_factor_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	fix->hw.init = &init;
+
+	hw = &fix->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw;
+}
+
 static struct clk_hw *clk_wzrd_register_divf(struct device *dev,
 					  const char *name,
 					  const char *parent_name,
@@ -1154,9 +1242,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
+	const char *clk_name;
 	unsigned long rate;
+	struct clk_hw *hw;
 	int nr_outputs;
-	int ret;
+	int ret, i;
 
 	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
 	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
@@ -1166,6 +1256,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_wzrd)
 		return -ENOMEM;
+	clk_wzrd->clk_data.num = nr_outputs;
 	platform_set_drvdata(pdev, clk_wzrd);
 
 	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
@@ -1201,7 +1292,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		clk_wzrd->clk_data.num = nr_outputs;
 		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 						  &clk_wzrd->clk_data);
 		if (ret) {
@@ -1224,6 +1314,49 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 		}
+	} else {
+		u32 mul_div[WZRD_NUM_OUTPUTS * 2];
+		const struct clk_parent_data parent_data = { .fw_name = "clk_in1" };
+		int num_elems = nr_outputs * 2;
+
+		/*
+		 * xlnx,clk-mul-div is a uint32-matrix of <mul div> pairs;
+		 * FDT encodes it as a flat u32 array so we can read it directly.
+		 */
+		ret = of_property_read_u32_array(np, "xlnx,clk-mul-div",
+						 mul_div, num_elems);
+		if (ret) {
+			dev_err(&pdev->dev, "xlnx,clk-mul-div missing or invalid\n");
+			return ret;
+		}
+
+		for (i = 0; i < nr_outputs; i++) {
+			u32 mul = mul_div[2 * i];
+			u32 div = mul_div[2 * i + 1];
+
+			if (!mul || !div)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "invalid mul/div for clkout%d\n", i);
+
+			clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s_out%d", dev_name(&pdev->dev), i);
+			if (!clk_name)
+				return -ENOMEM;
+
+			hw = clk_wzrd_devm_register_static_fixed_factor(&pdev->dev, clk_name,
+									&parent_data,
+									CLK_SET_RATE_PARENT,
+									mul, div);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			clk_wzrd->clk_data.hws[i] = hw;
+		}
+
+		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+						  &clk_wzrd->clk_data);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "unable to register clock provider\n");
 	}
 
 	return 0;
-- 
2.34.1



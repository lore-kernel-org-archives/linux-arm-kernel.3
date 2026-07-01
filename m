Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tERHhzNjraxEHfDjl7Oe5OvkRTGUiMaGyqHYqR39yjE=; b=Nr3ceNgAyT3aqtNgxCubDgRHLA
	p9imf3Hh/++qZve/iWvE3X7rgKrdCQMBNKkh7IiIz+Du51Nemb9GbSbisLKIsJAAiyXDIUaP7RK4X
	QleA/hFCiT8TZ6/tGVbMI7nO1QAeXRblH3aCHF47vC5ZuBYFnHgHBaSEPVNwsUYsPlK794jC1Ya8f
	Oo9ZntU8XOz4ObEuCjXfBffyQ7N1PZaRz08CY4XNABu59q9jxStODgq8No8747aE/A1Ef3auSyNo8
	4bwm19uZnaAIitGIIKiPPqeQZyyMdWATDvieM6qmN/OtgO8eQMnbfL6fjgmJr6Ldrc5B+AqHHeTJS
	B9F9RFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemt5-00000000eLH-3I54;
	Wed, 01 Jul 2026 04:49:28 +0000
Received: from mail-westus3azon11021097.outbound.protection.outlook.com ([40.107.208.97] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wemt2-00000000eKO-45iy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 04:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omSXJ/qD7llm/yo1DBU0IRci3DQGW4+UZm77GMQxLPWNHejMQLSiyShrIxFuuyJz5fjwXw2RirhHBOM4QBzjnifgIrGUobuLPqtp5Vn+eFXzHtAVu6lnT3yCyE+MpFThT7Ced08ZNcvvEqJsW8O8QLxU5/HX+x9u3OdLU2wIH1XBdEci3Qln1dqgFAI4l2i5633LQb1R8KY7lkuTurrPbp9Qb2HxsUnFD0N7bHaL4szvQ90Gej+diQkDB46LFWZcSICyhgqn+a2LNgahhC76yX3M9SINZDVF+RPPIaWKUKw0ghNE4E4xfOeBZdnv8XKEbPLMb4EAMjzphiusmgliIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tERHhzNjraxEHfDjl7Oe5OvkRTGUiMaGyqHYqR39yjE=;
 b=Bfb5rx4Is8dugMJO+uNIpK+Az2d6H7DsnzGr6UL+mJHeuDxNOP8XH7bnG73F7A+z2Nv0KmW4BQ83JNRs1kUHi+EzTJ6pJLlFm0Z8xXoXS9v5N6/jMs6scM726SeGiw0Sb6IyqySmNZ1tCo1uBRk2UYt2WrKJmYumPCqEPryOWmTtR/ItSv6Uyfn3ZFHTmJ57WWUtEoici8oiGhG5jedl9q2rNNBxIBFwkbJGkpJL94jYVKnshJx7svTyOCUgna+2rRDqLpdnjNOHaKPlCw/wXt25EV1qfyRP/fUlZXiYD40yDyLWee1ZTEkoJ8Aym3fDYkf3YwQU3gXnIb84Lsrc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tERHhzNjraxEHfDjl7Oe5OvkRTGUiMaGyqHYqR39yjE=;
 b=QDCl/dZXE2303mYO8JLF27FzqlW7qScus4T9Zxd0KYyj8vKrLnF0atYcj3lxZlCu/lLYI9CBng6MUWjeOWXRvcstMeQgVm1agQxuXUCiKszkqodCUqgTWQrsANCwPZDByvY/kb4BNdk6gBI0Iy59ZxWSoS7YTDLnTrGluzg7lDLrbr9QAE/EQZQaw/CSC/hxVb9PRsg6RRgqOzuxAPFIyk5Ym4C+N+fgVqMtFS4kqx6UU/j8fuCKEuQrqZnpG/Y31DwnU1+PQJQcrn4iOYMGrrLzXR15OrKkWEeU6Zv4ZYSl+CWn+po4wCzbucrP6I90Krntz+CoKLOlzweHzo6tQw==
Received: from BN0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:408:ec::34)
 by BY1PR18MB5972.namprd18.prod.outlook.com (2603:10b6:a03:4ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 1 Jul
 2026 04:49:18 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::81) by BN0PR04CA0119.outlook.office365.com
 (2603:10b6:408:ec::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 04:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 04:49:17 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 738644186B5B;
	Tue, 30 Jun 2026 21:46:24 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Tue, 30 Jun 2026 21:48:59 -0700
Subject: [PATCH v3 2/2] i2c: cadence: Add support for Axiado AX3000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-axiado-ax3000-cadence-i2c-support-v3-2-4e217cfe5904@axiado.com>
References: <20260630-axiado-ax3000-cadence-i2c-support-v3-0-4e217cfe5904@axiado.com>
In-Reply-To: <20260630-axiado-ax3000-cadence-i2c-support-v3-0-4e217cfe5904@axiado.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244; i=syang@axiado.com;
 h=from:subject:message-id; bh=h4ov7AFgi17kDH8yrMJbon/4WHDPfJxZl1Ie3d4EIpQ=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhiyXOT6mqR2G7oWPX3eWXdM6vCTK7cbBOfPf7T7slKlo3
 VZmou/YUcrCIMbBICumyPJV51v+yVzte517V5bCzGFlAhnCwMUpABMpnMvwmyUy542St+WuYomj
 ITsy9nNnd1148KK/LaHx84XT5931cxgZjjfnbbXUD8pqfTRJSCxy45VPsZFK055O/fE+sn9T3Rc
 GdgA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|BY1PR18MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5cfd01-82d5-4111-4971-08ded72c1bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: tuNzJsR5l1P5JlB/JB6NDcheSetkFndrPAu9MnwfKI0sf3JD5QdMlscficZpW1Akr633+TERF8z7XUd9x4pFqU8yNc8mVatm58nUefGbsi9Ar2+5Gsxhr8g4Uc95qD8pzJfp7uATDDcm5gM9pP3lrHWJ03IoTMRMd5Q2nk/ef58x7OlkqF00O6PDIkDsW1jFqmEC8QK4ucCH5wFOtaCzoFF6g0AphImGpLplsAjVZOvnh1EmfKG3Kxt+yoz3CXl5NYE7NyK1nTYb9UrrCpRPHQnKOjYXcj3ZW4b+dVWa4FW1QKr7O/khP4iH6DhjMeeviokSVm1basXK/GH4RNAgk07+WrcoeYb9gLHMe3Eut4UOybr8X0+JYDi7nicrWg/4ICMMBxif0jyb1kJH7ZJPPyBJDMNKv56YN2h+/sNP75wrQCyvQQ8xMjPXk+8vajeGPT4LSmDGPsoN5axCGd7oMfGGr4pt8Q5mkBo+33aiNPBDGy+VPfpLF35sIjpD4sCKXJe3kkFN20Ya7kAwlXcAsl5408OfGP/yzSCA5XfzfeamdHkxud2nG8z4SY7LZF2l0KMOLdPuZBuoBU69JhpJ5UaK5ITSPwEt8250IhdDOfo4xO6kxY2dzJIOEh0UuOjWLEZ2HRoUD7kF5waG2ce9W/1ia6P1YTACV5msoL1VjrUHvqo4ZtJwHQeHDuKCRNZK4VukgDbRuwQbZxdGDDw2xA==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0if4lPODZ7GOeK4/6ZSJKKq+oWTjoWLZ+UAsKfA2NMLvbdlbbw6x3/dpRJkvcryZ9zxWlJXFKH4Rv9GOV1C+sWf57i/kNBEaU1Ec5XOr2Q2HEnlLpfZdZFHsXYG19hjTxeKoGHZznfkkKYu/JTjMdbL18QUTFJmqOXTJXLR+XWpFIJtt9yT9Fur+CJs7YwsDpf+tlm1Z4yfCiIfFCNEEb+j9KbSFnT6mEPR34lpZHxmANlD+Gi0elTRGr4rdPavKDty+cj673oEOpQVKSnaWY1aGjR4bTqJPUus5iKiEDA9eudPBxOatOsAsxBcNHUEU5JkWt49o1hzyq9vZwzZOtMBAf1TIzSzL+O2BnNgjTS3eINIqMHb52Ojr2g+BTY+8Q/ysX3USAKFLBKyxlxBEamThJNpvuF58zCdWu7qfjv7hYlijrO057oaShAqhNytQ
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 04:49:17.6084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5cfd01-82d5-4111-4971-08ded72c1bc8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_214925_047714_8DA876FD 
X-CRM114-Status: GOOD (  16.59  )
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

The Axiado AX3000 SoC integrates a Cadence I2C controller
that supports SMBus Quick commands.

Introduce the "axiado,ax3000-i2c" compatible string and
add a new quirk CDNS_I2C_ENABLE_SMBUS_QUICK to enable
this functionality. This allows the controller to support
I2C_FUNC_SMBUS_QUICK, enabling features such as bus scanning
via quick write commands.

Additionally, enabling SMBus Quick emulation in the I2C core exposes
the controller to potential 0-length reads. Because the Cadence IP
does not natively support 0-length reads (writing 0 to the transfer
size register leaves the hardware in an unsupported state), this patch
also populates the adapter quirks with I2C_AQ_NO_ZERO_LEN_READ.
This ensures 0-length reads are safely rejected by the core, preventing
potential bus hangs.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/i2c/busses/i2c-cadence.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 0fb728ade92e..1964ea1650c5 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -128,6 +128,7 @@
 #define CDNS_I2C_TIMEOUT_MAX	0xFF
 
 #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
+#define CDNS_I2C_ENABLE_SMBUS_QUICK	BIT(1)
 #define CDNS_I2C_POLL_US	100000
 #define CDNS_I2C_POLL_US_ATOMIC	10
 #define CDNS_I2C_TIMEOUT_US	500000
@@ -1175,10 +1176,14 @@ static int cdns_i2c_master_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg
  */
 static u32 cdns_i2c_func(struct i2c_adapter *adap)
 {
+	struct cdns_i2c *id = adap->algo_data;
 	u32 func = I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
 			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
 			I2C_FUNC_SMBUS_BLOCK_DATA;
 
+	if (id->quirks & CDNS_I2C_ENABLE_SMBUS_QUICK)
+		func |= I2C_FUNC_SMBUS_QUICK;
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	func |= I2C_FUNC_SLAVE;
 #endif
@@ -1442,9 +1447,24 @@ static const struct cdns_platform_data r1p10_i2c_def = {
 	.quirks = CDNS_I2C_BROKEN_HOLD_BIT,
 };
 
+static const struct cdns_platform_data ax3000_i2c_def = {
+	.quirks = CDNS_I2C_ENABLE_SMBUS_QUICK,
+};
+
+/*
+ * The controller does not support zero-length reads. Enabling SMBus Quick
+ * commands would otherwise let the core emulate a Quick read as a zero-length
+ * read message, which writes 0 to the transfer size register and leaves the
+ * hardware in an unsupported state. Reject such transfers in the core.
+ */
+static const struct i2c_adapter_quirks cdns_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static const struct of_device_id cdns_i2c_of_match[] = {
 	{ .compatible = "cdns,i2c-r1p10", .data = &r1p10_i2c_def },
 	{ .compatible = "cdns,i2c-r1p14",},
+	{ .compatible = "axiado,ax3000-i2c", .data = &ax3000_i2c_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);
@@ -1510,6 +1530,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
+	if (id->quirks & CDNS_I2C_ENABLE_SMBUS_QUICK)
+		id->adap.quirks = &cdns_i2c_quirks;
+
 	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(id->rinfo.pinctrl)) {
 		int err = PTR_ERR(id->rinfo.pinctrl);

-- 
2.34.1



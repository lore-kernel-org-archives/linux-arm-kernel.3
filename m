Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B72CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pBZ08OeVmsoLPXhMn3QwldisDxjt7utFYN1zcKDfN0=; b=rzGxYwJRYvpX/SXznvV+um5dQS
	oHRDXcePgwsYiLWdHkFGAAjU96Nn9eVhL7ZQkAts1FpJR6KCajMrgz7QVUZF7gIdJrAQ+ZSHjFkGm
	0T7Jbm9VyB10VPDlkikP8zOf2msxABMuD1rneVCz1O9glSUm5/FzFpsBC/wpVw+Dl9zmms5rON+cw
	k0W25aJZAO969dft1EP6JSPRNpUQdmL0RV3NHL3aCc96kH6mWO+cXvyk46GCXSTO+Ik4GObSGES2/
	rMhI0ip/Y9wldzfem4ZDJop5I+0myOXMdvBvn/3yiJMJupLPjkI2v+wgdIUtvCZqF/QV9Mpk3zli+
	wWCYLmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQgTq-0000000CqQX-19Xu;
	Sat, 23 May 2026 07:09:06 +0000
Received: from mail-eastus2azon11011006.outbound.protection.outlook.com ([52.101.57.6] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQgTn-0000000CqPD-33aD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 07:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTg5hVj7+s5xbtNvhdOVaPgxHl2PUZ1c47sliGmJu0ZEkuHmctyCnjisjtW3goJdpt6IHPvnJ1uPW7nkN5jlw5CHnMs8kEmkr+oZefTU5p6EgSFWz4NXco41MOOxyfmw7N+CqXr9lTDpzhU6Ib6TxUhdC8Sm61xRbLIxCw94fMNEobXXPO5GlltLmQBAahpdbDp2g2tUkJHicMXeogbRRxbDH2xV//Cfxpw15o+Q9OGjPxH80yOt9azbTdsCOjQ+xsh1gO7pLzfA1d5DtCOyxZ/TohLhYIBaWdGcVmGAPSk0L98wD89BtOpagteqPZHwknxV1nw4lmy6YCBISKIJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pBZ08OeVmsoLPXhMn3QwldisDxjt7utFYN1zcKDfN0=;
 b=jD0M2d0AnXgzkWZCegFoMZvNioVuP/eTj7o8wANjCV9+Lq09eRcqmHE+W3cmyN8h3Eui4BBrTWvuQlpi2cTR5LI3T71fO0p+66OjZH6+HuMAezETOfbH8LS8rWeNfJyFkLyK4330n0SLnFDAJsm30uoqSVwj5e63+12jrqjw/BEtSjvmNEhZVjQ19KdsI4ulNpEaJonjhfMUJwYCQmvM0U/zp5xRIFMy0xlh7d7HAlFPbCUtc7Wx74q0T4j6TFdco9UxqsVOvnnRdk7yaiaddjRXKElyDznLpPJiFe8jiJ5UpKJnM052BRhEl7+QS0flRsL6CILx7peznBvORgPjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pBZ08OeVmsoLPXhMn3QwldisDxjt7utFYN1zcKDfN0=;
 b=bAG3UtGdM/Lp0yEBz4qvvvPqybAxj+0g4zw+Cvhm2nsXcrNo0Mq92W55/Xbqk1ehRfkKbPUlyN9ARXHrclM8EDWKjIwqx0y5NP3YHc86jfoEoNxZyFhPARr/8wL8SpQCYrxzO0MXcSZjjhqnPcz7W3LfxapKA+WrTZf7hddmJYo=
Received: from DS7PR03CA0242.namprd03.prod.outlook.com (2603:10b6:5:3b3::7) by
 PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 07:08:53 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::80) by DS7PR03CA0242.outlook.office365.com
 (2603:10b6:5:3b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Sat, 23
 May 2026 07:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Sat, 23 May 2026 07:08:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Sat, 23 May
 2026 02:08:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 23 May
 2026 02:08:51 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 23 May 2026 02:08:48 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/2] minor cleanup for dwc3-xilinx glue driver
Date: Sat, 23 May 2026 12:38:35 +0530
Message-ID: <cover.1779518171.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0496b915-da95-445b-7511-08deb89a25ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|6133799003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5xsg4y5V7XeAaczwUlBnujXzlQEtWxRu6Q37R8EM04iPE7nhEQV56vRiVEKRbNXKjZrsUIqb4WjkPvNb0Iz1b2W8IdDuM7ybQCcHH1udzu7Ijb/TXyWVHA3GZTfZFw9K+/oKZWSixF7GieuLw9RZhs0TOj/RcU+E2/aaXjZE2FNfxF1Axw2IpGhHi/XOalY6jKe1pLEoQVbLdAeax2x/OdKoQ9m/kbY2gOwD2QMEkP+4FPE5gMwycIlglVy+2NBfTbNxoyNeFR0A+yE/pHVP9uDezemRpSjCuSdemxDz7avqJgAUggPuW86fzsrpw3vXrZ6YXpYbxTA7bb+/dXzusPrqO+MtSwm4AeVneeISoYpW4hdRRe5cs0X9yEa6FQNu5rbvfB7RHZf90ea5Cuc9Gtz491u660pjFzmFIJ/tzJukTIFzmU/K2/P1GF/ZGsAEC2juPvrWqm4RYoIuTqJ4TWSaIekTVnqq7uR0vKvCYozCLn58q09u84A9uXKkUCwLtz2zJj/HsUxpADpZ6C4GmGDmvj9HT1DhIjM7XB+oWy4gvbgq2Wd+iAzJ/spk7zgmrJ9q3O7K1joJz0TX/zpOkGtSs0NeXTdiYOLnbqmPgMoXSvWhSqF8LLgk/hEFUpoEueaW2ugF4aSsDDx3uZ0XL6A7+3GMNgW90uwKmBr8oo2Wtb0RSmEXz4TWbyymqZtCQwVjQfG3z+lRxGawJzJMsVGA02cTPkyryIHD0WOo+aE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(6133799003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YSPQfaLZYBdgpiDtljH5DicIZGVRHucmtjj0jyt2ryroVEEWZ9hBsdKMZli24PlnUPISBUCCyRk7s+Ua76KtetP0jTm0r4NgxX9ecrlQryzO2+xiM1SXr1mbD2D5xajHRaIDDJVNO+iqqSqky2Oo021jwbZwp93x7IidD7SuiA25VLylZyM65RbG2QR6jSL9YYhcR3DOxJybIMPfHMVUKggqBoCpAAomLLQ/v6yae8BjxlKpB2AToN9nVVnEUKYzBIesJZIJ//BzIZx4zmGZa2uY+GM0nmhNJlbw1CBg0V3mLtPTyQ9o/VTtNBk99KWEPrpfkDimKDX+Zv53mzUO4AwHyBzbUY/6o1Wa+pEA4ZUSz1x21G7TAp6cz2Cyq9jRvif7HeeSK32ddg00w4WghXu/ld/qxs40o9vU1pxiZ0u6eU10FegCgFb/aBF06of4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 07:08:53.0821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0496b915-da95-445b-7511-08deb89a25ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_000903_918612_2A77F307 
X-CRM114-Status: UNSURE (   7.66  )
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

Minor cleanups for the dwc3-xilinx glue driver:

- Fix a comment style violation (missing space before closing delimiter).
- Use reset_control_reset in versal init.

Changes for v2:
- Rephrased commit description for 2/2 patch.
- Drop functional fix (usb: dwc3: xilinx: fix error handling in zynqmp
  init error paths) from this series.

Radhey Shyam Pandey (2):
  usb: dwc3: xilinx: fix missing space before closing comment delimiter
  usb: dwc3: xilinx: use reset_control_reset() in versal init

 drivers/usb/dwc3/dwc3-xilinx.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)


base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
-- 
2.43.0



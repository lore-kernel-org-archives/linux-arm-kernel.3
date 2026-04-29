Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0934CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oeWG4bCWLga1dOI922z+/mD0YDUsTgj2a/lAPWwP7ns=; b=Q+1uowJYls4Mw5nnl3VSPsKpu6
	ZwcNlS68oZlGQl7NYMcWtEMTCuENGVoTGMhUErE8dSRiKmie8zyZGLm+crmZcbZgOAD9uVcPQMhUZ
	SkQZdZeiZSdiotZDtvNe3m/eLm1XOAVVKBzRLP6ADLLsZXGDx5JBHEswnq9g95uf2HawvIqe0n8L0
	/ONPC5DE4J02E9Jc1t41QtS1LzuBX7glAGwRpaxcr4qms2F4jQkPaErkiRUAK4Z/roZiWR7RegIQt
	JwMHE7s4iV83SKgKaXeCUvcHXjvnB2LoDjHTrt7LlSSNH+O3Plo0typpObygco6Sfee2ga/NPU8u2
	pADnCcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI92V-00000003zW7-1xep;
	Wed, 29 Apr 2026 17:49:35 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI92S-00000003zVH-2Eov
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqf7F/+OTrQ7uILLs8U9c2Lx/vkG/S2FNybSPqvVHKUumQSfU3GRy/UzBhDtsSqWW9NW4wGKPpmBwB6muNxfAwfKr7Vnbz09JYRQ3knbbqkWGlmqIQoPJaRUhQcannMo2gH/IdnBPPtblMY3ddG5M50j7ZsM5D4aMc9vZFPDRs5RV4WXARo0GxKhYPM+l0FxWPcNlz6dXYXxLShVJZYZ6/t+NV4Y9af+KuYbfdYG6gfcijhmPIOl+Q2CxRNB6a/nYMylwBXkbQk6laUoBhxgdkxowNEza3aZpevF3aMskSuVihdII3Isy//+e5PHWxDOgSA7xHX26zJsa7f+u3SVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeWG4bCWLga1dOI922z+/mD0YDUsTgj2a/lAPWwP7ns=;
 b=jWSkdQV0VCdnE4oxwsy5Vo2F3qh6xgoS3gC4N3pkaXnABtgap1+NVRr9dl5Y02jeIkzKl7Xf8ISsodNxruxWaitCMnePJTFsuiO7lY2GE0IBeKUYVvR2TiH5StM99Kw5IeiZEG6SGgb9wdoB5lD4a8yY7U3lYd3PQW/c4If2QnhklHPr4YnJdCYCW0rQN+tEESWfNerkmR0eqodkg+yHmIJaSkUqe9WyRG/lZNSxYMXoh9v4+hQijuV4ruoQeREx3ROu/O0GcbmZ2s8bPqEFjc3TiDFVomT233rebVlwsik3/YJ7t0QURMJ6psuF+E/1xdQHf9VWYI2BBwgvfxPEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeWG4bCWLga1dOI922z+/mD0YDUsTgj2a/lAPWwP7ns=;
 b=n3OXKl+4A36OugLsNDNfchT0d077vQYDqsalzvvyfklAyb4crsLSm7L1x35tl9vWnmux16bm/15h8eUc1/n8vLwAD5aeNjBWZC19e6gebzpBWQbzuz8Y8KM5Q9o+3sfY2FuzjzTPWWBzfe1494a4l53ULvKr6oqbOszOwZVCkcU=
Received: from BN9PR03CA0261.namprd03.prod.outlook.com (2603:10b6:408:ff::26)
 by SA2PR10MB4588.namprd10.prod.outlook.com (2603:10b6:806:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 29 Apr
 2026 17:49:25 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::53) by BN9PR03CA0261.outlook.office365.com
 (2603:10b6:408:ff::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 17:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:49:23 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:49:17 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 12:49:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 12:49:16 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [172.24.233.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63THnDDF3822334;
	Wed, 29 Apr 2026 12:49:13 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <Frank.Li@kernel.org>,
	<nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <tglx@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add runtime PM support to K3 UDMA and K3 INTA
Date: Wed, 29 Apr 2026 23:19:02 +0530
Message-ID: <20260429174904.4049243-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SA2PR10MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: fba7e621-f23b-41fe-5170-08dea617a656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: D4RjQgqPWfNMjWikCZ7sTb4kJd6EOp/FA+bD3zCy+VpF8/p/n+Ze9zHDEAiemqDOVsom1bd7Qg8l9zN29TXvn931kznrM1LJc816hjuuTNm0lOsS2Sy4MIXRoLN/otYjfayTidnKQtvSqca4WAYa7BWdSAg1vEfXgsYP6QieMNfIH+WwUJnXyWrztaK3Q+pMao4IVsA2ZXQW4BJo2784MAg+kYqmOcdesBbNMkIgg+UOZUQhmVFj/dkW7rPpjonQPu1XUEQhn0OEBWBamCfITAyUAFPhLVOo4YtQbJ4e8rtgi8+eKz6Nj+S8VXqPzbIt1r0jdDovaLhblZz00z/96w9J6L+hW5+3/a0esvMluubu+5YNeVoB/xay7J4KdYkcvtyddIm8Qr6jRP9fewmhZ6bc2UdVDEh2jawBayYffjwekkA/Mz7u0PGvSZ8mMJW/i+kZBu8w6Kt8qICcl5E0cD7XVo6wxORkN6huaEPGZOC2ZgEdmw4irZnYg+EMir4V0Jag2U9ZD9xfZRakzNhZubI8RMEwPFm+5CXVA2U30nkbIJpbo3gVvNzV6AAvSBkYs+4xBfQv5OIMuypP5kRi99fOLXZlNFKWjyom+tr6zisG2qOvFVN99MiSOMdRxJ73o5XtZEIWILrZr62/voq0OkFNdv1Lka1wTKta1U66SE+CI7gOCzA0kB0L6n7Fd7dMBBjXxkv0aRc8qHdD5onXtPY07mVmZOl1UPIbueI7PUPk0d+RxcEmBtKhBN/x1B3Y+fpugTwOoqHdcZpdRZOpGA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yWAbQgUDLUOMPwK7oz8TVt4O2cVfwSXxQrFyzGqdiY5JQwq5l2dlu6RnMBsKJhCyjfHrd1JrxvkC4gsVzRC7FTZ1OlujxVQZh/E3aHfkc+QvkEAStybKfub1fIQYUTwIKT5QLW2w8rA/Mfp7IjkPQMWCvTJcZ/iH5EgjyOynQ2PeNSrAj2L5K1GVRAxELA1Sx9/kWm3nHqgDB7AIzia5+TXqLw9OGZtV2T9nfylVf3E1DTAM3O8K7aj9nEvGWmsPpTLyAz+kVlq3P0DstdaoDMAnZMMU8yGq38riAULljnFf4B/OpkzO4LiyMs0o2OTnvhyt4GdjjyQ0eMMXXpK78uCT+JYRxnW+JXthitD5MuwajQPqyNtnum1yG0qckohBG6rFSSqekJWPyPakRTglonwO+681+YU6wO9kKNIC7dS1Snmvf0I6SYgBWGEclfGl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:49:23.7149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba7e621-f23b-41fe-5170-08dea617a656
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_104932_570756_C120672C 
X-CRM114-Status: UNSURE (   7.68  )
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

This series adds runtime PM support to the TI K3 UDMA DMA engine driver
and the TI SCI Interrupt Aggregator (INTA) irqchip driver on K3 SoCs.

Runtime PM callbacks are registered via SET_RUNTIME_PM_OPS and enabled
in probe via devm_pm_runtime_enable(). System sleep is handled by
delegating to pm_runtime_force_suspend/resume as late/early sleep ops,
keeping the PM runtime state machine consistent across system sleep
transitions and ensuring correct sequencing with power domain restoration
by genpd.

Rahul Sharma (2):
  dma: ti: k3-udma: enable runtime PM support
  irqchip: ti-sci-inta: add runtime PM and system sleep support

 drivers/dma/ti/k3-udma.c          | 46 ++++++++++++++++++++++-------
 drivers/irqchip/irq-ti-sci-inta.c | 49 +++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 10 deletions(-)

-- 
2.34.1



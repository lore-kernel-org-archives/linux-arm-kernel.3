Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B06CD37A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9jPq2K5mFdJZnHFDyMJSYj6w2WQhF0zJ4tw1+YWWBc=; b=aWtsU+2uPW3xVk+5xdsZnJJKCF
	DYPNnd8LY7WCwv+nlGA26ckDBcMWTVjGQj0mqLJq1azZPZiDl5KIO5rP4vozZ2gS5a3pjNenPwNT5
	ItEmdemqTBHwtrfndvB2sH3nqDTO+w+CUc3HGC/z2n+9oeKNDz6nuAumzIDcTexWvxrJg4eByM73S
	byig9l8jMVkTXbfsYqwvYWLa3yjGjIAbHUeZQiTy1ibEapeV02FN0RGTNAWVC+kPGk/N0OxisbZMH
	ao3hEJGS3herGDsj6fwox1cnPG//OnVRiS4kGu9f2/79QyqFjw9YJPcZpFSn6f7ER9uNjYLRQHwI4
	39rBbJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBu-00000006qED-2xiJ;
	Fri, 08 May 2026 15:32:38 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBo-00000006qAT-3qlP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS08fEPjfg9XFHvO4sRlRSqeL3Y+xI+2KymNe/bC1C0G8yQ0KCrwrmMN+j3F3S/TvUIeh2KK5FEnBxmDeV/bYn9PP12UdK8cV5bGblNOhPTZXa+JO69S/g3XOM94iRLBxaOZH0/+Rr2zsjSbJ3xKLyJinKyFGM9Efb3KD8eHP6Uojqt/GuAwxAAKBBWKY2T21WRZNn9tvxDqnLpMuCWT6vtj5Qm1JD9ymBkAcMMIfgQv2kZRkhMVYA8aU65K5BWIJjetEuXvGA0iuZwPwqXA71o3HT3JGMYw7eGx13OUqdOKD4BqlYmUb3gwS4iz06dfEQaEO6AAZY+SjhndgsFduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9jPq2K5mFdJZnHFDyMJSYj6w2WQhF0zJ4tw1+YWWBc=;
 b=OIs182Z2msK4u6e1JfelPnlGtRuIvjghpGeSZ6hYvsfMW86zxV1Sftov7oU39DJfNLlB1hufWmzsGke00Td6of6JssaWNEUvdbwi59XJ5tZ2DzzYPlhdzp+EfLcPWybJdafRD+SxpJKEgsweUa2pS7y6o4BS9imrZuzByIPSFCieJS/dBhtIIdtwn39qRrwIoXKbanRf92W8nMbejSknhP//Z+MEaWmthXBgmSdQzHV5umwItP25NRbKGKp8urHaFQQXU7PvLouXbvksEEAsqCSyPgGcThHwvNcso8ZzWI7NAYaYAY2y5xauGTlC/ElgaaYh8REj1QBLq+SN7TOO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9jPq2K5mFdJZnHFDyMJSYj6w2WQhF0zJ4tw1+YWWBc=;
 b=XfsZKp5P1efrwvk8yGWIeOmgPOMRtHAnAgqjbgGXK8WqsqVzLo9VrZcGAcK+S1vXcrogF2WTYi/CgDnTWN0mGf6EQN6Qoixpgs0C11U/1KLspe6xTmbm5ZlJIz88tgrEtM83Us22ZEeUoRCHP+Q6LtxFdqlHfhA2aqaRVA/UDGw=
Received: from CY5PR20CA0028.namprd20.prod.outlook.com (2603:10b6:930:3::7) by
 IA1PR10MB7445.namprd10.prod.outlook.com (2603:10b6:208:449::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:23 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::7e) by CY5PR20CA0028.outlook.office365.com
 (2603:10b6:930:3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:22 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEwG1647292;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 07/11] soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
Date: Fri, 8 May 2026 10:32:07 -0500
Message-ID: <20260508153211.3688277-8-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|IA1PR10MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: de19d905-57c0-4d31-4578-08dead16fff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7iMmc0GSQLl1XNlfmTzRFq1qk22dXqfT3duZPG1y3JVtoV9xnKPfTmhh81Tb5JZZVrlLt9wiONG0xXztXMI3wahu8CTuGPKS8h4VyXqPK9QtZthJGFIXVU/nzq/dVc0Fj72b/gpPLn9ecbR65VS0z/qNraqBr37DuLRRFMGHI12iuJRylOwmZYUvI7MqRJITbzppwm5wMVGmuLeoe5YIzU3z7rfRZO/OrsPVpp83hKXtokg2O/xcRzMZcIBHXuFP3XAd/OtDVh5VmjTb0i/G4+ul2F0PQyvqO+DlX692y0bKGO2gDAp6lz7fa607FuSHx9ys40TL1hlCKrjwSRDpKmIMxO8SEcCj+P2O/1lvguK0kGFIuMPg9MhoqoPdv79YqPUHbUu+ggTK63fVwTsHefzdNkcHFCy1StexZrOjJVxfzdCIsIwiwKWp/KfLlHjm99CORCDwobXZIj1SP/CjZVuS9tLmT9jTO8QxlEmLOUfKF9hyB5eJjvIVNo2dMWF54rBUM4rbiKstyA/zeSLz+ktHMQ7P/s0XsT1avj+EnyqtDq1/hxAFGWTeNSEd3NmFTRsfLBzOWcQWimVdwTGIMzZw17hF5llH4Ls0bFR9dyCgsD7RxUgIQpq/dicJKK1WjAui3xv6GiapA/aNMN7++tRCTUMGmP0eFof6hu5llOfjlO6voq43MQIwk/MSFKOMh5scj0RxTetdRgosL9DWNHyyxes9exw/M/gdGd0Eonk=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sWVoPyWodz9HvAkqi8Jg50ndaLZ0xLuf6n0F/gmH/ephW1UYpfPNP3AVZg0p6r6oBh9qEG/0ntkuu+t8cpt/qAStjMaQXaKDIXXrhdF/Hr8wHjeS9YrfgIW4JFNyg03csLKf7pq9GfWa4jMXyY9q4xyaWNBpepxLVBnko2uVex/WYBFqeHoCf1cjy+4Dw1f3MGA+4v5Kd4SGrp09trbDk8L12225YX4XFTEsTDKAeg/WDVZAuh4+E5imVMuKNlBcfmtrbKJ/GZ/+LyhD1R8j6SY+fcUGeeNA+pv7OeWToKz1XTq+D3LFb5gjtS771JEQExkgaLpe2QVgUXE3a0/iMtzpXw/wA55TmvuWLQWewdAlfxC9ZyzLChtrjqJaNyWEQL6yZyXhEKkTdoQtd4q7rIaZDqhLaDjce4HmTNON8mf4A2yh0CTJKAR7h4P7MTwk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:22.7280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de19d905-57c0-4d31-4578-08dead16fff4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083232_961164_2695CA75 
X-CRM114-Status: GOOD (  10.79  )
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

Fix knav_init_acc_range() use of 'Return ...' instead of 'Return:'
kernel-doc comment, which produces a warning with W=2:

  knav_qmss_acc.c:473: No description found for return value of
  'knav_init_acc_range'

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Randy Dunlap <rdunlap@infradead.org>

 drivers/soc/ti/knav_qmss_acc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_acc.c b/drivers/soc/ti/knav_qmss_acc.c
index 269b4e75ae40..1f8b5acdd462 100644
--- a/drivers/soc/ti/knav_qmss_acc.c
+++ b/drivers/soc/ti/knav_qmss_acc.c
@@ -466,7 +466,7 @@ static const struct knav_range_ops knav_acc_range_ops = {
  * @node:		device node
  * @range:		qmms range information
  *
- * Return 0 on success or error
+ * Return: 0 on success, errno otherwise.
  */
 int knav_init_acc_range(struct knav_device *kdev,
 			struct device_node *node,
-- 
2.47.0



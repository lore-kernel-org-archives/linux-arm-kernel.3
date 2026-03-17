Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1238FF33834
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=; b=kUiSGAI8yVrBHZVJjZY6oAnDjo
	TI45g0ug4CadC8LWSvAYJCquPhFXb38uCnxH+yrwAEMCrIvo/0FKM0CA3Uyq2sFdgCdXCLBfjzBuj
	81OLySLgO95rQaF3+Xe72HmAAvGjXyzW/LBTLLeJTFnaiRwHi+8umYJGWgW6GiA9iwB/c8zOD9X7F
	T3i17nF+a9Tkaa/XU2ax0hfHlmFL0tf75UDJHfPVu2RpIs36afaiYgABXwGLa0iN+2E5SqQiry543
	UnuQFrnMKQlp0vrcFqXUGEPdLu9ZOYfiqRuxplF0vuQCup8INxH51hGL6Ah+0vOiPCk5lZOCbuajP
	1bRTBbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RKQ-00000005x3V-0X67;
	Tue, 17 Mar 2026 10:07:10 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RKN-00000005x2w-0Czo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQoKe1yza82N0eWKoDBs9FzjXdxFptEApRRFF2z1usCx4UzzjAi80uNDF7ur2Ov6zfG2w/z4gJvE8y/jJR6hXdBvlX/TC2YIAU/HZGkhjIduxeUv7NI/SoH1Z5DnE3TYc7oq8F88fsnj0i46p2b4bh3Ub5CfbY759amXlGLUZouMLn4FYuK7FidZ3I7OTT4ONc8bC27BNSD95FL8/QJFjYYd9ZAt9se1SIBJ3lcUR4WhuKSG7f3NBg17zOKa3dETRFjqotCbzBs3MsvomhLnDIB2UnmtV0TlWvugibj5WjFuLojtlNVQtRTYMt+zTnPtrMK4n9yGqT2jABn0M5I3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=RRYizxjJrTUQyYwIAAt/YYdiGM0uQ9Vu0WPtw51s5i73ONsbbJuyghZgPGmrnJ4Jqm9Ij74vKStMr69Jo8mRCEg/IpcKsSBkT4btjAxA2/bOeHyRC4awtYgHyrIMmzNI1kmxuK1x82tTEHtnDgSuveUlidgUj55yRDYC9vcFNuhZhUFhuwpK0MKQkGM1lTvh2Iw3CcrvJ2sw5QBPvC8Anz08QJfsBzlrTimCf+T3ydHs80Md8osg4WSEYN1pnAwilWk8tZB4+1SPr278ffuTFEgqXOzjnPCVcNncOCa3Qv+FfIUNCoDUHlz3wcgwhuJLYCkv4/6p1yUzS677CDa7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=MbXUfb+BJ+ujH/E5MD5DokjqvDst704Z+mnRjLM2S8yN6v5Us2RrPYkr9wHt5k+CrUQgBBx716kYIYmg6YNN8md9z5R/FBNRxREFo5jvltucPV1viS3lTYc9LJpr44nhHRNvL5L6DP2lXlKpd3iEF8ti8F/CI/QcB81zVa6/D0rYhqeNzFLgf4nnlxrnMZNk0NVqih2V0TMfF8C0R20pn+Ovlr9d/sHZMg7Tdpj5NXll16AKbUqKh5SjS1Yr4g6hVC4T2xNQ2SENWVcNm9KaOiAac3/fAENTHsXj+jh/KiAeKabsV3pKZlk664uCr1qSdRtTPUsAs4P23AiKAVFj8g==
Received: from DU7P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::30)
 by AM7PR10MB3509.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Tue, 17 Mar
 2026 10:06:57 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::b) by DU7P189CA0020.outlook.office365.com
 (2603:10a6:10:552::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 10:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:06:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:09:30 +0100
Received: from localhost (10.48.87.205) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:06:56 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 17 Mar 2026 11:06:54 +0100
Subject: [PATCH] pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAL0nuWkC/x2MWwqAIBAArxL7nZCPnleJkMqtFspEJYLo7kmfw
 zDzQEBPGKDLHvB4UaDTJuB5BvM22hUZmcQgClEVktfMkZ2j33WIhxR6M04vdGuDjrVK8VKq0kz
 YQOqdx6T+dz+87weLwESdawAAAA==
X-Change-ID: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski
	<brgl@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>
CC: <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AM7PR10MB3509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Ow/g/BcdkWV71WY+AORFAjWRQWOFZ9FcKER0f8YQhDfDo9G4JxoWL2EOvU3ewQhQnnV8qTb7w+tjo9lTmk7QXofmdp8Ap+foKQbfA79pPDZyJIChr0qTWkxd2IJ8kWieKP/+pFi1P7m9fFdPa2pPQsbgmehqMHPauyZ3V7nGB9xzzuqbeCB4GfbVKML6ybUG1CUnhlae5CeMm34q3kac8PtdGmsjxUp/DvAJJL+BooCP4mcw1G0NlUmb3AAIgo9t2vfMsdfYULeBb5R8f59TU1JJ2hDrSbmUzF0OnE7Oqxe2UOGP+5xwZmP7/Sj5ckpV0zUgdkPBMMZ/Oubo2TJq6m9uFq9vX+bIqIe3dvVN0NpXKYYrhmll13sU7wtuR75KPull3OvT1vKs0iV7UE3kSfMndEsQGJ+b+8CpQmqIxj6LD8j3U3hjTNY4VORpu1CZMpsvmxW4z8byNLoRM6zGYuewqUA7IP17bdOMMz9vHjka3x7YeOS+t+N9iLSr8iuwPCquoY6USGyX4o9XrgwelXXfUWSq4eT9b61i+l3En+SENApurjusegG9KkIY/twUet8pvG9tVqunG1ST658viaz4RJzs9c4glPe9SJgCYz8bXqa1NVjKrkpO5dPy7VvuqnzHfHsLGwlRhVJSaRDE/StzPO16YATUXcOF6FEWjZAtMorbkVlzGr4XfFwcM/SvQ5RWleVbTFffGp3aMBxNX6+AwB6ro33FKO6WcUPnl17HgCmQ+wA4MdOjO7528ZpfH7xTjdVUuKA5H7OuPslO0Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4a30twd+eZ+cr8u6kUUKx/uNCqtlRpmvl6ONuKIRRT+NPYh6hsDMW4nbZa49D32V8BHpE3PeSuWYP0e9z2ydmAFVF3FpFcGYXUS2Vs28tqu1Eg5Ll/brvkh88e2+pCcJXWyJyH/QSRU+rnu2IEKST0NZwW+/dt1A8AGiM2B0/HElvS7GeXAHycL+GlP+rOtiwRE9VVbG8aFQnAF3TmV9oq10+yZ81+ngDwuFw6nuQv36W/njqgnrT2C9rfrhg7hJ8RBxxaGOJEJ5FJPhnit0M8Hf7e1KrkKJQBKCDwR2iTzzRzgApYwFIBCkLyXd6/OWxtuvvWDXGzSR+GoiY936SbCxsbC5uoKQM9SqUl6WZssGDKa8N5JSJlp/Tj9cILg9y1FqYttYbBYZiwruMIZ7UB6n1NQ6D1dDWcEOLDB1KLljOxin6yQDTH4LMXjscKm1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:06:56.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_030707_117214_73CFDE08 
X-CRM114-Status: UNSURE (   6.67  )
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

The HDP driver uses the generic GPIO chip API, but this configuration
may not be enabled.
Ensure it is enabled by selecting the appropriate option.

Fixes: 4bcff9c05b9d ("pinctrl: stm32: use new generic GPIO chip API")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/pinctrl/stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 5f67e1ee66dd..d6a171523012 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -65,6 +65,7 @@ config PINCTRL_STM32_HDP
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIO_GENERIC
 	help
 	  The Hardware Debug Port allows the observation of internal signals.
 	  It uses configurable multiplexer to route signals in a dedicated observation register.

---
base-commit: 263447532463cf4444a3595e835b99a4e90952fa
change-id: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>



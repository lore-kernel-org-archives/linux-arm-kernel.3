Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F9FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3SZmHgQbHtOtI3zi5Ftzmb3XJyHChP8JCZf5wUhzN88=; b=gbVJctwjhojcnnl+F3Bo7FvNZh
	iyys9tGsCPAsPiKanGrrE63otME8+JkGMALicl9fy7BNXMfQOTVaX9+n8INMezONcRxQNrtJUuYs/
	Qo5WeF0aK8EVid19jir7fiZ0tmYZ04cbztY2vlcXxmFqcHGgnYO4nHofKLReWFlBh9KdLdAh37uTQ
	s2kc6dAI5+5hOTcP/iEBmll4IIN9yI+qn/RsrUEA7v1B1bfmtbvUKNO3F1fhgSa+enAF61aKzysnI
	gh2gjF1SEacDp8oZ/P9YbZVRTyZUX/PYV+INd7qHv2UJ64oGpmtjGuS3JPYuYgsjQ5M9R/alOqVyW
	ZdYcmbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1jX-0000000BiRj-3Bl0;
	Wed, 15 Jan 2025 11:38:51 +0000
Received: from mail-dm6nam04on2060b.outbound.protection.outlook.com ([2a01:111:f403:2409::60b] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1hg-0000000Bi01-36bf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYMs0oq4iLAs2eRtRumm3Leh8gaBYcwhNLPtmfhtgWU6dV7ep4gOubl+MBxN4IySnZoWz9opsgfRkbFcHJkdlYn4ZffjPKBUK9WrqQEXH8WbehT3ZOPdjvaxD5yN+MxbftRG6tzBE+xrouzf36G/hdbIRTwr+IM1PFRX1NPhA08dqa+OaJH3bYo+KyejzP/IgdRZ099WeHAxgKltLXErcb0fyfEE8lEJJYQ57hmSuo3T57F7sxaESfpw2SP9CodQ/UJe1sQ+6oIHe9SGEkXBStnYPaML8TOilud7aem00ButZ+kkKLAH/AOTMP799/7teyBWjWt8+qGg6I0sXHCyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SZmHgQbHtOtI3zi5Ftzmb3XJyHChP8JCZf5wUhzN88=;
 b=kC5dwRI8spTl3fGDcCEFs8/JMgRulUvf6fRLJO5Ozc+LkEQ1txZxaYysk3nntMBHelqGY+X3VeqYzGAJ/xg047Tp5+RCNRbvlwPy5QOleaBcXRkNz9dY9OdIlJLVkdu9Yi58AKg2salonK/wGSeLsniMKO+dxMXszajfbGUSFWMPLWEFcWgWbMCtTkCItGs70uLic+Tflg49e+QaTwM5sCkT7I/rfTLmSY0ZcGmMQJ9YFbaPg6ItJYGOm23AVGtGfshgbwkprb1vwKfRaPABEOdQHCdAavrc4CsKWGlqohsyvbw735umqsVLGUPibh3IWySujNYNKGvNRkr/sSjzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SZmHgQbHtOtI3zi5Ftzmb3XJyHChP8JCZf5wUhzN88=;
 b=InY/eUTz5J4YAgcv1kwTN1CfYhPT/h1BWD9lEIKcsjZskQ95lo6XV3+0CJRbjI5n3Zprhv6IczIZ/csJR+8Q433/iRJE6VRTBGoIZHo+xwBKIH9wcCNqQ2f4nWOT9UN9U/iLda9no0eL928fE+0MmdfeZS5hBAQcIntkvfXYv+U=
Received: from CH2PR12CA0009.namprd12.prod.outlook.com (2603:10b6:610:57::19)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:36:48 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::df) by CH2PR12CA0009.outlook.office365.com
 (2603:10b6:610:57::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 11:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 11:36:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 05:36:46 -0600
Received: from xhdmubinusm40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 05:36:43 -0600
From: Mubin Sayyed <mubin.sayyed@amd.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <daniel.lezcano@linaro.org>,
	<tglx@linutronix.de>, <michal.simek@amd.com>, <ukleinek@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <git@amd.com>, Mubin Sayyed
	<mubin.sayyed@amd.com>
Subject: [PATCH v4 0/3] Add initial support for TTC PWM driver
Date: Wed, 15 Jan 2025 17:05:53 +0530
Message-ID: <20250115113556.2832282-1-mubin.sayyed@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f8c607-e30d-4ad0-b8f7-08dd3558e58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GnsHl1SgXoArLqLXE4eUZWl1tG1VLnipbWIuTsFng7pvUua03aDjZ6wt7kc0?=
 =?us-ascii?Q?yFISflYAJvsw616el8pVfd9cbgpKCfhqP71sy5+zvOHVs0QPmmQNlTd3/x5a?=
 =?us-ascii?Q?x4E8SzZIDvyriCsoIoswa8pCbId5krXatKqrdnMX1ATIeOBdOQZmoMHoydWm?=
 =?us-ascii?Q?4EXbkYWr/g/6PdbAxdzbLPhjOdjR6sC+j3DgmGnrBcqwEXIrBpa0hcwB5tPq?=
 =?us-ascii?Q?yX9a9qEP6ySXlwpHsh62X5gDwulE53CBZ1yADEwiNL0ZOPpg3v+7EOcTykWZ?=
 =?us-ascii?Q?A1T1U2FQQeagdM8lGWQdMj3/EzQYTIBCkrZRjCGt6Xc1vHWXPSaUnpBVIEgw?=
 =?us-ascii?Q?8sRVQijqGePHRkTl83+nHCqNKy86boZlD+BcM9aHTLtwL+Ry89rftXzy0nEu?=
 =?us-ascii?Q?o9dXUG4xRTKXTxAJrBHE7yy5owpqyYryLXoSgwhtpp+Iuq2aSS18oM+ZRJpJ?=
 =?us-ascii?Q?fI8XnUGbkyMCvjIk7dZaZ7TS/xkc/CIAJtjHMEIHgWJQaoavxJG0JoVzcZ1K?=
 =?us-ascii?Q?bFeQ6bT8/ClDmQRYvmLgzRMF9KU1X+p9DHdgyb9krftWoyrXCNuQeTi2OCa/?=
 =?us-ascii?Q?n74rWDdEvc3qn1wT7iCuv6Pscqw7FzmCGa8oECQQAk/HfxbgSyRFtoNPJ9K9?=
 =?us-ascii?Q?ZIcxd997qMM6ma9PjxfkskzxlAnmor9b3j0cjprPwU2KXsTAaJn4Y77knIDZ?=
 =?us-ascii?Q?A85Axg7wJbWWd2/oQOQI8BChfIXkBx+eWAiC46SwrBN8JgzRlU0sYXNbDf6D?=
 =?us-ascii?Q?leWoCEKB1i57mfaxMcK7LwO1q9bfTbNHried/1QGsttSaL0h1YypA3tdPYB5?=
 =?us-ascii?Q?k+tSduJnmPzHiZrBU9+CZdtW0jkL+f+0cCMngJ2SLE6/jOjN7IC6Y2KmQDt/?=
 =?us-ascii?Q?4jXehiyAz8CfczC7gv06O3Gk8b1mAMyW6qudWESavZw/s0p14FknoBhL5FXc?=
 =?us-ascii?Q?lpVgZSe+sIW6rHTRZjIKAa3a9XqkCR6gMlSGYONyy6w+xHuNEO9Y7B0IAOYC?=
 =?us-ascii?Q?7oIeNgKDQHoBLpShmtQgAZSYOGxxv5tqKE/CX7LDICz3uPqiUjKf6LmCbxyh?=
 =?us-ascii?Q?lSsO1FNfzJDqYwvtPS2ZYASDFO9KaA382r3sWCXyQ+pL/hv7j2FkhaUac4aq?=
 =?us-ascii?Q?6Ue+9gaCUne5UHrwdwPPuq6MwjFPoVzNe2rkZvU68w6S3mQrLqYr6Z78XyUo?=
 =?us-ascii?Q?+rXYlOmryZkhlEtinft6T6CrTysmifVAIgjxJFaj6XJMiYUJuvGNwQHVn+9n?=
 =?us-ascii?Q?wAFg0ybayzQrkJJAq/NVIFUE3G5BNIfNZcKAihnYponsrGSEqIojk0dc6MEo?=
 =?us-ascii?Q?E0RkHJi8e1adck1+96bvfgIfGb4NMRgE3jyNpfy1yJOpiE32rzKYs+HpuVgw?=
 =?us-ascii?Q?NhksVFFPkMsYd0ciabtuIqy1eGdc+fDq0qjsP/oVYWySSyG645T+1zMSQgB9?=
 =?us-ascii?Q?xA11d5AEo3J15vQyOeePI6gjquif0cLL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:36:48.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f8c607-e30d-4ad0-b8f7-08dd3558e58e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033656_819289_F2C6A6E0 
X-CRM114-Status: GOOD (  11.99  )
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

Adds initial TTC PWM driver.In case of TTC configured as PWM device,
TTC clocksource driver calls probe of PWM functionality and registers TTC
device with PWM framework.  With these changes drivers/pwm/pwm-cadence.c would be 
part of drivers/clocksource/timer-cadence-ttc.c driver.

link for v2:
 https://lore.kernel.org/linux-arm-kernel/20231114124748.581850-2-mubin.sayyed@amd.com/T/#mfb786b5d23fc8948375b9b570f02a0e5a8095095

Note: Bindings are merged as part of v3 
 https://lore.kernel.org/lkml/46630fa5-381a-4006-ade4-2c18e76331ff@linaro.org/T/
 
Mubin Sayyed (3):
  clocksource: timer-cadence-ttc: Prepare to support TTC PWM
  clocksource: timer-cadence-ttc: Support TTC device configured as PWM
  pwm: pwm-cadence: Add support for TTC PWM

 drivers/clocksource/timer-cadence-ttc.c |  62 +++--
 drivers/pwm/Kconfig                     |  10 +
 drivers/pwm/Makefile                    |   1 +
 drivers/pwm/pwm-cadence.c               | 323 ++++++++++++++++++++++++
 include/linux/timer-cadence-ttc.h       |  55 ++++
 5 files changed, 423 insertions(+), 28 deletions(-)
 create mode 100644 drivers/pwm/pwm-cadence.c
 create mode 100644 include/linux/timer-cadence-ttc.h

-- 
2.25.1



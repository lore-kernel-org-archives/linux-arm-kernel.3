Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F41D47CC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otKDOuO6PB7RBPtimtNYl0/e0arpCFz1+wlsE+umwvI=; b=Iu49vKd1YXKzY+Guo0t3RjLOsq
	winWbJehVnFrrLnN/SOrXtrJ3d+vkVfLpeJLYXj/pHdu0OJuc2o68/h5YfCFilTjfbpSSd6NBQaaC
	bUPQPSyZqTezHNkn7RCp6WQZ7ZQwQBf9qZ7KcBLcq3ad4tZ55BNAgZ26IOt3Yv0vQBMyB/QoK/eI1
	KZUwv0GmwnKHLdPxMFXd+aTNv5xvCvFjk7urIwdL+rIBG4L9c0DBPMOxdyMTbPBUQGwSLWs9ZWlQX
	MGdC2Cc38xaUjhSbRDR/YGM0FonfebpYL5XxF/yTnhxcCohauZ1VKSv1j8JLRxSUmeCNQHP1XpF7/
	VjF3iwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggy8-0000000Dwqy-3vHz;
	Fri, 16 Jan 2026 10:22:16 +0000
Received: from mail-centralusazon11011038.outbound.protection.outlook.com ([52.101.62.38] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggy6-0000000DwpL-03QI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:22:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5CnP9FUqfuUY/UhfRQ6icv2Z9CRUR0jEvqpzoP3TriiwBsOUVWQ9z1b+xVwABiYgw0qkmCb2dQ4O9HxixvwxOSYDh9bjP0dxp9IFttdso8APkXvYeW4GHy3JyHhNigjPugvhdzMybdJraED/Dsg3EIH5uRK/+2UiVK+bS4+vKGRZ5NnI+JWZCiRwoAQHOylcyqLA2XSUGsyPkyt1OFEvxL8E7EFTPevrrDxFNtk+EEEX7CWNr1omlMgcq1wwZJWHC45DHQnwL/bjgYA34I/0/0TFFx/QeIP1LGHZRIKFINUxey5tqeFzkz7QmQWp/7+O6Sg032w2Fy964e6KtsJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otKDOuO6PB7RBPtimtNYl0/e0arpCFz1+wlsE+umwvI=;
 b=MDk/fktAIJOd7QQXJe1co/OqMSktkBv0hqBuk06ov/Vurf6df/Lq1tROSqGHFhFFNI9ZHgI6jgAYCECU3grM8hcbGpFSeRbkcYEdlk1lxDvVFs1AeSqiWDZdDbXGqaCgHdhCI1uG2Wkbx6UEGnl5ByF2mYeA8MkUppFU8bLootceFkXOslsy8u0xOYXA9p97TMiv9n6jZ8pWlzQ/z7fffqFX+YpyMbq3efT3iqEWmZIqcUbKAYmrhCgnNC80jvw64F7RGfJfZ0Icd+oWODU6CjyOvUKozDIilOnQz6H7bOyVqouKcDWYs/MOw5PHKeYW2FzgWr+ynUmv+LwJqV/8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otKDOuO6PB7RBPtimtNYl0/e0arpCFz1+wlsE+umwvI=;
 b=WMYWuOMsI6Ky/hY8aqjc9cMntdzGIQioDuv+Yg5v8JhVYapYeZkiwmfuRItVJ21UQUROyIRYz+H3zTWbNOLcxL0dVDLt2gl40eyb1D3+YM34WOl8GBaaVo7MxUm/q2LR8lBk+0sEH61SYO4AjLkqD6IvebZ38ERt7GMZ+PDPaw8=
Received: from SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::17)
 by SJ5PPF77807A52D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Fri, 16 Jan
 2026 10:22:10 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:123:cafe::e2) by SN7P220CA0012.outlook.office365.com
 (2603:10b6:806:123::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 10:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:22:09 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:22:09 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:22:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:22:08 -0600
Received: from [127.0.1.1] (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GALnXX3128184;
	Fri, 16 Jan 2026 04:22:03 -0600
From: Dhruva Gole <d-gole@ti.com>
Date: Fri, 16 Jan 2026 15:51:30 +0530
Subject: [PATCH v2 2/3] cpufreq: ti-cpufreq: add support for AM62L3 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260116-am62l-cpufreq-v2-2-eac7e2e78d29@ti.com>
References: <20260116-am62l-cpufreq-v2-0-eac7e2e78d29@ti.com>
In-Reply-To: <20260116-am62l-cpufreq-v2-0-eac7e2e78d29@ti.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Kendall Willis <k-willis@ti.com>, Sebin Francis <sebin.francis@ti.com>,
	Bryan Brattlof <bb@ti.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768558909; l=3104;
 i=d-gole@ti.com; h=from:subject:message-id;
 bh=ctt99zk5F9CLIqmpNc5xK3ZhMUd4fI+ZRFYr7sR4TN0=;
 b=i7ahP90c05X00Do3RCsVEtgDv5pFXu6EnEBemsIrZyzdguCrZ3bFHD0n1Kp48aMb9+wmWPa4v
 bhnD2ORFAHdAdCY7+zvF31EoFxZx2Egzzc3l4A3AsoAn5+xUcKLfvhe
X-Developer-Key: i=d-gole@ti.com; a=ed25519;
 pk=k8NnY4RbxVqeqGsYfTHeVn4hPOHkjg7Mii0Ixs4rghM=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SJ5PPF77807A52D:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1aa4e2-5752-4e6b-031e-08de54e91b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|34020700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFJ3N3FQSDZGbmpBYW1FSjU3bmJhVlgrTEF3K0xicnZuOVlGcW1Qc0taanc2?=
 =?utf-8?B?c3dxaHpCKytjYzgxemp6Z3A2cnhRTDZIaVBDaEpKMTBDSHdZQUJwbDhrNWFE?=
 =?utf-8?B?Sk9xdCt0aWxLUm1tN3BiTlZ4cUtCVGR3cjJEaG1CVitXbUJZNmZTMUdCTllp?=
 =?utf-8?B?MmdtdWorRzAzMm90VUsvSDcvUjllSjI4a2FqbjgwUUhUd0x6aFhLK0ZSaTVz?=
 =?utf-8?B?dVo1c2xvMkJta3kyb09MWFJMRUJYbmlsSWsxb1JCcitON3RiL0dZdmF2WVdo?=
 =?utf-8?B?N3ZnYkd6VEVwRisrdjJBQktyMklGMjYvc0NmMDE5NGlLSHcyQWRmNFpaMFVa?=
 =?utf-8?B?OWFZMGVJQjJnMnhYeGRVVVUxaVZEbGZaNCtwQU5FR2xvVERzTE5xUXpNbVZN?=
 =?utf-8?B?YTI5ZWpDcVNKMkUwNkNPL010cGNhZmRiSHJxR2JkcURzckxDb3ZEK3kvVkho?=
 =?utf-8?B?UXhvZkpuV3pKM2xBTzBkRmc4Y2Z2YmYvNlpRbDBZcE9hVU9WQ0xoLzBJOEtp?=
 =?utf-8?B?amF1aVFWOVlIa2hJSHdWR3M4eUNBNWJGR0hvQ05tWFBid1lkRlo0QTVVbWhw?=
 =?utf-8?B?VVBsUjZrQksxbk5uV3V2Y29uVGE4azZ2WVZNdjZkdjBNQmlkRVpLMXBFcTBV?=
 =?utf-8?B?TFhqLzRvamFlc2ZVcHZ0M0lqcWlwZEV3RktzK2JNZWNaRTlkOUtJT01uYmFq?=
 =?utf-8?B?ZWNxYjZzTzNuS1NyUGJnUEI1SWVUVXU5NzE2WGk3Q00vWCtmV04xcW1xbzBl?=
 =?utf-8?B?bXMxb01BVFNJRktqd204aXduNHlPeDQweTEwYTcySFM0aFBJSEJhWExNNXdJ?=
 =?utf-8?B?Z1RQTlJaemNRR1hhek02cjFXV1FFQW9wUHRhV1JSaXE5Tm4rNGhueXlpVytU?=
 =?utf-8?B?L3ViYThselRpY1JVMk5uNmppbHdHT3pDZHRQd1dGZnJWV0t1QUgyVHRNZlcw?=
 =?utf-8?B?MlVxZVl6QnNSR1hJMWhJY3dSSGZSZzRmSU81S2RLaHhISzBETE9ua21aUWVq?=
 =?utf-8?B?N1lsRnZ1aUJDV2J1eHlaQ3BkT1MwNnVPU0N4RnVXZWhKVTFBOTBabVR6c0M5?=
 =?utf-8?B?LzM3eExzTGpteGdlekp3TXZ2UzV4STZQVXNXU3VjdS9HT3d5RG1yZVhMN0gr?=
 =?utf-8?B?Ry9jNzBrZ1BYdkdWbTQrMlVVVWo2Yzl5K1Exc2R0SWs4eWgwOFpjTStZbmVV?=
 =?utf-8?B?d29qeTFnOS9aeVFRcncvUkNlSDBNQXhZSXBNSTN5S1NXOC9iT1VVT3pKUmFO?=
 =?utf-8?B?cXYxRjVnSENYaHR0bXk4RkpMS1cvUW5NeExYbWVYQklNWVUzcDZUMXRPUThU?=
 =?utf-8?B?N1V5YUtyUndJejNWdlRJUzZzeC9CZDdKcC9jdmIxZlg0UmMwaGgzVDdvSmhB?=
 =?utf-8?B?aVVPRGFUNEFjTHRuY3NyaGk2RkNwZzg1UFBNdGhRK3Q3T1V1T245azRDaFlV?=
 =?utf-8?B?UUgvY0liT0MwVXgweEpRYXV5b0xLdm1xR01vNkVaSFZIY2RkVXE1VWhIVXRQ?=
 =?utf-8?B?QS9xSmZhd2d6QkQzRUVybDBkVXlaR2JQNXNvOGJpbzJJVjJIQmFaWWVTbndi?=
 =?utf-8?B?anVMcms2VTVHUGVVdzlmUElhdDJTL0VCOFdJY0E4Zmowb1poQmxtMk41YWNq?=
 =?utf-8?B?eEVrUkRvRVovTkp6c3g2OCtNek1SaG9VRGJwU0tDUEk1eVQrVzVyUlFvOEFV?=
 =?utf-8?B?a0ZiQ3IvTm1vdkpDcUtEOWc3MWpUYmk5WjAyb3VlTlIrV2NQeXdXQlV3aTNP?=
 =?utf-8?B?TVQzdVZRZFlzekJ0VXNpTG9hYjR3eHRITER4VnlVbTNSM0RnYnZ2U2FacGF0?=
 =?utf-8?B?OXZSbDdyb3JUS0VvN0NWRkd2MCt2UkIrNTBpWE9LNFRURFZ1V3Z1cnl5NHUv?=
 =?utf-8?B?c2RWQ1ZKdlczdkZUQm8xRFJIZWNES29sVFVZaGpwR2xrbjRkTDg2dGFYL2xn?=
 =?utf-8?B?dytuanl2STB3eExvenZvYVpMY2s3cjNPRmU1ZXZoSVFyMWl2SlJydDhJeExN?=
 =?utf-8?B?L2xNLzVZTFZjR2Z0K3R3dkNJU21SQlVrUTU0VFpQaW9aZTgvYTYwc1BhdFB3?=
 =?utf-8?B?WC9BSGdtM3l5dmxpTjNXZ0dwTjlIWU5Wcnl0N1RKdUR6QzNEOE5DT1FjdDJs?=
 =?utf-8?B?RGY2R21JM1Z3Y09qczJkakwyNWo4S1dtbVhWeldOT1NkWGlLcGFnc1lsWU5p?=
 =?utf-8?B?V2FuNU1pUzRodUtLWXV3bU1lT2Y0eGdjNTBxYlBIOTlmUDZEMEtsejZ6VkxU?=
 =?utf-8?B?SnJmWjQ1Nm9xenZZVzRzcVF6SXZnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(34020700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:22:09.5623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1aa4e2-5752-4e6b-031e-08de54e91b5e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77807A52D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_022214_060860_0A1B9233 
X-CRM114-Status: GOOD (  15.71  )
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

Add CPUFreq support for the AM62L3 SoC with the appropriate
AM62L3 speed grade constants according to the datasheet [1].

This follows the same architecture-specific implementation pattern
as other TI SoCs in the AM6x family.

While at it, also sort instances where the SOC family names
were not sorted alphabetically.

[1] https://www.ti.com/lit/pdf/SPRSPA1

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/cpufreq/ti-cpufreq.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 6ee76f5fe9c567b0b88797ddb51764a2a5606b16..4e65e96b784ee908716c63316bb54eb1ac1efc49 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -48,6 +48,12 @@
 #define AM625_SUPPORT_S_MPU_OPP			BIT(1)
 #define AM625_SUPPORT_T_MPU_OPP			BIT(2)
 
+#define AM62L3_EFUSE_E_MPU_OPP			5
+#define AM62L3_EFUSE_O_MPU_OPP			15
+
+#define AM62L3_SUPPORT_E_MPU_OPP		BIT(0)
+#define AM62L3_SUPPORT_O_MPU_OPP		BIT(1)
+
 enum {
 	AM62A7_EFUSE_M_MPU_OPP =		13,
 	AM62A7_EFUSE_N_MPU_OPP,
@@ -213,6 +219,22 @@ static unsigned long am625_efuse_xlate(struct ti_cpufreq_data *opp_data,
 	return calculated_efuse;
 }
 
+static unsigned long am62l3_efuse_xlate(struct ti_cpufreq_data *opp_data,
+				       unsigned long efuse)
+{
+	unsigned long calculated_efuse = AM62L3_SUPPORT_E_MPU_OPP;
+
+	switch (efuse) {
+	case AM62L3_EFUSE_O_MPU_OPP:
+		calculated_efuse |= AM62L3_SUPPORT_O_MPU_OPP;
+		fallthrough;
+	case AM62L3_EFUSE_E_MPU_OPP:
+		calculated_efuse |= AM62L3_SUPPORT_E_MPU_OPP;
+	}
+
+	return calculated_efuse;
+}
+
 static struct ti_cpufreq_soc_data am3x_soc_data = {
 	.efuse_xlate = amx3_efuse_xlate,
 	.efuse_fallback = AM33XX_800M_ARM_MPU_MAX_FREQ,
@@ -313,8 +335,9 @@ static struct ti_cpufreq_soc_data am3517_soc_data = {
 static const struct soc_device_attribute k3_cpufreq_soc[] = {
 	{ .family = "AM62X", },
 	{ .family = "AM62AX", },
-	{ .family = "AM62PX", },
 	{ .family = "AM62DX", },
+	{ .family = "AM62LX", },
+	{ .family = "AM62PX", },
 	{ /* sentinel */ }
 };
 
@@ -327,6 +350,14 @@ static struct ti_cpufreq_soc_data am625_soc_data = {
 	.quirks = TI_QUIRK_SYSCON_IS_SINGLE_REG,
 };
 
+static struct ti_cpufreq_soc_data am62l3_soc_data = {
+	.efuse_xlate = am62l3_efuse_xlate,
+	.efuse_offset = 0x0,
+	.efuse_mask = 0x07c0,
+	.efuse_shift = 0x6,
+	.multi_regulator = false,
+};
+
 static struct ti_cpufreq_soc_data am62a7_soc_data = {
 	.efuse_xlate = am62a7_efuse_xlate,
 	.efuse_offset = 0x0,
@@ -463,6 +494,7 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{ .compatible = "ti,am625", .data = &am625_soc_data, },
 	{ .compatible = "ti,am62a7", .data = &am62a7_soc_data, },
 	{ .compatible = "ti,am62d2", .data = &am62a7_soc_data, },
+	{ .compatible = "ti,am62l3", .data = &am62l3_soc_data, },
 	{ .compatible = "ti,am62p5", .data = &am62p5_soc_data, },
 	/* legacy */
 	{ .compatible = "ti,omap3430", .data = &omap34xx_soc_data, },

-- 
2.34.1



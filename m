Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA47C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r05tQHc7HMBa2so/wpdZQdRDePJzCfJiaeIowMd3cVg=; b=qC6LN5MQsf3fumha5IR6Y0k9Ep
	DqRj28zx5Rt2KGjnresxSEI2aKT04qH8RNAGosICK8ZHrhNZHPWBy6AGmXFJNQ7nl8M2H0eag1MZi
	yriaAmSb01mqhCTSWVS/jv60wC8wI63g0zvaqwEfVnzGmgTeIXyZAmekGtYjsQI5cp72ZKi3+VPAB
	OZrIYrYitSa2b0qSxlNiIvARdGTwXwYvY8O4ULBxfhBQpGLERg7b68xjHS8XeKOk66iWlWzrgewTY
	k8W+2zp0r5KnX7BRWKXoi+0EzZ2m538oxYVKuA0Jlct0D29lPag9FxaKgmJAaQ94hHtEZeQVdp7lA
	L9OJEX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGZ-00000006urD-0E1i;
	Thu, 22 Jan 2026 10:50:19 +0000
Received: from mail-centralusazon11011064.outbound.protection.outlook.com ([52.101.62.64] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visGU-00000006uoJ-0S1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDREKTvf+TW3zClkv6/yHfRkPqnDPad/8PN2cjoiRqly1O1O69+FHjJf0RoSYmf7drlnjpGwUgrS4+shTdpdTpgMptxJoPbMfkJbWXpUIBFpzBfVdBt3e1tgN+iS3j4SgQ5SdfZP1CHH5ikMjKXYB64Y0Q+Czx7AAjaMKIG9LYV/90bZOvd4cwzRjjTU2ZXeZsNi3Q+QNigoNjfZCKHFLVpIviajn2S+6YYT7P+RojVMabLOX+KFA8DKfQMqOk6w8Aqyp8s0RBnwIcQ97a4OUxfczR3370HjZloseoTMamJBWctDSwS6UCUb+llSKSYLHaAWJRZ68P3qjPv/Q38TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r05tQHc7HMBa2so/wpdZQdRDePJzCfJiaeIowMd3cVg=;
 b=ILaQVY9ff0mPTOMMWLsWNbFksECtXzRThGm08vYv6GAi1egeW1tN87u1TZ6gM5+iXL4xjCMUHuPLZzARpkVIJ/g3dajiOhdMHwNQgv6V9T1msCBKrjrsSJqprTRLLYJPHTXD59LfFyJaOQ2MqRSGEji11HRsLPrcJDCVxex2NrWK+hWxD235R7D5Kydgg+deyuvmOPmtmdrZWL6xzoNkfOt8duav6RsEAaCDMuyl6FpPV5yrfZWSerSc2NuAPZM71hfIBqRlNSOAwq3xPAF/kyB85F2crNP76EybrAnSMk31HdHKf0scSlhxETgn12Lro6uUTXerGeJ6Xk9N6yVIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r05tQHc7HMBa2so/wpdZQdRDePJzCfJiaeIowMd3cVg=;
 b=rp9uyG4QjZxtEmSX4uJoJpHxEGanZw1XqDJ4tNrBoDDjmZ1jQ4Og+S3+JrOpD12jV6ugWcYWdEEXHz0eON5gIme+jzK8KEt2B91o+NJFxgnqG8burEwNYUiW+iwRDGzqWNYOv4ThLnkmNjgOcflMW06D5CY/Zz1Ob4+202J4SD0=
Received: from CH0PR03CA0307.namprd03.prod.outlook.com (2603:10b6:610:118::8)
 by SJ0PR10MB4800.namprd10.prod.outlook.com (2603:10b6:a03:2da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 10:50:10 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::14) by CH0PR03CA0307.outlook.office365.com
 (2603:10b6:610:118::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 10:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 10:50:07 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 04:49:50 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 04:49:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 04:49:49 -0600
Received: from [127.0.1.1] (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MAnj3m438214;
	Thu, 22 Jan 2026 04:49:46 -0600
From: Dhruva Gole <d-gole@ti.com>
Date: Thu, 22 Jan 2026 16:19:08 +0530
Subject: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
X-B4-Tracking: v=1; b=H4sIAKMAcmkC/x3MPQqAMAxA4atIZgNt1A5eRRxKm2rA31ZFEO9uc
 fyG9x5IHIUTtMUDkS9Jsi4ZuizAjXYZGMVnAykyShOhnQ1N6A902xki7+ioDooqY71uIGdb5CD
 3v+z69/0AuspmzmIAAAA=
X-Change-ID: 20260122-am62l-dt-cpufreq-c24f0236ad15
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>, Dhruva Gole
	<d-gole@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078986; l=3821;
 i=d-gole@ti.com; h=from:subject:message-id;
 bh=yswjAnuTkwC000Wn0FE235l5J8AUL16whf8wkH6H3UE=;
 b=WxCqEyaSJsKgDhQ/mG/bsyXUNUdmzH/vH99SVgmAmwTXZ1O78ILAYfCLgVEjVvK1+FfY8cEYa
 6GAgScsJvrrBcubzKb10xPgCaUpqaOIbPC1Tp2I9EZZXaq8cEfMXDhp
X-Developer-Key: i=d-gole@ti.com; a=ed25519;
 pk=k8NnY4RbxVqeqGsYfTHeVn4hPOHkjg7Mii0Ixs4rghM=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ0PR10MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bbf2b0-6d19-485d-a628-08de59a401f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1VQcE1wWFNWL3pQaGcrWVhoQ1RaZW9OV0w3VFFsNGd2aE14ekxQMVpvQ1cr?=
 =?utf-8?B?cWE3MlpqVXlXN2hQVmxuMlFuQnlsZ0FoUHZzSmJoZC9uR2I0QlpvR0dZRVdv?=
 =?utf-8?B?ZCt0OFBXVGVXaXd0UFZIeDBNRnkrVkF5OURVc0VzcmFEbXhoazFGTGRGdFhp?=
 =?utf-8?B?dHJCV2tscVNqdStnVjRNUVhsT0doM2twTVNTNHQwYVpzWGpYblBVTDRNOVJo?=
 =?utf-8?B?MFdLRzNrQm1zVCtBZ1phbEt1MlVYNUZoSmUrKytJY3FqMnZ4ZEZhNHpVL1lp?=
 =?utf-8?B?QXFuMzNsNkZBNndaRXZaemIrQlFvUEFrRVNQelRwVk1BK2t4K0dud0xta1dC?=
 =?utf-8?B?Nm15eGlqWElGYXl2bUpwQlVWdnRhUDhudUZqaEd3djFsNVVTN3ZDZDM3enBN?=
 =?utf-8?B?aGhqalNHNllQV3VObGwxWWNjSmpFallzSVlIVTJkMEkvVk1WMkhuSVFkMGxW?=
 =?utf-8?B?V1FIczZFVk9oMkRvdGVUMXdwWjZxOGU2dWkvYlJjYUF3YjNUSzBtaVp0Zm1o?=
 =?utf-8?B?ZVl0V2xEamhaWEpPdU52RWZqTDA5Z3FGVWpMUndVSzJiUnh2M0hhT1Z0MUV6?=
 =?utf-8?B?a2p2Yytpc2tQWSsyZVZiWnc3dEt1K1NUbmcyL2ptcXdOaXR2Z0QwNTJEVTU0?=
 =?utf-8?B?dkYya0R2eXU4bnV0dkJ3VG1DL1hvVVZpdHpUZXJXM3dmZGlJTGREeFh2QmNi?=
 =?utf-8?B?TzBCM1VzVjlxUGxBVkNjMFB6clloNk8zcmZrbDBTRldvOXF3Rk5GWUR1Q0hH?=
 =?utf-8?B?NUt6Rk0wUDh4Zyt2b0lXWVU4QkQ3Qm9wejFOQWMrUkY2bVNoK1hCaDNvS08z?=
 =?utf-8?B?MTdhajFkV3cyRG80MERiMDNWY3l5OE5EVEhKNVh6aC84Ym9WOGtPdFFaVkJM?=
 =?utf-8?B?bFk1TnJIU1pwanNYb0JveHRTTkk3ZUdOUy9rb094WlpaVmJpU0wvckRwZzd5?=
 =?utf-8?B?OVpRS2VTbk95Vk5IZ3liR044STR6WlF3eW5Sc3ZvNzZYMi9Bc3Z0VjNUK3ph?=
 =?utf-8?B?NlZya3AvKy90cE5ERVg5MWpTeHl1SGo5aXk3L3hGQVlnNXV5WXNKR3ExRzk3?=
 =?utf-8?B?TXF5bFFaVXFZbm54OExWa2NENitnSDJsWWQ3V3VMOGF3VStIcS9nVXFGTTRy?=
 =?utf-8?B?SWlzWE9vYXZMRlBKOUVyT0VIRG1XblFWMWx0TlRva0ZGRm1MRFBiSk9qa3Zv?=
 =?utf-8?B?bzMxL2YxRFRBT3BhS3I0QTBMY0pUcExOM1Jod0x2Tkk0aDBBVExtVk54dFph?=
 =?utf-8?B?cG1jMzN3UUcrV0w3L1Z0S09zUDluczg2RkJGUFU1cmk0SFpDLzBJUkJYaVdx?=
 =?utf-8?B?ZGdMSEJ1TmZoblZ5VFlyZ2V2YkIreERReDlvTGxRY0lVQmVvZVA4clZOdEFT?=
 =?utf-8?B?R3lZeEZzN3RqYU43YkZlQ0pRTEVZYXpDWGZadGExa01nNmhwalJZRi9ldnUr?=
 =?utf-8?B?UHJadWVKYmwzTy9UZWREbWhOVlUyU0NDbWpFL251SkxkUnlMSmI2T0lyMUVv?=
 =?utf-8?B?WWozczFZRjB4OUE4VU1GYm5FZzJzRUdkMzdraGcyYnJGdTRkRnpieVIwZEtW?=
 =?utf-8?B?NXp1WlZ4L2gxQnRic3hhZmNLUmdDdGtqeG1ESlhPR25LeVlwWUlQU3BJaTg3?=
 =?utf-8?B?SHlIa3FHSW12NEJNSE9FNlRSdHFZSDM0SEo5NG1ZT3dsMm5hOXRwWkZycXkw?=
 =?utf-8?B?Y29abWswcFNVN281dU85bVk5SzVQeXBuVDM2UHZERGI4V0tMVE1VZk01YzdG?=
 =?utf-8?B?RkpzbHAvekU4M1gxNFUwVzd3a0JVZjEwS1VyMGtWNGpMODF3ZUZleFNVNVZB?=
 =?utf-8?B?N0E1Wmc3TVdHeTVKUmFISCt2VnlqOWZJS2hMa0pBOElGcHFLNHJTVmw4Qlk1?=
 =?utf-8?B?UU1HKzBNYmEwOVJQY2Fqa1dXbDBUcDlIK2NlbDRqbVcyazhBdTlzN2ZFWTgx?=
 =?utf-8?B?bUZOeEt5QldPc1ZWM1U4UGdTZmNvMTZOUXJxSEVnenB0c2ROMGhyTUpmbm05?=
 =?utf-8?B?ckplM3VsRDQrN3U4cW1xOU9idmZUNHJGRGpZZFZ5azBhWTNlb2E3VEdDWXJQ?=
 =?utf-8?B?b0ZyTGdsL3N6dVNpUDhmQXBxRDhNTmIzSjI3ajYrWmpOSTZ2Y2hIZWZhY0xs?=
 =?utf-8?B?OTc0REx3MFptL1RkMW1RNHkwLys5Uld1WkRlRllaMm82Wnh1eXIrTGgyOEk0?=
 =?utf-8?B?NzVreDcrWkl1cUdRdGtRVnB4MUd3WDNWWEo5K0hodmxZN3NrK0RRYzZyMnp6?=
 =?utf-8?B?UDZYQjcyWS9BQi9GNUlDaXZpNGZBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:50:07.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bbf2b0-6d19-485d-a628-08de59a401f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_025014_162115_2F776FDB 
X-CRM114-Status: GOOD (  12.11  )
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

Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
syscon to k3-am62l-wakeup.dtsi for speed grade detection.

Add the operating-points-v2 table with CPU frequency steps from 200MHz to
1.25GHz to k3-am62l3.dtsi

Configure CPU clocks to reference the SCMI clock controller for frequency
scaling

This enables proper CPU frequency scaling capabilities for the AM62L SoC
using the ARM SCMI protocol to interact with the power management firmware.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
The driver changes were merged previously [0], and so the DT patch
is now being posted seperately. 

Logs:

root@am62lxx-evm:~# cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_frequencies
200000 400000 600000 800000 1000000 1250000
200000 400000 600000 800000 1000000 1250000

Changelog:
- fix the bit fiels in the OPPs as per Kendall's suggestion
- Fix the scmi_clk ID of the second A53 core

[1] https://lore.kernel.org/all/20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi |  5 +++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi       | 47 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..a42ccd0d2fcc4d204cae81508f839c44ce83f558 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -127,6 +127,11 @@ chipid: chipid@14 {
 			bootph-all;
 		};
 
+		opp_efuse_table: syscon@18 {
+			compatible = "ti,am62-opp-efuse-table", "syscon";
+			reg = <0x18 0x4>;
+		};
+
 		cpsw_mac_syscon: ethernet-mac-syscon@2000 {
 			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
 			reg = <0x2000 0x8>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
index da220b85151227c63f59b2b8ec48ae2ebb37e7bf..26d3040ff53259daba21b39a55bb8a2ed65d4e8f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
@@ -39,6 +39,8 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&scmi_clk 356>;
 		};
 
 		cpu1: cpu@1 {
@@ -53,6 +55,8 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&scmi_clk 357>;
 		};
 	};
 
@@ -64,4 +68,47 @@ l2_0: l2-cache0 {
 		cache-line-size = <64>;
 		cache-sets = <256>;
 	};
+
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2-ti-cpu";
+		opp-shared;
+		syscon = <&opp_efuse_table>;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-supported-hw = <0x01 0x0003>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-supported-hw = <0x01 0x0002>;
+			clock-latency-ns = <6000000>;
+			opp-suspend;
+		};
+	};
 };

---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260122-am62l-dt-cpufreq-c24f0236ad15

Best regards,
-- 
Dhruva Gole <d-gole@ti.com>



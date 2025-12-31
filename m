Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE4EEE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjbZE9jEz2RkO+hATcz9oqkL5vPYSOvR+0CK7sCIPyg=; b=2A/KLTsuOqoZniBeh9N/BYg6D2
	ytbwlvnwHCw5n3+c0nUNLJmAliBUJyb2YBGaal9W3hy6hait3oSd8vKbEU8R72zP1lnOkmm+/XO3c
	OX97WzSKnwfnJG3QANWaqddH449/UgAcLlRFo5V86df7GQn72/CHiQxSmJ6u3cq+mCMoX2Tf51ZLX
	7m6AlS6VtQR9qAkRg88nhm3sPBGYKwnBdNRvmrFvXihiz+x8bz3Kzc5rguVqGX6uT0vAatbFbhf3O
	XN4JD6VimTXAa69jSqN74Bm3fi7EM6495y7P7aWicz7/681n+oxoj4n3JRCkvKyAr5Au8Y1vXSx4u
	2zpejJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJr-00000005b0N-2qJI;
	Wed, 31 Dec 2025 02:52:15 +0000
Received: from mail-eastusazon11012018.outbound.protection.outlook.com ([52.101.53.18] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamJp-00000005ayL-14mY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:52:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSUx5MEzlsLDCYytvQnyYzpnpL4rFCbLHSgAmm3owLuo+oB1k+yaDTr69L8un7ykPL6uyR816ul6qMWMuBE+fRRrA83phZc1hoHarkUPL8eZficN6+zDigZYS9jplEoSazxW3F1N7Kj2xFAhWwgN4jWjXnpKeBPWZI123D0ldHGNdJgzGFDLRtm2hyLg3eetoUyywiRIqeAOB9X+BSbC+vDBEU9+7q8KI/ilFYk3hDcbZJ4SM0HBU/ebORPfmgvt6Xkk/eY8uQ39+40WJeATtnOCfv0MO8k0xKlVtqVb2ocOzy4GQPYnXaqSTa6FT2K/QbvQNPzrsHhYMzjTG4Buxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjbZE9jEz2RkO+hATcz9oqkL5vPYSOvR+0CK7sCIPyg=;
 b=aF65Ew5YPOedqouCECh++jj0BH9ioxQFWfhEGHh1bGeFnBwAkuDXvUODEOUDoDnVUyxqcheuE+q6/qN5YeciuXwWzU2tpMOVVTvoiIkPgY6twk1YK6qIk12LOrnqMBBmZa2fhBKUrxd5eRm36kNcFDjizmCEXzfW8QNzvxp52MRoOzVGwiCU8lFTBaMD+BhAvP7xQ8Bmwhc45VjPvlNAtbX6P59ncWpLVLaIKTn99kjxcNbWXfbj9WIPBV32AZwT0k67XRSNheRcaxi8UjyfIctcS2yKUIhflcpvyh2Q7FYYl9og/keOtNb9Z2PcjHZowsLw0dOO3F2IWwTspo8Ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjbZE9jEz2RkO+hATcz9oqkL5vPYSOvR+0CK7sCIPyg=;
 b=hMKCTIKWWCG1Cbox1d8lGFGLIwSASmmwpnA+8lP0VZqrAtvTgsD9hZXgsEB98y9MsY3RShgQpjD/7Jl7d6hiWl+eSJ4t+jgQjj6Zw3XD8RCXvxU/svUPHleRmYmnJNlK+yzlapxUrDEHJVg+42Hn4nsOgvkoTQ8ipnOu1PwN0Oc=
Received: from SJ0PR05CA0137.namprd05.prod.outlook.com (2603:10b6:a03:33d::22)
 by DM4PR10MB6063.namprd10.prod.outlook.com (2603:10b6:8:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 02:51:57 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::ae) by SJ0PR05CA0137.outlook.office365.com
 (2603:10b6:a03:33d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 02:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 02:51:55 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 20:51:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 20:51:50 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BV2pn4w1608844;
	Tue, 30 Dec 2025 20:51:49 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 30 Dec 2025 20:51:41 -0600
Subject: [PATCH 2/3] arm64: boot: dts: ti: k3-am62l-wakeup: create label
 for target-module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251230-wkup-uart-wakeup-v1-2-cd6e15f8d956@ti.com>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
In-Reply-To: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767149509; l=914;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=URW6e5tWlfurWwBRi13gtyD6nAz3NO1rgqjputZLb6Y=;
 b=a+sxnaxc0OHEYbuKdkLgf1NWnlAI1w5ftg2mcVaHKkzDLkbMiuInbuxm45eqUQvovoHqTn4SS
 C1OUDycyMQHAnGanrOEOMheGD0+XAoBV91M5/tSfd3KJy3mRnnjZA/p
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7230be40-6d51-4601-c523-08de48178f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3Z2T2Y0OWVCZ25kTjI3dnN0a3dTVDJ3NjM5M3pyMmZaN1BzUnc0Ryt1RVlU?=
 =?utf-8?B?RTZKYjNEZkwvSkFvM1ZzbnJMYUNBeE5KVjBvOGJDam91cXJrcFJnRDJSdU0z?=
 =?utf-8?B?M0JkbTE2djFtbmRFbXgzcm1PV0ZHYTVXNThKWCtaeUxURlA5VjFaTWJVU0hS?=
 =?utf-8?B?L0NNa25MU0JpbUFPWkdFdytuakFOcVErZUUwNW5qM2R4TlFJR0o2VDZybGpl?=
 =?utf-8?B?b1Y2TG5JM1BMSjl2NlJtWHNUNlRzbXdDSENrUHY3cjdLMmtDMU9td0FqZm1v?=
 =?utf-8?B?SktwSGlCWi9NVzQzTi9QN1ZCNHNKa29kNGg4SlBQK2pGRTUxQXZtOEdCQzl4?=
 =?utf-8?B?Q0dLT3Flc0N1eXpNMis0QU9veUJrWFIvTkxwbU5SRjExRTRSZVBGVVRLcXJD?=
 =?utf-8?B?MEczSVorYVhjUGh3ZEduYUdCempVOVJwa1lPVk8zLzcxYzZxSlFSVXlyMjlQ?=
 =?utf-8?B?dmo3Qk9SMDFOMzdqc3hEY09OL1VFOExJSkVFU0xZalhHRWRUR3d6ekoyaGlB?=
 =?utf-8?B?TzAwR3l1ZCtOYVZkS00zaGpNMHhJcVFwdDNZQmlKaTdHaXVqN3hwYm5VVkYy?=
 =?utf-8?B?bWRGeEJOM3NrU2FiYk1NVExYNURvM0IxVkpQMXhXSHVjUXFWTzVZTGlhNG1Z?=
 =?utf-8?B?UGxIUE84Wkc2K2h2UEZzY3JuTU03WGw5Q2FPZWxwdDl0UzZSRWF3MFNMby9D?=
 =?utf-8?B?QkR1SWlZT1JCTTVoMEM2SW83cDZrTHlYdHppZm05Sm5IblMwR09ZSGYyM2l6?=
 =?utf-8?B?VGhzR1FZenc1Rk05alhQREozOHd3RzNNTzFsR1drczNDM2ppN2ZRY3d2dFBC?=
 =?utf-8?B?MWVHQlRwUFVKL0Zka1AyS2ZKOWRkWnZ0TVFoZlhmanBXUVZIckxZbGJVMUhq?=
 =?utf-8?B?NHo4eGFKRDhpNmpMamdmSUpiKzNFNkF5L1V0ZWErMnA5QzNhUVN6RFZSemdK?=
 =?utf-8?B?T2ZhNmdlVTZBem9seG9meW90VUNUYU5GVGFlM2VxVkJNVXR3UEcrM0pYS2NG?=
 =?utf-8?B?SE5vUUZKV3pkRWU1cDZPUmJTVjk4NGJ6c2FpNUZWVXNZT2JiNWhaa0EzQWs4?=
 =?utf-8?B?WlVzeFdYSmFIWnkrMjJ1amZYQ3lGOU1xaDh0cE8waUlsc1JyTlFreVJKc013?=
 =?utf-8?B?V053eEd1WXk1cWhHckRDb3pweE5YL0U4OUtBZVp3RUdMUmg2YTh6K3luQXMw?=
 =?utf-8?B?ZjFSL0xvRHZMSGlUdWNndEhQTXlaclN3azlvWUhiaVh1MldLeGpZN1JwRDNR?=
 =?utf-8?B?RGR3WjNYeUdVdGwzU096YWUvaS9DNmFwM093bDVtZnBaUnJHcHYxMFFPMUhK?=
 =?utf-8?B?THp6RDFsYmMxRXFBcnM1b05OOFJ2YVZPcFEwSEJpem45ZE1iWUQyWStkbjZV?=
 =?utf-8?B?bWYzYURSUmZhb2dxVjQzdFIwNERvaHV3UktwTThzVnlrcnE4ZnFwaDFnQUkz?=
 =?utf-8?B?N1ZUUjZiTGlxMTdlN1pVanh6bEVnQ3JNQ093bEViL0xCOVg0RGpOK0JZVC9w?=
 =?utf-8?B?Q24wbjZxL3h2RWVObUpMVkNkbUZISXNyUXQ5c0d3Q1N3MXFrZkxDUUxDTk9D?=
 =?utf-8?B?YmRMOUh5VjUzZUNPdmhyOU9aWi84RHdPV1BpTWJ4UnZwNmlZMndKNi92bWZq?=
 =?utf-8?B?NDNoaE50MmtRbFVwM3VkeVp0QVNSOGRGK3Z6eCt5RHpzbXZnMU1nT0xBc1JO?=
 =?utf-8?B?aE9XaG5SblNUdlRmbG1UOUhiTHJXUTIvaUZDVnA0R285d3g0ZVVKdTYzZjNt?=
 =?utf-8?B?bEluTjJpMm9LdFFPczhOUFJiQk4rWFlLd05TNjQvNmU4V0R1Y3RWQ0MwQ0l6?=
 =?utf-8?B?NnltMnZCbTdYMmxveVRlUm41TmR4ODZtZ3VMSk94RHUzbWN3bFFVUUtKY2Vn?=
 =?utf-8?B?aGhDM2UwRnUwbjJqM2luZHc5V3c0ejljWGhyK05DNVBXS3h4RWpUYWR1S2Rw?=
 =?utf-8?B?V21DbVBuL2JQakFUeEF1WVFyeklwRyt5cW4xZDkrd3hHcjQzQUdPNStiak9U?=
 =?utf-8?B?U0dxSGt6MFhYL25RQTJySGZqZGtvNDB6WGlzRWVDMHFCN0thMTF1Z3YxeFJO?=
 =?utf-8?B?TnVnSXEwZDlRdmtvMkhjSUw1Vi81TWtyU2ZCQUJyZk9lRExkcThjdWttbk4r?=
 =?utf-8?Q?BzN0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:51:55.9083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7230be40-6d51-4601-c523-08de48178f5b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185213_308348_7A9C059B 
X-CRM114-Status: GOOD (  10.22  )
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

Add label to the target-module node so that it can easily be referenced.
The node specifically configures the SYSCONFIG related registers for WKUP
UART.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..e9d638d9ffd3a52aa6e0df70f6003879bc292358 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -81,7 +81,7 @@ wkup_i2c0: i2c@2b200000 {
 		status = "disabled";
 	};
 
-	target-module@2b300050 {
+	wkup_uart0_interconnect: target-module@2b300050 {
 		compatible = "ti,sysc-omap2", "ti,sysc";
 		reg = <0x00 0x2b300050 0x00 0x4>,
 		      <0x00 0x2b300054 0x00 0x4>,

-- 
2.34.1



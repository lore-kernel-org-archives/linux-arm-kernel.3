Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30659D2FEFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=; b=xtkS118QlKz3j0djWZnTNWTIT4
	p4/dq1a2TFN0lbVLuqjhF0OSrX4vSDjimbOWfEZB3cb9/gKhJ1g/KwGzYy1z3PIcfpzCo4tbZKZY7
	0AQO/Y4tCJGHf2Prdd/jLkzDoFBS2y4O+krfkzsG2ThPdqGmOXHVLJeAsTWeCTvLTd+53ZAI3QZ2i
	dMJ2YGt9Luj7X4R9hIOvAaAcKR7fB2BJ7WHTYUoCRNsXy4G8AlPN5I7Q87+PWywsBA1y/ESTWg9K0
	zNRejKiiEDflQLbvgGWUAsPoi/fVdcH6ZrBZVmKaKKsgs3nwmfw16S1V38Ec3mW5chiyEq5B+Fu8v
	1FjSpyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrj6-0000000F7ek-1ME6;
	Tue, 27 Jan 2026 22:40:00 +0000
Received: from mail-centralusazon11010012.outbound.protection.outlook.com ([52.101.61.12] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkriz-0000000F7bl-341Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1fN6hPiXeMKozPfrNY8re3vxBGhcb35T7DDGu3pH37PSMAhdzM/irzOPXhhGGQqOKsnkQ9D+MPDR8zXM7VVFMYGQxvaqSY66t3YZQP21Ypbxt0wuVbuqJoqpSrCz9VT2Im7vVclVMz5Emjv02cudykn0ChPAu+SNp8dAyF97M5uuwvuLHTn5QBx/7uzMuezvLRWFbLzL+eUFTmYh9a18W0LQAxcfD5NOcWGfnCy9Ddep+9SA+2vZQGADxylHTihkqsqFZEEuVgWViCrDgd0xdh4otm7RGBI+xP+E7aMoGTXIfyEB6QFqbm+MwtYqapLbQCmPiNE/SFy43LRYO2Ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=;
 b=MOHIJCxH01oJjw6xa2MDxtWngszQL4LuJRjaD6kf/KlvUXweEOfGmEo58dguENegyIuAQSPEWhojw2XOdxaT+Hr2qub9GjdMKWRq3NXXpzfS2W5xlbo/A66LMsUnr44Kkg8ABo8uA00ok2Us757stEGLHk1s1MvxPRSWCD3G9Go9wISbLjfeGiyAJUXUqDmOoLt9ZUzj11q1ccs0nZ4zChnxRVd2iDg4whZC3Xi5sC7AmTWGjEw8l+I6PevZOdveXN1GezHLkaUoKLSDXygEg99s6dwuI/IpgevA8ayu1eXL7cIAz/PwDp8IB2NhFcsNQukoa+TGjg28haf/aqZQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWw2ZryDlKdIX2qq4ckNwpfLkGrW+dyYIEnNyAzU/hk=;
 b=AaHY+pwwXaqEyzbWSIwjfDnfwGoSVqKcggxqcxpkCcvfICiSRXR85Js2OV7p3zgvQWsBiGoNv+r3nFVX5jkmRzgDbSG/k9Iu33uLjdo74GQowWIvY2blzGiPvJnTw5+vnVZvxKNYvBg8zkhpaK6zJudKJKoHl0jq13lbjACXUiE=
Received: from SN6PR01CA0032.prod.exchangelabs.com (2603:10b6:805:b6::45) by
 BY5PR10MB4259.namprd10.prod.outlook.com (2603:10b6:a03:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 22:39:48 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::3d) by SN6PR01CA0032.outlook.office365.com
 (2603:10b6:805:b6::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 22:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:39:47 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:39:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:39:46 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RMdjvE1270209;
	Tue, 27 Jan 2026 16:39:46 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Tue, 27 Jan 2026 16:39:37 -0600
Subject: [PATCH v3 2/4] arm64: boot: dts: ti: k3-am62l-wakeup: create label
 for target-module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260127-v6-19-wkup-uart-wakeup-v3-2-e7ccac761f3a@ti.com>
References: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
In-Reply-To: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Kendall Willis
	<k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769553585; l=956;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=rBwScZZOALzI///KpW7r8Dg3n2vevHBlYilxmmGzAxA=;
 b=e/NCdaX+czkKjY/ANQ6K1zo3wFMBT412iNwUyxTkSoBB6fDNfX7q2pvfke42qs/8m6drGrgjt
 GTPDPxCh3AaC4AblvMAemx9hkaP3mtAKUJEjc+UhsoldEk6Jc53wSNM
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|BY5PR10MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: 2418fe73-a517-4904-6169-08de5df4f9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHY1R1M2UitBejhiVDFETGJHZWpjWTVhSmVqeWk1TFNNeXFFVWR6blZpMzlm?=
 =?utf-8?B?RDR5MnlZZTFjWWNxMDhpTVhGRUN3UUxYT1dTSEMyN05hamlGZ040S3pxbXBT?=
 =?utf-8?B?NE9kVmVUWU9ueEpxWlA4UzlVblAyREZqYldFYzBRa3NlV3NCTGpSYmlMOFR5?=
 =?utf-8?B?TkxXTXhUQ0NvUzNpblZVTjJxS0pGNVd4eGVmbFVRSkpjOE9TTnJvYXhUYjdy?=
 =?utf-8?B?N29UM1N2YkUxdkxWcG41T21GQWs3K2w3TUlXb2lmdk9OemU2N3dBSk0wc1Jr?=
 =?utf-8?B?dzRlbUtQSlRxbC9JTzhWNzFmdldJNXJHQlVRK3RvU0JuaXNKcHlFWG8rVGxE?=
 =?utf-8?B?R0x1TDRFYnRjOWZBcjVFWlQ4dWExV3pETmU1Tm5XTC9wSDNBVEpCRE8wZUFt?=
 =?utf-8?B?VHE0ZGZBQjE0d1NZL0x0OGVTQjAxOVhHT0QvVHdoOGVIblBEMnpQVjMrUWt4?=
 =?utf-8?B?RTA3SXQzUlA3NzVnV3RrSjB1MHlhd3NGc3FacE55SFhLQ3VkRnJOWkhtQm1K?=
 =?utf-8?B?Q2J3YURwaDkxTGc1NkdMWGU3SllvL3lZbWVmd3FZNERpejFsN0xNU1ludjJW?=
 =?utf-8?B?Q3BOU3RuNFFtNHJOL2EwU3hVcTNNSTFGZHhKMnd6amNHRFJEdE0zZ08vcmlh?=
 =?utf-8?B?dE5CMEgyN3Q4c2ZGN3E2cWVRSFZPejhzWVZoa2U1Y20vUU5RNnJVaWpMT1d6?=
 =?utf-8?B?SndwNHJlcUxPSVRtL2cwbm5MN3pDMEZEOGg5Mm9vVGVQOG1WSUp5ZlZkaDZ1?=
 =?utf-8?B?SHVDTHc1SElXUGJqdlFJdjZjWlZBRUFCTnpYeXZISmRSckZPaGd4MVB2VDll?=
 =?utf-8?B?Mk5ZMkFUWlZjNGpxUTd0a2ZJTDZOaG15N0FjZFRhaVJUNjBsZ2l3Qy9LMlg3?=
 =?utf-8?B?cXZCblFNWm9obmowQlV6anlJZjJmRlVqVXZlcGFLNnUxNkx2aGRDcWc4VGRa?=
 =?utf-8?B?Q3RnZmxVMnZwL2Zrbi9CVElKcHkxdkZWc2QvaEJQL2ZLdWN1Zmd3Mk9SZ0tV?=
 =?utf-8?B?Y20rQmFGOFcwNzc5V1FHWnRRL1J4OHByaHJmenlOZHpBUHRpeUpoY2NrL01u?=
 =?utf-8?B?YnhBd1piRFgwUW9UdVk5RGt5eEhQSVVWTitHMHhIOW14aUFWVUNCR2pzMHcx?=
 =?utf-8?B?Rk9Qd3I0VXM4cytGTnV6T2RzaS9yeHdTblFwckQxeVRXUFdoZlFTdzhUbTd6?=
 =?utf-8?B?TU8wSFhGREw0SnNWaVkxd0VRRzlVMzR5cjlzbHY5WkJreXUxVHNOOWl1aHc1?=
 =?utf-8?B?UW0rbjNsbUtvTTFyOTVDTDRFdHZ1eC9lVDhrT3NUM1BHS0loVk9OY2dkVEZC?=
 =?utf-8?B?Q1VmNm5Cczl0VnAvR21kTktvd3AyYm1qa25EQ0loTmEvTG5SYWMraHBHQ1c3?=
 =?utf-8?B?cWZ5WHhPV2Z4empTY3o4STJaWDhiU0RNd2xrWVA0ek8xMVNXRjhRWjhDZ3FZ?=
 =?utf-8?B?Rjkzc1BBNll4dTJBa3FzSnVFNnYwc2UxYm5SNytIQUdCYlM3RlZIUVIzMlYw?=
 =?utf-8?B?bVljanZWMUY3ZzVaVmkxYXFqK09xdXFXdkI5bEpiMURtRkwxSHpWTlF0VnNj?=
 =?utf-8?B?a3NJMDNQZ01WWHg0aGxVcnNTTUtlSkZVNWhDQW1wR0xxOE42a3pVdzlpKzkv?=
 =?utf-8?B?cTNnbU12bDhDb3hEd3ZrSUlDZ1dTYWQxZ2R2MEc5UU1VSGsvNExjSjM1UTVI?=
 =?utf-8?B?UkVzYlhRaUpMM3Q4WXV2YW1DWW9DSXlmMTN2Q3NUYXhWL09IUmJlUUF6ZnZh?=
 =?utf-8?B?WHhvWEhlcTBRTm1MU3JqUnBNbkZxUDZOSDMzYnRleUo3Y3orRnBFTW5CNHdj?=
 =?utf-8?B?ZWY5NVIyeE1wKzViQStjSXc4ME8wb1JwTjI5VE83MVhqQXVvMWNNVHIxejlw?=
 =?utf-8?B?Mkl1MjE1b1B2UHFaT2t1dmdtVWlRZHltc0VpRFpRaUlXQXBXMU1PMkJCWEVI?=
 =?utf-8?B?N2d0SnhDdHEyZXJOSDZjSlhrZTljSy9hd1NrUDlyb0RibHBFVmtMQ0VmYTVn?=
 =?utf-8?B?M2R2RVhqYndiZmFKL1hSVzZQWExIZXVocSs5MVVCSElLZXFMSVNQYVBIU29S?=
 =?utf-8?B?ZUtHb3c0MGt3T2xEVmZQM1JpamdmQlRmRkRPZXFEVCtSbWNoZlRobXlZYzhP?=
 =?utf-8?B?QXFFbStqbytCSGdOcitMdjVvT2k5ZzI1b243aWxXVXB1ZDArR3RGTk0zenNB?=
 =?utf-8?B?b3VqYUp0TVc0WVlvekZMOHJNZEYySHgxaFVPc3UzK3gzR0JCWnBxKzJXc2NW?=
 =?utf-8?B?aE5aeEJXKzNNSlZOSEdTbzZkUGpRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:39:47.5245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2418fe73-a517-4904-6169-08de5df4f9b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_143953_775352_F7E99B23 
X-CRM114-Status: GOOD (  10.80  )
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

Reviewed-by: Dhruva Gole <d-gole@ti.com>
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



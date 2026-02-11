Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3C8E9E30A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze2TErJcmeif3i03qZe+SvQqh3oQtP6VG7WqAn1dA7E=; b=MK6Xgoq/bY2hFtJaDRYfPE/lrI
	a7OUwIkmfag3d8f1A8IozALhMxVfTtBnSBSiZBZdfAy4sc0ClcgPXCNUBNSiHeThGMwh7Ud5CBW/F
	f2mCTOBFBt4sV2J6oYXGvYO/VwnavZHJzTl8TvMU4b5+WzkVS9Q6U/2HxAwmDkQ3QZe8SJFNKqXRi
	eD3PJ+7iPk292kBSQThxXXUjUZfXZWQ9/ZvEiADS18JJWMQVY9QD82TAUWuqkMOkIYJm5N+YLETBb
	TjSi3HSaj5v38OwZ0hTuPkTFYzpnEF0xplbtcDvQMFhQ8BGch88ZcG1vSp5w4XuM4td+zj5ZMlVMJ
	DelLxX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgY-00000000hWd-0sO9;
	Wed, 11 Feb 2026 13:55:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqAgQ-00000000hUL-3LPU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUZJOzEpuiL73MI8ukYzEZIB+VneJGlQ1pHA6kQibwHLH2K7RBtwwkz3uj1bN0qDsh1MDuGGAV58sSxMs1acMSJHER4vtpq04XUlnlW0fagtcNpukXZyQhOQrcU1SgThVd4+u6T2MF881kI5dEwqKhnSPEOg2t14aA+jsZsHSr63XxyP62C9xeWwBPvWBPLGVw18pAs2wPGhAzad0pYq54GM9heouQCg+AUhLy1tFM/yJLKo0u7r52GQJ9ZlCn6itCMpBr9BVRnnqezfIohlGDkcpBVeHjVEvWmrSEwT1jOxC2MRONukm/j22/URfrasD6tq4SEctvjT2lKYWk5VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze2TErJcmeif3i03qZe+SvQqh3oQtP6VG7WqAn1dA7E=;
 b=cHTxkd+6YnLPGJWigjQO436Ib+nO54sHk8ESV4GgXI7m6xUObDKKvNBj3FaTcKIhvKwExecS6CtDNi0kLapbp2f5NROPhR4OuPvXgdAMS+WL4kb6reYma+ffZET860GzE/kN2GKQzENl0vcIPwUu6/GvWfMMtHwLppglxLhFGaMbcAaiXyTlZaSysWfgudUgh8qo6VKne1wJ5fi7zqFxzXeVJWcnGTi3JrSH++aPfYOKq1mUpDviCx1QslmDMOW1vmjwxc2vkIaNRHT5RPoMrJ3qvZWdovbBiDk7ZaJ2ygXfLEzJwbtmqJvp98IrnVC7+KYkJxFnfZOmVNHYIdsumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze2TErJcmeif3i03qZe+SvQqh3oQtP6VG7WqAn1dA7E=;
 b=n7zFUqTBfi2uxc27wU8fU594tEDRb0N32undPdQRGrJkIbq4FwdFSudOeOWBcEb0aCUI1meTYb1pB4k+iwr00p0UxD4if6GRHmRxHQNfl6JBG2QeI792N8QrLeOy0Y3c+fw10unJq1/9OU95TGFvV17gaDShqcPlXt2nkgZfsfbOKMaYwddn5Epjq6TTGfhNd4mzFKUyeCDFD4ESGSO2KLIF517Y+N7p43SRHDKKM7E+fgh0ydsaDIvM3tlkGEh/mYsVm6/qkfi7dIHgSuPDGYlO6MbdKlogZx51UtK6X/v24JjFfYS5gKxq6rhvLz4PpBtjnvA07d9wtADVCTB11A==
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by DU4PR10MB9590.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:61e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 13:55:03 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::4) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 13:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 11 Feb 2026 13:55:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:56:45 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:55:02 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 11 Feb 2026 14:55:02 +0100
Subject: [PATCH 2/2] arm64: dts: st: add bootph-all in bsec node to
 stm32mp215f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260211-upstream_stm32mp21_bsec_nodes-v1-2-8379bf97b0bc@foss.st.com>
References: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
In-Reply-To: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|DU4PR10MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 10df4680-9ebd-4c86-9f94-08de697527ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkJJUW9OWTlYQ2tnQnV1Z1VSZVUzNVpnb0NjZnhmWjJ3Y3JCbW1wT2NUVzRR?=
 =?utf-8?B?Kzd2K2FKK3ZoT1dNRVIyWjJYSjdWYndBdkxWUllRa3J5QStFYmhjVmxIeFhl?=
 =?utf-8?B?Zys4UTlwUHlDRjlaV21hZFNLVS9mQ3kzQnJYQkswblpaR0kyVXRSK3RRaHBR?=
 =?utf-8?B?VjVhTHRuZllaZFpBSnBBendMcUFLcTRDcXNua1pQNXZRTk04Z2trRE8zVkxi?=
 =?utf-8?B?MU0vcmtUR3ZnQ2Y0NlNDbDBVRG5qS1RzTS9DZGswUDVSTFhNS1dGVkhjV2tW?=
 =?utf-8?B?cFNmVzVqNUo4d0IyL1BDdEE2OVZiQ0pTbHliUlR3bWZ0TkZIZllUbzBBMnBx?=
 =?utf-8?B?THNoZUVQNllOYTZ0eHM3S3lpVmV3TVJCZXNRemZFdnNkZUpHdGNqNUpRZmRQ?=
 =?utf-8?B?cmpoR1U5cXp4SnZZaTUyNmQ3SWV3S0RCWUx2TEN3OXJ0NmNISXdDK0pLY1ow?=
 =?utf-8?B?bFFtdjA3NGxicWwyRm0yR2F3MHp2TUtBbzJJTGNoeU5qdlhUcjF1TE5PNjZz?=
 =?utf-8?B?WmdMdHZqWklNTHh1WEhKWXhDdTE5Wk81Vnc0cXlhdmZlZXNzemZWZ0tOYmoz?=
 =?utf-8?B?cncwc2J3OGJJcTlsZmE0K2JmbDJ6VXNGR1pIQitYeXZwTmtiMlpZbElVSlhZ?=
 =?utf-8?B?Ui9nWndvSGJuOEY5WDBlclZ6TS9rQWc5MHk5L2pKSy85THMwMjZwcnBEb2lR?=
 =?utf-8?B?ME9zcU1VRVdZTi9PUzR0Rm1nZVRFajhmYllsWkdwZUFiZysxbmVJSjZXY3Fr?=
 =?utf-8?B?bXB4b0JVbzVrV05IZ2FrSFAraWk2Z1V2Z1o0bnVwMmN6ZURJeml3a1BjQVdP?=
 =?utf-8?B?QVhVV3I5SmcxckhWR1pVVXFvVkg5UlQrTDZSRnJTTVkxTzJKTDhIdWhsU09o?=
 =?utf-8?B?TGxjNkNUVHZUSmZ3MWtFMHV2NGR3dG1mV2o1T1pCWmx0ZnpMeTM4OW5ITUxT?=
 =?utf-8?B?d3V4dU5hUWV6TzVISXRiMFNmS0lMaC85eTRHZHZyalcrZnZuSFdvZVhxYXVJ?=
 =?utf-8?B?SFg1cjJBd3FwN21kbk9tYzFYbVRLVWtraXlUVHk4ZHNwajIwSnJ3SXp1MWVQ?=
 =?utf-8?B?eGtteWl3T2dJREhadkczWnBoY2ZBZ0xucytsaGJJakZlWXB0aVpwQU9RZDVV?=
 =?utf-8?B?Q2JvZjc1ZUJ4U25EcnRzUkRWOHdoLzJ4aEVtc3FleWgxUDV2RjcyN2d4b2Fn?=
 =?utf-8?B?NWpvb1MyZVBNZkJ6MFRnUUZMQUs2c1gvK1BoZjJ0MUJBdS85QjNGNUNtNGZO?=
 =?utf-8?B?Si9KZDArMEFpQjk3WEczbXZpdHZYZC94aDFJcjZLckZjSml1cGZTTzA4Vy9Y?=
 =?utf-8?B?d0hhZ3g3ZDBjT2ROYzY0RVI3VldPOUY5eWpYaWhRWjEzSGZCcUw0SzF4N09R?=
 =?utf-8?B?TVVnVkdxdVI0NllZTi9Yc0FGdFdjM3E4NUluVE9FbUR6N3BMQndneHVieHBO?=
 =?utf-8?B?Tit1N090TGNLYTBhekJkWGZkWE9IT0VQUHhZcldybEYxNWdSZXhmR1hwc3Fa?=
 =?utf-8?B?M0NkVDJWYi8yUCttN0pMSy8waHUzMXZXbW4rM0xoV1g3QUtyM2tmTmFQRXBn?=
 =?utf-8?B?MFExYmtRcW9mWkJXaVBYdUdIeWZuTHArWTc3R2pVNkZ4bENHejUxRnJyUjhU?=
 =?utf-8?B?Z3A4NjIzYk1VWjZZNXhOUm9BdTBYeU0ydm5JalVaeHcwcENiVFdGM3F2bVcz?=
 =?utf-8?B?OXBRM2pDTk96VUFFNVlNR0IycGlLQ0duNDNXcU1CYkFHNDFTb0VTakJDYi8y?=
 =?utf-8?B?MDNIMEl6ZitzRVYzMnlkSEZ1OXdDaGgxUUJxa1dxSGhHYk85Ni9ueHkwNUJh?=
 =?utf-8?B?STZ5NHdJV2FGSFZ0dHBRSHdVNlcwNjR3NW5EaVREVEFiL0ovNk1CYUl6Sk1M?=
 =?utf-8?B?blJuNm5qdFdBMVB4dnZTY1BlaG5CeWNydjRucE1vZHFtdG12Vy9NNE5TSWVW?=
 =?utf-8?B?QWdDNFlMVm42YW1zMGgybU8yOEJPYzRwanhmSWRVeWs0NDFlUy95UHp4ekFa?=
 =?utf-8?B?NVBWOFc0UTFmWXdPMjcveCtkdWZxdGdqaEVmOXFIQm1tVWZ6WWlib2lmSkU1?=
 =?utf-8?B?WERPTjRiL0orUEJPZ2JFTy8ydHdmdEwwTUJuMmkrK21YYkFMQ0hFUTZveGNC?=
 =?utf-8?B?ZXBDZ1hZZTdib1orQjNuVUI2aE1hbHZFK2lqNW5nTHprYUM0NmMxenBLVXVE?=
 =?utf-8?B?SXJMUDRNTmxqMnd2VHJZWitlSXpHeVQyd0FMWlBUUXp2TzZuV3NVa0JYdU8y?=
 =?utf-8?B?NFl4SENHc3Z3SGhSSWJobjJxQjN3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HXCOE8BYlrqaHN1HHQ96NBvoHsfRoB1NrM7p0MI9uTJpKSGdA0M5WowmYNiH/jFlEAZbadKyfoiqfl6SVaSksinzQ4R5ysXJEa6b03cxpVZBu0rutCno6t439ElKhLANLB2mzP7QA5sjmLm1fvRSTkXaIF7EnsXea+MEp2a0V9R2dt5S6TdL4Rj/A6aS5tHuDwj+ri/2m+WKdX/CVY5Glkyb+tvI7Bfj2tqbN2AUGVjMCvNLBX1feMEPTIYJmnNK5dr+CclQ31q1ulSsQamk12dCpVNfFdTHyUc4pXzGEJPybsX002DRIs4nIDTJC3hmxxVwq8ItOhfWzVnWOKwwo1O1Atg2s2eOZ3xoiB4vPr/+lvck57hsYpcTPnpl9NLuAReDbBe+kuQBjpuawgXctDBAoh9t3UjH8eWPiPVGDvQtiSzZcOb2vbGArqs66eSf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:55:02.9680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10df4680-9ebd-4c86-9f94-08de697527ab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_055510_862054_5A1515C8 
X-CRM114-Status: UNSURE (   9.02  )
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

Add bootph-all property in bsec node to ensure that bsec node
is included in U-Boot device tree for all phases.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..a1285abc80ca 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -44,6 +44,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &usart2 {
 	status = "okay";
 };

-- 
2.43.0



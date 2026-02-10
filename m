Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CC0EA3F39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CXTJrnyydNwXVuG6N/MEz+aOjFPdgp3jx/3F6Si5gE=; b=X+EQWgDN8PUIRq9Gfi6FmVi9gs
	e7D4AyYlBTbW94RLAZjQC707i2o93toDPKg5rR0EOQOZTgO/ipi1ZX5kBLKtcmmGdcaofcDVyFz2o
	+KzTw+LOmSmT+/p6VXkuTcCIsRgGI/GUzCwHrBezf9L4Ug+n6SXAYVv3hzaYZTRqbYph4G/jZgkGq
	0fIk8+QbpotU5o+b6PZcw3G3jxy7DUeFiyqBYSfdbgw0v9nuFNDIwm2d55omtSPuAWaW12inefyUU
	pRuNmfbfrA+S1N5p0CLGylwwP/gRwdietT8XPOWVNwzAxm0xeWYVnXN8ExyqOaGDSnKfA/FSFRC0L
	8qSduO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbL-0000000GnwG-26nx;
	Tue, 10 Feb 2026 10:04:11 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbE-0000000GnpV-3zV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8UEazySw79OAJmtTtubth9KgM0CIdUDHdt8eSWAyJe6PEcgv4qWVpmof3sfgOZGStqtqDqRCV6KDGEvNjLGQuweiwvtLN2O6Q8WXFij+XdGqI/AkNv6KvWQfQJHnUrJYm+Iz5q5qjDKvYXV4TBTvCws3G2DDizcVgb/jvpuyLDLVGqvFH1cKu9f20etJ2bUpNYnig5WOmqutq+MsK+/nnmlQeuIUrum2YQ6oPlxb5n4I9cWg9AXlML+sgEw5cOd+K16S5lJSfRqsUiNEBAFnWh7BIfWsP8Fn3+QdXN0AKi5Uklsqyqhg+oP8k6WwX+yi3urZKW7/EGJMWWJ76RGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CXTJrnyydNwXVuG6N/MEz+aOjFPdgp3jx/3F6Si5gE=;
 b=Yh3WE7YJAYDSUd92JGqM0o6qUO82Vz0qC3vj4PZydDkfh3l/pD6uwW6e0K13eh3YjRo7ox+KIh5N6j2uJXZbXy8xNf6K/iVz0YRUXdJsCQ5oxJQkxLHbboVJNnhCw7F8CIpgTSg0hk7p8chhXmnm/nWC6PrOZ2Y9uXzpOWV3u3JF+7LJjuRoXR5r8zn5rFtNp+mijlZDYWpWfDMmCVfi3nv6nQ0YWgtHyKpEj1t3VzZJSVp/Hk4No6+Dac0q5iDH6luEC2jjPZKnpxdWqHv0CwAX80FTDMXzqnm1atPA/29b+G7Pvgj/yWXKYZ0mhgn8cVoEC4/9aIqOinXPtFRR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CXTJrnyydNwXVuG6N/MEz+aOjFPdgp3jx/3F6Si5gE=;
 b=AWB8Zbd+5ghlIrrnVbKYGuyUrqSgeDm5OAf1H5IsiiLHlncfZ9lOzkIxBMgr5C0btVJXT4e6H88V6MAY3crAH/cXNzy5ijzzmCNmiHYUPExzg0AGG4Lvn3k6F4txiXFmy70Z42uyU6Rk0FNww1z1DwhGqVyKKHqGoAa7julXTUnaVZLMnFVV2zICQLOU8gago3YtV7UdAlEmJrL6cDHK47bre4beIXJslgtN/cYy66Arwh1dWRq7S3hw8YHj+tnz+Fy+gnhVnFkLF945QTSzIncrOd6qXTXpp+gBfMAwFSD2TUQ1QyKpr4SNwrCpgbCJG274IGGJ7HkCQJUrOdrR+w==
Received: from AS9PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:20b:45c::26)
 by AS4PR10MB5989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:03:56 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::be) by AS9PR06CA0159.outlook.office365.com
 (2603:10a6:20b:45c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:55 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:35 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:53 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:55 +0100
Subject: [PATCH v2 2/9] arm64: dts: st: add ltdc support on stm32mp231
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-display-v2-2-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|AS4PR10MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: da701e6a-2f5e-48e7-6945-08de688bb3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVllSHF6NS9CU2hHeDhTQjJZdXA0U1Z6YzNNWkYyQU1jTHpnQnlnZCtSK2Ju?=
 =?utf-8?B?T2JkQXlIODQ3N1I4Y1ZFbUJpbDkrZWtnUE9nMUZoaVhjUHNxS1pHcmtKVUhB?=
 =?utf-8?B?MHRaTnY3VVZIcXZsU3BPUW5SK2ZyMWp6bHRBOG9HdjJMK0locFAwdUFibTFI?=
 =?utf-8?B?cUpiVG96cGlkQUpvYjBya1llb3RJbFRqUUhkSjlRanduVnFNZlg3dUdOTTRK?=
 =?utf-8?B?WHg1dURCMFd0dXNhUlZhMTJ1S2ZscUZlM3FaVTdGUWNkOEZLWWQvY3c5eGda?=
 =?utf-8?B?T29MMVVIZmVNVUtsSDNJelZXWmJjcnRPakg3bkpia3JPaEpvQUI4ZXRsMUxU?=
 =?utf-8?B?RWwxQVljaDllTEM5QUxKbXcxUWluTjA5bmRMblo5NUlMMEFlbVR0YzRTczUr?=
 =?utf-8?B?NUI5aXYvdDV6S3phd0JkbnJ4dVc4ekJiVjhhOUhxZ2VLU21Xc0lTMXVBV0xh?=
 =?utf-8?B?aGhXS2I3bXMwUUNUQ09HS3gzS1hzYWw5K3VITjlMMndiWlFEUFRaZkJCU0hF?=
 =?utf-8?B?QzlTZUIxR1RyVkV0ZU1WdTdyQnhqVUV5OE5IMW1CUmNDRlhQazJMcnoweFNO?=
 =?utf-8?B?N0pZRGNscW1rNGNCWm1pcDN1elJCcHR5T01YN3NZVzdsN1BhYVFtNUg1YVJW?=
 =?utf-8?B?L05BMy9MbitERWYybjlxb3ZPT3VkOUNjVEcwdlp6ejZySVB4aFlDU2xaQzJT?=
 =?utf-8?B?ZGFWSWwzdzdBNWoxTkpyQ1VGRGhySDhHRUZ3YnJZWlRtNWp3Ym5lNjRaZmtn?=
 =?utf-8?B?Tk1CUXlXMkxSSU5zSFlXaDdvK1dLRFRVWUJhTFRvUlVkVUtiLzJRYThhdUEv?=
 =?utf-8?B?c1hQb1d4ZUEwS1lkRkZpV2V5V1NaOS9JbmhXcXNLSGFBU3dNMW05V0xYQTZv?=
 =?utf-8?B?QUhhMHZHdXVjK1RwMTVEV0Nob2FjTHFCRTZpODZqUHBZSDdIMk90a0psN0p6?=
 =?utf-8?B?SmJyNFRrOTdScWFjSmxoN3JnVkNKekxMWUZmeU5UcXlhK0xteU1MN0xaM1JG?=
 =?utf-8?B?TVlHL2NJcUE2WU42MXNQMG1LVFpCb3JYcCtEM0xwWDdtdmZoaGlkTENPbURk?=
 =?utf-8?B?VzJGN3hBYXZBVi9HOWtOM3ozWmhHOEV5V1lqcit6UWxZL0hQVmk0aUw0Q2c1?=
 =?utf-8?B?WEZqTkNWVDlaZDRqVEZEWGFoT1dEa0VlcHlmbkUybXhnWUFURGRaM0N5Ukhl?=
 =?utf-8?B?Zm85aDhvMGVzVWVTNFBoYjFnZzBnWWh3RWJnVU9sNHlkQUlVVFJQUEpkVkN2?=
 =?utf-8?B?bUJIT1cvWEdDdW1aaDV1YVZOQmtTL0Q3NTNVeEdET1lMdG5rODFSWkc5ZndX?=
 =?utf-8?B?RWQvQ3U4VUNnU095a1VwUnJoQUg1bFZ0L0NyMzBOMmlqbjlRbEpDMnNWLzZT?=
 =?utf-8?B?NVdEeUhPc1VoK2NqcWZlYmtuaXY1Q0Y4TCttWGpOb3QraWJGdUFBeW80M2lk?=
 =?utf-8?B?Qkp3RGgzamlZNzAzclpTa2RPV3cvUlhuaTU4NXI2NEFDSE01WVFtc2NyNUlM?=
 =?utf-8?B?T0VTYVlUMjFkWi9lRDhVUHBubGExQmoxQ29hcHRpcjVQcHJqSG5NVWdaTnZs?=
 =?utf-8?B?UEJ4MmpxUlBzTTBsb3RQNzVoUkNXdGp1N096M1FVMkpUWVdLWjJJQWNQSk5N?=
 =?utf-8?B?Q2J0azBZUDRsKzA1bjFSTTBPMkh4UUp2NEN0VlFLT2g2YmVIUjZXK2tBYS9T?=
 =?utf-8?B?NTZYanhkV2s2VjIwc0xBcDlIUkRCTmFuS0VkQ0VmRDMzaGxPUmxmZ1BGOWRO?=
 =?utf-8?B?ZHNPd1I2Y1BsNWdLWnB0c0NRQUY1UlpDUURLY2NTaHZ1aTZNSGJvRWpkUEdo?=
 =?utf-8?B?MmhQVlExWklmWGtrdGFiMGhWK0Urc1MxcVZ5U2E5VnVqWU9BY1EzeGJhbFF4?=
 =?utf-8?B?YXFyZ1VVSllFclRia3pvb1N2VjEzWFg2aWNvSnZjMW83ZDNya1dCRGpuSG9a?=
 =?utf-8?B?elZzY2w3cHMrYlRkWCt0WVZRWTQvMmxSQkEzb3I5Z1VlU0dSZ0RCN1ByM0dT?=
 =?utf-8?B?bmtQeWpkNUlJSFlYMXJPYTZ6UitQTGFGNXNXK016QmovUzhuYVVTV25Zc1NB?=
 =?utf-8?B?bkhqMGNEZlpRNkxrSlR0ay9HK2N3UmJFejRPbE1JTmd5NDIwQzNoVXhuMXpN?=
 =?utf-8?B?eThGNFdJT0IvMzRqZXI4Z01zdC9NR2w1Rm5QaEtubU5UR2dwb1liNzEzOGh5?=
 =?utf-8?B?R3V4bHgxZVV5QUxmR1d5RkVMMko0aEptVXptdHY0LzhFdllhU2ZtaWR3Zk5V?=
 =?utf-8?B?aXZlTXRrbXN0K1gyRE9XK0pXUmhnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GrW94uyqtsYMPwmJkesKCZ6pYtR0EW0Soi4zpPbHTUEIFFBvPssGGz9j1LL5+Vz5i/snN2foXGDiwpIxxkpTwtt4u9QTJGYjPtLQp5UdtxUtzqn0S197c3bZncG0V0uhQhLJ+izAoWqdE5VE4NTyH7XDch/5nE0HnCzEgwETP1lOx5YPqAmvnYs+GyAq0v2wshKCXnXaXWEV2RkovtZJ9hbgvCmA28A/IfqnzYskHXbimRfmmtj6AoLwuy0B8eEiZ269aAX0209jsd80FpKKm+kM2MdCTFBKgdRWQaLj5+G+89S1RBaJTB8r5a8s4+4XxxqPCT3B1jMqulaXDlQE+jgCTWqCpZpG0WfkaAr6e9y/VJlRuBfngUqD+KhPfGWPLIsKxwDpJ0Txe0BbHLuyJ4DxIG9pjjIX0GgeBKj0KUrJVE+ofThWmHFMVvExZoi+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:55.9180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da701e6a-2f5e-48e7-6945-08de688bb3d5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020405_059267_0FAE643C 
X-CRM114-Status: UNSURE (   8.03  )
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

The LCD-TFT Display Controller (LTDC) handles display composition,
scaling and rotation.  It provides a parallel digital RGB flow to be
used by display interfaces.

Add the LTDC node.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab7af53e2707dbc2dfc6b3d000a798..a6840882f512b132b69b917ccbc6cfd4a502a481 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1178,6 +1178,18 @@ exti2: interrupt-controller@46230000 {
 				<&intc GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;	/* EXTI_70 */
 		};
 
+		ltdc: display-controller@48010000 {
+			compatible = "st,stm32mp251-ltdc";
+			reg = <0x48010000 0x400>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>;
+			clock-names = "lcd", "bus";
+			resets = <&rcc LTDC_R>;
+			access-controllers = <&rifsc 80>;
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,

-- 
2.43.0



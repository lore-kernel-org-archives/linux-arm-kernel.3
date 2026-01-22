Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9997BD46952
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRn0HXBNm3wE7l+hqt0y6hzV6R3VO+ecWecaOkIe/5I=; b=IdW+djzqSCt7Hs1fda5mAgADgo
	Bl1lrdhubiWoo2NM9x1LWF8DiuIZLA871f+y5Xw7GF9bToA3+aSSw9pQboOjrjflZYE24NkwJE1bN
	kNLhcmRr02TCroxqVlXUP8JLVhGKlLJXNS0glGj+Ru8MY8Dlqb3vPT8U7PFOS9OP0OlyVRQv3i6+E
	P2SxMKn2HOw5ZLpLyzefj5KqPYux4a8y8ld4HPczh0RYa6ewB9filrH2JK7jwU3/2EnBFt1AVx24S
	3495RWS2aaY1Pedq0M2XjfdMKLfRMckUgy/QKvNxLHL7jnzkM3Ds1uQKc4tUYiFe+umR1+s7XL7wQ
	fXFhWV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyeC-00000007a5K-3TSw;
	Thu, 22 Jan 2026 17:39:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye7-00000007a2k-08yr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 17:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yRn0HXBNm3wE7l+hqt0y6hzV6R3VO+ecWecaOkIe/5I=; b=YlMRIC7qB1Ii3y+wCd5KVhyqw4
	dzusyFSAiOPjfwpvlxZsPS4xX3JykU2FCj0705UnofaN+TIIXydpq6OphbDyzWrq5rVC+QpR0Q2Td
	s2rPsTh3spDM1RQ/rlSNJKhLfQDDDAbd9m2uPXJTE/+u8i7Zhj2zuldQlK7Oxw6QTj7H5l+7PnHNB
	n0SBqG9up7YNhFJMJ+ZQIgirQL8pHCdzvYpfNrnqtBKt48Ej005FH5IN7nsbmcFNQL7oIkFTxxYIU
	LkM7/QlrH20teBKqLHlE98LvCB8AvgFrr9xlUBUmw/du1baxf/ir1fIoyVZ5drZbwClvU8QRO0W52
	5zV7vZog==;
Received: from mail-westus2azon11012041.outbound.protection.outlook.com ([52.101.48.41] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viye4-00000000wZp-0HR6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjFNXtNS6KT25qWwGGpLPMaGkXL7KDu18+YpFtHoWNjsod944WX+/7/bmn7ktQ2Syz0ZxJgTA2s3cOz62NyX8d2GNYy6gkEJQ877OjnGg0+dvZ04AlBFxStB3/F0BkHyyX0qGhPffbEV6sUyqWE2ucCvSINCMEM1fvAAdbyXJyAVWm+XK/Q5daW4mbWeaffUKDXWp4VoPEjBRCa7msYIDJeBZFPBmu80/7HoJ9O7UmmbZuTNCD1olJcjfa8a8KEtIL0HZ+EEGCuoN7SvyaasyO/gm8M3r38lzHGVk1f1/tUiZUxaahS7YI1GAsrOiM3I04NKvCWeGk5FmsBOjC7/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRn0HXBNm3wE7l+hqt0y6hzV6R3VO+ecWecaOkIe/5I=;
 b=YHZZ4U1bFZb50jQPlOVXv9eTt4u1WqlnMf5zZXsn0ElXxlAbam4QpKitK7/Axr4Nt41Rw8/Pw4YGYc7W9bTTz8RYhktvKsrGmCH0YbUu0IzkGEucYFYq14HZkfIw9bmLwSo9pWWC7DM8QNZB1xxvNqsWZIP5G8VEMRvKA7i3J0EXVI1TxNAopcEMEr/jc/SbyKnq39+GdqmfHFvpX/DetwVZGcdyRwyd27DNSTGUx/Zlw16t9fHRlJgVRGgHGmMGQHJr2MggVQKQDx09Tcq2fUEvwxJXU8pM10GHlhoqCo246ChQIG8jMyD7UIhy/04oqG1/ySgKD2pP8JvOI/fJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRn0HXBNm3wE7l+hqt0y6hzV6R3VO+ecWecaOkIe/5I=;
 b=eo5yov6QCNi8+qWEEFNyfkZJQ8NqS2aFqvohzeyy3hbQh+vZGXqSiwZaCJZyPxPkj/l+hSmqZmgK6rUAfJGBpBCl+tIov00+uz5H1uvfVCh8HWM/WALXZg8znwtLdce8lUHTw5Cc8jzC9XdBcvoAecx3aqeNfZRycPaR351sr/0=
Received: from SJ0PR13CA0133.namprd13.prod.outlook.com (2603:10b6:a03:2c6::18)
 by DS4PPFB6B52B4A1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:38:46 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::ff) by SJ0PR13CA0133.outlook.office365.com
 (2603:10b6:a03:2c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 17:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:38:45 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:45 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:38:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:38:44 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHciJG934604;
	Thu, 22 Jan 2026 11:38:44 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 22 Jan 2026 11:38:33 -0600
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am62p5-sk: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-b4-uart-daisy-chain-dts-v4-3-cfdabdf5e6c1@ti.com>
References: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
In-Reply-To: <20260122-b4-uart-daisy-chain-dts-v4-0-cfdabdf5e6c1@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769103524; l=1903;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=r2MIPOWlBnmzHXuRDQt2DFsyc3DGQ5cU+Fq1l5hB1vA=;
 b=cte8t16ge7XwSEWEGMPyM6pFXiGmdZ6zXMNSQuIcyoKCVV+meJUAN16wiagaZALQmKekfkHRG
 KeWvt1Hi5SbBpbxVIZyAj/Kst4b5OXKoL/x0gJu2KScV/EHE7s2KrE4
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|DS4PPFB6B52B4A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6b74f8-2c3b-4320-2440-08de59dd17ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHR4dDlqVkdJSFNqcW1YanRXdzZJVFV0SythUHRCekdDTHJwVFBjcHJsMTUx?=
 =?utf-8?B?b0JJdjF3eHlROFgybFI1QlJOeUlidWwvTmx4WTFPVThFa21kMnZYNGp4VUlM?=
 =?utf-8?B?TFZYSElZeTIzM3BSSWtVMnJvRVN5SURQNUg1VnI1eW16RDJNU2NyQlpKKzIx?=
 =?utf-8?B?dDlXZURHN08wU3BCV08wMm5HYVU5Q0NrZU04anlSQVBlUUlUR3B5aUhSVUx5?=
 =?utf-8?B?eDFvOHB1dzNnZi9CT1g0UkdYemVqeUh4dmI0MThhYWRsejgvTlNzVytEci9u?=
 =?utf-8?B?T2hhR2pUbnRmVlJTRkR0QlRnMEFMTjZmRGIxMVFGTklJVHlmTUcraFhsYVpq?=
 =?utf-8?B?NnpXRXBRby9zbFk1UmltVWpMYmpjd0w2Q3BWdVAyTFF6OXVpQVlJaEROTkxp?=
 =?utf-8?B?cXpUZ3VsS3d3QWVJa2VDOHJDK0JVVGxMWEVJbUdjT1VIbWVKQ296eG1jOU1w?=
 =?utf-8?B?azJDUG56S2xqaFIwcjEwdGlNOFFHdHV0Y0NEQ0xFTUNxOXprQUpmS0ljUUpO?=
 =?utf-8?B?NVZ0ODVPRG82dEVibldTNlU1b2ZuMnZOYmY2Y25wZlhrWGd5OUsxbnlIakZY?=
 =?utf-8?B?dG1LQjQ0OGEvR3kvSG9RNldBZmd2YmpNMDkzYllxOHl2eXcyNEZBSXJUMjEv?=
 =?utf-8?B?c0tuajBVQkd6a0F4c1I5UVIxbTRHVXFsV3p4L2Y2elZmbW0xS1o4VEl4UmVa?=
 =?utf-8?B?ODlFYWNTN0ExbklLU2NhUElqY1JMV1ZCbGhPdy9KUXI5NWdoUDRxNGlpZXVT?=
 =?utf-8?B?Ry9pQVJ1RmpTRFE5K2REUVdDUHhHVFhkazhuVEIzYzNJSm9WeTR1YkppbnQv?=
 =?utf-8?B?NEJlMHpEOHR0Y2lxMHpEYXBmMnp2dWovOHNUemdrNUlrZUpHOWNEN2JGeHRp?=
 =?utf-8?B?Q2Q3Rk53cEJUbDNEUVRNTnduR1JNSEpIMmYzaTlBNXJRcDVYYXhSSSs4dVZ5?=
 =?utf-8?B?NG1weU1yTHMzQ25RKzlna0pteSthYTBKWlA5MFZqNWdDWjkzSVFST0RwUHYr?=
 =?utf-8?B?VG5DSGJzVVNSQnd2WVpTaG95TEMreC96dFg1SFJPMzV5TjZDcTQvYkxaNndl?=
 =?utf-8?B?SXJRMjY4N1JYMUhUck5DYVBQY1hIYzRBYWdOVTMwcVRuQnAzK1E5dXN4RVEr?=
 =?utf-8?B?Smczb1hWRVRmZW1jT2wyWlU3a015TUZhbURsNERPRzIwREtoNmZ4OEEreXlG?=
 =?utf-8?B?ci83K296TTF2ck9TWmRMd0RTbGJjWGhSUyt1WUZheFYvZGFFL2dWekpBTzRl?=
 =?utf-8?B?MWo2Ty93ZmRNTGpxN1A5RjVMOEtWcllkSGhYYmw5dys0bWp1RWYrODJrVC9t?=
 =?utf-8?B?TTBobHlvbGx3YmM1L0lqbU9tTUNLQ2p4RjNwd3ZaKzg2MkV5T3FLN3B5VUtq?=
 =?utf-8?B?c2NWUzhjYVJCTlpWcllMbTZnMzdmVGsxM1I5cW9UNldPSExCYmhDUktGNUw5?=
 =?utf-8?B?N2d0WjhodW9oRXl1U0RlMDlkVUpsL3RTKzF1MlJwbUJuS2hkRFovOU82Y1Jz?=
 =?utf-8?B?U1JnVk1BS1ZBWG1vWW45S21nSlhCUGhCa2NmekxGQ2pYTGhxcU80VFZLWDFQ?=
 =?utf-8?B?UmFnMFN4T1IxbnpxMCtacUxoNTRmb3h3TE14U1lJcXJFVDZoazJaRHpGa0Jp?=
 =?utf-8?B?anpPcGpDTlBKZXVMMzhyYVZpcVU5TS9RSHVCVllWU3VweGo4R3VRSlppTWl0?=
 =?utf-8?B?c01DdkZNNGc2dWhnR2tlTTZudWlsaVdqWmY0V0hUVCtxZ2hiUGM1WUtkUnVZ?=
 =?utf-8?B?MEppK2FRUzRYeVVBV0NhVlJ2Q1pqSmt1cllMbEFXZ3MzTnZVTEphWElubFpn?=
 =?utf-8?B?cTQxeElya1NqdHZDVk5PN1lheC9ubUdicFQ4YnV4cEt4MDQzazhWdkVNQ1lh?=
 =?utf-8?B?SVVKY3h5SWJUeUlKQkZ4ZWl6ajZZak5RN2VzVVFjUXQ3ajhZblhJbHZjOVVQ?=
 =?utf-8?B?SmpqZTIvSUtRVXJsb29VOGNpdzJRaXFTODhna2lNaS9JSHh3VGNtUy8zRTJ5?=
 =?utf-8?B?UFNheDR3TFZaUEluSkphc1dwMSttNU82Uk5zNFAzcEdFcmsvMVd5YmlibHN2?=
 =?utf-8?B?c1VMNWpaYlBPaVZ5VFZmL0NTSlNOSWV4eWZYSGEzdC8yTzJTQlJ2TmhWZS9k?=
 =?utf-8?B?SEFCakQ2VTVrbHp3d29ONndTbmJpekdzMWp1M0x0R3cxNXNudEFQSkthYVpx?=
 =?utf-8?B?ODIwSUxQckkzQXg4SVNsaWtNbEU5SnMxcFBqL0hSQ0ZoV2dOQS9ZditCaTky?=
 =?utf-8?B?QWErUXRJZ3VlOGJSMFFwbnJGNDlnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:38:45.6027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6b74f8-2c3b-4320-2440-08de59dd17ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB6B52B4A1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_173900_210100_7305B79F 
X-CRM114-Status: GOOD (  12.61  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef94a140edcef595ad8f6cc4b4113..fd323a64880970e17007ab130161dae56efd09d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -336,6 +336,13 @@ AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
 		bootph-all;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0)	/* (A22) UART0_RXD */
+			AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0194, PIN_INPUT, 2) /* (D25) MCASP0_AXR3.UART1_CTSn */
@@ -692,8 +699,12 @@ partition@3fc0000 {
 };
 
 &main_uart0 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B016D3EE9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhfSPfWOAwYOvyIZzuXMp0da32tHkG7iKwNzA5Mzx+8=; b=UNW+3JuPMZBpktxRSUkyhO6xKQ
	4tQzuVmiuqAq8g4b3dXXV2OXjL9iydmBxI9HKW6tt4bXPShz649fkOVEZrtWeyPNCI8HP/oXN3KeY
	4znIhOzUU3w5Z70PNZ07BKohWop7xPkv0yz4vdCZ+04Xsx+gS0UM1aP9wZOsdEvF+XR15tg2l6/iW
	rZD1320m2rdjAljLvg9L7mY+DFa65IvMyjjiz9wudperZQJEazJktYO7BAYRlJPxFaG5PrVN+58Yo
	3CqnLtsavY3jFpMaXzQ8Z9AbJ4X3Q83oAGmHgTsmpNGK63E4Jir5966ZIAIHSB+pTyXD3UvZWrgRt
	3qWEH92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLi-00000007YXT-3pmV;
	Thu, 22 Jan 2026 17:20:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLg-00000007YVk-3eJ7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 17:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OhfSPfWOAwYOvyIZzuXMp0da32tHkG7iKwNzA5Mzx+8=; b=ah00qZI40woO631iBQ4x6jH8pE
	Rw6FTyHPlz7I8Z3OTlq6ESVm5hUxjwvC04Vh+RI0El5TBT40lTSRuXASENHITNURGGlaKTXtoU4uW
	XyJgWJtzCqfrQyLhLPG7Oj0esRtL7lT09nSOVOpLIfVlTuQk1oiXhvWU2zfuY8iVobiOTc3ELduqq
	JW7PQ12kZMs6TPXswD9LNBYtPMIERlRcnl28iNB/9If1bH+vmCX0OJMDhSk3j3DztmO1c/3mdifNX
	3EkMeMB7+LI19PoLDXd4LckBgiF/WI+TRBSC7gj/X2QPGSUSNDq9SV0R90SKDT8uUfJjccQ0kVFJL
	te26H3bw==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLb-00000000tYL-1na1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR4AanO5eHAttGrr7WFPPeQZxsW9V9B9ayi39f194b6ve6hItqE7ljp6qOWPUO2BZAlGbB8VO+moH+JEQY0LlxwTc2U3PDi/SICy6KvSdq7l0JORJ+uXzLyUsGnMDBjiqehb86Akj+5GGRBGg2y8q71+DZj/VNJX1Rkp3SiMD0xiyyH43B8MMrl7XyHnDUDzPfKUKrYRDbdnAunAoZWEBZpZKTzunoCKsVOSOcoWw+U80Q5qI+CEFoKYYRsJMepgA2PeMBidABJ1zdMlyId3u6hnV2M5jZkKg0WyPpv5v38MW6ynhoYGt31SboGZZMWw4ETq2P26O+G7YbqLLqavQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhfSPfWOAwYOvyIZzuXMp0da32tHkG7iKwNzA5Mzx+8=;
 b=UgIOgLKKeIoBZfybQcom3mo6IJ7yddAx+X7dtjJa52/EJDQ+S5RXXl4SP6+HPdattMOXx/PyT6TJH+GanaHO1XGfEHYHSyXnDfBXHiTIOoJqvKGVV/h3hzx0yBremzdNdWP5Twj3EYYYpmMK0NApT73qnmgAWhs4pp8Tikl+munKIdTHhvEVwxOkxN8vNDQHXa88OCa9nWQyeNeoBrunLJe+20/0CDiYUKBiZgkYXGRgygkGhXjbUduisc2oLQg9j2xFSwLfnh4AZ6owTBuPzRVhMvKDgLXW6isxLnONcMaiAIwDQRQ6e/MOQwCYKrhRwSGNn2C7X5dW1DZVuGsUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhfSPfWOAwYOvyIZzuXMp0da32tHkG7iKwNzA5Mzx+8=;
 b=b0AwVFe4Bn6mgURaHC6vGaPM3hYomfpPwPW6g7OJiEmfR2HMveMuinGwEIBnX8bgZcDXnaXNaqNOohyaTZliVC3ldgLnjHzwXqXNTuOCcAfU1UulVFX4KJtEST8qrYnduiarqSMgpL+nPpdH6SChpBjwhfWqDFtuWzJ0zYo2nK4=
Received: from BN0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:141::7)
 by MN2PR10MB4238.namprd10.prod.outlook.com (2603:10b6:208:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:19:47 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::9c) by BN0PR07CA0014.outlook.office365.com
 (2603:10b6:408:141::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 17:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:19:47 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:46 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:19:46 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHJcoO912039;
	Thu, 22 Jan 2026 11:19:42 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Thu, 22 Jan 2026 22:49:13 +0530
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: ti,sci-intr:
 Per-line interrupt-types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-ul-driver-i2c-j722s-v3-1-4ec3478f3866@ti.com>
References: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
In-Reply-To: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MN2PR10MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 1502f9bc-fc3a-4f37-28e8-08de59da7150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEpJbWY4NW9uZExqTWdZbEV2ZmJzb1NzaU81L3RZN0pnaW5KR3RwazJMUTBG?=
 =?utf-8?B?SjFJSWFIS0JxaFl4bTlrcU8xZ3ZWb0I0UVBodmFQVkNaclNZZ1Fzb3VjR3lR?=
 =?utf-8?B?OVEwYkVwTzNCeEdLZmFsc3Jab2RaNUNoNGZTc0xoSG93SlpiUkR4VGZ1SCs2?=
 =?utf-8?B?eFpKNHRTWXBwYkpzWDFpa2tEektrbHR1ZDJERysvb1JtMnU1d09oM0Rsa1FO?=
 =?utf-8?B?VWFGRWpFYmZTZ05EQjBSVUVLTTRUR3dvTUtnSUdkQU5uZTIxajFFQlowQVRJ?=
 =?utf-8?B?cGdRbzRmcHh4d2ZRSzVDdk02alNKWmdjbmxXbUl6KzFVNFI5N0hua2lzb0pj?=
 =?utf-8?B?blp0WHNXT2RXVlRHTVhjMURRb2Y2OGFRNGZ5RUcvMlR0b1Nhb2dCTXlWNnRX?=
 =?utf-8?B?SGN6UlNpR3duSTVEbmVTR2czMXZ5eUhNY0pxR01ScjZJTG9kN3JsejQxVHVZ?=
 =?utf-8?B?ZVlNTk4xREY5NFpYMDY4ZzJ2d3J0UlpjV00zbTFadkp6Lyt4S21qV3lVQ0M2?=
 =?utf-8?B?ckV6V2xSYmpZWGdBa21XRlVsQUNWT21YUFFDeTlqZTJGQ1lnanZpS2w5TGNC?=
 =?utf-8?B?Nk4ycWtteS9CWDJrcnRidTZFa0ZFU2k2YVNKVUtZdXZBVEFUYXd1bjZ2NEFS?=
 =?utf-8?B?SkJpTkdCZ1hIWHh2dmh2aWM0WGlPTytQUlVad0dxUEtJSXFVUEtrTGYrUFNq?=
 =?utf-8?B?QnJYOHA0MmlWQ3VBUFJmUll2dlBDamZVVHp3ZzBnUkZNdnk0VktaaXJ2eVF4?=
 =?utf-8?B?QUNJTm8xSmV2YnBhUUNQVzEzNkg5TzJQUzRSVEtGejJmU29zd0dTVExvUFpw?=
 =?utf-8?B?UlUwTVY3UVd5UFh3VE1GWkNZMzhrQ1owSDJQdUQxdnpzTndLbkZiR0pZZGpp?=
 =?utf-8?B?Y1VhOE5MUG1RY1U1S0dGNVYwSHRIcEVvNCt4ZWFLQ2liMkpUTGFMUWNrSHhy?=
 =?utf-8?B?VFhQUkh5dHlJL3ZVQ1Q5Qmo5amxRZjg2eTV0TFJZaFZMdE9zMVhQNFltZERi?=
 =?utf-8?B?RUZpUk1GU3hSUzVSdnRzdW9XSURVYm44d3BhWVp3SHJ1VXlTanRjNzF1a0I1?=
 =?utf-8?B?cmFPVkY2MHNpbEFSb01Bd3VRemR1QzZ3RUZEeTk5ZEFQbjlmTUdoZjM1dllM?=
 =?utf-8?B?YkllbmVJVC9EY01XY2x3MDhMZ2U1TGhkTVhGLy8wbHpiNUt2THhMcEpxT0hF?=
 =?utf-8?B?NS9mR3lCVFhqNHRuZWptS3VtbGFMY3VFV3VjU1VJdzdKakVyTVB0K1BTektp?=
 =?utf-8?B?cFN4Sk9LN3F5aHh3ZWhUZlh3RWlxVjNvZXZ4c0ZKcWZSeURDZ3E2bm5FRmpI?=
 =?utf-8?B?aVJKb3YzZzVoUTJZUFYxRk9GVW1HSXRUZEdEVU9WeUhvbmFuT2F2Z3YrYXpz?=
 =?utf-8?B?VE0yMVl2U21uYTZGMUFaMEozQU5YdC9oMnpUYTFHSEh0VE44aDNhL0VuRy9H?=
 =?utf-8?B?aU5yY1c5WmFkUVR5N2pWOEl3V2FTNi9RTFVubmg1OUZ6MUt1WXplY0UreEpP?=
 =?utf-8?B?MUVqbVFLME5HYXNsSm1YMVlHTVRTSmFVa2l2TUtadSszQ1VFV2xXMDg4STVH?=
 =?utf-8?B?Wi90Y0ZmOGtBemt2TGV1WFZ5d0pFSHJ2dEVWV0NybCs2L2xGa0dzMHFWMVhY?=
 =?utf-8?B?VGxKUnFHSmpVdzlVZTRUS29kaldyQ2FEdlhQc2toUmRzeGhSTFJWY3IrZk1E?=
 =?utf-8?B?cXNTdDVOLzZpdS93RTJQdS8wbDZ2U0c0SVhTNFZLUzE1SzFTYmVyZnhIWjBO?=
 =?utf-8?B?UWFNSCthY1Z2NFc5Mmgrd0pJSDNoNlduUytXUDRYUUgvRTV2RnBRby9EdW5P?=
 =?utf-8?B?M1ZsU3lxNTlJbHJjZnU3MTVIYzFhVllrVGNvL3Z5QXU1ZDVKUjRLZzFWbC9p?=
 =?utf-8?B?K0xscmVqTEtoZlRETWdDUklkR1NKcTNjNGswMnV6aW42Z0JYcWs3aXU0Rkg2?=
 =?utf-8?B?ZmhzdWcrb0poVlgwTVRiWVFzVjFHRFdFMW81bVJ5YzlId3hnMHZxUjNYOVdQ?=
 =?utf-8?B?OWxrcHRpMnFGLzk4aG4xczFhMWtYUjhWeDl1YmNRS1BvTlI3YVcrUW9wYlM5?=
 =?utf-8?B?TzNkbFBqaHkxQU9iQUJyZFRDd3g1MnFTZW9FTlhvWDZSUDhCZ2RBR1VBV1ZC?=
 =?utf-8?B?MG5yakRCdnFxL0FlZ3EvREZKd0RJYndNYVE2OUFJWEpFTVZjKytHZWRYUXZX?=
 =?utf-8?B?TUJxb1lDYmNHRXRrV0VJYUJVcmU5ZFJlalkrVm1XUjN4N3JySjZuemlmcTll?=
 =?utf-8?Q?LzNIl9vbgpRUJHuDVcrchdh4fRWssT9S8AE4pCVGxE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:19:47.0790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1502f9bc-fc3a-4f37-28e8-08de59da7150
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_171955_601020_9D979D58 
X-CRM114-Status: GOOD (  15.97  )
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

Update the bindings to allow setting per-line interrupt-types.

Some Interrupt Router instances can only work with a specific trigger
type (edge or level), while others act as simple passthroughs that
preserve the source interrupt type unchanged.

Make "ti,intr-trigger-type" property optional, with its absence
indicating that the router acts as a passthrough. When absent,
"#interrupt-cells" must be 2 to allow each interrupt source to specify
its trigger type per-line.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v3:
- Avoid new redundant value IRQ_TYPE_DEFAULT for "ti,intr-trigger-type"
  when "#interrupt-cells"==2. Instead, make this property optional and
  check for its absence to use the per-line interrupt-type setting.
- Link to v2:
https://lore.kernel.org/r/20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com

Changes in v2:
- Reword Commit msg to better describe the patch
- Link to v1:
https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-1-c28e8ba38a9e@ti.com
---
 .../bindings/interrupt-controller/ti,sci-intr.yaml | 44 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
index c99cc7323c71..8156ce6d2ab4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
@@ -15,8 +15,7 @@ allOf:
 description: |
   The Interrupt Router (INTR) module provides a mechanism to mux M
   interrupt inputs to N interrupt outputs, where all M inputs are selectable
-  to be driven per N output. An Interrupt Router can either handle edge
-  triggered or level triggered interrupts and that is fixed in hardware.
+  to be driven per N output.
 
                                    Interrupt Router
                                +----------------------+
@@ -54,19 +53,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 4]
     description: |
-      Should be one of the following.
+      Optional property - should be one of the following:
         1 = If intr supports edge triggered interrupts.
         4 = If intr supports level triggered interrupts.
 
+      If this property is present, #interrupt-cells must be 1.
+      If this property is absent, #interrupt-cells must be 2 and interrupt
+      source must specify the trigger type in the second cell.
+
   reg:
     maxItems: 1
 
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 1
+    enum: [1, 2]
     description: |
-      The 1st cell should contain interrupt router input hw number.
+      Number of cells in interrupt specifier. Depends on ti,intr-trigger-type:
+      - If ti,intr-trigger-type is present: must be 1
+        The 1st cell should contain interrupt router input hw number.
+      - If ti,intr-trigger-type is absent: must be 2
+        The 1st cell should contain interrupt router input hw number.
+        The 2nd cell should contain interrupt trigger type (preserved by router).
 
   ti,interrupt-ranges:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
@@ -82,9 +90,22 @@ properties:
         - description: |
             "limit" specifies the limit for translation
 
+if:
+  required:
+    - ti,intr-trigger-type
+then:
+  properties:
+    '#interrupt-cells':
+      const: 1
+      description: Interrupt ID only. Interrupt type is specified globally
+else:
+  properties:
+    '#interrupt-cells':
+      const: 2
+      description: Interrupt ID and corresponding interrupt type
+
 required:
   - compatible
-  - ti,intr-trigger-type
   - interrupt-controller
   - '#interrupt-cells'
   - ti,sci
@@ -105,3 +126,14 @@ examples:
         ti,sci-dev-id = <131>;
         ti,interrupt-ranges = <0 360 32>;
     };
+
+  - |
+    main_gpio_intr1: interrupt-controller1 {
+        compatible = "ti,sci-intr";
+        interrupt-controller;
+        interrupt-parent = <&gic500>;
+        #interrupt-cells = <2>;
+        ti,sci = <&dmsc>;
+        ti,sci-dev-id = <131>;
+        ti,interrupt-ranges = <0 360 32>;
+    };

-- 
2.52.0



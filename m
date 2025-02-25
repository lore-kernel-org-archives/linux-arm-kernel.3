Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B21C19777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uAAqY2bXbtRuLdeNlmB4D8vJH3V71wfEC0fEOZg0g8=; b=WzDE+v6J14RPAGr4bR37wZickw
	iuopCLqpyG6wR018vXO1C2QzY9Jz2NHNFdash68XLAjvuVNFdGxFAAxvqQcnjWHXQkGBrXxgpVX01
	gCT93svqdNAiRDyGGAsB6XbO0dDitdmHcNYxlNVt0jHRTeRP+MaWWWVxEF6raXhu7arKCPd4jrwvT
	2Hl6DgPvVLYzBp+LQmwu5e6jgSJcZqWSZpvK+TFb6kdmgSmEk+jjrQaVtRasldu9NzM26NZclQLrZ
	Zxn/ZibbxqpUUqlzzbByb2STyWpxmjPxBIz5SWufu4c1smMCQBmKQoCZFXNfAWsbHpD1iCuWHlR9n
	gtXMJkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3h-00000000PlZ-20S4;
	Tue, 25 Feb 2025 16:45:25 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxaI-00000000AxC-3KGE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:15:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JVxBKXhPr3eSqwENq4WklOIQwNzg+haUIBtqUDNiXR5rTucLtb1zB2HbxoNd3kJ1yyIcDSeYWDaGu9PQ6z3m79Dsj4ThLI62M/7wrYxYk3DjcZsCsS83VjUr3O4ob2+/cmOKkLiRLQmYB+J2JPI2llKd3LhNWbOOCGZ68LoAIZ23RbqPwqhzCoXfh7wCDZNLyVzvusRaSWJPx0HaxXQ2/tHQhBEm8TlYyH60wNfUJfwBxZH4EoKHVBfWyE//wEuTE9DkXnrRJ99fv6aVoJrEwAmfwh5DgxrcFJrcYbnq4dBo026wVpFlEm3ixdYLecKN7I9sX3Jkh9XGAqMOLZ3dRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uAAqY2bXbtRuLdeNlmB4D8vJH3V71wfEC0fEOZg0g8=;
 b=wfIi/k6j64IEwD0RIL99sq5PrLzkrHdXqlkM2m0wE0+QLYolu6eKBcmJrxI8eR9ruuX7nDVLWnVjSRM19DXAPriGNk9zNm+6u43E9aM3KdQOq+8hMDBGv8+bn2eRzjDI3K3hBAsQ0uXSb0B2KjLTvDmJPVhPICPeQov04kf9ScX1xsZgz5D06f+Nbi0QYaEKi8MGm9fVu2cJkQptF97v7yUZqS8tNCFi9+ZDTf4N2ACxVhpF/DWoWlnKZGdXldvFhDHTeQ7ZbpSJ1p9y9guKYSHE+D9LjH7JsbK6GXFycMq2FFvJ+EphUgHUDIgw4NEyutTqYMU3xZ53ejHTD3GhUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uAAqY2bXbtRuLdeNlmB4D8vJH3V71wfEC0fEOZg0g8=;
 b=ovCr1/zPUrsybiQJNuy160lvDF/upoQ9xib/ZdeQiC2TTCSq3DFBf7fw708hWq2b0MU/l5IZRlhd3BvIx8mknM/cVCP54iMzuCf4v8MUQbW0n9cSgHRmtTi4UH0wS3iwvOqieoBLdMQMdff7JMBLRzebZNchpAfkWbptuOMrYfY=
Received: from DU2P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::17)
 by GV1PR08MB10977.eurprd08.prod.outlook.com (2603:10a6:150:1f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:14:46 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::c3) by DU2P250CA0012.outlook.office365.com
 (2603:10a6:10:231::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 16:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Tue, 25 Feb 2025 16:14:45 +0000
Received: ("Tessian outbound a60532193129:v585"); Tue, 25 Feb 2025 16:14:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19119babab32e8b3
X-TessianGatewayMetadata: BJ5GFQg3j9rNivsIgv7dm2qsMRQ6FPyYH31bNNeQvlBSiUSlnznRylVvxjPXpMRSxQ//m2aMQkR8y7oiOMwlMc9Cx3fpAJ85htHhrHVSUM/UbcJkkSTLVhLeG8jOuUgmNTCIYMjvpJfrxnbkn5xea6PIkMizbATqX3nAc9GINiU=
X-CR-MTA-TID: 64aa7808
Received: from L3b335dfc6564.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 49C2E535-067F-49FE-A30A-6FC7D194F96A.1;
	Tue, 25 Feb 2025 16:14:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3b335dfc6564.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 25 Feb 2025 16:14:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2KA25PwFti9CrdHj7h5IHsMTm3/sNKRmXyV/PPz0LnNhJ/1Brg0gEmiNoJEDyiQ8+CAW2UB/sOQf7s/kz+z2ruJCPCqeRnsMAz5r7Cf6LvA8Lcm2Z0eDHTqw8aga2JsbKdeVsRVhI/AnBKb3iNzpOSMfPWkGkuSNJ5i4rfQUQK+X1dLWZI1UYuAPraLFQhjRpOpEwVBHpItA5FhoSnKemtNyqgrKxomrld8s4AFE6TzK62zi+aN6zuZtu3qrv2UYFp7jz8LlVZK/lKbY/iSFncVNOZO0M6rG2ZUwkV+QMLOHogFVavHhg6ZASXRrzMDlxoo71DGAcei6655lNlagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uAAqY2bXbtRuLdeNlmB4D8vJH3V71wfEC0fEOZg0g8=;
 b=qXwzNNITz+WcxYDWofIbUZRkenqQ36K7zDBA1GstocWLwxmYLfYrxiqnET4PTb7CDi9y4uSuzOSAyTTQB1Z6bO2t8C2j05Mjm0bysH6FvKH7cDVEH28P18JxRX+sh31Y4HJgksX9r0lmuX/4q41/NPsg42Kqsmoju1fZ5ZFCRcchnI1nGEp4TU60ZrbIrB3Dq3baAyWsUPjllA7Lx+dJ9gZ+GGmJpmKU99Hx/uOWSUFFD/GlKZ2CJ8hZhNlD3xQ48/7bhynSPo1LBw8xvOCAxxwT708DuFFeOSCXeYFFSsk+WlQFTyk+7U1iGaR3zMNI5d8CoffpGdBsOhNQWvaJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uAAqY2bXbtRuLdeNlmB4D8vJH3V71wfEC0fEOZg0g8=;
 b=ovCr1/zPUrsybiQJNuy160lvDF/upoQ9xib/ZdeQiC2TTCSq3DFBf7fw708hWq2b0MU/l5IZRlhd3BvIx8mknM/cVCP54iMzuCf4v8MUQbW0n9cSgHRmtTi4UH0wS3iwvOqieoBLdMQMdff7JMBLRzebZNchpAfkWbptuOMrYfY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by GV2PR08MB8169.eurprd08.prod.outlook.com (2603:10a6:150:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 16:14:31 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:14:31 +0000
Message-ID: <b5ffd56c-ef29-4889-b2ac-ba334e86d059@arm.com>
Date: Tue, 25 Feb 2025 16:14:29 +0000
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 aneesh.kumar@kernel.org, steven.price@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
 <20250219220751.1276854-4-suzuki.poulose@arm.com>
 <0b0705aa-8c85-4502-8450-a6c7fdbdbdbd@arm.com>
Content-Language: en-GB
In-Reply-To: <0b0705aa-8c85-4502-8450-a6c7fdbdbdbd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB7727:EE_|GV2PR08MB8169:EE_|DB1PEPF0003922F:EE_|GV1PR08MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 77476420-0fbb-47bc-0d68-08dd55b784fe
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?S1JqcWRlNWhBL0U4bUZDTkxqTEcwWDI1Y3JJUDVIWlQyRURuS2s1QTRmUlRD?=
 =?utf-8?B?VENwMzBaZW9yN2dKaGsvcDI2V2xmY2RoYWRiNWV3bytvQ3J1N0FKRStQUUhq?=
 =?utf-8?B?bmN5bC90K2lkbFdMUGFZazdYUUw3Rm50aFdCcGJOaHcrZTFIV0ExaWhzSlYw?=
 =?utf-8?B?UDJVcEdWUGxlRCt4bGExcEpYWUZPQU5MWDV3U3NJaTNOdzQ3K2h6V2ZKdmxu?=
 =?utf-8?B?Wi9wNndxVklQTnZMd0FuZlBDZmx5VEFVaDZkSDNSWUpDNnRWNnJhYUhXSzFT?=
 =?utf-8?B?aEg4dGV1cVhtMDdtMVNFcXpKQklWN29zNHhGYkxzUFhIOGpDTXdsMnVFNEZK?=
 =?utf-8?B?S0JQZXQxaFRldTV0d0N3V3NRZGZFdldXaDJNS3FxbUVLbjhYRGQzR2p4dXBy?=
 =?utf-8?B?cEQ4MmVoQUR1d291WXZZa3Y5c28ybnIrbVhCZFJOejVXcHVQM2RJOGFtRWs3?=
 =?utf-8?B?M3BvQXJnMlk3NURIcXAyRm9NSzJLVGc5UW1oRSt2K2dzRThpVit2eHlhU1VV?=
 =?utf-8?B?eWNKaFJTTFl2ODU1L0tzMEdhREt5R3dodWJVVFRQeFJyNzRBL2tVV0dxN05p?=
 =?utf-8?B?MDhZVE5iT3pEWGQxU0ljMkhVaGE0YVFydHNxMUZEblk0QVhrT0tZMzFwelV6?=
 =?utf-8?B?d0d2YUlxem9sRkhiQ3VnQVZvcUFjWkhuZDNVQTk4SEU1UXc3VjZpSitIaGFJ?=
 =?utf-8?B?S3VVNmdwa3RKYlBZUGxjQ1htYkJvYmVCaEdMU0l3dWVLODNNWmQ0cjNTV0Ex?=
 =?utf-8?B?TnZjbDRnQ2FxZFh3Nmg0V1RNV2NSdUM0a0IrSVllN2RLUk5kRkNHOWRRanNB?=
 =?utf-8?B?VGJBa2FOSnhadTJlRmdmV3QyN24vRnVvdytCQlVXN1oweDFqeHhrTkQrZVRx?=
 =?utf-8?B?c1R1UTJUcDEwYkxkSExXRXR0QjJhVU5HMjE4K0VFZ2VxUDc2d25HVlVhQWxo?=
 =?utf-8?B?R1E5ZGtiQVptYmN2akxHNEg0dkt1ektrWXF2Ni9PZnpxUFQ5d2Vaa2E3Wmc4?=
 =?utf-8?B?dlE3SXcxM3dOcUlWQm1ia2NGRGl5OVZWMncyYmZqTkJrdkZnRWN2Ujk1T1pw?=
 =?utf-8?B?ODR4eXFRYmlDc2pnV1l1SmNDK1dGeGxING1JSDA1a1NuendqWVdUVXpzZExS?=
 =?utf-8?B?bnZuUndFOS9oenZTVGVZR3dSWnpxSW4xbm5kbVZYdS84UlNoSFdFSGlKWUk1?=
 =?utf-8?B?V2VBbVZoUFV0dFFVc2kwNHI2TTJjbU1YUldUVmkxM1FSVlZZUUdyZ295VGw4?=
 =?utf-8?B?WGZMWG5mVk8ra3FhckxnSE9GQmxUM2FTamJURTBNYzk5NVdVcUR1RmR3TWJl?=
 =?utf-8?B?Y1ZhZVowbkFUWDBFRHU5Z0thNlB3K1lSRmEySFhzWWR5TldQa054ZDFBQW5W?=
 =?utf-8?B?L1F2TzhYRWJUa1Fma0E2TG1MTjFPQlIxRUV4SWQxSldLTXhoQUhwbm5MWTdm?=
 =?utf-8?B?OE1yQU9hT053Ylp5eDhTNm8rc3ptOEh4R0pQSEI3SHVITm5vamZUQ1J4NkE2?=
 =?utf-8?B?UUpZVkZwTU4vcHhxV2ZDQktBdUFHQUdIaVJMV3p4ZUdWdDV5dHo3YXhWUTRR?=
 =?utf-8?B?M1Z0dlRoNlk3d2FnV2RwZ0JHMTNBTDVWSEY4NzBvNU41RXdCL0Zmdlo3bCs5?=
 =?utf-8?B?WEJicFhOdFpKVDF5bVZmNXBvY1o2Z2lIV3RPS29MbjlNM3NWckNzZTc0STZx?=
 =?utf-8?B?LzNOdW1TTUpIeXBLSDdrbG1UZHp3c3dMVTl3K3lwK09jblRlc0tRQW15aUtT?=
 =?utf-8?B?UTRwK2hqcjJ6b0V5dmdzeGhEekxTNkp1eTVDeGhOVThiajUwNEEyRnFpN3Jx?=
 =?utf-8?B?ZmNGNEwwdHdtcTNoYmVNWVBkT29nWXhNaEl6em1tSkVMR05yaG1CZkc3WFJF?=
 =?utf-8?Q?S5dnt2Z5Z0mMJ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB7727.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8169
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:6b::6];domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 092429f5-8174-4962-c5ad-08dd55b77c45
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEhBK3lBenpJZm50Nm5nRFl0WGZ4ZE85MWJpczM5SnkzRWhkYjNYM0hIYkZ4?=
 =?utf-8?B?TDFjQnd3aW5DeTVONllZWTVrTGgvUTBsV3RtaG16STAzeFovaGNHOExDNW92?=
 =?utf-8?B?VmdVdEVsOGFPdUhGakNpUFFic3NWRlIrSzlHRUk3aVVYS2h1cW5YcVU4MGlW?=
 =?utf-8?B?TWxqT3ZkQktNdU5Ra0g0cXdicUI1L1VoaEVQQlAzNW43Q25LcUZMRTRndTJy?=
 =?utf-8?B?a0pkQkw1eE5iS3VSVDU1cTV3Q1lFQUYrUW1Mb1A4R3JVWW5yWVFZMk1WUEJE?=
 =?utf-8?B?WVdMUk9EdW5YTDNiNkxFUERDb2FVRmFCZWhwU1VwRFZ3cm9hTFRzR1pKY0lv?=
 =?utf-8?B?VGl1TStyVjl0UTZYRkNyUTNTZ3ViREpRMnhWeDhTUjFEZmRKbHZaakdWNitK?=
 =?utf-8?B?WllycUxBZmRiZUFTV1U3aWlBbHIySU90TWwvWDFnT25NWHJlWHRzb1B2QTJY?=
 =?utf-8?B?aVBrajJlVVEvL1NycXRtUHhqSnVYVDlrR1dkTmJZRTd5ZVcrRlFyNm1KcEpJ?=
 =?utf-8?B?WHdsTUZUV2YwaG1JN0tWT0Q5bzZqSG5ZTjU1VUdaQTdOY1ducXllWnpHQkF6?=
 =?utf-8?B?T0dzZWd6Vnc2dXF3d0E2ZG1wWHE3ZFhtd2NRWUU4RUloN0hQRG14VjdFWjg5?=
 =?utf-8?B?T0h2SFNIVXRmMnk5QXRHN0RQTXVGWVpZSURsVURqaTkzQ0UwKytQZHI2UFRj?=
 =?utf-8?B?djdiUktXb1dQOE90bmdseHFnWktWWS9abGJYWGpEM0RNVXVsdytZOGRWbFBm?=
 =?utf-8?B?T1BsQ0ZVcGRNQmpnQUJCeFBzREpvUWxnK2pKd1JPY1IwM0hXRXNOSHhwM1NI?=
 =?utf-8?B?c3hWVzhjY0svMkhJS3dNbGNoUGJxMmFnTUg5M0F5bjVQa0VpYmNMNUNVcGkz?=
 =?utf-8?B?aW15MUtYWDVDVHZEc2RTeTNTUnJ1QmVma1ByblZCdEtTWkhNS0dGdjNPaHVU?=
 =?utf-8?B?bGFuR2M0czJ5dHRkK1J2WTJmSldpSDV4L3AyYkkrbnJPWlNOQkdPVUFENlFH?=
 =?utf-8?B?bDRzVzZXRW9YRWtoSVoxTGZLWVI0R2tJVHQ0OUFNRHp6djYzdjYwenBMVlJJ?=
 =?utf-8?B?bU9KUkF6b2huZ3ltcURNWDQ5S3hxMTM3RmdXZjlXU2hVMjdXNEFLdGJzU2dR?=
 =?utf-8?B?VUNSM3FucWE1dnMyM0Y3bzc0UklSZVZjcHBLNyszSzVnUmNqR2d6NlovWVlW?=
 =?utf-8?B?RytCQWdiS1psTUU1T0NWa3RDeWN6QXVXZ2lFWFF1WnJoRkpQc0pmMjdjaXcr?=
 =?utf-8?B?Z29abDFYRjRab1oweTE3bTFaOHhLblQzbjZ0MXV1WG1nQU81cTVySmFZNmJQ?=
 =?utf-8?B?ZS8xaWlsR0E0UGRTdlZRdHA1RDFaOWVUZStZT0l5aVVWakg1V2ZJcVFPaU4r?=
 =?utf-8?B?TGZkVGE5TDFFWkpjbXFBMU90MTZsbEVBeWQ4ZkNMa0o0eVJCMlFuelVab2JJ?=
 =?utf-8?B?QTdodGdtMjJFZHNFNitrNWt1UjBlcXFDNTZIY01RQmhaU2FlTE05UnRIUytj?=
 =?utf-8?B?SHZUck52TFdwZ2lydHlhb1N5bWtneDJoWW9Yd2lMQXdqS21zUVNhMUVNQzhX?=
 =?utf-8?B?b0dNbWc1TkYzRGhKSFI1RmNIZ3puY1JDTUlsYUVZUVN2YklDMWJvSUZaMzRk?=
 =?utf-8?B?L0V1OWZUK04vOWJkTkZodWpjS05NKzVJNzhSU1cxRTNZQ2Nqd2xGdG1uSGRp?=
 =?utf-8?B?M3ZBMjhpUjFKRW84bG9SS3JjWlJmbGNUTXN1c0dKK1VIK3pLZTllcjZxV3hu?=
 =?utf-8?B?TURnOTE5UHJxdmJDRUptNlFET3l5OHhmb29DbTg4L1IzUm5HcTdYbVFpd2hY?=
 =?utf-8?B?K0w5YVFPUVA2Y0t4NGYvTVFUSUd1aG9IY1V6SFk1VkVSVlk2NHlZNVhnVzgy?=
 =?utf-8?B?VlRGRkluVHBNeDNGaXRPcHhEbk5wTzNsbFRPTkJ1ZWdWTHVhNnRTN1NGa0o3?=
 =?utf-8?B?ZFRKaVpEMmRtNmYrTzc3YW5FOGpMSlNGOHhaU0hHSHdsc2F0V3gzYXJVSVVY?=
 =?utf-8?Q?M335/8Dfxt62mPHjSoOUItasTxqpp8=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 16:14:45.4940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77476420-0fbb-47bc-0d68-08dd55b784fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081504_155487_D21F0D2D 
X-CRM114-Status: UNSURE (   9.32  )
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

On 25/02/2025 13:04, Robin Murphy wrote:
> On 2025-02-19 10:07 pm, Suzuki K Poulose wrote:
>> When a device performs DMA to a shared buffer using physical addresses,
>> (without Stage1 translation), the device must use the "{I}PA address" 
>> with the
>> top bit set in Realm. This is to make sure that a trusted device will 
>> be able
>> to write to shared buffers as well as the protected buffers. Thus, a 
>> Realm must
>> always program the full address including the "protection" bit, like 
>> AMD SME
>> encryption bits.
>>
>> Enable this by providing arm64 specific 
>> dma_{encrypted,decrypted,clear_encryption}
>> helpers for Realms. Please note that the VMM needs to similarly make 
>> sure that
>> the SMMU Stage2 in the Non-secure world is setup accordingly to map 
>> IPA at the
>> unprotected alias.
>>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/mem_encrypt.h | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/ 
>> include/asm/mem_encrypt.h
>> index f8f78f622dd2..aeda3bba255e 100644
>> --- a/arch/arm64/include/asm/mem_encrypt.h
>> +++ b/arch/arm64/include/asm/mem_encrypt.h
>> @@ -21,4 +21,26 @@ static inline bool force_dma_unencrypted(struct 
>> device *dev)
>>       return is_realm_world();
>>   }
>> +static inline dma_addr_t dma_decrypted(dma_addr_t daddr)
>> +{
>> +    if (is_realm_world())
>> +        daddr |= prot_ns_shared;
>> +    return daddr;
>> +}
>> +#define dma_decrypted dma_decrypted
>> +
>> +static inline dma_addr_t dma_encrypted(dma_addr_t daddr)
>> +{
>> +    if (is_realm_world())
>> +        daddr &= prot_ns_shared - 1;
> 
> Nit: is there a reason this isn't the direct inverse of the other 
> operation, i.e. "daddr &= ~prot_ns_shared"? If so, it might be worth 

It could be. The IPA size for the realm is split into half with the
lower half protected/encrypted and anything above that unprotected. 
Technically any addr >= prot_ns_shared is "unencrypted" (even though it
may be invalid, if >= BIT(IPA_Size) - 1), so to cover that, I masked
anything above the MS. But now when I think of it, it is much better to
trigger a Stage2 fault if the address is illegal (i.e., > BIT(IPA_Size) 
- 1) than corrupting some valid memory, by masking the top bits (beyond 
prot_ns_shared).

Cheers
Suzuki




> dropping a comment why we're doing slightly unintuitive arithmetic on a 
> pagetable attribute (and if not then maybe just do the more obvious 
> thing). I doubt anyone's in a rush to support TBI for DMA, and this 
> would be far from the only potential hiccup for that, but still... :)
> 
> Thanks,
> Robin.
> 
>> +    return daddr;
>> +}
>> +#define dma_encrypted dma_encrypted
>> +
>> +static inline dma_addr_t dma_clear_encryption(dma_addr_t daddr)
>> +{
>> +    return dma_encrypted(daddr);
>> +}
>> +#define dma_clear_encryption dma_clear_encryption
>> +
>>   #endif    /* __ASM_MEM_ENCRYPT_H */
> 



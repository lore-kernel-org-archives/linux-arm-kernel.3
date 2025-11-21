Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00547CFA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s469QfPrbTx5qrf39X/yoMIkyF6kxG2W1hb42s/Icys=; b=VDW4flBo+92vqJjOrQQoREDS3x
	iRcHHdXBSBL99qzpeBCGQzMosGVoPx/YQge4TiiVElMKPlfZ50di/UssFFApQIZsH1qUHRvwo48hq
	w+8FlJcqFOC4I6s13XyPEa4H6AmxKBs1RP/izlCOFT0vP4kwmyjO6lD7vst/wqaogI1v2y6JWJH7F
	MPj8Tuaj/s0zoKy1KX6encrRN6SWiy9yLmZwVV+d9k4E0E7HeTIx+XCxVgPbqbIMT7amsGavpA0L8
	VRb9Aaq5S5KQMyYeinXhmGxKqTH/fQIL3p1Pmx+OeM0iw3SkSFrdL3aPA0qdU+Ux3LmuW84ybG1RP
	TDFSCKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJz8-00000007rtU-0svC;
	Fri, 21 Nov 2025 05:47:06 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJz5-00000007rsC-0VrM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/Spb6ywaTmSoItn3QYTOzwuBvPIn11WgBPb3GpqOBfIvmbaoC0vdOWuHl3doPjPF+uQJcvZj4DgFH0YvS9EAeqJsKF6+5KFUQzf4G72eO/XVdGkAI/8JF57Ipf8wB0MPPhWtO3RnRWCbzJ/uxqECws3h4YKr9YjmisMxLZTaBEtHWS9d00Nb4pH/t7gB5PZzDOs6tsH8NdfPQ2LrSy5+9zVG9XPnW+hZoSMdT2Jutu4o01m2zPe2fyu51k2VvCF4EFwRWKOruS9AhLzyMsinUVl8MSxPgp80gyPvsqx9UJwXGNivLJjQct1a6bjGiqiGXIfncrlaiPPk7nzMikcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s469QfPrbTx5qrf39X/yoMIkyF6kxG2W1hb42s/Icys=;
 b=f+nFHzZzMb9QbgKL9tLkz2D/0jTDP58zPy2MftKqaxbSNX5WfAenVPsnyObjeeTGU83eU3935inr5fIzzKjcRSWow8iHLPAVk8YXveCEcJ2XWk9HEE9NZT8RKegRO+Kl/0k64uppE5iNOp4q/ONIyc8ivwWu4eQutLnjZOBYyxyHbEwlBVuvf7cB+KBZB6NlBs7SiRZo6kXIbPdFb3KjWDNWkIhXzMgXnBXN4t/iOzKplLuvkjEiCS+b/w8QKaVd4rHr6Qvw8muA/l5BOxJjOD5R1KCWF8oPTAmjOPVhY2eju38g0ovKLm8qfcoDsk2Z3rTVSYrrOYdBPhnJcla6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s469QfPrbTx5qrf39X/yoMIkyF6kxG2W1hb42s/Icys=;
 b=QTrchhGPr5pYpFHUEJHAP43bVlwaKchO2gXx98i4fY0aLQzU7VC7K2jejGzrEovUNILRYZ+BS3bCuczsVWgrZlK1ugMNNgy7z06ovYrXllH2hwmLlNImB7AHZeYYhEEqCfjj4EpK2pa8PKKrnq+4FC5OUjdrel1aUZyWkmBJG03fbeDV+6jxlvrtm/Op7BXEI2l21g+OqH4msVioQB8ye6V5Lp8MlT7cR5enykquUHkuGkw4Y4c4ahd2b9ZhfJc0h3ziKQfBgqeQAmE/BtsokfwbcX99r7dsGVYL3bRTh+oOrAegDmkt8CyGzE0uWHxe44A1odHg8LbqkCtBotPgAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14)
 by IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 05:46:56 +0000
Received: from BL3PR12MB9052.namprd12.prod.outlook.com
 ([fe80::72a2:58f4:e848:e55]) by BL3PR12MB9052.namprd12.prod.outlook.com
 ([fe80::72a2:58f4:e848:e55%3]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 05:46:56 +0000
Message-ID: <bb87c493-bf4d-4f6b-9327-f07aa61c81d5@nvidia.com>
Date: Fri, 21 Nov 2025 11:16:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
To: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, will@kernel.org
Cc: joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jgg@ziepe.ca, nicolinc@nvidia.com, linux-tegra@nvidia.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251031062959.1521704-1-amhetre@nvidia.com>
 <20251031062959.1521704-3-amhetre@nvidia.com>
 <20251031-witty-sociable-chachalaca-b73dbc@kuoka>
 <4f6496de-d3c8-4701-a9b4-6f695018eb5e@nvidia.com>
 <ef5bcd93-c88b-4242-be31-a3a4765fe5d8@nvidia.com>
 <c23f72a6-24a4-41c4-b5f5-70a8589f1199@arm.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <c23f72a6-24a4-41c4-b5f5-70a8589f1199@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::10) To BL3PR12MB9052.namprd12.prod.outlook.com
 (2603:10b6:208:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB9052:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: fad08d2f-f1be-450c-990a-08de28c1614f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUo5eUlMejJNVi9zZjRmSjNSOTUxaVRsZDNpOWxYeGorNGhOVEFWNFBSUGNz?=
 =?utf-8?B?eHkyMkxGTFQ2YVBkeVMveFpnOTZ2aDhTdlAvODFFbk9iZVJKb0hTR3VlNEdC?=
 =?utf-8?B?NEdUelNESEQwbVM3WEZaUjVoWkFKSzZaV3l1WmpDenNVVDdkYTdseDU1M3RD?=
 =?utf-8?B?eFFQV2NXemdySUNkKzRmTEllYkdSL2xack1RM2l5bVFBbFdMNVZQdTB2MFRC?=
 =?utf-8?B?STR2WC9pOGZDYkJHbXJLelY0WXBsRnVxaFNtSGxDZ29CQTJlV05OVDN6VUN5?=
 =?utf-8?B?K3U3M05seCtNQlJQUG9reUs1ZHRWdTA0d0FMK1RVQWZuL0pKSlNaS1o3S3Az?=
 =?utf-8?B?TXBaaXA1V1dWRlM0MjdHQ1hjRUhCK0tnOUt5QldaYVBOTHJqV0dWcUJQbmsz?=
 =?utf-8?B?MVhIQ1lWSDRsYjVadS9kSVJjYUhyRm80NVdiUVpoZ09GaFRKV0tyN2pCSEF1?=
 =?utf-8?B?akhQRjdsRW1aOTdacGhPb1Njd3dMaVlxQWUvK09TU3RnaFZTV1ZweVE0a0FD?=
 =?utf-8?B?Z2F3MXMwRXFHeXFvaHJldE1ycVVzcDZvRXlhZlFGTmxwYzI1RXJpVm82bnN0?=
 =?utf-8?B?amZKNzJEdHA3L3czbkJUYUVPRlFZcDhPMHJMSUlDWTkycThJa1VMUXFhbkFa?=
 =?utf-8?B?dWNQVlhCaGdoaDNLV3VsL1ZiU3JDZExtWUI1T0pXQlBDdXVOeUF4Y0k1SXNy?=
 =?utf-8?B?TzZjWnlBUTRmbnNPNEJRTmJUV3BtRnRrYytIN1JsTHN1bjkxdXRkVWMwQUZx?=
 =?utf-8?B?Vi83U1JJbWVGcm1Zc2k2Szl5UG1UZ2R4NXBVbWllQzNBS0tkczIzN1BVSTVS?=
 =?utf-8?B?MHY5dDBiZElGRFUwMDlaTlhtb0JXT25yNm1rQ2JFNmp5VWlaMnF0dFhLUXYx?=
 =?utf-8?B?ZEhZKzhiOFhzL1VGRnE4WWlRejYwbWJldnArNGtFTTlvMHhwMlVmYXVXOFNF?=
 =?utf-8?B?R0tjODlXemxRZ1lYRVZnbENDamRFNnJJQ2FEZUhQTUlMeXJnUHZiZHY1ZFBL?=
 =?utf-8?B?L3d0bDBneWloL1kvSTUzZStKNGtrdCtNM1pPK2xPWW8zdUVKWnI0bGJIRzdw?=
 =?utf-8?B?U0JvM0w2elJJYXZ0dCt4akN2aWxqMDJSUFVTeThLQXhhUG1pcFdUYWExekdy?=
 =?utf-8?B?Y25iTkJlcEVqbDBGRi9uUVBMUElrWndUQ0x2VjZBcGVLcDlwVVlBMHdYbmxX?=
 =?utf-8?B?Y3YyYTJCcTJzbFk0SzBKc3MzcUFjSncrVVJ6ODZuRjFpL2V4MXRrWWpQZnY3?=
 =?utf-8?B?T0xTMjdYUkZsVm10cFZaSXlPUHk5OGxHVytRZTNLUVhzcHJpNVQwam5wc1pm?=
 =?utf-8?B?V2RqMG5GRkJZVHlYVWl3T3JLdEhEQzlqQTlwTVhVV09rMUc3Q1NNbHYrVGRH?=
 =?utf-8?B?R2U5YS85YlRzR2lKUTJ1dWxqME5ubUp4ZFZqemZKRFF2RkJ2Q1VveWFJM1J2?=
 =?utf-8?B?QjhIQkhUUGJNWFBlaDBkWHk0YjBiR0h3aWN0WFVGVTQ1dmdTZXZqbUVVL3gw?=
 =?utf-8?B?RTVQYXlNZ015dSs2SGxRN1NET3hFWnd0YVJHaGI5U1g2b1FKTk5jZnoyY3VJ?=
 =?utf-8?B?WHdZbkZtMytFbk54UXE2Qk1XZVNJRkxNd2owRXlsdGRCbXF5YzY3WTBkZHRQ?=
 =?utf-8?B?MVBBMmx1aGlXR0pNWVY1c3UvcXNTaDBDYmxrbk01ZXh6eHd6Q0dwT281cHdh?=
 =?utf-8?B?Z1lvekVNVHF1ZnNUUnRPNmpzeEJsSm9Cd3h0U0x1dGlHcWJUckppbi9RUWR2?=
 =?utf-8?B?cWF5OEFyUjdWOGNic3BnenBtTzd0V3R6WjlZdUZzZlhJMUlyZkN6eHpiTlJU?=
 =?utf-8?B?b2JSaTBGL2Z2Mk5lTlVjeklGb0RIS1RYamJCVXBsU1RYNDFXM2NDMTk0Y1dw?=
 =?utf-8?B?MFNpUS9hVlJFOUYyRWZKV2JkZmpLbXJHK2dSSElhRXJvNkcvSHdyZkExT0dT?=
 =?utf-8?Q?5M0YK4ytlEadANLriiScm1fCW3+B8V4R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB9052.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0hxUGpybXltb0RZZGRMKzJqOERHQ3o0MjFlZE5IOG9jZXRQeFRYZURGKzAv?=
 =?utf-8?B?Y2hzR0FWN2hmWGI2bm1Ja2Z5anA4czVUZlVpRGdWZDBJS3lFMmhDSGV5OFlH?=
 =?utf-8?B?Q3pWYnYzTzRFSXM0ZTJnSFliaHREUk9BSGxEQmhuOE5vTjg5T2xWUVR1YjZM?=
 =?utf-8?B?bmt5R3B5Z1FoaXhkeitkcit5S29Ba2w2Y0I4dldNTUlYY2VQTEhQQXFKaWZF?=
 =?utf-8?B?NHY1czZmNEprRW5NSndoNHlqcEVNWTk3YnZ2SjYybE04eS9CYjZSVnB3Q1Ev?=
 =?utf-8?B?aU5EMnV2SkY2S3lUWEpBUVFYdW0vRFYxb1g1K29rR2Vqd1pjOEZoMENBOFRp?=
 =?utf-8?B?aVU1NG15d0VnMEZTcS9SUFU5YVdNbVg5ZEgyaXBCWVFFMmxJdHNSRjkxMHBy?=
 =?utf-8?B?TE1Fc3NqR0cxaVhVUHlnYUhMZndKRTg2bzJkTXJDY09SOVNTNWtjZGdoOVlT?=
 =?utf-8?B?VWkvQk1qa0UxWUZFU3doZi9EcE0wcmZrUXNYcE95ZFFrL3R6b0ZINjFZanhK?=
 =?utf-8?B?OGtzMTZUa0dtSXRwR2thVjdqVVRjYWpBc1lNQ2h4VUNmMGFxTTdveGtHYXFN?=
 =?utf-8?B?NjlFWU5UUXlOUWZjN2FxWmNabk5jRTFLdDhwOHRxd0hra0pBZkRSaVJqZ2di?=
 =?utf-8?B?ZHlOenJvbDlNVy9oQnQrWlBuY0pVR1RXNkdpd0hBNms3QWVIV3dBVjV1K1dP?=
 =?utf-8?B?dEJnS2hOanhqakZLWTg0KzJUdy9BVnRnd3d6a0ZTSjg4QzgvZkluUWtaQnRQ?=
 =?utf-8?B?WG9keEhBRVI2V1VlYVFQUWNOUnUvWjQ0WTlNOUZJaG5lV1RCWXIvazA2eE01?=
 =?utf-8?B?STJEMzZZQVNXemo1UVBGUE11WXlQRHBDblBWOVR0MUhqQWtTZytUc21iT05r?=
 =?utf-8?B?QVZtSzF0U3lNTVVLUWQxdkpOOGxvYlhFQWczY3J6NlEvVTVCRXZObklJekpP?=
 =?utf-8?B?WXRoeFVjMmNXTFY3bEZsOTRnYmxCZ055bWg0SGZrNk1IVjN0Yng3OHdrKzFO?=
 =?utf-8?B?NVNuQlVuZDE5WEIyaGtWYVBISEw3N3N0Z3hqQnJBVFRTWXdXVW9vaUg1RkZ5?=
 =?utf-8?B?OU92KzF1R0tURzJqR0lLN0VLc0NtaVBHVmhORVJxdkdVN2E5L1VKUjZpYXpF?=
 =?utf-8?B?eSs0M2xDTDg5WGdHWUo1aG9sQTFYRTBpVTBDTGV0OElDU3AwM2RjVU5CK3Yz?=
 =?utf-8?B?bDRsZWhVUHpIbGRQdHNsbjMxSHZBeDNFbkxKMHZSMGg1SHhOQ1VrbVpTSnZr?=
 =?utf-8?B?b3QyaE1uSnA4ayt0WTF6MVpkbXovRzdwL2htbDc2b2dhaW5GckpZWUk4VUpD?=
 =?utf-8?B?SERSNFgzbURoUmZaRHVtaEs0WGwrNUdaS2p4SVhmWmJ6Z2V1QTdZcW9ZMFZr?=
 =?utf-8?B?aXg2Mk53azluMnFUZ0k3eEhyamxJYk44T0JMYzkwb29ZampaTkI3Q3FtWXhw?=
 =?utf-8?B?TkNnOTFhZUsvV3VVSVJCR0RsVDZCSXhpNmVrQVprNGFhVkcvSDFwaG1Gb3lM?=
 =?utf-8?B?ME9zVndSRTgvVlFzNXZSY1RjK3U2VmFKVWhBZnBobGxKNEFDdzFjeVpwT01p?=
 =?utf-8?B?WEtuSTBsek51dTE4b1pWMG9XYnRab3g5M2wzUnBmSUpBaDZKM2RtbC9mRVNG?=
 =?utf-8?B?SndrRFkzbkc5TEVNVUJtM1RMdSt4RHgramZpaW51Qk5KZmd5cnkzbUx1bHRo?=
 =?utf-8?B?Q1FSRURJaVVCOHZwVktJZHFtVUtENU9BUWFhODNnUGx0SU9KUTJQaE9ubmtE?=
 =?utf-8?B?TEZVVDhmRWp2OWw4K2RycTZISlU4TVlIWWNocDRyOVpYVk15T2gxUjBTRmhR?=
 =?utf-8?B?R0N3MmxDMGs3UFNFbHhYRWp6YjBqSjk2NEdJa3lsejErSWFLNzZ4bzdHcE9C?=
 =?utf-8?B?UWUyYWxVaDFlbmpwTlNHUmFreDNOZE14NUExb0FnYUhhOE9WbUZsTUU0enha?=
 =?utf-8?B?MWtxR2FTNDZnMFRCVGdRang2SUh0MXlGdzJIYlNGNnlFTTI2amQ3SCt2aHRi?=
 =?utf-8?B?VUJuUDZRMnVielZyVGtXSzltWEk3bWlPYXlIdmZTTTREWklaZEpKdTE4cGhq?=
 =?utf-8?B?NkYrSUVNeUxqUys0UE9nNk1GcURxV25yOVBmSDZPekNwd2E4THNFZkIvTi9U?=
 =?utf-8?Q?YFIsyUJmq86bQaiyWH8do1Wm9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad08d2f-f1be-450c-990a-08de28c1614f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB9052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 05:46:56.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tq2Cut9b34ukGFixZabFL6itx8qCFiqDaaABhs74NjOT+F1ekLC2fCI1lqBaUs2pkS9D+RjFP6F4x1j+6ULvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214703_222105_93157453 
X-CRM114-Status: GOOD (  26.88  )
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


On 11/20/2025 3:53 PM, Robin Murphy wrote:
> External email: Use caution opening links or attachments
>
>
> On 2025-11-20 6:07 am, Ashish Mhetre wrote:
>>
>> On 11/3/2025 7:24 PM, Ashish Mhetre wrote:
>>>
>>> On 10/31/2025 1:44 PM, Krzysztof Kozlowski wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On Fri, Oct 31, 2025 at 06:29:58AM +0000, Ashish Mhetre wrote:
>>>>> The Command Queue Virtualization (CMDQV) hardware is part of the
>>>>> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
>>>>> virtualizing the command queue for the SMMU.
>>>> If this is specific to Nvidia, then I think you need specific front
>>>> compatible and disallow it for other vendors.
>>>
>>> Yes, CMDQV is specific to Nvidia. There isn't currently a 
>>> vendor-specific
>>> compatible for Nvidia's arm,smmu-v3 implementation. Would it be
>>> acceptable
>>> to document this as Nvidia-specific in the description? Or can we add a
>>> new Nvidia-specific compatible string like "nvidia,smmu-v3" if that's
>>> preferred and use conditional schema to restrict the property?
>>
>> Hi Will, Robin,
>>
>> Do you have any suggestions on this? I have followed existing ACPI 
>> approach
>> for implementing DT support.
>
> No, the way the ACPI binding is implemented has the lookup going *from*
> the CMDQV node back to the SMMU instance (via the matching identifier) -
> this is entirely the opposite. The literal DT equivalent would be to use
> for_each_matching_node/for_each_compatible_node to scan the CMDQV nodes
> for a property indicating the relevant SMMU.
>
> I'm not hugely fussed either way though - since the fact is the Tegra234
> SMMU does have this custom modification, a specific
> "nvidia,tegra234-smmu", "arm,smmu-v3" compatible isn't inappropriate,
> even if it really doesn't make any difference to architectural SMMU
> operation without awareness of the other CMDQV nodes.
>
> Thanks,
> Robin.
>

Thanks for the suggestions Robin. Approach 2 is much simpler with current
implementation I have. I will proceed with adding Nvidia specific compatible
string "nvidia,tegra264-smmu", "arm,smmu-v3" in V2.

>> Will it be fine to add separate compatible
>> string
>> for Nvidia Tegra264 SMMU to restrict the usage of CMDQV?
>>
>>>>> Add a new device tree binding document for nvidia,tegra264-cmdqv.
>>>>>
>>>>> Also update the arm,smmu-v3 binding to include an optional 
>>>>> nvidia,cmdqv
>>>>> property. This property is a phandle to the CMDQV device node, 
>>>>> allowing
>>>>> the SMMU driver to associate with its corresponding CMDQV instance.
>>>>>
>>>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>>>> ---
>>>>>   .../bindings/iommu/arm,smmu-v3.yaml           | 10 ++++
>>>>>   .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 46 +++++++++++++++
>>>>> ++++
>>>>>   2 files changed, 56 insertions(+)
>>>>>   create mode 100644 Documentation/devicetree/bindings/iommu/
>>>>> nvidia,tegra264-cmdqv.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-
>>>>> v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>>> index 75fcf4cb52d9..edc0c20a0c80 100644
>>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>>>>> @@ -58,6 +58,15 @@ properties:
>>>>>
>>>>>     msi-parent: true
>>>>>
>>>>> +  nvidia,cmdqv:
>>>>> +    description: |
>>>>> +      A phandle to its pairing CMDQV extension for an
>>>>> implementation on NVIDIA
>>>>> +      Tegra SoC.
>>>>> +
>>>>> +      If this property is absent, CMDQ-Virtualization won't be used
>>>>> and SMMU
>>>>> +      will only use its own CMDQ.
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +
>>>>>     hisilicon,broken-prefetch-cmd:
>>>>>       type: boolean
>>>>>       description: Avoid sending CMD_PREFETCH_* commands to the SMMU.
>>>>> @@ -92,4 +101,5 @@ examples:
>>>>>               dma-coherent;
>>>>>               #iommu-cells = <1>;
>>>>>               msi-parent = <&its 0xff0000>;
>>>>> +            nvidia,cmdqv = <&cmdqv>;
>>>>>       };
>>>>> diff --git a/Documentation/devicetree/bindings/iommu/
>>>>> nvidia,tegra264-cmdqv.yaml b/Documentation/devicetree/bindings/
>>>>> iommu/nvidia,tegra264-cmdqv.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..f22c370278a3
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/iommu/nvidia,tegra264-
>>>>> cmdqv.yaml
>>>>> @@ -0,0 +1,46 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: NVIDIA Tegra264 CMDQV
>>>> Missing blank line
>>>
>>> Ack, I will correct this in V2.
>>>>> +description: |
>>>> Do not need '|' unless you need to preserve formatting.
>>>
>>> Okay, I'll remove this in next version.
>>>>> +  The CMDQ-Virtualization hardware block is part of the SMMUv3
>>>>> implementation
>>>>> +  on Tegra264 SoCs. It assists in virtualizing the command queue
>>>>> for the SMMU.
>>>>> +
>>>>> +maintainers:
>>>>> +  - NVIDIA Corporation <linux-tegra@nvidia.com>
>>>> No. It should be a person. If entire Nvidia cannot find a person, I
>>>> don't think we are interested in having this in the kernel.
>>>
>>> Okay, I'll add Nicolin as maintainer.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: nvidia,tegra264-cmdqv
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: cmdqv
>>>> Drop interript names, obvious.
>>>
>>> Sure, I will update in V2.
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +  - interrupt-names
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +
>>>>> +    cmdqv: cmdqv@8105200000 {
>>>> Drop unused label
>>>
>>> Okay, I will remove the label.
>>>> Best regards,
>>>> Krzysztof
>>>>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0124EC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZtc3A/1+XU779WCc/25vqVFq8l9gEmxpBjAGWbf+qA=; b=Ff/HUwOWY+19D0zox6F7fk5GDk
	0+VYPK5/OhGBsgDf1Drh6aLe1M/lOvi2nozhFhAAn+nASA/DO7llyegVOYy5KiivF1VrZJMJAagOm
	2EhD/SAOmK7kzGyW4m6qt4jBZNRqx3Xf3bNOZyYdNrP39gi4VGNBG29Eksxr7/9QPiI4jV6kgwfNe
	C7Oy4g3mw7988SeXzUU4MdgiNTx9X96KZoM3fqCFEXq3CHlK7DpzweJ1Kkf8Z5hQC+BUXKQmVZkd/
	blQcYuBnwQSTDP0VowJ8TCNCKw0Xx7lc7G7y5RFaQTKMwDrDA3EecIUq+VlKzpddKjbZjwY06+W6u
	ZDe1rR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL2H-0000000ABSD-1Wso;
	Fri, 25 Jul 2025 16:12:41 +0000
Received: from mail-sn1nam02on20611.outbound.protection.outlook.com ([2a01:111:f403:2406::611] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKox-0000000AA9V-1JmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:58:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGJtLrKQ9Tlti8CtLofe9bT7G4ObobeyEt/zoMB9OzJoEjCzl3xkTdQNTbC7KIWJQt4h1+7hlkqJuxqXGFXvfZ1QONZbUycBMPc4IZbFqsSH6VEZK3rac597pJXI0qiksi3Vrv8UbbqUScnaeCu150gEmm2pNyfmCVcSQctJ9B7U3hkdsO86Ka+0+EWachMLxm9bNrbYy1TBk12vSKH1MZUhuuLESODmvLZTrUtvGY/wfoQy8ugu1+8O2qUIXto2BAtjCrVcKUNQDSXR0cgNNnlZJgu2Va/QglZuwX/zYOHaGEVD2SiysXbMljuTQQ5R9XH/gNo2QmLVtJKBpEHKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZtc3A/1+XU779WCc/25vqVFq8l9gEmxpBjAGWbf+qA=;
 b=AJsYiRZZhdWuUTWB7tJ31F7tb6eMWWyvs6N9CcNk/bmNDIL/HM+y2ovzCXpf9SbUeJwTnH6fT3KtHVjianTTyxNnsrYR/tJ1fefq5UKrn/pTVfG2kz6FBPqZz1nYjaSD4FuedwgTUAegVsmApLPiALqajUrEG+NSVHpjTCnX3kN/IxxPHUY/cbyt+7/4m+w1eDuYqQqWuoszCzTTlc+mFdTclM08nV4ndEzu2hYa9eiAjjUqCeUWfUk9hZDMyuFYkpCBn6qJfKubwv+SSysN2/qyzB3NJNN3gp3hSmJaNeFXXnL2Izp8kNw0+26+dJ7G1rN+f0ITksb4EsP0b1WULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZtc3A/1+XU779WCc/25vqVFq8l9gEmxpBjAGWbf+qA=;
 b=slrZJjc/gBsc7BXsnD1q1qy9kyt9NgKqmmIvbh7gwjlAEZ0E4s9kZ7jKFTSRaNirQn4r7CwkRYJ53olCoYsdYsl8pYwLTFClL8iVsxoJP2Cc4TBn5uMEt3cKcYEyW6bC/3bcsImoKPwAwLWW+TVftUwrr31XGQzkTSIPvRaRsTheeuBU++MTmbmegUmkIBO19RRq/y7lw/dCOiq1KGgrKsUsOO6m7r+0D0Qi9RcwkILXEEboJVDk8DbubvOqSTjIBdnJf0gJ/H57cpC8b8SMUdLGjVac9maUBTXl7swF0XKc7tuLaNQGXsrb7dvLMW4+TwwpAnOUuhOk4DsFhoIIYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by DM4PR12MB6422.namprd12.prod.outlook.com (2603:10b6:8:b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 15:58:46 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%7]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 15:58:46 +0000
Message-ID: <bad01da7-5e25-492b-a476-5fb4cfc13718@nvidia.com>
Date: Fri, 25 Jul 2025 21:28:32 +0530
User-Agent: Mozilla Thunderbird
From: Shubhi Garg <shgarg@nvidia.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
To: Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Shubhi Garg <shgarg@nvidia.com>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
 <20250723130343.2861866-2-shgarg@nvidia.com>
 <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
 <2c59e665-6415-460b-8ff8-c06f8d94f9eb@nvidia.com>
 <f69a76c5-157d-4cb4-bf46-1acdb6a87319@kernel.org>
 <0d70270e-2290-47f4-87d1-9a11019fa169@nvidia.com>
Content-Language: en-US
In-Reply-To: <0d70270e-2290-47f4-87d1-9a11019fa169@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|DM4PR12MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a429df9-ded8-4b89-345f-08ddcb9420c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1pFSXNtQjFXWlhPTUVhSWdwVWlhb0FMSFBGVUpIaFRCbTdNWmdSMVFzNGox?=
 =?utf-8?B?elY2ZU53c1lrWGc3ZVdzQytrN3lmL0tBYkpUUkc2UkFwU1JDWlJXWnRQUmQz?=
 =?utf-8?B?dnFUcW9EZXlFTDl1b2lKbmx1aWRZcEhyK01TWCt6bzZ1akNjdzJkemRrcll6?=
 =?utf-8?B?SVZON3Y1enhpSWxmRUZrTFVQajQ0NEhyWC9RR29HVTdJN2ExblZmSlhTYzRi?=
 =?utf-8?B?cmZFeDg0Uk5aeFhyZFNxVEFqeGlqcTU2QWVSTFZOdkhBeEViZUtjRVorVHBK?=
 =?utf-8?B?WjdSZ0FLc2gwYTJSOUxtTVJ4bHV6eDRyMW01aVI2YUtkbkVkamd5VEpEeXdn?=
 =?utf-8?B?a3F0d3d2anVTZHV0YkFNaGFrUHVEaEdITlMycnZnL1FoWVp1N2dkS2Y3bi85?=
 =?utf-8?B?RE42dGRqaDFuM2gyTmJhVGdtdXNsYitmamJOenlSVURRVFI4RDZvV0g2Yy9X?=
 =?utf-8?B?SE9BMUZxbG9Xc2NOMG9OYTAyODJMM2l0amc4a0FteGc0NTF4Q21FVnNPblhl?=
 =?utf-8?B?MFpBemViT2RXRlJrL2R6RXRja3ZjSlVnV01Ob0xEaGExSU5EenZtRWRNaDRS?=
 =?utf-8?B?b3YyQzVHLzhqUTd5dS9FS3dNWDhKUWdyM2xpUGNidlR1aFNPdFAwbEh4Qi9Y?=
 =?utf-8?B?d3hjN1JNV250ZXVaS1FWbWRabjdtamZMbjNnUy9OTGpoSExncmpaUm8wVVM2?=
 =?utf-8?B?ODNBQkdZcklLOFBvRjBhZUkvVWhEM3p4alJ0OWJuS3pQMk0yazk5MkM5amgv?=
 =?utf-8?B?SGEzTHVZd0pkK0FGRStKQzI0eUdvUXl3RHkzNVVEL0NtT1R6MlF2a2NMUFV1?=
 =?utf-8?B?eEJqZzFpOW9KYnlZbTRXWExTd0g2MmdOb0xNR2dYWVg5dzRWaEE0UGhOMkVF?=
 =?utf-8?B?WDBENmhGbXBBWWx3eXEyd2lpd1k0M3dtSEVhNndHZjRTM2JEMi9helgzUlc1?=
 =?utf-8?B?Rk94VENLNU0rZHpEU2FlK2U0L0w0OGYyWjVvNm5rdlFpOS9FK0VmdEpWdWRS?=
 =?utf-8?B?UU9BWjN4R2FzZE9VSFQ2VDNZYms3bmMyVWE3bXhhV0twMmx6L2ZYWURuVjI1?=
 =?utf-8?B?MXcxT2JYZVZKRkxuRXdFSWpqL0dWbHdtLzBIZHBhVDR3QWtqWjRLRWdnbTRM?=
 =?utf-8?B?ZlNoaC92MFpyN1NocmozYTYvcm1yN0VQN0pJR20yR0M0ZE9HMFhTUW5Wd3RX?=
 =?utf-8?B?dmI0cmQ2OUhxeklmZnhpVnhwRmFiYVNkOXBkK2R6Q0JxYjU5VVduVWNyYkVH?=
 =?utf-8?B?Q0ozcHg2blJtY2ViaS90WVRneHlvelgrRjBDQ2hkLzkyeStDWncxTDNWa0x0?=
 =?utf-8?B?ZEI5SzJOdDJvZnpxUllpVllVMHJaV2twSTNtRmxURDh0YThFZ2p3U0NqT2NY?=
 =?utf-8?B?YjF3dE5ENkNvSVhxT243aHpFRFc0d0duZUJEbitoMXlpWHFHTkordng5NmdE?=
 =?utf-8?B?Tlk4ekVBTnByQnphSmRNeTBHUm9DR1JxbUs1RzhTS0ZkZEEyWmxya2tITUdv?=
 =?utf-8?B?dFNZaVRzUjBRZXhmOEZBOEJieUF6TW1QSmNsWk5MYmRXZVFqZm0yblBhUm5m?=
 =?utf-8?B?RGJubHNyM1BVUU5LQnVXVHQ5NGlNMC9DZkdNczVrQzlTMVJRRFhWRG5FS2VC?=
 =?utf-8?B?UkY4WC91ckpUS2tWOUxvTFV1VFNRSSt3RHErY0trTXRzUko4Z2VCamZKa0p0?=
 =?utf-8?B?MEVkMXE1enBoa0c5c3RpNlJublBBbHJWSWpqUVVHd0gzdWU4WXMrcCtodU1M?=
 =?utf-8?B?MGphbXVXUXJoZFRMYXVNL3JLemVhZis1bEVkWlpIQ0h3M2VnMTlXWVZCTTEr?=
 =?utf-8?B?VVJCRVpEcEJ0S0FYU0lnWGdyRDBveWJxcGQzMTJZWncxZlc0ZDBFY3BUdlY3?=
 =?utf-8?B?L3h4SC9wRnlBYmlscFppbEVOTFU1MXpxVlAvcjlLQVFLeXNMVGVKWkZhUmVH?=
 =?utf-8?Q?okSazaeJNjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K29NdWJLWHN2TTlGa3dSWDZDYWhjN3hNcDRqYUpZQVN5TUVqcmsyNHZDdGYv?=
 =?utf-8?B?d2xrVTlPRE9YUVY3Lzd2VkhTUUROZm5YajN5SXErWDJMRDZ6NHQ1QUNxcGFT?=
 =?utf-8?B?UE55Wi91Z0JQNkFPYTdKam05bHVzT0ZEK2RsZTdKV28zY1lEVTd2L1N0emgw?=
 =?utf-8?B?Z0NyRjFTSzllSFE1NGR3VWxWd1J6My9xdW4rd2RiQkxWdVBZQ1VxN3lDS2FU?=
 =?utf-8?B?ZEhPbllKSUtsQ0ozSDJ4UlgzZHhqNE9UTVFWdlBneFRTdGJDcXp1VW9NUmc4?=
 =?utf-8?B?WWtWNGh3Vnc1Unc4dkU0bGVhdm5qeEVjY0VlelZvK0hqVUNUendjTFVaZGRN?=
 =?utf-8?B?WGc5enM0WEdRZEtScmtZbHlNT0hvUTBiV1FINXp6a3JjUXRCOURHS09ZbzhX?=
 =?utf-8?B?OFFLM3JrNW1mYXUrZWpHSy9FeEh1NTYvNGIzUGNZOUQ2cGtSRGVJVy9RWnh3?=
 =?utf-8?B?MGkxNzNhdjZYN0c1ZE9PZ3pTNStFWUxLUmYyd2pEY0tTNkFLUWhZTEl2MDlp?=
 =?utf-8?B?YkxudzZnNEpuV1h4ZjF3bDNXTkxBWFRKTDVIZUpXQkZkcFdVZzFJRmh1cDlJ?=
 =?utf-8?B?Ujk0eHRFZnRGL0pDQWY2Y0lFTE5wS2JsdlZ1aEFDdm1CV3J4SEQrWHdtL1or?=
 =?utf-8?B?WlE4c3lkeVZtbzBjVGVKM01jTytjdzgwOXBWYTNFRlhGV0dERTJQa1R6bStE?=
 =?utf-8?B?Sm9MVTBxOE5JSzduRUVWYkRPc3lVTi9UcTlqNWZjOW1UeXhLUUVBekFPR3ZR?=
 =?utf-8?B?SWRjMzBoTTVJVUhHb2czZnZBN1I5M3p2bW5BWVVDelcrbTlCeC9MUkw3bXQ5?=
 =?utf-8?B?Q3hvbmFZS2FzWlJDaHdjT1JzMkdnQVlOWmd2ZVp2NzBQaVNJTk1oQlUzNUJE?=
 =?utf-8?B?UklBd3hZYmxDcFFlZzFDbmJkdnRFekxyRm1iL2N4eGozaVZkRDVtZTZ3NlNv?=
 =?utf-8?B?LzNxMGduRzJhbHh2Ym8xelo1WnNzU2hzeEdUTlVCRk1uV3Uvay8wWDlLVEtR?=
 =?utf-8?B?NzB0Zyt1RTU1dlVPZjAzU3R4K0RYcUFaNTZXSWcwaGV5dlZuZldFT2xIbG81?=
 =?utf-8?B?V2g1enRNdjNVQUJDeVM3NXNjMWJvcURWUURseHlWclR4L2ZOMDBHbzVuMGd3?=
 =?utf-8?B?bEN2dDFxbTBmbGQ0U0dZSGltL081UWQrN3RkSTBZTjRsRUJsYmNVekFUWk4r?=
 =?utf-8?B?Z1UzT3BIZ2ZHOVFLNjNvcDBtdHpoNmtOVmRBVUdNVVJKYTZ0UVQwTEFKSmtQ?=
 =?utf-8?B?VjBRWGtINkxLeUhrTFA1L01PbWhIS0w2SWdvNXJIdnhWc1lBVyt2UVJiUlpy?=
 =?utf-8?B?b2s5eURadlFRVStPeTQybmNzZnhHVEJWemFXaG41RUxWTi9jWFlyVUdYdUpN?=
 =?utf-8?B?cHE4ZFl2bFRsOTh3ME1tanJQcDhHU0FvTmd6Y21kMFQ1bFhFRGNQNXMyZTIy?=
 =?utf-8?B?UHVFMDVGYVZacjdSY3lPNDNuMGllaTBtTGNWMzNrUllYSHlYU2U5QUNBdUt3?=
 =?utf-8?B?MU9zbXhPV0VMYkV1Z2tNNSt3YVdmNGU1Z01UOGlYaHhKVWFSQkFYN1FSRFpU?=
 =?utf-8?B?YkYwd1dYY0R6UkUyZTFLNHpQNXNPSkQvOUtnVnNHQ2UxeWR5d2RIMzRoYitE?=
 =?utf-8?B?TlY2aURhalRiUFdLcy95VlZzOCtCdktTeVhiUEh0eTVDU0JVREdXM28wY3JO?=
 =?utf-8?B?S2JLMTdjbzNQL0xIR0RyYmJWV05hSm8zYXVRdzRsUVZWM0JqVVJ6ay9GYTZJ?=
 =?utf-8?B?TG05TG5SZHJ5TkZLQjFIQlZqR1dxeUcvRnJzZjNWbEQ4TGswRngwNHB4NTJ5?=
 =?utf-8?B?Q0cwRWFZUE9Jc0RlTWFTS0IzbTFZajlQNFdQNWUwaHNuOElLWXRxaUZvcVdQ?=
 =?utf-8?B?T3ZGUTV2NSt2UlBrM21vU3c2QUxkWXl0N3V5RUQvLzJTaS9ud2FXTk1zUngx?=
 =?utf-8?B?blVMdjVWYjhTcXZFc000Rm1xZ2xuV1pjRmIzRVhaczRQMEJwYWtrbnNTOEJh?=
 =?utf-8?B?U1Fya1FyOERtMXFXVThXMXlMZjQzYllxc1JZQUNJZm1USW81cWkrMHdVcVE1?=
 =?utf-8?B?cWkyVFdqWGNteHRzZTNYbHpDZUIxMFZsR2RBMUZwaVNYbkJHV3ZoRU9XQ0N6?=
 =?utf-8?Q?f402PDAts2SchBl7m1/1FH9Wt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a429df9-ded8-4b89-345f-08ddcb9420c3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:58:45.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCMPXHG/o+HqoX3gHJDk0+eyBhn/WPBMVBL6RR8dX/4At5nO0msSi6lzwh0qC61nIlCovXS66iekoiRNxgqLKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_085855_550979_20627318 
X-CRM114-Status: GOOD (  17.06  )
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



On 24/07/25 4:20 pm, Jon Hunter wrote:
> 
> On 24/07/2025 11:06, Krzysztof Kozlowski wrote:
>> On 24/07/2025 11:41, Jon Hunter wrote:
>>>
>>> On 24/07/2025 08:59, Krzysztof Kozlowski wrote:
>>>> On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
>>>>> +description:
>>>>> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz 
>>>>> RTC clock
>>>>> +  support with backup battery for system timing. It provides alarm 
>>>>> functionality
>>>>> +  to wake system from suspend and shutdown state. The device also 
>>>>> acts as an
>>>>> +  interrupt controller for managing interrupts from the VRS.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: nvidia,vrs10-rtc
>>>>
>>>> Nothing improved. You never replied to comments and then replaced one
>>>> redundant word into other redundant word.
>>>>
>>>> Respond to review or implement it fully, not partially.
>>>>
>>>> Or add COMPLETE bindings, not partial ones. See writing bindings doc.
>>>
>>> OK, right so the DT binding should describe the overall PMIC device,
>>> even though the driver needs to support the RTC.

VRS-10 is the device name. VRS-10 has an I2C interface and implements a 
power sequencer, RTC , 32kHZ clock output. From software perspective, we 
are handling VRS-10 interrupts and providing RTC driver support. I will 
add complete VRS-10 information in bindings.

>>
>> This is not a driver patch. This is patch for hardware. Sending
>> incomplete pieces of a device, without complete picture is really not
>> the right way. Knowing this is part of PMIC this should be rejected, but
>> how can we decide on that if contributor never tells us this is a part
>> of PMIC?
> 
> Yes I understand that this is not a driver patch and must describe the 
> hardware. It is a simple misunderstanding because it was rejected as an 
> MFD, but we should not have then made the DT look like only a RTC 
> device. This is a mistake on our side and we will fix.
> 

I acknowledge, will improve bindings by describing VRS-10 hardware for 
clear understanding.

-- 
Regards,
Shubhi



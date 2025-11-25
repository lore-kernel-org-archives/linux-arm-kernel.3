Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED040D0E6C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er2JLMAquwLF/kIiNcATKkxciofz6jxavdRtuIxnaOc=; b=KMtuKD31LR6JcwHzHeqjBFo0Bv
	bvLAJriiawLVk2GnD7EDb8lmtFKxjc7EpCZgkaTTKKgyLtqiHP85j+tbZUIqC/AltUu0fd0PdvQmN
	JrdoiOBfSiWaMj7K8eCKi767TiOP9QdvEZ2ijnIkjv64v9rFz6e5efv7obZX5J9MC1/IMANDHsRfQ
	jydV3kS1dR0cZAYz0UHgHHU3ncmf8Gv0Zi+V8AlBbVlUakm8dPLXpVT5c7iUN3pKTArSkg0L66jbr
	jw/BUalX7sXCcIxeiq+FKGsmYqEWWHLEWM6fuKg2dzQxvzWRZG+e2Ci06dMY/3TElMoSsDVqmCxe9
	ivTK8M6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrRh-0000000DEUc-0aPX;
	Tue, 25 Nov 2025 11:42:57 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrRY-0000000DEU7-1cOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 11:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbYYukhHHcL4BQUMpADF0j/VaYu6ZGvXggWJBfGF+q2aRB1x0tpGeCu3MFym02lAkl04aQgvH7n7nZwwwZuQaVhOQrr5AEKSeDqhf1bEhS1E3D9AGZefBzc6Rl6l/NMTeKk//K+1GTVh58loHlbL9GmbSjef4EupMUj2Nm4conO840ikmAeDvSW+qIgUPMXglQKULTTWhM82Fw80/AlwnUCQuRVJlGUSioJG/dhSxx8y4lsHu2A199RIaM883BIBI0rc6kFmwbx8ct7b2B3re/CchylvgeZZKDU5gg2i7+abGbcSsjre+Gs07sJ7SzG2Nc8A36LfR/VQ0KqOfmYDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er2JLMAquwLF/kIiNcATKkxciofz6jxavdRtuIxnaOc=;
 b=omaY4VcRaxJQ96Pc8BTlKNm1wN3IC935O8aU17Il3VnzuvrMmKMsvJF98eZYwZJJcXKzCzMy58fr1oRZbOyQuOSWEUEifhWRsOlsZkhDjpCE2txSUe2oGRVqI/5LyyOp7tu6Hzd23siuRFOWdupeYQKZuAzWiHhCFHAePHoqvaVWIJzxkCozXMGP8SF+JmpKlJCMQUGn9lIDOUgILuocZbESkXHH8+kp1ZZio9fTzf3qvu8yaVmQdo/dMi4yeqv5+PBJYWYTBxMrl0DuX/sSL+XcI19hp1Za0U8pHYaGvInOv+wLzqik07uWmLM+zdbUvjDPt02OJB+hBkt/KKZzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er2JLMAquwLF/kIiNcATKkxciofz6jxavdRtuIxnaOc=;
 b=aP8Ib48bdemHj2gal1XIBXhAcZofKDQqXphHMPXacmro12xH1ahdBos0SKIuRT6JIIpEhha3XSL2BIvwmVwxYMRvmiHzsO7TmQOwPsQCA+DCqgGr+rnFudsynX5ZnjmiGwmo4VlqEfY5Iwf6W55dbKYc++sIgLwVK2AwpxBrAVx6tvEU3sASOvtJP3TjzNGV5k9tiXY30OO32dIuMQaq21kr/uv5L56k4gqWJpZHCW+GWKBNaRyA5gPG5h0aNFww8KOPzh9DjNUIPah58U+gVgEiJCTSwXOM/w0p4wnZ91PuAIgQDAIV8mtf7ENckdK88lZUQ0wMgXxugeUkMpgjVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by GVXPR06MB8922.eurprd06.prod.outlook.com (2603:10a6:150:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 11:42:42 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:42:42 +0000
Message-ID: <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
Date: Tue, 25 Nov 2025 13:42:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
Content-Language: en-US
From: Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00014AEF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::31d) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|GVXPR06MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bf2112-75dc-40b8-5d2b-08de2c17be25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnpGV29hcURKK0tDMEYrZ0VBTFBLMjIzenA1STRiN3VCWU1DaUNWbnc5dTNz?=
 =?utf-8?B?Qmo0NzVLUVZKcnltTDZXcGJxODBEcUMrTGZXaDlpckVSTE44MUw5TndZQ1gr?=
 =?utf-8?B?bDRXM3pHK1NDd2R2R3NLa01ESW0xK3B5RHkrMGE1YWR3ZkQxSVkxdzZkb1c4?=
 =?utf-8?B?VEI2c0MwVEFubzBrQTNOVU9wSFFjMTdzTjQzT1lCK0dVbC9TcXdqNkJNck5n?=
 =?utf-8?B?YTdzNXNGVmhXTkJ4cjI0Q1pmcHJFZjlYUFIrQmkzTzhMTkpDM0VnTy9IdXRR?=
 =?utf-8?B?RWptMTBPaks1dVhZQ1Nlcmc4V3pSckpDdURKZ1JrTHAyNjlLNDNOZkNqZy9t?=
 =?utf-8?B?Z2VmKzRQSGdsdFZEVzg5QjRIbjgwOUl0WEVleUE3WEdoMEZtK3VweCtwYnZW?=
 =?utf-8?B?Y05BZDBVQTVkUytad054WldkakZiQnplU3lFMUw4Tm53SFRLSVdNNkpsTG9S?=
 =?utf-8?B?andlRUNIMGlnblQwQUd4eFFVM0JrM3pVbWdvTmZ1Y0FreVN3alZDL0FIRlZP?=
 =?utf-8?B?NjQ2UHoxbGhaeWpNREZSM0pSMTI5RmJNWTBRdU5zQU4xTjAvb1BBZkN0cHky?=
 =?utf-8?B?Ny9Ba0krMlJZN2d6MnZySFJwL2pWcVdsdkxicVBVK1c0ZDJESlp2REZZcmRj?=
 =?utf-8?B?TmpOdW1hcTk2WklLNzZTVUJ4SU9Fb1J5S1BEWHVDakp1aGJyZURqSFZYSW1K?=
 =?utf-8?B?Sm4vc213SHEwdktWSlZjeGN6bUFOUS8xUm1zU3FFNVk2S29qdXpWcGU0eXJO?=
 =?utf-8?B?UnpyYUtPR3BNS2k4M004TEJPNHVBNzh6TXJSOU9TYy9EeVNKb0VCTXFyOG5P?=
 =?utf-8?B?ajNrTzNNdnU3MkQ5djcyK0ZmNXhNcHI3SDVjMVBUZGdWN2NrOGJBUHhTUDdP?=
 =?utf-8?B?eWVLL0VkNTJyMDJpZXF4SUwwTWN3K3ZvOHE3SUd4U3g0cWU0SElPcUIvVXNu?=
 =?utf-8?B?K0htb1FIRUVvckN4TlFZZlFMbWlPbG5TL1g0cll1S2FuQkpySnZDK0RrYllH?=
 =?utf-8?B?N2FoeXBPbFdmK1dDK1NQL1RENUZxWkt1UnIxY1VSNUxwQ3hIdGZ6QWcxQjRv?=
 =?utf-8?B?NWlIU3ZoR2ZZN1dreFFRbkV2RFpMUmQzdTJRWDlQT0dBRUdVN3c0ZzMvR3lK?=
 =?utf-8?B?bGFrQVpmSG8wbEtKcDE4SHl3S0IwU2FLN2xLUUpBaVZ2Mlo0SU9BQ2R6UVRp?=
 =?utf-8?B?MzZnK3ZTV1Vyei9DUDVTcFc1Q0VVU0xGZUxVYStFMjd2SG1vc3gwZUZ6d2pS?=
 =?utf-8?B?aUNWdDlublZYOGJpZ1Q0R0gyN0tNWjZvRmtPb3BCOGlQQWZnUGt6RzB5cGhj?=
 =?utf-8?B?alVHNzV2ZERGWnIyT0ZvdDE0UXVRSzdOSGVnMTBXSGJYc3BGeDE4cHUyaU9J?=
 =?utf-8?B?SVRJc25jWHRwc0xpM0dnNDBkWEdROU5yU3RDZ3RuOHJSaGJMSzR2cXdrakdi?=
 =?utf-8?B?di9kdmllNUw1elRyNUhqZklWZkdlelZrQnlJeUpwZXlqZVp0UFAzTGZ2N0tv?=
 =?utf-8?B?RWtxeHFaaDhkTHVlNEVzOTRKM21BUkh4R1V1THVEaEpHaXZKZ1p4S1cvMThY?=
 =?utf-8?B?Z29saGszZSs4bDhNRU1RaCtJZXdXejcvdmd6OTBkTUhtRXF3eU1RcSt5eG50?=
 =?utf-8?B?QzhabEx6akpmcVBraGNUSW9sbDVDU1loRUtxSTBTRUNkQW5rRFRTMk53TlhQ?=
 =?utf-8?B?TStadk43bnJxQXZmcDVWS2ExT3pEVVkraTZySFN0Y1NoOHZKL1d5UVdmSFdz?=
 =?utf-8?B?NTZhQmRjNjZFWVdCVnUyQlhtdDJwbEVZazJGcWZROUo2NEt1S3FqQkhoNnQx?=
 =?utf-8?B?R0tpSlJkTkdxbVRoUVVJSVZjQkNaT2dTcjQrYW5NdHlaTExJMHM1eUxvR2lS?=
 =?utf-8?B?cm5tVDI3OWg5QjlnaUt1aGJNNHFZZENxOU5HSlNvOHNVeURTU3lnZGZzaEdK?=
 =?utf-8?Q?pGyCG736oe60YJ/UQ0r6t60pSpn5O00Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0R3QkpJMG9oYkl4L0thcFRneGhMKy95R1FWMkxLSWpYQ3N1L2tVYlhFRkQv?=
 =?utf-8?B?RGkyWG5kQlJiRW0rUWRvNDBybHlSU2xYWVVkcStGbWVvWVVLZGk1NG9pU2ZD?=
 =?utf-8?B?OVFqcTdQQ2paVlkwaVNuM05hOEJvRlN0MG41N000NC96c0Jqc1ZMZ1BjUkV4?=
 =?utf-8?B?T3J0TDVvZmp0SzcrL3puU0JRQ3JGQWZhL214dUlneG1OYThxdWJuSVM0YzFE?=
 =?utf-8?B?emdkSDYyUk93Nkg1N3Zib2wzQW5UL1pkMVJqbnliKzVaRE4xdm1EMFg4ek93?=
 =?utf-8?B?NEw4OEJYL0czdmR1ODM0VElvQjRzK1ZzWkRYNWtVVCtaZUZONi9uMmpLOFk2?=
 =?utf-8?B?UlJ6WW5LSGMrWUZ1KzNBTmFDTlN1RlJ1dml3cG1vRGxvMlpsQ1BubEdDalBv?=
 =?utf-8?B?Y0Zwb3daMDNNaHhCaXdSY3hVRUlwb0FwMi9hVFdjLzlYVUNTOHJMaStaNGpR?=
 =?utf-8?B?cElFUmlIWU9TOHhnZDcyUmdHcm9TanpxUHZIbzBUUmorclBqSmI5clcxd00r?=
 =?utf-8?B?ZzNtVWJGaFpneEFyQ1VHNTFoa2RQY2VBZGR6ZmdzYi9EcEZxV2dOK24weFI4?=
 =?utf-8?B?YnIvc3ZocUdjZDhGVmVHSkNSS3RPODV3cjF0VXhtTTVrbWwxN2p5U2x3a0FR?=
 =?utf-8?B?T3pYNm10OCtVNElZZlFPbHNsUVAzYUJvNVkvVkQwZ0k2ZkpRUFdoYWhxL0E1?=
 =?utf-8?B?Qkg1a0RnRVZ6K1pLclZaQy8wVjdTZUxaWmNjMGgyb0VialJPVTBFR2M4bXhW?=
 =?utf-8?B?bnJKQzR1YWJ4b29pbmF5MjR3cWxvRldRREhORUVCMzRJS2EyaDNPNmd3blRC?=
 =?utf-8?B?RWtwbFVCRmdMUjRUdE91em5uV3ZsLzgzcnZVYm1INFlOajhKdW0xRzJUTUhE?=
 =?utf-8?B?bkw2bEZwMkRDZWx0cm14ZzRUTUZsNnB3cUtWK0IxTmxWT0dMVDk4dW5xWkZ5?=
 =?utf-8?B?RzczWTFTTnl2OFBWdTMzWVVaUEp0eHVyVHRralZ1NzJ0dDZvbXA0R3VwNmF6?=
 =?utf-8?B?dEtObEJGL2RXWXpRUjdyN0ROdHF4clprNU93SHVGZU5CWVIvTTQ3a3VCZWww?=
 =?utf-8?B?c2I3VUtsZzh2Z3NyRG5mRnByaGM3L2p4QmprM2lIdGZ5Tk5ZQzBoUVladXR1?=
 =?utf-8?B?SXB2d2YyYVhSdmk1YmZoYUpXNnhBTjUyZ1gxZFBEUXcvWjJVenBYaHBLK0Ra?=
 =?utf-8?B?ZUZzYXFEYWZQdnlvQ1NNT3pnWWtodzMwekZiMEJVZnZIeTM1MGFlZXM5bWNY?=
 =?utf-8?B?Zy9rV2FOcGVFYjdJcjVFMTVOVzlVbTFWRWdObnYvZmxWamRTczYrTkt1NVpB?=
 =?utf-8?B?VnBsV0duajVlcmlCeDNmMENTOXBkWkwwQ3VsR2Ixa3ZmUEFmZFhBOUtTT2Yz?=
 =?utf-8?B?b0ViNVZpY0JnUDBzRXp0SWRRclN0RHRnYTIvZ2xmYThSRUhJKzdYd0szK2Iy?=
 =?utf-8?B?SVY4NjBOMkNMQm5IbnBiL3d5Qkdsa0JKNlJuZ1NmMitMSGF4MGxIbXlpaHlU?=
 =?utf-8?B?dHE0NEUvM1VZN2puL0c5dHByTktJT1VKbTcxQWRoYW50T0ZGWTFZYWN5anFu?=
 =?utf-8?B?enB2NnRFZ0hHY3FGTzE5ci80ODIzUU4vd2lhL0dkeDQ5SUpUS2NuN2tsdFZX?=
 =?utf-8?B?TkZPRThNOU80a1hFN1NFTURzSVJEaERNaURqa0dEVmJ2U0RvaEk3aTlsREhZ?=
 =?utf-8?B?KytwMVRNOE5CbW8rZndYN1BWMGV5NXBOYXQ5VnFqRjBWOE14ajd6Q0NwYk1j?=
 =?utf-8?B?Ymt0dzdBT2lXMEV6UEQ5UXErZWZEd3g1UjFyOVlqY29xWEh5Vjk2UXdSZmJo?=
 =?utf-8?B?VGFrTWdTM1F0QmZyMWFGbWlOOVY5b1EwSWhyaVZvM2JMcUNPNm5tK2JpUUVB?=
 =?utf-8?B?Wjcyb2J3dVdpT2FLcnNRbjRMSWxFZTJlZkhBR0NTekJVT1A5VHJGVEtONnFO?=
 =?utf-8?B?bFFlZU4vQ0RJTHRKaUdTcStMV2E2c0x5cVYyNGYwNzZjNnl5ZEx4dC9LdExW?=
 =?utf-8?B?TGR4ODUxZlU3aGVmamQrQk9yN3RHU0prQkZXT1RPdTNNaVhDQjNFd3F2Y0s1?=
 =?utf-8?B?VXVsN053cE84WEZCRzcwWm5yUHpFVG5FQ01UdTBnazl2RnByRWQ1OWp3c09O?=
 =?utf-8?B?V2cvWFRCQ0p0dmNzVHl6ejkwc3dmZzQ5TEFacFZvSFFZNjlwN080NlJzUzI3?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bf2112-75dc-40b8-5d2b-08de2c17be25
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:42:42.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LAv2wIwboFUiahwOMo9/FcH4+kOkGVMNIc7cIlzbGh8L8iJliCmQQnWeslFQZLb50QoHAUA0QUIkhfuyorSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_034250_401736_A233AF20 
X-CRM114-Status: GOOD (  16.83  )
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

Hi,

On 25/11/2025 12:30, Michal Simek wrote:
> 
> 
> On 11/25/25 08:53, Tomas Melin wrote:
>> This reverts commit 06d22ed6b6635b17551f386b50bb5aaff9b75fbe.
>>
>> OP-TEE logic in U-Boot automatically injects a reserved-memory
>> node along with optee firmware node to kernel device tree.
>> The injection logic is dependent on that there is no manually
>> defined optee node. Having the node in zynqmp.dtsi effectively
>> breaks OP-TEE's insertion of the reserved-memory node, causing
>> memory access violations during runtime.
>>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>> For further information about the U-Boot logic related
>> to this, see lib/optee/optee.c in U-Boot repository.
> 
> What's the behavior with EDK2?
Sorry, I cannot comment on that.

> 
> U-Boot also have optee driver. How is it probed when you remove this node?
This is about the injection of the nodes to the kernel device tree. So
in the U-Boot side, optee driver can be enabled or not. This passing of
the optee nodes will happen outside of optee driver context (image-fdt).
The OP-TEE logic will not insert the required reserved memory regions
into the kernel side devicetree in case the node is already present and
that is a real problem.
If this change eventually is mapped from kernel to U-Boot side, OP-TEE
needs to be enabled by boards that use OP-TEE from U-Boot. But that
sounds logical and how it was before, why would OP-TEE be automatically
enabled.

Thanks,
Tomas


> 
> Thanks,
> Michal
> 
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D63CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuxeGxYTFF52n7eZCHNX9K/nTA5nfZD3o8avOU0ranw=; b=qmT8lntOjhi4npX7DmiuoD0sSC
	hOV+8D5W0g2BP+6DR1OVTEytbAfUqzIZouhTHGQYrEBG3ZsH6F0v3Gk1i7d5nhAQRQBeUJ1XMJbW2
	z4gx4/S7y/Wuz4pZvw3Xv+ujx07FW8yhvglD8ZNjo3xm8TNOxvxhsXu7dNvO5b+JdLC/DFs0evzXK
	cAAp5HwkcxPe/WhnjbpNh+6B4QJENPr1PHmyG8yrac6Md/f2fXuvRfHIZJBZuc4zopMQPC0K1vZZC
	v0KX2ZepOWY+Xwoj/bonN2vy9uzo8AMVcW0V7e0oanoHls+QaWqUeCdOjZ37g4Rs/gKRQCXzNw/cv
	+JgH/9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJPU-0000000C8ov-3MIQ;
	Tue, 04 Nov 2025 15:57:29 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJPM-0000000C8o8-0bre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:57:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0K/g6tkZmzdzsH+viBtKPsGtyBc0r1S5VbRFTeRzjKZoWfuT8w91E/B1sZbf6ebUcIsZIPq/KIezDez17THcLSY5DPh2s50yZbEh3lX/87NFlkreypjbjJncf/D8pBPDHfCH/57Z3CUUZpX+GlfcQfUsjQCq584rn+Kr/TnTJQS/CmXSpQqbyehw/eIXXK0jk76V2kjAJFmMevBpkCYq5loqdayvkl4EMW0dRsTPnQBE0aizx4lSAZ20HSqcpJtvBTBDiL4D0Imk/K5Ap0CzOxDeXDj7ciY5OVdJ2x4bt0hP4Od8mNQ+1gaz237A0Ij8lUo9FTiO9RSZMSbC+5YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuxeGxYTFF52n7eZCHNX9K/nTA5nfZD3o8avOU0ranw=;
 b=ykEA2sWRwXQjWgHXR32V1/PXCfPJLw626VJMExZuWEAg054JAt7Hd+LgY+2Wz9WQEu/EQonTtYKE/1h42nb7YHf0saGo9py01vQdNHqo+EGiqKo3GhZ2sg/ousHE8sKMz7zQO9mcTbvIHSVQF335Z+h2R40le0a1a7TRmKgamEzw762nHYK408Egffxn1n2lhGu+/qtKmnX4y5ultj1IhElpfhtTnAU1wUTBZT7ucLijRSZBTTZgL0luqKS631tKCLDmHkNeotzx8/TW8sTiTsddrIhe9ZOrzfo5FPZrRFAkbKkZJcyryMJloERqj1QnPvE+BlSpIaNoCtHzZXFikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuxeGxYTFF52n7eZCHNX9K/nTA5nfZD3o8avOU0ranw=;
 b=DOUNaxXqVrV5ZGLYV1CRbe9b9Y967YSunnKIQTzH/+u+XYwZK1gevjJFgox/fbHuGnqReHRqFQ1ehyWJzehb1/b4nWN8MIPj1U/cpNTP0xUhc7Ib0BpFbpSR6tuss+ACrRfyiQyCVl/iTo+0/JBk7MzEAz0xExWylsUKwDwh0ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO1PR01MB7370.prod.exchangelabs.com (2603:10b6:303:159::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 15:57:15 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 15:57:15 +0000
Message-ID: <41f0768f-e90b-49cd-80d5-8ad7ea43aac0@os.amperecomputing.com>
Date: Tue, 4 Nov 2025 07:57:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kprobes: check the return value of
 set_memory_rox()
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251103194505.4077265-1-yang@os.amperecomputing.com>
 <878qgmaxmo.fsf@stealth>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <878qgmaxmo.fsf@stealth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:930:89::29) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO1PR01MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: af4f8a69-fb22-4670-501e-08de1bbad332
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0JIN1M2NlpKakF2UTZZMHI3VVZWaVY0VVBNSDhJUUU4UGN1WWZ5bi9qSkJ2?=
 =?utf-8?B?NkV2aG15dDByekpOdzIxOWJOcGpIQW04S0czM0RHa1NmMjVEVjY5Q1J2Rmhs?=
 =?utf-8?B?MzVTRjNSNjJjY3RyaStiZkFBU2IvMHNIVFdRR3ZrdElTb1pMb01KaTBsT0hz?=
 =?utf-8?B?ODJJTVAzQ3VBYityajlYQ0pvUzI4STR2TC9iRFE3d2tlVDFkUmxoSWtDdWM2?=
 =?utf-8?B?WUUvUW0rR3lsUGpWdlloMm1SZzU0amFzR3piNGVWakIyYnNXY0VWM3BveTFr?=
 =?utf-8?B?blBoNzhvYmtuVzdIdTNOTGtPUFVPbDFoNEg1NDNNSmhsRmtwZ2VJV3FETzcw?=
 =?utf-8?B?OVlzT3hPZWlDaU8yaTljbHNGN2RySW51SU9XY1VQdVlRZmtYZXJjT0Nrd01y?=
 =?utf-8?B?QjBxNFVXNWliSE1DejllUEZ5bGJXTVpCRklXbmNhRzRMRkQxcjhTRndoTDdC?=
 =?utf-8?B?MHYwbkRob00wQ2hyV3loOTc2NUJZU0ZxL3YvWkozNTY5b1I5TXN3clJtR3Vj?=
 =?utf-8?B?MDVlQUs4Nkt3N1dpMmNzMmRYL2NqZGlpd0hud0FJc2RySlJUUUQ2THI0NVRk?=
 =?utf-8?B?aDE3VEVWbURPVEpNZWppQnJGTW9pSmwwMVBoQlpyWWo3cXFpdTNEbkF5cGVM?=
 =?utf-8?B?R3REUjJDNzlJNGZsT3VaNWxrN1prV1hORC9hQmtad2haMTQzUEdHcmRHWUVL?=
 =?utf-8?B?V05uS1F3djZBMWIzVHROdVpLb1REaG1IK3pzUWhvd3ZZTjRrQ3oyMWVoNzk3?=
 =?utf-8?B?NFpRVDVCWUxGSDlOZG5ZM1Z6N2huWUhIY1JBNXlmdGcrUDBsUmFNWW1CNUtz?=
 =?utf-8?B?SjZsQVdOMFo2aVcrS09SL2RVeHY4UHI2eDdlaWhnWVJuQzBsWVpUQ1RaWE5i?=
 =?utf-8?B?M2pmbWF4Vzk3bVB4clV3dWNUZ3hONXhVR01zR2lUQ3dpK0FqYkpYYlNzWmFC?=
 =?utf-8?B?N1RDSUdJVGZZK0tjRStDcFJWVkdKc013dHRuMDRMdzhIdllTTnVlMHFVOUhw?=
 =?utf-8?B?MTYxdG8vb3l0ZHZCZnoyLzZKclFWMDhHZXlWbDZ2ajBRWndFUzZCVGQyK3Z6?=
 =?utf-8?B?YnhYcmNjbVdjTnhhWGhGWWs4OEtCdi9GUlVhS2RNRFNORmVwd0NjbTNYSTQ5?=
 =?utf-8?B?QmRybkRVUDltZFFVaUVBYVlVTE1WS2c0STFyR0xxaXJENXI1cFlTMkZ5MFlO?=
 =?utf-8?B?WkJjTndPS2syWW90SEdWUlhyOVRaZEFjRDd3M1dBcXJ0bFhnTC9sU0drMG9Y?=
 =?utf-8?B?U3pPVENncjJkVisreHY1MFBpUFRSdFpKVGN1WjlaNmVzYlgxSVNuRjBRelU5?=
 =?utf-8?B?bW9xZDVzK2dSSVFaVFU5cFhlMWl2dnVNSXBXSzYva25UODBkNXlobWd6SWxV?=
 =?utf-8?B?ZEl5ZzNLaHBHaUtDUHNpUHZLYm9QS1ArVFVYYlpuZGNDMUlEKzNlYTJKNFJM?=
 =?utf-8?B?Y3VPK3lpT3B4YmZGaXVmVkdpV3dhZkZyTTArK0JWc1pqOEZCWlNERklVWk05?=
 =?utf-8?B?N0F3dzFTNlRQdUsrTElVRkdZV3lHVHpnUk0ydmZUYW5OVDVJWFdHajF0WHlu?=
 =?utf-8?B?ZlUxUzljbitnSk83ZUVCR0YxQjZBWHF3V292bTBUdy9iVkh0d3Fna0pIRGlW?=
 =?utf-8?B?cUkyYU4rbjRzSEc5RnF2eUFKUFpZSk1uUXlCc1VNdDhtTFRGbmRqNUJVTElr?=
 =?utf-8?B?Y2VzZ1h0em5tS1NPOGthNzVMQVJEYU9XczZZdTd6dFhWUTdUMHhnVFFZbS9U?=
 =?utf-8?B?aG1jVHFqRUl0aHhsVWw5c05rUzZwYVlGQWd0b2RCTjVkSXovNUhHYzNvM2RF?=
 =?utf-8?B?U1h6NmwzakwvWUwxMHRudEMxWVF2alkwVHNkUFJVWXhMRUtub3RaK3hpcWpz?=
 =?utf-8?B?N3VuWFc5c3l2OXVGb1Z3NVhnM3IvOFlQRkt2UkRNZVBUT0JUVXVzWUg4RVRn?=
 =?utf-8?Q?gbEywT/qdkAo8IZ2vJPMhy+0sRwdPswA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNUU2Ryc2NxN09CSWdYazhIelJzU1c0ekljblUyNTZmVjFmaWpDMjZZUlNB?=
 =?utf-8?B?emZvS3ZxQkdhTE1pM1VHdEVUTitIdjVHQVRhK3M5SG9UaUZOeXpWYmt4djRJ?=
 =?utf-8?B?M21XNEUzTUxOU2ZoMXRmODBDVnkxZDVuQTJCaGF3YWoyTlJUbHNVSVgvY0M0?=
 =?utf-8?B?WjFjRXgvcGt5ajhhSjlJcTN5eWRNMHVWK1NqUjF6NExZTUlLN0NZaEFYT0Ny?=
 =?utf-8?B?cGp2SVEzTklsT1VuZVRyR0VWQXlDRTZBbDY4cGJiQXRlcUxJdUJuRlR3WDhU?=
 =?utf-8?B?SXR5WkppYVh0VjBDZzkxRVp5Y1JEZFRZbGtudDY4NXlremVJU0hONnBCc2h5?=
 =?utf-8?B?cnpiUGNCSXpkSFFSVWp2bHlmNlduQ3hRdldKL3BCaE1zWC9pYysrcXBydXB5?=
 =?utf-8?B?eTlqZ0dUNlFoMk5JcjNETjZHcHI0Rlp2d2lQRFNjeTZEOHdvSWxxQUlEcmdZ?=
 =?utf-8?B?cGJZY1pzUENVT0tIWHEvNzc0bUI2WnVGcHd5aDFGQTlTbldUYjlKVUxJUVJV?=
 =?utf-8?B?d2xxZWVQMDRCMVppSFFEM3FKWER4SHlxT1JaS0g2UkxUejZaVURTTzVyK0hZ?=
 =?utf-8?B?Vzl3RFZGaUZyVU9zRFF5eno5cTUrS056WUVNQ2xucHJZQVJnaWFBY2I0OG9V?=
 =?utf-8?B?aE03OFNoM0h5NkJweHVpaU8wQjQ0TFRtZ3lucjNoOVZVQkRPNDREOFJ0UkJm?=
 =?utf-8?B?eFJ0MGEwbjIzckc4dnAzbk55SDVHWFRIWWhLRjhDUWFPMTdmQmwxUXhmNWV4?=
 =?utf-8?B?QUNCaWc3RVF5N3RsUVdZWlpxb3BZaEd1aWNWYXRtMFBsQ3dTL25tZWlpTEhL?=
 =?utf-8?B?UGtiM0c4aTlOWEdxVmwvbWJBZkpwZkVTSFNCVXQraTlUcys2bGZJd1RFbHRw?=
 =?utf-8?B?R0ZhQkFOM2FDWGQwcVhYeHdnak41NXR3T25TK0dabUJOZ1JFdmsrRjhrMENu?=
 =?utf-8?B?R2Z0Zml5RG9FM0crVHk1UXZENWNILzRiejFqSDdHMnJiZXFDWnlXZ2JlaHBq?=
 =?utf-8?B?SVUvT1NjY2d4MkNiSmRvUXV3R0l5Sk1sa3huaXFjeHVVQmFiTE1mYTd1S08v?=
 =?utf-8?B?VUM4TjIwSWJTcWdWcDJzK0tSeStKNVp5MWo0dzBSUlVxTCtvSTdQNFlkYTJR?=
 =?utf-8?B?VEdFYlN2S045c000VHJUdnBJanJBZXBUb1pJWFR2aTB3YTRLL3UyV3I3MmxX?=
 =?utf-8?B?OWpIL3FUcXpEU0xFTlM2bHJ6a0QzMHFoZW1pZ3JCL0pSR1NISCtaNW0vSW1G?=
 =?utf-8?B?MnpUcDZmZTIwV1RwQjZHZDVWZEp1bDQ4emJFbjBaaVZqSFp2MUtFWG8rWHNv?=
 =?utf-8?B?MGxvT0lMdUxkRDdLajJqd3doeEwzWGw5azQwcWVvWC9tRXM3d2hsY3ZtQlZY?=
 =?utf-8?B?YkIrMTRQUGhPWGxKOGhBUDl1MlA4WXEvMWZERFllNitJaC9pcXlYK0IrSEc2?=
 =?utf-8?B?QWNhb3NLWWdwUUE1Z0UrdUdJM1ZKR2lWSkNvSXZJTzdudjdkcEVaOHpyWUFv?=
 =?utf-8?B?NXBSY2ZmOG5YWEY5dkNyc01kYkE2dnVmZUprd0hDWFpwSnh2bktuN2huSlJS?=
 =?utf-8?B?QzZVeEttM1NIdHFaYTlyUHBrZXN4Mnkvb1JPaXpCdmEwQlZLeGdQWWk0cFRs?=
 =?utf-8?B?Z3h6cmo0ZVNUZW4wYVg4alBBalFIa0xzSHErb1A1cE1rRmdPSm9pVFd6bUZn?=
 =?utf-8?B?NEVkSENpY2h6Qk82MHEzTm5LVXJSTktZcXIxM2lRRFA0ZG9jZ1owVlZUYTZO?=
 =?utf-8?B?OTQ0eGpMSVMrb05CcURubVk4UktKNmxEZjg2MUxDN1ZPU2hNemRiQUJhZ2VW?=
 =?utf-8?B?M2EzVUNuc2hzamRZOEFEemUydkQ3eTZUZnprbHRsY2p4cldkVUR5S3hPMkZG?=
 =?utf-8?B?V1Z3dGRtUVhBb1JhdStqN2tsQ0JJMUxWenlZSXZuam9FWWNjd21kSnZKTXBs?=
 =?utf-8?B?TTIySzlJcng4bmFLYjc2TVZ1WGJabFBuVlRUejN2dUhkUzExV0JMUTdxbzQ3?=
 =?utf-8?B?ZkN0MUZWUkN3eDRyb3FWK2lwWWl4Rm1lcjhUTHVSUUxpNWdjSTBHMDE2ZitR?=
 =?utf-8?B?a21UMTA3dXlWZTlONnNGajVXMThEZ2V6ZklZRUVHR2dBNUtxSDVLdUlsUElD?=
 =?utf-8?B?R1dWaGh1ZzBWT3BqVVpqVlU1ZFROZE5KcW5zdEVDN3pqOEZqS3hUSFpUUnlm?=
 =?utf-8?Q?r9/Pl2YGdOj7OZulqTtT6XM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4f8a69-fb22-4670-501e-08de1bbad332
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:57:15.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJKdPeWXXvmn3UDQkILtDouWGJFHFt9ppqaKRsbyNWD+v9H/Rb/sL7EiXd2S3FJ734OSxPX9K3dlHyEjlXNPw9HkOSttgRbMZ3eUZV5s/NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB7370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_075722_886987_081AE2B8 
X-CRM114-Status: GOOD (  18.61  )
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



On 11/4/25 2:41 AM, Punit Agrawal wrote:
> Noticed a typo in the commit log while catching up with the rodata BBM
> optimizations.
>
> Yang Shi <yang@os.amperecomputing.com> writes:
>
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), __change_memory_common has more chance to fail due to
>> memory allocation fialure when splitting page table. So check the return
> Typo:               failure

Thank you for catching this. Will fix in v2.

Yang

>                    
>
>> value of set_memory_rox(), then bail out if it fails otherwise we may have
>> RW memory mapping for kprobes insn page.
>>
>> Fixes: 195a1b7d8388 ("arm64: kprobes: call set_memory_rox() for kprobe page")
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> I actually epxected 195a1b7d8388 ("arm64: kprobes: call set_memory_rox()
>> for kprobe page") can be merged in 6.17-rcX, so I just restored it to
>> before commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in
>> alloc_insn_page"), however it turned out to be merged in 6.18-rc1 and it
>> is after commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"). So I made the fix tag point to it.
>> And I don't think we need to backport this patch to pre-6.18.
>>
>>   arch/arm64/kernel/probes/kprobes.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
>> index 8ab6104a4883..43a0361a8bf0 100644
>> --- a/arch/arm64/kernel/probes/kprobes.c
>> +++ b/arch/arm64/kernel/probes/kprobes.c
>> @@ -49,7 +49,10 @@ void *alloc_insn_page(void)
>>   	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>>   	if (!addr)
>>   		return NULL;
>> -	set_memory_rox((unsigned long)addr, 1);
>> +	if (set_memory_rox((unsigned long)addr, 1)) {
>> +		execmem_free(addr);
>> +		return NULL;
>> +	}
>>   	return addr;
>>   }



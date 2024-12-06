Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDjg3mRzndK17H44mV4G8Izq05u9HQOXiD7heHkuHsQ=; b=zIyFBYzKRI4atMx+56+2JMs18M
	goTOYQJOeAPbiGDrHg+/bXpvfiFsuo46zDb8HJO+NnD0zNsc8CN8MvcEN/ejmmxjTwE6c2BczX6RG
	TmvCMLc/nzU4fIElb0bRjSgIorvLMnkQJs8SFYlNzhIjS6aqiDXjf9YzJ+r0FngOWJ8ee5CLljrRJ
	ukSSJncTTHMIlgjoqZtB5olQeU+oTae1FaBM/cNzwp3coM5z4SgmJL2w0MHR6yfTEx8FWdWYyFeUZ
	R93pnorRKqV2C77vhL0dsbOmJZm9F2sIvbn2tmVKRsSevIlUyVSUiOL19k25PSDKxC8S/8mIBcvRr
	GS1+xeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRd4-00000000gxV-3ETx;
	Fri, 06 Dec 2024 06:15:54 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRc3-00000000goC-07IC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 06:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8px0ZtZIH47vGswDRg0VB3eMDUW6Mhhtb7f9lONrmKRuGeWVVf1nrf/Rmq21dSx23S8j9tjsXFECt3+DovQZGojbAk1XUMAndwjW7sumQ4Ry6mdWHqeXvTd1OPkGLsG8BOkoZIa7m2vpggiwKYZePfkRKcowlNIhjtZOSSsDdQWCPLFSOBClOIBMy7e5mJGXY/zuZWOTlRQQweaHYlQlSL9LLSPV11cBXPWfz4EO280tKRrDnVWW9zQWK0LAurRBRa/U6Y/FvTBur3ax+4ZEQyRcicT81YPAJfZkwCTfU9mqFS/2ER1QsZgGbFSkB/pJVzPw4F2zVFfqEeilz7FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDjg3mRzndK17H44mV4G8Izq05u9HQOXiD7heHkuHsQ=;
 b=NYvtQ+nhkeErBmca6CJXuagAirAJQQzPvNDDESwsz7t2EPVNRONqTpI9tMiB9rCZDDGnNrUZfIchVtJO6VFae7fPHIv7ouiG/CVPlhKtY1qwQVMka1sTnxNdq9Q41jboes5Emr24WcseoV2NVAilOvxT9dbmrQjmiva4r4x4yo7h7vc7O3rl0cJ/XHkgg1e4rdpasrEByYyJSUhLNxwm3i9RIXAJiL1Fex/haLokt6SEe2+LxkhK/9FovZgHGYtf0kB4X2kdrMfiDhxX82swI8zCyEX+HCbMUh1TAfNuxHgUeg+N4SnSqlBM+atHLKml0dLE4O/Uh+uk5iD7A09h/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDjg3mRzndK17H44mV4G8Izq05u9HQOXiD7heHkuHsQ=;
 b=ARN6bKZvpghBfHpZhr3JKbxkGeGr/MYxLylH50FpXmNPfVtUBW7qOL7Fmd9oK7XkWivi5nUj2zVp79kcDP0ShJAtmF3+qX8oGK8IJleflrC4iBnRBj6K3GJuipAS4g6XZFrnG6fHjJvkNXfkpM3KGMYyMMxO875UYQa1UQ2HTzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS7PR01MB7565.prod.exchangelabs.com (2603:10b6:8:70::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.8; Fri, 6 Dec 2024 06:14:40 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 06:14:40 +0000
Message-ID: <e7cbafd4-506b-4e26-ad88-e1afba06e972@amperemail.onmicrosoft.com>
Date: Fri, 6 Dec 2024 14:14:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: add a new document for the fine-tuning tips
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-5-shijie@os.amperecomputing.com>
 <e48df345-0946-4b34-a463-e89aa89680f9@arm.com>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <e48df345-0946-4b34-a463-e89aa89680f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS7PR01MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: ce16e8ef-fffb-4c3b-01ac-08dd15bd4495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2lZT3NidHZvbmROa1luWUFPQzFVQ1NWVDZKdmlscDBLMkxRZkJ0cUNHZVZC?=
 =?utf-8?B?ZGFaaEpCSHhKdHRZbEttcDVtWjV3NlhNZytEOUlwdTl3bi8rekl5bC9kUHR2?=
 =?utf-8?B?eUtSWGE5TytTcUVoZFhzU1F2WlBPVURrRkVVUlNSRGRHb3FPMU1WU2JZS3F5?=
 =?utf-8?B?a3MrTkpPdnJQR2tZM1QwNmFwZzhwUFJSTkhsYjN1WE5jMysxUlhJQkZhVFY0?=
 =?utf-8?B?dUJGdTNDMnVjT2lBalhPOFpyM043MkUySzVtS3ZodlNhOSt2YTMvUmFCdll1?=
 =?utf-8?B?b0JEMFExOHVGWXZzZmpCNTlNR2xoUFFYTmlESE9pTk1PK0FORTY2aFFaSGRW?=
 =?utf-8?B?NEp2Rjd5aHExZmtyNmgrRmFmN3prY1gybEI4MXFvU05YOWFVQjhEaVZFV2dl?=
 =?utf-8?B?U1hPZ2pGd0VmY2dKWGFXcGhnZWF0K2xyaURqTE1BR1R5ODY3WklwRUI2UWpR?=
 =?utf-8?B?dExmQ0pXNERWYklLWks5cENJRDF3Tk9Dam56dXdOWEdQeHpQc2JxZ1dlRlJ2?=
 =?utf-8?B?YzZIbmk5dTd5ZmY5dzRpenlMOW02S0dDQWtBdHJJdUhGT1JVOHNza0tTMHd2?=
 =?utf-8?B?d2FxQjI3Z3Q2eStHdGtvc1MrWUFVNUc2M1IzTElLbkRrblFuMEJPR1dZSVhC?=
 =?utf-8?B?UVFIUnhJalo2T0NsZEd5enYvS1ZBRnQvQ3dxZ3FxVlgwRHNBbGpBQ2VtL3dm?=
 =?utf-8?B?WUJEM3VZR0daaVp2TTVMTmVvU1BJclhBVmFTcVE3MDRaSTB5UUgvZU1nN3BM?=
 =?utf-8?B?WmxMQVhHTW9QYjZSMDkwNFhzZXB6a1pKaGpNeVU5dFo5UEQyMitIZDA5VC9a?=
 =?utf-8?B?S2p0ZlZsRllaaGFaL0JHQWFtbU1JQ2tsVVRqRVcya3ZiWXRCV0hCUFIzOHBI?=
 =?utf-8?B?QUh4MGNlWGVEMForVWt5YzRySWlwdldES2t2VHpZeU94SHREMmVTNnNYd1NI?=
 =?utf-8?B?cnlKUjFVK1lLZStCSnJPNERQRy9aNE40bjVZY1pTVHJZb1NPMytVeW5oaDQ2?=
 =?utf-8?B?akI5bTI5ZGFFUFdVWEdHVlFLVms1Z0RkS0dkV21XUW1oY0ZmSDRjMHpXQmMv?=
 =?utf-8?B?azVuZGxrZ25GYmlFajE2Qks4SXFRNEVFZlM4VzR1MTB3eTJEcVU0SDNkVHcz?=
 =?utf-8?B?WlRzNzIyZFZmeFRKNjZMVzlkWEVVdENhVGErOFl1M1d0Y2FiaVNFNEhZZHF3?=
 =?utf-8?B?WGlaS1JhV3J0Nkoyak1RdXh2d090WHhDRnQrWG40d3RZdW01ZitPV1NUOFVN?=
 =?utf-8?B?WGdHek9vTVhEMTBMNVFZREtVc2lwYW1RR2s0bm1Pa2ZHaFFBcDVGNXA1SGN3?=
 =?utf-8?B?NGdDRGtMRmlublRlZVF1eGxUUjA2cWZhU24xK1hGK0laNFN6OFFpdDRZU2Z2?=
 =?utf-8?B?aE1VNkJrekFwYW1ndUgwVGVLOUVQKzA3dWlOMVhLbVdycXVINVR2YitpSXl6?=
 =?utf-8?B?VHE0QXl6OTZaS0pJV3k4UlFESUlkeDhRanJjS01GSGZaU2pscU9SVWNUNERv?=
 =?utf-8?B?NTFjeHp3d3c0SUZhOTR4Z2IzMEh1SDVXNUM5RHZwSjY2Vkd1c0c5K3lJR01w?=
 =?utf-8?B?ZUtKU3lNNExHVEhaUVRzaDdNbTZKYXJtYUc1bGxVM084aFdXczBOMW85WHAw?=
 =?utf-8?B?RTFWTHY4eEhUZXFzSk1pSTF4VFF5MUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpIS0pHVHoyYWp1T3pRYW1XUkpRTUJYSFlkV09zWWs5UEl0VGZTb29RNXcv?=
 =?utf-8?B?dHd1VWJyMVlBN1ZRZ252V2RXVzFMdFB2b2ZQOVVSL3FIM3c1U09VR3M3L1pQ?=
 =?utf-8?B?a2pmRHhGQ3I4WC95bU9kaXdqRmJQM1NLbXR6UDRMdVVQMDZTZEpFeURwdEk1?=
 =?utf-8?B?WGxBdkNpUnI3TGhYVXgyeWIrVEVkV0E3ekZrM0oxL2xIejJvbjBRbCsrOTBj?=
 =?utf-8?B?L2l5dnFaVmFNQ2JDSGdhaDdCbG1FRDFXYjNkZERMR3NZbWcwKzk5S0l6V0Fl?=
 =?utf-8?B?RVRzZU5zdll2ZE9ENkgvTFAranBCMlhKRHNMcTJLUW9VMzBVdXZkVDloNFdO?=
 =?utf-8?B?TkRBdU8xQlRFYXBFcTI2Z09sTW9jNnl6UGx1cnlhK3RSYThzcVgySDlJQ2RD?=
 =?utf-8?B?UHRCeC9nOFBqdFNmUkZNbnAyZmJDck9XVGlGZ1hVNG8yNmV0L3J4aThhaGsz?=
 =?utf-8?B?Zm9Oa3NPR0F3ZkRoYXFodVJSSjBCNGdOaHJjWWNjcEVCN0FUeEtWbElvbWRS?=
 =?utf-8?B?Q09OK0NyM1piUjN3UzRwRkVpTG9RU2lGb0xBaGx1V05Bd2x2TTFDR2hyemdV?=
 =?utf-8?B?ZHBJWVVxcnM4My8zbkVHMDFHSWtibXpOdGFOOHdkMTVYSXpGalFUb1lqamVL?=
 =?utf-8?B?SW9rQzAyVXdKVStBYnJ6NDBORVZnYlhQRDNWU2JKa0RSd09KSUtvU0NUZStX?=
 =?utf-8?B?ZXordTBrZ0lraUtkWWlQMTlNMnhkdTRQeStua3FoV05XN21jMTE5Z0JFMlFI?=
 =?utf-8?B?a1NCa21DdS9zc2Q5RVhwRHYvb0ovbzJWY0Z0T1FjTHpNTFdTTTN0WVNUcEVN?=
 =?utf-8?B?dlRSbXlHb3pGNWZzbC9Na0lwNVN5UEV3N1V2eWNlZFFMTDlNbkdYbGVHdnNs?=
 =?utf-8?B?cXNhZGlZanRWOE5QanIrNnZCQjNBY1FuOXRJbWZtSk9NQlk3YWZNUDE5Q1hl?=
 =?utf-8?B?TWhCVEJub0tsN3RZekw4VFRqa0p6QXh1ang0RlRqYnVDY3d0S0dGRVdnTExI?=
 =?utf-8?B?YUo5MWtDTlhsNGl5SmF0TnNPRUJGUWpib3d3RVFhMDlkS1FiRld6bDc4bmgy?=
 =?utf-8?B?dUxiL0tNdXBYOUxSYWtGWVZmcDU3MW5ESXJFanhueTdHSjlLNHg4ZVRITi9N?=
 =?utf-8?B?YmZkSXp3UmlUT1hpQi9QRjVJL3RpWnl2YlN0ODUvSmFjYVZxTGlsNXBXaHlp?=
 =?utf-8?B?bUlpdmFsWHh0eityVlMzSEN3WG82cU1nY1lGSjN0TS9QL2pleWRCdnlCUEpY?=
 =?utf-8?B?ZHJnVHZDOEhnYy9DVDdObkZEWThWRitoeStWWUpvaFRSTFlxZC9Pc1ZuTGUv?=
 =?utf-8?B?ZFM1Q3c2QW1Gc2lYMEIzRHVBelBpcHFaUHNicTd2T0tJRkw2eDBxRy90T2dy?=
 =?utf-8?B?c1dJVW4ydTBQTXJSTHZGVEducENjK2tBQXBoWWFZdGorZDlDSlF3bm5Ca24y?=
 =?utf-8?B?NTFqVVZjWFlhSEpTaWVxMisvK3RPbXpDY0pzUHg4aXV6OTIrdmdqQllWMmlC?=
 =?utf-8?B?MHdkM3pMNVJLWmtEV050WWpSa0FsOFJxY3dLWDFlK01EMzNhbWhCYU5wTWRL?=
 =?utf-8?B?RWtDeUljRmJoampkcFZZbGtNMVBKU1llUWd1eW5rQ2VJYVlFRTJKcHFMRjZ6?=
 =?utf-8?B?UWlvd3VEaTViKzZGaTdORnZqTDUzS2kzaDE0UTQ1aGp0MkhDWXB6bW5QWVh1?=
 =?utf-8?B?RjZvdUUra2hUeTQzNlluZ3hYRmVQYVdvbEhMVVlCVElrSEZEeUpTRmhXRk1N?=
 =?utf-8?B?MFpQWXg0aUt5Mm1ndzBRTWluTkM1a0xzSGplRURlU1dWbXFCd1AvZ1lYNlpN?=
 =?utf-8?B?cThyc01Ecmkyc0s2bTR4OWNTbmpycVhlMUVoU0NVNDJoZzd5NlAxakRWa240?=
 =?utf-8?B?ZTVVaWZBWG1kRXBJeFFCNVM4S0NuUVhLdWt4UzJYWEZoR1Q1dVZhR0R2OWts?=
 =?utf-8?B?WlVmSnkwYmRFcVZrSCtUODdvRjJ4QUlrd2tlQncxV2p2SWZWUzNrM2k3a2hy?=
 =?utf-8?B?bXpBREh1M09ZNVNMZEQvOEdNaVAwSjNqZ2JkVVcrN1pwc3NZSlpRdHIyNlZi?=
 =?utf-8?B?MWtqMEVKbG1vbHNHWkNLcVAzL3FnMWlNRFhOc2xZL3ZsdHAyM1RSa3FJLzVY?=
 =?utf-8?B?WXBHcDNiSWU3alhhMkpwbEpnOHVLM3Z0dHRuL0pWOUl0SDdsSENCbGVzelh3?=
 =?utf-8?Q?6gLEmXKkU2rOqUyDlEO9QyA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce16e8ef-fffb-4c3b-01ac-08dd15bd4495
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 06:14:40.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AWDITjNQ1LmFOPVUGTtTL7K4hgGvhDZt39dFLOXhPVXigjUNSvHcdByCczVhGJwO5ljN1Zp+kOK5W5+dshIijA8YrXOgj10tF7ikFQhggOqNNe/knsXy77tXRUvKiLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_221451_086518_F20C0B73 
X-CRM114-Status: GOOD (  21.30  )
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


On 2024/12/6 11:56, Anshuman Khandual wrote:
> On 11/26/24 14:26, Huang Shijie wrote:
>> Put some fine-tuning tips in this file:
>> 	1.) rodata=noalias
>> 	2.) slab_strict_numa
>> 	3.) CONFIG_SCHED_CLUSTER
>>
>> We can add more tips in future.
>>
>> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
>> ---
>>   Documentation/arch/arm64/fine-tuning-tips.rst | 23 +++++++++++++++++++
>>   Documentation/arch/arm64/index.rst            |  1 +
>>   2 files changed, 24 insertions(+)
>>   create mode 100644 Documentation/arch/arm64/fine-tuning-tips.rst
>>
>> diff --git a/Documentation/arch/arm64/fine-tuning-tips.rst b/Documentation/arch/arm64/fine-tuning-tips.rst
>> new file mode 100644
>> index 000000000000..70ef1cef92fb
>> --- /dev/null
>> +++ b/Documentation/arch/arm64/fine-tuning-tips.rst
>> @@ -0,0 +1,23 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +================
>> +fine-tuning tips
>> +================
>> +
>> +This file contains some fine-tuning tips for arm64 machines.
>> +These tips do not gurantee that you can get better performance,
>> +but you can try them with your workload.
>> +
>> +rodata=noalias
>> +----------------
>> +It can provide us more block mappings and contiguous hits
>> +to map the linear region which minimizes the TLB footprint.
>> +
>> +slab_strict_numa
>> +----------------
>> +In NUMA, it will provide the local memory allocation by SLUB.
>> +
>> +CONFIG_SCHED_CLUSTER
>> +----------------
>> +Some arm64 machines have cpu core cluster, enable it may
>> +helps you get better performance.
>> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
>> index 6a012c98bdcd..36d1ef09bd71 100644
>> --- a/Documentation/arch/arm64/index.rst
>> +++ b/Documentation/arch/arm64/index.rst
>> @@ -16,6 +16,7 @@ ARM64 Architecture
>>       cpu-feature-registers
>>       cpu-hotplug
>>       elf_hwcaps
>> +    fine-tuning-tips
>>       gcs
>>       hugetlbpage
>>       kdump
> Although the idea for such a file makes sense, to help system admins
> tune the kernel command line for required behaviour, I am concerned
This file also contains the CONFIG_SCHED_CLUSTER which is not a kernel 
command line.
> about the overall structure and scope for such a document. Should it
> contain tips regarding all the subsystems on the platform, till what
> extent these details should be described in there and then there are
> so many aspects for a required behaviour etc ?

My original thought is to let this file contains the tips only works in 
arm64.

All the tips which _may_ make the arm64 machines get better performance 
can be

recorded here.

Then the arm64 kernel engineers(the newbies) can follow this file, and 
ramp up

quickly.


>
> Besides maintaining such a document might also be very difficult as
> well given how implementations will change over time thus requiring
> different tuning etc. Hence kernel source might not be a place for
> such a document.

okay. If the kernel source is not the right place, I can remove this 
patch in next version.


Thanks

Huang Shijie



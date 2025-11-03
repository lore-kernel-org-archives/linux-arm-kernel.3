Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18F1CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+DEkJb3sRLMgPdJXOne+d+2kVv1sHxmraeeZlxopH0=; b=GL1ndxoexVxbl72blcDYljPPoO
	maOrUtNSCFqjXe2EIpLTM4dKiZN7vNPNwznufprtl5vxJqehRGBXYuHC31X7mjfljxg2pZhmKdr1q
	tBNAsPfvY0OD7yCMJnFDDI7qmqYWyOfg+ljNlJhKXNEDFbPzajqon4xIKT2OHlQwSrmifZJCuAmF/
	YC16viJjgpwgYtOggt63yiGJyhEqeklzK5HRWqIPnWBC92YkM62kT1bHl9nO8XDQzW+2rJxD5m5PC
	blGmCDaU26dTFRnH/nX48BPivDJJpzK/nmZxsCEflWlsPH/Eg7Xe1RluiS+j2U1rgPRVIX07Ij0z9
	112/Ke2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzZ1-0000000AVE0-0NUn;
	Mon, 03 Nov 2025 18:45:59 +0000
Received: from mail-centralusazon11020120.outbound.protection.outlook.com ([52.101.61.120] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzYy-0000000AVDd-1sht
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:45:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDecvJ1uC88yVneA5LBh4UzHwNloRnXobPZj7jrIzb75hlfAeq9Tl+q+wE2hvn/J2iQa9kZ7AzT3EXDrtJDsSNcPE8ksSAq3KesVuAhtKT+9JmNepN5W8d76mI5j1TM8ypdF6YqQ+im2EbnZfdFhhaSCDO/uv8hc5yE5siFnWYEtRD59AwFQD1pg30xt2MEg4HgKrAOswWVljeOqgENfgX8ca+9ag7NDtuxpdKJ2TjInkohtwWXKJqFjttNjZyS8Sbx3G+qqqmwah9BjiB00REIMFo5e5VWRTHO/9s27tyT1NArHpA6M3AwUkLoJWIrGlh4UAfDqP5b8dlVQ58u8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+DEkJb3sRLMgPdJXOne+d+2kVv1sHxmraeeZlxopH0=;
 b=d1ZRyd0fn7+UxX2kz/wHUWY4aUbfxo1+74msj9Qt/7jwbVULBiekUD87CS7/y9ipyGMSEOxe3pmOAAZPEhYVTCZfnXb7fiRSnl1uU/y2VdfBSMzZXIIxvUO2viTxoGBxrjVBQiFVCVgOO1zpUwOqOZt/qgFe7EwaEbh3mM8Ic2ZaGZcbuSu5421fuRzq3vQ7YfWIt4pwqhyx04eUZ9WwB6GDnjOkNOSrq6CTDBe6TUp3hncvY8YScXU1NleuGvCydBpi0NkvI52cMJckD4LSdJbYPsIhCykO8v+5TfdPW/PHIICGjbYShQ0BvPk5WTliPFSB6VtdQeVf5T+XYNpAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+DEkJb3sRLMgPdJXOne+d+2kVv1sHxmraeeZlxopH0=;
 b=cAi6XVi+NBe5TD9bTrf+c7JohBwctFqEQ1M04hupnVgO1VMu+buT9cbDyx7TVw+SvVC8RfJMssm/0F3GCPLrydhIX4D0MY86TxUc7KqSDe2isuXZRvkoIaZPC+7ibyN9lzasZF3y/1lXNvWWWxck6d5um9awwgPp39254LobSdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB7288.prod.exchangelabs.com (2603:10b6:510:10b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 18:45:48 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:45:48 +0000
Message-ID: <f594696b-ba33-4c04-9cf5-e88767221ae0@os.amperecomputing.com>
Date: Mon, 3 Nov 2025 10:45:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/pageattr: Propagate return value from
 __change_memory_common
To: Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, rppt@kernel.org,
 shijie@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251103061306.82034-1-dev.jain@arm.com>
 <aQjHQt2rYL6av4qw@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aQjHQt2rYL6av4qw@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR19CA0002.namprd19.prod.outlook.com
 (2603:10b6:930:15::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 82511f34-e376-4945-12bb-08de1b09347b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXRiY283SkVXZUdBSC9BempFandJY2VLR05TYll4eFNyeXVDMGpVcHlLenBk?=
 =?utf-8?B?aGpLR3Z3TTJMNFB0S2VaVjliQ1lPdG9qejhJNGhXTVJ6MytrNDFLMWNFYnpF?=
 =?utf-8?B?TjZRMVJOdVlyaTU1ZXp6Um93a09id3hSb1Z6MkZFa2N2TlYzdjhqaEVyYTVP?=
 =?utf-8?B?L1dsQ1ZpNVVWNCs2UWU1Y1BaaFFmT0hGbk1xa1ZWdlN0RllyQXFMOWVpUnJE?=
 =?utf-8?B?K2RudExDNmNsTWppVGswZGVWVEZJMDN6NE9naGs3L3RzUGh6R1d3dDEzTDlX?=
 =?utf-8?B?MmVmdVJRdlp5L083VktWZURIN0tXRWhtTzYzbXpqT1dRbTZ6S1VobVYvbWcy?=
 =?utf-8?B?N3pvN3VMVDJ6OVBmT1Rjck5IT0hVSzdOTlQvYjU0OUVmTXFLWlRtc3c3YmI2?=
 =?utf-8?B?RVp4QkZaRWVTQkliRityeVVoRUJkS2JYeWwrZEF6QXJ6TFRQUGFTKzF5SGR3?=
 =?utf-8?B?Ry9mQU9vei9ES2dhZnI1U0M0YWcwUFFGKzJYSENxeHFvRU4yc0czWitKb0VF?=
 =?utf-8?B?SDJkL05wVUtOMkZDdnp3ZzhLY2hhTlNWd25JMVI3Mmhic2dETytDcnVXYTZo?=
 =?utf-8?B?ZzZRc0w0VXpNSWo5dnpjZVcyRHFMMS9YeDZBcm9oQmZ3akNKZFozSjgzUENh?=
 =?utf-8?B?SjhaMm1aN3B1eW5kS3JnOUZjSDY1T3RWVU9scXM5Z2ExVk10VnpNbFc0SXBr?=
 =?utf-8?B?QnhxRk5TWWQvaXZITzdBdU5QVTA3TDZtTU03MVlqZUxyNGI4OE5ZbzVXSVNC?=
 =?utf-8?B?MHVuWW1FblEycUp2WEFWQnpqV0Jib3R4YUF0aUtQdGJFdEhpN1FudlYzbkFF?=
 =?utf-8?B?TXRRb2Z3cTczVXJKaVIxNmV5cmc1aStjNFBVUjg4VUc1VzZIVzZwRUVZUllo?=
 =?utf-8?B?U3poOFFYa1djVDNnL3JyZTBuejFQVmRkMjRPYjlUazl3SUR2UVdpTVNESTBE?=
 =?utf-8?B?aERSdFBhZTNXRUg5OTFZQndTdmpMZU1EOUxlV3gva0NTU3J5RHkwU0Jpa0py?=
 =?utf-8?B?T0NDWHQ5SHhzTklDVU12SWo2QU5ETVpJYU1hTmpPSVpjTVU4UFplUTZ2eEpJ?=
 =?utf-8?B?WUVPYWxLU3duOWk2SWV0K0NYMlcxQVVxbjNoMjdKa2ExK2ZMbVpMVjQ4SG9v?=
 =?utf-8?B?SzNjdTZNcDhOakExV2Z2RWpwRlM0RW0ydzVXd1pSUUtDSDJNdi9ERmRBNHd5?=
 =?utf-8?B?SDhScjUza1VDZHZJUDhiTWdGQm9VUGdqNUw1RVVmdURlNSs0QjFPUm1mYW45?=
 =?utf-8?B?Kzg2cTh6ejYxdFJzYVpoakh4bjF0MWJaSnpFSWFtdkJ4UTRHK1czcVJ4QWYy?=
 =?utf-8?B?YWsrblJ6RVhCQmNEN0N3b1ZLOVM3aGp6N1ozSVVXdG1lcXE2Z3doYnF0NVhC?=
 =?utf-8?B?UU1peThhWnEzaUxEajZleElOeDBMVGg3RmhVbzl0VmRZUlhUYTdYU2I2ZkR1?=
 =?utf-8?B?cnZWcllDWDVmeSt6enJKcmhsWHZhcitMc0F5Q2grVThtK1F6aXhXTm42aWRU?=
 =?utf-8?B?dzVZYzJrTUxoM1FZRXVOTDVYK0wwUmtibktLWHhWTGUzUkNGTXF3TjVKNVFN?=
 =?utf-8?B?QUJqbW1uNWc1MDZNYmVaTFYvcWN5cE0remk4NHZvNVpYRldMOFJicEJISm9X?=
 =?utf-8?B?VTZPUWlueCtKUFYraEdCVCtRdzVjM2pJMmtBYzk5c053SmJBbmU3NnRtZUhN?=
 =?utf-8?B?MmxBTEx6VUlpL1dWeXZoN3dsMEd5R01nRGgrT2FiNzFNV0ZsOGgyQTByT3NB?=
 =?utf-8?B?VDFCcjMrMitkbWw4cGlQSVQ5UUJWRXAydGh3VE0zeDA2SFJTbXhiT3hRNldi?=
 =?utf-8?B?RmVkUmVySkp6QnBDQ2IzKzdnd2svT0djZ3dtQXRvNVBibXRnSVJNbFJRWFhI?=
 =?utf-8?B?RDFzWDNBWjN1Si8xTk5qWmdRQW0wanVuMmNXYXNPeEhWLzdxK1pNaHNhdW1W?=
 =?utf-8?Q?7bDu+hDnbAMBojbV84SaLbyNE1ttYyrJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGIxZkhpSnRoeUV0SDhwS2tFR0t0UHUwd1hqU2lkUlhRN0t6TDVXa0RVN3pr?=
 =?utf-8?B?MXc2bHlqZndQdWE2OEFMZzR6UnFDSjltaS9Vai9mL3N2amlHeXJidW5ubTFi?=
 =?utf-8?B?eTNZTS9MK0gyOUcyNm5OMmZoVDJzVnhSSTh6NFJjbDRqK2VpazJBRDg5Nnda?=
 =?utf-8?B?dTZ3UkZvZmNoSjlDY2kxbHplR3FvWXFUNFA5RHdPVGs3OFRRTnE4ZG4xUGNC?=
 =?utf-8?B?T29uRWlaajRnekVvaVB6cDNicHdPZHZnMXlFcTNURCsxMmxpSldkK0Zqa2dH?=
 =?utf-8?B?NVRibUpjeWVUdWZUanIxcXFiK2FqTzVGMC9lbFdXcE42WEQvcy91RG9LS1Q3?=
 =?utf-8?B?eG14N1ZFUGk2M3VGdEk4TGRZQjMyOWx5d0FDN2tXeUU0cGYwbTViSlI1NGN4?=
 =?utf-8?B?bk9wRVoyaXZmVi9hcUtjcnA2VlV1ajBqOGw1N1Z5T0JXaVY4TnluRGtrNmM0?=
 =?utf-8?B?aWQ1NW1ralVlR1BIVzEzQVRwdGdLZFNCOXdUMmx4bTUveEN1N0VPUmUvdXRt?=
 =?utf-8?B?UkNrc0lhNHNZQmdXYkV2MHpoNEI5cmprUlA4TTMzZExHd2wvUnlPalIyZThR?=
 =?utf-8?B?VTZ1UWRGb0krc1FCeDdneGlzZ0hnaXhReGpXQUhNS2dyVGFMUTVaSTlWcUlp?=
 =?utf-8?B?Y3dyRWxCSk9xMmRvWnBVc3J3bTFNL0sxNlRsYUVMZEVzODB6Vjd4UWxWaUVS?=
 =?utf-8?B?MW1JaDltMmE4QWo4UVg4WmcyTFdJTjdIZDhHSWFwMldRWkw2TGtCZVdITlVw?=
 =?utf-8?B?OEFpcWtFOGhIbkc0Q3hpb0g2cVZyK2pVY1h0TkhHVVBWSmtHdmVIVk9uekU4?=
 =?utf-8?B?VDJMaVZlOFJMZU1CZ1VoVXhHSmJCNHl3MzhUTWFCOExoQmFlYVNvc2FGa094?=
 =?utf-8?B?d01qM2dRS1hyRkZhdmRwKzkwWXBJNHJ4d0tkVm9Yb05uVVpWbitEbUFpbklS?=
 =?utf-8?B?RFl0MEd1bVgxekhHYkFpZm5TS3BIRXN5VlFUSWFxSVhKQzJHYk1odExoOFZU?=
 =?utf-8?B?U2orSUI5a0lIR0ZIanFIY1NLMVZhcExiZHVpVjlmNWhYcElmMzl3V295UEtw?=
 =?utf-8?B?c3M2d1hQRytPeGhWdDZVc0txY0Evd3N4THlYajdWOHRkanFSalVEOUd0VUoy?=
 =?utf-8?B?UHppMkJLa2JRTk9Ecy9Hb1ZhY3lDT2Z1UGdoMUdiNUpZSllLTmxkRHJ5bkQ2?=
 =?utf-8?B?dndLWnJhOUlJaVdJOHpDdUdLL3dIcFIrNEdhUlltVXhpY3N1SGhsTlF6K0ZF?=
 =?utf-8?B?aW1MMG40T29kQ3BiUjRsQm5sZjduRjJBdkNGbS9aaENlcXg1VXlKd1NrOU1v?=
 =?utf-8?B?cGg1eUFLRFBnUnBtNURoYVBlcUFNUXVzYXQ5Q3U0dWhaL09FOEtqLzBxRVow?=
 =?utf-8?B?SU5GR1F1WnFqVjJoS3c0T0l0NVFDMkNBWmxqS0tJQVVmZVpiVXVFUVVZSUFl?=
 =?utf-8?B?VkxwMzlzQmwxbEszcGJ2ZU9DOVI0eXJFRjUyVEE3WHk1TkF3QWRFZ0ZJMUha?=
 =?utf-8?B?S1pSV0lteXViSTJDM0tEOFYveVZaZTdaVFJrYjBZbHY2STNSamh2bS9FVElE?=
 =?utf-8?B?TW1FMVM0bzZadmVRMDFHTzZmc21oZHM0Z1BjZXpPZis3UGMrbzJwT2x4dmk5?=
 =?utf-8?B?WSsxeTV1K0ovWHJMMkdEVjB3SzEwZXBodXBNMFpPbTA1eHdqOUF2dmQvdmJC?=
 =?utf-8?B?aGNWQVBNMzRHdnNqUVJvZVdlL293VE5NQ2JCbG4xMFowRDFFQTBlVmM2QTkz?=
 =?utf-8?B?bWg3eXUyN1phTU5IaVNtMThkOTRMRHZuUWMvb3FUTm5RZjlNRWR0SVp3RVM1?=
 =?utf-8?B?SFg0Q3JXQWhFeEFNOWJKamF3ZHVJZWcvYTZDMkRMWVFJUFRRWndWQUNiSzN6?=
 =?utf-8?B?akR3K0tEZWlBNzFNSUc4ekdmRHhZUXRsR0VsN2JjZ1kyN3ZPSjYrbEw3V2ha?=
 =?utf-8?B?WFU2V2JYN1hkVUE5cHgxZlFYS280ZXMzZ0tiVlI4TGVCcGxDa3VzMVFDbmJ4?=
 =?utf-8?B?Mm9LREFuMmp3S3JsMnNtN3l3Y2d1Q2o0dlpYL0p3bnBid2RaN0g5eTdaNzNI?=
 =?utf-8?B?a21QaitVeGtLSVhFNnQxczIzNjdvUk96OCtoN1VoS04rT0VVZUx2THdtaFgx?=
 =?utf-8?B?WE1IQnVPcXRZemlBeTZPN0xuUTQ5Vlg3S1ZDeUpRSFQzcGtBZnh0eCtVTG8z?=
 =?utf-8?Q?NEAlrQ1surm/lZQzHGuMwMc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82511f34-e376-4945-12bb-08de1b09347b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:45:48.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hY2Wbl3jevOZSgffe4PS43/MQoKBVwLPHaUarAzFqrO4xG/HEqKuTtRg6Rd/tBJCmA/5QsbIkS9GKroThpt/ZTIAVtzbFq9aGdv443xVfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_104556_527270_F8FA81CB 
X-CRM114-Status: GOOD (  18.74  )
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



On 11/3/25 7:16 AM, Will Deacon wrote:
> On Mon, Nov 03, 2025 at 11:43:06AM +0530, Dev Jain wrote:
>> Post a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full"),
>> __change_memory_common has a real chance of failing due to split failure.
>> Before that commit, this line was introduced in c55191e96caa, still having
>> a chance of failing if it needs to allocate pagetable memory in
>> apply_to_page_range, although that has never been observed to be true.
>> In general, we should always propagate the return value to the caller.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM areas to its linear alias as well")
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> Based on Linux 6.18-rc4.
>>
>>   arch/arm64/mm/pageattr.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 5135f2d66958..b4ea86cd3a71 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -148,6 +148,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	unsigned long size = PAGE_SIZE * numpages;
>>   	unsigned long end = start + size;
>>   	struct vm_struct *area;
>> +	int ret;
>>   	int i;
>>   
>>   	if (!PAGE_ALIGNED(addr)) {
>> @@ -185,8 +186,10 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>   			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>>   		for (i = 0; i < area->nr_pages; i++) {
>> -			__change_memory_common((u64)page_address(area->pages[i]),
>> +			ret = __change_memory_common((u64)page_address(area->pages[i]),
>>   					       PAGE_SIZE, set_mask, clear_mask);
>> +			if (ret)
>> +				return ret;
> Hmm, this means we can return failure half-way through the operation. Is
> that something callers are expecting to handle? If so, how can they tell
> how far we got?

IIUC the callers don't have to know whether it is half-way or not 
because the callers will change the permission back (e.g. to RW) for the 
whole range when freeing memory.

Thanks,
Yang

>
> Will



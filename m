Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B287EF327BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX3t8FZcFpxbNPfG70k3s2soCiv8VPCerRjkCbUmlIY=; b=MkGh5LYuYtb8nC3vRsqW6cstrX
	lsIBQlDHibaAFMZMujjFsS1Yhi/kUzbHr+33QYQYHLTRgmbNdrDLDx0yfTOjJb1lhtsqoMIlDPtA6
	N7Gtns0wdsk/Vpbh6viF9cluv/3M5vuHq7WjbB/PtSUfnwgeBvCYAy08f+LGJHMi6g4KN4mh3e1ot
	0qIfZjTYeT6jlrBL3Z40syEH2nOLBjFphVYqkRO23DJgi/V5mUdC51TaOur9Lro+TQHGvPn9z/xiU
	Jk1CpTxnK4CiqsEliTOGxwyJYRHlQmC8cMWN0+PjCwXEm+vOcSONVqB9s7GQvY/983ZeoxE/dxqRe
	0UU5aB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5uG-00000008DJQ-0G6O;
	Tue, 21 Apr 2026 07:52:28 +0000
Received: from mail-northeuropeazon11020092.outbound.protection.outlook.com ([52.101.84.92] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5uC-00000008DIr-1x0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 07:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4gMvaKX0yx4CUgojY4a7U7eWnLoG5Ixzz2DV4vLcXvfMjU0ny4w+LdCCX7AlJm9CkFGHRMf88nD5SBksSE+R9fDwJBNce0l/+cnRKNM6Sw8Yg0OkOZuUe/0tB42sRWjBcAlapkDdrSxqgI41A692qJ4gwLMZpTi6hwvumiXcbKe0Z/Kk1DYKNs58tuvhtSMJZF+Q6fCVfAzZKjojoDzQcQva7r3PDCCD6Da+OZa/vFVvWT8yEm+nrUOUGy8zlLjVDl2cwe7PWR6wFKGGssO2pzntNYD693Wi9LWdO50huXGQBV9bMixOWPyBnhGPeYseREGrcnGWzj78uIQGqF8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX3t8FZcFpxbNPfG70k3s2soCiv8VPCerRjkCbUmlIY=;
 b=FT9G6FZzzxLmvb4BtzyiCyHsB8LhMVOjwNA6Vf5+WP+wjTHXSULwqDDYn5RzaXnTx9klf4kx9hzfvurLWlIGCHq2dmRSO2JMj0dSOn1Ty2+8Oc6B2V1feO6RwudPmcLRgzmuqeCIthwFjUZ0g4h9GpWc7JXEdEtHeyqRL8VCO22lRw1zUJQq+F7RtBEQAaKefwo0tuJuTorDrNp4GSKhNT0xOgSwoobJzS7Pr+g4XHoY2wGtU6VAEvAEuwweudilVDxfHTGAWDRqbp0arnEVbIxQqyV04TnljoHkDOSIDsSsJLeyFW/SSlxpbmWYmSKO5oMsKxcTqR3iZ2+Xgm/Sqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX3t8FZcFpxbNPfG70k3s2soCiv8VPCerRjkCbUmlIY=;
 b=jnS/7a05vuk5CKfp/uU2yIC5m3/12fOsIvyoZnMWIuZQFCwOHEMjDmvwUClwcfRU+J3bA1jjLJI0LD0+jXdsnVdLx+ogofH9/lZ+G97frfO6BR2+Ku7OANsZy9gEMEX4KY9s4JLkAyeRcoHXB9bBkiClqe9Pk0S3iyQoExaiCzOS189CMcIDxZy+DtYi7BhKb1PpUTuqXuRvvgQfQyEQsPgsgUFyLf+MU/rnnHH6u3sidhOCYG6dF1r9Z7MEiMs4wDa5DLv/nA80GwogR1NfArxWubFtq6FVbvohpn+dwWi7+/3W3ugfHX0L2wXxIr/QcOe1KxGHkR24R8TLLDoW6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PAXPR10MB5592.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Tue, 21 Apr
 2026 07:52:16 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 07:52:16 +0000
Message-ID: <e5989438-c063-4395-919c-2beaf8e937c8@kontron.de>
Date: Tue, 21 Apr 2026 09:52:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 0/7] firmware: imx: driver for NXP secure-enclave
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Frank Li <frank.li@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <AM9PR04MB86047EA92BB21C6D522FC007959EA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <6543cf20-01e3-4dc2-b4b0-08935527f440@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <6543cf20-01e3-4dc2-b4b0-08935527f440@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PAXPR10MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 739eb305-9dd0-42a5-826a-08de9f7ae790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: H98bV0EMHGIPVGUQ/vXS37OiAlSszoiPTtjZbLvZPyd5FEy8odQwZnHTdOw0EYsG7F360t+Z8IjiAYVbt/nreowbeG9xLuK26KTWZFbiWJAP/N5lL7gFwkJOAVxZuZXhLlXCmSBBBLCvAeP9m1bio6/v/z3Xs/7Vb9DrZmo22Z9UBFPRuRF4vh/zu1GFwfYWa2O9JR8EM/mis+0giB/DAfIZRLaODlOa6v4cHSk1Y5UMOGS+IDqivERJRNXutJruSrPx6fRc6LC3TVrmvPGy3gkwJ2B6l/S7Pn5PC34BuQOFSOuvXOW+qO1wBnz6+zKQEcL1HsiMQjRU0fNvSi8KJdiPnW6+ypM+kyqbChsty3Fa/H3CPIhvoQ6c/VhfsZetKuhxr8xOPEhkEeYMHnWeVQjsu6GyeGbF9eNOLWP+82QZs++yIVNVn3ed6llQz7u6mntSOZKXkq1t7cxwBbaTiT/l5IeasS2uS/s7DSStTLSM8FMJ1NPLUaUfAvlLdjcSfAGQlYfrw4KkiMTNz80RSqk3jYh+b/oG/3JHGXuWlk+eZ8S1XsTSxcPfIIoyeZdLvHIoQ7mjJN/UJfSHua7o7AEyQj+4p6qPVmjonc41djIyJC06FZICZiRspm4VWZ0Eoksb1haVjqSWbuLyMD68npkYakMdUC7peMkdMeZStdcNhN0AiDMpS4uDY63vUbIcD+mQztnYnhV7EfQHVf5XycRL0abT9ICIW72M5eFFv84=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJ0eXhydHNrdTRYWE0rTlRnU1c5MjJZVlNpckJLOXprQXFqOUIvK2FWOTRj?=
 =?utf-8?B?ZnFHMWdOcFBkWVZHZEhuNjBKYkJTUnQ2UkRqMHA4cXBHVlZyc0U4UzJTRjRM?=
 =?utf-8?B?RitzcWlkWnBBR2RoVjAreVk5RnppaUllcENNZ3c0VjN6SzMvZzNVRWxaZk41?=
 =?utf-8?B?MlNhYzBUcExUcmVKY0FVWWM4N2l5VHQzMWVVV0llMk1kZ0hzaTF0bExvMk9x?=
 =?utf-8?B?ZUIwTnNhU1B2OWtrMUZ5Z0RFWnBUeXNXVVZmSlFqNkF3MFhwQVRtOFg2WC9N?=
 =?utf-8?B?SVVYNXpqRTdCVFgyWTFVQW9XZkx0eFk2WDZ4TDRCRkdZeVR5RXI1b05tRklz?=
 =?utf-8?B?bGZ1aTl1SENtS3NhOGRmYmpXUkNqN3Z0WS8vSWxleTFyd2ZXRm5KWFpyOTRz?=
 =?utf-8?B?UlNIWTdJY2IwcjlmeDRuK3pGZE1FSGdBOVRrSVNPR3FDTG5pUW1xK04yTkJM?=
 =?utf-8?B?QktNckJZNjFOV2ZpZTl3dDZzMWZha2hsQzk3UWMvcmszVFNSdG5ybTNSd2Rs?=
 =?utf-8?B?eFhZZCtLMkJ1ZkhJM3BWRUN0THpJaTBZUWlPVi90d09hdXVON2RTK2x1RWUy?=
 =?utf-8?B?WHJHNWE0Ry81NkxrVFdtdVNiVXJveS9VZDFKOTVzVkViQ2N2UWxoY3NtOHhy?=
 =?utf-8?B?WUlTUW5YWkJBYXFVV1RTRUVhSGtWcjZ2WkJzQlRKeG15c0hMeDgvU1F6SHk4?=
 =?utf-8?B?b0lzM3IydktxY054MkxKWUo2dForcTZRRWJyVzR0YnlaWUdRQnBrMWVWZ1NB?=
 =?utf-8?B?V0JXc0o2RE1jR05VQ1VYNW5uV0ZsWmpGYmphTVVid0lsN1h1SWFKbHJiYWwv?=
 =?utf-8?B?V2VmdXFTWUlqbGVBWjdKSTh4YUp2V0QrcGJnZ09PSHhPdzBKSDlRZHF4K09O?=
 =?utf-8?B?SUZ4eFF5RGI2OWxiclBVeWNhOVdnenVReDU4eWt0WFRBSXBOUVg3dlpkM29H?=
 =?utf-8?B?NkJNUEhmaUMvSERJT09XeVplYXNkaVlCUThLU2FNK1orS2NTemRMT2Fpbkdn?=
 =?utf-8?B?OURFdUhYTzhLZXVkRThXUGliMCtVT0lObTlkK3V5VXY2aEF2RkRkY2Ficlpi?=
 =?utf-8?B?QVZXS1AybXZxajRlRmZxcXV1TjM0Ky9lZDVRT3plS1ZNaU5MdktOUjcxVVBY?=
 =?utf-8?B?WmIreUN2aW1hYVpwZjRCY0gzamFGR3orQXI3aEp3a2FHSEt3ejZmRzRvNjJM?=
 =?utf-8?B?cHpaZ3FINE01eGVmRTVOWkZJbitoaG1KdVFsc3dKc1JZRkQ2UGNKZGlublQr?=
 =?utf-8?B?akQ1N0dQbTNWeER3dVVkZEgwanRDOTQ5ZGkrWjljL1FZNjZxcEFlYURmSndL?=
 =?utf-8?B?Yit4L1EwUkZ4bFgyUC9UTUlXVGxQaFVRVDRnbDBURzF6NjNlZHZTWlJLanhQ?=
 =?utf-8?B?b2lEZHgwQi9tWDFYMUlRc1hudjRuMlo2djBJOW9YOTZ5RXRhd0pyOFpzelBM?=
 =?utf-8?B?djBuVnZOd28vbXY5QVFlWVNUSWtGM3RxRGlZVUZlT1dEaTVJUEJXeHNZZ2R1?=
 =?utf-8?B?RlhQOHZXMWtYcE8xcVZLeUpXNnBqYjFaSkFIMHJBbTJRTkpRQ3RkdURwcmx1?=
 =?utf-8?B?MUJhbU1KdUxiblNac3ljUE0zSW9WQTUxSkhFaFF4aDA3R0NsL3R6WjJsUHJa?=
 =?utf-8?B?aSt3YlBockNLc1ovVDR4SUxuU21hb3R1UERCWVkraTZ3ZTRSbkw3bVB5Tys1?=
 =?utf-8?B?N1ozMUM3V29FdDIrY1NQR2NyUEkraXppbG1GUXJPdisrS1VNVFJ6M1pqS0k4?=
 =?utf-8?B?L3BLcCtrd3l3N3AxZzk5SFBTdmhWRFUvOHl6djBLOEQzRG9mbmRXdzBqaUsv?=
 =?utf-8?B?TWNMbkhTR2NBUnpmSExieCszMmFwWURpbTZhdFZiNXRpNmNGdnQxYVdjQmYr?=
 =?utf-8?B?ekxjQWIvZFlGTTdMUUNObDFsNVZkUzBmb2QydHNBd3lCUllrdHhabCtQNHRp?=
 =?utf-8?B?cFF5YlpaOWE1T1JVRnYyRzkwSUpOc1pYWHRYbEhENm92c1JLenNjU1FFblRi?=
 =?utf-8?B?M1phNWdvUFYwWThVY0JobFJ2S3BwSzhDemtsejZTelN5QkMza0pqbjRRUy9n?=
 =?utf-8?B?dllrbDNta2EyWklGd0dSY1U0NmRZeXlDeEhIZXc5NDZ4M2J1a1JLV0NVWWxN?=
 =?utf-8?B?TGVheHVkaW9lUGtKK2JkMDZ4YnQzMmxkYkk4T3U1SWk3Z1ArSGorRjJUbVpa?=
 =?utf-8?B?WC9xc1dDd0VGcG10d3pVZ1JIcGZ3MHBraHE3ZEsvQVQ3Y3pLdFJBZE05MnRQ?=
 =?utf-8?B?ZExSRXFsWnBQWS9PSzNGRGZjOEkxZmFBT1JHS09qcUFVK3gxZHF3Y2pldHMr?=
 =?utf-8?B?WEhaeitXOWZmc0RibmtCTE9XVVdvTnJobmhTL1NlSktDU0ZWd3dyTGFqWDVv?=
 =?utf-8?Q?emb+ZZs7seWyXInc=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 739eb305-9dd0-42a5-826a-08de9f7ae790
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:52:16.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6f7tmQJ/b8yjjSaTTcUwLG4pY95gq4Bs0NwAFOp/tBKoMqkiB5lWcVd6igRntsLWUGkNp055jAdCbSWfNZz7v00q7SXfITOl1y6trmydoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_005224_808798_878BDE3F 
X-CRM114-Status: GOOD (  13.49  )
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

On 24.02.26 12:18, Frieder Schrempf wrote:
> On 29.01.26 17:58, Pankaj Gupta wrote:
>> Hi Shawn,
>>
>> This is a gentle follow‑up regarding the patch-set.
>>
>> In v25, I addressed all automated feedback from kernel CI (warning fixes and checkpatch‑strict resolution), with no further changes requested by reviewers.
>> Patch 5/7 has also received a Reviewed-by tag from Frank Li (NXP).
>>
>> I have not seen additional feedback.
>> I would appreciate any update on the review/merge status, or guidance on further changes needed to move the series forward.
>>
>> Thanks for your time and continued support.
> 
> How close are we to getting this patchset merged? Work on this has been
> ongoing for almost three years now and it would be really helpful to
> have this in the kernel.
> 
> Thanks!

Gentle ping! Can someone please provide information on what needs to be
done to get this merged?

Thanks!


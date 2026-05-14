Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A3CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwb4Q1HGWCz0L0tsauW3CL44/AG47jALv7rAmOiSVb4=; b=waF5pQNvIxOLrYpGYCEn/ujltX
	LRTVWizdAbZHGhBtKCorzxC01HScnuV77ubgS45UrvjN3eEm9y7YJJG2YHsc6uRbeQaK4Vpuurlzg
	haf411SIQElk3sRk0H/pjVRbF3ciLUj642mojXbNzx0vLzf6aw9mYLvdfeCRidIQ3M6We2igR/cT5
	WYCwMLKmVHIPKxSSnDA2LPoWapsvyS66Q1I16tL3zMYa0rjekX7hgpUA3BDaeU06rtMQeEdjtiJth
	QopbSZNlN9EI3VPmi1NuWqqvNFrw4yP4CFit1GdVqI5t1qlXRRWut8pHmVTezNQd1UcPd7PeggFV5
	CIb61YAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKlu-00000004FkH-0dCn;
	Thu, 14 May 2026 01:21:54 +0000
Received: from mail-centralusazon11010050.outbound.protection.outlook.com ([52.101.61.50] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKlq-00000004FjH-3q3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 01:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT0ylzbBkByNZ6FYeQfJt01CJ/Q47wOAcyT/+GQgoUK6kmXLcWn8L2z998X2GksnXtS/90tA7svCNL3/LjvarAS4k0ztgByNOdCKd34AM2y1SMlgqnuzzbIUvOUIRO0LTVZTfdWfvjVnoyZF/FjspYRy6os00LreoFsXry2vLRe+ThO+KojHPTvnX/BdjMgQNi+bV/IN+GpA68wGD9duq80QXdNODCwzSu2uT+DMOcMUIIc7zPGOGdTjfD7/HAui3PFEjCtlam3yxaMGuZDIwzpeYCKY9hUNawPJRhlRGwSS++SBXxOBXLdJygeK+e9n3VUgM6M63CMIbkczBEo6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwb4Q1HGWCz0L0tsauW3CL44/AG47jALv7rAmOiSVb4=;
 b=XfotPb+9B+dfNp9RSphiI7/1jTAPwjpmrH/raMV9cTHwCb9U/sDloXL5+UxjLDPe7wG5404sZaVtS+XLmiwSVidIbBJ4vS+JaG/hSobEM6ndJtrI8SZ1l0h+jIbrLu46SHAtkXmQs/UPIB9ata0If5YuWgoyjOcLwoVJ7UkeQxbD7/ebFb9a7i8e6YCdYlMF54c+ySW3qaVArJ2ktFgHhgXhIkO75a7LsoDZrDwoxSB1c8IguPSADOTUnjfdJrTYAiIjaIS0/Xl/QDBO8F0/AMDADKqmW0DmtqaEbTgi5ZSwFST0NC7nK/7xqZwWQc3CEM8Z5y/v1Lq+2710qDZjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwb4Q1HGWCz0L0tsauW3CL44/AG47jALv7rAmOiSVb4=;
 b=W5xTEbYRHGOiYq5h4QNErDVPVAjaglprwlZjF9tWCHGPh+V59HwKtKQEJoscRVIMFJURx6sEyz1cY2DC5XXHyy6R2o0SW2ksApS7OiDt1RNI2QzALptbPt9iFaN9+2p/Yjv93e+hpn+jFUGP3sJvsb3FRT23lREfUVACFlsGNzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 01:21:40 +0000
Received: from IA1PR12MB7736.namprd12.prod.outlook.com
 ([fe80::2274:9fed:8f3:8550]) by IA1PR12MB7736.namprd12.prod.outlook.com
 ([fe80::2274:9fed:8f3:8550%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 01:21:40 +0000
Message-ID: <0ae1a3d0-cc51-4d5f-997c-04d3114121ca@amd.com>
Date: Thu, 14 May 2026 02:21:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] iio: adc: xilinx-ams: refactor alarm handling to
 table-driven design
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
 anand.ashok.dumbre@xilinx.com, andy@kernel.org, conall.ogriofa@amd.com,
 dlechner@baylibre.com, jic23@kernel.org, manish.narani@xilinx.com,
 michal.simek@amd.com, nuno.sa@analog.com
Cc: Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260513003503.339418-1-guilherme.bozi@usp.br>
Content-Language: en-US
From: Salih Erim <salih.erim@amd.com>
In-Reply-To: <20260513003503.339418-1-guilherme.bozi@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0098.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::14) To IA1PR12MB7736.namprd12.prod.outlook.com
 (2603:10b6:208:420::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7736:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3d576d-7954-42ee-5929-08deb15726a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: pArVlLKAtq8KN4Z2L9YmJTwvxWnyMrL+qr4tT5HxXQo7cvPOzEs8mJUsBx3E7WDwqvykNWRIbqUamCBSQ4Zq0q0YbCt1hCUJ+DprmCM4F1etIWhHpXVCx16b1v0Og7EK58hCAqql7bZalsvxTq3DjCV6Yrw5GY8YAlHsE/uFo/YpgMBjieJaOThBp0SI2yHdcYFzWls17kaXMauxCAdIXtWMyAejFVNKN7XoauHbKzKhf0iZ+Op4H/tllH0DhO6n6D/o1lkuRhQ7mSnPeQMdH/G2dN2j8zbhqynt9diU6QxyQU1ZnGLlUky/1zgpKaAkN/+jWc5wzJ3m5D13r4yA1EHAokswj3RdIqp8CbtWERT8YzKvFG43mVEcUL3KE2btMkLZCzyzUAQGWQ/EaNKEQGjaMKFpt4v5raVyLzT3qU97CWyHr+iQ2E1lZ23rmv3AHN/ZrHV3+ke74cs98rAFzTK+64OWZ9314IRsK9RGsHwWNeMih4Wkz9nNHnuz21LmDd9+Ud3muzX3joG9tfr7MzBWJ3S/IPs7jpaKCKj+AoDXNRoLAhayh9fkaUtK2rzg+Ewi9PsWqWPee7f3wagafzlSQrLgZznYLqmqeY5IM7eiHlG77LO9NBh+JHP1X5PAIgIKqO0AARs3hVN0w5ArKDRGpFgvEoLl8b08gU8XhQA+7Pb8aFZ25DaXaUcbscmH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7736.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNseGN4N3p5ZkVUSE9xK0grSXB0N3E1a0MyeWlxYUhRWFZTajZNcU1CaXNZ?=
 =?utf-8?B?YWdJMThhQ2svSzUvTUROVVZZcnhFSnNJK3lPSktUZlNoV1VpVDczb1FVWHdi?=
 =?utf-8?B?UlBwMEY2T3N5ampiWXVaMHhWak1zQWNmcnFYOWpQUFhPZ0hKdXhYRkd1U0Jk?=
 =?utf-8?B?enUwNUhMYXBMSVBmRDlFellsN05rdUt1MkxMemcxVUd6TCt5dFZZT0tvQnh4?=
 =?utf-8?B?dFBJeTZta2FNL1ZhQjEvc3JHMkZzWTV0S0tVRmxpWWxZU0UzU24rQ0tDWTlY?=
 =?utf-8?B?anQzZTBXZ1gzUjFFeVkzNVRuSTdUS0RLSU5mNlFPdVJLaEQ4RXNCNFNicXRW?=
 =?utf-8?B?c2VtaGxFamVNMVAvNjZVcTBCbWJKd3cwZ2kxcEdLS08rZjZqeXorQWxvZUJW?=
 =?utf-8?B?dEdselE1VWhUd2tUVGxCSWo0MGdMUjNNUDN1bmwzNGJJQnV5c0lGZE5peGQr?=
 =?utf-8?B?cS93WE05Q3AyYlFlUnZYSmZTaEFrTmJIazYyMVBnbWdiQU9XSzQvTUUvV2Z6?=
 =?utf-8?B?dzFlUjBOVnJ2VEhpVXhSTll2OVR1bk1YZWRpWmlPTkhnd3prWG96TnhHaHpI?=
 =?utf-8?B?eFNFQ3BlWERuaTFxZmU0USs2Tk04dTVwSitmWmhYZ2F0R2FXcnE3YWY3S0Ez?=
 =?utf-8?B?MWdGRWVYdzZMT29OMFZsd1UxSWRhMS9JUEdNSXBieGJPZmxEMk5wREZaVUNI?=
 =?utf-8?B?Q3g3Z21YQitudjRoQ3hBaVNXbWo1OEZuR2xFVkNlL2tjRHp6UGZ4MEUweTZW?=
 =?utf-8?B?MTNYdzhwRDk0VFBYQmVmdk8yOE81OWpzalE1dEdyNXFGZ2s0MFFJcmYvYm5h?=
 =?utf-8?B?NW84UEFySmNvR0RBSlFjczgwQzFvUGVxdzVocllycVpFUVd1MDMzKzBrWU9U?=
 =?utf-8?B?akFXb3NJSkFTVWJ1SXAxTGdmdGtBNGJqVDdmL3BpUTAzU0F6aC9GeURLYXcr?=
 =?utf-8?B?UklpK2VYZmxWTC84N0k5TURubGRDS2NhTzZycHpISTd1T3lUbVF2elBxZEFJ?=
 =?utf-8?B?UWxkaUxVc1cxNU94eUhYa2dRcXVDOU50Q1pLNzBzUHMvSDdvM2xta0Y5WVoy?=
 =?utf-8?B?dE9ybXZLYnUxdzFMcU5lZ3hNck1YSm40ODlFNitCbnZEMnkzU0hPUkJVb3dP?=
 =?utf-8?B?SXdDMmhpSnZBa1NBVnU0SmlXcE1qSTlxRS9aZFkzNlpNYXYvMzRndG1pY0FR?=
 =?utf-8?B?S1BhbnVMVzlTWWh4WENrTXhFa050VS9EM0FQc2czVGNyWTFlYVBsTko5NzRM?=
 =?utf-8?B?dHVzOVUyOFJ1cXNkeGdDNjI2SmpYaXlMV2lHYk9pbkpyZmZGY2NTQUxFMmVG?=
 =?utf-8?B?N1VmdlNQNWIzOExkVnZkV1hlRW16d3JQRGJTekF1UlVtS0JMUGVTaDBNY3lu?=
 =?utf-8?B?NjF5Ym8vOGlCYnhxemV4VnNyemxaNytsMkR6Z2MvUGZWYkNHWFU2bWRQNUVC?=
 =?utf-8?B?M1k4WWlTT1FRL25RZnprY0pPRVZEdWRtSTdtRXRlUGJsQkxOeno5L0x5dFpr?=
 =?utf-8?B?WVZCTDhseEtjVHdvN3RXSDJyWklHZFp3Z09xMDVkQ1Z0eDRDNFNvTTA5b29i?=
 =?utf-8?B?bXhROHdpdUdsVmliYzBybkFMeERHTldDTnVJQThyeDVRemJXZWlwZjdhUjF0?=
 =?utf-8?B?V2hpOXB1cCs2V0lTdGdGMjg5L2xKVmp6UkN6TWtIbzZiRWc2TU1uWU51WnZ3?=
 =?utf-8?B?UUxjNWFpWG9vaWlWcVNLTGpnN3U4RFc5QUYvYVAwcUpDeGluNzVYZ3hEYXdR?=
 =?utf-8?B?VlExRGNXZXNXUVA2UlNRUEdkbU15aFlDVDlwOENRSUZqd3FidVRjWk5Ld3Va?=
 =?utf-8?B?V2dYVm5lNWtPaWpZLzNyaXJzTjczNDdzMDVsZyt0UHNBVmQvSEkvWENkbkFn?=
 =?utf-8?B?SzFHL2RzVW1iQ0FtZGkwb3BxS0o1TFVlUHNXMHh3c01sK1VCM3dYaDdkL2dR?=
 =?utf-8?B?RHF1eEFrVnRIa1ZQQmExM1pjQU5pZ1RRdmNNSThZOHZtbkRTL0M0MkErVEZD?=
 =?utf-8?B?RjJ6NElESmplSEorbkNzUTlzcWp1NEF1OVoybldTbHBCbmwyZnhqMi9GU1F1?=
 =?utf-8?B?VlhLOGViQlF6YW1CSjNVaWtEZjVFUkk1MklhbTB3MXJIS3ZiYS9sNVN0c3NU?=
 =?utf-8?B?NTZPbmcwTS8wbGVxWitST3pvdjhERWd0SkNDTm5Nb3FMZVkra2c4MFJyMEVj?=
 =?utf-8?B?cnR5SmE4QnlXNnMrdHdma3k4U3RDS2xRTEZVY3VYWDZPZmFwdEVpNE8rbTBp?=
 =?utf-8?B?QTNMUkhtY3NWcEhXMm9vU1FHc0VYb242UVptNStNSmowMGd1L3hBNXUzcVBS?=
 =?utf-8?Q?/awRSnJCAtr17RON1w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3d576d-7954-42ee-5929-08deb15726a3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7736.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 01:21:40.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+KLwa/PCArwfCGrUszsQwT/vyWysl0KBzpZSeBYlOgcBQto24m0WCOsSdML2CYw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_182151_136939_99142670 
X-CRM114-Status: UNSURE (   6.23  )
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

Hi,

On 5/13/2026 1:31 AM, Guilherme Ivo Bozi wrote:

> v3 -> v4:
> - Removed unnecessary 'event < 0' check for type e32

Thanks for addressing the feedback.
Tested on ZCU102 Rev1.0. Driver probes successfully with no errors.

For the series:
Reviewed-by: Salih Erim <salih.erim@amd.com>
Tested-by: Salih Erim <salih.erim@amd.com>

Salih



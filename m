Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E7FD4600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs4pNX1CHtif2d/wOrg3qke6/nQrVUtxWXicmpsz9pw=; b=p/4yGn2leZBvkiMrmv1Y0oGRSK
	pFX5gGsBHYLRX3TRXGuw6JbuWr/27k7ti87vmMk6JbJRHWK7TSh1CWsWGUYSThCZebp6ajEi99/sI
	Sj7y89G8mVXGhK955L4jErIFWB50EqBAoPC396i+Xz3pOS24UwR3iMYjmmgdd49IEuiJFKbpwXk8A
	47sMtI6Wa6Y/e/sG0ErTBkC/qe+ioS3I0RDNgpcdSUcpi6ZZZzmU5mX51lfrpGKjEte/52N4AaZMx
	uuMRX5LtA0L+SzdAp8SLtxh5Zw2wLvC8BllmpWYE5wuk2Kf/yXDPr9ugpb+Jiuup+f+nbCQKs8fHQ
	D+KfEO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrYj-00000007nTE-3Obb;
	Fri, 27 Feb 2026 06:42:45 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrYh-00000007nSN-0okt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3w29WkRaq8G6FFjci/A3vEnpfAGty+ikySYc0B1uMDpA70VB8WieeRrHs3/WG0ZDJY4ZmE6XYslY2qDW7EqzwYMfKnbt9tdXWvFMy9YHn9j7q688ZPrcpW3bviZHBNVLJFXrbokoik4do4I4Og6ukQTs9BatDIh6pIC8keH/M1fFcwZnFiu3AohNukJsN22+gffiUyjYyY6OpOnUhDrqIc/orbY++B1fU1JzulMPzxEq7fP5/xBb7n76N6M58UTOj2rYHw0KwzlEQTZxS1cLtOh+zsH/ZWyPKJOwITzSSxIjWsTZAcIeJZa2kng93gDQ2NnRJvQyUq71auPPtxWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs4pNX1CHtif2d/wOrg3qke6/nQrVUtxWXicmpsz9pw=;
 b=o4iuJTjA5Px7ohcyulKXwKGr5WGME1+ExoQpneK0dsnPAAWTDxX0ZlRDckPMCAvMk4AH8pCYi6gzBI5LZPimR3njNs2mtdevIhJfmUQcbJkLMorI0og4fkR+ocTb0R6lDuzrRiQWzWS7V7uGpDjeKvSDuotZR2CzpvBbpxA4Y85Q+1jqLOhxw2tGKRBY5/XdAOhXH+/LN91vkmzdtv7zvekoGoVdDYh9uSnpTNOndxAL2o0gswvazdiI4QJW8O6C08egAOWY6Hu8JxpCLzkVw3rx+9VjKp7J8Pw90UqWQCwd6Yy9olU/WTcn8N8vptEteGx+FF6pPhzqh0/8UwFsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs4pNX1CHtif2d/wOrg3qke6/nQrVUtxWXicmpsz9pw=;
 b=M/oKjXJQNfJuD8WMI25MGv9OcEw3aTH3yfIYYwYYD/pc1zb9L1xfrZwimOB3fcwzb+0FlPYncmz6MmTzd5Oo89M4kP9uUCPe9abCnBgKt/aFqZIGKsPQ+RKlUnu4GDrQdlLW+kRTTMoNrIi9JaEqn39niedzuUT8zcswWpsAcJd5hlzV36oZp52lAvz8us4CCOf8n8dGDlvwPFXUsb7EyYOv0jkX2PMz7HUrB3VMlFEZLZABoHqwCKNRbNoW1+zCfsR37+NbtZBWMBKoTFE0ib7ogw3gBOEyxNgyY343NZVmwe4XhucVXQRbL7xnrWS+tY4hwEq+1e04RzssqN0n1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 06:42:36 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 06:42:36 +0000
Message-ID: <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
Date: Fri, 27 Feb 2026 08:45:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
To: Conor Dooley <conor@kernel.org>,
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>,
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>,
 Rob Herring <robh@kernel.org>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <20260226-unthread-reformat-92b855c4acf9@spud>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260226-unthread-reformat-92b855c4acf9@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cc6583-34a3-49e9-4dcf-08de75cb6451
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: QTDRE5jtkdJ2sq1/96mrGsau8CMjqOOFdvsNLcBNTbOYP38qYVX4JOMFfwjPNZh8LFzztXQHOMSc3nFR9WF7FxmTKTlyIjfJCMPmXTbfaNd4PHSrkjQ2Y2RzF+TH3gzNOo7CDRMJsB3p1qzZi67vydTB3Mg+Ah4YQMGM37WKPO2e4y06TkzR65Er3iMLuTSmT8R0GIeWD5kYfLmmy6s8+RqHUo4r33PhuNv0f+r8Jl9muzx7gnlQMewLsEGZ59osm+1/t1GFDGAkgubaURGhYO+4S4++U1Z0rq37I8mMvrSxUIibTIvafDc6aPEGdtoFn2gkMdkxnVuHmyi2j20Q6w26XzdlWjSiyBHQf2jzZ814Svhrit0SaeHhENhcDSn+8p4KzMHQh/IQIpFzlzkmr/lAjLBLGnCCVdaPfmVjbLsDwQOK8XXyZoWBFW+gq2GQeKGdsTuCslot70jZbJjVVno2KG6m3RPmbKIP+7b7k5bi74gt4SMFCAKHprI0TU6ALP0l6+wvj6h/WLP0wGvRUDD9aSchLoCcpk+AEYpUZvRWB9ZisPkP3mQKKx/AxQZEZ5EFK4OJGPy6NdH0YiNo/oAkpmfO6FKm+7dEYg90wp7hGar8VvWK2A6BFlCJHTeLJM1+sAstKWBtqnmI0P3mUxK4O5vWba1LVNjaLqOTD8XHZyjrlTdigDUe92xc0JcrhHHctD/mvWwo2B4gjOsvEuyJV2IPSkOakvw4GcpKPBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFuN2V4QTlVbXhuS296V0cvMS9jYkJqZUZSeVMwelg2eHNHa1hJNHhpaHRv?=
 =?utf-8?B?cXIwcmhPbVNwdEVTZXpxZ3lPZEpFd052UGVpOU1qT2JuUGtQWlVtYTltZVB2?=
 =?utf-8?B?TU9VY1dVV0UxbldhK25TaHlYMi9ReEFHUW1BclNna0IzZ2ZBOHhqcXUzTnB1?=
 =?utf-8?B?eXp2RXl4SzBFRFgvNHJrMlpLUmwvUGFsVTVMbHVGaHNCK1FuRTlLUHVxcWZ1?=
 =?utf-8?B?UCtnSGtIRVlLRnJrRGg3MWR6ZW9SQ0lrck51RER2RDBOK0NVOUVoTFdtanJL?=
 =?utf-8?B?cm9NZXlybm1vOE93dExZTXh5aHI3M0NDMWNTd0xZVnczZXRiYXBUaE54U3pH?=
 =?utf-8?B?TGZnRlYxcllLdHdLeWcvTG5HMHUwaitpaVVYOTlTVFhoM3Y2TTY4MWZaWWlJ?=
 =?utf-8?B?MXc0VEwzb0hrbzVzTWg3V1c4bFhRblQxRHkxMU9wQUNnZ0VFd0t0Q0taQnln?=
 =?utf-8?B?NXZlbzNKMlVacTZPL3BPVlFpRWJ4amtVQ210ejZsSE0vQVZoWk9KQVV2cHRu?=
 =?utf-8?B?RU9SV2NNSjlubnFhcExxQ3M1WjkxclQ5VWVNM3BPS20yVm1STmY3ajN6Lzll?=
 =?utf-8?B?c05ndWdqOUZoR3UwOGc1Q3JlWTdFcklmN3dVcU1tUmNsZUNXRWRkKy9INjl4?=
 =?utf-8?B?alJTeEFjUlBXbytEYkgySnJmcklCVGp6c3gyV3MrU0VBdHMvWG4xdnp5MzF1?=
 =?utf-8?B?RUZiYmhYc2lhWVFjeEUrNmRRU3VuL2w1UnNIcVJJaWlTU2h5S3RNdit2aEhU?=
 =?utf-8?B?VzB0OVdqaFB3NDZHc1NlYUNYcGlobWRyYUVYVjZhZnNWRGVmVUk0NVVmNzEw?=
 =?utf-8?B?c3MyNVd1bTh3TEhGZDZRNlNpMExNSmpoZUZPNkIxeHNZWGVLcDVjc3ViTTR2?=
 =?utf-8?B?TWVHc1hkZGFLWmcydHJiR0FvbHlidGhBNUZSZWY2V1pqVDF5cWtvSTl2WnZO?=
 =?utf-8?B?NS91TXRLMjhzL1h3MnFDVllJdWlhdVIybFF5Vy9oQVJZRVNHUFNGazF3Qk9i?=
 =?utf-8?B?RFVwWDZ1SjQzdmROS1doNUE3VUNNOTJsMEdLMGVzSEpERDVJQVF0OTFQMkJk?=
 =?utf-8?B?ZjFFN2thYVI4WFBGL053OWtjUGFSTHNBR0pUSGhVOFBtNFNEOEl2NEYxY1R5?=
 =?utf-8?B?bHpCWTFjcGpobkdSTExiY1VwaG1mbEdYZ1djOEFiZkNITFNaTjJPRGttOHh5?=
 =?utf-8?B?cUpZc1YveU5iV01FT2JCVlJtRnNoQU90Uk9FK0svVFpsTUx5c291bGtYQzUw?=
 =?utf-8?B?ZHMvUHo1VlNyVmRsUGJQYXBVZ2pHNXdxUmZ0bjhhT2UvME16M3VEU0JjTVFM?=
 =?utf-8?B?N0M1QzNLTlgyVDV4QnFYMkptL0lMZ0lHU2RaWFNSM3ZiV3Qrc2owZEhrT0Zv?=
 =?utf-8?B?cGJ1NkkzajZoQU5raGJkU2lFMGNHOXg3ZlppWDM1NkwyNTkzTCtvREpwbjdq?=
 =?utf-8?B?NHpjNEZueGMweGlKckQ4NndCVkZtNWEvMnpJeEJ1L3Q3VDBJWmxUSWo5cVNo?=
 =?utf-8?B?aVBoQkw5SFlYZktkbmtYcUpCWGZ3VzUyTmpHemtkbFl1aUx2QXlJUjkvSnV3?=
 =?utf-8?B?NHJVRVM0aS9vMVo3T3hhREtmcW1NRGEycUhUbkxXNXhxYTYzdTF3NGJ2aVRm?=
 =?utf-8?B?NE9pa1dkdUZKa2w3MjBpWld6cWRCd01ybjZpSlMrRms3L0U5Zm91Q2cvY0g4?=
 =?utf-8?B?QWsxRWtaQ0szbHNncGZOLzVVekpqbk1yRW5YZlBvc0FvNGNBY1FVN1E3bFNT?=
 =?utf-8?B?aUZwWWVtVVEvNmFJMjMydHJvUVA0bjlJRFF6Q2YzLysyMWgrWFlXYW8weXRh?=
 =?utf-8?B?RHU5Sk9GWG5TUGt1cFNvUHVNTDJmakdEcG9jV3NPWE94MnphaEkvenA5ajRp?=
 =?utf-8?B?R3ByaVI3ak5YZ0hLUnNCM21NYjlBZWFZSzczOUt1dlp4MFpzeWE0N2VQbVV4?=
 =?utf-8?B?c3hTVE1OWldURU1qYkFyTEVVVGkyWUZUMDlIYkw1YU1LZ05KZFpqSGx0MWEx?=
 =?utf-8?B?eHp1NE9DL2xKS3lidERUM08zL21kTUhjTUkxcTZBbU5kNVFCOFBKY1dXclJy?=
 =?utf-8?B?Qit0YjhiQWxJdW5wV2ZyV3lKekdkd1JXdGNTUGRzb2VZaWlmaWd6Rk55QVFZ?=
 =?utf-8?B?RGFQd1p3VVR4OUswSTJFM25KendGZkJGVjNQaXkrL0F0OHpZUEk2YThYU3NF?=
 =?utf-8?B?eXZwZlF3Ni9HRUlwNlVJTVZJdDNuU2Izd0cxYzZlZlJ0cy9pdXA1amhjWEsr?=
 =?utf-8?B?ZVVNSFNhdFp6TktmRTZ2a0xiUVRJbk9NWmZNUUJPVDBIbzFUeDZhbVdiUzlE?=
 =?utf-8?B?N0JjY0luNSttZWYrb3lscVdvQjB5WWwwcWJhNE9CUDhHczFibkxkQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cc6583-34a3-49e9-4dcf-08de75cb6451
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:42:36.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CZrlWE3LHoWj6YMtjPcymVpk3o7SsJDz/RBgyZsZDR2TH4TkCpv267XHuo3oze0DmcpbIcMNXdJ1vGPC7pKhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224243_235043_4B987AA4 
X-CRM114-Status: UNSURE (   9.79  )
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

On 2/26/26 20:20, Conor Dooley wrote:
[..]
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    bus {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      neutron@4ab00000 {
> "neutron" is not a generic node name. This should be something like
> "accelerator" or similar.
>
The only dts nodes I could find using accel subsystem are from rockhip. And they use npu@

e.g:

»       rknn_core_0: npu@fdab0000 {
»       »       compatible = "rockchip,rk3588-rknn-core";

Also, Ethos-U64 introduced by Rob with [1] is using npu@.

So, I think we should go wit that. I haven't seen any document to standardize the naming.

[1] https://www.spinics.net/lists/kernel/msg6055856.html


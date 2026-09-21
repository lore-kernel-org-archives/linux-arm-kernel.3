Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB14BC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfwrZ1l1xWllxNEp+4vsgJ1d4hwB5IV+M8WuKlr3+Nc=; b=ujxYjQLOJYRLj26qWYgkm6xEnn
	0V9yfc5toLbksXo8+UL4ggBexkFPC7ZTnN6MA/JjioYszP0/WGUeeOcVt2v2bXA5hX9TQJymULrkx
	1HfJHCBXIryDTDLlvChgHtp/DzQPQPWwtNoHXGYTwX4TDJ/6Ku1vNlaogx+JdmNWhu6xK1ghpVou5
	OMiKz7pLRLEwQMb8xzIWKPzRus4hMULbF78ijLUlw41ejlT5ovw/u7EJWYDdmGih0yaqWuASd4kLV
	j9RQ39mieBuucOKpP1n+xh7YWa1IwAvJcgRa/9+g9D5lcPTlQaMVy9Skg7QQ73/NI0q107LfnL0Yr
	HYVw7R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cEm-00000001vBJ-2NaE;
	Mon, 21 Sep 2026 11:31:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cEk-00000001vA3-0nEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuPZzcgtJY+Zfx9dOqIVQJSL/kjFFUF5j/J/QocitsmoH/ttAth7KMaX8100D08xaKmao/zpRiVJLhQ4fKmd/gCheIWPEiIvh0FgrmEGq/LWPAgy0t/3V5/ddrlFmf4yFGSBmShhLSqCk81FfxujH5SLxpiRGghp3YLDdQBX2NLadoNexhejd1G1q5dtSq2Rd/UJJrJgqs7ARPhqlaOoeUfdlAf/havqix5You3/wDryj2XgP2JeHSN+MzVbV+ppZuuCVXr1QWiIWXvgsBDoHCEBRO/cHxUaTUSfGXYkCH061qtLigxaEWkBN6bq8w5SXjPOBrzNyPnTtWDe9IqhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfwrZ1l1xWllxNEp+4vsgJ1d4hwB5IV+M8WuKlr3+Nc=;
 b=nBCteG+87zFLOykWkc4TSTGfaQSQ6vEeuzb5f1+Q+AtX9jz6UCZpZSAH1j9A9YTHjUTrtpf9TedftFoVxcOmQjJUmXwONFpXsMwxC1/a7yhx+4umFJhcAFInUXfepftUAioxubBkaTNZSY76iQd0YgngW2quIpwUc7dLh80Q6iGt/Vns5sO1pKmxKCfgVu9niIlgpwYTL0ItKmOL14gribEVj/rN/k2Lcji9Ln/D3E2EyZmcpM50Njve0oQF6feAJTQA9yxSDASL5y0RMJ2O5GRzDdBceI/WAz12Yn9+QLvTm/o9brIbX01yxAPj4UobulM3WJPi7My4trS9vapfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfwrZ1l1xWllxNEp+4vsgJ1d4hwB5IV+M8WuKlr3+Nc=;
 b=s9W7jaGh9q72MSBRUcS9s/FpZ7FAPH+ScpadbZdxrIzdzB/emzlGTTuIiEeOJS9hVjpS6AkoSExxi32NNFpph9KdAgbiNF5BLhOqr+UgeQLBCcaSR6NNTJc8LQdBOHqzuXTHU5ru/vgp7PCyA7fZWgpDQ4c97ocWowDkcbvinGmDWaB3BkEk9DfgOLEQ9jQp8qS0M9pbs6V4blBAMzVGhz/1GrT5Gy0ODfw1bgGrgQRbM2zu0CAdN+uBGgMp6g3sR1GFRnm9/A01FhknqF4X0+v4wbJOH6vn65AyqYYBMJy45KRs4C/gVeUYLDRG6WjNLiWXxrVV1h4E1jw8+bVG1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB10637.eurprd04.prod.outlook.com (2603:10a6:800:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 11:30:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 11:30:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC v2 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Date: Mon, 21 Sep 2026 19:34:59 +0800
Message-Id: <20260921-smmu-shared-sid-v2-0-4b656ce68178@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMWsWoC/3WNwQ6CMBBEf4Xs2TUtFkRPJiZ+gFfDAdtF1qRAu
 kAwhH8X8OxxJm/eTCAUmATO0QSBBhZu6iXEuwhsVdQvQnZLhljFqTrpFMX7HqUqAjkUdkgmy8r
 UGmdKBcuqDVTyuBkfcL9dIf+V0j/fZLvVtWIVS9eEz/Y76A3+ezFoVJjo4yEziTIF0aUe271tP
 OTzPH8BAZUPs8MAAAA=
X-Change-ID: 20260916-smmu-shared-sid-e488f6c4d4f0
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Jean-Philippe Brucker <jpb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: e81bf087-6ee7-40b5-db4d-08df17d3cce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gypric/cCF7f3qIXsrx8hpAFgZLie8PM6YtWH+stLDj2gteAUtPU9LMp6Lp+HZyzIBVRPHn0cuShEQZwP0aewfJhf4fKyIkocaE57L8pCvHi48AutixmpoYjHbvu7vJPLM1pvPnX3Rxe9tvanVnjOSV+CKV+NwE6LWEV1Ig9cnsHBzpZYnWLLE2teq8RpjtLli530/WGTPyv7eOLcmKsJaWrQLcdW1fO2igp+g80ghkLXpE3ZA/tzsr+HkL1h0wQINNZfahH0g10xeUx5yxf0wyPYKUugDvp7r1066ZMZpx7l5UMFxztIIGrBOWO+H4wtDYuSo9VHDRRmdFlbnBeenFIsqldLdm/RAYNKZU+QKaXp1Tu8tGSxcc/O8d3+h8l3R9AuQyB38VYCoEP68i+cs88k7O67OZUa9meL/htf35hpSDFN6+Zix7zhmbBkBwSrgo2jaGqsjn160ji1gkVZAOux4+JqqaZC/sndmISNERaE+N4zDj3/JQclSf0WCMjv0NG1bHW5s5IsGs2Fy3t3dLcGCOqUUll60aLw6F/6nKFgnebdN+5ZcsADcDDM0nm8hSrVi4pkdr7YMzkMizhT5Bcf+E5aZLNpCj3kgq42l5lFW1ms6roaMCWp7+a4tts
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enlOOEpoN054Lyt1QklTU1NramRkdHhLWUc0Q2V6TXQ4K3FIei8vMTBMb2w2?=
 =?utf-8?B?eEVXYTBmVkEzYmx5U1JLaGUyQUxYWEcxVExPQzJiUG5QOUtRWlVBNnk1TjQ0?=
 =?utf-8?B?Q1d1TUcwV3V2NmhVd2ZLZjN1M05MYjkxbHVhKzdiMlp3L0FSZUNabnlpV2ty?=
 =?utf-8?B?cDNuMU5iT1FkMHpxT3JVQ1ZaQ1V2dzd4OEVOc3BrNVdFWFllUEp2WWZ0MjFQ?=
 =?utf-8?B?V3ptRkNIbEVZenVlZXdZL3l2YWR6RkpHbmdUbWQ1aktKQUk0REJ3UjVXaVA4?=
 =?utf-8?B?Y3d0TTJOeW42c1piYWg3ZThmbVRReFd1Y2ZIWTRkUGZ4K0dXcmEySERMRDNV?=
 =?utf-8?B?TzNWeUhRa0gva0NpM3lOdGllcUU3bW1qbWdKdkRWblRIaGlJMW9sN0xjVmxR?=
 =?utf-8?B?cXZWQXBEQlp5RHhUTW9oWVU0UVdNVnk3R0czVHZyQkNjYUREV0Q1QndubTJu?=
 =?utf-8?B?ZVNpYWczWHJhdTZLZCs2T2YxV2dEenh3KzBpQWRxVVh0WHV6UHN1RExzaGhM?=
 =?utf-8?B?eGRXQ2UvbDZVM1dnaTErVVFPbVBZbTk1ekg3clpHZEQxVTRHeWFRS2xPZi92?=
 =?utf-8?B?RkZ1SElBUHc1UlErdTFsY0U4MTlYSmZnMXVCMHR6dE1xT044Q1JYWUROTCtX?=
 =?utf-8?B?Q2RqYmJXWXVFU0VYeFRDWEpkK0swa2tIRkRPTEpwNTh5aTdmMXlSN0oyVmdS?=
 =?utf-8?B?KzlMdjl2cUpHYndOU3VYdGhxa0JSV01EUnpIOWxZMDB1OGs4ZVlnd3FnYzhW?=
 =?utf-8?B?TUhsUi8zK20zNVppampQVEJVVlF1aGxVa1ZkQmpjeGVUYzJqMEpkS0ZQVlhh?=
 =?utf-8?B?TGd5ejBZQUdwMFRkdnNJbDAzSG42UVNwdFl2MDc2SnlBRk0rMnF0Nzd5NTlQ?=
 =?utf-8?B?MCtRbGpZMFhjMks0VkFhQWgwcnhJZDBJZENsRzV5K21DMTJMamZ5WlBXVWs4?=
 =?utf-8?B?MnNmdHJvV0ZtMGtHRkplcjBUZXNnQ0xEZDJjZjc5VG5qWFZCZXVUYnlsM2ho?=
 =?utf-8?B?eFRzKzFVemlqS2FZcHpRQjlYd0tkMmxXMGlreGQyS09aN2xQZ3AxK01xKzBK?=
 =?utf-8?B?M0lEdEtScFZldkUyMExuWVZEZDRqTWtZNEVYSzk5dGlOQUQvdVp3eWE5bGRH?=
 =?utf-8?B?ODJjc1hSRXhxNDk3a0gweGFHVHJ5L2Rabk41MGlqNGxxVWJTcmtFajh5VmZH?=
 =?utf-8?B?V2JoNkdmSzdPQ0ZuaFN6ekFkb25Zci9PNEVLN1U1OXRvaDgwR05ROTRoc1kr?=
 =?utf-8?B?UytxbjF4blZBa3ZmYllyeUUwQTk5RUF6RStRbU9iSHJrdFZHYVNCOFI1Zys2?=
 =?utf-8?B?OFRkTCthR0VqZmhLOURuK01HZXoyN3RpRklBZUQ4bm03a2xJY2pjMmlTVVNU?=
 =?utf-8?B?ckFNZnIwVUlVM2wrSVFBdHNwN01jRmF3VDhPcDgwMldMNW9lUStVQjZDNUhP?=
 =?utf-8?B?T2ZHeXBmSmdJNXFoZllHZFVGcmFaSUYyNTRPOEJLdjNJeTRmUFhkdjRhRS9n?=
 =?utf-8?B?Qm1EdTF1dll5YzNFYXFqK3FHN3hUSHo2dkF5WE1icFVaajl0RFpFRFRIZUdo?=
 =?utf-8?B?dG1rY08rcDUrSDdkRjR6bGRkWmI2TDZ3dkwzTlMwL0xHdVdiZnN0QmxaczUz?=
 =?utf-8?B?RlF1TGs1SDMxR1p0a0NHaEVERVF3OTRNeUc2TnRxcDNmSkNBOC9BSEd5Zm5V?=
 =?utf-8?B?Zlg0WEZXSXA0TUlFTGJyZFg2TjlUVGdFaUltejU2Uk9GcEd5Z3p1ZGdoMzVr?=
 =?utf-8?B?OGhKZnFBRmw0SERJQWFTYVE5UXlaeHdNWExQM2ZtTXR6Z3JmZnUrQ2hsbjdX?=
 =?utf-8?B?aENpMFdjdDg1ZGFSQ0Y5QkVTK2hTSE1vM2VOTHZYaVpzWjA5eFdUUEhWTG9W?=
 =?utf-8?B?WVIrbEhyLzd0ZVZUYkpnU1JkdDNQZ3NpRFBXWnNpazRqbWdkVjFUdzJtZW9K?=
 =?utf-8?B?S0VhL0NQWE9TckVlN003c3RVdENLbHhSb0VhQjZLblVqZUhJNHVYYzFuQ3Jk?=
 =?utf-8?B?WXNKQk9sTGltVXNzN0YwMUJYUHZZZUxCTmZkTVhBcW1yQm40V0hSenV6TW51?=
 =?utf-8?B?SVA4QWZkb0FGckhvdzBGK1B3S0dLQ3hRVFJzS09GMFozWWc5SHdHR3Iyamd3?=
 =?utf-8?B?L1BsOVdNZGxwZHJ0enZpc0E1Z0s5N0cxWW5FbGJ5dHBEQVJ2OVZuQmxyUFFi?=
 =?utf-8?B?eGQwQ09RRDdCaS90dHloWW4ySGlPVnppY2NTN2pUT3hHWjBYcWNENmlJczE4?=
 =?utf-8?B?OVpBZU13MFJCZGxaVmFuRUFxVHphb0d5Z3lpQ3NNY1kzZDlhNkhYOVdkRldw?=
 =?utf-8?B?THpnRFgzVi9OenlQWWswSnFZdzdXUmlxc21JYXRDNXU0c0RCRTNlR0x2eFdB?=
 =?utf-8?Q?h0g4phShDj+VEz6TAjRzh4GafBYYCmBhTSgR5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81bf087-6ee7-40b5-db4d-08df17d3cce0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:30:55.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC7LX7Cv2IZuwn7VTBskvA5Yf5kFLeZntVv+V+luGtDSXT+5e08XOl5OS1SBHSUJBVsXl2xrp1P63qaEVE3E7HAe8KTv9u72rGrlywkt4HdValir88Kvr96THpA+t3TP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_043106_237166_DAE25735 
X-CRM114-Status: UNSURE (   8.53  )
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

Some SoCs have a limited number of IOMMU Stream IDs (SIDs) and
hardware that inherently shares them. For example, the NXP i.MX95
only has 64 SIDs, only 6 bits for SID in the system chip bus.
However there are many device IPs, such as SDHC, PCIE, NETC, GPU,
NPU, Display, VPU, ISP, ISI, JPEG, SATA, DMA and etc. Each Kind IP has
mutilple instances inside the SoC. So I introudce this patchset to
support shared SID.

The current ARM SMMUv3 driver rejects this with:
  "Aliasing StreamID unsupported, expect DMA to be broken"

I took comments in [1] and implement this patchset and only want to
support a very simple case that multiple platform devices share one SID.

Patch 1 converts the streams RB tree to an XArray for O(1) SID
lookup, simplifying duplicate-SID handling.

Patch 2 adds reference counting to streams so that multiple
masters can share a SID. Insert increments the refcount; remove
either transfers ownership or decrements. A per-SID linked list
tracks co-sharing masters.

Patch 3 places devices that share a SID into the same IOMMU
group, ensuring they share a single IOMMU domain.

Patch 4 wires up STE write ordering (first master writes, last
master tears down) and gates features that require unambiguous
SID-to-device mapping: SVA, IOPF/stall, and vSMMU nesting are
disabled for shared-SID masters.

[1] https://lore.kernel.org/linux-iommu/DU0PR04MB94172CB3F138AD39E9B6DEEF887F9@DU0PR04MB9417.eurprd04.prod.outlook.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Only update cover-letter to make it clear about why introducing shared
  SID
- Link to v1: https://patch.msgid.link/20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com

---
Peng Fan (4):
      iommu/arm-smmu-v3: Convert streams from RB tree to XArray
      iommu/arm-smmu-v3: Support shared SIDs in insert/remove_master
      iommu/arm-smmu-v3: Group aliasing devices into the same IOMMU group
      iommu/arm-smmu-v3: Wire up shared-SID STE ordering and feature gating

 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |   7 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        | 265 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  34 ++-
 4 files changed, 247 insertions(+), 63 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-smmu-shared-sid-e488f6c4d4f0

Best regards,
--  
Peng Fan <peng.fan@nxp.com>



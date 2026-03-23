Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D18EC01A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wt9HfRwWJSTnHRYt+TLcQOviKP49Gp1hGYj957X3Vec=; b=KA9WIt2MiqXVs+XpTOuAou4uea
	yL1lSdQ52n+BehbxqKf6N3ATNv7slo7p3KPAMjujkiNEML7jOgieWykVgWoDKLYGQYU8HLnldNg2I
	ZBLwMJeJZjmdyKjqhAF4GH1sXoBNaToExNnhL8/2b2uY2QOXd7byYF0ai60a2u2ZIaqtg/Dfx6SR1
	7wTdHL0/VnPyEA7dojhDvGp4ZVEGR/bdo7JxKF8jqOYWkncvUVqEAMuT+/O42UPtdCl/Uv7ZG/dIm
	ni/SuTDtiZ27RnS92iwTRUSyPJPkJyz6wVFWhtfUurmN4CR3g0i53A7b2tMIT0TnCEWHMS6gEBpp7
	iPnI/TEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a4O-0000000GElo-2oGD;
	Mon, 23 Mar 2026 07:51:28 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a4L-0000000GEkX-2KQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:51:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8nmiIloEpXovqfTDO0DXa9SkYGDb9kvPNaLTh+73zpWNjPcNfcM+dXZYzUbz4EmRisMj5DKH2YsXpD7nnLkh+Ku7HXoh/wz4HCPBNsHWJxMasM7pheFQuB1tIhTHHcArlVbKlwUbI/Ts2Bhrr5AerxLbNgZGg4fjT13is0JVHREpenqn+0ZwciANa5H1isSvwJB1PDQ4rXQFtRZFL9DpjCyvtDciOGA0XXnA35s0pw07sZkU6zeQ4uxGdcJRA4PmvCx4Ygzyn4UE85oTY/bRJxiHuuoPLiM5eJmOOMkDqIz9SsBPTn2rYyVHiwJQ3gM57SBjALw1U61DbsbIjXUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt9HfRwWJSTnHRYt+TLcQOviKP49Gp1hGYj957X3Vec=;
 b=ae+HErfdakN1IR4jUzfIT94u64k5jxKfrDD/DbIfDU5o5+j8N+N3oc5+ZD23/pIvVwF2JJLb5odMe2IabHpD4jpDQhX5EFw/+0sNFtM06eXwuBDH6y2uT9nwrO+DOsO4TubQPWf4OuUx3deH4tpMxAeYrAVDUmo1iNxnltxUj18vfo0wsDv6hTSNCm9GX2WVo3dNocQe+jE7yge6IR5HxUiBefIrw1xoSJjNPZBn7Zg9hh7fI/svyH/FBXWY2XPVjEWE7nIzYKiWNPleRkJL4rqcE2s9BlO8cvQtEb6Bs2XrV9i+LGwlaOzWtHZuNyw0SGxCCYEwyUHnjFvO+HXjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0196.KORP216.PROD.OUTLOOK.COM (2603:1096:101:19::11)
 by KL1PR06MB6905.apcprd06.prod.outlook.com (2603:1096:820:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 07:51:19 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:101:19:cafe::4d) by SL2P216CA0196.outlook.office365.com
 (2603:1096:101:19::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.26 via Frontend Transport; Mon,
 23 Mar 2026 07:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 07:51:18 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 691FC4126F83;
	Mon, 23 Mar 2026 15:51:16 +0800 (CST)
Message-ID: <4ba1e549-eb92-415c-9ddb-a00f52de6586@cixtech.com>
Date: Mon, 23 Mar 2026 15:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: arm-dma350: document generic and
 combined IRQ topologies
To: Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@cixtech.com>
Cc: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-2-jun.guo@cixtech.com>
 <20260320-vengeful-violet-cockle-382580@quoll>
 <ab0VoTut0u4f7EVr@nchen-desktop>
 <41254f6c-3ce3-4566-acf4-f0bf764565f3@kernel.org>
 <ab0aYUK1NlUV3riG@nchen-desktop>
 <45bb547e-8a9a-41ef-a5d3-417dc4f35746@kernel.org>
 <dd6ee455-7bba-4734-be84-a7db097754c6@cixtech.com>
 <7967caff-101a-461a-bc61-aeb8fc8f04b1@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <7967caff-101a-461a-bc61-aeb8fc8f04b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|KL1PR06MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6b75f3-167a-4ef5-1fed-08de88b0f7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: SADoJXWlYVk53xriZe+fASFsYzdIjKYNwWZP8PxKIqTOksfYkc8Et3OZAoaIcZ/xhLKb6lA9hZz8WRm9jrWlmYJcw9xeMeIf8SXtN7oU98ATTilWbmOeGVRv/Si5uBeF1t/aWLjVZnzBVxzhqU48Xqajx1zAWO9WxRniC32I6uoAYQnBP0mDl2lJsBzcIdBcjePR8RcxPHxcX0YiUbvOFxZUsqawb063+bB+GGsUrKH597h5sGHPQJfGk14YuGqGg+LvYFzUtmPf2pBGY04/alD/z38Fn/AfmljrrK5EKRHXzceg7/cZApZWNmG3e71ZC1nHbwx2UMDQ8+6hou9/5oEbBqAQnatOclkJ8QDIrodpcfYzt+az+mEKSyLYJmOYzx9GrkQZw4VyrVkQ6U/QtcJkiM21+33BuQ/p0ih8iFtr0MsKrLtUykhfvzUJg9hRJAcN93nusflpeyeDixbDwR2ln3BPOmGlv/d1WgDmmGqhry1sHvLoG29klhtkZJ7oxd9YuFEs/QL/Ny7BeDmXeI0pN6ig3BssJMz8dIsE7/cjHcWN0DYdVlKDKpfwa+3fRJ5ySj64tDr8cB4V3EXDDX/obVsNchN0dygIqicUOyYeIrfVTJl23VqwI81dsIIicWHd7z2tqjyLbtIlD6g3N3x2Gw4zM5JYMctvd1UqdI7lSY9iAzqT55Ou4CzHk1wAB/MhZ/jUonjZYBrIik3Irf6N0bTd4g7spctz+3rJxceAuG9MOyX6puBt9cJe/wARfcq5mYivmWeNhWFwYgRzDA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ww3OE9AEvNsNw/qj9GG7y0ID1FhHA59rxaZJiGe9A/1ttwqNpAC0+xyF/zS2NSizQKaXHCXW2ei10AL6HCsoKyUnadsUrilkBiTFBaMbnKZ/RTGZPcJRSDGWpU6WlnX5+nqgj7WV5tSsQ4yICyQ5uuhud77laG2uH+SKzap0iH1eOJecus4S/yeMq3kq5GquBpwydhxX6UkpLZtzGzNfw3lYSZZ53th5/CCbyJ9W1htsNzlfaEM6XnF9PEEn053gsX08ge2pOw7n+5uH8e2WWeL4Qj8bAsNSxRu5WiJT9GuwxSEDN64dbrajRUOjv0m4mrzZJwC4DQDQ0TXSlL9wAdIPALt38acOhVnHkePZsjHGK9evmey+SKvFrhNamNQa2UaF1zyDGEKVcEXFMa+4v8KWUxw4QgFpWH/c8+42R3qxbTmVqoSm6OzW+Q77Z4Gw
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:51:18.1223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6b75f3-167a-4ef5-1fed-08de88b0f7b1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_005125_607404_02B5FD1C 
X-CRM114-Status: GOOD (  16.65  )
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



On 3/23/2026 3:27 PM, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 23/03/2026 03:09, Jun Guo wrote:
>> Hi Krzysztof,
>>
>> On 3/20/2026 6:04 PM, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL
>>>
>>> On 20/03/2026 10:58, Peter Chen wrote:
>>>> On 26-03-20 10:43:10, Krzysztof Kozlowski wrote:
>>>>> EXTERNAL EMAIL
>>>>>
>>>>> On 20/03/2026 10:38, Peter Chen wrote:
>>>>>> On 26-03-20 10:12:53, Krzysztof Kozlowski wrote:
>>>>>>> EXTERNAL EMAIL
>>>>>>>
>>>>>>> On Thu, Mar 19, 2026 at 06:17:21PM +0800, Jun Guo wrote:
>>>>>>>> Update the DMA-350 DT binding to match the current driver behavior.
>>>>>>>>
>>>>>>>> Allow both:
>>>>>>>> - "arm,dma-350" as the generic compatible, and
>>>>>>>> - "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.
>>>>>>>>
>>>>>>>> Also document interrupt topology variants supported by hardware
>>>>>>>> integration:
>>>>>>>> - one combined interrupt for all channels, or
>>>>>>>> - one interrupt per channel (up to 8 channels).
>>>>>>>>
>>>>>>>> This patch is Assisted-by: Cursor: GPT-5.3 Codex.
>>>>>>>
>>>>>>> Wrong tag, please read carefully the guideline before using LLM tools.
>>>>>>>
>>>>>>
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> It is the trade off for coding-assistants.rst suggestion and
>>>>>> passing checkpatch.pl. Currently, checkpatch.pl reports the
>>>>>> error for tag without email address. So we choose to add tag
>>>>>> description at patch context.
>>>>>
>>>>> You still have to use correct tag.
>>>>
>>>> You mean even checkpatch.pl reports below error, we still add it
>>>> "Assisted-by: Cursor: GPT-5.3 Codex" as tag?
>>>
>>> Yes, after fixing the contents (that's not entirely correct format I
>>> think). Hopefully someone will fix checkpatch one day...
>> I cannot find any commit records referencing AI via "Co-developed-by" in
>> the latest kernel GitHub repository, and I also cannot locate any text
>> describing the correct way to cite AI in the submitting-patches.rst
>> file. In this case, how can I confirm the current correct format?
> 
> If you do not want to read coding with assistant guideline and follow
> its words, then please don't send code created with such tools. Do you
> even have full copyrights to send it here? What license was used by the
> tool to generate you this code?
Sorry, I overlooked the programming assistant guidelines. I will comply 
with the requirements of the programming assistant guidelines and 
resubmit a new patch.
> 
> Best regards,
> Krzysztof

Best regards,
Jun


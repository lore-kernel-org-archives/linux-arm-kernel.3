Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8652ED58E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=; b=e9b4DugN0cv4loeeZ9KNe2wU87
	hm85yPSFe4d/LbxNQTBMuFvrPn7VsxZ9IGIsCJd7RrX05w98IEKwe84SxJVRNfGnXYRWCzZiFOEcm
	V7b+t0tLMBvWbKrEZ0vY/DX4wKepSQWAtSKAA3oL9LFROrlho4gak12Qgd/cDp1ARRcGzcPiGFDGR
	4aLaso7xuP2/Lj67H6NYStxAOBSdljyy03VJgwHrcjbKVtqtd9wpJPyOS55KiqTLLcBy1qz4GdGbj
	m3RfzBzcVY5nPs4NQjKGjDggn5PzbPPRr6RoHK5rwOXgCZjEjM/Hn8nnD379jLCvBW8WIjL9bXIti
	6Il3BIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyRB-0000000CVP4-3gTt;
	Mon, 02 Mar 2026 08:15:33 +0000
Received: from mail-norwayeastazon11013043.outbound.protection.outlook.com ([40.107.159.43] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyR9-0000000CVOT-1ifR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okEnmQXzJoruVOykxcbPTNJ6LPaXiBi+aXOzqxdQfFgO85Rkoel5brvDqzq0wr8knT48CJ2Pn7FNGuuEzrkelF1bVU+13s7Fgb+OnA6b28UYeQ5OdqOydYYnEivkvZ6T0z5vn+kDXVEOA5JeQ3dzDpPhY3Qhg1V5LLMD67oX2XVF29FcWVGi3nQWMqoKF/+7fWSLvAzsenpht5Oih5cpzViHak9vxiKzqJ4AXjaq3h7ANrAncr2M5101oR8LwCWIRfoppR1WDIt/ICKbcKM7kTs4vNJIKBS7hzbhAG3nn1zxuCsT+SeBVOneNRclhLn5M0qkoUCN+6A0MpuX86EtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=bGJrAcM4HRHqQ78/WsXIFlCdna24IGK0gNVvQFlnwfrulXJWtcFNGjV8UQznnq4e23hUUquxYCMcya16XBDsB/E7THwI1GHSc1hNlzV0Cvuts5RweuS5aHVSLVhzIcA3+fv8/c6QkBW8QxjWDK0MdKa8WVTPghY3s8c6kqfpTbcPh9OZ+fsjINKA6NvlgoXC49uHKHw3+kxLyyti+0pFyW5TmKxZXQEbZ7NID2dfL1s/a8GoBB95RFQbgTUc+YftPhNpC0N3cDpG0IMRGyfXkA1jDZReZgupVFE6kH3M2+Dc+ozjmb2iNX9UO8XvOdft1035ucHwnZ12VKiGLnjWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=S26jE+9AGvE6Iens6PY2lkm62rYX1l1QOE3ANs5B0OMmLwJ7KyRSUDznDzVfyKbh7rcpIR+YGNbDq/GLdSGgkrDzwgdzFjgTC8EYq0aeix8O2Lv8NdOyZipt9EahswaE3OYBNMPhTQ+tIYchyRdPE/NVcv+xApFN8b3ROrqKjKwqCOuXCcCTGdKyHs1BHroxb/JqraDHFSJlOYJ1RSIkYoTMXA98jV1OGWqqgKWpJNHH6NiEsSp5jXm7vQHt5XatPl+z6wiiXTRRWRNU+Sa81tl6QdOqtXJNrHnlha4QozwikrjPa+cDv3qsBuKhxUqD7PgQNU1HuSvQ2x8vsk5a9g==
Received: from AS9PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:531::24)
 by PAVPR10MB7515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:15:24 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:531::4) by AS9PR04CA0122.outlook.office365.com
 (2603:10a6:20b:531::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 08:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:15:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:17:41 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:15:19 +0100
Message-ID: <9a53fee8-3194-488c-a04d-2070d91fc6ce@foss.st.com>
Date: Mon, 2 Mar 2026 09:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PAVPR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: c+mADtvIhIHGuxx1kvrqjXYL6TzI95VCflt4Bh1n3YjBlS3Puv7M45XKJN5rSL5om0oKRUqpgSX71uKzkryyLFri2uOdpLZSoUrpwpMwe4hyIN3h+ws0smWblbB/MxV8UV+y7ha0loF5eaMLesSPSWCR9QU07VhVIXdx6xWML96k6CXwY71AKu0w67mKmKxinSj2VT7i3Z6coMgJ0u0GP4hssmcE0xFQ2t5V1ddYD+QUKUgJ+g4N+kmfBq5oaIjZ6gvd54W3tYYiMtKqJi8Qn+TVEcRBrC/b0O8Hko5ZUZIcfl0ogBoYY1TWjhWk2XJBp8PXdCdHH2jHcrZfiIu4/Yu0yohoJfinj9sae3vsc0Lor3kpdM1kZSnG2K2mr/bN28nJMbPl5r6DQrS52vW8wgPZA4D+FGbVgsRHNCO0Dyk55YVibYlkEZ5a2ivW2/8l25OWfKgTCUYR6+I6CL6cv9dhtgVRgGB60p1K/N1osXyaBUCSbqFJmvVirYTHLpcoBff5IweK4acleVs1S74JJ8hCciGwyRXHwtynMOd0IhLrM4+KuKgGDJmgKQsDIA8hiIqgOAmb7x6YAJPMfljEUtRgWz/nTyOPyG1PauCcAZcJ8Nw7uREdy41UaPQpMypaehVyFS/yUc2d5cHfLcWcJJ4gzKcTQmG0ci0PCywIACW0w1hrkIWTy1W0ioNfmTVUCYpwqFTqAwehJn/yqjViAnr2GoadFijHdIXY675xWsuxWPFUxQuTTA7bknroKCvdZlgUWubxujwtWkQ3hnRYQ3paOd2fKiihdZaEKTs1KSxpQybT/cYB+Ev4iZcwNKAJLP9n64TsU3vIad1t9m4a2w==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NuFCnPWG9woXWvREWA+8Z9CvfZ+h+1DJIqZDegF24rIOipnE5w1itzOcRmdSkzE746WBh1J/a7iJznGYZlCyo/eBZ1+apWokzDkc21wk752R68LoNkMw93bCE6vs8mlmWGxXucybXn7OPERIIzy2CxJQUT6+mzoyVR9Sm396xS2QvYYgDBRvPStOR7HZFta26AQ4BITG6erRE/F7NFcZ64plKB09xWj2L1j1GIEDj9M+zTPTmL90Er4OH1MjFpngC3y0mhpqMlJ5GpO42ViG9PpK7L/tUzhxmJ0MRu44usdwpt4YQ+tnVEBBqT2k5A2Y3ZI4kgQxWuBkb65j+V7x4qSXNOKlvdg+dLRW9KUrGPRupxg8cJooZOgiuQAXJ+os3nHqv9M3u4HVfjOqXT/VZtf9Ab+xkiyCdI4smMFIbizYFqzz2YkjXI07UjGj5wKG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:15:23.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_001531_955907_B98514D2 
X-CRM114-Status: GOOD (  10.22  )
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



On 3/1/26 15:12, Krzysztof Kozlowski wrote:
> On 05/01/2026 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> Is anyone picking up patches for stm32?

I will.

> 
> Best regards,
> Krzysztof



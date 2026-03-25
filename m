Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84543FEA80C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Crzzy0YhcpqVqU4T4AjJ7p7d/E9UfX/lu4LuJyozoUw=; b=NeFAmZoUppQp5D1XOsIc3KwIZk
	QQvGb/vjg+ZmxrBNB24PmeedupDmEWUKpuqydmh4DQjfRh751TQ/x2LNpRdPruSnOwdXYlZPuJL2N
	eZf1fMxhX6Y5/Bqw4JfdjGdkTXTRLO5C+CoOr5LXdAlcUiBTDHdmh0neMRupAjZYSeT2MffbmHczJ
	sh82RCIcvmZDMu0ZesiT5QzLWCQqV8OU1vO1b6sXNF0kQDwSTgYARONVYIilkRrrZVCEcmXR1F2jJ
	fD8SCzMhqpiyFGtgxN8ZD0bZeT7NXvdjuNFp0hhf9R6lYHPR/f+LvtLbpKxkgmfaXZ7kwwxcpK9Yp
	7MzqOH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HN2-00000002lPA-1iIk;
	Wed, 25 Mar 2026 06:05:36 +0000
Received: from mail-japanwestazon11022098.outbound.protection.outlook.com ([40.107.75.98] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HMy-00000002lOn-2vmt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 06:05:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWvnHeeRLoHVx8c1gTyipI2oENwzjVWifcflMXdjvbSmyygcO+F7G6IufP2bIj772dGGcFaXEpraB7pUBR5DEEeDKq1P7MSfzJqOGcPhSLdaOBfnKil+PDTp1vcKqWeveOau0WjuiToLF7DIVvGoH6kR9JxHqU9b4IEs4i93RZeHkk0ACN9KCcQ/3dNWt8Ln6hee+KnxkONCNCU2tjksF+f5QcodoM6IQsHHw3ydtOuGvVt7/k6LrG9TukDFu+Fz5BlsAOs8XkVqo9YT5uXXURMBQ6FcvnIlpk2H6TgHQReFX8BiRKzwR0hshNyxi92jfs7wOnWij57qQPMG7k6+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crzzy0YhcpqVqU4T4AjJ7p7d/E9UfX/lu4LuJyozoUw=;
 b=sNJInuviccJvmpr40HBBN2B/XjOlesZzSWYJvsMP7aYoPmbubeeLsUO2z6RI1KmCd1Od2g9jBdMvXCYDPVqUCngfuJj7Jim5jtzxZ5lwx2tcB7TUHbtTQnE/TWA6QgISmMophmNrnlw1XlCVUdWQTEt7nzHhf+aSHqC9myV7alLzv5YM36BsqRV2HUtZ0BEXCc8fCPQV+NxB+cBYhrONYK39UR9L2B1cP0pPBQUjpxB+bMdjwPsQDiHdmpysbWXm0xNQmFfz9A2lEr9LBeCClndxV3AwjIMN5yv2PAyc2x7WKE1hpYVf4t7B1Qv53VCooVYDNBF9WOx+/YzKVMxQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0164.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2cb::16)
 by PS1PPF4E5A438BE.apcprd06.prod.outlook.com (2603:1096:308::24d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 06:05:24 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:101:2cb:cafe::cd) by SE2P216CA0164.outlook.office365.com
 (2603:1096:101:2cb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 06:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 06:05:22 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 40C4B4126F98;
	Wed, 25 Mar 2026 14:05:21 +0800 (CST)
Message-ID: <96077d03-e2b9-4f7a-a8b6-c5bc762e771b@cixtech.com>
Date: Wed, 25 Mar 2026 14:05:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: arm-dma350: document generic and
 combined IRQ topologies
To: Robin Murphy <robin.murphy@arm.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260323114822.1925869-1-jun.guo@cixtech.com>
 <20260323114822.1925869-2-jun.guo@cixtech.com>
 <c91176d1-851a-4cf5-b7dc-cde431a8326e@arm.com>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <c91176d1-851a-4cf5-b7dc-cde431a8326e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|PS1PPF4E5A438BE:EE_
X-MS-Office365-Filtering-Correlation-Id: c9198cf9-16c7-4928-7f34-08de8a34806c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|18002099003|7053199007|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: SZx64z0kmURpQeln7yt6Xk+QwFamHhUY7nBEQjTnQ9398Yw8S96oKY429VqVvIFQtr3GwzniJOjTscJhzodhlHYcjBBwlY+L/sWF20MsOk95Uo53MA5D2J+vob18peboN6ypH/S/jZYrvio5xE0H//aLmtPjWF+/qADhSPCZKZmfgUZTkhg/q6gi5s6s7qA9W/1uleZumN0d8kKITJtJqvNeVCMwA1G7vyfuJ/wVrrnPJJ1su5Pwj/kdhcsJGbJU21tFCKMqpaPB8qwSs+HCxRFM1sgGiB1n4gg+Mhs4JbTW7YO3SqIeBd9bi0zm+PWgb6JF/TwwEonFPVVOanxsEbzyUxodjbCjDf61T8mW/NmHNiHCoohiFYWYjgVI/F8koPUemNlNXwMjWETfTUVwb8RtCPEpt1wOYSIqpT3BflVa2YlM9FzyyZXOmZ/3ZvF0NJyywx+eHVPfappTwzSS0gAr/VVGQqpWBr0PMhDoo3usJS8imENjMHvXAOQj8rCwnITP0FkkVqMnDBvrbq+GNzVwfkaUHGayToCRySRbKEVnLnO+xI7hgz128sGyV+eRIxZ0kfy2umTD4Dw9RLUzzILsRnE6uxj1VGc1jjIdnbOqgt2CsXGW+/x98eHN08/8VVrCgVNWV4XJovmjywW1L8Dc/J+STkCLwiypwd4Df5r3W6voXAA8QYp8Nva0KK8i7kDirQ6uk0a0abEM8RafkiDehjTagiCwsO1eW9j21Kv+ELhFyrxWAHW+/mGQXqbYyxXPY2dM8e9TO4Cy03YCEQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(18002099003)(7053199007)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ugPHeeph6Eh/ERuzma0V292FdoYvsylTkW2HRapMeJsq/W1u/Ybe2clxaZywhsqpBqY2N6sg21sn8TRWPthu23cgx08QZvrr0TM5x4aa83e9c8daQ8lHLB/S+IrSjb9vo3aPcL3J8CsozePPz/yLxwOJGLc9DnTfVaGqaajRJAf9tgDeaZIPzPOZTrGjRtfGtXOh7X+FAgFwAVHAMg8sgrsZNC1iuWiTRvOQLUBJqRcZ7j7WYKdtVStAR+9ajB3p0yGUEib+ge0vTtYXundIchV/AMVwQs1XYvyO9grjddT8q1VeeMqHRP5dJvi6Je7YhpO8XrG//rYVU5X4DifJ6BcJ4s1E5ajaOWi1Cb6Yt4In3KXFiiOlK4xaCHXLtUi8NYaU/MmbrT0dRUXFAx+qxZoES58cbBmL1e5uvGEq4GVRiU5f9MeC4eseGXrJJR82
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 06:05:22.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9198cf9-16c7-4928-7f34-08de8a34806c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF4E5A438BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_230532_770120_CC27A84D 
X-CRM114-Status: GOOD (  26.15  )
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



On 3/24/2026 8:04 PM, Robin Murphy wrote:
> [Some people who received this message don't often get email from 
> robin.murphy@arm.com. Learn why this is important at https://aka.ms/ 
> LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> On 2026-03-23 11:48 am, Jun Guo wrote:
>> Update the DMA-350 DT binding to match the current driver behavior.
>>
>> Allow both:
>> - "arm,dma-350" as the generic compatible, and
>> - "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.
>>
>> Also document interrupt topology variants supported by hardware
>> integration:
>> - one combined interrupt for all channels, or
>> - one interrupt per channel (up to 8 channels).
> 
> To repeat myself for the 3rd time, this is at best unnecessary, and at
> worst arguably wrong. Here's an example of a system which happens to use
> the combined interrupt from another IP block which also offers both 
> options:
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
> tree/arch/arm64/boot/dts/freescale/imx8qm.dtsi#n279
> 
> Same thing here; each channel is a distinct interrupt source, so it is
> perfectly honest to describe that consistently in DT, regardless of
> whether or not the interrupt signals are still distinct by the time they
> reach the interrupt controller.
> 
> Furthermore, in this case the IRQ_COMB_NONSEC interrupt actually has
> additional functionality beyond just being a mux of the individual
> IRQ_CHANNEL interrupts. So although Linux probably won't ever care, if
> it's going to be in the DT binding then it should really be distinct
> from the channel interrupts anyway, since systems could well wire them
> *all* up, and an OS could choose to use the IRQ_CHANNEL outputs directly
> for individual channel completion/error status, while also using the
> IRQ_COMB_NONSEC just for its overall INTR_ALLCH{STOPPED,PAUSED,IDLE} 
> status.
> 
> If you only want to make your thing work in Linux, all that is needed is
> a 1-line change in the driver to enable the INTR_ANYCHINTR bit (which as
> I've also said before, we can do unconditionally because we're *not*
> using the other INTR_ALLCH stuff), and to write your DT using the
> existing binding. "One interrupt per channel" already carries no
> expectation that they all have to be *different* interrupts.
> 
You've indeed said this for the third time, but I did not ignore your
comments earlier. I carefully reviewed your feedback on both the V1
and V2 patches. However, since your initial comments were not as detailed,
I promptly replied to your emails hoping to discuss them further.
Unfortunately, you did not respond to either of my follow-up emails,
so I proceeded with submitting the current version of the patch.

You can refer to the records here:
https://lore.kernel.org/all/20251216123026.3519923-2-jun.guo@cixtech.com/
or
https://lore.kernel.org/all/20251117015943.2858-3-jun.guo@cixtech.com/

Now, with this latest email, I clearly understand the point you are making.
I will revise and resubmit the patch accordingly, which should result in
a much more concise version. Thank you for your reply.

Best regards,
Jun



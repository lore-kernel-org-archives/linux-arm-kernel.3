Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3816EA8552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iAWVBlsLYfkY3727C+VkzKgTiMD2ZyGoAV/tiktgsA=; b=0jGOuY9kJsq6ZULi5QDb0KzTxH
	Lv13Zf2TDrmPobByhsEBuBEMNQ/sbvHU1N4M4vcKZQVsSVfG+zCgDpSXrZTqiOcPB4hOyPoN3T0Ob
	scKwb74RjIaKmNEcc7DZSRSmWWjXP6Fw9Fyab6Mc5wVrc0V9b8pBgNecJA6/ktY1TUnEytgoYPAv4
	J8E9dAmfkVFvpH2q0CfJE6pjW1O9oDNXrjBfovrwVLWh4wGoHzORMDGqFjeDtgAUCQDuYhbiSb7u3
	X8R6x7d704H016C5Y3wsSYJ3JjsOj8Y7BjWgr79wxcEfZJVIMzV5n3b99lyXPiGBBeR8onzy3jiI8
	X+MMxzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSCK-00000006e2R-2x87;
	Mon, 09 Mar 2026 04:26:28 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSCG-00000006e1g-07Zg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 04:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL7sj1li7f680rw+HteYYjLZQhaIJu32+Df27nsqicINetmDugFHpxhDzcuDlgLd6MWmZx8eBFMfMZvDXq1MdnVvvaa81IfisA9skBjHzb/qFyBfCYm3Y2y2iwehwNzJL8nNh8KQiErPfv2eEzq0cliMPWo4Z6tefaKSNou2ZtKPaLnO+6muZ2dpcmNJgnaJSdhOLfk4KJiWvjcqpy5sOPpUj7wSQNin9+V7BmDOIqCXm6zxSNoWwOWGezRWVLuc4octevIE4dKeMYS7uf5vbssW9qg5/gXgr2EMIbGTWNEEkYHA75zmMEGxBHtDwhY+Xy9B55gGhxeHkqq+vBI5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iAWVBlsLYfkY3727C+VkzKgTiMD2ZyGoAV/tiktgsA=;
 b=MyUKRMkuxWgbwvJ2IxcRLrvraGR47zXKbXwYhWa4m12dgcpOHJCvYVUxPgPDhT5ekT4Pa+85ntp4JZH9p+ekcF3Ak7RjsQvr16Kj2RCEOd5oSOQKU1fpddS6EbThWCejwo45Q5PcCp77fZCTT7RnXA47WMwLeWFSnyia5wf4PBRlj26CJ/auG2ByX0TAJpOzgnFoZ1owzyphUUWiNCvI5vy9/VAzwIG30dKYh83GcHsqTBv9d3PjajwmTC9YHTZdUsmOcT++UgfZKYjXW2aGhviIVa9fMdiGBhpIatTpb0pxte7znx5oY6I5TlIy72HPsDFAMHrcQMUWYuImExos4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iAWVBlsLYfkY3727C+VkzKgTiMD2ZyGoAV/tiktgsA=;
 b=v5kda37gw2qUObLVYIIZUjStTkAtkF8XXlFm2gm1NkvD0xLcY5UUrxxIOrJPDdYU1wRjCQaijEXVnqrKuIkyLZwCgV71nuX1vaI54Unrn1gMjpTzNBrYof23+ywnBIl+QA4P0MAkUW7GtbOwowtGAizK5eiNMfCISFl+iSZdVDs=
Received: from SJ0PR13CA0080.namprd13.prod.outlook.com (2603:10b6:a03:2c4::25)
 by CH0PR10MB4873.namprd10.prod.outlook.com (2603:10b6:610:c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 04:26:20 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e1) by SJ0PR13CA0080.outlook.office365.com
 (2603:10b6:a03:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 04:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 04:26:18 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:26:12 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:26:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 23:26:12 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6294Q8bh4064592;
	Sun, 8 Mar 2026 23:26:09 -0500
Message-ID: <eebb39f3-1d9e-46d6-9469-28cfb6700af9@ti.com>
Date: Mon, 9 Mar 2026 09:56:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-main: Correct PRU core IRAM size
To: Hari Nagalla <hnagalla@ti.com>, <nm@ti.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260304023012.20452-1-hnagalla@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260304023012.20452-1-hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|CH0PR10MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: ad325279-03ec-48ed-594a-08de7d94026d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: WpirV+6lQe+mHhrfSmZA4vvQcdwi5AeAz6IHZ1iRTWQXTX1GIRNfLzDjixOZzpUThJcAuthlFNF6/43xcwbHByCCTrqSxeKo8tSIq8R1P6hsNnBev9UJD1Ycni8pR0Nvr/3WSeMwuXpQRvhEsflRCJMvwNpmd2Mou1OdiSyrQfrCzx3uaK7c0avB7nyfSquEbVuEpW2kr06HdcIeFJRbqh9NLgI8qtdeq3zl3clg5hwN9fXqEinh3PL6vU9M9+tF4/rh3bZuKFjPALD+uH86BQ3m2I7KuxNaIGU/B+ZZzo5Wu1Eaj1lU/jKxDpDhkp7mmV1cYQfgav1hog9329bFlPAi3Gf1lY+pi5DPeez6U2huAx9W9HL9y0In+nElrhGAumuoRHUKij8IByeK8VZvtiYQi+1u49Gof7nXEGxko+Qopesd/ZTgFZYR7JmJYaYe/Mmifl/hW3YQIB6vSDOktW/OvTOHVshQ2VxioxmmGT9tI4mlF9ghL7CHVRIif9ziHBe5PDNGFnOVgFqQTzJytc2sop3ILPs8gTbzH6Nrraw+tshJBAxMNUgUp8pT7ztyG+obKhnNWsej9WjfLTrfVdP6sUv94ww+gKDpEHFHQQ4Hr1mPgUs52ZkuWBim+DRdwFZyd035/asrPVXGaBtNMza41ZqpT/4uylr6NhpYd0Mx9Y+sGuS7PQTJpYpS0XtxNpSQZxJXsTniNh+7yFXtiiZlYhD+LW8ktkHkKdnv3y8=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VmS+0V/KriVeqSbWCBZMK9Zc37K4LGQ8NrFvkYaJToVq1sxqocTWZIXehQNpqYaY5NPcYFsBzqf5P3DgrVQzUlX58tzXIXvlUWvICN9uBra1wzQDT46rp0Ru86YF8YHcuG+lMHqcOkPbNkh2M0OmH0Aocs4OPSM0DDSV2SIcceb5xPam3QAAwTeojMkx/5dPK9P+nKVVVgbdUFJbzyB9gMY1BHAOX8hChqBhYt7bAaS4jFVR1L9sXX22fL012UQdecXQMTO8WSXR3Tvp1FHYnX9blsHOJozoWCE7UYHm/bAKLVyY5RfRI+hwaPSKfIIe56wM3Xv0WrGJdIkQZeZBLlHM2tJcGb4NlBUjFHRQcm++83QnY7eSJnvFti3qG2PrdoWCctU04c5LgUK4tdN2Ri9a2LAG1tHiJumc9JIdOJpXbKQWs5q/WU4aC2WnRNwx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:26:18.1169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad325279-03ec-48ed-594a-08de7d94026d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_212624_078715_7F67924A 
X-CRM114-Status: GOOD (  11.78  )
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



On 04/03/26 08:00, Hari Nagalla wrote:
> Each PRU core in the AM62x PRU subsystem has 16KB of program memory.
> Correct the PRU device tree node reg property accordingly.
> 
> AM625 data sheet : https://www.ti.com/lit/ds/symlink/am625.pdf
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>

Needs Fixes tag

> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index c5ee263d34a6..1bec89b1e378 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -1213,7 +1213,7 @@ pruss_intc: interrupt-controller@20000 {
>  
>  		pru0: pru@34000 {
>  			compatible = "ti,am625-pru";
> -			reg = <0x34000 0x3000>,
> +			reg = <0x34000 0x4000>,
>  			      <0x22000 0x100>,
>  			      <0x22400 0x100>;
>  			reg-names = "iram", "control", "debug";
> @@ -1225,7 +1225,7 @@ pru0: pru@34000 {
>  
>  		pru1: pru@38000 {
>  			compatible = "ti,am625-pru";
> -			reg = <0x38000 0x3000>,
> +			reg = <0x38000 0x4000>,
>  			      <0x24000 0x100>,
>  			      <0x24400 0x100>;
>  			reg-names = "iram", "control", "debug";

-- 
Regards
Vignesh
https://ti.com/opensource



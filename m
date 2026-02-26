Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399E1FC5936
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kf9Lsk9tqa0JEoB1QAiR37ScRsWtnO5bb48lhJxCaFk=; b=M1t2gc4EdokW0LAbSsDv0+28vP
	psHyvxeKNvfKn+zX0qljCLBJ0BocCUf07lj7Fe7IuK/86VawDDVuzw5cbG4MGXEKQGJSFhZ/bkdcJ
	WTs3Te3Cb5QdC+HlyhpQnj1rAsVlIGMHCfYDOx8nz6XXYcvbtnKb74Zu4PZPmzBqYPJ5W9uChWaX2
	u8JO3JHXQgOrz21FFhsTmZKLtMq4fAnt8BRmShQ9G76jmpNfkVett3WFf9D9fUB3Nj3nolGmWrN5c
	c4DmfxDYMYwelT6C9f3thJC+JZdMwW6oA1IJBDPTDOBqIQeq8QbAXYlaogDLAU4no+a2zoPoXo1iy
	nA1ysMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZcZ-000000063AA-0jbk;
	Thu, 26 Feb 2026 11:33:31 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZcV-0000000639a-3FjL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBVP8SIzGcx4hUNDGitz8CYJkggOrHniA09cNnIUPrDS/5brCwjwL6bli6sbqRSNae/ysWfb6YBUKeQjezqCY4+qf3g47pst76FGIGFj7wWHUq5QmQkGt5Ejt6Ed2rriolFNhmXlqvarNp+kO+2ChZiEcKbMz3EGwTATmuAd0kFuNjjPxVMZtTzQ6xIuvO8r1JTyd8w8a30KtZz6QIHPftWmZqjU4kn0aJ8O+kUuRIm4dm0teYejpEyYil6DDcFz+glMsDEyFr59OP5S6xsLot7ogZmHnKeo29rgZweznt3YUgj1M1DLiWQ+OkuSC5xigCm+jV40bwKHpUBgzKN/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kf9Lsk9tqa0JEoB1QAiR37ScRsWtnO5bb48lhJxCaFk=;
 b=krqHDt7FbqfBllJ0JqHHdZwRIorIwKagY2W4cluVip32/DTmYcbXofpxhavybc53qdkBKXns3G53SgMMqTykqjbekSQFdsimFYefPhs09fHRXhY296D5muX1AtWI6sboLyXWg4NFBehhoUXN6Tl1W2AlLNukSinZq9dFvPuVt4ix3OMd4owby1eLdMMcqyEa27guIMAnwpp569qG8uvmjcCeSRI4dDmoOWngTkSbxaOpRdIGBSe4WvxUfQE7BYjjBu4lM08BRjaHImMCL/6QxN94qv9klcGPu8BVrH8NW0jMqor2b5AxAllW2YgnCwNgd6zww+2FPU1IQR8rQddHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf9Lsk9tqa0JEoB1QAiR37ScRsWtnO5bb48lhJxCaFk=;
 b=hItviFXI+0+803aK2GTfv2CsnPbrT6gxl6I1yoIfEltbvkaVKQBWFRJ7IpbcZNNSXTxGCYt2804RBo5aDC1OUU7SJVu3Bf70jmu++HhNQGzbTiH9XncMcVJaTenUM6daRK3XEB6VK1Qfmi4McEOi2MN4EffIhdj56qkvSoctW/o=
Received: from CYZPR05CA0013.namprd05.prod.outlook.com (2603:10b6:930:89::11)
 by SJ0PR10MB5890.namprd10.prod.outlook.com (2603:10b6:a03:3ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 11:33:23 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:89:cafe::15) by CYZPR05CA0013.outlook.office365.com
 (2603:10b6:930:89::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.14 via Frontend Transport; Thu,
 26 Feb 2026 11:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 11:33:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:33:21 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:33:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 05:33:20 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QBXFg62288259;
	Thu, 26 Feb 2026 05:33:15 -0600
Message-ID: <668bab11-0362-4b12-a935-c2db784fb034@ti.com>
Date: Thu, 26 Feb 2026 17:04:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
	<horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
	<vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
	<vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
	<stable@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH net 2/3] net: ethernet: ti: icssg_common: set irq_disabled
 after disabling TX IRQ
To: Jakub Kicinski <kuba@kernel.org>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
 <20260220041431.372610-3-s-vadapalli@ti.com>
 <20260223184840.06069afa@kernel.org>
 <57e05b57556e94ed666acd8b4c542efc28e7408b.camel@ti.com>
 <20260224154953.63b558c1@kernel.org>
 <be80263f-667c-4330-bc24-5078fe07b994@ti.com>
 <20260225160958.64bbc4c5@kernel.org>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260225160958.64bbc4c5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|SJ0PR10MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db4e07b-c3b2-42a3-3ed9-08de752ad9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|34020700016|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: pni9iQC6njGGA4/4hxKnpRhJUub6ChgWvjEURJxh85qnWeq9RDKS72AbPobP8J2JqZDClIhSohmHcHIeVLVxsn4lX+g/hDMeg1VKbaYBjucDbyZ2hsx3jXUqVpbDyySvM7Y1x57t/GX4tr3jAhfmgofGnFnGcZD+Z5chp1Xo6JAVzUFUeWNLoXhsOl0FXAYV63yS/myTu9q0rU6peg0YJteMrbhuxSfgzKxMjMi7poKkELHejGpF34Ku6twNYOHjhXTfwhO149NnIU7fuUNEaeqJgZmbRK727azY1u/mfiexwPU6mhAH78f/8lakVUtqeNUNXnQmewv+kzymiPVnc90U5d8eCP6FN74BPlPCkEfio7jgA2kEUN/2fn5j/jLgp6cB29LptGjPyEV4/ppnUh3XkmwPe7bS+j6I/CwfKV4sX0FEMRxWUJjZrHKNwe6KO1yHW87NsytXbUjSxK4cW6cs0HAfKsPrJdDZL2XUViBUd6tvTGvrfy3IH2Gk5EdPzhrZicorqDK1i+7eI5Z+xley+5hpfSfyVohuRkPxzr27wq78q8eeXMrbSv2hhO3yzNtWEyJ2NwSndD2Ocf1iyTwnLJch0LdbVzs0ygGKrHaPvwVyq/FpIIbAgIxtmPT1aOFkLax7eQVNt7ebQ8fGOzC2tIZJW5gzFqsGMaBUH5NvZRIFrq7cbkZ88KxUgfDDwhe/LdSb++pD58qmZFeehMe3OHu2Nzb/zdSnrgaMTkJ3AZlyM0GdD0vEvoI/R767U2YoAlxr0CYHZS2mFqSDb25EY1SH1NFFBzKitvT4JWuPTdtG/ts7GuZctiqUfEeaf07i42YmLwLJw53cd6fRmw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gZnurVpEXGr65YH527d+wITAb+HZH/QebMctRcFIwSb+k3sp61NPqdb2nVX+LiIV23U8We2GdsixzDk9J8ICkBlQGUXFQWDV2MFKLbl8/pCO4MdhoSBzCHhEQbe/iFI9DV8cIAUk5Ma1OfQyqdaKVAetk35DT5DTGQcAkVcvo5sqUXnaR+d3vL4vC6XDPB8OMJnBtrvCViETGNuhxMYhPhRqb0b7tVJx8u9VIsZNvxHw3xnTDCAoYLOw0TW/XyGWtIBXR1xqh6IdrNqBj/A86lqdbMHscfKY+hQJNRljk9vHnJJ6FVERDMkbug3gcIGnLKFyb0uWqgWGgY9TUBS7gbAQ0QEPo1xqG33N/348te4oXaaQ4h7qtMOdCLq5B5/SNl6xgaNJZK0a7Yy7U9AHW7yCcvq1/jip8uwyz2m6JRayQ2qHc5AJxxQW/69mKKnP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:33:23.4000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db4e07b-c3b2-42a3-3ed9-08de752ad9b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_033327_873258_C4EFDC0D 
X-CRM114-Status: GOOD (  15.32  )
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

On 26/02/26 05:39, Jakub Kicinski wrote:
> On Wed, 25 Feb 2026 17:01:31 +0530 Siddharth Vadapalli wrote:
>> 	net_rx_action
>> 		__napi_poll
>> 			NAPI TX Handler
>>
>> It does seem strange that the 'net_rx_action' leads to the NAPI TX Handler.
> 
> For historic reason rx_action runs all NAPI, it's fine.
> 
>> However, it is exactly this path that causes the warning, and it is due to
>> this that we could end up in the following situation:
>>
>>                   CPU0                             CPU1
>>      -----------------------------      -----------------------------
>> 1. TX HARD IRQ Handler entered         NAPI TX Handler is running
>> 2. irq_disabled is set to true         Sees irq_disabled being true
>> 3. Calls disable_irq_nosync()          Calls enable_irq()
>> 4. Enters disable_irq_nosync()         [WARNING: Unbalanced enable for IRQ]
> 
> Right, but for Tx NAPI is only scheduled from the IRQ so this is not

But the NAPI TX Handler running on CPU1 at step-1 is a previously queued 
instance and not the one corresponding to the TX HARD IRQ Handler running 
on CPU0 in step-1.

> possible. For Rx yes, AFAICT there are paths in the driver which
> schedule the Rx NAPI (AF_XDP?). But Tx NAPI seemed to have only
> been scheduled by IRQ. And if that's the case the NAPI can't run
> until CPU0's IRQ handler calls napi_schedule().

Wouldn't net_rx_action periodically schedule the NAPI TX Handler? Please 
note the following:
1. The call trace shows net_rx_action scheduling the NAPI TX Handler.
2. Since CPU0 entered the TX HARD IRQ Handler for the TX Completion 
Interrupt, it indicates that the TX Interrupt was indeed enabled at that 
point in time. Hence, a previous instance of the NAPI TX Handler has 
already invoked 'enable_irq()' and enabled the TX Interrupt.
3. Given that 'another' previous instance of the NAPI TX Handler is running 
even though the TX Interrupt is already enabled (given that CPU0 takes the 
interrupt), it indicates that it has been scheduled by some entity.
4. The entity that seems to schedule the NAPI TX Handler despite TX 
Interrupt already being enabled by a previous run of the NAPI TX Handler 
seems to be 'net_rx_action'.



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrXdi6srfp0Ao/tvJZ9Wyvr5NlHDCnKq/XdFuOkOCfU=; b=yj+ILfO3BnAViZH6Kvgsd3VMi7
	MHVDRdNeb5rivGYl0oPqRs4UfKx3yQM3+wCrFkYMRWEMvP2xucB/M9jjnf0NaZlynTL4/6LGSVsif
	LJkybsBMMkThrEDP+EIrMFwbTUktSDSjxpUbX2Dit+wZg47xbCAv99eVnq3dD58PKbdOKbEuFsJND
	77MNTNHiMI/6K/G5G1+OKO+N0xRCdrIWIKMXCIJjAt/iBgzLaLhbi5N043hUCDrBxM2JFchGXWrKZ
	YVsl8DC9cXZ3CUnQXkyfgGWc2iJdeGPbuEe8N7nCh7HOBX5h2BcbBurmlbUG1TgZM8m5kY7OwDrRg
	O7uA5qKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRhN-0000000Feoo-21uJ;
	Tue, 16 Jun 2026 11:11:17 +0000
Received: from mail-southcentralusazon11012049.outbound.protection.outlook.com ([40.93.195.49] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRhK-0000000FeoN-1MeP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:11:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWLiHuLKAhGKbGnm2ZVxjLfP2psm+CnpLGaxMcMjYfP5KJihaqt26ifX8rJsm4msXFdMvte5d0L7jldDpFm3Z1zo1ZcnksZWoX2+MsQSQEzrylJtR96NwtNToZmm9x6tv2eRAWBU4LoVS7mVMrlY1KOnEsX09AesvEQig96CASR8jT6QBNksHGNopGPH5GfcvB4feVPbEG4xnn1stddO1MbpNKSVrwj1Rw75JriicXDF7Xop+5AUwz7qlXqL3SX92OePc2G9OPzccVwUQW9Yjupej6dH9UIX5pP+Q7WA7756GOT5kgcNh3hULc4gL5Bb3Y9YosK/cRSo1arMY0O4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrXdi6srfp0Ao/tvJZ9Wyvr5NlHDCnKq/XdFuOkOCfU=;
 b=Cywj/EXb9ZGRIIFCZYaXOXMoeJlRAh+aJ+9EO/S/gI/mlp+ZAmCKw1IEADT+9w13cB3VgWs9lgOoJz0eMbDV9ofXoGTU0N+1BcdH5qrAPgUjm0mKs/VLXJcAYGYuiO92WWW8sHAOjMww/Xy+lsi1PS+YTvxnewx/nm0IgxHtorshZGrqYk4I+u+uZPcu+12oshU0O1KKIy0LZQxn1UEpb4D7S2FWZaqg6HBfkyyb3cYNmnxSv2X+XrbCxedbQTiTfMfE4dhPt/KwfKR6vMgypgVhmCOCUFPQZUccKUgwXCyaWwPZcCXiEzAkqL6IHp53vLVd3BVWHtr/l05/JEJeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrXdi6srfp0Ao/tvJZ9Wyvr5NlHDCnKq/XdFuOkOCfU=;
 b=cwDgQc48CHXNO66E5eJI7LdzNl61cUyVOEYPxErj12FZ2d+WWxwVjcqylA3HeK8kMk/0EWSju7PZJuvQuVAGyCnTNACcDXgNG7aHoY2+tc4/l782DgZJZPqNa7DHFYWI+e8DOTwj38mlHytjQzo2mgz2QBF/xaXddoI7MTEoOK0=
Received: from CYZPR19CA0019.namprd19.prod.outlook.com (2603:10b6:930:8e::28)
 by CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:11:08 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:930:8e:cafe::1d) by CYZPR19CA0019.outlook.office365.com
 (2603:10b6:930:8e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 11:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 11:11:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 06:11:07 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 06:11:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 16 Jun 2026 06:11:07 -0500
Received: from [172.24.231.93] (ti.dhcp.ti.com [172.24.231.93] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65GBB03k3480225;
	Tue, 16 Jun 2026 06:11:01 -0500
Message-ID: <ed0bc332-0196-4613-8066-9b94f8ed0013@ti.com>
Date: Tue, 16 Jun 2026 16:41:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/4] net: ti: icssg: Fix XSK zero copy TX during
 application wakeup
To: Jakub Kicinski <kuba@kernel.org>
CC: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
	<vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
	<jacob.e.keller@intel.com>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
	<hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
	<pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
	<andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20260611185744.2498070-1-m-malladi@ti.com>
 <20260611185744.2498070-5-m-malladi@ti.com>
 <20260615162157.3748bcda@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20260615162157.3748bcda@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CY8PR10MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 149d6917-7978-4d46-e157-08decb97f738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|23010399003|376014|82310400026|1800799024|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wdG9YScI2ByOTzBg8XFkctAIV8akMtbj2ZiCVP0UB1kgquAMvsGjYjcdEFUw4sCP+qMZmOjKgjeWjlyAiSracSXro/Au1V1aBm2TT8d9egku/x9g0yvUlMgCf3eVvip6DY5Lk7EZb+aiNwyFB2T4rcVD//S3uJTdKkJMbN7mmtFyfWXeLOVokcw3RUKAnk9/owl6/24TR0qMG2J4Wl6qxKpccJ2PI5Nzheu3cIYlwWoUkSFnbV9i+ZpA4OlmU1o/TmzNAUKJ2QN9bN7/O+C8xEOex4f43VN/cAEMQFyvi/lVOnoHsAlcDTblkucXebPddeGeLVDVYCqP1GJyUIBj+I4BshaTgGDdjU7qCfeTYsFh+XVbbcDd97kK4yAO5F7RnDjdoxx/gaitvWk7gry99nj3Rh8xXrp8WAso4Hmgrl+V4AYBrPK2IMHNJfwyEDQ65ZgVbPMu5fn3P/LqnT+Acs2s87CoWsBqwl26vSngT+QjdBKnul5gI0SAvYmHZ5k/E9dkg9YyapG3+wk2KAKHBDFaJNse3w3XxhSEMgp7B6RlBUZE1ljcZqRrRXieoXKuyQXnNy1fmng8vKqhHwqAETwW5u+dJkFnd9JtKpdr8Y7+1hUoWqFSHfNvaNknxY7RKz0Q82/MreCX40muTIOG4dpOEfqzz1IL4AQNCwd08ik4T/p5mSOxc7ybjsKvBz0JrpSiaB7MevS4qhWmHjsq42OLjLi44saeEITgko9RWQI=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CUVkqNsLYvV/rBPD9VHoduBxEYhuM0QyNikvvJSSTDXZri2tcM2jy5CvS+mg2CMD0B18Q8vWWdhbGnqz0TJdM0PgZmlSWL5tcI9wyU3xWccHiu89zQDUE3/lXgWwelu8ulqHyj2kxHklWYf8ey7bIR5Tw2EKC5GwHFCYl4J7YL79KUAsHS0M5S8QGvQDlmd+eKV3YccLslNxytHupiRxlf0PTaGmb+Yj+NGTjDaki3/4v0pn8xe6+Inn+us7SRF4NznTEUbTO43ppKmTkRPET73gu2Z4TWfXukFxbT9ggmTvDXUFU2QG4lpvjKNB5ueLGNdrPd4lQZKWH60RdPVE/8o3+vbu8KJWzn6Sw8ARkzpVxmSh287Yw4O6HmIf9kqJ0b9VmyI76sclPwCvPVgKICONxmFLrwZKEnG59j35S6QR2n5vnLq1WCBVmnzXofUn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:11:08.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 149d6917-7978-4d46-e157-08decb97f738
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041114_596216_EA6ADDC1 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Jakub,

On 6/16/26 04:51, Jakub Kicinski wrote:
> On Fri, 12 Jun 2026 00:27:44 +0530 Meghana Malladi wrote:
>> @@ -169,9 +169,6 @@ static int emac_xsk_xmit_zc(struct prueth_emac *emac,
>>   
>>   		num_tx++;
>>   	}
>> -
>> -	xsk_tx_release(tx_chn->xsk_pool);
>> -	return num_tx;
> 
> Why are you deleting this?
> 

xsk_sendmsg() also calls this without an rcu-lock when transmitting the 
packets if the xmit was successful, so I was assuming it is not required 
and I removed this.

>>   }
>>   
>>   void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
>> @@ -279,9 +276,6 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>>   		num_tx++;
>>   	}
>>   
>> -	if (!num_tx)
>> -		return 0;
> 
> Does something prevent us from running all this code if budget is 0?
> If budget is 0 we can complete normal Tx with skbs but we must
> not touch any AF-XDP related state.
> 

Can you elaborate more, I couldn't interpret your comment here

>>   	netif_txq = netdev_get_tx_queue(ndev, chn);
>>   	netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
>>   
>> @@ -306,7 +300,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>>   
>>   		netif_txq = netdev_get_tx_queue(ndev, chn);
>>   		txq_trans_cond_update(netif_txq);
> 
> This looks misplaced, now we will hit it even if we didn't complete
> or submit any Tx.
> 

This code needs to be hit for packet transmission in zero copy mode.
emac_xsk_xmit_zc() submits the packets to the DMA in NAPI context,
when application wakes up the driver and triggers NAPI. Once DMA 
transfer is done, irq gets triggered NAPI gets called which will handle 
the tx packet completion + submit next Tx batch packets to the DMA.

if (tx_chn->xsk_pool) -> check ensure this hits and runs for zero copy 
only. Also above check (!num_tx) returns early during the application 
wakeup (where budget is zero), hence it is removed.

>> +		__netif_tx_lock(netif_txq, smp_processor_id());
>>   		emac_xsk_xmit_zc(emac, chn);
>> +		__netif_tx_unlock(netif_txq);
>>   	}



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1415EB362E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=; b=qLjOp+fqWSro5gSiqHmcvlrRRC
	5gsbhP2TXqQhHhKlg7+n5ATpwtIQkM7NNXtqCQ/k9EDlN1Z2qqt+3t56TaXop+blaZ2SmcCM7RlFI
	Lws+brNysWVIeYXhgy224ugfEIctX4OfZYmMQT4b7O4DQn1lp5Ap8O8CQnGNGT8IgMqVmnQ8fgFvU
	e2rWLl9D0/4ggK7OBTEWyJvVoBCw3BRkOy6SXnwCngcwwFuqT2WQVfEtUp0xOXzr7Dqr8qy0At6ZL
	3Qvpp5CiYlndKEt48iFAm1jRUa3ieiHyqBtPmyQ3iCO09XU+QXmXd/CInrUiTICompNCBJFLjRb++
	6lQkDXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8zW-0000000Dk9C-34mC;
	Mon, 02 Mar 2026 19:31:42 +0000
Received: from mail-westus2azon11012026.outbound.protection.outlook.com ([52.101.48.26] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8zU-0000000Dk8s-1zBL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 19:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT7dz4gS91WWDInYtcw+DF559h8l4ixnMh/w0WBlh0JINMnHJGojv7/779+IQW2ibIDJaT2zdCmlabCtAbHjrdUPVI3pcmhdV3AP8PhulngM4k2AfQrcgAKd4uYMiNtE9uXWLE11IWxVMkCoGf7noMgdE9s0K9RN3VA7xfu2v4vcF2eryfsef281HGcpVe4nosz6yaDBhEVblIwYLQwRDRKlOPscabIU6R82EYjY8MJPTarHLVMT3FYCvXMgJ5jrzmUjf9rmTl9RdsLdVC8xaSH9HJr4dxAQqjx/Y6gLQAi2f9937jpGNrZFy2P6eHngmSJtB0+Ls24cbmuv5+fODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=;
 b=YYxz+DTMicXe8UDPzZ5x+Erz7FJ2nDINm/6o1A3Xu0l/Fne9g6PMq2uPNZynBDGoY/xXLyjT/kfJofgT5HdU4vRr2v1tjcOCrCq1jJpnR8mSGJuylM8jtFSfdXjpB84tQOBa18LmYep62PpuBT03OZ8LJzUEXC2s1mTnHLDSTj0QiLsqSl3Aa8+cybDg6uvh7Ro4cHf6mryl/ym3XJ8CWXSL7zLU7wd1QXxv9oOYuoyIzF/ku2zaGNIYEiYsEDi0/ZY6fqRWUPHHBZDSz6qZKVrv9T8VVnlENDD4ommMPZIk2OrUO/nNzShG9/xHZmQFfVj60U4+o1EOFL9dnZIuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEBdCqbaCJyRzOrM76wuO3HkgOG+DPYxbCQ/RBxgIZs=;
 b=WbraKBWEURa/cHguqlrAugGaXO0MdMYXlfsZrfZtfF5UjprYwFZSmwKhv6pmf5C2AB4kT8DJ5b/+4NaKOaprGuEnhkcjBa9S66JURZa2PpGQHReIDOquzOB0+EZrQyvisaQ67CaAgkMmJ6uxhwXiNXiF5KTpF8WYTwxeU0ssmDM=
Received: from CH0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:610:cc::12)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 19:31:36 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::98) by CH0PR03CA0067.outlook.office365.com
 (2603:10b6:610:cc::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 19:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 19:31:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:31:26 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:31:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 13:31:26 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622JVPFF1323274;
	Mon, 2 Mar 2026 13:31:25 -0600
Message-ID: <1b331fd9-f01e-4064-bb1a-dd65120203bb@ti.com>
Date: Mon, 2 Mar 2026 13:31:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, "Qin
 Jian" <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250813214138.477659-1-afd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA1PR10MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 2554c90b-d9c8-4560-c9a3-08de789251b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: NW+uJgjEzaR10V+UldfIzx49abT2PXXRJjBq5BOLVIZV82Sg9yu+V4T8W2Qr/cJBl7fd+XCDsoT2EziCc+0m5zC8z1vKtS6pqrW2VRK5JSj/Nd4jGllq/R685zZYyO9TRra+UfZ5/9qUjWD70MKGFzhwK8VJ647tX5G22zK+EQurMyAQGGg09MRvTxRrL6nsAMikQZHO3mzUFi1c5lgUNNZlAzwoOm/sFArxic6diwH4VeTl8TbK4YQK5I/+DYvljNL4q5AA83x8qDR0l7UgS2hWk9kwIsW7NHKqjLzTHC7ytjLq+Vik+FQC2UkVBtm9/sTGenBaJk3/6dqVYImYMqCPjjOF/BFTnRxZE5Qs/t1kSrwLXtiST71JS2gy+IEhmVDE9WJ2OayRemlBKiiPROYWU+Eqla1McmzXGlFbY3pMQoscZ0PJKANG8mC7ORRApkZFw+LaR2miOUBiVIpWqdARSr5Y7VHtUQhfcr6mmPUAsBNkYrek7UDwHn+QQq+/nDMLMIeU2qC9IY2MvxDFDeN6CG4PoZfWnmOhDk8tIMzSurOrpMW+8ilw0atdUwlz2VOpBxyy9FaOuOnoQYHU8Fi24ZNPrRo0PtAV66buUhDL3J+Hqp3w1zrBbyOijv/CdUm7MNLEP2Trcc1Wu3fBUV19nPisC/ZNR8bnn9OgiJ7hZOXe4C+rVZ0Wtg0Zi40vZor4nm+NqBdYPrv1JsSm2FkH5AvrfnpuqrM3Y8osBBUpdO2wI9FwwheBRf5pMAdDThS320jb4E9wnIGRRp4c+Wug/U/7zM+735PrPCcwACcInzc4Uiqbauokid70L4krdC9/KZmfqLkQjrMWhtcEqA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wmde/YiKfOdhKZUUDF21KgYP3LZOQXRwF8bnZJPdH/Q9/bElcoh5OgDdVOIpm6gJHhBo2uxyf1xWT9eUyESP5Aqgw2IXPXeHsCkagxW2Rlz0I3+kbFnR+LoS/2xiyF3lfA07BEki/k5FuyipGbi7W4niRsyhd9DoiERGfdU/hsize5GcOuymDpKzMk7oy7cZrIl0X50GwVy4lWxeV2HGWjKBBXv0Q5MdnpIVfc15Za6liCUL1XEZ+e0NL45K4gLyC9gN9FDS5avUNirkjO+hkWPduj3mO7DOu6vbwmc6yKlwmFwlepeXOozNPZlc7fth2LjZ+fkvp+K6muzmBJ9zwIEyUPB7O35mhe/GscURihMENNGEEr5x/o+MPjyPtGUKNtu1C4TahMjW0aTmA/jq8yDWwax8SowlRR2yDc2jfdfuSE7M7+Ais1I9/EH1xNq/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:31:36.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2554c90b-d9c8-4560-c9a3-08de789251b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_113140_725885_59C37302 
X-CRM114-Status: UNSURE (   9.90  )
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

On 8/13/25 4:41 PM, Andrew Davis wrote:
> Hello all,
> 
> Continuing to remove users of register_restart_handler(), this series
> removes the remaining uses in the driver/reset subsystem.
> 
> Build tested, but I don't have any of these platforms, so some
> sanity testing always welcome :)
> 
> Thanks,
> Andrew
> 
> Andrew Davis (6):
>    reset: ath79: Use devm_register_restart_handler()
>    reset: intel: Use devm_register_restart_handler()
>    reset: lpc18xx: Use devm_register_sys_off_handler()
>    reset: ma35d1: Use devm_register_sys_off_handler()
>    reset: npcm: Use devm_register_sys_off_handler()
>    reset: sunplus: Use devm_register_sys_off_handler()
> 
>   drivers/reset/reset-ath79.c    | 12 +++---------
>   drivers/reset/reset-intel-gw.c | 11 +++--------
>   drivers/reset/reset-lpc18xx.c  | 12 ++++--------
>   drivers/reset/reset-ma35d1.c   | 11 ++++-------
>   drivers/reset/reset-npcm.c     | 12 ++++--------
>   drivers/reset/reset-sunplus.c  | 12 ++++--------
>   6 files changed, 22 insertions(+), 48 deletions(-)
> 

Ping?


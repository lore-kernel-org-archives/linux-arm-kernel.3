Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97435F8FA97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah2xOvWaDKLvoRx+Sugm17sPEJa2Hr2jwArmoO66aQk=; b=mU3yQLyILfI6snB6n3yPPFYH8K
	bN1cd5ykBd+RXd9UdCHHnnIu+MzG8CWnX4+rQQDa+/GL2ujpbiRjhZebu/riTmHDtCFsVczGNZypR
	4DOmOoHCdKFhRzew6bPeLhn4xyXGtAq3Tka7RrcrQzXi106I3CUhqsE3mMjTE2olrDNfZvAiK6tut
	chfXmGh0PRxrBqeChmVvw3R2hsfRdNmEuzHkFQNcSsDzYcd84dElRiK5P3aQ4zFA+SW/1ZWFGJQJq
	qgr1y1RbKztc7sUEs/GcuC+HoL1vtUxZ/1+uxGD7CIttVEfm9om2dY2Xa+SJ786cu720eAOIE6wb6
	l8lbAV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDNa-00000008r5a-1b1w;
	Tue, 21 Apr 2026 15:51:14 +0000
Received: from mail-eastusazon11011039.outbound.protection.outlook.com ([52.101.52.39] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDNX-00000008r4G-0AKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqTCQdwwM3/HuCZBIh47e630imaX6TA8/8RGwJVbSgY6geHsEdpGZs9fj7A0Ei18uTLv9J0tcVhbcX1rZeJBX+yIKoUkofvrs/zjHuE4vQfORd+4V402sj3kSuMYNuDSbGzhOlMh5MNS9SdGyl1NbGbfbUJjbxF3EVkDlRM29oVywQ934MNJAD0Dwb2mvtsSxk6vlIpaAEYmW2oYDyMJG4kpTwvk3taAWMfFuB1Vf/2HNMMSLrO95Vaj3819KzZOBuJn6wu3zlllbe3ae9+gQ6C0WZc1F1iwLzXJ421DE8jOo58GsdN2v0C9KdjQGuCOsQ1Dwv1vxyUMwHJtG+rysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah2xOvWaDKLvoRx+Sugm17sPEJa2Hr2jwArmoO66aQk=;
 b=wcBe2lysjyVr9lUKZAHN7fqKx8f2mbPmgIYpj+8aaY5rIWQzUpzYyp9SN6H8XDAFp7txSvltqOMPdkfyXIPw3po+15BMe2egi/OV12ggt40pslRig3JN6qFz3ByVJCX8bVtZumpuW3beGrc6ZE65oTXRnTFsgRTpAk8Rc1td+IiVad2uOF+ZfMlmm7Pp/Ks+YTZfamgz8ySTfmFoj3JEjgpj0YT7IQtqXkdSzN4bvfp0fCFeF5mCJ4STCc6kteNDA1j699Dut7fXFcFnSzuS6JHLBBKW7ODZGGnz1T8ZwtUNAWV+nQhPqaFdbs4XcMVEbJ1cwKRLuljP2YAIUYwiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah2xOvWaDKLvoRx+Sugm17sPEJa2Hr2jwArmoO66aQk=;
 b=jTbn/WX/yeu0qHGdjy7rL2wjLm6Fqpi3PxrkMBG5j5KyEpZ0E/2dAoeTedA2hkBuYG+WD7GRR8/gp4VDCgszvyieu7M/sS3L5050AcdSXjMPyKWJjldaEiUBKX+sWnc+HfgCBBdlcRdr4Oz+huDDHzd6AXpJp1ZjokNDTDxfgiw=
Received: from CH5PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610:1f0::24)
 by IA1PR10MB6218.namprd10.prod.outlook.com (2603:10b6:208:3a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 15:51:03 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::6a) by CH5PR05CA0014.outlook.office365.com
 (2603:10b6:610:1f0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Tue,
 21 Apr 2026 15:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 15:51:02 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:51:01 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:51:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 10:51:01 -0500
Received: from [10.249.135.215] ([10.249.135.215])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63LFov0d736833;
	Tue, 21 Apr 2026 10:50:58 -0500
Message-ID: <d36239c2-98d5-4e5b-b99e-470f4d753a52@ti.com>
Date: Tue, 21 Apr 2026 21:20:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: ti: k3-ringacc: Fix access mode for
 k3_ringacc_ring_pop_tail_io()
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>,
	<ssantosh@kernel.org>
CC: <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-adivi@ti.com>
References: <20260413065125.627180-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260413065125.627180-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|IA1PR10MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 304c728d-14a3-44b7-c8fb-08de9fbdca31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Wiu3voGBI0kyePGzqj+0wyl12m/lXs1T+ZfURBB9bNdedzL6usl0d0uJIXCz1UBUBMl2F0SSX9Kmqs6Zp6zPK/sCGZZAAtucgiJ65cyVy4PEQNrXfXO3oDGa/F4IqCg6bd/9CD43HEWTlSFFf+PEszz482m8cGwCB42gRqmk5Tbkeq+oSkF/U759n+1JV2cITKlRakurfQv8X7SgOWwXNHHFS/CL+QvgeSJFntrvhPMS+O/ZOAksvzftsdpUeoU5k20CuxIsXqKIv4DVXj7/3Oyr14JxhtwwXc/Ocw6ytGNkv138Pfoz/zoGeBK25h8BAF+mScY7uB9BqePTPIOHOZFt/Fl15kiH74HueuXJP5bPCLBaUyn1Whyyi9rrCmSmFu0kIDisv7qhbecqE96hf4iIJRF7TKVQvFYFWByYQnes+67C4y4GwFsbMJdNJc4K9eVAQn9/Y2hueGZVAmr48iiXoFZE/iGa1rLyNX7XZ/MyS4CwW7LYA3n2F6z8p1OS0l4Sz1/4odLGzsKzXDDBF5tSTtxE4TaB9u/ox28tR0FZpU5QhizLIgIojcBq5d0xOrKsOlyWoT2ZRF9dB3GU6t289lFUh0sm6mGsbJzaWyewUM+LlzSeD6H1ZcqYxm/vHwx4hxwrb+KQWPXer+wCJCX+ravv1k5jdaHn9yRrW86RpkklTvf3gRhtkkISptc3lZ4FXBBLM52BmCrj/6XHGul/sCxy2Chku5QSIRhpFVwk1zcYF9czgJVRywfC2j0l4qEUc9e3gCLy9l3BNvBhRg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Tpy48nnqGaYcL9TEc/6hlBtHlqyWQppgzMnH5+cKEsj1UYk57ygRgs+tnY1DPwTXOlwsyVSMGj53m4ZneCErIyKHuwAHVVHs8UU6dW109OCcBRZ2xG9HF3XLUL4sRL6NoGLDIlVzH21R7MINZDkvKHpi9Z07g4gffaooHLNLPyxPQMdIBWbwbqBn1VOLte2A7Xxje3HKJ62nXjEkGiTfK8j4jhk3GXFrkYGP/RwHEfLO4Zmj083fAwsJX8vtoQwEA2BdV8w2HAUCURaf3sxY5SEpiV7dT50x05XbCg/bZDq55J37s1m4f4gfWeCwTRM5DWr7xmMp+QkGg0fF/ameuh5R6XMLFCqH7fkKb8XR5wemldO6l3J0nWeL5R6AZqqX9ua/j3EOTHhfHUTmyNH64MncbMzAkWq0NFDocCaS68we9Msx+w7VTm3xFZx1wmvN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:51:02.2036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 304c728d-14a3-44b7-c8fb-08de9fbdca31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085111_083293_C3D507BB 
X-CRM114-Status: GOOD (  18.22  )
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

Hello Siddharth,

Thanks for the patch.

On 4/13/2026 12:21 PM, Siddharth Vadapalli wrote:
> k3_ringacc_ring_pop_tail_io() invokes k3_ringacc_ring_access_io() with the
> access mode incorrectly set to K3_RINGACC_ACCESS_MODE_POP_HEAD instead of
> K3_RINGACC_ACCESS_MODE_POP_TAIL. Fix this.
> 
> Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> 028ef9c96e96 Linux 7.0
> of Mainline Linux.
> 
> I noticed (visually) the incorrect access mode while working on:
> https://lore.kernel.org/r/20260325123850.638748-1-s-vadapalli@ti.com/
> 
> Regards,
> Siddharth.
> 
>   drivers/soc/ti/k3-ringacc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 7602b8a909b0..24f658e8c1dc 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -1083,7 +1083,7 @@ static int k3_ringacc_ring_pop_io(struct k3_ring *ring, void *elem)
>   static int k3_ringacc_ring_pop_tail_io(struct k3_ring *ring, void *elem)
>   {
>   	return k3_ringacc_ring_access_io(ring, elem,
> -					 K3_RINGACC_ACCESS_MODE_POP_HEAD);
> +					 K3_RINGACC_ACCESS_MODE_POP_TAIL);

I see that you have noticed this visually and fixed this,was there any 
impact you faced without this change like data corruption or something ?
It would be better to mention the impact this change brings-in by doing 
some analysis.

There is a similar function k3_ringacc_ring_pop_tail_proxy() few lines 
above where the same change might be required.

Regards,
Hari

>   }
>   
>   /*



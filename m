Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45F8F94CC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 04:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko9GXkd3Iaci3n7UyVaUhaBHQVeN8C+51txJrwyt8lA=; b=OTOM3JmfTb+V6TSSrR5NzNdn4R
	hkxHjVMYu45X1gFqP4oIcDacdZsNNhwhAR+GWaU+uNVa6Rr88GByMe3m0mZ7XH6i5OzbEE+Pd5MVl
	zC2OhCdbqur3qVcGcRu0eqjsldpNvYV5+LsXNciyyAjGW8CwAanysgRxgPJDAgAF7A2yLZPJuUX8g
	2GqV87eMqECPLN+J6Ai7XRkrZVFad255fpLvdecJMHvoHO4tduOOq5+6+WZuoFSDOFc8zQnI4C/Gt
	3S/+i5P9HzZVf+aRHBCkm6+fHDNx6ux3hBKniishNQ1l9RlCC0j34AyaYw1bHqYLfKW2t03YZltl8
	ijlenUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPZv-00000009b24-1tfK;
	Wed, 22 Apr 2026 04:52:47 +0000
Received: from mail-westusazon11012065.outbound.protection.outlook.com ([52.101.43.65] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFPZs-00000009b1e-0Nnj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 04:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkD1k6sp6+v2ds1p4bAm5s2wKPewWS5Z1aVvfLbn4QQ5pdfZ/ytbnEahFiuyy4j1Ml6BGiXv2eP5jm3unLsqJ8EUqOL5ltYpRlkjmSwgBTiw3UPLh7+mGBuAz3xNljhEWm6oKTpGRuoMvHpj18h+c7TCTfFqiLn7o1+SkOdhqDiUoXZhEqhESWubXQiXPxSQxBwSY2lyXMaTLIDde1wb2p2PO10vcREgc8TuKduj4eazqRUiSgzA/4agckbEBBFCZXegzXe0f/HUHHssYxq3CatpaQBDwQPMaU55S4jSe5NsyxpW2gBgw8sBfGntUp87HQstrTOGGRzAPCfMOBstmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko9GXkd3Iaci3n7UyVaUhaBHQVeN8C+51txJrwyt8lA=;
 b=JcpPD7Cs5/7J96k4LHNAhMKnFzqV44lJcdDoaq5tuIXUdjOaLu106QvSC8VHZy2fnQ4S8/X3QAbKXzJRxTycRaOSmNPMQFgdu8oXx0zTlvX4l81EDliCTJroFiDKLQpvBUAhCzy4cXO+Zw8+K/VdtilJ0X4HMIuGyjfuhVumuCL7lFuCqJKi3as8MJUWVM0wSx3Z7H+WRGSlbS//vQe8GDOkYSs8PhIdOVA7MpDs9Qe45M7fy+cwkQhytPKk2kVrpEVKZy+er9RbaABAEmF6frHVfyVeKSsd5IrRHYcOBOOeySO1CArpb4J2R2WFCukmEr5eVdpdvLOeaExItBff4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko9GXkd3Iaci3n7UyVaUhaBHQVeN8C+51txJrwyt8lA=;
 b=HQgJIo+1oA7ZWpbR/t62d2GDEUUrOE7X28djqyPbZC0bgUGWkBmiDWSAck1O7RGrXgRBvZLgJ7+YkZC1wLRgA7xzJc10xFLpw5gkl2bx9gvmiVlhZGToykvpUPG2qWNwkyD9PscUEoiw6bxdd4Q9Inhgv08i1Pz16O4X4zcI0fM=
Received: from CH5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:610:1f4::6)
 by SA2PR10MB4650.namprd10.prod.outlook.com (2603:10b6:806:f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 04:52:37 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::88) by CH5PR04CA0001.outlook.office365.com
 (2603:10b6:610:1f4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 04:52:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 04:52:35 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 23:52:35 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 23:52:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 23:52:35 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63M4qWsr1530095;
	Tue, 21 Apr 2026 23:52:32 -0500
Message-ID: <60924843-6647-4ec3-b869-bf57f3747414@ti.com>
Date: Wed, 22 Apr 2026 10:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <nm@ti.com>, <ssantosh@kernel.org>, <stable@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-adivi@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH] soc: ti: k3-ringacc: Fix access mode for
 k3_ringacc_ring_pop_tail_io()
To: Hari Prasath G E <gehariprasath@ti.com>
References: <20260413065125.627180-1-s-vadapalli@ti.com>
 <d36239c2-98d5-4e5b-b99e-470f4d753a52@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <d36239c2-98d5-4e5b-b99e-470f4d753a52@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|SA2PR10MB4650:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e9665c-a7d9-43a3-73fc-08dea02af8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TeUuL8OtFaf8tYZ3j80OT6oKIqJHYN2vvH5p9Ny27AUGIrqtTVTZxEjzIwdPk+c7GUyonXylonMMk4zRxK4dBa2jAxB5WmVKZSnHY+A6mj3ooD5UACUavk4seASfbI+hZtEatsmOgfYTkXc8rCKIMKXkfnWV4lq8qQP9pAAhzeN2TkLizs9Bbm+sJEVWIEhQUukoQvrNVQpZi1SI+C2SCVsgKB/sfU07bbUOowxnaIL5nGJSxI+68pP7VKG6DMv6OG13/vxLWe/l67mUZ0X3ehAM2gd6XXfc1StJCYNS0Iu66ANY5+Caf1vMEH7eMy9PBkn+aCeQanLNb8NjTh6sBFvS/3fV3pIkGNGxPL5NJ1hjSi0ep0DxnHqEhTQAPhh7NgZfdZ0yy6y+LtvWmD4ywnee8dbZZRaEAEc//k7b7s3mwTXB3oEEoOTZLCkT0B8+4MojCypMJOPzHCfLxp6PHtF9zCuzBFXxaLTVWqzpKLR/mGAYlOIQHI18jNallKi3MZp5xs76tIJwX+Ac2NYUv2JAvKf/UBO1R+8lhN2V3nMS4G5X/Kok9MulWlE1cFQscy3gaj4HMmAGu0qnFF3BYX70BV+it2kgx+TRw5eSV+ltyeKaVpRgXEkK2A/9PALp2FeYBqcHPNJYWUv2TfF2b2eWUV+2v+6dRzHcM9HK7bgh0ZqTGduj1ZKFUhcmOVEyQJbWyKM411jokoh8Adkkqz737VGrv2DEfeVhQ5aGN2R/4xkSS2mLcvMN0Y+A/gL4eB5TZPipiDf7bWhbLxhXoA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JjDfr5BraoWFxjz8z4DZfqmXAwAszYSb5aXJuhDSJJNDFXBKPYSV0Ub/S8JdYS0UkMksgGlpBzz3MD8Sd0CGOy8pa7K6av98pS3mOuQbvLmCLXX1RfnSpVQC6kH43ESjeXQRlX8GENhE0hNDP9E8F6sgIaOODvz0DGsY/L1YkeV0fyZaskugR9XpdCDJiDbz4YoOEAdsKrRUEPtUHMibY6PFUPoL3Ty6NZpB6f7z9FP4UA+t+uIZ/E19CTmBoeAwhzSGgFHNKA9YUKcNZSmojchl7yYvoq1kW/KEPhKHlbswYfNQTyPu5y2VZyBQxln5bStauMv0uiGhqnQ9h0f9r2ZTTbx3bY/4DObhixIpuy26CzyFj09o4mGNt9DkJtqVq71eIeedV9QerZSIp+Lsd3ErulwksVrxNaLHSzqpK6n2vpTuFkwrj9WILYru3tJL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 04:52:35.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e9665c-a7d9-43a3-73fc-08dea02af8d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_215244_396967_7D542E72 
X-CRM114-Status: GOOD (  21.23  )
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

On 21/04/26 21:20, Hari Prasath G E wrote:
> Hello Siddharth,
> 
> Thanks for the patch.
> 
> On 4/13/2026 12:21 PM, Siddharth Vadapalli wrote:
>> k3_ringacc_ring_pop_tail_io() invokes k3_ringacc_ring_access_io() with the
>> access mode incorrectly set to K3_RINGACC_ACCESS_MODE_POP_HEAD instead of
>> K3_RINGACC_ACCESS_MODE_POP_TAIL. Fix this.
>>
>> Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>
>> Hello,
>>
>> This patch is based on commit
>> 028ef9c96e96 Linux 7.0
>> of Mainline Linux.
>>
>> I noticed (visually) the incorrect access mode while working on:
>> https://lore.kernel.org/r/20260325123850.638748-1-s-vadapalli@ti.com/
>>
>> Regards,
>> Siddharth.
>>
>>   drivers/soc/ti/k3-ringacc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
>> index 7602b8a909b0..24f658e8c1dc 100644
>> --- a/drivers/soc/ti/k3-ringacc.c
>> +++ b/drivers/soc/ti/k3-ringacc.c
>> @@ -1083,7 +1083,7 @@ static int k3_ringacc_ring_pop_io(struct k3_ring 
>> *ring, void *elem)
>>   static int k3_ringacc_ring_pop_tail_io(struct k3_ring *ring, void *elem)
>>   {
>>       return k3_ringacc_ring_access_io(ring, elem,
>> -                     K3_RINGACC_ACCESS_MODE_POP_HEAD);
>> +                     K3_RINGACC_ACCESS_MODE_POP_TAIL);
> 
> I see that you have noticed this visually and fixed this,was there any 
> impact you faced without this change like data corruption or something ?

I haven't tested it with / without the fix above. But if I have to guess, 
the impact will be out-of-order completions for transmit descriptors and 
out-of-order of packets on receive. Although I have described it in the 
context of Networking, the out-of-order (reversed order to be precise) 
issue will be faced by any user.

> It would be better to mention the impact this change brings-in by doing 
> some analysis.
> 
> There is a similar function k3_ringacc_ring_pop_tail_proxy() few lines 
> above where the same change might be required.

Thank you for pointing it out. I will fix that function as well in the v2 
patch.

Regards,
Siddharth.


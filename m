Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D6DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjYJ5Joog7Nys4Vxqd+BRsgSTQvk+W4RVfvDAPdBSCE=; b=d1j0qNxr5QDCjcHQJNLKe5AbYJ
	brk//a3RPGVmwDb6GGURMdrse9HQRp2nTkJUJjaIDCRWZ0Ebx+l+2IFh4BQ81SnQVRUQUkhZwgu8y
	QsKdfmiHHaGPHG4s8T8n+E9IQXN0WmOeuDhEW3mgqaH65i6bV1QOM90BWnbiBKutscCfYOFNbZFs/
	sTRekiKPNds7535WfTPsMMUSfMF8/pBw0BjvXwlIOvlg+SXVFsowg4FOEZWoHUA9ST1VUHwT2LJQG
	B0ORedV2dXcG671s934xvj1ZwxJTjr8Sm0zrxw4kr7m52hzNI1tonKC/jlsi6gLzY+gW1kkex4Wl5
	HTp3EB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFvZ-0000000GM0Y-2JQw;
	Tue, 05 May 2026 13:35:09 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFvX-0000000GLzX-2HXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWj7KMHke2Nfe/yoM2UCbP7U20KDikA5I9i/bYFofTUUhXvhkVf3K9fk1n+025s4WafjVh7umJYhhJuo+78RcOVnuuR2e3Umjm3cXMK1+uo99pkybG0jnqtseQzbTR8DskFTBZw6QV7lFjW5ECWbqx5ZfQpA+nGd91fkv6AqWX+d3+g7oTf4VEmyRDcyzgpG/zAeThRBMVIFsYvC42Qowo/tJo+yaiOlfqOfqxYtj7X9PirS4b4xVXGQkH+pRMQ7D1FrJA9078nVKwsZEXxawyxxpXn9OLPWzeHYz56o3X1xXOWaTPDac2vQzJpJvWukYVm+UWSbDSKStG48hsTR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjYJ5Joog7Nys4Vxqd+BRsgSTQvk+W4RVfvDAPdBSCE=;
 b=pNVnuKA+RzuQdg17+k5S0YvA3iLFs///DnJc/OIsnjJRh+43vdzRIP0tWfM3jPMXWeLTXbm/IoU46s/xfJ44wzz/oh2AAPj2qet4ZXDZSeVZarPSdY738dBh9YgrE0iAYVAyBDUgduDYa5Af8g1+dtXNZAW3K5muHBLjHP6TFPKA3AOhOQxvj3GkLF+ERSdn6sn+4Q1pt9Bh/hLMnP5ZESYq6/6h2zO5W/tYQ5gydiLIACl7ZeSStYAgS29lbuUmpIA/OFG3QctVrWqEE1tN8202CvgUliRTjW2rbFMg/ayY4ZYc0EKw7h/n55f3CSf56KBQpXBBwByuFxO48/3qZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjYJ5Joog7Nys4Vxqd+BRsgSTQvk+W4RVfvDAPdBSCE=;
 b=fcmf907k4lp5Qcxf78a3F40ePXS3uATwCuROuAQwRzmEZnTwmVwVPDgmqg4OAziHFN4XtqXYfEyZ0SUsXjHAEX83eoug7PevET839XJdWOWSXG79yRwifLmeQoOGSgPJ/hLk+j/O+6LzLTVxXPnxnGEQ3iJ2UmiddE+Z/CZWzJk=
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by PH7PR10MB5831.namprd10.prod.outlook.com (2603:10b6:510:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:35:00 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::38) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 13:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 13:34:58 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 08:34:39 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 08:34:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 08:34:39 -0500
Received: from [10.24.52.136] (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645DYa9U3061920;
	Tue, 5 May 2026 08:34:37 -0500
Message-ID: <1a379b9a-cd2d-43b6-ab90-c605fff432e9@ti.com>
Date: Tue, 5 May 2026 19:04:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: Fix access mode for
 k3_ringacc_ring_pop_tail_io/proxy
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>,
	<ssantosh@kernel.org>
CC: <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20260501124129.362192-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20260501124129.362192-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|PH7PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: b335beed-9294-4bf3-e808-08deaaab1a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: sbTeJLezMk/LfdLiXd4Gm32C7CBUmcMhRrqdNAvybpNDFEX6hun6Tb49XqgzjqgHFjN7vt0PfNpK1KFI84cZMKuA1tXEoC4XClxouDm+5UO0ZlWx8aaJNI/yE2ZRoIR96w+9f133eR4G5xLzpmtSIV5xbEoS1nFyASIcb9Pnno3SPFwZFDhvext47xlm6b2cYTPZLG8VmEJnjm1m861gFGs93invZzYe2+sy+8xK+sIck6TVlQIuP44SGjGGFbnEts5/5AyhsaFwDXzZsXgVpoLACPhJicNWZG8lYPTxvUJRt33Rdqoe4uVwTh7m/tHRYXcedV29/tFf7fCIMz1SQR1oRlsDmpntMdMl7FK6y4ceVvr4LrvK2F5wWKRoXIJztHVCsmGVLs/pfM3jNgS9qkFmx0V8UfXWzMN4F8wW/z6RQgLEj1aRkKBU3z2hA7mwylMvJLHsRh8XQpGe6wg8CQ+2OdTZBwyAceB2k8nMJ8jBFcS9Gr9ys5F9UDM0mFmJRw3pBw6Vd2HWEZeUQdtPtEfZeOehBm/L86xfumfjDjvFDwnoIKdMdtRxhEJiCepbncRW6hrd9T5hBb7JkaOAg/3u7s5TUVIbU4DE6ekS+o4iXKHvfGD2Y2XtB/dLZoBAZ8mDjiw/8RGbShKpIWBjdOGGhFpVm8q1HHrwNi7fSpJ39lN2v+GZSAdmsiQcBFJUrmYDvIWYQDX/f9/WT9ucl3NbTeje6XHTvFruiMngQ6o=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BLfBd8LRuNeTlOLzSDINBnkZbs/qPNGYz4yuzKNFSqJE4+/KJfCx6LHAEqMQoVD/dAZoImbyG97dxF/AkXKBSl0dmG9wx0oiUHTSCo6LL+N3/6soVgpEpo4AjHGufTnhQqWcDqCWDyF34ZpmKvL2twDqM7LqFURIj0vD/0MCrQLpZ/DgqwK/iAsw5jOrCWiTw67D1h6B8BQp118z/ij6A+2zICi9oXWr526G5GIbme+a+vCyDsveP8CiuF70klgKnTOep3FXr8f6Oq7ImKdcsoIMUle9CclBTDk4vXHD/iLUNoVxH6tjDhOe8fY0MbJlHTDB4kBQ8BPz4uFhKs+P56voDlQaMCcRfAilNVWXsxWN0mifGymIsvnwQiw3GcqkEewR7UJwGs3ug2T/BMQIQNzxk1d6rgY28EDXAyeFcIrc0uXWC2aX4hVB8Ugt38zj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:34:58.6771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b335beed-9294-4bf3-e808-08deaaab1a25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_063507_594271_127277E2 
X-CRM114-Status: GOOD (  14.64  )
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

On 01/05/26 6:10 pm, Siddharth Vadapalli wrote:
> k3_ringacc_ring_pop_tail_io() and k3_ringacc_ring_pop_tail_proxy()
> incorrectly use K3_RINGACC_ACCESS_MODE_POP_HEAD instead of
> K3_RINGACC_ACCESS_MODE_POP_TAIL. This will result in ring elements being
> popped in the reverse order of that which the caller expects. Fix this.
> 
> Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Thanks Siddharth.LGTM.

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

> ---
> 
> Patch is based on commit
> 26fd6bff2c05 Merge tag 'mtd/fixes-for-7.1-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> of Mainline Linux.
> 
> v1:
> https://lore.kernel.org/r/20260413065125.627180-1-s-vadapalli@ti.com/
> Changes since v1:
> - Updated commit message and fixed k3_ringacc_ring_pop_tail_proxy() as
>    well based on feedback from Hari Prasath G E <gehariprasath@ti.com>
>    at:
>    https://lore.kernel.org/r/d36239c2-98d5-4e5b-b99e-470f4d753a52@ti.com/
> 
>   drivers/soc/ti/k3-ringacc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 7602b8a909b0..e2ca380812d2 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -1012,7 +1012,7 @@ static int k3_ringacc_ring_pop_head_proxy(struct k3_ring *ring, void *elem)
>   static int k3_ringacc_ring_pop_tail_proxy(struct k3_ring *ring, void *elem)
>   {
>   	return k3_ringacc_ring_access_proxy(ring, elem,
> -					    K3_RINGACC_ACCESS_MODE_POP_HEAD);
> +					    K3_RINGACC_ACCESS_MODE_POP_TAIL);
>   }
>   
>   static int k3_ringacc_ring_access_io(struct k3_ring *ring, void *elem,
> @@ -1083,7 +1083,7 @@ static int k3_ringacc_ring_pop_io(struct k3_ring *ring, void *elem)
>   static int k3_ringacc_ring_pop_tail_io(struct k3_ring *ring, void *elem)
>   {
>   	return k3_ringacc_ring_access_io(ring, elem,
> -					 K3_RINGACC_ACCESS_MODE_POP_HEAD);
> +					 K3_RINGACC_ACCESS_MODE_POP_TAIL);
>   }
>   
>   /*



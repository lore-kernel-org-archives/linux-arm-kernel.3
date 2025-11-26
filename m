Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A183D10F4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyTZASLo+Ob5XoP5TyC2d/kG1r0WWIstKnm4njEC+Tc=; b=zAtvu3KSW842k0sajB8ioNxkAS
	xTeertMpFmqQlp86+7GJW8aOX/9ctsklUvI+fGg9kdDDdnZ+p01/7798DXlSKDyfOlV637TBa7F5/
	9+Jdi0q9CvmMmrXkXXXzSQax/694mNCnKE6vnwawgQplO4LK9Kq8EwZGDLI4jGgIP6oNZYUM5VymI
	MHjxHYIg68KmiWhoAOVDVfHorEx3fY/WfFSSm8TwDzqEC+Qi+ErZpv3nRxNnNWMwG8lmhzGwiaHcG
	Y0kuvr+/2n8GPStzECIXo9R9x6VebiuV2Rklv5xxndAa/xT9nU5IVDW8vDuPuvkl3ijyxU72nx+C3
	Gsvi4pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFaH-0000000F2kW-0IbG;
	Wed, 26 Nov 2025 13:29:25 +0000
Received: from mail-eastusazon11011040.outbound.protection.outlook.com ([52.101.52.40] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFaD-0000000F2jr-3ZqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 13:29:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oulqYqQjsM8xZUSj8sgl3qeKF48SwaQApR8FIl8vHlcrnOYHhPzh0qO/Vf/6Qwg+gYn5XvZY7g88mdVUgxgbPUPhRh1soMEPInfHA0s67XvYAh3Ups/BrOJHOIsxOis1ymJ7X3G7FVrBgOeiIpMSQ/Dw8OJGXOfC95Glz0PGERXT0iIaVoZeLNeraNmmrXDQqzHFYPw4XmMbJlsTYzCqaGqU/YejNWfKW6i7iEn+k4vTPI3ze4l9rTGrAkCygDuXyTSZw9kagUIIdaz0b+GFsmFLVfcE9lUq6cQ1QczuoyU3AH8sRA0e89UeJJMgt3dIL7EhWrE9yMZ48SQmORyblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyTZASLo+Ob5XoP5TyC2d/kG1r0WWIstKnm4njEC+Tc=;
 b=c/Kmw7lJ6VaS7K7Q2FOCu4WGqIinNZPIwNtXK7TrerpcA68UX8JZv4+ULe7UQVzS7bHVOiC62kGWuipNTMzlhexwk4UoDlB/dtDXvXTYpIC3c02eFGQv0hGVoh4K8PRIKQXlSKIObrRZoksd0g2SIXU0x7EIinjV4q62WsE889BzuibzvJ46ji8m8iByTE0J7qH1mnO9ndshoyaYoBfu6JwgCwP3rv4+pjco3KjEGY72mMWz2DNRyq9vKzVjIAiUEfCDgsmDfLsEeTm1yjGeJvsRSbBKkVlqkwyNbKMB5t4VSPfMSsif8WjUA2GtQAKZtdxJkUmjxprFACKQ6M/ePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyTZASLo+Ob5XoP5TyC2d/kG1r0WWIstKnm4njEC+Tc=;
 b=YyfwBKV4PDRo+JK7VdNOTT26uarKytyxIkyJH04k2sxg37SryyZUviGy/Ue0kHJWrX9kcKyO8A2ZAKXMkim/E39OO+zYTwH26cMlWVHM4+WrnuzX9LuPuVC/pdZ+uAbZkPPAWDnhTfYwj/lixYlh4k8KqchOshDj63Ev72Xuhww=
Received: from BL1PR13CA0130.namprd13.prod.outlook.com (2603:10b6:208:2bb::15)
 by MN6PR10MB7489.namprd10.prod.outlook.com (2603:10b6:208:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Wed, 26 Nov
 2025 13:29:16 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::4c) by BL1PR13CA0130.outlook.office365.com
 (2603:10b6:208:2bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Wed,
 26 Nov 2025 13:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 13:29:15 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 07:29:08 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 07:29:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 07:29:08 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQDT8RN1311765;
	Wed, 26 Nov 2025 07:29:08 -0600
Date: Wed, 26 Nov 2025 07:29:08 -0600
From: Nishanth Menon <nm@ti.com>
To: Wadim Egorov <w.egorov@phytec.de>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010:
 Fix icssg-prueth schema warning
Message-ID: <20251126132908.4l2w4lu75prnilze@ninth>
References: <20251126084403.24146-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126084403.24146-1-w.egorov@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MN6PR10MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c09118-1e5b-4619-34a8-08de2cefcb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/fxjujnZBn+mxqj9K2v5fzPsgy7Y35RvVGCHD/xPQAfa3UgDU4k5m2G21NCy?=
 =?us-ascii?Q?pLp/lUuN/f5jXhPgu3Il9Bu2O2FKyFx0SauasXHudXLOk2xg6q9QOEZBOHXK?=
 =?us-ascii?Q?DKg3s30OjomG1V/zuCbuU6wxOKEUd22+HvNVdAzUb11/D/zxCr5C7KlidxnX?=
 =?us-ascii?Q?0ICedg/n1KSLJ3POqi3zHmMEaUn21QfF2bAop5vuEYym/C3KH6XJTPC4jCiO?=
 =?us-ascii?Q?j/kl3+pQpFY5CJ7wTM1OX2iNby5k0hDKYJVKVKZYjBMWw0Auu3tusoAIx6j+?=
 =?us-ascii?Q?69pNbkZiy1EKHircMgpMQHWcocH8t8fkutIMZP403/yb5aGpmuvN09UDfRam?=
 =?us-ascii?Q?HrDTnAWvCTQ7fHNySLQ8frIHYH8vhEq0tQ+a3nHzcazCsi8NtNd2LP5Q8CMn?=
 =?us-ascii?Q?AJnFw9ZcH0o8Suh3cqbuAVv3Zkj3eyCnLGRCs9Gx+O9y6ce9DM4Y49Q+LEao?=
 =?us-ascii?Q?Ge6Wd+HgM/NYaZdXniWHfzCK7QdNymrvBf8X/1KWFuST5h6z4pzWaQw31Uk5?=
 =?us-ascii?Q?utT84s4STlXtNXhw3ydik+vniSa9GBYNTnKxPW9nTFdHGe5xq3h3Y6Lzbpeq?=
 =?us-ascii?Q?fqUszpxB00VmxMoWzApHrbql35z2Kf556VuvWzI02ZpEmG6joARNnaWVDQPM?=
 =?us-ascii?Q?c/zotxgTHNC2roCUBn+aXVM8d52r3E7GfQEF7muJGUDEeGS9KIwwunXxgH4k?=
 =?us-ascii?Q?AfvnJaBdayaM9Lhe1EnobCWMlOr0hWg/e0iedAUZ5/WW227deaXhqF/E+BUq?=
 =?us-ascii?Q?1oVdNvpjrqZ62/3R2XpBAvlYGzy+HAridZaLbEvNVtMXXL3bVdXkhpruu+ve?=
 =?us-ascii?Q?UDwO8+uk4kNLJInDdg3bUfKNzgQbdNvf9M8xZrZOJB+f1vtu1CngNMay0oAC?=
 =?us-ascii?Q?j2uJDAQDztafUlUtG+wzajWDuxiYA5HT7aDYTY4SpuHvsFylKUUJEXn+vs2d?=
 =?us-ascii?Q?1uYpiY4h/tZaDc5bWinDTM70YmyJ2Z1yVQhMDOqNqPakVrZ5OWpy9up8ubEe?=
 =?us-ascii?Q?4pbZkys6yLhEfF6StBH2XenZW1yVgKAb/mrb+J9dvcx9/F/WCtb9dgR7jQ+o?=
 =?us-ascii?Q?lygLrqdIneF/uvaVfSQJsZOJr8mjOuui4v9oO69ZrgmSTJVspLOBb62Ry+ZY?=
 =?us-ascii?Q?zVH5kX4kO/GFLnA7pnn8cmReqxWwPUQ+qA+oXYXA2j4tlu4enBSF2rkPlNaX?=
 =?us-ascii?Q?hwrTqGEKQ6PNSoRS3EjbiRir7z9J5oXggGnbpuqN4R9SAIvzwhRAsjehe7N4?=
 =?us-ascii?Q?289p8T1k4s8aRWbgfLMURPcwC/BuDdst+KQdfR65/0v916YvQpmtzUDhBbaE?=
 =?us-ascii?Q?lz6Efro3accwDW2n77aPHf6TcNwRJbpypNl/jrto50/Y0GJgeDgRKujsjdci?=
 =?us-ascii?Q?uiQu1NyhZ+PGY4CH26rz0q8VhPC/EQrb9ehyvcvLJUd+gien30hq5H0qxCNB?=
 =?us-ascii?Q?Z/bPAoOXGr0DBCXad2Zc2WnJXEAgDvlRIYQUc1Jwi+iUpjU8itjvvriV4m4E?=
 =?us-ascii?Q?eXTioTG40t16W4FaGwlyo7GCg2DLnyR7iYbvvT9GWQ1xwQbL6jjXkBmnSRUh?=
 =?us-ascii?Q?sJxW85KlcPigz75t+TQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:29:15.2980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c09118-1e5b-4619-34a8-08de2cefcb61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_052922_065890_0445C620 
X-CRM114-Status: GOOD (  14.15  )
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

On 09:44-20251126, Wadim Egorov wrote:
> Reduce length of dma-names and dmas properties for icssg1-ethernet
> node to comply with ti,icssg-prueth schema constraints. The previous
> entries exceeded the allowed count and triggered dtschema warnings
> during validation.
> 

Fixes: e53fbf955ea7 ("arm64: dts: ti: k3-am642-phyboard-electra: Add PEB-C-010 Overlay")

Perhaps?

> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  .../boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso   | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
> index 7fc73cfacadb..1176a52d560b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
> @@ -30,13 +30,10 @@ icssg1-ethernet {
>  				<&main_pktdma 0xc206 15>, /* egress slice 1 */
>  				<&main_pktdma 0xc207 15>, /* egress slice 1 */
>  				<&main_pktdma 0x4200 15>, /* ingress slice 0 */
> -				<&main_pktdma 0x4201 15>, /* ingress slice 1 */
> -				<&main_pktdma 0x4202 0>, /* mgmnt rsp slice 0 */
> -				<&main_pktdma 0x4203 0>; /* mgmnt rsp slice 1 */
> +				<&main_pktdma 0x4201 15>; /* ingress slice 1 */
>  		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
>  					"tx1-0", "tx1-1", "tx1-2", "tx1-3",
> -					"rx0", "rx1",
> -					"rxmgm0", "rxmgm1";
> +					"rx0", "rx1";
>  
>  		firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
>  				"ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
> -- 
> 2.48.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


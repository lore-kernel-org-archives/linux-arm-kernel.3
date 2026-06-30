Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF897C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km75tYpH/Dsz/FAPdHDoIUk+KJ4GxYzmdPYh1h7r+bc=; b=4FAs1UR5/JSLraPes+2YnsBzo/
	PpRs/wQc82qpC63gK2tHVpCUelqbtN2ylxBwkiZxFfMGTfHBg+HphRAbcM9ruQt1DPHehVuoXF2Ud
	gAA6ASlJyBDcVB0TD7PZ3YyHtdm+5jwLTpTojttQiRNbN5vcR6L9y/kqUOxdvDS/0VPArYb99J8pl
	TRjUPDJMVTOItWrWhKi4NHPkBYo7MXQjnHayBTi+I+RzNJQMiJI2n/bYWDGt1x9kf/SNazm/nr2KA
	3Nti/oPNbtTaiC5AXsFRbSn2JQtQHhNKHSsjsTClebIMCidEY3kpsFL0lpxGyLY13xb79Cy0XOEPA
	N05aRI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQ8N-0000000Fm6D-3KJC;
	Tue, 30 Jun 2026 04:31:43 +0000
Received: from mail-northcentralusazon11012039.outbound.protection.outlook.com ([40.107.200.39] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQ8G-0000000Fm5n-2pPz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 04:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbHuqFm7slv3M5vGIj/LT0i0mAQdV4He+D34v+R2SoVqzO7+G+0gw4q7HnaEL66OA++zH5C06ezhoHSUBv9zp2S469CZ+nZMUuyonvW6YNemWfJk6bekVVmu/hywDjh78R9heflGYheMk09mgmo3gTO9uduTdq/w/bCd5FBs2B8BnAoRLD7uvx1MvXGdK110k1fxpbP+8QGeVBVqYdPFpG7a8inBKvgaEeiwwGIY/IM5p0npix6D/PwX8Oezo3d9ye7vhGDF7iv956nKnW9bERNtQxoCv2/bGuyGLj32C1G3VwOlnyJjC19NZ1x7ik/czHWTkzhTPAqS/7M1rWHoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km75tYpH/Dsz/FAPdHDoIUk+KJ4GxYzmdPYh1h7r+bc=;
 b=CxQOuT+g2ABOZbFcC0WAl0Qt9bIoE5tNznwln/Scp7b4H3jqt1lPR08+/jndvZ+BTDc0iRZqStq9nv+7dpCuesyFRntlC5DpDe6RA+pdi8HOTZlTZSlx3YjBkjjnnvyW3IPP0CYb0dTtHvuAOs1Dg10u/JKxPoC3uUie/uoZ+8iB9wcxxMYvJ658yC12OSD7VKIsWqzlw+1gKG7xOlz6EDHZpgSoMOvlR9NSqtddeFbkULjhzLIXt2xszlUikmyood0a6V9AjRJYeYcE9MuHtVyCNc9JQlxx7xARE8G8um439xInoVOpRAF05ATvM6Wr5uUm/jTCZ2WbPSS4aPSOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=km75tYpH/Dsz/FAPdHDoIUk+KJ4GxYzmdPYh1h7r+bc=;
 b=czf6bbtQihSm7L5VwEvv/sNSM4FBRol98v6drD+KRCc7V6DKtUrSKeysIV3wHm9Zxgq/2J+Zpx81n7KMIXnV1S+j2NF/7zrx6vFgO3OS/D4wzK1zYctomzMvRnDxSSqqFHroOzsRrD8Aqlx+rnH2d3WLUt2r8UaC1fJ4PZ7omU6pAKTtQzIrVHY6MNHK0eat7AGppMaewAHywKF2HwkG2IIV4AdJ3cZ68MGvb8bJu37g0Ch75/pQtIzWqg/FWTEbyjPADpMjz96uKVwaVVJvIYco+vTWe0myWDqYNlBfMXJsgqX+eUyw2YlgQmmN1xhUbzcfJL3JH8qMEh9wWDs+Og==
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:15:08 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::52) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 04:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 04:15:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 21:14:52 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 21:14:51 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Jun 2026 21:14:50 -0700
Date: Mon, 29 Jun 2026 21:14:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <kees@kernel.org>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH rc v6 3/7] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ
 interrupts in kdump kernel
Message-ID: <akNCuEfZ30Gf21iQ@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
 <akIxS7kuhuLRHAMg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <akIxS7kuhuLRHAMg@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b89b1d-f5d1-4e29-5493-08ded65e2ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: jcAQYOH/OPHVlgFjA+gBMyJyHDsvmzxOshOXa29tF0tKBSphgsCC9yUPx0l0rgBj+y9a9O2Gz5wkWNu8vXI3hCf91md3OYTyHA5ghMHNy0P5UaqWymKbgah0yLNdv7789+/awrche2BXhBqiFHhcRIWSOY073hoct/C4C/4Al93jiFHMfsuHNqg61+7vUT1aPIP0jZVm7yPVrvtKNMUbHyoRzzqX6BfJFwrEgLD3qb30ftIW9bMblxVxwXs3Dqc2rfuZ3h7SYyEqJZVxzd0vGVZNCJB0ix+z0/OaD9IsoGoAqzEG1pDG9xgrKSHglT/XkLhmq6vwRcNvik3VC8Z4bMzeBZ2unC75NlWkJsjQv/f6nv3OhHhDPStcwH/KW6RZAunujORWKWS00cxbc6nmEeHFQ/gfNPk7RY20BeCuGkt7zhWXDgvPk34bjCEMIDbPtnWzwdAh6Vaeaucx899ZSm9qcgNYU91r2f3BSUFf50SnaS17mfzKBNeo0X7ctc5QVEDScP4i8sQWhQNZ9t+iLlNnbm1YkW/tFTYNYryYnNy5X8FVjPO0bw+oF5+KGmeec2gX1Xi2uQVLy7fGy5Alp8SebhkJn1yl9+2TgLpGyFBN+X2GNTz12iHj4YXp+A6gN/lNdKSxuOBgQIp7Hf5DRyxGNkHJCHlejrMOdR4TtLmDAg7feQaIAL5hEgW44Rl/8Nn6c+U91eBjdEIwYKG3TQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yXClJeW0YU10mFQY/bxvcoWPe5zau4m8Zf16a1MwvdM96HfPoZgOo2SwPc3inBZ4pZEjnABgl/jy6/gEajjAtjB3MnARzc3VMwuskgz2IsM42X/DmjNNnXP6iDQy0OBqIG5DYKKZGLFtnt7b8qppqN5BjXv2z6n0Cix6tV35xxhWptkOsvhk+B9UshG+mdj3Ll/ENQX79QSlA9UeM2M+sT3e32CizsMxecFG+0+zResugiMKJ9bjSj/UTgytbsrJCdWEgBqdEH89qSggXull4ylteXwFofakW0q29WtvdoHni7Gok6pwrHVkioRpG5GjCjRo0OIjinCJ95PB4GkOdjZZSuaq+5y9Qnh96LIKX3sgreXJZAJVAdCyja7+Hs88Jacxg+Kx3P3cSbehtMnmk8YecBQH6hJcVcPE4/wbIIanWCFm14aIAlcxXJRbPsmk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:15:07.8571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b89b1d-f5d1-4e29-5493-08ded65e2ba7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_213136_727080_9D6A0E97 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Jun 29, 2026 at 08:48:11AM +0000, Pranjal Shrivastava wrote:
> On Wed, May 20, 2026 at 10:03:20AM -0700, Nicolin Chen wrote:
> > @@ -5020,19 +5029,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> >  		/*
> >  		 * Cavium ThunderX2 implementation doesn't support unique irq
> >  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> > +		 *
> > +		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
> >  		 */
> > -		ret = devm_request_threaded_irq(smmu->dev, irq,
> > -					arm_smmu_combined_irq_handler,
> > -					arm_smmu_combined_irq_thread,
> > -					IRQF_ONESHOT,
> > -					"arm-smmu-v3-combined-irq", smmu);
> > +		if (is_kdump_kernel())
> > +			ret = devm_request_irq(smmu->dev, irq,
> > +					       arm_smmu_combined_irq_handler, 0,
> > +					       "arm-smmu-v3-combined-irq",
> > +					       smmu);
> 
> This `if` isn't needed, we can continue using devm_request_threaded_irq,
> if you look at the doc for devm_request_threaded_irq [1] it says:
[...]
> So, we can pass handler() here while leaving the thread_fn == NULL:
> 
> ret = devm_request_threaded_irq(smmu->dev, irq,
>          arm_smmu_combined_irq_handler,
>          is_kdump_kernel() ? NULL : arm_smmu_combined_irq_thread,
>          IRQF_ONESHOT,
>          "arm-smmu-v3-combined-irq", smmu);

Are you sure?

__setup_irq():
1497-   /*
1498:    * IRQF_ONESHOT means the interrupt source in the IRQ chip will be
1499-    * masked until the threaded handled is done. If there is no thread
1500:    * handler then it makes no sense to have IRQF_ONESHOT.
1501-    */
1502:   WARN_ON_ONCE(new->flags & IRQF_ONESHOT && !new->thread_fn);

> Additionally, the arm_smmu_combined_irq_handler() returns 
> IRQ_WAKE_THREAD unconditionally, which causes us to hit the warn_on[3] in
> __handle_irq_event_percpu.

arm_smmu_combined_irq_handler() does not return IRQ_WAKE_THREAD
unconditionally.

This is the first part of PATCH-3 in v6:

@@ -2464,7 +2464,11 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
 
 static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
 {
-	arm_smmu_gerror_handler(irq, dev);
+	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
+
+	/* In kdump, EVTQ/PRIQ are disabled and there is no thread to wake */
+	if (is_kdump_kernel())
+		return ret;
 	return IRQ_WAKE_THREAD;
 }
 
Nicolin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A87C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lto7NmFMG1B8lunrjMmiYBvH2BhmZbhtvGN6m7f2k+c=; b=zynrpjPEE++iJGE5IQlLT59Soo
	4dOWNnnyCIow1UKf4ZnXEMoflME4QFIeMVwACqoajXJfFsXGNDV0ugS2FqQVBLAXEBJu48q920X60
	SICoyyp+qrdrTB6mWDD746aiTT2l1k4lppylhAitvhBBb7SVIn+zNQjW6OW0KJfjSr/Izmh1Mecov
	Dl2/xGIf+1ctGC1u7X9kdBUiRJ9t3fO0VqLtnXBLf/V0F9fFR3FhoH3/yDC3LCNl4ZSTT24B8IGHp
	tI53Qje8FFKyQw7QiJbJePweD7ZJ02zCGlEohCB6d8o2TbYsFmjM07MBnV4OKQnx5Pl56WNA6Pv4V
	lacVZ3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywCb-00000001L1K-2Vjk;
	Tue, 25 Aug 2026 18:48:53 +0000
Received: from mail-southcentralusazon11011053.outbound.protection.outlook.com ([40.93.194.53] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywCZ-00000001L0W-0icv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCBfUQ5Efb9KHEEIFjqmlBV56ZeeAouvtQd9a+3/sqPEcSLXtQjH4gtcfsRe2w05T0ranyQlbQO7kQXoCKLpmf8XiEx7OcepZfZVTI/KHhd/3H5nFBkdIb7bWOk5dbzrI4ydCVY2THQe7uGIIFaxjxRYEjkxtKLfiv/Na20MAtRAdDHk4eiV0EwYQOgAiSZNP7Gyfi/fXCXBA/RCXdW/vOZiKe+Z1kYF/EaB1hmgGJ2eESE0Lgh8aI+4BpY8WJnInQVQaE/GQqdUwv4O0WEVHjv2KhjoMAmEYyMviHQn8U3oVWgzOZ4ksvdl70jxKwalVeF4khM9N6YcG2KCt6DUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lto7NmFMG1B8lunrjMmiYBvH2BhmZbhtvGN6m7f2k+c=;
 b=KCwxl2fuNtxorgW9URBG81Yxyo6WUBpLdAeYRGcVUL9LvZ1JfgR4Ow23oG8kpsH2f8+w4+MMkkki+x5e9ictIoz4zxb5TqmFNGID17NHZcbDHCwlEnCwiq1T1SrGK7l0lklEb1ZymCsU06VSe599kIpsFtvBr6aBmS+WN5iPfCFiI5ddx8I/E7L105YzFhQ5wWNsOiC528XjasKhfAlsI5VHCVU8g5YUL8GG1CCWwOUQiApyXkvTGCGSKDC/aV0/aIoR34p8v5b9RsegWn0iVU3geZbGnakxTqaaldPNKv6uZ2zNZABVZm5UPVxRek5fQJXy1e8huo66RgGzaKy4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lto7NmFMG1B8lunrjMmiYBvH2BhmZbhtvGN6m7f2k+c=;
 b=cOX51p8wEzroRR2RxwJDsGr3gB2PRfozhLx0DQKFw84RJuNulPT2EahDaIrysXRvKqnHx043jwIGbIPBIE6lpfAjvrupyLa3s0DTfGzPlLAviLOJTNsUVOHqzebpCkT78SAAX0XdZH2UmhRRJxlWrtu/cz1aIBTg30tEsyJ7ff2LBoxNMrgosWdAl3nZ2nHNn4qV40SrIzpk3R+pgDWEeL2K1JkmwyQYTnBLEoEvJ8pUFotnLSMCCvLc0gEolRtfswYA928ENkkAn2VpTnkI5oNh6atGWQSlOk3Nl8Ew2zd4NyrXPlKDxFws50fhWJxZuID0H6UwkhTPaD7e8j7Kiw==
Received: from PH3PEPF000040A6.namprd05.prod.outlook.com (2603:10b6:518:1::55)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 18:48:35 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH3PEPF000040A6.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Tue, 25
 Aug 2026 18:48:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:48:34 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 11:48:01 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 11:48:00 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Tue, 25 Aug 2026 11:47:59 -0700
Date: Tue, 25 Aug 2026 11:47:57 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <iommu@lists.linux.dev>, Will Deacon
	<will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy
	<robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh
	<smostafa@google.com>, Daniel Mentz <danielmentz@google.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 01/12] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
Message-ID: <ao3jXWVF0qcnVFp1@nvidia.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-2-praan@google.com>
 <178767577112.3356902.15076197547390630060.b4-review@b4>
 <ao3SYLiFAQnsfJGb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao3SYLiFAQnsfJGb@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c13ad7-7ce1-4fa1-04a4-08df02d977cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: M1Ns9A2TjcJKrr1F71H8BUFAV1+M5GwMXSSfjY2jmk5/cM76m7YWhi8XQNBF1dgeZhqXF8KU8hEue1oq1NSOw51BE09Povrye0FddqekybPCN8YObmsS/NlLcw6l7s5d37aHrgzmxUMu45X9M2XWfsAeNa+nA8u7K9rcZVXqVuA5IRJS8RcZG5n+bhyjw5l/V6veOFetZhhmsVjJ8zT8bXq/zz3PfEF0Hozbj++NJFXtlFmE0FJ3nR0k84+OEBjjr+Pbq+/kKsyolsYf4C8H4c/0codngvDWWQpU9FNkXXe0nlEdEf0aCg+EHSWMxzKS8kJPZL0BMtwUee1H2z2Zd2OFJvbvKxWW9A45t4gF2034TXOSfXN9FubOaKMnjbMo8qcWsJAJ36miRd5Nb7UM6nDb+6QeS0o2B0THwuJk0LJJHmRbCs8xKozZTJywXk0PRKt6zq1SUKr23u+9m7UD/hdu3oPoe08UVyYVKYUTgBId7WYxyWuFC6ro6LZnPTvwFaCuvTzBMGxNoGVH7Dni4JsHygGGHhVuNt8UPCfJUQUUFssRFV1TX/0sU2RPKaHl3ZdEoShoDtkwd5dGpuOfdMYIocAUf92NSlbe1/vDS2OtrZWtcue+eshYobfAx5voHQLM5oSX45yhNFjg7iuqmk/AY7/fb6vipD1ZVDRiAfz+snCqwrBf/aiMAQv67/Tv6isA+pfHwMyqjrSpiIezsA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MJUBeqQEWtSvgU5uWJmZWGFGTkwc+8V9EfregA9KRHSCXf3se7SXBpNlhQgwbKYzxGFn80ZkG0o6abal4+c/ql1QFah4fuyUvS4HTTCC0Oklqe0rebJ66iX2cu132lu5gJ8MyJrvNrFRgeJQhd13HXqRaxvOu8rPH6P8Vf1tVFQ5Ld02wtud/lxfQom54zu95317pFaVo171/bUJZFoHTNnr+Nrz+1uC7ZOLsgXZ45U5rsTwdTLYRM5IqWHtjG5GU0JpL79kdL/RFqc1RoY0kjwLgQhj/kws/JDCJH8Ch+nFWMQ2tbR0+PhpGUEI4RNje4U0R9j8GIBKwsQ1D+VRt7PPXuOYU31Cmrm6QHisv7ndxe2B/7FRUxK9c0L6qErO5B2LLLl1tzxaEMq9+EFb3q4jbPRU7T4jo+DQCvMv/0VVBK9I4TliuLh3O46u427i
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:48:34.9622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c13ad7-7ce1-4fa1-04a4-08df02d977cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_114851_212211_E1C3FD61 
X-CRM114-Status: GOOD (  21.60  )
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

On Tue, Aug 25, 2026 at 05:35:28PM +0000, Pranjal Shrivastava wrote:
> On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > > [ ... 84 lines skipped ... ]
> > > +	/* Setup interrupt handlers */
> > > +	ret = arm_smmu_setup_irqs(smmu);
> > > +	if (ret) {
> > > +		dev_err(smmu->dev, "failed to setup irqs\n");
> > > +		return ret;
> > > +	}
> > > +
> > 
> > The sashiko remark makes sense to me, we should not enable interrupts
> > until everything has been initialized and things are ready to go. So
> > this is better done after the device reset call, which is the thing
> > that is setting up the queue pointers in HW..
> > 
> > I'm not sure what to make of the MSI register ordering around kdump
> > comment.. Nicolin?
> > 
> 
> Ack. I agree with Sashiko's remarks, we'd need to call this within
> device_reset right before the SMMU is enabled (same place as today).
> I factored this out to avoid setting up irq handlers multiple times
> across a suspend / resume cycle (for e.g. we can't request_irq multiple
> times for the same irq). Otherwise, we'd have to de-register IRQ
> handlers in the suspend callback. Maybe we could do this ONCE based on 
> some smmu->inited bool?

Yea, setting MSI while IRQ and CMDQ are enabled might be an issue.

FWIW, my kdump series disables EVTQ and PRIQ, so the concern would
only apply to GERROR.

Nicolin


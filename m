Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B63C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKaQ8tRADhoJVi82amtSIawfpS+/XpGfVRPPKIYQtU8=; b=FQ7MlFlOIGZbHFgsPAUF2x+ZbJ
	pc6PmSGqXcClNDswaY20W8BTKhw5z0Yp8qzLM4P69Wod6OAMkIs8P5uk4bMp4UbsmPm7KDxNyMs0k
	HK4mCH/F19ZCoxJjPoWRk3AhvXLSD2trHgKg3K+twS7/hdSiaBnSgR5EdKgLSK7egYuR2ngJCsTaM
	3KzVLPYoYaK37v6PBpel5u68l3kLoPZ4fRK/+WVdmyGZfKitaU3gNWJmLxODRtjpPeH5HQHZgWF0k
	SLlUvCL1YP2k9IO0xYSvDevKFAQxbDuEj/8BTFAmgxZorLL34j+YWSW14ELb+sRCA2EFwFsJ6lt/b
	QQjZwAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxqH4-0000000EiB4-48iy;
	Sat, 22 Aug 2026 18:16:59 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxqH1-0000000EiAf-2qrd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 18:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuVa2pz7Ox1M8VRXOMozlqvtJb6QFQ7QvG2IcnxHf6JOsw32hUMBmcJBIG4p8fbUQ1k35VBfsMJeE1GaKOK8bYZx7wgJMzyrpHWudiI0vL35C9uoVHyQTZpsnEKR+zZa6EO/N10OO4xvitb7rRLMJ0HXlMz5MDr9k7wHeY3toYy8t8en25SrworWzAL6x3Z302RcUtkxSeWHZEQolYAYwRtKckzMMfHUJ6hX3/jbBzHpx+tp0enSIvT3X7dzw+Ru1ABvx/s7Z0VA42ZvWyGIDbaeMHTSN45AyfAPKDsS8w9bojVXZLpxS32zxPpqkhId9TrhFKHeeKcj3lw1veOiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKaQ8tRADhoJVi82amtSIawfpS+/XpGfVRPPKIYQtU8=;
 b=QgJKtNWLYreogjxsqwH8mrS+gEXdSI980s894uJoBQFnSZIjYrkzPSLqQeU0HLPWNqSar15s5Oreia4RkobrApjcfgEXI/7JGBO97cAYAjaKm4OkSSL46LEjiJMWZq0elC2CXDLeqRaRBF7DsATttQADf2fOUH3LkFuXPj1s8gIddnGzNRa16/wr3CmZwaAZLq0OVhrs+rjpohQCGpmydcGEgEcZaoD4nhMG3uMcxOHB1VEvkrEQlc/PkvVhHJCKlKDANEK0wuOyW08OImHviznKdmLKnzMoJUzB3QiO5HvpFNxT50rp+EHZHzno5Ei2HEGBtnSvvAZItPV84klhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKaQ8tRADhoJVi82amtSIawfpS+/XpGfVRPPKIYQtU8=;
 b=RoFwTOO6e61amDmtXZTS73byrwNGsZeMb28DmXBPKtMLiWEL7OXxAww8PwJULa9cvnM3yFLNmcGpkqwHFPRaeUtktRB7y0kdSnYdMjhnB6JJ4SlyOvYNapD2x4wO38mmkvjIynKYMG73g6HGhtViCzOnZJgx6GyL6SR3J9TEqpyM7uYuiEvyjsDNy2YsvzJFkF5sBj/BFb6UYt0cttG1eiOchs0ip8mO4HDYKI/nfgFXTFJ9+5Z6O+kQmtBRd0sdzWAXCYRG6QPHEB5wj8uew0sBzUh0Sv/T1YsKqNEv1UH6y3/MzPk7oinCHlDC79OFWuxEYXMMp0T0ejj5zMw1CQ==
Received: from SA0PR11CA0202.namprd11.prod.outlook.com (2603:10b6:806:1bc::27)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 18:16:48 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::25) by SA0PR11CA0202.outlook.office365.com
 (2603:10b6:806:1bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Sat,
 22 Aug 2026 18:16:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Sat, 22 Aug 2026 18:16:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 22 Aug
 2026 11:16:38 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 22 Aug
 2026 11:16:37 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Sat, 22 Aug 2026 11:16:35 -0700
Date: Sat, 22 Aug 2026 11:16:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3-kdump: Implement
 is_attach_deferred()
Message-ID: <aonng6MDJ/s/MRuE@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <eb795edf2598c6df57122cd5951393ac1a860bcd.1784663184.git.nicolinc@nvidia.com>
 <178735412602.18212.5709943748630447883.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178735412602.18212.5709943748630447883.b4-review@b4>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af09dcd-8c3e-43fb-9aee-08df007987b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|22082099003|56012099006|4143699003|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: swXbIQo2jM4Y5Dr2GOJELsOtq9Kj0cqj9b/HdbXfHiEwWxwc0IN7kMIhUhlzr3IUTcuaFrxGXmwdiBGFotMw9G7gkNEL9xc0iAB/J60Wh9gic/eMqNMmw1CdypiXrDqglQU6Z+TYqJMBI+DhF7eG8sdPZXjAfwcFW6qqWYzNv8FEN2cXLOLrLXeKKLdiRB1qKVqXrMChq5GL02EpVOycpnpYudZsSiLtmtACnFyXe/BeiskCFc0SSH440HOZBLVIPjNmQRCJt+9ULhn/GnTi0nF3HixI8Set1oSnRRR6Js3RksVCLKaZwFaI54DDwSMqxhowvKa9oqUxqlu3mgJwEL1XeuEwU7xbfDW3n+4IrndyMc+H2POkmnYEbV2bBoZfIMluwACuTOrUGyY0aqwayzNeFNC5kpBISxCJRMwcYAjciIVHZte8cCsBQ3pXZ1AKKnCkeImMjlFAPpXg7mn+wlCh7YRfAp7Cf7m5PQGuo1rGKqQoAFJJffKzkuMuGMK7wzzWLIiEwDh4OXFfvTgdazu+3fU7G2en3LGIRUjKd0RQchJvA+zhRYq4BN87bem26p+znlnjuAC0XzG17rU2SYMKpLkG+T7p0W4jJZMk7iUWMM31/FxUUvCyPIUONgXEhGd54z0iXWgefsHVeagpSsY4zYGoO67sNyQZr6/tDoTQCktz3elsVxAbxqFYZyR/UdQfby4kt3lQ4wy7q52plg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g6za3Yp6XHSz38GuSkvg5CbZiK/MmGxyAljUikpQ8RwuVWJM4/PA11LOv2MJhkeRmvNjoUR2wHRaO0SL0Z4/mzkyGsh0v38kY7R0U+AQMeVkLNGR+sEnUpBiwuVWvR4eFA0uNyQWRyXBgaF/bgIPVi3HcRA1yTs+doyDWWlhDJRIREeEpKCuyZ1tQQ+7uEcBO0JKB78cYmD3Mvjo1bVm1Ql0Xh5GzIeWO9pKhr+wFoyLAjg9mk9j6N9ciZ+8hdAF+ZDvE/BwLDbc1boNiKPEf/NqW91Bgz1z5ULjGAPvcoeC0tTvMhvL3VNKKsLk2HI/8thkc1FBiyuQuVnXfdXvy6xQklWI7OZ6lBdPC8kXxheb7IrwDVYEYPY0ghm25wab6SKEJtl4mHmCbSEyfMchnx5a3sjBdBpkOutbNl40UTg9i9xZRMuyaASo43JHRjiO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 18:16:47.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af09dcd-8c3e-43fb-9aee-08df007987b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_111655_745253_1B183405 
X-CRM114-Status: UNSURE (   8.47  )
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

On Fri, Aug 21, 2026 at 08:15:26PM -0300, Jason Gunthorpe wrote:
> > @@ -1276,6 +1292,12 @@ arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> >  {
> >  	return -EOPNOTSUPP;
> >  }
> > +
> > +static inline bool
> > +arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
> > +{
> > +	return false;
> > +}
> 
> 
> ?

This is for !CONFIG_CRASH_DUMP case. I think we need it.

Thanks
Nicolin


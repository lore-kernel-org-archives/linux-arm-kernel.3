Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C750CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 02:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5Mwubb50a3a1UbJsaANhGk4gwOh7jVnisci01868wA=; b=tGeCxTwHAgvu9smOS1n4xVUhCm
	1W6VTTIu5+slipjtIdFf4j9VmAIeTBBRjMg124w6pswpXP7ZJmbBEaKZotEstOwb5FNgpQlJpJ8WN
	Tw/kbVev4yU6PBnRiUcfELnPep2atFm6CKeMInLHb+Xb/8ZfGHGeLvxultV6Jl46Dde1ubJAcPFWG
	3zdACFqtXoQkwENq7pf2z6+VyiWAAdChjPTvZ7ejEBs9a9XvdndpTdgv0ee59z3OQIupFF42AUA/c
	A8Xu4FtU5HWVWnI1tBrLTciVfy5ct+0/AcnbsYgp4W2GU5NK9fMCporVXW+ibv0SNewA01QoZL33A
	W1fHKnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4FA-00000003BI4-3Y1N;
	Wed, 27 May 2026 02:43:40 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4F8-00000003BHk-2Xd8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 02:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy0WsjsiTxbF+NfyTjQuhZuKzc5sfieXChEEuPZeUf70zcKlN+IOUKKpYZOYXRsAsxKcTMLagQ9/DFit15vP0XmFO/o/UHh1vzWRLdpFcSCFJlW6MhIbhLv3kkqLKYtde2BTySeIaEVFnqn6wJQ4yeyTPTlupi0314kUAt8TRRC/Llbr07E8Ouu7/nyZzX1h+Crpv16ZxenYaxLrSRJAp9DLiql3lfyWhMkLaEw/5/KEyuLsk2CDyCRyEhBw3d8AZAriGeLatyLrh+fslBk7ZdJrw9v/w2VmUqt6px5rWcXT7pOs2OHZpHh/8p0qkSJTNvU6BNUtPVv7ZwzOnja6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5Mwubb50a3a1UbJsaANhGk4gwOh7jVnisci01868wA=;
 b=odRh5/n1/tr/vXq5HoQnEC4amWY0U21NthNzsvGJ5/nQVngcdf3hB//SCeHocP5H4T7zfqZCxSXY25VTPVbcUinPceG4YOM9RixyCXrmlKMU+Ldu4hbt1a4JoG2BYRrQbsKdebl0+DeWztm+Zc8kBw/+9cuj+XW2bz6yKUhawyT7UKLr6+HZnTsCuhxcAMRCq94ZQKpafyl868I8+bVqtUmoE4KTSCeTVBwcXugKxDZvdN0rjjlYKs2R03QQ7nO+aTSEFvfk76cpOboGgScnW2y38/cMNkVV/JesRPTYU7YjMnfGF+izaKHxQ1UFmSQwTnJGiS7lumQdiIGqOrlr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5Mwubb50a3a1UbJsaANhGk4gwOh7jVnisci01868wA=;
 b=cxDVhskv4GJOZYItI97XApUVYiZeHP2TcBmYzOYuBbZReXkcESqu7D89pex0VouyJG9rtJoS1l+YwDVHX6vxbA3o4BRpxVAhpgvlRK5/mNLkBX7Z7d1bNsbI2q8U15MZ7oW6YtuP1DsDZyQVmlNafhvNVzVS4/OHa2mk9jLpIm9cEDXU1nuebJHQVO/umEG66WUZv6SsHkgW/Ui0YRfkzQpOhb4ueLaQ1x1LfJ4jL+gwetqI3l9SXGjlTq5RO67zKuRcAe0zjRnzAczOT8zn0D0mwMsdgQabXG7SA5pyKShQ1CmLNNCfXKudWGSCQIEEUGnUuGqNJc2QAEUE3wOh7Q==
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 02:43:29 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::5c) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 02:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 02:43:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 19:43:09 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 19:43:08 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 26 May 2026 19:43:07 -0700
Date: Tue, 26 May 2026 19:43:06 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] iommu/arm-smmu-v3: Add Stream Table Entry display to
 debugfs
Message-ID: <ahZaOpADaIep+lWs@Asurada-Nvidia>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <20260520063714.2440584-3-xiaqinxin@huawei.com>
 <ahZUjmpkB8puCNds@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahZUjmpkB8puCNds@Asurada-Nvidia>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 04511953-0113-4514-b993-08debb99bbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 27PHhVeCVwop++EJhvY/60CmoetltPIb01+i9waT7JW4+rg8trohmpUdCldyGgUTPmN715pMoQAz313J9ONUGy/tpfTdwJgc/JqukvcSudGE2rCYuFaGiPPv6Ag5ZmVN8urS/LT+WOp9QpdBOV8mMz2FUDC0KyxslKTVzNlhtKsqf2QuJJ26aSmWXF91yOdqCxdkNp3mA+wFVPLDWsVQy5LnkTmN6AN+owXKn9+8XlOoCsVT9Ak7hIqek6pc1shXrLWz/D5a5dZip4FTsFMWjNZqmNrPxRJD4zJDoWCYCER7q2NbElyIu5mivpkGPiIOVls3Ne/O4sx/AKigGpWNiKTt52Bk9y1IF0RVFMlGhl3Q9GXo6Otagan/TUlDUvQDPJGg4f16q8jsmRTcX0k+V9w84UU3uB+VQBgCKNzCgZOiD1QTNDZlNyMKET5JwDp0FVLrXo6ULA9eDM1aP0fzffHzGUxIFSRpMzGsv1abJyhpMVS5M0l5llGV1aTV31qcV4vMMVyP/2vH2BifpxbjTt3kHBUvoDz1AIp6buvOMzjXbkP3mdu/BPcmZgYSZc+bvEOJdPqU/VmNz+OOtUktAxLNC28yUJLsN10rfgrxKEopd5aTMI0NllF2yQSFkvqX+pjCcI76ZfcJTvv+iEzyX9croyffO7tYSyQQ2R53XZu1BlEneEIRkNjwsTcruI7uuXPlNJhCI9+izZG8ag+5HfQIXXogNaJ+uBlqvKD/s08=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rl37XMJLBAi82Vwo0yZDDvcyFb9xX8bW3AH3ZQDOyCDH4/0TIO8SG17GsPZLEoa3PxRGaX7QQ6gzX1vtB9LeKL5M3Z8bbp130QDqdxwJkb1wDvzK7Tplxi35eNzYTV04JfhYPcRhFrkKMRL+L111IY7oaQtxdIv3TgEhP/LrEOEaybHl41LA6vxB32g3V3WANuKxp8qxVZ+PCRKEzkJ/BjsjaAYJfOf5bR/jthWb/Kmc7yAgwRMLYL8xf0rEWM5CZ8JPNmMvhQcPRb/W22arGfQnEQ8IG8C3oNYVGig/cVHZ0iqu/sSJWsgmz0fz7cJf8QWtJ8pV9l8J9eMIo1NOI+AZ4I1RWBjjplGd5Hw/qRxgiOiR8ZTLyVaGkSO6A8EkMT4096fl7HmGuhciYYMnugH03zL/ZqlNiKdcGbr1zupJWqWhzhXDHXTH5fhaNVqy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 02:43:28.8714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04511953-0113-4514-b993-08debb99bbea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_194338_647272_09ED9370 
X-CRM114-Status: GOOD (  12.85  )
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

On Tue, May 26, 2026 at 07:18:54PM -0700, Nicolin Chen wrote:
> On Wed, May 20, 2026 at 02:37:09PM +0800, Qinxin Xia wrote:
> > +int arm_smmu_debugfs_create_stream_table(struct arm_smmu_device *smmu,
> > +					 struct device *dev)
> > +{
> > +	struct dentry *stream_dir, *dev_dir;
> > +	struct arm_smmu_master *master;
> > +	struct ste_context *ctx;
> > +	char name[64];
> > +	u32 sid;
> > +	int i;
> [...]
> > +	master = dev_iommu_priv_get(dev);
> > +	if (!master || !master->num_streams)
> > +		return -ENODEV;
> 
> The caller has master. Why not just pass it in? Then, you would
> have master->smmu and master->dev.

I forgot that this is to fence against concurrent device unplug.

Maybe add a note for the reason of having smmu and dev instead?

Nicolin


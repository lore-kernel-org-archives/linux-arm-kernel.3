Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3931A1088E50
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 23:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEw9AzDXfMt+jeuUW34m2pXSEoq+jg6ojrV9tE6IEb8=; b=ycdoZA+k1qNiDrZUygICfdXXwD
	xfa6cDrzDWkGzTtmbLf9+o0aOdaOosWSehGd4Uc+rfBTt+2VOe/PMZq79AvLa7XWdcEWEFO/5Z2+t
	R/0DvmHSRZVlcZ5xB2wePKZZwaYCi/DwyU8FYXNchmnjI70BRfS/CMhbj9WKjf8LrK7GwymjayphN
	GDz53fIv7pSIp57AC54jQdES3GU6PvsR1XLuWDQcgB+cXP+omR3xAYmkqAOWflFqqHvyxeDzWDgxk
	VxhPENvXDgjXzhaUxdDdC2Ygxh3f6Sm0UQjWhUdiw4eatDlJEEBiOI0RRar4Yl06BWAt70U/ytZcA
	E36dkJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30FS-00000009Vhc-0O8a;
	Wed, 18 Mar 2026 23:24:22 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30FO-00000009VgD-40Y6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 23:24:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H86kENzidR0D7dksqMn6MC9Vxlr/5uNG48ARal1SBS4KujmTZSV79iTDEw3qN7YPxs0Dl7z7yBW27z/YedFL/ZPU1lwoaCFisvAR/KRwcunUlAQi+kPXSyiTBXT4tbsho5Gc2cntpJFq4OscZv3Ne96QEyXt4yyFbUQi5HhH8frJn+EBO8/oPfGnOYKUIcxr6GbmLpOrsZRgFDbw03UmNdxsAQ64iAZHyOBsSL7U11kwa6j6J9C9hVoBsJseaVcNr/IDw3nZBWsGGpAjjtl91cIg67vup4oGliy47g1GlvJ6rwi1nSTokyFuskcCP3BkWdozx1i2z99rlogqX3pdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEw9AzDXfMt+jeuUW34m2pXSEoq+jg6ojrV9tE6IEb8=;
 b=ytp/CiF89k8tFtC7Qbd9KOLJs6LjXyixkm+HfpKLHZGviiNDrwlkZZM3OHoJRnhFfYguVE4H0Cn9cbLYiexu3xYHW7HqCaLJzPxKgt+Wn+UAsPqMBW4YwBGAfyCc7RixbDiJgmDUvSnz2nXYuqAUqEORKEWeZly1u9jWpXPtMwih1K+L0npmflvUgX6jV1Ztp2sLBnCljSgoagVoP2yHz49SE/qITWBQvpsGWvKu5M0FoUJygIcF9Mwkrx4xiOwSsWggsyknERiaWIar7QnQRJw3hGxm6cj/6xqSiuG3t587vdnMA5Lw/yemmZf1rV88oY/T5Ra+0gRRs6wfOwrRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEw9AzDXfMt+jeuUW34m2pXSEoq+jg6ojrV9tE6IEb8=;
 b=UmM+utiqqqUjn4TTSoKrf7AyH9mzMfpTY44zkM6upCT/713/Bs4qPwX25aIbxxmLCxh/XsD/ER8UtVEUZieMAIzDcYmtGoEs7BCO61Lq5ZFv5rDMEYskA8vH3PiOWNIyInzaNet6uEHzUZrNqbEWAQyWEWH/ou0Fh++NlhYdK9lFtuuEpEvP5sPIV4SaHwZcrllN0l2hwYvRTxx7upNxIEuXxUxAN8foF/81MyR+p0t91aYj2stqWpVkPsfp1bdhxLu/pJZQLvGWqiF2pFXaBoEgjc3GI0vKeHsr0RhP7aCVqmaG/jLbKwZ4qdZHIYaKruxKvJ++GztNe1YMlSBbjA==
Received: from MN2PR16CA0056.namprd16.prod.outlook.com (2603:10b6:208:234::25)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 23:24:09 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::8d) by MN2PR16CA0056.outlook.office365.com
 (2603:10b6:208:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 23:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 23:24:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 16:23:56 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 16:23:56 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 16:23:55 -0700
Date: Wed, 18 Mar 2026 16:23:53 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Samiullah Khawaja <skhawaja@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>, <rafael@kernel.org>,
	<lenb@kernel.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<xueshuai@linux.alibaba.com>, <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <absfAT4jgL2f3UfR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <absfAT4jgL2f3UfR@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: e584c9cf-7ba9-4cde-2054-08de85457520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ttrU0g+Z8i4a4Ozu3WC3tfae8NIyBX6YdbPOoBdsHziOCKW1cU1Qlk6gH+pRlqy0V+fDOyMJ9WQWRxEmkJWne3JlsCKKXq2vQ8WWAlsVfNRG/6uIe6yRYe6ojYnmn0cBk8ZDPRb3CSFwE6hkddWnESTiwnAJF9xFP+BEOj4cULfIk7ggtJquYaqorg2MQONtmOZp4mqjN+R6FWkmm2b60EpXifESNVAlbNKwAecV3GbMnR3rB5J8ZeiAMpmLRqQVu7xTLiPRq+zaGcTkIrTuuSn6DNTpEOkTwG7vTMAMtsirapb2QyGzHj5Pv56XeghV/payhp1Gh931sZxhvhKWruLCnu0gergZWguywb2GZLje1s2i2AlHubr7zaPSMeKDqBw/y7wo0uM6cHFGb2BinmXIDnhLBB0WlXy3gluyhPbMVlxUaf0/UmbLnWEU2OiRqPBELHiddTY/zhrhbHchNvzO5Aq1XF7IhaucbunRG+h7PbL8CSbhUiXNPORA+9U97ge2Af+2C5XPuxsXxhZdzs9nKFIKOhAr6E22Vtt4aa290gsZIM5zzD6SHwqf62VA0cEKk7ytGU4lUw6tK0vUr/z4DD14Yt9N5ukzLtjKqLbHcohuEonsYDMwbHMabF32yfFwMlMkGl+nHmXB2Aub3ug3iWVLYrqoAK2sXwG40odbuqkwHueRCL2rD/uifsm6rpVZHWndW1i/HGEsIa654Hho8Yd71VACCBp+5N+xvcOCnt7TW0NvZ76I5/mIsMwnJFRQSy5/7whM8RuXZDMfnQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J5HpvfVH2g57GVn8hWG+hJQ06Q74BFyK7OemzVvY+PBFxPczuEbylCGY5NRHZlUJHlzkrGGY3WKmiV01yByecLns/0TWpBDgjcxR709VNk6yr+WYRbmOvVAC8JyLJhBN245R6McNKtnhkCucBMqdoFMqcF5DcOLHUeVtq9lUySPPeoIyn0j35+CHiURs7C200ZvXdUsSIdR4fmDOwsPzPRUxns7URku1rQGjvTEmU0Agq5XxYr2buPxpHBKJFX0fLtQIe8hCL7zKcRb8po4doTgBsa+Td0TzWDTuemg8JDgIUy+BU+qzzHzaSxs70NLblzCYxHOngv86COBfMjJ9ZPM7gq6e/UlF83CcRufj80ig6ryzx1icXXZpAbn8guWcFpABy7hwuaYKpGirUj5nevLhY48Db4NqViXab/6bp8GfcnI2kAol/kGR135SSNdK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 23:24:09.5586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e584c9cf-7ba9-4cde-2054-08de85457520
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_162419_177819_A154D09B 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Sami,

On Wed, Mar 18, 2026 at 10:02:32PM +0000, Samiullah Khawaja wrote:
> On Tue, Mar 17, 2026 at 12:15:37PM -0700, Nicolin Chen wrote:
> > @@ -895,9 +898,19 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> > 
> > 	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete */
> > 	if (sync) {
> > +		u32 sync_prod;
> > +
> > 		llq.prod = queue_inc_prod_n(&llq, n);
> > +		sync_prod = llq.prod;
> > +
> > 		ret = arm_smmu_cmdq_poll_until_sync(smmu, cmdq, &llq);
> > -		if (ret) {
> > +		if (test_and_clear_bit(Q_IDX(&llq, sync_prod),
> > +				       cmdq->atc_sync_timeouts)) {
> 
> This will not be set if a software timeout (1 second) occurs. Do you
> know if the ATC timeout of Arm sMMUv3 is less than the software timeout
> in the driver?

You brought up a good point!

I think ATC timeout follows the PCI Completion Timeout Value in
"Device Control 2 Register", which is typically set [50us, 50ms]
but can be set up to [17s, 64s] according to PCI Base spec.

> If not maybe we can handle the software timeout here also as the cmdlist
> is already known?

I think it's trickier.

If the software times out first at 1s, it means the CMDQ is still
pending on wait for the completion of ATC invalidation. Then, the
caller sees -ETIMEOUT and tries to bisect the ATC batch or update
the STE directly, either of which involves CMDQ. But CMDQ has not
recovered yet.

Then, in case of a batch, all the reties could timeout again. So,
it will fail to identify which device is truly broken. This would
end badly by blindly disabling all the devices in the batch. Also
the disabling calls require CMDQ too, so they might fail as well.

Thus, partially to answer the question, in case software timeout,
I am afraid that we can hardly do anything.. :-/

This means I need to set a different return code for ATC timeouts
v.s. software timeouts.

Also, there is another problem: when PCI CTO finally reaches, the
GERROR ISR will set atc_sync_timeouts but nobody will clear it..
So, before calling arm_smmu_cmdq_issue_cmdlist(), we need to make
sure there is no dirty bit on the bitmap too.

Thanks!
Nicolin


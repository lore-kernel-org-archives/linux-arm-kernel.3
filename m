Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020A31088E58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTVTGmdImpDhZLb5RCt/y/ns1LLTlO+l+ajvEcWWtCk=; b=DcdmWCjY7Xgk9vZz7pRiMy5a4X
	YqKsq/isZztAvOpE67HuM5mdZUWnwHXp/RtL/shaeBR5iOYruVwUb1k31PDdsBVk6826NhMdPyQZl
	f5NvQPZcc6TExtbnXLstjcYZIbXUnKn5hOHVHyV/6AAEUJQDWvL72lRWaoMESwqDCZLHq8opUIkwe
	DZH64YBCoajWDlpsUU3gthdslJoQabs5Z60hv7csgS1bf2XjEvuDknaO+b5m4SuEv6ThhT24WTTVk
	glpdxoeZjLrHkYnHUAr6eEDavwK3IhMpjR8G68SjZx3DMRHv/ZkwQ935T5p7uQ4gUvpQ/ZNpKYXsF
	UOdXdDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w31zK-00000009Zr2-20Fi;
	Thu, 19 Mar 2026 01:15:50 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w31zG-00000009Zq2-2UGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 01:15:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRvCMWBFB/Wv+ym8yz3dBsb68Jxrc+ZXvd8yyBtQhrh3bT17quNWABn/ae2sbOLasLX6HYqd5LpDleS2vI3uXhwpUyia6aLEFKqrzpjKSjizcu07ScpdU1QWlrhC/wIkJlOXDeiCsWHzPWabchToM2vPoYbSxtN7ay7bvAPtUQtIGNDNB5CFgY8e9xm9HQcTPn3sTpDGEaCqxIsqTORR90+zJiNFa2bNkf0sf86dwP43NhYCYYQHW9WEfQ8saza1B9nwMSzdaWz0QN4lYMbGVulY2ggpynxM7E9wx+sehI2KOkFtcslKfHyei/tKNcJWgMtVLzNmHExZXX5rWWHudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTVTGmdImpDhZLb5RCt/y/ns1LLTlO+l+ajvEcWWtCk=;
 b=lcrjxlOC/12Y2PEoAsDytsK2CEP49Swf03dG7P0O3MVuQCHmlDqlR58a6o1eCJfwRE9/ywLyWnxAWbqmYUTFmskaAkOVr3CnKVyxurco++OSve0uKEvCoAHfu/IYPTnKFpUdY7Qe+2ooEw5Y2avxhcVgkeMN9tlUt0rjeRd7NQRBw2WBS0aPR26x11D+4io1vupmb9xrgayQTWK/tPIZppfzQqJAad/v3qLYNj+t2+kov17ONn5tzRYtir16THg4Q6MGYa8jWCJN2fGNOmIu2FbHThSVfTHxNICT63tHTUqmVDZBwlpodOh8inSlwEzB8pT9jC5+XEIwtZAOCibYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTVTGmdImpDhZLb5RCt/y/ns1LLTlO+l+ajvEcWWtCk=;
 b=lSUNuwNeCFNT5E4RzSDjcnxT2iwd82MGUUeJXDVH9B78Mj60Wpf7Vk82Mt2db5xwV7QTcat2bu1sSCTMgwmFrY4aSRsyEwajfk/7/3IoVU4LBQVMWohtJyT1++DfuUTXtFkAGRDRirtDMa8oiQxmREdQrf+/7mCN1xbM+Lvg+GEV5y3ilflaNNqOOOduIrxnUII1DhQg6lsU+9KDbYzdHBMwqSvqR/h1i6Yx7HoS0Ikk0L5um7fEQPwtOk4YviHJLOGkaQzLiNaPggaZXX4mbzIepLsWh2x4z877RK9I74rF2rK1fZL5EeT7Sd7i/4x+o0YP7rBeNe6m467bJ9pcWg==
Received: from MN2PR22CA0021.namprd22.prod.outlook.com (2603:10b6:208:238::26)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Thu, 19 Mar 2026 01:15:37 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:238:cafe::ea) by MN2PR22CA0021.outlook.office365.com
 (2603:10b6:208:238::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Thu,
 19 Mar 2026 01:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Thu, 19 Mar 2026 01:15:36 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 18:15:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 18:15:18 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 18:15:17 -0700
Date: Wed, 18 Mar 2026 18:15:16 -0700
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
Message-ID: <abtOJCEwZd754mUA@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <absfAT4jgL2f3UfR@google.com>
 <abs0CQCrFlCsV6Ls@Asurada-Nvidia>
 <abs6PudCAh-eVRPA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abs6PudCAh-eVRPA@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: b474b95c-2f2d-4dba-c491-08de85550720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: QJ7I5poPHBFYn7flxFnVBOSeD2SGAVgWG+BM68QsxI3bJ1uK3ZpbYdo04fpCswqdu1w3M9bGTH/sR+iOXvFgmvi/aq8vQN04cv6ROVk6RYoHzgVvwnzMeXAmMnLKqVvGSx69qeJ6i2UF+VGpOv6939bzGgRpB8KjkulbgFTcJfB5tQ4x8kcAog2UKVq63Z7UFy9rBHwKKAHELyVGRTknjIj+QImVNAf4DU7hQmnJNRgcJuaXjoHQf8h0aIkaRESw74mqiDhnRHKNFfDGQraIRKBZoUDYv4Q8BCe4ylEcp2kj2WmiP1cuL0MFtZwzHJm9NIAjRDPwlJkbV40hDQ5a+UWPq0Op+VRzTX3UbjU2EXRrayMIE7ttwikEOKyD21kJ43pweA6qubSJngmNyjG5RcfsK2CLw6OAWg3jTtS2MF8bUqYkK6AtedquPSa+LldqNoyb4wt8M9ZMHITAsk1Iww6POkNJUll8m2FQE7Gsd5DS5Sa1LwN0zX/VttTXhg57I81msVZfaDZ//9Ly+f8dI5Xh2LO3gcclO1FaC1KcVn0tbn8/98uGHnlHX72p2uUiqzx+FbyVWCB7vC7ZEbXuV1yDy9WiTWVF2V0J17BJIK8p/+hYq94z2kvaXuJWA3lRBJEgTFW6ibzd+KA5baX+VyqlyggNL37nM/c2TQqSyxYbE2D6EbLSF66pPT4mA3LlSFLmdaW27MzHRDyLwmbZtqRaqDoLojzegHacQrnBP382pIqEYcuYTqCtVPrsJUtSlTl5+Ov8bgjjz4+gEW3izg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C7iiV64at77tipElzHKdGRNY+utd1rBPo5beSrA9oOYb5z4aTFt1OvM9JWLfMpQ2B/HM03xoZL9PSCqrnGOCImC7CVc/mQsfIH0CgXT0LZg80Z3iPrWMWHZudyH9ly6LbtlwimteumeytFmfHgQ3AJYGX9mbIr4kJa5xRJioanQwmG8IcAKWCJrZ9lG052tvp9UlzxzqeP8FG9IRGSYaoZnhyVsAokgHLNEkldrmPjdsD69wvBWElBqmZY7MwIG5538FFSEadYRHHzvRM2HlXxBwrEqgekrI/VQNAosIi5S6gd5/BzKgVFD0CYDtENLsoBNo1F85tWOSglJh8NmeGMDYX6jcvUcYdBvCdcgrP3tU28o1FWARYTlb7aGuSz1cXSFr9I7x/Re4AUKxM3Y/XKnN4NQaR0kyOgRv6Ja9U3Sv0F5L6Lj617Sw9aVuzsGH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:15:36.9700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b474b95c-2f2d-4dba-c491-08de85550720
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_181546_660048_E92065A9 
X-CRM114-Status: GOOD (  26.20  )
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

On Thu, Mar 19, 2026 at 12:08:04AM +0000, Samiullah Khawaja wrote:
> On Wed, Mar 18, 2026 at 04:23:53PM -0700, Nicolin Chen wrote:
> > If the software times out first at 1s, it means the CMDQ is still
> > pending on wait for the completion of ATC invalidation. Then, the
> > caller sees -ETIMEOUT and tries to bisect the ATC batch or update
> > the STE directly, either of which involves CMDQ. But CMDQ has not
> > recovered yet.
> > 
> > Then, in case of a batch, all the reties could timeout again. So,
> > it will fail to identify which device is truly broken. This would
> > end badly by blindly disabling all the devices in the batch. Also
> > the disabling calls require CMDQ too, so they might fail as well.
> 
> Yes, looking at VT-d currently and the queue length is 256 and this
> spirals out of control quickly.
> > 
> > Thus, partially to answer the question, in case software timeout,
> > I am afraid that we can hardly do anything.. :-/
> 
> Agreed.
> 
> Do you think we can maybe document this somewhere? Maybe add to the
> cover letter?

Yes. I will add a note inline as well where software times out.

> > This means I need to set a different return code for ATC timeouts
> > v.s. software timeouts.
> > 
> > Also, there is another problem: when PCI CTO finally reaches, the
> > GERROR ISR will set atc_sync_timeouts but nobody will clear it..
> > So, before calling arm_smmu_cmdq_issue_cmdlist(), we need to make
> > sure there is no dirty bit on the bitmap too.
> 
> Yes, Just to confirm, do you think this needs to be handled regardless
> whether we handle the software timeout for the ATC invalidation?
> Basically to cleanup the bit on bitmap.

I don't see a reason not to. I think the next issuer who sees a
dirty slot in the bitmap will not have any idea about that ATC
timeout (batch). Basically the previous issuer was returned and
the batch is gone. So, it can do nothing but clear the slot in
the bitmap and move forward.

Nicolin


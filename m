Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9755CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlIwZqfS4qkAG4wU/kx4+s6vSfa4ae8MTU3fVmSFJzU=; b=nZbaWzrw8c78CU0bvPb0cAXXsA
	g+Dgf4IbnjAZHGftQiUJZc3HOohFelzhEVN6lGM9mrIR63AD1xW/2o13pNUoMjTiwsV5JRSb7eWlq
	mXXzp2690f06w9/ztNw0/l+SXwHGfSha5Dg7IilqxoxpcrOvscrjHLWnGhYYDLKNHbUJL9BlAMIQ2
	l5vJhSiY4tUT4nCFg09JSunIcZ4DeO83cfC8yIym/uu79ftuJHq/936j4t5UFN85WLl8SY5N/6hhO
	CpAWcOQ9Mr39Y2WC1Ae5/nsqF0MQDrrCZJ9aFLY8nKGosjSfZhVmNif2IrrihGFRH6bB0cKCDZkwO
	LB2qdEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJKH-00000009ekf-274A;
	Thu, 01 Oct 2026 16:08:05 +0000
Received: from mail-westcentralusazon11010063.outbound.protection.outlook.com ([40.93.198.63] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJKD-00000009eiw-2z2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig//65JYSSCTmCATYl8upOBWqUI3XRG6YIy7ipMN76HLaxUQ4pkBwGDUmnSvkkletO58PkeAYPyuEPfyYUFltvz5HqS52qIlUbZE2APH5wcSuLbeO8tSEGGiR5/n2ta648y747tuwJWp+69n9gX/CM9aj5QUotnuGMcpD4w93Viy1Tm0u2G1jMhlo3cAsJR/gSu/oPWfGtg0Ak9vuFml/GtD2wjYeNFAo1nYhtv2WuSGcoCpqKComJUPYr2m0odXpe3C1FS7GsjsgwgHnudglJ87uSiElQiLo1QcHBsG8yBl3YDMrVcPcSVdZvvWJQ1jn3DRtqGJPGyA+N1RtmF58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlIwZqfS4qkAG4wU/kx4+s6vSfa4ae8MTU3fVmSFJzU=;
 b=kg3c5mh3wCfExZ8p/Y6or+cFWXL9pIP0FpbfCVJnWGBshBQ/OsMoT2DLUBUdh40X4rX2OJ3JyMFJXolhMtgU1KlG/47TyyZ5Ul+Cb9fNvMFZJIWIfEMj2Na2L+BPXYlGbyyL6w5v53644omzojNnDuP9dtHC8Ir9Jct7aDArNpWa8+4gxHJrUvImXYpzED0rF45C0bVAIR3B3GISzdKLZBin/Bd9KAjAZNv6aq6LKs5pEQ4ApL1FHcXsNzRXOjuW5tXeIt1aNHAV9uf3ERB41IOsf+62AGZKSLIF7LNa5EqdW4BIABRN0QoSCoNOC7FTQzwm6VjmibnsMBuB1MPYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlIwZqfS4qkAG4wU/kx4+s6vSfa4ae8MTU3fVmSFJzU=;
 b=PMV4KYwCOBIK7HZeUnkwPjpHevmUe0roT+vHI/TOU47vHmmAuSV/bxWktesj+ADbiPTEzkURC4O7EcYqe8msp8+9gRvDjuzDJElyQdHH2sp5votjvDBW28NxE31C+MGxvnoVNf8f3TPbnNRcW83A5K9QG433c5PLUnixpAEPkbDUTJrv2YWuuUMb0XOGz+SmAsxGMsBetpS16GMCmvHHnDNMP6Gj+7h1gbnXT9p2t0YMF/VZ05TFrLyCP92axQpCVSixxM2PtIzsevSBy1jbfhyK5/mICxLBlUpcIWCZFuMsfsG+obfBFE0ZBGPj6sqGs9SN52oxmpp9zn4pwt3pxg==
Received: from BN9P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::30)
 by CY5PR12MB6431.namprd12.prod.outlook.com (2603:10b6:930:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Thu, 1 Oct
 2026 16:07:51 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::91) by BN9P222CA0025.outlook.office365.com
 (2603:10b6:408:10c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 16:07:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 16:07:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 09:07:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 09:07:20 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 09:07:20 -0700
Date: Thu, 1 Oct 2026 09:07:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v4 1/4] iommu/arm-smmu-v3: Skip duplicate SIDs when
 erasing streams from RB tree
Message-ID: <ar6FNrZfN+ZXVtsk@nvidia.com>
References: <20261001-smmu-shared-sid-ver3-v4-0-06b34fb2e691@nxp.com>
 <20261001-smmu-shared-sid-ver3-v4-1-06b34fb2e691@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261001-smmu-shared-sid-ver3-v4-1-06b34fb2e691@nxp.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|CY5PR12MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d96162-b21f-41fb-3ae6-08df1fd624d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|36860700016|82310400026|376014|1800799024|10067099003|260925021911599003|56012099006|260925022911599003|260925021311599003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 3Vly5svhGAM0mU+1DJYcv0BpVJoG2d8ban/Ia6i/P5rQe3NdbN7dx8aXNIN3pqnhW7IRHafsU/Wdon3X3tN4YCc14efAdJNgGn/J9jeYhDBPJP43+Kowlt8A1RltSwrla159vRsNFqBlB1VCMlhyYmhbmgdZ2nYsjRBcQhAKIEtcSq/Gv8NyNH35yDbwDP999+1Y/R9YVvDSLUuMDKMag/iGBVsJ0i5MAE06YqVylxQWKd2sbnpz0dtWjDlSBJHa2rhs7vNU5Y9MvFBepAt6C4rJuUM/7d1/Amy+eOdc/UrR4blU6Mgh6fW5h31O8s6Srp434NHW7PXE7uazQ2Up3KJL8mNcTfb6JcUwBf+32PWvtZYuYGRmtlKLvjtwwVtnPGgBxl4R5OGKL+8RKne/fyXe8EUq9MMttM2qpN5Vz4bQ3FuGrwx6W11Chtz9L43MGaok13iBAMfkNSrAFMLxO2+GdbjmJZAy/9IZQ9FSh3CiRyWPbcgm7hQnRbAhP2aeEmGJGLJUZ8rbK9qrACVGa7EFkIqWBEmiv9Wn6wGAtiihwFlYFsc6NBFYG4SkCUCHEb1dcap28icS9XzcHswPsOF+LUB8Au9DRfH9OGWI2RnuN+zV7kshqzq1ykyYX4huwwb6sEfrbhkRyybbMdhWK2+ayVEsVr7judBiV8Zqw6Y1DlGOx5uZis1LxxUYZ0ex9/4cbuDDqS22O68769OMOQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(260925021911599003)(56012099006)(260925022911599003)(260925021311599003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dXIOMtaM1NbiAjYhvKyo9ZNwWXYuKfnEZGHrp6VS008x/PaWCq7Oy+Xwit/i26DgVmB22BAMfWncx8wvKseu3WF+C74246IfGDhEntxG7cU+LFxiXlAN0PjgRYMVXBtTOz+h5meNlKnKyNl0M7Ta/c1L6mwu5pqERXLOH1donmjnW9Z3jnH2sg8/je7tc7vzLGrbaP10yMUq4IDw22UgNQbh59Gu8bj57z8L+Y9PdVbix5IBiuhdpyOtnuseNJINA12nOlWaDbO1OL5w4hR0fiYFr5vuvlirVjGl82CTrcpcvzdnP3dFz//uOVSXt0bAr2r9H5jIciq1dv36HTBYO44K25ZXeC09kaG94TSjGLZ8HO3eko44kcqs/jnZ2qNImNMD560sPkqtBgzz3V/4KnbCNFejgs5UgbrEDVzPnht+VwUIBWsn7C5DcCu12ef+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:07:50.9236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d96162-b21f-41fb-3ae6-08df1fd624d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090802_203051_3B0986C5 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, Oct 01, 2026 at 08:49:58PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Bridged PCI devices may end up with duplicated Stream IDs in
> master->streams[].  During insertion, rb_find_add() silently
> drops the duplicate node when it collides with an already-inserted
> entry from the same master, leaving the duplicate's rb_node in an
> uninitialized state.

There is already a cleaner fix:
https://lore.kernel.org/linux-iommu/76c5f9dde30269995ef842a12a3a5e1ebaa3e6df.1790188510.git.nicolinc@nvidia.com/

Hopefully Will can take it soon.

Nicolin


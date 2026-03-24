Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C2F532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMevo+I0Q0nea89hIUM2MPFpOtQne1XXOGxKdyVDaa0=; b=w9t+pcHzpn0v61q+b5l+Y0Vl+q
	56SvISnLUbpeVvjUksr3Qppc+rKpHGGH8e1cgyoT4dJOy3VxGt6F2wGATUE+KMGuFgck2cvkVgihe
	LugcwBNbTlME8GOzPVS+f51aINNgJx1S3nreXdXyb/v6INHIp/TiPwBQH/QZQVS6fkKjMD5ZPsrkQ
	GNvpOanIKS0FpI3X5i2Ehr7aULchK/WWvo1Kf7iulvdZ1gTmYckfQSUN/ClzqJ19z0NCyJBhMJSi3
	SZe1Zrd20r68xr4Ra1vmZK/XKtxes30yA9/PGRrWIxS10p49+o+iTGJkpBQQR1h7eODEF57d30EIN
	onLQXF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qbY-00000000J4m-3aT4;
	Tue, 24 Mar 2026 01:30:48 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qbQ-00000000J01-2sh1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhPOePkZv61MtA+GpizGKJVKysTysarZbtyU6tuxTP3oAt63Md0NJvGGB2yoIxoQO1s+LtjbR10hmrcPoWcwmaUcE7yvFjOSFW3kQk2kq9pzb2J4TozpNre1O1HDeRmRBiWgeWGcovZpb3RJ0Sls/HEOpLTqeEMJiVxSF31iUCAEtdWfOSww+tmsRu9dtkiHoL8SUhKt9Ipix/1j+/rTLhzH/22v3EIKkCc5h5bmLazcwsxrqVwq9XGVOBexhCAdkRThtfTEjqjVGFguDD5SK8+zwE2XQB0KsfsfJ+erFLMeIllldu6/tPTumJQVIYjK5hy2yU7DMbYgGBsSUPs7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMevo+I0Q0nea89hIUM2MPFpOtQne1XXOGxKdyVDaa0=;
 b=us3WmTZ1E8HGT/Crto87FwgJoDskniYnIkjYqfIJ+H7fYR6nfVg8iAAaZlF8T/E419v41iUIEnUZr0vaHZBjVFcELG/25vhmmvoe1H81NFX0DW/vpQD3wD0JRncSWANI8FnUBEU/AdSr8rgVVqdJVv1L9OcGCesGwuuO5WutZFpH6FibdjOo6uodkziBIqYX5TfjY8HisnXfFUNFHFSy4R170/uEPEjwXD1iFR1UtFAw5jVF88FLEqgdZqB5nUb2idzfIsbrwlx5Ws9rBgWrOYj8+t43bdOQa7vvyRi4U7XhTLRE8002wonac6eiczeiaSHu+3pnE5a8m4fLB4Z5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMevo+I0Q0nea89hIUM2MPFpOtQne1XXOGxKdyVDaa0=;
 b=qU35NZ+aPXbqrPWqpRgjNncsbkgWEWddCqeEeNvbHpJlANfa2H38OBfPn5LZqEsE9vRl4y8nZsm1MLTe66fLneWoQAiPBCnM/EzQo2lM1Y0d80++vjHdi8qQi6AMPB8gmMCz0ZHugr4s4NIE5X8nFXX0oRb62pTgJSW50zRKYIi1of09K1UqcJtQZjeW1wYC/W/kNiBaUMBLwHvKeg2cdHLCZLRffoOYarSvVdEwWJI7WmeorwmmrxUao4pdklSAzIksmOgqvi5N++auE0cJ5semnSZS1yaJeyAtJ7IMB2VcfeQ4AmcFQM2aY0+J/rVA2eZRt9M+y299rc7c87AqMw==
Received: from MN2PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:c0::30)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:30:33 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::9d) by MN2PR05CA0017.outlook.office365.com
 (2603:10b6:208:c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 01:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 01:30:32 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 18:30:13 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 23 Mar 2026 18:30:13 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 18:30:12 -0700
Date: Mon, 23 Mar 2026 18:30:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>,
	"praan@google.com" <praan@google.com>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "xueshuai@linux.alibaba.com"
	<xueshuai@linux.alibaba.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 0/7] iommu/arm-smmu-v3: Quarantine device upon ATC
 invalidation timeout
Message-ID: <acHpI0iNXwpulz8G@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F94146776026CA203248C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <absFXmFcpG8O7uNB@Asurada-Nvidia>
 <BN9PR11MB52764771C48B39C09F129F218C4FA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abtpCXAnqLRnbG1z@Asurada-Nvidia>
 <20260324000321.GX7340@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260324000321.GX7340@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c25311-3dba-4be7-f45e-08de8944f0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 93I9CVxKu0s3jujXoLgTFuT+G0kXvl75AKYMQStgpmrkH59Eo2FR1694ljJoq40eTDfStt+F/onY39JhoxImf5INKzqWE36xYlPlkrdGo/hdvAGxo50ZNURx+/CcwKWnVZnCRC+FNOgT4QnhYb5UbCaVXOwntVJodCUnIueSD65eHq9Y3XgcUob0EYb//wWi2O5WECSM/nbQJt3c49dxJcfdhB2t0mQDaBJXOHBIGh7rC22FDQG/jiYdJBQXAnGxc4bQ270pBm1Gw7PQA9faGQ1AJf7gxdFBTRhCYjz3RxnNHNOIUzCytJm+IkKMkaXAMk+/RNdTeUf53AghRBCJt8xV+4ja49pX04wC7ASSDtF94cLqLdbkVVIYIpR3CjLmhYYQaHbCFNscBlmmMRGZ3ct3iFy+LfehzFoHXu8pfibP4KAaek4Ln2/ykbGmjAiII9gPqNK8L39oFjtVxhJQR4BUBMb63oukXWPsijzKNc0tc5Cu0bEdJz95aVsE4ITuF2lUBWVOehAYbx5YkD1AssPvlbseXlXQK8uSsdfJIbka38rtT84tZOy/GiSNEMlv8c2jW4Gmrvjx0OanOokUYHUjrFhPbM+oX1Ba6RsRw0dbz/+pLZS08rU/hh7QbjmgedtJBkVh/nWVj5pDMYiHXe6unRqGLTDl/lXSlgAyQOKkMh5yFQUEE5niKVoRAo24mpxPDUYSzgDD0AS1nfISNwSecWtDctEAhK4E4bOa56GU1wYfFkBbj/9MCV9Xz8k28hCXCmERjTnh7BZVNg6tmw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XHKk2FQ/LH0m+z9floZCO9Tjkz1zIcQimHyItUUfE4Ean3iw0e0Og7aOxzBGXG/QdIGM2QQl8wpInTyfjj3QD+PKsjWTJEGdLf4CnaHtn9a2aeDBUFzJ4xNetOT8PpROcg+2GPvDDLyi5pvv+0vllb8tV+pZ4eCvsZtdGTS12MWIEtT3teBUvPrRoUYNM0BtydvIqiGmCvl+d8tq5sxMBiTGfbsUPKLrApEFvkrAHn/XP9POhNSHVIE302cIDcNeBX/+neWzUPPiSDineQVBlJ34cjkdVqm2yLNq5vZbW3af7w56Zase1cn04YjmkNbAUubwZwCWs340weSk3HIVdnQknE1W47kIrdb240vG1LaWrYy+Dbgqg4fvzk1ss8swzIak2Pg4fyZJbTrvYebDIF5btQ9lJxgKMz3donV4L4Wf8MuLl7rwQ70jRtcf7JQP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 01:30:32.2947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c25311-3dba-4be7-f45e-08de8944f0d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_183040_728780_7F48DDE6 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Mar 23, 2026 at 09:03:21PM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 18, 2026 at 08:10:01PM -0700, Nicolin Chen wrote:
> > On Thu, Mar 19, 2026 at 02:29:38AM +0000, Tian, Kevin wrote:
> > > > > > This series addresses a critical vulnerability and stability issue where an
> > > > > > unresponsive PCIe device failing to process ATC (Address Translation
> > > > Cache)
> > > > > > invalidation requests leads to silent data corruption and continuous
> > > > SMMU
> > > > > > CMDQ error spam.
> > > > > >
> > > > >
> > > > > None of the patches in this series contains a Fixed tag and cc stable.
> > > > 
> > > > Hmm, I guess AI overly polished the cover letter so it sounds too
> > > > strong?
> > > > 
> > > > This is essentially a vulnerability (potential memory corruption).
> > > > And none of these patches actually fixes any regression. The PATCH
> > > > 7 even requires the arm_smmu_invs series which has not been merged
> > > > yet :-/
> > > > 
> > > 
> > > Fixes tag and backporting are not just for regression. People certainly
> > > want to see reported vulnerabilities fixed in stable kernels...
> > 
> > Well, maybe I'll just leave additional line telling people that this
> > can't be a bug "fix" because it's written on another unmerged series?
> 
> I think this is more of a feature (RAS support for SMMUv3) than a
> specific fix.

Adding that to the cover-letter. Thanks for the input.

Nicolin


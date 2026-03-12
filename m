Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09AF106ACE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBkFlWPP21OJkYgDYRy7c+ihbD87VeDXGeYepEHx7gc=; b=kjmqAumi25Q5mGOWhpDeg/YXsH
	bdkFjZTb/3mfju3glTI0k6SekJQbAy77YJTSalMRASDCEXkDvetGcgD3YK92bgGpBfcJYLe2wZBXu
	TMC0Oz7ievYJfrF2F75OV8zk71fk0w1ZRD/Syi3I6Vt9IwErfFZw+wBPCqyyOTPXO/LLID1NgO/pU
	hmF71AsBdtdehdfyF9U/cBhh+yON7+F/6JnCLDjBCn/2iWamuZXitw/gkGrRe7KPn5fUcLaze3k4c
	O2xTw8Y9QE39LEKH7i/tNrkBVPDCMGYoEjyIeZYasS4EgDk/D0a7NrloUA9WiQX5I6S0cytvcipbE
	bvH1bAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0m7g-0000000FBX2-0PmS;
	Thu, 12 Mar 2026 19:55:08 +0000
Received: from mail-eastus2azon11011044.outbound.protection.outlook.com ([52.101.57.44] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0m7c-0000000FBVs-34ba
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUftiv/wClQrcId8XwSJpQ8jlTSx04GnnLul1c+uxuqwihTUaNNNaPbDiUS6Zv/dpDftl8fhmEfIWKYW/UyKEEJkG8MTUW16Ji/k81f5Cotq9sQ/9Aq/3e+RKacL4Moej8yMI4ttxh2bsfzplktS1aVmzmISJVUHnizV++Gw0gxSRS7WMLaDLnOOcDCYglCP08O0RMfzTLRPTmrysvNRPwQJZnoLkzWQE3CFG29VxoAjTJ7CTyLmjtk0P7LAYCi+wQ1LkAPOTNfdlSSaAR70UTkICB/vbODoCq91Iiz/2HFJZIfGAm1GwrbxTCW0NsTEObU0bXZzqULZxxl2d7ms4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBkFlWPP21OJkYgDYRy7c+ihbD87VeDXGeYepEHx7gc=;
 b=Jm9qD/YJYil6EMdfhJ2vpv0Sn6KGiM3dQ8WRnP+h7GdQOqlQR8Arg3W0W1KuLDln0+6n747yGZ01o6HHTiZQp3C94ESnbxDl8gGBEbVk1RGYKAx44voZiKvr6DrSRq68tmHCVOElzIbF1ditjTm14N9qJ0+w3QgY4aZiPSCR/dO4mZl+j0KmQlnC+Z4r/F2pP9IxWKD0Gkw6qdB2msRbLfQ+XNod0KRbp2oDogFy0ADu0x3v3U9pZJ73Kwv7ydREWVwg0gXwrMJ5E0d8xP4EvN4Msks2T7p98khYN9Npr9zOu1cBFF4hzxnGVXmG+NMQGahCSFmElpr7qf0OI2xLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBkFlWPP21OJkYgDYRy7c+ihbD87VeDXGeYepEHx7gc=;
 b=eU4mPF3cOPmb/yldNTWcaPksFW+Gn9GQOKxi0PPT3cAiXZ7JsaBUGpo3QBXX7RAF/VTGCVi2Xm/jBydY/6TI78Vi9ILjZLlLFTXvA2iURnXyDoBCmgv3QcZa4JwuApNAd+YHdjo4u9o+85ca4AAJKsjvFIVKzujE1FlKrg5eIQk2JpNVT3wG/ib8kW9Hd66Al7CCI/A4tau6G9r3R44hCd3FHo/MzL/dgD0sFuHJRm3r7PlFmPHumtdTv23BWWqERMy1KWgYk0kxgaH+lvo+r9+Aptig6E2rwbaRN5j7qDfuFwAX3CpEJx3oJyjzFvowPRvjh04r4s1qEyGZqaOtpQ==
Received: from SJ0PR13CA0185.namprd13.prod.outlook.com (2603:10b6:a03:2c3::10)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 19:54:55 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::2f) by SJ0PR13CA0185.outlook.office365.com
 (2603:10b6:a03:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Thu,
 12 Mar 2026 19:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 19:54:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 12:54:32 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 12 Mar 2026 12:54:32 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 12:54:31 -0700
Date: Thu, 12 Mar 2026 12:54:30 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <jpb@kernel.org>, <praan@google.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v3 08/10] iommu/arm-smmu-v3: Allocate
 INV_TYPE_S2_VMID_VSMMU in arm_vsmmu_init
Message-ID: <abMZ9gwr2SAYCl/+@Asurada-Nvidia>
References: <cover.1771877893.git.nicolinc@nvidia.com>
 <71438f280adcf17dc76d56810e336445fb4bf85d.1771877893.git.nicolinc@nvidia.com>
 <20260312171120.00002356@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260312171120.00002356@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: ab831cdc-0580-4c7f-65c2-08de80713aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|22082099003|56012099003|3613699012;
X-Microsoft-Antispam-Message-Info: wBc4JcR5oiqs7hrwaLL0jvr2XBQLsVTQM8yntfdtc/eP1cbaF+XzkqhSfGrnrUkXl4BJH8pgzTlaYfusnkEkdTRHH1ltZgfeGcPSCTC3CKM2Sp68xSQfZHr9vh0qW3sVGyMC/OrV/Q2Eeehm3MPnxTJpPOx4qPuDfXHka94AKC01QR/QHixViIBQ4t7iMJfxLWT0umSCGpc2924DqJinte6xQurfc0OFsTuhdJLwxTfqa90CNc9UbTV/OytWMjuNlOVNlfunj1/Ml6n/qF+jIsjj2TJDcNJfayubVNs6+xiUcoFROoCchFzL0MMknX3zGdiH3vIKjlf41yx2cwpZdx89OQveK36oN8YNUoSkyDfg4x89jfOHyoX8kAipkEDXHK0RJqYzE1w4+PM/I4YyCQVayLdjx4axEKcLxhvCWmSSwXVFo+VK/2jI+wVChoPxbhKRAur7j6mQrwQ3StU37YVaE9EO1jJQgtZVRUiwz6UiVuPjcE1+JCQw8+kGaRsT40mzIrNgBvJ42ZRmkvM2Sf2kZ8ZPEArA1FsGjbhsVmm6fyxH/pkBUTph5l3eaFJNvrzWFqfL+MRGbKzpl7LOyeI+RvhRpbpcHhd9U9cjIK9dUz258gSOvgDer1LCduRWfMJ7DDVS88fITmaXqWkqc/53PLHDeFOvSCdseWvJbJwonnCLKxlYxGSMrX/u+9Pn61VZbjWEp7jTO/Aunmv6Cx6htScZUncj7d+0tuhj9EM79k+EAlPMJTxS+UZ/+8czGIdrxSbvWlApQZLpqFyqA90nE09NVrORPOOf7+QVCSH7Fad++Ppx84bIpSzhltTJtKFevPS91hKeV6SU/z/a2A==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(22082099003)(56012099003)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PsN3Js76R2St7I3MwUCvmYIu4dUync63beg8iHon6HiegJJvL94n6E261mgzmiCLCAghov4VvXdYUAtBE92/LrrediXZCEzGfs/TkOlkQCQqk6hunkKF/+3nLbGebukfCvHJ3GdZOpod8saZz4UK2X7BGu3JQTfZsw5bECEie7e6YQS+hH2OEKD2ec4MG2Qhg3n5qxyHKPR/uv+1Dy6pWO1HGvVVga1qbAgzpYAVh/fHl4MFSb+HJf9M0YNnyVc225VUDAQQWmrfS8R58mvRhT++OJh9MFtwA7YP7ifa1pjfynWu7/fQ5z+sl8r2jXuhVNTb/qDWh1p3lYW8F0N1pehJaknK6NkiQFkWUhhuYX0WCz+xKOtEBOZH2nmt392OSGtZX4/6+i7XTOzCrWIEhADd/ECHgzRbs7OpKjWOd5Q+C57eNXV8Mb//ViNlog9G
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:54:53.6209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab831cdc-0580-4c7f-65c2-08de80713aa1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_125504_806531_8942F3C0 
X-CRM114-Status: GOOD (  12.21  )
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

On Thu, Mar 12, 2026 at 05:11:20PM +0000, Jonathan Cameron wrote:
> On Mon, 23 Feb 2026 12:27:44 -0800
> Nicolin Chen <nicolinc@nvidia.com> wrote:
> > +void arm_vsmmu_destroy(struct iommufd_viommu *viommu)
> > +{
> > +	struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> > +
> > +	guard(mutex)(&arm_smmu_asid_lock);
> > +	/*
> > +	 * arm_smmu_iotlb_tag_free() must have flushed the IOTLB with the VMID,
> > +	 * but it did not free the VMID to align its lifecycle with the vSMMU.
> > +	 */
> > +	ida_free(&vsmmu->smmu->vmid_map, vsmmu->vmid);
> 
> I'm being slow today, but why do you need the lock?
> The ida itself doesn't need it according to the docs.
> (it's using the xarray lock underneath)
> 
> Likewise of the ida_alloc_range()

You are right. These do seem unnecessary.

Thanks!
Nicolin


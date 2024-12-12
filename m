Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsKSQWxOHwDmr+lT7KbIv4f3GMmduVmZ5AzWsdOOyiA=; b=kvI+58GYLH+OceVmrVTd0smjme
	rjGeUHwTBPd4C3mgRuZj48LzX2E126SfW3xRHWLHxdQ6VCWQKrMG1L2vcFtBSMI88eu7sNTsE83D+
	NuIKQojdeSWIJvTdMzdywDYGASz6UikSaC1yFaC1dJ5OMYEfJsUIgzKUwhNxAFXbwBQlZSY26rnHH
	CMcrQTbbrHV807QGT19VRqGwmvot0KM+mUtjSFKSs8PR8R+TZCy8iuxOxgGglBrhKAb5tjbnROphn
	mFnXQp0IRMzj6XgW2lbWyLq8zIqLIWj73Wx6kEPitZwcu+8qNT9nfs90KSVbs1th+06rjKP8noulQ
	2CxlaDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqqj-00000001yr1-0kmh;
	Thu, 12 Dec 2024 21:35:57 +0000
Received: from mail-dm6nam12on20618.outbound.protection.outlook.com ([2a01:111:f403:2417::618] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqpe-00000001yZ7-0LcO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNQXWE6eoTHuGggOcq9luL6UWDtAA0T9Cdf26IDmolEvF+2VVvqIk+lE98SWMdnfvM3iNAnkWYj783cTItVbHRSFm+kJNf6rJY+JfGdsNB0FaInyx/fypEiFbkneDLzxn6GdiikSmu2IOE8l27qoGuAjVPP789v2kEjeDgEMuSR22Sfgeovzmt9iBP3m4tsuphur45W3cmKGlza9I+Cqe4knAvwNDUXLZ+O9FxEfhtl4qqRfvFSUmKeBAK7yPlZreJRS0MPFLtmHV+V6M8i3nbDGqIWFE4o7rvWjF92P5cK7PiE/QN+Q3NkNd2PYJmz1YIPFCw44Q6Fi9k1xXsv0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsKSQWxOHwDmr+lT7KbIv4f3GMmduVmZ5AzWsdOOyiA=;
 b=kORB2E3gIZ8J2GRAJ2f0/cprntgP1mKtcwouObpltT1v/5/X1TMNm5FVnPbPHVapHyF4gQN7vFQVa25ZTiMnwBiOSju8iBWYQoM7nWT+y/XOnx2OAUJg70D9dquB9+aWmSso22JgVTRV3BNTcgxp9fAjjnOM8YQ0lm113wMMyE1M4JQGuO+V70mX8NSN5t+nS4bDtsLJ/hA/L7reNysRwaUws4rVh55BZmt7lt1jY53b04xHBcGyINvbYw5tVMqdrQMyGD4r4LNKmnSqzCiYk7DhnW9A/HqZxm0xKxF5GlxYpOMOZUq6YxgbQUiVRw8+kuiqJ7o54/3Mns6GwNsWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsKSQWxOHwDmr+lT7KbIv4f3GMmduVmZ5AzWsdOOyiA=;
 b=eNOwBxMjGq4dpHmUrXxOvlkZjCiKlr1CVwmm0uBXB4p7yYeWm9f/ipPEAILHJwv0cF5OBI45neIWSdLKO5skRwpOusVsmpmQ3zA37G2druHTcSQppK3ZXfqgmemyGwrrB6Y1/UQ3vCKx//l3Lrg5zycxJXI7bN9Azq+rsMfHIkzAqFFLXpWuyObrSHFierbS6GzM8h7+L8+ueCGmf6aVEui8Y1GwSYvft+Bh9HJGwWvV4ydviTrBFDjG3mJ1xBrhKd58uyCXeJjFL9fi0r7bUJMCwb+f1C5EmO1JtyGo/sVa3+Cct7u08L0/AEarixKOIgX0VwAHA6zkK/kvnk02eA==
Received: from CY8PR02CA0023.namprd02.prod.outlook.com (2603:10b6:930:4d::20)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 21:34:42 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:4d:cafe::cc) by CY8PR02CA0023.outlook.office365.com
 (2603:10b6:930:4d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Thu,
 12 Dec 2024 21:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 21:34:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:34:25 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 13:34:25 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Thu, 12 Dec 2024 13:34:23 -0800
Date: Thu, 12 Dec 2024 13:34:22 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "mdf@kernel.org"
	<mdf@kernel.org>, "mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L"
	<yi.l.liu@intel.com>
Subject: Re: [PATCH v2 13/13] iommu/arm-smmu-v3: Report IRQs that belong to
 devices attached to vIOMMU
Message-ID: <Z1tW3sZgrJfUzP1e@Asurada-Nvidia>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <d335936fdeccfcf785589800b7e5d9b1b26a766d.1733263737.git.nicolinc@nvidia.com>
 <BN9PR11MB5276EE81D21EC5E4156EB7D58C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276EE81D21EC5E4156EB7D58C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 736a520e-7795-43a1-d632-08dd1af4ca40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bdPGD0q/AXzsKfEGb0EIjAxRmusBr2P1fuf1KdCxdHLLvCUcCzCAW8c6c2XS?=
 =?us-ascii?Q?SRoNQFaGpoKc1J9yShxmjdcyXsZXedojRDjJB1bgA7ANwR/AgQnhb05icXmV?=
 =?us-ascii?Q?JDbH8L+xbH8JfWgxB/JbAHVHrP/0Ivq4ynflYvJPfcuCsr/uxSm2WnxhZlv6?=
 =?us-ascii?Q?+TPnh2EozgFEgCYPbykOx+D3O+W0DeZkPbj7Rqfb0kO+B+sdqF8zYktSVyZ9?=
 =?us-ascii?Q?u0ahDVebsWnk0nuY0Oz09XvXJ3hq+Ivdop/7nu352DDVGUJjbVzWeUydPEu6?=
 =?us-ascii?Q?7FXql9RdsvyXgyJjTA+n18noT/qVvrJONwJvBM86AM6ssqqyEGaUQVfdoh1w?=
 =?us-ascii?Q?9c8AIU2WttMCgTexpHF7W3uPrbbe+DjRDaL+i2e2tu/UDEaHVN6pJju/PcFy?=
 =?us-ascii?Q?NP2BcggPylFryEAExno/jZwDukOkmWTCcqc73rJKK+iwsMNsqp6zyagIhh9H?=
 =?us-ascii?Q?U/jRaRVdj1MnfyJB8S80uSfUXDfsclk054Nb3G4UULT3GBv0Xz8nTGPbkv/5?=
 =?us-ascii?Q?W3hSCZKaMlV0Mu3rba40N2VSahUiWA0Pua39ipLVYpKrCKi8JRixMua2UOqG?=
 =?us-ascii?Q?7z6MZoH9eSdFH55wcy5l9Fnvjzobnb77k3/lIsS3+MWwW6ZktDse2kJYb+GP?=
 =?us-ascii?Q?3QZ2HtcJYnx2DGEAqOpWVimruDVBpZRXW4dF7Ty5f4alepUbVjUzk/aDfY70?=
 =?us-ascii?Q?NW/2jhIlXgxl0KUgXA97F1kHpd261Zeh9K0tIn1N9aw7k2jm/dFRiwic5idQ?=
 =?us-ascii?Q?lFXsuPSECgdZkAAnrtamHbPSSkdqpL/7eXwgR66SonZhYy5lxUskoggb2vhy?=
 =?us-ascii?Q?aV1qxaDDP565lKVlAlFELaws+Cr4udLWa3JXNTOnDjS/Op71hI+YPuVL7WMA?=
 =?us-ascii?Q?xLUJcQGqvVSX3T/tLfXbPqKbNwFkvwuw/QKo+uwBhI97sh5jbSLZqc2ynxJe?=
 =?us-ascii?Q?z5LFInyNYzBgIsWE87xUT5Jp3+Oz4RFJh0dhCIG09J+J3Qg91OfcS7H/1jgf?=
 =?us-ascii?Q?umfir4M8MyaFxLZtIUGdiaNPCrj4+UEpxobevx07sywxIuyTJ33n/vFC4TW8?=
 =?us-ascii?Q?sJUff3z67jTekDYbaz0nqc1BgAu/T1vmv+GiIZyO79Hy+UJibBmDCtopeVYB?=
 =?us-ascii?Q?UtTRfctTWZ+Xu48pl5srnjD3wDn395DBW26avZZlfjYMMOe0EaBGC/PSiT2v?=
 =?us-ascii?Q?c4qpIoQm4Zw+nEtiuVjdeF0zki2SvmruZ4hmMcONpCZdlb7Th4z1+AA6y8En?=
 =?us-ascii?Q?uwzR6RNt4quiVEX6mQUXGvDZZm3kVDDOklTM81R3nJ9FpJGJJd/w7CvNGs/a?=
 =?us-ascii?Q?JLY1SqiRZSVSrP1Z+iv1hD67G741MYZxF6MyHAqBiXQRb+RcTcsse8aJVE04?=
 =?us-ascii?Q?czEBpJPMkzKfGiRKYyXZ5y2XazQhUdMK5xDAHdrqaWlrY7oyMPEry6hscSev?=
 =?us-ascii?Q?8Lyj7L1Yoz/tQ+YbTFk73KkqrSky9zOa?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:34:42.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736a520e-7795-43a1-d632-08dd1af4ca40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_133450_116867_2BF67C64 
X-CRM114-Status: GOOD (  16.04  )
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

On Wed, Dec 11, 2024 at 08:21:42AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, December 4, 2024 6:10 AM
> > 
> > +
> > +/**
> > + * struct iommu_virq_arm_smmuv3 - ARM SMMUv3 Virtual IRQ
> > + *                                (IOMMU_VIRQ_TYPE_ARM_SMMUV3)
> > + * @evt: 256-bit ARM SMMUv3 Event record, little-endian.
> > + *
> > + * StreamID field reports a virtual device ID. To receive a virtual IRQ for a
> > + * device, a vDEVICE must be allocated via IOMMU_VDEVICE_ALLOC.
> > + */
> 
> similar to what's provided for iommu_hw_info_arm_smmuv3, it'd be
> good to refer to a section in smmu spec for bit definitions.

Ack.

> >  	mutex_lock(&smmu->streams_mutex);
> >  	master = arm_smmu_find_master(smmu, sid);
> >  	if (!master) {
> > @@ -1813,7 +1786,40 @@ static int arm_smmu_handle_evt(struct
> > arm_smmu_device *smmu, u64 *evt)
> >  		goto out_unlock;
> >  	}
> > 
> > -	ret = iommu_report_device_fault(master->dev, &fault_evt);
> > +	down_read(&master->vmaster_rwsem);
> 
> this lock is not required if event is EVTQ_1_STALL?

No. It only protects master->vmaster. Perhaps I can rewrite this
piece to exclude the lock from the EVTQ_1_STALL chunk.

> > +	if (evt[1] & EVTQ_1_STALL) {
> > +		if (evt[1] & EVTQ_1_RnW)
> > +			perm |= IOMMU_FAULT_PERM_READ;
> > +		else
> > +			perm |= IOMMU_FAULT_PERM_WRITE;
> > +
> > +		if (evt[1] & EVTQ_1_InD)
> > +			perm |= IOMMU_FAULT_PERM_EXEC;
> > +
> > +		if (evt[1] & EVTQ_1_PnU)
> > +			perm |= IOMMU_FAULT_PERM_PRIV;
> > +
> > +		flt->type = IOMMU_FAULT_PAGE_REQ;
> > +		flt->prm = (struct iommu_fault_page_request){
> > +			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
> > +			.grpid = FIELD_GET(EVTQ_1_STAG, evt[1]),
> > +			.perm = perm,
> > +			.addr = FIELD_GET(EVTQ_2_ADDR, evt[2]),
> > +		};
> > +
> > +		if (ssid_valid) {
> > +			flt->prm.flags |=
> > IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
> > +			flt->prm.pasid = FIELD_GET(EVTQ_0_SSID, evt[0]);
> > +		}
> > +
> > +		ret = iommu_report_device_fault(master->dev, &fault_evt);
> > +	} else if (master->vmaster && !(evt[1] & EVTQ_1_S2)) {
> > +		ret = arm_vmaster_report_event(master->vmaster, evt);

Thanks
Nic


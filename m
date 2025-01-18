Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+l3h3Wa5GLWn0bXsSzQ+qRLAF4OgAT2gnX4c1w1ykQ=; b=A47MH33LGcFDKK9IItt0zBRxLt
	0EeG6hejgv+kzV6xyMaYAeNuoy8gZDqKDkXN3I1ldNUetcKKfOXkL+cWQ3fPEYB3TL9gKRFlrd/y/
	7gm6ytATkiAwjzTXeXn0KoTvUhTIzOA1i9urA+Qz9m9T6ur2myoC5BklwX+Eij851Zev3k2ciAQ3O
	R+kPfsXDvtwuR7Xn+ZxsL+SwHjlNyBXbnA16ebAcv0Ljls5oUnaneyRzFiiKen6IP9XzvlZwBY0WF
	m+Vcn9tHwZcSiboNVHnBVSj3HkOtoCczZ8giZfp2nuly2Hyl2z1jjzQiAxqEHi3FXae/Bs3vAmAjf
	zpNimENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZFWW-00000002upu-1VPG;
	Sat, 18 Jan 2025 20:34:28 +0000
Received: from mail-bn8nam12on20602.outbound.protection.outlook.com ([2a01:111:f403:2418::602] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZFVF-00000002uig-28l9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 20:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMntumkQ05fHi9jbSJJjesSX0yZz+ceA7TSzOOTSKAXCUHWf4UJ/NTWpCRcOAnFOK7aRZoY+D1hBUozuL0MijHSrCY8PtI3LKEe9zpXeIm+qPvPiXFzSDv7PqpgaQvS6S2LKtpu+pasOj5VEHJorD2OlwV7RAnNIp/Xbh5kudLk+mdY0zkWtpvTr37WJSrizjIV7A9W0Ep2lR1w/Fxul2Ij2F+N8aqmj3Uu+0WCBlO8OGEvfqYrtb+JQxaLfg3SQs9D5Bs1TwDVMc87dW/faq3vNOg/KSbNCsZoojOMMibpE82iN2lhEvByji+Tjx1yijWkIuDQ8nDSwFtfV0QpZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+l3h3Wa5GLWn0bXsSzQ+qRLAF4OgAT2gnX4c1w1ykQ=;
 b=lUaptFpo2HTDxCTMUIvwCAWyYqiFhdaooRYjod5MFe29ZVVKOwJoc+b3oxE3c3gZWXx8eUTG/RGvBVZA88qEvIWqORT1e3Mogp2oHwupL1JqC6nyJilmV/YT0qSp2SmFRqcS26ynAfJpLFkXkzK3QXWp+yOSWLhpA4JpyEO8kWyaAao2ip/1zhIWKbHxJgNpy0zuQnD3vkwSwd9TbawSMgYbFVb1ePbcdIwFU3jCwFRy0KElV2IBYAWffYO7Mrvqz2aCWirdKQGMHnk7Ft8z6d+slYs1dgtNE3tbyvbBXbqpFtqj+beAL5DNZnmJib0LMOIbesIfeGnDB15sn6T06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+l3h3Wa5GLWn0bXsSzQ+qRLAF4OgAT2gnX4c1w1ykQ=;
 b=YRiZDYx6LZj4Mr5CCQdnX5DgMmA7W0qQCN/P+r5FtiTHa63m3oo1cel3F1Iwm9DVpgXpIoRnsnM7PYtqs+TXFF1zqjEWprabcTKCGjCXbe2xqqKRTjLXqwohrg9JgWWFYsC2laNgA1PlBJnzMI2WUDZLVHUUtLdKPiM39qcFYq8fm3A4NanKvbjYjrZiKbmLtSu/T37kpwIxoqQnHxXg4MpHhJfoSHJKQnXViP3u1S2IrwtS0VPmrKHL0Fl3yfxZ03zS5f9cUWsfZvRdbABNCM6IH1At6xj65s8gxVGtmTyYy+GO1j/kNNrOkCFTXOc/w3j83zuV1OamuIM4eJWw+w==
Received: from DM5PR08CA0041.namprd08.prod.outlook.com (2603:10b6:4:60::30) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Sat, 18 Jan
 2025 20:33:02 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::6f) by DM5PR08CA0041.outlook.office365.com
 (2603:10b6:4:60::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Sat,
 18 Jan 2025 20:33:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Sat, 18 Jan 2025 20:33:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 18 Jan
 2025 12:32:57 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 18 Jan 2025 12:32:57 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Sat, 18 Jan 2025 12:32:52 -0800
Date: Sat, 18 Jan 2025 12:32:49 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>, <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <kevin.tian@intel.com>,
	<tglx@linutronix.de>, <maz@kernel.org>, <alex.williamson@redhat.com>,
	<joro@8bytes.org>, <shuah@kernel.org>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <yebin10@huawei.com>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <bhelgaas@google.com>,
	<anna-maria@linutronix.de>, <yury.norov@gmail.com>, <nipun.gupta@amd.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>
Subject: Re: [PATCH RFCv2 06/13] iommufd: Make attach_handle generic
Message-ID: <Z4wP8ad/4Q5wMryd@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <c708aedc678c63e2466b43ab9d4f8ac876e49aa1.1736550979.git.nicolinc@nvidia.com>
 <62ccc75d-3f30-4167-b9e1-21dd95a6631d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <62ccc75d-3f30-4167-b9e1-21dd95a6631d@intel.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f05d0f-1baa-4569-f847-08dd37ff4dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eJxgLvXqweRLe1RlmxzpFKpfZXb0fYtEO+WAgTIKMuaO9YLADNLeo71ANbIW?=
 =?us-ascii?Q?LyCAb/p5+gQUON/ZdWdZz4JZvCfzpo0R2VW3/jtY4aQiq0Uvxa4wxUw+C9EW?=
 =?us-ascii?Q?YWoNYeSN55AzP9t5SmGeYGf+q8ioUlx327H/MS28ppM4zgznf7TMPa2KqteP?=
 =?us-ascii?Q?FKoUEvDCqk8hCsIdxZYzxt1Q9DpRHwuKaPideFanfLwjCawulOE72r5miyMZ?=
 =?us-ascii?Q?AZvv7vKmqQLm9Bm3zIX1QQTluN2bam+rLBS4vngrNqtFdy6jUaZJ9GPv6lrm?=
 =?us-ascii?Q?V4pqHgrsJdfgOflEkIoXyH/Hemp+mp5JFxgjN4NIUZK86WIuVqMJ/OBiSAyw?=
 =?us-ascii?Q?kcnZdN49AB2H+4FF1M/GqgEmthYqIjg3eDh+HleQ3QVmnoMfSs3dMqVQZbjm?=
 =?us-ascii?Q?VhphXxt1RKXSzlh1XhkS88T/5l51CC9KYa5n2jJnR38npgbzYYlxQ6UYZ48i?=
 =?us-ascii?Q?zE7P/C0J+F35U8UYGssoJazF3cHPzvi4jYsOSpzl+rGZG16BiNXKx5DXCjjx?=
 =?us-ascii?Q?1lGemj1HC/nYGE/2wPi/BezUS4XgnQ8oXlyyr/9977UHOA1kfafcPIhX8pst?=
 =?us-ascii?Q?XLalqjokk67Unm7GMlz7iVwnP3P7r4AVwqw6Z7pW+fIEi8gAIdglbGJD1sfY?=
 =?us-ascii?Q?I2RUVnfTXRbcLymlYjs/QC5YSFXo9RaDPNWKKz/CvQLTsjELbx/qNm2xjIrx?=
 =?us-ascii?Q?RmhSPhwql2ZuKj8w+miSR2mU0WeYxAYz8Dl4pBA15pBho824KSbBb8Y5DU4f?=
 =?us-ascii?Q?+VGhwE9OoC5YoJB4qSSpMO29SKJPbmtHAWUyqMOzk09ps3G3NM4pWWwv8o02?=
 =?us-ascii?Q?OW0e7aXquG5aHUnYyw7qzs2qqaNPzMBv2i62tou6ksKSfdCiYTRYGuwxQ4L/?=
 =?us-ascii?Q?Vo0MVPain1H5YKZG/YyuGdTPull4c9ba7t0MYjTv7lexlwsUbiIk9BF/x5N4?=
 =?us-ascii?Q?odXHVTRHoR690dNNvXo9LDKmvuUPb1PQxnwdxPJ6oHJsNGJCjuGY/lPLhCmA?=
 =?us-ascii?Q?xvvwSV5FySzRL9b+3lag2k4eKZNtv8nT/M0UZUe67bczF0U7Eq9NQWrIRXSN?=
 =?us-ascii?Q?KM3j7yKNCC8d65T7egQOPbIZnmP9OVySXlS/HF1NBKqQnrrsQuAaze95sJ/E?=
 =?us-ascii?Q?XjiT276G+7hp4id70MFG4OzuJUbdPRVY+YSnBp49MvMsat+9DdGKkDKzrJHG?=
 =?us-ascii?Q?ALi++cZqdIlaAXivzNZGE3wlYHuHXhwnUcAGIudnjchI7jpnFMHf/orPEkhy?=
 =?us-ascii?Q?E2vRX/BR56IgpTbvYWqxlhZG1Dd7UF8ziGU1ck894AmfYW936zU8gMGsPR/G?=
 =?us-ascii?Q?aeyKFFxE5Dc6ZMT5e3WAQFzadnj3ow0GZ3qxxjesdl9awN6O+I7MLz5HufBo?=
 =?us-ascii?Q?bl+HLaegGkNHQdT6e4xE5BYuSIpZgcizrehNe78Tplq+X7H5WALt8PpbiXz2?=
 =?us-ascii?Q?CHEJnR748GpJyy3u9/W8XcYjXPRqwK39U9JtqpdSIo1oq6laJo8YRw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2025 20:33:02.0062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f05d0f-1baa-4569-f847-08dd37ff4dfd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_123309_566933_6928D170 
X-CRM114-Status: GOOD (  20.33  )
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

On Sat, Jan 18, 2025 at 04:23:22PM +0800, Yi Liu wrote:
> On 2025/1/11 11:32, Nicolin Chen wrote:
> > "attach_handle" was added exclusively for the iommufd_fault_iopf_handler()
> > used by IOPF/PRI use cases, along with the "fault_data". Now, the iommufd
> > version of sw_msi function will resue the attach_handle and fault_data for
> > a non-fault case.
> > 
> > Move the attach_handle part out of the fault.c file to make it generic for
> > all cases. Simplify the remaining fault specific routine to attach/detach.
> 
> I guess you can send it separately since both of our series need it. :)

Jason, would you like to take this patch separately? I can send
it prior to two big series for a quick review after rc1. It'll
likely impact the vEVENTQ series too.

> > +static int iommufd_hwpt_attach_device(struct iommufd_hw_pagetable *hwpt,
> > +				      struct iommufd_device *idev)
> > +{
> > +	struct iommufd_attach_handle *handle;
> > +	int rc;
> > +
> > +	if (hwpt->fault) {
> > +		rc = iommufd_fault_domain_attach_dev(hwpt, idev, true);
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> > +	if (!handle) {
> > +		rc = -ENOMEM;
> > +		goto out_fault_detach;
> > +	}
> > +
> > +	handle->idev = idev;
> > +	rc = iommu_attach_group_handle(hwpt->domain, idev->igroup->group,
> > +				       &handle->handle);
> > +	if (rc)
> > +		goto out_free_handle;
> > +
> > +	return 0;
> > +
> > +out_free_handle:
> > +	kfree(handle);
> > +	handle = NULL;
> > +out_fault_detach:
> > +	if (hwpt->fault)
> > +		iommufd_fault_domain_detach_dev(hwpt, idev, handle, true);
> > +	return rc;
> > +}

Here the revert path passes in a handle=NULL..

> >   void iommufd_fault_domain_detach_dev(struct iommufd_hw_pagetable *hwpt,
> > -				     struct iommufd_device *idev)
> > +				     struct iommufd_device *idev,
> > +				     struct iommufd_attach_handle *handle,
> > +				     bool disable_iopf)
> >   {
> > +	if (handle)
> > +		iommufd_auto_response_faults(hwpt, handle);
> 
> no need to check handle. After this patch, both the non-fault and the fault
> path will allocate handle. It cannot be used to isolate fault and non-fault
> path. Also, the callers of iommufd_fault_domain_detach_dev() will check
> hwpt->fault before calling it. So just call iommufd_auto_response_faults().

..so we still need this !NULL validation? :-/

Thanks
Nicolin


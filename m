Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D6CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FRdDfW53Pgtbfa+hoVwW0XlohWae4tQ9e4EtEpfn1g=; b=TTw+KSqwvEc7kg8tdoOJ22RXlX
	TxwDnTcvXNfe/temNLr9aH/yy3CjJdKBL/gJT9nxvD3NzrklQwnYBpojrcGBko1Yv1qfkXwiUTLf/
	9CZkO2mPaBhHLUB5kCUGDR2rgLjQGJedsFskiDxZ6HehmWlPxrwukFjb0bjXlh3UoWlUrZM9gjXXG
	4TCWc5nDEjxgLH8L2hO4h6dzOfXdXpubKyiZwdKjWm6TII7ZDUPJto8CyolrHRytri0Uc7cBOTpdf
	yDtzh4vqnN/Lrh24WgDn+r5Kxl9wal/MlEiaBLgM7k/cy9Aufbs2Pv89YjSgOe3K3iyQRIb9dK7HS
	6lZKyVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpT-00000009qvg-2fNX;
	Wed, 25 Jun 2025 20:34:47 +0000
Received: from mail-dm6nam10on20609.outbound.protection.outlook.com ([2a01:111:f403:2413::609] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT86-00000009KUj-2Xo7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKsYDRCO9bLzG2z5QeZIw3QrrDrkyWGDtYiY37bbToZP9fybdhcP3vxk/uaYXxvQl2Vv6o94j7yNBa/DfTH/GoWJQtQj67wfR9J1akulYuha91THc7SvC6hugzs80KR/uvI7urG6PXgYE23U0Lc1Z6Tye7srUUMCvm3vkEK1X1L0ARg1OJpWPVi4/LW1F9aO8/r3Qfuj1SHZN8WeCV654IquzI9Eh5HBHDk9iUIo8Jvjb+vxA7scrrqOSqQ+ognadHmpJ2Yzti9tliKdTcWfvuxsxPqT/cgKyr9nGmRtujYcZClzwMtTu4CdFN2U1anDU/NnNdtlBdes+Et8cwU1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FRdDfW53Pgtbfa+hoVwW0XlohWae4tQ9e4EtEpfn1g=;
 b=QNSp4ZKuWUdOVbY3k4p6qrsNMAocewgstX6Gla2Hfna2oVrie71vuz2+32tyK3YnjijhBNFGwJZdap8YpN9dkmjsykwmb3chktYFm9KaHPksnLz+y7oPR3lciQ210tqXmtk5Jmv4zadt9ugeXQbs+wTcG+mNdM11sy71i+DVxm5jD4ERu320l1ivkOEtEapmG6pVHF+V9AtI0L1tie26yKQJjUvFhS2VK2/RkFw9ra1XV8r85iP1jmFtOtfzg1SsZVegldPdRq8VDpfZ/Xl4cQqBX+Dpys1aOivVtHdcuXPHowpR7fLUlFYXxlHE91w7HAoLGpEIHDvTqgS59zLV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FRdDfW53Pgtbfa+hoVwW0XlohWae4tQ9e4EtEpfn1g=;
 b=aKZhS38Xs2i7TB5xikyrmYnSJ4YK3B5/KhWLz81GQZ7gTo0j1lkH1OdI35TOHKqP1vcPpW94XRqH93N/pL8IeTrvL0ot9F1UKTTr3QnMFStiNhrg185/Vlb4eQYpd7Zjq02rmQzeWsDfaA2xknhU01sC//J7UYodJEOfHoZPOumwbyC9kmYNy7Qa1pMh2TyKubq7YTY/xz518wkvO8J4NWqi1N+1tdQYBPcqYNJMyrvZ0W2Moa+e8/zWiDxsUHnYUy48rI1+ebSHDuu3vPHqP4zmuzrBuxv9edMmDpsqjBFuBRMh832YDTbffycsVaErPfyB39rrUmdItRbcSC6E4Q==
Received: from BN1PR14CA0020.namprd14.prod.outlook.com (2603:10b6:408:e3::25)
 by MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 25 Jun
 2025 16:37:42 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::d) by BN1PR14CA0020.outlook.office365.com
 (2603:10b6:408:e3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Wed,
 25 Jun 2025 16:37:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 16:37:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 25 Jun
 2025 09:37:18 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 25 Jun
 2025 09:37:18 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 25 Jun 2025 09:37:16 -0700
Date: Wed, 25 Jun 2025 09:37:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 06/25] iommufd/access: Allow access->ops to be NULL
 for internal use
Message-ID: <aFwlu7FlfIP85gko@Asurada-Nvidia>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
 <BN9PR11MB52766D0C0B12F1F10A6BE7548C7BA@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52766D0C0B12F1F10A6BE7548C7BA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eefc242-9aff-4b28-deec-08ddb40699fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zBMI1Yx5F8fjJKh8M2EynXwgt9uMyjR9J03J5MlRJX7doRRRownlvueoXFDm?=
 =?us-ascii?Q?doANt+Qn4VabCqt7kBwBjFhFtM2cJ6qZ5BjwLzYJwmoeywanXf1uNRpGWS9+?=
 =?us-ascii?Q?fjyEyTO8b3k/rPwtRqyQXG3Qrvtk0oDn/HGMSYO5kdFIIRYlH9yhwvWWHLRX?=
 =?us-ascii?Q?2MFgi+jZMovnIItx960h9cPnOm/qXyrX52A91WWtNuljUNjA7kX8uHNrHCPp?=
 =?us-ascii?Q?bmxGuqpUaCOQ80geMlHeVM7cIkD1GQkY2AT1PnsRolhFWnhPCHEjBa8fnKgx?=
 =?us-ascii?Q?zJD+HSN9idjS+MmCTAus5zy7VUVDl5x+7kHSVWQKE+wAM0At7YyhzLhYYwpG?=
 =?us-ascii?Q?Fl8LCvmwk29w/5Efe+bjuJu9g3Z6HnIoJjFquyYFZWq72PML/3NZdmybeaLh?=
 =?us-ascii?Q?pzn3gv8bSYQqnjwbilPcRO0098c9B6Z685h6go6hGSYnlisILk0lo1LQRaJ6?=
 =?us-ascii?Q?Wf7CiR9x3y8wqEpGOVpbFuAKGY2MvPuMQaC1o4pDXXQ+tHqlPGnIr8waMqpp?=
 =?us-ascii?Q?ndWwE3r4itxWVoZitWVzYS2rL/sZ6XJZ45aAp4nHm/Iqky60RdzhB6qKxul+?=
 =?us-ascii?Q?+1inMxecXRrAzDOsOf230oDsCqyIP72ViBamEBY4OGcmscLasqRVni4tMULJ?=
 =?us-ascii?Q?Hqqu+jkQDQfH5T7GjN442W/4hFVLIsDOdGlFjOw3poz/+FOq9ir+4hz/xU7n?=
 =?us-ascii?Q?yd/vcAgb/dEAuKeRiW6TXyPBNCbr155UBOL1vDf6lXGnmJ8ssML+DJt+CDiD?=
 =?us-ascii?Q?CR+wMnqtbuX1lzZyYKZGpp9w5EeLP3cz1pJBytOCoZ3wS2L3dYFeXwlS3UmY?=
 =?us-ascii?Q?NwqjZciCW0OJF4oMxvsq2AxKuiaJUkysv9hBCdeAWdD5GAtvMuJewqZ3YITJ?=
 =?us-ascii?Q?kVsPZ8OkIvq6uUA+4Kt4vbojS9ureLHmdIvTKQJ+iwZvmdbBbH9lcrmqFU88?=
 =?us-ascii?Q?nW9kwmulFn+HWFdm2ppN4NQ4X4HTeAM6pxggffOUajlGkVt7BtriKwx6ZY/B?=
 =?us-ascii?Q?+vpAV6hNeX8eeFh45K/mYF80sGkbQovWLWqQ6sJaOSW78PRsOL3n+WnzU3a5?=
 =?us-ascii?Q?I4tBFhiZ7oEhG9MxrJXJg6W+5dTVjLQ5o7jfIcEbkFZTN7z9F2DzFzU/5xlb?=
 =?us-ascii?Q?+9woYA8AORUCa+5DlwW0knBXBUsy3AbC0iArft7fJzhbLQPWVKENORhJsnXI?=
 =?us-ascii?Q?AicKerpDKMEbg4gf7sW0DQ1jWHUat5/RsoMafIAJiszPwEZq5RggxCjtPYsw?=
 =?us-ascii?Q?2MvsuNFMEbMfesqHx/SPjlhi1dlIps3QhvTfv3cHcoOfwCOYQXhe5/hcnEyz?=
 =?us-ascii?Q?U24kftwRueap/ft3HAHf47eUxfZ/XudT1wwk2/s1ZdR9djksaXJVHlMnek5r?=
 =?us-ascii?Q?AWBuS+m6EJER2zQh4+bBkVwjkf4C7HkwsRherBlKeL9K6qiPmEe/qan1r6Hi?=
 =?us-ascii?Q?5Uf/yMt147HziCdbeS56ZlU1TVBlNmPCkq/UsHM8M9I8iwKqzHOAapjEwAmN?=
 =?us-ascii?Q?3R8jWW4v0B5NHbbiSkiPN+MOA6YF2hDyWyCr?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:37:40.0726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eefc242-9aff-4b28-deec-08ddb40699fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_093746_651069_F1F9F308 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed, Jun 25, 2025 at 03:38:19AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, June 14, 2025 3:15 PM
> > 
> > +int iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long
> > iova,
> > +				unsigned long length)
> >  {
> >  	struct iommufd_ioas *ioas =
> >  		container_of(iopt, struct iommufd_ioas, iopt);
> >  	struct iommufd_access *access;
> >  	unsigned long index;
> > +	int ret = 0;
> > 
> >  	xa_lock(&ioas->iopt.access_list);
> >  	xa_for_each(&ioas->iopt.access_list, index, access) {
> > +		if (!access->ops || !access->ops->unmap) {
> > +			ret = -EBUSY;
> > +			goto unlock;
> > +		}
> 
> then accesses before this one have been notified to unpin the area
> while accesses afterwards are left unnotified.
> 
> in the end the unmap fails but with some side-effect incurred.
> 
> I'm not sure whether this intermediate state may lead to any undesired
> effect later. Just raise it in case you or Jason already thought about it.

That's a good point. When an access blocks the unmap, there is no
unmap happening so no point in notifying devices for ops->unmap.

And, when the function is re-entered, there could be a duplicated
ops->unmap call for those devices that are already notified once?

So, if we play safe, there can be a standalone xa_for_each to dig
for !access->ops->unmap. And it could be a bit cleaner to add an
iommufd_access_has_internal_use() to be called under those rwsems.

> >  			/* Something is not responding to unmap requests.
> > */
> >  			tries++;
> > -			if (WARN_ON(tries > 100))
> > -				return -EDEADLOCK;
> > +			if (WARN_ON(tries > 100)) {
> > +				rc = -EDEADLOCK;
> > +				goto out_unmapped;
> > +			}
> 
> this looks an unrelated fix?

Yea.. let me separate it out.

Thanks
Nicolin


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AC6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkkx2oy1c+EKwRUASgngzGic2tqFWtNxseH28JSlWQQ=; b=3WTJN7ojE/HM5okI7ObKqy+KE9
	CmxTIoM/xIP1Oq1dWU4yxWwIk1AfJkTcmNGjuyKNzKEiqbZIDQYWEVYrTJYLQaSBWqJtA0Gqe8XuG
	kCka3yjwXqq40fDCfh4A0C8F0fEwnmaMLYbpnhO293Ug2CHPnGap2vDHeAlPhKxhHnYaXxrsOH3wS
	oNTnJdW2tpsWWzL9UvNeH0u4/NA1JSdoM3YCLRpGBA+Zb0ibGmtq/TvC8v2JuzZ1Csq0bJ4rAtmvT
	XlQI7iCJqDwsc3pbFzAowFOe0m/bnxPn/g4xQY457odluGqz7pUq361V+FYo0b4/w/N1cfrhZLNuM
	CSJwsX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPyQ-00000006M0K-19wG;
	Mon, 13 Jan 2025 19:19:42 +0000
Received: from mail-dm6nam12on20626.outbound.protection.outlook.com ([2a01:111:f403:2417::626] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPx9-00000006LlI-3mGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lzx4T/h9s31pOk2qRiRoWA1F2QVUAlWLQ69nRG+j7klgN/haCDMJKVNglZAaMtBo+62mwp2G6qMhzO8xaQmEY/t682wyHAXUOIz1rVkSJnCx5PMp0vqEh2VqVEb+cTy7EQkvAcT+TWVK4iKIFypTEpbLTJpmUM0skORP/VxLiNRC55P5lwXh/ImDnKd3OPAFutLg0+FLKUu6ow86RPniJ1WL9VAgCgBe6FMmkOgy4+11X9BwIgKM1Exu++MroudV698hkIFCvvx/GWcmI3hJqZQ9/CQD6/HY+lZ8qpWc5ASsv7L8+/jfOqZynUtqNZkZhAjiOYyAbRiAODivsSsVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gkkx2oy1c+EKwRUASgngzGic2tqFWtNxseH28JSlWQQ=;
 b=im3R7e/ArltkJCCYLk2M2L0wW34DTw+OXJUZRbil1M40R4hIVoqP2DvksVqE2rJdm4ju9sENt3LvcqFd+oxwM3f9SnSRfJmgc2VI3Hs034L89sNQSFsLD/Dlqlm2izgIBL2XSExiZv4ywjMLJ6LM3Nl0Wuc8GANCQid5ZlhQScyCPGYEKBw7ZUuOW3rB+s26aVWMnb7AmHy+xLD+NJyaDnPjBrr+h37CW2N7dMM1e0jp5vCYZqIUo0pqFOJkckVj5ZUwzFN9BM3cZvnVHFa3VUdEJu2usEMDgTLFw50glxdr8v6mctWgJ+W+w2ZPa6T36koi8x6KpigAOJcPqTau7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gkkx2oy1c+EKwRUASgngzGic2tqFWtNxseH28JSlWQQ=;
 b=jwUM2wZF51MBkTOoAcP8CC3ubNR7fkD5wkK4UZYAz2EJQjXOufLOROSATWY0dum0WffDq51URrcIE9OevIePS/YrYTFamIZCbOE8CtMlFZlFWYwbrdL+20lTQcboI+3iv1Q+IiyUw5Lhc16u/SvQxFf33aGg/8Pyhc4/FWbMb1s5xz4A05H1A02TII6V4Jss4SYUrVFm+mx7PCMIWRVSR3Kp2zGLJN+wrkpccxty6f7lo9+cxz5RXGHK9uYPVr4jk8VtzRQM1UQNbyQ6AbjPQ/pWvL01bvIJOkl7MgWVuLNqZrkXdjjS2DN/qKlLreCE/QbNN7S0sFNBL2ypnpVyVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 19:18:19 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8314.022; Mon, 13 Jan 2025
 19:18:19 +0000
Date: Mon, 13 Jan 2025 15:18:17 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, kevin.tian@intel.com, corbet@lwn.net,
	oe-kbuild-all@lists.linux.dev, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <20250113191817.GA540878@nvidia.com>
References: <03c01be90e53f743a91b6c1376c408404b891867.1736237481.git.nicolinc@nvidia.com>
 <202501091822.4ocbIobQ-lkp@intel.com>
 <Z4Vi9raM/lOot/SQ@Asurada-Nvidia>
 <20250113190641.GQ5556@nvidia.com>
 <Z4VmST8xyAluL858@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4VmST8xyAluL858@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:208:120::33) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e26ff1f-bfd7-469a-09ca-08dd340709dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rCzmnPmIX8Bh+lH2MsvMuHIXsyQfmVsb5vZLn+c7OLAB8Jkstt/5b2HqIAk0?=
 =?us-ascii?Q?1pg9cx4WZIVtk1MKIJVaKJPIlM3DjbHq3KgwSFOdwYI5+uw/Lb179XheGVL1?=
 =?us-ascii?Q?Gv0dkSfRBvsFo5yrbBXqQegptXx0oobmTKhmWuJaClWJMAvG1gdzwjagt1k1?=
 =?us-ascii?Q?vc1nVy/7vovI0n6IsdZQK9QEPy28qRPin/a9xPMEeofxeT5gtgB+/AXhRNlg?=
 =?us-ascii?Q?NtFH/NIu8TZxZfLOLA251kcF3ZNYshf/lNKrt98n4OaiaG31VDKSCL8ayHqk?=
 =?us-ascii?Q?KE/58PZfjZGtiD6dwjSFXKBEdpXoLWfVNCFymCnJ1xlQID4wxQ4lpxhHYBoh?=
 =?us-ascii?Q?6yMV7wYXVlNysdrkD6aotREQGqoajvosL/hfWYy52uPJyLyxsZtSfcMpVVYK?=
 =?us-ascii?Q?DTEnNPaDJVST99skNuOf9QSxvsZ8j2FRUgGwf4tH0sASv31Em467pqdM+Kmj?=
 =?us-ascii?Q?GASsK3TXrNp8SERgP06uvMgw2LUpeLA2V2UctoscFh+qWvppGHajbLXx2QBz?=
 =?us-ascii?Q?wUmTuYFwDuHQ9rQ14QFIfw8a1GZrAid585FjmNQfK4PkpwoSTGOeBHWczuf7?=
 =?us-ascii?Q?9CPLciDNOi+CfazbY0CsV7GEJPmU7ESURJDjMPm9V3p6+xKISq5pns/IgGcB?=
 =?us-ascii?Q?rWPKTWedgg2szcAmnoZDhm9tOSORDsYqcodxA+jQT0PYmVsG3/mdFdwUe4IZ?=
 =?us-ascii?Q?iPFvRZ07mM7B33vREDewUw+sphpCUDFYdCtlFei5QPvWgWcymE308z/7hg2X?=
 =?us-ascii?Q?gWSqQpifDl2msXRVHfTkkgAgXoU3Fyf8OOpiOr4SoFjCtJFQgI27A8uEpC9r?=
 =?us-ascii?Q?rqQCOkZggyWa8iMYM+DHEeDK5/VlBujBP+cQrJCnsJuuMgjrzqmko32IBRJE?=
 =?us-ascii?Q?Em4PvM/qmf5KwBKsEI81gWYf08YkjKJNOsKrs0E+MhmC2PmnXTR8Cj7k+sF7?=
 =?us-ascii?Q?SpCsdOoFdz+SzulZlOO6UMt1CZU21RGTv5npFbfNY71LLLaUmoaeUlxKGPVq?=
 =?us-ascii?Q?jwJM1OP3RZV3Ar/KCrka869eJFxrUZBbP/4YM9Pl0k1+OQc1QwnDJVfXJSHq?=
 =?us-ascii?Q?oRP/plWYjtDhWUrP2XyZsvzrjRlDxw/57v1uR3d/5ch1n/JMfIEeKfBaHVlQ?=
 =?us-ascii?Q?gyB7Bvwbtq+JS14YsqlAsOy8omcfdaqJLyAFVKe1tga4DSmRQQesxvuQ9qp5?=
 =?us-ascii?Q?rksp4jK+xfVVdlrlSELcQRKXGYYt2HTD7O8UtdEqJzLQccTZcG+N8Pv1nP8e?=
 =?us-ascii?Q?+pinQF6kJsTO+P6IAJ4kMRyqNy8S3f20os0csI9KgTbW7SUn1+tkYOeSQVbv?=
 =?us-ascii?Q?f6VDScRlME2I64JIEEIevzKFodXPhd52f/dUyCaBbpbC/Ktc2FDExbcr7Il7?=
 =?us-ascii?Q?GdV6M3iNIgs7Q/ectETrz7eqmfuh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jGOrOmnBJq2aPWWeKB2/TlWk5WBOs9D7PvJkHU1YEpZwrPPPXGKWSFSevkdC?=
 =?us-ascii?Q?lv+7lQ49duZG9UPCtQ7VOGnBtFYXLbnkf/zAX+1nmvV5gVp3QaqKNOw/HCu8?=
 =?us-ascii?Q?nBE9Xlqqhvjfj4U2yFMO8KdVY50d5R0Uh6ke9xWV7vgXMl9SGqmO3khqs/Z/?=
 =?us-ascii?Q?F6oY5w8yqVyLtikdTtpgiKpu95HIQ01dwH2RmNKsemSUwqLjbdO3e354LgGB?=
 =?us-ascii?Q?ePQmd8UWLbqdfJwbq+nOxJ4yeit1ThOAD/TtyNX9JzX1G/mWmpHhec6CZGqa?=
 =?us-ascii?Q?otYfwWGisyRvW/X6PR5nI1vmJbiwohEcmHPX5/jJZK6vFjnM7gWWnon+LJb/?=
 =?us-ascii?Q?zjkRUcWowRtp1CZjgVDxMExHoWMDYCX7rOVRsnYyhgOhaiWjBNPrM8ybu6Wy?=
 =?us-ascii?Q?PoDGIJz1r6Bo6fSWIGkYLBN1Fk+47RDCBu/o4FiaZbCN2sJF0uqVdEUHe5AP?=
 =?us-ascii?Q?rwW2Ot0hySiLRLZjNLG5wzNAU8YJTjD+IExfcdKPJzMhlQ5xlYxsblILVYad?=
 =?us-ascii?Q?bsCMVAB70l0Q0Q7OuOD9lnRM0apZ806J5khBQRkQYjcZ/wWEtZXuhDTlLOHT?=
 =?us-ascii?Q?OqLgXQASyyWPHZTZyOzM9a3u5rSOzaDb+uqva+j/la6VkpRkD3GicljN1p3E?=
 =?us-ascii?Q?+8pEJ+brWczpd97pq8PdnJY3TpjVM5H++cZGKkZihCTEieCazx68jadWo3dH?=
 =?us-ascii?Q?bSb0h05Kk1AFWS04Ko5r2kyobQFkEqV2LeQpRSZ76ho+PiMvLSVKPVq1bMXY?=
 =?us-ascii?Q?SEVT5Eq7TjYyXAITbIZ+NL0DfiHVT5QCf6rm0Z/Oyjc2n7JsDadPycmrVsY/?=
 =?us-ascii?Q?hPC+ndv9O/rlJRMz/+sqE18NwAn+um9jY67PYie9EX6emezTXjgKI0lx239q?=
 =?us-ascii?Q?EvpH9VB0YG8tx4t3sij38K+YS3OSdpEsz+hjkz8OjguhvFYNc/6lJlHWwFut?=
 =?us-ascii?Q?Kv9SU8bXN8NLegmh2j6sIR++dZ+S/61AytIgfwVkOxkClbPxuQZ5chWt7cy2?=
 =?us-ascii?Q?sqhCQwFRP9opoLw9JKXYUNKfoLm41bubzYIKhsOVi0USjn0fND+/S10Wu37n?=
 =?us-ascii?Q?y6ewhm2rTZRMaMzVgMA5Y3YKJ8ZmLxzYgNXi9rjZ2rQ1dITY8vK8wMSdDUAc?=
 =?us-ascii?Q?a95mecUxrgnGNH9rnkq0K7SiLKfoB2NxjgN7nkIHqJqexfGlo5EqNKHAzJPq?=
 =?us-ascii?Q?mgHjHOULnIaKss8GAIZXx10qVjgZ7omC/1XnGTDmdnDXKF4K99ojSPUMNyX8?=
 =?us-ascii?Q?AWQckiR9kdRvaiPhlrpHKYuI/LaqeM+Pe9gOTmHarXLX2W8qQlqf+uHk1HWm?=
 =?us-ascii?Q?xqX//iqpDc2sDpw19yzjOuFKlO0QsmOLAresFzNLhrUwjst5xGTNMlsSQRnf?=
 =?us-ascii?Q?ku6WRELQQEj8kL5rze4XMRY/56CfMgY1oehilR+1El1c1RDMbN3LkmN5zh3Z?=
 =?us-ascii?Q?IzKMTi8hXqhWndSnEYgwQ15VBToWwXl7tcQIky3j4KtlXZW9virEfku3DmbY?=
 =?us-ascii?Q?1XaH2AaAES1G8KFIkY59Qn2M5OMZmCrZA3mZXVKSmlhtx+2Xobq+W7gj5iVn?=
 =?us-ascii?Q?0ivafjoRPIjdwlAN3JTuT2lW0g3BEnJARLITFZRj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e26ff1f-bfd7-469a-09ca-08dd340709dd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:18:19.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe0eYyHTPxzV7n5zAfz1dU1NDQhtZdAdX9qZFsv48VGM+mJV9/yfEJYNqsdHkiiI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_111823_933909_5F1644E3 
X-CRM114-Status: GOOD (  10.46  )
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

On Mon, Jan 13, 2025 at 11:15:21AM -0800, Nicolin Chen wrote:
> On Mon, Jan 13, 2025 at 03:06:41PM -0400, Jason Gunthorpe wrote:
> > On Mon, Jan 13, 2025 at 11:01:10AM -0800, Nicolin Chen wrote:
> > 
> > > +/* This is basically iommu_vevent_arm_smmuv3 in u64 for conversion */
> > > +struct arm_vsmmu_evt {
> > > +	union {
> > > +		u64 evt[EVTQ_ENT_DWORDS];
> > > +		struct iommu_vevent_arm_smmuv3 uevt;
> > > +	};
> > > +};
> > 
> > This doesn't seem right, don't make unions like this
> 
> This is copied from the invalidate union though... Any reason why
> this is no longer good for evt v.s. cmd?

In that case it was trying to be really optimal and copy in place,
here we don't care so much..

Jason


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DCDC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZA+CQIkCvizA8dLjx0OEaP33Sl1YDFtnUJy1LyP3Wk=; b=QKxvAefSH+CTHbrxvYImjIoGeG
	iZvgG7Q6YXvUWPnV2gcFGZCoUEoUi1ZsksI6DOGB0H0+1DiC4BzqYLOwEei29xAFEri8+9lfbHv1a
	idhkNxIylzLbAPCW5SMuOfaFcoYoZ4WVVlaxFwBQ/NrFXfnTtJZa7nYT2gi+ivvd2su5fgDjlJDNv
	MzWmHEvMBHisicSxYJ7dKyeD7jAg8h6Vv0iEmtOHyOvx8AfUoMr7hhADhzSP+g9zpmjH7diHHNVnY
	oJ94UGbBspErHzeZPDiAtTGXg9H9l/Sf/3qIQntLGffxHHd/cYo9/sUXzKr2OVktuLbDQKzqu/cpv
	YOwVJZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVSI-00000009wdS-0Upa;
	Mon, 12 May 2025 15:52:38 +0000
Received: from mail-dm6nam12on2060a.outbound.protection.outlook.com ([2a01:111:f403:2417::60a] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEV8P-00000009sSQ-3sxe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3hWnpJr+a66Zy0HCXb5BmhqHDmr+zLjaR62TY8xVR43hbIHAqSNDUJm/bV925+v92QhuushKuG9+8ToEaLYQPyKRCukyeiZzjY1H9xr7boevB5D4G1TpPwvEoGlUB6p2FqwvI1WrXUPlhz1HxyCWuXVtqSrDICpCD96s0GfFKJFM2TiDO3CIUrVeZWvPQ+0PVMl1pIljwnjVnFdqaQC6ZAxiFFc23q8h/pTiXBxdWZhjNPlMdKZAgqCNWo8w0MpAtDEZMb81EWrFvcdk6DUI8w+97BGf0VeRURABe4Ht8RQkTSV9gLSwuB/jDyn0nfKAyDTFLPRMWDPO40jDun7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZA+CQIkCvizA8dLjx0OEaP33Sl1YDFtnUJy1LyP3Wk=;
 b=wD1cd04iDvDhPohkdoRQjjtGr7imXQyUw/p3Hxa5a0xj8BKs5ZcRQ77qrzl/ICh1BE3nzgTDCeQfgk9SCMRh32/j6+YYha6ChTYSc4h9kNwjZeRd7yQjKQJaVF6XTC72SXnGi//6DIPDWzhwZKjIgO9XswDDTpacDdGULurgSWXRvLvr/KFoaklkl/EC09OH5y3g+BRaq24kacZKgraz1tdSeJFracqTKehdv6hpobJHU6spdXfek/R7l/FcA3CFXNhNQyoipAYql+R408orgmrkRSMlc0P4gFXZEd0TsWAKOAzJTF7MejJiYvvfqNhU5qUEskZy70ZTKqd3LKnUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZA+CQIkCvizA8dLjx0OEaP33Sl1YDFtnUJy1LyP3Wk=;
 b=gRiMNtJzNlEtC9GGMrIupQSVb6906soxM8J4EVKNBeC/wDwKaS5sNcoYOJRRchDDBmoiwuLsXqJqLdWZ9t+Ol+YpJuAJcUe1/CitLkaIzUDB+HyM5x1v4mk5xiepIw2GP7Jx8IJoq9MTt0obnUf9tKqGreHx+tm1Hso6hall2PfPwUBpikuIfygnn7/tTAoicE0YEPXMAO9WfuoVRw/Cz/m6c9jrTPF52Kzfo7XYeY9F+3k8jXQeRTGGKhPsxN+qWhlCquGu+s/BUwOSudtz9iQY/KSzdnLd8dL/0DVyHnBtLmCMEF/MyACk0F255rY2t4xFRS8HzVWrXwP+FOrOFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7656.namprd12.prod.outlook.com (2603:10b6:8:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 12 May
 2025 15:31:57 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:31:57 +0000
Date: Mon, 12 May 2025 12:31:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	will@kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	yi.l.liu@intel.com
Subject: Re: [PATCH v2 06/19] iommufd/viommu: Add
 IOMMU_VIOMMU_SET/UNSET_VDEV_ID ioctl
Message-ID: <20250512153156.GA286987@nvidia.com>
References: <95ab62fa-bb1c-4e4a-a210-b0bdba0d4ad2@amd.com>
 <aBHYN39FcH+NG5Ab@Asurada-Nvidia>
 <20250505170807.GP2260709@nvidia.com>
 <aBl5uLOFCntuIYYz@nvidia.com>
 <20250506125847.GA2260709@nvidia.com>
 <8e0182b9-7a8b-4388-9f22-c39bfbaf3df1@amd.com>
 <20250507122411.GA90261@nvidia.com>
 <76ac7908-45d7-4821-b34c-a5d2ee49c7d7@amd.com>
 <20250509220717.GE5657@nvidia.com>
 <e574e1d0-b003-462d-9a59-ef16e95b7766@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e574e1d0-b003-462d-9a59-ef16e95b7766@amd.com>
X-ClientProxiedBy: BLAPR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:208:32a::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 757b0029-9bc4-4b62-4307-08dd916a21b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k0CbvwuVwxUC7aiKT9z1u/T64XtaIn8LcWn8SBJvcYEX5N/j75Iw1UlFM1WI?=
 =?us-ascii?Q?PAuLwwkgBR1p+L/d7sWAHV3rRFbGSRsumxQq4QBSBem3souF5rQ2iksBY3/Z?=
 =?us-ascii?Q?Oq1JaN/AMrO7cNXHy3a+7NA9vXhBPErv+/zFedfLxO5KsSsvC8dkc87Up/TC?=
 =?us-ascii?Q?WRydTzBRENLji347pP8SSY44CUomaRtzhkmwvwM8TT1R/3isJwzt2+9uXeWx?=
 =?us-ascii?Q?DMdMLfLkDvjGHCUdP09X2yzUhUGKbEdIzWA+coouKwWJR7tYpzE7BYqePbnG?=
 =?us-ascii?Q?fstGRRIcSrVeWiFqPdlkVQBgmEfrrpCW1HZOpFJiIQTfgJwkLPvFtkM+2EKj?=
 =?us-ascii?Q?y39gBF7XklC9pldrXABF1Sh7e9r1Cf2BTv4qEEG3Fc9n6BI6HI2JBDS5AqJS?=
 =?us-ascii?Q?bY1BoG5OGIX09I6A97HYRRmkn6az0oBnxZywy2MmuYM3UYc1yV2TfAHpohXE?=
 =?us-ascii?Q?XaJLUpp5tB+bZqC0+HCGZBcbxfOQxcN36GDvqEoCJidYX2H4YRC/Oo+/PUkZ?=
 =?us-ascii?Q?3kKHmdXajEs8iV8WvlSBJtM1AAURYUOdFfoz8TxP25cRA8oB14BYwze+Z/IE?=
 =?us-ascii?Q?MA8NERO23f/3iNcS+lGB0sTXJb593yo7RCCD0OicsStjTO4YPpP/pEGphrrO?=
 =?us-ascii?Q?LPUbioyh2BvMGWVXP9NVwDdESKpKRvL00le98Yn7f+dl2n04qlrpYdQzsjp7?=
 =?us-ascii?Q?czMcYxLxnUrxBnzZy/3jGhSdkUiZzSb94MHXXFaukisDtr/hT9qQqOBDBZiN?=
 =?us-ascii?Q?Q6NjxS2bwAKRFAe3xobz4mgw60Oe/7PPhMSbiPqcGjGjQHvMdz5N6l2me/EB?=
 =?us-ascii?Q?UNlL0kd1j0QZ/P0+XmfuQ3Jm4U9lAdPAD/gyjEjqvBB8DZsMTKZOjPJH8s0X?=
 =?us-ascii?Q?0QZvUtl5kRiIkDqUNmzPOYzCx5n6jRZpfh70X0QfbNZe5rwe9NmJ2/kSLPUC?=
 =?us-ascii?Q?C2zRZbXDWBQwopn8hR6sl/Z+K/BsmZ6O8OKyO6zlDsvMCgrSHbBy5VD8KoT9?=
 =?us-ascii?Q?Bma9xy34dbbQ5kbHe57RsBRXCiA8Cd6JEavMwuCXY0OIk2vcXr2WPi44QgsD?=
 =?us-ascii?Q?yNVLzARuEvgsRKyQbDMza1H+TjIVW0XzadmMh/dpQdPVeOsI1VuXusileoJl?=
 =?us-ascii?Q?c+j83HDcHeb6cF+PbUXT6gfFk06FPBhRwP/E40iZn1GfPtJe8oFeTwtm0Xg+?=
 =?us-ascii?Q?Qh5BE4Fa31Ogl4gXqwEfzNu68bjIJv73wIPCTDaXEOHWLnnI3O0Btkpcx/rA?=
 =?us-ascii?Q?RNNPAr3BQeUUyngXyLYj/7DcWJymuMTYnSq5iuyv0pFaerXhM5Qs3oMxirs9?=
 =?us-ascii?Q?0CIC51QLlK/jB6n4RBP/wgfEyKB+v1zXi4nqN6rrsvtJTfFtP3NaY4a4Nk4+?=
 =?us-ascii?Q?6R0Lw/UezOmeh8SsvIJAFF/LSAqD0Fj4BGsoXgKXmiDHPxfKFiXnit4df/+R?=
 =?us-ascii?Q?xuCoLV3h/oY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEonM6jN6Q7kSQB9sSein3qSoPEfKLk1ulXAuQZmeWLPoTl7Vr0mpZ7snYk+?=
 =?us-ascii?Q?I19Jduqa7SUgy2ga/QtIkQLmWcYDfI++bQAjyKMdDtdyjov8A4wgLJaRAz7O?=
 =?us-ascii?Q?2swn9H745l8EquJFyMvXc0q2xP8UMgmcs5PIeZLTuaRFQ12/QOmbG5LLe9ZA?=
 =?us-ascii?Q?cJrzZSpDNhW2m4h2K9hq0HaV4hg/G+FqKB347/PcW4cXfKIw5ioGeRSECDEA?=
 =?us-ascii?Q?/kE7BZ5fvezZNMqsu3+BtIRoLdgCbmH4Fz395MP1h9l4b+ihhMnG87QhE17M?=
 =?us-ascii?Q?GyDtsQDiPctHGuzwjCJhL/iNcCdNwdUWdLkXSpUwXR0m+szVPtJpmcAg7ILS?=
 =?us-ascii?Q?80h70UXf+Qvi1yVJVM15TAIfaLLo8DUZBBxGDcl1HeccYagpgc0m8+hbFTbe?=
 =?us-ascii?Q?cGvusvlmAWEhsvZ1rHTLdkCigwcoeb8VDaePlsq1+vVEyAIpEPIuk3h2SPmD?=
 =?us-ascii?Q?EFLTD/9W2SUl26iIIHE1US1w2Py//bfGCEePzPWhvkT7MHiXSD82qKC1kLl1?=
 =?us-ascii?Q?gcW+D9YWgRHlfc1lNji/PRurd/4CeREAMD1rYvjIF0DeWQSnoMS4zDYVMbJE?=
 =?us-ascii?Q?3QdX+0AqRye6oD5J1XkIip3HG94sGtWyL/OAjOBW1MSIturlwzCG5D+D4v3a?=
 =?us-ascii?Q?thVZyzBiLZt2V/Eo6S7MQP8UmWvHlhJFv/q9u0oC+ZOKzYls/I7dYEjNj1YM?=
 =?us-ascii?Q?+IggdApo1hbi5tfH7KJSG2lZQ+Z8P8jBCVJYNdnVVYD3YT9LKWtAsFB3z8fb?=
 =?us-ascii?Q?JTkGkh5cYJULyfnFBwW/vzWjyXYg3c6q5Zklcc2I6RWK4S5qA7Dueeev7nL7?=
 =?us-ascii?Q?nDyatBDymmMfSbUbKRyJXQKfAAcDu+XjzAGF0DUfVCHFivIHxQ9BQukFl8Uk?=
 =?us-ascii?Q?cUJatlv2p+AOH4YT810VFvfY6wLzp+M2Z4hIFkVHY2zvwkgnYw+zOnx2DeZ4?=
 =?us-ascii?Q?PmJvVUTEivk6t4vPfEcsunrV973G2Rt5CSyvn/3lr111pMWhlR6ouUMgcoQz?=
 =?us-ascii?Q?cFWjc2Q4kcSpfM7tCHI7Hm2cHq/F+nH+KsdH4GQ/FB2NzWVOGxcKds3HZOKo?=
 =?us-ascii?Q?YS+kGnreP8FZ814AFrorusOyHmGwEwyTNJur3CD5wjw93BwiU/sXQMhxl+9Y?=
 =?us-ascii?Q?CL4EYRbQUiIPe2Psh9rz/eDbL2QAUJYi+5wIJ0PSqZjgk+mGfJesdAJmUUQ/?=
 =?us-ascii?Q?Fr3prHUq+a8nIU3AOvxsohr0FPj+Wqkiy9bkKfQlUledGATJHK9RMqOSdIDK?=
 =?us-ascii?Q?15BVoiXr0B++MoEuVNRSt7Y2i985U91jtaoBcXZ2STtcWT4Lmo6yTa7lm94E?=
 =?us-ascii?Q?9fGlWq+Ogd1fLv1W0zVPRgimbucPDgQd6aWFqNXKBQGhMYdZqrnzx47I53IB?=
 =?us-ascii?Q?c7ugVtpzvyh+oFETxLReEs21otxS1BTzQ0VtDE5SkJ5/LiDeQDiAIauyzgwq?=
 =?us-ascii?Q?XKM8BvuUv2OvrvCon45A4OfX2Wh0qzbshxAVsHtyVEMT1R5Hu7EGUg12cshy?=
 =?us-ascii?Q?Oo/tCmTH+y4+OX3kWV8tQ7biqbEucmxdMeYZw+h/JsOMqmjHoAiF4J+Taty7?=
 =?us-ascii?Q?Ma0HInRG7bqQsmOhqiM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757b0029-9bc4-4b62-4307-08dd916a21b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:31:57.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRVJXYuXYQBdNP+oYOtFi06zu/azqqMvbPbh/h7670//g0vuA7GKzk7k3skOtfwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_083205_968043_A4B40900 
X-CRM114-Status: GOOD (  26.11  )
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

On Sat, May 10, 2025 at 10:51:58PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 10/5/25 08:07, Jason Gunthorpe wrote:
> > On Fri, May 09, 2025 at 12:57:18PM +1000, Alexey Kardashevskiy wrote:
> > > 
> > > 
> > > On 7/5/25 22:24, Jason Gunthorpe wrote:
> > > > On Wed, May 07, 2025 at 09:18:29PM +1000, Alexey Kardashevskiy wrote:
> > > > 
> > > > > > We should not destroy the vdevice for something like that. In a CC
> > > > > > case that would unplug it from the VM which is not right.
> > > > > 
> > > > > vdevice is not directly seen by the guest, is not it? The guest will
> > > > > see, for example, an "AMD IOMMU" and assume there is device table
> > > > > for all 64K devices, and so on, it is QEMU which will be
> > > > > reallocating vdevice in the host's IOMMUFD. Did I miss something
> > > > > here? Thanks,
> > > > 
> > > > I imagined the vdevice would trigger the CC call to create the vPCI
> > > > function in the guest attached to the secure iommu.
> > > 
> > > What is this vPCI going to look like inside the guest? There still
> > > be AMD IOMMU PCI function and passed through to-be-trusted PCI
> > > function.
> > 
> > However the VMM tells it to look using the arguments to the create
> > vdevice ioctl?
> > 
> > I don't understand the question?
> 
> "We should not destroy the vdevice" confused me. It is not a device
> which a VM would see (or is it?),

I think in some cases it will be.

> we can create/destroy at any time (well, may be not, but the VM does
> not have a say in this). And then this vPCI thing - what is it,
> synonym to "vdevice" or a different thing?

When I say vPCI I usually mean the VM's view of the secure virtual
PCI function.

I'm still not completely clear how each of the arches split up the
responsibility to create the vPCI between all the software
components. I'm pretty sure there are quite a few differences here.

Jason


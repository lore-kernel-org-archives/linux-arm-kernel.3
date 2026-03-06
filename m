Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4680FCC066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/HepSzZ++eZJItVySsvVlTM1s0RtzxUj//4iP/+7XE=; b=Y0EzXVLpbNYdux8qweqW3qDbxI
	Wa4flZTfZbkBzJsnzHGeVAwRe2QfA8aX8ADKt6iN3Me7YrloW7JvP/u0n7M71G1b9vNPZuZ4B/MpZ
	GGFzRvpdYZ07VJ3fVWTQhmQo9OILNlmXUHbr88Sdalz4npEiNx7jfK/Xk+5F3nWHOSYHUj1zfWVlc
	qZBet3mieFB5q0qmXGR9+q7USEGs2nhVCqB3boVAHONYNlCZciEc+RJDcfaTua/yzBAHN173K1TQo
	gyV7QYTaOFSe5oiEPK9wa3Qq1wP790I+qf1v7h1Gd6v3iHz3QKUKH+xmrNse2i7dq+OeNPAF+yKdT
	NqJL1CwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaki-00000004OcE-2uHA;
	Fri, 06 Mar 2026 19:22:24 +0000
Received: from mail-southcentralusazon11011057.outbound.protection.outlook.com ([40.93.194.57] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyake-00000004ObF-1q1b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9iEgxgPzmBs8i1V+34ulAkAmYrxLXFPsl5lWOsEDr6yjydYu7titDovrsbe7ljb2AqsGljw0WLzw6cX+T5wRyJq+jDUMn1XIqrIueoEymIy4TZqw9SU/S6orEJ10t/pnUfuFBPw2F3fzKG1KohaE/e4cedGDkfvG8YaCnGwaQryP/LIt/skjnGnu/+04Owpz2sqo8oZmd8f9u9C5Xfbu9NZA22jhccNEmjn1GcLGWjwXXnI3DvaMKl9/eS4aqTTECNnVdq+Bbgk/pcs7tepd52Sz4IF5gfRBPmSTdQ7hjswViernBdEQVhX3Wy1S7fuPM71mdaJJCF/hc65+sifrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/HepSzZ++eZJItVySsvVlTM1s0RtzxUj//4iP/+7XE=;
 b=VSvlq8r1XpFKBiIgObSEVxVSg3RdrZMAAQ37MZLaj4JL/kpxd+58sCqgWdk6Om+It+Qu+cEIimEJosm8O761qvsytFc4D98Hl7JyXxYh3tjJvv+BbcBVh95xDeIR8zpNpvErPa5gwAtiqUt5oLWTr0+Df001zBALP/Iq1KricXhaWDJ+0+IFjWVtpwI67LTBQV10VaGBKjlPkgatABeM0cY0okHfc3TcU2XFubZYA/whEt+/xLmIQBNii8C7ZDkSQ5iCeIdctnLv/jQSlyEPstq1SJuSdbe6sgVvyK0nnHJkljxFaHVDE/hwM0RBKgAg4hHReIJq2sAdrjJATWpqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/HepSzZ++eZJItVySsvVlTM1s0RtzxUj//4iP/+7XE=;
 b=l8FHSI9l7s66OPa/4s3zWtuy3uzQa6ao0pc+/TO1d0iB3npUJCpgROTP1AgF0yNgUV3GHTajQ4tB9kxDpLac0bduZCAexPlrOhcxZ3X2/h7Mr0tA0pM+n2SsErj+APwcOXgMDPIbphU/FyEHcacY2a+0puPnHGbo9yGtJCUGMmLB3n4ZYURxpIFwTt25oghAECPsTV6e9UUr3ha+ph4bqGIrNHgRIGnqU0kb3YqiXYP1zdk0vMYlTCg3XKVTAaiiErM4AizSknZvljrsMEw+igJ73TeNehWPt/qmNgOeSSyaknnallFjAukyIxSNLxNBWBNiIc354TLuKLQmKojKzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 19:22:12 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 19:22:11 +0000
Date: Fri, 6 Mar 2026 15:22:11 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260306192211.GK1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
 <20260306013347.GD1651202@nvidia.com>
 <aapgyXadT1TEz29u@Asurada-Nvidia>
 <20260306130202.GG1651202@nvidia.com>
 <aaspAx9NiXmtRg11@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaspAx9NiXmtRg11@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0868.namprd03.prod.outlook.com
 (2603:10b6:408:13d::33) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 1649f9cb-11f9-4889-a569-08de7bb5aacb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: vmRrgfGIJb/ao87a2HbhrJK4N2knjclxRMRBBOOgXlQZVKM8Ne/1/qublzHkaYp1MyqoFxDW+WeXDKSrBlC1nlnBR3ewcHM3RlhpIaAQZOWLjMtKLcuJN0nUhM0ls37Ybh3zlCE/CyFXA24vxsEQVausAtIQDeK1xbVhhlJnUTT9z5Bkg59WAdOkvwHUqx421fYdkR3NqRm/a6t3aFE2m0ZZEU0Y/ztrN9PtjzpzHq2zJ9nV4RMKWUI7dsUs6AcUMH2ZVhENdl1wlqNKPEwI4EOvdpakIwod1vR8QiVeIGP2rA781mIL9uKRgOpTCa5jzyNim9zVIOp4LCVR3NmpoayRWpKvt24nN0yBlQxqMAjDQ9JrgdG/j89AeYjPG+JbmhGA6e9eS/v+7senonCnPzjNHefQ22eDtulTphKcIC0wH2x8yH2gtz0L/5c4XYFrYsdE2PivSKL2VRmx0WdwiH4CPyRCYVjwzwQTLrKESUfZQVhqMtH5YG1PT2ak3S3P+7YXTnyTuIwU7sFyxnGInN9TuqV1NQBSadfZyBr/OLBjTONX9tbI/eA9AYZf8X/bbRWYjlT44uEm3+VfDZu9ymYM/i4zL8xW2tBGYqdcvyKQqYerSgi0G8O+lCKdtHR1UfAnCG1b/zTOT7iGt3fxtu4Blh/vHSoQ7GgN/QOcCFwEQR0k+oqGw82Qrix1LRcBiq3d/UHNZ9mz9lul4i8sQONs5OSJGpNeqrWWYdq20/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fzugug8MVQk95bEMevzD5SuqC4+rdsro7T2kaUl9pnWtVZf/wz4NRmFvH47o?=
 =?us-ascii?Q?zTLRo1NEnPlca+R8wLy7kb4VSbRTChMdNv12zipMxFnr/Cc2d2hV5U60alC9?=
 =?us-ascii?Q?SXMWD27qczJ40Cugv7TqywA0XPd7RSKOLi0oWeDDAdDrsIpxwDcTjmqeEQr1?=
 =?us-ascii?Q?CmYnjU1ZpU8xP7lDZNjR+D2cBBDRwAB0v3OxhvLP9By2IU5uFPuhrClbDNDF?=
 =?us-ascii?Q?XT8qvsdBZRYKLY1jtELH/zNSoGvrpTCgaeoFMlS5Exv6CLl9tdYvLpFYDSCM?=
 =?us-ascii?Q?D1flV7sqSDkcBcCZVs34HmZyIZu0qHEa9+mkV+OZFeW6hH969bfNHzurHFFg?=
 =?us-ascii?Q?08zKSIxeFxLNWXX7+VuIshDn/+rKgqwSov/+cmpZNMUdcZEkD4VOVRw5QxPa?=
 =?us-ascii?Q?70y/nTzDfKhi8UreYWJSnvIOiHquTtbeuIXgyAzFBD5fWrKDh+7fHLl6kumV?=
 =?us-ascii?Q?3hIFIWzW9llO4CIJnlDdyvwy0truP2lStdJT3NgbGNhJxkrfztKIuaSK3MUe?=
 =?us-ascii?Q?cXxjjVQ2JIq+siT+X1qxz0A6fsd/8G1XYmR/Z4hCJ+8b4ladJAxAsExaVq+X?=
 =?us-ascii?Q?69RzrjRM4F6/X4PLU1b/dfC1FELQ+E0HLUe0XT1ql3zYLuS+eWtcNqMgAG+w?=
 =?us-ascii?Q?u7wiXjXywIo3WjmMX4uObf/P+rFBC1IGOU/ny89FIv1+4wLBNoy0uHLVtx0Q?=
 =?us-ascii?Q?ibVPlbsaKV5LKqbbmFRs6upmL1mKxMVTCfi/GQ+Sp4rsZxOX5q+lxMfiAzbq?=
 =?us-ascii?Q?KGWF6s6FLc8aqfUnQyYDckg1kZv1vpSsIYws4O/8y8YPdcoQDBwcLR5/PdWo?=
 =?us-ascii?Q?FNUJuc3snUuupDwDy+SIjfYPGS/Yvv4SvSSVhlfliKL+GOmO6BhTdGpmcH1U?=
 =?us-ascii?Q?F04CRS/UVeDFC/VQHNbWZrQSOCBXKXKMQ/svRQVeQt6d93ApWElRZ/V328cK?=
 =?us-ascii?Q?QA//RFW5fl6IHYc83DXDZguFaGvBUIHIToB4E1GY4zYfdvdTpzLpoc/bEY2s?=
 =?us-ascii?Q?SdbBCett37H3RC3x8iRvcMnEePQfyEivaG/S3gpRoo331+xQxkma46+XVHKn?=
 =?us-ascii?Q?TIpmKoq6k2N3H7m7A4GN3DmEz3AMmv1QqBU2pyTjVdozwvKYQNa6ZCow/J9i?=
 =?us-ascii?Q?xBi3c1/LmRk1MIvmYzazFwJnaJ+8xid7g4oz2mGmkw9QcdgkyEWFSCO3bOB+?=
 =?us-ascii?Q?wA1oTZTkGzesyieu0K6hvUoV4IqUOO1ZMKq5wwWyjU91LLZrkYcfZ3uuyp+X?=
 =?us-ascii?Q?dHybsldEq3tEzIQaTzyE/VajVnb8BdRQ2nKjhgmSXrWLjAH8Kh/2myod18+/?=
 =?us-ascii?Q?Y2od9ojrnm/+csXdQP13Sax1T5jHtaAC6mdVukBV3qBDcaOPmWzqVRlqhzF9?=
 =?us-ascii?Q?pYeqNXHBHD/SsXuyJApOwMAsMIRyHhyuk2ilVEPR/uN38o4WQieSsY5vbH77?=
 =?us-ascii?Q?wFmg91ZHor9zZkuvIauBGAyNcidra05gDt3UUcX/O8ItxGGoo/M+L9EJWqqr?=
 =?us-ascii?Q?7bwYgYiQi3OBr2P286r6Yw2/25eELtoPPFaW+WSdRPJ3sIHWzPUsIZxqCXzU?=
 =?us-ascii?Q?/GOtI1hJbpVCphth2XQq3keeGxDT2s2pLqPxvtrLFEe/RWOh9TNFkSOViSKD?=
 =?us-ascii?Q?uDvKqAtczbSCjzKbTeD0NmPmj2N7u0JPKEOFPjjynA5hhHlwov/zN4r+OhKk?=
 =?us-ascii?Q?oRyQdHBKn6P7E+1fMvNoxaQB+6UXwxmg+TrDXGz5CDVPGRq/Wsen2l72pouk?=
 =?us-ascii?Q?J83klz/Zng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1649f9cb-11f9-4889-a569-08de7bb5aacb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:22:11.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIKg2EdctwT7VG34p3HMxUYBCf4kAl34R5RCYqTNT7uR/QPYiSux3WxEE/XKkDGA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_112220_480043_56A94A6E 
X-CRM114-Status: UNSURE (   6.17  )
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

On Fri, Mar 06, 2026 at 11:20:35AM -0800, Nicolin Chen wrote:

> In general, the maximum users count of an INV_TYPE_ATS would be 1.
> So, an unref() would be sufficient to mute it, though it'd require
> the unref() API to support a mismatched users counter, because the
> PCI reset in the WQ would block ATS, which would try to unref the
> removed command once again.

INV_TYPE_ATS_DISABLED could be made to work too..

Jason


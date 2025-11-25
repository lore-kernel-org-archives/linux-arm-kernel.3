Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3623CD0E6E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0vSyDN+vQ0yQvtbuSEDVpGFWiXCxou95SUvGwT/2bE=; b=dmiVm0FtU5TYPUvAYBU2a3Q8Uw
	V+CbuWCZ11QveD3DJ1+S4bfDhmkHZgaUuTe8xlDBUQmSXAdmbUaVn8nTij0U6zvg88ko58uAN65Cy
	CRZj8wpcYwqk+i/7Ev9b0OJMyidZVmksEptSnvHNFgaktFNa7zM8qszdBhaGUtv8TDtWwxRbn3jqc
	eSbXjpWfCymdxrG8MqFC9lgwaBiU8CMXhzCu+Mp/Iw3Ldgo6PKRLe+AYK0GY/CfdPo/GiluJGbQef
	w3d7z/hiS7LD5AWmmdV2sGymZl2ydOXZL3qDWVo1myRVVWiq0ib3KxGvov8iMN7iVqb5jYg//E4FI
	nAYcRcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtKO-0000000DMkl-3Pk4;
	Tue, 25 Nov 2025 13:43:32 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtKM-0000000DMkE-1ZEU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/67d3wIOkdo5zNeGUur1xoXzurLet2Fpj9CNA3+8D04a1Z52fZwvqdJjtKA3iccik/uu5crsVr/qaPU+KqETmwO6qiztGsBGEXGaTRMu6RdaEbBQmezRYwTnnicNSHY1rMozrSQyUSbN5x6B/PIouGqvbaLbXBeblyghqb94vrUh4XKegQ0HmYkvj2fFqGDgYdnQe8CGe7+gC+11xkM/vcauTTEWSZ93SkMIQSXeykkN0PTuR/+BkA3YPVP/SDrcjBibNP70sIoHxi2t36nf17uPqtlvxCUBy7c2UFoV3HUFUOwHSBZV2D+c1lAeCst1lbuyqDXUVRuBGsq1bYGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0vSyDN+vQ0yQvtbuSEDVpGFWiXCxou95SUvGwT/2bE=;
 b=nVjNFYc8HhIm3i/EaYERUXMrqxIMQvqHHEzlt0QbnJ2ov640wlo2M6sCLPDBLl+2Mv9PjVtKktCFw+pQZHxcxwrg+G284b3PJeTY1FdhbvenZ/wUHDsuIaFsvS0zRgbc/17DaICI0pA2exCIHG952kK2YebW5W9l71k2Xs4M0KUIuXjhZmxRMzIsRJqq0kfwhfTJysguHrbe9rv75oSsInQIXtfO7QL/aeJJRS8135fhT46tXBhw55CMfhHhEqE1dxrewODeoThT/GydaeW6j5qF70EMlypyQNuLgo/6oCcaPLENV5jWw93chppDfbM3cfcL2UBagdlkjGvYKnS65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0vSyDN+vQ0yQvtbuSEDVpGFWiXCxou95SUvGwT/2bE=;
 b=gAIjmKsCudYk02PM7Stl1abkSbxMEH+ILdLVXDOwQJiqQau0132uEJqwYQlzx7fEBHV6d638cAp3IdtarY10a4wY5S4At+O8rMrSG+Dl4H1UzunssH6Dk2GNMLEBHYkjQLetsl623heXcgTFPAmq+lGJeVkCWzXY6/ZQljcpt+bOiZXxiIqkqaq/QXdTlXbRSjbSMIaYiv9KJMHP0wjFmBMlyrIFiXyiqghAgXdMCy2qOog2xZRTxB7wpRtpsUB/jBsZEjj9mzXq73KBV8yWHH6Qt3kyu/1qHQSVOc/qHZCQnEdhTafhBh5lUnFJzE7DNEEW1+O0zKra455LgkErGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB6016.namprd12.prod.outlook.com (2603:10b6:408:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 13:43:22 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Tue, 25 Nov 2025
 13:43:22 +0000
Date: Tue, 25 Nov 2025 09:43:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <20251125134321.GQ153257@nvidia.com>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <eea7bffde13574e099212e3b3823a0f192d6aec3.1762588839.git.nicolinc@nvidia.com>
 <aSTRRyTBh1nATwBa@willie-the-truck>
 <aSUtL9qxYa6/GCfP@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSUtL9qxYa6/GCfP@Asurada-Nvidia>
X-ClientProxiedBy: BL6PEPF0001641A.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:6) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f648cc-2c11-4f96-01a9-08de2c2899b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nZKBCmfyupBrQAindEWOMWZlp/pu372CxDZEiSpmdlFYx6tiJ3Hmnx+OntfR?=
 =?us-ascii?Q?VYJEMwGVPguy2iq8TXmMln9QXhE1PVy1IemJGGtiGcF9OMFc2H4hMFjMmUfy?=
 =?us-ascii?Q?fQRIL2wUDTpRpNrywwwCNp7e/htfcn51T/8P4FkoqT7YWDKK3A0evR2zwFQy?=
 =?us-ascii?Q?7ZxnscnXiYSou3+fIqzeVPiC1bjc+DgOJEb4zeeN+dmYkJdWGo1iAHCvycGl?=
 =?us-ascii?Q?sgPDTMTNup8HrJLXEmKAMCpehJ1djvp0xMSt7KrWTKTdOLKKmLMqnORDnoAb?=
 =?us-ascii?Q?MGETyfEyru8Z2gluZw8jcaMuHLWT6rC4jtXGz8U6Th85/5axkwHpWuu13DlF?=
 =?us-ascii?Q?mHMV2/pWHHMu6iKTfMcd+ir9L+xDF/IH2zkZCOf0Lc9LYMMdQ7AvMkdeN2Uz?=
 =?us-ascii?Q?APeT2YWRxu8DUhINNhOuVzFrUPUwZxlfv+qeX+u7INPrVPZHydvzCZJPqdFY?=
 =?us-ascii?Q?UD0Kxe2D9JtjLxTs9eZeovxW+ihMpRVZBUtJmTQVChEJwGg7jFL5rNFZ9+Nx?=
 =?us-ascii?Q?g0K0JoFNQDaaievdPd7uzCn2g3bnWS8Rwx8QHcQTweWiN830UrhgbejcTxol?=
 =?us-ascii?Q?DcSGbL0mdEq1DhKuSiYdd0CLSTFNpJXRa/KoYoDUw0nxxnLctOZhJtiRSksC?=
 =?us-ascii?Q?epuu4t0DEAXdvMKTY1wrGcvh6tikOiTK5Vb/OZ/w8wA5FAn3sber9qpJs1tb?=
 =?us-ascii?Q?/9ouNIfqPwZ6Xjl9vt77ZvILEG9W2qh3WtvG2ZUTu/a3LPUNAKHFAtDKOdFR?=
 =?us-ascii?Q?pSWart6Fd5UcCRc/uOyQqWabtGmOg9hksHS5seUFbbbf0d920OnXdexLitD0?=
 =?us-ascii?Q?5tX9Jb2wSBrm5DA/KAgWvK1TkGuGLaDsjP+EXS380B1G1U+mVvJmjEa240Fe?=
 =?us-ascii?Q?ohmAikmbRC5zi7QBpIGyc73QRWxbdZu0etM5zqlv99ZDY2s0TuhyuuPf4NVr?=
 =?us-ascii?Q?HJerpfrh9e7uzFFVP/frTXMg8Ql4vedrAaIFl8rGDx/EbenGs5Ll3HdygNTq?=
 =?us-ascii?Q?JKGjFhkq01hRgbQPxrcoKF+lvqpv+bHNDuT2pZmEXe451HXsU+X2X6BghL8n?=
 =?us-ascii?Q?kjkMqMmmTgbKBd3YBBvVTdkSXbFaDzfcylb101ozocuep+4F1oTQzRRlcoP4?=
 =?us-ascii?Q?FVbE00D/0maJuaeCV5PJ90KH1B7sxL5uKE7k6gLZV9hbAcBdwlRVBBv313qg?=
 =?us-ascii?Q?c7JUDu7pwuVhLU6w0I9enaZKZ8YdDHpOiD7ST7WrQhI9fohGauc0IWR7bHI/?=
 =?us-ascii?Q?O0vmr6ktsX60QVbcbBkxXecF5szj6iUzmssaBV6b5Dd8Rvc80A37+4mP9i1T?=
 =?us-ascii?Q?hFVDQtlEqe1jqIkpPEOKGaPO8qcCo6uD3kfHMyYAxbmwt58yUjGdUkUrGp3s?=
 =?us-ascii?Q?l72aGenDTwZWYByVczjGBjB5GijNuc/9r5OWaKs26ORYkFNqQ7bzc4Mi0qco?=
 =?us-ascii?Q?5fW6YtwzyPzehY2+34ussIWfLf9K3YXW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dv5vL7Go7A23m9mBrvx+9i8yCVxhHkPxPxf6IgejtmjsGl1Jhzlc3pt3fOzf?=
 =?us-ascii?Q?1kI9gqZlrXLkE8If7M7dusdw/FzM6w9oxER4pBlMOLMpRDKUYoviFJMIZTeK?=
 =?us-ascii?Q?2+HWN6g2NEXq2gTD+6d9brCWhXJM4PpYIN8oN5K1ZcPnvFzoDG17JV+ySC61?=
 =?us-ascii?Q?o/hVuNplTKNlK8PWJAi1nUD0fg83mjcyCbC46aanh7F8drzWrsodWXGIKBxJ?=
 =?us-ascii?Q?QtdBnVca5U7doNPERqkSL/JtkU0XqJjmaaTMlbWOMs3oGQhxofU3EALgxyrQ?=
 =?us-ascii?Q?++eBG0n8ztKYJC6UyFGHvh90eezPFak0KjH0XJx89YnWsPJdGw8Hrs+0MRgB?=
 =?us-ascii?Q?Si01oi8h+ZXa3hK7QVHYZNq4u4XoWyyhC79csKgz7O4bw7cIzvX2jRcZ+wKL?=
 =?us-ascii?Q?g80bSUNM9XCIZV6LQu9OkfTo1X8Bq/u+3xHA0wu/Qo7bae18rfLtZ7R2zfRE?=
 =?us-ascii?Q?pu4pTcI8iEyDLtxbAMztSoYLoC2gQ8eXOY5tI+gobdJofRBVLAwsi6ia0Dg9?=
 =?us-ascii?Q?vteHF1uZoKoIjw0WxUJIPCD95s/bu1AQ2NPsxgyUJU8pfTBpMM1CBd7i20MC?=
 =?us-ascii?Q?RLwyDD9+3zdslbYLXU6OyiDU9O/sa66n8U1QZDp1IP0U8qn0CH0vbstJX1kx?=
 =?us-ascii?Q?sUbcPF0eqdUMn90fGMgDFqBiqlBnAmVrASK2+U5YfCUDZMGlyF2jf4pBbxAl?=
 =?us-ascii?Q?R4S20RnlEML9AeQidUVHqWrq9MxiisfWJr2UlfUjtfVQasRs1NBROnU1zxi/?=
 =?us-ascii?Q?39qXgFhWyyg8aq7L9UwbpB7vnPz6Lj8+SAvcaDdekw2e31RmEBMa6ygRWk6d?=
 =?us-ascii?Q?jNXng1qaWu+xavtpoKJ4FYzjzs/JZq2bp1JaBkf9N3s6av2GNghnhYjXvWQw?=
 =?us-ascii?Q?pBT6DG1uIq5Evn8JOdYPdHRcSZ1gMybfRcj4jXRORgY57SPlJ+elz8S1ruHS?=
 =?us-ascii?Q?l5bpVEUfoz83J92/hFLV28jF/gyAi577U/zs0u0lKLoJXxHmLEqvoEcwl+XT?=
 =?us-ascii?Q?W1lDIbhwYxzxcvOdfSYPuEeq2pTp4GxRYZD7WtSYXbTJP4JxZ67jn0otZuhE?=
 =?us-ascii?Q?3gnT5tevYgfAFUu6iCuW0bo0dLkAtnuPu8y6EuP3mLIUJn9oYV5+x2sifFJl?=
 =?us-ascii?Q?NrMgRljHkm4DZGcrWoUAgOuR4Q5UXtvCbsmBL/6UOAiW4yOe4UmRv2SE5FsI?=
 =?us-ascii?Q?TZ9qvCOiLSOiofcrDlzafWKXRAkFkw6JE/9CGOCRTyYK5wV5XiDtNU45p3yh?=
 =?us-ascii?Q?jB7g6y/2Y2SCmA2Hllc1LMXkpUpM8ErjRNIZgrQjRdYTpqJrFfXx70rlKkf3?=
 =?us-ascii?Q?ypVOwXPRBWtbwWvKerST5V1MhNKdBqqwZUWy2BVfWYofXH2hLe0d6HBhnyaX?=
 =?us-ascii?Q?W/nK4JTCX+Xrn+PqVkes3FPCh6ut3fRRoXRo+YKt1PUAgiIlJvid3ucV/bXc?=
 =?us-ascii?Q?suRCy967HYZ4gkVos3FfAIHGFTBMsn/nDVcl1G0UU1rdDXMWhEVX1PT8xuV5?=
 =?us-ascii?Q?eqMmMCzRoQSbal4uSc0z+JnmSIvIdkE573XRpXzH6bk9Ib2etneUMQ5ip12R?=
 =?us-ascii?Q?OKSixy6BaewBk5ZJ8hY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f648cc-2c11-4f96-01a9-08de2c2899b2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:43:22.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIIbB0eEQsldQvELIxQXNQU4Q7XbV/Uysl1svma2Y4MYjgyrrTJHF86TXgu6fQ11
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_054330_787586_1565636E 
X-CRM114-Status: GOOD (  14.76  )
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

On Mon, Nov 24, 2025 at 08:14:39PM -0800, Nicolin Chen wrote:
> On Mon, Nov 24, 2025 at 09:42:31PM +0000, Will Deacon wrote:
> > On Sat, Nov 08, 2025 at 12:08:04AM -0800, Nicolin Chen wrote:
> > > +VISIBLE_IF_KUNIT
> > > +struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
> > > +					  struct arm_smmu_invs *to_merge)
> > > +{
> > > +	struct arm_smmu_invs *new_invs;
> > > +	struct arm_smmu_inv *new;
> > > +	size_t num_trashes = 0;
> > > +	size_t num_adds = 0;
> > > +	size_t i, j;
> > > +
> > > +	for (i = j = 0; i < invs->num_invs || j < to_merge->num_invs;) {
> > 
> > Maybe worth having a simple iterator macro for this?
> 
> I added two macros:
> 
> +#define arm_smmu_invs_for_each_inv(invs, idx, inv)              \
> +	for (idx = 0, inv = &invs->inv[0]; idx < invs->num_invs; \
> +	     inv = &invs->inv[++idx])
> +#define arm_smmu_invs_for_each_idx_dual(invs1, idx1, invs2, idx2) \
> +	for (idx1 = idx2 = 0; idx1 < invs1->num_invs || idx2 < invs2->num_invs;)

I think pull more stuff in. Something like this:

static inline struct arm_smmu_inv *
arm_smmu_invs_iter_next(struct arm_smmu_invs *invs, size_t next,
			size_t *idx)
{
	while (true) {
		if (next >= invs->num_invs) {
			*idx = next;
			return NULL;
		}
		if (!refcount_read(&invs->inv[next].users)) {
			next++;
			continue;
		}
		*idx = next;
		return &invs->inv[next];
	}
}

static int arm_smmu_inv_cmp(const struct arm_smmu_inv *l,
			    const struct arm_smmu_inv *r)
{
	if (l->smmu != r->smmu)
		return cmp_int((uintptr_t)l->smmu, (uintptr_t)r->smmu);
	if (l->type != r->type)
		return cmp_int(l->type, r->type);
	return cmp_int(l->id, r->id);
}

static inline int arm_smmu_invs_iter_next_cmp(struct arm_smmu_invs *invs_lhs,
					      size_t next_lhs, size_t *idx_lhs,
					      struct arm_smmu_invs *invs_rhs,
					      size_t next_rhs, size_t *idx_rhs)
{
	struct arm_smmu_inv *cur_lhs =
		arm_smmu_invs_iter_next(invs_lhs, 0, idx_lhs);

	/*
	 * Compare of two sorted arrays items. If one side is past the end of
	 * the array, return the other side to let it run out the iteration.
	 */
	if (!cur_lhs)
		return -1;
	if (next_rhs >= invs_rhs->num_invs)
		return 1;
	return arm_smmu_inv_cmp(cur_lhs, &invs_rhs->inv[next_rhs]);
}

/*
 * Iterates over all non-trash entries in invs. idx is a stack variable
 * to store the index, cur is a stack variable of 'struct arm_smmu_inv *'
 */
#define arm_smmu_invs_for_each_inv(invs, idx, cur)              \
	for (cur = arm_smmu_invs_iter_next(invs, 0, &(idx)); cur; \
	     cur = arm_smmu_invs_iter_next(invs, idx + 1, &(idx)))

/*
 * Iterate over two sorted arrays computing a merge sort
 */
#define arm_smmu_invs_for_each_merge(invs_lhs, idx_lhs, invs_rhs, idx_rhs, \
				     cmp)                                  \
	for (cmp = arm_smmu_invs_iter_next_cmp(invs_lhs, 0, &(idx_lhs),    \
					       invs_rhs, 0, &(idx_rhs));   \
	     idx_lhs < invs_lhs->num_invs || idx_rhs < invs_rhs->num_invs; \
	     cmp = arm_smmu_invs_iter_next_cmp(                            \
		     invs_lhs, idx_lhs + (cmp <= 0 ? 1 : 0), &(idx_lhs),   \
		     invs_rhs, idx_rhs + (cmp >= 0 ? 1 : 0), &(idx_rhs)))



And then change the loops computing num_trash to work directly on actual things ignoring trash:

	arm_smmu_invs_for_each_merge(invs, i, to_merge, j, cmp)
		new_size++;
	new_invs = arm_smmu_invs_alloc(new_size);


Name should probably be for_each_.... though

Jason


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0M9HuTy2P3aZrCCJmDkMZddp9pW+X5vt6OTbXb8Q5Js=; b=OsEk7YMgH5YqtPteFMYyLqDMas
	tKWnE0M4klx0xCDoicxgbvefkLAZCFm0IhQjZrNjcuhRJFVGZLZi0dgVsvKbFBkGiFsESyY9TQkTZ
	WnmzsMA432IfivY54McHfQ03xYretBgqfpKQpyRitQwypwdqUMtPlo2kVD/E1GFPjPYt3BNHAJmZk
	6OP8lmyjv8qblb/pg3Uisb8SqyxRPPRz5tva8Pdnv2Yx89hCacN/JWX5cTbFc6pyEZCJrSNDRKNeO
	5rcpo2D1zI0bbl3bZid8icmBV08vc60b4S+1OlePQiwb4lADcmY0y8MMsZgCLInWBIfJ/RMft4/WR
	QpOcX4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCE2-000000055Be-1SOU;
	Fri, 10 Jul 2026 14:29:10 +0000
Received: from mail-eastusazon11012045.outbound.protection.outlook.com ([52.101.53.45] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCE0-000000055BK-10Wy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZz4Erdf8O0lmlcx/u39tXEF6GC9zmwHYb56QfUWI9FrrNgixmowVMAI4MPUEfqs7+vGKdse6kNbDAWTCXp+EFBOpdUW+w3Y3T5ZKufmFK/jukk8JHlIBkwW7cMu1dQrffp2j2GfhmNDw/TCtIwl+S9CXVuCdcPZO6ZR5muwzBVIkPep3Dz5yWOpQrEJCKTTy9mBPXuCCeW7nN9aP1CPPfASDbx3gAwuflgfjvXAznZVW1/neKn/zTHL/TkH0hBYsyzI9WBSqypgVowKaPw0qXyqNqvaXYyK2VLL6nrs2pshMwCCaqjcTG0O3GBVfba3Xx5wVNqCZ2mSwReP9GeFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M9HuTy2P3aZrCCJmDkMZddp9pW+X5vt6OTbXb8Q5Js=;
 b=LoecTNyePolR8RNXavcXRv4gO4gBleJRWHnWGeaPBkfE4/vznIYHHW3+dHulDrY/W0Z6bnf0THIg18PlxxiegBke2099V3VbJ24LidifCDokecsQm/h/d5T6akrSH+KsIRm47CqxrEdDWUfDYE5nsTYBBkmXoZ9sxjxXRRYNTQUGGgtSlMXFyV8yNRq/2rIFPBBk28RlmrQE6gxz5FKL7gk2dfFj4Pm/5kJA2GfLnV6Gvdx+q+fIHyqKjTfxQmq74mwxioi14w9kqDiP9zD7wiERu/HKh8dte9+KIHMfxVjddosUOaECak0KZrBpQV8gx8VBelfVFcXBQ0DutuYHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M9HuTy2P3aZrCCJmDkMZddp9pW+X5vt6OTbXb8Q5Js=;
 b=pLGUEOD3RWgw8T0j9kPgOXN7/KPBstz+UwKaOlfLs6/U4ssw+UMsB7UmOI6MP54tYvcB/UbczlXzaOcbLdTNvO8WFqEJGNBNUlMhXa+iiLekcjzUYx2aOckKE+yUFK+htD+SPCNG/cktTZVoDNChyTOj8KA8KXXw5ad5ingaHunsg/EpIOb7/ji7CxXpE00LqJPXJN9HoYsDMcR3WV8f4kWMPVK1vEsJLBNBUpoWnlEkNBtX/kMAKkK+LKi4rtPtQ/JRhnqv/xSuOAFPUAFGP1nH4Av+oUwOmlMq4poUkZaOHKcABM+r4tBjAhZqPSK65rAqPz/iPLuetWSWpwsqSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 14:29:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 14:29:00 +0000
Date: Fri, 10 Jul 2026 11:28:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 2/8] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
Message-ID: <20260710142859.GA1636147@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <CAE2F3rCh8U-gULjvS_8xsVo7YWN0=K2d8DC0eHwDOfgwB7bvCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rCh8U-gULjvS_8xsVo7YWN0=K2d8DC0eHwDOfgwB7bvCA@mail.gmail.com>
X-ClientProxiedBy: BLAPR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:208:329::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a88dd6-2c90-4434-4312-08dede8f9578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: A1XqMPtL+xkoKpf+HogQJOYGkE1cTcnmc8MwSWqPyAGFfMNJ1av9U7m5wnF3fXDUuFpDBzkPl7Od1bgN/q90XvMAHm8U5EVuyKGvrOO6vX5b5AYEXZP4iDavwOVYnJfyz4r62HAXK+xTBmPCg9Bx6uoYWP5GlREVZLPI3yYSsa2YxtKrC6q+FavXF7BPH5VX+6b6UaFj4bfuqkNFRD7PDv9RcYEnGZEllB+wFGinA8MkoWM1DIk+uaxLfDeCwUguu/BvG36J5eu26092TQZnYeM+Tc0wbZIBk53G9CUvpEnV2PK6tdniEi01Dc3Xj8W5H8RpXohy1fbJ/RzL45p25qP1sacwK4l+0JsVOFvmouXzksB8kLot5XkSPzuiPzkeowVFtJrvw4tkJWXgtGe6MPEfh+qOWS4J1ewDVk0FP9SyAPHRKfUZVXEIIl4EzXir+d+uqrTL8L2z/6hoMVA1+XM0d57v0wggdlssjJyAPknpb8DsQr2xcriXTa7lPbA/5sDeKoykOuVZSw5qIt6eQd9iGvNyD6KbwTS9MEFsFSNL7Xnk3QWET1VAJdyZRNyQrw0ZLZddADDv2CPogzBByUboYzZyxn414nGPIw/N1TB+kD0QlQQ1R2mO7/bLhTBEURzhBmxduChwl/vuJ6GBh1pwkPw6rp1+r+3uR2Cihwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JpVmtlbVhzYXk0c1pmbVdHTHRFY2xHa1dvSkpsV09OVHd3VUlzZ0daeUVS?=
 =?utf-8?B?UlkwR1B1Mmp3NDNINHpJTS9SMEpLQVMvZDVnL1dlVTkwell0UVZGOUgvV290?=
 =?utf-8?B?OUZveGVnRVEwelU3dEdjbEhPRnR3UlZBTW5pMUp2WEJSd253VVdpbTFyUTdp?=
 =?utf-8?B?aXc3Qm4zQmJRRmt6TUtzandialFVeWtTQ0EreVNiSCtnaDVtZ0FPUWNjbVdl?=
 =?utf-8?B?b0Jtc3B6REZqR1pJd1FWbGh5SGFDSGU1aG1lODFTWFJQb0VxQTd3SGJ1K0Vj?=
 =?utf-8?B?alpFNWsxaFdIeWlCcDFNNDh5bE0zWmJOenEvaTlTbGwzZmxTMkdHMDJaaUNB?=
 =?utf-8?B?TTBURUR1SXlWSU5sWUQvb2liTGRmZnF2WnJ4NU1vNzdURUJ0MllwY2lZZnNR?=
 =?utf-8?B?U25uUVBFYWVYTnlKaDltZ3lyZFlhUzFmTHhiU3RzZlRka01SZ24yN28yWnFr?=
 =?utf-8?B?bVhtNXhLODJlc1NJVXdRRkMvNHRKTUZUS2xFbC84d21LTzgvc1UrdnFOOWZX?=
 =?utf-8?B?TklEdndrb1FPUkorK1lFUGRFWnRVbWdSdFM0MlZUVW1ZY0lTeUxqbE5peDMy?=
 =?utf-8?B?ZmNIaVprdXdOTUM3KzNHZ3cvMDlwcC9vS3JuVTFNSEVPaFgxWC9oQjAzUk4w?=
 =?utf-8?B?QUlnNW81NGliRmpnV3BnNkI0OXNuZ1c0SHQ1RExteis4NmxxTStzSHNLRDJ0?=
 =?utf-8?B?bGthR0tQYlFxY3ZpN0dOSmllWGVUMThGQk81dzc4d0JWSnhzeXZJcUFIbFNj?=
 =?utf-8?B?QVF0Z1hybFJUZXpvWXM1Ylg4M3hSTU1XOEk0bGhHNjdGMU9RbE5iNUtoL0pu?=
 =?utf-8?B?M0NOdGZpdHdURG1qS2xNL2VIenN0a2FIN2ZsNGk0cVZkZ2gwclJ1TWJkN0hZ?=
 =?utf-8?B?MFFBTmpzNjJNQVpQVXRBakdIMm5scnRGejZiODdpV1VnaTVlTXVWV0VJaVVI?=
 =?utf-8?B?MkYzcCtBNEFnVkdTdlJZWkNYakM5QjRBbkJacEFmcUZ3bytiTmJqc0hRN3Qw?=
 =?utf-8?B?Y1RXSmVaejZDa2luSVVlbGRwdTJZbDFPd1VLWmdYa2treXlyMXZIa3E1T25L?=
 =?utf-8?B?Nlc5YlI3U2JzSmV4clpYVml2cnBhT3VQVWJRWndROW4zOVM1NHJMdWo2SThw?=
 =?utf-8?B?cjBYc1ZMQTRPL3ZHYkxsUXRkdjk3WHZ0S2pIMGRjV2c0S2E4d0lrbWZYLzhy?=
 =?utf-8?B?bUk5ZVpxakkvcWJEYU10OTloRjdFWjlhYlZCbWQ1TGg5QWZQRHNXaHBiclpj?=
 =?utf-8?B?WUNPQWlDSkpzMHY5K2llbFh5YVo0UDNmbDROL0gvbzQyK2k2N1ZFZ2ljWU5Y?=
 =?utf-8?B?MHVONFhxSjlPZW01eHVDUGtNb2drbHlueDBqLzZIVWhtaEtJbnlScUVLSG5F?=
 =?utf-8?B?cWY2MGFvZ0hzOGNmYkFOS3k2bUZkTDZBSE9RdnpqUUZmaU1WWG9hTjlxdFdo?=
 =?utf-8?B?SGxrV1JLQitXSVRKRldpT2IrREFkT3ZRWVg0aDFYSzMwMHVIQ21YbWphNEox?=
 =?utf-8?B?TXptb0ZoNFRFNmcyaWRMbFlCWEdsS25qeHZzeW9KQnNCOTZSV0RhN3JVa0di?=
 =?utf-8?B?aWZGRjZaN3Z2NDQ5Q1NSMDhPL1ZJYzA3aFNBclpDMzJpWmNiaEdFNS9CWjJm?=
 =?utf-8?B?Uk55RGUyZGxwQUU5clVzM3p2bm1ZblkzVHM1eXBIZFpGVllOUzUzNFRDVnd2?=
 =?utf-8?B?cFE3Y2R5K3c5Q2dTRDNVSDZ3dWJnVzNUbDFHSnc5MSt1M0lNOE1oR0gzQkxZ?=
 =?utf-8?B?WGVrRDYyYU5laHc5NmtwSTFGaFVLbUlDNVpNczdjTzRyOHZ4R2txaEpkVnFt?=
 =?utf-8?B?RnBSTWZRM213QTBMV1ZqRnY5L0VYc3pYeUtYTGhXcGFCdEl3ekhzRkdsLytD?=
 =?utf-8?B?MFFOaGhOSjZrUDhlV2xFOGkzaE4xVE8vQ3NjUFl6QytMVWpQdVBiVlY2RUtk?=
 =?utf-8?B?QzFOYWdmcmVtUDMxd0prcTZUelRuQ0d3RkVZcmtDQTRlcFZKZ3lYZUFCeHhL?=
 =?utf-8?B?cU5NeVZtdUpleDdMNDkrdUVYRFUzNjNpajNVRlY0dVc5NytnWEdPY3crTFha?=
 =?utf-8?B?ckFyNjhZUTZFNXpkZkZTSTI0ZEFLNDIvV3pqY2k1RWM4bEdoSW1WdTkrSDZN?=
 =?utf-8?B?T0tJUllHVnhxUkRRYmhpT1ExT2tidmdpeC9KTisxc2dOWUR2VVRndHlXM2J1?=
 =?utf-8?B?bEx3eWZRTlRKOWxGempqdFV1a1YrUTRBTmFjSW1QbHVHL0k4MHI3MDZzWmFW?=
 =?utf-8?B?UTlGYWd5S0JTU0xVcHY4VVVhTks2VmFDS2pqZWxsbyt6MU9sbjNyK2Z5ZXZh?=
 =?utf-8?Q?MdAZio9+0xT+dv1+Tk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a88dd6-2c90-4434-4312-08dede8f9578
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:29:00.4316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLcXPRwjrlfHq+jo5bhopwjcJh9ubEH/V/AMvNNaI7Gs8F/ZNvBvg5NjKstopnuB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_072908_283926_E6E171E8 
X-CRM114-Status: GOOD (  11.38  )
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

On Thu, Jul 09, 2026 at 09:06:18PM -0700, Daniel Mentz wrote:
> On Mon, Jul 6, 2026 at 9:29 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > pgsize is a constant property of the domain, it is the base translation
> > granule of the page table (4k, 16k, 64k) in log2.
> 
> > +       u8                              tgsz_lg2;
> 
> In struct pt_iommu_armv8_cfg, this is called granule_lg2sz. Should we
> align on a common name?

Yeah let's use tgsz_lg2 everywhere, it is what the SMMU spec uses for
this value in the RIL at least.

Jason


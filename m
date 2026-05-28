Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E78ECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgqd31FE0euoWXiTJe4alo9vLHl6A/ZPEIL4yB+v0Q8=; b=s2pRae5g46AVK2cENoIH6x+ftj
	T3eqPmlvhYMi653Zpu1ExWC63pQ6G4pZC9flUAk0m7hrwtebdNqrlBlqfNIsi1/2Y7gqbcpSR9J2L
	4h80TRpZHIanJV4AXWg7B9n9BYOxx68B9MLSU5nyhnh8uBm+H0+SmvQ+TrnVbKANF+exI381KgrxU
	gj1UJ7QJ1PExhamcmfPHzw1xuDhzfTM6qVfN2EdvQ4py3CeTW+izEYm0+p5Dizz8Gic+iBmlK21lb
	/yr3JwsGd4EdumbDpD/uV3YKxA+ux0CASe6LNIU9wrPD357msD6Zkop3SKQ83Y1//JNDmieNd+YMU
	OxgPrbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgyX-00000006JBa-1my0;
	Thu, 28 May 2026 20:05:05 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSgyV-00000006JB5-1Uqy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbxXu9jyeG8ka6ZJ7A3Ir0STb3L3sxJEBZyL0zqI4rXV+9GTAZQWMutMB8a/TQ4S1G0YzLIhvoMssFTnFULyzsVQLaP2fYjLtTfL69x2cmSFwFTOrcIKWNjSzujxjI8SEdEZG0K+rmtDlUBYG5bFhyPi7zWPyHFMVJefSLI37+F7wx7UUyWc42j1NWMg78dhuZTsew6wjgYxPoqKv1am0/XHebgIy2UxVTzOyQFeBUvWHxvmNCJOvqn44Jo29zGwcN/rC+EoNa/RzC76xjxnVazkq8Ynq/XaffNO+BUlU/6F3MPIV5PKiTXIgsjMy4dAQQw6aVdtu0vEpK77odXteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgqd31FE0euoWXiTJe4alo9vLHl6A/ZPEIL4yB+v0Q8=;
 b=zDpSh7Ilu4YKIm2uqaW90ah9Xwjtp/FDHlUW8T3hTnPdi8+54cAkEQ9Q9iarIKzw2fg+iQgyh8MnCZ+ikakpoLoSZ9qXlzBgveT5k21hvfyNP56Ba1GjUk58qx9taI3IcNPHKOE4v6Cp77AYmwxTAlkaMms3fkdl0jVnrf1sHhe6Y7weMvSgdqVyBDVk8P2vd0IsZVJOaAN3Kfv0BzN8QgrGpOfR230Pwi7gD/fWnONyajOg1aGLega6UCcIL5tdExUOlO5ahBWPv716MoO8s39VHcRfjHRMZdX3SjAaDDw4zBN9n2wZFXDOx6zCoJ3AYwUhRwmHod+IoKJT2oY3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgqd31FE0euoWXiTJe4alo9vLHl6A/ZPEIL4yB+v0Q8=;
 b=Xy3D0DhH6byJVAhw/v597RiZrvDey34VOCaKY+N+8BdHV5AWMSDAANeJqiEwxOx6MZYEK/tq+grvMYCIlBi+Dr1OEXbUJa2kttRe9TB6y8comQLa8xpGNzmBRvJYTfFIRGipHklifCRMzLP4LkjI35iZZi3c3vlmCI8RHV6Or6BS9iOuRKSWC9A9qPJVmDcpoW1d/CKcJXcJhIkdREHb6Bn619qoIxhM/FkTwHisp7DikCqm0/bSm7vjI44YoKxiFN9PmQ1tj8xSAm9WWX2DYutEnqVfPuPHJbnWG/dIZRYY6j4pmOP0SJ8qCb//leOP2Eezr/6NCx2+OE22TAA+DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB9458.namprd12.prod.outlook.com (2603:10b6:610:280::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 20:04:52 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 20:04:52 +0000
Date: Thu, 28 May 2026 17:04:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260528200450.GC3195266@nvidia.com>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
 <ahheOF8L0aGMttcI@google.com>
 <20260528152930.GA3195266@nvidia.com>
 <ahhuFw3ZJpy48xkH@google.com>
 <20260528180018.GB3195266@nvidia.com>
 <ahiGIUDG2uvA6usM@google.com>
 <ahiHc3y4wAxxtpLT@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahiHc3y4wAxxtpLT@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:408:f7::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9349b51c-3a6a-4518-7ce5-08debcf460fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: GXuwvTiE6ftewWcHIPWjbBOug2IIVlQTxXvmqorlxRfueTEXQa0U9p7/kBs/oH2bG5a/UP5p1E6KVzSxlz8aaTRF4DsMVsXl9VJD3YHBTa+EDkcZRuZRPd3SINWiBMQrhuaobnp7E3c+K6ywx6hzldgyDJZhqPSJ495l2QkwqtiigLDcLnj4/TyawNP62l4OhjGFI6egwN3+tCVU/6zS7uKlFZEnDcZzmTMzIH+jFcg+cjdP0ijIDZRrXfTzBrRv/rre4BL4sg+ggOnF1j/kvQBR9ybf+PNubz217+skBbbOor/RrbPyV6HRUi5nZH+e+6llZvcAaeuJjwYn+ZADgkVS+T3quIG9uAWyH1j/P0qDE4HmBQzaVbMLwhi5KBDWE+16gFk8ddxcc37eWB1+c3xBQwJBLH5JMdGHPKxKWZJasDlywEkXdDZJIbP3ejrL+xiUgoC+bWNx5tPUr1KAV4EFf01a7jZtOKQn7SrfnQOoJotsQqtjhz+BExw1B57ZAg/shMVjc60rNjkm+y2AP4Xm/RnFX0SOCUanu8UiI9f1WTCzGU65cKlDqSNE9Oa4H2vqXanAWEqPOHY2uZoutLXt+kxkwVkaUjS+bqU15c9ckWrAjfM8vUCDkkUvZtCS/Oe8tGBFXFE25NE7KzsyO/XJrT9CMTuutbc1sIiCG4tZUKODZ6MicA2V++O+8DD7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?viMRjOqGsFn/tV6JmUXvPj8HoK8ivK3lyyfJD1y5tpU4IRjWvHVcK5GmVanL?=
 =?us-ascii?Q?FEymqSVGxUWmZjDtUrCEYolXjFdMblWrzLLibglIhLrwRLrM0ksUclJgoDc8?=
 =?us-ascii?Q?ixwA3uMQqVGdz7oEhqhbRq8POA/iHfRY+sHqsEuMM2MdMJvntowLj3kM303B?=
 =?us-ascii?Q?jBW+lQVsw1tCJu/lWv3tQVzZECjA+ilt4iKrtlnDpb6XIoVt55sa5LCTh0Lm?=
 =?us-ascii?Q?gMon037g9qOPGa3iI7lFAkzYt2mpkq0q1r1l3A74CEnJqE5TxSmoFznejxDF?=
 =?us-ascii?Q?nQDKPKAHkDU/WHOiAqqlhwoeHzNZ14+CySAZsrfrth0xiD11V4pLLhQnQ/jn?=
 =?us-ascii?Q?SQjCT7LCbI2mx9s7iX6YNfIuw1ImelBUKzz73E6qkIfqd4arUl2NsVCUufLF?=
 =?us-ascii?Q?Q8Rw1gzeL+gZxqWDzXzAmTaf+bohJ2Xo/ZrEFbI5SAQgIhazwnjvuu7wg0eP?=
 =?us-ascii?Q?ERYmKuD/ct3MDYYWOZYlUtuJMiExqD2eE+lTBc5G4aifND4pDw8i9jRQyp+F?=
 =?us-ascii?Q?sh8xpPTQ3IhLX8o0lGheSQTW/7tJy12ibYffnMp1ME17rgH6HCjCGmOMAGId?=
 =?us-ascii?Q?k1NSwQ2XK7MwtuwD7nN9FEW2n8ZT/37b0Zo9sxk0b7M5QnrgkpO77+2X5imU?=
 =?us-ascii?Q?ybYSFJ10BVWMav7lzpMJYEVmTBufL9FuP6/0Xhyhd7oS/C3/trCaTgAsa19Z?=
 =?us-ascii?Q?xtS5fGl4uo0Uj5o+DMWbiYIRuhwoY3U2j2cfm1CHlmIRR3bMMclXg8T9oWuD?=
 =?us-ascii?Q?y1qZ/kgB6LMAcRV+SrfaP0CPNVbcrwWRKckUUqehAwnx7IYr4125wKA6fFOi?=
 =?us-ascii?Q?LxQfam/bHPNFgKpzOuO18CqwDNxRG6+gnGOAUsppcSqdAci74/Z0eIpAw4tv?=
 =?us-ascii?Q?50p7elRqBNCYmFfhQu2sUV8OxmODXadODi9LtQJuzezz4LLiedlrK0dxkQ8n?=
 =?us-ascii?Q?JC2ODWRAVo7wmbuA5aauKnb84UkjbX1KXGBgrAoLGBXU7eYQFDb5u/EijYf1?=
 =?us-ascii?Q?yNLW+E9zGkvBcKYxjS108cd9LFRP6S/XWfw1tdp1fB6Pyhjl9kX9WJ8m3HEz?=
 =?us-ascii?Q?IwBw1ZyrO7aI2rIofWylNidxOI7CiM3Xsrj+ShtutHFNdY4CNaRw4QOkGKiO?=
 =?us-ascii?Q?m5Bp5k++S+gGJ5YzQxdzXvDUNTpjCM1ZH1tkFzrsS9IzlYPmJdiaQaNmkrk6?=
 =?us-ascii?Q?F4hBvmYnN5kDbe5m/Rq5SGq3w/PC/R7VEnfo+C2yNcLcjUnGx/AzX72sc51m?=
 =?us-ascii?Q?IjfVdl0Wt2xyBLiZLtgT9PHFlO+ATeJ9eUuXPQUnvs+WaECPMzab56Q7nwMw?=
 =?us-ascii?Q?UoAm73Zju9KlahNYmkHIOIjVgZGHnM1kpX6OxnbIs4K25yab5x+xjrM8xESg?=
 =?us-ascii?Q?R2VX+BdKIMfv+6MgjndRdY8DGUY6SvGs5mBzVRzAClICNlVQfMSc4ExkiKMd?=
 =?us-ascii?Q?bL1K0vuhRebQJDsTXg6Oy59l5J7eHfTOmhbv0stzis6jLxURl8m49ars1nBH?=
 =?us-ascii?Q?khZHWgEofyqo0yPAkXAXPzSF/ihdutwb54Z75vdjZVr5jcVFXlBSg5TH/2FB?=
 =?us-ascii?Q?7/0ti4Zr0rg9rtuPY3MRxaLed3TDlo2KoHZNNcFOdcG7XE2QFfk7xlSs7mB0?=
 =?us-ascii?Q?8e298Meyt4CTFOosOSOn966ehSipQLHNPoGGhRBtRvWmmyTmh9roYn75eBrd?=
 =?us-ascii?Q?dpiIr6NPnlk3Es6BGeKakhQne+3qQkydfi5HQtFTQtnpzu4W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9349b51c-3a6a-4518-7ce5-08debcf460fe
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 20:04:51.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPVpTG5BVNSSjxxpG2gygdjwTsX4UAhDhq3wOUq881d6rcE4jGbUYkfw1jhrdDNl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_130503_428622_B8F34967 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, May 28, 2026 at 11:20:35AM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 06:14:57PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 03:00:18PM -0300, Jason Gunthorpe wrote:
> > > On Thu, May 28, 2026 at 04:32:23PM +0000, Pranjal Shrivastava wrote:
> > > > On Thu, May 28, 2026 at 12:29:30PM -0300, Jason Gunthorpe wrote:
> > > > > On Thu, May 28, 2026 at 03:24:40PM +0000, Pranjal Shrivastava wrote:
> > > > > 
> > > > > > > +	master->ats_always_on = true;
> > > > > > > +
> > > > > > > +	return arm_smmu_alloc_cd_tables(master);
> > > > > > 
> > > > > > Nit: I'm not sure if I'm getting this right, are we saying we *need* to
> > > > > > allocate CDs for CXL.cache cases in the probe itself because STE.EATS
> > > > > > requires Config=Translate with S1DSS in bypass?
> > > > > 
> > > > > Yeah, basically.
> > > > > 
> > > > > Effectively the ARM rules for enabling ATS and Bypass together require
> > > > > a valid CD table pointer.
> > > > 
> > > > Ack. But do we expect transactions before attach_dev? What'd happen if
> > > > we don't allocate CDs here?
> > > 
> > > It can be done at any point before a non-abort STE is formed.
> > > 
> > > The core code pretty much does this immediately after probe so there
> > > isn't much point in moving it later.
> > > 
> > 
> > Right.. that's what I'm not understanding clearly, if the STE is Abort
> > anyway during probe, why are we breaking the alloc-at-attach convention? 
> > Usually, we allocate CD tables in the first attach_dev call. Why does
> > that not work here?
> 
> It would work in attach_dev(). I just felt cleaner to have it in
> probe(), paired with arm_smmu_free_cd_tables() in the release().

I thought it was like this because we don't have an alloc on attach
flow for the identity domain, so add it there or add it here..

Jason


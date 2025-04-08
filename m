Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB87C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h03ZALcD6byrHyhB6sWN9Sq6l5qLe/bwLcXBCKIJc2M=; b=oukNc7Kjc9Hjibtq/4dCxWWgr5
	rJvKIAUf2IEII/uOpZIyAHPHk/KjRmn0pCgpBtxhJPk2/WJ+p/zUuwCDoh1p3gjwxX3kUtMUrv/Rm
	HBIgwXquoWZy/GYZ/XMwWe1bG9M3lgtSPj4uKPnTGVwENk2arLhyvQWl8rGWSJ3YSwtiYR7KTOXSb
	mOTXZT5KzVo3rdPmJRH75FnH5DdT6gwxtwZ64zvE4AsVM0vzEHnFCcLbQ3Qe6Wg7KsltBx+Kx4sM5
	rip5NvvwyVRCj0ja6YY227TDJChQ6D1dUdVLctQ4gh/gBL+NBxn5n1oBG1J2TvkEM4PpLof/cm6lL
	BJW89/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2D8w-000000051n5-0fmg;
	Tue, 08 Apr 2025 17:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CgN-00000004y4L-3Wj1;
	Tue, 08 Apr 2025 17:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=h03ZALcD6byrHyhB6sWN9Sq6l5qLe/bwLcXBCKIJc2M=; b=Irx/8eA6ICaEj2WWnH6esl4LHI
	J5uiQ7XsJqevEr0ibGBelrZQaH+bXPTugqr9K1A3TzyY9xPPnJ5DfrPOzZ8NP8GzC2BKo2zioId3+
	b28PLsost4Gjehb1bQow/9B7HvVxWnN6BkSj5QCn8iOmk6P86U3YZRsX07tlf1xnOInH+75mVJ3TD
	KQIBISgfrRAA7vdpxRRNlQ8TMEdpM5RicUN1+wMXyliWtpZgYPndmnrGsp6EkRtuQe0JAII+qs65P
	7j2TjqwFV4HtU6KvnA/5Oz1XcQ+oQV88MKK5dawvYQs+w4uyTMdhrHjFO64G9BIVF2FagY8SywNTQ
	hWFWLdRQ==;
Received: from mail-dm6nam10on20625.outbound.protection.outlook.com ([2a01:111:f403:2413::625] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CgK-00000008M6u-3geT;
	Tue, 08 Apr 2025 17:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq25vQFAdP+TbHPSZMfr811FE5sFpyScSvpUnDxOZv6x8ElPLKhVVSC5hlnfD99+sVPBPE7LR+PXLsZCt7oCeF3NByC3Q5kT/9i/6IizTgdr/kE4Rut+orXRE4BpQ6QTbFm6ZIazjag+uaDSXjYAPu0T/H8CV5ZM/9BJ0Yq5cLmIKytTUdehptalAlhEb2g0tYyv84umt7KbmqgTRz11Rp1VjUUPnjDMorGOxNr9ItcIrVKiCgUbkz73NFFaK95E3Kn2ShU5AKBiwFLa1aVqZGLZPLHbnJw3nkAHv8Wgpx1Lyjh3RHQSTsO7wgi+RDFrVlHf1qTMW3ykcIP8ufH66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h03ZALcD6byrHyhB6sWN9Sq6l5qLe/bwLcXBCKIJc2M=;
 b=l/KQMvMmqQv+/fE/tpe6Bosb/RXWGlf/FqUOZ72gvfqJX/sRL1FbK2uVy8uK4obi34+czcD2ydMoABoKir0EyYmwTmHIpAGdbe9SWOLIpI4jGf7A4zjmHhY1yNS+N7zS53QPkEQBv461f27y676iRGh+3iG14ZdXf+IGxnI5Ispp3T5jctIvJiyjqOaN9ikfDPWZz/Dt1TCcjD2bn2Hkgg2mX4rrCH6NGteDrkQyS8vvg7Exc/sAAbb5WN1aoW7lsN46rth5NOb7HZApKOTV+u96o+eofz/Flj3xUdElzo9zX2hWS7sjLFn7fNxGc4venS95K25HVC+ga7Ce5bWYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h03ZALcD6byrHyhB6sWN9Sq6l5qLe/bwLcXBCKIJc2M=;
 b=MH8kE31f76SbytPxcjH4VGmf5sUn7gl0zpKzfM6VPcwsD9OOyzerYYzlYp9/hT22q1t4If96Ew2qIgNKof6lO5ZwnU1MZYPIST8bdLURHdd/Oj8KqWWokpLX2TLiAyhGv0hKPxdXi/VeLTxn8II6D+dlCpjJ9feCQaYbG7AaNzQdvUrfwXHv8RGOcGuszcIXkdeOfAhK4CLFjWOKOg2bQghQdfgurgQzP8gR00R6jis4YKn4+Ga6seSL9B1X7u1eUitWloPcziwoKLeudPNgjshWF8ggEzwLtdrE4UhqVLmV7HyyRROLfC3sUUeA6WkOqMyn2d6vhxGnX/GYSm94ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 17:24:06 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 17:24:06 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neal Gompa <neal@gompa.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 00/23] iommu: Further abstract iommu-pages
Date: Tue,  8 Apr 2025 13:53:48 -0300
Message-ID: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:f) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 91446676-3d7f-4310-21c6-08dd76c22a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+QPlETBFnDeL4po8YWHgmWQWO3kQV9UUiA1oP/jJNhHr36nJ9mHCiCz8bgM3?=
 =?us-ascii?Q?1ZM+8+UAcdhwC2ZH3y9sUjgPMt8R+vk5jBsjaeJfh4jUnAvsAG8RJ7IbIgGl?=
 =?us-ascii?Q?c/6zEbuPMpuQRpIGb0QLWJBnIGFA+W9EkazTlNfd1VwYnkJ9586mR8Kk+bKD?=
 =?us-ascii?Q?D2mI63maiat+0P6islpSm4OKvtRhlJog/Se11NCTH3lWeaea1ZIudG4mzWbi?=
 =?us-ascii?Q?DyNb4Xj4qgfPLoh4anqYp7r8SdN9Q1PGA+dMM00lzxGNrUHLEbAkeUJW6ULp?=
 =?us-ascii?Q?KwAHKU7o0nhu2lQhv0KmlXbbGDxl6t70nOzST7s8/etnc0zSxAqXSSiS4bn0?=
 =?us-ascii?Q?eJuT+kY3NZtnPkcGnsq2Wx7Q/8s0Qdj/tktjpfudQHtrk4tSwPMjy83Uz7kK?=
 =?us-ascii?Q?AyDgLYng5LMjkwOgyudw/WIN9p1ynXMF4P1w/gxbXnFcF7Bzbkl4VopV1MDG?=
 =?us-ascii?Q?U9hqQef6YqNcihNIAXbf6J+N6krEkmcFAFeF7tyaH7iOWaDfffSp7HRHL7jm?=
 =?us-ascii?Q?oYOwTQsToewc/hvsV0K+HJMQeNsS/5e5dmsGAmbi12T+lkJrwUMDtHz62MLD?=
 =?us-ascii?Q?35I5mdkqMAeZ0EhrHpsNcgLdqY0FVgrHJ6nRd9j1vJSfeVUjDi4rpD9FwYNu?=
 =?us-ascii?Q?3jO8t5dLDV3CDJFqz1T9jC8h2zN68N7QZVtmdy/Ha5tpCFMFMseGxlL2HlJY?=
 =?us-ascii?Q?XSEYhAqZjwgPa2K896DdBWjuq8ZPqGRuIYC2hd5xt6UoJSeGIp1ifOB+32mq?=
 =?us-ascii?Q?Jv0xKr/AuhgmAuaSANfoyzrUKrh0zM5vRMICHSX/RYElvnA+rFatZ7Mg1O4g?=
 =?us-ascii?Q?+5B970apa4sU1hYZqyjHHOzJRPHuWs3XHuxyGAKzm/4sIqa7JSaDaD3oN0VU?=
 =?us-ascii?Q?pYD7E0xZ4AndUYmFFa3tEdGGPsYTI2JL/gIB4Qxekm6ofNJCvbTk2vseIZRm?=
 =?us-ascii?Q?9yqk9CylaEbyPMHVxYB9ATyde1Iw70mJcEMQXekPnuEDlfR/tCrDvDx0+kW0?=
 =?us-ascii?Q?GtUYFtP2YJ/0yqbKJYkBlBJ1wWHGf4rqA16dgHrxYh3eWnOUGmWtRWW0NUSn?=
 =?us-ascii?Q?bYSW0pLg07Ub9EP/CbzvB1LIdKF4R4Rn+wpXd097x+lh5OZfTgh90xMuYG01?=
 =?us-ascii?Q?tfBj/WSYpESaPpb93Gkjaxomwd5RFoAo1iHfRJFLGvJbnuTZ77vdIyOTwuID?=
 =?us-ascii?Q?No/qRLRCAPosLYnpRo2AzjfMMpfCdFUKVgV4lguj/uHE1il5VAXobSQbMnBC?=
 =?us-ascii?Q?aqrjlHX3eiIYv9rwkgGI5crOm3s2a6qhl/D7zlabboen/CYCncFvsWbyfAlC?=
 =?us-ascii?Q?Bi3wRur5biOAKvH06R5ShVJPihlgkvpLVgSKdi6GItnu10hCP79Vkl+Q6P23?=
 =?us-ascii?Q?f+ZRiYnGqhX7eGGN8tC/LWjqs5FLKd+uDfvudtmbKq5zgSyk5vOZDnTILAQC?=
 =?us-ascii?Q?uw/f+6D+N6IooVlFtaBLSg9gQzTLfRtTnGDJ1CwT3o3h2MJkNaH/4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ym4MyodlP5MzmJRLuzkD1cpn9uvuo++qQ44vW+mHSJeahmEukWCjp3gbPGUM?=
 =?us-ascii?Q?HdlaJ2in6fwOhN1oJeFgH0sPG5cY8jNep8/XF5w6ybREFKJiubIW7PqmeiKk?=
 =?us-ascii?Q?4jzzeuo9XLnsLlHdmqZhRB9ismAMe6n6j59ZLY9iI8u3HdQ2I2w8tWuApEBB?=
 =?us-ascii?Q?yYX/CIyI95nUtW634GrLbVD41ER26cmiT2791g/sQo0PSbcttwxxzPKnvzqB?=
 =?us-ascii?Q?yKaUYxz/UkmngUbkwSwWyY64Vrq6lL3HQSOMcKBJFxpCEXLAINTCKzuJKDW9?=
 =?us-ascii?Q?Xd10CFasq+x8ovmaC3xupnviJm2e6Atdy+4P/LWlYQEy1udPRpeU03TuMsWT?=
 =?us-ascii?Q?xRIDNl8+T26bjPQ0VU9ORmVhoKPYyl3WR54fUf/lGumfpLPkxxG7mnsOHJQj?=
 =?us-ascii?Q?wQ6LIVjH1WVia9mU3mdUIaX0klSGVtzmHq4/1W6D5KclJXLJm3JU//0LCuFb?=
 =?us-ascii?Q?CrEUW/Si+Vx+W3Iw3nxiZ8CPeZZwivhgrgzVaqK4TV00Yl83C+oMj2OEauct?=
 =?us-ascii?Q?fPqK3nauwIMEhleiC5ZmS5h6eoMmZbytmtyYBegmTK00Jiqboyq917C8QbFS?=
 =?us-ascii?Q?byGRCD8yb+r5Roc/mrMjw3Rua+lP7NwYD3AyPPVutTNgZN5Cio3Bkh3aqFZ9?=
 =?us-ascii?Q?AgekhazGalMMDXgDE++CTsMDKIU05oKOR7fajITBb/M7LUPVC9ew9MS56qFP?=
 =?us-ascii?Q?FYv+X3zrbHANwOYqnDm34IwNAyOde4GuXHwdGAOgxBFtaKn5juU17B4Itbg+?=
 =?us-ascii?Q?/r6QZODI7UNLMcgiBjhzQAz5UXCAsPVYMRowTd9lnP+nUknQFxMx61u67GNs?=
 =?us-ascii?Q?F+hoWXll9Rlrh7IssdeHM19aW/tlsRhuKY9hgauS/ZiEnyJkuhzzit2hIECZ?=
 =?us-ascii?Q?rowzXDbK+3+Zyp/rbDmi1IPRVJk6lt3xaIer7AFfkia254P69rp2WY4g8zBZ?=
 =?us-ascii?Q?Nf4I6ZMXaVzCtr+WttDPUM8dQ6p1bL3/zaCvCWHqCEYAnFgjh7DwOvVdDTEW?=
 =?us-ascii?Q?+30sSQ1ugv2JrIQxC5ndAIlTDzUcEYSSQfpmM27N2M9tQtSsAF/bgXbrcXUe?=
 =?us-ascii?Q?zT1HBMFDLynVJpxRUUl0djtYpfpSV1imcfeOYGK9/IiE8GyO2C4lqNnRE9f6?=
 =?us-ascii?Q?0epT1cBOOJO+8VY4jTd8+rzbG7QlAkthDIYN+2zU0agGwwYoB1hbo3M5f2aO?=
 =?us-ascii?Q?asxEF/F6ckDe9+1XitBaPiW9M2HhOJS4RfEPFtI9GTFebuCEIWvRZJ9oNZR1?=
 =?us-ascii?Q?CRsSDmpnHvtysFDMA0g0Cmn/rOn5MQdpWqUuUeGtzlqaRFkkrxBR2o8ytiqx?=
 =?us-ascii?Q?/5DG9KBkiBC/jhs9f6vg0geuvhcwNiQRG9IWZ/cHEfXua0yukX0piCkTvL0u?=
 =?us-ascii?Q?9N2mxWMu/x6BO9vXp3w9OrjGq84PHXoSWL5IS1M7wk8mb+fGCgxGyrOpKn9l?=
 =?us-ascii?Q?uE+E2iI3uJYu/GEDoEUnlQVB7y/AbvtdwRqbdGCE/soTSbPsJ8P7jq65CJP4?=
 =?us-ascii?Q?qjioPgUT0motpj4TvfxYe25DuZsUsxy+WLxfbd7kAsRu4Jlax5jLpRhDzvvb?=
 =?us-ascii?Q?MyLCXHsJvRQdl7RLTLPGjCNzIE7zqYFHIm4LnaBg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91446676-3d7f-4310-21c6-08dd76c22a33
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:24:06.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuA6xQ9iA9w4U3LOb/ZnI3WP2giZHu+myu78J3AtE2GmA1CFy/a0pgx/U2mAaDI/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_182417_039098_268EEFBD 
X-CRM114-Status: GOOD (  18.24  )
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

This is part of the consolidated iommu page table work, it brings the
allocator I previously sketched to all drivers.

iommu-pages is a small abstraction for allocating page table pages that
iommu drivers use. It has a few properties that distinguish it from the
other allocators in the kernel:

 - Allocations are always power of two, and always physically aligned to
   their size
 - Allocations can be threaded on a list, in atomic contexts without
   memory allocations. The list is only used for freeing batch of pages
   (ie after IOTLB flush as the mm does)
 - Allocations are accounted for in the secondary page table counters
 - Allocations can sometimes be less than a full CPU page, 1/4 and 1/16 are
   some common sub page allocation sizes.
 - Allocations can sometimes be multiple CPU pages
 - In future I'd like atomic-safe RCU free of the page lists, as the mm does

Make the API tighter and leak fewer internal details to the
callers. Particularly this series aims to remove all struct page usage
related to iommu-pages memory from all drivers, this is things such as:

 struct page
 virt_to_page()
 page_to_virt()
 page_to_pfn()
 pfn_to_page()
 dma_map_page()
 page_address()
 page->lru

Once drivers no longer use struct page convert iommu-pages to folios and
use a private memory descriptor. This should help prepare iommu for
Matthew's memdesc project and clears the way to using more space in the
struct page for iommu-pages features in future.

Improve the API to work directly on sizes instead of order, the drivers
generally have HW specs and code paths that already have specific sizes.
Pass those sizes down into the allocator to remove some boiler plate
get_order() in drivers. This is cleanup to be ready for a possible sub
page allocator some day.

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_pages

v4:
 - Rebase to v6.15-rc1
 - Don't let ARM page table size fall below 64 bytes due to HW alignment
v3: https://patch.msgid.link/r/0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com
 - Fix comments
 - Rename __iommu_free_page() to __iommu_free_desc()
 - Retain the max IMR table size comment in vt-d
v2: https://patch.msgid.link/r/0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com
 - Use struct tegra_pd instead of u32 *
 - Use dma_unmap_single() instead of unmap_page in tegra
 - Fix Tegra SIZE_PT typo
 - Use iommu_free_pages() as the free function name instead of
   iommu_free_page()
 - Remove numa_node_id() and use the NUMA_NO_NODE path with numa_mem_id()
 - Make all the allocation APIs use size only, fully remove order and lg2
   versions
 - Round up the riscv queue size, use SZ_4K in riscv not PAGE_SIZE
 - Convert AMD to use kvalloc for CPU memory and fix the device table to
   round up to 4K
 - Use PAGE_ALIGN instead of get_order in AMD iommu_alloc_4k_pages()
v1: https://patch.msgid.link/r/0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com

Jason Gunthorpe (23):
  iommu/terga: Do not use struct page as the handle for as->pd memory
  iommu/tegra: Do not use struct page as the handle for pts
  iommu/pages: Remove __iommu_alloc_pages()/__iommu_free_pages()
  iommu/pages: Make iommu_put_pages_list() work with high order
    allocations
  iommu/pages: Remove the order argument to iommu_free_pages()
  iommu/pages: Remove iommu_free_page()
  iommu/pages: De-inline the substantial functions
  iommu/pages: Formalize the freelist API
  iommu/riscv: Convert to use struct iommu_pages_list
  iommu/amd: Convert to use struct iommu_pages_list
  iommu: Change iommu_iotlb_gather to use iommu_page_list
  iommu/pages: Remove iommu_put_pages_list_old and the _Generic
  iommu/pages: Move from struct page to struct ioptdesc and folio
  iommu/pages: Move the __GFP_HIGHMEM checks into the common code
  iommu/pages: Allow sub page sizes to be passed into the allocator
  iommu/amd: Change rlookup, irq_lookup, and alias to use kvalloc()
  iommu/amd: Use roundup_pow_two() instead of get_order()
  iommu/riscv: Update to use iommu_alloc_pages_node_lg2()
  iommu: Update various drivers to pass in lg2sz instead of order to
    iommu pages
  iommu/pages: Remove iommu_alloc_page/pages()
  iommu/pages: Remove iommu_alloc_page_node()
  iommu/amd: Use iommu_alloc_pages_node_sz() for the IRT
  iommu/vtd: Remove iommu_alloc_pages_node()

 drivers/iommu/Makefile              |   1 +
 drivers/iommu/amd/amd_iommu_types.h |   9 +-
 drivers/iommu/amd/init.c            |  91 +++++-------
 drivers/iommu/amd/io_pgtable.c      |  38 +++--
 drivers/iommu/amd/io_pgtable_v2.c   |  12 +-
 drivers/iommu/amd/iommu.c           |  16 +--
 drivers/iommu/amd/ppr.c             |   2 +-
 drivers/iommu/dma-iommu.c           |   9 +-
 drivers/iommu/exynos-iommu.c        |  12 +-
 drivers/iommu/intel/dmar.c          |  10 +-
 drivers/iommu/intel/iommu.c         |  49 ++++---
 drivers/iommu/intel/iommu.h         |   7 +-
 drivers/iommu/intel/irq_remapping.c |  12 +-
 drivers/iommu/intel/pasid.c         |  13 +-
 drivers/iommu/intel/pasid.h         |   1 -
 drivers/iommu/intel/prq.c           |   7 +-
 drivers/iommu/io-pgtable-arm.c      |  18 ++-
 drivers/iommu/io-pgtable-dart.c     |  23 +--
 drivers/iommu/iommu-pages.c         | 117 +++++++++++++++
 drivers/iommu/iommu-pages.h         | 211 +++++++++-------------------
 drivers/iommu/riscv/iommu.c         |  43 +++---
 drivers/iommu/rockchip-iommu.c      |  14 +-
 drivers/iommu/sun50i-iommu.c        |   6 +-
 drivers/iommu/tegra-smmu.c          | 111 ++++++++-------
 include/linux/iommu.h               |  16 ++-
 25 files changed, 438 insertions(+), 410 deletions(-)
 create mode 100644 drivers/iommu/iommu-pages.c


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0



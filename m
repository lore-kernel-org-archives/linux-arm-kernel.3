Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B32D1951A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yuFsJCtsAa4vLdb1ae+JrH0NWgUvMBVBs3YShrIEEw=; b=qKa3v1jBBs/SDpXA/D5nHSR52B
	8cQ8hdG3/L9tqhIAWd9CpM9ZwXJq8c7nNVe/jSm3fs7Tu0BjH7Vof443CfAOd4V7k1XGkBZVOMm8f
	sotWaSo+pt30J384A5heA9IpyVjNG/xZCbARdFj1dOUz+7Nqev6rf5XpRbYtsQ4fqf5YQLoNY29Y/
	fi1s+jPJlaerYtlksinB1YvNqSl248I3JIMdJZ3x/p8OwibTeY7gcHIdqU4OtmPy4933anAC+XOfs
	dUCPFJs/xeLldzIKIapfWZADUGX3EhQlIpTRs6bfNHXueDsxvkHSrJ40jsv80yZ11D+pINXCWWcRj
	Z9/ry3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTjv-0000000DF6m-1WAp;
	Mon, 26 Jan 2026 21:03:15 +0000
Received: from mail-westcentralusazon11013060.outbound.protection.outlook.com ([40.93.201.60] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTjs-0000000DF62-2Unm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 21:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4xcxISrwmbB6GqznAlXmblC3vgP8jcAM+kce3wsTu/pzNyBo4RAi0TWWWmW3ZIBB5CmA5ylcLoPb6SvE2bWqh5anMMAjQFeD48hzbzfIeaPNZt2/V5JCs04U/8uQxmHICIHGqeaVaXLTp/Lp67HigbSucumG6812qeIRzy0PZcyaNuctljrEl/5tBx/I4Y2EoilFhDPYqu1DbyZmqi1YBed1SHJWs3pNfDnMJmfgk3+xT4h8ruCAcxByuS+XKeD+L7U5I/VrXc0Al/nhDiimqk1yE7v9rapmM0Z+CewDglJF83daD3TqbF+dyBlFwOJOUri05X2N3avkgzJiNuFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yuFsJCtsAa4vLdb1ae+JrH0NWgUvMBVBs3YShrIEEw=;
 b=E9Wu23FfZVpKFmrJzf00ifSNQmTboOBYQsZZ5ozNfhrMoWliSbdepY0wSCs5i5kAeSBaPbHkTWX0ijg0hvcYbp90IdL5LaKicmirlBaA0gnRAdi4NtlYRcQ0/q4Wk0PmG8hDRJ+KGzqIWhIHPB3lFg/PwQSAGTwPhke5B1uVK19E3XPKFAKmNfYmZuHIrUyVKaMqqjF9ljlJ3T2ldkfzD1KosBtbTFLjB+s1WdFOw18tWXPZf8dkOtLg8FpofMOf7jNZShADZpP+Uzuy2u6VVjAcduSDgDIvFZjSx4CQT1pkAUF5Vw+1oCgbvZOhFsdTILgb8mPhvEsBiXcFvHamNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yuFsJCtsAa4vLdb1ae+JrH0NWgUvMBVBs3YShrIEEw=;
 b=TntCkALx4SviH6berDtx1ZpRPQ2fFG5rFcfAFIB/uNzh1sqzTZvqW7AiB0LgpeqzYmgtzOUC679pMEtesRa35B9fQOEI7LVNix0B6N5Y4vIfwWxMtp9KbGUE67ZuHNOmzOQNHoBkdtnQWGJDNr+igB2vgIoqytwyLfeDRtxovC3hnJJORP+ghKgDRE+tgUshnU7F2Zm1y/F03kH/8VSVk6EAkFTlGxKFo8/IKJZv49LviR/roMWwIkiWvlmUJ7gwOuxal15llJSCZ70wYpxzb1Nv3cinboAwdQjWkwDXwVGe1TzpLfOKrN3gZ3Iom0oehivL6Br+DUgNUnCLYJJeKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 21:03:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 21:03:02 +0000
Date: Mon, 26 Jan 2026 17:03:01 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 03/10] iommu/arm-smmu-v3: Look for existing iotlb tag
 in smmu_domain->invs
Message-ID: <20260126210301.GY1134360@nvidia.com>
References: <cover.1769044718.git.nicolinc@nvidia.com>
 <86118601583b0c98fef39d38ad08be232bf1d04f.1769044718.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86118601583b0c98fef39d38ad08be232bf1d04f.1769044718.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: ec42d9d2-6c6f-407f-0f77-08de5d1e4ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dXhXDtyQb00QoJ8GUR2pCZFxfGF7LgJvQ1ap8WXvB5Fkx3Mlt8r9g4ZQqiGt?=
 =?us-ascii?Q?iCkJ/le5hMxagwHZIaSBQAr2JkgV3DEIduZlu3EjNN7RLwYpYXC1naahO9AI?=
 =?us-ascii?Q?c76oyuhPEnSempPfIySOV6CsLBavEh6G/K6QiTkNqw7yCD7O0yGnLrctJKNt?=
 =?us-ascii?Q?z8hdSUMUEn11VtE8WmppuNmlCB7Iegrvkog54ABPbdnZZbuhzAOsEop9BoQG?=
 =?us-ascii?Q?NwqUPRkEpelbrB5OMMEAKYFamWCKVrBVG88VwSF4ewlojx6S6ZtqlRcvSX/O?=
 =?us-ascii?Q?uekZVQBO8+vLYTdGUd+4v0Ec2Ar0Q34/l96bKo3QkAgwDO07qibn7BXBLrHF?=
 =?us-ascii?Q?KoZiKJoArMVzOvumZm2NFI9fVgoDMEj0hYdY+mWBezOSXhcHRlLH/an9gMlB?=
 =?us-ascii?Q?G59hvHE4bmJ1cmEqfHU/7uokWXE6o31SWMAOfZwNJbTdYBRrG6uh6gbWazsT?=
 =?us-ascii?Q?Rn9Mv3gZ92+RIogcoqFtDepEqGJdE52F7yztjkxCtMXyx92TL6weiDoSH4sC?=
 =?us-ascii?Q?q4MKUPGyLWtGYz5hON8e2I3QHxhjwyrwycJOYNik/RFMc8A4WcUksWWbYNo3?=
 =?us-ascii?Q?rHFLb+tGXgEOr+8mlUgwAWAtVNyMPmXrP/MEt3hmnIPWXYYPwhSszzYyYbRZ?=
 =?us-ascii?Q?AR5LfKv2T/xNtSp6MVCFW2L3r04DHNxfm+mQ5j210xz42AGN2aEcHo9NVCjT?=
 =?us-ascii?Q?o6CmmuDGKtbQH0LtYfycNljbMwig/ZRVj7Tz9dDk7pzxUllgM0xDZBshARWL?=
 =?us-ascii?Q?cIf3aZ8vuLxmeOC2e36oQrhwH3aNf5OpD8YGtEfLoxGGFS71dzrKcQzWXErR?=
 =?us-ascii?Q?iA9ekRnMW/N7beEFN+kfGDoRESU4qWOwihzbPZsvU9xecbV2ZAterUwmIhfD?=
 =?us-ascii?Q?Q2icdjmIVImCQjvrlNsZuzTY1x2J9PwGK/afBifFB/EzCqFuyec+BzrmspHX?=
 =?us-ascii?Q?p25dQEiYQc1wZBJBkwdJw1c3rhkJy6/nmAqet0e4bs6U7awdjOIJd7APlNNm?=
 =?us-ascii?Q?dUn8mDAv0nwQXxZcz4Rc44e2GTv/vbNBZnk3NpxrZgiTbsJXP94ec54QGB5Y?=
 =?us-ascii?Q?4t4L8Mwm/tL1UOkQJ1ylGkxibM5A3ypGsNFnaA69FarG9QjxwJloQXujL77X?=
 =?us-ascii?Q?7at5GtPY7j8WZBbVCyfDkcWZ+uCrnzFLQzfA8PFKEuM3DK5rfUzuMuYjnJpR?=
 =?us-ascii?Q?ahAKn5m+H3c51Psi39hNe40kX4ucjqcQIZXFJP4IDNfPg4yc1P+Vkw8+DC8o?=
 =?us-ascii?Q?IZ9NGYmpEaYYgNwEtBzZTitO9iFok3+fBcayK5uywzuPdcjY2pAlhwM5dI1c?=
 =?us-ascii?Q?g95AWghNadA43zxIno5BamIGXYY7R2/QQINdj41vLoneKDMK+NE3Wo3MnfIn?=
 =?us-ascii?Q?64swj5l694DPIGzJSCy6QaIUofWmAA0ZBaJlMoyWWBTWaE3tR7pE3bxacEi1?=
 =?us-ascii?Q?HxL+1+X7TLRN2fIIUUqjr0H6NRkrZwVV48qdEBFjPxCJLcViBWqTgCIlbWa3?=
 =?us-ascii?Q?OGfijIHaEapubnnLSpWzy/BAuEKqBVAby4Yy+zEyYzPKrmfxU9E1n+1Q3AAT?=
 =?us-ascii?Q?FGiY8jonGJtEP2xOaOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peeDqAeKGsMta4UxEuPBwB3jzLYcNXTTP6TfO+zsMWYB5sTul1YYIVQDQxQg?=
 =?us-ascii?Q?8U+pjg9XvAe18q4cZnMYatVfAgwnK3M5EV/cvFUooe53C5kf8YX5LN2ReZGu?=
 =?us-ascii?Q?qw6157v5t5a8PrL/4no/36nB/8SBAm4EQ3URUAnTCeYCDRSXV1HQ17vWi3aU?=
 =?us-ascii?Q?uK+ZH2O6gbVmC8qFMG7zsxwj5v9qIra7IBAsIkSJ2q3/BfBLAv9ntZPfdNwP?=
 =?us-ascii?Q?LwHW1qwQ9lQgH7dMDyj6SnYoqYJ9MNmlJ9vw3MnjAYtpxZKNR6cFjYHzsiTD?=
 =?us-ascii?Q?NBZRHWJ5ZwQH65oKok+a1RapJgpxqN2sGt28Zpyd9r4fL1GwMEKuEJ4w/ydN?=
 =?us-ascii?Q?Ul9QXD2mkL6E8ArVxAb8GMOs94FyD2M6EHlbvv1ggmA7OScU+S4Pmzzxg2Yg?=
 =?us-ascii?Q?an/LLaV3zpdMm1HdEBuQVYQs5BCyDkPVQn1GKBYZk7oSswED147pl8BoamZ0?=
 =?us-ascii?Q?+CAnRTSW9pY2nDnGd425QIzrg4H6+skK/1AeIDxDUzQZV46zJfPyb+yZc3xK?=
 =?us-ascii?Q?fZmamkHf3Z1JbtxfauWWoqTX+YYZ/4rlb6hKnLP4jD43/WcoO3v7TOvx13/J?=
 =?us-ascii?Q?Oh3GQCqW1D/1PIou2KX1ilMRHIpSFlR8Nx66QmFcpe8RX/cSotA+yxLxWI47?=
 =?us-ascii?Q?5W+Kg/1Hr0zH7WUwG4Zy9jy1W1HI+V87v1BHbtpBadpczDwiG8quWFfiRTTV?=
 =?us-ascii?Q?hiRI4QknDh/EN9HYnir9+HJXrU69G8workoXUXd9njFdN0iDEw3TKKLtVaNs?=
 =?us-ascii?Q?zEJPbVDhgWVg1BJIBdWWwJac8es4972TYQfTF8Y5V6c16VUD5tw4nVXSL/Zy?=
 =?us-ascii?Q?BeLXNMz/D8lSvvpdepKm9hBMFwsDthz8TvCosiCt/R1IwfrYVPPOJkLURfk6?=
 =?us-ascii?Q?98E6TYswTAT47kgy+d4oeRT9QbwUErbpyizFW0BUcji3mjqzfcESrxUTF2hh?=
 =?us-ascii?Q?g0ScRh6AFlFInVp4WSQ1bsgjMfj071B8vXKSByGFrZfo+2mw7ZykOzJ33tsn?=
 =?us-ascii?Q?b7TfPksgQPaArtzB+0DcvLMSYPsaDBA6+eTlfne8eaNjcZAdizwcPuDf4Al6?=
 =?us-ascii?Q?cZfKuG5xO8NrRCgKR9SYnVSfjejBWmuNFDi1enU7MT7AeTacVK+CYZ51/IQi?=
 =?us-ascii?Q?gQ46qmsn3UF/uhQYTLNpWdS0DDKUkw/71BcByHxhIZEo0pmKlvHPgSZlbwvQ?=
 =?us-ascii?Q?eQf72Z4rTeKWfTrvGIPKAb2h+8tXcZIS97lha6kA47XqxIOrDUXwjDzRlVo3?=
 =?us-ascii?Q?UONTc0j3Hn5xLaNfFr2NZa5dBTUtRfPWT9cxnDuQeDAi5IbriP31O5pPz5Zu?=
 =?us-ascii?Q?o1Q/EoA+lfWi8Okbeiu8C67v/Oj/EFIPgEWU0l2Z/NHi5anQ0T7U+zSle6ZX?=
 =?us-ascii?Q?Ibm+hoeUoJQAdCea7jGrLWR7UqGJt1e9o98H7E6Z9GokpRS8kNkT4P+fERym?=
 =?us-ascii?Q?mUCczWzOy0dyqPitNW1u2A0NfwbkmvlJyYEX5sRMPrELXbwXeY7LBPjacIGD?=
 =?us-ascii?Q?4esH9YkZtv5Xeh7B6NaZ+48sntafGVVFY46Q0Pmc2gCUFhEJnpbb3Rf+KhMP?=
 =?us-ascii?Q?eMcYCmjLc1GjeWifp0VekEMaeZtgERvpQsx7mUOADKemYhH4sP4BBXKS3mk6?=
 =?us-ascii?Q?Wxusqo7fvbsZYy7PJYf8WXG4wSgxX3Xb/ApItUaPnrqNjBEx4iZ11KcRmdJx?=
 =?us-ascii?Q?08fkYwgL4PBG7e8n0/8sMryUnd7SMCAhGBuFY4LI5/fIsfOnKBgWQPPshp0F?=
 =?us-ascii?Q?pMZCGxTaKw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec42d9d2-6c6f-407f-0f77-08de5d1e4ad1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 21:03:02.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s91oiSHLxkG/jMt0SltDvNgTCLw6/8PIFOj19qBgMauN0Kp8Y0KHrCGxMma2xHXO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_130312_635472_8C87794E 
X-CRM114-Status: UNSURE (   9.99  )
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

On Wed, Jan 21, 2026 at 05:24:21PM -0800, Nicolin Chen wrote:
> Once arm_smmu_attach_prepare() installs an iotlb tag to smmu_domain->invs,
> arm_smmu_domain_get_iotlb_tag() callers should get the tag from the array.
> 
> Only the arm_smmu_domain_get_iotlb_tag() caller for new_smmu_domain in the
> arm_smmu_attach_prepare_invs() will be allowed to allocate a new tag.

It would be nicer to have two functions 'alloc' and 'find' instead of
the bool. Alloc would call find.

The logic looks sound otherwise

Jason


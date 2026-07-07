Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAFCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkRHiqyhXo/zrnsP0FtniaJd3Hyug5GB4wISpXxc5Mc=; b=xNe+9QGcqtHo95GlrnnYiinY9U
	jYtRXCZIGDAr5M8E0OUIWXG3xA5/XxDFeXEnSiT1MbxR1H6u7YtAmiQulch7oOWeurttJ7mHv+47e
	Go1gF9RU5IjWnsbVFRUk3DJb4FRmejew5JksjRc2ZCFEUEb/vb4Q3UPc6aLOumbtvo81uZ9oc1EGC
	J0ggurYCfk+XL5UF+TxCmEVADuk7D9BFuT1Vyp0/c7qeFKQsl8nTSacITTHcVfJNh/yf2rPcP63Uw
	cWDCJAllHBoFAMOuh1jINtKckDT6RXtpSb49YGBlXmXszyAWt1u4Hd9vuKEjGiWSn6eXRC95lhhbZ
	VgH5xc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Hr-0000000FEVK-1ahZ;
	Tue, 07 Jul 2026 15:00:39 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Hj-0000000FEUs-3Dii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/3+8eOg2Q+wvt6NIRKor3bcbrGdn1OiUIWtp0hkWvuOoV67xYzVdnGjwxlbg+mavQnYA8Z1b9c5eeMqZc09g9JeZTJjk1DCGy6Aed9a+qyW4508HhDbU2Muqs8J6XV0msqt7OkVGuO626w1qNktpK/qhDGQER+eDZrxelT/yMeAbwdLsXEKkDf7JcNbn+b1BAYdLt830E1ZGImYlAWNNDya1QXKefrhFRz9pYvdv90G6CWbTuZa3cRETFAQ1Di55ssqih01TyHlLma0PhZ88/k75seePA2tCresID5UhLCee/oQ7uhiBo0fY94x66pkDm8HUfD7YX6j35GZl8v7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkRHiqyhXo/zrnsP0FtniaJd3Hyug5GB4wISpXxc5Mc=;
 b=G1t6rtq21DeGi0gnm7twtEYUd/I8vvLhWl9ETH83yKMymlCUPpoiOCm2/URk924C+LYrb2UZIf8APAX5Ti+YKfiO8vNlFLbHcDhBIs0Y/IIULzN71PMIfayn1N4dafl7ln2NG0Ks/iWi263FFPTjYlQVXWi5/rc5KSPwf+47YMPQnIjdWtSGkGc0/1obooRTg+0hBhVwSr+eYPkmMU7vEZ3fsK9CjUUqtWgVLrN531Ix6rX6jj6oj9baCcCLTdXwqGRXooGRRp9pYVnS2UCS/llOSIW1Bew6YYRh0FAlMs0aArRdRj0V6/gyIE7x31+HeQ367AIux606b38seiN4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkRHiqyhXo/zrnsP0FtniaJd3Hyug5GB4wISpXxc5Mc=;
 b=cJacWRF+qMZGXzOcL+R4RmkhWtAt8ZCtONKSBs04qWIK9VX0uuXN4VfC0wtckXmBBdX1TQH5BjHWRkYYyk3iU/RBlSKWHchbfGbeA1JxMJYpAYy4tC9/qjJcISTvG0uO+LybkyGQc8Ejw36O7K0qe7WB+1ih3wTcBGBWA6pXIvWBlZSqAZcerduDN3JCD5OfGGfTcCayEKi+qhwoY0kFZYacXd2gd+Zmqg8+8dO8SIm84OWhZYHvJ66m75pnzfnpVPtQxPj+Wr81mpdoP9BMncHKtBpqLKfR8WuT5QZkHaOidILRmVz3JXk9NHNdLMLb/vdk/oTrMuFT/Kpo9ogk2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 15:00:24 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 15:00:24 +0000
Date: Tue, 7 Jul 2026 12:00:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 0/8] Organize the SMMUv3 invalidation flow so iommupt
 can use it
Message-ID: <20260707150023.GL220801@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzwJFpHTsgMrOYI@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akzwJFpHTsgMrOYI@google.com>
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fa9d4a-8fbc-43ed-1fb9-08dedc387932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4nsjA6vaJN+XhTnEBPv3GMUa4vAEsRbrGAvqTyfJRwxAmbIAOoXfa5/DMnADacxA8xSoFcPjON+qnZ4bFDjP/oN08gJFf1qovlvgT2IHfR0sjyRsuKF+Cr8Fov4n4VHLfbrJ+EpQpmrBg79rgzEnxAA3MfIhWTdY9NzHGUxOmB+oZB1szc4Ku34eBI4akzTVP4N/Hz0Dy6uNAyBIjkC8IEggKCVPKAxn9wH8a2SZkZOogrvl9VM53i4tt+UmX87igc+vzxRn0qsfVn9lPo5j9mdvsOWPtLrYJjqf2Nk0c9+cN44gZKBNVL0PPXLm3L6DTfDR6Iy6XtxtH6+YPtHzLq69gM6ZRgoN3UpujgWXquTalfp6Zx3xKpw5mjj4KVdAIG1XrmO/qkmYI+rzKdp6u1YVnsdK9vlwsFWrOCjZDmOtK22heBdgIu5Hbvnau+4WbVMFfEj/AC7y24sPBGpCzvFiHGcyj295V47KB3PpJrYgGmc3/kKo4I88zMn9DovkgjXr4yDvINB1XtwmhuL9ixDMIjAdl3aZmYrrCAMkcS9TkOFgar51+vRRHNydOUQb2FoazRrhvjxQWWhlFAKLep37YGxFcrzLhvbvCVRPc3LYzNGBkN4MO6ow5gxz8xYQASkQ8gYgPxEvId8vE1DHKCLumik3B50CB5XwzEIWqxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Vk2TIgW+ugq0JH8M/JYJJ7F0IkrYOSRLRHV1+zfPf7rQ9iwCAkA1Y1ckBTL?=
 =?us-ascii?Q?5hIxloYix9BfZfFJB22o8Ttkp+EQjWeDhwc8fKjMCOlqPS8VHuQ8mzk4YCOt?=
 =?us-ascii?Q?K8j1J5uujYQfviSa4IC87FqjoAEsr4N+IzSXvT1FMTJfsVd5+1xHE+QqumuD?=
 =?us-ascii?Q?uPGJFGl2jaZdI05+6IEgCkV3rwTxkYzqDv/xf4XsHRuIfzLS4aiz4gVPvID8?=
 =?us-ascii?Q?w6TeFkCgI/caMVVWQvuWX+hkYRTjUY8uKeWplDybMwGdcLGzTZGWVoQ8EwJ1?=
 =?us-ascii?Q?xHCW91a1FFCeyW5x95y6HTdKlSpy6+fGBMgINgTjZk8XEBH1l70Vkz/gBI96?=
 =?us-ascii?Q?7iq0qb65oaLhtJn/z/n+vnm/AjogNLhPCp0+nCKDahvWwta4EfK46M2IPnHk?=
 =?us-ascii?Q?Wytce7Tgpx4moP145IqGgWkxSf5GOno35B54zLwBC1sXTjnxOQmktOp6XOyG?=
 =?us-ascii?Q?5oenfkX7+IoO8OQF+/alY1IV5WFSdWIOxPTKjmhF/OY6mlLgwvBtyoIgaB30?=
 =?us-ascii?Q?RTcOMhur+bc1gQNjbZfnNl2Ck+ky/m0j4/au0/WoiWxi5V9AoYgc73hY4viB?=
 =?us-ascii?Q?8gp1pSsWtqMrqE3kYHEFQ7JLQ/41pImqMV4V3zf2SwwTpV4vb41WHk1zjB9P?=
 =?us-ascii?Q?uFYvB1wBOyY5C+Qh2N2eijoJ6KGnTMkaWJuauVGpyf55gzVw+BBXxIZNoH9b?=
 =?us-ascii?Q?wq8+FTRF8R/eWfK9pAQHtHLhoJyUr7pUscW5su39+2319Bz5VS52tAu+tf5F?=
 =?us-ascii?Q?vMZs/hIdYZOxQjgRYR1MZyrs1pO8g7VHEa9GstBbUYxHgpnuQiht7c0WbmtD?=
 =?us-ascii?Q?GYa8HCz5OL8b0KcZeQq3XDDJs3YcKse+xMqB+8Cb2u5OTw1VL6PNvxQLHgDl?=
 =?us-ascii?Q?rrSEen+bfcTDXYHVcwSffDoJjco/05cCQzvf3JwEwkRnr03baeH4EWIChXaI?=
 =?us-ascii?Q?jBpf4yxUGpJiH/iSbO9BV91QEY96DkHL332NjUWP9M/JdZUyR6G7i+SQu9qh?=
 =?us-ascii?Q?gLMr7V3mbXgEt3D8z64BnAewYwCgd0yBHY8cdD6XshMwlreP4iIwEreDzrNB?=
 =?us-ascii?Q?fvv/rJH/fWfiaFDwC1cP+fqKc9IKMxyLTRrsGXF46YJL+YyvJ7jaBgjB68cI?=
 =?us-ascii?Q?1MXzOLmCnjciWxFIZ1h+im/KMH4/aGVT/NIQHYALmhBRYu0bdQb9PwFO1xst?=
 =?us-ascii?Q?79m+AJF7wETPF5Y76AYCFrUtJDfDExJL/0o20j5DXorSKhdH458Ocb3S8dzA?=
 =?us-ascii?Q?K934aHxdE56ce3UvUQk25nlgkgDtn1bSBiRi+UJsPrKVWnTVNuhHV4gQgbt+?=
 =?us-ascii?Q?w2enedR0IVzBsA2mmflmNH1aJfmiZPpfrvinpiDezwwYtbr3Wy+sfMoVAXXr?=
 =?us-ascii?Q?LJtuEnfEcoX0eVUn+bQ+D2kTzwajiBWm/1fbEzqW3/vX4dJnT/Odd018qNYt?=
 =?us-ascii?Q?EXYSw5j62jVJod6YbgfWLGkVowPLtTTvgqy6VWetQGuFGztYXWGW3/xkLwiy?=
 =?us-ascii?Q?jWInXUFuzhpKLVOSvUqh74b8xiOizhjtb6zmvg3+lzLsIAsDemgzrRMpOwPo?=
 =?us-ascii?Q?Z9Fu+4vPSRZVI1r0Qa+yRmWyJTBhQXfxi2OwcF+gd83ziYxFRA9lExzFHC6A?=
 =?us-ascii?Q?rJpysMNIy5VCIb8PYUQ9z2Bk7XT8vaHavXW0GFKs35HT4srK9AWZSNJrlWT8?=
 =?us-ascii?Q?gjpD3wJ+0XOrkFVC25mSNrJfRnWp088eMthn6gVAHM/XtBtP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fa9d4a-8fbc-43ed-1fb9-08dedc387932
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:00:24.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlHiXtBp46B2Du9j0YJ9SLXQ68ij4lC8IlMa+pkQU+vzCTLSX09ZS/LkDHCaQ06f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080032_158149_5CECC877 
X-CRM114-Status: UNSURE (   9.31  )
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

On Tue, Jul 07, 2026 at 12:25:08PM +0000, Mostafa Saleh wrote:

> I quickly went through the series, and left few comments.
> As discussed before regarding the TLB invalidation logic sharing
> with pKVM [1], 

Great, thanks

> I still think after these changes both drivers can
> share some logic on the level arm_smmu_tlbi_calc_range() (+ tweaks).

Yeah, I'm sure, but it still would be nice to share more than just
that..

Jason


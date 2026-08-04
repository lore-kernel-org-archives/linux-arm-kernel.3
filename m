Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AC7C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwgclgBw0wHq1GhyqgZG93yEwj2QffdkDULvLcPvfEc=; b=NcoVyT+9uMJoGixodAaKMN48Pj
	XF9ZmhDZw0FEiaU0WSdJEgFdFt6ZENyrbLIj/k3QXRvbqecOi9gLyC/KzVHu9pVq8XRDJAkJhVmWN
	YOk+jURxEqMBKboxEMJ9x+gl0kytG5ds2PADTiwPnDhFbvw9VrqAysIJ0GrLCuEG6MgWfvuQYQ/4z
	u1sb4yLiWuKP6NSqAnJUyeoADkjfk2pc0SlM1gf0+/ZJCqxNRyV7lzmzYzI7zpR6mJUQSu0l2n125
	/iJFqy9vOqqJifTcbVyUfoepMIdEgXq4nGXiugA83icFmNgt1WK/mCbJMutZr/eJ1nYn0j+AsoznD
	EsDDBecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ7O-00000002Vxr-0V7B;
	Tue, 04 Aug 2026 17:39:58 +0000
Received: from mail-westusazon11010042.outbound.protection.outlook.com ([52.101.85.42] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ7K-00000002Vwb-3BgI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imcYiLTOw77ZfRuHqFAo7vQWQoujBJIx0XjoULDmFR267xtlEN8ywWaQCf5x9KqjzGyIsm2Tk6T09AHhsYy2shbdaYYLv6lKRVlNyj/IhYRnPh2LFUeW1zj7rZdtM/4w3oiLVLkmurExBk5whuM7q99A3IzDKWCywxvsZqxPZue25Ice/sZnpz+dsV3g+xzdBeDFyvCSaOyiZB8DcHIdm0S70K5kOkV3MVMRqlCx/MrsiMVUB6iT/qgQRo3QxEO/ReCqzq68NhODrrS3WXMnRfNfgL/7NgDMnglgxU87cLoS4DGgD3FrThP32JXEXXlXaNKnuXeFAtZvoMsMTf07LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwgclgBw0wHq1GhyqgZG93yEwj2QffdkDULvLcPvfEc=;
 b=aPv0RvjCcmd6/c3mtTf3T72+LSk0dSH0SnEdGXy31hDiz5vPQPBCacQXiRxNqbhe6BME19BBQv2YdBsA8B4k0akpTwyn2w7ox2ORTvFuqkRB23EeEJxCDpivANZcTJV9T+NiBvV6nnsteh1HyDLjyHT4kyNZpHOvAm8HL7DGM8dRaF8hZxAMsFC9tT5kxE2O2JxjL5MXfiXr9m8xeagMWUBSG+nyb8EO+FFTgPEHS7LO/IHnYaW8UIrhaUfvM47RT2ZRuOyfhM3G+pj/EOIZZVJoau3kapWShYM4LRnj7JvIrjfFJAGsn3f76gTc7+mStuOWX/QOaJk9qqe9l/fmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwgclgBw0wHq1GhyqgZG93yEwj2QffdkDULvLcPvfEc=;
 b=lx0BJ5Om6BAeTVL7yrFkKTi5R6aNrJ9BOnKFNyrhqcRejxznpN6cNxCzU1837rSIN/hDv9JBFwp8D3Qoj3BkGbOJXDWr4F75CLchrFp3SxVn027H5BWxbrD6EkJb+hHPq4Gw9dEer9NYDWaF4CK7OEO/bYXVxtiFI1ApibaIBPVNkUq688Xr7r3OU0IodPfFHnVnbv/yD6S1KEIbXW5HKSVwB44yEvzOZBhOsJAs6Pq+EnsexmMQN09xq5SkV59SFD9aVKYPhamxJLk3GbfRoXYzEvSqteQGp1vOPPuDuUt3JG9lyVhkWV2GWihkQ5MXewfLyi0czh4pwnM03HbdoQ==
Received: from DS7PR05CA0040.namprd05.prod.outlook.com (2603:10b6:8:2f::33) by
 IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 17:39:38 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::56) by DS7PR05CA0040.outlook.office365.com
 (2603:10b6:8:2f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 17:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 17:39:37 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 10:39:16 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 10:39:16 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Aug 2026 10:39:15 -0700
Date: Tue, 4 Aug 2026 10:39:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Pranjal
 Shrivastava" <praan@google.com>, Breno Leitao <leitao@debian.org>, "Kyle
 McMartin" <jkkm@meta.com>, Usama Arif <usama.arif@linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <anIjwUVvfWOb9xa4@Asurada-Nvidia>
References: <20260706084708.8072-1-kas@kernel.org>
 <amiBagGKn-Aym1DK@willie-the-truck>
 <amiz6GQZ-XGlH706@thinkstation>
 <anHxBh-xGW9JXsa4@willie-the-truck>
 <20260804141704.GB27883@nvidia.com>
 <anINkO1l9Kz8lTVh@nvidia.com>
 <20260804161918.GG27883@nvidia.com>
 <anIXDd839UC/M2n/@nvidia.com>
 <20260804165905.GH27883@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260804165905.GH27883@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA0PR12MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: aa008f33-239c-46a1-b054-08def24f5b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|1800799024|23010399003|82310400026|376014|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6j/Le6ZtSfZ/rGCCrrKofSfg7ngwyv7banwi1rEbTViCi81kim4Vzx9bqSoP1cD2Z/bv0hkSEnfhQ5HUICCP/B7y5OcJxbAr8JeRsdLW5iHY7/RpzJ7MPkcZnTsFjGK6WWNaAlQpgmD+lYbpTaeexQOi8LSMHj0bN8eFmjppWrtVNfhnrlWwgyo2CAnocp+BA1avwDf8Mq77vqOiRkT3geR58qSQ4bG2VlEPgGyzVagvJ7NqP+29Y1viXeJISQ3e9OcK4LLggru2nQ9YhPIDHABdo0dEC4Jsj4VC6gNff/3xtVVoGloxUalCklKMrP2jyKL6IfgvTEjV5eZX9uhvhWZ91BOujXb58701n79aWekOgxImRN/9YpcTUAwM6gvsk6+UoR05Ce7zD0IG9koLBnjMK7DJbfJbI6wlHE33VZ7zqyTKTnIW23oiVD9qCI5OquWYZs9YDpslYCMIhHYozcwgbxMLWAVXuld+GUkv5juDw3cdjq23w0JYXrBAZgOBLEueMJC8iUAp9qwRvMEXWXe2ocmPqJ1x/o19FFHxUQIgIYGFDNZEerY9wx4vrrIpuo4fY86yyw2WoYcMnfrp5hhviFfipEFPx/JwHlhtv12H19cShH/SKpRoFsG4b/tvK82gaK7kzMxluaIHbQMdRqB8uc9Rz6DazMV8rnrcaa72kwj6HsvefaaWfS3zXoZ8GA7CFTVZoRC1yu9nxSTs4w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wI3J8hUZJ9MdIIKpHABMcHaA8kVx7PHuoHm0HYjbxYCkMwo2rw2LpstcKJn5Rs6AndVfBbDV0zQx1QydzFVMpmHfWTQ76jJJgczJO657a3WCOzBfhU3LOjv88CG2OvchO5+rSV0RAwA5uNJ/COzinXDNt6Glklvvyq+x1ZYYNpgVFGO8ihm9+5Q90lp81wHJtsnwNUOXGij+TorD2HjfrOiVz1LoVYCkghAh0MVQ//3IYlr1dErNcu7I073gB+sCAFmtSGWMtHQEdqNT7Auu70LHBFqeU8v8klkMajsELyVeu4a63z5w5krnm22cTqYdI1RujHWDuDMwlaYRmtHhnicVQAUyBNgECpa8cEuWdceAYdh9G5cFDjwfFaAMu/LdHCkZCnH9q3YnZgoekht7rsnHgc6gNB/yxo0H1zpESlM7aV+FtoH5wQMKjRCJW5RH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:39:37.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa008f33-239c-46a1-b054-08def24f5b37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_103955_105790_B0693665 
X-CRM114-Status: GOOD (  27.76  )
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

On Tue, Aug 04, 2026 at 01:59:05PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 04, 2026 at 09:45:01AM -0700, Nicolin Chen wrote:
> > On Tue, Aug 04, 2026 at 01:19:18PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 04, 2026 at 09:04:32AM -0700, Nicolin Chen wrote:
> > > > On Tue, Aug 04, 2026 at 11:17:04AM -0300, Jason Gunthorpe wrote:
> > > > > On Tue, Aug 04, 2026 at 03:02:46PM +0100, Will Deacon wrote:
> > > > > > > Would skipping their allocation when is_kdump_kernel() be acceptable on
> > > > > > > its own, or would you rather see it done differently?
> > > > > > 
> > > > > > With Nicolin's patch, we can just avoid allocating the priq and the evtq
> > > > > > entirely in the kdump case. We can then add a cmdline option to control
> > > > > > the maximum size of the cmdq, which is useful regardless of kdump.
> > > > > 
> > > > > I would still prefer kdump do this re-sizing automatically, even if we
> > > > > do add a commandline. It makes it easire to deploy than having to know
> > > > > secret command lines :\
> > > > > 
> > > > > So functionally I still think this patch is fine, though yes it points
> > > > > out more things in Nicolin's work too.
> > > > 
> > > > I will send a v10 of mine, to skip the EVTQ/PRIQ allocations.
> > > 
> > > I think Robin's point is to structure the v10 so you introduce a bunch
> > > of tunables, including something like 0 size to disable a feature.
> > >
> > > Then have kdump default those tunables to the right thing
> > 
> > But in kdump, EVTQ/PRIQ are disabled, so my series should have
> > skipped their allocations regardless of the tunables.
> > 
> > So, I think the tunables can be done in a separate series. And
> > its use case might not be confined to kdump?
> 
> I think the ask is to do the tunables first and change your series to
> default the tunables instead of doing direct kdump overrides.

You mean the driver can override the tunables to 0 in kdump mode,
right?

Well, we are skipping a lot of things in kdump mode already; it's
a very small change to skip EVTQ/PRIQ even without the tunables.

If Will prefers this merging sequence, I wouldn't mind changing my
series to overriding the tunables.

Thanks
Nicolin


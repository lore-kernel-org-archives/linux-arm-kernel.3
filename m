Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017EBC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqPksl4SKM63xlJ+mpbwQQAFMdwwGS0QSSlDFXB1CE8=; b=zacl6a3SuGH3oHKOO0WVz0jsCe
	j1eaWX7is+5ZuoYwrSaILmROFxQjADW4JAqLz7+aA6UBr2ZkMF/wR4N2us2h9lykjTcHpJnNW6Hcl
	D2xemyLTl32KMGi52t3mgC+cIuvnSXSJxTlxatOFWRPhSVNeoxrA80pKZ/xEFPEwNWLs3FhI1Ys8P
	fbMTC9r+stp5r4i58MshRStnqJLXDCKO4Fc3ojJknJ3mRU3GLAMRVXULZqEMzd8BVxrCX3VxjptAI
	UnNe0EqbOeXD9JMxOhDWVK1oI1OtwlXo1lHgcaCWeNxH2p4NXHOzkIyTWn7vF5PoJT/ubwSPNTUQy
	y5uWZTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DAg-000000052HQ-3hWb;
	Tue, 08 Apr 2025 17:55:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CgP-00000004y5J-406U;
	Tue, 08 Apr 2025 17:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sqPksl4SKM63xlJ+mpbwQQAFMdwwGS0QSSlDFXB1CE8=; b=rVfNpba+I585SAKK5pSqj4fd5h
	8HDm4xqfKw9WGu4QYXRKcRv+t3gFwnwYtKwUD8iWKmtZBr0+2AKW1ZbLGteWiqfXnOLlzGsRLF9OR
	535P23RBLk6rKCWvtuh/43ErRcOneJMHFNU6oE34ibdLNu4hnbM0EyE/uQPl/NUoAvp5bbHL6PNvc
	nyT64xfG85JTiNXyYVDdmiWjtcsXNvQAPKmiibA8tr2F/8VMJPZauaOYO3Kdh8PG+IjAXV4E4jBdZ
	jBiCedrvsuQLnPdvHpqEdb2BTBfF9nX53ScDoYC84a3iln4DP1k2Ah3dXzqRQNxL8KrNJR5aZyRm2
	I8YDDDnA==;
Received: from mail-bn8nam04on2060f.outbound.protection.outlook.com ([2a01:111:f403:2408::60f] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CgN-00000008M6z-0GFN;
	Tue, 08 Apr 2025 17:24:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRtnC/Sugdn102/BVZgFUgjQa/9Yb/CF4vM/D+bMcRJP7sTbmhcN9C7UO8832ymlPDbOVT+4SXhKLyJXE8g3k8T2tlEbWNwi2MzcVGBACPjlNjZOyddl92dqBZgA9VokHdFjNgOPD2UT3D2rv7rjZ6AYGvWhOZWJdPCYtSvgkMGR9jaa4780BtCtwgd6B5BJU924aPwhwsoBpSNO/JwvPNbLrjJKCzI30KdbprR/U5Ve41IZ7J5+PXJDP4NhMtmTYeACdKTxUNQwc4dlEmoFeD9OJodnefMr9sy4WiQmRfHFJvbEWMbRjgnCkaJxDlIHtepI+/LkgfXBMZjuHWDjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqPksl4SKM63xlJ+mpbwQQAFMdwwGS0QSSlDFXB1CE8=;
 b=SX3gURGGvFmwr2HdQQ/8pjxOdAKPR5x9uy/a6zd4cydXIUwNLHvDBP0uNJ8V/xQgpUHQetcbt89FEbbVjfY44m1thowvR47ao1JrcEh7RC+uQwV/b2dCVIlfxgpgwhonw2QCH6wmUaU6vY2BNcC0pqm1VYXrM3f/prkChEV6X1SaUj41+T0LTUsySwzHcpIuUYfBwLOxrBdT7jA8FzjjGR7mos6RjkmoZblPJLH1zXdv12/eyuIP8F92LifHpbDYBIlwED85w1YDwM3PwHR+oFVG3YnxTYGRjKIybU/68zwrnpEqQ0f6oT4tCrw8Z7UbXWrRkP7nnhGXrKbRFHNVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqPksl4SKM63xlJ+mpbwQQAFMdwwGS0QSSlDFXB1CE8=;
 b=ZFOYm7lTiiDWKBKEatyXzWvWvDLFfl+tpSaDLgQblzLw4yPOzLK6EuH7XnR8tyCmFDfznP+38ATZptJ4aXVCpalInT8NIhAB4JJk04b8CORniqVtg8AIlw8RRJUtUnU27Mcicbd2LM79QfkxORnzXATtUWKuDRkh1cDoYV5GShPAvwN8ShWP3yqF7kCVSIexFFjSUUu6wV99hJmWcNp6Wp+YiNU1Sru/eFHsFgxQ70S1lDBtaoBJ4VRQe8rF2PYnGyAXGdkyuCUdfpkpKLbwsSZ3n7tma8/FmzUHC8Gm1mJRyq6x0PokywtaJch3GfCFnG9WzTmRcTDE9P5UByzSdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 17:24:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 17:24:10 +0000
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
Subject: [PATCH v4 13/23] iommu/pages: Move from struct page to struct ioptdesc and folio
Date: Tue,  8 Apr 2025 13:54:01 -0300
Message-ID: <13-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:208:52f::12) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1e09c0-62eb-496b-b9d9-08dd76c22ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?692irVq9kwXx5v7zGQ9AV2orXKR9Xvt9MMWIlq5HF+QMCW74PoBYUjFXHQzQ?=
 =?us-ascii?Q?EPI8hJHKxTJg+h3+l4ACqzaeYzXp5sI1SQ5DCrTxgsGc7rbgW2W01VrFioxI?=
 =?us-ascii?Q?m8nHou7Rp0GBraAV9gTJzjCe1cRU5o2sxXXRwtryUeauV5t2X/ZFIzW+v3da?=
 =?us-ascii?Q?9vz1u8Bpj56bL++50tNAD9R2Qi1O0iNzCuBBBZLANzySDyQLDOiaWnCFimlz?=
 =?us-ascii?Q?P443j9sTJMsp1nHYA3BgwC2Aq5QVUpZ52nGnjohNfKWpvWkxWwgVaHx4rx9w?=
 =?us-ascii?Q?jX+YjB35M7S44D9KvJpCyQjXdN5XTFkElnLAd34MEUYnfxletugFJMfnNOA+?=
 =?us-ascii?Q?AKSXr/zWwErKgQZFGzQ5lGB1lP2jp5oDLddhETDEP1CPpqI2BiATxN73FPhe?=
 =?us-ascii?Q?FzSY7ib7ljRD/wxJcTaPlH0P5TvdVYOUfr5ysqx0AgqJRT+Pv890EbW/4RX4?=
 =?us-ascii?Q?9OUlr1LbbELsKRNoUrU/IP1kJ9sG75gF35ypOe/RjI/sG9IOhQU1RUsvA5pP?=
 =?us-ascii?Q?7XXMkZGO7I45hhrhLp+r3phNr8LhS7USpM+7juEWdODgOHE/CzJ1jXcaeEfG?=
 =?us-ascii?Q?5PYsRU/4qR7c1WssuK2NUBSdZgqx7bB2BWbiq1xndPbkRMwlGZwXKKx4AKDA?=
 =?us-ascii?Q?dpzBMTRguRRTSHWJk5Vdb4GTjd90UZC4qPkqFyEgOZkyvuPOpm48AXdeOZ/s?=
 =?us-ascii?Q?3IJfD0WWD9+1UsevntflwqELgpUVue6MwLZP7JT3W/y8xhCcp/iLsNGkrh0Q?=
 =?us-ascii?Q?JGEPmudw1TUECq9M3OEgPRrI8PQ1NPn6LFjxx9aUKuQZ4pTf/zIPQ7e4z6JE?=
 =?us-ascii?Q?9mwCXAi4Dbg3AcqHYkAwOj8yv3/oh1qF3GNTQaIMi8LbAIznz0C3TBfcfC4N?=
 =?us-ascii?Q?sTSNJBpYrtt9CBUbbpGf3a/VbXmo3iDfLn1p7wyxppaitmkVK+CMrfmoo06n?=
 =?us-ascii?Q?Iw15ECSvcdkkvEc6Jkgbk4C5f1MerVKgIAPY1JF7N/XrOKTx9YYFvmERMd1J?=
 =?us-ascii?Q?kHPaxg4okm3rC9/MzM4wg3e765WyB5f0rP7avsB1vVFn+dq0R7YliIlHqCfS?=
 =?us-ascii?Q?qxEHzD+tD/YQH+bs3SanjEZ+C0HeFCeSx2aa1a01m4kChJiTSCnEiWOYNBXe?=
 =?us-ascii?Q?ZtpNw90d41Z97inRQTU80cD0NvBKaFKoIbYq9GrViqQnYOb59nK+/ETAUnAK?=
 =?us-ascii?Q?DvsB2ZRrVFMVLDXZ22yQ7aG1jafr6SLoglKzHBgZn56NpUOiWwHdazuNkNSz?=
 =?us-ascii?Q?aLp+BGk5vsNC9spuEoR5qOnUFBtjkCy2AoasaaqO/RGX+uUo8KaaB9TUhGZy?=
 =?us-ascii?Q?8gNF9qtBUXkZZ6DJEuTJMcnsfWTOSXwrbRzqo6Zy2nlipe1MiN4JP5Q/47h0?=
 =?us-ascii?Q?Q1f89t/Qv6ZF2hNaizl90V2ZU9BGNFY78NHtlW5j2qk1H0VU+OodJzqVhBTv?=
 =?us-ascii?Q?Ueue1w3+/LhZzopWUsc0wlIJWXmNBq5+hE6tiyD3/ZKRzth19WyOIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P0GTFndX7CG/y7no9rtL8jBoW9vD9vps1h6c3hnegMwDBzHFmm4FngSe2JGB?=
 =?us-ascii?Q?AZdSkH+iHLnMsskeDs6R1R8LgJhxFkz5fOqbteU+pmdkOzhyUOxYB7CAdk3t?=
 =?us-ascii?Q?A1cYcb+FgmjzbTvcEPQL4J5qmRWUujDN0mmeUlGxajdvs5ZoMfLPS8qAFwCo?=
 =?us-ascii?Q?0glgMg0HjPXsRv8pgxvyBnmn7k8mPwK9+Y1Pt4EX0b/ZMI4xnbRbBCaS1RdL?=
 =?us-ascii?Q?m7kl7nIvSLptS7Wh8K/WdIAHoxmnCB8OgfFhI0w7jz/aQUCLjWeg7kxjYjBR?=
 =?us-ascii?Q?hRkKYWxQvBwTwBDpAD/J33uKZYhZ1OAp4TwQkhiGWN1rEPp6oWCyQjQ2JjCR?=
 =?us-ascii?Q?+zdxynGjS0CG3vnV5HfzxRh9Fy1DQEHl+0NTjeCIhROc0hTRO7ZffMb418li?=
 =?us-ascii?Q?R28YcA+v5Gwkvpf4f1rdyqAVJKXXijY7oG4+Y6tVxYQVrqi5xLwniX4VIFeH?=
 =?us-ascii?Q?YzCNKEaW/fySWQBHY6tyXZ15Bn+Lk/s3nzT/zziO2t8caC4ZnUCYG6GhE78R?=
 =?us-ascii?Q?mAKuufbfML4abRD4Lw0B2j/FYtb55TZ7YHgOr8OwBdXFQmr5j+Sg9pLnP4hf?=
 =?us-ascii?Q?BV+0qdnGu5wDaOboLWr+HLMOXS8ANTPHrFU1sq2DPDD48K4yHd+0OhFYglLh?=
 =?us-ascii?Q?MBrsHrU9gurW3/MjSvW9s2EAFag2ki62EOY+ChSjjDOy5mn1WvbrW6rBEsqh?=
 =?us-ascii?Q?CjZhHp2LgUkZuI+pbTvf3CTyUlhTNuzrlrSXm3MltyGffrkRnDyzpXbzleHo?=
 =?us-ascii?Q?VAcTGtZJM630H+Y6wCX6v6iH0+PIoSRS0XJegar95aQMd7hdLoai8dCTINg2?=
 =?us-ascii?Q?xickRSay1Q50aoSjG3xdkHwImG7KCNP67vuWEvHrEVK+sG3Hto6tayjGv64r?=
 =?us-ascii?Q?0+vue/Dx+LncJjkkxhtAc/WDm5yySLrglo0+nBK0yvZEOU5AVWxH9BWhvkBk?=
 =?us-ascii?Q?5ZBPtjTKyKixw1NcgNAG4zlGWzjpybsTrrOjUrh7QyLZS1q+c669FLOIZbmr?=
 =?us-ascii?Q?Ab8ieI2yksOI+bzgncnd++Zz4c/BfFX20cYZAZyU4cRX+ppHh1+hfVoEMWuh?=
 =?us-ascii?Q?CLRIY+czOBfBa27HXYhTa/xq4gss5Srf6VzU3eN0oGlkWckMYmm409HJwz1p?=
 =?us-ascii?Q?izh07NX9dFRuqWtHzAhDssQkOkf3sfu4zBDiyYZtQavNFKeB/282U6JULFlQ?=
 =?us-ascii?Q?Y5tISrAVDcDHm/ipoHwncT3bJeoBQCm8OQsSblLkR33SnNOoIitspaGew/eC?=
 =?us-ascii?Q?DIHFH/purXJZdU5gpFqQfO2Sxavg98dB8x5IB+iUOyUyvDoCCTQQILjauF4J?=
 =?us-ascii?Q?fUgT5cgoTtZAYe8DV06s8IHp3vkFrLDRJfhyaxFVcQo2XRLzRR+Bv7UXkuR5?=
 =?us-ascii?Q?LfU73Un35e+wQ9bW6H5IG5z7YMQ7tKX6W+bMvXtiVbUlQEPTO2W9shqPhjcB?=
 =?us-ascii?Q?K7jdJDhjpl9Blp9VxcELsFJpEVuzj5jFjCTwKrak/QyYYzhxdI5lVD2WEpni?=
 =?us-ascii?Q?CPO4phlK/bMcyktGyz2R74Em1eISQGHINI04p3Dqz7agOwtl129KKji9gCTV?=
 =?us-ascii?Q?K/LvWqtJgyM2XbMv1wH8MjGrWccyXDACHW+TEbOK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1e09c0-62eb-496b-b9d9-08dd76c22ccd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:24:10.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoK7GYTRupfOlWF3rrjJgJHxeTRwAeQ4LvTfkgONnn4h+dogp9lTaBKLnQln5TMF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_182419_274385_E2405EC0 
X-CRM114-Status: GOOD (  17.87  )
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

This brings the iommu page table allocator into the modern world of having
its own private page descriptor and not re-using fields from struct page
for its own purpose. It follows the basic pattern of struct ptdesc which
did this transformation for the CPU page table allocator.

Currently iommu-pages is pretty basic so this isn't a huge benefit,
however I see a coming need for features that CPU allocator has, like sub
PAGE_SIZE allocations, and RCU freeing. This provides the base
infrastructure to implement those cleanly.

Remove numa_node_id() calls from the inlines and instead use NUMA_NO_NODE
which will get switched to numa_mem_id(), which seems to be the right ID
to use for memory allocations.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 54 ++++++++++++++++++++++++++-----------
 drivers/iommu/iommu-pages.h | 43 ++++++++++++++++++++++++++---
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index 6eacb6a34586a6..3077df642adb1f 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -7,6 +7,21 @@
 #include <linux/gfp.h>
 #include <linux/mm.h>
 
+#define IOPTDESC_MATCH(pg_elm, elm)                    \
+	static_assert(offsetof(struct page, pg_elm) == \
+		      offsetof(struct ioptdesc, elm))
+IOPTDESC_MATCH(flags, __page_flags);
+IOPTDESC_MATCH(lru, iopt_freelist_elm); /* Ensure bit 0 is clear */
+IOPTDESC_MATCH(mapping, __page_mapping);
+IOPTDESC_MATCH(private, _private);
+IOPTDESC_MATCH(page_type, __page_type);
+IOPTDESC_MATCH(_refcount, __page_refcount);
+#ifdef CONFIG_MEMCG
+IOPTDESC_MATCH(memcg_data, memcg_data);
+#endif
+#undef IOPTDESC_MATCH
+static_assert(sizeof(struct ioptdesc) <= sizeof(struct page));
+
 /**
  * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
  *                          specific NUMA node
@@ -20,10 +35,17 @@
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
 {
 	const unsigned long pgcnt = 1UL << order;
-	struct page *page;
+	struct folio *folio;
 
-	page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
-	if (unlikely(!page))
+	/*
+	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
+	 * alloc_pages_node() did.
+	 */
+	if (nid == NUMA_NO_NODE)
+		nid = numa_mem_id();
+
+	folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);
+	if (unlikely(!folio))
 		return NULL;
 
 	/*
@@ -35,21 +57,21 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
 	 * This is necessary for the proper accounting as IOMMU state can be
 	 * rather large, i.e. multiple gigabytes in size.
 	 */
-	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
-	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
+	mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, pgcnt);
+	lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, pgcnt);
 
-	return page_address(page);
+	return folio_address(folio);
 }
 EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
 
-static void __iommu_free_page(struct page *page)
+static void __iommu_free_desc(struct ioptdesc *iopt)
 {
-	unsigned int order = folio_order(page_folio(page));
-	const unsigned long pgcnt = 1UL << order;
+	struct folio *folio = ioptdesc_folio(iopt);
+	const unsigned long pgcnt = 1UL << folio_order(folio);
 
-	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
-	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
-	put_page(page);
+	mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, -pgcnt);
+	lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, -pgcnt);
+	folio_put(folio);
 }
 
 /**
@@ -62,7 +84,7 @@ void iommu_free_pages(void *virt)
 {
 	if (!virt)
 		return;
-	__iommu_free_page(virt_to_page(virt));
+	__iommu_free_desc(virt_to_ioptdesc(virt));
 }
 EXPORT_SYMBOL_GPL(iommu_free_pages);
 
@@ -74,9 +96,9 @@ EXPORT_SYMBOL_GPL(iommu_free_pages);
  */
 void iommu_put_pages_list(struct iommu_pages_list *list)
 {
-	struct page *p, *tmp;
+	struct ioptdesc *iopt, *tmp;
 
-	list_for_each_entry_safe(p, tmp, &list->pages, lru)
-		__iommu_free_page(p);
+	list_for_each_entry_safe(iopt, tmp, &list->pages, iopt_freelist_elm)
+		__iommu_free_desc(iopt);
 }
 EXPORT_SYMBOL_GPL(iommu_put_pages_list);
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 8dc0202bf108e4..f4578f252e2580 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -9,6 +9,43 @@
 
 #include <linux/iommu.h>
 
+/**
+ * struct ioptdesc - Memory descriptor for IOMMU page tables
+ * @iopt_freelist_elm: List element for a struct iommu_pages_list
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ioptdesc {
+	unsigned long __page_flags;
+
+	struct list_head iopt_freelist_elm;
+	unsigned long __page_mapping;
+	pgoff_t __index;
+	void *_private;
+
+	unsigned int __page_type;
+	atomic_t __page_refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long memcg_data;
+#endif
+};
+
+static inline struct ioptdesc *folio_ioptdesc(struct folio *folio)
+{
+	return (struct ioptdesc *)folio;
+}
+
+static inline struct folio *ioptdesc_folio(struct ioptdesc *iopt)
+{
+	return (struct folio *)iopt;
+}
+
+static inline struct ioptdesc *virt_to_ioptdesc(void *virt)
+{
+	return folio_ioptdesc(virt_to_folio(virt));
+}
+
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
 void iommu_free_pages(void *virt);
 void iommu_put_pages_list(struct iommu_pages_list *list);
@@ -21,7 +58,7 @@ void iommu_put_pages_list(struct iommu_pages_list *list);
 static inline void iommu_pages_list_add(struct iommu_pages_list *list,
 					void *virt)
 {
-	list_add_tail(&virt_to_page(virt)->lru, &list->pages);
+	list_add_tail(&virt_to_ioptdesc(virt)->iopt_freelist_elm, &list->pages);
 }
 
 /**
@@ -56,7 +93,7 @@ static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
  */
 static inline void *iommu_alloc_pages(gfp_t gfp, int order)
 {
-	return iommu_alloc_pages_node(numa_node_id(), gfp, order);
+	return iommu_alloc_pages_node(NUMA_NO_NODE, gfp, order);
 }
 
 /**
@@ -79,7 +116,7 @@ static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
  */
 static inline void *iommu_alloc_page(gfp_t gfp)
 {
-	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
+	return iommu_alloc_pages_node(NUMA_NO_NODE, gfp, 0);
 }
 
 #endif	/* __IOMMU_PAGES_H */
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8160CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 03:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p74A+sOl7DAz/FC+dByIeNJupwTvLp+3Bi5eknuxa5E=; b=RChuuXX8anLhZ1tOjnX4tT/CjO
	Mf0sKDXA81EFkaYX9nTNpcXl92vdgEo4+V1FRMFLQNdXWFwB5hzP+lEPhtf1nke1Yt7v7ppwa/zCR
	4NWUWmaJLcfFbUebf4C5L8FLSRnECKhc1ehj2ykLbfVlN1Evl0NkAxjkKFZCBs5xqCKdQhcA4cKkb
	L22qWrfnJ7V68Mw3A4sFKRCutEDn+2SiabCdDZjXTiGK1mIxRiO8Vi5UwDrwnXfbg6oNGuJBiXjrh
	/Ku44ygPqwY1+5q4mpffW345dwJhGM9JBvWabF1mTs4/9LSsZuESYQv1IKPFuwAO/G24waKsjD7Fx
	EwPxB66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urT0A-000000006X0-0ZPH;
	Thu, 28 Aug 2025 03:08:38 +0000
Received: from mail-dm6nam11on20621.outbound.protection.outlook.com ([2a01:111:f403:2415::621] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urR4b-0000000HRnF-0zcJ;
	Thu, 28 Aug 2025 01:05:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOWUFNiYrbtZFhq292gOefp6rE6KRwfxECB3wrHu6zJ/uI6bADu7V60oIR1R+Ce3fYvFTqjnK/XtlycfQvlE26dTTSuWszIb9XgnubNea17hTsy4uTTymxlHlm6ceHPDFRg85P3uU81YlZV5XV//dH8gpFwkTYMkrikLsAkJqKesL9VR0aqrfArLS3G7rMQicvkoIayxAzhcyoXjackflIKAL1olLOJ/kUWqO9BwAnG4l6YLTBABROPqZBsLHU0JhkT7g/I0ksn+tU4apjpTCNjHUKacAyDqS8pI0cSoSqYkcmsTPSxgh4s1Pm+HoxnYtGEbtWzWKMRhEUYJ1XjNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p74A+sOl7DAz/FC+dByIeNJupwTvLp+3Bi5eknuxa5E=;
 b=Nf99o3beE+liTmtbx5PrkubQE0y+hxFRAtpPCbA2SvRLqETWJ+QNrGUPMghh10OBxQBH+SvH4Qt5XzQoQz2nd0k9y4OCwLGOCLfVKFpif2AeqCPiM+Gq8pQFsMT4N1JJ2JODg4l3Ozi3FkMfGLmLMslYRtuHOBDNcLWnTmbsVqMTBgjGQ+51C4m/z4pixvp81lGs2g1i8iHyFPi2719ZiZA8CJp/kU2q7jrY+SUUXIITpKFfM+mTSvvjcm/SJNVQcsu09WOUyQbN9B3DYSVr4EhSlJGeF5ALl3WQN+EHz5T3wzO4BcjIOG9hKFZzyytkrJ7XHOHlxozihnO3rMLzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p74A+sOl7DAz/FC+dByIeNJupwTvLp+3Bi5eknuxa5E=;
 b=K1BPQ9gsNaRdCledITiDDfpnQb8+HAxATyaYHwPMnNe0Vo5SFw4pYbIEyqRZJbLvxNFqH+JqJzwZ1k0Mh/lH8C1Fk8pVfs83Mdv+YzXYdx8vGhkICSGNsyi7PVHzyFtIBlar+owQuFywwMbqozMJXTf9d7OAGi3r1UCU0MpWr5VX/OoEv96xcqVkmnk+zaeGcOQPib5oFzqgz2+pcMr10UJm1IBOh9syuPQx7VWdVR9MtDfDzmhvz+ZnKko/7i4fiLUkF4PHuL8NnCl6h2sAFdx5NlNQPwLLoZe3ELHjPi/mha3HCyTt5dK7TuQd0n8IxiThaDdtzK7C4OVCxkQceA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 01:04:37 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 01:04:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 08/36] mm/hugetlb: check for unreasonable folio sizes
 when registering hstate
Date: Wed, 27 Aug 2025 21:04:29 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <A030470C-B89D-4250-ACBE-0FBC8D0BD0AB@nvidia.com>
In-Reply-To: <20250827220141.262669-9-david@redhat.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-9-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:408:f6::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: 269f8bf3-675c-4fd2-0ec3-08dde5cedb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d6nO1qiF4FKRrVs/wnxL11pnYyxVbsmIHSoyEeGgJ7Mj+PuH0xLGTo3nQw75?=
 =?us-ascii?Q?SbcwS8dAblH/jCJXcH6aOVjEYDtgD+npkxnhnUAgioV0cXevCObR7vs55wTY?=
 =?us-ascii?Q?06bb52HxKX59Qpgci2AVKByIlMOqBp4g4CTmX9H7HDaVwU7ysfDU0Ou3mpW+?=
 =?us-ascii?Q?aCEEiDrG8JN5QG8WOe3drWcqfVANtwnQrmwWCgdiCYo92LPaCmilCr7SYnQ1?=
 =?us-ascii?Q?DG9D/XdprTfy9mjxbZK21sF8+o0Hn/RiD0nNbhgpfoU2t28P91x5248u3tmw?=
 =?us-ascii?Q?ILvTIeSZrdiqbALezM+nVQdUwNpj918zmlLsfBGsXOfaKKLZMzjipfSXw8V+?=
 =?us-ascii?Q?EiWtIeOtwzC9i0Yx41yYFim3YG8oP2n7vOPtJERZJDZpQwhJY0gwDfxLYzYo?=
 =?us-ascii?Q?BGoIwjxd9/QjqrFaCHvB4ohvwOkFaQBps1SQ5wnUa93OCzPo/M5WD5o42s5G?=
 =?us-ascii?Q?40I9bmH3mYMH6wtkl6DWauio1x2hAHZuJDko4kaL5Ch/D0R4K2joAJVLSwp3?=
 =?us-ascii?Q?/mjz83M7BVPVfzrUGGwYwLlVGiF6MpfENcDjgx0usF/0S04qwp2QIVwfEDEq?=
 =?us-ascii?Q?AyY+g5jmZKtSEMxQJdBnO0YC74dBTD9J8BPylmfLLh1BeletnXep/qSdNbHx?=
 =?us-ascii?Q?TfGjxCYjMcnPR/WPmcvgGsJfhBdgp3VF4j+PjMpp3Fr5O5hUuWrGjSL+Izve?=
 =?us-ascii?Q?kyMjXbX0PGKfiD2fjXqAuF+moPL0USCDhKuYbNyBrdKoVkZtxPk8WxVSltn7?=
 =?us-ascii?Q?cpoVBMuQgglATC7nt4X5YjtFf/nWFjKtutEDNGE2h7Bll1D6rrBvZSIKgnzW?=
 =?us-ascii?Q?qYdJhMsLRkoCK9YZ0Y40iAGiS8EfM6/NknqyJtk6AX2mw7LcIYnfNhXjn5MT?=
 =?us-ascii?Q?KqsFINY2gey1t3F56YQVS1z0hmqtpOgPNykBJfDM1Zcq2D5ZWZH7aqgkTFSu?=
 =?us-ascii?Q?9KsyXjuOoFIejLihaGHcqmV9ilimbUUTTvdDOd/ygbHyOucawnVwD7oTYxVJ?=
 =?us-ascii?Q?0GOp3M9aErkAtNaig2jbVeSwiLsSf/NPuCddlc5/zsl+zv4ZnX1WOws/nrQe?=
 =?us-ascii?Q?D4E0QE5vJ/4uMelpSJCtdSYUCBE1iJ71mWdKNddXkfTqvDXJ2Vzy5pXslvsU?=
 =?us-ascii?Q?0vpyh1e1gfVfMZnXKyIPyjkV4N9krj2jRbY/gcxLzG6AFTIQCz3fiEMFuKPf?=
 =?us-ascii?Q?XI8oamhXN3SHv5Z3hcF3lpaBaFwkrAUAyw2d1oyzDBYtin0iinYQiTP7RbnZ?=
 =?us-ascii?Q?1tnnPKJz5AKN8uVmZf5OqWyakHEz+UZNyrJsT1+t8EI4Vqrly/vjqXynBbSQ?=
 =?us-ascii?Q?86Gha6MxBDmPFXmE4gbLVm/9amKGuFfsJjLtbx69PXRhE1OQ+QXf/pIALZIh?=
 =?us-ascii?Q?qy4+GvIdw/gchVcB3IE1ccnKFkfKgpHcQiDYh+eh8ispy1bwzH9qaGxxtcvb?=
 =?us-ascii?Q?WUJ2YiuGgIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?10Xb7/jBdX+X+16JsVz81L+tfOIsN0BN5XnMkLRgDZbnTanK9OVnsY6VvKZr?=
 =?us-ascii?Q?VBZP9TxOtqMFMtDyUwoq+Lf2ikJcDdbDW97DRu6wSy7WnIz1erlNbR/OIojZ?=
 =?us-ascii?Q?jjNHkX70PHGtIJlPf4I27URQuubgZLxehEp79SWfLnx/Dfyc0TkWrm8SuTus?=
 =?us-ascii?Q?xhKx+udao0gBL6CzKIxU5ieZihJWEWBrUS4HKe+0WAFbWCRIi5OTw8+OIJQD?=
 =?us-ascii?Q?XFgGDI7/mjx6qtUsSTkn9ZYbXiG5fC+ooL2o5tzAAhgA+DX64CjoDZ0egix0?=
 =?us-ascii?Q?v7f5cDu+zpmKbKSrk3+ej8s0E6bjaH9eoVXnxcbC/EXYZ93V2dhSwbJBtr/K?=
 =?us-ascii?Q?bzTN414OWEA/1IrUw2RgUEm8LeEOosnD4gnLHryBMjlpjnOaeaIGH2SGcyLQ?=
 =?us-ascii?Q?n87B9X58WG02+fEpqUe6vf9gaij81tw69RQEgXA4vqBfC2NgF4lC08gYMQ8J?=
 =?us-ascii?Q?nRADf9S7T0qWiUqBfnTb2x1BqFNWm2uKdMPkmbgpVpyfXIYqdBoD2QFKL6PB?=
 =?us-ascii?Q?lFFHqJBrCtyYBlX/qxCj/g+QsoimnEH1/rjjtzyplKnlf0BRqbD+6OcfUixP?=
 =?us-ascii?Q?42HwU7fLUHhvYt8pBjzHjDJ6fqgh8CCPzms00qZAD3cBuroPpcXdfINiHEQ4?=
 =?us-ascii?Q?kf86CtB9k4BDzttnV77dB9Mcs5syRFNcjfKjTXqq14eND/jbq6silMK82a6E?=
 =?us-ascii?Q?s14NKlokNklBxKwlXehMfTbfT8SztsYRXMD5IRBkG+Sqasq2x2IrwLtVITQE?=
 =?us-ascii?Q?oP1cn2MfvJ41zUXJJ/MUzqL++WFaelfSFV6fss6TKZtwkpriW5SMV3VNFQZQ?=
 =?us-ascii?Q?wBjmxbwdylcOZk0KYkXfnuQcdYPDvJ3iePuDhEgQqpaSLjfiEoobY38RVZ8p?=
 =?us-ascii?Q?V+X8j876ALcr0Q02JKSs/8os8npZ+Qu1J9sMvMJqw9Y/+fI8z30Gx4YiGEuR?=
 =?us-ascii?Q?pS0yaolp7rui18ecYDAxS04UUiXJNwvCe3Mzb4u5DpDu8ZRdNi6AFcwM1jHz?=
 =?us-ascii?Q?FuV4+rY3yKOZ5kclKySAd8qr1FjpwMpQ792hmkd2dJiLvaXM97JPOwamUTsH?=
 =?us-ascii?Q?rXK6WG6BVJY9AReAjnO8MGYtSLTO4KU14EcT/YYPR4I5DHBwxUHEMdvky8n1?=
 =?us-ascii?Q?n9YCui7DO1UQwBprWNUN8h50RlYsKG5VsP52dvg1ZU0BFAqnBgxpEDH6KdYg?=
 =?us-ascii?Q?NGkjRumj7LT6FYhTJ0qN4aoTIM6cQDR6F1igLQjc0RVctvrnxEx8d2RdroSO?=
 =?us-ascii?Q?naOhTF3gc0OchFFEZV+SYaa7eXZaxFOTx3KmOfspwLso7I16tkW/OvJXg867?=
 =?us-ascii?Q?lZDzZZavhsF1Oiw3f+JhJ+YEugAKfVo5+r2ZQP4FHCu3LlPEHPPZlco2G7Tx?=
 =?us-ascii?Q?+1c0rd1kiiXVOSwB4MnGK1Fmk3rlQEcI+LHyDSXaMjKSa2bgHyD47E1sW1pP?=
 =?us-ascii?Q?dGHnblCKm7ql8fw2Ke62M6knxpHEtsHQLNLTP0z2Rd5RoBp/u6/ewSYytoTW?=
 =?us-ascii?Q?ymu27gXDazm0h5WnoUaqY7XzIqxi5656NkNgHxKZKMcSTeX5w2Fp9zcwgbqX?=
 =?us-ascii?Q?uIfhMIcwX+wZjt2hQYmypQYXSwLn6A0t1PZsQR1m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269f8bf3-675c-4fd2-0ec3-08dde5cedb94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 01:04:36.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeLUKWyXuZ9l/CVncUADOtX4g/h1zPNqduM41PIbCyxxagmVfuulCnmu4a+VCzYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_180505_272145_A95E8FED 
X-CRM114-Status: GOOD (  13.26  )
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

On 27 Aug 2025, at 18:01, David Hildenbrand wrote:

> Let's check that no hstate that corresponds to an unreasonable folio size
> is registered by an architecture. If we were to succeed registering, we
> could later try allocating an unsupported gigantic folio size.
>
> Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
> is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
> to use a BUILD_BUG_ON_INVALID() to make it compile.
>
> No existing kernel configuration should be able to trigger this check:
> either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
> gigantic folios will not exceed a memory section (the case on sparse).
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/hugetlb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi


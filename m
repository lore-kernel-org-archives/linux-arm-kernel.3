Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B7C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 05:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yAUWnPMrzJA4nCuRp4y3FoZB03rY/GFxph8++0ShKRQ=; b=k0dpFKUW2qwlkizjg8dMzcSKtx
	X5P8Ngxvtv1CaYX/RBgr2G2TKPOTk/iQlun8jEieyP9JgynLOuNztX/7AaEKHEtCf5yqapQEw9wej
	bkRLIaKQgZoOQFkjrw3j9+hAYpczI9072wGRWj86FtJ83ZZXSSiBwg6ADy0Qi7G9kdPUgEQ3vVe9k
	nfdukfBmt38nNoMIDNFbf8dKZoQlra5XMV8nG93JCGiRDEB0bbhHMz71ZDPK+iOWC6bR6FAhaJd8i
	UTd/lmfyLNBtWETFsTd155yl4B2NfJw+aQgNrCSM8C6n1F+PFiHgtJv6FQYNMW90OqCZ6xyyGcxl2
	ER6KKo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9BC-0000000CCa2-2ROC;
	Wed, 28 May 2025 05:18:18 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK995-0000000CCUT-0Xkp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 05:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748409367; x=1779945367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6bn6YHQxq3foBchlGAsC1qhptfxmSddvOzXsEMIqBo=;
  b=CstHhHLUATp7yCd6i45j7aymFduLJnRaF1HYX6eEyp2Q2V8vvzDC3cZB
   fUEbh0PiI8tWhv9RasQyaAtRJtny6FJvKhMaIWL3qoKaFcwWpuY2DpLzA
   R3fsUMDkvwbajkheozabVxghVUfrRwZbkBK1JqfuZNs+7BjAa4/8GerjA
   87HEUsQHUD4kpj2a767/RZYyFBzxyEyRFi4ywx6HLg4bRErdvyBJGDXX6
   oE+3YQojz3MCzqwsekkxMm3k+QuzT8WieqOx7xwjZ84SycuDA6BHdw4qi
   26exm+2L7ouWvcDFJDPRUr8/+a+ZPjgXU5VM38ywSqSPcCYzCD46TE7Mm
   g==;
X-CSE-ConnectionGUID: Wv1Heu6XSZiuJyNWOVPtOw==
X-CSE-MsgGUID: dVLYFJi9SGCU++dHh4xe+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38042272"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="38042272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:15:59 -0700
X-CSE-ConnectionGUID: 5Pe5RguYTxeE/6TU+5YV8w==
X-CSE-MsgGUID: jElnol/nSyab5t7NeV9ISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="174118440"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:15:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 22:15:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 22:15:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 22:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2TlZxmKCbSdaef+/Sz6X/9iXS/DETVIiQiarog7E/B4QregO9vgIuzNvsVQ7E7rY3vpJAheNO0Ddw6X1Inp8z2zGrJQ0WjkGmUEDVdcMQnUUS9g4pM8ckj2+JfK49nTIfRUUgZwvvQlqKKEW6JG2gYPmoD6aHwGf2wjZfJ/D8gzfJCbOTr1zNmi9ogvQLLTvvpU9OogLxOmieFgEFdFXukmN/6+SyKJrNtYvcaDEEIeDtwH0ZBk19F1NV61rEShPaaGmTFXIK6wooQQKKGGqgnihJY1riQ4mvIxG6RtPHdMwZye+V8PY8+NyOiQ0eBpdaVphbPtq8RMwpCyJ6oY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAUWnPMrzJA4nCuRp4y3FoZB03rY/GFxph8++0ShKRQ=;
 b=E9nyGxFK6dQ4PivStEm4zulyEUlAH6mOGGeRxrheTXSf1dlj62GCeWyzUe7DRr0j8gXESlP07XfB79GWCK1ds76IOPhCxf097Lq3TounKVjZFVIu6ukom0ezN+C7QkICQq/cK5fiCDx7++oqE3XoTuSShrFNoeOm0Hx0kNcbquoUaYltyVUuchEe3XVb64LxznkGEmat6U1zBCQday726a5RaGeqhPSHC5kBzKrQrLd3DsXzgt+hum7v7TpgaPE2jjPSKPnEnygJ/vzWY5ul50gd3iT9vDFx9FllQOaehFvG7pk+HGYcPoVvgR5MGU/n66s+BEPhtly1PF4u0f8wLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 05:15:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 05:15:15 +0000
Date: Wed, 28 May 2025 13:15:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Eric Biggers <ebiggers@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-s390@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [crypto]  40b9969796:
 UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
Message-ID: <202505281024.f42beaa7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dbc30f-41a2-4627-2d97-08dd9da6a16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KhtYxOYiUF8F+gR//w/ELJZ9zEzzvhrvpHuf2tOevAW89nLkpNBHvd+8MUOV?=
 =?us-ascii?Q?sli59Cz1ttt+4h5yQgO25gIbr7KRtEt8ZJHhINffDHcYmTTTRAAiqrr4yz23?=
 =?us-ascii?Q?6Ni7JghAqJyiSQgUHQZzs+GMUOk4KSJ14Pe/PQpFvl/vPW/uYhGnagsBMRFe?=
 =?us-ascii?Q?bNpygVwVqHhbhnHBhKh0+aC+q3lDPFcLDqy6ApTmG2sb4Yl9CZsl/5qcWT4g?=
 =?us-ascii?Q?y3kpFjbVeqyg7kn0gsZPpBg5uudMFPQCo6qmEKefqJA0PGpfF9GsvMbnOR+u?=
 =?us-ascii?Q?vr5bcGS4QA3D4HgMXLZDzk2fcRa6pnp50nCkAw9xEr18ps50xjyzx63GIUZG?=
 =?us-ascii?Q?uB5PLc8Q7aVYGxvjZ0EX0/+EVHH86BectxTfvj7FAeyF+2wVKPYwCx0oXLBD?=
 =?us-ascii?Q?s/cdfM4SN1MCgXiV4Riky2SOYT0jCzY9RnkJBUvKFCTLh+0VaMWxMlRUakn6?=
 =?us-ascii?Q?fZ2ejKwXMwrCEXzZ0yfgFMj7JY3Vaq9oC+oCGuSa5j569j3PaIK5WWK+pZMq?=
 =?us-ascii?Q?anZ5+dHwZ3FygVr5gv+EGL8SVkigthUV6iy2HRoBi71UhCTcJkjRIhIMW/gx?=
 =?us-ascii?Q?0gh9b22LmNNhTIsLPaZ7KkRuNtAldJVUOawT/nQmtL/JZH5vnuHoEjioJUMj?=
 =?us-ascii?Q?jyDW18BBsC8Yb+350Igxw1n8s/s/dwj4BILrcXRorJ+S6fSRVeYKQnNViBtS?=
 =?us-ascii?Q?pEPUtexc5nrgKAvK3pg98cuz+xdZe4vfR0L+aK1ryCDGWymtJfNc3eRO1C1S?=
 =?us-ascii?Q?YnScui4AaNLoBdLT+o4lc2WykRuIvMUKDu1QaakubmHBvU9gZ3kSFqV9TRyw?=
 =?us-ascii?Q?R5hAQxnz5S9jS53twqJiFJGtTlFRXKwW23GHVY/FLgRnNLAqCBRC5AW/g2ei?=
 =?us-ascii?Q?x7NGXaVPMuaBw8sojo18hZ/fGFQMwjrvMkPO/jt+OZERCNc3W/lVSUA11pFM?=
 =?us-ascii?Q?2lxVQzZKFwCxH2T0aIfU10Y9tjZUcJbYgi7oEPh6s3ShfnSnqLWeLXa1ZKzq?=
 =?us-ascii?Q?al/+E/BxzxriqaoKLEwRxlnWGnfUmTeXlcWla3jZOaemu4bLjRe192KQgBv+?=
 =?us-ascii?Q?oDKvMnqn14I9ZC6k18tgeHtbIsAyOE4b9SlaRYV6IzSbKbMVsRw+qfMtrfN4?=
 =?us-ascii?Q?q3zzd09Pr9src+pJI6OQwXUkr/DDRe81RUxQfgxXyKTTTs6PZbeq/k8wnnjr?=
 =?us-ascii?Q?TWgM/xw4DB8AZ9+Erm1Q2qcLRPZ9gNORYqnDgbfyNsQu/sj8ySfoEVDiGebQ?=
 =?us-ascii?Q?W/mCSUBo2sJeEwEESRslKD7xS2gmpj6l7WjeolE4ySmyO6rn0ZSauaCv5LNh?=
 =?us-ascii?Q?php0idYCGKeAFQR3u8V9Egq/7scnIxwX9YAsEeOWluQmhRkKZBYWLly9l1SC?=
 =?us-ascii?Q?4zOPAaX3LzhYrIYQVXCp5yRq76qv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3h8BYKWZRIDO0Y/AEUIbK/OJXffyIiWSLWjGBbMx7hYPPmdZnKS6VyvCUzo?=
 =?us-ascii?Q?ngEVHpdEeBi8GTl8Didre8med0vPx1ufrsIsY0LlP6jib5Kelu5F7VPOFjZl?=
 =?us-ascii?Q?aG0GkYLdZywAmFHNg6q+6vF+mrMu7V7CIN6e4ncAJqJTvmDDFeNwrfXMwL+O?=
 =?us-ascii?Q?zUVHEnUc391LwM3lpzzjp8wPkfzLPTylj6jFhKnpcVZtf4L3phYj2+YQdQng?=
 =?us-ascii?Q?fnA6I9/BpFHwB4FD0Uzxdsh5IkvD4MrwS7X3Nb91LRQAj7Kvtxyjq4nfF5lv?=
 =?us-ascii?Q?YqcOPx2rZ8qK6zJ6PPMscQJdFtTJTZktrh1Zlc7od3qNEoTSu4wcghV7acYj?=
 =?us-ascii?Q?DRG9QhLfvFs6a41tfK/2uEtwgazlfbm8ubLlNFLxT/dZXsT58Y4wiHHj/4bi?=
 =?us-ascii?Q?YzMkf5YmiTc20SzVWVRCqN0QSQZE40kxvjT1pJXL0Vnt2/zRUSoN05UgDGeV?=
 =?us-ascii?Q?he+QO+5eCfkhInZqMamgQRguBoESMaxQ5BVE5hMXZ/ccL5l5TnHdMniLU5Yy?=
 =?us-ascii?Q?L2ZwZ5WgECqFR23VmIWsCPhGRrJNjjhHnJEoSfKc9sXO3KUcr5FuGaSycl3g?=
 =?us-ascii?Q?Y0NzNth/3uNYPcx49yK/3+l55KN66+lE8CjGw1j11IZBIvwKyS5PL32m6Nk7?=
 =?us-ascii?Q?BnGZtkgKSUJtkD4DNHqMrOGWzn+JR6uhrDTcxaBbdvrRG6jlocvq8zOyGWZF?=
 =?us-ascii?Q?ZoDEFYo7wQnRPIt+hGCVzaHYR6YVHPef65NwB3euKNfb36dM4oyW4KvH8pdN?=
 =?us-ascii?Q?FDiUSHQXKfCQ7fzoXFbRf5U/at/HYCUQGEbbixFPrNDdZDfctE/nQSMrJ5jB?=
 =?us-ascii?Q?ggCStgY/I1nYoEmhoRJ7R2D+xsP/9Zh3pYwgIb6WzLAK+uMEAyGx90ub1xDL?=
 =?us-ascii?Q?5N0tiOnyqVgmsfj8xd4O2AF6ywO5RvLeeYC2zjalZ1MrT0g7y0IXcHqCod+d?=
 =?us-ascii?Q?NHxaOFqvaTRx6GcA0VDK+BISlIkFHKyUvNf33EJYDKZdta2euTSUIKiMKj8O?=
 =?us-ascii?Q?duC9VvfEgvEj7qg3oRvWMDsA0NOekC1YQYoBpsjVvHTgqOMVisXG/DuM3Y+q?=
 =?us-ascii?Q?fk0p93hNpfUwOn9qps+lh2alKWd7IEKXXF3umuCw0CZvWowp7E8dbrHqytdg?=
 =?us-ascii?Q?KX+Le9dFCBsKc/3J+4lcD4KVlPcyza6p7YONIwS6jQhq/n1P3lT2fH1cR8jm?=
 =?us-ascii?Q?NV2G1joY3U94Y6mnKrQ/mW4OT58lvy50NolY2ojdgatPKzkB4pbrXIgjp5VR?=
 =?us-ascii?Q?eIc5Edx1Wb66jlGYoYoStEFAX30cyHO0ySUH0KAqdxCBMHRUG8tnRUx7Qn/I?=
 =?us-ascii?Q?FG/I0Q+uHBbWEEz/j0sJiAmBptXOWtXY10Yf+8pBDDPr4nT7m39rnCx7Y/kk?=
 =?us-ascii?Q?r5BNL+SUwncPXN80/4y2tD1a8h82VAdHJ3USU7BqdDy9DP8J8aSMwqvVkij7?=
 =?us-ascii?Q?kyG3MrlmxCWazEZf0NFhEspoURt2ULbIYc3zmfr+JTfaYXIp1q9T4qlXpcJK?=
 =?us-ascii?Q?nw91ueUlC7touuA3xyMvsiJJkOgDv4V+2HrPkiUOYo9B7jUyD1O8E9LkL746?=
 =?us-ascii?Q?9JgrEbEk1RKpi4mFqSBoXzSYzkj2SzdLHBob++mPcmy0cM99x1IOWS4q0cZT?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dbc30f-41a2-4627-2d97-08dd9da6a16c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 05:15:15.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71Nbx30N8e3jl2EcRNcjxr3bgiZJyAEaZ7EjCwJBQI9m3w4SBBRWBpmw4Xln6YSXL2LK9yc9cGqyocgFYKQzTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_221607_200352_63CEB38F 
X-CRM114-Status: UNSURE (   9.65  )
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



Hello,

by this commit, the config has below diff:

--- /pkg/linux/x86_64-randconfig-101-20250522/clang-20/d469eaed223fa485eabebd3bcd05ddd3c891f54e/.config 2025-05-23 23:44:56.781716572 +0800
+++ /pkg/linux/x86_64-randconfig-101-20250522/clang-20/40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c/.config 2025-05-24 02:08:29.858605300 +0800
@@ -4837,7 +4837,8 @@ CONFIG_CRYPTO_ACOMP2=y
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_MANAGER2=y
 # CONFIG_CRYPTO_USER is not set
-CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+CONFIG_CRYPTO_SELFTESTS=y
+# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
 # CONFIG_CRYPTO_NULL is not set
 CONFIG_CRYPTO_PCRYPT=m
 CONFIG_CRYPTO_CRYPTD=y

it seems tests are enabled then we observe the UBSAN issues

d469eaed223fa485 40b9969796bfa49ed1b0f7ddc25
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     dmesg.UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
           :6          100%           6:6     dmesg.UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305.c

it's hard for bot to apply this commit to previous commits in bisect, so we just
make out below report FYI that we observe UBSAN issues in boot tests.


kernel test robot noticed "UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c" on:

commit: 40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c ("crypto: testmgr - replace CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 176e917e010cb7dcc605f11d2bc33f304292482b]

in testcase: boot

config: x86_64-randconfig-101-20250522
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505281024.f42beaa7-lkp@intel.com


[   12.442846][    T1] ------------[ cut here ]------------
[   12.443261][    T1] UBSAN: unsigned-integer-overflow in lib/crypto/chacha20poly1305-selftest.c:8854:47
[   12.444084][    T1] 16 - 114 cannot be represented in type 'size_t' (aka 'unsigned long')
[   12.444682][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   6.15.0-rc5-00342-g40b9969796bf #1 VOLUNTARY
[   12.444688][    T1] Tainted: [T]=RANDSTRUCT
[   12.444689][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   12.444691][    T1] Call Trace:
[   12.444693][    T1]  <TASK>
[ 12.444696][ T1] __dump_stack (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/dump_stack.c:95) 
[ 12.444705][ T1] dump_stack_lvl (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/dump_stack.c:123 (discriminator 1)) 
[ 12.444709][ T1] dump_stack (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/dump_stack.c:130) 
[ 12.444712][ T1] ubsan_epilogue (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/ubsan.c:232 (discriminator 2)) 
[ 12.444717][ T1] handle_overflow (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/ubsan.c:?) 
[ 12.444729][ T1] __ubsan_handle_sub_overflow (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/ubsan.c:277) 
[ 12.444732][ T1] chacha20poly1305_encrypt_bignonce (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/crypto/chacha20poly1305-selftest.c:?) 
[ 12.444759][ T1] ? kasan_save_alloc_info (kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/generic.c:563 (discriminator 1)) 
[ 12.444766][ T1] chacha20poly1305_selftest_encrypt (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/crypto/chacha20poly1305-selftest.c:?) 
[ 12.444772][ T1] chacha20poly1305_selftest (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/crypto/chacha20poly1305-selftest.c:8903 (discriminator 1)) 
[ 12.444787][ T1] chacha20poly1305_init (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/crypto/chacha20poly1305.c:362) 
[ 12.444790][ T1] do_one_initcall (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1257) 
[ 12.444793][ T1] ? blake2s_random_test (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/crypto/chacha20poly1305.c:360) 
[ 12.444801][ T1] ? kasan_save_track (kbuild/obj/consumer/x86_64-randconfig-101-20250522/arch/x86/include/asm/current.h:25 (discriminator 3) kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/common.c:60 (discriminator 3) kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/common.c:69 (discriminator 3)) 
[ 12.444803][ T1] ? kasan_save_track (kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/common.c:48 kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/common.c:68) 
[ 12.444804][ T1] ? kasan_save_alloc_info (kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/generic.c:563 (discriminator 1)) 
[ 12.444806][ T1] ? __kasan_kmalloc (kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/kasan/common.c:398) 
[ 12.444808][ T1] ? __kmalloc_noprof (kbuild/obj/consumer/x86_64-randconfig-101-20250522/include/linux/kasan.h:260 kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/slub.c:4327 kbuild/obj/consumer/x86_64-randconfig-101-20250522/mm/slub.c:4339) 
[ 12.444814][ T1] ? do_initcalls (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1329) 
[ 12.444817][ T1] ? do_basic_setup (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1355) 
[ 12.444824][ T1] ? trace_hardirqs_on (kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/trace/trace_preemptirq.c:80) 
[ 12.444829][ T1] ? irqentry_exit (kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/entry/common.c:358) 
[ 12.444834][ T1] ? sysvec_apic_timer_interrupt (kbuild/obj/consumer/x86_64-randconfig-101-20250522/arch/x86/kernel/apic/apic.c:1049 (discriminator 256)) 
[ 12.444840][ T1] ? do_initcall_level (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1303) 
[ 12.444847][ T1] ? next_arg (kbuild/obj/consumer/x86_64-randconfig-101-20250522/lib/cmdline.c:273) 
[ 12.444853][ T1] ? parameq (kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/params.c:90 (discriminator 1) kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/params.c:99 (discriminator 1)) 
[ 12.444858][ T1] ? parse_args (kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/params.c:153 kbuild/obj/consumer/x86_64-randconfig-101-20250522/kernel/params.c:186) 
[ 12.444869][ T1] do_initcall_level (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1318 (discriminator 6)) 
[ 12.444874][ T1] do_initcalls (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1332 (discriminator 2)) 
[ 12.444878][ T1] do_basic_setup (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1355) 
[ 12.444882][ T1] kernel_init_freeable (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1571) 
[ 12.444885][ T1] ? rest_init (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1449) 
[ 12.444887][ T1] kernel_init (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1459) 
[ 12.444890][ T1] ? rest_init (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1449) 
[ 12.444892][ T1] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-101-20250522/arch/x86/kernel/process.c:153) 
[ 12.444895][ T1] ? rest_init (kbuild/obj/consumer/x86_64-randconfig-101-20250522/init/main.c:1449) 
[ 12.444898][ T1] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-101-20250522/arch/x86/entry/entry_64.S:255) 
[   12.444909][    T1]  </TASK>
[   12.475589][    T1] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250528/202505281024.f42beaa7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



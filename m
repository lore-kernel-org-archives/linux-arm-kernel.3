Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSQH8luvZHWK3XmXpx54WI+KjCic9g3q3TJN0ZpiZHY=; b=DCsE9GLo0xKLq85uOBQTmZ4dN0
	9sOWRoQGpuS9rsZHM4GXohin4LmrpL/urNPNrCJ/xeCbuJdxFiIWhOeZAi0cxUT8oLc3uaoh1fGGM
	VyfEdjBgdZZTJT9qF2lX7m3exPj+pIwOBH/baMq/6I+M0RzaMj1xzck0ZI91T9hrcToft0ftChREt
	beHXmGXO65YwJK+bQUWrDHg1ZjdZABsW1nA+o4ch/n+e7HvRNr/hWnJmJDRdaYURK6TbWIIav2Gpg
	aMOLZNjeWgVcKBWxA7md0gcWAtqs6pzQLNT3QEZHKUPYmxHoGw7SmkVaTS2TqOcE/7dihangvLGZj
	3kPS2lgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnot-00000009isV-0Jup;
	Tue, 14 Jan 2025 20:47:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmbV-00000009XiN-3Uf6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PSQH8luvZHWK3XmXpx54WI+KjCic9g3q3TJN0ZpiZHY=; b=mdBLsufYX12Pbc8U8eh7u5Cei8
	BW+hmSHvoys7CiAmJmzN3O05HavumT/HUiTJjsxKcFfr/tbKIV3fh/ru2CiVon+fXTOLu8w61Vj4G
	6N+VQ4Upo/yupKSUz3Ms8ehmGScCbPqITq7mtba3btFGNGEtiPB6sY59mQ8o9Ab6CFNuA2AxgIMHK
	6v5Oyh3BkffhXtSUz97lALv0rmnZnoW0Mpv0OIUqGNuLfCWmwPgDKLidexPDBRN7aDJp5gJ73A1TE
	kAUxq3+noN1HP8QYI3J16gp67bv0LKGwkYWBB1vfTK8QvXGJIkElhZLq+DRCAiwudOpLNCgZx/iP0
	KzosVuAQ==;
Received: from mail-bn8nam11on2060f.outbound.protection.outlook.com ([2a01:111:f403:2414::60f] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmbS-0000000AaEa-2w3w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:29:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITVFBaNs49/UnZGDpEAAiWdasqg1+HmeuN9eVSoegUY18aV+gVBCoLnfR74vPvgCbN5FcKN2VRYRxxDtsDtiJwy9MAPVCW3dctZr976Wj+s2/Q/TxkJq9kckQ6mCmpPj2k0H0cs53qM6z3gFn6gXTaG11ncr4/IRydZGsVtj01DCG2voTKzKOzUPp7PVdtktTrpfG0ReFeSmWdvv21A/iU25l6mrk+iwNrqp+DzdzqLVli6YugYbE9tzhH+qxR+1Kkl+EYd8AD3uY+BAdId1ZKXTwAYXzJhJU3SX3vFFDXkQPcdBgJbA9aQ0HmCzbfAwweZITyjYbTkERVBtBrkg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSQH8luvZHWK3XmXpx54WI+KjCic9g3q3TJN0ZpiZHY=;
 b=iLHvD4X9rlKvvw6RnaCmkrH/JcNindcWjTB2Yk/iOqWGdUB6I/CNd28kKmgOk67OIOBsgYiOoiRDhqSUyLshlVd7GhNBktSS2MTRM19KxIX+bbagK+PDxqq8wzLx1AvnuUIglViLEXUaM/Ml2BpA7wwCMGufh37YTjc+5Ukdhhr1sCOtQKAnLCoSbCl15Kjd5H54LZq8DOyeKipgF5gbklHcX/8S5Ntb+Go9yhQ6GWG0YRA5pR5Tg+aZtXhYrmw+mDICbkXXxiGPm1oC5eEOTplxyF36Cj+XfTIAEyFVuExMxttOHW4s/bNhOnSFMZjSx67hhlsuwVL/i1rHsRLhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSQH8luvZHWK3XmXpx54WI+KjCic9g3q3TJN0ZpiZHY=;
 b=if0GHIRMZ8/gPccYus5Rc4IK7N6ebjPf54KlKasu/ybVfSnifqQIE8iVKLfb8rP89NddHN8uflz7oA5tk3o39c349qableshUQvim1R/ziNKnWuUg/QpAq7hm9KpKidhrA3B/7SyLVHdKmN7YisbI9opzTCLc/0LRzn8wpP5hvXQYx8oXbizuAGxRqTjVnxPn9cKwpCvv+AQahX7J2Emgf4lwqsZD8I5WMMVfor7/21/YaIQVwiPRepZyTq4zb0iAggHVEBN9hRHTLnnNV1guuVln9p0haPt/dSJJ6egzeIizUFg0nmRjtn3pHXdA44KDntmCW2ACgdmQdcntJBefQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Tue, 14 Jan
 2025 19:29:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 19:29:22 +0000
Date: Tue, 14 Jan 2025 15:29:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 01/14] iommufd: Keep OBJ/IOCTL lists in an
 alphabetical order
Message-ID: <20250114192920.GA591693@nvidia.com>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <c5e6d6e0a0bb7abc92ad26937fde19c9426bee96.1736237481.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e6d6e0a0bb7abc92ad26937fde19c9426bee96.1736237481.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 52670a7d-2670-46d5-a21f-08dd34d1bf67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U79nyW+0aL0eBONrOKg9AXkjwh61pVl66F+cOKog/6yqcSIf3nZEmMzknKPy?=
 =?us-ascii?Q?kyljYApe7d2/l/iPP9WqRoTSLBTD7x9kM6m4tlkCPBuUogZSoVaWd0ierSBT?=
 =?us-ascii?Q?JM1QnBju2V2JM274ly8dj/Xuj5JDZQ8/bfs8PTbyVTwvJ/NMBdhYpNi/rraZ?=
 =?us-ascii?Q?0zgCxGU5CkbDPyq765cDAxmRcGLGwZy0APWc79oY71y7ga+mCqQClUbXiSk/?=
 =?us-ascii?Q?IuCUVhNLQCTOQyKwF6QZ42xjPoieZw++8e2ROiIIXBwpvwGMF3OZIDYIKauF?=
 =?us-ascii?Q?q28aqdp0UMjQHaWTgGALZAPO/vztzRytXztU5Z6QlEK8rsnMNhosRwL2MunZ?=
 =?us-ascii?Q?qvoMO68deKXTx+4OjEulcgJJPKGjptidSSL9+KESt7nXea5h4YlHt7WnvntP?=
 =?us-ascii?Q?EFs7jb+zMrpF/SRjN/g8zz43BPPQ+iICYYM3PfJcKBUZiiSCO0XEMaeUrGsb?=
 =?us-ascii?Q?lJnsUtHXBbo4PDM5ngq02sQWPev2bstn2PbbmraHCt+LnjJAAAJGQAmXzvhs?=
 =?us-ascii?Q?PQDvqUXBZ7yTybMAdX8DGf+BmCQh76krCDYmEA8CE7rBRm0OlrrbI9J38Q0n?=
 =?us-ascii?Q?5wsF2ty2qJa8P6QIFrhbOoGQ4YsaoK5WUggIuAh7g/qJFc7bYiJrmSG3mVjW?=
 =?us-ascii?Q?ig/zZagjIVe115+wrM1w1ZXqFjW/h0Z/FfZLYuVUufPnLxI4BPnJydudBj5X?=
 =?us-ascii?Q?lkmZa+TduhNTzckOj3pB1plIwSZ7vylzISl/NQ+o1ozlH6iduwp/8WVNRlZ2?=
 =?us-ascii?Q?C16LUFQ+wb0kfxnD3gIP3yexU5L86Iin0M9eYaflf4oaFRaNax6ObwueF7X/?=
 =?us-ascii?Q?ARujDYyY9gYJv6s5NLNX9GtymThxSx5/6WgkzEKcOQxIDVrWCm0aTdNXFLn5?=
 =?us-ascii?Q?9q4RutEXO5HOFt0INLQKUhQ8yNVbAOeFeoInWw/5BFXCUKj8idGQoxiVlZ5Z?=
 =?us-ascii?Q?iA3X5Jnxp6C8qyKZ24H2D/TlCi1Ppp/aCQpwKGFQ4+loE7uH9h4xg4mYaGUR?=
 =?us-ascii?Q?6HwdHnuiV7CEyKMnpZNLVTzm3Q9p5lTQJloM9GjjLcE3m4RiJMi0pTZn68w7?=
 =?us-ascii?Q?aofYNPG7Pu2d4m2YceKE5ZG2K9pceYu/OgGlWT/+xqFgeiKxfwcbPCaimd33?=
 =?us-ascii?Q?vC4K8IP/bxpdGd2q3vuIOejVuZF40LrRn5R9LRNeylZ9Lb1V51ksF5N+hNLx?=
 =?us-ascii?Q?fSSTNijyC2bmbFxfbL0BVzzT6NQ+hEpZotDHKl06aV3JCUdEHQ8AXDNy5iEo?=
 =?us-ascii?Q?jM/Hjd2BHfn4QSeG1WH3XoFgBVVMpvD4MKjZpKLLmj1esuS11RUuSRTIM6Ij?=
 =?us-ascii?Q?3c8x4VVpeewINsFzqL/SXGCfT0IgLguOAScgJM2O1UwIeQdSqYSRDWgfKrvQ?=
 =?us-ascii?Q?DYvHNJaJJseOMUkP2faQ4w2B0qUl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D550avwTjnxEk2mWHPbDFjDvnQLOVXByV3m+C/ZXbyRc5b1W4fcQmpRR8lYg?=
 =?us-ascii?Q?KgYBcvReavFMEmNdxRPokl7+970RC3uZzaDuFVSdA2YoEYb6YckOEcdUWIC8?=
 =?us-ascii?Q?0VKpaZA7zvWhjxzJmv7ZsaX6i2nV9W1GureVHcyk5U6Tb1cyzxr7bvIF5cVK?=
 =?us-ascii?Q?tp9av2NRUcNjMyuT0K16MrBrAUgzDx4sgu2CD0dWk/dRZg3RwfTWGYRgQyHH?=
 =?us-ascii?Q?nmaEqTHqWVR8ETBjkbZ//bmzq04QIztkq1Sqv6m0TCBH29NQ+BYT9RpfSds1?=
 =?us-ascii?Q?i5O/NhoWEjnGbHmzTRB0NtXKGu5MUfE3VTz0RqRXZgJCz7pUlQ/BGcGy07MZ?=
 =?us-ascii?Q?aWFvFQBBKoJMaVH/av3niXTEOqak3Yp5oJ6I1LvpeYTmae3r9GtsqxvS8QM7?=
 =?us-ascii?Q?OjrgXOWDZK1uRAm8TnE3I+n3Q8D5ul1v5nRFmeyZner7yvAmznfR/j+LhmiT?=
 =?us-ascii?Q?9IuvH8LxvVJaY9IqZOCwjHqUKK0vji5/QteBeI1hStJzoKR/W7Omxqc+Itjc?=
 =?us-ascii?Q?CTMwvDKZFITSDpEIBLBMR4LU0SGyrM6/xrbac6J7K3iyNRUH5lN2iEjbBIee?=
 =?us-ascii?Q?W7CvsTK2WVM8KCf98cON2JUUxdVaDK6BsyLgaRDL1jqKenl1xmSwjNm89Y1Q?=
 =?us-ascii?Q?k290pHBakFAbzAe097hMkoSFiH0klo9gO1A2FVKjgrn+8mPHIqrCSMlM2uUV?=
 =?us-ascii?Q?qibXaCTwDeI6cnGP8NSEdQMqcVpHz2ycL3p6Cx3+ZgZ91aH6TptSuWb/bZbB?=
 =?us-ascii?Q?8ZxqFH2pJGoUM0f+fZgrmTjIgdtANmd8XOXoT1qI7XV9XtqouIv5/4RC0Ysz?=
 =?us-ascii?Q?98A2gUcvfFNfetaraC9XsMLPB49ZOLCB6LqfwAaCenTp4DDZKPFaWXPXlP2P?=
 =?us-ascii?Q?T08GYaHrCHUJqJqCUu1trXlXlt7Xn2wcgRU8dDp/pkSK6jg+B3UEiPu1MEoX?=
 =?us-ascii?Q?G1z1EvJDrg2Or5wWJOrPZ0SJ6n67Ob6LYIr5djp1gmamh+WsXO+2Kb7r1+zT?=
 =?us-ascii?Q?GdDtecyGX9Uhn9j1n9JUE4QoQxh5lWpHaeYn+ocgvLN4NMHY9+VW9IZsgofJ?=
 =?us-ascii?Q?FqxIB99b2nVD1plavzAyJSPiRT0yRAGiq6WiCv5fdb04tEA+AizXXCMs0LpJ?=
 =?us-ascii?Q?YgVavdD1yfSMLMEnqQ1pgHhsSJ2rXdDPKWJVx9HsuCDjP52OkqENMFV7mu9/?=
 =?us-ascii?Q?l6KHV2kHLBaLnbDjP/vepl7KS47BexY9t2pSUWT2ZNHYLj7FzIl21q77EYxv?=
 =?us-ascii?Q?cgxb4C9Pnw57vHZQeRDLfsYfEk2IkJzZn/4VzG8//vkxYKh6kBA5aAUdq9Mh?=
 =?us-ascii?Q?Ylxs4h/qUc0sNHp+4T+uomZ16JDWlaJ6Dfvfz4ulpXtOeMpJ6ZiNYvEFxF8v?=
 =?us-ascii?Q?6iXlJa/NC0avStnVtUNt/AtcrnRewMSjZsxOi/1n8UR9/y9V0SacDm5qAgHU?=
 =?us-ascii?Q?8NfJv6HO9+vekhqhKrFkVleIGY/Wax0uCwUZSK14DkKDFWHCklq/iQHYEoI3?=
 =?us-ascii?Q?M4WOlS6dg0tT1pYpRE3aakatlUhUnY/rXU2nDw/BVDU9cSq3gPlHF7GdtWqj?=
 =?us-ascii?Q?gFA+W9ftl24tjS+TCUfbHaKGbI3VfPYCsuoa9glL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52670a7d-2670-46d5-a21f-08dd34d1bf67
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 19:29:22.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZpp61efs1TH+oxSzPLUUrO4py7xNGLKDmu5aW9Yx2F17WXJgwbcK6sZQK9k73/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192930_920861_B8D3E9E9 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue, Jan 07, 2025 at 09:10:04AM -0800, Nicolin Chen wrote:
> Reorder the existing OBJ/IOCTL lists.
> 
> Also run clang-format for the same coding style at line wrappings.
> 
> No functional change.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/main.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)

Applied to for-next

Thanks,
Jason


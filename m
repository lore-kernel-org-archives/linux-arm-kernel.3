Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E0DD3B7E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4PZD4LIEw/Zd9cQgt5pvY0modwVqcii2Q0YHqx8ieM=; b=nC4dWRqcxHLfNRvU2AfGUoLEiA
	vKZHrIeHdxeBkl7/otQAy9GiR19f0YlceTLW28ipF87fg+N8cSpGEDN4KWXF+JMj0g7ya7VGvguki
	ziF8z1qNN95QLHqcGOKGkexWGPojoIFjy4lathS9ICp4VxzsMIUTqTm8UnEf7z/HA62QuF5bCdj4H
	r+DMe1owR9HwXyIRI0Z+p1SCo6ugxMKe6UFXYi8K8D9n9P8bhm5glLzBKxtIybdxXsIlCtnYiYeYM
	BZuiWMIms6v1qqYU2uR/i6QKnDg72wHti0VcrOAwFAOsBqIIvJyKHMFjfeyJWXuyR7teIJYjx2nFj
	usGVe1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRy2t-0000000BAOi-2Bcc;
	Sat, 06 Dec 2025 19:34:19 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRy2p-0000000BAON-3akF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 19:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EolwdZRqd2KbzHKdiymJvSyNZ2dOpFkg5Pm3L9t5RAdgvYi7FK8j0Uou4H9QLhxgYBtQPcGQdMhXqZr7g5EuYqMutQFihhr6VdBwujZratFhmDKVlqiBIHqX8dBMSxx0CAPXJGjCgZ7pO+zzrofJYiYnEBjgv83ND9IYAxLriaOC11bZTedAYPX5Qzumd/RnuopO6yglEjmBChyZI5tAcsEy10cIaVFhGCjgvyi4tNfK49gD3dlxqhA0+YZEFEojMoVlopvov8+Jv6u8PwgUwGtPb1poc+SotgLfzOvFfolhahbasHC9Drq7pPWGNJbeI1TIswc6rm47IDWwxf5Mrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4PZD4LIEw/Zd9cQgt5pvY0modwVqcii2Q0YHqx8ieM=;
 b=YdXsaiDsarV7hiOvDt8dz28mUOU8jKwqF19APc1EIu1QDRYvIYuQ2IpgbQz6SXiN1G78dbhOBdpAG8aNYKBRgU3veYH03XVjymbbHIC1/xjvBFPXl0ZoVLh3FTLXaeyIkHR2tPwTCFJkQ8TnIa9bv8rMMpUiU2ZOmIQGuiYCJH9gnsLl/Y7UtcxNIlRsTIxVKvD/FViZ7YqdqU89uSPxYP5Ugx8bu6jRJTSj95g6afa84MjFa8PtI0GSH31+FtuyhpplUgdPH+1D3FZzEoHDY3CM9wkXlL6awrHqcfKIiLy8QNQgPogrz0YdGajDlRO5XByBeg6LJ9azwITM7+dXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4PZD4LIEw/Zd9cQgt5pvY0modwVqcii2Q0YHqx8ieM=;
 b=h78Gy9HfWA9zDoed48scLP1ZBRk2Mditm1k/I6p2GVX+A0MRIIdC0zhTMaZ3ba64v/MQuVkJnuiZpqMa8LSTB8WezYAmuQ0BLkhhiKms5C1khYxBNuP1l/gZAwPz8k8r/cVViMVCQdh9FaJ6IZOtT352eIc1tZ8MFF+20zVWYXhzwMa1Rq11P5jcLJguSUc7/ojZeyr6o+HQ3z1A5+4IE9HQGOL/3lv9195wtLT74qmzAkJjFZxChcSTkMZXqTrGOqvTqYIGuA2Vff/8KHrFkST0uJcbh5coxwD/ui1CGp8fzegr9ogL3aTQrEoaaNntwg+8xgaox6zFickKU+xMJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 19:34:10 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9388.012; Sat, 6 Dec 2025
 19:34:09 +0000
Date: Sat, 6 Dec 2025 15:34:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com
Subject: Re: [PATCH rc v1 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
Message-ID: <20251206193408.GD1219718@nvidia.com>
References: <cover.1764982046.git.nicolinc@nvidia.com>
 <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::33) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 161f9a59-4ce6-4d02-3c69-08de34fe6d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IbtA0nosSqGnWCrHRh+Pgs25ebBr/zXdheZSB+NC/Fi5t7JMysrjcav1wdmS?=
 =?us-ascii?Q?A7VcJ684PyCf1x8rBOuw2jbIaW/LswQ0uKpCDsyvffM5GLBBrF6LWTZa5hDT?=
 =?us-ascii?Q?Hy/Dp2b5F9BioAMA/x5Blav3Wxp/S0OtgugkmXd+7Qap4H3i1hBaFTZsOONH?=
 =?us-ascii?Q?kkszN0OkjREYiV1bgWmDRo1TmNy3Z1VNVRGB6TqZV6Aez83JM/XSOlIlD2/O?=
 =?us-ascii?Q?OKhwpchZ0HWDiiVQp7Z6OY3Z76E6ONzyZBREjCMAeqn6K6s/SX+SBZs4Lkea?=
 =?us-ascii?Q?6FQVZmhqXdQI4bdYSKD7Bqq+i1LYlcqIkbQQyw5CXgD+0DE4ogKLhEl9Zmq2?=
 =?us-ascii?Q?9jLiSmfOpMl6cSMJJo9AbdVGMNjzVlxAZomzhbdIzky6TaRKyOz238UfRvDK?=
 =?us-ascii?Q?FrnOCjii2Zp5vdJmTxNNjk3rKjarVECo0kr6s3rMoW/aVyJX3Bmgvt1o1X9k?=
 =?us-ascii?Q?mAWP1RO6btjB0ZXf46Sx2zhW38cTcaLg3u9evqvieDXI9Bo+GlaIomAUgMnn?=
 =?us-ascii?Q?T4fHMLT+pp9npMfoXuZG5kwu248+xiDG6aJjsMlb02ehhh1UQqHGITP8Aj0N?=
 =?us-ascii?Q?OffylT2pi9y7ZTML0vjMoYpALZnMur9cyrNwcYE5MB+exlERhREfFmv/SUKc?=
 =?us-ascii?Q?u170O43blwmE9e2siDcQSayqq/D/syW688E4oHlHrCFrjrHjNW/Cq2FZ/7SE?=
 =?us-ascii?Q?a+JWYaLfk/ruNSNTK9n4Hnz6hbcQSiSOdTgiR1PS3eo4IvUk16XvWuyJAmUU?=
 =?us-ascii?Q?sNmb13lAEkDCU+TMxwcvPGCBX5ZoyyIgf+zqvFLZwgmlAzyB0uxT8Qlz6bno?=
 =?us-ascii?Q?Im3nGK9Ar0RIiovWSnqVy1C5ZHBzEAMjRXRXwocUdV4lwquLIfoCvxIrxhSx?=
 =?us-ascii?Q?TPSkUB4Y6FTAYC6SykmGkvXtG6tJk4KeN4vSv/NhlzhGgXkVdontEsShibSv?=
 =?us-ascii?Q?IeIDGY18FnBx0+h8SodKhaKTCTf5ec/H4UEgI+XGDaHuMm5n/5tZWmIfnKWT?=
 =?us-ascii?Q?hybA6Kttuzym7NYjwlP8C1J09wJf2oEDt3Qb+EVl4vjmCvqi8YKi4/YJJ1iJ?=
 =?us-ascii?Q?yrmJUDL94ugy3ZsTIJ7oie2+j5DlwGksQnoPxgugPwQoD0vwSkn+E7qgMeez?=
 =?us-ascii?Q?hiKuCbgxuBaMwOdgfli1EHTQDc//kV/O3h1DLtK7FLEpDN1MRhH8pQ/gJ0+2?=
 =?us-ascii?Q?ZABl+GNDxeFghSh4mYLSVFGbEGX4BgDmG3g3Z0mJVzvZX/ZO0pn2SZYkeqcr?=
 =?us-ascii?Q?tCsjBdVIKrfP8qM7wOT1NiTxJRVNTRnjsR7DZPbUKIl0Guux0hCTnKbAiSYi?=
 =?us-ascii?Q?m2uW+496PgE8vof9qNVdlntjE54D5xVHSMXkfDtv/p5vXBwz2xut40ylWxi0?=
 =?us-ascii?Q?2oc+fgah8CICtwonACvj7IvvYxlIgEy2x3rQhxdyXGgqdTD4FJvmU2FGCDdi?=
 =?us-ascii?Q?1l50TwIGRZ0GOQEyuwVSpxYZw+udsW4g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7I5ypr4FizFdJrymsE/dPVQ60joNgw102iPHjRY6Q4dSuAtovbzvnJPNKUCA?=
 =?us-ascii?Q?UaIp9gz1qDzilKk/IyH0cyWQnmEZi1fE/0Sc/UkgcCp0mZrGE9DcdrO0whCr?=
 =?us-ascii?Q?RRcc8Zfuk9J61+rHeiHzthtbkqPNju+Z7mOrT/B6gDg6bASoWlXkzc7Vrkoy?=
 =?us-ascii?Q?fZN7X9HaHhryeSdxjBv706Y206K5x+gM53QIFigKPYbJKil15+gESLnwku58?=
 =?us-ascii?Q?0tdSTyTxadLkTqtNhH8w+hoeLY09mNw4TMGB2aeVfOIhLcqsMZZLT3Usyq3p?=
 =?us-ascii?Q?fb6WBVCd9KxxMZRZw+Os0cUZ/75uNBPYWA9m68iz4KIqUDK2qpHfisLDRc1J?=
 =?us-ascii?Q?8mH3zYnAKPkbqmiYTImqagaWo2+bdGYZRbsm7MHO5PTf2zBp8180Q2x3SvRO?=
 =?us-ascii?Q?HEFciiLtdrhENt1+uqhBmKoNdtJu9ZKtUcP+apZP39cg2IWNwtIC8XQp+Xlg?=
 =?us-ascii?Q?Nyvw0VQYveRNcQChM/75UmbA7GzvDiOe45wLmLIUoEQzX8UUI40MXpUP78wx?=
 =?us-ascii?Q?ST5I1+wJY5Y9EZb1Zv/onRFMdpGLixKweqHKuOOpT6Tc1PuqpK1orgbsLkBG?=
 =?us-ascii?Q?Tu7oRbR9DQLyh2dvK0WrJd07Z7G1chsvuET+aI7fA0OUER+0n4gcEghD612w?=
 =?us-ascii?Q?e7Lb03DOzQh1vVKFJAi1eFaDJSqxday/RcOi8HwBr6deWXXmM9MiHB5du7xh?=
 =?us-ascii?Q?4xCkb+MIH6DCxp0N5np8OA+HGlHOQnPxPV9M+E5dFONLxm4aVZ1wkvyVwjIy?=
 =?us-ascii?Q?HxJ0lxwBv3KAkrjjtACaDOet/yfFvwLoHr2UzSsV29tj2yRN1XlCfy7U5nhI?=
 =?us-ascii?Q?fKcQy84vQG5jhKYBxt3ZW9wixU/jyjqf2lq7n5sPbpu7sxgowsJfZ+/1Oi7h?=
 =?us-ascii?Q?myRWICEiiGVRuQpbD9Dq5wuskfovqMhzoMPLRg5ZmFzZrPg55HtbEB2rjoSY?=
 =?us-ascii?Q?dzr/IwxzP7ftfdYhSJe1iqXmGxLqIhMjFuEj2i9Z3Ai7j/TszRi0kAVK8Y9D?=
 =?us-ascii?Q?PojfUThfopLP9mR1bOuXtrIjrQHvSgSPo7F9gffY5ib4HdqVQUBNuhwsJ8No?=
 =?us-ascii?Q?t297A4Pd5O3GS7pnCDebkzRiz+XcBrPz/jKhZ3JQB5lcigHXY8ps2JuOJyoa?=
 =?us-ascii?Q?ICBNLhIPL9Gbn+8k7sDCtIYi9vs4+sFhs03cGWINVwZQ+q4vyOZhgf0uBJx1?=
 =?us-ascii?Q?Ht0yhzp0EZbI+LCsOuy/yhXbxfWjVXXbhV+QPjy1ZL/9g0yZq+XGE8s/3gzJ?=
 =?us-ascii?Q?HPSpf336YL8XP+JgfPsxpy79l/WgOqmBw7Spy1Q9oa2XfY2Hd/gyZmJn0ncH?=
 =?us-ascii?Q?5HOVjbwO6CkRl25RLoPehfE3KJg7j5mRdatfoXzqh+uDWbJc7RqrqUynND8r?=
 =?us-ascii?Q?GBMHww6D2H+0ngALVPTpvZ1vDXzU6HT4WecZ1ddXMCz4Hl2FtRjJqCNUAxLp?=
 =?us-ascii?Q?gvrdqeW631DXuVjHWWcdaGSBjm8XZKqh/a5bGQVOCwA9IyL1DkH8OKnVEYVk?=
 =?us-ascii?Q?cTXva2oC4WK7qQzsRZHyiFEvp9pX8uKN9n8k6jPi8XFr8o1tiEZQFlM+BMeT?=
 =?us-ascii?Q?m+9T1RnwD3IK1k3jL4o=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161f9a59-4ce6-4d02-3c69-08de34fe6d6b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 19:34:09.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21AwWx7jM9ZuXWRsVgMddg6KBVb95w7dq757NXpRbp8HaJA3tYUt6/YD84IK3CNM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_113415_918351_E02173D9 
X-CRM114-Status: UNSURE (   9.35  )
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

On Fri, Dec 05, 2025 at 04:52:00PM -0800, Nicolin Chen wrote:
> @@ -1106,16 +1115,17 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  		 * allowed to set a bit to 1 if the used function doesn't say it
>  		 * is used.
>  		 */
> -		WARN_ON_ONCE(target[i] & ~target_used[i]);
> +		WARN_ON_ONCE(target[i] & ~target_used[i] & ~ignored[i]);
>  
>  		/* Bits can change because they are not currently being used */
> -		unused_update[i] = (entry[i] & cur_used[i]) |
> +		unused_update[i] = (entry[i] & (cur_used[i] | ignored[i])) |
>  				   (target[i] & ~cur_used[i]);

This can't be right? We don't want to ever copy an ignored bit from
entry, the ignored bits should always come from target. The line
should be left alone.

Jason


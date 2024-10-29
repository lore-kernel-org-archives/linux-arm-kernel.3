Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E8D3A676
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl6j8lL5OUm4D4erWXeE/IAAVrp/JZxQlnpZkUD9MHk=; b=cfzmotskKWWbScIwiZNNSQz80M
	K2eBKen+XQo0btTpiXzlxI3rBruFL2XGU6hjIUW7TrFumQBws2mJVqTZlLjP7cScl8mn3Uw6JWgl5
	EYPzTGpU5saxhbunZz6Hxt4OFMgSgrvEN08eY7CQ8+gGMya0VX9+1Wit1HV7XWPi2d9pVuANkTYNU
	QEmslTEu6zAeDleIiGzSassT1ZfMsnD5cRVVE+K/nGUToSTxz38tPp0tmN2QgI+nvaamnH9BAGsh+
	XiSUop2FtNREIuhv5DRKRAtamqzJHmAynoMTrf2yAIG3iRIU3BRYXarP9Q2C9wnlqJ85IArcGCs61
	oZqa3Fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q85-0000000FHdg-0I0H;
	Tue, 29 Oct 2024 17:35:41 +0000
Received: from mail-bn7nam10on2062f.outbound.protection.outlook.com ([2a01:111:f403:2009::62f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oBV-0000000Ew1j-0Vs9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W88ZWa0+gihObSPjVbbNMEgV7rL4oFZnflumg7YR4qJSUtEhTyZqtT7vrX57vFwn01AUXDQ3kmvPiqxuaSmm+62nmWatjRPtLFfES67Dn1MBLReZ2+dLIOBJ6qXHonaxWaFfAJMIrynZCp/1M3hJz570YTvM4384DCWr9UhaXZjY30Vp5ZW+5rpyWgJNcdJf+trcblQ8LLXZLTVBeWpyhyYWTm++OAIMRkJD7QGR30qgk8Fkjyy7TbpZWxEBGGChdkDKQGZoKdGFpeyayDsntEaR2TIkXw9VNUyVFpD5AIVZRll/DAmdAUQbeVs5hqOqFzTYeOcCfPat4trCktHx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl6j8lL5OUm4D4erWXeE/IAAVrp/JZxQlnpZkUD9MHk=;
 b=OXCm8OIoe/Q9GEygvXNEjzYzNZ5NMr9/iUVg22yTjv588eFKp099VOFfmrRNHsMuLHH+ya1q8MD470HrOWs5BYQvZTS6iaRXBSIno9odM52OBUmBlK198SFBUOmXVLJfLniQWYsO0xHHFDsWYWZQDhZ9wqOYpVUc7M1wP51BrO+gwS7cLriyY3nrhZxIU/fkKuAP7MafOlGfIGkdx782vE7g2eMpBF9y4OLyRM7mSk+VrWsnHdSXq/rDTgLWOY6SA5DFQuNHAcDA/WFpMbEb5eL+5qPYz5fgBddL34bjeZRMfFn9oWgTQsVfki9xydcztyPbOLKCqYoomp2SRV5VhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl6j8lL5OUm4D4erWXeE/IAAVrp/JZxQlnpZkUD9MHk=;
 b=ocvOUKwnNleDA6yT9rUqkOT5Pm60cHljv1m0X7Pdrf91QJW3fDYyrTd5ucu+gSHn20XMNRKxA2al5NwQEx8lJGmZjlgl358VQ+2YXDXHI8jhWtz5h58ZwPZheUoghro0V/+YWThPM8VtQ4AdjGD5uIOsPOYMfFB0bMtYIYLwYdmMpDPj72HqGYHfZi0aIuCQMfbocqsFWI0oKvq1JVPzV+dPC/aohbrszco6QjTI0raABMh7F6XpDCST+P3rps2lK8BLtCZUuQZ4JJ9KeClqHYsjJGdSMxGVwGcQokfdOu9Gbo+mFp7wVQ/hKCxsiN41vqKD88s0zx7dXcU52uYXdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 15:30:56 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 15:30:56 +0000
Date: Tue, 29 Oct 2024 12:30:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	yi.l.liu@intel.com, aik@amd.com, zhangfei.gao@linaro.org,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 08/13] iommufd/selftest: Prepare for
 mock_viommu_alloc_domain_nested()
Message-ID: <20241029153055.GG209124@nvidia.com>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <f080c65265372b56942e6d1008ee114654a23f91.1729897352.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f080c65265372b56942e6d1008ee114654a23f91.1729897352.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0425.namprd03.prod.outlook.com
 (2603:10b6:408:113::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b52ba4-6d93-4aef-57a6-08dcf82eaec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?po2HkPUIwzxjo+iNzs7mCBKBJ71YdbKF02eaxzCvYSd0wyTIilp9lxVJJm6J?=
 =?us-ascii?Q?RakD5S/KokMOQ+49nuu/f1qT+oQAs54SYb9k7x9lh3L1Ce479Uj5n0FRCAc2?=
 =?us-ascii?Q?cTvtrXs38EVVaW8RnGO0SIJR7eNrYLn0M/n0QgZ3pnLcbQZcSmKn3SO3HlBK?=
 =?us-ascii?Q?vS9H2iaVewCwRRboEk1B+TBk9LKUhi3PBNq7kiGRkcyv0mevgP+mnL+S3CLh?=
 =?us-ascii?Q?LGwTbfrOb/PwxezSNkrdPRyJarsI1kTmiJj4RIs1dFwb5Q7UsJPW8d5MZ3vC?=
 =?us-ascii?Q?BSHEvIMtMPUWKLjBSEPwWGqSpgtVBKI0+lpkf8Plkha168DKQAPpm1vO1pm9?=
 =?us-ascii?Q?/zXa5uFmf/0q1LFPNdsxygob/ROMsbjbtQF4KPTB3vlbl9JL6At+qWNpXDk+?=
 =?us-ascii?Q?G+NET4mhRQ13I8Hduf1RkWOyZDEx5g5QsKSuzQ6je4ill0xRFGcrIg6/wxCz?=
 =?us-ascii?Q?4sSJKUeMxpYgIB15DbyOxx1RioVYpu7fQs4qDzpo1+rW2N6QnSahQqy/xKVb?=
 =?us-ascii?Q?n2/cgdQz4xmcF/mV1+3HwJdWY8l3vxnCR09LdiKMLax/PMEHP25ayMyf+D4n?=
 =?us-ascii?Q?3glrzXXdtvRHhEu+Ldhfx2LiRiMk4GzJv5sLQxMwF+P25HRd8DN8GoXlIZcy?=
 =?us-ascii?Q?Hd2RwO5jLJVPzejOWtj4MrO3yt/xkeyew6xP5MLdPA+S6p84GY0DySLBb8Ye?=
 =?us-ascii?Q?Gjxa5EObmbXlQx4RzNe0P9xznlnSE+8u4lFh+hE6O+g7s7to/kP2MiAQg3Qv?=
 =?us-ascii?Q?FsJAOhc/jvonLRdY/J4+l3hxfcmjRN+vxM1KWa+Vrs14bE8WNc2Dn0rhHcvl?=
 =?us-ascii?Q?y9OxpzkMYIPVM0oMajluq9kq/GJdhrdDYwMRlD9LfJSfqLMHIoo6SJmq/yAg?=
 =?us-ascii?Q?l03OS07TKoAnB7iKIZLa3kF9HAxwLysAMBt78S5yRvW/7uhu5KBcq9bbr5IG?=
 =?us-ascii?Q?ZQUyefJCjdgNzsvu3X2uYawSZGXJgjffDQCPwSs5c0fKTBuH+ZeM44CbQae/?=
 =?us-ascii?Q?glqHP1e7BU1PTk92AfRSJ81N55lpwuw+bxG4qcaYNpTDWSr1rpCPWfXiWDRV?=
 =?us-ascii?Q?i1l8oTreE8vedcHmYANs3ORde8Lcp3xSIgMCYDqII2elB90Wy9orVwaVu73l?=
 =?us-ascii?Q?gIdhEm5mPs1sjGnOOvxMyAU1Ag92N9I/Bl2yoFAuMOjai/fBJllR/mjYqaIC?=
 =?us-ascii?Q?PF/0TuNIk3GrnN4K3yhZyE+sgSDKyehHj/wvfWewnNgNUGk8v5sBIjKij/pO?=
 =?us-ascii?Q?qOWSjl3ygduOsxFRCQ0ERocJjds1AAF5Fux2pifceySESr82Ri9icI5C3yaM?=
 =?us-ascii?Q?zj335B4O2DJbik+CX8/aRxrk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBitNs+xs7fQfHeYWlR1x4WvSuBhmqawarMSjkdnt0U/NVNFEN2anGHZ/+n8?=
 =?us-ascii?Q?OBwSMukGyoBeIcokWxHsuCS8jS0xfj6S/V7lLbqpxyeMkkwYl6Dwf0bUpMuR?=
 =?us-ascii?Q?bjASH6+1eYw0V7XNw5ZzyrT3FK/MvD+aw2cyhMuv3eDnlRg41kK9vaUDM+RU?=
 =?us-ascii?Q?ldro+dyiFhzv3P6I/aajhFbeneTzBFg/U8+FR2j6gQpu0vtEulb5XMazTe2y?=
 =?us-ascii?Q?wfkMSpNqoyKIsLdy0cS3QuZmsV5Ac89j0nDKoC/ngq8T5+BDEJeTelUpWaDn?=
 =?us-ascii?Q?l2XsCbt3ha0hyIlLzWXzCuPH3NV8iTg+mAPMpE7BrwtU0Qg01kQvUR0hSBnE?=
 =?us-ascii?Q?cNenTZhgOp3GPjFhbTH+4jOTim0fi0i5P+VpKtrdkfAGANVIJqPniwSjtOhS?=
 =?us-ascii?Q?Bd6bpAk22/ozwdepV1eh7P0+fQQxxRNmskbacpg420XeNTgAgvXHou2BNNOf?=
 =?us-ascii?Q?8kMWQ94UUaAHqJPowv8j2o/zAMbRFDNRGPp1ueXv7PDVCaE2JzUvdYF9QAN3?=
 =?us-ascii?Q?HwHKzHPFR6o2B+GleBVLbHmXPOlEU8O3Dr4NElm2ECuUECVgmRBDNM0NCYP1?=
 =?us-ascii?Q?SZfaP4+OG1cOgICZ890+NJem7EMZ5+hlxaSINuTX3JS+p8pX7TmXKa0vo3Jv?=
 =?us-ascii?Q?lBqTOBPPua+o1nMoQnoJd+5gTAYEbHKJRAR8pymdSCTGs+x2re726EaQ5uEZ?=
 =?us-ascii?Q?WHNhhpzn8uzEtiOsO4u4lw8lxfPZY4HKEu2hlGcdDRd7HcpfNEx5NYE3/wpS?=
 =?us-ascii?Q?haO0hhk3PFT9nDB8TnXqbL56ntih+ycy7E1EYL59jHYcAKHpTcvF+ObswZIl?=
 =?us-ascii?Q?rJodkKW33unx5T0M3n7ylZzBR2qoXlIfaQXC5RMFH6d/hOVk3ngfdMyj/73Z?=
 =?us-ascii?Q?PCjlKu6WRMs148Py4QX/oiQ63fXSl+sp4qulsTXY9MWlZe0++SfRUoVAg/9K?=
 =?us-ascii?Q?g+eBtR0NUgdtL94m5b8qNrc9xgsM1UVNOzOnSPPrWu2n+DCCG/lzzQeA6CkL?=
 =?us-ascii?Q?WxZkVrIeB2p1Efe3rGWOs8cSy4pkEBldJKe3yAgVjM7e9nYtxNxYXj7iawkk?=
 =?us-ascii?Q?kJjgA1e91FbPWoHehS3PtGuVhRIK4b3Fw64wm+d1TDrVkPY02kbpHuz2xI3k?=
 =?us-ascii?Q?A3NvYFv1HlqmmVlTDD3F8jvML8sZcnSCDMOpBkC/awymfaA/bYXXf40mRVVE?=
 =?us-ascii?Q?Am1NlU5aoG/jysmNr+guRQODlNuuEG1Llhe8GhZ57ujeeu/z1E2v1wAnCG8f?=
 =?us-ascii?Q?Bb7ffif9iFwAw7NgPWQWj0U678kS2T1NVFcfJjwN8l56EuDCa+8Kja6a5mTq?=
 =?us-ascii?Q?2LlSEpYeq8eFQW2f33F1G0TpDfQzPlGhwi+sAiNsqbwW0H9L3cHdOs4eFT8q?=
 =?us-ascii?Q?zkaoKRb6sJLkS4ATOW0RgcFoUGJJGMg9bIM2SFxktIDjsaZhzGPRW3PiezxS?=
 =?us-ascii?Q?QfAR1YiiOnTvr6LsqgeI7se4npQVPf85CSoAXiegkRprnl7gqcbNLfvohKhw?=
 =?us-ascii?Q?T3LCP+AtPsToyBX38MMl7uDnrC1XGOR1MvQvc+GYZgfjR96Isr4NXXgOgpSz?=
 =?us-ascii?Q?AtVw/rQ3oWlg4usENjo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b52ba4-6d93-4aef-57a6-08dcf82eaec4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:30:56.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 408Aizi7jEglBJfWoUIF+PN91aK3wJGp8PYxspS9CGMdynb4Tx0zsNdvUItYj5DH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083105_282518_B053F40B 
X-CRM114-Status: UNSURE (   8.14  )
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

On Fri, Oct 25, 2024 at 04:49:48PM -0700, Nicolin Chen wrote:
> A nested domain now can be allocated for a parent domain for a vIOMMU
> object. Rework the existing allocators to prepare for the latter case.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/selftest.c | 89 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 39 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason


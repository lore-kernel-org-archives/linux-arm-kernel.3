Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D26CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9ucCM64sUw5OYgeTtVz4ui2KvwdOczmiOaED2Sgm9A=; b=YW7OImb17nRzg5D1W14mHf6kQN
	Eb5gZyuaDDMNQxP+SYSEevxOXPSETvqIIIEMh/A6cjPHp02rywsF9RgnZOLichR46WPKeQCA+R7MA
	6Of4qYWbUy1gAsRm6Dx89opTYBppZxlpEtw8b8vwt9QSkFFcxwxKpNl9b9iVNhpWOf0LKW3ESx4XH
	Ba4EoVV6M4hrFYo/9eTcXeatV9xIjHot/7W6ctbgkfIK+QfONlzhQvl+J76K42EwwF+vRItNQw6eH
	61LCFjLoKASJSpOiBXoYTaTNy+Ao1aXVgp1q2PmJeHft4X554Hx35+XI5m1Fl/wMlQSa46BPA8AS+
	NY9pgVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWC2-00000000L4H-0VYa;
	Tue, 28 Apr 2026 00:20:50 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWC0-00000000L3w-0Zx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777335648; x=1808871648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=df+Xu80lhdBzMp5IbbkEnQs5RpzwZAtVxCuSo9KnYZE=;
  b=YH/MwNqyTEOt1ENkbqMnAPwY4WtO2ACemVDxqnrcYb00VmTyt2b7aqGv
   lhz/tSkzJ/mV1ILoeCiNhYJwcLD5uuQa+MVphi2YYHdCmD624zc4WkeYb
   N3R7BAOQAbX2dna9jusFywmQU9kKo3TxGYsiWJ6JFGnw1tf+U7NY+QQnt
   ZDwXtw95FWCnCXGEGnw1cJMawiH9EkMCEAYpBkfNmlq/EhT88j98rPhsL
   d8KsNn7pjNAzzaNJ8Nrq+YKK6L/TPxs1pQCBqgTbuVS3BxBJlH/aEl/iC
   L7gSoevnbUavHSjCGrnxCtnI/8Vga6OqNxfticodeQpuD05YIGzFizgYw
   g==;
X-CSE-ConnectionGUID: 9oN9tlcaQSuRJjPWjbum1Q==
X-CSE-MsgGUID: eDgRDWHzQJi27XpicDzNmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77939170"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="77939170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 17:20:47 -0700
X-CSE-ConnectionGUID: JguBJUPgTBqSJ2vH7BPstA==
X-CSE-MsgGUID: zr2/+iOiSO60z8r63VjqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="232910610"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 17:20:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 17:20:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 17:20:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 17:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTq1aMbGGa8YdPk8igBFINfnovabOmEC5MTMaIcpNwgW9NjdOvCnC92Sg796vQOAKpkyHBOJc1hBMgM+xeyFUD9HkzeFNPMdt2BLuF9gEuECm32HOmACbQ/x7+kSgYJN6M2ua4OHAEMRG+LM1zMvNAdQCPr4a0PxB1fEoGmWggb0xcKY54xDuzBAMwFO8gvZ24ktcb8rcrqlJHyWJhcevSG0hr/TcwQJ6E4L6WMntsk2vXJ5rs4iC5myJIJceoDapfzuS7jSfeFI0iDwNyXbzjiNjXYMt7dhRpbC43dABfLuKyqEe4pIw66mFta/76LNcf45or2LAtCtLUhnHJ92SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9ucCM64sUw5OYgeTtVz4ui2KvwdOczmiOaED2Sgm9A=;
 b=nyJL5zwQeCXHq2JKltJ/n1ZAWhzy2t2SdhmXb+B3jCqK+NaDLH7n02Y9wEBu+Z2IiOqLyZumo1Oqc8qbxu2kIHdPOQij8Gbuvt3VpIgBJUu3SKNaqX2z9QdS5V01aDDBbL3ynHa5Ym1uniQPfmm8yn+jKEGhaz4hM/5sZm7dG05hP5N0WP70r+GJCKWmyjPliglk6XyEJSqiTM+I93PjLa2c5+S+KDg+GSe2WiHU9ca1pYFR5DIkVAV8Lvy+41/pCZMRlJY83dAfgOZsRmJnAeS5yUTW0pLcOe7q3Nzys/WfcYaFsmwgTXa7hyuaUrTayqIJ0esktKvj+zo91xLwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Tue, 28 Apr
 2026 00:20:41 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 00:20:41 +0000
Date: Tue, 28 Apr 2026 08:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: [arm-platforms:kvm-arm64/no-lazy-vgic-init 22/26]
 ./include/kvm/arm_pmu.h:134:46: warning: no return statement in function
 returning non-void
Message-ID: <ae/9UVhdNg5H7XkR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 7905af7c-1b0a-4f73-67a7-08dea4bbfb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8LVKXLAZEJXgWXD40GRfLsuBnGpBCx9IgkZe4h0eOsFYXoR977hbSjDG2POXIVlA170vAjz2WPFZQUZjjHRa0nh+Wg3Yj+h7lRkmFCvyALjeO6HDpXLPJHAs4YTYLfoYp8jRuul98GCQ9aDFibxKK7vN98nZv0Psm9gEygStOGqlyf/ktWQr6i4Y/f012srhMMZO6hQkotIzag7DAanzFzJ9OyT3TRDG51PcbBixtf3w2qROmpx76YvMgQp9ot/KhshCPjOEbRoO+QSV2A9p7UEcgMLm2kRk4aSp08gqTQGsh2IXgUdcqCRgRgtzBw5zTm1a2z0pYhOBhR1P/TQ6k8x/raKPjjhVIiaZgQ63N74ZGqQL2tRZ1BiGD+Yc/w/NQH827D7bmIt+6scGCjBbggZR7He2QYmwflvNlCZoJM1DyWR/gSCCNroUBCJh4vQt1IrenhAFcfAQQw+RpIrNIhU1dTtfRuh/0jQS3P7T1kdxXdxV9gZFsOFslp9lj5hK79DSSEQcWEP895J15F3EHrZQYGsXIL2KvqvIDJ8GUkbiq+g0c+otSbh4ceaQnzDtz6ZdC4CR92MPcjtaUO/w1OlIj6EyU+usgmGm5eJzpKt0onVgMyZ6Yj5gnLaK2yyfCQAVIX3FOMnhYTBOYhHNoCWmi/0OPXUTqZ1PQUZsh6UHHdbEqmZNwBhRPcMUCiCH8hBJpoFF5t1vI+0yOeQRPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dr2ht9b+BDasAuUpa2thrZ93//vOjnQ3yjf2Mp7Cqmma0jHKxQr8JDgxAlgG?=
 =?us-ascii?Q?BDroO3sJK5a2fi7/0qgpLGA0T45YgWlewR7kKRMF71n3BLvGrIRiNMq+YS+j?=
 =?us-ascii?Q?MjUcJKEOHSOazAn4FVqJUng1KFJqGd6QvTQiY1YD3eww9OZexCWXQT5DD0j+?=
 =?us-ascii?Q?AL00by9+OaPs9HbVN/xZdT36D8ORIgUpd3puvZ2Cis3ACv5RGWaqOm4t7SCg?=
 =?us-ascii?Q?BFoYJMIK7KvMLl+ep12hCV5mxNKUQhnh3O1mjPEFWBOgDxbqrjwXlOPYdpZm?=
 =?us-ascii?Q?UzZFx3E0GImemHiTaMJB7c2nHBe2P50NquM0QPC5KjRrkpEJKiIl8NsuSxNa?=
 =?us-ascii?Q?aYZGosLsxy/Cm4tJDG9WMALLNLA6hJ8yYFv83L8SjLyYxWy/ibuIeLc6ECnY?=
 =?us-ascii?Q?OOryc1X4XeuPQ89DDo/NylsNEz5np6o34YK9Kfem4ccJPGUTE6dupNLH+/ik?=
 =?us-ascii?Q?N/1H4PIZD6xZr0SZc7XfD8LxF9FlJcfwYYjPHKAzP7EAr3FPKnUOj1oC/TTI?=
 =?us-ascii?Q?yJxZu89yx8dfckKsLq4kcHYwbhDOlrvy434YcQyJnmarYtwFRH0KAOPe+YqL?=
 =?us-ascii?Q?kM1r+1IA/RoqSrHCLe6SEFqzEGl766g2mCxCKDmsLIq89bwr5e7chN+3F868?=
 =?us-ascii?Q?S1iYK/17H63HwW9nCu5yw7ygWepyMIy80ZrpxoDEcFmPb+LB2Qsp/6LfnjIA?=
 =?us-ascii?Q?5hXxKANBY84NGgVLpj2VTPuwNi4IhbH0yNSL6vqSuYjXO2y9qr2owkrobLKP?=
 =?us-ascii?Q?LOT0JDcX6hFrj/IG9szwuXJwwGqBWp4iohNEzzHoLUER6JdGm9t1J4PRgyQe?=
 =?us-ascii?Q?9xe4Vx4SIgI3Q8XCFuh9IQfZK3M4TfKl+DZzmXs4eFf11rZHSdLfBNId9Uzg?=
 =?us-ascii?Q?ZOgdAJFrDtblN3uSLKR0XzJxj5ZD6zsW1NYNegxK1vZy1u9WX1+3GgPE0bdN?=
 =?us-ascii?Q?qmOMuw+CHyqJUSrypEn3kdP5RDmqFF1BywF0PzBbfQlHKZcuD+o8QkCSUA1M?=
 =?us-ascii?Q?rijTQkaCSCqlPvfA5bqmtOA82XPbsQrhwr8hNlTulftqspUTezkJXYk8ERf+?=
 =?us-ascii?Q?NKHbqH5LdghPkozBNudrcwSH7Y47QHk52mOdPyIXXepoaGmq1bXpPtfRsSwt?=
 =?us-ascii?Q?D1nexngOR+48O8fEdJ7BwC+RqL+woyXG7CRDO/9sLUoBVJ5sDpQMSX3iawp4?=
 =?us-ascii?Q?Yotc73hkApOTwxLxPAg4ZKqnGTiM93CZrFSlDJqCjF83eZI6NrSFYbs5kAyQ?=
 =?us-ascii?Q?GshNOkQoQa1nnaFcLJwj12j+LPPOOeFN9caRqmIdK4j4piSx5T6n8zkwEPGr?=
 =?us-ascii?Q?pJrnyDQemv6pFr3ymiHhrYoZUroCdXZLg3cGvvjc55rUm0erEqXtPYnSY/W+?=
 =?us-ascii?Q?/I5jednioAu0+mKIW8dqcQwiIQE09ZKpjzb8PMnEEcDdNKKUD+GbnVElxqyi?=
 =?us-ascii?Q?nEYem55up+m7rQj3ICB2MCHYU/KcVJeRbIX7pD9VYGqWig78gUqaMWnkjrqF?=
 =?us-ascii?Q?vwrzd/vwa0I2bO033kHsq6X2VdIAMnftk8ypJXUBGar4zkvmUqhjF/Q21iBm?=
 =?us-ascii?Q?71H8mHXrsv1pOhQa8+AYw7qjBAp/idng+StUxw7zRLvRohpCts/JyD/9rmz2?=
 =?us-ascii?Q?TS8Ml1SVz29G4PNJ1SKzdrbjzYhg4DamVanxFBNrSqPcWm2t9m0pSNrS5SBb?=
 =?us-ascii?Q?5tDHjWcNfkXtvj5e1RNcq3f4VRDZpu+8FS+PgudKit4VpfItsM6mZVUddp3x?=
 =?us-ascii?Q?6wWj/tZgKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MWD/WmR1WLKSEPpYiu6Ic380ak1+kJq7ok9evfkp2QtumUOccfr2L1X/5xHyikfjtX2D3OuJbMAljdem0CvnHCMSNGqO6IMMOFpulbJw9tig9CwZhb7lWMdVLAo38jU9V5M2FrpxfvugrKf/J4roF5C+lnvu3yszVMboJXCOh7IeSzh4yoSj09QIDK1X8F0ypRqacuye1LXUQhQvBNxvkLjp5Iunkwxsw2wnZoZ1WSNpnCexFRimh4cSoFLZV9l/UOZwIewmwJHxXGAs8S/Ac3CYKOzmJjuA6Qa5w+5lwD9p0owxdaolxNtgehwTBfmiyXRW1ZUcWETy0yd984IWjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7905af7c-1b0a-4f73-67a7-08dea4bbfb24
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 00:20:41.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKDoPzfl2q1uwFMUVSyDmN+Xe/3GFWNsIPiRAQ+huH9hj+C2Qo/JfZ4Yp+ON2uWFC46pIIavcbUy0p4r46/rnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_172048_297515_48DD5918 
X-CRM114-Status: UNSURE (   8.49  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/no-lazy-vgic-init
head:   3bba2d1179c5198c5788cd387feeeba2070e7cd9
commit: 4c12b5742e18dbd00b0b59f3882478219d73b463 [22/26] KVM: arm64: Simplify userspace notification of interrupt state
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260427/202604272228.qzrI3vL0-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604272228.qzrI3vL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604272228.qzrI3vL0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_host.h:38,
                    from ./include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   ./include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> ./include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~


vim +134 ./include/kvm/arm_pmu.h

be399d824b432a Sean Christopherson 2021-11-11  106  
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  107  #define kvm_arm_pmu_irq_initialized(v)	(false)
051ff581ce70e8 Shannon Zhao        2015-12-08  108  static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
051ff581ce70e8 Shannon Zhao        2015-12-08  109  					    u64 select_idx)
051ff581ce70e8 Shannon Zhao        2015-12-08  110  {
051ff581ce70e8 Shannon Zhao        2015-12-08  111  	return 0;
051ff581ce70e8 Shannon Zhao        2015-12-08  112  }
051ff581ce70e8 Shannon Zhao        2015-12-08  113  static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
051ff581ce70e8 Shannon Zhao        2015-12-08  114  					     u64 select_idx, u64 val) {}
64074ca8ca92b8 Akihiko Odaki       2025-03-15  115  static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
64074ca8ca92b8 Akihiko Odaki       2025-03-15  116  						  u64 select_idx, u64 val) {}
a3034dab74fc12 Oliver Upton        2024-10-25  117  static inline u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
96b0eebcc6a14e Shannon Zhao        2015-09-08  118  {
96b0eebcc6a14e Shannon Zhao        2015-09-08  119  	return 0;
96b0eebcc6a14e Shannon Zhao        2015-09-08  120  }
9a1c58cfefb069 Oliver Upton        2024-10-25  121  static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
9a1c58cfefb069 Oliver Upton        2024-10-25  122  {
9a1c58cfefb069 Oliver Upton        2024-10-25  123  	return 0;
9a1c58cfefb069 Oliver Upton        2024-10-25  124  }
bca031e2c8aa22 Zenghui Yu          2019-07-18  125  static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
5f0a714a2b63c2 Shannon Zhao        2015-09-11  126  static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
e22c369520d0a2 Oliver Upton        2024-12-17  127  static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
b02386eb7dac75 Shannon Zhao        2016-02-26  128  static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}
b02386eb7dac75 Shannon Zhao        2016-02-26  129  static inline void kvm_pmu_sync_hwstate(struct kvm_vcpu *vcpu) {}
3dbbdf78636e66 Christoffer Dall    2017-02-01  130  static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
3dbbdf78636e66 Christoffer Dall    2017-02-01  131  {
3dbbdf78636e66 Christoffer Dall    2017-02-01  132  	return false;
3dbbdf78636e66 Christoffer Dall    2017-02-01  133  }
4c12b5742e18db Marc Zyngier        2026-04-22 @134  static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
7a0adc7064b886 Shannon Zhao        2015-09-08  135  static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
76993739cd6f5b Shannon Zhao        2015-10-28  136  static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
7f7663587165fe Shannon Zhao        2015-07-03  137  static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
7f7663587165fe Shannon Zhao        2015-07-03  138  						  u64 data, u64 select_idx) {}
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  139  static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  140  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  141  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  142  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  143  }
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  144  static inline int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  145  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  146  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  147  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  148  }
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  149  static inline int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  150  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  151  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  152  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  153  }
a2befacf509400 Christoffer Dall    2017-05-02  154  static inline int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
a2befacf509400 Christoffer Dall    2017-05-02  155  {
a2befacf509400 Christoffer Dall    2017-05-02  156  	return 0;
a2befacf509400 Christoffer Dall    2017-05-02  157  }
88865beca90621 Marc Zyngier        2020-03-12  158  static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
88865beca90621 Marc Zyngier        2020-03-12  159  {
88865beca90621 Marc Zyngier        2020-03-12  160  	return 0;
88865beca90621 Marc Zyngier        2020-03-12  161  }
5421db1be3b11c Marc Zyngier        2021-04-14  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



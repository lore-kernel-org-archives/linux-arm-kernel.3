Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51294C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jm2DINjcpysmH4hWsBzR8E8Xd6jIUlJzeoO6uaRFsX4=; b=iunHpD2Ggi8OC6V+bqYrlLeif4
	XuZ8z9cyP836Znhd7eE/HCAcLsUD80rlQHF0LIRBPtPKrL8A5i0eTpI8CO9pXuZdHb3sW8rV7PRca
	ErgzBOfI5quFbP575eRp4wyZxWrT1W0qoTNzJgmekKbo2g7tX+oNweh8uvs9Q5ONVvU2toyMcP+tZ
	UokdIzhwx3LJjACAcAjGvxdoS6NDQ6SIsDJ1YKwGNFbI5J9JW+e/pDUPHjI7kr4ClNMdCoUkRHLjN
	PFw8GAwnT0rfP/AMqo8NNWoH6LyTABxiQPX7RQYETvL3N3Zavd+r8W5C9VL+scRITt35wOXZFA4ea
	biyONZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7zY-0000000FNh9-1ea1;
	Sun, 23 Aug 2026 13:12:04 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7zW-0000000FNgm-1lzw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 13:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787490722; x=1819026722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rheQnHXHpNZIKl8K/rbHR0EI67DYnbDcLEw9EGczVXA=;
  b=Tu8tr7CjgnzOSHMwpQndE8d9pO2YxDazYWIsXq7mUgtn1nATy9KWTyQC
   Z0mZtrZG/YgQg2F4UeTc5xrRup9v/Q3UucXVDdDUpE66QDkFmEmglEoUg
   Rw1oGftOkJWftP/6e5esJNXDjJhsC28CV8fQDvBnLQslpxM3jdPtF8k2x
   J/uk6hczOG8cEhskm9B/3gwFvCaE53pKyEjmfExKeOfXGhuqJNtl8a+Ze
   x5pwkT5XrPP+J0wyqEm7EYWpvqyQploS63HbirZIMsdn6ltszLVJitx4h
   fFIndTZUDz/2ahNPw//OexDN+GfqXy6aTpjBOJisFpLg8dkFMPsIetpoZ
   A==;
X-CSE-ConnectionGUID: qaZyaxemQWKTW42eqfflsw==
X-CSE-MsgGUID: l/fj21/0T9eCv0LKvh48Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87822648"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87822648"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:12:01 -0700
X-CSE-ConnectionGUID: kExla41mRDWSvaDfbGc1ZQ==
X-CSE-MsgGUID: zS8d7eNuTE2CDdANQJzM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263508640"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:12:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:12:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:12:01 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrpcXYiVynB/glKoeav4EcKs/h+YcHJ4PcMXxi6oJ/wKZP+tnAxG7hRvoxoz4rZnyEdEw6CAwSjuIxJn8PBPuD6+BdQ7ZBGi0IqhksxLGf+qkydS8LdcvCetWzlxKm50TFryt4LrCeBv9N1TU2WIeS+UqqQUFjGUE0+vgHYUFV/KU3vjNpLytAMvYxtZG+5X4jNW+Y12crbCvzjWF3CQXsCGTSGga0HvkAZ4pWI2bvBLGyYWZRWvV9G/AY3ArXeFt4lcxEvrXWa0KuwPB8dPOXHGUbTO1/BdKg0o+E3GmhjxrkjZnGpOSKpNMaxSrCpHGfWx4JKy2froKhI/FPxgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm2DINjcpysmH4hWsBzR8E8Xd6jIUlJzeoO6uaRFsX4=;
 b=jqRuMRd1qSJ9EiLyWD5taPAGLwS1MkeEG/Lt+dEQdeWIz9Nz6vOAO0e23EKxsNdla4xR5xhrYkiOkOnH/G7gOxfIuoHLBjvbME0lRktPSxUwsPPNWIq/9tI/iFyHEtkmoT9uDdyCgUy7WUGTjxnYUBz5xlOtrM5DuvPnUO2Fvg6OkAf+dTt3cJlG9bPl3X78L6G5Uo2wpOFjkr1jR5u+55BJIS6fuU2NaqrkqkZRocFl4Dxq+2Rc02Pq/PvDSY1c1ymaDIApaNaLPLZJ2nXcm32gX1Pen7qGw4Zi5LQTsWj1CfUVHmnORQTb8aGECMuiRy6yvHcREFYBM7JAUUjPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 13:11:59 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:11:58 +0000
Date: Sun, 23 Aug 2026 21:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>
Subject: [linusw-nomadik:b4/dma40-fixes] BUILD SUCCESS
 0bb6d730bc885dd63dfe2e85a46972a4da364548
Message-ID: <202608221724.cEB6BMVe-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7ccaa4-e950-47a8-7af5-08df01181d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: wSRXRV9vKZGjHhwQ2+VYC+1DSNEPtxgYHbMR72nsFaRP9MPrOBqqRFPnhSN4o1dUQhUiqpKQqJbqYpVy59zIbZyZcFarTHSBiM0EUrERt6fUV6fY/YTeLcGM3jXwFp9u+yS+zgJLfhtc3p3b7Ui62AAFHtELWQLForDGJ8hSTEOuyxnFRLILpyx61voD6ohGKWdK4EOeamRo9YyhvfxqBHoWB0Sx5O40d1w49y6pnMLKrvDo12FwXORCu+jVV6seS5mJxcZVpUZPfm+QL329Kc2v6gAo6ZLo2APMrReqaFA5qSEY2ANh2GaC2mtYlWKN7wAzXLxXRbkt+M+KLGxy6+46cloNBUrvhvKYXvtE3ncy4XSe9SPCg6FDOIHnBEcQwfXvTSeiIb+ZJsK9iLqrTPgZEK4di++BjYbUG+5m6s9f4BMQQ2jKQSHZWxY1a+B3TNGyEMu5bqjAuX0sOL8QvORbQ8r+MjAGFqOd0M5BLjvh2gcqoKizcCBi5xaM9DuFP0yGEDxfeO2hzII6w81XrpJXvxVt8cdtp1ZhYQCYFNSenpZWVgQqsQ3zZl697seJqnz5+SZuzVSLaAXk+6Qs0h1KPU42OzvNR/v7kpSsQaMhiR8wq86u/x3ado8bOPtulWBlmK9qoP/o6e5blSse3TOKviteG6d6n3lVPnsGR4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4fjdSRoaIKAddSJiwH7qZySMeBsWDa94EaXMUVlYW/8v/3IVA0bCf22adYbb?=
 =?us-ascii?Q?dcech9isEjDgR+Z2Bvgs3D+dxMSn/16RzDHgQPVZ61ZMu7+8xLEVKaF6esC9?=
 =?us-ascii?Q?gp3tfzC7FxdmS2N9xDjSkSGsEFm3HvJ6uYynYl6apUoWb/73/5xrDhrnqEy1?=
 =?us-ascii?Q?WBlH/cN4KUYMpzsERera8QSfar0BkWAkexzaGQeIOVKjrvQu/U2Y4FgpFnEN?=
 =?us-ascii?Q?SGkGe18P+9sxvyTCohcCo4UITDv6Sh38+Tr8W05PHmsdAUAVuoYGkye9gxD0?=
 =?us-ascii?Q?S4FAnQGr8bVDia4hxeqSCBgMghBdzxRxG3J7rJeJy8G6dRh5ycOlY54NjyoX?=
 =?us-ascii?Q?g8xm9TrMkNilufGIUOVTgAYilWKfxt9QSUR4HlwJXkldg/xNGamV2TJa4bHP?=
 =?us-ascii?Q?sTkJfvv8AfPzoPmHnc3/GGdgL9l2y+DHKEMI95pW5yHniHDS/wQ1ZH8uWCdb?=
 =?us-ascii?Q?2VRPcqpLeoqDJ9RPg/VELbP6VyTWoZmtyCcipCnbwiZP2I/50TdPgOp1K9wD?=
 =?us-ascii?Q?HXNeMS9IVCSZcb87mz0mh69CDp+zWZ3nQwWR1UWgWRnz/ImVfHYzdgC9YX9e?=
 =?us-ascii?Q?yk8IXEXnbJZpFczCzfEgP+DVQrpYSO4VEFs75S3r3u/W80GCOzH73oWwEyjS?=
 =?us-ascii?Q?LzTr1Omn4yHjpwxa2wUNK5FpibQHp92A7pBrcV0yH4kc/STh4UeJtIvq2N6J?=
 =?us-ascii?Q?6yPvnpjifsWiLUFT3CIDs6qvb6REcn1uPBuTMQJM5FiRHLz4hVxXkhKxlnkf?=
 =?us-ascii?Q?RH9/sFz3OEDIH4/5zaIu/83zLyIc8LW37yxhecL36b4PFAFEbhScLTTohaEI?=
 =?us-ascii?Q?YKHEvLh6fU2JmP4cHVeBmu0YM2lIcexnMJPM02p7W+gGJDGh8AWkybfYv9ut?=
 =?us-ascii?Q?kGFEgBk9bGn+lm54+cohrfWupQN2gDpiR0HaIGE5Mo1jzKwxfce9Iy7UtlFp?=
 =?us-ascii?Q?SVlRgQ6gG1xsp0DrwH8E9Qnc7G46ZRis5T3EnCIFd5yq/8hivSy9JB/hxi4Z?=
 =?us-ascii?Q?CC0vfAIpCsgivft5aP9GMh3Ia9AcKPumGOgvOru6qZf4e+JkDX6z8bHPrDC/?=
 =?us-ascii?Q?O25hW2gKJc3+q/HgLi/UTVe+7Sscup8A5lv/HIp//36Z2wMn1I+PXNY+2rwn?=
 =?us-ascii?Q?PNeMA2LbgUzNHr2A8m3sPqWT/W4C308hnYcQWpb9zztwaeqqgNRScy5xOy/2?=
 =?us-ascii?Q?Iqtce55m/GsB1BVwdjolB3swhVd+KXC7WFY/QSgZojl2TvKCb5yqcLDvgCUn?=
 =?us-ascii?Q?EgG5xN9HhoMVNb5IIYZJ+Tu9lZhCEBPm/LQeP74+WB+3cVzkhzLv0nlScaui?=
 =?us-ascii?Q?pskQIXnchzsuBNLsG5ljJSfWXT2nkWTw+rdyxlHfv5NMg+LLYrbxwf1/6LME?=
 =?us-ascii?Q?zNGvoKti920Hq14CL7z8EiSdcXWJ0mTGhVuLLWCgwcUBpdzTsTF1VBr8vyEf?=
 =?us-ascii?Q?fxsgG7MbmaPCwCBefBCyAeMmHLFZQbEEDrIqAlhTl+6IvqHRkA0CgAjGghpk?=
 =?us-ascii?Q?eNTT+37/IaN4BImPJyl+XWIv92EMH3hCMQzD3SkVNvoHH82YX2HNSEpm+QVq?=
 =?us-ascii?Q?XrU0b+gT4t7bx/X8tHlMvjhieWIBeoNlGQ+JBVmhn4PHd+mepU0wnXcmGPE8?=
 =?us-ascii?Q?GY4QGNbuAINVVNG+htPyj3OANqVUfqHLIlk3Pg2RuSe2FBdrL81D1PHyhMMB?=
 =?us-ascii?Q?dMzlBVaHSLUIrpP2U1yVZ6XpK096po4wimcXYC1/QGzZoyzL0GXIZU+kuH5c?=
 =?us-ascii?Q?mWN5ruERXA=3D=3D?=
X-Exchange-RoutingPolicyChecked: J33Tc/MEiHCwwR5uBMpBljumzpgf5Xo1l5xVEVZmomQI+xRkX7Zn4JAqyeFyDiqjHfDY3Q0ndVE9wyKXh4mp68BePLgtGbluLrkGx36W2NygOnDerRAxCnO2rOU/I3Gn9ja4siEYCNdtLJkUQE7t5/tNdOPN8MYyivN3+5pck+TYbNW/5mSxaOEFua/h2Z9Z99eNSGJKSkxYg4C8oDTSbc7dEJBMXNsxm0CBGEbY17iLNgM0vCjTNkq9tLyqiuS7vtOSlcokyIHPTg1Rm522HKIyLLnkknXxynDyujN7pNPG8cilhSBuqN5FMJke9BryA/T/1wj5WOrDgGEqP4FrsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ccaa4-e950-47a8-7af5-08df01181d08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:11:58.8641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cqox35dpE343aVKgSa6fYF86DU2Qa1tp+USbH/xiZ8JvHrW44KnfV0svUPmhOPV+0yU80nd6g7v34REd5rwnRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_061202_558888_DE2648B4 
X-CRM114-Status: UNSURE (   5.14  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/dma40-fixes
branch HEAD: 0bb6d730bc885dd63dfe2e85a46972a4da364548  dmaengine: Use unique debugfs names

elapsed time: 1461m

configs tested: 133
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260822    gcc-10.5.0
arc                  randconfig-002-20260822    gcc-10.5.0
arm                  randconfig-001-20260822    gcc-10.5.0
arm                  randconfig-002-20260822    gcc-10.5.0
arm                  randconfig-003-20260822    gcc-10.5.0
arm                  randconfig-004-20260822    gcc-10.5.0
arm                        vf610m4_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260822    clang-24
arm64                randconfig-001-20260822    gcc-14.3.0
arm64                randconfig-002-20260822    clang-24
arm64                randconfig-002-20260822    gcc-14.3.0
arm64                randconfig-003-20260822    clang-24
arm64                randconfig-003-20260822    gcc-14.3.0
arm64                randconfig-004-20260822    clang-24
arm64                randconfig-004-20260822    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260822    clang-24
csky                 randconfig-001-20260822    gcc-14.3.0
csky                 randconfig-002-20260822    clang-24
csky                 randconfig-002-20260822    gcc-14.3.0
hexagon              randconfig-001-20260822    gcc-16.1.0
hexagon              randconfig-002-20260822    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260822    clang-22
i386       buildonly-randconfig-002-20260822    clang-22
i386       buildonly-randconfig-003-20260822    clang-22
i386       buildonly-randconfig-004-20260822    clang-22
i386       buildonly-randconfig-005-20260822    clang-22
i386       buildonly-randconfig-006-20260822    clang-22
i386                 randconfig-001-20260822    clang-22
i386                 randconfig-002-20260822    clang-22
i386                 randconfig-003-20260822    clang-22
i386                 randconfig-004-20260822    clang-22
i386                 randconfig-005-20260822    clang-22
i386                 randconfig-006-20260822    clang-22
i386                 randconfig-007-20260822    clang-22
i386                 randconfig-011-20260822    gcc-14
i386                 randconfig-012-20260822    gcc-14
i386                 randconfig-013-20260822    gcc-14
i386                 randconfig-014-20260822    gcc-14
i386                 randconfig-015-20260822    gcc-14
i386                 randconfig-016-20260822    gcc-14
i386                 randconfig-017-20260822    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260822    gcc-16.1.0
loongarch            randconfig-002-20260822    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260822    gcc-16.1.0
nios2                randconfig-002-20260822    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260821    gcc-12.5.0
parisc               randconfig-001-20260822    gcc-15.2.0
parisc               randconfig-002-20260821    gcc-8.5.0
parisc               randconfig-002-20260822    gcc-15.2.0
powerpc                mpc832x_rdb_defconfig    gcc-16.1.0
powerpc                    ppa8548_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260821    gcc-8.5.0
powerpc              randconfig-001-20260822    gcc-15.2.0
powerpc              randconfig-002-20260821    gcc-9.5.0
powerpc              randconfig-002-20260822    gcc-15.2.0
powerpc                    redwood_defconfig    clang-24
powerpc64            randconfig-001-20260821    clang-19
powerpc64            randconfig-001-20260822    gcc-15.2.0
powerpc64            randconfig-002-20260821    clang-24
powerpc64            randconfig-002-20260822    gcc-15.2.0
riscv                         randconfig-001    clang-17
riscv                randconfig-001-20260822    clang-17
riscv                randconfig-002-20260822    clang-17
s390                 randconfig-001-20260822    clang-17
s390                 randconfig-002-20260822    clang-17
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260822    clang-17
sh                   randconfig-002-20260822    clang-17
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260822    gcc-8.5.0
sparc                randconfig-002-20260822    gcc-8.5.0
sparc64              randconfig-001-20260822    gcc-8.5.0
sparc64              randconfig-002-20260822    gcc-8.5.0
um                   randconfig-001-20260822    gcc-8.5.0
um                   randconfig-002-20260822    gcc-8.5.0
x86_64              buildonly-randconfig-001    clang-22
x86_64     buildonly-randconfig-001-20260822    clang-22
x86_64     buildonly-randconfig-002-20260822    clang-22
x86_64     buildonly-randconfig-003-20260822    clang-22
x86_64     buildonly-randconfig-004-20260822    clang-22
x86_64     buildonly-randconfig-005-20260822    clang-22
x86_64     buildonly-randconfig-006-20260822    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260822    gcc-12
x86_64               randconfig-002-20260822    gcc-12
x86_64               randconfig-003-20260822    gcc-12
x86_64               randconfig-004-20260822    gcc-12
x86_64               randconfig-005-20260822    gcc-12
x86_64               randconfig-006-20260822    gcc-12
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260821    gcc-14
x86_64               randconfig-011-20260822    clang-22
x86_64               randconfig-012-20260821    gcc-14
x86_64               randconfig-012-20260822    clang-22
x86_64               randconfig-013-20260821    gcc-14
x86_64               randconfig-013-20260822    clang-22
x86_64               randconfig-014-20260821    gcc-14
x86_64               randconfig-014-20260822    clang-22
x86_64               randconfig-015-20260821    gcc-14
x86_64               randconfig-015-20260822    clang-22
x86_64               randconfig-016-20260821    gcc-14
x86_64               randconfig-016-20260822    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260822    clang-22
x86_64               randconfig-071-20260822    gcc-14
x86_64               randconfig-072-20260822    clang-22
x86_64               randconfig-072-20260822    gcc-14
x86_64               randconfig-073-20260822    clang-22
x86_64               randconfig-073-20260822    gcc-14
x86_64               randconfig-074-20260822    clang-22
x86_64               randconfig-074-20260822    gcc-14
x86_64               randconfig-075-20260822    clang-22
x86_64               randconfig-075-20260822    gcc-14
x86_64               randconfig-076-20260822    clang-22
x86_64               randconfig-076-20260822    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260822    gcc-8.5.0
xtensa               randconfig-002-20260822    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


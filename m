Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7153CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4/oHXOcXbP+Q5Oxa3dVeBvgo9QjyjKeJarb0yfV16Q=; b=ZTqC2hr89TUgtO8DRoalDhZF3+
	dOd+pULdguI4/5k/Em7qkFLUMMvoYFvkAgJWsapMok+TF0zpQBr6QqZFwuEhX666jzI7Bg0vRrFGj
	AAGCxNY/B0EExK3ylROpEIrs8lS3MQ1EGyrd/Z4QxWBvs4RkBgNu8j4fA43FK8FoaX27IJ/xzyXLm
	2EJo5j9+6ZafbWk6g3mtDHTpRoh+DgLwAAdpNBxizN8buSw2FpLo8TDA0ZxjeuSAQTs//JPzxiy9e
	6484IsxMyI0LYqzgX4CliQSRwfl1YqSgJaJmcfTPdY7FlQUYEaT1FbbpxSXDyUV6dEnwBCeP5kBfY
	PgtZHLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtN4-00000005R8h-43ay;
	Tue, 09 Sep 2025 08:06:34 +0000
Received: from mail-dm6nam11on2072e.outbound.protection.outlook.com ([2a01:111:f403:2415::72e] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvp8K-00000003yxp-09Aq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:35:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl6q4amhPMz6AXEbBMneyiWiTsUpiJjlHOiqbegsLEkBazn9aX1kmKiM11h/Ry1SccvQSbzmoeEpqwpPhRfJTaJCSSt9bSx0nf5fb2pA6pjmccow5CVhz/Zr/dTBfmQsEtQaFHWydaiAEnqjdDaH8UL7n6FW75DY/oL0ujL1NGH9yNAq+/v76234GYVG8WP5XUTpYY4Fj9eLi6g4qpiP3jueDr9xanadEgNmovcGXOCbW5WV7X6aflVb20c8PnIE+1nntr/LYW6Bqj2TrK2+umbs29MShxU324DmLJ2OsEG7rnLPRSBMnp/OaB8xluJc2/7iqaRN2br7CFvMeZeI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4/oHXOcXbP+Q5Oxa3dVeBvgo9QjyjKeJarb0yfV16Q=;
 b=omJy5To3ZYg2IQieCBXQWDtdEcnIe0MO5tpwvMzdMr9TkJR2ShfqSd4IZc4i3qu4wFyP94WKmM8CnoV4IYyG0EV0hHErHKU7op9VI+hvNx6oY4uIR/1uUDyJehnpti6ZO3e61e6AsceUDYzkwv2BDNR2vAh3gAuPSi4tMTxQDvLk7dpSm9y1KEsgF9CiOaH95DvF5Jd2WhHaFhIeA9SvcbVtDyCzpXxOsSZrMlyoBWZqEh9ouYsZU9NYEjdR4YR+q1ZpZBt3575TTaWXLyOmb6iYYNHh5cxEKF9avC+tRWNXIzEBlwZB+0kuJCoJi1SsYM7KYC1DlpS9G1hnIkxfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4/oHXOcXbP+Q5Oxa3dVeBvgo9QjyjKeJarb0yfV16Q=;
 b=CE1/j+8/l+hLSf2hJL4uutb+jqEI1UQ/AUHu22/eycFEaO8h2EengB4L/gC7PByY5/xULLOP7epJuJDkO6yi4vrfEk2qRpN57D/QRPsymYMCRcQwoB4EsqERgSKVOTLN8WIwj3SNyXwsRB5hKA/SBI8NVNSKsxzVxqRks2SpHmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ2PR01MB8128.prod.exchangelabs.com (2603:10b6:a03:500::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 03:34:55 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 03:34:53 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	corbet@lwn.net,
	paulmck@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rdunlap@infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH v7 2/2] arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED
Date: Tue,  9 Sep 2025 11:32:36 +0800
Message-Id: <20250909033236.4099-3-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250909033236.4099-1-shijie@os.amperecomputing.com>
References: <20250909033236.4099-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ2PR01MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 583a7418-7f3d-49f9-40ff-08ddef51cfa4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IknolHLTRzfIavekdOl2G/vd6Q/xRGLBdPhYblhZjtFUXs7o5GLCnJRu+o9Q?=
 =?us-ascii?Q?fULAXk1nnTHLACyAbdUvNnjXYoadLloKUABs49vslXFkWJCvCFl+QDRIUfrv?=
 =?us-ascii?Q?Ga617X+q/zPb1jzduNJ2+gboGuQQLeVZTbiA1SCct7rUjUVBGcmB5fYCuAXn?=
 =?us-ascii?Q?SeRqolDXJQOfqJMnIYZNqwABnW3J1hvgBunOzogrs6DJkElhfL+9XhhbftYt?=
 =?us-ascii?Q?ABy2MwRx7+NjiWz74twA+Z7xo6wcWVGuuCvgR/NKnsSvwk/mF9biOlYsu9rt?=
 =?us-ascii?Q?yjEgrnfusBeESqe02yVXOaTpQmwtoOWvoypT4u27nMWRMubIVphU5bHx16e/?=
 =?us-ascii?Q?KH9vW42Qsg3EMzNFaHLH4h32RlCLKQVNKMj6DDLNgm9KmZza2ZB3zBsgR6DX?=
 =?us-ascii?Q?EfLWp0EEqc5ZvG5qrgm8XND1gb6c+ojlEpPleezrqw+MT8NMxKUaBmDrQ0qF?=
 =?us-ascii?Q?Ra7bjzk5xGQL6gSwHY7+joKelFTnZBR4y31vupCbEGVWq8KQi+llVQAsC7jp?=
 =?us-ascii?Q?KOTe5QT/1qLh6dmHAI/e9NKX5YsDdS39RZMqbLyC3p8LqBibNCSBJbW8thXm?=
 =?us-ascii?Q?/TF6W7WC1ESd5/Sg4PNA8yV+hOPspOnRHZyvZlzVDLF6XJ7lU02C/HEoleV6?=
 =?us-ascii?Q?YjPqu4tXjZwcahO01mfsLMieRl7loOlEEbs7Ukks6q5Nh/P40+NiclVvP775?=
 =?us-ascii?Q?7WwgmrzURytBz5/QhqCX75GtNFIbSQFmZVbnrdvNzDmusklZh3fdv7/PX6DN?=
 =?us-ascii?Q?MJ/yJWpgHxBBzAZ3QwPRxRBGxlBwKp+SstPVMTNUFuvdwDQ02aIr6FAyAFXm?=
 =?us-ascii?Q?Zw8X9IIk71r5926G1q8L4w+IHrrlrYaqgqorZf8I4fD+fOgJrxmmfzm2T/Qp?=
 =?us-ascii?Q?bWFrR/8fWtotrAuTDQ3RZJ5iYaIxv5fYeMs+oeTMeaS1u8vj69xFHGxxzvlw?=
 =?us-ascii?Q?UXHBPlRzp5Plh8AEL6iJOWgrRRTM/SnViA2ntrPaIEEw91RrZt126luhd2I1?=
 =?us-ascii?Q?+YYDVkwX2jFxjBxpeMqAY1HnQXy/vcjkZOE9myP+IacgvWfB6hyVIM/wUL/H?=
 =?us-ascii?Q?2cXYMR2XdJhyg/nSdDLQbXj4q26/klwFYarEcYJjZe7vKE337wsk46ijEB5q?=
 =?us-ascii?Q?cKft/zo6gBahfdGy6IZa3mgbPqXPN7zpYQ3ig/XY+EBUoJuu0mKL/XTx3Ehl?=
 =?us-ascii?Q?93DLdyDrLZ14CEPydn4EIktJWm9pRORTwr8NwB12pSY/jx9e1n93zqwo1LVS?=
 =?us-ascii?Q?QmmrwDPSS3dfCyGvRADUIy0YvxOu/hKsgafYKLa38zuDgFqlTzHefaKRN2uP?=
 =?us-ascii?Q?UTGQNrNPFATWyEaoyhARp0ZmrjYDJF20B/C4KGi4SAE01uViCni3rXAyRqQN?=
 =?us-ascii?Q?YV49PELsCLpQtA1qmV4BIt8rUHmCfd3S/KFA5zzKDiSNtP09SZU0NJz/qMsa?=
 =?us-ascii?Q?K6HesEFUZpnTeTZ5KZf4EmkJsGmyFnS/8MeyHsMrK2C+bZQ9DwgAkXYrUWPE?=
 =?us-ascii?Q?CY9swm9uf3ei5pQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z7w+d+B61O75iJqSV7IR2dHKxXy0RLxpzhcUWTCYU+xkmf6ne0lAJe5iN3h6?=
 =?us-ascii?Q?xO+ujOJiS+lM4yPBBbXeDp7gkXe698mJFhibZfsxKvNMJmxgyCJ01bVQvKhN?=
 =?us-ascii?Q?WsOV3BYSUDVhI5t9JRiTKKuU9H4LEfTtR/SwwTVyZB55jWXf5ibxbcIL1UsF?=
 =?us-ascii?Q?KcZQ3sctKiuZmtFEU7XFdHPdEdf7Z0p8BDhbU1OFkHMqixadN5RjU8t7uSnL?=
 =?us-ascii?Q?Ebm0bMB1lJazxr3xs9OX90tfkYejybDiFHQ88TKLoZnpZ4ic6viervwOKlpr?=
 =?us-ascii?Q?FQ2CFeT01q+zFrovjpw3QImsmjziJZotsk7zuFkbOfZcyNvQuMApLbi344rl?=
 =?us-ascii?Q?pE0Em4H9qC+Oy344wskiTVBSA4Ocm9eJ5GzBXFD/XxPIBBFbE/BL6MtXTD+x?=
 =?us-ascii?Q?rfp6mQ6uc3zZeZagb72pdNtYdQnZPlkGkUQWXwnAUQzKRIeYwsXa3tyYGKYA?=
 =?us-ascii?Q?pIbtf6r8Mqn8Z8j0yFeMJ8x/xLjBUf8AmecV0ixrHvtneIQkS8IsdPHyni+t?=
 =?us-ascii?Q?kr1g9ttOyTLOwnSc7u5IOK07NzA7VwWII9c152nj9iZGK9vA5HRfhgl+BkNZ?=
 =?us-ascii?Q?6HgTXW8Nhq0qSw0wXwjkhCLiEmfdYSiDVmhQCqukBgWCZjhstrnEwjeNKdZd?=
 =?us-ascii?Q?PrO1eY8f3NnMqP0K1bMRctwbfUSehr34r2a5VDIzrZCepvjMfQOpJw2Qm2jE?=
 =?us-ascii?Q?cma5pT+sqv01GndoUPVgjHqBt1ElPD4KBXjewGDt0TJXNHbcwRqScLjVJtON?=
 =?us-ascii?Q?uZo+ErXDcAedd3afs0UJ9s4XNo1FasgsJwibGX6Dki8/GfjVuxRsJnPlLA62?=
 =?us-ascii?Q?tbna4aML3l7GzJC2mlNp4LiF+EQOdZ6EpOE2OsdghfKbtQOXreCM0Rz7AxDv?=
 =?us-ascii?Q?qkbd8BQop0NxLcWUHRydfuOCo9GEzflvdm9+ngWsV65kYG+nTTtiFNVOsI33?=
 =?us-ascii?Q?pgOJh0bDsDPESsoOGCPtGZAgtpMRRL4obwDefU+bLq3Pi/HkWa1DWjfnlPan?=
 =?us-ascii?Q?1tIaTOHaHNycdajN8/MkFOI9LlwkqcOiDHWiYbgea/UhpXWCnPs7rkQSSt2H?=
 =?us-ascii?Q?9ajw2xXJnzgFDx1dcdVD8SDxXAGfDdkq6IBBJZGnvCKJoVScQ+agfCe76GY4?=
 =?us-ascii?Q?0cGQqsjAQto4uCdLufRY+1+5R+haB1io2PEUpHEo4tpQD57BYVbofRre9Azw?=
 =?us-ascii?Q?YsB4r1LdGiGNigqzwGvrvrpigLlJIdMh/h65UAJ1Vl+yabxsHdP9haxGT0h9?=
 =?us-ascii?Q?5MhZuD1sgxOzRow4kOCwRcxOnW8RJt0uxiuISYMNkyJGctPgdVUlFjFJJU16?=
 =?us-ascii?Q?NzW+r/pCjlVx3KsWJIjWhZ8H1z0IJmmRp1to7KtdAsjpnFZLPmk9mUmm+Hbc?=
 =?us-ascii?Q?G7Ro9LA3LoponMASuPH8fFsmaGS/xjHoRIbjpU3PCCDbdqkOkIlbUNgItKJ6?=
 =?us-ascii?Q?PyvwwQn5OkiIiOyyAVJmND9jcS51ptPgu5NCI4G/SZjRB7bdMAmO6m8ivccs?=
 =?us-ascii?Q?xDNyzwrPXKl5O3JxzpZAiO2Ktu9AG8RWXebRtMBpVV77iXD8myaiWc4Z2+UP?=
 =?us-ascii?Q?L7iPPJiBVAzDzSkrk/4ZD5Glvm++zfGgaA2MXxvGOQfWT+DS8/Lfr8Zh9/sW?=
 =?us-ascii?Q?mTqYAhNtAlQHnZQjzpMhXwI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583a7418-7f3d-49f9-40ff-08ddef51cfa4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 03:34:41.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SRn+lBcUtIWjj9ZrhCENp7Gim7lilPNxG7YVviaKs25ewqwEa7pFhBk/llvDJM+GQcyhKu26Km3dkuq65NjsysBZQGoh6LgKQI2tD0Ql7j+L2xI7nuW55rnivBIbVmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_203504_082829_2A1D4A52 
X-CRM114-Status: GOOD (  12.17  )
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

After patch "arm64: refacotr the rodata=xxx",
the "rodata=on" becomes the default.

     ......................................
	if (!strcmp(arg, "on")) {
		rodata_enabled = rodata_full = true;
		return true;
	}
     ......................................

The rodata_full is always "true" via "rodata=on" and does not
depend on the config RODATA_FULL_DEFAULT_ENABLED anymore,
so it can be dropped.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 arch/arm64/Kconfig       | 14 --------------
 arch/arm64/mm/pageattr.c |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1bd9c364da6e..5d15bcd0702e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1673,20 +1673,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
 	  When taking an exception from user-space, a sequence of branches
 	  or a firmware call overwrites the branch history.
 
-config RODATA_FULL_DEFAULT_ENABLED
-	bool "Apply r/o permissions of VM areas also to their linear aliases"
-	default y
-	help
-	  Apply read-only attributes of VM areas to the linear alias of
-	  the backing pages as well. This prevents code or read-only data
-	  from being modified (inadvertently or intentionally) via another
-	  mapping of the same memory page. This additional enhancement can
-	  be turned off at runtime by passing rodata=[off|on] (and turned on
-	  with rodata=full if this option is set to 'n')
-
-	  This requires the linear region to be mapped down to pages,
-	  which may adversely affect performance in some cases.
-
 config ARM64_SW_TTBR0_PAN
 	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
 	depends on !KCSAN
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..667aff1efe49 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -20,7 +20,7 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
-bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
+bool rodata_full __ro_after_init = true;
 
 bool can_set_direct_map(void)
 {
-- 
2.40.1



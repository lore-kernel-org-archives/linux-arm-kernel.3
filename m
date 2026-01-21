Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13FCC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=so4RJv/9SgTTJrlT3kBQl5RTPdIEQ09g/GBh7dxoxhk=; b=dVuNy0g5NcQtYwQ0f0UCinRZuN
	UztK2PF4nmnqiOti5CKkvvFZOBSlSLqru6q82p22cO9+rZKe/n4h04XWS2ODxsRN/+1p7gyReobjB
	mMto4qRWzSEFn5JtSpmD0G/CRyldIhaj5Fzqq2cDKsFZ33W3VBll/s05crpMInaWt04+UJcKLl0xG
	ETHLPr3Dm9RD7NbKfgKeISKWz0Fz60IjDHHvhOP9B31E6xUWoMfleWH93o0Z2sH9nD2UdjKz+IJYe
	BE8hyt/EjmWhVWob3OLfPIIoRR1rxRj79gCjXayt8CkKkzsCnvCCt6sU/XZtxIybS2xJ19fFAgI7M
	Y0mXTp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX65-00000005Oj9-1hPu;
	Wed, 21 Jan 2026 12:14:05 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX61-00000005Oif-3FFC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:14:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwejKjyWwULQXSuqWLXwRRwgzDWBsYZhZXl00WEP90fdfW+MCesDsGESTh7goepnZ9yLw9GFycVWlh17A+jeBxJoviaxAQoftuUUZYcgtmw3LttkwNzBNuj1jeFyjYKUqLOdkyecUF+WVrnJCLIASrbXc2LWvL/4f5ocwFD2dmggzv110IC6OlOwZ+rXgvEwMfHmSAhUPHNTpFDYnEU/y/VjgIRFZI2zTrh4aPZdYK4oY5VG8UFoDZxZ0opTMLjSOiLAQxaj+xaAke+g4lOTbh/QmC3B5t6RuHb8vc5nZr6euBJxX2w9MFf7zgezDEe25st82WkR26xPum45/OaigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=so4RJv/9SgTTJrlT3kBQl5RTPdIEQ09g/GBh7dxoxhk=;
 b=xvy5OWvW3j53loRtVFsz4KvmgAHP1tbFYwTtFz8LBSGcxHki9bmLMmjYaqqC+txDOz7wiCPFWeFTgakvdncC7H5DbGpdidaHupPpDXx6AX5ptGM48J3w32PADdarXu7MFY5kM8bVQYnIYTXyZXfFLT6rz+BK6rBcXekJLVkcQsjyntWUjMeSqv9Atdw5s1urHRkbsXF4VmvKthzdKCEo87mHCY8LG/dC0W3+ckCKVONSQq84TKWglI+sk/4Ii7N/ALa1M2S4Au90ENEk1vUUQzGi8nMUH8LUdTekESvL9aOVliCuj/66mzm0FAFVtQ8AFQPELY3m08TbQ3Dd6mOVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so4RJv/9SgTTJrlT3kBQl5RTPdIEQ09g/GBh7dxoxhk=;
 b=wkqITNQELMhjaR4khT84QGmyeg/MeM3jsy9Blo24LPKX8j0IakFYeJ+IhWKgaU+9Y/hP0prFzng0gzepVwX10adtaY3QF9FuFBM5cMICYST30qXYaGPRg2euhm58PtIH7r9E7pB0u7Ng/82LHJP6gg6WxRPc2MjSKav6b4pLtOY=
Received: from SA9PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:6e::20)
 by DM3PR10MB7910.namprd10.prod.outlook.com (2603:10b6:0:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 12:13:56 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::11) by SA9PR11CA0015.outlook.office365.com
 (2603:10b6:806:6e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:13:54 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:13:54 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:13:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:13:54 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LCDrCR2980805;
	Wed, 21 Jan 2026 06:13:53 -0600
Date: Wed, 21 Jan 2026 06:13:53 -0600
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Nishanth Menon" <nm@ti.com>
Subject: [GIT PULL 1/3] soc: ti: Driver updates for v6.20
Message-ID: <20260121121353.5yip2gf4bxljosjr@thrill>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tclr5yquvg5zylwe"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|DM3PR10MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce5194e-8427-4e56-d2a2-08de58e68bcf
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/+AqJSvYhqJ6FY1HtcvWMOJIPO4GIu/w/gNjH5Riv0PmspQ7YHQ42FF39zc?=
 =?us-ascii?Q?8uZX7nPSSV3S0j60AELeJFvFMh+W15eG2OrOjRPwsSfU50+K05SLR6x9EnCW?=
 =?us-ascii?Q?c61oK+IrlEt5prROJO/+45G07T9RcloMGVCtkCoYqbLumenKPBcuxc/zLSvn?=
 =?us-ascii?Q?BhOgU/gV9AIIcl/Hyz/mH9vul39VLQkhmYjm9JnYSqrXW4asNpRN/Dx685xE?=
 =?us-ascii?Q?Iq0rYDMZ7EgNNMzjTz16LF/gHM9vkONZ1HXOrjJ8AusRoiDEGxxyEQFdDHsg?=
 =?us-ascii?Q?gymej0Zx1GjWuqi1PHWnW+bXhzTQPiIAFWWOG0Sny5cLd9luQcKd1Lii4wUG?=
 =?us-ascii?Q?71s0z9C6onBJtMTKJSEN5khKvguh2y0JEjSRKeeIXsk2Vk+RDknH9+Hm03ip?=
 =?us-ascii?Q?Nho9bCLFRB5ONBN1C4qIp0Y/BZwrDiwOF6x3lN52zcT+/HGNn9y6v4FJr93U?=
 =?us-ascii?Q?JP1463g9UWrbkb5qnzqEN8eEhGtFLlcgbLuT7pVytC7/Ro9rh9pVKmxwNNX0?=
 =?us-ascii?Q?j7Wls3VoN8kMC3wzyvtysYGUi0T6YkX2su8Xeu0DkN+99drIayiFJSfXYIpf?=
 =?us-ascii?Q?pWwFHjQawawCXtHNIGdv5uNHshm8gyyCOVuwjJTvPMETCPdp6CnvAC9KZMDy?=
 =?us-ascii?Q?Jd7HPR1XBrkir37qYGcqFLcCqEfpv/V8N/1bkLDNvvcMq3JtNmpeC4OjaMMU?=
 =?us-ascii?Q?YDUoOfNpX35elwGI8vVEIoQsH0Ms+oguEhQYo0kp+qwm1dziT99ad2qK3E2p?=
 =?us-ascii?Q?DjTE/zvIRHXfpjiCqYgA/oNPVQV4//nCoTtE79HZ6b8LzIfwJlTNrza3Hk7K?=
 =?us-ascii?Q?RLzuP2SZ4YmX9MiXMi3cAFpNTL1tZaW25SdSMFfTxQlvPvc1cy1OToXKz5u1?=
 =?us-ascii?Q?/25UjsZxRNcE+JLaP3tHK1ldlZkOaIgY3AhC0fHce7W3BjtxPI9v+m3beaYs?=
 =?us-ascii?Q?nBAZeTgaMlm2Z4diszI7IHz5PpMl9sX4xjHJA7VOwye8EYBWhDillNLfPyJv?=
 =?us-ascii?Q?YmB10xLOqx/4TAHeqVdhXjxvBpXegJ/uADjDWRn1ovbeTxvCAx54yGsGOOLL?=
 =?us-ascii?Q?rzdA4FyVrzaV+LS/xIfGgG5yHgRgEG9k9NrdmvtK1sxCgckj7fM0w8LUzHDp?=
 =?us-ascii?Q?b5UYWM9dOmrQRMaMXGIHWGZHFIOm2cM4kKI1N+XQPCDyIk0VtUo4/M82k7Li?=
 =?us-ascii?Q?/VumE2EgZKecX5YfiESTxzbWin5bmDdGO+6k4T4BgMdzAI68bzZDKauBNE1b?=
 =?us-ascii?Q?XDpavZcNglc2+z6yiLPJ1M86CREZ86tgvM+9wyMvE44QYI0j1GoWqWYcnTRK?=
 =?us-ascii?Q?35Niu1TgepUoCIYMcgxsZiG8mfoMLtOP9MFQCyl93+ou99X93oqemEB2IZ9U?=
 =?us-ascii?Q?QtMMUhS9QFxxETLRfNfA6w4ktG5/WB0fjoWG7b6nm/ZV/hXS4+DLAR66dQzm?=
 =?us-ascii?Q?Dm9VlpGHKaxuH2RNjnXVfuX1RKlQz8otEjq7UA4l8qxNE0O6IexN4+DF4sdX?=
 =?us-ascii?Q?AlzKg3C2OBMiRvtTfouE+callh/qdgBXFW1vXCxgXul4n/7Q77UkSO76D0z5?=
 =?us-ascii?Q?4MenoLi9u+HAwNJDt/syKHb4KqRSjxWVkr8ez9Yf6BPf2oZ/tHiBhumQS9OH?=
 =?us-ascii?Q?jexLNjJb3XUc3YzImk0fgBIQsM4vfJTqGV8iqprK+ECDNY7SItq9qcnM8h5j?=
 =?us-ascii?Q?e19hdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:13:54.3910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce5194e-8427-4e56-d2a2-08de58e68bcf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_041402_131469_A2AA2057 
X-CRM114-Status: GOOD (  10.47  )
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

--tclr5yquvg5zylwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull:
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.20

for you to fetch changes up to 80db65d4acfb9ff12d00172aed39ea8b98261aad:

  soc: ti: pruss: Fix double free in pruss_clk_mux_setup() (2026-01-14 11:0=
0:07 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.20

Bug Fixes:
- pruss: Fix double free in pruss_clk_mux_setup()
- k3-socinfo: Fix regmap leak on probe failure
- k3-socinfo: Fix compile testing dependency issue

Cleanups:
- knav_dma/knav_qmss: Remove redundant ENOMEM printks and simplify error me=
ssages
- knav_dma/knav: Simplify code with scoped for each OF child loops
- ti_sci.h: Fix all kernel-doc warnings

----------------------------------------------------------------
Johan Hovold (2):
      soc: ti: k3-socinfo: Fix compile testing
      soc: ti: k3-socinfo: Fix regmap leak on probe failure

Krzysztof Kozlowski (5):
      soc: ti: knav_qmss: Remove ENOMEM printks
      soc: ti: knav_dma: Remove ENOMEM printks
      soc: ti: knav_dma: Simplify error messages in probe
      soc: ti: knav: Simplify with scoped for each OF child loop
      soc: ti: knav_dma: Simplify with scoped for each OF child loop

Randy Dunlap (1):
      firmware: ti_sci.h: fix all kernel-doc warnings

Wentao Liang (1):
      soc: ti: pruss: Fix double free in pruss_clk_mux_setup()

 drivers/firmware/ti_sci.h        | 29 ++++++++++++++++-------------
 drivers/soc/ti/Kconfig           |  2 +-
 drivers/soc/ti/k3-socinfo.c      |  2 +-
 drivers/soc/ti/knav_dma.c        | 21 +++++++--------------
 drivers/soc/ti/knav_qmss_queue.c | 25 +++++++------------------
 drivers/soc/ti/pruss.c           |  6 ++----
 6 files changed, 34 insertions(+), 51 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--tclr5yquvg5zylwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmlwwvcACgkQ3bWEnRc2
JJ3Lkw/+IMI9ihyYQvZyOV3vHWWLIyKIx2hf0H8wDmEbTE9AvVr3J27Fv2J99u1V
62BcBMOKeLKrXC+MYXYN9uUpelwGKRFUsOxjSGbrPLA5J6q5xNwyZiMH+PtEprgp
hgac//7IVG2bkkE/tjieG5l0MWd3oaOjhhizNk3M+BSa7ivXpobfIfoE4Yux5m5Y
/fWrb5DTknGwFCbgsVMnzWp9T5vlTuRfoYHTKxG3ECbhkCzVMD6RJObVPaOJf0hs
fOTRtLGgwEqAeJ9u00nwx42+xzDzZXtpoEH04Ekc2ayQxDYMrdO+fH/syrshxls3
pi+eHmb7nWQ4H59GCNLxt+pBpxxplLmyXfi/rwcsAtvkdDBUIOnyWwhUnIQ/P4av
RtPvB+Nd7uhe50iuLYnOLU2hoSPKGkRIbglo6U4WDwK9DrwnwSDx6ZlV/pkN2KRR
NzI3q/WM6y61KP9DRVoA81IWOSK+p72eck2NooW/FNpbjHunk78ZsuvCUyDWKHMl
LgOAPnwfRz/DZoMN93MVl0tGi2qBZo/lpPcC0ZV+FbBw8QxuR2Ug12EfJQzSL9re
0w1H/UT51bpyjWx0XiBIQJSgILsxEH7VQ8mGE5jzzTO7fE9Pq0CmopuSetTi9kKk
HC5Y84F0KUQGNk8Ym8jWektJn/+tSffcZgMJBk7neqsPbLEz7Ug=
=GJgy
-----END PGP SIGNATURE-----

--tclr5yquvg5zylwe--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B083FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RG8o+8M16cDKS75DlKWtiOhlxqbfWDfKUWx3iWdJi08=; b=lF9VYTYZWBcwg6VOWKZ9KX78Fk
	RmvNTsX8RapjqMWOO1yC0Mz2jZA+QalR4uqJCyJOqPwghQCRQOEv10fgeOnfITwio/1FQ9pojNX4r
	CI9i+pcMLqJQvxj2i85gIuu2emCYMk5BS87LyyoHL2ExW7MjYYXyOrBn2wOSi3qhIwlQVgW8dQEVV
	u65C+9Q32Xty4RfVUNR9x9drrLrgVIcDvi0ODe870yYX/UjBW/CC4yIw+84gzwGZOmuEH5YnIYzUz
	CQ+EFy9sF41miAiT+3p0aAAu3Hw/zu0dbW7fqO7E+41aA4N2t/Wrdgq5LZLk1nSqi2q7qp7mtxZpZ
	YWkzJzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8P9-000000085uj-4Bo3;
	Mon, 13 Jul 2026 04:36:32 +0000
Received: from mail-westeuropeazon11010045.outbound.protection.outlook.com ([52.101.69.45] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8P8-000000085uB-0d38
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjZrSjHxrbhXUJ23kuNYkQREovh5mxlah01bpDT1DToXYId9tZBQeuoetea0/ejJMM+I44fyWKhsQyx8GIxGivsbFf/9nxHxMHT15dyGMz3KMItiP92YdAcnmLFbGrMkzz3+YSjd/38Gl73uV6DTX5ottK696UzSTLDn9M2cMXEk02BxR6ujB1nz8q7T9hpfWvJrC3Qr2r9ayj2DneKb/gFkDP6f1LDjWvyoW7C4nTl70f160GiMnw8X0LrS4CpvVV/p4DQ849euSiwX8pV10M+aNB7cPvq/Lrj7SFvI+YQqZP96pm8t0PvDJETX9Nf0DxKWOvkTR3ptytn6oKkIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG8o+8M16cDKS75DlKWtiOhlxqbfWDfKUWx3iWdJi08=;
 b=s6B1jCW9K+Hoga7CcKxiJzhvYVUS9WsSJI00MavZTXREy9o44muxlXsnX3sFBCNItLBpt7VgXZQTqV+mMrkhGrsU6nCGWG4IxIBvsFrzbLGncd7B+gMLMXyVvqJkVCmMd/almlFjC8A6Ss09q9viag0LeGOBOWLFUx+P8CQsPmnACF72P6M3O/7IGhCdItSIVZ2lLFVEKPyiLPCwG2JjB8BrzP+iD91L2IWQRHTsaoz/1vMojXTm82hQmHfGTuGtxShvW9C6XPmTUnsLXgH2O3jPYMl1BMxwqV4pOb7LEH3WdprKAr+cNyA3kz64sTthXDAi6sOTLbr/q1NRhePoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG8o+8M16cDKS75DlKWtiOhlxqbfWDfKUWx3iWdJi08=;
 b=VUs90Mtz0f/F/spHXuoD8SyAz4cJCHXtXMJhUfBHZ4glqLo1o/bCV6FIY2i73ts8OFC/0r9M+qNDlXWjko6B3th2Tu1IeEz0IFYRiWSvALszClfV8MXTf0pclU7pyGDZcebWVHpYq8ZJEWVsqEtOi1pzgaWAAp/+lyBjV9+WHwQLTOnCkrfSKpgguCtAFZcZMcA+Mg0eOGpkWcePzqcSRgzW3kFrFtWAOuJYQk+6rEVS5pPUTAhK1VfzSYviB+6NWsh3avUbcvJR7vxGMsVtu5udV7I1Wg8mmS857h5P0QMi/oAgLFPFdWkoW2a+gaN8ZwycwAcJig9ZfDmxAf8TXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by VI2PR04MB10666.eurprd04.prod.outlook.com (2603:10a6:800:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 04:36:23 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 04:36:23 +0000
From: ziniu.wang_1@oss.nxp.com
To: adrian.hunter@intel.com,
	ulfh@kernel.org,
	haibo.chen@nxp.com,
	Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
Date: Mon, 13 Jul 2026 12:38:56 +0800
Message-Id: <20260713043904.4144172-1-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|VI2PR04MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d1751e-166f-413c-bd6d-08dee0984b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|3023799007|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: kD4P1wRD5nswkDHwFGt0BQUg0xsl/Mozl7wJOwz/U6hwQ1ekjea9XLpDZH5vM20zw/nmpLnrsmquvkeF37ygoVHSlki6aeVzzWtDPpYiDiif2VoMToQUs3pIGHavfbBGzQqVLbQQzXwC8ZYgcUQuWXCQ4oiklI9qfvQ+R1WO9GNfObfGtGtBsaFgIhMLpPZtYEHyBgDy/sZ9rttfRcAoAlRjZ1NvFXG9K829RCDUvwC0yJU6d9B3izL3Frp0VrG8lYIBJE9aZLXr27OaGCETeFDpIc8cJNHpwmrLwayhGQ4Y8AK5fgn7aHnh5y1nCtnlBXriwWl37sX2QSc9PDxNkInBAR4We0v2VeHEWvljKczbA3Qh20MevaGkxY67X5a8zxoQaY0y3iY61evn6v08lrXnQsJOhWSgSrKqwm4iZsqgdrZ72p3xsuF8mVyKquvphCN5rGxLUAUSgf+DOKEebAO2MMpAv6RNCn/f8wx/OGRWxcrwQOgPN78c9mwJtXdN1HjCYM2dGa72ihLS+lrxZinkhRG8I6tBeqf8UV7ecVUtC/EFQ5EVAJ9R7k9uLZEI17WPDRFiCIqxFQFVkQwAMDOKgpbIDqftQTQQ13NCEGaY2H9SBgFj+7QH2tiyy/jnmZu8K0GzZcQr7e75gecjuUSjId7UQAhAYQ53FdBBYsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(3023799007)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cgFU6aFDiMeMmMzL6Mu8aaes5VLIBQnZ8Qnm+L92hz59nkwi+EzkIJ4bnoFZ?=
 =?us-ascii?Q?suxh2Hjm4Ucr2Lp8GdYhep5+7tEtwGJh6c40S00RY2TTQFR3hIJughTRdFom?=
 =?us-ascii?Q?MzUdzWkejxQgcz+Inw9+j02DNdaVQLqN33TTx+jW+omShvkjDz0m7WJOq5aC?=
 =?us-ascii?Q?Jxj0zNnGRvENhbCQvKT7zRYR74W9UMdmkktoRJcvohV1+Fmvrx/w3x436Qqc?=
 =?us-ascii?Q?O4i4NxLpmxOAMziUqKujP6OaUIiiKtS4SZYbjCONS/XI/VQUnkubxIQKCiFj?=
 =?us-ascii?Q?v6z/ldarfI9qbQZGqDNKm3A7EWlMCROrEF8EvfNNYv/XDSrLpr/em/8MAgOV?=
 =?us-ascii?Q?Db3jKObqe2hbnZXMbiKZf7CV+d3lVpB77Mch9RQQPICKdLyTbw020JBscccD?=
 =?us-ascii?Q?nUV5VCHflPFYz6ZVX+c2p7KEJdwXJ2MghJlBSE9lzZy/rcquReEU8JQr80iw?=
 =?us-ascii?Q?SC5DQiTJmGyIscgspLI17HEkduCnXO0e/QMWgPOEwteNY+0N9WKdJdVhOofx?=
 =?us-ascii?Q?XF2PkQmJNzXbEh/oJbrOuweFIbMQPqOUZ3fc1WjKiTOtZ9Ze12Qi6IHOrEtS?=
 =?us-ascii?Q?NPeNj5btpjSwhzZSWlP4C62k6eL0ApFPrz8b2D8MLdXORdEIRg4dyM0pA6xI?=
 =?us-ascii?Q?CSiIQdQ9e+k2C1uHK9uf5sCaBf0pVPtj+/fa3gZjW2PhOKem8yi6hduWT6nq?=
 =?us-ascii?Q?I917V/Ul1mkZQexYwVZqacD9m85nL/5yhTYTdRnS31UOVg94dF3CUbtkV77A?=
 =?us-ascii?Q?Yuxxr6f/mLiaSxe1bvimi/yHCr3rYKfLc091mGBQJIean6Z9RUCPEo8jVrzL?=
 =?us-ascii?Q?YchK1SCgl1qLz3zROlSjmb/AFsdOx5UujkQcJYMAr9wD62LEhlsDqDwfsYOz?=
 =?us-ascii?Q?+9nMNMoAU1kAO2D2wgo0YG1cOmnCOCA+kxjJtMTWh8O0NSfVA95p830PJBoj?=
 =?us-ascii?Q?rlBeX3fz4jfbJlspfpNeixi0FqOIFXMfURjbDDxzAWZgXmPheQXqB+KetjUz?=
 =?us-ascii?Q?JyEAGADcZj1gyzWqFNS/zi2xLH/SFFhIzBTmKun4yB/FBwghIO2jWTUtCQ0n?=
 =?us-ascii?Q?+HRcwx3kMCiV0BiUYa3B1+Wdn/ZIddx9saetYIz+TEf/TbafuWQfKLOv+8VJ?=
 =?us-ascii?Q?uMKvCV+5+aq9ldYQ/6o8/kELgajgFpaB8Y+l9J+9lbX4lsH4wQ/gs0kqRfRk?=
 =?us-ascii?Q?bx8ZnMAJ3o2ALObUL4FhHPMCDNpaEyeMWLuQSAJwXsuEN2FygKZ97NAblAKC?=
 =?us-ascii?Q?wW4cTUxeujGSBGrlhKVuMRtl/s8nL+yQAaH4XzkQvJI4ztQEzqwAhzi+cy09?=
 =?us-ascii?Q?7rVLTMXUBSViIkrJzmujMtPK5IjLvqmvxl8OdJgQn4WtCnkXEN8E1W63LEJE?=
 =?us-ascii?Q?xysBcBeA66onG6JDwgnPGqs/23McwFLzishFfTbnUhHc4cRAt+/iCYOzkYRF?=
 =?us-ascii?Q?jJw1fuPynvFpM3VAglNIX9yZwjblJ7XWGdpnkvTKhOouhpmz4WqAIirPY0XP?=
 =?us-ascii?Q?+U9QlcEvXDDTkBmYmthTPO3z2HhhtryQXQSrSI44nMshb+6kujVooFvqb8w7?=
 =?us-ascii?Q?DaChi/9WgAr9vF14aKhcdTOLL3HLJTaB1sSwTou2yRM+I1EAjhrgrzhF7KdE?=
 =?us-ascii?Q?JkIjQiD29amuBtu39NEJDF3lZi/L2xS05Qhu/0YtY3I4WuB5kbw7/6NdnPUg?=
 =?us-ascii?Q?yJr4LqaWOLGVPAtcgmb7ysVPEwkDj4GfbbhKlvmKsiI0snuaygTeDYG1C+m7?=
 =?us-ascii?Q?2oPhIgTFGQVEXAjLbHZXwr/0Iop2MRbM2qoJ4oDz2R+wsnCqWQ2D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d1751e-166f-413c-bd6d-08dee0984b11
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:36:23.3759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D6aRIbAmGWORSJvKLWZkeNQ7t9wZhbJuCTNcNbBA+c6OD9+3MVA4V2DbEBXqZXWJStYSAYchfo8qilBl09Xipo7SgGWwv7C+8bjtY8aDYahX6EhtC5Mmqtn4PS93vl8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_213630_223251_ED3F9CC0 
X-CRM114-Status: GOOD (  10.12  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

This series fixes several suspend/resume issues in the sdhci-esdhc-imx
driver, primarily affecting SDIO devices (e.g., WiFi).

Issues fixed:
- Tuning delay values not saved/restored for out-of-band wakeup devices
- DLL override lost after resume for DDR modes
- Pinctrl not restored before DDR_EN is set, causing CRC errors
- Unhandled interrupt during resume causing "nobody cared" warning
- Various error handling issues in suspend/resume paths

All patches now carry a Fixes tag pointing at v6.16. Patches 2-8 fix
regressions introduced by commit 676a83855614 ("mmc: host:
sdhci-esdhc-imx: refactor the system PM logic") in v6.16; patch 1 fixes
commit c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card
stays powered in suspend"), also in v6.16.

Changes since v5:
- Added Fixes tags to all remaining patches (patch 3, 6, 7, 8) so the
  whole series is properly tagged for stable, as requested by Ulf.
  No functional changes.

Changes since v4:
- New patch 3: Fix esdhc_change_pinstate() to move IS_ERR checks for
  pins_100mhz/pins_200mhz into their respective switch cases, so that
  legacy timing modes can still reach pinctrl_select_default_state().
  This avoids log spam on resume for devices without UHS pin states (Sashiko)

Changes since v3:
- Patch 2: Remove unused 'boarddata' variable in esdhc_set_uhs_signaling()
- Patch 7: Expand commit message to document intentional skip of enable_irq()
  and sdhci_disable_irq_wakeups() on early return, and explain why the
  PM runtime usage counter leak is acceptable (Sashiko)

Changes since v2:
- Patch 3: Updated commit message to explain the SoC IP integration
  detail about internal loopback path change when switching pinctrl
  from GPIO to USDHC function (per Bough Chen suggestion)
- Patch 5 (v2): Split into three separate patches (5/6/7) so each
  patch fixes one problem (per Frank Li suggestion)

Changes since v1:
- Added patch 5 to fix error handling issues identified during review
- Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
- Make pinctrl and cd-wake failures non-fatal (dev_warn only)
- Use esdhc_change_pinstate() instead of pinctrl_pm_select_default_state()
  in resume to restore correct pin state based on timing mode
- Skip pinctrl restore for wakeup devices to avoid SD bus glitch
- Check pm_runtime_force_resume() return value in resume

Luke Wang (8):
  mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check
    for tuning save/restore
  mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
  mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default
    state restore
  mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on
    resume
  mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled
    interrupt
  mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
  mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
  mmc: sdhci-esdhc-imx: fix resume error handling

 drivers/mmc/host/sdhci-esdhc-imx.c | 84 ++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 28 deletions(-)

-- 
2.34.1



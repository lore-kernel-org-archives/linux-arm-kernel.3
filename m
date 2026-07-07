Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x7M4lNghRvy+TUMxRRzY+Cxfan69VqvPK0WrAwL5w+w=; b=Q+U6N45ZTZEULngNRtwAHPxJD9
	fAxeJ2quVhOjJ7zwXH0C9Bhczx7LbErO+uLdY++BD3JGQCzhxlZC6pPETVRT0pBQgzUIiSofzOI8q
	0lICg3rnBVN6UQZJe/EtMv7EaUMJmpmXNEyTAj0BsaxjzyXWVkgnEbQ0I9qrNnH5mDJUeW1PP0zLW
	zI+AXfCz12gRx17AiW2PJJrjwCbLhLr51NE1t6eSEi9fcbzAhnSgR/H1snHKK1Zbakeal+SGqV+R/
	mfBemu2iNKYYCINBtXlrFBEItTYiUsiHY8SruuTzrmrNHjNkhBYRe2GucVNu8tdtSdzQnEZOjdg0q
	AtL4YLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3XV-0000000Enxg-2K2t;
	Tue, 07 Jul 2026 11:00:33 +0000
Received: from mail-francesouthazon11011042.outbound.protection.outlook.com ([40.107.130.42] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3XS-0000000Enwn-2ABz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIzXbNTXXu2Ba4FiM70zAdSiwGPt5eKCntQmV3HgqSt4cZ9mLqoR81Nm0J85whAEo6TEQsvFMf3w8A1dzf6bnuARAdQeyblfJO3Y8ZyOMPneYa/Jlut6quNSV3GtWB8MU1m6nJ97rq0Z8crEvwh/gKFerP8eCu9mV5QaoLHIt7iMmhpdQwgEqcDMUGG+XcZUZFeojVjjT0y7j4ZVwmdQHSaCWJeo0PP3qq/xDr7zjNJQgMB+h120tbyDkovJM+LGkMIUmuIVG9Tv1M4RHmH6SrlTqoOOV8S6Z0Rig3lzCc9tYn8d2hTcHeFN4e2JiDQn0y402uGtBIuHMF2B5AEU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7M4lNghRvy+TUMxRRzY+Cxfan69VqvPK0WrAwL5w+w=;
 b=LlAtazttO2apEq8vsPr2S2Jpkc00x8PbHrtKusYETypOPJtMOKQLECIdXGFZE2fyOYlC+hRFnerbTkjU0f1Q/u4cGjoolDW00DuOOAaxO+bT0V85C8kVHFBMYsRg2a5UoY6VbWAcqOMx298y9JOcTS/pjQzvOshZil8ifTGSuTymKyilJwLEF61H71qNUeta2FUbjK9ggIubiNIM9919pZebM7QOLmy2RNjb+0HUI7LlwkZiHdHIrsnOjqtUag0qAwawtwxGGYyENSzrMyQddPDiwRw/A6oVYAJWs9XeZN7RZL/8Da+fvQLiANzNL595k31KRRmaQoGs4RMO65URFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7M4lNghRvy+TUMxRRzY+Cxfan69VqvPK0WrAwL5w+w=;
 b=JU+vBLeXtUlZ3SqhMdpw6+wnx/jcawmUx4IQwJDK9akXyMOboURzOGA1RkLHCWnXihuQhWaqrkKI3WW3aFJTC2NyPExvGU8RTdKrG3tdmo/8fGe499cHHwC0TU48oABC08Qg9c4cegEGChUh69SMeEWivCnlrE4sYg5CUnqCVquknl+AMeyVsEfZIzmcdBfnAAJBTpOwqRxgdMN7ytvyTL3lCOQD9/04vRoRq4xEAcZL7rfZ8ok2xCuVlcTzev6aRyjR/BffNrQ2CCs9OiStCUiNrShwn/QZTm+Om0qExkG/PZlbypze2UaROpR/lUf7MNuxTw+NZHALeswkNZHN7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by GVUPR04MB12195.eurprd04.prod.outlook.com (2603:10a6:150:33e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:00:20 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:00:20 +0000
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
Subject: [PATCH v5 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
Date: Tue,  7 Jul 2026 19:02:55 +0800
Message-Id: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::18) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|GVUPR04MB12195:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba2dbb6-bcf5-4460-b021-08dedc16efc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|3023799007|56012099006|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Eh4XFL1JFhFWNC4adyxgEETSaHVTCLXc54Sfl4GNngwK52lbqPBAKRU1VhkJv/isyn8SeW/N/Xe8FgPpuRNnLW6usvSugXDgByXdufCtP2AUo2kSQc/ZsJSlOWrUFsf5JzdCDZLRarOdkv6Rm6eDQkNVVKaPJkaQAksDSSqRmtMCJc4W+pO0CKXJPRYcvgFQuPA5j5c4PbWlkGLBcWAX0743s7onuzJ/wb47YAwXOOgBO04bzGw/PD7W4wVS5BUNLW9j9CcAzaqzRF0VgX0zgl5e13ZlP5GYzbAZkqFZ5il44HgZnk/GCJPQ2SXZ3RXkV4INpDSMNUNoPGyzrT+uVBG4yVPPF4kIIEq5rew2Bgc6JtBng+E07b3MqGw/HwOcsVQG+0ZVBfMYxpzF6rcpu6hpr1okya5Ap7/Hj2/M56qRuNdmiLqeg8235JdUCEx0S3YyeBE/5mC0YU+5kuxkSYrXistSxDmoXSOpFG0eP/k7l6jCKRNh+8zV82k2eDQGdgpRaZw1mKOBJWwKBEvgtlJ5rAYiiJDBdpAKQ/KAM/jgK3b0oLNvP2xv6IwAimRpjZcEI12ONZoHF1XC8ZobdQkJ3RyrZGdSDa/uiVVa1+ouNDzVOhwGeY6MHFnRFH6S7dwX8isp5CVxzVZ/7ZM26RyL456/8YzP7XrX535fYMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VxO+2Orajz4taYlOfmHOJIkU0jGgozwFYmMiEoW3HwlEUDokjUaghMQLkjcz?=
 =?us-ascii?Q?/9ETvS3rxgCEMFNLc0mBp/0RhoyOXNxQmsDzY1Xont3Y97dJ5GSQwHUKrtua?=
 =?us-ascii?Q?RtnpaxT368zURJfwBKuHZfH1FJ+mQvXSF2JfgB56M3I8U1Y1my14CKotm+ir?=
 =?us-ascii?Q?cg429GC/adGkDXsSIx4Dvt8C7swWnfhjdBTb4z9ishfUmvqSZ0z3UwmxZkmE?=
 =?us-ascii?Q?ypiEhOhdkRTCnWheguwqvu+0TSTSdc/j0fiVd5nt55AqhHbzgWdejpKFRZLy?=
 =?us-ascii?Q?WzhzfYXvgsznumsPhlYJN15Xbj3TA9Z2/pdHOHKTk97sSycd7msOSo8XSLdz?=
 =?us-ascii?Q?Zi40J6pAJQj+B0e8yHJxXFl4Q8mSLXhm8xi8AatoK2rbk+dV1rRJm/qscsLl?=
 =?us-ascii?Q?Os2+DekGgwoMChLOcJZagJhKKMBShi2cxQ1go/lzHTacWojoCKKR+FmEf4Fc?=
 =?us-ascii?Q?d7zmEv1MOG6CG1qvfWujBV0iZ1AfmVrAfHbmegdYVFHONuNoUZEQNN3KMC57?=
 =?us-ascii?Q?vMpiX26ETrHeLvb66jQIADRZ0HGQfCgkVDAwTUw1NNujASnY4qJELt8bLDln?=
 =?us-ascii?Q?h7RlLJRx+KJkKK+wWViQMjpxCBQVMBw1BnQsX6Dn8VqAdRiCBsksKAhZpuUj?=
 =?us-ascii?Q?hiT+NBlo/dY3F5lhnILn/qezcRSfHv+gZyDXW6ajDNNl0C8mTpRe8if28wSQ?=
 =?us-ascii?Q?0AEkkqj5Fk8DaMtnoMzT53kOOF+NrfrUm9KdNsmNTkdzrnhUSfruCZG1JSxL?=
 =?us-ascii?Q?exaSXMHKN0VJjVuY/mKICUDfWmfDhzJ48Wui4MBRxwvk7NgvRJs43dB0EHyt?=
 =?us-ascii?Q?XDtkJ6MJvxyRouZz/wsNUI1naK7vuhnHBqFMagUs6LSvDZBUpABtCjTyW/fU?=
 =?us-ascii?Q?R3qoID3GFZUZT/HoFE9qfQ3LfRW3COqaiIFo53AOv2/2TST80/s1lESgsiTB?=
 =?us-ascii?Q?HDN4H2mou6Tz1CinEcEajgiKYngjnDRX+syMazQhMgVufWP7O2Z8OtXCtn1F?=
 =?us-ascii?Q?MkeHQqIf3ET6fkTeI7R0oUpNy+YovCyi/+tWQdy4U1NPj5YWyRbpJiTwAifZ?=
 =?us-ascii?Q?qJOmRhWh0C+1sSYZs1841uabTYmgKzGTLIypYL78ddjdSYvvsGyhvGs5F0Sx?=
 =?us-ascii?Q?g49cfZXgg1qdDmqMXSt8UCADoLzCknw1o9UC9yfMqIu3nf2KfF+y1e+Fielx?=
 =?us-ascii?Q?8/tscRaCADbu6jEkQZ0u3abwOBruF5cJs51gk5FmEK2l8aDpgwZpXc16WL9Z?=
 =?us-ascii?Q?A4PmDR0ySxLyLWM9fWY8nbsgW3grVPa8Upr2rcACQCgyZGR9RjNOdX7CyWV7?=
 =?us-ascii?Q?zXiLxTd5b8kgxe5Z1bi9phL4lTNuYvsT3M0jluxTOg3nyyYxZMCmYqkDCtk8?=
 =?us-ascii?Q?x5lBMlkbMJMayo/qBZQgxYkoZg8JuzZvLeAp2KLr1I8YSuc3L+deodi/YbIK?=
 =?us-ascii?Q?O3WZlwBpHFIPMdK89a7gsdwnPc52P3pbRw8agW3JHY6zj2VvZhm7Wq1RhA5x?=
 =?us-ascii?Q?2FnGW3upA/xiHcmQQuQe4JI/SfrzgJB/umARKU1rbfnIiSMW9lDJ2uBHJfwf?=
 =?us-ascii?Q?ZYNqds7p1vwzSN/hCDTkGz4YZ49q8F9j+slRUgMnGgcoXCdWhPbvf3YofdwW?=
 =?us-ascii?Q?do0VeD2q8gMDLidzCvBsFxkJLyjo8wWAw5TmQpm3IO5bUc/nYPLDarMpCqvB?=
 =?us-ascii?Q?sjDWM0r/+ZH138m+JjAQ7vfSR/7U1iVmUzI+ZxOvemvg7cXhSoo6LbcW+PJP?=
 =?us-ascii?Q?517D1iWnPHla5TE/2lPPgzV8yXPLVtqgkMFgM8Mk3wS0AzBx/kKF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba2dbb6-bcf5-4460-b021-08dedc16efc1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:00:20.4033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUBAxgcthQ2KrYU/Hx+DAkkovprGq7VXDzmLvXYye0Bef3gSh20Q28P+B4Zf+iXGYrtVYCiMZDOYrkNCZqbpJmv/CEKDD05eAkm3+gNTVGazwOgvbCpQnWzMq6M4TG62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040030_583936_7A4AC710 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Luke Wang <ziniu.wang_1@nxp.com>

This series fixes several suspend/resume issues in the sdhci-esdhc-imx
driver, primarily affecting SDIO devices (e.g., WiFi).

Issues fixed:
- Tuning delay values not saved/restored for out-of-band wakeup devices
- DLL override lost after resume for DDR modes
- Pinctrl not restored before DDR_EN is set, causing CRC errors
- Unhandled interrupt during resume causing "nobody cared" warning
- Various error handling issues in suspend/resume paths

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
 1 file changed, 57 insertions(+), 27 deletions(-)

-- 
2.34.1



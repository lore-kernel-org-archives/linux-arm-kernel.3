Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F252C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JJf/AGCikrD1tAzz4S/hYBGqFkxIH4NtqC/fOoP7vlw=; b=ykQK8Pe58s+UJ4tm8/Ao5+CcdC
	oduDJNGjsxdGXieR0/6gCHCwUNyw4NmIaGwWJPHdnvw9+8q+mpSvnf0FWj2p2lN7y5HXdiEnyS3kE
	e+bRtw7SzHDDtnkE/m7y7Vopxx2V9pObttTtkEkzsFHP4nwxX/qrHOoeCk/ASwieC3msPv1ME5C39
	bAg5X4s1Y+B0dmuJyIH+itSwEl+HHUYrZOZT2nEvVZv6cxsFwOuSx6bA5+ETMGwqSQSTlFzf6p3aa
	41YyYLVPfTRzMabzwR8iayDAJIYkRMKQiuXl0kTLc/1JklpnHUi2nWOMOg2AV/2TbDMkn2q1+CTan
	kB3HxX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbJD-00000006fvZ-1sEl;
	Fri, 03 Jul 2026 10:39:47 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbJB-00000006fuZ-1OAS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU9PsSrLZejvYsq3D9XkwoJgn51bFHGLZzSs379y5YH91E8uSaqhdRpX893Bz5FMorW7qhdb0CdncpQ+h/SmP1MC4VpQ0AMtDO3LYhynUISX9t5tJ6Ctdu1qpzOM6hiW2YdyFVHbm4qWAQKj44X6Fg7XpHC1f6gMxC7oRzVlgAyrjW/3VvASPH1YFolh2gHIoLPJisaboBxqjq8chQurGPoHlkzj4SaD2HI8yzmYN1LhF/E16BdlNzDoIM4wh7ot9rSpF4CgIuHgRjMXiWIWj431WeTATBXNpJBj3STPH2i0O/KNQ4p4RUHxdYnkkT1q+rnlDvaKn6jTfb7lMxo1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJf/AGCikrD1tAzz4S/hYBGqFkxIH4NtqC/fOoP7vlw=;
 b=Tqd+tRXVdTyn9zHIeN7iuIhNbikF90WOUvlMrp1LlIX2WagfmhdEhNAEIJLK8CVe1xwIg2ShYi2wTc+jHsq8IkYG6FjUxuUaBHsZP2Oy+9xLcTgDT94T42AmDLlKBzXXqSmwkG22N81R6vvNxdsZuhhDTS1dqeafY7Nv8YMxw49IsnM+ay0i16GfDIBNSQ0fk1K351N2s9czYajwU/pU9Unn2WfewNNvzWkC+NEdNGlFN4UKjlVNK8H35wBfEb0s6tLv4fuWosYIKxqxXFiyju+ile9kc2l9xQAWFHuioZKGm44dnu3NJeaCMLQvhIj5+ny5ZNa9KcA/8KvvOoqhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJf/AGCikrD1tAzz4S/hYBGqFkxIH4NtqC/fOoP7vlw=;
 b=dlezDnJ6YUoaiYCARafCdIF4AGnSEjNuC6lk4kes4R41+LCUINgNqr9zoCDZIybrXjxmItv8PWJK6v4kPM9kHzemiXgfPFjxh6OD6HcI+I6yEB9egoHsbGYDtyVKDWDdL/CpHsQrtFKWucFS9Mvmv4p+TJDka83ZYpyXd6qtAnF67VIh4L3H0B7n3QHzqqmvlCOvP/BkFYfsXTSzL2izXKqFDsEuqit0Lf/NaFXP70UQJIDOce43LTE5qDX6GCnpHlujvOFa3LSqLogFs9Qy5ZOfuWf0Tct+tDWVtNTYrKGzhC/736E5eWmIe/9Nwe+qZ2cX8O5YplvtzI0D4FwMVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com (2603:10a6:10:2f7::6)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 10:39:33 +0000
Received: from DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05]) by DU2PR04MB9180.eurprd04.prod.outlook.com
 ([fe80::f94c:ce27:1558:fb05%6]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 10:39:32 +0000
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
Subject: [PATCH v4 0/7] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
Date: Fri,  3 Jul 2026 18:42:01 +0800
Message-Id: <20260703104208.3426374-1-ziniu.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To DU2PR04MB9180.eurprd04.prod.outlook.com
 (2603:10a6:10:2f7::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9180:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: c88b7a3d-cf52-41dc-fc9a-08ded8ef5e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|18002099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 8UFVHOVJtcN1nGM+Rpfq0YN7mzJYASQK2HEbrzE+/wO7B+/25ijQx2gsbanGwsBSy7rVTBTC/HX9/qSM2bFtoQFOgs0wdT6y3TSPIF2UL1GEBpdYqysqFboZ4YsIOCbB01PErghyWx9PwnhFMVpoNCyb6RXGEVOlmSH324NbErzAcKBO+4m3ffTz9EpuCg4AVPmm6Nzg9ZNHmEiaybzaU5rcVN/tSn8bRekAK0koU3ypMjhMgoGnlhmZtsTSvJOV8z0kt+sIewrWzPR4ytvQp1Jz8g8KeXxiQ5x6k5d/LVuwM+nD+iO0Jjc8KctB8DbTwfJKQTAZ3iwA7zZ4yp06OVaN3EnUy9zGrbTzeE6nzkJv6NQwEA1qDJ1yVTwmZZOik51cK7M0dBmQWYvUqON0Lj0IUJ3LdOuHmen+qgdv8dKXZDjF5o6ztyDQ7BQFOuwXbhx0XR+LzPMqrz3PbzBM3lWWx2Qy8L3Li1IQdEg7rNGvA8QW5GrFjhOkJiChwMaHAxF0UIPW6IWR64ayP0cfp1hj8Kau6fpBHIPdigJHPGhdHpHTACqCqa81GLfMr3bZAPkbWI8YAUzrMxyNIV5avGi4bHc7SxK6kbB5z+sl/osvjXI46aDNBXElkdRfZsEwcrvZ+doEx/uypnaIcgH6vnoA3El+7oekaTSn/7ZVhkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9180.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(18002099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yzWiGewQYUipP/iqx/Bzt5Ibdk4ldBmPXtyTkWnhLsCUhPeB/NbTD1hrgnOc?=
 =?us-ascii?Q?DoVOLR4F2YSSjTvNLz3XRu1Ls3wol1Q75BQLb2PZzN0aTVpLBM5FAZnS15Ec?=
 =?us-ascii?Q?aoCv4rNpheWBi430bWXfTNuGC7VXQYwZPFhO6rDQIUOS6DVHilV4vXMGvSBr?=
 =?us-ascii?Q?OfFGshX0j+Ynat9EO9eS741E6f6UBv33JcbUj40pvutDiW6y4RZO3oGy1nTw?=
 =?us-ascii?Q?TiWPn5+27oN7w7MstYUd5JTMA5TqA/U7/mspbQOHtHUzCuVfj/+LEnZcdC/Q?=
 =?us-ascii?Q?2ZXtqIEpwqsoYorMQxbsdFsS7ZV4qqyehtkqI/1x473aTIytL9WmfHUVNGSM?=
 =?us-ascii?Q?QpAuy+qLnVW8xWodnSg33vqAPmizwaonDc/uqXlljNA/QfWEgrcUN+W3KWNX?=
 =?us-ascii?Q?xAW5Un0f5RbHgHumrDWG61ofWOqMpQ0Spwfo0t+6LDSFsBHFk/jEdBA5ZRg4?=
 =?us-ascii?Q?xi7LVfjv5DI3/+lRglaId29GX7pVz/eKwy5j8j9DsAkgcMFaPOgqORhDZcDm?=
 =?us-ascii?Q?5ViDBiIBii1xhxNLs3MYaHrLKNEroGRdqUTp3CO0Ce3hB2RrFZLDkFc6iJHn?=
 =?us-ascii?Q?RQFQcjUvvGZhoYVigZyUuHE4okBQVOt6+HVER0rCosGqBKN4shME+Br/VS6f?=
 =?us-ascii?Q?kvfFXvYS/X3pRL3vxmb83Wx9kAFxOtqAHMJEaGrSe6xcS/iDxLmmTa7R/tdm?=
 =?us-ascii?Q?gnlCV8RmLy8bpaBl+VTUREEqe3GdohhnZM9Sgh8buB3245z/8B/M17XLF7SX?=
 =?us-ascii?Q?csW12H9mzeF8XCknBkIzONlvoWEnvqVOE7Jp3UniP1ACSMFwTszUo5eHPeaC?=
 =?us-ascii?Q?qIASEewr84HO60Kngtmr5Pzx1r/FPlVx4KqAiRKJI7lVCwoNAzoiXyTaCKUU?=
 =?us-ascii?Q?PW7NelSE3lwnrybqvDb7XGrqB8dMDoI7itHrbrb9eCmut9rdt4ifYvEj0yf9?=
 =?us-ascii?Q?swu7SqIhWl9JIEuPYQLcRfzrirZFWkdmyTKwyGxUNjaqXVTlLJIMk6PwGdfr?=
 =?us-ascii?Q?ZcOQQGO4ALRkURh51W1sxyE1RDHpalHvcRp6WXO38X2QqwoTK+8huBPU7laQ?=
 =?us-ascii?Q?e7CfTPyMD8gqVhW57Dc7+e9DRQlo8y2jJLIEtjd9C9LBvdcjpLAaHWzg8Y9H?=
 =?us-ascii?Q?nmmapIh7QDhTesG44Ac7Ko2ZBpnPgV7PFWFbAysVkkzN9ATP0JMknoVAHusX?=
 =?us-ascii?Q?KA4Ru7O+TiLwwvuiR4m4e7uxWrbpyVDdQlTQWJPax/XrYCeXGGA0RaPfpSQ7?=
 =?us-ascii?Q?mB/ijnGC14nHf4XfuJjLM+vVVW+vUqHONnELF1GghAaSzjXe+YghFszhCfsY?=
 =?us-ascii?Q?3Xfc6S6IGtRHuAaOV4yf5QTebGybntMJoTKWqicHx6Y9MNHgUbGgTARjoeO8?=
 =?us-ascii?Q?10livGoov841brjxSIuMzuzNglWKE6QtRtV75jJ9A+dBbTDW/WJ5OZhazYC/?=
 =?us-ascii?Q?oim2ihcjqvO7F24Y4olsM5QxII35DVaq7N+i/eBxh6e/mj+ZIA+AhuHMWCcH?=
 =?us-ascii?Q?ml57E84xOD8BoEO/7si1X8n36RCXDYwDEwnD7hC6BHDAKGbm/GKMw2MEbF1C?=
 =?us-ascii?Q?rEIspc3DzujLQo8ZnczNGPqzQvlDdCxDuaI0AzHLUj8dznCXtqx/788r7EVi?=
 =?us-ascii?Q?9Y2ntlf9QzteQMkMgNy9O+PaQMORy0D8cCIUfUJS7pvI5km72r805sDXhxok?=
 =?us-ascii?Q?MfVD2iAA2tfsP8AHtNmtFXrVda/PNUTGmPpp3uaTm2B9vrvrtbmWvGIGwvL3?=
 =?us-ascii?Q?LNa5GzXFezg/PpdlXzDRPuOy+hCFkgEiPeQRAsljSr2RPkz63Iw5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88b7a3d-cf52-41dc-fc9a-08ded8ef5e68
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9180.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:39:32.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VedqnYGneqckf/rp7wwd43KG2mVSjfew8HjFY5fn/hLdjHd83Z6yCbd9diArU+NpMp0ncwDL2p8caWxT8jjMRDRiU6XlNL0AfCB31fxy7HnUaonyviqUU7Euio8qZsdQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033945_378994_C6D99EA4 
X-CRM114-Status: UNSURE (   8.74  )
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

Luke Wang (7):
  mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check
    for tuning save/restore
  mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
  mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on
    resume
  mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled
    interrupt
  mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
  mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
  mmc: sdhci-esdhc-imx: fix resume error handling

 drivers/mmc/host/sdhci-esdhc-imx.c | 76 ++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 25 deletions(-)

-- 
2.34.1



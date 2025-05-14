Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A4EC3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDt33tG3AAkAWLFJQJKi9klN/xd5kxi1ZSJgPxYqMR0=; b=V/gJ/KZuBLpKGo8wBTezPTINLQ
	enhA7+292MAFk5Np+qmeDiZa18RCtscNw+07HV1/BcHR+l5PTM86s9m/mQ0I56gf//qCBnE0u/Pwj
	JN1yhyHDpOiTXYeCL7ZGHeXNKdvt0XjL3HeqcKO7mdJkPrqksPQBrHGQgdzikFvr7W//PSSXGSq2j
	MqXwJNoYFol2AZkADMhDXaPODoBkw5z112wJRlVC+lS+utTmGmJFqLjceJIqCrONlbtqXX3tK34Ax
	y7LIEIatbcIeKp05hLBWSMMS7eaqw/zU3l9Ivj8nF2Mv8ogJ0S1QvBOrudyKShHXBegiEb7t0Wtim
	MkSHbt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXe-0000000FGnO-1VZS;
	Wed, 14 May 2025 13:53:02 +0000
Received: from mail-db8eur05on20629.outbound.protection.outlook.com ([2a01:111:f403:2614::629] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8iQ-0000000EiJI-0EWx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6SS5pFTUV1CEAH41w8z13X4pQSYwIKitmALc/20VmQQW4lWdJahYo+3Sj6NK0IG6WUnuYcmKU5uK30v05Hmzixto+s+BooUwc3Zl/OdDkTtQnyD0tk4F/PApWC0whvz40J2pd/rbPZAYHdo0W7Rr7rwCQ4RANM8NoQayaB/WSwelvCPDOMLWoKfODO8P+RvJNwf0oAotrCEMwV0CCiVraM+Q//b45dokpHn2s6oynx16hjNlgdcoiHg9EPYum9n3XPl99JVfN2SRPLSJPPcM8BCt41OUSvUGX5PtL8MZRXQfNWO58ONlhRhIcPxAsw3ML7G6MUkllHHxFCcl3wHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDt33tG3AAkAWLFJQJKi9klN/xd5kxi1ZSJgPxYqMR0=;
 b=kweIJWz2vKQMLf4Fc6NwFGppGnWjto99otHHH4+DKMIjnRyP/u+IvI6Aad5BQ6blEjrTVS4aJOrQfBk4ykXh5rbwEuIQLGrrSUY3Pnh5zwraLNu0yQz0MxUMqbQgwLW02o9hLuPsHaoeWP5XtgDols4MS6hlpKYzw+rjBoMWrv9mnMa5IaPzMf96trZTCgfK6RXXfpfLe9UAn1cIUAgCQGZAZ3cBUKwKDKhjrsSmhsUe1dFL0p4aRmESGzURb0ZGLI7YRGMr4EeviCwwtqXLIjYwtMr0d0hYUqGdRCKtS39v9BLbVZftFxBWijHhCDP5gCvBJjH5MTGL2XIhuTZf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDt33tG3AAkAWLFJQJKi9klN/xd5kxi1ZSJgPxYqMR0=;
 b=RzAYeWCiMUtBuYhiIGj+FhrU1t2F/Ae2ZNgBujlHoCPn2HTmTOaGAWI8Z+1lYnQXQKSAwU5lvRy+oO8rZAkRKCZaGhJNerAcxhOtn2cdXnwCOZffvb6Cl7hdnDFvVarTSmvf+7cC8KC+E6GPxqo5WXVa+PkHXKSRjD7UDk10TamokloIc4GnjTfFNVrtIvZPp1GIoUOM79QjbfbnfZOMQNq8g+WDidGGw8WXQsy59zAX+BgYCIDK8TCgCQ9/Drb0RIWZ3TweCpLGTSlZv3VlMKHO7DoANTacY/Js1kDl5jCvQwRB15PRPNOqSOnvI0tuwk0pxzCRg7q4Fs2/DrV8KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by AS8PR04MB8497.eurprd04.prod.outlook.com (2603:10a6:20b:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 09:47:51 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::4db:3dc0:c292:493a%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:47:51 +0000
From: ziniu.wang_1@nxp.com
To: adrian.hunter@intel.com,
	ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org
Cc: haibo.chen@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mmc: host: sdhci-esdhc-imx: refactor the system PM logic
Date: Wed, 14 May 2025 17:49:03 +0800
Message-Id: <20250514094903.1771642-2-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514094903.1771642-1-ziniu.wang_1@nxp.com>
References: <20250514094903.1771642-1-ziniu.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::17) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|AS8PR04MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: c593177b-7c68-4158-dad6-08dd92cc6455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Fu794nqeKS7TMay7ISZ05Y+dFZvOwqE4cb7LdfpjqAUZYoGQHApw/XkkXOb?=
 =?us-ascii?Q?0Ji2+p+yQjuObd9LQVRncXFDfs5ugHJlvc6qeP+Q1ikv8ZL5XvKPwvrjuuBo?=
 =?us-ascii?Q?59em4v+fm7mF9X3+GlcGGsg/ObTTjhzojQIc8BW/pBkm9jWE8DXQf+6g5ut5?=
 =?us-ascii?Q?dODS/V91tYNEHjiDpbqJ3uQcdetQq74/iwnihWJUzDr169AwZjlz1HKz1ArN?=
 =?us-ascii?Q?yn9aJfwONSpkHNHxEFX/GakEREYwkveoNQEXDJ3T3AbxI4v7cq0JNWxCwdio?=
 =?us-ascii?Q?GeF0xADLKYU8HO2xqGWXZxyHWyuDONY2FrBxgV6deKj6eO47rnSAJU3FlYpt?=
 =?us-ascii?Q?fFYlemYYm41ezv3/j77rjDBs+OW0knfMVFPKxL+QYOvvFQQwa0ZpQOkTrp7c?=
 =?us-ascii?Q?1tJZ40HJelhl1ojXRR/DP0pUUfpCjgYWnxaibqQkuLGL7lNS3a1XMx5JKu8D?=
 =?us-ascii?Q?5fJnnoGZbspA7LpTXUXYpQVa4LL7IHVAUuVvmySYcYdW7TFpeQeze+9mOB9J?=
 =?us-ascii?Q?M3GfW9RW5d+PjKCeSdhwOHgCFIrX+kl0F2Kv7coSLc1Jh5rP33Zxrg5V8G3V?=
 =?us-ascii?Q?uEyv8F999FMlY2YIi4RLVh8som94UmnaJlGE9uCR3OQC8KdEW4JAjZXZtejJ?=
 =?us-ascii?Q?lm3nCNe4CYHGEer2KMjZMBM/GbC1rerTE+uK/oVjf4DQ0ejIxlk9u3QaKmp4?=
 =?us-ascii?Q?ZYh9SwpV9rhn3fipwA9S0qK46f5ya0HJ5F7n18vMjYcZmcSf0bxRxMg/00zd?=
 =?us-ascii?Q?pGSpIGRWJ32j2HaQBIscZ9WNmejWfsRsv/AYuPZ4cqDoj0e7CmVnk3Q86Myn?=
 =?us-ascii?Q?DgPLOXjnP7SH9oLUMj43EvTUxSEJ+TDyv/2KFO3cdlb7MkjXzQuzCfbqJzSI?=
 =?us-ascii?Q?BFd/V6n7QlO611EnuAZWwBD8yQq8TpwinRQCzeE6X2H4V+3e2iovE7XFJv3P?=
 =?us-ascii?Q?rfs0+TXFTVfmDWFB09iVx61wuajbbeYFks4GrRvtUb2SEmChwsvLau+ND5Ee?=
 =?us-ascii?Q?TIpKVuh1dK2RuGOzU0/zk+YKWQROwKG96r1EhhS8O8shvgSiR42fNhgnEBkW?=
 =?us-ascii?Q?ovBWE5Bs9sJW/id+/Yrpx2U95XTMPK2UVp6X3z4SR1yskqr0RFmZCNO2gjqo?=
 =?us-ascii?Q?2ImMSO4KKyXsYsEEchpPorK38tPltjvKJt/eamJpNU6bfEP0cIlN7m1iKtgT?=
 =?us-ascii?Q?98+lQCHiBg9XZf9K5KORqMNbMtaMHIc+OHMGTT3mvDtNzbhr+PzfSgb+ZMsr?=
 =?us-ascii?Q?5l87lB0uQc0+W4KU6pQsY7AFS/4uJ75B041FvTgQZTYlPx2gSJbnYfCrscg0?=
 =?us-ascii?Q?erUQd9aijzxyC3Lqz7eDaeTXOcHumV/agRSDeVhiKFUtW4dNpSFgHBHqSPg/?=
 =?us-ascii?Q?+MhDOS4sf1YH5GoX+j5ayF4pGq5aLb3OpO5ZtoS/gRGsXCy4nLl3COiNx+x/?=
 =?us-ascii?Q?1Dp+HA0ibfOYJCuEQ6gzCgV9I5tJmV+vsxeQWUwXAB3WjIJUKt4I6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wl0ZjrCK1U9oQkOs/erifinvII4lKUQIL0QU2mNgZXDDBjc6igPeandoKwro?=
 =?us-ascii?Q?h42EdJdLWYXqTabsTGji2ydlozXed9D707s3n27mJ9PLamNFIlpn3pDPhvaN?=
 =?us-ascii?Q?ZEpIl/SOYSWmLdlswHcyS2RnwIeq7uD0HETmvxG1fMLOxVuJtDO5sB/EH/Xw?=
 =?us-ascii?Q?3yqWvVi9Sq75YjDTXTJ1hK1dztQgjk0fWYs728ZdeGnWBXpi2OM2+GYpk83O?=
 =?us-ascii?Q?4Qha/lI48tAei9Adl/8zTSax8JD9RA/RGcL5meg+1q6y6ijHbgRuFfs6fVRG?=
 =?us-ascii?Q?5/AjLByvQFcSGuP/H5zzhqgSJMUuDwQyJDBOqglrEMqdFQZs2jp8bOJw8bT+?=
 =?us-ascii?Q?c3LPOfqi8t5LW+gAqonQL3dg57gRn42VtKPglRUcho+2CBIW7Wv+iSE4nV+N?=
 =?us-ascii?Q?2Pto3F9t9Hm70xcuycqoVAsVsD6DjMPHElH26kUg8lO2UPlx/TR5MJcakr5A?=
 =?us-ascii?Q?ebXlqVC02TrJRZCRKcFKdrtOWTDFFcHtzBT5ubOmDUDD0pyOxI1hOsBYVaVA?=
 =?us-ascii?Q?ncNmA/XK3T0qZ4PQjkKNLk1mUm9Bp1H0vYSDQsQVU1XhRGgbUp2i43Q9RKmC?=
 =?us-ascii?Q?hsABF8YI5EsqgRwUibEHMEYGYDETzaqiBrd6F7HGtbKIpWLGAA6v/wW774fS?=
 =?us-ascii?Q?pIcRKwUZcvLn2ukijz6ctHdxbyOhd2/7YhqtPLENGHGo9MfG/djfJkPuIxO3?=
 =?us-ascii?Q?mYnvKpc2Cvf2o39OChDs2jL7Thr+DmS51X1Feuchggw0QkpciJmV6JL+gjrx?=
 =?us-ascii?Q?ywvUse5oOIwckS7bQkpVn6LLRlLgUZoshQgOuyrnAOrF7TehT0sjUu3jknoe?=
 =?us-ascii?Q?7s7Vr50e6ewsZk+KDL/gq4AZespwUjiCP9HCpRxiykZD8Su8eqdyGTHl8od1?=
 =?us-ascii?Q?jvlNcWZ9Ki7EujhL+mM/5w3FhTkc3dImEi2Sdhj6RIM4CJBY24X0E3VE278o?=
 =?us-ascii?Q?2pwW5s4Wa/4nEBf4i/HEy/85q8adeKUQ3D7pyWkCOt6Q/8PUZdPIBfs2k2l7?=
 =?us-ascii?Q?OW3pzlK3fG7uD76BRKAxxMICaEcTM0S1m1mQQjAlWP5wsvnPDV0zjV1j2drd?=
 =?us-ascii?Q?B3wj6JCUGX6XNwKkrzCEwa01PXY7n4iuQ7GtPi17nJ8Bx2XO4OdFZYhqOEiG?=
 =?us-ascii?Q?s4QeCS60z7xZtXCzTcd/QeSJR+54Ruy4iE+wV64H05kb6AModRrCYUO7BVMl?=
 =?us-ascii?Q?zxRY7vprq62Jqvo7sbNmxQCSi/s8wcdImAbYeDkESTuqs7fwTtw+pWh7YpZ+?=
 =?us-ascii?Q?CGJqyyMMX99hnue2nynWSNXy6kY9yxLZDNT0D8gfC/z8iVEj3jbJxBee+LiC?=
 =?us-ascii?Q?PuBt27vj88i8jBjTGLKErPcS6mpwLsFcbXaZO05VI3WnUvtbRh2EA08EINfS?=
 =?us-ascii?Q?gttPDnCoArSWHOhfB1HBfoHumCaeNz6FIMVtp1mGOnm6uP4Q2m4f1mDi7eOn?=
 =?us-ascii?Q?lsZ7ajNayQJojd/EwYecSk8nTYzCy/4ScNNOWJfVrJfavusCYa+nGuI73OM9?=
 =?us-ascii?Q?qtRkoxmREWFC1sgGbUZdeuD9F6j0/duVSL6ODR6IHT3VVCqaQT/lypNBIX+o?=
 =?us-ascii?Q?2R2YqYYZ+8F78vYuboxrdRCykVcnVwDfbEPj0JTi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c593177b-7c68-4158-dad6-08dd92cc6455
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:47:51.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TU8tnVOnDeQEB5JkORsbvZ5dRDFlTEUHYr1jmmSEFTBJf17aEfgu4LuR7W+jzl9mNibDrIIDNjOoOYZbHo9wFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_024754_099606_EA901968 
X-CRM114-Status: GOOD (  20.04  )
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

Current suspend/resume logic has one issue. In suspend, will config
register when call sdhci_suspend_host(), but at this time, can't
guarantee host in runtime resume state. If not, the per clock is gate
off, access register will hang.

In sdhci_esdhc_suspend/sdhci_esdhc_resume, remove sdhci_suspend_host()
and sdhci_resume_host(), all are handled in runtime PM callbacks except
the wakeup irq setting. For wakeup irq setting, use pm_runtime_get_sync()
in sdhci_esdhc_suspend() to make sure clock gate on.

Remove pinctrl_pm_select_default_state() in sdhci_esdhc_resume, because
pm_runtime_force_resume() already config the pinctrl state according to
ios timing, and here config the default pinctrl state again is wrong for
SDIO3.0 device if it keep power in suspend.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 50 ++++++++++++++++++------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index c0160c69a027..7611682f10c3 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2009,11 +2009,14 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
 	int ret;
 
-	if (host->mmc->caps2 & MMC_CAP2_CQE) {
-		ret = cqhci_suspend(host->mmc);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * Switch to runtime resume for two reasons:
+	 * 1, there is register access (e.g., wakeup control register), so
+	 *    need to make sure gate on ipg clock.
+	 * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() really
+	 *    invoke its ->runtime_resume callback (needs_force_resume = 1).
+	 */
+	pm_runtime_get_sync(dev);
 
 	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
 		(host->tuning_mode != SDHCI_TUNING_MODE_1)) {
@@ -2021,9 +2024,6 @@ static int sdhci_esdhc_suspend(struct device *dev)
 		mmc_retune_needed(host->mmc);
 	}
 
-	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
-		mmc_retune_needed(host->mmc);
-
 	/*
 	 * For the device need to keep power during system PM, need
 	 * to save the tuning delay value just in case the usdhc
@@ -2033,9 +2033,13 @@ static int sdhci_esdhc_suspend(struct device *dev)
 	    esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_save(host);
 
-	ret = sdhci_suspend_host(host);
-	if (ret)
-		return ret;
+	if (device_may_wakeup(dev)) {
+		/* The irqs of imx are not shared. It is safe to disable */
+		disable_irq(host->irq);
+		ret = sdhci_enable_irq_wakeups(host);
+		if (!ret)
+			dev_warn(dev, "Failed to enable irq wakeup\n");
+	}
 
 	ret = pinctrl_pm_select_sleep_state(dev);
 	if (ret)
@@ -2043,6 +2047,12 @@ static int sdhci_esdhc_suspend(struct device *dev)
 
 	ret = mmc_gpio_set_cd_wake(host->mmc, true);
 
+	/*
+	 * Make sure invoke runtime_suspend to gate off clock.
+	 * uSDHC IP supports in-band SDIO wakeup even without clock.
+	 */
+	pm_runtime_force_suspend(dev);
+
 	return ret;
 }
 
@@ -2053,16 +2063,19 @@ static int sdhci_esdhc_resume(struct device *dev)
 	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
 	int ret;
 
-	ret = pinctrl_pm_select_default_state(dev);
+	pm_runtime_force_resume(dev);
+
+	ret = mmc_gpio_set_cd_wake(host->mmc, false);
 	if (ret)
 		return ret;
 
 	/* re-initialize hw state in case it's lost in low power mode */
 	sdhci_esdhc_imx_hwinit(host);
 
-	ret = sdhci_resume_host(host);
-	if (ret)
-		return ret;
+	if (host->irq_wake_enabled) {
+		sdhci_disable_irq_wakeups(host);
+		enable_irq(host->irq);
+	}
 
 	/*
 	 * restore the saved tuning delay value for the device which keep
@@ -2072,11 +2085,8 @@ static int sdhci_esdhc_resume(struct device *dev)
 	    esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_restore(host);
 
-	if (host->mmc->caps2 & MMC_CAP2_CQE)
-		ret = cqhci_resume(host->mmc);
-
-	if (!ret)
-		ret = mmc_gpio_set_cd_wake(host->mmc, false);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
-- 
2.34.1



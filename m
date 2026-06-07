Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D4CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=; b=rG2RLInl9K24fVdMzan8jOctvY
	Ed1OBGC2S9WSA7S0E86X/6q5U5dFZgM4vEmQfW0RkqRNZVdWm8kunGnIgWvqxpte2Q7QpVQQHinI5
	qY8bZOSBCh/2TcenLh3FMkm4rQ7pQcCe+J5/pFXeRzriqVMx8k135b2t5j9xRAcjGQ00xs0D4v1Gp
	MpelKIzCP/sjfAK3ySP654aRr8x2vSJSIcLcGH7HyrpPMg3u3TXvFhPMvV54n+ieZj+DZbo2lZwcz
	I4haJ+3VHvpQM2vuQKvuFdYNessk/3LHEMc87TfknGHe3PwD3RcMkZnENtZpDS841w3FWaW7kn5gH
	2JNXOrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cf-00000001ufi-1ssg;
	Sun, 07 Jun 2026 00:17:25 +0000
Received: from mail-swedencentralazon11023089.outbound.protection.outlook.com ([52.101.83.89] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cb-00000001uXJ-17Bl;
	Sun, 07 Jun 2026 00:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CExKO0X74Yhpr97J0qXIxfkAFXxarybgOZGDa+Ec6yNtDkY0wN8Gx+XrJzxlnZSFr6sTpLofQvugul3GhQqX2cIMjHa33GnkdYJNpkFlMS+8a40qHgO1CPEEnUXdk0nsTQkXvv4d3ID+W31B48eYRejRd9k+n6hAFTx2F8IH462MHO1K1aZejHPHWzi9P4Z7FbqIsHT6FuJJs9CPs5ysqyyoG/peD18wvgI82vrjN3Op5PNcMgdiARjrKNFOdfcPrqzWYzGyAU2JsOyeFTRu4pBstun65lBnYZncsGbJh36AtW/v/klXTG61bGnsclwvasfWHPlRdE0vTzyDsISHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=jFHGPnGDzjCsz60emDiI6UIj0+6kLeUwk6Jm2JoU/JosUVn+71I4BEPNjlP5D+6S2wq/wjzT6WVMF+5ZsqNIklBdqR0SO0SQSAoyQlngea0y91ReQ11PcZZCl4pd674utvDJWZ1QbrZ9eRf0fCdSVypMVuJz6MGqvsT+0PljCSlLmyIU9h5yUkldQvifBVTuAvS4JWqV5ot248mkSmOuGJmrJ9Rc3ZwkFGXq1cDJjfnP83gMEJWyPBLeZfC1GXDMybd1ke1GJbknkR1A3sssSowcoYevyGigtgS7pbllJmSiAwegtyYQp8wNYrSLI+1VKYuqo1ycXNu3pwKf7M9+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1SindAhp+XmYFFoCsHoEZJEhj8mwp0oObOYHELj6D0=;
 b=w1v30PIyPZWysjtOLlLlVXxISAIKo3JFNpUvExaPPacmjVo7cwLc881bnesOaZekUvk5UKd8Ok13cBJ+GHAcLlN6GX1i756s2I0WMOpUlEvpX0qNVfwqKmyhDZzU3xkFOj4ap8Bd91MYnUuV6tLJ8usJ2MAH8bGGocg3aATrdtbfwxVA4nH/NfKZxcX360hHN5fbh74mE1O77bW7TohAhYdxgDAQHzvbytdXLp3kreeCW4X8DHWQEGrxqkLTBLh3H2N58NcDrr4tLCI4y7mVM8clb7WXfvsHUFwd8XUe/daTfVjSyiG89b1H6HyTNPG+2REVdQslDPHrldkt0JZcNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:08 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 04/18] pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
Date: Sun,  7 Jun 2026 03:16:40 +0300
Message-ID: <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f8150a-df65-49d2-3702-08dec42a1cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: iLdr1+byZZaUCcwb4JEOVMD23GEedP6b1EkMjbM/sKE7o3tMAW8GRPRJRaMA08LuxNStCT4vdNYOO25XRMWzzpx10OR6VOOy+LGb9httlvoXuTKXbxkYdI+0suCWRvU/+ViyPLM4QZ9YV/vLfRHc0PqrbknLQKLB+hiU+uPkViCaZP4IPohWenNL8toyYuxXAkH7/1JZpjALhop3euibl1SUF1OV8Bl64EJEHPUDeSZ7031jhc+Jr4tbg8uUDuVU3a/T7dOHlQRHQiN5XwQorUXA+eigFHIhVuTdXqQTeMe4HOKK9miUx1h08hl2CJdtmOwJmOZYZ9AMvqUudLa9d8fQzUbXvgQFLH5Amd8yF21x6KzGc9UjBUKkKLa0JXmh+L8ZDWlLBXycZTsxajCrvKykAeDNuR+t7cK48J8qASY/vvJLkPm7loujJGxVeqYRZByzha5fx8kQ5U9Ysj9+rju0iZ8A5YiFUUL7A5qcg/0vhWQIiOgO3df33/WxEJPqQg4en2qwFjPQX0RUfgrnGwQQnDVfH6dBNdL5n/1bRPcDffU47zKeWr/1Z3GycmDxtzUWGsnm5aDVJulMMy496+ZLz8G3XkjJkEtSxOf8OgIRC0uMvQMr7HRDwUpTSeAMN8FUngbLJf5ZPMXqFUe6LDcDYRtGeofisR5XdYSFNVGkq4wvUJi7R7qE+Us5OADTTOr/i38l5Z0ZkFB0VrYNX79OBLdlpl+PyDRVdSBEY9WtmuNn7orWbQ894s46CJ+23qgUhomIDI+Ju2cFS9071Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmgLQwtQN+IUOHLRhAz/nTQ3cc7EXcVL0mgSE21ZRArvhijW9qSysGnmeTyr?=
 =?us-ascii?Q?LIaOU5ex5VAfsJkXiCPxjRhy0DA7Ps8oEKmcByTVbIiuQZ1Gj/tHaLtey/nC?=
 =?us-ascii?Q?ct+PPOv+x9ttkGgGHzCCTiV/RmGZaL7/erLGXCuclEN0aehu6S7a/WobMEt4?=
 =?us-ascii?Q?q/nEYYy/1+nx+kyKpy9q9Tvdax1GdHZkKpQZUf1935homfjz73l8SUYG2opT?=
 =?us-ascii?Q?quNnqX9MU0CYiN3kQzlilu2vUAFRpdA3zrgd/L/YPiEs2G2a+yOw98TioCk2?=
 =?us-ascii?Q?RFo7LkkB1rLnUfbGny1gGWo1VKD1VouSO0bBYfnUfT6+YvUrPZEpAApB3XX0?=
 =?us-ascii?Q?flpCgCSoUrYtvPe+WN1u/ha8x8/Mrl93s9YoTok8Mc12T4Fbx8sTzr+n5uG0?=
 =?us-ascii?Q?B+Ph6/GxDos+B3B+E/UqegK9/S6WZnhUGWj9Bm/lufSEXlYmKZN7QJq/qfNL?=
 =?us-ascii?Q?dJu1zzgIszLpTEiljMTqrkTRsGAPwMUdG6LmpWsU/MQGaM5H0OTdUxOQbiqN?=
 =?us-ascii?Q?BOFCEBe2wcz6WUWx3jZzCtCZldmt7gZc5SRpR41maj4DrV/6bdFkrOqKvwnr?=
 =?us-ascii?Q?gNABaZKoY+w/jmEquJs+RyCUNBVUOHBXrCI+Zk4vL0JiQI4LynI1GcmI7JX6?=
 =?us-ascii?Q?2wsD2OWuyompg96Ji9Tj9vXV/vyysJ6uRoPcONCM2xm/FoTMFNxFCN6IzCq1?=
 =?us-ascii?Q?QG7E55T+/lxPQs7J+6dwhlFu1sWP+a08WifZuJuo/0EiQ8HXDmdd/Jx1ggyV?=
 =?us-ascii?Q?R3vtAlJgN9PQRtqj7E2BxfIrWHDqnPZh5IaBJmKIVJraQRwsm7Lpe7v83Smq?=
 =?us-ascii?Q?V5cEogF4VbFZDsFDhlRVQ2wcOPYzG5vp0poUS6ghpfqvrhogYAxeIdGBooWX?=
 =?us-ascii?Q?A/1CZJqY49b/35bG701ZzcWsKbRltO334zpS+sB3i3VL7xOBtThQ/t24sR1a?=
 =?us-ascii?Q?6NqlyNxFsdfd3JHZDT2LfcMewZsIaZ5UBvEeV5XKDkAjtJ371QhLbY3hgrL5?=
 =?us-ascii?Q?V1nAxuz1tsljYQ4XF9Yw/ss0YCTZF/2dgO5qq11nOHQe7zt9+L5FnaBlB8jP?=
 =?us-ascii?Q?FAW9Pb61tDxFpFuA048k9vyTNeQI+wlktdBpChHpqCQ3tqJrzTAWMv+/1/rZ?=
 =?us-ascii?Q?lnT0qpBfEYD/F2ITxuguxgkdjtkzK9UzGLqaM7K5kHvQ4snrcLyNNc9PUbKs?=
 =?us-ascii?Q?axWDxnsidJb6DqTxLtPh3d5SEjsasDvOO0A5DW6YTlMCdQTp0rUZC+uxtrjE?=
 =?us-ascii?Q?2RpE6/SNQk6rvEI0OaC6TL3+cZYoXsO8haf/A8e0qkzFPSMfQ4GPZNhoVa13?=
 =?us-ascii?Q?jJWAnuYEsk8FRSontP4yTDuQV65oRC8c5jRgNcJDY2GZcyn739yUBwg7YhKs?=
 =?us-ascii?Q?tzOkf4t3+GQERhCnyFq13MCWTWR7aZ3w8WdibOlSkAEF8DxvTMoVguWPR2FO?=
 =?us-ascii?Q?L9NXUnldWuqpT9eLOtnBzPAjgprv/S0CR6a1IJrt7afn6NmYBFK/lnkUTf7G?=
 =?us-ascii?Q?W3+5JZmYIn9lUiAIsrqqb3XJaWAfcjq/ygNL+bskX/Sqwt7BZ1AfwlyBLPFO?=
 =?us-ascii?Q?mNcjbTJXWkrlYLFW2ARw0BVqdZx34Ayy7AK3cRHjvTlm9yzEG6TPh26TcNdw?=
 =?us-ascii?Q?z+YLUhN7Zx2QkNS2h76LXIdv+Gu2ZtQWoMhp/tCuDrlIc9CQka8LhAAetvZm?=
 =?us-ascii?Q?IjNKFD4ptHH12vD+wnjJwYVbPf0B87mVrBw2CfLLWxg7blpXiJ3cRIobhDdv?=
 =?us-ascii?Q?ghXu58TmeEmcDFx6YuXYexTWodgTzAc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f8150a-df65-49d2-3702-08dec42a1cad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:08.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOxJo1alXNJakESGRyP1BpeXi0Gx/81S7qHcjVzEM6rMmp3NZ15AsAGFcDu85NxePxikRiQkASWRrM3X3Xp9tKppGcIvIZMrEAusBcuqALM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171721_305661_80A7FDD3 
X-CRM114-Status: UNSURE (   9.61  )
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

Pin 21 (gpio19) duplicate pinconf settings of pin 20. Fix it using
a proper bit number in the configuration register.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 14b235727736..34eef79d058f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1851,7 +1851,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1968,7 +1968,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2085,7 +2085,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2202,7 +2202,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.53.0



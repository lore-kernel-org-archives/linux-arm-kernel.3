Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=; b=wHavQ4KYKTI/aT+iwGuf/aXVWP
	R9YkBrkDv4BF87TKimAezprlwmUZtqG7TWtDyuzRIddAGarl+6TCTJv+whkanAbi+joXYpXwcvFsn
	P0mQZxclt8A6bxvyo05TdCbFp1kOBWyj5Plxcxks9ew2pZi+D3EzNWFKYktDAOERUn0cDa/0r76F2
	9IzMAoMQKBObr5uQ21KEZV1UzX3HGSIzVF3VF8/tdv4KYKVVi9IGGLRmdPXJpZfFMfT4coR+qf4lU
	+XwDxMIFjdCamJQkPU6g5w1Q+Z+cJzfQN5FLRQkkHj3tjELxBsmasSXAL0dyquVaftqxd1Da9kuJL
	+uNK8wmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRg54-00000008eNd-1PsG;
	Tue, 17 Jun 2025 23:51:06 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfwn-00000008dYn-0wBz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSr1FZDtlmf7B9hFsvcHR2wtW3dOXTc4bLe/ZxHkIdXpaerGFvn9cNthUPu3EKfm2M0nH70uCo/uDPWED9TsuRrWOIOtk1gz1GCKGpm83mSry3qeZhe0FVfhXFFhuxLrJ9GpcHRheWUdkCihrhZpzXQLpY4rXlLjdwU6hhtkMdKC16Kk+/CPmpZjnxMovjF9hAZ3aXXzceYKb2j3TYr+4psf0yEDwwgCmxQ//mNLjcOAtZfRTYZI+W3jAaFk/bPIVA3avnaF9Sac1gGBUhUXySEvIzWY87xEoCLWYd7V2D8eCHvtfT8ZooWbMVVn/NfsEo4mJJ2DdMjeeiQZFo0OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=;
 b=TMYPA/tVRQ1DY7TLjsMee9VURp1xLIHy5oxgAYdyPIfrRTLNecgbT+/6j/E5Ubt125Zb4Hs/FQzSCKDFmk78yI5YysuxoghEBKnFDFa/cplLz49fJU3ZgAyvCj6U/iwi29WUbmB4WvEeTbkeDJJuPWj/YG2KdwV9UB252s95lEfMFhw8YM+sMrYUSMxIDWXRL1CJzetaEgwY2XChUjhYL8rn6Kctwt5bO6nBJJnh2DI78k44dyQ6VRJLMYE9aEGsHQkoO3wANwq0OS0uW/k9kH32PeiuNzLg6XBUpCGaNbh1eQi5TNdEfhkh8Zt93GrZJq+vG4hoJ30Zw+YN4sdrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGY4gJzuITXAxQMRDEDLSXVX1CRJfZTvMJ5N5dB4cuQ=;
 b=Lh1CxTaIfizaGPtQt8Cmxr8I53AVB/UkHNguCg1GVEM78o7UsXMR4fv2uI/vPiGD5DaMM+7bs+DQr0oHXDRHUGQEuez4CAZs6dpO4bws3Lw5GzVYw/+98JwL/ghGDa4z5XbPuQhwuUtj+BN30kNa9kC2ZHwSPc/v57PA672Rwh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13401.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:42:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:42:25 +0000
Message-ID: <87zfe6lyu7.wl-kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: omap2: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:42:25 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13401:EE_
X-MS-Office365-Filtering-Correlation-Id: b880417f-1acf-4a47-63f6-08ddadf89cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/2SxaKqsMXt1khDLgrEsiJB7l2jYpIAkgyJyqm9KDGIbyEIflGJmn33Dlfm?=
 =?us-ascii?Q?iUbZ/gOOwcGIuKyu74JyCduxvTmMTUn2MIb9qx0TBCRdzjWLgUXs45SyUCY5?=
 =?us-ascii?Q?hmZji5sif9IVZd3pUk/Rl8IFeORg5a3By8qqLfY8TLIFgWopbR5IjX2zdtRU?=
 =?us-ascii?Q?F5jBPY2Y2PyaR3me21NckxEjimEWCOaioXMNF7i6G2W0IiJoEnWk34Mg1Fg1?=
 =?us-ascii?Q?aXMWjAqfSoCI79g+G7dCHSjVf2zYKwq5JAucI0Fp0VoGADyGUziLQkF508/r?=
 =?us-ascii?Q?/ruUKi+bRHk4bL3j69bx4iZyApt22QN5KBf63VBBq9bGIO7+6t/MgDdyvhjL?=
 =?us-ascii?Q?IpC1i0qKR6oY//+BUdQDVRQy3MkIZI2aQeZpZZAPKh8cT8UVH/19GrexQPlm?=
 =?us-ascii?Q?E05lCq8TQk19akzApwY4pqjeq3mym+slkCQ0bYZlJnfl44bXrwpaUwq9uv4/?=
 =?us-ascii?Q?TLMOBOUIDAPVsB6zXRsUWc/Vs0Qe3703aiKsDMrKOMU0j7tDwVcwIxjd4YIS?=
 =?us-ascii?Q?a4Fpy95A8xqkajae5zqwfbNNpNqR1mlOtEJYWuSUFAdS/JnRjG6oiYmYKWb0?=
 =?us-ascii?Q?xecSMC7YWjRsZ2by4PlpQDJFisWohT7AnEktcFEVakkysSJJelIC7Wh32iMm?=
 =?us-ascii?Q?gtUlZ0C+XpHB5+0KiRdPm90/p9vy+eYIgYNT73/1deKr75Ly2Xwghh6qkiKo?=
 =?us-ascii?Q?iLJ9Ccl0pFWrJkeFABAdyaHmf2RCDBCg86e95bd9OPolQVnBIDP5kUk7klhM?=
 =?us-ascii?Q?ns2cJfp3VuE/+4w+wo4gaLEibFsTkGBBGABivcezgGuUmsydFsh1lt4+67S2?=
 =?us-ascii?Q?oc8+iGogITWUQMcH60QMOjuvrc/Ay23VXZPUAqkcJTSO9cNnST4v1SrmB8az?=
 =?us-ascii?Q?aEr+JAqEWGWreFpqYu/K8CQH2vsiKwK1JAbB0RDzosL+0rjGl09552rlRmlY?=
 =?us-ascii?Q?xVLm06KmreVcg+CuDAOHvKqmE/tt4GZN4o4XLogIeLKdHQ9oU+Y5fGUGnIU9?=
 =?us-ascii?Q?D8D/FVXUeZAwnmCpOhnKcMBMisTaiK3tvqQ2+BcyCZClQx6KFBSgZ/aox1pr?=
 =?us-ascii?Q?OAURzFd5DXbX7IJMyDGodPlhPvT5SUshu9syr7hS3xf4YtZeCI1m3pRqsqid?=
 =?us-ascii?Q?VLI2uDb1tQWT1i0O7Zc4gFk+HEdUvsc5tDKZqUME/n4nLeghDHN3umNNQcAo?=
 =?us-ascii?Q?d1ZCFohNh53kaobd7hW22pNc6Z2BFyBfVIeiDiozDfCBYteryQkE9C8EsEuS?=
 =?us-ascii?Q?ImnLp2GHit1HJYiRhV9cvH8UNwtI4dMV63pGWS+KE6KfNJu4WV2tIBeNZNVs?=
 =?us-ascii?Q?ypAl7kmm3LuPk1J9yYFJGv3QaNQyId2DhR6QEkVDQ0kse5pAYGghXpUeXQxX?=
 =?us-ascii?Q?3ONe3ziekqlZ3GJfIdlZ8Dn6j8yTqyqFGIkSkoacIb5s/MIQmyRjA6HUQFvf?=
 =?us-ascii?Q?9uad/3lYM9zChoeSXIoi9XPL215VhOHdZ4iPf+XDvboHU5yJdVxylA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDKNzP6WjHxUFsMWHuvwXQ2o/e89WZryo/w4dD/W/44IWX84jJYZuKFOjmGP?=
 =?us-ascii?Q?FiR/Xy3LYgP/rZfULTATF3fqsspbyclDMN4HUzV2QAGElk6EJeNg93rBXhPk?=
 =?us-ascii?Q?sbOUuvEuUC6WxlWDdROpEHTYKWyy9sgc7nDXBcgpFG3ptHvtjtEkPcTk3Zdh?=
 =?us-ascii?Q?lfLPIp+evflNcpww/6fQO52CWm+Wc8C4rU010c1DlnDJ+Lmk2FdouiQB2gQP?=
 =?us-ascii?Q?ExLGR9eIMGSchltQg01tCPBUhaVc27u7MdWRkpx7+PoIs1xxypK83xb1bafi?=
 =?us-ascii?Q?/qI5l7x5t9F61lMjBmBCEPc+Kmvu1Um4EjHoCvAEHE6qyJkr7x2eF8aSmDE3?=
 =?us-ascii?Q?dYJkqbk93p4s1Ne1R/Y1m4At0o0DrPDBvfDlO/j1uYzWG6pvW1Fvu2SVrrHG?=
 =?us-ascii?Q?Z6oVuiKGGP17M659x6/GSGvAXzfRZGLgHWOSI+KUsRKkym7veH8gBA4CSjfk?=
 =?us-ascii?Q?I/ds/b/r/ZMnQ1UV8OKx8hypTDz5utL2hBe9+NTtvTlMFF0AU7TYHCN13rXP?=
 =?us-ascii?Q?9Y+PXEyoC1IwdEvR/HVZaCdks4TzYlGUdCN+A9+n9W2lvp/v6pF+24ABxfor?=
 =?us-ascii?Q?PDr7acajDySB0U/MaMmtRXv1gojzCvmrDXJNYIBLj2zHW+93IGgjANP5gKxa?=
 =?us-ascii?Q?xRfI7xcWlQYxw8uF8D8WpfiKhMbu+tjdCqq+XV4Dx5gX9CdyV0fJtwPlaGZk?=
 =?us-ascii?Q?qD14MzOewxxfUnMjyZ4nmPVen7eZhbD9PumTCo91vnRVtQnjd9oJNckdn2qR?=
 =?us-ascii?Q?BojGUkwCTjb17bn4LR28Sp1rL6z6QNkXL6qkFcxx2Y2v1YOLw+5L+Pz6LGn2?=
 =?us-ascii?Q?i2nSqcnltkhCrvlRgPbvE1ZL/oRD1fWArwuARr/ExknYbYcohmLBSDD9YOLC?=
 =?us-ascii?Q?mtlG+qd4seTV9QyfOvAtUWBDvZ1/LXRlsblNKZPYFfBhEkTPXlJYDgvxoeAx?=
 =?us-ascii?Q?UYqtb74xaUUetywwOy5EIg1S+A4UySIs7XXKenpTBOIrtg91gNs1PT86NPpk?=
 =?us-ascii?Q?SYG/FP63nrNp10cBJMCFb6WfuTaxE3Fu4TxjoyMLJB9aDj60HKhYqb5bDRd4?=
 =?us-ascii?Q?KgD4RSKu8axg62UlhY3qqvhaSLL/J9n1h6hYDjxg8DL2Ry66scUG73ZdED+K?=
 =?us-ascii?Q?/l6scd/Oe3LHLd1Ba1IZA2CzTihp4LerSW3s/CmuUXD2buGj+P4EJ8ujjbI7?=
 =?us-ascii?Q?in7ngrVizpKEV/fvGMzE0ZdcQlTpfLM22Ji23EWVnfFYks1CcNxab3naZMik?=
 =?us-ascii?Q?zf+/+yfluqBuJXumtjTgvS9PbNMb1Kg1uy7fs8J/Q6UBax/+bUNX7XbCBJ13?=
 =?us-ascii?Q?nYkQSpAYdxefBb/UE99ywToFqX7LiEQ46f0/TyojGbZRW/7YUMi7LEWJF+37?=
 =?us-ascii?Q?/2xKBKrsOCIj7tNKiDRxJU0YhTdXDrP5UiHEtHobtUX+oIKq0456wKofpLii?=
 =?us-ascii?Q?7UwvSUPFhedcijXYqF14RsxQujwza8N/MzpZ2vm9mEkRXJG1z/owbbeeUR4E?=
 =?us-ascii?Q?nM1hx3XwOUtBgWF6tYf2FSuTLpy96xO+4YVEGIqUaZbaFXAGvcNWpAVG+UrJ?=
 =?us-ascii?Q?lPM5iyUZgW8OhnIcUl7hxKS5KKyN9IOA0QIAl8yXIcobHaddtnOuKirCAw/7?=
 =?us-ascii?Q?XyeqzdqNJhSnxiU2dhQPG28=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b880417f-1acf-4a47-63f6-08ddadf89cf0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:42:25.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiL5xoQBdN4Rf7+9opwXvXwni6M+0ZikWd75YrmPQP5sHhNZAFs0hHf9dwBT1ve5/snAK6uB8BLbWNY4s/knY3Njg8g7Cu2JZscFu0G7BCj40LKfPdAzcJMuwi04wRyB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164233_263947_4E70089A 
X-CRM114-Status: UNSURE (   9.67  )
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

We can use string choices helper, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v1 -> v2
	- add commit message
	- add Reviewed-by

 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index ff2a4a4d8220..969265d5d5c6 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 
 #ifdef CONFIG_MMC_DEBUG
 	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
-		power_on ? "on" : "off", vdd);
+		str_on_off(power_on), vdd);
 #endif
 	if (slot == 0) {
 		if (!power_on)
-- 
2.43.0



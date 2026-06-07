Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5865CCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=; b=m0/BItggLRlE+nL8r4L0snb4L9
	/JL4MLmF0bzrhq1TFoC1PxOjKanMX7dCqM7IGdGgVhAtY6X9htKaryCLjGVu4fStc1fecQQt0y2Jt
	6wEHi9wski3tYnU3JEwFE9rcbNRksIb3B+iLN7W/75Y8FL8QgbeyR/I8bHCn9uaQANBl7kiLrQzY2
	2XY4xJ6Qv0uVGInMTewwz8wJIa7UnRak0Arl3ZH633B41r0f2qSyTp2kef8y8RUna9t41DTvhTIjW
	JA12fCIxwIYIbPafJNeXqZmHmxa2cbsYhq6kFyXs+SlgTqW0EsdBRB1g6YNGjA0aYHM6RGAd2YYQ/
	NWkbmsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cf-00000001uge-3q3F;
	Sun, 07 Jun 2026 00:17:25 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cb-00000001uQd-2OhR;
	Sun, 07 Jun 2026 00:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBz0etwigVsfvBLff8tJqi6BBao+a/Xc/WqeknIIw6RTb2ggHVxLAprjpxIvgUaw+NgQT+EfOnbRJeCYzsZfShCs4ZWHAdJNhbPJrck+jeITIvNvXcU31fRYCqvtzdEF2sOql/4yimiFFsOe2nNCOhgaZE7hIQYPWCY7oGvoZwWbAMVnfgR+x14a+YtlMJ4PFeWrtljKHHadJ3U7snqBnOEL6e2xLeSZ0OH+xeRH5aVhIAwXkaOrFl0dzpkVVRPP41EJnctJ8wmJ7VV4zlEoFvu/QUeuhkIn10Unv88hHDTmiv0UGz3x4f/HbjMqGtplXmzslIv3ntDfRNPYeTF0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=GJYSZ/X2q+lu4BVPN2o1gwU6/aRk+EBnjBoIILqHgjJHVd01b3GS6FjFsPvs99POLi5DFNGT/E3Ub2pK4TLRS7R0GHU/sqntF1jae5YbfVhlRd3l6fK7eMmuEJCn9L/jx4yxv4OXF6NxoNuIcOFhfN0KwSeuTkX0Oxy5Hcc5Era6+a017bFlQKpoGK9yhPyQ+So/WLhdJTzL3fxLeG8IzL+kIhVaxcwoR9p2xChuEWVvNhr/At9otbx4UyetHCk+3eCgigyxVmPSCfHIonYcz9kZ1sA02ZiZp7YsQ78AdLKNjQmHCZxQ4vkb3M3TQZnQ0aIb8Y+Qg4vJHOHCt+DzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb7ojVHnkxz3fIluPxK2N+Qoq/vHLe3lP2XJV5+sYDA=;
 b=PlmOl2poO2a0UB7hCvy4UQXWrRIIHV7cKVctoikmCzXj0Mwh44xhhYzSF6//DPKt35TGZL00DzJOB3YbVnTKQgkpU0M3NsUvjTJKJmK8welm5cQ2Vp5JaJCJv0xfXNmOT1BcTE+9CBxZjkgZgkEY+e9uZcZY13275g2oWiA/fXwbAXJyqmIRPQsIrBp5ZWpJZuqWzLtKN7g2yntaYcO4ulNUjcRbHzwOMl/dVHPkPG8ON5JmRKtzMQvCQQhdC2S6tIxUjGL2Voz3JwLGRuWyVPfjJ4XmyoscSZRbBBxjCFvN1nXTMGIifsvKWjZljGbJRyz97Qwp8xwpHXYdl8hBgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:12 +0000
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
Subject: [PATCH 07/18] pinctrl: airoha: fix pwm pin function for an7581 and an7583
Date: Sun,  7 Jun 2026 03:16:43 +0300
Message-ID: <20260607001654.1439480-8-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: b1849d81-4116-408a-73a3-08dec42a1f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: s/zFzETWLoh7UxRx46UQlBXgWk1q/XaswhTtBTajuixAEivi0WGa2TmShAGnZOKaL2GYtYgkmpwUC4+7cOlYugb79Rn4iyzB0ek3MS7Ypp/800p+82ikbe15/rJ8BxCadIDxkhymas9yNyd8b9O0PUB5C5Ck91jT7EsW1jlspeNOCt7ahUzxaJ+s2sn83Wk6NpORoTFu/HxN23Q0p4D4XX1BebXhg7Hhjg4rmFV8a68Ka5EBptpyUkgw6tes4D9oIJAYRcGGt5S/bsmzHXtCQRx+wRrufrs08oVOZDOjyq9pkX7oojw2n6oXDFevcxX9OPUZfhISa8qeyqSDWgqat+rAGsE2rX88WymCdaWS4kJKQPr9GKOkszaKJM+esmRkiGUgO2fiQQfUz9UdVQlacs9hgk3S2WtNVOGQCVZP6DcJ4B5PdMUFAkAWOWhFHmk7BeXS2jojV8yYLrgpy+B2yt9K5dlMmcq9/rNcOuIvmIXzpKVN34kNHDSClScN5xpX7X37hJDJkacx824jeoDnLsxqF9B1wMH0Nop32qrp4xa7eJjHSmlR7zdRvAebuhYve6YqzNrizxfeJ1ONpbE6Ydo85PosILargiw6pkbwDCqh4KYH2pRDPQSpr7eRqTeoAwilRtQiT4JCVdMIwm2YOuUyDtngnhcZyQCy00Cjt4z6SdzRGgqPNa94kzsGbT/fOwa8Ph4nLFmjRw01N3yK54J7VKNLq26nIQrQATXkBgZL2ZFQioVCmYiTE7m0Q0Ybq41Bw8kTizlbEKJ6oHslgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YMFY+IZafEfjenRTvCUF7us2yqqiqf7uwUQlxzTDjwKyCOWtsOHipf8wqErg?=
 =?us-ascii?Q?E/wVtUB72p5gez6OHjk6sCaiPLP6KpcEcRRSHgOHtBovpPLv6p9yFom1KbZD?=
 =?us-ascii?Q?d/lugxbJ/ZtIaxs50t6Qj61YcFLALEskN+vdCb6aIcHRSK+v5SopShRylND+?=
 =?us-ascii?Q?XTgwNGd8rKaLD2xH0VBiOIO/M6vlvp6ZNBWcKgiyFA29TABcwZ+yGglHNeeG?=
 =?us-ascii?Q?OTmws5LpseiB+U653LYqzY8KcT6nak0rCXniz/1pRG2fzBSKIllKF2kue6rf?=
 =?us-ascii?Q?HNq+kXB2UVwxY1bPU4dasrE1QkN48gBAGM3QQbUbi9lgu8hzB3f9Zu/C2Dna?=
 =?us-ascii?Q?7JjYtFB4IWDqEq0cUa7riPmNiZCW57/HU5zY5O59auBgx6xUOjJ/3/iTqGRX?=
 =?us-ascii?Q?0w8tyUzZ2aI6VHlev2Aq2viuxKAO9ZKzMEVAQM/8EdFNrwv7WPS8W5V9NJ/2?=
 =?us-ascii?Q?TYsPqpOwCJb3mQtnDc++Cu3T/VL8j5NkOfn0PdmktRbsHfaT1FoaJbpZQIQq?=
 =?us-ascii?Q?6rnPXzxgDVtJreSfyCZi40iwX92NmPrEB6Vq4YaYyfOmAcIcpM/Y4Eu2k+gL?=
 =?us-ascii?Q?XAvBdJ8Mu/DHYmBDCQKwoAHeu8fl/27tYq+uEmDR+dA25j0BqKMacZb2WWYk?=
 =?us-ascii?Q?GJRfQ5cvv3k/w8wM81vP08qj9A1hR2Q1Y56d6jvM7fAx0ZAc9UYu422+oXkH?=
 =?us-ascii?Q?tc5XA5WjV06t8dQkGzkT12o+WzqHXLpPV8ZUOVHgfhDAsbC3DGgFKtyKNQsa?=
 =?us-ascii?Q?EeU7cRkBbm0SKUIgPgZyxjWNQWvk+PWUUKxeZe/W//Zfwq41Y96VLIWzT8DY?=
 =?us-ascii?Q?RaZZzUfB+QtJu3v6KR/bYcMFThRkFCgddr+BW4IKTdvzmWQweQ/SN2K20sI0?=
 =?us-ascii?Q?e/b3c4Ko6uJxy/IUXyTdj5tg9wQxn/iS8c9fJYnHv9ueBNg8n6g1t+Nrmbo+?=
 =?us-ascii?Q?hnXG+wOGrM8bF/w9++v9exsE80jV7G5tt+FFXdKn7cAPK2pkdQVTl3xqqGP6?=
 =?us-ascii?Q?JaW0rIqbojs48sRfXKBcZkdZ5K8FQ1ldVuGPfSIKTMmujr8flmJfCkW1g5zt?=
 =?us-ascii?Q?ajl9/CViIN5sDK/GN/yMjbS2GUI/sJDFze9VFL7cmXDQnZWl1Xso1iQW1Kil?=
 =?us-ascii?Q?EyqspRxzmXAur7EwfeD6igdOk6uFmCgkohZv1mwaUxO0TNxds0f4Rbj2ePgu?=
 =?us-ascii?Q?haD62ehooMwTDT4aXmiIHv5dqSS6azyPmYuDq7hnlTnCmYKceVuV6VyrIwQP?=
 =?us-ascii?Q?AjW800BzoGrGVHFc06r1r1nnI/lOVa6wzuZKHkO8Ck15iWruAbcBZTPNAnIX?=
 =?us-ascii?Q?AfV7ggkrKnwdp7js5qvdtoII6bMkPsukntBv5R+NbkUTflikt3yFw2689FTk?=
 =?us-ascii?Q?Ijx+J7GlEKg+XJbPEzOTTfUKt0TlFjHmmhtvkElIfXY9dqMLqbtbLO4CO0VO?=
 =?us-ascii?Q?JjR+wJTKWYZuQB85PCpwICFPyV7LQe5RUw02W1bCq1NQ07WT13/ubcMbSNV+?=
 =?us-ascii?Q?po3d7TiseR5oh/LpFXh26c7tEeWALGaUz6hZB3a4cpaHpWa2UDjDwisf/t9q?=
 =?us-ascii?Q?3FtCfKnPnrtbeZGLGYZrvwlmy43QvzAaAyoJWvd1EqHkmz3YQRU2oEkrv6WD?=
 =?us-ascii?Q?LPN/SRD9V0IRiu0S5cHD+BGZ8VJq/bw3HMkGlNhxWhEzpdQhoeybuuAu+7jf?=
 =?us-ascii?Q?KuDyseSk2/eeuHEQyjzSUAQDEZHxQ7DV2XCFs1aYGJqdcUxdAz14dXVtqq2x?=
 =?us-ascii?Q?PuE9tH3I5vRE1RHys+zQ5gkxnRuLWTA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b1849d81-4116-408a-73a3-08dec42a1f3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:12.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMOPNkXULcwP5HnOBMYBfYwDPcWcw4gjNaughF4N0kPfN+czD0Wd6YT+MjkDJXDC9hNw6YhTne4TIQ+69B50wfJuHVHCPZos7MyhawKRYVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171721_610551_D47DC106 
X-CRM114-Status: UNSURE (   9.74  )
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

AN7581 have 47 valid GPIOs only (gpio0-gpio46), so gpio47 is a fiction.
AN7583 have 49 valid GPIOs (gpio0-gpio48), so gpio48 is missed

To fix an issue
 * create AN7583 specific pwm pin function,
 * remove gpio47 from AN7581 pwm pin function.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 74 ++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9be759f08b18..15a541724349 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -906,7 +906,30 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46", "gpio47" };
+					  "gpio46" };
+static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
+						 "gpio2", "gpio3",
+						 "gpio4", "gpio5",
+						 "gpio6", "gpio7",
+						 "gpio8", "gpio9",
+						 "gpio10", "gpio11",
+						 "gpio12", "gpio13",
+						 "gpio14", "gpio15",
+						 "gpio16", "gpio17",
+						 "gpio18", "gpio19",
+						 "gpio20", "gpio21",
+						 "gpio22", "gpio23",
+						 "gpio24", "gpio25",
+						 "gpio26", "gpio27",
+						 "gpio28", "gpio29",
+						 "gpio30", "gpio31",
+						 "gpio36", "gpio37",
+						 "gpio38", "gpio39",
+						 "gpio40", "gpio41",
+						 "gpio42", "gpio43",
+						 "gpio44", "gpio45",
+						 "gpio46", "gpio47",
+						 "gpio48" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1504,7 +1527,54 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+};
+
+static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1759,7 +1829,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
-	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
 	PINCTRL_FUNC_DESC("phy2_led0", an7583_phy2_led0),
 	PINCTRL_FUNC_DESC("phy3_led0", an7583_phy3_led0),
-- 
2.53.0



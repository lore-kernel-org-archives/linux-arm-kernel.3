Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040D6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oceTKPCPwvgiXo+cUArbTygn2rxhwU5TBhFtNPxY4Xs=; b=KlolHmis14jEbqHPjoJ0BJB/wr
	gfd187nYfl8bNeiGT21Z2hKbx14bJB81esGqyZ0FdGqqWrVNSQwOCuq0GEd/MuJEV8Z6HS578xGyQ
	73s6xs35RCQ8dkCNyE1G6PddhM3TgTi+bzUUhErdJvVithjKJuxtnt+J0Cp4yBsgEzT2LLI3gf7we
	cEO2RKVZaVmdrMh7BZjVxgXr8y4DdxnRmvhmcQFMoF2BuftLG9b6ff4J6HpNaUVbdX2JMNmvzNv0j
	MOhk9T8N0SsySk3bvLJWZrN5RH3nQp7RFFlOvoZy01PGk6pk+hryh2KtBsnjU9K4di8kw3CWh2DOC
	MoL56Fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usdr1-00000009xAn-3ZWM;
	Sun, 31 Aug 2025 08:56:03 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usdlf-00000009wkw-3TFN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 08:50:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOLTEn1RLN5jw161ab6/wKu5jfrbjG7ACvUVXt3amlld/LINwoTKSiO+D60OYIilchKe4yhPuXoiRM2K8a5uY4Oe5gJnd8gcXGnRSdEbw36D6BMR0VqMwbs1lGOHlvondgoGzbazACw9+9LMyxADBV3pVyeIbc0LLBhkVJV42lwjAV6xDXVnqQ6qzJcTXraCnoZSBmukkrUMmu2gJulxFNlllPk4dsPl75sHmKo9pIBujxohHsl0kNiZGxSt8ZFlfvC4iHAAbMs19xejJWHRwf2/HoV7n/wR6TUvPUxfcsuPhQ/xvM+PPUYP/S/S73N3hY73/jgCkmriUE6AskPKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oceTKPCPwvgiXo+cUArbTygn2rxhwU5TBhFtNPxY4Xs=;
 b=xlEREARNPw7C8kB6+e22T37MQenE0VkCgQVHt05mmCrTb877BO2lFwRMWVDiyHR6QW3LDhlX4BVC05Qe5UoLsyRHXzaBp6pvRnpuEqTR2wOBXYZXCCt7HbZzqqg5ijycAUVN5YJZMPrO2m5ovvhlTJEeAU1MM+X2xJTwjDVHdviw/r9gh8Cm8fYYdcvM++iLultd/E48y3Bz2UoOUR1s9jppDisXacLJ5PFiuGmhg1kLnTS7CWMVQOE8sycyU32rOLUJUnfC/sTqkKd3v8R1M3cciuw/u/QW8iZKijwlcHaTCfeLKUR5+fC1D2LNHKKiN1jDSa4sCZmS68U2+2tqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oceTKPCPwvgiXo+cUArbTygn2rxhwU5TBhFtNPxY4Xs=;
 b=lFjKIaTcTpL2gVow+wy1a+rZA0usqd9SgXtkC1vpR+Y0naC/7kOq3oDazZOwsG3cARc6mgDGt14p/KqWI55E8prguHCQQY8/a3/3mzXfSVt4wS7U5bo30Qfm/m41uzp3q+BiPeD9EFvmNo02V2XwUNbJVmCqGHtdObp+NeoIfnPQMsJoMWNopGi8p7APmgfLFLWiKrIFT4B23e+wwjlL/bQjyo+WynbdmDzfnExfAjqwJDdMtlavnxcch3NFUeTlUOgdaYhTuxzjxq3Z8fXXiQrg0Zt++DCC35h+f1VCVk/OOtZkEWqA/k+18MDu6BvWwBbPwI0EyOy78h+MHnovoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6372.apcprd06.prod.outlook.com (2603:1096:820:99::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.26; Sun, 31 Aug 2025 08:50:11 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 08:50:11 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 1/3] pinctrl: armada-37xx: Use int type to store negative error codes
Date: Sun, 31 Aug 2025 16:49:56 +0800
Message-Id: <20250831084958.431913-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831084958.431913-1-rongqianfeng@vivo.com>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: e2da5716-f31f-482f-271c-08dde86b6529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vbFZEeBTgaB1lYwZpG8yCCNGYHFKRm1F0qvkYwcVgeM1i6QxsqgmITinUDhJ?=
 =?us-ascii?Q?Ra0uLaAxWxhhlj/RF9dMnmQRheTqvi/lzvfgXCh4OQZYyHhTAuwtNdXhanYU?=
 =?us-ascii?Q?W6/mY01rY1XnXr8Xq/Rcb9kigL6q/+W/TmAPAseHFPmF39IH1VNxTvHeUwSR?=
 =?us-ascii?Q?xNkpnvzWxKv42HUnipUu2idv46DQIH6kET800sZCPZ3XfZyzaOrl+zbMpCDW?=
 =?us-ascii?Q?lc8C9q99D1u6nk0JAMEDJ/NsRO3d7BqqKd1oEnhgOk3PmFeA5u46Y65FR80R?=
 =?us-ascii?Q?WbcF7JMxRcztikJeiHRbzvP058mhSP5Un/uvRpAGtADAsT7J1/tA6uiVZYGB?=
 =?us-ascii?Q?UjiM8Q4dK+u8OBEmUfUBSuiRdSDpi9AfnyH8DnFy0s7ybO2isXxQE2i0BAic?=
 =?us-ascii?Q?0Kmdvb61kRT0pbxzYJxsJLI148YabGYVsLKimWBTNVugzqVVzlHdm7CtO2g+?=
 =?us-ascii?Q?PXvNDJcwVK66zrrzRvTxyYJsoOHRFxzahebLgs9v6f1/elL26Bg4RauKzJ0U?=
 =?us-ascii?Q?3p7DEKN0gy/VoIP74ILiHvUMA1tT77aAd/pvbvOaMdWz0otw/U9vsMS7GWAh?=
 =?us-ascii?Q?/Cg70VZ2DZbQ1oLiIVsiZWCDKtPJtie+z1fbwx1Y/OGAOfRaBWlE8SbSpOHe?=
 =?us-ascii?Q?H99U1TLI4NuQNRRLYRFYg8PX5D/BiQwhZnZFhhcDVLhmEWoMriq3anlzM/7e?=
 =?us-ascii?Q?/mv+Zt5tG0XqhGQ3xE/4vYLOXnF7y7nnoaRHlkeiNWU8Dlq0O26xOgRZ8+Zn?=
 =?us-ascii?Q?1vWDVJ+hG4qs2wiqHNg073GhBvFpkF5ktHZiUbiBzKztZZmnc4vnvg4bFpYr?=
 =?us-ascii?Q?lfRoQ3kAhSMOunVIh+P1YS7kg0yCD7Z88oUHrGffrwmoVZrlcURMJkdDDGlY?=
 =?us-ascii?Q?hcjUIdpzNrcyYzGSS3iqtnCraz0jqMXVX61K835oqTQl8TnovEXGwcYzUxA0?=
 =?us-ascii?Q?Oxegl7hwZWNs1zFA9XnVceZK+gH0GcqHDl4nHUGEDQZFGFfX5rn+KxgGmvga?=
 =?us-ascii?Q?xAjC2bwRXs3SqdP/O14zWnbrB3J+qJtDttE5HuvChVX1hj5m2fJIBWpIcKt/?=
 =?us-ascii?Q?WJfUguYmJ7Ewld1kuPRgWVmQ/miqGejoQM0kM6dbl6aPeLHLhl8CcYqH6pSK?=
 =?us-ascii?Q?Nt43oK/XoY8Frh/G/XNL17cZW8co3tnVxxjftAuAHnUbXlYEV3Fti8HbichF?=
 =?us-ascii?Q?3PV+24y9hq+ac5FZFPTG1vulYsYuPgaWUTg60n7SQN4M4xPgAwkc/kIsREuE?=
 =?us-ascii?Q?VnnjgYq4CjHeM26PvzKor/2UYnWn6pe7Edwtt9YOre3eMJCwez1LHpuKd9dZ?=
 =?us-ascii?Q?mpqrYUpEqekk3qjQ7/csBuoBsIsSMNAh9RGVnxPn7s3j2flUm+dZnnt1P2qY?=
 =?us-ascii?Q?xHbhtTxt0ID0oLf62oisu/UBEImY/puQLNcjkW1rij1euX2s8A2V9TENjPzF?=
 =?us-ascii?Q?H3xMDLM6RqLRoJnifw2Q0E8RgvlBiBxIyPqPRcVrUOHPLOhP3ZxPMdbJblve?=
 =?us-ascii?Q?grFrzPM6HuX/9gc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDVvdyrlBUTZqxOK8GcLfXMPFA21AhoNWqGTngaF2Xf58woFaE79t1deq6XJ?=
 =?us-ascii?Q?WIBdRPq1GI+dCmP8J2R8Gbmkz1VAa5baK3qPFo7ZeWxcmbhmuErIqScUP7AB?=
 =?us-ascii?Q?F6oGrJ/si88y+P6NLQvsFHhC3tbpCidJvKW/xKQaZ4w3Dqu6+a3cZstRdVPM?=
 =?us-ascii?Q?ms6msrIeORM4UoiuS6wF49uLo734Gmhs3/TVNZ0tX/DDCAVNcoBYixY+Qj7R?=
 =?us-ascii?Q?QlJlLUzBZ/hSNpKuUgoD1zSTUodAN0yBp2RRfJ6ih9ezqmozOjjsEG2EOHsY?=
 =?us-ascii?Q?z7mJzH3kndy1YJv08R6Q3rNM/I4A/y7H0irlESlAzh8fZpyyt78LHaNiROXl?=
 =?us-ascii?Q?l4bLfwgHxQTKGu1NOHq1rRzSKsjfw05+sxWrX54yqyrBA9n+hjADRUSlx6my?=
 =?us-ascii?Q?4ajeNAeCgIPe+1DEVNOzIOEXfFRd6pZaDPrrwaNIF0TDpCvE0JHJhT0Y5IUO?=
 =?us-ascii?Q?tUb3KrLFLENSOhaGWXDw9UyxvG35oCwXN0wowUOc2SB0DJiCeXFJnHrA8z+e?=
 =?us-ascii?Q?iGV0qnVcCPAOlWky0yOMjhG/OcLB6Aoqfv7llUSGQt7UvUUfO/fCKiXQth8P?=
 =?us-ascii?Q?DRGLGcUzDb0LveEKaW11iBT1Ga5s40qCPEQdJJtCRaLAHLhBlqVUMCgvtyKW?=
 =?us-ascii?Q?RvE/dT0ayTXzvo0LwLyBM63u5sCOgQ1S99ne/5PP90VZt4+DtoSdkdrA5ws6?=
 =?us-ascii?Q?av+QJ4EPRKduavtVqJVt3CAEleriHbFpB9+GRC1Am1QcTFV7l4cW3GVJLgPo?=
 =?us-ascii?Q?8uoRPSVE3sZwA7aAFQEG+F6SD3S1sJz+Eyy0Ncz8rS+vlaqGXipLljTZvrAc?=
 =?us-ascii?Q?VyVtMfYwTgG5YPBzk5bs0Xt2RC73IuE5gXLGDVyARPoAMpVEu8T2MiL4L2PN?=
 =?us-ascii?Q?IKeavXXZSYA7aL8kFcRzZ3tySWtsHFd+BlWvZYVt1Ro7NW0jbXnpJWysuhaM?=
 =?us-ascii?Q?plvTzq8KSwOPv/Tx6qmmxKA7b5A9R8BinO2stee8iXAwNkSVvfYihMSghEAs?=
 =?us-ascii?Q?1yWUwVbasw+fuGGWhCz66a+EauzOV8rMOSMiS7QLpwUiD2TI4aSSiCca/4xM?=
 =?us-ascii?Q?kZ8BOS00DmMy7g123f8bkN7eHEu9XmSYl4OjBi2JXRQ7DzbNW7WdBWFf9J6a?=
 =?us-ascii?Q?ULWPwnvzk7qZjRTqdxqzx0eMqfDjOklFz6n7X9Cx6J8s6ARJZF1fxPiXQvjf?=
 =?us-ascii?Q?sWElfYEqbMdB0SLv2Y1snhb4Bav61n3D32g0lEDg4e7GXWe6vYaqTSfPE9qb?=
 =?us-ascii?Q?0DgUzXBlcFlFaHk/9W/b7XDnvLTnmsTWcACShl0q5kYv1/74v6RD1pBT9FiT?=
 =?us-ascii?Q?MAdhtCt9yi2UflCU9WWO97i65WVBts5LfCJ5XRro5xfyH3kbS9VkvJcOkLor?=
 =?us-ascii?Q?A/SEMVAddtIet1TYR6WmmVmyF4XpAFazrvythlVoNAxCoDJAumtNttaUZY2Z?=
 =?us-ascii?Q?Xpabau8qlMv4a/aLY+iVqz0wFOvVHiJ3oanH5VwQ8n3vZyCfTfsjdDjdf5/i?=
 =?us-ascii?Q?xBCglS3cRF9gUSkjJidE7IR5+/j0n/YYl3RGB/NTbTldhrH652cIRUAGDi9Y?=
 =?us-ascii?Q?eOyFG8nVQc3YSef/C/sxn4QyccGhmmTzMdgruJAf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2da5716-f31f-482f-271c-08dde86b6529
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 08:50:11.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rc4zq0u3P4mnzipkCdNb5GfE6OQz9OqyNaVGK5K77Tfmx93mTgIXlZcFDTTGzzlDn2+NHWQjt7E/7pj9XVmEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_015031_870800_32CBC757 
X-CRM114-Status: GOOD (  11.25  )
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

In armada_37xx_gpio_direction_output(), the 'ret' variable might store
the negative error codes returned by regmap_update_bits(), and in
armada_37xx_edge_both_irq_swap_pol(), the 'ret' variable directly
stores -1, so the type of the 'ret' variable needs to be changed to
int in both cases.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 881df5e08f61..81dfbd5e7f07 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -420,7 +420,8 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int en_offset = offset;
 	unsigned int reg = OUTPUT_VAL;
-	unsigned int mask, val, ret;
+	unsigned int mask, val;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
@@ -634,8 +635,9 @@ static int armada_37xx_edge_both_irq_swap_pol(struct armada_37xx_pinctrl *info,
 {
 	u32 reg_idx = pin_idx / GPIO_PER_REG;
 	u32 bit_num = pin_idx % GPIO_PER_REG;
-	u32 p, l, ret;
 	unsigned long flags;
+	u32 p, l;
+	int ret;
 
 	regmap_read(info->regmap, INPUT_VAL + 4*reg_idx, &l);
 
-- 
2.34.1



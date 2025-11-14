Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59258CE8D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AZer50+GPMNtPYm2amIBe4Dq5qgbmJWrOxElWpkzSw=; b=pgKkUu+JcSgdfyo1+vxZjJYflm
	99QnBn/WBPSloeulAxpzfx6S6Hv/g/hNFotNN1XQ7lg8h7ZVBs17PybBD/GGc2C/k989CapLMb6Ir
	SayHmMkCg9LJNaVoQIMBbZd6ursxpP/Il8EBDykVUTzcCjNGkgPvGDCShGB/EyVkjpgOUFyCipwCe
	yYRdKtJaR32Pzs1QJblb8ZMgTT1iHwQucJEdR+Tjd/2rEbL2FQ8nCg3TBQbOFUO0W96/oz4C5OpzZ
	ApcZPTLtBVTRKXfMkIogIiqV5o+LBhz3OpOIDKBt1/3HX+apeQ09niOYivvI7wbRNCXM5oZkLeXWe
	8uhTTOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxtj-0000000CsD0-0fuD;
	Fri, 14 Nov 2025 17:47:47 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxtd-0000000Cs60-0Tq1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa9S0QDGsMHz7tKvYTrfId/L9TOGnKzhyDAWXN38iOEewo3grkLe7Duf8l8KPoKtDZgXdx+HWRbRchFQJ9lo92lRxhux/dOWk40ZjlEFRf65Slen5bg46rUD3y9yaiIgyWP3fx+WIiChr50Nf7sF95jKZVTLJ/vvJLqpWOlCYpCZLPYoovTLSCe6IlCBjgauK4tvuEdyXR6NP6djoeJEb4xi/yCeL9jNv25AVSX1X7L8R7F/Em25dWwrR61UwRpupZLWbcFf50mU23u4LxfJbfnaTcUoPOOxB2QwrmdnomHDpGrA7WCqG7Gc8LTOozAwdtVneMaslWaxP9hA+88Fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AZer50+GPMNtPYm2amIBe4Dq5qgbmJWrOxElWpkzSw=;
 b=MYJd45/v6CxeQFYezCNLgxdiTS4DlYB2cJSQvhcJVwLtZs4F3k4nkDsS8kflMSv+fyTyl0/Mp5en3880BKM/CoORm4r5Cc/o2F3+TV02O89jtDLlGmqNNj/qcBzRsIOteZ7rSb5VKnXbtenh7mojoiAz6J45P6xQxziMZIYe8wduqFJvbi+bFUdff+KXJ0X8bNE3ZrS/fy522+PKeTSSwUE31YX8aaKRrabU59xseEhp0ZqEehLwX3Gsa1iBfNvoWuGfyceLdpPREqopdAy3inXYsvyCdLsbReYp7j5A/uyIbMiREQ40MjYF2IZ05+BJuMJlNWxsGBfcqIW6J2Q+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AZer50+GPMNtPYm2amIBe4Dq5qgbmJWrOxElWpkzSw=;
 b=YaDY7KsesjI0LyedhJN6QviNhYdFthfRlECBF+x7OH7uJuCEHhmod1UE7OmBAhxb+HWewvWtPIKwNkC9gu6LVsMa4fuw3A1rWZFD5jenQA0BeA1YztSCDTV43TRSfSKa+MvOyNpdaVt0co4Bel+HuyOUeXt0WFDtB15MT20oLlcTJ2pVdBuMiPMfwZR/YbL6fxPq9Jzumct9+rrV/mk4mnLWujJGlwztjxfljhBrcEtPHxbzOF817YvMBYU+r/GDRLWrpZJWl9lP1eeJ+afOeeLxEN0+3JGOVE6IKyx2V+C7zre+cbb0f6z9noH/RwtKMvKKAWMYk1iLNj2bmlcZgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:47:39 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:47:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 5/5] ARM: dts: lpc3250-phy3250: remove deprecated at25* property
Date: Fri, 14 Nov 2025 12:47:12 -0500
Message-Id: <20251114174712.1206027-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114174712.1206027-1-Frank.Li@nxp.com>
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12102:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe57ca0-d5e8-4f62-2ced-08de23a5e79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lUOSh7/heiV1yaN+YLkc0jhff4kQ2zZOV0GPHjO3/QB2FahBe1oAZ2pNDq0t?=
 =?us-ascii?Q?nI7zlHM278xZFFXf/4OijsbooQrRSeOceUB8mH8Kbhzd/HqPuMKqVCtzTAPA?=
 =?us-ascii?Q?p++YjYskQtStvTL/yYPP+mc4cSPLNzxP70Bjkvx/GPD5nQslG7b5k3MTpiWf?=
 =?us-ascii?Q?Xf9/gYS2o6UNzUITRsJNCM0BEGls9MignmrNIPEfSoR80Xll1rFuruW1eaFV?=
 =?us-ascii?Q?6DxnWxdRzOTjrbBEsYlZFgX3CMG8g/WYTNNlA27tD+bawj5hxjCotD2rTG/F?=
 =?us-ascii?Q?c4p/ql2cc3g1W+KC2rOC2jRSL7+L97Ljofvf7rDQhGjkbeU0h1RUdsprDoHc?=
 =?us-ascii?Q?uyJAr/hc0sN6aeuieV07CanEquc6qBH0dknXz/ayJ/xMpCTJHolkcQS1+LXz?=
 =?us-ascii?Q?hnXG9rqIC6y4g+7CdwcUIlevSXZ230KiPZ8rmRBnvZVsG2xu81FTz5fIkh76?=
 =?us-ascii?Q?dzM+72KsL1ZztzJ3aDd5RgWGz2woAdGMwpPaufqseA5588J9yrIS11eg0Hk3?=
 =?us-ascii?Q?gCWPxYJFZAoa5JoH4ZgmwlfAWAWe5qc/mTt8hPdIo3WiCWLwhXwMbtnnxwDa?=
 =?us-ascii?Q?WTwjR+aLqoByUulUD1s9UeBFxbLfmOvcIn9xZZ3zZ0ZMowGydUt1Y8HKg+wg?=
 =?us-ascii?Q?tsKoQiHmbbuA2jsMuWj41oRx+TmRhoZRT5cJ2Viu6n8jEFe8Jxymd5gmR2OQ?=
 =?us-ascii?Q?dzHF//CKvO7gEZtVkB3JEV00DFxoqszaWEGIGlnjkq87ToQ0/saRchE/ESk7?=
 =?us-ascii?Q?CfhjXlENB4/eDhHneP/6zHIebq9i0j0ZsoDIVlpoR2c7GVkb/oBIhsmFZ/mN?=
 =?us-ascii?Q?0V02Ab0adF8yFGjO/xgzsrkawTU5w/oq8R+UQwX+oTSGYuHm/M5YRk4vWkpG?=
 =?us-ascii?Q?Zw48dzbAw/W3YeM2AUhz0H7gAwTAWSgNq11fw8U+HkTL/UWZGJ3QCLKctfbq?=
 =?us-ascii?Q?HzgDHewG6xEU9B1++V6yanA9O/A3ci0Je9aimOowK6zYzLvZmdsV+V92FDRe?=
 =?us-ascii?Q?kAhFBOl/lTbS7Cd94gitPAi+tVnXwzknnzKZwanBsQTS9ZXNuNqNgCqmdX2N?=
 =?us-ascii?Q?Fi4zQOAiCaaFflm3KmFQc7bN1f+dFdeYrBpB5cRB3gCNVz7fmjrZbsi2e1BU?=
 =?us-ascii?Q?30jYYb+H6RxbCwCyWWDE2VEOWS7m30ZFgqrcv09mF0Ae389c8JyP1/mfiV9L?=
 =?us-ascii?Q?wWWk2Ki1e/Se8zKRd5+GGh8KoutdBIC6hxpwUlzzH+YY+pH3TOY18Fs0APN2?=
 =?us-ascii?Q?guvtsQQGPRSUSMuy4hWnyLcZKeiYvdOV68mHeVZCnqpG2BCdTCXiOJ4ZJwgf?=
 =?us-ascii?Q?XsRZbfj7kBPQEqQ/eIwaJxKYSEsE78cQjbfJdrHMtA5KaZdwIXP6Dky6c/n9?=
 =?us-ascii?Q?yWvo+4mLGwv3Nkn+p1KYd1vFEiLhj+moj0cjKPpmlqJt1koLB3u0BWTTatnV?=
 =?us-ascii?Q?fg0xXyl5EXyYZbkcT+uev89cipOM3/1BEIp9owJs8XUgcjrsl6BNg1bNMs5U?=
 =?us-ascii?Q?f2lZRaRWW7tOrgf6W97Rp145340TpqIlqJFU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NARQ/VGHzj7fj3E3PVkIoqnQTFZPehzLmh7Siy832Hznu/CdYEd+WXI6tOZb?=
 =?us-ascii?Q?lXwYiM02syryxedP6sCqiQUqP5kzHpLyK9mzA4lsGngyie6fkunP5GOTVbLw?=
 =?us-ascii?Q?WqECHry1r9lf7kmmw5Tvgx4pZRld1zlZN/uXIStHMtALUHGowwCyj5qdgNTY?=
 =?us-ascii?Q?63JL6EBfEHcoha07Pwn52yYeoKM3KnhcaZc2C5M75aYjD+Q1VNE4pWC1jnz7?=
 =?us-ascii?Q?BmcGhPi8T9gaHn02SQpg5fL8nxCqtboWtvYT7mPJJ/2WbAYt1e1qUnf+87AO?=
 =?us-ascii?Q?9R3Zna+DoP6cnauJ0XPt38INy8Hr+FZ4+ESIEd3Hb01cQrHEuRApbeMSuKW4?=
 =?us-ascii?Q?BLfTSnTHKVEYdbflstUPYklOCQaKVjsRnQNbFiqewwreJkfHVVdvujG7tCZk?=
 =?us-ascii?Q?S2W0dFfp/6sO1r7OYtOFFrUCERoqIFGgzJT0SccgbVCA8Lj0BTHg0WBpOGRY?=
 =?us-ascii?Q?CPMRwd1j/Ydzg4hJdbUn8VBPchkQmH1Qw/YNXhmI05mMr1IGLo57f8QhlNWK?=
 =?us-ascii?Q?DwhsY/DM4U0zMyfmmmX28EkqZaQEMiToF2zDyIiE/gKUT/wIXx4DMDBnQPtS?=
 =?us-ascii?Q?ADtv2DiLAom8qF2jswow9W5w/OGRpA+UU54zYx6GSz697V6g3kGvNGHWu+KE?=
 =?us-ascii?Q?nUf/8rMYZZXzC/XL7wDAySBPE73eOSoR/bwndOqOuIgdzkymDhFj4KxjF8fR?=
 =?us-ascii?Q?9JlVq7vCIxGnH+sTpSuJ/Utt+wMc2U8SknKqvzBCKU6vrbZuz/EeXTCA1Yfq?=
 =?us-ascii?Q?DY9R4/tecosOg4ripWt+oPsByOs2ZSXu6xm64v5M5MobnmDkEyaQClOomUg/?=
 =?us-ascii?Q?ZNnqzFcOLQzCZ/xVwWdS8yBgCS2XtnGaGjgeOaBh74M1BX1rD3Bgk1mohWcL?=
 =?us-ascii?Q?Semvn76qf893ZTvGDu/RIIqTr0F8p2eNtIwChIhoSDpdt4o/NGTfudFSw38x?=
 =?us-ascii?Q?HS9V6nMfQELHRjB7Cht7tX5hx2dBY6KoIzyuyz5izufUAHAMXFS2bn3Bfp/U?=
 =?us-ascii?Q?iLhlydnmsTx2KwYF0FHdgCmCUEZudUZwdl2ESfH+lV7RjsNgIqGyXYk2fNAd?=
 =?us-ascii?Q?WrNDYEnhJCqdJEOV0S8MfaXJEvw0qQdD15YGZRnToOGqXBOOghbvBIcLV3wJ?=
 =?us-ascii?Q?7azR2Lc2VBNynjTcAKjv01N0XviPtmm0gGhAAsXLyxOtUwA6JIwDHO1TlWxI?=
 =?us-ascii?Q?bJ5/820VHlHTZ9To0z6+EXJ97q+tDmNIZSNEmb4u+0ACqrGnyspeiZA0Sz5T?=
 =?us-ascii?Q?jL8IkjdiVOAdMpGvPZCukSXJs0FZXNY9HDh68nliLveH+0gA7RsTLG4rmvxA?=
 =?us-ascii?Q?GFAfZqxSU5vB0sOV4ijXCEETTNMu0fvk8V5jHSeWpg6OHhJ2wn5wz4Saf3FB?=
 =?us-ascii?Q?qXXB6GkIWYu92ekfTX1B8bBqsWczBKDtu+4OsEgV8g7zZBtubPD52fZTtFZa?=
 =?us-ascii?Q?n/Vm21DnR1ikAESp++iaK+NL9+kJHWJK+ebp9wca0LrXP2GB11CGsre+3v5f?=
 =?us-ascii?Q?WtrFZcFpSG1Rl6EwIqsljppltQsijVcImmCVf9FAWcNspqqWf5+SByQeDbUx?=
 =?us-ascii?Q?Ew6fMaGMSYP4h8jRxLX0MvHVU/hlb1aBiLP//Kdj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe57ca0-d5e8-4f62-2ced-08de23a5e79f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:47:39.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWdFg8K3aiBlt0CJiFXXNAkPKjAaOl6gHS1qht5AVXdCdm8S/zI8CHN/sIhQcfr1ZiolHbF5Tr6C/1ytg/SUVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_094741_154948_D5EF08EE 
X-CRM114-Status: UNSURE (   9.34  )
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

Remove duplicated deprecated at25* property because the same common
property already were added.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- new patch
---
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
index 15463a96938cc..0f96ea0337a1f 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
@@ -213,10 +213,6 @@ eeprom: eeprom@0 {
 		pl022,wait-state = <0>;
 		pl022,duplex = <0>;
 
-		at25,byte-len = <0x8000>;
-		at25,addr-mode = <2>;
-		at25,page-size = <64>;
-
 		size = <0x8000>;
 		address-width = <16>;
 		pagesize = <64>;
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58455C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYEEfcY73i36BuSNO5IssxA+An8/kcDOuUdsf+L5IlA=; b=kJKMd5Vc/GTHGZiTAhA/PNSmU8
	GlybIyQ18tGdUBew4WHTKInbZPzLOoDaWVJIVtnp6DmvVgqUDjntD3JhrBDugLUVhD8m5GshyKK9k
	HS3HMejHPlSVqpnSyU8ewXMGeJMu0KnmE/VFrMX77BkMjTrZyCdUQZC1VsbUuq4glPDVuFUSEcxL4
	l7J/kHNF2hfv23QtSvTubwuq/DngJapIlbYUl8agV6fD/sjbi0+kOC6oY47AbmZjA3ldJtT65S7Mu
	M42DkEnSpDP6LaUTOsm5zvzKfDv3ymPkDG8Z4OeVGz3NPqG/sjMuBUQwb28YeE5F9AImfo231EPh2
	Tnu6IB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFa-00000009NIY-0PTW;
	Wed, 19 Aug 2026 09:06:22 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcFX-00000009NGB-07jE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 09:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giS2YrfryMgBo8MRPosGrshJDPPzS0uGFopwKkAGfKgkiQJskGHl1w8V4f25lYHYE6QholIR+pmXQrw2VXvR23W5iQJnt/PElE53hGoGPeCublxqAJ9vMfuiWD/JtjSR7Rt3FmarMn4me0Yb85Z5BggodG0Zv1PxQhDMm79nluMjEisp7YYS9HfztILYR8OGP5kXvIGOPK0+IgB56+sgZRI2a3p59ZRSQBL/SjrvDoRjuxiRsHwjbZJ0mxr5QYd0R8B5FeQs2CnCFiR9uhlhmL9/MracXvvI8Zaa2jIpZfz65+5njsbhv4uh5EEf7VHrCDSq0iFYb700A/Avfz55Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYEEfcY73i36BuSNO5IssxA+An8/kcDOuUdsf+L5IlA=;
 b=AMaguJE64paZx8DHcGqwIDhw2xIwF92KNLkMLzLVlQGpgQo1q66R1gTEQNU6o0hmvboNg6vRi/+3YgOXVFKR03FG0tBso5nhqSdrz5yxvH7+Lfbpythnn4ouMYAaMCetQeHtaSqR8X7EOG0boHjwz5ZjXQyq+7IW0HjGueHf+Mvp690XB16CiCf+rDWCjSj5bOwUWIeAFP3JX+0PFU9DUBHR33rxyrlurg8CuKXRwRv79syr0YxpJO4CKIIHaUkPXadpsxYeoMxnPYHVV4BiTlMcEZX5mxhLHChmYyufkBsvMhsf9VDUN2z+CYIXkQmpTSk5SDAUHd33WyJePEMy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYEEfcY73i36BuSNO5IssxA+An8/kcDOuUdsf+L5IlA=;
 b=viW/BnImo0YTu9o+0+jUDJBHvB4hKny1iFDSkDyO5xTjkQDLv48hUGo1TTzxvg4dY6cXatVbgQl9b9NSs8caWmnoUaCpyP+zhPtMFPpei4IMqssgKqBXgGXO26mcSIPnBHCgJ9LUmQdJMd3ApAMOebOFSOglNjqhpz3e9FxUq7iVFk5AtygqTdq5s7quzCtIBjUDu8eZfZciNBwGp2I2tFycHgn4JLrtzjk3brpKbqx0f99hROXy6tsw19Ns9oVePJ83bSuywzFdAoqXTVqNh2ch1h7JLjtvZPWDEDFPQCn9LZ3Gn2q1FfEySPMdsA66Qy+hI1Iqi+gAVFtHLYE0Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:06:14 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:06:14 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/5] irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
Date: Wed, 19 Aug 2026 18:05:41 +0900
Message-Id: <20260819090543.585131-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 730d01fd-bbb0-4f0c-3528-08defdd11f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|3023799007|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: x/xz+AOfBydVtHHP5c2tLKF5F9UubSW+LCjE0t6IHN8El6MetSrkwvh1uqPId6b/+Rpbw87pRa6IVy/XLPX4Y9M3Qfz42cHRNc0AfX6tYhigc3dDlEN9tNm1gAcp8Z0A/Z7jO4Q8AMu2Qog2O48KycdndPgyQumrp/7vY0T3ulT+4PfEtBONeBqcjSsV53mCjdOE2JeU/iQf3u8Wbh2byPGTCD6fIbXfAB/k+pv7NZhHlbV2pIXGXMd+rYvgE0jkD9eC4sUDa/+J+3X7/e1m+uUW9+bT6D37/0blmjyhx6f9FkZ7MS6rasn5yVZN074jAgTqleFTnFd79OPLJJU1sgwAdWM2Bqg89WapG7FXGrbVtPnriqbRyHjxnvcu4GNAdsdzMNMnXLiANvr8RIlOgDdqkKINTZgSV39D7/JmnRHwyItuRNx9NZKwEBX/uqWW/93nRue8Mm7d6bBm7xe905NgUeUSk01a9EWhK/RRCC6UCBcbdSss2nZL1iVO0z59oLHMgkZ5SDz2bqLzUeDsoeo1uViSgMZco7pqzGMJstKaQ2YvDb5xElFQxjPa5MxiopXRMUV06gNOmy3JpT6Veov9Kx4IY6Kpvz71FWy5RJD5RhiEauoHedg1jMxiGGTz2h+urhiYSK7xJOSqthhEDibZLNLSau95HW5MzN/HFLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uJB+MkKTgkfYfy3k+FO3QpajC9CSf0/kfy1n/pDAeqntQcxDI51eolgqDQHh?=
 =?us-ascii?Q?vspA7omJ98LJyXbyfFlPkvxRuBQW6i38Bbinmyw9+Onb2lF9y9gb8kigdDcj?=
 =?us-ascii?Q?R3PmAHTAgw8nPwGOTLvq6wyrmNvomeyOr9VhZXv1cCltb+q/Y5q8ExqeCgxf?=
 =?us-ascii?Q?++nA95EEanrmL7wWXXUEDTga4rRuTYAQ8ELgzDkywcdKOIayxRkml40QqrrA?=
 =?us-ascii?Q?o3icb1cxWXfWxL7YSDZeZaVTqOS91CFTFiC7IdMWo5OpTrmm1dEKhwte7Zec?=
 =?us-ascii?Q?iHh1bW3o2isRpIB2bn9/QJldeqS3ZMr0epxShGrGFIwL8pVV4NGWJneZkwI6?=
 =?us-ascii?Q?sjfa/c0Un86qnwhVFU3B/tfEZzohJkCLmV3OCklSCHVpacKgERP3h5yl65An?=
 =?us-ascii?Q?27MD/uko1AdqTO1y2cRJOnZTEoX3AHPFH1ZC02pWxxhMXnRPKqt1c7VTwjIv?=
 =?us-ascii?Q?CxxrrH/LCke6qNKB9tMUuMwsepwwS25RJSHRFxiTGOjF9BWCe7XoHMnh+pKu?=
 =?us-ascii?Q?Si+kQajiyEgDnNbJqNpH1AvXHKrWL19AqgTALUASCQT4CbJuhrHs7q1sprIb?=
 =?us-ascii?Q?TRUumGYGOqZxmG6kz/1GYgrR/+M5+Ey5aTZhfmcqEWSmNLWZXuNKOktvcce5?=
 =?us-ascii?Q?shl0sV24g7erKifzXBc4MFYQYwDEbukJXmX0bN1TqOtc9Reu4fb0Qy/R721s?=
 =?us-ascii?Q?lHBw2MKpYQ52rfN59GnB1RBWfaI2gmO+P5GymVuWZOuyRYNQ5fGdGQeK9JCz?=
 =?us-ascii?Q?TysOxO5jePgZFuei80EnOZbF31i4cID9hHWFLQ5A6C6UZqNsKwpWykokagCu?=
 =?us-ascii?Q?PxFuO7k0AS7CWNAmQ2w9tCtqNcATChTyOaF1uW86ykjmp9D7SQZ8I+nQYoEY?=
 =?us-ascii?Q?KMea3d7p2MZwXleQawwXbF2mfY9Cy/mU4GKr0BY1jvNJFexbocHOzqpsoXIL?=
 =?us-ascii?Q?uPkjcrjmdnWmt4hSBwhUJk+P7pFwpEFGpanOZqdQ8f1bfLE8fZha/DayO/eT?=
 =?us-ascii?Q?h+rUYgYBP0nYJBJVFnMsI07oAB1m5Rj+tizxGn97P4iwjDRluEP3UIyjjPSM?=
 =?us-ascii?Q?DfRL9Otc4QSLqoDIa+vd0N0bW2dZMR0H2woGwMpmeY3cEjX25OIZasbBesmn?=
 =?us-ascii?Q?5oGv6zcEHw3aoBCi8xWMRyqUlnWWeXk8wSLAbU25frfp86rgJAVP+GtEUkMy?=
 =?us-ascii?Q?ZmKjrI4ipZW85stxt01evZwx5qESFpGKLWSAbxb8eDtezGOL5onvyG7rzK2Y?=
 =?us-ascii?Q?X+9ubiXXqjkCxWKbR96SzC85JXqGl8oHtITgR92ftjWGY5Xiquo1Mw3xFU7u?=
 =?us-ascii?Q?7rrCtMH++sVt9uozYEpRF/1eW8phAsj25oscoAfkRYjZ2k2xWR3dM+ZgL5MW?=
 =?us-ascii?Q?63jzNcxiUXwJmjHVhjO05e7mjikDNhU2bnoHmCsupnsbjXom61IrK4IAFcE8?=
 =?us-ascii?Q?dL1R1U1azvp0exCvQlx5oaunYvj2D11e+onv75WV2BfPGHNwVRc6wiUCfZeF?=
 =?us-ascii?Q?dGog1MVKW+tlQCu5Neb1BTyAB2gB3Js0ciAOcAX5G/BK1COwMMspyi3DERkx?=
 =?us-ascii?Q?Tvo4Oiq2NAf5h+4XoGlFSFYvEjuEQN91zzd+KqJsFQoHAhye0UJgX3Go598l?=
 =?us-ascii?Q?GxhvVPuYBUiS0VqemPlVetEB2iCVLh92MeaI9OGLk/qAOxgn6v1iPK0w6KOX?=
 =?us-ascii?Q?iZfgLpW5osMDdMVchpl8FfBS/0zre8rbK23WJtluPXmUSvgLZwrXcn3r8He0?=
 =?us-ascii?Q?0E/4D5xMgn2pUV8BDN7/5ujxJRr38Ugn2z8yWMCuNLMSiKSuqUsk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730d01fd-bbb0-4f0c-3528-08defdd11f23
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:06:14.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MZdA7/hiCHjvCyWp6mDER5XJqffRGzVp0Q2TeHNgWYWyQZeKwx3Ouam5OcTunNtNYJ9umeJoPnbSxmJFUwBoI1Zi9jivvlgKow3dPWPaUVj6TubYQxxjfbXSz5wlsG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_020619_256025_62DA2C28 
X-CRM114-Status: GOOD (  10.67  )
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 359b8ebc1bae..320082d3a632 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -283,6 +283,7 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
-- 
2.34.1



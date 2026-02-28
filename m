Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CBDFEE4CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eX8F5eFGbVueYaJ44sROdGrJ0i17oo+QYnF4dStFUo=; b=L7w2KUrW6HLwFqGBOk+gawK7AW
	GjoSIgJ7SUgU63HU8sHBV80fqobrU4y3ra+KaRcNaSfW4D5ueRN+mDRE/GotPOdgHzphk5oJ6yoLq
	Cd6kcsC1rclooR9bREIFO3aTHputF0IgrZKz9el7VxrRWwTstJuxO/H7SdJJCcenO5b/wgg10Rhsm
	lUCEmhJDwX8x+g+Yk1u+vHnTZV2GR+l/vQkiUl40uSvYxFMFhtwo7SbkNpKzWkD6apNYBrbSV+QaS
	LGLv1K+tzZqEGAASjKv++FPd/ZZNF0Edb1Xd+7E0+2FoiyGqiQI1MDHK4DpAd5QjDCGN8tJpOJbu0
	3tvYiovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEI7-00000009a0K-16WC;
	Sat, 28 Feb 2026 06:59:07 +0000
Received: from mail-japaneastazon11023084.outbound.protection.outlook.com ([52.101.127.84] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEI2-00000009ZwY-2h6v;
	Sat, 28 Feb 2026 06:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2OCZUhlHw7kkKg0t7hDDLe+Ur8AunFaqhCbOZrxXsmQt8bo+xEr/cBzBFtlVKX4DolaDk8N3kwnYqM5Y+eynpaXcomXD1gvjcRr1+HBhXjfN2DEmsmS5kL9vy8GI4foQ/j0lII+JWE0yBQHCPevuXo2Kl67HZpzO0YFY5IPDHrra3Eao2J5HcQ/mLzBKXY1DG0aUN/ezLLTrFDXpE3MdCAyhiACa32BQ4chj5jxB2qo6tXNTsvjabgwxtH9+T5YDzoVJKzEmzHchtdY4uX+cIbL3e0TEzTAKfsmnkjj99lyayONZ0qGoC6Qk0Wssp4kujFjbpQBkn5gTkf93eW81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eX8F5eFGbVueYaJ44sROdGrJ0i17oo+QYnF4dStFUo=;
 b=kmIgyq0e+58XNUvQ1vHoCF3AI1O76qztwAeXjYkXRSEY5K64sCxdxWI3w2lZRjq9hPCVCs5kQZdtiJxILDSIJrrm7frcQbZX/yfzxA44o69zrP3INdgFUs9iCnlB5jyqRX3ZS4WrMeY60E2dmNlKfVfD9Q+CLiOEx5JM+AyH2M51Cqx+Lrmn+VmyDdawicxrzxChBcriYoUjQ7yKAWtG3T1wHSiMVsWg2c0d12eLv756taFp7jytSdGntdyD/tsk1WtK/ypCJC1lPHMzEUluTp+B8Jf27k/pwQktdjRbttK6A9Nk36d7ys24BTJZzRTlDsaI+gqOrLlnPRFwfoJI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEYPR03MB6722.apcprd03.prod.outlook.com (2603:1096:101:6a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Sat, 28 Feb
 2026 06:59:01 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 06:59:01 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	krzk+dt@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: linux-iio@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 2/4] iio: adc: meson-saradc: add support for Meson S4
Date: Sat, 28 Feb 2026 14:58:38 +0800
Message-Id: <20260228065840.702651-3-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228065840.702651-1-nick@khadas.com>
References: <20260228065840.702651-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:405:372::11) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SEYPR03MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f9b880-ce85-4050-6f41-08de7696da04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: AnboybQUvfZDAF0jLpNFfGS4e8XU/HhMzvmCkMrJxwE+QCRyEjaQP58Qp+kvPZ8EI5i1VMR4JiTD4+hkCWV6OOO6tqG9TDTHMVYgG0C0HnXpRELY5UvWm06KICiOsmVbHFoWGkfOx+VNqARf8Oi4RLIMlA5lP3OM1Osn3cCE2KrElZuz5ttk8Rj3BbRIQBF+xUcFpvEkYjkSEOwdoXQHRocaHeR91XsHRZKSHZ3KUyptwoaDtFXyX0vw2+elEKdrXpt0ed8NfsxGAelOHrkNGyYPkakwSwmYeGBYys4dVCEihFlK/ntPh39pYZFjaZew5Y46Gc32p22Z82oKxSxwu4fIOewND7SQ8IAIJK/1wjrCuuLY329rPN+LqgqkDJaJS+bURHt17aOwpWogRNW8RD+MphtMijoTMf6b86QEs+JyYuPz3OZmgYGAAJCXYDw4JnPoKUN2+U/pDsclRKBRu5ltXihPQx+BqgljoTT3ScnMhBdbaXnyiun96FeOjC3nXxjdUvcfuHCvXlvxDbiROYVqhi9/G1nRFR1nKijy1P5e1UeEcQgqovgwvWSHOsy2mvXugW6AAbOaiB+n2KsYv9IfKiDfFsI2SLbrAwDxDButq3M4v3aUMJ2dcMAKwGVbfIxwJc4rEgQxFqRBs8CGdT+OueKZ3gmKnGaPO3OQEReBjwNJxnbwECUWbUP3PMFHiOrCaXATkjlkwV/Ji1+mtZ+/Og6CN4XLjx6NUyVh0pr5RSV03rM7giNDOatAEXG0SWcRduXoe58LZAFRkgY47Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iz2yBu7UujKtkm/jSvVTcfOUro3ty5xxdypS0WHNpT7exNeDtUnp2ZA99BUp?=
 =?us-ascii?Q?AgZiyrXtlirGWi3dXY2ViLrseK8SC3bsjG6KCmyjLlnQuIaiAlXX4k1a7/1A?=
 =?us-ascii?Q?GLE1ydD7s3BygEGW2O/DjepSBJ/WGsfYDC2YGgMErzq0o22WuKMvsO+wO1YT?=
 =?us-ascii?Q?0zjGd0GfLmKqC4uXkx19uQ33pw8vD2n5vbTRJGcpD8/CIzYZkh5MnBuxNZi0?=
 =?us-ascii?Q?fkycKZjH8QhpZ36141Wx2PvopdLRqJ+dfv3AeWuExcD6vr02Zoghh5x134B5?=
 =?us-ascii?Q?NE9135s4HkmZGvr/AheW0+RNCRPaGte07f1ZIpsLJQ+ZyM97sgQ+kTG3Qn//?=
 =?us-ascii?Q?NutCxkgPoKbxtQwtbdo7uLhlsf3I7nbSQvGM4OmqM00xpiCby7wxD79QHEeR?=
 =?us-ascii?Q?jMaSBAEetG8Yl73SmMsKl8OQa1KmW43TzbAOGAoTznmJjBHuFEkoCZAK3qNz?=
 =?us-ascii?Q?9HzkC2LWrxa1QUcJugVOW1u3xTAp51RbP1TQf05/ArWrwEniTcH5CJvk7VMS?=
 =?us-ascii?Q?eQ5sCh81VB6M4rUNqn5af9OkH4Cik4Q0Aab/vptluaMcifWcmMMzZf3iMzyN?=
 =?us-ascii?Q?wp6o+8mQCRJKPj31eybDXgN8zaWCLX5o2tERlEmCyc3u00l1VVbLtbWR1iFw?=
 =?us-ascii?Q?1U6mzHwK3fvUfJ5jBDzOjvgcnKbnBNMCEaaqksJWMZyvOqpHUEWpWdhXXc5b?=
 =?us-ascii?Q?V2fKa2ROBo6DhI7kqY/Q41W27M1Vvk5JOiqTWT2U7e7KwKfW8Julfqu9tUz/?=
 =?us-ascii?Q?zEVky/wYIS9xgDBQKujuELmelZHFBazSNdZiM+pdgYpM6cC+vHFUPg8+l8ma?=
 =?us-ascii?Q?mdet8QHi/JLLs4pJNEyVqyhjUbrasU1jhdQ4yOOptwIiGP6ZyA52aQOJ3vzB?=
 =?us-ascii?Q?wSmuz45ViPv/jmk31tw26vWkCsWAuHEXElGSC43my3LDf2psgcKQ0VeXucNU?=
 =?us-ascii?Q?QvyI6ekCV/+4uQv/PSlnX2uKd4p8GpyJdbAWM7F73V7r4cuGWVRzraEqa4Ou?=
 =?us-ascii?Q?vFSSAmHJDsYKyhU4wlFZzRU0mIf4gHJZdGesoV9IUxOZcTnFatvjm3a105rq?=
 =?us-ascii?Q?p7REbfRAioiLbTVch4hf2sTUQgWzr4lhCSNKCyuvvzWch3Q47BLSVZpZ1HC1?=
 =?us-ascii?Q?3IicPt9F9PyODjyqF+IVZuiGRVmbrHDnTw9PrXGlZbjEwJduLyLxXLXTFdJT?=
 =?us-ascii?Q?0KiTr27oU5FCM67JMjgmK4LMtgIS/ZIhA1Ld1tKBMS2lALn/vJSUc8N24kQK?=
 =?us-ascii?Q?sqbj+12e80894DH40gr7HFpbHr4bOQ/rD8JBc/3tEZQT3iU+39OR/3y3/pZK?=
 =?us-ascii?Q?AWOjA2PK53UrBb/HSdLh7i5G9aY+pYdbMY7Rp8UmXiZq7y3NILZ47duxAZE+?=
 =?us-ascii?Q?21I/gr+4IlCJjsht3xF3Jt9MK1+jMRzsHQo/HlkcOCAPTsWf2db0VUADBQiA?=
 =?us-ascii?Q?uIX1hP/AMB8Oq8is4VElyE0Dc+btB1/3Oc8Z9Y8LwbM0vbE0KSeMzZhUQpBZ?=
 =?us-ascii?Q?aJ3jgUEvbIZmCfb6rnjvhnBkkRj5+cz8cw6QCVlTb3LpBQXw2IMH+iLepG5+?=
 =?us-ascii?Q?2yky6T0vwJGKco3uPqkxeKOI9/d8//eWaL1cCEj/m4hYXJX6VvM2ELL/iVgV?=
 =?us-ascii?Q?7HwTpTgMBtKgTzxOt4ZrVDh5hjnbzxzxTlnXJYF/I/n0lgAoSHudJWfedgSI?=
 =?us-ascii?Q?0bYbDMnDMVsP1VtJpt79HoXxB8fmqxM/5Xl+C6NVXIAcdOZX?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f9b880-ce85-4050-6f41-08de7696da04
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:59:01.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH4FuybPmSYD1eWo0bjql4husW1GfEZUjxyh8nQ47vIQwUdswjCyHzK3hx5GN1oZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_225902_688696_F99BFE54 
X-CRM114-Status: GOOD (  10.05  )
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

Add support for the SARADC found on the Amlogic Meson S4 SoC.
According to the documentation and current testing, it is fully
compatible with the G12A parameter set, so we reuse
`meson_sar_adc_g12a_data` for this new compatible string.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 drivers/iio/adc/meson_saradc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 47cd350498a0d..3ac48b7842c4f 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1313,6 +1313,11 @@ static const struct meson_sar_adc_data meson_sar_adc_g12a_data = {
 	.name = "meson-g12a-saradc",
 };
 
+static const struct meson_sar_adc_data meson_sar_adc_s4_data = {
+	.param = &meson_sar_adc_g12a_param,
+	.name = "meson-s4-saradc",
+};
+
 static const struct of_device_id meson_sar_adc_of_match[] = {
 	{
 		.compatible = "amlogic,meson8-saradc",
@@ -1341,6 +1346,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 	}, {
 		.compatible = "amlogic,meson-g12a-saradc",
 		.data = &meson_sar_adc_g12a_data,
+	}, {
+		.compatible = "amlogic,meson-s4-saradc",
+		.data = &meson_sar_adc_s4_data,
 	},
 	{ }
 };
-- 
2.34.1



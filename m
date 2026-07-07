Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A12BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2FtO6/auXQw6HdU9on7vE7e0AikChczY2s55ofOk02k=; b=K+Vyy783gHXhYq1Mazody/oF9d
	ETxkf/AelG9WACY68CSN5Fy3MESpJ3YcpOWUaQEPq8yE+++ZQbl8iIGfOBSEvIAmiZq+1+jBtqzRB
	qIlSq6hjs/Ev4kVjqKSrSsKyq29OOjPhTY7UGOZHd3hPzkCmmImpqcgi+UiAfTa7RiuzTMpFf6s5q
	TL+L0EKGCk91ErmhzxLkrhhrzFtoUht7+lzjtc+ZGfxVFMDM4UjH3wJzAC+j4m6SIwKAbl/AK1WMk
	orsEtiOEn/l5PwL9vjhaH3Eja2KgMsdkHgVjhKdukecdJs4n47YNyyHHjX8EEFfH3OdfRqp/Mlr0O
	jetmX7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkW-0000000EGg3-48IQ;
	Tue, 07 Jul 2026 06:57:45 +0000
Received: from mail-westeuropeazon11013056.outbound.protection.outlook.com ([52.101.72.56] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkV-0000000EGf6-0Y16
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:57:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROW1niMxNtPpD3F2jJxbyQPs+Jk8AmfHPHH+2NWJ9LR8jThze8wYrwjhea1NKDlzXBJv//ui+Wie/VVjvU0h1yDnsZpW6lJH928/L5QeVJD1nD2ExcnF6ZMx7o1JX2c09Qz+PHW4jSmSl0SyIcgDS6zzmg+l/D6Z0FipQCs0V3k8ZTG33CqnzSgziFePbS/eIqWQL8N3Pk+7OSBlfk4gsKKwSSUeLyedGxA0mt5xSijjxwjtcjd/mIOLymY3HPWK1QJ5WJGanKeh8LUPqsc+QovzEA/lvoR/praVBUdO9SH5An6kS9mUoqpKKSoDQsc+I0i0yUzJ2jqZ6Bwj/ee12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FtO6/auXQw6HdU9on7vE7e0AikChczY2s55ofOk02k=;
 b=wjO2lZ7iz50cn1olF5lLut8kX9pSYbSuD7wPan541qnRQBSMuT+7AAKHIPUewnzgkQDW4zWgtQ3F2BduFeYGDbVJtmEZzkzBqJ2mrhCK+QzFn3R3Z/Q08az1iuRH/vCCIyFbZ1ofJhojRcv5KXtAhiPF7t8ppa8A0LQM9qjzqJPl8MTwuCDOtuDdBNStMCJ2Q7SL3anu4tx/eAhzG3Dq4AZ7+x48i61denG52XUZPr19yxqEOTItl57XLmNYkDmxuoGgg2VasGzH2WQ3HCQOGWnDSl6QvkB7WRczy9+G0szseE7bkiPqqjVbgSQgQdAZZIvz7DndIk5jQuC+RwiPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FtO6/auXQw6HdU9on7vE7e0AikChczY2s55ofOk02k=;
 b=O/kP6LHyn7JUCWIhaxDfayCKj//o+AG/Dcm4ukoM8qba2RRRRZKXRxHk4gv2hn/eo9XgLKLvN5hV5LQA7B4+/3qn1FTcgtbLuN8NQ0FvQWnyySJIoj4vTJVvb/w2NnI7yjy5veEiAktGkLL2C6R4+KLdUsctJC/8Zm2skEfjqD/ZFhppQ/elkcDr1HhtmIWhXVic1aDILVm+Ibh6g49rT68svEcEPmwJ6OCp4McXKgv0LCodWwdJdsCuYPGtV3nlwNLTGUMg1n9OADVceW2C+ydJlLUERagCJaBiwvctjYnIfzBFz4tAqShcMunFVVW5ouyiRY8cz+c5AIV24iGfWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:33 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:31 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] Add audio support on i.MX91 9x9 QSB
Date: Tue,  7 Jul 2026 15:57:19 +0900
Message-ID: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0034.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 19534408-e4f6-4bca-681e-08dedbf50402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: wP7bTGFN5R3VVXeyLVGbJGGLUHXfKVzbClFdQR6t+aL27sLhfoCu3cbPJ/S+NFpviS6H6pGNX3q+LnoxA/luzsdrhH3CH9hNhNN4l+qTUbyukQTCujQ017nlS60s9gqjJBlHmHVchCf5+vdweloYPYyNA4GwQKFkmwBxLSHDrhwhYzPxyJC4LkxqlZ9xP7/taWEwAMXt3pM7OstaxhYVydg5RiOUrj4XtkY5XGS2FzA3+JxYb2CHXV07eyrZMX9PYcg2h6axZnRKzYu6S9VyajG3LcsMFbSgonlV5ubcwfpPHZeVf2Lf+q7ow1mnRFR43jlScanSPyYN2aZ+gijSEhx3pOWrS2uD7IGE+pe4dy7A9AqxGSC3y2CzLldByfZOTNGGmSOoSRzv/LhZwLz5oLj5EfqDPQlyR0mq3+ehInHftOc7Zw1yQLSf5vWmiqTNJUpEIUYyMmWErR6DwUc1lFVcyF7ZFvxg6TFviWCNmHe7l2I/M0yCn2YFPJ0vfFXK/EN34MFgqtly2vWsQ80HmJsyOybkEDUAl1AbAL5bDwZ7cWhCBzNBsoG3Lj1e9nDGY54TQk2vueO5+OFo+LTWeMHDYVGl6s8bITtgJz+7s3HB6bDK+tjeQodai7jaxGVpego+HqlhL3Y3uhDIFRIsRnsN35zfHwPWLTm828g1Puk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tceuszMsa5AsDoKezXKhqK2a2H66m2RA3DiNiAXPI9laznAPdqFw0ZPHCe1e?=
 =?us-ascii?Q?yeD4Onz3u1RIagYwIv+LtguRvJlvq7hmGU+fA5OKFywSzUcOLjv76y8gFZXQ?=
 =?us-ascii?Q?4osHOA5yClCufYhW2rgjiJfabTlZe9um5fOX62DXhCZJZRrc8k7G6ldu1mDT?=
 =?us-ascii?Q?PNv2NrS/EzdAKc6Z/0yuKJB7y+mtNuwe++0gO/zSL3YWBDXA03awDipKCCDK?=
 =?us-ascii?Q?9XN04cdzcTe1RiZPMfQIaNFA34wSF+nyykCSnmE59kMKbdWPXYTg2UgRYaNh?=
 =?us-ascii?Q?nbqPBZTRQynqpTvyXJxDbIDfEnZSH87wSjvI+xsZmf2gkrZh/WppwHJa0LrZ?=
 =?us-ascii?Q?H65kB7PDNPAUYGUgzWIssCjG08fqYjNvDpBrNNcD7sHl0qhgvBQNTIWl02wP?=
 =?us-ascii?Q?LdB9vQ3FLc6hQKH+yJbJ5DOabJOdxv7OUjxOGPtM9lTNOJbdvFG0Du/wNNno?=
 =?us-ascii?Q?we5V8GhGZikQtxHQuEH5kW7C0pDSnCMaUEE3AfwxlAzuCtdoFhvJwRuheF9+?=
 =?us-ascii?Q?u1rSSEELIm4sJ1QAMt9fMd38s1I18/9ULlpu12oxi1WTJS2XyTxGRGSSsob0?=
 =?us-ascii?Q?Gn2Kg5HKZrLq71JUPHb55b4RhlHzRjGBvZGLv9YJo6sizpelBdJNHggklUr3?=
 =?us-ascii?Q?/ijU/TKEFVXEQdtA8VzsOKpYzBPDKCW3051o0Xy7nNYAeAPPQw9MIMAp+9V4?=
 =?us-ascii?Q?VzQxUuPXpBlxMu5X7hf+7bMjHqeOSl9rfBvCUrnsXuLTdy2vSKscAeUxeEQS?=
 =?us-ascii?Q?hsuCqagwhVSey6ommtkBN0FajaBzyncBL/NgWUuFuLikrw8jmzBrFqavOqkW?=
 =?us-ascii?Q?w6D70iwS3vdW54WraIIeAvzs3EdLW+cdmbGhv/pVLzY4KwNtUk4l3ht8mrAq?=
 =?us-ascii?Q?GnlIfdeIu8D7KZZgqQWYYyAZXzJJpzI1SgaJQ2A3pqH78F+adivvsSu1zBUY?=
 =?us-ascii?Q?pKgQRRcqiJZ/qK1OHj+5zzeXecfEN6Yd1kegJXU2ES8wo25OQduL5F3CXCJt?=
 =?us-ascii?Q?viuFHhQyKW8xfT+Cbo/u/g5oviJNZRcW+g6xpif29LrGPzvJUJDPdTJ3aRhE?=
 =?us-ascii?Q?cb72OoWesbst5kfABQ8Moa24zQUv2xCoPII80Ht9V0SvoKX/v2R8ZGKG9Qd8?=
 =?us-ascii?Q?2SHGXOSQ27c84uNzJ8ObwvJpmGYtK07pd7PMzAUvgBSJR+ufMNYLjc++ZpDq?=
 =?us-ascii?Q?gZnHD4nVmrLeYpVIqbO4JEyjRfm9GVormKV1mRgxklh3F9psLGNV1IaxQqZg?=
 =?us-ascii?Q?6E18pDp136h+i2NiA2F3RH+KBF90UQswuoBsqHwOa11+fnTX6hChu+SqcQyD?=
 =?us-ascii?Q?fppzTWeLFYFVPpiN/LzsCybaEQ+sGGmqGOlVrCGpk4iQEXrAdZ/bZhD5d5iB?=
 =?us-ascii?Q?RzdirkIa+QDqx95aW1hIVDLMxy++voWRAc/2O4mVgU+p5zNfBSyOxmC7LPPn?=
 =?us-ascii?Q?JzkxA4H8IdRN883pNcpIoo8RDJOVIi0OO4vw+OK11quwNMj7J7Yg9JU9J6/1?=
 =?us-ascii?Q?SMKaw6c6Ya9KHDmn3G4BMY4GdzFTLSd40XjIhZnCL9QD1JArVzZ8JSCPNbwd?=
 =?us-ascii?Q?9dvoNz8TXLbXPEefr3de6jPXcbgc0poHl8eWaA/JaXxW5b1GEr7poMUvweNo?=
 =?us-ascii?Q?B3TKh9sZqe5zZdO0Jpzf6e9Go8zSBPcROUUHn42f7mQI3oWuuHKXHbEZR5zB?=
 =?us-ascii?Q?o5e502XenKiUhp8JCFtAVYnSCFkd2HJUXZzY4OeuYQEEG2BTRqC6GdPQ/QVm?=
 =?us-ascii?Q?vgJRVyX5AFYr+sD94+tozngltJZCbCUh+sLmOW9tsKwj5HLgmFxL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19534408-e4f6-4bca-681e-08dedbf50402
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:31.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrETziO49VYgXohiFcohUWtPtyrM41hVLkhuPsaN1TRT4661a4uSbGh5zkT/QszNcHXcy6E33iUhqblAGkytSIW5Yc7XVQ1+KF5xaOgEmV8hDaZDHWdez/HPBLzmEhHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235743_173799_66768D13 
X-CRM114-Status: UNSURE (   7.15  )
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

From: Chancel Liu <chancel.liu@nxp.com>

The board routes audio related signals through on-board muxes controlled
by a GPIO expander. Add the mux states required by SAI1 playback and PDM
capture. Add support for WM8524 and PDM microphone sound cards in DT.

Chancel Liu (6):
  ASoC: dt-bindings: wlf,wm8524: Add audio-graph port support
  ASoC: dt-bindings: fsl,micfil: Add audio-graph port support
  ASoC: dt-bindings: dmic-codec: Add audio-graph port support
  arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
  arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
  arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support

 .../devicetree/bindings/sound/dmic-codec.yaml |   4 +
 .../devicetree/bindings/sound/fsl,micfil.yaml |   4 +
 .../devicetree/bindings/sound/wlf,wm8524.yaml |   4 +
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 160 ++++++++++++++++++
 4 files changed, 172 insertions(+)

--
2.50.1



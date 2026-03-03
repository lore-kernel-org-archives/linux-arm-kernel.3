Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378E9EDEBF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOASFgjvIywfg+TjjUNOsYB+6PR+yDV8wZqpgwUy1Rw=; b=z1+BLaN9XOOvBFU1p5z49bjCxR
	O3FJOKV/iO6RFwTggkn7c+jI2tXxJK1qcg8I7vb0QZuoFIzkjc93cKvWpdmL0cPK7o6Yjm5kALgrF
	sccIfS1MUsg0F24ikortHB9InBXxNBZ3s1BYB66VMybnXKVa6MXEnBWZeyKPlAh0alP7bpKDC+pgp
	9y+9igrpy8tULWidJ1DWw0KylSfwLAvAdIzcHivyjQSTKApFsnBmKSuN8k7g5Idztx2p/q84NlZ8Y
	IL7YUlS5mdHPo0pHg/qooUpEifhjMWNfe9L9K55Mv96pYlMA3MQRe+4L5ZqrYEKYqgFqK72WCAjMq
	Sd3bh4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWt3-0000000Fwj8-1k66;
	Tue, 03 Mar 2026 21:02:37 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWt0-0000000Fwd4-2QAs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzBwL8u1FSvvZXuarLeUJUiqfDcbCK1gI9e4xJ4+1O3zV7BVneqarHoj3ZpKmAy394krJA14Jr+qay3SqR+ZgVLRUbgQHFnZRZjCs99/OsTeHPBZkl/Z0ly38d1wo42u8B1HtHBDQFkepch/5/kbtCJHMe+0q6ch4JmdVeFoHJ7BjfH0MozfZ4zLhXJTyDVFZ4qUFXg1fRBobnNSq1f1P0bZRfO+/8fRyhGz+GZl0/8JUDmAmR1nmDSKw+yyZMutMGGwwsiYxKAFV3eqGpWGD26mrhqUV/rtgEyw0OXvxKvhCsbjh3ca28zTD18k2c8TeZ/3UVKRvlJK41eyGsYR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOASFgjvIywfg+TjjUNOsYB+6PR+yDV8wZqpgwUy1Rw=;
 b=ROyeEDg/koxBD9ZWNpj0sef0goV7yuwHPgaCG4e6jn8wxbeMQrHMc3Bee81+UjPYC3wp3Y8kQM2qEE5yTPXgEufVL9XGRSyPj9Sfw6afg8EdhUPKyM7W/iMpKv7K1f6rgjlA3FhbkjuqB7foNgzb32evSJq1yoOyi9BT9YAN8UzlJ0b4QHS+x4MvRu73M2KpHzW+CwWQ/baGsqSSRXagss8aYnMZvPFA1VOTYUNyMr7gdaaP7ntU6l0OGe6XjbNeo/qgMCfBpxNbGEhr5Hl+MSfhZFl0fKQIHMSq4EuaDNWbqD8mM8rwhQBUEmECFJIigCKUWQrkI6VktlhUQvC9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOASFgjvIywfg+TjjUNOsYB+6PR+yDV8wZqpgwUy1Rw=;
 b=aQv4rVdGmpaanbSccCgOMtg2UJ3zHDsqZPxow9uw9aSNdOyX08B1L8VFFqH6sno84GxuHVFXG3hcf37YyEYvWQoJQ7UJ9j2vlh8qKU0v6DX9/p+uxbXdaWNwcglwmbbjxzXNus6ER9jCxPsbv9qSYAZ0uL8Aw3giN1Vrfx6nUUEp4WKPzEdwwRf8MyDZMtwIf6MwU1aNZTxVVoORKWUaQXPwyvlrws5UyDJzlF0EwBtNsUgq223YZm1v7R5EOm1CNU9yyi+YJJJP0UA5+ZzrEvsbpRVacZbvF4/FBLYPdKCIabociaX9WsdRbL/puMCblyzPChUcOVpwV7dQtWfXiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Frank Li <frank.li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Tue,  3 Mar 2026 16:01:02 -0500
Message-ID: <20260303210131.2966214-7-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
References: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: 17625107-1ac1-4622-3b20-08de79682949
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: Ij6l5mOFvDEy8kmLrXeKKgQHjn8BqQBSl7yiiUDnv2rbQags4vJaKVqQyDQO7UNBLBz29kZDx5LF9DdYGtoI/yL7/QGKI2RvyAE0JW1cxr5GabFeYOoUKkoGlURZoPQl6Xtz5QRovD0bgeoEfkcIfEiOJtdk1piCmkC8ypat+ohWm79jNTOkt77A4pnkXpuEFGkU8xSwy9+/sVSDc3Kz/RNR+6vZh5uEnj4ZJMdFZx37xvOK8+whWowyF2Wx27YR5hZPQGdUUKDokXanMf0kTsh98Ju3QIQMPX//YFRKZOSeELcA3Pupa8coB+ioQO8DC4cnkmX7o/jgW0J2tcvD+ESFhcTokagOT5UZwlJ7Nj0agkIuVOmQrx504uuB2TerTrpg0cgpu60qJZ/U+HPCFx0abNJn/rop/RzrrnjAs14NJTvciRCIQaPA4xXYxvtwWU7erEXj7ltvtUrLDAkyFiLMR5VKTZQ2iHMzuTXpPxcH9LOFaiCH4zZluR3N0LMkXsx/8rD/QsnKQALQdWTcaJDTrsHK1m/heQ0k6kZIJqXNd/bz74aDzqhh4k+5z5ovq8c+orCVEong1p3e4dHJzUAoGE7uE7SvRHBOjiHff+rR0KH+1j4q9yTg5Hb6eQIip8r8tSF2RBI6HeqRvcYPMqbmLOGcelBOa34eGaDM6GfZrdvqWrw/brRhG84NLqktNWeqfhBNrxha2fQajQjhvVbYKxpOEHKk7EpcQyMxa9Tyv6cFp5ylz5DVrslWrF//r7Pz1yNWQNH1GQMYAEiOqdNkDPepXeND8Q9c5yrEKSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M/HoP1LPWZ9MhL16s/R5D6xgtWhhXs+S6941hW/Qfc+3JKCzBrdMCBcueOD5?=
 =?us-ascii?Q?okgJqj+RzwA2Y8B2puO0I1iJwTTQEz8leegHOPPnLLH4LwDKZlqz4nl9yA5z?=
 =?us-ascii?Q?moK/hYMunhcA9U4WeUguyJeDAcJ04RyUuQkrnIfMMlPSEu0sH2WPXHJ13zkc?=
 =?us-ascii?Q?IJEpEq07aj67qoL+kqseIb9ItPFBw6UDwzGd+eocU9isc396CgE+M4ZRKIMo?=
 =?us-ascii?Q?sapWO2rhNjZLiMO7+Np1GE9+FBqTyCmxSyhGGw+lA5CvM6USIjB+mxpjf3n0?=
 =?us-ascii?Q?Icv9ep2H2ycCc3uRlvMWAz0SD3Mw6hVnTO2ojgMjv6zeuXFTVaiHZNhlAMoj?=
 =?us-ascii?Q?aAgJvhRNOdgoSAFeYFXZtx/kKHUEbzszoBV9p8TzXF2k1Ws7vtGBnVBiFuO5?=
 =?us-ascii?Q?lkCRMuBB3YPbZ2hakJgnJI1ZPsdUpR77d7RNNAGP5OSFWNBrnKnv0/HZklUc?=
 =?us-ascii?Q?R2YQH6kyC9htiwcTKKAjPZlaFtJFW/xcWzTE8iOp3UV/xLSAiOyaZrDt+29K?=
 =?us-ascii?Q?1MUt7Uk6GZfy5APcBBneO5IS88Gm9cNJqh1HIJy1oR875k5KLctg0RpmRurk?=
 =?us-ascii?Q?fOtxpda0YJNiY8OG4yebUK2Z+l7vkpFa407VvSgHWnhkRA4G+oHjm8sbBufd?=
 =?us-ascii?Q?UcqWf1GkuV4dRNeR/DwXWNhdotOoQvT4kQ3VhZ26ZNCZSoxzSUVDasxTFfXx?=
 =?us-ascii?Q?4nhBAu3EOXlZyEwk0ODFN8Qg+8lVY0CmK7xJYwXsaJCfWsdDSV3HQLKyYpzo?=
 =?us-ascii?Q?Kqec2t2fjB2TQtV4T/eABsd7+aNJjg1ydjMLhcGRYzXZaqdwF1SyP76ggJqF?=
 =?us-ascii?Q?qUxWRuxx9TitOTG7IcKFycaLwDDfhDttaxt2VkeXpq22GWjdmbzMZQSaAJpB?=
 =?us-ascii?Q?JcLwz4Jv9WtUIWe2cy1C0ni05vBB5jGWSTFOSduqto92NQ6wmnmIhGEqUp8Q?=
 =?us-ascii?Q?z0Cmr6JNM54okVkmVpVYMhdEelmaAyTBlkfd6rJGIL+N3hVK0lpmpP5MXBYg?=
 =?us-ascii?Q?yBMzjfghrR5kRlJIMSt8uYZOSqC5WtrYZa+u2zogV29v2bhtrhOeAeUyUF3N?=
 =?us-ascii?Q?lLdC9D3f9Gq4idPxBOaK+2s+06C6oR1lhw0Ji7TLvDYOSoSziGRXo4zPSJqf?=
 =?us-ascii?Q?UAABbojlX7b1lB5bj7+imoBelyWS6anzzzcgyRbR0PsnMoCX1akgUsf70cpg?=
 =?us-ascii?Q?+/UeqdAKmkWAt2i/muYT4TttcfeHTWV9qhALQliTQZrWSCrgS0yt7vZKPMTl?=
 =?us-ascii?Q?/kQ17hRnFFR/eJFkrNVDWz8I0tvHMf8cpYOf0bTHmMk1vYo0pz7rehjC2xIo?=
 =?us-ascii?Q?UteSalg7udORC67IQm1Vj8hKCcLw6mH1KbdAKB83AOKq0FEma35ME8OWz20g?=
 =?us-ascii?Q?yQnqwiusrTm82GUeefxMMiNXi0w2uHfAYT+9/HrCO8gRxmB6PmQJN/Ib6D9q?=
 =?us-ascii?Q?wbbLSn55I7DlFNtqKGVQ3BYA6Xj8d+SVph07YXr+Q+BDzpyJNrTHWu9mcrP9?=
 =?us-ascii?Q?UFp6hnorFvyUKy16Qp8EoMUNHLl7MXHkhF6SQWk9tGkEJcSfOcvTw5P8eyfV?=
 =?us-ascii?Q?cO+29/xN2nutzrX3uPNRJLiiWmZSSJDYsFsSqL5vBFadT0pE2FTPAsStQ+lT?=
 =?us-ascii?Q?Y8rRF7cBaz88w2rekHskuIRwiMLHhj/aOmZihRJNgSxuSqBHuWGs9O2QXQp6?=
 =?us-ascii?Q?to1iNKV3fKB/0hmV5Hs0KK1uUyutohclJ6n0iZ51nr8P1YILdbElv4KDKncQ?=
 =?us-ascii?Q?uzCudGvwWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17625107-1ac1-4622-3b20-08de79682949
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:21.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3mGTdF9fAUtk2YkwiVjno/XnuqzA29GPoOle2sF9tN5G0naI+/6Uq2HfWUpq3qed1qf9BZYW1GhALxBp7gaGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130234_972445_064F78FE 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

This is a device tree bindings patch adding compatible strings for
Variscite DART-MX91 boards. Review follows:

> +      - description: Variscite DART-MX91 based boards
> +        items:
> +          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
Line exceeds 80 characters; wrap the inline comment or move to description.

> +          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
Line exceeds 80 characters; same issue.

The patch itself is minimal and correct in structure. The YAML ordering
(hex then node name) is consistent with the changelog note. The compatible
strings follow the established pattern: board-specific variant, then SoM,
then fallback to fsl,imx91.

Suggestion: Move the inline comments to the description field or shorten
them to fit within 80 columns per coding-style.rst.

AI bot review and may be useless.


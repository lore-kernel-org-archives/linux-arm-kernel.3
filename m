Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24E8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQYqKmcbQEBrrUGIVYdQ8vQILJsed5xr4MV4SR3txZ8=; b=QXazowawxKfrYVrsP3zOmmPTXF
	PyXs7wKF7Hmkg+uxL5fpozDuMNPVzwUR/PJi/uii2ZsDhhBxvDE/C5Z5i7ebGjj+snB9JFXUj5qhE
	EgR6Wg6eM81USpg1jWj6Kht4tMMmL08AxHH/l3KPkfMR7wx2dQce05ZEhpaVQfwR4uusNtEwGqGpY
	RXnOFyY9IbUGpNMjsLb8DNgTvm4bGWyxQO0YhI9/BxxA5uyRzXtyqkyVWHYRXZr8NbpDDmSfM5BK4
	AsuMOps+1ilLwo2tC8gqAxTgZV5laOjgucNYRU8/XfS+I//CAwfpvz6X8hyzGVQRuJleuKczsD4tN
	BWmy70YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiprm-0000000DvKy-2pnw;
	Fri, 14 Feb 2025 07:12:02 +0000
Received: from mail-am7eur03on2062f.outbound.protection.outlook.com ([2a01:111:f403:260e::62f] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipmr-0000000DuNh-2oOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 07:06:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1NB+n2rEWO1zUcFF6RqYR16tKPSE7oHtnN24g0ckYkAUzfUwtTgGu8oWzXc+n+ramaECqVvRv6Dpa07NJ7nzDvR69Akx+GldOK/INNyQ/8Jix/KAAHswTBUG7Vi3uSTn/smUAu7ITSKGryi7yaZOUW2w14erc1wYK0CpD4GGUBIZCKnzSj9MfFYGc+QIpJqRN1hZ+5+1KHloJpCvUAjOBzadF151GBHCSPcT/6z0iWVUunQOFYpWQxu9jWyBdvnF1SUptx7lKIr4atLRlVVZAF4z49/DCVAjAZh27v2vmIPMKR4Obv4xDlSv3yvJvqQKdBuHF4cl91Vjb7VFy4kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQYqKmcbQEBrrUGIVYdQ8vQILJsed5xr4MV4SR3txZ8=;
 b=Q9hPfaOkxFh4SjJ5htT/0e69oOHUzu1mQ2mmGJKEhLIhMSXNvIU9jfGODEoYzdTTJ4NfwRgS9v2gjnjBftwBLeEplrY+kCZs0hg/ZBhoIzanTHVrXqRg/FYippMTFaJnfmSgPZ2PiqNm73mi6W1k4ftEtOuzkfGqXeTAADy/kpV1rqBfXLKur/MG9ztjfgABTBH4QbszWN8lZeHGqYbEE5cFNJpTlI8BIg3ShmxiKdqWMxwrvg4q+kXVTm4wsdqPCTLw2ol8strz8ePv3h5WkIcQJhy8YNtPP/mq2jkcPYrJiEOPUwo8+LnbB2PsMlRMkAIwyClK6pdNdGw/vqx0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQYqKmcbQEBrrUGIVYdQ8vQILJsed5xr4MV4SR3txZ8=;
 b=a5EUAAxA6xFAVBhTJGnigqvQG7OY45ARLcj1KUUoR57/NiPWPeewtITwQzj1AB3LtOQ2ogs2j/el7jbIOI3WuP1VUVec6ofcCvz0kGByTffFJnQNz9zDsYs6YU8VSBHRnqA53zzuGrx6WCxX58eZMVnym1p+LFUeMgWF2G2FMJMJwUUxIA1SDmMB6MJHUqhnstraN+xK9aOAiXO2etIeTqc8SWYF4cZ12GX/j0lqEM2iP87hK+HH7Up5LxDt0PC8ALvwZLLdSwk+QNBxwOjKTB++/qMEIuigHxAf57Wio5dx+ctfFfKA7tskkSmcJ+pudR+gW2pp+vqxBUv3tYVomQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 07:06:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.011; Fri, 14 Feb 2025
 07:06:55 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: imx-card: Add playback_only or capture_only support
Date: Fri, 14 Feb 2025 15:05:33 +0800
Message-Id: <20250214070533.2808496-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
References: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 215114cb-3e85-427b-2608-08dd4cc629e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OgXWeawLrv7fslponWNGAUtfPFm2gS01XKBA620hv8U7CiTAmBpUrGfcrZNm?=
 =?us-ascii?Q?6oFLGs85tL/lU4TCNVhbrbQ1suy88tWejIXAPVgdEFLSePltiFer4RYk076A?=
 =?us-ascii?Q?cv0/3da9uAxOOzLfi8kLqNpUMlReZ2esbysvbIxiLDsQGQLT27Bc2X86I5v9?=
 =?us-ascii?Q?ieL02X6voxF/JnGsHx8uUKqCjC16Jj836iIbcGegZtJxpCScWjPzJ4qfEb64?=
 =?us-ascii?Q?4/LR1vkqCpQouVK2XTz1zAb+A/KR/L4PHnpjeDGFki1LLz15a64Xo2x9mPYO?=
 =?us-ascii?Q?cmi/Js12KYMmOtA/cOslVTzeyo6w7/ACdWMflNKWXlr09KxiH6jWV718wm1z?=
 =?us-ascii?Q?EPctBPQiVu/zh/70m86vrNgK+B14EuyPIZXKgcQGJSNBP9ifs7OuNToeSK9b?=
 =?us-ascii?Q?+SZZMLGOrAG1ahP91TKIfEqsPYxCI47yLiFQ0tjjsW1Se+kDdxcQhRpR9hrD?=
 =?us-ascii?Q?3wjMQsDZzu9vXcJaK6L5MUhU04OsdU/Mh5hK2hTDwkhJXvh8cstUtFtnCCd4?=
 =?us-ascii?Q?+6JNzVA2e9CrZlYwP4DcquHMQ/aZ1FUYeLUFRoVdLjEKIz6mEJi0oijhph7p?=
 =?us-ascii?Q?+X5Y17g5yTz/MX0blIU9wiVJy4eBl/OufD9GxIPzqTkBea2YyWoA6BvSqK1P?=
 =?us-ascii?Q?YCAWRwUKwkGSiJ+QZA7MTV1QYqKpAmzvZ64fzaLNGiIoneIPGx/EVxRDJxol?=
 =?us-ascii?Q?pvAjHo/sKhPPl2H18FZwZrVJKVHyKIgVGYxIEEZSYXUvnkDWK8DdpJlnadM5?=
 =?us-ascii?Q?A5fKhvZcVtrS9dGop8qVPN1wvYqkOTnajd3OU+PcVRkjk3azdB2uVPTGXvg0?=
 =?us-ascii?Q?r4ldz0AwikYKbZF2pyOMojL0Hy0J1y7LalQvM1dRvpgkWLa96XhfGrAKtE8V?=
 =?us-ascii?Q?tVVlsm95FAkcm7oBaWzACFSIZ2MfmFltEOafXcWOrw/uo5+bEQ2wF8V/jaFo?=
 =?us-ascii?Q?l5IIP1AnwxJrgBpP35tkos9wOCWKcQS26Cch17DRiwcI02R2xl53pG3iWoGD?=
 =?us-ascii?Q?2fUdNDFZStoxaUFIzMw97c5Ph+snrsmr5ucozzXdGoLVJUHmU9l0YiwE7Zth?=
 =?us-ascii?Q?xiSZVwDzAm7iEKa+o4ktsAT1jX48pKWJ/JtIPf8VpBTd4kC5nCtjfzHjcP7n?=
 =?us-ascii?Q?ma8G0tAIy4sBIrwZT0VHTAsKJO0PExJ0SxRJCLzcV79FosZ2a1xeddYxdwIu?=
 =?us-ascii?Q?ye0vGLTHT8xswSKb3DPQYJVGmPuXGXtuQBRRvPGCO8/rTMgn4KZnTUesNy/X?=
 =?us-ascii?Q?vd/L4Ee3U9wbAcQiIaKD3FbllzM3cCQgYDn+EQGoCTdiAQm/W3C9j0QjE1Aq?=
 =?us-ascii?Q?bh+CyclqHEygrKFpjpt7imeF3J0D/T99/90Dw4bmB0G1F9G9v9lDZO8ipreI?=
 =?us-ascii?Q?yPa0m4eQapR3zvjfPuVdSj1NWTvoQSivx8mSFJUfKK6d222gAPQVLujzPwh8?=
 =?us-ascii?Q?oqCDsMooAwv4zsJlDInd7VjNV155OMeKTHEqFzfMxX1+0Iuu+9hUJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+L0R+DeNLCAw1xEgtVTqamNjO3YaDq9nb7G42qnxbBNjQcKPTnZ6HH7cYE/?=
 =?us-ascii?Q?61V+oN+v0fMnxxG+nv+O+mF0wqCwtXX6SAEvthfUjolQkKQAKmL7jkKePskI?=
 =?us-ascii?Q?H7MICVyB49LIqMDLIsktj2JbJNpNYrONFnJ16H5nRd8S1qBvQGDT+XmkUa84?=
 =?us-ascii?Q?ucZjZjWm3Gj8qjYhKdFDrVQlmGcRM5nXMjwiV5KQBTGLNx++E53Vcgb7i9tp?=
 =?us-ascii?Q?p5h6YOa9Q9lQKZbYwdIP58NtygPtX0woh3f5tmuuwzdgnjHilPcTs9Ioo1vg?=
 =?us-ascii?Q?ELDhyWqO4DIsIJ2oJ/JubUci+6G9slHk8qWoRTq8/lF0ZAHPvQTyWe5ZmIrq?=
 =?us-ascii?Q?Snb8QBK2BvIAMLSACz9AYRD+qh9SwnY9ClORkPQeorolwY6veu7e0/tgtSjp?=
 =?us-ascii?Q?jGW4enYsb52QH+bgn8a3yCy3zVxuAJQXRYrpypP8v/2e5iEsOIabfn0R7LSe?=
 =?us-ascii?Q?mQjJ7Z6KUje9F9lUjGg9uLj/glayi5ITo9MnFkyNrOGngSbJBg4Ft7Ni7zLl?=
 =?us-ascii?Q?d1ptuhcx0ruiez4EqsR2YskKhOaxB7c7GiyrB/EYLoZn4oYXLeHKo9Jqw1AF?=
 =?us-ascii?Q?KNTkj1mIi2ZlrJrDVYhVw3JreMwHcwNVxQfPJWEbK3SOgdbLxmT6r7d5xn77?=
 =?us-ascii?Q?hilFOYT3DmCKBH111xgRZ80JTW79F69HXHAikxYJ1reZpWPJHMIyphHio7iO?=
 =?us-ascii?Q?w9YRlDadkhygKbmAKzmnoOZy16Zip2kF5f06C7hpCx0ody6jUn6Gf6HvbPa/?=
 =?us-ascii?Q?fI04JngZvHqAWepNmhsqZ1jjcXpxpArih9ZpIgkWKYT/nanwE0WKfkMGoyfc?=
 =?us-ascii?Q?QwZlMPCAH6hKfEs/XPeZEN3VV9KTy7ortxO8dzaKWu5RylE8TgKe2DczFgv7?=
 =?us-ascii?Q?+mabdK5kyXpponFTC+zyUw3CiDWbV9UaRzzl1vV6HgadBC0p/bciSVw9R+g6?=
 =?us-ascii?Q?EDHcBski/L+6bkYz+sSE0n9KTzRQNU/OdKu+NYVeEmEK02oN8VProSUAxF0i?=
 =?us-ascii?Q?vqQwPiPzvftm3rpxr1MUgLiprVMLl30YO54KzLEfS4jOuDDco3P38VStyjoh?=
 =?us-ascii?Q?hJ2v8jehM6CHId5tEpbgZsgY/y8Tq010M32jplZbarCnhympauyB1cWrut0m?=
 =?us-ascii?Q?cUewyhWs/3vG5E3LdoqIBrduHV/lLLhWuAu2goSR89emgwppuh+r4Q58n7zU?=
 =?us-ascii?Q?GVtjLqesOYrBkwY2MazDPEH0c2FPj722yI2wSjGARBuivIDbfhy5swKsjykC?=
 =?us-ascii?Q?HHWSuH2JNsN/ztAVHSKTF1K4L7x1yYDtYKr15uMAKp4eUjiK2Yic0310Ho3C?=
 =?us-ascii?Q?si4/u4cIGvkSa+PwuOpzU29fUR9gzsKypbdwUcjVisoX05+EaS7WYYNsmsb5?=
 =?us-ascii?Q?qFh6rO6aekGBDBdAQxgWeE9xkHFsqkF0GlKOIa6GIWTEbbPwLEBPUpoE/T3G?=
 =?us-ascii?Q?Nou83/iZvN8CdWl7DuJyMtfPpSStw5ebVF1jCZaLijNsIDCVV9sRm7hpmf9a?=
 =?us-ascii?Q?vlBktGt66Ixtq3Bbq6JfcZyMmCuM71kPbXoZD7XlxsD1fsShAzOqw60fCgdb?=
 =?us-ascii?Q?ng7vjlkkVZ0Msxtbiw5rSjAHVta7S/A6xZ9BrgWw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215114cb-3e85-427b-2608-08dd4cc629e5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:06:54.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IinHUtyYHCDOA1ZmlgQFvp2ewtu9Z3fXvmtnlESRasH5oLXds1BxUP3gGxCrkIMIY/okTAD/hv2YWrGd83/S5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_230657_707163_DF2574A8 
X-CRM114-Status: GOOD (  10.76  )
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

With the DPCM case, the backend only support capture or playback, then
the linked frontend can only support capture or playback, but frontend
can't automatically enable only capture or playback, it needs the input
from dt-binding.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/imx-card.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index ac043ad367ac..905294682996 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
 	struct of_phandle_args args;
+	bool playback_only, capture_only;
 	int ret, num_links;
 	u32 asrc_fmt = 0;
 	u32 width;
@@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
+		graph_util_parse_link_direction(np, &playback_only, &capture_only);
+		link->playback_only = playback_only;
+		link->capture_only = capture_only;
+
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
-- 
2.34.1



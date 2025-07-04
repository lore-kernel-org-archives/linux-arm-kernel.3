Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E1C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 03:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=; b=mv9M3ESUvazdj/OAAuwM93wJSA
	b1LuNx9gZtw3J4pBOwS+m9Md17DC13HXM0viCJhgacXq/GZayXoeUZNl4ATWujdx5FhftWPmsA4Lo
	ZQJj/WgSx3zoZp3c0uRcbmLUiU4XRU/O4SXyLx/GVI+V8s2xLfH8e+jhWdymdqUGnQq0XKuqWXEJ0
	f9bko3BX9fFMy2D9vk7lZTJV3p1zKe5o2u8CivBlfSZPFiOMguNoX0IZii2hAEDXzpEPDaZo8OQAG
	ChyLdZusqVXk6fM5scBFDfzKXlGGsn1D49+QzlX7nwG1TvtTpXvLTDt17IiL3BdGfhTO47iNxh/cn
	fpXe/aCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWjW-0000000D7z7-0VMp;
	Fri, 04 Jul 2025 03:05:02 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWSb-0000000D6If-21Kf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjvLEolx9NEKz/hT6HcjkTBcl77kiseDw2ZKFapNijBQWi7CvS04QtkzWc8LF+DwWJD17nSAR5uq1MKxivL+neF23cj+fI5Dse8JcZAgmsr6SzbnOk7Wn3Njf3xXGGUtSL4LmBlf4dmQjHX/XjldWn4pBtP55RKusQlG8QKIRq3zCT+0B1fNN4r9Dcgfo+Q+lzmCXWECxFjcnTUOm04to0U0b82fGxg4EBS6pTnPuNARLEctbyHW0cHmhC0Caxo9boOKluYHymNmPuz/IDM0p9lVn24jaaFdz6K7F8k/8i2TpRU/4+zZRYylS1JvIPIa7kEVhjwxTcXsGLdhLej1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=;
 b=amDb4YLmwFY5p6c4karTWnxqLNoVsHGQuiF/O8AYLnpkxr0RJuRPKzpTSMa+ISWivFRvQRg3A/S37sVaJIyPSBtskb4wxaASJmTvnjitTMb3U8UnTAmAsOP62EVmgNjMTtQqe3bGzhirliEnLQShdxOc2rOnfhL72875swnBP7PlY2NfsIQRXR4YJIw35AZl4M+ZdLopS6nWjJsV8ADhP+ramZHHyj7o34QkIiO+QxHR3TpauMbs8MmAtpctGwGGqFksUr8u0pO5uI6IvcpMJG9qYTRc99uLP0Cd3V6Bfckb/F0hPHuFoJQSQY9OqjBY9C8Mjjp53eW8eBBZl7a6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=;
 b=O4mYN/CgcK3nZiDuNSNTH/EhnArHQ4qRVo5glzBuW73oQRRSZcxNV15oYMtTD/5Sd+pkSW/lIC8f6HpD4oczn/BqyT2B2IeHgzQSZPx862kNco6GMVvB9x9ONjCB9oh0yGb/eR8Oq+UEWsJ8CTO2DRFP0ow8u5nWgVsIKKDaqhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12880.jpnprd01.prod.outlook.com
 (2603:1096:604:340::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 02:47:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:47:31 +0000
Message-ID: <877c0ou0xo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: orion: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:47:31 +0000
X-ClientProxiedBy: TY2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:404:42::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12880:EE_
X-MS-Office365-Filtering-Correlation-Id: fc681cd8-e53f-4ace-1063-08ddbaa51f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rzl5LyInozWExTw+7Ij5AoBhfMBQiMev6C5xNHRCH4OPRNB8y6WomOaLI9Ub?=
 =?us-ascii?Q?VqyAHXOIq0dcyyun0mIAY2FAe4lYDIbaMfQCMFOzr933rnXZ7d9N6ZGuGgn3?=
 =?us-ascii?Q?2Id+/t4v59mfiecgjU1TeG4IxULMDpkTgKzGtIaoOcAv++bj+1x5pe3jlTAN?=
 =?us-ascii?Q?FT+NL1iNoveYYc+qATLkd2HnePQs12c16BkhcMaWR6etXEo4nmBbaTleWkEJ?=
 =?us-ascii?Q?Npk2GPYuH+rs41XQkADzktVziPpIr6bZO49MrDo/6ZOxY/cQbLGj7/2rM3Ud?=
 =?us-ascii?Q?HeJqm2oJVH0xBdtDgZ0cIOAS78MW1MqkKWxjUdZJgOhxf9ZWEBg7lpkDrmEM?=
 =?us-ascii?Q?zWYbF/V81wDuJpz+m3NBhapSj/vXtZYLnHV1CExDbYOviuVlijwgSMqbr3ec?=
 =?us-ascii?Q?XD6YczNp/YtIcMMs7EbTvshTcdsTxZl1nrsIhCNDkr7A5HsdZE/a5t6LW6pz?=
 =?us-ascii?Q?LB8qZDPTh0ArstgetI5RlwruQT1VIri/TuFPDznCr4u95L03L6wpiwf5XoTX?=
 =?us-ascii?Q?l8OHS30uAiMmTZ2h5Znedt8sgcroO5UnjDtEe+qJi7MtPZHjUFrXv79XtNzr?=
 =?us-ascii?Q?5BQSOXeE6nSkKz6HCNCsWgv9fA/fjCxyit7WBgVCpE4XYegKkJVcUqhCKjux?=
 =?us-ascii?Q?GyvcvGhSEtp5qxLC7EyB4h1Oo3c0FFmBsr+TQw+hrjWUtHGNgKCAJ2uF1Kma?=
 =?us-ascii?Q?NvVNucEPbM/SNvQbWHqKZA+1UxYYuaLcV3s9RR3MMAxkqzin9npn107rcJKZ?=
 =?us-ascii?Q?moJtdGy7/dAGJyD6YDcmf4itBoI4TTwtAcTv6eMHJ3diU6dHhdEbmBjNMSGj?=
 =?us-ascii?Q?AvL2aTv4Wy1Chp7Kri3+PajbL8iVD/v+zxX5h5JBIs3N/tiKkL8ZeYwTzsi1?=
 =?us-ascii?Q?WykR/Z3wYsoNcNfjScUvFo3aSTiYNKWz3Q8HhAIDypslmKh7mSbtpM1ToJv1?=
 =?us-ascii?Q?iFqzqQ4YURFDa8E4aLkNJvrRc5BVoWiTEaTUdoGH9jj60x0ClIoKrggEee4P?=
 =?us-ascii?Q?hCiJy0HKMOMkeXQCQgmhy5Oi3a7d3ejDq5sTEPUlgkouqluha8xtWT+QDgkW?=
 =?us-ascii?Q?G9SEND+86JGrjXRgin6/I0UyP4O0RwtgIIfGDdecwpg+JHDK8rcYCSkuAqLb?=
 =?us-ascii?Q?xH09b05Su5kneKDpCiXB0He9RzZv/jRN4e7+tC1zocv98iCaQTNrvLNPf2jq?=
 =?us-ascii?Q?JqoabPaN+drBPZPH5fJAJIV+R9BW1FlBXG4HKwipujYOUDfFyvTZS5lq5dfg?=
 =?us-ascii?Q?+pf8jScSbJ4Mw84oVXDT87ogJYajZ7yzeFLYASUvQvNvFoeSOYjKUHMESL36?=
 =?us-ascii?Q?77E26lmW5zIgY40pdbq0gCgZRQopfFpKfSywr+h0wxlrO1iD0luaKzVIcuA5?=
 =?us-ascii?Q?sRgh7DcBnj+4q3wP4JNxiKqq6KxI4wZoYe3jsI3pPFeCTiNSHdkLi4s5rxHL?=
 =?us-ascii?Q?WKDtAmRXSjWwVMjCAqJQzeTbp1ooXzvnDuTf6ds4zCiRv70MBZNS1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fyho7tc2FloYjK9fCfnjY+KrwLn4xsb6MHeZ3a5fWhm+5jHMpo9I1op3Ap/p?=
 =?us-ascii?Q?ASGchNZkyX3MKeGrok+K2wHpgHhRhgc2Nyr3i78P21yB2MSv1Yy4YLJiCNYj?=
 =?us-ascii?Q?813LMxVF8JhcEfUhvH6ffbMU21OTv45mHCiC65Aa9AEmSaB4JycWJytoU/cK?=
 =?us-ascii?Q?9B9ow9KCm/lniL0gPmbbWmWAGHvyFbKBaXIBFIKSJJPo2/kZuENCDTmv93Ej?=
 =?us-ascii?Q?Gnfq90fi4EiLGa5A2FsNp6YuFAhrRodUgpFtmFMyBKcZzFaceeRDP/ylTHTC?=
 =?us-ascii?Q?NS5h1+ptjRvkmOwqipFuRmZxlRcoqwOZcl4o2rfg/TDJnr1mi/0rTGVZA3w2?=
 =?us-ascii?Q?G2Dmc6q2LWJJzhobJzc1POF/A6ciyZKNR1lUjqtR4Ul/ExILvWTPQydoROp/?=
 =?us-ascii?Q?tHNentgjjGOXyu5gcUkrBXQTPyZHN0sHHk2UxWTWbIWnjHXIQlC2tW7dDIlr?=
 =?us-ascii?Q?8CxRUx2Drn4n7iaGj3AlK0wg5Sahjix5FmBRdzVb8FDHH0Z/uuPOEnAq+jfk?=
 =?us-ascii?Q?n0rpvIWemCZad2BJUKBxWUCjEki0j+qYwK4O7No69dEmN+XiRxc2OONFjEt7?=
 =?us-ascii?Q?YwpGrnr3lk8IEUdu6vqnC14tnet5gxJE2Cvn8xiKWM1nV6+30CBs7p5jwMFj?=
 =?us-ascii?Q?67OC/PTofRKTh0Ehp+rFCF2o+jLqWm5lKwfLRn3T2V3bfPdui8kf/nirpX81?=
 =?us-ascii?Q?EhLMDNZhq8DRaNn7TRpTIFRgnYuWSLF0cd7+iJdk8ZC1+jEIxgo7QA4ZlyNF?=
 =?us-ascii?Q?QdqivP/Zf513Y7YC1DiKUHBCJTZrXmUMKVUvZZCK6xh07jbR/9BvjY3mMFs+?=
 =?us-ascii?Q?2W/uegrODzrbWiKt2padT0WPpmUvMusCY0qYyeZa4aSm8ButGL2/IWJ6XQzm?=
 =?us-ascii?Q?FSrGCz1VmRC29A40m6oD2h/+WOSJtxjIW8aIWLjkzt1PxRpIDaN4huD3iYcx?=
 =?us-ascii?Q?j0sQLH2ZgZL3tjpvHitubEs8lmMyFb0nnQZOIaoQB+BSryWoMfJsYFabMIla?=
 =?us-ascii?Q?/sXyn6TyItOVs4KVc0krhO6yslMF0P578L/2Xf/yhBP35We/d5mjsnNbXTEW?=
 =?us-ascii?Q?Np848B5mj+66eXI6m/7HbtixbYMRQP9w64fNgddoKfkRAfMxMbxqkk/yZid/?=
 =?us-ascii?Q?rNVt0yi+HZY/q84WSdJn+pZlOnv+lMWawgxZHcaFEuimLzFZBQXHBVOsbze/?=
 =?us-ascii?Q?k3VHnACZq7wBLnNorHQr8BEMFXdAxIfRgvhXMogqdJHdF3tRzhXhQn0fJ5mq?=
 =?us-ascii?Q?xxzQz4A+KpELEn9bL0d2jybrjAuEjJC2UgUjzNOvlS8cLx6Le6fL28P9j7Xv?=
 =?us-ascii?Q?FZpZoVHFSAgmbHe7oGNstVfDIFUIiMcjkAy+Qe8GYyu0wxHiFBqUJcYeyboD?=
 =?us-ascii?Q?lgd8od490I9xX5FLrx3fF+T+KkuXEF5u2QWFIzydevpg/ykOnpU/M9a+31gC?=
 =?us-ascii?Q?ynwvQK+La+W6wszCBQa1Ssz0Zc7/sq6BdLT2osJEwugFaX83szLorpykV8Jm?=
 =?us-ascii?Q?ajmNpNjUmRTg/3OzQfLruG/qhyvMF3yn9CR49X384vjlUE2rr4qnhiGjR7AR?=
 =?us-ascii?Q?OOIcBhmf8NiQlYZb0T/L1+mq5/rs9GQPOs8BZfjwcBmexaD/0IOGIG18o2AL?=
 =?us-ascii?Q?LBN9SwLO0L9OVz3Yj4LTWVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc681cd8-e53f-4ace-1063-08ddbaa51f56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:47:31.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWh3UUOHr7ZXheaFRP23eO65fmcW56erfGmUZ8x+KERhKtpQz6zQRMD+4bY4pvql0Xr66lBFNSF5P2xFCmOe/5ri91gqvVTwftfLEd3nutTdXms2RtGZretgzqMLT/7s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194733_521090_79901683 
X-CRM114-Status: UNSURE (   9.49  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v1 -> v2
	- add commit message
	- add Reviewed-by

 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index ca1bd764cfa5..6f09f65e3d95 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -468,14 +468,14 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
-- 
2.43.0



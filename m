Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D6A109E544
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfGMKzrcGAfheuLbXSO4zE5XcJ7/3jIzV7Huj2tLLWU=; b=LBKgucd/IvKR6FRTdP1ngF3V92
	fDGtXJRz79z1zks7vsHBYhjukuR59xjKOorHoosmprQ4l8hPcZs9/98aZPUDpgRGQCMR2qgUae3si
	ShlTvGMJMvuvih5DgcNYsm+CriDIawM8cnxLHEZ/t69pKcsJcL+70P18+mnSZeo2YyliBBSixHyn+
	KquA8CAy6j5XX/9VBV13CRJVeBZQY6lbvEUriAKDru3mn0DwEHrtFwcdtTxtYg78nCCWiPqyaQ/3R
	GmsZWV3cVW7yOzxFOeGYaO6YaCWdYyK7T+r/Eg7sJjXNFZQGG8Qv9//+ImTLtlTRuIv+eaqsdzvAa
	1S8zrABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wl-000000074jU-1xfb;
	Fri, 27 Mar 2026 09:30:51 +0000
Received: from mail-japaneastazon11023129.outbound.protection.outlook.com ([52.101.127.129] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wf-000000074dZ-0Gla;
	Fri, 27 Mar 2026 09:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfkgW0ImWbvRLUM8/r79V2DxH7xPZYFr/CAgb5J3jD+JN+LB3nNHNpAzng1QVqNNumnXmxxKYUDugKfNnNoiXzl3Zh2dzMyXJw5Q4vQyZmOAmfQR8kwpwHEXfN7wWokt60xFGiPfUeDHoJrNIB9z17UrqL17T4B20h6+8btiHazuJZPBM0VLGLdPwGM2tG4i3tpL5NyD83nXVY8qliAHE3H5VzgbZOdS12mYYW5fnHkId4+Sedk6NUgxXOs1ofnPx0Z6PTTTzI+9KQs1sSe5Eus1pH6zqKRIqSEaCO8RZrtQyfbQBj4OjoPoIeO+evbVpZQZ2TS9TnxRk2uya+67gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfGMKzrcGAfheuLbXSO4zE5XcJ7/3jIzV7Huj2tLLWU=;
 b=ITEHEY34JLjNeTtQc5XvHIrcBrD6ZzIXG6jdJFebl4MjdacDZTbf3sDr2IutEgwNwNUqFBFPqA8Hmt+yApJo/tFvD3uqRzE2y3namr1e9yiQ/QOpcyU1er822/mG0CGbgc/7kDp8bmuGtQSlXR8A/GHV9x5cuNEhQk/4/9g7pJcTcxGeNFE+lkRAIoJ7N80AE6SqkaheGBD8VZgKB34aaUkbuRyET+9INcC5+d+Cbnvj/EwiDiQ9+cG2frQIua3jHcxW0j4qShFyCNmoBRQAVVeAqfQnLE4wwpdw5m/uYdfLSzwvnZ6lqcJy3UbiO+0nRg+a7U913RULuRxufENJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:36 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:36 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap
Date: Fri, 27 Mar 2026 17:30:16 +0800
Message-Id: <20260327093016.722095-4-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: a132f9f7-72c2-4d88-3fa3-08de8be3808d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4+zdEXBBUlyHmEOGSEaethSr+aroNyGDShqzvpfwcfBc6s+RnVjUGkHaTU1B1Ef/3SeFPojzIOGWpU5T+zVbqaAJAleuVBxz2kzcyZfsOnCYNOEDF+fXpqnWR/DufDZ/bm+px7GyY3nb1YegMZZXwxll6BeTa+z1TGSrnP01miprumkyIE7SZZaWQ+7KsUbcPpCIwyoswm15YgJmRl4EdVM3syJrIhEYPysYCxsxSUDd+cJdvckb1xf9vsDW/uzj6tukNpTsp47RMqOlWIafmma/up2+DoJILtjgzx9qWZ951ie8QDunHz4wsc2wN2tYiQXWPSFQynX579z+YtV5wVyn1i/TW6ExJr+qBOV6TDADxlyjwgF+nh9lhkmxv63C7TQuyWr8UGIJH+MNEl6XJH671e43CMi5EdJInPZryu4JjEG1egkGZByU9jG2UlZO8PB2+wX4mofACCUW30nheripIF5Alau6iPY1kuGwmHrOjGXwkog3Y4CEcqxiWkfXVN5R9GXQclKmiQhtBxn+O9fiyfcPTBfKy6nGOJ2ci/U2Hh0TdEExgRB/rR2LvsJsei77KA4Y3b575LCqk5ODRPcp6gqw3S9qYqm8vqYkK/afz1s1v7jow4vA+8WSCsKbAQyy3v28ZHoCzcNOIDz/c7boFnauc66KmWlmo36SDQpL6r0fiI8koBp2fUGUedFX6+9I+J+36ujLxN4iZVWtOV8JFg/kzU3tJQGuevNxVBP5plCZDOK9I2NlrW4qjnqWRA4lh/mVyeeRIy8zSYxTbmxOlk+wJVnereW6rs3BCDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NeNwN7zJtcXAjKmQ1DkwEsHqP0j+QKv0bCSkxF57OnCqjTZvZ5JYyYCB7YsN?=
 =?us-ascii?Q?ZvXbdmI2ZKmE0g9SSGFHOmJ5a7N9UeHz3PNYtlz9rd9g9CTdw+4MJolJ1aSK?=
 =?us-ascii?Q?Td20D/F0ROKS1bG3y3Y3rAeVoGnbUn0TkjOOBu6nNhCfiSY3YzTQrPF2tkWL?=
 =?us-ascii?Q?IZAwpjrXFZvmbJR3gO5fCp7V7PCo/sdMwHBZPnj1+doaMQO5lV2mVztYb6Ps?=
 =?us-ascii?Q?oxnstNi7d192YKXKCfqMEC6zqvYE5zKzZPmI6PAfBXxS+F+rBs83MD1KU1aY?=
 =?us-ascii?Q?EaveXBOL+h/SegWRxDnq5EL50+/8+IIKXBi1DXWbgCGFl4MB6VKa2EJUPSk3?=
 =?us-ascii?Q?gmzuHZKsnPRsc/dJ5LMgV5a0Y8n2ne1tsHTe4UiUWPKmTxFrGNlbGaOhCTmb?=
 =?us-ascii?Q?u0L6FPRW3JTcuUxzuIjNU+UXpuDU4dLWhjsdTamqmENadH7uP7Q8V8V5DcsZ?=
 =?us-ascii?Q?TJqs5gJtPvnrGv7sBPGpjlRrYq+xyZheNo0tyd6mkuoS8/DhmOwqXFl3XOaC?=
 =?us-ascii?Q?I/OsOIiFnRJbaQX7L7zyqOpEMAJgEXuwFjrEMj+LIkkJHF4Zq5CsUZntZ5f6?=
 =?us-ascii?Q?xKiTgdFWT5QIeCnwa7+Jj929puVs8pGBaJ0OFJEwuIauwUGJXyQjTyZId6wg?=
 =?us-ascii?Q?zAKREAtHaW1T0PLG2gZ7ZJeAk7EMYOIXPkknHI93AQwD24NSMx9XtFwA0Lm0?=
 =?us-ascii?Q?uBGvCpkmHq+F9ikaKBagtj2g8mwzz8UOOIvxmrjyDBkxE0QkEDaopUhAQDsg?=
 =?us-ascii?Q?M4vUV8GNznn3201OwXzXgUKZceaJ63vgvi8PJwNOogNJZ9AVO+WTBGZ/JjIB?=
 =?us-ascii?Q?Uh7KgBbwQtGCvhv59COggUPoY6+h6WiyaJnQgjrmiks4SIVd4d0BfyFDUVdg?=
 =?us-ascii?Q?HQuvblM9S7zoiwQ40Jamhj1isoM0387gwZjaOFQqc+g0JdtilwjHq1rlNhtS?=
 =?us-ascii?Q?22TbMk3sIIcONW1s8oxBSNQwheDGg5y5UkORvJLPKead1OL0m8SpSRGwNW2w?=
 =?us-ascii?Q?7Iiiv7ACoFIBhj59Ds1aVnnIzBTWpqto2RVFcJPbyLgMMGIkwWOilgo8pb3H?=
 =?us-ascii?Q?tJrovYFk5ovUfN2PPyBE4MVatk0LXFrZBC6/iL3ttGfO/q6t1pWfuwSRSNzV?=
 =?us-ascii?Q?Lb+qyyjY872erJtfZ/AshpBYwiEqZBEa9pQm5Fws7CW8yTLIPmvwYIPJ9DCF?=
 =?us-ascii?Q?F5K7GBU+5llCon2Mo4hFWds8hc4q9Q0mD6N9YSxiKclt8auKOyXEayGpnT2w?=
 =?us-ascii?Q?6N1HMfjuiSlXhL8jHx2j/25f9CaTpr5JALGd4jXI2h/uiYUqcc8doBZuU6YH?=
 =?us-ascii?Q?ugu7eTKGZBEUcwWWc5cKqX+uRtTbadTdp8aa7g72uOn7R53Yy52iiAB/sebY?=
 =?us-ascii?Q?ZW+4yqJ+/JcglkNd+SGsqmECFzUVUG2SJG6tO99SY/48CaFu0OfedTZ0849E?=
 =?us-ascii?Q?p155lOVwazG3gmj/hxZ1BY1u8r2cwo3Uy/nU9+cgw3s/otFvSsX3KxgUP12b?=
 =?us-ascii?Q?qGCLGozfg31v89KjuexQCitGm4RFG9MNTyIdyVwR6643NvoS/uG2AvN+GUd5?=
 =?us-ascii?Q?3fZjXSdsXYwmHo69JRqjxMbC1TRZApARpidsdRW18lG60PWhXcy7D1vO7Yx8?=
 =?us-ascii?Q?fKH8Oy7N4+NWTp33xWFxbtnpIcHaLVok+9Ijx+ycYsppswcorRbwD+MI/C/U?=
 =?us-ascii?Q?FywqHoP9OERbdmIJ+dErCJxXArta4M2b1jsNEqyXsF8wigZG?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a132f9f7-72c2-4d88-3fa3-08de8be3808d
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:36.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+LiN9HKdSuJcwWJQsnreER+Zx6TQHPp4/37LK+u5CT0kNcX4amy1ucMTi6+S5DX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023045_115815_B33BE1A1 
X-CRM114-Status: UNSURE (   7.30  )
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

The Khadas VIM1S board has an onboard IR receiver.
Configure the default keymap to "rc-khadas" to support the official
Khadas IR remote control.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 7314e0ab81da3..99d5df71b9cd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -242,6 +242,7 @@ &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
 	pinctrl-names = "default";
+	linux,rc-map-name = "rc-khadas";
 };
 
 &pwm_ef {
-- 
2.34.1



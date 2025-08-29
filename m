Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E4CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6Ll8cjgUfdMP5ve7bSzTNYipB0xfy3kyhbRcvSyYKo=; b=qE9jyKfuyoKdatw6vVrLUZQk3r
	wAHe/b+9Jwoff3SgyTup7rvU9D8AucacOIPjDFcbe6z8ku2KyEiM0yC1E/PXW3f578dQ5esnEnFix
	pJHEMkbGheXlPFVXYx2IMRuA9e3w6C1DOD9Bbdnn+2ucaeCiMW5Qnfc+FXdB12eFDhIaE6OdOf9op
	iMzkdf40D0d3ZvXDOeKt23rnLuPAmodUv5a8k01pnXOVRkDPGWdeu9h9v+heNoZNl67g1pkkecHDq
	pwnlk1Mpv5H0QhoC1YsYbfC4nS693YbTXdCu2RWiCskiP9TBsUDzxFPV5p55tNb/lgVTacK1FZ/ss
	LpozliWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryfm-00000005jBr-2Nzr;
	Fri, 29 Aug 2025 12:57:42 +0000
Received: from mail-centralindiaazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c408::1] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw8N-00000005HcK-1DR2;
	Fri, 29 Aug 2025 10:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVWWeax+LNUjZTv5KaVlDbgBp6Ey8/7jLNeIuxuAA7z6hlanLjrX7dOraBU3WdliJYSR27ttUhV1wp+KOUkuU6724BRor8HolzFmUHUvJ+CRBh2nJf2/6DkCTMbZ2jWcwEHsdMLlPZfN+LVVaGjgi7Dgncgp92PHf97S8iVoAgWif2rrBfdf71WKfyk5JwnHUOQgYdoutgQBV6bzxvS4pJG5Cn8MS0At0nDQ9u7IRQkP5T7geexckPdpB6J4DJH3V+A9CI5oOnm9h2ptYAe4yeq5TZ760lJCy5B7v2o6inU4a6ht8sS0P44xJdkrZ9971auw5a/Uv6U4uRaFZx9HVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Ll8cjgUfdMP5ve7bSzTNYipB0xfy3kyhbRcvSyYKo=;
 b=OWIPELIkbKwE2ARl4LSG+sr91ZZBKirQ9gx7vi0dmL05uOfWfOZDl//mY1TD42JVnR/ypCKHBAfDZ4UwBlQ3Ie4HC+jYQGZF/nBIsAYE7jcGgVJBvqgxsFmlk1vnJkaYFJ7qyRVBQMTJMYailoA0RWTaMzQF1xW8px7nHkvXwm2FD1yugddSMQ5imz0MZ2Poa2f+crkKck8vWf2UbBy2foP25zxYJhJU/seZKuaGaV7lKMUss0r8eT/xi5p0JSir8sYVt/dIEBo/Dyo3x3vUSYI6/ImJIYeLkoQMjCwZH+bCUsVVfXbHa+xnTuOoaotsAEUjW/4J91UCk2F6ddTgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2121.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 10:14:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 10:14:44 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid pixel formats
Date: Fri, 29 Aug 2025 15:44:24 +0530
Message-Id: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::9) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: f54f8de3-6eb7-47ef-37db-08dde6e4e056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lqk67NXa03KdX79nZxy/ZsZaoOZlEZLc9VkyQvKsulZvaiCa4qHlijU5r+K9?=
 =?us-ascii?Q?DbEE2huGos7ZFrAICEc4hfn6P9yvPcXpqtuZ60bJPepdw4KKVuehAA7s8NpZ?=
 =?us-ascii?Q?UyKP44rrEhAVXD2PyyPF83NAmzDESM8JZwPggIJNn1lm+czPZFCEv1iuQndX?=
 =?us-ascii?Q?gdtLZsl2ILZZNcizUzLuaNYyTY2BzmYVz0oGP+EXfIQb6f5UtfWeraumui7A?=
 =?us-ascii?Q?16LKAUzlYc0nf231scwJTDkp91Q4tJwYVibUHlSeJpLJgSLRINUL3HmcDQCr?=
 =?us-ascii?Q?yLB7Vf2IFm3pf8IoDg41x7BOorvZC+nd5IFCwX2WixyIgDy8TOd2KIS+iMDN?=
 =?us-ascii?Q?5ScxTD4KIcM/mWR7rsbsqoAeD7iRoXnn17gLUAzFh3OPE2rL6LBx3Ixkf2ks?=
 =?us-ascii?Q?kLsdbu5p6QZoVKCUZ8T1k2KXPiG59CGtfanf+esP6KeqJaZASMv3mWUmj2RM?=
 =?us-ascii?Q?Wkzn59RY9zDGDdXCQBxSzSViu2c/YQJJ+CVP9CG6j8pCDaqQCaG+AACKr0Gb?=
 =?us-ascii?Q?TDgKKnm+kc9Ig2mJh9X5rlYOA/X78YobuvbPpyYxckF5t8l8qJTwZafajLpL?=
 =?us-ascii?Q?rzWirl1iDUrEsxD8SA7Fb3CV9VyaCyegrPVYJdsJAO8C9plNypx6paE3gbBm?=
 =?us-ascii?Q?4drgNNqx7UW1kbZw611TYa0WNBNtX5/N/A9sncJKsR1WBX+XxBvHlkOQ0ZuX?=
 =?us-ascii?Q?B7URPtedSksIM0rNiz+lzxLs+EhjTLTyFg6+L4OqYxAUQ/wXsdcLpCI5Bnas?=
 =?us-ascii?Q?YimMk9UG7Vsn9OFJQkSN2DEKWZyH/eqmKu2DmgmEGiIoIpy/CcGC2OOczuNe?=
 =?us-ascii?Q?2Ng26YwAODR//Ui7fQ6zrazvTKyz2He19ukCc0Ienmw2gODdOOgMsQXIL8Oc?=
 =?us-ascii?Q?WQPha92YpiTSoBnAZpwAPizyG2QRc6u2zxMVWZWQ+ZggpzWQaR9HkcSpp2WU?=
 =?us-ascii?Q?JELEIgJnKt0/1iRtBj9AXJvx53tEVVCxEB3Vlzd6IzKZ+YzbssxZllF6CiNk?=
 =?us-ascii?Q?L0toebC49HLnFGrCKdsNzfK7Wj1rpOmGlTfsnQtAxkrInIPZBS4yKIScbuWf?=
 =?us-ascii?Q?tWdhFpT/i7nTzFBG5Fj9FaVxeAAcRzUKIyM5tLe6yyqldyV6cO343V7HmBuf?=
 =?us-ascii?Q?uRe5A1NVx/MnULafr119ggZeTo8ac45ruKk4YqomcHQHCkgA9YMtMLwazqA9?=
 =?us-ascii?Q?saCbwupNP5So3UZkYIsO4XNZlSlkqa8cJRW1AV4sYISF9p5XOgIBgcheIAhI?=
 =?us-ascii?Q?XOGqdQ7d/Z88NZCMRsn6XEb0wPgVkDD4U95OfQNeSiEPNyRoAfZN0iSK4kET?=
 =?us-ascii?Q?mKST4UZWP6c3P7OPkxvZNNUR/Bo6NB7VJd/ImqoAep0Evnlqj31W53UV7igL?=
 =?us-ascii?Q?5Ck4Iu33qFwuDrAYteKib7qUqDao4JIs7SL6N11Z4W/5WReMIfGsPZcR609t?=
 =?us-ascii?Q?4YpMQZqwShdRqZ4AUfto/zCUNZFu3lSIVWFlAkNi1hEYPZ4yhTsyzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rlw12LPPute6TzWWGQ053ECOxVcTGmq2wQfeL2pXeF3Kz9T4JnW1fGpSSFcr?=
 =?us-ascii?Q?k8moMTNymo7TwZCcVt7svUYob6L/ojIxm4sYbJCcXq77mN/vGqO9fwqKpcUP?=
 =?us-ascii?Q?EIGtwIZFKM0JUS43aEBzBFsk72iaAwmz7fm7tzfF+fUB/LJbZsvPQTPs8tU7?=
 =?us-ascii?Q?4Q0vspWmjxhfIZDABqj4i9CSS0tDFyXd4isKc1539ji+TIK7TvQDRhQXiRfg?=
 =?us-ascii?Q?AZDlLRh8jxolzA15Xpwsmhnhfy2YuVe/8SfAPcJNQ0PTLdksylMRt19ff7/n?=
 =?us-ascii?Q?+1Ubk4mdVo4rEYMPz06xSBxNQIXKbWP3GCn6jRQXY8T4Lare/dCXodqVLgg4?=
 =?us-ascii?Q?EeVsXf2sNUuSVpQDyjOTfjv15fTxP710Sgz6MwvnLWTXeqoQdknYlff7qr1E?=
 =?us-ascii?Q?8ALHt05JB9CU2oy5UXf4CJWMJ2CzA+rEJ2Dt4ZmYEAlBQVk6uwJzyOKKhSAs?=
 =?us-ascii?Q?7ahLJLXC09/nQnBMfaZ/4ZUyPKtQ5lYbuWMeQP38AGzGtok/e10j+uAMr7wP?=
 =?us-ascii?Q?iLJJHWdv6uWBgNPfJGLFf7Jn71i59CbrW3n/ONOmy+LNaGIsnpksJUWW3clk?=
 =?us-ascii?Q?8Pyjku/MPqfh/MmR86J+Eg/MtaRRGxcLzvooF0i22Gb1fXWI5IonWLcaeKyQ?=
 =?us-ascii?Q?v3HzhRh7HmSdZKtiP8/NHT9sY1VzwpTBcsc4INNY3+puBGC+pSqfdB0tdDwQ?=
 =?us-ascii?Q?JEw+u7yPaBL8nYGuNFHMDDq0TCFS/sBPT0QGXBpDw2P/Sp3YuBjnM4OdlS7n?=
 =?us-ascii?Q?0CUj1VH7nKImirtZoSn1PCk0YJn3e6yQpUwtyGWEVSAiiAadS4k4xlDeAMic?=
 =?us-ascii?Q?TkZLHj9Z+uxTwugYB34qOdvz/D3nmDImPO5N+cVsxO/TFqP6/NpvRKAQ+AJb?=
 =?us-ascii?Q?E8xWEBC2s/++D3IdOODSi+7WnXct+Hr+xdKNZ4kjU47i8eVLP1AZZjE/JiQ9?=
 =?us-ascii?Q?FjnrrhF0KYFe/Tpx1e/MD1D7+9WQmiewcgRiEG5/yxPD4pC/85mFyv/OB3oe?=
 =?us-ascii?Q?H3SodfgEZPdx1rGLrchQoiRKnnMwxmGNKkEhgFUZyDE5+Z0diDwTvoMAdXFY?=
 =?us-ascii?Q?reudVQfg8ez3zn9Ldn3zSXb7yUxw66BMahw1j/uF4RQCCVvO/wBG8KY1fz6F?=
 =?us-ascii?Q?UAPFddc3HRNBRitYFD8N4llWWI2yPIY4/97u1IY0a5wO+AM9eFuWOkiIVDQp?=
 =?us-ascii?Q?yjwMR2yDWpPnlXtzwWV81bKCb9AongRUBn9nMswejk+o8cJl7IAViSwEhm//?=
 =?us-ascii?Q?+O1IKlvnFBeSslqDWTbxMG+tXD/dydXPQh2eJFNBwinDecfr9cWJvleVgIuI?=
 =?us-ascii?Q?iCFJDAYXDc+C5D8IkjpSwJGNgpsTSHDcvn/ARupFXSJ9wEH9k6zQL5FflQe5?=
 =?us-ascii?Q?Fgr+idiJHXOOg6qA9dycerQTVVnA8VDzDi3zjboGJz4B/Py2JgXufGj3/25i?=
 =?us-ascii?Q?4na/4rIGThkcOajFGGPuPxychT9w05zD/wq5no9++sNTLpYzzG0hse8erAdO?=
 =?us-ascii?Q?dCXHOnoejq/7jlz5vUEGkmRdoW7hI4d/HDLv3GuVJUAH3hDssLpG5fj266Yd?=
 =?us-ascii?Q?bmTjyDOLQ3AXKAvcLRvRnkhV5NQTGOPsFSBVb7BoeQO5RqXA4gOIMV8kAlC0?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f54f8de3-6eb7-47ef-37db-08dde6e4e056
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 10:14:44.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9ryCb6KOhJzywsNukLxVhW5P+jN9vQEVmBty/UdOnjXALv7kTeCcwc1zuim7IbJ/pmWbKIf9ouXEOFbVbEQRe2ibTAfi2A1e8B97+D0BGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031504_225709_25CB867C 
X-CRM114-Status: UNSURE (   9.13  )
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

Reject unsupported pixel formats in rkisp1_enum_framesizes() to
fix v4l2-compliance failure.

v4l2-compliance test failure:

fail: ../utils/v4l2-compliance/v4l2-test-formats.cpp(403): Accepted framesize for invalid format
test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL

Tested on: Debix i.MX8MP Model A
Kernel version: v6.17-rc3
v4l2-compliance: 1.31.0-5387

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5a..107937b77153 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1383,6 +1383,9 @@ static int rkisp1_enum_framesizes(struct file *file, void *fh,
 	};
 	struct rkisp1_capture *cap = video_drvdata(file);
 
+	if (!rkisp1_find_fmt_cfg(cap, fsize->pixel_format))
+		return -EINVAL;
+
 	if (fsize->index != 0)
 		return -EINVAL;
 
-- 
2.34.1



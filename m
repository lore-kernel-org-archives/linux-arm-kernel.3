Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9B3CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qgF/46vpSV2Q2+Gd47OgVknr2zG1d6cGLyD2Crahfzs=; b=BvTWhvo9jO3s/N/xEBJyshGoEe
	QtnYYbwakzg++SAEM1XFsT3P4+g3nWytZenFO5oE2BDTsH4zqjhSL2MATE/lS3TlojSA4Dtye9eFd
	RgLS83FjdRbodsNzXElS1NVoGvH8qrjtEv5QFATDUoZr4JqCR/E0JnvAwfaUNnQLWBTG1yQg76cKD
	ZncUJH6CAxTHMq9pHAPUYlc/ympVKSiJzKcQ/XKJbYf8j5+LTew4pERFSCMgQynSh2dkKJOowHENz
	t2TcPhs/1z5piVQzN+LvxVM+swe+TYUs3XHVF6eH5+FsiTDzI2vcUHytfTm3HL+cdkv7DLtlDEC1P
	MAK0841w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHvbq-00000004Ojj-14Vq;
	Sat, 17 Oct 2026 04:01:26 +0000
Received: from mail-japaneastazon11023112.outbound.protection.outlook.com ([52.101.127.112] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHvbm-00000004Oil-3bpI;
	Sat, 17 Oct 2026 04:01:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdUy+4VedDoy/+MTreHWTGKs7Fru5sbMnRrzb8nOzShsum8cR3N/0v5SRUaiSnKW9n287y1maw8x0+JJG1o4HDgtvY982IkPL1adogzyyN+sa4AOGpC0wWWBOWtXyDci61faYUWgq6vBdMouOJq/XMrEtEFzPwKebcOR4Ddurdia2wxrDIXsuWKGpb67ZV7SpCI5Z+iEh/7ME6qSbCjdt6GR1l/wJtEJXKurVk1cATzB2W1mH4iK5fo0T9Vfry01xhwiOZlRNP+tv/jEwOfQfbczu165w1906OkTeKI2se7x7A6YlWAiF9yq2PDmXpw2A0F2VW6XDrlnicXaUjOVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgF/46vpSV2Q2+Gd47OgVknr2zG1d6cGLyD2Crahfzs=;
 b=CnrXD/ahUn1IINhEY6E26A9cLfyoSlKptzv7U1l61uNxhcjPSlehbKaUqeGlgFenNAVZcC6vCo9Km6O//5dwDVx+52NEKIQksPnLP5k/7CjuDPveW8P2h3/EpopGZ/fwTo21Alrh2Dwf7NLyIp6df2/USKcP9r3yf8AayqQHnDHXmRtSvZrMIzNBzAY1CyI2jpJIGg1+BghV9wSmWzXHVsiNpiSdB18g+SLCwVXFj5WlHWY9vJ7suUV2CIjarEtsIAP1Ccn0GiKKaPPxQDKRErMOjWgug1S38pDzAgujoNSrLxm+vWYiG0qb1+XJseawTVC8HfzVnDRlJg4HmuaPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com (2603:1096:d10:6e::13)
 by TY1PPFAEA8AB8B7.apcprd03.prod.outlook.com (2603:1096:408::a66) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sat, 17 Oct
 2026 04:00:53 +0000
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74]) by KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74%3]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 04:00:52 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christianshewitt@gmail.com,
	xianwei.zhao@amlogic.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com
Subject: [PATCH 0/2] Add initial support for Khadas VIM 5
Date: Sat, 17 Oct 2026 12:00:36 +0800
Message-Id: <20261017040038.3702428-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To KUXPR03MB10477.apcprd03.prod.outlook.com
 (2603:1096:d10:6e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR03MB10477:EE_|TY1PPFAEA8AB8B7:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd87716-6333-48af-df04-08df2c033cba
X-LD-Processed: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7416014|23010399003|38350700014|56012099006|261009223027099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: s6UHYH/iwtk+xHJckXq9WxFgi4QIbY+fuTsZuAN4HB+qw/Mf3KtaBGk0Z8dNpPUvLD1duTuWJvFRt1axvGQpwF3k8rFifG8cT5uX6oW4QOtEGhCziY9azovXz5ScDpe9ohKCW7XlHYMQeYMh0Kithq8ZqoviAyHG9RS900hFS81sU4ifCZtDpitQXjLgImsTG5a/3e03j1Plsd/2QswDM7J5iBfeSKGsaDLFCj6uFFiK1bc+5J72Rzm+A1Rr/6RKVjYuXZjZI0Q0JydZ1Uli4vP5tHhZuA7T2qx+WsFR4ZlTGjMe21McGr/Yq2LV5Fa2COu+bukNyWn3PqRZE/wXRcm/ldtmCvSinpSmD5XDQFduk1isQBRyyNpdn3Hr71BVDvcHn32UbbN2nIHKA8qpVXQCbh+KK45GaQ/SMne+YM2cF1lFfknaikvJcgen3rWngfqSF4guRRSk921fSvfJcPL5TL3hQqbsReNMLWTJF0c08kVz/j2wS05B+ulu0PZjWNfHym+SbkF2hjyci2sppSJbKrf1LjzxNpyNpFUrZmTSf3jR8lTcyvoYgS5nT2lHANWeCcyOejIDuSkpfLKLIBzionNmkSAW1NuJiRRsH/yWOmp7Vb5Jy2B0wGOyegonO1G7RWJmtyvGHAFZvsbQzUvCFVAGwUu/Mtnqi+EhJZa3bfKXxk18AOeOLu4kNoAyopqeOwMzBwo0XaM0PSt+PZ8rewy1+3Yqgi+qws1AHM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB10477.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(23010399003)(38350700014)(56012099006)(261009223027099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MMOZuCNc2UZinGM6T34iy61daCikEME2aKOvhZ4rtwYMLbIw3qYBxd3dF8aW?=
 =?us-ascii?Q?b/TkrGklfWXmYD7SM7tX2YW5pSywPV6R2j6ZvxIf0j2QWRAlHXXckYIumCS7?=
 =?us-ascii?Q?lI+9EOGEcBslFmmY5/6q6QeuAXPCFm4GQonQcwVh58C9Au0RB9IAO4yiwdSL?=
 =?us-ascii?Q?sE4OM0GNetWD0plsNE09PhXNTAjzrGfb7Hvl/DGe7kjklzHwdW+qvG4YeeVc?=
 =?us-ascii?Q?GORKcu3qogWSD85eLPhU8tfEx4tI4wBw0mPelNJEuvPcDQiz9TH8ShQ/WXn0?=
 =?us-ascii?Q?DJrnpOseSvesJjtXiZjd2P7dtRYtOr+5z+B26bEvtrBUYD03ZsLpsboq5XxS?=
 =?us-ascii?Q?/mDXgGn7r1mmo4FqllBDG4EPJq1h3dO3d0+H3APIMrbtOOiH4rg4lPeOCvuz?=
 =?us-ascii?Q?Nh2bQhofyCUfEVvPfuLa2WfSn36Y2cCs7MdORiPvObNu20x0lylDXyQ2COC6?=
 =?us-ascii?Q?kdLdqzcQnwrmGYWDV+ZsS8m1lCsOPvDwmM/HugiE12MyIB6nmEk8ke2zDSKe?=
 =?us-ascii?Q?Kp01tE7QX3+SXZ72kOwTtl/r/gfthUDInHoMy+pAMQOYa+mNSKqKBjBKQyE+?=
 =?us-ascii?Q?gSRwjtSxjSaFCWHeKOi3BkA894fOEo8lTX6CI2YKe+kHxTLBs6Hc70r7yZIL?=
 =?us-ascii?Q?WHJhLm4IkDPfS0hv5ZNNtzugFKZbovoEAGT5wwvyVJRAZlrE0KboniZSWgCU?=
 =?us-ascii?Q?U+ag/fseLjpV1ip2lCo0Y6ZaOt/63mvG1BYWbUPITeMDNBInQTPZF1d/y6nq?=
 =?us-ascii?Q?HpLYQmNaChdwRDKWtVgDOvpFvK6NcqwPypk4VJjwrL/rOz3qPmK3leJJUAX4?=
 =?us-ascii?Q?RxngWVXArWe9PNVczwW58HxuAEBnXMKpltRKgTRlBC6WMODIW2KZ7imBNztq?=
 =?us-ascii?Q?wrC/PIbu4VrrrkhEr9jSO07dB6EjsYoUs0IyD7ysuk6lN2tK6Taao1pZWUzn?=
 =?us-ascii?Q?SnbmsCQTshz01UvH0jfF+uc3w5is8bw4Shi2c29BwHz0rZt82iEbsAaQ1bCM?=
 =?us-ascii?Q?XS6iL0D5E2xy6TRcst3PdDfP6Yn8w8yaDmq1tRiC9TX9F5Fq/MXKevUFmb2N?=
 =?us-ascii?Q?rNkFjL9iv4E7l1tLjsJ0C5pLz4hl56RZBzAsqgUnGuMLWZG20IYozhx5JScL?=
 =?us-ascii?Q?iPQdropQ/r+c+qKRCMR+eurvtGkIuBBKj31WFPjoBJwkEfk+OBOLY+NGraAr?=
 =?us-ascii?Q?Qvc9zwEW9EIQfZfCc4Pl7qeLbPfAoyhIfZMGHDrVrNDMC/MQ2D1Bydug8GOH?=
 =?us-ascii?Q?AcjZsNkQKMsPUPWV8+BwKEz1YOHkqkJ1V+PUWCdfq9a137s/OrXpbMXNMAbh?=
 =?us-ascii?Q?vkuBW9OrY0pYqoVZokLMOrqnV7qGCO2OZKKnl3duvU+7sErYwV4DzMHK8GSz?=
 =?us-ascii?Q?3JAMahhaUG5jkaeODPn4RL69I2Wzs6wx+DMAiDm/Ghd562cVo9Kub488Xm11?=
 =?us-ascii?Q?tZa+zFn7ycKr/MV5QSIJSZnZwxMgsTBSSFDNFEsT/1jvBwrt1uaNVIbD1vmn?=
 =?us-ascii?Q?1COgV0gkNVBs3YY5aRk9h1S3QmitBx07vpQAgJg4wvZbvjgEMRilAYWj+qkl?=
 =?us-ascii?Q?vKjmmBEPBIAhD9TiXjeVj6dW0uMC1QpmRg2VTMJ9Jf/XPFz0WrxcoXEBHshY?=
 =?us-ascii?Q?vkqAvMq7SN7WBaGbChxCPRJo4DtFBBR7T+Z0CDtAk+IooJbUNeChVZfYxsEi?=
 =?us-ascii?Q?jCFD0mu3sK4tExMk9O77+S7cUlppSL9WmiHFMWmAWkw+7uFU?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd87716-6333-48af-df04-08df2c033cba
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB10477.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 04:00:52.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSs0BrrFzTd9D3hor9qwfxt/8zT9ghJ1HvVqSPUrShl4i3ORbqlrMmhEKsbt65sH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFAEA8AB8B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_210122_903046_5D5F2022 
X-CRM114-Status: UNSURE (   9.03  )
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

This series adds initial support for the Khadas VIM 5, a board based
on the Amlogic A311Y3 SoC.

The first patch documents the board compatible. The second adds the
board device tree with UART B enabled, an 8 GiB memory description,
and the ARM Trusted Firmware reserved memory region.

The board has been boot-tested up to initramfs using the serial
console.


Nick Xie (2):
  dt-bindings: arm: amlogic: Add Khadas VIM 5
  arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.34.1



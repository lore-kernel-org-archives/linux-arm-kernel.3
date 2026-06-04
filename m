Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AFECD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=; b=JXBiYnWLQ+6hhVtXaXL8f8UvO/
	+Rk7aWW/ERuTn+RqoYArFwUKrG8iKZ4A+njixOd8tNnbWmt12Wf+bnG3zupFAczLEWUB9Zo1mrRV9
	U2jItrN/fWyTEPkq+/ceL5F3KbXxcDypokmRWF1eYQNcAIvchIYU72a/R96FlBqE7rQTcuSBMQpv/
	4rV2v1L4KmwAnkdBHBG8QQtmWrtmg29gYK+9HzRiW+Jm5iDuWKfoZ/3uU3dQDC45WGW6f2E/q5RbQ
	PU5cca5MQ2iIgBSwIdxnNt3Xb0MERqlclZk5mFjkA8Hdq9ReKrD8rfMITZKHaqAGM6mIdNhf+j+yR
	F+hRU/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBCN-0000000H5u3-1S2l;
	Thu, 04 Jun 2026 16:45:39 +0000
Received: from mail-francecentralazon11013052.outbound.protection.outlook.com ([40.107.162.52] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBCK-0000000H5t9-3VOW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHGHIidnhyqYO+v8tVMiKUn2NG2COFE2M8rDSgVXXVyIZlBf8ZfEAFMkPq2Z6Rt2IxMRWi+AQMy9TMyLBpP28beD1QbsqNFOvAcUiXB62Fem1Kr7Atk9KV/E6YVUGwT3l/RsacJcnCdMiNOYuifYrWJTfsxQK3hOqk8gTVPAZYIjJcxHl7CvV2W9/Lmw+sWzzmNQM4vhts+Xm6lGmDGa3rsy6xGkm0JNfFiBHaURUa05hBIhRV4h1EQRWYlptimYzEbk7H3XHeD7M78jUCUQLb83dyNkGXvfgASCa405K/g2V+HRvWpT1udnfCnGSQJjyRetss3aoTOhsLHoB0B9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=;
 b=lNbAso32nDyekqze2E80pkLeay7dECSd+EtaMZz6jwwgpECtlZc7QNBbSmhzdq1RcykYnQPJlpvzsOLRLR/f8GasNR4zOFkPVf8xxNzlf+wYj14KY1pBPRQZOxuVPXIySzRzFgTT8rOKRuo/Xj5+dp4BrcjJBGxdGsX9I9uIcGZbPYBkDnm/AmmNgzz3HKrYCXK4N5onWulQi8d2Xi8ZGZ83xN2V93LWWBOeO3q8ZZsQh+bJCeKBHMKVxKcvK92PU8+MCkxaBatG4xVfEcLchen6OvHl/mNAD4bgHj5QUgrtlB94y3cyLXb4ByfgZWWnNcE/R8JtBqJDArkqr2tZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=;
 b=V2T+pvxd5ySWpgHeRpiHT1HNt0eaOoBxr0duaLgYfg1wqogei4INWd+uyrrrmRaftb+JyFtTnEsPDFrLkdFiUAlg2ykLp6lFQKoAE0gc4x+Nk6RX0rwsh/iNz0U8oFEbsC9eBYTOxjQSJwYbwHkdUuB+ZiNUUard2qdQ441zLF1sPZghGIfkJ+5T4K/VIzrbShVzOVKLhjgo9c2dqJv0Oc7OULD9k5mrfosfly2NU/bH+oh1/fDKeo2kQnx0wCJNEgQchxXuz+koihZNMnD1pHfOFtnMyhAwFAw/yx/2+Y4TIoq+6AJ5JFm9+UIs2rgLC6mPf0UUhKLDAuIV73pz8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10347.eurprd04.prod.outlook.com (2603:10a6:102:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 16:45:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 16:45:32 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX SoC driver updates for v7.2
Date: Thu,  4 Jun 2026 12:45:24 -0400
Message-ID: <20260604164526.1612520-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0055.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10347:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f88455-9ccb-4382-40c8-08dec258b138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: jhvEOSmZJVDs/ZSccIje9eDvuuwATtQGFB48HX6W9r3NwoHMYve0fhHKgwojBWj7MwSyS1kzJUHmreUebCeOM6gfolf4lWFnyPGM72Th0K8OHaQhOCMqIQ4c9laYhfioejOuA0/4OqR4bT6jAa7ZaIJ9zO2UAHeiuMfUKtlIiw9blWTHxC9JeD5EPadbmPM/LNUeB/k0CtIWxB3CTNujV96aTOwwpX7t7NFz0uXJNA/02zS98nkfSIWopEXVGCwvq7TiRIg0WKqr2EasK+HgPZ4+3suvtz6+7mbwOAP6uD/WWyWJbHRbuR6bFu+G0MfaSdeiwinWLLdifICFHvea0sHd3KQurZAbeeL6j4nuhTUGzdzRrIKBWTYVB5e66H64JB6FjhVJzr79hqyvc/Ln0nxAeI2bNh/eaDz9kfMLF2V+ONbMUzJWBRm78OIMrD1BsVmAAf3e2en1e9DKW4uGMlgn0nVAyh/pOzp/mpri+ZKwPR6W9Gx8UISJ4Jm30VNOC7COxTtJCl6/JGQeZ3XB8pf7+hI3twmyNE9yCuXo5gGZMsO7HPaa1lGjlVrN23E4DVxRvt3wIbv3So30PMQ8Bf2y4yL6FcRTZhhnMYHZZKfDNKWMbTocSSweUsgH/uhIeo+bLDr4FQ+xU8RUimWW5Mocv2egsohTQQifmK8rmd1S5VWXoDPCh7IYEzNaLani
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xa6QyddlRnYmGpi/GusMjxPGHcxXya2Ow3btEmlPsTBWUPMSgJUkUgIN6IsF?=
 =?us-ascii?Q?V/mm/JpRwIyO9SbtuDMNMZTVVCPjUCfexru/twMwOJHJadwCLqU6cbIs6KJy?=
 =?us-ascii?Q?+1OQxuukYT+5Ncgyeq93avkTXBGdqQOCOf+aHww55Pp0GC/D/n4TW1FHyZzN?=
 =?us-ascii?Q?XUTUt89ibwj8FHD8Ngg4fwa2pjzlZ9HoXgBMpDapW8VMKhT3CMiN78uxOaCy?=
 =?us-ascii?Q?Tx8M4oJ69YWuAkV9sBSn4ULtj8954fkjY11s7VFjp6EFIYjPepNOfbs5vFTG?=
 =?us-ascii?Q?vYdF/oKqZRxTjxIeJRa5/ekQzs1fq4nDvj/HH6JGXSj6ssB3Jt8gVl644D/d?=
 =?us-ascii?Q?sGmxLD2xTVhBW8Shy7oeEc7Rbl5EmToi46OA3wW/zapNGKOJcEbyNT1PEl9s?=
 =?us-ascii?Q?n1Fl7gjTHflUh99DX8GKxS+tt3CATYUntbUffPKXLiy0zYgbX4n5XltMCJXg?=
 =?us-ascii?Q?AkTNbfURRTT2qkrk7zfM8Nj2jFzN2cbYqxpZWiAGzJUAg4he18FyssSQsBfl?=
 =?us-ascii?Q?BphnGzQA16IS0AhXfo+Fij55gs+Rl/H5I1SGBJJGgsmtodCyBb3qg9pBesuL?=
 =?us-ascii?Q?i5Qlz72CtfjgfaDujLyllLUdZUWCHA/0yvxwGSxu/pq9LDZGrwwXTGNUOzCC?=
 =?us-ascii?Q?7ivY27rGSwWJPSC6xYW9YLyGbtNc+PRvCKRSPbxEW8c+048mXBQfDIAkKNLt?=
 =?us-ascii?Q?YW2mK1Oy/FJgGVS2DNKfZhI+WScKv5wG23V7ILrw77qdenRTZJjxC7vr1ttr?=
 =?us-ascii?Q?IQR5DpKXYrvrHp5YetKAYSv7coo0hgbzDHUlh1zMmX/g4efgKgP39BXAYf9M?=
 =?us-ascii?Q?lacJuaMnG8RbbfYHd9dohxPp9Bb10okbtv+YaIuV1iKtVmcwe/eMUUdZzeKv?=
 =?us-ascii?Q?j+Y8/bZ51w+J/7TFi3DEM2FuexNCYx7mfUXUK+Sz/mrplVJL1OZsq6T2wrsp?=
 =?us-ascii?Q?RC2AbLiolyz+2zxOlcwVwxXW2dnnH6l/qW3YSK+vWNu0YroTRQbyRSHr9pab?=
 =?us-ascii?Q?s4eI4f4Uy9zq0wuGWFnDROAoeX/rxMEGO0l2TteM2TKKKAIU7nmpR/MKLVvg?=
 =?us-ascii?Q?KeM3qJheGgalFszsTSH2S0TPRzWhZBzgCMyIPqVHqYzWqUldLUEuePD9HsKe?=
 =?us-ascii?Q?DoXzxUnHZWnduxQEDhmNVSR0XA+HVHuzBBIqnLOv83xRvANYYYZIuBMUcJWv?=
 =?us-ascii?Q?FKS6vvtr3GVo3lzkxvVBzzqquKFtELY4oLjpYx3yRDZqrShJP4HNjnltKOy3?=
 =?us-ascii?Q?mQW/119U1edfmiYClSHejJzTTxG9FY4npAcxRYJD3KGZmEDKVHlrlK/TvlS9?=
 =?us-ascii?Q?wsW5YqdP0Jf/0ymysHVBM9So4JzGZSEs2QEBbRoDsA86w6gtUY61CVxfPuho?=
 =?us-ascii?Q?TM25tfsozd7ak/vSP3YTdrvOc4s31VXAgx7gBFHIGncubpEXtklFxXB+VPVP?=
 =?us-ascii?Q?9DnEeKzBn7nv61bY8YN0Z8zHm+kIir93BANvMkasqsNiWgyyq81Y30thcWrZ?=
 =?us-ascii?Q?0/3UPbSo2YN7hc449cWkmFpeQnKtTr29Wx3lKxE4hX2wu17Qi9e7kmYLzTbh?=
 =?us-ascii?Q?pHDOLeCf3ApDLmbkUGzO4j3ZYU6IzZm8kLH6WGD7o7usJs+cpjMiAssQT9GC?=
 =?us-ascii?Q?+mK72UidtqgiSwOB/j2uUk5QkUwUd7UpzAItTt07tD9kjsMAW2ciMaUfqBhv?=
 =?us-ascii?Q?5w7ZsC0gQOGXPiX/i0WRoLEyS+h1krXb+JaoibrYcXeY2QVKvhrYJZy3TL8G?=
 =?us-ascii?Q?wgKDF240Uqayy1DVAWoa64AZNTiLQzs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f88455-9ccb-4382-40c8-08dec258b138
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 16:45:32.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bd4va49TF2CbcCR4nxI4bEc0kvPFcBXGz0ohIEWzhn3TsLIjfu+btCV5sYYLjOpuRBSZtTfd+ld1xfhncd5M5Pkeez07EL5kqZLfTb+mVjRhxcwvdJ86dUZDlYJKHT1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_094536_882084_FE4A3DEB 
X-CRM114-Status: UNSURE (   7.59  )
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

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-updates-for-v7.2

for you to fetch changes up to ccb4b54b8ecf1ebafef96d538cd6c5c8455bb390:

  ARM: imx31: Fix IIM mapping leak in revision check (2026-06-01 15:58:13 -0400)

----------------------------------------------------------------
i.MX Soc Changes for v7.2

- Fix IIM mapping leak in imx31 revision check
- Fix CCM node reference leak in imx3
- Make scmi_imx_misc_ctrl_nb variable static in firmware driver

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static

Yuho Choi (2):
      ARM: imx3: Fix CCM node reference leak
      ARM: imx31: Fix IIM mapping leak in revision check

 arch/arm/mach-imx/cpu-imx31.c  | 9 +++++++--
 arch/arm/mach-imx/mm-imx3.c    | 2 ++
 drivers/firmware/imx/sm-misc.c | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)


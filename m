Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32617EA71B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzrshZpcc0P1lFWmJ/mtipwGV0BcZvoG4mKfx0eRzZU=; b=su4nPLKjhJqO4BjPlayRLUUXhq
	uH5+3SLuehqkBZRybTSLCHUXgM+e1i0XwbGWpbKlxKxoNIQ7wmQaEC7PBixJxX55FicYNeqsk9/FG
	U90y8qp3d9zTw4wGamCxpqNvdKf5YBangomgHd3nmZOM49QfAbavqD5mhoB9NfMHc3BaR6J8X54QZ
	pM4T/C1HrlR4VeyCGreKIBs0vZwM/JKz05YKdeifR7qwusr1WgMrKfzdfIXWqPXhVBVzdEkxXc5Hv
	UQ2tpJrgc4rM7/lEoy+YsDuzDhdY1y4HXaDG5q66a0NF4PgJG9XX2SemKJTbl1y1dhqFQMNNUJ1U6
	00Z2I1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdtX-00000006IV1-1Y5f;
	Mon, 20 Apr 2026 01:57:51 +0000
Received: from mail-francecentralazon11013065.outbound.protection.outlook.com ([40.107.162.65] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdtU-00000006IU5-0403
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 01:57:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iphzT7uATkkeKmftNR5UzOCVRwxY1dLyrfB/P5H4p6pRgvw2ap5Cb3NY8F74K8zq1NsvYE1M0TOmC7XxO97enLiV77Z94yfCe87RkRXgl8fxjeD5MYsrOwqiPQsdKSge6pUpYG2BB3y9VVQLJuliqSnVWc9Xz2+Sf5uZdSSFBcSVOrZRdT7zKjY2+L6Y+KJD7G7ISriy2iZJM+i4HmhjUYL0k80TvqJrnoIj3mOBMDpk1utqy+Nw4g5Zk/vlzQGbbCVcb3M6C3M4lt/ALOK1B/S/DLP2jkqHSiEGm7GUtso7hSh07UGW8aaIKBCh2MX4hUr9JQyQIGV9vGQFDQEkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzrshZpcc0P1lFWmJ/mtipwGV0BcZvoG4mKfx0eRzZU=;
 b=UNbfU2Vz2/MsUHOwbl4twvpLSk2Q/nHB2bLAPqP4ju/g0iY/RtQHrY2xufKqp6hEylyJbyk+WU+IZzL+uCt9/nxD1ajz347qMu6QlG7r/MEfdmewQtPJhmW2QA7UubwCb8TMyGiJlNS1b00JQJWAYeqh5jfLellqj6ODrD0KwAgpzm2bB5/5HJ3/rkaLCzyClHCnIY/iUEouahi/UOHrmP7YOFGhvtdEbu6iCP/5PdZLgQMOi3iuVW/5Hh3OX55UKWmyReTxTmqo+bAfWTGxV6+Gg7IXhoh27UoDRGiR1kpsgqBur27w9bAkjBf/aM5DMWiL3Oxq7NNMNJfs9m0fSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzrshZpcc0P1lFWmJ/mtipwGV0BcZvoG4mKfx0eRzZU=;
 b=gEoLHAtmZh81/dyV/E5TwnhMTpoIl115VQo0hLJC5dxTi9gb0V9jk/vKivE8umjc+WQGc8UHdMLUF5Ay4mtcmeQrdDpFDTn701wFFdzi3RXB2mZp+DKEXaqCpFDZhGveWoA38u2ztFJdH0H8iVuiYoKpg5aTwfUTMHCUgG76Vpm2s/nzdlhFwZ3OJa3JpoFemXfFBPBnp38EdXNf25lJe7IkVOjwFPG8VGDlC1JklmWkCjxj3+QgelCBnAXrhlzAOB1b/zz3dWiwvnFh5SBrVyPRhHKSDAppsuGML9klgGOHe+Tmm3hOHDrx97F+clTNnsR+AiXGl8GMaiqisaIv/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 01:57:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 01:57:43 +0000
Date: Sun, 19 Apr 2026 21:57:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_keypad - Fix spelling mistake "Colums" ->
 "Columns"
Message-ID: <aeWID1uAlW_jfJ_2@lizhi-Precision-Tower-5810>
References: <20260418-imx-typo-v1-1-2a15e54ad4e7@ethancedwards.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-imx-typo-v1-1-2a15e54ad4e7@ethancedwards.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: b05ecffa-8fe9-459b-aea1-08de9e80360f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uYUZ8sFZT8OoEVYhD4Kfw9uT//cwc3cnIhriqEWNfhUyLjZWygfuMz+8940ktHL7i6q1qCd53qYPxdSPHNJpQ8VD60IMMwxSwlp7/iQMWHe/Z8z664D8soM5PTLtTLegT7U7TcvBUJb4M0UKjn1flbgyEunxqejCu99J/mMYhMg0XxqBbGIafTafKVbm6h8I4TgRb01A9puVn/SlcroIIZYJO9CvUnxDoQCV50AoDlnKI23c0uSDyvcIvDLwO7KZBS6yBjCKaP2jCRKyBuN2h45RDKjbktUmiPUWzLumIlpO4bHGrU4ojEx+P+HhYmDF98h1pHaMuiT+Jk/5kr9tJJPy0UTduAfIXT1GsaLKAZ3VGZpkfr30jOliLlmwzeAozISJ4S1bZ322/gx2rw80WmN352P5Eu/qF8VQab0HvgsELqMW/D9ipp9OytzRWuDrDnNPU0WqPwX0pEm4vIFx9jjqxM3rn8bmoxMfvDG2jQqOrbj5+RnFsexbTCbotH1Vgb82hXE1tPzrLQ7HF7BAzvhUl1HvdY+YZfh9ixijRAGc9d3TWS3NfqWdepBDFqYZsDo9w7aZfOFlUkpdwP+VxZAWPGAyLpxypNWlWeIkt209N62LhMcllWFEeBdTMPDegwVcJMK7fGMZhiDul1z675sOCs96lLitp5NywYQ9+R8DJC0uFrh8raRQ8nyAVW4aG1WWjTDxm6QxXBSxrinCZCtZtOYdl0SsGlI2L3yMypAZv2OH7VDrGRIt5fKPBpyjpXIk2RJiRqlsIMUgU8vL6Khny4FX7gGZFd6h9brwQwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOVuaDEYo4HN7iT1rQK9MgO5m6BLTrIOFMI8OqfeFIaKEwK7Yk0BtEHowuHV?=
 =?us-ascii?Q?jiNDPNl1fmkYuqiTmj/HKaWWxARCpyc2lSK0605FJWA+rD3DoRqB6h1mVX3S?=
 =?us-ascii?Q?0i7uEKObaudm78GAsr+Da+v/11Ev/ywjNzW0S7UiphRIfrGAtIBMvPYd704C?=
 =?us-ascii?Q?+0/IwFJ7V6v18fQKES3jCElJUN2X5JFb8caXeTlbysjn2JBg0bSe9Aqy5OZt?=
 =?us-ascii?Q?DQv6RPHolynu5BcZouHo3rO7dcbsbfYhd1W9j7Vwi8NSuVhzmEPJJx93AhcE?=
 =?us-ascii?Q?qQAFrwC7MlbxfQ7FjFwnty5QfLRP43VzeQDUokpYiv8lma5YujIWevF+j8YV?=
 =?us-ascii?Q?O4C3dLybrLtwzn38mKaTG8cb/m+gglOdWg0WXXJIEdGJXOhn5+lLFRGB9yHV?=
 =?us-ascii?Q?/W/w/FDc3csXW63+nfsBrNNwTRqrgTC0iTdpSRhJ40HSR9uS+U03I6vi+0AD?=
 =?us-ascii?Q?JOIW+Wj2KHdH/dzTEJyOrEgWqKXxsApOWZouO+8bceKJkXRypaIEA6xj1Ckf?=
 =?us-ascii?Q?A1sjYJWWDLxCk9X2+ZparlKJoyVsl+pLhhsXxDX93M1U3qYdkz7pPzh+ED18?=
 =?us-ascii?Q?sz5KVZ9wKX4cisSo7fTeh9bXg/yXn6LVMN1LnFSwE5jCRbN45Ehd8vwZ7E2t?=
 =?us-ascii?Q?vvAhoL3xCF1c4wEk//5AJSfRLsjW+DQY/s4zQRm7lmhzYnKi26qN8IOv856k?=
 =?us-ascii?Q?Vrl+/fCPGk78hLlHl8WQ7me/5QU/LbbbPdYSCV7lvPPszCzQ116I4ZOmSsae?=
 =?us-ascii?Q?fUxC3f6s2JHeP0rnCXC9qlvcmLQeTufaRbuCaqmsT7NjxYRj15Lmid4jvtT0?=
 =?us-ascii?Q?7VRnG9ndDzA3rqQtfDHq3v3V68fTsinLVtwXj0N22UFiMshBpsm4IAmb0w4e?=
 =?us-ascii?Q?LKQgVozE6LrAoq3RKSM9tQa0GNnkgedKuPUfHkspmmw/vDD9797zAFsp7ryj?=
 =?us-ascii?Q?Xpa58dk16Cs+2XVS6FVKelJOHVtETd8M57j46IK2cm85ZCGHzpW9pIli/Umw?=
 =?us-ascii?Q?iGH2l5VD56J6GOqp4252wuYgNgrWE4lUBzD9mrDl6iX8Gzib2C5rPw9CgQqw?=
 =?us-ascii?Q?3C4mRRd5f/UvxUjdu1JG/7RgcOlKYWRgI1E97cD9JptyGK/HnvdX4VrEgeTw?=
 =?us-ascii?Q?99+5PXr0Zi0j8a29QeZHKWl0yD76erN2NRQgXkhs+pf0011HuNwqKf5hBadx?=
 =?us-ascii?Q?QMK5VE15xUkSSi1tndPRWKDBfzAiSsJMolu2NvxgQ+5knwEmE2wAoLH9ta2q?=
 =?us-ascii?Q?6Ob0ZxhtXAk7+vDuJoGxIOK2ggu/Ub2oflr1tXK7nAc3/4eS9SheccUQ+ENf?=
 =?us-ascii?Q?II2HOGDGJtmkIAKiQPTfwNZ14MiYp8oEhinEA5WBLM6rV7cNliLWIas+tN0u?=
 =?us-ascii?Q?UzwG/goAFU2uwGtog5v77kGJl/l/g8AI9qjvtTfONsbj8HwJjyKRh4VjzNII?=
 =?us-ascii?Q?DBlBVtqfZx+R+MAF3QZCxfxKXW2PMH2JuAnOsgeBvw6Fh8uzKB89kytMgfEM?=
 =?us-ascii?Q?ZVig+2bKTGEFXRSg2K4W4bXrLRlDtpfolDvLr7ZJ+YMWf8yvqSof6w9d4hdz?=
 =?us-ascii?Q?Njw4Fy8FQgrrW6foiqib9l/5r4EM9E6cjagXqbyKYTlyfMrpG82sWMyUWhLJ?=
 =?us-ascii?Q?k8504tT6KYMY2IaKjOhwTW3B730Ni7GByZKoEzA5zrCxD9cluJWyNO4O8o1r?=
 =?us-ascii?Q?x6hNlLrp3QKwwcsoZrEiJA2695Q0DoUFmKFTRBinrBwdprYI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05ecffa-8fe9-459b-aea1-08de9e80360f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 01:57:43.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pj8wszFE+cp1fcPM9iWJ8iDbd+Wl/5ApsGeoNDpV7wN+XyjI8fQXmTcJiwvZlL8U9cgNpIF+JQGYpOYbDG8YzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_185748_832537_D45B3ACE 
X-CRM114-Status: GOOD (  16.83  )
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

On Sat, Apr 18, 2026 at 08:58:32PM -0400, Ethan Carter Edwards wrote:
> There is a spelling mistake in a two comments. Fix them.
>
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/input/keyboard/imx_keypad.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
> index 069c1d6376e1..ccde60cd6bb3 100644
> --- a/drivers/input/keyboard/imx_keypad.c
> +++ b/drivers/input/keyboard/imx_keypad.c
> @@ -324,7 +324,7 @@ static void imx_keypad_config(struct imx_keypad *keypad)
>  	reg_val |= (keypad->cols_en_mask & 0xff) << 8;	/* cols */
>  	writew(reg_val, keypad->mmio_base + KPCR);
>
> -	/* Write 0's to KPDR[15:8] (Colums) */
> +	/* Write 0's to KPDR[15:8] (Columns) */
>  	reg_val = readw(keypad->mmio_base + KPDR);
>  	reg_val &= 0x00ff;
>  	writew(reg_val, keypad->mmio_base + KPDR);
> @@ -357,7 +357,7 @@ static void imx_keypad_inhibit(struct imx_keypad *keypad)
>  	reg_val |= KBD_STAT_KPKR | KBD_STAT_KPKD;
>  	writew(reg_val, keypad->mmio_base + KPSR);
>
> -	/* Colums as open drain and disable all rows */
> +	/* Columns as open drain and disable all rows */
>  	reg_val = (keypad->cols_en_mask & 0xff) << 8;
>  	writew(reg_val, keypad->mmio_base + KPCR);
>  }
>
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260418-imx-typo-14370bd2ce47
>
> Best regards,
> --
> Ethan Carter Edwards <ethan@ethancedwards.com>
>


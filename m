Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF050E6BF31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8joyB14IRWdL80olGaN0n6bIw2VYXeqMe2qex+UGBKE=; b=mB9O6IotQ+9IECMu1tYc/qFw1V
	z5DG9WhcLvpMyTWMEbeZntE29HrxqTdmKm1OsbzHy+hYsueXMBQxQsjSxrV2HnZed+7zXKoRPIHgN
	4hVwF3wza2BO55mpSnJpthRMo3ugwl3RmyqBAQrfmvU3Gb95uznzw0qosobNAUrPP7TEflq4kFLg3
	gfd8eshdCxV3eNGopQKit/q8xGjEOcL1La5Vtdv3KKtfZA1P/8TFzUXuZC11tl8aRdBwSw/ZKDF3h
	QN/lHGx+JcxJYJWaNgp0of2uf3bmgAqp+E/xahCLm8ubBKq5NVUEEx66cAYrkD06mXW4b4lJelkng
	RZp5n/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsUz-00000001mws-1sR9;
	Fri, 30 Jan 2026 17:41:37 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsUw-00000001mvx-3K4K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 17:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqG142GF/A/8amkuN1cdMm2bbF0X+m7HKAcNBdNS/ON7+QD16P3vk9L4qBD6fux8wGHVzem1mq0VpjoHBsJKO9ateVabFI/jQ7mwZwfNxEH9Pjbbm19IZUH3YtN0ArMlfG6bc0jsd7KMDM8q1zmKDp/JNV6vbXC1ypoWV5WIzU7V4/GKjtBtrbgEs6nv+pL2brzZ79SMUwjSvRNqNXLWUFVRYzupq8CsJ+c34KVFeh/DL1Min7eQFt8fTbG7j7KbE3u+I8CQ5UMQQCRmkLDhH4ZWjRK+EQSqfwfZmab+tugi7gCqWn7sX6pY9gnvRytfetYI/P90zEfc04KOkW/7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8joyB14IRWdL80olGaN0n6bIw2VYXeqMe2qex+UGBKE=;
 b=sp9KPJIvh5mBVJwFjqNHamf1kIS66uBF1aMZcJvtwTl6Biwr9WAKqAUTGGmi1ZMtzEQR5L1t6KEb0fysDiHBEEJEgj2wNVZr/LwajYEOfUAnp8HHtc2nuYhxsRaCeBLyabVLJWmQ9/TMoz3F2UQ0xXmVB4/KchnwjgXc0EQh13+x9YT53YczgRA+oXjCIoOE9LeBeWl5NfzXK0mcyRBMxLhB4k3KjmbWHzJ8AqL+c8fk7ANVecq+63M53TspqejwYJXP8O1aNGD9DjLzo6wQnc8RoxgDTn0rr79SZbWPiqZTVV1LdhX1VmnEFTTMUNtMuFUS/s00kUwThN9cLkLKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8joyB14IRWdL80olGaN0n6bIw2VYXeqMe2qex+UGBKE=;
 b=mXj6wglmEVsBiO7mDkQEjYlp7pzZ9PYOQDWteEHs9M9gWWOfXw+SZHZeID2HG+cy59Za0jKY/nq/Wk7jcJqlqo4PSqFdRkBgcA99sVGvcPQQdnKPth3+NbC4j56GrxTAznuhQeuArIxlomMZn0EOgq7Fj2SfJ7GgbMek9BWMo/goZ3ezXvqeYE7kzQPokHCpyLV9q5xOqsaAxCgQj5JTBq2xVyrl1Oei8TaC+RfCVNVJxUWHypmwTnAckUptsWMUqHORWRxsIUlcF079NL4RaK8tZT/GkWyjHMT8CSancpOMKZG0eIH5v3mkLiW4QuSIogQESuXUFQkVMMYvxVhpFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11537.eurprd04.prod.outlook.com (2603:10a6:800:2cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:41:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:41:29 +0000
Date: Fri, 30 Jan 2026 12:41:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: imx-tpm: keep channel state instead of counting
Message-ID: <aXztQkefafsgFJvN@lizhi-Precision-Tower-5810>
References: <20260130143720.778514-1-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130143720.778514-1-viorel.suman@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:510:325::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11537:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bf6003-dee4-49c6-3f07-08de6026ccd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WTZMtRzDPQ9ri3pO87Lgjoxo2XK/Apusx0Vai5utPNoaocXARj/f6cMBCWbB?=
 =?us-ascii?Q?Pjv6zIRmnyqRjeG7naX1Enp3gCxfbPVtKIsqgDq6Wc+VGLf1V4u2cMKsZylG?=
 =?us-ascii?Q?oYZk7nB15CmQipGGbdeCCCmD+wZvBwn8XYNmgRSOZE1AgIQRUSbJ6Dw5GsBd?=
 =?us-ascii?Q?ik1v7r3DxeFLz5ojhooyVXljwhKNvOeclVpb2zCjksYbgKhG9sPOpvLz/Yb7?=
 =?us-ascii?Q?jfnKyAeqZsu5hnTOGxxrB1RLdZ/he0xojLJDMbkBHybejrlzA3ZiYocyB3JQ?=
 =?us-ascii?Q?b4CbC203fTMs0XEU7J7yrfvfHEcdvIk9fpBfe1B8rj2LKBlqUGaDCB5Q6Ni+?=
 =?us-ascii?Q?aALwLdsF+CYch68hCG3wI9l6yBik447hBUc6hpZLfNCjxwJgD9DBkh/GB0Ol?=
 =?us-ascii?Q?HVWA6nYabuds0YlBTEE1Soq26MbWL5BagGk43JKu1dsLmTo5t54UiutS0TRo?=
 =?us-ascii?Q?Ozp1U9fwUluCGqzzlRbi5qGLi738lcCsAqu7g+wO8pjpGI1miwSTTIKinBDh?=
 =?us-ascii?Q?BazlEibwtmCfQKXWXstOKZP68NPksCcFNWexKOdEoIiiZV1m/O4aOji7bQU6?=
 =?us-ascii?Q?Rd/H9h8T8xtpasRCwj/0P37otthu8iEwc07AD1IPERVcBmqlVy0jbcKClNtH?=
 =?us-ascii?Q?a0M8/jdaTpzw7URT7Cf7K1l2ZM9l3YYGL6WUwWhe8lM8LYYYG1Iucg9vJC+N?=
 =?us-ascii?Q?tl/bbcQeQrWd/8Vqvvy1jRtwycjyimyD/hg1B1gtVdK35USxyRnJ6ustpVw2?=
 =?us-ascii?Q?S/V4NUNOpUzC3GyRUxJth2yJt9l6c81KaJ6qtkBFPoeV2HTMYt/EsmbXBW0m?=
 =?us-ascii?Q?BnkQjRcWWC5a+2iB6M7UpauQk7jvQ/sqa7js00fMsEPelXvmqZs4qwBskRrO?=
 =?us-ascii?Q?RWEEjKy7cXDqFxK+962GOQwAg6sEA5IcPqtyi7uLV5DTjgt2o31Gd9gG2dap?=
 =?us-ascii?Q?iOkkd0MkUp3DGtjvA6FPu2FzQ6KkRb3r0/zZmSk4uUfzDNioj8Ctlm1QhmpW?=
 =?us-ascii?Q?6SxH2TYPwsVTRAxH1g+LfN8eb+yL2y2CsAxqXHHfKwz1oC9p93xDlDcwxfAc?=
 =?us-ascii?Q?UvEzwBRNo6MsdqBFltEOnhc3w/0Ka1yJj+nY2Kj4Be4hw8lQZxuAosVOGNLc?=
 =?us-ascii?Q?HsBNLnMf6iGtTuppEL0DjgwkLwyudeJj85UOD0Iw/GJ3O3zpxRxdlgz3DRFC?=
 =?us-ascii?Q?zF51dssoUDtzx6Hrp6FtI+oe9FtqL4T32MKu+ygci9adNJIRX0OnHyWzlxET?=
 =?us-ascii?Q?32jc6FtE+MjVHgWW3b5kC6savqhgTi0ImBr5EFas1dmNTx42w5h0Ca00y528?=
 =?us-ascii?Q?YjsEoFo+VsdzVBJlhAqkxtZkKFXv8cY/oL+9El75IbLCWmSshFqv4OMGKPFf?=
 =?us-ascii?Q?q5DOCbkTO7MYYcua3xqafwqS0Zzzx2O7gCJHxxz+nxWWGw68IQT+8HuIJeMF?=
 =?us-ascii?Q?LHl52P30Y6LI9DLrxn6gn2j+B4R17lonVQrJYvJumipvxTBqLPfL68JbW5cP?=
 =?us-ascii?Q?HTpbMvYu2d29tnKiCplmZIAOCLHtJSpOiQ4Yrc8fKc7PKk9lvVm7j53iIcDB?=
 =?us-ascii?Q?0uuKc1GGY5f+/UEvcojWhwu16/uhbmh4lphvMHVEccTtntV815150lmRf1Hm?=
 =?us-ascii?Q?+Mdz4YuDbSnxEhLtBBpzL1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ECUhT7LARe5MKtcM624iTKmohmfxsrH5aPzcdY5wmGCNUbybbEBg8HIvOqT?=
 =?us-ascii?Q?sD3vVtq52ox7my1ABs7NJMD6Yz1wosDNuzzJORNGRfDmwK5smCUbcHKwQ2uv?=
 =?us-ascii?Q?9JCr/w2NwwIIrbqJovbGkd9R5PgFf2tNgbvYCGpRXk3zLcqRGSyoDNAdKxmZ?=
 =?us-ascii?Q?7QUf6/wqvWfUhYSPcVGO6zy0KmPYYY+pMVB4h60MfctWcRNFOzcPyH3mYVAp?=
 =?us-ascii?Q?rHwM5CguUM3yKluEb42Gvl5oLX0Vai0NDJ+cSinE3JA/ZyWkRnDH/mo0KGMe?=
 =?us-ascii?Q?XWhz2ukDm+c5mehIPBhTmbbdfqPMcZW5Qp7yf3LMa9YCKa3G6vmy06nrA//T?=
 =?us-ascii?Q?jBa2LcchY3yhVFlZyBbZPq8fIiU5pSffyxiYms8ZIOYXLtt8cPzIXeQQQFEt?=
 =?us-ascii?Q?THKE2lFjFWedAkGz48yiMK4H6mAdkbIpg8jCMNvG+1rwFbtiyMkDfyYZjW9e?=
 =?us-ascii?Q?Flbq6bcChVvGon3bdKF7VElBw3YOWaQ2thz4vflJLPdNyrxJkzz6DUHGgd4i?=
 =?us-ascii?Q?oiC1Pv/f720jQ5OIAHsY44fwtcG9hplSVAype68Kn544vkXfVImwzDdKFbMV?=
 =?us-ascii?Q?aPiB2v7/6s5MyU+lR4gtyXCE9t/sQ8LxN4zw6d0lXjoChBSnOnte2Ygl6CPX?=
 =?us-ascii?Q?dlAUUCvJwU8MI+heWoRs7sZor5qcwWmECyLZBX0HdGEQu+vC2FnJmRgLLU2F?=
 =?us-ascii?Q?yvGsKtfRyk5QF8Rji2KasQDYYHIERduk1tsz4QzwN9K9DNIFpH3x1IBxvMh9?=
 =?us-ascii?Q?jLmSGA0boqvwP7fW/l2azPJquo0aQLtDJyujLLL4Yv0CfEix2/IIHnF6vRtI?=
 =?us-ascii?Q?OZuEudUwxvuwletOx6WB6Le+JTWKLrigcPaYhDcX7Psqr64GkZD/HR+cDu95?=
 =?us-ascii?Q?yw7jhW2iCkT8WuBktq2ucTe0WxM3OrOobVWyGSp/jND44Me2QQH0+S3IDWlJ?=
 =?us-ascii?Q?gV/gdOoPIy8BwWvdDFxDaK5yu2kgoGkr44yD+Aon9cyHe83xny1qmg2PfzmR?=
 =?us-ascii?Q?jue/7ACZoO2+Dp0VBEApSuEKMhmh9/eggPKxehGiT+JppyKVZRP8HryG4d/w?=
 =?us-ascii?Q?ctGpJHUXBATxP8jRobIWLdSVRCjIS35HrXR0isEkQ7fpCnhkB0LLmzlJyyWC?=
 =?us-ascii?Q?pUt6L1x0ZTgtkA0jP/zKpE14wI40RiXeSPnSBF9aUFp0HfTnIgVGDuwwsvNG?=
 =?us-ascii?Q?Bo7RCrEE8oXtt5ZAQDdC2Sv4bsXzoNYlV00dyJ+YOOb9TS3PhrYxXLQZS46e?=
 =?us-ascii?Q?5WXpEh22XHL4rTZ8rjh9NPi0rDSaKNIJTCslPx4hxjEKJTDWNvMUKICzYWB6?=
 =?us-ascii?Q?cyHbm4Gx2Zev9KtDwX2gTEQ411Nv7B3isyjBk1Yb3pgPaavLWTwmRZCQTrTf?=
 =?us-ascii?Q?xobqJLRFCNN10WtS63X8cRrWvWWS5smcAI1D1Ke4CmV/e3LYDLh+mqACVbf2?=
 =?us-ascii?Q?tWu9YlbuHvbVjMWVcrZXlJ40IK/dLJBzRF603nfxmPxfgzuq+8KrngJhcA/a?=
 =?us-ascii?Q?cjkxvAElPsnrExWytcDcwbRpAFmuGE/5UtrU1N+EVtoBNiOyJcz0x2OpdFNm?=
 =?us-ascii?Q?RkvlBiiB0YQ2pfQMEeBBAqqkCxf5DZOuBOEBSgcp1cFb3UdWsY4aat42eyi3?=
 =?us-ascii?Q?ClnQ8mZg8j2+lc1IrNLQGhDXGuFRogma3ip0IBSEoMKMIpEs31TXQrLDnJsJ?=
 =?us-ascii?Q?9Wffa1D6RDQNmti391fNfjMp5hnmtilmhgKSwO5r5plqKgtv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bf6003-dee4-49c6-3f07-08de6026ccd6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:41:29.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWUab94RR/s/jMpLh3jKA5qBmR/04hlvSgJHXV31PzLrwVk7O8Ss7skOIBgAL9XJvs6a+aFRE4V5jhDTQZmjiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_094134_833382_7AA1C2D0 
X-CRM114-Status: GOOD (  24.63  )
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

On Fri, Jan 30, 2026 at 04:37:20PM +0200, Viorel Suman (OSS) wrote:
> On a soft reset TPM PWM IP may preserve its internal state from
> previous runtime, therefore on a subsequent OS boot and driver
> probe "enable_count" value and TPM PWM IP internal channels
> "enabled" states may get unaligned. In consequence on a suspend/resume
> cycle the call "if (--tpm->enable_count == 0)" may lead to
> "enable_count" overflow the system being blocked from entering
> suspend due to:
>
>    if (tpm->enable_count > 0)
>        return -EBUSY;
>
> Fix this problem by replacing counting logic with per-channel state handling.
>
> Signed-off-by: Viorel Suman (OSS) <viorel.suman@oss.nxp.com>
> ---
>  drivers/pwm/pwm-imx-tpm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 5b399de16d60..0f8643f4a70b 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -62,7 +62,7 @@ struct imx_tpm_pwm_chip {
>  	void __iomem *base;
>  	struct mutex lock;
>  	u32 user_count;
> -	u32 enable_count;
> +	u32 enabled_channels;
>  	u32 real_period;
>  };
>
> @@ -166,6 +166,10 @@ static int pwm_imx_tpm_get_state(struct pwm_chip *chip,
>
>  	/* get channel status */
>  	state->enabled = FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val) ? true : false;
> +	if (state->enabled)
> +		tpm->enabled_channels |= BIT(pwm->hwpwm);
> +	else
> +		tpm->enabled_channels &= ~BIT(pwm->hwpwm);

Do you have lock for RMW? or you should atomic_or() and atomic_and()

Frank

>
>  	return 0;
>  }
> @@ -282,15 +286,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>  	}
>  	writel(val, tpm->base + PWM_IMX_TPM_CnSC(pwm->hwpwm));
>
> -	/* control the counter status */
> +	/* control the channel state */
>  	if (state->enabled != c.enabled) {
>  		val = readl(tpm->base + PWM_IMX_TPM_SC);
>  		if (state->enabled) {
> -			if (++tpm->enable_count == 1)
> +			if (tpm->enabled_channels == 0) {
>  				val |= PWM_IMX_TPM_SC_CMOD_INC_EVERY_CLK;
> +			}
> +			tpm->enabled_channels |= BIT(pwm->hwpwm);
>  		} else {
> -			if (--tpm->enable_count == 0)
> +			tpm->enabled_channels &= ~BIT(pwm->hwpwm);
> +			if (tpm->enabled_channels == 0) {
>  				val &= ~PWM_IMX_TPM_SC_CMOD;
> +			}
>  		}
>  		writel(val, tpm->base + PWM_IMX_TPM_SC);
>  	}
> @@ -394,7 +402,7 @@ static int pwm_imx_tpm_suspend(struct device *dev)
>  	struct imx_tpm_pwm_chip *tpm = dev_get_drvdata(dev);
>  	int ret;
>
> -	if (tpm->enable_count > 0)
> +	if (tpm->enabled_channels > 0)
>  		return -EBUSY;
>
>  	/*
> --
> 2.34.1
>


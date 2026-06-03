Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61E5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYiGaFr68OgJHwMU2weoYosP1dcQtWbOBNfSKfg3nb8=; b=VEmz7Rd/pUaJoDmCf1AjWZMqZY
	0n5tQBXnLVx9zzQ3pFuAu8Mp9mdrNyCqh7zRKoRdftf2hSCI/ilpnwyRW6GGIiHPnUypvk945/Ku0
	GmTLIjUou/bp7dA2KJj/Zi4dspQAosgEoeKF7e8zl4OaVJoF9O2DLIBNGeR+10DwxDeYyJxQjJPbr
	jJ7M1h3LKH9lL3U+JhADnk5iQEeHrdOGJ6p46UjU0N1kka2p5oGBe2b3uMSXLAbgjRuBXMxBxtMBD
	Pe9scqoV37nPbdkuqKFaomkSblHHfeNFCFPtviRHugE/dYqx41FonlvLskVXcoM+Y7k+NcNyMqupJ
	lKSreqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFY-0000000EHvl-2s1J;
	Wed, 03 Jun 2026 05:34:44 +0000
Received: from mail-francecentralazon11013030.outbound.protection.outlook.com ([40.107.162.30] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeFV-0000000EHor-3S01;
	Wed, 03 Jun 2026 05:34:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k75l9nLdIXjm7skPXY7OdR9azO9PJCbT4xKAF/m4FyvADGD+nI9JvA8S8UDgNhtCOnUeKOEVlh9Z3H8cjcgFz2XElXK4iRcay1gPUOz0y7RWrm40WmhNTmLSuBnPG894MnrC7pZ2yZZCWnmYRAJIMFgNfgmi4784n6AwH6x3lKKnXZ2zaFeMQr6fXh6w9pg+Fku/TyQFV/2Al5tE5urgtoWRV8+5oXlVakc0IE+dGyoEnkPSAdqzJu8QZRGHU9t6vnsSCyKUtSLEg+jPzuFBv0Z2IMjSjTRyF7CaFMB8uGoQnvGANwI/M3me5sSW5q2jCZ3TwTX+lpC9LbHq5JgkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYiGaFr68OgJHwMU2weoYosP1dcQtWbOBNfSKfg3nb8=;
 b=HRVP6bQ1o2We4AYY0qldV2Dv38jJmVEHeysUf79bQJM0d3DA+prhJpBk9CivroAF6uNYO6AlRIAaPrzCK0eafAYpfAYvdiUrRgkHVu4W6z87SihE7R1CEh1SSCWGAUdRxd1TYmPRovG7wKZrDZpvRXUXAXAN0SiGkKMQpEY7ruODJEfo/JM4mwPLmXRHqrJGkbQQVyf+KOayvSO6Z01dVdUg4pQJbbPFX/F/b3w9Sr9sJFDbE1s8qnpnGyE66Ig7JuqL8EXxCOgNmIlNgeNc23In/5xBGevrNnG6NJCWtyrLeeUjCx8aiDSWmGZoSAQDbagbNfzmZawueW5e9Cr+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYiGaFr68OgJHwMU2weoYosP1dcQtWbOBNfSKfg3nb8=;
 b=Ui3i39fV7k1BhuxTL14TokWDxx+M/RodnwjaUUYG+wS301y1/2ESE7L9pp1rsNtJsQpFKcczKfElMHmUEgdgEnBAu/+jUqdDAbFvh+pq9Tlxo/Hp3sHr4i2S91WmO17v/YthYqydYIr2EyBo6QnrB6W+8G18VKKsvpmCOYaQc/ZzgTeIDq0bgHdXyjCPyVIItn1r1RDbiL2dwOgqfObG2LjiuWdUZVINrgh94fYdg4oahho1A7ULehsPObzRhQ0BhGQlXx33AEE2VbzD1nPt2bTqla+DrbmPnEwUV1R1/WaaLAtGM9eQxtDxSt7B3Wy9vwPLLy82bUtPcEkdp6LuVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:40 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:40 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:18 +0800
Subject: [PATCH v3 5/5] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-5-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=2555;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=1S8worVGXuViLFCGKuwX+ce7m/H5ooU9b32ioGpEiCk=;
 b=NuRmkmtlezaLa0fpKjuVNNFU/I5DtmcmA7rV1CYz1DgUL0UsNvXtrLOD1Mr0UlMe0BMSE6bVw
 0vlStUH+3avAmDa5C6gPPBDaXmfPW/aWc5ZERk5Vjv3ccDg3EKqHKgy
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d883366-35d0-4a9a-c7b0-08dec131ceae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zYMhEzSEG+7/WtKdEYXNVjmLoke+3tLFffQqqgOnOHfU2cTXtAzNOIek5fYVWfPglfyBenopdY7lN/tKpkIilCq6X++MrwZvw7PMQp29PDZGGBnAUuOkh7TB+HSIGQV6lTcqDxBCSLRks7PouTUW2Bo5C93C9sdAmSAVnnFFyWb7ZHFM6c8UhaLxGxjqkancujAnhJb2H0ewlQrNE8E4Ua6sm0XAzrf8ZekSCCsMWqqDF/p8XJBPNRcuvyaIcSvGdS9ct8EMW6UXeYWOE75wOHJsUrWDMwcKjQ97BXWFjo0hdVvk47tUpZ6qEHxlDmGmDcj/G6bqya9CBXhm8kEuO5NnugmVIHBhlDp/om+7SyO76ImDDncwPOO0LvdxL3/oj3eMA6NGtu19fWLLKXQNkFEjrCS4UqHOj3A6hJLzh3UjHgJi1ErJjY5Lqf29uwyqa+ssbauSna9vUYd4RUMyFMGmdO8q01L6bGXBqBY52Qg0riBhxjd27qEnZIh/SlQfUZBGjzI0TTjvAub/Q9W3FoCkslyeN8EEI/+9J6E5OftHa2Ij7kUKCNwO9GAZKruCTei3z91iCZ+5vj/uNy9iUirx7r3kGWdtFhzBEGzFS1Kf+uFIKJlAZ+8qez/b/h9+Cj11nZgMAYn2fleBw2OR78SyrDDcJLNAKpIuD5iCCeRKFwjRQ1mBncm5IvztyqFA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThzK2FtZUlaUzRwVFJUdzVOYlBkYnZtd1lrazRjTmFma0ViZVVOSkFTM2Fq?=
 =?utf-8?B?UnZrUVpsamNXUENUWmkwb21MaXBqc1FkYmQvRWV6Q21KYllSSmE0S2twa0FR?=
 =?utf-8?B?M1ZRSGtlbGs2dEZzSjJxcHdFb2RQVXAzcDZicko4VVc4bWZwWkZwMVU4QWRT?=
 =?utf-8?B?K2xWQWJTU0RTTlgyUVRzVG5mNTV0VU8rVER0bnVxaHZNanhieTRoRlRFK2Zx?=
 =?utf-8?B?U2RlQW9MSjI0VDJURVg5anFIaFQzaGVOd0srTlBCUEk1cFA4MUVGYXVXSlJM?=
 =?utf-8?B?TmV1ZWpLRHVwVFQwR29IdTVQcTBxaWlwS29IOTBwNkhMWU5VN05NKzVKblNw?=
 =?utf-8?B?bWJOQU1NTW4za0FXUDBqdFZVYVRDWGlsTHdnczFUa2xEbHBoUHdpOUc0K1RC?=
 =?utf-8?B?NU1BZDhwZHFUVDZ0eE10dUpLenB4cm1wVHpxRVpwWmF6ajRBMWRlQ3hTSysr?=
 =?utf-8?B?Y2hSam9YNFhoS2V6a0FFUXUraDRaamlXOU5EYTkxRThFRjFHMDRVNXBVWlNu?=
 =?utf-8?B?M2NNOEdhSmp6STl6bVBWNFcrclJvcjFIUzNMbnl0UkVmQjIwWnNGVHBwT3Rh?=
 =?utf-8?B?VmFzejBiczdGa0FXa3I4b0dnNzAzdzQzZ0gwMGsvaVZEUEhsVkhPbm1CU2hy?=
 =?utf-8?B?ZGhMcTFNeUQvanNpeC9UT1VERnQwczVJdSs3QWRyeC9wb04wb1FQWmFTNjZ3?=
 =?utf-8?B?eHhDU3Qrb3VYZXNvU3Z6V1dNODdTWThOUFhFQndyZWVUbXlSdXUxd0ZtdUk2?=
 =?utf-8?B?MTg5THdJL1M3MzZaVVM1WHNPZFV5ak0zczU2YVlKY3RReHY0MXVwMlN5SEha?=
 =?utf-8?B?Tml4SlVSSmJLejNIU3d1dG1QOEZqMlprZXUrSm8yVjF5ck1QSUpUU3UvMDZP?=
 =?utf-8?B?YlZMcEdXSFRnVXp6Qm0wRkllc2FCdkFBdUxwYU1ZYUFXQVdHNmJybExZYzEv?=
 =?utf-8?B?LzRKMnFnc0M1ZHlyNS91NFdLZlNhUEM3a2d3RWM4Q2FUNXFOWTNqZ0UzcWVa?=
 =?utf-8?B?TlN1ejVvSDYzZGV0ZTdxMlVjaHZhbW1QZ1RtcEI5Z1MzMHNtM3NodEpTOWtS?=
 =?utf-8?B?U01KeExmMjB3U0w4Ymp3dTQ5dlQvZFF6T283QTlBdjBhM3ZBK2EvYjYzQmxw?=
 =?utf-8?B?SmRhaFh3MFgrZUVWT1BmNTBxVW5BbmdQK3lycFhtbjFUaHgzTDE0STYzYThP?=
 =?utf-8?B?TWtRWWZJU0tKYXdKd0Jzb2U5ekFYMThQbmhSTERWaDRNcXE5TndreXpySDFy?=
 =?utf-8?B?SWdSNGoxZURXSFhXbzRHVWNCT3BaT2JXUE1VK2xJYzdEZFB4V2VWRkJrM0Zj?=
 =?utf-8?B?U25oZ0FFM2t0WUExRytRMC91T05kQmxmbmphWE9zYUNFQXQyRDZUNDJadXJk?=
 =?utf-8?B?R0M3dVNJTFNkZWx5em5HRnFuRTUrZ3k1a0lzRWI0cGdpODRPWTNrN1ZORkkw?=
 =?utf-8?B?NHhVYVhQS3FsV1JrQkoxbWRESFIrcllZWjVyZ1ZyOGFwZ3BmLzhMRDRLa01s?=
 =?utf-8?B?NEs3bTdrT0V3RDZjUmxMQnZRZFI1MVNVQ3FEVjluanFsdU95cUk5T0ttQktl?=
 =?utf-8?B?MncreE9MK2taaXJidWZmdGxUcXQyVlE4RlpMbmZZeHk0MENEalF2TWkvUkR0?=
 =?utf-8?B?OFY3dVVDYzFsdFBYY25nWVZmbUJMcFhqZ054d2NoRW5FQVZGVzdtSHZEQnYy?=
 =?utf-8?B?SW5pbmQraTVkZHp1Ly9rQlFvTlpyN1dFa2h3anF0dHFYZTJFSFd2bHZ4VEgv?=
 =?utf-8?B?dXRSVUUrV3ZTMlV6Q3RCc0lwY0FiNkFjZ3lYRlUvNmxvRUFRRWxwMGZpbk9G?=
 =?utf-8?B?WTZPVjhpSTlWV0RkcEczRWd0RUNCVG1xaFYwWEluc3dVRE5idnd5dWRDUmd6?=
 =?utf-8?B?RFMwdE1QZTlIakg4OFA2WFIwYXI3Z3U3OVVncHdkNms2RFJmQVdiaGh2MXZD?=
 =?utf-8?B?U1k4dzc2Zm5Ta1dyZjJQbHpCcWtMZTFPSVZqL25zN2xBNGEwTHRad21PN1BP?=
 =?utf-8?B?UzE0VXpraE8rcFg0cFhoUVFvdjZPaG9wdW1YbEovSnM2MHVQRk9wU1ptN0xN?=
 =?utf-8?B?Nk5wVENERGF5L2VGYnFZUWRCUURySTIzR1ovd3hEYVZLQkNUelB0RHlScWx6?=
 =?utf-8?B?cXAzWGt2WFJ3QkdkMWtoOTBjWitGbVE4amxWdUhhQTZ2YnpURUl1a21VMkc4?=
 =?utf-8?B?U2FYdHU5akJVTmh2MDFISWplRU9jYkoveWg2SVhteUV5ZUJZVUNsY1FCdUtQ?=
 =?utf-8?B?bVhWeGdCVTA3YkdLR0x6WEhIQksxMS9vdGMzaDJBVC92a1ZhWU1wakFUZFdI?=
 =?utf-8?B?WkY4NHc3Y1lva3RubWtEZlAzelR4QWdXT01Belc5Y3plNWl1WnNNblN3eDBk?=
 =?utf-8?Q?PuDHwSmcHmrOGWYDlyVtWG4MJvjdviyYAs1YJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d883366-35d0-4a9a-c7b0-08dec131ceae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:40.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaXLcKDxSO/8MkEMw9J1S4SfzC27FF3nnbjR8zg05hHELwhXztma8PEhnqu0bB3JHQU3yOXAKxHvHsbuSlDpL6n/YZRlbDjO38MMgvt2scYKO8lr4DiMkttun14g3x1B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_223441_881765_90DADC82 
X-CRM114-Status: GOOD (  12.98  )
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

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
to identify i.MX8MP PHY instance.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index cda88ea1f12d..2c3c22c6c66d 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
@@ -658,13 +659,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops imx95_usb_phy_ops = {
+	.init		= imx8mp_usb_phy_init,
+	.power_on	= imx8mq_phy_power_on,
+	.power_off	= imx8mq_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -677,6 +685,11 @@ static const struct regmap_config imx_cr_regmap_config = {
 	.max_register = 0x7,
 };
 
+static bool usb_phy_is_imx8mp(const void *data)
+{
+	return data == &imx8mp_usb_phy_ops;
+}
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -721,6 +734,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_ops)
 		return -EINVAL;
 
+	if (usb_phy_is_imx8mp(phy_ops))
+		dev_pm_genpd_rpm_always_on(dev, true);
+
 	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);

-- 
2.34.1



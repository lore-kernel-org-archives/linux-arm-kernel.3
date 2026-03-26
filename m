Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A60E109C047
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIGKhZFDw1tKxDJioJyca/J60KFTI0lj+j/sseDsDhY=; b=YB7vUMr7lsdue6hS/3qR9O8UfS
	eudaU7dvmstSxh+wf/UeW2DyXVr+Bo1siFPisOohJSM6LtsfWomeZTfWFA9L/JFSFwG9jE+Frqhg1
	SfUuLmUh2Vi4tD0KIi7yQpC+B3OS/yRQlfbi2+3OPnkFsQdOK4ogK/Xq9suNHaREeg2WSM4cNkbUR
	aXS159mA0H6X9foitydi4zmrd702ELKeJkH/JYzuayDzWKo3Z+g0xtF1QlkKiI+B8hlsUWj800+7X
	Q/Q7apCIFzArv1a/jpSsmBMGjktzCYQcOI1iEbSnSUx38Lo+xq21Afnx18B+Pl6SC5Ljtt4VWMViZ
	PiqagsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f7j-00000004vOf-3tls;
	Thu, 26 Mar 2026 07:27:23 +0000
Received: from mail-westeuropeazon11013012.outbound.protection.outlook.com ([52.101.72.12] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f7i-00000004vN3-0Tou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lg+ZrzHKJ3yfpDCBtrgGJpBxBTnC4PcvFzOTADJlg4q0Hm+11+ZyAPGmtpzBdyFIF81NY13lc/fvo/ijeiW+uJE64x6QIBs/EZWGmQBW28OLcgJqEeXf4CQXmOjZpNEBI7+x0Thhv6RGqDr49JNeeCwqugOztNf6mFro/qdxzty7CCaNbCkRgzoNWjBs0IOdv419O6APwsGytHf6g4f74AwolS2tnzveHQ88X8PX5LoIM5xHyUL1lNtsYnGn9kwW9PrG0+PQql281rf23yyWCNxlcm3oBTyE/p7Z/bjy+4xNo1fp/2nhH0IMoYz65jLiWn5iVGuYIkcndVt7goe93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIGKhZFDw1tKxDJioJyca/J60KFTI0lj+j/sseDsDhY=;
 b=Uv92ArTkuIEqFDKzRodXyaow49zRmCo7sW6g1LiT5lpEUYWCFjYL+fmfq9lRVPoy4n2mf8ePG+nbK9OutRDjv8c6R+V9BkwuqJk1oujsL8omisay2PZ8fuJG2v1wWCkQwjQZUPn2hxvzaA5+RHjBb0dHaWeIGsK9dC+xUaEscpq9wM0hrazTDAQ0ObpPbsVTx654oM0lGSAJnn/RR12cosDQX4rhzoILYlcPeNXPZ74V9HGkSG5XeM5BicJ8Q4NwdWePRyGz5njVkJkkLQDbIyWhTGBemWxg4pWQpKRIW3VA5ZX/ch4XDoPIB1uOpG9LpY/wtts+bxtphKugOtwUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIGKhZFDw1tKxDJioJyca/J60KFTI0lj+j/sseDsDhY=;
 b=ZyzI7J36fzaMu8c9OAl9Mp9aWLd5vhBBt/NRIcWySmQ4JCxab3lt8S/X+VOLJkzgf4rmGuaXCO04IlSOS8tkc0MXWazCkZi5n6vR8xNoKZpzdrPfEaVHcASgxnAcTWVbX00voVYvQ8jaKXURd+QzSw6Cv2a8Vpj3GUjjLANO3KCpe38PqJOljJy5V1+JXCtXG2PklfRJdlAJhQOpPUu83mScyf0tsMIEjUIZIFjleLGHTRZpuPf1/MWo5ZMcjWtwA5ICji7DhTm9VSO8juO1bqnIN9Yf4xYTqk65CGBn+mjP+pKStr67IaZJQsjk/6S2PlEFBjhWzi9kLMCRhx0JMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:26:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:08 +0800
Subject: [PATCH v2 04/12] arm64: dts: imx8mp-ab2: Correct PAD settings for
 PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-4-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: fea8e063-37fb-4f2d-02d6-08de8b090ddc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Fmp3bJjWY5LSmEdDkkhaMCBG5qwH3AaB24jXLs1wG+2GYLIL5kCjosWvMGZEdIA2zyTZdfex53CPBZ77sdXJRklkm7f6XCJ8aKVl9qBdTe+QIGVuorCsPJbzUoglsX3F4n1iZkYXBaxCoK8u9uzEJC1340ovog7CtqL9DmQNxT1CNujR6YnPTlsch/7fnsTToh3oinh+9+/sSSSENijtmv4POvfMvlJlamg4rtHvNeNimuFcyVt8POs5Ji4G2B9p0eVeNvsLiv9n2VFk8M3lYF85K2CA5FBb8FICnBhWvto1z36CkNk7OXtjBXK3l9D/+CHYuWX+eqPLTTReXkmbYvSIWe1YfzWymQQyT5ad3M53kS/STD99oqGtq8hTrCHNx5Jek9OFZSvRTv1TV5pccho3SVvzGeKfhjGw0MH6gUnyTBXcxAFsTuaUcA2Qb4/dY9kGyVwr9ruq0m3uTwr48UeiGMOfvlDHc+rj7yesKYpgMy/RRl045TAYKJTlSqUUzRBIxNh9b3/eLr7isttJa/ylbD7GP70/Gk60H4eaDICxOZMejj7fNNUZuAUIF75RvI9WJPryq1qJn/RLBll+fyYB91CiHjDCDzaZmDZC6Kwu67OWWjFbjzKdVGXlCUGSbefY718uPOS82r5ppqqJWVNQLUCxXsyM5SMnsNVmVuewyNRJ+SvtAhLr4H0sI4xDqURxcLivTwokrvGHN/TCF3A7gQMHmxSt0HNVNGhldjMT7BDr96cx3ytonskrahQIkCGZQnXNjwVIu/LvWJi5iVmxFBNAkYq9P286CNGDF7LGjLt36ETrylp5Epyr/P+1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0lNUUFGbjYwNG4wb0dwNFB3WGpLUUhUUXp4c3JIdGg3Vm1xK3dDMnl2eVlT?=
 =?utf-8?B?MmxIemVwWitBRGRRazhJSUVUeG5tRkRwRUhOSkpNMUcwZmN2Q0s2RUxVa3hL?=
 =?utf-8?B?d0RzZ1hrYVpTVWJ3TXN1Ny9Pa2tQUDdiajVDQVd2WFhjb0hkQkNvWlYwVURR?=
 =?utf-8?B?NHpFSEpDdW1RS1J0VDZiTGtPVnZ6cW1ia3Evb0Nzd1RQOWcvUGdpTUlmYjdz?=
 =?utf-8?B?U2EvUTRYa0l5ZDFhRU5wRHZmeVh1SkVCZTFTMU5GU1p0b3JvcTAzMjBUelZ6?=
 =?utf-8?B?QVNEM3pBNHhMVlpxZWtQMzF2VzEwSHpralAvSE0zOVNTclgwak5KdzM4WWZL?=
 =?utf-8?B?RW8rWUV1eGxqS083ZXBReGpsNmpvZDF5Vm4zU2VhOHMzMFh1cGNDeWIyeWkv?=
 =?utf-8?B?RmNQdUhpSTRydzV3b0JYRVNKYXd0L2pSS0lObmZOUW9weVZKMmZIdzVWcGhT?=
 =?utf-8?B?SHkzMjhZUUVvcEpkUEF0N05MOEs4MlBSZ241SUpXN0lZK2pQRDBNT201ckZ3?=
 =?utf-8?B?TVZBVlJCRjVIWlJJbEZuNm5OR0xmSU5tYmdwc0dzdTFYc01ER0N2S3J4dDlh?=
 =?utf-8?B?NTFjMnFOcXhvTDZYNjMvV0ZkemFpcEtaUHpOWHJEMi9FYXNadnhFUURtL1BR?=
 =?utf-8?B?VW5IZThvUHZ0Mi9LY3NiRktaeTRObmUvQ2JyR2ozL05hb3RCV05VNWZnN0ll?=
 =?utf-8?B?cERxVFVoM0M2YlhkU3g3WThIcHpJbWx2cUczZEk4VE84aDY4YkE1UFFidmpB?=
 =?utf-8?B?VnBtSkpWSmdOeUZwTlhUcVlteC9WNndGYlpReVNmSFJud24xY2lDY3VpZXVo?=
 =?utf-8?B?MDdULzg4RitMVllWbWdUUWd3bEVpd2RMR3NlWnlpZmhBVXhEd21HaGcxOFdW?=
 =?utf-8?B?WUV0WkloTkZSWWVKVUp2Y1VNU0hpK2FXWUF0TUlPMzBYRFRzaUNhUG1kbnNX?=
 =?utf-8?B?WVBHTDBWZFlnQkZDeFhENlZxL0pkR2tMZXlteG9UZWpqWnROVkwwb3oxQzVV?=
 =?utf-8?B?MFlmTWlJQU9ZVHI0QUFUSk1GUGpseWdLbDY2ZXVTMjY5ZHR5UkJPTG44eG93?=
 =?utf-8?B?YXBZekhGd1NoL3gvSHRtYUpZenNpQWVLekZsZjBzVDI3aHpWbUJPbHp6RFlI?=
 =?utf-8?B?MUF0YkZYNWNxT3NqVzFzaGs4aXhSWUJ1T0FUUFNjZEYyTWFIRFRGckp6YS9H?=
 =?utf-8?B?dHJLcVhYekRZeDBKcmphWVVQK0JBcnozcGZHa0tIcWI2ZS9RRzR3dVpONzk2?=
 =?utf-8?B?NjUwUTBvQkNSYjFicU1NUHlKOThuYkhXd1JFVk1wWkZpalpoMStOejVMNHpk?=
 =?utf-8?B?eWk0Sk9GRHkvWjZxaUptUVRaa1AwQjUyOHhsWjIwTE1wUlh5cURXRHhJazFR?=
 =?utf-8?B?aktjQVRPN2FMWUVzVFVsTSt1ZE4xSU04Y0xhNWRBVitBZTNQUmlxWUJPMlh5?=
 =?utf-8?B?aWhIYm5lc3hpMVJTeTdGUlJFRi80cDlRRklmQ2FvWDd5V1hmd2syb1FmNnR1?=
 =?utf-8?B?TUdoRksvSmhRbElrOFR6RmQvRnJVazdrbTFENlFNQk45TXpBb1ZSVDl4R0pQ?=
 =?utf-8?B?dTVKSGlaUGt0U2FrTnJUTCtNQXJ2WC81MzBjRjFKVHJOaEQ0cTNLUjRENVFJ?=
 =?utf-8?B?RllDWkFJTlNSVUh0cGd5SWpnNnhLL2ZiMG9yd3hpTSsvaEZCZitaeDFYVi9m?=
 =?utf-8?B?L0x3aks1M0crbTVLbHY1VEo5VFg3WTVFQmt4OHMzY3NsR0Vyd1ptQ2ZnVHkx?=
 =?utf-8?B?YzlvUjdFSkxqbEtGcTFLOGdKV1Vyb1l1R1BieTIvWHVJQ3VZSllQVjN4czVn?=
 =?utf-8?B?dHYrYXU2VmhvelNkNlVySjB4dkd6YkIrNjBJa0txMzNnbnJtaUJYYytDOU90?=
 =?utf-8?B?Um5vZkRVaGRpNW80Snh3ZU9tSHlDT0t1UHdUU2RsMDREbkkzWitMcCtIaEph?=
 =?utf-8?B?NUhxaG1qNG1QdSszVVppQitmWDNZUkhlQWZMYjdsRk5Cbkh0TG8rbkVLbTNQ?=
 =?utf-8?B?cUdVdndjVzk4bTN0UjlsbHRPRkt4Ymdyaml3M3hEUGp1RHUyUG14ZTVJTzc3?=
 =?utf-8?B?VUJ2cU5xMjNEblQ5MFp0cmU5eWpUMnBjanl4NWhyY1hnQzN0alpIRzB6OFRC?=
 =?utf-8?B?dnI0bHdMNm5MSjRyVk9vcjZvbUtkUUNiZzBUQk44dUU5RTVCV2RJTHg1Wkly?=
 =?utf-8?B?NkRmRS9sdUNvYVMvU1VwWWFSbXlzWkZBUjZsTURnSmFjTS9WeHNmQXZiVXNM?=
 =?utf-8?B?djRLcjlPaExwa0lVWTBLVUkrWlROTDZXYjV1M0RpeFoyaGxjV3RrRXFNWXVX?=
 =?utf-8?B?VHJERlp2TDYzMEMwT0UxUExyYjlQdGRqa0V1cC9YcVA3MXNEZWVwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea8e063-37fb-4f2d-02d6-08de8b090ddc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:54.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJxgCfHNTjHDX/xg2LJxuiB7NPhkUDMnMzkfSTqOzy6zFR6dp/Kk4wfHyx79KJGJ5gTCc6lVsu8DEk3UT0+vjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_002722_162965_48051613 
X-CRM114-Status: GOOD (  10.44  )
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

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there will be interrupt storm for i.MX8MP AB2. Per schematic, there
is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
PUE and PU together to make pull up work properly.

Fixes: 7adad1a52c420 ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
index 7031a33d85c8fab212e43883db4842b85bd532f1..dbbc0df0e3d1c7161b4210333decd55d70c206f4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -545,7 +545,7 @@ MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_PDM_BIT_STREAM03	0xd6
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x1c0
 		>;
 	};
 

-- 
2.37.1



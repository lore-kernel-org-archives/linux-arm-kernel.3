Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA7109C03C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oFCYO/2uBZMbWIPcIvny/Ri4mK5icfTLEFzX8ZLBM8=; b=kiPpz4EaAGruCOR9H2De7gi4rh
	xE0cX47zBTpTDVPT/qDYTlwbiDVoyMJPrt9hWkAanz0+QGZpe0PUj93wJwirKFKnnzvFarOzDMBFz
	u0Okp20te0kREo7a88FGoGRH5BC6eRreZFPcp6VHd+vLRclg2qFyEskhJFu4uRlhytjikZd0gNt0C
	5oG0Llj4sNGuky7S3ve5f20zc7xrajhiofb20Zo36ipY5EOotUhxv7n+ELjbfQQYB4p8yBs6zO3Jl
	WZ3te6LXQlA7/frUGySkBNthm/OiXy87vOBjcBEZg68poOko8D2FUYbkSwhFW8evSCZPLwQCCa+WL
	VX7v0maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RDP-00000003v3O-44A8;
	Wed, 25 Mar 2026 16:36:19 +0000
Received: from mail-westeuropeazon11010054.outbound.protection.outlook.com ([52.101.69.54] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RDO-00000003v2e-0KRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4b7BSWpns5WJKcvBmTnC+XyA50s1d7CLBmNTOWyDp8RaDz7Wsntwwj38qfmbZlrfx/z1meBWu0+4ce/7swugaGblcBsPJi5SvajeTLg1jO0P+z7Am8BOQnm/Lx0zVqjU7YKSrkd7hwqPmFlFN314qHLSQeqwTo4sGltUfk8x4qtToaBhyOQ/AqlmOjhKTQNSuGlKupwBNxrqCKS+tqvzA/QtPg/O22TfVZ1alqyX5e9jBjpLtuzaR4MWo/JjbxuNDkvx3/Gz07k+vOoUNqPpBjXGu/yJe2WwiLZCsPS3rO+qffjvZGC1Tr+TyDrWCLenU/kiY/2Osc4Nmc2Nuu2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oFCYO/2uBZMbWIPcIvny/Ri4mK5icfTLEFzX8ZLBM8=;
 b=aPvi425ZImra7c3NvSsyCMfjOJ0X1704lKJib1Y/ufRZjlIX1DN+bcwknJlwQa3uoz51clcoESTx9p5M23sRriTOwp7b/lWkJs9IjObhVub3cePz/QGZu9imbJNXSE2DuRC7PAYfdjcBmDWidw5XdK3zFmcZY8QFq6CGfhFvmRQCJ+XZeGjY6N3IxAEO5Cssbi7wUUv92pdJfDfawQxJWAKR4chZDXp82te5MqD78iSKc6vpyNAORGPiaLE7E5FrwqxvNgRCY0tGoMqYhJCUF7pj6yJW7hLiCo89JLCzU/NyvKqs5mciF+gNhwZY9RqP0E4+fBgJmHpwrHUPoj4zuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oFCYO/2uBZMbWIPcIvny/Ri4mK5icfTLEFzX8ZLBM8=;
 b=S9aKjUnn5yKWHJbwz5CU2L8921FsTXOVK0xBf3Ap4zWetv09Q9kA+OZn+Y8Rqv9DelpAXYU6eAZfF5aExLjyI0DSP+lJy4iVKC4Skp7HUGTEobUgMGi64MjFV2cSv7IY6Au4WzVZ7M1gHFAVpNG+xOJb4s1BzVts7oAKWUJszwlCsSfNvKPQ4JjorJ6vZVtVyZd45w2FMAzBMRQvj8SWyv7dj1K8THBCPV7BmQySW4ORRIQXA0RBvslMn0PUUs594x5QPH1Pgi/b8ZIEZoF071kAtagwi6ZOOjIv7ThE3GsXmVjaUttmtrq5s3z1MdEZMaLHhDMr2feRfQIYjfB/vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB9783.eurprd04.prod.outlook.com (2603:10a6:10:4b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:36:13 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:36:13 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support
Date: Wed, 25 Mar 2026 12:35:55 -0400
Message-ID: <177445648422.3146408.865544240722814138.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325-fpf-imx8mp-frdm-v3-1-1c98eade991a@pengutronix.de>
References: <20260325-fpf-imx8mp-frdm-v3-1-1c98eade991a@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: 26636ef1-08be-4ca8-0c42-08de8a8ca0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sKXr1xoBpnHADGw8/86UQq9i67T8uDzYbuIZXv/6s56gA3msHB4/y3qu1EmcNx4OcCJ7uPd8WoUQwACcd/jFCu21TNiisYimH+Y3gxfWxSHFnzRmN35I64hmI6+Uu5IRg51NconsZHGVR3emo+bZGo4/yUacpR1QT9KF84UfTB+RElkSjMQbHdc/06SmGmnC7u6zQy5ymV1BKpaxWMXfOyH76QsOp5M8cH5Wq1XFJu696ZRAORTDJg2+SrzllgQlhNP63F48qTaU08o1ivlfZVd20XMd9+m2X+cZjStQ3yyiLQKlfUcJLA58ezmkLY4dVb3UaNt1VkoYTeMes1mpJVKdROY20ziJiStykyFDYfkgPT0marbsN9Rxv9s5FyGzH/k9tf7IJOVH5+nvF5Oh5XHuj7ODQLBXGx6EKAfrDZxvAES/DWKe/MFau9W7mZCB5/KhRcjZWypfepflorJWkIOHCnf56xFuCPBnp/3PKpEqis1stRgkUVfAXlnOcdyrJQUAxrRPpnHcVKbU2/Dm2YM7dgmGdUcxpQUus1hBWMPmaNRkGR/ocN6S2bolYwx5ilEShu0hsbz+aHwjxZKVB8o56/P1f2flMUOHb1fuEphTxeL5Rl28xilRlukauG3QmVN//LMd9h/WezC9hCOe0ZUlJUpVLY2IrxbeDn+6iVOSwnnFi9xgFf4d7nKR/rrd25MTMHQ8/IlNWhyqMzzsf3Tfg+HNN3jbc95aEYIu8MzylG5FpWtBhvpaO8A2b6JZZgB9Y60OOfcR9LTqozN6wQ0v6+dFOXq9jEkiESmVWKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUk3VnBueXBlS3NGRTNLanFOT05kdzZ5c1FGdFNGYWlVUzlEazZwZU9GQkt1?=
 =?utf-8?B?L0RzMjNxZDVMdzRqb1U5VTBqOTJvWjUrc3ZvcHpHU0t3T1VKTmJnd0ZxN1dq?=
 =?utf-8?B?amZqWERSSzk1MzNoME5TT29qY29UYk1QSHdieUJQekJML1YrQVhBRHFpSWpD?=
 =?utf-8?B?Y3BUeTU0V0c4TzJzUUZWN3hjeHA0djhobWdRc1dldE9NN0ZZUVY5Z2diSFVi?=
 =?utf-8?B?VFhEU1o0Uk1DaGRyeHZ2aFZHaGtReHlxWTZ0L3NjT0pzNEpEbkFhOUlTa0RX?=
 =?utf-8?B?V0JSejNyMElwcFdoY0pPK0xaNGVDOEM1V0NOdG9ZOVM5MWlCVmhSOGJKN1Fh?=
 =?utf-8?B?eXY2cEZOd25uMTNidVByLzVCSkljQUZ6bjFqL3c2WWxwOFZWdlFXYVYzZHZK?=
 =?utf-8?B?NytMenprbEQzRkRCOEVGK1BicUcvbmJlVFhPaENJOVUxNjFmc09YZm1KUkgv?=
 =?utf-8?B?ck82b3dXakRYTGtsWEhGa3NRSE8xL09WaWY3ZjhYT25OR0M0T0xGT2NveEcx?=
 =?utf-8?B?bGh3Yy9oOW9VbUZQVkc0VHRtN1NFdTFDR2p4cmJFMlh5c1dvWVpiOU9VSytY?=
 =?utf-8?B?bHpaTG5aNGhVelM3dys2UmRXRkpaM1VWTlJoVXNsQWlZc0JpRTNuWWE0Si9k?=
 =?utf-8?B?dmxqdS8zNUJNSG1HKy9MWXVOQlNaeTJoRmVSQ24xNjhDelNCZEh5L2RlYitu?=
 =?utf-8?B?Y25Gb2t5dktQdnJBTTJLMTc3QnhxUEVuME1wTTVXZjZvK0FzTmIyb0Q1bkQ0?=
 =?utf-8?B?cGpBd1lFMFBTM1l2dFkrZERnMy9qWFZIT2tVQlhIZ1JQMjB6MGRBaUpYdnpH?=
 =?utf-8?B?UjdBVkZwaFVDSExnZVp5QlNQUDlhUnlCOVkvZ2liMm55MFB6NEJjQW93d2ov?=
 =?utf-8?B?dFNWMXdhUzAybCt5T2RFQisvSEdkSGROZThJWHlTUUhTRlNIMko0OEhNZWNX?=
 =?utf-8?B?ZU1UWmF1a2lxelhWa01naVJaWEQ1QUxaZWRsSnJtS2xSbVBYRkVRLyttL2JU?=
 =?utf-8?B?TW93dlBWeWhzYjFiZjVKN3J4b3VHZjg2cHVvVE91cE5SVGk2UHJ2eFpYQVR5?=
 =?utf-8?B?T3FwTnFLNEFFb0RFL3dFZkpjekZDSUZmcTRZRkQyckpMazR0V0lsNnZTRVRv?=
 =?utf-8?B?dUdxOE82dVFVbWExV0FRZ0hWbmhYc0ZHVy8zSmVUNFhDZUpuMkRZYXBKVmll?=
 =?utf-8?B?WnhsQ2lhLzBrQzdUeFNFejFGcThXa2VrUEtSRG90NW5EZnU4cWZzeVFrbitP?=
 =?utf-8?B?WkpNc0o4eDM5MENPVWJjZWlsN0p6TURkb2lHWWtKWWk3RmluR3BkMUtaSjZm?=
 =?utf-8?B?TE9RMUJYU2VyYmZZSGJGN3pKTWxTb1F2Q0hWVG10M2FVWVRLbmIwZHhraVNM?=
 =?utf-8?B?MVJKMnVpcFprNTJjY3Z5clRkR1JvMW52MXd2Y2k4UDE1azVFWE5QMmFSVVhG?=
 =?utf-8?B?dHJ4SjRPeTVZaGRJOHZVeE9UQ2NLR2U0amN2UHBmRjVmMUhOajlVK1BETU1F?=
 =?utf-8?B?NjUrUlpQQzM4ZC9aS3BqUnRGQzhtRVJUZXAzQlpQLzFRdnFpb2hTN1YxU3ZY?=
 =?utf-8?B?dDRWQXZtdngwKzB5d1FGbmR1cUFIL0JwdXhqajFvTThjNGZvKzF2bmxzYldF?=
 =?utf-8?B?YlQwU0ZGL3A0VXBaVU41NkpEdnl4THVldDFoUlBCRm9LQWJkUFhNWmQ5NC9o?=
 =?utf-8?B?VGlRS3lwNWpDMG0wTTRDU0dnZ2I4MUJPU3hzNlUwdlozUzcwSmNGNXpWcHV6?=
 =?utf-8?B?R1lSK3hUMU5CVXNpd2NMTGxNZnJ2Z3NCWklJNlRWTXFQUzNacno2dEJpMXp6?=
 =?utf-8?B?UFJLZDN4ZHNDUEdhQW9jZVNEMnJCTGVnUlE4YjlkZHZ2OHZmRkI2RlRSNGND?=
 =?utf-8?B?R1hHTGhNRHAyQUN0ODJDMmorQmdaOFJzUkdTK0t0N2Uvemp0blowYnp6N0RF?=
 =?utf-8?B?QnRTS0VvQWdNalZLRVpGVS9TT2grN1BqU2dTMTZGQmZNR3preVBnN0UwRGlu?=
 =?utf-8?B?Y3ZlSW9QalBiYkN4YVhpRXE4dTM5cWpyYjZtTUgxZE1pNTBjTUFKcTZPSFRx?=
 =?utf-8?B?TDNZa1Y3RHEwUThncmJLTWVKRkMycFVFODY3VFhyUWVZRFBDTUU2R3BUVzNi?=
 =?utf-8?B?YlM2c1lMVm92TWZoajJwRUYzRjdCRlhTOWc4cGZMRHo5QTQrYm1oQzdJcWND?=
 =?utf-8?B?a0dXY0FMK0U2Uy9iOWJvMnBneTBJRERZYVlBOFZsZXZYT214UnVzTDMrNDhH?=
 =?utf-8?B?bG5nTUJFNm9WLyt0QThqbXZ1YStpbFJMQnpxZDViK3A1L2U2WVVzVWZMdHF3?=
 =?utf-8?B?VjV6RExwV00xNWhVUnNnVVVPUW5SQktUV0c2d3ByVjl2aGZDMm80UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26636ef1-08be-4ca8-0c42-08de8a8ca0b9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:36:13.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoFHleaMn28UGEp+8Zwi2WUP0wjweY7oIuFcqRY17iF7jPN6wwhL+Z/TigeXt6cbEZWCN3D96rfQOWSWM9mgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093618_116478_441019D2 
X-CRM114-Status: GOOD (  10.28  )
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


On Wed, 25 Mar 2026 17:01:49 +0100, Fabian Pfitzner wrote:
> Add support for the following new features:
>
> - SD Card
> - Ethernet (FEC + EQOS)
> - Wifi
> - USB
> - HDMI
>
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support
      commit: 961719c5456ce407221868d9cab2a1311ccf1eeb

Remove extra line before &hdmi_pvi
move usb* node before usdhc1 to keep alphabet order.


Best regards,
--
Frank Li <Frank.Li@nxp.com>


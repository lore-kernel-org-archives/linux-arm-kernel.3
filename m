Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69579C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErE/YwIm24Dywx/my/YNPgjaigFFhYsHNj1m7R7XElo=; b=sgUtvgkRJWWnKQtA0OZ0MUPMOp
	kF9u4V9gOC9yB+dhQEaI9EPlK8AxT6ZykRPJobhrRGHnKGni20kLW6GAshOrjRVNf8+xpx1gJy26w
	kDqHg0OFMlkwknd9IZ9T+VvZjGmqapHr/2CQ2liknZCJgBCRgC/OwzOv75+UF/cQJJTs8OM6hKpbe
	nVwFj82c2zYmBd3Ydu09Am01S1pyNnlFnVMPLsMVq4UG/U0IeciLuxBFUxdfKbDCRs+AQxStbE4GP
	JCNEwmWF1ck3RxI4qmpb0FP1jPiLC6zEy6mqVPCGVWks+QDUs3FJxcaBuyq9f08gR/7YQN17ieIBc
	iZfPKQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJUv-00000009y50-2uyv;
	Mon, 13 Jul 2026 16:27:13 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJUt-00000009y49-3AYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crhzKYw9SVttlrLW8kVIuyjztpJ2CSHtbJlNWidxSLc46v8jH593nrNnxoou98t1mRLDx/rJHB4zkVgTRubVT0tq7uQKcDfkM0lZfvQFWtIFf/gF4clKCbI2wjB+BO2VFX168itIzA3dN81owfbKjw2ywDCSdxIBfBJzXaa/GQ2yLovcckPTRgVwDKf985vBKTtkAu3Au3wP3kxTh8waI6RV5WTeu40A5wcAhBbDni2Ttc+LJYjZqKECp6llk8FtyNfvSFhaY6kn+PeIUju0P8UXJze0Xd4xFK4kKL1cRgeO4++GE33sp9Sl+gVSBROQwWl9ptFJ9GKqeSOdlNj6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErE/YwIm24Dywx/my/YNPgjaigFFhYsHNj1m7R7XElo=;
 b=wG3VlPwYJTAeqcvjkYiwvHU1vPZDiaVS4UPzkSpVPfPJUkf0lCIQFqq97VHUQeHZoEydbJmE986pwZNHVLyKW/L1Nm+ns/+ejZY+3FrC379vdXPtoi1Kv5ZnQ8cUFS/Z3RVFccsc6Y5JQhfGLU1kfi4i8M1uUr1UbAohouUrRhH8exg2aqNaIZ06yYX+CBh36pl3InsNwWuZYCxCE975wVuneMarkhi4ccyxqo2fvtWD6FgusphdjgygDZSggdWDmaSt4okhAu+T+iYirONLU5wMssJqMrxeAKlcvuHnA/nIkCU/nDHzVevdAwBNFBaxfelRTdpCKnvTU0m5Q1mpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErE/YwIm24Dywx/my/YNPgjaigFFhYsHNj1m7R7XElo=;
 b=mq8GSj3DtDxsbFbcj1/fU3OAlQXg8R1cQf0n0I6ALB5eLuR2zzc55xIOzLCImewAt1nzWPdulQE6k8w612YWy+oTHMt0prCk5QyJJ9lfKTNZCUf8cK/QSZRx5+WqCnX23lCSZX13oJNIy4l5MtwCyBg61KK6ON2oQ7oF4zozqgR6QSepYDiVRw21dM8ykS4mGktWr41Kjx7hx7X54z9lBvbrL6KvU9I+pbN3TK4FY/ziR7Wm1do4vZfSvxyls6Evdd7/txmz625nBo7ALmY8GzT/p2PUFGz1xLnE/dS61wpdtZ1b2Yipazmse7Bzx/bTFjZc0FRy3IkqLgCz0cSO9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB10016.eurprd04.prod.outlook.com (2603:10a6:10:4dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 16:27:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:27:06 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Small fixes for TQMa91xx
Date: Mon, 13 Jul 2026 12:26:58 -0400
Message-ID: <178396001431.451755.10982551750390998514.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
References: <20260707085551.1683462-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c789180-b674-4198-7eff-08dee0fb945e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|19092799006|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QOGgC4Z1+Ox6PrFq8NwYOewBylGZaFW+IaBk2cAUvQutrJCf6ilmAsKDYd0wuTGZu4uE+096RlcXj/wKACWmRyeYc7kaytLHWAYNXXzRiIL0btf7mANQSZqkuP07yjaywvqqpEgXyUcW6zdcirjqWvwkV2Pnl6q7gQvJ0aD4xSiUG0vhXPzGFs3YcbixR6o1VQWgreU/s87yefiKij/Wf2DRti3zlXCwYlH7b6TCTlk7V0g1Ka0oqCZbBm+liXAJRpdV95ef+h9y01yXUDh2Hj5ShgNXSz+afGG20ph9mhRg/7QEc+8cBXt930hW93PkRt4bz6fSa6gDqAbBx+/mGCrWm6CLnJPkOQ65b46pESL7qyvxo/I03ep/ti5TmMMK4XbwW44lfqWvye5uxCvBW/2KWflHlMgPDjUWJNLP5LSe75C7mycEOzt/S1sor1scz4luc7t77+7xhZeryo3HC6njY2G7my8OLnsgxrXaQTSBUpxCGs+Xo8Vsa81T02k/w205imsNlkf4CpBMZapwcNyr9ITEtqDUwimazpoZEsEYVGfuTUgYHfj8vh/kwJlz1i8TC2nNmN3KAXsRNY/SuSrLqg+gTATq5cK68cj2/6RA1fZ2Ny1GF8PnNUo1rtWjOdsqCO/IMD8yMeN8N8tPn16Aw8VZHBkeRWaNefS+GUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(19092799006)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ExTzFBbkNaR2xvd0JFbFRvY2wzTy92bEE5UW1yNGNINWJaS0thNTFId3lM?=
 =?utf-8?B?ekpHQjFvYThzeGd4TFpUeENrYVpkd1llQzFZZ1F3WG1KUVB5NnEvNlR4SzJG?=
 =?utf-8?B?VHZ6RHFoOW1ZMWxlQTZHODZub0RkeGs3NzVUTTl5amk5eGJoRVNJV1lEZEZq?=
 =?utf-8?B?emI1eGtRWUhRdFJqRmc5QTNwTVJZZ3VlNDB2VWxjVFBRL3RXdVNvVnpTdzVT?=
 =?utf-8?B?ZEdZdkhYTXgxbGplZW9Zd2lueFJVcFluaXNDYnAvRFhkSGswUHlqR3pLQ2Vv?=
 =?utf-8?B?N1c0LzQyVEtwa1VDVXlGd0MwcnZtN1lOT282YmhuaGpKUVBVVzVBb2VGa1Jq?=
 =?utf-8?B?YU1aWWRQVzd0by9STFRVSzJ3TUluWm9CeFUwQzRkMjlsclFIdS9ONmdvSDFi?=
 =?utf-8?B?R1owOUUzMWJ6ZE9Td01Za3E1NjVZUytvYWR6RlliYzRPMmRxNlN5dnB0RE1i?=
 =?utf-8?B?Q3BLNGFDVlMyZmh2MUVqeTM2dDgwL29MRXd4bkllbFAxOTg4UzFqT2JwTnp2?=
 =?utf-8?B?OGRqbzhoS1A2MDJxaFUyTmc1UWF5NFFLY3RRdEZzazZFVUtmVzk3UitWUHp4?=
 =?utf-8?B?SzMxdHEraFJjcXdPSU0yQkxSWEV5ZS8xdURVd0JDRS9xYVJvb0xVS0E3dWlM?=
 =?utf-8?B?b3FaVHJHU3NhdFVBNFZib3l0a1BEdzZKTmZLbnJxV2R1clprYnJWUFdFSGZ5?=
 =?utf-8?B?SGZFRVhta3dLYkNIbmJlVVpXMk9MUnVPTWR2MUgwSEdtVmpxbDRSRGFuK2pY?=
 =?utf-8?B?cXQyMDBSZnNWempmckd1ZVZ5WHVQM283UjFTa3VkRlVsWXBxaTZVR0RQS3hW?=
 =?utf-8?B?R0pTMnBlYjFTUy8yeERRMG9XU3NVeGlUa0IxY3VCakJ2aUhEeWlOOGloLzdV?=
 =?utf-8?B?T2k2Q0xyVFVqcEVad1prbWNmdFBCK084bCswRHFTTHZ2MzFSMExjTk80VjU4?=
 =?utf-8?B?ZGc1SHlVb1hiTERXZ2VqOWJNNTlQUWxhVnEzV0dZQ1JFNDkvTUhiaUgvYktk?=
 =?utf-8?B?N0JiUjExV1dTVHNGckJ2UmdjSytXaGZVTjJtY0VNL1FIeEhtc1ZUb3EwWHZP?=
 =?utf-8?B?VWZUZDBQUllraTFsbWdYdVFoMWYwUnpGb1dCWG04STNxdHdaOWJQNU9oQkpB?=
 =?utf-8?B?MzlLN2dLR0VFdEI4NHdDOVNJZEhzVFkwR3hYTlo5ZmwzNFNyWDVyUmFxVFdk?=
 =?utf-8?B?OTd2T0N2UTZXVFBlLzZJN1hUdEtBZGRUaHBFbzI0clVxTjNUSXBOV1VnTFZF?=
 =?utf-8?B?VWdDaU1oSjUzV2h4VlM4ZVArditnWUQxblVzOTlGdy9zM2lwYUpJb0o4KzBZ?=
 =?utf-8?B?djZmdlNKWXRUakEvT05KUEpqS1RTQkVucFdIcnBHYmR3NFdDV0duTGNBSnhj?=
 =?utf-8?B?aldmLzdiQ0tsZW1CbGtRdTJKS21wSHVnT0JWdDAyTFl3bkpxRTRzSzUySFlZ?=
 =?utf-8?B?S3d2eitDVkY3YWVndnhlSWJXckkyemVzMGp2WjJEWHQ2ZUVDWUVUcUV6ZHo2?=
 =?utf-8?B?VTBPY1pKM3FFQzVvTFFBVURFREFoNjdQQ2NVZXI0bVlDVWJxUzBjNWVvaG1r?=
 =?utf-8?B?WFlldWpEZ3RjYnN0RUJQL0ZNNkZRZnhucHYwSkdieU02RlE3Z1ExMjBJQ1kv?=
 =?utf-8?B?bHU1RXo5OXhXWDVmajJaSk9JNld2djdORDFGNXJlMlJvdUgrb1hxb0tjR0FD?=
 =?utf-8?B?L0taa3dTdW5tZzZCeitiSjk5UVQwcmFENm9jRW1ZTWZ1Q0xuWGk0OUo3YTE1?=
 =?utf-8?B?ZDNJbkZ5STlQL0hqUXNQZExUU1hCck1OUnpjdW9uTFZuYVR1eGRhT1ZHN0k0?=
 =?utf-8?B?c1FNNDFTTzd3b2M1TVBNL0J1UW55R2NDZFg3TGpVQis0ZkkyYnNoZ2lDZ0dw?=
 =?utf-8?B?RGF5eDB2dnd6RlA0TDVrSEpzeDNyRzA0OWttNkZNK1BHNXE3bURmOHJHUzRV?=
 =?utf-8?B?UytuWGNWWFNwM3FQVUxkNkpOMDZzY2JSNXVJczJvcW1uNGhkZ2Fzc0ZXSXQr?=
 =?utf-8?B?Lzl5U3VGbVNNMnZnK3Nudmdub2hCeXcyNVc2a28yYUJPTlBMeTJsTWUrOHlo?=
 =?utf-8?B?REVlQ2FVYmRpbGVFL2NWUjdHaUoyNjJTaVF4cTVTSW9NQk5pSFVhc3RrQkRx?=
 =?utf-8?B?Q2lJR1JYQjJicG90L0w4Unk0Mll6NUlJNWh0ckhnbXdYVkEvcFFZeHltRjNX?=
 =?utf-8?B?YitJVmJPenRPWWlXZkNtcU9HZCthNFdtYlRjSFYrN3lndkZFeDRpRDZKSXI5?=
 =?utf-8?B?L2R1ZlRqZVgzeDIzRmV3c3g5Mllnak1PN3A5ZDNnKzBVWkV6UXM4d3lKWmFG?=
 =?utf-8?B?TWVEci9iYnZZUUF0cG8vR1lseTBGY0VvN0Rnam91RFIxZkw3OGpyVk8yd0t0?=
 =?utf-8?Q?RecxgmaZKiXKRc8jSqRM5wgMeJA0W0XYgOD1N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c789180-b674-4198-7eff-08dee0fb945e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:27:06.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGy62a3jOxdF0lHTn3+9w64S5GIdCh1tkiUNV9swQbzQJgbp1fmZBEJ8WhvBGGoGkX8CxmNm3GGXg2bqYz0aHHsIllA0qbYjD9ECZtj4O48EhXFFuj11Fs0E2NixkOlM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_092711_823399_32E1A648 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 07 Jul 2026 10:55:41 +0200, Alexander Stein wrote:
> here are two small fixes for TQMa91xx.
> One adds the USB PHY settings similar to other TQ mainboards.
> The other one fixes the reserved memory for EdgeLock Enclave to be suitable
> for 512MiB variants as well.
> 
> Best regards,
> Alexander
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments
      commit: b463d4de9d365690d44fac9b8136190332639de1
[2/2] arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range
      commit: 96927ebe2610849ebdd78635b2e63a7af7a94eae

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


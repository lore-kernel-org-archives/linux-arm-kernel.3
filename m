Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R25DAJh5+U4+NS74d2lT6sqCWc6wuk8fXPYSvrQJhTw=; b=IIAsLtxqaBo9lei86a47JlpEi5
	GAolhg79CPpMAYSvHRq56L9ABiKv/i9LVU75dikwHUf8SuNP00+1f/0yb81PAiHLgda8wKCR3bh5n
	FrOQ4R+pIxb0gwm5D3MZ60gcXbpycpdinfnNOvUL2817iUsJOW3SvudNXiRhPoet0D2TtAZ1BTFzQ
	KS5RmECHcQ0R1YhFxa5NHf6aslSvscugOn/Ao1W42YNkGE4KePhh0kPVeAvzhv7CqmxxeP1G2jjP2
	Hu3IOv7+BW+pvEVKtARmkerv331HPgldEWiYmen3QUsrF3Ihg7+NwRC4eHAKli4RqAswpc6wAihId
	ZvN6taCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArvR-0000000E9gw-3RsZ;
	Mon, 20 Oct 2025 15:35:57 +0000
Received: from mail-northeuropeazon11011052.outbound.protection.outlook.com ([52.101.65.52] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArvO-0000000E9gT-1PoS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwyGt/cLaOBrh0K/ihwYHreZjawZpMEoF/MexJCw5y2YOWkaZMQJTuA2G48+Ahc/RBxI0wgEeKbPJyXq0ZOOJQwun5ssCFPAvPt4SRJy23uKggs4sDoRgIA1UM0Su8m/S6NxMLHywipX21gVmntC2FLweuyccGnL024BQScI/TcAnplAqaEZfC5I9TiPHoRO6lRFMBjbuUsD8GYxXGp4WLmGp/1hC8ArSGWPQo+odrjwuNRSOplKtrj2yBB6JrwG6ndjvDB1iuotj07SFeDiBACCWRZKGKMvQ7QMgm6R+7SYbP0OJeNMGPHF8dgl4QRWQT8LxG5cC3j76zjsRSSwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R25DAJh5+U4+NS74d2lT6sqCWc6wuk8fXPYSvrQJhTw=;
 b=a/IQ1eTsT+k8/bUUEwOl8NJKQOUMjHsbEQEaU78aBatv62PUg84mk2C4GydD66qlI7VeEblXmRTPIbKZLECnpcm43KGompC5c1iHF/ZrJuf/Bc0gj/6RSQoTgGm8rLa7MSPgx7cNl90BmdD73YmI0V19x+uC3DWhU0lNXPJ348LjxifKGFCWEgUagu354o/wEi4ECbXb2oSCalOpsqfeu+F1y6CKr4yvstW/B0q7ayYZk5ppH+a5w63gjzM0lR2fKooguNyV9Rg3AE1UMOQ9xIiFeetq1z+ugLplA1Tgt/HykZHF9fXu4XcK2njMwv3S7Hp96DvVDPoe3UZGpigatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R25DAJh5+U4+NS74d2lT6sqCWc6wuk8fXPYSvrQJhTw=;
 b=EMuWOJaExbDabuLezzxY3D4m/LLPGWL6Xd+61rf0glG3upklH+lOfPExT23q704gWwv3WJNM4b3mMygozGoySwZHBPnL2FJvKsFsx0lzNR0NnEI5RSM0Jhlmw7xTNquLf2a6GIBQX53ioOYshCL9JqMatT0j+iCFIuh7oApArBKQKMoMD8Xyq87EpWCYYxcT2Zg34bTpa5t34A7lvPuNIECLVt6pbSGCvYdQSdQS3Dlh4fJ6mRJhSEQavTRnR8W9KhoyudycNJHB5mIMskSEYamVWW6T1IZxRKw8krIDA3UrHwT6sQNT+FgYCLISpoGTS/YLVq4qL0dSBOeb5qMZRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:35:47 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 15:35:47 +0000
Date: Mon, 20 Oct 2025 11:35:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, upstream@lists.phytec.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp-phyboard-pollux: add fan-supply
Message-ID: <aPZWzbRKquauLco4@lizhi-Precision-Tower-5810>
References: <20251020-imx8mp-dts-additions-v1-0-ea9ac5652b8b@phytec.de>
 <20251020-imx8mp-dts-additions-v1-1-ea9ac5652b8b@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx8mp-dts-additions-v1-1-ea9ac5652b8b@phytec.de>
X-ClientProxiedBy: CH2PR18CA0054.namprd18.prod.outlook.com
 (2603:10b6:610:55::34) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d3e81f-6da0-4cf6-b777-08de0fee5720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w0EmIMmRT9qfEpbpPWVpm4THApMUjwv87rEkTWwQx5rIMuMiYGNcR0Cd+eK8?=
 =?us-ascii?Q?GVGbpFkmwh2H9+QundYfmuDpZ0dWjyAlXOmirIf52yu1YMeZWqDv3m4zq/Sr?=
 =?us-ascii?Q?cHjfm1ghnjCgSUYYMzs/kwj5mS3ZWa8Vq5h6P4a/+JpSP/SGLv10GQdGlysm?=
 =?us-ascii?Q?7ME3rxLvyMtMUzhvnGP5Nvp9VaA18xQmUrSgQAXejpqA5Mrb91qy6OCxgQZr?=
 =?us-ascii?Q?hjoINwYO585KXfdSKMJlrrl3XWsDsssIjD1HUcO4GgQ5Fp7w8sgFEIv3eRC1?=
 =?us-ascii?Q?AH9b/0EC15yvzB/PF6I7VK0KhKVaAzosyynuT2MNzbqZzmyjt7RR665W2LpX?=
 =?us-ascii?Q?S1ZX9LEj0uZonRFslne4c32m3AzcejnugPs7Mn3ycsBKhwjUleJZGgzWkjac?=
 =?us-ascii?Q?Wp1USa1R/qbGw4zjeEt9TjF4ZrW4YwgBruLBgrb5TN+qDrXkoBfvSlCIyWbN?=
 =?us-ascii?Q?biylLrM/iwhWOqFL3biYmVz5Usw+PU3dCzaYHel+3u1viIUMraSaBg5t74NH?=
 =?us-ascii?Q?q7RaBX51vxOhPIdx0XNSdPJWHeZdbigxwJFCSBHM6AY2HmuM/NqHRv/ua2cZ?=
 =?us-ascii?Q?+JmmLUP7QbK3mTxS/tmYOhTMTKy/oNXRno6HLaCsXVbhq0YmGSn3J0ane8dr?=
 =?us-ascii?Q?OiLsdVTKy+u3A5VgrjdntqYaKe+4ph//EAncsbhEfvxy88Qc2cLC9Qr9duQS?=
 =?us-ascii?Q?UVrIOrrged7O2UFnDzEdYpk/+JGAUlaGvO6YJMyMUoOs/Epwr/ZlpHGa/foi?=
 =?us-ascii?Q?ThFkqzUb+E9RDeOH2JET7LISG5OvswI3zz43zV9qvZ6ryVISwI7e9ytao0C6?=
 =?us-ascii?Q?MymHsLW2rV2njIcat5Vt56b1YRVyDFDEnTQVUUGyMKxeL7FPN2D5z0mpqyib?=
 =?us-ascii?Q?nFPIA8lAtAdI4tAxvFToZ+MvmpWVnhHXdZpQo26RhNPhdKf2J1/8f4P33UPu?=
 =?us-ascii?Q?CKr8tDlGUy/XNDQWBnWKaQmjACybgWw0pNSdrVejjFjqR4WlqaEUYF1ARCJw?=
 =?us-ascii?Q?RmPNmFXQEQTDSSEfgmnsSIUGPEGEhjzoLs+aDUiVz1TvP/BKJ46snezKYSYA?=
 =?us-ascii?Q?LtJDl5ZDaqyEQFeNyJ4nhRCO8ZbSWOYxmYCKTEFLHeDb5HkRgjgMzl+jxeDI?=
 =?us-ascii?Q?bhNLxNbucBS2ykS3FBPVwPRu2QXYXSxBTfvp35A8jbbhfrhUyOZhqLYioTdQ?=
 =?us-ascii?Q?cdDiQWhCQ2o446hgVYCCE4JaLdkC3JgBxn2I07eWyjEJEoCbC7EKyo6U5Af3?=
 =?us-ascii?Q?lOMnrXRhan+Q6M1UUfB25fpTkv/Tdg7eKPR4ujGYI+Qe8LZr2UcYVU1IDZvX?=
 =?us-ascii?Q?cnYn2t5xnXWWrXWOkzH50k6lSsWu6YZT3h6ahVo0FLtb+4MMSgEAWTenchkD?=
 =?us-ascii?Q?RD0kK+x00DE2HWcexLn31P3w0wkyUtpQjuRd5JYjkq97ezohkjf3aLrlWui2?=
 =?us-ascii?Q?JiCYuzX27g5CmM+kwq/PkU8mZ1DuZMOrwkvdptkTr+jSIH3f2LERZPdiQp0C?=
 =?us-ascii?Q?PfC3KX6/dZUNM6wqlPpmiLRL6QCGalBulDse?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vofvGIicCb1ySmFXW9sPwbj9M9InYBi6ZPvZ0WKnhfh4RDZgUdqnQCv6LL40?=
 =?us-ascii?Q?bkq+AGd9srm/JDKR89q7dOUjLMTjWFKpPstsBJBeEQlUcDJAxoSIaCNZ1yQg?=
 =?us-ascii?Q?rWNCJetaKrcO7otv253K8QbywYUCUP9l1j1Q2TOVJ9+FefEYDN3NnX/A3z3Q?=
 =?us-ascii?Q?P7GoctTguNx5EmGCFl6PuLjTMP16kuSPG8ytyzrjEGYcPDEorUp8vGa5/mb4?=
 =?us-ascii?Q?qOlPo01FsBSxCwjO06bvD7UMHf2nqJLD2FxQJJJhrbqMYsnjBqAH7xwmqAnR?=
 =?us-ascii?Q?Qg6/RMhxLO3BzyXRsUQ/2P6xI1rGO2/R/O0Qtf6gmwKBsOVeCJQuKnZfOmd9?=
 =?us-ascii?Q?uO6mtngPKN0hutK+ZJzAXmkus2te35ctX1n8Lr0Z3T2u/JmeUSUf2cdjuKVR?=
 =?us-ascii?Q?GU5li8L6Eb1vHY88T9MsfL7bw9wJ1YJFwmQBJCRr0QpYX1EuZUuI6ajVX0PT?=
 =?us-ascii?Q?fUKh0C0BzRK5umk90mViZCkxtBVV0bNwhaXJwVzDOr4ePRc9/EVrspKtdc74?=
 =?us-ascii?Q?mrG7dB8j7Tz+UZUidjmY1WRR9vCr99e2CrojAq7qWfUvFZq595bQYcmIW9Kk?=
 =?us-ascii?Q?w2UlqX++hI+pTVBQFx067fjS182fc34/EJdOb13AOS4rdJaAwGvI4hya6PIi?=
 =?us-ascii?Q?jVLkxlzEHUfD+IlYluRIsLUTZdk6Zad8LHkHhACuqGqBmjaroHpYeQIh36wo?=
 =?us-ascii?Q?w/Gnt+cdjIBPiyNNPMzIyopLoMuQXBAcCmYCwWKTbgSV1ndTDZbCDtiDJN/j?=
 =?us-ascii?Q?MEZuPI9C0MuZRf1dke5B/zH1BTzBOI0pME+yHB9Dq4MRtD8eht82a0mbjaSW?=
 =?us-ascii?Q?yaEb9h40S4aq2DjSX9l//vA8B48zrDijbsLGE4RC/PqCzJES6Z/05mnhhq/u?=
 =?us-ascii?Q?e6Sd/1W75nvOiLvWNU8yuqbX67YL0K4IG/eVSy/F32od9a+E2nAJqkj9kYKA?=
 =?us-ascii?Q?VeB9uzIYU7X/IeoZDLzv41OhaJALFr877mt7LysTVcowY+CQeWsAkX0UNtf5?=
 =?us-ascii?Q?7YOztf4gYJ6TBVC2BWg5D9nuZoFdDUXg7IjYbmdXwxIkNSeaN0KLoZksVjUh?=
 =?us-ascii?Q?XK0rACIpv0tvFf/t57h8ICiepfoj9R8jYNU0aXK9rNOEoKwznn+Wn7lhdWLT?=
 =?us-ascii?Q?3SRyCi/euH59BI+bnHE9Br7axG3bzYkCj8MGi6kfuXDl4GPN48KfgtqpSd1R?=
 =?us-ascii?Q?CGix+SzBNDKjkb4BA0DlL1+2mwwfXc9Bs0SRzgzlsiYgP7mou789AvDAf4OE?=
 =?us-ascii?Q?99Q/2QNKdEiJTlnv/c9QRg+lUzGskzeOr/PV4H19nVceyt3vxdHHXNIvbwCi?=
 =?us-ascii?Q?rEisse3ZEonMM1Bs7oblykzXWP0pWRlDSvo6Ee4aKH0uDGZq7XT+0wBPPvdT?=
 =?us-ascii?Q?nBWlgbTvlN9waDBSiFoBTWhHDBTWrirWVfyY5RA00LQY2gMuOD0ChF+HCDmK?=
 =?us-ascii?Q?0iRVKQ50cAlFekiU2b5VUszZTgAeqVhQB52FhslJiQaKG0Qw/ac0kJK1GBDw?=
 =?us-ascii?Q?yr8Icq6p8k4i1SxkRN3qjOzgqFicDoP3tC+wWU+gBvu+eEcGGJ+Dwar+zNGL?=
 =?us-ascii?Q?YUJB/i8y4tnWue6XKDIJKXqS0iv69qxspMr7yid/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d3e81f-6da0-4cf6-b777-08de0fee5720
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:35:47.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x81+v0qUPdaqSFGIh4ubDOFgaNF8swvvZZxPNarIc/jMBgq0mnk4oR+Ei9uQN7xNUkQWbRPB/dpbthVh15vAXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_083554_376316_50D03065 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, Oct 20, 2025 at 03:11:22PM +0200, Yannic Moog wrote:
> Add 5v regulator to gpio fan node.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> index 9687b4ded8f4c98fe68bcbeedcb5ea03434e27a3..6203e39bc01be476f16f5ac80b6365bce150ae37 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> @@ -31,6 +31,7 @@ fan0: fan {
>  		compatible = "gpio-fan";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_fan>;
> +		fan-supply = <&reg_vcc_5v_sw>;
>  		gpio-fan,speed-map = <0     0
>  				      13000 1>;
>  		gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
>
> --
> 2.51.0
>


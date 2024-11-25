Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE55D58D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KEC8mmgv7sNYTn8usghLRkWJi89iMS+7e0/a6Ob/uA=; b=3lsldV4ymewrBjnGBW5C4H6KHJ
	IxQpON5NwP4CnKIIK6VyqPh29vxvqzgXfeWFhLdF4LrsPNDNEdNUTr2h4SIshr/Y2gNx6x30ErKfk
	na8kL8MJvlG6myW3fiZ1bQhIxNzc5yQQUQM7Q5svUCh7u9hbyeZXr0Id7gWRxfZk8QM+RSbrH+NSh
	umeAqAdTR+JX+ah51AXHTuiexE/V8Hrt2GEFQ9+8aYokEQaaRbZIIX2RgfEt7RdK+EjSbjNBbSl+x
	JHhbgL4RkptD49N/EKM+1xk+QNi5q9oEjfIAVsyuzAh9KlzLsS0P3mqLBhxiX0QY72UL4p8wZ/igU
	7TzlYWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFccv-00000008irW-0hgF;
	Mon, 25 Nov 2024 17:11:57 +0000
Received: from mail-vi1eur05on20611.outbound.protection.outlook.com ([2a01:111:f403:2613::611] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFca4-00000008iLX-3rTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tONTAgnLmIdnPW2H6csfVmOlP1c22LqOJ1PQT6jkfs0BxVPdhfmaUl2mOs+m5UEGUZVOxWB4PNh2LB91SThl6Y+CrMIYy/wQHqceERmlwhe/s5FzsgYamqZMhdufXbx+XD+7s/Y0HZVO3UKsdzCaORe94LNtQQoCAabK05qA+/XWlLUvJsAG7ViQUj+NxmrYkjwEeHvzBOnhyCKoSMN/UAWbnc/1EQI7Z554bFaVKJewBnrx8T/ehpcmtcy0MhTCeJVA/k5vpvvnN/zvHrOxQq4idHxqk+fYqEyCw3ojyVVe65rZBKGb15rRuqtgZ/2x7LGhQM7SK9TcPbTbAOCiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KEC8mmgv7sNYTn8usghLRkWJi89iMS+7e0/a6Ob/uA=;
 b=LxSda7By0jkmv2abCUwtQdA8rMqxULJxx0TOzp1fagYBeqZrxE+qJ03oDiYyzWwuDd1lGjrXQNwJZciEb+YiqBnK4sb10TiW2MiMD1gBn+JvYHGvZPR/JCz24ck5VFFajFv3Vt8Ql7iNaT1u91mTIwTWb+obj099AyRHzbbCT6Al5OLNGuiQCbbwawhcrrqzM4KQS2e5wuNrkNihJkR5ycQg16vm7rqHy7lWhtACzc8h1tJlidrnVl8qMMcODaRQikKz7vXGXydVAtC9GTUfH7bnEO2b7OcpLqq0oxrHmlmZiiRpY+p5XM6xhwv9TOudxxQd7gUjDDL1yg/c/VKNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KEC8mmgv7sNYTn8usghLRkWJi89iMS+7e0/a6Ob/uA=;
 b=cHsTFMeEjUSfKlJT59AVM+/O5Ph1z0AqkdZW+FwWrGhngBlYaJyHP0gxpGYoWj5h6LOzHlXZp2GtM9olMg35QGrl80boW6qNVXjuanVuMQh8OYT3meLiS1RGHCSYuFJzGENkcA484a3dZo/3g0koz8tCVk64ZxmVOhnseyL+FC1phQX+ZQjBxA9fIWszCrkWecgnDJO4KT7EfIDVrwLdG9mXI7XjoUG1ZIQBCDdYwRZ7LtkgsBBao/ln3ueM80eCFs57kYj32rgycfyi8rxHJdR32tqfxPQXnI1vABUJIZaowU/FvGIVZgDNMp5wQpWfxZx6Dyf39X3vWS0Lhi5hew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 17:08:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:08:55 +0000
Date: Mon, 25 Nov 2024 12:08:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com, daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
Message-ID: <Z0SvF2tQR14jrHet@lizhi-Precision-Tower-5810>
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-5-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125152427.136883-5-daniel.baluta@nxp.com>
X-ClientProxiedBy: RO2P215CA0038.LAMP215.PROD.OUTLOOK.COM (2603:10d6:10:d::7)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: cd072e92-2552-4e92-4d72-08dd0d73d7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b17MQrnxtGjW7jWMj83uo+pzVW6U/VerA0+juVLnYssxhlzS6xDrzChjJ0Oh?=
 =?us-ascii?Q?WIh5tDyBoAti7MEE3GCb4wMit9Ngyh1xE4red+Ph80Qd36q/nsNGwli0GVET?=
 =?us-ascii?Q?mAFNkAO99DjJ44upDm7DZ6h8NC8SjEYCBDWylD80uG8uUYke/l3UOuAHNvSR?=
 =?us-ascii?Q?lP39i+AWutTT4oQpLd14yOjOHbAWOl4BerbfxHWFAZVigTXdvYbmzKIh2oS1?=
 =?us-ascii?Q?t8WmP4UlE1Z84halNYNRBBeMblbAmNvCaWQG4XGk19njBTafYtiZ02j79pTh?=
 =?us-ascii?Q?ZhX9IgqLUszt+Mu5pjYWKyO5FID9fsbc05Ctawg1VgD1cqUsVUIhOWYApy8d?=
 =?us-ascii?Q?HbecycJUOZojbzgPBoGSfXY/MlrPxx9FyrraPV3nSWciuAVMnFHdY43g+dpd?=
 =?us-ascii?Q?3ty5hqguKheX8eXhYOwkckB+FZoEtdzV8abUmKLTp0RFLHHVZtIQ7xrrwFR0?=
 =?us-ascii?Q?Fh+129AD/noUvS8tiryyQiJR9ANqozHDSPM103GbdESDgY4FUIebW7blWjMV?=
 =?us-ascii?Q?Pfyi1v9GjvWwDghEg6V3VYL8XPJXmxJSeuJ/P5YRW6IKMkvyR3uTdgqjzwIA?=
 =?us-ascii?Q?QdMJuMuWy0zHq6+ndYcc1BLKu3bNjQWuOCzn64DUmsN6eMR7n8w7oZrzfwwI?=
 =?us-ascii?Q?W2YuJqpb+Fp1Hl3+brobTglmS4cdJ2nMAlvnQShqv/9CmEE4lIr9k/I1mBDG?=
 =?us-ascii?Q?eE3DBkzcVEHcUWebEWfP6fxPcy5bxYKykRcoQFg43Y53tJqIfTc3WeG7zEk2?=
 =?us-ascii?Q?lLu6jYGNNMhjVEsjdsa5NS9BGLCFgM1yeG3nVMi8jEiXLeB/MtZEHJ46D6VL?=
 =?us-ascii?Q?CxNKDk8i4bU14FQ5M7ltHj8+v2WugZ9TUyDtAg5rYrGg+0In6pVPskIWfw/7?=
 =?us-ascii?Q?WBufOE6pM+ZvDPt/8EvxOxQeDRyKq+k597hmz48SfsMw5cRJCaRtoxqLDsCL?=
 =?us-ascii?Q?46S9VGoXAaT9Q+WvGCkNijsdTPETPYCRNq9FxGkYbigB4PCbWwRFxXY8qYPz?=
 =?us-ascii?Q?cQb4yaRZ/uJh9sYsSyRtYmP0AteinVNVB5/5mwbwrVVZHSbxVnUeo1U8gVQV?=
 =?us-ascii?Q?EEGtD55jBazwfPt+RPqy6TvHHeNTNWK2Lr81iLgTB5gJWcnq0V42H0dpo4Ai?=
 =?us-ascii?Q?72fG2Ks1oSfkz183obvULk4jksLxrktZ25J7BzMJ+zj44uQmg1eGidwquE8M?=
 =?us-ascii?Q?Pd7DFkgvJEADG0/sTCX07ZZXTHHBgm5mJbCkdUpVGndZ1mytaJjLzA/A7zDJ?=
 =?us-ascii?Q?IpF5t5XFIaqQNqCq5vYV4Rb6FQRtLVKREllIaqN7ymBKb54jwWtVKuBj/Wp2?=
 =?us-ascii?Q?WAGxCqMpzsdKMA14slegQhAoQ5bdUtrlFLMhXnTvsvbjpWkFGgNTIWsqbf90?=
 =?us-ascii?Q?Y6nB2uGGvZmiASEwNunebs/24VWfz6oiRY4DCoPiHMUbpVJC2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xabxd1rFqaD8stDAZcpL1B6pdKGlsqXG+Vr1sJOS6h0ymEtqVZgC2reTAiIs?=
 =?us-ascii?Q?GULouURwoQIfOUfKMkAEu87FwSFh3GZaAuMSP3gXOaB7a999GYskiw9yw+CK?=
 =?us-ascii?Q?BLbPuHw31VaAwniPr8lWK+AOE9zowOEgvf7hMOc9AZmb1lR0CoFVbDuwoQ+z?=
 =?us-ascii?Q?NB0mYjhUQwnqvpWLOjmMDVvwVHxcPXS6xhUeE3qQ9dlYkaT+X2D5CkleUwOK?=
 =?us-ascii?Q?J5WsNuTdj5Z3NnpfvbLGkfT4PzRusMwm2pcAWkZjuOBqXMw55QqvZT7fnUY+?=
 =?us-ascii?Q?5T655HW/0YyLaFqzlEBVAeuetfQokRNfIYhUykd8l+nYCUxfWpZTrn/LLroh?=
 =?us-ascii?Q?ilYWt6IaVSfjX0ZfoxNgfO3H3fRdOQD2KMuvQlt+LuTrBh8UU/qhKgl7Ctmn?=
 =?us-ascii?Q?d0XRuQjSDnD3tlst4TWF7rELVfZb7NebVCktgvGF3d77yHnP98FZY3JIKWAI?=
 =?us-ascii?Q?c5lVmcIrTWgb1+14WA7Y8Ux+91fCXiYZsuQWKuq/PENsQ2oALGDVLFQOwBS9?=
 =?us-ascii?Q?znTjyFAuX/OcJqppPkNveCBmykLdlzzniu/QEboji91e9uLJ6wvEnTYr4sKJ?=
 =?us-ascii?Q?TQ50A2YtS0eXBneCIGr92hAG0A4ulHqoHlp0g+AstvDVzZSZKyo6ktH+N9Sm?=
 =?us-ascii?Q?zjUn+TmkUbH2xCT3NKKNlT9nNYmSs7m3FgqQ17SAlJBU4RwvI0+ZvoqwM6v+?=
 =?us-ascii?Q?SNfnZjkyQRlJ3tuBSf/Q/G2e79m957vSDgx7wrNM7nzEucsb0jfJi+Iwceqs?=
 =?us-ascii?Q?zdGxUsy7/B/IfgSOI3wXkjBFDvEfoW45+60IOy9WOIp2IZDlE2d2LQykPhq7?=
 =?us-ascii?Q?SXZiVSPR8ucKfZS8xkttCSZ6Tcg95fgWXucRxHX/dTj2QS6rBHOZNX836xmZ?=
 =?us-ascii?Q?uosgKzFtYF5tVQOY54W799PIMGG5taqWkaEjsq33U3WiyKJ7shZfuWRTEIqm?=
 =?us-ascii?Q?+00Aky1C4ShUJqfs1gTVwYs0h2tewFAG/ds37Ou1wfHeboowsf6KTMksh1Ru?=
 =?us-ascii?Q?mbCj+MIofsnPHezyMGe9Fs+8b8tN8Etc6+4tewul2UuSFYq9vvUaW/bzKyu1?=
 =?us-ascii?Q?7Cg1NJpao4Apomy48ojW7s4oxqBUdSl2eHr/EeXKICxdbVEn3HapdHDKEJNv?=
 =?us-ascii?Q?GnPW+qtDjRwsnOv+BQLu3YLoqLvaQNvFIJxddaS0OMDiRXjQkydJP36ilk5I?=
 =?us-ascii?Q?bkIQKKRCVApSYUzbepHZpxylWKqUTY5XP+chK9NrBd9+b+WOawNY0CyJcZEa?=
 =?us-ascii?Q?+ySmBB8/0CBWkwH5uq8RH604o0rmfkmatfDUCrbLKRF91IV0MfY1PMihyBj7?=
 =?us-ascii?Q?pNB1QUctn38Z7nFK9z18WNy8oQnNLlnFENygkmLX5eHF55cizk/tEuHHOKjQ?=
 =?us-ascii?Q?R7euaMlJmCbfee2PidCLqamiiZwrNu7wv6XBLzBaKZ/aKnTvlorfNMq3R6+9?=
 =?us-ascii?Q?/L3640A8BqFbX9MkyqjgjoxA4hUzLG1NfR01ILu1sN81N54/thx5tPfh4+MC?=
 =?us-ascii?Q?0pKkIB+d7dJBtyHuXmKOI6pWjSHplPaPMzXWLN0H6bCPL0gOSwxVIAxYCwDH?=
 =?us-ascii?Q?511nRjx2fyrpHLkIhAE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd072e92-2552-4e92-4d72-08dd0d73d7a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:08:54.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsZQTl+SUuwT75e5TvA29CIIhMbvJ69zHL+RELxncEEOKVFcne4f+6Elxz7apH0pvMmqRfsJKyAiaAvH7x5bJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_090900_958909_79D3053E 
X-CRM114-Status: GOOD (  18.74  )
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

On Mon, Nov 25, 2024 at 05:24:24PM +0200, Daniel Baluta wrote:
> imx8mp audiomix contains a set of registers used to control
> the DSP.
>
> The dsp will use this to acquire o reference to audiomix registers
> and handle the registers to control the dsp.

Look like this is NOT good method to direct operate these register. If it
is reset, you should export it as reset interface. If it is clock, you
should export it as clock interface.

Frank

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> index 6588a17a7d9a..f368682f3633 100644
> --- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -15,7 +15,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: fsl,imx8mp-audio-blk-ctrl
> +    items:
> +      - const: fsl,imx8mp-audio-blk-ctrl
> +      - const: syscon
>
>    reg:
>      maxItems: 1
> --
> 2.43.0
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F40CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhsjYC4bErXlkoK6kHA+E91p5h/NIBNG8h0Q82A6DhQ=; b=QB1cRuQDVlVihaz9ul++zHeYmi
	cMyO/F4CmpQ4hWxXvqawEHsv432MQnmdkM+H35LwdB6qfonA21yOXr5sAnY0CZFXV7S0R764sQ2/D
	EHg/jS//mG/7sBgH/kjxNMhNbU9zK6S4smKrV33Xaqjdu/gdy8A5koCSL3Io2LmbWQFb4KCw8BwVO
	DIzOcKT9A4IBIG3HEd1ETOdLbVF63tjjHRhAs/o5dBGVSvFFLgYnB5KNC+/jAfMm323WkLYfOqHM7
	uNOVMIF3znLD7PL8wSw3YV8U5iwa6hyRBIHmXx5wFXTYKVhBNSk+HLEJQxH0z1lXi5TaWeUeA/9bE
	gdhhW40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uAf-0000000B5TT-4BRK;
	Thu, 10 Apr 2025 15:50:30 +0000
Received: from mail-db5eur02on20607.outbound.protection.outlook.com ([2a01:111:f403:2608::607] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tIX-0000000Av37-3F5K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 14:54:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/FHcAJ7JMXAKe845BCKGEVN1SbfsRrILNwbMgcghbOFz0nq8o/uRiwMlKEViC523WQvXaKzWlme3/1Z+QqU+CHofz/Jxb18PzeDprt04MEN4R1JSxEfdmJyX8P+SYYgEmeC+2IPKcV2IyKn5R729aXsHNQdV5NYu7RGWTpcYOjOGRwhpEO9kHETn6yaBOZPCeZ5NV3MnUJ5wZjhkaP2HjUHPUCFPgYXSkelWz8uQDHjrJ1BJI8/5YF0Hs51/G4T0YAlnQAKnDxK7CCpWk2eYyzeThof7TGZsnxpCP+1y4/uVVC42da0MWmMk2mqSOUYF1EZM9giNKCM1kWxlMyQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhsjYC4bErXlkoK6kHA+E91p5h/NIBNG8h0Q82A6DhQ=;
 b=p7VEgzaHEbbJQnhXsOyGOv6w3/XFuEzTuLuUT2wxcUYg90EckIbJs/aJDWAYd+KMbc/gT19eplew3Cgu3+VoricePz15Mi/QeMSkuObEuxkKaU5EB6kF/rDGnaP/ERNkqMJkZFw0UsF0PvDVhqtOrw1X+/3ZZFlllpRwBsmoSTXC7sjXtpI+M69mr7rWvuxfcvI7cY/cczLDyLhhzo72byLhKfRGiWC1BBrG4DbuSD2glpUJlNIFaIIgsHbLo65w2vQWrhvMxIJljMYHBj4x2StpXYutlNcUq3UjKq0Muyz9TaPclsyupVfxGIgGfkphbUrV1I6xEZyqASqgTCG7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhsjYC4bErXlkoK6kHA+E91p5h/NIBNG8h0Q82A6DhQ=;
 b=jO7wZblapM6N/MAPfZTNpC5Oy5Z0ieWebxOs8ts4VcgVuL1B6FJI4SdU91mFP/fXAj7t3UOjlJyghLvCY6n9FLog68YtCBHjtZBu5tMR8+fXGID2bG2nwjdD47k/13TO+g2sUU2qC9rHJuFZqS73AVayuRKqTZWldfk1pIYvEgvgJr5XJoVEuLupyAmqFEVrUmktxTfl0WGy3N1fQHgiLMhWzq/qF/PP2xEvVjC7PPvrdTzZAIWcCatoGreTuyeCSCEgL97q+o7+clNnl2t691JyC3I8y6ySzfu/MDSwSFspcr+W8I5IyJ1f0RmhaP494fY08tCvbJqU0aLfsQg5qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6804.eurprd04.prod.outlook.com (2603:10a6:208:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.39; Thu, 10 Apr
 2025 14:54:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:54:31 +0000
Date: Thu, 10 Apr 2025 10:54:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 02/13] arm64: dts: freescale: imx93-phycore-som: Add
 EEPROM support
Message-ID: <Z/fbnsQNtLly5uok@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-3-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-3-primoz.fiser@norik.com>
X-ClientProxiedBy: BYAPR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8b1547-3f3f-4cc6-3d0f-08dd783f9978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9QsmRrpxSZGaUQXUvojKTFry9YdWieLsbNwnBtQ+nqjq2xAgvkJZZ/IpsOUI?=
 =?us-ascii?Q?AkUtumUtdeXpDUgjomlt+Mfp7wByFX7G5F9+nmQzeumRAtqkh2BeIcnFMehI?=
 =?us-ascii?Q?4c3L7zPpQJ3faQK2D/KmK/5SenuVTtuNugTxvEBaxB5s74OmX1HrZL5KYnGc?=
 =?us-ascii?Q?zCnLvfEIvNkdkztAqGgGMxqiZgxmn7lRm4BLVYu0P2z3DagZ4KZvRlAYpXh+?=
 =?us-ascii?Q?TtpPbxvcxBsQzuyENUB/Zm8UgFtFcn6Yqa+nLN+J64naqI3XoFFXwAxo8Thf?=
 =?us-ascii?Q?mMR+6MXEg/2/jRshDVJxEmgqMbkcvCQO0GyBJVD6zFPHf5Rn9ZNW5YvSIVjH?=
 =?us-ascii?Q?MVAcy90LN87Dq9p9t7UrAPt+J9BI20gmSgOk+1aLqYqKrWGgXNlsk3Bzy1VJ?=
 =?us-ascii?Q?X+iK1gLF5ReDLcsRkJRDgiWZKpPonJVTMBBfzSVkip+/5JZTz4rUgDNOmc+W?=
 =?us-ascii?Q?/y7FUFFb5h/4VZNcNYvOKxbHMwtWNEDlIautOXNeXozZRMWxPwyTN0KMlJUf?=
 =?us-ascii?Q?haN3Ed7FjC2boEw40wf59ArhkkLO01Wb0C6gN7Yq+hwiZH0MlT9bj+lsLYbm?=
 =?us-ascii?Q?pFKZWBZe0H5zKpuyVH9Oi7mrvGN4Zd2An7wwQ6DmQmWAsGN98XQXOUiyvVX9?=
 =?us-ascii?Q?eZrU/8uuCdu6hp6BO/eHoHzWEe4WZRVQzUM1Nswosvizwbm/l2EWrAPofxxt?=
 =?us-ascii?Q?zGz+5/Flse1PHdlUWM771SE8NZ/wwUG8rc1Z65cjSyDGiC4J+ZcU/BDiAunw?=
 =?us-ascii?Q?DfMrUx7rysZJcOaN45M94g9doewQKichl1WTvIIx1Seqlq8RYdvWp3rBuZzR?=
 =?us-ascii?Q?1AkHNOPk5uJaRSZWGQz+dXcUPs+1az77VtZk5b+gSyBq5bWfwnWcSYCC9YUs?=
 =?us-ascii?Q?oRQGNMME+1ojZjB2FhD1gAJrVLMyI91cZxxpiVwRel3PH+CSBchPpNivk7ZY?=
 =?us-ascii?Q?Q0xdHapP8/oyWxFetK9HK2bPFz98nQ+381o0F3NyEUyTskUCuPji8wmq4t1r?=
 =?us-ascii?Q?oNuTmZU/VT0hd5sg9S43xlFGsrsUDMkhm4f9vSWO+v7E3vUOadVlMs14DXmW?=
 =?us-ascii?Q?WTPxUX8pf0wTbPDY6GC+qk1Q+PtpAIxKE138m5ePO1ru+KHRSf9QbBKeXC2S?=
 =?us-ascii?Q?j8BGT+/F4m8inVb/L3lELkLOcQ+epvCuV93JAzfTY1o/9rdmtbxsljQGOGX3?=
 =?us-ascii?Q?38OWk6DoQcetpE+KkzcDiPGaHQfNBEuUm4Fji25OkSyUUdA5arSBlSB/wIcz?=
 =?us-ascii?Q?9Q8VHCqS49ya8qpXA7gCeclXQix5XQDcjcjiWW6wiqs7ErS5SQkTy/DaSmbD?=
 =?us-ascii?Q?/5v1Ycagy/DMuqNfBWlrA0CA822vdVpuyFPs186q/8X/VJ1JV6Yp+1T9xEsi?=
 =?us-ascii?Q?ail/T5HYGPAL5l8ikK0r5iKoTvOktnlek3bA/X/tnFlldwXpJ9UFqZSp56ZN?=
 =?us-ascii?Q?QFQbujGEpFM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vZ92iCaeLi0YoToMbl2n/g4K5ahAbB+B0CjgjHEvdL3TY4uUF/4DvhuhJjKR?=
 =?us-ascii?Q?An521pqYRXP7x72CK/McuuBDlTI7ycwTfMM/fN8lF7i43hizg00h9t72L1/Z?=
 =?us-ascii?Q?x/S4mdhV7fnmPWj+fAamOwB0uwjcGgL+7+Xfs4TUVYxd4RlVbkTHSrdICeaq?=
 =?us-ascii?Q?I+sVFoHyRVvG+Hs0ze8WtBVmwTUAS3xuKMkRQcAmvYlsoPDlDk6iRHqejy/Y?=
 =?us-ascii?Q?gYO10MJhRs9Id2e7aW4xS9wVwTw0M5qCmFxjT+mUiw+joBRNavHQ+gLbM581?=
 =?us-ascii?Q?kWZJEpQAeuCEbsx3V8bbZw8zFlELoAJ0IivBG7RLeFBFd9foxSB8EQe2tvha?=
 =?us-ascii?Q?5N3nO91Shwgut4dN6gq9DFnrP836xrQdWWKFyAw+kwYPeTknmSpPzQhtsy9e?=
 =?us-ascii?Q?Q5PkM+xpC1BAg40MpzvspZsReokUvSsPZ8oWNoCiMifgX4bA+IWBTF5ITokn?=
 =?us-ascii?Q?qRLQvyR4Ju0lyzH3/xYEUlnp5Pb07wf5Z7yevGne9n5vFEJV9Btv3N6+QoPJ?=
 =?us-ascii?Q?nBlbFdiyXu8ytlsoIo/6O9ddvpquk5+ize7E2Wuht9Y2XLz03kdprFi9+mqS?=
 =?us-ascii?Q?MKecKN7R+KMWXf3kyuIyZ793ABgsv5oZQcn/DzBw3My09dzc37sEcY4Uw0lT?=
 =?us-ascii?Q?a87PNtYfsw9Uusp3+kiljFkoT3Ebk52jIffhitYDQcgCqRwP+hyqTfkzbQw4?=
 =?us-ascii?Q?RLE/grNLljU8Hh5y0lQMFNouAtiryP/gczdf95jVkjItadrqhDuwOtOc7krN?=
 =?us-ascii?Q?oQ3qcloPecHtET45aaaIj/dF5aEGS92pxjr/mIhnuI64ugTFjcrzWq8ECStj?=
 =?us-ascii?Q?+/AxqzDSqu8ANvQmS87UeWaz1AHkP7bXlHJ4huTjJU9C2rNIvrMVSQJOlC+I?=
 =?us-ascii?Q?TwJfDCZicnNM/25uzTFl5ch3DFdzGnfnO6uL/bh97x2ks2142RKddH6+K+Rv?=
 =?us-ascii?Q?eozmRuGE3dMQdztGuWftMILg0fqYfAHjEvGXcqtUSB6Dv8ZE+ORWAz8PeAuS?=
 =?us-ascii?Q?XVqtKFW56pK4e9sZIUC0oTU9Fc9At7Lvry6JLBNz9+eJ4aW+zQPJRNYluGml?=
 =?us-ascii?Q?8AuGL6YV5E5XwLoSX2mYpauKVxfsrSLPgFS21+AHUBuqZVLkLtqRrqxpwPTj?=
 =?us-ascii?Q?f1gLyetgz+2zW2pNFAGXS1n7DDB7Wdd5sMlLYCZHBOZHLeciLojX3BitAS1W?=
 =?us-ascii?Q?WmodwJdzTMLDEKh2/QQgD6lfUjIcPuEFG10EK3N7jLyFl6PuyrCx/ksTXe4W?=
 =?us-ascii?Q?2KxjVqoq6pSflPUh/ZEcFGsnnoCRzyMzzJRbNs4v00NT2NgUcabchitHDns2?=
 =?us-ascii?Q?drPIGSoZj5nHnxBaNm0oAXz00NF4xhHvsEd1lootjfIPnZwsSAqfijya3li3?=
 =?us-ascii?Q?DVmUmmvd8XuQ7F/dtqrUBU5IuxcBCaIxYo93Zfvfj25I7ifEeMQLpM7xjVvd?=
 =?us-ascii?Q?AF3at/1pL0fNjGHvsnTb4KLJC8LgV3ficNPgGQsCaWsFBLtRPKN/NQ6xBiqt?=
 =?us-ascii?Q?X8i2HxOxASYOyEYOdSWNP0Ncz71KuRkmNyEKEo53PM9aqRdFLaIwU1VrE4LM?=
 =?us-ascii?Q?luj+TQ6pX8z0giyVgav81N/AHkEZJewpBDdDL1NG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8b1547-3f3f-4cc6-3d0f-08dd783f9978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:54:31.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzmiNc1IfgU2op6UnNQog+QVie4WxMlI0J1MG0Hb0pHd08k+4bNnPuRmHF2yKOPTz0jeEi7aOKYTZBtj6KJTtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075433_815679_624DB4B8 
X-CRM114-Status: GOOD (  15.97  )
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

On Thu, Apr 10, 2025 at 11:02:40AM +0200, Primoz Fiser wrote:
> Add support for the EEPROM chip available on I2C3 bus (address 0x50),
> used for the PHYTEC SOM detection.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 507a71f9294b..442ee067a047 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -154,6 +154,14 @@ ldo5: LDO5 {
>  			};
>  		};
>  	};
> +
> +	/* EEPROM */
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		pagesize = <32>;
> +		reg = <0x50>;

reg should be second property, move it ahead pagesize.

Frank
> +		vcc-supply = <&buck4>;
> +	};
>  };
>
>  /* eMMC */
> --
> 2.34.1
>


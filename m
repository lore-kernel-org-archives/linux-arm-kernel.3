Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF677C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JMJPWT5sAbn1eVNLnMArnmkb1w3D1mo7DTtvJRXonQ=; b=vFTeioIjHx+tSPjX1aAjEjkgq3
	+fOJ4ZXxvBN8dHzvmhiAngPGKDRGH9mhs/N0fERX8UNivt6WLbxeJzb1UJ22MjZIpe567ahyf1E0u
	GPSqBbooFKLlrWXy4P/18EBFW55pLH38XKNPJKmGe57+JksiqtS4bnZA/NkZP+qSzOzmzM04KgTOm
	TcPwK1ECXwEZYSNwDOsaarToxMud1GcEE2nlUkIuwLVtYP7ApGI7aPb8I9B7iiaTB6iPs2jHBrjWO
	DccEWptd31mQ4UBHxdlNe/5ADNrI6phJfhR+QKkI5CIcTp7A7uFcF5ixbXhK2x6+NJNDvnZC5VxNj
	PpXzFHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jy9-00000005Tap-0TSe;
	Mon, 28 Apr 2025 08:36:05 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jmc-00000005Pg4-2uwE;
	Mon, 28 Apr 2025 08:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZKjNZHeFPvmL4aBZEQvBQN1OTDapYbFDKDMD+vXxYj8vLHSe7rQEqvjW7MSvGY2kBz0yjV0powjkYQ9F03qE0xUs2AIVKAnWUvk4FThlrxAfXLBYHgqRz5sr67uBVVD84MxK+1yKzUqLxO6sfhUPNHOL+/Qh4gsMD3jp3hS9hzmBHaAXn/eu5O2LoAn24psArLsrsD4Mj/JRcboAlRsJn2km4mp1v2gwVgXyeAtEV8K15suDXGWqCQCODIQ0UZ3WH2f2bxF7rKFemsqgDn4bjqC4L2OiTJymAM3HC6jRYGTDtyEUbdq35hR8VVIpKoTuEIrTmDacxDZse0gwdDf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JMJPWT5sAbn1eVNLnMArnmkb1w3D1mo7DTtvJRXonQ=;
 b=LGk2xmR7/1+lfZEwKFy+ElHmJJV+evKtdUnCLEKC8mcpP4YGTYQ7kNfQud/cKcZb20vG37f9FEQn9mIsFsvYlEVua542B4pVZugu6mZS0ktORAFfItuftIk3cO7lsvHpHLA9il+QoPSEijMzrcPtIx5slT8TM91v+LTg91fZ+Yx8WBwIrI5c7ruFmQQYIQ54Bb63hBnt7tPopPXDeIyaTf6PtuQk2u6uZjQW9ETurhBIkTxwgwC7S9LzawSXahFdqsMvhxGMn9Vb0M63RlFeco1MDzSySDjyVzi0lcSIiEeZC/P/sQYhOc1H/sYjbi+nedOGp2ckLEMDTvo9VFy48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JMJPWT5sAbn1eVNLnMArnmkb1w3D1mo7DTtvJRXonQ=;
 b=Aie21RrEk+CmfUuHUnuokx+PNqk9Wz548snoj3l8p7Gr5aDG4emA4hfIvuKB3W6N78eOqOqN8UYFniCOuhX9waQRd0Sxir3U+iq3nkoLeR8QR+JpculKRInskT8o4/R7PB3V05d2xFJiZOD/JlwArSDz1o8rHX3gUXV93k7J4823z4HBB+TP4VMftHXxpPKpdKZ2cRsnQFukhta6jdz8GwmmLZ3LeSyPwFKoAJ7rGdsMEVmZy0mj1os+vTV31zyiTf90ckoq7aSTGVnCC7sgqTXGZ9SLS9TqnhpSFeBiEnaA4pQmFB8ipo8yVGDU9mbcAAtsiodxZLePS4v5fzYjQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB10029.eurprd04.prod.outlook.com (2603:10a6:102:380::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 08:24:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:23:59 +0000
Date: Mon, 28 Apr 2025 16:20:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250428082002.gd275e2rqollatcj@hippo>
References: <20250423094607.1029429-1-xu.yang_2@nxp.com>
 <20250428-thankful-observant-trogon-a5a003@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-thankful-observant-trogon-a5a003@kuoka>
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB10029:EE_
X-MS-Office365-Filtering-Correlation-Id: f70bb409-3877-4564-45e5-08dd862e06bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KaNQVBWhV40sYLXN1WfYQr3kHKiYQhy8KuNZNrfVzl4F1t9Xlg1kF4ZyKvUL?=
 =?us-ascii?Q?HpqSnX3ftdjgQrY8piZmk/NE/K7nslV4BF3dg0gEIoSJ0Iqk1HIvTZtE1J2Y?=
 =?us-ascii?Q?Mp9DjaX6pI7SIorqjgSJkeurH7j4TPEOabg8GTQ+2clSPR4XQvUzHxVbO+xj?=
 =?us-ascii?Q?5TE4k6vGJCzOgN+sX0P2vHc+nxPP3EsBsVBcSrHhlr2w19bXFmdZfIUharX2?=
 =?us-ascii?Q?q6Wy4gV0zWKTQqQNRpX18uaCMtkwAbYxtE2JZSPtCIGtDNO3NfNJ54oPquwJ?=
 =?us-ascii?Q?PIjDJGFLLTk9Pr0rSr9asXWEm4/JnW+TDR/Y1oxCTysfD+tYA6jZz0CShYyP?=
 =?us-ascii?Q?e4fhjkTbKRkLBevLQpPlTPnQIIsDUqDEVOdDpZdmypH4YQGRaEKNKqwCh+Gy?=
 =?us-ascii?Q?PfMWPAYe1RG2K68PPJ/FUT9YMpx42aRHJ4uqzH1Glth+AOlUy5RqUq0BVV/V?=
 =?us-ascii?Q?Kqx6Wrljanjl5YFD1cUF/6ePUtdjoe2bbXhaw9WjmTGpgoQaLzXvsaY2s01W?=
 =?us-ascii?Q?IcPFwa6ISY9ekOWyt2/ehFIYv0CC7tv1xhnDaWtQQifuFRyOvW0DmALA88ew?=
 =?us-ascii?Q?OVC0Ft+60FiqlopIXE/Cz9vjGiHkXKlBk+5YH7pWaq+YWSsKBj29JUoX81wT?=
 =?us-ascii?Q?yi/M8FdzLvB6fzIn7iORMbu9dr/hMm9YWfVVK79wfwnyjhz0WPe1fjUzjf+Q?=
 =?us-ascii?Q?l91W6+BHDFbsTxsEyBZK+u7G3/rErCiNmNLAOlcrc2c7PbKz5O5lK27P+OeD?=
 =?us-ascii?Q?fNGLvzOGWT04qeUbcUtFsPBWZBzNaJwIo0283+HPtQEPiGjpfHjYYKdhoZ6s?=
 =?us-ascii?Q?ZbjouCCllaZPFXnOcdaKCi3bsPQHe+sMQgzTIem2G7Vm0c47P4AZh2/ZWO3E?=
 =?us-ascii?Q?ayys9fbEYwi+hRv9cvioDW/CtGrxradzJ9M9O+OMuO3Hc+TRnzfiOJf7FfWT?=
 =?us-ascii?Q?Db+jW4lb75i9Y817Y805e21EvibZIHbKSWrxDav93Z9oGGSIvAL3XsftQZIo?=
 =?us-ascii?Q?bXsYLodDOkKh++eQRa9778sFz2NPwTFNC2bYB5VLt+WTn9nqLkaLlS3fWhOu?=
 =?us-ascii?Q?vuNN3WsPxpzAfVIScUbW87lXEvWQhh/K4gVG2nXGMRNdHlG+d+CzEvQQDxKR?=
 =?us-ascii?Q?gf5W+WwTvto4DQr/dhi116AVdkJkvUdjuKFS2rB2Q7aSObEt9xcKuFfwsYG0?=
 =?us-ascii?Q?Rv7qtP2CqMCSJF8EUvW56CfWtEwEAh49IK697sHcFkOdsREgKBtq3GrYnJrk?=
 =?us-ascii?Q?rmj0eHrxw2DXZExQlN0Jta+N8M+N/Sdw22LUawGw7N19RsviR6qH5JF4VjjY?=
 =?us-ascii?Q?ePLqWALrPi5z0M4C1qUIpByGi3wDElao52fUKRc8/fxGHFxkWS+5maHyUzuB?=
 =?us-ascii?Q?BSf16EXOh2fn9Z5IvaXh9PdjThXycg7tjZo2tCqUZDjGkAG54A5Tte4v3+gz?=
 =?us-ascii?Q?6jwLr2jmb6xi4ETgdnrlfMl8iYHSed3SbjKIItRXSnEaFZ9SD9Nodg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v+QhodC9EPjRVULs1njNiaQDQgmELEz3rFUzf1EO0WxRNwtiUaeXmDqe244o?=
 =?us-ascii?Q?b7UDsJDG0WjL6zq3e6Gz/KgHcSaDElOMuajl3zSFmnXJTmRbteOGCZkSaHcb?=
 =?us-ascii?Q?OyxpqYsquNP9v4RfAXF7035fzowm/SLtD5nI+6KKQHYjnCwL7GuzkYx+1u/h?=
 =?us-ascii?Q?4PhgIJpZkyk5zY5KXWUIJhcGiHL5idtgXC02+de7GuFgf+yqywICmsVlEF9C?=
 =?us-ascii?Q?9mDIc6YHKyy/TlcTPT8lI4cyH1ucaiA1GZTbmofXsIYx+o8eamUO+373JR3V?=
 =?us-ascii?Q?o3055JRvyN5S5IKiZGWOjCOT4ajbcFhhIaS5/iyHw1B/H0EFL8L5ypNnsBh6?=
 =?us-ascii?Q?CFPONCddV0PjAqwG8AxlX9KkvdgI58Om8Yr0XLlpdDdx8P28ozEzGavsPhjO?=
 =?us-ascii?Q?yC4NTL/C2hDN6RVFNbWVXTIMkgRAJNNClKPHXShFgPASnJ6DJYRkYaZcDlhk?=
 =?us-ascii?Q?QXKWeIOb8r/XmzFKWeehbTrNFYYm3dxGP9qkP8hJDdGAPL9RNjDS1N4qa4S0?=
 =?us-ascii?Q?Uuk/vuzbcYyrKetB60rQ7rTl0O6IYQRAPIXZPj7rPXel4Rc68eAkSuAgEqu+?=
 =?us-ascii?Q?PLWJ1x+Itwa5GPBTbiHe6rXdcAkB4LsjLiTJfMqCwXdT4AKjhtJxiT4rvz/6?=
 =?us-ascii?Q?WN04+epgvitSdTk7JR9gIfrPCYIZP3dZoFLBDvtZ+2eNJcozIKO4kcr3E3fs?=
 =?us-ascii?Q?OFBSF4GWAa5XnApLME72tGYYH/NkUUiOy/ZJWOK85Fww05pyH60x0pFVmc3j?=
 =?us-ascii?Q?S2qw5F0DNPRvxdYviq5gzLyF/H3mL9mlSQnuAfU39Cea37aJyL6L0EaXBiYB?=
 =?us-ascii?Q?MZzGzqRbfsj09e6Iz3LRw2/8wRQDgmvadG1mebUsJh+vjfY6MI7I9BdBZuLo?=
 =?us-ascii?Q?pFPVv3b8mPrN6HKProxkJQsgSwoL8yjvZp9pot4xYspyYaIHH4rBLRWJdHkn?=
 =?us-ascii?Q?J77N0VaYyVlsSShx5REZfPUQVx66jVzjX1pISbrx9FTEKlZMB50aOr60V6D9?=
 =?us-ascii?Q?h4lGOrQY2yP9wsiU5Sgo+PSQlSarQfesa87cqDzKk9O3JyUx2fX6KqfhbYhO?=
 =?us-ascii?Q?ZP+B9RBckUOrjtW7o+vuaIz2mizmJlarKgzM7R3b+hj9iSIQCNelaabZzcxK?=
 =?us-ascii?Q?0YkTnuErCgWHnJlit7yisXp3yOMvpvXjczAiwvE4SzkyN1cOiom6Z/16lPze?=
 =?us-ascii?Q?su+YTQzRr0V5+9YNahew6kVI9JPKDUQmch2blmj6ykoDAY7+Rl1Vaqfpp1Bm?=
 =?us-ascii?Q?NOG7HOrV7/HX3v9X2PBzFfpxsNkroyokJY+q6fRlmDSMnObknsYPKznowiJh?=
 =?us-ascii?Q?W3r4NjU0JWadbTOoiHI7gmQpWZ+ReasWQc1TI1xvA3eZNlN4FfVRtHjVXyr3?=
 =?us-ascii?Q?N9zjKQQpvXudLwOu9humQ06jF0U6m+eIknYPCiFTfuBRi1sQCrW3hQajjewO?=
 =?us-ascii?Q?zB86WOX3z+nXafCZLpn3KK3yYGQeflz0ClOD3PFKM+daP85WDMvGc4uEXApm?=
 =?us-ascii?Q?WcIsrB4D5L0aDC6JFBbCmNvcgMVx6vxuxIOw5f8tP7L6+/6PlrSHr+8hxcGL?=
 =?us-ascii?Q?SQV6YYwP6YfwWT9feUkMzYofFMuV3TMxYZpztWRg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70bb409-3877-4564-45e5-08dd862e06bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 08:23:59.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUUvUOQx0J5AmekgUWY43uprQpc2uGvCeZW60q4lqRE0gaQNP7swOkTZua/iVZgRMg2RE1GLfmr9Bhu17pavzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_012410_742339_C89240A7 
X-CRM114-Status: GOOD (  26.02  )
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

On Mon, Apr 28, 2025 at 09:59:42AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 23, 2025 at 05:46:06PM GMT, Xu Yang wrote:
> > Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> > properties") add many tuning properties, but some parameter value doesn't
> > match the register description. It made some changes based on the original
> > value: add offset to a negative number so turn it to a non-negative number.
> > However, this conversion bring many pain when some properties need to be
> > improved.
> > 
> > Because device-tree supports negative parameter number, this will improve
> > some propertie's parameter.
> > 
> > Mainly include below properties:
> >  - fsl,phy-tx-vref-tune-percent
> >  - fsl,phy-tx-rise-tune-percent
> >  - fsl,phy-comp-dis-tune-percent
> > 
> > The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> > and i.MX95 USB PHY has different meanings. So this add restrictions for
> > them.
> > 
> >  - fsl,phy-tx-vboost-level-microvolt
> > 
> > For this property, the parameter value is wrong in register description.
> > This will correct it according to true value.
> > 
> > For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> > manual.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 43 +++++++++++++++----
> >  1 file changed, 35 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > index daee0c0fc915..b09e3dab4c59 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > @@ -43,15 +43,11 @@ properties:
> >    fsl,phy-tx-vref-tune-percent:
> >      description:
> >        Tunes the HS DC level relative to the nominal level
> > -    minimum: 94
> > -    maximum: 124
> 
> Widest constraints should always stay here.

If so, I will restore and modify them in v2.

> 
> >  
> >    fsl,phy-tx-rise-tune-percent:
> >      description:
> >        Adjusts the rise/fall time duration of the HS waveform relative to
> >        its nominal value
> > -    minimum: 97
> > -    maximum: 103
> >  
> >    fsl,phy-tx-preemp-amp-tune-microamp:
> >      description:
> > @@ -63,15 +59,12 @@ properties:
> >    fsl,phy-tx-vboost-level-microvolt:
> >      description:
> >        Adjust the boosted transmit launch pk-pk differential amplitude
> > -    minimum: 880
> > -    maximum: 1120
> > +    enum: [844, 1008, 1156]
> >  
> >    fsl,phy-comp-dis-tune-percent:
> >      description:
> >        Adjust the voltage level used to detect a disconnect event at the host
> >        relative to the nominal value
> > -    minimum: 91
> > -    maximum: 115
> >  
> >    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
> >      description:
> > @@ -112,6 +105,40 @@ allOf:
> >          reg:
> >            maxItems: 1
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - fsl,imx8mq-usb-phy
> > +            - fsl,imx8mp-usb-phy
> > +    then:
> > +      properties:
> > +        fsl,phy-tx-vref-tune-percent:
> > +          minimum: -6
> > +          maximum: 24
> 
> That's ABI break with vague reason "some pain".

For these four properties, no DTS files use them now. So that's why I'm
going to improve them. I think no ABI break here.

 - fsl,phy-tx-vref-tune-percent
 - fsl,phy-tx-rise-tune-percent
 - fsl,phy-comp-dis-tune-percent
 - fsl,phy-tx-vboost-level-microvolt

Thanks,
Xu Yang

> 
> Best regards,
> Krzysztof
> 


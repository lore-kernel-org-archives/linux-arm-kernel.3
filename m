Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208DACA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw+tfqsBa6b9qy2KTF57pno0FYrRdFfxP6Ku7+bGorg=; b=JyYJ2QjtxUt3pNiUbNlvG8RzwH
	F3I0OgjYETwFlXTJ/WpEn32g0LuUzX0+Yi1CorlFUi/nYpPk7/QukbhlE+rImSh8jEPQzjShqmn7K
	eJFHVV0sYpVyiPp0PqORyXm9R+nscdpKNkXlXJ8Mpof5VSOWkVT9aMmy/YRToisuIPc0O61gjN2J8
	V3B0F5292o0xSX9c+Yh47DriRAEXaqJzqJlPi00KRrPqmL2mu5LsYPz8T3OU70u09CRQFMVkzKHkm
	zqkAmsEB0Dv49u9sz4NWrU4EK9ZsqWrpAIprZqHc4SYeVsbsbPlNcqkYAWmcHfbSryNF2poLorzLa
	LlRhA5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEgq-00000004BD1-3o9k;
	Tue, 20 Jan 2026 16:34:48 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEgp-00000004BCX-1REV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgFe0AI12rg5NKxoqaXAB8/Qgie5G3vj84qetqFMRJLlnDp8cNg/tdCcPQ8lhmAramnIKClDsX1e9sgfTaSX3SOCVgdzWKR3WhrHimCxXQtVZYXqLN+//lpf6clvf5Fj2tSPvSep8KOdKyFDjq3hHsN+0eWqQto9M+KcfQEDhNjx+exzbNau/1kFi17EkQZUrgZ6PVdyK36QpxmmVzX83tDp9JqJTrzDs7ZD2LgGJALPvwDnWg0m2jD6yP21ocN/v3tLAOn5kB/PwklJJ40c9j4hv3feilPKe+P88JL3PUXJjHr6vPIZhWY9LGkSiqZQ9NBpCShppmXss+0XreEkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw+tfqsBa6b9qy2KTF57pno0FYrRdFfxP6Ku7+bGorg=;
 b=u10ErTKu8ns9LE5VOK1m3nxMY8e0JF8xj0O0RElcSwGpPZMEZuWaRndfuTZoyF+pyug59qRCjzRQiMaUYG/K9xp24kNiDW0Kca0at+AZueOl3ExhWhkFBvvRyXkN3W7Yl7gARHwDsR4RHT9NEs1Jg8sfphxl7FSK4SA/qbPCm2Zr7WT75EQZ/R+sz5HJdHLkaWu9O61rl4GNlT0jIDqEghJkx8CCO8+lQjf3lxadhD0nqoYReMGYKQtNKtCGuhNvJoDGBq8Yot5KPxyHcZPdOcVprU+d1biKMjGsuNgrJazKecu0KKfouxg4oqmfLKn5q5Pnbw2KaBjCWhnsfs7RRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw+tfqsBa6b9qy2KTF57pno0FYrRdFfxP6Ku7+bGorg=;
 b=gUuArNHW7Plu7ovBVO/LCqjEBfWbpszZw2KK7bRsZUqppn7wBIYKH1D7lk70Ebx75UmjfTeowUyLV3aQvrq71p9HVDVUqpQHSwcQpklVDrYqS9EKZrUJlNbtV2bEOpZtrfBuu3w51Htt1Oe5GT2rgxKluN4xf/Cd0K35BDqt84LktfNQEOpZYEcR3Uk4eIy7gxV7cUh0v29/UpX1VN7vr9tsgvVfG1AIFvvqMApwUZbLMSIGdMWc183lPeKvCqRE3jOL0VHXdBpXZLte6GHE4ocRS1bexSwJ9opq+xPak5EfhI8hx/Fo52pXk47j4Zc3Ua6Oj51tjvhtu4wrQm96mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:34:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:34:40 +0000
Date: Tue, 20 Jan 2026 11:34:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Message-ID: <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120102604.1989725-2-sherry.sun@nxp.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d24ca79-d8db-41a9-f44f-08de5841cef4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tuNAYSJqddqbpr14CBwDt+3vPD7oICVNvkq4t7e3dL50IYYHvoQGMStY3+PW?=
 =?us-ascii?Q?AZ1Ni2nPNwyQSm8l66rFMRbzRkmEx08d1RJjpTM1gyP3OvQXQiusvjWUQ49P?=
 =?us-ascii?Q?eV8mJDhRbonPhvXpajtGbrwv7dK+8p+9LMsyauBaQ6CSgDa9r1emg4FrV3jt?=
 =?us-ascii?Q?81l8aSl3IfHdaJQWBbU9h8cn5POpaQL4n9IA9gC4RIWathwgWmnVgYrwcgZ4?=
 =?us-ascii?Q?BTWWT/x37C1UAUUhs8U8Gc2sVyFGcAwzBqP7RNhDnxDGPOxgNXZ93++cVct/?=
 =?us-ascii?Q?h2mrb8j1kdyyeQgy6vP91wlnlmwlGmU4htCp60OkOfW8TNUkZ3pPSeuyLI6X?=
 =?us-ascii?Q?PG/gqSu7KYyLJ8jz14oq2VawF1Xa6wCsmbhPq+e9AJvud3cZ4YKYytuSkz7z?=
 =?us-ascii?Q?LCablLDFvGp07F/DT9bDx0+34ttkako9BU9XZ3roe5+bYnshlVtrMdK15mvp?=
 =?us-ascii?Q?S7tEJ9Wmd29r0ihNyb0Fia5z7Fz1lO3fJfZZ/2o7s+YSml1GOzgkYxeYyMUX?=
 =?us-ascii?Q?kahIIExiXjbx1PaKXBxVriHWNju9vWQuqlcN2/QzEqnLjlghBeUw+LpFG3jf?=
 =?us-ascii?Q?Zx1IiYZ7CEHQMJDSJhTYvIFhUVqlQkUl3EzobydCpwi89WKgbkeHfuNOKITq?=
 =?us-ascii?Q?Em5ECAcpidcyEw/M50hozh0VDhLI+69v32qiIxI0tUP99r91jJDJhKxgxtl6?=
 =?us-ascii?Q?QWltLSf4GZM57Hhw2cXNchzpwnZvUrtVP7UEoNKhVTW3XtHXQ/lEmq7yce3W?=
 =?us-ascii?Q?lUOPozwaWWll9+xqP9NH7mwQESYR4S20fMSwt3JR8AXvT5c104WXyr7bARGi?=
 =?us-ascii?Q?iil87NURo2FrP7WTKWEMcpL6OT0/9WOhMqhMmNAdrPXCgXfLO07OzSgkgxms?=
 =?us-ascii?Q?WmqAXVidfG1CUUUekMOehYTWstcMf6qCcBWVMfGpmgiSkn7D7RKCLl3eXhGc?=
 =?us-ascii?Q?M0jeUfe1a0lNOSuM8UzHHA5NH/KX4QQTJ5+wGXYPwzYWT5NoQf7zTzcyRCSm?=
 =?us-ascii?Q?fQZlBvq8EtY54URdEwaqhFWcWly8UNT9HX2UXrjRMe+ALqtpniBoX3dd9gTF?=
 =?us-ascii?Q?ja0D2lnaUcD/ofuEncUhXklLnTIONjewKPK/LKFxCyl0XOobQnmimRNc3jAJ?=
 =?us-ascii?Q?R0OHpx24vz/c28nm6iMHHICJHzgSwRPhGFzrm9DwgtLW5Do+7nZCUfRqLenZ?=
 =?us-ascii?Q?rkhC2ZziAKuYu7HARm+GsPKp/nNOt0pojL+jSTBWFI7qo8dqQewPrr77bYOv?=
 =?us-ascii?Q?OMO9iFVqSK0NFGSMC1Y3L3J0Tko8E8c5Vz564zw3ccNbjUYZaoq1QqRmS0KI?=
 =?us-ascii?Q?IIx8hdED151Y7jiA2NkkH09Z4Gt905+vRQoiHGtkSGOyRwnAkQfbsfbVqRoR?=
 =?us-ascii?Q?D/cr2JUjLNLziHJYLNYN8AuCpWSdob/cZzINmSA+M54Kgn1ykaybkTBuZqt4?=
 =?us-ascii?Q?Flsd+iZlcMICcpNsHE05yMFzX4P684LsM5lVc1JAUWbHYoIRlls4ozuIhl/k?=
 =?us-ascii?Q?MwpZMyVrfkTUMzA9+JMzXsO8cUpV97GuKiQ2sHqIrEYOm2anx0MWdFVbo+xI?=
 =?us-ascii?Q?0SbTu//EwZUpiAvLas+bg7NJTCM2+GYXuaOitmplFzmhLkUUqvcVWcf4k/Pp?=
 =?us-ascii?Q?UdUVe2CZXEcL378k8Kyt3FM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8B+oaDC2mPV4/WA4omRYZcWkV03qddupP9d3iYmT5xn+SnEdR8rg8zLiaZsp?=
 =?us-ascii?Q?Xk72OW6GcHzkuYNZJIaoQRDX7mLo3qgHdu59fhzfE3OfOjHqHTobPWPa/BUj?=
 =?us-ascii?Q?I9z/DMCI8EFNNcY+LJY6kuKKlS3NOGtk09tp/EHeTYj9+m35SlnZb/a5RBsV?=
 =?us-ascii?Q?iID+f8G7METwv8qNJgOJwAzgFg65Lv3TD/2oD5YN8JHzePIkHZ0grEgWZHz3?=
 =?us-ascii?Q?GsK4SS56+sbYbNYm3oqVIPCVsRdFzl4U0ffl+k6GCfJoCnA8xTwkneTO0Ryd?=
 =?us-ascii?Q?Q7N0im+LnyqRkjndjznpauoDnWfnZY8x+CL3Fqdfu1TzXFak7UVHA0ciLxU5?=
 =?us-ascii?Q?UmsfDdb87I82LGtR8QhFROH2rQtUexb8R6FIBB/M+CYVqiOWC6MhlVe/2WOo?=
 =?us-ascii?Q?MDGNY/66VyI6C3XOKzmf9uDcEqBspF6RG0VfaqEl4vsAMKa1AO1Dggxe/rWR?=
 =?us-ascii?Q?4srgJSoPYtbUSlSeiXIFTU7wBvHf+Itzivml1zWZ/wPIeje57GSYQXFydoqd?=
 =?us-ascii?Q?EMuEAtdEcqgvJvV+gAD96DKcpYg08wTYyZhAo6H5VwD6BYLR4Rpzy1FpM4WO?=
 =?us-ascii?Q?ReQF6Y99xzN2oMbYiW7V4oQ+mcf5aBlIY++S+FVDOutnnOCaHCOQQMy8H99f?=
 =?us-ascii?Q?vD8aMDfbNHDBilBsbdMH3wo9H4uFcw1ivl2I/jKwSNtxDJ0hG8/D1EtJXwKy?=
 =?us-ascii?Q?x2wmbvElWBylFXjKKLNgp1n9Jxnl5N8r43ALASVurojwAUXMtsKVT4QVe3sP?=
 =?us-ascii?Q?HRB3pH7MYDGR9aJyDIN70tSKeqKR3Mfkk2I29G4Dj3gyAUfYUfOyfVekeGNB?=
 =?us-ascii?Q?Mow9bhHOdcrIHDXzdoxL/TBKmHdb+mQlSD08bcLtVQaEyQWwsW3Tr3J9rT3h?=
 =?us-ascii?Q?BloCykCgUMQxRsnFra4fU5UcbgHBWunhOsvfuxLg8Ny630J/tpwNsuPeQ7W1?=
 =?us-ascii?Q?lDi/2kSl4Of6ND9MTV7B2lNhmoqI2T/480jMljxxyQhV91XcF2kxWkeOZelP?=
 =?us-ascii?Q?s/K4GWzCkJ71gSToiulbv/QCP+yRk+AVPeVNXZQOuXj8yq1C3Ik+6V8zFEAv?=
 =?us-ascii?Q?9U1eR1f5OpTqfjqN8HZw3zc9pumSisUzxrugUnsL6jG0g54kY+2tOa5tSdSF?=
 =?us-ascii?Q?8PvCQHDG/ls/FBPAU8PheR8CkhMCYXWeZ+1FsT4jUUGAAL06v8bEUEnmX9pj?=
 =?us-ascii?Q?PK5vO8qa95LV+3L1H2eZN0/895qkmKdjMLBoadAdSHjGGRrEHUD/giPj8LWe?=
 =?us-ascii?Q?T1i/ZGEyC1YNZ1iyeykomMf6NWaxYHEkkFMeCJJ/7oNlXBcppoPsQk+ZmROw?=
 =?us-ascii?Q?/9DRu6xo/EhvpC6372Wj26rTZXxwZ02XQ3j/mXrRUgc0rsnIAhz//JvzHAKZ?=
 =?us-ascii?Q?lZgQDe9BvGsrCVXw+O4aSONy2jPOglw2f2BdpR174KMu8Bev92QWddbDMaDz?=
 =?us-ascii?Q?LnjWY93syoY4hIhGxm9ooBEzqQSCyZTMGGfMtrxalPnyOzwQ6xcEOJIoQYCv?=
 =?us-ascii?Q?MucaK2cdJiZGu/bdfvBtmPBLRlU/XJ/iJPn8EBHyphR/VckO4xotRtVd3/Lo?=
 =?us-ascii?Q?kMEVv2GJ72OKq971RKZLabzOCpsj3iT25uO6MS7Dtyz38wkpggGTUjGji38J?=
 =?us-ascii?Q?KMr9jxgBhHToJIPDun6Ea2g6HCvpp8Qa/jZ3GcYHNEoRpI1xbA7G2aOn2TUD?=
 =?us-ascii?Q?bnkCJ8wocHgeHaPETDQzjwjn8yovt6V5Jyu4vCFZKBe4uS+R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d24ca79-d8db-41a9-f44f-08de5841cef4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:34:40.2546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUJc92/0jWd11L1Y8LvbpBPveu89nJXhof8j2/sINeE+vD45Xzzxoc8Ae8asWSXraLS/GFrXWu3jljc8Inu2hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083447_379286_6FA76510 
X-CRM114-Status: GOOD (  13.77  )
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

On Tue, Jan 20, 2026 at 06:26:03PM +0800, Sherry Sun wrote:
> Add DT compatible string for NXP i.MX93W EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 93ad6f0027d0..1769f243d70f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1432,6 +1432,7 @@ properties:
>                - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
>                - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
>                - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
> +              - fsl,imx93w-evk            # i.MX93W EVK Board

Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.

Frank

>            - const: fsl,imx93
>
>        - description: i.MX94 based Boards
> --
> 2.37.1
>


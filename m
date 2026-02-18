Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBAE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFeFJ8eGKGN9aRLowtDzNxVABdsiGDqdQ/NFI+jD8Ho=; b=jJrGt7s7UGKoVrE4tokgRcbsxd
	xRNOYHrpak0lmBgSbo+u8b0hJbfO6prDAAVvFi83mIcmfDdfkxAnLX82ZLXTDSuHOwhw+7Fq6qQt0
	4DR60peKf+t6yv6ZcYJlZAmXsyUPshEFyHxiKIVkVFojpvYMB2O1Ly6aCFq6Jpo6EddToJ54bvQ7C
	6egy2ApOPfxSswP3300WlelqyMLTGXn5qlDiO5hdqTiwsghEq4EjIIaq1UCA0f6d6B8IYIOj8OBqk
	iOErUg3kL+8+3fjH7CqqnovZH5exuabfMleuWT7UT4sZlv7gtd+La2LPo1tPuT6SKwJ1gg3E+tb4b
	PCBkhfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskzJ-0000000A8t9-3chn;
	Wed, 18 Feb 2026 17:05:21 +0000
Received: from mail-francecentralazon11013049.outbound.protection.outlook.com ([40.107.162.49] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskzH-0000000A8sm-3lVr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzlgI1LHUpeHkvadSkIE1WPStoXi6WPfb53wKBb4knM5tjpMZ3jIt4RM9xIaw+aHWwqTRGwwUMququDFcAd1LLoDXSfXTBSEBUOzrOFBlm/hfebBCe+wEFROyRpWK18x7lSW0BSGslRwt1HjGIULvg24zld0nmFM7KZZbJZoFJHVkNWyeutF+dOrjtWeoqnj4ZYTnf9NAxUKL8eUTZC2Jz2bOy4pZ3406//GLJjxc5NxXfEscXQzdcIPVrvy4Pv0qCGzHb4UjD7q1ejXixCzqpjV72fltwNO3AkMYbdRf/I5sRj1rAaxXmdUo437tWS2Fon1JDwJUHEX+PkC85KKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFeFJ8eGKGN9aRLowtDzNxVABdsiGDqdQ/NFI+jD8Ho=;
 b=Jls0CItGyV/pdRKl1kwHnPdKu7Vzs7/TYpeyWjAI3LGjbBteShokxsYXNbKqJJw3XKsaEyadJ0yK7ZCEzbLoDfD3DlP+tjWs3BoM9D0fvfy35UIab+fVsyQTVnhoRo81vPEttOv+LGGH/drT0psKJyG4j1CcCA5kkBcxhgya9zqHs5ha2OmwisZ+5cPp1NQdF0no1zgUE5pcqQ+0uvi43vcsnbre0y9HmqGey8kEsX5F8GfAZe79ByV5t7C1fb1lYzFQ5vJSgz6v1xgfjkDcZSIqPLTux6laTBzXYxM5my1pfIFxzo+Tmo/eMI9MXsGFirsOv6fEOuNnr0p21Wjbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFeFJ8eGKGN9aRLowtDzNxVABdsiGDqdQ/NFI+jD8Ho=;
 b=gRzt/sDfavpaV+awCglnvSrpZjwrJklzRM2NNviSqdZsMpctpGZS9YljJmtMauMx2mtxzYEZ50BYlKtgPjtTnJKKP+MBKhqXz6qIiwpfNZVMrL6lsApAdI3hBLy5HF9iI8mA228FanFFVQcWbxvmjiFREcNzEvPSnPaVZlIEcy4qFMoqLKc2mXCdQ+4CbLhdwnxnY3kA9FDwY43/0yb5fil9PQ6ZViZfm7jnPYzRXAc0smVpZz2GATUS9fzjzC3Tbdbqv4hP5nTwJTmqhXljHz0PD3pdk95lACsdY1ontf5HIOV3huWzh+1btu2DizNDJp8hWpFKKq1UmAWb4ycCWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10864.eurprd04.prod.outlook.com (2603:10a6:10:589::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:05:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:05:14 +0000
Date: Wed, 18 Feb 2026 12:05:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Message-ID: <aZXxQZWBvXQX-WvC@lizhi-Precision-Tower-5810>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa3f14a-4a0a-42ad-1ea8-08de6f0fe22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x5z1Oil1ewHcb+mPVAdXMRmwCc1C82XedPxtyp7squBGNNyNcM3UV8FABp/8?=
 =?us-ascii?Q?61EmzRiQbkGrZRyjljxTPJ5omsFWKyVAnFDSGK/0A7KV/LG5AHt7fDNYTnLI?=
 =?us-ascii?Q?lWuJWn/vl/04zYxv2FRgzJEY9YpdHNypJWSO8gb44iCReRA5oFmcWdVWAUA1?=
 =?us-ascii?Q?XEKXUkgaYj11oWUS9N0bkJJso4CB76nPbtetuxCPFq/yFAWJ1nQAA39HIxAn?=
 =?us-ascii?Q?DLYH359jre9fKymZ2hAlfp4lDC6hQzvE3r3G+4H+wuZV01nlMmJiOWPLBFY2?=
 =?us-ascii?Q?N6RrrTX8WUjA7RlXx9k3ny/W4RfuytK8NwfWWExruUh9ORBIy5t3Z4x+3Il6?=
 =?us-ascii?Q?A3/ULjGj0fDVep2Z85PYzX6MCC7ZBMubB6MCdo2RvWGzy4QsTEiW3HZbTWoW?=
 =?us-ascii?Q?8n4EWkw2S39PyYouRb78mZyy1YpuSR0YTY2aZ3kmWh60FGua0ialEYGTrIb6?=
 =?us-ascii?Q?mm1fgiiG/2aZHTShA7GtDHPXolsLA3rTQG17fN3O8lqEjgLfjR9JkYj5k8Dj?=
 =?us-ascii?Q?VsM+JXviPzHhgSJdr9PVnERQen1Lw3TcTXalcSZYtZrmV1KA3KAE5hhFEgiu?=
 =?us-ascii?Q?GHqlGdfhGFOeWgpFAsj7ruMymJWf255FtT0FF3e+dEiMQ3BOX+keVv/L3GaM?=
 =?us-ascii?Q?ls4kougzzjcjrUT9Kmb9v5IDa82A0AaiKSpO7osPsCvldUs5lelZ+YlCmJTB?=
 =?us-ascii?Q?4YLiKGNS+gigNOu5viGwKPd1CT2Ed+IK0ogwNXAFUAAvRxqL0FbPVozY+ieL?=
 =?us-ascii?Q?++LEVYEnw4JbPUrC78FaNMjynRCrjfR3kVABfLmXmgmnCLeGIiB3ALlcAqhF?=
 =?us-ascii?Q?300TonRqNSikXJvkwv7d1EU8mTT1pQhHwBYV5xfxueHd800WKhsbh+8zqbuG?=
 =?us-ascii?Q?e3BqvsETQA+UPYYnapolwbxdDxW52DXbCVnP1Iet9W1FQijnVaNlEvr2nAUe?=
 =?us-ascii?Q?8U3/PnS1vD5PetQTl2T7vH9bhAwa75nlSQ2LK6Dk3Y8BgBGha0L9uuXChC0X?=
 =?us-ascii?Q?92X4CJMGvStCsHHrUOKklkNdHdluvzBfnBrDs0tQ4EB5M98mpYiLgEpDnFNv?=
 =?us-ascii?Q?7VE63UHQX0bAlUvZ9DNilYYhCFvuwTgUxeYlacO+NtbpmRQi5PRB49LeZsXl?=
 =?us-ascii?Q?lEtXgIiiBH1CJ5+br1t9Pa8pzW5mu3zBt6PG1kiECrWCZgxQgqZrv9ybi5Hc?=
 =?us-ascii?Q?6oZEya29ODhHauEIOfx02e7/coFTMhEQIoHkKUWSdochqMNSbX23wc3isJZu?=
 =?us-ascii?Q?YPBABEp2SbqzDFb9MvdWPnzKi3Syb9VP5KGL9AUuaGHEmZ3zufgC9ra+Dy1I?=
 =?us-ascii?Q?M0NaUffHmkSMzqBzqcdh9yhmc4UfOH/nhmVm30ceqDRBWztGG09lPtzuOhCP?=
 =?us-ascii?Q?PfOyuNZagTxFOur64UXXt1HMruMqWj2fv94f1OPjgGqu8KsGEu7m6gYFE9IT?=
 =?us-ascii?Q?TAa77GVDkL9YDCnoUM3WSCicOEkLtN491G/KHmsMxzwxz3D2NboEWuXvI9HS?=
 =?us-ascii?Q?l3RRsRVFDTDV2aHHL9kyAUIfxPDuOs0vNbQGjr6fQjiQPCMiVq8aj+LFjjr0?=
 =?us-ascii?Q?Bm71HaMgepzZ9cfn58RSTCmvd5or0w4jUFQw+9XnKc6Efdethg1eyAI63b9Q?=
 =?us-ascii?Q?PR5UxFMGiu7C90UxI5ubGJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZ7wEtBRYe2kKx3zavV/vq3aYfeSQ5hPSrJpv2BcHD22CEJESBjyOF/bT5Tx?=
 =?us-ascii?Q?AMAa9o3RE2VshqhlnIXoK3u1qCC8pU9TDJZCtapcNYOgZGtn07hFBqD4Xp+L?=
 =?us-ascii?Q?U7GhwVJ2T4DJoKraUfD+VZsesEcCCmOG4IfDKS6loa3JKSpiXUBmyJL6U7je?=
 =?us-ascii?Q?Lbdw7JHYJP8myF25Q5tXSLNGG2nnFFNZONOnq+WrpnsyBnjPgZirb7Q0H730?=
 =?us-ascii?Q?2N+KOhFLm0c6k3yenYSZ7rFtpy0vRBV++wcNiyBCpNj+Pv+oBjIfPbvsxB8b?=
 =?us-ascii?Q?1Yrj3AY5VXjlbuj9/w3QjWr69TtUw+va8QrFpxgx7yg2HkXJRI4u0ysDFsl6?=
 =?us-ascii?Q?NZnnKQnMo8ccCXdZ3MhtOAHaym1mjyYRY+XdgQ65/AG7bctqC1HnlpEf1BSz?=
 =?us-ascii?Q?ptzTRao0rUJ8F8i7RxEnahdNxHAaaL3XvOgjvJXZmX45ghbhB53UGQe63Ot/?=
 =?us-ascii?Q?XJs0cqKU1fdDRfvHGBUED3SQ5X5efmiOoheRILK26ru4lZP59fAFuO9IGFLm?=
 =?us-ascii?Q?8tl3W4qg1Tzs896Ehk87o4Hc3p9Jz4JLrBN6STkCdqYsU6+ENLEyiEtniXlv?=
 =?us-ascii?Q?fp4zx/GQFpfCTv8ftkzVFKCvalr6ZOaz2CFGcPK5kFeUv8p/++d8qsSn1Ghv?=
 =?us-ascii?Q?fWQLJ796dSbOO1aEXLWadMvgZj/qNJnfI01KeKtaECjBqntdjr5etPqkKgJ7?=
 =?us-ascii?Q?RCcsphoLZFTNkKk8SpQQjI1pJLHdg+KqnfG7RAC59FxQiii4fhZ9osQDGPwl?=
 =?us-ascii?Q?cL/pdgkx0F9AEp1Ao+JPmmj141NFeZngEDGbDCsflpme3LZU3y7tIrbwuOPG?=
 =?us-ascii?Q?1eOsQbwSdBrY7CvFfclI09rfXFaq+3kYNFAr+iUrt/6kfSoPgF7XRrbkd5jE?=
 =?us-ascii?Q?1DM+equsD6W7rwzcO0OwAVP5UBR2xICC0ixRxgCrSomR798QDLlqQqAL8ALg?=
 =?us-ascii?Q?pMdhzRAtAql0OnMZintXR4zwCDmkJ7SFRmhcnwq3CbH8DZtNhjyACvfM9mNN?=
 =?us-ascii?Q?3kGLRB1+Oymxqvkp9ApaCEHrxb2uaV9kIAuPMwv6G6yKk2ftv0vB3o2ENGIw?=
 =?us-ascii?Q?FFOLaj8tDycuqemO0JEqRCvPHDtPuBg0wCbqoEqi6qtW8FYdVSoc9Ki/DVGu?=
 =?us-ascii?Q?S6ThYupiNVNxxxGMf2Ed4zPcJNI3gsa6ihEXUIw3XiMYd30xArVrJNdC0hMo?=
 =?us-ascii?Q?7vbU3WjZldJY2+Fy+ywtOcQWWNn8VPpy9Vp9RGzasb+Sm9ajUdgcxXJDiWjU?=
 =?us-ascii?Q?OPKlhQoU4OSgV8KeeQqQX3D46TbisBCHOvB8jpFHvjb4KH0gC1ArEsgKwzk/?=
 =?us-ascii?Q?8wwERApji137Nc77cx+79n8peENzt4kQ+TW3pTuEZoYYyeZo5GX3fLketBTg?=
 =?us-ascii?Q?LhkdkdPAI7CrsBVHkobljS0XvJUuP6vGCyUnhFiVZu2hS9LegwNyk5XSyx+Y?=
 =?us-ascii?Q?0FSCFrjFCljEZwJAEPVrlSQEiRvr2MPrQqKjMBe+qkfRWMYK+eRAvTOOowhW?=
 =?us-ascii?Q?fPyJENrbFx58YQbknI5tXtfHmDX6F/BnEvmeKRXGE8rq1iLLuFhsLG/OdMsN?=
 =?us-ascii?Q?3Jg6PuX2nenGFlk8yyvyESj1xU7Q6fRq2+UR413sCVIQqJHm22Hetv9AO9ql?=
 =?us-ascii?Q?trdn3ObmqEFYnYkXAYbu+w10Djpq6agn4kzq6TA2CmhPMhixlWJnJFmBSxyP?=
 =?us-ascii?Q?jZ2OpYfKG4nBprxPipaB4q8aPnnX4aAd7PF/jinOQad6EMM19wjZH8X8QTZT?=
 =?us-ascii?Q?j/d71JMoBQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa3f14a-4a0a-42ad-1ea8-08de6f0fe22d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:05:14.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptvkTCSZl8XTYFg1YYGai1fX1NhmszCHtfLfVM/Et70DD73b33lqvdn1g4cLpynIZr3Wi46UpTXAyoBUJO4auQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_090519_941546_215D5431 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, Feb 18, 2026 at 02:22:21PM +0100, Max Merchel wrote:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Max Merchel (4):
>   ARM: dts: imx6qdl-tqma6: add missing labels
>   ARM: dts: imx6qdl: add boot phase properties
>   ARM: dts: imx6qdl-tqma6: add boot phase properties
>   ARM: dts: imx6qdl-mba6: add boot phase properties
>
>  arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
>  5 files changed, 36 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>


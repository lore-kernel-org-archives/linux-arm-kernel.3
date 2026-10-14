Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E42CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0knYD4PTfnrDYj2BE5MqF8qj2rOuMIrCF+0vtLWdKFc=; b=lKTJV0kbxWkjRPYsR7JJJIXL0Z
	WYP3PfU+hnuu0CEROwtYaOZwcuR4qwd/uAqUI+Q4l5X4Do9KhDDX5nnnPApWGL/scj5n0lcckcERp
	d7pY2C/AuB9MSWcqHDi2zqIs07odNPjWrBCpo7CC9t9gEm6Lbko5cpjucPlRD35yziIeq2t6T7g3Q
	P/goW9qqkIPBEZV1+DWH4VcOM31npM0XU3TLB2Nd72B4VlLEknHSANY0EcJrgEfvsnlHdKqfITO0g
	DHHfUos00QguHq5BwcmBMh4FtjFllh2/QRXSeFmmiwljuR1KzseBmtrrcuaBvW0i2bPaIewmCzBVX
	xJUMfZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzdV-0000000FgDo-3eoo;
	Wed, 14 Oct 2026 14:07:17 +0000
Received: from mail-francesouthazon11011062.outbound.protection.outlook.com ([40.107.130.62] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzdR-0000000FgCs-07Vs;
	Wed, 14 Oct 2026 14:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMSoqCjAe88K932Sl5LR6L3X1tlAReT+O+kfHcHXNHNMD3EHuN8EZ3qjSiujUyxMw2rg/DuSQG7BKLlHhHhvOxGbN64r1i46xOAOs74EXPE8z6PER9Ls3NBtdaWrV7K9PBImKS1EpJ1MaGqoob5tbgjH5N8V7WiCghuM8Idid3ugTw9Lbs8LUT2T6Nw+gHDsKKCIjbEKLYvZFIxPGTzJXbLR2fBvkSV/c1lJmSyXQhCE7IhdNEJ79iD4auokHiltmAXwn6bBJ6NJaPi+Nf3SAHQvj7BAErUw9bqW+qyYIGEefH4vBsAy/Q7OFsZjtOTm0b75ji/2yZXHu69VZ2cPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0knYD4PTfnrDYj2BE5MqF8qj2rOuMIrCF+0vtLWdKFc=;
 b=tll7ONcj+LpomYR2epRYoZFUHWC6OA6mR533k8sDO1txuCIyc5x6Z75zYgusUGufYFj878cNItiOuXGOwAQWeRUexUOmfcakiwgIBVXs46oc9VINvbTcOuNgO9+gXlqHvjRY8AlHff1HOZzNRiMI7an46XjkRMaQRtDI2IpMDVic3MSJk/WBrLCjs2buWeQqAKbb+bCF/ibreIrBRr01B3E/HNSradk+WtPhnEouILNAbabbh3WE27kTXijnnxO8x5kzSaxeopPWuHd/o0BN/bIBnuCEsWHeVsN6LNICYmusasnNvr8lepdAmXW8Pvb1YCzs/OVOgdCigEZFgPY90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0knYD4PTfnrDYj2BE5MqF8qj2rOuMIrCF+0vtLWdKFc=;
 b=SWYvVQH4eoAuAddExdneEobQ4a0EugisndrylpsKmmSc7lej7SCPAvJN5zTMgnTQIkjNKYYfcYk0tW4OLynWxh8sqk1XaHF0cI3lq/d0Vv9eXQOclmoLefqv7vPo0LKabPxGpHG+uh+kmrpcFPOJNyS2I+yOZIehHr9DvNkfXKRkydO35nxFGEUbuXDTHMXd6/7pSxzLoYErHfh1zqxOtl/0Q6ILFzSngHjFyflEV/EN9Kv0wb7nfmnawisOvoSWkj4KHMCNh7VqfFxd0pdbYULYZKZI+WwEI0birSPCvDiQVLUhX9Ug0bqzTOF0wAC7tvUoTzCavMEGszlZ8WYxDA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9845.eurprd04.prod.outlook.com (2603:10a6:10:4d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:07:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:07:03 +0000
Date: Wed, 14 Oct 2026 09:06:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH RFC v3 03/12] dt-bindings: PCI: nxp,s32g-pcie: Fix SerDes
 PHY phandle in example
Message-ID: <as-MdloKd-7oJsUU@SMW015318>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-3-9d68868c1e89@oss.nxp.com>
 <as0qORxP0Roh9ktO@SMW015318>
 <as5CIYxKJTra4hqM@lsv051416.swis.nl-cdc01.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5CIYxKJTra4hqM@lsv051416.swis.nl-cdc01.nxp.com>
X-ClientProxiedBy: CY8PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:930:4a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9845:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf40c06-1bcb-4bd7-61d3-08df29fc6c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|6133799003|22082099003|10067099003|18002099003|3023799007|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: hD40Yb1gfcLxcIVRMcMSkYUq5QeHQJ6LbH8j3c9xDOsM/1a+OEMVbzAEnOJAiwH3ifkHuN4M7Ue9EF9D+m8iXlO+lylwEPkgcIRV7ZFM9hQIMcM37XL3PTsxT+kBpGHDk3Nb1AtjCwi3l2mwGo7lY0tEOZWCKB1/b5CTrjo0vDYLkt1+mYUP55y3DKX4rncF+OugjehtgdTFzpLV9pmVZN/h8l0GfvkeuEIG3rtdWq6NrNB+gjVHqCCPAEr/Sc9sxks/ZOd+XeDuHEeuuXiayx8LTDIdYjMc9lM9x1Mg9TLsWy1p/b01Gsm3flqdQvx8SEmQJY6PhpHd/52fir61Dfk11fbAeD/pEscZIyWQEzkULRysduH0+ufFhpcvF5lJAkalV+tk6lGN7B9k3cVYZ7vKZp3amjeoSCXVuP6GIV7zZBsDVIvQg74B4EvTpflwq4NP/1q+blp1yZAjr4XglSXW+OdAh/lNRPCgYegGij/m/f537KffLwgI5G+WG7VkSntMjeqdO0gPN8CWfeX+rGjfb34KpyGUpk7R1mDYaASxAfObrHHJ1NQc5DCjC1311lKtEFLDEVWpTFbXU+Vhs6uGxK2dCuKLgaTBiNf9XsSyE4rXrsmdpjvJ9ow2VmlMnuoyW2Otywu/cEVB/AsKT/hmxMkvi2qvA9fttrLvaWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E++54nhll/b8CZAKz7RwlzS6+E1LH9Y/VcnKAONgLO8iIzSJh5lcLpgCipzE?=
 =?us-ascii?Q?fTg+nlHr/ecORHsGrBMSsmDssHkcHxCwI+eejc8pDodE1bjOrcX4GPW99Af4?=
 =?us-ascii?Q?AsVdYifyBAXVFHNv38BN2Y01gGFiftuYabXNEETrmAkx/0y//mJZ7vyI13KT?=
 =?us-ascii?Q?zIUgZsZQCIpAp4CHpWUrVQFaLpKS5HfpI7nS3e2qxq0DDwr4LgtufoDd7T51?=
 =?us-ascii?Q?lpcLFWTR1eT0RSQsR9jUHG9+flq47hTkmvKLC1KQuzkqQCjE/L4Hno2zZvKb?=
 =?us-ascii?Q?2SeDTD9PHUsBWAummin169UxUtmT8uDECn32/fi3YpjzKvtL6G7fih0r3Dcs?=
 =?us-ascii?Q?orSnesiBky6HY6d94IOvesIpOpLrjhgNhTeOmq3MCb22zM5wWrylYdh65WYY?=
 =?us-ascii?Q?haPgkWqTndxf/yfKECQpcVctRdRDl0JBIWg7xXBf3nTwTHgp+0roSFjoGHN3?=
 =?us-ascii?Q?q+oi8k5w5QEP2bxj7zpiBVkhAuav8kQ8DJIJiBTV+0u1uFioWkKn9QOujKGu?=
 =?us-ascii?Q?t04pHlp+iYjgXtA0MAuhczXs1YpqoE0UKyLdXo2ypJFsmH1FJ2QeoFErWJOM?=
 =?us-ascii?Q?SGZOx1MnV8Lex/xkcjmH+I+cWmOjfhGt8zrVErcMMwreZlaxp65pWKUvFi+4?=
 =?us-ascii?Q?O5hH1bnO4yA5GGAsnqAyFY9LdUyhVEYLuAJs9w/RncDMhp0afN6bT0+0hYar?=
 =?us-ascii?Q?vMkvg4L2P+S9Go907tA9Y9tkkDyLGUAZ/w2gHrx8LPMe/AKBWCUFJRkSWc3d?=
 =?us-ascii?Q?U0yU1KKqBRB8HL30I5A6g3SJ8TUfow12oxTNyLtGXXqQU1IfP9edaHFluHpB?=
 =?us-ascii?Q?rTwfIUN6n7x4jKmi8qng1Wn36s2zKoP9D582MQoXzcX43mfnjRYacs2WS/L6?=
 =?us-ascii?Q?qtbSFkYU22ELss0zTUuVqvNgP2kkPhJXi9QSHKlKlccpUz6a0uX8h5/8wYLd?=
 =?us-ascii?Q?OrpnJW6/2vPyCzg5rhnuZMTi4sWleTT2NjVrvCl1ySEZ+m7XzMnT2sOGgTub?=
 =?us-ascii?Q?d5SdAlNvaVm6uS+Op17XmqhhHhjOXUVvFRJIlz1WugtEGOEFwv1Hi5J4YQQW?=
 =?us-ascii?Q?ycApmqM7FAcf5xxKOW+HvooZWLlzC8HTuqQxPrAbzxzSAw2c1QeTo3dV9eN2?=
 =?us-ascii?Q?AMrzmsbkQpIRRI2/2cYTgtzS7Qf26latX3ejkAFiyojmwsXvx5yeiY/WTZZ2?=
 =?us-ascii?Q?m3gHp1Em5Nia390oI+b6cWOp5Xdkwa277PHZwGxrMqGtd6610JB15WRlhaV7?=
 =?us-ascii?Q?GlcYXJGEFil8mV0jZdQJgZ33HJbinWBdBZCxaPkBNtzK3IUy0n8uy8hY2s/k?=
 =?us-ascii?Q?2Hp+aPQ0tBF00HljhH+79E4mpTCmuGd0LnkQ5o4TLxNb0d7zoJgUjLVaI6aV?=
 =?us-ascii?Q?iqWsOUd/kol8rJ9uqOln6HBjt0O9a3RSNSVuCz8Pmdv9Wz7XtMWr3jxYaJYe?=
 =?us-ascii?Q?+Kmi+5ASYyjCGYp+yqtV/CWUAWf6cIljco7lvUC+Xfy9Rm9U/Uzmo/L+jF3d?=
 =?us-ascii?Q?coFhgbNg2KqB9qBrn6RwpQk3qmaWbiSx54N+RPoapE0A8a1onak7su3WExK0?=
 =?us-ascii?Q?nXFi+dajv91FrT6fB6HakdgGXL2gReQ8oBFiKfbfzcbuCFtXiI3gJUM+mepG?=
 =?us-ascii?Q?ox1bxmfMdPVlpCNg6qjjUz1T2RuDX5W6Jb4OVwXZnJXe4t17olHcPTwcN5Qx?=
 =?us-ascii?Q?xu+hFNb9lIkcHRSBGK0jOjiu4NRTdhbDNw9H5hJVVAxTqYgoa0inkWO9z/St?=
 =?us-ascii?Q?J8Sh9XznSPmrYvXYmJEg0cBaR6CPw1ZsVUFNB7G03OPbLyRxB1Xz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf40c06-1bcb-4bd7-61d3-08df29fc6c4b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:07:03.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onGrR+0cx0Dm0pJ4FQFXvM0/eJ0xts5dCx8X5xSOLxC93PUNEeFLVCiTFWcNmG9DaVDdKz0lI5n2cttofix6Soq400PqnnVPnY91hzfj1kVAnQ8TD53vaQBBj+ypat4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_070713_073907_6E99E29F 
X-CRM114-Status: GOOD (  29.90  )
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

On Tue, Oct 13, 2026 at 04:37:21PM +0200, Jan Petrous wrote:
> On Mon, Oct 12, 2026 at 01:43:05PM -0500, Frank Li wrote:
> > On Sat, Sep 19, 2026 at 08:54:31AM +0200, Jan Petrous via B4 Relay wrote:
> > > [You don't often get email from devnull+jan.petrous.oss.nxp.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > >
> > > The example references the SerDes PHY as
> > >
> > >   phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > >
> > > i.e. the SerDes node itself with three PHY cells. That does not match
> > > the SerDes binding: the per-lane child node is the generic PHY
> > > provider and carries '#phy-cells = <0>', while the SerDes node itself
> > > has no '#phy-cells' at all.
> > >
> > > Point the example at the PCIe lane child instead, which is also what
> > > the S32G3 board device trees use. The dt-bindings/phy/phy.h include is
> > > dropped along with the now-unused PHY_TYPE_PCIE constant.
> > >
> > > The schema itself is unchanged; 'phys: maxItems: 1' already describes
> > > the corrected form.
> > >
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > > index 66a050028278..29323e50bd8b 100644
> > > --- a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > > @@ -82,7 +82,6 @@ unevaluatedProperties: false
> > >  examples:
> > >    - |
> > >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > -    #include <dt-bindings/phy/phy.h>
> > >
> > >      bus {
> > >          #address-cells = <2>;
> > > @@ -124,7 +123,7 @@ examples:
> > >                  ranges;
> > >
> > >                  device_type = "pci";
> > > -                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > > +                phys = <&serdes0_pcie0>;
> >
> > I don't think it fix somethings. The "serdes0" just a label, point to
> > provider, which is not neccsary that "#phy-cells" is 0.
> >
> > Examples just show need how many phys and don't care about phy provider's
> > arguments
> >
>
> The example validates either way, agreed. The three cells are the
> '#phy-cells = <3>' of the downstream nxp,s32cc-serdes binding, which
> was never posted upstream; patch 1 is the only SerDes binding for S32G
> and has no three-cell provider. I would rather have the example match
> it.
>
> The form depends on the outcome of your patch 1 comment, so I will
> keep this patch in sync with that. If you prefer the phys line
> untouched, I can drop it and keep only the ranges fix v4 adds here.

This patch is not important. suggest drop it.

Frank

>
> BR.
> /Jan
>


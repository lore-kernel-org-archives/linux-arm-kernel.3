Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMOykuDi4HbQRFrpLEPeubxN8rRsbNAAstRJvCbLgDk=; b=k2Za/9r1tLQb/ZpS1gLizbDpzn
	1M06upDPF+ffOOXZF/UZCyPgV+24yM6saMpfD5M6BKLR56pm5Ih5xacHeniES9/o7FQJyw9JDMzzm
	ivvXEuO0m2RCm8yKFOIa87XqdC3nUAZE1bmEKsIeR71fpOFhhkYAnS+zO5R4+9sFEUZloAOiNxKQr
	F0Q33hJbAwZnUfv+HxMMa7Y5XELC7VWyvnApbhED7gnGOpD0K1WBxphw+DjCf37Og4M2RUWKYlZX1
	mSsEUkb6iH9JHCacCOfdXjZQvo6tnIUfz2gvFIBEWFf4NXeWcmsDE4s5nR1LiH0Ae0fYnK74JC+sJ
	2DdJoRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGd7-00000000PO1-1m7N;
	Thu, 18 Sep 2025 15:33:05 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGd3-00000000PJx-1lBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSZphNaJTQZ67xIEzBholTGgGckd6YnWV/QANTlHjkEtg/cW+qk/ptJVTjtDRz98QKwzkBjXu+6hfUecpgVGYS4VfoRkWD9SIvGi/nvo8/fyZ0Rhr8M3+pqPloS5YF3p0Zv8djpftgyB+lb8mbARtn0yaG+S8dnyvvKb18YGPT3hAkr/NngNSftpjtgSl+wDSh3UDG5Y0/Y9ZDSKBhZXjGUwCJhdvbQp7yK15RCOHUJ2mJutnqC1lLMkKTgNQR2qqj8nc4zcEuGt2LTAk5hwNkwrxYUQ08RhB2PhfSwynpU9m1ISsJ1H1ZcNShlranP1AGhQXP7mJ/0qZHcf0Mn/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMOykuDi4HbQRFrpLEPeubxN8rRsbNAAstRJvCbLgDk=;
 b=QUilntjQ+/PsVGDhUjH1Is3EacSY82B9e2UiEe82LNQ+Ze2LLVrpYBjIHi8I8NCYgqNSJcrQzwtlHHvMk/t6Nm+4xDsBXySR7hEv06JGsoCYPGeFAX79dq9tz8MZSKJooAHs31Yd97hiDN5b474umUq2hQAz0+GYbsghFbJ0ACxLm/peeRuef1g8nGrrb/Cc+e6iHEzkSDrh+BAxp5+nY6xd57JpgRigyMPnTw8gpEAA4Haekuv8NXe2X2uAP2+4HM7yIZUw8RgMMnGc+3uAQ3jF3jlt4q7zSUT6NO+bOD7YnWhZqoN5X43dfuCW3AMM11SQ39aOcK011PC1XfRFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMOykuDi4HbQRFrpLEPeubxN8rRsbNAAstRJvCbLgDk=;
 b=XgUz+Wg/lIeh/AatsHKLmXMGpqh209WaJJrKXAnOCsgUJwg+IlcfT7cauLJGWEgvxeFKY6W4TDSMz/3B9vLAGdlpzplDlvQ0jdOcCr4u1Qy6TDtRFmsCz7593xp0u0wPhRJnFyAnjQ1BHoNTWE31jeqRM6X39DO6gJpoXilW+yt3WuobePuxROu1ke3OVG3CXZ3SpBStU2C3b+S+EDWN3KJ2LEPZLvCtkKmCu5MGwt6jeKHZxUvOz++HUtp8DqhztmF6/zNflqhZxI82mIJNs/DnizWqPZdYZuEEUPr2X7eZL4JeWOWyx62ebCqsA0LzF5Yc/2/V/Jl77ja0f9N5Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU6PR04MB11088.eurprd04.prod.outlook.com (2603:10a6:10:5c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 15:32:54 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:32:54 +0000
Date: Thu, 18 Sep 2025 11:32:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: dsa: nxp,sja1105: Add
 reset-gpios property
Message-ID: <aMwmGFkZS1sSQDMD@lizhi-Precision-Tower-5810>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
 <20250918-imx8mp-prt8ml-v2-1-3d84b4fe53de@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx8mp-prt8ml-v2-1-3d84b4fe53de@pengutronix.de>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU6PR04MB11088:EE_
X-MS-Office365-Filtering-Correlation-Id: 776b6ac2-f6f6-48fe-e02b-08ddf6c8a2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ypsaKet77XXyW1gTXutX3trZX73418IQVo2lPhYzEShSIDfJT2K+GDcsEALP?=
 =?us-ascii?Q?SrgkHM8Fr6mF6bttax2BTrE2bIWBOG4tQsB8K1fUtazNjMc6DXwWosEMBG51?=
 =?us-ascii?Q?ZYJdjuF8x0qzc1H1/c2ptAiDEiLZz6FM+boC1mSQ2qLOLx8/JahiXU9zMp4R?=
 =?us-ascii?Q?b+u5s0BixIfXrdFk5QstNZmTC9bXNHYYaw+ZnImlbr+HnBTvAWtkvbT0Lswz?=
 =?us-ascii?Q?d6KkLAZL8wYM5H/6dsdJMp09z6Pal+fOOWIJj0piC4mt56WhwzhUngStZeEL?=
 =?us-ascii?Q?JCQAby2uZ27cG8n4Qr4XuckHWUcWnTE410AvetK5w/87fnfsVhUTtohKs/GF?=
 =?us-ascii?Q?0wEfkKA6VeiiEPsoB7/b+tnmGF9EcUe148ZFHf2uAQcYR+YZRV/yv+gqQPlE?=
 =?us-ascii?Q?Vb+yNa6OSbSMZcXGCJCnlnSQvduz5W5B7VttjT50WC4WEDNzbxqxkhCny+Yx?=
 =?us-ascii?Q?oNnGDLPKeuQQq9ggc/Tb3LZBtT0X+6bO/pEHZwiL0ffeVDrWKoIXymXBHmrY?=
 =?us-ascii?Q?X0wDmZXhCa8qFETUYoI3Lsb2ApyWjvL2QO/Uia6KvuLeCBm7wEnRugA1xw15?=
 =?us-ascii?Q?YwvQHEJX1hcbdedsFstSy1WAxTVlTtzqi5cT1isFqHTRCPONqi1f6iNHt7aX?=
 =?us-ascii?Q?IUL1+aFT+EzNJ10sitU/Ms0Jr3LEPbWF6TMhQsLrTh4eexjBVX3Xx3Yj/YfL?=
 =?us-ascii?Q?pK3bbD+RNYoPbFuHpDHnWCkowa0DejtTOyL0hLA+NCM5qTLoHmcutn9UISJ0?=
 =?us-ascii?Q?tU98S1bPNvOKAf97bA6jmrodd7m8hD0KCTmv7vBxK8Y0Lmj+x2CKuHWN1QX6?=
 =?us-ascii?Q?fhu2O/2iuO2nPMXaNkLrzWEaZLgwJQ22j76V3mK3XMo3JnuW45TFqQt0p+Ar?=
 =?us-ascii?Q?s+zBzp8M1hqOyxk8FhXft0CHKHxhdzOFl6f3xR5LqBrCIWlI2Yf901lSZXHf?=
 =?us-ascii?Q?dE5/oEbWl3KOX4WR4ixSN/A4JrWX85inWZP64lPRZE5YFgq1v8B++1dgy9QS?=
 =?us-ascii?Q?nwyE16x9kOGZZC4gcrjcjFXts2lqPKEonoL5cA8ok44Ndinrz/KiSi5GcQ1J?=
 =?us-ascii?Q?r0uaKvrcUcAa08e9wZ1WS37zXhd0mTeZ0M9/MkkIRI7xzG+98CHfLnywV390?=
 =?us-ascii?Q?7B4j7iGznUSHlIo4/mIWsEhn/DJorkkbX2krXHzSsgn2Y7LvoENuJvm80ulc?=
 =?us-ascii?Q?xYqz2efjIWpGwBnW2yq4Salqu+0Sszt0DXX4knMbuYlpNE7H7x5T81dY33vB?=
 =?us-ascii?Q?GI05E0mm5CFGYyaWWzZ+dNFzNnxXyfLscjJz+RBI8wrk61MFDbcUX1SdJONx?=
 =?us-ascii?Q?K/z7xBkwpPUc8lkYN+ftgkDPDVNhnd6onBtKKsr6JYU4cQrFqzUlbOiNDcla?=
 =?us-ascii?Q?mmMDYEhX6gvaxnAOv0u1GOWRGUk6oz/uk5UXcUr5cYvycFgR5Ek/jeGNJ7uU?=
 =?us-ascii?Q?8nh7CxBcerSfIwF5tdr3rmTwKftbVDc/uBC7I55bUAg5f4VUS02xGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OqDbd7pL84eptzMUqedKThSDnKuvzkMn1zwGDrurGr8xdlj+ry+/An89MTny?=
 =?us-ascii?Q?CiWBGo+mYUuPO3oVdNFU1DlkeYmsBwXf1WCYzaaZaZaGiyT88vzkltyGHH+5?=
 =?us-ascii?Q?GOYmvRwREdFftPvqAW2Tw4661qr8EEgiw02JxVSNnxYP09h3ZCdLw2OYvqpK?=
 =?us-ascii?Q?JMASF4sqFRpzcXPHcUAqAfVIRX6VZj09x5woPPYDgl13gFk9pZFpvgrqG/0Q?=
 =?us-ascii?Q?IFP+hSxCqJQS/PQhCO5lrwswIX3vUitNUyEroQFEss26XS8sbUGEblsrnqg5?=
 =?us-ascii?Q?n464JX2XwV1C1lE5UhmAEKsXB+OU6l5vkeUvU93OEHAIkhxunnIqXLzNztTu?=
 =?us-ascii?Q?wYvJ1aBo00nwAbmH2AjXMVG0bSqjj1TReHOEyXFBz3CgIo8X8z18/RZdKiu8?=
 =?us-ascii?Q?kTReNeP5oEFKZM1SC+EDOsPG1TSgQxdPiMUFVpwXr24FbtabDl9+PncIoLPu?=
 =?us-ascii?Q?7NWumg4p/3/pEzHMsYDi4Rr5s1dbsgBudXHnqiAXFnl4LhZaSHI3ZZuHtfqM?=
 =?us-ascii?Q?jAOtg9u9Rf1y9Hgppc4iCIry7meLHCDl+wQarC+CH1KZMBHDgY6vyZDkBcrN?=
 =?us-ascii?Q?oEDQpxvxu5ZIVHRl26t4DaZ7Czd+Anx9QQk7naOQcXItO2oA99kGws5jmAcg?=
 =?us-ascii?Q?8ysw5j4ESyc/CmARuydl6xKRM6somYiHAh+EAPfvop4PcsRLeExh8IZ1eIkO?=
 =?us-ascii?Q?1w17S3jOModqsjydC6+lgod+eDxYIQa8ElOddCl4fyz22Y8DtlcT9o01Qhnc?=
 =?us-ascii?Q?b8WVUubwFDhDJLhDvy2wEwCrUddTA5Wo0V9Fv5RSU1fcQ2wwaxidy9wpg9up?=
 =?us-ascii?Q?a6xZam3XSgz640XF5hsXFWsdTdgPkU79MJPzHlqQxjTliQ9sFCPLIUr/19pO?=
 =?us-ascii?Q?kp71UkZt9uNHU6r9M7daMKou+4ZkSDqPWWQbkege90paeO9IGZmcuU6Pew02?=
 =?us-ascii?Q?gB/VBGjhJM41EJE1PSwp9Yy7DfEg3Mzsvz3g94EIuBAS3jARFAqMhbS1Hx09?=
 =?us-ascii?Q?RMtcW3A2pZOnY6GmbIivcK18xohMrwKrTtMQHGLDpRoyZyPa5Rh94ozpvPal?=
 =?us-ascii?Q?qbAuCY06vHRFxzlCGXKJR3B8H4uaQfL7qr2mcAoCogbkK5kN9YQf3zxUg72Q?=
 =?us-ascii?Q?jTLorziKApc/rh37xWJlJ9y3Kp2XX1LPYTABuPPTeckEUVYg31ZtiMRRNk+j?=
 =?us-ascii?Q?l+iF8h2igxGlADfkEQLrBhyhezDHLP5ndFjLVwLl8XivpiCUVvBt3zBpnr4s?=
 =?us-ascii?Q?APnX0P8PVK4IqBeHJBn9tZs6eYbOgmTmbcQZaAoxSxZdlS8G+PDHapUCEKAh?=
 =?us-ascii?Q?FS9EKv6ZZCMBcmhWvzyRkYriatFRJKyuoHk4PRxcLVUAOOGl8Dq8mDOiGTS+?=
 =?us-ascii?Q?6DlGMmKsLLEZrM4gVFjZpIrEVaSo8Tm519DChYEJlYGegcKrGfEfrt2GvbRz?=
 =?us-ascii?Q?vDMNxE0aAuR7igFH+Yx9I4w+dENiLHANNM0z5Bo+MGSFuqMa6KkHf6XV5iG0?=
 =?us-ascii?Q?LTe2JZveyJRLZfZQEmpD93aaqJM7Pr8xCLcyrfgdlmbBHFp55MaisotfDKxx?=
 =?us-ascii?Q?VyQSf3kYpML5MY3FrLH5c398sM5GXl/j4CeFcDTv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776b6ac2-f6f6-48fe-e02b-08ddf6c8a2dd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:32:54.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCw+tLCfiyMUCKmr0G1H8f/VMdcAjZPWJD/bDO8vryLH9fQCN+qkLO8/FBOrLZLjXRavYeervg29eyTxRmaCTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083301_519011_02CBB0DC 
X-CRM114-Status: GOOD (  17.49  )
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

On Thu, Sep 18, 2025 at 02:19:44PM +0200, Jonas Rebmann wrote:
> Both the nxp,sja1105 and the nxp,sja1110 series feature an active-low
> reset pin, rendering reset-gpios a valid property for all of the
> nxp,sja1105 family.
>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> index 9432565f4f5d..e9dd914b0734 100644
> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> @@ -32,6 +32,15 @@ properties:
>    reg:
>      maxItems: 1
>
> +  reset-gpios:
> +    description:
> +      A GPIO connected to the active-low RST_N pin of the SJA1105. Note that
> +      reset of this chip is performed via SPI and the RST_N pin must be wired
> +      to satisfy the power-up sequence documented in "SJA1105PQRS Application
> +      Hints" (AH1704) sec. 2.4.4. Connecting the SJA1105 RST_N pin to a GPIO is
> +      therefore discouraged.
> +    maxItems: 1
> +
>    spi-cpha: true
>    spi-cpol: true
>
>
> --
> 2.51.0.178.g2462961280
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AFEC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyhAoGxj55cbivasTjcwPKxNJpR9jGQ8uiJDe/6cBII=; b=i+QViuFvGRwbFTsyZYV8/i07d2
	pFLtgNyoN0WQaVg7KoY6/7zLwU5nlJhKyT77mtA+AGBfvnMmpxe7ytikjuLa6MS6IF/Ynr+P4SKuD
	THPZHVPidCHaN6RTjlclZEUpthmgeP5WRejjqcTeNL4SXOp/nF9JMm9qqiA/uuFfkZpbOEmXGl7jq
	AyvlsVTYOdA431y1vDNu7n1iraJ6eKaHtIDgp2baSh7iy46luuPD6OH9lkWG8oyGBLgHmgq2XEVuZ
	yAyINF9+lJdrS8B8BT7ebqJPXLWU2N3NWpoMyeTgJ4tL+TJnyQJyqs7qrPLPsfpYmmn9EjVsmQMT4
	yQkqS6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujctx-0000000F5eR-09Ly;
	Wed, 06 Aug 2025 12:05:49 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujcYW-0000000F2Uy-3pVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 11:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6vPzj1dtskRZg+EPANNmcsXeau9jegmtra6VLYBxY/jJkLdB3hjh42uOOVnd3h1Du/7n59BkDRQgk51W7f5lR1Ci68XPLOW64MmhpDO4phQfJeVkkKmCr0otzRj7ROCDVcL4/vlhbF+bceho29M0UQVSSiy4FEKf2JQj8cuS6zT/Jo0CtuTwmDjgG7SZAKzGwxPPJlTsY3kP6ZXP41wYjgEyCPZOrF0sPAqpdfMszvn8Gbb5nvwk3SjSkzu+QhdMYftbwK9GDhxCcHQR696Ul9TOWKMix6zNK0HAz4qR10PhBsUiEOFXH2jk/RDn8FoFmjnagL95OQ+RlbGT6bg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyhAoGxj55cbivasTjcwPKxNJpR9jGQ8uiJDe/6cBII=;
 b=vs2as9O//MXOnshl+CrwFhW7+C9ww/5Z9wdOuI7eWlAFQy+SlwLCfBmol0VuXlo4md4T4VHgf+9o0tIogDOe5i+HK6b4YUgASaTdeyu9wW/pNV1RjfHxO6OqGl+uWilZGavrJZVA55c1dNTVhS4IkgwSSRBZHc8mc8fvPC/TlNSZsbzkM6vFfK33YHqLHpBmrVqLJkV5mOTeUokjnm/yM371Af8xtsncEnk9PbLFTT+7o1VNTDSMTVWa0ZtWsjM3SVhebkOZZV9Dq5U+ZwVGAD+x+ECZeCQ34dCcnIBu7I2MxeW7Zp9OVlinBhgc9KL6bneBoQcJz/C4Snarih/pRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyhAoGxj55cbivasTjcwPKxNJpR9jGQ8uiJDe/6cBII=;
 b=cKxbtalhnOozhoDS8sBVS4moc/GCIe27URenwq9suVLmlTGKIohXq/8S9naBEZK0Ie7vNih8Llu6T18oH1j1HV4rSnUNrW/dt/RHKqmgjC4cinm8oAfwJMJU8EfgP5oueH45RYutnOG2yFbSgwx4JNPzsEM7o3wyPjCKDaQHO2Lmb6XzSsL8MJROe54ESa7wO5psqMQR91D65MflTVFgZ8v6wHreCF5eGM/m3QeRBfc7bX1GxjjsV11HEDATLGkY9OLyKKJ5PYjED4rXBGnuPhzsnHJeu1AGgjCaQXDScUKGvPfnmrUfH/9QXCMQhg3GDDZiFZ6pMIqt15o32WSOqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 11:43:38 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 11:43:38 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	richardcochran@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	frieder.schrempf@kontron.de,
	primoz.fiser@norik.com,
	othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com,
	alexander.stein@ew.tq-group.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	netdev@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: [PATCH v8 08/11] arm64: defconfig: enable i.MX91 pinctrl
Date: Wed,  6 Aug 2025 19:41:16 +0800
Message-Id: <20250806114119.1948624-9-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250806114119.1948624-1-joy.zou@nxp.com>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: eec748f3-7272-4971-d655-08ddd4de7b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/IUa60M8EVydg32C+pjrrw4erhY86zq1UcEqgHpSGhRPOTJEw6ykow4M4UxT?=
 =?us-ascii?Q?W1auw82XFBf+fP7jgYLhXeyxsebIeld81daZyL7P/j0K+Tyu9ZWYRM2XRiA2?=
 =?us-ascii?Q?7kVdEoaRtmCmKP9UiSN++woCxMsT1/ShMoBTmuUcpJdo+4+T02PpMochNHYa?=
 =?us-ascii?Q?SmY3+S0nvU6AEb+i7y9DThuJFUQXFTPr239IZeDgkJ5rFYrlAOaFT+VVrYyu?=
 =?us-ascii?Q?6Bt/zkxdCDKYHzqIJF/Jgo195U8jihIuRYpH74a3kzOpbrksc5erAWyjH19N?=
 =?us-ascii?Q?EcHaIgicYYGlSm/RP99OsNeqf8CpQsle0gEAuJ4JaGyz72Yn4d64mBgf5pjM?=
 =?us-ascii?Q?AC3IWOjasDftnYXUPc9u441k60L6h23DYo3MWYg94/yVU2JR0/hp4hm1hwuc?=
 =?us-ascii?Q?luSV9tSAGw/BaTWIycqBbOU7ibnURfWayE+C1u7mFMkaJZ7oeQGEkiZe3nnj?=
 =?us-ascii?Q?rYfQtSv8Px5BMSBcnLo7vDc+Ai8KRB9G5Oww1wBx3+uANlHMJQMumklh1Rfh?=
 =?us-ascii?Q?in9j8IRhCtOXWKqiHYHYtGz6xq0lHpBQfpQZrjAdlMKw3Sizrs5gH8fZNyvS?=
 =?us-ascii?Q?/XZ72CVYPeKJ6/1moCEcNbj1/4nqpv1ZdcWSChJllvHFOlbHtlpfvQJJ4wcm?=
 =?us-ascii?Q?0C2BTohu7rOeXKG0DQucPDMbuW/rlMIOmUodGcR7TXXaRkjfTV5StrmGfBqK?=
 =?us-ascii?Q?se0Tu9iO0LObDsyVx3W0FoeeCalPRXpZkDyqpX696il7aOjpXxsfASZXlf1k?=
 =?us-ascii?Q?TM/cKSwHs3IOMCMjnkz2rsMiI89LV73Y7YVB3b+Vbg75V5/5/nnVSp7WUZ5O?=
 =?us-ascii?Q?Z2FxCAnxN/T5/CFtc+it/RG+C2pLEY619nyeKiGeaKg/OQSYMETU+5gXjq/S?=
 =?us-ascii?Q?fKpLsMwUtvKYfd1sFRlMVJInAi4wBGVf/YzODaTNo7QHjDIfNZuXUTptlAuu?=
 =?us-ascii?Q?PQReLzg59ICahOjg+447EJOr3mp6uNP4XIL3EAkAez4kInpTUgVptuqHOc9q?=
 =?us-ascii?Q?PH+RcGyRV7xkXXUO6dp5maz9hSdvOzjl/o6muJq5jhfmmWJuVbESV8ncAMxq?=
 =?us-ascii?Q?Nq/z+NLD935Dy3hTMTo/dkytL/dJPhGEXYGg3cy2hc2VqmrM5rKkL8oiwWCr?=
 =?us-ascii?Q?KhyfQcTYN8knWF5/UUklQMQ65dVfB/mjvJSz8ygmhKOn+YFLoZViYwnsmWxT?=
 =?us-ascii?Q?Zh1eNwdw0zG4Nr3ffho98+hZ7MxJ5wBL7IcGgH4ucNikedxuxOzldgO05pU0?=
 =?us-ascii?Q?I+HIaFkyEshLH//hTsg5hfiSV0jq37nSvOBWfO2hWt1vJDN+yDyPCowLQC/I?=
 =?us-ascii?Q?ertzxNSKqQEkWL5Cz9srhy/0wRykHmsncIX1rOKexaOEO/7Opgb6GwFHmKZg?=
 =?us-ascii?Q?f0DDd3NtZ63K59jvZb48rhgwRZ0CnHvHk6rRDK1+oQq9udpmxPxneiMV+8A6?=
 =?us-ascii?Q?c7A3GfPWrxprdkC6qgXyRMFgQD5ue5eH3ibaJ+bNJMDTMTwznkqVYP/6oJJQ?=
 =?us-ascii?Q?+pHhbWlwsM7FeSU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPnDf2x0BU8p6Jc5M78UPLl1orNu/d3p6RYo5Z53FIs9jk5zMP0T4XO76oW+?=
 =?us-ascii?Q?OTpb/0oFJIKClwFZ+cqhgznz+CWjOtOWzL0/XexERzRoRbBGIqZUFaiiqJzr?=
 =?us-ascii?Q?WnjTd6FXeJOEl2fV6muEO+pmtzDcsm45tksAISsCqaryl//jhjzGCQKdhXz3?=
 =?us-ascii?Q?11vJMCjWGPtWxLmUx/w+GTiG9o6fyOPDlPcjPJoImCJZfgi08+mwpozUOgIB?=
 =?us-ascii?Q?7uJ21DbjUFgONYNQFvAriYLRTmXOLykbrJiv908L3+/g06UxWMk4f0c0H973?=
 =?us-ascii?Q?KmKwFWsj9zI6wh1a+j51JauH9Jyie6/U/9JUSQWxWI7a8ynn39tGqR6I5qeM?=
 =?us-ascii?Q?SJrNOrDPhNfUsB0FvY2uh6U5mNHKVdOceJrJ2bSLJ3UWcDOAYqjXZhXmebLM?=
 =?us-ascii?Q?6sqf0fbkzzDGwNIL+G88fzgz25XAlqlNGYyotuYtLm1IZn2g1muWKDt6OTCG?=
 =?us-ascii?Q?AV6Gg61XH7uedr1UGy96I1h9IzeptSUfXY6pT/+6z5sA8ViWZs576W8ux0gF?=
 =?us-ascii?Q?J09bLe7g4PwbPNzOQJPim3cJycelgLNYRX6tFiaY9fRGy4cuG7Qmp/5+xAsY?=
 =?us-ascii?Q?rWts+9pU1uw5HTYjEhZo0rqbxBR3nSDK1gR5jVvHfvGFW5Xm3zl+bi/MNtfQ?=
 =?us-ascii?Q?5+uqcUkZ3HBE1VvdAvAuQFTonuHmEuFRYhR6jEvMlmTz9CBno7ZRVY2kHU9U?=
 =?us-ascii?Q?+wxXIA0vbfDs1aHAqkbpQsVVHhFGVBjUwMUC5X/Ps0oJ3/lQ/SXZYrS2pSmI?=
 =?us-ascii?Q?Fze5JJea5KhBPei5vuqsZT1go0Ew5YleHxvbYskSvEXnJ6d6O4i1GmoZjGpl?=
 =?us-ascii?Q?A2d3YspuUok6mpyjMo1s4wyHm46bfvz0vMGdOwQE+rqAhBi5PTkdbhn4Y05C?=
 =?us-ascii?Q?54++xXgck0itq6XtQ4fzXnFJVdW7iC4VSNhdX5IwqonY3BUXqBzz/A8tmpyL?=
 =?us-ascii?Q?xB3c7/Up/g03K5Gt+wznAkrjqWIiGPgmDKphq6G2ocZJzMkJjNSwruhRFK1c?=
 =?us-ascii?Q?6kaDG9AZLFce9KJbEMotgQJkztQ4YOdiJE0Uhcm9KpIhGLiUoBdxzaYTZMZi?=
 =?us-ascii?Q?lSHC1lkRkkzR/SM1boJqlZ81vnUZvi/1eYNQ5WNXuPR9URfITgGDuGu4bGPM?=
 =?us-ascii?Q?qBy0o2HKAoiRmPGJ6xCyoWqWzVu/wJpTPAMbDSW0NoWGtb7FyWb3zg3dr074?=
 =?us-ascii?Q?RQLrQMNoJ0WA+cpmSFxv9kWtsP1ef4ugNKwaC/ZdhiXxNcf1Ec/KATQj1dnx?=
 =?us-ascii?Q?Tf1sZLJZSbRfIeGmv/eH98bctCFtIoDaen6N3SspK+fRAxWbEHI6uR24T+5d?=
 =?us-ascii?Q?3gHiAkierYr0IhociqmGTlwN9SV6zIf2CxsWfWWKT+CPvv3YvEHfxsacusN3?=
 =?us-ascii?Q?Z03GRIrcBDOPeuf8iNPN6wv8omURswltFoMxj8MqweZkHZ3NeMTfuQbyvZTJ?=
 =?us-ascii?Q?lMAwXsqffWasyrxmcWE0sJ0FTNYd56qrYp2lLmOpTAVKUbHzOo48JR4WWTRB?=
 =?us-ascii?Q?7XLS5hU+bSE3RjjAk+xkV2nGlFvNqQuAtZ7TXy0/Vm2WBAmOmjGsIybvHxMz?=
 =?us-ascii?Q?WucUy6IqnDd/cXgrVs7Sq/MVQ7SbzT35PehExXGh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec748f3-7272-4971-d655-08ddd4de7b72
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:43:37.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnN6stjRR4vgWIq9hXHszQwSDYWo6WKp/N1yNqgjrRxmRMjWGOHufBbxG+6gc4Z1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_044340_952200_4CC163D0 
X-CRM114-Status: UNSURE (   8.89  )
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

Enable i.MX91 pinctrl driver for booting the system.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1052af7c9860..2ae60f66ceb3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -602,6 +602,7 @@ CONFIG_PINCTRL_IMX8QM=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
+CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
-- 
2.37.1



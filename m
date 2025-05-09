Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A8C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naf0LHLjSJBElQsW9Z4WdMhj636e75/iEoreyB3EXPY=; b=yt4WTk7ZshAo93pFGf2zSvjYUZ
	gQyc3D/fMIEDXfFbzhcikdye7+DVgySYLRWFqPAtDHkdYXIBCHj0wK8JGyDseOj84A7IAqZlHCENN
	BUKj1xYB8LbvNkTh/mZfVJKWLBVSRa+Vi8BZu/vnLiM4ZBV0PN8XFaPT5jOZNYKGauX19qyRsprQD
	U5jFnu83fiiJhXfw19WYdyiWkIMcNGwj+yAOFcfmU4L8v+al4D2WoadMQKkFzBxdE6D8ke+E0KoQs
	qVBymaIifKh7Fe8ytDJCh74P+WbYjM/63It0DagCCgceeRtYHsvSRH2+paperoCmZqjkzGQdhm84t
	+fFyenlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRXo-00000004RKY-2CzL;
	Fri, 09 May 2025 17:29:56 +0000
Received: from mail-vi1eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2613::609] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPfy-000000045It-4Bcx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djJNRzGoXRdVVTns0nwC8jeSGiIxWa39GK6VRq9B5N7xG6LyvWjxEhAneNH4F8qyN73L2h3emfDY9I7TxFOpnxcRGeU7DnDbb/1EfKvVF4jWhOd9HQ5QMjpSRZv3ozupm5QXojV7sze8YVG9uawVqsYkSeB1gcQD7SFvEdTxjO1ets+jPJxvPityte8ShdgVNqCG0319n5yzi1/LYAEAU/LU4zdfKh7M1TvFNGbTdtov4NytcU1uBFJt3mS+Dd/cavCLiEmwy8XTRNSQYWcUyvmAiOlYUpEBD1J3glxB6oyUX+Dltouua8011hpzxj0QnwKHvLqZKa98FoECX9ftAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naf0LHLjSJBElQsW9Z4WdMhj636e75/iEoreyB3EXPY=;
 b=A5D4/V6kOxLJfCPFWpXMsjDMZIbpPJB564euagKqn4xy0KrFT0Sf5JAJmNvKfQvijL6A8+cOGd/YLHGl5bo3rDLPDc6agdx1uptG/UvNFf613Bconf2scYZ5/Shgdqyq9+IFTJkVCMnfwkCVJAMZcZ9HfkXK1oV3nZWUHHU/ZCx/V7IDn2O9AIi8rzGukHAr5UenTVz7RxLAYFfJSfMlyFb0KSeQdlpsjAQKu1Q0p7WJcmdRh1RdLVAwg5PAw0Y3f0jCgDlTQsJRMhE44NmjDVM8iFo6tyBoCUkxQ857JfnxfGBFSDJ42lK9sKBiY0Ey7l7YKack+Q214Hd5u6KFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naf0LHLjSJBElQsW9Z4WdMhj636e75/iEoreyB3EXPY=;
 b=N50WVtQqQ/aKje7jzJ0fWzmtQ6pFS8JxbJNbwSgblyKZ4srG/Z93YMjYy2OrAlqYyfMwwTCovWuu+uEDNg67fCEwfpyGn0iU/cOhAqtRtpbpLb1M0ZSxKpsH9SsMzlt1s0JJLo94oQJgfJvjA6NvnbqjPqOdYqFEhJCeskRfSfhc/R+/rzr6xKf2Zhd9bspvkjyn4OYyaYalJ2spTQRyNsJNLwEEabv+K8NFnmxweN88hxvNMbxVi+zoyGsDvQr5JyMujNHT/L0+oORpU5vnDBZ+ztZAs7v14lr5TlhrWzEVLf601OWYEPdlXG3e75tdBvHq70bMNdQsLV5ku1yhaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:06 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:06 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 4/6] arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Fri,  9 May 2025 18:29:38 +0300
Message-Id: <20250509152940.2004660-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:208:14::31) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ec8070-03d4-4935-b28d-08dd8f0e6075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N9lX2lCc52IPGwAmX2NvJGb7z8RjtsxCXh3tMWq/OrA5T4NLdilP00GNp9wL?=
 =?us-ascii?Q?jv44N8WGUJN+XKWHAJf7I2bHUaD0N6JpUzdcdB/kdhLDRnxudUoXYcQJC7Ce?=
 =?us-ascii?Q?qIHTfd35boqqdaK8HqKLAXRG3LtyuET610MJnBLQd/O+WH4K3Ujt6qe30Jqa?=
 =?us-ascii?Q?y6ve8ohp3V64Z7SrVhshfP5bObB1HxDuwpMzolWH3QFQyNf/LO4PGPNdOnPx?=
 =?us-ascii?Q?toN3UL4O/ACa7Ev1IA1D/5QZmvda4mPl0zDbWEZMfgImYd4QCFKeDPbOGHiA?=
 =?us-ascii?Q?IvA3WE+NTdpD2cY5mPhaci0LTmHTcoNBzf+XFuvX/ArHpyuHfrs15jKEsbyp?=
 =?us-ascii?Q?EMbREHVYPh4UTiqE7XwvsiH6Co+N8swBuHAhIwBIXXie8qRWUbh+gnwAODRt?=
 =?us-ascii?Q?BnNAOkIHao+JpDyf9t5P27Frc2kMTSGVeGOPl5LFASjQPwEdhp/f8JlsWoWu?=
 =?us-ascii?Q?7h+8vBuZ5IEVuv51QcvjmMjit0kMTab/laXc/hpRHA7BYQy+Grko68TmwUK8?=
 =?us-ascii?Q?YtS8jEj57Z3vC1qv3ZPd3/3nCHrC3hxRNcZ17cpDrpKoRQdcFTc/2n9FV7LX?=
 =?us-ascii?Q?gpZN2vwpfhOfldQAwdVycrrKQJmWuVMKdCSI39X+leUMm7IEF/zKdsXPKlfy?=
 =?us-ascii?Q?1ioUjOB99dMX3sfMPiJFhIlYYIvQzDr+xJ40w457tlnAANfXoEtZrhzZCaXq?=
 =?us-ascii?Q?0Ocqww08MBddGlrvP0myFy6TItdZbo6CSRGecEL8kqzql+yqvhb/+rMWbpFt?=
 =?us-ascii?Q?H4kCBs1UArw4Q0qpmQULO1h9r2ewoJa0p5E47fRmdCfSN7+60ClX9VByPoMn?=
 =?us-ascii?Q?AfujjTC9mLFC36M0JNgLZgz4GwUrMiOwhxio7XSjL0vffphqD+iqtJr3Grxm?=
 =?us-ascii?Q?5IjhuG6t7IH5q/T2ZZKHXcfvmotWDIktURm673YXrVBpi6jd5DFyXF9pg9uu?=
 =?us-ascii?Q?rsMnnY3X0oOLER7veOLTsmxJxe77ATA9JkWPvhdoNkbT7FCsoxow54DeCDpZ?=
 =?us-ascii?Q?mUYvcSGd1XZ5RZtsVwkH4s3aGKLM/fpf6ENMGHKlkADKHZhVpM3xnrLOoszu?=
 =?us-ascii?Q?25xgOWMTR+/BfCGPQuffUnMSkc4DTS5rlqFjfvQEaRZSrW47so73NoD7cNKI?=
 =?us-ascii?Q?PPYmjdAG8m8hB9l0s4HVtvPKqkg2GqOW5tneESSRKv8B8IZpYUkcv691Gr1e?=
 =?us-ascii?Q?UAlLHX3PrbiAqjxvrLEq3aADUqmtKbculIRo+BCsmiS4mle33eNPET+l7ORX?=
 =?us-ascii?Q?RwnyXXxFcsZ4LO2miFEZnZdtbOJ2joPhYuB5tCIwJnizytV6WYoDbB7RtOir?=
 =?us-ascii?Q?L69kw+453fU7RXK1SAwzSXqpJKxuRXw/B84caeR3dN4uXivv05h6xTwCZMoc?=
 =?us-ascii?Q?ohOZHvKrMPWgrY5sBVv9HYJ51zoEOkEwu2LpkCOyHpYZQqGDCQEYZyUHZSl+?=
 =?us-ascii?Q?LY+SZaekIc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WmdnIH5g5KvnVNJG8JXSdN+QoABjp2sCx4P4jPPCz/ufGQFUHY3L3FZ1owY?=
 =?us-ascii?Q?3/f0iB/oxbzO08KXKnFbLaanz/hmENPGHuZYUnZB/2cuIfnhzc2gzwHpnR/m?=
 =?us-ascii?Q?yWIBAtmfGNAHon2Wf5Mn3QaJxRadfwYF4cIG0TSItOPKnfvuCNsy4kV8fk1w?=
 =?us-ascii?Q?vJ3ABzASvsxMbyQPXi3vVe4GJBiqdW8WmJ2nEcLbA59khTZCubmjkm1zMXXj?=
 =?us-ascii?Q?07zuGSIYJ7vpKW6MEPbjpu5vVuEJ5MzQ0TJ0F73Yezd3L+Tg3/Spnuwa1yg4?=
 =?us-ascii?Q?7dcMZLwaymbg8Wdgedq9m6YPqIdkXe5qODDRKCTdqr5ntYHSapQkdN+lAD5Y?=
 =?us-ascii?Q?gpUkZTH+vqUpoO2LYOSPsDBzXSs2w+Bo8Li48o+m8F5vOG/68paFhigUzwPb?=
 =?us-ascii?Q?eBj5TVA9LUGSnwTNhc6HAImpgyp2Lqs2fWFJBA9cMVUmOJpI4gBPdqm6/kAb?=
 =?us-ascii?Q?5ATCMYY2t4wgXr9Xg4Zo6MeceAYGhlfCtAbA+WmFGDX64nJb521NUmQ05aF9?=
 =?us-ascii?Q?lotJv97H8PznAfpZZcfB0+rYv3MOmwvnL11NwiTbHFZZ//NLtYGe99esJnmD?=
 =?us-ascii?Q?xLJl926Wf5NnJU5O8fRWCZErj/Ve4cydW8jGCHPGRQd5IPwPYMfqGR8a/rCh?=
 =?us-ascii?Q?QMlVSwCfJYP2SIdVWSFX9dGsFyHnHFyHZIq8k4a71BfDJrNjuSEOTWWPLIMp?=
 =?us-ascii?Q?4FHq2g34DGFw7HbO1xRuMb2kBzHhGwVedTPs3RbPaDhaRRNx1b2DPW0aujtZ?=
 =?us-ascii?Q?XULpnoyZghX+kWg10FSVDbf6yOOk42XZ3hz8+BegFaI/hl1CszvFn2murQi3?=
 =?us-ascii?Q?z1ZQXisrvcyRAV/tQUtF8t8CsNNuzdm9mU6O1IOu60sEoGN1b9andTPcrBXP?=
 =?us-ascii?Q?P+mXcBYrP03zHlUj5r/kyhZRWjAlxuPXF4c5nZKBGJoVRXLUuAQTTJAN5+6Z?=
 =?us-ascii?Q?UuuOY0iQdhWS8KICAKzEeZKLj2ra0CA/Fnr6sos2wo1MI5AvjT0nJ3gTDIP3?=
 =?us-ascii?Q?XWslZZffrAf7vzSO2FLK3EjzCKj+70JQkF43L1EAvi9CKcUaH+9PvCJ/Jk4u?=
 =?us-ascii?Q?7f7larCH+iJR46vjvxMQIEzLYXk9MgwS6wlGlwgaa1DASiAgdrKzwXa//OHt?=
 =?us-ascii?Q?bFj9BSXRlDpGRZzFY2IEDvnfV388157rKM82ftmTOgQgpj38FGJoPF0H6C5V?=
 =?us-ascii?Q?to2KGbeFtO/bQhwI2KTUKOp4uu0Y2kQnwSjs0kE7h0wLS+hqqgH8lSH8a1d7?=
 =?us-ascii?Q?AZAriD3PiRV5h6hiD3xVBlDn6rhKLXLA6U76fIAN1cCUv1G6loQT4VBbn9ht?=
 =?us-ascii?Q?kU8aitP/O7JATLlYUfiTDMF3nO8yw2LNxW89KokV8ZSO65LD67sFjFMKodfj?=
 =?us-ascii?Q?57CdkbCMBuQma+W2fbYYs+rjUpOscVc50LWxUDZ+xgKHV/H8YND0XI1TLCpV?=
 =?us-ascii?Q?CAGaHD3zOQNbUJxzQGlPR8IEgaxxCskl9d+sOziWGH54O+9nsCBMHCP8bEdr?=
 =?us-ascii?Q?hHs6wSGvdnTvLYlRXGOW48u3bH5m7dHpJgzWB60psGUf8KFaGjY4n+zjKL8n?=
 =?us-ascii?Q?PvefI3wlgukg6vN/a6MD26MY8Y1GFHVGuzUnsNOM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ec8070-03d4-4935-b28d-08dd8f0e6075
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:06.8271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xPuoXvzdefZ0BnKHZOGIljQ+L5Nb1WeOxBh36tkKcLkAZjA42mDkEr5UtmyVrSVBotgI5y9nQ5VtrM1V80/Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083015_048342_C6BEA5A3 
X-CRM114-Status: GOOD (  18.61  )
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

The MDIO mux on the LX2162A-QDS never worked in mainline. This is
because the on-board QIXIS FPGA does not have a driver that could probe
it and register an I2C regmap for it which could, afterwards, be used by
the child devices - such as the mux-controller.

There is a downstream driver for the QIXIS CPLD:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Since we want the QIXIS CPLD to have child nodes with "reg" and the
current format lacks that, change the compatible string so that we make
it clear that by using the simple-mfd-i2c driver, and its
fsl,lx2162a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string

 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 9f5ff1ffe7d5..9c0c7724d569 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -267,12 +267,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2162a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
 					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
-- 
2.25.1



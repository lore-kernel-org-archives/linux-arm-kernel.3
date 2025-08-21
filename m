Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6731CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkDcGmgaBXk9MG9vockMo54MKPbGDU/TSR8Zz+T8mXM=; b=abOtbntll6uC7eK94CRgv/zlmK
	ePpTc02557UuTJNZ6gKWihjCpYYjIKEztu4iBzDnQiZC6YDbLy0/X34+183BkX7+aK81F1miFjTdl
	QXcJrrP3soGFyxc5uCqPNXwGpw6a9aOsTGI00uY8XVXJMJMWaYWV61ZwXQGzdoa0o2gLEqSQxQx4p
	Xk9MZFtFpiRJ7xUweB79W1dgCJdI6F3Ofba1tJljLVMIWxNmZ4uMvaXO6RwHjLwM2+fZs8BuWLpzu
	NkLQMiTdEVCn1gEmlMfuxTUupBvGxJ+LGApyeG414O2ZiEMUxg58ddkHYYLrySW9RgXyK87GwH97Q
	vannehKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mL-0000000GR7F-0UXa;
	Thu, 21 Aug 2025 09:40:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoznr-0000000G7X8-32ff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0fv855g9R1RUL1u+rNSWgnDFq3oDZC0ARFd5cnP2KNkh41+LnAYmZ++1/6LaTxKPAk3KWDqda4gL0RwN/Zp1gKi1nMU6mEvQ3wN9TMvthLuhyg/50CwaikLTnuxMWSNkbXye5nfbPjyxkNOKcuZc9nU3P8ArJgN0c1NJK14UN/gBm++ItDWobcBkKdNgYeF6zN3IUbR4T/mTeazggXKGNSeOIKyjnQ43rFRqhjiluXaMFMaUA+HCDqdImncGO1mpK9eHKjJaFOKHaQ5W8tS4ScPWBcDcqAxXJi3KFbNg+QrieByXFpJv2qg4IxBeFb/cyGwJO0rMnRb007cgd6/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkDcGmgaBXk9MG9vockMo54MKPbGDU/TSR8Zz+T8mXM=;
 b=glbY3iDn3OUqJeNRyUlM+3rf1EsEo22QqRPmbjbMHjL+9g4vOnu3fEblJdtG4L4IColHbarCJHMQ+KWRx3cnsWBDbmyWKU+GbHW3tGoRWC1q6vljBlC3bXh+IZw8MCXR/u+6WSy2x5JtSxDr/Dl+IpgieAV3d69WXZrXap39l/uG4Rcl+eTWAlhx+UaHh+UjJtmqGQgaYU1rGGhuCcnz3PGG5Z9973OrfBv8g2b4Ad8ncrd/68UBaR9g/VPzfuT++SfQXkiqtSJBuRBLgyymuu3WIhuAmBSA3662AErCIRUcZllYq5Oxmq0SlZJPYcZkAZaALMEEmeNT8sZuTRXP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkDcGmgaBXk9MG9vockMo54MKPbGDU/TSR8Zz+T8mXM=;
 b=PntFOpumHM4ItrruE51D/zXA1zYz2wiEI4573dpyRpSxYLHY4Qxi9Dq3SUOSeYu42KUZr65dJ9iAE6mFwYdbJXiomhflhGH4LvVWy1nmt6IbKH6ZEDkI+q7W0Ph1pBc1q+6QvU8nIP05v2DlTLsneykwFDA94ltLeiCTtRGDBtusRmohDrv5LI3W80RPrcKfOVGsDW8HlnmWwbaaW+rOLACUgOXvTGurAYXktsWJoKIcwyI3YPrVBhWn1BjS0j5GtMkjexZ8G1x/AMR3Tbv8qWCT4O8u92FMV5SQoRZVUuQKYa1rwDM1dPXFzA3mJdlQBLOWAgG184sUrEJRGnHJUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 07:33:35 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:33:35 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	lumag@kernel.org,
	dianders@chromium.org,
	cristian.ciocaltea@collabora.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	l.stach@pengutronix.de,
	shengjiu.wang@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v5 7/7] arm64: dts: imx8mp-evk: enable hdmi_pai device
Date: Thu, 21 Aug 2025 15:31:31 +0800
Message-Id: <20250821073131.2550798-8-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 79827e2a-ded6-4092-bcbd-08dde08509b3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RN8GKoatnvdslMWTP1LJ68Fj9XEDtjmDwB05gA1Ni8xZVALgpa1jfy0Osay7?=
 =?us-ascii?Q?nHU1lfcAQ7P5EVNmdqFFBvhawiD3r8QTcM5wDn2fL1sGJSBm3rgaRl6GWkvk?=
 =?us-ascii?Q?ij6S++2cLcbvldaCJjy0P6LIiUFwC7TnWiJQoTdT7g1cFw4TXEPH3Dtk3w+S?=
 =?us-ascii?Q?WUYpY1b+OKuFiYBzuFM9PJ2QNDaAZAA1l/ocoPDNgmbjX/IUpiyLQwfQMZup?=
 =?us-ascii?Q?PctWaX+sKURpVKJ2rEe4jguoo9Jm//jN+Iq983CEkr/dDh9ZQ/1udACRv1p3?=
 =?us-ascii?Q?aMS9OTNNJVC/rQY6DoVJ5DvWnasNsOO+p7eGyewWnZYvd0Gm+iNvNhOddkI0?=
 =?us-ascii?Q?X/BQVVBGG4WKzgY2JioFBbdMtF+iXFHKahUpL5zSltcDnAe2Y8sPcOUXhtp8?=
 =?us-ascii?Q?HypxdIhHSZj3BCWy6r+ZCyPvchJ0Uo16HntehLHE84edzBZgg+GFDj0rqY4M?=
 =?us-ascii?Q?ZHfJTWoAjyMn9ld4bZGumPXAIfRT+GKoLyAwu2dKHFCQycvYU68MgWo3wjyd?=
 =?us-ascii?Q?5gQpnORPeAXeDfPMIJyIKu4FSCvO2xtasoKxwyF8jGRI9d5FL+t7XZhYmCmv?=
 =?us-ascii?Q?4m3SK2ta/dEU9Wz3JvCI1lbLz5sFXa/BUURo6TAbNsZC4tjZhT1jly2K5DvQ?=
 =?us-ascii?Q?UOoJTZW4zNCqIpiQKVbJOOMT2n1Ax7+gCsDTbF6/Im/TXqhB+aSWFyG/FeED?=
 =?us-ascii?Q?rKaOhK3S8GDLrBP5gjsP7W16xC4jXDg81Ew2O47S+0tK0Mo++q4BiM8NB9i0?=
 =?us-ascii?Q?zGTZ1alN1dzN27Er9XkVyMHxSO0dLxZxamQI1HSTzgqCscFKrh2V4O7qXCm3?=
 =?us-ascii?Q?UAzVgDkPyuYh4xKx/LxtfBCTpdERAS+Wy5Sqmd4+Bb+mVTCvxtMT4vjp0KoX?=
 =?us-ascii?Q?bM1o1g/qtV5RVvG2p79nL53H1JtzNq6024pF4unmmK5njR5AFJSZlx3pLKnS?=
 =?us-ascii?Q?nca7AyZkt+0d97Ilol8f6BGnYW7+7yhfYS+6VE8WNqwcdvCkA1agxJNfFOgG?=
 =?us-ascii?Q?zrGXvH/kowTEXz79yHFocUiVWwm3yvo3ldxvFX5ZTsmHhrowa1GCLa/mB8NS?=
 =?us-ascii?Q?HJetyLYXoRvzf+8ARFzCZcHkXxI57N5KeYXRFIYlfS0wDImYQIkC9X1SUoZb?=
 =?us-ascii?Q?WcOhf9Y41D+VEg5I3rTFmwuvAWdsxYfQjdqG6hqlSexsIDIm7EgsbLMGLhtx?=
 =?us-ascii?Q?/ouden4aO6je7DHGak69C7s3JdaETfEcSz4JEeJrVFEz464Gh8ggZADxnd1K?=
 =?us-ascii?Q?yVnaTAOBb3ALTDo6WST0aXM17qlpGwHhY20M2z0Bc8OHiH3tQo4xP0sgi0iM?=
 =?us-ascii?Q?wsIJTy8lN086zepA7ZLFsR9FwUcAumk2BpA2tcqdjePf3qcr1BStCbz5Mf8z?=
 =?us-ascii?Q?WA+8/zvmOCKlRIgmrDZbd64mL7nhrHGISpVelohg/CrzxlX4ATWMHfbhXjIU?=
 =?us-ascii?Q?0vnsFh7X9vViOOC3CuxRTsgqG+LxTAfCF0peRstWBXav7fcVCYC41HYX2Rue?=
 =?us-ascii?Q?1TEDv5W26nnV/fc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjeMq4zQby6qroNbdnaujnBbcU716WG7t2PbXLeNH01WGLIDLdQKtEYoDyMZ?=
 =?us-ascii?Q?MIJqeW3u2g/QPG0m9CC50xfn4inkPbGbb53e3oFajZ6YvW2ow2Nwr7HaG1nX?=
 =?us-ascii?Q?Nou1LoGvxkpqmX/wbQvUb07iE7lZAcvBMD+7s4Jpl8Q5UnrEWOw62ehsLosT?=
 =?us-ascii?Q?psbxzs/cY7NVvrC1JdMBuBXPOS8LWieiJoWn4W4lgmW9e1yUb1DniueCevws?=
 =?us-ascii?Q?F6/BJfd5nDlptb+eG3AgEZZZCzn/TAQccz0KWr7tmjkRK0q4kpO0pio3Ou0R?=
 =?us-ascii?Q?dGHj1KfAetpGZFmHT9k4Fmxs4Vyhn5AXR6phlmZSrgdkzRrvUNkOiJpvO3cY?=
 =?us-ascii?Q?PF9mBgTYwr3yEJ9DtZXIDPhib1LVPDpZwhJgAqXFUQOTKPu2SknaK9TjqNR3?=
 =?us-ascii?Q?2Hl+lYYoM1ullcnEXYDm0Tx+noVRDD85Sj2zl6IcUk4r5t6lI1tkr3T0ftni?=
 =?us-ascii?Q?wS8N9zNJoFkmxxxS/m++fTJm43F2icpkifv9wrZSO2tvDwKdea7VcCnMwAj9?=
 =?us-ascii?Q?pO9U998qBXd9+EuwF3U/s8VPuFe3U62TYDoxQxIwL3FBAD1cXocZwITlDTlL?=
 =?us-ascii?Q?H2+YDk574C2uzG4NTqguFIVCIJAQILbl3qoDVAzOsz0dkCMxBQZiSOPz3m0/?=
 =?us-ascii?Q?89aQStXeCbw/wC89dJeAX4UaCg+NbebBC0YZyyKKJKDJm4Pttg/8n2nqXKrp?=
 =?us-ascii?Q?wlZDsbnTirY1J+7lFWOB+d9cOsVz1Fs6T1tBV+g5ftPI6FPhwJgdBZLBNWSY?=
 =?us-ascii?Q?spqZmY3M1oDuPEQFYnnaNjoD7uCO+Ytm5uGUC5eQaBziJv8M8brnSh4LQvGO?=
 =?us-ascii?Q?R87bA//w5MLa4FTsInO8bVPWz/8JumnIP/ICzF1LLxaVjGr37CYh8twE5MAf?=
 =?us-ascii?Q?nBa4DSXNzy9L38nYQ6bfbD2Jhy0oSwGnrQd7EC0qW+yP66u0mTOrdvhQJ8zA?=
 =?us-ascii?Q?5d33QDqpYWCQuu+KcnC0psgNwq0AA2XIaVHmknLguRAl1JZ28BafRlrqB2Mt?=
 =?us-ascii?Q?zxJJVLoVUzBhGrra3pFdUssIWT45evDhtUKZDh902LPcAIv9THGnxNBrfzLw?=
 =?us-ascii?Q?UAFl6mOOLuQo9GIe8PjijUDcgpELRT+sQEwEuwGZykcY0AjzzqS1equB2uJG?=
 =?us-ascii?Q?0VZtYbptPgT45C9sON1jpVWrUR+F0mY6RqpPwjeFIv9I1Ur8r14Qhol3iULP?=
 =?us-ascii?Q?Tse+qvAeih8eNfwFkx4O9RsJcb0oMpLC6z+kI++8RGKw0Z7RAMyEQq0BzWxX?=
 =?us-ascii?Q?h0Q8nv46CAvCh+U6xWVUdxYLrePWb+msQmz/Ovn1vx2UgAW9deHjxInySxaf?=
 =?us-ascii?Q?eqVS+e4CpBx4vZnbdalnt8Lq6n+8EFzGJKn2o/yUvPdJ4lHGYMOsYO0DuQej?=
 =?us-ascii?Q?D5U6iDlMWHw+u2lhGnYx47flkkG+dB5SmYwanRW1Doex+eMON8N35PLE3OcV?=
 =?us-ascii?Q?6kSmlqv85wucPiAou+NZo3gfJGy6ihaLvsiJ+7SuBErKT3K/zZqoJehQLAiE?=
 =?us-ascii?Q?qRHouK3EBX60zGVLlw19S9scJQqOBnoNmQIreVhBhkTYzk5g0rU7vatDXY5L?=
 =?us-ascii?Q?zOEbz6LsTvh1aUPmjlNDsFxswWLaJoqSjQvYE6a/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79827e2a-ded6-4092-bcbd-08dde08509b3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:33:35.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUwSIKi6zPHV//Ah3zFzh9HzhpyRkc6ZZVhLn78DwdEUi2q8OO0DhZ1EEqsC2sVLrv6vG0N51DTuxLYpMdKjjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_003343_757325_E15D871A 
X-CRM114-Status: UNSURE (   9.58  )
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

Enable hdmi_pai device.

Aud2htx module, hdmi_pai and hdmi controller compose the hdmi audio
pipeline.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..cc9351a5bd65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.34.1



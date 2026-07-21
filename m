Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2111C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wAU1S9dtOWwwWbiczP4NoeYdbLRICn5JHFH1w4Qd0s=; b=dbyENxepvmEVY3z+Z6dKv/pVsh
	/Pxk9u6wmjo/v6raLBRqEdnoem/cv3I4bXyxg7c3cxewuEWxMk3U0WNjejZgKSkTLuqT7osDZDuVQ
	gvXSPtWOAGLuMGmWBhICiZlPPsz4Xc6hJq+gRdif9hJxtFW7fsCkhuyz3I/ywjwrZTjYwZffwe6iF
	wGYFIq0KS5UPCxNmGm0LwWe7Ry5w6Mc73SLem/pTFwhQZafWbpKDKJv4aya7AB7sJ/1yGdcbhbU/R
	+LJYAuNvu+WJSEiihoaljXbST5TfPQU888B64iRA+WGyesU1XR9yaunubZnKz6KxigbXi3m9JqBS9
	MoWetIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHOK-0000000APGX-1Rjd;
	Tue, 21 Jul 2026 20:48:40 +0000
Received: from mail-westeuropeazon11011036.outbound.protection.outlook.com ([52.101.70.36] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHOE-0000000APCK-24vu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnRNWRyuS90f9QYGZDlAg7gMs1cgc7EyF8/8LQy88W65RX/2umZ+0FWNNqbxDZ4rOkQjXcvDt5JPFEhQtGKopFKHIj9kTa+cMGYotiuUeq+nwSyjt2g5ZnfBglrGAPjD6OW+rXxuHV7tr5Iu9vSBgCHOLVOSX0rsuseNdBgSdeeCDunbDb79/VA7FCzZNrPcj3/AgllbRKlyldmaLhSBiDKJuEi2uM+E6bM2qbLOcKuZqMcV8cVYMsvGYOkDwa3DD0xm83amFcBA6hRlMA2jM6uuFGO+i/BY2zb4hAt6mWesxqORDKVcEDSakHTtC1h1aBnX4U/1W7qNMkW8jG1lLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wAU1S9dtOWwwWbiczP4NoeYdbLRICn5JHFH1w4Qd0s=;
 b=py9tHteMS/mdZJdKws+4cFFRs+Nrvu17z4iIuto4BHueMSxb+85qNhVDlTIOMytHK/amlty3uuQLQsRq9QcgUcgktaHoiuaK+Mu0sU1nUd+6uu4ocRrZiLJBAf91/U48RwDu7Ol3LG4uBNefocBU/M4Wm2k52Lf1wSCGh//cdxKGERPcdKY0qJTNmKU1NiPOxkrhbYyjaluQjxQVNbYdp/2cupbvFRKd5gM1oC/8YIGVI7qq6KU7RiXZ5FGoizaRWT9evdYaRODMCijIChvKDFZF3GaBMFJ61WTKupXF48tpk44D4z2g3R3A753ZN3+yeFHvTDxAyVaXJrt7e/HDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wAU1S9dtOWwwWbiczP4NoeYdbLRICn5JHFH1w4Qd0s=;
 b=QY35iBogOXVU9IYeBSb3xk4a8qYdSS/bDzJcOp8MmV4ar02pK1HHBX046H1z5jX3TE4HG2JIZSRaC2tqsKodX94NBq/+PemB1V8HW5mQmor4b6hncYE0KDqCYixK5ruKPtlSCMkrbsat3TXn/ynv9QbDHYsO3WpFIGDelNtoTgRB4uQMRVwDXWd3N/kUwYxz8aTtIPa+8hhzR1cvam1pPgPKF+qfUrl1iyyMfmv0nw/NxDMEouDgHmEwE2Jktrg+M73TVkAiIp1aXWAMp4Fp8Yx+ymwnUQcL2q083jfjhdWeQKmwEMhMQ4jdXZXLduBKYM269TXbPSlM7YPie44wDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:31 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:31 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v15 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Tue, 21 Jul 2026 15:46:48 -0500
Message-ID: <20260721204704.400781-6-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:806:22::24) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 20311822-32a5-41d8-bf89-08dee7696c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|11063799006|3023799007|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: G5OU7VE+yAfbHRIceiAlW14L5JpVpa224u6i5LgkRClZWq59uYP2FapjIz18Nf14EJHWW6/sljQ4Y84TC/RfIPR4Oi9qAWiHD6vpnkFe8IzpKBQyYMtONHvEpWLT/QDeLSYQFJhtTsuQ/rn5CdMhyVkHM7eyJ/ywdp7eSuNx+62IuK2qa9Zxk4uP6rO6yDDzDqdetJA3STWtRTJp8WPYov2KBKRpvIKiV6v4NXsCqbwvIYgSBNJ1kehAKdzJVPjP+DZ+oDcxSyaWIuGTcTM5HLbwHq4l/4HCK4ggf7igeo/GZF3qWVRPIPQbfs1Ow0xwSKwl8Ge2+LTNvWV11q3VWn8WoYLHckGOep2/7QKt7I9rRdmEuERIxynaL0O00pTdzhFWxi44zdmjFL+Ptk/SSvaWI1sHh/+5BnMDg9XQQBNzX08tLo0TwPp0Hg5hhu8bMrxaBIdq/bc+5OFZcvK+0HQlOXb4f+YoDdV/cXlTw37OPDkVg8j9Tajf7QSevWDKlbtnNServ+RR0tQk/YCDXlN+VRSgpwqNnZHKHq1KLAk+tECWnqtudutixW5LQKr7d2uNZxRujgEGEY9epMWs6mPMvyarsGW4CUn+vfu1PqbJ0/lXAE/HWRdh1gh1U4d9zqzbFZamb8s4BTkvqjJMSEO53jwIUxsnqhsseSGvwedkKz/3I9LRNC5gDxMZlaomKlPxEw33aHzTYC7p23o+iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(11063799006)(3023799007)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aC1FL/3+S5mcRYCZahKjP4vukNQBNpKpLAcXFyb+3gpwEk+A+AnwH5CVZWNF?=
 =?us-ascii?Q?VU4TvkBm2FO9myByZ1u8tnHdYB+3/g02Jube2fEWrKbIbWvPUEEjSkjBgxcf?=
 =?us-ascii?Q?noYgQ9ME3X1ToAZRbChn/49EfMQa9r0625faQNzNGfXkMNt0woYsWgmjGCRT?=
 =?us-ascii?Q?j9qOSoELHqPJ6wXoSKQYfs8GMAXDCT14aBIZEMH8RTwn4AxMC9jEtXbKZ6aW?=
 =?us-ascii?Q?AvSYhPX0lWJhrQZixlkJfqzZS56vZC+VloHzTpbTxQ6tj3LBZmYHd9zY3dzB?=
 =?us-ascii?Q?ml1RMzUguN/SDA2Dz8TzHKHJGFjdWKPyTU6m1WMSrPF7ieoriVuTBfjG+cdI?=
 =?us-ascii?Q?56n48fhZgB9K/WTcGTxMg92kmIjBvg+jI96hBtzWOcPcej+3ucgpdgErDAXu?=
 =?us-ascii?Q?ERDOJB1qLIV+KK2aqRYgY9Djx/y812nWTC4KW2ooYzZvg/SJliZw496XysEX?=
 =?us-ascii?Q?7CIEETCQBRi0we/CXvYEjSgcni0ZogdU7XuILVWDUh/fX+ZYXf6Uf4b3hyUU?=
 =?us-ascii?Q?MVCxdbx2qWZA0J2KdkUlW9GMMd9g9QYfFzAy0rdzzoS31nrqc7IU5f5T9SZG?=
 =?us-ascii?Q?Ob8KDZ7/Y75lnPKo8DzO9DkOug4AdOLyhOMPWPY81rFXviFpzrz4eqOmSLpo?=
 =?us-ascii?Q?HzgH0lejVHzO/0deMO/kFsc82wjNViTEbdJAkEVQMCE0zAMXC/hkl4enDQnp?=
 =?us-ascii?Q?P4LZ2K9YtvOEdtVCrhJy5mRsllLBlCH+CrEcbvAr+446QSTVmApg7mVG+Pu/?=
 =?us-ascii?Q?zWWbM800ZpEtyFJmXpOT3lkd/Yb1sCR4F1ACyuS+LmdRkAGQFafquKryjcFP?=
 =?us-ascii?Q?5fXu87l0blOKK+sOYCM5sz+NvMRfrbkPRf+7KPFg28wMSliIyLLI0B5Ackq/?=
 =?us-ascii?Q?GHce/G05m3JbrGHISNBCVJczz7dBZ0sqC+0JGwR3xNFJPnia61ORSsK1IXM+?=
 =?us-ascii?Q?fdm8GIXJa2buM5XbgOnq8xbgEUemFusu73c4q0Ff4TZVRLplJjXL9gnq65S1?=
 =?us-ascii?Q?2vlY9caNrcF7Dec8hymHQXRmBWu5EmyiwbylYC3bLmkzC+NYCKiBcZzxdZCo?=
 =?us-ascii?Q?MBtsFcbLzobIpEDzs5fCt9zZf1KkbglRI/sbOewzIB/Ic9uDEucantmNrJl4?=
 =?us-ascii?Q?7lvJaoQnYLbj8F9C0dDc8xa6zFJzt9OPlYoaDYOPP5DNc5BOdO60ukUL/IT/?=
 =?us-ascii?Q?DRqXSw5bDZtAPMzAs6icmfG4sgQdUIVGaAgaFyfqCQ6TCw8dzsiK6eQ4j51r?=
 =?us-ascii?Q?xFfXi9uPfAXgf9bFipq+ssDclJ1cfOZtReyLBts4szBJJVNe0CNpp1BmQyT+?=
 =?us-ascii?Q?p+P/d3y5TBhiDA6nEK5msv1i0fQEqw6/hNXYeWdK443fi/I4AjgSS2yyJ108?=
 =?us-ascii?Q?vvRSNdVFZ2YFZnYJgF5B6aaBcG/XQfejaNsp7h5NylRZE44cV2jRa/eywOQp?=
 =?us-ascii?Q?I9BWa7e5C8pEAIC3q1Ns3eK2GrZk95fe4e90Ur7lF6H4LaTtdXh9y7Sq0mwi?=
 =?us-ascii?Q?lXhCxJIzfaiXf5sBWMzwh5c6ntI9lZbVrj/H1E3VbCk8FqA4YpItOIkCjMI5?=
 =?us-ascii?Q?3geIfBd/G2lQkGv5aJDrNWRSKfpqvLcwE9O80HtHhpaPhgBKjjvtXXlI81w1?=
 =?us-ascii?Q?h3KV+zyRe2O5PLgFIhLn75cisjd2zNzaJp73xGrif7LqRnm/YHoeLBha90ms?=
 =?us-ascii?Q?LzvIi1QR8YOHKsIkQB+meAB+UtKp+6dRyy1FSwTWePAW7CUZWjKYYlRkOZLw?=
 =?us-ascii?Q?zWPyN4Vaf9d1snfA4Wdecm6KJ6MN7dl/07sFPEeqP5gSyUFp/W+u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20311822-32a5-41d8-bf89-08dee7696c9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:31.4072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88J0NjE9bhpiNLAmiO3szHjPlprsRryS4MMfSmh0MlXsUfWXt4yXU42TlloQzjxlx1jpnbpp7ydy+BZ7d4HqageRO8pI6uRgyQNB7OrvdxtCVCKitN17U6/t3VkG2lA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_134834_538984_C3684D4C 
X-CRM114-Status: GOOD (  10.78  )
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

From: Shenwei Wang <shenwei.wang@nxp.com>

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..5a62e0357fa7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -190,6 +190,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0



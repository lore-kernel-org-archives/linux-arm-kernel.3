Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64686D58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w21H82L7WkxRq2DRUydcOoKmctov0j0fDc50FI+Sds=; b=DTyDTaGx4pLx4YYQZOh3PWfmvK
	nTpd+aNcB1hLI/v2hjCkEmq0ecBwIpOicVJgvVDbFN4qy9wGN/chFxOAFOMtJqlE/Lm8F6IT69jCa
	6DqMhoRPQUk44PuuzRjUUbCxH6ezw/ARhb7zJ6wWcVAlhgOdVQh6bSv5xTuwtBBKrcYr/N04A9XTb
	YckSYW+GhKdHvg0HFDQYFiLIEBYqmZQJBbcd1m/r3jB18ASo6exh5O50LAgLjjqi9aK7dvTP59Iim
	pb2+QVYyExOXBmXbX4r5YNwKrO/uKGUhJZtCpI0zjLmzkrEXVtxlevfcYzpWfSg+8jtKMowMq5YCG
	bSmEz/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb1c-00000008UEE-0c6B;
	Mon, 25 Nov 2024 15:29:20 +0000
Received: from mail-dbaeur03on20628.outbound.protection.outlook.com ([2a01:111:f403:260d::628] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaw3-00000008Sxg-1q1a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUKXp+6LhCUGAE6vEh1tv9bVzC0Rn6LT4k4zZEaJMQwF4pO7XwHC+4OLWJ8YexefbH5tcyw3B55JhzAFxte7HAL1PDB2Cl+D5YXzj2Ia7F15Gvzgii0++6HTKVxBM7Znb7h4mU+886QniBGinKBUCc17BFFvMwlf9WhVpeZvuoET7JtIZKpi/cSO5JR/PvJ91M884RluLF9OtvZs/JYE4bmyEpZAmbcwB9DRoN6YGaa/+P+tv4hY3G1VSEdxe5wGHDsFEYsxrUMxHkJFU3uj4loOc//tgEmoHGLBII93sqsy4xLP+WkvUzhNqOj2+XsQ+K9fI0R8hrXhGI0dHSaXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w21H82L7WkxRq2DRUydcOoKmctov0j0fDc50FI+Sds=;
 b=LX15uF4KbdCFH89z0R0i2RirnokPjauZL0yqZGj8yStn7JfSTZ0ML7hN3oDH76HVjOTaXIws5E3jFq5QzR+oe7O9W/+qpmxnd9OzMlFgd1b+H6B25Z9SxP/tvB/S8HVmiEQKbIZAdfqok/sZ9JqD5Ra6Gq8y6g82SJ99lKZJdklJ2r/kBno9U3ZV1CavEIEX2TfMAECX+BCTqkOG2+RG1dH+kg0BRborAHI5ze7MiMGeRc+dKrUlWKsWSUDmKI226Ws4xNaGmb0AGyGBhmmtCeAapJk1oQk5cOU03WEQzKKzw0EJwIAAuv4BiutNWm24YbGqnb7OieudlceYpWACVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w21H82L7WkxRq2DRUydcOoKmctov0j0fDc50FI+Sds=;
 b=aNQySO7Mu/sesqBvqf2eFFGOD1hBb7i78SgX6ViadoSvDUrU3sulXiLJo7RsJQftZBTUbeKlsCx8Lo1yfYk62X9w7JmTED90YXtVW6EzO7O6xhUOh6/6Mo4lmQ78R/zKHMkP9cSrH85r4zkhoBfI3EnfEu+z0lci2hovZrpQ8jGG9rdtJj3Cu6Wpx/B6QyfldRKRmrrcBDLnD2YT+IwtUeH0EbUL8wf2kpTWyn1kyK6tSiBPvuUSrv5edaopgjiUE+em1Qu/YUa22I6ubkYZwa+nBCJE00u9rugvHa4nZqus/cXUSDecmcBXAeHFwYGcw8X4Ec2IaI13z59QuEAPrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10886.eurprd04.prod.outlook.com (2603:10a6:10:580::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 15:23:26 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 15:23:26 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
Date: Mon, 25 Nov 2024 17:24:25 +0200
Message-ID: <20241125152427.136883-6-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125152427.136883-1-daniel.baluta@nxp.com>
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10886:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b2cfaf-42da-4b58-426f-08dd0d651bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0+WQRq1QC+d0M6LNep9vQhEVgZbzj4MZnGCqX18KsZo5hUaSi2e22HIJiuxe?=
 =?us-ascii?Q?1vWjIBkPJX5j26lGY5Rc937DkXLdpusS6KpG3UuZxxKovf2Bgx1JeNmHkdq+?=
 =?us-ascii?Q?/eCI56z9pVwkGQ3PR1CqtEZjpkrkVSlqS3D7ca3Dx55rJYEFDWMXIBXXt4In?=
 =?us-ascii?Q?N7tW/BM14plHzuqL8NyeM2ca01qgdhlAdRxvICZ4aSQQUnG51FAJXlntMHSI?=
 =?us-ascii?Q?YkNtAJEuKVA8lk5lqCdKdSDAHqXYChxOZiqEFZkikcBhRv3n3vZVFzZQO4Wz?=
 =?us-ascii?Q?zrLJinhBw3TbwWXy/iRh33R/3/GKrWGcezDTM03VIy1HPx9gChg8fcWNXR+z?=
 =?us-ascii?Q?cSgFQkhfT8Bag6AX5i4fa7yokfsJa4Cq+rAiMD/kLcrQAHIZ8TnqWBO2TGEE?=
 =?us-ascii?Q?m8DQ0AsB1zXSVOmbEaawvoe0jRvq4Bd9QJj65j+Ps+ymbBr08IHHBtdYqsTh?=
 =?us-ascii?Q?uZkJu0V27FU47WXJ27BblY+95+hP8p5ExKQDxadqfZV4Izy8ltFf3nMqcEjZ?=
 =?us-ascii?Q?mKD90vlbEgSCQZsAznr0G4A5fEO7nQDNTEDE/RGdVgi7pXINToJkaaTNab/S?=
 =?us-ascii?Q?UYg3NwNnlLBkoOacADWKVywnE49azfUsBSoJA1CTS3O8EDBow/7Jsgqvoywr?=
 =?us-ascii?Q?1sg2lu7EzGiugpnWE8C+ooKoQ5Wojqpqp4g1NVwbnaDLjxy3w9EU2AILt2cf?=
 =?us-ascii?Q?CfRx5SewMdXuWrV2eDNtSjrQq6ZqIfE7WFInJXrSXQpMJ0YFzrrSCDC+Z+nH?=
 =?us-ascii?Q?+P5ucVtmrfhHUYJjij129VVZ4zK6aky8dxvXuMl4JoCc+rt5fEPAvTDOANuD?=
 =?us-ascii?Q?rtXpk3cBXj16w36inctuUbxBguzET1D0pKE2fIjd9TSSdG05R14Za+7B6T7Z?=
 =?us-ascii?Q?IYVgKzbSChsoVQSSfh+pdmk6NTRbah65GdhdRnu6iaOcttKBQuB3lL55t4Dw?=
 =?us-ascii?Q?AAVyvzP2NMluaULkoxO3xULQfwN8Pru32YV+bILmVi90dhNnxAZt6Z2Nat/B?=
 =?us-ascii?Q?AUjEgC6ytNOVTNvs17BE8drdzxWf41MbS9FlDEe4v8EVzB8DbAWe0C+XroDd?=
 =?us-ascii?Q?8735GvW8ZmJ8J8tzyXjch/3VAh5tuTc2ZRqVYTldU8seifDMc1WB4u5YOSYE?=
 =?us-ascii?Q?Odm9pgf/i7helVKzOWQGSr1kw5Xl7ZNBm++jVJiRQjzX1+bNDLerEom71gQY?=
 =?us-ascii?Q?Pojqq4F/nwkJgXZuzzEWo11XO+UG0JQFRMUjt8BZHw8fcXJ/p5riDnKbq50P?=
 =?us-ascii?Q?jo0w09syXuY+w4iNCX6Z8k5oA+lx/rAG11OXEX0FDKAYzcHH4fwnV6qmCXzh?=
 =?us-ascii?Q?K4fwT1eUwt5hyszO2G/hseEOa/SS8Se0hzJ04aOe+lZlS/xLcTANtsQIeByE?=
 =?us-ascii?Q?WhsaaJnSQo9NoGywLugwfz4KqDgfaENdiaDTYE6EBFhBlZO3xQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q6vmarzF8kcXTCZH6XUCyx7BTC9MYyU7qotaZdEp2dVvLhQsf7mqK3iR9nKA?=
 =?us-ascii?Q?RninCg8HHs6v7tqLLF2aWEq0QvWrwVNJzFOAv56SOukrA97rwn0BBqRDyWWF?=
 =?us-ascii?Q?SGQ4pItE5P1U++saBT4JqvIj4D0UC+9zsQmhR/khyKBnNg0mdjpoqk9IQ/pY?=
 =?us-ascii?Q?cCMyi4lDx3VmoZlOI8tJGn1uxSWPlBp1JHy9xThPj1H/rGbNrVH5Z1SM0ane?=
 =?us-ascii?Q?C7MfX6XwPyTpewJeo/yxmv0s9mxDRrHcQMjSzNe041e3gjPzs6Blx1MmZElp?=
 =?us-ascii?Q?TLLRtaHsPyTaBBrf+FwGhhnCCkooeAc1zo8Ejub9/A/fE/esg7BXS5aj5XQW?=
 =?us-ascii?Q?ttegoYNsmzAKyHjpEUEHjOz4vOnsc9d1Tg1kgIpGY03lpbP9BTPOJW20zygu?=
 =?us-ascii?Q?/RnuhuHEhRhAIBBFO1qB1wzQSsnzhrCT7XrtVRWrciE5Ja7/RDKBmJxPHZWo?=
 =?us-ascii?Q?OPcocQHbg7e8FBj64A4QtZqNViErAEmQ6VQv32g0tHBQIfNeub6Zuc6AF+TU?=
 =?us-ascii?Q?BVElhFZ39p98Jp/nUlPpuEPNyY/+O3Xck/MRgz2UMy4mSYtnqdwi7YssAJWJ?=
 =?us-ascii?Q?gjtzpV+ctaxUb9duwvZniZgGJevSfcPvSx2bUluN88HYO10nOohsETyy0QuN?=
 =?us-ascii?Q?ONSaL4fnXfjj5w4P5UyjWPzZJkNuWF3DUejZb42ITxvBkZPVPzh6hlBbEcqo?=
 =?us-ascii?Q?mTEQT2QaTNiemJkT7zssl2QX/3nmBp811OOCW/+dtgBzowfc8s7wYcRdssBz?=
 =?us-ascii?Q?7IZXywFlFwbt4PFeVc4cKqHu009f4rDbFfekx7onQhmb6SAuPwXGzr+KSXln?=
 =?us-ascii?Q?i4bNws3dua06Wyi1H1hknD4FfzVAVKf5fj4XhL+mDavVB5IsQeeGiibqg53z?=
 =?us-ascii?Q?MZ7Bg1wPPuxOpz2Ki16td1cIzqPMYsEuX+UmdQnY6gKr85YUB+6as/iHe3n6?=
 =?us-ascii?Q?rre0E0WvCO0PBBfLLmmBVgYzgFhXPdd6VHRaGYFn3bzdDKfIGGUIedlsmYvK?=
 =?us-ascii?Q?7wKVLkoTf6luKuQFEq/0GgbH7iyMWQhl7A74+EgR3KSoMFjNzHFQAkZ23v3F?=
 =?us-ascii?Q?XMWDJDO2fnxvjSqMuDYbU6OH75oJHBnqHcmW73rDkTJT3EJt42BNFXSGxzgc?=
 =?us-ascii?Q?YjRxLUayaVTQYVA9c1/rtTcGCoD5KS3id2p+9RdA4fI50uch6TNvsDK2VYmw?=
 =?us-ascii?Q?6WDzyVAZKc6e/4mDzrvRQOfkyvsqiwbXmPVJydV3f/mrO3vMoakjQmgCKadk?=
 =?us-ascii?Q?eJH+epJhpfsg95ffQ30D0TJia8JRHHHTTwZoitH507hC4C5zEE/6rr5pcvwd?=
 =?us-ascii?Q?JS1ooGM2ulTsIWd0GCVoGzEZKWM+mZZul4Xvo3OqBo+hgxLmYWClnXEaJBfx?=
 =?us-ascii?Q?ITGOKnMU+Qxw0V7D2DiUwvQbPSdTfjBFCRe8/qkT7tcI6cSB/H9dpT0Ut3BF?=
 =?us-ascii?Q?wu0x97Xzu8cRrZYAhbtN+aXBspsXHnCWzePruCs1pr/RHsQ5wkMGBV0pH1R+?=
 =?us-ascii?Q?uBOZdLpHuvHC5ggNmFGbhTkZXZBRlFatHi+I9cbG3TXCbdd7/BIb6CWVOVAK?=
 =?us-ascii?Q?2ceVdYUzmDj4CosPU7WSVjW+K5afV4rjhLJKfb/3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b2cfaf-42da-4b58-426f-08dd0d651bb9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:23:26.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8Wu9BmhdCtnFwhjHquktW6EI1+YnjVP9+sIJpLT3AMV1X/rVTlKq8LU29+DZIKO/oGnHSl0CyfX5Yo/WrbWtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072335_479012_16977602 
X-CRM114-Status: GOOD (  12.36  )
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

Audio block control contains a set of registers some of them used for
DSP configuration.

Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those registers
in order to control the operations of the DSP (e.g for start, reset,
etc).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b42e6430123f..c8f9347d602c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1609,7 +1609,7 @@ sdma2: dma-controller@30e10000 {
 			};
 
 			audio_blk_ctrl: clock-controller@30e20000 {
-				compatible = "fsl,imx8mp-audio-blk-ctrl";
+				compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
 				reg = <0x30e20000 0x10000>;
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -2426,6 +2426,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
 			firmware-name = "imx/dsp/hifi4.bin";
 			memory-region = <&dsp_reserved>;
+			fsl,dsp-ctrl = <&audio_blk_ctrl>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E71D1036C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=maWv+vaiC9TCPl5oCZsNc6suz6
	VvEjlzZPFYrFQagKkrPnNuYPJ25iuS+aHb+kcC5VoNvAl734QULpMoYi85Cm8AuOQkJYwMLLPRz6i
	hqrTEJ5/9isn7cKDX5Nine1Y0jG/h6XtS2KGTc61mnNV0jX+NWC/6wpcH9ngQJjCH/pScEf6rFcM5
	TBSPS4XdeS6UCC6gq9bbuYWqn/ZmVOA0A7OX0yVpPZodRwRIao9/8TIVGFwrq8tvPo2TbE2BhTeVP
	gKmWGyLGCmklh6GW+lrz715qAbynwVjzB7NwnPN/Ls2POtOZscocqHX+0V2YahJEuM3pIiIxD803n
	zqBjQ0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2ex-0000000E4ey-1xw5;
	Tue, 25 Nov 2025 23:41:23 +0000
Received: from mail-norwayeastazon11023132.outbound.protection.outlook.com ([40.107.159.132] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2em-0000000E4UK-1zn8;
	Tue, 25 Nov 2025 23:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqrrCKc46oziosPYULiiQdGHLWATuD/bjXYPXMMRIcEEUwEOuZ13Vqz3xz4alTydn1Fxd0+cz6yYcbB7DbV4YR5adHhpvyWxptKAJnAOplwHL/WSZOV5gv//s+Ikl20l9/HyY9iYDlzSQZgStLwXCrHI9u1yms5R6I1w0+s1WYf76rFpBKZFPhTHF0mEZg31inbtZ8HWeEyOTVdGBBokVIUzGDvECU6R87D3ePWL5x0zRu7HJfauHdvB8E3PzD/tArs12hjxc/tSCNKkGe2RVIIMxX/UhGUbXRFWjGfhkEnDU5VNQoEmJoSzLTWKx9U1nsJbiS9Yt/rVtfIRBPJfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=BHEmJEX15/TriigvYuraeZlVxYU6ZXqjxss0I6WJVkEvn/BHCbAI4BqAakM3KSG+4zPTOk9ehdUq924f34240HZoodaZAbpEjep96W7TzsiqE08Lp9JnumAMgLoyzKAXVamlciRfyiKXm62bHb8lCNuYaJLLmNIj2fZSe2xj4U8MaV/fQvTfZsJeReTyIk5MMuRukwrQ94WXmkTWmAFIWxs1YHy9OS9whO03uPQtSZaHTYbXwsYtyRT1U6yywXQ3aSC5r87iorWF3X1ZAC4xy9kT8YJPnQJB7e7T7PYZjHSaUxr4qbytEM7Rbhn1aePzCzn7PjJVhbgMcNlcSiZ8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=MLtBJ0cOtU7bHOEjG0N4Me4aesJ2MGeIYJIrp2Sasg6VXd6TnRbgJxZ9HUHoIhtDmQVXdSDMqEEhORY8wb3+dDSdK7pjywRfszeLOk9tBq+JeasnOGDWN9ZdTaQbiPOrFbcYGnKhA/dUbunVfuDQNHF4xXPoev+1ziUipk7QSJ6Lnwuy19PksukOdcdbEJyHvbFHW+Ed/Z198txLfiuM1sdim6O8zE937u172cMScngAtcd9iMTvM/3OkAbCiSl6KcCR9lSVKq/n1ar9h3/wWekoUnR5zjdXX4HaBm8hscBNI1zDWmnPLI7uQspDY/ryDZe4YFaJdMw/ZyogQ925Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6063.eurprd08.prod.outlook.com (2603:10a6:102:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 23:41:00 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 23:41:00 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v6 3/3] arm: dts: airoha: en7523: add SNAND node
Date: Wed, 26 Nov 2025 02:40:47 +0300
Message-ID: <20251125234047.1101985-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ff5cca-2d04-4183-38c8-08de2c7c16b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fzMlI5WD7qMrkt02p7yMIuCXnNlY+kCfGTZWjdKGWDv2uRLo0cbGeAhWim0d?=
 =?us-ascii?Q?oHlSr2O5ulRy23ZjA2ISdWR6bkjOipN0xHMmTMklQRL+J9rD2TO9g/Yqjrxv?=
 =?us-ascii?Q?R3GnrFOYuP1MHjmVqbH22jZ6+tiTf4qQvc1EwmVlF3emJOs+mlcKgz9Si7aK?=
 =?us-ascii?Q?B+zMtoowao2NqkhUOyh9tYZCSJhdNIahNN6/ROya8UdM2yAm0Ho6T+I9Hwyh?=
 =?us-ascii?Q?aNNyKZE1vrjEWm+c/DL03+P36mWVAVt0Hk1Pm0YnPEAz45KPWQUS2YeTt/t4?=
 =?us-ascii?Q?WcfJJNJ6UT2hI++Hhnl83VTaK91WXWqTM7ABnFmSg0a+/ZZawMt/njLGHXei?=
 =?us-ascii?Q?7dvkH7PpwYLWEWkYezf+vwmlgjPF3RTycAj5Zp/TRAt2RARaouj7gNM+rYA9?=
 =?us-ascii?Q?NHtLoGDNH106Vtu/+kreNt3+02BDfS5LVBVJXZNijpWcvzRLaxNU+7u99jxW?=
 =?us-ascii?Q?YUR6B/WyuzYxtaEMCYtMlsiQ/vltK+42YQ7ve4i4G1edsfVsIvLP2XpojA1O?=
 =?us-ascii?Q?prPG8HxEKPNwoNGEjqdihsy/7a6fZxYgUKwZLrC64U875iWiMrTFJEfzirRP?=
 =?us-ascii?Q?hLNMiTmCoiQO39hm0NwQLKlgvVTv9AE+IR6fr/3BeYfElGZXPLQ/+vxp0HZJ?=
 =?us-ascii?Q?QQl7dlUYqKiAETan0mNO+W/ZHzPgTIk1rGNYnOfAhjPnqlr2rGLfH2bV2+HO?=
 =?us-ascii?Q?QjPafZ9TcdGbdelyrE0LKWV0elqHS7d3MwIErxjHWQLzop0S/lt4bS0+GHxm?=
 =?us-ascii?Q?4C2SvMALRF53o7+4SuaU8U0nqqd1pvMxJHbKpK4TPSGA+gX8rEMPN+nATb4s?=
 =?us-ascii?Q?DS602ht8fwJGlWMH32WnQ2oMik01IZ5gUm6igDEWlie7botsP93YmA53H3ud?=
 =?us-ascii?Q?KtcZyAKCWd+5GsQHTEcukDLqXOtoUvo3k5KFUeJYMXwmgAPhqp5qizYKwpvh?=
 =?us-ascii?Q?V2ceX92M3sPjHPZjoL2LwtZI3an0PAIi+4TOfQ5IL5Z6YWV75Hx1K9Scw9gM?=
 =?us-ascii?Q?yql0yjHp36GcO/Swt6l6XpGqWeBn3/GBSEvR4rImVb2dG6Vktw2FQWu/hplA?=
 =?us-ascii?Q?x63QDnDyJKDAtMYjTcGKNInT+jsc0DEelHZFMAYL56+lCJYlXxv/TbOZg8V3?=
 =?us-ascii?Q?YNI1S2eLOh98Ph4vcCeMuyS2PPb1qURDt9h9MH1dcvYJU3O1ctUkw9T6wEsC?=
 =?us-ascii?Q?D4MOYqgMaRbc21OphmDTopX1lE0LzNQIzOaqTyYGm7+nNM+iSQfd9oB6CgKj?=
 =?us-ascii?Q?OsgCefanL77/W+Psg++I9GpZXxApbCrSaMZ0oTNkkxYoDLdrcrdmjerbTPZ4?=
 =?us-ascii?Q?VeP36tAD9FMqrtHUr+E4pGKnmnKMl5nUsRCdb3dMnndasXRXyqzRXsKCWeCU?=
 =?us-ascii?Q?9zsjXNYKGqV/Ewf1YFDsLe25zTm4p4xDuXPIhKmewUX0eAKnZTr4ErA3U2b/?=
 =?us-ascii?Q?r1O67KLo2NJkvGoauUNK6juM/ZfK5UAPmr5z02VsoifUbWQhEehpSDhqvI9A?=
 =?us-ascii?Q?peeOmIolLHGKizAmmyL93S7qh0xQxuvQIi7qYWuQTCtowTQlCYFr7N9Bog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SxX96Xd4mK17Co0M5ELpfp1leSX7QWp3g7yvatTQdJ5ClpCPru3Ux9ye4eSI?=
 =?us-ascii?Q?slGrwCpUCYvhZ85+qow4ImWQJGLT5IYoywcHnKyU/WzClrgodRPjbUixPFl5?=
 =?us-ascii?Q?cTKF8JoiPreXpX9L4OJxPRtih/2QrwU5JZzWqDahQSzdrqCHym20j+c4MsYa?=
 =?us-ascii?Q?soineccCqDMfbf5DnvLkFdUE3GqeUoIN79bmAtRg10fHISw+BRJidvqRa1Yu?=
 =?us-ascii?Q?CzRNoAthEFOavitB1/JTAlPUvndQ93eUbdJnbTMeulyobwPkL+yAs93D0ncT?=
 =?us-ascii?Q?kQcVOjXMlbc6Gj0TV1MU70wcq9JRaaz3E66BVw9vwn70LEJpc2PZic3zuZqQ?=
 =?us-ascii?Q?LLHfuzCtJxXXZ6xNgfLosHLoNyS8T21V1TwO/M4TnYDoe3tWy7CZpyU7GExu?=
 =?us-ascii?Q?iIff/CxofWFwgC/5AZG824p0nYobs9bx4g7cC5+ifGNSR3y93nF+Y4yGU/GW?=
 =?us-ascii?Q?oLcpccsWLEDWwD4jKpcQ4JDJBXalneVJqhKIgUBJZCUNL5ucUlYT8oMmpR5T?=
 =?us-ascii?Q?7sTHYXUwilyCK9l0UhwGlQS2E6nohyoNUNZCzXcNRAcfVGqLjXlWvsfqfd7t?=
 =?us-ascii?Q?A5SM0aIJZ1+Wxb5cLopNfl6Wu6gBewkhtkeQpxv6GCJyNr8jgyX7NBjOGaFq?=
 =?us-ascii?Q?RzY/96ofRzpZmFgDl1j+yLEHmB+GZlK4Y8AsEzTi16r+ykdxA6cX9moDkurB?=
 =?us-ascii?Q?YyqhAe7Xol7UxiN8m9Y7uVkrzVjAILf9zUnN+dISr18TgybBWb9vGcssnfHs?=
 =?us-ascii?Q?Bak2fxB9welqWP8yi/qwZDQRG7W4plY5Yjj2i1aeYND2pQfj+5w9YHohW5t0?=
 =?us-ascii?Q?FtgPAZ0VBPXO1S3JuLjfOeqhYIRc3WmikvJ0pbk296PiTsvodOe/FXvouxb1?=
 =?us-ascii?Q?Tim24fUL0PB1B2yDRPaMiggjmbdd8vJJ5Ot1gpLEwT8HH0Qwf2XUXKdsmc7L?=
 =?us-ascii?Q?nD4ccQ6tC3m3z/J95DZ2tCbGRj8WLj/TfWSv1vrlHwV77IZS+k6fliRraaHc?=
 =?us-ascii?Q?qSe8ADHZqiLi2Xc+mQQXA1xE0eQkb3uokVELPz9ELwtPrmbREJ3fw2SjRY0g?=
 =?us-ascii?Q?VhmLWMjomVdldKQyvaE1IK3Zj0+mbzJkQGyX1r5NC7HXgw/5ZMpZZRqlSpkX?=
 =?us-ascii?Q?J6C5T2GQ2o5L8oHKzslb+oySvVh3TCa4IROK4gK+re27KT8D+VxHYmzIUfVG?=
 =?us-ascii?Q?KtaoOq0xcNdh29fwCpmfc2fdYO/sFM094+teT0WixtFy2sdPIzjvB43KPm5Q?=
 =?us-ascii?Q?ejtAgKl5fdGkIK164N5C8WgVHFJRKv6FF1pr4X6iIemD03Jm3LNM5xPaJN89?=
 =?us-ascii?Q?9FP0HJAYAaSc9hSIzOz+VT8mQuu3UqowBFy4dFCeNFQD13gwfefAMkFkQFfn?=
 =?us-ascii?Q?R8MmfkV7UcdUGDK+wjPtiGrmUgXPOI12pkkfTAHCrGcyXdSeKxP/yjuIcgFo?=
 =?us-ascii?Q?APOmOZND3pV8dawm3I16NxthPIwMkXdMY2UxS6fz56BH66gBc5NcsmOfqMwS?=
 =?us-ascii?Q?2sKNxuo9WQ+hYQsSZQeNU1ABetcTp9DPaEv4zlXWFGPXwAENoIawtBcFGyRB?=
 =?us-ascii?Q?3pXmvQkYh0F+nXd4U8azG5dDCz/U2WPySBxa0BsKuDNYCxsuSYp2PSOZvBXI?=
 =?us-ascii?Q?xB71kXLDOMyI1hvAV910euk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ff5cca-2d04-4183-38c8-08de2c7c16b8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:41:00.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vupkJyRnLiIbfnJJGCn9GGEcltOuKeKdNhoF06w75FL4enojEuDi39hwqBZBUzd7iXXHSAKyBPC3Cs4J41jqdQzR/EAiKFF4I6iioZnjTb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_154112_512240_C3353FBD 
X-CRM114-Status: UNSURE (   9.08  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0



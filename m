Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C739E83828
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=; b=mhZVi0As82JghjK5JG4CvX+34s
	7DEVOO5LOyg5ArUZhHP+2ziEXYANsEjjt/rNVHN1tLgq7loEaVCzMqeDHBanfVct9lWWXwdl06GuB
	bKIR17MJ0L//36gjKzEcUlttXSa40VcOQAyCqm4kgyPyWd2+o3uJSRklJuLRngABq8cxPEgJz6ekv
	7HWvn35hwVuy4VjVm431ueRZ+/Hpi/luqfRI3ca7lpGxHbXaNKGEXZduZtAiElnAKWH6ykk44Kpy+
	h1QTlgiGWbxOoTAWIGBliRUArZnL5q2FN7d5jLcB3miL8mQPt2Gi4oQThgGWiIDT+Zlfb5lJZRyLE
	rWy6kZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs47e-00000007BmM-0FQL;
	Mon, 16 Feb 2026 19:19:06 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs47Z-00000007BiB-3zm0;
	Mon, 16 Feb 2026 19:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0pYiAcc0+VadQ+q87QOWj33Q1BLxvcdLbPPLIF/tJGeamXE6oCOy3kXqoTZc6xBP6fvaggUarNyqxSCavDN8hpEUCe1j4njcR/z36RDgiwa2NpCIRRHPrTQEJHdBD1t35shAJ5agbuztTesoXjIHa3Vnhaqfetgd3BoF5p/3kMnJ388wO8B3M8El316Z01V/LVdCmTD/A/KFEDnqCidTZFvHWeCFGI3u8Sx7DX7+CjyjPfJlxgUmf9FGK7NlNNi8fyUpSh9BEJUcUF/O2ZNJvbjIbyxRBzE6Hh6QBcHrnqpgQYZoH0wNIgVgOjU5psCWkhBXI5wJfp4ueqASSBYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=YQP3TQzzUdbU5YqgJShLnm7K4BMbndhqgT8b8nX6qPm7IgBocY4eq2xrNPRKHQKU7sjEpzEFm3+kSAWGU7vKokdCCcjlTqfmBYft2cGO/kAYl+Aem6J5B1boXzMfZXVhzJGJYWhpnNwvBBqoM0gyE2Cic+V7OLNdSDuozz5Yb277ih7urap2tQ3lWXVQOt32Ke41aeiT2TK85H3TnJpNUa6jDxNOsn1VeKqxnIsZD0EntP/QJlmusdUiTuCPWL5lBQ5cZhbdmQQ+K09Ajijcdr7HmFCV6YfBHVOru1fhC5hZbbdhMdq8VNT5yGSjBJ7si8qE7oVPn2hmDjyE2YwYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=W6l98z3oBWyRlv3Ay0FGRdnyzUjmVcHc48etwBvphyzO56iQYdRWqpbOompHOmlOCEm0K5pcceVuUhRYQkEng+v5ylqTJVpxYCjAoE20JqXln4MS9Inpj67czSOJdUWpb6iu6qx3gdH0N1/Ow6dA5W7OAWD4/QCIeZ28KQmqU2NTzGqcP15l+We3ycTfQcOMvgtdvgfh0kNe+0ot/Qd07ghucqWiXyqiwPr+7Emb/8oRkx0A1cSXkxyS31CJ6ntwoG8fv1XPv9CgCDVkKvmLHv5inG3EN6vPPImBoaLVzExGmQtfbllxA8Hpw4SnV2+heErueNSEWL6nQL/cYsCARQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:18:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:18:59 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:40 -0500
Subject: [PATCH v3 2/6] media: synopsys: csi2rx: only check errors from
 devm_clk_bulk_get_all()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-2-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=1420;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GnM3pjdWniWMQ0FQGkWWFxupFXQ9z2LdXXy8whOOuRk=;
 b=o5UJpuKzpv2AoHxZqNROfVdpcPnEuRQPcvWhUwBf1gWJhBuM1aROBLF9Mxl5Hcn33DljH400z
 UOVyBSthzswDleCAl0G6tIT6q4aXFdbHgqtKRmgq/0tvgNGjZF5WkSU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: efba19f0-8602-46f6-c9c9-08de6d903c8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmJFY0ZtRTVpbVBsTkliQVdvcW93SE81blRTbFUzZ1c5VVl2dHJWUEVsZ3c2?=
 =?utf-8?B?ZlRZT0Eyem42Z3dZY3lVR0w0Z1lOczM5T2tSaUFiZXRJTWJoUXRvQWpSanJB?=
 =?utf-8?B?L0pQc090R0xTNGkwdFR2SktKZVBpeTZqRnlaRmsveDZ5eFZMVmxubmFDODN0?=
 =?utf-8?B?OWRMZzRrOWk4RzRmRVBybUJLRTllbVM2dUN1NmtCTXBCZzY3VmVqUU4yWmVD?=
 =?utf-8?B?QStXN3BlLzd4WElOVnlUZTlkUGdsNllzd2N0SjRCQ29yUzRYWjNISXhKREYv?=
 =?utf-8?B?Zk94SHlRLzNKZ1d0T21yZjNaSmk2eUl5U2VPL2ovK05TeG5OdGtTazlIRWhi?=
 =?utf-8?B?Um8yWFgwVU1KK3Y5VXhoTjhUcndGT0RMT3hBbmhtSmlhYjl3aXBLSU9SSHRD?=
 =?utf-8?B?Njhndmc5OW12MTcwL2ZDczg0MExDYXZaczdNZVdEQnpnOGVKRkpWRVp0YUJU?=
 =?utf-8?B?ejFOeXN3ckVoVmxldDlLZStOY3I5M0FsVGFUNHJwZUV2WUMxNXREeU5hVHVQ?=
 =?utf-8?B?d2FiQkM5eXpYa3Erc0tCNWNYMjh6cE9TVy9od3lVZThtWDFaRnBKRXIzR1NQ?=
 =?utf-8?B?WE0wdW9VMzBlV0VHZ01Zd2IyRGdWdSszMDkwWkdpZ3hOUTFKVWIwaHRmUVMv?=
 =?utf-8?B?SVRRWkVuRnZkMzZiUDNocytiYk9pS3hEVWJ4c1NQNWgvdDFpY0VYVzJpK1V5?=
 =?utf-8?B?WlZKVzBNaUlTQUdQOFRwYWRWOVRRd01XdnYxdWZCWHZSQzI2ckV0LzZaL0I3?=
 =?utf-8?B?TGZ1bHNJVyszaXpYcDczM2xteHExeVg0bWxhMFJOTEo0S2RKd2RTT1NSc3hC?=
 =?utf-8?B?K29tYllGOTVCaGRManNlK0lrNUdvbXFkcUJNSWlCNDFsc3dENnRrVktsME42?=
 =?utf-8?B?UkYwb1Z3RTBGOW0zbEh5NGFwWGNxT2g3RTZqOFBtQWdDRkVhaVk2eTMrTnRt?=
 =?utf-8?B?YXIwdTFaMVNObExDbFV1SUdUWTRPelB0SUJ5UGt4Qy9kTW1XZlpuSzNRUU04?=
 =?utf-8?B?RUhjSndHVTdQVUs3emdvQmVNTGdPSTFMMG9YcXlhbkgzS1owT0VyMVBsMjlB?=
 =?utf-8?B?OTJ2b1NJV3B5SXpaTWkwS25jSThYd0xmaDlyODQrN3pPakJ6NHNOR0xzTFlX?=
 =?utf-8?B?REU4bkRnRXRzV3FvL29zeFM4NXNZSGczcTJuOFFneVUzVWpNT0txaU5YenBE?=
 =?utf-8?B?UnBZL2JMTXhGSUl5QXZQMU9PWWJQOFdHNG4yaGpycVdqNkJpRXhOdWVieS94?=
 =?utf-8?B?ZWNOaW9oR2JRaDcrM3hhRlg4czJieFlNMERSQmFPNVcwT1E4OW5oUktPMGFT?=
 =?utf-8?B?ejFjajJLdFJIM3JCRDJQMmxxanFYbzFTZmFtMVpnYU1uRVFJSGxib2NiK2FN?=
 =?utf-8?B?UGZ3S1I5Y1U4OGxRaTBkcFFFQ2tob1JrbEs0L3ZsQXY5WkF0ZGVhcit1TUU3?=
 =?utf-8?B?Nlh3eG4xRWsvdVVkekFPY25ScjMvOUdQK1BTcmcySGl1SjFLY3B0WVJFWVJY?=
 =?utf-8?B?dy9tNVBFSkQwSEhaZWZGamhXV2xNZytWRi9uU3RSZEx6U3gyRXpXUlcrU0tO?=
 =?utf-8?B?OWh5ekZLS1ZtK1BMZUZubG8va2ZOTFpHY1JodG5nb1FJVjdyQVFNQkFNT1Jp?=
 =?utf-8?B?WFFCTDc1MFZZcEVYdDljVzk3R1IrckZ1QStkL0JMUzdDWDVIcXE0ZW9zTDJK?=
 =?utf-8?B?c25JOE1qMkJDY2xjVFNaMkdzckNIS2RnNnFnN21IeUNLMGFENmZ0SnNtZVN4?=
 =?utf-8?B?US9YSU4wQ0RVZkxJcG5NVjg1VlRmaXpZN2dSbEc0U1JFRXY5KzFRNVJTU2VR?=
 =?utf-8?B?dFZnSS8xNU9CQ3d6MDZaeHZlWXFIbGloc0VCWDRFenRhVElkeWdHNXB2OUJu?=
 =?utf-8?B?eU9wVUxWZkFHSUxMV2liZDR4eUdkQ0NiUnFIZm9UR2R2OTlINmNjR2ZvNVM4?=
 =?utf-8?B?RHg3SGJsYXB5RUVuWTlXMnkvM0poSkxvRlhKUnMzSHFlTmxSWDM0Wkk4d24y?=
 =?utf-8?B?RS9XVzc1V29xOWthekNDclZieVdiVzdIcloyUVQ1TUhKSWhFVnZyU3B5Y2tJ?=
 =?utf-8?B?VkFVWnl2NVRjMmJ5VUNvbXFhbGZLMXhLUzZBTFN6cFpUUStUTEpEZDFNNmFi?=
 =?utf-8?B?NTRUTUFJSjFBR1lqYWRSTm9qa2NIRTFZc1pYbzZhemQycS9GeCtNT0ZkekJ0?=
 =?utf-8?Q?yJBOy2elLR2nELKBVgAf+zg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0Jwcy9SVGVIcWlwRTlrc2NOSnlGVThLVzkvZ1I2RFZlT25wV3hpUVhBMkdI?=
 =?utf-8?B?RFAveUwzT2pDUGFoQzUyZEtIV3hBeU5jSXVQQlFZZTdsU0JYMkc3M292aFpv?=
 =?utf-8?B?aStNZ2JoUmwrQk5hbWtnVmlCSktXWElDM3NteG1QdHRVbnQ0TEhGNzVZNldn?=
 =?utf-8?B?M0V3OHByajEyRjNMVFAyNmMxaW9Zckc2VWJwcUFVQmdsZll4N0ZZcW9Jb0ls?=
 =?utf-8?B?a0YrLytnZk1IMGdaMENaMjMyb1FBM3BOdENzTmpTbEZwVFFMTWlWNFVCUEhD?=
 =?utf-8?B?Z0JoYS9pSG5nZEZKYUJJN0JUM1FyYi92RENaVXRpa3dLYnphNVQ1cms5S3NJ?=
 =?utf-8?B?SGdaMEpDc2hNU2hPZCtScU1YMHhnZnVUb0d2ZW1zOXlSM08rWnBmaFRuTXJn?=
 =?utf-8?B?QUNhazVSSFhjTWY1d05qb09aNnhoa0pLdk81UG8xUG5rR25HSHprWnRzT0Nq?=
 =?utf-8?B?TzkzY1QwMXdjNWFnU1RoWHFDNnZDNzE0S3Rkd3JwVXgwb0lSaTZCcmg2OGEv?=
 =?utf-8?B?TUNsenpXRGZUaXZoaWZ0K2lYRmgzNk5NK0d0bktVTFN1bjRIYkQ0V05RODd2?=
 =?utf-8?B?VHRFeWMxcHl2d1djc2ROQXdpYTRRdFN6b3dyT09KUjFYVlIwVTJTYXF6MUd6?=
 =?utf-8?B?YXBGVDR0dksrcjFncU9aa3FPcTk3N2FWQzVBNzF2MjgwU2xNWTc5ZnJja3ZP?=
 =?utf-8?B?YkdnUVFiVVdMNzNBN2haRlV6VW9OU0JnQTBURDhWUktVUEVrMC91WXR4b0RF?=
 =?utf-8?B?ckl4eFl2V21UaFNST3d3QzdqV2lCMmRFRHBXNHNVVjdoQytWTlM2NjVtQjJG?=
 =?utf-8?B?L0pnQzA4M1JGMEdVSTUvb2QwRVEzakNjcmQ2YWJqdFZiYnhGUnZSODVXaTNh?=
 =?utf-8?B?MG9DVFRReVE4S0VRTHNVcC9wT0pCL0Y0RWo3OG56RVgwdHlGWDBWb3BlT215?=
 =?utf-8?B?U1QxRzNZYjF3ZUJwVHVFMno2MzNnbDE1OERZZUVQK1VBQzFXL3U2ZG5sZno5?=
 =?utf-8?B?TXZndXJpaFNCY3FISmRZVWRqYW9jbEVSMnFMV1FpWUIwVG8zTkN5cFVFNGdh?=
 =?utf-8?B?MHkwRUhZZG1OZFduVGNTOWZNNGNOdmRzWG9CdXlUemxpOS9vbU9ZYzZoVjJv?=
 =?utf-8?B?NTcyME1zVkZKV0xrQXdsQjlJa01paGlMN1g3Zy9SQm9mSE9UT05xZUlaRVJ5?=
 =?utf-8?B?TWNKV1NWMjN1THdHS2lFVlQyZGsyUmc1aklvMysvM2lxYXc0aEp5UHBYRjEw?=
 =?utf-8?B?NWVTWlFQejc2cHVqT2tXd01HakN6T3Y4alVlMktGT21meXRVbTZvWnBZMXdS?=
 =?utf-8?B?RzJxUStFZ1FRcXZ6MkhyU0wxV2doc0NLYXB4TGs5VEk1RWlWNWpsdnphb0JZ?=
 =?utf-8?B?NU1ibGRKUEltd2hCd1ltYkJNMVhkVC9URHFDR3dsMERHQ3RDTmsyQzU3cnh3?=
 =?utf-8?B?UnNPTERvOGxMZkxEOFhsOEN2NmNuSTFBc0tCcFdRMXp6V211Ujkxd2xGRWxq?=
 =?utf-8?B?dWpzN1hOQXJIRmE0UGNkZXVCNEdmVHk5eHlHN2lVTkdDRjlhZm5lVFAwV3do?=
 =?utf-8?B?NWhwNHNkTVEyM1RJOW13eFlOOWx4YWFFc0t3aThCcWdZanVEZXFMK1h4NytV?=
 =?utf-8?B?OEc4aDVXOERBdk40UUpzdlVlZWFHbEp6eDN4UmdNaWwvN0RQWXNvTHNwYjlL?=
 =?utf-8?B?RXBOL0pWWXFYVS85VkFaSUZvQ3Jab0szdU5mdlhrQWFKaUowdG5mTHhjNjVx?=
 =?utf-8?B?cE9pelhzK1g3VDJhUUZwTTBTYzlJYnh1S28zVmoySlQwaU9HeEtpOCtSb3Bp?=
 =?utf-8?B?N2tXQ0o5bnZPT2RVb295OU44TDZjZXpLNXFuNSt4QnVaSTlYcXBiUFJxUWxm?=
 =?utf-8?B?a2ZwUDhLVm0vQnBDSUZuRVF5elQrQmRSK3hKMnNLYldTdGdJL09Hc09xa0N2?=
 =?utf-8?B?VTNvVWhkdkZ2WUZqUEVEVzFSUmFxRWx3R2NXRjBTVzJsbUdqdnRjRC9yNVk2?=
 =?utf-8?B?ay9sU2tES3l5SjdZL3lqWWFZdzBUemV6MlY0NDRCQjNNSUhFT1pvMHZya01a?=
 =?utf-8?B?d2xhaDFPeUFpNlpCLzVPVEhKZ290YU9paWRVVGRvcmRBeTluMk8wQUgrUTk1?=
 =?utf-8?B?RzdDV1J0azBvQkN6dUE3UGc4Z2V1c1lnNHFaNGVya0s1YzBGNGhEVExDU2lz?=
 =?utf-8?B?eS9XVnBqWmtLZzRjWmRpWXVNZzJhRlBWUjU2OURQcCsrY1h4TmtPUEtIbUt5?=
 =?utf-8?B?ZVR2b0wvM1VmdkFZNmxENkZiT1RKREs0bEhWMGdzRktWREcvd1BLV3liWWlQ?=
 =?utf-8?Q?G1+HwRprcDjV9Pd3CS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efba19f0-8602-46f6-c9c9-08de6d903c8f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:18:59.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGYLq9N5oJL3f8AMjbTKbAMZuwy5f44FIYiezAGslbG+sud8nrxRCu0eexlwgyTm3MQfgGvH4Owjrh8nTMIJ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_111901_989168_96270B56 
X-CRM114-Status: GOOD (  12.52  )
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

devm_clk_bulk_get_all() returns all clocks described in the DT, which are
already validated by the binding. Do not need enforce an expected clock
count.

Only check for error returns (< 0) to support more SoCs.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- remove DW_MIPI_CSI2RX_CLKS_MAX
- add Michael Riesch reviewed-by tag
- add csi2rx in subject
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..f03fe01280013bf9a832433c6b06dab691bf8f4c 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -40,8 +40,6 @@
 #define SW_DATATYPE_LS(x)	((x) << 20)
 #define SW_DATATYPE_LE(x)	((x) << 26)
 
-#define DW_MIPI_CSI2RX_CLKS_MAX	1
-
 enum {
 	DW_MIPI_CSI2RX_PAD_SINK,
 	DW_MIPI_CSI2RX_PAD_SRC,
@@ -630,7 +628,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return PTR_ERR(csi2->base_addr);
 
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
-	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
+	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
 	csi2->clks_num = ret;
 

-- 
2.43.0



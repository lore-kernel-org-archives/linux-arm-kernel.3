Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32D3109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc+rUBsHW3d/VJA85EWra0kYU794u4AGIWJkB3RThQ4=; b=PQZ78zu+8TvRwbap6dKxFhYe6N
	/y/GNY7r76Qt1PySolwBaaNL7G8Hb+miDOlibIvtlPqfQGe7abe88pNxXKZE/XItyabBA/NfJw2Jz
	JNEmpFmqyWIPBbxamDJazeqZRd/56FCRwhp06dPe2+v9f0h8tJcxC4zfMS/oJbRegqmOcLWXUZf0S
	GXZBkJ+UIhJFRYYBgjE/TxfhMz5UisU5UDhs8R47oHr2VQqvm1r72i+1sPSvoDCBpfzRmCzS+feCk
	6ctrNMwUulKf/Et143p9e5T+Qoz+CbFCC8jLKVAeAxiRbexzssakrS5VQVDxVqcJ3/Hz9x67nfPm2
	dX1aPD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QBn-00000003nLf-1ltt;
	Wed, 25 Mar 2026 15:30:35 +0000
Received: from mail-francesouthazon11011001.outbound.protection.outlook.com ([40.107.130.1] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QBc-00000003nJQ-1i7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWvCvEdGzmdzQyfYiLWFpInI+Hcms+JpjecQTMDS5KGV4KrvtvpO+vlUvn8BRVLZVzkjpfphNoIKxN4z6eUXkIOOSDo9j8pPmWsbDYQbjp6Z2I5CNZtfbNlWLTw+SxwpCHGM30Q96z8WgRdylLEqpyGeECTkY2RmMALY037zdculPlj0As9ChcRMeI6LUqlzfxz8VjN66vs+tcDaGtuL+AzgXTd4Ps+z1/iIlbG7EMxXcnuHRLcC4vK4co0UG1lBkrEFwTKHI8eqA/JT/SPNjoHLd56c+oNhEubXILBNVGCjFGiJZplPxlv/VCFKChrEV9rcVKmwmeHtIYTnMjjMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc+rUBsHW3d/VJA85EWra0kYU794u4AGIWJkB3RThQ4=;
 b=TTs5cFL20z1Es545fq7cCay5rN+FrrCEd+THZiSrRO3OzmPFAphEljVmD3Jg2p8exFmDI4P97BA5HmzwtBNU5MTjOMZPWZwYgDw3lqDUYdxDsLPHmtcdgErXWhbU1OeNyPSy03MFoy2UuKCRkJPYzqW30W6hCnazFX9ITLhEb0SA23rDwkID97CpjyNEisUG1uZ7Mu4sb7lPfzC3rizZy8giH1fzDPB8dT+CeVcEDTK85eok52JEQBzm6VRrFtVOfS8+kB2p5EWZ762IlZa4IMh66f6FK6A8ENCQWUoP/YKVd9kfelHChqdvg3XLJyVEZzOPyeAazEuYmrWxCmUKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc+rUBsHW3d/VJA85EWra0kYU794u4AGIWJkB3RThQ4=;
 b=MjZ1x1kLMN/N1j3xLwlPH4Od/vTnHozrke5trrvsZvmnmDVqMvuggRcO/JEsOBYvu4YsxvNDZgBzQ9YmiwI1sGOZF8NiKX0mhJ1w+JATLGySNFNviqDw9STlE7lCU2yT0Q4kG+VCUrdeELijfjROaDwhIMgwVtQWQ7gkv2As9ms9JXR2bzaGDQdyVdDcQzPi74vTNyXH6W2et5SkJPnOW8lmb5uSHKRSG4i0eu/nNtN2t6IACYgerVL61LiqOrAgDjTXM1EOhWXmn9Zk4HE5FMAaNjeRh0fy4krNatB4aROW36pEFGaMB6i0yFZ+wa//cR4MQvswA44+/5YnPzxsHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:30:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:30:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
References: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: imx952-evk: Add audio sound cards
Message-Id: <177445261694.3100812.7674464955120774305.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 11:30:16 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH8P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d24a43d-46bc-40e0-6dbf-08de8a836c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: afOM6aSsM0tPI74sp+vh8hvywliVRyG1RFvgBv1WmD777P1MUIPhL+rBxQr4hIBRjYEsTsNEt4Y9GIpN5xGMHop0zWQsvPBex1nu6ksuCWZ1owB9FibuM98ovJdHPPvTmYPchXE0/0AhCtsLXQaTmgN0nXCirPe2ZsHUZ1zYYSZadxxesArbkPGbqV1t8MJhwiEADcfyoUtwHQhI4hQ8XMKhnIGWfYWXVEVLZrEKnjP+eYPGURneh3eQUe67jUlbJHwG6tJA5sXDMXrLVwP8lQZg6nxKYBFJGcl+yJPbQTA75WALt/zhcteGoGCHSYiuylOQvjqW3NQOoQ6PlC3krYgPO0js+Dq52hczmKwC8LN+5RSbv97tdtFng3zBnuNjIhiKGVkojGQLl+YlFH+tcm2EBMKI6nMHisJoVK/4VRcUtQh51CksLouIJlGBV09idfVxMeZe/e5dRvE9gaklgAzrBXsJCCVbPvy8/iOLuTGs2il8DI00DCiHQcxr4Ro9W6Z3ruqo75YMFJMsaTu4agZaRhRDGcQK6mbduRS5CgpPj7v8Gs8uCL9BHyNoIQh5ToC8Y4Rt02UU6fINeaRrcKjCHSnKA/EGrES3NnDoWgPuIFgp5GDIXXYOhMPfDNHpI7t+5Wg65Rf/rGX1St7+hrtf26tlqpR/RBkC8S6F5DSsxSjm6DH3tQIElhIYs4JpDtN2SzjDbTSy6yVUrDwBwDKwcFri5z/LJxA//zJYoNh3lQioikNEPtJ5XrtE4tlJu1zFRGrh4+3oSiIrLWWNyOb6V3MTvByIvieKiztncujOda4TbbONXLKyzT6mshH3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWI1d0tZcWpYNkZoSnBHczhjRTd4NkFLazIwN0ZyZEZ0SUU4bEgybkVSUjQ3?=
 =?utf-8?B?ZGh1YVFrZlZzMTkxb1puTmF1YzZDNkR1WXRyejRSMGFDSG5xWkI1ay9PaDZp?=
 =?utf-8?B?NHdhaWNpRWlLc0NpOG9PN2hrd1NUNmdwaHIwNEp2UmpxUzFtSEkrQysyOXFS?=
 =?utf-8?B?a2dJcXB6RUt6aS9RTFhNN3BBYk9ic0V3Ny9FZmpCYjVPR2p4SXBOc1oxMDNG?=
 =?utf-8?B?TDdsQnJ3OGkwTDFjU1V5MTN6Q2JpaEpKbDdHY0ZXU0VCSjZhNkZ6aTZldlJP?=
 =?utf-8?B?V0taUmorWlRPMXIydGN4SFJRWEtNc1JLMFJ5M1hBcjRVUjN6NERYQmpzc2s3?=
 =?utf-8?B?WmNINmtIbzZ3UGExTHgwdGtGaXdqMkxWTkdqblNoWmpKRSszYVc4R0lsQmFB?=
 =?utf-8?B?RVUrZndjV1ByYmRRODFFQUNIdHJScjNnQm9vSng5eFowSWhvcFV4dkZBQnJI?=
 =?utf-8?B?dUI4NEVycE9CUSt6TDI5LzF6ekpETkIvRkxmeEdkVzlkdlVWVk51N0NsMzdr?=
 =?utf-8?B?SExUQ1NFeWhmMElhbVZyS2plcTNZS2tEbDFkRXhPR2ZHMU1lUmhHQS90bTN5?=
 =?utf-8?B?cW5qaVYrRDEyczNDNS9PeWFYWk4yWXVpY3ZuZmh3OUVsUHU5WGNZSVIxUnY0?=
 =?utf-8?B?eEFCdHI0SjVxeUF0NkF6WlpZVkJvcDVkTXBqVlgrQ21QbVpmVGtjbEZJVmtF?=
 =?utf-8?B?aWpDQWlZRFlWZzE3aTFTY0dmREorOUNqSWZ5MEw0aDZrRDNTT0wrNTh3QmVv?=
 =?utf-8?B?L3NuM0lOY3B3dDZZVzBuY2ozZHc4UTFKSWpoV2RtQ3FzaU1LSkFEMER1Q1lj?=
 =?utf-8?B?RTlCTnZyM042UjM1blQxS01YL2s3MkpEanh3Wm5HUU1XU1FZZ1RhTGphUDQv?=
 =?utf-8?B?UXVtM1hSdlU3ZTk1Tkx1RWZsOFMwcHVMZFcxRDRHby9BZkxWNm01dXJmWks5?=
 =?utf-8?B?S1RDMnpreU5oeGMvd1kxYkRIcUFEQnplYWNwbkFDV1BKRTdRbTRrN2k5OVlj?=
 =?utf-8?B?RkE4K0V5YnNhd09GdVdPK0NGNDRrVW5hM0lsUjgwejh3YWlQT3ltdi9wUjVt?=
 =?utf-8?B?UVBKdjNEaUZ4NW0ycU9MSkszZ2RkUUpLM1N5a1lWU3Zya0lIbDB4dUZGYVJz?=
 =?utf-8?B?MkhWbVFHdmlDMlBUZnlLQ0ZmWnB0RUZHSVd5aDBxa0NMRVJRWk1kRGVOTjJ1?=
 =?utf-8?B?SC9CVVR1MUwwWWNKazVLUTdQa1YyMWxGUDhQSy8wVmozTWVabktaWUJaNGFm?=
 =?utf-8?B?MUtvWG1sU1dGdDVoUnQ4OUx3N1FjNWRUY2FPSG9RRjB5K0RhS0RRVkc2d1JC?=
 =?utf-8?B?SVd1bUJSQTFTTHdaNWhtd09wb2pSNlVubTBWdlplb3lOUFFHSUhvMDVtYmla?=
 =?utf-8?B?SFVPSXh2TzdtNUVkV0VhcG9zUzI0L2JqWnRRdDQ1b1dPeEpleWJxN1I5Uk9x?=
 =?utf-8?B?Vm55SW96eW5ocllTNHFpYm1CN0l4cGVNdXBNaHpIdjdWUW1LRkhidmRCM0Zq?=
 =?utf-8?B?L3ZTUTlUdGdxV0RMakJYdDlyRW9jaXRSVG4xKzJsRi9sK25GOGxUN2NJeHlG?=
 =?utf-8?B?c1NpL1NUUUF6WU8xMzcxdy9GVDA2YW1oelJacUthZlRUL1RlZWxVQmUyZ0xC?=
 =?utf-8?B?WnVnR2h0N05sWTNYQWtQM0ZRdDRyREZkenNIRGtWWlhRaDVRWjE3Mjl3QURL?=
 =?utf-8?B?dEdOa3FYaDExeHJnYURwTEVJRFQxaUgxTVg2aldQbHJ3bk5ybE5FNHNFMXo5?=
 =?utf-8?B?RGRHaVFWRlU0SWRhR3BwcXFQWm1JanlCdWcwcWNCS05Lb29yV0MwTzFjdDhr?=
 =?utf-8?B?K2lpbGtPVTRqZnN5MHZ4Qlc0d2svUktwSE43MFZ2QWN6TWRabU55dUtzbWtk?=
 =?utf-8?B?L3g5bjRqOGYzVkFvWi9WeFJ4OTc5WGpiYnRaYlpzRTZRQ2Q0cEdiU01YUk9F?=
 =?utf-8?B?MWY4NVh3YmkxcXdHbjNLc3k4bmNaMjJ4SEJnOGdOQmtqWlBGZ1JNemdtQmtL?=
 =?utf-8?B?M2xKTEY3a0l0UStoREdabFk2M3VXRWlnQ3NFUm5GWjdZWmpKMkZiZ2xTN1Fj?=
 =?utf-8?B?Qzh3Qm9neldsK3VRYVdmWEtvY2ZnWUtBbWNOTllTZFBVZi9jeUVyaVUxOENp?=
 =?utf-8?B?VWlQS3hxSlcySUxrRFZ0R2crWlh1bUkzNHRVSVBXWmNmdlV6QVZlbnh1Y1Q4?=
 =?utf-8?B?VXpsWTVKMm51WTg4VHRBTEx5WXJYM0RZODhpd0JJa1hMUjB2NG03alJBTnBE?=
 =?utf-8?B?S2c4ZGNSblJDenE2dEZwd2lvQjZlNWJmOElpUHU2Rkc2ZGRzbmtvZjVUWktr?=
 =?utf-8?Q?Le0s39fTjxTNYCLzLR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d24a43d-46bc-40e0-6dbf-08de8a836c42
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:30:19.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpmSL/5wnOeuZFyhrraIMZ1AvoWdrzE/M8xLlXsh1ovfcHnIq09Z2ygZq6UsxDOCj2akJUQynkfK5AcyJpgGkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_083024_460224_0F2889C3 
X-CRM114-Status: UNSURE (   9.36  )
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


On Mon, 16 Mar 2026 10:14:35 +0800, Shengjiu Wang wrote:
> Add audio device nodes and sound card (wm8962, PDM microphone, bt-sco).
> 
> Changes in v2:
> - use macro FSL_EDMA_RX for audio nodes in patch 1/4
> - update commit message to add ASRC2 info in patch 2/4
> - add acked by Daniel in patch 2/4, 3/4, 4/4
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: imx952: Add audio device nodes
      commit: 9cdf26f3cb3fad99d48c59e2e8630939ca75a37c
[2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
      commit: 48fe0319c1fe7c5b470e0b29975cd7395609319b
[3/4] arm64: dts: imx952-evk: Add bt-sco sound card support
      commit: bf99a2ea2c82ad4baa9476f7f168c649313b1751
[4/4] arm64: dts: imx952-evk: Add PDM microphone sound card support
      commit: 9846b69696e59097926f427dae90b3d7aed66846

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>



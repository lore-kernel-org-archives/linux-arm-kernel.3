Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF72FB44BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ugtIIw3a3Rrt7NM/Ow3hm9sQ97KPTEleeHCrULCoBLY=; b=rdvBHBn3zR/lI6mLHoQ0dww12A
	zswWaUm59Ul7ny2DC4/tysk0v5xGvIbtE7MJw7w0lhRrZg13Jd1tk445DWSkPF4Fx2GBd/4LR9a4o
	IIBCQyZ/rlkQs6bTQUWSFplwOnmcNgSvh83vCfCTnF2pb7x5n8fRajrw4DDMMiEUG184WeoBSZ3Z2
	zP9ssOvekpFymOyFywTr91tZGJkEwY7bejaD43ptJHsFk76INpWAwRJCayy+3U7K0TWciXhOmbT9W
	Od5t40+OaQZx5F7rfGlAM3Plazx0vbiPA2z0CSnibW2DjTYA1YbQs8+KTxjwXsdwk7v0Oja1u5Vg2
	soTrvT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAKf-0000000Cipg-39fX;
	Fri, 24 Apr 2026 06:48:09 +0000
Received: from mail-westeuropeazon11011045.outbound.protection.outlook.com ([52.101.70.45] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAKd-0000000Cios-3MJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y06wF7FM2qVvkCTKWMrlFxmLAKl/6aAxJ1ZhdRIFd7yuzKZx5kowsVR4kXbJEIlQKqbJMtAbCH/DPR5KX2Y0KoPDDbTT5ZnPjJc2RKdjsP4mWFCPYd3m90+gEKOH8rQi8auNxGRPQEtjc1svqFEkU3fVpF94gEn8E550DiFqeQdxOGdB9Tb4JNRArq2O8YCRFRoUWhl10uCAcAqG2S4dw7j+5Pp0G39Zp0PYXfTw9x5a+n8M1kV7wVBN4iUSaDFG5haB+g9LZ8euGeMnfOBOXNNyyXsBZyc69UZBN9weDHpFssHXadYwpjJw3FGtn1891MIzaPI9u618Bm5Vyq87gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugtIIw3a3Rrt7NM/Ow3hm9sQ97KPTEleeHCrULCoBLY=;
 b=Qhya0rRhdc5Xb+xRbikxqZjQrguf5PAhTlEHIGizfmMpvMnChF7oXOvqsLHDN8T09fYeoYog0jnTwwgm1Ow+5YqoGBFI6wLpwLOGbjz7Yo3F4jQFeRxlxkFhEsdrRs9Nvk1gC3p/ujQFAQr7kLS1S9wkPcm/F8Td7EzH03g2LpUGm5fS9J38PB6BEyobR9ZF2kFe8HRN5DTiYIi8lSxCyKLbgWhRPendgDV9SVFCYHRtWhlZMe2Plk59NOmPG5jtRElO4rIk+iHm60C8tErPQ4v6Yiu2jinDjSp5eXcdnJ/avChpgvBBhLGm/NvpoMDkWU5EQ4/JNTghldvY7r1ULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugtIIw3a3Rrt7NM/Ow3hm9sQ97KPTEleeHCrULCoBLY=;
 b=wIAbiLATU7qg5UcOMTIWIRwguUoqlyNUNte2TnXMROVNeFKruxgHJ3NXJ4unvsipX35O+/+VLgC0/xiWiYYurbAk+UcIh8ff2L0myBfZDLhd2Dv+5d5MbeX/ZY+bOcrotTnk5kw4ODg+QgR3tnilBGSA0Dy947AxWY0RiAwGF8akQpcDkZVETvXHVw3TzPFz4dFn00/biblVyxSvR35MMWLS6Lhi/9ewVeJex5w88nFKrSjK9PL3MTdrzv3BkmbkdqHNwhVD7Wm9D/mH4R8RdMlJm2A8cxDOMcncWpDCOu+Oz7XDCVSjHZwEfPdDBNX+rzsq/l+J7d75nrKesdPDbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 06:48:02 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:48:02 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v12 0/2] Add i.MX8ULP ISI and CSI-2 support
Date: Fri, 24 Apr 2026 14:49:49 +0800
Message-Id: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0S62kC/13RS27DIBAG4KtEXheLGd5d5R5VVYGBBKmxIzu20
 ka5e3HUNoblgL6fGebWTGFMYWped7dmDEua0tDnAvBl13RH2x8CST4fNEhRUA2GdFPCj3S66vn
 zTIx3TEvvpfOxyeQ8hpiuj7y391zHcTiRy3EMdhuCaxCyFigYxgUBcpiHPs3t93GY98M0tf313
 HbDaY08pukyjF+PDhdcg39jEMteFiSUoLScc2a4kWL/l7J2srAtFRVlmTKhtbDOSnRdSfmW6or
 yTC1GoxwI54wuqXhSQ6GiIlOpjOQeuILISio3FFRF5Tors0wIozHEWFL1T4Eiq6jKVITO5SV0Q
 RlXUv2kADXV66vBBaZ0VPm+pGZDsZ7VZEqF4+C0UUHQkgJ9WqT1diBTAoZ23nqH1G4+6n6//wB
 wY4+0xAIAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777013438; l=2222;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=pwEkce4XM8PYyYN3+Sut3Seajm4enQZ8Kkbnib9GgD4=;
 b=HGtdha5MiGAy8L4co1mxR4XB7zFnWL0DTc8xmRcxgfGzgL75b10mlxiGr3VDxdN3rrb1Dd/Sh
 HtzRJyMVb/mCdRT/sI65nEsjZABQmYxvhgBrkc7no8eGWKIoUDVS0qJ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5b98f6-4084-4394-0af8-08dea1cd6e27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|52116014|19092799006|1800799024|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 8NAnwpcjoFYB9Zs1scmiGuokwUYbLCSQX0ElKmXoaIwPC2Mg2zc50MWdysGfdhPAgJFGSdcdT/v7hvTxvOoAEk7oXzLf5JZN52EtiaFQsf8m9fv8QLZVleou4LiGOGrCOWDHQdziC/S2Qaf7yGkQLu3qP3JS6Jv6HVrbs9vliqglIi7fZDpDNkPsEoROu57HMKIqkqyoZAW/5aGFS8SqZ5A75uqu0Y0SvD8RghpTG8eHPsOMEE7HxUjg3xHIe2Y4J1cU1qX6iMqdzd7tVBfOMiQ8ry6KwfVAnAOIZohycxCWZm262jlHd6k4r6qOp+XRpfyzI9eLS6iezSJl4vVK2TUOjBIZ4miAM+c61+EO7MNCnPxY+2BilllXHUEu8E81yDXNnzemsApHxtgdYqPmGK1nvXRx1UGygzjY/tGjiScTPDAsnn9YmOySI4GvOwGSUy9yppdoszbtr7hfrFFwQFp1Moo7F9j0NaDgy2qI8bybqHNgG7naHqB41GJLnROPtSXl7Dyx8SYxVfwEj0O9Zh8bwSCKhBTMrp2rbgd7Lx9JkSAhNXTPHCgC7RNXZaD4WxI1Y2TQOa1yrs6k+rzVlSHJjZEjNa6atBzRff2eNqZz8CWDi6+oDrPAsyTOhTENrgmGxkjAYk97ipIj5hnA6lvZGJrtGWzYG1oh8JALOYHy5dOWzf8pHoRGcrPCiBuscC34cJNky46V4H8Mtnbvnjdzaco3igbjOLP+fTSbXuk3kjgUsokREJHNUJauJExKwH5Gcpo4ulT89VoEbKy3vEsFigPevObXRlB2xjtLJ2ZkE6QZkdM/BKRl2gYJdXcJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnpVL04wWkVKYkhaRlBSYUtMcjhPNTVIRnFBYkVHQ2pnSVp4NkRFSUI5aGNY?=
 =?utf-8?B?R3JWb2hPZkFkMU83UWZyNEs5K21NVUhqSGUrOUFpMjVrY3lBZGkwSnREVFdS?=
 =?utf-8?B?Y3AwbGdiOXpZZnJRRGhDSE9iK3JYcy9HcHVoTTl5Nk1LbEtSRlV2Uy9RM0hU?=
 =?utf-8?B?cXo3VFU0SWx5YnBwd25XUGtFRUpQcXdPMXNvZ0pUMVM2Qyt2dEE5TWN3Qm90?=
 =?utf-8?B?Y1N2M0Y1dzBKYUczU2pacFAwcHFTanBBZlFVa3Aya0J5UWxsRWZXSVhXWHVS?=
 =?utf-8?B?SFdiaE40QWh2a2k4UGhCajB0OVltVyszSGVGQlJCVnhSRjJRNExmTUdmTVZ1?=
 =?utf-8?B?QjYrYzBFb0gxS1FLRFlOb05PRy9EbU5OR2t4U2lIWHpRd1EyaGxkdSs2c2Fv?=
 =?utf-8?B?NUN0WEg1YVNjOEpCK1Q1WCsvMUNzMkZ3Q2Y0SFAvYUZ0YTk4cmsxWGx1MkZ4?=
 =?utf-8?B?UVRzdVN3SWhTb0U2TFliQk9TVlBrQm1ma3dRQmF3YkJraUlYL21FNjk4aEx6?=
 =?utf-8?B?UEJlQTNJQlB6ajMrdlgxbFpmNS9KY0w2cHdteWJNazVhV0NoSktmYWlSUVZX?=
 =?utf-8?B?R1RnZGpNNUNDK3FvNHZlTVhiNmk1MGUrWkdIaWhHZmF4Sm9hTWZpRW9nVmpo?=
 =?utf-8?B?SUxjQllzNitrRUF4U0J5ZHdEMlkzSTBtV1VsZWY5UXVuYWo1SHJ4RVNUOVh0?=
 =?utf-8?B?S0dhVUNkNmlndWlpeEtNenZDSWFBU1pkcXJla09Eb2Z6NFBlYUZZdEVzS3Zn?=
 =?utf-8?B?ZTgrbFpUQTdZLzdsS21YZllvK0NORDFwaEVGdW9CcGl4VUxoSDZvR2FJZnVi?=
 =?utf-8?B?V05QeGRydkVBWUo5RUhYVWx0Sld3RGJmUCtRY1RaWHkvdU1pcXJSY1VNWlBD?=
 =?utf-8?B?REVzRzhZMVE0b3V3L3daajc1RmNwTXRrNFZwSG8rblJUajNWRFpYb29XMkhk?=
 =?utf-8?B?U3ZyUTdGVHlzQWluYXBXQk9URzdJVTNucWdyaUZRU2hodmNSNHhpQTRxZVdv?=
 =?utf-8?B?MVorcFNhMkhObDZmaW5zTEZUR29hamdTQXVTeThsOWFhSm1FK0cydGxZdTVF?=
 =?utf-8?B?M2huMnA4NTNGOFJ6d3hmSUVyaHU2RHNkVENwRVJLWU0ya3drb1RGWTdIUENh?=
 =?utf-8?B?aGlVUmtVVnczbmUxeVIvQkcxU1BlaEVRYldxN0VMZVZsTU1obEYxdkgrd0xj?=
 =?utf-8?B?VjFmRll6b2ZYMzlDbzR1ZkxZV3phcEpOa3B1Sm0zS2ZaYUpMdmFIYkR1Tk51?=
 =?utf-8?B?WUdkcm5iL21BcG5peExWWm5mYU40WXVOa2x3VHpwVGJaNWREaldMZm4yL21j?=
 =?utf-8?B?YUo0TzFaRGZsdUdReXZueVRWMHUveFZMMWd4d3dCcDZjMmlxSnk0NDU0eXZR?=
 =?utf-8?B?SmxCeWJ4aEJqUVdIN1p6bmo0ZTVYWk9KR1Q5NUFnalNZOFV1U05wVy9sYXpp?=
 =?utf-8?B?ZGVJb25kZEIxRms4OXc0cXFiY3FEdGpvaVJMSjdTemVjcCtNT000M1BqdmtU?=
 =?utf-8?B?bjdtdTBHTkIzYkJ0bFhYUmFKNGs0UUZtaCtzcDJubnhMbmdPUnpBVmpMa1VQ?=
 =?utf-8?B?aDNDOGlTQlFMUDZ0L2FobFk1MjB5NFFneVd2dnRvajhLVUlLTnN1ek11STgr?=
 =?utf-8?B?c3YwMXpVVVZuTUQ3RzBWMDFlL0gvbWI0R1ZJeDI3MVhiOG05dTQ2NDVEbzZa?=
 =?utf-8?B?N2VjMkhmWG5OVnlhVkVOc3puWkM2NkhUcnF4OG1pV1JMTVFOaVNkaVRuMWJs?=
 =?utf-8?B?TDZneWlRWUszMkZnOXUrb045cE5PYmNQdnhZSFAyWlZ6N0RtS0FpYmptRUNk?=
 =?utf-8?B?elpna05WS2k2V283dXowRDNyYkJ0a2RYdmQxZnc0TmVEMjlNZmlFNkEvQkhl?=
 =?utf-8?B?TTl0d2piN0I5ZGI1THdxbXJidng3VjVIV0wrM00vNkFFekhLQlpVb21DWEdZ?=
 =?utf-8?B?MVBRMnF6M2x4WlRsVk45eWMzalIrZGNKRTd6L29UY0FCcHdlb2luVUVHc0xr?=
 =?utf-8?B?Mm5xem1iVWlsZi9vS0IxQ3VaVFNkSTVEZGJYb1FhcXdIeUlERFJuNUJpbzdN?=
 =?utf-8?B?cWpnblJnN0RCWUZtNndlM0NxaWJUU0hlcGJsRzIvRDc4WFNvc1h2bXRTNC9Z?=
 =?utf-8?B?STA3N2hQR1pSRU1DT2hKREorYkFUSlZ0bDMxSGc4dzZoNzBlMndXb2JOKzQr?=
 =?utf-8?B?MHhsd05LaGJtUG9TQlo2c2h0bUwrS1ZuUjcyZFJMQWR1d0tIMmNYMHh0d2lh?=
 =?utf-8?B?TjdyWUR1RU12UU5BR05iMjlreU5DTUdlVktXUVRmOUZnRW42RkZBSlBRdit1?=
 =?utf-8?B?akhheCtWY2VuSTIwWkJuVk03U0RZYmNuWEVHdWJ3b1NYSCtrci8vdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b98f6-4084-4394-0af8-08dea1cd6e27
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:48:02.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwhQHT/4fsedevou6dKoW/ad53He+f07S2suOKyw1He7buDpGm2O3B4tKW7yuGXp9OPBeCVpjXFKucWokjxojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_234807_878098_1406FF3C 
X-CRM114-Status: GOOD (  11.56  )
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

Add support for the Image Sensing Interface (ISI) and MIPI CSI-2 receiver
on i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
This was previously sent as patch 5/5 in the v10 series based on media
tree [1]. Patches 1-4 have already been applied to linux-next tree.

Changes in v12:
- Add one new patch
- Swap ISI axi and apb clocks to align with dt-binding requirements 
- Update commit message
- See each patch's changelog for details.

Changes in v11:
- Rebased on latest media/next
- Removed #include <dt-bindings/reset/imx8ulp-pcc-reset.h> which was
  deleted by Rob's dt-bindings cleanup series [2]
- Replaced reset macros with numeric values and added comments to
  document the reset indices
- Link to v10: https://lore.kernel.org/r/20251205-csi2_imx8ulp-v10-5-190cdadb20a3@nxp.com

Changes in v6:
- Update compatible string in dts for csi node.
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-4-67964d1471f3@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-4-35885aba62bc@nxp.com

Changes in v3:
- Change pclk clock name to csr to match IP port name.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-4-26a444394965@nxp.com

Changes in v2:
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-3-guoniu.zhou@oss.nxp.com

[1] https://lore.kernel.org/all/20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com/
[2] https://lore.kernel.org/all/20251212231203.727227-1-robh@kernel.org/

---
Guoniu Zhou (2):
      media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
      arm64: dts: imx8ulp: Add MIPI CSI-2 and ISI nodes

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  4 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 66 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>



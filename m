Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FCE109C038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMEPQOjQPNCmPPYMdO/V35IbhV69HnAPY+8ARvQjKak=; b=IuBiQWyhmhmoCFEdNEf1ZE8Oe+
	eJCy2nS2itMkaVBJmfE5C7ppHkMxcl4AMxdPr5j/Z6TE0PmonV6sDxPLEtbTD7LARnK0wjZ+HBGys
	h56ZAMVtOLnlgSdfFA4qSj3b6G/PcxMF30YL9Kxwa9EdO0QePMT8p1EZ0HQSmuj8GN6wrqPf0Ye2d
	OWlhjsV69pHp5kUgLCuOQFKZPI809Ab3hiWMibrEP6dKEhYdHwKC13H1RbOgo1nR9oIro2wGetcR3
	gFflwFlsrkUhr5uxLVJlXlBzVbrhpNWwPp6hHPDoV8WlWS0JeiSOAQDiDmDijDbmzgnXWaZRiIC+h
	GKLClBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8i-00000004vw2-0mV3;
	Thu, 26 Mar 2026 07:28:24 +0000
Received: from mail-westeuropeazon11010028.outbound.protection.outlook.com ([52.101.69.28] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8c-00000004vrh-2hEN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KETczMG97AM/0aFj4rgGs2w6VT2Ik/Ng6jbQXwB8iZIzWkFrHLUfq8JGNwl8uCQ6c8A0EW1JeqTZLUrMukTFZjy5/KiPiMlrl4jNGcExz2qKxqdJ+4vYPrwFmW/BRRxowBqRcx/VtNZbYKRvwWu9WJdMIEail5AzftMPsY8SDetf5mrzmKZGFRthCRn/B1TtVErUHjFPZepFJHifj99Z4razQXGJzMHsUZiXKN5HkMnCyX9QMv79Grr3xqTRvkXbz4Jy4gvfMMtaNM6W/qIITEHHmeLry6/uaVeGLFId3XtUj76e/jGFyqsyjE7MXfWh+M7QqNQiAP7VgR6ih7TtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMEPQOjQPNCmPPYMdO/V35IbhV69HnAPY+8ARvQjKak=;
 b=XuygJXC2gL/xmYzl/PyhA0SzMh45mcerqCcTDGmS8qH92bJnpzgsYzdBjbsazw7RR7W/U4AOUz9Mlr/rM7AAHkYllyOe3APOJCHuu4KRj3uOK54R9GgAe5YJWC7paetXOp+BO5XmU9lvs18xzTp6WOSDwKiw0gAwgQDNvNQWOOCvak7Nz1XhNQx+19UgRyYXmBljw3POqrtqZCkiTznlwwemgdXY6db0IDmbdo2Zrhh6hEzuLtf43MrrZMzGVSZJC0jByXawIu29tb+uR3EYQBtVegRLoBPuIs2uhsey/dvCRFL0w1LZ3pAwKDMmQo6pgmJROVKSCW5v6tlTASF8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMEPQOjQPNCmPPYMdO/V35IbhV69HnAPY+8ARvQjKak=;
 b=UXgEquEh/r+99jdsyohllVb5Skp+8jO9QzGS2pujrWetbZiA3peo+wbQBfcELWqwrYEJkiT4dXnzNhjpKAvohiM5bq8z3CMiXOXzNEd5+PPDSGEEXZn/QOz0lf8qjBsUUHY40/+qsSxxdAh6Bfw44pfA/uBjW0DLps0w8t+WeiZAPLE4oPWe6yOIvkd9p7Ik6zTzH02ihDF+6ikkzpxNJwuTNPJrn5eT0XQi91oU99zs2wnfGxqJpvjLrJHj1C03GvCGh9lMCIiOC02DqRJkw/jCX7pfLzZ8Vf9uV4A/Okv4dkdzGKRA/Zl8riLX3ue1UkjTGIzj1lE5NHp6uPT73Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:28:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:14 +0800
Subject: [PATCH v2 10/12] arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-10-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: f5562710-990d-4297-a8a1-08de8b092ef5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: zi4+KpcluuTLrEpGLILH7M9L1Mgct5DLdqmAmRKOWWbH9QbjPlmfUXmRm1RGZyO8CudXLbMDfQip4lStx7YDajqbpuZuHcwVw6XZdc+fBsWa8dIs3SQa4O4GXWgWnB/jVupXC2D93eYkTrtMctPHLnbLAuVltyYK8ZTj+765L/+pfyudDXDnDUeNeO7FvytYIe6vy6Swl6a8ZRAU4q+KghEGNWVPmEfebhSCjAnTBE439/Ir9lEiaagWawBzXKnKnbwD5J124AkAiqNHvXHzjaq5EDFyTPwEhnhWE+osght3pjRylM9ZaqCoD3qhFw5tkzqv01TsetAq6sCyCbrSlaXz4MmTugvGNGUIll0YnmK36HQpBNP7FKNl3PsIABocxVVvioa7HgKQ2K0zgXERG3aetPXSTqS+jL7BW4/lJ6RYbynwcq711fPqdU/TBBo8KwhA2OiouNIMEY2V/cABYYLv2XlOMKwBRSWmDcRV+BpEiCwQs5HpBApQyYetToIzPO4mtNhGWppwXA7HoamP03SR3qnShSxn63C/Zb0dTN/kaHsIg6nuKceAs73D8iqcZVSZZcRwnu4kYIRj9khJiHtFfyb0pcJOu0hhfn7g6XwhAjq8aQ/H/FFJxveQj/UxaofIPxlDu49KtaUFMGdmwH6Or/MHVh9JGu4HOVacHFwPaefDFis0WM4qbzgE+7TuC4evqVntWHG53CQVIJ9YSpuKho0DAdlCasBgxtYDkmypMHga9rNN9E+XChdQB0vmLeJXYpKXxOWRzdHc5ASUeT1ztOlWKVxTx9hteV8VO55FxdLiJltulrEQ8QfJ8XNK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkQ5b1dtR3FaNlVqWHE3VkFPbXo1L0ZuUFBUK09KWEhySXFITnBRRU5jejZG?=
 =?utf-8?B?YW51YnFZVFd2MmxkMCtyUDRlTFpCYTdEOG5yYnlSQlBjWnQ3Z255VGFaYzE1?=
 =?utf-8?B?a210ZzVuem04Z0x1blJDVFYzb2xuZFR1RWk1U3hnNGtVT1UxSVhKZzZ1cXdQ?=
 =?utf-8?B?MFo3aFlJeFB3MmkvT2dJZzJlMUl6dUlHQ2NpSVBPdGloeDcwNTA4NmFtQmdi?=
 =?utf-8?B?Um84ZTdTb0NEbjlGWlpaSWJ0aWNKZUJPSXdpVjNIT0p2M1ZXbVM1N0JzZFFh?=
 =?utf-8?B?ZjJ6YWJrYXd0OUtvNlRDK0hpeU11SmNUK2FkVEZwUzRpQkxLSnlHSVFDaFdi?=
 =?utf-8?B?OWRCSmtkeXFxcm5JbU1ZNno0My9Hc1loaTNVSlBQZ3V0VnRWVVhwQURnd3hh?=
 =?utf-8?B?U2cvRnFZVUkxemVDeGVPT3R5QXdkUEUraktWditIQlRvZWR0aUg4ZTUzaHU4?=
 =?utf-8?B?R0QvMFEwOUVOUndva1JuSkZxNVZTdlFsNDFCS2dPRHh3bFlvNkJsaUJDTjRV?=
 =?utf-8?B?aDlkWUE1L0NFVHpIbUs1RXIzc2xxNXFyOUdldGRpSjNMK2s5YkJSMHBNNVEw?=
 =?utf-8?B?VUovcDlEY051eWI2N2dJNzRBN0llTG84Qis5a3N6aDFPSWEzaGZqQkhxVjdh?=
 =?utf-8?B?WW5GN3BobDNMVGNxeHlNNzBBa1h1a05qVSt6RVJMbytMUkcya21reC9sbEt2?=
 =?utf-8?B?LzJHNUFmUzlWOUh5YVZNWXNKK2VLY3VNcE9uV3lZR3pBQzZrZTg1amRNbWlT?=
 =?utf-8?B?YlBEYnRzaS8xdVVibDhuaUNPZUsvMENZR1dkRWFpUGxLeTQ2eW9HbXpPYmxW?=
 =?utf-8?B?b2srbkxNMmJ5bHJZK2dwOTJWcnpxTVExajJXL2s0TkhkYlkvSlhTMXgzYitv?=
 =?utf-8?B?WDlhUkNuYkppRGVQUHo3M2JuckZadFRUdjRkVHNwR0xBdUNabGsxSHhvdWNW?=
 =?utf-8?B?Y0J0UFIyYjdTY1c3dmR3aDVBeHd4MkR5aGFnUUtvZk51RzJBdFVNZDNpdXor?=
 =?utf-8?B?OHpySW5NdXFDYi9BbW9ncHo3T1NVeDBTVCtjZzd0QkZDeWZ0cE9CbzBOdkx1?=
 =?utf-8?B?QkxRSDNpeG55enY4Q29aeHNPNE9kVVQ2d3hKZEg2OVhMSENkTHVNRVV0TmNv?=
 =?utf-8?B?QmpKbUdhK3JyVE01dGpybVA4ZDY0TGFxa0h0eGRzUUkzbS9KUkxxM2RxRmpu?=
 =?utf-8?B?SDY0cnE4ZXlJTUhIMU5YZEF1TThvekpkT092ZC96b1B5Y3UwOEdBS1BYNlQw?=
 =?utf-8?B?dHo0RlhCQisrVkRwemhiVlNFQWVvc0dOeVJ0QlhyUytScFhVdTNrbEJVQnBS?=
 =?utf-8?B?cjZrZGk3K0tXVWlKdjJGL0x0LytQYnVobDJjUVdPQXc1MGE0T2FBWVI4R1RO?=
 =?utf-8?B?U0syVVE5dG9BZDVWcngxakFZZE03Wkpmb1lUbXFMa0VwVFVsMWRRd29IUXNO?=
 =?utf-8?B?UktnbkxjSmxReFlJWC9STjRkSTMrRnRBeU5Bd1REZ0dTNERIT0RydWhrSjV4?=
 =?utf-8?B?ekRtbmorTlBSdnpsak1yYWM0UldwM2loOVNOZHpDc01zNWRNbjVBZFNYSDVQ?=
 =?utf-8?B?dXNkRiswd0oyZkZYUjV2d09YSFArVkxDQ1ZKc2RFRkNPaTBUdFFsWDVJazMz?=
 =?utf-8?B?U2dxL3VvbnpIVG9iM1E1UTlaTzFKU0UyU0pINzlJM3lIYTY2OW41OWp4eEZm?=
 =?utf-8?B?Ny93Q0FhYU4xMjFsZzJuK05Yd2F2anFENU95Tlphc3Q1M3RPcU5XWXVCV1Vo?=
 =?utf-8?B?Vnowc3VxK2lLYkUvMkFMRGVMOC94YzZvRUJzekRXTDdZc2VSUytyNjhQUGI4?=
 =?utf-8?B?a0xPaUNocmRuZC93YVdWSDBmTmN4dE40NkJNNjBKSW84WEQ0SVhUcGwvMm5X?=
 =?utf-8?B?cVQ1eVZIdE9vVVhBc3lkSXFCRFlIb2I4dHRTUUpPUng4MFNWcE5UZ0g3TEkw?=
 =?utf-8?B?VldVSVJXSFFBZFVVTlJYSjgzeDlLa3JlLzdkNjFVck1aNGdtNDIxZ0JvRmhE?=
 =?utf-8?B?RXhPb3FWejF4cHY2MFZxMzd5c1d5TlNxcGs3QmZjWWZqbnVXcmxvWkVCaEpN?=
 =?utf-8?B?OWlaWVVIR042eUkzU09NblZna3JMSzc0dzh4cStkSEtFV1VNQXBKUEI0dVRv?=
 =?utf-8?B?cjd2clRkZE9EcHRZNUhyaEF6QmZpZzlUN250RFkxVFZpWnR4RnB4em1BZ2Ns?=
 =?utf-8?B?T1JwY1ZpZ0YrQkpyRHhSd1lqTys4dElTWWFGRllkZUhoOUEvVnYxUUphdWww?=
 =?utf-8?B?VUk4V1EyS3d5cXFxL0c0ZWh3eG85eE5JWXVteG93YzRvQS8vTnF2T2RVZFQz?=
 =?utf-8?B?NVcwWGxXNWI4OXF0NjFiR3J4RDkzaXMvdFJYMW12Z3lMTG0zdkViQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5562710-990d-4297-a8a1-08de8b092ef5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:49.3394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VM10Yvk4SNxAmx2buDzD+rf2oRHywy5oAw8x1iik77fq8H9B5ytmW0jQLabzcmB1nuxEYLRt7DHIB5ngV5Et8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_002818_712109_B827B0BD 
X-CRM114-Status: GOOD (  11.52  )
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

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: d1c1400bd3b8b ("arm64: dts: imx8mp: Add initial support for Ultratronik imx8mp-ultra-mach-sbc board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
index 9ecec1a418781a6f354d73b499b181a573096414..3e6f9c88cc200b72b504640843baefcaa5447c8a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
@@ -275,7 +275,7 @@ pmic@25 {
 		reg = <0x25>;
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		/*
 		 * i.MX 8M Plus Data Sheet for Consumer Products
@@ -739,7 +739,7 @@ MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40	/* NFC_INT */
 
 	pinctrl_pmic: pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40	/* #PMIC_INT */
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0	/* #PMIC_INT */
 		>;
 	};
 

-- 
2.37.1



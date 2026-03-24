Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FD4F54AC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3JbLRBYQyguxD+nNKHFeiLRthIUIqllXhNyPmNjmSM=; b=o4WMc9ejGiExZbzbKAEB6FmOzO
	qXR0pSYdEpGQPt/3TiKEEeuXeAqH/IeDQg54rmO5aSIqXvk0Gz9AbcfQ9L/tciJaHgwxafQQm6HS3
	fVV4iynho6Oq7LWdHdLsjN99EwcR7fS5ymEwBzLLeCILbdPFKqHyYKoJTl6t+wuPbr1nrM0PgwsOs
	W3a7Dj7K0r4/E5Ndi5vagB7Ej45geWlISFgabEXJfkkfJ3S8uyScMZbFcJ2LcBtr22XU921jBYbkf
	Eg5eS9vEwliBs09L+fU2bCTXLTBqhUZTTBSkzzgclVGTmc3XJGUn8fTRtxXVwg6l553KRb5DpzBN2
	UkvnL1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53BZ-00000001hS8-0BnY;
	Tue, 24 Mar 2026 14:56:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53BW-00000001hRP-2Icn;
	Tue, 24 Mar 2026 14:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzD8Z6E92p7/k10SwFvRxnSiL7b35dCOWUeaFa6rSuQ+nU7D5GOQGEeUVz6WHjPNZhYB2Q9cNQjep25capauBYqo1eR4nWjZP65pJWAtKBsTVy/vMo0ZUmbg2axitD6qlc31pWRddTcl9AX6bx7FTiDsuRoIc7zvNM1/rsHd4Os4WPGqHM6JBZ87zFGjmmFdhnEHaOcp38bfdQVI8y7fXLrAG4M4bedZ5JLjm+slrtWkIKIVasRegKfJaimGsVQfDdQv6Gf9SLBa3Jgv8ShBNsEBqpapYBxkC6bKQ9H3VTt7x5JsVWXprInNxjdoVAp9xa5hQ3twVjImFDLzi2pETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3JbLRBYQyguxD+nNKHFeiLRthIUIqllXhNyPmNjmSM=;
 b=hqqioFrq1xR7S7nPaF32bsAjAv0I8/a0OjgeV/sES5TVGINVusllNeZGU5DeQIO2sJctkeDEyYwjfFf8d8dBTeRa9JHSHttOVjq3lrIjCpwBdNypojMq7vcPgybhmKvospWx01xbI8yLKv96qEdp0kkhGHYEFDmC/cwERL8S+CjKPg34SZuNYU24L2ayQw/FNpKly0oIu3Q/cJvlYPIAFfK86mJrC2ljHZ/pjN2u0i+EU38F9fn7vnU0Nog+/mic1xqveygvylweJovJqBAK52ljkHgNceBgG09O6p50N/OgKWZjDbuCPb8P/sVzu/eCQj0PtyoSajEFmQbxAJlu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3JbLRBYQyguxD+nNKHFeiLRthIUIqllXhNyPmNjmSM=;
 b=BdTUZynHSH7SOe7DPr8NAhS6tPzuddpiGLDMa/jMxh+kd8KbIN4HCOVisK1Dp7lpBIU6q0DmDNBl9hSd4CoFnYJK+zTOR7Gux7/6nbqJGNR116OZw8Ms06vm/au+rF9xnqpfKCbKiwsB0wILBx4wBuKQOPBWgROfscsi1CFhDyGmTPJRhiw7lqgEW5DK0T5XwzIj7RtAyJBXGezY8VIKYrwk0r4npCpWnnX2VgUrwB0JNvSFJN9024Q+bCepFFFrh2TyH3WfW/s1TCNtRCtqsqFbSPLGI3LHwMzYXf8CBVVYCRlx+IqtSXv7v/GMuLuz0fuB6j2KXOu1TP3vgnbjAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10694.eurprd04.prod.outlook.com (2603:10a6:10:582::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 14:56:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:56:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177436419151.2084305.2011108468596679341.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 10:56:31 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10694:EE_
X-MS-Office365-Filtering-Correlation-Id: 785ac9a7-bf53-427b-432b-08de89b58770
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|921020|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: ldVf5LxgtwMjiqCZPyJoLt8WWdZ3vUdbL7uQMkfx+xQNIeGg3M7hryh43YjomRMkUnP0YM9My2y5k+VSvqtD+UcAkEKVYFUx4QFsQQbnfnGlN/Yqs1+GYYtx22qGIj4BZkL5JZQ2R/3IDmCs5C4okeafEo9qU8hDQb8vCkNB3JDmff/no9DKSr/Tks22oPxAompS0tWUsC2LEk7vESf7rVGragdrDSHpqd29ugVuYc6gWrYYPfrySNNh9t+8WHzeNmUeQNnAja0XCmKbbu2DF+OuTnKVw44Gk2g5B2tX0jxc4PU75t9NeXMQw4b5K9DSBGYoJqJ+GfTQemtCJPAcfcXIsI7Hcs0rpsZ7zcdfs5rC+qvsk/GAwchzmSqGF29Uflwr+ABhOBDeyfzshlODpp+UL9mtvC3gXm88xUjgLO2vpAsHjAVrxnqGaD+l96ELf9FzmHokNSqvuwF4KpCHfDkMAs28peX+g68n52/Pu4UtpbsNk4Nyn9mxPQcW4DUNLIgXX78OyEbBch7yLHcSXgU+M+iZdYEl7B1CgYMxAOKsR/PZtqeBc4XVwBjq3ftIpLvh29UPvvEEXG4dIWGXzHCKGK2P7reYyuOn6ZUuVnKjRljUll+ZBwxRcrZkvhDcr76e+hjJPzdWUsxsLa78GtOGSUWCm8PiYjGZEj5zqj/0P9C/QlgC1w8y5vvgmQCn3NKWtMHrOIfaO/GAYmML9idHxbQ5d3YrwqVfO+iBRtjoErWMy0NZekSzcq/FuYwuuUymDVnC2VCC3E/za//QNuDJuYY/QxP4L0Rmdp4nkSlPwqeUnIi8QXM/bv7SByoe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(921020)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpJWERyOTcxVXFMSXc2SHdwelZucnRNRCtCc3ErVXI2cXFDSncrczNnUFlt?=
 =?utf-8?B?bUg2MTNzNTl5WXBlTk1WaVFDTmFuUEo5R2YrZTZESjRRY0tKVzNNNXVJRGZI?=
 =?utf-8?B?MlZ4bjBMUXo3Qk5oUzVXZ2ZhY3pWUmJxWlBZUXcyZzR2NVhWOE5lNzFhanE4?=
 =?utf-8?B?cUZxZWtvUVVkeFBvWFVKNFN5bkplS3FNNGhhRWFRYm5nL21YODQyZjMvRmdh?=
 =?utf-8?B?bFZGOUMxVHdjU0xPckZOa2sxOVZkRTJHN1pWZWl2SFVEdkI0aG1vWCtPNmRS?=
 =?utf-8?B?bzV6SWVjWEtIYlRjcVlpcm1jbHQ5MnYrem1WUVltU1hXZ1ZZMHBhU0NMdUdp?=
 =?utf-8?B?dWk1UGRVZnZZSzBtQzhVL1dSa0NOcjRIRzF2aytkNVZVN3RmcWdEaTNBMjVH?=
 =?utf-8?B?NHVkaXRQSExUeGoyNlE0ejFXdkpCNlpqazJhY3E1cFJ5cm1BcDNUZWJjeUsw?=
 =?utf-8?B?dXdyanMyOUtDcWc5SkNydGtVaWtQaWp5VWVUdHJ3dVBCOUluVTg5SFNnVTV0?=
 =?utf-8?B?MmprZ3YyY1dETlZEMUQ3allwb0VDVTV0VlhGSFBMd3o2bXEvM2NXc2lNSUtZ?=
 =?utf-8?B?cWlBdGlscnN0RFNJem9FelFvdWZEazVvK2l6KzZNRk9WdmNSVDVMNFdUc1ZY?=
 =?utf-8?B?bHl6RXhHRkVtWEJNK2xaNGNUTTRmcUUzRWxRVm1FM0ZQMjBjT0lRN05QM05j?=
 =?utf-8?B?bTJjd2dCdnJZZzBVV1pSVSs3S24wRWpzaDRCOGNKNjMxK3liOERUVmJ4S3Y4?=
 =?utf-8?B?c1ZZU2RtN25FamdUTCt1SFhUQUVhcjRyazRkNjRFOGNBK2JwMUwvQ3hmR01u?=
 =?utf-8?B?Q1ZUR2pkVkdBUnEyTThiQVdtM2x4blFwRHJBVUVWUGVISVd4L01ISWNVKzha?=
 =?utf-8?B?SlhLdElidDdQbThUVVVJVlkzV3lvb014R1NpN2JXUCtMUjZNbGxieitjWmww?=
 =?utf-8?B?R1FRcXJoN01kUWQxYmw5NmRZNGtPU0RwZk8rOXVjc1p1YXRhblFGOE5EUVY5?=
 =?utf-8?B?UUR2SW5wVUNwV09TT1RTQWZZSWQrU0hRV0hETTdhMHJiODIxaE1GNGZrME5x?=
 =?utf-8?B?R1B5RFlpVUdEQUtaNytXMHFMTkFCNjNNNzM4SmxvdndXUW42WE9WSTVSQ1RS?=
 =?utf-8?B?eFRXV2tKZUxKOVRjMXZGZWNnUnZyOTFmWlVmbG5NSTJxSkI2RlI3ZGZNMk40?=
 =?utf-8?B?YmRIaTBXSWNucnQxTWZybVpXa0gwakMvNEFqeWhZaCs1U3dRRUtGK29WWUJ6?=
 =?utf-8?B?QTI5TDgxV2lZVWZoQllIdmc2YkUzc25Hdk4rUG5EYXdITmY1dnp5aCt1NzVn?=
 =?utf-8?B?d0hXOUdNbjAzU1JKS2RJMjIyUWJOcDNaUXF2L0MwQ0dTa2FEU1Z2YkkwRTNO?=
 =?utf-8?B?YTFzbjJyTzlVTExvb2lPS2Yrd0N4bGZrQ3NmUndyaEJIMmJ5aThqT1lQaFJt?=
 =?utf-8?B?RENlSjZQMkpKYU14cWgxYkh5ZStVRWxtejhtc1ZyY2k2REgyVm9LVGRPa1ox?=
 =?utf-8?B?ZjE3ekgza3VVZFhkZ3NOSks3YkdmTkl6VDV1T2hqcmJISzN4dnJiU3JwTkU4?=
 =?utf-8?B?WHhYMnJFR0lXNHc5VkRQb1MzSktuMjAwUktCNjJYczJmRVViZmFqN1F4SldR?=
 =?utf-8?B?bmJ0SGxZdyt2V2ErTE1YaVRFMFA5K0k1ZFE4RFRDRVJjTTlVbCtNTnhaNnJq?=
 =?utf-8?B?b3o3Y29ZVURHc2djempVQ29RZm8vS0k0c3JZV1RLYllFOWFpNDhtUHMzN3lK?=
 =?utf-8?B?SWowaGlnYlduRjlkdkd2NUs4eTNKQVdtSjFXc2FFUUgwZDFjc3ZSNHBQbHpz?=
 =?utf-8?B?Q0ZUTm5vWEtFYVNhVDhYcXUybmZXeFJ5cWx1WGJyN3ZqNlRpNTE3YXRCSS9y?=
 =?utf-8?B?WHgwV2Q2dnhKbHlzMWlUVm8xdnJHbTVRZVl6S1pwd2xRK0lUTDVIQUtzMjA1?=
 =?utf-8?B?ZUkxMHFkTncrcFN0SUgwVFZOV292VStGRGNEL2FxRDhram84V3JDWmtDSkZ6?=
 =?utf-8?B?b0owbXIwZkZZYzNET0tMcEJGOE9FVHhLL1NpaHNpVTR6RWRVcDRPR3h1WVVC?=
 =?utf-8?B?ZUtZc09kOW8wYWFaZjdubHhpS2t0dHdrN3JFeHNUS0hYZWdzeWJQeUZNYWRP?=
 =?utf-8?B?Z1k0YU1vK1lyQlN6NEtyeGhJQVEzZ0RCTVhhREI2VzlDdVN6b2R2WXhPbzNM?=
 =?utf-8?B?bEpYRS9mdncxZ0V6ZjR0cWJyT1NKMzcxYXpZc0wyOTlmK1pzelIwcTkyeGY0?=
 =?utf-8?B?bGVmVndXeXVOMXhmNnQ1YWwyZGRvTEpEM21xWUhnbTJoMlpIcTBLdDF4NE92?=
 =?utf-8?Q?kTgY/eUZgIS8MYqK6/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785ac9a7-bf53-427b-432b-08de89b58770
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:56:28.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkB0zXhuCZM50T0Z8l4q60G5KrIVuCoT1hKS/jwhYgY9QJUQpjwFoTYev6wtiwd4yj1pH+xFLv+w7ZGSQ/3a7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_075646_626316_3D8BF7FA 
X-CRM114-Status: UNSURE (   9.42  )
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


On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Applied, thanks!

[3/7] arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
      commit: 7348e8d71c593792df4ebf653d98a576c04c851c
[4/7] arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts
      commit: f6c18c1c4ba574005d3b95faab0e8a3796cf3346

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>



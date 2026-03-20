Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA1108B8E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy63dmoltGmUwNx2nY0NtZLZomMmc30YoMrmVvfdb00=; b=b/A14cpS+imvM2v/Gg29cmviJk
	J/X5ePjSK3xEBwjlPkLk+/0pELhxJat9OH/Edj4HQg+RIsVSpl3rDeDO+8qKo1QCO/o1uecKfPArm
	zk1OISNHIM6fgRPzqVQFMNqyqfYH7jy3PzUBtum+9Z6OkueSEGH7Xsmp+4/9fyVOcJyrdr0JRMT/U
	0m7EXeGjuTz4KkLeW4PWogCHoC/xRtXuJ5E7ZHYIQQT+aVQGo2iDc//g812WTxKHnJyuHBx7C5/RX
	tYVZakCvJI+8D384JY54eo5ObmHVj6+dHDr6gBajVuJMpl3hO0Xh5WhTOf6RbtpSem4Omu+FoHPRX
	rz9taq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WOj-0000000CVie-3BJK;
	Fri, 20 Mar 2026 09:44:05 +0000
Received: from mail-northeuropeazon11011041.outbound.protection.outlook.com ([52.101.65.41] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WOg-0000000CVh8-44MA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:44:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JI4bVDxe4pD5BMhQzQJqXH5QS9MfeKdF8ppJ/GNso64/G5wC+WSj19FpQOofyuPt2oXQxphYVYGNgxDpT8nM2yiGkyQZZkFFasMyJCgdlyplO14guf7D2GdD2GO8KyajUlSBK36GTfWbG2gw1EpPodP5KltLlAjuLcdFd42UmTyXOMw6VyDsffh3qEmuLT9BxXSjkFwHYl0z0ojRTxO45Ilk13vtC/x/RC81UXB9nn6mndOEWdq18Us0yrHtEzgKfXM1Xg1xCF/+zuq3WgrT4dZr6DA66hd+zU6ij9jdUpkp1M9QH/5Gt78naV3+cfjIpBB2KWh/bHtvW3eesQ0Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iy63dmoltGmUwNx2nY0NtZLZomMmc30YoMrmVvfdb00=;
 b=MlvTSGQNP/ZVG/dSWddZEewwe9eHlBlWFCBikzuQ5tlyC+g0EAibnw7Bk7q/BZ+M1UN9b9ILYT+uq3xJDQ2hHPPGOkIhl1MG9e9K9z03LkvYLEOoCtSLzKhCquE9hewM3FKFvDFaV1lWe/9XmMjrupQC3Wr60aPq+wJg3kdboFX4zfJD2wrqstffT+2PLJ3xRd6/707JuGtzrSaZ275NEkDGCYazTW8eO2iDZnQ3re7Q6ne88hoxuMi/LPNqmaeR1E5IJ8qB5H29AGy/UQXphq2JUSMk6obvSxQasqIqqWHr/VHPGJSueP3V9ylcPXQs6YeUFo2FQNeKbguoo+7HTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy63dmoltGmUwNx2nY0NtZLZomMmc30YoMrmVvfdb00=;
 b=CtAW1rrpTh6VMhLRgL9ub9Lc5AKD7gk3Vgume3rxFlGzGBUAmCQD6iyiIIZaVZGLWnpViqLlHsXiV39gQ7Amh+jwakw0tjziwdDsCluz40IMtqCfcFNVkxqaVF3nLdDpcS7FhUb/1y6wEokLD5i2H6PwlnbcN7nUwHv+7C/TiRddCGp4335/UN0v9CTpxEsVqm1W6EtMutUYdktmyTu7tN8WqYliE5PPc64dw7mAYMDdjiL4Ut7d74IKUHSkNcKXLHgvOjFWxF6hOBhFHRo5n/Xh8BlW3LXlaj76GP0nuFn2xr2ijmSDNPS1VKQxANWhiai3I7QEC/IcR5q3wb4nCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 09:43:46 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 09:43:55 +0000
Message-ID: <3e1a3f07-8c0c-4757-afd2-b9e6574a6274@oss.nxp.com>
Date: Fri, 20 Mar 2026 11:46:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::6) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB8PR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e90384-bbc7-49d4-7510-08de86653385
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: OkUs+KqbDKsFFV5pjDiudbvE/aTQMoQMioJUEPveN5rvr/v7RKyD0ixuX/YavnwGsXFfvfmv5HJCmRl/cLZEidfldg+1CWfnzhb85QyXc9UlCRZcDlh31CUVm/eKoxhgEhVkbPj5bjdII8w+SVkKxqGIcOQVojjMBVW0dLte9ZZxGW9Jx9/dN93dbNcZ3aEkARrXIE5CMytR2DbO1mUtU+sCUQ8PlUjugtUhVAkb+5JwKLg0wNRuoKa5Fd4T8gsRwxd1LcB5tSPxiAGtD6zSe8xHotIb6NpNfBU1z/FtuXTJl8szZBLwRHqSvBlMmcGlqmWQ0GPgYkOdcafVwZAJMYGInCfNBEiXOezJ9/VW4T/8Eo+L23LBUDJucSL105+N/GuagGuPxeF/Jq0Rcbeitm48/5/jiT5c897v26ClzQM4iFrO83NtqtQjpJcgRIhCocrmw8XXTPf2+TDOg7ENf9D8Y1ZNn9Q9zMwPRHddNrA9mNrVZ0Ym8B7/ZWAvElnIEvqSApSSPH6osX5TPnOC7+ORr7kLcmKYsONpscw/MnIQjCeNXxoE+huycZn1fJQiPmTkkrViejSlvgojypjkkkinZWlBK2mHL+3YhJFo7xCfRAE3FpeSEeTyK8qIVpi7qbKW+oRSTu3va7Xe+3GG62eYlksKmhuphcfLKfAbcs9vHy60+2y7KnyAxyFTwiEiYANui5mW2zZVRGDJ8YDgeajHhZvM4yq90zgJhh/SZ03pvJe6QAKaS6SA33bTuqbAzLpvrsMNwXs/zGdxkShnSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTI4TS94bzRoU0xHcVEwSjRDNkd3Myt4N3RpKzhVajc2MFhkY2hCYlZwRWw3?=
 =?utf-8?B?T2xxWndHbHpiMDlVS05CUW9jOStsYVU3eFRjeEkzcU5DTVNJK21ZSGl0bzBV?=
 =?utf-8?B?R2gvVWRzRGxYbFFxSE1PWFBsTTVyeFNuQ2lJUm92dEJsSGtJdWQ0TEUxRWZ6?=
 =?utf-8?B?V1NuVFBEd1E1MW12QVVrd3NncXYrR292bjFicW1aZFhUTFgvVzBObHp4WEVz?=
 =?utf-8?B?WlY2UU5TRGJRSVVnOFFCdVcyYXU2dEtwUVJYRnNVNzN3Qnl0NTFxanBybmFl?=
 =?utf-8?B?dDZzRk5qUjdZeUJ6bzVvREU5TVJaNDNQRXc2NUVDSmJTZFErd2hUV1huVS9C?=
 =?utf-8?B?Z21HOXRCRHd0eG53WlFaelRzdC9ZWG94RXN2ZFZCdElicEEySnRHUWZ0N21M?=
 =?utf-8?B?aENaQmVGbHBtdmhVQ01KMHdTUmk0L0c5dDBmVFZpdGlNSXNGTDVKRitEbDZY?=
 =?utf-8?B?Tnd4ZENndlVmb08xQlF6dms1TGxyQXNTYzkzZGwva1MxNEVZenhxcEhRb2xD?=
 =?utf-8?B?SHNPTXNtdU5zNWVCNDk2UUZaSnl0T0NGSVBJcW1KcDVFRzF0eUtURDZQQnBI?=
 =?utf-8?B?SU5jMVppNzh0TXFITWNrbWtqMkExMWd4Y2x5cWN4RGFCazR0ak1hdDJBbk11?=
 =?utf-8?B?MlF4dFNyS2lVZU1BbWxoQ0IyNTFEQUZUUTBudzUwZnMxR1dEMWlFWVNJbTdX?=
 =?utf-8?B?cnVtRnYzeDdTeHpDdThVMnY3K0ZjOVJFQ2d5Zzk2L0o3a3JnUGUraE1OQXhR?=
 =?utf-8?B?TnAzMDJmK05kR1RSRnpBUDhKTVdwcktjVUEwRHNJMVJDdC84VGFlUUwvSk53?=
 =?utf-8?B?L3h5cTIybTY4dzVxdVFBVi9zZ3FrbFNkdUg3TWV5NDdROGU5RVQ1Q1lHWXU4?=
 =?utf-8?B?UVd0SWVyVFFPMXhnZFlNY1JiOTdGSUJrUC9nYTZPY3c5UjU0RWIxdnc0T0Jl?=
 =?utf-8?B?WXpRUG13NHI2dUo0TE5paEd1MkhDTEdjd1RzMFM2empNWmU2eGhmZE9VTE94?=
 =?utf-8?B?c1MrcVdDT29LNkc1SWh2Y2dDSW5SY3ppdEMzSHlyd2g1aGE1VkJhbkQ4ZGc2?=
 =?utf-8?B?N3BOdDAvNFhIbWhBcnJWSnlZOTVkb2c2aENMc1pueTUwcklGa2F0bFhHMlFS?=
 =?utf-8?B?djNSK3E1VkczSXdyRzM2bHpOcEN5STJGVHJyUjByeVRYNFRFVXJhYVFRVGE0?=
 =?utf-8?B?eEl2akNYcW1ZelkxTVhPNnpNbnNlUGJhM0xycTNxajBieGRZbm5KMnM0K1pj?=
 =?utf-8?B?VkhjT0NtdmhaNzZYWU5EWFkvdEZNdHV4MnhKNkJXSkllOVdLV3NwekdhbWlJ?=
 =?utf-8?B?VkkreXRmUVovQWpCRkFtOVBXdFZ5SjhlZVBFdTJmOU45UHlWSmlGK1djNmgv?=
 =?utf-8?B?c2o4dmg0ektQblpWRGptT09RUE81aGhmRjlBQU9xVTF1UzM1SGhIaE5ZUFRU?=
 =?utf-8?B?ekFYT0xLTm9NMWVTTnd2Yld6elMrcTRkSlBUSStnVXVMaURHODlwL3NsakFq?=
 =?utf-8?B?ZzBQVVJFcVVIMVZGSzk5Uk5mcVJMSjl2eHR3ZVk4ZStYeHd5d3hWb1kzNFVa?=
 =?utf-8?B?elJtREFoY0xheEUrOG9jNmh0RmRoc1RlcDQzYnJlZjlEL3pWVW4rbm5HSjJy?=
 =?utf-8?B?Q2cyT1hhUHRJbHgyMzJyN3hnN2dVa250LzJlREp0azRISGNCOHBUdVNPcjg5?=
 =?utf-8?B?NnBWMVFGQVU3Vk44NWczL0Q0K0xUU2Z4SE1tMW5CRW0yU25DSVdXVzlzemVp?=
 =?utf-8?B?VUx5bURFVDE2aHJKT1RNNWZUVm4rQVBtQVowajJLdGovUENjZ2JKTmdqZUZF?=
 =?utf-8?B?OWp0TGtBaDM2WFM1ZklXR044em5UVjNVQStGS3hDbHlwek1tYURqRk5veG4x?=
 =?utf-8?B?ZnhJNTdNdXFnZllCbjdta1RXbGpySDJreEpXNVVVS3cwUzExdjlDTUM1UzlW?=
 =?utf-8?B?VmJqY0FrQVJWUjNaUHV2M3ZuZnpQbFVOU3QwQjZYYWtYK0lPaWlKYWtleFpv?=
 =?utf-8?B?Y2VqNmh1Nk9yRk9tb0ZLYVNjZkVIeUdvMjZBOTl1a3NyWXFnZndwbjFubnpQ?=
 =?utf-8?B?TitUMVVHdTMva2tWRzc5VC9wMmVDREVwY0tudGJLWS96YkJxR0FLNGJCU2Iz?=
 =?utf-8?B?QjVjRlBQMW9OVnRNMnppTHZuQzVTcmZQNkFGNzlwOVFqWWxvelU1RWJmdFJW?=
 =?utf-8?B?YnhpT1p0OTRXMG1YWnkzanlZcitSUW83YzNIRjQxNld2azUrSG1UaUk0bm43?=
 =?utf-8?B?Uk5hb1Y0NEVQRjBmTWNEUmFPcGpJZklQSXFJK2V0TDdNMzc0OEJCRWdnVTJt?=
 =?utf-8?B?ckpqY2x1T2xLaEdmamVOQXdRcmQySmpsK2JOWkIrZzc3bjlHRHVjZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e90384-bbc7-49d4-7510-08de86653385
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:43:54.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bHqDE/7PM5JwrSfIIUX20jUaTZr0wkuz8Xznj7uzAaSBinaqC6bAqCPkqYSJNS5b/fJKPGXu6Aqo80N+WQF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_024403_011681_74F3A7E3 
X-CRM114-Status: GOOD (  13.29  )
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

On 3/12/26 14:36, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:           0x0ffc211d
>   CM33S hardware reset base: 0x0ffc0000
>
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC‑specific mask before
> programming the reset address registers, e.g.:
>
>   reset_address = entry & reset-vector-mask


What do you think about this idea:

Use fsl,reset-vector-base instead of a mask. It could happen that for example

a CM7 instance has explicit requirements to boot from TCM but the entry point is in DRAM.
Then masking won't help.

fsl,reset-vector-base is always fixed hardware integration dependent and you can always

specify it in DT.




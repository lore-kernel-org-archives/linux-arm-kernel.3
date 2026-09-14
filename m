Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9231EC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxZ8Ez+TEhfMIgB3VjK88pB7It+1EqrFackGK9FFUZg=; b=nFlrVNAn6Q3uJ4Vbxdq/HsrpjW
	CuC1hujFd9HY4MLMXQaOgqcG/ixtgpE+L0cXQ7e611MjHFZm3R3DBFhKkVHkDUP1iOjTCknlGRC3i
	IQZeSbk4QZDmBTrDDFduaZujk3Ii0YVvGDq995U9t/B/CYiCSDr3oE4kwEXBlTV4gOxfavrKR6dfK
	SkFdNZiqNWu9CVF8o5QWdaJJ5KIh8dBgmiSvWb09NeiCJAUmKzCNSsOec5dZGHjizMqOKrZaLk1bJ
	GSMlP9F21q3le45rJC7LouXS8YlJ81yP7dizEbv/vnh1ELbWu0yJ1/UqxkyeESJzIKmmXoKmeXyin
	geLXVnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x668q-00000003e5I-1FIV;
	Mon, 14 Sep 2026 12:50:36 +0000
Received: from mail-northeuropeazon11011053.outbound.protection.outlook.com ([52.101.65.53] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x668Y-00000003dma-0Eun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3KOYaUMC1JRelKtE8lasICBJmbBuaasfChrVP4hpzMcxR5nDRk5Lthe9jqC9NnEcvQ3ut1g4NWYEMzoOpklvqULprn4FnIumRjWqQT4xUWO1nQj9o8u5oVTuM8m3Guaycd7lzGsPNSm0nEEHHZ2yjm80ig1BqQxTMhR5owUmIPQNqAs6vu4wwent8jNRLlwzUh1MdbK01tc6olyiH0j1Bb+d7rGYggwERvU6qfztu6fG7NwTEBRBlWIiRcmyofIX1T+76vCDGZaN719sMLL6o+HK5TQ5j05cfo98heGeXepAvSt7qc8yF1J3v9UvSlIrl4GKAKzDxPigx1UOSdZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxZ8Ez+TEhfMIgB3VjK88pB7It+1EqrFackGK9FFUZg=;
 b=RSjEksje/WGdp1iqZz4tnkAttTt1Rn/2AMX0s79YRAiLEwhXmUqK4Ssc5+gWwRJ0IQZ3XfL9CrKGe1RwD1nEh0zGCbVgpeccWYhNsPJ6JQSC04uJ8e3QJ/ZgJAXClcJo4toAlxOR8mb5JlWnj5t4aPcH/xraV3ePNZz/W4MxxAVMKtdlw+KS8FhX9tEB+cAZ+P3KjmDsXo81vPI2f8FdLTzCf8cs+9upEUXC1LT02YmEYwYVkK9j9vA/qgNCirkSYnGg1de+6yojHU+9VqTxVQvkY8yWtGTHLUVfsQFKrpIFnfI1UMhdoQP7ypnvGIC2u3OXJjMcsFJVTk5MlD+Gkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxZ8Ez+TEhfMIgB3VjK88pB7It+1EqrFackGK9FFUZg=;
 b=TvY8tzjWfOUJhOKJxQbvo5VW/9SzaTPARThLgJYpW0QYiwKmxwgETQf3zAwTz4bq9MlEmCWzBO28ffkrHvvbR/kgZ2nN7q98yNfcJXIwh1lmkccX/lYy1BE3/xEmG99MyFwi1/YInut6+r7jdYHS/ygbxwo9cvpHww9Pp+AQvfgdJ/866ppZpEbJ0qWmdlToXnRA73d8fRM28PlEScDQTRxMTGBEd7gXt9iYscC9roubNPRzBRdX9NA2zPQMnY+/wzVzdMGQWYV2wt2+khTbp9A4NdYYxMaSHCnaiDdi/L8ABj12iejjHfTFUA7/R/nuTitQ3ZW39tcKg2KUSKo8+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by AM9PR04MB8971.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:50:12 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:50:12 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v2 04/10] scsi: ufs: Move Versal2 M-PHY CREG access helpers into ufshcd-dwc
Date: Mon, 14 Sep 2026 14:49:54 +0200
Message-ID: <20260914125000.30812-5-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914125000.30812-1-larisa.grigore@oss.nxp.com>
References: <20260914125000.30812-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::16) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: c8114011-e2c6-4fd7-be57-08df125eb75d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: r8BDfZ/OFNQbusSp8HcfQaxRI2CthDPqM6AU89OA/XtwepY7YLKl2Ik6J639SVSWvWOpZK+0i10moYxSbZsj0OVXlr6wLuOlYSu/4BT4M3GIL2KeDNOILtDmQVAsIwqhUZN7MenYgHkVZqzbUj8kR9L32GZ0PBFg6yRATRlB/rpaKfgGZiBQLHJzM5uQD50dAvMtSRmFrti7ibmgWDrj32Nrlc65IJlogwmT+A6w0Lqr4E4MeYwsNjStyKvp2PmO+8N32l3ApOFpSsqcBtqbA13KOPTcL+nbtPQtnjCeXkqew+Md+mBRIF7wpdZ/YDeqWahj5PCJyB1jmmoMsA20rXFnXfBkOEJb4xmCGWawYiJnLEAr32/axxKoB7r5byD1+gLdN+VL3Txsr/qHsfO/+8KUnvWf2oU7nHj3GVFIIqcW1TcljQS8xJKEkId/vO+oFUoVvmJmAftWI0nl+93HWnE1+7RgaIX1nEnzYv8RDM9IffTAwWmsHDQLTsqbwlqahJlmMnhp/3jMjFdHojSvmxJ9yk28xPftsGR3goa2SRW6uqZIwK7LQ0IdeNG/rAo2BiXdjnZZtS4rjfkXG74XmKVP+kWy6gG+jEbHEy63HemzJ+uuPGoTdSdf/QOr9A/7Tx3VmrJCy06IhRbMf0seR3qy7pzd1MIkTt+57eHWOXpD/BFQHt5Cg1j8+YMibLvow0udZcZzyqpwNBnEnz/Iyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZEU0N1T3pIU0taSEJNMGczS0FRYm10NTMvWHEyVFB4MGk3WmJmMEJpWHZU?=
 =?utf-8?B?VGdTaEJYelBvUzVYQ25YbHlCdFhrVk5LVVk1UnFFblhpQlBEY096NjcwZTdy?=
 =?utf-8?B?RndiT3ZrQ1BsUldtR2lxSjQrY2lycE5tWmR6MU9WdEdQRHpwUDlrZDBGWlN4?=
 =?utf-8?B?WFY3ZFcrSGZ3bG4zcnpZOWpXdXgrQlZQT0dvczA1U0VWeHo1bTB4K1pTQ1N3?=
 =?utf-8?B?VW1Yak1samlrN1AwbGlKR1lwbUV5RWJLOWhGaFZhR2F3Q0ZQZDg3SjdEaTZV?=
 =?utf-8?B?TjhBdVJXSStHTHBiNnRiZlZCakdCaE5tY2M2cDVjNnQrdlp1UjFiY2VjMHR3?=
 =?utf-8?B?Q0M2Nm9MRHIydUh1ZlRzdmRIeWYxenpkZS9BcjlUUmtGOFpMTkt5a2llcnFq?=
 =?utf-8?B?V1N0bXYyd0xhaTkxOUhUS2RWMVgzb05tRHZPOFN2V3gzTGZLcTFrSmpmRDJC?=
 =?utf-8?B?MEJKbHJQREZjUHJVckFOK2g3Y3o4ZXRnbHpaTWo1a0tWY2xmMS9Td1NWWkhX?=
 =?utf-8?B?RDltTHowQ1ZEby9COGNTZWdlV1pNSjYxWGYySURSWklUdTZjMzFzRjdvRmlW?=
 =?utf-8?B?QWp0UFBZN1EvOTJlQzlMc2tjR0l4dTI5N0s5ODJSNFdvOUF4TkFuNnhyVUkx?=
 =?utf-8?B?TnpyUlRtRUdxMUYyVVZuOUEvU3JDN2FuSHBPRHZMRExtb3FXRmJzTTZEdGc0?=
 =?utf-8?B?Y080VW1MeEtPZ1ZCN2lXQ2JtYUswdmlDbDlaeWptR2M2WGVSZG1UWHdUeVJj?=
 =?utf-8?B?VVdlZHdSYnhnNWc2dzhNK05aQVpLczZGekt0Z0hLc25DVGNxUVdYbWJUVXRD?=
 =?utf-8?B?bGo3R1JnQnpzRVY3bTVPd0lmc04xeDUxRGZzZ1d0aTRnZGZrTHJ0SUF1N0g5?=
 =?utf-8?B?TFNQVForenloWUpYTE5ZSkVCZmt1WlVoZDYzaGh2N3RQQnhDT2FkRWZhRDhM?=
 =?utf-8?B?WHFDdEpNOGNISnV5blUyVHA5Kzk1Smd1RXFFdThWWXR2V0NSZFJvVHV6cTlq?=
 =?utf-8?B?TWtvNldFQ2g2eHdjdVZoc2xhdkNGMHNtYnE0OENXaUU2cklXMkxtczJwSGJ0?=
 =?utf-8?B?WlRmUHlvZVFYeTRqRkFmQmZvcnB0dFB3aGU2anNKTlhQUFU0Rk1yckRnS3dW?=
 =?utf-8?B?SFlyZFQ5T3NhYnJoQkFud3cveFpkZ0gyUkFTeHE3ZDZkTUZQcG5jSWVRQys2?=
 =?utf-8?B?c08vdC9zTGw4MVFQSmE3MjB5dExER294QnNzYXRGMHpyUlZiOGllK2hqSWZE?=
 =?utf-8?B?djFLQkROcmhzNDdwRjhheTFsS1duYTlmL0NzODVxOEpSS091OUFxdGJHaHpU?=
 =?utf-8?B?bGFMSElKTmcrdFRWRklqL2NBQUUxU2hvdE1DRk01Z3BoV0luNzFudG04MGNw?=
 =?utf-8?B?M3lDaXI2YmVqNVpXWE5lRzNWSlJIMEo2Y1BsUE9kZUh0TFlFUFFGQlMyT0tk?=
 =?utf-8?B?QlpCbFJnU0hpYTZ3cTdDZ1NGNTNQTjRrNThtSFcrV3M2Mzgxc25kTno3NFEw?=
 =?utf-8?B?U0JGYi9NaGt2NGUwek5wdjdPY0Z3dWhmaUtBVURhZE9aSWNYR0VCWi9EcGJJ?=
 =?utf-8?B?ZnY3bm84RXBKN05WdlNkOWNkRlljRmZKbkxkd21JSkczVmZ5N0JCWmtQT1Z2?=
 =?utf-8?B?VStxdDM3MnR1QUhPSkxGTGp5dW0xM3B3V3VHeDdJeEtsc3pOeDZqOTZXbDlY?=
 =?utf-8?B?ZWVnb01pdVBWcXBFZVAxQVg5VFNrSHBmSFpvMnNPL1hMc09RWjlqWXFHbWRZ?=
 =?utf-8?B?cm53MGFKV1BPYm5XVGRVNGo4dHozWnFTZzREVnlHeWdRNFkwR0Rja2hXUGM3?=
 =?utf-8?B?amE2WE44d1NoRloxY3NNZFhwdWtUOUw5MXVRekYyWjFZaXhaSWVqVGQ4NTFk?=
 =?utf-8?B?R1dabDhLSmt1T2Z0cUhKOGlZcm5XYjN1MzBvTUhkdnZvMWVOeFltMnVkUmc2?=
 =?utf-8?B?OEU5NHJNZVVkSmZRT1hzcTB5UDRVNEJHNVlIYmh6THJ4WXVnOVJhU25pRk51?=
 =?utf-8?B?MGpQOWdMSlJvdXdKQ1FTblQ1cG1FUlhZSWQ2Q3kvc3RTOFhQQW9pWWZVMWF2?=
 =?utf-8?B?WkFmY2ZkcU9sbjFIREtYRDl2L0tzZzhVUlFyMlRFbVhzK0hzaXJsdUFMZnVO?=
 =?utf-8?B?RGlHRGkvU2IxdmRyQ3NEUEJYN1NDbllCOGloVVpCbWt2cW9aZ3FuM2ZRcXlU?=
 =?utf-8?B?eXRHTkdEdWlrWXNJZDhiVm0xZHRTUW9zVWc5NmI1MDZBNkUzL3JuUjZaSDlr?=
 =?utf-8?B?WHhJakR6ZXdVZUh6ZHBHMHgxT0FIUUVGMnZWUlpGUVRRTkppbWFCNmR0cFlH?=
 =?utf-8?B?ZjF5TWFYZG9PNUtvcEdvRDdjSW1FNldxTkNiTGZnUVZ3eFdEa3RuUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8114011-e2c6-4fd7-be57-08df125eb75d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:50:12.3613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI7r23c3ABsM40dK6YuJTh61UemoiF1xYZbDQl2cgB+WpWAv0W19JLltt3I+HgCwxcIhIOV/EtFW0FDxLhdQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_055018_113680_3DBC5C74 
X-CRM114-Status: GOOD (  14.03  )
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

The AMD Versal Gen 2 UFS platform driver carries local helpers to access
M-PHY control registers through the UniPro CREG interface.

Move these helpers into the common Synopsys DWC layer as
ufshcd_dwc_phy_reg_read() and ufshcd_dwc_phy_reg_write(). This avoids code
duplication in DWC-based glue drivers and provides a single implementation
for future reuse.
Dropped `static` from `phy_write_attrs` and `phy_read_attrs` since there
is no benefit in keeping them persistent.

Update the AMD Versal2 glue driver to use the new ufshcd-dwc helpers.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/host/ufs-amd-versal2.c | 85 ++++++------------------------
 drivers/ufs/host/ufshcd-dwc.c      | 69 ++++++++++++++++++++++++
 drivers/ufs/host/ufshcd-dwc.h      |  2 +
 3 files changed, 88 insertions(+), 68 deletions(-)

diff --git a/drivers/ufs/host/ufs-amd-versal2.c b/drivers/ufs/host/ufs-amd-versal2.c
index 0d4d5e98ad65..c7da95999c85 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -43,57 +43,6 @@ struct ufs_versal2_host {
 	u8 ctlecompval1;
 };
 
-static int ufs_versal2_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
-{
-	static struct ufshcd_dme_attr_val phy_write_attrs[] = {
-		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGWRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGWRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1, DME_LOCAL },
-		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
-	};
-
-	phy_write_attrs[0].mib_val = (u8)addr;
-	phy_write_attrs[1].mib_val = (u8)(addr >> 8);
-	phy_write_attrs[2].mib_val = (u8)val;
-	phy_write_attrs[3].mib_val = (u8)(val >> 8);
-
-	return ufshcd_dwc_dme_set_attrs(hba, phy_write_attrs, ARRAY_SIZE(phy_write_attrs));
-}
-
-static int ufs_versal2_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val)
-{
-	u32 mib_val;
-	int ret;
-	static struct ufshcd_dme_attr_val phy_read_attrs[] = {
-		{ UIC_ARG_MIB(CBCREGADDRLSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGADDRMSB), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(CBCREGRDWRSEL), 0, DME_LOCAL },
-		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
-	};
-
-	phy_read_attrs[0].mib_val = (u8)addr;
-	phy_read_attrs[1].mib_val = (u8)(addr >> 8);
-
-	ret = ufshcd_dwc_dme_set_attrs(hba, phy_read_attrs, ARRAY_SIZE(phy_read_attrs));
-	if (ret)
-		return ret;
-
-	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDLSB), &mib_val);
-	if (ret)
-		return ret;
-
-	*val = mib_val;
-	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDMSB), &mib_val);
-	if (ret)
-		return ret;
-
-	*val |= (mib_val << 8);
-
-	return 0;
-}
-
 static int ufs_versal2_enable_phy(struct ufs_hba *hba)
 {
 	u32 offset, reg;
@@ -162,64 +111,64 @@ static int ufs_versal2_setup_phy(struct ufs_hba *hba)
 	u32 reg;
 
 	/* Bypass RX-AFE offset calibrations (ATT/CTLE) */
-	ret = ufs_versal2_phy_reg_read(hba, FAST_FLAGS(0), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FAST_FLAGS(0), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FAST_RX_AFE_CAL;
-	ret = ufs_versal2_phy_reg_write(hba, FAST_FLAGS(0), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FAST_FLAGS(0), reg);
 	if (ret)
 		return ret;
 
-	ret = ufs_versal2_phy_reg_read(hba, FAST_FLAGS(1), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FAST_FLAGS(1), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FAST_RX_AFE_CAL;
-	ret = ufs_versal2_phy_reg_write(hba, FAST_FLAGS(1), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FAST_FLAGS(1), reg);
 	if (ret)
 		return ret;
 
 	/* Program ATT and CTLE compensation values */
 	if (host->attcompval0) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_ATT_IDAC(0), host->attcompval0);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_ATT_IDAC(0), host->attcompval0);
 		if (ret)
 			return ret;
 	}
 
 	if (host->attcompval1) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_ATT_IDAC(1), host->attcompval1);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_ATT_IDAC(1), host->attcompval1);
 		if (ret)
 			return ret;
 	}
 
 	if (host->ctlecompval0) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_CTLE_IDAC(0), host->ctlecompval0);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_CTLE_IDAC(0), host->ctlecompval0);
 		if (ret)
 			return ret;
 	}
 
 	if (host->ctlecompval1) {
-		ret = ufs_versal2_phy_reg_write(hba, RX_AFE_CTLE_IDAC(1), host->ctlecompval1);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_AFE_CTLE_IDAC(1), host->ctlecompval1);
 		if (ret)
 			return ret;
 	}
 
-	ret = ufs_versal2_phy_reg_read(hba, FW_CALIB_CCFG(0), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FW_CALIB_CCFG(0), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FW_CALIB_CFG_VAL;
-	ret = ufs_versal2_phy_reg_write(hba, FW_CALIB_CCFG(0), reg);
+	ret = ufshcd_dwc_phy_reg_write(hba, FW_CALIB_CCFG(0), reg);
 	if (ret)
 		return ret;
 
-	ret = ufs_versal2_phy_reg_read(hba, FW_CALIB_CCFG(1), &reg);
+	ret = ufshcd_dwc_phy_reg_read(hba, FW_CALIB_CCFG(1), &reg);
 	if (ret)
 		return ret;
 
 	reg |= MPHY_FW_CALIB_CFG_VAL;
-	return ufs_versal2_phy_reg_write(hba, FW_CALIB_CCFG(1), reg);
+	return ufshcd_dwc_phy_reg_write(hba, FW_CALIB_CCFG(1), reg);
 }
 
 static int ufs_versal2_phy_init(struct ufs_hba *hba)
@@ -406,7 +355,7 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 
 	for (lane = 0; lane < activelanes; lane++) {
 		time_left = TIMEOUT_MICROSEC;
-		ret = ufs_versal2_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
+		ret = ufshcd_dwc_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
 		if (ret)
 			return ret;
 
@@ -416,12 +365,12 @@ static int ufs_versal2_phy_ratesel(struct ufs_hba *hba, u32 activelanes, u32 rx_
 		else
 			reg &= ~MPHY_RX_OVRD_VAL;
 
-		ret = ufs_versal2_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
+		ret = ufshcd_dwc_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
 		if (ret)
 			return ret;
 
 		do {
-			ret = ufs_versal2_phy_reg_read(hba, RX_PCS_OUT(lane), &reg);
+			ret = ufshcd_dwc_phy_reg_read(hba, RX_PCS_OUT(lane), &reg);
 			if (ret)
 				return ret;
 
@@ -483,12 +432,12 @@ static int ufs_versal2_pwr_change_notify(struct ufs_hba *hba, enum ufs_notify_ch
 
 		/* Remove rx_req override */
 		for (lane = 0; lane < dev_req_params->lane_tx; lane++) {
-			ret = ufs_versal2_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
+			ret = ufshcd_dwc_phy_reg_read(hba, RX_OVRD_IN_1(lane), &reg);
 			if (ret)
 				return ret;
 
 			reg &= ~MPHY_RX_OVRD_EN;
-			ret = ufs_versal2_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
+			ret = ufshcd_dwc_phy_reg_write(hba, RX_OVRD_IN_1(lane), reg);
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 21b1cf912dcc..0eceec543d14 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -141,6 +141,75 @@ int ufshcd_dwc_link_startup_notify(struct ufs_hba *hba,
 }
 EXPORT_SYMBOL(ufshcd_dwc_link_startup_notify);
 
+/**
+ * ufshcd_dwc_phy_reg_write - Write a DWC M-PHY CREG register
+ * @hba: private structure pointer
+ * @addr: M-PHY CREG register address
+ * @val: value to write
+ *
+ * Write a 16-bit M-PHY CREG register through the Synopsys DesignWare
+ * UniPro indirect register access interface.
+ *
+ * Return: 0 on success, non-zero value on failure.
+ */
+int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val)
+{
+	const struct ufshcd_dme_attr_val phy_write_attrs[] = {
+		{ UIC_ARG_MIB(CBCREGADDRLSB), (u8)addr,        DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGADDRMSB), (u8)(addr >> 8), DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGWRLSB),   (u8)val,         DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGWRMSB),   (u8)(val >> 8),  DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGRDWRSEL), 1,               DME_LOCAL },
+		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1,              DME_LOCAL }
+	};
+
+	return ufshcd_dwc_dme_set_attrs(hba, phy_write_attrs,
+					ARRAY_SIZE(phy_write_attrs));
+}
+EXPORT_SYMBOL(ufshcd_dwc_phy_reg_write);
+
+/**
+ * ufshcd_dwc_phy_reg_read - Read a DWC M-PHY CREG register
+ * @hba: private structure pointer
+ * @addr: M-PHY CREG register address
+ * @val: pointer where the read value is stored
+ *
+ * Read a 16-bit M-PHY CREG register through the Synopsys DesignWare
+ * UniPro indirect register access interface.
+ *
+ * Return: 0 on success, non-zero value on failure.
+ */
+int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val)
+{
+	const struct ufshcd_dme_attr_val phy_read_attrs[] = {
+		{ UIC_ARG_MIB(CBCREGADDRLSB), (u8)addr,        DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGADDRMSB), (u8)(addr >> 8), DME_LOCAL },
+		{ UIC_ARG_MIB(CBCREGRDWRSEL), 0,               DME_LOCAL },
+		{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1,              DME_LOCAL }
+	};
+	u32 mib_val;
+	int ret;
+
+	ret = ufshcd_dwc_dme_set_attrs(hba, phy_read_attrs,
+				       ARRAY_SIZE(phy_read_attrs));
+	if (ret)
+		return ret;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDLSB), &mib_val);
+	if (ret)
+		return ret;
+
+	*val = mib_val;
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(CBCREGRDMSB), &mib_val);
+	if (ret)
+		return ret;
+
+	*val |= (mib_val << 8);
+
+	return 0;
+}
+EXPORT_SYMBOL(ufshcd_dwc_phy_reg_read);
+
 MODULE_AUTHOR("Joao Pinto <Joao.Pinto@synopsys.com>");
 MODULE_DESCRIPTION("UFS Host driver for Synopsys Designware Core");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index 0406f2bb576b..d8673cd54d4c 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -45,4 +45,6 @@ int ufshcd_dwc_link_startup_notify(struct ufs_hba *hba,
 					enum ufs_notify_change_status status);
 int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
 				const struct ufshcd_dme_attr_val *v, int n);
+int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
+int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
 #endif /* End of Header */
-- 
2.43.0



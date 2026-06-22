Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C8BCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=; b=eM0vjW5SwiUf1mHOGqNNyFTCNv
	BbIjYY2h5m1GwYnaw6Tnj81RXweFsgSFcBVIzAZ0gGM00ASmFKjwNpxcqecXySg/MmVbvT8tDtlvc
	70CNgP35whZr7Y5X7zxzFTPB5HJC5fdgQy5k7VmqhQA5nWpSq02AZjfqc0slxew7Y7oFnu3t5QemB
	W956CcQg87cLoqSbS6jEqGLlYy0uDl9XG6PZG8T4ogtZ+7hPJpJhU3IrIyjHTgKPDcZKzn1G7JIl1
	YBRzfdwLjnrkomV7jVcRBDvp7BELcDm8Ng5pxKJxkj+GP1EjDiJju6WalTOxUCnaGd+RhZCbvPRRm
	Y4rHOcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUJ-00000004hnx-2AJU;
	Mon, 22 Jun 2026 08:58:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaUE-00000004hmg-3gjN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Message-Id:Date:
	References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=; b=NIwfpcDzC+TgFZavoNgDvecYeT
	VrcHWaWwhbVAyxL0xfTd5piTUTRS7Qzvwk+LnCPwMGWL+CutS6WClIRPCLowpVdffdFHJVLhGoTTu
	sc2MrJyyBn1kzSwA15PCVlLjIyUX4BuUWVVkAjM0IYgTb/bl0IgCTZiWBLl69kgr1NWRDGKp0O9IR
	0Frr9J3xMctrD2odacw6BpSrHsPtP5yhsJMofE5NGIc+OMxqU+n4JNzyzdkI7Ssnnxcc6vU+2vb57
	R4AgKJoJizQNGj3QqRBWb/jWsTk/r4nENzfpHgU9XxC8TPP5cncse1oWsTJh7Bqxu15zTV6RupmpR
	tq+6ndtQ==;
Received: from mail-norwayeastazon11013037.outbound.protection.outlook.com ([40.107.159.37] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbaUB-0000000HEcV-3q4U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:58:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAgzV6r+UKV3aXwOBkVVCkIDJLBiKMT6ptaNSA/q2rKjaB9rvYdqvhUIabMi0jc92XUrDs8GVpubvr6CHzG1b/Pjr4YcTeydjL4JtFi957iocPcHQLkEQQVN6FNCzv3dGoNO8SLHCpTBRkk8JL3xxshs1EPjBic7FeLX1Kd/1IGwfUh2G3bwr9zNO6qwd+7zR5I+J0LPMEOH2RVnP1m9iI2ecUfGJHWNE5DW9rz3cHp/k8FtKWv98ebSNJUPJ7im0/T6lM/SPE1KmriDsMrcTwslLrsax4dDEw4e/LJJFjspFMNMolB+7Il6gSsNaqEcl8ii2VD/69o2unQSKMkacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=;
 b=C8+nYb76PkghMKbT5isQaWlVHp0Pf5Iu46lMEK+3Io4PkYJ8qiRHvtWQAgWY2wgpVVhADHiD18JD4fdJIq4/4RmrDB5BVhaCf9VtpatITn60q/VulO4FVPd96f5TfbdNawcdKywn4pf0RjrmNIJvIEHp3jJ13NDfZ4S8ALsrLx5CSiTv/9jbIGDrnLRt9baeHj2CMhSc3FIesE449/wlWpsWsExESVHNdH0q3ZMqDbTrj7FLZhIDO8bJDZKblcYpV3xn1MNcVVW2fvd/23y4CdZx3QZH5gYeIk93dyH0SBNBJED/n5E6qS3/T4ihR7YsLCriBe+mPYxzSzUPlMlTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9yLdng66C2dWI/Qpbc5zpeLK34YATUXbgQiZjcBLts=;
 b=MB4NBNz6h4vXvIHOyB6sgr5LbdTlsqYCOmKkau/Oyzf7lI4y3eG8eE6tnrJhhav2zlA2SpxF3T21pkbvkvGRRDSDsMHFdjMA0/V+0YtUdv0+HeDM6w23mnpixC6c9GqhDQqq6UUEVYbDANx+9IZyWsL7a80tDlaxoKH7LU4lt0T4Q6dNKyeogoblK60ld3XF772S00J/R+1+zhR8JV/cqjrwvFi6GcUMXlJmTe267/Euk6hl+0LigrG4IelYaGGj+GwH8htvXSvDkSCSIJEdjz4DTkS5O0Nz3T445Ugh+M+lKYAJC1J3ChnkrjyLVrvfTdQq2lR337HJltX4NH3QTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:19 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/8] media: synopsys: Use
 v4l2_subdev_get_frame_desc_passthrough()
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-3-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-3-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887401.4030874.9624759300723992658.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=1929;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=YNKDSK4dZ2UF31PnruAMBagUo/vrPLIEQaP1yxTHZzQ=;
 b=VWu65sLLThB12xCGqcOzcXJdG1MQ71b4gpEtxtIf9P0yoiYg2wjsbxsMmRM4wPcceX8x/pSdR
 rxA+KXIP8POBGD4jofls8n19j9Lhi2S1zc0kGf/Nah2/BqPNx7a66bY
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b553deb-65d7-4c01-8848-08ded03c6741
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: uwRHKPZyd6xQsOoGri0rGoWkZcogOhsj0hZqlz42rFy2DgElWcGh8ioijypznzfsEhrB7QMQKD5HyFphziWV0WOay5U1HIw+dAUz9+dwUKRCL6pi2lM/WEKJbDpym/TJ7UasdQjMwDd6nXKA/G8lj2Q1diPu0NZMAVnC3HTP8yLo/uXiiN7EazOSeGbn5rr/vMn4pzZaxJAQ2x5/7Dl7ANyFBMHNP/ZEyWeqWOKcpZJ7AYONYYIaDbqhi5e1FtRvvK0kymUYbs3Mr8QBILK5bN8QVo+Z3nKTDk4Ogi0pFgID+cnwbt6EaDmENN5ru8vF+o0mNKlzezAcIh4h5dHagNGuTg/tqaQjMkRTl49YRo2NTJTFqf1Y3E0B144k65/Iw9S+yJRGYXqaJD/9y5J0M9Tl3i+AuxJL+zuT0jGIA1Ij2Z3Qjk609DBXb0BCb+C31PaQLtjHE7C2YqlRh7hM3Ev8NaWtdsZJZLwoAPg37v/hysIIEnH9NG9BaSB2uJ5p9yJlEOMYlfJ9VKpD9LQ8GZ+NU0ejGV9CI9Qc8/Nn2c77QPpDT8KWbr9WmKlyjuATfJ+21HRVMOKyPFjXV7uxv3qXs+ncoE5Py5cPwpDcdojfr0djpaOx3z0Ac8WeLVYaD4a6S+iCMCvrslzmqfLcnRTp78z64jghqmvgP4oYPTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9oYUc4eFlZMitQeDhrRzFDS2RmSEFuZWY5SHlIV0lvcFpzVk55N1BXUE5N?=
 =?utf-8?B?V2VmUDQwZVZ5S3MrZHdOUTc3cjRucld5MGcrZUhScEUzOFo2dk9qNWJSZUtm?=
 =?utf-8?B?U05ab1BCUUo5NEhBNDRBRE1halRta2JkR3lDQzIzUzk3TS9lQWV6aW1kRzJ3?=
 =?utf-8?B?dDRRUkJXTnVCeHNCajBkeitMOFRGY2J1eVdPLy9yam9Cd0dhYXVoUXdRWmdY?=
 =?utf-8?B?elFyN0pPN3N1a25tdEJwS0FzOVRTazBGQTdla1Y2YmpxMnFXSnhmZElmalNs?=
 =?utf-8?B?ZitWbmd0U3dYY3VkQ0h2NnRIUHBUZWZIaGloRjM1NiswY2Y0Z1JnYkltWm8r?=
 =?utf-8?B?c0JabUIwNzFxLy9wclQza0hLbitUSnVkZnRZbnppTXF5eFljL0FadUJUNzJX?=
 =?utf-8?B?bEZqZlRHRXo3SkpISUNzUjV1VElXRlpuQXBaYm8rQ29wdGtGWmhORGNPN1FV?=
 =?utf-8?B?UURwUnExM0gwQjB1SGgzWFJYSW1tbWxSWlZxb0hPT0hSM0UyemdvcytUR28z?=
 =?utf-8?B?LzFDTnBEMkVuYksxZy8xeE4yMnJ6amxOLzV2blY5VkM3dEFKKzl3c3RrMXNq?=
 =?utf-8?B?bjBLbFJjM2xWVC9BZ0dMdXlZeXkyRTJybHFEaXp2NkdoSm1NL2dDR1dPVThl?=
 =?utf-8?B?Q0UxR2h6ZUkrV2k4elpBSnlLcXpvdVovb2IzZ09TdHBpdFdKcjFYQVEwVE90?=
 =?utf-8?B?NnZnb0wzV1Nad0NjaG5SMFBwZC9WM2JnOXVDV2doNjJVZHJZRmpOeWJMRG16?=
 =?utf-8?B?dGxacHBWNzJEcWJRNTF6bDFKRlB2RGJ6RjNGejJOOHdub0l5eDJpYXNjejlX?=
 =?utf-8?B?UVQyU1lLNXltZm1CSk1XT1dtZDZkWlJlYjFqTHhFdUE2YkNpU0dQTnJuM1hy?=
 =?utf-8?B?aVlHL244YnJLeTFyNlZpdHNrNk9VSjNPQzQxcHFsb2c4b1ZRd1ZsdVpQQXNP?=
 =?utf-8?B?SjNaQTF4a1crR0p5SzNBeFdEOEduNG9kZU1vTWZUb3V4YiszR2wzOWc3R09J?=
 =?utf-8?B?Zml0YXdGeTBQVk9nYUhCZmcxV3FJcXRRcEtNelBwNmdjNHBEdjVZLzFYTlpp?=
 =?utf-8?B?akFVUHBJWDY5ZjhJUUhYNGxpT29nTVg5NkJMR00wR1p6QWNQZjZwaW1GVWdn?=
 =?utf-8?B?azUwWUNmaktzZVZsdlZQV0JlUlA5YW1jSkxmUU5FYk9oSzlhcXFzZmlqdHoz?=
 =?utf-8?B?RTd5aWh2V0RHZXF5WG52THB6TGw4djF1YTh5V0NGUDM1eTQxMXN5QlFWSlI0?=
 =?utf-8?B?Q09Tc1N0Z0VORlBmbVVwQzB3a0NIYTIxaHZIdDROTEtxUHRUaWlKMVM5bzVj?=
 =?utf-8?B?VnNpS0wwajBpdHhPVFVwWnpTaHZTcE1CNWRtSkU1bXdiclJBSnFzazR2aTZ2?=
 =?utf-8?B?K1VtRWxSVkFrZ3RabG9HUnZNNlhkWDlFMnplYVlKbDZQT1Uwd0RZSko3SjEv?=
 =?utf-8?B?a2pNb05aanUxWDFEdmxFZ1dWaWwyLzk3VEdvNE1adWVZV2hTZEtGTEQrdUFw?=
 =?utf-8?B?MjNjZ2k2MXVUQTM1ZHUvZmhIUDhTYXF0aUZKL2swWDhycUk5RHhHN0o5dTJR?=
 =?utf-8?B?MWJ5WjVjb1ZhV1Q0RXB1c0s2cVRCQ09TK1FoeVRIVVE3MEFkbVJQWjhWNGhT?=
 =?utf-8?B?NkliMFA4L3c2Wi9ZSEN5VG5xQmNob20ydHlxQ2lkRnVxOVFqTkdLcUlDUUZN?=
 =?utf-8?B?Qko1ME51ZTFkRG5DZ1NNVGdvay9BS2IyenVlQzUrYm5NY2tSSWI1OGNhRHZp?=
 =?utf-8?B?cjBWVEFybDBtRnI3UEdKdWRHT0dpV255WXB2VC9KSHpkaVBJOU5PM2dsZmV3?=
 =?utf-8?B?NTc2Mng4WGxnNzdnT1BZM1R3R00vTlU3R1l4V2xBbWh1VzNEOU9KOWNudGps?=
 =?utf-8?B?aE1UenNQNm5tUXFWa3kvM2UwanlqcWtmSWhLV09KOXZOZ2Roa2pib3J5dWg0?=
 =?utf-8?B?Z09NQW9mVm5rZWx2d1VkUktSMzhSSGJlZjJvNk1nY0pTVzNmWXYxTzdSZjQx?=
 =?utf-8?B?OGJDeWNqQjdxVkFIWW9qUG1QTU5pcWI1S3lLZkU3a1FDTHFJc0dyM1pNbEo3?=
 =?utf-8?B?V0VZay9XclZ6ckdoQktyMDdLb3h3RC9oYVhwOVJsdUtHTVpNVFE0R3JwOWZU?=
 =?utf-8?B?bm1MclhyRE1xN0pXT3FacnRPU2M3SjJIUm55a0xUdzV6MGRrUG16eHpXeUp1?=
 =?utf-8?B?QXdmZzUraFlGZzRlNUlpbUIvWDQ0UitacEQ3UEU3RnErOGQ3blErVTFBRjlu?=
 =?utf-8?B?S0hKQlJJOTNCNC9sSjFhM0pmb0hVOG1YUDFnUjFLN1p4OVBtck03Y2o2aEtQ?=
 =?utf-8?B?c3E0QnhNalJCUFFEYmtNYktjQ1ZyWm9yK1RsdEYrY0dVbmx3S1JnQVMwaFdB?=
 =?utf-8?Q?GdJyIb+4vGvQxfU644CgNHaNMHQNVYRgYvV7J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b553deb-65d7-4c01-8848-08ded03c6741
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:19.1713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBdNDoGz6vNPhyPyknKIpBnmDZEX6mT+oxeB+zAVBKrKtEzgpchVwYQNoPg3PPcRqSVPK2W/B+v1bIAht5OmoHrolICbXXcpoJ7oJmCL0YuBv+iKg9l2DyArb7QqUNSq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095832_179013_859011E6 
X-CRM114-Status: GOOD (  13.86  )
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

> Replace the local frame descriptor callback implementation with
> v4l2_subdev_get_frame_desc_passthrough().
> 
> This helper provides the same functionality while avoiding duplicate
> code and simplifying the driver implementation.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 41e48365167e..f51367409ff4 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -static int
> -dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> -			      struct v4l2_mbus_frame_desc *fd)
> -{
> -	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> -	struct v4l2_subdev *remote_sd;
> -	struct media_pad *remote_pad;
> -
> -	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> -	if (IS_ERR(remote_pad)) {
> -		dev_err(csi2->dev, "can't get remote source pad\n");
> -		return PTR_ERR(remote_pad);
> -	}
> -
> -	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> -
> -	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> -				remote_pad->index, fd);
> -}
> -
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> -	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


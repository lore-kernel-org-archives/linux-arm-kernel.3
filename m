Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B7C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjPtn5s1HatrYX2+yIVteaK2ZXIhB4evXIKDKr2FP08=; b=f0F4CItS8NFA7DbZhFdDscCc5F
	DScX9dw9zIGzLRFXFKkTJ0SSNWLX4ESLPksIJFJMhhq4wXwKTrPQSVe1rP3m8+bUfVgk82YbqyAhu
	5aYO5uJeMpzk6bRDu61on57EgDGlZUuImLhDhV1YL9BJZZ2yX9erRRmtZdEFmlstJCyjbOMfNHqUX
	CNDBfXF3pDC34pEzoOzE1ODlg75uExjC4HAXSNiBcQlCjqjOF2wr/kthYxmRQqW1rJDQvud6wg+BE
	zdihm0NkSEtt1fBL/wk4KYi+DK1pJTe8y3Lpe84IWyYgQCN/tsrjzpZ5L8N0pfuD7KmhYQfCXOPYO
	H1+xtkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56XU-0000000HVO1-2QJy;
	Fri, 11 Sep 2026 19:03:56 +0000
Received: from mail-francesouthazon11011038.outbound.protection.outlook.com ([40.107.130.38] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56XS-0000000HVNF-0L3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/F3JUIL0obrMJsAc9UBswnff+mAHkT17QtmQBzbSuMWRyL0q2oZy6dCipUADtCKTUurQCl0GaBwmDtEEi5Y/W72zDYK8hH4cqvHdI8mDVCwgY3edCVWi55C7ZzwKVhT6bVGfyEAtGL6o6xH73wShhL63RSExnfipJt/F/cAapl6gqFu0ZTGekRj5WSwyEkdOBx/WT8x8H/8Vy7DKXA8HDxMDE3UH8M5ekIbY/pEGDauVnZJvKiE7PZA69jrVMiMBPa78OD3HALcrJX0SmUnLOqWTXJirjKqgDs0gAr1s2bgSf3UXEnsfFjz9B9o+09c6r6QqfAofKF51nx6fWLkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjPtn5s1HatrYX2+yIVteaK2ZXIhB4evXIKDKr2FP08=;
 b=JDYeRykj8pRVaK5x6+KmUWDLHblPu953r1H5tpkeeMgl7/LCB9j/NqUHacYkw5/CUdCq5k0lycMSEvAtwHQA2G0jnKhb9hfofsmkJjuaTNyVoZW14NgvD5/a6mTmozNmFMgBk40D1EqctpvwNMgMvrByL2Rzrn8PqHB2jC/AnuhH0C4TxNr+Fy485SgTz4xFD5CtDZOa6OqDSZ1cfop/MV7MFOmGbIYrGzcZMvdaVuXtdTRpul7jp7O2re3rZadJxfJW+SmCiot+OLojg1qECZ28pjgozcMSxzgiNN2e1yNXU+qjQoJQjt0oxDQ0MCjMcHXrv6CVhfIAMW0RxMf1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjPtn5s1HatrYX2+yIVteaK2ZXIhB4evXIKDKr2FP08=;
 b=H5JG3tLOrCTX5T4RaBRyrc2KwNXfS4PT/M/XWd4Bz3RJxcArVtSzwXAobyg7y0+5f/lFZ3XmIL1Z8g86aZFy2oN0VRddvcvTK7bj6ZydgyV2vsA23Zcr3soJWHa1abIgApmayj6uKp0sAD2/w37w5fKVaEToQsubWKcw5oWqjqkmEIxKUq3Ryzi/YENeJVRPJh0rmTxB7FNjEni2AotWw/EmPfxq4ACcEb6E3ex2KrqsQ33kOaPVYt+EPh+E4ukWwtTeDen8hCYTq02xmYdrNhrf7+YqPDTlDn8+YQwtR1YBQ001JFbsm/Ltiw+e5y6A8hc3e6BbtcKgdpFhdhCqXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8651.eurprd04.prod.outlook.com (2603:10a6:20b:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:03:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:03:49 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: imx7d-colibri-emmc: Add VGA overlay
Date: Fri, 11 Sep 2026 15:03:42 -0400
Message-ID: <178915341680.2925793.13552519851578100449.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901124921.78635-1-francesco@dolcini.it>
References: <20260901124921.78635-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:510:324::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ba3991-1814-43d3-5ef9-08df10376976
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|23010399003|3023799007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ONr8XGWtWxI55gRr6ULfgp4bDbzocDOCq64S9fBZo1RprhfF+uL/yFJcDNGYvQ8KHxSul2qgYWbZbLiY+8f5H3GYS1YNxeQL+P0GqeDh2XSxc/TNf+7TMFo35S/1a3hTc8aIpPteSV02PbZ489xCkVvVFmVPE0ofRdGUhKJ/QMSbycMveR+uJROEyeFJI959X1lBwIUh7rq1bbYy2X6XTn07kXyRpDY+G2PhnoRBoDGLaOfjKE7JuLG5XwK9LQn8kOhll2fwWlJ6tR0V7qF1Jqw34CTGAbvT+wX+zx6EyMSATiKwRUk0cNgYNIOEZIBtIkzkvxOUiNk/5PzvW35ySPGe1s8uYbNLRXVKBg9TP/eO+jLR7xxl4eow+FislvwlqOGfVUNnqU94JG2bDIHaf4316BEwDnYgx0hNO/x9MVIBC/DSW/Y2PEHP4UbUH0SmXiFOyWoyL1baTYVHscbOWq3hIG2IZAeS1TjXr8zTF6AqDnKoRXm+4jeSR+pvvgjHIFOW90NC6Gf8wanEMt3CqUj2vKGPUf9XiQg7XtBmGkaO/SHV5toiiA50j1vtqj8t0QoCQChXYQ3niBV6Jlv2T0hnnTY+dh2N1wTGnfQjKeYTytFNfk5dqD/PVcQMVrd1EYqmxiMmXzRTFrDBjaAlY2rWwJqk9eSoEP01EjAsnNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(23010399003)(3023799007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEliN2pFREJJSktWYkNQYjZWSk8wV05mZ3hGSWg0Z1M4VmVNYi82bmF6d2Fn?=
 =?utf-8?B?Zm5LVXlmZ3dZcXZUdGkyNlVBZW1sYXp4cE1MSkUwSzFPWld2MXdUci9HR2dW?=
 =?utf-8?B?RnRYTCtOa1FCd3Q1YzcrY3RMY3FrdFQ5VE9yR2N5MlBpRkg5YzNFMGxadFdw?=
 =?utf-8?B?UTg3Sm5qN3MwUUxRaExtdDFZUlM0MWhrNFdGd1JxMnlwSFJkRmJIRWZZcWtY?=
 =?utf-8?B?K29IOGl4dUc5M0VQcHVPWGRra3U4RHVjcW9DYzl6aU9pM0NrYjJFYlRxMjdx?=
 =?utf-8?B?cWR1eVI3ejNub0crWW5wNVVlQ3RKT2pZM2FvaXRTc1ZHMlcyc2RoMGVwR2c4?=
 =?utf-8?B?cGdEWmZpandQbzZjSzhkcEh4NktLQnZqRjFpMUZZWmM3R3RhSStManZZdXZV?=
 =?utf-8?B?NmpKOTBqb0JuWGVYWm9icUVNK3FYY2VCZTU1L21PZmdtMEhPeGVVSGVNWVdG?=
 =?utf-8?B?bHBMVW1pZFVXWm9nN1cyeDVwbEwxd3lZVytFelFOcGJvK05iclo5TE5yeXFa?=
 =?utf-8?B?UnlWeFpFVTV3ZVVLV3VyeHB3bVRNVXkyRnM0dnJHeEhxMWtzVGVjS256T1FL?=
 =?utf-8?B?R0ZZNE1NcU5vVEx2blBYKzA0M3MxNE4vUHVrVHppYWtXMDNTV21rcDAxRWxz?=
 =?utf-8?B?cU4zU09FZit6WGlVOWpRVldmSHpYMmk4Q0lpWmNhTDk2VSs2c2VqWjB6S0R5?=
 =?utf-8?B?ZTBsWkg2cmlBRlNrMmU1MlloM2JQMVg2WmpacEdqQnVWZXBUd09nL2hSWFk0?=
 =?utf-8?B?OFJmQnN6b1NPamtRUnkyMXJjYXdHNGhIMnRFOXFlZ2xYL1NzTTY2MjhReU5J?=
 =?utf-8?B?Q0JqNjIvN3RDSXEvNWZ0cndCdVFnMjE3a3JnZ1NId1d4NzJVeUQrSGlZNnhN?=
 =?utf-8?B?RWw0bmF0dzN2YklMMkEyalROaFJFdHFSVXp6bEdFTU9CMFJDOVdzVzYrTGo3?=
 =?utf-8?B?R2pyUnNFVzFVdE1zR0tLc1N1MTh6UlFMUkwwaEw5ZXE1dnMrcHpGUHY3Y2Za?=
 =?utf-8?B?WkdURWEzaml2bzRvQ1JJa3F1TG1BeFpjVVY3dnRPbmFCcnV4ZVYzR2hwZ2tW?=
 =?utf-8?B?T2puNVpqSFJiRkxuVldWMm9Ham5YclJHVnZ4ZkF3N3hISXc0NDlDR0wzQk91?=
 =?utf-8?B?QlNFeXVsUGFLOG5UZUo0cEdYRDIzdkoyV2hmWmhxVTh0WEMyUjF2NWUrMXNi?=
 =?utf-8?B?bUFPNTZqMElIL2grY1pFbHhnS1ZwTi9Mek5jS3lYckNmVms2Um1ZNHJVRk5r?=
 =?utf-8?B?ZXlXK210emVvZjdXM2RpUnF6UllEWTl4bTZKLytLb3R4eFJKb3dIZm0wKzE5?=
 =?utf-8?B?azBXZW8vUDVwOVhJOEY1WGVkUlllc1dBMS80QmVPczZ0TUdZN2Fqbko0MDln?=
 =?utf-8?B?WnBkbGUvWHJYSDlhRTJ4V0JacnhJQlNIekFvMjR4UVdyYldocUEwTEs1d2VY?=
 =?utf-8?B?NW1XK1REWmZESHZ2RXhZbnJxNmQ4OHE5SWtvUTYzeGtPMFdvMm9pbVhKVUZE?=
 =?utf-8?B?eXVibjhmZTN1RCs2WkdVWmoxMk54VnQrSGFHMzJFOFpTN0tsbG1OSUlVVHFh?=
 =?utf-8?B?UnNPeUlXV3ZvV1Q0UXQzYlBia2EwV0lPVjI1KzhNemVJUC81dTR4SFRQdWJ1?=
 =?utf-8?B?VzVtb0hlYnh6VzlzSnJwQUs4bXVuby9lbm5aVXVNMjNscjNHeTRyaEZrRVI4?=
 =?utf-8?B?WXRtanR3cnk3OW1BVlVlVytMRDhxM3lFMG5YM2RiSDd4T2hYSG0wYnRBbXpN?=
 =?utf-8?B?eEpUZmhxaEl3YUtORUxVdXR4bk9nODVYK0Zxa3hHOFdXNFNGcUwxVi9ENUtw?=
 =?utf-8?B?TVNKV0pUREpiRVRWM1o1MUh2OWlwQzdvZ2tJOUVrN09pb21PSUJLbWt4cGVV?=
 =?utf-8?B?UVJNck5ZQm4vUkpwU1RLVFE2K1ZjazI0ZEt0d0tWNU5UaHVXZWtyR2JtM1lX?=
 =?utf-8?B?TFNiWFcrWEJBSXB6Sk9HVDR2eU5Dam5PM3o1K0Radkh3S05ONEpEN2cvQ2Ru?=
 =?utf-8?B?b3pCZEx3ckFma2RpSy9MdDNRYy9LeTB6U00wNEZDajhMZjVyVXpaaE1PTno0?=
 =?utf-8?B?SWtYczhxanBDaUR4S3ZJd1BvMy9oUklEVkNKV1NoNk9EdHJXUy9RRnZ6WDNz?=
 =?utf-8?B?MXhPTGZLdG81eldKUUZmMkhRa1NUakNYbk1KNEZ3WEc0VjN6VEpLUDlOalhE?=
 =?utf-8?B?eVBLNSs3YWtDWUdNVnVjbk0rK1BPQXU0TGZUUy8xWDhZQVNsL01ZYnI0SWFm?=
 =?utf-8?B?aUNmY3BHazVBczdhcFI0S1QxRm5lTENDanVsYVo4dE1jOEFBaVJWNml5Slo0?=
 =?utf-8?B?c3lEWXdCYzNZaWc3V1B2VjJrcy9rclZNSmVZNnpLSmhFOHFuZzFPTzl1cmJi?=
 =?utf-8?Q?lzfi8IVZGgo743thsNp5IQlbx/45sCAlOmexm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ba3991-1814-43d3-5ef9-08df10376976
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:03:49.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ks/rSdakc8bURxbVHSubFsX5Y9xmePArcpx/NJPSWLy1ooZwuLnQb7cbwPcDHpuS+c3+fhy1Nfii7vYUj7nByNPzg1dgBBgECZ9hatuaPR6oBHrRDdnD/l2loLuXufO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_120354_121520_9119D7BB 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 01 Sep 2026 14:49:20 +0200, Francesco Dolcini wrote:
> Add a device tree overlay for the VGA output on the Colibri iMX7 parallel
> RGB LCD interface. The VGA output is driven through a non-programmable
> video DAC without VESA DDC I2C signals to a DVI connector.
> 
> The overlay is also combined with the Aster, Evaluation Board v3, Iris
> and Iris v2 carrier board device trees to provide ready-to-use DTBs.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx7d-colibri-emmc: Add VGA overlay
      commit: cc6c96f0bdd7212cb5055c9a38792e35562f2648

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6266C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hqz2oOiv8YVt8iqI78dc6O4YH9ycjmqaDg8UGsWgSZ8=; b=WeC3kVaagxVjFuMHEsrpx1u5J9
	XqvXTHDieLOLNgRIL40KeZ7TkVQtK1mbVkCLhD6grECjazxpvKMcy2n5MWnEXU2ohr6vP7OWyKjTr
	na2ZegxD3RQHob271bzQFuPSM2xDnu5J1W45ozD+cl3rr6LfRA03A6rTroBPkCmzKwl3BI2GmVs48
	Zn6G7UMAKKyxSOMmhJ3frwvYQusleKZlaMVd/GMCf3cTQoOQ5u1NEb/zVr2RnPTND4Yi6IyTlYc42
	1gbwkY6/k002jEB76GtwKzkJGcI1IRSw8yHmr3PZIpv4SBeNffgd7k0PPhJBA/3rZx9zFUVR+B3I7
	nF5VdeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyfi-0000000BTDz-1cpx;
	Fri, 31 Jan 2025 21:35:30 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyeN-0000000BSmQ-37fP;
	Fri, 31 Jan 2025 21:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9TnrBIAuqmhLmq+maZXFo9DU4UcQMj3OIvYZnS/o92wkEo8kHzNGEdRxDMF+aR13gbDJ0LjycNO/5jWgXrVSqXZ28GLwQ/1SAzcc1rSybocJCXPnJZc843al0JTvKLzm9FgFIfJg0J2gNmqS34MZVO2q0IJ0cZhfHkFR0FgMrR63lj07LpS/ko8VYWdZ9C+WXZQQ62cBTAsayQprZ/j4rGnnks9P7+j0XhCNCLkSCy47hcwSGIdTmwulM8vx5LJyL9yKtp6Y+OUMgdCu7+9X9SnxtW7PLvTKOJQfNJTudzaZkH6fAN/U8eRsYlV/0D+FvHlOUgQjtZ2Tpfnd7t/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqz2oOiv8YVt8iqI78dc6O4YH9ycjmqaDg8UGsWgSZ8=;
 b=hRLgdN/JFsEwpBZdChxNXN0+5Kw31bqZySBasHhgGouOvTlkkVWz0dQ/sWbsUpKsgNte7EA7Gs6Zf13AxtaoAktafhgO3QbzEokIA/Ae5t6tQP3IoMIjx2GDjjW2nyIDWoAAvk05kmfOBTrhk4LxIo71zCroBNKhQiXYtUzCILViwP2Udi2eTflFAOpsl75wQbBSzziZCIcyhn3HqkSDGrbIVWxvMgVFOqfak+9zRIOBIugTDUsWyR7NuEjLGVhPmPa4H9lBkm8kseUWDvZDk4RMW3Uy4x0OjReBMYuNI22TffqvRQ3o8/ccRvtLR4peCG2a7mvKr42GiE7zZr/Oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqz2oOiv8YVt8iqI78dc6O4YH9ycjmqaDg8UGsWgSZ8=;
 b=ekyL57wX6rGcRonz89cSoo+fjc1aMfy05DZ3qTnhlvhuG4qiOLG23XGb9YqNTeTt9Rt6NFLyR/nv+Vijsa2cTx1nIvUn8TS5NjivTHIRsNO2mypMHJbH/fQWtfYVDeJJmJypLRvwJu0H6U9aHjcnLZFGzLBJvIR2r5I44D5xaUHPVZkrfYlBt8WT6HejVsa67VVGZgYIdyvHOZu7Ig19nd6fg43lMY5V6cREOzRZBt6KxzEZNJRNVcCsUYwLJRBAn/9wAWUecfkhyDkQbJQIK/ZrIQAskCT1DkNKKEmJdJsupuo1TMFZuQUs1fK/xN9k86zxKlx4kdARAGz4FBDYWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:00 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 00/14] media: imx8: add camera support
Date: Fri, 31 Jan 2025 16:33:45 -0500
Message-Id: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlBnWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MTXYvCioL45MTc1KJE3WTDxDRTcxPLFGMDEyWgjoKi1LTMCrBp0bG
 1tQAQ/meLXQAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=3961;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gUsJHUzQaOf7JyHy2V12Q9qIVQTVDcpz/oRVcZfdWMg=;
 b=zdbNvBo/BOUjR7U4UOhiq8wypCVsa4+0rTlx4z+Jumrwvpasa6h/+k4FCfO4PxH2sm7BrugXJ
 ht40NNYG/8yAn/VOTRfFPzteg7mYlIsdYZ/D3BWtuDbq9x3vEYCXc+f
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bd56af-39e0-4eb2-35a6-08dd423ef9fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlNuc0VQa3p1S0QyWGRWUVNSYW9aTGpLdHRPcFpnd2R2OUtlOVNVeGIxeVVP?=
 =?utf-8?B?UHZXSTc3bGhGT1gyR0k0dmRXYlpCNWtvYks2SzhFWmM4L3VqcU9yRWdyL3BY?=
 =?utf-8?B?YnJMYkcyL0ZSUmZMRDYwaHFwd2swRzBZNThuR09ROXdObFkxV3BINjdycGhm?=
 =?utf-8?B?bDhkeVk3anVhYnZySnVvUEFFY014WFBXeGx4bnBOVk1HcUdRQWxEbDlxeDdV?=
 =?utf-8?B?TElJTnRRbzMrank5eHBacDU2YVpvNjlOTFYrb2lWQUwvVHcrTGY0YjMzd2xl?=
 =?utf-8?B?WlZ5dzlUM3JYSDB3ZzhNUkhYQStVTFFpd0pQeGVaUlFURTh3c2R2TEhkUDd1?=
 =?utf-8?B?N0JqR1FIaGVhcURRMU5IL1RHbWRPdXZKREd1bTNpUW9iY1FPK0tKOFJiaVlz?=
 =?utf-8?B?Nm9nWjg4ZUplb25UcXFVdTdTYzVaUVlLbzNJRUtSeDcvdXJEUHQzZU9UOWhT?=
 =?utf-8?B?UUpCRjRBRE5LYVMyN3dON1B5WkJZYU1FZXZFOVo5UnQ5TDhHR1l5OElzZlEw?=
 =?utf-8?B?LzkrTFJCS0J2bm1ZM0YyNTVTNTlyY0VqWXYyWFhkWklSYWgzcWIzNWxITmJE?=
 =?utf-8?B?SWVISWwwZlhsUmNETHdzKzN6NlFGSXNMQ0RwdkN0OHB0ejI2SFlUbFZFN2sw?=
 =?utf-8?B?Uk9tY0NpVzN5NjIvSWl0ZEVSU3RlMDNGUVBmM0JIZ3NBNy80MXVoelhPQ2Jz?=
 =?utf-8?B?bjltTjFvcVBVeWY1MnRKRW1mQ0NLdlRxNkxGTjYzMm5rNVB3VVJPdEpydkh6?=
 =?utf-8?B?ZWdkRFBpNG8xWi9nQ05XVUI1dVkrL012VHczSkNpcTRSQTd2KzIwODFEdE51?=
 =?utf-8?B?R2RkcUlySUR4OTZMc3BLZmhMUzBETUZsaEZPTncyQm9KSmtFekpRU1ZPUUY3?=
 =?utf-8?B?RmxwSHVwK20zdCsyT3Z6TTF2bXo4YUt4L0hOb2lUcUhyZk5WT3gxWmlMSFJu?=
 =?utf-8?B?YndEd3pleXlOeURYbjZ6d3YyWVBzQ3JPR0dkb25XaEcxcGRKUXdOMmt2VXpG?=
 =?utf-8?B?a0p6b3dVT01iQ2IwbTJpdjFzYUZCZEF1eUVxeEdJeU5td3FieStRdUdseW1L?=
 =?utf-8?B?YWJ4MVVLYlUrVVBZL3crRGg1QjJPb2pxSE9LYkN0U3VtdU9ZQk45Mmp3eUVw?=
 =?utf-8?B?aGRGeURmc1c0Y091QU9IcTFuVTRmcVgrRnIzT3d3QjRKZUx3eVFNRGZqM3Jn?=
 =?utf-8?B?S3ZTWTRDd0Y0Z2xaVFllQmJzTW9aUEdPN1UvcXJXRDJtZUU2ZlJqR1JqZ2RQ?=
 =?utf-8?B?ME9pT0lScjZJU0h1ejN3R3lhbVdHZVU5Um5jT1FYL005MmZoRTBsSXR1Z2Qv?=
 =?utf-8?B?QUhKdDZOMjJkUU9CYTlQOU93L1dxblFmRnM2VWZSU0hiZmE5eTg3S0EvVEJQ?=
 =?utf-8?B?aWp1ck5Bc0JzK1YzUEYwZHFvbTNJdEJ4b3NnSXNreUUvZ0FESnZWSFVpVFpO?=
 =?utf-8?B?eXBTdmY4MUV4OENhcWNVZTl6c0dlMk5xdC9Nd2ZPVGxmV0dUZUJQeTJqYnZG?=
 =?utf-8?B?SXVYR08yZGZrRjlkSDZuSExyTDFKTFBCUnpsVlZpdDQrZmMvUXVJZkhjdkpK?=
 =?utf-8?B?SjVTaEErUVhvTXZSVG91Q3NNS05EenJMcWhSek91Z3FJbkJsSGJQQTZTcnNk?=
 =?utf-8?B?aWZDNVRNN0txQ1ByRGJXUTUxeTBBSzA4RTVDbStLaHREMTcvU0pYTDMveUtC?=
 =?utf-8?B?VXhrQ2g5RUdhaTc4bCtPa0FWVS9qU3dYb1JscDNxNHRrL1MybzUrMVdjRUVh?=
 =?utf-8?B?Q2puSk1VNERlSENwazJ0ckdKcTNvUmhCK1l6c3hwNE5WNy9LUm1RVm5BUmlm?=
 =?utf-8?B?QzVuSy9yZnpHbVJVMjVmZkQxekFiRlIzSERwSXE4aXBhWnJLSmJLS1V0THNL?=
 =?utf-8?B?VlgzakkwSE5jb3EzSldxYUs0YmxZMEUrcm9FZnR5UVk2WmpJTzhNQUxOdzBM?=
 =?utf-8?B?eDdXNUZQOWtUTzJMLzZlRHNTaTFHYVB1VHYzTEkyMUpmWVFUdzJOYk1temRv?=
 =?utf-8?B?Z1R2dFRNU2pBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1lTZjU2bkR3RXd4aTNkdWZ4T2QyRnl3WHVUNmZGY2xJdWJQSEZVcS9ldktz?=
 =?utf-8?B?Q3huK21CWXhzUFVlclczeWVKS0NrZ2ZySjV5TmRPY2xSNmgzTm5nM2dVcWdB?=
 =?utf-8?B?SFFZUEQvTE0yaFJHUnRQaUJPSlRvVFozT0VtQ0xmVXp5RExFYk4wb0g0RUN6?=
 =?utf-8?B?RDhmc05yWFZQNkJUamRvSHZKV1c3T3gxaVU5R2o2VFZCNmpkS3JDMkJUMGkw?=
 =?utf-8?B?ZEtpcE4wNm9qa1BPLy85RVVOUXpaSXhUYkFXVXFpUnI0WDd2b2xsb2IrNUNY?=
 =?utf-8?B?c0NwYStZaEw5MHBMSGpJc1hJRGVuOGpFamlvREZGdm1PKysrNVBPZFQ0ckk0?=
 =?utf-8?B?eElySnpDVGlLbzQ2TDRRUUpGSzlVQkhaSlAvNkkwS3krUjA0Q2F0RGdFbWc5?=
 =?utf-8?B?c1pVR09ZNVQ1RFp4ZkFwQjNSYlVOV09EUHdwNlVubFg3QWozQTliRHhDTnVT?=
 =?utf-8?B?WmNmRkRXaE15dWYwRDB4KzA2REZNdHZDaG1CSGZKVzhaZWNBWmE4RFp4bVV6?=
 =?utf-8?B?Q0lrV1NOd2ZIY3M1RG8rMkpWREFFQnlsTjhweUk3TzBTSlc4NHNEYjd0aWVm?=
 =?utf-8?B?MVVMYVVSdEhGaDR0aURFY3BiODZkc3RsVlVDRmxQbENqZDh1dFh2d016VkFx?=
 =?utf-8?B?N295NFEwNjVuM09EdUN3azZtY0p4eDlwRjd1eDNUL0pVeW43S1dQU1JLZ3Nw?=
 =?utf-8?B?S3hOdVJRWU1KMFJ3QnhBUzc3ajE0Y1ZuVGFWNzFuRFk3VENRYlBLUCt4dUo0?=
 =?utf-8?B?Y1pLb0ZqWUYzSFU2a3ZDOG9pSmpnODBrOVFtMTVIOHNBV05QNDJCVTQ3NnE3?=
 =?utf-8?B?eWdVOWdqL05iSVFkRVFGdVI0NXdoMklsZ3F2RUFjcWtLY09TNk02SWUrMk9s?=
 =?utf-8?B?Y0RjdXVJQmJBcG5TbUFLQU9aeXZDY1FmRFprbGNLREhHYjlRMitKVXF2MlZT?=
 =?utf-8?B?MEdITUgzQklzSGR0QW00bHdYaXBiYnlKS0huWVozRTQ3NW9aR2pUTTZRSGgv?=
 =?utf-8?B?MS9CRnEweE9wWk1kU1BmRzNydWZIdWZ5YTNkcktRcVJVbld5NjRvZGRCd3F3?=
 =?utf-8?B?NlYrM3d0TFo0d2lDZnl4UXAxaExZZU53K2drZUFqVnBGbHo1c21iZThhakd2?=
 =?utf-8?B?ZTBNVi9WRGdMcTVRREF3enJpbnozUGZhTmI1dFhxWW9lbXhmTFpEVWU4WGxk?=
 =?utf-8?B?YllSNUFUWXQyS0theStRMmJhalZOR1hUNXFoaHZiMFJyWk82clNFZ2RHVXRT?=
 =?utf-8?B?bUQrODZDejBXQnVucnUzZWE3ZDFUNktsTzBkR1JSZUpUV05NVnlGbXBFbUV0?=
 =?utf-8?B?WTBSWFpSeG1ObzlLTHdEcGtVSEJRaDNPL01La3owUmxQdTNXWVVuVktPYUFR?=
 =?utf-8?B?NXNHcmZoUCtsVHVHZjFSMnFyU2E4R1FJd09pUFEvbkxYcTNtUmdSQkRjV1g2?=
 =?utf-8?B?cnF1eEtYZzRGUDJ4L1RuSWZmNm1sdkZQZWhzUEppc1RWNXJxcDE4VHozbmQy?=
 =?utf-8?B?bE1tZTA3eXVwYkdUakc2VXF2SHRxOEQzVGgzQkg0ejhKRE91SVMzdEw5TUQv?=
 =?utf-8?B?TkhlQk9NdGs3RXFEcmwvODhpclk2SzhWc1NLS01BQUpaSjVPL0tmQXh3QWVa?=
 =?utf-8?B?K1pNeFAzeWNzVDlEUVVUY1NYRSt1WUc2VktEdC9nSVRKTlA0WEN3ZkFieVZG?=
 =?utf-8?B?Tzl5eFhSYVNxVzMxbFNwWERmU2Mzb3J5NkdpcjZkcTdxaFB2ck5XUTVleHQx?=
 =?utf-8?B?NUN1U3BOd1FnVEhPQXJhZC9MMXE2RFZvL0ZvMktpY3VHSEtaSG5OalRRSjRa?=
 =?utf-8?B?RlU4V3lHa2NOd0ZLVFk5Q2FVNThuZWpYdzBzczkwWjVFemc5UG5xa0U1Qitj?=
 =?utf-8?B?a0lmd0I5MnVwRUk1SjZTTHVHcTZFT2djVzdKZmIxek5UWTVERmJIQW1RZWpV?=
 =?utf-8?B?eldhTThESE45cXNLZGpxckhXMXZtSzNaTDZZN3F4cHg0Ry96N0J6QWdtRDgr?=
 =?utf-8?B?WWdMaENXZDNTQVI3Y3N1elFlQmNQRktuU29sQXJmMEhjdUVkSllQZzNiU0s1?=
 =?utf-8?B?bG8zWVVia2swRVN0NU14YjhBQTU1U0N3eVluQzgxUmJRWmliTTg1ZEhCU2Nz?=
 =?utf-8?Q?cDVA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bd56af-39e0-4eb2-35a6-08dd423ef9fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:00.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gl+5xQAUscXZKuCbgW7md0wPA4y1QnCmZ77miecwXdSfVQHyEQNCsjBF3IujD1SaPFg0E6GBRxOIcrmWGFSZyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_133407_972345_EC118258 
X-CRM114-Status: GOOD (  12.21  )
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

Add SCU reset driver for i.MX8QM/i.MX8QXP.
Add phy driver for mipi csi phy.
Update binding doc.
Update driver for imx8qxp and imx8qm.
Add dts files for it.

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Martin Kepplinger <martink@posteo.de>
To: Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Guoniu.zhou <guoniu.zhou@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Robert Chiras <robert.chiras@nxp.com>

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (10):
      dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
      phy: freescale: Add MIPI CSI PHY driver for i.MX8Q
      dt-bindings: reset: Add reset controller for i.MX8QM and i.MX8QXP
      reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: imx8mq-mipi-csi2: Add support for i.MX8QM
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8qm: add 24MHz clock-xtal24m
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Robert Chiras (3):
      media: dt-bindings: nxp,imx8-isi: Add i.MX8Q ISI compatible strings
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM compatible strings

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  87 ++++-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  30 +-
 .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        |  53 +++
 .../devicetree/bindings/reset/fsl,imx-scu.yaml     |  35 ++
 arch/arm64/boot/dts/freescale/Makefile             |  12 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 396 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  93 +++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  93 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  37 ++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   7 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  92 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  60 ++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  47 +++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   2 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 106 +++++-
 drivers/phy/freescale/Kconfig                      |   9 +
 drivers/phy/freescale/Makefile                     |   1 +
 drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c    | 254 +++++++++++++
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-imx-scu.c                      | 101 ++++++
 24 files changed, 1603 insertions(+), 32 deletions(-)
---
base-commit: 76d45eb8b88447ee4ed38aba6b2141cca2811005
change-id: 20250114-8qxp_camera-c1af5749d304

Best regards,
---
Frank Li <Frank.Li@nxp.com>



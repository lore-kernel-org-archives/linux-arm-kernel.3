Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAECC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=; b=g96UPKX5R19Qgn4ljueAgkaypE
	6+hkEKIW8Vct8Q3Nr4JF3jcWXqg8lD47m9v0URYgMFqY2w3ZUiUqZW6s+bmPjiVCOiPeQlRk0cpyU
	yvTSkRcEezTkAYQoO1JTA2Q7WyvVYMIReLSQ0PrVykO4lsd1vOPN5cPIw+IMklPq6BpkFApg2VVsC
	SiCskyyPczRLAleI/Qdew/TPbWrm3GltPkbtLKfZooL3bpeMYnPcBsWjOAyC/fqBoRSS4A+MDBzmb
	PNRhVTHAqS+le9uo466QGvxvNKvKFM3wEr7yYVJbz7r42ECyVNtWTaD9DObaT5H9lOFBJp0rDOj1I
	DBUtnFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmho-0000000ET3g-2Nsi;
	Fri, 16 Jan 2026 16:29:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgmhk-0000000ET1H-3aKd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 16:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I84wGvGFIP5nUpE4fqzO4ltUbXtt/V+iTmGegnc3jDAMffJFFgVA3W6++clY3KbGZ5vxnUw5FnP7XkHxY6lERcWXmt2va3oRTnyfH6/nQUc4NOYUMe1VCrSdXGd6aTxuwq5hY2Ry4lw7CbOIRNOKQL+9Kfnaagh4FMw7zRr0WSrP7qwQD1xXxpefOZrCaLGG0EV/59gqeFgwEVsUQZrmgImd4NSoSRz0x6lHdhEOdznBFk8dbO+32CPLPZGcOuuB1QQyV09NwWJtHZH4r0zfJcFaLZ+QC03oca5WgogNsRdIRpYvM6Wb/5kGogl40hSTdhXWb5i4r9dfGGHKnNlygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=Fd4IWpXz0TCGsJ4fODZ1l816tABAXpkED+0GP8apptNWWNui3U3ueNCbXtzENqZVGObzgvLl9V4P6usbiBLb5eacOm/DAiyNHW9AeBISCDLJWe9jrDobb0tDL4cwxOhCPv6+RYFEXe8wueO487kkPvfR4YzMU7GyHqwHIhTFjOQCKgJBuBq2DxeOxCr5+lFOs557NHnxCSpXd9ZqJEeML4k34et5kVFP4qTqkb+5IbAIWh8sv/sz7Ll1hh74PmDpxI6LZaauu1yJ9gif16M8oF3Ou3iNYARbUR41AuzUDNiKQHlJ7/XyuNz/0/0/qOib3baTNyc2W22We15rX/Tstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=kKnU2FmO1kH73WLY+Ia+n6qqBh1GIYnpgXoWLCcyEmKvW0moyWY+LqgaZnpdUxU16yTaIshknVD5EIrWBUpeym5sJXNM3v1d0wUcCUyqTVvnGTQyOyhRujRcca66pLO308zhio/8Ggz+lzm5IrgV+DlOLWdhy5Cs2LFq+W4Pl/mS7jACMqdHTrMGInf5hZbOF+WkaT/toszohawQggg0CxNF/M+ZPDKZm0Jm596aJ/+bL4/YT6P7Gr2yWfvfKas9YprJQhjbD/Ls+m9Liw9qKe2dxBRU6X/OMz1nyedyXmZBb9Xy/kK/EzuXZRrz/9k/0LfMXLBxaXQ+W6q2E8RSVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:29:41 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:29:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:29:20 -0500
Subject: [PATCH v4 2/4] media: nxp: imx8-isi: use devm_pm_runtime_enable()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-cam_cleanup-v4-2-29ce01640443@nxp.com>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
In-Reply-To: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580970; l=1806;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yPwnUBOev/x/308wqg/c0rNtCFlwwv3fG4kMS/h4VvQ=;
 b=UNNFadMrBcvcpxNreQ04VzRKLPC/DQAdvhLXtiuqouKn9hd3AH6bmIZlxjuzfOE5XWR12MDkX
 gmf+0pYz9abBSd8IULGGUkbVZj0F6faGzIWIvzrYUsvZf3K+Z79WqGW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: 156cec2c-07a1-41c0-f344-08de551c7331
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3NFZXZXR2xBeUtqRjZqK0QwbkZSYUxESUR0cGUvTDRFc1M0Q0RUS3VPMHli?=
 =?utf-8?B?clc0d3RWTDhmeTd3M015ZTYxc2ROZE01L21UdklLRHd6a2EyMmZILzRaN0Ri?=
 =?utf-8?B?cFJueXVzTVIvQXordkl5bVlnZHZUMDEzMFA4aDBjVjdqVnkxY1hTbXJJSSs4?=
 =?utf-8?B?OGxES0d5NGZjK0t4bit2dDE5NWg5UlhFS0JSNFJYU2RUQ0FGMWg4b1VZbmR3?=
 =?utf-8?B?dCt0SW9sUzEvdEJ6bGNLYk90eVlQUFhzREhFV01FMmNWK3hMUUd0VFpUMXJ2?=
 =?utf-8?B?TnVXNmthWTJxZWhQNzdlMGI3d3YyTStFSk12ZkFSRlJSUGxjVElqRVdVM1Fr?=
 =?utf-8?B?M3UrTmZueUZGMXVQbVpXWWExK09pWGY0ZStCQVJONXpBMzRCTW53bXlLclht?=
 =?utf-8?B?TGhJbDRyYXNNOHRHTk5OWDFCeW0wTmtsS0kzYk11ODdiT2crU1VRNFV0UGFN?=
 =?utf-8?B?aVJVbmx5eURiOXc5RHhPNTNIaEV6eFc5UmVRRUVFV3VTQ2NPUkYxV2kyRytj?=
 =?utf-8?B?bkVnbUtqc0daM3hnVXF0a1d6WGJDaTJmTVltR1VLSFZaekZVbXhJVmVDUlo0?=
 =?utf-8?B?YmhsTWJlVk0xa3Y1MEp1NHQwd1lJL2xES2pDc1J6M2d5OXNJd00yMUtzZW4w?=
 =?utf-8?B?MTB0b1FBR0VrV2lSQTJyMEJNanBiNU9MT2JQSGorSDV0R3h0eDYzOEpYa1Mx?=
 =?utf-8?B?dzA4VUZwNkNNMWltU1FZdWNlR1M3L2t4akx6QitGR2w5UytCVkRIeGxmYndE?=
 =?utf-8?B?T2dTUTdOa2F4Qy9wc2c1RnBCR09OcTNWSjBheXBKenJqNGNpUUtPclJHUlVs?=
 =?utf-8?B?a2I0NElrV2lrSkN4TGs0ZUw0aVJJTUcwY1VDTG1kOVd5RnRiUjhGVHZPZkt3?=
 =?utf-8?B?d21pbnhhMmdXTXdHRE9RL2xMK1N4Z2NTZmhsVnZid3FkOXRDZzNacnFzNmRh?=
 =?utf-8?B?Z2wyTnRUcTdVMTEyQ2svdTV4VGdPdUtHOFdMSnVQb0YxaE5KQnNNR2ZZRHZS?=
 =?utf-8?B?enhoblJEWThESXowcW1XcDFpOEtOclNDV0NhODh0bVdJL0d3Z3VlUUJBalBo?=
 =?utf-8?B?SHZTU2RSME5rdWphOUJJUk1DZjlwb2VYb1dOT0VSODlDK0JiNGRiRmNJcTA5?=
 =?utf-8?B?Q0dTMGtUbEw0SkhTVDYvWjI1bTFqdktpOXNwYmF3NDNSdVk2ajBiZmZmWGxP?=
 =?utf-8?B?SzJuTUNiTXdlWVkxeE0xQzcyOGl5OHRkRHBaOEFpREVCVXM2TWJobnBTMit0?=
 =?utf-8?B?dGF6d0hmdTZJc1J2MWxJbWUxUEE1alVqZlVDdS8vN1lXNStVbkI0amlXaUJv?=
 =?utf-8?B?dDZDVmkvQk9VMkk3bE9rcGpoZFlPVEpsd0dSNmFKU2RoYjBRTzNWUkdpV01K?=
 =?utf-8?B?eGhWMDVoaEY2R0xaMFpVazhwUkYyQWFXYWRrek9EeEtCMThyUjFicEZmV1ZL?=
 =?utf-8?B?WmErOFB1ZDZ1WmI2cXVveWg4ZHBJbFAxbWhGQ1NOaDY0QVNNcmNDTmwvTkc0?=
 =?utf-8?B?eFpJOHo0Z0VRV1Q5RlYwWlRHNEJRMXNTVHR6OE1na0xZeWp1dWFqM3QwUVlP?=
 =?utf-8?B?cnlvVllIUjBHa0o5dVZoUzNZcEg0b1JtRzAyRWQ3UTJzUU9teGc5VCs3Y0ph?=
 =?utf-8?B?Y25lSG1xVmtsQlJTb0UyejIrZnkxcldpL3dUZm9POXdrcUVkaXdFNHY4OGpn?=
 =?utf-8?B?NTRWOXdsWXBTYWZWQUpzNmVjZ3Q3ZzNnQ21xR1BsOWRuYVNCeXpuTGxpbVBs?=
 =?utf-8?B?SjZiU0x5cDJmMGN3ZlBOMEN1U0Z3UnQzOEdXcUVrUGl4MXhJUnhJWnNYcUZJ?=
 =?utf-8?B?R010Uy9ibWVJSTYweTBxWW1FKzdtcTY5Tm05c3UzdUp2TUJDSXhBb0hRRDFL?=
 =?utf-8?B?NlBSUFRJdUVFZ0haa05kaFNwUWI0cGE3Z3lsVHdHN1dudWlGZEpSNGhZV1o2?=
 =?utf-8?B?bzl4VWkvanZYb21FMmFuWU1IOXpRTU5GcVBHYjlib1VwN294eVkybVBZNm53?=
 =?utf-8?B?ZGMyUys5ZTVwY3p4YjJqSWNaQm81YStPWmhHeVVZZ0NkTlhWdzJYdTBadnQy?=
 =?utf-8?B?TVN2UEc4L3o3S0FJVkdpVWNrSnZQYlcxckFKVHRBdUVOYjJNUGV2c1RXS1dU?=
 =?utf-8?B?SUtvUUlENlJIUnZ5SG92WFYzUW9IUmpBNkRyVjlyUmRJdTVaQ3YvSldVUXVO?=
 =?utf-8?Q?qitF/aUV3FTstz+cQ7KIGWXoFIMRlQt3v45A5IUcog22?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRJUVFzRjU0NlMvS2MxUlMvZktVaUF1bFB4Zm1PZERqWXk5b0tuVkdzU21M?=
 =?utf-8?B?S0Q1Y0NGT0tDOVkvL090dHkvZlFVRWdUV3kzb1pKQTFQNElCc2FCZEl2a0lN?=
 =?utf-8?B?aXlENTlIdWpoeCtSaU0rcVA5R0srSS9FUzJBWitnUjhtc0J4OEE3Vkd5bEh6?=
 =?utf-8?B?b1J5RTk5eUNYZXV2K3N4bXdEQ3haREhlYkdIOWpYaWpBTEZnbzhMVTREVnRw?=
 =?utf-8?B?bVVIc1dIRWsvdVFUS1JyMlBlSW5JUDA5OFNuMFd1TVdXVnVzMTR2WVl6RUJ5?=
 =?utf-8?B?clF4TnJKOVNqeEE4NVpBQmQwWXBGZDFnaGp4R0NSN0k0Z29WeEdHcENyaDcz?=
 =?utf-8?B?UnJKd0djVC8yNjJ0VEN0YkM2Y0pHdURpSmRtdml4VzN6NDRHUlMzUGdraHZY?=
 =?utf-8?B?ME5zUTFsZi9uY3grbUgxdkZaVlg5aXpTMTZCeVViQnFZL2J0YXI2S3VTdzF5?=
 =?utf-8?B?bnpkVll6WE1VbllsSmR0c0p0RDZmZlJJbnNvQmUwU3hkb214UnBKaldMQnRi?=
 =?utf-8?B?bmdDUGFYWVdFc1MwaHV5dHl6eWJoUHUzNWt6UGwweUx5SkN2Vmlub2ZsaTJw?=
 =?utf-8?B?bEg0bW1CRHlWeGMxbCtOMmo1T1dpczJYTTU2dTBhZXFlQ1Zja1l4QlJPbVNM?=
 =?utf-8?B?d2NITW9ncWZmQ3o0RTY0M1VmcC9HdXNtTi9mY1pSeXJqcm1iZnhPODJOZlpq?=
 =?utf-8?B?Rk5qQlk0ajVoUEpMWUZpZE42V1Zra0JObXV0MGJIM1FlcWM0UGV2OE1tNmlp?=
 =?utf-8?B?c1hweW9hazJiZm9JM2VwZ2FQMXQ4QlhJa1NTSlhOcnpUUk91RlQzWEpDUWh5?=
 =?utf-8?B?UU4xeldadkdUSDduTUMvNlBHQ3UvcUdZV0FCOWlVODNOMDFwc3QvVDVTQzUv?=
 =?utf-8?B?NnN6bTFmcU9vSVFrT3gzUTdiLytUaTVMNGdOOFdBY0pUZStsLzRBa3JkTEN0?=
 =?utf-8?B?Mjl6Rk9IZ0pQM0lmSjg5cnlUSlAraGgzbzV0VmltVGwvOHFCM2RNVHhlQlFE?=
 =?utf-8?B?MHc5a0Ruc2FaOW8zZCtiTTRua054WDhaYXFsU0FyZFV4YmRUWHBRUnlDQmsz?=
 =?utf-8?B?dElBWFkxMDFxajZPSzkxQ3lMZXU0SUNZTFhDNWNhSjQrMnZyWDJSTHNoQkxh?=
 =?utf-8?B?OG91ZTg5VVVYVmtMTlUrQmRKYzFVS0JrbTJKWHVTU2lscDV3VW40SnY1VS9O?=
 =?utf-8?B?T1EzMldTKzB6eUVlZG9yVkJGTStaTC93TG5JTy9qMlZmMG5tWGluNUV5YkJo?=
 =?utf-8?B?Smh5TXBmRnlJWWFHR3NXQ0kwaE1LSnFlTkxtZXNpc09iRDFQU0ZubjJjVGV1?=
 =?utf-8?B?cW1KL2ZwL2lhMzV6c3A5T2kzcWhZQ1dBZW1RTHN1V1hhVENlUnBCekI2RGZz?=
 =?utf-8?B?czAvc1lUQ3Z6S2RLNVBHZXNlL3VwUVRjeXBjbXhSdlRYVHA0ZFdHbzA3STQ0?=
 =?utf-8?B?QWRhNWxMMGVQN0RlK2s5ZXU3QTRTRnlBWlpKcDJXL3MrRnFOYTcxMG1VQU9z?=
 =?utf-8?B?WkQ4cVA0MDZ4RlFqZWJOcTJ5RXdqYlNMb1JtdlNTSDg1bmZnOExNMkpQM2k0?=
 =?utf-8?B?SlBWeDR5dDNQUVQzbXFzakZ6UkxzYzZUdFQ0ckNvd3RkTW1KdnBudkYyQ2p2?=
 =?utf-8?B?L01kTDg2enF6dFhPZ0FFSDBNVm5INU1wSUEyMklVN0xyVk1rOHRQWU82cGN6?=
 =?utf-8?B?MXZjc3ZxVUpWM1crVFdaOHllOCtZU3o5amlaOVAvRkQvOWFUUi9CYjc4S2Nj?=
 =?utf-8?B?RkRsdnRiUFdyT3B4Qml6N0tPMEtEM2MyeXhHWE5mVlo2WmVnZE1BaWoxNC9K?=
 =?utf-8?B?ZnJhTGtRYjh4dnNOUTgzRGxKV1hmTzNvanVidDc5VU5RaE0yL2pBbys4dWJF?=
 =?utf-8?B?aXhzU0RTWXVlZEc5Y0dtZTlkc0oyVU1aZzdOYkJadmI4eTVBRWx4eHY3RGpD?=
 =?utf-8?B?RGVuNmFTaW9kVlkzODZ4RlVEZzlvMktXbnk5d2JBTjFVK1FCbEZiV1RpeHhV?=
 =?utf-8?B?Wkp1UWFldHRuelRiYVZMaDdRWEZ0TXRwc205MVRWN01lL0VTSGlNZTFGNXlE?=
 =?utf-8?B?MDVwMzh3U1AzNXN6c1J6VWN3aUl5UmFwdTVPWjFrMWdUcHJib1MrZmdsVlFa?=
 =?utf-8?B?REo3ZmVneGYyTTB0MXg1UE90emtUR3g3YXJUUU5pdEFORzc4MGIwbmZ6eGRT?=
 =?utf-8?B?cXI1SFN0eklrSFJNbTh6OW9qcXArRXc1RkNBYmJCNkoxQi9rb3RrTi9UQWNU?=
 =?utf-8?B?QjJYQjhGSHZuVzFtMnpSTi9DZ1A1L2g0NFNaQVMxQkFyS3Nhc3NGM3ZPSTZZ?=
 =?utf-8?Q?05iikBwfHscJ/uYrZt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156cec2c-07a1-41c0-f344-08de551c7331
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:29:41.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRvXjB2qOc/a0+lNjikyb5wrv2wSWKxTK0AhnivYDhrcFHFOQng3ZRo7Izat2Mbcpmrr0haOb8go889Gu/FWwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_082944_906716_4016E33C 
X-CRM114-Status: GOOD (  14.35  )
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

Use devm_pm_runtime_enable() to simplify code. Change to use
dev_err_probe() because previous goto change to return.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove error code print at dev_err_probe.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492eb27b372763ce5d344a90c6ec524..486092511d1f9381c250ddcf844fc74c61a789b7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret) {
-		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
-		goto err_pm;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize crossbar\n");
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 err_xbar:
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
-err_pm:
-	pm_runtime_disable(isi->dev);
+
 	return ret;
 }
 
@@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
 
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
-
-	pm_runtime_disable(isi->dev);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {

-- 
2.34.1



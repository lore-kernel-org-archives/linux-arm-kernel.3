Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F1C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1fYQlKK4Z5jSC4WP88E0Oc7f/fULS2/pKPT2PzeWXM=; b=z+5v8m0IUs+082ynsV3YTL9z/Y
	qkObs64AQUPx7BrfybZteivSJPRnc0/TmZE7CvQ7G+9MW1t5+Vfj6q++xbnDvvW+6si8KcybcPzJQ
	uf/gPI/MEl3zDUZsux1X+q7NpPuKFnm+QnTFOXh/3RLPzFy3xeSxmvVnp5d0ROREFSbv7ruwTPiRn
	JDOoVgMZ2TfKPP3mll+a1kmnhLvQ4w08O+eZMNwrSWTGvX9jF4v4wVeSniySSVxCJfLpFYF3ye5Ae
	yTzfXyqpi1VNMIgV/wJVTWHDEm0YsR73dV9gRdnXou2I7C6kmE8IxhTnJicNoUT20CTrPWtEnXMzY
	rneQXsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v15-00000004WrF-3A79;
	Tue, 22 Sep 2026 07:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0h-00000004Wa8-1kX5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 07:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b1fYQlKK4Z5jSC4WP88E0Oc7f/fULS2/pKPT2PzeWXM=; b=muvEndPUYtu6jCmb+y7G/493b3
	PMjuvBGlExirf7jtE3R+AjMg5JHeCQwAQ6Jx43vu5vtk66xzJ8ntL25SRdSvykWuoMNz6hwxGyvES
	B+VOK0YMvkCKeJMeaRynF4XXuJ/Hq50dV7YhtP55nMpxvxTEhLelEJr5VoEeU7MXJEd84oHb98xPv
	a6OuQ1pIqTWqgmHRkXTifG8sM3WVppVXuKYRBBFLXqrde8iaXgZkgJKhPIYTZJUoZQSOWB0y4ofgK
	EjvqxPmpMt80L0GOgmM4prb07uhCSigoIc4xTUk8UH02vIQB6TvZi/zZEJc3yvw2Gu3KDxnQX56gM
	XtGBoReg==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8v0e-0000000DDKn-0CA8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHoWanWoksjvbRp0F2gzjRjxQ1v3+aT/QpzlYf1T7VBtPPdhO69DuO3ElqtQ6SpVNjEbd9sSoejqiJ9hoIJXE4MeHAzU5hRydqVL97bjwgoYs/o1e3PCfJJbnRI1xh8kruzmvhC7as9JLOTOJ2VhYOP+S1vnyL1XBtjwCzLakaDtTXXpRVOp3mak6PF7/8xl99z9tX9fxHxPgIrNUfPMvTZgu5pd7ZlZ9ylixsl52I4qkpYxgQxzdNVV05bD23EB6EDniVjf8uStLvKju/WPIHWIJ3aa8gTPRoD2a7iW4RLlrvvQcuY6g8Uc6Hhepc4tTWRrTTU3/qg4NY6ktQuIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1fYQlKK4Z5jSC4WP88E0Oc7f/fULS2/pKPT2PzeWXM=;
 b=V2VGQXTJ32L7Syyed86JilmsfMO24QdqMa/FNHsFO4Ca0iZuqsXqtr8aXYQhqWG4eouD1Jn167yHVjwbiGZkuH2nfc1sFJrLGeMTfnX7BMtpo0DddRV5KNKu5tJRQFpL/GGMwEA8G9UIAAuJUDMwgq20wrK24JpQuAddSa7vg8ghsRrj6V0TBIquNUdWeBlojqn7i3LhbPEjI+qD1/ycEXs+J35+kNaFqCGkvAeJXt+Zg6ZA4kZhU3ueM4EaExgXzyAb6/zb4UST4TlZL4LldvZhUGVsp8WK6OsvP6H5GNxDBcFAHsc9a94MOTsmGjAS6+2Ch++zTmjcNPaFAXeiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1fYQlKK4Z5jSC4WP88E0Oc7f/fULS2/pKPT2PzeWXM=;
 b=dxfylUefEwcwXM4wig/ESUFkCW5MX1a4ZgA0CkTvicym4yn+0kZA7yN00DFsZC/ySYlETmtlV0VHa7D1Dozi0TAcakTSGomjwKXvGVfI4Kt2CY8SOKmxo3qF8ke3oB8ez/98ipbyUGy62TuG/5mCS+E9Z/v6d20f/h28sqxojqC9hzrJBkbEzz7gFPbxuG1TnqPjCMjnNifFjGSTEIKDLfh2thf6UZXtHolL54Qh+jlPbdL58AtNttSjJz9W2pqSLs5ZCC65fazla0q//l4/h8ZKfRrXKSTnUCAxsRLOu9Or+8XDLSfERMAz45OENbVYW79uJM4fTHnHA/yxz+6NuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by MMZPR04MB213195.eurprd04.prod.outlook.com
 (2603:10a6:190:4f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:33:36 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 07:33:36 +0000
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
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
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
Subject: [PATCH v5 12/12] MAINTAINERS: Add NXP S32N7 UFS host controller entry
Date: Tue, 22 Sep 2026 09:30:09 +0200
Message-ID: <20260922073009.1449688-13-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
References: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P309CA0012.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::19) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|MMZPR04MB213195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbed124-1a73-4a36-17fb-08df187bd020
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: muPIpiz9OxmbK+z1qvMZdH0RxtZQ9Qk/FMvP+nX7joZU9ZajvE4MyDcYa71Gie9nLGCEacfOeQiL8q0jQmAjNwX/fVPg/EmTgmOij+BqYSZgjKJroLQdCcH+HvDQaZC2Zi+93JZtIqk5xjhxcAWdRFf4cVieziXcHw/t/7MU3yYd2GCYeNnd3MI5j/AasXPniL6+M3TTTej/pOEXUIk+Zio2MN1hkCGq1v5Iauio774xPA+1vs533pXk3Z/PFS5VXGLxxRJ3K4WDWvbC9dBj5h+vL2LK2x0mwGZS/mPYFrFXygWdWWkG5jhqRBRkmd4v3Oy83gT+ZNQRpFoGql9U8H290gSqnKxPKp167qf+w31WOgUWaPbAvwFVuk63YTODWHu45bbj0obGcP2U02t26hPiqTJ9g1nq1ymo9nIwpmFJ3z3qXOSScVtnSZcy5I+dwOi6+BDy7/QTVOI7juKWbA+QdNuMMMesHjXQnUh4oubpLUDfgiNxCPaCY94Nb3BmaU+YSi+kIsLoqwYygeoK4cwwma13fTQPvFcNbmr+ksfaJtRQa8cN0a6007XKMeOkXkkTFo9Bgy5l9W3oiV6zKDhdefYHYjELRapQOc62FkAnS/Eo9Il5FU5v3gh1bA6UmfAQKZwi6apL9OTad2R5YpOOs53E616zG1ChMM7ZohAbLOg1//ZvvJ1cFJHfrDe9Ziz+/yYfWXX85vgm0jDjRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3JUVnJJVTF2aS84ZkRtTHBnR2hvdXRBQ3ZSb3h1OUtWNGpZOTVaNnlpcUhG?=
 =?utf-8?B?YlN3VkNpWEpoRE1jQktIMTJGc3YvU0JsdkNuU1lwdFVReTFYTlhnSWlMMlhB?=
 =?utf-8?B?T0l2eXBiR2t6ZHpIczRYM3kzaHpuckV6UkErcUg2S20xcnpEUVVLeCtmdlBa?=
 =?utf-8?B?bkZ2VElvcmE2cHhhOE5lWDFNbGdEalJFSkZUTTVpRmRadVg3TXF6VEN4dVM5?=
 =?utf-8?B?L0tyOWE4RjJESlhoRkovWkUvUTYzZ3ZFdUFQVlIvcW0zL0pTUVV4QXhqblZv?=
 =?utf-8?B?T2dyWUw4NUJOK3dHbVdlTGVIandvemo2Vmp5UDZRL0JKaWlnVm9VWlIreE5X?=
 =?utf-8?B?RGdoS3prdVlZNlVWdUZ1eDE0WUwrUzRCMEhQb2wyNXpIdGNLR0ZoWnB1ejZz?=
 =?utf-8?B?dHpNaGxYOUpENnpCSUJDSFE1T1hYUytacmpPUTNlRWN2aUtEa0Z5QUowT2hU?=
 =?utf-8?B?cHVOdXhTQ3JwRGpoUSsvMnJxM1pBeDZLcENvZzdmaThRWkVmczRMQUlHUEky?=
 =?utf-8?B?SlFKQ0l5WHN3SjRhcWplVG9VbzluUTBuL3R6OGRTM0FGRUtiT0RLSXhBdllr?=
 =?utf-8?B?aUQyV2ZBdmZyUUg2WUZtS0htZ3p2ZGExend5blQrV3RDdHB5OXpleStXQlpD?=
 =?utf-8?B?WHlJc1hFVVR0MEhkWVBlVWxDbml0MzFTb2tYRmZRTHRERDNIT2dwMlpkbTlu?=
 =?utf-8?B?dS9XUjBzR1hmcm5Icy9JZGpUM2RDM3YzWUxXdmdubVI0eENYcDVUalJLV3g4?=
 =?utf-8?B?WjEvdHFrbzZ3MW15eFRnNWdPUVJpcWlPU0dwK0MrVmJyYlEzWUlhU1BvaTV3?=
 =?utf-8?B?b2RRYUJqcUhLajcrME1wdXZZa0FiZ0ZqYlZKMVlmYTJPZHJ3MkYvVllIcTR1?=
 =?utf-8?B?YmEwTEEyb2hrZGp2QjdjaXhxbGpUb1JRejljQnU1UWdSZ21FcWJaWFRkRTY1?=
 =?utf-8?B?bVBUQ2xsTGlsWjh4a01kb09INkxMWUlhM3d3NTdwVzFBS3NoY3lhTTVQeUVV?=
 =?utf-8?B?eGJMOE9MQVJlYmxqbzhTOUJCYU9GdUdHbzdLdkFSY0xLTkRzTXVGeVRJQ0VF?=
 =?utf-8?B?V2VpaWNSVW01eFlwVHhRbDZHZG9kenRLaFVTN1NtRWI5N3NhT3psOGwrV3Bz?=
 =?utf-8?B?a3ZVZE9USWdKQm9JUW9hM1FwczhJTWIzMmQ4V0NjZDVPK1lrNG1aVWJna1Zn?=
 =?utf-8?B?LytGNUlHaVE4bVVwTVVtbkYwSDUyQVpubTRkNndGSGVFK1B4aEJaM1hDczYv?=
 =?utf-8?B?UUoyNmUrUURHQmQzQlFRZFIxU3lRcU8rbGNrNGs1V3MvZTF4VmVNYjB1RXZH?=
 =?utf-8?B?MWxMZ2o2amFCNHRXS3JHVzZqYytvdHRxdXcvdTFFS01GRDdhcmIxU09nYkh2?=
 =?utf-8?B?M1NPWCtJb05wVXArNmRJNGxrOTZ1OG9zQ05GelB2dU4rTk5VK2tkaTAxVmJR?=
 =?utf-8?B?cC9NOExQRXphODY0L0UzZS8wODJ6OWNaMk9HejVBVEV3ZzJhQzMwS3pVOHVP?=
 =?utf-8?B?ekM4bE5CaEJoemlYcm53VC9GMS9HWjZ4MVpqdFRpdi9PYW9TbW0vTkFvKzIz?=
 =?utf-8?B?d2VHZnhuT0NWVkFrTmRaU0NpamVLVzlvNlJSeGpmY0N1WGNtbzhpUEpTbEJ1?=
 =?utf-8?B?OFBOMlh6c1ZzeGMvVTdmb3htS1lXNFUvaHVGeVV0OHdPQ1JuS2UreW40OTlp?=
 =?utf-8?B?dG1KVVdmbzJlNFlka0l0TmpnMmVpYndQS1lDUDVNS0lncUJod0preDhCa2dB?=
 =?utf-8?B?QXBleFBEMEwzdmQ5blRRNTNmNjdiL3hxeTlmdE9NOTVuWnRJRytoS0p2d2hU?=
 =?utf-8?B?dmU0OFVIVGlkWTN1dDl2K3JZT1pQN1p5SDM1WjI3S3p6by9RdzZNbGtHbFRB?=
 =?utf-8?B?cU1JajhOU1JoSnRJWTN5MU14QTFoVlV5Q1Y0RTVua3M3QU5VNUpTaHVPQk5x?=
 =?utf-8?B?UzZWVXR3ZVY2Tjl3U0NVZURYVVRNcjdjOW4xU29JK0JxV05wOFVUM0NIVmJy?=
 =?utf-8?B?d3RRMUR5Wnl1L1M4VnVTYUs1RW53cThoUnEwc1VXQXVod1ZkUGlSRSszdVNo?=
 =?utf-8?B?VXZ3VXR4Y25GWnhhTHVNazZ4S0YzVkVkYW5XR0txM1JheTYxb1ExZFJZeVV5?=
 =?utf-8?B?UnNBVmE0ZG5ncU96ZTJxMWNoWWEva24weHBJNDA0WDU1QTVLQlZUQ01hazhu?=
 =?utf-8?B?ZUNxWVJHQmIxRDBibHorbXBEc3dRSUx5NEZ5emk5aXhKMVYxVlZIbGRYM2pC?=
 =?utf-8?B?eE1QK0RaOHVieTMvTlFMdXNVVjVTeFlPT0IyWkUzM0tCTExwamZVY0JuTzlp?=
 =?utf-8?B?U3pneVlZdkpPUi90elNvRnk0WVhEU3NrelB1Y0dxS0tTVVdHVFk0WmtjS2RS?=
 =?utf-8?Q?vqQEoDte8vlURjFk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbed124-1a73-4a36-17fb-08df187bd020
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:33:36.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2w94haSIvRyi3lsHV+BD3H3VXE9MVNwYBQt0qPHmi/IhTuZ0dcMYjscL3QPxNNcaRBUcPJb5I2IQWGFQcTe3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB213195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083348_205799_5B363DB0 
X-CRM114-Status: UNSURE (   9.94  )
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

Add maintainer for S32N7 UFS host controller driver.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a..32b01db895f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28096,6 +28096,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-renesas.c
 
+UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER S32N7 HOOKS
+M:	Larisa Grigore <larisa.grigore@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	linux-scsi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
+F:	drivers/ufs/host/ufs-nxp-s32n7.c
+
 UNIWILL LAPTOP DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5FCCAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 02:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OU4SkVlkea3FXtpPoOjxDXOAkpxXSQ//1NqmWywctE=; b=GeqfdEdhP65aL7GTn21n1L+YdA
	hYHqzy9Ls/KOU6styw+vkCea/Ea8FxVTnhxNR/2z5LIBPOR3M5v4YDEQVMtAnJ79qIhXwZ4sJmHrW
	FslKjukNMxtqJ0mzzLocOa6zUIdaWnQhCJuSnZ5iQ5qhhHPM2c7RvEKqLJjib7BN+q1UQPP7uH7lS
	NGTbyKAu/jD/oZnhlfISebpwIepogkQ8UutStEqBTIleRvV6yGvAwz+201DGAFDbA7rSEQKEtnVfG
	c6fzlWkJwMw/orpFJNUmohb4teVz3LXzJYxhgkDM8o9SDkP8O54PQGm6T8+6/7EVesNj4FJJgHL7v
	Q9mIarNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v33p8-000000018aT-1KkL;
	Mon, 29 Sep 2025 02:41:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v33p2-000000018UP-40rU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 02:41:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B75Gn46ybpwxcenyxt8qmh9w+RLBKPZOXpc5W41sfjmJZiNpH8UPL8dRaSRj5ddtYVj5Z3hyv1LjzgumADPG0IAxftWSl2/pxEn7PP40eTwFAi8ZtRo63jOxPsYe+pNk5J0r/HOD/7klllDEwvyPRA5NUgnvdJfewLcl1oBWJSW4ThGbEgp4QO/4PGWE/GZwYRbiaTYnT9W+ow7kjGbEQejDTqGVXIJjM3XtXV3UBDt2KTCqxGY195/Cq2UfTgkgM9HaKnbaenrEtrZStO6tjSt1BkmRAQEjg0snHbH6r2NdLjMoTn4sNg0hItk11Ojl98/gWFYxg2ViryAvV3uccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OU4SkVlkea3FXtpPoOjxDXOAkpxXSQ//1NqmWywctE=;
 b=Lfn5CRWUxSUypa6vO9vjYxYSRR2u9AHoqnRb/1qFdoK/OTVqtgqym8Sf/1wGEuisdv4yVgH6qmyWOza5lB3cZPZrKD9tzC8WwN4uZ9qgmXG8CR9ydrO+4snv/SD2vMQ+B8P1LL4WJJ5wwzXRNqUmRD0NqJyq/ukCTTGiEwt0fX7bancI4pTbuAP/3aH5db9fxB+DEXv99Ue3xnnDB7OG2cvS7eDMBshEtPSp+bIsj9FDTDoo2aCgeKWwOaba8i5LpwdxeKOrnMTWb3VB0bCk7pRXO7rrnwV3QYFghNttGR39n/NVz7ffiltVpxOaJIAAGZujcLMnBNxwYY1r1asUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OU4SkVlkea3FXtpPoOjxDXOAkpxXSQ//1NqmWywctE=;
 b=Y0pz0r8Rhbuh7i367bh9ODEX7w/w0XFw7Vskpd9RbgBc1+A/N97IwFPZUVAqh1h8ONIuQJbpzZ97CMQdpYdkpU+ttzpehLOhqqban84WN7/GqtSeBEGdLwXyFaROLZF3Vx8BqOINi6ptwBG5f7Mh72pT6cBDDtU8bs+L5Q3jCt4uSRtqh5ypz4PpTmNeQNo8QjGqNI+xRUG6zBoXDwCh2USKLJ85BZqOKg5yxyl3WmIdTVwuSq3cnOZwn9KAe/fCNxWiUTMu2B42abOdlhDZkCgcdLV7CVPRElYsEBrg0lri11ttyIId+h6vKaNbmVghJoLKiKceDcrAJyCLKTVQ2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:40:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:40:43 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:38 +0800
Subject: [PATCH v3 03/14] MAINTAINERS: Add i.MX8qxp prefetch engine DT
 binding files
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-3-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6ee64d-5eff-4278-a42b-08ddff0195f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3FGWmpzM1RIalZVd2hmNXdnbFhvL3dQekprVUNuZlM2QTVvaTArQmMrYUtP?=
 =?utf-8?B?YzdnWUs5dHBLck1MeklheGtwcUFCYUtKSm5XeFJYdjJNOHhCSlVBZXVVWWlQ?=
 =?utf-8?B?aUtPa1pTZVB4OXQxY2FiQVNPNWhuSTB6VVdJdWl4aCtueWFkWUdDU1NNRlVz?=
 =?utf-8?B?VG8wUThQN3Y5bXdwN20vSUFGdVRORFdnVzgvRStVVDYvYnVPUkNTY01xeUtr?=
 =?utf-8?B?bWRXRFFwZXpQUVNUWSttVnRjRzQ0bjhnbFBuWC8vbEEyQ1M5OU83YTI0Rnds?=
 =?utf-8?B?NnNIdndkdU5uOEtpWEZsUGpCRzZYOGErenV1dWQzVE1mVmFkWHhZejkyZUtF?=
 =?utf-8?B?TTJwSUtCc1k3dGwwTTdOcVB3blVGRm9CbUoxS2VNUmwwT05aSVNuUE1wcGdW?=
 =?utf-8?B?NlYvSHpGblJ3UUhNdFQ1UkxjcHBHTC82ZVB3L3BuZjFIREgvamZPU1N6L3BU?=
 =?utf-8?B?ajVYbGYvUk9GWmdKemxzclAxQzJJSFVleVRjUnhUc3AvOHdFMnpiemhFbmNU?=
 =?utf-8?B?Y2FacVRwd2pxNlpaMmpjTnBDREJBTTFjMThwUjNVUVBrVXBPdHNOa24weUZD?=
 =?utf-8?B?OUFzdXdFZkN3RnVZOWkveXFHQTVldEZBUGdBMjFQdFh4d1lvS3k1SVo2SUh1?=
 =?utf-8?B?QnZSS292bSsrYU9MaUtPRWMzbHVKTFdLcmdwR0NJVEVXZ3ByZVk4N09sem9s?=
 =?utf-8?B?K001cUsrdnlQOXJ2cEFheXdST2h2K1dnQURHeHFySmlRNXRVWHMzQXh0c3Qv?=
 =?utf-8?B?dnJON2dlTG0wcTJxM09FZVAxYkxUbkNOWHB5dFhvdjFyamcxa3RUalRBWTVj?=
 =?utf-8?B?UkZUeDRhN0N0R1RGLzFVOENFbi9zbXMrNFRZWXh1NVRvSy9kQ3J6TXVtU296?=
 =?utf-8?B?aUpzSExZNklsajBjUHlDRjRoNEtLS2RUK1R1OUN4SzNielpCQUJ1YUNJT1Bj?=
 =?utf-8?B?YUEwcEl3am9KbGNoQ05mN2w1b1dXbDFzUm1uSExOczZxaW9pWGM3VUVCQzVN?=
 =?utf-8?B?MDRyL3dKeThhR0RISTd3aU0vRXpLN01pdlVuMDJTcXNuZ1NaU1lBZ01oMjRG?=
 =?utf-8?B?OGViQ1JsK0xLZzY1WmxieGpHcWtWY201aHJyVjZQMlhLR2RhTHdPelFQRWhM?=
 =?utf-8?B?WXFnM3Fqb2tsSWtZc1dvQkpzNk5KT1RzMjFUdXZHMXZ4Tk1idkp1R00rakhT?=
 =?utf-8?B?QlQ4YVBHYlBXTjdhT3Z3OHE5eFdGTlFubDlYRXFsakd3MGJmeVRtZkJ1aTNw?=
 =?utf-8?B?YjRRd1MycGJIK1JlZ0tpVHVXMEhiMHl5Zk5yNXlIc0tuNUZnV3hQMC93UDJK?=
 =?utf-8?B?bzVGTC90cXZ6R2gyVUhLbkZ5c0x1d3pLckN1NmY0ZDFoMTByalJwQys1MWxD?=
 =?utf-8?B?M3ZGTHYrUFB1YXZrWVp1Zm5sNDJNRHBMYngzMUZkcll1MmxEc1ZPa0lndVBI?=
 =?utf-8?B?aTg2TkY2UjhZUlJTSUJJc1ZQdWU3L2QwSEZOb3hmdWo2bU9VckJheEt2bGNu?=
 =?utf-8?B?VXdVRjM5L01xUkplZWVtWGtWUm1hTllUV3FCODlGcFhBUkFCZVlLYmYyVHov?=
 =?utf-8?B?Y0xTckxOM2hRMDhxTmhWWW00V1ZkZUZHaDhsaXpxb0hTb0tHK3hnMHoxVTZx?=
 =?utf-8?B?Sk1MNG11bml0WmEvaHkrYjgvUUloMU9Obld0VEp3T0xWOWlrRXdDR0FFWFRX?=
 =?utf-8?B?U3hFUktXb1VPaFRhYjJTeWFwNkVZMUdVOGpJd0pkWEpHVDhTWkZKS3VmSG1O?=
 =?utf-8?B?L2o0UjlMdlE1RHhUbUl4Ti9IdjRNcVZ3K2ZBaGZYZFA0cjhmbE4ybWxuTytp?=
 =?utf-8?B?REpvRUUrWmNIVktYcjlMa2JqQndOUzFSN2tRMnhHeDBTNmhORmRaVm9ySUhW?=
 =?utf-8?B?V2l6WkJmcnZ5MHZKZWNEYTdrbmxXdjhEaWNaRVE1MEVlQmgzeCswcUpOQzN6?=
 =?utf-8?B?K2RNYmFPcVR1bkhXdnRwQk5iUFZ6b0VHeE5JR3U5c3ZPYVZmTGpZcGpkVTAw?=
 =?utf-8?B?S1Fma3V6aVhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCszOEtNZkJKZVRDeHd2c0lpOTR0NEhLL3Vld3NncGZ0S3lzbzc4WVkrbmpm?=
 =?utf-8?B?dkRuSyt6ZzgzQjJnTVNpUmhJT3p5enJGOENxVEE5S0RtbWJ3VXJrM3VWY2cy?=
 =?utf-8?B?RUgvOFliYzQ0VFYrNjgxNHVEb1BmdVZYbHM0cmtkSmlFR1Y2MmdoWVlHOEEy?=
 =?utf-8?B?Z2k0OStXdGFmWVB3TVdVOEEwUHd1ZE12N1FaWE10VDBSN3ZMYzQ1TStEUjRJ?=
 =?utf-8?B?YjY5cUdhS0tZbUxNaXgzUmc1VmswbzdscHVvMGU4bTZ3WGFZMnJLd0xSSjBD?=
 =?utf-8?B?eHZuOXcyRHBvOGZPVm9xdWt4TFlOZzJVMXlSODF6ekVDSUpEdHBVVzI5WGFZ?=
 =?utf-8?B?N21IbUF0K2p3Si9kY0VEZVBjS1YvbzJQZ2ZzOVNBMHF0WjVJalIvcnF4Y3Rq?=
 =?utf-8?B?bk9mNVdJVFNZRUVGV3J4cHNhVkdRMWhuZzBnczMrcENDc1F4QXgra1BXdkNI?=
 =?utf-8?B?Q0duN01CWWlrVWp1L0U5UUlCRlFvdDZoQVlhbnJyd29QYUp4dlFDVmpkZXZk?=
 =?utf-8?B?V3ZCVW9NcFlDc1p3cTRCeHEya2Qvd2V5Um0rWWF0TlJKZ0NYZnR3ZmJyRnQ2?=
 =?utf-8?B?T2FyQWxQK3dnVVYzSzlxSlN1SGE5dFY4YzlxM1NBTHRPU3AzSDBzZVZzVzBi?=
 =?utf-8?B?SGFJRTdGZGl0eG1qYUpINnpTWVpxZWkyTEExNFd1WG1IVXFxWHo4VDlIZ3RR?=
 =?utf-8?B?aUhYd3JjaDFOeXdpVlU1NSs2MW1QclJaSCt2V3UrZlJhQm05VXBoeTZpbith?=
 =?utf-8?B?QVpPVUZHQy9DbW4yYVEvTTNvVFBrTkdEVjI3anJOWWhtOU9TOFZiSndWTWVp?=
 =?utf-8?B?cExLbmpMSGdZNm95NzhwVzhMUzlNNFBoUmtRMURqeWQyTW9Ua1RKdXk2SkVz?=
 =?utf-8?B?bE9ZcWNzRXB6QW1uUC9jRUJ6K1lWbTB1U28rNUdaaHdEbHVmUFZ0a25zblQv?=
 =?utf-8?B?N0xvYkVubERYRjJTQUhLUHVFUHQvZEJrT0F0S1VvRUJYbWprV0xxRXMvSzJM?=
 =?utf-8?B?RzhkZWNPL0NmT3F4ak5sQWdGMllQa2VyTHEzMHM5YnFHWEZqMG1NOFQ1YkNj?=
 =?utf-8?B?RVhWNjkrc2k5TTVWMmVka2xFTHhUS0xtMFVWNjFLQ2ZHNUgvNWViM2RvMWts?=
 =?utf-8?B?S0dhR1k2SkU2OUVua2hheGtoaGIxVTIwbFd5SG1xRUxQSDBuT2ZrZnNxM2x4?=
 =?utf-8?B?THFLd2ZzY0FLSkZaU2VGK3NvMGpGR2tGdEpSR3J3dkRYQnZrcVAvalpkWTN3?=
 =?utf-8?B?dU1MMzF3ME5FVEVkM1Y3Mzl6dVBRWE01WEpSWkNGNDMvWkRYSnJiUUxQRjQx?=
 =?utf-8?B?RC9JRjZRMHBYZDQvUmNqdnJjU2w0b05YcHVKQlBmOWQ2bjVKRXkrYlZqaXBM?=
 =?utf-8?B?emVTdDB2b2pKUHExTERIMXFONGVudEhuOGhhWUN3eXlTZlRzaXFOQmhCc3p6?=
 =?utf-8?B?bUdKeWw2Tk5xb2hFZlJmVWtXeENLMzNRV0hNREFXb3ZaVEdLK1VnVzkwVUlp?=
 =?utf-8?B?TlZZYm5Zc0tMd2owUUxBTSsxajRadTMwVE1lYWxsQmVIVTVXa0hEUktIcG9i?=
 =?utf-8?B?ejI5MmpBaldCaHBUNmI3cENqNForZXRjY1RyNFJOa0t5dlJRWGNxdlE3eVVz?=
 =?utf-8?B?dDFhRUJ4WGhEOHlIVVJ6Q2s0RmNvTklWVGtUbXlodWFWY1VhMzVkOVMxZzdq?=
 =?utf-8?B?OTMvemQ3WWFmVkYrV1NaOVFnOVluVkU4YUlTWWVHOFhRQ1dEbmRURXNNL0tR?=
 =?utf-8?B?Vi9NRWhaekwrOVM4KzBVRGg3ajY2TElmRFF1MlpBeE1rc0VaOHREaUZLWFFG?=
 =?utf-8?B?V0orTTRtd05tcU04UitzZFFGajBuNSszd3N1UCs0TGJSQThJck11Q0dKRThF?=
 =?utf-8?B?TjdWNklQWEliTVN4MmdXejZTWXNjT2l4djNXSXBkOHB6RnV6VkE0Mmc4RW9E?=
 =?utf-8?B?Sm9oK2dNNndnKzZ2a3lhQnRlOEdFRDFhZS82ZGR5ZnhVczlQLzNlN0lKZGoy?=
 =?utf-8?B?L25wc1ZIUmJxbll1OE5NcnZ3Z2pVYmJ1TUFjbUU5alN1bGdkQjAxYTJ6NWxp?=
 =?utf-8?B?MnhpMTVLaHRoVHVYbENsZjBJWUdVd2FEV2czOEVvNXpFQytqSUZUM2ZORHZy?=
 =?utf-8?Q?7HJCpq5fGJiJxikaXiw1M4eIR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6ee64d-5eff-4278-a42b-08ddff0195f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:40:43.3125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJBLuXcS4ElHhmccKQD+pCaQQQ2bRpXdjAY6wUE7v/K33dsgO9117L3zYJfCB1a1RahV41pOy41wuTpBqZqlsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_194105_002383_9C780C44 
X-CRM114-Status: GOOD (  10.51  )
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

Add i.MX8qxp prefetch engine DT binding files to
'DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER' section.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c8281ea4cc64dce7de4e5ae660a24139753eccb..d1051de3ba5d0ca524a3895ea8981c3e89054e11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8324,6 +8324,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 F:	drivers/gpu/drm/imx/dc/
 
 DRM DRIVERS FOR FREESCALE IMX BRIDGE

-- 
2.34.1



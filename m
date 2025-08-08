Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8753CC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFCd46OlGYtI25GTgsAt9CKctEjw11dc1/uFuvbHUBs=; b=OvzoCZj3lBS/yX4Y1AfWCX7/zh
	lcqXfEz4dZyZxkA5zDtmrefH8Vag2OW0bXzI2n5IeyaDCOzyN2gNUpUCSqlOFEMfVaBrS9XuomsIe
	19wWQH4sE5TADlTy3ojVpfosSLeAnHjcggTel8yjwGzNn17Hv50ZmPP0EbQxiyNwnajcTaKfGYThZ
	k+Jadqtvd0X6g4kkrMaV5BwsX4u8u7f4ArZlzHGp+OywS6mDZ4ywj1ae1oHK/D0lzLzPlL12ekFMt
	ZfKJe+MTxYhDoAs4y0QATTZLJ8mKCLDftgvdiUawwNXEn2BErcBxu3gmc5zHI3rUJmjQmvu+GtJx7
	qtHhvYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukWMF-00000003rHA-1UWo;
	Fri, 08 Aug 2025 23:18:43 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukVmE-00000003nXB-19BR;
	Fri, 08 Aug 2025 22:41:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfofYeaQyWOBTlb1vOqyso/THOEuq8S6IcZC9RyHOI/uMnATeUDvDJR9EWjPa68qe4XEqEE4m+c+XYdqRwcyI6lf/OGXcE2KqOQfjxWdbv1CuxAEgU5VwYlJZDEkp9lGz05dfrXo0rwHMib/Ty8aMJBUPDrXaRmrrP9dC/CbjbQd4nZr/HQCVP1lS+l8rOiCUfKd0BiKt3h7K/ZIdQ9RS+jsD+/a2U6yHnpE2TAixpL2CX/xXD1gR2wrzzeUxr9UdBmOnRzIKEhGlEvDaXd1YW5TNeR/sXugtESHNYdSwYyloZFkLrXA8j1LFE+JSPhj5Rv34B8kLWpvLHWLQwF6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFCd46OlGYtI25GTgsAt9CKctEjw11dc1/uFuvbHUBs=;
 b=yv9kVYGVORBtS+nzarGNZpwBS2FhIQdPXFgurPQHsGvCsJFNEzNsvSu7O1ykDi4b1Zm9fEnXBzpCAso3WiDFFoSkRAzPxBxDPNhs4y0P1Nr6SEVWqWTCfzcEtiG2JU52O7tZ2+bqdpc6J2+qEJ4/lUupQa+5T1ST9uHyuDdfItTvCjwb8aXu+Q2EuE2pob+KEPnYCFwn8W+W/BoG7bFXXEbU5hD7CIaArM672GlhS0Uqv2MfnLrfaAASloiQfwr09C+MkAAUfiUwmsx6rGzNAzO0EjeRGRA64Hz14NsiYgHbEhKx0myJFqzSxbZLg9wHLOgX4rjiUtoOaBLXfL0DIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFCd46OlGYtI25GTgsAt9CKctEjw11dc1/uFuvbHUBs=;
 b=kbKkVOj2xAFUqhCqt2gUzswTxyn0f1c4rIsbvzN+DkJH6jnWycvhZfj4oJxwCwFQtzYW3MVM2jSN/XY/+4kqFt+Ky5CvguU61VhYjiUMnoUiEM7dovS55DW5XS59eEjQQbZVa3L1YJ8bqV02HUBHV9dZC2ix/Xa8e5KuObM6woJKeCka4HTTQt0AJoODsRsMBAEQVm6D5wVO3o5KAOhncggQjkfoCOwy2afcNqZtYnR+0svv0unRyI9jvT2L/sCdf5KlSjTDnNVj54q8sQSbWbAkeFz5t+zY7ioc3MzLGK4lDVH89Z1o9m9gPIZjUifeaaZ4JUnF8V8eILfaY3pefA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:17 -0400
Subject: [PATCH v2 14/32] media: staging: media: imx6-mipi-csi2: move
 csi2ipu_gasket_init() to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-14-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=5048;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XnBOPxiNQalhUymynmQ3ws9NWe8gvYNC+hrFFsGjZ9Y=;
 b=GEHzhhWXGYG6MyUe7dB52KHbIDJbDl3A6nkwp2SrBfibOW+XPIUTr/nVqpNW5wmh/aEdnby6B
 8PPV2Rtfu/RDSFmLdCKu0TB2OG8W56gBkSUScmkNXRenvjxJrwpS5Jg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c70bcd-2618-4987-ca1c-08ddd6ccb1d1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE81N21lQ0NvTHE0a0dkaUlaSWNkYjRrdFpRQkRpakNlTVNTSGV0cUlkTlZK?=
 =?utf-8?B?SDVNMlYxNkFIVnJCZEg5Wjc4MS95ZGh5aWhGYXVnWmtVVmxmSGhDOEFXc0kv?=
 =?utf-8?B?VDBmUDgzVFVGemlUYmZPclZWVTYyOS91dlg4S1lna1dxaU5SQVVSVTRhcy8v?=
 =?utf-8?B?RTZ0T0xIZmlpdnFRMG9wN252c0hwOGJhc2pWdGR6ek94TWpCRXJZd1g1VGNx?=
 =?utf-8?B?aU1UZG5OS1pubUVjaFRkVWc0RGhWYldaRzdLT0Z1VUkvbmI0YXMrNkJzRUd1?=
 =?utf-8?B?OFEvMmtGT0wxUVI2SzBiOE9OQ21zUlE2T0JhanRjcklYb0hEWEd1Q2FzazFE?=
 =?utf-8?B?VjlFQWhDSWJENUhPdFArUnVFNmFMYnFsMkowdzBxaEpOWDUzWjcrQmNFRGcr?=
 =?utf-8?B?dnhkaXU5OWhFY0kxcExRR0VZQkpyNzdicEJYbkFLNXBobXlvWUYzQmxSSW5l?=
 =?utf-8?B?VDQrUXZlZXJIbWhnR2RyWklYTElyQVNEN1Nvd2p6WUZYdEhQL2lpaUFQSElk?=
 =?utf-8?B?TjBHa0dkU1l0b1ZiTkpiSVpha1g1WW9IT0RUQzNiM2NNNHhzTWhVYnRVVFdj?=
 =?utf-8?B?NGViYS9XRHBNa3QrVFc2SFQrdUxzSFNEaFhIMWFTZlViRXczcmVFV0pHK3pZ?=
 =?utf-8?B?SVdvUzl0TWtwZEsrWlFudkxBSGZLVWFNcjJzUTNWL2ZJbUZqYnVoQXdXM0NY?=
 =?utf-8?B?UXdmd1g1T1I4UjNsNVoxV3p6RHVJdWdTVkZNVEZTY21lZEJVd01VOUd3amFG?=
 =?utf-8?B?MUg0QnJFQkZRcXJ4RVc4Y25iVXY5b1E1U0hEeCtwb1lqY2ZBeVRKVFNNQ2Ux?=
 =?utf-8?B?cFJoSVk1Q0RlOURKN3Q2TjZsV3p0Nkt1Nk11R3JJWG1acWFmK0c2Z3FWcXpk?=
 =?utf-8?B?MWJKc1RhUnk1UU1IS2ZoR1A3cHJpTjJmRkJaRisvQ0RRV2pnS0g2ZThvTUIv?=
 =?utf-8?B?UXpuQ1Z2NWhmVHJFK1VCeFBMeklIMEpNYU10dTdkU3MvU1pQK3BYVkVBL0Fo?=
 =?utf-8?B?QXZIajFqMHRaNWRTNkVVcnhuVk0vMXYrZEpvK3UvQXMxMlJxWnlJNGJkMGxE?=
 =?utf-8?B?NjVmclcxR0xTbTJ4NjhTREhzUkxTZEZPZmYyMlU4SWFCWVBhSy8vMW91aExZ?=
 =?utf-8?B?T1N1cCsxblRzZWpFaXdPTlRNMjJ0TUtyaCttemNLK1dqcUF5Y2drNVNSTm04?=
 =?utf-8?B?dUEwTVA0ZVBJT0lnbXR6TktGaWNtaDFHRGVLTVZoak93eVlJZ2VTdGNWQk96?=
 =?utf-8?B?SFJVN29ub0NRenBpRVRkQldSOVVqRGpWQzBZZHRYNTR0MGJHNHlrKzBERFZ0?=
 =?utf-8?B?SzBsR3FtcFhJbXlhZGNEZkRDODdhYjZMdGJFeFN1aENsMC9xN0JXQzRJa0M5?=
 =?utf-8?B?QjBCSVhHTGFnQncvZ3NBRS9GckpqU0dpNm4vQzBEbVNvYlZNT0wyNGorS2hl?=
 =?utf-8?B?ZzN1TmNHNWxiS1FseEZHbjZnL2syaWJBeXJ2Umd1NTN4c1RLalZ4NUJSQ1Fv?=
 =?utf-8?B?RnlYdWRCNTdScFJHczVialZHTUNRa0hDcW43ZXZzYmtOOTYxMnZCUGVINHIr?=
 =?utf-8?B?bGdldUZ4dXY5a3VtVlRyaW81UlYzcVlCNm5yek56dERHQXdnZExibTNwQUF0?=
 =?utf-8?B?QTVIUnhKRThMZW95RkRQNVEzN0NJYXoyZGo5dnBFejgzODNScklQMUN1Y0NW?=
 =?utf-8?B?SUJlL25YcEMvV2tOZTE2R0IxYnNUQkFMQkdKcGtQUytvVXV6SWhyNG9saldW?=
 =?utf-8?B?b25wdnpxaUlUazkydGM3UWJ4M2VkcTVNc0dIa3RYNXIzVkNIY296WjRmRjhx?=
 =?utf-8?B?VUtaRGk3U25UQTJwYnd3ZjZMUXNtWEFlbjlURnFvdGZKdkE4T2xzeXgrWUpZ?=
 =?utf-8?B?OGpqYjh2aDBmdC9sVG5tV1JjN2F6NERYZGtIYTBmMFN6ZERkbHVHUmkxOG5q?=
 =?utf-8?B?TEpYWkZXdjhOUlIzeGtkWTZrUExEdWkzeTJ5UlY0QjBvc2ZxbmRaZmo4T0RU?=
 =?utf-8?Q?Jy6MPIquSb6w9erCQ7hyIXJBAW9f9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1JZmhNb1ZNSXB4cTE0VVBCQWpsWEJLNExWbzJZN0w4ak1yUjdwSVhkR1FL?=
 =?utf-8?B?RGdWN3dKTTBld3ZNRHozZE9IUU5Xc0J4M2pzVUQvOHlsWFdEeFRySXBEZUxB?=
 =?utf-8?B?aUJERVhPL3hiZzh2eGdFNUVyNGJvVDlPRHdKVnN0STYwcjR2SXZwd01QQjlY?=
 =?utf-8?B?d3JxMU53a3FQdnpjRmcvZ05EdzFocFlmOHVzd2lPb1ptVmczMHhrc1NqbDlk?=
 =?utf-8?B?RDljL0xXMUZCMlpLd2I3UXhrMlFVZmtvSGlhb0FYTFM4OXA4QkpVWmkxVE82?=
 =?utf-8?B?TmU5QWkvQ1ZDWGs5WlBRNXQ1SnhSUTZLWjk1QWRyZ0pxU0NsbzluMzlRUU5l?=
 =?utf-8?B?U1Nna1MwUHFRSzZtbUVGNEExblhJazNod3FDRUxwMlNLaXMwc1dvck9aOFVw?=
 =?utf-8?B?Q3J6S0hnL3lRRVViMXNneUwyQVlaYWFlcFBXa2FSTkZnME5WMWZ4a2QvU0Vq?=
 =?utf-8?B?bmRYWUM0c1RLY3U0WjFodXBkU3JMZWwvTXQ3OWlxanRBV3dhcFJzbkFkWUNp?=
 =?utf-8?B?QVpENFd4Rk5CbG1QQ2I4V1JFL0g1eVBWRmVHRDJaek41cnc1ZUNoVmRkdmdM?=
 =?utf-8?B?blZpSnRzZjZRMDB6UGZ5RHc3RDQ0S1FPZUgwVW8rWVc5ZHc3RGNVRDdIT3VY?=
 =?utf-8?B?MDB2ejZuT09MYk56Qk8yRmhaNEtLRWR0NHZZcmYrRnVRMVB4Q2RGMDdWOFJU?=
 =?utf-8?B?WDJsVStGa1JiejBBbktmQVBwd082dUVpeE5MWHRrYlkyb2NUWUpMNGlhK3NX?=
 =?utf-8?B?NHA0R2N2Z010djVzaW90RytRZmlDRzdPSTdkN2czMkVKMjIzc2VwNWxJSFFE?=
 =?utf-8?B?NXFaei9RYXlKcS8rTkl2VEszbnJHM1lxamlydGlhVGdWSlhZc3VqeDlrREFZ?=
 =?utf-8?B?TEtRY0lvejgxZ0R2VDI4ZWFUMXFkcFVLL283bElHVDMrY2lsMm9ZaHdTeHNl?=
 =?utf-8?B?SUw0L1FrVDFvN1VkcjJzTnNKUjlpMDBwM2tkUTRyVnhFWHgwY1hIdFhBaFRl?=
 =?utf-8?B?ZW5ESXV2VnhvYUxRQ0IzdS82ZWUrMm44MndNMzFtTTBZNDhYNkphU0kycUgx?=
 =?utf-8?B?S1dibGJlVVA2aDRBTXVJSE1ZM3lCUTRJZzVaNnVMYUd6Sm1QSUZWODh2di8v?=
 =?utf-8?B?aHM4bWlrWnBSUkNXK1pDTFJ2Y3orK1J2a3dIMFdCU21XckRyTW92eCtLRzB4?=
 =?utf-8?B?NjV6TE9YL00rckpOd2hjVEpmc2NDeE93bktXaDFGeEtsVWtjdStvVkJ6eXZM?=
 =?utf-8?B?eDNzVUdjRk41SDBYblRCaHdtMmgzajBmcFNPSFNVV3gwMFU1dElkMmRwd1BQ?=
 =?utf-8?B?WEZlUFlhYzVLc0l0YkZrK0dUT01FQjQwRUNVYmlFNEY5czhYR3BNbjRob0ly?=
 =?utf-8?B?RG5Ra2lyUmo0K0M2cDRnWEordldocGUwb0NQS2Y3aTNYbGVkOHY0UVVyeVI0?=
 =?utf-8?B?emZIb0ZYTnhCdmlBVUpBMFUya1ZnNHFqUWg3YzF3Tkcxa2FUZkxvZWFYZjUw?=
 =?utf-8?B?QzFFZUI2M09GY1JwVit6YnQ5VWVKM2lPRkxTSkVKYW1RQmVzU0RhRHdGWU94?=
 =?utf-8?B?RWNHKzZVN09mMFFWR0paeWlEcXY2YlU3SEpaWDV0UXFHL3JGS0IxWVJHd1U3?=
 =?utf-8?B?UEw5R1ZhTG9LQmFtQjkwWC9TQjE4UlY2bE1OYkZEKzF0YlM2RzNmREliZmlB?=
 =?utf-8?B?RzhsYmhsaVFOZUdudytmMUVEUDF0bmswOE0vZ25nTVd6N2hIaC93bkNDT2VF?=
 =?utf-8?B?a1pVc09CWUdTVTFDcGRQUEtkSGg2TXlRTU42ZS9SMDFOQU9HYmE2ZVRIV3RM?=
 =?utf-8?B?SHJzNUU2dmo0eitKZkFHbm8yWndyTUlNYnAxaTczcHdwZTE4SHZHaFVXZ2s1?=
 =?utf-8?B?QWVFdjY2WHVQMUtnNzZudGJFNDU1RlFESlE5K3duYVVTWjRWb3NVVkkvdmVh?=
 =?utf-8?B?MmtXWjJCdzZWZzZ0UVNjQng1S0ptSXpZV21ranhzRjEyNWViYXdHMFBza1lk?=
 =?utf-8?B?b0t2ckxzYzRJQU93ZUx1eml3SDFPUEdNS1pscTZvampXWHZnbEV5ZjFSQSs3?=
 =?utf-8?B?MFB5Ti9XK0hzR202QjVZRko1Uy83bDNJcUZha3hpeHc3RUpURWR5dWF4YkR3?=
 =?utf-8?Q?/UDbzDZKQkHhLJqyfuVoksJOi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c70bcd-2618-4987-ca1c-08ddd6ccb1d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:20.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mym2EfNHYUg0AGGkquccQ5nAwegW/+UehfrH9JfqaTKfVCvK2P1gm8EksSmewLkjUg39oOM7YTdjficmnC9pfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_154130_468222_B16C49BA 
X-CRM114-Status: GOOD (  18.68  )
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

Move platform specific csi2ipu_gasket_init() to imx6-csi2.c.

Create callback function in struct dw_mipi_csi2_config.

Prepare create common library for dw MIPI CSI2.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 28 +++++++++++++++++++++++++++-
 drivers/staging/media/imx/imx6-mipi-csi2.c | 28 +++-------------------------
 include/media/dw-mipi-csi2.h               |  6 ++++++
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 66274d8d73b67b35682bb82a9eb745bb24da7ae4..b7ea710df07cba33465d79ef57be4792c503958a 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -15,10 +15,35 @@
 #include <media/dw-mipi-csi2.h>
 #include "imx-media.h"
 
+/*
+ * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
+ * not part of the MIPI CSI-2 core, but its registers fall in the
+ * same register map range.
+ */
+#define CSI2IPU_GASKET		0xf00
+#define CSI2IPU_YUV422_YUYV	BIT(2)
+
 struct imx6_csi2 {
 	struct dw_mipi_csi2_dev dw;
 };
 
+/* Setup the i.MX CSI2IPU Gasket */
+static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 reg = 0;
+
+	switch (csi2->format_mbus.code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		reg = CSI2IPU_YUV422_YUYV;
+		break;
+	default:
+		break;
+	}
+
+	writel(reg, csi2->base + CSI2IPU_GASKET);
+}
+
 static int csi2_registered(struct v4l2_subdev *sd)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
@@ -40,6 +65,7 @@ static const struct dw_mipi_csi2_config imx6_config = {
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
+	.gasket_init = csi2ipu_gasket_init,
 };
 
 static int csi2_probe(struct platform_device *pdev)
@@ -50,7 +76,7 @@ static int csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
-	return dw_mipi_csi2_init(pdev, &csi2->dw, NULL);
+	return dw_mipi_csi2_init(pdev, &csi2->dw, &imx6_config);
 }
 
 static void csi2_remove(struct platform_device *pdev)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 40a146faaa9c79304b1e1f16e608b3b10eae6c80..4127b927a73aaf2eada1636fcc6101155f41b334 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -92,13 +92,6 @@ dw_csi2_reg_err(csi2, #__name))
 #define PHY_TESTCLK		BIT(1)
 
 #define PHY_TESTEN		BIT(16)
-/*
- * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
- * not part of the MIPI CSI-2 core, but its registers fall in the
- * same register map range.
- */
-#define CSI2IPU_GASKET		0xf00
-#define CSI2IPU_YUV422_YUYV	BIT(2)
 
 #define sd_to_dev sd_to_dw_mipi_csi2_dev
 
@@ -288,23 +281,6 @@ static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 	return 0;
 }
 
-/* Setup the i.MX CSI2IPU Gasket */
-static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
-{
-	u32 reg = 0;
-
-	switch (csi2->format_mbus.code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-		reg = CSI2IPU_YUV422_YUYV;
-		break;
-	default:
-		break;
-	}
-
-	writel(reg, csi2->base + CSI2IPU_GASKET);
-}
-
 static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *lanes)
 {
 	struct v4l2_mbus_config mbus_config = { 0 };
@@ -352,7 +328,8 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 		return ret;
 
 	/* setup the gasket */
-	csi2ipu_gasket_init(csi2);
+	if (csi2->config && csi2->config->gasket_init)
+		csi2->config->gasket_init(csi2);
 
 	/* Step 3 */
 	ret = csi2_dphy_init(csi2);
@@ -700,6 +677,7 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
 	csi2->sd.internal_ops = config->internal_ops;
 	csi2->sd.grp_id = config->grp_id;
+	csi2->config = config;
 
 	for (i = 0; i < CSI2_NUM_PADS; i++) {
 		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index dfd25e23ea93fd53b064471b6a9557ef9c070fe7..d3e1c334df692c5dff10b467d759fe4da45b7b5f 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -9,11 +9,15 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
+struct dw_mipi_csi2_dev;
+
 struct dw_mipi_csi2_config {
 	struct module *module;
 	const char *name;
 	int grp_id;
 	const struct v4l2_subdev_internal_ops *internal_ops;
+	/* Deprecated, should go through phy interface */
+	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
 };
 
 /*
@@ -48,6 +52,8 @@ struct dw_mipi_csi2_dev {
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
 	bool				sink_linked[CSI2_NUM_SRC_PADS];
+
+	const struct dw_mipi_csi2_config *config;
 };
 
 static inline struct dw_mipi_csi2_dev *

-- 
2.34.1



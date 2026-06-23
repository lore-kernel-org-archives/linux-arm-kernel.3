Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9CDCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 03:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdbbm2LnTC8YT7Pg2LMW4drbgfoknWRJhg/Lmqb/5lU=; b=NaTt5X2wIotlpsqJ0UUU8/R3lv
	VFASzeagGfp/Ye8ZCv3nyZGhkB7TRqD1z8qBimb4ilpS2oGFfBH6IF1ZhrmyIqCI8ldYZzF26qksA
	2Me8zw6VMlZUhtZNg15HBMf9j+dhXhUgrmfxKQrP80J1Rq6gX52+9CdLAjqNsIaRBlbzvb1/RaG2d
	8j83mVzyXzr5lohmzXx0F4UlwXROdSoxk+eLBYSbxuPvKqerFpmV+mIy//ZsGeGootBg6Dq0/POKc
	2SluHvVGGTEgM3XBYk02+gZJdy67WfWgsR5rygy2PkXuAjICMBrm60YtwIhakmazOcfsuYoBDw5qt
	GyKu5HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsCg-00000005foc-3zc1;
	Tue, 23 Jun 2026 03:53:38 +0000
Received: from mail-westeuropeazon11013047.outbound.protection.outlook.com ([52.101.72.47] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsCe-00000005fmg-04Za
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 03:53:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOjC3mo4WNjf9ABlJ8ncuM59AOkRGcmQHE0aFdACV1DeeQgylR9AGgFD3lzYzgN/QGp27MCzHDpolj/equmDCeeZhXn0aHPL6wk1Hv7KGI0ZQqkglLNiQAPpV90cFIZxolLJ4xsDOnZZpMBpxjk9tLJQ9SP+dOMo9Y02kybXgNQRgW6a16Bu+30nGUsqeSNtI6cdgU4FZDaYXJBiWeyOMOUEdC9IicQWMittukFmqNXKSD5/UQq/sKmjOmTzYDCgqvPz34MNwqVI81364qoyhowI6lVFSORrkAQYjWGVL6wrz43FNI9z9ZieYBc56QUQXuHxBAdRzHQx9ooO0xwFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdbbm2LnTC8YT7Pg2LMW4drbgfoknWRJhg/Lmqb/5lU=;
 b=IDbUQh6wb2kX7fVvB+xLZj1Qmdxwu2vDDSXM823jywv7FvleYEB4GohX7nswyIm0BvGPiYuuF9ygzaWo/tP7aey22+gLCooDSl3mw59+KYSXnLo24YqsfEb73tZpkSq6pbqWZVnLzTZ7ijW7Zflb5njFX74q4yYwGNW1Xgr8Rob2xI0hirYD5okQ8nCxDUaTFHsJwnvLGacz8auMq7dKBe2CvdwxSRyg4qab+dZEKBC+dAwerwsFrUeLP95LzSLQHHJBgamcdYxrk39W3mEPAkXTd64biDhjXsStikbuaE68Loz5IP5pQxs1la7ui7M9fYIHmAMg1ZbTs0oXGTGowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdbbm2LnTC8YT7Pg2LMW4drbgfoknWRJhg/Lmqb/5lU=;
 b=Pzpaak1zXB/57ld4uXVSzH82huLtMH5dygGASc5mxzcTNOm2UpcL729iX9Cq7xPzhNr1/6UlATEJtwy2jm4HnLI1Il1rGpUXoP/U/pfHmolIGIye8PN8HO1MlUgE/cq5kj1RtcWZA38Ccskqq8F/0Cm6WBBArcvuKJWoa7p97uU7yeqhna9hWTS8e5agH6LZj8Ef5eiT0UKNAM7qK7v7W1SnrbG0kF/Y+r/mnhNp3IVFANr4tJxZeesygyuYdTAbmdMkRBBSn8/hJUbD9SizM/Aka3+2etU7D10j9deVWiH6cbACFkkglPFmlaqSTGbdlAywxARQCv3oL97wqF5Tog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 03:53:31 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 03:53:31 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 23 Jun 2026 11:56:32 +0800
Subject: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
In-Reply-To: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782186996; l=3297;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=2IicYciJwrNT52Q0Jg6EWkmd2zhKmeGNte3MMfvZS40=;
 b=MHA8O1Z+qix2q25LYp5XvSxpqb8fE+6R718H+I0GGKfS+MLd9mNWikKJeNNfiUyBXFk78Tz1k
 zX2fleNqpLjAJ1ytyarlhDVLGRl5+ARHZZgi4MCHtBzXybeVKz2QFZs
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::9) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: 95571935-f17a-45b5-ab1a-08ded0dafdae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|18002099003|22082099003|56012099006|11063799006|921020|3023799007;
X-Microsoft-Antispam-Message-Info: vwFZswsRKCKwjL6ZlCD8JkYgMC+MFxTFbOK0Ci6V0fbpK1Bnn4cdDBJGt2yc73dM4H0P3jFM9j5KBzR0ZOwx9sa4ne5RHhVo7MBbLT7EPAqL4/yXG0620IVUG7/aD06Nx41qID0WQERwJCtRaypRsJIbyobhZxaPGKp8H1kYfxIgtgkNnKrP+y2mgMD1kIETnJyqJXdroD8M1tsJnc0ggfm4TcNjUe5HEqO2z53y/20O2xAKp4clWdC2zvHdl2iEUA4BAjbq0prXmFvev4+Vw8ig9HqtflZ/klULO+JqgapSSjariS/jHADATkAwv8arxuq+MN4sdz+1P6uzHy8q0vIHIQtJT3c7UurTt7M6LjSrtNDizv+0IrbMzmOXsX9sFrmnPHqgWTWyEaFiNTphHYwixMYk4L908igtv7QqR664+l+RI0jz9uSNwt5/CNNV9TqSWIuPVnOEr7Rg4NLrNTp3fec4tRGEAnd0kBhOkBqPaPgx7yohZn0qZQ1jPsu54Chs+2CbbShfkfplfbHGYqQl1NzCWlNXGNXLAIutQeIdv0KR5rvP/ijQJkgNaLBJqHXCLCDVd/4RULi5mXUonoCIcwk56qdReDBRd3J367Wk6/H/6435om57rDFioJGhC2GF79sdp0v1UJMCw5I1kY6tvXzKGrTG0mBHqlqlTyqrLdUJQIBHj0jNKFO16wF1chBiuLwL6zgYPRNI7rVv7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(921020)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVo2VXZoRjlOMDlGWGVVdmhya0NLMi9FV3VXWkUrdTRZTWxQeStrMlRDUEUv?=
 =?utf-8?B?cmxOTHkrMFQxOVNmdkVkNmtDOFdiUlhOVHhXcWdUaXZsWnRWYUZpVUxyYkZQ?=
 =?utf-8?B?dXExWnIxeWVXcmtwZzRPcXNjbEt0M2lBVDhTY1JIdEhzeWF6WkNQWmU3bi9x?=
 =?utf-8?B?cVdST1I0Y25NZmxyMGJHRGloYk5kc1FyTG92ekxCU3Z1U0g0dnZNazZlL01n?=
 =?utf-8?B?NjBKZHhjRDdxNXBnbG13KzM0UGk3R3hXb3Nib1gzbFVDbnhoYWRlbjZpb3hx?=
 =?utf-8?B?R2I4OVV4c1FhcW4wT1k3WGZ1R1hRSVZEbkNwT1JNZEwza2h3QWRBWmZCV2RR?=
 =?utf-8?B?WUpyd0JxY1RsWlpROTVUd0FTcFBKM0pWV09xdkk1akFhREdVSGk3N056QXlY?=
 =?utf-8?B?Ny9WR1M2SGlrQUVXcGJmWXRWUGhzQ3ZoRzNHQW1DN0lpcmlJdnIraUs0c2oz?=
 =?utf-8?B?cU4xSi9SSTNnWXBtdDN6V053T21IUXR6cUViYmFDdEhlTHBpZmo3YzdNcG1x?=
 =?utf-8?B?QXR4NDJNVnNndDNlTXJKbFh1TWdneFE2dTlLTEhXL2ptL3VrR3BtZmFFbVcw?=
 =?utf-8?B?RGVnZFUrelk1SytZQWtkOHhGeklYK1lrTDdISW5mZ0dFbFc5dVRxRWw2T1dm?=
 =?utf-8?B?Tjh2M2VCd0d2Zmg2dW1TN25XKzZGNlpNd0ZmbWw1Ly9DNnY3aHoyNWUvZXUw?=
 =?utf-8?B?UWR0UlFEVHk3Z1o2SUZweHV6cTcwd2NTT3JocDdFTlg2QXRxcUdhMXl2Lzlm?=
 =?utf-8?B?Vm15bHFJcUlmTG8rdFNEZlF4V0FHTnhkejU1djk0TUI3Wk50NGlxZmVlMTRF?=
 =?utf-8?B?eDVPU000RXVQVXJqMFRleU9seUpCOUd5U1lpejlLU29UZTdETEpmTHhZTjI1?=
 =?utf-8?B?NHJyVUVBSjhNMTNSSkhndXF3QS9tMjIzZzdzZStuNjBPa25qTDVsNVBuQ1Iw?=
 =?utf-8?B?UjQxQVZTQTFELzFFYzk0NXQ5TmovTUwrNUV6SmI1c2F1eU5CRUZRdlVTVXNZ?=
 =?utf-8?B?SG1zTzVYV3M3QjlZNlRtTDF6V1BOMEpKaWpJaWl5Ujl0R0VLZjdvM21QakdE?=
 =?utf-8?B?NzFxK0VsYTNOcVhBQTJ3UHlTZEp5d3FQM3dsVnpTeVNwcmhCd0tJSnIydmFR?=
 =?utf-8?B?TnZrRlVSZ0IvODhURVlTZU9JcUFWc1BYc3hQNmJ6N1gxR2FmZi9OamR5ODVt?=
 =?utf-8?B?SmU5dTFBMHZIeGtxWEFtaUtxdTZicXYySUwwMVBSY0Yyc2JNSWU4d0l2eFVs?=
 =?utf-8?B?THJ1RVpESkhBdTkxUGxOZnc3eFpPM2Zrd1BiMTVOeVdkbUpDUUpWRm5ldVdG?=
 =?utf-8?B?ZFZyWjdIZVBmZWdKWm12OFdMVm04WVdTMTJJbG9HYU56Y1Q3Wld2Tm9JRlhT?=
 =?utf-8?B?VklER21LZVE4VDNhaWFJQnhRcTQxL1pSOWVWMmFDQVpHS2RHRFdzWUlhbFdp?=
 =?utf-8?B?TzkzQUNXNVFLaEY4d2RzcGFBU2dWMlZIZUt6bTRzWDJ0RzRDUkp5bjJaZkV2?=
 =?utf-8?B?dGJFSWhuTlVBcGptWGttZFdPdUdncWc0ZktyMjVkUm43azN0R20zWlFySCtv?=
 =?utf-8?B?bGtkdlJRTlV5NUdzeUtBV2d2cnprNERYeE51VnR2RXRPSlRNek5aVVQ3Ykgz?=
 =?utf-8?B?UEhwbGZyMm1uaWp2RjRoSnFTb25SMmRrK2NlVlUvNXR0bDYweVpuUWUzblNh?=
 =?utf-8?B?QVc0ODlTdFNNWERsL3VzUnlwYTRuUTgwazU3RmRHV1BLUC84ejV5cDJVM3hV?=
 =?utf-8?B?ZHI2Q1hiNldSLzZwcDVMLzNvZjJiYWlKcjFTbWY4V1BHOVRDbHo5eHFQWVRB?=
 =?utf-8?B?SFI2UzlCMjlnMEJCZmdrUHR4b084ZGxXa1ZPTmpvZ0NNUzVySnJwQnRjYkJC?=
 =?utf-8?B?YW9zT3RkR3R6ODFPNHRnOTc0dzVDeWEwaDM2UjAzYTVrUDc2RFlVOTBGOURL?=
 =?utf-8?B?TnpmSVNFNy8vTDBBUXFPdGEyNTUrRjZ4ZGFzM0FEanlrM0ROaE9wWGtuUlA4?=
 =?utf-8?B?T0MyL012U21mM2dVOG53dVJIY2dLVS9aYjl1cVJndmVWRUdIT0ZvNTFOZk15?=
 =?utf-8?B?Ym9xOWtzOEtXRWM3Y05Bb1ZOVFU3ajRuRTlBa3pLZ0RsWXRzVWovYW9QbWU2?=
 =?utf-8?B?dUtyOEVMRFdnQzZtcWhoRzFlSml6ZDg3VUdvTG1yTlB2MWNTcUN6UUh1QmQ5?=
 =?utf-8?B?RDkrbWZJT3RVd3FCVmNZNURoanVjQVFUeTJSNkR0VDk3TUlFK3BmYjI0eWo4?=
 =?utf-8?B?MTFIV2R6Vzh6b24zN1FZWjJYZW90eDF2QzVtc2FnclNUQk5uMVR5SjRsaDcz?=
 =?utf-8?B?WGNSOXlXaDVvaEYvVWtLYkQwMlBTMnRqRzUrZk5vbldmVERsOXZDaXR3MmVV?=
 =?utf-8?Q?CK3bCKCJ1F0pfMphFbBVRW0SkKw3fZgetFRyS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95571935-f17a-45b5-ab1a-08ded0dafdae
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 03:53:31.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8abZQ0+mOb3MBDk21D0+QyjNGMTBH4CejInoTeMnWUFdxETl5xUN9FAVIGVTh4CtbSF5Lw0KBqXNE8I3r2+++aobfDI2adqRvGDzCkJ1OqDW1H3uA9ZMPbzm/4aJI9nr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_205336_072225_4198309A 
X-CRM114-Status: GOOD (  10.80  )
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

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The Camera CSR contains control registers for multiple CSI formatter IPs
at different register offsets. Each formatter is an independent hardware
block with its own clock input and media pipeline connection.

Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
with 'reg' property specifying the formatter's register offset within the
CSR address space.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v11:
- Move properties to top-level and use if:then:else (Krzysztof/Frank)

Changes in v10:
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message

Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..fbbf1b3f1790 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -39,6 +39,18 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^formatter@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -46,6 +58,23 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx95-camera-csr
+    then:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+    else:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        '^formatter@[0-9a-f]+$': false
+
 additionalProperties: false
 
 examples:
@@ -57,4 +86,46 @@ examples:
       clocks = <&scmi_clk 114>;
       power-domains = <&scmi_devpd 21>;
     };
+
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+      compatible = "nxp,imx95-camera-csr", "syscon";
+      reg = <0x4ac10000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 62>;
+      power-domains = <&scmi_devpd 3>;
+
+      formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&mipi_csi_0_out>;
+            };
+
+          };
+
+          port@1 {
+            reg = <1>;
+
+            endpoint {
+              remote-endpoint = <&isi_in_2>;
+            };
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1



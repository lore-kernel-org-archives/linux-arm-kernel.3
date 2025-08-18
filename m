Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6232CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 01:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAT44i22xPti9+SCUh3+e4F+kRk9IbAgoeuYMSGXTzc=; b=PjQ5Jdg1Frbn1fH8VNkeEQozCp
	b9Iw18T4Em40qqJg20BZ9xDXJ9WnSGSSLRz/zfOqEw5EtwxTCKrnOdOvn3xBaGdR24RLCa0vOaTIh
	hVpgMwbUlHzy1z1LELzdfKuejSW1QziXobWLrcjGvRslQZslJtdUyzd8seXBgtLl3j3DiLZSKKTBV
	jqUQ2D2a0nmtIQqCYK9bQw29x2vvob9qHo0haumzUu4OYQKJoLewa3wmDmLIXD1PPxKjkbLiHt4xy
	wZH3uePoT2BE3IKogD7TUI70IwYVAjoa4u2Lbdjem3M7PxNYGy+LtOK14YeHEnWX1zuE51VjsaCb8
	gUZQTmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unofx-00000006FCg-1JBx;
	Mon, 18 Aug 2025 01:28:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unodN-00000006EgN-0yiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 01:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+y11jDvL4i5QInoxYAEIuKFUr+jl0347xeUS7bfMKMjcqHjCkcUN8ZPPwzmC/yPno6LC48Nv6aQnD5NsEbuyxtfkra98uzhmJt0hDPbBLICXc16KAEmdIRyKIFOtRMLT3KB53y34oekJsXDTYbsGkedV/oaF/2f8biAjIGVAQdd+UAlyNshkcBeFo+gLS38N3stpSIs51ZXLeLdMFuxhfzgHYUkjzLS3xKawsKhI/dXHCicd1n06HFxf66gKPlv/P+ZBLdCm9QCZlONRiQqAonZoCFWVzs2q6wDFk/qqxsgxDEciOBxzC0TiVGXX5ByO6zTQao0xGaUq/cwYWsjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAT44i22xPti9+SCUh3+e4F+kRk9IbAgoeuYMSGXTzc=;
 b=P8IsoGWOOCzwhkfvI+TOkfSVrUPQoLtf9LklGsnx5vZzO+pMLuEMsLpUgMTPwU6jUOg4Za8pQT3GMyXVhajiP8LCOdUvBqZealD14xsTmaSK7Rv+hmarAvfEjKBc+Pw3J9tfDjX+ccIqncTEusAXznpFRMDhTvkT0bbn4NQJZ3QL96gOP2nOr9vKVlMrc2vn3eMp8smfCzAIlWtYv24mPPK5jxIctMLrivrU+VsMGRz4OD/voKvsqzAocNMRotJnsJGzoZoSQM7sdo+OWFxYiOOE+xv0PTcVR9FE9Y9drf/0UnVa/QPtj/PkAxDbXtvUkCIMrTVeggIAUDAcxyI7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAT44i22xPti9+SCUh3+e4F+kRk9IbAgoeuYMSGXTzc=;
 b=FlcsuUywrt4E5hr/4zthJLj1WgdspF1gGUXDBlp8Y9TqbfcgHGN56ijt+YZcWpa1zHOp8NmF0rAzNh3oFer9F2ez9zC7clkQzmKvoC41aGMUXG3WZiCFDr2ivyEXJdftx+zhpRxf+aZImfpGvEW5rIp4jffzJp3lq4ncG7e3OBoD6MQwVKO+r+ULvfszNNyVNIQCZjoHa1afXXBVX9OQg7WW9f/NuMY8ObgTy73X3gVVQu/zT3k8wjwJ/XCTHoGkB+hKPtZxLcEof1SAhO/MlZJQiR6hRopLyuC/74OlkfLLwJ1qoAcG55c9+xVOxyOESlcix8qJMQ2lLl408qVChg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7388.eurprd04.prod.outlook.com (2603:10a6:102:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 01:25:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 01:25:49 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 00/11] arm64: dts: imx95: various updates
Date: Mon, 18 Aug 2025 09:25:30 +0800
Message-Id: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqBomgC/0XMQQ6DIBCF4auYWZcGULB21Xs0LlDHOgvBgCE0h
 ruXmjRd/i8v3wEBPWGAe3WAx0iBnC0hLxWMi7EvZDSVBsml4jdRM1pTx6Y9MK2buR2M1gZbKPf
 N40zppJ596YXC7vz7lKP4rj9E/ZEoGGeoeYdDg7Xg6mHTdh3dCn3O+QN5GGL8ngAAAA==
X-Change-ID: 20250813-imx9-dts-664f7ba66ae7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Luke Wang <ziniu.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755480343; l=1906;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=eWQDqAjqpf81e97XZkCs6t/2c2cPbt0OrnTZuWZYjoU=;
 b=NMQKbDED2SA/KH1B1uKhaYm0pzSPOTpmRsrsy4FxTaPx+5jkl7iG2pZwZuMDaV12j+WQ4QKrF
 pvzIEuAe09PAcCc6kUGRx1rNuW6lzQaZBARkG9JDhD8NM860db9t8tp
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaddc68-d209-4797-f796-08ddddf629d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WElkYlhmYlE2MGNZRTNJRGRTVGJGa2lZTjRLQjJ2dnByMmZTb1lOK1pqLyt2?=
 =?utf-8?B?TkZqNjd4ZTE5UVN5TldVV2QvczdYem15QWxqck9SY3ZXY2hRTngrbXcxbGZ0?=
 =?utf-8?B?RmhNL29oMFc3R3p4S08zdDcyemFLaDBWNC9GMjE1aHdSNkNINWcwNlRJZjE3?=
 =?utf-8?B?Q3lSeHNyMDhLL00yajBqNC9HOGFDTUxtQ01jaVN6NnFCTlY3NllFN3JZK2ty?=
 =?utf-8?B?MVp0eEZ4TEZmK3RNNE1YeGU1NVI2cmRGb2NrREZlRm1seGorYnFXTHVzNFJj?=
 =?utf-8?B?R3ZDWS9UZzZ2RU1WVk1BejlxQnNhUk1ralRuVHpCVW5rTzNLZFlOSVZlTC9N?=
 =?utf-8?B?TzdRTGxRUytCY3BYRG8yeW9DZmZrWXdUckx1QXBXVGc2NFVkREQwT2lIU0la?=
 =?utf-8?B?SDlhU05wVXpueDRGLzNIMXR1Ykl2ZHl4aUdYQzFsVUFTKzVremZUSFRZVmwy?=
 =?utf-8?B?c3J4ck1zTUxKTXV1Vmg3a2dkbDdjdUlrZDlsNnJUY3ovdTN4bTB0TEM3ZldC?=
 =?utf-8?B?MnorMlI5WVQ2KzYwampHWmtVVmtPK09walY4Tk9CSU5lUkpSTFY1UU1UZUxl?=
 =?utf-8?B?QXBod3BrVlZHN3VQdDJ5TmEzVThzN250aU8xbUQ5WnJ6V2x4SGxJemN4RHR0?=
 =?utf-8?B?SVNZSjdON3k3ek9FZG4vY3pHQk9UQUFCU3VDM1Q3QnBZNk5XYWN1eVpKdkl5?=
 =?utf-8?B?QkdneXdFQ1l4ZUZPSjBENFg4NFplUldpTHJ2Mk9vYmlOVDlkRkF1bTVROUFv?=
 =?utf-8?B?SnF2MlF3a0tST2Rmekx3WU1YMzZEcnF3OVBzVG55eGZTL2orMnNiMTYxK3p2?=
 =?utf-8?B?YWxlRkRwZENtNG5IYU1DVFo2b3dRKzZpR2RMU3BaTzFnYWxSQnNCVzhvTXp0?=
 =?utf-8?B?Lzhic0VZU3dqd0t6ZmNXdGtuZUgzbURCQmRVOEZ1c2Y0L28vaUhRSHljSnJL?=
 =?utf-8?B?NDkrVHp2OTQ0M1hDSkpldG5mWUo2K0x2Zi9uM1ZtSU5NWjQxUGtDSUpJa0N3?=
 =?utf-8?B?THE3V2trL2I3TkR6VGxYUEVOc2w0MDVmRXRXUjZCZWZZcmFkTzVXNitrR1BI?=
 =?utf-8?B?VGI0VmoxZlBUazFVNEQxUDJiTmpjcGN4cW8yd1pKaTNxUFQ3UUFBTHpwWHhG?=
 =?utf-8?B?a0pJbE9ZakR3OGVVck4rZGJhRTlYUmtsV1dpUzNPb3BUUWc2K2JLdTBCZGxB?=
 =?utf-8?B?RlBUT2FFT3RORTQrS095Risvc1ZnUUxmVFoyM1JHUGgzcVpqeXNydmFzSWlr?=
 =?utf-8?B?bkFGbk0rM01VOHZEczY0QmVXSWhEZmx2VXNEVDdBenlLdk8zK3pLdG80OEly?=
 =?utf-8?B?ZGRlaEtsNmt5cDF6dVM4N1FWUEFKZnJndnFtTU45cXBHVThYM1E5bi9RZ0xF?=
 =?utf-8?B?STN5enltbVZjK2MyNndaUDZ6RGdWcmJLQWdkSEd1RWovNXdJbzRRU2tpSUJR?=
 =?utf-8?B?RVlOQnNIS1NuVnpqMHBuS2VFSXV4c1pYVmlEaFJKQ29DOWxoSFJZOE5hYjJN?=
 =?utf-8?B?ZTVCZHVUM1Zla0QreDFwTG1tM1NPWHF4NGVnanRsQVVPS2k3UWlTTnNkYTBD?=
 =?utf-8?B?d09xVFovbThNQXNibDlwNkVmdHR3RkhDanh3ZnBWL25ZQUszSGs4Mzd0WUR3?=
 =?utf-8?B?ZlRIU3Z3RWRiQXFqY3pEcjdMcE4rdksvUy9rU2Jtb3BSYnJMR09uc3NDOFhp?=
 =?utf-8?B?OG5yK3hTeW16WnI4R0FBeSthSnVvcWpqTVJZZEdMZzBNU0dKVWtaeXBiNDdi?=
 =?utf-8?B?clpxYVJlNWRMcFJHajRIT2MvS0FhQ0huaTRrMGhnaWJqOVA0SS95UUtpczRM?=
 =?utf-8?B?TVozODdCaUNvYWlUSE1GUTRkaHo3NEJCZjFtdGFEZkE2ajAyUVlQTDFsRk5O?=
 =?utf-8?B?M2lWT0NxVXhXK2dkZFc5d0hHRmRhc0xtWmxuNG1sR0c2OGRxRWdlY0VxWC84?=
 =?utf-8?Q?a5G/wFpILP3goOqTkf3N+lXcWe6azwNf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtyNUxxSnZhUTQ4S1dwMTdDMFdacTNNWXVIdEtuR25ESjgyaEdESmprbjUy?=
 =?utf-8?B?WldqZWVKdHlrQnZ6eHZMRXAvMFh6a0VoeHZOWDl1VDFqUmdpb1NENHJtakF6?=
 =?utf-8?B?a3lzc05lNHB3dmxhaVpTR0Z3V3hQTEJCdnJXK2M1bEJtQzB0ZWdhOHJtckxw?=
 =?utf-8?B?bXkyYVhad21KWjRBWmJxeHlGOHZTcjYwaWxVOU9lRjF5Y0VsQ0V3TG9yUnIz?=
 =?utf-8?B?Q3FGaFNmMzQxdmJxTUUyUlhvOFBOc2g5MlQ4NEdnUkMxUDZJWndQT1JzQWF1?=
 =?utf-8?B?b010U1JFNWFJTjZNbzNGVlpHK2ltR3NZVXNMWVZTQ3htVHU1L3QxbmE0NDZq?=
 =?utf-8?B?Ykl0S21PdlcxVGNKaHViN3IzQllDVFEyK2s1OXRYRklQYVJDSnFSS3pwYk81?=
 =?utf-8?B?K2tWR1J2dTJRWHhsNTdadDJZMFR6WUlpQjlXYk5VRVpsdS9vQVNMTisrY2wz?=
 =?utf-8?B?b3gyOWR5MCt2ZUdjekxaU1VmbXNxNXhQOThMQUo5enhmUVJOTmp2OE9uckZm?=
 =?utf-8?B?MTNEYitxdnpLa0RyNzhXdXc5ejd2T0Z2V0lHMGkxWUpURndxRHZOSHBKNDJS?=
 =?utf-8?B?QkFYejAzOERmRnJTNVFSMC9tUXhIQmdneUtkVSsyYTB6d29GOTUzeXhDUEQx?=
 =?utf-8?B?SGJ3azRlQkl1K3dHUnA2VnRXa0pBSkw3L0g5SEFJN3ZCVC9qc01IRDZ4UHJN?=
 =?utf-8?B?UThmTkpUWTRGU3A2QTcrU29PUWIzQUs1M2dpbEEwYk5KOHY3NkZNblFZNmxw?=
 =?utf-8?B?MEc0eFF4cTJIRk9xWXoxVUR2VGlyVC9oS2wrMmpNeDVqcXl5b1pQR2FWK3VQ?=
 =?utf-8?B?Um11WVBQYzJETVAyMklJOWd2MmNuRXY0RmlXeXF3Mk1QQ1lnSGprT2RiVmQ4?=
 =?utf-8?B?cFZtdWJ2NXBUQ3JQQ25JV1NUVkh3NytPSnVhSUd1REV4Tk1PRnhLZnFLb0V1?=
 =?utf-8?B?ZTFWS1hNMWpUY3B6TFBnR0R0YjNuSnJXZnlEWm1wbXBENjNmVWxBanBhNnUr?=
 =?utf-8?B?MjRhTmRvQlo3SFpFdWNwS0t1aG1TL1RROVFpNzNaaFVxUDJyWEJRdTdacEJ5?=
 =?utf-8?B?QkFibk90VTZ5ZitmNFdreVc5cU9RTnhPWC9sc1l2UElFZUU3a1planAxRUtN?=
 =?utf-8?B?c3hjdU5oVEpNS3BqYTlyazRsVUNmVVE0U3I5ZDdMaUhXUXl5b2cvSFRnTVpo?=
 =?utf-8?B?Vkk3V3VjOVdianh6WGRvbllTU1dBdjRUYVlSb0NBT1RDeWNzNkJLTE0wR2wx?=
 =?utf-8?B?eEE4RmFtOEhrWHFwaXlLLzE1L1Q3bzdPbG5JbHRIaUdEZHFMSkJnQnR6YVN6?=
 =?utf-8?B?Q0RIcGZJR0R1MzkzNzNrcGV1bkN3YklJTjBWWXZ0cWNLODVYN2pCSTNEekVJ?=
 =?utf-8?B?b3dxSDZMVTVyUW53VjRnMDBDbW4yNnNaVHcwOWtYdU41S3pwOHUzcHpBUm1T?=
 =?utf-8?B?VWlNS3Jmc3JCVmVvVGUzVkFvdUZMcmtWN2I2SUhrYTg4S0ROYjBPejBpYVh2?=
 =?utf-8?B?Ym93bTBuTUl1M1hhcVdJcTgyazlPTERSSzFtcmttMUtmQi8wY2MrbTRXd0Zl?=
 =?utf-8?B?OCtuc1QxRGlLZWVZTDU2em91STJTOGh6ait1ODN6VnNtdW9CZ25kejNTekRT?=
 =?utf-8?B?Q1JCR0JodExmd05GdE9MREsrY05VbTk1bC94b3NReURXTXEvMXdCdXVzSFhL?=
 =?utf-8?B?L3Rua2sxN1V1Ri9zclpQcGFHVGxaREdSUzBmdjBoMjQ2VkNyVjFjUHJGOEZZ?=
 =?utf-8?B?emFONDBzM0QycmtWdmVtV0hjdnpGclRmMnRhMVVCeWlpeDdINVJVbmhOWHlE?=
 =?utf-8?B?RFNKSThCd0ZXSmxVVHYxLzVEZGh2NEUzN2Vyd3lyOURuUnNObjNvbFFUYU9j?=
 =?utf-8?B?K0NLdG83cjdWbDFxZ3BWUVlkdVZvY1lMZ3VVbzFldTBqY0prRFo4WFgrRTFJ?=
 =?utf-8?B?Nk5ZSGRsNVJTUzJ6R2Q3OHgwQnpkYUdsdUJnYVphSy9ad0U1Ym1XMlBNRVVQ?=
 =?utf-8?B?b3F0OVVjQXpreTJVR1hvdzJGQ2YwWit4YThnYzdLWE83ZUNWY3FQMGFKdHBO?=
 =?utf-8?B?RUliSGpFU2ZLRzhCVkpTMmp1VXQxWFVjam1wZ1FnVnNyNmZJNGxRSmpMUmd6?=
 =?utf-8?Q?3eTdIjda5E+KfTIK9gMo1fzCY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaddc68-d209-4797-f796-08ddddf629d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 01:25:49.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtrAHD2cH5yRczDnaM4BQ1AOy8YlGf9lP6goeHG6y3hLyO5MbW96918e6sQ0VUAPZwFbm4GPG0X2vedIbCGJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_182601_300196_B4D20A21 
X-CRM114-Status: UNSURE (   9.24  )
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

This patchset is to upstream various downstream changes.
- Correct edma channel for lpuart7/8
- Add System Counter, SCMI LMM/CPU, V2X MU, coresight nodes
- Update alias
- Add pca9632, pf09/pf53 thermal and etc.

dtbs_check will report a few failures, such as linux,code, db suffix.
The failures are not related to this patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Drop patch 8 because dt-bindings not ready, and patch 12
- Per Frank's comments: Typo fixes, node name updates, sort properties
- Add R-b from Frank
- There is still dtbs_check error, but not related to this patchset, it
is because https://lore.kernel.org/imx/20250718094723.3680482-1-peng.fan@nxp.com/
not applied.
- Link to v1: https://lore.kernel.org/r/20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com

---
Joy Zou (1):
      arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid

Luke Wang (1):
      arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2

Peng Fan (8):
      arm64: dts: imx95: Add System Counter node
      arm64: dts: imx95: Add LMM/CPU nodes
      arm64: dts: imx95: Add more V2X MUs
      arm64: dts: imx95: Add OCOTP node
      arm64: dts: imx95: Add coresight nodes
      arm64: dts: imx95-evk: Update alias
      arm64: dts: imx95-19x19-evk: Add pca9632 node
      arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones

Richard Zhu (1):
      arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator

 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  29 +++-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  94 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 165 +++++++++++++++++++++-
 3 files changed, 280 insertions(+), 8 deletions(-)
---
base-commit: ff837884a4642382a24d10fd503acf2c3a472f10
change-id: 20250813-imx9-dts-664f7ba66ae7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



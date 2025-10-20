Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5068CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3GUMumh+teZWTZ4vudZ6NTEHXfTx6NCYw/vq349eRA=; b=2ZssLU0Rl5yMNUnamXmNQwf8MQ
	pdWyD6tSk0VNYTAFnTyA+Xvrz1+ZRB6W4IuHLaXQI0yAAzya2M1SUdQjFKHozv6b2dR2CZEn9vlEg
	8ma7e4zRIodlaYEN0lRXpyg6Eix/fmhGB30tISKxb/WjXkETyd4UTf+FBTZ1c5fLChdm2Vv+ZY/oG
	yZ961vYESLp/MMlpOu8HONiWgk9ow6kRDsX2nZzh4BLQsEk8dsyiJp1G6Q88LwuFGENU0O2OF7O6X
	wNLFwd50LfcArOFN7AF059Yyy/yeDdJ0ejxeWEQHB/EaM4aH2nmfB21dCaHQR+1sxSaei5O3jYleR
	vzHFW8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx83-0000000F2XJ-3Z17;
	Mon, 20 Oct 2025 21:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx82-0000000F2WS-2eCR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 21:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P3GUMumh+teZWTZ4vudZ6NTEHXfTx6NCYw/vq349eRA=; b=ZudQPgmWHiDVFtnFrw32tx1f19
	gL68VK0Dzd3BgBUs3DrFhC7n94yT3CvSZStNyVkj/s5o1WWebVOqXbAdKDK3iPkjLfUEyM+NjanEU
	fYmu2SIBiTm7oDmay124x+5p26iOS7jIqu57UH1kjPILAf5bUJA8lQ86Bcj+u9YzaxdPjC4nWCL/J
	PtL5njg7EC7MoyV42AiLzxRovbNudR61TxyAkvx6FM65YlzDGXmdb7PjYrwhbM3D8hFYhAGPHNp5s
	TKjHbfk6dSESWxK5tksXH7FFmxJOQsZcdaHHojZErBtm0UGq+XObhiev1mHke8KLwNr/wLGRNfOCr
	K5u6u8Iw==;
Received: from mail-northeuropeazon11012053.outbound.protection.outlook.com ([52.101.66.53] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwFz-00000000Eca-2p6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKj3a4+dqqD5dK4+EHNLhuqn7/L9syY3QhO64GuDuBvJYjN1SMluPz3j7ZfFSW96W7MlzvOZPX50KzO6IVDO6ViJQiIVjMdfQlBQslfCmiDH6NkVKLkW87Vt522veI0YclzWPQJuR+cs1cobCjLx5WUnDr7EbGIQ60o01pOCc9x3KqQcQWMD6VwHd32Fg6e1GidstFuLg1B25nDtk7gw1FoIQ+nfkZYvOgSq+JffqoPOw76ZmMtn5Swh8NCsPhXjm3QxAB74EKgTxnO1fDEABAXXLdo34TDkNFr+6Mdm/IQbbQ+bC+yooIEkcnMAxPjjvzY8vxeRQRxZgPMRDj/h/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3GUMumh+teZWTZ4vudZ6NTEHXfTx6NCYw/vq349eRA=;
 b=HjhjDps/5k+Oz94X4e2xdby+dEPeq0Is/c1UqtDfBzJ0OwxzNlQ3C/7W1hPoc75NuwS7AAz6uVsR/CJz00r7AhN0BovMjt5Trv3sOxCoOBL4+PfPOz7Zu0WVhWje3MUzBVS+LDH7sWpa36KEOIUSFJC6SBhHhlwE33wEJ7V+AGAPvKiChrYnfvbGvLXKn9CaxhjO3RbYlliiKTVvFLqXpxE+PIr7qOOmr7MBI0yFqN6BDdP5tzKQeXP4b9s1bX3N/KKwqHAGBAzNSOYkTUckD2XTMqHVpBHg9mXiICsXMe/rinxXatJsKR7P9/1lHcbpVEL3O59tKOKNbujnuGBgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3GUMumh+teZWTZ4vudZ6NTEHXfTx6NCYw/vq349eRA=;
 b=eZywaLocFgu7j/5lNDxlfZ/1gKZZd1+41XhqWRw/LMsfAG1ny+W4ShEP0IKVd2AwruJFkCytjHreLgix4MAn8rG6fPv4iebZ/IMmkNebalkFm4C1p3WElzE4KtG8hDzi7Kh+HXKcn1SPfQRs55E5QMg0KdbzzDCpClZvsSZky2jHh4aKGtM51Xz7xr9o42vjoGCV3VcdM3SdT/C86/F7RzSzTTknJyj5DogpQPMtaPxTVpV1syGPl7a6rfTAAg5MVc2ht61Hz/jlkDZmoqqY5Zg7+qZldlyeYgKVt4Jmc8U0XZTbQ88muZU33xPqCQU3sNlMkOxtiYkBkEB+azTyXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8105.eurprd04.prod.outlook.com (2603:10a6:10:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 21:07:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:07:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 20 Oct 2025 17:06:43 -0400
Subject: [PATCH v2 9/9] ARM: dts: imx7ulp: remove bias-pull-up
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-imx6_dts_clean_2-v2-9-3c12ead5094c@nxp.com>
References: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
In-Reply-To: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760994408; l=901;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pyQD8YyF9CeOnUCkIs4QWTW5456EiPnOKua/sTX9ip0=;
 b=ezu7rfwUBZrMiYjn82LYlqSO+Bi3dwV2LCMUO/k1uB+aBvqfXVUmYhuk0Zi6BX/vxnPCGamOL
 YqaTTyvVIQwByseObAZeW2YpbVaXbdNBLkie1rg3wSSFIy+KH6pAI/M
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:510:323::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a817cad-0040-47e9-5b34-08de101ca9e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdDQlJJTzV2VzNNQ1JheFptdDlBODJ0QytydVloWDhJdVRUL3p2OHUvL29H?=
 =?utf-8?B?aGR4ZDFqbi9DeUkzUkc4QzZLOU02N3JlVGR4VEhXb2RYR2toeFIrc2F6eU5k?=
 =?utf-8?B?bXZ3NzFRR3d3Q1BFSllvTGxJbmhkNThIVWdqK2dKYnVGYlV4S3J6c3g5SVdl?=
 =?utf-8?B?cWlJOTZPdnZ5OFJuWHV3S3BwMEZtQllobzlxNjlWbDNBazBSVEFjbUVSQkl4?=
 =?utf-8?B?MjRZdGVYOEV2OEZtY3B3RFBnN2R3SWhJaDRVMEFycy9ldWZuR2pzcnBRSE1B?=
 =?utf-8?B?Y2drVlJ1MnFlS1M2YzBsREJFdzVMMkJSVmpTSS8vUVB6WWZlcnBtUDBEMEdE?=
 =?utf-8?B?OXliRzR5VGZsTWJZemxoMUNNczhuMndVWWFuMDNId0QwQWgvRWg4Z3BWaUpY?=
 =?utf-8?B?TkZoMnk5UTFwOGNOTWFpR0xUdWVmTFpubXNGaGg0K0NMaVdZenV4RlBJWERD?=
 =?utf-8?B?WU1vVm1BaTMyZVozazFnZmMrLzdZL0pnellabEhWZ2pvR291ZDZheklhMjRw?=
 =?utf-8?B?VU5PclA5MVVVTkNjeGw0UjdMaTdLaEpuL2o1RzVaNWRBc3JMcU5OSlZ4YkFG?=
 =?utf-8?B?TENma0ptdVl1Y29aL1kxUDRaS0UyZEprQ2hGdGFab3VTZHRJZ3d2ZTJZVE5G?=
 =?utf-8?B?anB6ZWxKK256TDVabHFuUGRia3VNK3hHcUVZRkE2QSt3cHVMbjhuOFFtMHZm?=
 =?utf-8?B?MHp0QzZkNnZ5UlBxdC9IK0pJaC9MYVVnb2FmRlNOTUZETldDcU5SbnV1WE5V?=
 =?utf-8?B?UHVBUDlQbzVZdDhwdXB4VmJlN2RzMCtrTHlUcjViaWtTN0IzMENZTUV6alB2?=
 =?utf-8?B?ZHFMRUQzVmF0Z3QreTNSejNiTVVmNUcwdDBvcUlYemtJK3Y2NnQwM2czaHFn?=
 =?utf-8?B?WTExdWx2SEpWNzRmY2RWRVZhOEcrY1lNNjEydm1hcUtiaVRBRUxIanJFcnVi?=
 =?utf-8?B?N3Fpdkt1RDRlV2xkVEUxQmIrTUczVEFTODNXQ3cwaG5Sa1JsT0lKUm5iSEZO?=
 =?utf-8?B?dkZmMEt1cElHRHZ0cUoxbW8xZHpmZXV5dVdVelREeDl2dThiVVY4eHNBUHA1?=
 =?utf-8?B?Z2d3U3VWNS96NDQzZHFVeW11Wmo0a09jSWZYMnMvYm1xemFGRHN6ZDVkNTNQ?=
 =?utf-8?B?bnA4ZGFwWTFIQ2pJMTRzZDFiVzg1SEo0SGlCWC8xOU9YT2NtdmdTaUtnTVY4?=
 =?utf-8?B?cHBFNDRUSmgvbWdyTjRlemZJdzFKNndtZ0pydHNqaUVwOXdCbVJvVVJxT2d5?=
 =?utf-8?B?RU1nUjQ2MkIwY0lKZ1MyWENTRU1CTFBUbTdHemlWUWoxUEN3K201a1k5ek15?=
 =?utf-8?B?UFcvNnhOUlNKTFJZTFJHMW85N2RlakxwZ295cWhQOExXU3RIQjNYRXVGL1ZT?=
 =?utf-8?B?V01uRUkreDIzdGpvdHk4d1QxbUFndklaQjkyYlp5T3VIQzYvS1dkK1lYSkla?=
 =?utf-8?B?bGxFT0wyUU5IbXo4bW5xTFpWZ3grYmVsRkxHUHpPSU5ldTVCaUhQNnlRNkQ1?=
 =?utf-8?B?YVN0K3FUaGczL1AveWZoNlFrK1N1VjZEM09QTEFYNjZGYkpjUWpWTVNKM3A3?=
 =?utf-8?B?N2VLUXpDN1F2V1NJNUNqU0RwRDBsQXpNckQwSFRZZllIekZmM0tHS0RGdTgv?=
 =?utf-8?B?RkxuaFFQQ3NBVWZjN2t3NG1OUGY0RjNpWTkzN2N3eGg3eXNnWVQ3ZHlqMTdp?=
 =?utf-8?B?RG8wNUpMclRWQS9tQUJVZnkrNWcydzBTWHZBVUp2YW5nK1Exem12WDdiUm1Z?=
 =?utf-8?B?bk91b2Nsa2tlMjY1RFEvZUZZZnE2d0o5SER1MXJzcGRFYkdnb25oQk5teFBM?=
 =?utf-8?B?QzhtTldpci91VXo4WlorazdxMXR1bitZaFhTZkpwZCs5Y3o2c0FkYU41M1Nk?=
 =?utf-8?B?UEg4Rm9jdy9heHJyZTN1c3k3MnhJWTliTXV1eUIydzlIRDNqa2pqOE9vOTNL?=
 =?utf-8?B?ZmY0ZFFuditJand5Y2pkclB5bEJzYlYzbW9nQTBRTkVPMWVRWVZnUTZiRkpj?=
 =?utf-8?B?OWtIOGdCcmFUNDNrTk9HWGxzdTdJaTg4NkFpNHpxTlc2clN4VDl0UzlkcWFs?=
 =?utf-8?Q?lBS+Kp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L082TlJKUkJDbEllZTdNU0Y5dmViYlY0K1dIOHAxa1Nyd0RXNlFQaDEzdHJB?=
 =?utf-8?B?czZ5QkdEN0NVSUFvZzh2MXJDZXVCMUhVam9sRllJNmFmUkVCUmJxTEsybzRI?=
 =?utf-8?B?NFIyRUI5N1lwNi8raFhSVHN3eFNIWWVGUkM3YldBbTRIZytOZFJrQ3VMdVVV?=
 =?utf-8?B?VE43NThGVUFCSzJVY2FPZmVyVVJya1Zndm8rZlFDdnJ0bUE2ckRWa3Z5ZFJr?=
 =?utf-8?B?Skh5RVRSblJWUnB3TWx0ZWhpME0vSGlCTG1BK2lXS3U0cFV3Tk9IUGxwS3BN?=
 =?utf-8?B?OXUrYjUyMWlnVlNyMk5oQ1J0cGJzRUJUa01majlSSzcxN0pnNmI1K2k1RkVL?=
 =?utf-8?B?a1hSa0hPeHZMamlqMWloZk1rUG1EbVNKTjJGZzBzdTJZNStsdENOT3EzNkh6?=
 =?utf-8?B?K0pRS1hTSFNzdDNtbWZZYzRCVTBZc3l2VFExTDJFVDlIb1diNE9JVGI1VEtt?=
 =?utf-8?B?ODMvT0szWDdaZk1hNXJxQkpQb1ZnMFM1bHR0SW9HeGRUS0I2QkxlUjJVWFR5?=
 =?utf-8?B?bW1BQ0oydnhtb0dhRjcyemdUelVDa0tUUXBXTE9PWERid3hzSUZUZW9xN1Zt?=
 =?utf-8?B?b1NOZngzY3E5d09VK0dMa213YjI5QXZ6VjRlVVdnNDNCRlZYYnZpeVNGMzJY?=
 =?utf-8?B?MFZSS2ZRR0UzNzEyaVVqa1R6aGx5TG54TG1vSFk3NXZnNno5NmUxUUtxamxU?=
 =?utf-8?B?WGZHOGNheTRTVGY1bWg0dDh0ekk3WEZKMkhqUWtEc2YvVTBqUW0xZjV2Q2la?=
 =?utf-8?B?cTQzKzFYWERHcmNZaWk3M0E4ZjYrRy9iejI4bk1neFFQNHRTSDZiRkpXK0xn?=
 =?utf-8?B?VXdMSDUvcnVxaHZqV1pJNEJRNVE2Q2hxeW40dlY4NUU4SktybVRtbHlJVndJ?=
 =?utf-8?B?VDFtdC9nOFloL29ISGtSTUN6cHJHamxndEQrOCtkTWEycFpPWGw3VlFJWkU2?=
 =?utf-8?B?SFNKVWJ2RDVQN0tKd1dXOGk1anJFbEpLTTgzcE1wN2RFdVZrdVpmOERoRkJG?=
 =?utf-8?B?U0hhNGNLTWFDSW1NMXh2ZEt3VXphNEFnaU5BWTBCem5tZUVNcXpwSkpxamlI?=
 =?utf-8?B?QlV6UWFsa2ZYWU1qbE9rTjRTMEFLQVdKZEZ6TnFTTmFBZThGZ2pKZlRyK1h5?=
 =?utf-8?B?OTlBcThITmdLSk8rWDRDZGp6eGZOVG9sWEQvQVhkRHdnMm1NQ3RoV1hzQTZr?=
 =?utf-8?B?bWswVlZ4WUFrR1d2OTFEaGdRSWhicG05VW1yMFVmSlFveUNCUjh5dk9ob0JP?=
 =?utf-8?B?a29xRTFjOVF4eG9CYTRNakFWakhXeC9RUGNZS2djTFgvSXdGMEpQUkpxRmM2?=
 =?utf-8?B?eFZOUGtuNWJGUUdJZmluc01kRWdTRlN6S0MxVjhsMTVWUW51TWpTRk9OaUZM?=
 =?utf-8?B?SWZZRGFVU2w2amkwOEt2eUlrNTRIRmdPMC9HcjVPMjZlYVBwOEhrQ2dwQndj?=
 =?utf-8?B?Z2hIWXdyYS9NRUhzWm5OR3ZjUm82STRRYmVGek5zY25lY0FBTUZhb0VsbktK?=
 =?utf-8?B?UldiVTJ5Q3JDbmJGVERZK3ZmKzQ5K2pBc3QxT1Q3OEZKZ3czbWRieWtETitF?=
 =?utf-8?B?Y1p1T3l4a2p6K2JOQkZGQnZiS0Vrc01CMzd0RDNDWS9sUDR0NE1xdHJuT0pG?=
 =?utf-8?B?Z09JWFpuMDh0NFVQdVF0bG1hWDY0TnJpZW9QbVVBK3NXbmg5elBkYlRPV0tU?=
 =?utf-8?B?cTBUWGRlZjR6TFRyVHBFaFNYdkFocVhXeEpNRDQ5MkcxTWVtd1BQZ0w0RDFB?=
 =?utf-8?B?dFFQRk5xRVprTnp6MVg4aE1xR082cXFJclhCT1FZZGQ5TTg4MVNJZTJMSEd5?=
 =?utf-8?B?MlBSdzEwTEk3dkhZb0hvY0l0ZVBqeEdKYnlWK2RvTXVsU1REanovOThoUGk3?=
 =?utf-8?B?UzEyUDBVbm1FclpGVGExREZMRVFqemFnN0owVFEvNHlmSktZWVcvT1FsUjRv?=
 =?utf-8?B?TWxNNTVXdWo3UkQwN2t1T3RCazhPeGRQY1FEbHlIbnBkQlNGVGVCeDRheG1s?=
 =?utf-8?B?cmhFZ1g5cHloK2grb2RwbW5jMm5GZlJ3NjhwYjZQdlNPczJBTUN1TlR3djg4?=
 =?utf-8?B?WmFCbjBmelNhOGdoTVRtUTFVNGtHZitqVXlEUm1FQU9ZR3hNTjBwM3BIMXVo?=
 =?utf-8?Q?BjxncbMlJAPEUDCQzvmt5trpv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a817cad-0040-47e9-5b34-08de101ca9e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:07:23.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y07sPNu5SQo64qOQQtbO6ZPpfy6zVh9sKlMZnvid2WmyadWD+EVbUOhnq8diTYNi8e42tfgw6r/xB6pala3hBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_211335_578604_8A10795F 
X-CRM114-Status: GOOD (  10.35  )
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

i.MX7ULP pinctrl don't support bias-pull-up property. So remove it to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: pinctrl@40ac0000 (fsl,imx7ulp-iomuxc1): lpuart4grp: 'bias-pull-up' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts b/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
index eff51e113db4f947b7532e2e1fca538da6d74f6c..88d7dc005fa0ea1d91fa561c0c3e4963c1459481 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
@@ -92,7 +92,6 @@ pinctrl_lpuart4: lpuart4grp {
 			IMX7ULP_PAD_PTC3__LPUART4_RX	0x3
 			IMX7ULP_PAD_PTC2__LPUART4_TX	0x3
 		>;
-		bias-pull-up;
 	};
 
 	pinctrl_pwm0: pwm0grp {

-- 
2.34.1



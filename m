Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B511CC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RtJR9pN13Q6pjEFX6ul0AgSbwxXqwJjIv896ImTNcfU=; b=0qUat9vUTXA0FM+GDsBvMx18v/
	aGLv4RcECrJQeUP26XW1AL1wukaalYHGQ6CJuzBZsu7FylBVc6NJZ45b2XHyiy/h11zW1WD3vdPQ3
	JT6OV/wU8TIcy+aCRX+gPxVCiKmPNFigAZXPrNHy//CbZbAxNV+VhwvolHmDNTUOVefndW6UThlyK
	KhKCDAtDFEw4bFE1oU6aKadkjL9ya6j0NvoxUNs1YoXaOXOAt2R5WS9X0kf1AJTsANDBUF/Xy636B
	LlYMl6GligApUuT/HY6Ft2XB8g6fiExV6nVXlleGxpWPtQ+EnGBjKsrptnnamlJcyjc0L8S/fVKu4
	KNj9n7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Ai-00000001n32-1NkT;
	Thu, 20 Feb 2025 16:13:08 +0000
Received: from mail-db8eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2614::609] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl99D-00000001mZz-3vc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke+piwCXKI9I5Rtt95TAP4fjP/jsHrufOZWyUvgF8x0EFKjD63b/lVrqGytB2x0kEkfS+BCU3e4YpbfMMuarJVSA0fQFPKjohIqhRTGcLVDy3lxcR8eQ8bSyOy3iXYxYVFGc8zBi+hlgJLJU1cKhyB048HV5V3/ZhsLRUfW7GU5bVTzGV5wccudimbcQsC7mcEjicPc4FZ35uRfVsY0kqpKRhDxCxl34ck2AAS52xersd6yjDCODl368DpZlcfYKTxTjCxrEf7tHu7MIIWxGZ91n+81oKBKGRaciZMkMm/iJN2Ur06spAM7tPWiFxUvaML8kLY8xSEkDDD+bRnjh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtJR9pN13Q6pjEFX6ul0AgSbwxXqwJjIv896ImTNcfU=;
 b=OUz1TAg6zMLGmgv+HCJooMt8qmTdhelFsDAGV9iZiWId+sDcr/QR+f2nvD54GVoHlSBwDW/XMVpVfkrxOPkCsBQbqHKBrsBYhQNF8J3sOD4kHUI0jLMnmYH7nb1VhcLAi2g0j0Aphn0/v09vQHG8J+f2gK6c6Nj9NSEn9mgZNiKbwrwj6B/HnOGX+7CK/Vzb2P5ApbSBlCqq2ruZ3RBUGh0ymXzskv03sNS7eA4lWj/Hd2pnkhjOfLl4ih6ZMbF8vFgb/llh3DhDq1r3hGQ0oqbhKKqyCIV1uVv7EaOhzlrybrmbnYY/zBF26jbYpZOzCGnpFFeclQIF4D3G5I0Z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtJR9pN13Q6pjEFX6ul0AgSbwxXqwJjIv896ImTNcfU=;
 b=ec8PLsL25OVLjwahbzjkM9+RBpODvv6REaDrx4NH38eNuyUPxvxlTWYJB2JGKeVnEJ1Bg523LBk0puL2NarVw1V5437/4F3Su3OWX9avS7DwhJfQvMHYafe4UCWoo7n3cDnYCl3SKEmZ6L4t7B8N05WMo9PqdP4E84LjI8rV94p8mhX3plpxvEdZmBSS2UkpYhccxk1ONPGmVPic18OZRWlOeQhnHyu6y+bBK7JBKwRJjiXqvsHs9oXa9e+OwYYjwrMQcdvDFpQ4F7gvuDtp0LLu1xl2VOZSU9403OBNOO9Jwsghgf0KJRMO/YbJPUEyzFQaRL7g3eX0/YSm2DIdDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7367.eurprd04.prod.outlook.com (2603:10a6:10:1aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 16:11:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 16:11:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/4] arm64: dts: add imx95_15x15_evk boards support
Date: Thu, 20 Feb 2025 11:11:15 -0500
Message-Id: <20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRUt2cC/1XM0QqDIBiG4VuJ/3gOf9PSHe0+xhhqbnmwCh3ii
 O59Fgzq8PvgfWaILngX4VLNEFzy0Y9DGfWpAtvr4eWI78oGRpmgiJT4d1bigSKjII1ueGekpSh
 bKMUU3NPnTbvdy+59/Izhu+EJ1/fv1AcnIaFEWkat0doo112HPJ3t+IZVSWxf8mPJSsm4aLmsj
 VVqVy7L8gPzveFW3gAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740067888; l=1232;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WEMkwLE3QAw6l58e+Iq7uiCv2YprhTWpYggsW/kUTa0=;
 b=NP4+CG4QkyS16c9V6+M53Mw7ew/memdCZ+ISC1eTdTkpWenNmXXqqCMQKSZcttcfMJGcFVzUy
 hLy3wQNpEIAA1wIQkMLmA6PwllfkvU3SGhG++KtDIEIj61N93YNVW+V
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 015019d7-c48d-42b6-9bfb-08dd51c93d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnBES09ZS1k2VmxPcWUwSUJwcitJRjhCTXl0cUlUVE9RUGZWNnBMOHhlRTlx?=
 =?utf-8?B?WFk2ZExGNURxckJpaTdLMVB1djAxaGIvNjArSWJkWjJQM084L2NDNjVoVy9i?=
 =?utf-8?B?UjJDM3Rpd0xPS1M4NGJlVDRlK1FXRjd5TlptRnJTVU05UEdmSVdOSWlaMy9M?=
 =?utf-8?B?WEdqTXVsbUVhb3AyVXlUTUZJejhuTjNCTXh3WHVGSFhHVmJzMmk2dUxwV2tD?=
 =?utf-8?B?cmxsODVPS1ltUW44aTVTekp4ZnV3ZTNRVjZZOHAwb0l2bEpjMUZEZXRYWmxF?=
 =?utf-8?B?Z2J1dHpKWmY5OTRGaEFMY0NmTEdKTHZZQ2owTkRlWU5aSmQvVTZGSktERSs0?=
 =?utf-8?B?T0o2THRXYmRKckJmZ1F3a29QNlVzYUNMcFJxbFZzVkxhZCsxWXRvSVo0azhP?=
 =?utf-8?B?OUdNdVBDMzZpWkdkbTNBUnhRYnR5dlVNei82d0VITlQ2NHlwOEpkelhBTFN1?=
 =?utf-8?B?dFUwancrOC94eU1LSVhwSUhLMHU4R2hTNlBVVXJ3NjBKUjRya0JGajl1QXdN?=
 =?utf-8?B?YjQ3bkttcWQySWpUSEVaU2RMckdOa3JHT0dDaGlqV3c5NmI3WkRra3d3VElm?=
 =?utf-8?B?VXZDditVMlRuVnE5bkd5QVBsVG44QW02ZEtrKytxRG45bEtxUWppRHVkNzh2?=
 =?utf-8?B?UUZaV1lYM1d5ZlVUOTQ3dVpaY21sSy84alY3bmlrZENBTmkwdGxaK1hmbHFO?=
 =?utf-8?B?ZnBTN3E1TS9SZTFHTlJtczNobkFpK2R4MFJib3NYY1dyVW5LUzB2ODFlSXNo?=
 =?utf-8?B?K0M0UGFKWWZwcUc1TzdDbXR1RGhqTk1jR3RYN2tkcU9EcitTUy95R3M2eHUw?=
 =?utf-8?B?b0MyZXpqbWlvZnNUNUViNDBmVGpGNWx6bnpWMStQWWZqbjV3L0N4aCtIVUFm?=
 =?utf-8?B?WkFGWDhJdTRYaUpMN1FrK0JUeUh1Z0ZvS3RVU0t4ZEFPUXBtRDk5d1ZIWS9B?=
 =?utf-8?B?TEJKQk05RzZVQVNNVUhpeFhqOVBUbWo2Rkx3dFVnWndhaksvU1VUbU9UR2Zo?=
 =?utf-8?B?ZDN0ZDBrNXVlM3VhbkVybi9PbkZxVGtQUGNtR3BkY01qWk10UDZWaWRLWU4x?=
 =?utf-8?B?b1RxYVdRaGxodW12N2FIc3E0VXZ3UnVwYjF1Nk0zeGpnWVdZMEdQSlRRaitR?=
 =?utf-8?B?VVV6R3JIbTY1NmRpQ3puLzR4TDZPeFQ1dThIOXZQUG9TUS9lMXRtYXc0dWZV?=
 =?utf-8?B?QTh1SkNrb21WUExLdjRFbUFJMlVNNFRZRDNjVUpHUE9zYzl0V01mWUVEK2Z3?=
 =?utf-8?B?cWczb2xzMmsrcWlsRmw5UURyOTRTaGpLZkY3a1R4MUVGc08xSWprYjR0RnB6?=
 =?utf-8?B?RUxyT1M3T0haSlZEN0pWRjl3dVl5T1hPc2tmZkJiZS9MRjRQSzgraDNveVBD?=
 =?utf-8?B?bGxZMDVwaHdXa0ZwTVRldkNCeFlJOTZ3VFZJOElVU2JBMEw0ZlMrZm9rT3Az?=
 =?utf-8?B?VG1FWFpvMVpiS1NnSkxlaGsyVER6VCsrRGFnNFQyWFlOWEorSHNqRU55S0dO?=
 =?utf-8?B?akpDNXhqMUVhNDJMUTBqUGF3Vng2bE4wSnRac1A0bmtzQ1B1ZnU3WHNtemNa?=
 =?utf-8?B?cEZzVE1CUHpnc1ZOTFpaNUpYbi9aQXAvVGdySERHL0tIclN6VkMrdTErSElE?=
 =?utf-8?B?a2FVcm1kWkdpSzVWSnErLzNPV2dXOUI3Wk9ZMS9EdDNGNHM5RlRrUk52OWF3?=
 =?utf-8?B?dWo0SzU5S2hqZWFuNzF1RWlaVGRYWUdOSDRycW9HaUZEbVAvaS9sRm01V2pH?=
 =?utf-8?B?MGI4a2Z1ci94djB2ejhER0xZK1h3UUlnd0h1UEE0aVE2cWUyTVozeS9aT1ow?=
 =?utf-8?B?d3VmNTA4dDUwTXdpSWhBQmQ5c0NXeWVVUUpEdFV6RGltdmIwbTZaL3kvWmQx?=
 =?utf-8?B?cVpkWXNBVFlTc1FuQkNSYVBLNGU5ckZ5cGxMTWVDdllaaUhXblIwT0lSMWFo?=
 =?utf-8?Q?P6zkTsPY0ovId7poEoYWHHch1bvYUsjw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnN5R21yeFVNWmE3WlZKc2swQWRFYU82cVVhODdNMkZNWktYb2FkNEdnYTIw?=
 =?utf-8?B?eXVOdXJjQnFoSnBjaWx0WE1RWGczb0NGYVNDeGhKejNPeWE5M0Z6ZG8wMmhV?=
 =?utf-8?B?SUJaOWJqOGJvSHVkcmp1S0JZU2psVDVNK1orK0pOczdQWS9zeTVteHFWTVNV?=
 =?utf-8?B?cUpIUnBDYzdxbHhIa2xJOUxJMjcxV1BJVEQ1NXpRWHliUyt0dHZLYmdVTkhR?=
 =?utf-8?B?RzIzaDhqTk9mM1Iyc2dzYmFXWWFXYjJQeGd5eWxGYksyWEFPd1J1TFYrUWx2?=
 =?utf-8?B?cmdEaHlHYkJpMW1ySHNOZlpsU1FyMFVPRURTdDAwRVVlQnlsSGpuU3ZEV0Rq?=
 =?utf-8?B?Qyt0bzBJbytEUVAybVBxQjBReUVGV3BManV1eGVXMjlvd3pOaitYdG1iVy83?=
 =?utf-8?B?TzdQeEhsMUFJZTJ4NTRnMWN0Uy9FQkRNZ3FCWUthUFhueGwzcW85cmlMODJi?=
 =?utf-8?B?eVpTUVJwbmY3K1QzaGwxc2FqY05PeWpkVklwTmpBNE9KNFJxU3dEZ2llbmkw?=
 =?utf-8?B?ekRJLy95MEIrdkQrSHdWSXlIeW1wVXZvOGl1RHRZSCtqd2tDT2hVUTBCcDBG?=
 =?utf-8?B?VWhFazZtNzRPOTVrM2dhSzQ5RVdQd0xiOTUrMFZpbTlneG9aZm9HK3lZR0pq?=
 =?utf-8?B?TXlaY2dJNTBVMzRxOG50aElIT01leUFvOWt2QjVxTHE5bDlRbk9oWVN3Mmxi?=
 =?utf-8?B?RWdxRFBxdXd2Z3N6cFRCUnhMR1A3ZTJBYkFWRTVWZXFVazFTTlNjYjlvVkpk?=
 =?utf-8?B?K29GWUVnYU5WcUpYcUFMeFAyTExVM0V1YnlvbWtHeGx6MFhLakc2cjhrWitn?=
 =?utf-8?B?ZHptZk1tL2IvUDhXK0FNRkFBUFN6R2s5eDNVVytTZVI0cWUySHRKdmhjbE5r?=
 =?utf-8?B?M1NlOVJYK1VubE5FWThnRDd6dHdTSUxJQ2MzclJZdjJzOUxQWHpsUEloTVRX?=
 =?utf-8?B?S0orV2Yxbng0WEh4Rjl2Wjk1UEF3V2dJRFZpYnMvaXpHTzFMSFI1MkdWY244?=
 =?utf-8?B?amRIdUJuUVlsL2dnaHVRN0d5S2tMa0c2Z3NsZDNIb2pCY081OElpbDBjdGVD?=
 =?utf-8?B?VlN6ME40eEZyUEdJUUZjQzU4SnI3dkE4R0xKSHRwcm15OFdTL3VvaEpKbEdV?=
 =?utf-8?B?RnV5d25weWR2bnF0SklpOVZPWW9wbkxVdEJsVTYyd0xvUmNKckgvQ1Bsd2tU?=
 =?utf-8?B?NEVQS1lUU3hpaysvdFhDWVZXRkN0OEVOV1Vza2w1UHZvNHBHYVJBTk9ndzdo?=
 =?utf-8?B?cHhiMXhiUGtsWW5xYWFSNzMrb3VRNjJpM3RWTlgwd2NkQVFPQWtQenZ3N0Nj?=
 =?utf-8?B?TGxkMmZLMHpqcmVnQ0didGw2eUMzOUVnVG00YWxCN090YWg4dGo4SytwMlU1?=
 =?utf-8?B?SHBEQ0hZalc5UWdrb3dhTkQvbmVvQy9RcVBkaktjUWtTWXZEWE02SzhsNDhE?=
 =?utf-8?B?UHd0RE52SWpTYUpWWW42ZjRPc0VjSTVWQjlKUzRaMlUyZm1WT0doK2FOT3Zk?=
 =?utf-8?B?M3NkRkkrV1NMTmQ4WDh4Vzh0VVdaQ0xGU3oxMzFsc202RVFrYjM0Y1pPTnB5?=
 =?utf-8?B?M0gwTkhPQ2ZpWmlGYUJxay9rWmR3d0daV21zcXpmTjNUUmxEOGtrYml1UlRu?=
 =?utf-8?B?SlIvNi8vTDRGS2cxUFlCRVBNWDllSEVSYVl0Y1QvWEZoRjFxdnZoWmxnM1ha?=
 =?utf-8?B?YWwwcDVIYUhmMG5CRGxlRXJsbkFKVkpBbkl6dlpsWVRIS2V3MGxUUTJhZmRl?=
 =?utf-8?B?Qi8yWW84MURHR0J1K3VhNm0xVjhERjZDcGUvYStVc3A0U1VmYldPWFR2Z3pD?=
 =?utf-8?B?enJaU1N3RVZ4WHljTmxMbUpzUWlIQkJOQXpFWGR3WmZGbGVpL1JqR3hhbzg1?=
 =?utf-8?B?Ujl5a09NVytQdFNqN1poMDBsalVkOGRTN0F2UGxlcUZOdkRpMml2eTB3Nldk?=
 =?utf-8?B?S2huQldxTFcrT3pObUo5QzZpNFJXU01LWWxYOVFRMVJRTjdnUko3S3Fxbnc3?=
 =?utf-8?B?NmoyVWZ0bk5QUDBPUEJSM2trUUZybEZPOGtZRnh0R1VBYS9UOXdQWFZ6VHN1?=
 =?utf-8?B?TkFaeTlyTGZxVWpuVS9zNnRvNkg1Z2NmeXhhYkpGc1BOei9EUERreXREYk1m?=
 =?utf-8?Q?LMMCWDS10Tmr2VhQiGqn5XVoO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015019d7-c48d-42b6-9bfb-08dd51c93d3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:11:31.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7v+s8SVgMv4zBkUMWuFHUAJH9y8F13UwLX3hGIWLwRGlD0S7Er58XqKBqh0k17ghMy99s6o/iqq0XTK+QLslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081135_980288_5B5E7D78 
X-CRM114-Status: UNSURE (   8.50  )
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

Add related binding doc.

Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
boards.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- Add Rob and Conor's ack tags
- Remove undocument property (need doube check why dtb-check have not
report warning).

- Link to v2: https://lore.kernel.org/r/20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com

Changes in v2:
- fixed typo 'inctrl-names'.
- Link to v1: https://lore.kernel.org/r/20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com

---
Frank Li (4):
      dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
      arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
      arm64: dts: imx95: Add i3c1 and i3c2
      arm64: dts: imx95: Add imx95-15x15-evk support

 Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
 arch/arm64/boot/dts/freescale/Makefile            |    1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1062 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
 4 files changed, 1091 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250110-imx95_15x15-6a64db8c0187

Best regards,
---
Frank Li <Frank.Li@nxp.com>



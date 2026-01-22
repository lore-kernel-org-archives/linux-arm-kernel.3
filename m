Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C48C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=; b=C3Xam0mgmZ7iJX9ZqsShPP6M5q
	88Csl7tPb4K7fBqsx2WQTThzKYFMyiR4VuK8Xtcs0YctOBLM5KTVOCN3xcdtDmwTZzu4c8Dvbkdjo
	BOd9AhjI47jcz7cXAYeGxAw1TqTeE43Ss5PJT6ONi6k9Js9K6iw9Hfbz7KMuXpyoq1/Kdu61Utvde
	MGNhCBTXoc7VeZcduXRbJh/38vaN7Q5c8S+nwCAVxFURI70EFyNG9bfVK3T81Y1hnDXgvj0DtWNUw
	wNDnxb+E0+2qIy2BB/fc47x4fQmRrSMBKt48dPVQnLOdMNKuuhpK3TQEys+Hefagi3eHNBbE/y01n
	k3voqMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipSO-00000006bt8-0dmH;
	Thu, 22 Jan 2026 07:50:20 +0000
Received: from mail-northeuropeazon11010071.outbound.protection.outlook.com ([52.101.84.71] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipSJ-00000006br3-3bJt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR39ZvkhFNDMTZp7VLROBILfoKmr4tleGCZNMj7A7jqo2llXEiixU1bqjzCmFMYqxUWqLJWabsbSffbgzGDjtR6qn6oEUoMRBGVMAhVKo+Ybw1UWV8COLatdgwfQ+TIJEJEZsFBNgm2nEqdvVK33VoVFCn55JVee9RGCqR7ARk3lEerLKx3hD6lW5cfVbnQnKgeN9/EROHAFT84Am/mY9y4Y7Q6IuoS4U96AM5I7BVPiqqbrN1oL1RvYdGqYwBhxU2W1knnnTQsmEYUU8hgNnXF6vWqsEaU10yQSw6gcOMSfuP8hijYpBny7hmuXLrcwUOsTVPxdPI7REZVkqaPLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=DnrZUURai8MTzWkyXec8Vg0k5z94m3edQkf+0udvLP1hT1nzBw64nyxbEKv7P0f2zgtoTNRjqXtvHo8k8Hl8LuxLeXTjSt1Q08IsS5Fg8wrJWROEMIZCGhhISV2r/yRFDMzZyc+75gYOc1IrZDchqadcZfXCUzh9VXU29kFR7uXMNsKSEbc8k/hhpl7Jn1U/+rVMjRfbhtGw+W9APDOLW2igEmaQiEemZ5/xIFjK0d55Fk8BnGckvciNhik/wvx7z3a4r0kUvtyuDgu7vjIHFtUGGp0ljRuqeo/vjzftGWho2yehq6nGm6aKfXb3Hffb8xfNHx908uaM1ZI62XoI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=MXHaNgA6HPc83Q09VWIEzsV9s58PGunZ3kxYuLSt8VPiJ6fAMPCeXdfFAIprigK/XwOvj0lzli3fzKF4qaj1/FZCb+APdQNRr5ucwRhON3kDNj9fjjVrh+fQuEFJTpuhfWfGuUfZHbYPe4nEyimu2SlIA6gq7LaXr5nxV1EhjXReA4Xwzs2bkx0PHepRZLP4XQy289+OWzJs4HX9O+Y5MSRAnRH0ypZwskajoS6EWvNiTo5RtyIy+M5M9Glt/byv/YumNg0h1pGBTxsiByfT1KPxKxN6cTwc4SGezmMcCsFq91mMOHvs9RAF5y8ghP0NFlwb4ZsOfWsEjP02FbJjwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 07:50:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 07:50:07 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 22 Jan 2026 15:49:34 +0800
Subject: [PATCH v4 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-csi_formatter-v4-1-6f6fcad1c33a@nxp.com>
References: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
In-Reply-To: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769068198; l=2884;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nH6NEgl59OPi9EkQLhW3K3B+dXPHxx3jMyor6yV6qDE=;
 b=BSfrqM/e1xXJrhaONQF62Iw6HEdidlhCZOWMxxT1BlQkgLJORtIZXcPbTsK5Ysi8hF5keRkrw
 XErETmTj1m7A7S4K95DtIuRKh2m71a0h2CFkTn8WtJpL5gjhPIQGAAf
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dd2333-82b9-42d9-368f-08de598adc59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXpmcjdjT1U1NEJDM2E2N0F0TU40SVo3UkQ2dElkWWpmUFhBaXpqcnFSU2JT?=
 =?utf-8?B?SUx3ZkVvZEJlTHlnN3JibmVmZFFjZ3cwdjE0UzdRU3psRDJSWGlydDJvbHp2?=
 =?utf-8?B?bXY2RXEzc1VhTk4zdHNPNWRDMWUrVkhsS1RLc0t3emdIME1uMDBDdUpLSzBG?=
 =?utf-8?B?TXIxeVVmempjWWYwU2NSL3lUaXQ3aHRoMW5WYy85N1g5bmdGNnl5QlRuUW9a?=
 =?utf-8?B?UXp2TjNBVTJkTnNtOGtzdEdGSFoyOEZWdnlnbm5WVlkvdjVpbmtJZDUwa3pu?=
 =?utf-8?B?RDZsTzdsbXdvcjArSFdQUndUekczeHU0dlFGZHFXa0VpTTNtTE9DZXJkaHJE?=
 =?utf-8?B?R3VxazJQZnR3bjV5QmNaNjM5OGVGMzZzc2JLM3RSSHk4bEx2NzJZK0xnN0pF?=
 =?utf-8?B?ZE1qQUhVZFRvZ2FtQUlrZmR0L1pCVTRwVGx1OE05UzlZelJScG1wSnVpc2FV?=
 =?utf-8?B?dWVvUURpcjJ2VXpkYkkyVE9TV1lvMEFDUVdMakZSZWxEWTVKWVF2UVcrNnNz?=
 =?utf-8?B?VzJROHMxdExNTG9vdjRGd3hiVG5qWmY4eUJSRUZPRjFiZGlySW9waTJUd2V1?=
 =?utf-8?B?M0JiaVFza0w0QjlnMkZqbmZnMXFCRmhsZ2xQb0xPRytkVHMyZ091K3JUOStV?=
 =?utf-8?B?NVNwRS96YndOZHdMaTJHdk5aYnFONDBaeGd3QityTnFkUHBYUFBtOW1kTFZr?=
 =?utf-8?B?dFBTQkRFLzZqNzk1bGxXb3QvT0JXeXpkWlpTeGd3eDlROVhRMHRpRUY0YzNl?=
 =?utf-8?B?UzZFcnpnMXdBRW1zTE5uSVo1Qkl2SkJ0TDAyb1U4a0ozQVJnd1ZKUWZJMnhD?=
 =?utf-8?B?dnRBT0c0c3RwV3MrdktaaTgxQjlCWVRlZnVXQURqRmNPZ2dRYUtpQ1ZqZzVh?=
 =?utf-8?B?RVA1a0NhN09TeU1WY2V3RWxkVVFiNk5iOUFXYUlNTzkvUlpidkZSWVZtdWVs?=
 =?utf-8?B?NlhuQzBTbGxBR0cyZ0xRaENyd25YV3BXM1FaTlVzamNCU1htcmoxR3ltUi84?=
 =?utf-8?B?YWZ4c1VNeWtVVUJBZTNaVDMrbjlQR0dwODJuM1FKelRycGZlN1ArS21xTlRH?=
 =?utf-8?B?YzliSkpuM2ZOWXdqTngrTUVCbHBRZjFlUFQ5UStNSkx6dVhKejVHVFRETFUz?=
 =?utf-8?B?eUlEVDBIY0t1RWF3VkFZSWdkTklrMy9MdTBaek1QdngvMFdMMWx0Q1RtUWE5?=
 =?utf-8?B?MWNVa3BQL2M4ZWN2clcvUDgxKzAzQURabmxiaUhqUE90bU1zQmM1WC9VL3Vs?=
 =?utf-8?B?VUsxZm1xWEtodzcwMnFicThnZmdnVENrMGJCUzBMVjNKbWFBZTFUYytJbUEv?=
 =?utf-8?B?aVVvNGo2d085OEx0d2RqYiszMk52L0xZUnpNQ1QwTnBNWVNJYjdjSWJBNXls?=
 =?utf-8?B?Z1lLNmhkNXJQMFJCOUkwQkRwQ2wwZ05LT09WY3hYVlY4c2ZpSkN6bjRvcEZv?=
 =?utf-8?B?enJ1UXZmRmVlUU1FdG9WR3M4Tm9pS1EzclgzUWV0UTFCUTdBNkUybWxxUndF?=
 =?utf-8?B?b1lEY0VHa0RUV1BSSVp0QnhNdWFuNVlXNWRTWUdTNEYyRFJNZGl0Ny9SYVZQ?=
 =?utf-8?B?cWMxMit3RHVuMFg4L2d5VFVEc3dkRCs4S3QxUlRYWHlxN01NK05GN29SNmRS?=
 =?utf-8?B?MHdkU3drMjVtSkx4SEhwQ0dTZTR0dHAzZmpFdTRPS09Hd0VaSkd6UnhZVEY3?=
 =?utf-8?B?aHhDTk44UlorTUhVMDRhaHVIQUk4MHB0MlI0MTViaTRMWVNYT2F3Y2RmRkli?=
 =?utf-8?B?d2lWbFNseTd2TmxiZCtKTnN6RGUrM0UwTjhaS0FEd2xRUXJ5Mnlmamh5MHhQ?=
 =?utf-8?B?amdJZXVidmNZY1lnak1qUW5jY1hxdGhndThuU2htbldEaldHMVZBVXJ1RnJU?=
 =?utf-8?B?dlNnVU1GWHYrbk5pUHU5blZSUHIyOXphcmVMMWR5V0xCRjZXclhLYjdQcS9W?=
 =?utf-8?B?SE9qczE2cWJyYUl4UlUyUVBUaWpoWGRoNXRJclU4R1dXT2NIYTZpNDFTWEJm?=
 =?utf-8?B?VThsT0lIN09jTmR2enRWR1ZqbVNLUGt3aVBTWndpRytpQmhob20wb1pxK0Zq?=
 =?utf-8?B?cXZadW5DdlFPSjYxL3BUOWhOcUFVT283Ynd1bUdRTjdxaDRYd1pFeFhrY2xX?=
 =?utf-8?B?ODVNQnpFMlVzZ0lrTDRrbnJqMEZlYS9VL2VqbkNUOTIzMFlZTHlFNnRhY3Y1?=
 =?utf-8?B?cGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0NsdXYydks4ZEF2cmRtRHRpNUdpU0JMVHdnTVR5Y05kYy9QdE1MT0xwWlRC?=
 =?utf-8?B?ZWJsS2IwaG1rd3RQYUw5amVIV3luaFlIVTFWZFV4YlNBbUVQUzBnT1RPR0lU?=
 =?utf-8?B?ZGJ5WUM4M09Od3Y1U0lPQmVHNEZjbDByVDY2ZHNNaWkrODFlcDJ4dVBYYllw?=
 =?utf-8?B?UUlXY2V4UUkxRTUyNDE2aUdNdXMwemRqd1VIMjB1K0FPeEwvb3VwOHlRRWJq?=
 =?utf-8?B?blZQc3JiZmNXVXhMUW5DRWxpSVBaVWpseW00dXFQbkplSnJTQm04TE1kSS9a?=
 =?utf-8?B?ZEVyQzRHTVUxSHdOZUdoMWVDcUw5eGtuYlcwYUt2K0lDZGtsblZVRXVSM0Fs?=
 =?utf-8?B?UU5HYUhDRWVmU1JKV0hleGVFNlZlQTVmL0ExZk1YNzROTXNoMUlUbTNMY0tZ?=
 =?utf-8?B?OHNlMUY0aTFBMk5Zb25YUkNJT0t4RGZzUjkyYWpQcWJsQzlScHM0ai8yblNw?=
 =?utf-8?B?M0dvMDliMWRRZHY4RDJSU0hkNktINGJrSy9vclBBc203M0RLVlk5RlRrbFZQ?=
 =?utf-8?B?YXJzU0YxeFY0VFptRWhndEE3eXhGZlRMQXYxcVgwNXR2Nm5NRFNwOHgwei9S?=
 =?utf-8?B?OHZZbFYvZzgrT2Z4ZkhodVZxK2h1L3BPTDVaRXlYYVJIbTFFTFQ4eExyV1di?=
 =?utf-8?B?bjBXNVJBQUlZR0UyK1UwMUhXRHVrQWVTS2VuN1lGUkR5RjYwVEdveWhDUGJ4?=
 =?utf-8?B?UCtoNHNEa0tXVVJ6MUYzUGkrY2l0by8vU0VBMmswV2oxR1h5NG1OaE9QRyt4?=
 =?utf-8?B?TXJFbVcrNi8vMTBZMnpjajY2ZkZQYVVRMmpZV0lpYkxMMitQdjZKVVR6RHVS?=
 =?utf-8?B?eTlmM1RTSFU4Ym11NmNJL3ZJbjI1VUJRc0NLL0c0c1dFSGRuMTNVc0FuSlk5?=
 =?utf-8?B?Yyt2a2xtdFI2ellkUU1ZcnBjeDhEOHBxZEczVmhoSlRCY1B1aGI3U29jVnVT?=
 =?utf-8?B?bk1JMXBGYUZPN1Ftc1FuMzQ4RnRrc1RmTm9DWWtNRmNPWXNlbmhrVEF0TjhF?=
 =?utf-8?B?TFMyR2RLd2ZUY0pCZit2NGtUS2g0T2o2R0hMdi91MFJyanp5WHVxRDhSTlRP?=
 =?utf-8?B?U1J5ODZCeTZtSFgvMDhOSjZhL01tbStnWmdKWWJoZFlGdXN2cVB6MWZzNVlk?=
 =?utf-8?B?dGpKOCtwMEpRaTBXa09Xemc0b1ZBMnRtWWlZSFJOOXZMR0VUV0twVUZiUDZu?=
 =?utf-8?B?azJpU21Yek9BaWhPQjBQYjlDc1liNnhjaE1QanBwOGhPTW5hbkhHOGpaQkht?=
 =?utf-8?B?amFNc0RIWGEzTGlLYmk1NVVtTDdvQXVHd3VOSnBNbWc2bUQ3VmhHRHRQeGhJ?=
 =?utf-8?B?cHpSWU1QY2RQNExidXdYZjV2Yi8vT25Hb3JNbVBYS0RabCt5N3ZlRm1sTTd6?=
 =?utf-8?B?eFhUaEZuQU9HRGFwalc0aTlaWkJjU21pc0l1aFVCcFM3b0dBcjlJeWlNb3Rw?=
 =?utf-8?B?UE13ell3UWtvRE5SYXRiMXF0Y1NsQ0JFRFRpREFXK01rRVBYaHdRZnZNMDRj?=
 =?utf-8?B?OThoMm84SjBxQ0tXNkRqcm5nNi8reEVEczVoVmgxZEVLaXR6YklZNFJCU09n?=
 =?utf-8?B?eW5sdXVsNWZGbUQzMW1RbWZaV1BKRFNPUDI1VDBmeVZiR1Y0V1RSbjdTVTlv?=
 =?utf-8?B?VlJNTUI0Ujc0WW43RE1WM3UvZEdhL252MnJaSTJFUUZrMll2SmxsRFllUE90?=
 =?utf-8?B?ZDBhWDh4aUlLdHJmVGRVaUdZT0EzbFZWMC9DaC8wdnloRHN4NWVKejNGYktn?=
 =?utf-8?B?aktIamxXcjRvNCtTWkVUdEtCeXBQendGd296bkIxeHdjV2o4OG9kTHRRNkdS?=
 =?utf-8?B?NFZwcXREa3VhY0g2bCtzbS9nWThYeDZLNnBFMUh6MDNUblpUVExwcTVudktr?=
 =?utf-8?B?UCtMckpEektNS0QvbjRZMk10cERqcnVCaXRud21GWEc2YVNwc0g4b2xTN01N?=
 =?utf-8?B?SXdGZVhaV2xpdFBDZXoxSkJXem5VMWc3ODhKc0FMdGE1MDcvNCt3YXh1VHg2?=
 =?utf-8?B?ZWdVK2poVStCMnBIU2tKei9kZ0hOQnZlRU5Tc09Vbzg1RkV0WHRnNi9IdmFr?=
 =?utf-8?B?dVVrK2lTMVRiOTM5V21sckdJOUFPNkZBVFBPS1hDb3dGajN3QlhhWUpuQW96?=
 =?utf-8?B?S1puY2JLeG1JSGl0bnZ2eDdRT1RSR2FLVFJIRUoxUjl3SlNQTGdzY0dlRlU2?=
 =?utf-8?B?ZjluNGxJeG9oUkU2MVZMTUovbXNpd0o5SmVDSS95SXdtYjEzTTRYMFNON0RM?=
 =?utf-8?B?S2JYN2dpZHlwZTdpMzBMckZNRnpMVEJHSjBmZkMxcVRtdXRKWUZuYklhQ1ZQ?=
 =?utf-8?B?OGtTekdrS2hrNTREbFVlRlZnaUFtWFpJTytPa3VBVS9WUGVkRXUxdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dd2333-82b9-42d9-368f-08de598adc59
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:50:07.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ15jViawO82tyyqKMF3JI0ZCxkoaV1yW61KWPO78olHVLcWk8d4fQyHsp1vvudGJyiy44ZOwpu7RCs/Q75KbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_235015_906815_E2C64310 
X-CRM114-Status: GOOD (  11.94  )
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

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..774d37d2b987a679f0bb6378897a6dd196ea4f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1



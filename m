Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C6D68BE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=; b=O9vIs2l78D5ESTHWJs5w8z4DLg
	bfFrK44dk/Gyaqtfo1GkKL8xzq5VvbXNKzhdT8DqtaDx8esKmuEOcElh3+c/eTs6mduF9wl1NMIZn
	/urLKTyWkhIKViItFIUIqVxP98zNXkD+oYFrUqGcCcmn1ks3qEk7NZR3FXXWyd4mWtUz2XsXjtEZG
	bUM+E5uffbX3rJgxbSdZW3yqzc3N+nqw6efshckP8yNZXmAcP5x9rKND+sNyKHsB5lbvrqIjltsV6
	3QqhUoOQpgFpDd/Xe8wbey3Lpus2F7MWkQzU8zxa+dfttOzorjwO0Vz34ien2DHbaMK0OXA9E6HUB
	vNxkQHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7oD-00000007usS-3gf3;
	Thu, 18 Dec 2025 06:48:21 +0000
Received: from mail-northeuropeazon11010031.outbound.protection.outlook.com ([52.101.84.31] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7o8-00000007ujZ-0eol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 06:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRHDHf5BZTihVmXwlA9m27N138Jx3+l2j1AQ8OpBz+KZ85UDvInZ+UTOSAFtWzvjnPNoFwkWFoalGj2ZDn5OpUREA5XkacXpZUzPafydIpsADVdgfo+nKnDjwECL6MWiLCAe5V5vLSDGzYTpHq4YMiJMOj7rISto3NOgCNep1Np9dNArh1lKeuBm8wgerB+sGC0nLrqURRR2kqXN7QLGrK53X2iNl5PpIFFDdHtpDLBV4Vy52vn9Il4KdhkMLIqrmS/jsK/6ADOse85RD6g6Nzzbx4gI7zZMAylPRhTE02ArIF6TRtNq3vvp9RBe6eSLlRX4jG7GQhrdQdqRbjQ5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=Bw9fC5dRedpJniduhWTIOb/vtHPUm+QXH4O+hbnvb9Xh9gYCzns3t6pq+Pb61H1rjorLRaBaUVZ0aeFgg1DP34uyuiJ+Z0a4U2NMEd5F4lOXjbD2IwmIMTW5dzGFYFeQMsg6NF0/jMOGCoviXmXWTb7025kSXQyqRsJ0iM0+3JStfMvHK8WqCBx66gcvCBt89boOVvVWJO6BHKAc7sRn9bV32BZivUQ16FYECO1BJGOaHH9X1+bWGoYLzvnB9LcrX0Uw/1WakAYY6G6Tj32Iz31raZKsX04+86kdxgCcfwHU0pooyxQDx0syd7M0PIurIJyMb/sC7oVppqiW6hYcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=PpeNJawzgVMqwNNU8wiWUUjN5b+rKBArrg1vQo2B80j24dz0tB0eTMc8Nfx2qbqVWcdM9M5Q+R5D0KtFZlKNUeFMNw2UtkwdxOKE+lyjOjgh239trQIzSJIh1LR1A5Fc0i31al1mCJe1+5R13QPtgX4R4xNr+zwOOneI+zvoZSrDaFRqO5N4tO0DgyZV8UL6SYU7O+Yghqe+kmXPp/LWfbAI4HD1/qbNFZcVLeZgO+ZTAuLgXq9peBBSxs76So0rJLhbtHYN7kmkaYnYn1rnpNzf72qcOyaq3ySTxArTsadZG2qEXFaAY5pRFn4zSs796i/EEUgwVx6UwKgstK8AYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:48:13 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:48:13 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 18 Dec 2025 12:16:29 +0530
Subject: [PATCH v22 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx-se-if-v22-6-07418c872509@nxp.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766040412; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=zqLf0HwnJosWMXV8ztYGu255MBJBJByEWRPPmgr8lRMHQmTC14S1Q6Lamx0r8SUjFWzcZHu6u
 yhPA5RBanFVCRz9017hfOJICpQ7n1UqeTHqd/TacJQCLzpfI7C3MUj+
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8599.eurprd04.prod.outlook.com
 (2603:10a6:10:2da::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e67dfc-716d-42f1-325d-08de3e016a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU5LTmFSRTY1TzNNaWlqK2MzS3hmYU1ETGk2dmJxeTE1YVdEbmRNTWhjeGts?=
 =?utf-8?B?WXkxb3Fnck5yT2RQcGdRU240TGpZWW5MNStjUGFqVDdXS0N1N09YMzJiYnI2?=
 =?utf-8?B?QVprRFBQbk9UYzFRSnVVWFlCNTZablNpTVViZW5BNXM2OUJHV1loQmhZMlBl?=
 =?utf-8?B?WUd4M2Q2bmJVNG02dXFmYzQyNHVuUzJzUmFZNUpTd0YwSS9TZFg1TjB6ME5R?=
 =?utf-8?B?MjROWG9ITDVPU09MbW0rNVRLcGtOTVkvTXNrWHBKWExNVDNycytmZDV2Nk13?=
 =?utf-8?B?RExqMVhGUEMyaDhDaTlSOVZNYUgvaTZKRzFDWEJLMUo0dWpXc0FwYlR1T1NK?=
 =?utf-8?B?ejlSZllKNUFLZkluOFArdmdMUkRpSWlac2s4ejhzc1hVQUVKSEtSSjVTVU9M?=
 =?utf-8?B?WlZ3aFJQY0VtTVJqT1p6VVhNU1E1ZmN0N2VHTDlJSlZBVzdQVytDd0NJbi9s?=
 =?utf-8?B?UXgvSFN1SVUrcU1ReHdEaWlNOTEyc09UMGYrNkVEZ2RiMnJtRVFVTER1U0xl?=
 =?utf-8?B?bmIwdlp3Rk0rSlBYZkNsYm5uVGp6TmlhTFlENE1YTTNBN0ZnSzRvMXFMeHg1?=
 =?utf-8?B?aDhudjlRWDFQc0lQKzBjRldhdG9MNWZaZVByNnZpc1ljeW5MUWRmTVAwWGlV?=
 =?utf-8?B?cklpN2R0amIxMUhzdFJ5Ym85ZVQrWCt2cVg1cFRSMU15dm52SWpSK2t5WU92?=
 =?utf-8?B?c3FlZlpvSUdCaWdEcmZiTFZmNXJiY0k1aXI3UUI5S1RRWGJ4Zmg2ZlMvK2p3?=
 =?utf-8?B?S243dTBXZm9HYUhhczNKRVNhTjhOeENBWHlIQnkyTHBCTXY1ZGh4Sk9OSm1K?=
 =?utf-8?B?L0ZpSlU0dmJBNmYrSG1ObzNGWlFYQkxkcm1SUWJ4aUVodGFQYnFoWjNJSWg2?=
 =?utf-8?B?L0Zaam9rdkNQZTBwS1VoVE16bkhJcHFEdGFDOXR5YWJZdFZ2QlR0cTRkdHhn?=
 =?utf-8?B?MXZYbEs3T1dxaFpvMVFjbjVDMlRSSXYxK1FMUjNpOHhzVXhOMkJVYUtqT3JF?=
 =?utf-8?B?VlE3Y3BOZFpCZXdrZVNjd0kybTRIQUxkOWlPMDBpWFB4V0FlY043ZC9DTFgw?=
 =?utf-8?B?cVFvSmkrNGxBVG9BcGVVWnVwQjBBWDkyK1pUUXRwSmxVbFhoQ3hqN1d3TmM4?=
 =?utf-8?B?aG9FUjA4SkZ1TElhQnBwdHcxZnJaYTkySXdIbkUyRGsrOFdKbjBQSnpoS2tM?=
 =?utf-8?B?cUZXQVdOd0UvZ1pHeTVNYzZWeWU0cGJXUDNrUnpqdG1RVFdxQlV3NEQ1a04z?=
 =?utf-8?B?UzMvbU9wYlJxdGZGRFQzcFNLVndSTFFxVElNY1ZvU0RLOTJRM1JBcHdwOXNl?=
 =?utf-8?B?bE4zRzJuVjhEc2VOVUo3ejczRUkwRTBwdllpNFB6RTFoQ0Z4UkQ5TEJUcFRP?=
 =?utf-8?B?OW9Cazl1dTAvVWVUWXNKeWREKzlVc2p2WjE3Y21MdFZENDJOellvWmRxOW50?=
 =?utf-8?B?bVdaTzljR041OThwelFuQWZHc21RVVRzZGsvbzZyZVlnWnNjTGgyUmRwZWlS?=
 =?utf-8?B?Z2ZmaDlKZjM2YnE4UWI0M2J6K3BGRFBpa0dIWERnWVZpVmxEdHNQZUVDZTVw?=
 =?utf-8?B?Q0JFa3JqVDg5ZklDbWd1VkZiczdSRXZQNXcrZ0ZVTjVkY3ptZ3dxa252UWNo?=
 =?utf-8?B?cWIvdW9Wb05QNk5Ja0ZHc0Z0MnNraVJlSitacXk2Q3B6VWtTSnJrczE0YjNp?=
 =?utf-8?B?Z3hWRFV4ZUVCcFUwWVlEUmx1ZWROcnVDV0plMldDblJYS3JUSzExNnhiTm81?=
 =?utf-8?B?ZGZWOTVrSHRWMmdhUWJoNTh0RWtoRlc0a3N0dDRLTTVOdXFmUnp0R1ljR1VJ?=
 =?utf-8?B?T2xDVlVtU25CN05BTnpxWkNZU2Z1YkFEVHdyOHp1bTVuUlNwa05mdGE0V1hE?=
 =?utf-8?B?cHRPTW5DVXpvYSs0VmR5dUEvby8wUHhKRG1lbHRxbXg5UzJTeG5wOENJQUZn?=
 =?utf-8?B?Z1Y4SGhxR0R0STkyOUtrRy9YZ1ZMMURCK29Ha1M5aDQwWWl3WlZ4UjFUZWU5?=
 =?utf-8?B?N3JndWR3WS8xNHF5UnFuQjVWcVBxRG4vUnMrN2tFb0l4VTQycHI2R3pDNzEr?=
 =?utf-8?Q?mx1zgP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlN5N3VLcmtHQmZwUVg2akpHU0xlcU1iNWI3d2U0YzZVNDA1K3hLV3ZCUCtz?=
 =?utf-8?B?ei9YZjZ6eTdnMzdja3VuTDZjbFZnOUxrdm82eGl3ZHE2ejEwN3A0QTB2dG13?=
 =?utf-8?B?UUxQSWdoU2Uzekx4MzdOMy9oS08vZjVnQ2lBbXJ5cEJieVg3dzI0TXBDWkxl?=
 =?utf-8?B?a0hLL1ViQVNQS01PUEQvRUxHb3dTMnFmWlZweVJaaXpHRUpzemhYb0kzVkUv?=
 =?utf-8?B?akwzR2NqTXFodzJvRDhHdlU3SnREdmRLSmVodUdTMG0yaGVLQndPV2pxREtF?=
 =?utf-8?B?a01MYTFGS3g4QXRNNWxoczVPQ1doa3FvZzR0b0JpNEFDMVE4c1NiM2hEU3Vs?=
 =?utf-8?B?c0g3Z1NtQ1d2YnM5OFkzY1dUeEY1YTZ3bE0xcVBURmpsRm5xSWYrQnFzR3Nr?=
 =?utf-8?B?NUlKam11WE91TWpHNGtlMitqTVRBRTludHhrMzQ3ZHVGZTR6dHN4WnlTeE1Z?=
 =?utf-8?B?MjZGM0tnOHRDY2lnMnRKS3BPTFo4ZHk2N1d2dENqMnIzaTM2TmpoVEU0RWR4?=
 =?utf-8?B?UkIrc0hCZkFWb1BPUGVJSVdOVFgvUU90OXBRM0FCRW1xSUlscWNyQ2tiT0lN?=
 =?utf-8?B?dDhpalhCOHoyaEM1V0RoeWZoamFDOXJ3ck04OEc4Vk0zdExIdHpnNzc2QXBF?=
 =?utf-8?B?WjlyWnhoRTkza0FsVnYyci9INzQ4YVpOT0lIVzFhMzQvWENHTy84cmhJTVFN?=
 =?utf-8?B?VU9ncENkVVFrRkVSeXBYQUZkaUJVKzM5SUtuK3NSb1VMdjhyRzhtTUpXSkdR?=
 =?utf-8?B?aENGY0VqblBLdXIzSkNoNll3OGJrV3R5Y3R5bkpMTUxmR1pHci9GampXOG13?=
 =?utf-8?B?M0FWQk9QVkkrM2M2cWRNNE9XeGJlOFRnYUJzWi83eHVlb2c3RkkwSVBuK01D?=
 =?utf-8?B?SnN4M0o5OGkvUUNiNkFPR1AzU3FZbGFlL1RXR251ODFKUHFvM3Vnakp3Wk4w?=
 =?utf-8?B?WTBsSjkreHF1RjF6aUxCTkx2azFTRFlVRy92SFR5MjZYREhIaDdrd09HM2Ja?=
 =?utf-8?B?L2hVcjZJK1NsSDkxb01taHorUFAxWjlZR2d0Z3VCeEhEbDJ0SEdOWVR0TnFn?=
 =?utf-8?B?MEFycWp3VHFVZmJXNEsrSXJoY2RveGN5Q1dQNXVjR3JDRWR1RGNWM1VmYm9v?=
 =?utf-8?B?SUNJWElrTnc2eC8rR05YdHZKRHVmaVFBemF1L3RnaExBUmM2Tzl2WWYzOE5H?=
 =?utf-8?B?b3MzUk9CMmxmQVJHUWZ5aFAzOVlVbnl0TmZBQVJpWWRMU01XOHlScHl0V2NY?=
 =?utf-8?B?NG01RUd1Wjk4S0xqVCtTcUlTa1lBRzMxMS82UDY5RzdQQkUxeDhsNnI0YWNw?=
 =?utf-8?B?cExDRDlnRjgrYlRsaDNtcncvcDc4Z0VaT0dlNnpOeEFwb1dQRXUvUkhzeXRU?=
 =?utf-8?B?NmVZL2l1NXhBekVoM0d2N0N5d2JiTGFqTENMNkVJbWt4cVZDZ2xhdGdRRlhS?=
 =?utf-8?B?VVFxSFNqK2FQck80dmxnd1lMMGloR3ZISUFncXBmVzIrd3k2UmZlbklTVFZQ?=
 =?utf-8?B?N3RPVklLMzYxWGFoUldHS2JmT2N3ZEQ0RndKOHlTOXBSTWRCNy9LU0gzRm9a?=
 =?utf-8?B?eEloY0g3dVZOWEI1cE9IdnFGdnhxdDlmZ1kvQ2w3cG4zOUhUbzM4RkRGTnNZ?=
 =?utf-8?B?U0IyMVU2TVJDUTUyR2RoRkRHN045SXJuWWZXSUs4aElSS2VBdjA3L3RQR3l1?=
 =?utf-8?B?bFByemVjSEdMaCtTZWZUOXBYLzVjRzFWZ3pDMzZYMDZUL3BUUFlrbkxmZ1NW?=
 =?utf-8?B?QjZsa3dnZE5kV2tUMnZiM1VzQW5xZ2lMeDF2SmtvN2VxUitFRTN2WlovUXNR?=
 =?utf-8?B?TUFNS2VGOS94Zk1COC9rRldYS0pmeWF4UVltbnVwazVjSFNjTElsRTk5SkxB?=
 =?utf-8?B?bG1aRUVaakpiWnZMWnY0Q2gyZVlyTkVaWThwSitaR2U0Qk80Rk5TUmNMSUgr?=
 =?utf-8?B?SXh6dXQvRkI0Y0tUd0U2SXY5Rjdsa0NVdVU3a2d3UmkyR3BNbHhwZXI1b1B2?=
 =?utf-8?B?Qzg4UDlvdUt4a0o5OWlyNnA2WlUzZ2lKRElnK3RZQlh2dHczbjdjcElsY2tY?=
 =?utf-8?B?clgrTEpFMDlZU2ZhYVBWdGgzRWVGRnhUYmdpcWRoa3ZESjFEUnVGOThCSzR3?=
 =?utf-8?Q?odYvJFJ+qvTaJYxEYgiY1dYZX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e67dfc-716d-42f1-325d-08de3e016a3f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:48:13.2962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJqpd7P0X3J/fwFLgpNALd8WEbMnOX/KjZVvU/IPXV/HKJJFamqor9qM0TStazey0Vh17zfV1IH8z50ezvKerQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_224816_251296_AF48AF05 
X-CRM114-Status: GOOD (  10.70  )
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

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0



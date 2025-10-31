Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A907BCCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBYaLyo10ue0EWz7wQU83apQu4zthKLaYqTwGy4qnUA=; b=d0Ib0HYgzNKDfx3aW3CItvCGNp
	rtpE48U4lirduI8H4oYpGFQkQrCY+IDV/+/c31BRBkaK2ZWcdX7qvvwUXLdJm2+GW6pP3mZjuuCnW
	m2UmgVCGalZlvuHjg0zwglNZh121rBoAgmDeZNBVHCdzqAf9cJUsGNFl1VRMsz9bdUXB9Ga6iVMcC
	ql5Uzgu9FFMYlfQfRBvg0oQEeatfsavQYfNe5fxziAkoAR1mmqQyWAwdlHuYdHUKoqhVDPWScRGti
	4a6E3QZox7DYcaRkCTFD/aJWdM5zi6Bn9YP2fzeoV/ugcHIerSfWwgkGUr3JjaAr4uhds3JxRHYAt
	v9gGz4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiuu-00000005UXQ-1f8Y;
	Fri, 31 Oct 2025 06:47:20 +0000
Received: from mail-northeuropeazon11020127.outbound.protection.outlook.com ([52.101.84.127] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiup-00000005UX2-3y42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 06:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EndzDSj8T8Oi4hPTfrrLYhwe8S0PApYcmnFMlaqCqf3xoOy/IpVeLSncXCT2h5LKF7KnUkx+fBIEkWSd5Qd+mzsF84Py6yC5OCamconKYflY99kNQGB5BAOORvhedgnqga6Z8b2ok1h37SF0kB+Lc8131i00Z9qKwciYa5YNsh1bo3fRlAVWD5uTorFw7D1mVG7/8nbZYw1sIgP1ODhNFEpU+jHZfnXBcqnC/WYCo+V7wAQmvJZZY/AWvzTIcFEdDS5BS4BKX6wRmU9s+FGJrj2CkNILgKIqvTnH3Tzi3MftXXNAGdKMdov23baC9L73rjrxb/CcnicTKfvPod6qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBYaLyo10ue0EWz7wQU83apQu4zthKLaYqTwGy4qnUA=;
 b=sVbVkCeTWP12XccEPnPsL+JgKttkpc+kfjX4khzl0Q+oGtRDhWZqhrFPtIuUvj3pp22E0Ru8Pst2HXOevc3oqGL3EMfoxAMzfVEPFRZbSl4S/qpgxGwyizBpR7zEjBYZl8VTxZB90mStIydB3Y1TX1EFYSXjpx2H8qvF774/br5qOIA2jGgJ1rUivkxzCykb04IiIjNH2G0IFXsXX7NdUZppXLgDFUEnDjSy+EPt1+xp2889Z9spJneApK2LpWkoc3cjgov7Zmj4+IizGG+q6aMWPK9/nFZ3vgUXkxWZw4xxRS20Nv9JcQOGD/JUE1vnmaFzpyyYQMYqhWElhtLBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBYaLyo10ue0EWz7wQU83apQu4zthKLaYqTwGy4qnUA=;
 b=LQXU3WjwN7QGSyEnnA8euGGElMlgwYPniWjKhnALC7cLUIkuf4rKx721tYBgdCH/Yxn/Dxi9zPKqzkIOreXGy2fg1/8wEl7nQ7GWpctLaSFMas+jUfHp8NrObXFbheXXQqU5RT4TW9Jgs6FAN/QumX+0nz2SG58QD6GczF/XMW4nCE7nmFhXeRJt2umNb15xhjkgspQiTkqC5WS4rFeb0vGuaAw2iqZLQQ8gzfwyHK7eSr2XNIEBsYaGptI6I9a3FkicPx+QJ3LhI1AIC1m/zuQc6x2VfqXCKTCxJ1+0gkwgMbxPYSuSwJ1ZZCb7Jew+tyywFz3usTxrF6x15XVqEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by PAXPR04MB9278.eurprd04.prod.outlook.com (2603:10a6:102:2b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 06:47:07 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:47:04 +0000
Message-ID: <90911798-b692-4bd0-9efe-50268ff8bee6@gocontroll.com>
Date: Fri, 31 Oct 2025 07:46:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
 <20251030-mini_iv-v3-1-ef56c4d9f219@gocontroll.com>
 <20251030-unfailing-venue-e27a74ebab2d@spud>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251030-unfailing-venue-e27a74ebab2d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::15) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|PAXPR04MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c0064b-959d-404c-b513-08de18494d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0FINlcrcG5FbzFYWXZuMFNHemRNMURmKzhTT3lGRStKejFRcFJXbnR0d0Vl?=
 =?utf-8?B?R25qSUlyYnVGVzBjNk9uUWJmcGRJcWZBRVJBN1J4VlVjOEhSZVcyaldlYVkw?=
 =?utf-8?B?OFE5bDhYWVBTdHU0cFp5QktNUDQySENhN3lpSmQ2Q09KTXRnZXltdmV4WXlw?=
 =?utf-8?B?STBVTG5FRUN0WmRNTkNER1N1ZHBTbkNHNi9jYXd0c2dkMDN6bldHVnYxQkgx?=
 =?utf-8?B?UzRrU2p6MkZCdXVvallYbHFkc08wV0g4bXBFTFJXQlJhcnZIdkpENXpDcnFC?=
 =?utf-8?B?bjJxbFlFTEVKWGhmclgraEtURUJyRXo3bjdyeEhEUHEweDV2Yk5qQ1ZCMWc5?=
 =?utf-8?B?U29VQkt0N1p3SlYzSjQ4dmZZTUF6RExtdVpqc0J4VjArN1o4dU93UmJPdjJ4?=
 =?utf-8?B?UEYxdjdMMi9MYVBlTjZsTnh3Nzl6VUJvOC9FdGJZWkJaeFI5YVUxYTVOODJZ?=
 =?utf-8?B?cHNLbzV5Rm00S3c5TkR2V21SWThWTGdNRGFKbE9FMURLVlFXNmF0a0VNOGUz?=
 =?utf-8?B?aG90aS90UFlUT0RueHNMeWxDVnk4aFROYXZsa1BuZ0FpZXBhbS9KVjc0dkk0?=
 =?utf-8?B?a2l2UDNMOFh5Z0dnWGVsNHVhZmZQaGQ2alRvQmxqVi9xdE42UzRJVXlQalJk?=
 =?utf-8?B?aGFBOUpZMWV4M05IL2laUzU4UTdiQ1lpYXJQdFhnTHBWZkxPck5EeCttVExY?=
 =?utf-8?B?amgza1hURWpPTk1DYjMzR24ybmFXdVlTYUhaT2xMRmd1SVo1MnNSaFNhaU9p?=
 =?utf-8?B?aXpBUGtHMUtsR2RoNWM0QnhYNEtlRUw5VXdQZFVzT21MbHNqSDl5cGFCaFkv?=
 =?utf-8?B?MVhSVFVqVGZEN0gzQnlPcStFaGNzM0dXNFJFeGRTZXhjWXlzdkFkS1l0QS8v?=
 =?utf-8?B?MERIU1RNTlc0a3REbnhmN1NtTGRVcFNBb2NMRTl0QjFERDRaWVdHdHNBRjV6?=
 =?utf-8?B?Uzh6OGtxZTRjVityWTFrTUk0U05kZkhpZlQwVThRUHdpK3JCOXBWdE1vT0V0?=
 =?utf-8?B?YVQzRFZLWUF4SVh5YWIwRlk2aGhNeVpHSFFKWmJqMDRNZWpzc0luYzN0c001?=
 =?utf-8?B?QWxrM21ud05vby9YNlhTUURSWkMzOGZNc1N5U1p0VVZJVVBLZ21YR2tyWmxq?=
 =?utf-8?B?Ty9MdjNqV0pNVXdac28rVzc4VmhNbnF2NHdXeG9Td3pXUmw3SHhoWTZEK3Zr?=
 =?utf-8?B?ZCtQRHFtQ2E1c2JSazRmeHVnOXFQekFTVEZvcG83V1RkN2pGTGorb3RQN2Rn?=
 =?utf-8?B?VExiTFZaWlp5dWVQczlPQmN1Sy83bGUwa3k4a2w3azJXa0QwZGZsL2FpWUZl?=
 =?utf-8?B?WlhHelpKNWVoOUVkV3FuTVBiLzUrUHF5UmlHemdUamoxQ1VwbDM2K3JpajdQ?=
 =?utf-8?B?N3dwZ2c4WTV3ZVJwRVJNS0pEbDlUUnNzQ2szejcxL21nYW96MDNLZVY2aUI4?=
 =?utf-8?B?K0liZTBqbzRWczhydTFIVkFrMDVCUlZkNEI5dDZ5UUxRa0lhaklKeFBMMjFj?=
 =?utf-8?B?VStaNkNDNXJzSGYxN29tekNaR3BhMkpORkd0ZXpNRnhCdzZzczc1TElwMkVM?=
 =?utf-8?B?WEsxOGdmR25lZVozbitWU0hEUzNpUlpMWmZDOXc5UHVBRTVJc2dEZVhLZ2dW?=
 =?utf-8?B?elVOQzBaMU1RSHJoY0NaTEZaTVcwbkd2UHgrVHViMjFmKytyRjlDU2QrNkdH?=
 =?utf-8?B?S1FMR1RpZlFmVnZCanRkakU1SXd4RytMeVM4bzZ6QTRZQno5K3lxWnRwUE9Q?=
 =?utf-8?B?aWszWEkvQ3Q5bWZKSHk1MmZXb3d1LzV1Sy9oVmRSc0I3dW1wSmMxYytFdUFo?=
 =?utf-8?B?VnRsSkpURmM0N0NTUUxoZDdvd1VZNXdXNnF4SWY4elFqcUZWOFBHL1B1SWhW?=
 =?utf-8?B?R05rQ1Y3RWFCU2JQdlpaMWtpdGZ0eWgxVnJNR0tvVHF4NzBsZzRRUUtHZWRi?=
 =?utf-8?Q?kogzLll+Gj7GG/oDhhrIgmPsAsneK+E3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJHTURVL283bzhaYnpseGNDaXNCZDFKcDZQZ2VwS2ptUXdUS2RiS1JETzBO?=
 =?utf-8?B?NDJMeDRGdzBTaERXU2w5c1F5dkluTG5tT1FreFpPQUxkZHc1amlyc0tNVG5O?=
 =?utf-8?B?MDJ0aCtENFFhR0Jna3pzRDIvQ1pac3ZlajkwbGVFMXZFMEZONklHZkNzZnNu?=
 =?utf-8?B?Njg2WkZiWERPdE1FcUluQXFsaTF1c0ZBZkd4ZmtkejlTcUpzS28wLzZrWjgz?=
 =?utf-8?B?U2xwalM4MHp4d3JBaUZOL1dyVVMyR0ExejZwWi9IckxEZm4zQmU4R1hkaU1G?=
 =?utf-8?B?TWlpWDMwaElPR2h4TWZQWERkMnhZSjBQY0haZ1o4QzdRb0NSUUQ0KzkxMkxl?=
 =?utf-8?B?Z2RQL2FnVzl4ajhqVXIzYjdiZ2JtVVpoZng3MEZxY25nVW9hTzBnSnZiRGcz?=
 =?utf-8?B?OXdUY29abExwNGxCZG9sYjhlZy9jU2tIODYxMG1QdFlVbms2dmVGaXkvVEdO?=
 =?utf-8?B?UUhwZGVrVnNPdU1Sb1pFQTJwT3NMTFQrVkU1QUEvRkNhMm5YR1B2c1J3ZlVK?=
 =?utf-8?B?Vy95bE1ncHVCVi9zMGNndmcrMmsrdExmc1cvcnYzZUR6MUsrVDBhUExPVXlY?=
 =?utf-8?B?MmJ1eHVnZ2hHVG8yem14Q2wwNzZWMDhDZFJRSnRjbE9VOWpMNkFxczA0RUtD?=
 =?utf-8?B?R2NkUE56Rk9mT2d2cGp2TEhVS1VZUXFOWTBKL05WN2YxZk1NYVMveWlPekxX?=
 =?utf-8?B?SVpwUGhzdER1SXdpR0NOM05yQy9XVmw5RC9wTUZrc0FXaWE4NHh0REEwUElG?=
 =?utf-8?B?cjlkN3hvaDFJSTZBL3daNVo4b3ZIcWJiMmZuL0pDdzBqR3dYMkxndU5QYWRZ?=
 =?utf-8?B?OUJzb2NpYmt2SzJWNENDTTNCaHpTQXFDMW1qc0hvTFV2SThzUFdQUzFFTXhL?=
 =?utf-8?B?YVdiNWJvTGZQZlpaWi8wTjJUTHhuU1lSZDlwWEI0UGkyb3dZMWJzUmI3TDdC?=
 =?utf-8?B?SUJKM0twSlBZNjFWRzV6ZVAzcHhNdEx6MC9DUXkvREJDK0Y1MW9YWllSUytH?=
 =?utf-8?B?WlQ1eVBoVWZuMXFEN3plWmVERFhUU3g0bTA1TGwrSTR3MzMzZ3pSaFM1OWFU?=
 =?utf-8?B?NkIrZmpzVW9SWUMxdXRoY05YVml5NDVEdTJpZEw0bzEwRHBaNWdOVkkrUHhF?=
 =?utf-8?B?b2FNRlBUWG5oZlpuY3lIY2tSdWtpTmpHeWoxK3hndDNXNXprOWxQcnhhVnlF?=
 =?utf-8?B?OVFSZWlJOXhGREtONUtaK2Y0SnZuNUhuSnEwRzBZeTBYZWdrQW5qUGtZT2Ft?=
 =?utf-8?B?QnhFVE9tTmRWeUxHSTVSRUZ3V29BR09Vak4yZjBBT2FDSi9JUnh0aU45ZWdH?=
 =?utf-8?B?T1FpeGtzbXFZejI4dlp4enF4RnBKbUpLT3JpTDBNb1A1ZGZ1aitmN3A0Qi91?=
 =?utf-8?B?MlVnL2VQdlkyeG96NU4rTTB3eVVUeDZ6dVpteXg5Z1hVK0FNVnBOczFqSWJB?=
 =?utf-8?B?clF1QnVySm5YUFVaSWFtaTNRM290S1ZpSys3emsrQzRBejNCSWUvdjZ6b2My?=
 =?utf-8?B?bU5kZ254UUtORXpJbXJGS01YK3k4N1Jja083Qjk1NWlDcXJkZitINFY2SEM5?=
 =?utf-8?B?cUxBZVBiTHNxN0VneFJTK3VjdVFOVk44QUE1Yk9VSlJuRHUxWlZwenBUUGpU?=
 =?utf-8?B?RVNJTGcxS3M0TjAxdzVsamdCL2IxVGR4cmpsRGxtd1paV2ozczlrMEF2WDBR?=
 =?utf-8?B?aDNKR0NhU2tsMFFrb0FHZUJ0ZFFyTkRhcktpWldYVVJ2aWxHdThjYXk0ekU4?=
 =?utf-8?B?dVhDWTVrbjB0UlBPMDV1UlVVUjZFOENrb0lxMmJEelE3eVdVYy9pWkZIMGFh?=
 =?utf-8?B?dUxIWFlFK2dIczIzaEN4aWV1SEdOMWFKNlpsSTVHTzNYejlwY3ZUdFQ0bkdN?=
 =?utf-8?B?eko0UGxNa2JUc1hXYktEd0FTV3loUERCb0ZEWWtudituMHBnN2tIUFNWc1lP?=
 =?utf-8?B?VkpaMnc3NDhrVnFEOFd2aHV2YmhEcXJwZWhEOWM2aWt6L2p3T0YvTDJQMEhk?=
 =?utf-8?B?OUVzTjcrWFI3dy92SHVUcXMwQU0rU2JNWGU0U1lRRkVnd0ZWT3pSc2k1RHJp?=
 =?utf-8?B?bUx0UEd4dXc2dzMyaGpRa3FmMmhLeFltc3BvQ0lYZm1la1FMY3ovQ1F4Qmdj?=
 =?utf-8?B?aVJ4WFZydDlxaVVNYXJOb0E1dGcwYWNSMEFaZmpNTUN6SWNUOG5WbmQrVUFR?=
 =?utf-8?B?YnZnTFpVamtyV21MYTdyemx1MWE5QnRoVnNuaVVYandqbG9hYVgyUGJyZTIr?=
 =?utf-8?B?MXQxWHhsRnVjdmJzVUM1M1prbHJBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c0064b-959d-404c-b513-08de18494d90
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:47:04.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3fnPl7D9Gx4yeVYUwszT4343SAsy9SnqcJ88sOixXiI86twWhzw15pbvTBGksgKsFaM9RcRZZD4f/DbexE30koEJX9GFnTWakEgNtHnDj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_234717_346538_188E9340 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Conor

On 10/30/25 19:34, Conor Dooley wrote:
> On Thu, Oct 30, 2025 at 07:35:37AM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> Document the compatible strings for the Moduline IV and Mini.
> 
>> Also add a compatible for the Ka-Ro Electronics TX8M-1610
> 
> This is not very helpful to say, makes what you've done seem accidental.
> I assumed this was wrong, until I looked up this device and found out it
> was a SoM. Please put that in the commit message.
> With that info,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: changes-requested
> 

Thanks for the review, new commit message will be:

Document the compatible strings for the Moduline IV and Mini.

Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM which they 
are based on.

---
Kind regards,
Maud



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E52CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neQKJ8aJZD8JESyNpqPO4ZKaeTzt05wcfAJ1rAkNh5s=; b=DVAbrGlES2GHuaLEOLGOMOIBwq
	oV8P3k0x8CUA40TQ1WkHOrfIVQQCIkBE2cjz9/0otcDV6UbPDctDqvzDcH50x7ZPiR2/bSDHaoJke
	LuOyHveAg6pRMLZQu1I2vE/yTUAWPB+KxJlPZMJYq8X8iZIEB+mlAnON3o992TDYXAF2cOyyk8zNG
	Wgk6Apb91/iNYeRIBqW3+5w3Mu2Z2Rg+OefuWddRjhNgnIFKYnypCQXJ+xh1z1YCh+1ZrQ5xsG6NR
	9Y9kmERvY2IUKt9VL4/ShIEBd3tHuu2OtXF2BFWNwA/+2lgGNEfGgPeeWxB+BtB7968VbYjZQ8K86
	9ZljQ0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECH0-00000002giW-1lQW;
	Wed, 29 Oct 2025 19:55:58 +0000
Received: from mail-westeuropeazon11011035.outbound.protection.outlook.com ([52.101.70.35] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECGd-00000002gFX-3RCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:55:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxLrbMDvi054w9M1nGERWUDZjcpZWww4rrqU2F60ZDa61/zOYf+DL+zpWCvdGWLvuN+HNafGIvhPSVuNJRtfkGc+ASQQEw8uUoxkZh1y4MFgNF6b0O+Hi8eCvkcGmSywqlvSyyCSCz7cuoWtI6XMsXheYgAKxowTWZsnLbNsyL/MK7iOQGAGbOptg6zPznQIhSonXZMVtfnzj7BpzItc8gN1CNoY5PyVt46+UahHwVxjkcTYrda8u0IstoloTu8j0Y+QRom/Lo151hlAEY92hGfBkoN9Xqd0VPWbMVEmHELMFjkP6GiEtYRC62xj8V571kij3uTUowihNy4HFlIt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neQKJ8aJZD8JESyNpqPO4ZKaeTzt05wcfAJ1rAkNh5s=;
 b=I5azQt+DnJH+TV4XytcJCJcfGMuYIw+xm/0SFu8KC3udx6/pf0WAoLciPgDTIGVSfvryyiQ/BKsOC1dYOO0qDanN3BxQAn5F3jAbXHiP9Upeho3nUAuT4rYiEq4no5/YP+KMujNBMqXVuTbwNMw+AmmOBdzrbEWjPgjX6YKLTb6rWCeJ92IJpJjKGpqlmxUwmk4oYvRcg0EQpX2E1SWLymqHaYPCP05ht2VuJPDxVzsPoUQH5TBrxsDwtoEkw4VOMYGvOtTKNf7ifTfd71pQPBCNdUJekPtEu+Qd3QTJXqNj1QAikRZBMEFk8wL//U3KUMEXAj/LZUcz0+LJ5sZg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neQKJ8aJZD8JESyNpqPO4ZKaeTzt05wcfAJ1rAkNh5s=;
 b=QYFyI9IcEDeMnIMRejhg2khmmrLsUgYnIigxhFdiM08hzUr/3OnRPk0eIS6RGYP/wJzTgYdKyvcMbFsrzH5+pzpK/wlhPNv4zwWpL4JVunyqmPKYmt7rLr8HtptTUG2TqVNUpnVUKg1y+jMsYSIGME+NAREx3geaznq6/7dS1yjwso8+9my9hogHnSJpx7/v143A9LddpVY+Ikd2iq5/Nkr+xPXmrwu4Oyt3ZuOPBR8tnt7kbCdBbBNRklSCO7soUlkIXeX3KoO90ia8iCfoZziQi4sZ5X+uA1KfZd4I5SsWJNt0/0F/+Aj1m7PaKx6bfx2/54v0dKPTqBzGKKX9ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS1PR04MB9682.eurprd04.prod.outlook.com (2603:10a6:20b:472::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 19:55:29 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 19:55:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 29 Oct 2025 15:54:48 -0400
Subject: [PATCH 12/12] arm64: dts: imx8qxp-mek: change space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-8qxp_dts-v1-12-cf61b7e5fc78@nxp.com>
References: <20251029-8qxp_dts-v1-0-cf61b7e5fc78@nxp.com>
In-Reply-To: <20251029-8qxp_dts-v1-0-cf61b7e5fc78@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761767689; l=3904;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=nSkYSEnneW2ikK462U9KEcBionXiBXga9jbdZy2vBYk=;
 b=V1iIAK/xdxyU61s44510qP2S7jcCjyZncJlj8p8t8QUFv4Xx/rM57v8YsBTqQafRCY6NHPN3/
 gC9h8q3nbNvDTB7fDI24p5uuQO0cFtxcsA4FrIWJNK4EjhACgAtKJv3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::24) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS1PR04MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: ff28cf10-9073-4705-f661-08de17251c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzQ1U3p0M3EzSWhZczFua216dnVPOEpqTmVkck1sOTNCRWtTL0ZlRzJ6OUEy?=
 =?utf-8?B?aGJqZitIRkgrZ0FKa2JhcTlmREMyR1F3clVVOWRuOW5EZGovQzU2ajJoTTlK?=
 =?utf-8?B?V29GQ2hRZjljOTFzbHVLcFYrb2xUcTNRQ1IzeDNySEMwY1Zsb1B5cHpNYlpz?=
 =?utf-8?B?UmhkckkweERmVmczTVBVYUxyRWs5d3dobSs3YTJRdi9wZ2Q0WjdYVU1HQ040?=
 =?utf-8?B?TUtJRmM5bG8zeVZBeS9BVlNOYnF1Nlp5MkJ1eVZXQ25mMzBtQVU2enVLSko4?=
 =?utf-8?B?M1FyczFkQjlnRGFnUmg4RGJOcW1HNGtmRzV3UnFaaHVZcmw5dWNQZzFHT2NV?=
 =?utf-8?B?aUNDaVE1RkFLNE5LNUxWNnNUVVA5VGUvczVXOGZoNnZnOWN2aHczeitmUm9i?=
 =?utf-8?B?V01qek9OaU42TVNTV1pjL2czcklUdE9JRmR1TW0vWk5wU3NGaUpoQ2pGRjRZ?=
 =?utf-8?B?MkNhVkJ6U08xUDZ5eW5rK0NUd3Fnd1Z3U1Bmd0d1MzJYQkpGQzFBd1o3SDdx?=
 =?utf-8?B?NGNBS1N4NzFMOVMyamJwUnlkejBXOUxTdU8xdXRPZVJWWWdkMkxzb1dKZkZH?=
 =?utf-8?B?QWN0eG41OG9sNWNlYnpJaUZ6SmZ6ZHZZc0ZLZkk4a0VzcTY1bEF4MGFpWXdM?=
 =?utf-8?B?NUJOZ1I0RnJRTUlrYXZJaWxUbEdSR09SM1p1QnZvQTA0dkVsTkxyZ1VzaEFE?=
 =?utf-8?B?MWd3eVZDR0tCSmlSemxXajZOMVlIVnd4eDdBY0NqMWpFMzVSalArclUxWmJm?=
 =?utf-8?B?dktudDVRRGxWWTE2d0pCQTVVeGdobVdYSURCSExoNGVnYUVMd3R3NE5NZExC?=
 =?utf-8?B?Tjh5UDZaeVNkbk5QKyt5Ukc5ZVdKNExlc1pFK0FtcUE2bkJjeVpzN1ZybmlF?=
 =?utf-8?B?UzZqR3MzUnRyTXhRcjk4WVlLSXg1SzRVMGdwOGlWTm9zOVMzNFJTYzZLMTUx?=
 =?utf-8?B?aGRIckhCVUUzMmZ3UmNWNE85SDZIZTFNdXR5TEpzdW9JeGNKY1ZOZGRXdkxJ?=
 =?utf-8?B?cWc2MDEvU3JveUJOTUl1Vk5oOUtvZVd2a2xQN1Z1QUsvMXFkb3lITTk0WHBD?=
 =?utf-8?B?N1l3ZHl3VkxBVzlZVGY5Q04xcld2MlVYTzdNcUh1UFMrTWlJUTA0Qi9qOEsw?=
 =?utf-8?B?Z0hrU1J2YzM0bjB3dThxWFZYUG1tUktqeEdULzUrZUlZU2lsZEtYUTVMRTMz?=
 =?utf-8?B?cWwwa09Ld0NkZTVEYVdycHJSdzFaVG5zeFNqR2NvbVpFVHR6MkpwVFZJVmFS?=
 =?utf-8?B?ejYwRlhHcVFBTjFVWHFZZjQ3eWxlRFBoUnI3dGpHcnJaQUR4ZGlGeEY0K0Ux?=
 =?utf-8?B?eHRBS2FNNk5VTWE5ajcxTDdta0pCdjFxdC91WkY1Y0VrVk5hcEFhZkpjRTBF?=
 =?utf-8?B?dDZGM0lWcE9NWFZabDc2QTlzMkpUMmkydTZSMGVNRUlFcEZrQ1RqbVh0OEpt?=
 =?utf-8?B?ajdacUFEMjZ2ZE1BQjc3WTNkejk1cGtJSEZxdDIxVTcxTWdSNWR3cGErU0pu?=
 =?utf-8?B?MTE3TFk2VTN6N0dWWW1CWEpuSGpVQm9hN0VkV3RYY1M2ZGRBd0VaUXlEZUto?=
 =?utf-8?B?RkRPbkxYNy9hY2NBM09kdmtaZmJOOG9ab1JYSTl3RzZsOThCVHVFK0tyKzRW?=
 =?utf-8?B?eDRnZ0NMVzNBaTdDVkJkZVliQXZBd2xXOFRUajJzUHVpQ25jc1JOdUgxeDN5?=
 =?utf-8?B?NHZnNGQvN2dsaEJKOGhOczBVZnlnTE1qMnA2TTYrdWlJWFowZzI5dW9hb0VD?=
 =?utf-8?B?TmV0TXZzYnV4NmV2a3RMcGd6Q1lmRi9MVm43RVlQZU11T1ZHa0pPS2xVb2c0?=
 =?utf-8?B?REt4bWdGYWtobGtxU3Z4K3BtWTFqcjFrYjdjZ3FkRXFFdVVRd0lZaXFDRElw?=
 =?utf-8?B?OWlnSFhaQ3hndTRyU0JNS2ludmZwbHdGdXBIVUF0c2YwMVp5T1NmUzB1MVFU?=
 =?utf-8?B?Nm1XOG4rckloRDZ0aG91aFZtWU9UMnh1OG9CWGgweHJRbm9Tb2lhT0FiL0ww?=
 =?utf-8?B?RnpZcTNiWjNQZzR2U0ZpVENMK1VhY0VBV0U3WCtwM1JZWXQ3MHQ5cysraTB1?=
 =?utf-8?Q?r5vBL1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFyaFU0RVB3WWltSmo3Y2EzMXhoZWlobG1HWDh5VjFPYkRWV1BDcjJQMUtL?=
 =?utf-8?B?Y1crbVRsdThvTXkrSXc2V1RBc2lLV3JzQXI1dlovQ015b1l2a3AzMnZybHh5?=
 =?utf-8?B?b0Z4bnVXdTdBalNQSk5GVTB0ZHFOUk1qM0lUTXFIdU9lSkltUW1UMWZDdkd3?=
 =?utf-8?B?MCtGQWhTZVhEWE5XQ2dkTUU0SnEvQUtzNjlXVmhDV084UUx1WW9HeGVXZXVM?=
 =?utf-8?B?ZjgxUjdDMkY3TzcvaUJmdi9kM1ZocW5pQ2pQeTRIKzh6RHRUVkpON2txOEIy?=
 =?utf-8?B?dnN2S21uOUpNMERjOUwvQ0gyK3htQWRHS0k0MTZPMDc3SFRTRHhrRkdOMGFU?=
 =?utf-8?B?UHM5bi9YRXdiQ04yL0tDVkNxN0RLQk9iTER0V0Q1dlZta0x4emJtWXdRRHk3?=
 =?utf-8?B?RU1GWHBuZWw4RXA4SmpCcEJuN25MYnVPeDcvcW94SWwwek5MbFhYVnpmUEt1?=
 =?utf-8?B?OGxJOEdTUkxoN3RWd3ViZjZYZXZaQjFhUVYxR1BLbTF1b3NIY1B4UndpYlpB?=
 =?utf-8?B?R0dWNUdSR05oU1VEelRUakFjazRLZXFuUVNDMFhiSFJTREdaMlNCZXBjUDhH?=
 =?utf-8?B?Slo1VlRRaE9jc25PSmE3VG5FVitEa3ZqL2l4YnJWK2diUXpGdWxKY3JRVHVQ?=
 =?utf-8?B?bERaajVQWldESTlDQ0N1Zk9EZnNXSnNhMXBvamxhOG11SUtmbnl4RW1uS0Zv?=
 =?utf-8?B?bURmd0FUY2Nkelc2VjIvdHVpWjdXb0h4NEhlSmtXNHZFeWJ2VGozWVlDS0h0?=
 =?utf-8?B?UVRxbFlmeER4MWF0WE13TkVRZlFRRW1BaW9sN2g0Y2hIWTdJL1k3bmRQNnM1?=
 =?utf-8?B?VXk2WEE4cGVORkgxOXhIbDcwS1VzZWNGR3ZQQkMvQno3VnNURDZERk9nNlo5?=
 =?utf-8?B?eS82dzd1eHlXanplbExZZEtBaVhUMUUwazhDMXJzYnNZNU9Jb2l3M05HUjV4?=
 =?utf-8?B?Nlh5ZnRlaVlrMVZMWVFnY2sxVVRWSllaejIvNm5KcTF0Z2pTMGROblBCOFR0?=
 =?utf-8?B?bmNjRXE5RGc0U1V2VHhxWmZEQmI0WTlMMG9CL1VjUm8wV01scCtPb25DQTdV?=
 =?utf-8?B?Z1lUNm15MnNKRlhrR2pNRlk5QXpMLzBXUUMvck9aOVBnejNYUlBQaG5uQVR6?=
 =?utf-8?B?cURwOHFJb295QTVCQnBLektxaTJqUE53elN3MUJWazhJWHczMW56aVMwUnR1?=
 =?utf-8?B?L3NEc2lKaVB5R1l6Sjk0MU44UlBhSkp2TTZTQm9GK2Z3VURRSml4UnUzOU5M?=
 =?utf-8?B?VnR1THZGVUpSK0lGQ0lMTUFpMEo3TnhMREtrRkdKZGc4cFZ6bUczUmpLYlpa?=
 =?utf-8?B?VkRuSnV6aGxsUG1BY2J3WDFkcC9KdnArMDczTHk0Y3AzTkd0SDl2SXRPbnl5?=
 =?utf-8?B?eXNQWmUzRjM0c3FSUlgyd2dPZm9iYU9xaWx1SHNDdFVSMXd5WjEwT3ZXVkxL?=
 =?utf-8?B?RmIwQzd4N1VBN3pKWVVoVVFwTFhSZURZVVhnU0N0OFdUay9lRkw3NHZXT2t1?=
 =?utf-8?B?RHY0U24zYXQvVFlSMG1pOUpYRTVFVWtTSTVIdkhXYTBBUXdzWjJzZmgvMWpL?=
 =?utf-8?B?TFVJa0IzMG5OZVBHYVl2bTY4ZzhzQ2MxV3F2VmU1RlNQWFNDcHMxMzZLbmo1?=
 =?utf-8?B?UTRtVXRPTmtmWURDcFlmOGN4ZXdDUXlkU3FzcW5mQmhjVlFQbmgvSkl4M2Rv?=
 =?utf-8?B?SWQ2d0ZQWUpEOTBPQ2RiRVJRWExZMDA5MFA4dXdkNTVZazFYazhlSlpkTFk0?=
 =?utf-8?B?eENKUjFnUGFGRERZSG85aXpSWnI0Z01yVGtmS1pNOG42UGR1eW9RYmFOcElE?=
 =?utf-8?B?UmkrNjNUK29SNEJHaFhsZERsVnlQcWZkeEFBWG1EWHk0VFlHYU9QUnlvajRH?=
 =?utf-8?B?RkE5b1lkdUcvQTRYbG1iM29LSWZTUUoyMWcyT2xlZ1lGUWhTc3FRdmR1ZjZX?=
 =?utf-8?B?RnJHblVyRDljMEt6aE1NblVQYStORjFZcTEwS2djdnVkbGZaM2NCczA4c1RI?=
 =?utf-8?B?WWNIQmtjdGJOczZ6SXV0V3hSQ1QwTEVyVmhZWHBOYU9KYVpkUjh5L0Y2am5v?=
 =?utf-8?B?U3ZjQVEzWGt6cFF6N0lSNXdMQWRpQ0txR1hONHZpcnhZcjkxMFRJVmlSNGJI?=
 =?utf-8?Q?ZGOeEAp35xpwqlFaeoQjEDv3C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff28cf10-9073-4705-f661-08de17251c8e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:55:29.5566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yT8Zva+mWLHAt26hcJvIPJw0P8RcLydMPlOSv1gfJnNbxBzM/P8OkuZuf48VVIuG/4Xlz+/yirbiCSosPy3PDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_125535_887220_8853A199 
X-CRM114-Status: UNSURE (   9.62  )
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

Change space with tab to align with code style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 8b47623835bac028c2e4368d26c8891989b4751d..39a1b52f27d676b3e515b2932d75a6b5feb44eba 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -864,8 +864,8 @@ &iomuxc {
 
 	pinctrl_cm40_i2c: cm40i2cgrp {
 		fsl,pins = <
-			IMX8QXP_ADC_IN1_M40_I2C0_SDA                            0x0600004c
-			IMX8QXP_ADC_IN0_M40_I2C0_SCL                            0x0600004c
+			IMX8QXP_ADC_IN1_M40_I2C0_SDA				0x0600004c
+			IMX8QXP_ADC_IN0_M40_I2C0_SCL				0x0600004c
 		>;
 	};
 
@@ -878,16 +878,16 @@ IMX8QXP_ADC_IN0_LSIO_GPIO1_IO10				0xc600004c
 
 	pinctrl_esai0: esai0grp {
 		fsl,pins = <
-			IMX8QXP_ESAI0_FSR_ADMA_ESAI0_FSR           0xc6000040
-			IMX8QXP_ESAI0_FST_ADMA_ESAI0_FST           0xc6000040
-			IMX8QXP_ESAI0_SCKR_ADMA_ESAI0_SCKR         0xc6000040
-			IMX8QXP_ESAI0_SCKT_ADMA_ESAI0_SCKT         0xc6000040
-			IMX8QXP_ESAI0_TX0_ADMA_ESAI0_TX0           0xc6000040
-			IMX8QXP_ESAI0_TX1_ADMA_ESAI0_TX1           0xc6000040
-			IMX8QXP_ESAI0_TX2_RX3_ADMA_ESAI0_TX2_RX3   0xc6000040
-			IMX8QXP_ESAI0_TX3_RX2_ADMA_ESAI0_TX3_RX2   0xc6000040
-			IMX8QXP_ESAI0_TX4_RX1_ADMA_ESAI0_TX4_RX1   0xc6000040
-			IMX8QXP_ESAI0_TX5_RX0_ADMA_ESAI0_TX5_RX0   0xc6000040
+			IMX8QXP_ESAI0_FSR_ADMA_ESAI0_FSR			0xc6000040
+			IMX8QXP_ESAI0_FST_ADMA_ESAI0_FST			0xc6000040
+			IMX8QXP_ESAI0_SCKR_ADMA_ESAI0_SCKR			0xc6000040
+			IMX8QXP_ESAI0_SCKT_ADMA_ESAI0_SCKT			0xc6000040
+			IMX8QXP_ESAI0_TX0_ADMA_ESAI0_TX0			0xc6000040
+			IMX8QXP_ESAI0_TX1_ADMA_ESAI0_TX1			0xc6000040
+			IMX8QXP_ESAI0_TX2_RX3_ADMA_ESAI0_TX2_RX3		0xc6000040
+			IMX8QXP_ESAI0_TX3_RX2_ADMA_ESAI0_TX3_RX2		0xc6000040
+			IMX8QXP_ESAI0_TX4_RX1_ADMA_ESAI0_TX4_RX1		0xc6000040
+			IMX8QXP_ESAI0_TX5_RX0_ADMA_ESAI0_TX5_RX0		0xc6000040
 		>;
 	};
 
@@ -1006,15 +1006,15 @@ IMX8QXP_UART1_CTS_B_ADMA_UART1_CTS_B			0x06000020
 
 	pinctrl_lpuart2: lpuart2grp {
 		fsl,pins = <
-			IMX8QXP_UART2_TX_ADMA_UART2_TX          0x06000020
-			IMX8QXP_UART2_RX_ADMA_UART2_RX          0x06000020
+			IMX8QXP_UART2_TX_ADMA_UART2_TX				0x06000020
+			IMX8QXP_UART2_RX_ADMA_UART2_RX				0x06000020
 		>;
 	};
 
 	pinctrl_lpuart3: lpuart3grp {
 		fsl,pins = <
-			IMX8QXP_FLEXCAN2_TX_ADMA_UART3_TX       0x06000020
-			IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
+			IMX8QXP_FLEXCAN2_TX_ADMA_UART3_TX			0x06000020
+			IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX			0x06000020
 		>;
 	};
 
@@ -1036,13 +1036,13 @@ IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02		0x04000021
 
 	pinctrl_typec: typecgrp {
 		fsl,pins = <
-			IMX8QXP_SPI2_SCK_LSIO_GPIO1_IO03                        0x06000021
+			IMX8QXP_SPI2_SCK_LSIO_GPIO1_IO03			0x06000021
 		>;
 	};
 
 	pinctrl_typec_mux: typecmuxgrp {
 		fsl,pins = <
-			IMX8QXP_ENET0_REFCLK_125M_25M_LSIO_GPIO5_IO09           0x60
+			IMX8QXP_ENET0_REFCLK_125M_25M_LSIO_GPIO5_IO09		0x60
 		>;
 	};
 
@@ -1057,11 +1057,11 @@ IMX8QXP_SAI0_TXFS_ADMA_SAI0_TXFS	0x06000040
 
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
-			IMX8QXP_SAI1_RXD_ADMA_SAI1_RXD     0x06000040
-			IMX8QXP_SAI1_RXC_ADMA_SAI1_TXC     0x06000040
-			IMX8QXP_SAI1_RXFS_ADMA_SAI1_TXFS   0x06000040
-			IMX8QXP_SPI0_CS1_ADMA_SAI1_TXD     0x06000060
-			IMX8QXP_SPI2_CS0_LSIO_GPIO1_IO00   0x06000040
+			IMX8QXP_SAI1_RXD_ADMA_SAI1_RXD				0x06000040
+			IMX8QXP_SAI1_RXC_ADMA_SAI1_TXC				0x06000040
+			IMX8QXP_SAI1_RXFS_ADMA_SAI1_TXFS			0x06000040
+			IMX8QXP_SPI0_CS1_ADMA_SAI1_TXD				0x06000060
+			IMX8QXP_SPI2_CS0_LSIO_GPIO1_IO00			0x06000040
 		>;
 	};
 

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52F1CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzqdn7CrUP1/Ij9Q4ieLj3cGHYshb9divfuyKT3t8Ms=; b=HjoAa8pmr9KolAv1KQy5cms2Xx
	ESToWuJTrdpm6xA+NcVVU5gNlC3XIY0r9A5DCoOzvF+4aL7XlRqsw0iWAksJ+dIXjtBAr66H0Ya1V
	ThfWeGj5D5yUjPNiqvzKFbf/yPCa44RlI5G6m58aEL3grIzoiB3X5lDfHW3tDoTMWD7RwpJnUN1Oj
	ubqmUD9UWc9bNy3b++8pQbn5T1uNCzY0cfFN5TlYl86dSdp9eDp44+Nk3jc7vSrhnHsZBilnconz1
	/EwSAq7Q6Bxl+wil8etTQz1YAGrjE6Py9A7FmcCgnaWdjCY1SYAPstYrpCDEk2gk8rpF87PpqQUVr
	ObkrYiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0V1-00000007J9C-3pKo;
	Thu, 23 Oct 2025 18:57:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0V0-00000007J8P-3L8t
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bzqdn7CrUP1/Ij9Q4ieLj3cGHYshb9divfuyKT3t8Ms=; b=qUfjFhZ0cDLsPuUSXQa315Bhkp
	hQzYM+mRgDCq+UwOQCnRzZhX/SgPzieHda7+NAAqhGPQMEE0fQVXVrn001Sn/8e2Fj75Mn4OVCw87
	R092bn8dyKaUJijUkcewAzFVLD9/v+iP7pFpb/GAg+4sT9D9uUxbYoQuFiQwwCyE12+hgtqJRtRLT
	+H4c1yOp0kDeeUW/jqhFwD5VkgcpfqdBg3645FpN6btj/xEV4Z1ZJqaQAJR0wWUBGtslz3A58iTb0
	GQ92yQM2p7iDGM5Rm/3SSRXbpWpBOAhylNkdMmSr1/d7MfESKWTuS9Zfl9KuhELFUaZfND0Xzn5mM
	1IgimDaw==;
Received: from mail-westeuropeazon11011043.outbound.protection.outlook.com ([52.101.70.43] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzdI-00000001dPg-0rqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:01:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzL6IYxJEB2drF0fPGZDa3JiXB5yp74nA89NA3uS5uDSW7OkwyydWwa7k56eI/0QULfQDcfau6ccwI1tj+6oZRHn0iz8I6hFsLoILhEkPHp/JptmGh98DGN5CPwzn972QiExSsTRL4XChpeWiwF+mbtj8hHo1vefr6+70dSzFwHkGc8anlZ8JVIuITxOlGzUl1b7tDf01MA+kg5UNZjTmr0GEva+Lrm6f78u/vuWa9IwLNGTsLDWXKTlwoi0iO0C19HS81YQEoXTLkhFcSPm348AVEY2NccAOp636EtkdObMAnN0NwqX1ONtiqHdeZZzkrxzWtlwURSnPVu8msZ43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzqdn7CrUP1/Ij9Q4ieLj3cGHYshb9divfuyKT3t8Ms=;
 b=YTcZrtbuzTJ33hSM2U8st17Ho6hleCwAL7Pw6ae3ZUHZaVcaS7TV9uf7eSKGLu3MTeOWth/Esp1DQqbBjebi5LB2VjALFSVyEvyBfitD+e9uLl+3QH9Cf/Q2V1VD2C/tnh/CaN4r059lWLzWQEfJgKTRcPfkYbkIAHb7daElUA4XsLejFytTUsFITMZ/nhP+xQYu9INI7nM6v2hMHLRYmicPE37WJNNDI4VreVaLYItl7emStWpuAP57RWstWNcdpdepfMcEoSWXMdM6wT2JWzPWvUbE68H5CZ1XSZZwzmfQWAcOucXo3l1QvP2lmAmDwENOCU2U53fuqQFMdkcQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzqdn7CrUP1/Ij9Q4ieLj3cGHYshb9divfuyKT3t8Ms=;
 b=R3AdrplPrLCikD/TzRj2HGSjbTK5AJ4PVZzKR2Z2+aXviJTerl86Le6wc/rDh95xg89UY2zoe/FSdKtri9M0wBaLqe3ZQh74i4glHYDz1n0s8tIp/qf1GKC5vuRR2cF1IsdqQN3sj8eR7+ZmjEovbLirP8CxdZoom5yR+QF9oil+OTykyjIWGmbVBUpcGlrN+nvaysf7p5sdrmSJkbSIq/IkO01jucKH3a+tLdvtTbiiV8EzLmUgmKldpYZNNo/YRneeF4+vA5dKwDENAigM/0NHAO864Ovj5pcmBL5jyyRr/GZYfXeQP3c1oM2Sp6JeQI4zrjKaLJveTF8T2BvZSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Thu, 23 Oct
 2025 18:57:16 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:57:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 23 Oct 2025 14:56:43 -0400
Subject: [PATCH 3/6] perf/imx_ddr: Get and enable optional clks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-qm_dts-v1-3-9830d6a45939@nxp.com>
References: <20251023-qm_dts-v1-0-9830d6a45939@nxp.com>
In-Reply-To: <20251023-qm_dts-v1-0-9830d6a45939@nxp.com>
To: Frank Li <Frank.li@nxp.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761245815; l=1320;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TqMcqW+Kxz6E/IDdqx3tbGfcadJsWFZWwfFnfFLUkqc=;
 b=5hIwUQUwrt8dqcBzUsHWRLnNgw44IG5xhoe+tzMlU/8JN47GSt7fXkFSeLUZuqvQ80vd5Dn3+
 IHC5HMXRiHABvtrKqS7J8E29sipbyxYtwAHtFPrFZ9T48EeGHlaEBeF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d72ca1-9cb4-4b9a-78f9-08de1265fb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUJ3bnFMY0hnK2llOCt0OG9BVEM1bU5mSHl3a3htNEVTNGFpc3ZNTVArL2ZN?=
 =?utf-8?B?dEoycXpKTlliWVBDM3dSSTJhVWlKN3piZ2YrcUx6a01YV1QwNThvaVZZRjlp?=
 =?utf-8?B?REVEbUE5Z2h5d1E2WXREMGR6RG9hZytRSDBzOHdZVmxtcktPUzg1RWJNc0dN?=
 =?utf-8?B?M1FJcDArcjVVNWFYZzZMWGNreDVveE9UMld6Q2ErVnEwTWxDREpTOTkxWXcy?=
 =?utf-8?B?d1I0SS83TnZsdTdmUU1iMnlWMXcvWHFmUGpGOTRqRWE0Q1Y3dlFxc1RUMGkv?=
 =?utf-8?B?SDU2SjNXaHE5ZWlOcy9YT2lDV1IxMzFlY29HZGwrM1VNVUZNU2x0cHZxc1hn?=
 =?utf-8?B?RlBZWnRPakY1T1g2Wi9Ba1Q5cGk5T1ZWQSt4ZHpyN1k3RzRIcmpIWXhRL1FZ?=
 =?utf-8?B?Q3EyM3ZjS2djcytwK3FIZXo4R1RqbzdMVTc3dTRocGJ2OURkTEwwbllmUmY5?=
 =?utf-8?B?MUpiM0JFMGVVWi9ib1J2WEpBSEpvR3NNcHM3dnNBVkJDNzVqRWlwa2xJNHBL?=
 =?utf-8?B?NHVXQkhHMit5R3pFbEpPTnhHQWM1WVpjRHdPcWpqWUIyTXQ0bDM4ejVUZlh6?=
 =?utf-8?B?am0xWkwrdXJiR1VmWStyWHdUaU56VVc0Vk9iRTB0dEZJMW1LUFVqLzRtdi9H?=
 =?utf-8?B?Sy9uTzZpSDR4dlNMeS82VlQxTkR6Y1lYeEI0SHpQVnJSVjVPTE5uZmdSUndS?=
 =?utf-8?B?ekRGWUp4Tms3S2xka2laQnpKQ0o0N1BXRUgrbGM4ZmtQY2hKc2dXY2JjSFor?=
 =?utf-8?B?elhJWWVsZk5ueGtYTlJESkpkTUYrV0t1REZ3aTZOSitQQVdGVWlUTVRNOUNv?=
 =?utf-8?B?ZCtNYy9uTDlmaHNTS0E5ancvREgreUNJcHdOOHI3YUE5RVNpUEVCamlxSDQ2?=
 =?utf-8?B?RUtzTCsybEhIRW0xKzd4dEZSUit6UHFyK1l6QlJoVHp4K0x1MFlieGZoZUts?=
 =?utf-8?B?VWZrOWxqSGZhYUlRWG13L2lHS3hwQTJDRkp3bXJFajVRZ3l4R1pxd3FoQmZ4?=
 =?utf-8?B?REpKNEFPTFRFdlhIbVUweWZDcWdlVVJ2VkV6UTNXeFd2SjVJTlNHb05yZkVo?=
 =?utf-8?B?aDNuOVYzM3RySkZZRTlkRlFCeVlNdnMvZEtyTWVQY1VTR2hpbWpuYTU4Mytn?=
 =?utf-8?B?ckFxcU91VVIyeDgySHFGNmNhVnMxd0FQTHQvY1BnaVFTWVBQaEtUUmRHOFFz?=
 =?utf-8?B?Qzh3dWRDR1gvZ1RYbFJrNnBrV0x3NlJQK0JzTTR3bVplM3FGUWc0NDNudjVE?=
 =?utf-8?B?R2ZRNy9TWVg2NHhRcXYvZWNLcVBEVFNlbWN0amg3OUQyckVZUFQ0Q045Yi9v?=
 =?utf-8?B?T1FKTnduZzVaTDFnSTdXZHRLTi9YaUZ6T29zbHhLTGFpdG5HT3ZycFFscVFD?=
 =?utf-8?B?MnBBRExlOEFqZkcwQVNVSGFwdjJPMWRRZ2s4VC9RY1hxaVdSWmRDZEo5NE1p?=
 =?utf-8?B?cWFTYWRhT2FNc21hZUdDU2dwQWpvWUNJbFl6V05QOXdRSy8vam9zWkI5RGw3?=
 =?utf-8?B?MzgzMUlFV2cwQmdTNjBNaDUyV2NvYXZPSmxoSnBDMWVnME5PSXJWeTFVdnlm?=
 =?utf-8?B?ZDhyN2FkOHloVDVPYlhrRXZWdWNXNTluVUgxZkdtdFNrZmcrUXVCVVVNMCtv?=
 =?utf-8?B?MlZuNVkwdkhiQkRUUDgrTVZNKzFtNlFoQzZKU3F2MjVGUFRPNEszUU5Hc1Bk?=
 =?utf-8?B?cmFvZWZRMUpBY3dvdjRCUmtJOFl1YXVUdEU1a0xkSFMvT05LOERWNlRYakxN?=
 =?utf-8?B?dm8wMEZGV2c1d1VSTGtqUHBhRTVxNmxrZWczemJJbFFyUk9lREI3T0N5bXNZ?=
 =?utf-8?B?OTBmcmlGUVVFcjNTUWRid3E3VC93YTRCckd3WWlqTUVoencya3NHMGVjdXM3?=
 =?utf-8?B?YWxKanlVV05YWHd3clJHZ3JUeDBIUkdRdmhndmVjMVBleE9Wc2ptMG04QWxU?=
 =?utf-8?B?RVFhRmNweDdpaGI3UzR1MXIvbEJLTXA3bmpSVXRqSm15UHovbUdZdk1meWg3?=
 =?utf-8?B?Z3U4SityVytWdVVRUGZFa3Z2Myt5YmUrQzR5b0orOGtyUHlvdzJWak5HNnRq?=
 =?utf-8?B?a1FiVUZhUGsxRS9KZGJYMEpZRTY4K1NmUzVnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dQQjVVVDdlMmtRQVZ4eERCdlg2cnhldWNyTUQ1WVJEY0hiNS9Edy9KZTZy?=
 =?utf-8?B?WjJwZm1RYXl1UE42OVcxbFlGL3ZSYnEzaWhMc2dodHE0aE1wNlRpTHBNWVBn?=
 =?utf-8?B?MDV0Zko2QlgxS2h3bnQ5Q3VHZjFWL0FCalZ3VFJnbWVFZU43MjNVQ0JjOWdm?=
 =?utf-8?B?TUVwTjlpakR5bzUyWks5T2l2K3lnQUFHUHQ1QldabE1ESURLdHNPMUdZOVhz?=
 =?utf-8?B?M2hxRmtJem12TVFuOHFXS3Q1NTRJVS9Xd0pwemhTcjlFUytDSzhEZ1lmRmlQ?=
 =?utf-8?B?WUhpRG5PZFdkTmhlc2RNTmJxZlJKNU5XRWlzRVVBZDFUUFB5NmFINTAwbG5h?=
 =?utf-8?B?eTRFMUo3RmxLSHgvVnhhWmlyRGh0S0VUcUlBZEluYTlrby9pU25scTF5S0tx?=
 =?utf-8?B?dlY1TElnYTVQTHlMY3E2SnRqN1AwdUxkSW91RitCUTlUYkdoV2tNdlQxdFR4?=
 =?utf-8?B?U2JVeFgvU1B0NFoxUlZXYjIrMkdnNVRBc0dzTWpodllTWE1iMCtFSjN1ZVFY?=
 =?utf-8?B?ZDBRU3BVbXUwZHc1bCtTeDIvc3VUb0ozZGtqU1hLaXlZN1pSM1hUbDlNRUxq?=
 =?utf-8?B?eHIydCtmMTJyNzhTQmpHZzV2R1l2WGtNaVVpWjQ5aVFKVWprNHBpUWh6T3c5?=
 =?utf-8?B?MmxpckQ4cUwwNndLTUxIcFIxWk1CUzQxdnFoN29DTlh5cW42WElDQmdMS3dE?=
 =?utf-8?B?VDFhNkoxQUNiREg4MWtsNzQ1RVU4N2hpTWs4TmhvMjNHb3pRT2lYOXZNYlhL?=
 =?utf-8?B?VnZKL3IzNDBjODFYTjgwajlpTEtXVlVSRCtoeHpyMW1rTThDN2R2YWNEejNN?=
 =?utf-8?B?NmsydVBIZFU0T3R3aXNCS0dRVFVtWlE0NDA4S01wTlJrNXFRQnZvbFRpSTdz?=
 =?utf-8?B?SVI5Wk5uMjd6dXpzQ0t3cU1kNTZ2L3RCZXl2S2IzYmxXQjZCSStodzFVeWRa?=
 =?utf-8?B?bGlzeW5Bck1JYmtSVWdpZDlLaUU5b0hUcitTYy93c2dkQmJib1YvdnFsc2pF?=
 =?utf-8?B?NTBtcnA1T2JhUm1PWnR6VDZ4R0FLa0F2TXpIM3lhOUhnSWpDUU90OHlUaGZs?=
 =?utf-8?B?RGxBUVlIVHhjWGwxSWFDL1FkRFVRYzZ4Ums1R3dFc3NaR3BvamxRQ1BVZnlp?=
 =?utf-8?B?VXFvZ2IyaEpmZUYzVDlVN0YvSGY5eWtuaHg3QWErUnZ3TFRuZ1ZhRGx0MDNj?=
 =?utf-8?B?bGJKVkt4RVFGSmRENXI2TllRZHk5UTl4OWlrSm5OWnBpYVU1eEJzQTZWMEZ1?=
 =?utf-8?B?THdZcW9zNGxDZGpvLzFrRm5XUWZqTCtPYlY3cnRBVGRSa21XR3ByUnJFb2ZU?=
 =?utf-8?B?a1lKWVVlK2xNSnFYcFVyNjRhM0pZMDF2elYxYnR6SzN4NzFGRSthTWNvVHZM?=
 =?utf-8?B?T2lmejltb2UxeWFmWWtiZUdySGdiSDdBVWhpaEFrSnFidEVsSFQzOGhPU05s?=
 =?utf-8?B?NmhwbnJCMDc2MVhGQVp0SjJpUDB3N2h6bUY1alVrVUVaTHAzSWxTaktQK0Uz?=
 =?utf-8?B?azdEMWkvempkU0dHMWZXYnl5eWY0blJlM0Z6NmhNeXJJMk8wKzgzVHJyODlx?=
 =?utf-8?B?dzZkU2ZKNk80aWJNY1JWbWZtWEdwUjFmTk1WK2tJVVN4ZW5iUkhVU1krNnFM?=
 =?utf-8?B?VFR4Z2ZwdTdmU0lVaXlWUnNKYXB6NHhPY24xNVdYY2Ird2JWdzY3N2MvVk5N?=
 =?utf-8?B?T0Rzd2w5Q3QyNkZQazdzMHJTbXRCaUpteFpvdXYzdEhKRkhEUWd6MmNzd05F?=
 =?utf-8?B?UDRVcllUcHBaZWg5TGxaM2o5OTMwVzB2WWdSZUtCRWc4dFUxR2hnK21iaUpK?=
 =?utf-8?B?d2ZvWm5NN1NLeXdlRFdhMEZ3NlhEQUV0Q0s2SWt2WDRQdFpHRTg0U1ZMUlN4?=
 =?utf-8?B?MUpQTStYQmJyNTNGdWloRWFxL2dTeGdKaUVyb0VmVTU2OEpkNE5QK1hwaXlN?=
 =?utf-8?B?SUlMbHNpblhGL2VkbDR4ZG5pQ2lIQ1hYMXlSOTB1K3kzVmxLR1g0MkN6NGNC?=
 =?utf-8?B?QU42M0svQlNMNnZVWXQxT3hnbG9uMGJZNSszczJqdkhvQ2M1U0lOUVpod1I3?=
 =?utf-8?B?Ym82dFhlSnhrTXdpNGllMkY3ZUp0a0pQYVpkN2tjM2pya2hBUmpmcHVRczNK?=
 =?utf-8?Q?DMZ4s69i15rH2iK8x4JIdnZp5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d72ca1-9cb4-4b9a-78f9-08de1265fb06
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:57:15.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIZYnby3ufMsH4jO7qHRX64reCJIHUu6Bb0WRU4Tppd+WFQaFvls+GjhS6eDrz73VOBamHolJ65Ceh4H1mlr/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_190152_351468_6AD252F9 
X-CRM114-Status: GOOD (  12.31  )
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

Get and enable optional clks because fsl,imx8dxl-db-pmu have two clocks.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/perf/fsl_imx8_ddr_perf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index 5ba34c606213d255edf27081bb9f63763cca3066..2a8426a74af98cf46725c2c70534829e198746f3 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -732,10 +733,12 @@ static int ddr_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
 
 static int ddr_perf_probe(struct platform_device *pdev)
 {
+	struct clk_bulk_data *clks;
 	struct ddr_pmu *pmu;
 	struct device_node *np;
 	void __iomem *base;
 	char *name;
+	int nclks;
 	int num;
 	int ret;
 	int irq;
@@ -754,6 +757,10 @@ static int ddr_perf_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pmu);
 
+	nclks = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (nclks < 0)
+		return dev_err_probe(&pdev->dev, nclks, "Failure get clks\n");
+
 	num = ida_alloc(&ddr_ida, GFP_KERNEL);
 	if (num < 0)
 		return num;

-- 
2.34.1



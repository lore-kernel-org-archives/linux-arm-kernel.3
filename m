Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19493CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCrfoTqGyGLixFER8R9mKvArfn+B/j5ogteBj+HC6po=; b=E52RVS3JnHkmEx4e/R+ycVZske
	3X6sWcVxZ+2BndbH0GAL8suOPRdxmzGvKGjseMkPZvYIy8e472kp1GKc7p01qjFAk6O/8/JI0RLem
	DY4WKyXrTGTgJ++D8tmeBZ2h6pCkK7tkzatIa54yJ8Xg6xXMh82HLA24QNSgfM0iEr+X+lZxfuIDY
	HMqM3BQdayNDjsL0yiDmu4xPJCOkBC9U+vI2UIBzCd708C7WsS68AjJEPX4oXuyiG5ZC+zmyg+k7z
	KbPIDGqWxQ83jvNnC5IwfLvS11XWv+M1xVTiMV2FSNIcT4dgV3VvNDelf369jsUJ6gV9r+xfkx9bw
	FDO5gkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umt50-00000002OoZ-3KiD;
	Fri, 15 Aug 2025 11:58:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqN7-00000001z1d-10Xn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKu9rW7+3nRp8PDELMtL9MVZU69LYGEykCqiXuz6RZQsBN2A3mCZjOpD7hjKCYvha0ldyWPA6Chq7kJUQJueCnIM+fC/+T1aa6RsAaWClrIyumMYtQ1b1cGeAduMMW0J0xTWBkJ3kthbV8Jbx39p07IeBdDwlJg5sdPgR0DIW1dMrgss1+8oiIoy07zIKQGSLn4JbxENaGzeki70q1gIvyTnMefGjwDnHdhxmrX9Ks5rrMmy6Nn/z1i9C60VPlZbAa/Fqur9LMGVb6BUqQHpd+trv9Mtlu0ZjSRfyqo0oQ+ZjAA1njcq4+OPk7jvaKTLNMohjbxAnQR+Wn5FZexhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCrfoTqGyGLixFER8R9mKvArfn+B/j5ogteBj+HC6po=;
 b=fqxBq8xO38hT2gEHGiAi6bxZ+Cs4c9rl19enQSc7ItR1XxgiGrFUrgkocB8waI7fQkenDg3TMqOjVIYJT87KLlkTmhHhx0YWW7e6HYLc67sXfAKeCzyP+WqKPxo83nsboLA08pOH6CCpKj6Kr/4A+dWTKxpFZDFNFozD76kkUgnp9deCCBa391uz73qpb4EeGbU5yY969bhbq4ZWaAuHo2kuvyp/+T9fCOshPdGuEk/Z3cW88oNrxChxG93JGAMZr7dnm2UHyrHgNeOwbYt3HCVIr7Cny20H/vZW4nxJWOwaHnJXyv+09pJTOn7pjGUQcQQ4WZVg7AYVkDc3nfPOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCrfoTqGyGLixFER8R9mKvArfn+B/j5ogteBj+HC6po=;
 b=HoUZS5Lal5NUbcIXiZytBMvxIkT00LQ2tuPhomtQn5w97wZtrL/Yh6/PrAJ+tIketkdYr9nmJ0oPS1MdRCIaICrCUBpmbGQcR4msOhasK1YMVLfaj+150bA5EZ7DINZLJ+v+H4HVb1JBdy4W3HZhZmcvHipDQXkaC/iQOVb5bHFU99hB7reP7shJ+IVAAmxAkkY9GLRzxjB0CtUjYG25aQsbuvop7s+PdPLPvebwsjw/rKhfZSU+3hib65L8lICOJ3vh8QnzXbqmf4FCKrOErOQwDmc+4m7KnZ/ruOJpraDptRfacTTPzD8FX+9iHm3Yr2sdNQpP2KA/eh963spr5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8007.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:05:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:05:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 15 Aug 2025 17:03:57 +0800
Subject: [PATCH 11/13] arm64: dts: imx95-19x19-evk: Add pf09 and pf53
 thermal zones
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-imx9-dts-v1-11-e609eb4e3105@nxp.com>
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
In-Reply-To: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755248657; l=2339;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sk1L7Crm5gHOCPFl+KqUiffrN+KsKdROuysBVMgSVlw=;
 b=FfLXxZJqm1fWZhg7iVOuqOF/KwlqCaUoIhT4hC3a5bIYZpWIh/G79PzW0SAhP+8qTCwZMymUs
 uhYRx7hGn9MCBVd7q6xUDV5DKe+Re8qZjlhDWSakV7vJ0uj+PkoTsxu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c33510-82ae-4714-0860-08dddbdad4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS9tY0JVZDJ1M2tMRjdNN05ydzRyWncySXUxUzgrekJDazBCQ3lUdm5YRlZX?=
 =?utf-8?B?Skg1Q1piYzhpbENWK0dQQVpZSDFqTlhNbVhSVHFyVEZUamF2bW5WaFFhQ3ZZ?=
 =?utf-8?B?OVlUVmpaaTRmQ0N2S1Bzb0hOMHJUTnpmUEJKRVNCRlo0NVdzTDNjVVVjUjkv?=
 =?utf-8?B?Sllwem0zUWplVWcxUytBQjBzc2QxUGhRVjRpWHlDaDBSN0NGbzhSZTJQLzEz?=
 =?utf-8?B?cVVmRTJJR1c1RHFvVDVwdkZLOEI2dU0zKzI0UDc0a09rZ0Yvbm5LODVxTm56?=
 =?utf-8?B?c0tpWlNyaVB1bUFld29QT1F4NnBDb3llL1lwVVNjc3p5UDNCUjBFSTV3cWFo?=
 =?utf-8?B?czViZVlmRTNUNGY2N2QwZ1o0Ujk2UWEzbC85dUlNWXhsNjFNdGNiTXlpdkpx?=
 =?utf-8?B?Y3ZrNEpyKzg1VXoxTGxSS3pPTFVub1hxSGorSTFwYTVla01ldThSekV0VkMr?=
 =?utf-8?B?VEh5bnJvYTd2aFZHNFBSRUNsblE0a2RhNW1lNndkbDFyK0IrQXB5N1NqNWIv?=
 =?utf-8?B?cUtVRDYzM0NxOXdaY2tNU0NkQnNVTnV3MlhLM2Zjb25iMm9Pd2hhV2lTbUN5?=
 =?utf-8?B?ZVRiOXZzd1EwOGs1NnhMT2ZWb1IvZGdaSUJzcTU3ODQzSStSQStYendTWm1T?=
 =?utf-8?B?OTY4bVpnZjdoUXFSNGVnakljMXV4NFlRWjFFL2NMZ0k4anQwcGFTbnhNRk5F?=
 =?utf-8?B?NU9Gb0F1cmd4Z0duQTBEaThZQ1hoQnkrU3U4aDNFNTlBQW91bTZIZ2s0dEZZ?=
 =?utf-8?B?c2VWS0RMcmFPZjJTWWVSK2JvdWJKY2ZJb1JCZXF3di9YNjJnS1QvUC96WVNX?=
 =?utf-8?B?YTl1cGROQVhTOVFlazFzbDhYS0lIMk4rZC9lbnFtOW02TUgzeS9GcmlKWGxo?=
 =?utf-8?B?YVFpZzU5bklQeWRibHhaYUNTd01VVHlhVkpkc1dNVGM4d1NGRDhwV0ZTWExF?=
 =?utf-8?B?SFo2Si9Ua2dBdkUzTUFUM0J2RzBqNHpSajJ0a05FWmFsdFlrK3RITlJCcXht?=
 =?utf-8?B?YUVUcUZsN3Q1WHc3R1ZyejRwYlU0VXBJZzIzY2VtVVQranRhbVJYTlZrRkp0?=
 =?utf-8?B?S01yMC9Rb0JSQUt4V2xhUzJFeTBoZUpmeWJGUDlMMW9mOXEzbWxtaWY2Vld5?=
 =?utf-8?B?VnZLRENJOEYwbWpKcGcrc0NGL1RXUHJsU2FuOHJjbmdNZTBpeVVKTUhIOElm?=
 =?utf-8?B?YVlDV1dyMkRKNnlLOTg5NWNwTkJoVU5QU3FDV0creXlSMUFOVXpwVnVUM1pQ?=
 =?utf-8?B?cmZLY1YwYkgzK29PR0Z5Uk4xcEpsTVFIZHozZFU0cWwwY3d4TmJIQ01SMHFr?=
 =?utf-8?B?WTgxWERmeHhtQ21NRmNtMDB6M1NqQzlTVGIySHpPZlJEY1NBRlB3UHVWU0Fl?=
 =?utf-8?B?amNQL0VEbFBoQmp2VmtIL2g1dnV2RG1ERWFWYVErTnZyc1ppSE50M3hpUUJ1?=
 =?utf-8?B?bElQSjZJdjdhWGNRdnVBaThFTHNuYjFTbjlOVzZmSnNkSkFrbXdLaEJFWGxu?=
 =?utf-8?B?UklXSmswS2M0UkZUMGFSRlRHMlo0RzkxMGhrME1HaDVpNWU1UFllMHhiazg1?=
 =?utf-8?B?UUNpcVRaZ1BrSVpsMVV4OWVjeEtpR0RMdnFBN1BFekZvazg4RlhyUEZyMkpT?=
 =?utf-8?B?L0tvQkxXMjlGSGpjdWlRMDNRV3QyOWJIZ0pJMVUranBwUFA5TksxbUdyTnl1?=
 =?utf-8?B?UElVZDNCc2ZMTW12ejBhR3V0S3hQY0l3ZGpVVFRkL1VnY1ROR2ltMW1VL3Vo?=
 =?utf-8?B?eHlOOVFycFQydndVMzhQbUUxZXJrU3ZHZmlvZ0c1VnFRN0gwVHllc0VZT0FC?=
 =?utf-8?B?MXdOYWFYa0VLKzZKYnIzcDhrRFI3bVd6UDFrSy9LNnFnb0tTdVR4RnhQNTVr?=
 =?utf-8?B?TmtBR3JCakVrZlNFZy9BSzJtMDFyQWVhWEd0ZTR2RnBKMEREaFd2d3p2R2FK?=
 =?utf-8?B?OTcySjFXTjJBenhpQVJGWkpFNDkrdVZoL1Q5cUNlN1duRE9BdW16Z0poWjdw?=
 =?utf-8?B?MFU3N2lPd013PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFWbFREcjJpVFp6dUMvNks3aDJDSHE2V056YUpIbkhscW53d3pWY2N3OXNS?=
 =?utf-8?B?bEJsSjJmeHFLQUVOZ2NZa3JqRHhkRS9FanR0TFRtNFlRRzZDRWREVkRIWmZV?=
 =?utf-8?B?VnpmQ0tSc0xUTks1bDFWUXB1Z3JKTFEyQ2FiVmhVRFltSVFUenhaZWp2L2lr?=
 =?utf-8?B?N3NyeXpuY0RTcjltZDgyQ1Zad1k2ZlcwdnkwNEpmNDg3bTltUE9FV0ZBdjFZ?=
 =?utf-8?B?d0t3WVByT1l1dnhVdEVqL0M3UEJNSGZsamNPb0FWNmdGbjd3aDhtWmdTSjdD?=
 =?utf-8?B?cklmcERjMUpnTG81NzRpRUhKdXN6cGh2dmJEb3BNSEl4T0JaTlBzQ3ZLVFpx?=
 =?utf-8?B?Vk5BQTgzZlZJcHFmL0s2YitUMEl2MXNkY0pyTlF1aWpUMUJvb3o1c1BTVFhM?=
 =?utf-8?B?NjFCMktWZk9FcXZGV0NMVEJmc09lMjhLd1dLaGNhQzFNZ01nOHFzZ1FXMURx?=
 =?utf-8?B?cThxU3htSkV3dWQxUEQ5WDR1N2FVSHBFNEJEM2o4cjhsMGpHa1BmZmlxdFdJ?=
 =?utf-8?B?YWJ2TTU4SWIzOVkwUGJ5cHp6aG5tLzlDUk5pWHRQdXM0dyt3cldNR0VZVzJZ?=
 =?utf-8?B?cDNuUjdRNmxaTmtIc2ZEOUROai9XVDI4cVpTTmVtcm9zT0NuN3FNT28vMCs3?=
 =?utf-8?B?MFlyWWwycUkwRUY4VXRhdjV5VmFaRXBQejFnYm5DQmlNRWtEK2Fqd0JwVXVh?=
 =?utf-8?B?dWt3eEpucWtaNFo2K3VldVJTbS9qVitqM1F6M1lyNnhjZFdpWEhuTitmNzVN?=
 =?utf-8?B?M2Z2akRqUGJqRGJNYXZpSmxYV2FqcXhYUXRId1I0TVJNdHJ6VjhqeWdrMmk5?=
 =?utf-8?B?MWtteGw3OE1MTmh3b3VhZkozaVNTcVhjQ05Ibm00VW9ZcXU4Mm84U1ptUlJn?=
 =?utf-8?B?MkhwL3VMTTUrMncxdklYTS9tbzJzSE12NUQrT3dmQ043ajZGbDFpSHBRaFY5?=
 =?utf-8?B?YlBlQmZRR0VpQkE1U0ZvRnFQVXdPUUdQM0FDaFZWTy9namh4YU4xMFlvaS9D?=
 =?utf-8?B?ZTdWTjZNVG55YmliSVF1emozMGFBbkhXUkJJWFRYdms4S0ZLbXowMTRLbXR5?=
 =?utf-8?B?RUtjNmdZWWp2UXlSQWtHbDQ2Zm1UUVgvLzBNUE1Kc0JFTElKcVJvZmJUR3pD?=
 =?utf-8?B?RDNyclpRRFk3bVBnd3N3azZUYVNTSWs4dTBGbG5LZEYwamFtU3pIcEtxUFJp?=
 =?utf-8?B?MTEwT3VTZnk4WnFPSXNBcThRQ3ZTQ3J6anYvck5DTnFhcHh5Y3h0bHNXWlQ5?=
 =?utf-8?B?bWx3YWJYcWxaNmtDVUxnb0Fxd0VHSG5ydFNQQW1HOFVGcjE5Tm4xS3JLT3Ro?=
 =?utf-8?B?YkdIOCs0c3NDT2JhcmZTMkI2RGg4T1BhVUxNVTlaY3Z0L01Nc0xWVWlwd2p0?=
 =?utf-8?B?aXdWSUFLdjhaQzVIZVl4NmtFU2pMYnJFZS9kVmpHckorR1pmdEw2L1BEMWY1?=
 =?utf-8?B?cFNrYWRYNEJlbjhPd2lUbkRzUU0zSEI0d0V4MGZmR1NkQnNNek9McVN4elBl?=
 =?utf-8?B?cG1FZ2NUcFc5SHIwRStHOTlOSEMyTmdqeFc1a0M3M2doZlBDaEZmYlN1QmZa?=
 =?utf-8?B?TEFGUjMvbWRwaWt1RitpYUZ6UTBLdEsvbjBVeVZjc1JDMWlVM1B1VEtiYVFv?=
 =?utf-8?B?c3oyTHA5WEdHcndtb0pQN3R4RThuRHUwSHJhSUQxRGFPcTNxQWhzZDREU3NG?=
 =?utf-8?B?Uzhqbm5kUmU0dTRkMFV3d3h1cmNDTmd1M2p0elZldGVDczZQRFpJU1VDK0dD?=
 =?utf-8?B?NGVVWnVBeWJVRFN5dGVxTS8xZFgzb1Fnd1FnTU9IaGRMTGhVcWcyemhWeHA0?=
 =?utf-8?B?N3RNUm43V3F2SVZWZXBHUVFwNDlDS3ltbVMyc0thTW10cDZRZHFQVjFndlpI?=
 =?utf-8?B?bWJ3MGtTN1VoK1IzK0xMOW9FVCt4RXcvMWZhYkIzVUMrWjVIelVPdUwwU3Nk?=
 =?utf-8?B?OWdHKzVVV2h2YzJETi94TnpZR0RJSEtuNFZKOTV3RWZjMkVYektqc0VJZGg1?=
 =?utf-8?B?SWE4MzBlSXc2bVgzRE9NWFFQSnJGR2FrY244L0h5ZmxwME5BdkQ0UDk2a1Fp?=
 =?utf-8?B?QkVJNjUwZ1VDK1VySHgrOWJLZ0wrMjgxYklGSUQrRlRZS1kzNUViWHQ4RXpz?=
 =?utf-8?Q?FloyIg13GxMCSgykWmXAd26/J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c33510-82ae-4714-0860-08dddbdad4e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:05:07.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdM5NZXOxppTkhOid07/vlDeyj92p6ezOmGYpf1BjHhLO1DKfK/SKI5STID9e3tlfM4odc12aflh281hLcAyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020513_296164_52DD31E9 
X-CRM114-Status: GOOD (  10.74  )
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

System Manager supports reading out pf09 and pf53 temperature and
SCMI Agent could get the values through SCMI sensor protocol. So add
the nodes to allow Linux to get the temperature.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 73 +++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index c35a5083c837379804e07f98163c0a5d4301abd7..0ad5707314fb225b74d8940908b53dc2a444ed5d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -1078,6 +1078,79 @@ map3 {
 			};
 		};
 	};
+
+	pf09-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 2>;
+
+		trips {
+			pf09_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53arm-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 4>;
+
+		cooling-maps {
+			map0 {
+				trip = <&pf5301_alert>;
+				cooling-device =
+					<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+
+		trips {
+			pf5301_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5301_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay = <2000>;
+		polling-delay-passive = <250>;
+		thermal-sensors = <&scmi_sensor 3>;
+
+		trips {
+			pf5302_alert: trip0 {
+				hysteresis = <2000>;
+				temperature = <140000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				hysteresis = <2000>;
+				temperature = <155000>;
+				type = "critical";
+			};
+		};
+	};
 };
 
 &tpm6 {

-- 
2.37.1



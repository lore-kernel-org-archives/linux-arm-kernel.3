Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05109D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=; b=QP8/LMBZIJWGyA19y7ph8Hgn/G
	VLB6hMZhYCuD5etqKri1m+hitabfBmGAHi82C6CwSUy1zE+30CsmeMCoSR3Tf9u+EgW/weStMCD1K
	t6g8C4d0He38Kg9mUPx9dBoISpNKR4RS7HiQMtG8OkctdPqUcxWOBWvWeC3pSli7IVtMQxJmusGPh
	xw/NaQq1PxtynU3muDTnIdGwr1NQzdgPRBcpf4NZvZN4O+a1J+xhxN5mVLSDXpg+BuRwoCfQr6+aD
	K8AW5onF5ho9DYjDnSwJSWSNq3kYrrGgNXlUoKhbEvMo+1yVZZYbyOxEG7h6CyikCdl14apUqzh6g
	GR7wCVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQggO-00000006Cu8-0Y6n;
	Wed, 03 Dec 2025 06:49:48 +0000
Received: from mail-northeuropeazon11012064.outbound.protection.outlook.com ([52.101.66.64] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQggI-00000006Ch3-1VND
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 06:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahruP8Zo0a2c5T4rXyVPCVufRWF30Xm+yxbyak5jOjNEvUCpXJ+LAzDDbER/kYpPR6wTjMROEEMIIUFtGRPXLH05dQrQNa4v+aqDGVM7yyi4ocfNrmNlP3sG/NsTqnJ904+RobtCqi1R4vNgaReqFYDHVG/JTaxkv2AWGIoFUsE/rdHAXHULqyWYI+GowcJpQgDlRtgJqZbSmtjpTWlKb6wGbhkFHsmMSn2ER9n/skpbiCfM0/XAO1NzhhZmEWLBUQmhaa5dXQ2BqvFu6Y2Ez0K1ZYLNHam3hr5vJukhr19gKFlggTi+WWBFij21PwoXueSdjzb4HaCvA59fu5oTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=Hy3qzh2qFHe4dvFDjID/3cYu28lF+XOqvG3LAwSGF1wqdxsS1K9n/5+5hitl9uesu8m6CDnkdOczseODfrzdOJ5XTK6q+G+UIhDCmPOm0Y6qNtVYQDQsdFH1ViAeyowsMgqwv0PSVjU8wUUf1w/2hiec5J9fiKJ6dFC2BNF8Bd7mS6kpgH+fM6J9NGxoY7Fpje/1tf0oe7yuiZnn9mD4da/waZmtoydT8czA4rnKtXBjGIN7U1P0fj2pk+2w1QX2cUtf9f4izsMvs15xz0mDTb03GaTUhUPfhx81pFSdsljF1t9tE08zJwhXQVBhVHRzWnUZj9v/fsApKtd0XrWB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=LzQoi2ab/owJWWWwbYcXOJaGnIoXEC8PvOt9DJHG1sNrK7bGtstcISoTAvDbE6dWf3+byBV0DhNL4dd/na7Br8iaK7pXmKpkaqq0lgRKsbMWxTvaNK1crH/DuDtqRQIx0d26s1b3LcWIw00SVvmfbm25JgyYi67iSfVVaIow+mSI/GAXABAas7u4BeeA3KnA3GIAuZak3AIy8NjTfwQKSByExnvSzFtC/CWQXItCwbyT31mFEGvZ43UElKgGCOONejlM/faj9oX8EjpcNB+jH/uB+CW7AemmBqOylaXAkB9a4AHXpzkVZzBigVoAbTqzs5D3nZeczGAS3m8aMfwdYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:49:36 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:49:36 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 03 Dec 2025 12:18:12 +0530
Subject: [PATCH v20 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-imx-se-if-v20-7-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
In-Reply-To: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764744504; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=dePRSY6U2cAhR7P/Nlz6XVzCpYQE3Y5cUpd94c7xGrQxmyyvfzJm3Bdwr0CWVKMUNGLPsnXPM
 3iIZgvC9jwkCXEMHqY4GSjv0+7lSBQhAaT4Q+AYuZqEN3z/Fi6oFMPU
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: a8961fbd-d00b-467e-8792-08de32381fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU4vNGRmbkVFZTdNcnY4TGV6VFMrcTBuQ1hMRTZoVDhiQ09OQjRkMUhwbjB0?=
 =?utf-8?B?TlhMV2ZXMm02d2lLS0g2SWkxNEVndkR5ZTRaWTJsb2ovOFRyaGhWNVRaYmN0?=
 =?utf-8?B?czV2S2tacTMrV2lsNHlxY1c2Y29yZHpDdm9EdFdFYUxWRDFVOHFnRmh1Vi9C?=
 =?utf-8?B?VE1yV09JRk16enVTenEyenlNakRJdzJnVjI3aUZqVTdWa2ErYnJ1aUtRNnhN?=
 =?utf-8?B?Uy9Ra0lYYVpxUU5uTFlMM1ZCUXFMcWZrdGt0djEvYzBvclo3dDNVTVh2M0oz?=
 =?utf-8?B?dEh1K2c3RXRyMkVFNU9SRnB6ZDNzOVp4YldNakExdDdjZmV4dDVyR2wvT0Jr?=
 =?utf-8?B?ajFVd2pDeEVkeWhXSGlPTXZPdCs4dDMvWkZLcVJpL2pnaDhyMW5EQUZqMFh0?=
 =?utf-8?B?bFlkd25Sc21UOVR3VEVta0g5UFYxMy9tSk8wR2hnWFZkSEJ4by91ZlBVY0dM?=
 =?utf-8?B?bTBMTW5xOS9vSFlDeTFvWnZJRkYwblVVU0hkZi85RUUvY2l3blJnS2VqTlZ0?=
 =?utf-8?B?THljUXdKMUVEVzJIUk9LekwyWVdUSWVBSUJRZE8zT2M5OTJ6a1dWVGV5STlE?=
 =?utf-8?B?eWg4UlVuV0tZR1psNmpZaWs2dWU5bFpKZnBzZWdrWU1ISlVJZ3dGZUl2azdo?=
 =?utf-8?B?c0Z0YnAySzM4NWNYZEFETUdpenFpYVdmRzdJa2lJaVhMZjFDMG85cDB3QXBS?=
 =?utf-8?B?Tzk4TFB5VzFqaFBvMzJpM1crUnZkZVZJVjhFdDhUZStMTkpxWmU1Q21KV2RN?=
 =?utf-8?B?dEM5akczMWhpMGdIVmNOMXlSWnVSYXY4SWkwdW8xTVExVGpNZ1dQbUJQNzVE?=
 =?utf-8?B?WmQvZlp6di9FZXFmaDFoK25Qdng0MTR1Rmo1eENrQ2lRdG5hTGdVakJGYnRQ?=
 =?utf-8?B?ZmE1VWcrNjExaHJUejJiNFBkeG5oTmxIMnpsMnJ2ZWV1THlrRG1OcTYrb2pE?=
 =?utf-8?B?b0hCWkczSE5mblBBVitpTVBrTDBkNXluZGVWOEVhOXBYdzNSRWtZVkJYc1Uw?=
 =?utf-8?B?WUJKNHM0Wis4eVdvQVhtNTlnaGRoYUtDTHBtcmtSdytSTXlKdG5PMkxta2Rz?=
 =?utf-8?B?OEpsRVM1cE9kRVh6RE1iOWRtR1VLNFRpZTVUQTc2QTVzRFl5TXhuRXN2Qktj?=
 =?utf-8?B?TURJWEwxd0JybXEvNFZKUWtidmEvRHJwZlJMdDBwZ1N5a0dqRStLc2o0cEl5?=
 =?utf-8?B?WUdhWUkwS00yM2lOQ21xMjlaQVYyWjdSUWFUU3dkYlNydUJWclhtWHBRMXJm?=
 =?utf-8?B?MStpTS9XR1d6MFZSZzFzRUFSdmJwSjIrVFkvOHJrdjZnaXQxa0N2VXZ3Z2x5?=
 =?utf-8?B?cWk0bVVMV3R3OHFWUXdsVnVlNDA3akpBcUNpNWJnMmh4dk1oUmdVQXcvKzZK?=
 =?utf-8?B?bnFhTFRwN2lxeklBVGZTL1B1cTk0T3Voa1UraVFWditidHJhQXhxa0MvZy9o?=
 =?utf-8?B?Zk9JdVczTnF1VXkwb2RNL2tuanQ0c00yTUl1ejFkQlNBbElaK2FlaWFnNkIw?=
 =?utf-8?B?YUdKSE50NS8vdzRuVkJ4VHFDaFo2ODh3OUh4TkZiY1g3REFzUmduYWdIUWM0?=
 =?utf-8?B?N0Y0SmY0YjhsRFBxRklzb2szZDhzWTJBV1drT2JLMUNDOWpPQjVaazk5K0tH?=
 =?utf-8?B?bFFQUHFhZjdrelQ4Y0VBTGkxbUxTNTN3blh0bHBBSHJhWWFOT3Y1TERKb1Jv?=
 =?utf-8?B?cmdnVCt0ZU9YaExKZFNWZ1c1cjJGTm80YitHNHdGKzNCWS9LQk5BWkhVdmxz?=
 =?utf-8?B?SnlWNWR6QU1INWEreFVIL0ZmSHNLTllCNTM4S29Na2toWmk3ZmpyQ203YTRj?=
 =?utf-8?B?cTZFZS80SjcwNjgwUUZpWWhob09paEZCOWMvWnl3ci85MWo4Yjc1S1B3dnFQ?=
 =?utf-8?B?ZC9nbWMvakRKL1lzUmZxZnVJUi9aVXhSclA1VXN1bDR6Y21uWUtBK1dsMjlx?=
 =?utf-8?B?emxoZDZvaWU2TmUrWWQ0Rlg0WDhXSVh2WjhTTGw2L3FpV0JhbXBUOGl4eS9u?=
 =?utf-8?B?cnhzK0dma29yTlNSZGN6RkcyaHY0M2pya1FWUmVIL2k3OEkvNW9LZnhUbFpK?=
 =?utf-8?Q?iIWUs8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhmSTVoUG5wTUw2OXBUVStwelU4UHA5dkJiYnZ0WTBEbVZybWF4ekpMWGJZ?=
 =?utf-8?B?REo3eFNKT2Iwc0xhTUw0ZDNNZGxBMEQyOHQxL3kwZXRiOEdrMjRDbDA2NG5L?=
 =?utf-8?B?aGxMbm84QndtQjhaTWpxU3ovbXVpWU14OEZoR2xBa0VkL1VxK2R1V3pjRnRG?=
 =?utf-8?B?MWprOFFESHRWdHZQYVBBZWpKMmlZTGkvd09aYUM1dy9JbG01eDdmYk1zWUhD?=
 =?utf-8?B?OFU4dHppUlAwcGw5OG95WVVUNyt2UllhVFRPV0pGNjdLUHFwTVJlbGo1b1RO?=
 =?utf-8?B?REZhTlh1UHBwMnRZL2tYQ00vRXBONnQ4NjFxZGc4bmk0TlhlaVFSWjY2Wm03?=
 =?utf-8?B?ZlVCMGxOd0Q3dmRzc1JDZzZsTmZjUFg1SGc5T2FOQ0NyaTYwNjZ4UGpjanFW?=
 =?utf-8?B?ZUFVL0pjdElWSkZETW5UUzk2YU9GNVJEOHpMZmJpM3BFSEc5NjFFQlpjL05N?=
 =?utf-8?B?QlJCczV6bTZJUjdTTDRVeTl1QjVJandsSG82V0FZeElkMHUxbDVaSE5GZjBB?=
 =?utf-8?B?TlhpODUxLzlqdTU4WXhualpTaFBac1pzeUxoV1M4WndNR0x0RVhhc1ViZm5Q?=
 =?utf-8?B?dkF1elJpQUNEc3BZR3NwK05OOTBlSGRpUU56dTZIV0orTWRzL1B5alhXQWsv?=
 =?utf-8?B?c2ZDSkZEVnNmRUllQ05DdXIxanBHSEI4WWRnV0gwUnQ1WWNDVnhadFhTME5a?=
 =?utf-8?B?L0hrS3UvSUpYR2djSk9MUnQvZHYxWWtVR09qTXZ1b2syTm9LeWc3cjNCQlFQ?=
 =?utf-8?B?Mm1uZHczcUMxNFFvN3hxcjB6bWlSTzFZZUl6enpoM2JwTU5zRThrNS9ma0N0?=
 =?utf-8?B?dHlPdXA0djdZdjdZZlRkQS9wRHNmUVVVa0xpVFJ4WWk3L25yZlNzUjE4c2Rn?=
 =?utf-8?B?bFBjalpqUEhnV3BQZnZjelJra05vYVk4MWFMdk0wNFN1akRGN2hZZG5NVzUx?=
 =?utf-8?B?ZDNDR2g2SzA2YWxBS3ZlQVdIREtGaU85Tysybkh4bUhtOUlMSHZNQkQrZG04?=
 =?utf-8?B?OVViNkRpT0NEaGNYZ1BmSW1iK3VLSksvUjhFQW9HYk5OMHcvUnNRZDZUKzE3?=
 =?utf-8?B?QTlQVHNMbklxOFMxZXkzQnZsNUZkYUxqYXZvOFRPNDdyeUxWWjNuaEhIVzda?=
 =?utf-8?B?LzhudUtTZmgrWTk1YXRGbjVSaUl1M3cyU1JiSHJCWWZtUTllTnJoVW9zWVFn?=
 =?utf-8?B?c0FnNzZNc3VKTFl5RDhSL0poRWpIWGc5Wkx1SHNwQzB3NkovTVNCaWE0Q0ZJ?=
 =?utf-8?B?NVVOZlFROVQzZFV6UXZiR201cjZSc0J4akZzUHU4cTlPSWVqOGtFVmFUeHIz?=
 =?utf-8?B?K08xaXU2TWpNR24vNE9icDhFWC9vc0V3VmlueWhEYW16dlZIWE1zSmlPRFZE?=
 =?utf-8?B?aGRxaUZjT0VoSG1JbE1NcHUvekxXNVZjcnEvRzMvRDZhT3lLTVQ0QnJLL2Mv?=
 =?utf-8?B?OXpqOTBwcTM1N01SdWh1cDNETGdDQTNOTnZCZHNqK3Z6UzhVN0tBNnBINTBn?=
 =?utf-8?B?SUtUTFFlYnIvL0NSNlN6Q1UzUGRld1hwOTFrMjJzN0Era0EwNlptdUovRXpi?=
 =?utf-8?B?U2RHeElWcDlGcHU5RHZiZkJSNDRybVhUaE1DTzRKaEQyZGlPVStSNnErQm1Z?=
 =?utf-8?B?Uy9TM3ZPZGlpUUMwVWl3S2ZTRFh3RXNKUTVFS0xLazJDT1U2QTJWUUo1cFo2?=
 =?utf-8?B?K21ObHkwL3hmR1d2S0o2SXBiTXlBSHlKR3dFeFBGWGlmNEVVV2doMm5MTGNo?=
 =?utf-8?B?Qm03Zm0xS2xDd2ZLL3RlMDZwVzJXcEc5a3NucW9MUDFFR2VDV21pWTZDZ0Ur?=
 =?utf-8?B?WGs0eWZ4cklkYWFEc2xkQzcxclFla25PNWplUW03dmxYWHFDdVVQWHVBbTI5?=
 =?utf-8?B?WVJUR1gzcGdpMXdjdVJTZ2JoL2xsaEUwOTZ0YkQrSWF6OWtVNWsvZ0VNYVky?=
 =?utf-8?B?UnNMTjVzU2VjaFhta3ZzNUYrNWNoRGtOKzZMNndYRzZmdENEd0FCZlhtTStD?=
 =?utf-8?B?QS9ZdUVQZWJjcGdRRnFHZUF4aENSRWc2STNRNUlSWU1NVDNXOVB4eXZGc0NP?=
 =?utf-8?B?WHhhYzU2QU5XQ3l4UHhHL1E0SnlHejVtVmI2OVptUk1Ubms1MENRUlpKb0l2?=
 =?utf-8?Q?9BlGsNsbgfXkYuzXAraHVF00d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8961fbd-d00b-467e-8792-08de32381fc9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:49:36.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPMnPLpYKEops+k6Vs0Df+koJSej0dZaDUO5KH5AR1AivQGwsfai0S9L6k9L5BJo1Tq204V/HOHqoOxheysf5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_224942_420085_C68041AF 
X-CRM114-Status: GOOD (  11.47  )
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

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0



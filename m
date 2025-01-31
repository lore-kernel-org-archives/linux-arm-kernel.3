Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A67C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Af2wgKE5GzwhoX2W2BCY5ASceMOOOhZXQpVpW0asK/w=; b=Nd+WVEC6DHghOoSmFqSqAXaOvn
	hfx81n1g9uDTikvfGe8NlKmfX6LrfrvBl2LCkESyd27wWBwBK1vnDLWQSUlFHo1I/7/bfWpfBBirq
	1O4HRSdxM7sEFTB7tvAkTVSsHZAEhUxGoxdHrwJyuFpu+nCijGjafXhDhAQcUMSL7dHez0R1PhcZH
	hbRPirbRl/wYoihYJUntMGTOKBznq2Df5QKx5zUZynHjziw/Eu6fe/F692QRqwcCR12kd/7WRaLdl
	htOoY6B7XRCBkBbpfaMQhfUBlRiPkZbXWp1Oh/zU1UGolWaUkQLD9VUmp/60Z5y8hJYspBBAhn4No
	J6DffcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyh0-0000000BTUl-1JPJ;
	Fri, 31 Jan 2025 21:36:50 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyeP-0000000BSmQ-1fXB;
	Fri, 31 Jan 2025 21:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiYm68sHIIb6Ntk1DmdhxobKbAwS5phS0IsTXXYfLFyHiSkSLOxotlYekn3xfr9/EVl0wX73cNA6cKncuSLBz5A8muYOxRWUHDeAxBkhuJS32Pv+hLsV6zZn9Y+ZQ2AN62F3tHEICXHwVwW+VTznBIuVt5NoIxViRvw6+IV9NOx6VbEBPPGK8ur1hm8LmlsfpLrjO4QhNXPZGY8cK77NKqNORSyk3Fc+87rMJTZMFQvHQ6Z8EjMXCIkx00CRBebNN1sLCrjLqcMrlUecKW+fgsEDlIndE5X618sO84/3QUQYFXRx9Kn33PZSILdwuoad9S/JrD+ACxGTxw9jxpynwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af2wgKE5GzwhoX2W2BCY5ASceMOOOhZXQpVpW0asK/w=;
 b=FnuDOU0a8XGsuhSuX+uppCDw2XEvtcPbaCENAH8h6/9OhO1Cp7zIe0IJgQV0OK9pBdCFml1ljWq1/ggIerhpWxN/D10+hovLrmnc+vU34Au3WwYL18RUe872t1the6awdIWZI73dS7U4Wc4iSCWJUm5pkru/p0swdw4c2O+vjbPo97yMsY9fKS4SW+u1iE5Fu9/I1O61Kj2oC1nKPnCk+d1pQJtZvgKeGa6i3mppkvDvdxzc5mSAfDk992CdPPLbUOx+TtOD3k1tzupGDcf1926ifL7ARwyUH9JAAu9YCY7SGgTR93EC6ENn1P5BgamDFUzaCo/g7rplmcp0lUII5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af2wgKE5GzwhoX2W2BCY5ASceMOOOhZXQpVpW0asK/w=;
 b=TmtUR1b0eMb+DxDwUfEUNN0pFMEuce75IRET6myt7gU7rN+E5alzNR/Fr7FCHfWO46RYEYChTcALNalXMQdea2lbvgovPt9Y07O9LxjVwq+E/inj8Fzbq8naOMZpFAL18uTvFJB9k2euW1KiaHaTkgA1dvKvs9uyeDbpYCHMAvrsgjfXkL9ejogkWxONq7uE0ZMHW7gYXXbarBn2na1olqMlp8+hzHmbZ5G6MovNL/YdiMOsZjsWgglMfRX/iAIx5AwdcIdyYRGftvC4Rx2Xcjnk00YeT6RmzDuSdX92PCy1PUEISo2GL6ZUlW/KCetimIEkGv98JojNY8dVi10fmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:46 -0500
Subject: [PATCH 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=1598;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=O/DfegO3FnDVkNBleOb11TI7X1PFuSWNAoj8ZBVwC9I=;
 b=QJa++5IuxVbhDvFng7GlhNjhle96UIRj2ilSE7Q5uo7yMMwbUjjHhw+x//Y8iVt/PSYdd4UwR
 K7mC41xB5b+Bzk9vzsAEZZkZfLBSYNl/67e321rOM0lFu6ryJCBtrpF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b64777d-9783-4771-e136-08dd423efd64
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzY2SjJUUXZNZjNzSHpCR1ZDSXJjMVAyZTV4dmczMHJ5b0J1dnVWNFFJMkxJ?=
 =?utf-8?B?UnpBL3FFRHowdzdja01ncTM0YjNZdng1b0FiQ3Z5ekRVRFUvbmljOE5IMHky?=
 =?utf-8?B?ZEFhWjdkdnZOSzRWbXcreThTYWRZQVpabGVZSmZIR0tWVUdaVGVWbmwyQnFH?=
 =?utf-8?B?SzEzd1NUL0E3UUszQVpXNXFqY3h6d1ZUK3ZVRzlGTkRWdlptSFB6Um9VemVD?=
 =?utf-8?B?ZVJLa0FuR2syVFhNMyt4OVJmQ1FDcGNkdzNBRVlDOURieGNQMGRJM1pGQzRQ?=
 =?utf-8?B?aS90MUpjSjFXQ01ldHNkeGZWNVdpVFV5S3VuU1p6cWlQTUFadjJCS0thVFJq?=
 =?utf-8?B?WFY4QVJDVmdxYlk4SFdZMmFLOVRFUXQ5RmRpN1N4aTZQelg0VkNpbmRZc09J?=
 =?utf-8?B?WlF5QmQ4dGpyRVdvK3F5R3VZdms1Znpobmo0TUpLNjl2Ujc0OTRCOTlNeVRO?=
 =?utf-8?B?L0J6Y1JBdnFBeUVDRTJod2lHeTJySTVsMnNJZXZhVkUzbEsveFRTNXlDSnU2?=
 =?utf-8?B?MW0vVG8zVHJGL2pRRGI5dUFFbVl3R2YwVjZnM0FaQnRkQ245ejV2RHE2SUtn?=
 =?utf-8?B?Uk0wWUpiUllvTzV3Q2pxSW1oYUoxaWtLaU1mc0Z6bG5QaXhaWjJPdnFoUXo4?=
 =?utf-8?B?a1FtdStLcGhqR1RwT01yRlg0YUczMGRLU3lISXd4YUlqT2t6S1lGQ29mV3RP?=
 =?utf-8?B?NW1TdklYcHdxT2REMG1WQ3VjRWYrTC9VUzlSdFJ6RWtCOW9UbUVnZDA3dzIv?=
 =?utf-8?B?anBWOUlyVWlIRVNWT0IrWGs5elpNTjZWZFZCMVczSldnN2hSbEUxTFpSb2NJ?=
 =?utf-8?B?NnlvQ3RhYi8xeGFzUVpGakNUL0xkMnJra3NTeExkNXFiZzVublNiOTJDV2NW?=
 =?utf-8?B?TUJpOW9VeGYwT1gvckJJczNBY055Qk5wK3doNFRMUWUwcDdqN2ljb29LUldD?=
 =?utf-8?B?RWttbVNZUFlyQlNEZ2pkdUU2NEIwSCtrbkQ0bjBxeHVqa0lGNWtVcnZqejRx?=
 =?utf-8?B?cjN0cnlzd3NudkN0K0RDOFNMZWJZVmxHS2I4eXNMaDJZVHRwT0xOekhhRGhn?=
 =?utf-8?B?OTlNR21qbjlFbkIvdVIxMDF3SDdqMEtPTjFoZG9jaEhRbFhockFlQVdOck5v?=
 =?utf-8?B?dWFTUDFhYW1YemdsSFNjSFYyYUd3SVlXNGJkdXJHSmlSQzlTVndQWWhtRHhl?=
 =?utf-8?B?VlBQSUtDQTdwRmtUYXIvOTlPOU1mT3BuNFlyOTMyNTV3aUVzMjVucTNJL2R1?=
 =?utf-8?B?V1RpNFNUU3F3L3FwVXpWMEpST09NTk9ZWWpWL0p2QkRZempsWHR1QmhSakJL?=
 =?utf-8?B?bENFV1JEVHVMVmt5Q21wYVpUQlY3WXlsbmdKUUNPSmplQy9YNlUrQ0NYdjVU?=
 =?utf-8?B?MHFSYUcrVDNBbTk4dEZHTEY3WXJWUS9raVdYTmpLTEVuZlI2aGJSNEsyQ2pV?=
 =?utf-8?B?M09xcUNiY0o0azA0RDdLbll0K3o5cEZWQkU0NEVDN0hUZW9rQ0dEVkNFUUdy?=
 =?utf-8?B?STFEZlNWUlNoOUxVbzgwREFZb1hLWlNXbVBXMDR6WFVtUDRKbWoybzN3QURJ?=
 =?utf-8?B?TmN0VnNFS3FQOTg5SXNSUkZHdTYwcWVrWitOaEtxSUlidmhncE9YR2RLSUVK?=
 =?utf-8?B?QVRwK083TmpMSGgyYkdTdXgvTGhOZDdiV1FxL1dLZ1pjWDFKcUtwbC9oQlBj?=
 =?utf-8?B?RExGNWpiZUVyUnlVQ0FxTDJWREJiQTNHTkNXRTZBYmdIOWsrc3AxTDVMb3hN?=
 =?utf-8?B?N1lCSlB5ckpHNGFxeW93Wkp3WmRYMm1CSFNzTksxWE9ncmJBYXJSMTE5aGh2?=
 =?utf-8?B?a0diMGpTQTgxMktEbm5vb3ZRKy95bTdZV0FvcmZBMGZMdjdsaS9XMEJJV2Vw?=
 =?utf-8?B?N0hlZHZnUWRXQ1dJN0t6QWh2dWRwNkdwc0xka2Jtc200cHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkdqa1NNVTRkcXpaenR6VEVBb2J5Y0ZpbUlwbVY3MGNCb3grUkZEU2ViT0VO?=
 =?utf-8?B?dWJXTzdvUUFxMWkvYklIcmxSM3IrQ1F3aWsxN3VVNE5mckxjaGx1cXhyMHI2?=
 =?utf-8?B?YXlweUJ0cnRWaDZhdjNIUjhuZE5XWHZoTTMzMzU4dG1WRndPdmNhb3ZZM0Js?=
 =?utf-8?B?ellEbExDYitGRnp1bTZxK0xuS21CUm1hbU5mWnlSeWxvUmgwQU53azhySVBo?=
 =?utf-8?B?L0VyOWRKT2pMR2FHL1FkaWFNZVF6d2xrWHNjeDFja05xRFlvclVHalMwZmxQ?=
 =?utf-8?B?aU00MUpqTFpjS1FIejE2M3MxakFWbDZhemNrbndZQS9JWTZINEw4Mzd5bi8x?=
 =?utf-8?B?dU9samRKNkZiMWVROWJnSDBibmtadlBkdndSMy9KQUxHWGRaMjc3Z1V6czFw?=
 =?utf-8?B?cjhaS09qSnlrTXNFSkY2eUE5cTA2L1hrVWFoSkIyQkJLL0NLVnI1MHBYM2VY?=
 =?utf-8?B?c1RxejJ5Snl6QVlPUE9Xc2xZcHRSUUF2azZudzlQYkN6ZEdGQ0I0bWd4YVhw?=
 =?utf-8?B?a1RKamlJZitZU0JGMnFabEpiYmY5UUYwNEd0SmtESVhkMkk1aTJYQ3VEeDZR?=
 =?utf-8?B?Zk53a1RPVWdaM1Roa3BlcGRJS2J1VmFUQjdnVXllRUQ0dndERkNSZzdlN2xa?=
 =?utf-8?B?U0JYN0VtWGpTVE1OaGR6QXc3YmY0YkZISU0ybXE0ZGVSeUFMUGx6dThsUEdk?=
 =?utf-8?B?cmI3blB0NnpvanRNMDN0ODZrV3pQTkU5MytZL0NiUk5yblQ4UmJaTC9YZFpM?=
 =?utf-8?B?MCtCR2NkMFFJNHEwN3JraE5RMk81Tks3MEx3ZWpoTUR5M1FtcUNoMFozbnRY?=
 =?utf-8?B?ajY1SHFURkdsdGo4cXNzQ21sK2VJMjdXZmppLzN2ZSs2d3FIeDZ3WHJFN1pC?=
 =?utf-8?B?NmJsR1ZxTjRZTTJVZjVQNkwyVVU0bXFLQ3h6Z2tsYWw2Z3oxeU1yUGhBcGhX?=
 =?utf-8?B?VllwNEo4Zk9BSGh3U2Y0Wkx4TEdtaHpyYW9vNnRzWUlPZExacC9zUFByTDlY?=
 =?utf-8?B?NDlxc216ZzdsZ2ZKN2lXdG1abjJkdmNnaWVjaG4zWmhEdTdvVmszbHJxSHU4?=
 =?utf-8?B?QzVTTHE4aHZ5d1FtYXg0K0ltR0doZksxUGh4RVpLWlFWYnJxOEc0NVZjY0Js?=
 =?utf-8?B?TzhXRXFYelppRDJpVCtCV29YWjlCMnlDQllEYkRMUmYwWTNlRjczS0Z6NStX?=
 =?utf-8?B?L0lYaGdUcExzbmF6VzVkWFhYSHdHVDVwRlRHSzlyZWdGTUFsSldTZ2xWd3Mr?=
 =?utf-8?B?ZTg0OVdaNzg1SEdEYmxnYTJkNmt4UzlVT1pubWtFTGQ5bUJpaDVnMjljOEM4?=
 =?utf-8?B?ZUR2T1k5OU9BOHluRE0xMHRVbU1SOHBRYTFuWkxRYy9ZVzM4T3RJYXpZVDJp?=
 =?utf-8?B?NFI0cHlwYmdNOHpXT2N4Z0pLd21GRG8zVks3Q3hIUFl2bTlwRTB5c1VxSWVP?=
 =?utf-8?B?L3YwTGFiZjJmS2o5b2V0SGx5cmlncEFlem8vVFhVOE1WNUhnMVFtS2Q0T0Uv?=
 =?utf-8?B?cFAyZmRlM21pM216eTJHOWJoUWEvVnJIOUNKam1qYVZqUXhOTkpLbHRtdzc3?=
 =?utf-8?B?djdNRkZDNG4xbWtxZ2xacFNvYjZTR2djbll4WFBIVkVmNUl3alNBVG1GZXVU?=
 =?utf-8?B?NzBQbjVOd21sNDNWZmJONlZKRVNJVjVUeHg3MVpaTmgwQTQxVnZja25XY1Vn?=
 =?utf-8?B?aExZNi9reVRuRlM1M2x1MXFNbnA2U1RnSU9kN3FNWE00WW9CQWZQMzZ4N2Vv?=
 =?utf-8?B?S3JhV0VqZXhRMDM0aUU0NzdmTXEzNUpITjVpcWdFYjRnYVRJVWp0RWtzL2c1?=
 =?utf-8?B?VlE3a3hnRXdvV1pYY2EvSEJkd3dVaWY3dkI1cFNKc3FtZzJVSDRac2hFSHhE?=
 =?utf-8?B?WVJwR2ZpMVJKNDV2b2loSGxsQkYybC9rZVliTVZLakZtNkRtQ2VESkEwQitu?=
 =?utf-8?B?Y2Q1Ri8xRVFRNGVEQU5UQ0lmdTVFT2pWTHhQaHRiYlBTYmFoNVhVMWcvcTgw?=
 =?utf-8?B?cU1vMjhJWmN6cFRkYy9GZm5ya2twREtYdVBFR1l5Z1hqaFo5VEwwU1JBU01z?=
 =?utf-8?B?U3dhU1dhcVFVZVFuY3JyTTRtZ2hZNmNwUnV3VnhRUFUrV2RSQnBSMDhiMXR2?=
 =?utf-8?Q?yYjM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b64777d-9783-4771-e136-08dd423efd64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:06.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0JVYJhJL7eTlxwHZum9tqxOAAUQfNBhy7viDivfj+NmY49GSl5bSl4jJld9cVPu3DBQmX2DBvEVag8vYyUhhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_133409_450761_B064C662 
X-CRM114-Status: GOOD (  11.57  )
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

Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
new file mode 100644
index 0000000000000..c6cbedd9ed114
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8 SoC MIPI CSI PHY
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - fsl,imx8qxp-mipi-cphy
+      - fsl,imx8ulp-mipi-cphy
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - "#phy-cells"
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-cphy
+    then:
+      required:
+        - reg
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@58221000 {
+            compatible = "fsl,imx8qxp-mipi-cphy";
+            reg = <0x58221000 0x10000>;
+            #phy-cells = <0>;
+            power-domains = <&pd 0>;
+    };
+

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04504C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVn/3bOB40GUMzOnnlNWzrDdN4eXA2N+0zK22Y5JBh4=; b=wE54oWUnu95vjqIkASdFdCXHZN
	jMO5S4licK4cG2RraFW43cC14EkvXoS43HuW+pjWtcFul6KE8Ogy7EdDilsbw81LRs8J7RtHgwtmK
	aCeThFmHxnigsnJLFF4z0gtmbNH5AVGnbo7D9NRvuWicrNpnc3VfabTrPHzGhzu4v9i1k/IhgyeYU
	YL23Jm71IjrjjOfpBvMHwJ8dAbBrUFDKfmKbLgFgf4cKXMBBZlnumKNiUuqJccCpaeMq2FpiY38VB
	5JRZb6ni3DciSCvnxtJXulMv5eMRG1sLzZqj3nS5g0LZZbWp9vR7QElUsp7DTj//nsgaLvZjoOK/H
	CCcLoVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4PG-0000000C0B5-1M0w;
	Fri, 28 Feb 2025 17:44:14 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4Ng-0000000Bzoi-2xtK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYfZmYnOeGJ+XQ5Yzu6A8v05Xg3M+0E2Q7Bzv8+c4HAvdUzLotU+TvQUQfC7noUn5bPmRR5yvM4LpaTSL6Va8Xr955E3rBxokpeWkRRkiqgX5zJsMn/TPG0wkZQjUq9gfB6jGsZJnS4pgu8d5y4Bm+9J6mSwrt83c+W9vAOHelzjSLgrMGahjgoNJJZBYSEjhQURtRMjiMb2Gb3ETdKb+jycnMsqoU45AV1ikgrgk+yJ8KW6rVLPVYgLAqNfXuGwGOa+AqDKyX3H+dbOcbhqRPxPW/zKsFU/6H1xpLGBAV6h5B1inkucFH3+wzH4wVA2pMkch3RJBmw2Yzxr66V00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVn/3bOB40GUMzOnnlNWzrDdN4eXA2N+0zK22Y5JBh4=;
 b=qqI8qQFcnr6m8jiR5eaOp4wjgA/3RUNVID1geJUS7icibl+Cyyr4/TWivVVNPkWew3XDrAKnYnqv95EgY4OAwNHa9xldr9XOV5TKolDX4f8U4UG3wxIrfTCMl3Lz3BOhs8Vks87Ft0Zc8JZiPQWV10/k5Q261TBO2qUlVGR5XZ0O76+1T+WJ5zfFUeySBhpxZO78g+tRNGvMeSblYpyTV7HqJMSmo5kCpy9ihP2PDNR/pvdiNsA6cKksVDXZIM06tqeRN/rx1ljj8aLl6AhR+4JRK8x8tgSRXG6t0Q0wWH3vP+K79EPE2IRkV1S+FTL1eXFWnFQdwgxstnBh3ijovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVn/3bOB40GUMzOnnlNWzrDdN4eXA2N+0zK22Y5JBh4=;
 b=iP+hXKnhZMHoVsx9SXdix4Q0or0uapKvwD/s5h25MBWx2JhMXYE+MVzaRT6FN0lI8SoLD7JpmmUpyPsu2stmMSJMK5PptA1fTigK7jnskyc0aOg65uAv/F44cstrq8KxZS2dEjrDUbgPXBdSJ+LPuojEkA+QdN+0XKHdFjGORrqCblKJZuzBiz8cTVMmnJgKi3TXVkLsxf0gyfp/WgBcAoDFCSoiYl0C1rk6LiZYjcgWbzkZ+O6hJIObygmRNSDN8fHnzEpbrxWNRCsKcyuN7+XPQ7vw4dTwSvxVh7pmuH1dFdpdxUmbTRFl/tVOoVqTBnypcfy7cMXJQr9k6JKT+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10498.eurprd04.prod.outlook.com (2603:10a6:10:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Fri, 28 Feb
 2025 17:42:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 17:42:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] dmaengine: fsl-edma: add error irq to help debug
 problem
Date: Fri, 28 Feb 2025 12:42:02 -0500
Message-Id: <20250228-edma_err-v1-0-d1869fe4163e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGr1wWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3dSU3MT41KIiXdNEc2ML01QTUwsDAyWg8oKi1LTMCrBR0bG1tQA
 4vpyFWgAAAA==
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740764548; l=946;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oTjSEYnhDo9nAYFIC/QeOoe7IM9FvKQThAp+PYmyQEo=;
 b=fR7BbgEcmvHF2qsZeKpt+owiXtoP48K9JQdipeHm7L66lwTdI5lzSG7cqaJc0VqTSIAoYdpNf
 8Hmi4QpnEucCNvj1XAbLqAOI/9tNQYrExfYDIJnp2jpxdnWAcx9/KvR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10498:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f42d537-1499-4aba-179d-08dd581f472f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEdRby9Ick83c3JRaVhseWRaeFd0L203ODlzU3JIVG5ieDBKM0xXOWU0enpt?=
 =?utf-8?B?aldVbXEzWGRzbUNzRDJNaTBncXZIL01RVklXbVMzY01IVW1hVUdtb1RtOXdL?=
 =?utf-8?B?RTFPeHpraXRteDVSWGJMRVRFTTdMN2dnQ0ppaWNwaVBUK28xSjd1N1M5Qksv?=
 =?utf-8?B?TUdlUnZzSEd3VlNpTkwxZEpoNGpnTHREbTFRV0tSVlFObTlob1BPcVJyakFw?=
 =?utf-8?B?K3FwbjBKM05EeHJDSTJtQ1pOSHV4SkExS0FjVU9IempRSjBGakdxUjBKM3VR?=
 =?utf-8?B?WTc5VVhhQVlWSkJNTjVPVWs3YkU0SEYvL0ZrS2F4NWlsK2J3N2I4M3RXWGNL?=
 =?utf-8?B?ZXZtVXRDNWNFd0lTTXpQajBkSDlrVGxFRlc3YWR4ZDVyaThNOURJTS9pWU1Y?=
 =?utf-8?B?enR1czJCWXRram5uR0tWak1oK0Yyb3BFU21aUEZJMVozZUp6K2VHd0hqdm1v?=
 =?utf-8?B?V0dUMHluMlhkc1NOK1h6eGgwTjJ6MjVrd3lzVWhmUUVRUWtwejQzb1F5WUhi?=
 =?utf-8?B?QzQySnU1eE5yTTdzNDc1Zldqb3Z2SU1FejZNdGlZSllTbFpXV1BjMDFWTm43?=
 =?utf-8?B?MENCaW9PTEY2QVAxNlpyd3U5bExkeGJFczZxNERkT1lrU1lnaExmWFE3NDFM?=
 =?utf-8?B?bmVMTEgwbmxVaXpNcjNOenNPOEZXOFlLRVlrYzFmV3hsZFRnemNVWXBpYk5D?=
 =?utf-8?B?NkZvRGNlaXZGUXAzenNGMENZcDJUaWl0TzNtNjhuZVN3Zkg2NFBDc2ZwTUFn?=
 =?utf-8?B?NFpRdjBzcURwYmFvcHlrbXVMaXd1aHQvZDNUaFQ1MmZjcllVOGtwTmlVTlVi?=
 =?utf-8?B?RXpRd0IwU0lSeU81TEd0TGNnamVYSFlBMU00NWViaC9ld3lyL3J0REhTSjN6?=
 =?utf-8?B?enh2OVIzWW1ZWm5BY2YwbUJxWVEwRERidlBiZlIwODVJTzgrL0FoN0o3RXpk?=
 =?utf-8?B?V1Q4UTlvWDZKUUovMFZDOU15RzdVMDQ3MjNlUGorOExhLzBPRnZaQWtrem9a?=
 =?utf-8?B?WDR1N0xOdHdLL1ZTcUpQenhqK3V5QkFsQmZsRVhnRHNJNlVZWS9qWFVjK1JH?=
 =?utf-8?B?aWxpcGlvNHFNTmpZSzd0aTROd0ZTT2Q3UTJCM1l3YThGTkFyNHJYcGZKQk1t?=
 =?utf-8?B?Q1FnMHNqUWdyVWN5VXA2UFF3MG1QMDlhdldRd09yL3Nyb3hwVVVtNm5DY200?=
 =?utf-8?B?Vy93MWo4VXpDSTdqTEY5blNWZzNhSnMxYitqbnczNnVuRnZ1ZDFKeHhVRHBK?=
 =?utf-8?B?MHcvTnNMK3kzcXpwS2x5cUdBdmhGcUU2STZRTWR2UXQzbHVzU1RTakdrTzB0?=
 =?utf-8?B?cktKQWwwMzk5TkhBdlpkb0NveEQ4WTc1M1hEQjlrT2hvY1ZSc1ZiS0d5aEtD?=
 =?utf-8?B?VC9TZlFCeUxTdHZ0eGZJcVRiM29PaDZsdWk0QWt0Y1p1WHBRak9oL3NTcWhR?=
 =?utf-8?B?N0lMTUZZVTRZS3ZHMnFzTThzUHNSUUUwb2hXQ2RSRlQ5TWorUVNwWDR1Y3g0?=
 =?utf-8?B?MFNxd1VGWUQ5QVVicGhXR3VGZjROd2plNXFKa083TXZMYmJnVmdFUjI2Rm1Y?=
 =?utf-8?B?cHBydDQwVmVxTVlONEVCT1BCMUpqT0VyTkFtSitTb3p3TklMVnA5ZGpUQ0o1?=
 =?utf-8?B?aEMyY2ptSG02R1JHS28xUElSQm1mOWtmcE5KUDMrNGZ4eHE2RVE5bEljVEZl?=
 =?utf-8?B?cWZhYTBocXdtV2hDcGxpaXBmVlUrMlg2K0lranMySTJ2aUpVOG9Ed2ZzcEQr?=
 =?utf-8?B?MlpOcStjS3luT1RYeW1pSFNoZGpYeU5Nd1VyUHBjYVErYXVvMnVzQWExZ0lW?=
 =?utf-8?B?VDcyZ0hiQTBhTGRXcmFoU3FMeHpCc09oOUFiakZyZm1ZQW0vb0ozMXBtMUJo?=
 =?utf-8?B?a2Qrb0hMT3NzTko1c2czUWgyV01PTmZIMVNEMk1VQWMwdzFnczI3cFRMMnV0?=
 =?utf-8?Q?qLgtm1q9pdnjk7NTQjTDlwEQMlI+lJvm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9HT0dKcWpWd0lnMzFKWSthaXdhMkJrc2RRWUdmUHRiV2NrMVZnak5Gc3ho?=
 =?utf-8?B?Q2tqYzAvaXdZTFpBTldsNlU1M01wWmxOR1VZSjlYL08rbXNSQ21PSEVpejFY?=
 =?utf-8?B?a0FBdWtHQ0RqUXZRdXQ3dVh3TlhoRmlvaUNoUnVwMHgvbUtzcEdJS1hFSWF1?=
 =?utf-8?B?UVJYLzFsbFBCUkdibUFjcTN5QUdlSTJHenNzakwyOVhlVE5PckY5czJOR3hE?=
 =?utf-8?B?WVMyTDRyTmcwRmk4eVVQZVZ0WHJFRDFmdTk2R0VaMjFQUEFLSXI5eUgzamdj?=
 =?utf-8?B?dFROWFIzS1NBcVBNUHp3OXhZL2lNYTUxWVQ4ZmV3ZWdWT0RHa0k4RzZhazli?=
 =?utf-8?B?dTRWV2RBUFZkZXZRenNsa0x3RVN6eDBEL1QweG5ZUEFyRTdqdlNPbmdQemww?=
 =?utf-8?B?dS9OK3JXSUxQMzZBRDBMQnRKTXAvY01sV1ZiL3lTWGJQY0Y2VVRpQWw2VnZH?=
 =?utf-8?B?VUlNY2UrOXY0eXhxcURhME9NemZ3VkxRMnhKR3J0MHBDT1ZIWTIza1FVdDR0?=
 =?utf-8?B?L3FLNjhOVjhDbWhoWTNXNHFTRDR1R1FuV1Y0c2RzYVFvU0laaDdQK2RFdnl4?=
 =?utf-8?B?L2w4NWVza2lma29pRERsUjhzekdRTlBuODRFM2VsMXQvcStEeDhYSHEzQVE3?=
 =?utf-8?B?OW12a2FuRm5RcHV2L3MyUU4zcTNBZkVmS3JIazhxVGMrekpYVFdYb1o2WWJk?=
 =?utf-8?B?TmNMRFhrbnV0UDRtS09RSzVWcGk3RTBrblJpQWdRbG9rbmNoT3UzeDNBM05G?=
 =?utf-8?B?U0FtdFdxM2ZXK01NOFFXUWpMVm5UcGExRnFsa0ZrL2VrZ1hrM0p1eVhzNVZ0?=
 =?utf-8?B?aEFiU0djQkxRejNlY1lia0s5ZmJPb2JyaENWZDE3UWs0OE4zZ05henZWaUFN?=
 =?utf-8?B?cktkZGRmL1FTdVFTaS9zTlhkUWZRMEpqdjN6VnIwczUyOEVVK2F6dmYwYU1G?=
 =?utf-8?B?VmpERGN6cUhMRFFLZmVFVWVRTkFMRThnQStqYVd0L2wzY25UejhoMnJueC91?=
 =?utf-8?B?d2ZlSEtIbVJYSlRMWkZTd2pRYTA0ejVuRUJJSzU0VUR1T2VpS25XMk11bmpU?=
 =?utf-8?B?N1pMMUt5ekptRDY5NDRsWGU2alprWkxVaCtmM0xuMFk3S0FxemVDRE5nT0E5?=
 =?utf-8?B?TlIrY2Z0a0laSEw1U0V0ckhjZDRHWHAwczc5TzlqZm1QTTFaeWRFQkxMVzQ2?=
 =?utf-8?B?aU5VVElvbzJxN2RVNE54eTk5MHdmWDlJalBrOVBKT3hZY0tDMEJ2Z1ZsRHN5?=
 =?utf-8?B?Vmc1OXhyVkdPQk9hZ1VYdVp4eGY5b0FOekc1M0xsNDhteTdNcWtLZnM3QXZE?=
 =?utf-8?B?TEpWWFZCSmZiMWpvS1JYZTMreGV0TGJ5R2lkdG1FMVdsanRyZ3pvVEJJczA0?=
 =?utf-8?B?K3Z1VnhvZnlwWXQ5Z3FQK2thTjUvc1JnS0cvUWF4RG1vWm8rUFdRWExoRUI0?=
 =?utf-8?B?OExZK2xqU0pmOWxwQmdZcDRYbVNwcnE5SDdVM0QxbDIxV3hvelFiQkpvcTZB?=
 =?utf-8?B?UnB6TituQmFhdFRkZE5wMUhwVjRicFdJRmNtOEtPU1Vja3pMVUttYlU2K1FC?=
 =?utf-8?B?OUlRWGNGVkk5T1pqQTAvT2RDamFkKzhkNWFoeWlHQk8vTFIxTnJBN1RkdG9K?=
 =?utf-8?B?QkxONExTUWo1WGFYQ2lIRklOWG0rU0liMjdVTC9YdHJxVnpTaEdSSzlIVkc4?=
 =?utf-8?B?YmorUkdIK1RjeXhqdkpNc2U4STBxTXpYKzFWU3dOQ0U2MXNKblRBYm1TRnRN?=
 =?utf-8?B?eEdMS0lDZExCa3FZWmp1SU1MeW5ZL3BBNWtTakd0ZlB3R250emt4bG1zUXg0?=
 =?utf-8?B?QkxQNzZzUXJYNkw1ZldlR3NTLzcyTXdWQVlqcEFpbC9XbzlPQk1BdlFDSFQz?=
 =?utf-8?B?OHVrUTdkMituSFo4TnF5U0V2Z2ptOUZqMHFqUzFDSmR4cjhLR09FYUVlNXpz?=
 =?utf-8?B?T0xScVlHNGtJN3V3Y1ZDM3RaK3FEcis3SGlZQ0Z1TXVIekRlZlUrdTVBcmNp?=
 =?utf-8?B?UWVPYU9LamtyTFlpdCtMQ3F2VmxuQm5MYXA1ZXZKUXlaVUtKUVpQYk15bTJZ?=
 =?utf-8?B?eEQweC9kU3F2K25MNUh5bmxGMVZ1bHFkNXNMKzg4L2JiYlQ5Szl2T3I0MEtT?=
 =?utf-8?Q?uwYLqldQC/ovfS8h685itknW/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f42d537-1499-4aba-179d-08dd581f472f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 17:42:31.9133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59EK4dFx1NvVVJOtDef9+mQaf2gflFmpk6cjPE02vLD7cBMbx7wSXqWOwCf6WalJjMozabGNGdfgivQN1s+h+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_094236_750824_6511BE14 
X-CRM114-Status: UNSURE (   6.84  )
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

Change binding to support optional error irq.
Add error irq handle for fsl-edma drivers.
imx93 dts add dma error irq interupt.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Joy Zou (3):
      dt-bindings: dma: fsl-edma: increase maxItems of interrupts and interrupt-names
      dmaegnine: fsl-edma: add edma error interrupt handler
      arm64: dtsi: imx93: add edma error interrupt support

 .../devicetree/bindings/dma/fsl,edma.yaml          |   4 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   6 +-
 drivers/dma/fsl-edma-common.c                      |  30 +++--
 drivers/dma/fsl-edma-common.h                      |  18 +++
 drivers/dma/fsl-edma-main.c                        | 121 +++++++++++++++++++--
 5 files changed, 158 insertions(+), 21 deletions(-)
---
base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
change-id: 20250225-edma_err-5a7385e45800

Best regards,
---
Frank Li <Frank.Li@nxp.com>



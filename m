Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD38E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIEMh8elRzjG2oGJDlD3TVB2oNYAmOVTvhx3GGYiHMQ=; b=be94t7HN6Td8Zc/OhO/wqbLVs5
	CBcAxT1TXGnU+oxba98TtaRpJ/bUf6+NbRpkzkNbrQVdzgxhyROquC47u4eMY7xBtHgiCN3QSDP0m
	n+Or5QtKZrReHmirFYwat3xDqbleb0vp/pho6VLpdiT6hSQ62918U5P751DNbxdZja5SOOl9GlgIR
	sYlJRE7Kja1zxeyP2nQpNxcoKIppJ5UkMpKKi1mzv6YhpbEVqphwH7LaVTgw+Mo+6dta8p4rImiMc
	L0A4dZrxUn6QM3nq7BvAk7UKOGyRZhx+OkXwibHpzctU+ylp12MQa2mZfHNXY2Q7KCbauO2yki8Mb
	Z8C/5RrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqhb-000000025Vn-2GVH;
	Mon, 06 Jan 2025 17:15:43 +0000
Received: from mail-dbaeur03on20627.outbound.protection.outlook.com ([2a01:111:f403:260d::627] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqgN-000000025H1-2iDm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBXAaA0VdZaPpD6CduOJ+cDJt3BwSeVcEeS6vBxQpB+aNi3Noxzif+4KT0hnWpqkhP18vYHU5Mx3R/64iN8qse1ZTO6/jgwugTkKSXlgt2UO5J3FPn/vA7II9mX+JgFKhCvqovloIPUt+ekxJStb/yv1VWb+lWsYDjyBxOjcCMvkFye4+mfEWkdVAKmNUyiqm5vgfd6KjMQ1t6d1Eu3ggCAv3qbPRpdzMJFIw4xYoHrPi5y3+vZfsi7NUP+3b0oF8p8ElimAiCXG2+sh4Mqyu/c3WAHKRzmsHU5F8sxDEyW8sXSLSDc1ysG5oeOh2yyk0PPGzQTnPoi+74SvTJeT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIEMh8elRzjG2oGJDlD3TVB2oNYAmOVTvhx3GGYiHMQ=;
 b=sRY6sL/ksZSgON6JH/PnEp9RvC+5q8xHkMm+TpsJnRYklt/CEJxZGV4El0dG06stBGh1O8k1B61e5pB/PHJuuortbt2jQV9NADHYab5e6ZWKRT88Gwh51kiUaCELQzt8eUjSysxJ58tHoywD52VtOqWbK9JUPqxEAKOJzcWg2ShpNxGNEqQBPZ2myP35OuC4Dn8Fj45g++tzCNQzKJ/OukMweCOeauCAV0w7ykJ0FEkzSnCgHRDAmoxlt00Gi9gCj62mswEKAXDZjtyyiZFFOJMfXdeP3JnBQ76MXH9a04NieU8Rp95a6DBGcXnX+tyafj07gwgzLvdTpM7YPkT7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIEMh8elRzjG2oGJDlD3TVB2oNYAmOVTvhx3GGYiHMQ=;
 b=H7ZeVKlJMl10yrWqZnV7SAqsgvJNbQw15kj1t1Ox0TatLdlkRzbn6fTKYqgJciXvosMKBfzpXQIOPMrA+c4iFL2GTkw+QmMbTphKwDo75RnHQqvYcFINhWYz/HK/eCFvKVXqFspBKhxBPVCTbwPNHzQ3MM9Gpm/uuGe02wBksrj82JisKZABDOrXvhCSPFA4Mv9ZIezVwZDfBg8X75HNdet64s3iV1orvh0uy9szzFQs2cqRN81/W6fAabKco2yo6zTcGSAFDMau6NurMTsR7ptQhLlrS9yI7Zog/+Sjj1+TRMBtnIV2zwSr/AH92ehT16uLeC7eTXWNzJTK3tZHhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 17:14:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 17:14:17 +0000
Date: Mon, 6 Jan 2025 12:14:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <Z3wPX1F4VrQZhICG@lizhi-Precision-Tower-5810>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241124143839.hg2yj462h22rftqa@thinkpad>
 <Z1i9uEGvsVACsF2r@lizhi-Precision-Tower-5810>
 <Z2R6HET6FZEO+uwi@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2R6HET6FZEO+uwi@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b4a348-c186-4890-df76-08dd2e758d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bktMNXNXZU8zTndJWHhEemQreGtSc1p3RU1wMmRHVm1WTi92SlVlZjFBWW5O?=
 =?utf-8?B?eWdtWmlLL2pVdjR2MjZYMThYNFEyZ2RGekFNbHM1TDJGd0paRkNjV2R6a3R3?=
 =?utf-8?B?QTdnSG56UjR1L2ZKMTNzYk1EQjQydDAzY2ZkOGRTeUFkQjhCVTJrRFJpQTRF?=
 =?utf-8?B?dEVnbjJ2MDQ0YVAwVDF6YlYzb0lkZ3BkZmtFdW5MYTdHVzVMUjJpZktWSmcw?=
 =?utf-8?B?NkI4UXIxdGpYNlljYlh3V0VtMTlZOWI4M1o4OWNNb0Q2QVdwcHFmZGthLzl6?=
 =?utf-8?B?NDF3QWg1aEtWVFpOdnl5ZGhreE41OWdIeDBhYTJ3YW5FbTZxZTJ0Snk2UHZW?=
 =?utf-8?B?WjNSaGlLMU8zNmVSenFaaTBXbTA1LzJseUhkRi9Na1M0LzVDb1luSDdTR3NS?=
 =?utf-8?B?cUthVS9zWG5Cd2dLeW91M0JHRnlqanlJVExpRm9IaG5rbGpGYkJ2MkVwNTha?=
 =?utf-8?B?WXdCbU5sdGpNWXA1YjA5NThzRjNnUFZrOUozcHlKamZwNWFYbzhDQU9iVGoy?=
 =?utf-8?B?U2o4TFFoMVVtMXRnWUFkb0V1a1U5UjJlK0pVSlI5K0s3dTdJcjNqdkM1Z2xn?=
 =?utf-8?B?bzBESklzZkhsSUxVNmNSeUlncm11ZDNheDVPdnprai94S3NNbzhpYit0eVRO?=
 =?utf-8?B?M1VzMWI2eDMzYy9ERG5Xam9VdHh1aHhad2tCR3c5TmNtYkRuZUtsaStHZFYy?=
 =?utf-8?B?dDJqMEZCUUxuVDQ2TXkxYlpFcTFVWXdseVRuVTdMS01Ga3ZXNUlUT01YcU91?=
 =?utf-8?B?cG9NN3prQ1RpUUROS3lucXpLS3Z3Z3p2NDA3ck9DZVEzVTJLMks5blNKNWhZ?=
 =?utf-8?B?MDdYRUtZcDB2ai9UZFRXc3lsZ3RZYURRN0lNUFlyclNmeDI3U3FGWElDZkhW?=
 =?utf-8?B?THdSc0ZVa05YVjk2ZFozb0o3N3o3U1ZOWStpSUx5dU92MUxEazlCVW5TcHlw?=
 =?utf-8?B?VlVVQlFwc0ZQMjROenBEbElUU1Yvenk2d1pZbG8wUzhnZndyTmJEU2gwbFB3?=
 =?utf-8?B?Vmp4SEVjcUFFK2hCM3Vzd0dNM2JSc0hhQm5mVUYzNUM2OUpGU0pVK1VIZEJ4?=
 =?utf-8?B?NVV0ZTdIZy9HWnRIT0JHVGV2cEVHWnBBbDdzUmRCKytFaU84eUg3N2FNQjky?=
 =?utf-8?B?anZ6UCtRWFZBQjVIZ2xjSjhBRldJaG9vbFZ4UWpBM1hWZ0gwK0FYMnNsZE1t?=
 =?utf-8?B?K3I5aC9TbUtGVWFhOWxEQXYwQmlZU3lnQlFIdUp6a29tNGw0cUFjY1JyNkth?=
 =?utf-8?B?elNvOWNqa3FxakRKSEpwdGxLNCtNeDdpaFJ4UEpCa0xnQnBZbkRvekN6Rkoz?=
 =?utf-8?B?RXBqRWNuMCt3ak9HZTBXclRrMTBJU1lIdXhaaGJjTHd6QzAvdllWNVJJa0F2?=
 =?utf-8?B?T0JnaXRTYjFBd1RVSGwxM3d2cEdMbFg5bDZDdGJhWkZGWm9PdEpNTzV4Zm85?=
 =?utf-8?B?ZlVydWYzUkRVNWZGSldjTHNLTHYyYk5EUVpXNEZHK0ZabVI5Qzg1R1JweWta?=
 =?utf-8?B?YThzMmtqWFFITmVMYVh4cE5mVjA0RTg4c2ZlYkFPOG1TSWQyK21HVld6TjFF?=
 =?utf-8?B?RTZwMDRySHVxVUREcUdtczU5UnFwUVZlM1NXQnZGNWRpSlhUWEZxMWlNenJO?=
 =?utf-8?B?VnBtbjIyT1FPM004ZGs2aVRORTUwRlhoc1RtNkVLN2ZGTzQva0taNlpuNVll?=
 =?utf-8?B?U3c1eGl6bngzek1FM1hLYm96YUlvZmt4L3c1cjJzMkVHU093OWx4TXl6cGVz?=
 =?utf-8?B?bkYrbm55Y2E2VzFmNkxlQWJkUVRmUGZrcUl2cDBqN29ySHdFN2tlQ0tPSTJT?=
 =?utf-8?B?d0pzTVdVRW4wQlZvUG5yQ2E2eUpiWWQ3T292UHBheENScExkNllFYjl6UXBT?=
 =?utf-8?B?dUo3NWROQjkxdWNCNmxGUTJ2QTJGdllucUZaL2JqTmRnVkE2T3BkNmV2TWFO?=
 =?utf-8?Q?IKvbw/p5IYHxVMYM068CNFyPhtqi3lcN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0xGcjhNZE5OclJIbUlwKzJQSkpVc041WStoM2w2ZXo2VThKZUxkMFc2Zmh2?=
 =?utf-8?B?d3dBUWUrN3EwQU5RUTlGUys5dTVZQW9iQ0VEYlRra2krb2pGMUp0TkVidnhE?=
 =?utf-8?B?Zjc5azhNOW9XY3V4ckJyK1hmVlVlZ2tVR1llTU1WRTd5ZnVHZEduV090UFF6?=
 =?utf-8?B?Wncva0hZYlJBdkFEYTF3Q0l1eWg4Sk9xd1l6MlJjQU5aT21hTFRSRXhsa08w?=
 =?utf-8?B?Z3pzUGpYVHROd2w2SVpSdzhSTHZaQTBTL0lhOWVWOXV1elBxZWhBQUlNdktM?=
 =?utf-8?B?b1g4aHNaQUlidHRjdEhNczZvQmVpZkJMdjZ4aGlKOEhjM2ZiWnZoQUl3Nkpn?=
 =?utf-8?B?djk5NDcxUFdrNXdkSFNQOXg4VFhHOERPY3c5ekp6QUI4eW1PTG93SHJtRFdo?=
 =?utf-8?B?Qkk1NGsvNnlnVmR3RjFYOFlrUG11ZjRGeU9tVmZKRHBKUVZQazU1MUF6WXNs?=
 =?utf-8?B?cHJ0WG5kOWY4amk2K0VjbExuSFpHbm5vM0Rta05UWWV0dDBDWGpZbjB6bnA0?=
 =?utf-8?B?czAxVWhQRDlFZTViSzZVRVFrWlZKQklzcTVtem1WbHBqcDB4VjFrdjNCSk1W?=
 =?utf-8?B?N1dSRWFYSlJFb1dLak9DeUlaMDYwSVpLcjhQVHBmS3FxbEJHMHZpV0cwek9F?=
 =?utf-8?B?dVVVdGVJalJ2elM0MktYNTVwcm02S2lDS2NSR3FHdmliRHd3M204TktER1BC?=
 =?utf-8?B?Zit3a1A1eGt4YjJtUnV1dTJweXlvaE0xQmtKTUtDb1p4amY3LzhjaklSdUlJ?=
 =?utf-8?B?S0JqUkNVQ2xpSVlPQW93aS85L1ZxclFwZ3dwOGJ2cWF1N1dzSm05N0dtNGlJ?=
 =?utf-8?B?M1hmK1BJYllBcUREdEQ3a3NXaVJkMDAxWGNHQUE1YW9GVFJEY2UzakZDbFRY?=
 =?utf-8?B?eEVIbFVVTkRXSU8wTHowK0dHNUE1RGtSdmt0WWUxanJEemVsOCsxUTNFNTcr?=
 =?utf-8?B?UWl3aUUxWERGaEpFQUFKY1RYT0ZrekJ4YlVTNm9nd0NTTXhNYkVHalp4aEtk?=
 =?utf-8?B?STdmTUt6QTgyZ1NyVGV2Nk5mR2hrYVRWekhCU0tPVGNxbHpKUXI5eWszWmNO?=
 =?utf-8?B?TG1yTHhTMHAyall4b1BGUjZpNEUrSjBmY1k2RGpvZHk3VkZTQzhJanVaYnkx?=
 =?utf-8?B?cDFMTEovaGhRSllrb3FDeTBpdjR6UklaU0dYeGxwM05XdFFZZGxDVE1kRlhs?=
 =?utf-8?B?VGVPUTRHQ2pCZVhVdERpSWRqQjFyb25JSHJkeG5NMGhxb2pLVUJWcTlucDFF?=
 =?utf-8?B?ZkYwbkZNL0p2dU10cElDdk1FYTdqbFVQQXVneXB2T1cvRzcvU1pxeno2ZWJW?=
 =?utf-8?B?Rk45MHRHZU82ekMzS0Vmaks2TmlaR21nNjkvQVJZMmFWTFpxcS9MNUZZU0JE?=
 =?utf-8?B?ZURKOGdlKzVpSERBMVhIc3V5RExjdnBEUnpKZ0M4eDcwTG8xdDJQSlltaTBD?=
 =?utf-8?B?dXhHQUJTekFLL0RUckdnc3B2THBKaGlxSWljWlh2eWpaemg5d0o1R1BQWlFP?=
 =?utf-8?B?UnE4THdOcXRSUUJtYW5XUnNhdEdhUTZFVzF2YVYzMlI0eXp1b0JUOW5DcmxV?=
 =?utf-8?B?L0JGZmV3N1QzUEx5STczOTczd0tQZDRTWU9YWWpWRm5EdHpCcEtMTjBvWlkv?=
 =?utf-8?B?N3h6V2N1TXovQytZdTFtc1B2cjQyTzJGdWRmZGVuekQxWXpHQ1FuZ1hBVVI2?=
 =?utf-8?B?TExXNnBPallNK2FGVlpLRGxScDJIZW9KRXFIcWNaOHBtRnRrbXJHcW9FZ1gx?=
 =?utf-8?B?VVkyb0RHR01KMHJOZlQ3SXBZNnRxYjl3blFpdnE0T0dXSFNnMVY3TUNvMExR?=
 =?utf-8?B?VVBURVVSWk1JMjZUSUx6N2hGL0F1UHdRcjkxeElWWVFTYkgzbFI4Zml1TjNv?=
 =?utf-8?B?Y3lTQTIzcW0rTmlTSE9UQS83VkFpNnRPNTdqRWFUc0xXeW5pUm5tWk1XQ3lN?=
 =?utf-8?B?YlhzTEg3dHladExHZWpoVWlNSE5RNFVWWE8xSDJYTWcrOTFyY1pTWUhpNldQ?=
 =?utf-8?B?WEliTXllMVBvQ2wvOGtvYXBpdUZBdmVNRnJNZVZNZnhMa2xXVU1QeXVFTVRu?=
 =?utf-8?B?YTNYMFZhNFpJK1lvangwM0ZUWVc5SUZOWFZRY2srUjYxWkhwM0czZjJVVTB5?=
 =?utf-8?Q?baQaqNvR5Y1wl1xNTl5Q779h9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b4a348-c186-4890-df76-08dd2e758d12
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 17:14:17.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LbldGILRBllP4KHa8QGdE4E+c7zoHfYPStAGh16J8du8m8fnj46HwYvZRUn4oql4e/bfmbzo3maWBRL6M/UDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_091427_685077_7080FAFA 
X-CRM114-Status: GOOD (  18.17  )
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

On Thu, Dec 19, 2024 at 02:55:08PM -0500, Frank Li wrote:
> On Tue, Dec 10, 2024 at 05:16:24PM -0500, Frank Li wrote:
> > On Sun, Nov 24, 2024 at 08:08:39PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Nov 19, 2024 at 02:44:18PM -0500, Frank Li wrote:
> [...]
> > > > Previously, `cpu_addr_fixup()` was used to handle address conversion. Now,
> > > > the device tree provides this information.
> > > >
> > > > The both pave the road to eliminate ugle cpu_fixup_addr() callback function.
> > > >
> > >
> > > Series looks good to me. Thanks a lot for your persistence! But it missed 6.13
> > > cycle. So let's get it merged early once 6.13-rc1 is out.
> >
> > Krzysztof Wilczyński:
> >
> > 	Could you please pick these? all reviewed by mani? It pave the
> > road to clean up ugle cpu_fixup_addr().
>
> Krzysztof Wilczyński and Bjorn Helgaas
>
> 	Any update for this? All already reviewed by mani.

Krzysztof Wilczyński and Bjorn Helgaas:

	Happy new year!, could you please take care this patches?

Frank

>
> Frank
>
> >
> > Frank
> >
> > >
> > > - Mani
> > >
> [...]
> > >
> > > --
> > > மணிவண்ணன் சதாசிவம்


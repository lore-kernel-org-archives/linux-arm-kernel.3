Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474B6D10395
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGMO0kSVYnR6lRqgwfKP0k2e/QOTtqGn3+WzHCXK8bg=; b=XemCDfyd0oUbqALvRRYOYHhisT
	B+Awu4gefL3bHms80qjhnVvUIwjXo7DZmZK5wUqly9y5yqvlZ7uNq3gI2FKkCHA5WoUSUrhD2B/A5
	Ys5o53ekMhw47vfWccJ3hTMcCOlE+jVrb41RoMYuoTB9CIGAU2bxtT+Lmw04wWpW/AdfCoKwBx61I
	6iqwEC2B7MIBV5dwsqQetyneHlSFr9Dxu6p4DfAKjBmpFL7PwumUiBTgKRhtxuDU0rWMG1OAfdi9U
	V7u1UQCEwU0TZLAOWN6BXeRTwfdKwy18UDppwTMFNWLigroCiVIK6SkqiLsjh8ZsWcs4bQygJCt9i
	xCe7709w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t47Wt-0000000230E-0UN3;
	Thu, 24 Oct 2024 23:46:11 +0000
Received: from mail-am6eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2612::630] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46QA-00000001y4n-2PKz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:35:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syK1BQnSiwgKWHZj7DLuHOeNQe33pjjxvQe8w3Z+Lt1W178Lhg34JaJe93aERbgz0RCMYNcMyNyhGMCvMMQaxkd9Qn680WWAzvuff4eQ7OntDAaD8V3tdxLyhrebopfW1Btef5UuXCnz5W+a14TI7dEPxZ5YMeAU23aO47xgtIOao0nbaoW/zrpIGxo1MrqgnhxR6+t5WX8mQGxLx22TEjg7nMz9+DebswD1GZMU9/FnifuwQ5Q76N+t0F7v/co22BjR37Uy8LRJDR8Z+UgkzT3J6+5BBZ4+nwpabtEjRC9yTDAa7QAuwgl3aXLmId7Wop3fZsld6EpEQgsZPqv5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGMO0kSVYnR6lRqgwfKP0k2e/QOTtqGn3+WzHCXK8bg=;
 b=l2PmKmFaQ8B7RCsG6ckRMvQhLIgEGKwwfCZw4fTooPA0FaC19zItDwK5z9Iy6f5iF485ca6a4ZND64xlbrpuVg2+KkaW81ydwxFe1lHOrMy5WWvcwZOt9ugAWR5eHCVbInQ8ETo+JdAPhntiJc8ogmYskg92fVQX1AnLwP30HlMzIV6gqQCwKC0IuK0sLRSLW5K8d4c8t0LzLuxQ1dPAc7AIi1gM5xixNo1FUu6QgxJd+ITwWgp3/E/gJTQG90bMZATK097ibCrBTcdxsBSt7uhfCqwgt+fMZ2uC9vBzs19nrxXuPRwIK1/XISk4nXMZWF4T2VJ2n5DH3qk46cXCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGMO0kSVYnR6lRqgwfKP0k2e/QOTtqGn3+WzHCXK8bg=;
 b=C6Jl82q6QHeuLTpFdImfbJRPxoZWIsdxyJVuwuuQC342UYDTDuFj8kwsc1dchGWzjoZpVeGs9sEsboM5UTm8O72HMz8iSKm2JliklU6b8CeOBv4gMoh5FlLATHLglLhzTJURO0BN4naSpMxLnOVt/ATIPLOZ6uBy6X02ES/3IL8GgyuXW+w0PwRcHCCovswX2DoiWBo4eHc2zigZcDwwdHe2NZK3DGNZLm2tqsnIBRHUYw5CO7iFeppb37JGTiqCFqm8QHMzenmyOTlNuZv9Ahw0Io4B0/S2i0U3juaDIEJFjz1cwpB0pNygjZXGfi4OMzZkZUbZhE7EX+Je+L5MOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7189.eurprd04.prod.outlook.com (2603:10a6:20b:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 22:35:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Thu, 24 Oct 2024
 22:35:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 24 Oct 2024 18:34:44 -0400
Subject: [PATCH v3 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
In-Reply-To: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Frank.li@nxp.com, 
 alyssa@rosenzweig.io, bpf@vger.kernel.org, broonie@kernel.org, jgg@ziepe.ca, 
 joro@8bytes.org, l.stach@pengutronix.de, lgirdwood@gmail.com, 
 maz@kernel.org, p.zabel@pengutronix.de, robin.murphy@arm.com, 
 will@kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729809293; l=3684;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=N+O2/eXaO6AkhaAeZYU5FQuPIX9O4F9QoICBgRu6MQM=;
 b=VesD61ANJVOLjtQA0ptlj+ydmMtuGCK6E3XEPit1tm5yjGFYLk1JG9SUmyNEXlvm+mv7TFfi3
 tBpSJnUFBGeAH4L5S6QmS08eutaB4dZf78BZyrkag2KF3bxgEhWatiL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1fec68-e554-4d17-5bdb-08dcf47c1bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFZSVUJuRzAvTHBUclhPZjhxOWdiYWF4TXhKRTByVWVtU2RoTUJNWmo5WGtv?=
 =?utf-8?B?VzZ6MXc1ZWVMc0ZrTVROSCt4bGc3QVNVZUt2bnpIY2dNb2ExQ0kzM3B2NXRO?=
 =?utf-8?B?TXFPTHhFNDNOc2hjYWdLK2JRZjhPZncxaFVmMjJKTHBjTHIxd0JCTEVWazNa?=
 =?utf-8?B?Vkh5cHIva1lsUHhjNWRBRHdpV3BaQkQ5Qzd2ZmdxUlZmendFdnRmL05oRDJy?=
 =?utf-8?B?TWdWQWVKMm90TFNyNm5jT0EzZVJsUUJ6ZXBIMTRGMGYrRkptWmtuN0s0Wkdo?=
 =?utf-8?B?UVZ6NkV2M0drQ2QwOThPU2NoVXNBb3RqUEVWVC8yR1Azc0JjRUZRd0dEUEJ0?=
 =?utf-8?B?UWFqN3gvWG5oeUMrRDZtQTZhRGFtcTUyaXE3TmJlajV3RlNMMSs0ZjBXUnV3?=
 =?utf-8?B?d3RVY2JNTlFidDFVWFpRRUhUM0tjblFuclFuRk1tWGw3SHZNSWhQeUUwbG40?=
 =?utf-8?B?bHVCMWpOOVF3VlNJdjgwb0VkeGdINE5mT3RqV2kvd2ZZU3V3NUpab3NTQjNS?=
 =?utf-8?B?cWp1V0tudHNMZHQ2ZDFCU3hPUElERFNxWm80U29FVk9hVk01SjAzOFdCaGd3?=
 =?utf-8?B?Sm1JYXd3bkpGWUcyU0N2RlIzYmZJOWJyV3RTZzdIOWQ5KzR5dVFqL0ZLY3Iv?=
 =?utf-8?B?K2lmNXVxWkhHdldBY1JZSU11ZGYvQUpwc2V4Z1Q1eVVkRkgwdkYxZ3BlcG1t?=
 =?utf-8?B?eURDaDNSU0I4S01pMkN3UktSL2ZUMFZMSndxYzRFN1g2OXVTLzFhdDNYSEV5?=
 =?utf-8?B?VWxURzR0NUdaeVhJMkxvSjVnblBSd3k3S3Vnci9HME42cU5pSlI4V012UkRy?=
 =?utf-8?B?VFlMbFZrNHdGVDMzdnhlME5sQlo0dmdLT2ZtaENXTU51QkFmaHFMV2UzMTFN?=
 =?utf-8?B?MGg1Qkg2MmhCRENza0RqU1AxalE0RVN6VUFKZDVvemJCUDBtYUJtQkY0SkNt?=
 =?utf-8?B?TmU0d2NZZlhGS2JNcVA5NXpLbDdFbnk5c2RFL2pxTFNIeldRTTlpSmlNRHlJ?=
 =?utf-8?B?T2VXZDVIZ3VQZnhBT0xKOFFrdU5mdmFoM3d3eXZLeXRhOU5hWllweTlqa3pF?=
 =?utf-8?B?dURVcldDQXUvSStwMkphT1UvYStMaGtFTS9KTi94THcvQklnQ0xEN1Vxandv?=
 =?utf-8?B?V2pnWGpUN2dZbWZWN2ZLSWJGRjdsVWM1RHNaMmxZSmFCdmRQSnJrYU1EdjlD?=
 =?utf-8?B?RGNWTTVidk5lYnAvYTkva2VhS0FhelNiL3lwb1V2WG5iZ01IRE52UFJaSVM3?=
 =?utf-8?B?anpaZi82ZTZ6SnBwMCt5SU5odFhEWVFQUXVhSnJqUUgwRkg4Zmp6WnV0SjlP?=
 =?utf-8?B?dU02WXl3U01zQ3Y0RmtXTkptOTl2c2dVNzllY2QvMWZScnVPcG15QVJTdFFv?=
 =?utf-8?B?Y1JuV3V2dWZoUjZ6WHBXcVU0OE5VQVpMOTFoeitiK09KUGVYVk9ZMlJsdVVD?=
 =?utf-8?B?bENmdU9rTmpxZ2dnWE5ENlF2MjVCdmttV3JCTVlCUHNVN2NoZHZkTTFpNHVk?=
 =?utf-8?B?VVR4dHpmQWxBNk4wREYyZExKaStxRHZjcXY1aEdjdzVFMEROMmYwd21xWHZE?=
 =?utf-8?B?bi9CckdVWXFTQ1d0MHQxdkNqWFNCWUduQUtheUJYTVhVQ2YyNlZpZFNBWXRk?=
 =?utf-8?B?bXhpMDIvYU5vS2xVS2p5SkhRWWxFb1NJOVg1aGpzNVBmT2t2Zk5pSWxJOVI5?=
 =?utf-8?B?b0VqSmtJUEVRT1NsYUpDajZXNmtvMkNhSE1ZMGFDMEJwR0k5Qmh6eEs3L2ps?=
 =?utf-8?B?L0tqeWR3c3J4ZXVXaHoySHJOZGZiT1VhTGpNbkZXL1FVdU5OOEdVWlVUUFhJ?=
 =?utf-8?B?bGhzc0xoanZUeWpGalh1Zk96bmRpTXUvdmRveTNZTTF1YTljRWFtc1VZZEc5?=
 =?utf-8?Q?437s7ZMYDMPrc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdxS2N0b0dvaDlrYTBkR2ZqSE5RYjZ6a1ZrU25qTkk1SHZuVXVRUWJTdDk0?=
 =?utf-8?B?MDYrNG1yMnJ3ODJoQXB5YmszZ2UvbjBrMXVjaExQOXBtNkZ4VzdpOCtvdk5Q?=
 =?utf-8?B?YktYUkR1M0pXZE00R0VnYXozWUFyUDA3dU1HanpJOEpnQlYveXpmc1d2Zkoy?=
 =?utf-8?B?VXdyaTdIcWFsWU1VOWJXOEdTeDJPVkVtOXNxc0RYcHBkMnRySmg0ZExNVEFZ?=
 =?utf-8?B?TnErcytvTzBXay9EU3ppbHYvQUF2UEJDdDR5aVZaazBBbk5lQVE0a1Jyc3Jp?=
 =?utf-8?B?L2pTVGV6TUREMnNMVVM0bkNkbVJJb3NNd0M2WUc1QTJBREliNDlualU5SEpk?=
 =?utf-8?B?RTl2b3o2REF4QVRlVVQxUlhFa2p0Y2htYnRkVnZyOC9uWUFxZVRVM2VpZ3ZY?=
 =?utf-8?B?UHBJVDFsN0NGZXBpd1dQaE55bnV3UmZuZ2l1Mk95OWlvTkJpV2ovY3dEQWsz?=
 =?utf-8?B?dkVNMnJwRk9pNG5NcXdqUWQwb1lDeWZlZlNmU3VGUjVweWw1VEhBUU9oMktx?=
 =?utf-8?B?TjFEZHkvZlg5RVkvRlRxeUl0bllSN3lPMXIyTGFOSlNZMDZRTk9IeVNLeEk2?=
 =?utf-8?B?cFN0VTZQejhHWTRBWUlHbHJRT3RPMEFpSkxhTE10bGN5VndRRTV0Wms3STBY?=
 =?utf-8?B?SUxmdnZaQUwwYTkzeDF4bDZ6bnp2QzhXeWRLYVpGQ2pRTHo0d3FnSVVWbzAx?=
 =?utf-8?B?aS9yTllDSWVlNUw0WWV1cGd6MHAwMmdaTlZDRkt6aUc4WlpNWGR2T2lhUHp5?=
 =?utf-8?B?K1p6eXJFbDNpQ2ZrZ0RKUm1QekVuT1l1Q1RjVGN4UDRQUjB2a0hzbjBsUytU?=
 =?utf-8?B?RFlzekhZT21BcGxrcXJ2V1dKVGErN1FiRGZBY3hhdFlmZ3RYa2IwR2tkSUw3?=
 =?utf-8?B?UkJ3WTRDS0RIYVNZalgxUHdzQ2JTMXREdVhzUy9rNi9WTW01dmlBTGVLdTc3?=
 =?utf-8?B?SS9TQlBKMmpQamFRanpFTS91UHpoL3NSWDFnd1lXcVBmcVFsMTFFOUVOTkxI?=
 =?utf-8?B?TFJjNGhkVGlPM1BaSXIzQm9yYWowanNqOXpHd0VEd29pYytGaFgzOHNlZGlW?=
 =?utf-8?B?QWxESS9xY29xbVhxRC9qQitnU1d6VDZRalM1MWNVSVlPZGVSeDd5UUpMaEJy?=
 =?utf-8?B?ZHF1UE0rUVZzYUo4UmdHVDkwMGdKb0RKY1MxZW1GQWhtOEFkTTNwK3krYWln?=
 =?utf-8?B?ZzJZOEtyclZqZlFUbWdTWXVMd1dBMmttaGt2NUhvdFhRbU50TC8zZGRVSjZ5?=
 =?utf-8?B?cmZZZkxvc2RNV3dLdUV5MTlaZWZsM0lXVGcyRXJnb0dCTXRaVDI0N1dSMFNm?=
 =?utf-8?B?ZTJRNnRrN1l6Ykk3RDVoRUpTd0oxaU9ESlZibFhSV0RqM2ZwendDbWV4RzZI?=
 =?utf-8?B?MWNwVVMvUzJtckQveE9SVWFVR2xJYU9sQjFacjU4eXNxL2RCam9Md0dWMmFF?=
 =?utf-8?B?cDlrWk0xWGxoUW50QmNxb1E0Sm9abGhTOVMrcisySy9tU2FUK00vK0tUcWFV?=
 =?utf-8?B?dlJEZURyU1ZhNUhlMmQ1Q1pUbHJkbEJucnYyRkgvbXMzZzdVcXlrY3NTTEVP?=
 =?utf-8?B?KzhnUkFyT3A1byt2Z3ZJRVlsaDIwMHFIcElYeEJMN1dHcFFYT3RqR2dqS2hw?=
 =?utf-8?B?U2hsTkllUmZzR2xvMEVhNVZNR29yZDd1Q0xoSDhRQlN0bTFnWWRRSUZ4Tm91?=
 =?utf-8?B?REhlc0ZhU3o5U0V5Z2t5aUQ2UUcydk5qOVl4NzMwcTNCVjkxdXcwWTE5Nzhz?=
 =?utf-8?B?UEw4cytUM1hlSGZOVzZvbkhWNCtTNDFSVFdyTENnRlNRa0NrYTNZUXlCWFNI?=
 =?utf-8?B?V2d5bVpXOUZHOEZ4SVh6ZnZ3Q1lHd0J1dHFYcXVjd1F3QjE0WkFGT0hsbklj?=
 =?utf-8?B?enBLN3lGR2FoV0ZKeDBxQWZDUVlLdWNxYlZLSjRwdVBmRWNtSjBCS0kvMWRv?=
 =?utf-8?B?dFhVUmZTYnYvRFhVTHhRVmJ6ZVNhL1UxRVd3V0ZwL0tkL2cycHd6ZEVmUmpV?=
 =?utf-8?B?eGRjenloc00ySnRid0Q4SUlpd2d5Y0t5bHZOV01zcFRTZCtlZmFiK3lISnZl?=
 =?utf-8?B?QzIyUHpqS0NCR3NwKy8wa1NqRGthakg0YW1SNW9SZTBJQzV3YU5wM2JRRitD?=
 =?utf-8?Q?HwzLHRMs1R6bYXbnFlYbZSC+x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1fec68-e554-4d17-5bdb-08dcf47c1bab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 22:35:05.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xd9i01Xo/MkismE9znLBTH9SE5jbDnsORochsx7+/6Ep9juSUx74w1qxqZcae1ipQ/0XUxoRLdKDQ51CtHeFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_153510_659957_3D873053 
X-CRM114-Status: GOOD (  21.18  )
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

Some PCIe host bridges require special handling when enabling or disabling
PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
to identify the source of DMA accesses.

Without this mapping, DMA accesses may target unintended memory, which
would corrupt memory or read the wrong data.

Add a host bridge .enable_device() hook the imx6 driver can use to
configure the Requester ID to StreamID mapping. The hardware table isn't
big enough to map all possible Requester IDs, so this hook may fail if no
table space is available. In that case, return failure from
pci_enable_device().

It might make more sense to make pci_set_master() decline to enable bus
mastering and return failure, but it currently doesn't have a way to return
failure.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- use Bjorn suggest's commit message.
- call disable_device() when error happen.

Change from v1 to v2
- move enable(disable)device ops to pci_host_bridge
---
 drivers/pci/pci.c   | 23 ++++++++++++++++++++++-
 include/linux/pci.h |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7d85c04fbba2a..5e0cb9b6f4d4f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2056,6 +2056,7 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
 static int do_pci_enable_device(struct pci_dev *dev, int bars)
 {
 	int err;
+	struct pci_host_bridge *host_bridge;
 	struct pci_dev *bridge;
 	u16 cmd;
 	u8 pin;
@@ -2068,9 +2069,16 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	if (bridge)
 		pcie_aspm_powersave_config_link(bridge);
 
+	host_bridge = pci_find_host_bridge(dev->bus);
+	if (host_bridge && host_bridge->enable_device) {
+		err = host_bridge->enable_device(host_bridge, dev);
+		if (err)
+			return err;
+	}
+
 	err = pcibios_enable_device(dev, bars);
 	if (err < 0)
-		return err;
+		goto err_enable;
 	pci_fixup_device(pci_fixup_enable, dev);
 
 	if (dev->msi_enabled || dev->msix_enabled)
@@ -2085,6 +2093,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	}
 
 	return 0;
+
+err_enable:
+	if (host_bridge && host_bridge->disable_device)
+		 host_bridge->disable_device(host_bridge, dev);
+
+	return err;
+
 }
 
 /**
@@ -2262,12 +2277,18 @@ void pci_disable_enabled_device(struct pci_dev *dev)
  */
 void pci_disable_device(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host_bridge;
+
 	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
 		      "disabling already-disabled device");
 
 	if (atomic_dec_return(&dev->enable_cnt) != 0)
 		return;
 
+	host_bridge = pci_find_host_bridge(dev->bus);
+	if (host_bridge && host_bridge->disable_device)
+		host_bridge->disable_device(host_bridge, dev);
+
 	do_pci_disable_device(dev);
 
 	dev->is_busmaster = 0;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 573b4c4c2be61..ac15b02e14ddd 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -578,6 +578,8 @@ struct pci_host_bridge {
 	u8 (*swizzle_irq)(struct pci_dev *, u8 *); /* Platform IRQ swizzler */
 	int (*map_irq)(const struct pci_dev *, u8, u8);
 	void (*release_fn)(struct pci_host_bridge *);
+	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.34.1



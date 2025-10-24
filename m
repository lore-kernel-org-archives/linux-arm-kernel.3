Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E3FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 02:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQTFDvEdei1wnzSz09E6T4vmbX922gbrByDq4b5TYgA=; b=iAuNH/5O6DFWFthE64tGgwB4UB
	IqKP+ozChXNOlJJEKwQAH1g8XL7trHRJRNh4i/D7yElSv+eYv9v4lvHuvCsiWUAu6W+LDGI7Shaiq
	vfIBvXIaBX5vuJ7b7nfxN0gTnbBHOqQoqF8Fto4+Ocn395feb4y74KOokwtc5a5W/u2nmViQA1CvH
	rDRdC9JMD9pi1bktyf/RGc/ghesgUwss7pBGKisw/crskyOM22+ajfRzux7OdzEzJyyl8J/DKGMgU
	36cPtUmSDpCT37R3obEEkuhRzns6E5S+1OxlRjlnQ8qF8xuyvn5PYRohhuYEEnOIEhcnfX/OjnMoy
	DNO0RICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7uK-000000084f9-3mmx;
	Fri, 24 Oct 2025 02:52:00 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7uG-000000084d9-3qV4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 02:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgUn70z1CG8m6dNfCtz9ilv2u7nmUvWHAo5+SFzJAQXmILB5EeKwHMr/Jhs23oZizTpeTs34aQuoYAWv1sKxMfFpvmOzfE49ZuV9/BAJzJlKOkMM5IiBDG9WUiBW0MdEkBauSbA3/4SEcSUO0q1gigbzsCHo2MBkD20HTamByBD38xb/UN2lWL7AbtCRfiZNeMooy6V9x1C6k+tbZznAg/TK2y826zKMhe/C/sL83teDsnjereZkbY7KBEj88bg1fWngPWKsa9ad4IP8k7O+GXqTHisZo/wk16Lgmq9vK53JdprXafNJLtfsd3r9hz5mUXJw2H79hb/Q3x+SIsUIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQTFDvEdei1wnzSz09E6T4vmbX922gbrByDq4b5TYgA=;
 b=FjIyLB2wI9GL+oJcWaIEmapMh3jEx1JbUB4Us9+bKrykWIZxXUrrEFcSchT6c0Ck0OgfcFQ0irsxIsUkitYPICjd0hZirn7Er4F7xkj9+UBtfkNhEMsPBoNh6+Si2j9/7XKNqDIUWx0fiklrYjuQs/HttzZCNufoRR9xyLLcJ2xBPGVnBvd9tsf6VD2Kg9wtThrCH6n1ughtqxaadsBwPMeETZThUTW7LKUD5V/Os8Y4WXBUgSM5+fVVd2eiWsP0jMJxzgvXiYhCdUctODhyROYWgkpCWdNtEO/Q7XsMfin0s6Z9Zm4+nOF5zCfV834fn8Jbb/cYiftJRytav/bnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQTFDvEdei1wnzSz09E6T4vmbX922gbrByDq4b5TYgA=;
 b=Aa3zs7437zwBsOtQx5U80WQla7jGfz71ug3T0V2INf/avd0L1Bh5VszY5TlsI/h++b8sApXRhX4aTKTxRKs1J2t1eS4zE7ldkgEHEhkWlGGRhPhy1Rx7PTFNqAzVoiqXezF1fLqu30Reu+2z67TubWUQf7wcQECJxfH6gesxg65CBrnncTGpzX8bwZcCH3zmFuCDhsVYsHe7DyubuWHXVRUY6WVg48wZwn0/EmeqdveLY8QJ3BYXaXr42HE652NmPRyk0II8aCbvKjgr5Xd9roOMC1wczUmKqKAyU6t5Ud6Tc4fbseP0SWkC1G+0YXMu1ML1aseQppwXTmZsRW2rXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:51:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:51:54 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 24 Oct 2025 10:51:28 +0800
Subject: [PATCH v4 1/4] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-imx_rproc_c4-v4-1-af83ed3fdbba@nxp.com>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761274300; l=4888;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XdnmGmvE8X+mMbNryrB2jfnyL0kWI6PD/SVoLiexQ/8=;
 b=JJqYw0c/yozz632wOFItcI2sX0P8CWp9GAhVNfsQqq6VfMLIGcTQrSoqGwJwt8+xi+nRejycw
 JKUs4vaBqpDDgKBcMhfazDmXLk/r8LdZzMfrVQZbKoWg6oxDjWTPixv
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: f81b5505-87f1-45dd-7bf2-08de12a84a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtlS0dMd08xTFd1ZDdENDR0ZGdPTSthMTlPNnRBaTMrbDFUZFpubXpIRUtK?=
 =?utf-8?B?U245M2JTcWhkYTRLaDJ5OGJWV3l4MTBhMTZzK3NPN2Z4N2ZBNHlHejVOL1Bs?=
 =?utf-8?B?Nk5NbUE5aDkvei9MMFhxb1d2Q0lhV283WUpTc2JaaXlIT1pCSHQ5Wm5CTWh2?=
 =?utf-8?B?elQ3S2xmcHR0YVBHVkpCYUJTa1phOWZrazJXVWNmRlhtWlFSaFZ6dUduM0FF?=
 =?utf-8?B?SDE3WU1TZW5nUEZGUlpqc0IzWExHNHY1SWNtQkh1OUJIV0ROVzNaaDJNMUxE?=
 =?utf-8?B?ZFJQcFZneGY5ODdOMC9yamJaS3VCYWNBT2ZvUjhlemovS0NvTnRDVW92TmFk?=
 =?utf-8?B?Y1p4OUJldXR2ZklvQWo2TGo3MVArYWhsNU14c3RqYlpaVnVWYzhYUmhGV3B4?=
 =?utf-8?B?R1lCcUlUdTA1d2s4VkFTc1lNRDlyOXZUclF2am9LRU1pRjhPVzM5Qm5CdURC?=
 =?utf-8?B?TEtaMCsraUdRRmZEUmMrQ056U3hwNG1JYUoxMlhuOHNWMFRDeSs5d1k1VEVp?=
 =?utf-8?B?MGR4dmtjWjZaR2VKVGZDN2tzU3AvcG5KenNkZkFQeFdyTmhQcFBuVzEvYkRt?=
 =?utf-8?B?YXA5bnJMWWIvOUZkdHB4VGxQcTRZTHVYR2I2NGo5aTBydExTUFF3Vnc5NUJi?=
 =?utf-8?B?emh5cFVoZ1dKTVR2ZWp4ZnZSSDdUaDVmbmRkVmJIUTFlbGpJeUpIQWVnMjNC?=
 =?utf-8?B?cFcyZmlSWXNsTk84SGtMM1lHN3FWeDVWY0t1dFVvS3FRZFlsd3BMeDRKUzJZ?=
 =?utf-8?B?K05TTllraW9YWlJacjZUdGsrUlRTUm43dks0WW1DRkhKeXBZRlFmdWorTHMz?=
 =?utf-8?B?OGJUMEdEeThMbWZiR3ZwaHRqRS9SZnNzL25SSTlnV1hDY1k1Y3JCbWpjQWVT?=
 =?utf-8?B?MnlkYkpJa3RsWnhRZG9ZeVg5Q1FmQzIzRWp5anprbmRGQlNnOVp2K2VhOGFh?=
 =?utf-8?B?ajByOTEzRTZyM1BWbzVUVEY3QmZsbkFUbUhkb1p1LytweVc1VXBlb0U0UlVh?=
 =?utf-8?B?NUlKLzNJSHVPY3B0dUVRMDd4OURvdnJhVEw2RmZlb3VVOWF6cjdFSTJwUDJz?=
 =?utf-8?B?cDl2dzJ6NFl6anZodnFsY2tVMVcxVXB1L0V4VG9zVXRDZTVBMERFMTNTdUFv?=
 =?utf-8?B?MlJlNWY5djNZVWhPTmh3elZ2cmZEVm1DOE51TkV0Q216Yk9xRWhubkYxWDlO?=
 =?utf-8?B?dVNTY01sc2orS3R5ZGpmSitLTFNVam5RVE9uWDAxcDZQOE8yWkRlSXM1REIr?=
 =?utf-8?B?VEJxWjZiQ3pBR0MrQUdxZXgrMUJKVFV0WitiaEQ1WG5CWmVNU2F4ZFczUXVF?=
 =?utf-8?B?Ni9saERaZFRaU2tQRWNDY0IxMjRzVFdHTzBOZ2FHY2RiaTlMZk1OdmZKSWdv?=
 =?utf-8?B?VFNvZjgrcHBrWTJ1QThrUUYwREt6djZtSURnb1h1NStoOFNsS2ZrcHpaTlhj?=
 =?utf-8?B?YWhnT3YyUkJRWUhIUTNQOGNuck1VWmZzMXpmaTBhNmRCV0MxUDZteVNIQXFm?=
 =?utf-8?B?ZXh6Wkl2elBXQzhhZ09oUWZCTEJpYkxFRHZLN0d2MHFqT0pFMFppcDZrS3NM?=
 =?utf-8?B?REhGendqbFhraW8zVVlIZWdqbGJSSnJza3dvV3BiMVpzLzRUTGx1SHpvVStw?=
 =?utf-8?B?SXJJL3Q3SS85ZDNtem5kNG54OS9zRUhRS0xGZ1diV2t2L0ZjMmR6UXNlbnk5?=
 =?utf-8?B?bUt5WDRuVGN2NHg3ajc0dDJwUkgxNll6cFNGejlqUWV4WlMzdTFBZGx3LzlW?=
 =?utf-8?B?SXp0RGVOd05ZMEFkVGora2xlZHRRWnZtS3JNZERrMmEya0oyODRkRUhtbisr?=
 =?utf-8?B?K3pXeHVvUEk0NmRtdENKRlNrNmYxOEtWRUpPM01ySzM5OXNjRVV2TGQrZk5X?=
 =?utf-8?B?TUIxaHpxWndDS3k1Z3V2RDlsb0Uxbit0R3FibzlNaEsrL0hNOEwyTHRycHly?=
 =?utf-8?B?SFg1RkVwZ3YxbDFSZGNKUHNna2Z5TWJYbTVuNkVxbTVVYTBZV1dRMS9pUU9r?=
 =?utf-8?B?V3pVeHp3L2FtclZMdm9QR3J3cHgyTi9LZ2JXcGRXZzlZS3hUb3dDaHNITStZ?=
 =?utf-8?Q?4vWFSi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFONG82NW9vMGU4aWttY3c3QTVpVTMrTE5xMVAxK0d2ZEdoQXIwTEw1Ylpo?=
 =?utf-8?B?MEUvNGZLSHp6blVRYkV3SEd0VkVFZEZONEtzeUVKOTJiY1MwNmE0cmk0V1U2?=
 =?utf-8?B?MVduRlQvZ1QyeXY3RUZYTmQ5c29PeEhybEE5QThmbzFSM3JRdThTazJYWnFP?=
 =?utf-8?B?T2cxNVcrTHhCcXBNL25xb04xTzdSTmUwZHoySnJHcnB6SWJ4WEEzd1g5OFJQ?=
 =?utf-8?B?UHVKdUd0R1JNVnoyS2tGemRKeUpKVk9YNlI5VUdINWQ0QmhlSkZuODlTNjNJ?=
 =?utf-8?B?V0FDY1ExRllQakk4QVN2ZlhwbFduaUIrUmJMSzQ3My91UzJVdjBPTktuY2I0?=
 =?utf-8?B?NU5rTC9GK1hBV0hydzNsWDNkaUZaZ1lJTHZ2V3RjV2ZqTmhNblRwc3hoczB0?=
 =?utf-8?B?ZUR2SWh3NTNWek5EM1VnWDg0R3Q1MHh3dVNlbEFZZXgrekp4QkVzb2luRFFz?=
 =?utf-8?B?cVJ5eDA1RnRidlFzLy9ZRS9IcUhINUZTaG9rMHBNUHVOUEdhdWU3WGpicUVl?=
 =?utf-8?B?aGZtVFZvNEkrZTBjM1hycjZ3WFhlandGeDcwT1hUQmp0TmU5VjVZMTE5bFB6?=
 =?utf-8?B?QjBDdjhGSTUrU2dDbURWNnJERFQyTFJyWGVBanE4b2F0WVZIK2NpWFFQeHF0?=
 =?utf-8?B?bi9ncnhyRHF2QnM4NEtKb0dpZENpanBPeS9pVENJaEU5NE9aMkRtNEpyVmZW?=
 =?utf-8?B?U3JUZjJ6T0NDbFBtYWFQYVFtc3FBQk1CbmhNdmxKNHFnWFZEenk2cE5uNWlE?=
 =?utf-8?B?cGljSEprcVRPY0s5WS8vOWtGVVFvTjNTTm8wR0tZalVVL3Y1N2U3S0w1Zi8x?=
 =?utf-8?B?YVNoNExRbXlpWDRXU0Z5MWU0VHpBbzVmT1dQekRncDJQMTU4U3E1TFRTaU9J?=
 =?utf-8?B?RlRBc3dDUi9oVE03RzJFN2FqWWVveDhhUk1ERSsrWDZHay9Jb2tieng2WUJX?=
 =?utf-8?B?SDIwdnNBZDEwaFA3MVJ6eWcvMXV3c1ZwbXRKbEdVUG5vZGpNOWNZdDh4ZUUr?=
 =?utf-8?B?Tm0xTUxVRDU3a0pQbWpUVFVqUHRtajRUR3R0OHk2SDR6NktobE5CUGFkblds?=
 =?utf-8?B?U1FoTHVTQ1UweWVrVjBTQ1ZkVllBd2ZzKzhKQjNpb3FTdlg1T2wwdERDVm5O?=
 =?utf-8?B?QjRXSnNnL3FyRWRleENWZ1ZBMVROZlBBRjdXdDBkZE1MRGFyNzdHa0xQcFFK?=
 =?utf-8?B?VnZXbDRPZHJOVkNHQU9pSnBYaU9vSjI5Qlc3aGlpWnBEb1JsdVlmVkhQd0xR?=
 =?utf-8?B?WHkrbm1pYVR4OFl5bDJsTm1ZTWc0Q2llenlsbDV0VGJCU2FndzdRRUUyNzdp?=
 =?utf-8?B?S2UweUFPQTZwNlA1akd6aTk0ODdXS2t6dGtVZ1BwSkJiM09RVW54djFDanZQ?=
 =?utf-8?B?RHFuZ0F5SGpJSDE4RlpZa2UwaE5lamRSQ21FYkNWNnRaMFJGWWpTdThtL2Z4?=
 =?utf-8?B?cU01VGNLVEVGUHZPMmZlcjhXR3RKaGVIQThEUmVrM1RicGpSZmRRTVFaZXFC?=
 =?utf-8?B?Ui9CTGJhRHpjY1lVYWQrY2svOFFnZlgyM2gxYmpTcGlwbzNZQ3hXQVZCdkZB?=
 =?utf-8?B?SjM2Q3RacmZmZVM0cXl3ZkJqVnh1dFNQcFVNcTJhdWJ0VjJTNzNTRGFDczdH?=
 =?utf-8?B?UUFheW85S0REdjFXSWFIaG43RHJOZ21jd1dRVnNkeHVQYjVtUHpld3ZpZ2lD?=
 =?utf-8?B?STI2dmRibkw2dXBEQ2NncmlRcmM1blBUVldVUS9TWitLazY2V0tqM3l1djNk?=
 =?utf-8?B?YjEySytPZ2VuLzd3MGw1bHNYL0k4VUl2cStiVGl2UkxRMlhVc1NmWmhpZTlI?=
 =?utf-8?B?emJuNFI3OUFiTHBsSDExeUpadTZMbTVtVUJzdTR4T1lCOUxhOEx6UTltTU95?=
 =?utf-8?B?SnZXeHBiTEtySk9ibXBJcFdmMlg4eFdlS2JTclExOUloNUVMWTJWZjM1b1Jv?=
 =?utf-8?B?VW40Y2NoMHgvVllKVDV1L29oT3c5b0xPZVNGdGFWZWlqY3ZDWHBadGIrZlhr?=
 =?utf-8?B?bkw0SEdHYmZ3dko0TFdzZnFUVlhtWmRybkNZUU1aOCtZTUpzcHcvVUgvWkJR?=
 =?utf-8?B?WmJReUc0eUtsNzBmNmtzdVgrd0xRRlozMGZWc0ZCNStRYW9EcjdNTWp1Qkdr?=
 =?utf-8?Q?/FShIU4Q896cjv74qGprlJEel?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81b5505-87f1-45dd-7bf2-08de12a84a01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:51:54.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QhytkupMpGq2YIljXQ0IONe9j2S9XfrdGISPP1SCqn7a7PVRW+bEFFRUz/lrzRRwv4zPJLKJ2l6NY5r4bPAaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195156_964510_4E016DDB 
X-CRM114-Status: GOOD (  19.00  )
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

Simplify the clock enable logic by removing the dedicated
imx_rproc_clk_enable() function and integrate the clock handling directly
into the probe function to simplify the code.

Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
management is required for a given SoC. Update probe logic to conditionally
enable clocks based on the new flag.

Set the flag for applicable SoCs (e.g., i.MX7D, i.MX8MQ, i.MX93, etc.).

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 40 +++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 68e01b647b66910627fb2256c96c152f3c22c83b..2a71863c09e917719301e02c3cd535a2852abbea 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1002,28 +1002,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return dcfg->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_clk_enable(struct imx_rproc *priv)
-{
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct device *dev = priv->dev;
-
-	/* Remote core is not under control of Linux or it is managed by SCU API */
-	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
-		return 0;
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
-	return 0;
-}
-
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 {
 	struct rproc *rproc = data->cb_data;
@@ -1101,9 +1079,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
-	ret = imx_rproc_clk_enable(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clks\n");
+	/*
+	 * Handle clocks when remote core is under control of Linux AND the
+	 * clocks are not managed by system firmware.
+	 */
+	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
+		priv->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(priv->clk))
+			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
+	}
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1192,6 +1176,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1199,6 +1184,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1210,6 +1196,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1248,6 +1235,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1259,6 +1247,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
@@ -1266,6 +1255,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 3a9adaaf048b396102feeb45488cd2ff125a807a..a9cba623560c85ea37e47401c392c06dada500aa 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -30,6 +30,7 @@ enum imx_rproc_method {
 
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+#define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);

-- 
2.37.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56771C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 02:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsoqUbynDVvQAee8WJcoXUsDf4z58pCdBVi0Jwa3m4c=; b=VfqwOTLW49CjPfkeLp8g9iV/tR
	X3Q0hRKC/HpQlYKGiFOMNDkLuDRW7cEWN3dShHIYnlAJ6EVJykoRGN7OFsWhNWuK2x9dEllC6gAf2
	FJWSRmoADSYlCIh0ckMt7WUjpAYNOyMm+buYMArDxay2odxuL7qGm1x1QOfJLHtP+aPVObETlQFqE
	EkRwRgq4IywPnglZ6900ED6ldLonLu3iCh+c3E5c78vWyi9yXF+jbegTFHncy2SsBxep8Uew4EUS4
	d/9IMBWWbrhCyB1WUzf11JHWHUXoSJwYtR4LqmVOsxBafjAnTuMKqHVsnp6fq0qljjSb3g+jiAMtU
	1D+Ll+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Iir-000000051uh-1Wac;
	Tue, 15 Sep 2026 02:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Iig-000000051mL-0zh1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 02:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wsoqUbynDVvQAee8WJcoXUsDf4z58pCdBVi0Jwa3m4c=; b=bL1NJGs9TiOUqfwONKIeeTrS/I
	5vyQJ9gahdSgOD/4ZnDP+m677Rttdu8hgri/fx0SlBVC1bzZhCCAPbD0krYyp7BoeSre3bkEd7I5k
	PaJQMb4px0AxUgZNdoXh4zPxYkTQ60okS2R9UpE6YOwpBBjfZYEncEbtjNAG8tVjRCkLZnTsEYR7x
	3I03Lqv6HY1JSJwxhkDCtcUiVjZa1PxWYE8Jhvxoisxra6gJb3Cvd0UJTlJuLNT7+Asgq3calsMAm
	6S+uL0FyrqV2dfQhhxu+Dtv5tiFtumPry7jrBtISyH+8pjQdfK9gjTPEZubL+xhCf/jLh8XAKsbZ8
	hyTMedHQ==;
Received: from mail-eastus2azon11011066.outbound.protection.outlook.com ([52.101.57.66] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Iib-00000006BnQ-43Ep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 02:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnVN/QQfoLyPhu+XWTkkyatgmSRRBSbcy+2f+akSl4jGXkDGUkcOUL4RCxGP2sK8vFNvaOOGrGDCNk+OD3qvO1erMhPKyTYzXrcp87HeDzmiG8WqWxUTf8wKeFCx1palgOwaNrGrJHA9f9OpPgAvRsJwuIp+Y3aYaDMA7yCtG5jDsVBoevjlhJMvte6+e9FE2bnaYIr2cVC3OOn3oX9G9UiJWyk11zU496Q903h63mg/EGAn798X3pdKq4AZJoA/hED8syUmCM7Cuo/dltnBTmaUjosw/lvYILxocvhOVBhv306I6HgKDd8rs4mvPrNIoqmfVM87BBpmoMt0hikmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsoqUbynDVvQAee8WJcoXUsDf4z58pCdBVi0Jwa3m4c=;
 b=oclfhrVUVo4t8Fh2R15SAnbyE/qms2slJ7RSXtxZY7PT4YjmT2uQeyYf1uJyfuAXjr80miuRaSSmSv4GDC1f7OKkw9kH8b/weB1jr7PQQSVxo2Xdo1ucwalDQrxEi4KcoTfmlokZg3LY69QwigkpqxsmBVXdrzamtKZtbcW/QpbjodEo1B3W0F0IXwaeqbnJgg/PYfGXvv8id/k8HYz8dyElqp/m5Pkz+dfdKfuX37RPuKFzBAzrUUKRjUEBbYe5teLRW8DDDDoVQ490nn1pZBLJ59yKTVNio9LSd5k5fJkhqgHJ2OCUU9OnItGu7tzPPHxgVknOI5+76agFm3sUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsoqUbynDVvQAee8WJcoXUsDf4z58pCdBVi0Jwa3m4c=;
 b=px9etFyNiEPtHwiSOC6Um1lnh53ueo4D4LC53c6MJI6DxYe8dLd6sIiJK1yK+nlvZXqdAMFqw3B/U23yLCctTohxM6aG+7jBJHhupGVRfgmMpxBiefpP1xqB98hLpA/P5ap0HNpg05UC4ewyBXC86OjBSAykHD/5kcIqUidz3ZTlbLja+IiTQPy9Fn+ISiU80LrGQvSVpY72/j2svYIWz70YSbWFM/lW+wC0sqrmL/yo5Z8CjxF/MuXkMN+How+Ivolxr2wuuoxWds3DJ0nnhRW63wnDdFGzccbPF0SYSY/r1jAWnzjR8eUKZVdcFU6FnzDYVEtd4oT1wEVqU+aauA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:16:15 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:16:15 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 15 Sep 2026 11:15:04 +0900
Subject: [PATCH 09/11] gpu: host1x: Drop release of legacy 32-bit ARM DMA
 domain
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-arm32-iommu-dma-cookie-v1-9-ba4f9d33a2b8@nvidia.com>
References: <20260915-b4-arm32-iommu-dma-cookie-v1-0-ba4f9d33a2b8@nvidia.com>
In-Reply-To: <20260915-b4-arm32-iommu-dma-cookie-v1-0-ba4f9d33a2b8@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Krishna Reddy <vdumpa@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: PS2PR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:300:5b::31) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e3ce7c-10b1-424d-cc48-08df12cf51f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|7416014|376014|10067099003|22082099003|18002099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info: 09qfdM1IztSbHs+XcJwW5q3EUD0UfkarWJYujGi92CYDemoxZBEI1RHmnhl/JU3yoO9LBG5t/lAd8BAmeAlEkbZNW2o8FYvfIeJ8oEC7bXbUl9FywQQ5fHhTArFwJq5YaPhRW7pZAERXJ0LekwbHpP0J5V8+PtIZHSK9L/5aB/vYDzoqXMKwLYoxjpfUa//o2FBz8GRuCp72eJRdfb4tKk+XGcfsdfFJvt8iOv/DtuuXtnFHz89aP0kEDAmWZRcJIss1MFb8sx8FOvSu3p1BjKHyPSvis5WOWIpMfwMHbOn84U/vj52QicFeKyKj4Cs1aGJVOMqYpL3zcfn9U88dcm6NJW7c3AH2HIqIzxi7r9MkiIpAFU6BNs3PGCGuE+mQGOy3+8e0eUNBZGZp8U9qKt9FPD85xs1zraJuMdVHYl0d8eL6fNUTzRI4V+zLv2qTu2AykSS7ZPAE1TosLWqkSXG88E3h08GoUVhIh5m3RVKK8kKFDnIjRAd1Ia+Rl/74Mo0kicnX0KLTTzMJztXiF4zWrRxkNuqgQjuWlIWyyoGx7c9WhA0dFFT6X2yPjR9YlQyHdMdUZu2e57a38I4xUAEfU6KAX1OfS5EqRarPJYpaL8G9Y3k1FstxwQaRCuD9mxV0WCDPflwiy1l3xwDxg8TiQ8wwp3nNSTtcNB+T6mVpI4Kl3rlTR7Dt7rkZOkl9gSVyMbeyq7c5tvuQGI71uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRJTHEvME5raHhlVFZqSlpwZTYyNndlWlZrb3JyYkdVVzdYU1JoN3E3azQ2?=
 =?utf-8?B?bWVSRlNZcVRBL3lYOGgrdWlOUEpiZ3p1alpWVmpIRm9GRDg0a0g3dDZSYzV4?=
 =?utf-8?B?T1cxd1JMTDlOY3BoN1NheXFpbkRUMmprV0tKM0pCU0tyYXFLMVpYMFp1RHhq?=
 =?utf-8?B?a3BJOExtampTYVMzOEpaQXFZa1VHUlZFVHVidnhrOUNBV1lHSEZZMG9DQU9D?=
 =?utf-8?B?azc3M29OcEtHd0hMN1VKUHBGeDI4dFl5bHBwTy8wanU2NmRoNUp3L1pKVjV0?=
 =?utf-8?B?Z29hb3BwTlhGMlhJUC80aGcrNm9ISEhMcjlBQXNkZmE4MXErWjhiOGRtbXR3?=
 =?utf-8?B?SmN3bGN4d3Z6WHcvdHFXSDAyYVVmMmRjTHJiajFYdTNvTzAxZ1JiMUdacFlY?=
 =?utf-8?B?WU93aENyd21nZnBMbkY2MHYvbDlCSUlaOGZyMUFiL2VRdjYwVUE0K0QxQ2Fa?=
 =?utf-8?B?WFFVRmVpVG1Dak1OTCtmL0MwUG9mNEZFNHJKR0o3YmRNblpXYTQvaVIvbEtz?=
 =?utf-8?B?MEdHcEFZd3BFSHdQRjlhZ3lPT1krdlFNeUZLbG5hbFlpSDZlOFp4UHdWUmJV?=
 =?utf-8?B?RHZYTWRsdmxjQ3lxNTRINFBtT0R3WHZqWElzQnRLc05sckFKa2NBUkNselhH?=
 =?utf-8?B?SjVGRnc0VGIzOEFnR0hJLzZIcnVwbUJ2bVhaN3d1L1lOU0o4MTFNK2o4cG15?=
 =?utf-8?B?dXNmVEc1RXJ2RzNaa011K3NTWW9SK0RpR1NPM1ZSRnJOcEVQVU1kYnlJTExn?=
 =?utf-8?B?TFEyRmlLVnBoNit5bElaWkJLa2praGdsWFFncWJCU3NIaWVLTXo2WU53NjNH?=
 =?utf-8?B?RTZwbmRBZ1YvT3FyQUlzZXV2OHJDS1dwcUtndFA3SEJ2OS9uTU1pbWpQc1FL?=
 =?utf-8?B?S2lDUmhNWWR4aEJSUmIwRjhQQUVnbU5HZXdTWGFoVVNidHBVU2FWcmUrenVR?=
 =?utf-8?B?QldFMUpENk5ZdklIMlREYTd4dlRqSEg5aTM0MlkyTVJRNG9IZ1ZTWTV0VjFS?=
 =?utf-8?B?dUpCNmFLeVlTMkVTRVk4LzAyajRhdGdCSHZxdnhSU2dFd2Z4TkU2WmdlV3Rt?=
 =?utf-8?B?dUN4ZWk5SlluekIzOXYvckw3ZnVzRHlPUFltS2hBUzlpNGNEYUNGZGNKSmFp?=
 =?utf-8?B?cmJ0M3JtZjYyRkRpNFNUS0lZRHRFdStsRWJtd0phMGhsWE83REFtUE9qUElS?=
 =?utf-8?B?dDZKYTVES3dJNnlzSHllbWFGRnFmWWh2UUMrWkp3dWJ1bndXREkxUkQxWjNH?=
 =?utf-8?B?TWdtcDZkRWluVmJwUHJlVE1mRUkxOW5GRHV6WVpuQTVVNitmZ1o4ajh4MnpC?=
 =?utf-8?B?WVhwOElzSTdkeVR4dXFrYzBGV0lQcW9FUTdxOEM1WExFa2xHRzVEcEZlUEQy?=
 =?utf-8?B?VmZacEdha29KUnRidUl3MkNmelVLcXYzMm1pTlVUWjBZa2RnL2NhdUVTbm1N?=
 =?utf-8?B?ZCtZM1JRY3o1NmlDYllkaVlSMDRWSkhoNEw5TFd0c1phZ0NVKzVnZ0VyTUtL?=
 =?utf-8?B?SCtOU1dNenhROGxyZVNPNHJ2bnQxV0lDNHhVYTFmYTV3QlF6Vkd0OWFreVR0?=
 =?utf-8?B?Y3pKeVkrOU4raWJVdnpLNDcwQjRjUkIvYW5DQVNnaFBjaXhqMFErSDVxNHBj?=
 =?utf-8?B?bml0UWozeUU0QlBadGlla0U0R2gvbVdyZ0QrZEV4WHdPTjY4TkZGNG5UTDlZ?=
 =?utf-8?B?dGJkSUZPMzUyckcvaks2a1Fvd2RqR1A4Y0cwaGxnQmMvN1dPNjNMRlFOcW43?=
 =?utf-8?B?MnB2MjZkWnp6T0dRelhndjFieDVVTTRBYWp4UDFxZkNOWWNRQ0pxNlphYTBR?=
 =?utf-8?B?VE9DZGp4UkNnNDhUVUZvdzlxT0VoSDVIbEpjMDZtbktPRDRsak8zaVJibDZ4?=
 =?utf-8?B?clBCbmhaNUdKMFBNaUltSERZN05UMUFXOVhQS0JhZ1k2RHBLajN6OEZTcG1n?=
 =?utf-8?B?UWpRWEs0NHgrOEhxT3g0SGhRQ1VhdkJ1Q1FZWGVnMkFvQnh1bVQxZGJoeUZ1?=
 =?utf-8?B?bFNDOTBrc2h5eENGTForMFNiUXRldHIvNjlMT0FzNzhWQmFnWEN0TCs4S3Qz?=
 =?utf-8?B?UDNFSjFxQVhCTjlrcEdtbWlNTm9Obzh3SXZ4b0RFTUNiWnRqQTVXTGR2ZEtt?=
 =?utf-8?B?ODJBK3gvd25ZeE9ET2hodlFUdkZuekR6a1RPR0poNTh3WElvN1QzWG45Zml0?=
 =?utf-8?B?eEllWjBibWpRSXBSaEZTS1AxNjJqOVBZTnJuWGd5bkJkRVdkbFFEa0dZNWd6?=
 =?utf-8?B?R1V4VDFCQ0hUTGI4LzZDZGQyNHBsdGd2cjFRN21kQlNZUzJzNlVjN0hHTTV2?=
 =?utf-8?B?OGI0V0JQZGhKY2ZPdmtGc29CTmQ0QTc1b21QNnl4NUJTL0ZDQ1pVVmErV0ZV?=
 =?utf-8?Q?wRQu7PEj4hkziyD/5/HVJUThZ4eRqzHKTY7hOWVbwTpjd?=
X-MS-Exchange-AntiSpam-MessageData-1: ubdjoTqqFwVdpQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e3ce7c-10b1-424d-cc48-08df12cf51f0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:16:15.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dw6YVqujD2FEAlRujb0PvcDNsj2e6q56bc6O4/3F3iI09UIhmclAF8i/V1iW6aV7anRsJ0vAMApPb6kYorLEaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_031622_388712_0948CBFF 
X-CRM114-Status: GOOD (  13.81  )
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

host1x_iommu_attach currently detaches a possible ARM DMA mapping on the
device, since it would get in the way of the shared domain host1x wants.

We are about to enable default domain based DMA domains for Host1x and
TegraDRM devices. These will take the same path as on 64-bit ARM, but
we need to avoid trying to detach the now perfectly functional mapping
on the device, so get rid of that code.

Strictly speaking, the code removed here would not be harmful but would
cause WARNs to happen.

nouveau and tegra-vde have the same construct, but their clients stay on
identity domains for now, so those copies are left alone.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3f475f0e6545..27ca523a6ada 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -23,10 +23,6 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#endif
-
 #include "bus.h"
 #include "channel.h"
 #include "context.h"
@@ -379,17 +375,6 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
-#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
-	if (host->dev->archdata.mapping) {
-		struct dma_iommu_mapping *mapping =
-				to_dma_iommu_mapping(host->dev);
-		arm_iommu_detach_device(host->dev);
-		arm_iommu_release_mapping(mapping);
-
-		domain = iommu_get_domain_for_dev(host->dev);
-	}
-#endif
-
 	/*
 	 * We may not always want to enable IOMMU support (for example if the
 	 * host1x firewall is already enabled and we don't support addressing

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE79C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=; b=pAn1xDKFZ+aZqAAUT2vj1IwoFM
	M295E9rOQJsJ4nCVzAlyaYT+svU4dnwoJXHY70LmfwlFzYSeJbAP0BqpBK0NstoRGljgdOj6ozxCs
	u+npM/+/L2fgJ4wGf7+7s2VMQ1iLZDYOE0Sq1PVq6QRTNCUidWGxbuLfGnT5stiL0Cwwac5rlNj4T
	uyrUJAlWqd6BqDv0xsDFhjAU3nxWIlGxIPapPtBrQR4AgOmHWAW6vztJXSrYkYJNItWXmPt71ayRV
	a+knmnVtqPFyCN9/PAdJRGgIEaD1z3L6Yd9ccKdzCGKVk8jHvTo+k/c6kTH4g4x/cGaXgLlskQdWl
	HlcBmLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IXU-00000008fTK-1mJ8;
	Thu, 03 Apr 2025 11:15:16 +0000
Received: from mail-db5eur02on20602.outbound.protection.outlook.com ([2a01:111:f403:2608::602] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Htl-00000008aDw-0NvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAw2aynFRKr1+uXPSKk14gKeEsRZgwvkODKBuMN7fhlkSpFmPgblmskyNFeQov1GEQYXACFBWrNVRa1Y+tBl0i/UMSuW2HebDAaxjkxLbVR5z6h4rb8i1nS3BXXclgci0XsU/TMV+Nzv2E5R9HyafoWchK24qpeU9Yp+wRzdkxNFQkaRXuiCNLF16h/NZRnsUXlme74+AhPxa2oL21taKggbby8XHeDPf49TIYmvBi6yhWrGpQMYqJLJDeYZP73twJ6HyWiYrpN9o8XNwUzBJH3yRfxIur8ooJ8Yd+0q/8ZJagZpsCJ3sImQD+PAnLRDnZf/2b0nq0Gmf3qc1b/qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=yOMIJu1ZSQIHiAlS2w6iO5azCgD859iKtFlIvy3M3vPzMgROGomhZE7y9yRWmwQohqCthBDuUYs2x3JwLQxOER8Y5Y7tNauhiM9FgAibDSz5/gJoJi1dDJARCB+5wbbDKfrRJO9ZZGw4A7xSkYbfbVMyBSenUlfhTL9gngWZ1YN/VVgV1DCBnlMkMuBvAD/jZprhoZcg6OBYUx66h12+FthjsVFn4us7OeHvsdQjAyksPUexh6u9ktiYUo46nRgkFSuq4Osqev1H+9QFO06/rz3SXRwFoeUJ3kyVjI4A/yGX4y8Bf+zVC4nvxKAE3YRTQhUBTnikDX/rLXBOHN9Kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=Rxpv/0P4n0WU32tQg75ZPt0Cb2B/7SfSfx0aZEWctAaQNq/lN8G7YMe0ZLtC4aeeG4DR3acWyZh9Wjv5o7l7N87J+DpOCXSY2cTbc0IfoM11TB/YjtsNobkknlaO058G+qc+/bxLg/sgckvqcjE84m9SNQTdvHA4iU2UegZFStzUNhQow1aGATBeVGarB2iGXrPs967UR5Scz47MjSzCKCKheTLd4Eqa1b1456VFImtP7wBE0iPZ46aYGJy29G6AOZBvYa6ZqezsLAqy2mA5cpzgEkrZdWnF1HqFOS1FviBQMRZYV8Smtqr92lFFKWeV9eqw8SdGVqrQ6wiMsGFQbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:59 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v9 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Thu,  3 Apr 2025 13:33:46 +0300
Message-ID: <20250403103346.3064895-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::32) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: cacf2890-ed3b-4bc0-7542-08dd729b0b96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUN2MGJ3WnNWdStXTHZDdk1qWWNaUXN4QzhYVVdnTDdLaGE0OWkyTE8zSGxI?=
 =?utf-8?B?QXJHeXpjYThOdFVPSytVeSt6djJKWm1aYnZ4bVp1VExIYTdFcFhxVHpvNHl2?=
 =?utf-8?B?WFhVZWNzSXpKeUs5Ym5HOXVza25qV01DUnFjTk1sejY3WkZwY2dFck9Eakgr?=
 =?utf-8?B?eTliVUdJcDdaWGt6S1B2SVBzQUtJMDFNKzh2c2NKRkdkT0RFcEhyVllTSExP?=
 =?utf-8?B?Q0NKNmNtLzU4K2VtQ2J5SE1jeG1sRFpTT09KQnlFS3ZJbDdJRUN6T00vNk9z?=
 =?utf-8?B?M3hMcm5xMHV6eFN0ckhQUWs5c0R5U3RpL2JiTU5JZXFMMkZ2MThKaWhyazFw?=
 =?utf-8?B?a2N5QUtMTHMvai90YXZUWUpaYjJPVXovdHFoQ2ZVZ1Rqa0JwM1NjOXBlalRT?=
 =?utf-8?B?cGJoNmtCSDNZeWJhNVBEdGtYSjIrKzhoaXkwUnZGRUF0U2dVaW9yRWpkWWEv?=
 =?utf-8?B?NUJmN29PdTNVcE1WL29aY1ErbDJzWlZqS29zbE1pbVBnS2NiVGZSN05QS1VN?=
 =?utf-8?B?RURrTENiRTJsMEEwZ3FZaktDZk02T0tUOFMwVElZVkwrR1ZKNHlOY0lKY2Y2?=
 =?utf-8?B?dFlDVjN5VEJnU0VZZ3ZMRVQyR1lBM1lFWnl2bWNNY294K0tkclBXTEVHMHJW?=
 =?utf-8?B?SnNJaXlFWnNnUlNMUWpUc2xPR05OVm1vZHEwYlkvU2trSkJCVllDQ3JCaEs5?=
 =?utf-8?B?Y2x5ZGtjaU81M2FRMVRCZGhWQ3lTQThvdW81Vm1qeExvZ3BGa0IzOHNxY00v?=
 =?utf-8?B?aVA1MmlVSHYyNE94N1VySHl6SERaZDhzK0k1WlN2dFpUd2dmc1Y0dlROYmg0?=
 =?utf-8?B?a1hJam1mb2RUTGhlRFZKMW5TMXpsVTRVejNPcFpmTkdhSlRQZFM0Y09FVDZu?=
 =?utf-8?B?WXltcEhiNlBzOFRaSmp5ZnV2c3pFMVpCN2lZczBiQkgzeitBR2NaWGdNNm45?=
 =?utf-8?B?eVN5YjkyZ1pjaE0yUHVHTlBTZEd3eWFMd2xoTXJIMXJRV1BqMVhaL3BNTHI3?=
 =?utf-8?B?NVVUblZRekh0eWFjaUg2bmdGa1MxZjFKVFZhZ0FVWWpxMDVFbkt1M1RSVkRG?=
 =?utf-8?B?dUcxVWtWRmNCbUdjVDBrLzNCRkNDWTNjN3BnSXc3cUl3ZGxwZDgzWEUrNWY1?=
 =?utf-8?B?VXJTaytYQTZ3RXJEZjhHZUlYc3ZPWEdUWDdPQk9HU2p3VjNZWit5VTB1RVdK?=
 =?utf-8?B?ZGN2NUtra1RtbzMxUE1HNy95elN4T3RtalRSVmFWUVB3Q3ZibWZ0QTNJRktW?=
 =?utf-8?B?bWRTZ3FXa3pFSmJMc09rWURsYlhoTHFUYnBiOFhEYVB1K0hXR09vTGhRdTEw?=
 =?utf-8?B?RnZjL3dOREhTM3BVZXE4SEVOK2lXQjlEY0xydk5MM05XZUFtQ0IwMUpVcitx?=
 =?utf-8?B?K2ZpdmMwWXRqYWlONnluOWFKNnowZGVuNlJTcHhkb0tzN3NvZHdsZWd5YVR2?=
 =?utf-8?B?RW4yQk0rWkR3VDkyTWlCN2pjY0JYSU1NZjdlU05sYkxMZ09qc1MydThMK1pV?=
 =?utf-8?B?bXJhNjAwOXEvbGd2SW1CcEI3MHZrR1IraWt6QzdWR1BsMXM0OFdabnpvOFpa?=
 =?utf-8?B?ZHFBaW1pbE5HZTltWEd0dFdwQ2hzT28wOExFSVhhNTdQNzkzSXdtRnZYZjA2?=
 =?utf-8?B?QmlROEtsRUE5bENQRjBEc2J1eVdEbnRKMjNXcVdpZXZ4bzB5U2hZTlJsWnhh?=
 =?utf-8?B?bHNuc1FtNHFQRytkU0JHb3FmZUs3Z1JKZkRuWHd4MXhhSzFFN2lNaEVGN0l6?=
 =?utf-8?B?T3M4Z3ZsY21pdExzeGNtSGRKMFRYTFdIRzJ2ckZ1UHpuQXM5L2tTQ0pXR3oy?=
 =?utf-8?B?NzdFTjdySWEvSy9YSENqaWhGZDZSbnI3YmIzdG1za3VBOTJ5eVFlY09kaDdu?=
 =?utf-8?B?WWs4VTlnek4vMEVTandoSFBEUTdUcDBmZnhuZGx0cnoyQ2g3YnBoYnZmNUp1?=
 =?utf-8?Q?t7QG82X/5dM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2N4Q2d5MVJlKzdpNXlyNkdZaDk3bk95WTNpeU9IYk1KNmJJQUZCdTVReklo?=
 =?utf-8?B?Ulp5MHk3L2pnQmU3RGFwWmV5MkxwZWxLOS9zcmhVSkxzQmhoRjRwOGs0ME9x?=
 =?utf-8?B?VXB6WEp4KzVFalpTY1huem5ibm5qYlY4QnpNaGVjbERxY044a2xscE1ESGdL?=
 =?utf-8?B?Q3BCRTgwM2pCNFk1ZUYzSHRwZ3dQMGNDZEpGUGpxRWxXTWF3V0x4R21vTjR0?=
 =?utf-8?B?NjdtNTRaa1kreGUwYng3aFlDWGQ1SVM1NGdKaURTV0dOYXBIZzVYNkpkTTBM?=
 =?utf-8?B?ZCsxcWIzY0pCTWVXQ1dSNG1NN2FHakRSb1dJVCt6U2pGZmhBenJaOTYvY0Zx?=
 =?utf-8?B?QWZvQ3pXOW1DejJWbWRodWZYSXZ0RlV1dzU3RmtkOGZ0Nm1jMm5rb3VZWXIy?=
 =?utf-8?B?SHlNbEZVZHhOZ0RhblMxRlFDeWhHRzZBWkd4cUtXdlBDeDJpSHM5aTZYdXVW?=
 =?utf-8?B?RWlrblZGSU1mdm9jZ2p4T0QyQmF2UDRPM0Nkb0kzd0pzcnkrQUFhNmd1clln?=
 =?utf-8?B?T0drdlExbllsVGZQVUhsWGFBa2VuTjlmY2lsZkcyVjYwVXRPc2FFU3QwVnNz?=
 =?utf-8?B?SS8vczdOdFhKV0w0b0IzcDAwaURCeHBWNEJhUW4xUGRweU10WkprUDhkblVp?=
 =?utf-8?B?aEptZ2gzMFN4Q09hcndEMGc5eG9VOFY2amJDb3RsbnVFWFBvY05tYUxMd3VZ?=
 =?utf-8?B?dCsxRVltV0t3Q1FnRExXRDVBUSswRnBhYzJPTWVsR3lwSERKdXhUY0haWGxu?=
 =?utf-8?B?SEJBNHYzWHFLK3crQ2RUd2NRU1dDYzZWLy8wcWdPWG50OTRLbSs2QnVReXA4?=
 =?utf-8?B?dGQ5TE10c3NmSnU4MzlRSCtwaW9VWUIxNkVFQ0hBZHo2bVpFcjZ0Z2gyNHgx?=
 =?utf-8?B?VVJNZUVZelNURHhaOHFqdnZzTmtVTElValViSWtsUEVhQUdQQlZ6YzduMFpr?=
 =?utf-8?B?QlNqVFBNdzRGSVBrRDFGdXZ0R2UzbXBZbmhFYmxNZ2d4K2Q5aXo1N1FiVSsy?=
 =?utf-8?B?Qmp4R2xiclpGdUd2V3gvakt1NHdIS0RaL0dvRHgxTWlaenZLWnc0eE9mRFc1?=
 =?utf-8?B?RHEzTGhBbmZDbm55Ukh4UVo2U1JJZWJ5THBxc3JBTVJBbEViUVhScFpIeVZv?=
 =?utf-8?B?ZTFrZGlaeDhRYUZFMkVveEpqYkhWc0F1a3g5aGlFMTlkNkl3Nk1lQVlPYlZs?=
 =?utf-8?B?Zit6SDFSWURPVlJnai85TW9sTFBNWTJXaE5TcVBOUVpZQ1RzNk1walpyd1Fy?=
 =?utf-8?B?dmFwNldWYmt5NXh1Uk1iWWNHa3JIcmVJL2x6cW9zQ3EwS2d4K2Y4YWtVMVF1?=
 =?utf-8?B?VXhoVGRXSndQeWFVK2xzTkJISGhBamlhVC9PMWcxR3ZHWU5hNThCQ3pXb2Nh?=
 =?utf-8?B?L3hlN1RQSllFcnQ3dTlPTnRiWThNKzkzb3JpN1pjRVFkR1hWWTM4aWc1RTlK?=
 =?utf-8?B?ME9VMEdmTDl2aDZTeTJxQ3pBbHZ3Nmp2SndFTVh4UG1wenhaZCsrclVMN3NC?=
 =?utf-8?B?a09iRWQwZXpYM0ZFUURTL0pwSk9oRkNJNUZKMURGTUxVc1lLR01NbzdXU2Jq?=
 =?utf-8?B?djVRWFNsbnRLQ3V5b0hodHA3cVV6cXJTTStOUzRad3BEczhmZW5GL3U4K1p2?=
 =?utf-8?B?cENiV2JyWG92MXh2b2x3bG10QTNEOFhaWGF4Wm4wYnJxdlp5WTFlL3ByVE1q?=
 =?utf-8?B?bXZBN1JZT0xuSzQvL2lBMEhMckdQVTAzQndqUGNmMlB5alU5SjhPd245ZzdW?=
 =?utf-8?B?OHVUMCt4MUx4Nm43ZkYycFBRMVBFYUlMMVFWdlgwY1ZzZlV5dHVGSDUyeTFn?=
 =?utf-8?B?L0pSUkdsRUQrRzZRd3YvTjVtbFVLU28zUXd4UWVRb0lqNTdjdXFZdzdydnAy?=
 =?utf-8?B?TkkvKzZscWZXUHNGVHZTZzR5Mzk5WHJmWnF5NkVlT0VUMkFLdkRXaHUyY1Nh?=
 =?utf-8?B?Sjllcmwvc0lnYTlYSnZuSEJGTHF2OG9sZy9VeXhZNTdYaW5CTGg3QUJlV0ZQ?=
 =?utf-8?B?d3hnd0ZScVBGTmlyU0Z0dWVrQkozMTVRZUFsMXhJQVp4akhYMzk1d0N1M1py?=
 =?utf-8?B?NWVFWmgxVlR1TGJrNTFxT24yNVNSR2lqN0ZJZUJWcVAzRzI4alI2MmxZUzVO?=
 =?utf-8?B?cUNDL1NQbGR4MnNCRXYwcGdMWWVsekNjUHdBYUhTZXpzM082Uk1wSENwdlBP?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacf2890-ed3b-4bc0-7542-08dd729b0b96
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:59.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KegMNUCA6PzSbqoznMfkFPaIyw5N5yEEb6+ifdb+rKWPOvsX97aQvKa5/ZnFLECKRgN18OyalKHoJ0V1AeTmLefjuu6pqvm3wWB3WhsKFDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_033413_134456_409BCA81 
X-CRM114-Status: GOOD (  10.37  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 873aa2cce4d7..515ed8115922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,8 +2873,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2



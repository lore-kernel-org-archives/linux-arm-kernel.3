Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9592CCF2C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=; b=nSjqZCqMWBA+Umd4XAu7CoLlEa
	x+Te2fNDpslq5+WD8a0ZSGn1dhC3DYRCohuwAuzqmA/h/Y/RdXyT8hbPeL4ceF8QCs7iYm3S4+iSF
	aIfqxEx8vaJ77hxxZMAlbrPGXyRdKFH7RwTslp/I4+IgNprLUs/zD+WWwSxwms4B46aRnr6kPjJq9
	NfoXPW286VZgrMIjOhES3/yjLEOB/blKGiReAsKDZQOSLctITKJ25mEnxqX6RycyoaXKjkH/b+jfi
	f1F3zzQ7m57PY7POkKRt0FVFjCoiT8/sK0MIZvM4DgCQh+8DAklvq3C6R4NjeA9gskbPd0eNkrU2p
	wXc34ftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoH3-00000003xyT-0LDz;
	Fri, 16 Oct 2026 20:11:29 +0000
Received: from mail-northeuropeazon11010044.outbound.protection.outlook.com ([52.101.84.44] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoGv-00000003xsG-0clm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 20:11:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVdBbai5Jy6EJiF4lMNISDaaIFAB/6wWzf4K6SIZONgdDTOfRwo+NM2ulEoOB/Uty5c2tHCL4q8zuKoiFRMQeGNRo1GE31DIn4yjXe3zg79Y29vUJ/fmq5DCh5NAljPK+AexfbVomMiOz453b28+6oCehfJrIAuTq+2Xfty48aTOYfvgKOm9TKlvQSSveWyWglOknuPEaGPZEHVYtxlRicGRudfIYy8QOmyiPUxXt3CeK0qkjXWOl+04hjw5DiYuKlF0ZgJByssGORr46KJKJa1OY8Sxq+L2SfgmTSQwdOVzrwEy2nR9Kf+ULpTUudlsD0E9mCWsgZx0OXMo6ew+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=;
 b=Uv0YFwg+f8S0W3v78M1nRY+Bs8/aQRgj4vv/2s6HCk5eH+o7rkMTU+DLp/TEIkc6LFt3f3swqHVs/QClxh6a1od4dOD/6l9TJm2j19C1u6WNdI64BzUQ5AM7J651vDljiT0yoO29qLnW2zL5vkjYcbpWoxrScdb7i7npS1QvFL5bm8fEm9ub2rJt0xC4k9HAxe4U22NPqrH5s6yKsfqJqGniRtMBj7Bq2ZN0HqqqHtcza6GGiM85VOAYV5AhS46hOcZxS9VIMt5aRk1VfdtMzttfCLp9I8tRNPAJ6Y1pXoaj5BDIYxsW4rkyACZRgt7n3J0rlwlrfNVwA1LN1DfoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=;
 b=Ti2Ww1hRUWAsx8yvokWguuSfr1e6OadoY9cXxyFrGZ65wYBCldNu1zudt5v8R2MW+GIX9270H8f+UkCCG9UhWIigpBUXpCrZZWImkvdl57xQuWA4b+LOUGO5CIEbvletN2YLgh5kGVFi+vUyodgyNNbv7KcSeVczCZM5svNt2ByFrvVp8xw+BotsE1Sg1R02AUXHPlB1wHw0YxJmGSEmcdYktAz1HgR6zNomaBZYEBFfSTwwU5RKKuBSPPiLWDKX8vcZgB5wEHtdnONuUwIE4mqn8lIEUlDDrkbL8CPN6M1fdgGtdLv02NgO3CuY91PLD64tIST9kpb9eDH129E3Sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:17 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:47 -0400
Subject: [PATCH 04/14] ARM: dts: imx6q-gw5400-a: fix SPI NOR flash vendor
 prefix
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-4-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1079;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Pi16ZNtWSgN5kITYOWkKpvb2kelfJnb1L8wB+HsX61U=;
 b=T0mUYPP+uTo3Q8IU/XNNcJ6dUJkVC2hBz02iITEidpphOamRPAs4vHg4gGb7fAsxCyuB8Atw5
 5uxWG7wDsXRCStNCKcFuftHIzX1uN1bM19swcQMLM7V82rW2Ma8bZ5E
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:8:56::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 10da89d6-daca-4308-ca13-08df2bc1a31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ip40FOj1EVLPwbVzSQn5p3q3LSgJ2hz7ncG+BhYCPqPG9vt/5GnAejq3sagKMPwBrWUJ9xAK4Q279jUzwdyvhT9F+7rVVc1+TvSvdFSxodbtFkB7GVNmtuy6mGRmqXYk/b03eRCJQiRMQlAtFUXH1BUJu0bMfOP3Bd6dem8nS+uF0hjR9MoEXBsL2PiEGzGRvW+E35y1k0m+IvEAE5m9A25cbJD1dxZaQlCqhZAtvow/2UKTTlFKmzccO+flXPx2CcJp84Wx91LoslilzwCRhGYL8bi61jQ+HohvOBYPUzptiHJipaf9Q1hOKMQWgs2gQUyytmfo6pY/xqNYyftOg2X6FA2WATlB8GQKuqoQX1WKtJJo8izqY1zdtZl3vTcIIX7zIjvbK8rDXRa+bxctER+4AftiTU10RthqgaubtaN8lvDggvFQxMp7OtZhnmriTJ86/Z+sTDDC/dMl54CMylnSXk4MXX7kRtG6is9r+g3X6NrVH5zup5Zh7Aa2EPetglD0h46kVOGOaf06OFfgoAIOYawSxkPZ7DPWoTmqMGcjGEEBp+BNGDN1V43wga67/u7E953svWEd7G8RV1L1ZOsXYftwM0PjC1jfZKPxKBHsmf3ykbyKaZzf1mYo2GagWlLDZl2001/IEMy9/f7vHVb1mvS+LQHuZDogccrvs78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRFd3dXZHRpbk1tYmpmekVZbktVNjk5M2M3NHlUV0l5eWZ3Y1Btd0xTZmo5?=
 =?utf-8?B?TzM4Si9JNHFWcnlXZUU0TWh2MU1BOU9Oc0QzRG56T25Cd1k1enFIQ3ArdXFu?=
 =?utf-8?B?UFhyeHR3UzhzbnFEcHlMSUVXblFTTE82RWpFc3B3eUE0cmd2UG5HMnJZd01q?=
 =?utf-8?B?V2Q1TGN3dzl4VDBqdmV6RHdHOEtibHJvMHpLelZTQlJHWUpCY2RqandFT0FV?=
 =?utf-8?B?eWV6alc1VlpBZVArVFk1MHNtVkZlWFZpL010SW1udlgxVUhacUsrd3VMcmhl?=
 =?utf-8?B?ajdmUjZoV0hObHR4MzZvbEU4Rlo0Y3dRTTFuVTZVMXhvZU1kbmNhVEp5amt3?=
 =?utf-8?B?OG1iTGlQYmRUT1RwRGlYN05xVjQ1cHZ1Qk1UVzBEWVhHMXh3a3lyS0tSTS80?=
 =?utf-8?B?UjUwbFdYcVRjby8vaG5ZamtISXMva0QxZE5NVWhaY2FaRXM2Y1QzdUJpelIz?=
 =?utf-8?B?M3FCMi9VQVgrZHN4WG1EV1JuRnpQdDlmZFRoWTlqelExQzk3TG5WTSs3L1l0?=
 =?utf-8?B?Umhtd1NHUjlKY00zYmVHR0NUWkF4QldIS0xWVVFZRHk0RzlKZ0hQRjhtaXpm?=
 =?utf-8?B?SlFBN1huSmw5VzMvMzZ5QkdmTVAyZGZYeTFLa1hkSlNxYk1tc21saFQrUGl1?=
 =?utf-8?B?MmZoSEJTckVtV3pYdkVDWkd3WjUrM01mclpuSHV4aTluRFQ4ckt3RVRsd3k3?=
 =?utf-8?B?M2NQVlRoV3NBNTNqWmtQS1hNbzhEbXFLNjdQbWorUWZjMUhsQ0hjb3VLSnNn?=
 =?utf-8?B?cEZlNm9ad3RqK3RtWEdEeHcrSnZFMW53NmZOWVdQT1JQbGZQYjdYTVVWcEF3?=
 =?utf-8?B?ZW5NcklhY2VGb2NqSXdXYkJEaERPODhuU29oeFlKQlNIRURCbVBXVk1pejRs?=
 =?utf-8?B?a1VJMWxWcndnZkdsMTBhUGV3MmZta0tXQ21XVnpONy9uMkVTNWZvZFczR2Yx?=
 =?utf-8?B?N2JnMWo4bUR3ZTloVXNJdzhMMXF2ZmJLWGdwOHNxKzBjSHRNdjhmVllKK2Y1?=
 =?utf-8?B?dE5UejhLY0JPcXVpcXB4WjltVFBMMTBBS2ppUGJUTmlRcG8yNEZodVR4a2lU?=
 =?utf-8?B?amZvRWxRQzNIUEVlTHJRLzRJMjFCK05IVzVRSk1FUGt1R0JzOEFOTnRHMFVr?=
 =?utf-8?B?VE9rT2R1VmI5b2ZVZkxMZFY0eWREZ0huejBEeWxjUHFBMUNsZi96WXNHUzd3?=
 =?utf-8?B?SDRNcWFmOGM4UjhjWnkzMG85OElyUHZ1WDc2b1lXQ1g5M1RmZzhHZWZ6L0pl?=
 =?utf-8?B?TTBnTG15Tzk2L3I1Z3ZUYmlLa1pvZFZicFdnQkErbHJxaWVyZHhSSDRocFB5?=
 =?utf-8?B?VFJSY3JjVGZZazZ4L3ZQMGw0bStOaGduL2xrVDI4bW1WM1lLTmp0a2xCUjNq?=
 =?utf-8?B?aVRDZWtKZENoWi8vWGFFMlBnSkhGWDBkWEFYajIzUVJiR1RLZDBIY2tnNE0r?=
 =?utf-8?B?eFlvV3kxY2Qxaks5U2wvbGxoOFB2VXRuN1hKcmVaZm9HN3pwbXNvWjJhVU95?=
 =?utf-8?B?WHdtRTIydUszV0dzZnRTSmd4SWYrVFBHdjhJSEd6NjR6S0JDY2w1bFJtMnFE?=
 =?utf-8?B?c1QrR2xkZzVoZ09MWVczMjNXek9QTDNoN21rZElMRmtFQjQwZjFDVnh4YzNa?=
 =?utf-8?B?dk1ITk5FdjNHL0hvR2ZDV1REbWhoNTJwTmcrN214dEFoamdxakc4QThkNU5s?=
 =?utf-8?B?Tm1pb2xKaVgvK3Vwa2xyUVRnM2xhb3VuY3J5L1dUejcrdzJYRTFwS1BjYUlX?=
 =?utf-8?B?U3dpSXUvYWFPd3ZpcTc0RTRyL1hZZ04xZ1BxM3hqaldXNkpYZ2phNUtpb0hM?=
 =?utf-8?B?NUQ3OUZSdVNiQlg5YVZZTnVETGhka0ZvaytFUUVmM1cyTUZZZGdjTC8rYjdS?=
 =?utf-8?B?YXNWVENqRGpkTEpqTWo0a0tXbWVKQm1jZUJFRzFuUEJIeUZ1REhKUkVmcE5p?=
 =?utf-8?B?czFOc0ZRRExSalV5VjNxWEdSbkNuOWp2cU5STmxnUVJDZUMwK2hsM2xsakRE?=
 =?utf-8?B?V2FiWTBLd2plam9xU09tS3FFU2lMZ3dwU0lTUUNqbnhrUm05WnNpRmV0NXA2?=
 =?utf-8?B?RWRMUjlSMG5vcHpwWlYydVhpQzdsQXE1Um1CMnZCVUdVQXIrS0Zic2pmV2Iv?=
 =?utf-8?B?WkpxL2lMblpwY0NQMnlQREFxVWlkeEkrazJCY0ZpQzVKRFZyaE51dDRPMEg4?=
 =?utf-8?B?RitRc21kQVBCcVIxaGVEdExkVjUvSGUyb3E0eklWNG9Pa3NjN0FESTN1K0ZM?=
 =?utf-8?B?cEZLU2ZLbmlTSnAyRGxvWStuWDVTOVBLNWxDc1FKL09VYTZqZ1M4OGRiQytX?=
 =?utf-8?B?d0pyU0ZOc2RVYkhWcDBnMzIzYThjL1JOQnc3M04xc2xESTBSODk1Q2xQbnlN?=
 =?utf-8?Q?uSX2IlIYKWBMTaINFVh1dtj3Tm8q9jf4s339e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10da89d6-daca-4308-ca13-08df2bc1a31c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:17.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4JmAEmHK3g8Ii0oq9CtcjTLQD5o5RO+E3/PI+gnaINOJCQQ6uTHEdAYk89StOJwSbjkEODOGiwubUKDyPxg1ybKj+OXBYvPwxTB6DvqI5tMOTtMjAt2/KMr/Wliw0Kl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_131121_213041_27C52748 
X-CRM114-Status: GOOD (  11.18  )
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

From: Frank Li <Frank.Li@nxp.com>

The W25Q256 is a Winbond part. Replace the incorrect 'sst,w25q256'
compatible string with 'winbond,w25q256' to match the jedec,spi-nor
schema, which accepts '(winbond,)?w25q256' but not 'sst,w25q256'.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dtb: flash@0 (sst,w25q256): compatible: 'oneOf' conditional failed, one must be fixed:
        ['sst,w25q256', 'jedec,spi-nor'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index bf8fde9cb38d9..89c52b2e7c24f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -128,7 +128,7 @@ &ecspi1 {
 	status = "okay";
 
 	flash: flash@0 {
-		compatible = "sst,w25q256", "jedec,spi-nor";
+		compatible = "winbond,w25q256", "jedec,spi-nor";
 		spi-max-frequency = <30000000>;
 		reg = <0>;
 	};

-- 
2.43.0



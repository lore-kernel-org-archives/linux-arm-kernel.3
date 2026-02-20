Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E1C56204
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3CZQPJAD8TTEkwi/xeK9aPbCIe/Qix5xwOrDMoHSEc=; b=lxX9R75AOuJmZuL5861fYBRA/P
	fvW9AjZzPmpVJGoucGapxg7clu8mu+gUVENmfFai+2CEYg24MBuWuNG4ZTReLbzo2J/PqHuUbKTMM
	L6PgKrofI4WSQYK4EKwWjXkHWk4JK1XKeifGNDH1B8bGva0MJZKHeD1WfFzgK49RgUqnkg4nLW5XA
	Vx7X/aZtd7zvjtulrNF4GvVhxbSv8bZ2hGeJZRhZyExp8ZP50LLU2GHQ60qv0UlAqux0yNo5DLQWC
	XLBXy0vnWFh4Ej6O5Z4fykk55iaaKtPw2hdImHFzBRx8936m5wEw/XV0G9oarWKqRF6uJ/pOOabeW
	r9SPlhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRkp-0000000Escu-1Waq;
	Fri, 20 Feb 2026 14:45:15 +0000
Received: from mail-norwayeastazon11013025.outbound.protection.outlook.com ([40.107.159.25] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRkl-0000000Esbd-3xAo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:45:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=izOZgSKs9wuLTM1JWovepDRT9HnHtPB+qwLTdCSgSROqTJceWThpYWSGHMSlkodT9XikYUfIw2ej/83TmkvDoPJaLJ89xM/v4Aph3im0EcSQvVGr9uhIIFyqYDEKsNomaFJtTPB/qw4EwV2yh0RLx1WprbmZeCBt9oTpJoIPHXJqsvSuYu8z7vgQn+sQDyGhsK9XeIegWbgUjuYzgaf7gk0igTGoJj8dcFNddY5GCqc47xOa6zAkmWB7vM67yUeEKBPR5GiV5nkgbpe7kF1i7nzu9y9FjWsbSRykLmObZ3oE6yTm6x6vIKZgDqYZMimlo0OnLuKMqllNlKXj2m9L2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3CZQPJAD8TTEkwi/xeK9aPbCIe/Qix5xwOrDMoHSEc=;
 b=N9Ct4cvcMHLkWNJ97kQW+AOQ1FC3lIoe0dPTlLar0r16ymVQKM/eFSRWHNAJsc+vFGZnBQM+jdGcihI6YXFliKHcK4/nzaNM/iw1bKzZVTXOm6Kfom6pSVMfx/T8zIrstB3NfHHE5QecqGL6IoxcbHL2pLw0y8Ko1Kz1Xp6DMa5jknMUp7+70p/r9RdMGbwEP9juoXy/WInN5mU/xjURugE/f543QqWXlDvgIj13Qs8Xif51EwNyqTLOxVTC8+qL2AW/VU0nY3JJmNDV55qFMkwip55y1N2u34vLkuvQAXbTHzQeWn1R5imTxmcScQpxcQPsMUzYda6eB7Usx7G81g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3CZQPJAD8TTEkwi/xeK9aPbCIe/Qix5xwOrDMoHSEc=;
 b=Lq6FFS2ktPHnmhnOaEEFEZ3IDlQLQrbbjBGvolZzWhWPp48aYtkV1wzvibnjA37/S7xSjmIbFJ4Ze48v7G2ZRD1xYc/MKgVJxfP00vdSNMmkhcNJCSAxfpctoOhiOKbmvhCN78x77CpahPrNHOPq4/thmWbzZ51SEQvHJI8k5Xw=
Received: from DB7PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:36::34)
 by DB9PR08MB8340.eurprd08.prod.outlook.com (2603:10a6:10:3db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:45:06 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::d3) by DB7PR05CA0021.outlook.office365.com
 (2603:10a6:10:36::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 14:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Fri, 20 Feb 2026 14:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBfOe2M+phqVmaf5PeixaL24WK5OPn5m8WlFYYr3KpwsnROzi7EpjBYccNEQY4hlyVjoCElE9jCCb9Jz/5tPRCICMc2cKXr0VnATq4jR7Kd9zz49fVHKgEtuUJ4MrIAEokIBcZs6tx/KkxmThgNDkUJQPLCpc70U7D4rLOdEgXUlDq3VoMCTfrnmR3/Tml4pLGhPkoeZCvX9+N6xrzbffYkljD4RapZG0fUFKWVCxI7r9XSbMUAApp1PRBHPR7Fdgo9+nJ1if2+n7hyD51Z6TReMkFH2tTInn4H+BqknbzG+p6fSc14V37Dgu1Fapr6TpW9F/TSsY8Zn9VgRnMmnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3CZQPJAD8TTEkwi/xeK9aPbCIe/Qix5xwOrDMoHSEc=;
 b=PY9gFHZgOdicObZN+FzmBFwG5NQ63CV4CVtDBEJXc8+TPdwmsFvp5enrlvwU9wNYCtUfy52jEULEACOgCo8MxKIUfDZQ7GUCuFxalqtVn/QHXwR4kEkLM8mQ24XGGhKFhPbQPQeOx1ZO/vSOBuzD0oGPkrt/sPX7KNCdiNk5M57Q99fjRr+D2Y344fL98sGMzX/G2Tq1SKX2ziouWICNH0mZp1shO73e56Ko5U7vmoQpetbkgL1crtUlDTcQHXKB0jc2KxjWXudmyzVdvZsMxiushhbsHtvTUkFE88aay8qGBhWcvLc05g9aTWLDVTPs2vPHzWI0RRFq7C+cbAY8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3CZQPJAD8TTEkwi/xeK9aPbCIe/Qix5xwOrDMoHSEc=;
 b=Lq6FFS2ktPHnmhnOaEEFEZ3IDlQLQrbbjBGvolZzWhWPp48aYtkV1wzvibnjA37/S7xSjmIbFJ4Ze48v7G2ZRD1xYc/MKgVJxfP00vdSNMmkhcNJCSAxfpctoOhiOKbmvhCN78x77CpahPrNHOPq4/thmWbzZ51SEQvHJI8k5Xw=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DB3PR08MB8794.eurprd08.prod.outlook.com (2603:10a6:10:435::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:44:03 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:44:03 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>, Jie Gan
	<jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>
Subject: RE: [PATCH 8/8] coresight: cti: Refactor cti_reg32_{show|store}()
Thread-Topic: [PATCH 8/8] coresight: cti: Refactor cti_reg32_{show|store}()
Thread-Index: AQHcme4pN6E9z8KHy0W2LgcOuNFFy7WLt3wg
Date: Fri, 20 Feb 2026 14:44:03 +0000
Message-ID: <PAVPR08MB96744050482081B274E6E4BB8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-8-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-8-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|DB3PR08MB8794:EE_|DU6PEPF0000A7DE:EE_|DB9PR08MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae9ac4c-df3d-4bc9-529a-08de708ea32f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VjIzVHMvbWsvcEd6MWVSaElEZ1lINHlCMk96aDVLSndvNXZhMUJVeHpEbkpC?=
 =?utf-8?B?eXJob3Nxd2k3TytvTFR2akhvV09BNlAzenlmRmhRdXRMeEtYK2VUcUZMd29U?=
 =?utf-8?B?NHRtU1h0SXZpWUZUYmp6TTZrRDF4RENzdzU5cFQzZXNwUVJNNjlURlNuMTFD?=
 =?utf-8?B?Rk9OVERhemhTeDRPeENPWGczKysraUt4bVRUT1hSMmxCSzJla2FzdW5jTWsv?=
 =?utf-8?B?cER0elJseXB2L2FZLzRZcnNyM01vT0pvWXNwYUYwYlRrd3BqaVJoWDRLK3VV?=
 =?utf-8?B?UFlzenFtajN1dWY3QTl1aXVoT3JJQWdRVVA2MkxDbllTVWVqbTh3NDVPMnhU?=
 =?utf-8?B?UGsrUERES1NZTG15OWRVbjdWbnRZNnZnd2gxZER3ZmVKOGhIN3BTL0xDWVRY?=
 =?utf-8?B?OHBxNFl0N282aDZEbjE4eVczNWx0NTdoSi9Uc28yQU4vSGl4UkFDUHdxU2pX?=
 =?utf-8?B?ZG5GZ09Wcm40bUVQeUNxOTVpNlpXeWplcXV2TnpSUFJnbFE4ZXprTkdQMlky?=
 =?utf-8?B?amlwN0VaaGtFNGcxWU91OUVUMjVHcXhYOVQ1RTRPdWY3Z1NKSDIrYksvYUR6?=
 =?utf-8?B?RENSZVhCeEQxLzFCQ0RRd2UvUE9QUldSMUlINXRYNy9GSkp1TUFKUUVNZm9v?=
 =?utf-8?B?RjFkek83b3IzRlVhc2h0Z0podlhmaUZlMW0rRzlxUkpTenZvcWNHVkZBaWtn?=
 =?utf-8?B?Tkg4ZVNOV0hGZm91bkNXSWxXUERvckhPVEtCVFdCVWpoVEQ0cjBjTE9qb1hp?=
 =?utf-8?B?RUNyRElpc01PVGZOcVE0MHl1TWhpQXg1VmwyTUlwd2Q2aTlTZ1FtZ0N3Slkw?=
 =?utf-8?B?cis2WnZVQU9lQ1E5eFRmMHMrSUR5NVdnZkgwREozSjJjOEVhQnZwWk1NQVJ2?=
 =?utf-8?B?Q1E3UnpubEJVRklCOWlVSDd4WkttT3hpVE9nT3JRbmpQRVZ3QTBLc2ptVFVj?=
 =?utf-8?B?d2ZacjBHSHFDUlpWanBVTHdkQmsxOFNVZ3FQN1JRMHQ0NnBSZHFyQnN2WkFO?=
 =?utf-8?B?UXd3V2krYU05dVBLUldCdi9DYm1ianlPeDlDTVNNZXBxak82UVgwNksxN1ZQ?=
 =?utf-8?B?MVFyUkFJTmNjV0NYNEVOL3ZCMXpzQTdicWE5T3dmZWV3OWpMR3p6dFFHdjla?=
 =?utf-8?B?a25CQVNDTmtaV3hOOEdETUt6Q3docDFGc3pTZE1IcmwwL1RjWGY2M1lmSTc2?=
 =?utf-8?B?SzVlSlpOZ1k0a2JzUjU4THduK01JWktKWkpBRnhRWk9uWGNrSlRWTXd3QzRS?=
 =?utf-8?B?MitIVGU3NDdGbm02OFkvcVNTZENkM2JuYkhjZGc3Ung0S3N4MGl2aGNXOHBQ?=
 =?utf-8?B?OTdXSFFyVEtYRVVBazRxdWxSaGZ6TzFLZ1hydlZLZXVzbnJUaXZHZG9pSDR4?=
 =?utf-8?B?eVg2eXl3WFk4SVN4bFZpTWlBamRJWkxSNTd4a3hiaFNQaWs5RFN6QjREV25L?=
 =?utf-8?B?RXVZZVl2cDIzeFdjWGV0d05URVZ2UytiREdTNW5ISHprOTZtNUpMVFJTeHJD?=
 =?utf-8?B?dzY3dnZMZ2JBcGhXbm03OWdNbTJjQ29QeGJhdlFlS2ZZTUlTM2lwVFAxQWN2?=
 =?utf-8?B?SitTbk5jT1Vtd3BVWVVHZVRkcHFlNkdHU0FaQ3RSdGVLQWQwV0Y0aFdwaXpW?=
 =?utf-8?B?MU91QnI2ekl6ejRQd0pySnBRbUdQVWNMWFZDNUcrUTJyVk5PVzlaV0swd0Mw?=
 =?utf-8?B?TzZoSzNuUXh4LzQ4OXBMaGlIRTdjR2ltR0t3SnFEN3pYWDRGWUlmWXpMc3RN?=
 =?utf-8?B?eDlPQUhJeWxKN1hhcXZ6bXRHRlFaWVNYb2pXVFpiMHcwcjY5dGNXc2VEZ09U?=
 =?utf-8?B?TThjSjgwWHNUNFpsblg4YlJPdXZLUVFrNkhNSDl5azdUdmRsWWhiZkZuUG5k?=
 =?utf-8?B?bXdFbkZTUzE1amk1OU1xMjgrSksrZ3FlNjlhVWliN1RmQTNKYVMxZzdQYzNq?=
 =?utf-8?B?NXVySG9nSklvdi9wWU14N2lmdWxCTkdEdmhDbTc4UWZlZTgyMm1vSy9XeXRs?=
 =?utf-8?B?cVBZckFtaVpWZ1V3d085NjNEb3cwWlZtdE5qUHE1QVBDMGovT29OMk55cVNO?=
 =?utf-8?B?RGdtd3l5N2cwQit0MWlxUTN0WXpNOWZZNENTSFVQV0REYkU1aWtJR2t5TFlW?=
 =?utf-8?B?ZWVYeTk5NVJvRG1ZR1owOUZ3SXRKbFEyVisrMHhqbGFYQUUrM0cvbFhITWs5?=
 =?utf-8?Q?NhCxTEEgusAKZPsX0jgIS1s=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: af98b3df-62a7-485f-956a-08de708e7e01
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RktvZHhqY3FDS2xrK1ZHMG9hV0RaK1Q5b3lMa1dQZm9HZmQwa1kyZWFGTlcy?=
 =?utf-8?B?Sm5LL3ZPSzdRaUsydjE0R050bFdVS0VrdFNITkhMV0NySkl2M0tzTUFvREM1?=
 =?utf-8?B?UFR2R1hXOTFYTkxEQlJxUUxOMncyRENPNkhod2hJSkJab2RoT3c2djVBZFdz?=
 =?utf-8?B?T21Mcko4eG1kdjgwZGpacVZQaTB1d3RJTUduRnhLbUVkdXZHTGVUbjFVMFZ1?=
 =?utf-8?B?WXp6R1ROUjFMYXVCOStYN3pJajNQcWgyRzQ0YWVwUEdQbFRVaS9HcHhkWWI3?=
 =?utf-8?B?TVdKckwwZnVQcmRIeWt3VmZYTk5wUnpteURPZVNLMmdORzM5Ui9PeHk2UmtS?=
 =?utf-8?B?OUtkTDg0QUswQ3RJTzlOV2FJRmZraHdnMXhJdGwwZE0vNEQrVHVwVGFCRHox?=
 =?utf-8?B?am4vcWRVaVl4UG9nVlRmY2ViaHRaZHBQSjJNNHN0Sno5WEtaYTNQZ2RrcTYr?=
 =?utf-8?B?QVg5VHoxNFdqa3dtRDZjbHR3b1FXalp1c2VSYmxQNFJrOSs0V0c0SjNGd25L?=
 =?utf-8?B?dWtGcCtUL1J0VE1ZVkNubUtab3BlTEtnWE0zUHdPMmlKMEJXMzN5WHhhRkcz?=
 =?utf-8?B?ZXpPN2JZdVJOSldwaUxrRU1meVVuNFhpa0w4WGxONlhNUVFPNDAwTk1GMXkv?=
 =?utf-8?B?TjMremNIaml1OFZVOXBHVjdWd21DWmpGODA1dnNJNG5hM1lrVzdRdysrek9h?=
 =?utf-8?B?cEc2M0d4K2VXeVgrMjVzanhRN1h0Y2pSenpoSjYzRGpvbDFER2RsejN4Y09D?=
 =?utf-8?B?SnpSYXdJOUxnb2FDOUo0K1RSSnVUU3Ntc2dLdHFWd0o0T0lTMHg3SXNPbFdG?=
 =?utf-8?B?NzF3NTZyTDZoMThpc3NNamlCcy9KVy92Y2hQVVFUVStmNHdxaXBTQTZPL3Q1?=
 =?utf-8?B?UnRmS3JHL28zU21aMFpQTnBSQnU3T3JCUHJnNE94TElFdkZrbVBtQ0RaNlpK?=
 =?utf-8?B?cHljK3U4WHNhQnZnK3JFV0VFMllhL0hUSjhFVkNmb0ZLTmRLbUt4S3l5T0Zs?=
 =?utf-8?B?b1hLckk5TXdiK0F6dnB6K3g0aXBRUmRaODVjZ1N6eDJnSUU4NzJCZUphcmww?=
 =?utf-8?B?VFUwUEdCUzBzd1BoaS9GQnY0UVBTOExQaUQ1ZU5CZEt1ZnEwMWpxbktJa1VT?=
 =?utf-8?B?STRpcktIZzNMTnQ1elBRdjdiR0ozV09VRHdiRFNDTFNTOUNQWHB5em9kNTdJ?=
 =?utf-8?B?TXU5UGRjNXpSdk56RzlMQWlLMzVXSmFmRDZ4czN1ZHZxQjl2ZUtZK1k1ZFRj?=
 =?utf-8?B?RGFzb0NlV2RGbEhlOExiTG9sQ3oxS1hURXdURjFCeUtuTnhWUVZLRm4yQXdi?=
 =?utf-8?B?QStHa1RjTVB0NUhnbGpsTGY3amdiMHVpUHFEem5iQmZQNnhpdGhUeWpmRXNM?=
 =?utf-8?B?UFY5VmlXcndVa2ZIL2pNK2dSV3F2UjA3cUdIeWVoeC9PRlQ5cmowSWZ6aDdJ?=
 =?utf-8?B?c0FERktmUkd6MVlpeEJndHZCbUQ4Zit4a0RaY1VFdVM5OFRnMEZQa2U0MjVR?=
 =?utf-8?B?c09uTElsTGs0TFRvUmJQR3d3eW1HLzZxSnhxSUlEcU1sdk82eG5RR3M1Y0Ny?=
 =?utf-8?B?MHhXaDM3dDhwMmZsVnRFaFhGaVU3Q3Uvczc3TUFQN1B4UXBncnFsMDNrTHVw?=
 =?utf-8?B?eG5TNWFxc1dhL2ZPRDVTT21qTjRNVk9ST1E5SVN6WTd1SXBWRmpQUUwxQ3Nv?=
 =?utf-8?B?L1M1TmMyTlNWTG90OERaTyszdU5mMGptek1uM0EvUWFhdWNFbENvN29ncUZS?=
 =?utf-8?B?c1crZDdhK3dqYUozNVV0TGVXVEREU3o1ODdBcmJwVjIwTkwxUVQ0MWFEcHd3?=
 =?utf-8?B?YkdUSjg1YURMRlQzNFVWc0pVOUZwelo1WVVGdmlEdkRDSzhMU3ZBVjIzbHlQ?=
 =?utf-8?B?YmdoTys1b0lGQzJ3c2FrRTJ1cm5uRFNudVNwN1M2dC9obUxaOHJMZVZseC9Q?=
 =?utf-8?B?dUpyTHhoZHhwQjdEU0tIck51SWk2UlovMkhEQUZ2NlViRjBBSXVncGR6ZE5t?=
 =?utf-8?B?elNwR3BOcnM2Z1M4TkhQOVl4U0ZtMWpBbjJpM2NCK2lyMWMzMjBiZkNwc1Vr?=
 =?utf-8?B?ejJzN1doamJHdno1UmVxOWd6NFhUUFFMeUJSOHRkK3dVcDI4YXZ5UzFraUtp?=
 =?utf-8?B?YS9mU0R1aVlKQ2NHNXlpYVoxRWpXcFo3MitmUG5XZ0VSd0picVlSRyt1bENS?=
 =?utf-8?B?NW12SzNLa1I2Y29UcVo3a3IvQkJWZk9HaHZKYmVCb0FMZ00xN0tKS2NabzJ2?=
 =?utf-8?B?SUZoV0t2YW00VHd3cG9aaXlYbndBPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IWGE55fC8ID3wPW86UqJj/xriiQAqA1rHvjMVx8ipKdIes9zn2MFcT/AkajyfFKVoe2CkrGRUKw2Kzy5O51ESAahGzU8EbiCKfc+4Q9bvvEX5hj8+IdXNHAPp3n2MlFQHRuwU3wX4qvRa+BmmfCl6RCmYXj7MUq+vw/navOW4+p4PcFBCX+0yphiNy9Z1Sd0jN6drYpiTyhWnVE8G+c+uaYOS5P/OtJbtbA276LjdmWStk9RvrnbkQBdHt7sDBa8LGeyu+QjanA+xvM2INz4gqYyZsT+0jPiWeSFgRbJZoXIEm2SaaF3rBaxmcuORVIL4j6gObKr3QOEYdt6qtGVRLe5EhzTB3peOtaRvqadRNpoh5jZNTfRd0VzhlKpy8HbZSumOzBw6JNdRD528SJJ+0JR3cTYdVNk/vmQfvNbu/pgUGCsHYiBRmnoVuAz6tuP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:45:05.7544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9ac4c-df3d-4bc9-529a-08de708ea32f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_064512_161873_BB56F9F0 
X-CRM114-Status: UNSURE (   5.66  )
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

SGkgTGVvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExlbyBZYW4g
PGxlby55YW5AYXJtLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSA5LCAyMDI2IDY6MDEg
UE0NCj4gVG86IFN1enVraSBQb3Vsb3NlIDxTdXp1a2kuUG91bG9zZUBhcm0uY29tPjsgTWlrZSBM
ZWFjaA0KPiA8TWlrZS5MZWFjaEBhcm0uY29tPjsgSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxp
bmFyby5vcmc+OyBBbGV4YW5kZXINCj4gU2hpc2hraW4gPGFsZXhhbmRlci5zaGlzaGtpbkBsaW51
eC5pbnRlbC5jb20+OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPjsgTWF0aGlldSBQb2lyaWVyDQo+IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz47
IFRpbmd3ZWkgWmhhbmcgPHF1aWNfdGluZ3dlaUBxdWljaW5jLmNvbT47DQo+IFlpbmdjaGFvIERl
bmcgPHlpbmdjaGFvLmRlbmdAb3NzLnF1YWxjb21tLmNvbT47IEppZSBHYW4NCj4gPGppZS5nYW5A
b3NzLnF1YWxjb21tLmNvbT4NCj4gQ2M6IGNvcmVzaWdodEBsaXN0cy5saW5hcm8ub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBMZW8gWWFuIDxMZW8uWWFuQGFybS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCA4
LzhdIGNvcmVzaWdodDogY3RpOiBSZWZhY3RvciBjdGlfcmVnMzJfe3Nob3d8c3RvcmV9KCkNCj4g
DQo+IFJldHVybiBhbiBlcnJvciBmb3IgYW55IG5lZ2F0aXZlIG9mZnNldC4gIFNpbmNlIHRoZSBj
YWNoZWQgdmFsdWUgaXMgdXNlZA0KPiB0byBzdG9yZSB1c2VyIGNvbmZpZywgaXQgaXMgbm90IHVw
ZGF0ZWQgd2hlbiByZWFkaW5nIGJhY2sgdGhlIHJlZ2lzdGVyDQo+IGluIGN0aV9yZWczMl9zaG93
KCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gWWFuIDxsZW8ueWFuQGFybS5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYyB8
IDE1ICsrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0KPiBpbmRleA0KPiA5ZWY0NDk1NmViZGM3NzgxNzE3
ZDc3M2ZhMDE0MTY1OTg5ZGYyMDQ4Li5iYWFjMmE1ZGQ0NjcwMzJmYWZiYzYNCj4gNTIzZDg4ODVk
ZTU5Y2IyNjY1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1jdGktc3lzZnMuYw0KPiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+IEBAIC0yNTIsMTQgKzI1MiwxNCBAQCBzdGF0aWMgc3Np
emVfdCBjdGlfcmVnMzJfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IGNoYXIgKmJ1ZiwNCj4g
IAlzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJl
bnQpOw0KPiAgCXN0cnVjdCBjdGlfY29uZmlnICpjb25maWcgPSAmZHJ2ZGF0YS0+Y29uZmlnOw0K
PiANCj4gKwlpZiAocmVnX29mZnNldCA8IDApDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+
ICAJc2NvcGVkX2d1YXJkKHJhd19zcGlubG9ja19pcnFzYXZlLCAmZHJ2ZGF0YS0+c3BpbmxvY2sp
IHsNCj4gLQkJaWYgKChyZWdfb2Zmc2V0ID49IDApICYmIGN0aV9pc19hY3RpdmUoY29uZmlnKSkg
ew0KPiArCQlpZiAoY3RpX2lzX2FjdGl2ZShjb25maWcpKQ0KPiAgCQkJdmFsID0gY3RpX3JlYWRf
c2luZ2xlX3JlZyhkcnZkYXRhLCByZWdfb2Zmc2V0KTsNCj4gLQkJCWlmIChwY2FjaGVkX3ZhbCkN
Cj4gLQkJCQkqcGNhY2hlZF92YWwgPSB2YWw7DQoNCkkgdGhpbmsgd2Ugc3RpbGwgbmVlZCB0aGlz
LiBJZiBhIHJlZ2lzdGVyIHdpdGggYW4gbm9uZS16ZXJvIGRlZmF1bHQgdmFsdWUgLyBzdGF0dXMg
dGhhdCBjYW4gY2hhbmdlIG92ZXIgdGltZSBpcyByZWFkIHdoZW4gYWN0aXZlLCB0aGVuIHJlYWQg
d2hlbiBpbmFjdGl2ZSwgYnV0IG5ldmVyIHdyaXR0ZW4sIHRoZW4gdGhlIGluYWN0aXZlIHZhbHVl
IHdpbGwgbm90IHJlZmxlY3QgdGhlIGxhc3QgcmVhZCB2YWx1ZS4NClJlbGF0aXZlbHkgbWlub3Ig
aXNzdWUgYnV0IGRvZXMgcmVwcmVzZW50IGEgcG90ZW50aWFsIGNoYW5nZSBpbiBmdW5jdGlvbmFs
aXR5IGZvciB0aGUgZHJpdmVyIC0gZXZlbiBpZiBJIGNhbm5vdCBzZWUgc3BlY2lmaWMgaXNzdWVz
IGZvciBjdXJyZW50IEFSTSBDVElzLiBUaGlzIGlzIGEgUi9XIGNhY2hlIHNvIHNob3VsZCBiZSB1
cGRhdGVkIG9uIGJvdGggUiBhbmQgVy4NCg0KPiAtCQl9IGVsc2UgaWYgKHBjYWNoZWRfdmFsKSB7
DQo+ICsJCWVsc2UgaWYgKHBjYWNoZWRfdmFsKQ0KPiAgCQkJdmFsID0gKnBjYWNoZWRfdmFsOw0K
PiAtCQl9DQo+ICAJfQ0KPiANCj4gIAlyZXR1cm4gc3ByaW50ZihidWYsICIlI3hcbiIsIHZhbCk7
DQo+IEBAIC0yODAsMTMgKzI4MCwxNiBAQCBzdGF0aWMgc3NpemVfdCBjdGlfcmVnMzJfc3RvcmUo
c3RydWN0IGRldmljZSAqZGV2LA0KPiBjb25zdCBjaGFyICpidWYsDQo+ICAJaWYgKGtzdHJ0b3Vs
KGJ1ZiwgMCwgJnZhbCkpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gKwlpZiAocmVnX29m
ZnNldCA8IDApDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICAJc2NvcGVkX2d1YXJkKHJh
d19zcGlubG9ja19pcnFzYXZlLCAmZHJ2ZGF0YS0+c3BpbmxvY2spIHsNCj4gIAkJLyogbG9jYWwg
c3RvcmUgKi8NCj4gIAkJaWYgKHBjYWNoZWRfdmFsKQ0KPiAgCQkJKnBjYWNoZWRfdmFsID0gKHUz
Mil2YWw7DQo+IA0KPiAgCQkvKiB3cml0ZSB0aHJvdWdoIGlmIG9mZnNldCBhbmQgZW5hYmxlZCAq
Lw0KPiAtCQlpZiAoKHJlZ19vZmZzZXQgPj0gMCkgJiYgY3RpX2lzX2FjdGl2ZShjb25maWcpKQ0K
PiArCQlpZiAoY3RpX2lzX2FjdGl2ZShjb25maWcpKQ0KPiAgCQkJY3RpX3dyaXRlX3NpbmdsZV9y
ZWcoZHJ2ZGF0YSwgcmVnX29mZnNldCwgdmFsKTsNCj4gIAl9DQo+IA0KPiANCj4gLS0NCj4gMi4z
NC4xDQoNClJlZ2FyZHMNCg0KTWlrZQ0KDQo=


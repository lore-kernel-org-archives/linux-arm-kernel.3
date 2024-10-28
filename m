Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A3FD3E2C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H7TpTqCaqdOfKLN00EN40+qwgx9L9PJH+T5W92DUvqg=; b=uTZe8buYdTKgdcAco4TWf582Hr
	zlGOSr1chh/IASJSwA4NJOkN3+pntjPTnKnfMxWCY454stUG8SAV9oc1SZ0DvfJLey5lLrmr6UXNO
	Rw8kUmLvyCCrL3Gs8UFKiUw1syZ1AJK9+EVjyKhJY3CYt4gAwClbe0JifEVJ77JtmPXtsEuxisKlk
	RRR6276Rxt7e+3zFSSq+lyKNLvRWiMU5bjHW+iwsOf15dein5tfe7ou/JxAz4bBiXK9dSANiuax/Q
	/iMlcj43V/i1En9C+cGgaBXeyFzGiogh9+nCMwKzt8cVOstezTZk1yrmy7KWBVvMLzEVwnTDv7Y2h
	+KG4tcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VmM-0000000C3yL-1iup;
	Mon, 28 Oct 2024 19:51:54 +0000
Received: from mail-am6eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2612::60b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VkV-0000000C3NZ-2GX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X48s0M2yOOuu5YyTpL+OBe3KMg23CCtaHN3M2VB0CxsIapKPnoq0sq0MutebnzbLejbLg53/nUdZ0m9Xs7mLK1XyELGeGanatWt6AkFsamE2XvCPJbTWJsKJ7fI6Hk7ZbDas/me+rtzqul6JNRfTi1rJNscLbmdsoUXU4zIZvgRlnMNkZRAKO25e/WRQG4iyyazvNedLQK3bkCqUiBd1gUTk+Z/8mvuWRsnY0A38WnpdSwyPC8cKA5I9W4CYI0uWgjbDwqpQr8jGnODzgqkms+UhfyFjCs+z4TlMap8lczCmCOc5622fxdcU7i51YPg2oz4GQX7MWXY5X+mRzNwmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7TpTqCaqdOfKLN00EN40+qwgx9L9PJH+T5W92DUvqg=;
 b=kn33tSQe6EENzaQh0GXEE/WmSlGT6tXPZUU6PJSNUZ5ozjdqRSSRwQQBxm+YTog47X5hC7/jpv1uT/Wx38uhri1sWV5tvWx//1MGfUArLG70gn/7tCVS7eMEPaCxLINUbjiyql8VE9tYdQDcRYWO+3urMPAOJFZwtHsqD9UJYAkFVDKs9St0+7vZxduVy6FOdQI7oKdMoMI4p82fKVFePc4/iKtrhCTZTGTot7yuTonN+dB/ovrCOpgMt9xKjDJZUF9BzM171J3WtZ585Khv35nBXcmMZAfXvVWGFyfubzc3uvTyBn3jHytS8aA2+FUJXxWEGqois9lOTM9PZ3iz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7TpTqCaqdOfKLN00EN40+qwgx9L9PJH+T5W92DUvqg=;
 b=fyDn8+uacGrqtMj4isXPxylwX77qQa9wD9vctGgsyxMgL0uZyB3EPx1kLqUG2RP0MZKiD7lXRE0wN35CDJ4w6mZYUluTuqLL/xbtwukteKmlw1nBw6/0cI2+yWDwNrcTOxG2/nMu2p+ulMG+C6qoCc0+JFQtMp5ywapb/YH9CZju/sbjy8KkwkfJ1HIjZtbR0C++YjLttmhKXj8H1lZ7aJEJ3nMXbcLQCUda7jmqY5lCxPNMlRoZyXLtwaJb9hOrN0TwsH0DC7RmI9EoX556FRJYoAbhd2zOe6vWO6dyvGWcmZvlzvqdfEEBmSq1xDk5nHMY54WN8ca39NBnwcZ2IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 19:49:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 19:49:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] ASoC: fsl-esai: allow fsl,imx8qm-esai fallback to
 fsl,imx6ull-esai
Date: Mon, 28 Oct 2024 15:49:30 -0400
Message-Id: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrqH2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyML3dTixMz4tMwK3RTjpLSkxNRECzOjVCWg8oKiVKAw2Kjo2NpaAI9
 CZVZaAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730144982; l=774;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JOjV2Rk6JIc21Ui4il6+EXpfEZJf3ZKIjyQXGXURDpg=;
 b=5GMT7xCbSZjDfYF/0YPOMMHuIYJilPF5QFk0dbEDjndWMGS6J5JeqEW1WkJmdWOB3N+iKxbw8
 gwum+ddzwMpD3y+Xqq1aYxrD0yBxnJT5jJRmjXF6IiQBczhtocheQnG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: b008070f-6de8-47ed-9a10-08dcf789acc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVNlWUxiMGlRQzY5T1FJWTl0bWxTK0pWeDRqcXZqUmNNWjdZbGxoN1RLcSts?=
 =?utf-8?B?YVVJRTBnc01NS3BkT2tiUlpPeXoxMFZMMkxsSHdEajd3RmRMMEIyc2tXL1Vu?=
 =?utf-8?B?a3pScnZQdU9vdjJxWUE2UlMvREhmd0QrOXJyejNraDFnOXNWU2FSeVRCeEUz?=
 =?utf-8?B?TFFPMEIrRlRYZEFxcmFmdy84RzhSd0s0Zmo3eVVUNm5sLzlEaHBBd0pGOVp3?=
 =?utf-8?B?L3JIMmowY2hGQW5YRW9tS1hrRzJLb2hNZzZMN3ZadzhHRmdINlMveHVybWFJ?=
 =?utf-8?B?TU9iMGc4QlVRcmdQMnpQK0FSUFVjSlYrQjQxOVVLbXZvak1GK2VDaDZSSHQ2?=
 =?utf-8?B?MUVnQTh0Uk56YTZ1NTdibVYrUFRNZXRQbUU0NEdxd0MxU3lyZW5ERmNEZE4w?=
 =?utf-8?B?b2pkWjd6cE5HRlhUYUM3NkFjZ3pIb3dFTTYvZXh2dng5bUF6RWtmclA5a0kv?=
 =?utf-8?B?Nkt0MEtTblBVcDZsL0ZhbE9YdmpyVWRMSUJmWnlybk4rR1V1SXNHbDRJSC9J?=
 =?utf-8?B?eUN6YUhuTUYxZEIyd04ya1pVdVlDQXhSbzdrWkNxSVY4RnRUY3ZuQTJwNHZi?=
 =?utf-8?B?TDYxVTZsZTRXRVZUbk5sNTZJZnFveVFMWGg2OTZHRmhPMnVnSTI1aW1sL2th?=
 =?utf-8?B?SHh6ODFXTFA0aWxhS095ZjZKNlREVHpjRnppeDlPRHlyWWlDMmNSa2lLbU93?=
 =?utf-8?B?ditua3Z1NEFJWi8yckdrRDlIdzE1cXUrZDNhU0pNdmtSbitma0F0QzlCZ3ZY?=
 =?utf-8?B?WHljNW1LR0ZWb2RZSVBjUFg2WXlNeHJYSGZ2N2lUK2JEcFhVNmdyY2xFd3Ny?=
 =?utf-8?B?eFA3ZE5iTTN0RXpqWjBaUGE3YUNBSm84dS92a1IyUVU3WWNTSVpjMVVMZ2ky?=
 =?utf-8?B?cVhaWmVTdkFlYmFkVEFVeXRZeERHamxkbEszQUdxQUN0eHR2ZDQ5M2hOTjVy?=
 =?utf-8?B?RUZyeUF3K1gwdUNQdkVoTGlLU0R3Zk9WQUQ0b2Zoall2ejliZ212SXhBVFBR?=
 =?utf-8?B?cGtxTElXamxhbzZaa04zNDVvbU1rY1VvVVF2cEpxZHJob2VJOWRqZlhnZ0gy?=
 =?utf-8?B?RzhCL0lWSmpVbnNvTEZWWVM1TVpTRUtjY0VsdXk3amhFNG5Kc3h5KzJ5b3E0?=
 =?utf-8?B?emVNRDZuVWpYc1E0TmxrSDBDV0JYaUlZR3JzeDZlU3VFcnMrY2xEN1crUTJk?=
 =?utf-8?B?Vm9SeVRpNGl1NUlKTWgvay9QVEY1WFFOQkdQaHdIeWluRzZKY2hpZUpOQ1dI?=
 =?utf-8?B?V1FSWXhpaDJoTFFOemZSZW5jUCtMZzB5RnhzK1VQN1l5V3FUbW5GaVlwdmk3?=
 =?utf-8?B?K2ovaVd5UzNhWjVVeGZlYVkzdjU0c1hnc1h4Syt3MDd6SmtWa3QySFpJclZl?=
 =?utf-8?B?THVaTUM2V3drY3VQbTYyOHZlZCtHcnlxQkttQjRzS29KRmgwbnhQenpCK24r?=
 =?utf-8?B?MFZQYks0c2N4b0ZkNW1ocXd0MDI1Nm5MZXJiV3JlQjEwaGVKMys1dmE4YmpB?=
 =?utf-8?B?d0RPNmJzNHJsNUt2bmsraDIwSTQ1cy90THl0aG4ybEFMYUVYeGsyaUJYbTBw?=
 =?utf-8?B?aGhNbGU5eTJFelFwM2lYMDRMQ0NnWGgxaXVqK0h1NGMxRDFGQi9LbXd3NmlL?=
 =?utf-8?B?YmFmU29HWExRZnNnRFhFNzcvbHdKdWt2S3lvTmx1V2dMdytMOVVQTy9taktp?=
 =?utf-8?B?c09WSWRuUkNwUndRMHBvWmcxNTAwYnBLU1lLU2M5UUpESTRKSHU1MXVhOHJv?=
 =?utf-8?B?OVdQVFpKWTBQRWpMa3k0WU9VUDdhcEpsa2RnNnFNUUthR0hiN2VGeXYwQlc0?=
 =?utf-8?B?a080OG56MWZXZTlNU0syVzZ2SjR0b0w2dGRQekNkeFhDTk15dXFwTFlja0Fn?=
 =?utf-8?Q?I7Y6Bsm4l/nAQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldWSWZyK0JSSjFVUi9OUFFBcUJEUi96Sms4bktWcnJrY01ZQUlvMmtFRnAx?=
 =?utf-8?B?emlSN0xEdENCMFI0LzlSbEFJZm80WlIxOFdQODhpN0ptU2RPUFhPbDZMZ3Bo?=
 =?utf-8?B?WGhyUE1JNUlTOVg0UU5JQjNlSVAzdlFsRDl2TC8vNWxUMWRSUk1VQ3FBdCtD?=
 =?utf-8?B?TnNod2RtWTUxNTJYTjRlYTJnNEovdHIzdW12NFIrZkxOOXhFNXNtNnB3Q2Nx?=
 =?utf-8?B?V2ZmaXJNY3NJeG0xVmFZcUNjYmYxb2lmcUNtbUdiOGJuR0x4dU42ZmcrT0Mv?=
 =?utf-8?B?Z0Jrbml1ZlpiUUJGMkczVU1qZmZyODUwOEFPWnYwd2N0cEp1QUF6Y3V2Ym55?=
 =?utf-8?B?aGdTK1BObXVBQmJqOEdYWFp2YnlHdWVrUnFsSEZzbkNmOHV2N1pXTHRyVDJB?=
 =?utf-8?B?Ty83SmhydlBrMDIzcGxLdmY4dVhwVVlsOFc4cXpQb3A4YUNXODRmemZwYVpT?=
 =?utf-8?B?YzU3eGFkeEJqbnI1dnM0Y2RPUks3VjZVOGd2d1JBUkdwM1pEanhLdUVEWFJK?=
 =?utf-8?B?c2kzSlJDZTk0TzNReWRKY09kcTVheGZkcDFISkhYOEJ1SzdIeDVYQnhNNUZM?=
 =?utf-8?B?VERsNHpmUE5ocUJyQ2swTm5aZm5aNDlRMEVzcGRPeitTb2RtaUl6SytFYUFi?=
 =?utf-8?B?ajBnRWZwLzVmMEdMMllVaXBWSThzckNiL1BhN0JGb3FyWjdGTHZ4QzlyZTRY?=
 =?utf-8?B?VGpSMXZaZFNsalY3L0d6RjUyMFZncUJnQWx0U1NMWTB4QVdoZHZZWEkxbmR4?=
 =?utf-8?B?NFFVSFlsTlUzMXdUTG04eUN3dFZtS0paUTNhTU85d1dsR08zMlc3eFpiQUtG?=
 =?utf-8?B?YnBVTzdHM2o1a1prRlp2WUtCMklNRGJTSDNlV1l3MlA0MG9qT1FTTzc0QXVN?=
 =?utf-8?B?ako4RXR3MjlBRTR1M2pzTmp6Qmg4N3F4dS9EUUw1dFV1Q3hTZnJ4eG5jK00x?=
 =?utf-8?B?MHBHbThBaWZtK2tqeFNpU2dsM3p2dVF0L3NsaUJzWUZ1OEFwZVZOMzBKVm9N?=
 =?utf-8?B?OXh5UW44U0FmRHR4L2ZhVFRUb3E1NndtMEViZkplUDFLVWpFVzcvckFsWC85?=
 =?utf-8?B?a21rd3RaeVR2UVJKbkhKcW8yZFRjeFpGdmFxaGZ3M2NWOEt5YUpiNVl0WFJi?=
 =?utf-8?B?Yzh0cGVmNDY2R2x6bEgwT0Zhb0lWdnBqSC91VlpxNGNFM1AvZ2NVM01nNlUv?=
 =?utf-8?B?R2haaEozRVlYWmV6R2hJWjBwU2loMC9Pc1pEbUNyOEtyVFN2WW15bklRNnY3?=
 =?utf-8?B?Y25rREFFY1pNUVpzdUlSSitzMHg5a2RFTXJuUGRCcTcyWkRidVN4b1VNelR0?=
 =?utf-8?B?RFgyaytiaEpvUEp5amVVazgramtXcFp4ME55UUp3bng1SU1KOExSUzdPdkhn?=
 =?utf-8?B?NzlIRVUrWVI4ZzdobEliTUQ4T0Q0NnFrVkhFUHpoL00zTWJJTmIrRjdZdVBH?=
 =?utf-8?B?c3pJNHRzNWhQaVVuZlhzcXcyOG9pSU10Ty91eENWVGwzeHc4bnk1U0ZyalhJ?=
 =?utf-8?B?RzRQOHhxejU0SDk1ZkFLOFUzQ3BqM0thTy9Bc29jd1VvOVJSM1pIWDdMTk5N?=
 =?utf-8?B?eWlzcFZIdFV3T0o1WXNqbStlVFVrNEZXYjI0dzduU09zN3hnYUtEOERDVWZU?=
 =?utf-8?B?UXorSTBQYytzdXlWUzE1NjZrbThOUGxLOUFJK3QvVkVFWVdiSkF6dDdzZ1lG?=
 =?utf-8?B?SDRHQ2VTL0lQalhwNlkvUzBRYXBucE1Ta1N2RWhGb2lWNFFjRWp5ZXZqZXgr?=
 =?utf-8?B?WlBEb0NURElSdUZ2Ym12Y1ZjZ3piU0dwSnBIU1gzZDJZTlZUSXBQMTFDQmJX?=
 =?utf-8?B?bGZiVW9XcVNSSExaWkRHellQQ1pPSjZkUFQwZE5UZ1l1QWN3UGxiUmtIS2hH?=
 =?utf-8?B?UW1GSmtYY21GVnVJRit0QU5qVlRpcFE3dzZxY0dCbEV1MTRVZVdvQ3Vka0dO?=
 =?utf-8?B?Ukltd0hySGVxYTlxQjJ0MTA2WUtFOHVYVXdxUzF4eFNzdU5CcHV5elV0U3Ni?=
 =?utf-8?B?TGlMQ2NqazA0b3czajFIaVBmQWFBZG1xZEM3UUFGRXo0Zm5wTDRsa3NzTHlu?=
 =?utf-8?B?R1lpSUNBZUFGMnpsajUwd3IvaUZxR2Zyck5CUG5DdnNKQk1OUE4vVWo1LzBn?=
 =?utf-8?Q?YUYtFwjvuUKYJr8JL+21vVAB7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b008070f-6de8-47ed-9a10-08dcf789acc9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:49:46.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyFtBGR642R8Vkr4RgT8a6H+lpWrVpOvpTHE98PSW75kmjoZly5TtqTRfemsc1zkreR8r1rYwb1JUqP5CCCkVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_124959_598579_594A9DB1 
X-CRM114-Status: UNSURE (   7.78  )
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

Update binding doc to allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai.
Update dts add fsl,imx6ull-esai fallback.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai
      arm64: dts: imx8-ss-audio: add fallback compatible string fsl,imx6ull-esai for esai

 Documentation/devicetree/bindings/sound/fsl,esai.yaml | 14 +++++++++-----
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi    |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)
---
base-commit: a63797164b01a78a0b32c8b01c34cce51016a540
change-id: 20241028-esai_fix-d3bfbaea862e

Best regards,
---
Frank Li <Frank.Li@nxp.com>



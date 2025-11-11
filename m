Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 01:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlklTO7Uq958PMpPpj2Kc9/Q0psnuRQ1xj0uSFddDWQ=; b=1BJJ7n9btpYmXwki7He0OOitYS
	2rCTQUU7bBOp8ISeyMebXdaN1gBbgP2W2AuCuSICJnuX05S7m+DQsow+2S6hna+bgVP/XQOLGOYWB
	x43EYWB4nHegdr2/sdxFKbKDgljMi0CTzLMfERsCyTVpG6P/2h1nBUb1VGLlYDDp1gswrFwbW3WKu
	lW2XqJNDJEbdRbuFw8z0Yy6ggb3UTGoPJ1n1nccGU7i68nypZ81FtjUMtTCKKnBr0Jz8P6PqICPLw
	XQDbHlDSMM7QaRvSkRvZNj/uOuzOUp5qLpWlNIOXMzpJltybcCIxFh+yw4gKmL7KejtJ71XY4uNQM
	xPYJTtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdOI-00000006LWc-13q5;
	Tue, 11 Nov 2025 01:41:50 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIdOF-00000006LUS-1RlS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 01:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWbuhAck63XRC8Z2VXlIW2Opw5KnQ3HsegQotOHYuLXjANoRLdJMQZJxPzZR4xuW5BZLlYqTg/TIwSiHEaxq4BNRCBiaBp/sCH9FBy/WNopf9QZiU+b1zzf9XGgPUPwKs4CnArIIzTJDtTwCtF7Qo3fRN5J7mU6QyfMTWINmxT5DyWz0dJmoG6i7bZ5QIMKmI7e7UZvQZVS+krvreOazFhYGEH2est11l3mw+nH3PWMQqrF0RphkQSlUbNwYqSJljdWWkh1m71PZXKa89yXHkY6Y/mAkre9UBYW0w30EnLzLqnomrpOK8nwOtqGS4KhhoZ0mLjNra320p+OGCVpjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlklTO7Uq958PMpPpj2Kc9/Q0psnuRQ1xj0uSFddDWQ=;
 b=lEAw5/m0vspLukGCo23XDaWSpzaPYn3e5VENzxrXXMF3ICsPEUSKEf3HgIlRylQSpI8qPWP8Usun3UE2W0xB7l6AYs5KjCMWaat4+Sl8OcqKEy1XoBXW8KXcnwAcO5wdn5ySumsTK3fQmjVoqTzmDMzxeF/C9SSyq6hDstUxFG1zG89YCgB9OZns4Z/MLKvCfAFAHJYRKmJbJKdXzpjcp3TxhgyiwWwDwbo4SxL/ixvLXJZwRu2CWPDAINnpIxUrDY9XTrUyLdhHlMELJ5lWi2lUlgVmi+QxKaqDWjGB/57oTmEjd2Slo9cR3HyOb6MuXPmcPmFbMuLRbnZbZECJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlklTO7Uq958PMpPpj2Kc9/Q0psnuRQ1xj0uSFddDWQ=;
 b=nnNPi2o89v4SmYt0mSOBtSlVkPAJbW3W4pwmQRX2OJlc++6B0j9OiFoNugpj7JP60DVz4ASqq+4YHwTudg9HZLxRgDnYd6rYlRsYBCDyFe0IZjuT72dQszs8EFnbMHg/bEbgpTOKVNl7koD716/Nu8s0HmZ0CTb/4OK9UJMA+F5nH458saTCIsZHtI1Vr+XqkNGu+6F1qA2QmZlmZ7deJGyr3y/FMpJNFDkXPsy2Z5AxnOfj13+owQ5B3fJauT+Q1bJZg9/WCE/cbZ7OmRQ6UDqmvjlbrjhLdBqa3fRAaSvc0OqPkzgjRPNZGSQg3Kpd6zMhef88KMGLIa55sW3C4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8455.eurprd04.prod.outlook.com (2603:10a6:20b:414::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:14 +0800
Subject: [PATCH v3 03/11] remoteproc: imx_dsp_rproc: Use
 devm_pm_runtime_enable() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-3-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: e581754e-596e-4ea1-3024-08de20c3772a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emFYZktLbnlObnY5WTVPblNSUHpFcmJkWk1yWmlpTEpqN2JIcDZQYjZZNEFt?=
 =?utf-8?B?QzRRZWdFMzZ1T0o5UXlXR2MyQ0VHRWRwOFJmUlFGSlVydjZjamg0RGNkNW5t?=
 =?utf-8?B?RnNMNmNTTllNVTlqdzFNOExBbGRmZmpmNlNHK3l5NDM0TWNpUU10cVU4aVpm?=
 =?utf-8?B?dXRmYzR3SE54ZFNCODlsaFY4QjVqaEpSMXhTazRreTJGeVhBcE9tSkxnSWVj?=
 =?utf-8?B?cnNjb3Niek1pc1g0Zmt0ZkUwaWZpOTFvNGVPeFBaRXRtRHI2a2ppU084ZStX?=
 =?utf-8?B?cHlsbm9yS0o1TVZCTmc1cDFqdUhTVlB1R3oxOGxDbVEzSzQvc0FYQXZHb281?=
 =?utf-8?B?YUgvV0VxZmlCZmo2U0ttTXV6YVJGUllCc1V6U3F2QWFhVHVnbVE1ZFBkUGdX?=
 =?utf-8?B?ZllhQldUdnlhQlJJRkJ0dEo1cW1Wc3RtdHp4ditDangrVEt6KzNGeHBobWU3?=
 =?utf-8?B?eUdYcmp6Z2M2Q2VCUGtONFpPdllXRTFUUFA2ZlY1dXZTd2FYMmYySzcvWHB1?=
 =?utf-8?B?Z3kwVDhKazZsdDJiTnBUQXYxWTJXaEhHcEMxeFNJU1dLTHp6N0J2eThnRTRK?=
 =?utf-8?B?ZEI4WnlQKzA4eTErZUxUZHB6TEtsU1RXUkt0a1djOVhiYmUzV2Z1cmJ1TThx?=
 =?utf-8?B?MG54Y0Q3Wm16ZFNKTEJVa21GL2hwMFg2d24vZFVYbFAvRzIvaFhlNHJGN3hm?=
 =?utf-8?B?QkU3eU90anVoOGVCYjk3ZE1KVnlRUHFwRlhwQUVuNnJob0hVRXZ1ZEhaeFVT?=
 =?utf-8?B?eXBFL3UxLzI4NEg3bXc3WlVTZFovYkN4VXRhVVRaNzlHc3U3dmtDMVUxZU9Z?=
 =?utf-8?B?cm1NQ01Nb3pYWGN6Q1hibzZJMnA4M1lNSjYyMzZBb2xIMlhoR3RoVlBCZjRH?=
 =?utf-8?B?dUsyL2hqcnErNWVVTE1SSVM2OXJ2S25CS2hZU0ovbWQ2MkNSaG9nWjZXSTVP?=
 =?utf-8?B?QUpRUXRkc1QxQ2lDb01sd3VHaTVHMnI2Wm9IQ3cvVk1FekZQbGNyWXg4S2k3?=
 =?utf-8?B?U2JnV1RPelBnUU8xTElGUmczUXZoY0tuTVlLUTdhUzA5c1ZzODNJdDlBVnBj?=
 =?utf-8?B?R1BZWnMzUDJ0WEJucGRCTjdoNC9hNDJURlRNL1dzL2JpdzNzODcwVXZaNFJm?=
 =?utf-8?B?cTBjbVNjUGhsNFFCdDAycW1xRjJlOVRmbllURUtWV3FYUWE3S1RtMUI2NWxn?=
 =?utf-8?B?NE1YV2JwMWhRQlEvbXBibjFvL0I0ajg2MXdpV3JqbFF5VVhSTDFISHB5TnZZ?=
 =?utf-8?B?KzMzRFppNkVwM2hOSkdiYTVlTDh4dFRxYzZQOXAwZDMwaXZtZUlTRkNpUmtq?=
 =?utf-8?B?MWdpdDFaL2pIZ2JzaStHNkphem5uNTZjWFpRYnJKalNNVnlaS1BEQ3JKTFQ2?=
 =?utf-8?B?OFZBZmNNS1RPSXVwVW1sVk5GaktFWFZLK2dFd2tNemxDZzU0R0IzTCtISlNo?=
 =?utf-8?B?SW5tQXN2S3lvMkdVeWJkNnFQSE1laEZkc0U1MGREaTh1aytEa1RQTnFiVlND?=
 =?utf-8?B?b2svT01zdHpENUlvcDVBMlVYQkd1ejgwSEwrM3JGL0E2eTE0a01FVmpQTVJT?=
 =?utf-8?B?Vis5UjZMRkhUNVcySzNqVXFwRUhrUGY5azJ0THFXM0RMbEIwRUNpZGVSVVhM?=
 =?utf-8?B?dkVhVHlTaEFsZkpoNXY3ckNaNFJMcW1oMldkUG1YZ1pWRTY5NTMrcHhZV0VP?=
 =?utf-8?B?cmE3bERZS0RBZVBWMmEvbTUxNmZqdGFjbEdORDI1Z0VWUEdTYUNrY21UMVQ4?=
 =?utf-8?B?Zm5SY3hJMjUzZEFDREFFam14VzlYSmtLaU1KNXhNZ1Q3UVdoWWw1WURvOE9V?=
 =?utf-8?B?RzJFZitpTWxCWmQza3BQMXd2U1o5azZYY0hCZVRTQ2RxNCtZdjI2OHNUaUxP?=
 =?utf-8?B?NFF0Z3FEcndpbmpSZkxPWThWZDRqOWJzZjNWV21LZXp4cWFVb0Y5dnBtbWNP?=
 =?utf-8?B?dFZTTEZtRmUwR0tDdjBnNHZ1ZWJJSlBaWmMvei9sLzgvaXkyT1RVV1RTZmFF?=
 =?utf-8?B?dlZLMklSclVscUVnWXYxNFVlT3Rrd1BjM2IwNVVraHdTdVZwUUVPM0dsaElR?=
 =?utf-8?Q?3dYopV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9wNFNIdlcyZFZOZGxnTFA3MDhnc0hQd2NUNUxGNmMrb0RLYkg3VXIveE83?=
 =?utf-8?B?ZmFLS2pXcjdrWFNEWHhMRkkrbDg0VW9LOGxHS0lmQWsvbkNjcFhOSVJKdVNE?=
 =?utf-8?B?anR0K2tKMmYyektNWnZ6elJNUEtXUlRTNWUveThBUHVsbVRMc0JabU0yWWI5?=
 =?utf-8?B?eHRGU1ZYSmFGeXhHWlJlWEZFME9sK3lQZUpib3ExVnpQa3RlODEza3BHNk8x?=
 =?utf-8?B?U253Mm5hOHFlMUdEcW4xakowMnlBbFdiM3UxV3VETVJpeTRMaUU3THA4Tmta?=
 =?utf-8?B?RnFPWUZyaWw0M0p5UmNvRHJ2YTl3bE9UWU5GckgrbzFXbHlDMUxVcHY1VEh6?=
 =?utf-8?B?OUJIdkNKaHdGNzFUMDZwZXNZMDVLeXFxNTlXc3FVQzRaUTVybVViaHAwZkpN?=
 =?utf-8?B?WGVtMWhQQXRNNTlERk9PeVpWODdCNEl5R0xNZkVkL0FMSlRWVjZpcFBRMlZv?=
 =?utf-8?B?MTJNandPUUM4djU1RW1ZenRlTGFqaHVYaEVEM1hHVktPRzlGZDU3bWNtTC9h?=
 =?utf-8?B?OFpING9lTWJIUDZNazBkZ21XQXJNZHVsSEF3TWNSVDRVdXNlblRvU05Fa0ZH?=
 =?utf-8?B?ZFduTDh5bk0vVlpvZDJPK3h1SllkRWo1c3BWWk90SG4xMHJ6ODFxUllwYWFG?=
 =?utf-8?B?elhFQnFHaGNOaURvMWNvWEFTNEdBWVJUVmpnbE1KSDVESDA0dnZBNWVCdXBF?=
 =?utf-8?B?anFrdG96Q1M2WGU3OTZ4d2NLM2FXOEtlNS9HUmsyaGlTUTBGOU85V21MMWdC?=
 =?utf-8?B?RW1WdGJodGt1ckNzb1FjdzRWMmFhWE5DVVBuZFV0MGlub05OWkRvNXRKbzFL?=
 =?utf-8?B?T1RhWnhHVFVBai9RQUJmamZ3VDJ5WklzU3BXMkdGdnFNUTlqVWIyb2RvdG1p?=
 =?utf-8?B?bWxVTEZCc3V0YUpGdmg1WWRMQjFpdFFhZnBFdkxUeU1Ea2tXWTV4ZHEwQ2h2?=
 =?utf-8?B?OTVBK1U3SUFmUlNMNytRTXFjMTFhb1hnMEN4cXlzM0JVRkRRTUNCa3hYT1Fu?=
 =?utf-8?B?QmRtZzhxWVhGNDhJVDJDM1ppMjZsanJIeGhvc0VIdnQ0cUdydEZNMndJRFg5?=
 =?utf-8?B?YzVFUmZkNHdwV0lxOTJuemU3UnZXcGlVNmJkQkh6cUFTMDJLcDczNUw2Y016?=
 =?utf-8?B?TlorNXlEZUNodmM5QXo3cjRuUnVISjZYRVJJYmc3ajd3bEw0U3A2MlA4aUpU?=
 =?utf-8?B?amVJM1VGUFJBZGFucUdhTWhld0RkK0c1VmFUb1h2MzFXUnM2ejRvcGdlckV4?=
 =?utf-8?B?Y2JYSmpjcTdKL3VKZ1VwNEpnVWYwZ1Q2YU9uYVZYM08xMkttczZIejk1eDhB?=
 =?utf-8?B?UVR0clFGNVQ0K1FjeEVCd3RpYXozU2p2TFo2QlpnZTE0N1V6V2NyTU1Qdk80?=
 =?utf-8?B?b2pSTWc5aEVsYVFQcEVRTE5BSXJ5bXg0eDMwU1N4Q242dW9uMlFJeUhnQVhI?=
 =?utf-8?B?eWd0ckFRT0ErSHptZ0hzbktFQ1lyNHFicHFManFuelJuUEU5MmN6R0Ntc0tS?=
 =?utf-8?B?Q3VjRW1XM3lmM0kwaXVmcG9UcFlLK1BWV3dCZWcrZWY4ZCszRFhDZ3Z3SC9S?=
 =?utf-8?B?WkFqVFFScVJoQ0FtdWZ2UUNubmNtbUlBL1RHUDlXTzYvUjVNQ3lGbUMrSTVi?=
 =?utf-8?B?TmRZdG9RNXpSYk9xaE5pNDIrTTlDdjcvSmRwYXgwa1Rkd3U3eHV2QmpnUTRT?=
 =?utf-8?B?eXlkZTdlSHhnMkg0aE5yUVhTYkJXK0tIbm5EUUFDUm5BUXg1dW1zK1kvY21T?=
 =?utf-8?B?SU9RNlVJRkdvV2lmY2M2RnZselRQQy9PcGRXSENKMElBS1ZUaGUvaVFpYmdo?=
 =?utf-8?B?bjUzWFpZbS9lamtaZVVhd1NRa1JlWlhUUU50WU92MDZpODhBV3pQdkJjVjRG?=
 =?utf-8?B?My9ab1R3NEczR0o4Z3crcmZNU1lWOXhiVjZMclAybk9BNXc4am53d3RnSTNx?=
 =?utf-8?B?K01Ba25CclpNSnJNclEyMDJ2dHpGR0RITkREL1Z3MFhhOEVaRTBSaEo0Y1ZX?=
 =?utf-8?B?M0FiZVQrOFA0TUgzTXRHUVlJTlpva29vRHVualpOamhpTHFNWXQycDNzSWVI?=
 =?utf-8?B?OVExWU9oT2pEUXVpTHRETTZ4RE5uaUxYaUc2MVgyNVF3aEJPYmJRaE54QzN4?=
 =?utf-8?Q?2oHHKyc4/R6+5+Lekhaa20Y0R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e581754e-596e-4ea1-3024-08de20c3772a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:42.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgnvO7sIGDDLgEtOz16BYPl8hygzjv9u9XaaPBX8z3NEVFwMd8r5iiLJEEacsh2rGKt94cv74pnDDXgv7QAPBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_174147_399449_23AD36CE 
X-CRM114-Status: GOOD (  13.33  )
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

From: Peng Fan <peng.fan@nxp.com>

Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable() registers a cleanup
callback that sets autosuspend to false and then disables runtime PM for
a device. So, basically the same functionality as we don't use autosuspend
anyway.

As a result, the .remove callback is no longer needed, reducing boilerplate
code.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index df6a4126538d22ff6e02145edb5ac13c2d72c949..f5d0aec52c56664d6074272e276edb0c4175c9ea 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1200,17 +1200,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void imx_dsp_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_dsp_rproc *priv = rproc->priv;
-
-	pm_runtime_disable(&pdev->dev);
+	return devm_pm_runtime_enable(dev);
 }
 
 /* pm runtime functions */
@@ -1361,7 +1351,6 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,

-- 
2.37.1



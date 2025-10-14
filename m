Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C19CCD190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVD9V//Wy6Qk4NNboeqOxlN0/tXTHoXEuzGGy1VUR8A=; b=JBGp9h1hAwdN+YSblr9eUiWWMg
	tBY1giBUwE0IMIBQeD2rcm+XAjXzxKjJUk4g1zJYgQAD47WwkihzvFsEp2jTohTmbDalmiK0W5TBy
	LiebdLR08jvUwHiovY2ndDguAIXx8pBhZfxyExgI3XwRbu5qvzqOXGW2mLvOqAp4ZIvhBgDyOZI/O
	qgRFXwrETMh0Ut39igeXKjRC2NfShIHGcOM5BL6XlAgwOs0h9JIdcgWf0cbcq0kWAGKP0RC7G/u/K
	HQAfBGeeLT1W0B46lvm7cV7SwPtqo8hZzMfyJYUCnCilgOmVGza4n0F3cYiUaLvjLy6tyDr7Miiug
	j+VZ5oWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8X48-0000000F962-3s2u;
	Tue, 14 Oct 2025 04:55:16 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8X42-0000000F8zO-3RXh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 04:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxRMVG+qVjlxQrOmPtZGe9cxlN/doLdnCFIUQRcBtFAnJT+e4TmYVECxLijmx0uMXyv9zHptMkI3fDvwqHXVWmiwSoiTzqdgnQLmgYhmCtIUTIZcJbwbV5nOOyVMvp0g9e1rqTYxbzuwIuFHMYswtsGWqWTG+HqS5lHkVPzn9uvJynMtQrvBrvIs1HRvu8+FeuTDdnGDyO2KnKfuK1s2RVVTnQ9+fgfi3jP+iJiY1vc/UOk6IuIiut60MsrzPfBRjFcPZfsOhkH42uPKgS9gRqK2qyQdlYeAcCnvaiZtDObo+M0xTjFG5X5nRhzqkTiylkZ2+4dZJbxetoOU+dN+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVD9V//Wy6Qk4NNboeqOxlN0/tXTHoXEuzGGy1VUR8A=;
 b=yvqbCoTu//K6Eb2HgaxCRbfRhHootEXjPpGKcIShNhRbfz+Nvh9ifi3GFq809N3yiM0NXtG6TCsDwzs7g2LyNULAGDABmIuBtdIInodv5TZpIBqY2vvGHoEq4UpHJDneRA7zbZIam6jzAEX1HglWQJdMjyHTdennuV5s4C5Or9m6/WTWDV9ITYMt3ysqYYcqXGdDbNCBoneufa/F9I8td6Uy09nUuWL83x3tScFFQkTrXDurCMl4c5AVLVbWMYd8ou4e3piTnO8Cq5MwskN/UqLg6DPYkd1DK1YTnjiiUlT6Qw3Vr6e72lusrvX2JN5r9BxQEGnzI3qzezTvXbyNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVD9V//Wy6Qk4NNboeqOxlN0/tXTHoXEuzGGy1VUR8A=;
 b=NuaRu8iwm7YEBkSggtHjGHk4llQqrdLRrYqZGmrsaRfivYf3iSqv2nh0PELsABwCBrEtxgx6q8h32No83BB79w70zgXFSbRqRoQS13U1TIcch1CEnBOoAA/xncaGzwBzoJTW+SRyRbYvITbUnpip+0ZGwlHHqBeFkXN+C8lQSJ0TKH3akkfOEq/IoET3snXdMHwbB3XRYKBE0pyylMfjxKrCV/nPDpPVsQKs1Z14lD/qYdynNc2q5UnVJwKcrBWLJJ7qIPGGnlBg/9Y7hC69tnPvWl+TjrHtMPfOx4ss2KVhUQzdMhVa/Q3Ga1/bqfeWVbatJZCHaOZO6sVu6KXVqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 04:55:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 04:55:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 14 Oct 2025 12:54:40 +0800
Subject: [PATCH 3/8] firmware: imx: scu-irq: Init workqueue before request
 mbox channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-imx-firmware-v1-3-ba00220613ca@nxp.com>
References: <20251014-imx-firmware-v1-0-ba00220613ca@nxp.com>
In-Reply-To: <20251014-imx-firmware-v1-0-ba00220613ca@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760417688; l=1258;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=j0ujQNgY/TWP/xIL5F1afddv7DXZMWsK4K+7CEEVrXE=;
 b=/txDpBzOZ0A/2A43urQgMBWmxgMz43ho1oYkrRb1DiB2Gg1SZ2kX9T6mSB5A4Aa71sBjormcp
 /Wvq6roBB9bDoFMMs4g8eiLsg/DdVL8SAOwkP01YiU3K1LL0QMUt52I
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af01ccd-0860-4e06-063d-08de0addd78f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qy9vSU9jakZaV1ZrZUZlWU9VNDEvcFRKU1I5QTZ6Qk1TU3NKaUhzRkRKVStk?=
 =?utf-8?B?bHZMdlc0djZGcUhKK2taWFlSZnJIRFFkWlptTVQwMlRVWGRMQVJxMGI2cHpn?=
 =?utf-8?B?MTFWNi9NTlZCUEJWcU81dzRpSnpWTzRqd3pjWm9OdVBlaHNnUFRuZk5CZFhH?=
 =?utf-8?B?eVBqWEdXa2xLUjQvVXhPUEZjZ09MUmRNemIybHJRNWhIenN4NzNBSi91ajhG?=
 =?utf-8?B?eTcvdnpoblhhWUswdGJxQ3prb1Z6c0JpMXJUSGFEWSsrZFNORDlJVWtTSXpO?=
 =?utf-8?B?Q3BZSmZIRHk5cG82dmtPSkRIR3dmMFJkSWIvVlk1WERndElCeEdBNlpWSDh5?=
 =?utf-8?B?TVRjZkw0eUVJLyt1ZWlLMmxMYytTbUgxVkpzS0pTZGZGRlk2dnpZMXBJOE83?=
 =?utf-8?B?WWNPM3ZMUXRrTjNyNkxYRC9PUGttc1hLcXFySUlmbkhiMzhSSmdVMnBOdy9M?=
 =?utf-8?B?MnNpSnBDa0pBVWZMTURNdEhWQlhFQkZ5aldEa1prMDFYb0tVQjdtYmFXeGtL?=
 =?utf-8?B?RjcrcmtZUTA5VEtHQVlvczVyaWJuS2w5Z2RsT1NpUnZudHczRXdWeUZpYWxL?=
 =?utf-8?B?ZzNsazFYYVJBNUJObTNuaUVMT1F6enRmTTJnRGVySkZXNDUxU0wyWkM3ZEVl?=
 =?utf-8?B?T3U5Z0pKOVBadFplbVdlYU8rTjVzVThTeUtNeCtZczZzZm1UTXlja1pZM2VG?=
 =?utf-8?B?MTFGcDRiS0JRTnkyM21tdDVJVUY5cHhtYS9adTd3cUFhWkJSTGRYYTZBZ2Rh?=
 =?utf-8?B?Z08zV0k2T0NuaXZQUTU4Q2xXWUF6WHRyMkNTMkxBOTZtbDk1cnNHTUVMZld0?=
 =?utf-8?B?MS9zb0hQdWlaQ0tjSGErayttcXBIUFhGT2hWQjFDb0pja3hldHNzd2NTdjFQ?=
 =?utf-8?B?MjZqNlJSUTF6b2RTa1l1cFZCZi8wQk5JbUxTSjRsbTdra1hnbzVCVUxRMElr?=
 =?utf-8?B?ZXRhOVlmSFlzK1NJMWR5TVdkY3BzSkZjV3pQSXRQL3UyN3A1MWpLckRBSjNW?=
 =?utf-8?B?Q3M0QmE1MFd3VTY1SjFhVkk0R2o0MUh6VUQ4YVVqNHR6aXRBdUE3YllQN2dt?=
 =?utf-8?B?VG93aGZrM0ROMGRhSjJsbTU0aEZMTE1ObXdVc3Zka0VQRzJHcWZQKzFidVlH?=
 =?utf-8?B?WmFxTDBSSnNQZkRxYTNSeHN4TDBpemtQeEpuYys3cFhYMXNob2ZWT05XVENS?=
 =?utf-8?B?eGtUMU9RYXFmN21FRDUvNG9vVDNlb3E2TkZwYzdFNVBmVTdCUkIxYkQ4YWZh?=
 =?utf-8?B?YU44MUZHUm92S0srOTJIUlhHK1MvYlRSQXBTbDdvbGh0b2ZOQXQ3Yllla1J2?=
 =?utf-8?B?dEIzWERnZlFNYkdDd0JYa01UV09HVWd3V3RWQmR5MDB4aDgvSmVWTSsvMWkx?=
 =?utf-8?B?b2xjRXRBQmx2OWFCSWdBcURxQmlUSUJvSTNDbFU0aU9hT0JLME9oU25MWk5x?=
 =?utf-8?B?WUN6Ry9MUTN5cUMvU2d2bENMa0tMMnY0QkFpMFFiTE1hS0lTYnQzNVR5WERD?=
 =?utf-8?B?bWVBekwrMml0UlZBSks1VCtxVklZZlYybFBlbXRTR3V5NUdnVk9vaUJTOGNp?=
 =?utf-8?B?Um8zaWltSS84ejRZQ2R4bFZSZ0RPRUdENFdqTlFaR0V3dVkrdnlkdFBOa3dr?=
 =?utf-8?B?eDhzMWpQbVI5a1VWaThmUUNUU1h2azlXeXg0UHQ1KzZPRG54THVMS0NiTHVE?=
 =?utf-8?B?VnIvd2Uwbk0xSkgyMjJ4NWdVZ2FtcGd5RWE4VUhPSGRXNkV2aWdHaFZDYW1Q?=
 =?utf-8?B?Y1BscENBSmlQU21HVkNIVjRNcE5QOEtOd0F4YlhhbGl4U3VBWHd3VEVtd2t6?=
 =?utf-8?B?K0pCVEh0Z0gxVXNkQ21QYjlhV1pwNmZVUEJDc2lsS0h5WTNQNW1qWkJzblJm?=
 =?utf-8?B?aFJ6Y0IrVFcxbHhCYkVpaUFKRi93RWdsbjhHK3AzalRNSkpUK0dVYnNOenNu?=
 =?utf-8?B?enNnRmIzZEloeDV0cVdrOXJ6c1k1NjZvNlprSjhNeGQ2Mytuakk4Qk9wY0Zv?=
 =?utf-8?B?anUycjNCc2VhekhsMW5YNThJNlZ2VkFVWFN3UVNlMXNpZDV4aWdaVUpFdUR1?=
 =?utf-8?Q?36CZ0E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tnUG5NSHp6cUxLNEpiNjZxZVZZcUdyRWxNUm5kUDM1S2hnRjkycjVCTWMw?=
 =?utf-8?B?dUFXcThtbkZrSS8yTHNYT2hoYjJlZ253WDFWdDNxZGYxYmpzZHNnYS9Fa3Y3?=
 =?utf-8?B?VjA1QkRxTWUvQ1hMazhWaWVtUDRpNWkyd2k5TU5YTXB0WXQxZm83VXB3eGtu?=
 =?utf-8?B?K2E3YXo5aDNWUlBjdnhBWkNld0g4bkpoQjNwT3ArWVpMNkppSG43N1dKcks1?=
 =?utf-8?B?TFdGNnlLYUU1SVdNUnN2S2Q5MGpFbVFYa0RFOER3aGRJWVBVNnljYzRMd1pm?=
 =?utf-8?B?YmVYTVJOQ0Q5bmpLMjVQaFJka2MzNFVWaEtNbjhtc1BjOXZuRzFIUFVzOFBW?=
 =?utf-8?B?OUtKNXJ5NHEvWlNVZUtWbURndzVNUXlCWmpCMURvYzdZamt1b1FCZGpaRG81?=
 =?utf-8?B?RFBjeVpZV1ZBdTlBMGdSWStsMmRPQUZHYS9Xa3o4UkljakF0MGtacThzb1pN?=
 =?utf-8?B?N05ZNUQ5Y1RZbFdxa3pBTjJFN01YRXJBWDJUcTdyNGkvbzkzc0x4eVFYcWhK?=
 =?utf-8?B?Z2lGSU10QUp3R3duTHdaRVpIUklodThDVVFTdHQ5SWJLeVdNQkI2ak1tUTFw?=
 =?utf-8?B?THllTFErdUxyc0ZUTUk1ZDhnWnl3YnFPWHR2aUdQNi8xcFRPRksxZUlXMkhl?=
 =?utf-8?B?UDcvNURja1JjK2Y4WmtXblFPd0YySDA1SDQrVUZ2akZUME9iVTM4UG0wcXkz?=
 =?utf-8?B?a0huS255UXZ4TGVXL1NZWVd6R0F6MlZUcG5HRGJzYzU4Y2d2dVRESW1ISkUw?=
 =?utf-8?B?K1Jrd1kxY0h4TDdlbHhTVUdjWWFtR3BjcnhGbTM3VTJ5SlJhWUE0RE5hTE4z?=
 =?utf-8?B?OWFJZlFzS1NQdHIvUmV5SDlGVzdPZXBIMjZtbUdHRHVHZDBsNTdtMjBFbVE5?=
 =?utf-8?B?Vlp1SHpYV3MwdkhFbms1M3B5OCs1TWZXZUpFWHJiSDlvY0RNd0tpUEZqVlZh?=
 =?utf-8?B?M0gzeFRuT1UzaStUNWkxcFlpd094bXA3K096TWhhR3FSbnhTSmJIemJsSVda?=
 =?utf-8?B?L0xVc002RkI2bG5hTXVNdDNtMkR0UldML0NHbW9lbzZwV1ora2pyNmtmZHky?=
 =?utf-8?B?cGhOckIwdFk5SkFmdnhHNEtNSHoxM25tSHp4ZVUxRi83VFltU3hZZHlRYWxx?=
 =?utf-8?B?WE8xaGU3VjNxUWpJd1dMeisweDlUSkJDLzRlT0ZTbzZ6UnpkWkliSzF3Ui8y?=
 =?utf-8?B?SW53NDVGUEcxb0RHQVVTMFNkdSs2THY2aHNUVVd2eUo2NmxldkJRKzdWbFI1?=
 =?utf-8?B?cS9zNGJJZDY4UDN6MEtRbnJibHBBZFJNYVpEYXZleGlwaE9sMEFVNk5pTW5q?=
 =?utf-8?B?V3BwWlViNnEwSnNEK09SYk9tOTVlUllQRXVjVklyazgxSkVtdGdPOWRReEgr?=
 =?utf-8?B?S0VibXhJOUZldW85UWxpMGtNLzhpYk03VWd0TWEyYmhzZ2ZhUytia1Z1c2Ny?=
 =?utf-8?B?R0R0YXhUM0lNMCtqMXU1NFJPK3VSeWpJbzVrU0lhL01pNzlUc0U3UHU2RUJn?=
 =?utf-8?B?M0pZZVlFZWthbE54RU9oSFVTMHVFSytMeWFDQWwzTUtJU2duSEQ3TnJCdVFJ?=
 =?utf-8?B?ZUM4dVBrUy9semM3UnNIaUJ1ZnhROWhEMTZTSmtlN3I2K1VmRnAwa0VYR0FI?=
 =?utf-8?B?S0ZtK2RCTE9GOW93a0NBQXl1RVlPSEN4N2c1VVpBYzNiSmxyRlR5Z3cwOW5T?=
 =?utf-8?B?NHRQUE15TFhCUnh4TEZ5ZkpDRCs3QlBOZXNDNVl1OFJhVE5lVDNOVEJhWDAz?=
 =?utf-8?B?R1hPUG1GaG9Ob1I3WG5ZbkhlTy92djE4YVVEZGN4N1FKeVpwT2t1c1llRVg4?=
 =?utf-8?B?SzFtL3JudlVJYWVkM3BPVnZPejBzZGVZd1d2cVVLa2tNcDZPZmxzYUNPam9t?=
 =?utf-8?B?bG9yK25XcHZOR3FRV29Nd0YrbjV1WWJ1ZGNKVDJpVlBhVURhV2pydjNHTVNQ?=
 =?utf-8?B?T3pFZ0g4K2ZRcHJUbUY4Ri90QVZvTEVkajFGVTBvZ0I0Z2lZL3RlWVFLd2Uz?=
 =?utf-8?B?OHFCRTViVjhnZXRSZVJMZ0RVVStMQ0tld2NFdDBFYUlrV2dQV3BQMVEwOEZj?=
 =?utf-8?B?d3lWMkpWczMzd3lhV29vMi9WdnkxQzVlVXJvdjNGOHdxVkxDVHJXL0tuZm1i?=
 =?utf-8?Q?FSvUxlG0q9QaTV368U8v7APet?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af01ccd-0860-4e06-063d-08de0addd78f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:55:05.6298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKwvem//4dSgWNR92Ic0uZaXw+Ze4b16usbef8u9V6Xry9HYiJ9Qoq5DkV7NEWdKe/csx66je/FpqvQLvN2lVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_215510_890116_36CCBF9B 
X-CRM114-Status: GOOD (  11.65  )
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

With mailbox channel requested, there is possibility that interrupts may
come in, so need to make sure the workqueue is initialized before
the queue is scheduled by mailbox rx callback.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/imx-scu-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index 1fbe4c3de5c1592bfcf2334a83776c25d5ca7a3f..a53ed2040c0cf7065474d681b2eb933a15877380 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -214,6 +214,8 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
 	cl->dev = dev;
 	cl->rx_callback = imx_scu_irq_callback;
 
+	INIT_WORK(&imx_sc_irq_work, imx_scu_irq_work_handler);
+
 	/* SCU general IRQ uses general interrupt channel 3 */
 	ch = mbox_request_channel_byname(cl, "gip3");
 	if (IS_ERR(ch)) {
@@ -223,8 +225,6 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
 		return ret;
 	}
 
-	INIT_WORK(&imx_sc_irq_work, imx_scu_irq_work_handler);
-
 	if (!of_parse_phandle_with_args(dev->of_node, "mboxes",
 				       "#mbox-cells", 0, &spec)) {
 		i = of_alias_get_id(spec.np, "mu");

-- 
2.37.1



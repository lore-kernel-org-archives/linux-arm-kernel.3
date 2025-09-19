Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CBFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+MGWodz/F7rnExLr34ZRUd3EYe9rXeIMIaYCRYRDLaE=; b=YvP9E3NyKFsu519JGZEEuTj8A2
	SYAysnXBES4sGoo9eWerF+m9AspIs6/IHR2TEfVkjFf6mSOOD6hZTdzYhWQNh4wdOi1wLrCQbMzzG
	ED7Z48+b6glX2J4B49Ecfyy/KrfVlYMj9Y2gjKWHl52VoX18Dr7tAsFcunLzQNlLt/NbgAOzhVxus
	lBm/RWF+njZzOw4MefUKw+Fz90MB8FWqYSZ9OBVfLIl0lIja5YTP/EGnka0O1wnHRbS+sWgzLY/WA
	oaXQnXxKLX2oR4NyaXKyAZISA86IYed626XZwMxYldmVzCsF7UPKIv5rYXXiFjNF8Blxm6J9pr0Z5
	xxP9BwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXuR-00000002Tco-3sMH;
	Fri, 19 Sep 2025 10:00:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXuP-00000002TbJ-0hUg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkoqFNCuSgvNuKYJwUw3htKtbQfoBT1womb41adof3F5BbxuR5qoW6DvohwJmiwCwwDEioFuws2A782uwW8wJhAcrnYZVPwOr24PCi6/fkLNEnHVUTO41m9qZRgx2XCtHluBpPt5e96XBUynY6kJHIgHpisenGFwHk+JerMRPl9lEQiXaF4eXtTuJhgmMtU/3XMxnXyvoia9qkD8DPOdV7e6C0nczmDRZNTKiXwHR/U/1kLLNXntZgoT8N9P61An9DUQ+Dp0ixR8tVndEBrICPzrsKMEhijXuyFJi8rUBdkPHNBn5H03Qrs1jkb4FDwT+ASLFK0ek5wqPLHlWr8CuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MGWodz/F7rnExLr34ZRUd3EYe9rXeIMIaYCRYRDLaE=;
 b=i8uXKFmYnsv8CeXgaC/X3F9ZnBBzHTr4JjqBFll5eBlGjm4z5PL46vJHe8srpl1vLY1jf5TU35ZUjSMvxl6ID4N8gQLAAyHYMzINbg4Y49z/DzeSWROQJBVKuesH6W+ZSK/WmAeBwhG3nKvcMBB+QhPLxZxBiwv7JSUZOaIHOkGZ76mm/BRPccB95+TEckNwcKu5ANGR9kUMVkhxXivNOxZx6A7ZZseWxyGY0Vh5vb2IYEM8jWZt1Zyar8W9jU7/lJbHLW1YRif7H84gRRtwq79AY59Gp3vxSUTmVwJ/iYAztl8IG/dxUZS6SIQHD06AFC8fVtHlPCYUb8ggni3rtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MGWodz/F7rnExLr34ZRUd3EYe9rXeIMIaYCRYRDLaE=;
 b=BSjN6bTM8EMD4wSIBl+2RWhmzFzYMR2O7Drh8TT2M33mVepN9ha3mxBcNqajeMuNOhbSKOYFaEbfn1vKtdhMGSyAiVDdBG8xITEfgYC2xEvOwIv67sGDtTG3XKU6nfH2qRAk2hH3stFStVfv1qgY0u9sZlHAt8E6HYAnujQbYu+wqtOaXMKJ4ygaL+r0X4uRbvt67GnYevZeutVyiPq6oCpZtNA0x4vSKG2ijMtWgRiIfi6J65ZMdTPWit6m/B730dHQn2QooVronhB8FsJehrfrs4XPP+YmEpRbO9XgZ7aD4mHNRwYvquudVETNs2Xf5ruKSZviVXPj//gTLXS/lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB9112.eurprd04.prod.outlook.com (2603:10a6:20b:44b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 09:59:51 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 09:59:51 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Fri, 19 Sep 2025 17:59:42 +0800
Subject: [PATCH v3] arm64: dts: correct the flexspi compatible string to
 match with yaml
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-flexspi-dts-v3-1-44d43801eae7@nxp.com>
X-B4-Tracking: v=1; b=H4sIAI0pzWgC/22Myw6CMBBFf4XM2hpaaHms/A/josBUJlFKWtLUE
 P7dwkZNXJ57c84KHh2hhzZbwWEgT3ZKUJwy6Ec93ZHRkBhELmTecMXMA6OfiQ2LZ6LUpu5UZ0p
 VQzJmh4biUbveEo/kF+teRzzwff3fCZzlTHGpKtOodMrLFOdzb5+wV4L4NqtfUySzQqEbiUVvy
 uFjbtv2Bntk/+/eAAAA
X-Change-ID: 20250916-flexspi-dts-24af8b6bf468
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michael Walle <michael@walle.cc>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, Han Xu <han.xu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758276006; l=2407;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=KYvgI6we/5L/KN4qxgkpL85zS3zcOEZSHqRfMzEB4Kk=;
 b=jL6COX8kMfQzycsSZmshppWfhML5Lf+BU1TK1RkNPaXQQE7s1t9Jojo5qdTcMMOVO4xPmBrxC
 BF9BadisRCzBCcbcip2I6j3O9kQ5LWzhcnbMmfljUEgwtzM4Tao3Ru1
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c03f859-93a1-4536-c511-08ddf7634649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTYzOWg2ZzhFZWRmcnpVQUo3a2o0bERmTU1STnBrZWprL2FQOXBxczVUTEZn?=
 =?utf-8?B?OWRwRUc3QTBzRnZsNDk2amExUVhNaUt2RVNmQlpuVGRkOTFCZGwvWCtZY2Ex?=
 =?utf-8?B?SUpyZThDcVBSVkIvd005MlBwVjJnSjhldTJVZ01TMVdyVk5BN2VuLzJVemkx?=
 =?utf-8?B?UzBCcUJhTkNIK2JObjBhMlZjUUgrMEEwVXRJM2Q2enBGZnNjKzdIREdBSzZL?=
 =?utf-8?B?cUVGcnkrYUVLajU4bmRsblc2eDZBOWEzTEtpUGNYeWZkNW81YkhTTklQeFpq?=
 =?utf-8?B?R2xFOWhZSzFXb0V5emRtOGVtTk05UTI1SVhrNWd0WTBGVHo0ME1kRE9XakNG?=
 =?utf-8?B?M3U1eVRmdTIzWDFjMG1xS0RDZjV3MHdyUmxsMEZrdllOeC95Qzg2R3Z4OEsw?=
 =?utf-8?B?UUd1cWUwN2l1aVpqYmU5LzRTS0VhNjRCUHU0WjYvSG5mb1lHVW5qMGYvSjZM?=
 =?utf-8?B?MjVFYVhHSk9YWlhOT3JyWVVSMktObmdHWnFEWnR3azEzN2tOcm1weklHWGZl?=
 =?utf-8?B?MDJnY1QzQndkcTZMUmd4NGhKcGVvVW9HNGMzNFNQSGk0WW5pMGpnd2M1MG9T?=
 =?utf-8?B?ZjhaY0tEd2lOYWhzNzhhZk5uczk2a3ExWXF2Sm1HbG1nenU1bDZJSXdWdzVY?=
 =?utf-8?B?bHVGNDRTVjdyVVVWdlFvaFVCY0IrSUZwMGVNSEVRVnluM0hjZ3ppL24yZGZV?=
 =?utf-8?B?RS9vVzdDd3NCMUs3a1h4NTYwbUg2cENtc3FMcW9Rc1NWWklzMFYyVk9VSEJ1?=
 =?utf-8?B?UmZUc0JYMUZlaGR1QVQ5V0N1VUIrMnhpL1FKbjJjdnBpMnNXViswbkxtUDY2?=
 =?utf-8?B?WXVqUnhiMGplU2NqRDAzUjlUZ01ZZXZIOHpDelJwME96dlRodDVrdWNUbWsv?=
 =?utf-8?B?bkVDeUdraEFmRDFQYmtkWG5ocFNlbVJCWkxKdHVJVVVhdDRxd3U2VHlhSk5D?=
 =?utf-8?B?SGRiV1F5d25aYTZZZmk1dFl2UmlVaXR2TXFhcHk1MVVqWENJSTYrUFZHRDhR?=
 =?utf-8?B?R2ZnQ3F0R0hxbjI4MGFyK2VPNTM3d2hWT3U4MVRGWnhMQ2RwcUJTOUNxSWtG?=
 =?utf-8?B?clAzaURVWHJvUnJVZ1ZnZ245VHI0RVBuR1NMbHg3cnNjcXlVQXE3cG1Pdllr?=
 =?utf-8?B?WFcwYVBlaXcrUEd3R1BtbmUxTDc3ME8xZmNucHlPZXRBMDVabUZwTVpMNzZV?=
 =?utf-8?B?M0dzNzlPN0ZlYTdBRWVLUHZaR2h4YStVRU9wUkNSZUh1NXBCMUdXMEVJd1A0?=
 =?utf-8?B?YzVzMzRqRmltTXhHbEhTcVFwbERIWkNUYXVCQUxMY253QjhOMFU2TGhOUE1P?=
 =?utf-8?B?V0k1MVFmdklTOTJ1dW5OL0hRRlVRTHkxcFBTNzhLUzZkd1V5cGJpQldUbUpY?=
 =?utf-8?B?T3FjMkg2a0M0cjRLOWVZMFdPQm5XTWFTcWxla0JWMVJDZ2JXczVJMUFjRzJ5?=
 =?utf-8?B?c2lRZW9pNmhUWHMyOVZFeXdudjc2UXErbGpNei8xUEhadjBQNXZlSXB1dmd1?=
 =?utf-8?B?QlJVV2VLdklSYTR0MzVlcmsycUtra1VRbkV2LzB0Ym9JLzlOcjhWeWk1Qldh?=
 =?utf-8?B?ZStubzRhOVhmemlxM0VaMDJkKzQvSWxCVnJQZGZBUUw5cTMva1d6YXBDNTA1?=
 =?utf-8?B?ZjBFZmRWTjZmNkNRSFRtVXB3QTlpYjRnUG4yTUpvSXQ3RExNakpESm1wcWtu?=
 =?utf-8?B?emZRWFI0K2dOZk5WVXJoNkJPa3RUVml1Q2w0SFpQNm95S1ZIWk85VXpYQ2Vn?=
 =?utf-8?B?cDh1dHAxcG9HYXB1djVWYVhmTTUxbjU3RWU4a3ZFbXlFeEpaT1NpQXNlK0JQ?=
 =?utf-8?B?dTRwc291WEdISWtPMFF4UDYrU1VTUVh2Z0VsV3RReHJEMU1MMEtiOTY1RS9D?=
 =?utf-8?B?VkNSeHVwNGp0WDFEeE83YkJKazFSZGRtNmFNVk5tZlhLbHBCTXU4SDZrZDJy?=
 =?utf-8?B?bURJTFY2UHZMNVE1b0dtenpmMVhjaXJjSkc5MFdld3hYRUZVeHpEbXFPSWNR?=
 =?utf-8?B?SzJ6UEpmbWRpekRRRUZNREJoNUo0TjA0RUR0bTk0Q1c0SU1ITTEvRGFxcXlJ?=
 =?utf-8?Q?btsBzY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXNhM3R6QWE1RHI4cUUyREErY0tqZ01MUzE1VmE0SEpPcDlGQzdKekhZY2VJ?=
 =?utf-8?B?cUkxb1RueENyS3FlSWU4U3VUUXpTbElEVFBpaWtxWFBPSVU2QXFYNm83alZi?=
 =?utf-8?B?S1lNaGhzSUxKMmR5V3VCSDdqaTh2U1I5Y2V6bXpiWndRRTBDK2FJbDNwekxv?=
 =?utf-8?B?WWxtREdjT2RaN3pUWmptdmYwY3RnNmRGOHZFRmhNS2NjQitGUG1ld1B3MVZE?=
 =?utf-8?B?WjB4QnQ0eGN6UUZvREsxMnVSOUxZbEZMZVZTS0ZLOFBHVFBmbFRqb3RuT0Ew?=
 =?utf-8?B?YjJpeVVya2xGeDFGQUZLZ2QzSTRLWW1XWk5XMVVnU3ZkMjM3dXJXUzZRTVVI?=
 =?utf-8?B?UlpSN241K013K0NHd0ExWjZXa3htS0pneEpCZGFJNGJtNDZ3a3grTHNHQy9L?=
 =?utf-8?B?cU1WV2FINEtHUGpCM29WREtMc3Mrb1QzandxN0dFTlNJb3VqTEdUQlpqVTYx?=
 =?utf-8?B?MDI4cDZaa1MrZ2ovaExJN2xVb0d1cTEyZFlmN1Z2Q0U1enFRUTQ2UWkzWlVY?=
 =?utf-8?B?QUlGRW5zODIxdVlMUzgzcGEyc2NUQ0M3aGxkZzVkdTIyK2NYcFN4OUpUYTFU?=
 =?utf-8?B?QTNjWUZGbHZDU3B6NnBjdGhadXVkdGtXaVJobXlBNGpROEtmMFY1NHJpS0h4?=
 =?utf-8?B?b0pDR0J0ODJTRU43dzVtRVFTUmtjMExPbjUvSUFEZ2hmUnhJTExwNTcyRXl1?=
 =?utf-8?B?cFAwUXN4RnlPZE93TlMwcG80ajFkUEhlSFBtU3VEZmtuY0NQRWlRUzVZYndr?=
 =?utf-8?B?Rnl1RWxKckpNcFc3cmNIR01selhiaDh5NzdCOXhWUFpvelFScDJ3VzJJQ0pY?=
 =?utf-8?B?Nzk0SFh0QXJ5RXNYWFdSd2VOU1JmZndmMXFVU3pYUUJaVmZHbFVISmxYSUF2?=
 =?utf-8?B?UnF3R2RmT0lqWTd4bXo4UHkyOFI4Smt0R3k1VHUzUXplZERCTnVoaG8veE9K?=
 =?utf-8?B?cHZ4YmgzblpEa05vbnBTdytLRFNieTAxbHd6M2I0TzdpTlE3MmlVTlVQendG?=
 =?utf-8?B?cThUMHZVQ1FnRm9iNGZ5Q2Q0MXd6VGNYSVNnNjRZUVpJa3BnWHplQkhqMCtT?=
 =?utf-8?B?dThiMGJuak5NQjJmZHIycFUxbnFhMDdGM0dtVnpLcUVLME85dWRJakZURzk4?=
 =?utf-8?B?R0p0eU5EL1QrTUVXSk5JcU1rSGh6NkdpdE9ndlo3S1N5Q1FNZ2pQdlBxMG1y?=
 =?utf-8?B?b1NhUktUQ2ZRTkFGMXQ3ZEV6azkwMmlsd1Zab1FzVXdlTEkvUlBTYVhlYm5E?=
 =?utf-8?B?ekpOQmp5OFUwa0ZlUHZXbFpQeW9pQVFwc25PcDNWMHkyUTNHY1l3OExVZjVC?=
 =?utf-8?B?aTgyaENyTThPVFpGMkhzdDRvcWtRY0ViMWdLbUxIQUEyYUxEMDZlMHQ1Nk1s?=
 =?utf-8?B?ckZjR0cybmNmWnNkODJVcVNWc1dZeVJVK0p1SUxKMHY3U3JjdnJWa1ZDSDAy?=
 =?utf-8?B?R09jR3JlMHV1RDFzWGQ5MUdreVorN29HN3ZaN3pkQmF3SjlHamtxcWdnaURk?=
 =?utf-8?B?bkx5Q0pUenRvVVo2SnJlZjRGSDJIeFNJekJNcDVjN0RLbzlZU1RGSDBhblp3?=
 =?utf-8?B?L2NoZW9KZWMxcWgrcXl3aUNwSy9XWUJ0QzM1SitvN1huVDdJditTYXVzTjhv?=
 =?utf-8?B?RmE2ZFpzMnJxMitSNUhtWFBFSU5BSEZWbDRUMFowQjAwTVRHUXJBT3lQQWxW?=
 =?utf-8?B?RDVpOXMrVkFSRTNJT3d0ZkhqNkVHK2xESHVNNnpZRjBCZTdGRTJJWWpCMmll?=
 =?utf-8?B?MzZjWU9rZ0NodDBDNnpxWHRuVVVwbEk0SmNXNmNBOEZWZTUrMjFNZVVJKzBC?=
 =?utf-8?B?YXRsUTdXRTlJVXJYYm1ROWVEMUZMRjRka2M4U0RUTlRuZlVkM2Jwb3J5ZjBO?=
 =?utf-8?B?RkZycjczWVBIRFBEUnhpQnJDQnNkVGxzYml6UDNNNDJuRHNobERPQmNhMHlH?=
 =?utf-8?B?anJPeWlIYldCanFhRThTOGl0M2EvaU1kTDNHbDRQS1pLdHNuZVFiMnJHcWxk?=
 =?utf-8?B?WkNtb2JwRW42aDRlNEJSd2hlWGlLcExaa1NiNG5oWlJXbXpmOExBSjVwSGMz?=
 =?utf-8?B?UnhmdDBvSUR6SlN3UmdFVExLbWJCWmp4UDVKdHhEVG9EbzYxTXlieHI0SVNr?=
 =?utf-8?Q?eJ6MwtMeen5oZHwmGvXzyzqkc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03f859-93a1-4536-c511-08ddf7634649
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:59:51.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XvcPJxQbLFkXb+J+xbYlaglOikTgxTSvXN5gdU0n26LaxW5V3k19AEN+XfBPVs204PiOpca3fx+pyx78/pH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030005_246077_3B27A97F 
X-CRM114-Status: GOOD (  15.18  )
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

According to Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml,
imx93/imx95 should use it's own compatible string and fallback
compatible with imx8mm.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
PATCH1 adjust the compatible string to align with yaml
---
Changes in v3:
- PATCH1: add Frank's review tag.
- Drop PATCH2~4, according to Peng Fan and Michael's comment, need to move this
  limitation to driver side.
- Link to v2: https://lore.kernel.org/r/20250917-flexspi-dts-v2-0-7e2a95e3cf4d@nxp.com

Changes in v2:
- PATCH1: small change of the commit log according to Fabio's comment
- PATCH2~4: fix type and split into 3 patches and add fix tag accordingly.
- Link to v1: https://lore.kernel.org/r/20250916-flexspi-dts-v1-0-61567f969165@nxp.com
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index 52da571f26c4e8a2703e4476b5541fa7aca52f10..7958cef353766a430df5e626ff2403dc05a974b1 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -706,7 +706,7 @@ flexcan2: can@425b0000 {
 			};
 
 			flexspi1: spi@425e0000 {
-				compatible = "nxp,imx8mm-fspi";
+				compatible = "nxp,imx93-fspi", "nxp,imx8mm-fspi";
 				reg = <0x425e0000 0x10000>, <0x28000000 0x10000000>;
 				reg-names = "fspi_base", "fspi_mmap";
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1292677cbe4eb8c5f3ec2874a17ad6efd0111192..a0ff7002be9fa0529ba5712df4c056c56f0e3242 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -945,7 +945,7 @@ flexcan3: can@42600000 {
 			};
 
 			flexspi1: spi@425e0000 {
-				compatible = "nxp,imx8mm-fspi";
+				compatible = "nxp,imx95-fspi", "nxp,imx8mm-fspi";
 				reg = <0x425e0000 0x10000>, <0x28000000 0x8000000>;
 				reg-names = "fspi_base", "fspi_mmap";
 				#address-cells = <1>;

---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-flexspi-dts-24af8b6bf468

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>



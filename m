Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE3DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNl3nl25FE61k24Wr/pFNNkwULg/xq+86qnJBozFslo=; b=gDR+HbSgzLaOq7zx+sOVJySdad
	x5ryV6u/OZayWj7AgNq0JBJfLKORA96vITEL+0Xret4AWYIsAuLAhLAykhfYcv41yBPEzcb/9mTBC
	UDZRG4GjkAGfPB0BqhtfjFfswbn8e0UG/PVBG5BnRu+x8tVHJ2sEg+xhByRrVJGtaQSmJwNAiQLv6
	6awgeUUc1gVsVUvUSygTv5Rn7RD5eoyHiZIsmnFLq5rMzPZmNxzSxoet/nyFLwnpENp6Q5xtjN8Up
	dd8kstSoLCoUBXZdAU3dw9x+PXEGOCbJer4uOKi39tqAra4sTLmFREDa/45Q1rVJgLMBJjJkV5X+w
	K+OdU0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QP2-00000005Jpi-3hoA;
	Thu, 16 Oct 2025 16:00:32 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QP0-00000005Jmb-2Iyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8p1LzBn5A1qyoA7oelsPL41Zv8YK/lNBxuOj19BcKmLLh8SjdYe84rqsCJ96RzXtDMds00JkE3F6UPnfoN2kBjv9oHoZhsMKm5Y4BQStgXRQQU1j1qysEWuWrO/Q0foTcJmJBvRu2V4IQ7crH1k73Ck2KJmw32EeRLYWR/1cEKMa0PT3p3ixTI985JXepGwjnfZV5lvcIJrNSIxBQxKneXR941CuT14Qpy3F4ODXvXv2OsO0PbEOsSyr/rytbdiXBUbJdVRxCeOG9u1C0T5kUKIaSPQLILHYIKikBpd+bj+djwpaU9lZ8z5ry67bP1HG3BwAlRx1K1g7VG5Kd0x1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNl3nl25FE61k24Wr/pFNNkwULg/xq+86qnJBozFslo=;
 b=BeD1NOxxAaQFUoo1o5EsyZMZCZG5Ygce+iKQxXxtRKSoWbjXhtAyxLL3D2A1IixaT3gQpfO8Ke9vQ8f2iIdGNtdHid4vOjizyymx3GRVHG0Wj7N7d2MeHmL3ZTa5sBYg/vJzgfiZ+lBxJqpaAj3f4AcofSgAF64HP+XxDcvpynB5rQDKOdasnmKAyR7KC2coUuOfcdRjCUo6NKomarNVMP12YTjF2ZyhCNrT+LtYiTfY1axfQy05BH38DcEH++V2bPU1tF3lvAzjA31+c9ZUbisCj4/EghUEoMTM8R4UvRjAhldt3iy76BtgUHsm9frcXfR3nLRpIT2uZE9voxOzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNl3nl25FE61k24Wr/pFNNkwULg/xq+86qnJBozFslo=;
 b=OqHeaOXZZ1PdyAfE3+ncRE+ytKIseSf0WfFTN3H+y+YAzX3unEjC5sHqLxGQvCPGp4nYzk2wyTaK0K1DqZyENmzOgHxYNLOxMSnPb3kWGlraRe+/T1TO8Gcj3/B3+VSltQFs4HMViJ9OdIVysv8nXmTBynAECTevp6jRJlvXm+QN9at2/5akBkg3nyZJ7Mny9Ggpdn+FuJXivM9nvoimXjseftaOgZAwf7W32X6RqN8E0kw+bwKUKpjRrZ+z/dbH7ubcNE9aCWMyc/LAVUjIAdfXTBR+Lscvz4+7UCuYAqR5XIL3Sw2wexGRCzcPrF/Ylo1KkSebdzJgJwFfkdAUYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:00:25 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 16:00:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 16 Oct 2025 12:00:06 -0400
Subject: [PATCH v3 02/11] ARM: dts: imx6: rename touch-thermal0 to
 touch-0-thermal
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx6_dts_cleanup-v3-2-baf2814f8a15@nxp.com>
References: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
In-Reply-To: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760630413; l=2694;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6TjFE1Ip3BS8+r3eW6eZEqfzCLcxyQEgXhxruv9c+4k=;
 b=f0aBHUM6ljOM7bXLRQ16SYDAWPCSeR3Gfw0qJP4VsKMSn+sISUe4Kmf6mD1hQ2U9Mytk3lV6U
 376wGfkWGHKCiD/lxz/L0d/s5irxsXYlho6FE+cu6WFLCqG39N7m32H
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 3907e370-7ff5-47c9-48bf-08de0ccd1d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmV3dEJpcythT2ZjSTFRUEVJM2YxZXg5QitwRGEyakplMlpyU29jQ2s5ejBL?=
 =?utf-8?B?dXU2emhHdFdhYm56VnBTazRoZDlGVUpjVWJYRk42eENLZG1LQnAxNWF1RXlP?=
 =?utf-8?B?MDhhcHpHWkJlaFBPVk1YSDZZb2RoT1Jzclh1b1pSNys0a241WW5POEhYMHBJ?=
 =?utf-8?B?bWpUNHQ4azJtMzBWYTIwKzRpU2FOOEZYQjdpVVVtYlhJalQ4QXNKR29COE9w?=
 =?utf-8?B?dDJ1T3pzeW05WENnRUNlNllEam5ONlFiWEtWMmJ6TCtwekRoQytieWVwK05u?=
 =?utf-8?B?UUR4VlR3dGlyem1Fci9LanpNeEtrVjZHSzNkcWZ1WDloK25BMUt2QkE1Z2JH?=
 =?utf-8?B?U0dzRE92TGpXYXRrVWZ3NEZicmRQQTNhZmgyR3FIMHJZNjJId3g1WGFvUzBC?=
 =?utf-8?B?aUNFM1lOQlA4SUNYZ3Q5d2tTMnBndTFYeUVoblowQVB3UmUzcm9IU3JuR2la?=
 =?utf-8?B?SVNLK1krS3ZjRTFXTFZENTU3Q2ZrVGlweWprNm1jMi9sanRPdm95WWdvNUZj?=
 =?utf-8?B?NDhkcXI2QXRjM0pSb2t3MlcrcUlUaTdMN3QzS2xRMDBuWVJLYnhTRG1LMzc1?=
 =?utf-8?B?T2I5TkVxSFNOYjY5eE9jSTRzQUpLVWFUZ3lKSWpkNDhuQjZISWVTNWVZMExS?=
 =?utf-8?B?V290K3Z4UmFqSVhtOW9rK2kzYzkzcEdyRFVRQUVWbXp1eHVSWDVVYUdOWDVz?=
 =?utf-8?B?aUN5MWRCQjNjUmNNcXl0VGNnd1lhaVJMMEM3VFBqdjJQaDY1RC9SSzkzMmJa?=
 =?utf-8?B?K0tCcVhxT1RBUmV0OVVQWmlsY1ZFY1NYTTJWQUhXcE9ZaWNDQzJWc3NNOVJR?=
 =?utf-8?B?U0d4VVBTajlvaFU1TTFCSXBaR1dpZHZzdXZYQmRKc2xkTlNyd0NoV3VnOXRU?=
 =?utf-8?B?MGFnUkVpVERMdmVVdWlaZkppK1JDTXFJeXhMV0VJTG9mVnBRbkN5S1E3OFdL?=
 =?utf-8?B?R0NjejM0S2RjQ21RdVZjS0w0ZGw3SW9LRS82ZE9SSStyT2pDYlpNRkpFK3dt?=
 =?utf-8?B?R1plaituMHpVejZSSmM5SFdnWmxzN3pBK004Ky9VdWxzQzlZandKMjlFb2t5?=
 =?utf-8?B?cThOZWdxWXNiVGVZV05Gc2YySkRVRFcwVzJiSVNSSDBmUmF0NTh2ekptNWRW?=
 =?utf-8?B?Q3kzR2NxS0xGWCt6Tlh1NEowbDd5eEZvcWZmTFFwMUFWeWRmZXN6M0t1V0c5?=
 =?utf-8?B?N2k0eG1CRHRldVFIVENXVVZQT3QyODRqNUdlRGczUUQ2KzZCdmVoWEZub0xQ?=
 =?utf-8?B?emp3czZpVnR6bHpzb0xhbGN1dU1OTnFobzFBek9RNmJHM2x4ZStOUThzRUNN?=
 =?utf-8?B?bFlLWjIvNkFJTE1FYnVtSXhqaC9yZEQxcGVaalJreVkyUnByL0FWdVN2R3hH?=
 =?utf-8?B?WVFoY2lGR1dobG0rWUJzMEQzK2w4TTBiL1g0Z1ZlRnJxUnZEMGZHSWRqbFpr?=
 =?utf-8?B?QWthRWl2MlcyRG1UdjdQdnJBRWl5VndCcllyUHhHODVmY1VyZHRUMzIyRkxH?=
 =?utf-8?B?NlkvVXlvVHh2ZlJiVG44eUFPVUFMNExpOXhJOUR0MnFSYkk0cmZtWEJoYldY?=
 =?utf-8?B?M24zZ2ZHbUNMcGlraEtlTDBDZXVoek0ySTBEem90Rlg0dTFDeTJESlR0UGQ5?=
 =?utf-8?B?VW9TdnZoY2pWdFdwaTJOUVNHUzY5RVVRNmh5ZGM0cGt4UEpBaTU3TE5RWU5y?=
 =?utf-8?B?THFVMWdWa3RWS0NsK3czRCs4bnNwOTF4bExpMEwvcktkcEpUTjFUYmduNk45?=
 =?utf-8?B?aDJhQ1JIL0NUc1BEZ2xCTVVkMGNyMHVzWGo4WTJ4SWExdmtEWmpjVmo3RlpP?=
 =?utf-8?B?SkRNdHFqWlpFU01xdWZLcmQyVkw0UnE5VVNSdFUvbFhDSGp5Q1FBd0FZQjFq?=
 =?utf-8?B?bkZSdnVodmFTSUNzTENYZlIwcmhqeWtHeFlCNnhhdDg0Y2VWWEV6ZFF6K1lw?=
 =?utf-8?B?b1l4bitXMlhydmFpNURBQ0lyaTdQLzZET0UwT1FvSkRycG5mYUJhaHZmeUo3?=
 =?utf-8?B?Sy9hN2V5eVp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tTSFFiMFgzUzlGTWFBNXFsYmtEQ3B0TTFsNitHb3c0RFVrazE2QWtKTHpY?=
 =?utf-8?B?NFJxMG1QTkQ0WGpkZTcvN1l5NTVwNTJpQUdSM2hpZVB4RTcvbVphRHVhOUlL?=
 =?utf-8?B?dkxnZE9tMExvTTh1VUZHTXg3bmJQRWZ5bXJzdE5qY2RraWJ0THA3dFl2OUpQ?=
 =?utf-8?B?QmY5dFErRlduTHdSZnhLZzRVdVRnUXJYb3owSkt6ZXZrRXRhM1pQNjVadW5h?=
 =?utf-8?B?R3hLMy9UckJrbU0rZFpBMkFhc0dFZ2s0TVNza0NlK00zOFlubEFSOXFITTU2?=
 =?utf-8?B?Sis4cE4rNFhWM1NtMzN0RDVNUzR2WUFJNXZVaDkwL2pKQ0dteU4yaXZtQzJW?=
 =?utf-8?B?akxZdWttM3NYM0lIL0dJZTZJbVFkQkp2T0d5eDh2aFhwTlJwTXA3NXFnckpN?=
 =?utf-8?B?d2Y1bFplWGh4TmFlRTJKVHRaUkx2c1VuMzBtVUptVzNhR2gzWHF3cUs1QzRK?=
 =?utf-8?B?dDJEZS8yQUtjbUZWQStuMWpuSEZ1N1FJNGJOdFZiWlRKc2hvYmtFeFpEQTN1?=
 =?utf-8?B?NzBjNzR3N2YxVmd4WkxpOVRyZ2JxTjJ3bW1Da0t6UnF2bkw1dXlJRWpwUmpD?=
 =?utf-8?B?dGlZeHhsVW8wRWR2bTdnei9BZTlMdWJMYWR0cFFjTUNsNWlseldTeEQyM1A1?=
 =?utf-8?B?N2FjdThRb1htWExIaGJMQVJUWHY1Z1E2cm1UNlFFblNsWDAzQ2hOUTg4aks4?=
 =?utf-8?B?bDFqY0FWcERjcWxkM3ZialJweXAxUmh1UlBhVE5Hc0Y5NHh5d0pPM0VuZ1h3?=
 =?utf-8?B?M1hha0REZGgveVNtZ2ZsUWV4MEdoUFltYUdmdE1TdG9qWnQyc1BwbVlpMW1J?=
 =?utf-8?B?NElmWWlCWHZ4SHJvMGpwNko4R3NOZ3NjZmlvVWI4aGhlR2E5QzVpS0VFckZt?=
 =?utf-8?B?K0ZtdU1CUlU1a2pTQVpDQ1JqclpyNnZBWW83T3RiaWpkWjlQZkVXQ3k0NlQr?=
 =?utf-8?B?MzIyODRxOExibnRkK0oyUVlxN0hLcHRRZmFiL0VES05HYWxtQTZvS2lvQjM3?=
 =?utf-8?B?UnV4ciszRzBBRExqay84d3VxaytnN2xiYS81ZDZKbGZYTU05ZkxqLytiN3lv?=
 =?utf-8?B?ZjY1YWJnZHpLZ3g2d1FUdTBJb3c1MXRjMU1ybW43NjBpZmkxK1JYZWQxZ0RH?=
 =?utf-8?B?akJoNlBWVGd6bDM5QzRIUXhzUkwxc09HUFFqYWFqc3h3SkI2dmhLZkRveWRC?=
 =?utf-8?B?M0pVMUZVbjFEcjlCMDdiR29CMG94YjN3WjZxb21oalFaa21NUFJybjc3Q3hz?=
 =?utf-8?B?eXN5VGt3eWxNYS9zUWo4Um1vNkM3clZrWmxRY0lic0hGVnJmbHpVNWw5UEJa?=
 =?utf-8?B?dTZJeWk2SHgxS0pXQTlWT2QxWC9HVmxuTTE5NVYxMExqQXpFZUJoanpvZzVy?=
 =?utf-8?B?VGNDdFByUHJ6ZDJWVU9XK1NqSldWWHAyaFFWMkZLQ1RKdS92NUNTRHIvUVd5?=
 =?utf-8?B?VllYVWdxVGU4clJFcTFiYWNPVUpYeW9nbVRjUmJ1dWh1eW1Ia1h3dVF6Wnli?=
 =?utf-8?B?b1dwVlBTWDNKdjJ3WHoxRUwxYzZUUGkwSHRIbnVNNkp4Y2ExdkxrMGlHazR5?=
 =?utf-8?B?SkxBMFVDQWVGYmF2VmY5aTFmcnVOd1huRE1UVnBhRE96cmZnd2FaUFF1QTRs?=
 =?utf-8?B?UzV6N0loaC8yN2xLc0RoZVZlMzY1bFh3NC96MFo3V09Gc00yMFNlK09xTXJw?=
 =?utf-8?B?bjBEN0xVYU5YejFyYThWajB4VHBjOFVyRGlIWGNFSkxIRUJYQnMzWGdzWmJ2?=
 =?utf-8?B?VHFIY3pvYWptc3RPNU9ZYkREQTZlaHhPTC92NlFCR0E1RFVxcmNqaGQzK0R1?=
 =?utf-8?B?V3BrSE05TkFZVXhtOTgwS1VTQ3FXUW84bm5JczJpVGVMUTB6R3ZVa2tOdUVH?=
 =?utf-8?B?NkN1UVRieWd2L3F2RDJnSUlTeEVxaDl3MkZUSEJVbFZPODR3SDBpbjhJaEZu?=
 =?utf-8?B?c2RqTis5NWNYdjJLNTZVbjZwK2pOT0NCMFRqZ1NSekhPbWRvUHo1L0JLZDRR?=
 =?utf-8?B?NHdhZGRLTWEyNUh0cDM1ZjQzUFMxdU56bTJTNmp6dnhXR2RBUU5IcDEvMDJP?=
 =?utf-8?B?aWJML2ZKRnZVREtObzRxUklpZ2dyVzBBaGJUdEpyeHcvWk5WTmZ5SlgvbFcz?=
 =?utf-8?Q?/FffddRR0hmyhyjD9d8mk2TJ5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3907e370-7ff5-47c9-48bf-08de0ccd1d90
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:00:24.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJKZ+yVA/tpLoMaB9o3Ety2wfysRbMXdiYhqscG6OM/N2WMg33JriUAgKM8KsHkO9ywwzAPsQT34azfMuvxjqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090030_618842_45BDE55A 
X-CRM114-Status: GOOD (  11.98  )
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

Rename touch-thermal0 to touch-0-thermal to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: thermal-zones: 'touch-thermal0', 'touch-thermal1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index dfa8110b1d97b14eae30159acc6daf74ae482eb7..0ef24a07dedf986efdf4ce8ad4032814752e7271 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -123,7 +123,7 @@ alert {
 			};
 		};
 
-		touch-thermal0 {
+		touch-0-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp0>;
@@ -137,7 +137,7 @@ alert {
 			};
 		};
 
-		touch-thermal1 {
+		touch-1-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index 29dc6875ab6680d316bc28619df883ad2411ab28..c9dc48c1f9b1c36e33a55c64b9fa64262f011f8e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -256,7 +256,7 @@ alert {
 			};
 		};
 
-		touch-thermal0 {
+		touch-0-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp0>;
@@ -270,7 +270,7 @@ alert {
 			};
 		};
 
-		touch-thermal1 {
+		touch-1-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index 4875afadb63005d101c4501b70f64761d732b86f..e258e7b3b3fe792d061002a6b70bef4b22c5e89e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -84,7 +84,7 @@ alert {
 			};
 		};
 
-		touch-thermal0 {
+		touch-0-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp0>;
@@ -98,7 +98,7 @@ alert {
 			};
 		};
 
-		touch-thermal1 {
+		touch-1-thermal {
 			polling-delay = <20000>;
 			polling-delay-passive = <0>;
 			thermal-sensors = <&touch_temp1>;

-- 
2.34.1



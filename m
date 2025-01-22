Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdWYvn3C08v4gooo7FI3F9Af93jrVeMYEsOAB+6uGLk=; b=0k8NcbeMYteseRpgkpk5JUqlwQ
	KJTe6G9CLoK5DsI1MeSjb4Vz+JazD9sIeb4m6y3j6DMf7e+llqwkkk26EQikxJTXF1PQe43EXEx8m
	F0MJqNDfAbFlJopZZ3Ow1aJ9kszx3gtS3BYrqlYTe9glyLRWLro6unL6tg8PyN2lrP+xdej4xHnix
	OsDVAT8ZvJdJsTAqOHWsKG+60kP5fp7ZNdgXS5368FBkrI4/m1tPtBlAs4b0AyOicRUeU+pmkQ1/Y
	RVkNdQ+SWty8h3CEy2piN9PXFJgGuuWpc/QT/74Rfk2Xr37lVCbR1LZBvy4ynLm4sDOzGIsFej4U6
	duQ9YRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVNR-00000009cXl-2zZa;
	Wed, 22 Jan 2025 07:42:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVLC-00000009cAf-08r6;
	Wed, 22 Jan 2025 07:39:59 +0000
X-UUID: 0f3a7330d89411ef9048ed6ed365623b-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qdWYvn3C08v4gooo7FI3F9Af93jrVeMYEsOAB+6uGLk=;
	b=l1SInT87UlmlCcIVk//+4AIJH6/LI5XOgW/dA7uqly5pP3lXTZ11aUs+E8uUYSE3rH6gK/MNz19xll95Gjv7Z7YdPWeinD9Xo6EdOqrkun6Xb4yXYBwklwQjH8ttQX+WwcOtk92T852vhq18Rs9dEJIEWkmxXERfOkhA70SJi2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c6e3a4e8-0b0f-41ad-9e2f-9e140645d6c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:bf01490f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0f3a7330d89411ef9048ed6ed365623b-20250122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1641478167; Wed, 22 Jan 2025 00:39:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 15:39:46 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 15:39:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez6+5XEdfsLWCIE95AQXjdTxbr5ZzY0nJDxigNasyeOgC8X7bzD0uFqKS42kXcjERr8WC/jjD3ehC/eais8B0SsesyYqHaziwfPzIRH6MBIBLRI8w1w4GU0V29msH9v4i8m3Uq4NUNFAw8q4fugHw5yFdu/xKWkLJ8z4ibH2R1mXoQLwdnOmBJsbLnCxP8T1KRHPjG5MB7nel4mzqi+minS3KE/C4An3BK1bGKKC6o8fYlIbNLgnMYNz1ss09FGXf3pkg9dVHjvPkNPbWKOTUtmq7zkZfjL/kUAQT6g0hkhqYkZr8eMjkWxghu7BfJSryEbE2UANIT5Ro6U0iEz4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdWYvn3C08v4gooo7FI3F9Af93jrVeMYEsOAB+6uGLk=;
 b=vZx9kdsBKn6vU92ogS68dzyiILXMLy1KdO7qgM/3IE8mkVExErD59eRqvgk/mJI32/soDg19o3zlEaCNyUxl9xvL/P002dyaA3TOWBgQ3inpcxhGcpN14T0Ia7bEoYtlS0Qhw+NBS1fx/QQPO9e7uMWA7ESkSP8dw7y9tavrogKwF+iofRLticO1taK9Qlfci+EcZGeG2BvFIfYy0kzLQ/KvmsBvTzxottAXXEcVsaVql1cbvdBtOX6AnIbz5m5hJcCo78hUtNEeM8aapFQH+XSNfM72Yje3AFe+EGMy+Tuai+OGpv++atLQ1XF0y4t6KXtYfTv17gwLhE3M0dqgiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdWYvn3C08v4gooo7FI3F9Af93jrVeMYEsOAB+6uGLk=;
 b=QNETiXpRwhbxkalsyV0GKAynQ+0ykxzVm0ISCzKUsvWCGmcxuXFHMAHTSuR6sACVGHAfRTv/qLcjKSZthqN/B0gQYbjhNiiq35mtibzK+sz07i11gdmZIQzULSyNZlb4Gib5mcjnXXpnNrO4WBMzKLetYVGSnZ4SjMeLC3cTHv8=
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com (2603:1096:990:3d::5)
 by SG2PR03MB6537.apcprd03.prod.outlook.com (2603:1096:4:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 07:39:43 +0000
Received: from JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f]) by JH0PR03MB7983.apcprd03.prod.outlook.com
 ([fe80::68cc:b424:7a97:b11f%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 07:39:43 +0000
From: =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v3 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
 for MT8188
Thread-Topic: [PATCH v3 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
 for MT8188
Thread-Index: AQHba9DDgwsMvZbou0+8kwiz+jqESrMg7FIAgAF9pQA=
Date: Wed, 22 Jan 2025 07:39:43 +0000
Message-ID: <c4ce6e5c6350e6cfb5ff9bebf3118be0ac76edbd.camel@mediatek.com>
References: <20250121064934.13482-1-friday.yang@mediatek.com>
	 <20250121064934.13482-3-friday.yang@mediatek.com>
	 <98d064a635467dcc3937d1ec9c5b1659bd71eb91.camel@pengutronix.de>
In-Reply-To: <98d064a635467dcc3937d1ec9c5b1659bd71eb91.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7983:EE_|SG2PR03MB6537:EE_
x-ms-office365-filtering-correlation-id: 5ed799a6-81b9-4dcf-8db3-08dd3ab7efab
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U25rMmFoMnR4RkJ6aUcxSFdFQldIMU1yQVNDS0Y5dW9neVpOc0VHemJaeitG?=
 =?utf-8?B?bG1EbHRpMjBvTWo1YmVxT2F4Ni9pMWNpUnE1dXlMU2Q4TEtYWHhMVVNrcEg2?=
 =?utf-8?B?bm56dHVoVUJqc2RNRkFOa3pPTFV5ZDBpbTQzL1FiTlVudExJMWFWUlczUXR4?=
 =?utf-8?B?TjlFeTlvTlRpc21mYm44ZDd6NW90VFdSWkJZWFpUek1JYk11SFZEWkx3cjVy?=
 =?utf-8?B?RmQydHVNcjlsU1cyZ2JGSkY0ZlJ3eG44L0g3SmJ5NUdxODZuZXBKYU9iMSt5?=
 =?utf-8?B?MUovZW4vb3BwNnlEc1N4OE9FeGdEYjYxQkV2ZXBnTXNnT0RSbzRZQXF4VUh1?=
 =?utf-8?B?U0VTcGw4aWk2K1FCWFhwSmhDaXU0U1FCRkJLMVl4V2gybzBSV3JxSS91Z3U2?=
 =?utf-8?B?aEFXZHA0MkFpalNlakR5RUl5ZzRFTEp1ejVQSlA0dUlnL01OMlg3QUNyWU5L?=
 =?utf-8?B?by9pTjlKZnZmNTAzZ0huOEtUUUtFMEU2Z01yUTBVNWNkQ3VNd2hUU05QanIy?=
 =?utf-8?B?OU44WE9OcmgrS1dWakp1VWV1VXV2Y3BPU3RZN0R0c1FVbDlWaHA4cmVSUk55?=
 =?utf-8?B?MDJGSXB5SHBXSkJGa0NiZUx6UVNwRUJqaFNCVExLSndWMmtQT1VUN2dCRFZk?=
 =?utf-8?B?Z3d4cE9FZ2YvV3NKNXkxTXc3aGV1S3FvTk8zejRJdVhpUktKaEhBQ1VjcjhS?=
 =?utf-8?B?WUx5VkhMVjZFQ2Ivb2JiTWoyODlOYUVwc1lIRENIeTVRYXV4K1VLM3JxSzAr?=
 =?utf-8?B?dXAzd29jZXBNRDFZK2lnckFMMFJpZzZETE9WWE5rU3l3ZStLRGgvVk9xc0FW?=
 =?utf-8?B?ZjY5ZTlXYlh4UVROZThpRVV6b1JiSHdJZnpIMit5T2w3cVJsVWJodmE3MWR4?=
 =?utf-8?B?VEVINEZjTGZGWUQvVlVUblVRTytMRHNIOWNlVkh5aXllS0FlWEVheG43eGZ3?=
 =?utf-8?B?WUZHOGl3SjdmTmxxbVZOT0k4MkU2SWVWNk1nVnh6cTBDUDAxVlQyUWc3cGJl?=
 =?utf-8?B?b3hDQUV6QmVRdUhYMGtwWnI4VDVuVGh3aklkOXkrQ3hhL2FHZFZCS01kaW54?=
 =?utf-8?B?MHp5U1FQa1ltQlhZK0M1anQ2a0JjblhLZmdiVThTT0tNMlFZZ2dJbEZ1ZFpE?=
 =?utf-8?B?aTNVdjgyeVV6bWlMd1lJcVhJdW5pcUFPeUJrSnNEM3pDRktsRDAwd1dzN2tV?=
 =?utf-8?B?L25aU3NSWVB3MTVtOEtSRnFPYy9PNW9GNWx3WjlaZExpTW9rT3VMaW02VnJX?=
 =?utf-8?B?aFpEUUVldGN0UFAzekR5TTVwRGt5N3AxMitTT2dKVWtRMnNkYTRLVFZtSUs3?=
 =?utf-8?B?MFdJV3h2ZVp4K2ZPZWwvaVRvbWpvVW1EV0xIQjF4L1BHaDN2aXB2U01JbUFy?=
 =?utf-8?B?cENnL1RSam5VUTFJbU16bDF2eUxybW0rbVFPY2M5TVVRWXZOY1ZFWTczU0c3?=
 =?utf-8?B?bWJVRE1QWDJJM0ZYQWZxN0M0dXRtYkNWaW9xRUhObWdYYThucEdXNExiSUtZ?=
 =?utf-8?B?S2YyeC83NnlmOGsyc1JrUHFFQWZPdEtlVFVidnI1cDFnUUNCSDBwRWpqUjFs?=
 =?utf-8?B?MjJyY2ZvWVJjQUhPTm01TUlxb3V5NXIvYjg0aWU5NWlXT0tYU2hnd1NSUWU4?=
 =?utf-8?B?VVNUQUhSMHFMWERYK21naG95RUJibVNSNGtzeEY1NlJndWlXRllReWVnSlJX?=
 =?utf-8?B?Y0ZwcjZzT2s4MmNlbloxdzdvY0plMHBEQ3U5b3BZRm90dUswQU04UkVrOUVp?=
 =?utf-8?B?Y2hTbDZqWnBhSHo5eVhqZndWcXdkbmRRZ2sxdDdwRWkrYlhWNDRucXlnL0dt?=
 =?utf-8?B?T2RyREkvR1B0RUhJWU5JcFlyd0JtUi91c0ozQW1uRVhBeDhtUFQ2V2xFWDJX?=
 =?utf-8?B?R1VGa0w2bGw5emdSbkh5TDBpMWJ3WHZrVmRqMFN5T1lMWTJ6V3FxRTVEejZ3?=
 =?utf-8?Q?2mWREZT7Mp7elBfsG6PseIGPULrwjTUW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7983.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUpMUWZLNlBtR29YdG4wUER6NXh1V2k3eUlUVkNGdlltU2k1N25PWEVtZ0d3?=
 =?utf-8?B?WkJhc1MvbVUwbUI4UTdyd0hUcmM0WkQvdnFTVTZBcnYycGlMV2V3eGMvZ2lI?=
 =?utf-8?B?R0xkUGh5ZVljMUhkdTNZa1hZcExMaGRVa3FyQkxkUTlEVEVyU0dSd3YrNXlZ?=
 =?utf-8?B?SUVxeTZKZ1dKSUhXQXN2RFNYOUtFYW9hK1JjL2swT2NCendpU3Zrd3VPQWMr?=
 =?utf-8?B?ajV6aTQ4cnQwYVZlUi9RWkdsRGt1ZG9nN2lpb1pWOVcrQ205ZUYzME9CQVU0?=
 =?utf-8?B?U1lPdVpMT0RpcWVmTkwxZWp4RGlRVWd2dUVJS1VjNmZUN3ZXQVFpSFMyOFNE?=
 =?utf-8?B?SU5PRUR1M0dCZ1VVSmhEclA5YjR1OG5LaUdSMzhpZUQ2dzZzb3JHVDNmc3NZ?=
 =?utf-8?B?bTRubHBWVlBlNkl3cHRnZ2RuZkR6NG4zaVp5eUh0MjBGNGRYa2ZUcno0QnZz?=
 =?utf-8?B?V2RlRURHbVJ1NlBRQVlNNzcrZitPMHJaM1ZYM0xRVWU2OGdaVmhoOHNXWlQ4?=
 =?utf-8?B?dmNXVUtiaWdzbzM2aURRYlIvZWgxanUxb3lIL1hsRE05cjl2elFEZWJITUlo?=
 =?utf-8?B?a2RhVCtXc3M1a2pkaDZxUSt4OERjMUw1bWZjK2s4QnFpM2lKWUwzYjN1alhj?=
 =?utf-8?B?a3o2cmxjdjNmQm5qWE4wN1JFSDgrYkZkTXlrdFBmM3lYZGxSTWx0emkwS29R?=
 =?utf-8?B?U3plOVFvdEd0MG1oY3I1NEsrbSs0QlJPUnVMV1dPdGpCbDRXNzZrU1NTV0Ja?=
 =?utf-8?B?UHk0enN6dEdsMnlvcDZYQ3ZYS09GR04vempSYkhYV2J3blBraEZRNnZnMWo2?=
 =?utf-8?B?Mml2U09qbnFFN29NL0tucDR6OEhlaTBzbGpZa0FjQTRKcyswUmR6S200d1NW?=
 =?utf-8?B?RHRTaTdqTjZCWUxxQmlVbS9XYXJuV0J6czFTWmN4TmdIbkhBNENRcHpJZkV5?=
 =?utf-8?B?aUtYQktSQVV1Q2YwTkFlcU80QU9Hb2ErbExBSFpWQkYzdVBPU01ZRmZ1Z3Mz?=
 =?utf-8?B?TGIxVEhGWW94N0NkMjRFb3FLZFlIeXN4SDJDODk0UGVqVUJBenU4OFRNUjg1?=
 =?utf-8?B?cXQ5bXFKQUFpbW11YlNJM0lySVcxY0lpQTh5ZnU3Y2sxSEp3QlhTVk9ZYVIz?=
 =?utf-8?B?ekZLdFV3bTRiN2tCajhXZGg1NkkxZXdYUkpnZFRXdkdsdGRRTW12blFvYjEv?=
 =?utf-8?B?allFSWZqVnluTVl5Qy9oUnd3aTVWbkJtejFmdVkraW9yK0xkZURvVVY2dEc1?=
 =?utf-8?B?dTlhVWFkUHByVituRFFvcWFwc2w1dnIzdlFqRkt2Q2lLNXJWa25jREwyblox?=
 =?utf-8?B?UFhqVTJja2JHYngzMkxRQlpuWUViVFBPVzM1cUl3MXJmNHRQNHIwZUpsdTV1?=
 =?utf-8?B?eUM3aDhmNURKRlZqUEV6eGZDUVRLRFkwVnFTQ1NaZlZJMjlWYlIwS2xMUWFt?=
 =?utf-8?B?blg0UGlteDhJdDJoWG41QXNvM2Z5ME02YTQwNUVaUmtXQ3RYUjR6QVlsaXFi?=
 =?utf-8?B?b3ZiWmM0SE11WTZMOUFnaFhmUFJvakRCaHZmVWZGK1ptUjNBRzd1QTNYZzUv?=
 =?utf-8?B?V1hzTjVQQmgyRmE4d003QkRCMkV6RHRQZnVRYnJhUWZjYkxIeFVlSHVTVlBw?=
 =?utf-8?B?STYxZ3pEK051UXlwMWxSNlBzT2lKWmpzUDFHZFllekFsTUg4endDT1hZbHVC?=
 =?utf-8?B?YzFSUVZremptSzZ0Ri85WEM4S0ZFYzJObW14T1JsOERHOERjS1BabE82b3hQ?=
 =?utf-8?B?d0xvUXA4cTQ0d3oxQnZ2UVJHd1ZmclhhaHhYUnpwWVRleXpDb1kvMU1zK0ZN?=
 =?utf-8?B?UDlsWUtGNzNKdEkrRWlHUmFoc0Q1dVZFTHhVUjdmNU1xNnFPeVpEL2RHYWFB?=
 =?utf-8?B?eHp4eVdZSE1hQnlUQUxuUGY4S2kyVi92T3hzaHY3QWRxOGF0dlZlc1hjSUpt?=
 =?utf-8?B?Y1h2VGc4andnSFJlakc5OThRTkExY2xVd08vN094ZUkySDM3cVQ0VzdvL2tI?=
 =?utf-8?B?WGFCck5mQ21aNWY5U05CNVdabWZlMGY3NXVSbjdaeWplSUt6VVZERXU5R1JY?=
 =?utf-8?B?ZHNGQzhKVFZRZFNKODFITElXaGJIc1NnaDhzaFJqRC93blNSSjdWbmlsUUtM?=
 =?utf-8?B?aU1rcjNtelVIOEFtTDlvMTRlbDRnRDRWd09JRU4vNlduaHhoWUx2S1p1VkQx?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F86739AEA4D2E14EB5C21F1C528C1823@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7983.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed799a6-81b9-4dcf-8db3-08dd3ab7efab
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 07:39:43.0744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNxWg6Mi6K62WceRUyhoRR/WjH00BZs3Am1WBJaPmQRjczDT7+tq9eeMr0sFCh5XBHY3y0LUNu+M8sGBRHy8QYp6DJ6oPlXapQLf0DiFrXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_233958_077979_9761C1F0 
X-CRM114-Status: GOOD (  23.58  )
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDA5OjUzICswMTAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIERpLCAyMDI1LTAxLTIxIGF0IDE0OjQ5ICswODAwLCBGcmlkYXkg
WWFuZyB3cm90ZToNCj4gPiBGcm9tOiAiZnJpZGF5LnlhbmciIDxmcmlkYXkueWFuZ0BtZWRpYXRl
ay5jb20+DQo+ID4gDQo+ID4gVG8gcHJldmVudCBoYW5kbGluZyBnbGl0Y2ggc2lnbmFscyBkdXJp
bmcgTVRDTU9TIG9uL29mZg0KPiA+IHRyYW5zaXRpb25zLA0KPiA+IFNNSSByZXF1aXJlcyBjbGFt
cCBhbmQgcmVzZXQgb3BlcmF0aW9ucy4gUGFyc2UgdGhlIHJlc2V0IHNldHRpbmdzDQo+ID4gZm9y
DQo+ID4gU01JIExBUkJzIGFuZCB0aGUgY2xhbXAgc2V0dGluZ3MgZm9yIHRoZSBTTUkgU3ViLUNv
bW1vbi4gUmVnaXN0ZXINCj4gPiBnZW5wZCBjYWxsYmFjayBmb3IgdGhlIFNNSSBMQVJCcyBsb2Nh
dGVkIGluIGltYWdlLCBjYW1lcmEgYW5kIElQRQ0KPiA+IHN1YnN5c3RlbXMsIGFuZCBhcHBseSBy
ZXNldCBhbmQgY2xhbXAgb3BlcmF0aW9ucyB3aXRoaW4gdGhlDQo+ID4gY2FsbGJhY2suDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogRnJpZGF5IFlhbmcgPGZyaWRheS55YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jIHwgMTQxDQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMzcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jIGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+
ID4gaW5kZXggNTcxMDM0OGY3MmY2Li5hYWViODAzNzllYzEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5j
DQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC01MjgsNiArNTk4LDUzIEBAIHN0YXRpYyBpbnQgbXRrX3Nt
aV9kdHNfY2xrX2luaXQoc3RydWN0IGRldmljZQ0KPiA+ICpkZXYsIHN0cnVjdCBtdGtfc21pICpz
bWksDQo+ID4gICAgICAgcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+IA0KPiA+ICtzdGF0aWMgaW50
IG10a19zbWlfbGFyYl9wYXJzZV9jbGFtcF9vcHRpb25hbChzdHJ1Y3QgbXRrX3NtaV9sYXJiDQo+
ID4gKmxhcmIpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBsYXJiLT5k
ZXY7DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IG10a19zbWlfbGFyYl9nZW4gKmxhcmJfZ2VuID0g
bGFyYi0+bGFyYl9nZW47DQo+ID4gKyAgICAgdTMyIGxhcmJfaWQ7DQo+ID4gKyAgICAgaW50IHJl
dDsNCj4gPiArDQo+ID4gKyAgICAgLyoqDQo+ID4gKyAgICAgICogT25seSBTTUkgTEFSQnMgaW4g
Y2FtZXJhLCBpbWFnZSBhbmQgSVBFIHN1YnN5cyBuZWVkIHRvDQo+ID4gKyAgICAgICogYXBwbHkg
Y2xhbXAgYW5kIHJlc2V0IG9wZXJhdGlvbnMsIG90aGVycyBjYW4gYmUgc2tpcHBlZC4NCj4gPiAr
ICAgICAgKi8NCj4gPiArICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25v
ZGUsICJtZWRpYXRlayxsYXJiLWlkIiwNCj4gPiAmbGFyYl9pZCk7DQo+ID4gKyAgICAgaWYgKHJl
dCkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgIGlmICghbGFy
Yl9nZW4tPmNsYW1wX3BvcnQgfHwgIWxhcmJfZ2VuLT5jbGFtcF9wb3J0W2xhcmJfaWRdKQ0KPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgIGxhcmItPnN1Yl9jb21t
X2lucG9ydCA9IGxhcmJfZ2VuLT5jbGFtcF9wb3J0W2xhcmJfaWRdOw0KPiA+ICsgICAgIGxhcmIt
PnN1Yl9jb21tX3N5c2NvbiA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LQ0K
PiA+ID5vZl9ub2RlLCAibWVkaWF0ZWssc21pIik7DQo+ID4gKyAgICAgaWYgKElTX0VSUihsYXJi
LT5zdWJfY29tbV9zeXNjb24pKSB7DQo+ID4gKyAgICAgICAgICAgICBsYXJiLT5zdWJfY29tbV9z
eXNjb24gPSBOVUxMOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCAtRUlOVkFMLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlVua25v
d24gY2xhbXAgcG9ydCBmb3IgbGFyYg0KPiA+ICVkXG4iLCBsYXJiX2lkKTsNCj4gPiArICAgICB9
DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW50IG10a19zbWlfbGFyYl9wYXJzZV9yZXNldF9vcHRpb25hbChzdHJ1Y3QgbXRrX3NtaV9sYXJi
DQo+ID4gKmxhcmIpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBsYXJi
LT5kZXY7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgbGFyYi0+cnN0X2Nv
biA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCAibGFyYiIpOw0KPiANCj4gUGxlYXNlIHVz
ZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgpIGRpcmVjdGx5Lg0KPiBPciB1c2Ug
ZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUoKSwgd2hpY2ggcmV0dXJu
cw0KPiBOVUxMDQo+IGluc3RlYWQgb2YgLUVOT0VOVC4gVGhhdCB3YXkgeW91IGNhbiAuLi4NCg0K
VGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkgd2lsbCBmaXggaXQgaW4gdGhpcyB3YXkuDQoNCj4g
DQo+ID4gKyAgICAgaWYgKElTX0VSUihsYXJiLT5yc3RfY29uKSkNCj4gPiArICAgICAgICAgICAg
IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihsYXJiLT5yc3RfY29uKSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IGxhcmIgcmVz
ZXQNCj4gPiBjb250cm9sbGVyXG4iKTsNCj4gDQo+IC4uLiBzdXBwcmVzcyB0aGlzIGVycm9yIG1l
c3NhZ2UgaW4gY2FzZSBvZiAtRU5PRU5UIGFuZCByZXR1cm4gd2l0aDoNCj4gDQo+ICAgICAgICAg
aWYgKCFsYXJiLT5yc3RfY29uKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBo
ZXJlLg0KPiANCj4gPiArDQo+ID4gKyAgICAgbGFyYi0+bmIubm90aWZpZXJfY2FsbCA9IG10a19z
bWlfZ2VucGRfY2FsbGJhY2s7DQo+ID4gKyAgICAgcmV0ID0gZGV2X3BtX2dlbnBkX2FkZF9ub3Rp
ZmllcihkZXYsICZsYXJiLT5uYik7DQo+ID4gKyAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAg
ICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gYWRkIGdlbnBkIGNhbGxiYWNrDQo+ID4g
JWRcbiIsIHJldCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICBzdGF0aWMgaW50IG10a19zbWlfbGFyYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICB7DQo+ID4gICAgICAgc3RydWN0IG10a19zbWlfbGFyYiAqbGFyYjsNCj4g
PiBAQCAtNTM4LDYgKzY1NSw3IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9sYXJiX3Byb2JlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICBpZiAoIWxhcmIpDQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiANCj4gPiArICAgICBsYXJiLT5kZXYg
PSBkZXY7DQo+ID4gICAgICAgbGFyYi0+bGFyYl9nZW4gPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoZGV2KTsNCj4gPiAgICAgICBsYXJiLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlKHBkZXYsIDApOw0KPiA+ICAgICAgIGlmIChJU19FUlIobGFyYi0+YmFzZSkpDQo+ID4g
QEAgLTU1NCwxNSArNjcyLDI0IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9sYXJiX3Byb2JlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICBpZiAocmV0IDwgMCkNCj4g
PiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gDQo+ID4gLSAgICAgcG1fcnVudGltZV9l
bmFibGUoZGV2KTsNCj4gPiArICAgICByZXQgPSBtdGtfc21pX2xhcmJfcGFyc2VfY2xhbXBfb3B0
aW9uYWwobGFyYik7DQo+ID4gKyAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgIGdvdG8g
ZXJyX2xpbmtfcmVtb3ZlOw0KPiA+ICsNCj4gPiArICAgICByZXQgPSBtdGtfc21pX2xhcmJfcGFy
c2VfcmVzZXRfb3B0aW9uYWwobGFyYik7DQo+ID4gKyAgICAgaWYgKHJldCAmJiByZXQgIT0gLUVO
T0VOVCkNCj4gDQo+IFRoZSByZXQgIT0gLUVOT0VOVCBjaGVjayBjb3VsZCBiZSBkcm9wcGVkIGlm
IHlvdSB1c2UNCj4gZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUoKSBh
Ym92ZS4NCj4gDQoNCk9LLCBJIHdpbGwgZml4IGl0Lg0KDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxp
cHANCg==


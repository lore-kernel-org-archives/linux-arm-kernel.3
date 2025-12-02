Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517B1CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s+dhtFQvOph67Qd7/2j/TpuN9GmrcH5EJkIs8xpASA=; b=I3vMXjXUvbyReO9WaQLweUg7VC
	WQj5L1TIsAL46IDLyOgjfns944nQsD70kdwxPfCc9xtlYkqNLYO6gmu62xNHK/znOJgrPlYvnI6Lx
	SQ/KPYmgVjR1M3AilgFSOpcKmi2yM0/LF6AQFgU39fttg8+UGTBkFAH5zO7s6zMpY7uspKI35YVKF
	ytp5QyOoPiYy8gUZ6dM8jStVD0eXB+QOPr3beVV8lt1vUGPeyhA+QT0yIIbeIFQmoHE7d12yUcLPG
	eQwelq5Zc1OVF/NAPCu0LzGbWA+uVowuGJ1zKt7c6K5gJn4KERLC7H/zP5pOXQXPeEbgV+qZDJfrd
	WJd/Agyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLL7-000000051Np-1kJL;
	Tue, 02 Dec 2025 08:02:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLL4-000000051Mm-3Ssm;
	Tue, 02 Dec 2025 08:02:24 +0000
X-UUID: 38787ce8cf5511f09f706fa2197c6ceb-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8s+dhtFQvOph67Qd7/2j/TpuN9GmrcH5EJkIs8xpASA=;
	b=HfvCi4MK9bmgcVISKpgEO6DJF3I9WyPllzUb5DJrnzeaLO0oG85mmWOhWoAiaGPFgMZJhbkZuZt02++tXFuZIewZYzbLWM9ImbVAUphHbVYi+vwRuGdZjpYjgXfKfY1Ewb2O82fgtuJgtcBh5TxrOfSoCboTy1jbA4LKUIn0g7A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3cc155f6-8771-42c7-b058-2a9c19c2be8b,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:4704bba9-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 38787ce8cf5511f09f706fa2197c6ceb-20251202
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <hanchien.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1589120440; Tue, 02 Dec 2025 01:02:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 16:02:14 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 16:02:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCCHbOtcTlL/COUp+qdvjVxHO63XMOuRA2v6MgdPMVIs8BizNQu16keyvJiV9ZUnMadkWj/21JtOZl6nNEU6aIifV2H2Poe7jc8a9JFxzfYxs7q5J6TfUlBt/pAm9g1ZbN/z4yYB1fByD835F5kHYDaaBML+JdCrfNn9sV7uFeHQVRIKbDpcS8xr6oV13qEuEidQ5xE/0bLUyd4FUbOk4EXr6IdYtnhD8EIeaZSh2EWQBzxXtiJMrW59LwI3B+HvJ3zyplt8EJrs/9pQUUI7Jd6nwmevn6UoO/nXJvBn2ON8t5TWOXPdkNYu7narfuIUOa4Fb6JghQnJHWCynQDIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s+dhtFQvOph67Qd7/2j/TpuN9GmrcH5EJkIs8xpASA=;
 b=OHGgx+miT/B+EZGAUkqiNyI5+fWH5QzfEv0jTgGUJ0oG2s+Yp/zt5OE8so1A08A5+cWbACO962RPAJlkmdSU4/PXlc6LJdtT8lrmShe+MMHZ0WGKq6POw9XNWEVtSMtMeOBa/EJLcypb1+dCeSLys42N/m52tKrbyR7jR52D8VWE1FAhn8/h+DS7+9cVzjN4lelq7Yk8PSXQRIh0m68qeXULAETBC7gc2sQXWZ5PygW0dr0jmHSBFCKrr4K1fh+6qN7TO4on1PqNQHYAtBciD64y/gRha7mw0JhCjIE8HE3OxcNdYmwkEmALtq9p4XML9AdDyKsrxyoX4WvrCNU+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s+dhtFQvOph67Qd7/2j/TpuN9GmrcH5EJkIs8xpASA=;
 b=JNj+vLBXc0E3z4pFnpgUbd+HOrlHKnW7WvUZ6jVgQMllbZGyCwtrzRyNfb90VWNxT9WcgdZ/XWO0DkVjaiL+OSNDDEATdlx2hhODgrNkHCmhgGkK563TGv650ZNH4zXkIUwpAZaCpoA3WYvdriDuGSztVWnYy8vRLf0M+/2T7Q4=
Received: from TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com (2603:1096:408::9cc)
 by JH0PR03MB7610.apcprd03.prod.outlook.com (2603:1096:990:18::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:02:07 +0000
Received: from TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com
 ([fe80::f951:8433:7cd7:5159]) by TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com
 ([fe80::f951:8433:7cd7:5159%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:02:07 +0000
From: =?big5?B?SGFuY2hpZW4gTGluICiqTL+rwb4p?= <Hanchien.Lin@mediatek.com>
To: Conor Dooley <conor@kernel.org>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Balsam
 CHIHI" <bchihi@baylibre.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?big5?B?UmF5bW9uZCBTdW4gKK5dq1TZeSk=?= <Raymond.Sun@mediatek.com>,
	=?big5?B?SXJ2aW5nLUNIIExpbiAoqkyr2KWwKQ==?= <Irving-CH.Lin@mediatek.com>
Subject: RE: [PATCH 1/2] arm64: dts: mediatek: mt8189: Add thermal controller
 node
Thread-Topic: [PATCH 1/2] arm64: dts: mediatek: mt8189: Add thermal controller
 node
Thread-Index: AQHcUiZJIv7IUiojsEGonuWZx2ZU5rTsQAcAgCHfiMA=
Date: Tue, 2 Dec 2025 08:02:07 +0000
Message-ID: <TY2PPF3CC6FBD4C175126F814E558772D20E0D8A@TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com>
References: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
 <20251110094113.3965182-2-hanchien.lin@mediatek.com>
 <20251110-vagueness-waggle-50b8efe728a8@spud>
In-Reply-To: <20251110-vagueness-waggle-50b8efe728a8@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF3CC6FBD4C:EE_|JH0PR03MB7610:EE_
x-ms-office365-filtering-correlation-id: efc13559-d41b-490b-0ba4-08de3179169b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?big5?B?aTFQK2Q5Z20vMjYwamU5VjRDdW5ZcHBZeVhyQW9MUFQvRThqUWE5N2dJNmt3ZEdN?=
 =?big5?B?RWRuUDlpaGcraCsvUzBiVk9XWnUyZlVLS2g5RVNZUVNzS1dGQ0pTaDNXMC9NcHo4?=
 =?big5?B?bjJZRnFocTJUbTdUVGdBdGpHMmJLS1l2bkNhN3BMY0dwNVlLMzA5MTJMYjVvK1Bq?=
 =?big5?B?MDJlak9xeWZyZzhqRlU4UlhHVkpveGVrRnFxMWpyeHlrbW9QendRdjRGYmk0MEQx?=
 =?big5?B?dlpGd0MzeFhwcUZ4R081bE51elozU2dMQXhwNVF1VW1kMDk3QnhKTXVtcVNucWVW?=
 =?big5?B?cDE4ckp6UDJKRWJ0Qm5NdnVrWmozekhIWG9PVWNlQVhyNkVWQzRmZm13VG9VNzlZ?=
 =?big5?B?QUdSWjZxRm9FaWYrWUlVVk13bVppdExYbEFjZmlmQ2E5VnRBYmN5MVFFUkZ1STJ3?=
 =?big5?B?T2NmWXV3SFJDTkRMdDdhL3dEQnNzVUY3T2lOaGg4TWg3WWVjcXNITEZWMUVmQnNN?=
 =?big5?B?WXBWVmFtTGVCR2JHUnhseU5zTnRiRmFvbHM2OUMzTXNINk9SWG5IN1pZL1ZMNkNv?=
 =?big5?B?L041dE9uWkVqdkVlOER0dHU1MWNwckRzeW5mUzJ0QjZnelRYSDZGVWRad0ZVRTNO?=
 =?big5?B?WlorbnZLSWNXTU9qcmVsUzJWMUlFeWwyVHZ6OWkzVXBqdVAyWEVJZnRzZDZoa1Fn?=
 =?big5?B?UGMrSzZFN3Npa3M2ejlzZDgzR0hMb2g2TnZKUitWcnB2T0dva2J4a1YwTE9vSHBO?=
 =?big5?B?Uk9OQ3ZURU5LSnEzd1ZnNnBWZFR0cTI1Ylh5aG9mYU5FTFRqS1NlUWtkd0dVb2hr?=
 =?big5?B?WisyK2JCc3dvUm9jS2sydzdCOFZFS1dlN1lQalo5a1luWUxCRVk5WE5VUDJieWkr?=
 =?big5?B?em8rV3h2TElvNERPMWxCbDhnVndKcGE5cC9xRWxTbEV2SmFoUnAvdU10eGIyVXR0?=
 =?big5?B?eXpFNkpKMlJxK0IzdS9oZ0tzYjNuMEl6RGVrdHhKMmk4Z2EvbmtzUzIwMmRoTWxY?=
 =?big5?B?TFdTSWtiOUp0SWJlNmZmNjZ4UkpEMHdMMU1RY3ZOVDNmQlJBVFFkZ3dLL1RqVmpP?=
 =?big5?B?dXhhd0QrekVTRXh6cTVpRENSZ2JwbUtZMmJIb0JjUnZZRTdBTEIvc1FqWVZHWTdR?=
 =?big5?B?YVFGS0d3TGE4TzJudXdvVWlDMzlRcWdadzRWNVJwMDBHM2ZhZjVrMWRwUnNtYUhj?=
 =?big5?B?VlRNZmRJeHZyTUhtT01rbjNIcE1sbXg2MVl3dkRidzc0SzJyZVlYUDNLR3pISFhW?=
 =?big5?B?Rys4dnpqaDFxdWY4VS8zTUlDQ2xvZDN3SHpIWHcwb2lJMXJoa2RZcktoRUNYdVZu?=
 =?big5?B?UlltT3EvSE9kYWVRd1FtMUlwSitKMGFXbkYwVmQ2Z0tPMVR6N2F1R1psdzJnSWt6?=
 =?big5?B?aW5zWHVGZjlkR3BKSlBCcGsyeGVvQ3FwODdrZGtydEdoWkh1WU4zVnRROHZ6YnRH?=
 =?big5?B?aFNDbXNNOGh6d1lQWWZabEwrZGlaUzMzUHpmckU4SXRtTmM0RUF6Z0kxYzZpbjJr?=
 =?big5?B?VmJlRU1rRjcrbGlUTXlXbHEzTnYxREluMlN3NjhhOGR5SWhyUmlDK1BYRTJzSDFF?=
 =?big5?B?d1FqS3Njb1VxakQrOCs1eUppb2RjOHZtNTY4ZUFCalZjRDVqZjVpc21zenBsd0Zh?=
 =?big5?B?TTVyNGtCbVNLb0hyQi9uSm1zOE1YWkJRV2l3MVVTclNMVXNjS0dnckNwSXI5blh2?=
 =?big5?B?YUZwbXI4cnhuRnVxUWIvbmFwLyt5U1gvWGpkaHdsWkF5R2tzZ3E1Z0p0ajlMdXdt?=
 =?big5?B?TlBmQWRlb1p1SzJVbzJnYkFZZjhQL1hRd1U3V29QeTdnczlxUFVlVEovdGlrWnpR?=
 =?big5?B?S3FrVGhITlpaN0oxSnVrMklTOG51RHRhenUxY1I5NzZVclZPUWpQNlhOMVh0UFlG?=
 =?big5?B?a05mSGRoamsrOE0ySTdqVFk2R2Q0b1QrQ3l3Qk5ET1JTZi9PbUh2NWh4QXNicmJ5?=
 =?big5?Q?ZJ0AcyMQh4QPY5URcVLNhcABn9YyYfBceVvi/IiGqr0mEYon?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?cUVJc2pDZjNDbFlLTjdGUG9aK2JmckQzV0VabCtXTG1YR053dGpXSGNoMzl2ZzBG?=
 =?big5?B?TWRNZC81ZER1MVR0dUg3dDNoMVh5b25RZlorb1dqRjIvUlVmT0d6S04vd1RCS0VS?=
 =?big5?B?NWVyOFlpRndUSGZ6TitDcmhzYnBIZlBwcFJDLzdDQWhjaWxuS2I4QjdmY0crZm9z?=
 =?big5?B?aTdxQldTKzBkeW9GTjkzY1FGNkREalhvY0FEQ0xCa2VjNW85ZDNCejJoY1p4MGR1?=
 =?big5?B?ZlRBa3lvMUhIZmdDclBTWk1sTGU3TkN4SjloajVqYWJVN3h5Q1RVWWtoeWhXVHJq?=
 =?big5?B?T2JESElLL2hPc0J5TFcwZkJkM0JkN0pKQ0xwenlmcTQ2ZkRHOEhsMGtybzI4NzF4?=
 =?big5?B?aFB3STRKSDExQWlmS1RRRGlxY3JvV0IwN3Y4TUZsNkxBUEJ3RjVlN2NBbHpJek1P?=
 =?big5?B?YmhlRTNkVWs2ZGozVzUraHNORHNmaGtLMGZUbDRocWI2SmhMbENVckI0MXpvcWpR?=
 =?big5?B?dE5xVGpaNWlVQlpKbGlOdEcxYTkzd1ljZEFpMjNDcHBvWDlKdlV4WlU5OTR0emY0?=
 =?big5?B?UmlzNHdmdE1Lb2JLOXdCdG5icGFZWGl4aFJuYmJ5V3pGcXlzU0I3TnkraEdxM1N4?=
 =?big5?B?WDR5ZXpjeHZDWVN0Q0xkRi9sQkN0U2pOeWU3WFNvL0ZLNE1oR3oxS2ZQMll5bTBi?=
 =?big5?B?Y1lSMUozN3JyeVY5bEJuc3RLR3BFNXRORTI1c2tSSkdHWEZZOEJQVDc0dm84ckgw?=
 =?big5?B?YUxxMDVTSE1Bb242RE9nSTFuMkx2NHFRMWVNTzlTRmpuSXlkSUNhNjE0NjJraHFs?=
 =?big5?B?b1dsQmt2dEJMUURsR3d0UGNzTEpjMGFkbGp3aG9QbVZWUmpLSjZaaGxxRGNPSHM3?=
 =?big5?B?UlRyZnYwcWpaS216ZmhVYTRMdnUyZUJtY01aazYzeWtxWUltMmp5b0oyaSs0Y2E5?=
 =?big5?B?d2FVaTJSL2dTQ25HUXpLQWg0d1M5dUE3dEg5WjN2TUJXZDE3d1pnUndYdTVROEp4?=
 =?big5?B?Ukp2NVl6QTBKZGFqaEx5L0lvVzVGOWxFNjl4OE1iaEQvdFlRSWFnTWFXNjRTY3Fk?=
 =?big5?B?VWJLQ0xibkhKN1U3TmdYRVF6aFZCL20yN2IzTDZPWXNjZE9yME1EWUN5Tlo5bi9S?=
 =?big5?B?YlZEYzRuZzRHeUJhWHJkckdJOEJTYnBUU2t4cnBoQ1hnekJ3RVJ1NEIzVllNSlZX?=
 =?big5?B?OTJBYkdmNkZyRGJIMHJhRHdxNVA3MkNXeTIxWWs1U0JMb2V1RHNPME14MkhUNXd0?=
 =?big5?B?Z00zWmN1bU1Hc0txS2VZRERaK21zNCtCQjBuRHNibW9iUE15V3VVWk5ZT2dobkxP?=
 =?big5?B?TXkvSzkyQXFDL3lob0NTUjNNWnpmS2JiYXF4akFzRVViR1Jsc09JK2RyUWd0ZGYz?=
 =?big5?B?M1o1M29xL3A3Tk1vQ25WZGJYcERFL01pUU1zUzdNZTZKa0VKQTdaN0srSk5jTE5v?=
 =?big5?B?WEFsRy9jQ2E2WG05YUJua0xuWC9SSkIwMkx5K2xpUU9nTFQ3QlNyMkZ0dEFsMU5i?=
 =?big5?B?NlB6QnlsT0ZhM1lySnJRYlQ5UGN0cTFZQmhmNnhKLzUvR3JCWXdpeU1QR3VNck4y?=
 =?big5?B?cjdLanoyRWlucFZlYTJKNEprWlQ5UGhQTVFjd3VQS0F4T2hBeS9xSFd0dlVJVlVD?=
 =?big5?B?VmdickkrTHJYYW5nTFRMY05LQU1ocmVlNzExZU4yN3UvU01IaWFuSjlCTFRrMHhG?=
 =?big5?B?WDZaR0JaODVqT1JMcktacUZiSXU2SmlxT0hsOU9ocGdhSUZHeG1rNjhmSVJicjd5?=
 =?big5?B?dHNDN2lieGJEbU9OYVEybkdxaENYMEUwblI5TVljTjFJTFRidlByNUI5cFliTkVI?=
 =?big5?B?VTB4RUJvZlM5TGp6SExaSThkOU41eXhidEpuWFhKVC9sZkRsdU9IMWRsc1pLTG56?=
 =?big5?B?dVB5a09Ra0hRdC9ndVBkTzVNcXZ0YjNITVU4Skh3RW1QaC9MTnB1TTcxRGU2bkdT?=
 =?big5?B?UEdPZkV2MlhyK3JnN2U3QU9RdDJlb0p2SjZLVVFob2ZocWt1N0czbm1CWktjSmRF?=
 =?big5?B?UytiWUJkWjV5YkZzaDRBU0JnMjFGcW92aklYTE83SWdYVXoyOVc0SmZ1bVVraG42?=
 =?big5?Q?LrFAivATfBJgvYVY?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF3CC6FBD4C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc13559-d41b-490b-0ba4-08de3179169b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:02:07.2750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2C+9PKlf9qT9HYkJRRzagYyHZqst/kHogUK2FbRAJKw15Xxbz39JHD9DNzT9QM2u629wwMf7s9MK7oa8WsXOTGYasz0AHqpA7o7Vrj83R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_000222_923538_94F57FCE 
X-CRM114-Status: GOOD (  15.61  )
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

SGkgQ29ub3IsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gU29ycnkgZm9yIG92ZXJsb29r
aW5nIHRoaXMgcGFydC4gSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggc3ViamVjdCBhbmQgaW5jbHVk
ZSB0aGUgbWlzc2luZyBjb250ZW50IGluIHYzLg0KDQpCZXN0IHJlZ2FyZHMsDQpIYW5jaGllbiBM
aW4uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IA0KU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTEsIDIwMjUgMjo0NSBB
TQ0KVG86IEhhbmNoaWVuIExpbiAoqky/q8G+KSA8SGFuY2hpZW4uTGluQG1lZGlhdGVrLmNvbT4N
CkNjOiBSYWZhZWwgSiAuIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPjsgRGFuaWVsIExlemNh
bm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+OyBaaGFuZyBSdWkgPHJ1aS56aGFuZ0BpbnRl
bC5jb20+OyBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPjsgTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWls
LmNvbT47IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+OyBCYWxzYW0gQ0hJSEkgPGJjaGloaUBiYXlsaWJyZS5jb20+OyBs
aW51eC1wbUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IFByb2plY3RfR2xvYmFs
X0Nocm9tZV9VcHN0cmVhbV9Hcm91cCA8UHJvamVjdF9HbG9iYWxfQ2hyb21lX1Vwc3RyZWFtX0dy
b3VwQG1lZGlhdGVrLmNvbT47IFJheW1vbmQgU3VuICiuXatU2XkpIDxSYXltb25kLlN1bkBtZWRp
YXRlay5jb20+OyBJcnZpbmctQ0ggTGluICiqTKvYpbApIDxJcnZpbmctQ0guTGluQG1lZGlhdGVr
LmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBtZWRpYXRlazogbXQ4
MTg5OiBBZGQgdGhlcm1hbCBjb250cm9sbGVyIG5vZGUNCg0KT24gTW9uLCBOb3YgMTAsIDIwMjUg
YXQgMDU6NDA6MzhQTSArMDgwMCwgSGFuY2hpZW4gTGluIHdyb3RlOg0KPiBBZGQgZGV2aWNlIHRy
ZWUgbm9kZSBmb3IgdGhlIHRoZXJtYWwgY29udHJvbGxlciBvbiBNZWRpYVRlayBNVDgxODkgU29D
Lg0KDQokc3ViamVjdCBpcyBpbmNvcnJlY3QgZm9yIGEgYmluZGluZyBjaGFuZ2UuDQpwdy1ib3Q6
IGNoYW5nZXMtcmVxdWVzdGVkDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhbmNoaWVuIExpbiA8
aGFuY2hpZW4ubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICAuLi4vdGhlcm1hbC9tZWRpYXRl
ayxsdnRzLXRoZXJtYWwueWFtbCAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKy0tDQo+ICAu
Li4vdGhlcm1hbC9tZWRpYXRlayxsdnRzLXRoZXJtYWwuaCAgICAgICAgICAgfCAyMCArKysrKysr
KysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aGVybWFsL21lZGlhdGVrLGx2dHMtdGhlcm1hbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvbWVkaWF0ZWssbHZ0cy10aGVybWFsLnlhbWwNCj4gaW5k
ZXggMDI1OWNkM2NlOWM1Li4wZjdmZDY5ZjVmZGYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL21lZGlhdGVrLGx2dHMtdGhlcm1hbC55YW1s
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL21lZGlh
dGVrLGx2dHMtdGhlcm1hbC55YW1sDQo+IEBAIC0yMiw2ICsyMiw4IEBAIHByb3BlcnRpZXM6DQo+
ICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni1sdnRzDQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE4
OC1sdnRzLWFwDQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1sdnRzLW1jdQ0KPiArICAgICAg
LSBtZWRpYXRlayxtdDgxODktbHZ0cy1hcA0KPiArICAgICAgLSBtZWRpYXRlayxtdDgxODktbHZ0
cy1tY3UNCj4gICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWx2dHMtYXANCj4gICAgICAgIC0gbWVk
aWF0ZWssbXQ4MTkyLWx2dHMtbWN1DQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1sdnRzLWFw
DQo+IEBAIC01OCw2ICs2MCwyMSBAQCBwcm9wZXJ0aWVzOg0KPiAgYWxsT2Y6DQo+ICAgIC0gJHJl
ZjogdGhlcm1hbC1zZW5zb3IueWFtbCMNCj4gIA0KPiArICAtIGlmOg0KPiArICAgICAgcHJvcGVy
dGllczoNCj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gKyAgICAgICAgICBjb250YWluczoNCj4g
KyAgICAgICAgICAgIGVudW06DQo+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg5LWx2
dHMtYXANCj4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODktbHZ0cy1tY3UNCj4gKyAg
ICB0aGVuOg0KPiArICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAgbnZtZW0tY2VsbHM6DQo+
ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gKw0KPiArICAgICAgICBudm1lbS1jZWxsLW5hbWVz
Og0KPiArICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+ICsNCj4gICAgLSBpZjoNCj4gICAgICAgIHBy
b3BlcnRpZXM6DQo+ICAgICAgICAgIGNvbXBhdGlibGU6DQo+IEBAIC03NSw2ICs5MiwxMCBAQCBh
bGxPZjoNCj4gICAgICAgICAgbnZtZW0tY2VsbC1uYW1lczoNCj4gICAgICAgICAgICBtYXhJdGVt
czogMQ0KPiAgDQo+ICsgICAgICByZXF1aXJlZDoNCj4gKyAgICAgICAgLSBjbG9ja3MNCj4gKyAg
ICAgICAgLSByZXNldHMNCj4gKw0KPiAgICAtIGlmOg0KPiAgICAgICAgcHJvcGVydGllczoNCj4g
ICAgICAgICAgY29tcGF0aWJsZToNCj4gQEAgLTkxLDEyICsxMTIsMTQgQEAgYWxsT2Y6DQo+ICAg
ICAgICAgIG52bWVtLWNlbGwtbmFtZXM6DQo+ICAgICAgICAgICAgbWluSXRlbXM6IDINCj4gIA0K
PiArICAgICAgcmVxdWlyZWQ6DQo+ICsgICAgICAgIC0gY2xvY2tzDQo+ICsgICAgICAgIC0gcmVz
ZXRzDQo+ICsNCj4gIHJlcXVpcmVkOg0KPiAgICAtIGNvbXBhdGlibGUNCj4gICAgLSByZWcNCj4g
ICAgLSBpbnRlcnJ1cHRzDQo+IC0gIC0gY2xvY2tzDQo+IC0gIC0gcmVzZXRzDQo+ICAgIC0gbnZt
ZW0tY2VsbHMNCj4gICAgLSBudm1lbS1jZWxsLW5hbWVzDQo+ICANCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvdGhlcm1hbC9tZWRpYXRlayxsdnRzLXRoZXJtYWwuaCBiL2luY2x1
ZGUvZHQtYmluZGluZ3MvdGhlcm1hbC9tZWRpYXRlayxsdnRzLXRoZXJtYWwuaA0KPiBpbmRleCBk
ZGM3MzAyYTUxMGEuLjZjOTEwM2RmZGMyZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5k
aW5ncy90aGVybWFsL21lZGlhdGVrLGx2dHMtdGhlcm1hbC5oDQo+ICsrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvdGhlcm1hbC9tZWRpYXRlayxsdnRzLXRoZXJtYWwuaA0KPiBAQCAtNDIsNiArNDIs
MjYgQEANCj4gICNkZWZpbmUgTVQ4MTg4X0FQX0NBTTEJCTYNCj4gICNkZWZpbmUgTVQ4MTg4X0FQ
X0NBTTIJCTcNCj4gIA0KPiArI2RlZmluZSBNVDgxODlfTUNVX0JJR19DUFUxICAgICAwDQo+ICsj
ZGVmaW5lIE1UODE4OV9NQ1VfQklHX0NQVTIgICAgIDENCj4gKyNkZWZpbmUgTVQ4MTg5X01DVV9C
SUdfQ1BVMyAgICAgMg0KPiArI2RlZmluZSBNVDgxODlfTUNVX0JJR19DUFU0ICAgICAzDQo+ICsj
ZGVmaW5lIE1UODE4OV9NQ1VfTElUVExFX0NQVTEgIDQNCj4gKyNkZWZpbmUgTVQ4MTg5X01DVV9M
SVRUTEVfQ1BVMiAgNQ0KPiArI2RlZmluZSBNVDgxODlfTUNVX0xJVFRMRV9DUFUzICA2DQo+ICsj
ZGVmaW5lIE1UODE4OV9NQ1VfTElUVExFX0NQVTQgIDcNCj4gKyNkZWZpbmUgTVQ4MTg5X01DVV9M
SVRUTEVfQ1BVNSAgOA0KPiArI2RlZmluZSBNVDgxODlfTUNVX0xJVFRMRV9DUFU2ICA5DQo+ICsj
ZGVmaW5lIE1UODE4OV9NQ1VfTElUVExFX0NQVTcgIDEwDQo+ICsjZGVmaW5lIE1UODE4OV9NQ1Vf
TElUVExFX0NQVTggIDExDQo+ICsNCj4gKyNkZWZpbmUgTVQ4MTg5X0FQX1NPQzEgICAgICAgICAg
MTINCj4gKyNkZWZpbmUgTVQ4MTg5X0FQX1NPQzIgICAgICAgICAgMTMNCj4gKyNkZWZpbmUgTVQ4
MTg5X0FQX1NPQzMgICAgICAgICAgMTQNCj4gKyNkZWZpbmUgTVQ4MTg5X0FQX0FQVSAgICAgICAg
ICAgMTUNCj4gKyNkZWZpbmUgTVQ4MTg5X0FQX0dQVTEgICAgICAgICAgMTYNCj4gKyNkZWZpbmUg
TVQ4MTg5X0FQX0dQVTIgICAgICAgICAgMTcNCj4gKw0KPiAgI2RlZmluZSBNVDgxOTVfTUNVX0JJ
R19DUFUwICAgICAwDQo+ICAjZGVmaW5lIE1UODE5NV9NQ1VfQklHX0NQVTEgICAgIDENCj4gICNk
ZWZpbmUgTVQ4MTk1X01DVV9CSUdfQ1BVMiAgICAgMg0KPiAtLSANCj4gMi40NS4yDQo+IA0K


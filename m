Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B1D6ED00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=; b=B1ziYmVF2eJd09WBzqM3W1EN6U
	QxuDnmuaU7hDbgWTdFRRD/ltDC1kvXKg1b8Jdo/aEFWzj6YXRG55BGq7vUs0yiWfXbbuiGGk9fs4m
	xjeyM2lp+4WvYISRmiOpRNs3XaL9CXTbxc/UacPHzeDA19ht3vn2TKZZuoKUVAoQ+CF/piX8OLO2w
	I/IQyOG6TvLrOeH9f2WgnBzjikm2FTU5GQwpUsWVVwft8hoy8HbNIN+4BspcK8q56PAo1bfMmxvvS
	wiIbpA7k/u7/w9qQFRQnyjIKfpI5XIQLNNCUYdQaN9/JeS08eZakY7uVaUXBOaTNaBfvbrOjyT6Mo
	Xoae4b5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4eO-0000000HO6V-3rOn;
	Thu, 21 Nov 2024 10:43:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4dR-0000000HNxz-3sF9;
	Thu, 21 Nov 2024 10:42:07 +0000
X-UUID: 3e0036caa7f511ef9048ed6ed365623b-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
	b=Z8QA4o2FrdUGFLlsgDamgRr+M3HP5betyVp5E1ijYC4u4xXNzYvVzaXA9gG1DIrkp7wLEJYDrnnj26mQ7QWaMtW7MOC/1MsiTA92kdkRKnCw/29FcyCpAt4Kf8BQm0KwFMLcYXC2pWYFOuptfmhgpXONJQOXHgr8phHuLwOdFeI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:28db51a6-fc86-4b69-97a3-8fcb7d5dfe52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:86a794a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3e0036caa7f511ef9048ed6ed365623b-20241121
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1767607150; Thu, 21 Nov 2024 03:42:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 18:41:59 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 18:41:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQwTcuQtU+bW1S9SUsHQ6CZ1t+32bv0Dt2FVFfK3e9kXHROhYkiziF2YVU5EafbVTJRvIBqgV8xJPw8UBjbeoFPsGU2WK7uSwSoMLXu5CAgyN4hfvKweBRccAM6r8C8/HT8PjzkM7IFnzimJWR/Rr5h1MfggWrWdaNhzFkG8SnyLruviwP3HZAEv/CCb4I46NDtSdnuS3CCCAMS9zNAFi2dRNG1V9U/ceEw+p/cFFSOhMiEo0jvAof13WPA3vIh+N44U+t7J2z8qiMbhuoL8vZ8irSyW5c7uGaYhFwqM2d+fXSvZX4ZTUKgTwBbkDfF5gohzQMlLnevjImHsoGwegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
 b=WS07QTUyuInhtZQ52fE2+hNEqDUb6xzkwC/ZGmqocu7z8+qwoHYbc8rUSm9f8IfxfngtajyGClTTZ3pwCW2A8Ro8cOIuna6QosMGYG+zJaF7vtOK2kijR6yav/iw8BnVqC1JNzDFZwJsnfub2jG+OP3eJrkWL2mhbv5mq4vsbhxhy3JTgne30kMnQoY/vTTXDThs67+GCWxoqihxG9ytw60/ZVftNcar5gdcejb4hvyWxX9HAfnKRcSp1hCopcU74lYF4K8O773H5tnb2EXblY23914aY/5CLr6MrKRMFuGep57j6TgP8aXLVMr5V68VU/3M0hgOt0OiCZFr343E3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
 b=VkcgNsmSK//Ne4G4E45uvxpSMGHb451CTRafPVQiNsOWxkdB4GjD0LfPVwTRjD/ELb5DfsnSgrgCCuy1hJd9zwjbP1jBqUV75HVAk0HexA9zHwYnCAKowb8LBsD22IdZ/iotYE1gWiw6e4braJOW1iaQ8oHbJDpHzSgYKhKIpwo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6450.apcprd03.prod.outlook.com (2603:1096:400:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 10:41:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:41:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
	<ck.hu@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Topic: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Index: AQHbO82fKKr3P4M60EC0KHpKfsgs57LBSD2AgAAJKoCAADrzAA==
Date: Thu, 21 Nov 2024 10:41:55 +0000
Message-ID: <f4e6e86e0c929d45ca1af123fd7f4bb98072addb.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <20241121042602.32730-5-jason-jh.lin@mediatek.com>
	 <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
	 <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
In-Reply-To: <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6450:EE_
x-ms-office365-filtering-correlation-id: a9f5128e-c155-4b0b-5e54-08dd0a191e61
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a3p4cnh6L0Y3M0FQK0hBcGlzSkJmQzNYWVBicE5vd25zcXdBUXUwWDZ6cjBt?=
 =?utf-8?B?SytmQUFmY0xyWUdlcHh4TWpCSUZlN0wrNVRxa0oyVlU2a0hMQlJXVWZLYU9k?=
 =?utf-8?B?bzA0cVN4czNNR3F6RjJKakYzUzNGa3lTTzdMQklFdmU3YmNXZHpkR3RZTVBk?=
 =?utf-8?B?RGx4dXplZUk4Z05JRjRvM2g3K2h6N0J0bzFGVFBLZ21vZXlxaVhsMWhsa05Y?=
 =?utf-8?B?OGdDSmZQQmdXcERMcUVIR3lOaWd6M2E5cDJDaGFNZ0duM1VXeHEzSElGYXJr?=
 =?utf-8?B?LzFFaTB4cUpWallVcGZHb0pUeXUvMENUcHdYTUV3ZUlIblZQZFRXc01pS1Yr?=
 =?utf-8?B?K0JQb2UvTy9IUFcvdjFabS9yU0xieGU3RlBGaVJ0eU1ZaTlHaEdObll6dU1r?=
 =?utf-8?B?bGowZHNyK1dNNXJ5WWZFY09SOFVFZzV5MDc3WnFrM0lHVHZDc29BdHlTTFR4?=
 =?utf-8?B?Y3hWM1Z5RngwdUhaMnRCUUZsZG5wZUhHVWs0MCsxN2lNekIrTnoydHRWSUVq?=
 =?utf-8?B?NEZQVjllcU84ckFMdWl1QnJiUURScElHczAyM2ZFT3BXWmNUNVdQcHVsblJs?=
 =?utf-8?B?RjZJaWY2SzhBR1kwTTlrSVQzUGZqMTljWFFXQ2lUTHVtYlVPa0NLMFNBVE15?=
 =?utf-8?B?a284aDZxNkt6YlRLUWZUZDFaaUVWa244RXJnQzJDTnF0NTZTc2R3VTlNN21U?=
 =?utf-8?B?MU9MNGdYS0NIUlFDQ0J1bzROQmNjOE9zMlFiWkM2NTlUYm1uekJqcUx2Rlh6?=
 =?utf-8?B?N3ZkazI1OWt0SlppczJyRnFFMk1ZcUtvRkpwaStGN0twd1dLTlNLS0krLzcx?=
 =?utf-8?B?WkxqSXRkQjFteUJBMjFud0NkZTdDaXFPa3dkNW5KTnU0YWc3cE0rUjE1Z25s?=
 =?utf-8?B?b2VVUVNTWUpMTkJsNGFYcmlad3UwNXl0UUttSU5xaWUyT01GSDUyOFdia0l4?=
 =?utf-8?B?eTIyeE9aTlhna2hkdmRkNEhGQU1ZRjlaa3BhOXVRVzZJRTNzakJkUm9ScUdJ?=
 =?utf-8?B?WGlyOExVZzFUd2l2SUZvRzREVUNkdVVVam5mZXBscCtqV2dRYllKYU90aThh?=
 =?utf-8?B?SWUwUEF5dG9SNUl4OVlDalZmSkNKVkJYdjNkVUZlNC96NlVvdU14OTJ0akJY?=
 =?utf-8?B?RVdmQzhMRVc1Mzl1dGtKM09ZYWtwa1BKQkxjTjZuS2pVWXU5c0ZCVDBZcU1h?=
 =?utf-8?B?MHFSUFh1TTUxb3pRbkljR3F4bTBGZHJGR0hGM2VXb1Izd0NCN09neVduQVVw?=
 =?utf-8?B?Y0c5cStkd0szRnppalM1TVJDMXJoMUVWN1RwZTJwM0RRSVh5RHNldERkN1FN?=
 =?utf-8?B?UmhtcTU0KzExTEJRUERIVUNrN3dqMGJtaVR1dksyOXBSUkE0S0N3d2VsSXRZ?=
 =?utf-8?B?dVVzV3FzR3dZTEdjenowOTRnYkFDbFNVWExEL0tBNkphUENPUHRBZk1vYUNU?=
 =?utf-8?B?eThtM1htTlovVUE0dkpsNnkrL3R1RE8wd0EwSGoxWEt0YWpyc0EzYkZsTUor?=
 =?utf-8?B?OGU1empFMGlGQXIwTzNrVGtXakNSajZrdDMxS0hUMUY3Mmc4d0ZMcjVta0hs?=
 =?utf-8?B?NVFqZnh4U0RNOUl2K2ozYkZlQnFPV0owbWJTbTBaNFR0QXpYK0hUSGNiZXd2?=
 =?utf-8?B?MjNhcWJsS1dId0VqZUdoM01RYXlXVlNCNDdKZzRtT1FDSmJmUTkyaTUrcE0x?=
 =?utf-8?B?YnRKcGxHcmJFSzBUdDlyc3N4TE5xM1BEc0trMDF4Nm1yUmplLzZ6RE1idjk0?=
 =?utf-8?B?VWx2ZzFBOTZtVzU1VkEzRXNIZmhRQ0I2MlRJTGczb1dRZWpySlFCZnhkLzJh?=
 =?utf-8?Q?fGIiIytaCtfnEs2uIZ9kIsvGizkWIcWnwwp/U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUk5Sk54MTErVnR0dEVMYzFFcUJzZjlsYjVPZUk2dUovQWhsYmZKNTQrSFk4?=
 =?utf-8?B?bzNiaFVyaXJZckJ5YStpVzZ2SGo3S2dBYVJXMjU3U2ZXMWV0U204VmVkZ2Q3?=
 =?utf-8?B?emI3WmJTZGRFQldkdlE5TFlHc1VuOXoyZVJtVnpFWldTaWJhaVl3blpRcWhD?=
 =?utf-8?B?Q1dCdEcvQy9sWkFrTDZ1Wk50a0dCY0kyVHBJclFxdFk4R3E1VG9PZGxPV2Fo?=
 =?utf-8?B?SlJlNjBNWkN4R3BiYXI3M09iT2dWNDFBcGVOSEZtUDcwRzVhbVBnNk15MGF4?=
 =?utf-8?B?cnhtMUEvSnNDZG5NcWlIOWNPVE5QbGtlK1R0QmFwcHoyUUtHYWFnbC9WVTM2?=
 =?utf-8?B?TjU4YjhPdjFvYUNqSDhPM2dGWjJSNHRIOWZidHlMdjE2a1RIdng2MWZMMDdQ?=
 =?utf-8?B?clkvcGVmMGNWM1c0ZjRyV3kwOERweWh2RERPbmRULzRkTk1vT1M1ckt0ZjAv?=
 =?utf-8?B?R3NKOTZQNU1FYnRjWUZUK2IyR3BrWllaOHQzUmtxWFkveEcvYVZVU3U5MkpO?=
 =?utf-8?B?dEozdUFsUThNb1lNdEUzZTlNNmxyS1loQVVUdDROblFpYUhzL1IxMm1lclN3?=
 =?utf-8?B?c0ExanMrV01LT3huSk1FQTlGOGJidlQ0blpYSm9sUzRxQUNSakdVdkRRc2pQ?=
 =?utf-8?B?ZWJramNSMDg3UHZ0c0o4dUlkT0psNVArTzdmVjUyVlFkT1JjblJLbXZUY3Jy?=
 =?utf-8?B?ZXlwbFBraVdBb2todmJsNFlEY2prSWhjaEJsbFBqWDZKUHVKS3pPcHkrNm41?=
 =?utf-8?B?QmlVRnNPbzkwcllHb2gzcWdVcHZXbkE5a2NhNXhteWZocklxMXBnZHEyZlVy?=
 =?utf-8?B?WFFpbC9wM3hWVkFnay92NW9wYjlMeGJvR0FWc3QrUXdKODNMZlRtY054b2RN?=
 =?utf-8?B?S0V5bEtMZVkxWGUwQ3JxS25NMmp2Y2RvcFR4dFJkWnU0VkQ2N1BZRURGSFFS?=
 =?utf-8?B?b21zbGZqRjN5RVJYVXZtVUFCR084VnZ3UW03dVBrOFNTb21ycEFBMTU2dEZ1?=
 =?utf-8?B?KzFHSHIydU5rcDF2VUZUWmYwL1R5RU5YMDJmNGxnemJ0ZzdJQU94eUlFYk90?=
 =?utf-8?B?ckluSkNqTU4vQ0ZlM0FCUm9oT2h6dGt5dlJkdnZxb2trWUJSYUw5UjFkVmpW?=
 =?utf-8?B?QkFiWUFyeUlnM1JGYXFMaGxmZm9sSlMrSXNnWU8zVXFiSmFpTVpTUExSdEJK?=
 =?utf-8?B?SUZFakRoWGFmNDJjMTBKNm4vTUNYYWNZVHVQZk5EaUxibDBEcGtScTJiWktD?=
 =?utf-8?B?Y2FMNXJCRW9ydS9TUDR5SytaalBiOWdSY1M5NmpPcm1Va0VJWTdhdUlwcUNn?=
 =?utf-8?B?WXJFdjljUkxRczl5TmZ1WWhwSk1McnBYUXg1dXpNQTA0K2I2Skdvc01wQ0dS?=
 =?utf-8?B?Mnlyc3JQc1gzM2ZjRDFkS21PQ29pVS80K09ES2RZTUJLTkZMZlNkY0tZbkp6?=
 =?utf-8?B?cGwzMUlNRXhKSSt3K2NNTkk3S3U5RVNxVnlyT1ZVcDBYQUJOZzdIeUNJTk9m?=
 =?utf-8?B?dWhOQmZFeE5rZCttZVNzNldaaGZ0WCt0VnFIN0xCL1h6UmlXenNwR29TUnUr?=
 =?utf-8?B?ZWxZNUdkZG9GV0FZb0pCYmppWFF4dDlXM1dqcU95cjd4dFp6UU11a2xyQnZI?=
 =?utf-8?B?TUloVWQwM1ZYYnY2Qkw0bkdXWnVteWUxU05wV1NCWVhXenZ0UUhnaVZwTFpY?=
 =?utf-8?B?RzlzUXJOYnFaK3pFVWpCekNBbzE5ZEFxZVJPellLQi85VUxEanJhNWRxWG9v?=
 =?utf-8?B?VTQ2UndvdUh6MG1hUktQd2VqaUFFRzRBTXc3MThVYk5DTzRSUEl0dU0yeW03?=
 =?utf-8?B?WHdycVlZMnNTdFpuY0R4cDNjOWhpSEE3MG5kcFNNZisyRUY1cDlkM0JpbnIz?=
 =?utf-8?B?NU9SSWpOT1F4NG5XTHA4Q3RlajZqdUh4NW5TTllwUnJCR3FmcndOb05FSlVS?=
 =?utf-8?B?MEJ5Skx0MVZyZCtFVW1PTWNZNWc2WTRvM1ZtTFZGaUU2VVpQTVBTd3Z1SHF5?=
 =?utf-8?B?VGI2Z3VuSjFJRDlmYS9sSHJBOTJDcHdkc0E0elRuSWdTMWxlUytzdnpCN2Y3?=
 =?utf-8?B?WGRhL3A2UUw4RmNlaHlOcWlHMHpWdTQ2UW1LTDYwUlhXV3NIdlhQSE9iczFl?=
 =?utf-8?B?aW04enZZRVIzZ05XdTFFL3ZzRE1mUC9QR0ZuczdOWmdGemFNTllhb2VhNzNT?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D1756BCBB18646A3B46F450B296DFA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f5128e-c155-4b0b-5e54-08dd0a191e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:41:55.6056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QyfV4dcHWvjsjJFfkWnd2CI07evDNvv6g592gS6fOuqfundlD33U3/EwMEL7beFARTgiypNNps2sbIHYXikz0MijsFOgXzJXIzqeZvLKyXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_024205_978090_2A0E045E 
X-CRM114-Status: GOOD (  26.57  )
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

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0
IDA3OjEwICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gSGksIEphc29uOg0KPiAN
Cj4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDE0OjM4ICswODAwLCBDSyBIdSB3cm90ZToNCj4gPiBI
aSwgSmFzb246DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDEyOjI1ICswODAwLCBK
YXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gPiBXaGVuIEdDRSBleGVjdXRlcyBpbnN0cnVjdGlvbnMs
IHRoZSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlDQo+ID4gPiByZWdpc3Rlcg0KPiA+ID4gY2FuIGJl
IGZvdW5kIHRocm91Z2ggdGhlIHN1YnN5cyBJRC4NCj4gPiA+IEZvciB1bnN1cHBvcnRlZCBzdWJz
eXMgSUQgaGFyZHdhcmUsIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG5lZWQgdG8NCj4gPiA+IGJlIHVz
ZWQNCj4gPiA+IHRvIGdlbmVyYXRlIEdDRSBpbnN0cnVjdGlvbnMuDQo+ID4gPiANCj4gPiA+IEFk
ZCB0aGUgcGFfYmFzZSBpbnRlcmZhY2UgdG8gdGhlIGluc3RydWN0aW9uIHByb2dyYW1taW5nIGZs
b3cgZm9yDQo+ID4gPiB0aGVzZQ0KPiA+ID4gdW5zdXBwb3J0ZWQgc3Vic3lzIElEIGhhcmR3YXJl
Lg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiANCj4gPiBbc25pcF0NCj4gPiANCj4gPiA+
IC1pbnQgY21kcV9wa3Rfd3JpdGUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTE2
IG9mZnNldCwNCj4gPiA+IHUzMiB2YWx1ZSkNCj4gPiA+ICtpbnQgY21kcV9wa3Rfd3JpdGUoc3Ry
dWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTMyIHBhX2Jhc2UsDQo+ID4gPiB1MTYgb2Zm
c2V0LCB1MzIgdmFsdWUpDQo+ID4gPiAgew0KPiA+ID4gKwlzdHJ1Y3QgY21kcV9jbGllbnQgKmNs
ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7DQo+ID4gPiAgCXN0cnVjdCBjbWRxX2lu
c3RydWN0aW9uIGluc3QgPSB7DQo+ID4gPiAgCQkub3AgPSBDTURRX0NPREVfV1JJVEUsDQo+ID4g
PiAgCQkudmFsdWUgPSB2YWx1ZSwNCj4gPiA+ICAJCS5vZmZzZXQgPSBvZmZzZXQsDQo+ID4gPiAg
CQkuc3Vic3lzID0gc3Vic3lzDQo+ID4gPiAgCX07DQo+ID4gPiAtCXJldHVybiBjbWRxX3BrdF9h
cHBlbmRfY29tbWFuZChwa3QsIGluc3QpOw0KPiA+ID4gKwlpbnQgZXJyOw0KPiA+ID4gKw0KPiA+
ID4gKwlpZiAoIWNsKSB7DQo+ID4gPiArCQlwcl9lcnIoIiVzICVkOiBwa3QtPmNsIGlzIE5VTEwh
XG4iLCBfX2Z1bmNfXywNCj4gPiA+IF9fTElORV9fKTsNCj4gPiA+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiArCWlmIChjbWRxX3N1YnN5c19pc192YWxpZChj
bC0+Y2hhbiwgc3Vic3lzKSkgew0KPiA+IA0KPiA+IEkgd291bGQgbGlrZSB0byBoYXZlIGEgbmV3
IEFQSSBmb3Igbm8gc3Vic3lzLiBNYXliZQ0KPiA+IGNtZHFfcGt0X3dyaXRlX3BhKCkuDQo+ID4g
SWYgc29tZSBjbGllbnQgZHJpdmVyIGFsd2F5cyBoYXZlIHN1YnN5cywgaXQgY291bGQgdXNlDQo+
ID4gY21kcV9wa3Rfd3JpdGUoKS4NCj4gPiBJZiBzb21lIGNsaWVudCBkcml2ZXIgaGF2ZSBubyBz
dWJzeXMsIGl0IGNvdWxkIHVzZQ0KPiA+IGNtZHFfcGt0X3dyaXRlX3BhKCkuDQo+ID4gVGhpcyB3
b3VsZCBwcmV2ZW50IGZyZXF1ZW50bHkgY29uZGl0aW9uYWwganVtcCBpbiB0aGlzIGZ1bmN0aW9u
Lg0KPiA+IElmIHNvbWUgY2xpZW50IGRyaXZlciBoYXZlIHN1YnN5cyBpbiBzb21lIFNvQyBhbmQg
aGF2ZSBubyBzdWJzeXMgaW4NCj4gPiBvdGhlciBTb0MsDQo+ID4gbGV0IHRoZSBjb25kaXRpb25h
bCBqdW1wIGhhcHBlbiBpbiB0aGF0IGNsaWVudCBkcml2ZXIuDQo+ID4gKFRoZSBjbGllbnQgZHJp
dmVyIGNvdWxkIHVzZSAnbGlrZWx5JyBvciAndW5saWtlbHknIHRvIHVwdGltaXplKQ0KPiA+IElu
IHRoZSB2aWV3IHBvaW50IHRvIGxldCBjbGllbnQgZHJpdmVyIGhhdmUgZmluZS1ncmFpbmVkIGNv
bnRyb2wsDQo+ID4gbWF5YmUgY2xpZW50IGNvdWxkIHVzZSBjbWRxX3BrdF9hc3NpZ24oKSBhbmQN
Cj4gPiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKCkgdG8gYWNoaWV2ZSB0aGlzIHNvIGl0J3Mgbm90
IG5lY2Vzc2FyeSB0bw0KPiA+IGludmVudCBuZXcgQVBJLg0KPiANCj4gRm9yIGEgY2xpZW50IGRy
aXZlciwgdGhlIGhpZ2ggYWRkcmVzcyBpcyB1c3VhbGx5IGEgY29uc3RhbnQgdmFsdWUuDQo+IFNv
IHRoZSBjbGllbnQgY291bGQgaGF2ZSBjb21tYW5kIGxpa2U6DQo+IA0KPiBjbWRxX3BrdF9hc3Np
Z24ocGt0LCAwLCBDTURRX0FERFJfSElHSChwYV9iYXNlKSk7DQo+IA0KPiBjbWRxX3BrdF93cml0
ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQxKSwgdmFsdWUxKTsNCj4gY21k
cV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0MiksIHZhbHVl
Mik7DQo+IGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNl
dDMpLCB2YWx1ZTMpOw0KPiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERS
X0xPVyhvZmZzZXQ0KSwgdmFsdWU0KTsNCj4gY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAs
IENNRFFfQUREUl9MT1cob2Zmc2V0NSksIHZhbHVlNSk7DQo+IGNtZHFfcGt0X3dyaXRlX3NfdmFs
dWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNldDYpLCB2YWx1ZTYpOw0KPiANCj4gVGhpcyB3
b3VsZCByZWR1Y2UgdGhlIGNvbW1hbmQgc2l6ZS4NCj4gR0NFIHdvdWxkIGV4ZWN1dGUgbW9yZSBx
dWlja2x5Lg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4g
PiBDSw0KDQpJIHRoaW5rIHRoYXQgbWlnaHQgYmUgYSB3aWRlIHJhZ2UgZm9yIGNoYW5naW5nIGFs
bCB0aGUgY2xpZW50J3MgY29kZS4NCkJ1dCBJJ2xsIHRyeSB0byBpbXBsZW1lbnQgdGhhdCBpbiBj
bGllbnQgZHJpdmVycyBhbmQgc2VlIGlmIHRoZXJlIGlzDQphbnkgcHJvYmxlbSBhbmQgZmVlZGJh
Y2sgdG8geW91Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gPiANCj4gPiA+ICsJCWVy
ciA9IGNtZHFfcGt0X2FwcGVuZF9jb21tYW5kKHBrdCwgaW5zdCk7DQo+ID4gPiArCX0gZWxzZSB7
DQo+ID4gPiArCQllcnIgPSBjbWRxX3BrdF9hc3NpZ24ocGt0LCAwLCBDTURRX0FERFJfSElHSChw
YV9iYXNlKSk7DQo+ID4gPiArCQlpZiAoZXJyIDwgMCkNCj4gPiA+ICsJCQlyZXR1cm4gZXJyOw0K
PiA+ID4gKw0KPiA+ID4gKwkJZXJyID0gY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsDQo+
ID4gPiBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlKTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0K
PiA+ID4gKwlyZXR1cm4gZXJyOw0KPiA+ID4gIH0NCj4gPiA+ICBFWFBPUlRfU1lNQk9MKGNtZHFf
cGt0X3dyaXRlKTsNCj4gPiA+ICANCj4gPiANCj4gPiANCg==


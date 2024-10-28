Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DE9D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 06:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=; b=KDglQhKUQnoE2ozbleXqeaKSk/
	MksylcFcM+RO2cyzjrBsL8Ve9Mz8obwi4b/c18Xs2a/hAZg5GMWuM5+gtG54zaSXiN5G6YdKy2g1F
	LSpQGQJrldJLqAwBb2BilhzSkBcYgUjglCbNXRedePh0I5O2uoM2t/8VwchvuaVHHY3XpgD2bI3bc
	Jr76KWXjx4T0pJkE3ixufIr5f1wE7sXRAos0a4zPI56Olq4PtQew6OYsKjK/NOQnSEFI/cPUUoyKL
	2qeLAQXlgtxEtYi7tuUYwpZHpx57zgSqFNow7Ry8WmswHBfzwFsbvvm7HKvs5+/q7bG6gDynX1Us5
	nIdijCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JaT-00000009mS9-3LFh;
	Mon, 28 Oct 2024 06:50:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JYq-00000009mEI-2XDe;
	Mon, 28 Oct 2024 06:49:10 +0000
X-UUID: b702682894f811ef82ff63e91e7eb18c-20241027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
	b=WJJWbi+HGcDAc6ll5Wtv5tVQVu5bpCyLIoIzakLCjVOodw1TsAfQfpq+ul4/PpawZimsBzHiE+jPtt0q6wqcMSiebkJcLGPxMgnGyXtNI+hJZhlRxiFc/FzzpUrGS7BUSDGD1AZ3rVsLUsM+62blL/xrH8ZKi2kMDkM8CLBkIno=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:9d22bbd3-12fc-471f-8265-af8b4d2278d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c375f6cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b702682894f811ef82ff63e91e7eb18c-20241027
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 142567774; Sun, 27 Oct 2024 23:49:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 27 Oct 2024 23:48:58 -0700
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 14:48:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQrs18gZ5EBFQwGzfieM25rjENNittTBcX+ZIlDYTCB8wHmWjovLlwZCFUPKo3Doz/s/VfBC0EK1ulFr042ZS6V6wJnjzKF1k5uhrupwQNfc92Auwe7iNH+RxLKVuOyLIcv+RHGSnGnV+64MN06B8ZyHV+zv4un8ww3YmCTlCtyVjaR/cxyaKa2IVeV4sCrdM2H/fZJIDBYejl1KQNhB5RChI+Xst2tuLEWnPfia5LrxkaW2JsA6vURoL8CIj2ssx8VhTfwJJSma139KAxbiIaAfx+8eZNWpWt+/cGcCRUm+d1otnI+5JIwSKSX9xNoGQIGJ6pcuLkhszxzCHAy2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
 b=yZIFE4ZCfTRyDAgV7qJzu0ga+nReDtzNpQgJElC7QDN36OEPlUbH/20E74jdn5fRgnAMv1a0sDJyeb3lL/NcbL91DSBXMogwD6YXSbCa6O9XGWXl0DzOwUB2Moo1AK8YqwzDTDuzYJfsQom8RuOK8e2zWytz3UA4m/QRNqFHMNk1dX21UPG+ghB2Mup2Gsk5pqpTyuBWl3np0PkfeG4q8inb6QWigIIQFkjsmGKxASwfDXD1nauJZbocylfpVQBaSW6u0pguKOh+VtdIkk+zEExIcIaMC+tuiZvN35rAFso9LB+qdmKutRvEGvCx+YN4d1Vb0d9DNksnQYyBY2PI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
 b=tAgAO64bCdi0jUgsRus2T7NNxB3YOkqzv772ZFvWzZ7OVo8uuNZWOC/lWWTQKlhawmSiiN/BMbzGJZ0e9T5Snpj7nM7iFTqFm5wE6uze5MUKhrxThtmUlz2HBRTSAjMimV3GnnabyZ9O19u/uqU+yMysuxJzDdMG5wmg1CGy96U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7647.apcprd03.prod.outlook.com (2603:1096:820:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 06:48:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 06:48:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7Kb1luA
Date: Mon, 28 Oct 2024 06:48:40 +0000
Message-ID: <9ec4cdb2a5f86c045ec8ddb24de1545225c35d78.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7647:EE_
x-ms-office365-filtering-correlation-id: aff65d12-27c1-451e-5be8-08dcf71c8e96
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTA3cHY3b2lRYVZKSnFOSkJFSG5lbkJBd1hDbHF4azY1d2pWZEZLMk5LZXFM?=
 =?utf-8?B?T1VrZG1uVlJOREtYSFBuWit6Yi9MZ3BhVHlqejd3VjAwZVN2TGNPYzNFdU1i?=
 =?utf-8?B?bGtIZGliNGJ6S2dwd0ViVEsvbVFBUjdsdWpuZ2srczVuL0hGMUFYOFRITGJQ?=
 =?utf-8?B?STdzOXF6c2tBV3ZleTJoUlk5bS9qQVdtdWFHWGpTd21MNzBvbXpzKzNobzJ2?=
 =?utf-8?B?NGc0bklRa0cyWDlITTdlWnBuRlFaWXVCUXNPUHc3NUpxeXM3U21YNHhNV1BR?=
 =?utf-8?B?djB4b2NzdGt4bmFtb2k1Z2RjMFZiZFpaU29WU0Rzb3dIZmRSeStiemsxZzFn?=
 =?utf-8?B?cEM2Y2VnTlh6RXlZY0trNzEzamNhZ2ZwZ0NvUjFmSjZ3RmhjM0Z3djdkcjJK?=
 =?utf-8?B?RWQvZ25BakRKc1NKT0dZR0EyNlVDaGthTE1maG13bDdLSzU0cHdZbmRCSGhK?=
 =?utf-8?B?cnhiZDFrdHJEY1lESXYxWC91bzlTUncxREM3MWt3UmthNUpnZXpQTkxjU2Ni?=
 =?utf-8?B?TmFUQ0RtNGw3eHd3Y2pHZW5Ld3p3TmFlZ2J0bForS2k5czQyUnZxTXhqUHB4?=
 =?utf-8?B?NXd5TDdpYTBGVnp0MUVVRUprQTJGYmZPUEtLSEZEdmpYTURNcFA3ZjF4R2sz?=
 =?utf-8?B?cCtJYXdNdkgvL2hFZGJGRE9sMW5OUG4vV0h2Nm14VG5TUkJneDdVbjI3K3Fr?=
 =?utf-8?B?YjI4SzB4WWkxMjUvZUpwNHdVZmdxZVdqaTY4b1BRZlJ0K0JwV0JwZzA5TENV?=
 =?utf-8?B?eXVwRkJXc0ZDT1lEVTZEU1lJQkRpVDMvcWowcEwwenoyUloraUNsV25UMk5o?=
 =?utf-8?B?WmZERldnajRwQ080QWJteUdKSDVXanFtaThoYytGVXJNamNLZlY0bWNHblFm?=
 =?utf-8?B?d1ZRdHh2RTZ4VW1mVG91bmVOM0wrZXhNR3FtV29sUVNZNE1UTlowQlVEa3d3?=
 =?utf-8?B?VmVIUzdHQjRReEM3MXZWd1lMaTlSdWRBSTZpQityOVd1cXQ3VnRzek5qSkUz?=
 =?utf-8?B?eWFoTVpzaDlQMGRGWlRxRGN5N2tPVWM3YkxydDdBcWNUOUVCeDNoN0NyUk1q?=
 =?utf-8?B?dkNKdldKcGJ1SFltMllxZjRBMlRUcEdicVNpbEpoRk04TmRHZ0RDSGR6ZS9n?=
 =?utf-8?B?aFFBWWtuYUN4UkwxdFJDSUR5eExqMk5GcUg5WW1IeUJyU1dZc3NvbE56VFBm?=
 =?utf-8?B?UzdhUXZXS21ERy8vK05PekZTZmUrWDFqMzNwQUxhV3ljNzVRR1VyaXFPdUgx?=
 =?utf-8?B?cVNlTWFyWS80NFJISTBMZUFrSmRuck5qRkxUL0dUaGhsb3lYdDdNR1IrY3ox?=
 =?utf-8?B?UzFSNUp0NmxmcHY2YmVpQ3Q4VGcxMDBTdXo3MmNEMStLR25XTHJXNzBtQWpI?=
 =?utf-8?B?TzNqOHNaTjYyY2xrb3pwUzhBczVTNFNBOVJJREFOUU54N2ZoNk5xVElpTmxD?=
 =?utf-8?B?MWZXRTREUmdXdXhRZEVocHQyajFWQm9YTmtLcmIzN2pBenlJc0FyRUxrb0hv?=
 =?utf-8?B?OUgwWWFjczJXbU8vL1RrUnJLRCtITCs3dVVhbEZ6S3JjOHJ5Q2JET0NWUmxv?=
 =?utf-8?B?aXJqUWxLbXdsTGdEV3NwRWQvVUdkNXQ0ODh5c3M3TFMrbkRWVllYcTRlS3M3?=
 =?utf-8?B?eUFGVTM2cXdHci9ub1RSeGIzSFFLTXB4dnNpaGcrOTQ3ZGJ3QkNjMWZLN1I3?=
 =?utf-8?B?NG5oYldldngzbmYrd3QvMzZzdERibDRnM3hLWmdBZVhuc00xYWszRU5KV2ta?=
 =?utf-8?B?MmgycU1wY1FYMzlURnpHNk1vUW5TTVVXMVdMMUkrb1RoWHhlT2s5K2FLbEdG?=
 =?utf-8?Q?4ckLl6s4rnZpQUnaUiDT/v5uLxtUSdCQ2hRrY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG1laGNFVEhYQm53SDlHZW1URkEvTGdQRU83OGU1YWM4ZzV2Vm9DYmtncHhI?=
 =?utf-8?B?NTVMSHIzVXQwR0VpWkNYcTRzd3o0bG9QU3h3aUVHRm1wVnFVSXZ6R0NEWDhQ?=
 =?utf-8?B?b25NdG1FZ3pOejRIV0ttWVVpZGxYZTU1REllTTlISHRFdkNLdW0rKzNwWjJ5?=
 =?utf-8?B?VVlhNERvNjJrQWR4S2NvTjEwanNtemZWNS9ESHlsOXU2ZVlQS0FLNDlBZ1ZP?=
 =?utf-8?B?YmpUUkVvdTM0a2l5TmdxaTB6dEJsYnluT09oRTJjZnRaYXRrTmgrUGlZaWxD?=
 =?utf-8?B?ZHgvOGs4djgreFhBMU9VRTlPM0ZaRStOODhxeWNSdnJkZHIwN29WN004Wm1Z?=
 =?utf-8?B?VmprSXlGTkQ0bUdEc1Rlb21sam9KVmJ5MU1TdXJEQXZFNExmU3pIMlZzK1R6?=
 =?utf-8?B?MkNGQVA4YStVVlJuTk42SjBaalB1Z1RNb1gxY1o0bkZLZFFUbU9iWTc0SHF4?=
 =?utf-8?B?Sy9iSXZ3ZHFrYUlDL2k0RHRZdEVoRnVLOS9WUWJLdGhSelIralBiMFJmd3Az?=
 =?utf-8?B?L1prRXpnOEtsaG80TEh6TWU3OCtENnJwUDNydkZUMUVEUEV1eW5vV2o4OWpR?=
 =?utf-8?B?S1FhZnh5aEVQdW1sRzhrME9tRUorSG9kbndpV2tPT0VkUmlBRDFiSFdrMmZQ?=
 =?utf-8?B?NTIrYTZLSGZta2xreEQybXJ5bi9TRW0reHVCbzZtMnhSdFhhK3BKR1YrQkF0?=
 =?utf-8?B?UzdObERhdXU3VS8wZmJjTExnYXB0ZHhraWo0eXV1Q2JXTXJyUVA2K3o4ZjFD?=
 =?utf-8?B?ZlhHemdGVXZsb09aVTVldlF1Zm1LMk5BVzVxaFFlV09qSEFjMklONFdrYWZu?=
 =?utf-8?B?MlBreHFrSmUzdjd1dUdBOXg3ODlxYWxlTytsTGRneUUvMEt1UWMxK3o0emcv?=
 =?utf-8?B?QVlpUHp6VjFibks4cHhDMVgyVkxrSFBQOFpvYktXUW9DNWpHWVR5b2hLV2xi?=
 =?utf-8?B?RmdYazRydlBVRWZnMjh0ajROTThQdGdqcDNqbnN0M3JVbWY4Nk1jRlBhSWJT?=
 =?utf-8?B?T2w3eEF0K29TV3oxUk9NcjRjV1BFRWdYTWNGU1BleVJ6OCtzN1RCdnlOZDJn?=
 =?utf-8?B?dkhmdHp3VWw5ZVZtV3E4SjJEL3p3WGlXSEhxMWoxTGR1Nzd0UTcxUXQvaStS?=
 =?utf-8?B?bUQ3YmhIRTZTeVhVTGV0Q2VGNHZOSW5tYXhxQlJyQjZ6QVZsN1VidTlEc2Fh?=
 =?utf-8?B?UE96UFZBeGdNVEpsUkdLTG0vejFFQm52UGhFOHFCUGVKc2JoS1ppK01KMnB1?=
 =?utf-8?B?OEh6NlhmeGpVNkdibGhGamh6cW4vMTBWNndZSzdvTDNkNVA0aThlM204OEtO?=
 =?utf-8?B?d1lVcTBIalhTcE5FUWNzOUttR29jR0tNaFdoRENVbWRiQnF5bm5JcUFxY29H?=
 =?utf-8?B?dEhnaURFVHI0a1haMHJ4VmFCMWF5Qkp0VngvV0FUM0xzbWhKUlpydW9MLzQv?=
 =?utf-8?B?MHlxNWRDb2xpNGRqbHVxNU8zYWM5MUpPWXh5amhyZW5vc3BPWWZSYTNoRFZP?=
 =?utf-8?B?WWY0b28xOHFsODl5cmZjNkdkNWRzOGM5M3hWOW1KcXFjanhNdGFSa3R2aElx?=
 =?utf-8?B?VnVpZFZ6Z2szL1krenR0UGpOdjBoZzhLWFZzZ2Q2UlV3Y2dsUHAzYndMWkx5?=
 =?utf-8?B?OFhITVZEYnhFbEhzakhnNTUrd2YyTGllUHBaUzZPM2xkMG9uY3RCeGJ5ak1W?=
 =?utf-8?B?VnZnZ2djdW5mdUVRaUU0RGRiQjRjeVJLVUJhYW1QNjRRMjBEOHMzRzVXU0FQ?=
 =?utf-8?B?VHk3UFphNU4ycDIrTTV6My83S3VKVEd4Qk9tVUdnd21UWjJDZVFkaFpCZTN6?=
 =?utf-8?B?cmR4c0RDMFdsY1VYSHFzL2NQL0hXWGErTEp5MnNvaTVoQ0lsSXBsZ3poTEJj?=
 =?utf-8?B?bGR6Y0NKWnQxNS9RVWFjNGRXOXpDbitSMHVlUURURFl3Tkh2NFJvVkpPdldt?=
 =?utf-8?B?V254RDJWdVVDZlNMdmVIRWxxaG8waGMrSzJXOXVVbk1jUVJqTFFIYWZVZWdM?=
 =?utf-8?B?YjdQdjVld0VnYmhmWHF2OXNJZVhBVmF0TmQ1VCtITE9uaGttRGE3MmxsYVU0?=
 =?utf-8?B?VUVMOURNTWFyL3RaUEtjQ09GMEYvcTN1M0psaUNWdTdYSU1GYmEwcGlwZUJk?=
 =?utf-8?Q?Zba9WKxSx/LKA6l22vrqth+M+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A3A208928596D48BAFEC3E18DD222BF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff65d12-27c1-451e-5be8-08dcf71c8e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 06:48:40.2542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rc28H9SCQK40SI1awL8eCpbXvLx+HNRHLupnPi1u270b+azVOHS3IjtBMrMQyfOHYrMlNeQ0DGjNlNzHG4QA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_234908_783962_DB62A2E0 
X-CRM114-Status: UNSURE (   8.81  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX2NhbV9mb3JtYXRfZGVzYyB5dXZfb3V0X2dyb3VwMl9mbXRzW10g
PSB7DQo+ICsJew0KPiArCQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVW
X0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hU
LA0KDQpJIGRvbid0IGtub3cgd2h5IHlvdSBkZWZpbmUgd2lkdGggYW5kIGhlaWdodCBoZXJlLg0K
QWxsIHdpZHRoL2hlaWdodCBvZiB5dXZfb3V0X2dyb3VwMl9mbXRzIGFyZSB0aGUgc2FtZS4NCkFu
ZCB0aGUgbWF4IHdpZHRoL2hlaWdodCBpcyBkZWZpbmUgaW4gY2FwdHVyZV9xdWV1ZXNbXS5mcm1z
aXplcy4NClNvIHRoZSB3aWR0aC9oZWlnaHQgY291bGQgYmUgZHJvcHBlZCBoZXJlLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KPiArCQkJLnBpeGVsZm9ybWF0ID0gVjRMMl9QSVhfRk1UX05WMTIsDQo+ICsJ
CX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7DQo+ICsJCQkud2lk
dGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZVVZfR1JPVVAyX01B
WF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRfTlYyMSwNCj4gKwkJ
fSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLnZmbXQuZm10LnBpeF9tcCA9IHsNCj4gKwkJCS53aWR0
aCA9IFlVVl9HUk9VUDJfTUFYX1dJRFRILA0KPiArCQkJLmhlaWdodCA9IFlVVl9HUk9VUDJfTUFY
X0hFSUdIVCwNCj4gKwkJCS5waXhlbGZvcm1hdCA9IFY0TDJfUElYX0ZNVF9OVjEyXzEwLA0KPiAr
CQl9LA0KPiArCX0sDQo+ICsJew0KPiArCQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndp
ZHRoID0gWVVWX0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9N
QVhfSEVJR0hULA0KPiArCQkJLnBpeGVsZm9ybWF0ID0gVjRMMl9QSVhfRk1UX05WMjFfMTAsDQo+
ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7DQo+ICsJCQku
d2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZVVZfR1JPVVAy
X01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYx
Ml8xMFAsDQo+ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7
DQo+ICsJCQkud2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZ
VVZfR1JPVVAyX01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRf
TVRJU1BfTlYyMV8xMFAsDQo+ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5w
aXhfbXAgPSB7DQo+ICsJCQkud2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5o
ZWlnaHQgPSBZVVZfR1JPVVAyX01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwy
X1BJWF9GTVRfTlYxMl8xMiwNCj4gKwkJfSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLnZmbXQuZm10
LnBpeF9tcCA9IHsNCj4gKwkJCS53aWR0aCA9IFlVVl9HUk9VUDJfTUFYX1dJRFRILA0KPiArCQkJ
LmhlaWdodCA9IFlVVl9HUk9VUDJfTUFYX0hFSUdIVCwNCj4gKwkJCS5waXhlbGZvcm1hdCA9IFY0
TDJfUElYX0ZNVF9OVjIxXzEyLA0KPiArCQl9LA0KPiArCX0sDQo+ICsJew0KPiArCQkudmZtdC5m
bXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVWX0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJ
CQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hULA0KPiArCQkJLnBpeGVsZm9ybWF0ID0g
VjRMMl9QSVhfRk1UX01USVNQX05WMTJfMTJQLA0KPiArCQl9LA0KPiArCX0sDQo+ICsJew0KPiAr
CQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVWX0dST1VQMl9NQVhfV0lE
VEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hULA0KPiArCQkJLnBpeGVs
Zm9ybWF0ID0gVjRMMl9QSVhfRk1UX01USVNQX05WMjFfMTJQLA0KPiArCQl9LA0KPiArCX0NCj4g
K307DQo+ICsNCg0KW3NuaXBdDQoNCj4gKyNkZWZpbmUgTVRLX1JBV19UT1RBTF9DQVBUVVJFX1FV
RVVFUyAxNQ0KPiArc3RhdGljIGNvbnN0IHN0cnVjdA0KPiArbXRrX2NhbV9kZXZfbm9kZV9kZXNj
IGNhcHR1cmVfcXVldWVzW10gPSB7DQo+IA0KDQpbc25pcF0NCg0KPiArCXsNCj4gKwkJLmlkID0g
TVRLX1JBV19ZVVZPXzJfT1VULA0KPiArCQkubmFtZSA9ICJ5dXZvIDIiLA0KPiArCQkuY2FwID0g
VjRMMl9DQVBfVklERU9fQ0FQVFVSRV9NUExBTkUsDQo+ICsJCS5idWZfdHlwZSA9IFY0TDJfQlVG
X1RZUEVfVklERU9fQ0FQVFVSRV9NUExBTkUsDQo+ICsJCS5saW5rX2ZsYWdzID0gTUVESUFfTE5L
X0ZMX0VOQUJMRUQgfCAgTUVESUFfTE5LX0ZMX0lNTVVUQUJMRSwNCj4gKwkJLmltYWdlID0gdHJ1
ZSwNCj4gKwkJLnNtZW1fYWxsb2MgPSBmYWxzZSwNCj4gKwkJLmRtYV9wb3J0ID0gTVRLQ0FNX0lQ
SV9SQVdfWVVWT18yLA0KPiArCQkuZm10cyA9IHl1dl9vdXRfZ3JvdXAyX2ZtdHMsDQo+ICsJCS5u
dW1fZm10cyA9IEFSUkFZX1NJWkUoeXV2X291dF9ncm91cDJfZm10cyksDQo+ICsJCS5kZWZhdWx0
X2ZtdF9pZHggPSAwLA0KPiArCQkucGFkX29wcyA9ICZzb3VyY2VfcGFkX29wc195dXYsDQo+ICsJ
CS5pb2N0bF9vcHMgPSAmbXRrX2NhbV92NGwyX3ZjYXBfaW9jdGxfb3BzLA0KPiArCQkuZnJtc2l6
ZXMgPSAmKHN0cnVjdCB2NGwyX2ZybXNpemVlbnVtKSB7DQo+ICsJCQkuaW5kZXggPSAwLA0KPiAr
CQkJLnR5cGUgPSBWNEwyX0ZSTVNJWkVfVFlQRV9DT05USU5VT1VTLA0KPiArCQkJLnN0ZXB3aXNl
ID0gew0KPiArCQkJCS5tYXhfd2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCQku
bWluX3dpZHRoID0gSU1HX01JTl9XSURUSCwNCj4gKwkJCQkubWF4X2hlaWdodCA9IFlVVl9HUk9V
UDJfTUFYX0hFSUdIVCwNCj4gKwkJCQkubWluX2hlaWdodCA9IElNR19NSU5fSEVJR0hULA0KPiAr
CQkJCS5zdGVwX2hlaWdodCA9IDEsDQo+ICsJCQkJLnN0ZXBfd2lkdGggPSAxLA0KPiArCQkJfSwN
Cj4gKwkJfSwNCj4gKwl9LA0KPiArfTsNCj4gKw0K


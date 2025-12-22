Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663DCD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6mTZ3KfaYHHDtOF/exusqHByYhcNBQiWItkfF4F+UQ=; b=jjA1kFE1la++6SIQ86uYXhKnls
	rwnfNXHGNU35PE0hwVn7HMcTnKyaQABJ4QS8xJcQvU+++hslT7kldP46dqH8a7Yh5iwGP/9JqYS0y
	LYNs2ZZhpqhla//ZUOsy5Wxq0s8KuwZpsn9u06a3NyA6T42gay61qgevb3Ps8rC3vP5jcJaOo+i1E
	SK+ecbgRzdv4Y8EtnY0lFNV/5k7+hGgdz2opJeUoP3A2edQyFuckz7F28cX6dVi7IUCUt4Jvm2HMy
	+b4+5H8U5+RG0cV3IUEGRuWPSEPrhHT8IxGSuiFuemoTHRX9PrRh1hJn3zFhyi2057k75K+A5vyAC
	0wtrjblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbHd-0000000DRP1-40Fu;
	Mon, 22 Dec 2025 08:28:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbHb-0000000DRNQ-0Yhl;
	Mon, 22 Dec 2025 08:28:48 +0000
X-UUID: 3a43945cdf1011f09f706fa2197c6ceb-20251222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=d6mTZ3KfaYHHDtOF/exusqHByYhcNBQiWItkfF4F+UQ=;
	b=u2Xgm8tH96XnEIY/xornBZqiNT8IVRYy0g3hrCpIDlDeeEzU+mYtEhtXhrhOWGkfCb7j57m8y+iiW0kdyf09mnDgyR/j+5pn6d53oY2JrauyiEI30fIfUhO4v7BPonY7QyPYHfCC4oHF3IU6DL2iXwfUk60nrc7tCXKnVkIzBUI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:bb431d39-eee9-48ba-85f4-e3dc7a56b546,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:c4600903-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a43945cdf1011f09f706fa2197c6ceb-20251222
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126979080; Mon, 22 Dec 2025 01:28:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 22 Dec 2025 16:28:40 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 16:28:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0HjLIOXqWSFhnsOWRpGeQhJ7c4wff8FqJ3gHqjvJI/ih19hss2MzUlp+ekck65BNYOfw7pi7PJg0TBGhg1p4MtjTEHmSUZtCXGwWlVMQtBNKOZ14GnMHQO5rq9m37hJmsBxR3StDdcmN1uEyl/IFJKkCLZg0+ZfCStsKVjf5YdkI4cagylsA6CHxfXfnEgLErJd2iNw//Ef4y2nua2+Cne7bkuyaUiUndZfJvsLjmmE8dHm8VCiYnnBhtwTHFfkOxnW8kLfUOvxIQ1UF6DaxrvO+1vtMUhUlAe7QiabyYvPlQfadC13QHFfC97+gnV39P46ZZ3CYsFcv4cWtIvQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6mTZ3KfaYHHDtOF/exusqHByYhcNBQiWItkfF4F+UQ=;
 b=PW0kRHjoBkPTIamU6RG5zNsUoZkHNqRddtDh2eJ+F4CmT4JnDsmPOY41A8RzAhW2PYA8ES1iHuTN24b822Z7inAloq9cnjRSP32Im4V8S7+jcYsa0wPFGmm5CRu4xKKtnEceenw16FIWhB32IUmj8MNcXpFAlh63K7k31QgEfty/mTuKnQj1r3oIEcqEyVddWjc/0uDn5fqYcYOC3JFDy2+tsTGFZlCGD978TCapwg58U+e2XE0Wl/TGkj7sgingwYMUD4F9LjAWBpeQFmGCf6SNuI9cNf0HyKBE2HugZ/GBrKXtBx90MlOkX3eFz6dt2wCjxrTeaNLQe0KtRQKU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6mTZ3KfaYHHDtOF/exusqHByYhcNBQiWItkfF4F+UQ=;
 b=MkfVC7Hctdmg3w6BJNKIfcFhbBbS5XDzLPixAfuidtLfM+qXtRzhiT2vtbMdFP4WlRWycFvLOC1iyJhh0jgBFOlJBjdTXgLC/O4AJOXtB6JwQQVSPi5sQfrbLHnJaZtiT8iP6BYDIUH1lAS6QgBuly4xkVTn/Dm1FC5ZZ5FwkW4=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TY0PR03MB8200.apcprd03.prod.outlook.com (2603:1096:405:d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 08:28:38 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 08:28:38 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: Uwe Kleine <u.kleine-koenig@baylibre.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "Kai.Makisara@kolumbus.fi"
	<Kai.Makisara@kolumbus.fi>
CC: "avri.altman@wdc.com" <avri.altman@wdc.com>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 2/8] scsi: Make use of bus callbacks
Thread-Topic: [PATCH v2 2/8] scsi: Make use of bus callbacks
Thread-Index: AQHccMmTK/May6aVp0qM7Ut1RH2lvbUtWFyA
Date: Mon, 22 Dec 2025 08:28:37 +0000
Message-ID: <ba48917452f4bb168a2b76deb64d2edeace2c836.camel@mediatek.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
	 <a54e363a3fd2054fb924afd7df44bca7f444b5f1.1766133330.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <a54e363a3fd2054fb924afd7df44bca7f444b5f1.1766133330.git.u.kleine-koenig@baylibre.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TY0PR03MB8200:EE_
x-ms-office365-filtering-correlation-id: ac5d5b28-bd7f-419e-60d0-08de41341aec
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OU1PYXVCMFBIS1NPZGxKNXVpb1VnSDYyL3hTOWxqSWVnN0NTOGs2YkZuRUxz?=
 =?utf-8?B?bjJadzluY1BLRTJmRUhYNTlyWStMeG8yb2Q4ZlpaeGdjZnFDMTJ0Q2M2SmdI?=
 =?utf-8?B?RWJubFJURkdnWWh6LzVaM0J5Zld6OTllTmwwTVNhbFpveTBDaHd3WHUzT2hh?=
 =?utf-8?B?MnFxT3dvSDg4NEFTR2RDZW1KeGFFSFJ3WGh6UVdJQ3pqbnErdkZnbVZYNlRz?=
 =?utf-8?B?enNJazloQTlFRjBHeXY1NitNckd2YzhmWW5nN25MeFBIbkVmNGdMaVlBalN5?=
 =?utf-8?B?eTFCMnN3cDN0dHIvL1NzejhMYzBKNWZ1S1N2QVFTcTVjWndWUk8zdGFXcVpK?=
 =?utf-8?B?M1NENkJGY3U5NC91UHIzaUVwdjFhRExZeldFVmhLV2t4RnFSbnBhZER6dW9z?=
 =?utf-8?B?MFVGbVgydlFkblYrbkJMSmhtTHlGbmwzTHRwZm1qaXdRQTA4cWduMmVZTmlD?=
 =?utf-8?B?OHNnU2ZPMDZWRmx6UkdUN0Rwcmtpb3BMRTBHVkdITW5SOFdWMU80YWVYZ3Ar?=
 =?utf-8?B?dUx1QVpLU2NPMnBmVE5sMy8yd2JpUU5yTlVrSWsycERUK1ZybHVOSmkrS1dF?=
 =?utf-8?B?WW1UbXpQS3lJRGdDbkhDdkhPTjViL1ljVHc4aDNDV0xDQnZobWYrbGVWbWZU?=
 =?utf-8?B?YmxGcWlMMGIwY09qZ0QyQVJHTlI5N3YwMEsrS2hCNi9tcE5XVW5Vb2FkdXlp?=
 =?utf-8?B?SUptYTdjemRrRHdtNkVLSWh4dmdnMWFvTldYSlZnNGdYaFVBQmQwcC81M3Ny?=
 =?utf-8?B?SjJKbW5BK2tWdmZUVytZczFhQm1kYjM3OUlPaTVZL21vUEJ0YzJWMXFxeG5W?=
 =?utf-8?B?U2J4QlZCL1ZiTFhhYlZ6ZzYyQXlPQ2xjelpHQ2RJVW5SdnFETjdRMjdVcjFs?=
 =?utf-8?B?M0NGTTV5cjhBN1Z2MUFBa01xOEpBV2VnL0VBUE95MURCYkV0WGFhSWdIMmgv?=
 =?utf-8?B?NFU5MVZ2R2lrQWVKWTM1M05qT1UwQk9PM29Ub1NLRGhPOTNPYXhGcGJBblo4?=
 =?utf-8?B?MHluSmhNVjFhUW1rU1oxN2IzSUI1S1FZclYxNHFaZzg4VUJTRXlMOE9iN2I4?=
 =?utf-8?B?emEzL2VWZ2drK0Nzdit6dEMyeUMvbWNVLzNDREY2MCthWTV5czlJQ0FQRk5P?=
 =?utf-8?B?MHJPVjlxcGNZVWhjeFdmWW1TMEpiUlRUVTZKRGJEVU5SYXN3RHNnbWtLOVky?=
 =?utf-8?B?eUdScWl3ZTNZamswZHRiMWhoV25kM091NFYzZXdLNTYxdEltbzlGWG1hWXZO?=
 =?utf-8?B?ay94cFAzUHA1dlQ0QjUwSFAvTVdrTFFnOVBuTjdoVE00MXhpMktyMWRXck9r?=
 =?utf-8?B?ZzFFeHEzYkpzUmYrMEJlWnJhaEZjTHpqeDcydTJVNTkrUE9LeEZkeGRYbW1k?=
 =?utf-8?B?NnBtL3AzTXM2TWpxVlUvWE4xWjBJcjMxREhueWVyUmJaWkRJTHVqZ0krY2FV?=
 =?utf-8?B?QkFlUlNZb1B2SGZtYVNHQ1RRZWpwOGltVXliYVVSVHZZNjdxb1NRK2w2RGxr?=
 =?utf-8?B?MkR0OTFZQjNodWdKdXpFVFJ3RkdncmZJcXplRG91d2xwaHNnZzltQ2VTdW9s?=
 =?utf-8?B?dDY5VmRZUmltRkE2MUpDY2NYWmtlaFFNTVJLZ2VDaENrWVR1amo4K05peFdF?=
 =?utf-8?B?VnEyaTRsdE1OTUQzTWxMbGVMKzJ3ZlZ3S0dpeVYrVjRNby9FaFdVNENNbE9m?=
 =?utf-8?B?OWsyQzE4U1pRUzB2dDBLMmJPTWw4aFFZU0R5bUVPTWU4Q0U4eUZFOUttT1JB?=
 =?utf-8?B?Si9mRUxZZkcrcE04SVZiNjRVYk5nell1aGxxZHRMVlF0dmNCVGlpTWVZQnRG?=
 =?utf-8?B?NUNmOW50aXh0NmZmblg4eEhDQzRjNE1BcGJGUmFNYUMwV2JzNzBTWDVCWHBV?=
 =?utf-8?B?VjJROStQQmNGNFE4bmwvbUYwY0loMkNZSlRLbmY1WDZEUzhuR2xnekFZV0hO?=
 =?utf-8?B?Nks4NXU5OU93U0hjM0ZKdEJFNzhYOW4vV2xVaXFwUTdOSnlqWDV1TFpnTVVi?=
 =?utf-8?B?b1o3NVRyZmh6Qm1xR3M5OEtSY0llYnBoSmdhMCtZMVVPeVFjT1EwMk5oK2U5?=
 =?utf-8?Q?wp7Qly?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0xLaXN2TmR5UUV4QWtlL2ZVaVp5UldaZDZkNmFVcmhhVGY2WjJIMW82NnBw?=
 =?utf-8?B?K1lCYWtmZVpoL0FpNzdXdmdCSUQ3aUVHM09ydEVVcC9IeVdPRTZ4c3hrWUhU?=
 =?utf-8?B?OE16UCtVbnMrWEhmNjlLd1ZNOTRHMUZTdUN5QUExbkUycUg4OWhpd05JRHBM?=
 =?utf-8?B?cndhN3o5S0E3TzJkUFRYcmQ1blNGMGtKenU0bWtYR3g0UUlwalJSVDlPSmxM?=
 =?utf-8?B?UkhLb3VUcXU2Q2N5N3VLeG1EZ3ZVRG02YThiN3pZaUtPMUk5MkIwWTBIcWZY?=
 =?utf-8?B?UW9DU0NTZnlGcTc1dVJiRjlQVzZLZGgwbitVMjNXWjZmNW9jMDJOQmF4anRZ?=
 =?utf-8?B?ZFNHREtaazNHSTBpQVBxRzAyOVN3bEM3c3N0dEdGdjVLYlJya2dXWFQvcUpk?=
 =?utf-8?B?SGErWlp4MzJKZVNYQU9ETk53OVlWY3FzazJhTGhUdm9GT1ZRVjZxNzJDYkp6?=
 =?utf-8?B?aENEY3oxSTRJRzk0WTFUY0lsUzZhbFZ2Qzk5QWM1L1AxUElJeGM0a0cwb1kx?=
 =?utf-8?B?Z2JScmNvMG4wTW1TSTZPcTYxTFJpNHNsTklzN3FSTmVqTVRwMHhkVTdrcDdB?=
 =?utf-8?B?YWFQbSt0WnN6aTh3L0VnUk9FUFVqZkp1KzBhMGJpODF4bHgzVTVVWXRFUzdv?=
 =?utf-8?B?UGx3dlN0TldSYlQ4b0kxanBZSHBoYWNpTnYrdGgrVjNVTEZiVkVzTDVqS0d2?=
 =?utf-8?B?eFo0NGdRYzVzd1N4eEZCN0gyRXI4Z1pab0tYV2kwRmZvcWtxYzFzT1lGUFJr?=
 =?utf-8?B?UEE0ZHFMU3NlKzhMWHdNcTNoaDg4VEtna2F4dUFyL25jdzVNN0E2U3dnZVJo?=
 =?utf-8?B?SWZEYVRKOURQTUN6VmpYczRtb3BRK1ZiZTBKL2VJUjBWVFpaVXM3Z0JndCt2?=
 =?utf-8?B?aHhNK0hZM1MwQS9oK2h1TitCMVFZa3NlWVNqeWs5aXdUZGRYdTgvbWZhTFc0?=
 =?utf-8?B?SkhJMHhLUjZnY3pRUytzZHpjcCszM2kyNnZYdnd5bjIxYkNod3QwellBMTl3?=
 =?utf-8?B?N1hIRTh6QzFNbWpYMnZoZjhBekJmZlFHTjVkQnFUcTFObWxsOGhubmIxVktQ?=
 =?utf-8?B?TFpQVFFoWnQvU3hKeE84NGZ1bFdNNHNrS2JvQ3pTZ1A4aWRWcUNMellIeEps?=
 =?utf-8?B?aEtQU0M3aU12U1p1SXlLeENKY1UvVnlKVlFzbnB1NXdWNURJMVV1SndKQXRy?=
 =?utf-8?B?emtHU05ZRGVtZUl4aVpBcXRINlBTRHpBdUFJbmFZd1BCa3lDYWFQVVdzK1M3?=
 =?utf-8?B?RTk0Y3BMZDVIUkZjRlNFMWFxWEtsdzIzOWUxaGRSK1NXN2ZmZWJhcFYyU0h5?=
 =?utf-8?B?N3FIaDRGRjQ1ZXQ1cWVsSjkremxVUGw2RkdVb2d4LzVCVVQwdVFrVzVGWFV1?=
 =?utf-8?B?SFVENVJNeVR1UUhHTEd3U2w2ZzcwWUx6SlErbFVRL0xhajhyYmRBcHlRN0ha?=
 =?utf-8?B?ZXJYTVlnVjBXam90V085Y2owbCtjVjBzT0FtZldqNTBuTUZaNitBMVpyYnJj?=
 =?utf-8?B?Y09ickF3VlpnU0RqMHNrN1pnSzYyUlJQQ05GSFdFdUljeUlxUmJuMXp0Z2h3?=
 =?utf-8?B?aEsrWHgrZU5EOEZaNkxBa0ZibnJXNjVXcUY0bk1TdkwyM20xd2ZCc2lRaDJa?=
 =?utf-8?B?dGNROGRwN0hmV1ZibksxYkR3RHQxVzN5RFFQZ2RTaDBsUTVoOFo4MjZsRVdm?=
 =?utf-8?B?T0prSVp0NGNLc0hoeHVmUFZFd3ByZDNvbnRTNjFtbXNaV280YndhQ0dWaDA5?=
 =?utf-8?B?TGtja0ZYZ3I3U3BMaFhiYm5NZENhRC84bEt4SFMybm9oOS85ZFZNNWRQUTVN?=
 =?utf-8?B?Yk5tME1KLzFHQy85YTM0bC96b1ZzS1dQWFh0V3kreGE0VnNycGJsK3RxY3My?=
 =?utf-8?B?elMvYXNWSmIxaFRmSmFnMjEyR2NSMmpiRy9hZzBlVXpBN1ZXRUN3YW13RU1G?=
 =?utf-8?B?M1hZYU9XanNCRThXRWlrS2FvQWJPRTRXOGt5ODRFckJmV1UyU1Azc2FCa3c1?=
 =?utf-8?B?ektFejdGKzBTdFFRcjRoeCtHZDlqcWwyUmVMTHpPeDF5dnpoK1BPMDRtSXRG?=
 =?utf-8?B?MGJDZ05EM3NiWlVhVXk2RjI3QWVNMnIyRzdyYS9LbCtnMDlBK1ZCQkF1VlRI?=
 =?utf-8?B?TnFXZWtOY0pHWmtJWDBZajA5eTRnUkJ3cWVrUjNZalNsek9waWJXeUFqYzh4?=
 =?utf-8?B?ZUM0RXBnMDllUnBYVzFlenYzMzZYNytFdEFqUDZUUXRvSENycjNUbnorQitZ?=
 =?utf-8?B?Q1VEZzh6NmV5bTVXV0Zib3MrZ2JCSmw5KzFNUk1VRFZDL0IyUzZIS05lRG9K?=
 =?utf-8?B?bkJNK3A5Vy9oUkdmYzIxZXpEcTdYRGFLM25ZTEdZQnYxc3Jobm1aWjZYMURR?=
 =?utf-8?Q?SWPXRg1mYmFtdsoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4DCEA881F01BF40ABF08FDCB6C90805@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d5b28-bd7f-419e-60d0-08de41341aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 08:28:37.8524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjTKPw8u+Nhe3LSisLwxJPtDr5JH7j9dGkmuA8WCXqmlQuk2Rdu3ZM2Ch03fVBs85Azvm5FQYQ0uKzX12QYZyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002847_194932_A8338782 
X-CRM114-Status: GOOD (  14.11  )
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

T24gRnJpLCAyMDI1LTEyLTE5IGF0IDEwOjI1ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gSW50cm9kdWNlIGEgYnVzIHNwZWNpZmljIHByb2JlLCByZW1vdmUgYW5kIHNodXRkb3du
IGZ1bmN0aW9uLiBGb3Igbm93DQo+IHRoaXMgb25seSBhbGxvd3MgdG8gZ2V0IHJpZCBvZiBhIGNh
c3Qgb2YgdGhlIGdlbmVyaWMgZGV2aWNlIHRvIGFuDQo+IHNjc2kNCj4gZGV2aWNlIGluIHRoZSBk
cml2ZXJzIGFuZCBjaGFuZ2VzIHRoZSByZW1vdmUgcHJvdG90eXBlIHRvIHJldHVybg0KPiB2b2lk
LS0tYSBub24temVybyByZXR1cm4gdmFsdWUgaXMgaWdub3JlZCBhbnlob3cuDQo+IA0KPiBUaGUg
b2JqZWN0aXZlIGlzIHRvIGdldCByaWQgb2YgdXNlcnMgb2Ygc3RydWN0IGRldmljZV9kcml2ZXIN
Cj4gY2FsbGJhY2tzDQo+IC5wcm9iZSgpLCAucmVtb3ZlKCkgYW5kIC5zaHV0ZG93bigpIHRvIGV2
ZW50dWFsbHkgcmVtb3ZlIHRoZXNlLiBVbnRpbA0KPiBhbGwgc2NzaSBkcml2ZXJzIGFyZSBjb252
ZXJ0ZWQgdGhpcyByZXN1bHRzIGluIGEgcnVudGltZSB3YXJuaW5nDQo+IGFib3V0DQo+IHRoZSBk
cml2ZXJzIG5lZWRpbmcgYW4gdXBkYXRlIGJlY2F1c2UgdGhlcmUgaXMgYSBidXMgcHJvYmUgZnVu
Y3Rpb24NCj4gYW5kDQo+IGEgZHJpdmVyIHByb2JlIGZ1bmN0aW9uLiBUaGUgaW4tdHJlZSBkcml2
ZXJzIGFyZSBmaXhlZCBieSB0aGUNCj4gZm9sbG93aW5nDQo+IGNvbW1pdHMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsuY29tPg0K
DQo=


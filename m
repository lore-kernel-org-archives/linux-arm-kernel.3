Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF9D5A6C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EiF8/0EAJcYQ0slEbIoSxmP4tg/SDFYH5Y0vmQhTZc=; b=u0ae7h1hv0T8XLSrpVFcsSmZZN
	gk2AMVgWZfRlcc7OuMhNnuoJveox/vIQaAnd6C//vOOkIeLIAKZh0qwCxhiCwuDSX3EHUUO+Yk8Mn
	vj8/CsbgWm7iejiiQC8WvbvVfw/1dnt8GIauEnMIveF5rj5jbn61nHrcbVgrFFPbd9xEkl1jAA6pP
	Cul3DikENyDMU/RaskWKnbPL6Pq6HCgY/lkTsSbyR6HbBRGA65Pm8Jj/YFuNnuUTrkxXPjypWL9Xh
	6InFLSV7DjR71luGKQR6Dqn++pE36gG+UJgUc+h/7x5ccbUWWw9oe5X5SQA+Q/Y72I4mi1UJVavgW
	RnBnjASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFl0P-00000009Sim-35uv;
	Tue, 26 Nov 2024 02:08:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFkzS-00000009Sb0-1esA;
	Tue, 26 Nov 2024 02:07:47 +0000
X-UUID: 3849300cab9b11ef9048ed6ed365623b-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0EiF8/0EAJcYQ0slEbIoSxmP4tg/SDFYH5Y0vmQhTZc=;
	b=YV2NIjNy19vhfA+xfsn+arOcGWKVKEwHEd0D2ODqA5Rpke8c+iMFdkNr9eUW2973rg4n9Lyap4bJbHSv+ZuJX+M6uxo6By8EYifX5wmEv9PjJXqwL00l0VdBVQvomRYbqlkuNKMZWnJuw4yszfwtS9szsO3VwT9h5zW9DxmPnVg=;
X-CID-CACHE: Type:Local,Time:202411251808-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:16a8538b-cb25-458a-822e-ccecbca04969,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:d8e343e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3849300cab9b11ef9048ed6ed365623b-20241125
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1264506301; Mon, 25 Nov 2024 19:07:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 10:07:39 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 10:07:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6jicUigb2fI7HX2QyJtD5OTYRpXtVZX8a+0XYhdIlDMzUSX9Rh8I8HFvHZ9cpEEp2BxYYs4X5S4P5ZrPM7oyBSGRsxAotsRlSSZr279isUsSKKb6YCx6PyVCPSMOa9TxZBd1FOUs28Dcq3QbW50jk87NI6v0zHhW3pCiD/gxCuZEvOeiV7Csilid+sF1r08RScZzB6LE6L2it8eE6fffBZwSTNv+ss1l2oylX0ocOpG8RO4uQg7+Mn3Jw2i7realcksNa+W+93FXG9ppnMLxVj5EdlrH9MGMCsow51mm16XElDW+ObluKZtZ5d0ZXo9XRaAj6pKti+gye+lOtoSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EiF8/0EAJcYQ0slEbIoSxmP4tg/SDFYH5Y0vmQhTZc=;
 b=opWWVHqtFQnG3vr0mJJ5UA17CPI0/Dvks/3xk4oulmibkO9WaEF8JMSapwQM2eGXyZQ0PxMdFXLG7DOkjBPdypmyHErrg2hGifBP+j6FLTuZynEHULB+v0yyp+PtCtP/lKfZsWb+mDeMEvMwWcV7WT4Q+1+nmAfnpEByhnJ5tey5Hgehz9tVLi1aPGwUubH0Q+ojkGEQY6zLeWO+wsEWis2dK8WURO5u+5nx03wSxYySExtvkIWsq1eq6l81RTDG98Ly1stpuXI/ijdTfOD0gTv5Pn/0HdFGRoXlKCyvYsDwDMXULJV+Fz9/S5E0BjBimBZxsabCswRNfC55QVRydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EiF8/0EAJcYQ0slEbIoSxmP4tg/SDFYH5Y0vmQhTZc=;
 b=D4S12zhL3LeWQgtx/tehTHNkEeE6MwAtrtQrCZICbLIsj71uBvvaRFAe9kbujoRvtLzfmarLQWIJBsa2y55kDu/qDvzybQ7SONOnqZnWaivDHtHQ/WimprjhsAczsgDV/Csd37ixr35/heB5vbV/pJk94V03rm9a4pDxV95LM80=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7038.apcprd03.prod.outlook.com (2603:1096:820:c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 02:07:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 02:07:35 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLI2AIA
Date: Tue, 26 Nov 2024 02:07:35 +0000
Message-ID: <0e14e1d92be90c838ab097268a3674b38d48e51a.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7038:EE_
x-ms-office365-filtering-correlation-id: e69cb1d0-fef1-4ca5-2ccb-08dd0dbf1877
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXcvVGlGRzVRemtPc3NKZW9KL3VEdlBLZE5tK1ZIZmE0UzU2ODZZTlFsT2Q4?=
 =?utf-8?B?RSt3QWNoUUZtUEF4OFloR0lYQnhWSFBFbi9EYTNmOVQyWGVUNDBxc2R1dnla?=
 =?utf-8?B?NlgyZnhqTG1OMVI5czA0VUY5dmpEQWhUekFseXdMZlh6S0dnaGpJTHphRENn?=
 =?utf-8?B?REpvR0xYUmM5VC9pb25tdUI4SUZvY3hjUVZrL3FSdjRTSTRQa0t5TmNxOGpJ?=
 =?utf-8?B?Qmk2eTFKajQwaWJ1WjhzRTVJb0twZzQrZnRaclRQbXp1a0JFQXhyQnpyQUZ3?=
 =?utf-8?B?K2J0NDNrdWlxYnZxTVBiUU01bDVqd2V0bktLc2JrOGU5bTRZUkk3SmY2QzFn?=
 =?utf-8?B?S2Uwb1JSR3phN01LZThuUXMrMXpGS29MQlhZNkVyTkN4UFR2NzJHS0JFMTNG?=
 =?utf-8?B?cVlwL2JjaDJuU1NSdnhwRVNFdlAwOWlpQlIrcmZCR1FKVHZ6NUFCUzV5UmNs?=
 =?utf-8?B?Z2d2bmM5bk9IeWczaTd3VzhGSmlPdnlkbUlaU1Fsb21PdEN5Rk1MVG1iNU9v?=
 =?utf-8?B?WnVheWRrN2xvWjhMSXdjUU83Mk11TnFtcDFpdG9adzN3QlpCKzRTc3NqVmw3?=
 =?utf-8?B?TEw1RUFIQUdqdDZNYVozMDdqcFd1a05Qa3dUakJBcFRUWS9UcVdVRWlrNzFF?=
 =?utf-8?B?NS9NamQ2YWpvL0VmT3kwWEt5OW8wRmk3MHZ2SDFIN2x4d01YU3MyRzFMVkJu?=
 =?utf-8?B?UEVFcmhtbFlvWDJHNmtnc1ZBOUZCdDJsZ1pzWGRoYTY3eFFSRGh0ZG1yZDdP?=
 =?utf-8?B?U1FsWXVSTGhJZXZKZnIyRG1ZSzFVSnJJNldaMlFuSTVMUWtPN3BGT2oxYjF5?=
 =?utf-8?B?RDk5TWZNRWVHckwrNUppbWFJVHl5dnh1NjUvTm93ODdTMTlORE92a0N5UGZn?=
 =?utf-8?B?VlZJeEdlcVl0bjFqQmUvT2kyR3ZsdkxZdnFlNkNnZUVPL2lDdHFLQmF2UGVy?=
 =?utf-8?B?QitocEl5bnR2bnJsdkZTS0xra0tZTU5DNWQvcmVJdFNEMHZreXlJeXFFQUlZ?=
 =?utf-8?B?SlpvRFFSbWpNOER2bU5hMUN5aFhrSVFEVGVSU01YZHlQRGx5TDFwbzFRUFNr?=
 =?utf-8?B?RVFIYlJ4dldDYy9pVnVJS2l1Y2swOTk3OWdUZkp0eHA4ME1ZcUo3TnNEZDR5?=
 =?utf-8?B?SE9QTmVHVWsvb0JmYVk2RE5ERm9TWmZGY2xhTU1peThIQWkxTHZOTnN0QWpE?=
 =?utf-8?B?UFMrYmNGTlpxZ1RQN3ZlWnhYd3dVcVp5Tk93RFNCSTRGallvRmJWamxsdllp?=
 =?utf-8?B?Y0V5N0ljMTc1U00yb1BsWXdMWmViS2tYSThHNVZ0R1ovaUhyNUFLdVBqZXhl?=
 =?utf-8?B?QXltNEtFMUFJRTVLcCtmR0hqa011aEFnZzlEWUdQNzlLdGx5cnFpSUtlSHha?=
 =?utf-8?B?NllFcmVmM2h0TEpSZk1tLzJyUUtkazR2Y1RpcGxHQ29XbjhsOURGTlU3KzVp?=
 =?utf-8?B?S0dXWTZuK20ybndVUGY1S3BISXk3MTNSREdJY3FZemR5WGJsbjlvV0FEUklw?=
 =?utf-8?B?bHNDVlJ5WXBvdkRUWjNhVGhneEMrVytBRktwQkxCNnhGOEZDZWkvdlJTK3dE?=
 =?utf-8?B?Q25Tbmt3bU9qVHBnWXFTeC9jcFBMdUsyUXhaSFIwU29peWxYaS8xeTNPbjcx?=
 =?utf-8?B?anlWMW9OUWpReUw2RitYdWxTMEJ3cFZmOUZxTi85R3B2SUg5UXN4OUpURWNZ?=
 =?utf-8?B?MDhKQi9IblBZRUdsbW1CajRkTHd1NjdGb0tkSDFiOU01QkFVdVMzVW1VdkJx?=
 =?utf-8?B?Tk9RL3dsVGR4MU9Sc09WSU1FWUNCUVIvbllnMlNEZndYSEkvQ3ZNMWd4aXpp?=
 =?utf-8?B?NGV2cG41M1NEakdRMkRNYzVrVk9aYUFTQzY3YW9RanhpN2NpZ3hJN2czSlhH?=
 =?utf-8?B?TDR0K2pXN1NnekppT2dmUFkxWHNIcTdIbHNDUFlNRmU0cWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjBCOCs0ZmRRTEpRcHR4eVVZZHNVQ0FENkc0OUZiRzJ0MFREQ1dObnhSYjVP?=
 =?utf-8?B?dStUaTVsajhXRDlnNjFYQVVzdmN3T0hqSWRWQ0FkUmhNWm9zVXA2VUpzQUNq?=
 =?utf-8?B?V0I5VEp3NzA2OXdBdkdLYWU5cWtuNGJ5LzFjTkNOTHBWaitKN2VjR0xYSDMw?=
 =?utf-8?B?OCtvYWhuWVVFeTdMZEhYditpdVB5MkVIRjBNWTF1dmRJTFdmUFJqUEhZYW04?=
 =?utf-8?B?YktGb3dXSXNscG9XNm9lSW1jT2wyUUFUYVJad1QxR3pyTVV1MllOdmwwd2Nx?=
 =?utf-8?B?T2Z5YWsvTVA0bVh0WlAzODJBZHg5SHN0MTVIdTAyNzd4VStYamZHQ1dPQklj?=
 =?utf-8?B?bm9iZ2dXNmVYc0I1MjFkMWhTR1JEbCtaWHdsVjVYcHdpbTR0Tzlpam9wOWsv?=
 =?utf-8?B?UFl5aENpd25vL09jZG45ajJCN0tQL3o3N2hmN0hLaStiZWE2aGtZVTdoczli?=
 =?utf-8?B?cWlnMEswRFpWOHJrZ3FTTUJRcVovMlJpdFlxdVpJeGo1VDBDcHEvL1hFcElK?=
 =?utf-8?B?Y3psamZrMlFzQW1GVWJ5dDlEa0hpUVRBdTZ3bG9SUXNjZzhta2l3VVh1Rm9B?=
 =?utf-8?B?dnpkYXpXVkhrVnNuK1ZtUGFUTHo0Vm5FcTF0TTVCYXZ5cm51cEhORk5GYTFQ?=
 =?utf-8?B?V1VPWmtQbjlDenE1U1Vta1NqR29UZElXeGVUS0M5T1Y3SmxiRDNGeEx2d3Rq?=
 =?utf-8?B?ZStNRnNySENFUngyU3VWWU5Xd3k0bmt3Rk12akp2SU1SZk9IbERJSlQwM3pU?=
 =?utf-8?B?Q1hsaVF2WngveGkwWURyOVJoblA1SjJZTzE4dUEzRTlMMWUwaTRZUXo3VnFR?=
 =?utf-8?B?STRJN1JocWtXNjB1cVNZUzlIS0pUd291d1FHUnd6SllDYk5ST1ZrM1h5MlJX?=
 =?utf-8?B?ZWxxRlZMc1ZrWFp5MS9NNzl3V3NlUWtaaGhmYmZleWdnT3UrM1d4cUgvMTh5?=
 =?utf-8?B?b25Ibnc3TmVvd3pyRldDU3hkQVYyU085TWJocjFzaFU5TWRZUHNsalV1S2Qr?=
 =?utf-8?B?VWZUS294U29jS2QwSXlLaVlWd1dTa0lTTGR4ZjRkQTBNUERJczdyTWVRRFJJ?=
 =?utf-8?B?TUx4THI1UVBmMFFMZytTQmRaVjJTUnNzaVFSQURUVnFvaW1kNC90ZWVlZEtD?=
 =?utf-8?B?WUx2eXRCdDZaSlFsUHVUWDFKRzBJOFFyUWhGNlJUU01JdktmcUNhd0hOSU4w?=
 =?utf-8?B?U0JmT2xqUHQzZG9MemJqUWIvVC9QaERORy9HU0xuT1ZweWVxR1hUQXFpWmIw?=
 =?utf-8?B?d3JmVys4TUVVaVQ2cXhnVWdoUmdMbGpGTUQ2SGpEQlJnWnloVU1rY2xTR3Ru?=
 =?utf-8?B?Q1ZvakVJZUdwN0RwaGc1OUFNWHRWRi9KbGtheGJQRlR0a0RLbExNL2RjMFor?=
 =?utf-8?B?TmZhMSt2V2dieVMxTkY3ZnZXcmNKd2VpZ3Z1RTF5cTJaNmpybXBrbTNhaEVU?=
 =?utf-8?B?THZFcXpaaldxV25YQy90TUxWQy9YbnUxdVlFZkpyWVNmTUltV0xOamR1SW9H?=
 =?utf-8?B?cE1EaUUxbUpiNS9hWjIwRENTRkdNc0NPOGFVdW9obG9KWHdUbGZJWkZ1cjhs?=
 =?utf-8?B?WkZ0NzA1ZkVyd0gvaDZXY1hwT2lEWHR6di9ucjdDRWg1UHIwN0MyZXFaSllS?=
 =?utf-8?B?ZENxL0tKVXpoS1E0SCtPb1dPQjNocE5jYTdoeUZiZGJVazRmNXQ1cHZwRE5Z?=
 =?utf-8?B?UUV2US9FK2p5UGdiWTF5c3podlRNTG9iMm5BUHNJVXZyOGxuOG5zVHZaa2FN?=
 =?utf-8?B?bGY4bnR5OTBSRGtvcWpOTE9vY25JNTNkbktBckF3cDVyalN5b01XQU5ieGgr?=
 =?utf-8?B?c3dWRGdacm9STENTa1BnbkFtUG01S2VCKzQ4S1ZtMGd4bEdMeTZHMXBVaXl2?=
 =?utf-8?B?aHoxVmFCU2tzaXNkV0lJaVZUTE5INTFheVJNWGJGdXRNcGpEcXFOOEwrVGQz?=
 =?utf-8?B?TnBpcWpVTDZFYmswMm8zcHZ3NW9BMnRldGtaTlF3bHlHUm1KRStjMWNZQXdh?=
 =?utf-8?B?dHk0Tm11bGJuUTU1WCtwbHlUUGdyeDY3TjdJQXlKQnR5T3VZbDdmQ09mK3dz?=
 =?utf-8?B?MUU1dUhMY25obkRaT0ZJa3RIdnhIM1R2aGE4ck1hSG41eTF4V0hUWTZLNnlH?=
 =?utf-8?B?SFZMSkJlRGVlYnlKMjVDcWdodWk2TDZtS2xpc09nR0M3a21JZEdDejBjZW44?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B984EF86BD9D04AADC20E9253CCCED6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69cb1d0-fef1-4ca5-2ccb-08dd0dbf1877
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 02:07:35.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0Bbs/62amMYc8FuW2wuj1D9+VRdAC5ii0N1tLpqQhTQu0mbpgwmJlgGtYmF+rsbnYQIkI+R+TMbXwSaOxOQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_180746_442871_1D56C4D6 
X-CRM114-Status: GOOD (  13.60  )
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

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGNvbnN0IHUzMiBtdGtfY2Ft
X21idXNfZm9ybWF0c1tdID0gew0KPiArICAgICAgIE1FRElBX0JVU19GTVRfU0JHR1I4XzFYOCwN
Cj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1NHQlJHOF8xWDgsDQo+ICsgICAgICAgTUVESUFfQlVT
X0ZNVF9TR1JCRzhfMVg4LA0KPiArICAgICAgIE1FRElBX0JVU19GTVRfU1JHR0I4XzFYOCwNCj4g
KyAgICAgICBNRURJQV9CVVNfRk1UX1NCR0dSMTBfMVgxMCwNCj4gKyAgICAgICBNRURJQV9CVVNf
Rk1UX1NHQlJHMTBfMVgxMCwNCj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1NHUkJHMTBfMVgxMCwN
Cj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1NSR0dCMTBfMVgxMCwNCj4gKyAgICAgICBNRURJQV9C
VVNfRk1UX1NCR0dSMTJfMVgxMiwNCj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1NHQlJHMTJfMVgx
MiwNCj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1NHUkJHMTJfMVgxMiwNCj4gKyAgICAgICBNRURJ
QV9CVVNfRk1UX1NSR0dCMTJfMVgxMiwNCj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1VZVlk4XzFY
MTYsDQo+ICsgICAgICAgTUVESUFfQlVTX0ZNVF9WWVVZOF8xWDE2LA0KPiArICAgICAgIE1FRElB
X0JVU19GTVRfWVVZVjhfMVgxNiwNCj4gKyAgICAgICBNRURJQV9CVVNfRk1UX1lWWVU4XzFYMTYs
DQo+ICt9Ow0KPiArDQoNCkZvcm1hdCBpbiBtdGtfY2FtX21idXNfZm9ybWF0c1tdIGlzIG1vcmUg
dGhhbiBtdGtfY2FtX2Zvcm1hdF9pbmZvW10uDQpJIHdvdWxkIGxpa2UgdGhlc2UgdHdvIHRvIGJl
IGNvbnNpc3RlbnQuDQpSZWR1Y2UgbXRrX2NhbV9tYnVzX2Zvcm1hdHNbXSBvciBlbmxhcmdlIG10
a19jYW1fZm9ybWF0X2luZm9bXS4NCk9uY2UgdGhlc2UgdHdvIGFyZSBjb25zaXN0ZW50LCB0aGV5
IGNvdWxkIGJlIG1lcmdlZCBpbnRvIG9uZSBhcnJheS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2NhbV9mb3JtYXRfaW5mbyBtdGtfY2FtX2Zvcm1hdF9pbmZv
W10gPSB7DQo+ICsgICAgICAgew0KPiArICAgICAgICAgICAgICAgLmZvdXJjYyA9IFY0TDJfUElY
X0ZNVF9TQkdHUjgsDQo+ICsgICAgICAgICAgICAgICAuY29kZSA9IE1FRElBX0JVU19GTVRfU0JH
R1I4XzFYOCwNCj4gKyAgICAgICAgICAgICAgIC5icHAgPSA4LA0KPiArICAgICAgIH0sIHsNCj4g
KyAgICAgICAgICAgICAgIC5mb3VyY2MgPSBWNEwyX1BJWF9GTVRfU0dCUkc4LA0KPiArICAgICAg
ICAgICAgICAgLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NHQlJHOF8xWDgsDQo+ICsgICAgICAgICAg
ICAgICAuYnBwID0gOCwNCj4gKyAgICAgICB9LCB7DQo+ICsgICAgICAgICAgICAgICAuZm91cmNj
ID0gVjRMMl9QSVhfRk1UX1NHUkJHOCwNCj4gKyAgICAgICAgICAgICAgIC5jb2RlID0gTUVESUFf
QlVTX0ZNVF9TR1JCRzhfMVg4LA0KPiArICAgICAgICAgICAgICAgLmJwcCA9IDgsDQo+ICsgICAg
ICAgfSwgew0KPiArICAgICAgICAgICAgICAgLmZvdXJjYyA9IFY0TDJfUElYX0ZNVF9TUkdHQjgs
DQo+ICsgICAgICAgICAgICAgICAuY29kZSA9IE1FRElBX0JVU19GTVRfU1JHR0I4XzFYOCwNCj4g
KyAgICAgICAgICAgICAgIC5icHAgPSA4LA0KPiArICAgICAgIH0sIHsNCj4gKyAgICAgICAgICAg
ICAgIC5mb3VyY2MgPSBWNEwyX1BJWF9GTVRfWVVZViwNCj4gKyAgICAgICAgICAgICAgIC5jb2Rl
ID0gTUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2LA0KPiArICAgICAgICAgICAgICAgLmJwcCA9IDE2
LA0KPiArICAgICAgIH0sIHsNCj4gKyAgICAgICAgICAgICAgIC5mb3VyY2MgPSBWNEwyX1BJWF9G
TVRfWVZZVSwNCj4gKyAgICAgICAgICAgICAgIC5jb2RlID0gTUVESUFfQlVTX0ZNVF9ZVllVOF8x
WDE2LA0KPiArICAgICAgICAgICAgICAgLmJwcCA9IDE2LA0KPiArICAgICAgIH0sIHsNCj4gKyAg
ICAgICAgICAgICAgIC5mb3VyY2MgPSBWNEwyX1BJWF9GTVRfVVlWWSwNCj4gKyAgICAgICAgICAg
ICAgIC5jb2RlID0gTUVESUFfQlVTX0ZNVF9VWVZZOF8xWDE2LA0KPiArICAgICAgICAgICAgICAg
LmJwcCA9IDE2LA0KPiArICAgICAgIH0sIHsNCj4gKyAgICAgICAgICAgICAgIC5mb3VyY2MgPSBW
NEwyX1BJWF9GTVRfVllVWSwNCj4gKyAgICAgICAgICAgICAgIC5jb2RlID0gTUVESUFfQlVTX0ZN
VF9WWVVZOF8xWDE2LA0KPiArICAgICAgICAgICAgICAgLmJwcCA9IDE2LA0KPiArICAgICAgIH0s
DQo+ICt9Ow0KPiArDQoNCj4gDQo=


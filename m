Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3BCD3B7E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aGKs8sssaPj5H+6ZL2bR6Scp8PbNVhnwKY0pkQl3Us=; b=aYUCNoKsisBYmXeRLxs31DKG1q
	4CG4rVL0/w834x2efmrU/yarZ4r5R+fzP0LSvhq8w5ZrKcnbh7kQAgpOwLC256QChqjLoADmhyWp3
	wtvobpKxvhcljYVzmD3OBaLbxMLQXs7GJmiH+Lew84Lcpe63axNrshQHwyfstDlGdGrOSUDcgnOnA
	atGNXkW8spnt+sk4hhsolHC71bUlpGY7+J+cTttVyI6cFwAKNrTVjOQ37MU/QCzQey9DSmhmyxxhJ
	XGTXoXKCbs64oe1IkeDEzIxA2Vzl2LQbxYViKpzX85C0GO6+mprlcFV7DvkxaxozGfdcKwQTyKJUg
	A/K4uqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUFm-00000007Lfn-2x4k;
	Mon, 25 Nov 2024 08:15:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUEn-00000007LPk-2sX2;
	Mon, 25 Nov 2024 08:14:30 +0000
X-UUID: 47aea112ab0511ef82ff63e91e7eb18c-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0aGKs8sssaPj5H+6ZL2bR6Scp8PbNVhnwKY0pkQl3Us=;
	b=KsWotRhPZhMau3bMDXh4u0LgP17k2VepV/qm3vwl7+cRKY0mr0zkS+YN8BzOS1oVxcZHfuY7VZz+ftsmLcuYz8O9J17BDtS+fGqWSk3QIxXssFbAjC1d4hgf0vCUcHRzRcD4Q34dCjvqtOEoMGgaLEKPP3kksMbvafb24JHyp50=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:37ad52d0-4269-4b08-9357-60584f3f597c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7bf758b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 47aea112ab0511ef82ff63e91e7eb18c-20241125
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 921839402; Mon, 25 Nov 2024 01:14:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 16:14:21 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 16:14:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evvhHRPPnu8VrqxNZa/DottYUp13uejkCVF+LZ1aa8IKrxHaYCYyrBw+/FTQuUb3meZFK2SuEDiSBe19NHjgI1Y+1YM/PuAosg8UDLIfk6psJPCwGdy3Q32M+Dy0etfyU22Iv2lo1qoP1UwhxSDXUzpnS3XNKi5LryhNE+Oyvew3oqFwNXdZR5kCGRgPxOuNP67FNpin/SP6SpcZOyGrEORTbQx41LLgbixBHVNpSfchszaFrnM8sBUNxc6wKYM7yGmNloBeefJrayrqNqgarRK6Oj2E9B4Hrd/qpW3CZPwxT/iyRk4s+6bpmWrHSqJj5CiTssZ7s/CphbgrmLxpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aGKs8sssaPj5H+6ZL2bR6Scp8PbNVhnwKY0pkQl3Us=;
 b=gOmXrtxsdxUMW2tQHzI3JjTYaVMtS0eLH7Qcflb+/rVboLNCpm32h5pOxnc1p/iwAUCAE6Jl6EUerbFEVZdVIroKOwSR2Q8nojR2XD3BrOzhxPAVAu79+09cUPlOKNMoxW0Pjr745V4pxOZORUkgnWobTYcqSc8aRyJ5A9/f2qJPB96qKP7dSYLg7mHKz3CPBmce/ey2vWsw8KfVi/dTzGpHAzN/zmrdEvoFpXF2qamRVAavs0lgALw0K3mVhMQTxOk00LL1VOWR/96Y++S8/3hwV2KjD01sT1PlJCE7b+qwaXqyrKZspc3TQJTZhv67mnWTC234j07mMcBvtqfuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aGKs8sssaPj5H+6ZL2bR6Scp8PbNVhnwKY0pkQl3Us=;
 b=bYVmi2g4vo8VouxXewvqZQVaXh40ENPyBRH26veXe9/DU0Nreshkvgf9bzcBuUwQJFpX6B+cM4GrAgqOxGrxH5HGuxBLpBy9QXtRRUJkT2uIAX+0cdC7ZH8KIWxR868bo6OsiVYi9hGIuF7/qjV4PEh69YNFleOvEWf1wR+r1As=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7636.apcprd03.prod.outlook.com (2603:1096:990:f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 08:14:16 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 08:14:16 +0000
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
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHrCGA
Date: Mon, 25 Nov 2024 08:14:16 +0000
Message-ID: <d17dfb29f60bfa1889aa554ef16c9ddec272520d.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7636:EE_
x-ms-office365-filtering-correlation-id: 00b2c6da-3122-4e9b-6551-08dd0d2927b8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V0xZaEI5dXhKbHhtNWZMZmhsMVdmc1Rjdy95eG5qRmhhUjlIWmRBaFJHbStj?=
 =?utf-8?B?czZwb2hiekIrWFVvdWxDTHcyN1JCZk9MOVJHc2RsT2pmYkRLZWJJZ3Fab3JE?=
 =?utf-8?B?a3hQOTJldG1oTmFjUU5wSzZuVDBHMXViUDdFLzFLSkU1bWM4S21wdEdISlJM?=
 =?utf-8?B?NklwM0dJZWMwYXF0Ris2dzlwczlmd2poeFdabnlEZGRGWmQyOXQvTEV6bnZR?=
 =?utf-8?B?SDVMVVRUTkpsYXZrNFVPdkdjWWZRU2Y5U0YzNlpsWW9ZdTkydnY0YzRjUXNs?=
 =?utf-8?B?MWpMMnRZY3YyalNwUUpudXR2U09nTUVDZ1JRcmtHL29nUW9uNjhhQ1g0Rkh0?=
 =?utf-8?B?SVBjcHZJSDJ4VWNJb0F2clNjeEgwWHgrVlU3R1E4Uk5GS2hDNUp4b0RaZXFo?=
 =?utf-8?B?QWR6QXdBVkVpMHJ6NVhkY09XRHpRWjFtQlVuV1l0S2ZMTE1EZks4WHBXWlhk?=
 =?utf-8?B?aWE2V0hFalZveitmckg0ZFAxbXBzandaQUR5bGFPNGhFdm5UK01ta0krbW50?=
 =?utf-8?B?WHZBUDNTem9Ea2IrT0VXQ0Y1VDR2OEFWMmNSVHhSK00raXBEU05DK3ZiR2Er?=
 =?utf-8?B?eGRST3JzTHV2RVBXUVBpa1p3VVFIOW5xUUJpeStYRG95S2x1K28zeithUGNu?=
 =?utf-8?B?b0VmU2hmVFovYzhiMGtLT2MwWlI5UmlGS3BWMzNNZmZjOXpLb3hmY0w5eVBC?=
 =?utf-8?B?RlJNNWlzV0MrTlNBSkhjZnlNRGNSczRVYkJSZm5jdTZIcVdvdUFtNHZxbGdh?=
 =?utf-8?B?RVZvUkdvY1BBMGNwT2xybUNHMEthbEFkejdRTllSYzFjT0hyVVQzbWUwTCtn?=
 =?utf-8?B?N0YzSjJ0MkRTNklscXpSZ1Byc1FOamE0Z09iRkNKWDd5R2RxSWNLdnZWOWc3?=
 =?utf-8?B?cEh1SE1pckYxR3UvZ3lhYlc3UGdnUUJGQmZYT3NXYlpkdXRNZUg5cHdKR0hn?=
 =?utf-8?B?Z1EwVGRyTklVZG5DUXdjc1ZXc3YrK0pDTzNtdWlyc1IrcitFUVdGQlN0ZVB3?=
 =?utf-8?B?TWNJbm9aWGRzRXdiMXhsdjFFVzlYVzBTZS9teVMzSFpFeCtxcWUrUEhOY3oy?=
 =?utf-8?B?SHNrM2tBR0ZmQ2xqalZqNWhrRkx5YUwzcXZxdTNNM1cwWnFqeGV6YVM4bm5O?=
 =?utf-8?B?MXJtdldFdDlYVkxPWW5LNHNnT2dCLzdvUzgrN0lyQm1JREU1eVNNWjBiU0I4?=
 =?utf-8?B?NkE0ZGRMNjBhVElDZjJrS0VsdUJHUHdYOHUzeStNOWdFbHJsYzNDYzUrREJs?=
 =?utf-8?B?V1RKY3hvWUg0Q2Z2cWxHMEI2cU1DZWVuRjV3Z0s4K09IdkVpWXBIQTlBZmJr?=
 =?utf-8?B?YlpuL0hrcGFaT0hxUTZLejBFRUg0dlRNa0x1SHpoQ0VveVUzWThXV1VUSkZj?=
 =?utf-8?B?bTdrbENSM2JRZlIwS3lsWHdRSzNzcjZuTmo0MVdsOUhqZi9DSFhoR0doV1lw?=
 =?utf-8?B?emtzYmdZSXFxZ2JVSVl1MzRtdVRFUG5zdHhIQlJuM3N3a3JnODZSKzRWYUh4?=
 =?utf-8?B?eXA1bldjU3hRYWtmRHJnMW9Edldqc0NaOW0xa0lSSkFIOEM5K2xQaXZFU3dS?=
 =?utf-8?B?WnJYRVpNdWdxWGMrS2NQcW9zMFFlbFBaczRBUHdKWDJUSDM0aXRPNW5aSXNs?=
 =?utf-8?B?S014c0h3c0xZbzF1Qk5IcldEdVY5STFDMGVjM0xRcDQ5bEtvanBSaDBhWXpH?=
 =?utf-8?B?NW9SNUtSK0FLRUxVcVNEMHlyVUFRbFlGdlo1Z0tlUmVsSkJRcUpnOENTSFhH?=
 =?utf-8?B?SzNlM0owTlBqY2RPMmhLekZDL2xBN3psbVE3b1RQNW5xZ0hUUWdrNUhIWUdX?=
 =?utf-8?B?QytkaHB6NjVmMk1CWkFWWjFCYW9IV1F0ZXRYelNLTzlZT1YvcTM0cXdzd21n?=
 =?utf-8?B?VDdBLzJVenRFS0U0NktpRkZzcXAyT0dGaUx0cit4Qlh0dFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFhUTk10WDZzZ0w2NXV2SzVObUhuaHVtejRyUGtlY3IzZVRJNXpsb09CZ3lu?=
 =?utf-8?B?VzJqUGs3S0NCd3h4dVVQMG9UUDNrMHhuSGtWcXpYcUZlTFlyY0RoYk9jcDBT?=
 =?utf-8?B?ZGdVSWRmanBVSkJQSitxT29qNlJneFQxanRjc2c1cHc5b2RCSi9wK1lPT1Rn?=
 =?utf-8?B?THY5RWtWUTRNdjJGcFN4WVI1aHJSSmZSVkxWMGJyYVg3Y2FQRVUwYWVWdkFi?=
 =?utf-8?B?cDBIaGR2SCtCMkc2by9LM1R1M0xxQlJ1d3ZuNnlQWXM2Z1FjcTBlY3VMcDZo?=
 =?utf-8?B?c1BmT3IvV1NIRXdISkRhR0pNMmNqMkpIVWtxRWcwT1BQNmQ4TmFCZU5ieFBY?=
 =?utf-8?B?WlVxV3FlU21MZlM2cXAwWEJ5THU1RVdNN2JDSzZPMVhNOTZwY2J5Q05xV2Nn?=
 =?utf-8?B?QlVhbkNSak15dk5lYWYwbEZRKzFtNnJwVlc4YjFucDVvUllDWXRScjJGMWJL?=
 =?utf-8?B?Vm1XTFp1S080MDFMank1R3ZNdkRsRkFHelBwZ1JZZENINklwQ05pY2pRMTg4?=
 =?utf-8?B?aVhrZERhRjF3Mnl3amQxMjFHbitNckZUUm5NK2MwZ2c0VjBKYlBTVjhYTWFD?=
 =?utf-8?B?aWRaejVHMWFxU2QwUzhrY3F5K0o1USt1VjRST1VwRDNVVkhuV2RGRU5vNVF6?=
 =?utf-8?B?akUwVVdDWWI0S2FxU1U5N25sazNLcjVQaUhRWkN0cS9tT0NFS0xZQVZUTGls?=
 =?utf-8?B?ZFNUNTVNSFVWOWtTQ25kVGNMd2Z3NW9WVzdTWHJhQW5WUWFWbUVzSlZib0Rt?=
 =?utf-8?B?aTVDeHVWN1J6TWtQYTA5ei84cFRqVktRVTV0T2R3TWtrYlFDZXlVZmE3ejVu?=
 =?utf-8?B?OS9xRGVIZWlESm1tTy9VVDNPbFFoN1JJSFl2eFprR0YwVHZvdDFXUk90M3Rt?=
 =?utf-8?B?bjJnUzB1MnN6d1dSSnl4UjdWSm5acng4MGJVWkszZEFwTXdRWk5EaE91RmtI?=
 =?utf-8?B?aXYzMWc0OEdPU1JvWnVrZWVydU9ZQmdlUEV2N1oyZjMvVDV3S1JRUzhFU05F?=
 =?utf-8?B?ZE9oVzg3VENjampmSWdSa1ZqWUVyOUVzTXcxc0RQUmplMDBlRjk1SCtZcUJV?=
 =?utf-8?B?bExueTR5TVE0K1lPUUZNeERpQ2Rad3hNMFNXcE1rQU4yVE1HUUN3MGI1ekJW?=
 =?utf-8?B?UFFVS2pvL0xJZFZCVVlKWTc2Y2s3aWJxcVpBQzlKOFc4NjlHZE0xTEo0a2Zj?=
 =?utf-8?B?UHhrNHljc1FQcC9WRDV4MFpwZG1YQTd1TnRNNXFBMHBJSVA1RzRaYXJVZ2xv?=
 =?utf-8?B?OXkyNWwrUGtkWTAzUDN2R1VwcFBQNE5kQ25majQrN3FaL0N2bGc2MVhyRXUr?=
 =?utf-8?B?QlJBeW5PZCs4NGdRN2p3bmh1ZXhERk81TWQxSXFqRlJCdm5lNVAvcklyaE5M?=
 =?utf-8?B?T2VnMmtXcElXZlZvaW1UWDJKbnFOWEJ0VkY4WEcvSUlCTGJLOU0zRjF4cG5q?=
 =?utf-8?B?MHBmNStnSkhycEg3a0t4VUZ0aExabHNOek1Zb2Z1QXVBQU1jbnJ1UmpTZDV2?=
 =?utf-8?B?UWk3ckJWcEFRZlZ0aUZLQUdTeUhyeWFNYktINk1tc3puOFgxNzJMNUo5NElE?=
 =?utf-8?B?bE9vTmV5VEdJTWJFQUN6QStHS3J4dHdaYlNGTWp5RnhMcyt0c2R2aVVnL0JG?=
 =?utf-8?B?a2doc1FxUHhFRGlqelo3OWRwellvTU0zajl0T0YwRERyVGk3UUZkaEo0SVNM?=
 =?utf-8?B?TStDK3l4NlNsWXdDSXhLa3NIT0x6ZmM2Nmd3b2pTOWx6aUZ6WThMMVoxUUV5?=
 =?utf-8?B?ZGd5bldOejZBMWFjOU9zWGZhY1ZjSDkyR0xxVkVsTXhmcWc0YS85bkx3QXBM?=
 =?utf-8?B?MVBLMHg3c3F3bkNVSWd1VERGcUlWZkVYUjJkNGVSQnJtSlc0SWU5K1RRWi9h?=
 =?utf-8?B?WmwxVTBjaThlYVJldDYwNldqWEJRdm8yRVIzTU52MlVPajRQSE5wQXl6cVhD?=
 =?utf-8?B?ckkrOW1zQndKQlhiUHVMT3E3QmE3M3R1Q1JDdXlmVHRPbFIveFlqNzhmWCto?=
 =?utf-8?B?OW92MDlubzUxRWVoSGxaNTdwSmhwcjFVTWhTOEc2OEdEanM2eDhyczRtdjlJ?=
 =?utf-8?B?T3JNUnlZUkxOTSs0MnFlakcxRkJmQXFGVGRlVkkzbGlhQ1F0bW5nNXR4dW4x?=
 =?utf-8?Q?/TEXMLLvHsslMIeWkArtHfAPC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C10F7F04CB8BE48A7D2C4C8F81FB3A9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b2c6da-3122-4e9b-6551-08dd0d2927b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 08:14:16.7632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdQqFcurvQPQRXykkGVw1XNtmC3rQWf9nBhM4FrdJMiU16lH09ftWUFSeWpN7xXL/rGj3eg/B+4r3wJkRRkSJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001429_746977_A0E54D80 
X-CRM114-Status: GOOD (  15.91  )
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbXN2MzBf
dXBkYXRlX2J1ZmZlcnNfYWRkKHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2RldiwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfY2FtX2Rldl9i
dWZmZXIgKmJ1ZikNCj4gK3sNCj4gKyAgICAgICBtdGtfY2Ftc3YzMF9pbWcwX3dyaXRlKGNhbV9k
ZXYsIENBTVNWX0lNR09fU1ZfQkFTRV9BRERSLCBidWYtPmRhZGRyKTsNCj4gK30NCj4gKw0KDQpb
c25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbXN2MzBfZmJjX2luYyhzdHJ1Y3QgbXRrX2Nh
bV9kZXYgKmNhbV9kZXYpDQo+ICt7DQo+ICsgICAgICAgdW5zaWduZWQgaW50IGZiY192YWw7DQo+
ICsNCj4gKyAgICAgICBpZiAocG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChjYW1fZGV2LT5kZXYp
IDwgMCkgew0KDQpJIHRoaW5rIHRoaXMgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGlzIG5v
dCBuZWNlc3NhcnkuDQptdGtfY2Ftc3YzMF9mYmNfaW5jKCkgaXMgY2FsbGVkIG9ubHkgaW4gbXRr
X2NhbV92YjJfYnVmX3F1ZXVlKCkuDQpCdXQgd2hlbiBidWZfbGlzdCBpcyBlbXB0eSwgbXRrX2Nh
bXN2MzBfdXBkYXRlX2J1ZmZlcnNfYWRkKCkgaXMgY2FsbGVkIGJlZm9yZSB0aGlzIGZ1bmN0aW9u
Lg0KQnV0IG10a19jYW1zdjMwX3VwZGF0ZV9idWZmZXJzX2FkZCgpIGRvZXMgbm90IGNhbGwgcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGFuZCBpdCB3b3JrcyBub3JtYWxseS4NClNvIHRoaXMg
ZnVuY3Rpb24gaXMgbm90IG5lY2Vzc2FyeSB0byBjYWxsIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQoKS4NCg0KSW4gb3RoZXIgcmVnaXN0ZXIgc2V0dGluZyBmdW5jdGlvbiwgcGxlYXNlIGFsc28g
Y2hlY2sgdGhpcyBwbSBmdW5jdGlvbiBpcyBuZWNlc3Nhcnkgb3Igbm90Lg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArICAgICAgICAgICAgICAgZGV2X2VycihjYW1fZGV2LT5kZXYsICJmYWlsZWQgdG8g
Z2V0IHBtX3J1bnRpbWVcbiIpOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAg
IH0NCj4gKw0KPiArICAgICAgIGZiY192YWwgPSBtdGtfY2Ftc3YzMF9yZWFkKGNhbV9kZXYsIENB
TVNWX0lNR09fRkJDKTsNCj4gKyAgICAgICBmYmNfdmFsIHw9IENBTVNWX0lNR09fRkJDX1JDTlRf
SU5DOw0KPiArICAgICAgIG10a19jYW1zdjMwX3dyaXRlKGNhbV9kZXYsIENBTVNWX0lNR09fRkJD
LCBmYmNfdmFsKTsNCj4gKyAgICAgICBmYmNfdmFsICY9IH5DQU1TVl9JTUdPX0ZCQ19SQ05UX0lO
QzsNCj4gKyAgICAgICBtdGtfY2Ftc3YzMF93cml0ZShjYW1fZGV2LCBDQU1TVl9JTUdPX0ZCQywg
ZmJjX3ZhbCk7DQo+ICsNCj4gKyAgICAgICBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChjYW1f
ZGV2LT5kZXYpOw0KPiArfQ0KPiArDQoNCj4gDQo=


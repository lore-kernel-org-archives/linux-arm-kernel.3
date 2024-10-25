Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B2CD11702
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqBEiEi5XB4MmD5g07+s1AhqYxjYqn9kX8u0E9WO+B8=; b=oRg5benZY9SqyG9AjrvKY2luGK
	yLwAFcfGyMOjnVfTr3Im+PKpcU7o7xyhvFUKBHrVlloo7qfrN76Uy1bMN3cWkPwlk3sQ8sBn/w0MB
	8oXmgVZItlB8ccvBIDo3KeySRwOFtmgeDlsZo9ASwc2ufhBQnupSioikE65QNnchHWgg7cpMRXmN/
	flxiBK7aJw96sRGKXrH+ufWl4HhZGA7AY3M3crlTc2Q3/fopNBpn1yHpow40TvI6wWGCLkjVQe8HZ
	UEbUARtxuNgN9QL4kFvF5D65s1kpmZoYofsQauZvltiiZTHphjG4o1loLSTW8HCP/LyysPBWoVVzE
	WsdJYknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Drt-00000002ghN-3lCv;
	Fri, 25 Oct 2024 06:32:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DqK-00000002gUC-2Mnd;
	Fri, 25 Oct 2024 06:30:41 +0000
X-UUID: a458cd12929a11ef82ff63e91e7eb18c-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sqBEiEi5XB4MmD5g07+s1AhqYxjYqn9kX8u0E9WO+B8=;
	b=LyabZexi/TSzWxiCoT0ZsuPCuejaymqMk/w1DSp9VRy7DpyCA+thYz5MAUsnkdddkYCb2IcjjoAYexxb1INtvlpamubHNyBzZunPKF1u6OrgAHaTATtjzEPHGr3Jjvd9zQvco2UqtAKdrpaVzwU0GicFdwMPWvBLxu5mjm7yB/E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:1099f206-d069-432d-82d6-4adf5bf45640,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:cc73d8cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a458cd12929a11ef82ff63e91e7eb18c-20241024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1565937698; Thu, 24 Oct 2024 23:30:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 14:30:32 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 14:30:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6nEpq8vdiy9ikpBMQIEH8t9mI7Y0eKWdAWGGiu+U/2TPPrAuwFZOlFISlvdO7gMrXPrcndSUMkXih7DFZL5mFlA390vmDSqRQTCIKh8t9IGGJA7csdkrYqRtZFR5/dW2Ji+8O/xW3ikBiYHqWLogqOFiOheTjAQFen3zHruJTxljI2MW2batnxMwa5O6ziDSY8chuodpMSSSvs9w/HrJK/HH4UInNwLTckdzh05pUw3GCKNqvDxOXORcOBtuxQuKIcd43pKxUNEHA/6rXTqxdq/zYL4TSIwPToviW3ZlGzB4qw87VMmmUw56/9/BHwQ30KsYeH6y9CFWm1vnT4kGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqBEiEi5XB4MmD5g07+s1AhqYxjYqn9kX8u0E9WO+B8=;
 b=u2mw5FtBGQcX9w13WWoS6JO5sqoQLwzOfQIaZftwlIYOlTcAySCucSb9oS941GIjG6vdi14wfcdHFY0h8hsDagvEjtJYmHiFEk0SqP1GZ04v9k7i3qU1zY9LllemybP5Yl4TVy0Erl27vdeMrMK+qKEqzlx2wNXYbO8BrP2GRY7AQz094hp7fRYhJVrfplHg+N8frTar2iQxu1jCRROe0GAbpP1AJIPPgD76fwa3Zmy4jzJYSZd1e0JAVrFN+1uaNg2mNYDEAPC5q2xktMQ/hs27jheqT5mjSlE/fhTTkW+uH0iLlDb1IDmSGOghwyJLeK2WHhuBF77oc6dkrHQSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqBEiEi5XB4MmD5g07+s1AhqYxjYqn9kX8u0E9WO+B8=;
 b=awLo0A0voiijN2/Rw+HH4piePHOPOqauKWeZha5uRB8wxnos6E9e0COZb0UlUNTHNJcPGcV7L+bQJD3HV644i5b6ZwoEIu5SKQ0Hoc04A+tk5PasFqgnYCB8CV08UIqEY33oCe+L7CrkEHO3sU4OIMjIxdbDyv029CBGH9kxqms=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7831.apcprd03.prod.outlook.com (2603:1096:101:18a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 06:30:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 06:30:29 +0000
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
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KXGkgA
Date: Fri, 25 Oct 2024 06:30:29 +0000
Message-ID: <823e7063aae1ab4fb741369b8a27772714909493.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7831:EE_
x-ms-office365-filtering-correlation-id: 9651519f-3d3f-41f4-ab1f-08dcf4be8534
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VUZMNmV4ZzdINFZwQ1NBb3BBNlJkeE95ZjJvTjZYcGVxL2xxeTRXM0ZCTlJN?=
 =?utf-8?B?WTVFQWJuZ2FoSEdFOTVRWUsrL3puY05kaTR0QStBZ3EvZXo1OSt2b0ltaThZ?=
 =?utf-8?B?K2lnQlBlVzdkUmNQY3VHaEY3UlMvcWdOTGViR1kzOFVFYm5JSjNZclBWY2NF?=
 =?utf-8?B?OTZtMnpnREZJOHVaYlRhZUxIYTAzbzFEb3lxUkowQVpTa1FTdUZsQll6cVdJ?=
 =?utf-8?B?M2lSQVdJSU9HNy9ncHpWNG15TlJSWjVjeXhMTW1lR0hiSUhXT2o4bHg5eGtH?=
 =?utf-8?B?bnJUeUN0aU02aWd6anBZcWlFRzFTbGZqaTdqbE1US3lncDY3SGlVYUQ1Zmdo?=
 =?utf-8?B?elppV2ZiWXZtLzJKUytrdWdvb2JLNkhyUEQyL2I2YjFVenZlSVpkRWlramJH?=
 =?utf-8?B?NFJ3WGZYcjJSN1gzakJTLzhCell5MGpPRE51cDRtQi82OURNMFEyTGFkTFNk?=
 =?utf-8?B?OS83REg4OWhkdVJYWVNNQW83dDJqcm5nVDB3QVFiZVJDRnMwOVhvbjVINWpn?=
 =?utf-8?B?SWs4MTg1SlphcEpPZkcxLzJkbFRMUFlRYjY2ek4yUFd0WjVKdHVDd2RuT2ZH?=
 =?utf-8?B?KzN0cVpqYUZQR2JQT3prdllTaGFtQ21rUkJseFllWHFiUVdhTnUyblZBcnhT?=
 =?utf-8?B?bng2L2lKenU1U3lha2h1R21wUFF5Vmp5em5oZVdSeERpOE9oMDFiNW43MzNB?=
 =?utf-8?B?Z2xDTkZXVW1QU3Z4ci82UzRReHIrN1d1Uy9qU2UyakN0V0VzUFR6VFozNDhk?=
 =?utf-8?B?bFJIQnNjWnhqVmpVYndIVUE2dStEY09JZHhid2RURlF5eTVZYytMZHNjS0RJ?=
 =?utf-8?B?K3M0anhodEZ5QjVaK1ExcmR6Vzl5VzE2TkNaV1RMTU1ZTlo5Qk5GK0srVlVH?=
 =?utf-8?B?RmpsVnZyRzE4N2hrbE5lSHZPNFB6cWRjSUJsdEpxNTZsY2pKQmdJM1V3dEhu?=
 =?utf-8?B?RnQ4ZVVjUkZmbGJ0OXVYRitMTFM1alVnU0Y2YXVxRDU0RUVHYVNCVzY5Wndx?=
 =?utf-8?B?RHV1VjVPQURZV1JaR3Vxc1BMNGlPeXg4VDhwM01xbnEwczdiM1FsbmtxeWs2?=
 =?utf-8?B?aUdFMzRHcEtCNFVNQTQ4enRvZjRxNjBHa3BRVEppaXZaOC8rYjN1ZnE4NDd6?=
 =?utf-8?B?S0srTnh4UFJXdEQ0OVdBY3d3ZHNqNHgrVUxzYWgrUGY3VUFFL1dHN2tEK0tV?=
 =?utf-8?B?RENzaGxzdUk1RmRvUXpPSnFJcEV4ODhkWWRaeTBjVDMzZzc5VDBJbXU1T3Vp?=
 =?utf-8?B?OWcwd2ZPYWRkUFdhTFlwMlpCL3E3UzQ3RVNBZjJ2RFloQ3lTVTBCdmxwME1u?=
 =?utf-8?B?QjhzblBseE9LT3dYN2t6WmJjVUxoME1uUkgvUjNTdmdFdWdKdzVIN0o4ZXlo?=
 =?utf-8?B?NERJR2lkOFUxT1oyZ3Y1SG1TVC9lTW5IRTZPY0hSNTdyaHB4ajQyQ0gvZVBo?=
 =?utf-8?B?bDJ2QjNJRTQ2ek9oOWlvWGpwMjAwVGlyMGxSbVp1VlQvOHB3djlyWEVGcWNj?=
 =?utf-8?B?a2NSQTlvYmhZNkowNmNXOFRhT21heE5jeitFbEw5elUxNHpmTWE2QmlseXBs?=
 =?utf-8?B?M2hHTzNwMllUWWVNUUVza2hHZ1FtbGFWbmhqRFY3T3ZidTNDUlY3eUgwRjlO?=
 =?utf-8?B?SlQyclhEdTdlT3Z6Yko4QjYwdFdIKzZBK0t5ZUcvYzhCT2RGOHlsMXlHR0xx?=
 =?utf-8?B?bXlMWXJQb3RHUjlHOTZiNDNQSVUvdVpyc3JtZktqbGM1NkIyN0NJV1RGMTNQ?=
 =?utf-8?B?OVNxZUkxajE2QXdLT202S2krWlBmblZKckVVRE1NMkJWS2M5WUpLQVVEYm8x?=
 =?utf-8?Q?2YmAewnV2BdkzXR3NkmPF+wJoD1V73uD/gzxQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0V3eGdYTTJOTGRKaFZTNlZlaVlBalZoS0FjM1RobVROS0lNRGJnVDlXVEx5?=
 =?utf-8?B?R1E4S3RSTHhBelZjcytDTDArVHE3MWRiK3ZwMFhTc3cwUlBNZ1ZPeDBKZjZy?=
 =?utf-8?B?VXNrbmZ0ei83VE41WEs3bitZZXgvb3BKcUl0YTJ4N014bTJHM25SY0NITk1O?=
 =?utf-8?B?TTJYaytwbW5CRDBnV1hrbXlxY3pxdlM1TWplUXF4R0FxL2NmNk9Ibk51aFBN?=
 =?utf-8?B?SUFSSWRxRHJaMzRhdDJ0M3Y4bHY3bFphbkx4Y2k3c0pKTEVydUw2THlPamdW?=
 =?utf-8?B?c09HUUlrdG5leS9vZzVjc2ZoR2dYcmVjSFpHaTZYekx5NWdJaSt0ME5MeFFV?=
 =?utf-8?B?amY3OGs5Q1RydGRxb3NST2o1T0JSdjJtRVgzeUJLS21RUzhOWXBZYmIzNHlq?=
 =?utf-8?B?bEJENjlOdEhMUUZmUHVFVW5yUHRSaU5uWjhBYjZHUDA1b3d3eHA0b2N3Uk1I?=
 =?utf-8?B?MlMvWENWbDkzV0oxSE9kdGRmTHpFNm9mVitFNmlJckxFRzNEaUlNcXdHNkNP?=
 =?utf-8?B?K2hCZUtCdjhNYyttT2llZURtUm1ORHVWclU3bEJYQ2dQUWxxbXo1Z0NVMjdH?=
 =?utf-8?B?d1RMdFZVc2tQWE1QSVE2ZVBvOUt3Q2RNb08xODR2RDE5QUdMTTdBV09XamlP?=
 =?utf-8?B?dnRaSXNhNDNVQ3lRTERxQ2pjOG9DRDkvODVoaDVVb2lEMlJKRlVwRkV3QVpH?=
 =?utf-8?B?MmdQY21BSDgwWUYvR0IzeERvd2R2MmVRcmtqUXNmVFNFSGIzRjBPbVlKN0dG?=
 =?utf-8?B?ZE1jc3QzQldhVTFFZU5DK0ZrMU10TnM5MWx2dENZUWVuaDJFazJ5aGRCaFdF?=
 =?utf-8?B?OFJ6Y2duTWhlTHdIUUZ1bTljbkt2S2oxNUdrbDM2b3ZIbWxTZ2tMbk5LeEVl?=
 =?utf-8?B?WmI5T0xDV3YrZjlpakJBdTJDMDkwdCtFN280YmFpdkVyclJLU2c2aDh6Sjhp?=
 =?utf-8?B?eUErNk9oWnJjQ05uTmVKcEZ4c3lYcWxYWFF2RXQ1NnhuUlIrWmpSbHhNdEoy?=
 =?utf-8?B?YTlkclJYbHpFMzRNQU9mbVFEL3R3QVFuR0tWY244SVc2VUoyVlNFTzJPa1Aw?=
 =?utf-8?B?YmVWbnVmbnVhU3o5REd1Z0duTlNJakFaZHMvOEJsc3R5L0QxOVdEb1hGcHdo?=
 =?utf-8?B?YWg3MG1USGtQenN3ODV6SEFWNVdaUTcxaXBrRDMvcmZnMm52b0VDRUVPL1Vp?=
 =?utf-8?B?bDgxZ3dmNjYzUEYrSkFnaFovU1JyYk5ocXRwb29VbEtzSFZzSXNRckpQVEFp?=
 =?utf-8?B?dWVEYUc1VTdEU1IxdmhSL3N2MmZvdEJ2N08yaTZmcncrUUpWWURPMVlkQTFo?=
 =?utf-8?B?eUVJRy9XSFpnMGc0amZtUi9xWWVLbTNuTThJSExpeDYrWnM2bFA5NWcrc0I5?=
 =?utf-8?B?NnVSbGJnVGtEOGxJekJvMlluN2k4ak1Hdlc3UkFKczFaZlNWbkJBT3dyMmda?=
 =?utf-8?B?TitvVjF1bldoRCtUVnF6OHNrd3h0aU9WL3lVZzFsSDdTcHUyTjQ3MVRTNGl4?=
 =?utf-8?B?aUp2ckljcmh5N2J4L05vTXNoTWhtMVIyY3V5eFZMUGNucWE0OFZWRkVFaXQ3?=
 =?utf-8?B?aWFSVTQzc3hMWkN0ZlJXRi85RjIwS2FZcDZ3aS9udU5yeFFKNXp3ZGtiNlh5?=
 =?utf-8?B?TW83TjZuSUR0dU9FMTlja0MyekV1OTVzdS9JS0pNOXVNK1V2b3U5QmFuWDlS?=
 =?utf-8?B?UzduZ1JXM2w3V2g3WDhIcTJOQWVtdlVNK0VTQVN1RC90SE93Yk1hVXcxdUJ6?=
 =?utf-8?B?UnkybjAzUjJqWk1kUzZKMnhyd3p0R0xSUGlkMUM4d0tFMHR6aDJrQ3doTlVH?=
 =?utf-8?B?K2w0RDRDN3lKcVRJcWtKNTM1Z0hJSFhQM0pZUjJKK3RCK2hSTnRneC81bm9O?=
 =?utf-8?B?Q2wyZnZDTDhkZGNVZ0NZS1NDM0VTWGJWdzR4WUVNVzFDT3g0V0dJaGlwRTBn?=
 =?utf-8?B?QTQyUm5jQ3BONXlxOGU2WmFzV2VYQnhnMVFvRzM1ZVZ6ZG5lWXpLdU1xclVk?=
 =?utf-8?B?emdETkFGcGNJQ2FYSW50Q3dPR04wVDI2T3N3cGJaL1Q3a0NyZ0FUVWhUL0pI?=
 =?utf-8?B?RDErTU8vSUZEVEFBV0w0M0RRN3I5WUpkL2cwNWZSZTlVVU9ScXZTbnpUT2kw?=
 =?utf-8?Q?AZIOhbTlgnqzW0psqHINFGKJp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E33299128CBBA940A467BA5A91D3DF37@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9651519f-3d3f-41f4-ab1f-08dcf4be8534
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 06:30:29.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+eJ20DlR/wTIWdRnDvF+0eNEXw3/ktGvyAfBWNQxsoY1d8qevoHt32hnEfByUc7PugugEKuJ45wOO0D828tog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_233040_648332_C87F8722 
X-CRM114-Status: UNSURE (   9.11  )
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
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgY29u
c3QNCj4gK2NoYXIgKmNhcHR1cmVfcXVldWVfbmFtZXNbUkFXX1BJUEVMSU5FX05VTV1bTVRLX1JB
V19UT1RBTF9DQVBUVVJFX1FVRVVFU10gPSB7DQo+ICsJeyJtdGstY2FtIHJhdy0wIG1haW4tc3Ry
ZWFtIiwNCg0KTGV0IHRoZSBiYXNpYyBmdW5jdGlvbiBzdXBwb3J0IG9ubHkgb25lIGNhcHR1cmUg
cXVldWUgYW5kIGFkZCBhZGRpdGlvbmFsIGNhcHR1cmUgcXVldWUgYnkgb3RoZXIgcGF0Y2guDQpN
YXliZSBvbmUgcGF0Y2ggZm9yIG9uZSBxdWV1ZS4NClRoZSBiYXNpYyBmdW5jdGlvbiBzdXBwb3J0
IG9ubHkgIm10ay1jYW0gcmF3LTAgbWFpbi1zdHJlYW0iIHF1ZXVlLg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiArCSAibXRrLWNhbSByYXctMCB5dXZvLTEiLCAibXRrLWNhbSByYXctMCB5dXZvLTIiLA0K
PiArCSAibXRrLWNhbSByYXctMCB5dXZvLTMiLCAibXRrLWNhbSByYXctMCB5dXZvLTQiLA0KPiAr
CSAibXRrLWNhbSByYXctMCB5dXZvLTUiLA0KPiArCSAibXRrLWNhbSByYXctMCBkcnpzNG5vLTEi
LCAibXRrLWNhbSByYXctMCBkcnpzNG5vLTIiLCAibXRrLWNhbSByYXctMCBkcnpzNG5vLTMiLA0K
PiArCSAibXRrLWNhbSByYXctMCByemgxbjJ0by0xIiwgIm10ay1jYW0gcmF3LTAgcnpoMW4ydG8t
MiIsICJtdGstY2FtIHJhdy0wIHJ6aDFuMnRvLTMiLA0KPiArCSAibXRrLWNhbSByYXctMCBwYXJ0
aWFsLW1ldGEtMCIsICJtdGstY2FtIHJhdy0wIHBhcnRpYWwtbWV0YS0xIiwNCj4gKwkgIm10ay1j
YW0gcmF3LTAgcGFydGlhbC1tZXRhLTIiLA0KPiArCSB9LA0KPiArCXsibXRrLWNhbSByYXctMSBt
YWluLXN0cmVhbSIsDQo+ICsJICJtdGstY2FtIHJhdy0xIHl1dm8tMSIsICJtdGstY2FtIHJhdy0x
IHl1dm8tMiIsDQo+ICsJICJtdGstY2FtIHJhdy0xIHl1dm8tMyIsICJtdGstY2FtIHJhdy0xIHl1
dm8tNCIsDQo+ICsJICJtdGstY2FtIHJhdy0xIHl1dm8tNSIsDQo+ICsJICJtdGstY2FtIHJhdy0x
IGRyenM0bm8tMSIsICJtdGstY2FtIHJhdy0xIGRyenM0bm8tMiIsICJtdGstY2FtIHJhdy0xIGRy
enM0bm8tMyIsDQo+ICsJICJtdGstY2FtIHJhdy0xIHJ6aDFuMnRvLTEiLCAibXRrLWNhbSByYXct
MSByemgxbjJ0by0yIiwgIm10ay1jYW0gcmF3LTEgcnpoMW4ydG8tMyIsDQo+ICsJICJtdGstY2Ft
IHJhdy0xIHBhcnRpYWwtbWV0YS0wIiwgIm10ay1jYW0gcmF3LTEgcGFydGlhbC1tZXRhLTEiLA0K
PiArCSAibXRrLWNhbSByYXctMSBwYXJ0aWFsLW1ldGEtMiIsDQo+ICsJIH0sDQo+ICsNCj4gKwl7
Im10ay1jYW0gcmF3LTIgbWFpbi1zdHJlYW0iLA0KPiArCSAibXRrLWNhbSByYXctMiB5dXZvLTEi
LCAibXRrLWNhbSByYXctMiB5dXZvLTIiLA0KPiArCSAibXRrLWNhbSByYXctMiB5dXZvLTMiLCAi
bXRrLWNhbSByYXctMiB5dXZvLTQiLA0KPiArCSAibXRrLWNhbSByYXctMiB5dXZvLTUiLA0KPiAr
CSAibXRrLWNhbSByYXctMiBkcnpzNG5vLTEiLCAibXRrLWNhbSByYXctMiBkcnpzNG5vLTIiLCAi
bXRrLWNhbSByYXctMiBkcnpzNG5vLTMiLA0KPiArCSAibXRrLWNhbSByYXctMiByemgxbjJ0by0x
IiwgIm10ay1jYW0gcmF3LTIgcnpoMW4ydG8tMiIsICJtdGstY2FtIHJhdy0yIHJ6aDFuMnRvLTMi
LA0KPiArCSAibXRrLWNhbSByYXctMiBwYXJ0aWFsLW1ldGEtMCIsICJtdGstY2FtIHJhdy0yIHBh
cnRpYWwtbWV0YS0xIiwNCj4gKwkgIm10ay1jYW0gcmF3LTIgcGFydGlhbC1tZXRhLTIiLA0KPiAr
CSB9LA0KPiArfTsNCj4gKw0K


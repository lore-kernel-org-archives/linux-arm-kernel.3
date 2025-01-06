Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F09E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU9moDwHnIAebbDAjZNbJfhok30nIFRPXiV7WH2tJ50=; b=kaKGveSGM1+Uqk/doZAag+fyWg
	LYyTSQ9vyZD9nATQG1VMjlMLaM0kLxwqILukyGfqoDTzOczIJGZZzuNW071iS1Y/KyhgT05Z8j+WK
	Ytar6VxRb8oc8Owa0owHS9KgJsavVWZaopO26CcjcKaU2X0OpdBsvRuOJktrgAlL0NeOfRGcDK+Ci
	ew8ujtimW2vroJ2EWTnRRmgc+FeQ7hxyp3jT630ifsyGfYiRk8xi7kg9v5POY1gNaQ4voTARlGsFA
	zP4ciOcnnsfVlsi7LYYxoGkV/JdlrskJ4hisWSOdwMeqywTTrXTqQfFWBmxDgPGPMaKo+8G293hA1
	U7bFzWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoON-00000001dS0-0n7t;
	Mon, 06 Jan 2025 14:47:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo9a-00000001aHT-3p5B;
	Mon, 06 Jan 2025 14:32:28 +0000
X-UUID: 0699b322cc3b11ef82ff63e91e7eb18c-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VU9moDwHnIAebbDAjZNbJfhok30nIFRPXiV7WH2tJ50=;
	b=pDANncw5Yk4sV7AcnjH4qRJ6n9Kss+29FmQQsS27i/BG9v7vOhMeaeNMmBV2fYLsFvxFGwmSLPzKT5we9ugxgrjhShcyJwAsVsW3b/3QWD40Ig+icyTEBm0MObZCs0uB74z7LoMqVjkEkHzed/akn5UrvPPJpDC9g5OP0J3Como=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b22ab902-69dd-4646-acf7-0d3abcdae97e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:0804be25-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 0699b322cc3b11ef82ff63e91e7eb18c-20250106
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1859875538; Mon, 06 Jan 2025 07:32:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 22:32:12 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 22:32:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDbFlUSqK8ix6CMjgzvsWr04rPTyTygbVWcThYTpT3w5mNJQJL9jiYRCRK4gJZpqmziQ3VEhowteAfXHaOIdq73BJGAc/EU6UrvcIRBXZYz1DxSkaLUutoCiOnfCyi1JBjk2fYAjrHmkWQeZL4Rvh1m9yfD2aL4sj2DiDelCPpKNNHsOSws7Nd7c6UevbgE8g+xXVEskpo8YdTNQkpn747zNMwsOpmAtSEgbUk+Sdk+1R46TuQwczDQ/A1pXYpsYxS64XLaUSv1SSk0fxU9syjvEE1hgfcK+er0tYM8DF9vXVdFvHu9tvq6Judubt1fHxKrs95M8ylVWlD6miDvKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VU9moDwHnIAebbDAjZNbJfhok30nIFRPXiV7WH2tJ50=;
 b=A0QoEJzOOq3V8Sb6tnhGxUiOJoDZEbh33g7vJr4Ra7WQgLY5W+2bKtthyF/u83nDVnh5TRrBfc+EZhPdj7m/oj9AuhkTzyV/celAIurhFHHpXxufolMYDvGNXLZRUkqYLrPpPzxd6NuLrqgbudfSySA9aBAB0ETq3CFOJVsY3oC/v2Piwe4YoSms8jbAgxVywpIhg2i5z9nAjAVQBePLCdEs4meuDjk5C16cI+b/MN5VmbhvWsB78jV2dIUSloopnHTtJkMZuY0KO/GRS3wcdeMfWf4ogLc1vGGTovqINE73bopDRD6N6EICRj1TJEqUp4fi6CJu77AmAJCKJSXOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU9moDwHnIAebbDAjZNbJfhok30nIFRPXiV7WH2tJ50=;
 b=cq9TFMzC09w+VwAr8u/h59VI+kQUuRcYUiUiXjA5M3tWnOFI0e2wC7aKk3yDXVDoFHJyk7hvjuShbFs1AF59qeIgW6Lf4ahUFAuU/+Jkk5Tsih8+448Io1wcPjl7LYcV7vrP/jZu4PVrjBpi9eNlai6WcHh8/tsYqXShdSiJqQs=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by SEYPR03MB7725.apcprd03.prod.outlook.com (2603:1096:101:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:32:09 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:32:08 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to set
 disconnect threshold
Thread-Topic: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to
 set disconnect threshold
Thread-Index: AQHbP68py1rCfJL+MkWe9w25qfqE7bLLMV+AgD7e0oA=
Date: Mon, 6 Jan 2025 14:32:08 +0000
Message-ID: <8f32aaacbf3d83ebdb31da2eaa0099eeddad3ae8.camel@mediatek.com>
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
	 <20241127142639.GA3451514-robh@kernel.org>
In-Reply-To: <20241127142639.GA3451514-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|SEYPR03MB7725:EE_
x-ms-office365-filtering-correlation-id: 6da88ffc-6f20-42d7-b283-08dd2e5ee680
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFByTUkyOElZUTBkUEI2RW5JUldpL0NZdFRsdUhHUFBPZTlyaE9XTU53K3dR?=
 =?utf-8?B?WEUxeHc2dE1xdFhXSjlIcERndTlSSlMyWnZGZGxrQWkrbHY1SGJqeHpTd3V6?=
 =?utf-8?B?QVRjdEpwTy92c2JhMFRlSE9XVk03SXpuS3QvRWJNeGgxWUozcTk4WUJuMDFk?=
 =?utf-8?B?L09KcVZrNUp1d2dOemswaG5rS1EySVYyckVJaVRDSXFRbHJtRWJRdTR1ZG8x?=
 =?utf-8?B?UXgrR0NieG5jSVlVZFJuRXNXNmg5OEx2NEdLUE41dFVHRnBJOEZpb1hnV25s?=
 =?utf-8?B?QTA0dVphM0xXMEoySTdQRVFwZGhnSU9yR05Jc1FpK2E3L09MdzV6OVZGVVl2?=
 =?utf-8?B?TTZZTWx4TmRPWVVzWE1SeENtNDdsZjF0dnlkYVBZSEphbkxoT0NnU0dhWFJT?=
 =?utf-8?B?ckVub0RMK3lDdlZFNnV6eTR3aE51bW9aU3Y2N05RMmN3QUx5MVlOcjdKVUM1?=
 =?utf-8?B?eEFFMEFvUGNhcTNoYzY5MDFXaDNpbkd3MEt4WlJhUUVYVHpLMm9TdlBmZVNY?=
 =?utf-8?B?RjltdytHMUVqR1lhY1QwQVkzVnZtYm5uU3hPanYrWllNMm15N1UzNWN4S09s?=
 =?utf-8?B?d2FhNlNYcW9HR2x4N1FBNkhSRTlSLzl6cnFETUYzcXoveVpwRU9vSTlaTlJE?=
 =?utf-8?B?R2FmTmZVRGFJUFdiTjJHdjNxb2kzRFJNYjZUZ054ZU1YS0JZZWtFTzBVdDBv?=
 =?utf-8?B?MHZrdElkRThCVDFsU09KWk9rdDVrM2pncmtkK0VuQVdOSzFYeFp1MmFrcmVR?=
 =?utf-8?B?dXg5QnZHaExOUUJSTlZXREZpbXhnNGpITnYrbUhzWUdXMEg3c3BHTkRaejZT?=
 =?utf-8?B?SFpzNjZGcVlmNVIxWWxZVkRTWGFxQU45eExxSk9lZW5RdnVZVkc0dlZkVFRH?=
 =?utf-8?B?YmxUU3Y0RzhmY2paekZjbEw2U1R6aVdHUVhkUmZKckExdVFnQkZsOThWWktW?=
 =?utf-8?B?MXY1UjAvVWRYbDRJZ09MTG5ReGtLY3g5U2s4cUxJLzZDRjI3VVdMWEErdkg5?=
 =?utf-8?B?WDBNT2NMSGZkeTk2WEhMZXFhcFEwTVY5eG5lZXRiZkRiUDJuZDJIQ2FzR2JH?=
 =?utf-8?B?dGNXcGZCT1FMZndyOXpvL0Fualhibm9HcXUwUFg0MkZiVUllZUlWeGdFempC?=
 =?utf-8?B?R2E0VktOUFNxTWE5bC8xc0x0NFBnQldzY2JhR0dYa21EcS9Vdys2aTR6MUkr?=
 =?utf-8?B?VS9TMnBSVDFsMlVERUxhZit5NlpIMlg3NjM3WU9ERkc3YTVFaTBjR2U2aWFI?=
 =?utf-8?B?bTJsdVpUQlRvQzBVUDZCZDFJYVZEYXh3NnNXWjBqeUN3VkZQWWF5Z1V3VHdU?=
 =?utf-8?B?bERHV3RMZ2k4YUpUZTFSeG4rQ3R4MHJMNjRTZzI2cDk1NSt5S2ttOFdBMzll?=
 =?utf-8?B?OXFzUWdLcnh2ZENxN2pxRWZZcVV3VlFmNHk4bGhBOGZzTHZ1N3RNbTErUjNm?=
 =?utf-8?B?WC93Ri9VRG0rZTJzeUNwcDQrWTV2MHJucVRpb25GY2hJTDdDSlNEbkNuWTVC?=
 =?utf-8?B?ellhY1lvU1NucHRVL21MbWFHT2oydWFCKzZSTlNSeGpFZ1lSOVpkNkxRU2xR?=
 =?utf-8?B?RUF0Z2lVb2h2ZmFEVk1odU04bWpVQmFJQitQSnArbjY4bW1qaEIyWVUxMnI4?=
 =?utf-8?B?QzBDQi84aFduaGt0NWxHTG9Jcml6QUxsMEdJbHo0VnNVbU55ZGQ0ckV1cHln?=
 =?utf-8?B?VGlvdGJVc3IxRVBZdFJoRFkrNmNWRVlGUFJEUmx1NnVCb1BOZkhTbHZuVnhr?=
 =?utf-8?B?dTRic3p3QjllTVh0ZnM3S1RZOTV4UlVUVzFnVytISGcrTjJWSlhlSG5FdEtw?=
 =?utf-8?B?ZFZKTXd6OXlQSG1ONXZVWXNNTWMzZjhaV3B3RnBOY000S2tkVlNpbEg2QkY0?=
 =?utf-8?B?ZDNzNDEyNHhENCsxUDQ4TXNJT3JSaGUvRi9HbWFxcVhlR3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUpqK0p2a0htbE4xSUtNM3FwVU5kQlRxRnVlRGhVQXVkakd0VEFJVGJaMStE?=
 =?utf-8?B?ZWp1U1Z1ZEF4a0FDUVkxUm5zeTZlUDEzZHpMSUlWRDlqYXdWaFNPamI0NHo3?=
 =?utf-8?B?bXVBbzI3ZEFSL2k3d01KSnFnTW1oUkloYnJGcXVoZHdYUTlveGdVWXBoTC9Q?=
 =?utf-8?B?cFFOemVlbFF1VWZOYzhZaEFaQmJ0WWh4elA4TnFaWWVtOUpJbGhTcWNMREh2?=
 =?utf-8?B?YWQ3anFvTHU4dGxDUG84SDRkME9UeWVia3hhNGpZNEVwZ1NHZWVVNzhxbkhk?=
 =?utf-8?B?MjZHbDlaT3F4ZGFNdnR4OGhrSngwL1MwbkF1Mjk5cnQ2ZklPeGlXT2xHUnBE?=
 =?utf-8?B?YXpqNU5yREtoNVF6WFpiNGdnRE52Q3Z3dy95emt0QnlvYlUxT0loa2RSMmIz?=
 =?utf-8?B?ajNRUElkc3VRSHViM2s5d2svWXl4aVlsekU5eFVoNUdCRi95YVI3WHF1djVx?=
 =?utf-8?B?bm1pU2ZncFlsV2xzeE1BWnpXbzhwSHNhSkw1Z3FRK2xWZndVQWQzV2FaUmpY?=
 =?utf-8?B?RHRqa0ZoNjVtR2hDK0lVamZnVUV0bzFmYmtjNUNGWEtGTzZ1MlMzR3pMREc0?=
 =?utf-8?B?cUNhTitmRjcvc2NOeHIyMkh0YkJWV0xqbURneTM2SE9tTCtNQm1kSFp1cUc1?=
 =?utf-8?B?QU5SMEcwZmliTWxDc1ZsbHA0VUR2SE43Tm1sUEFROTFhWEJ5YzF1NUFKNTVM?=
 =?utf-8?B?d2hlbkJOMS9wYnkvdGFQQWhra3k1bDBuRUdTYW9wSjJISEV6dEZJcXJENlkz?=
 =?utf-8?B?Y3lsTDZFSXF1UlA1dmNwTWUyN2ZNVm1TajZRazBKNGFtNVY2MEFzd3BoN3dm?=
 =?utf-8?B?WEhIVjdMaC9aYWx5VCtMOHVlZzlnNGR1c0lkRjF1UUxwK0ZEQkZ0Wm1VaGVW?=
 =?utf-8?B?K01veE5uWjhLNjhrZkJpRmJrMUo2aldvSWpMczN3YjBRcW4zSTBaTkp6VEpG?=
 =?utf-8?B?OURjNTVJSE12d1VPL2xKQ1IwK2lvbkxxVDZDUnBrQXZtNlBncTFRdjBQVHJu?=
 =?utf-8?B?ZDlVK0o5clppMWpMNVdKUjc4V1kyTFpTRzVpa1ZBd0ZpZm52MFozMVpIZ2Yx?=
 =?utf-8?B?NVJrbFAwdzVEZUx0aGhKRklVcXM0UTBTR3NtTjhPQWZtZzR2NFdCRmdHblBP?=
 =?utf-8?B?cE9kak5SeTk5b2tieENkT1Z2YnVjSWQ0bkdIaEVlK0VWYUtCUDNuOHJnaFRa?=
 =?utf-8?B?aTBKWlE0VGdsQWtKWkx1QkFuQUlhTGVtWWZEekR4VTgwWHduZjVlcDFrZDJE?=
 =?utf-8?B?WnZlWTc2S0RUellrMzhwdE9zSmYzNHpoS0xsZDBxcnBjMkJCNEw4Um9OQ3BL?=
 =?utf-8?B?UmZOZkdPUS9VZGlnc0dFWE0zU0Vhdk9iVWVXRnNMdy9GeExPWHBvbHJBdy9j?=
 =?utf-8?B?c3dmSDA0bkdlUmVQYmZ3ckV6enZDNTZuZ0xwRWF6bzBtTHZkZEVPR2dVVE1Y?=
 =?utf-8?B?LyswbDJ1K0J6RFprUzg4cW9TSDQ5TkZIakF5Q3dSTFJpbkMwV3NhR2FMSDln?=
 =?utf-8?B?WnlEcGxwUGxPSVY2VklTV1RtM1gvYzFyeHRRVTNJY1hiQ0Rna1ZDd1R2VStG?=
 =?utf-8?B?U1E3U1U4eFlGMUdRUi9CZ1FlZ2F0SkUrTmNpZjlzNHU3SEI1SG80VUFhK2hD?=
 =?utf-8?B?ZEFkQVJIMG9YdjFoQnAzSitWSTRPc25hQzBPZW0zN05xME9pTnpDU3R0Rmww?=
 =?utf-8?B?ZDlJbjZBL2l5bmkzb00rVHNyaEE0UW10TzloNklyeEc4Q3VpUGlaYXI0YkM1?=
 =?utf-8?B?SWFLVDhqM1ZSUmlCSkR6RUc5cXhZMnlUYzhudTlnZFRYNHRZVDl0aHBELzdy?=
 =?utf-8?B?NWZrUXFScnp4YTUycUlUc0RWc20zMW50RXVaaXMxZnhUcCtKUk5yZGQyMGY1?=
 =?utf-8?B?M3VjMCtpbmpreUFBYlV0QW1icVZFVlBSOFFLY0I1Tmcxa2Y2MWNDODZVZnZV?=
 =?utf-8?B?S3NkVUZpdDc3ejNUVmd3U0M0aDEzL0ZvU0JmYk0vWkFvb2lQZ1hiV1hSUFNG?=
 =?utf-8?B?ZkRQQS9mYnQ1RTdpRzBMRGkzWHZHU1VkMnA3K2QrTmdwNHdDSmhnS0RDNjk0?=
 =?utf-8?B?aWh4S3g1WGVOQnpCaUJJek1qSkNUY3hFdkhLNXBtODBrWWlLaDZ4ZE5uaElY?=
 =?utf-8?B?TzhBbnJndEdESmlUc0tNMXJDN250Z0U2eVRlNjJqZVFpeFIyek1ibjdOOTRL?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A10C7340A5896740A69312454AE9691B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da88ffc-6f20-42d7-b283-08dd2e5ee680
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 14:32:08.5260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRe6cE8D4WGVCWlV+gt36s7DiLOllzn/8UHsGBmB/XIYmFzrValMW+A9/gikPl+q3TraJq5yTD87niRto39J7yJHfayl2b0jrX9HhPfULRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7725
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_063226_970400_11603773 
X-CRM114-Status: GOOD (  17.48  )
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

aGksDQpPbiBXZWQsIDIwMjQtMTEtMjcgYXQgMDg6MjYgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IE9uIFR1ZSwgTm92IDI2LCAyMDI0IGF0IDEwOjU4OjU4QU0gKzA4
MDAsIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiBBZGQgYSBwcm9wZXJ0eSB0byB0dW5lIHVzYjIg
cGh5J3MgZGlzY29ubmVjdCB0aHJlc2hvbGQuDQo+ID4gQW5kIGFkZCBhIGNvbXBhdGlibGUgZm9y
IG10ODE5Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5n
Lnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbCB8IDgNCj4gPiArKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayx4c3Bo
eS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlh
dGVrLHhzcGh5LnlhbWwNCj4gPiBpbmRleCBhOWUzMTM5ZmQ0MjEuLjJlMDEyZDVlMWRhMSAxMDA2
NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlh
dGVrLHhzcGh5LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiBAQCAtNDksNiArNDksNyBAQCBwcm9wZXJ0
aWVzOg0KPiA+ICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAtIG1lZGlhdGVrLG10MzYx
MS14c3BoeQ0KPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDM2MTIteHNwaHkNCj4gPiArICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXhzcGh5DQo+ID4gICAgICAgIC0gY29uc3Q6IG1lZGlh
dGVrLHhzcGh5DQo+ID4gDQo+ID4gICAgcmVnOg0KPiA+IEBAIC0xMjksNiArMTMwLDEzIEBAIHBh
dHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgIG1pbmltdW06IDENCj4gPiAgICAgICAgICBt
YXhpbXVtOiA3DQo+ID4gDQo+ID4gKyAgICAgIG1lZGlhdGVrLGRpc2N0aDoNCj4gDQo+IFRoYXQn
cyBub3QgdW5kZXJzdGFuZGFibGUuIFNwZWxsIGl0IG91dDogbWVkaWF0ZWssZGlzY29ubmVjdC10
aHJlcw0KSXQgY29tZXMgZnJvbSB4c3BoeSByZWdpc3RlciBtYXAgZG9jdW1lbnQsIGR1ZSB0byB4
c3BoeSBpcyBzaW1pbGFyIHdpdGgNCnQtcGh5LCBJIHBvcnQgaXQgZnJvbSB0LXBoeSwgYW5kIHVz
ZSB0aGUgc2FtZSBwcm9wZXJ0eS4NCg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xMy1yYzMvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
bWVkaWF0ZWssdHBoeS55YW1sI0wyMjYNCg0KVGhhbmtzLg0KDQo+IA0KPiA+ICsgICAgICAgIGRl
c2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgVGhlIHNlbGVjdGlvbiBvZiBkaXNjb25uZWN0IHRo
cmVzaG9sZCAoVTIgcGh5KQ0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgICAgIG1pbmltdW06IDENCj4gPiArICAgICAg
ICBtYXhpbXVtOiAxNQ0KPiA+ICsNCj4gPiAgICAgICAgbWVkaWF0ZWssZWZ1c2UtaW50cjoNCj4g
PiAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiAgICAgICAgICAgIFRoZSBzZWxlY3Rpb24gb2Yg
SW50ZXJuYWwgUmVzaXN0b3IgKFUyL1UzIHBoeSkNCj4gPiAtLQ0KPiA+IDIuNDYuMA0KPiA+IA0K


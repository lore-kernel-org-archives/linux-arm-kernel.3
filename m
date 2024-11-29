Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12BDD6EBE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 07:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyRUuMhvJZ3z8X5HFUnHNWgDCqCPYkZ5sE5KtHWM83E=; b=Y/qsXgFE/lH8xA4Jzr0/7zCl1p
	4rdD8OwrXEDBrWNqIr9t/1dmOV3H/0XTbPevH5Q9xkm7+8i7jYOCLoTS6CL1usEBJAjQyolZNrnNi
	vZ2YoVOQC1rzo2PpGM4UVI6hLyHhBCrngDQ2W0Dk5dzywQpsqLXb1JRjFHwhAq+65XWYURUNma9tS
	trRUfMpXfwcnq9iBFlsLvj44Ua19ZsJnv7JDQLn8/L/a1x6ALJd8VWN6mPYbnx39moGdXGgKDRYgR
	H+R3uooX4fh/28gqPdcjuU2QoVLNNDqvi+T/uaVJ2s63bcVIWRfwF8wboGWDIKEGB4xUBhuAiZuLu
	J/8qWEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvRd-0000000H4rI-37lO;
	Fri, 29 Nov 2024 07:29:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvQf-0000000H4kI-1e8E;
	Fri, 29 Nov 2024 07:28:42 +0000
X-UUID: 8a244314ae2311ef82ff63e91e7eb18c-20241129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MyRUuMhvJZ3z8X5HFUnHNWgDCqCPYkZ5sE5KtHWM83E=;
	b=i+WN5eQBDmYIHl5122nkPwpTpmu++LhPBy01VPDoJoYMQkzZSvC8MBsSooDJ1IiiQOwUz4qn3h0nOhH8tYGy0LzoGnqrGVcs6xWnCPFguHgLQN65RbvBmU5gLdkDwwj3DrPeQAOV+h3s6dPUGnsf59yc+dLsA1oplW5QAuOzBEI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:8fb8bc03-9f3a-4aa2-93ce-56aa2b5fed9f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:b7ebb123-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8a244314ae2311ef82ff63e91e7eb18c-20241129
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 617191868; Fri, 29 Nov 2024 00:28:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Nov 2024 15:28:30 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Nov 2024 15:28:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHaI/dqo0PBlurA81AkF4dyIRJ2RHunVHHTcFyH+PIJIjbSWB9PQchhWHkVpnDJtokOmOtMmX7aUyH3H2jiJ7bodvnJRKb4SKmGHSjEAQVo+V5N6rGNf9/FcmSE2BE+ej0kbIa6toCacp8fqhbnNW7+Ne96vT1GcZ5hLCCeryup1Xm/214jtXcC/gwSc6MeW+oFMHjvVYc2QXothFetBsxp0CCAsrmUnws0S8fyiFFyyDwSlQETc7Hrul7wkEO4x9rflUEEZ2NlnoDujD1TkiUTc6DUzNIXR3ZXz5qtgQXWAco47ht5iCY7hwoJewVv1NfRG5D3HDaIr+oh0ehdEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyRUuMhvJZ3z8X5HFUnHNWgDCqCPYkZ5sE5KtHWM83E=;
 b=QPAwJR62ZyQ3/1YE/wnXku/xgC+ew8nJAYH18uKrS24WeFg9wLffxvhQYbI608i7U4iLuFk43rBRIa8WVOwTy33OY9jkOaPN7sNiHkVSG2FYwL50YPVzMXlGA3RneavyZstRnAEehNjILf/kcKq9q4m7AMoG8bhclyPqUihefIdH46TztRYZEpVz4TGdUPMFwitNn8vdaREq/NoeuVA0L7ziclMN8JTyJyd7JU4O7xY+Bfmb+A9vhTNQL5oj+2HMj4n4kZ+p7pLtYvrpu9ENph/xjytD+EBh4xU8Uj1rK9wnhTYEQfX2H02SPBF0XhSZWJUoBWlcHFz2t/sMhFoU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyRUuMhvJZ3z8X5HFUnHNWgDCqCPYkZ5sE5KtHWM83E=;
 b=uClH7d38/PU8tyjtX96zYQZDye3naXnzcuL5V+anRL/kULSSwNQDdefw5+SrC4QialgRre1GeWGT59kf7SNkaTAHV8L9WGo8yjvSO/OHsg1p+/9ACEtSgpRYup7AaZwSz1RlhIvGyVKtqWCfTYytFPsNtevDg3F0i6YexTRVxuk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7300.apcprd03.prod.outlook.com (2603:1096:101:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Fri, 29 Nov
 2024 07:28:28 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 07:28:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbO0pOdhPnCCfvPUeRqumGFBNh8LLN6fcA
Date: Fri, 29 Nov 2024 07:28:26 +0000
Message-ID: <4e9794a8151422de251b38df0d0ec714dc6651a4.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
	 <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7300:EE_
x-ms-office365-filtering-correlation-id: ae9d467f-61c2-4a09-880f-08dd10476a64
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UXczS3BKSzhHVkdxcWFTZWkrOTRuRGFQZjdNZDFMdlNTZzdRelFTYUZZYXZN?=
 =?utf-8?B?TWFiTHZjNCtkcWNzS2RKUnNYTW56RWNlVzJBVm55ZUxZZ29HOXdpRjdIUWJk?=
 =?utf-8?B?NUZxSHVKL0VEZGcvbURNa0xYeEwydHZROEZVMzFLQVM3NEQwS3lQeU5ieVN2?=
 =?utf-8?B?dWFSazBQYWVKNDIrRnp4TldPSW8zL2dsdVJTMUQxZWN2QTlpSVQvU1ZzTG1u?=
 =?utf-8?B?eXpHaFBkYTRzazZMOHdWZUpyMjNGUjN4ZkIzekxHcG9mV0dDRFBiNUpHNDAy?=
 =?utf-8?B?ekRlSW16cG5rbzRoN2lyR3ZVbnB1aHkxWVBpRWpnRzNza2xISXU5V2hEa1dE?=
 =?utf-8?B?MjMyL29FK3RiVTAyeTJpekxvczI1WVExWHdrb3RMcjdGeDBVT3RxVkhBZFdC?=
 =?utf-8?B?WW01NEJnWEZQN1o5U1lac2lnM1JuZnNaK3Z5U3kza1RENDF1Y1lhOTExUmtX?=
 =?utf-8?B?WlUrSEtoWVhIU0MwWmd6dzRHZlBJS0prMkYrMHZVU1B3cHYzZTQ2ZHh4RXBj?=
 =?utf-8?B?bEZoM3VoVnVZV0lkeHI1VE9yRklaelJKQ2NBWWFEZTlwR3VEOVZoUXFOT0xi?=
 =?utf-8?B?N0w0ZUlGcGlCTXFtc1c2VlJpdG1XVEMzSU9zRXk1K3VFay9iRzZPWVMxeUs0?=
 =?utf-8?B?dW5sdUF5R1o5WWh1RVJpZ0pPWUlYeHBUZXh4dTV0RE1ST3VBT250VGFRSlRF?=
 =?utf-8?B?cnZmOWV6SFFKQ1VueE4rVDUvRkRqbDBwWDFDb0NIdGR6b0FNZExzYjdTTEZt?=
 =?utf-8?B?SUxMNE5iSFRLNU1SZGJUY0dtYlNvQUFBbDYvYWQ4ZlJONVZ3V05xYlNnVFJj?=
 =?utf-8?B?NmQ1MzlseVBQem9naTJ2bVROanErN1JYU216NGZQTGlTczZXYmNWVGh1aEZ3?=
 =?utf-8?B?aWtYS3ZnSmZ2UGpGVUdId2pRY0RTQTNadUZmcngxU2QrN1Zvc3BuNm5CZE51?=
 =?utf-8?B?RTJjZmwydG11WmRTbVpFSmwvRzcrTXl1dm9VSEYyRkNsejdFL3UxNzNoK3g0?=
 =?utf-8?B?M0Z1cmpQa1NxZ3dSb0JHOEhML2d1YStpNElNUXJZTC9QcS9pYWFST1ArV3Ex?=
 =?utf-8?B?Sm8xMldiNzNCamRrQTFWZno3VStnWDdDczVuK1pwdytoL1NoMmRCVXE4NE1W?=
 =?utf-8?B?MnlScWJ1QUgzbVBPRlBLR04wNFpQcWRTUlJaYzdZQUNZSVBoc1B2M0h3RnF2?=
 =?utf-8?B?QmRkejRwQVBsK3ZWUy91TXdsNmNKVTBBOUxRSXNrVUo1RVpEeFR1dnNmT1Zw?=
 =?utf-8?B?aXcwMzZTRTBTcEpPMUs0NXAvc3BFMjVUakJiUEdkL2d0RHFqMmREaDk5RllC?=
 =?utf-8?B?TUdaNHlGRHFqUitoS2NlNjFEckdzWTlPV3d5NndzZHZwWVhKWGNYV0hleEJl?=
 =?utf-8?B?dlJ6VURHbXcrWG9uZ1JFZloxaXdxL0VkOFE1WEhpb2R0cGlYaGo5UmQwbEM2?=
 =?utf-8?B?TnhuUy9sSG1ZN3NGdVBXU1ZzdUFXZHF2SEV6VGF3SXZpTDd1UmlWbllLcEI4?=
 =?utf-8?B?dWJLdjlLVnQ3bnYxK2RIOFJDRUJ5SEhBR1FxNXFSTFFDWFRxS1FJR1J0bzZT?=
 =?utf-8?B?R0lWdmsyMTV3NlZ2bnU0V2lMWmVIaDNpSFRPcHphdWY5L1ptbVRmVWxRakdz?=
 =?utf-8?B?WXNtVFlGZFNIcjBvZ0RNZWlaNzJqdzVKTTVVRGtUZWI2VmlGNDl5d1oyZDda?=
 =?utf-8?B?ZGFEUGh0U1BkL0NGVHdIYTNqb2NTUFlzeXJhTThMT3Y4dHRWUnRrNXVsRk1E?=
 =?utf-8?B?Ulh0MGRKYnBvZGhjRklPeXphNDU0WittNHFiNVJ6NkgzL0grREEzV2s5YUZ4?=
 =?utf-8?B?dWFnL2h5Q2IrYUw1bHovdVg5UEJTUVg2eWdFN0xOdGFTdnlhVFhPZ3RMZnJM?=
 =?utf-8?B?cm5ZcmRSM1E4bWJMdHBjRm81MUhuMnFuM0ZIUmRjYXZNUlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGJPcnJETFkrZzJhZzBKdkdIRkNkOWplY2xKVFF5OHdKMTBJb2RPTmtoYk5R?=
 =?utf-8?B?dU4rOHlkNXlXOUMyMG5NbVQvT2lrMkpYa1BRV2dEN05xY3BkYU9ETU9Zenh1?=
 =?utf-8?B?UHluQWhCWThDV3hyNjVWZlFFTC9mTHJZMitLdjU2VnlrL0FhNFZ2TEhybWxJ?=
 =?utf-8?B?T1Yra1NRb3YvMHVOT1JvbE9YbDUzK0ZDMU9XTGUvaStORmYyRnllNVJ5d042?=
 =?utf-8?B?S2xEYjRXdkdPN0FXYVkzZnByNEFuYVEzZVFNZktOZlNMc1gyQTN3QjFaYnox?=
 =?utf-8?B?R2twZ3lJb1JUTXlISlpSYWRYMzFhZDJicEp1SnJreXJVcko0MTlLby92OXc5?=
 =?utf-8?B?eTZZZk9yVzBpc2ZyamhLN2RLMkdwNTQxd3UyYXhiWHlRcXlaQkdMbnNFdWtM?=
 =?utf-8?B?NkhMR2VsMnBDR1RhdS9WN05palJod3ArRGYrdWh3cjBWbjFKT3ViSWNtaHZv?=
 =?utf-8?B?bWp4QkczREt5ZExnUEFUWUhrc2wvL2hEb2lzczhuR1RLa3JqY1dZYmxrRmRV?=
 =?utf-8?B?dDAwYmR5VTFIVjR1VGpoKzRZaFpiR0IwM1dHMjdTK2lHOFdnWmpMUVhUVkI4?=
 =?utf-8?B?K1dvNEJiNVJ4Q05GcmxiV2RuWEoxMWhxeW1PMkJ6cW4ycnZQUmlHeFBNdHZQ?=
 =?utf-8?B?aENzaWMvU0MvNHVYU0J6SkVWVVNYVW9iRGNuZ0E0bXRRcTBTUURzN2JwMzRC?=
 =?utf-8?B?VlowakE4QXRIYUxsWkMrbGx0eUVHOE1MdEJXYlRUOXRNYkNoRElSYW8xNXhk?=
 =?utf-8?B?dW5OcU1idjBKZjBLU0U2WXowSTREdE05bE5lWEozcGU5VHJUSEZ5WWRXMk5z?=
 =?utf-8?B?SFI2QXFUNml0bFVCN2FicWNZYXBycjNKb2tzSkIxeGhqTHloaTlUdW95Skpy?=
 =?utf-8?B?KzV0RDA2TEtibjV2MzY5VGtQYzQrQjJSdVAvYmNBeS9helJ5ejdTdExHQndk?=
 =?utf-8?B?ekRqNmVkaTc1Z0tYR2FUakJTY2NDanN4UWdDa3JjS2oxbGhiZEh5eWdpTnc2?=
 =?utf-8?B?SkQvMUhlRmZOdXNwL1lRSWhqTlJhOHBSMnRCZ3pqTUxFbFF6WlFaQ09JZ0lv?=
 =?utf-8?B?bFFsVDk0Z1lON3h0RDJGYWhGS0Vuc3hDbC9HaEN1c2c3cmhtd29Ya1BtanBX?=
 =?utf-8?B?OEozTW0rTVZmRGY0ampDL3ZIdzVZRUEwbE1DOXN5azVRZ1JhTkpKV2NGWC8r?=
 =?utf-8?B?Q0NGSGhRd3RteHZZWHdKWUY3aHhPVlByYnltK3J0eUhLclNZZDFuK0orMU5o?=
 =?utf-8?B?WCtZRDB2VnJ6YnFpSVJmd0pLVUZOT1FZL3ArZ0lJUGZoYjROVTl1aHhpbEls?=
 =?utf-8?B?a3RaYWhESVMvdW90QkJCNXRocFkyRzZaZUFzL1J1RVNZUTYyZ3QvMDdnZEt3?=
 =?utf-8?B?U0tYdXVYcG1MSUQ1TFlhRTdjdFVVL21MVmNyQm1VV3BwelUyV3Rod1JwTGZ1?=
 =?utf-8?B?SG1aQ0pLTXErQVJnQkh4TUVWSnNMNERxMkpLRjFTVXNkaHlZN0o0ZmZYekIw?=
 =?utf-8?B?QTNseVdFdHF5YXo2eEV2eFlyWExuV0U4WTc1RUhaOEk4TkNQZDFBaUoyYTA5?=
 =?utf-8?B?YXc1ZlFIR1FrTkF2TC9abFJrYldwZVFiSDlzY3Y2WDVTY3l4aXo2SWU2T01r?=
 =?utf-8?B?L0s1L3JqZlVHVkpVbDVPejZRWHZvcTVwdGRXWWE1MHUzUlgrSnpwT01DR3NR?=
 =?utf-8?B?WVQ2aXY5MXZFN2owb2dVQjRjeFUrRzhKR0hxQlpqR1g1S0NWbm40OVA3VjNK?=
 =?utf-8?B?UGdraUZRMzFrV1NaRXNxK0k1RGRueXpaV3ZGZ1JqZXBnU3JpNTE5SmhwMEZu?=
 =?utf-8?B?Tm0wWjlFYTZQNTgwdk1rRjBYTlN2aGlrSWlTTTJndmVBR3oyUlVyOEthTmtT?=
 =?utf-8?B?dUliaWNIZE9YUzJRZVIvL2ZOZ2tiY1hOamZWbXpqZ1hSWDNpc01UV0VDTkth?=
 =?utf-8?B?Q0pHSzBlb3g3UGVTTitUL0V5Ti9odFRpUk5ha2phTmNEVWtkRFZVY3hjN0tM?=
 =?utf-8?B?VjAvM0ZyVUt2WDY5TnR0R2NFOUIzZ05XYllFalUySk00TEZ6b2tLUjdXcE5C?=
 =?utf-8?B?cDYzamZ6a3haZC9IUzZlODlhN3RVdWk2RnAwRUQ5NVZYc1M0YWM2UzY2VlJJ?=
 =?utf-8?Q?f5i1zvos176An+vaYcWPeueSV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7F726B20FB80D4ABB4FEB283533B101@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9d467f-61c2-4a09-880f-08dd10476a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 07:28:26.9652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M0Fon1DyaQHdcC678RG9cwz0EUmPhT1SgQlLE+VQqu3yScYZ4fHA8ZfPhP8ibjh3EuNPKfHfDsOdV8CNMehBKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_232841_448619_0579EDBE 
X-CRM114-Status: GOOD (  12.60  )
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

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtzdHJ1Y3QgbXRrX2hkbWlfdmVyX2NvbmYgew0KPiArICAgICAgIHZvaWQgKCptdGtf
aGRtaV9hdWRpb19pbml0KShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHN0cnVjdCBoZG1pX2NvZGVj
X3BkYXRhICpjb2RlY19kYXRhKTsNCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9m
dW5jcyAqYnJpZGdlX2Z1bmNzOw0KPiArICAgICAgIGNvbnN0IGNoYXIgKiBjb25zdCAqbXRrX2hk
bWlfY2xvY2tfbmFtZXM7DQo+ICsgICAgICAgaW50IG51bV9jbG9ja3M7DQo+ICt9Ow0KDQpCZWNh
dXNlIHRoaXMgcGF0Y2ggaXMgYSBsaXR0bGUgYmlnLiBTbyBJIHdvdWxkIGxpa2UgdG8gc2VwYXJh
dGUgc3RydWN0IG10a19oZG1pX3Zlcl9jb25mIHJlbGF0ZWQgcGFydCB0byBhbiBpbmRlcGVuZGVu
dCBwYXRjaC4NClRoZSBtb2RpZmljYXRpb24gaXMgc3RpbGwgaW4gbXRrX2hkbWkuYw0KQW5kIHRo
ZSByZXN0IHBhcnQgaXMgbW92aW5nIGNvbW1vbiBwYXJ0IHRvIG10a19oZG1pX2NvbW1vbi5jDQoN
ClJlZ2FyZHMsDQpDSw0K


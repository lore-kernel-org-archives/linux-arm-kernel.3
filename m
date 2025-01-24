Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D44C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFcqryMHD2cZ2qYwJ9+VDwilg/bLnxHrDV63K4KxIYw=; b=L4p/5/+3tiQENMu/rFd+cdHCqj
	D7Uai1aXZ002Br+xfw/gNpmomre5NWcQhT5/Yf1GIQ1jrdaZ7YiRgQTY6bIMnSlQGAc0aFBnd04jo
	RU/sGRDvjqAxFH00FduwTmfMwiyffIkqzY9TG50f6ecexKxwo54zU7TXgfkzr6k3Uy8YjcjQycKWa
	j65csT0d23JpgpvXydeQH5C7JcTuuPqOjx2IeMHXNuS9xOMnEY88XWPYj75fIkG+p2DsQ45EaFJAN
	jiLSVqeWl9d091QxGSAQNC4ZvyjsOuWgTNLCjqikM7NiFaB2tiBkZSjPwPQDV1/Mi9Sa3Ir6vEJac
	3s+KJxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEdB-0000000EBMB-3qtH;
	Fri, 24 Jan 2025 08:01:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEbp-0000000EBEI-2QpX;
	Fri, 24 Jan 2025 08:00:10 +0000
X-UUID: 36a94090da2911ef9048ed6ed365623b-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nFcqryMHD2cZ2qYwJ9+VDwilg/bLnxHrDV63K4KxIYw=;
	b=HCrf5pvnTtqqg4SVsFmhUh8ey/nW4hYv1DW7wkKXl0bKtuwGmVWm0fXRRXipYLWyJ79e+hhvdLRxG6XDGka5yC9F1G+ANwjhZm6YLvzEyFq09zIDQRZX1JUJwcAbGypJ241jsG9IFhk0ymSiD01OG9uktyV7vx2kNT95fpWbYVI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:391c0fc5-015a-45ab-8863-57d2112c8605,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:50faa13d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 36a94090da2911ef9048ed6ed365623b-20250124
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561773970; Fri, 24 Jan 2025 01:00:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 15:59:58 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 15:59:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSKtEAFQUlWfY+PLdR8+CsTaM7s+iT8Xt+SDXzhDk2YZN3GnfTdIhDogzEMxT2DifLEGbwKlGPhtSfZryD7zBHgAz9Dntobj1wVksBS9uYM2olxkpgIE/jr4vB2FTn1TUO8+Bq4+iJHEnoHYNVuZ3ZYiggCDL1Cr+nQWRqEsCI4iIvpi5vIszS440IM6MWWsTrH/TY6hg+ZDLQ1xKkdb2+LVTrbT1IXne2bMrAQvQXH+zyQdf6RDXhIddHPA9woFYoiisMqOhg1gDHFTkrSCLxy+4UcHmp6KwdOsuWKeDBk/U8iB3fi8NkZiK9kxhZK4AtGlv2Kq0Fph3Cz5k3jUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFcqryMHD2cZ2qYwJ9+VDwilg/bLnxHrDV63K4KxIYw=;
 b=eapLjCXOvlg2BxpKQlJBvrtvY6IfwKrGfREAjrBrvhSkVf82ercNnFx7RPkIDXPcNjMSFexaM2H3kYGl+3Hgg4uCI2Cr6np8ZyQe1UOKu2+2Ccpl2MPBhXymlMBB1QtaFhXAkA00QxZX4v0SJbol8HOhT9ew1pn4O9Nyzdb9KVI+X/d9DoQ/MxXOftKcVc9QiHw8M2yQDo0bGjTcg/rYTzHMSkAerp7b4Ycwe3qOSFzJDSxNlM6fy6a3xLOCzVXlrKyJPCe/4lqrUIBL4aqvDosb1XiFxVFWL2EGmJGxjPhSxC9rS4988hXQYz1k27KINgVjMs7i0+0fIbaPbvIZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFcqryMHD2cZ2qYwJ9+VDwilg/bLnxHrDV63K4KxIYw=;
 b=m8Z6rx6dV1zJ0nXPuCFhw+M8dNeWO0++jRWR56zgjtZNX9KPtxWvORqywoZH3XTjzD1AK/hFgZXtACnTOWsnsBtNNMNv3ZOjJ4funTEWqpQ5eWF9T1fobodU+R9vN3c+bQr8QHQpLAI/jf4zSXr7ZXt+YlEU3PFr/PkGgjjepuE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7147.apcprd03.prod.outlook.com (2603:1096:101:e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 07:59:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 07:59:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 15/34] drm/mediatek: mtk_hdmi: Disgregate function
 mtk_hdmi_audio_set_param()
Thread-Topic: [PATCH v5 15/34] drm/mediatek: mtk_hdmi: Disgregate function
 mtk_hdmi_audio_set_param()
Thread-Index: AQHbZcr41ks0AH7IuUisPrmbUDQDVrMloFCA
Date: Fri, 24 Jan 2025 07:59:53 +0000
Message-ID: <4c9ef59999effc2afde7b78178a540b929c450ee.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-16-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7147:EE_
x-ms-office365-filtering-correlation-id: 310e1b88-63da-4419-0aaf-08dd3c4d163a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dVZkWDUvNWNNbTA3eXhGaGp0ZGgzOXZReHVSYW9xVzIrdDNoeU5DYVVicnY3?=
 =?utf-8?B?aEovYkJPKytDY0swWk4xRWJmWmVYeGpYbXUwclptTlprSlkwTWc0RjRERHRR?=
 =?utf-8?B?MFBnR2wxbUtOMDdtVmQ4aWhqblVnSVlIcHdxNkZPOWw0bWZnUUZ0cWpmK3hR?=
 =?utf-8?B?eitBeW1pajdGQmxuSjJ3ZVZjRXJvaHEyUklGVnZSU052enNGdjcxY0FLUXpN?=
 =?utf-8?B?Nk9MUGdad2tDTXJQUUpobDY3VVo1blFUdldDeG4zazEyUHpSeHFrQ0lmME8z?=
 =?utf-8?B?NVREZGJIcHMvV3hSeG1JL05MYnpVSkhyTzlPZ2xQanFRRkFWMWwxaEREcitj?=
 =?utf-8?B?SWU1UzJGVmhrVUtkQTJDeVNUQVp5bVRKajUyM3pqd3FTbFgzcmhUODRXYkVa?=
 =?utf-8?B?Ykl3Q0hyRUNNNmpick5QTFdVelg3MHVuWHZVbU8zbEJhVkt4cmdTcm92N2JP?=
 =?utf-8?B?a25Pb25Id01mOXFpZ2Z1UmtmSlpkNXFPV01vd0ZqODlFb3VXZGlXTlpKYXBF?=
 =?utf-8?B?dEZ0Vi8xZHZmbHZPa3lNR3dtbkpCWGlvRXJxaHZzVkt5Sm9PTVZESWJIQXVH?=
 =?utf-8?B?TmpiZmw4MldveHdtVFNKUGhVczUxSnlxSGpmOTJjMWN2dGRJTFF2djgzcWF6?=
 =?utf-8?B?ZW9ZZE5XNy9uVUorR2FmZUhzV2dOdDVJNi9UNEs4dnZvUk5uUmtkYzdGYWhp?=
 =?utf-8?B?d0NDbnNCN29IMFY0ZXIydEhaekpUU0RNOGp3QWZMZlc1K3lqbHdnS0M1K2lI?=
 =?utf-8?B?SktoaGZkWjNscHhkL1FaVG5YaGxNOGdUc05GcG5SRmNLMExwMVgxeGN1Q0th?=
 =?utf-8?B?ODdkZ0h6Y2JpczNkazNBU3h0SEo1clhSQlpZdHRLc2YzeHZkM09KV3VTSlFS?=
 =?utf-8?B?WVNJd0lkY3Rqc2V2N2UrdVdqVE1pVGQ5VEVMc3paclhXUWlydnJITU11ZlJ2?=
 =?utf-8?B?TVd2alcyL2RMUjNvV25UU2RFRWI5a0laSndYRFB2YSt3TkpncS9xb2E0SXc5?=
 =?utf-8?B?bDNtMG9wZ1hNWEtqSmlHSTFxVEdUMG0zUW1mNG5PQlQ1emxiK3RpbnBieWRy?=
 =?utf-8?B?UTdIUW1sZVpEZmZjNHRwV291VVlkQVcwMnNadU4rWkh3dHprVENiV2N1NmFj?=
 =?utf-8?B?UDRDamx0R2ZEdlRKeU03Rkd2eGhDK1A2VTdRUkJTWFdkZ0M2REc4alRiOURx?=
 =?utf-8?B?dzRKTmNnOTAxU0lHMGtqdE1GbUx2UlQ5ZWpITW1nS3EvYi9rQ28zSEprT3pv?=
 =?utf-8?B?aE1JeXhZNjhWdkZjTEFNVU8zSXZpb1V2Y09rYVh1cHFiaFVuNE5jTk11T3BZ?=
 =?utf-8?B?K3FuRkMrSHBmcEdENDdVUU5KcjgwVkVPeXVuSzNFMEVSZk9VVTdYaEE4QmNG?=
 =?utf-8?B?eXlGSElRNzNDVUNWZFVjcEQ3a2gyWjRxcHU5TXYraTg3Qm12KzJacE5xSVIw?=
 =?utf-8?B?emhvRGZaQzZRL1hoVmJ5T29QeGJXS0tHY1dJV2FwYVdnZmxFNXgxVDA5ZW5k?=
 =?utf-8?B?OHR3akRqbGVzaGxxOEorR1V2SDZRWkVqOU1PSUhGS0RoZng3SjJKVFZNb0tu?=
 =?utf-8?B?Wmg2SkxUOU81VTFhNTNtZzJmVlZDU2hOMndKQ1FYdzV4VmthMzI2TW4rdm4r?=
 =?utf-8?B?UXFnZWZvNE9HanhZOGNzUDdxeHI0djFzc1I0VFdyaCtnNkJZaW5xamYvMEht?=
 =?utf-8?B?RVZieWE5RTErWGp5WnVPS2ZENTl4eXJ4elloU1NIWXZBSHg1c1BmeEpkUmlS?=
 =?utf-8?B?S2VHQUtjTnE3WEIzYTh3MjhOc2dUamdMb0xqT095MTMzUGpKUjNQOWlsSW5B?=
 =?utf-8?B?M1hvWHRLcEcxOG1ZTXBpdU5CL09lQXcyQ05MVTFza0diY1Y0Q2UyV1JnLzdU?=
 =?utf-8?B?T2xsaGlidDZHWUY4TC9xT2l4Q0ZNbk90dStIdlpuU2dyVzdkUjlyQURyOFVN?=
 =?utf-8?Q?65GR/SfbTXezqU4ZVWJRSlFlBod7YYCb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXlkL0twMlZ4N21IM1pXQmpCYVpEOUtjZGtib3pyci9LaW9haGFRZnUxQ1l6?=
 =?utf-8?B?dGl0eU16dEplK0RQZW45OXN5QktPcS9qM2NMTHR6bUJ1Zm16Sk9BdEo2cVFN?=
 =?utf-8?B?ZFo0Tm1xT3F3U0ZMQ05qNzVxNXlaeUdsRVFjS0JpQWRXbllUSXRudzZuclg4?=
 =?utf-8?B?aU1mT1I5SHVDcnYxSStHQUF4ZWI5a2hiaUxGMGdpUGhvNU4xVFlQOHV2Q05j?=
 =?utf-8?B?UkZMSFBJUUwvbHhGakNPV2ttbG5JRmg3QlZQTUZ2SERYOUx6ZWwxOTdGaFYv?=
 =?utf-8?B?Q0FUbWFxbTNxK1I0VkRjQzFjRWVNK2NXbnEyOEVjRmQ3bDZXV0ltV0Y3c2RD?=
 =?utf-8?B?Y0o5SmFMQ3ZuSjZIckExd3pVdUVGWmU4cFdWeTNyd3lGRzU4WU9IQ0FiaVFR?=
 =?utf-8?B?ZmRoTUZQSmJ1VlI2enp3bU8zNElvdDI5Z1J3MmEzYlVzcHpOUzA0am5YSzA4?=
 =?utf-8?B?dnBqZ2ZTYjJMK25XOG83QU1SMWpNZUFSblpTckMvZ3Roa29zTHJuRkFKbmxn?=
 =?utf-8?B?UEhYMWlKSDU1bDM0bEdraEVsdFVGc0pES3VhVlJlTGMrcmMvOVlHOWdFQ252?=
 =?utf-8?B?YURhYWN1cFVwak42OUNUZWI2S1k3TFNMellrOU9zWXFRaVc5Nm5KS1JGN0RF?=
 =?utf-8?B?N2d2Yys5bjJQbFhoYlp6QW51RGJhcUs2L3owZjFSa0h6WWJJQkNoS0tXK1lk?=
 =?utf-8?B?NklKT2t3V01PbVAyRG9YdkV2MEdLM09qSk1hTk1mOEllay9nVUkwblZyRUgz?=
 =?utf-8?B?dERnSDZ1NG14UXE0WTdieUR6M2NEdzRzeWJBWTdFbzdyUlRHM0IxK1ZiU0xK?=
 =?utf-8?B?ZzB1NUk5UjhucENTa1J1RE56bngxblRYNjVaWk5OUzVGbEkzcUJxd2ZYdG9T?=
 =?utf-8?B?Y1pxV2RBdWhCZVQzY0xxMkQ5YlIvdFlFVzR1UDY5bFVveXRCaEZ3OXAybHpp?=
 =?utf-8?B?SG54aGJ3Wk1QTDlheXlrcXZoN1BCSjRWOWRMcktTYXRMZEdHVVBIR2h5VWpJ?=
 =?utf-8?B?cThuZWtPYnlhZnNlVUwreWt0OHF6QjZaM0Nrbi83WEZLZ1AxRDZKSzNqTk9w?=
 =?utf-8?B?NXkrOE9uZ280cE1BVmwyMVZpdTBsZ2xIZUhKVHNxMEFDWWNabUZ4eFZtcm04?=
 =?utf-8?B?b2RJMk9lelpubExzanZxZGs0Q3NkekpTQmxGM3M1dmNyNEpGVjM3MXdBUFZn?=
 =?utf-8?B?Z0FsMnBTemFBK29nTVhnRWZRWEhmNVpvWW5FRkR4Z3dhNmdYUitIR0FWTEM3?=
 =?utf-8?B?cXFkN0RzWEtjcmFBazhQdWFVYUUybU9meGFSS2ZYWWtFZDhPOFdxL0hwVkwr?=
 =?utf-8?B?OFhTMEYxbEs5Q3l2VGVTUkFibGR3N09BbkJGWUw3by96Szcxb1RUVTFzbTU3?=
 =?utf-8?B?VTJJMHg5OUxXZENUVjZoSEcvajFKZ3pvc25jQTBwc1dQZld6TldKcmw0eGpu?=
 =?utf-8?B?dEtmSU5DV2g4YVByVkUvWnY5amhNaGNVUzJUM3FqUDdCTmV6QTlTb21kalpQ?=
 =?utf-8?B?T2dOUDcrcEE5RXlWanViZXphRnNvUEU5UGxqWW1kc3BwM2FjVjB3N3RkMDZ5?=
 =?utf-8?B?Uit2cTlaQ1pqZUlRUmRtSkhYcVpBK0tvQmlPN3J1MUdSYVM2RE9HK0dpdUYw?=
 =?utf-8?B?cytndHpxeEdBalhDa3RIUTVCa1gxNUxxQzExN1FMTFZsVWtaWk0vV1N6MWYx?=
 =?utf-8?B?Rm5FQmZtektXNVFsSytHWnNlbEIyV2xoaGpqMTRwcEpWMGxST0Jjb2FNOHdE?=
 =?utf-8?B?aGNqL3JLN09tSzlSemlndlhkeVhmNlBpOGd0YTc0bGF2d3JNbUhCQ25odCtk?=
 =?utf-8?B?RUlmU1VjNXozWXdqWVdhOTg5aGF2Q0JPYUMvQ3ZxUDhDbVBKR2JEN1VsR0lS?=
 =?utf-8?B?QUJMZnp1c2NTRlMvaUt6WnBBRDZreXU0VEhNR2ZZQjB4S3R5NVBvTFRRb0VI?=
 =?utf-8?B?VW9vOXN0MGY1UW02YnA4VzJUUnJnaWVrcDFPNTFVOVp4bGM0a3V3bUN1YXl1?=
 =?utf-8?B?eHF6STVWOVEzTjNQS0hDUEpYQXY1RExrd0luM1lTcFNrWXQ5cDlkSU5jT1gr?=
 =?utf-8?B?enFtWldHa0Q1UUI4a3lyajRwcGczWU5OeGlnbkVneWVaU2djZXpTWHl6ai9J?=
 =?utf-8?Q?0O4QgAwNQI1QpeSqTPmFJ+PZ4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <705B8EF2B3FFB646AAB199F344CEBE0F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310e1b88-63da-4419-0aaf-08dd3c4d163a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 07:59:53.9390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXVhCgGhkDe8sKbilTaj9Sm8/aMsrD3ig7okU5J5ZtkIxI7HCJS8pgMUYOITYVVlJW4RLSW8VbE/j11LqvXz5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_000009_639628_7C942244 
X-CRM114-Status: GOOD (  19.79  )
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

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBcyBhIGNsZWFudXAsIGFu
ZCBpbiBwcmVwYXJhdGlvbiBmb3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMNCj4gZHJp
dmVyLCBkaXNncmVnYXRlIHRoZSBjb2RlIGluIGZ1bmN0aW9uIG10a19oZG1pX2F1ZGlvX3NldF9w
YXJhbSgpDQo+IHRvIHRoZSBiZWdpbm5pbmcgYW5kIGVuZCBvZiBmdW5jdGlvbiBtdGtfaGRtaV9h
dWRpb19od19wYXJhbXMoKS4NCj4gDQo+IEluIGEgbGF0ZXIgY29tbWl0LCB0aGUgaHdfcGFyYW1z
IGNhbGxiYWNrIGZ1bmN0aW9uIHdpbGwgYWxzbyBiZQ0KPiBkaXNncmVnYXRlZCBzbyB0aGF0IHRo
ZSBjb2RlIHdpbGwgZ2V0IHR3byBmdW5jdGlvbnM6IG9uZSB0aGF0DQo+IHBlcmZvcm1zIHRoZSBn
ZW5lcmljIGhkbWlfYXVkaW9fcGFyYW0gY29weSwgYW5kIG9uZSB0aGF0IHBlcmZvcm1zDQo+IElQ
IHNwZWNpZmljIHNldHVwLCBib3RoIG9mIHdoaWNoIHdpbGwgYmUgY2FsbGVkIGluIHRoZSBjYWxs
YmFjaywNCj4gYWxsb3dpbmcgYWxsIG9mIHRoZSBub24gSVAgdmVyc2lvbiBzcGVjaWZpYyBjb2Rl
IHRvIGdldCBtb3ZlZCBpbg0KPiBhIGNvbW1vbiBmaWxlLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDI2ICsrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0K
PiBpbmRleCBlNjBkM2NmN2U4M2QuLjA2NTc1MDA3NWQ3YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTEwNTQsMjAgKzEwNTQsNiBAQCBzdGF0aWMgdm9pZCBt
dGtfaGRtaV9hdWRpb19kaXNhYmxlKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gICAgICAgICBo
ZG1pLT5hdWRpb19lbmFibGUgPSBmYWxzZTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IG10a19o
ZG1pX2F1ZGlvX3NldF9wYXJhbShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFtICpwYXJhbSkN
Cj4gLXsNCj4gLSAgICAgICBpZiAoIWhkbWktPmF1ZGlvX2VuYWJsZSkgew0KPiAtICAgICAgICAg
ICAgICAgZGV2X2VycihoZG1pLT5kZXYsICJoZG1pIGF1ZGlvIGlzIGluIGRpc2FibGUgc3RhdGUh
XG4iKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAtICAgICAgIH0NCj4g
LSAgICAgICBkZXZfZGJnKGhkbWktPmRldiwgImNvZGVjOiVkLCBpbnB1dDolZCwgY2hhbm5lbDol
ZCwgZnM6JWRcbiIsDQo+IC0gICAgICAgICAgICAgICBwYXJhbS0+YXVkX2NvZGVjLCBwYXJhbS0+
YXVkX2lucHV0X3R5cGUsDQo+IC0gICAgICAgICAgICAgICBwYXJhbS0+YXVkX2lucHV0X2NoYW5f
dHlwZSwgcGFyYW0tPmNvZGVjX3BhcmFtcy5zYW1wbGVfcmF0ZSk7DQo+IC0gICAgICAgbWVtY3B5
KCZoZG1pLT5hdWRfcGFyYW0sIHBhcmFtLCBzaXplb2YoKnBhcmFtKSk7DQo+IC0gICAgICAgcmV0
dXJuIG10a19oZG1pX2F1ZF9vdXRwdXRfY29uZmlnKGhkbWksICZoZG1pLT5tb2RlKTsNCj4gLX0N
Cj4gLQ0KPiAgc3RhdGljIGludCBtdGtfaGRtaV9vdXRwdXRfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1
Y3QgbXRrX2hkbWkgKmhkbWksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpDQo+ICB7DQo+IEBAIC0xNDg3
LDYgKzE0NzMsMTEgQEAgc3RhdGljIGludCBtdGtfaGRtaV9hdWRpb19od19wYXJhbXMoc3RydWN0
IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgICAgICAgIHN0cnVjdCBoZG1pX2F1ZGlvX3Bh
cmFtIGhkbWlfcGFyYW1zOw0KPiAgICAgICAgIHVuc2lnbmVkIGludCBjaGFuID0gcGFyYW1zLT5j
ZWEuY2hhbm5lbHM7DQo+IA0KPiArICAgICAgIGlmICghaGRtaS0+YXVkaW9fZW5hYmxlKSB7DQo+
ICsgICAgICAgICAgICAgICBkZXZfZXJyKGhkbWktPmRldiwgImhkbWkgYXVkaW8gaXMgaW4gZGlz
YWJsZSBzdGF0ZSFcbiIpOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsg
ICAgICAgfQ0KPiArDQo+ICAgICAgICAgZGV2X2RiZyhoZG1pLT5kZXYsICIlczogJXUgSHosICVk
IGJpdCwgJWQgY2hhbm5lbHNcbiIsIF9fZnVuY19fLA0KPiAgICAgICAgICAgICAgICAgcGFyYW1z
LT5zYW1wbGVfcmF0ZSwgcGFyYW1zLT5zYW1wbGVfd2lkdGgsIGNoYW4pOw0KPiANCj4gQEAgLTE1
NDcsOCArMTUzOCwxMyBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFtcyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+IA0KPiAgICAgICAgIG1lbWNweSgmaGRtaV9w
YXJhbXMuY29kZWNfcGFyYW1zLCBwYXJhbXMsDQo+ICAgICAgICAgICAgICAgIHNpemVvZihoZG1p
X3BhcmFtcy5jb2RlY19wYXJhbXMpKTsNCj4gKyAgICAgICBtZW1jcHkoJmhkbWktPmF1ZF9wYXJh
bSwgJmhkbWlfcGFyYW1zLCBzaXplb2YoaGRtaV9wYXJhbXMpKTsNCj4gKw0KPiArICAgICAgIGRl
dl9kYmcoaGRtaS0+ZGV2LCAiY29kZWM6JWQsIGlucHV0OiVkLCBjaGFubmVsOiVkLCBmczolZFxu
IiwNCj4gKyAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9jb2RlYywgaGRtaV9wYXJhbXMu
YXVkX2lucHV0X3R5cGUsDQo+ICsgICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRfaW5wdXRf
Y2hhbl90eXBlLCBoZG1pX3BhcmFtcy5jb2RlY19wYXJhbXMuc2FtcGxlX3JhdGUpOw0KPiANCj4g
LSAgICAgICBtdGtfaGRtaV9hdWRpb19zZXRfcGFyYW0oaGRtaSwgJmhkbWlfcGFyYW1zKTsNCj4g
KyAgICAgICBtdGtfaGRtaV9hdWRfb3V0cHV0X2NvbmZpZyhoZG1pLCAmaGRtaS0+bW9kZSk7DQo+
IA0KPiAgICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==


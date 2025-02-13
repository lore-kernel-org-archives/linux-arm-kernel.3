Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AA0C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqs4uU39HRrvXkH+p/+XXSwujw14E5MgB5fTCckFQyY=; b=nf4dMgQBpiEdDItnDIVd8VBNxM
	cnk+ZpmUvDnGYGJWZh7SsKrGxF5XJNSHFsBrJZn1oDGdJC06GlQujRxPUrIW4ds/UbibBR7JF5Em7
	AzTs3R7MY9OebIflEWHRUHDGnOlY+J1B93W9jGQWiA8wgGWSU8jPmUDHQNdFoWX/KwSrQTXIETYDF
	Cu1n6auh0VkvvFyEs8s4VYsfiTqYoR+12oKicNppUpdKddhxcj+xNmHvSN3gG8lG0vO6/Y6OuCUr8
	QhsFrcBAF+GxzbjEbTWsNWA185kK33J9y2if2d2SaSmAMOZmpUZZQ+WTHIobgfaV3Vs0eBjQfKco+
	JdPrJ9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUwU-0000000AL9F-3NyC;
	Thu, 13 Feb 2025 08:51:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUuB-0000000AKW5-23KG;
	Thu, 13 Feb 2025 08:49:08 +0000
X-UUID: 600970cce9e711ef9048ed6ed365623b-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dqs4uU39HRrvXkH+p/+XXSwujw14E5MgB5fTCckFQyY=;
	b=F9fPr7WORGGlbHJzMnkpdJrVoZpGeuoKAO1MpLaJCMEjND+zuvpNBoZjIJdS2KpPeRjMTvZYcmkMNMaMZ3ISh5UDZrkUoIlQwtyB4vWCID5oJXRgLJo4e6s8GWnxd1A7a9Ky1favw0OrQNYHjGLqsiCv4s1QbQHwg8kcO5evXhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:7d4989f5-6160-4cf8-8cae-58c74b2c2a4b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:81b64f8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 600970cce9e711ef9048ed6ed365623b-20250213
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 753757564; Thu, 13 Feb 2025 01:49:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 16:49:00 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 16:49:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmdiI84dS5uokW8cxSJR/28Bexg4CTvOVPuFqrXgqsoFRSQ9uMtTGXLSxIPVC9xKHhtanA880/bLI8YlHZV75mcq5H1GEsyFgzB84VSZ4mkIW/+8W20T06QIX4tYl7vlA/73tKGb+kKyQjJysE7SJ9+SEK0i4wif8SyoIbPdyOY6x0GY//MsWPpELUsQTGMwegQWf+lpMWcqfrcRLSXpZp2Grz/rqDI0IBAIaHPRYTazvK3tKQvHowoF0SYHcPVTUWNlEWiyOBPo6t906OboBqopncqv0ELkn81m6IIp9aDZi58uB7Vonq/t3OlwBsFbLoPf32CWaxlKOsbpk7wkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqs4uU39HRrvXkH+p/+XXSwujw14E5MgB5fTCckFQyY=;
 b=GSXuGL+YjVQOT2oWLor0se1Gww+yOeIOnnToOLDV7SWHhvet3vBbE6AMkzpVsXtjJEBI2z2BLCbZhCQYJZTGrfHKNI4/+gGEMoJBAyV437zjIKnppA4rT4Rlp9ZJHLzu8V3SCvHdZyjB8/S8DGyxC6AJ2THVyuuzXf2RbitdHQn9Q60uGV81SIjZ6IkNEy1OkPYJ2HZw1OOsWNfuRzV8W+sJ/npWNYMwuQpisQlji4dClWjIbl/yuX7CSrdm63qMLoT4jCUxKE2gd8svxczg6ol52b1r87HH6Sls2hlrdsNF5cHjp1SigrWStWOCTpNZCeCszCt1olKZKn19CiuHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqs4uU39HRrvXkH+p/+XXSwujw14E5MgB5fTCckFQyY=;
 b=Zm9RTe4qZ57Ko9xgnTik0UydTL1YCa7j1q18jh/QhoV6fzUXS8PHN9O88U+WOPag27m9ub+x75/YIcIwXu3p3ZFBnp28nRvh+W0aNuowfBxLieGaH8SEtNtzmyDtmRE5sr4Xik6GlP8rKN2Kq29ea6oGjgqdkgPNs4kTM+LWOl8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6847.apcprd03.prod.outlook.com (2603:1096:400:25b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 08:48:53 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 08:48:53 +0000
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
Subject: Re: [PATCH v6 35/42] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v6 35/42] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbfHkwf9M1/bSxc02IusbCr2Q6qbNE70QA
Date: Thu, 13 Feb 2025 08:48:52 +0000
Message-ID: <d013192eb4eb88716407d0e0f3916fb2591766c4.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
	 <20250211113409.1517534-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-36-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6847:EE_
x-ms-office365-filtering-correlation-id: d8d56c6c-a9bd-40ee-9b00-08dd4c0b3e4a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bE9lZ0xXVi80QkRVK3pLVjdQTVN4WkszK1E1RkcvcExlTnh2Q3V1L0xCR3hL?=
 =?utf-8?B?VUh5aUMxTEJtNHlEZFNmSHAxZWtvMTFtWm9LVEhwK2tEMW9vM2pEWTRlRzM4?=
 =?utf-8?B?bjhkZmN3cGVaZVFzMDhZQmtQN1FYdVlLeEYxeVZoZE4wQXVIdS93SGNxSXNs?=
 =?utf-8?B?VzYyZG9ZRDAwN1IwZ3F3Kzl1NGp0WVlEUFB6dHhjRGU5ZERGWWNHcDdLMFQ4?=
 =?utf-8?B?YW45SCtzYnArbUVNYTQxNkVQcjJQTTBQelhpa2laVUJoZnI3L1V6am9Sc1Js?=
 =?utf-8?B?RGx6RklCYkxFOU1tUVFJaTl1R2cvUG1iNmdzTmMrcnJIdEJ3c01uWENMclA2?=
 =?utf-8?B?blpyelFTWlJLd0w3TWZrcmtRS0FkRHIyVlNzUVhnWmgwaVhxTUJaMTI5RXBx?=
 =?utf-8?B?SVZkM1BYTHZYZWhacnFsWFc2NHY0RGZPQTNrSFFkYzllZW82RlFKaktJcEV0?=
 =?utf-8?B?SXFsaW1OSUhwZ2tKYkM5Y1Z2UWQrRXNxVmVOa0JpcFA0a051SGhFdjZQZmRL?=
 =?utf-8?B?N01CUUY2aGJZUjZzblkyMG1wUmxYUnRmbTVJckk0aVZKZi9WQ0VBYWUrSVQ2?=
 =?utf-8?B?Y2tNb1VrNWhlVFc5aUpXV1pjVlFrd3JkM0RBbDk5MG1TS2ticjYzcEZKWmZq?=
 =?utf-8?B?ZUhhQzJSQ2tVaEpqdHVhSmVxSGpkTnVFVUlyK25RVzNVZXF4UFBPWWRaOFFh?=
 =?utf-8?B?QktOeGRwTVdnbWxXdTc5MEJOUlJMSkcrYjNTRjlMM054MlZUVDFVUkhnUEV1?=
 =?utf-8?B?TVNrUnozbkM0SHFoRHc5MFl4NWFVdzZhSk8yV3c3dW50dCtFN3NlUVEzOS9D?=
 =?utf-8?B?MTViUi8wc1ZoV1paL2pRaWdjNWtQNFU3c2VGWVZzMGZQVlFsNUREOFNYaGR5?=
 =?utf-8?B?SWVYQ21zWUI5SjdiZmRuYnFFOURTa2N6cGQ5c0phZXlyRHRISEp5V243MEhW?=
 =?utf-8?B?WlBNaitxdndIcGthdzdUd3VvZDBBSWJFeU9Rd2loZ1JnNElSOCszb1VFZFM4?=
 =?utf-8?B?UDBJZW10dzBrUnVvV09IS00rQ0g5aG1Va0o3Z3NaQ2xZRi9XRk5lVEE3MkZP?=
 =?utf-8?B?aDE2UEFVU0JrRFN1ZENtZG5xU00xRVVYZDEvenJOWEtVL3VsYVp5T1MyK09u?=
 =?utf-8?B?YkFERmhndDdhdDYwcHo0TThIN3dpNGgyR1N0bU84QWt3UVlGMG5RYTlIUnBI?=
 =?utf-8?B?dUpmUjhUSFBxOFkvRExPZ3B4b3RZamhwNXhEWjNUc25HeFRwZnNVa2FvcGo5?=
 =?utf-8?B?V21jOVdGcGpvMVRQak5ieXM3ZmJvTUU5QXpuWGV0bTRCV2xzc0RUWWdJcXBP?=
 =?utf-8?B?d2VuUXpoUThTd2RPNmtoaVVBaWZYQStOREk2WUEvNU5XZkV2enVMV3Z6NTdC?=
 =?utf-8?B?bEsrY0xmQUF4NnFPUFNlTWZHOXlqMkVjY1N6YWo5d2QxeHdScmV5R3NkWnFm?=
 =?utf-8?B?K3RrQVcrWXluckxSRU5MdDYvbWU2Mk1qZEoxcU84RjNLNU1rNGcrWEVmWTdk?=
 =?utf-8?B?TDlvRDR0Sm4xL1Y4aGRQamdmdm9na0F4T1kyNGFUMEVsYlJlcmNlcStIeGJi?=
 =?utf-8?B?MUZBZ2VENWVzdG9ydHVyVjZBTkJETW9PSm5CNHN3YllxZWVnUTBqMmZoWGQ1?=
 =?utf-8?B?aU12SjVwSkdwM09nMVpDZ29pc29wbUVPbEh0b3lkN0ZOWWF1RitoVUxvYnZR?=
 =?utf-8?B?dFRZNThmbUVGTXFaMzFWMWZjT0VLbFBmWUpzZmRwY1MybkFGN2gxUU9CY2du?=
 =?utf-8?B?Z3cyOGFEQjZFalViUXRoem9ZMnJGTjhQRXNDeHVpVE4rdlBYclpLS0ltQXhk?=
 =?utf-8?B?ZjM2MGhhbFdZTDREU1ZuMzJwZUxkejd0R3pPYzljY1ZhcW1UNFBxTVlrRlQ3?=
 =?utf-8?B?S3BwRzR0VnRPUU8xOTZ3UXl2ZmttZjhrUjZKWUdMWk5ZZWpHV3B0ZWZ6REIr?=
 =?utf-8?Q?r8ltQ/6rUrurfKN5f3gKyTWH2vMHyMhp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUpCNXAvcDQvUk8yVFJjWTc5dDBYRkdSV2pOeXVQSmpiY1ZTNWROcVpNZmU2?=
 =?utf-8?B?ckdZbEFHOWpHK01qa0ZpSG5LL1I2ZkRDaUdZRldaRDVlcDcyN1VSMkJGVjdy?=
 =?utf-8?B?c1AwOXVDa0JXcXM5YkpBZVNEOW0wVWVRdm1qUzI4dFRJeUU5eHVmSE9qWG90?=
 =?utf-8?B?Qzgrc285cURrRWt2T0I3R1BJbHJxOXpFblRlalBvT1RQOS9YSkZ0NWpKR2Y2?=
 =?utf-8?B?SHl2ak9RcmFYUFNsRVkxU3JzNVBEQXZOR1FuMEd6UTdLWDZHZ3FpKzFWRk1T?=
 =?utf-8?B?ZVVMdThwbzJTZk5XOGpJdzBuOGxoVnVESEZOQm9OQzdkRE1WVlJSZEVSQU12?=
 =?utf-8?B?cDViQWNRckJUbG5kVUJ4TGhtVXVHVTJOMGFxYURtbHN6R3Y1b3licWtSOERV?=
 =?utf-8?B?RnBmQUdzMytjSVcwM00vSzJsbGlHaC8zSmF0WkZHNjRBVlcyeVFXa2oyL0px?=
 =?utf-8?B?N3NtbjkyNWVPbWxTWk1WZkdiQWlXMStYbmpTUGZPWlByYVlHUDVFYy9yOXYz?=
 =?utf-8?B?TWUxcGVRbEJmZmU4S3lDQWZRZ1I0MG5uNFNrTkRiSzJ6T3FmRWlQa1M2OWI5?=
 =?utf-8?B?QWt4b3R4S2F5ZmltRUVXN3VOb2dHRmFlaU40V3F5NUhDOGNQOXpzSkVBTTA5?=
 =?utf-8?B?T20xdnd3ZDZSVnIvSkNtUmkwNXk2Wm9JaTJFSzJ6b211dUdJdU9YR1YxaThh?=
 =?utf-8?B?ODVrQllhczN0RE1ZMkxKenJjODZOSTJoK1c3UjZDcG80QVJ4RHZoYUhHMWZI?=
 =?utf-8?B?a3ByWjRpWUUzUVV0Tmd1eWlzb0tjQVhYUTlzT0pIa09jQU54RE9Kb0xHQXZR?=
 =?utf-8?B?T3htVnEzcmUyUlpnc0cyZDFyVDNnRzlxdEJDSFhweE8vdkY4VlkwdkM1UTRt?=
 =?utf-8?B?aTVRMXJLTFNOY1dJQW1weVNrTTA1L1g2SElNaDV0bkNHVVN4UFVpUFBhZDQx?=
 =?utf-8?B?bWc1YmtmOXNvdGdOMTJweklGK3IwM1dHYzZ6Yng1clowc1pCem9XZmRiaGlJ?=
 =?utf-8?B?c2hKd1NGMUpyaHZPUHAvNkl1OW1HMnJtcnU5SGdNL1habW5tRVBzZFNPdTNm?=
 =?utf-8?B?cE5wRnJkUE1KbG9YQVkyb01lTFhsL1RzS3FTTGh1eDRIdE9Ea0RDTHRZcWVF?=
 =?utf-8?B?Q2I0M2l3SXU5S2c2a3g3dnBUc0JHSXhKU21vWTljL2poUEorMDlXVDJZT1VZ?=
 =?utf-8?B?Wmp3UVpTbm8vOFZuYWMwV3p5NjhKdlVjUVBZdFl3Vk5CV0prN2QvVW5XTFdG?=
 =?utf-8?B?TmZaNE9LOVptamgyTFNwNjEraWVTM01QbkFiS2tGM2huUTRJRHNOSWpMUGZU?=
 =?utf-8?B?SUQ0TTRRU2ZVT2Z1THJPOWlDT2ZMWHlDRE1rWEtQRC9SMmJ4d29HK240VWkw?=
 =?utf-8?B?aVhJL2U4NlNod3NISXJTTm1zZXU4VnNKTEExd1AwMTV6eUEvbDNVdTV4cHMz?=
 =?utf-8?B?OWEyUkNudlpwenJBdHlQb0RobEk0TXphSlZhdlVGdEFvbHZVdDh1RjFNWlFY?=
 =?utf-8?B?cWxJdGRpNGc5dENxUHJ0ZlZDZkxmRjFCOGN5MXd3ZEpJNFBobWRTUHhGaEg5?=
 =?utf-8?B?eW0wODA0RDNOWWhpem02Qzl1U0VjNDZQYmFsYXQ2UndqS0VNbUNxNitZSktD?=
 =?utf-8?B?cnYrank2OXFrbXptY1FSaWNrSSswdXZVREhDb0EyZHNPeW5CMnlGREU4WXJr?=
 =?utf-8?B?dzV4M0lsMERldis4eU9TK0RMM1o4ZnBPSFppOXVabkIzM0NiT1VaUHdOaUl1?=
 =?utf-8?B?eGZoUHpYaEhZbjF1ek0zRGRoVVF1aXZ6bzFpc05HQmdmQU85OTgzNEFMckQ3?=
 =?utf-8?B?T0thWTA3UDdVK0xOKzFGUWlKMDlmOElQMmlqVmtwSTdQS3RhS0ErNzlidVR0?=
 =?utf-8?B?VFMwUjYzbU9SUjV5VHBTd2VlL1U5TGYzYkxtUFd5ZUs1K3IwU2ZDQW9naURu?=
 =?utf-8?B?SC9WZC9FU0RaUnBlYXBvdmE5enJaUVkrc2VaVUJ1ZVRxUDdYYkZuRTN0eWUy?=
 =?utf-8?B?ZEc1YTZFd0tXRldzRjdvd2tJRTZOVGllOGkvVHlmN1g5dUJGZTBSckpBcmU0?=
 =?utf-8?B?Uk9EOXhRWWZsVWsrTFVFWmtYdkl2ZnBvRmdNVXQxM203cDl5eFBqc2lhNEhZ?=
 =?utf-8?Q?U+bGTuAs7u2w32gewhCNJEEbK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEFB074AC56E614799E78B0E5F697A95@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d56c6c-a9bd-40ee-9b00-08dd4c0b3e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 08:48:52.9502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xK3EqF3NYk8gNTQrpXyCUev66ySGBeo2T+yf4cPzO2NyTJf9P2Wy/ONM7aXZFAW2imvmfJbNlT2t7izFXQ8VnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_004907_534014_FB6268D3 
X-CRM114-Status: GOOD (  17.13  )
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjM0ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIGEgbmV3
IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91dCB0aGUgZnVuY3Rpb25z
IHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0KPiBwcmVzZW50IG10a19o
ZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNpbmNlIHRoZSBwcm9iZSBm
bG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBhIGNvbW1vbg0KPiBwcm9i
ZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBkcml2ZXIncyAucHJvYmUo
KQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxpY2F0aW9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgfCAgMTEgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyAgICAgICAgfCA1NDIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgfCA0MjYgKysrKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5oIHwgMTg4
ICsrKysrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjMzIGluc2VydGlvbnMoKyksIDUzNSBkZWxl
dGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfY29tbW9uLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
DQo+IGluZGV4IGU0N2RlYmQ2MDYxOS4uOTk0YjQ4YjgyZDQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZw0KPiBAQCAtMzAsOSArMzAsMTggQEAgY29uZmlnIERSTV9NRURJQVRFS19E
UA0KPiAgICAgICAgIGhlbHANCj4gICAgICAgICAgIERSTS9LTVMgRGlzcGxheSBQb3J0IGRyaXZl
ciBmb3IgTWVkaWFUZWsgU29Dcy4NCj4gDQo+ICtjb25maWcgRFJNX01FRElBVEVLX0hETUlfQ09N
TU9ODQo+ICsgICAgICAgdHJpc3RhdGUNCj4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRF
Sw0KPiArICAgICAgIHNlbGVjdCBEUk1fRElTUExBWV9IRE1JX0hFTFBFUg0KPiArICAgICAgIHNl
bGVjdCBEUk1fRElTUExBWV9IRUxQRVINCj4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NP
REVDIGlmIFNORF9TT0MNCj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBNZWRpYVRlayBTb0Mg
SERNSSBjb21tb24gbGlicmFyeQ0KPiArDQo+ICBjb25maWcgRFJNX01FRElBVEVLX0hETUkNCj4g
ICAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsgU29DcyINCj4g
ICAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiAtICAgICAgIHNlbGVjdCBTTkRfU09D
X0hETUlfQ09ERUMgaWYgU05EX1NPQw0KPiArICAgICAgIHNlbGVjdCBEUk1fTUVESUFURUtfSERN
SV9DT01NT04NCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBEUk0vS01TIEhETUkgZHJpdmVy
IGZvciBNZWRpYXRlayBTb0NzDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gaW5kZXgg
NDNhZmQwYTI2ZDE0Li43OGNmMmQ0ZmM4NWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFr
ZWZpbGUNCj4gQEAgLTIxLDYgKzIxLDcgQEAgbWVkaWF0ZWstZHJtLXkgOj0gbXRrX2NydGMubyBc
DQo+IA0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFSykgKz0gbWVkaWF0ZWstZHJtLm8NCj4g
DQo+ICtvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUlfQ09NTU9OKSArPSBtdGtfaGRtaV9j
b21tb24ubw0KDQpUaGUgd2hvbGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCkJ1dCBtYWtlIGNv
bW1vbiBwYXJ0IHRvIGEgbW9kdWxlIGxvb2tzIGEgbGl0dGxlIGJpdCBtb3JlIG1vZHVsYXJpemVk
Lg0KTGV0IHRoaW5ncyB0byBiZSBzaW1wbGUsIEkgd291bGQgbGlrZSB0aGUgd2hvbGUgTWVkaWFU
ZWsgaGRtaSBkcml2ZXIgYmUgYSBzaW5nbGUgbW9kdWxlLg0KRm9yIE1lZGlhVGVrIGRybSBkcml2
ZXIsIGl0IGlzIGFscmVhZHkgYnJva2VuIHRvIG1lZGlhdGVrLWRybSwgaGRtaSwgZHAgbW9kdWxl
cy4NCk1heWJlIHNvbWVkYXkgZHNpIG9yIGRwaSB3b3VsZCBiZSBicm9rZW4gdG8gbW9kdWxlcy4N
ClNvIEkgd291bGQgbGlrZSBoZG1pIHRvIGJlIGEgc2luZ2xlIG1vZHVsZSB3aGljaCBpbmNsdWRl
IHYxLCB2MiBhbmQgY29tbW9uIHBhcnQuDQpJZiBzb21lZGF5IHdlIG5lZWQgdG8gb3B0aW1pemUg
Y29kZSBzaXplLCB0aGVuIHNlbmQgcGF0Y2ggdG8gYnJlYWsgaGRtaSBtb2R1bGUuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQo+ICBvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19jZWMu
bw0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfaGRtaS5vDQo+ICBv
YmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19oZG1pX2RkYy5vDQo+IA0KDQo=


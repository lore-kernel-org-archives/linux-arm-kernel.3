Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E504C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4Xj6y1d27mPiqL/E28x94K97YUSvoZOfgSskiXyzIs=; b=RFznLi2V8PmalIgIwX+O3xse37
	2MfiveSxshZmAQyrqiH2vc9/4HY3yKOixj3EMdabdCdhCff8wysMH5UECuQfK6T199lveFLhJW3CP
	39dXpHTbB0DzssGwQO6orxC8scLT+2MUVu57mxHEV3E9rUmFO58t/Pw2ETE9Gvt903yocRjn9sddW
	Ub9bBpQLSDrJBlECDuKRmzoULOQCOaMOwsxDjJG+x626kcrckNvalnhkGogKS8xUqHtgQa2uMdo5+
	NafI+zg2ZuGbBYMzsrivKEIx2y6oQX8GjqYScqDIusICFSmIsWyB6Frp0rTsvFhAZEHak+IsCrxF0
	WF5SUNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF1c-0000000EEti-0bKE;
	Fri, 24 Jan 2025 08:26:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEzy-0000000EEY7-2Ccq;
	Fri, 24 Jan 2025 08:25:07 +0000
X-UUID: b4277f52da2c11ef9048ed6ed365623b-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K4Xj6y1d27mPiqL/E28x94K97YUSvoZOfgSskiXyzIs=;
	b=CiE3CN3XhNNzaTzJhDupZGotRxJFxITV5OT/kNcxyYmCCDoKwNPBOCsjdRQgwkfSuwEoFTiMbBsyAxnSBJrsYJNlGpQvyOguJ0Dm3griVl1q+YW5kiyLrU8Ag6XMjOhioEbWelO43c6qKZfdOKLVHt7+I+v95Si2xmNY0QrzBlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ebd201de-1911-44b9-aaf6-80fc5584aee5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:13b0a87e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b4277f52da2c11ef9048ed6ed365623b-20250124
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1649507329; Fri, 24 Jan 2025 01:25:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 16:24:57 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 16:24:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8jZ77c3Lh8MzoLnHm8tqYu652eQ5zq6hFv9bT0JkvPdQKGvl1nREyAS3+w8txUdwf1owqxhuKBOWmCBZX+bl8NXE2qfdh19wzllNULZKfgsoxNUUPoP3nY/4U27Z3uOtqi5VfWiBq/y4RFqrKjlCFGjHUcg8XcD1ffZbkz9SfObn7T494/PK5IbPOAZijzmZQUgu/Y5GA5LIzODt1G1syA+Zp03fixcum0kaUfqvM1/9VeqtI3UMK9CbpFHxqcmnGDL0yF3RH7+IjRPPhm0WoG7MeSNxeVDtXslUx4T9kpUTZpkpTgPYnpdhIr4SrdlL32XZ/uM3WgwMW4U7Iix3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4Xj6y1d27mPiqL/E28x94K97YUSvoZOfgSskiXyzIs=;
 b=xX0n+WjpSAUPepQpgvYKcqQUrONg0CCdWcVJB2mFPT4tVJkTYxX5pmKPps1FUnc8URGa5NWL4S106ygJP1FsNS799VQVlZDcZpPx/3XsJAy1SKahLAJZ+jANQLlj7e+K1+bxj69WJizSoMJ5owX279V9/TdGuIqqU27isa9XXA2ype3mIozRnfE3BBiHihy5iqzZ3o0Pe0jSH0Pf8C8qr/C9NITj9/42UDwo/RSRwtm2kWVdiwveSmjA5k/WxF7LVJW8GZV48n/1EVzT3gTyOxRTvUTWoAv+zdzZW1VREowaNWZPVL4gmRO7FyCasPus1ze1TXH+cgLR/oUhoHqAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4Xj6y1d27mPiqL/E28x94K97YUSvoZOfgSskiXyzIs=;
 b=CMDTknmSBUQQChAvLVfBCogIuZzZKn/IZia+z1HwICqC/sbna1xTGa9HXTkRDEYgBHAu1QKC0Q/oU8GPxr7QRgRS/8lRREwA+ZgEJLKYp8y14snffY7tY/JHC/Un139zX/AviqCl8YcgIdbKXt4WqCstYRwCX+4lbdMug0XvjE8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7780.apcprd03.prod.outlook.com (2603:1096:101:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Fri, 24 Jan
 2025 08:24:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 08:24:54 +0000
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
Subject: Re: [PATCH v5 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in
 mtk_hdmi_dt_parse_pdata()
Thread-Topic: [PATCH v5 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in
 mtk_hdmi_dt_parse_pdata()
Thread-Index: AQHbZcr78IIgVvCqO02oR4xrP7ymW7Mlp0yA
Date: Fri, 24 Jan 2025 08:24:54 +0000
Message-ID: <cbbdc53ea47f0e7ea02fc7d197664819958ea2cd.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-21-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-21-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7780:EE_
x-ms-office365-filtering-correlation-id: 1139ef6f-23d7-4725-b7a8-08dd3c509493
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UGZpaVF0SjYxSTlwV1FMT0N1U2VzZFhPL25vUHc5cTNaR3V1ZGRienMrL29m?=
 =?utf-8?B?Z3VPV21TanhNd3lFZ0hVV0VueUwvZVZPQ0lzNGxCaDZ6dnZDbGI4OWNZYkRU?=
 =?utf-8?B?ZmVrUUt2eWVEVnBNbzdvK1BmUHR6WVdwUWE4bUJSbkh2c01rNFVyREE2U290?=
 =?utf-8?B?YUs2QWgxQ2tLOXFmLzA5N3VZdXN1bTBIZXl3YzdweERUbktpa2NIVGpBTTlo?=
 =?utf-8?B?aXV4bUl3YnhhbjVBQkJXeW5nQ0tlOC9JT1dOTkthdkl5b1QyMnFJR0dPWHYy?=
 =?utf-8?B?M2hsWHlURmNERG9XVEhEbVR2VjZRL1NrZUtnSDZkSVVoaXhreEFPejhMVlM3?=
 =?utf-8?B?NVdKQlNnV0dncG9zcmtNSTN2UVlkY040K0tpL2t0TiswRFZFQTVpMGQyUXVD?=
 =?utf-8?B?ZkxTUlF2bXpNU0Q2d1pSUVlWV2ZJa01nOHc5OUVwOHJpS3dLUlR0bEFzVm9h?=
 =?utf-8?B?cVpBUHcrcjRiR0trckhyWW5BeU9aTlZSZ3U3SXZ6WEJwU2oveUlORGdUU3Bl?=
 =?utf-8?B?KzlTNWNsK215alp4ME0zbThFdUN1cXRxL0JnVmN4M3J2WnljNFpRdkd4clZi?=
 =?utf-8?B?Z3lMVDc0QjdHd2E3a0FQb2ZvYzk3WEM1SThVMUJIRTkrQlpNKzg5T0E5NHZS?=
 =?utf-8?B?akVGZlR1TFBDb0s2cVEyK3FwekpQU2kycWJDZDdvakdqWHU4UGp6V21FRzg5?=
 =?utf-8?B?SGZnbkxjdzF4dXFCK2JyNEdyLzhhalVTQ3ZPd2FMaSs0WFBwcU5rbWpKYUZj?=
 =?utf-8?B?UThtdHZja0FQcXAwMnFOTzM1M2NHU3lxSDJiSFZMekZFM1VOYjdoNTc1Y0RL?=
 =?utf-8?B?cHlKYzNRYnhNeFZZOXZpR2lKYm9QWFNDc1NtbXVJWTBjaGVjeFFtdGNwRWhY?=
 =?utf-8?B?cGx1M00xQ0paWGN2anJtakloc2xyVDJIUGxnZVZ4N3ZlZndoSk5PbEJlMTVO?=
 =?utf-8?B?WE1VOFJRdkJpUWczc0Nmd3ZMazVBSWs4eXlyZGFORVdaamNYdkt1L2ZwdkVn?=
 =?utf-8?B?Vmgxc0pyMmhkMzhiM0xqczdJcHZReWVOZllNRDVaeTFpVmtadnh4MndnYzdS?=
 =?utf-8?B?QlhzM0lzeFpaSzlvTlZOekttZDlOanRrQ2k1Z2J1S2trUG4vQlR2R0pIM3Fq?=
 =?utf-8?B?YjBmZE1DcGRwMXVWN05qdCtWVE9HNlZSVWh6TnVUNmJYb0k3VWNDaU4rcFlh?=
 =?utf-8?B?WlUrMzg1aXBUWkY5OXNGbVNxbG1aOElHc0lLWitZd2FaZkxFVElnaXlMdzVo?=
 =?utf-8?B?eUwrYWJKdjZaaUxHVE80Ky8wQU5tLzNzWUFVZk1iNE1XSTBXZTFNVEFQVVJa?=
 =?utf-8?B?YTIvNDVmNW9Fa2VyeU92ME5qTUwzak44ZGJnMGhBMnQ4bGllRVZZcHAwZ1hZ?=
 =?utf-8?B?b0Q1blBMeFBXUkUreEtycW9lbHpyaHFGR3pjbENxdU9wamdoYTFqdkxOSmVq?=
 =?utf-8?B?MXU5Q3N2elJZUWFISmh2ckJxcTBBRDNGOVJkbkE5dkEwS2hxdGJTekpkZHVD?=
 =?utf-8?B?WUZtRThzcytKYU9uUEYwS003R1F3Y1Roek9JVDhNS1RxeVhnVmtaeXFCS1dP?=
 =?utf-8?B?Ym1WSHpQMzMrcDU5cmJETkdoSlcvUmVCeFhPeFl4amJSVkxVMzNweFJaNjEv?=
 =?utf-8?B?QjNlTHVzVlJUdDNCeEVXdWhGZUxNS2NkSWZaKzB5enZmWUlvYXZaRy9GQU1m?=
 =?utf-8?B?U1BtZzA0ZVlqTmlnRytQaVJlcElVR012Nk5SZGtuSDB0cVcvaEoveHI2eXdy?=
 =?utf-8?B?RXN0dE4wRjJXaVovKy9NRHlUb1ZUVVVVaTdCWHRpc2k3NDFIVUlOM3BVbVho?=
 =?utf-8?B?Yll1TW5Dc3RGalkzQVArc3NQRk9QZkllR25TdWpQWlhVUlUxYkYxaWpyanhn?=
 =?utf-8?B?ckZOVzk3bGhqZVR1UmE0ZHBqdlpkTlgrUXpHVmcyVFZKZGdQejBzYVlkdVdM?=
 =?utf-8?Q?eEpv5yrhKPTaf7qtP7JJd7BG80bbIPLO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTdhMTRqMUkvUld4RHBWZzdtcnd6M250RFJtK1BpRGQ2KzBycXAyNW9QUXI2?=
 =?utf-8?B?cm1uN21OMHhNU0w0eGhYSERnY1JYaUM1NnU3Mk1PYTRzTlRmcXVWLzIzMWJ4?=
 =?utf-8?B?RXdJMG1qN3BMRDlrdVlRQk5UOURCdG1zcjF2cUFhS1dGTHMrd0RXQTk2UXZa?=
 =?utf-8?B?OGt0dVl6bWVZdHZYWlR3d3lYQXhCMEJiUTQxMndYMHYzZHVjVWVIeURjWDZi?=
 =?utf-8?B?RTBLZmdWZ1l0YUZCMXM0Umt3Mll6cDJMSDBnZGw2UmU4ajR1eUdoNzF6aUJw?=
 =?utf-8?B?NUFLVWs3THBPQVVod0RwNk5IZFRnaHVNVGxRUndHQ2UzeFhKdmI1aWgza2xF?=
 =?utf-8?B?WTVUbFl3cWRhSVF5UGJsY0VEdmhvaTZkbVU2a0ZPbHhDS1pFenQzVklsdzBh?=
 =?utf-8?B?SzZZenhON1dyeTJZeG1rYXg2VmczaHRhQit2Y094NGZpYlFZQUFoL3N0VVVw?=
 =?utf-8?B?Q3d3NkZuSSs5VnFtY0R1QU1IMWdTNjliVVlGSGtpRktGbTFEckxxVjRNSGJP?=
 =?utf-8?B?NUVZTGF0eXJzOWdoN0xEV2hkMmIvTUZCU25Nc1VYYnhRYlJTTEVlcTBveDBF?=
 =?utf-8?B?WEtobXY5d3JHamIzbFNpLzV3ZXVkQS8rNmR4RGVTa0t2cWZjbmV4R2NaQVlt?=
 =?utf-8?B?MUpsZS9VWjRTYkFnSkxBTWRUbENtL1ZFa2c1UDlpT1M2UHVxa1NkWWUzQUpa?=
 =?utf-8?B?a2RQV01HMUNvczQ3OTNPQ0M5V084dElVTDhIVDVyVlhrRnJyS3hqT1ZPbGdY?=
 =?utf-8?B?RUtSVXJQeTZFMWFqR0UwclVzZ1FMYk82Mk50b1lvN0t2aDB3NTlJNzd0Tysy?=
 =?utf-8?B?ZU5IVXBXRTVBWUtMTnNCZCtubGlWT3pkVEFLTTdCMTREZ1ZMb2ZzR3phTGd0?=
 =?utf-8?B?N0p2VnJMTTJVZGtOQk90d0ZSamNkSXltTFRGWVdsSG05QzRCM1lDbWxLWnpU?=
 =?utf-8?B?TXRGNUpGVlhHaG5pQXBKRjlDODJSVmpaU3JENHBjY09RM3dOenZjR0haTHFI?=
 =?utf-8?B?NW5CYWRSOUk1VTBLaU42L0VPdzRZczJZc1BnQnVudEZ5S0FSSWliOXZNdjRB?=
 =?utf-8?B?WmhsWlhKdHRCRXRaV0FLdXhJd0lFRkFONFMzNEorR2xOcndXb280RUhrWVhI?=
 =?utf-8?B?Y0xZU1pTRGI4QTd4Z1hJVmhHYXQrOTNhOUxpRGxIODY2Yk0wU0pRZjJOVnli?=
 =?utf-8?B?N1RGb2M2WHlYblVnU0NJZUMxVnRIUENWY1JrVll2SE14b2VhYVFNOXlIQ3lH?=
 =?utf-8?B?RTFjVUJibFpDQmYzUTRZK25Pa0RRSWtlY3VBQVR0SXZ4NzdJUksxK0JPZVBr?=
 =?utf-8?B?RUk0Z0IrKzl5VzV6MitPaWkwbStuT25oWWZQdTFMWm5NTWJjUEtVSFk5U3c4?=
 =?utf-8?B?ODNFNkdJSWhxd3ZBMmJtcmh6Lzk5NzR6VVNOWk9pRmoyc1o1aDFUOGhEL2FM?=
 =?utf-8?B?UTNuZWxtVFdFYVpmYy84WmtpSjI2aE80RnE4Z3NGc0c0c0NkQkJiUlpWUFBJ?=
 =?utf-8?B?eW9kSDJ4N0IxYWpJNHBsM00ySnNMaEFmNGw1S3hwZUNLRHBnS0xZVGxTcFNP?=
 =?utf-8?B?MVBOaHJnWnpEU2RmVS9XajJaRktmWHBKMmNWblFrQnZOQ3ZLKzJpOUFOMjdJ?=
 =?utf-8?B?cUQxVU9nSWtiemJFZEcxVjYvSHBKUGJsclRGd0F5eUxaOTZjcnZvRW81RlJK?=
 =?utf-8?B?LzRzMTRXU3J6MFlxbjArODRyVnNFdUhLTlBSMjdOcjN3MHVycFArMFNXNlpr?=
 =?utf-8?B?K2h5cDROMVZDMmxBWGlCYzdGZVJ1cHZCWSszQllUQ09tWEIwOFZkVDJsQ0pZ?=
 =?utf-8?B?WHphVUNJaHpiem1BWGFXZS9LMGZuVUkwZ0JQU1Q1MlBWZUxTZEtJdEgvdm9K?=
 =?utf-8?B?Z3BtSVBJb3c0UURlN3NQYXBKNmxZbnYvbGwzU0RJNlFmTnFqb0tGZlN5NFhP?=
 =?utf-8?B?R3dkZnh5ZHd4SXRyZzNwRllnMnRBVjBUUnFvZW1HSkRMSDBWU0Urdnlwa096?=
 =?utf-8?B?aE9JdjVQNSs0YmZBWDZhNW85clVyVzdaaWZ2ZDlxMGU3ck1leFdyUWFuWVlt?=
 =?utf-8?B?WEVKVHBtdmZKV1dBdG9zd25lalZPSzZOVGdVSzZnUC9JbzRGQXRWZ080bkYy?=
 =?utf-8?Q?zbPZei9Rgt1xtpjdap5CI26Rn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6B20AA988C57B4E9BCB2E30354A5BBD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1139ef6f-23d7-4725-b7a8-08dd3c509493
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 08:24:54.3882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxUGi3fyh2Oqi0HWQvswg6rHTFiU0hGmXpAD5tCK0QjJ61E4FS95NnD9KdSGuiCQ/cvq4UlvXhlOoTSqXtAxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_002506_608250_B6CA5D6A 
X-CRM114-Status: GOOD (  20.74  )
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
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBDaGFuZ2UgZXJyb3IgcHJp
bnRzIHRvIHVzZSBkZXZfZXJyX3Byb2JlKCkgaW5zdGVhZCBvZiBkZXZfZXJyKCkNCj4gd2hlcmUg
cG9zc2libGUgaW4gZnVuY3Rpb24gbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoKSwgdXNlZCBvbmx5
DQo+IGR1cmluZyBkZXZpY2UgcHJvYmUuDQo+IFdoaWxlIGF0IGl0LCBhbHNvIGJlYXV0aWZ5IHNv
bWUgcHJpbnRzLg0KDQpJIHRoaW5rIHlvdSBoYXZlIGRvIHR3byB0aGluZ3MuDQpUaGUgZmlyc3Qg
b25lIGlzICJVc2UgZGV2X2Vycl9wcm9iZSgpIGluIG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKCki
IGFzIHRoZSB0aXRsZSBzYXlzLg0KVGhlIHNlY29uZCBvbmUgaXMgImJlYXV0aWZ5IHNvbWUgcHJp
bnRzIi4NCg0KVGhlIHRpdGxlIGRvZXMgbm90IG1lbnRpb24gdGhlIHNlY29uZCBvbmUsIHNvIEkg
dGhpbmsgdGhlIHNlY29uZCBvbmUgaXMgbm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4NCllvdSB0
aGluayBzb21lIHJlZmluZW1lbnQgaXMgbm90IHdvcnRoIHRvIGJlIGEgcGF0Y2guDQpJZiBpdCdz
IG5vdCB3b3J0aCwgbWF5YmUgd2Ugc2hvdWxkIGtlZXAgdGhlbSBhcyB0aGV5IGFyZS4NCk9yIHlv
dSBjb3VsZCBjb2xsZWN0IGFsbCByZWZpbmVtZW50IGludG8gb25lIHJlZmluZW1lbnQgcGF0Y2gs
IGFuZCB0aGlzIHdvdWxkIGxvb2tzIHdvcnRoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyB8IDM0ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCA2NWU5NjI5YjZiNzcuLjQ4YzM3Mjk0
ZGNiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTEzNzIs
MzAgKzEzNzIsMjMgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWksDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2Rl
Ow0KPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2VjX25wLCAqcmVtb3RlLCAqaTJjX25w
Ow0KPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlLCAqaTJjX25wOw0KPiAgICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmNlY19wZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gICAgICAgICByZXQgPSBt
dGtfaGRtaV9nZXRfYWxsX2NsayhoZG1pLCBucCk7DQo+IC0gICAgICAgaWYgKHJldCkgew0KPiAt
ICAgICAgICAgICAgICAgaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQ0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgY2xvY2tzOiAlZFxuIiwgcmV0
KTsNCj4gLQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLSAgICAgICB9DQo+ICsg
ICAgICAgaWYgKHJldCkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgcmV0LCAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOw0KPiANCj4gICAgICAgICAvKiBUaGUg
Q0VDIG1vZHVsZSBoYW5kbGVzIEhETUkgaG90cGx1ZyBkZXRlY3Rpb24gKi8NCj4gICAgICAgICBj
ZWNfbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChucC0+cGFyZW50LCAibWVkaWF0ZWssbXQ4
MTczLWNlYyIpOw0KPiAtICAgICAgIGlmICghY2VjX25wKSB7DQo+IC0gICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBmaW5kIENFQyBub2RlXG4iKTsNCj4gLSAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiAtICAgICAgIH0NCj4gKyAgICAgICBpZiAoIWNlY19ucCkN
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkZh
aWxlZCB0byBmaW5kIENFQyBub2RlXG4iKTsNCj4gDQo+ICAgICAgICAgY2VjX3BkZXYgPSBvZl9m
aW5kX2RldmljZV9ieV9ub2RlKGNlY19ucCk7DQo+ICAgICAgICAgaWYgKCFjZWNfcGRldikgew0K
PiAtICAgICAgICAgICAgICAgZGV2X2VycihoZG1pLT5kZXYsICJXYWl0aW5nIGZvciBDRUMgZGV2
aWNlICVwT0ZcbiIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNlY19ucCk7DQo+ICsgICAg
ICAgICAgICAgICBkZXZfZXJyKGhkbWktPmRldiwgIldhaXRpbmcgZm9yIENFQyBkZXZpY2UgJXBP
RlxuIiwgY2VjX25wKTsNCj4gICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGNlY19ucCk7DQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gICAgICAgICB9DQo+IEBA
IC0xNDEzLDkgKzE0MDYsOCBAQCBzdGF0aWMgaW50IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0
cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gICAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpDQo+ICAg
ICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJlZ21hcCk7DQo+ICAgICAgICAgaWYgKHJldCkg
ew0KPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICJGYWlsZWQgdG8gZ2V0IHN5c3RlbSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyczogJWRcbiIs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCk7DQo+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyX3Byb2JlKGRldiwgcmV0LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFp
bGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiByZWdpc3RlcnNcbiIpOw0KPiAgICAgICAg
ICAgICAgICAgZ290byBwdXRfZGV2aWNlOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBoZG1pLT5z
eXNfcmVnbWFwID0gcmVnbWFwOw0KPiBAQCAtMTQ0MywyMCArMTQzNSwxNiBAQCBzdGF0aWMgaW50
IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gICAgICAg
ICB9DQo+IA0KPiAgICAgICAgIGkyY19ucCA9IG9mX3BhcnNlX3BoYW5kbGUocmVtb3RlLCAiZGRj
LWkyYy1idXMiLCAwKTsNCj4gKyAgICAgICBvZl9ub2RlX3B1dChyZW1vdGUpOw0KPiAgICAgICAg
IGlmICghaTJjX25wKSB7DQo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBmaW5kIGRkYy1pMmMtYnVzIG5vZGUgaW4gJXBPRlxuIiwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3RlKTsNCj4gLSAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7DQo+
IC0gICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPiArICAgICAgICAgICAgICAgcmV0ID0g
ZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJObyBkZGMtaTJjLWJ1cyBpbiBjb25uZWN0b3Jc
biIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNlOw0KPiAgICAgICAgIH0NCj4g
LSAgICAgICBvZl9ub2RlX3B1dChyZW1vdGUpOw0KPiANCj4gICAgICAgICBoZG1pLT5kZGNfYWRw
dCA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShpMmNfbnApOw0KPiAgICAgICAgIG9mX25v
ZGVfcHV0KGkyY19ucCk7DQo+ICAgICAgICAgaWYgKCFoZG1pLT5kZGNfYWRwdCkgew0KPiAtICAg
ICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlciBi
eSBub2RlXG4iKTsNCj4gLSAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ICsgICAgICAg
ICAgICAgICByZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkZhaWxlZCB0byBnZXQg
ZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVcbiIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBwdXRf
ZGV2aWNlOw0KPiAgICAgICAgIH0NCj4gDQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K


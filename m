Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90C7C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 06:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcyeljmEppIwwjgYxlMsRcgWzevTogzxaCXBzmIcFlg=; b=1MqGYmKR4ZsyXqD/m7b5qO0In+
	RJTlmNc6MIkNzwr/rfTduAZHuHuyrnHH+EbYDlw2se1KOHrzCMwpkwzi14Rp/hzgNvvn0cL/wk6RU
	5oSu/FbLbZRFxNnLKyxoZEHoxK/NuuJevYLjNzyjnsvJ4MEZI2lQRMBTVS5o8yxLFbyReUbyjogFZ
	M9Hup2rXRSsKTaNCZTMljRhn6Q/VZnMYL1fa7/eJDb2anceizd1RUou/MXm4gLRpF6g46MiQ4zG/y
	u6dpPk5sMLIYf7dM2xA0qjBtZ5cc3iTIDKPyCm+lX+qtoqNV6Q0hZXdvRpG6vwHJ8Cb4yq8q5z/D9
	ClYbK3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX1n-00000006Rtz-3DOs;
	Thu, 27 Feb 2025 06:05:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWyA-00000006RBw-0vOa;
	Thu, 27 Feb 2025 06:02:03 +0000
X-UUID: 5ad681c8f4d011ef83f2a1c9db70dae0-20250226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HcyeljmEppIwwjgYxlMsRcgWzevTogzxaCXBzmIcFlg=;
	b=JcHJRFvyyhIbK/9VGESzrNOcTW+Wok3rJ15F2gvAL9VEikgGw9FYnzaHKYNnR8lF9o2jKXChhKseVUUmTheU6W0nabglfOtRzPmp42wl9pN++KyhwBhL9NvfWvR3HCfaV041mjlydyKy2O/o3XuM6yPYGqCZ7DlOwvgL62Vkna4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ac855d9d-e168-4303-980d-7973a93ff1d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cea9fbd9-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ad681c8f4d011ef83f2a1c9db70dae0-20250226
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 922367522; Wed, 26 Feb 2025 23:01:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 27 Feb 2025 14:01:55 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 27 Feb 2025 14:01:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa5bZ0MKf1goStEyJNAPq1k1DJhUXAUfMx8BqoGhGnyvUYShf+87tqCJjH0yqBY/3op1Cy0zz/gWRIw8HSkBkd+Nv8eAFrb+79a7Sl7q6RrJHFOKoTHBv69XVsVXfYAd6dxb6VqyFmQZr7XtqmeqLfrbsYvx8fCMyvho7XM8OjURvgz9N6rH7VtjnfS4ZV9nNEcP3SIgR0KRbLDqmJ7iWiYtt0+wKrYwowkC3OYsWLAo56UKBiYm+ANbgLjaCHNkEqKsIzGA9/uqhXMAwhrHk9pcLqqqNJUDAa8FvqSaTV/z7chw5k37ilxDNP9tt7JcC5+dWLLhRi9H6Xd7TzlGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcyeljmEppIwwjgYxlMsRcgWzevTogzxaCXBzmIcFlg=;
 b=dnRSyyQfeE89OoKfg1BskeG+kg2Xlp2oPNdfyFr+crYZzQWOcuFJ7PDH6XywuSphkjodf+o46pGPNOGT6XQh9oEr1KBfPsdPla9qypraM+UYQ8U0P4c4HxdqZvzPJkjbXHwF0+zJOWxzWVBxpnG5rSqxBZxtTI0DtS8KxLWoCtAFd9UEVUq70iDNRjxt2dRnOovJxduCgAXkvurQph9XM6G1ka9AT0yku17zPAepet6NAxqUSbXgxhgAv3t7jn+u6IkHBkNrThaGAgI15MU5HD5+ONTmJu4fnRiq2uGi2KX+9q2ShRIE/TljSlJ2heEHdPkKxEO4+sfpuneYTWUZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcyeljmEppIwwjgYxlMsRcgWzevTogzxaCXBzmIcFlg=;
 b=Q+tjAk5p7D2rIMjf90/lrkGAf6BuS9R60DjCi9IV+7oMaKjqpC2RVxnd06s4tOqr5m+KNdQOeRed5SzoJmKsg/RA3kr0bCjM8uvix2/h5JIZ/ncRr5jNA36hSmWB4UXYKm1uEPOXzWxmjp152zxG7qY0LB09RtZunqbIKfChmZI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYUPR03MB7231.apcprd03.prod.outlook.com (2603:1096:400:357::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 06:01:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 06:01:52 +0000
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
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v7 43/43] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH v7 43/43] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbgVPVc8zt8n/fcUamx3m2jtHrlrNat4iA
Date: Thu, 27 Feb 2025 06:01:52 +0000
Message-ID: <94d5ce1f146c00411fa0d57724af9d050eb09393.camel@mediatek.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
	 <20250217154836.108895-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-44-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYUPR03MB7231:EE_
x-ms-office365-filtering-correlation-id: 20b3d8b5-1826-42f8-90e4-08dd56f43b72
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDQ0SHA1WUZDV1Rhb3ZDajV5d1VGdytucW04L1prNkU4N2FVRWpxRW9QV3Z6?=
 =?utf-8?B?cnoyN080NEh3NlI2c1hKeTF0UlZsek5FNVlHUVMrVHBFTVNzYTYveERiVHFr?=
 =?utf-8?B?VDRlUzYyVTNrUG5sY2RmZUxsUncvRmFpM3lEdmZkMnpWM0Zteit6Sm5WQjh6?=
 =?utf-8?B?ZjVzQmNJemFBUGdna0RNajRYVDhaYk93aGs3L1UvcDEzTzFyYlJISW8yR1ND?=
 =?utf-8?B?dlZYZXh2STU2MkdoRG1JV1lISnBhVjA4RTBpUXNLaHpGbzZpcGVJTGo3NzZu?=
 =?utf-8?B?MnlTeHNROEp0MjdOVDk4SUdBVWNYQjRVRUFTVnVZbFBubmhsbklyRXpZVFdp?=
 =?utf-8?B?eU5UazhhTk9DS1VBTWtVd0RneVA5TS92ZHlVWkVPdHNsT3M2RURNZ2ZzanVx?=
 =?utf-8?B?OUxWT3AvODJoYXVvbmRqNlF0UG96Sm1ZbjFZOWVTZXI5dCtoTWg0ZFZzMlJR?=
 =?utf-8?B?dzBIWWp2cUo4SFg1ejlHdC9mU3dVcis5bTRNWnhlWC83Rk1BdFNjbkM1ZFVD?=
 =?utf-8?B?cDZuSzIyL1lKem5IcFl3aGZISXkveXBDd2NIdjFhaFhEbGhNNkRvYzdYMU5q?=
 =?utf-8?B?UlgzNTNaWEEzdnYrVlQ1dXNSbThFdW11RVZJMFgwK3hsc1l5UHJlbDZXYzY2?=
 =?utf-8?B?d1JYVnFXTTZ6dSt0bjIyNVZyTEhlSnpZd1E0d1dYZlJ6NU5pblViK2JkR2ND?=
 =?utf-8?B?Si9RaGlZdUkrUGhqUjFwckM1RVNhcGZwaFgvWlVaQUJQVzg3NTRhZHZYdWtM?=
 =?utf-8?B?WjF2QVpXQ0sxdms0NVVZTTdjTFJsTHVlb1dvWFBWZXRPZUR3Z1NJbXlpZCtF?=
 =?utf-8?B?d1NGWXlTdjZNS1p4Vy9RMFlGS0IySEx0eDZiY3c5dU1CUlRMNEVRSEc1eHlW?=
 =?utf-8?B?QVg1TGVVeXp5ZXNaMVNhQ2E1VEVhMzh4cXZuQk5LZnphZHJzb25ZZXBqWEIw?=
 =?utf-8?B?bWp2bzJmbW5nbTlrNEZHcm1pVU9TenVMRHM2V2dKcDZUZktSeHA2c2c5VDls?=
 =?utf-8?B?ZkgvRXQ0MEFYajRwQWxxMGZ6dis2Um1XUk1aSk1TVWpnaDFzTlg2dWMyS0hX?=
 =?utf-8?B?SkRXTytsVUJDYjZRMXhuRVFRNG0wLzEramJyMkMzZmZlUDUyYWhrRUlpeFps?=
 =?utf-8?B?Qi9RWmoyOTd5SmgxOGdwZG9UenVNTjJCbkdZR1ozSDhwaVZkcE5JdFY0TExM?=
 =?utf-8?B?VXI5MW1YSTBVeGRHT2RqVThiVUZXVTZ5UCtIRW9sRTBrSmpqWVJwei9rVXRM?=
 =?utf-8?B?ei93YURteEg4cElkUVlQN3JkTnNxd2NrTG96dG9xcFBtK3ZBaWxTakJXYXRv?=
 =?utf-8?B?MnpxNHk2QkVveE9OdVpWQVk0VVZoaDFSb3l0Z3czU05HcDJFcmpjenVWclJU?=
 =?utf-8?B?eWJqTXpvVGVxbjRPT2FVZVFQRVFMa1VkNGhZd1krZVdVeGNRQytWbndXa0k5?=
 =?utf-8?B?WmRxR09jRFBadTBmY1F4ZUVvTk8xZFRFNklONm5MbEx4anRVeTczN2V6WDNH?=
 =?utf-8?B?c1YxOUV0VmNiOExLU1g4TlVJQll3Y0UwWWVDOFlKcytJblhYMW5FL0JOTG9W?=
 =?utf-8?B?WUhkZ2xPek5GYm9jUDV0Z0Y3Z1V6bW43bHM3dWhLWU9FQUhPM29WVnREQXQ1?=
 =?utf-8?B?ZWE1RWM3dzh5eXhybnJMeEpSM2FDS3grSWljeTlrQlhjbmowcTNHOUw4Zk1H?=
 =?utf-8?B?dFlvNFZBOW5KZ1pwelA1UDl1YzhJR1N0ZGs5ZmcyTmRtNm8rODlDVk9wUk5T?=
 =?utf-8?B?aXl1eDNRRWljcnZ5MjRXQzNRRDVZTzdLWENLMFUwWDJnaGhBSGtiQnhXcGNs?=
 =?utf-8?B?TGFZcDJNSnV1Q1NXZjFnVStJdUtoVWJzQUJDRGM2c3VMQ3pZendNazRGd0tW?=
 =?utf-8?B?TDNWd29PbmtlVjdpNTJLNzl6TW1qMXdKdklHRldPT1VPUTVqR2hGaWZXQUVD?=
 =?utf-8?Q?jVX2eX8/ueGkEE4GAMymMYpuxStl/rgF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHRySWFSeWVGUmdoVXpXZHNqYmlaN0hWQkthSDZnVkEzZWNPQzJTNC91ak1r?=
 =?utf-8?B?THE2c09WTVEwc2x6SVh2QmJIaWNVbDEybXNtcnBmOWRHVzkxeE05STlLeExG?=
 =?utf-8?B?QnREcFlkNXVzZVBobmhpMXJaTkZuSU9KRFgzSG1LelZ0S2Y5UWtxSEZWQXNk?=
 =?utf-8?B?bE9zVGlnOXhSUXFQWXY2em1KUGo4ZkhRTWQ5SDMxVkVYaE9GOEJiaUI0Qm9y?=
 =?utf-8?B?K3p1M09LTlZsMFBScEtQbWFsODlEQVY2SmNXNmpCRkN1TXZsMmhyN1NjcW53?=
 =?utf-8?B?Qk9BRkZVekRwdVJQaXdQcUhOaHdkWlhUSU93dXJCbnBlYnFwRmY5TGVJc29t?=
 =?utf-8?B?TGw0c1gyRy9kUk9EckJpQUxBa0FKZEtOQk1ibldUamRQeWlSM0EzMXRSNDB5?=
 =?utf-8?B?RXpBT1NBZUpMQVUvR3E1bnF5akFLRld3OUEzTEl6amtxNDFDNTl4ZG5IdU0w?=
 =?utf-8?B?Y3EvaEE5bXc4ZmhyUm1OcGU0VjIzWVIzL25DcCtaMDN5N2xibHJPT3hRV2k0?=
 =?utf-8?B?d0I2UVRXOXJpMFdrMzJYL2I0YTlVNGJkWVlsL05rNjN1OE1OR2E5SU1McTkw?=
 =?utf-8?B?QlRlTFloOFJQK2o3Uk5IOFBFRUIvSlhXT0lDcWQ4eTVxTUZ2RFZXcDRNN2M4?=
 =?utf-8?B?elNMTXphbHZMem9VZEF4S3l2em5Tb1pxaU0yb3QyUWtpV054d3JPZVpseFRu?=
 =?utf-8?B?aU9yS2hNWFQ5Um4xejYzMnJlbnJvOHdlcEx1MXFUWWltbnZIZCtUV3JTV1dX?=
 =?utf-8?B?OUFMYlNXK0FSdGhLcU1ab2ZHZm93aTJGaDI0a2NIZ1hmRzZKSlQwMHI1SFlv?=
 =?utf-8?B?eEdlWkNtWDNvS1RwRlRzdDlBYU1jTWFCMXJmanBCRnh1cjhZMW83TWtQK2Fv?=
 =?utf-8?B?WUtrdHNNQUViUW93Y2ZDVm5NaG45TFVUYVZuSWVrME5SUDZ4T2pZd0Y3Y3kv?=
 =?utf-8?B?WVptODV6Y0tQWEN4eTFTTW1ad2NpZUNPa3RlK3JocWR4bGFlcktZOXV6eFpk?=
 =?utf-8?B?eHYrQm56Q1hHY2ZseXFnU2VvL2FwNVRPTGJ3bmJiUlJSYnJVdTZtMzJHZjJ5?=
 =?utf-8?B?Vkxod3NKNlM4c2FsV2hacFRyb2lLMFd5dGd3OUVPYnFvMDRhVGcwT2d2clE1?=
 =?utf-8?B?Tm5KMjVlWktYcFZRaC9ZaEkvUFhmYzN5UmVXSHpPaVlYTjJuQ2dodXBCaHQ1?=
 =?utf-8?B?cllCemdyT2E5NGNuK1N5WWlkYlQwTHJ6dFVEeHcxQ2lhSlp5K2FBS3QzTy9O?=
 =?utf-8?B?Mk1lMUgwZGhTdUEwN2xHVjdiSko2UXVZNm1YWjVTbmU2dU5yc1hHZDI3S2tC?=
 =?utf-8?B?eDhvQUhwTUxBVi9HOUM4cEpXVWdESlpmMnY5TzhQb3d1SXFkampTQm5lZ3lq?=
 =?utf-8?B?Y045NEViek54WmlPTklJdEJJaENzOVlGenk2bnlvSVVLN0Myb3NkVVNBeUdB?=
 =?utf-8?B?WU5GYXl5RjU2M3JuZ2QxeWY2Z2VlZmxnRzNpaEZNN3FwbXFLV2J1ZS9rWE5s?=
 =?utf-8?B?VHByQ0RScTR5K0pVa2lLY0syNzZTYVJWbURXTERBRG1PUzhhSDhXTnZGTzI0?=
 =?utf-8?B?VTV1MkQvUkxJQXFyY25MY1Q0Y0l3Mm9JN1VSa1QwekRuL0RLK1gxWE1HVzNH?=
 =?utf-8?B?YlA5dmhLeGlxL2x2bWJHYTArUzNNamkwZzNwYUxMbEhDZTRvY3BiSXZXRWJN?=
 =?utf-8?B?UzlFaFBtYjkwNmVPUVQxbng1L1VRY2ZLdjRMaGQ0MFVxdk9vaGk3OElVR2FU?=
 =?utf-8?B?VFZlcytKSDdnejREYjU5VFZBbzh2VXMzSGtiRkJaNmVUek1jVjBWeTZtS2xv?=
 =?utf-8?B?UjRvZGpwWWVqZDFzU0RYMFJiK0lkbzdOdHBMbWNkLzFRR00zSHd2dFBGTFZD?=
 =?utf-8?B?Q09UNlg4T0V5NUlDSjBVaHhYY1hPVldaYWQzYkpNQlZwU0tRVUdWVWhTcHFM?=
 =?utf-8?B?RWI0cHhVTmpxTzlGRWxXUHpkV3RIVnJ2TGp6NHhKaGhxOHVjRmx5Mk1RcTY1?=
 =?utf-8?B?NDYvNnNCMlNpa284Q1dqakRVaG9BaGpGNUNsaFV1L2REaytERTRCdENHZ2VL?=
 =?utf-8?B?bGdXRmJIZTkrdS84WmVyY2pSSWh2cytub1d0Q0I3dStDQThZdGN1dko2NXNn?=
 =?utf-8?Q?CTLXZWr3Rsc7JHzlZmiHfwBAo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3393934A665E449B0E96AFA429F0A25@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b3d8b5-1826-42f8-90e4-08dd56f43b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 06:01:52.5596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loqJ+s2xhe3NcHokNN+0l2Gv4tVUy/gPtJxHm87bYcIEE1G12z9sWZSSjyL4hY1/Iy9wP1F4FQ6j15K3vFrp8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220202_266915_1710A836 
X-CRM114-Status: GOOD (  12.21  )
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

T24gTW9uLCAyMDI1LTAyLTE3IGF0IDE2OjQ4ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBVc2Ugc3lzY29uX3JlZ21hcF9sb29r
dXBfYnlfcGhhbmRsZV9hcmdzKCkgd2hpY2ggaXMgYSB3cmFwcGVyIG92ZXINCj4gc3lzY29uX3Jl
Z21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVkIHdpdGggZ2V0dGluZyB0aGUgc3lzY29u
DQo+IGFyZ3VtZW50LiAgRXhjZXB0IHNpbXBsZXIgY29kZSB0aGlzIGFubm90YXRlcyB3aXRoaW4g
b25lIGxpbmUgdGhhdCBnaXZlbg0KPiBwaGFuZGxlIGhhcyBhcmd1bWVudHMsIHNvIGdyZXBwaW5n
IGZvciBjb2RlIHdvdWxkIGJlIGVhc2llci4NCj4gDQo+IFRoZXJlIGlzIGFsc28gbm8gcmVhbCBi
ZW5lZml0IGluIHByaW50aW5nIGVycm9ycyBvbiBtaXNzaW5nIHN5c2Nvbg0KPiBhcmd1bWVudCwg
YmVjYXVzZSB0aGlzIGlzIGRvbmUganVzdCB0b28gbGF0ZTogcnVudGltZSBjaGVjayBvbg0KPiBz
dGF0aWMvYnVpbGQtdGltZSBkYXRhLiAgRHRzY2hlbWEgYW5kIERldmljZXRyZWUgYmluZGluZ3Mg
b2ZmZXIgdGhlDQo+IHN0YXRpYy9idWlsZC10aW1lIGNoZWNrIGZvciB0aGlzIGFscmVhZHkuDQoN
Ckkgd291bGQgYXBwbHkgYnVnLWZpeCwgY2xlYW51cCwgYW5kIHJlZmluZW1lbnQgcGF0Y2hlcyBm
aXJzdCBhbmQgdGhlbiBhcHBseSB2MiByZWxhdGVkIHBhdGNoZXMuDQpTbyBidWctZml4LCBjbGVh
bnVwLCBhbmQgcmVmaW5lbWVudCBwYXRjaGVzIGNvdWxkIGJlIGJhY2twb3J0ZWQgdG8gb2xkIHZl
cnNpb24gYnJhbmNoIHdpdGhvdXQgYW55IHYyIHJlbGF0ZWQgcGF0Y2hlcy4NCldoZW4gSSBhcHBs
eSB0aGlzIHBhdGNoLCBjb25mbGljdHMgaGFwcGVuLg0KUGxlYXNlIHJlYmFzZSB0aGlzIHNlcmll
cyBvbnRvIG1lZGlhdGVrLWRybS1uZXh0LCBhbmQgYXBwbHkgdGhpcyBwYXRjaCBiZWZvcmUgdjIg
cmVsYXRlZCBwYXRjaGVzLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBb
QW5nZWxvOiBSZWJhc2VkIG92ZXIgSERNSXYyL0REQ3YyIHNlcmllcyBjbGVhbnVwc10NCj4gUmV2
aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+DQo+IC0tLQ0KDQo=


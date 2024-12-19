Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xZ6WK15b3M+Hqj6bydNDR7Q5xbmuwhhk557ym6hkRA=; b=1k/3rCDVlBT0d7dKOsOQkSgNZo
	U4J2WooQ+CDTLsbMu6nPQGIvfcvhiwFUZtfGaDaGRmq8m3iJL71t7yK5acNRDcK4o/J0NRdNVsQz/
	7hplxGro3NdqEbQLA+Zgtj7GzUFk4guMXZs2cCzqSDLQaWT7WLoHjzrMkNMZh6VukAAHIoHd/dkjf
	rV30mdDcb9Bf52UwRPpd9IT2hWq0sfmx3TlUzc45lOZ9U+VbkEQLjkDDMzjZpZ4QXEtJsyj3IzqFj
	RCZCnKCryFZUEubpJlmIa8nIdhUdfuAeC/rCDXWkdQqZsqdK9pPVBw71EsfTSlBEuud+OMbluYiej
	0wCSKlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBqO-00000001Gri-2a03;
	Thu, 19 Dec 2024 08:25:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOArl-000000014OF-0xoe;
	Thu, 19 Dec 2024 07:22:38 +0000
X-UUID: 03d5f782bdda11ef9048ed6ed365623b-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/xZ6WK15b3M+Hqj6bydNDR7Q5xbmuwhhk557ym6hkRA=;
	b=Q1BVCAkPrq+VdTJO2++uiOXAoIBZHkCZ8A2G5u4LfJAmsanA7muXk5GXr2/JVl4kgrybYHNDv5Fiy4qCy6VqDhRCtOrPM8kKmGldrok5W2x/86jD8OOYkK7AttRFnCl2wAVKDfZixlBacF6C7qXUmllv5yvkFxnaPcvEMF0Ijv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:06a938b9-914d-49cd-967d-57f0df93852f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:50a66113-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 03d5f782bdda11ef9048ed6ed365623b-20241219
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 774321382; Thu, 19 Dec 2024 00:22:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Dec 2024 15:22:30 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Dec 2024 15:22:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czc/WRrNNFux5iWohG8ODEBiGa0uNCnDEzg5WzgucGeCyEDE1dxj9CL+Uqk9tc6SBAx9sJqnKtFQ0KxgSfMgc+adM7XIh7IvEFp+POSNGHYGgjJS1KmvUL21rPgFTBtbLVRZkdzbC8ktNHOdWE0fwKrVHQ4zGdCsGwPyl/wgdcD3SdIME6L7HpKOevaHupp266py1z/5sbsu3Q08LBJcSfb21OxVb8f8q55Eqfc+EguabI5PmvT4ykDUN3pBeYZmiLgwriuLStlgGqfAuZIAU+bqcNKyt/FjneAPWYexPLkgrcMxs9Mal4RRYF/y027I7C72Pziycz8aic+g4Y8+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xZ6WK15b3M+Hqj6bydNDR7Q5xbmuwhhk557ym6hkRA=;
 b=F/dZx47YagyaZ1wIqmZKhNNdiGqiwUtO8x4y29RGyUM/3i2fcGO1VmhfgWgwD9PAaYHGLoo4dYyud91u3ekzRHmGhshiXInS32TnfuKGRTVrJr+ntJ2AVpba78K6/gyrJF36Lj2zlZHB3tqqLZYqP9+Yck0MLq117NpB2dJvmZpU9VNNfZaRBWRlsQUgn+LNk/og1bcgwk9T2jakr5jI4e6VDzFEuoiw17D+qaYgDAoFGcbpTycfQjU/TI6VTXjykAOh4KK0RPB9rdoywZ4RuOaPfU9DW2U3t5gyylgz7SKVruic9a8nb3GoduD8v21sjkZJYQ9/AED6j+1FGVt0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xZ6WK15b3M+Hqj6bydNDR7Q5xbmuwhhk557ym6hkRA=;
 b=ZypCtJBUJd01JME9HKXRdf3lGR5gmdNHM864Stn0asU7nfYavgydrtdpiQ8YrKGZXdA6U74eeEDyWURcoWtnc+0dtcvBSjRD7Py9jQLCo3sOPhh+v1zE918BO6CGReZDND0XS68k3JIk4Py99W25hSs8DzGWsUgb0IkFiiTCMw8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8568.apcprd03.prod.outlook.com (2603:1096:101:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 07:22:28 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 07:22:28 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Topic: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Index: AQHbUJqxk+jnkyq2NEGqPZrAKSlOo7LtLE2A
Date: Thu, 19 Dec 2024 07:22:27 +0000
Message-ID: <745f02d04c4a7080cee094b91c5338d9d25fbdb7.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8568:EE_
x-ms-office365-filtering-correlation-id: 804883e7-bf24-46f7-120c-08dd1ffde4a3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y2ptOFNDRTdCT2tDLytGeEJBYVB1WUs3ZUtNWHBnSDZKZ01icVN2RjRGYTJF?=
 =?utf-8?B?NTIxRkJvUkFDV21IT1A2NGI3Y3ZwazdUL21qQndTSnVDdVdnS01mYysyVDlm?=
 =?utf-8?B?M3Y4Q3NER1FuR29QbEwvMGQzbWlTaWIzakh3MzlnWmpwcG8xaks4VkNnZzJX?=
 =?utf-8?B?amZBZEszQnJoT0QwejdNNVFlc21oRWUvUDNhcVRla2hBanE4N3FENk1rZU4r?=
 =?utf-8?B?WEdiWThkcmdFWndsM2d0WnVQWkVwWTBYZEtzQlhoYTVXWFBWUDJuakhaY1hu?=
 =?utf-8?B?aTRtMUQzaFpmRkw0M3Y4TUxzVndlSmN4SlJWbFQzbE1aUmk2S2pKbWJtS1F2?=
 =?utf-8?B?b2ZLVnlFZXNEMGZzclY4a1FrbUtTT2FKV2pSd1pJdDZwWSt2UFVqbDdNdzRa?=
 =?utf-8?B?RkErcW1vRUp6dzVHejgvMi9kTk5QVk1KUFkvNkVJemljYU9oWlZUU3psbXRp?=
 =?utf-8?B?Yk11WlBlZVU1WEVnbWZoUVR0a2JVUkwvYUJXWkJGaUxFR0xGRXUyTG91aGdi?=
 =?utf-8?B?a1FSSStJTllBcnJZY25wZW1JeE04SitTMHAwWUc1MllqTHVJSVFlWjFWSDFB?=
 =?utf-8?B?MXp4WXRCbzhaeUZBOEMwOHcwQXFmUFBzUnBERjBEUGl2WXgzNGpJTHdYVmtK?=
 =?utf-8?B?RmNNVFh0VWhrUTNGSU5xcEtRb0F0cXQzcFlKelRjQXlFWEYxejhjOEtyZkRJ?=
 =?utf-8?B?bmpOOFlFbWRFK0JIZlFwR2FrQ1haV1hFMHZmSjZhQklnWGlHV2NxOTM1cUQz?=
 =?utf-8?B?NEkxd2F6ak5ObXdUeERvTFpTRlhkR1U2SzFkOWxCUElIdWl0K2pWcHYzUW4v?=
 =?utf-8?B?UGg0RE5oNmlWekVCa0JWMnNxM3VRb3pkSzZZK3hKKy94OU42ZlBlUXY5emZ6?=
 =?utf-8?B?ekd1bEh5cEVSQnkvQ2ZadjNKS1liWGI1a1RSc1BpeHowbVNqdU80WFVlMzlR?=
 =?utf-8?B?d2RJSEtscktCTjY4RmpLdTlkeFZPY0kyOFdMMVlTbFFrZnlxa1VVVWU3TE94?=
 =?utf-8?B?OW16aFJQY2UvQytjTWkrNFlzNFRsd1ZSSEdXVUtTbWxMNm95WkgxWXZqeFFr?=
 =?utf-8?B?K0wzczUzMW5ERzNuUHF5eHV6Znh0MStta2pHL21DUWNScERWeHVjTHlHNy96?=
 =?utf-8?B?YUE1WHk1UUJSWTBvOFRjQWk4S1RkZk5yRDZjQlZELzJCbk9ha0hlWXJpWVlh?=
 =?utf-8?B?eVVKaDNWUlVNaERnbEY3MU9vUXBSTEZXOEc1UTlrOGZJOURNSmN3ZzFTZE1p?=
 =?utf-8?B?bkVkK0l6OWhURzRUL0lkOERmZzY0K1NXWnpNOEpBUVRTVWhwU2RJRm13SXdR?=
 =?utf-8?B?aTJST0o0UEx2di80bFExVUZkWkwxdy85UVl3eVI4OE5jeGtKUlFDWklUVG5q?=
 =?utf-8?B?T3VnZFhheE9HUlF4eDZiWllvZitna1B5YVcyaVc2WnF5cEVNTU5WQlVWTkRS?=
 =?utf-8?B?cU9zTUlHTDBmSHZLZnBUTGcrampjbkxyMHBJZExEekVqVkNlOGxuWVIrUlpL?=
 =?utf-8?B?aE9lRHg0UjVQMFVmOEJnUCtxKzIwMFNpdEZyRmlkYW5ZV1pybEhkTDRsbHFz?=
 =?utf-8?B?SGR3dDhRNWwwZzNJWmhTT2dvdlZvMVI4Vzg5cFNKWjdVL0NqYkpXMC9jUFJr?=
 =?utf-8?B?RENtN0dqZ2VNd2VqK3BhcnVqeHUrdGpLb3laeU9vWTZpNkhqRlJ0bHBPZGpK?=
 =?utf-8?B?TEQ5emUvN0VLemhRSkZtUWlSOEJkajJyQjhmblExeWRKeGFRZW84bTdmcXNl?=
 =?utf-8?B?cVNYVUVLR1pJejU0UE9JTVZqeElGZmJ1QllGaVZpcm5FblQ4K3hKNlJmYWY2?=
 =?utf-8?B?eHNHL0RnU0ZRMXlQWWhDQ2t3aFlWWk02TkRLVFluT3h4NnVOYXFkbW5DNEcy?=
 =?utf-8?B?R1ZPMy9XYVN0RXBYWkZaeWcxYjBGKzlXZkJlVkVoYlpsYUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjNnYXVvdVhkWWNQRVJCaEF3RzUyQk9wam9hdkF5bG05bk1JZDd0Tkx4ZGV3?=
 =?utf-8?B?TVZWK1hoT1hrSG9vTUwxbkFXeFFaeHVlTEZYRDgySWpSRVBSL3Rjb2Uya3BG?=
 =?utf-8?B?dHdFRWVrZ0MraXhZU1VsMzR3Zkk4cEpSeEZ2RGRXRHBWejd6RzdqdkFuUkdx?=
 =?utf-8?B?MGpvVWtRUlBhVEpUMDNhVUR1L1FQdkpFei82RWJYc0svMUpiUTN6S3ljOEpx?=
 =?utf-8?B?ckZaM1Z3NjIzdldLa0x6cE0reUNNbFd4K2hrZTRVRTZUTDhoMmNJdU02QzBu?=
 =?utf-8?B?S1BjV2VhdlhxeUNSVnFzS2lBaFlIN0pRWmZSc0h1cXlvZ0poZUZCNkpLYmJa?=
 =?utf-8?B?K0VOMllIcjFPcXJ4Vlc4UFZVYUx0WHZwaW1kVHhpcm01QnkvaHlrdktERk5H?=
 =?utf-8?B?eUlaWEg1NHRFOXRXNlI4M2tyVG9WZm5uOHlEQndML2pZbThlQ2FFOUpIc2pX?=
 =?utf-8?B?R2s1dmswMkI1aEllT0tPeWZ2bjBXZFBEVnIwRGJhVGFUbXpKKzlqZjhVNlpS?=
 =?utf-8?B?ejhXSkRHNFRKQmxBc25yRktEZGhheWRYNFo1czB3M3RwLzBOMXFxczNkWndQ?=
 =?utf-8?B?bVhEUXpWMnFsZVpldHJrcDdkMDBlRW9wamkrbVVRLzRjOXdWQm8wWDlEM2NN?=
 =?utf-8?B?eEp2bWZwMmw5Qm42eld2cjJ6R2Y1bjJDRmdVVmt4b1BmYjFBeWlwN1NOcFVF?=
 =?utf-8?B?L1VIODB0enJyblRhQitHdTZSYVA3QmQyWWUyWURBbStlUm8wS0JGbDJ6MFRn?=
 =?utf-8?B?Zm9aRVVXWWhOb2VrL0l2aUJjcXpnWDJ3OGdwWVQwMmJmOE5nU1hqV0E5RDBY?=
 =?utf-8?B?RVl5NlNKbjNCTmdLNVdQcXRudTlCQU8rdVhyM0Z1UkwxOUYxZDhxbE5kWUEy?=
 =?utf-8?B?TkZJTVBZcFozZ0JQRHJnN1JTUHNvbE82Wjg1YmdmTDc1enlCbTU3dDI3SFgx?=
 =?utf-8?B?d2dHdVVLQ24veHZIcFRJRVFoeCt3dXhUSmJqVE05ZDVJcnBCZ1JVWjE4aFd5?=
 =?utf-8?B?OW4yVWxSM2U5NGpLQ0gwMWN4UWtvMTRGTTZwQVl3S1JwY3VhUWVPVVFlcElR?=
 =?utf-8?B?cHM0bE92VFlYU09NODY2MFFCc0RPeERMYkdRRFExL2ZIR2dSQTgzbEVESFVZ?=
 =?utf-8?B?ZlBvOEgwZ09mZkM0Tlh1b1prK2RsUlNZUkhOT1dvaVFJK0dkVlVXMDNHS0pW?=
 =?utf-8?B?ZklzN1A1ZG1uMHhwV0E1WEVldk1GMU1teEQ4ZEpHWlJkWkhjcEVmczA5eW90?=
 =?utf-8?B?ZEhwNG9zQ0ViWWFQMUIyb0hvN2VIMUFoN0Q1clZ5cE9UbVNZbUlGV3BoZGg2?=
 =?utf-8?B?dzU2YnJmZEhxQmpPcVF1YUtrVm1zYWZwVDhIc1cwWmg5MUxLZnc5ZEJWeGxm?=
 =?utf-8?B?UUFwL3doRDFhTE90aUx5RFJjaXNtdE9ETEx1TDBLY2I1Nk1kYjl0eXp3RktS?=
 =?utf-8?B?TlpFTFNSWS9pRS95d0NBdGlwVzZhMzJxU2ovbVFvNUt1eCtSY0JOSzdTbUpB?=
 =?utf-8?B?NVlwWjA3SFMzeExueTA5Z0ltTWZqWC9TSy9IRzI4YWFVQ29kd2hOejQyZWR5?=
 =?utf-8?B?UFA4cGNtY2s4RktPQ25iMmgwZ0JRbWkvWVZ4VEExZDFpSEpGQytDWVNpU2pw?=
 =?utf-8?B?cW8wV3NpTFZVR3lHRktUOXlFWnQ2TG9ZT3lFdFZ5R055SXFTVEZ4V1VLVXRy?=
 =?utf-8?B?NU50d1ZZNkhYZ2liWkpWMVFXbGdoaFAvczZ6RzJSS2k5Z0lKSWRiaGJHUVZO?=
 =?utf-8?B?MjBaTzc2ays2QzRuc25RZVNFVVQwanBRSEJ1S1RQWFRGSkxoWWhQL09vVWpR?=
 =?utf-8?B?QkdMdyt2aFBXV25LUW5PclppMUI4TFFNeXZZQUVQNEdHNXhyRnE3V3ltMGd0?=
 =?utf-8?B?Y3VqclFqT0pzY1pDY3M4ZVRwRkpIcUp4T1dHUHdDYmdNV0k4czFjdjAvOUxS?=
 =?utf-8?B?NjJwN0ZodnAzdSt0SElMNG9WS2NIRG9YMml5VEp0T3JKNXF5K3BYMTNwcjBD?=
 =?utf-8?B?RXNsNnVxMzQxWDBJYktYTjc5WVRNa3NQb1J2aXAxeWhDdWlNZ3k3QzNNZFRJ?=
 =?utf-8?B?L1ZSVURxY0EzWStabndQZDVRbkRCNFVPay9LRDYzR2RxSEFTS01vbWFScWUz?=
 =?utf-8?B?blVLSnhGRFN5ZEVCNzRiU3FYanlDT3o4RSs2ZkNSb2hYWUd3Zzc2dnZaekdt?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65B5C54AEF4056488B07BC8A036B0578@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804883e7-bf24-46f7-120c-08dd1ffde4a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 07:22:27.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfZPq+ZGkOlbpE8/hFIoJWKvRV77hCmNK9VG7QzzQJn1Il9hgmw36PtTxYjY9onbo6O0O8nSE7bILUnly/P2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_232237_284622_03B56CE8 
X-CRM114-Status: GOOD (  16.99  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYSBiaW5kaW5nIGZv
ciB0aGUgSERNSSBUWCB2MiBFbmNvZGVyIGZvdW5kIGluIE1lZGlhVGVrIE1UODE5NQ0KPiBhbmQg
TVQ4MTg4IFNvQ3MuDQo+IA0KPiBUaGlzIGZ1bGx5IHN1cHBvcnRzIHRoZSBIRE1JIFNwZWNpZmlj
YXRpb24gMi4wYiwgaGVuY2UgaXQgcHJvdmlkZXMNCj4gc3VwcG9ydCBmb3IgM0QtSERNSSwgUG9s
YXJpdHkgaW52ZXJzaW9uLCB1cCB0byAxNiBiaXRzIERlZXAgQ29sb3IsDQo+IGNvbG9yIHNwYWNl
cyBpbmNsdWRpbmcgUkdCNDQ0LCBZQ0JDUjQyMC80MjIvNDQ0IChJVFU2MDEvSVRVNzA5KSBhbmQN
Cj4geHZZQ0MsIHdpdGggb3V0cHV0IHJlc29sdXRpb25zIHVwIHRvIDM4NDB4MjE2MHBANjBIei4N
Cj4gDQo+IE1vcmVvdmVyLCBpdCBhbHNvIHN1cHBvcnRzIEhEQ1AgMS40IGFuZCAyLjMsIFZhcmlh
YmxlIFJlZnJlc2ggUmF0ZQ0KPiAoVlJSKSBhbmQgQ29uc3VtZXIgRWxlY3Ryb25pY3MgQ29udHJv
bCAoQ0VDKS4NCj4gDQo+IFRoaXMgSVAgYWxzbyBpbmNsdWRlcyBzdXBwb3J0IGZvciBIRE1JIEF1
ZGlvLCBpbmNsdWRpbmcgSUVDNjA5NTgNCj4gYW5kIElFQzYxOTM3IFNQRElGLCA4LWNoYW5uZWwg
UENNLCBEU0QsIGFuZCBvdGhlciBsb3NzbGVzcyBhdWRpbw0KPiBhY2NvcmRpbmcgdG8gSERNSSAy
LjAuDQoNCk5PVEU6IFRoZXJlIGlzIGRpc2N1c3Npb24gaW4gWzFdLg0KDQpbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQxMjA1
MTE0NTE4LjUzNTI3LTgtYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tLw0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBE
ZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0t
DQo+ICAuLi4vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWkueWFtbCAgICAgICAgfCAxNTQg
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKykN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS55YW1sDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssbXQ4MTk1LWhkbWkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLnlhbWwNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43M2IxZGZhYTFhZGINCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS55YW1sDQo+IEBAIC0wLDAgKzEsMTU0
IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG10ODE5NS1oZG1pLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFpRF9TZWZn
VkxsTTBRZFJhenMzM19zcGtqYUlzYzdnQXBFcEd1SlZmNGpsc0NHeEs1RkR0cll5Q1hzVTFiM255
ZlhhN05OQ0NsWVR5M1FtRG1SNjFGalRXQWk5RyQNCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWlEX1NlZmdWTGxNMFFkUmF6czMzX3Nwa2phSXNjN2dB
cEVwR3VKVmY0amxzQ0d4SzVGRHRyWXlDWHNVMWIzbnlmWGE3Tk5DQ2xZVHkzUW1EbVI2MUZxU1F6
TTZlJA0KPiArDQo+ICt0aXRsZTogTWVkaWFUZWsgSERNSS1UWCB2MiBFbmNvZGVyDQo+ICsNCj4g
K21haW50YWluZXJzOg0KPiArICAtIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ICsgIC0gQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCj4gKw0KPiArZGVzY3JpcHRpb246DQo+ICsgIFRoZSBNZWRpYVRlayBIRE1J
LVRYIHYyIGVuY29kZXIgY2FuIGdlbmVyYXRlIEhETUkgZm9ybWF0IGRhdGEgYmFzZWQgb24NCj4g
KyAgdGhlIEhETUkgU3BlY2lmaWNhdGlvbiAyLjBiLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiAr
ICBjb21wYXRpYmxlOg0KPiArICAgIGVudW06DQo+ICsgICAgICAtIG1lZGlhdGVrLG10ODE4OC1o
ZG1pLXR4DQo+ICsgICAgICAtIG1lZGlhdGVrLG10ODE5NS1oZG1pLXR4DQo+ICsNCj4gKyAgcmVn
Og0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgaW50ZXJydXB0czoNCj4gKyAgICBtYXhJ
dGVtczogMQ0KPiArDQo+ICsgIGNsb2NrczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEhETUkgUGVyaXBoZXJhbCBCdXMgKEFQQikgY2xvY2sNCj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEhEQ1AgYW5kIEhETUlfVE9QIGNsb2NrDQo+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBIRENQIGFuZCBIRE1JX1RPUCByZWZlcmVuY2UgY2xvY2sNCj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IFZQUCBIRE1JIFNwbGl0IGNsb2NrDQo+ICsNCj4gKyAgY2xvY2stbmFtZXM6DQo+ICsgICAg
aXRlbXM6DQo+ICsgICAgICAtIGNvbnN0OiBidXMNCj4gKyAgICAgIC0gY29uc3Q6IGhkY3ANCj4g
KyAgICAgIC0gY29uc3Q6IGhkY3AyNG0NCj4gKyAgICAgIC0gY29uc3Q6IGhkbWktc3BsaXQNCj4g
Kw0KPiArICBpMmM6DQo+ICsgICAgdHlwZTogb2JqZWN0DQo+ICsgICAgJHJlZjogL3NjaGVtYXMv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFtbA0KPiArICAgIHVu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gKyAgICBkZXNjcmlwdGlvbjogSERNSSBEREMg
STJDIGNvbnRyb2xsZXINCj4gKw0KPiArICBwaHlzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsg
ICAgZGVzY3JpcHRpb246IFBIWSBwcm92aWRpbmcgY2xvY2tpbmcgVE1EUyBhbmQgcGl4ZWwgdG8g
Y29udHJvbGxlcg0KPiArDQo+ICsgIHBoeS1uYW1lczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAg
IC0gY29uc3Q6IGhkbWkNCj4gKw0KPiArICBwaW5jdHJsLTA6IHRydWUNCj4gKw0KPiArICBwaW5j
dHJsLW5hbWVzOg0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBjb25zdDogZGVmYXVsdA0KPiAr
DQo+ICsgIHBvd2VyLWRvbWFpbnM6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICAnI3Nv
dW5kLWRhaS1jZWxscyc6DQo+ICsgICAgY29uc3Q6IDENCj4gKw0KPiArICBwb3J0czoNCj4gKyAg
ICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ICsNCj4gKyAg
ICBwcm9wZXJ0aWVzOg0KPiArICAgICAgcG9ydEAwOg0KPiArICAgICAgICAkcmVmOiAvc2NoZW1h
cy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+
ICsgICAgICAgICAgSW5wdXQgcG9ydCwgdXN1YWxseSBjb25uZWN0ZWQgdG8gdGhlIG91dHB1dCBw
b3J0IG9mIGEgRFBJDQo+ICsNCj4gKyAgICAgIHBvcnRAMToNCj4gKyAgICAgICAgJHJlZjogL3Nj
aGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ICsgICAgICAgIGRlc2NyaXB0aW9u
Og0KPiArICAgICAgICAgIE91dHB1dCBwb3J0IHRoYXQgbXVzdCBiZSBjb25uZWN0ZWQgZWl0aGVy
IHRvIHRoZSBpbnB1dCBwb3J0IG9mDQo+ICsgICAgICAgICAgYSBIRE1JIGNvbm5lY3RvciBub2Rl
IGNvbnRhaW5pbmcgYSBkZGMtaTJjLWJ1cywgb3IgdG8gdGhlIGlucHV0DQo+ICsgICAgICAgICAg
cG9ydCBvZiBhbiBhdHRhY2hlZCBicmlkZ2UgY2hpcCwgc3VjaCBhcyBhIFNsaW1Qb3J0IHRyYW5z
bWl0dGVyLg0KPiArDQo+ICsgICAgcmVxdWlyZWQ6DQo+ICsgICAgICAtIHBvcnRAMA0KPiArICAg
ICAgLSBwb3J0QDENCj4gKw0KPiArcmVxdWlyZWQ6DQo+ICsgIC0gY29tcGF0aWJsZQ0KPiArICAt
IHJlZw0KPiArICAtIGNsb2Nrcw0KPiArICAtIGNsb2NrLW5hbWVzDQo+ICsgIC0gaW50ZXJydXB0
cw0KPiArICAtIHBvd2VyLWRvbWFpbnMNCj4gKyAgLSBwaHlzDQo+ICsgIC0gcGh5LW5hbWVzDQo+
ICsgIC0gcG9ydHMNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4g
K2V4YW1wbGVzOg0KPiArICAtIHwNCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
bXQ4MTk1LWNsay5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210
ODE5NS1wb3dlci5oPg0KPiArDQo+ICsgICAgc29jIHsNCj4gKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8Mj47DQo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPiArDQo+ICsgICAgICAg
IGhkbWktdHhAMWMzMDAwMDAgew0KPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTUtaGRtaS10eCI7DQo+ICsgICAgICAgICAgICByZWcgPSA8MCAweDFjMzAwMDAwIDAg
MHgxMDAwPjsNCj4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9IRE1J
X0FQQj4sDQo+ICsgICAgICAgICAgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfSERDUD4s
DQo+ICsgICAgICAgICAgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfSERDUF8yNE0+LA0K
PiArICAgICAgICAgICAgICAgICAgICAgPCZ2cHBzeXMxIENMS19WUFAxX1ZQUF9TUExJVF9IRE1J
PjsNCj4gKyAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImJ1cyIsICJoZGNwIiwgImhkY3AyNG0i
LCAiaGRtaS1zcGxpdCI7DQo+ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNjc3
IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ICsgICAgICAgICAgICBwaHlzID0gPCZoZG1pX3Bo
eT47DQo+ICsgICAgICAgICAgICBwaHktbmFtZXMgPSAiaGRtaSI7DQo+ICsgICAgICAgICAgICBw
b3dlci1kb21haW5zID0gPCZzcG0gTVQ4MTk1X1BPV0VSX0RPTUFJTl9IRE1JX1RYPjsNCj4gKyAg
ICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsgICAgICAgICAgICBwaW5j
dHJsLTAgPSA8JmhkbWlfcGlucz47DQo+ICsgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0g
PDE+Ow0KPiArDQo+ICsgICAgICAgICAgICBoZG1pdHhfZGRjOiBpMmMgew0KPiArICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjIjsNCj4gKyAgICAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNsazI2bT47DQo+ICsgICAgICAgICAgICB9Ow0KPiArDQo+
ICsgICAgICAgICAgICBwb3J0cyB7DQo+ICsgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ICsNCj4gKyAg
ICAgICAgICAgICAgICBwb3J0QDAgew0KPiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47
DQo+ICsNCj4gKyAgICAgICAgICAgICAgICAgICAgaGRtaV9pbjogZW5kcG9pbnQgew0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcGkxX291dD47DQo+ICsg
ICAgICAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAgICAgICAgICAgfTsNCj4gKw0KPiArICAg
ICAgICAgICAgICAgIHBvcnRAMSB7DQo+ICsgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsN
Cj4gKw0KPiArICAgICAgICAgICAgICAgICAgICBoZG1pX291dDogZW5kcG9pbnQgew0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbm5lY3Rvcl9p
bj47DQo+ICsgICAgICAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAgICAgICAgICAgfTsNCj4g
KyAgICAgICAgICAgIH07DQo+ICsgICAgICAgIH07DQo+ICsgICAgfTsNCj4gLS0NCj4gMi40Ny4w
DQo+IA0KDQo=


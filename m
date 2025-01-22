Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8BDC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 01:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZJ1QtEYTFOxDu/VjEF7XIVvh/VpN9GNgBC5eD57c2w=; b=KvHUmiwXzncaeoHCNlGgzaIpAP
	VFvpXxXSnUv8KMoDqDh5W1+GQvNh16fMh4Q7s9UfQAZn6XKshP6QTq+2GB1cgvTN43Vm4DB3l2fth
	Xl9iTf6kWMGQtfmjrkZ2aXTaMzCAQ0Cy0svlxNmhB5DLgiA5A6AX8CB8jtkrxOzBteHmqTzjYB2lL
	Eu7o2iCWhGLxxPYrDE3Bsc4jZ8+sUgC1pDLNPx+mVK8xe1DnDKrdKBADp7/8a8PF6kqH0HDtIS40O
	Q/YL8O5Rd5XkitkIl8HtaZfGrWyLNp/qqTmoQO3n82SD9cANGwN5FT5qtgWeWxGH1YXXpwAJfLIiY
	60LWsjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taPTv-000000099sX-3twc;
	Wed, 22 Jan 2025 01:24:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taPSe-000000099nU-3TvU;
	Wed, 22 Jan 2025 01:23:18 +0000
X-UUID: 70dce558d85f11ef9048ed6ed365623b-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VZJ1QtEYTFOxDu/VjEF7XIVvh/VpN9GNgBC5eD57c2w=;
	b=KsskfUUMhQjS8wvK7EopLYwKAiIpNZzvobfCebxWHE6uTyLNvkhl8rZAWIyPA1270y24WSsbZN1QNxi0fXTocrC/SUXc5uKAWG+MEQ317dsWqW3lpV2hQvChH8A2ORobDARbylJOLT4bGemO6RyO7C17CU3W5qgDdZGtQcPQGd0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4127cb68-dcab-453e-9a80-4a835e7796f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1c2f430f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 70dce558d85f11ef9048ed6ed365623b-20250121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 230011919; Tue, 21 Jan 2025 18:23:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 09:23:06 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 09:23:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkQR79nkUsWFvuS1dG0vVi5FzcNo785sBlLkN7SGitFXCpaKQdu/a7zaeeHbSWnC8AfrKyVRs/y1d255Jdbs8YHOqlF+BOzWTCGz81K9UZm+lEv2fvZdjZAALEDybWmCusCl0YNmLd1oFxrlgCj+R/PSZYEMkCeqmznZjCjrcU+KlA2l3Zxj+bbStqByKQJ+kLt1X2pMINb1Pp1toQzTYKfQ/bbIARieGJ/t9ClhnuGzxaEZkt88Qv9AvwnbPD+cL3PlSpt7rzB3l6m2gGbi100x53/8rpcmGQF5qgvJe734GUTI8WXpg5WpsjjpqK89QfP+ItKpg2Ia3Cy4ws0YEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZJ1QtEYTFOxDu/VjEF7XIVvh/VpN9GNgBC5eD57c2w=;
 b=haH1jJjZKl5SQs2zJs2Q62t9zjlvkdkm1/nEQrq5Mxf3L6BkC4bZ0ZIXFxdIbFMDPdXGP4jbsY3Ikl/llL02sB0MuMDkS9TOYQC9s76foxfbxdklxmzeYWvoz5MegSSvgWplOa6Be0sE+DvFd09rzJp9S4JrlFuzGXRJusFarKxyPeXUaSqJEUr0wxDLKuXOWc2onUuGTs5itxgr44ZPLJjSwUdd5j/1Lssq5KKsCrRezIboLFTDNrDM+GZblDcPWOYUV5EoNw8s38Ucbwtz7BEKneIDS3ofYAPL6aQbqZciovLbuOFg8g0kX54ZRkOb/vW35y7iY1nXGL9azIbTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZJ1QtEYTFOxDu/VjEF7XIVvh/VpN9GNgBC5eD57c2w=;
 b=ak9JTiNVW406avLXC+/KGo94cA6OLD8t8n3obR8mAI/16NoquJWdFnnefzXqaTs5m8WT5V8bUwxeLiChgmqmBweCQEqdDv24WKgVKGhC5E56Ccc2+DI6nUaHOuv/twa1MkXC2UYVDHQgyI+ns9h5Prn8tbKchp6X7pwTnfbhRzc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7547.apcprd03.prod.outlook.com (2603:1096:990:9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 01:23:04 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 01:23:04 +0000
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
Subject: Re: [PATCH v5 12/34] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
Thread-Topic: [PATCH v5 12/34] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
Thread-Index: AQHbZcr0rCxp4yO6/k6uyY/6cXDiBLMiDMgA
Date: Wed, 22 Jan 2025 01:23:04 +0000
Message-ID: <b1bcd983f5c1f88dff080127a6594ef6f9cfe75b.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7547:EE_
x-ms-office365-filtering-correlation-id: 486ac702-e5cc-435e-e623-08dd3a83520c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cW5EUjN5WDlHSHI0MkZPSERYemJGbG9QWG5vb1pQS1JiN0QzcWszOTdvMmx0?=
 =?utf-8?B?eXNtVDI2Z0plS2l1N05CM0gvQ2RpK2Q2bXhwRTB0L3NiVWdhdHhqNjdoZU5S?=
 =?utf-8?B?L2dRWmcwMFJtZDB4WVdIWFE0NHgwYnNlemFwT0hydUJxOTNCTWlESFpIejRS?=
 =?utf-8?B?Rm5GQnhuUUVqV1lPRVk3R1ZJSFdHeDlnSVFIbWdUaGhiZVA1K0VqSm5RcXlr?=
 =?utf-8?B?SFdqbHNoVHNkZllYdjVJOFQ1OUdFVUNKSVZ4cnVCWndhOHlFSThERWRKVzUr?=
 =?utf-8?B?aXVjMyswZCtydWJzVkM3RnZjNmk5RmJBWVNzTGlyRzJCVmY5SzBNMDg5Mktt?=
 =?utf-8?B?Q21ZVG81dGxBcWpENVZzZDRDSkpFT01OejF4aHBtT3RpNE9RNVlGSWw3d1k5?=
 =?utf-8?B?YW9zQUduWnMyWUhsWjRFTHBjMXE2L0c0OFFsYzZJL0lKOEFxcjFCMlZ4blQw?=
 =?utf-8?B?RUZUY3NNS2tUVW1aQVIxN1ZiRlpmVEJPYlUwVVZpWWVmOEwxUlZ5cXhGMDRt?=
 =?utf-8?B?aFBWS2k4ZHRJN3krbE5QRnhOeThpcUdXZGJ4VG9kOFgzTHdicVMxa2h0Z1N3?=
 =?utf-8?B?L1dzY0x2cjlyd2NKMkY1MC9YakJZTDNLeWxIOWJvY2hubUxkc3JtOE9GZmh2?=
 =?utf-8?B?djlmZWFZVmpYK1I5cXVtdEdIc0R2Z0l4S0JtSkx6U3g2YzNvajlxVmhlYUk5?=
 =?utf-8?B?cFdOZjM4dXRncExMMlgwSDV5VUdPRDZnQVhVZEVwZCtFa0lZTDR1S3FGYnVt?=
 =?utf-8?B?T0pQVUUvaS9ENFNtcGZDMnVmVXlkQnZBcTM3QnVlRmFhN2drUndDZGJ2T29F?=
 =?utf-8?B?R2JWcDdJUW8za3BqbC8yekJwZVNJajFOMHV4MXB6YXBRZEgrcFpwVGN1eHh2?=
 =?utf-8?B?VmdhNFJ2alcrK3dMazRmL1NMTWx1VTZpVm9udWFUc0YyNDZnODJTYzZZeUNM?=
 =?utf-8?B?QU5XUGpvK0JhK2pseXBQSWNpWlNnMXNUeSthbkxCdE8wL2xKMXk4NWJ4K1Q5?=
 =?utf-8?B?Ti9FZzI0U3pWYWZaWjByM2R0U3NnbkxDcjhMQUFJODlFRUdhSFFEY2xhc0di?=
 =?utf-8?B?OXZjMlVPd25VckthaW14VjRBYXdJTEg4V2NlczhVME1NVUJvbEVnL1RybTVq?=
 =?utf-8?B?WXhkcHFzdy9ZbThZQ3EvdnZvWWY1SFVHMGJrMEp6bnhJa2NCUUlmcng3SEFG?=
 =?utf-8?B?VFFwZ2R3cVpUNlFCcXhNbTFBK1F5MUVNNXR2TVpVdWN0MXhRU2hodlorcmVV?=
 =?utf-8?B?TktlbkxaL1QzUGwrWFpBbW1KbDEybnkyY0w5NTNlY3l6T3hoQnFoUWl2eFJp?=
 =?utf-8?B?TlRvc2N4Q041SzVSY2lrUitxaEdkQnY4OXZ0cWd1bkRlR1E0dlY3alFkdWY4?=
 =?utf-8?B?UWZVR01rZzJvWGErU1pxcTN6QTcyb1g1enlHNCsyOEcycHI0VVpJemNXYVJv?=
 =?utf-8?B?WU0rTWVBR2pCTzEvSGNzSFBDR0hpVUlLOEFLbUMwZElNTnJsNmpYeHZEbDVP?=
 =?utf-8?B?Z1ZMSWxoNzRnMGZjcXVibzRUM3dYOE5jVkQ1bktZOXlEUDgvODNwUis3N0dx?=
 =?utf-8?B?NWtYRWprTzEycUFhdk5UTzl1aU4wTjZZRHN3bnBCamVpeHd5UVhjdXdoMHFl?=
 =?utf-8?B?d2E3dFhhSTkxZTJ5bTZHZmJoUC9tU3prMEJsNFJtaG1vb2V6RGsweDlpdU9O?=
 =?utf-8?B?OXVQaE9TZ3VWT1E5T2RpS0VTRlBpSEhSdVoxTXppNi83RUlQR2MrRHA3UTVs?=
 =?utf-8?B?L0JKNit1MFFOSUthQ0RYL29vMk8xenZpeVJBWTBRaStmV2ozOGNYK1hsVWJW?=
 =?utf-8?B?ZDlxemg1WHlRdEdUT2cvY3B0SElnY1hBRDR2bmN0a21COGtsc1lrd0NCM2Fh?=
 =?utf-8?B?bHkvR3I5UUFPdFA5amEwOEVSaGM2a0RqenZJNlM1MmMwSkl0ZWxscEJLZ1hx?=
 =?utf-8?Q?cisI0PUp7PK5Zg2b+ztgZUg4rxwbrFn7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHB3L1V3OGJVQllRcWZNQTlndlNQSUYyU3dUYTlHMXp5RkdIb1JmZ3M5K082?=
 =?utf-8?B?Yk02S29QZSt6MVRROUlIZ0Fqb29XaHdEbVNYdDRIVlVrbWYzd1ZBL3JBR0I0?=
 =?utf-8?B?QmdxVHY0a0hYaVc0MHpDaXdNNFd0MmRZL3RvV09DeTlUT0w1ZjBOYmU2dFBV?=
 =?utf-8?B?cWJJMjlqWSt2S01mbzkwSmdmVDJ2aVZ0cW9aKzlUc3NUdDF3MnlseWtyK2Zp?=
 =?utf-8?B?ZS9hck9ESHBTUzl4WmZLNU9SdThBWWxoRktQbHU0VVhGWU9EUTBiMFovdjR2?=
 =?utf-8?B?cmYzSjJyUFVOSEhjeTYxYjFIWmhiRDRKUXpCR0IyWmZQWjV0bzVsMFA0YTRt?=
 =?utf-8?B?TkdPNncyV3ZCM3diVit4MnJRZWEzQndWL1ZueHZkejJDd0VYTGJEOWpCV2Zz?=
 =?utf-8?B?aGRGKzg4b2VQS2ZDT2pzOWN0TnNpRkYvWDR6SVlmQzF2cGhUekw0MTBoSDVM?=
 =?utf-8?B?SlJMOGJWbnljMnNJYllDbTFxTTFndHhnc1dFVk9IT3RhRGtpMlBEeFFaOEhr?=
 =?utf-8?B?QlVBLzExSm80NHZlWjg3WGFMRklXamtJNnV2QmJhSVpobTdWZFRmdWZCVG1R?=
 =?utf-8?B?eXhsTlcyczVzSUFhcDFpQldmdm8rRlBJMlJSdWxaMXJidEMzbER2cVdOY05t?=
 =?utf-8?B?UUE2VktFMUVRSDlnYkFOMGhEbXBwRnZLQzFIWEtGYU45OTZTWS8zRHdtVC9o?=
 =?utf-8?B?aE02YzBBb3ZEZlpNZkZiZ0dlUUZuWXdURlJybS9pOU51aGE0eXdZVU5ZR2NW?=
 =?utf-8?B?K0NRZFNwelA2ZVBkU1BFZ0F0akhRVFEwT0w2SFo3ZWhrQlpGcGRqVEo5YWZl?=
 =?utf-8?B?NGFFKzdESkhMV3c3ZXYwSW95ZFFKWkJnakdmRUduNlZ6YXN6T1cwVFl2SzJm?=
 =?utf-8?B?YS9mLzZHY2JZVE1aSlZtdzVDTzEyQzdDNVdHNENiZklCeGMvMXFOdGlNR3BM?=
 =?utf-8?B?N2JEVWtsNTRHMUI5dzBHbUozSy9sc3oyeHp3dlFaUmZ0NzkwMGFvVWlGTko5?=
 =?utf-8?B?RWRQREJvdTYrd1BkSzdkM3laMFV0U3VtODIrV1RrYXN3ZEhIbGZkRkpWOUhQ?=
 =?utf-8?B?OEU0THdBR3RzSXhaMlY5TnRBWkVZOTcwTDhOUEo0M0plaVlUNTZ1dm1xYm9v?=
 =?utf-8?B?MTJRODZ4YnRhSlZTZlJ0UklSYVMxZzVDR2VsU3dMcnFDZkNiTUpvQnN6bUFJ?=
 =?utf-8?B?YzNIbGRMU1Y1QWlFVzBzYjdnM0w2ZGlObzlmakNldmI0WDVWdkJYTCtKTklV?=
 =?utf-8?B?bkRhckw3U29Jbkp6UFppWnllTi9hRjRMNm9XUUVvRHdDeUxVblA4NVhZaXM5?=
 =?utf-8?B?RmZHdUIyaFRDUDVpMXBGUks2UTBCOWwxREJRVkRwS2ZWRkR2bmo0ZUszNWZi?=
 =?utf-8?B?dEgzTEhhbVpuVkJGYjZmUG12dU1TU3IxcTNLY3hXMFdTNnYvR3BremgzVnA1?=
 =?utf-8?B?OXZnY1ZRSTVUc2tBeGxFcm5ubWRZbjhVRzJyUGJ3VUY2OFpFVDNVdTliMzY0?=
 =?utf-8?B?M1JaYjVyblB5NlFuZThiSzNKQ0dIbng1czlJdVZSQnNXUmQvanFid0YwbzdX?=
 =?utf-8?B?SDR2WVdES3hLazRtWWtnVGFrN0d0SEVpMU5xRXIwUUZpRjhUM2FWQkhXSFpu?=
 =?utf-8?B?SzVJMDJ2NzM3aG9zZDRKRGprdFNCUXR4YWZJODBDTlJFK3A5M1JEeDRybHhr?=
 =?utf-8?B?Q2UwR3hFV3NZS255cXdlZmgrNjRvcW80TnZPK1lKL1NNSjl0ZFB2c21mN1g2?=
 =?utf-8?B?T2RqV0JFbzJkMzF6eWhMbjYwdnhGeGRPWW16bldWVFVqTHRjVXV1ZmxrQ2l6?=
 =?utf-8?B?Wk5ZV1dQUUF3bng3dEd6RzJkWVV3WnRlSzEwSzFrQXNHWmQrR3Q1aWl6L202?=
 =?utf-8?B?Z1pXbXIvVGh3N0FkZ0lxVUU4ejlSUGZkRXFWMUVEOUk2NStHUzViVzBvbVA2?=
 =?utf-8?B?MHh3RU9USFpyVzJ2SXNzK25zWm56WFJrZUx6WG5PTTdTMmFDVjdSN1kwdmlq?=
 =?utf-8?B?bnZYOUpaU1VPZVpyNUZaTTlyeXByVG9TcjNIMUVOeGpSQm9lMDArTHczbHBl?=
 =?utf-8?B?VW9vTSt2Y0xvWHJmeXI1M0VBSnZndXBkMHlhTmlwbVlEYll3bTh2TWluQnJr?=
 =?utf-8?Q?CPPFvzFvH4ApsUyRSz9MGbs7K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFBFB590BEC96546AAD6E20861B1AD55@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486ac702-e5cc-435e-e623-08dd3a83520c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 01:23:04.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eN32gAl67LmihsTIXqGy3lpg3T60QL8z9fi5O8ZEClB236NAc999JpM8YjO8gd5JJWNcF3VBXBqELh5kccDLmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_172316_884467_9B460E79 
X-CRM114-Status: GOOD (  16.12  )
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
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgcHJvYmUgZnVuY3Rp
b24gb2YgdGhpcyBkcml2ZXIgbWF5IGZhaWwgYWZ0ZXIgcmVnaXN0ZXJpbmcgdGhlDQo+IGF1ZGlv
IHBsYXRmb3JtIGRldmljZTogaW4gdGhhdCBjYXNlLCB0aGUgc3RhdGUgaXMgbm90IGdldHRpbmcN
Cj4gY2xlYW5lZCB1cCwgbGVhdmluZyB0aGlzIGRldmljZSByZWdpc3RlcmVkLg0KPiANCj4gQWRk
aW5nIHVwIHRvIHRoZSBtaXgsIHNob3VsZCB0aGUgcHJvYmUgZnVuY3Rpb24gb2YgdGhpcyBkcml2
ZXINCj4gcmV0dXJuIGEgcHJvYmUgZGVmZXJyYWwgZm9yIE4gdGltZXMsIHdlJ3JlIHJlZ2lzdGVy
aW5nIHVwIHRvIE4NCj4gYXVkaW8gcGxhdGZvcm0gZGV2aWNlcyBhbmQsIGFnYWluLCBuZXZlciBm
cmVlaW5nIHRoZW0gdXAuDQo+IA0KPiBUbyBmaXggdGhpcywgYWRkIGEgcG9pbnRlciB0byB0aGUg
YXVkaW8gcGxhdGZvcm0gZGV2aWNlIGluIHRoZQ0KPiBtdGtfaGRtaSBzdHJ1Y3R1cmUsIGFuZCBh
ZGQgYSBkZXZtIGFjdGlvbiB0byB1bnJlZ2lzdGVyIGl0IHVwb24NCj4gZHJpdmVyIHJlbW92YWwg
b3IgcHJvYmUgZmFpbHVyZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IEZpeGVzOiA4ZjgzZjI2ODkxZTEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBIRE1J
IHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCg0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14A6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lybIgAE5hp6cmMh/tnZYFDhHZyG6/GkypHuAD5i9UNs=; b=U/PcBJU81jzvgOujxo5tjbQczN
	QmjJ7vpbTeTJiKZLlrCFqWTUoM5WJbX660GYD/joT60KvoBj4yTSp17f7yf6E4jpxI6DpPPFO/sRo
	BxKRw5JtTUH3Y7bQiF/fnuTcHf+e7aLXs2OHwyDOiwnTTlpROTHEnOl2OstC0bqaonmliyWH3Pf7X
	aVnXJboklotXbtzjBb/Mpo2T0tz/Reepf3tut95w/0hmD22y+iRJx6olj7sLXuUPN7p1PfJ2HbuB+
	3AEKJ2KeVWkxnJFH4PC6DDdEjqUb48/LBPFIJzFGcEarjFbDBMO4QwZY+eQR9IBYXkKvKKqpDCNZO
	15s0bWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjw0d-00000003g6Q-0c1H;
	Mon, 17 Feb 2025 07:57:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvz8-00000003fwP-41JW;
	Mon, 17 Feb 2025 07:56:13 +0000
X-UUID: a3e231eced0411ef83f2a1c9db70dae0-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lybIgAE5hp6cmMh/tnZYFDhHZyG6/GkypHuAD5i9UNs=;
	b=tryNymhaltjtrKS2T8w4s6q2Kouam2Zfg/VQMU0eRZ4bRcW7OBffNNJv5uYQ57NJhmd8IaMjikxv2O3faHe1cTs1WV+Uidj0vdZ7/mw0gESjvF92qjJErkQfnTFFe5FDvNpx3nLF8X5u302YuwnH4KwS5gadHWM98X3XLBRjXGI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cc4a6683-f469-4790-9470-54c6b25dda45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:3b9adf24-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a3e231eced0411ef83f2a1c9db70dae0-20250217
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 965399541; Mon, 17 Feb 2025 00:56:05 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 15:56:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 15:56:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaPQeK0mxVXmOa5iqMUiJMnlUdaZgNkUpACj6n7n6vhtPZZj1//bjovxLyn+8Nrx7GrkuJiK83G0hnYShnShYNzz8xL+JZMECuYtpIjEZQp4hw3C/6Y8tQ0PexQCCMsknHFbBxLXZqgmi3D+HPAR6IHiuVn+eoHKefC3gAk2rxQFuNveKQC4JmzY4wRB7IF2es1xyz5oGIWwVPD7Ys0tKQPQbYT4jMFC/qwicw5dL1phzS1ym7F2QaDd94o7Q+LMqkX3C8RpRIHT9CSfjiHf/EGljsj2TxE9CZJYsUWWkMQ4BTPwi5IVteT9NiDlbbZ8Z+ccEJvVEF9BRTC1hYDCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lybIgAE5hp6cmMh/tnZYFDhHZyG6/GkypHuAD5i9UNs=;
 b=SWWG5BzUhyRgMWaZQzmLqlZrAUY90M7SPUpkyVxKHijFN8cnsNBX/C2SuDfWYbMWyJOwXmzgBTxCm62MPidiEXURbGQg1P/10NUO52pjumxdn00mEQM9DiMk2TcpaldfEe+j2cir5SjrBEzS28oJNVANq+eQc+UyLz83X9RF+ite6opvbi8qaIvIui1GJv7H3z7lg8t4aV8KjnkciHbP6WL2+LqsgWmgUJ+EZZlZ04elgQdk1ZD1Alo7ziPcXDaHcq0xS5bnUjMBBxZnjZb0xuDBDCBzoYdan03mLpBuxASKDoYegV5nPXsTk1VENlRYXjFCAHxVbspDZjnLNtHztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lybIgAE5hp6cmMh/tnZYFDhHZyG6/GkypHuAD5i9UNs=;
 b=WvcFd7yO4wSGBcEI0QE06SF4Zp5wTgX7C5z3SWiqJv3+FoTSMq9maT0m3avtznWGrvDRN98YJUX/UbtvN7SR5YYN6/RvwPFcFBPpYD+63nkX9s1ISKgdNrbHINLCG3RHe4uziK7alKRqCwJDvzTz+2Tndkym1zGCAJxwhfDvvas=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8328.apcprd03.prod.outlook.com (2603:1096:101:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 07:56:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 07:56:00 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
Thread-Topic: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
Thread-Index: AQHbY2QCbc/DMEq1wU6KNctnlbXbSLNLW/uA
Date: Mon, 17 Feb 2025 07:56:00 +0000
Message-ID: <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
	 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8328:EE_
x-ms-office365-filtering-correlation-id: df384e6d-fa1c-4b92-7d56-08dd4f2884ea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K1ZxNk00bFFyMkttRkdDdmtXLy9rRHF2Z3p3Z0kxcU9RTVdxUlR0cldYYnhJ?=
 =?utf-8?B?alhvcU5yZDZxaVd0VFNHNlFsY0F4SHpDU09tVmluOXJlVXk0NmY0UURrWGVi?=
 =?utf-8?B?OVhNMEkrdFVpUVp2OTZESnhPY2M4NXVYODUvd2ZjY2p2TXROTGlKa0ZySTV2?=
 =?utf-8?B?cUl2MGlSV2hKOFltU21rMlMyS2pGdTl5V2xzTHk4OCttUWd1WlJEd2o3OFM2?=
 =?utf-8?B?L0ZRNWJ4dU94QUExVWI4bmYvMUtUZDlDM1pRZ0haUGVlaG9nQVh4bktjTDQ4?=
 =?utf-8?B?UE15V1Z5aGtLZGNvWnhwWXJzSWlsdGZIMSt5aHZ0YkR6VnhhUWFXSk1tVDhN?=
 =?utf-8?B?cUNxWVFQMUhJeEsvRVpuNnhld0xTSlI1MWRmbXUrWVVRNzhZQk9hTmZITFFa?=
 =?utf-8?B?T3JHT2RPMW5BZ0hYZ3NEZzMvL25TSld3QXhReG5PZ1lnamkxd1RJZnJIRUpD?=
 =?utf-8?B?aVBxMXZQNFc0OFFFMFJZYTJnUTlsN1hrdWh2bWZhNUdkWFFkT1drRWVlZEZ3?=
 =?utf-8?B?cXJWRnA4Rzk4a1l0K0I1MTNIWVlpNHBQY3pGZmRLZ21SSXFUTEJLQ1FVU1lq?=
 =?utf-8?B?dkV5YUhqWWQ0dGg3R1lwckZBS0diRG1XcjV6TTY2cytnUktiZjNOV0JST0xK?=
 =?utf-8?B?ZnA2S3IwVjI4N1NDczA0aVhmdGkxRmRreHdXQmh0a1poZ1RiKzVmQitjRUlI?=
 =?utf-8?B?ZTVDUWd1Z0FpMEgvVTVHQXJSSVBpRUtwQkxnNjBSYm9sVGl6SHUwK3FBWkxN?=
 =?utf-8?B?TGFHRTJrSTA1MTVvYkUvZjdkREJrbFVPOFIxTUNQT1VyazFzNHNmWi9MTXBm?=
 =?utf-8?B?bWxoeUZFUWRlcEN4SlB2dHgwcVI1S29jUE9XdmdvVlh4NDRVb2RpYWdMNWRO?=
 =?utf-8?B?Z0tjVzBvQklGV0NBQ3NVaTFZa3ExYkYrNkhHVVFCUllQdlRVcFpCd0ViZUds?=
 =?utf-8?B?eHBHM1h3VkVlcGFob1FxMXJPalN0ZlJIUTkwRDZCYzJTMnp1bmhqNDAyZUpW?=
 =?utf-8?B?VS9YTVNRMFplZFYzeFpzRDZkR1FlSnp2RVNKVWlJc3dUMnZqVUtXb0t0ZUp5?=
 =?utf-8?B?UFVTeWRFTk9BMzB0TmdZUmpQK2FFY21yZERYZGptNVg3RjhLczQxanZWemNj?=
 =?utf-8?B?cDhBZi9uV2R5QUJBdHpxT3pkZkF6b04zU1NzZW5qeStwUTB6U1RubHUzOHZ3?=
 =?utf-8?B?V3dSVlo2NHhWTWpobjh3ZXdSU1Q3YXg1bHh3VDBiYWxDUHZIVVFRam1YUW53?=
 =?utf-8?B?OVJESk1XNGZLd3FXbUZUbUI5ZkpSSGV3VDVXZG56QmJFVmJPN0d3Qm9BTEZZ?=
 =?utf-8?B?RzhCdFM1ejJMcGJxbkJVbUVXa1FjeEtabHYvaEZXSlZneTE1OFBKY0FNVENW?=
 =?utf-8?B?MGd6WWtKWjRtY2pOMjhyajRUK09pYTBrbzFYTXBuaHdHcTFDVXVNalJUTC9J?=
 =?utf-8?B?TDVZdXBRWmhZSnczclN2TDQrRE1Ia1ZTdmhZUDVhOGlvM04rczc4bXhDcWlB?=
 =?utf-8?B?a01idXh1VlM1ZVNZbkI1NUExaW41ME5ySFE4M0VGc0FLS0FQendwQUdYblZu?=
 =?utf-8?B?eDY1L1VwbW8xaVBrUkwzMWZ2cHJaR0JzRjFaTVFIVzVaY0o3QkdpQmJydHYz?=
 =?utf-8?B?OHN0TEV2T3hZdjI0ejd6WGErZ3MwUEl6WkJIYm93bDZxQjZnMTV1eVpzKzNU?=
 =?utf-8?B?RWdqWTNydTNYTEk2eDk0NFRGQ3JBSXVqdFJsUDdhZitRNHNoNUcxRGhyTDRD?=
 =?utf-8?B?M0V4cHRDNDJCNmtRQzUvL0YxaStrakF1aWtSR0YzNFhSZFllZWMrMi94dkVD?=
 =?utf-8?B?SVY1RFIvcFJ5R2ZVMVNEUUUzNHh6S3hha3pPaE1NVDhUT2xMd21najRaeEpp?=
 =?utf-8?B?bi9ObmJsWEdkUEd6aVQwSE1qY1hFQ29XQ2xoUS9KWkhYNzl5YU1rbGRxUmRG?=
 =?utf-8?B?QnlIZmt5dyt3eDhmN2kyOWc3VUhiQmJKT0NXZ0RWb2ZrRW1BeWVOZUdUMzdU?=
 =?utf-8?B?alpGa25oMWZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejhLUk9wNmRXMTNjREJ2Y1F1Y2RRazBaSWpRd1Y3Wm5nVmxGWHlBMkF5TEp2?=
 =?utf-8?B?TkROSjlaYVJxMVRpWml3UG5YTU5vbHpOcmZkN0NhejhqNTNaTXZ2VzRTaFJt?=
 =?utf-8?B?UmdodFBqVi9rWU50ZXVQYVl2anVpTUl5a0E2cGVhYlZRQjRWWStkZ2VxZGlP?=
 =?utf-8?B?ODFVaXlHS3JPRmJsY3BWVDlET1NZNy9uQkpkVGtSVkw0TWJVRWp0MHpsd3hH?=
 =?utf-8?B?N2R2Z0Q1STdQQzZaOXpRbkovSWNhRzBwZnh5M085aktyOHVKem5MdmNwYUZ1?=
 =?utf-8?B?KzNKZ0dwVjFOU1kyYmRQMm5FcjF1a01DUitjb3FBUHJ5QUxIc29YZmJnbzlH?=
 =?utf-8?B?cCtVSHBCZmxXcUVYUmE2WUoyREF2YXBxRVBBQ3hnL3BMMmJiOU91Y0wybG1M?=
 =?utf-8?B?WEdnZEN3MXBZRCtvTHNhYStXSjVqUlNmUVJmTEo3UGNUeUJ1OGljOHRCNEtH?=
 =?utf-8?B?Q2YxeC9HU1Y2MnhHaTVOaHk0ZnV5bHJtcXlialE2TnVIUk92UlMxU042K1hr?=
 =?utf-8?B?b1hJUVZRVDFhVGxuRWdQdmVqcjFQS2p2eW9vYmhqVFVkb0NSNStOYzJhelB0?=
 =?utf-8?B?T2c5cytJN21CVWdieWY1aWM3ajlEdHhnRE8reUxRVG85VmZGaSt5R3pyRUJ5?=
 =?utf-8?B?eWNkZ3FGM3dzWkFySjNFWkF2RGIvZENMNy8rUzdIeEE5WGxrZ2NmQTZSd1Bh?=
 =?utf-8?B?N2Z0dVAvWFhaTDkyemU2aThVaWNON3ZGMlRqbmZPU3hlRWVHNDYxSU1kTGV5?=
 =?utf-8?B?QVFLKzVubURlZTE1eGNNdElRQmpCaGR2U2RGbXVEWHlvWDBlVkFwMVNPNFpS?=
 =?utf-8?B?dTNFVHJ5azJSYXN5b0I0aGdZR3NQd2Q3OU5zR3FlazlkQmJmTlpXL2tVNjZz?=
 =?utf-8?B?N0dTTXUwclpKTW80eTdpN0x5dHNrSm96YWppZnN5M1YvMkx3MUhGRHdVdGpj?=
 =?utf-8?B?UENLNzlHUHllS2dhejlsaHlDRm9Zd3ZFUVc2OUVZR1poU2N0MWpnT3VnVG15?=
 =?utf-8?B?WCt4RmtYek5pYTNzSlY4Z1dQbFkxbnc4cHptZFZCUzRRMzNyRlJQNzcwNjk0?=
 =?utf-8?B?MldHZ0pjY3huY3BTNjN4c3VaWGh2QWRDK2JKMzV0YzNJU3IybGZXemQ1dkVD?=
 =?utf-8?B?MWxiaHBlVWpnbktqTDR6YThqeGlvODdWV09oQVJPNEc1eXduaFdPQW1tVjJl?=
 =?utf-8?B?UW9lVHE3eU4waWVPODRXVkErK096OGJLbU1LR0VWbG5vV3ZEVm95SUVqaXhY?=
 =?utf-8?B?QkVOSjg4aldvS1RPZC83SkZIYVBZTDR3Z1VEWlFvQ2pOZ0RXNlpyMU9DbVRR?=
 =?utf-8?B?RDJUU3ZhYk1oa1owME04WDRodVFwaVkrWlhiUURGbHFFNG14am5ySGZOZkZH?=
 =?utf-8?B?RU5EWEJjOUQyTXFYYmFaNXlUdmhuZXp1SUtKa0dHcUE0bHRlQXorVFJVRGxl?=
 =?utf-8?B?MThzVXRMMThqL0VlVFJseTdPUEUrelpuTEpnWHpwNzNzQ1ZwNC9VdnhVL0V6?=
 =?utf-8?B?TFNzWFFvVWNCNnA0T1lpai9CbFdoWXFZUk8vS2VhSmZlOXZIc05ka0R2VlF1?=
 =?utf-8?B?UHJNSmtFbnJLTEhuNE1QQWRLZnpxS1JSTVNsaktoTVJkRDl5U1M4eC8yOFd1?=
 =?utf-8?B?OU9Qb3BhY0orVlU1RnMyamxHVkNPNVMvZWJMcG41QUw1VlA5SE1qMjhPdDNW?=
 =?utf-8?B?Wko3QlhTQzBsU1RUbmtTNmE0cGJMT1FGR1BpYzBRZFZBWXhSL0FxR0lpWnc5?=
 =?utf-8?B?LzdQRjNNM21nSjVtdXhwaGlZOGxHY2cxRmUvV29YcEZlcFVUL0FLOTJhRGVF?=
 =?utf-8?B?MWlJMkFScEV2VllNUmNpWlNTLzAzejY2SURGUUF1eUNudTRMZ3ozcmt2RFlU?=
 =?utf-8?B?RW9DclgvNzJCZzBUQTgyNklTWWRYdDlOaWFxc3IvQ3h6S2x2aGJxNEJqaTh6?=
 =?utf-8?B?N3luV3NVOWd6RW1xcUlQaTlDMGRiSGVuK0FaWHhBOWlvRHdPZ09UZ3pya1M3?=
 =?utf-8?B?a1I4ako4dmEwS1ZCQkpDQi9uNmt6a2NDT1gwVXFicks1UTNIdlBXaE4xUE1t?=
 =?utf-8?B?WlBIbnJVWE9wQm1zN2djZ0Zka21ubkF0bkdiSGRpKzVHTGlpMk11aVVuOGlq?=
 =?utf-8?Q?nPXnIe/tfFUar0btzpSDec7ZU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06447B36C2833A478EDCEBDD9747EFB7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df384e6d-fa1c-4b92-7d56-08dd4f2884ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 07:56:00.3373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /a3sRMSzSedkHcC4sWfd4mvBnUxj/+sTetvIXI0BWRRL01glsz3eEevIZfXviZrHDomk4Z+XGOIZcOTodjLlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_235611_005797_FA7766F5 
X-CRM114-Status: GOOD (  20.29  )
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

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDE0OjMxICswMTAwLCBBbGV4YW5kcmUgTWVyZ25hdCB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBDdXJyZW50bHksIG10a19kc2lfbGFuZV9yZWFkeSAod2hpY2ggc2V0
dXAgdGhlIERTSSBsYW5lKSBpcyB0cmlnZ2VyZWQNCj4gYmVmb3JlIG10a19kc2lfcG93ZXJvbi4g
bGFuZXNfcmVhZHkgZmxhZyB0b2dnbGUgdG8gdHJ1ZSBkdXJpbmcNCj4gbXRrX2RzaV9sYW5lX3Jl
YWR5IGZ1bmN0aW9uLCBhbmQgdGhlIERTSSBtb2R1bGUgaXMgc2V0IHVwIGR1cmluZw0KPiBtdGtf
ZHNpX3Bvd2Vyb24uDQo+IA0KPiBMYXRlciwgZHVyaW5nIHBhbmVsIGRyaXZlciBpbml0LCBtdGtf
ZHNpX2xhbmVfcmVhZHkgaXMgdHJpZ2dlcmVkIGJ1dCBkb2VzDQo+IG5vdGhpbmcgYmVjYXVzZSBs
YW5lcyBhcmUgY29uc2lkZXJlZCByZWFkeS4gVW5mb3J0dW5hdGVseSwgd2hlbiB0aGUgcGFuZWwN
Cj4gZHJpdmVyIHRyeSB0byBjb21tdW5pY2F0ZSwgdGhlIERTSSByZXR1cm5zIGEgdGltZW91dC4N
Cj4gDQo+IFRoZSBzb2x1dGlvbiBmb3VuZCBoZXJlIGlzIHRvIHB1dCBsYW5lc19yZWFkeSBmbGFn
IHRvIGZhbHNlIGFmdGVyIHRoZSBEU0kNCj4gbW9kdWxlIHNldHVwIGludG8gbXRrX2RzaV9wb3dl
cm9uIHRvIGluaXQgdGhlIERTSSBsYW5lcyBhZnRlciB0aGUgcG93ZXIgLw0KPiBzZXR1cCBvZiB0
aGUgRFNJIG1vZHVsZS4NCg0KSSdtIG5vdCBjbGVhciBhYm91dCB3aGF0IGhhcHBlbi4NCkkgdGhp
bmsgdGhpcyBEU0kgZmxvdyBoYXMgd29ya2VkIGZvciBhIGxvbmcgdGltZS4NClNvIG9ubHkgc29t
ZSBwYW5lbCBoYXMgcHJvYmxlbT8NCg0KQW5kIGFub3RoZXIgcXVlc3Rpb24uDQpEbyB5b3UgbWVh
biBtdGtfZHNpX2xhbmVfcmVhZHkoKSBkbyBzb21lIHNldHRpbmcgdG8gaGFyZHdhcmUsIGJ1dCBs
YW5lIGlzIG5vdCBhY3R1YWxseSByZWFkeT8NCk9yIG10a19kc2lfbGFuZV9yZWFkeSgpIGNvbmZp
Z3VyZSB0aGUgaGFyZHdhcmUgYW5kIGxhbmUgaXMgaXMgYWN0dWFsbHkgcmVhZHksDQpidXQgc29t
ZXRoaW5nIG1ha2UgaXQgbm90IHJlYWR5IGFnYWluLCB3aGF0J3MgdGhlIHRoaW5nIHdoaWNoIGJy
ZWFrIGxhbmUgcmVhZHk/DQoNCklmIHRoaXMgaXMgYSBidWcgZml4LCBhZGQgRml4ZXMgdGFnLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIE1lcmduYXQg
PGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IGluZGV4IGU2MWI5YmM2OGU5YS4u
ZGNmMGQ5Mzg4MWI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAg
LTcyNCw2ICs3MjQsOCBAQCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQ0KPiAgICAgICAgIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoZHNpKTsNCj4gICAg
ICAgICBtdGtfZHNpX3NldF9pbnRlcnJ1cHRfZW5hYmxlKGRzaSk7DQo+IA0KPiArICAgICAgIGRz
aS0+bGFuZXNfcmVhZHkgPSBmYWxzZTsNCj4gKw0KPiAgICAgICAgIHJldHVybiAwOw0KPiAgZXJy
X2Rpc2FibGVfZW5naW5lX2NsazoNCj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHNp
LT5lbmdpbmVfY2xrKTsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KPiANCg0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78585FD460E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aa+EV+C/EOAaw5inlLZbtYT34zh+Dbg13RgSHRIIarY=; b=NWTY87b/KqTyDoSBJRFoMFFmDq
	rjAzST1GTijTVmgab8S0xk6fBCty/4EyrkAAq6UV2G2MNCppfItZhUlL06uqEewF+6wNWObn24maS
	TSZTFb0xINpHKl69Pte1RYVVEZDYPOVNzI/BdI0y7loWIgUlFXFd4BMDHqlAnRaFCOoaNoVqvC7oF
	sX9lOsbsixfA+Dh32S1gb23gvEMP8WDpvNbBceGLcOQF/6JbFlEbrW/cdxlE9kfLjZjpJ1efkTEIf
	ZpV+tolHUWWbU7YKYwh8v+nX1s+Lp6XLaOB+NLQXIWUGQCoE6ac+y/th6tvekA1KXH11OeLj9xA7I
	Sxh97DyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSKq-00000005L6t-0zCP;
	Thu, 26 Feb 2026 03:46:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSKm-00000005L5q-45iP;
	Thu, 26 Feb 2026 03:46:42 +0000
X-UUID: bf686c0012c511f1a16f0188aa809bee-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Aa+EV+C/EOAaw5inlLZbtYT34zh+Dbg13RgSHRIIarY=;
	b=qHpi23xfJShQm2S24dMDvRIcQC1+VRV2KYmocF77uF50YO2qUCW9KAgYHR1SK+mDxbNaYJC8GUNDfZRuUTYjhRtkxUxX2Qoa4YyV0ISp7L3yavXr4mTmGJmd7jFFkXIVFZ6W+ULiA5SSai8mwtjWYi7bIoljfbAxAMYxrYYky24=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f001ac2e-4fbb-4b5c-bc8d-2b2787b3625d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:2555487b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf686c0012c511f1a16f0188aa809bee-20260225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1693500325; Wed, 25 Feb 2026 20:46:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Feb 2026 11:46:32 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Feb 2026 11:46:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNIv73Kk/MgVhol83tXTLouef3JfstEnHOPL1Sv0LM+SJJvP520z0Kee/Ks1JXDp+PrgIZ/f4VVg07Wc86cqPx9IID9W72fF5DgNLl6avcLuJ50X1ALagNjmST1uZGHy3Kx4NpAhgZIf78vHUDd5vmZzrjczQ7zHvGf9uuOquuPF7enq7+ShEDxtwBiuthzuZYLk7gqHYiAoUBkyBIozrDnQbsMCaz3xv26exi3fI0S9ZxXrFUivAqj/d3cIpq2NgMJMmgdRi3ADFfhNy+6Sqd4p2bGdqotHSvhayp26i3tCIk5SJWJUtddf9R2P7LrM30xjLptQ3Khj4hc9AU9suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa+EV+C/EOAaw5inlLZbtYT34zh+Dbg13RgSHRIIarY=;
 b=gujjdNnfCbs8oVa4IR9RnxYEiM+BIP9sZ4VAo9Q9T7JwTcZy+ty03hx1QVMuVCfU69d0bDNEq1KP/HWIXIiMAvKUMEFkmivxeYQszvrYdzv/shgjiBySlT2g1jda6UHlJoAMPufLPMnzF5DhHcZPr7Am+mulZUGBOiGfQk3sWh74HnJOADsDUOhQ4nFX5xM6ECZzblaBJFXjd91u1mptPm4C3Cn7du7/1p7ZYiewoVvqcB+F7EbBc5MhOV+RA+1fkwS9X+uBNnIhW+oM12mv/WqtZocsuRxmTPgXaxhCbU7QqZa01DYE0XjuXBNsGYj8+xL29AhNmvRCH8hZd1mtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa+EV+C/EOAaw5inlLZbtYT34zh+Dbg13RgSHRIIarY=;
 b=c/XCBcSDrV/pRYTWk0gHdO0UnCAM555CR9SYs6V8m7D9DVIB3tIxoKmNGl8/amLzlSxR5wMFVW08TeKCySsbBZ61G44YlXsbmekTiiorgYBocePArY61ybf/JO0BNSe7I8cKwySNXzQx7N410gcCiSiU+FttAvTV76j4VXEVSsw=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYZPR03MB7060.apcprd03.prod.outlook.com (2603:1096:400:337::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 03:46:29 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%4]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 03:46:29 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
	<Chunfeng.Yun@mediatek.com>, "kishon@kernel.org" <kishon@kernel.org>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH v7 20/23] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
Thread-Topic: [PATCH v7 20/23] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
Thread-Index: AQHcn0oP6tEnScLyfUKovG8pABVQS7WTRnGAgAAi7YCAAP0HAA==
Date: Thu, 26 Feb 2026 03:46:29 +0000
Message-ID: <6297edc9c2d6d1a323f188ef411205701a629d88.camel@mediatek.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
	 <20260216-mt8196-ufs-v7-20-b5f2907c6da7@collabora.com>
	 <5d9723fd6b4ff8430889efb33e0fc93a10c4a880.camel@mediatek.com>
	 <cad2e275-8b5d-4023-b3da-a191bfd065c5@collabora.com>
In-Reply-To: <cad2e275-8b5d-4023-b3da-a191bfd065c5@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYZPR03MB7060:EE_
x-ms-office365-filtering-correlation-id: 0dd91320-ea19-48b5-bad1-08de74e99fd6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: a7ntfwjzwIG5Hm8yI7URCIw32kmr5D7zpAXQEjTGG/TgSYUr7HgZXYEOrgqI5NGQrv10pIWkh5op+lK2yVE1TasBpiYV+wt6AHed6jGsa1N+R5GE0iOQTQ5Rteyvff2zvtSKFzqRYlHGskWOfObsEAl6/aVqUdHLZFrLstUfNWO8EH07ZfxpB63q9L5t+LdDpjvpiN+CNMBsq+vtUvHp06+TZYuBXFCKVhdGFC8E7lTz0VIpOgrS8x8XfwFl6RwF6aMeJGlLoNnqoqameg447NVHODh8uoN1v9QHR0I+wKLQkdGF4iMJZRsO+NKEgILwQhxLd4G+cxDt7ndytxFPX6NPb7tXN3gsz7ecA1gvhrq+EDJPUsz3vh6u1KXZqnY0KXqZSr9SZRWFcLi5qoC5XKv6b3qe/iEFD9MFOwn3ro801B0y/No+A6MtHN5SAI+XG75EMXqO6P2FPrLG53ztQ8t01OdUiZkGqcgWtvv+IgAkEbb5PoU8b2H0w+5rSomp0m/n0zhYHqsp5wtlbYVvmq/wHLipgh72r8sfpzWtNBYsAlOiuCKO6+WDsr/DpnGFbZtiUekxQl6GZtNUQIazqD0+z0W7CRRB9quxZwmYsFqLlh4/Q8auFatUwtHneS/9Zp1+z3ZoQR0NTh2bw5M11zRGHyswak+8ufWMLAtFRwXut+f2BQgLtvlO4iuX4miGBl0H16XVdYgCg8+EDct8a5U/f8xdBt0RUAdwQaf9PkMY7aMmG8sVo5mQ7+fricMULi4gPab+0iRledVT9IFd2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWo0cUJJajdpOE5UQUxoLzNvS3Mzd0NrUTdpTmpmbE5jU2R4aTF2ek1mMUVN?=
 =?utf-8?B?bmtaYm1uV09pQVQrWFoxeXVqNUdaczZsbUUxSUhaM3BTOUc3Qmo0SDk2Nito?=
 =?utf-8?B?SE8zLzQ1dmFYL0lhdGZaaTI5RDZjRFIzcTZKcUVXbFlTdmdOYkhBcnlBVzUx?=
 =?utf-8?B?M2xFc2wzbE9sNUZ0N3I3dDd1Vlk1Q2Y3d1NMWTZZcFZRdDdGK1BseWg3T2hr?=
 =?utf-8?B?OUhUSndHWWZ4Z3V4OGx4cU5FTWNiZXlTNWFPaTIwWkZYSHlKZmVlTllXMlF4?=
 =?utf-8?B?VHh4WTlseDFuWFp6VURyTGgwUU5PZ2xzdkpsWnNIZktLRytaK21sbWlGZTBj?=
 =?utf-8?B?RDlpT0ErOUNRTWlCWlV0RktFdkduRFIvRDN6MUJHTlAxSmMzYUZCZ2tNMHdQ?=
 =?utf-8?B?aEZPd2lJY0RKcVAvd2ZjL2FZRHdlOUNHaUQyeFdxVm9LUUdSZDlwYk8zRUk3?=
 =?utf-8?B?VExtRE9sQm56YUhGL2pCbjJOKzRvYkcvNGpWMEI3c3o4YmtXK25mekg3eGhD?=
 =?utf-8?B?NFRSTTFjbGJPQXNvZWNMckRZZ2VTL1Y3dUI2OWgvTEpFOHFSSkpQVm5lRlJx?=
 =?utf-8?B?MkpscUh3YTZOcHJLbWZJNTNvLzQ4NkJ1eGk4SlorRnhiZGlNNGFXb0xzbGcz?=
 =?utf-8?B?VnpHaEh0NDNRd0s5bE1iWGhxdDRPRGJURVhQYnk3a3AzSVFYR24yalQvMlJv?=
 =?utf-8?B?bzQwalF6Y0dQaEhyakNiSDNyVCtzdlNWZC83T09mbVNMRGRHbXlPMFpxNUkw?=
 =?utf-8?B?UThQKzlzaXdFVk5vbjlteDNzRnBRTmNTa3BPTHVkWGcwRzkvTkJXbmRUanFz?=
 =?utf-8?B?VzV3YWVUKzY5VVhBUnBpK0pxdHZtS25oVnc1SmpsZW1teTFLVzRMbmlNdVR4?=
 =?utf-8?B?OEJsN3kzVklKa3ZXcFYxWm1NY1ZtYVhHMG9rQVZEaGZRNUFHblVnSS91dkNo?=
 =?utf-8?B?ZUZoVE1ZUUVNdEpubER4OXRDbVN1Q2Z6ZnZscmNvenNneE0yOHJPRkxIcVY1?=
 =?utf-8?B?T2lXU3R5bmd1TEh6N0NRSWxqMVoxVUFIMVlwaEM2Znd4bzVxZXlVL2hscmpV?=
 =?utf-8?B?VWhEclE5c1k4WTAwRW9OYkw3MnRnS1o5R09WYTZ3QVQ0bW9raVJHbHFrYlBm?=
 =?utf-8?B?MnJDTUN0L1ZKNzVnSFFOcUw3bUVIUmUrTEhFMUIwVG1jNytXWWVuWlNCNk1U?=
 =?utf-8?B?bFBaSmdCZWZYV002aXUvNlVFVjhHMmpxRFE3bFpyZWFCNFJsZnJGemVnR3kr?=
 =?utf-8?B?MmluMEk5V09wdG5Pd2s1MEJ4MENNOTkxNG1UVGlpd0tYc0pLemwySzVTWWlp?=
 =?utf-8?B?Z2NvNkpmeXM4WE1nYUZiM2JsVDIxejJ2K3ZQUHQwcUV0VTQvaGdzbGlRZTJC?=
 =?utf-8?B?OHBZMmRjdlQ1aytCVWJBekZwYWI3aUZwR2FxaU02dGh6clBGRFJGdlYxWlNP?=
 =?utf-8?B?QXVCUCtRc0pmUXZ0aTVsVDhHelFjaTRnRGVwZ0IvVTNHb0p2azRLZjlLV0RG?=
 =?utf-8?B?RC9HTVVLaW9GZnczSXlQd2FlNi9VVUNQMVQvYU9oNVJNVXc0V0FyZWJTelpq?=
 =?utf-8?B?VG9SL1VNWnZPYnlXS1JISi9qL081V1Y3L2ZwVDhPT3lveTZBWGdiVlExMXBt?=
 =?utf-8?B?SElva0NWKzNreW5oWDV6M3lUSHRuV3ZXZDliRU1HQkl0YTFESHVXSkVwYnUw?=
 =?utf-8?B?a0xpaVgxWDN6RnFnZWhUeEZyQVMrN2RmT2kzS09iUjJWRktBV21NcjdlSGhi?=
 =?utf-8?B?cDFOZElwcG1pa2sybUM1aFFOVGlVaXljYStVekxlbDdrYXBSRzU0YnNEZlEx?=
 =?utf-8?B?Qm1HNGNEMEJPaFZuemxYY09aM1krc3BHVWVRcHZwT2c1YVVvejVpVytkcTVu?=
 =?utf-8?B?UEpVd1hXallKVlJ2a3hENEZJK2FyMVFkNGZqYUtkd0NMK21udHdvOW9qU3Yy?=
 =?utf-8?B?YUpIeUhwUHhmZlpJRnpzOHJpSUIxcWRKS2k5QlJBeEJ2T3JUMmFHemY4a2Zp?=
 =?utf-8?B?YVU3Wnpsd29TbE9LWU9sVDMwNklxdExyMFZqVE05ejJ6MklSODM2UUdDMm8x?=
 =?utf-8?B?MmF6dXRwUjcrb3JkRmRlcEp1THBselJQd0Uvd0JML29WQWE3cXdRQmMyWVBr?=
 =?utf-8?B?VzhZVUp3NGVxRVZaTGFSWERFZmJQM3hyZVdCYnN1Mm1BWDE2R0taQXlyWDdq?=
 =?utf-8?B?TExWUjJRemJDaHRKSmwxVkFQYXg3d1hmQ2RVVi9MRzdsVkNSY1pMYWIyVXBo?=
 =?utf-8?B?aFJMSzlpZER5WlltZllVNTY5UFIwOFF2UUZHeXpwM0RnZXVMazUzSjFBbmhy?=
 =?utf-8?B?bFFweWg2N1U2WUFMMnNLK1h0K2FyVzM1Q1JVYTh5TGlZRTNDcHczUm4wdXdP?=
 =?utf-8?Q?exd6ztXMQGVy76TI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8AB9A7869F21447A71F6D5D895D0B17@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ejw9t4LSzc7n1pDENO/3USUnPwew5H1h008U7uJXEI/P05ChW7RK+XW5aHMWQrh/eSlIHOKsMKNv9JXyaMYylAMOVeKUyi7A7IOpur7HoXdtsttgbMaAoBx5cch+Y/fkPJBYbFH+a/ZzqG74eYdfbnAALvSsYFLgb2Q/eK5GjapeHWQHZcG8ZjO8kSK+4/0pAB/IUy1JKJdG1Ni93+YpC98KfwjrRtX4XZ4MAX79zuazhY7RfL9huD3YrGWCu5LU1i5HDlX4o6+fW7pDHXXH/Iatb45gPaQMY/ZMs8jMvi7OFyjJjjaaChh9Z4t6ZTl8olADqTFugXV9t49EPKqu/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd91320-ea19-48b5-bad1-08de74e99fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 03:46:29.0721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VS9s7msD670e34nsNQLHM59t7h5fqW5pG7RxRZ/f2QrkzBXZQJE3gXMugoTJz27V4K60HCxIOOACfqy2fvZnHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7060
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_194641_018792_CDB873E2 
X-CRM114-Status: GOOD (  13.43  )
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

T24gV2VkLCAyMDI2LTAyLTI1IGF0IDEzOjQwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSW4gbXkgb3BpbmlvbiAiYWhpdCIgaXMgd2F5IGxlc3MgcmVhZGFibGUg
dGhhbg0KPiAiaGliZXJuYXRlX2lkbGVfdGltZXIiLg0KPiANCj4gVGhlIGhpYmVybmF0ZV9pZGxl
X3RpbWVyIG1lbWJlciBoZXJlIHN0b3JlcyB0aGUgQVVUTyBISUJFUk5BVEUgSURMRQ0KPiBUSU1F
UiwgYW5kDQo+IHRoZXJlIGlzIG5vIG90aGVyIHBvc3NpYmxlIGhpYmVybmF0aW9uIHN0YXRlIGlu
IHRoaXMgZHJpdmVyLg0KPiANCj4gTm90IHN1cmUgd2h5IHRoaXMgY291bGQgZXZlciBiZSBjb25m
dXNpbmcgaW4gdGVybXMgb2YgaXRzIGludGVuZGVkDQo+IHVzZTogaXRzDQo+IGludGVuZGVkIHVz
ZSBpcyB0byBzdG9yZSB0aGUgKGF1dG8pIGhpYmVybjggaWRsZSB0aW1lciwgYW5kIHRoZQ0KPiBt
ZW1iZXIgaXMgY2FsbGVkDQo+IGhpYmVybmF0ZV9pZGxlX3RpbWVyLg0KPiANCj4gSW4gbXkgZXll
cywgdGhhdCBtYXRjaGVzIDE6MSB3aXRoIGl0cyB1c2FnZS4gTG91ZCBhbmQgY2xlYXIuDQo+IA0K
PiBSZWdhcmRzLA0KPiBBbmdlbG8NCj4gDQo+IA0KDQpIaSBBbmdlbG9HaW9hY2NoaW5vLA0KDQpJ
ZiB5b3Ugd2FudCB0byByZWZlciB0byB0aGUgQVVUTyBISUJFUk5BVEUgSURMRSBUSU1FUiwNCnRo
ZW4geW91IGNhbm5vdCBvbWl0ICJhdXRvIiBiZWNhdXNlIHRoZSBVRlMgZHJpdmVyIGFsc28NCmhh
cyBhIG1hbnVhbCBoaWJlcm5hdGUgbWV0aG9kLg0KSG93ZXZlciwgIkFVVE8gSElCRVJOQVRFIElE
TEUgVElNRVIiIGlzIHRvbyBsb25nLCANCmFuZCB3ZSBvZnRlbiB1c2UgImFoaXQiIGluc3RlYWQg
KHdoaWNoIGlzIGFsc28gdXNlZCBpbiANCnRoZSBVRlNIQ0kgc3BlYykuIEZvciBleGFtcGxlOg0K
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTkuMy9zb3VyY2UvaW5jbHVkZS91
ZnMvdWZzaGNkLmgjTDk3OA0KDQpTbywgaWYgeW91IHdhbnQgdG8gZGlzdGluZ3Vpc2ggaXQgZnJv
bSBoYmEtPmFoaXQsIEkgc3VnZ2VzdA0KdXNpbmcgYmFja3VwX2FoaXQgb3Igc2F2ZWRfYWhpdCBp
bnN0ZWFkLg0KDQpUaGFua3MNClBldGVyDQo=


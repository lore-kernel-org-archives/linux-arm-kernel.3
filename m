Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB37EFD237
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ra44EwnmeldxvAaYWZVkhx04lLH3sVH3Eas9a3rGak=; b=OQ0USuMp2x7ZO0LMtM6LHrLPBm
	FmbngVt1CnbIGVrAqmCz0NHGRo66DzFN6/KHgjy5N4kPYkg5hBuZVV5n5fciFA85XTjQgeIJLJ6gs
	1R+f9LzUc7N7B5jxq/WLbmwkEpObb5MVMoNDXiLEXpg1smEt1dYx+QfgSgR9k1fX/DsB5slvRzTtm
	u6khAza78+F7eM5EApdRMtbzAfmqkLqlV7nQOtE0m9atvmzB6+H+4o8mI4zr1Ic6Gs/97a8991C2d
	4S+XLJLEBtLos/sag4UoRHSvthNkNUOLd6f05FTAXP1uyFbaTzxvDsyZ60d3yrOng/Gadq+G8WZx+
	gW3kv49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBNn-00000003i6Z-0DFB;
	Wed, 25 Feb 2026 09:40:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBNl-00000003i5t-0nkI;
	Wed, 25 Feb 2026 09:40:38 +0000
X-UUID: 06718db8122e11f1a16f0188aa809bee-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0ra44EwnmeldxvAaYWZVkhx04lLH3sVH3Eas9a3rGak=;
	b=ZzcHSNVakablj4CYiDaIop2hJzrZNfvKmNw6R93RW/HdF91vGO+tEGgiSes+32yJODVwcrkICizSL+O280abRyaa59+PNF1a6PMnPkrU2+Nw0iCeVarneKYLN7ZXIhCilMvBXYt95Nn6j7aeuXDvFHNmd9vcNov+Bc0H6U/QIrg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:31b81615-94a4-41b7-bed5-075063fed7fc,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:89c9d04,CLOUDID:3217417b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:4|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06718db8122e11f1a16f0188aa809bee-20260225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1403292839; Wed, 25 Feb 2026 02:40:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 17:40:28 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 17:40:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyuCkvbPXWaXDYym4ha41J5+opxITSFowqjpGZbyFQB3IkmiRd+r7A+wgowT+e+9xmcXGdqKOVa4n4e5TXfJ+FBvaJT3rHGBq8XYVytRhfzU5mjTrgZBvSTuvySTOGAPiJPzX41Xa9/lQizpwxQdRr4wChzrdYGRPrJl2OvBOoZ2BiUyxXJ/A9cSJcch1FQzpbwKqiZgWv52I6zYrnw1i8TLIxqfoPIuM2iMf3pWwFiXdZkg/gtUeMDuMMCGNXFGR0pbxS6pCcs2yEP1so3lcwCSeNi5t4V0H/xjw8w9RvNbKZV2hwUJVrtk1574ft4LsGSLJScqRNx++OkysWnICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ra44EwnmeldxvAaYWZVkhx04lLH3sVH3Eas9a3rGak=;
 b=AprV8a4LjMCGgoD9tKYvr5lfe2Ix3zKExuAE/UnKk5L25aDwmnqB7maZ+Zmgq2w9o8FWiWx64OvFbVAzznHDN/xBQsz7UsEv+W+JtguxgvluSRO+RcG3mmHvEX00TD8HUfxbCe51dAbpKhvTrHRRNRfxubmfY3Yw6v0OBmvOXaR6qnwo5EkY7EgnBLCOAZVAz1d9p7YUmPWCsv+vyLA+0rq0roYJqCaaGQ4oQUEUAmAz7Rna3S7rSJmOrhAAITset6IFhRFj8pWNYWHBChwGNWxl4an67+ufUf6QYs+TIhf/8pxuulNrhRy6cZdy0Y2HSLzd7AHkEuuJRiUUGibscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ra44EwnmeldxvAaYWZVkhx04lLH3sVH3Eas9a3rGak=;
 b=Gd/nxLXgKte6saEdFJ3PbLGTeott4Hy7yn+TqO8b7iOefctGwNDv4UYp0e19KDP9GrKZRfRo8qNmTWA7jT9k2OxQmQSxKOktcUm98VfbmGW/Ez8IbvFCJKz0kfQ4P4ANFR+WAg/9Vg/UVBW0NAczY/vyRLVvRmv/SAam+tDNNE4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6599.apcprd03.prod.outlook.com (2603:1096:400:1fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:40:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 09:40:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ariel D'Alessandro
	<ariel.dalessandro@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH 05/11] drm/mediatek: ovl: Implement support for Inverse
 Gamma
Thread-Topic: [PATCH 05/11] drm/mediatek: ovl: Implement support for Inverse
 Gamma
Thread-Index: AQHcdET9pde+1+r3AkuvaEgemGj7XbWTgA2AgAAM8AA=
Date: Wed, 25 Feb 2026 09:40:24 +0000
Message-ID: <223fbaf0a88971bc7834f383fd208747f35f2dcc.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-5-0cb99bd0ab33@collabora.com>
	 <e6c5ee0f34f6347176f2918e88f6958a493da104.camel@mediatek.com>
In-Reply-To: <e6c5ee0f34f6347176f2918e88f6958a493da104.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6599:EE_
x-ms-office365-filtering-correlation-id: 7464be48-3523-4e49-15ac-08de7451e6c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: YCIUiq04vmVQCJProOru5Tyux02rd3CYwtpPa7HtLgVP4aLhOV0MYNIcIBwOHAyzMM6eKNqcZUeXSvUWDxcnIFiftv/J1XgZ74BtLSVqVji3En/f4EX3sTWB/16t27zhU3EQLvrzkKfoh8uJeX7LrNfwDf/gqeOeapW36BUuvOcVBhZaW1v5wZmKAEUfLTCA8b7uAmkRmWUQeMBVZKknCnkGPeiMXsDqDHOollbDVRtGCYN6/lMThf7hbhQS7FAm7mI33ZnVh+4X04M766gt5Q86fD8juqQ+tdXrqVJAUjvoAuHMRJQLw3QbNjU9jJ5LR88uhExAitm3iEDZ/LytCQ5umObTW+GUZjGetTzH1cMHZRP0cvX1ztl//BAHElRoTNhS6Mu7clnydBZssJQYE9eZYtxBTDH/OEFsikf2WimKmOshNgG1y/UglTsQDcNBUj7pB8VMtOjMC8VWidtDLyfO+uFTSwWoa+iaBDR80+0bOmMEq8P+m9QChaelyUCMJb3KFNqz3ebDs2Rvep/P2Vevr9lN3JImKkWBBwcf3fv8FjaM2FkqLzb4bW1/bUdPEKiMShA12a0xllu8ypH1GRHIT9/tG1dpcMyzR0N1rOPwsayOwVCGmMm/x+pRTKZ7Yc7LHiKl+/jj4DJx3DChiKbwLyXeFIE8qo+B6XiPnkmQRebLl5nbwC9eQwzk2cNwoOsIl0m2r6gcmdxzo/1sns/fadajkJG4afQ0DwDkO+FAPx9d4C6GWsEzInhncvxupXym8FwPCqKJpz9e81dnm54ZpZveBrqXW+ZpuW2rP6qmebKsCNQ81giO6TlWdcox
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SExUV05hVmk0RVRqb2FSaUdaUVdqck5LVHdwdnplVmhRL2JVOWJPbkdTRWdv?=
 =?utf-8?B?bUtEcHJLOVdJV3JrRzA4aUs4OU9tWHVYNDVrUWlKM040MTlGVmRTZFE3SEtz?=
 =?utf-8?B?Z3VaNGJZVmdvL29vdnJlcFVycnlBQ1NJQ0VBTmJyR21YQmFKNmxtSnRHZHBy?=
 =?utf-8?B?QnM4S1JITEFtelhaT1FMcU5QK2xrL0tuYW9OSzhMRVI3SWdITXVMQ0hKR3pz?=
 =?utf-8?B?ZEh1R3YvTUdpTE9ZS2Y4Sy96RUVEZ3ZGYTZKTTlXaVl4VTd1TUl2c1ArdVBK?=
 =?utf-8?B?MHF3cHFsRWVVVkQvbFBmWmFhNTNPODdtVXp5b21saXdwejdJcC82M2dnQ0Ez?=
 =?utf-8?B?T1NJdFJiZFpRZVpXZlYyTEZ4YkZhaElsN1Y0YTlJYmhsNVV0NWlDbE8xdkg3?=
 =?utf-8?B?OEhTaENGVU91dGdkdi9nTG9FQlp2SVloekRnRDdUc1RCVSt5ZjZITCtscktD?=
 =?utf-8?B?OGZaVG1YRVJlN01hREphV0xmcDhVMUdBa2tObHBzSzFKbEFEaUxheVVrclJ5?=
 =?utf-8?B?RDVFSGxJR3VJRWI0bmxYRWFHMGlqK3ZBRDJVY3lYMmg2cGJaRmQzTzFuTUVI?=
 =?utf-8?B?UTZMODIyMTBOdTZpS0prbXIzeUFqK1FBMnhwVmJRZk51MENaNC80M0grVzh1?=
 =?utf-8?B?eFhPYTJqQ3R0cGxkRmoyZzgyTHRuMTlhNTg2NEJxRWJ6K3hCL0FvNUVKczVV?=
 =?utf-8?B?RmZjWFI1V0IwM2EvRWp1QzNGNkxURkpucnF5eWNZbExNanJBSUFjdGJkZitO?=
 =?utf-8?B?RGJyNGFBcnJYUkh3a1c3eUhIYjZNV1BGSWpGaHpiZXFFdTZtNEpLMGQvQzcv?=
 =?utf-8?B?OVlPemVSRzNwM2o4MUsvbDdMVno0emMrR3psVEdBZk5OVGdEbkg1MjZXOU9W?=
 =?utf-8?B?MWxnRWlvWHlLWWdJRThHdXpmOFQrM2ptRTlCNjd4MTQyUnpuWENMT3hITEFx?=
 =?utf-8?B?ekZVMlJrUTlmemFiTzJiM29vaUVlblloYldNcVdkaGptdExWQTJTS1NPOW1x?=
 =?utf-8?B?Y0Y2NklkL2c3SDdrK2lMMzd4NExoUEkyelNNMWMzSGEzMWwyc3NPOXVPN0xO?=
 =?utf-8?B?MFlyNnNSNm4zVVZGMEk5YVIyOUJ2bm1NZzVmSGF1aDFvTGZaYk1lRlA5QUY2?=
 =?utf-8?B?OXBndURSaWJqV28zY3d3MjE1dlhyejJRVElzNEYxYnhKQ2xwVXBlcjNYWE5q?=
 =?utf-8?B?ZkFWSmVOK0VtK3Y1ZS9rTndoRDlMaS96RTZjVTNnREFiZE9FclF3QUFiblR6?=
 =?utf-8?B?WlR1eGxGSkc3TkdQZ2x5ZzAxSURWQ1hjZzFtMjFNRlMwenBGbHN6ckU0MWU4?=
 =?utf-8?B?RWtJMTJuU0UxZnBzSUp6YU9OZ1BFeko3WFArd3htVHdFQ1hJSS9ZMExnemV1?=
 =?utf-8?B?bEVySDVmdmxZcVh0WTMzVnlLVDZ2TU5LWjNpTUhwbUxpUjdmMHFvZDlGMGRm?=
 =?utf-8?B?SG9nckl2WEpzbm4zZzRKNjJrcmlNejV3R3VITit3NVZJTGhqSzIwQ3V0ako0?=
 =?utf-8?B?dk9IcEJwT251MkJnQjFVVnZvaVRwK3UyNEc3VlU1UEtxbGhzTGRBQkI5TWRF?=
 =?utf-8?B?MkJzaFdLZ2xxcnNUMFFJMWtnb2RiYnNrc3Zha3JEdXBUWndQdTV0QnNEakp3?=
 =?utf-8?B?SG82RzFvUnlWK09wakhnc3pZb09QWFB4bFlwazhzSS9OaUZNM0VBU1RXU1Jt?=
 =?utf-8?B?cld4YUV4azg3OEpDaFNRNUlWdi85NG1BeEMycWRwYVZINHpZQkJXZGxwVXZP?=
 =?utf-8?B?VzZFeEhwM3NJVFFKVEdTL1pJNWN1dHFtQUREbGZOU0E3MHZ3ZUNmdzlJWUlP?=
 =?utf-8?B?Ryt0eURlTkNIdmQ3aXdjR0wxbGhNRzFOTE5oRnAwT3hDbzZSVjR2VE5VdGM4?=
 =?utf-8?B?a2VhNGRReVNwb0lyL3ZHT1U3VXNHSGUvdzFzMC9JWnFVUFhweUluWkJhVGxT?=
 =?utf-8?B?RHlJNlJySVU1RkZkUVdBeDl3UC9VR05ISmZSU0pyZWNCcWdHZGIrWkhGQW5m?=
 =?utf-8?B?bFROb1NEQUZZNlptMHdhNng4UmZFb2dZeTVkTTlYODZLMng0dW5BZXZIV1Zz?=
 =?utf-8?B?S0VWZktRYnJpaVdtQVMwQnNlTWZ4Tk9wU0ZwU3g4S0hrOENvelcwY05VcjZH?=
 =?utf-8?B?dkthY2lub1dBSVNZUTRRY1d0V3hwU0lCaGJtc3F6ekdwK2h6cXRBem8xZ2lV?=
 =?utf-8?B?clkrM09kVjRaK1NWMkVoanIyUmxlKzY1a25pQUpVd1R1UHVHbDc5b25rZ21F?=
 =?utf-8?B?MTFEQUZsaFpZNDRBbWtLRnlyY3lLU2ZJQWhySmV3eGxTM1pkWTFzZmcrRC8y?=
 =?utf-8?B?MDE2MzVIaHNNdXZtRVM1cUhPVFA1VnpYa1ZEZTlYeGRGTmw3U1o5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F425AE2CCEADC42B6E705A4762CBDDE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pW/rplD8nxYMPHrBtvvG7JNNaqFchBWtqsrN5MR/MxXJPCIKmEj67QQLHuCeDpMZaMbytPzAXIhD1HTiqbUbOdKEP/aA/pPi01XyAPqJGahz/vOxZqKH4APg4ZcZzFTZgoiPNQM7BseRh3gIIU2Toi7ugVHjkFPBP3pgxGWGsuA8y5eSfiCtsK81AwQ4aMmSyLiIK9D5Ysm8CQ1FDnw+ECseuG6zAHi4P37sxY9kmC8Zb2v8BxucTSFfNF9n+FE9385NaHcTAlyzX9Lvc7Vh762TS10duaNWzQeRNiCABwkLdgrAixOqUupNbWw5hGmUYvosakVh3UToBKNGqziN9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464be48-3523-4e49-15ac-08de7451e6c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 09:40:24.5988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRYZjtMCAooVEE0sye08Din2Jy8dKdCgjKA3fX7ScCNPOOH9We/TwkJNdOcQCPe1BDXz+O9iqHTx7+AlDrMQiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6599
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_014037_251532_D963AA52 
X-CRM114-Status: GOOD (  24.62  )
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

T24gV2VkLCAyMDI2LTAyLTI1IGF0IDA4OjU0ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gDQo+IE9uIFR1ZSwgMjAyNS0xMi0yMyBhdCAxNjo0NCAtMDMwMCwgTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gd3JvdGU6DQo+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhl
IHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiANCj4gPiANCj4gPiBUaGUgT1ZMIGhhcmR3YXJl
IGFsbG93cyBzZWxlY3RpbmcgYmV0d2VlbiBkaWZmZXJlbnQgZml4ZWQgdHJhbnNmZXINCj4gPiBm
dW5jdGlvbnMgZm9yIGVhY2ggbGF5ZXIgdGhyb3VnaCB0aGUgSW52ZXJzZSBHYW1tYSBzZXR0aW5n
LiBBdmFpbGFibGUNCj4gPiBmdW5jdGlvbnMgYXJlIHNjUkdCIGFuZCBCVC43MDkuIEltcGxlbWVu
dCBzdXBwb3J0IGZvciBpdCBhbmQgZXhwb3NlIGl0DQo+ID4gYXMgYSBjb2xvcm9wIHRocm91Z2gg
dGhlIERSTSBwbGFuZSBjb2xvciBwaXBlbGluZSB1QVBJLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4g
PiAtLS0NCg0KW3NuaXBdDQoNCj4gPiArDQo+ID4gKyNkZWZpbmUgTUFYX0NPTE9SX1BJUEVMSU5F
X09QUyAzDQoNCkFmdGVyIHJldmlldyBsYXRlciBwYXRjaCwgdGhpcyBpcyBoYXJkd2FyZSBsaW1p
dGF0aW9uLg0KVGhlIHRocmVlIG9wcyBpczoNCjEuIEludmVyc2UgZ2FtbWUNCjIuIDN4MyBtYXRy
aXgNCjMuIGdhbW1lDQoNClBsZWFzZSBhZGQgdGhpcyBpbmZvcm1hdGlvbi4NCg0KPiANCj4gV2h5
IGlzIDM/IElzIHRoaXMgaGFyZHdhcmUgbGltaXRhdGlvbj8NCj4gUHJvdmlkZSBzb21lIGluZm9y
bWF0aW9uIGFib3V0IHRoaXMgdmFsdWUsDQo+IHNvIHdlIGtub3cgaXQncyBwb3NzaWJsZSB0byBj
aGFuZ2UgaXQgb3Igbm90Lg0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQNCj4gPiArbXRrX292
bF9pbml0aWFsaXplX3BsYW5lX2NvbG9yX3BpcGVsaW5lKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X3Byb3BfZW51bV9saXN0ICpwaXBlbGluZSkNCj4gPiArew0KPiA+ICsgICAgICAgc3RydWN0IGRy
bV9jb2xvcm9wICpvcHNbTUFYX0NPTE9SX1BJUEVMSU5FX09QU107DQo+ID4gKyAgICAgICBzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gcGxhbmUtPmRldjsNCj4gPiArICAgICAgIGludCBpID0gMDsN
Cj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgbWVtc2V0KG9wcywgMCwg
c2l6ZW9mKG9wcykpOw0KPiA+ICsNCj4gPiArICAgICAgIC8qIDFzdCBvcDogT1ZMJ3MgSW52ZXJz
ZSBHYW1tYSAqLw0KPiA+ICsgICAgICAgb3BzW2ldID0ga3phbGxvYyhzaXplb2YoKm9wc1tpXSks
IEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgaWYgKCFvcHNbaV0pIHsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0ID0gLUVOT01FTTsNCj4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfYWxsb2M7
DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0ID0gZHJtX3BsYW5lX2NvbG9y
b3BfY3VydmVfMWRfaW5pdChkZXYsIG9wc1tpXSwgcGxhbmUsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfb3ZsX2NvbG9yb3BfZnVuY3MsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlnYW1tYV9z
dXBwb3J0ZWRfdGZzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEUk1fQ09MT1JPUF9GTEFHX0FMTE9XX0JZUEFTUyk7DQo+IA0KPiBJZiBvdGhlciBz
dWIgZHJpdmVyIChtYXliZSBvdmwgYWRhcHRlcikgYWxzbyBoYXMgaW52ZXJzZSBnYW1tYSwNCj4g
bW9zdCBwYXJ0IG9mIHRoaXMgZnVuY3Rpb24gbG9va3MgY29tbW9uIGFuZCBvbmx5IG10a19vdmxf
Y29sb3JvcF9mdW5jcyBhbmQgaWdhbW1hX3N1cHBvcnRlZF90ZnMgYXJlIHN1YiBkcml2ZXIgc3Bl
Y2lmaWMuDQo+IFNvIG1vdmUgdGhlIGNvbW1vbiBwYXJ0IHRvIG10a19jcnRjLmMgYW5kIHN1YiBk
cml2ZXIgcHJvdmlkZSBmdW5jdGlvbiB0byBxdWVyeSBtdGtfb3ZsX2NvbG9yb3BfZnVuY3MgYW5k
IGlnYW1tYV9zdXBwb3J0ZWRfdGZzLg0KPiAobXRrX292bF9jb2xvcm9wX2Z1bmNzIGxvb2tzIG5v
dCBhIHN1YiBkcml2ZXIgc3BlY2lmaWMgZnVuY3Rpb24sIG1heWJlIGl0IGNvdWxkIGJlIGNvbW1v
biBwYXJ0KQ0KDQpTb3JyeSwgSSd2ZSByZXZpZXdlZCB0aGUgbGF0ZXIgcGF0Y2gsIGFuZCBJIGZp
bmQgdGhlIHdob2xlIGZ1bmN0aW9uIGlzIHN1YiBkcml2ZXIgc3BlY2lmaWMuDQpTbyBmb3JnZXQg
dGhpcyBjb21tZW50Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4g
DQo+ID4gKyAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jb2xv
cm9wX2luaXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgcGlwZWxpbmUtPnR5cGUgPSBvcHNbMF0tPmJh
c2UuaWQ7DQo+ID4gKyAgICAgICBwaXBlbGluZS0+bmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVM
LCAiQ29sb3IgUGlwZWxpbmUgJWQiLCBvcHNbMF0tPmJhc2UuaWQpOw0KPiA+ICsNCj4gPiArICAg
ICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArZXJyX2NvbG9yb3BfaW5pdDoNCj4gPiArICAgICAg
IGtmcmVlKG9wc1tpXSk7DQo+ID4gKw0KPiA+ICtlcnJfYWxsb2M6DQo+ID4gKyAgICAgICBpLS07
DQo+ID4gKyAgICAgICBmb3IgKDsgaSA+PSAwOyBpLS0pIHsNCj4gPiArICAgICAgICAgICAgICAg
ZHJtX2NvbG9yb3BfY2xlYW51cChvcHNbaV0pOw0KPiA+ICsgICAgICAgICAgICAgICBrZnJlZShv
cHNbaV0pOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiByZXQ7DQo+
ID4gK30NCj4gPiArDQo+ID4gDQo+IA0KPiANCj4gKioqKioqKioqKioqKiBNRURJQVRFSyBDb25m
aWRlbnRpYWxpdHkgTm90aWNlDQo+IMKgKioqKioqKioqKioqKioqKioqKioNCj4gVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
PiBhdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVn
ZWQsIG9yIG90aGVyd2lzZQ0KPiBleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQo+IGNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCj4gZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQo+IGF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQo+IGJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCj4g
wqANCj4gDQo+IA0KPiANCj4gdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KPiBpbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KPiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5k
IGRvIG5vdA0KPiBkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQoNCg==


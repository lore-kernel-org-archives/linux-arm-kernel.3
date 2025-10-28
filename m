Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A68CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flz6COlxmOtkwI7e0coAesK08BTyIEuIdhrPYSRSoDQ=; b=VRDoYGO7NkBTKvAwqFAVHotmhj
	NbXh1QaO1u+OF/loq5HoghM9/rkyMxNYifhpP+i5ZHf38qHCk4L7+O8BrYnWqPnYuKYsXiZKNwS+2
	+GFUhOtRTMstPo2OvGacLnMIcTcAjYHZyl0yCSVLHPB8PfAAPI3yNKT8Bba78UfJ217qPf0xmEF20
	tjlBpvMY2RMq6z7XUAaTVP8b9BmFev10BvvBIt5bsfoefoLFeR9msJpLEOucRQdv5ZcaMyVRrB5Fm
	FtSMFCUOo0tiMSdWG0cCwPW8ADwpGMdJvecKkUOJgCO2/xM/5/Y3/v90qf3dEbtQ5yV0tIMI+pQug
	eM1gqzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgKj-0000000FfbN-03mc;
	Tue, 28 Oct 2025 09:49:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgKg-0000000Ffad-4B6P;
	Tue, 28 Oct 2025 09:49:40 +0000
X-UUID: 6839ce56b3e311f0a52f393f94899d25-20251028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=flz6COlxmOtkwI7e0coAesK08BTyIEuIdhrPYSRSoDQ=;
	b=cPiKM7jWGAgUsgCq3BPopPVn71FLiT3bnDe17u+8ql6gx5KiaU5Z09xIwZL5K0tqMNzgUjtXZHi9QqtKQD77ViGLoI5PLSr36a6qu0LrEmIk0YkOKGk9isMhHz65rSE22ILPu01Q6oFC9iI+Fn144vGlsBMu5OD5ZLT4UHZqdRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1a2920a8-2b7f-4aa5-afa8-bf586bf01cca,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:e08be858-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6839ce56b3e311f0a52f393f94899d25-20251028
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 109641704; Tue, 28 Oct 2025 02:49:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 28 Oct 2025 17:49:30 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 28 Oct 2025 17:49:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w586ktRU2EyT97ePlfeq0S52lWi/Rbq75Clj7zfm5T23J+F1Fq7HTQ50OlOLa1V/lllTXowPYi+lr1U0rWGyymZUedyiLpBdt9JIsFBCKDz7LOzUjOZrDGWW9Zj0PCllUJHgrMTjsk/kH+SxQ7Wbwiqq8IZfbqte4mGUdaCUSXXpYdzEF1Hk2SWPfFI0xScAoeqZxeuyn2oQvd9V811Ort4d7OKK1Hwd0YDR3RiDxYj+BOzk+9SVCdP9L+LQvVPQeFYS2a8owqVSnrOSHu1Us2LXK1KOL+TShQtPavbzKmMAhAjPBxw2C+Jzo+saocO8D9ECzwMnSd2y/TDyJK+HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flz6COlxmOtkwI7e0coAesK08BTyIEuIdhrPYSRSoDQ=;
 b=AAijk+cBak05Cns8bBYiPD0wshRyfBOeMhsBb1GeVfLpfxNUkMzZyJvTGB4vPOJG1pM2PJOneERmBbP6gc2qF/esc/Bkobf+P1jumfsJX+puRmVIAuy5e5PBsQt0vozJuVtjhBwEwYd/8ZnUhxI40oOVBQf4UFFpmMJp4ihIPWFQE26aC6DCiOVP488EDg7VyWBZV9+WNmSRpv6PMHrGD9LRC7RqWyWbx1fyokV/9OfU5iA1xNjwG3Rtw2EJuIji2iR5d25AGXOYxjtoU+mtScYgdJoy7KVsFuSamVlw+SNq4/iZnY0hp2tOtryHs3JkbS7FZH7XY2dzAVFnFrJdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flz6COlxmOtkwI7e0coAesK08BTyIEuIdhrPYSRSoDQ=;
 b=D46wVDRZye3Bj2iJS+NCYllC3z7+ubXgi8T/zXJXD+mxXxxzKsG1a85WcK/CIipRTaryvJf1d4nxZkHLDKDMWGkn92LqB/TLSQeOibVhQBqF/101SiSrosjaR+tUZaQjEHGGxlyG891FZ2O5koWE/HUCYEKmH9KUdoGqrMZiSSo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7802.apcprd03.prod.outlook.com (2603:1096:400:47f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:49:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 09:49:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: Alexandre Mergnat <amergnat@baylibre.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "dmitry.osipenko@collabora.com"
	<dmitry.osipenko@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "djkurtz@chromium.org"
	<djkurtz@chromium.org>, "granquet@baylibre.com" <granquet@baylibre.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "littlecvr@chromium.org" <littlecvr@chromium.org>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_disp_rdma: Enable/disable interrupt
 on bind/unbind
Thread-Topic: [PATCH 3/3] drm/mediatek: mtk_disp_rdma: Enable/disable
 interrupt on bind/unbind
Thread-Index: AQHcLT9PK/nnrgm20kGvP8Pr5RMRDrTXhckA
Date: Tue, 28 Oct 2025 09:49:25 +0000
Message-ID: <fb2c7169b3c3e2e376ee0b092699735dc38bcbb6.camel@mediatek.com>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
	 <20250924103708.19071-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250924103708.19071-4-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7802:EE_
x-ms-office365-filtering-correlation-id: 8059581f-c136-4584-bb90-08de160747b0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?Y1VPdmNGVHlpYW1XbTJ6M1dlQnJMK0ZGNWpMS0s4NkFxR2EydDZWMTlmcWRs?=
 =?utf-8?B?bmx4ZTJEMGMxZjZEVWtmcmI4cVRwYkhpRGFNWDMzMUI5OG9TUnRiODQxdFM1?=
 =?utf-8?B?VTJzcFM5eE9tQzRlL0tiOTFCcURseWJ2NmdTTjhsS0FMZVNEYXdRMzdmdlRx?=
 =?utf-8?B?dzNtNjkrVGlsN05acXFzdkxOZ0wybUNNTFQ4UmRQRXI5Q1p0ZmY5eVM0N0FW?=
 =?utf-8?B?UDN1U1FPbWxRZEZjTWdzZWg0UzlJUU1LSnJPSC9WYXhReUhXMDRoeFlLVk9j?=
 =?utf-8?B?VXZlUUhLMk9hWjZURmlDU3dtODN0VTlVVllHUWxJdnRvZkY3emxweU1lWkhk?=
 =?utf-8?B?SVovenF2Y3VuOE9OYjMrQm9xWnIyQUYyb09DT0lBYkpIRnREUEZKRDFDQlBI?=
 =?utf-8?B?WFQrWUU2TFNzVEFHTTBJWk4zSlJLczc2Z2tGcUZwVHllaytKZ1U4cGptZUZ4?=
 =?utf-8?B?OVFLTFR6NWFiS3dVWjdoYUFRajVlazZpZzFaNTlMQmgrd3VHQUxlRDlBcmxs?=
 =?utf-8?B?THQrTjdOYWdBdWFKc3FvRnF4YWJ6SGt0RU15dU5ZQzNYUG9pWEZyTTJzcnZM?=
 =?utf-8?B?MkQrZ2ZsUWh6VWkxbUIrTWZKNW9ETitsenV0Q09tQ3VncVBseUN3blFnZk5E?=
 =?utf-8?B?eGs2dVArL1diVmVDN2VaVXNmYXF1SXBicFhXREdTRy9td1NqOGxQUkVzUXlP?=
 =?utf-8?B?K2taZkVIbzhuRWUrRTN0dC9MSjVjN0NzU2ZYYXUrZlgva1cxS0FsRVlsUzlW?=
 =?utf-8?B?a25uSFgyU2xuY2crRWNYN2pHTngyaWUwQWRRaUZOalQ5amMzZVJZSGVvNXBX?=
 =?utf-8?B?aUJKUDRqK3dvcWtwd0xjb0UvRjNIdnFkUGxyckphN2phayt3YVZmY2xTVnR5?=
 =?utf-8?B?RGlHcjZJNWpiLys5ZktaSHZGWXlUbTVMYzlBekRvSEJIMDNMT3dNVnJmcmFJ?=
 =?utf-8?B?bC9NWDdNaWtZV3ZKYzRVU0E2NXVTdWIzOWp1TURnTldrZUlCVDdnMDFvcXFk?=
 =?utf-8?B?b1lmaUNRNWpLTmJWSnowYmNhREUxQUg1UFhSNzNOQ0lHTXdEeWpiY0ZFaWZj?=
 =?utf-8?B?T1lqUTRwMEN2dkl4TGN1WTZsVTUrUFh1WTMzNTVkdEN2ekd6TGdwWVVCOXRy?=
 =?utf-8?B?MkhNeEhycyt5NHNTaEFlNVJieWJpZzlnWWNRTmNjQTd5SzFnWGpnamtiM0ty?=
 =?utf-8?B?aktKb2N5dTl5TGJBWmcrdXVkYURpcGdzNll5LzUwVTAxUzhzdlkxV3llQ1l4?=
 =?utf-8?B?ZlVWN0JGS3Z3bnErWkJyMldzd3B2TS9NWHZlWWpNQlJ1S2h3WnlWZGh0cGpD?=
 =?utf-8?B?QW5WaTQxRjNzV0Z4TmtqajZzYjNUUHJyM0tOTVlYL2ZWR09rdmNLOVp1TGEv?=
 =?utf-8?B?MXNBOVhMWm8zZXVMMjNEVmFYZ1A5eGJRWnpHTmh1bkVHUlZ2N1dDTjVCbm0x?=
 =?utf-8?B?UEg0NC9PRm05Ly9CWW9jd0g2UVBxdmRTV0FjSjVHRW1NYWROQm1JTExJNFk4?=
 =?utf-8?B?eVNYYTJtdnJEamFiRk0xcGc3NTlNM25hcFZmbENXNnc2amx0eHl1TlBJM2o0?=
 =?utf-8?B?VEpWcjRReDM5enFsQWRSYkhia043dUFieFVLSUZZSnhmZ3NGYjRBQ3c1UFdH?=
 =?utf-8?B?UTg3Y1BSU3FGMDJ0MWxMRjlxdUVFRDc3QXZCZHZ4bVVVVVJ0dE80N3BZTGNB?=
 =?utf-8?B?VWdKb3hyazk3QWxsSWg2Ri9CVjZCNDJNY3VmRi9LTVk5aXlBbGYxOWtLTUp2?=
 =?utf-8?B?VWY5NS9XRWZZazI2ZTl1Zk14WGltZkpxUDRVTjV2TU9qdC9IQWpnL3FqUm83?=
 =?utf-8?B?d1VISGU5OE5GWkFhNFZORlV5MVBmbmw5eUZxZ0R4VHRVSk1BMVhWOGV4U3BD?=
 =?utf-8?B?WHVWY3RDYXZaM2Q0cEdLMzNvek9pengvczd0T3VmcytOcGdLTm1mK3A5dS9Y?=
 =?utf-8?B?ZmFXVUlOMGRxRDdCVTR1dlZZSWhOYlFQSkVHbWJ6c0VDZTJhOFFmcStIemw4?=
 =?utf-8?B?RmNpVGpjV2tKZVZMODFYRGRrYmRCbnovRmRNSXNGQXIwdGZkYlNDd1lJK1Zm?=
 =?utf-8?Q?ZjJYB1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjFvNmZGTDNITzRmd1F3RVN3Q2JVUEs1L2R2VkRjMVRjL1VGVnBGcGFQTi9S?=
 =?utf-8?B?OVB2NlNzUkx0ZVovWkZJaXVvdHRPZU5ZYU9wakNNaThzdzVKSzBieVREYndO?=
 =?utf-8?B?WXV6ZlB2NTVvbjdBM2NmZVd2RHcyaUxDcjBVUlpVMTJTM0ZiM2FlK1FaZkk2?=
 =?utf-8?B?SUFlVkJCWmU4dEtkUGI3Tlo5TFBTMXVtVytFQ3BjYXRFc0tQWWNJRFFReXU2?=
 =?utf-8?B?SlN5bmZFdW4vZXM0aEx6c2prNjk2YjNIZDhuTGRIVm54a3NoL2QzSUZiVkZX?=
 =?utf-8?B?NnRYRkQwNXV6NE13bmVYZ1liRU5xT2Z1c1NWMG9RWnBEZldmL2FGZXo3ZTdE?=
 =?utf-8?B?L1RIalQyZjQvaVEyVENLN1lJM25oOUpCMXg4Ly9HazlxeUFUMGMrRGJRVzBt?=
 =?utf-8?B?Z3lYQVBOVi9zeEp5eXhNV1hza0NSMWtWOGpDcFI2U2F4SmovcFJjNFo2VjBr?=
 =?utf-8?B?bWhtNmJGaG01ZXNKbGszVUhhZVRwTXpjYm54OWx1QmZKdk9FL05OaDBkSHVF?=
 =?utf-8?B?RmFscllvWkdtK1NFS1grSUlrZEJCOWkxWW5vUUh6SytVOEIxSG5rVE1BMUdp?=
 =?utf-8?B?MlpXeWM1cGhMTGxmc2tEZThBTnFCR2h5ZXEzTGNQK0hoeDhPVDhRQkFLL1Jy?=
 =?utf-8?B?c1NqeDVlcUJOUzRXYWd4M3l5b3ZyN3QrZjZmQ21oK2ViUjRIVTFrVlFoZENq?=
 =?utf-8?B?ZnlBYW1aNis2eFdzbVpmVXRoUVlDQktYdXpVSS9tdjhPcVlUeDY5MXJiTnkw?=
 =?utf-8?B?WU5MSVBwcjNtSU9XTXNYUXN0ZUhDYWM3MDVMZy9pOFVBMThyTjNrczB3ZlVJ?=
 =?utf-8?B?clVVSi95cXhpS0Nqd2ZFM3I1Q3B2ZWlaRjFiRlpLK0swVGpMbGkvRVVGRS9O?=
 =?utf-8?B?QmJRVHFIeGhOOE80K3piL3JiWHNVYktVbnY1eml5OEx5cWhUUmdQZFJ6RzR3?=
 =?utf-8?B?TzJFRlNJMFFha2hSRFZ0cXlmYWJoYVp6YldSU0VtWTBRb21TUEtPc3B0VUdM?=
 =?utf-8?B?SGx3SmtHZHF3WXl2bHdpRFpWckdqQks3NVB1cjVqMzgyVkIzMkc2Y2ovYWZ5?=
 =?utf-8?B?Q0NTTWJqUkRCN1Qwb1VDUkhJckpzY1U3SktnNnVxNzJuSnFvSUljSGR3cDNt?=
 =?utf-8?B?ODdCZm1zNGdlUVRVWDNza2NDQnBEaXBZVTlmYUhldTdMYUkrN3FlVlk4VW4w?=
 =?utf-8?B?dEZrYkxYUitlZ0h0SXlNM3ROVUU2c0xaNVBIM25rOGQ2UkY3WGNkOEhxOFhx?=
 =?utf-8?B?MUxpUnMvQUdoVTlqdzNmdGFEWHZNeUc4aVEweDNJdVh4d2RmRFNqOXVhUjg1?=
 =?utf-8?B?akJLYTlBalcxNDZXTnZKWTFuekJXWnJmbGV5bGprN25xbkc5dmhLRy83RlVP?=
 =?utf-8?B?bjJnVDRybjFmZ3U4ZEUwTXRiMmQ3WEVXR0hCd0FnQlhXWEdaa25BYjNGNE5S?=
 =?utf-8?B?NkhmTE1xZmloM2pYUGNJVjNIamJrK09STDFPVzB5RmVuSlk0UWpnelJocW1C?=
 =?utf-8?B?MnNrVmVBMDViMC9LRDV6NGhGU2t5Z1MvSUVmNXFXZzZWZ3JzbWRvZjdEYk91?=
 =?utf-8?B?QkFVa0RzQ09LU2V6Q08vdUw3eit2YkRhVVF3V291M0tzanB1cWV3NkR1Uno1?=
 =?utf-8?B?ZThrSm1yYWxTOEFJRjJGM2UyOG9wMlMyemVWVmE3N1Nmb0ZjTlBKa2VPRzJE?=
 =?utf-8?B?QU9HN2VocG1xZWZNVWZBM0NUSTllMy9pRXlMZWdnU2RJNlF5MnE0UitvbG4r?=
 =?utf-8?B?Mm11ZmJWc0RPYjd3QVZNcUoxeFBrMDZLUGRZcGtVTmJva1FqcFhNdUpqT21m?=
 =?utf-8?B?aVRkNkZqbUxyYUY3S1Z1UWRBTVVhcDdIQ0tOdmdzMVBnckRUdE9lanQwM2Fj?=
 =?utf-8?B?MWdud09Tc016TWNDNXgzMWQybzVMc2JZQU5PcVlWZG5mSzQzb2hnSlZRcjJ2?=
 =?utf-8?B?MkpEajgvMFd4eDZJVXVxWlpyQ3RsbXpVL2FLcFpWYW80OU9iS1JzRmVXSGZy?=
 =?utf-8?B?QkxkVGtONjg5S1lTdHBMaGJZZFlRbm80RzI1T1I0OXNaYzJxUzdBUGYwM0xY?=
 =?utf-8?B?aDNrcXFDSjhBVHdTYjZhSHdDdmErOVFSTW05UEJIRHFxZisrV3ViQytmYnJC?=
 =?utf-8?Q?D6sztWaka4KDBpOdJicuaJQ5I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F39E3A453149854A9D006883CEB1712B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8059581f-c136-4584-bb90-08de160747b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 09:49:25.6091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qD0bj15/4JFyN0ktnvkMTZ2pb7VKQQCdPOsfGC+YpXVWI36ekwtNKiqnbAtsE5+Dejk3wzcl50WkMHpE+sy+9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_024939_055246_46216292 
X-CRM114-Status: GOOD (  21.23  )
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

T24gV2VkLCAyMDI1LTA5LTI0IGF0IDEyOjM3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgUkRNQSBkcml2ZXIgaXMgaW5zdGFsbGluZyBh
biBJU1IgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIGJ1dCwgaWYNCj4gdGhlIGNvbXBvbmVudCBpcyBu
b3QgYm91bmQgeWV0LCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgbWF5IGNhbGwgdGhlDQo+IHZibGFu
a19jYiBhaGVhZCBvZiB0aW1lICh3aGlsZSBwcm9iaW5nIG90aGVyIGRyaXZlcnMpIG9yIHRvbyBs
YXRlDQo+ICh3aGlsZSByZW1vdmluZyBvdGhlciBkcml2ZXJzKSwgcG9zc2libHkgYWNjZXNzaW5n
IG1lbW9yeSB0aGF0IGl0DQo+IHNob3VsZCBub3QgdHJ5IHRvIGFjY2VzcyBieSByZXVzaW5nIHN0
YWxlIHBvaW50ZXJzLg0KPiANCj4gSW4gb3JkZXIgdG8gZml4IHRoaXMsIGxpa2UgZG9uZSBpbiB0
aGUgT1ZMIGRyaXZlciwgYWRkIGEgbmV3IGBpcnFgDQo+IG1lbWJlciB0byBzdHJ1Y3QgbXRrX2Rp
c3Bfb3ZsIGFuZCB0aGVuIHNldCB0aGUgTk9BVVRPRU4gZmxhZyB0bw0KPiB0aGUgaXJxIGJlZm9y
ZSBpbnN0YWxsaW5nIHRoZSBJU1IgdG8gbWFudWFsbHkgZGlzYWJsZSBhbmQgY2xlYXINCj4gdGhl
IGh3aXJxcyB3aXRoIHJlZ2lzdGVyIHdyaXRlcywgYW5kIGVuYWJsZV9pcnEoKSBhbmQgZGlzYWJs
ZV9pcnEoKQ0KPiBpbiB0aGUgYmluZCBhbmQgdW5iaW5kIGNhbGxiYWNrcyByZXNwZWN0aXZlbHku
DQo+IA0KPiBGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlhdGVrOiBBZGQgRFJNIERyaXZl
ciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQ0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjUwNDAyMDgzNjI4LjIwMTExLTYtYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyB8IDM0ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+
IGluZGV4IGM5ZDQxZDc1ZTdmMi4uOWZkOWJiMWVlNTQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gQEAgLTgxLDYgKzgxLDcgQEAgc3RydWN0IG10
a19kaXNwX3JkbWFfZGF0YSB7DQo+ICBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYSB7DQo+ICAgICAgICAg
c3RydWN0IGNsayAgICAgICAgICAgICAgICAgICAgICAqY2xrOw0KPiAgICAgICAgIHZvaWQgX19p
b21lbSAgICAgICAgICAgICAgICAgICAgKnJlZ3M7DQo+ICsgICAgICAgaW50ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpcnE7DQo+ICAgICAgICAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyAg
ICAgICAgICBjbWRxX3JlZzsNCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYV9k
YXRhICpkYXRhOw0KPiAgICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCp2
YmxhbmtfY2IpKHZvaWQgKmRhdGEpOw0KPiBAQCAtMjk1LDEzICsyOTYsMjMgQEAgdm9pZCBtdGtf
cmRtYV9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0K
PiAgc3RhdGljIGludCBtdGtfZGlzcF9yZG1hX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlICptYXN0ZXIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQg
KmRhdGEpDQo+ICB7DQo+IC0gICAgICAgcmV0dXJuIDA7DQo+ICsgICAgICAgc3RydWN0IG10a19k
aXNwX3JkbWEgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKw0KPiArICAgICAgIC8q
IERpc2FibGUgYW5kIGNsZWFyIHBlbmRpbmcgaW50ZXJydXB0cyAqLw0KPiArICAgICAgIHdyaXRl
bCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19SRE1BX0lOVF9FTkFCTEUpOw0KPiArICAgICAg
IHdyaXRlbCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19SRE1BX0lOVF9TVEFUVVMpOw0KPiAr
DQo+ICsgICAgICAgZW5hYmxlX2lycShwcml2LT5pcnEpOw0KPiANCj4gKyAgICAgICByZXR1cm4g
MDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBtdGtfZGlzcF9yZG1hX3VuYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4gIHsNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX2Rp
c3BfcmRtYSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArDQo+ICsgICAgICAgZGlz
YWJsZV9pcnEocHJpdi0+aXJxKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNv
bXBvbmVudF9vcHMgbXRrX2Rpc3BfcmRtYV9jb21wb25lbnRfb3BzID0gew0KPiBAQCAtMzEzLDE2
ICszMjQsMTUgQEAgc3RhdGljIGludCBtdGtfZGlzcF9yZG1hX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYSAqcHJpdjsNCj4gLSAgICAg
ICBpbnQgaXJxOw0KPiAgICAgICAgIGludCByZXQ7DQo+IA0KPiAgICAgICAgIHByaXYgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4gICAgICAgICBpZiAo
IXByaXYpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IC0gICAgICAg
aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gLSAgICAgICBpZiAoaXJxIDwgMCkN
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBpcnE7DQo+ICsgICAgICAgcHJpdi0+aXJxID0gcGxh
dGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gKyAgICAgICBpZiAocHJpdi0+aXJxIDwgMCkNCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBwcml2LT5pcnE7DQo+IA0KPiAgICAgICAgIHByaXYtPmNs
ayA9IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOw0KPiAgICAgICAgIGlmIChJU19FUlIocHJpdi0+
Y2xrKSkNCj4gQEAgLTM0NSwyMSArMzU1LDE3IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcmRtYV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgIGlmIChyZXQgJiYg
KHJldCAhPSAtRUlOVkFMKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgcmV0LCAiRmFpbGVkIHRvIGdldCByZG1hIGZpZm8gc2l6ZVxuIik7DQo+IA0KPiAtICAg
ICAgIC8qIERpc2FibGUgYW5kIGNsZWFyIHBlbmRpbmcgaW50ZXJydXB0cyAqLw0KPiAtICAgICAg
IHdyaXRlbCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19SRE1BX0lOVF9FTkFCTEUpOw0KPiAt
ICAgICAgIHdyaXRlbCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19SRE1BX0lOVF9TVEFUVVMp
Ow0KDQpQZW5kaW5nIGludGVycnVwdCBpcyBjbGVhcmVkIGhlcmUsIGFuZCBpbnRlcnJ1cHQgaXMg
ZGlzYWJsZWQgaGVyZS4NClNvIHRoZSBwcm9ibGVtIHlvdSBtZW50aW9uIHdvdWxkIG5vdCBoYXBw
ZW4uDQoNClJlZ2FyZHMsDQpDSw0KDQo+IC0NCj4gLSAgICAgICByZXQgPSBkZXZtX3JlcXVlc3Rf
aXJxKGRldiwgaXJxLCBtdGtfZGlzcF9yZG1hX2lycV9oYW5kbGVyLA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSVJRRl9UUklHR0VSX05PTkUsIGRldl9uYW1lKGRldiksIHByaXYp
Ow0KPiAtICAgICAgIGlmIChyZXQgPCAwKQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gcmVxdWVzdCBpcnEgJWRcbiIsIGlycSk7DQo+
IC0NCj4gICAgICAgICBwcml2LT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7
DQo+IA0KPiAgICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOw0KPiANCj4g
ICAgICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiANCj4gKyAgICAgICByZXQgPSBkZXZt
X3JlcXVlc3RfaXJxKGRldiwgcHJpdi0+aXJxLCBtdGtfZGlzcF9yZG1hX2lycV9oYW5kbGVyLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9OT19BVVRPRU4sIGRldl9uYW1l
KGRldiksIHByaXYpOw0KPiArICAgICAgIGlmIChyZXQgPCAwKQ0KPiArICAgICAgICAgICAgICAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gcmVxdWVzdCBpcnEgJWRc
biIsIHByaXYtPmlycSk7DQo+ICsNCj4gICAgICAgICByZXQgPSBjb21wb25lbnRfYWRkKGRldiwg
Jm10a19kaXNwX3JkbWFfY29tcG9uZW50X29wcyk7DQo+ICAgICAgICAgaWYgKHJldCkgew0KPiAg
ICAgICAgICAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+IC0tDQo+IDIuNTEuMA0K
PiANCj4gDQoNCg==


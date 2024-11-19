Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B508D60074
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=; b=Uk7fRPNOdAMLVB8bxVA+Sjo4B0
	ExL7jWYlK2CqQAP2mDe2mkXc6uTOXEinS7Sxr8HZkEOO5U6XLbWT590LySudsL7D+tiEnfsGjDdV8
	kAq+Tu3P6v7Q0o2tkVwwVbVtu+TLSkbLa1RqCdkmhzv4x4tVcJUoMhDTkyE/vwFG7uLEIZFd4OMvi
	txDKvA6xCaC1R0BLVjS+Hfx7MsZVOhatjj1eMH3zb+iLRcNOyjOQfvdWk6qMQ4zOZkU8BClJ5arXq
	ourOVdWNOUwVSm1QZrPIcuS/f/RSAx/oq8LCvg8G8xXCUdXvBFqvT16+SeGLOQrgMUltQ+t3jfYEv
	HotRT+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJdP-0000000BlQl-0O7A;
	Tue, 19 Nov 2024 08:30:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJcT-0000000BlCz-1E9w;
	Tue, 19 Nov 2024 08:29:58 +0000
X-UUID: 736b5d0ea65011ef82ff63e91e7eb18c-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=;
	b=jHT91KKN7PO5PQ79TgGtfHmx02Q1/c5IKEsaFXCaGnYqRuwVrzj8uCNaq21G8/7kkssEenYP7KShda6x0ME7elpeF0pwn2TDYrJ5Dj586L2ZCKqd19ax5X3oxebbi2trkg2hrSBWQC1zHDSrbXFIjZqYMqETECbl9BleLmZdkZg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:70bcca83-adc7-4466-b11e-040e3693450e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:a1555107-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 736b5d0ea65011ef82ff63e91e7eb18c-20241119
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 78607490; Tue, 19 Nov 2024 01:29:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 16:29:50 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 16:29:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFKfRRd6CPSMFFYc7Q404IhBlHk2OlQMApiHVNc1CoFSaAEZKl00fGsSZpfcNPKj1CAZfFtTiRpOJAFq8/TdFzz02C+I4qFToubraYBQw6N3gZmLcxkkwZpp1rqgBA17OdGAbT4zuLYAQn41mA+parx3SBNVHofFHHBNSPJN/uKJhmQHKMzp4vYJuhz3DFMBjW1qZj2PGqq7v66kYG6hNBU69YldZkwswtJdVSy4wTnu/Tm1//4gdOZMoej8L4HS1py4rZ/+rlv8himRtv/XBB75DNEAO3GjITNZ11kNMG9VfGpbcZpS4Kukt/8iIHBfYRmE0vxG9aA2Aa3c9+Hviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=;
 b=IWZMAPuXGAObkx9Abg9WoydK8fD5jUMGBimn8eEs25bXlD4Pppch5S3ZOT8Tt17NLh4ogARJCArdKtMVIMQ92s/dWgeUrcwWiyiAJBZ3N63XWYyx3fZtdCW3SK3iR/+5/5TT1hnu5g164cjJMeMO4iOcxpsFylX539y6zX8UYae2DbfCua9fqqmcTtTpH59QSaf0UZck5nUy2eV0XWrVBJaak/XDZoxeFRZQfIcPMGs92mrzuSSahsI8KvXwMAVVWXgctxdDk1puM/9x3WUPoWgN92gzBx+Rif54UVCAnZBkBY2/1bulhJR4jwmwiiHO/EtDh+wA22rElraDiaH7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=;
 b=Aqvcj3z7cYWaeL3kEOwTyzU12qEfK76z1kJCMY9oMOZBvL4ZgD3Tqiv+HoHbTYud9Eop04aO+MjWtdVD2I3GLLEl3bV3ps/tmWb2M3oy0geIaDhBxm+9dRel/h7udT0Qac9HRi+YU/futcS4mYrHcMn5CjS0p2ugwYFgx/mx+JU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 08:29:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 08:29:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK+heeA
Date: Tue, 19 Nov 2024 08:29:47 +0000
Message-ID: <cda227f98dfa4262882d2866b9bca47007076f03.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6688:EE_
x-ms-office365-filtering-correlation-id: 011eb7fc-ebfd-4472-b4e3-08dd0874544c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eVp4VkE1alVOWVdJUkpFenJtc0JRelZNUGtFVGJQcWFjQWhSUlhSZ2NMS3dB?=
 =?utf-8?B?ZTJ3azlHQmk5dXFSZW42L1JjTWY5VTllTUVIVndMREt4R2NZeFpzNkx4SW9K?=
 =?utf-8?B?MFRJYlFvTVM3bHM3a3dUSHlvNFNkdnBOK1FBYlRCMFVva1E0TncranBldWhx?=
 =?utf-8?B?ejhNdXFZN3dFWVlwbnQrNnd6eXpzekZtZTdHNkptWWJsRlI2VXBSQ0RsaWJN?=
 =?utf-8?B?cU1tMHZrRFBpaE1ydHlZYWRtYVRMQWJzS1pMbk1kdDZ3MkR6QUxXa050OUVI?=
 =?utf-8?B?RkxtRERKbllQU1F1U0p5bWpJbHRFNkpBQ0dYTU5DbThYYXl3V2lMd3dRNGFM?=
 =?utf-8?B?Y2s0dHJWTkF2cWtNcEJIUmpCa2dyWW9WS3ZyVXdBK2JUdXEyM3hOVER1L05z?=
 =?utf-8?B?c3UwYjhHSExaRk9yN2srVEFJS0w2MzFEbm5JbkY2SHpycC9uWXZoYnpqMUlP?=
 =?utf-8?B?eXpFQ0NDYWVVTFZXZ3NWVHVUdWxCc3hwM1d1N0lhUTJncWY4NkIxZnpFWHRv?=
 =?utf-8?B?K0c0MzdiT3BabG5kSU5tYXhkYmlXbXRHRkpIR05GK1U3TFdwY3pKUnVoeVlv?=
 =?utf-8?B?M1NnWlZCMm5Lckk3SWY2bzFldnJQRzZPbldWTFZpN0FZRTVpT2dQdVd1RWZZ?=
 =?utf-8?B?RWxtVHRPMnRvMzFaZkxuNWJJZEplYWNtYlcwVkpHYzNsRk1KekpLQnZpWXBu?=
 =?utf-8?B?R3k2WDJYaDM0MGwycXk0a2RpVWprbW8xaUFYcmtQVFppR2JhRnZlVUtpay9M?=
 =?utf-8?B?YjJwUlZKazZEVkVoZENWYWg1eWU4RjJFcGZ3dVJ2NVhoVFhkaERybUduMjJ3?=
 =?utf-8?B?d3YxYlN6WlJ6V0RxcHZwcGZoSDg2bXMvUmJad241WklFS2xlNUMxUWxYSTBv?=
 =?utf-8?B?aTdzYnI0c1dmcnZHdVJobGF2TDdKL0dNbjgwOUF1WmlQQWxlYVkwcUFySEp6?=
 =?utf-8?B?bXpNWW1nK25GZUI5Nkk0M1lSdkhhTXlDcCtnTGJtMmZkdG01VE5zalNvU0ZH?=
 =?utf-8?B?enYrbjI3dFJiNnVXQmF4UHJaRnBIR2FxQndxQ3M1SFZnZnVOLzZTTEhhMFNs?=
 =?utf-8?B?cFNBSXFoTXdleTVONE1rcHYzWXpob0g0YlNqY1B2N1MxMjBSZXpzMS9hQjN1?=
 =?utf-8?B?Yklxd2xQandWOUZxa1RDODNsZHpUaVA1NUNvZEhuWHBtRWxPZHZ2NkRrRVZR?=
 =?utf-8?B?b0s5NlQxc3RiOUExeC9GU0pWM2dKNlB6ZHlxdFZsbCtuT3l6b2x2THJUOSsy?=
 =?utf-8?B?R0pRcHp0OXZVUFV6L2UwSnB1dUJLZ0FKbWt5Y3dxTzEyM0xFVDdzMXRmWGVE?=
 =?utf-8?B?b3NjOW9BYlhWdGM0eWZDRW8xN3BnS2FNOStUVGJGai9iUzhyNk1sbFJrV1p6?=
 =?utf-8?B?R0xPWmp4cFNVSW5LdDNOdjZlSFNKMzYwVGg0UnJkN21IU2NTbHhYdjNpRDc1?=
 =?utf-8?B?dkozbmxpN28rWGJOSHAxSmF3WWtEMDRTbmwyUW1WNTF4QjFEaVhMOXdpM09t?=
 =?utf-8?B?YXg4VFI1eDJBd1FIK0NMUnVhY3l3eGRMY1ViUzNPVUxGeThCQnI2MHFmZE40?=
 =?utf-8?B?S1Bic1FvME5Uc1IwdHN5SjdtOHJYcnIzZmY1VTUwSVUwQytLWjdVK21EZ29H?=
 =?utf-8?B?K3kwYTlxWTROUUorVUVnM3ZTZHFTNGhNcWlTL3hXVWd4bjZmWmZOSm8vRzRG?=
 =?utf-8?B?V2djY3U5RlFVN2pmOFp2QkNUTFprNWxhNHVET0wzSTVNam4zZnltV3hQUnMv?=
 =?utf-8?B?MTBTazFJeWw0cWsvRlMweENscGhQc0pBVHhTSVcrOWpKVnA1ZjdQUTFYVHpk?=
 =?utf-8?Q?O7SHSd1amoaPpmjT13sD0nodLgNMtyPj5rYRc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBielBDVWZWWXV0SGdqa1ZTMDkxam5RdmhoN3RjN0hsSDNZNWh6WXMxYS84?=
 =?utf-8?B?Sml3YUZvbkZ6Z0hwcXUrbjRudTVBamIvNVp0Qm5lWld1dUZldC9ERnhscGN3?=
 =?utf-8?B?MHZYMUJPdGdOeE5lakdVVUpLTkplajRQUXlCVzhUQzJoZEFBUmNCRzBZMndQ?=
 =?utf-8?B?V1BrUDNwY2lGMWNjMjQ3MVc0aFJ4YTQ3Wm9PbWtWTisyQ1I5bXhpN3ZUZjNv?=
 =?utf-8?B?Z3ViMExlK3FlQW9SaVd6WUZBNjZKYmxDWS8rTkFpdVBFUWFicDhXZFd3SWlz?=
 =?utf-8?B?NThVMTJlTHlQcThVK09mZDlxM0dMc3BIa0JtcHZsVmJZWERIZGxqSTQvYXQr?=
 =?utf-8?B?LzVEaEhiMHpPYzhaRG9pUzlSKzlQbkFYKzY3VUl6Y2lueG5Udjk3S2l4dVZ1?=
 =?utf-8?B?UGpHSjlwN2d0WmorN251OVNDQnN3NDFzSzFzeEorR1A0c3ZxcTBnWWVVbmdO?=
 =?utf-8?B?ZlRjQ0V2bGRmdXN6a1piay9yRjArZGxuS3llVkpaVzNvOWozSWowVWNpK01E?=
 =?utf-8?B?RnRjZFNVb3VPcDY3TFV1MDhNajB6QXNYcXJWakF4VWtpUmo3YUNETTJHZzdG?=
 =?utf-8?B?ZXpWQk5LOVAwQ0xlVnRWMXorVUt1aFJldjlHT3JtaE1YOGJhdFFuS0ZjeGFH?=
 =?utf-8?B?anVWWW5DK3EyWHRRd1R0eWI4M3o0NUJHYXRQcXlza2xYNzhjY0E3ckRmU2hl?=
 =?utf-8?B?b1JYczhQZHVZRTlEaGtVTGt0N29ycW1iSGFGaWNLU3pCUWdGdzI2Nlc1QTN3?=
 =?utf-8?B?YW9FRGtvRXU1Nkcyck1Od1pTUHNRWEJTbkp2cnNsMXEzTXU2SGVUdUtJTi9j?=
 =?utf-8?B?MkFwUGNpWEsrTXBTZWkyUmUzN2M1eTQvOGs0QnlON2RnSHdEMlhaNER4eTdZ?=
 =?utf-8?B?YlpxdmY4WmhCVkVLRWZVbEtoMDdWZVA3am1XTEplVmZKUlNXNUpROHZFYllk?=
 =?utf-8?B?UXdSVlNDcUtUNnJQU0wyZHhWN1IrdUdFRE1DMmJhMlZRL2x1S1g1M2l5QmNT?=
 =?utf-8?B?TEpuVXhNQkJWYjArWUZibFgzRlY1b2VtNTlUb1hMYllhZldJbldEWFhua1U2?=
 =?utf-8?B?S1NmSFBBUmphTXhOakhIU3dUVHFSaEpsd3ZSMTlERTZiU2JSSnFPWW83L0pE?=
 =?utf-8?B?VEN6VXhETUwvY2lJTFY5ZUlFZ2FtQi9rdXp2SjVSSlROMHRsT3RSK0NPa0pE?=
 =?utf-8?B?TnQ1Tkk3R0tHL3BBaW5mYmpQeVlVdHZlcFYyODFQeGdYTG9QRE1YL3RUS05n?=
 =?utf-8?B?L2FYdGx0d2RLbHNkQlF3ZXFpbjA1OXZ0RHk3MnZHaFczNkxDVjg4Z1gzTnhS?=
 =?utf-8?B?UmlHMEFZazN4RmxTaExyajA4TEJmUEt0QnZVOUpGL2RLbzk4WTdsMFpxczFn?=
 =?utf-8?B?V0hNQlpOWDdRYXFwdlRza0h3ZytxcE1YRnNWb3BXcHpMMGUyeGVaQXM5Y3c1?=
 =?utf-8?B?VVNWcWJwZzlidGtOS0UveDNOaHk2bE1pVFdrT3UzWE04RzhXSldUeUhnY2tP?=
 =?utf-8?B?ZS9VM1RHdWJ1U0gzY1RlVUJhcVNuK29qa3I2Wm9ka2Z2NFEzTVJGUnFVeGhO?=
 =?utf-8?B?VWozRUxyQXh6YStlU1JvQzNqWjd1STJHd2hPNGdrNEdHeFVKWVk5TVFEY21P?=
 =?utf-8?B?bk85Tms5VEUwaTJ2YTdpKzYzbUtIemMxaFVSUU9uR094cVFLanE2ZXgydFh2?=
 =?utf-8?B?UGNXb1R2WlZOS0NhVWtva1lTYStWRWxQMjBNSW9ZaU1UUWxhSnRWSW1ZS1lJ?=
 =?utf-8?B?MXFDcGZEVHdRTVgzem5mZy9MMlp4T3NvcUxoSjNNZHU5Q1h1bnB3OWhoYWtv?=
 =?utf-8?B?WDRIazdERWlkclJENnNNYWVYNHN1RVVXWWlnVnZFSDVZS2w5enZSNWlKVGNK?=
 =?utf-8?B?QkdDUVoraXNoMWZyRzdWY0dEckY1cE12K2xnL0c2Q3lPdnVjeGo5eEt3cFFm?=
 =?utf-8?B?N2RiSHVaS29Rd0FBTUFFNXlyM2FiTlBFakRVMUZZL3dXM2JOWTBwMFpBUmFo?=
 =?utf-8?B?SEh6WHk3UE9GOU44ZHViVlk0QjU0NWcwT2Jhc0M4RGhJZ1AvRG9jRjdxeTJy?=
 =?utf-8?B?QUJ4VHhzc1NGVzF2UU9TNGdmSE5QM1gvbVRwU2tBVElIaE1rQzg3WGVIWWJr?=
 =?utf-8?Q?jvXEpVqVc2sw1o9+djjwd/KDj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8510625881EE64A94DF37D8202E259B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011eb7fc-ebfd-4472-b4e3-08dd0874544c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 08:29:47.9506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFwCLBULUbcYyM8M4DpldoKL+96IcYdJfJ4phtpKV2qsB/0MitxRU+mYHKAD4PnS4GiFzC6vQhYwh/NGVlrZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_002957_339456_4BE3CC62 
X-CRM114-Status: GOOD (  11.51  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
IEZvciBMQklUX01PREUgRzIgKi8NCj4gK2VudW0gbXRrY2FtX2lwaV9zd19mZWF0dXJlX2NvbnRy
b2wgew0KPiArCU1US0NBTV9JUElfU1dfRkVBVFVSRV9OT1JNQUwJCT0gMCwNCj4gKwkvKiBOb3Jt
YWwgKi8NCj4gK307DQo+ICsNCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBtdGtjYW1faXBpX2NvbmZp
Z19wYXJhbSB7DQo+ICsJdTgJZmxhZ3M7DQo+ICsJc3RydWN0IG10a2NhbV9pcGlfaW5wdXRfcGFy
YW0JaW5wdXQ7DQo+ICsJdTgJbl9tYXBzOw0KPiArCS8qIG1heGltdW0gIyBvZiBwaXBlcyBwZXIg
c3RyZWFtICovDQo+ICsJc3RydWN0IG10a2NhbV9pcGlfaHdfbWFwcGluZyBtYXBzWzZdOw0KPiAr
CS8qIHN1Yl9yYXRpbzo4LCB2YWxpZCBudW1iZXI6IDggKi8NCj4gKwl1MTYJdmFsaWRfbnVtYmVy
c1tNVEtDQU1fSVBJX0ZCQ1hfTEFTVF07DQo+ICsJdTgJc3dfZmVhdHVyZTsNCg0KT25seSBvbmUg
c3dfZmVhdHVyZSAoTVRLQ0FNX0lQSV9TV19GRUFUVVJFX05PUk1BTCkuIFNvIGl0J3Mgbm90IG5l
Y2Vzc2FyeSB0byBwYXNzIHRoaXMgaW5mb3JtYXRpb24gdG8gc2NwLg0KRHJvcCB0aGlzIGFuZCBN
VEtDQU1fSVBJX1NXX0ZFQVRVUkVfTk9STUFMLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArfSBfX3Bh
Y2tlZDsNCj4gKw0KDQo=


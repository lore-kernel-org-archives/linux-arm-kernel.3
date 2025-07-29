Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5184FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1d0Bf89mIIP/Emuz/C1NoWvVhptVHywzVqi04JAKGk=; b=rOhF89V1sxgQOhexQFTj2iDMFM
	SGGAdmb8prz+wMsNSa1oGumXxNocKZ1BYrKd2Jpf1RDMW/mJkiZJefXF1kfz/Fp4GJC8pDGruq/JG
	dgttPMMj+9bOGQFfLKYETxu5ckUgJaBEBFDh0or8sXqt8VdrFq1dJtZpRkmNGzbO2oF0KfVaz9nnA
	Ldi3FTen0cddzsBcGzvUZgro7uskSx0N0LFEOBDMWdCKu2JgBPRkabJQGmWnwS0yAPG9Wa82c7Slz
	mVp2GUpIUY6UDnM5jCu4oAVv/GtQwoN0lv6UuZAmm3Ra06IjL9+r+1EzPsDkqoI3tEJBThalRfJYP
	CKavFXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaxw-0000000FqBL-2uql;
	Tue, 29 Jul 2025 03:25:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugavS-0000000FpzA-3k3P;
	Tue, 29 Jul 2025 03:22:52 +0000
X-UUID: 4a50a4646c2b11f09eb0dd999d3936bf-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=J1d0Bf89mIIP/Emuz/C1NoWvVhptVHywzVqi04JAKGk=;
	b=pA9N2a0x9K/m8Mh5fL6ojpJ6DFNDT0IsWPQmIWNvfQWH01sE6IXgWRzyT7F3UVMn5ciXloOjRzjNUUqUzv71f4+bw97924hXRsiPBABSab0zm13z6JYR5gwjFMJIeMTPgO5J+P6rB6pqrc56/Ww4uQ/q5vO7CM43LeiKk4jP9ok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b1d10b94-bf58-4853-a00f-9b29adf2f9b5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:2024e208-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4a50a4646c2b11f09eb0dd999d3936bf-20250728
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1540004928; Mon, 28 Jul 2025 20:22:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 11:22:40 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 11:22:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLXPDLSGIYQMHIqAIkcPm+ugxoSv+5M37dyJVm1Bbp/W5i9Blg5ETlGNWEfxAxfYqi3pbA/qpV8tctv07oKzwhxG6GiVVjauqk+IHpxlHqvnOQHFULQ+zcWMHvyDUttdrIUNO0EjkbJPi/+eNr4rIm/QHontMmr3E17BkW0AuJ6VGP3Q/F1+805c/jhXJdlX+3ALG1Oa0UinTGIesXHkPInLNOas4wKaHwxBA15SMrOe1BBXjPr7dEakzBve8v6I6uLW1Gb/8hIGRVBGVuze0jc6iOSDatBPI4+I/Axtlggow7FPKJ4MmiW1HgUkBpH5rxSvuF0wAKrU0CoZclzXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1d0Bf89mIIP/Emuz/C1NoWvVhptVHywzVqi04JAKGk=;
 b=fKcHq4Vqgydvg6AOlh5PtnpaArTizbFZa03spfp+QtDRGVPVtJzKXUyrEgQnSDWX5cmIKECafIz+OFJMk+AuXY5jqw0diGTj8ngRSdN+h8bfrp/8btmBBDukSKbBb6sQcxGD/kpA64W4k4P05/lsuw2lcse5UjGnPKdSY5UXWRX0qoXjsnMKEHibMlY7ZNwMifiGOkci9DLysyBdD5cK+ZYTR4L8N6mqBMDJuBjYU/lEMGXW1AEO45YXXYgJg6tNw5oCQJeGDp6GBHIgBu6eFlXFvXsH72JsHYuz8DAwsSIIe5OsR+HGRwvk2i8AwIui9ao1qjxz5bFvMbonAmAKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1d0Bf89mIIP/Emuz/C1NoWvVhptVHywzVqi04JAKGk=;
 b=kLlzEDOLBBcTgpsu9UEyfw3jgvA5OiR3DyTP9+FHkFV7g4EZ1YehFNPl5qJDyEpPS/uNxKrBgqpG/NvA+a7N6DmJd+DUpYCkHHn9F2o72ZiEohb0/Gd0rrk+RQMgdHfNqCVbZyoEkJemk8Yzn2wZWPyU0Z3gv3fA1fSCNmWS3/U=
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com (2603:1096:400:459::6)
 by PUZPR03MB6909.apcprd03.prod.outlook.com (2603:1096:301:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 03:22:37 +0000
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939]) by TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 03:22:36 +0000
From: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
To: =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"mripard@kernel.org" <mripard@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
	<ck.hu@mediatek.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"hsinyi@chromium.org" <hsinyi@chromium.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Topic: [PATCH v2 4/7] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Index: AQHb/sZ1icxgLO8hUUOgy5TyIJy63LRHcQWAgAEBfIA=
Date: Tue, 29 Jul 2025 03:22:36 +0000
Message-ID: <14f0f1f3ee43f50705f4db16e89f0750b9db44fe.camel@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
	 <20250727071609.26037-5-jay.liu@mediatek.com>
	 <8d6ba467-d418-441f-aa49-8b615f3c333a@kernel.org>
In-Reply-To: <8d6ba467-d418-441f-aa49-8b615f3c333a@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8136:EE_|PUZPR03MB6909:EE_
x-ms-office365-filtering-correlation-id: f08e81d9-fd17-43a7-2ac9-08ddce4f2a7f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?L09oR216eDZwczY3b1ZEZDNCdHBBYkdwajVsdGNkVHBYT09iWGRackNVdk5a?=
 =?utf-8?B?cVI0bSt2aG9iVnFqdE5XMExNckpIYTl4VkJNdnRJalU0bG1mdGtPRytSODNm?=
 =?utf-8?B?THdrY2FqZzdDNUxSZ2JieUdLaURrMGZZR2FnSDF5LzVRRVpoUml0OGdVMU1r?=
 =?utf-8?B?VjR5N05UWFlrTSt1WlhWMmVqcE1LTVo0b2hpdmQ3ckJYbFFBZ2VRS2JVK3k2?=
 =?utf-8?B?RmNIN3B4clA4MGsreWtLMmUveGtPdDVZMENHTGNHMStuL0JOV1hsNjl6S0xw?=
 =?utf-8?B?dTdVR3R4ckhVSVJRdEh4RWQ2N3BjR3loL3VLTG91Y0FJR3E5UFJEYzdvNE5R?=
 =?utf-8?B?RVgwOGpiZC9rM0ZmRzhrYUp5amRjTEVVeTI0MEgvMGc0VDBGYzk5akRCVGpF?=
 =?utf-8?B?bDloZzlrcFhYZ1ZkaUhjdFhGOVZBcGc4VlBwT2JlM3NPdjJGTHJlVnN2eXpD?=
 =?utf-8?B?UzBZZWlHamd5N0t5RHdSU1VCbXJ2byt6L0dDOU1xTEhkUHkxRndOVVJqbmlB?=
 =?utf-8?B?RDN2T00wRnluSTRFLzE2d2RKbGJCZi9QcGU1bVdHRVJEdGNkbittcFd1c04r?=
 =?utf-8?B?ank3V1FsNFBJUWJnVndsVmd0b1l5cnJvb3d6cC9hTUpobVo3QzNPZjNOc2lX?=
 =?utf-8?B?dGc5VnQrMVlPVFI2Y1hmRXVQSUJTU3VzU2paRndtTFZ1WU12QlYzN1BwbGxj?=
 =?utf-8?B?RzZiWE1nRXJ2SkI5Y0JFemY0NjZSUThqZXc4WCtWczNPZSttTE00U1RNT0lp?=
 =?utf-8?B?ZElMSVhtRVFoZW53SkZ1VDVIR29xdkFSREhEc3ZVN3R5T1RRR0ZPUjJDRkho?=
 =?utf-8?B?SjBBUDVCV3hDYnRlQkR5cEZGWFhnd09iaUw2VWROOFdsdFNNNk8xQTdBcXgz?=
 =?utf-8?B?eUJJOHpoZlJRNnhWZmhTODh5T3kydVUrMzNOU29DcTg0WGNJWnJnZUYveXND?=
 =?utf-8?B?aWRMUVpHRjlNVjhSLy8xVmpHUnQ4QUNFcXI5RHlCekNXaGc3NVlSK0FMNHBS?=
 =?utf-8?B?Zk9MOHRsUXdJcFBHOUdYWGVYa2wxV1l0bW9lV1BlZ1A5SEVUYk5YWDY5TXpw?=
 =?utf-8?B?M0VUR1Z6RGhyYWorYUNMV2xoUW5kNUJMVHYvM0s4T0R3U0l2aVBFTW4wK3Fs?=
 =?utf-8?B?elVqVy9zT1FrTjhsZjZuUmY2eVZiRDRScExmTkZFZFJvV3daakMvK0tVNUUw?=
 =?utf-8?B?TTFvNjBRb1phS1pFOEZNQ3RDKzh3SE1SS0NaODFKU3BTNlA1YWV2bnhOSFRH?=
 =?utf-8?B?K3VWN1FBYmlHbDFGbkRicE9DdDlQd0ZscjVJajAyU0pmbjczUkZtR3JRQUlZ?=
 =?utf-8?B?UUtzQkpDQjJwbzlmTGNDL2hTQ0cvNll2b1BjZFJLYkwzYTNkd1V4VTY1ejRV?=
 =?utf-8?B?MUlXMjFmWncvcFNKWU42NG15MGx4SnNhVGkrUUV0WjJUUm0yRlVQQUxKbG9N?=
 =?utf-8?B?ZUtmZ1FsU0tXa20yemh6eUVjajVuTjBFVC81Z3dkb1lpcnNkRVB1Smh2WVJL?=
 =?utf-8?B?NWhyQ3RjSVV2clRWdXVWTTh1VlU1bm1ZMDl1aldOQnFmTW5pbHEwYmNqOCtJ?=
 =?utf-8?B?U1MxbVhZOHNpUVp0Qy9wTlo3OVd1NU9EcE1ZTVhyM0FpL1JZSWtadjN0YUt5?=
 =?utf-8?B?UnVtV0plUkR0WTMxQjY0Ty9rQlBoU01oRlFMN3oweXlwOEwyY0p1WnhtNmUz?=
 =?utf-8?B?bjJZdUo3UTJTNHR0WnpoaDZFQVJvbkxtSEk3dUF0dG44RFgwN0lzMTBOWnJB?=
 =?utf-8?B?NHRNblIzclhheTVBVXVCZUpEUElyaVAzSEkvdDhWckRVR1k0RkhIcUkvWGRo?=
 =?utf-8?B?cW51U2hCenB2WXpoZnNmMlBldFpCUVRrUHdHUFdCUzNqK3BwYm93Snp6ZldX?=
 =?utf-8?B?WUQ1aENXU0hHRUEwV0ZwWkx1d3Z3eG9tVVdKWExlaExJS3MxblRxM2RkU1hv?=
 =?utf-8?B?K3VyQ2pTejNIRTZXajBmNmtlOThhK2dkbk9qeERSMDZ2OHJueXo0eDB4V0Rz?=
 =?utf-8?Q?g6OsIkNxJQYVgS0CcHVS7mGnM890lk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB8136.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkp2bzg5RnZKc1RHTERldWxnSnV6KyswMyt4b2VmTGhEcDI3QmJkRktkbE00?=
 =?utf-8?B?SEFiazVoSW1zNE1aZ2s5VWFUVTJySjhaNGIvNFM2YkRBQU5pTnZlM0txMGpT?=
 =?utf-8?B?RW12TVBvWUV3aDRwMG5oazZ5elBHZk4wTCs2dWJORFNSZnpnZDdObVNINzE0?=
 =?utf-8?B?RTlBQ1RwdVp5cmVPak9LUFpKc1RHY3lxUndmMTdLUU44YVgwZGJKMVNTUTEv?=
 =?utf-8?B?bER5Y2QvNTk1bFNMK3VwVmpvR1V3Yzk1aUdMMU50V1JPVWVLYWFQS0NJWFVJ?=
 =?utf-8?B?dzJOaXlpY2dGTmMzbGhkUlNjNUx5NnRIVFZpbU1jMlRVRlozb09FSzFQZE95?=
 =?utf-8?B?a3dkTDZnbXNtUnNRb0twQ1pmLzZIOHN4WlNsTEhOcGtzYUdZUWwzb1VNNmQx?=
 =?utf-8?B?WGlpZVBnWmpvYytXd3JhenFpS2FvSmxXcHVGSURGbE15RGZEWEY2aW51TDk3?=
 =?utf-8?B?dkZ2L1F6SGxrNnRoRjQwWkZoSCtpY3lsU1Z4RDdDS2huc0RRVUlyU3QyZXZo?=
 =?utf-8?B?WFNsSlZFdHNzUmtiZ0VsWkN3aTVkZSszenIrT0Y0empQVmtwWTNGUHBQUVdu?=
 =?utf-8?B?ZVhsajYvUVhQcTRSSW1vZ0dpdTdYaTJkQ1gyQkJxaVBnaVNTTGFRbTZqZVFq?=
 =?utf-8?B?RDFQY0Q5ZGZZVTBhYnB1OG1sVkNBRTN4U0JhMmJwMzlXak1LQjBZWUM1cVoy?=
 =?utf-8?B?Y2RVV3RNbGVhTzduTW5hUmpiME9OOXdUdVVsbGtCZVkwOHlEUGgvNTY4YTBE?=
 =?utf-8?B?L3VCQTU5QjRXemNFRkxuZUtXM2JYeXNkTU9qSm5uc3FReW9ZbFF0WUp1T2JV?=
 =?utf-8?B?dW9rYU5JQVExK0liL2N0Nmd6SjIyZlhtWTQ5cnBOcnU1dzBvVmNRQkt3b3Vo?=
 =?utf-8?B?QWJYNXhxeWVXVUxaVk8vcTVKNVdGZzM3dE9GT3ZNNzBXeTV2TXlwV0JJYmFK?=
 =?utf-8?B?a0k5WTE3K09LQVBMa2JmbzBaQ2JNQXJqc0I5RTJadkprYkxNbTgrRmZMV0dT?=
 =?utf-8?B?U1l2MWVFMnRFZUVkbmN1ZFRZNkhPdWJqL2lKREcrajJZaFNmaVp5UGFidEFG?=
 =?utf-8?B?NWhjclREeS9uNmdMOE4rbWt4WTVQb3NiUTMySnVaeHZkN3ozQ1h0MngzcW44?=
 =?utf-8?B?bFlTdnBsWWpjVXlBbzlJMzh1QTAzdEp6SGt2WjU1WnBQSGRpUFMvUHhTUTdj?=
 =?utf-8?B?bXYyM01zSER6UTJreS9yT3NYOG53TmRqNFhJMmpjbFh0dXpvT1R4RXY4UnR4?=
 =?utf-8?B?OE9kRmlWSkxBNG5VdDJvSUZtdmJHU3J3Ums3TlYxUHE4SUVMdSs4czRjNDdo?=
 =?utf-8?B?NmJib2N5clAvQ0E1cmoxSWttelVyZVNDbm82WXlUbFV6TFFVblRIZXR0dG1C?=
 =?utf-8?B?b2xDd0xiTWlCMXV1ajNkQmtmWmMzSlRGbEdYTWZKZWpxcTlKaWRVdHUvVUN1?=
 =?utf-8?B?RGt2UUp0cE53V1hPaXUxMEYzM1FOdjBlcG9GemhydlpmRUVxMlJlYmtTc1pM?=
 =?utf-8?B?SS9xOEoxQ2gzaGdzL05NNDJXUjNyNkdWM2dtVGZNNUlONzg0M0Q0aDNyVnpJ?=
 =?utf-8?B?UVJFemYxVHVJeWZYa085VE9pTFlUVFNFbUxmQkVQU2x2b3FiaDVwaEM3ZTVr?=
 =?utf-8?B?Q3cwT0xMTlJRdElmaTFIQVo3Wnl3QnVuZGJKcUJpcXd4Q002M1lwaExDczl3?=
 =?utf-8?B?Nk5yeFNiNmdlYTk5R2xRaFdjR1RKRlI5YVd3anhJRDA3WE90YW96WDJUQUZ4?=
 =?utf-8?B?TU92c0psL1ZsKzd6N0dIWTVVcjR4Q3d3Yzlkb3BXUHRZbnkxd0dYVWZiVGVB?=
 =?utf-8?B?ZVFleTJ3T3hEdlp3T083RFBMT1VuTGtMN3dYY0YwZ1Y1b1NHakczTlVadFFu?=
 =?utf-8?B?Tytqb1dtVzVFVDIrbElOMEUxUTlBMSt1S3FzY2hkU294V0VHcTJyUkptMzRq?=
 =?utf-8?B?aFNXellxSGVab3pJMm5sR0xhOTBxSnpwV3RsWHltVGRGNjRRRHB5RUxLYWFQ?=
 =?utf-8?B?NWNTZkRVTjlOVVFJRUs5dU1kb2xRNWwvd0tCR0IveVVBWnV0UjJ6ckhlWE1W?=
 =?utf-8?B?ZzZwdXIwQ2tkczMwamN2eW9yL2lBMnA3QzFaclpGdnhEbThrYnJQL1cxUSs2?=
 =?utf-8?Q?pfh17jSd2G+goftrsP7PnyqRs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CD4A2AF2F73C64A9338F67E84A9E95F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8136.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08e81d9-fd17-43a7-2ac9-08ddce4f2a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 03:22:36.6814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjumDBJ4rApaN2x6J/SdqrKwP4sS5bl3ko2o+4ZZMDr7ZCuNyRvl/zI8ksXmfCC06GNV3HAy3pxwxPApevlhSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_202250_946653_B11D9DFC 
X-CRM114-Status: GOOD (  14.19  )
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

T24gTW9uLCAyMDI1LTA3LTI4IGF0IDE0OjAxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDI3LzA3LzIwMjUgMDk6MTUsIEpheSBMaXUgd3JvdGU6
DQo+ID4gQWRkIGRpc3AtdGRzaHAgaGFyZHdhcmUgZGVzY3JpcHRpb24gZm9yIE1lZGlhVGVrIE1U
ODE5NiBTb0MNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXkgTGl1IDxqYXkubGl1QG1lZGlh
dGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiAyMDIyMDMxNTE1MjUwMyBjcmVhdGVkIDxqYXku
bGl1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IA0KPiBXaG8gaXMgdGhpcyBwZXJzb24/DQo+IA0KPiBU
ZXN0IHlvdXIgYmluZGluZ3MgQkVGT1JFIHlvdSBzZW5kIHRoZW0sIG5vdCBhZnRlci4gVGhhdCdz
IHYyIHNvIEkNCj4gZG9uJ3QNCj4gZ2V0IHdoeSB0aGlzIGlzIG5vdCB0ZXN0ZWQgYXQgdGhpcyBw
b2ludC4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpJIGFwb2xvZ2l6
ZSBmb3IgdGhpcyBpc3N1ZS4gSW4gdGhlIG5leHQgcmVsZWFzZSwgSeKAmWxsIGNvbmR1Y3QgbW9y
ZQ0KdGhvcm91Z2ggY2hlY2tzIHRvIGVuc3VyZSB0aGF0IHNpbWlsYXIgYmFzaWMgbWlzdGFrZXMg
ZG9u4oCZdCBoYXBwZW4NCmFnYWluLg0K


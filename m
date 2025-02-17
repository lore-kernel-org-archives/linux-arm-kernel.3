Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE700C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=; b=maVE1QOgediAYHdYULQUxxab1v
	TtJKcx2NEzoMKmyO+G5OpuAFDZCq6gwk1BtFbKlvD2ikeSHriUklbDVApfoP7jKxlgzLXz0h5A4Pb
	70qp7Az5/cGI4N80nv7G78ScCG+rMluh1nJ+uUm8NUrVeHjw+O5n6PpToeP9F8sJj7yc2DrllU3AF
	nWYXb0RjWKZ4U2fypIjnS9EcpO82bICYk5ET5s2pSLrQtag2d+M6NG97+1tepp0UDuhlU3won165t
	OZVbRPeMwc0kfaiqOd4vQCfxYARY9Itr9+S8fBn0QtLJi/rp9zYX6qogEupvGQVZsjnn75tXDEAAs
	FErRwAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykQ-00000004AOy-0jmh;
	Mon, 17 Feb 2025 10:53:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwzm-00000003qCs-2wvt;
	Mon, 17 Feb 2025 09:00:56 +0000
X-UUID: af09dd8ced0d11ef83f2a1c9db70dae0-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=;
	b=dpgNRDjXDqtPliR79RJC7Sm9ev5LpeCGGTckR0qG5BZwY8yxFsXQv6MexmQ3HU22yD1UlwW8XbAtnuVn/Fsy4mo0saFA25bk9ofoz1Kkj8auwmj9zqLW+KCdrQ61TrG7pncqZ8/RcsEhGxRxy0GzvpzrYlJIHbJwEw3NQ8LfLQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:88c4a4b2-4f3e-4db8-918a-e4b0d01081b1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ebc3e024-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: af09dd8ced0d11ef83f2a1c9db70dae0-20250217
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 649074957; Mon, 17 Feb 2025 02:00:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 17:00:47 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 17:00:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3wfH8h/4lC+SjxK8oEApE6taFE9XIOl9xIjaChbnIoNEypvi/ZV947XwXJxw/y9LSK3F4TUAVstoOfquPvZb3spW7kd1c3JpGFULP0EGRb8PAebfeyA8kWnfK65b90I7XDQK2KSvWJMic1M0zsPEUv7XG1pbFXATCBjnOphN7ZgPrAgpUWuSUBPN0MmXJaVSJBiB5vYOkNAPEYkFpNBdDtFwwegSfBjok+SHn38nB+SCleXXwikVPcjISP647BFlzlRyR/MZCYO8buCz+hqZKqIJQUwB6VjSFmIQMU9LUMcjf1nMwSFr+5PAN+3ZNEAWNH+s0uFLLfKIHBuKNBZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=;
 b=heULAMRpzy+43IwNSjM3YcFU/Ubst3lUAm+49eMgoXrgMQn37pYUaFzzkUH+S+Kn3bWqB2sDiz6g1HQxYDvfdLiHlsy18MSLyO5Fhw+tDHP1Jm3Yx34qKRZ2iAqF4fvFcN2O1FeqvLb1e1wIrTgm29UCnKQpLqhuFtRy7UgxMJD46SbxSOU/EePMnAR8Ne5nEmjj4kj/dlFFjBFGHWCj44HEWWek58hKJ3QHlXuBwZI8CoGcztgXGNVpyDsF+cOJYQ3KNZImPT8UkuxnyO9oJJMOBeI8eNUHi6CW9sWDEpHfN6uzFM6R/VET3okjLWFxuUz/lttmclNinvCAOGnfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=;
 b=PQ+xVDuEvA48BMne9C0QJ5koIAViirbYIRGSI0x7xHhZUStAFuy+rrXWPoOSAOdOoZy2Ssp2UBGoewg/4sz9TQehzUz2Tm7H9ibttRNxJ0lVRZunlEf3Jl18IR0LxDmkREx5t2BEszYNTP7TjHIefLCvFmMEYexk4QtB9wucjKs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6905.apcprd03.prod.outlook.com (2603:1096:400:267::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 09:00:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 09:00:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"mkorpershoek@baylibre.com" <mkorpershoek@baylibre.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Thread-Topic: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Thread-Index: AQHbYbDQlGCNLzErmUSwwJssLHQ4qbNLcXeA
Date: Mon, 17 Feb 2025 09:00:43 +0000
Message-ID: <6d6bf950d7a2b611f215cb52e4aa3e6aa9c51282.camel@mediatek.com>
References: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
In-Reply-To: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6905:EE_
x-ms-office365-filtering-correlation-id: ee8ea816-8ac7-4dd8-1351-08dd4f318f6e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1VZYVZ1d0JHR3dvZGVUNExvWUxwTXRwVk5kbkxZSm9YNVErMndxQWJzRXdU?=
 =?utf-8?B?SFhGMEpiMUFLM1lWV2g4dmV0dXE1aHFkcTBFZ1pnSW94NTRHc1RXODY5VlUw?=
 =?utf-8?B?VzZpNjVDc1NVSDQxU2ZCc1F0bEM0SCtJWGRYQVdHcGdDemdhV1hUVHQwUXdn?=
 =?utf-8?B?bG04S0lXcHkyOHVscWpUY1lZYmhXK0hMYzRyNW8vbUZEZlVicWdJSS9yRXdQ?=
 =?utf-8?B?cGdQRzR5b2tyUHprMXp4MVV1dUd3VU1CMUQzWkNHN3VLQkVhRzFnTnNvQU53?=
 =?utf-8?B?UDE2MllGbWFWbGFncnNyR1hScWRUdWdBSTR0QmxMRktKM1EwL3hpUUIrN21v?=
 =?utf-8?B?aHhwd2VNQzI0VUk4WFA2MUhURmRTVXJwRFp4REs2SkpoNWlHMnlSSXlQeXBo?=
 =?utf-8?B?ME9xRzJBeXNITm8vMlV3cnJVcnRVSVNhOVR2RXp4TVB6ZlVJU054N2prcWtw?=
 =?utf-8?B?ZmVjNWpqa244b3dGK2hKOW1kWkNlakhPdlhCYmhPYXM5ZUZ1QmZJWkh1NHFh?=
 =?utf-8?B?R2NUSWM5TFV1a01WVFJiSkFVV1RyWkYyQTludE1ySk5ESVZXTmkxZEpXZTUz?=
 =?utf-8?B?aEV3aS9vUDJ6L0RHd2hTYXI3U1VPNjRlZ05TRWNzdjJzZ0hEdVU4WWZqN1B6?=
 =?utf-8?B?dW1jRkV4TzArNjdXYkxvQjYvWmhpZEkrQkpIdVVQVG50ZkhBWkwrdXlRT3lu?=
 =?utf-8?B?QmRORlJkNHVyRS85bVlWdEpreUN0TlJOQXhFTlBGZytaTlA5elAveW5RVW90?=
 =?utf-8?B?NEplY0ZaVFFiZWdaeFNDdzNYQjc2QzVJZFdIZ3ZmSENaODhrQ3VDRi9vdUhP?=
 =?utf-8?B?cy9Qd3duY1lQSE1PYndCa1VqR2d1aC8vOEZEZWdhaDkrMldMQ2tGV0JNMkNQ?=
 =?utf-8?B?b3ZnU3IwUWNpWFNUaDJ2M0l6SDQ3MkIweXR0bGhJQklRNk1qOTAwUjRmYlBs?=
 =?utf-8?B?Z2lBNG9RSitvOUpJS0R4bmpBSkZUai9UTEs1REtFT3ZJakJOdHRFLytVc1Bt?=
 =?utf-8?B?TndnK1RZNDZIK0V1NEQ1bjU1aU9QYnZUbjJwaXgwU1pOaThuMCttdXRCNUx0?=
 =?utf-8?B?VDJ5M0tjb1NtK3ZIdjVEYkVkQ0pLZ0d2VE44MytsV2k1ajNRUmF1TEU1b0hh?=
 =?utf-8?B?REJYVDgvSSs5b0dnSDNkemFMbjNMN0k0Z1RuVXZ0SEZVRlkvWDh1WTdOcTRr?=
 =?utf-8?B?TTFwbVF6aGV3aW5ZbDYxR0p1ZjlhV1JjZ0VldTVoMjlrU0hxZERWMmZPQjVK?=
 =?utf-8?B?VVpxaWhDeTZhajhVUEhLcU1UYU9JR0JVRmRBZjVKbk9CbDVpc1JmMU1ITGha?=
 =?utf-8?B?bkNic0ZnNkdoazlCOGlsWnBIMGNMNUE3QTdBNW9SZm1kT2d4Z1ZxaU9WMStP?=
 =?utf-8?B?azZ2ZGo2dW1iNndWVEJBVlRJbVVLK2l3aWZvR0h5QTFMS3k1NnppV1BXSmFD?=
 =?utf-8?B?dVJQNGFkR3lCNzM1TS9FMkE2dkZ4MElDZ2RhU08rZTgraGRDNUFZdDM5N0l2?=
 =?utf-8?B?WFZ4RTMwRkR3REt5SGFFQUJveDkxc0xEWlVvWlVKNlhhaG5PTzhMODhPNk9h?=
 =?utf-8?B?c0R5Z05yeUQzRkY2VExBMVl0YzFjaDRzdlFpZDE1b012clpFWGt0dUFQRkJX?=
 =?utf-8?B?QjQyVmRVWmV2Z2o1d2EySkNiRjBOa3FrU1BId0dQeVRjM1VPSDJLaUlUbDJO?=
 =?utf-8?B?bGpVUDQzZkhabHVUK0R3eGFBb3hLS051SkRvaGZYWlJYSXU2TE5KRkRXRStD?=
 =?utf-8?B?ZzQwaDBSM2RHeFBnYjJXckpRMHhlVVJhM1NpTHVuVHVoOGpLV2Ird1ltMTV5?=
 =?utf-8?B?clQ5WjBFM0wyakp6MUdneldWZWc1M09KV3pQWC9CcXVRZ3VJVjRNQ0o3cXZM?=
 =?utf-8?B?cXcwK3ZGMUtjdFA0dGQ3TUd3dEVZRXI2Mit0dG5XSkYxL3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUNqMlk0OHNZTDlQMVIrWjRSNXl2a1lJcERveHBZRHVSbVlUVVlUb09SSjNl?=
 =?utf-8?B?Vms0N3p5YzVrZnNJSkhETENybEdlcTBXYi9zemJRUHVBY0Jwa3hNSkZPSlc5?=
 =?utf-8?B?Sll0SnUrQWsrekdhUDVsaGNlVG5UbFRwTTlmN2lYYnhQck5WMmFtVjE5WDgv?=
 =?utf-8?B?U1JEK1pYWlphNzFkeVJOUDZXRStLVHFlKzdnVlJrUXJKdEpURmxwNG9NaVhL?=
 =?utf-8?B?dlZ6MDVNNkJ6M1VHYW92MFFyNmtyWnd6aTBPWXh4cGNYOVFlQTFJeUdhL0cy?=
 =?utf-8?B?Wkg2WURKUStqZ0Y1VGYrcWlHS2piV1JDZ0tuYjQ4WFlNNkI2Y0RNRXhab3Q1?=
 =?utf-8?B?RjFKSGtQOUQ1bWFTL1BIcFFUWk9zTmhYZ2p5dW1HNnF0T1Y0TVhvN0thNCts?=
 =?utf-8?B?bG95VHcwL29LRk9oc0lTTWFFVlhtSGh0Sm9SRU9VeksweitpbnFEZWlIeU0r?=
 =?utf-8?B?ZjB0UkU2c3VUTWZ3WGpRRTdGcTF1R0VhTk92S0hxOGxvRndqN0pkZXkrQmxk?=
 =?utf-8?B?V01tLytoemp5dis1ZnlLd2JkcndUQ2hGYXVyOVNpd011TkJsUERPTy9memlE?=
 =?utf-8?B?d21uMThFUitUN3lXZ2dZUDEzOS9SV2NkSVk0NG55YkVFZ3gzVEtMNlBpUlQy?=
 =?utf-8?B?TklUZkEzSXhhNGNadlZVb21OU0hCcHZtMDZuTnVNNzMxS3pYYWwrTUlJc0F6?=
 =?utf-8?B?NkhtRDdXMll4c1pwN1MvWHFZVEJkRFdiRnl1OFJBUXJzRGdwMExqNjRaYTI2?=
 =?utf-8?B?Q0FWS2phZU9NdWV5MkdVYm96ODlDMUdURmthYkR5bDB6MUZHSU5YT2R6ZkJp?=
 =?utf-8?B?UWZZV1J6Zzc3UDBZZXVQK2MrYlkvYTJEYnFmS3pxblI1SzMydFk2eEpwWmtv?=
 =?utf-8?B?b1lsMHkxc09ObE1HdFRxS2tsWlZSUU1zc1lSVmExTmlFS1MzOWk2b0JqNGlo?=
 =?utf-8?B?Q2xralA1WFl2cEkrZWNjTDRFcDF0SHFmY1B5Zm9YK25reGdlTHZtaUg1QnpJ?=
 =?utf-8?B?c25VYTMwb213azM5SjR2NVpnQ09EQmNGMzVQenpZS1FRcEsvcFpzR2djK2Fo?=
 =?utf-8?B?ejhCR3dxQTdXQnFteEs1czFodzJGTmx3WHFsWDJIU0hQenpUZnhkQlg3SnpY?=
 =?utf-8?B?eEc2WVpjdnhxbmIrYTJRNmZNM3A5eGo2cDMzM1VvRzM0UjMyWHVoUStkczdk?=
 =?utf-8?B?VGdLa2FwellJcTZYdlcyUlljNVVlemcxeVJJUVo4MFUvSmt3ZThGeDc1TUdB?=
 =?utf-8?B?UzdyWU12dWVFVVdzZ1JRSW93UXZVWmNweVEvUDJQcVB6Q1FZbk4xMEVnejJk?=
 =?utf-8?B?M1laUmsva2ZnVUlMWlBZWVBrN0pLOWNlWW9WbDZuRXZzSTg4c3EwK0xQWXlL?=
 =?utf-8?B?Wkh1bXdaODZYSkZ3b283aEJ4NFZkMkdpUVYrN2RBSFVlZ1VFZkNMOGhrcHlv?=
 =?utf-8?B?eER6aWFFUDBCUFg0NnoxNkxpd3JlRzBSU3p3MU9KQ1cxN2t1SGhnblJKNjVW?=
 =?utf-8?B?Y2E5a1QyQUhtc3A4MzlsUk9uVXg4cWhORTVyUHVQQXpyY04zM09qUUdUempl?=
 =?utf-8?B?WDZ0MjV4K01QcmFUamlyYTdLK2VKWWtRR3BDSzdiQW5qS0xZL3RwOWJRWHRs?=
 =?utf-8?B?SWMvL2xaMGZpeW1yMXo0UUxBN29rVyszV01JVU1Seno1YUd6ODRYSnZZNzIx?=
 =?utf-8?B?R3F4bnhjRnFrbStjc1NiM05YQXJDWkl0L0hGMGF2MC9WSTEyLy9kOWV2Mlpv?=
 =?utf-8?B?bmJHTnJmL0RxcnkxUVZMSG9ZT0lEWXJtbnRMVzRhR2RBMWFOcElVQld1SURI?=
 =?utf-8?B?QnlGckxVSC80TUVGdmJCaTIzKzhSbWsyQ3FoRXNrNXlyZDJKZGZ6ZmE5QUVj?=
 =?utf-8?B?R1YvN09sYkRFT056c3pPNXdUZzV3KzJGcElXa2c0NUVzbDdpU0RKZGR1aWFZ?=
 =?utf-8?B?bEd2MHZySFBvQVNNbW0yVnBTMDBEZnhuRnlSdHBYK3JsdERtUFcwUmNObmhI?=
 =?utf-8?B?bFRCckN1L3JLNG0waGhEZkd6WnRQOXJxTUE5enFRUjRuK3NRdThMOExwK3Jt?=
 =?utf-8?B?VFphVDdjVllEbWNGZmpHVDNsK1JqTHRmWEhQOWtiMWNIQktYbEhqdzFEakYy?=
 =?utf-8?Q?vFYiWtCnvEdOa1Z51t7yZZWzn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E47A7B551957914BB483CA0A7BC704CE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8ea816-8ac7-4dd8-1351-08dd4f318f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 09:00:43.4314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sz3q2xKwVGFbe9YXJv0YChlFVr2IqvdStRX5hsqUhnmM6ojwh3X8WIDSfBPUWdUbM+y2eethuibbQlQbn2aQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_010054_759964_7C41548D 
X-CRM114-Status: GOOD (  22.27  )
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

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDEyOjM1ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IFRoZXJlIGlzIGEgdHlwZSBidWcgYmVjYXVzZSB0aGUgcmV0dXJuIHN0YXRl
bWVudDoNCj4gDQo+ICAgICAgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiByZWN2X2NudDsNCj4g
DQo+IFRoZSBpc3N1ZSBpcyB0aGF0IHJldCBpcyBhbiBpbnQsIHJlY3ZfY250IGlzIGEgdTMyIGFu
ZCB0aGUgZnVuY3Rpb24NCj4gcmV0dXJucyBzc2l6ZV90LCB3aGljaCBpcyBhIHNpZ25lZCBsb25n
LiAgVGhlIHdheSB0aGF0IHRoZSB0eXBlIHByb21vdGlvbg0KPiB3b3JrcyBpcyB0aGF0IHRoZSBu
ZWdhdGl2ZSBlcnJvciBjb2RlcyBhcmUgZmlyc3QgY2FzdCB0byB1MzIgYW5kIHRoZW4NCj4gdG8g
c2lnbmVkIGxvbmcuICBUaGUgZXJyb3IgY29kZXMgZW5kIHVwIGJlaW5nIHBvc2l0aXZlIGluc3Rl
YWQgb2YNCj4gbmVnYXRpdmUgYW5kIHRoZSBjYWxsZXJzIHRyZWF0IHRoZW0gYXMgc3VjY2Vzcy4N
Cg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVz
OiA4MWNjN2U1MWM0ZjEgKCJkcm0vbWVkaWF0ZWs6IEFsbG93IGNvbW1hbmRzIHRvIGJlIHNlbnQg
ZHVyaW5nIHZpZGVvIG1vZGUiKQ0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIy
MTA4MDEuaUFEdzBvSUgtbGtwQGludGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBl
bnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPiBSZXZpZXdlZC1ieTogTWF0dGlqcyBL
b3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJheWxpYnJlLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+DQo+IC0tLQ0KPiBJIHNlbnQgdGhpcyBwYXRjaCBlYXJsaWVyOg0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvWSUyRnlCQzR5eFRzK1BvMFRHQGtpbGkvDQo+IGJ1dCBpdCB3
YXNuJ3QgYXBwbGllZC4gIEkndmUgY2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQgYW5k
IGFkZGVkDQo+IG5ldyB0YWdzLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCBk
ODcxYjFkYmEwODMuLjBhY2ZkYTQ3ZjAwMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jDQo+IEBAIC0xMDE1LDEyICsxMDE1LDEyIEBAIHN0YXRpYyBzc2l6ZV90IG10a19kc2lf
aG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykN
Cj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gaG9zdF90b19kc2koaG9zdCk7
DQo+IC0gICAgICAgdTMyIHJlY3ZfY250LCBpOw0KPiArICAgICAgIHNzaXplX3QgcmVjdl9jbnQ7
DQo+ICAgICAgICAgdTggcmVhZF9kYXRhWzE2XTsNCj4gICAgICAgICB2b2lkICpzcmNfYWRkcjsN
Cj4gICAgICAgICB1OCBpcnFfZmxhZyA9IENNRF9ET05FX0lOVF9GTEFHOw0KPiAgICAgICAgIHUz
MiBkc2lfbW9kZTsNCj4gLSAgICAgICBpbnQgcmV0Ow0KPiArICAgICAgIGludCByZXQsIGk7DQo+
IA0KPiAgICAgICAgIGRzaV9tb2RlID0gcmVhZGwoZHNpLT5yZWdzICsgRFNJX01PREVfQ1RSTCk7
DQo+ICAgICAgICAgaWYgKGRzaV9tb2RlICYgTU9ERSkgew0KPiBAQCAtMTA2OSw3ICsxMDY5LDcg
QEAgc3RhdGljIHNzaXplX3QgbXRrX2RzaV9ob3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9o
b3N0ICpob3N0LA0KPiAgICAgICAgIGlmIChyZWN2X2NudCkNCj4gICAgICAgICAgICAgICAgIG1l
bWNweShtc2ctPnJ4X2J1Ziwgc3JjX2FkZHIsIHJlY3ZfY250KTsNCj4gDQo+IC0gICAgICAgRFJN
X0lORk8oImRzaSBnZXQgJWQgYnl0ZSBkYXRhIGZyb20gdGhlIHBhbmVsIGFkZHJlc3MoMHgleClc
biIsDQo+ICsgICAgICAgRFJNX0lORk8oImRzaSBnZXQgJXpkIGJ5dGUgZGF0YSBmcm9tIHRoZSBw
YW5lbCBhZGRyZXNzKDB4JXgpXG4iLA0KPiAgICAgICAgICAgICAgICAgIHJlY3ZfY250LCAqKCh1
OCAqKShtc2ctPnR4X2J1ZikpKTsNCj4gDQo+ICByZXN0b3JlX2RzaV9tb2RlOg0KPiAtLQ0KPiAy
LjQ1LjINCj4gDQo+IA0KDQo=


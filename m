Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16544D4A5E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=; b=qSf6Uei35LTA4s4fgnxx9JwdxE
	E3T/au7t/Gu/LPvg2rjM17kwcZbrBTjf5BlotwLAUjBhYzi2qyNPY/QjiFexXWeGdYSaCaHUh2P/u
	7mlUr535kcD9B5yA9X4iOhZoIy+W6SQORQzPnboGiZwBfJvk1rzYXx9sskOkUmUdXNUbLDHSNbzeD
	i1udhHRSuFgBauhOOB3gHGRfEa9DaTQJ3rbQZH5XGJHPXAaL9q49uVGKgQQpXg9Z+MViF/yFk0TtS
	25HfEALtkOO7w92nkvK2jEtYQTYzFqwjarZeh8NDtip7gWp6opgpC6xQJZMdrkXw+/tAYxl4MrxDz
	vDOCD5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgf06-0000000DkBI-0ZIO;
	Fri, 16 Jan 2026 08:16:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgezx-0000000Dk9l-1kdR;
	Fri, 16 Jan 2026 08:16:05 +0000
X-UUID: 948740ecf2b311f08b17dd397dc63300-20260116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=;
	b=ZcBEAN3XH4e2ShcIrb4var1ADcdS+lzX4KakwqIu9lT1SVKv+wGtWEuTufjNE0I1iKzvKFiINnK6Jxwjdm4jqMVYj8tmg9JbM0HG8GbcuoN9I7MmnaghNvDFcRQac5z+XtfmPpj0oleGyuouvW2akFBUKjNBdNqlK3z29JHBQwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:a9344318-1d79-4f25-b22d-59d83c2d33de,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:8aa3dc79-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 948740ecf2b311f08b17dd397dc63300-20260116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630630777; Fri, 16 Jan 2026 01:15:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:15:52 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 16:15:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG0hR6VjnILOqneEs35RpqNkynw9SuS+0dI2c59iIYaQkwww0jUlX20q7/ApqWG7t4zqE6u3c9V0PwumBsLBdopvatzNZ9KzlnJ47GRJ2RYTxhUhUYEEtO9YGqmlcn2Pix5lAlU6TcTonbuASuD3fHn2e38d6PKy++UyiTooDl4GlQs32iNLm1ZUIEwonOJKCdKhAijsETz12F4NxoF2Vp7E3cx0g6fyccia5OCeUDWopw3XBIg9kbSSqbNvexEqtprX0cheGAIQeXtRdPbDa7PRS+viqPyrVJl+GGErtG0JCT1hTz7DdzdG8An2yfVLMoDzrkfMUrlY5kojraI5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=;
 b=wXF/gIKwrkEkU5f807g1ezk4qX0Lc6fbLZdp6YS0fLKlW3Uyv4tzJNtXquTJ6UsZJIoL9afyuAj71WKFc9a3oeTP2Y2XnD7cBPexs6R6YStttbLJE3EnsLXwbLTs58AJG9IgrgH8In2z/kxrI9K3eVwol6V2PRMEMjIjxYm/B3myo8RG2jfuxaD1bVkzeEzTuU0oZpp/DZ9FJfaP3UK72wTm5uuiCq93nHToMMHO86cbhtCtTdFbxvLIP4j64iKDEGTkH1DtWUBRh+52+KYf4kw6VMMNXuWy7W909fQqccQzxAGy1CHxbX3FWJ44VWBsNPo90yMH0xXbjVkn0p0C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=;
 b=t1RBwAdc6Jo6dRRJQWOkWv3UwqLHYxuDNkdtLJW1OkIkDJKl32wisrnU4dXz+Z2nEdlUw0/OylbSCpK8A6GfXciOHQ36uM/R/l6cOXuzgO4wZWU0IfsI+hCv24DiwKcD7CbXcdiylfarb9vaPu2JJJOn7Y4lMhIwGbRbuRw5RMg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8275.apcprd03.prod.outlook.com (2603:1096:101:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:15:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 08:15:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bisson.gary@gmail.com" <bisson.gary@gmail.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Thread-Topic: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Thread-Index: AQHcgIh0TkZrId1cZ0SamoaDpO5II7VUf5GA
Date: Fri, 16 Jan 2026 08:15:48 +0000
Message-ID: <65ed11044d6a52267d6121bcc68cf9c6d9b60b4d.camel@mediatek.com>
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8275:EE_
x-ms-office365-filtering-correlation-id: b0b73508-f10b-4432-d5b1-08de54d7748b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|42112799006|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WC80UlVmQXg1Um00K2hnVXF3ajEvY1ZxZW9GYTRFemh3NW1WYjh5b3YzeVQ2?=
 =?utf-8?B?QkZheUlQSklSSTExMERSc0lxOGxKK1kvQzJDZ2ZFMlNaUTBqM0tvWFFvQlln?=
 =?utf-8?B?RTBDMFBMcE1mb2xlVk1SU093M0hRQ3FSQkdYbGFIOVBjOWtlM0p4K2J4ZkpQ?=
 =?utf-8?B?WldZSWFxbnk3V0tQNTFkUWp6OVorVUlVZWlKTGxCL3JVUU80TUduUWxHUlVN?=
 =?utf-8?B?VzVOeWZsTzF4OXJ6SmRiZFduMkNGa1lBR2VsdzF1aEx6L3l3SEswdW9OU1ow?=
 =?utf-8?B?Zm5Lb0FoczMzTCtRYlQ1b01lRWp2V2tOWG9SOUZ2a2FMZDBSU2tjZXJvWmg5?=
 =?utf-8?B?ZGdISFNieExibFpnVVFoTVBrb0poZlRhZDNqZWRDYXoycjVYUU55bHh0U3BJ?=
 =?utf-8?B?eGxIaDFROGF0ODN2ZWVqUG1aV2MzVHdvN1RlMDdCdmFoYlVyT1ZUd0c5Qmdm?=
 =?utf-8?B?L0VySmRDYkVONFhTcHZKV1pTcVJ5VktUUy9DQWl3YzVTMUoyelFVeDVraHBS?=
 =?utf-8?B?NnJZTFVjUHZhL3RIdDhaTWMwcm4rcW5DY01xZ3RxKy9MRHZJYVNDMGRhY2l4?=
 =?utf-8?B?M2xrK1hMSVdGWWlmZThiWFBXME5HVXN6eGZaeC96THRyaW5sN3VqK1o2T1Uv?=
 =?utf-8?B?clVQWmVZV0dsajYrMkJpOEk2dFYvSnowRXBwcEN3N3hXV1FyVGxGMXdSRU9J?=
 =?utf-8?B?amJQeUtnbTk4ZE9kSkdCakd3MGdPTHBEQThmUXpqN3pwQUx1Z3MrKytWYlRi?=
 =?utf-8?B?T0RveU4vTDZuc1NCakMwMGphdGhMckxrTGZpTEx6czk4YlZYRkdUSXRnV1hS?=
 =?utf-8?B?VytOOTZNeXloTWEzRVNrQktiWWs0VnV2ZG5mUjRUVm50WWtqaEtXeFFpVldr?=
 =?utf-8?B?cFdtckxZeU8zejhFZlFyV1d0ZnpCVWRQZElyRzNHMHVRTnZnV0N0WW1zZDJi?=
 =?utf-8?B?SkRuTDd5WEQraWFVRUVYeXJLTzE2Qk9iTTNGR0crYXhZS0Rxc095RnVwYTUr?=
 =?utf-8?B?MmtJVHFpZElCVElLbnJWdkdZajdjZVZBaXlkSXgrUHhUQVkzMU1zVlZMSDBK?=
 =?utf-8?B?U2Y5WHR3VmJUZ3NHM2RqanVlek1YZTY4MGJUaHQ0YzF5dlBIeXJZVUZ1b1JY?=
 =?utf-8?B?VUdWL05JQlJXN25pWlAxUTVLb2xydm5TQTl3VzVxOHJ0cEFtTjk1ejcvekxI?=
 =?utf-8?B?WS9rblpQY3duK1RkdWNraHh2ZHZKWFJzWGdoa0xia3dEQjBOTnk1ZGFBK01E?=
 =?utf-8?B?OHFmRjF1ODcxTUp5aFBieHBZOHFhMWdaOW1vek5tMU9LT2lJM0JmWGJiVW5m?=
 =?utf-8?B?cHd6VzFxZnVwSVNLWWZETlJyRWFVQVJRa2RVbU1UdGtMczZ0YkpKOXo5M1pY?=
 =?utf-8?B?L0xUSUs2dkx5Rk1yY0Z0clMrbXY2dFN0b2ZrdnhTeFlaNDBxTDlEeHJoQko3?=
 =?utf-8?B?OFk2akNoTzFGQk9ocURsSm5DODNoTU9VQWxCa0F6SksvVTRadDJOV1BYU1RC?=
 =?utf-8?B?ZXJMQUw1RTg0ck9GMWpGMHZ6dkFzYld6MzU0YXczc01KUlZrVWVxelE4RThN?=
 =?utf-8?B?MW14VkJzWDE0NmJDWEtpWXR0Vk1jNUpkanJxZ3dQSVlEMTd3UkFSUUsvRWd5?=
 =?utf-8?B?c00zUkJvTzlkU2R3NURQMC9SWG1USTBveVRJMWJBaUlPenNwcUpnTDY5YXdl?=
 =?utf-8?B?emh5M2VrbXZReUoxeS9GemdaS081bUxXREtzdUZDNjA1S2RSQmJhWUlnNEp5?=
 =?utf-8?B?bkpkUkVYYlZ3bFMzNzFQa2RlYXlxc21qMGtTL05iQVJjVjNDaVgzYnZLdnl2?=
 =?utf-8?B?UGRmeWxzald6NHVPZC9zanZCemZrZ3dwcWJIaTJDRHN0eEJWZjRReUd3QzZG?=
 =?utf-8?B?WXJPN1pQV0VlQ3RodXdWMTNEeXI5dXBHOEVLMGFpQ05pMnFxbi9uNW1odUNy?=
 =?utf-8?B?SVJFUlVFNm9qSVBpaGNYa29FV0JrbTBOZEs3dXZUNVVJUyt5b2tJSHVMWlAz?=
 =?utf-8?B?YzFCNEJXa1VZc0lyMkNtTnN1ZnFmTk9YVm1kSEZSaktYMHRXSHVtbUpOYWI3?=
 =?utf-8?B?RDJiWENuKzFNTkRHZmRhcWdTcnJFQmpjd0cwNWQramsvY1pEcHJ2OHluR2xU?=
 =?utf-8?B?cXFIb3ZXN09DV1dnRG95WnRCaFk4NVlQQ0MrRGpUM1VwdEhLdVIyemp3NDYz?=
 =?utf-8?Q?/ktOyPCGNqHTkVU7hUTTkEI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(42112799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVJaektyekl0N0FlZWlVTDJEeWFBL2pKQ2pvaURpeXMrRHJXanlwenRlbGJz?=
 =?utf-8?B?elhNdEsyN1ZtM1JYMi9WZ2hHZjBxOEN6SkVyNEdlOVdhSXdTdHNXOStHSkRN?=
 =?utf-8?B?emJKSE1xY3RGU3YzdlhNdEEvaVZsUVVPckVFVUcybWRjTGtzMkRyZ2pmdjNv?=
 =?utf-8?B?RzRjVENiUmhHODJzR1ZYODFGblNsbFZVSTZUQzRmSC82WkJFbk5FbW9QK00x?=
 =?utf-8?B?bUlCKzd2UU02cGE4b2I3NWVxeXVWVGNEUC83anR3YnZ3QU1oTlpWYzFwaEw3?=
 =?utf-8?B?VS92MkxGSTBFc0VWZ1BPOXdaUUdUTjc2VVRzVjhaZENOOENGaG5RYlBmU0dC?=
 =?utf-8?B?eHMzNUFndUN0dzN3dGFNV3NPazQ2L055azIwa2VSOU1QK1puWnErYkc2SHFN?=
 =?utf-8?B?cW9Ub0p0SU5GOGRyYzJ5SENaZzJvVU5rZERGQStpRWRmL09DZGpBNmthM2kw?=
 =?utf-8?B?TWFpZHdaY3QzVS9FL1lCV1dZSm5zZU5jVG5EVFhvckU2ZFp0a0gvVlRqUmp2?=
 =?utf-8?B?WWhSRlo5RUVxR1hESkpDTDhpK3pUNnRGM0hFUHRZalV4VndaQ2tSMm9ZWVha?=
 =?utf-8?B?K0hjREhLUTlzVDRjdXJyZ2doS285bTMxZEhZeEJhdm9GeUxMd0pFVXZIL0RO?=
 =?utf-8?B?QUtOVWdic3duRmE0TzVFUFpiR2M4dklpcmpab2RFbTRUbHBMU1pLZk8yeWRn?=
 =?utf-8?B?VjJsTWtKNDRCN0VYai9jaHBRbnc1Qm44NEszc1JJQktEZkhadk1PWVVHN0Zr?=
 =?utf-8?B?YlhBNXRIYkdTc2dWbzdRb3hCc3AzaWg4ODJZa0FUSDgzRVdxQ0M5QmI5REts?=
 =?utf-8?B?alZPc2tTNkJ0TldpcXRFaDl2R0xSQlBFblNiQ1RsSFpScEZUeDFoR05CSnZ0?=
 =?utf-8?B?eHJTMnRRZjA5akFrZTA3Mzdvd0dMY2dkYkRUNDUzWC82RDhKZkJSVHkvRW1E?=
 =?utf-8?B?OTh2VkMvWlJtZkhPUTllS3A1dEY1TlV3OGwxUEhLdkx4bGZLY0xVV1EyMTNX?=
 =?utf-8?B?c3lBZytwQTRaZGtRampsRkF2a3dTdmxObndlakxGYnBIZFlrNEhiN0pZOXhp?=
 =?utf-8?B?T25KUlNXazRrR0ZCZzVJUHNJZzQzNGtvZG00OFVGMllnM3p5anc3d1ZYRXpW?=
 =?utf-8?B?NU1mb2Evb1RqczhVUGpEVmZsMUY2VGNyaXJPT0lIZEozTnJIYlE1OS8wSUFH?=
 =?utf-8?B?azY1alF3c0hkN1VHR2Q4YnU0TXFEeVRxU2oxR3F5TmxoN1JqUXdiZUVQRWJ5?=
 =?utf-8?B?UnhVWmFBakt1MFRac2gzVTd6T1FyMlpaRGpKekNWSTlHancxUFo4bHV4a05m?=
 =?utf-8?B?dE1ycmxORFA0VnZEdXNjZDVmQmI4RSsxRlY2ZTFVaTFPZzE0L3ZmUmM1Rm8r?=
 =?utf-8?B?a0J4aW95RkFSZGVqNUtJT0lzYVdlYTFuR1VaUGdYRVMzUjlFcVVqMkZLY2pj?=
 =?utf-8?B?RTZYZDNyaTR3M1JabnAvL2FCZlFNdVM1NG83K1lqV0FISS9yblBvMkgrOTVn?=
 =?utf-8?B?SXNPaFhWUTJBK1pPZjcyeGtsVGtTV3ZLOThQS1F5LzFOUy9ob0p4UXYzSmJJ?=
 =?utf-8?B?YjgrNTlCanpCdXhmRm56NjRQbFRBR0x3alYwV3Q4TEhFWXk3aG9nVTViR2VY?=
 =?utf-8?B?Y0lwUENJYzdqaTQyRjJZT2tKajJkSldVQUlPNVh5UUQ3VXhhWkUybEdSLyt5?=
 =?utf-8?B?RnkvNXY1elFoT3BiMnRVaUozUStleGlTRE9KdnBpTjQvdDFURWdoc3FCNi9h?=
 =?utf-8?B?QlhVN0lDWmtOaWx6NG16a0w0ZUx3QXEybFYydkk4MkwrU0JpSXdqZ01NeDdy?=
 =?utf-8?B?L3g0UkdPS3lTemRDb2R3VDZXS2RQclM5c3Nkb2ViTlpvdEtjd3VkVkpDWEgv?=
 =?utf-8?B?dERFYmNJNWdreFJOZGlVQURJVU5pWFE4bDBMRjJvREdtckpjdUVramJRVlhL?=
 =?utf-8?B?eWZ2SWpyRkY4bG9oZ0xXSUs4dlViVXQ2UDFUNUF6QVlUdmc2cEhVais4bC9G?=
 =?utf-8?B?dURabzRWS0tOTk90eG84TUF5cGdxaUlZamUwMUNjVE5VcDVHMzZPWTNIajJR?=
 =?utf-8?B?OFNlbnRXeStTbHlTWDY3enBteFErT1ZlU2xtQzl0bUZIZ0JjbTdDTSt0T0lU?=
 =?utf-8?B?bnhUOHlIRnF1RGt5R0NVZVJOSjgzcGlkVGlCb05LV2Z3RTg3Q05VRWRXNE9s?=
 =?utf-8?B?dmpXNDVrUlVGc0RLdm9xL0lNM0lvRHVXcEpFMGRPeUwyMCswcXk0dkZoSm00?=
 =?utf-8?B?dW9FdW51dUQ4bVI2WllWQ2ZaMmJ2Y0ZRWnhodno4aDNZS0s5SUl5VnFoQXdX?=
 =?utf-8?B?TDhKSEJGT2kxMEd5TnYzVXVsTXJub2VsOU9SNHd0dGQxNDlaMDQ5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B88BFFA20F824D4AAC15A106E1A468B7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b73508-f10b-4432-d5b1-08de54d7748b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 08:15:48.2599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hdN9n+o+1gwCzCDQk4FGwjYhOijbD1IK/6S0SqxrXQt6rCU+PZJwGwx4xlQtRj3riFyuEVQ4B6efwgaO0Z9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8275
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_001604_051556_48F9D3F8 
X-CRM114-Status: GOOD (  19.55  )
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

T24gVGh1LCAyMDI2LTAxLTA4IGF0IDExOjE5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gVXAgdW50aWwgbm93LCB0aGUgTWVkaWFUZWsgRFNJIENvbnRyb2xsZXIg
aGFzIGFsd2F5cyBiZWVuIHdvcmtpbmcNCj4gaW4gTG93IFBvd2VyIE1vZGUgKExQTSksIGFzIHRo
aXMgZHJpdmVyIGhhcyBhbHdheXMgaWdub3JlZCB0aGUNCj4gTUlQSV9EU0lfTVNHX1VTRV9MUE0g
ZmxhZyBoZW5jZSBuZXZlciBzZXR0aW5nIEhTIG1vZGUuDQo+IA0KPiBJbiB0aGUgY3VycmVudCBz
dGF0ZSBvZiB0aGUgZHJpdmVyIHRoZSBvbmx5IHRoaW5nIHRoYXQgaXMgbmVlZGVkDQo+IHRvIGFk
ZCBzdXBwb3J0IGZvciBEU0kgSGlnaCBTcGVlZCAoSFMpIHRyYW5zbWl0IGlzIHRvIHNpbXBseSBz
ZXQNCj4gdGhlICJIU1RYIiBjb25maWcgYml0IGluIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVy
Lg0KPiANCj4gQ2hlY2sgaWYgZmxhZyBNSVBJX0RTSV9NU0dfVVNFX0xQTSBpcyBzZXQgYW5kLCBp
ZiBub3QsIHNldCBIU1RYLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gaW5k
ZXggZTQ5NTNkNWNiNmE4Li5hOTBjYWU5NTEyYzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYw0KPiBAQCAtMTU1LDYgKzE1NSw3IEBADQo+ICAjZGVmaW5lIFNIT1JUX1BBQ0tF
VAkJCTANCj4gICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyDQo+ICAjZGVmaW5lIEJUQQkJCQlCSVQo
MikNCj4gKyNkZWZpbmUgSFNUWAkJCQlCSVQoMykNCj4gICNkZWZpbmUgREFUQV9JRAkJCQlHRU5N
QVNLKDE1LCA4KQ0KPiAgI2RlZmluZSBEQVRBXzAJCQkJR0VOTUFTSygyMywgMTYpDQo+ICAjZGVm
aW5lIERBVEFfMQkJCQlHRU5NQVNLKDMxLCAyNCkNCj4gQEAgLTExNzcsNiArMTE3OCw5IEBAIHN0
YXRpYyB2b2lkIG10a19kc2lfY21kcShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCBjb25zdCBzdHJ1Y3Qg
bWlwaV9kc2lfbXNnICptc2cpDQo+ICAJZWxzZQ0KPiAgCQljb25maWcgPSAobXNnLT50eF9sZW4g
PiAyKSA/IExPTkdfUEFDS0VUIDogU0hPUlRfUEFDS0VUOw0KPiAgDQo+ICsJaWYgKCEobXNnLT5m
bGFncyAmIE1JUElfRFNJX01TR19VU0VfTFBNKSkNCj4gKwkJY29uZmlnIHw9IEhTVFg7DQo+ICsN
Cj4gIAlpZiAobXNnLT50eF9sZW4gPiAyKSB7DQo+ICAJCWNtZHFfc2l6ZSA9IDEgKyAobXNnLT50
eF9sZW4gKyAzKSAvIDQ7DQo+ICAJCWNtZHFfb2ZmID0gNDsNCg0K


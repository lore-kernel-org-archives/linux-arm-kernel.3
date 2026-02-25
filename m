Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D6EFD20E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ml4edD1pGs607lA129GWYUYOTnDyVzOYUomJcqrm2o=; b=YHxQfcJHrkBqX6kcI1bWHMs0Mh
	GTtIVFKLWlucPykpiAQkPsRZqaHJ9cAoSbGMoMGTjMyZwmYJCpQER9elaWFiImTAV8QjrdxXuNIPa
	g2nWNlOgPeymfNqsFT+ryFVos/Mb3i5BiH6bh8B4dA+cDYPBdC5X809cKcLF4itM7fpjafxjd23A+
	0VUP0qkABfmN3S7qQWiPinxzxiw8hciJ4hY3ZRd999Lxf9HSFGCMh8kBSje9aVKCRZ8ZU21Bo/0Fc
	EpeGJKePQwdye+s/PEVy7jw5rPnSSr15fVoRFgAhINOUlB6Dqk7ssjrqV1nNpqUi2b3gzcBrY9AKI
	Kf0psklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAez-00000003abe-3MxL;
	Wed, 25 Feb 2026 08:54:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAew-00000003aaj-3OEo;
	Wed, 25 Feb 2026 08:54:19 +0000
X-UUID: 8f23f9f4122711f1ad39f32c34db0b1c-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+ml4edD1pGs607lA129GWYUYOTnDyVzOYUomJcqrm2o=;
	b=SaR5K+xfLHAuqOR/UmEkfGJI9N6OF8lpgmimwgsuVNJM7zkYE7p8oKWDH32VPHeggPhoY6J5VERunR8mhcRXIOVZxE4vXOmoMsHSmrRbtn98XCn/VRT6GEli5zN+GRJk8frx0R4DexOJWv7wx2bD4r6SpKeJicGKNurmC76YnZE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:35f653bf-6510-4a4e-a838-9ce02463830f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:59a7f9e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f23f9f4122711f1ad39f32c34db0b1c-20260225
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 506152416; Wed, 25 Feb 2026 01:54:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 16:54:11 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 16:54:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG2zsWkMEYkjhI+4QGm++Zs0eFrQmNenbCHvSi8EWp/oOMDj5sIT8GLhoo4THH03cIJNMaSjtamwK9jxh5rzPrpKqs1pJecTGudpCSCDICMhF63/xbjOoyrUzXWCTMWhnoWsFcCpnbGkCPZ8cwHyjjwc+CcaMiTZXZBELye0yrXJueE8/B0WkulMj3jX5CmF5rTPcBG0EeDD+xXd6Mrq3U+mPAKJU5YvDLmZnjLOkJArc9PGHutv1kEatUu5FQ1V+gMzbS5AgdIOorDJOkWVmh4qWHJ7+ujv+f2q++c8+HsSoveQpjFZnbmWdLIbV88CB/2eqU/jQC0Q6HpvJEENXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ml4edD1pGs607lA129GWYUYOTnDyVzOYUomJcqrm2o=;
 b=v7pDgcA6jwoVb90EIUKoLgkxe9uNknkG9YaIuqFzMkpDnggUPkGCKs4ZL0yZXQJdvM6D+IgSLqOO4peoJKD5+ZTMfamWPoFINXdWC+Iinkp5uMoX94G5Uzyb2jJ5ezzwa0V5Ai7vpw3yvwyvKEz3Drf9JQ6KR1ILqWdFcu5iWtoFa/9o1fFs6zgwb4ZorZcEFiRW3vFd31qoHH8IPcLMuSVZUuKd3xV2Y9CSUwpm94AAeDJfS0NLC66P/DINHmh4wp4T0fN/BG/NoGJ6rUOJL/Z2oIzMvqmR3PaBOrEi7d6Vngy2TSzHsXr73RfKikSp868lslZJH/+fcWX7a5iBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ml4edD1pGs607lA129GWYUYOTnDyVzOYUomJcqrm2o=;
 b=LTdN1U/OfJZLzbiAro9SRbY8K2ixfKm6jj3xCUvtDd8WAoIKwegbc4Tw0uoXh1OxKNp0ib4Dhln89KvDefR5UeOuhEDApS52Ae3NF8GFZGAdw8yHyBcdbEKlSwjUFOe5SoPWqZMZkWOaNGkksjOBMBfdMmbBxJoWN1aFsoXk4sg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7488.apcprd03.prod.outlook.com (2603:1096:101:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:54:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 08:54:06 +0000
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
Thread-Index: AQHcdET9pde+1+r3AkuvaEgemGj7XbWTgA2A
Date: Wed, 25 Feb 2026 08:54:05 +0000
Message-ID: <e6c5ee0f34f6347176f2918e88f6958a493da104.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-5-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-5-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7488:EE_
x-ms-office365-filtering-correlation-id: 5c464356-264f-4207-a7d8-08de744b6e96
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?UURyaERueFFhcm9wdEZIaXBKMENNTVcxNWpHOVVpdC95WENHMnNNYjU5a1Ji?=
 =?utf-8?B?MjF0bXF2c3VmTEVOSDU2Z3M5UmRUVFptamhZRG5Wc0puSW9SWHFFSjVLUmxN?=
 =?utf-8?B?VXo1R0ZCMUVCSWgrbnplQlMyRjRTclF0YkpBYmRBbkVmSmN5ZGdITEM3T081?=
 =?utf-8?B?bXlsb3I4U0FRalNRWHNZZUhwMllUbU1xMG9vQ3lZNmNBRkw1SGkybUN3S1dW?=
 =?utf-8?B?c1FrLzZDNzFaeEZkTUd5d2FSR1F5dnVLa1MyVUdQSFYwSC9KeEJMMVErczds?=
 =?utf-8?B?OHExRXBVSlVGVkNCUjZKcGZtVkNzeHBOVDhKWGVlRGJXeDZoTnNMOGFYN2VH?=
 =?utf-8?B?dUR6cWdzSGZsdXljOGgyYml0UHE1SmZWWmhWY3h5QXE0N0pzcTRlVlZuVFlV?=
 =?utf-8?B?TXlPYzcyTTZIY3R0bzhZdGJMNk1HZFZPN3hhQXFyTjFqeE1rNmI2OFdBVCsy?=
 =?utf-8?B?elVIektPaWZYQUxPM295TXZ6SGtRRmxzL2R1UkROaXNQQVU1ZnNIdzlUZno0?=
 =?utf-8?B?ekN4UTZWZjdNLzVMSHY0OWVEaCtSSCt5RUR4TGpWTEhXUkNzd0Ywc3ZJeTRH?=
 =?utf-8?B?MmQyVXFMcm9GZVRWNndFRmFaOEM5RkRXYVZqamRrT0cvbDZFUElRWnE2QmdF?=
 =?utf-8?B?OHl2THkwQy9IM05lbXg3Y1l4VE9WaXhqb1lZVm5TVHZsdUJ1SlNZd0pLNEM1?=
 =?utf-8?B?WFkxb0dDZU9HSEFYam9pNTh5RWZZcWRvVFZ2WlQ3MHB1VFdiaVlPdEQ1cGdV?=
 =?utf-8?B?RzZBZmRFQ3B2WGZ4Rjl3d0VzdTVBSi9xVUxVYm1MZTVmRG5uNHo2dUlFSEVj?=
 =?utf-8?B?MGc1Q0ZLc0MyRlNBdFU0WE9Id1NmOTFrME9XNlZjQzhXc1BxWkVyQmE4aWJs?=
 =?utf-8?B?N1J1elNwcGRVT0tnZGdRZjE4T0g5QWxmQzVsekp2MTFUbW9SalRxVXV0djl2?=
 =?utf-8?B?R0E0Vi9pQW41WlE5UjB2TkZYVmJ1R0NHUi9LVjVOeWpNaXBXTHhNeUJtN28v?=
 =?utf-8?B?R2xzNHdqQWg3ZzdGb0xyZVRQRkwrVzVXSWkyTkVQaSt3ZFNnRVlFbE9nQ0lE?=
 =?utf-8?B?cXVBb25palpiL2RlVk80bGk4ZmJKN3F5MUFGRldkdzFhc2gybzl3aVJvL2Vz?=
 =?utf-8?B?ZkhQU1o0QnJuT2RCNTJDa3EzUWQzdWwrT1J2elFFaDVqWEpWamkyL1pINmgx?=
 =?utf-8?B?cTNRVkVuRjIyeXZIWEhjZFRGdGI4NnZzRndQVk5ZaFlnMktKTEUvK1ZyOEx0?=
 =?utf-8?B?SWVMdmJxZTBubjFxTDhCQ0xXM0N6Y3pWc0N0M0RlaERicUFpdVFRQ3pxK2pX?=
 =?utf-8?B?YUNyelJ3OGFUeEpDS25JOTd0RWxuS3RxOUdINFRKNTdwZFc2d0dNTk1yTndP?=
 =?utf-8?B?NDdmMStrbmhQbHFnenFGclNFd2MzZFJ3ZWFpWW8way9tVVZWMm9oZzVodzda?=
 =?utf-8?B?ZW95ZUZRSS9CTFpuazh2Q0xLUUVnNlRUSGZwVDB2aU5YQTNOWnRvdTlWbi84?=
 =?utf-8?B?SEI4OGdPZnFNTnJ3MzQzbnRPUTlldXRDMmlXZDg1MWVpLy9Ob0JtbkEwMnBM?=
 =?utf-8?B?cW1rYWJmcWlsdnQzcWYvUG5aYnE3SjZMUk5MS3p6aWtpa0RkNUpET3RjYkQ4?=
 =?utf-8?B?Y25haGFtSkVRdlptdkN4cWpMSzFsUkZsaklwcW16eEhyemZZVlByMXVBYzhG?=
 =?utf-8?B?YU1HaklTdTIyajZ6clBQaTRvdjF0MWx3THVqemtEK1lKTDgzUXdFcnZpOG1Q?=
 =?utf-8?B?c2FWNXNFYkxUQkRGcVJyZ29kUDkzN3l2akNDdjZUS0RtWGxnMlN2Q2RVY3dx?=
 =?utf-8?B?SjRxWmx5cm9VSEtnMzVYRUdQMzRvRmw3MExWQm5LUksyWDZQajdYODdHc2hp?=
 =?utf-8?B?Mkp4ZHhCaFVYZDZhdE5ud2Erb0tLM3pvVTdBRHBtVmFWbUEyWmswN2pQUkF1?=
 =?utf-8?B?NksyaS9vN3ZNZzFzNXBERE9HOGt6SlF4ZDZpaEhSSmFjaXh0MDl1V1ZSVE0z?=
 =?utf-8?B?Smd3bjdVekNDdGdxbXVOcHRUTlNSZHZpdEgxYmFXc1BnNjFHc3Y1UHpnTWxH?=
 =?utf-8?B?Z0tlTkMyeFpzU0dvL0ozbGgwWGN0UmVhYk43MDFXTFEyZEczeFY0bXRleG10?=
 =?utf-8?B?Z09sdFpxNVJZeXNFbWVrL3oyamJhTlhhRlZkTFFQRVNLTjhnU244ZlgwVFlX?=
 =?utf-8?Q?FBH4H/ytcX/iKGA+ORm++rSG1yjvVbUo8MWmmlun1AXB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVhJaVhJSGdmZU9GeXJ4K0dFTGJPbVdvQ2tseVRKMCtpNis2dmVzM2xqS3Rj?=
 =?utf-8?B?MVhLNWdvVXZvQzJvb2dhMDIybS9rMzRtdC9zK1k4OWNsemtyVnRRV01wZWtU?=
 =?utf-8?B?TlFZMFdGZjhKL1FkTjBCQ08yeUdvanZrQk5ZUWZoYjdiYnFUMysvTFo1TGs5?=
 =?utf-8?B?OFJaY0ZvdWdvV09IaFhiV1YxK0ZLbWpYandwMkluMitrdmlyMjFYNFJ5dGpo?=
 =?utf-8?B?QkUyUnNqZWllU0dNT0Vua1g5N09PazhaNVBqdndXNGk5UVZmVitnVmo0aE1l?=
 =?utf-8?B?K1daaFVrQ0o3aVVrRzVsd0Rnd0t2Z0FPWXpjbFZ4d1hsYUZRSkN1MlpGOG9U?=
 =?utf-8?B?S0VXUU5EWWhmdzMrZXltSjRCR1JHTVV5WSs3d3REWXZoYlhvTjhsVTQ1c25T?=
 =?utf-8?B?Rkl1bXZ4OS8rL3VqditJemxrZ294V2swQWJ5OVF3cld2VjUyWE5KOFNuaDlK?=
 =?utf-8?B?WFZrRko0ekZsWWxyVkVsYTRIMjJyQnVxdWVmUHpqYUpyb1ZHY2xLNGhqQUZj?=
 =?utf-8?B?VkRpeTZkeEtHMklpOG5XcFhneWZNaExqcFlNMkNSRDNGWTRhb2QrQ0Mzamti?=
 =?utf-8?B?ajVUM0t5VXFIb1VnNDM3T0RBdlN3VGF5VmlyV01PMWdENnZUa09STVUwUkkw?=
 =?utf-8?B?QW5vaTZQWEJUQjUwWXQ5RXNEc1NNN0ZKb25jV2phM2xCYStsVkRibEZwL3Bp?=
 =?utf-8?B?Z04zMUtqZ2k4dk1oMFpYVXBXejR2ZGRiK2I0TFVSOXVwR2Mza3Awamhoa2NU?=
 =?utf-8?B?Y1kyQmoyRlpiN3FIUlIyaUhCTnNnYk1USkY2amh0ZCsvVDlvR0xPbXNFQXQy?=
 =?utf-8?B?NHhLMnEyMy9MTk1MY2ZOSzRIVnREMmgzZlc1L2xDcVhQSy9mLzkwdEprQ00v?=
 =?utf-8?B?eDAzQUUwOENwaDBIYVVLcjBqMGx3WXJ1dXVOa05rckI4MzlJUUlDWWdvNHpB?=
 =?utf-8?B?S2lkNHBrS2hlaml2QjdjTEJLM0NQcVQ1RExqcDhYdWliV0lnYXdxdDVaNURE?=
 =?utf-8?B?bDZ2Vy9tQllCcC9idnkvZUdqdnZtQzNnTkZkcEsxK2U2bU1rN2xnQ0NlZ3Bl?=
 =?utf-8?B?alJmOFJzNDZtejM0NVNGYVdEby81M3BKbGJHNGNBZXpIQlVqVTBHOGFUNVhL?=
 =?utf-8?B?cGRyVTBpYm5DZlNhcERkekxhWTVoTlpwVGxwSmZjWDlwcWV2dUdBSHE0dFR6?=
 =?utf-8?B?VmJCTksybWZYdG1uc1lYUC90UmU5SEp0a3k1cFE0QkZzSVZIVjNwWit2YzZi?=
 =?utf-8?B?Z01yd2Z2MXJxdFlkRVJKZnQrcm1hRHdRaVNWRSt0YjBCNURkUXE4R2RMNlh5?=
 =?utf-8?B?cmQwanc4MGVZL2ZjeDN0QWZDelBVdnJpeDY3Smp3cmJPWnBpRDJQZ0h4akdh?=
 =?utf-8?B?ejh3NW5tYWs4NExXdi9GempDSHhPWE4zdy9BMEp3ckpIMU9XQzNhMkVIWjNH?=
 =?utf-8?B?N1dGWGwrMjJYL3crYUJ3bGgwNVowYUorTGJRYnMyRGNpbGV6SStFWm1KWEJz?=
 =?utf-8?B?SGZrcDNhMUtaa2h0ekx3UXhBWU0zNURxYlROUmE4SEladkRnWUM4VmJWK1pC?=
 =?utf-8?B?a0ZsNHJIMVYrWG9UNkdqSkVPZktTUC9ScmM3YjJsZ05UWmhMWWFSUkFYZGJy?=
 =?utf-8?B?NTBiSU9HY2VIVzhEaXkyZ1ZjUStWZTdIOEJ5dEhiVnJVSTgwZHBDWXFmbEVZ?=
 =?utf-8?B?QklwTSsxNU1Hd1I0K1FmVVIrWGZET3ZHVmZZSVJ6ekJVUHhhSEp0dXQ1V1VD?=
 =?utf-8?B?VEUyaGV2Z0s1b3lLSUVoM3V2Q3pCZXY3Y0VvL0lrMlMxVFQxR09WcVpyM0Fa?=
 =?utf-8?B?V2gvY2wwWjhzcVhwVTF1ZUYxcFNvZ3pTN0RBdWJUZ2xHTitJbDZFVHk0R0lS?=
 =?utf-8?B?WDQwOUZWTTZQZmpKb1ViUXpQUVNwaVVCbXlvRXczeHAzV1dqQ1lheUdVR3JP?=
 =?utf-8?B?M3pIMit3VmhoQ1EwZ3hERG8wUis2cUl0eHNaZ2w5cGoyd0VBVjllU2w1T0FS?=
 =?utf-8?B?OUtTa0IwTGxFUk5WOEJHVDlrbUJJdTM1RmpRSENvbXFPQzhFVG1EZ3NYK3Z2?=
 =?utf-8?B?cU1US0haRW0rY3ZpYnRjREFXSEVFeCtBREs5eHNTMWhnQnhqMmQ0bUluTnJv?=
 =?utf-8?B?WmFNZE5hRk5GOGFGME5IK3FBKzM4M0R5RmhLQW8vamUxUlJVMktLSEQ0dDE2?=
 =?utf-8?B?T3JQSVNySEQ2Sk15a3doU3RLSkdqZkNSUDRXQk0zWjZ6cEVaMmhpdWMwbmhY?=
 =?utf-8?B?Rm1aRzhLNUN5bmhiUjlrRUFJTGkyVjc4RVFjYVQ1R1dtN1JRUDRQSUtTZk1C?=
 =?utf-8?B?RTBtejJ0dml5bHRMckhyN1ZqMXdmTzk4TStSQ095eU1WbXp3WDZXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F550BA10A6475419B025EB7ED3C336E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c464356-264f-4207-a7d8-08de744b6e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 08:54:05.9380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXDs0rf7eHxx/i57816HoZYZP0LwUcZr6e+8fW0cYTwuD+TOM+Xkr8HTpgl6U864DpwjqNEHa7UtDK47VPswig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7488
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_005418_866655_1B6A4853 
X-CRM114-Status: GOOD (  12.61  )
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgT1ZMIGhhcmR3YXJlIGFsbG93cyBzZWxlY3Rpbmcg
YmV0d2VlbiBkaWZmZXJlbnQgZml4ZWQgdHJhbnNmZXINCj4gZnVuY3Rpb25zIGZvciBlYWNoIGxh
eWVyIHRocm91Z2ggdGhlIEludmVyc2UgR2FtbWEgc2V0dGluZy4gQXZhaWxhYmxlDQo+IGZ1bmN0
aW9ucyBhcmUgc2NSR0IgYW5kIEJULjcwOS4gSW1wbGVtZW50IHN1cHBvcnQgZm9yIGl0IGFuZCBl
eHBvc2UgaXQNCj4gYXMgYSBjb2xvcm9wIHRocm91Z2ggdGhlIERSTSBwbGFuZSBjb2xvciBwaXBl
bGluZSB1QVBJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gDQo+ICAjaW5j
bHVkZSA8bGludXgvY2xrLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+IEBA
IC00Nyw2ICs1MCwxMiBAQA0KPiAgI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9CSVRfREVQVEgoZGVw
dGgsIG4pICAgICAgICAgICAgICgoZGVwdGgpIDw8ICg0ICogKG4pKSkNCj4gICNkZWZpbmUgT1ZM
X0NPTl9DTFJGTVRfOF9CSVQgICAgICAgICAgICAgICAgICAgICAgICAgICAoMCkNCj4gICNkZWZp
bmUgT1ZMX0NPTl9DTFJGTVRfMTBfQklUICAgICAgICAgICAgICAgICAgICAgICAgICAoMSkNCj4g
KyNkZWZpbmUgRElTUF9SRUdfT1ZMX1dDR19DRkcxICAgICAgICAgICAgICAgICAgMHgyZDgNCj4g
KyNkZWZpbmUgSUdBTU1BX0VOKGxheWVyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
SVQoMCArIDQgKiAobGF5ZXIpKQ0KDQpCSVQoNCAqIChsYXllcikpDQoNCj4gKyNkZWZpbmUgRElT
UF9SRUdfT1ZMX1dDR19DRkcyICAgICAgICAgICAgICAgICAgMHgyZGMNCj4gKyNkZWZpbmUgSUdB
TU1BX01BU0sobGF5ZXIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRU5NQVNLKChsYXll
cikgKiA0ICsgMSwgKGxheWVyKSAqIDQpDQo+ICsjZGVmaW5lIElHQU1NQV9TQ1JHQiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMA0KPiArI2RlZmluZSBJR0FNTUFfQlQ3MDkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDENCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZM
X0FERFJfTVQ4MTczICAgICAgICAgICAgICAgMHgwZjQwDQo+ICAjZGVmaW5lIERJU1BfUkVHX09W
TF9BRERSKG92bCwgbikgICAgICAgICAgICAgICgob3ZsKS0+ZGF0YS0+YWRkciArIDB4MjAgKiAo
bikpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9IRFJfQUREUihvdmwsIG4pICAgICAgICAgICgo
b3ZsKS0+ZGF0YS0+YWRkciArIDB4MjAgKiAobikgKyAweDA0KQ0KPiBAQCAtNDkyLDYgKzUwMSw5
MSBAQCBzdGF0aWMgdm9pZCBtdGtfb3ZsX2FmYmNfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGlz
cF9vdmwgKm92bCwNCj4gICAgICAgICB9DQo+ICB9DQo+IA0KPiArc3RhdGljIGludCBtdGtfb3Zs
X2NvbG9yb3BfY3VydmVfdG9fcmVnX3ZhbChlbnVtIGRybV9jb2xvcm9wX2N1cnZlXzFkX3R5cGUg
Y3VydmUpDQo+ICt7DQo+ICsgICAgICAgc3dpdGNoIChjdXJ2ZSkgew0KPiArICAgICAgIGNhc2Ug
RFJNX0NPTE9ST1BfMURfQ1VSVkVfU1JHQl9JTlZfRU9URjoNCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBJR0FNTUFfU0NSR0I7DQo+ICsgICAgICAgY2FzZSBEUk1fQ09MT1JPUF8xRF9DVVJWRV9C
VDIwMjBfT0VURjoNCg0KSSBkb24ndCBleGFjdGx5IGtub3cgd2hhdCBEUk1fQ09MT1JPUF8xRF9D
VVJWRV9CVDIwMjBfT0VURiBtZWFuLCBidXQgdGhlcmUgaXMgRFJNX0NPTE9ST1BfMURfQ1VSVkVf
QlQyMDIwX0lOVl9PRVRGLg0KVGhpcyBwYXRjaCBpcyBhYm91dCBpbnZlcnNlIGdhbW1hLCBzbyB0
aGlzIHNob3VsZCBiZSBEUk1fQ09MT1JPUF8xRF9DVVJWRV9CVDIwMjBfSU5WX09FVEY/DQoNCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBJR0FNTUFfQlQ3MDk7DQo+ICsgICAgICAgZGVmYXVsdDoN
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArICAgICAgIH0NCj4gK30NCj4g
Kw0KPiArc3RhdGljIHZvaWQgbXRrX292bF9hcHBseV9pZ2FtbWEoc3RydWN0IG10a19kaXNwX292
bCAqb3ZsLCB1bnNpZ25lZCBpbnQgaWR4LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZHJtX2NvbG9yb3AgKmNvbG9yb3AsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpDQo+ICt7DQo+ICsgICAgICAg
aW50IGN1cnZlX3JlZ192YWw7DQo+ICsNCj4gKyAgICAgICBpZiAoY29sb3JvcC0+c3RhdGUtPmJ5
cGFzcykgew0KPiArICAgICAgICAgICAgICAgLyogaWdhbW1hIGN1cnZlIG5lZWRzIHRvIGJlIHNl
dCB0byBkZWZhdWx0IHdoZW4gaWdhbW1hIGlzIGRpc2FibGVkICovDQo+ICsgICAgICAgICAgICAg
ICBjdXJ2ZV9yZWdfdmFsID0gSUdBTU1BX1NDUkdCOw0KDQpJIHdvdWxkIGxpa2UgdG8gc2V0IGln
YW1tYSBjdXJ2ZSBhZnRlciBkaXNhYmxlLg0KU28NCg0KaWYgKGNvbG9yb3AtPnN0YXRlLT5ieXBh
c3MpIHsNCgltdGtfb3ZsX2Rpc2FibGVfY29sb3JvcHMoKTsNCglyZXR1cm47DQp9DQoJDQoNCj4g
KyAgICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgICAgY3VydmVfcmVnX3ZhbCA9IG10a19v
dmxfY29sb3JvcF9jdXJ2ZV90b19yZWdfdmFsKGNvbG9yb3AtPnN0YXRlLT5jdXJ2ZV8xZF90eXBl
KTsNCj4gKyAgICAgICAgICAgICAgIGlmIChjdXJ2ZV9yZWdfdmFsIDwgMCkgew0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fV0FSTihvdmwtPmNydGMtPmRldiwgMSwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIkludmFsaWQgY3VydmUgMWQgdHlwZSAldVxuIiwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29sb3JvcC0+c3RhdGUtPmN1cnZlXzFk
X3R5cGUpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47DQo+ICsgICAgICAgICAg
ICAgICB9DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgbXRrX2RkcF93cml0ZV9tYXNrKGNt
ZHFfcGt0LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBmaWVsZF9wcmVwKElHQU1NQV9N
QVNLKGlkeCksIGN1cnZlX3JlZ192YWwpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAm
b3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19PVkxfV0NHX0NGRzIsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIElHQU1NQV9NQVNLKGlkeCkpOw0KPiArDQo+ICsgICAgICAg
bXRrX2RkcF93cml0ZV9tYXNrKGNtZHFfcGt0LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb2xvcm9wLT5zdGF0ZS0+YnlwYXNzID8gMCA6IElHQU1NQV9FTihpZHgpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19P
VkxfV0NHX0NGRzEsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIElHQU1NQV9FTihpZHgp
KTsNCj4gK30NCj4gKw0KDQpbc25pcF0NCg0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2NvbG9yb3BfZnVuY3MgbXRrX292bF9jb2xvcm9wX2Z1bmNzID0gew0KPiArICAgICAgIC5kZXN0
cm95ID0gZHJtX2NvbG9yb3BfZGVzdHJveSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCB1
NjQgaWdhbW1hX3N1cHBvcnRlZF90ZnMgPQ0KPiArICAgICAgIEJJVChEUk1fQ09MT1JPUF8xRF9D
VVJWRV9TUkdCX0lOVl9FT1RGKSB8DQo+ICsgICAgICAgQklUKERSTV9DT0xPUk9QXzFEX0NVUlZF
X0JUMjAyMF9PRVRGKTsNCj4gKw0KPiArI2RlZmluZSBNQVhfQ09MT1JfUElQRUxJTkVfT1BTIDMN
Cg0KV2h5IGlzIDM/IElzIHRoaXMgaGFyZHdhcmUgbGltaXRhdGlvbj8NClByb3ZpZGUgc29tZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGlzIHZhbHVlLA0Kc28gd2Uga25vdyBpdCdzIHBvc3NpYmxlIHRv
IGNoYW5nZSBpdCBvciBub3QuDQoNCj4gKw0KPiArc3RhdGljIGludA0KPiArbXRrX292bF9pbml0
aWFsaXplX3BsYW5lX2NvbG9yX3BpcGVsaW5lKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wcm9wX2Vu
dW1fbGlzdCAqcGlwZWxpbmUpDQo+ICt7DQo+ICsgICAgICAgc3RydWN0IGRybV9jb2xvcm9wICpv
cHNbTUFYX0NPTE9SX1BJUEVMSU5FX09QU107DQo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9IHBsYW5lLT5kZXY7DQo+ICsgICAgICAgaW50IGkgPSAwOw0KPiArICAgICAgIGludCBy
ZXQ7DQo+ICsNCj4gKyAgICAgICBtZW1zZXQob3BzLCAwLCBzaXplb2Yob3BzKSk7DQo+ICsNCj4g
KyAgICAgICAvKiAxc3Qgb3A6IE9WTCdzIEludmVyc2UgR2FtbWEgKi8NCj4gKyAgICAgICBvcHNb
aV0gPSBremFsbG9jKHNpemVvZigqb3BzW2ldKSwgR0ZQX0tFUk5FTCk7DQo+ICsgICAgICAgaWYg
KCFvcHNbaV0pIHsNCj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07DQo+ICsgICAgICAg
ICAgICAgICBnb3RvIGVycl9hbGxvYzsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICByZXQg
PSBkcm1fcGxhbmVfY29sb3JvcF9jdXJ2ZV8xZF9pbml0KGRldiwgb3BzW2ldLCBwbGFuZSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfb3ZsX2Nv
bG9yb3BfZnVuY3MsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZ2FtbWFfc3VwcG9ydGVkX3RmcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCg0KSWYg
b3RoZXIgc3ViIGRyaXZlciAobWF5YmUgb3ZsIGFkYXB0ZXIpIGFsc28gaGFzIGludmVyc2UgZ2Ft
bWEsDQptb3N0IHBhcnQgb2YgdGhpcyBmdW5jdGlvbiBsb29rcyBjb21tb24gYW5kIG9ubHkgbXRr
X292bF9jb2xvcm9wX2Z1bmNzIGFuZCBpZ2FtbWFfc3VwcG9ydGVkX3RmcyBhcmUgc3ViIGRyaXZl
ciBzcGVjaWZpYy4NClNvIG1vdmUgdGhlIGNvbW1vbiBwYXJ0IHRvIG10a19jcnRjLmMgYW5kIHN1
YiBkcml2ZXIgcHJvdmlkZSBmdW5jdGlvbiB0byBxdWVyeSBtdGtfb3ZsX2NvbG9yb3BfZnVuY3Mg
YW5kIGlnYW1tYV9zdXBwb3J0ZWRfdGZzLg0KKG10a19vdmxfY29sb3JvcF9mdW5jcyBsb29rcyBu
b3QgYSBzdWIgZHJpdmVyIHNwZWNpZmljIGZ1bmN0aW9uLCBtYXliZSBpdCBjb3VsZCBiZSBjb21t
b24gcGFydCkNCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICBpZiAocmV0KQ0KPiArICAgICAg
ICAgICAgICAgZ290byBlcnJfY29sb3JvcF9pbml0Ow0KPiArDQo+ICsgICAgICAgcGlwZWxpbmUt
PnR5cGUgPSBvcHNbMF0tPmJhc2UuaWQ7DQo+ICsgICAgICAgcGlwZWxpbmUtPm5hbWUgPSBrYXNw
cmludGYoR0ZQX0tFUk5FTCwgIkNvbG9yIFBpcGVsaW5lICVkIiwgb3BzWzBdLT5iYXNlLmlkKTsN
Cj4gKw0KPiArICAgICAgIHJldHVybiAwOw0KPiArDQo+ICtlcnJfY29sb3JvcF9pbml0Og0KPiAr
ICAgICAgIGtmcmVlKG9wc1tpXSk7DQo+ICsNCj4gK2Vycl9hbGxvYzoNCj4gKyAgICAgICBpLS07
DQo+ICsgICAgICAgZm9yICg7IGkgPj0gMDsgaS0tKSB7DQo+ICsgICAgICAgICAgICAgICBkcm1f
Y29sb3JvcF9jbGVhbnVwKG9wc1tpXSk7DQo+ICsgICAgICAgICAgICAgICBrZnJlZShvcHNbaV0p
Ow0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgIHJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4g
DQoNCg==


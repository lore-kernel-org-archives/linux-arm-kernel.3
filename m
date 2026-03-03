Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF7E67A71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=; b=lnBipmG76/Tm4cuds/3exeMWsX
	9MNbTLn0iZCfm3I8KNKReHNoMnm1ptUo6N7qgZdTrB85AYbi/c5W/gNzYgB8KAkDR15ND562hRRjW
	vABK1vCQvZel2ClKCdAyDSf8kfpdfhT2WTWn+z+CItqqhLUA6RMOcIViqKP5xksaOtYIJVe7ZB9+B
	wHknpmyFXLeYmJKkH66wb8ui+YvqaqihvAdVOUV6aznDIHWPnNQpYR0dKWKL5beUg3W9wlZo+jaAf
	LvJhbyMjqjE+z89//img+v8ZYuGuKyv2itM7AiV2Sna6WmFEMxrU1gosDvEGEMEZbcyVy61zjWFUa
	oiLRVzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxK4q-0000000EfSu-0sw6;
	Tue, 03 Mar 2026 07:21:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxK4o-0000000EfRl-1HBi;
	Tue, 03 Mar 2026 07:21:55 +0000
X-UUID: a556e4b216d111f1a16f0188aa809bee-20260303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=;
	b=KCLRwaH9ZLabEVA+ykTxcHGFg8u5P0awjcnBQMEV1rU2gx5e+zhGYmkTDpxzD09m9QAJu7bcAN/CgAHiP5CV+hTpoFxMEkyJOBnW0dx6nooQkaLCZkCEIOFbpqBE8le/iS9s7Oqw0UmvzyfCZABq781NOX6aaCen5EAn3eAL0mw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:795dce3e-92e8-4fdf-a1f3-c3da29c2aeab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:028b757b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a556e4b216d111f1a16f0188aa809bee-20260303
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 549434093; Tue, 03 Mar 2026 00:21:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 15:21:47 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 15:21:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPnyj1eCTEcEUaDdfr2rAlCxWV+xwIhPMCX2qeKn7JzoW4jNegGpJ8W9oxhd/5awGrq/213xeoJ1jSmXX0X3aCgwDVjcOwQ0c4mL/truV3mWxZJ+ke/4rlwmaKdo8xORz1Mt++93R8jjKoWPIj0iNGW3jn5u4T1TRjfaGGbcMcsEaLUTVqZat6L91gvPnbWG8ufECta2b/sNEE2Nm8lpVU1eV+xJmkliTaTsksEIsnTt0uZGdBT/pa7AX8J6aI6JMhxpgDoCwQOUKOM5doQdGqSOZ402JFL4STnOQ2r8bX4r1hdLrLmbghM3y9Hpz14blM+FOEn+5IOKVwtshsYW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=;
 b=X0c3stL79zXMlmRI/8VNA6Eykg+qnblreIwpX4AuHr5gx+9NXcv4AnEmGgetHmzzp0vn9dWW62qvkA4EXReGTjBPzPMxrUIyoJw4uFFu10x1qk4eTXugPZ66FB8duVMwml8JiqAo1vD719O6hQBflkZ/T9P8PZ3dQXETB3iS4T9nuuRLhtgfCsBRI/GnthPsl3YnHz3iqqu0EbmWuZpC3SnCKqDAgIeuEHfmuixUPNmnhZleFgs2O/LUKqYdUYtY9b/nf4LaBDhKYJ91wKtL2mfAI44sw/wO7QYGoSUuHmt3DPGX/jn9YicCXQccQ7sJ/1knyOCZCSVkfjx0uwO40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=;
 b=W9W9ibAZj1Pp88KjqlfFPBEK25h42/CkDMasL0Ilrisv9enuDPSQGrxcxstQDl2eWfBZ/jTI4m7p2WUrXvtuvQnnyU/fRkJeCcsEznlBiD/Rf5x6vP0DZZKo9BM2CBeNRYZVbLeCtO5Sk/oRWmUJ4YyN17qay9rwYTOrTJmCzAg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8798.apcprd03.prod.outlook.com (2603:1096:820:140::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:21:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:21:42 +0000
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
Subject: Re: [PATCH 11/11] drm/mediatek: Check 3x3 Matrix colorop has DATA set
Thread-Topic: [PATCH 11/11] drm/mediatek: Check 3x3 Matrix colorop has DATA
 set
Thread-Index: AQHcdEUS44Tta/8+7UmSOMwdcpusP7Wc1DoA
Date: Tue, 3 Mar 2026 07:21:42 +0000
Message-ID: <b4d8324f849b6d8670387f292eb30f24cbc84cca.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-11-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-11-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8798:EE_
x-ms-office365-filtering-correlation-id: 670934da-6220-475e-740b-08de78f584fb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|42112799006|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: F1/Bvx3sphXKseHl/RIvOo6zbc53uPBbUzyMpM/FnlF4I/qgx5um2hWAeIAQGIgC6NM6ieVYjFEA0jAlqvj0gaJjub/mqdb5Nrlywpp0bszc2ycWp1degoDTATXMf/5boAvld5M8hX9oOIEKTwMy4GKiil6SWrPSBBsCezbDzAjf7ZXYYeQKHrIsKiguWgVSPzpCH1v3ynSo07B/w2rSqgM8lS7Jkk/QOSoxTLP+YCMFXGQA4i29VGh3RAq6HnwomG7p5zI2hcsKAxX3vr1ug5nzJ87ac7Dcwfz9R7AGDQdz0F1kbn1R4dNuazcu28EC9pv+X7Jhpmct6MbsSmwUSxWCyjcu7fpleWnwKTEpbrETqZd4mXs1aEOS6JeQnMJN595NzZQoNF5Dggg8OpCSKk9I2QBMlXuKoKTsfZJIjfj8PydCylgpSZ2GGgMiTD17STVYTWLrGuoFsTCtvm0DdjPEBIpE6txCM5ZqQAg3l1HGqO0V0udzK8FDTqB3D3HD+pdDuEftca+o35TFOJRAnneIvMM78ql25IRuQ8TiKDnQ8dggHs+fS7c00OYTW2hdFg6P4cnH1H6AYPWdgYI305htjd4+dSxs0nbNecCE0gRfTmu+50xXFjaUu5LTYQ4Vjg7zH/Yb2Q1tG2F/ssvkOW0WF1VUsXYCk4jn+i+wv8MroceylCyV0AsnLkyn8vkl4A5kLB5EN1ITkjQzbqwLpg1R6QCByCq1HGSFbrpAvt/g9bdMdGU4mj39OE5nHxbnjk6j73rM5wkmxTuPeY20iZ9Ky2McMKzwSgeO8Ok+21ejE0lMq+9dFx1YLe1a9oq5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0NCYytCR2N6VkRKY2Z0aFBJcisrdDdpUnpqTTZvWnd1UlNIbDlDaXJRNk92?=
 =?utf-8?B?M21jOUk5QVBSdkxBb1d6TzMrNi9hUy9HWG5JQy9jVjRTdGJUU3laWGRtaWFW?=
 =?utf-8?B?cGlyd3AwcnJGUDM0UWtsMFA1N0JoYXdUZllpYVRSenlvZE0zbzlMZlNFV3F0?=
 =?utf-8?B?Mm5FS0NiZlBmVk1ZVERjZlJ6RWJPd3dJNHF0bXU5S2NKbkxyWlRUeFZvSGYv?=
 =?utf-8?B?QUVQWlB0czB3ZUZtSndYWWhaQlVuNnpLNHZINytPUm1jdGZ2VlFrTWpyWWw2?=
 =?utf-8?B?bWNkTWo4U1F5TXl1cFcyL0t6dWh5Wk5wZHQ0NDNJVVc0Y3VxbnMzbjhiK1Bo?=
 =?utf-8?B?Nmtrb0pOR2pKM2tDODYrYzh1eStSMXkxTytlVmEyV0hnSWEyNVlPajNCdVZ6?=
 =?utf-8?B?T3hVUmFRa2Rkd3BQcTlJOTlIV3JLTWxzL2VDd2FIMCthQ0ZiaHYxemxQU0k3?=
 =?utf-8?B?VlZZRnFBNXovVmRnRTdwSkxDWHBCOHZYZFVNMmtSUzA3V0VpUTg3MFcwRElD?=
 =?utf-8?B?VzdacWVXeHlOSzg2dkk0TEJVWHc0VWZ6TStadkdnL0RPdXYzbWVuekx4K3ZJ?=
 =?utf-8?B?V2VSdjlhVmJrWmtiZjlPZHdvYjl3cXVwUlU4U2MxZm9VMVFwaWxzUEp6c0h2?=
 =?utf-8?B?emhmbTNDY0dscmp6N3c5djhyR2E1akFVc2RJSjR2eXdscE5GODFmUU1FZk1a?=
 =?utf-8?B?WGo5RnlrdEFNYkNVbWhaY3d6bXVpNW5hc0NsMGlyYkFSeFhFMUxLZVlpaXB1?=
 =?utf-8?B?WWZDcThlTFJFQXB0NGlMN081NTVEeUs3bFZBd2JHWEZMNFIyakNTNnlHMTZQ?=
 =?utf-8?B?U2s2Zkg2SU5TditwT3pIZC9uQkVRNTZLdkg1dWlYbzBaeEY4VFArd0t5b3Z0?=
 =?utf-8?B?R1U2ajB3aUptN09TY1JKSS9aWXdtTG1OSk5rWEF5eHJ0Q3hRSzVHNU9lWW1W?=
 =?utf-8?B?VmZTNU5aWGQ2Y3I0ZUhKRGc5RTlHVytSM2tZMWtVY2h1VmhwME1LQ1VDWk9D?=
 =?utf-8?B?RDdrK1U1QU16U3dnSGYyazl3UUV0VlYzZnM4NjVNdWlUY0w3ak83UjV0bWUy?=
 =?utf-8?B?cE1EMkZtalV3blBubWhFdXg4M1BzZTErcjY5QmN5K1U1R2FBY09CQ25WZ3NQ?=
 =?utf-8?B?aXhhcTVTTXRUc0VKYUtOWW9USHpPUEpMMWUyQ00vVHZHQk94cE1WeXh3eGtp?=
 =?utf-8?B?RkY0M1VMNnp6YmhYRyszQjB0MnhVb21rK0htMGw5TVdlVzRZOVpqbzkvemNk?=
 =?utf-8?B?TTdnVUxiUzNIYUxJSXJDSHlnRkNIK2RkMjhORjI4bUtqN0hoYnlmc0hFT3Qy?=
 =?utf-8?B?QWdjRk5nTkZOSWNMMW9SL2VpZWZ0blZvd2dHQlN2UHRLUW1pNGY2OXlpZFVW?=
 =?utf-8?B?SUVnVTRWeXIzbms4SFVaRzE3b2dNR0ZlcCttODdHbk9oK2dUYW5NU1dYTHdn?=
 =?utf-8?B?QVNNb001allPVTFCSkR2cG84a2xnemhnakdEaWxKZlBMTGkxZ1pLOENWakVz?=
 =?utf-8?B?cXRYUVRrVEhsbElWTldDbXFIaDRTRkV2akNsa3BTRTRpaGJ2RzBPWWxpMHJU?=
 =?utf-8?B?TWRUdHFKa3R4aGhoWWpRN0hBMkRGMmlTN2YvZFdtYTBlWXVsS0gyQzQrNXpG?=
 =?utf-8?B?L1ZFUmxwVTNES3c2eXdEVFJaSEF6MW1FS0lJcGc0RkwyS2NheGpEYXJUSGI2?=
 =?utf-8?B?OURib3FlNm9iYXc3WHZ1KzZnK2FTMDhpeTF1MWFoZUZrOC8zY2pLT2RjbG5o?=
 =?utf-8?B?dVVUMy9ENUVZNzZiS2oxa1RhSHZQS2FlRTlwUnJ2ZVZTYXVZdFBSS0Zxd2E5?=
 =?utf-8?B?SGRCUEJuVDNZekRDa1lYMjJKUDhOSytsaWNtNU5ZcEthNWxWcllYaGJCbnZM?=
 =?utf-8?B?NVhPWUU0MVhqTmFaOUszWWlUdVJPcXk1cmhJQnd3bjUzbU95cUVuZlErQWVZ?=
 =?utf-8?B?V0hmZUNRZjVHaUNOOGhVeU9iRHhIMnBucDNseGdzcmR3QTdtcGI3WC85QSsy?=
 =?utf-8?B?RUowaTNsT1BYaGt2S250UC9CNHBFSHJ0NzBWVFBpS1hYQUhmT3pRZXJGVURT?=
 =?utf-8?B?VTlvekJJODVCVFRYWHlOUUw5NStpL3FhczFNY0s4YnFMemQrbE9NUVZOaUll?=
 =?utf-8?B?YnVKM2dWVTB1NERLNXZncGNNcTByQmVZbnlVY3RyclZ6SlE3YWR1b3pTMzdm?=
 =?utf-8?B?SVRTMGg4Z2dxS2pxTG1OdWVNdWF3RmYwT0JhZEVIcFlGWGNTMU1XUUdnUDBW?=
 =?utf-8?B?SUNteFRqdFc4OFZxRFpSdmhZVm42WGFJT3R0bUk5Q0NZK1doL0c5YmdPaWp3?=
 =?utf-8?B?MUQvRjZXTGh1R2g5Z2ozeGVkaU9JVVhoWENnbDFoa3E2OFdESW12UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BB9D5697059FD4A9578AF7BFCB12328@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JujczVPKQ95REvq1Akj92VTCeQnc+d8Vy/oFe+73kbHb1e4xQUt6zuVfPWslD8sEmm3GOmM8oACBKZoaawZdaGiLWtSeOTjzHkJrqGeLNvVudawGGUW31S+rnZ/sbWxfIFU1KKP1Q8PUgZuHMp1giQKk9UNG5MhqXyG8sGGFtvKEZq0F94Ka+oDvcfno0Zid9eIWybILTSoaDhRLv5J1ERULVdrAvwUUSRsZqxFv/rsM5yhqTFbD25oQrRwAS2Q4IGZlhEch4MbF88VundASXPCojrF++aAk3DqgWxu6LDqm4MPO7NxhWOYjMEQl1R4ll9h7H9hcxl9IMsik52j6Ww==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670934da-6220-475e-740b-08de78f584fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:21:42.6176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byI7UhAdAFiKMrkewsRr6GFC0SvYJpJmNpZERt5xmV0Z69Ay5gl5/cIT07H2DEz3oOFMflE4Dxj8VL1VDoNPsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8798
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_232154_350738_D96D1AB0 
X-CRM114-Status: GOOD (  19.20  )
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
aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYW4gYXRvbWljIGNoZWNrIGhvb2sgZm9yIHRoZSBD
UlRDIGFuZCB1c2UgaXQgdG8gdmVyaWZ5IHRoYXQgYW55IDN4Mw0KPiBNYXRyaXggY29sb3JvcCwg
d2hpY2ggcmVxdWlyZXMgdGhlIERBVEEgcHJvcGVydHkgdG8gYmUgc2V0LCBkb2VzIGluIGZhY3QN
Cj4gaGF2ZSBpdCBzZXQuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19jcnRjLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5j
DQo+IGluZGV4IGY3ZGIyMzVkOTg2Zi4uMWE1NWQ1ZGY2ZGJlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBAQCAtODk3LDYgKzg5NywzMSBAQCBzdGF0aWMgdm9pZCBt
dGtfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgICAgICAgIG10
a19jcnRjX3VwZGF0ZV9jb25maWcobXRrX2NydGMsICEhbXRrX2NydGMtPmV2ZW50KTsNCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgaW50IG10a19jcnRjX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgZHJtX2NvbG9yb3Bfc3Rh
dGUgKm5ld19jb2xvcm9wX3N0YXRlOw0KPiArICAgICAgIHN0cnVjdCBkcm1fY29sb3JvcCAqY29s
b3JvcDsNCj4gKyAgICAgICBpbnQgaTsNCj4gKw0KPiArICAgICAgIGZvcl9lYWNoX25ld19jb2xv
cm9wX2luX3N0YXRlKHN0YXRlLCBjb2xvcm9wLCBuZXdfY29sb3JvcF9zdGF0ZSwgaSkgew0KPiAr
ICAgICAgICAgICAgICAgc3dpdGNoIChjb2xvcm9wLT50eXBlKSB7DQo+ICsgICAgICAgICAgICAg
ICBjYXNlIERSTV9DT0xPUk9QX0NUTV8zWDM6DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
ICghbmV3X2NvbG9yb3Bfc3RhdGUtPmJ5cGFzcyAmJiAhbmV3X2NvbG9yb3Bfc3RhdGUtPmRhdGEp
IHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fZGJnX2F0b21pYyhjcnRj
LT5kZXYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ik1pc3NpbmcgcmVxdWlyZWQgREFUQSBwcm9wZXJ0eSBmb3IgQ09MT1JPUDolZFxuIiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb2xvcm9wLT5iYXNl
LmlkKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gKyAgICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0NCj4gKw0KPiArICAg
ICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRj
X2Z1bmNzIG10a19jcnRjX2Z1bmNzID0gew0KPiAgICAgICAgIC5zZXRfY29uZmlnICAgICAgICAg
ICAgID0gZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZywNCj4gICAgICAgICAucGFnZV9mbGlw
ICAgICAgICAgICAgICA9IGRybV9hdG9taWNfaGVscGVyX3BhZ2VfZmxpcCwNCj4gQEAgLTkxNCw2
ICs5MzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyBtdGtf
Y3J0Y19oZWxwZXJfZnVuY3MgPSB7DQo+ICAgICAgICAgLm1vZGVfdmFsaWQgICAgID0gbXRrX2Ny
dGNfbW9kZV92YWxpZCwNCj4gICAgICAgICAuYXRvbWljX2JlZ2luICAgPSBtdGtfY3J0Y19hdG9t
aWNfYmVnaW4sDQo+ICAgICAgICAgLmF0b21pY19mbHVzaCAgID0gbXRrX2NydGNfYXRvbWljX2Zs
dXNoLA0KPiArICAgICAgIC5hdG9taWNfY2hlY2sgICA9IG10a19jcnRjX2F0b21pY19jaGVjaywN
Cj4gICAgICAgICAuYXRvbWljX2VuYWJsZSAgPSBtdGtfY3J0Y19hdG9taWNfZW5hYmxlLA0KPiAg
ICAgICAgIC5hdG9taWNfZGlzYWJsZSA9IG10a19jcnRjX2F0b21pY19kaXNhYmxlLA0KPiAgfTsN
Cj4gDQo+IC0tDQo+IDIuNTEuMA0KPiANCg0K


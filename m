Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E625BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr3CMOy0K3TgqjZdHqYcIKaGrPEZQyOWZqDJW3bu3cs=; b=XkMS70zUidCQIRXi+1tZfNoa57
	dqdfviYm1FgaGkA8i82Qm7oAleWfYOsXu+/dvIZbIJr018Gq/xokh2uvDD5qRNFFp+CR2bpjpUToW
	HKRoMRxlcrVclqMJ/1zKlNnk2zSSG7vjINAjIIZxFJbxr2eH9kVhkzq+YMS/vkUz4agRVzJjwTt4e
	da5Fn6Lw0cmH8dNBXZZ8y0fIjDfPmZRJ1uLWRnJc68cJv9FAtqwsqoVrV7JG77U5fHUu4wAcSgv/P
	V5wlAnpnJd0SXpW/rptPSkY5lHLKZ12WHFiMIgCBejXdjwSrFCAlluITG2OuHoIMmMGqfAkra9MHK
	KX/RokEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRYu-0000000CVi5-1cNd;
	Tue, 17 Dec 2024 07:00:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRN6-0000000CSxv-2NB7;
	Tue, 17 Dec 2024 06:47:57 +0000
X-UUID: d7122916bc4211ef82ff63e91e7eb18c-20241216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cr3CMOy0K3TgqjZdHqYcIKaGrPEZQyOWZqDJW3bu3cs=;
	b=TzhhvMjUIsr2m3xtRyFwAU/UF4+iFbRuSW8cRVjtQ/GejHWYbkdYazgS2880sqRyqzHqS6r9xDFExwiipGsspdivWO2KGy61Br5DLgjcf/94B1cDTFkATKwNBtQuTIddNHCRAnWAOv9NiqE+rmqGrFlAAAfNt/Bzv01EmXGtLkQ=;
X-CID-CACHE: Type:Local,Time:202412162340-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:25e22b0c-d933-4f7d-8f58-71e0f03f7753,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bacf173c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7122916bc4211ef82ff63e91e7eb18c-20241216
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 846463222; Mon, 16 Dec 2024 23:47:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Dec 2024 14:47:50 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Dec 2024 14:47:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ao6loyHu/VPY8mRlQEY1bykDwGbRF9JFKqGl04Sdppae196Y8LCT97iN3FItrO/81Wc43W5G29xdplckOHTQIlbd+brYtL9B5NBnZXk6/dmL3spBCoDYDzV4Qcc9DHC+tAzEaSPS/SiEIy6RCwZf0eWTP+d40bacxjBkgL3qqutFKBYCBSI6VsZV/7f7inJ1Hcipyza+L7WnQHzQlcECUI7z0VtAyP2s0lbU2HFzJjawuCDJ3UkDM05O2G0d9Ff8oRJ51nc5bDub6DkqQ0XThgH7lMvdsO4hJ8GGOCOfbJbePpWk3NP2zgzyuBl+rjTPSIt7HKTgk9WcfVUGALZG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr3CMOy0K3TgqjZdHqYcIKaGrPEZQyOWZqDJW3bu3cs=;
 b=Kf5cg++rLIA/v0bEINZHLG7XjCn6xeJVSgGASYKW8eejPb9J22CYZsgy3auu5mgL+ZiUbLg8zRVy19D14WPsS1DA64xE/eTr3QVpLB7Hw/yVeQ9822FFx87jE1irpGni/80D0ZjvhaZUFljpjoE5D2jOalm0hMruqoh6XCARHwPK8s6AqRdqrvglJXlhn5/Aw/IPSSYdmCOZWmDpnpx4BYU5b6MmJEsLkwdsNpO04AN3CSi1h3GThezjZKjgRP54kQlAjZg+F18hMxyPFn+XkPV6/aL0oD9k2Yb+tUwQninf1WbKG0Lqf9xStuRXx+o9bVjau81DATTDDgIYBpAUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr3CMOy0K3TgqjZdHqYcIKaGrPEZQyOWZqDJW3bu3cs=;
 b=VUrTzCgRYaTC8CkPGPCR2wTRRXlq1QE7qKLEmYi2c5hqAXjF2TuEs7ClQd165WeWCDFwhCMBOXQOl3MIdnZE9wYez42WyELCjIqnJmBZfZWvRCdgqxMeLfkKv+GcL8Ya6aOxGupdlHQ0ndWFxTQNp1C/PFOcaFNK1rc5SfrNei8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7804.apcprd03.prod.outlook.com (2603:1096:400:475::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 06:47:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:47:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbRwuJJIpw1RNG4k2Br44bBPRYWbLqERKA
Date: Tue, 17 Dec 2024 06:47:47 +0000
Message-ID: <bb01b21cabffc53d603cd52f4542f181d736d4ae.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
	 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7804:EE_
x-ms-office365-filtering-correlation-id: df2ed738-fe9f-4489-f801-08dd1e66b7f4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VjhuZ213WFIxRVJYc2JxaTJDbWVCV2ZPSG9zbSsvQXB5VFM0dFAvdVZVNzhM?=
 =?utf-8?B?TllVUTFtNjZGTEhnejF4SWFQVUw1dlUwVzIyZ1owWlY5aytMaDFLa2JaNnUx?=
 =?utf-8?B?SUJCQjdjTlhGcUo1YjBROGRsWFJRL0pSak1BMnJ1TFBNR2lzM094ZW1ndHpB?=
 =?utf-8?B?Vm96dDNid1pWeWdvcUNRM0tBcWRxTy9PSjFGeTYvNnJIcDJtdlR2cTVrc0s1?=
 =?utf-8?B?RzZmL0lSaTRjMjNSa3E3cytneklQc1VwWTI3SkZFSnUyejNyejA4WjFoSGIv?=
 =?utf-8?B?ZGJNMWlVcFVaTEdUbUhvMDVqd0dnLzJGd0I2V3JVYmVQU3F1M2oyYlBpdlRX?=
 =?utf-8?B?WHRoMFNYZzZvbGxwdzFKSk9HQnJxSmo2NEl3M1puaE1WcmtJWHQrK0swQVZm?=
 =?utf-8?B?N2tYNGdVRy9GazdWbkphWXVIaDVKMytsUG1GNlZMRElNOGxLMC94VHNjM1l0?=
 =?utf-8?B?SkI3RENYT1dhRkNabU9qWmZwTmkyRUZXYkQrV3FjdVNxWmlJVHlWY0VacEVn?=
 =?utf-8?B?REQ2YXFQU1MzUSs3Z3ZGckNaYzg4YTdZclIzd0JZV0wzcElPK1NrNkJoeEh5?=
 =?utf-8?B?SHhtSXMzdGJPRFFnVDFINFMzRms5MHBaaTY2V1JMNW4wZi9JemZOb3JuSzBL?=
 =?utf-8?B?TmRXenk1Y3JNYktOVUtnVXlVMndocVZ1UXFqTkRXS0J2SFhaS1B3WGNScms0?=
 =?utf-8?B?ZjZIOTB3ZkJCdVZOOVdUZGJOSlJYVXdHS3IvVVhvdzhrSjc2dklHTW5YRis3?=
 =?utf-8?B?S1NKZ0FGdzc0WlZTa2FFNU9ZeWlyYUdLSmJSWTcvY0xDM2hQSmJ0aHNScWhj?=
 =?utf-8?B?aElUTnI4OXdja1liWGE2ZTNYc1l2NVZ4R2ZpRVlZVkx3bnlyb3A0bHdHdkVP?=
 =?utf-8?B?Q0ExT1pxQ1NON0EwN3VLbE1XL2pZTVVyTnNDS2VqcSt4VGxVRHZtaVZScFJh?=
 =?utf-8?B?alNvUXJPKzc4WjFXZWk2RXpXQUJOTXdtcUI3TVp6c0huR1RBMHVaQnNiSEpx?=
 =?utf-8?B?bGpIL0pGSlcwdHoycmNDYjA3QVVmekc4Y2xzand2MGVja0JMZ2s0dncwQlZW?=
 =?utf-8?B?STY2djA2cDRsajZlS2RJNVlGQ1FqVmdJZUJ6QjV2RFdKWFQxMnc2cnAzT1ZB?=
 =?utf-8?B?b3RRb3hPSFZRRUtoV0FsWFQrUytzSWlXZzU2MUxDVHBjcnAyR2FmelRiS1Mv?=
 =?utf-8?B?aDFTaGJZOUJNdFM2UE5UWDBwSm04Z21veElPQlNFMVA1THZtNitKNHVNVUNP?=
 =?utf-8?B?Zkg2QzVTNUJENFBGL1BmSHIvNFJQR1ZBNDJiK1VjQ1pMUytkRnExUWIwUTdQ?=
 =?utf-8?B?M1NZZEN5eVNOa3RHOEhwZGZabC9zQVpXZXhLY0ZDWE5oY3VFTXJNV0FkZERm?=
 =?utf-8?B?Y0J6T25TWFpyNXo2ZVczNWQxZVEzOHF4YXVRTTQ2aUIveEFaWG5XQWVsSU9r?=
 =?utf-8?B?WFAvNytKMWgraEVpRGxVU2lpZmtWOGhnNGhsdTJzSnNIVHRXdWpqY2pCdWdD?=
 =?utf-8?B?YkplWHA2QmsyMHRFL01kMVBNWkpjTHdPT3hTTVoxc0ZBRGZQMnBiR0YySHJD?=
 =?utf-8?B?cXR3RlJleXZWUTRTd2dYTHM3VmFMQjVJVGJuTGh4RGJJRmEyZkQ2d2JBYUhi?=
 =?utf-8?B?L3JWQ0dIbis1djNjREdiRU05V0N4Nm1TMEc5djA2ako4YS8wbmJlQTZyekI4?=
 =?utf-8?B?NFZESzVZMGczc2hBcXBNQ3BvcFltU3JER3ZSTEdBb0NWSXc5a3NWbmkyejJM?=
 =?utf-8?B?L0hoLytqdzNJR2RjdndER21UZklISERqUlhFVFVXOW5HWC9mMkJ3dEM2Szg5?=
 =?utf-8?B?UnRkTGtrQm9md25USFhkTnljQ0c4eUdULzFlR0hzeTFNd0ZDdElTZ2FTNS9I?=
 =?utf-8?B?eHp5d3VveVVqVXF3SGdwQ3B6K29iQ3Nyb1dzOXhxOGJlOFltN0VTanpsRXFB?=
 =?utf-8?Q?toygIOec1JngfdbCLraMgjei3hE8iVab?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bC81ZzVZU2xBV2YvY05CQ0c5b2xVSzNiVEJVQzB6WGIxNmZpTlAwUjN2SEps?=
 =?utf-8?B?UjhzYTFkS3lQK3F3VjdBbTRaSmRpR0FKZ1RLT2FnMzNkWTdsb1BQNHVNdnZ6?=
 =?utf-8?B?K25OTVl1N1FDZ09DV25OVEh2WWdSVTVwdVRYaGtLM0lPbDllUU52T3JiVTVm?=
 =?utf-8?B?RW1uYWpsNWg1OUJ4dTBwcmJ3cTAyT1hPSlVRVWFwNFBGVWRYdGJrNkxKS1lx?=
 =?utf-8?B?dm5ReHVQOFBLOUZIVWpWa0lZd3c0SSswTDcrSWpjaklCeTFNTkJNd1hYVlZQ?=
 =?utf-8?B?THltZnpmN2xYRzdvTlVVZWY1MFJucDdhbW81TFdPWHhkbnkyME00WWltRGpK?=
 =?utf-8?B?ZkcvTk1BSkR4bCtwa2ZPUmRmZWpmSjE3b0RsR1BGLzhXWGUvYjFIaVJzUXpO?=
 =?utf-8?B?UmROQjlxeUIzSUd6R3JXTGFvZXJ2YlZDNFM1NGZpWHpMbEF6VlcybE9JRlRl?=
 =?utf-8?B?ZXd5MDBIWWhKYjd4L0hpL1BkK3N3ZTdKLzlnY09ZOTdQRVdzc1JpelFUL0Nh?=
 =?utf-8?B?L3FPK2plM3djWGVla0lrNmR1ajRnZWNvMmN6OFNxQ0Y2bkFNdndJVDkvcVl5?=
 =?utf-8?B?Nmd5TktTRlA0RXZLWHJkMlVlY3YwTlBxVDlsbUxpdGpGZ2FuZk5qVVgwZ2x3?=
 =?utf-8?B?cnFuVCtPNDNDUVZqeml2d3dPQ0t3RXNvKzdrVnFzM091WDN6ckdhZHJDTm1z?=
 =?utf-8?B?MDdhdTZkZSsrbER3bE96MU9UYUVkYURNMFR3M3plT0xlWDhYb3p6ZWNQM0Rk?=
 =?utf-8?B?Szl0NW9kRGNvbk04bDdEZjhGczlDSlQ0VStGQUcrL3BrKzJUTXB1RnROS1Rx?=
 =?utf-8?B?ZnVHYkJpcGIwUXlPckYydGpBc2JGOEVnSVVyc243MGQ1TGd3c1dUUzRid0sy?=
 =?utf-8?B?NHZaNW4ybUovUXlXaTNJUVFzZkJXMGIvazdsWE8xUVhuY1FaL0dsWkdrY3Vk?=
 =?utf-8?B?VHl0eVJSYUhuY1p5ZmVhR0MvNmFFNDRkb3p0OUZDMXdnNFNJU2doV0Zxa2xS?=
 =?utf-8?B?Q3V6UHdDMVhOclNQTlhCak5PbXdhakFKZnRjLy9SUDdjU0ErRFJiMzMrN0xq?=
 =?utf-8?B?eWI4bHFyRzFQWGhGNy9LSWVUVTdHeVp4M0xkVVFOMHJaT3B5SWVuelRpR0hT?=
 =?utf-8?B?UjJEaERyajN5OVJ6ejlhbko1YUpBSG1lYmNCZ0VCdkhEcEhyZ0xWbFNWNVI0?=
 =?utf-8?B?TVR5ZWY5VVV3anZIMU5GZlJSV3BxWmtkdmoyNWxXeUx5MFFrOXFtbnFnejZm?=
 =?utf-8?B?NTRjVnN1bnpFQWlsbGkvNzhpMHpPVXpmMWpQVlI5eTF6ME0zSXJDUFhMUGNQ?=
 =?utf-8?B?cXBLaDl6blJsdE90dCtuM3JVcStwVU1hQXFHcDVUemMzNVh4ZW4zbkFBOGY0?=
 =?utf-8?B?c2Vxa2xCWTYwVmRlMzZMa3ZaNnV0WXlhQnowQlIrV3djOE1VNzZuN0pRNm9r?=
 =?utf-8?B?U3BGb00yL01QZGpRNndkQ3hmVFdHbXM1ZFRWUEdOYzhzd2NPdld1V2JmcVJq?=
 =?utf-8?B?dGpIQmU2UGxYSE4zSklyWG5Vd0xoY3BOWlJPc1NxczdKQlIxL1VOcEtnZFlZ?=
 =?utf-8?B?RmZaZmtiL21wVjN3M2N3Z2JJSUs1UVg4a2lxVTdUZkJRbUhrcnpmTmR4MDdX?=
 =?utf-8?B?Q3c4Q1htTGEyV0ZrdFBXanZVR0lyeHRQakhJdWxSODJ5d3VEYzdFOWdzQ2hk?=
 =?utf-8?B?bVVKVzF4WU8zd0VKKzFpdXBMalFRbTBkM1dteWxjKzRmV3FYOFVrcE5XdjVu?=
 =?utf-8?B?cVhIcDQyc0k3M1J6TkoyakxrTksvRnJtclpvdW5JOWhOU0MzNU9CSmZJUkhi?=
 =?utf-8?B?eWR5R3dpQ3dEQ2RCd2NDdW15OUJyeXkxR0NKZ096SVdUZ2ZWWDZGUEZZSDI4?=
 =?utf-8?B?ZFR1eHMwaVMxdGUvZzNDelI0eHdXc2JmUmpEU3krNUNSSjZuN3JEa3Y2bGMw?=
 =?utf-8?B?SStpdUcvbEduemMxSG5UdmRCZkZiNmFIQTkzOTRaNmdsUEM0Uk5YcGxrajhl?=
 =?utf-8?B?dnNpbTA1L29oOEFpcmtWMjgrWnY3d2l4bjNGRWNLNGJsT25jNElFZzF1ZlMw?=
 =?utf-8?B?RmxpZHYyc2g1Umo5eVZ2UlozZVhKcUJyOVRHR3g5czhiOHhBbExyLzlTa3ly?=
 =?utf-8?B?QTlveFpDT1pFMTZFbXlwZGppK01iMkt6TGVpeVdzNXdzeXN4N2Z6VE9ERzFC?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <937E3967CB4A3B43A5C2274BED152562@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2ed738-fe9f-4489-f801-08dd1e66b7f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 06:47:47.7707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLve6Rt42somK9Q2WcnO4ceg3+F6UE1ZPx/qTo+qgYPkJqnp5K8CFoeizL+97n1WP10YPBj7KyGHqnCLYAAb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_224756_611508_C2ABF604 
X-CRM114-Status: GOOD (  17.24  )
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

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3Ig
dGhlIG5ld2VyIEhETUktVFggKEVuY29kZXIpIHYyIGFuZCBEREMgdjIgSVBzDQo+IGZvdW5kIGlu
IE1lZGlhVGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+
IGluY2x1ZGluZyBzdXBwb3J0IGZvciBkaXNwbGF5IG1vZGVzIHVwIHRvIDRrNjAgYW5kIGZvciBI
RE1JDQo+IEF1ZGlvLCBhcyBwZXIgdGhlIEhETUkgMi4wIHNwZWMuDQo+IA0KPiBIRENQIGFuZCBD
RUMgZnVuY3Rpb25hbGl0aWVzIGFyZSBhbHNvIHN1cHBvcnRlZCBieSB0aGlzIGhhcmR3YXJlLA0K
PiBidXQgYXJlIG5vdCBpbmNsdWRlZCBpbiB0aGlzIGNvbW1pdCBhbmQgdGhhdCBhbHNvIHBvc2Vz
IGEgc2xpZ2h0DQo+IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgVjIgYW5kIFYxIGNvbnRyb2xsZXJz
IGluIGhvdyB0aGV5IGhhbmRsZQ0KPiBIb3RwbHVnIERldGVjdGlvbiAoSFBEKS4NCj4gDQo+IFdo
aWxlIHRoZSB2MSBjb250cm9sbGVyIHdhcyB1c2luZyB0aGUgQ0VDIGNvbnRyb2xsZXIgdG8gY2hl
Y2sNCj4gSERNSSBjYWJsZSBjb25uZWN0aW9uIGFuZCBkaXNjb25uZWN0aW9uLCBpbiB0aGlzIGRy
aXZlciB0aGUgdjINCj4gb25lIGRvZXMgbm90Lg0KPiANCj4gVGhpcyBpcyBkdWUgdG8gdGhlIGZh
Y3QgdGhhdCBvbiBwYXJ0cyB3aXRoIHYyIGRlc2lnbnMsIGxpa2UgdGhlDQo+IE1UODE5NSBTb0Ms
IHRoZXJlIGlzIG9uZSBDRUMgY29udHJvbGxlciBzaGFyZWQgYmV0d2VlbiB0aGUgSERNSQ0KPiBU
cmFuc21pdHRlciAoSERNSS1UWCkgYW5kIFJlY2VpdmVyIChIRE1JLVJYKTogYmVmb3JlIGV2ZW50
dWFsbHkNCj4gYWRkaW5nIHN1cHBvcnQgdG8gdXNlIHRoZSBDRUMgSFcgdG8gd2FrZSB1cCB0aGUg
SERNSSBjb250cm9sbGVycw0KPiBpdCBpcyBuZWNlc3NhcnkgdG8gaGF2ZSBzdXBwb3J0IGZvciBv
bmUgVFgsIG9uZSBSWCAqYW5kKiBmb3IgYm90aA0KPiBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgbXRrX3YyX2hkbWlfYnJpZGdlX2Z1bmNzID0g
ew0KPiArICAgICAgIC5hdHRhY2ggPSBtdGtfaGRtaV92Ml9icmlkZ2VfYXR0YWNoLA0KPiArICAg
ICAgIC5kZXRhY2ggPSBtdGtfaGRtaV92Ml9icmlkZ2VfZGV0YWNoLA0KPiArICAgICAgIC5tb2Rl
X2ZpeHVwID0gbXRrX2hkbWlfYnJpZGdlX21vZGVfZml4dXAsDQo+ICsgICAgICAgLm1vZGVfc2V0
ID0gbXRrX2hkbWlfYnJpZGdlX21vZGVfc2V0LA0KPiArICAgICAgIC5tb2RlX3ZhbGlkID0gbXRr
X2hkbWlfdjJfYnJpZGdlX21vZGVfdmFsaWQsDQo+ICsgICAgICAgLmF0b21pY19wcmVfZW5hYmxl
ID0gbXRrX2hkbWlfdjJfYnJpZGdlX3ByZV9lbmFibGUsDQo+ICsgICAgICAgLmF0b21pY19lbmFi
bGUgPSBtdGtfaGRtaV92Ml9icmlkZ2VfZW5hYmxlLA0KPiArICAgICAgIC5hdG9taWNfZGlzYWJs
ZSA9IG10a19oZG1pX3YyX2JyaWRnZV9kaXNhYmxlLA0KPiArICAgICAgIC5hdG9taWNfcG9zdF9k
aXNhYmxlID0gbXRrX2hkbWlfdjJfYnJpZGdlX3Bvc3RfZGlzYWJsZSwNCj4gKyAgICAgICAuYXRv
bWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9kdXBsaWNhdGVf
c3RhdGUsDQo+ICsgICAgICAgLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxw
ZXJfYnJpZGdlX2Rlc3Ryb3lfc3RhdGUsDQo+ICsgICAgICAgLmF0b21pY19jaGVjayA9IG10a19o
ZG1pX3YyX2JyaWRnZV9hdG9taWNfY2hlY2ssDQo+ICsgICAgICAgLmF0b21pY19yZXNldCA9IGRy
bV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCwNCj4gKyAgICAgICAuZGV0ZWN0ID0gbXRrX2hk
bWlfdjJfYnJpZGdlX2RldGVjdCwNCj4gKyAgICAgICAuZWRpZF9yZWFkID0gbXRrX2hkbWlfdjJf
YnJpZGdlX2VkaWRfcmVhZCwNCj4gKyAgICAgICAuaGRtaV90bWRzX2NoYXJfcmF0ZV92YWxpZCA9
IG10a19oZG1pX3YyX2hkbWlfdG1kc19jaGFyX3JhdGVfdmFsaWQsDQo+ICsgICAgICAgLmhkbWlf
Y2xlYXJfaW5mb2ZyYW1lID0gbXRrX2hkbWlfdjJfaGRtaV9jbGVhcl9pbmZvZnJhbWUsDQo+ICsg
ICAgICAgLmhkbWlfd3JpdGVfaW5mb2ZyYW1lID0gbXRrX2hkbWlfdjJfaGRtaV93cml0ZV9pbmZv
ZnJhbWUsDQo+ICsgICAgICAgLmRlYnVnZnNfaW5pdCA9IG10a19oZG1pX3YyX2RlYnVnZnNfaW5p
dCwNCg0KSSB3b3VsZCBsaWtlIHRoaXMgcGF0Y2ggdG8gYmUgc21hbGxlciwgc28gc2VwYXJhdGUg
ZGVidWdmcyB0byBhbiBpbmRlcGVuZGVudCBwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK307
DQo+ICsNCg0KDQo=


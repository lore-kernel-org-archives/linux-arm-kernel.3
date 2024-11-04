Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD31ED11185
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qk+nnbygzETBH7gQ9zchWyI3Cd6cz+tDHl+F77MWi0o=; b=LbDFPmr5M+MxbRiQA3Ri5onePF
	nctYMSQ5aufI5I/3UWpzI25AdJIWrA+wj7n6LaFXpX8thCmYfpwD88KHzwB/n5WevmlwL8TIjoKAk
	CqZn5zSOdT1Q92TJMtXFcch99zbNn0Qj9TRWRZzCw8SUQrVxuYuw+cP0OsrzE3fRX7zSrdbV6pOFe
	RsZUsOgqZ/gAtEi71aT+VlVEQP0i72vjQ+CviguWEdC8U+hL1ea01FIZPR4OnZDGT9AWs5AGxmYC9
	NJNemSh53oHa0GbrodTJcGsAVPMH/TtYQg6uZajJpgSxaHnK8/o7nr0CIyPZWlNoS4omsTHhPXhyU
	PB6tbXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7qIH-0000000Cji9-0lIb;
	Mon, 04 Nov 2024 06:10:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7qGX-0000000CjUF-3fkO;
	Mon, 04 Nov 2024 06:08:43 +0000
X-UUID: 3bb68a2a9a7311ef82ff63e91e7eb18c-20241103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Qk+nnbygzETBH7gQ9zchWyI3Cd6cz+tDHl+F77MWi0o=;
	b=lRB9PTS7YTUVKC5GuwFb6O1mxvJcF8KPZ4L9DsYHEUZxNA8Beut6sumpAiOlE4sgIc5A/EmkSQB2GenyopB1CP2CgWad2/w6+rGkPBESgId/mNH0wDvXja6lQ0xNfsXPPnYcG3xyWmNe5mhp/oar/S5W0y1YBbUBI+dadfSM6hA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:9ab19f13-aef0-46c7-9266-fc0131296511,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:7ae8a348-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3bb68a2a9a7311ef82ff63e91e7eb18c-20241103
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1128372083; Sun, 03 Nov 2024 23:08:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 14:08:35 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 14:08:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZIwwxywegf7PeHXExSPMjS5+c0kuUs6nNg5B+3b0k543ln2B49ulBzWeX15WBkjL+4KknK1HXyosvxxkEdmTKiBmPe/yb79OXBOC3lXsYczT/VJ181srEp+u5kprQTTV921fGndWZ6mOsxtUo2OBu1PnxApeRnWd1W0JUCroJr8SFjxWEmLwIsNogJMwxtsiWK2+a+4Ng9fkW/ZRug28cmYYmn4+N3OxvC6vrqEiZQuXA7+7I7kjzsE65tMPJGA/6Nw94NYZcMCnqg0sUF9S8DknMRR+6OvZsOvvZ+m2GaTHqpUxh4D/W5G58PHdmKeZFJfx9g27epsoNRrS/BcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk+nnbygzETBH7gQ9zchWyI3Cd6cz+tDHl+F77MWi0o=;
 b=V/HWh+mDmRlUXvfCHGN5CizPiuQyPzYzae86J4AoK7IYpKAgNJOAI/fz2DFdKIU54cFRVv+CSC98d0QlZ9CV1eA5yE9J+bsh4sufnukUPZJ7R0Mq11KVxH3AhSabgzsumwbiuhqV+7OZ9JT7F/uQYQcf8Y/h8CWq1wYczMd2+MzbpXT6Moo5Nu2U1R8DlaEs07/ZpdB9kEvHcw5Eu9tpIq+a53OKR55/shiQMY6qzjBiaQjn7C4HuZq1folPnwK1cIrxco8Izr7lSt6O1vLPXZYB1ev7WrrQxfoUPiA/5VNS/+n5hvm8XJs0HudbCWtqSIJV2AuqLfXCmCzVE7DhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk+nnbygzETBH7gQ9zchWyI3Cd6cz+tDHl+F77MWi0o=;
 b=G8ocfyP6cDHruwa9txPUdr+Qr22wItPea+rP1s/MQSxGLEb93PvO6n1l5NbZa8iGzNhRpEvU3tDb5IEVfDw/Hi7VpRiyOuoAmsAVXAMDKng5iS8ij5IQcqpRh8qjeF1Qz6DPzgGbXFM6FRAbJwUeI04K0UL+icyvpJZ2uztDu80=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7672.apcprd03.prod.outlook.com (2603:1096:820:ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 06:08:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 06:08:32 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKmy3aA
Date: Mon, 4 Nov 2024 06:08:32 +0000
Message-ID: <e436eb46b1b49df4b5636642fb53fda2b1072b8c.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7672:EE_
x-ms-office365-filtering-correlation-id: 4ad71850-bb37-4367-c02d-08dcfc971c79
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c29ueGtkT3VYdWJVZ2xVRnU3aWxKdEkrV1RjN0Z1RHlOL09JVzRaS0dwYWpx?=
 =?utf-8?B?V0NHWWI2a2dSSFBxb283MW81UU9BSU9ra2M4YnlEMGpGWExML29ZRFlHMWNL?=
 =?utf-8?B?eFdIWUxiMC9ZMS91OWphOVZkTzd6YzZUWThSWElmOVVQeVZuY09jdjhaSmJ6?=
 =?utf-8?B?Z1NsaUMxc2RVMEMrUUpMaTR2bVBNYzJ3RXpacmhremFZREg3NzdsWUJIY1dJ?=
 =?utf-8?B?dFZTbklZTURVbGtnb3lMeHlrcmpUcWFqeDdUaTRXL0ZjS1VPL2s4ZzZnR0p3?=
 =?utf-8?B?RzZ0Y053N1ZndWFxb3ExYkVERy9VV3RoZVozYjdtMk9DV2hNa2l0c1FYWGJH?=
 =?utf-8?B?aXU1SmwrOVNxQ1ovTnJEcW1YUU1hV1QwSUl2bnFmRWgwVUViUk43U2RjWjBj?=
 =?utf-8?B?blBDVXc3bFRtRWpEQytlR2RMRVVZTWV4bWNOTk50YW9kN1NHcmNtbEMvZnZV?=
 =?utf-8?B?SDJuOXpTZDhGc3NENXZub1lBTCtTQzNGZVNaRC93ZXczNEtQSEhMTnJ5VnRZ?=
 =?utf-8?B?TkFRM0dPczRXVWdKMkdFb2dBbktmaE5QMjhESHNWZXB3M2xOeTNCbzJaeXZv?=
 =?utf-8?B?TXRlRThWMFpDTVZtMUNRZUFtdVBsNVl1YmNIcWVicUNwY3YrSURQdjFyWGV5?=
 =?utf-8?B?OFR3U2xxaVM2dFhQNmZPWmtBaTcwN2N2UlNRaCtQTSszd01SdjNleWptVDhQ?=
 =?utf-8?B?bW1McEVLYzMwNEJWNGtQRFJOZzZKSFdqRUExeXRkTlBGVi9rNDBlWEMycFZk?=
 =?utf-8?B?c1BBb0tqeDlxVU10bW9pRCtndHZDcDlzM0ZxcmttTjc4Tlp2YnJ0WXBWb2NI?=
 =?utf-8?B?bmtCWHl2WHpzUGNkeWFPU2RicS9aNmlHTVlVVDI3eGdEUi9zSGJackdKcVBk?=
 =?utf-8?B?dEpEZDZZNFlLNVRQbHdLcGl2N0k2SnlRSWNzdEoxTndpdi9Ld0tlUDNGeklK?=
 =?utf-8?B?VGpBOGV6bEFhR01GemlucTJXV2svWmUwRnA4QXE2SVJYV0JiaFFhbXd1cjFV?=
 =?utf-8?B?Y1plcXFobHpJM1lzTTVienR0NmtaT1NNNUs2YmliR25OMHU2SG9LNUNXSEJU?=
 =?utf-8?B?My9wZzAwenlZVVBhL0J3cFgxajJkWXU2VDl4TmcxVEppUTBnenNGdmtEV2p6?=
 =?utf-8?B?Y25sY0lZRERFRE1YY0RyR0thcklIaXFyQkt6NG8wdzRGZzZXQUcwcjlJc0FI?=
 =?utf-8?B?N0NENGxRK3gvcFJBeVZoa0tla09VV3NKekFKOTA4ODhleExrRThoTFY5bWlQ?=
 =?utf-8?B?RUxmWC9qWGhTc3p4eEJIazN4Wm1saWxUYnF2MzRSTTZFTHFYY1VyUlI4cFFY?=
 =?utf-8?B?SHI2T0xrYXhwSm9NYWt4Q25FVFo2NENOdXByblhFcVVkMnhRT2x2a29SZThJ?=
 =?utf-8?B?WTlKclBjRWsvRTBMQkhNakpPS2QwVjMrWG8zaHFDM0VjK1lOK01pWm1YdDhZ?=
 =?utf-8?B?dHJUY0tkcHIzVlhXUXo4NnRvZ2dPUDZuNUFaNTdSdURHR21NTEV0ZjBibUdV?=
 =?utf-8?B?WFcrNkZRQ2U1RkZyU0hhU3JMMlZGakxMd0ZwQXZEa3BhVWZLU2djN1BKbWh1?=
 =?utf-8?B?U0h5ck1YVXRTL0NTUStERUhJUzJMZ0JnaHBLZ2NhSDg4bXp4cTkwVmVMMW4w?=
 =?utf-8?B?RS91UjdoVjJ0eEtuZUlhSnlYdlE4dzA2U3NkODZvRnVJZSt3RElPak80Q2hj?=
 =?utf-8?B?bTVXK2ROOVNBQkRYbW5YZWlEdlVqTzRobTU1T2k5bU5kSUFpVnRUSUxIMHZx?=
 =?utf-8?B?bFRoWld5MWlCdk80dDE1UG93VmlLOUZXdFRhZXJtUjBoV0tBSEdGbXlaZlhj?=
 =?utf-8?Q?yNf7JfJah9C1j7Qsv5G/8470K3XZe3HAY+ktw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2xWK0NmNWMrRldjc0Z3N2czTTA1TXVCZjgvRU9URlhsVm5NcWVWWUpnTUN5?=
 =?utf-8?B?ZTdzUW5WaVpQTWpJejFtdUxkN0dEbUppdGZlY2poc211V1BWc2lOcm1ZazZo?=
 =?utf-8?B?UVl0STdVSEh2b1RaYkhpK0VzV0ZCOXlMbkY4K003SWw5RmVlZEdIdll0allC?=
 =?utf-8?B?aWgrc2VPeXFGSldHcTROV005UXNFMTZOMWx1bU1Dd09mVXlCdDFIQitldXFn?=
 =?utf-8?B?TGZoM0JkNk0valFCZkFPZ0RCRkhseG5UNWRhMFFRcFRPa002cExVdDdyQTJm?=
 =?utf-8?B?NVhZbHJ2ZjFjQ2pndEJnOUZxdjhLeEZRNjdNTUR0eFVjNnc5VEx3MUZaakor?=
 =?utf-8?B?S1Zua0VsWTJ0SVpHdHF3TW42NlRQRkFWR0N1SHNQRUtneHI0K0dBc1lHM1ZL?=
 =?utf-8?B?Vm82VmoxeXltTEdLTUNyelF3SWRYZXpBazFTczIwcDAyaGpGNVE3dTZ1clBQ?=
 =?utf-8?B?K1RhODgxaFlCM09MYVVRSVNZaG9MS3B3UkFxbmkvRDN1TEp4aXAzdlpxZHli?=
 =?utf-8?B?V3JZMXluYXBpMEl4Qk12WkJCbE01Q0hRNy9iMDJDN3QwV2lzcWdQdFF6VWhN?=
 =?utf-8?B?Wlg0TGRxQ0I5OUtUYnprRWhOSHpFcHVBYjZFT3FnRWo5TjNZdjVsZ1VlSnc1?=
 =?utf-8?B?THEwM29CL1dGam9RVjNDZzZCVEtPRVRVZWdNcnFwUjZoN0UxNVlPYlJHWjFj?=
 =?utf-8?B?Mm0xWUtyTE8xR2FRNHg5all1Ty9HT2phSm1qVEdGTDJFU2RVUUphYVkxSnJx?=
 =?utf-8?B?MW02ajl0VXlQYWtCQk51UHpSb05xcFZlM01mSmNHQWMyd1FlcmRaQ2dRQXZv?=
 =?utf-8?B?TlluSjA2TG9HK3FoM1lOWVk2Ry9JbFA5amFnaFNBNTJCdk4vMnc1RHVCRm5P?=
 =?utf-8?B?RGIrbk5pQndzUVpwMkNrMTNxeFVQUmtaY252a1YwNlgzVnRuSzFRdU11Zmx3?=
 =?utf-8?B?K2xRbmpLeVYvcEd6eFJxR2hsV0JWL3p3VUZab1hITGFEMS9ESUwzd3AreThH?=
 =?utf-8?B?YVg2a2w5dk8rMG12T3krRFZkZjhKc2Vwd1Fta01HQmlwOTNzYXJQU2hwcE1w?=
 =?utf-8?B?UDZPVTZva0NzTnZCV2lKRUZiZ1RlRDRLRDZaS0E4VkNXd0lEUlZXa0pWSHdY?=
 =?utf-8?B?QlpBL0hLM1IwMGtxSzZjRkM0bUNxVW9XdFAzbGJsYW03NlMza2FWL2JvWEtt?=
 =?utf-8?B?YlFQU2MrT0UvUmFvbGppTGFKa3podmNYWm1hWnpFcitySTRGSzlQRkF2dzdF?=
 =?utf-8?B?cVdudkRhQ1RQa2xQampnRWhIUlRHa3dVamVHSnZzWVJ1UVdyNlBkSGZWdE9r?=
 =?utf-8?B?NExtcGVCdDlBdEdsQUJ6VVY4VTQyY3dnbGtBRVMyc3VsRC9CdU0xRmNuak9h?=
 =?utf-8?B?eCtQTzNsN01oZm5aemkwRFJZTlVKQjFYQUU1VkVMQUIyNWFQSWRBQTJnejJ3?=
 =?utf-8?B?eVBMaHhUUGV2eEJSYTJDTVgxYW5DSTRBMEwxSlF1R3d5dFJpQkFMNmRLM2wv?=
 =?utf-8?B?b2ExV2I1Q095QmR6U3RvQTlNK0FvcE5ldzcyTXVFQ1FmN1RncXExUHVINTIr?=
 =?utf-8?B?V0llSGdxVjY3ZzlPcU5YZVBlZjE0Y1ZoYTNPdDJLdDdhU3ZjSnlzcTlFVkpX?=
 =?utf-8?B?eCtHUTRrUXBHOFozckRtN1FNQnpNZVdzSTFNMjQzTW93NGxLQSt3ZitNQmpJ?=
 =?utf-8?B?SFkyK2Myak9UeDR5a05vVWZmS2lqOENNZUZlRUpsVDRIN3dUWEtCTndWdjNY?=
 =?utf-8?B?WGZKdVVlTHd3eHROaGtkUEYweDE1eG16L2FsaWc2MTNEcFhNZXF6alBpUzlY?=
 =?utf-8?B?dm16YTNEUVJyeVEyZG9sS0JLY0lQY0RBREJpcG9iaGowVGFuT3pEN0k1dDhu?=
 =?utf-8?B?TmNOdHJWQi9WQWhpSHpZc0NsbnVUZGp1c2dNMmxJdXlzY1d1Ti9IMGJORmlP?=
 =?utf-8?B?Nmh6d0pSSmVmZTl5Wm8wSVRRNWZxV0FPVEdyMVl4Q1RRNnpFdVplMU9udkZy?=
 =?utf-8?B?RDhabkFtK1FRVXlJTExrY0NJTXcwUWV5YVRtbWdhMlhwSUg5VFI5MGR2L0N0?=
 =?utf-8?B?WWJ0OHppc0kwTHlDdDBRVjlnR1VIME1NMG1sZVhYZnNHQ085N1VhaFdxck5w?=
 =?utf-8?Q?V+PPJFMjCAsfDnyP8clQe5BRz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD3C3DBC1794CB499076A2FF770C8FB1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad71850-bb37-4367-c02d-08dcfc971c79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 06:08:32.7478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMMDjYXwEmsXumL1xF/rJfKEetsmug1QTp/y50Ct0hqJFrFHrhBFf4dmUtTATW1rL7fTyYnT5TnSLGNpDYnP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_220841_960370_789D3CBB 
X-CRM114-Status: GOOD (  14.98  )
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
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdHJ1Y3QgbXRrX2NhbV9yZXF1ZXN0X3N0cmVhbV9kYXRhICoNCj4gK210a19jYW1fZ2V0
X3JlcV9zX2RhdGEoc3RydWN0IG10a19jYW1fY3R4ICpjdHgsIHVuc2lnbmVkIGludCBwaXBlX2lk
LA0KPiArCQkgICAgICAgdW5zaWduZWQgaW50IGZyYW1lX3NlcV9ubykNCj4gKw0KPiArew0KPiAr
CXN0cnVjdCBtdGtfY2FtX2RldmljZSAqY2FtID0gY3R4LT5jYW07DQo+ICsJc3RydWN0IG10a19j
YW1fcmVxdWVzdCAqcmVxLCAqcmVxX3ByZXY7DQo+ICsJc3RydWN0IG10a19jYW1fcmVxdWVzdF9z
dHJlYW1fZGF0YSAqcmVxX3N0cmVhbV9kYXRhOw0KPiArCWludCBpOw0KPiArDQo+ICsJc3Bpbl9s
b2NrKCZjYW0tPnJ1bm5pbmdfam9iX2xvY2spOw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShyZXEsIHJlcV9wcmV2LCAmY2FtLT5ydW5uaW5nX2pvYl9saXN0LCBsaXN0KSB7DQo+ICsJCWlm
IChyZXEtPnBpcGVfdXNlZCAmICgxIDw8IHBpcGVfaWQpKSB7DQo+ICsJCQlmb3IgKGkgPSAwOyBp
IDwgcmVxLT5wX2RhdGFbcGlwZV9pZF0uc19kYXRhX251bTsgaSsrKSB7DQo+ICsJCQkJcmVxX3N0
cmVhbV9kYXRhID0gJnJlcS0+cF9kYXRhW3BpcGVfaWRdLnNfZGF0YVtpXTsNCj4gKwkJCQlpZiAo
cmVxX3N0cmVhbV9kYXRhLT5mcmFtZV9zZXFfbm8gPT0gZnJhbWVfc2VxX25vKSB7DQo+ICsJCQkJ
CXNwaW5fdW5sb2NrKCZjYW0tPnJ1bm5pbmdfam9iX2xvY2spOw0KPiArCQkJCQlyZXR1cm4gcmVx
X3N0cmVhbV9kYXRhOw0KPiArCQkJCX0NCj4gKwkJCX0NCj4gKwkJfQ0KPiArCX0NCj4gKwlzcGlu
X3VubG9jaygmY2FtLT5ydW5uaW5nX2pvYl9sb2NrKTsNCj4gKw0KPiArCXJldHVybiBOVUxMOw0K
PiArfQ0KPiArDQo+ICtzdHJ1Y3QgbXRrX2NhbV9yZXF1ZXN0ICptdGtfY2FtX2dldF9yZXEoc3Ry
dWN0IG10a19jYW1fY3R4ICpjdHgsDQo+ICsJCQkJCXVuc2lnbmVkIGludCBmcmFtZV9zZXFfbm8p
DQo+ICt7DQo+ICsJc3RydWN0IG10a19jYW1fcmVxdWVzdF9zdHJlYW1fZGF0YSAqcmVxX3N0cmVh
bV9kYXRhOw0KPiArDQo+ICsJcmVxX3N0cmVhbV9kYXRhID0gbXRrX2NhbV9nZXRfcmVxX3NfZGF0
YShjdHgsIGN0eC0+c3RyZWFtX2lkLCBmcmFtZV9zZXFfbm8pOw0KDQpJbiBzb21lIHBsYWNlLCBp
dCBpcyBjYWxsZWQgJ3N0cmVhbV9pZCcuIEluIHNvbWUgcGxhY2UsIGl0IGlzIGNhbGxlZCAncGlw
ZV9pZCcuDQpJdCdzIGVhc3kgdG8gY29uZnVzZSB1cyB0aGF0IHN0cmVhbV9pZCBhbmQgcGlwZV9p
ZCBhcmUgZGlmZmVyZW50IGFuZCB0aGUgY29kZSByZWFkYWJpbGl0eSBpcyBiYWQuDQpVc2UgdGhl
IHVuaXF1ZSBuYW1lIHNvIHRoYXQgd2Ugd291bGQgbm90IGdldCBjb25mdXNlZC4NCg0KUmVnYXJk
cywNCkNLDQoNCj4gKwlpZiAoIXJlcV9zdHJlYW1fZGF0YSkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+
ICsNCj4gKwlyZXR1cm4gcmVxX3N0cmVhbV9kYXRhLT5yZXE7DQo+ICt9DQo+ICsNCg0K


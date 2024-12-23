Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF96E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 05:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFAaJBZHtt71L0uHuw6N4K3K9N+YfnAWHukusuGObNg=; b=ChdR5h3S7zuhgjc9Rg86gwvZbN
	GNaGiLcO7PLX+EVVOOp7X7nZDtYOfcpQJx3F/QfWCPnDDW0pcDfuN7xVfkygdrSBkIaJiLphD68zo
	Z1FSJDFZTvwYu8YVyhjcaHfTJqqPMshQmBT29B8UvaMH6IKwX0Z/ZqdU76tzrsmG5sYFQh+/KEfFo
	j1goaeWtdPQo+LKDigrQH6XU/IyirTzr+fGMT37CpfoeuJxOD3lZWJa0uD3SMfulMP0bmLmBMnqXG
	5e4FbaQeudOvdehQIiwu/nLecP79EJ2wYRHlYl9GOFwp2A9AWFQthY5vwnBPirlJLWUAFUgh7Emm4
	j28mIadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPauw-00000009LjY-24o0;
	Mon, 23 Dec 2024 05:23:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPati-00000009LY3-435p;
	Mon, 23 Dec 2024 05:22:32 +0000
X-UUID: e6bd1bdcc0ed11ef82ff63e91e7eb18c-20241222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=aFAaJBZHtt71L0uHuw6N4K3K9N+YfnAWHukusuGObNg=;
	b=T44vKa6D7w0piIVsSAL+eWRHX5Pb++Yz6f4dbdSPF2MAru84p2z/1qjck+Oa8XaBz08sFikOIo8Q+yqCvaDV/HzZSVCkFPeXZRAfvTgCDXDneDyTIZWu5EqX8OKooVHxp4dmMI6R7txfVHKNLdyLd6SjdVepmYjs4Gt2wx4KiX8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:278d01d9-7296-4573-8176-72b9cde82304,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b4ad0925-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6bd1bdcc0ed11ef82ff63e91e7eb18c-20241222
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 476579718; Sun, 22 Dec 2024 22:22:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Dec 2024 13:22:25 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Dec 2024 13:22:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/srqIr9fIIxQ1jtctEGY4nrtuOOnRFuLFtLdJcYJnQfJR9/tR8SYTqG9mIDfUxRm2yLUBZAa/IYkPqG4gnZeT57Bj50FuxPFsQpPv+0WNGqHxnHs2brmCZmOXGAEqIftV4fiVKgZ1bQ5mVrrzyEPUGWVfH3xi3drWuhPNalEXXHn2SkYqdhRSeA0kJ/lLW662yvzm40CJOQrJt8AQUaS7f4A3D/dgjRtqduFZS5XEf7sI9Yl6a3crx+9OsCzMD5morTdgvUiitG/ZYQastJ5C0oUXcspUKDPzYVQHBj8u3umxATmYpcwoPOGnUQoCJl7yrpUid6oKoI/H2bQPzgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFAaJBZHtt71L0uHuw6N4K3K9N+YfnAWHukusuGObNg=;
 b=VlfSvHHKT498OpOWI1F2JbgNrOqXFOcK/7FGB9QC0hcoCF557byN+gp3PYO0Chk28tsA3HBrkDhtF0zCVYHLETo0Bn2M7raX+JNueLDRbYeWv+duFNfNdiiHFrcZwcSuJhncrIvg2OjASBQZ5/L/9FfAyPRcxi+QbMQ2jYB7TjkGkfvM29Twb7c4u07FB/I3/8ve693I6DWJ9bY0L/Oj+pk3XC+j53J4Fgq5UEObTiOk3RALuv1EDxTdw3/E+FldU0DG419YB2wnYSXYXlBNoPvknXXwvLALoGmrhYG3ji1ZYLY9L9rTzSsrKPmoWvILT1gh3laM+R2A7e4u4OWw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFAaJBZHtt71L0uHuw6N4K3K9N+YfnAWHukusuGObNg=;
 b=T/ha9Dk6CLy8u7JXIT5ljcoHNbBoAd/cersNdR3B57ewFCtrKSefSHRbLnr4eDuttXiBE3Hv8dY51ws/4lbFIDGHQv/Y00GNyBolH1JYVWXwgXilWayKUAPc+AmyxUuV9usKgR8nTDG7Z2U4OTs5vmy02NDoljaHOZCl/IJflqk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8099.apcprd03.prod.outlook.com (2603:1096:990:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 05:22:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Mon, 23 Dec 2024
 05:22:22 +0000
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
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 11/33] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
Thread-Topic: [PATCH v3 11/33] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
Thread-Index: AQHbUJqfre/2LGwNTk+af0BSMTN5V7LzVBQA
Date: Mon, 23 Dec 2024 05:22:22 +0000
Message-ID: <8c5857cc3602342e9d1b4cf6689a0d5a044d9a1d.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-12-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8099:EE_
x-ms-office365-filtering-correlation-id: 6f659163-fe91-424c-0264-08dd2311c7a6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U1dNcFZ1RFFTTEVnTXlRdmhHQnlRaUFmb2RUbVVEL3FuNGM5c0JhL2IrampU?=
 =?utf-8?B?OUxiYklsWHpzaDFKYTFxd0N2aExGMnZTeE5mT251ZkZOS3FReDNJd0gzczdQ?=
 =?utf-8?B?Ry81eWhXRkxoNDAyc1pQK0RjUVd2bVNWYVVUSkRZbEI3T0tNeDJvdng4ZHNr?=
 =?utf-8?B?S251azZQRVlwMGd4WWNpdTNQeDNmVDVLR2l2K3l4bk1PRnkvVmN6YkNMRXRx?=
 =?utf-8?B?d0tCL2J5UTJJT2ttQ09XUjAwbWRKVXNTTmthbkpVUmpSeU1rRUFqc1AwUjhU?=
 =?utf-8?B?SFdRZXJCMXlnNkdMYUhUZHdYUld2eklzL1d6d1NxWDlMdGErc1hiSTF1OHE5?=
 =?utf-8?B?OFV2R0NLQzVRanFzdHIzbHRhSGRwZ3ZLcllPOVJtcmYzVFRyNUh4MW8zUG9L?=
 =?utf-8?B?MjU3djFoRzVua2FZdHpaMUFmK1k4alZyTTZmcGoxQzNqSHhuNmFmQUZRbENP?=
 =?utf-8?B?N0trOXpOWkdpUmRYYitFd2p4T3B6U2JuemRtZFd6QWh4aWdmV2IxcEY4U1Nu?=
 =?utf-8?B?STVCdFAyS3dNV2FEQk5vWlJ6eWRxYW5xeUVoR3pxYmV4eGx6aldPM0xVLzVQ?=
 =?utf-8?B?ajhDTW9xVmczSkoxd0Q4VFhBSjh6Z0hCTkZ6SDVaZlpCRmU4bU5CSktsRXFx?=
 =?utf-8?B?ZHAydy9Ga3lZblJlUHlncTNldTlidkxsVzVqNlMzK21STnJPZ2lCRVRaV1hZ?=
 =?utf-8?B?Y1NWODg5ZXkwbjMzeXV4WFdLMkNBRkdHTmQwZzRJWk81dkl3eXMvc0pBOVBx?=
 =?utf-8?B?U1U5YVg0bHpwUWNFb0hhcnY4VWtUM1dmb2lpdmg4dENoSjM1ZGpLOFRtZTZH?=
 =?utf-8?B?UWJ3K3dXdU9RaE9zZ2cycmpsVWhFQ3Y1QVhIbDJwNVhGOHBITG5CeEVNZXRt?=
 =?utf-8?B?aDhETndRMUh6Uy82K0pPL3k3NkM1YWNJZEttV2h1VGtYbGNuekZ4QXBzdU1Z?=
 =?utf-8?B?VHpsOVE3LzV5Z0U3YmdKa3ZSNjM4ZjNFMEIzUDMxTDhQTVNUeWQxK1JWOWlH?=
 =?utf-8?B?TzJhZFU5WVNNaU5OR1JZaVhvRk53R0lUV290alFiWHRwNGEvWGpVWUdYRnVh?=
 =?utf-8?B?aXo5NTJZUjZUSGdnVUJMRmhVOTFWcXg2QnJqSVd1Yzd3ZHkvSk5HT3dDWnhm?=
 =?utf-8?B?N29ZZjU2cWticW16eGVJVHRBNFV6VSs1QitUWVBHV1FUZmNEUDN5RnpMM3Qx?=
 =?utf-8?B?R21QZWNkWU1Sc2VqMFlrUTYwV1J5Si81NkJRRUdSYXQ4TEdDWmV1eVFNMzhY?=
 =?utf-8?B?NkZjdkpkVThzWlEyb1Yzamo0YVZORE9hdkIwMlVYOEtxamNHaitvcFdSVkwv?=
 =?utf-8?B?cWFOYmRRdWdkdkVlNXVVOExpWjVnOFNFcjk4WDh3dzNSUHFIdlVuSE16VUxG?=
 =?utf-8?B?ZmdUeHFxQXNNR2YyUGdNL3RtVWZORGJEdmJjVHpHaFJIYno5b09QeWtuUFV3?=
 =?utf-8?B?aHpDTVArNVdXb3dJeUI1SDJ0SndwcG1mcFhTa3p1eENhaHc4d0REc20vK3Zh?=
 =?utf-8?B?cWZwY21LcU9sMEV1L0E4Tk9zRURDQjI0QjF2dWc1NE43cUhYWkRqQzZsQkdQ?=
 =?utf-8?B?UDlBUUFKeW9xZE5lRkRvRjlNbTNra2JFUHFnU0JmQi85RGRYVEhPQUlYVkRN?=
 =?utf-8?B?NG9UMkFYajgxa0dXdzJYMVV5cnpycUFJaHUrcDhvNTVOdlppMXpQUUJ2VDds?=
 =?utf-8?B?WW1Sd25sOG56Q25VT05BOHlyME0zTU5objNGY3NtZngxU1l1K0d4VHBRMytZ?=
 =?utf-8?B?K0hsUFd2NGtoMThIVmprNTBYZzFRT1lRUlpZMS80MnluWTl3UnpmdXJrUW4y?=
 =?utf-8?B?SkU4bmRaUGJxbzB2Uk4xNkNLOWRKdEFNZFdzS09DNjd2UUhRd2NSYXN5TWxr?=
 =?utf-8?B?VVZaczRrd1FhUks1MElQVW1ORTRKU0tUNjJNd3Q1eVNCTDJ3Yi9PVDdwbkd2?=
 =?utf-8?Q?J7r1kzh+EJxS+Fabk/63RXll95PFis0r?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmVjdVIxT1ZQYlJtdmRMb0V6RlFCYWJtSC9PZm9aU1VSZW9WOFVwZUhFdGVG?=
 =?utf-8?B?Tm1WS0xoS3lvUTJSbXAwU0p2WWwxNDk2OWlKWEUzRlI3aWZEMlpQRkVEaCt6?=
 =?utf-8?B?NmJoYlVYRjF6bmFMSzFwWnNLWEpDa3VRd1JVaFRyVU9lbmFYMHZJOGkwNnc0?=
 =?utf-8?B?YittU3U2RE1MTHlQWUtiQ0tpODE1RXlkeHhuWkk3UnpRSlhmbndXRlVqWDIx?=
 =?utf-8?B?S0ovUDZ0T05UOFVQRjFjV29HZGVRZGdiK2hRUkdPUGZvNUo3cVBLWW5TNEVr?=
 =?utf-8?B?UHZwa3RhT2k5UnZ5N1FGYTlKdDQySGtjdmg0SmF3Zy9xd1Vaa3h3VTFvNjJK?=
 =?utf-8?B?eGRKbzFsa0JuUkVuMm8wQzFuUmNuSXpjaGFNSWlkQmJTSmdBdGErRC93Yml3?=
 =?utf-8?B?eDJ2UzdndmZzTDRZSGdRQXRPYkZXZ2tndmt1TVg5cGt0bEFwV2VxUFFWTFFi?=
 =?utf-8?B?cmxUQ1c0bEZuUnFIL3VINUR6K0t1OGpOVlVqNit0d1ZGUUFUOEtwYXJpbCtM?=
 =?utf-8?B?YWQ4MzIrVkxHbE9XWGkrdklsOFRTaDR3dWlQRURjcUM0aElaUjlNYTVUaVBW?=
 =?utf-8?B?NUtMUXU3RjU3QzkwZlVobFdwc0hqSDg5bzZQVm12VEtkQlc0elZ2dENwWVY4?=
 =?utf-8?B?bm1pcDlkUzNpU0dVMzlFMEg4cktnYVhPb2RQNm9jSEdndlY2MjN6dkZreE9Y?=
 =?utf-8?B?dWN4UjE0TCtmY2tweVQ0aU5Nc0VIMTE2TkZUT3EzSkpPL0UzTXNSa0ZZS0xI?=
 =?utf-8?B?b1lHeEZuN3BLUzM5cGVZS3A0Z2g1SXQvQ0pCZjUrMjFLOWxwclVOMFp1cjYv?=
 =?utf-8?B?L1MzcDhzQ0c5UnZmV242RmQrc3RtOFJncGtRTXY1SWRnRVV6dGZyQ3Q3QUNt?=
 =?utf-8?B?aktHdkkrRE1lMzVBaUZYMWk4MHJKb1hEekdrSWdMS3Z3M21jcW02UkJTM3dl?=
 =?utf-8?B?dVBlSXA3ZXhDcjMyM2dUT3JtWU1DaGNnK2drcjE4L01kUXV2cDNkRHpianB6?=
 =?utf-8?B?WHZiSEdoS3VLTTVZM3pJcXM4L1ZXY21tTEhYZTYxeVNtNUlaZ251NFkrM1dB?=
 =?utf-8?B?TnNaWjM4SEtSYTlnUkR3K3gwWDFySzU1TW9Wa2ZkRnRMcjRydERtR2lZZ1Ri?=
 =?utf-8?B?eEhmem1neUlqYUt0dW9peFhtbUVRUXptSFRBNU5lOWZxZlJkZklMUm9PWUpO?=
 =?utf-8?B?bTlXSHhVK3hxdGM4RXZSbnVYakpIVTN3NWNSZDV5dzUrMEd5d2NXQk1DL0dt?=
 =?utf-8?B?bzMvS2h3TFBCM1ZtVlRJR09jcjRMYWl4MDlRVkhOVk83V0JBZjc4ZEVGM0ho?=
 =?utf-8?B?ZVFHQmlUeWlXZWZ0UllDZjZpSXhsNE9MT21Qd3hJRGU3QVJBZmV0elBuaXRE?=
 =?utf-8?B?UkV1RnRyaWozVlRtY2d3UnpjVG9ZYnNlUnB4dXZvWUNFNVhCZE9ORjVvazJ5?=
 =?utf-8?B?WDU1aHN3RGtoQjVrZkgzZFNvWktuTjIwaUVaNkU1VTlid2ROaDJVcktnT3py?=
 =?utf-8?B?U1poRm5TRzNHOGRmZUlaU2M3elQxckpSRlYwYUxsOFJJRVkxVFBkNzNBVVp3?=
 =?utf-8?B?L0IxdXRhT0YzSjhMeit0U1gyOTV2bXFRT0h2cDFYb3RXM2NrUFBrdG5aRlow?=
 =?utf-8?B?ZG9kYkcxRFQ1VFlGNkUwSGdUcmdTbTM5UkFGWkxmejc2UzNsQU10djRaRkh6?=
 =?utf-8?B?eExacDMyTTBuOGUwRnBWT2ErMGFkdnJGVzdkTXBBMEo4YWh3V0x1U1NCazVX?=
 =?utf-8?B?NzVBQ2p2eWhsbTdRbnNvT0VaRFdQbFFTT3RPdzNHUFI1ZWliR0ROWGtxNURo?=
 =?utf-8?B?emRqOXlncVhhNDBHc2R2S2NBSnZZOWRoQUNzTGVjajZMb2s1aUV3emlnRzRh?=
 =?utf-8?B?cGVaZjNmdDdyVTF5bHNBWEJwRG15eDZuT0JrWkp5N0s2aVpkemhjbjllNzVV?=
 =?utf-8?B?TGpNbDlGUVM3TFE3eXpoL3YxOGNDaFNubUxVZ3N4dWw1VG54RFNTZkovMnFM?=
 =?utf-8?B?RW04em8yejZDalVPazk0Ti93TnB1WXUrM2xNRVo3TXVmRGR0a1ZRdXViMU1l?=
 =?utf-8?B?YUZiMWIyYVRXcGhjZzlZZXE3T09EOUpQRnp1WkY2S0lJakdWdUppZ0p3TWtH?=
 =?utf-8?Q?6fXV4Ak02DBrXqMAa5EtU1NAU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F140162113F64EAA7E9AFA466FBDCA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f659163-fe91-424c-0264-08dd2311c7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 05:22:22.7304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHfNt1F97ozDmyR0GiMu9PLtC40/IublPTzdxPW6i34TB06j5pA825hdMim+20RyLuhIUGP19MAK52Wa8XXGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_212231_038241_21561C4B 
X-CRM114-Status: GOOD (  22.72  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgcHJvYmUgZnVuY3Rp
b24gb2YgdGhpcyBkcml2ZXIgbWF5IGZhaWwgYWZ0ZXIgcmVnaXN0ZXJpbmcgdGhlDQo+IGF1ZGlv
IHBsYXRmb3JtIGRldmljZTogaW4gdGhhdCBjYXNlLCB0aGUgc3RhdGUgaXMgbm90IGdldHRpbmcN
Cj4gY2xlYW5lZCB1cCwgbGVhdmluZyB0aGlzIGRldmljZSByZWdpc3RlcmVkLg0KPiANCj4gQWRk
aW5nIHVwIHRvIHRoZSBtaXgsIHNob3VsZCB0aGUgcHJvYmUgZnVuY3Rpb24gb2YgdGhpcyBkcml2
ZXINCj4gcmV0dXJuIGEgcHJvYmUgZGVmZXJyYWwgZm9yIE4gdGltZXMsIHdlJ3JlIHJlZ2lzdGVy
aW5nIHVwIHRvIE4NCj4gYXVkaW8gcGxhdGZvcm0gZGV2aWNlcyBhbmQsIGFnYWluLCBuZXZlciBm
cmVlaW5nIHRoZW0gdXAuDQo+IA0KPiBUbyBmaXggdGhpcywgYWRkIGEgcG9pbnRlciB0byB0aGUg
YXVkaW8gcGxhdGZvcm0gZGV2aWNlIGluIHRoZQ0KPiBtdGtfaGRtaSBzdHJ1Y3R1cmUsIGFuZCBh
ZGQgYSBkZXZtIGFjdGlvbiB0byB1bnJlZ2lzdGVyIGl0IHVwb24NCj4gZHJpdmVyIHJlbW92YWwg
b3IgcHJvYmUgZmFpbHVyZS4NCj4gDQo+IEZpeGVzOiA4ZjgzZjI2ODkxZTEgKCJkcm0vbWVkaWF0
ZWs6IEFkZCBIRE1JIHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMjcgKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGlu
ZGV4IDU5YThhODFmYTBlYy4uOTEzMWMyZmRmYmE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYw0KPiBAQCAtMTcyLDYgKzE3Miw3IEBAIHN0cnVjdCBtdGtfaGRtaSB7DQo+
ICAgICAgICAgdW5zaWduZWQgaW50IHN5c19vZmZzZXQ7DQo+ICAgICAgICAgdm9pZCBfX2lvbWVt
ICpyZWdzOw0KPiAgICAgICAgIGVudW0gaGRtaV9jb2xvcnNwYWNlIGNzcDsNCj4gKyAgICAgICBz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICphdWRpb19wZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBoZG1p
X2F1ZGlvX3BhcmFtIGF1ZF9wYXJhbTsNCj4gICAgICAgICBib29sIGF1ZGlvX2VuYWJsZTsNCj4g
ICAgICAgICBib29sIHBvd2VyZWQ7DQo+IEBAIC0xNjYyLDYgKzE2NjMsMTEgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBtdGtfaGRtaV9hdWRpb19jb2RlY19vcHMgPSB7DQo+
ICAgICAgICAgLm5vX2NhcHR1cmVfbXV0ZSA9IDEsDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyB2b2lk
IG10a19oZG1pX3VucmVnaXN0ZXJfYXVkaW9fZHJpdmVyKHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsg
ICAgICAgcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoZGF0YSk7DQo+ICt9DQo+ICsNCj4gIHN0
YXRpYyBpbnQgbXRrX2hkbWlfcmVnaXN0ZXJfYXVkaW9fZHJpdmVyKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCj4gQEAgLTE2NzEsMTMgKzE2NzcsMjIgQEAgc3RhdGljIGludCBtdGtfaGRtaV9y
ZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgICAgICAgICAgICAg
ICAgLmkycyA9IDEsDQo+ICAgICAgICAgICAgICAgICAuZGF0YSA9IGhkbWksDQo+ICAgICAgICAg
fTsNCj4gLSAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPiArICAgICAgIGlu
dCByZXQ7DQo+IA0KPiAtICAgICAgIHBkZXYgPSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0
YShkZXYsIEhETUlfQ09ERUNfRFJWX05BTUUsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBMQVRGT1JNX0RFVklEX0FVVE8sICZjb2RlY19kYXRhLA0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoY29kZWNf
ZGF0YSkpOw0KPiAtICAgICAgIGlmIChJU19FUlIocGRldikpDQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihwZGV2KTsNCj4gKyAgICAgICBoZG1pLT5hdWRpb19wZGV2ID0gcGxhdGZv
cm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoZGV2LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIRE1JX0NPREVDX0RSVl9OQU1FLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
TEFURk9STV9ERVZJRF9BVVRPLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmY29kZWNfZGF0YSwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGNvZGVjX2RhdGEp
KTsNCj4gKyAgICAgICBpZiAoSVNfRVJSKGhkbWktPmF1ZGlvX3BkZXYpKQ0KPiArICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIoaGRtaS0+YXVkaW9fcGRldik7DQo+ICsNCj4gKyAgICAgICBy
ZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBtdGtfaGRtaV91bnJlZ2lzdGVyX2F1
ZGlvX2RyaXZlciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGRt
aS0+YXVkaW9fcGRldik7DQo+ICsgICAgICAgaWYgKHJldCkgew0KPiArICAgICAgICAgICAgICAg
cGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoaGRtaS0+YXVkaW9fcGRldik7DQoNCldoZW4gZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgZmFpbCwgaXQgd291bGQgY2FsbCBtdGtfaGRtaV91bnJl
Z2lzdGVyX2F1ZGlvX2RyaXZlcigpIGluc2lkZSBpdC4NClNvIGl0J3Mgbm90IG5lY2Vzc2FyeSB0
byBjYWxsIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKCkgaGVyZS4NCg0KUmVnYXJkcywNCkNL
DQoNCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgICAgfQ0KPiANCj4gICAg
ICAgICBEUk1fSU5GTygiJXMgZHJpdmVyIGJvdW5kIHRvIEhETUlcbiIsIEhETUlfQ09ERUNfRFJW
X05BTUUpOw0KPiAgICAgICAgIHJldHVybiAwOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5075CCD043D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 06:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8whAk9Vn9w1GQVGJKyJbl6z0q0QxnE1VYj1721B420=; b=vxI5D4iXofifs6E9OXQhpEAxbY
	bOJRAtaxN1UfZNkNL8zlhKUmrisWx9N8sL4ZNAK2h7y/fNJum3irefiaqKOVh4VfuG56wlwQIMGLg
	FLfU0OSDNs5nFCTC2h98c76JWRndodi5QZ3esS085rJGpK6RRAsppE1vO9V14M5cn7TY7YZbU0xcf
	tImGNxN+mFoCFRQXqU4J79szFCPiTUWt7YettkK6oe/6OsJuxO4vWXig+aVq/uU0RBYUL3LqGQddK
	ohhylssYHLlXUfR3dbDkfvs7mLMVjx8gbUDu59b9n+UcfLBusWQH2HmcELYaqokHPPUtpmE4DHjHd
	lZwz53Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0J8-0000000CSVg-3c0D;
	Tue, 06 Jan 2026 06:12:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0J4-0000000CSVF-49mf;
	Tue, 06 Jan 2026 06:12:41 +0000
X-UUID: af567a36eac611f09f706fa2197c6ceb-20260105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=U8whAk9Vn9w1GQVGJKyJbl6z0q0QxnE1VYj1721B420=;
	b=bNV4mvyo1ZhVxVlrb1+xt1fw24kVWyY9XMuoRwfMJIswANUf5h/v5sXukM8/z53SHtwNqglLlW0nOSr907KjGL7TXerl3fJgVQeTBtGQam2Bjrq9LYUXSp7/E7ZQx21AviSc+C+UGOLFEP/Q4sEldClB27MVf2xOeX+VApVjDDI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:c462b4b2-eb4b-485e-9c19-06b09ae190b8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:52268603-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af567a36eac611f09f706fa2197c6ceb-20260105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 469410987; Mon, 05 Jan 2026 23:12:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 14:12:28 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 14:12:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+oLEuFR20fVS/bRNDX+e8iS8tifzPSi9ZHrgqKbVqLQy7aeICXO9L8MDLuw0bG43+WxDzpoLBTv9YwoASXQeoUyr10Ayj+nuCHRD4jNZGFqqdialgh7uNWcAtUY3Jwpn3l6/8LcpweDJo+0yObW3VdXkQVidXmLVS+B3HZocnZsRYC9EJAjUzgoL4g0OtxxAMtvOMrggdH4rH9W6mZsYJk+QMv2VFb6J+xEcwRwfkqcQDMjI8TfHdJXfUGiThT3R2epsAp7zX1V5x2Sa0EHvd3VMW7JZZrGU3sHhg8B827N5gsAJMz7UdY9TrxL0gsInz6osuQT+wCGb2ld7VlgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8whAk9Vn9w1GQVGJKyJbl6z0q0QxnE1VYj1721B420=;
 b=TPP5S9DPBPHQpttNDURUhhHM477hWP144KHVmWx7yUTYSzvTDbDb8Sj/pzCzDlId9uYsi4n+3ClcW4vGV4ajbF++6oUjrvC4jq4g8i/1BRrmEZzbaflYoIpINarBKUD6UiqDPsMgPdU6ixh+5HXavtej6YtiI0DYmFHyad9Zz4nEGMpInEmXN/DdzYE8y72myms9FHZXwy2nD5Cw6myWumWmUzgWXjGoDHkbPmWHaji/mxyJkdtSEyJtnngHQbTi099/Gy0/4vmo7CcwAufyljWVXilgb/E39BlcOLBtk1BDZi5sXX3AZuI61hqtj3f9WFtteXcndb6WjOCuq3BlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8whAk9Vn9w1GQVGJKyJbl6z0q0QxnE1VYj1721B420=;
 b=l+sQAdEfGiLkgEieJVek1w17sz/NeRbXYtrjetZ41ORqfrE7BjJb1LZx3zxCgbrgk7zM9MuxEMAYwGbiFSLYACtaEijzBci8moDJwJNTRu82/6wA61+ycRWbm3EXPoW+NLqQd6J3lB+bNqcl37kM4R5eeKy3PCowEg21kbL4Awo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB9547.apcprd03.prod.outlook.com (2603:1096:101:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 06:12:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 06:12:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "abhiraj21put@gmail.com"
	<abhiraj21put@gmail.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lkp@intel.com" <lkp@intel.com>
Subject: Re: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_*
 helpers in mtk_crtc.c
Thread-Topic: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_*
 helpers in mtk_crtc.c
Thread-Index: AQHcc/JE5tPcC2gs6EOo1LTEVYl637VEvvcA
Date: Tue, 6 Jan 2026 06:12:26 +0000
Message-ID: <afd48cef45d999aa65f9cf25e0ecab1c3f6b84d4.camel@mediatek.com>
References: <20251223095434.492041-1-abhiraj21put@gmail.com>
In-Reply-To: <20251223095434.492041-1-abhiraj21put@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB9547:EE_
x-ms-office365-filtering-correlation-id: 0f75af51-52a3-4978-7e23-08de4cea9096
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VUtsSFJuS0JzK2NzaDBFbmdnaXBCYXZ1eXM5Skg5ODJTYUJ5cWdoSTQzdnZh?=
 =?utf-8?B?RVRLQ1Z2M2k0cDkvY29iZXlGamlOWjV6OVdxVFdBL1ZtZXNvb0FxMStkYjR0?=
 =?utf-8?B?a0dPcnBOVWFYYmdwTStQMW5kRnNud1RsM1ExVUZ6OGd0ekRCeWdlNC9LR2hu?=
 =?utf-8?B?UHRadzY0cFl3b0RLQjhtUndoTmN1bDZoSUJzQmxFNnBmMCtrZ0R1MUhJbEN5?=
 =?utf-8?B?NGEwaWUrYVNsT1U5dUI3aTVXZndUMjl0QVpOQlN4ellaOHdsTGpYQzU3RGFy?=
 =?utf-8?B?Mm9xVUwzU0hqYlhmcGJJa1hDUTREZFE3N0JtOTY3WHM2ZFBGM0d4cjhkZTdw?=
 =?utf-8?B?Nk1GeW1ZTlBZN3NvbzNCR0orU0szSitqa2o3eW5uNUVROEFQYU1yZnBtZHFQ?=
 =?utf-8?B?c2p2RStXUGErS0VLaTl3TzJCdjk4VHQwWG1DNlNWakVDRi9EZjZQNDYxdlZV?=
 =?utf-8?B?TVdNaDBJeEwxZVNVVEpQMnA5TzVvSnJPbVExTXBsRGdtU0ZpT2w1bGJZUnQw?=
 =?utf-8?B?Q2FiVFhGazJ3OTlCamVMREhSZWI5aWNneGw3b0grSmFOKzhxUUpQTmUwaFg3?=
 =?utf-8?B?SThBalFIUzIwcHlFVjlGb054SjVHSmRLSGc1UlIyWjRFekZQajRqblV3OEdS?=
 =?utf-8?B?NEo0MkFadXdsckw4aTEvTmtYTXk3N004eVArMlZHclR3c3h4cHlmODVFazFV?=
 =?utf-8?B?NjljLzN3d2ZlZ2dHM2RadXRYY2JYYjhpV1Z4cy93cHl3ZVE5VzZwRExpT2pL?=
 =?utf-8?B?NjhJdHJEYVBOTGkzc285T21vZWErUjhnaVFraG81MG5rZi9qUTBTY3lwVjhx?=
 =?utf-8?B?dnh5UjNEUG1yZnhXeThXR1NyTUxaM0FrYkE4RU8yazVrREMrd0M0QjJBMjRh?=
 =?utf-8?B?L0l4bFFYeC81Z3BSWkxOUWZ6MUE4V0F3TkNVZ1BKSXk5aUROUm8wcDNEWUY0?=
 =?utf-8?B?amxJRUZjQjEwNUtlWE9kMS93cElZOTBkMHBjNWFLVFVxWVpaM2Z6Z0NjcERv?=
 =?utf-8?B?aEFUdFd0YlJLTkhnM2wwaHFSeWVLdXFlSGFrQThZd3BGZk9HNmc3ZVh0U2h2?=
 =?utf-8?B?eWpLS2UyT29GSkYwM0lpQ1oyRWZaMy9pTEorRlY3OWVGVVJBQzBleXcxTlN6?=
 =?utf-8?B?VmFVUTF5Z2xtZzlCWW03UDZjQk1iOUdVYW8yS0gxaHUvcnF5OWdJSmdkVUox?=
 =?utf-8?B?dGpBQWh4R1oxcmgydFVQcktVbG5DeUVSalc5WnNUT28rN2FVNUZnNTRRZXdp?=
 =?utf-8?B?d3l1UnlSc1o5Wm9pck8zSE56TEF6VlZBWXAybjA1RUpLSGJPTm84d3lHd1lK?=
 =?utf-8?B?ZEl4UkRGNytsUzU0Sk43dElnNmRCUC9QZVdkcFNzaFNZdExjVGx3Nm42T29V?=
 =?utf-8?B?ajFuckt5V1YyWnprMGFVSk1CWWViMmpmQVdlNHlpQkpyQ0hjRE9DRnEzZldi?=
 =?utf-8?B?a1dKU2w3QmZieXRLSXgvTU5ISDhpWDYyR2dtdWhYajVzczhsZ1Y0WUNqVDNt?=
 =?utf-8?B?bTdMNGVob28zUFA5ZUZGL1M0dS83UklwbGVIT0lDMjRNVklsaUN0c0UyOFJv?=
 =?utf-8?B?VER5TVBzZmEvVWp4K0lCbWZSU3FiemxTdDAvbEhXSEFwRE5zRmRWemwwSVJj?=
 =?utf-8?B?NGdlazdHR3VFYnozaGZHeU1tc21wRXlNdEp5VWRUejBuZm5aS2hHODZDcnJz?=
 =?utf-8?B?VnZTbi8rNWxmVkxiVmtocGEyMER4ZTVvYWJZWVZ0ckw2RmU3NDhqTXFJVGk3?=
 =?utf-8?B?RFZseCtwT3lGTHdyM0xEYWxybzhGaWxnZW5RUXlHd0JmOGhCY0VTL1psY1lE?=
 =?utf-8?B?dU1ZM3FXTTg1OXNsOUJSVlEzTGxxc3lKb3A1RVBUL2ZKb0p0TWw3ZEhuUkNn?=
 =?utf-8?B?V3RxbFN5bjZhRHlaT0Ntb0szWURiMWdhRGw4UDJWUTJ5VmdNY3l2S3BzYlRS?=
 =?utf-8?B?QnRaWjV6YnpZVG9lWXZLUVlLZVNHeWRVZTZLb3VXZWJ3YU41TU5YcVpEMjFI?=
 =?utf-8?B?czVxTlEwU1g5bjArNVNWQTlydDhvNU9LVFRMV3Y5cERiS29CWjNOY3QxR044?=
 =?utf-8?B?eUFGVTRNVlVYd1NVRGVKYjdOdjh3OGlWRWhjUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFRRT2pTRlc2NUR2OG00S3NLYXBQMFJneGx4VU8vcFUzTGhhTm41TXJnRnEy?=
 =?utf-8?B?NU1LbjRJRWxMKzVRVG4xU1NKQ0dySlV2YWZyTVpDL2dBb3d6ZXdBdHFBMzJa?=
 =?utf-8?B?akZiU1VPR1pUaGs4cGNnajhzNlZkRDZrb0tDLzZBeU9ub01hWGdYTmpsSWZP?=
 =?utf-8?B?RUJITUl0TTUyQ1VOMmJnK2UxV3M3UmdJVHBtRXU3NnVKZXBzZnJzOFF6aG1O?=
 =?utf-8?B?dXFORWordGdYd29FTURvYjhFTDliZEpEWEFNMzlWRFVlK01BVlh3ZU5KUFB0?=
 =?utf-8?B?eWpIMC8vMmZPZGk4Q1J0NCtlRlJrbVY1aVprQnpWK3BydnZ3UFZiZ3dLNDdP?=
 =?utf-8?B?bGNTM3U0dUI1VjliY1ovWEVzYnRzaEYzNnNRQys2RDdxZ0Y3MlFnOWVGVTVV?=
 =?utf-8?B?WVI4QklKeWdwOGwzblhDdEtSMnlWaHl1akFsK3hpODN6MFVrTFVkdnZFa3pm?=
 =?utf-8?B?emFxdDZEMUdia1dpajV4TWdScmNuOFppV01lOXNBMERVcXA3dVk3MW80YUZ1?=
 =?utf-8?B?N1ZSQzlaNUxxUFpyUGtuLy9uNkRlSmsvWjYxakVMRTlWa01lR3J0a1JlR0lN?=
 =?utf-8?B?TStwd0ZzS0cvSnM1bm1wN0xOTjVHbzh6VklPOUFGMWFwajkyWkFUbThxWFNK?=
 =?utf-8?B?K1lodUhxSlVydkdlQm9PMk9uZ0xheG1OcWFyNHZYcEdLR3lyTG9kbHRKVEpD?=
 =?utf-8?B?QVdFbFlaTStkU01yUGdpU05ZcDE4U25ZS0xNaTZ4bWJESDN0VHRwbmFFMXIw?=
 =?utf-8?B?VDgrY2pkYitlbkRZZCtlQ0tOYzNNUHQ1Y1EyRFBFcDVTc2tVUlRMUEducEVp?=
 =?utf-8?B?MmNxSXRHSnVNdU03bXRRM0ZBRk40b1orYmZOZ0YyTVo0Y1ZUREdDQXRLaStS?=
 =?utf-8?B?b1FEQ3QrcmM5M2N6R1hjcm16a2luZ3p2cXpMZ25aUVp1ZGhoakE1MGlPdzRL?=
 =?utf-8?B?R25LaGxYR04xTE5tYkJrS3FneWtrNkJvZ3Q2T0lLd0QyWnVUL0hRMXZNOEtv?=
 =?utf-8?B?NmJHaTdHUDZISERlY0hNRWJpTFdtRTV4K2NLdWlXMG1KU3BQV2NuRTJOcVJz?=
 =?utf-8?B?cThVZU5xUGw1OXVTcHd0OFRwMXhFd0dJSE1TdFluSklwVXR3bENEc01MZ1JH?=
 =?utf-8?B?bnRMK3BwNEtXeWRZUnkrMjhpVWFqNng1dEwvMGt0RU1GdlNwcGM1ekErYXpo?=
 =?utf-8?B?UHBhTTRvNlFWdVZRTHZGUjVOUlJqTmlzWGhER2hVMXJoTElHcmtTWU5vZDNZ?=
 =?utf-8?B?RXZEalg2NVF2WVBBUk5XUlJZbjQwblFxZjV4UEp0bU9YWVp3SU13cytxZ2xh?=
 =?utf-8?B?R0RMSEd6UzFGWWd4ck5XbE01Y0RYMi9TdTJlUUpVOEVXV2k0MHRzcGpJV2ZS?=
 =?utf-8?B?MjF5R28zQVNrQzVTZGxTQUF6alVYT2xWTi9oUG80OU9UVGZ2WG1WU1ZocWZX?=
 =?utf-8?B?QnJiWXVBeXpCY05neGNRcUFrYWtSaEhKcWZDUkxFMUJPWm9sekNseHJTcGUw?=
 =?utf-8?B?R3YxSnlWc2FQWUhsM3puZExoTWZjYVc4WjUyNi8wRzFId2JlWnZ1Nk9jd3Ri?=
 =?utf-8?B?WEpPdUlieWJPcnp6a08rRTFNcDlmZEh2QkxYRlVSZDhhY3lMNmdvK0t3c0NJ?=
 =?utf-8?B?b2d1R3RRWVZkamF2TGdZUUFISXltMlU1TUVOS0ZSSzlleVU2dTNIV1dnS2JN?=
 =?utf-8?B?RFZPQmpuOGhLSXJHVE92VUZpZDFFN2NzM0JZV1dkU0J2dFNHbzl3a0FZZi9W?=
 =?utf-8?B?Q1JCTXVIVTZhNFlPclN0Vy8vY3NDb1RtanRXQUpUSGRTbDJubDFuaW5wY3c3?=
 =?utf-8?B?RFZQWUJYRi9QSWdacjc0U3o0WkJWQ2xjZFNkOW9XNnQrTUFHcXRNVHBCTDUy?=
 =?utf-8?B?aGFnMmdxV0hNODFydkhhRGtnMTU3SGJRUzF0dzQvaC9jS3R4T05qQWkrc3lj?=
 =?utf-8?B?cDRmVWVlZ0RTYlZjYmZsVXNMSGtWR2RpN09OUGgrTytUcFNnVUZJR0Uzb0tr?=
 =?utf-8?B?VlhLc1l1V0NNQVNFYTRvUnF1U1RBdE1KNklSWWQ1d3YrWUp2ZGFDVnNCc29z?=
 =?utf-8?B?ZTVTWEJVekFVTCt3OWdzOFgycUZ3MHI4bWRjZFhlTTBqRkcwamMySk1weHl3?=
 =?utf-8?B?dUxMSHZaaWFLZEVRTlM2TitxaFVaUXZoRE0vRldUTWlOMkhZcGw5N1dlQUMz?=
 =?utf-8?B?SFcxc0txSGdzRWxaM2NEOEI3ckhWT0pDYXpVTWpnWUFKYVVWYThLNVdUVkh2?=
 =?utf-8?B?emhEVXpHekFWWmZGa2Yzd1JXakFSbGd2UTBpT3FuVG53RlgwQkVNWmIySlJr?=
 =?utf-8?B?VnczV3NEM0k3VjlXVVRIOTJUYWNmVm1EVE1kRldkcTFoM0V2OFlRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B029746F9378F41899A740CB3C76389@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f75af51-52a3-4978-7e23-08de4cea9096
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 06:12:26.4907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uc592zh5Liwvfwj/GXn+SCha+iil1Bne3G7z1JeXpvHZeGvna6y/odVDdw0vcgWjTcAdPO3f8eQs3YJ2bXueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9547
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_221239_854335_1C52C607 
X-CRM114-Status: GOOD (  20.13  )
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE1OjI0ICswNTMwLCBBYmhpc2hlayBSYWpwdXQgd3JvdGU6
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+IA0KPiANCj4gUmVwbGFjZSBEUk1fRVJST1IoKSBhbmQgRFJNX0RFQlVHX0RSSVZFUigp
IGNhbGxzIGluDQo+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jIHdpdGggdGhl
IGNvcnJlc3BvbmRpbmcgZHJtX19lcnIoKQ0KDQpkcm1fZXJyKCkNCg0KPiBhbmQgZHJtX2RiZ19k
cml2ZXIoKSBoZWxwZXJzLg0KPiANCj4gVGhlIGRybV8qKCkgbG9nZ2luZyBoZWxwZXJzIHRha2Ug
YSBzdHJ1Y3QgZHJtX2RldmljZSAqIGFyZ3VtZW50LA0KPiBhbGxvd2luZyB0aGUgRFJNIGNvcmUg
dG8gcHJlZml4IGxvZyBtZXNzYWdlcyB3aXRoIHRoZSBjb3JyZWN0IGRldmljZQ0KPiBuYW1lIGFu
ZCBpbnN0YW5jZS4gVGhpcyBpcyByZXF1aXJlZCB0byBjb3JyZWN0bHkgZGlzdGluZ3Vpc2ggbG9n
DQo+IG1lc3NhZ2VzIG9uIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSBHUFVzLg0KPiANCj4gVGhpcyBj
aGFuZ2UgYWxpZ25zIHRoZSBNZWRpYXRlayBEUk0gZHJpdmVyIHdpdGggdGhlIERSTSBUT0RPIGl0
ZW06DQo+ICJDb252ZXJ0IGxvZ2dpbmcgdG8gZHJtXyogZnVuY3Rpb25zIHdpdGggZHJtX2Rldmlj
ZSBwYXJhbWV0ZXIiLg0KPiANCg0KQWZ0ZXIgbW9kaWZpY2F0aW9uIGFzIEkgY29tbWVudCwNCg0K
UmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBDbG9zZXM6DQo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTEyMjIwNTE1LnozUXliSjhJLWxrcEBp
bnRlbC5jb20vDQo+IFNpZ25lZC1vZmYtYnk6IEFiaGlzaGVrIFJhanB1dCA8YWJoaXJhajIxcHV0
QGdtYWlsLmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAtIEZpeCB1bnVzZWQgdmFyaWFibGUgd2Fybmlu
ZyB3aGVuIENPTkZJR19NVEtfQ01EUSBpcyBkaXNhYmxlZA0KPiAtIEFkZGVkIFJlcG9ydGVkLWJ5
IGFuZCBDbG9zZXMgdGFncw0KPiBMaW5rIHRvIHYxOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTEyMTcwNzAzMDMuNjg5OTEzLTEtYWJoaXJhajIxcHV0QGdtYWlsLmNvbS8NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jIHwgMjIgKysrKysrKysrKysrKyst
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBpbmRleCA5OTFjZGIz
ZDdkNWYuLmJjYTJlNDBiY2E1NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRj
LmMNCj4gQEAgLTIyNywxMSArMjI3LDEyIEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2Nsa19l
bmFibGUoc3RydWN0IG10a19jcnRjICptdGtfY3J0YykNCj4gIHsNCj4gICAgICAgICBpbnQgcmV0
Ow0KPiAgICAgICAgIGludCBpOw0KPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBt
dGtfY3J0Yy0+YmFzZS5kZXY7DQoNCk1vdmUgdGhpcyBiZWZvcmUgJ2ludCByZXQnLg0KDQo+IA0K
PiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkrKykgew0K
PiAgICAgICAgICAgICAgICAgcmV0ID0gbXRrX2RkcF9jb21wX2Nsa19lbmFibGUobXRrX2NydGMt
PmRkcF9jb21wW2ldKTsNCj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxlIGNsb2NrICVkOiAlZFxu
IiwgaSwgcmV0KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJtX2VycihkZXYsICJGYWls
ZWQgdG8gZW5hYmxlIGNsb2NrICVkOiAlZFxuIiwgaSwgcmV0KTsNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBlcnI7DQo+ICAgICAgICAgICAgICAgICB9DQo+ICAgICAgICAgfQ0KPiBA
QCAtMzQzLDYgKzM0NCw3IEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0
IG10a19jcnRjICptdGtfY3J0YykNCj4gICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yOw0KPiAgICAgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsNCj4gICAgICAg
ICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOw0KPiArICAgICAgIHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtdGtfY3J0Yy0+YmFzZS5kZXY7DQo+ICAgICAgICAgdW5z
aWduZWQgaW50IHdpZHRoLCBoZWlnaHQsIHZyZWZyZXNoLCBicGMgPSBNVEtfTUFYX0JQQzsNCj4g
ICAgICAgICBpbnQgcmV0Ow0KPiAgICAgICAgIGludCBpOw0KPiBAQCAtMzcxLDE5ICszNzMsMTkg
QEAgc3RhdGljIGludCBtdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1Y3QgbXRrX2NydGMgKm10a19j
cnRjKQ0KPiANCj4gICAgICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGNydGMt
PmRldi0+ZGV2KTsNCj4gICAgICAgICBpZiAocmV0IDwgMCkgew0KPiAtICAgICAgICAgICAgICAg
RFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxlIHBvd2VyIGRvbWFpbjogJWRcbiIsIHJldCk7DQo+
ICsgICAgICAgICAgICAgICBkcm1fZXJyKGRldiwgIkZhaWxlZCB0byBlbmFibGUgcG93ZXIgZG9t
YWluOiAlZFxuIiwgcmV0KTsNCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICAgICAg
ICAgfQ0KPiANCj4gICAgICAgICByZXQgPSBtdGtfbXV0ZXhfcHJlcGFyZShtdGtfY3J0Yy0+bXV0
ZXgpOw0KPiAgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+IC0gICAgICAgICAgICAgICBEUk1fRVJS
T1IoIkZhaWxlZCB0byBlbmFibGUgbXV0ZXggY2xvY2s6ICVkXG4iLCByZXQpOw0KPiArICAgICAg
ICAgICAgICAgZHJtX2VycihkZXYsICJGYWlsZWQgdG8gZW5hYmxlIG11dGV4IGNsb2NrOiAlZFxu
IiwgcmV0KTsNCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX3BtX3J1bnRpbWVfcHV0Ow0KPiAg
ICAgICAgIH0NCj4gDQo+ICAgICAgICAgcmV0ID0gbXRrX2NydGNfZGRwX2Nsa19lbmFibGUobXRr
X2NydGMpOw0KPiAgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+IC0gICAgICAgICAgICAgICBEUk1f
RVJST1IoIkZhaWxlZCB0byBlbmFibGUgY29tcG9uZW50IGNsb2NrczogJWRcbiIsIHJldCk7DQo+
ICsgICAgICAgICAgICAgICBkcm1fZXJyKGRldiwgIkZhaWxlZCB0byBlbmFibGUgY29tcG9uZW50
IGNsb2NrczogJWRcbiIsIHJldCk7DQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9tdXRleF91
bnByZXBhcmU7DQo+ICAgICAgICAgfQ0KPiANCj4gQEAgLTY0OCwxMCArNjUwLDExIEBAIHN0YXRp
YyB2b2lkIG10a19jcnRjX2RkcF9pcnEodm9pZCAqZGF0YSkNCj4gICAgICAgICBzdHJ1Y3QgbXRr
X2RybV9wcml2YXRlICpwcml2ID0gY3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsNCj4gDQo+ICAjaWYg
SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gKyAgICAgICBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gbXRrX2NydGMtPmJhc2UuZGV2Ow0KPiAgICAgICAgIGlmICghcHJpdi0+ZGF0YS0+
c2hhZG93X3JlZ2lzdGVyICYmICFtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikNCj4gICAgICAg
ICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0YywgTlVMTCk7DQo+ICAgICAgICAgZWxz
ZSBpZiAobXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA+IDAgJiYgLS1tdGtfY3J0Yy0+Y21kcV92
YmxhbmtfY250ID09IDApDQo+IC0gICAgICAgICAgICAgICBEUk1fRVJST1IoIm10a19jcnRjICVk
IENNRFEgZXhlY3V0ZSBjb21tYW5kIHRpbWVvdXQhXG4iLA0KPiArICAgICAgICAgICAgICAgZHJt
X2VycihkZXYsICJtdGtfY3J0YyAlZCBDTURRIGV4ZWN1dGUgY29tbWFuZCB0aW1lb3V0IVxuIiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY3J0Y19pbmRleCgmbXRrX2NydGMtPmJh
c2UpKTsNCg0KQWxpZ24gdG8gcHJldmlvdXMgbGluZS4NCg0KPiAgI2Vsc2UNCj4gICAgICAgICBp
ZiAoIXByaXYtPmRhdGEtPnNoYWRvd19yZWdpc3RlcikNCj4gQEAgLTc3Niw5ICs3NzksMTAgQEAg
c3RhdGljIHZvaWQgbXRrX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
DQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG10a19jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRj
KGNydGMpOw0KPiAgICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAgPSBtdGtfY3J0Yy0+
ZGRwX2NvbXBbMF07DQo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG10a19jcnRj
LT5iYXNlLmRldjsNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gLSAgICAgICBEUk1fREVCVUdf
RFJJVkVSKCIlcyAlZFxuIiwgX19mdW5jX18sIGNydGMtPmJhc2UuaWQpOw0KPiArICAgICAgIGRy
bV9kYmdfZHJpdmVyKGRldiwgIiVzICVkXG4iLCBfX2Z1bmNfXywgY3J0Yy0+YmFzZS5pZCk7DQo+
IA0KPiAgICAgICAgIHJldCA9IG10a19kZHBfY29tcF9wb3dlcl9vbihjb21wKTsNCj4gICAgICAg
ICBpZiAocmV0IDwgMCkgew0KPiBAQCAtODAzLDkgKzgwNywxMCBAQCBzdGF0aWMgdm9pZCBtdGtf
Y3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICB7DQo+ICAgICAg
ICAgc3RydWN0IG10a19jcnRjICptdGtfY3J0YyA9IHRvX210a19jcnRjKGNydGMpOw0KPiAgICAg
ICAgIHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAgPSBtdGtfY3J0Yy0+ZGRwX2NvbXBbMF07DQo+
ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG10a19jcnRjLT5iYXNlLmRldjsNCj4g
ICAgICAgICBpbnQgaTsNCj4gDQo+IC0gICAgICAgRFJNX0RFQlVHX0RSSVZFUigiJXMgJWRcbiIs
IF9fZnVuY19fLCBjcnRjLT5iYXNlLmlkKTsNCj4gKyAgICAgICBkcm1fZGJnX2RyaXZlcihkZXYs
ICIlcyAlZFxuIiwgX19mdW5jX18sIGNydGMtPmJhc2UuaWQpOw0KPiAgICAgICAgIGlmICghbXRr
X2NydGMtPmVuYWJsZWQpDQo+ICAgICAgICAgICAgICAgICByZXR1cm47DQo+IA0KPiBAQCAtODQ1
LDEwICs4NTAsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2NydGNfYXRvbWljX2JlZ2luKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcnRjKTsNCj4gICAgICAgICBzdHJ1
Y3QgbXRrX2NydGNfc3RhdGUgKm10a19jcnRjX3N0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0
Y19zdGF0ZSk7DQo+ICAgICAgICAgc3RydWN0IG10a19jcnRjICptdGtfY3J0YyA9IHRvX210a19j
cnRjKGNydGMpOw0KPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtdGtfY3J0Yy0+
YmFzZS5kZXY7DQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gDQo+ICAgICAgICAg
aWYgKG10a19jcnRjLT5ldmVudCAmJiBtdGtfY3J0Y19zdGF0ZS0+YmFzZS5ldmVudCkNCj4gLSAg
ICAgICAgICAgICAgIERSTV9FUlJPUigibmV3IGV2ZW50IHdoaWxlIHRoZXJlIGlzIHN0aWxsIGEg
cGVuZGluZyBldmVudFxuIik7DQo+ICsgICAgICAgICAgICAgICBkcm1fZXJyKGRldiwgIm5ldyBl
dmVudCB3aGlsZSB0aGVyZSBpcyBzdGlsbCBhIHBlbmRpbmcgZXZlbnRcbiIpOw0KPiANCj4gICAg
ICAgICBpZiAobXRrX2NydGNfc3RhdGUtPmJhc2UuZXZlbnQpIHsNCj4gICAgICAgICAgICAgICAg
IG10a19jcnRjX3N0YXRlLT5iYXNlLmV2ZW50LT5waXBlID0gZHJtX2NydGNfaW5kZXgoY3J0Yyk7
DQo+IC0tDQo+IDIuMzQuMQ0KPiANCj4gDQoNCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE74D6552B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSyFEybwxToMGovx6hwLHiFedzi7WWPDUeCJoDwRlGo=; b=CJLs6aT3grbaMMyzPqJKlJY1nL
	12geLQWIIq9TdzcaHxkr1WD84yM3m/7ImNY8nwCycvbkrW0p0j9YwGDxZIuP5PuCBXFVBom4omTZA
	VCDAXQUntCtweFpJMuSWnkg/0ccmgcdc/9azrbUcrmo1MHIVTt/B2Lj7puViC1uIF92CsZs2t46rV
	LREo9LFCW97mMNVwZ1Aj4avunh7BI8vgPIolG3kADPWWnI05HU0PqeUA/y2FW5f60GCyrJ++OtBDJ
	oHiFFSOBV/6oZQSwp42fX20LhdBjyoMgljwhs69CF6YJ6HDYyVthb5I6FusGxLh6hC5hs6D0tUG3v
	IvoJCadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoJX-00000006U5H-2cUh;
	Wed, 17 Dec 2025 09:59:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoJV-00000006U4M-0LxQ;
	Wed, 17 Dec 2025 09:59:22 +0000
X-UUID: 0c50c680db2f11f09f706fa2197c6ceb-20251217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=tSyFEybwxToMGovx6hwLHiFedzi7WWPDUeCJoDwRlGo=;
	b=ab4kUJGHUbQCtD09qmy4c7aPvNy7hRe7FKeRitOYfOvoP+9b/MpRPv25yyXJ8bBvlAz4t3wXQqAsg7Jrd+b3cz4KuHH6Scc8p1DZeiFqfQ3NDx2FsuqIsbV0N+RG0eoFd2sNQNms7dKmE57ke4aaW1115BvzotHzXhhkEajpm1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:df120792-d5e2-4b1e-ab1e-52e9ccdc0d42,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1c9a8ac6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|52,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c50c680db2f11f09f706fa2197c6ceb-20251217
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 969847168; Wed, 17 Dec 2025 02:59:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 17:59:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 17:59:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwWDqLfbgS/dSC8uDpsLu3vSvU+IV9M4LuJSA6BVHre7BDYZPN0oL704M+y3TMf3r5dFD9B7tFozQc99BMicO8tGQHGGC8IfENgKyxCJAMz1JDpwyf8H66yqzL/sSpXO/v4PxF8QNY7AI5PwuJQM6BfjGKAwxLzAhTCGwbiZxwvB0g4lqYTnUHcd9OVUiGnWCbgPJLOO9GDy5fza1kqRo0BOqaOiFKkasRD/I5K/WZ+lBdL/1ujXeMqyeHnqys/tvbh5MbH1kB9+XsMBS9001Tj32waIuEz9wMay4qs7FGjItGFWUgvwFVg6MgVdCJsN6EL7PH3l1LY3dsJF9Tf/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSyFEybwxToMGovx6hwLHiFedzi7WWPDUeCJoDwRlGo=;
 b=CXxpWHPkV6qqXKCUIBl0cpfiTrtgYuU8rCSU6P+rfkdpW1qeQsuxw+/rSg/8qCAEhDbRSL4MweAc1FR914oT/bX3+jTKLjJMsHSMhWTs0E7+q4kLJ0AxX/I2eV9pUTmn3Ir6O5gUNpakJEOP24gzGEXvtoU/b5nUScmmR87+PtqyqvbgiGKPHqJbIK+uYUZPaDKjXV0hxjr9wZAshNNmmXncUOru5YuC9JPQoz8q9fLRXFb6Qi1NF6zGTHtxxi7SvlXEn/Mr8zVdfDkmCWYU6aK2GFAObYZDD/lKqsuJy/bQslQBofHfrQHX6DE5MlJerqllv5yWfXEdhinXb0VwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSyFEybwxToMGovx6hwLHiFedzi7WWPDUeCJoDwRlGo=;
 b=IpC1SsJtWUy2yA7sMe7xywSPU+nnA2JsTtndg+1hPYF2qHm1kQ/rRzBFaBNudrh34U4Qxp1rLEvz2Q6eKBMH1ZuBS92wGqAVP0k/lxty01k2x+btgiHPtHdZh3PVQEZXEigJS3Ag3NDaYwlSzSn1fyiWMMDJ4U+V/L+vLkwugXM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6513.apcprd03.prod.outlook.com (2603:1096:101:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:59:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:59:05 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?=
	<Peng.Liu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmCip4eLqWqN0GPcdLj8ezueLT5z/4AgAfanoCAAr9PgIAIFa2AgBldI4A=
Date: Wed, 17 Dec 2025 09:59:05 +0000
Message-ID: <63a3900c13c329fd04ac2fac838ef6058b5e2d5d.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
	 <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
	 <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
	 <54b075b4ff6b9aa7cd916bb65e34e5edae3642dc.camel@mediatek.com>
	 <f4e8ba2e9f9a8e5fd4b35afe25b9874c64c6ea17.camel@mediatek.com>
In-Reply-To: <f4e8ba2e9f9a8e5fd4b35afe25b9874c64c6ea17.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6513:EE_
x-ms-office365-filtering-correlation-id: fad016a3-7c70-4375-8513-08de3d52ea0e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|42112799006|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?L25BdWNJSE9KeUpObDRKWFc4TlF3TTVlc1NtK1JCRmg5RzBxSCsrcWZxaGVZ?=
 =?utf-8?B?ZjZia253VVJKY0lUemRaVm9ERFJCNTFJYnM1ekJDaEhGK2E4anlsbTB2N2kv?=
 =?utf-8?B?OUZETXZqQ2F3VkFYN05yUW1jVithdVdZem9QMTVrcW1YRHpxaEVlOS9WNkd2?=
 =?utf-8?B?aFZId2YrN2IrVXVLTlN2ZHFjOGtsK29LM2pQeWtrYmtNSmwxODV0M2MyMGdJ?=
 =?utf-8?B?TGp2RmxmM1RwS29RYlpZcWVJSHlYWE56bVdrM0dSWWF2NmpDOHliSWtTRERQ?=
 =?utf-8?B?aDU4VGhCV0Fad2dwNjUzYkZNZHgxZUVkRGFzT0ZJcDZJdXU3QVExRFNDU0RN?=
 =?utf-8?B?dE1lMlBwbE0wRmpTaU1BVkFzRmd3M0hvdmw0MjB5bnowczN1Z1hYdGY0WDg5?=
 =?utf-8?B?N1AzV0pub3FKeWE3OGNWSDFVYk5URlg3cUd2emkreFFuRDdENXVXV1FKaUtj?=
 =?utf-8?B?c2NUU0Z5OEwwc1QxN0N6OTlwNmJHSTg1U2cyQkFzdVhXMjFaaE1vemNVaTVZ?=
 =?utf-8?B?Q1NJZlRCbDBCL2NyNXYyTkFIWTV1VktXMCtxb2lXRm9BdktZUDlzblFsbkNi?=
 =?utf-8?B?bUl4elJBcUljOVBNb042aDg2ZW5GUlBIU3YvK2NRVTZVZ3BhZ1ExSXl0UG05?=
 =?utf-8?B?dUx6SzJjazcvMzZib0YrMDAvckp2STZwclRpdFMyLzVWS2R2Ulpsd2dkVXg3?=
 =?utf-8?B?dU1RTjNHcHZ4N2dsVDYxRzFwckNiYVM4RTdPeUlqZzBtRUs2SW14QlpwYXFn?=
 =?utf-8?B?N21lL0RaSkRRaTNOckFMQkJHeDcrdGlRU0pRQThwYi9GRWl2cXhIclMwdUJi?=
 =?utf-8?B?QlU2blVmRDU4S3Y2Tk03M202aHNCVk5wZ0pJS1pJbThIN3lIbzR1a3RwTDBM?=
 =?utf-8?B?aGY2eXV4SDlJRjBZTDJwR0Y0RkFUNWtxL3UvbW9LZ05LT2t5SGVoWUlGOHRZ?=
 =?utf-8?B?amRRbmd4QW1lQkxYUEk0dmt0WTRhN3UrMzhQa3BnVTU3UGFUU1RhUWdBa2JT?=
 =?utf-8?B?aWgzcEZ0N29Hb09NQ01qNDVucU1LZTVXS2x6NUY2L1owV3c0dnpDa0RlK2hH?=
 =?utf-8?B?Mis0L3FLVVpGSE10ZXpsaXhCV0gzcVkxMTVwQUx1QkMzVlZBU0J3MVFBemFW?=
 =?utf-8?B?b000K2tVUDlOdHZhb3M1UDh3b0ZmV2x1SlNVS0FyZUFsd3MwTXlMZkhRelNO?=
 =?utf-8?B?OCtkZEU3Y0NsWVdaZSt5NmJqTVJQbjdaNlpiWW9xK2lCTEhQZ2hyNEk2NDh3?=
 =?utf-8?B?a2UwMjVlZVFHd0ZCVTlTc3ZJQWhvcG1EMTdWME1YYXA1WUtyditOQkJqNzdD?=
 =?utf-8?B?QUptcjdIakZVUGh5Y2xqMTdtZ1dnUXNjNzMrL2wwd3NFRkdLeXYxVzhSVXN6?=
 =?utf-8?B?K2ZtaXNFZGt5WXJEUksrbHVGakxCbEx5RDZkK3ZKV0c5bWxIVkM3Q2FJUGpU?=
 =?utf-8?B?TWdHNTYyZGV5S0hhNHBJT2oyZ0hCamhaRDY4a1ZqWFEwd2YwOE9ZNWhDa3or?=
 =?utf-8?B?TlFIWVk4M0UvM0hqL3RERXJxOUFJbFBFd2liSUd5c3BlWEhHOURnYS95SzhZ?=
 =?utf-8?B?c1BrUWxmSjRMa1kxNThTQjFIZEdrbkMrU0UydndLaGdQQmVFQnpxb2NreWNX?=
 =?utf-8?B?OS8zWDhDR2tKYzVSbC9hSmUrRkFnMElEdmpoVDBkanRpdzJKM2N5VnJ6KzJI?=
 =?utf-8?B?VFlEUlV6dEZLRk9jQmk3U05RSzI3RDVhR0h6TzB6S1U0aWhadFQ3VjU5OWlS?=
 =?utf-8?B?UEVpbENGSFZKR0VrelRienhFZlVZYmpuTUYrWTI3VDVtYzlmZ29NZldhaFY3?=
 =?utf-8?B?eGQzNnJhb29aUTBTR09PSG5jbVNsc1Y4VVIrZDczZWJCeExRelp1Vys5dFp4?=
 =?utf-8?B?L1JCejYyd2dqRStjM25xNDAvYnl5bzBiaktvcFkyZ1Yzb0RwTFF0dnhBbnBQ?=
 =?utf-8?B?TWFtTE9seTlUUXpGNVFQOE93SjV2SWQwelZFdk01dVduSjlSTS9VcFJiUDl4?=
 =?utf-8?B?VWpyczVXTlg1bzAxZVE5VXU0a3h3bkZ0L1IrWDl0TEdVNmtrZitFYm5ETTFy?=
 =?utf-8?B?V0pLUXdvWU5TNGk5ckZkOUxLM29iR3p2UFE0Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(42112799006)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXlvR0NYM2ZoY1JYUFpMSU55N3NvMzFmVHFPVDVKTGs1N0Y1YVBYMUV2QWJv?=
 =?utf-8?B?dktEZFF0dDlpcUtGZ3hEbmxMSzV2V3o2K1hOVTNaZmxHbVZ3V21HYS9vQUNJ?=
 =?utf-8?B?cHFaNWxKREl0em5tQzYvaVIybEd4QU13SmlQcStMeWU1dlMwVnFzbzlhckJP?=
 =?utf-8?B?WFBZV043NEMrajhleGcxYkNUSEkzQWZVWmNFWEF6U2s4b2xXREMxdTJqSmox?=
 =?utf-8?B?enF0elU3TzRNM2dNenFGalpMLy8vVXE1a2tDSG9SeXQvQ3VTR1FiamxvNnlS?=
 =?utf-8?B?VldPM2hWOTJsMlVDTThSWDJqZS9CanFFM2lJdHRvOEJWdEpXWUNWS2xRWkhJ?=
 =?utf-8?B?dmpMaHBMTm9yenVscktJbVMyWSs5M0NaOXAyR3padTJVNkpkOUZFcGZsZUdP?=
 =?utf-8?B?bXFIN09Mb0xSTE1tdWhBZ2MyOHNqT2RPdkR5dlJuWWV2TnVUNlRNK0hxOFlj?=
 =?utf-8?B?ZjJxQXp1eHRWd1JpdzhRd2ZLWWkvNjJmNWRUYm5rWkh2RitOQVFUdDlRUXcw?=
 =?utf-8?B?U2h0VXZzT1BUWTFiY3lNbDRMRE9ocC9tWE00MlE3bElLK2IxNGpCa1Q4d01q?=
 =?utf-8?B?ZFhydUh3K0lobUJmN01OZkgxMmZPL1VLRFBSWVBXWTE2UThRNUNMM3lZQW8y?=
 =?utf-8?B?QXc4elpRMFc4NjhVZXRPNFR2STMyVmM0YkZjLy9BR05BWjJMNzFLSUxyTUow?=
 =?utf-8?B?MnlGQXlueEREdUxQeHNKd3FPaFpOVDFseW1aN0ZsWmh5QklsN3ZDOFMzRjRM?=
 =?utf-8?B?Wm9hTyt4L3Zic2JacUE0UURVeUtDc2hCSS9USGw4RHNEank5Vk82eHNNN2F2?=
 =?utf-8?B?MzduQ2dWOERReFJWTGE0bDBiVFMvK0JsWS9hTWg5RkpXaytndkx2NzNQYXFj?=
 =?utf-8?B?OTljZUtqZzIzT0ZyMjA3YnZUSURaNmdTSVBQOTU0ZHltZ21kNHNra1FxeVJj?=
 =?utf-8?B?WFJBVkt0R1RvTVUxRzYvTTJ1TTNaaXJFOEZURkxMeUlhY2R6a0E2eG1jbzNq?=
 =?utf-8?B?L3puYy9pR0lHK0FFQ09KeTF3a1hNS0xYV3hZektCQm9XWlBLemJvcStGM3Zx?=
 =?utf-8?B?NHNKRnpLNlVoWTUvR3VuZ1drRkNqWkc2dVJZTVJhbkU3OVRWa0hHaTJvQm45?=
 =?utf-8?B?b2V1SUt1V1JzODh2cm5qN2JZVDZNVE1DeGV6RmRLV3VIZ0EyaEdjWmR0SHFq?=
 =?utf-8?B?Z010S2RUVGk3NTh1azZEWU9QWU1DR1l3YVRqa3RkRm9BdGxQNXNieHBCTHAv?=
 =?utf-8?B?dEpDWUU2MWVKazlRc09vczVIekh5dThjb3d0b0ZSaElSREd3ZmlMSFBZR0pY?=
 =?utf-8?B?Tm1KTEd3QUxvckVFbklOME1LeHVUaTZJdnFwVVlYQVdieDFHa25hUmcxZi85?=
 =?utf-8?B?aEdBZ2ZrYzI5TXRZZGt5cGpJOUJ4czNLeDBKb2dBbnN0dXpYL1FGWmFmbTdu?=
 =?utf-8?B?MnNTNHJCMWlkektqNDVaUFVrNVA5ZGRaZFFXVDRtZXFUdDJ5UmUwQXliS0FB?=
 =?utf-8?B?MTdhWG9yVHhDWlJyeWppZEc0RS93Z2lGenlXalpLa3hkNjBGSDNnZVpGWlpU?=
 =?utf-8?B?THZmK2pGYmhnTUZkMUhtM29sMVJCQUVPTVc1RmgvMUxzK1M4Sy9VdkN0dDVz?=
 =?utf-8?B?aXN6R3h5TEtjRWZ2cmgrWkJaSENzUTViZmRFZnVwZE9tOVc2YXJENWF5eFRI?=
 =?utf-8?B?NVFTQXNRa0xORjRzcE5qQ3ZEMmNWSmpELy9rcTNncXVxZVdoUnBia0s0N2VB?=
 =?utf-8?B?amZDT0duam1VSkZwTnBxOEtlclFtZFMwdTRpT1hwSGlLYVJ0YkZvdzJISTc1?=
 =?utf-8?B?cWladU1IMTBlTkJVcnNtTEgzMkN0cHA1QWZaSlRqSWJBekVJeDMvMXk3QlJO?=
 =?utf-8?B?VUZCRzRzV0xOT3dFRm50VDhZbEN1MWlkNytSOTdSQ0Jka2hXd20rRVdpNWFD?=
 =?utf-8?B?cWZQVDZ6WGNMS3JieGh4WUZoNllmT2szUHF5akVUY01RMjZSYk1rSzVxZTFX?=
 =?utf-8?B?aDRrSWxDd0ZZbTdWNnNOU1JkeVNqcS9ycGxvQkE1VUp2ZXRrYWFaa1VObXk2?=
 =?utf-8?B?NURWdEc4QytiUk9aY3l0eW9rTGZxRTJUdWtRWU9pZ3ZaZjdBMG1PakZEY2Jy?=
 =?utf-8?Q?YcB8vXHqqhWuf2b/UnGVTFy+R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A549F6A6338B794A8C8F2244EE0FC62F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad016a3-7c70-4375-8513-08de3d52ea0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 09:59:05.6256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9JwuJUBwe0g/bnAZKKrgo76InXFpsTuanG0aOGDqNBQrlm+b+lNjFJ1QiSonlr1z5JztPLP7BacTIkbKqiaWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015921_207912_C0ED813E 
X-CRM114-Status: GOOD (  23.94  )
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA2OjM5ICswMDAwLCBMSUFOS1VOIFlBTkcgKOadqOi/nuWd
pCkgd3JvdGU6DQo+IE9uIFdlZCwgMjAyNS0xMS0yNiBhdCAwMzoxMSArMDAwMCwgQ0sgSHUgKOiD
oeS/iuWFiSkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI1LTExLTI0IGF0IDA5OjE0ICswMDAwLCBM
SUFOS1VOIFlBTkcgKOadqOi/nuWdpCkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjUtMTEtMTkg
YXQgMDk6MTggKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUs
IDIwMjUtMTEtMDQgYXQgMTY6NTUgKzA4MDAsIExpYW5rdW4gWWFuZyB3cm90ZToNCj4gPiA+ID4g
PiBCeSBhZGp1c3RpbmcgdGhlIG9yZGVyIG9mIGxpbmsgdHJhaW5pbmcgYW5kIHJlbG9jYXRpbmcg
aXQgdG8NCj4gPiA+ID4gPiBIUEQsDQo+ID4gPiA+ID4gbGluayB0cmFpbmluZyBjYW4gaWRlbnRp
ZnkgdGhlIHVzYWJpbGl0eSBvZiBlYWNoIGxhbmUgaW4gdGhlDQo+ID4gPiA+ID4gY3VycmVudCBs
aW5rLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEl0IGFsc28gc3VwcG9ydHMgaGFuZGxpbmcgc2ln
bmFsIGluc3RhYmlsaXR5IGFuZCB3ZWFrbmVzcyBkdWUNCj4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+
IGVudmlyb25tZW50YWwgaXNzdWVzLCBlbmFibGluZyB0aGUgYWNxdWlzaXRpb24gb2YgYSBzdGFi
bGUNCj4gPiA+ID4gPiBiYW5kd2lkdGgNCj4gPiA+ID4gPiBmb3IgdGhlIGN1cnJlbnQgbGluay4g
U3Vic2VxdWVudGx5LCBEUCB3b3JrIGNhbiBwcm9jZWVkIGJhc2VkDQo+ID4gPiA+ID4gb24NCj4g
PiA+ID4gPiB0aGUgYWN0dWFsIG1heGltdW0gYmFuZHdpZHRoLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IEl0IHNob3VsZCB0cmFpbmluZyBpbiB0aGUgaHBkIGV2ZW50IHRocmVhZC4NCj4gPiA+ID4g
PiBDaGVjayB0aGUgbW9kZSB3aXRoIGxhbmUgY291bnQgYW5kIGxpbmsgcmF0ZSBvZiB0cmFpbmlu
Zy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiB3ZSdyZSBlRFAgYW5kIGNhcGFiaWxpdGllcyB3
ZXJlIGFscmVhZHkgcGFyc2VkIHdlIGNhbiBza2lwDQo+ID4gPiA+ID4gcmVhZGluZyBhZ2FpbiBi
ZWNhdXNlIGVEUCBwYW5lbHMgYXJlbid0IGhvdHBsdWdnYWJsZSBoZW5jZSB0aGUNCj4gPiA+ID4g
PiBjYXBzIGFuZCB0cmFpbmluZyBpbmZvcm1hdGlvbiB3b24ndCBldmVyIGNoYW5nZSBpbiBhIGJv
b3QgbGlmZQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZXJlZm9yZSwgYnJpZGdlIHR5cGVjIGp1
ZGdtZW50IGlzIHJlcXVpcmVkIGZvciBlZHAgdHJhaW5pbmcNCj4gPiA+ID4gPiBpbg0KPiA+ID4g
PiA+IGF0b21pY19lbmFibGUgZnVuY3Rpb24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlIGBt
dGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb25gIGZ1bmN0aW9uIGZhaWxzIHRvIGFsaWduLg0KPiA+ID4g
PiA+IFdpdGhpbiB0aGUgYG10a19kcF9ocGRfZXZlbnRfdGhyZWFkYCwgaWYgRFAgaXMgZGlzY29u
bmVjdGVkLA0KPiA+ID4gPiA+IHRoZSBgbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uYCBmdW5jdGlv
biB3aWxsIHdyaXRlIGZyb20gYGF1eGANCj4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+IGBEUFJYYCwN
Cj4gPiA+ID4gPiBjYXVzaW5nIGEgZmFpbHVyZSBhbmQgdGh1cyBwcmV2ZW50aW5nIHN5bW1ldHJ5
Lg0KPiA+ID4gPiANCj4gPiA+ID4gSSdtIGN1cmlvdXMgYWJvdXQgYW5vdGhlciBjYXNlLg0KPiA+
ID4gPiBJbiB5b3VyIGRlc2NyaXB0aW9uLCB3aGVuIERQIHBsdWcgb3V0IGFuZCBwbHVnIGluLCBE
Uk0gY29yZSB3b3VsZA0KPiA+ID4gPiBub3QNCj4gPiA+ID4gY2FsbCBtdGtfZHBfYnJpZGdlX2F0
b21pY19lbmFibGUoKSwgcmlnaHQ/DQo+ID4gPiA+IElmIHNvLCB3aGVuIEkgcGx1ZyBvdXQgRFAs
IGFuZCBwbHVnIGluIGFub3RoZXIgRFAgcGFuZWwgd2hpY2gNCj4gPiA+ID4gc3VwcG9ydA0KPiA+
ID4gPiBzbWFsbGVyIHJlc29sdXRpb24sDQo+ID4gPiA+IHRoZW4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZW5hYmxlKCkgaXMgbm90IGNhbGxlZCBhbmQgYmVsb3cgY2FsbA0KPiA+ID4gPiBzZXF1ZW5j
ZSB3b3VsZCBub3QgaGFwcGVuOg0KPiA+ID4gPiANCj4gPiA+ID4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZW5hYmxlKCkgLT4gbXRrX2RwX3ZpZGVvX2VuYWJsZSgpIC0+DQo+ID4gPiA+IG10a19kcF9z
ZXRfdHhfb3V0KCkgLT4gbXRrX2RwX3NldHVwX3R1KCkNCj4gPiA+ID4gDQo+ID4gPiA+IEluIG10
a19kcF9zZXR1cF90dSwgaXQgd291bGQgc2V0IHNyYW1fcmVhZF9zdGFydCBhY2NvcmRpbmcgdG8N
Cj4gPiA+ID4gbGFuZV9jb3VudC4NCj4gPiA+ID4gQnV0IHRoZSBjYWxsIHNlcXVlbmNlIHdvdWxk
IG5vdCBoYXBwZW4gd2hlbiBuZXcgcGx1ZyBpbiwgdGhlDQo+ID4gPiA+IHNyYW1fcmVhZF9zdGFy
dCB3b3VsZCBiZSBvbGQgdmFsdWUgd2hpY2ggbWF5IGluY29ycmVjdC4NCj4gPiA+ID4gSWYgdGhp
bmsgdGhhdCB3aGVuIHBsdWcgaW4gYW5kIHBsdWcgb3V0LCBpdCBzaG91bGQgZGlzYWJsZSBEUCBh
bmQNCj4gPiA+ID4gdGhlbiBlbmFibGUgRFAgYWdhaW4uDQo+ID4gPiA+IElmIERSTSBjb3JlIGRv
ZXMgbm90IGRvIHRoaXMsIEkgdGhpbmsgd2Ugc2hvdWxkIG1vZGlmeSBEUk0gY29yZQ0KPiA+ID4g
PiBvcg0KPiA+ID4gPiB5b3Ugc2hvdWxkIHJlY29uZmlnIHRoZSB3aG9sZSBEUCB3aGVuIHBsdWcg
aW4sIG5vdCBvbmx5IHRyYWluaW5nLg0KPiA+ID4gPiANCj4gPiA+ID4gUmVnYXJkcywNCj4gPiA+
ID4gQ0sNCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEhpIENLDQo+ID4gPiANCj4gPiA+IFdoZW4g
RFAgcGx1ZyBvdXQsIERSTSBjb3JlIHdpbGwgY2FsbA0KPiA+ID4gbXRrX2RwX2JyaWRnZV9hdG9t
aWNfZGlzYWJsZSgpLg0KPiA+ID4gV2hlbiBEUCBwbHVnIGluLCBEUk0gY29yZSB3aWxsIGNhbGwg
bXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCkuDQo+ID4gDQo+ID4gDQo+ID4gV2hlbiBEUCBw
bHVnIGluLCBEUk0gY29yZSB3aWxsIGNhbGwgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCks
DQo+ID4gYW5kIG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZSB3b3VsZCBjYWxsIG10a19kcF90
cmFpbmluZygpLg0KPiA+IFNvIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBjYWxsIG10a19kcF90cmFp
bmluZygpIGluDQo+ID4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoKS4NCj4gPiANCj4gPiBSZWdh
cmRzLA0KPiA+IENLDQo+ID4gDQo+IA0KPiBIaSBDSy4NCj4gDQo+IFRoaXMgc2hvd3MgdGhlIGN1
cnJlbnQgdGltaW5ncyBhZnRlciB0aGUgRFAgY2FibGUgaXMgcGx1Z2dlZCBpbiwNCj4gYXMgd2Vs
bCBhcyB0aGUgbW9kaWZpZWQgdGltaW5ncy4NCj4gDQo+IGN1cnJlbnQgdGltaW5nczoJCUZpeCB0
aW1pbmdzOg0KPiANCj4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoKQltdGtfZHBfaHBkX2V2ZW50
X3RocmVhZCgpDQo+IAkJCQkoaW5jbHVkaW5nIERQIGxpbmsgdHJhaW5pbmcpIA0KPiAJfAkJCQl8
DQo+ICAgICAgICAuLi4JCQkgICAgICAgLi4uDQo+IG10a19kcF9icmlkZ2VfbW9kZV92YWxpZCgp
CW10a19kcF9icmlkZ2VfbW9kZV92YWxpZCgpDQo+IAl8DQo+ICAgICAgICAuLi4JCQkgICAgICAg
Li4uDQo+IG10a19kcF9icmlkZ2VfYXRvbWljX2NoZWNrKCkJbXRrX2RwX2JyaWRnZV9hdG9taWNf
Y2hlY2soKQ0KPiAJfA0KPiAgICAgICAgLi4uCQkJICAgICAgIC4uLg0KPiBtdGtfZHBfYnJpZGdl
X2F0b21pY19lbmFibGUoKQltdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKQ0KPiAoaW5jbHVk
aW5nIERQIGxpbmsgdHJhaW5pbmcpDQo+IA0KPiANCj4gUFM6DQo+IDEuICIuLi4iIHJlcHJlc2Vu
dHMgb21taXRlZCBzdGVwczsNCj4gDQo+IDIuIGBtdGtfZHBfYnJpZGdlX21vZGVfdmFsaWQoKWAg
Y2FsY3VsYXRlcyB0aGUgYmFuZHdpZHRoIHVzaW5nIHRoZQ0KPiBjdXJyZW50IGxhbmUgY291bnQg
YW5kIGxpbmsgcmF0ZSwgYW5kIHRoZW4gZmlsdGVycyBlYWNoIG1vZGUgdG8NCj4gZGV0ZXJtaW5l
IGlmIGl0IHN1cHBvcnRzIHJldHVybmluZyBhIHN0YXR1cy4NCj4gDQo+IDMuIEluIHRoZSBgZHJt
X2Rpc3BsYXlfbW9kZV90b192aWRlb21vZGUoJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGUsDQo+
ICZtdGtfZHAtPmluZm8udm0pO2AgZnVuY3Rpb24sIHdpdGhpbiB0aGUgYG10a19kcF9icmlkZ2Vf
YXRvbWljX2NoZWNrKClgDQo+IGZ1bmN0aW9uLCBgYWRqdXN0ZWRfbW9kZWAgc2V0cyB0aGUgY3Vy
cmVudGx5IHNlbGVjdGVkIGRpc3BsYXkgbW9kZSBmb3INCj4gdGhlIERSTS4NCj4gDQo+IDQuIERQ
IGxpbmsgdHJhaW5pbmcgdGVzdHMgdGhlIHNpZ25hbCBjb25kaXRpb25zIG9mIHRoZSBsaW5rIGJl
dHdlZW4NCj4gRFBUWCBhbmQgRFBSWCwgYW5kIHNlbGVjdHMgdGhlIGxhbmUgY291bnQgYW5kIGxp
bmsgcmF0ZSB0aGF0IG1lZXQNCj4gdGhlIHNpZ25hbCBjb25kaXRpb25zLg0KPiANCj4gNS4gRm9y
IGV4YW1wbGUsIHRoZSBwbGF0Zm9ybSBzdXBwb3J0IERQIDRsYW5lIDUuNEcsDQo+IGJ1dCBwYW5l
bCBBIHN1cHBvcnQgRFAgMmxhbmUgNS40Ry4NCj4gDQo+ICAgIFRoaXMgaXMgYSB0aW1lIHNlcXVl
bmNlOg0KPiANCj4gICAgYSkuUGx1ZyBpbiBwYW5lbCBBLiBBY2NvcmRpbmcgdG8gdGhlIHBsYXRm
b3JtLCBpdCBjYW4gb3V0cHV0IDRLDQo+ICAgIDYwSHouDQo+ICAgIGIpLiBUaW1pbmcgbW9kZSBz
ZXQgNEsgNjBIeihJbmNsdWRpbmcgaW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfY2hlY2sNCj4gICAg
ZnVuY3Rpb24pLg0KPiAgICBjKS4gQXRvbWljIGVuYWJsZShCYXNlZCBvbiBwYW5lbCBBIGFiaWxp
dHksIHRyYWluaW5nIHBhc3MgMmxhbmUNCj4gICAgNS40RykuDQo+ICAgIGQpLiBGaW5hbGx5LCBk
dWUgdG8gMmxhbmUgNS40RyBiYW5kd2lkdGggbGltaXRhdGlvbiwgdGhlIHBsYXRmb3JtDQo+ICAg
IGNhbm5vdCBvdXRwdXQgNEsgNjBIeiwgcmVzdWx0aW5nIGluIGEgYmxhY2sgc3JlZW4uDQo+IA0K
PiAgICBJZiBhcHBseSB0aGlzIHBhdGNoLg0KPiANCj4gICAgYSkuIFBsdWcgaW4gcGFuZWwgQS4N
Cj4gICAgYikuIFRyYWluaW5nIHBhc3MgMmxhbmUgNS40Rw0KPiAgICBjKS4gVGltaW5nIG1vZGUg
c2V0IDJLIDYwSHooQmFzZWQgb24gdGhlIDJsYW5lIDUuNEcgYmFuZHdpZHRoIGxpbWl0DQo+ICAg
IGFuZCBpbmNsdWRpbmcgaW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfY2hlY2sgZnVuY3Rpb24pLg0K
PiAgICBkKS4gQXRvbWljIGVuYWJsZSBmb3Igb3V0cHV0IHNjcmVlbi4NCg0KVGhlIG9yaWdpbmFs
IGNvbW1pdCBtZXNzYWdlIGRvZXMgbm90IHNob3cgV0hZIG5lZWQgdG8gdHJhaW5pbmcgaW4gaG90
cGx1ZyB0aHJlYWQuDQpUaGlzIGV4cGxhaW4gc2hvd3MgV0hZIG5lZWQgdG8gdHJhaW5pbmcgaW4g
aG90cGx1ZyB0aHJlYWQuDQpTbyByZXBsYWNlIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIHRoaXMg
ZXhwbGFpbi4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IEJlc3QgUmVnYXJkcw0KPiBMaWFua3Vu
Lg0KPiANCj4gPiA+IA0KPiA+ID4gSWYgRFAgcGx1ZyBpbiwgc3JhbV9yZWFkX3N0YXJ0IHdpbGwg
YmUgcmVjYWxjdWxhdGUgYmFzZWQgb24gdGhlDQo+ID4gPiBsYW5lDQo+ID4gPiBjb3VudC4NCj4g
PiA+IA0KPiA+ID4gUmVnYXJkcw0KPiA+ID4gTGlhbmt1bi4NCj4gPiA+IA0KPiA+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFua3VuIFlhbmcgPGxpYW5rdW4u
eWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyB8IDIwICsrKysrKysrKysrKysr
KysrKysrDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHAuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+
ID4gPiA+ID4gaW5kZXggYmVmNmVlYjMwZDNlLi4wYmEyYzIwODgxMWMgMTAwNjQ0DQo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gPiA+ID4gQEAgLTE5NzYs
NiArMTk3Niw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdA0KPiA+ID4gPiA+IG10a19kcF9ocGRfZXZl
bnRfdGhyZWFkKGludCBocGQsIHZvaWQgKmRldikNCj4gPiA+ID4gPiAgCXN0cnVjdCBtdGtfZHAg
Km10a19kcCA9IGRldjsNCj4gPiA+ID4gPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gPiA+
ID4gIAl1MzIgc3RhdHVzOw0KPiA+ID4gPiA+ICsJaW50IHJldDsNCj4gPiA+ID4gPiAgDQo+ID4g
PiA+ID4gIAlpZiAobXRrX2RwLT5uZWVkX2RlYm91bmNlICYmIG10a19kcC0NCj4gPiA+ID4gPiA+
IHRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgCQlt
c2xlZXAoMTAwKTsNCj4gPiA+ID4gPiBAQCAtMTk5NCw5ICsxOTk1LDI4IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdA0KPiA+ID4gPiA+IG10a19kcF9ocGRfZXZlbnRfdGhyZWFkKGludCBocGQsIHZvaWQg
KmRldikNCj4gPiA+ID4gPiAgCQkJbWVtc2V0KCZtdGtfZHAtPmluZm8uYXVkaW9fY3VyX2NmZywg
MCwNCj4gPiA+ID4gPiAgCQkJICAgICAgIHNpemVvZihtdGtfZHAtDQo+ID4gPiA+ID4gPiBpbmZv
LmF1ZGlvX2N1cl9jZmcpKTsNCj4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gKwkJCW10a19kcC0+ZW5h
YmxlZCA9IGZhbHNlOw0KPiA+ID4gPiA+ICsJCQkvKiBwb3dlciBvZmYgYXV4ICovDQo+ID4gPiA+
ID4gKwkJCW10a19kcF91cGRhdGVfYml0cyhtdGtfZHAsDQo+ID4gPiA+ID4gTVRLX0RQX1RPUF9Q
V1JfU1RBVEUsDQo+ID4gPiA+ID4gKwkJCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRHQVANCj4gPiA+
ID4gPiBfVFBMTCwNCj4gPiA+ID4gPiArCQkJCQkgICBEUF9QV1JfU1RBVEVfTUFTSyk7DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICAJCQltdGtfZHAtPm5lZWRfZGVib3VuY2UgPSBmYWxzZTsNCj4g
PiA+ID4gPiAgCQkJbW9kX3RpbWVyKCZtdGtfZHAtPmRlYm91bmNlX3RpbWVyLA0KPiA+ID4gPiA+
ICAJCQkJICBqaWZmaWVzICsNCj4gPiA+ID4gPiBtc2Vjc190b19qaWZmaWVzKDEwMCkgLSAxKTsN
Cj4gPiA+ID4gPiArCQl9IGVsc2Ugew0KPiA+ID4gPiA+ICsJCQltdGtfZHBfYXV4X3BhbmVsX3Bv
d2Vyb24obXRrX2RwLCB0cnVlKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkJCXJldCA9DQo+
ID4gPiA+ID4gbXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcyhtdGtfZHApOw0KPiA+ID4gPiA+ICsJ
CQlpZiAocmV0KQ0KPiA+ID4gPiA+ICsJCQkJZHJtX2VycihtdGtfZHAtPmRybV9kZXYsICJDYW4n
dA0KPiA+ID4gPiA+IHBhcnNlDQo+ID4gPiA+ID4gY2FwYWJpbGl0aWVzXG4iKTsNCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKwkJCS8qIFRyYWluaW5nICovDQo+ID4gPiA+ID4gKwkJCXJldCA9IG10
a19kcF90cmFpbmluZyhtdGtfZHApOw0KPiA+ID4gPiA+ICsJCQlpZiAocmV0KQ0KPiA+ID4gPiA+
ICsJCQkJZHJtX2VycihtdGtfZHAtPmRybV9kZXYsDQo+ID4gPiA+ID4gIlRyYWluaW5nDQo+ID4g
PiA+ID4gZmFpbGVkLCAlZFxuIiwgcmV0KTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkJCW10
a19kcC0+ZW5hYmxlZCA9IHRydWU7DQo+ID4gPiA+ID4gIAkJfQ0KPiA+ID4gPiA+ICAJfQ0KPiA+
ID4gPiA+ICANCj4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+IA0KPiA+IA0KDQo=


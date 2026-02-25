Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A2F55437
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=; b=JOM8Zi9qCThQVlMxr1El8LoteT
	seyVGGU2XecIOwq8cvCi2n7MyugyY6XBNdizrrVIYvY1M2yysIQLc6MRixqKqbWiY+kBLAwq+9bOS
	282O108l2EtepusdhyyeKe03LqE8K29DvsNye7V+m9P4/yuL1VcekC4cRKrxevZtQ2PE1lwIJ/MWP
	NNPCwie/4srA8nuw8ofF5+0Mfw9PtAnNO8iVoaSsJEwNNR/PIXCxfkHEA5oubPPu885qztNzYEUuS
	byvGXsf9uSW9BKaw9jtOKx/7EGVtGLDYQrBifcs/madlnI0eGE0QglOfrYO4IgGgF1druEpBFmFSr
	jFWAXhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4Jq-000000034US-2Olr;
	Wed, 25 Feb 2026 02:08:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4Jn-000000034Ty-2s0J;
	Wed, 25 Feb 2026 02:08:04 +0000
X-UUID: cdd16a7611ee11f1ad39f32c34db0b1c-20260224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=;
	b=CqpLTxOt5uyQVHMJQLGoOnmUP1D6wdwQRNJird7HNnTSLb0O2p1LsW+2RAKbmT0Co6OLbbWcTw45AUz3JTgBaYDHOn1ZBDusAULysdBh8H5hXhlCIQOd6fS26DtLoXaUstMHLYYYH3lB0fd5rxv66k3dPujk2om0NJtNtDomsJ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:472eb418-4c8a-4e3e-b3eb-bf8e255476f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:241d935b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cdd16a7611ee11f1ad39f32c34db0b1c-20260224
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 948846959; Tue, 24 Feb 2026 19:07:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:07:55 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:07:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xADgvXJylbZC7YVUJQYr2C8ru/UAJ1u4M3o54h2NKwQdWzK29cs10GxWT6qKV79S2Ks9xvbHku6UcsyYmwgVNMvdtgibARzoGM5GZ5OPKmCOb+SckWF1AvtjbuzAj/wC4QX2GJgTgUTlxYEF7+HxTvSNyifmCo3Xo4LMtPgeX0SWIDQyg1IA30Gc2bi5VivX9YT1H+D8twbrjy0OFLcZATutKHF4b7kMvSMmXQ3gwSNNdrXGi8oyGkHB/51Hmd3kYijMx1jnjZng5PxfcIb0z3sbhWKAqy3kDkZyH1HHW7FMYDvOhW9O4Q1dgQShjwSV7UiSINJmF7QiN+I47rXs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=;
 b=CJhHSrZ75XXkw6HcsmoWYkPCXjOpUsggIEA5DCIoxG7tFA2ilaao94Vz1EdFUfcEkIdQi5SN1zCLskwRmkBVlQKCp2SRxCtHdezRI44oSvj1NUfwlyxOhYqogsgG318IB56ZFHJ9jBWd7iPQ22FIbXvvxZpxTWtAVrkuUgH6LbuIem7qW5jHM8JwjrECnMcdEe8l1yGexw+6r8rZ6tfxjr4Bq5KqPnZjeeKHJSfHsj+0nrqrK5lgmyCLnDtTMBhTtjsSN5MS+zdDkCg3ReI9mFJrCqhGkSnCvwWrTrE7hlfTLLvXLSAQisStfIeAgzyhbQN9/aYSjmSpdLL1pAI5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=;
 b=Pno6iparmwyanPf7s9SgmmeqA+XY+E5rUywMcX8hFiLmGugRD5OLBDWMZLulpQqpz6UQawcI+LFA+MgshR822oHAYcB5IjExnjbzvJFGs+twKTJASisnk73Gmpy3q0f90IixGzsRETWxQJn5BixfhYhTYllxKQ/vjvay0xUq3kI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7449.apcprd03.prod.outlook.com (2603:1096:400:415::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:07:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:07:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Topic: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Index: AQHcpM8cFDTxnhuf40+7MXqsusTnQbWSrXiA
Date: Wed, 25 Feb 2026 02:07:52 +0000
Message-ID: <5fe2bc547550c3451108e3e326d55c71ad9b267e.camel@mediatek.com>
References: <20260223141638.2022490-1-l.scorcia@gmail.com>
In-Reply-To: <20260223141638.2022490-1-l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7449:EE_
x-ms-office365-filtering-correlation-id: 33c446e3-f6ba-4eda-399b-08de7412aebc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VzNhVTV6Y1dBNkpvdWtTWFlUTXczaTNSMGt2UTRNRHFRUkFTd3RQQmhNTjg4?=
 =?utf-8?B?TERuKzMxMFhiMGZDa2xOYUZCT0djczBSYjE1ODFCVnFGZEpBQ3VhUEMvV3pi?=
 =?utf-8?B?VWZTaENxSVJlbDM3a2Zub05ZMWpubS9TdkhwOFZhQ0owckZsNmpkR0c2VlhT?=
 =?utf-8?B?c0dZNW9VdGE4S3JnRHZRcEx3ZUtWbHV0cHlpTTFtNEJVNmZOOUJtT093V0c3?=
 =?utf-8?B?d25BUkFaRmszelVpVi9uclJBT3RVTkZKWjZuSjgrdWlsdFp6Q1pzTVhNNXNE?=
 =?utf-8?B?K2EzdUdObVQ1R0pHUWNGL0Y5UUc2VVBkcUVyelBiV2JUOGVQSlNyWEE1MHVT?=
 =?utf-8?B?blZiRmM5NmlHcEhiWDNMUCtJQlIxQTdSS2xTSm5ZTCtmaWprV25kU2x3N0h4?=
 =?utf-8?B?VjNxQ00vZzQwU1paVDVHN0EwUTFoSFEyaTRxUXAxN1d1YjgyVHM4QUpVRDA3?=
 =?utf-8?B?YU10WXZsMi9DUzJGZEZ2MklRNXBpcktnb1ZIR1lIb3V1RGx3Y2gwcWp0d2Ez?=
 =?utf-8?B?OVNCdUNOdmw4WGNYZ1N0QUxpWjQwL1g3bXc0Q2l5THEwS3R5UmhzRW1xSVp4?=
 =?utf-8?B?dDBxZldzWElJQVZDNktNTFdxeGM1UFBqaVZsQ09Lb01BSWFLVXNFQ2dJUHdk?=
 =?utf-8?B?VlYzREdZcVlPR0pMYW5ZNW1WUnZ3Rk9YVThnd0g4OXBtTXRQM1g5SldVTkNQ?=
 =?utf-8?B?N1JEVUlUK1VITWx6YUlGc0RXbGVtY2JZc3NpK0U0N2k4Y20yeFpCVkZONkpW?=
 =?utf-8?B?WnN2SXJtTjZnazNGZlExb21mR1hkYVBDZnBjelR2aWl2L0xyOUlSRGNRc2hx?=
 =?utf-8?B?YkFndHBhYURldS9OcjU1blcrbHNsTWcwS21FT1orYVhoRUVJbmRzQ1V2cEI0?=
 =?utf-8?B?emQyL0pPdE9OSVpadHNkaDViYmNHUWVRa3hpUngwT0taM3ZpNFltaThldUNB?=
 =?utf-8?B?WXRvYi9yc2pRcHUrbzUwTCt6KytxaE9YN1A2bVIrZjhYeFpXMmx5RlhpVmdP?=
 =?utf-8?B?dVVUTHJMcXoycE4wR29HVXp5OVNpOTZEYkg4eWt1d2R5Ylk2OHVzVFdBeElv?=
 =?utf-8?B?L24xUHUxaTFRYStvSjhUc2RLTmppMm5XYXJURFgyQ2tyaWl3T0dDMWNWWEZh?=
 =?utf-8?B?RkNjK3Bab3BibFB1VTh0REVZRHozRzU0ak9iRlFpaUxDc0UyS0RwckR4Lzhv?=
 =?utf-8?B?bzVvRndzaVpheDExNDhuOUs0Y3B6bkFhaE8vWmZrVEt5K08yYTlPTFdWUDdn?=
 =?utf-8?B?Mm4ySEJGM1BvTmxTOWFtS0dPUi92bDdjOVdBcjJsWGN6OXAzS0x2SmkvZzM0?=
 =?utf-8?B?OU9qdElGb2gxUEtCdis0Y3BNTitGRVVRNGxES3RaV1NjUG5BVGk5bFhYN2JL?=
 =?utf-8?B?WWU2ai9NQ3d1bFVEcEpIalJWaElNRWJqNnVoK0l0Q203aHhqbXVQc0NsL1dS?=
 =?utf-8?B?WklKeU9MZ3VYU3JkcDlkTDR2T09TUWdpUWRrdkRUWnhtYUVJRDlKT2lqL2dr?=
 =?utf-8?B?WFkvWXYvaVRsOU5URjBTZFNSeU1wcnVUNDQ4YnduM0kzSVdzUHVYSjB1VDY0?=
 =?utf-8?B?TXhRcDJDL3hxNURNTmpKU2hNUVlOMEMxaDZhWDVWYnJPQjg1d2laRnhCT25q?=
 =?utf-8?B?NlJsK2RHRzBhWmptalVmZzViRTNkRE1DaWZEOVZTSkNJV3FndjJlMVl2eGQ1?=
 =?utf-8?B?a1AzUytwcmFwVnRGYnhCeEFlcjNON1V1cDRPT3RMeEgzTTJiaWI2SnJLUjQr?=
 =?utf-8?B?TXZuRWdZZXN1VjRCTldUcHh5alVUcldnbXdnUFo3MjlYTFpOT01kRXQ3NHBN?=
 =?utf-8?B?eldKZU56R2V3cmVWdkV3dFNXVjN6bkZ0U0YrNS9NdG92YkoyRzRsS1Z1TjNT?=
 =?utf-8?B?WXBhM3FQQm9nQ1dCTFNlV0l1VjRyb2hKRTVTMXArUE0xbTg5eHBsN0VpaHdQ?=
 =?utf-8?B?Q2tXZUpJN2hBbUhUUkhiVXBBaFUwV1JsUVgvdXBBTEROcHQraGR5OW1ZYkNi?=
 =?utf-8?B?NWZtcmtHWFQyMDh2NjhRaG9oVUZMNXhaV3dEOXl1Y2o4RkMwT3o5QjB2Qytp?=
 =?utf-8?B?UllxbDBOa1orSDJ6TWpiQjVpdHNvWmtQMVV6MWRCMVlBTWQvTTl0NHJKeDBo?=
 =?utf-8?B?NTd4c2Vrbnd3eUVxWUVpa2w0SmtSMDg4L0R3ZnZkWmN5QWNtQm5MTnlkR1Vv?=
 =?utf-8?Q?z0DqDvMOD8kfKMFrOivNq0w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVplRjVtbUk2SnY3NzhaWWpMQlAyaHVPb0ZFZVRjekZLeFBrNDNwUVA1djRj?=
 =?utf-8?B?MmJzM1JoeTJxOFU0YUFNUGxEZ0N4bDdtV2drK25yOHVVTkF1NmQzajNFOEVl?=
 =?utf-8?B?RmsyNFluRVdyS0xteW9uS3RkV3B5MldUTzJZY2c0VjVhcU5yZEdwNFRjS0J0?=
 =?utf-8?B?bExPWTc2ZVNJY0tnL1dXU05pOWl3dWVGU1JiNkROb1VWVGFSakE0TFBKaVVy?=
 =?utf-8?B?U1F5ZTltUFpDRmMzVGZvWEoxZTFhci9xeGx3OWprNDRnTi9lRG9aQkRmblRU?=
 =?utf-8?B?SXRmTnRWZ20wSy9BTUNUTDF6MjBUeFNDd0dTMjlOdHdUcVFESVNveDZmc29l?=
 =?utf-8?B?TEthaFZUZzFGNWN5Vk04dEVlTFJyWEl2eDR4TzBKakM5SUh3amxFMGVmY1d6?=
 =?utf-8?B?UGlNQ3AwSkI3NFJEc3NGVWZiVm1qbnpYUjhQR2M3ZVlLSG5zaUtFc2tGSFZa?=
 =?utf-8?B?eHlubjRIaFJ4R2haSEVSNitLQ0lrWFlqaTQvM0k5OVB4ZlNCbFFmOVpWNnhB?=
 =?utf-8?B?VEpyQTRrMXdIWEpoS29GL2J6RlFsMjRyVlNQUERjemFzMkJSN2N1UUtCaTdx?=
 =?utf-8?B?dTAzaFRRUlhIU3hva1ZZOFhYM2UycGVFRklyMUR6TUFZcE50OWY4RVc3WW15?=
 =?utf-8?B?V2F4TkJKclprcGdkTzJpalh3ZEtmNWRyb21xQytaMlFQK0xHaFZMQnVLUStK?=
 =?utf-8?B?d3FWa1daQjllR2xiKzU5WlZrVzFnalNUbXFpaUdzczliMG4yS3hEL1hRUmFl?=
 =?utf-8?B?K3V3VGpRc1VaUTFTZytWazIvNVRjM1ppRm9ES01KNHdlYTlMa3U1eFlESURn?=
 =?utf-8?B?WFJFTlFQaU5xYkhaRzVSanJnaGw2VzN0bXlLekpDWHNGRHhZWmxTZjZ6SkJz?=
 =?utf-8?B?Mk5vZWJsRXpFSjJibVlIcXBSb0xrS3Z2R21TRmNYdjV5MGkyc09HeW02ZGY2?=
 =?utf-8?B?TmhucFFzald4SlZ3NVpROFE3M0hKbm5POGpxeXp1a2FtSHduckJsTWFRNmZK?=
 =?utf-8?B?emhkdTZXRDU2RkJURlRLMFI0d2NMOGNNZzJoZEsyK2l6QXVmL3hzaDF3bkZn?=
 =?utf-8?B?MEVSY2RyRm1tN0t0UWtTMXdlV3hXdW5DK1VQaVgyYXViZnhmSytDMlRWV3R6?=
 =?utf-8?B?dFJMeW1PMFRpNU1xdk1ZWCtRTHlRM0NSNk1JdjFTSWY5MWl0dXNwVjJXOWVt?=
 =?utf-8?B?bVR5QllQWGxqYWxEbzhqVjRtRmNFM0ZheWg5WlNoWHNURHpEZkl0WkQ0QVNC?=
 =?utf-8?B?MU5oaThhRXZjeGtDcjhTOVAwNlRuSlVET2NyRzh5WHc5Um5BN0lod3R0UWl0?=
 =?utf-8?B?dGI5V0k5TTU4NFBZK1BpSDNiMzloWDlvdHljL2pWaXM4eUZzQTlqYXZTRGZM?=
 =?utf-8?B?VTM4elZpVGlJU1RTRnByVmYwNHFmbVBYeFJFTzRCMlFaOTdrSVQ0aVBjZWJy?=
 =?utf-8?B?eFVHZkNnUWF2S1g3ZXZaQXJWRDJGaWpVeGZ4ZWx4ZnJxbXZUZlVIajJ4ZFk1?=
 =?utf-8?B?RTJRZEw4S3BJVjNvdFJtMWpoaXpHbmwzdjBvN2NocERtMUJFdUNjMlBjczYr?=
 =?utf-8?B?NWdpb0tDMjAxSUdITlhXNy9EbEhDNkp2Lzdsb0IycnlrKzhJR1ZybmVBd2wz?=
 =?utf-8?B?UzRBT0dGejlHM1JMTU10YlBPZS9TTHBXS2g0aTFKamRNU3ZuSWNGc3FJYWNO?=
 =?utf-8?B?a3NuUDBteWdJODhvYXhteTF0Y0tFcjVJWUh1ZWRGNUVUTFg0S2QxcE90Z2cz?=
 =?utf-8?B?UmtPcmpUMWxHN2ViSU8yb3hsNW05UnRNRFB1cFFCUVRWejhDZlVWU1pzcEdh?=
 =?utf-8?B?cEVpbFhIQk5zOERxUFM3Zm1HSGg3dW5ncmtDekpaanYwbUtEb3cvM3ozRHY0?=
 =?utf-8?B?VzJScndaUUFjNzRwRmZmbFMzakVNVk03N1VkTTQxZVZWdkVQejZTU0hmQi9S?=
 =?utf-8?B?aTlpa3pxcW5wVkxvYmwzRTFkQkFrcGtUa0ovZ2tOYkt3bUhIeVNmaG4yU01S?=
 =?utf-8?B?c3VUbXdDVDR0U1dJSGxvcGFZK3ZlRjRVK0VwY29kZm96TUFlV2QxZGRIbHc2?=
 =?utf-8?B?bWJWYTRoTGFubTl5YU50cnZQazJ4bm9UWVFIUFpFbm1scURWYlM5ZHNoeFQv?=
 =?utf-8?B?Mmp2dU5WVXNHK2x5UCs0ZFFzNnVYeGZxUTFSbjVvUXhZTmI1aTZaenpNNkN3?=
 =?utf-8?B?eW5OakhhOURNbm5MVFJ6OWZSUklNZm1jNkx5RWtPS3gwVFZRWnJXeWRhMnIy?=
 =?utf-8?B?L1RpNWxJZm45YTMvZ2pueTVYcWdrOE1Qd0hickVRVHFjeDhBUWU4VkU4QVg0?=
 =?utf-8?B?SmtidDBCTHlLaXJHMU8zM2JnT1BIcWc4cFVSd29qOGVkRGJkUXFpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51A449136351DB4AB5F1BD0CA8A31933@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E+zuXsLkG3YQKqxcDbYViziPqwqXTMCoEPTqOkPxBJyHn7qcNSCbYiy8diLD+X4RTMyxnt/Psve2vFPEqYeMD2I6TxnVHhzJyDTNk+nJwM/JXd3zuPjB+xojDbBQVNzn2cinqsmTt24OHod2HhGB2X+dHcEoAzKhBY+B4xsnIONP8eTU8xabBvgZj2FXjAo8qsGLbRFN1Bkqq8QdPuBl4/FASEhl1wACYiBJWjqeNmRuT7V3brf754IpZMPj9wNgOp3L18PR3gV8bD8CpPMvPg4Adp+xnTbeY/tulRP9eVbNwAHmTJArBIXvrR+0WLdn+dnvxHQBRti4Fm8jpBBOWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c446e3-f6ba-4eda-399b-08de7412aebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:07:52.2444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+o36KMnwpRLSrucBQR8FLjwlwZNGpNwXmwFnHEprA8NSE4izhPd3slVbZakgvi5IXgS7feTyw6MrcSbbYR1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7449
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180803_745930_6E1701F0 
X-CRM114-Status: GOOD (  20.09  )
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

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE0OjE2ICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gVGhlIGNhbGwgdG8gbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0
cmlnZ2VycyBhIGNhbGxiYWNrIHRvIG10a19kc2lfYmluZCwNCj4gd2hpY2ggdXNlcyBkZXZfZ2V0
X2RydmRhdGEgdG8gcmV0cmlldmUgdGhlIG10a19kc2kgc3RydWN0LCBzbyB0aGlzDQo+IHN0cnVj
dHVyZSBuZWVkcyB0byBiZSBzdG9yZWQgaW5zaWRlIHRoZSBkcml2ZXIgZGF0YSBiZWZvcmUgaW52
b2tpbmcgaXQuDQo+IA0KPiBBcyBkcnZkYXRhIGlzIGN1cnJlbnRseSB1bmluaXRpYWxpemVkIGl0
IGxlYWRzIHRvIGEgY3Jhc2ggd2hlbg0KPiByZWdpc3RlcmluZyB0aGUgRFNJIERSTSBlbmNvZGVy
IHJpZ2h0IGFmdGVyIGFjcXVpcmluZw0KPiB0aGUgbW9kZV9jb25maWcuaWRyX211dGV4LCBibG9j
a2luZyBhbGwgc3Vic2VxdWVudCBEUk0gb3BlcmF0aW9ucy4NCj4gDQoNCltzbmlwXQ0KDQo+IA0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDQgKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCBkNzcyNjA5MTgxOWMuLmFmNDg3MWRlOWU0YyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IEBAIC0xMjMyLDYgKzEyMzIs
OCBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gDQo+ICAgICAgICAgZHNpLT5ob3N0Lm9wcyA9ICZtdGtfZHNpX29wczsNCj4gICAgICAg
ICBkc2ktPmhvc3QuZGV2ID0gZGV2Ow0KPiArICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGRzaSk7DQo+ICsNCj4gICAgICAgICByZXQgPSBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyKCZk
c2ktPmhvc3QpOw0KPiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgICAgICAgICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gcmVnaXN0ZXIgRFNJIGhvc3Rc
biIpOw0KPiBAQCAtMTI0NSw4ICsxMjQ3LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgICAgICAgIGluaXRfd2FpdHF1ZXVl
X2hlYWQoJmRzaS0+aXJxX3dhaXRfcXVldWUpOw0KDQpJIHdvdWxkIGxpa2UgYWxsIHN0cnVjdCBk
c2kgc2V0dGluZyBkb25lIGJlZm9yZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YSgpLg0KU28gbW92ZSBp
bml0X3dhaXRxdWV1ZV9oZWFkKCkgYmVmb3JlIHBsYXRmb3JtX3NldF9kcnZkYXRhKCkuDQoNClJl
Z2FyZHMsDQpDSw0KDQo+IA0KPiAtICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRz
aSk7DQo+IC0NCj4gICAgICAgICBkc2ktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOw0K
PiAgICAgICAgIGRzaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFNJOw0KPiAN
Cj4gLS0NCj4gMi40My4wDQo+IA0KDQo=


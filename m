Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA49FE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAAJVIHfJb5wC+acXKZr2DNTRlsEzGDqQIL+CXYSfWs=; b=IFYN6eNBzgwb74eGDS60bDGGlM
	HHoEBsEcPRahaIHHbRNKKdNCiJxWSvnv3DKrBskwoV5IDEXGDLPQ53KL40gcfadi4Dif2mktxhKNr
	UBf3QvbLQitkEOhTEtGJAQLPglVUBEcmX/QTYRNO9JbLepUE72v39P2VJdgsPzIikCHqpGzQwkidy
	P63giHrRajNiNA+xj40rIYabIVkgSg2eJZALRiWvf5KtEsM+VNfTc8qy4atRaMVN1vjfmXS9StyfF
	DSvFa0/ZPDJDIogaRHd8WhZABmpSjA13GKLNddo4RkffMmSZ8/dE+VEfYM/RvIT7ov24AsdmFZS/H
	BR5fN4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYdh-00000009BbV-3jhs;
	Mon, 23 Dec 2024 02:57:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYcW-00000009BWe-1jVD;
	Mon, 23 Dec 2024 02:56:37 +0000
X-UUID: 8366c2d6c0d911ef82ff63e91e7eb18c-20241222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=JAAJVIHfJb5wC+acXKZr2DNTRlsEzGDqQIL+CXYSfWs=;
	b=tvnxyYl2aS966XNV94XBXPx8OOdFc57t+JpjbMRjCUyh6c1HIScx3JJmWU+RImV9j+YL90uz0x8Ekhg2bJdd9XqAPtgSXc2h6niHE0nfbQhmtys/vsDy5Df4F0mSwX3OxYDbNcR7Y3EcRT4BvLU7qqdMKObne7+6u3wH3zLeXRs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0597cbb8-15c4-4063-a1fc-9767cf491b35,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:9c910725-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 8366c2d6c0d911ef82ff63e91e7eb18c-20241222
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1640515944; Sun, 22 Dec 2024 19:56:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Dec 2024 10:56:28 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Dec 2024 10:56:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUWNVnK+DBj/tPtmjPY6d/SbZI3TjyRaeeTUyhkG5DzhWQqxKEHarA6phMoYUtbbqcGkZU/ukJoV6Aek2Ln0PWGBpbeB3/4AmcE6+hZRPJ4g33F0PLuc+JeKja414ENgiopWwb2GSS+x7qV5bXNlhFF74zr3vU04pW/cD5R1Plx8RLRYDDsldWxy6Z/ockZ8NPQ0YFaQ5KigTNx1gJy6WZuLDlGZrszYONRk612Ka9m/3es3QBRgn5zJ2XVqiQDEEqV+jVB3Ip1NT7PnBYDWN5ulpisk0LlxbAR4jyehpSaaWsTj2pHpw7FVbMPr5BAyE1lkiw1blexb1mONGZMBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAAJVIHfJb5wC+acXKZr2DNTRlsEzGDqQIL+CXYSfWs=;
 b=PXxahVPlNdYN5XF8cvGwBqErDH4RVy4cxe0EzfdnLBwr3q57zZc5Z4SSziw6N3dOhrIT++HG6KUPB0k0R6U5KBd6wyJFHxmL4xQ732dk1WQALiUJpURDx6gqixuctlDYV5y6qjNQAdGElMpTnPCNZ0ycHuNVt2jdZ2REWgeiXwm2p4OxoQaNYiJrKD1atxj+iXjRYHKbgk6Lgil128BTArQNpH8w88uoFUa7TCLQ7u+uUyxYKAGjni5vPIteTU+poqezLUKOmBvKvcpVlVaucBedNrWJU/ZXkZCkUD4hgGLyeaMnnJF65KeSdnXHcDSp8vRT/LSdmxHU9Nx77Dokpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAAJVIHfJb5wC+acXKZr2DNTRlsEzGDqQIL+CXYSfWs=;
 b=n63siLt4AdJXA6WB1cOU7CkjvOqKVy97QS8RyP9PdDgFHAUoQqW1SBea35jcHJVAt77PirEtGUZSRGLiKwirHyAUD/+wjGGd3d2z3dK8h7Nds/3h1J+BGLQmYF9hyf0An1ejPnwcq7oh9saxZePN3y6mN8UPB1fKqhbyojlVjE0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB8649.apcprd03.prod.outlook.com (2603:1096:4:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 02:56:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Mon, 23 Dec 2024
 02:56:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, Guoqing Jiang <guoqing.jiang@canonical.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
Thread-Topic: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
Thread-Index: AQHbVOMnuGya0FexoEeyTv0XUzDixLLzIr0A
Date: Mon, 23 Dec 2024 02:56:26 +0000
Message-ID: <7ba402ce91c40bcc33837289b9920ac82684964b.camel@mediatek.com>
References: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB8649:EE_
x-ms-office365-filtering-correlation-id: e4412b1b-d341-4b66-31e2-08dd22fd64b2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aXJ2UGJyVlpmTmVOdkx3WXpGREJMRXJMQW8wMlIzcHRaWVJZbml0M3I0S1ln?=
 =?utf-8?B?TU9hQ2lOcGFVeXpYdWJKM3lwTTY2dmhWZDJiczlyWmRlcmhQZ1lETnllWXhw?=
 =?utf-8?B?SnRIdmE4cDVVK3Q2ZkxMVmhMTUQ0UmtkUDNIQTlTbGVXdU5OWXlMS1pRQ1hJ?=
 =?utf-8?B?eXBROHg1MFJkQ1FHaTd1N3YyaUk2MUVnM0hwMmYwcUN0elUrenVmeGYwU1cr?=
 =?utf-8?B?clJ0UGpRa1Qwcm51dHVDaGJwOVM3all0d2wxMExJakVCZldkRU4yRVUraWl5?=
 =?utf-8?B?L0hXQUZDOEFFMUJ4TVhKVkYvNUdKRGQzWGpZSWhscWg2Z2x5VlFqbW5NSjYx?=
 =?utf-8?B?OW9ncG1sN0VsWWhFOWZpQnFqN3REOTBpVmwxa3dGTHZncEVQSThWWE5nN0VS?=
 =?utf-8?B?b2dIYmxEZ2dsSWk0Sk45UDArVEFES000RllVVXJyL0RtbEVaTEVyZ2d1bng2?=
 =?utf-8?B?ZVZPSjROUFNTRUxYWlk0T3l4VlFseEJJUm15WnBKTkoxYis1STJvb3pVRm9n?=
 =?utf-8?B?clZPRWd4TVpMdytZdS9JUjBqWGhWRWt5YklCOTJnS3JydExGdVJzMXBvdGdT?=
 =?utf-8?B?eXQ0N1VYWkFXakxlRDFEd3JnUG11ajFYcHQ1OVhQa3NqaDZ2R1lwd3R6czdm?=
 =?utf-8?B?L0NnamNwbDlkRllxZkx4WjlJd1Z2YWhicGZKa25SWUtZZDJ6eGVoYThjVXc2?=
 =?utf-8?B?Wis0VHJuUEE1a0F5Y0k0djZWTlY1ZFdGT0crUldqRUxLTVl5eTZSMjVibmkv?=
 =?utf-8?B?R3JTckM4YnJHbit5ZjNOK1R6eGRZNWd5bmJVVnB0SWtUcVErL1UySkxHeGJ2?=
 =?utf-8?B?TVJKQ01JdWY0L1JLM2cwQ1ZoQ2JOMkNhejRIRjh6bzV0WFpLckFkTERhZkxo?=
 =?utf-8?B?YkxrbmViYjNvK2c5U29za3FTL0pQVmgrMXlXVmVTeEluMW12SG9SS0RaR050?=
 =?utf-8?B?OFdBL0xmODhSRjlUdHZRUjRsTkhMN1BUcFpyVm5HWE1RNjBaNjhzdWtSM2Fa?=
 =?utf-8?B?SmJNNWM5VW5qYTdNOS9SQmFBY2s4dUd2QmpVQlAyODQwSzJRVC8yRHdxdU15?=
 =?utf-8?B?cmJuOGVTV3BSNll2aDN3MEp6R3F3T0NaMi9YVzhZL3M1QkRyOEw3THlkNkJB?=
 =?utf-8?B?QUtYK0NubkZmbUR4REdYVXJmakM3ZVFpRk1tS3d3Q0FDZ0JRUTRydWRtTHcw?=
 =?utf-8?B?WTFNQU82V0tWRG1hTEZnZmlaMDJlVkVUbzR2KytUd3A2UzFlZjlDbEozZy9l?=
 =?utf-8?B?UlNlQkJIOFJoT2tvTWRaOHBEenErRTluQWdjMElPVFVEdS8zQVZFVjBwY3Uv?=
 =?utf-8?B?Ukw2ODZROWd2NWM2cW9VVWg3YnJiR05qN3o4c2tXbzlxazJDRlRXT0k4R1d0?=
 =?utf-8?B?dEZoM1FhdXZLMlRMNit6Zi9RTktjWGpSdjZJdzNmY1lCcCtYNjE5T0dGZXdD?=
 =?utf-8?B?V1FrdVdFU3pCT05tWWMwZVpyR0NSNXoyRlRnOW5OdGxQd2ZBZGd3SmZkVHJG?=
 =?utf-8?B?NXdjMSt0SEpXakpDdHduQWFOa1N4VEFDempPaEMxQ01kYzBTY2gyVUdHb0hv?=
 =?utf-8?B?OGorS3hSWVdyZWp0WWJJTUNuQU52MXY3aFFVcTJvb0VzRTYvbEJBQTJZWHRy?=
 =?utf-8?B?ZWFyLzl0QVQ5MUUwd0RtM3gvaS9uVFNUMTJxU0JRZ1R0VDMvVm1OaDZ0SlpK?=
 =?utf-8?B?TkRXVDFTWjlISEpHczc3VnZLUlFmblYydHdkWUE4RXhkNXZXRGFaNzFpVDBO?=
 =?utf-8?B?WlNIZS8xQVhHbFA5djJnWVZCcVFaandNalA3R0pEYkhlMC9sMTZVenBGWnpE?=
 =?utf-8?B?dzJnWk1KTmF5cFNxZnhrK0dyRjRjTEg2anVlNXRmZmIrYklhcU94bktXK2NB?=
 =?utf-8?B?Smk1bGpiaHB1Rkg2OVRsN1FLeHRXYndxZGl0L3I5dDl3eWc4TFVnaWJDd3cy?=
 =?utf-8?Q?kouKpuhNrIe/VpJpYC+geYctFplBSclN?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE1hVk1jRW9qVHBFb0pVMHRQM0VXWUFlb0ZMRGJYUm40bUhHRyt5UnFISmNu?=
 =?utf-8?B?MExuMjVmQUl3TVJlR2YrMXdreWlUaEY3QXhrVXRyMFIwOThiNERTbWYrVUFZ?=
 =?utf-8?B?b0pTMUtnV043TCtMbGxqREI4SmtHMHI3NU1RRnRXMmVFNTduZ2dGS3RIeDNn?=
 =?utf-8?B?bDM5OTVrcG9STktYNWRWTk0yUGlxVEJkWE1vbW96NndBeHhBYmdTcWt4TW9C?=
 =?utf-8?B?MDFRMjl5YXNZRGwrRE5WTUpXaStGTGUzdWlwTmFkL3RBTUJwcGFPOTZzNENC?=
 =?utf-8?B?VW0xTEIxbUMrRlFPZ2YreU4xNDM1b00rUlE0azFBZWpjdEovdWw5Q0orK3BR?=
 =?utf-8?B?WGNwb2o4WTI4ei9jZUtWaUpwblA4WnFLWnpBUndUd1hqNlNQK1B5YjI0ZUV1?=
 =?utf-8?B?aHRLQXRyUEFEL29RUll4cmVmbytmZXR5V1dUSDFQREo1NmdqNFlNMWtYQUVP?=
 =?utf-8?B?UlppVWRtRUl4SnV3bnhjNHZmTER5Q0ZSTXFkTHRob3BKTitBNm1JcW0rS0VL?=
 =?utf-8?B?ZDRvVUdaNFRZZjVqTmNhU215TXB0OWZZdURJM1hNejZwTEhuTjQwYkU4M2ho?=
 =?utf-8?B?Q3JZcXRvZWRtTG5LUmtkMFFxU1RFbHU4WDQ4ZGQ0U2NqaXdLZGFJaTNxYnpQ?=
 =?utf-8?B?LzlyNkF2TUpVOEdnajUvZHEweWN6dFlSMjZ4bEJLVG5mbXh3cGUzK0x3ZEpX?=
 =?utf-8?B?K1puUExtU1Y0L1FYQXczMlRBU1pXNzdyZEkyaUh5SUZ3NTVOL3JNLy8vVGtV?=
 =?utf-8?B?YkZKNm5jUnhXNzVqMWRNZzhyUEJlWjBEVVIzWWJ0Y010K3JJRlpZZXVJQWhs?=
 =?utf-8?B?ZGI0UVM3WHVNY0tqS2N4UUx1Y2l0NWsrakhDMng0MFdnMHF1dlRjeUtUM2l4?=
 =?utf-8?B?cVdpR21UajlXRHFnbFc3dnFFVVB0cHdTM0tUK2c1eGpORU94WUdUTFJWOUFx?=
 =?utf-8?B?TFR1SWFiaWVYRkJYYlhuSmwycEpwU0VSNTkwT1pOeVFoU2k5RjZ0dlQzZVdm?=
 =?utf-8?B?Nno4Mk9ld3hNYlZleFRSc1JJMm82QUJMbHZxMjV4cmRjN1cyTzNYZnJSd0w2?=
 =?utf-8?B?cmVJTGhLcUpTaHNzclNTOEN4NzZuQkRZV0ozZTZzNXlCYWpCNUdKY2NhbVlW?=
 =?utf-8?B?ZGxBM0ZDZ0VtUFk0a24ySGtPbmhKVE9XNTdzUEpBOFFTYUNNWEZUaGlLL2Ji?=
 =?utf-8?B?Qk1PZG5Hbjk5c3c4SUdqYiszKzgwSy9MTE9LV2xPY3hHL2xtSWdVZ0NKTzJp?=
 =?utf-8?B?RnZQbElmby8zZkN0MGVod2plZWF4cHduenM2WmM2MGEyYU9uTHVqRFR1SU53?=
 =?utf-8?B?NjBzUU9xaWFLMmJNL2lRZmNabHlseHBnU05BZktueXBxYlNHZ3VJVVR3RWVM?=
 =?utf-8?B?QlZsREpHQTVKaGxETkdkQnJwVW5mVVFhN1E1c3B3elJ5QkFma2t0ZXlnNkpS?=
 =?utf-8?B?YXJKVHJEd1Fjd3E1UnY1emZWV2E5akNxWndxZ3VBME1rY3o3MkdsbHB0Yk52?=
 =?utf-8?B?aC9SblhzbTg4bXZHcnF6b3hFQnc3YmlmYzBZMHoxMXBNVFBrYldzQnVzNFVV?=
 =?utf-8?B?UU9OdEtVL3dsd3c2OW9vRUhOMUZhL0xueUIrMVVGdnpTNGJFMjlZbUJBQ1pM?=
 =?utf-8?B?RUszbHBlckk1NFNHeU0xYzhGUlRXUm9wYldxbjhLL2x3UlV1VEZqazB2VW5X?=
 =?utf-8?B?L3Qvcm0rWUl6OVpiaE82SDhIZkl4OG9ZUWNBRGZ4V3drYUxvU2Q0MmUvMnhI?=
 =?utf-8?B?cTFWcXI0UnNFSDdmcVA3U1R4RG1iKzNnYVUrSFN6OU5PdFBrSzcrNlRWRGZC?=
 =?utf-8?B?KzU4TmJCSHd6NG9Zck5SdkI1L0ZuWi92eFVkWVhEancwTDU5SThrYUMwb3Fo?=
 =?utf-8?B?SEhQcE1zYWM1QmtmeHVuZ25RYk9aejBkeWxKSDhwdUxLaE94NG0zdTc3c0FF?=
 =?utf-8?B?VTRQZTBZUkNSOFA5WlFkRGF3Tms3UXdsNjZNakFaM0VmSjBnYmR0Zk9CZUEr?=
 =?utf-8?B?Z2lGd1VCenBVM3dtdlA3YTBSK3cxZGplSVFlVEhoVE9zNytwZnl4bHdVbGxy?=
 =?utf-8?B?QURjUUx5UWp1NmVkVWZhaXQyYm50ejhFY0R4MEt6V3huRzV6dytEeHBkRjBL?=
 =?utf-8?Q?kywEFLe4deZ70gFFE5gDOnYiJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <847CAAB8358DA54C82B2C530F5ED75E5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4412b1b-d341-4b66-31e2-08dd22fd64b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 02:56:26.7405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkhLi/DCpUKazGbzs7xfqb3S7HecKtMnXvg9BN7funMwVv64QYB3VN5Ze4ap8fVcEFrFtpkPiWc9S3dsIDC/OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185636_511886_025B33BF 
X-CRM114-Status: GOOD (  10.17  )
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

SGksIEd1b3Fpbmc6DQoNCk9uIE1vbiwgMjAyNC0xMi0yMyBhdCAxMDozMiArMDgwMCwgR3VvcWlu
ZyBKaWFuZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgcG9pbnRlciBuZWVkIHRvIGJlIHNldCB0
byBOVUxMLCBvdGhlcndpc2UgS0FTQU4gY29tcGxhaW5zIGFib3V0DQo+IHVzZS1hZnRlci1mcmVl
LiBCZWNhdXNlIGluIG10a19kcm1fYmluZCwgYWxsIHByaXZhdGUncyBkcm0gYXJlIHNldA0KPiBh
cyBmb2xsb3dzLg0KPiANCj4gcHJpdmF0ZS0+YWxsX2RybV9wcml2YXRlW2ldLT5kcm0gPSBkcm07
DQo+IA0KPiBBbmQgZHJtIHdpbGwgYmUgcmVsZWFzZWQgYnkgZHJtX2Rldl9wdXQgaW4gY2FzZSBt
dGtfZHJtX2ttc19pbml0IHJldHVybnMNCj4gZmFpbHVyZS4gSG93ZXZlciwgdGhlIHNodXRkb3du
IHBhdGggc3RpbGwgYWNjZXNzZXMgdGhlIHByZXZpb3VzIGFsbG9jYXRlZA0KPiBtZW1vcnkgaW4g
ZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24uDQo+IA0KPiBbICAgODQuODc0ODIwXSB3YXRjaGRv
Zzogd2F0Y2hkb2cwOiB3YXRjaGRvZyBkaWQgbm90IHN0b3AhDQo+IFsgICA4Ni41MTIwNTRdID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiBbICAgODYuNTEzMTYyXSBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBk
cm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bisweDMzYy8weDM3OA0KPiBbICAgODYuNTE0MjU4XSBS
ZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmYwMDAwZDQ2ZmMwNjggYnkgdGFzayBzaHV0ZG93bi8x
DQo+IFsgICA4Ni41MTUyMTNdDQo+IFsgICA4Ni41MTU0NTVdIENQVTogMSBVSUQ6IDAgUElEOiAx
IENvbW06IHNodXRkb3duIE5vdCB0YWludGVkIDYuMTMuMC1yYzEtbXRrK2dmYTFhNzhlNWQyNGIt
ZGlydHkgIzU1DQo+IFsgICA4Ni41MTY3NTJdIEhhcmR3YXJlIG5hbWU6IFVua25vd24gVW5rbm93
biBQcm9kdWN0L1Vua25vd24gUHJvZHVjdCwgQklPUyAyMDIyLjEwIDEwLzAxLzIwMjINCj4gWyAg
IDg2LjUxNzk2MF0gQ2FsbCB0cmFjZToNCj4gWyAgIDg2LjUxODMzM10gIHNob3dfc3RhY2srMHgy
MC8weDM4IChDKQ0KPiBbICAgODYuNTE4ODkxXSAgZHVtcF9zdGFja19sdmwrMHg5MC8weGQwDQo+
IFsgICA4Ni41MTk0NDNdICBwcmludF9yZXBvcnQrMHhmOC8weDViMA0KPiBbICAgODYuNTE5OTg1
XSAga2FzYW5fcmVwb3J0KzB4YjQvMHgxMDANCj4gWyAgIDg2LjUyMDUyNl0gIF9fYXNhbl9yZXBv
cnRfbG9hZDhfbm9hYm9ydCsweDIwLzB4MzANCj4gWyAgIDg2LjUyMTI0MF0gIGRybV9hdG9taWNf
aGVscGVyX3NodXRkb3duKzB4MzNjLzB4Mzc4DQo+IFsgICA4Ni41MjE5NjZdICBtdGtfZHJtX3No
dXRkb3duKzB4NTQvMHg4MA0KPiBbICAgODYuNTIyNTQ2XSAgcGxhdGZvcm1fc2h1dGRvd24rMHg2
NC8weDkwDQo+IFsgICA4Ni41MjMxMzddICBkZXZpY2Vfc2h1dGRvd24rMHgyNjAvMHg1YjgNCj4g
WyAgIDg2LjUyMzcyOF0gIGtlcm5lbF9yZXN0YXJ0KzB4NzgvMHhmMA0KPiBbICAgODYuNTI0Mjgy
XSAgX19kb19zeXNfcmVib290KzB4MjU4LzB4MmYwDQo+IFsgICA4Ni41MjQ4NzFdICBfX2FybTY0
X3N5c19yZWJvb3QrMHg5MC8weGQ4DQo+IFsgICA4Ni41MjU0NzNdICBpbnZva2Vfc3lzY2FsbCsw
eDc0LzB4MjY4DQo+IFsgICA4Ni41MjYwNDFdICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsw
eGIwLzB4MjQwDQo+IFsgICA4Ni41MjY3NTFdICBkb19lbDBfc3ZjKzB4NGMvMHg3MA0KPiBbICAg
ODYuNTI3MjUxXSAgZWwwX3N2YysweDRjLzB4YzANCj4gWyAgIDg2LjUyNzcxOV0gIGVsMHRfNjRf
c3luY19oYW5kbGVyKzB4MTQ0LzB4MTY4DQo+IFsgICA4Ni41MjgzNjddICBlbDB0XzY0X3N5bmMr
MHgxOTgvMHgxYTANCj4gWyAgIDg2LjUyODkyMF0NCj4gWyAgIDg2LjUyOTE1N10gVGhlIGJ1Z2d5
IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgcGh5c2ljYWwgcGFnZToNCj4gWyAgIDg2LjUyOTk3Ml0g
cGFnZTogcmVmY291bnQ6MCBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMCBpbmRl
eDoweGZmZmYwMDAwZDQ2ZmQ0ZDAgcGZuOjB4MTE0NmZjDQo+IFsgICA4Ni41MzEzMTldIGZsYWdz
OiAweGJmZmZjMDAwMDAwMDAwMChub2RlPTB8em9uZT0yfGxhc3RjcHVwaWQ9MHhmZmZmKQ0KPiBb
ICAgODYuNTMyMjY3XSByYXc6IDBiZmZmYzAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCBkZWFk
MDAwMDAwMDAwMTIyIDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgIDg2LjUzMzM5MF0gcmF3OiBmZmZm
MDAwMGQ0NmZkNGQwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDBmZmZmZmZmZiAwMDAwMDAwMDAw
MDAwMDAwDQo+IFsgICA4Ni41MzQ1MTFdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IGthc2FuOiBiYWQg
YWNjZXNzIGRldGVjdGVkDQo+IFsgICA4Ni41MzUzMjNdDQo+IFsgICA4Ni41MzU1NTldIE1lbW9y
eSBzdGF0ZSBhcm91bmQgdGhlIGJ1Z2d5IGFkZHJlc3M6DQo+IFsgICA4Ni41MzYyNjVdICBmZmZm
MDAwMGQ0NmZiZjAwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZg0KPiBbICAgODYuNTM3MzE0XSAgZmZmZjAwMDBkNDZmYmY4MDogZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4gWyAgIDg2LjUzODM2M10gPmZmZmYw
MDAwZDQ2ZmMwMDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmDQo+IFsgICA4Ni41NDQ3MzNdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQo+IFsgICA4Ni41NTEwNTddICBmZmZmMDAwMGQ0NmZj
MDgwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZg0KPiBb
ICAgODYuNTU3NTEwXSAgZmZmZjAwMDBkNDZmYzEwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4gWyAgIDg2LjU2MzkyOF0gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IFsg
ICA4Ni41NzEwOTNdIERpc2FibGluZyBsb2NrIGRlYnVnZ2luZyBkdWUgdG8ga2VybmVsIHRhaW50
DQo+IFsgICA4Ni41Nzc2NDJdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0
IGF0IHZpcnR1YWwgYWRkcmVzcyBlMGU5YzA5MjAwMDAwMDBiDQo+IFsgICA4Ni41ODE4MzRdIEtB
U0FOOiBtYXliZSB3aWxkLW1lbW9yeS1hY2Nlc3MgaW4gcmFuZ2UgWzB4MDc1MjA0OTAwMDAwMDA1
OC0weDA3NTIwNDkwMDAwMDAwNWZdDQo+IC4uLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IDFlZjdlZDQ4MzU2YyAoImRybS9tZWRpYXRl
azogTW9kaWZ5IG1lZGlhdGVrLWRybSBmb3IgbXQ4MTk1IG11bHRpIG1tc3lzIHN1cHBvcnQiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBHdW9xaW5nIEppYW5nIDxndW9xaW5nLmppYW5nQGNhbm9uaWNhbC5j
b20+DQo+IC0tLQ0KPiBWMiBjaGFuZ2VzOg0KPiAxLiBhZGQgRml4ZXMgdGFnIHBlciBDSydzIGNv
bW1lbnQNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDIg
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGluZGV4IDlhOGVmODU1OGRhOS4uMDA2MjM3NGY3
NWQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAt
NjczLDYgKzY3Myw4IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gIGVycl9mcmVlOg0KPiAgICAgICAgIHByaXZhdGUtPmRybSA9IE5VTEw7DQo+ICAgICAg
ICAgZHJtX2Rldl9wdXQoZHJtKTsNCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgcHJpdmF0ZS0+
ZGF0YS0+bW1zeXNfZGV2X251bTsgaSsrKQ0KPiArICAgICAgICAgICAgICAgcHJpdmF0ZS0+YWxs
X2RybV9wcml2YXRlW2ldLT5kcm0gPSBOVUxMOw0KPiAgICAgICAgIHJldHVybiByZXQ7DQo+ICB9
DQo+IA0KPiAtLQ0KPiAyLjM1LjMNCj4gDQo+IA0KDQo=


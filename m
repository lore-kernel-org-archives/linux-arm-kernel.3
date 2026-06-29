Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 03:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBhCYOVMSd7OJrWObgpI6b+rXie4ogblxw5Qw74UmBU=; b=x9qCaXzNxy8niiLMHqtVEet7UB
	rs4vCjp0P5INLwgDwoq0LfLHyD6OBodf1+HPcT9er3ONN9AUjumsRiePU4ScrjZxKxPORIhS5k2Sr
	DrrBMlgbcoNI5XF0cL2UBWjp3vEEoIZGQjj1hjqUSvh187OuGRINGd/N8tNw8cmUPtGqLDdR1ObaL
	gzXEseEEyqNPo6tMxMAXW3FcKAtXe5JF2W3GisVYBiz3+HQ1gEOyu6ItgJCNOpod52NK/srxdJc1i
	zO9bqk0ipseVTzwZNkfx96iNn64+y8lOBci7pMd9yXy06pHYCL2hM+6p2xNXgARnwGtgwjkEj+FX6
	o/o6+BzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2FZ-0000000DbmN-2t34;
	Mon, 29 Jun 2026 03:01:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2FW-0000000Dblo-1kCr;
	Mon, 29 Jun 2026 03:01:31 +0000
X-UUID: d0e03efc736611f1acbe4559397dec65-20260628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UBhCYOVMSd7OJrWObgpI6b+rXie4ogblxw5Qw74UmBU=;
	b=rCFy+e+Y+nXTbr/XdCDR6Da6HFAASCPh9PzWc5yDdAq7r3IUf9LgoYno3VVqtVJMW+iKbu7D4GchNz3eRZCGFmbrkdEbTCXCQivN3g1sjJgUuEluh41XLn+rmWJNNWaWrikuWQ4/1yjzmewMHCO/Acmt8anR54XVQ2hZ6/5QYIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:120adc96-7fd9-44d3-93d5-570d15308506,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:08f84f20-9fc4-4cf7-b248-97194856ad68,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0e03efc736611f1acbe4559397dec65-20260628
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 564432982; Sun, 28 Jun 2026 20:01:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Jun 2026 11:01:22 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 29 Jun 2026 11:01:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxYeUvgVwDCre434VcY3A6DCir3AqCa1Ojjku2ykhmf/2mUi1tVN0aBPh7TKUgxpsj6rtQlpdkxGjUQGp4Fm/pTC3IQ6UnbOMiBmR2+1Ik1rdce0gQYAaz3Xo5p7B80DWG/FNKkKmi+faSO67XIIVaFamkP6X9Q2vd2xJtuq+V4ClDuR/NU+E+Juz/jQ/8UcTX1IwfA/LVQfgye/pz7UZKHiE3avuWvi5NggoNGehIJHRQr0kxfYM65KrjQtqaoYRaZkyW4uPGNPjQWJZaWKy7xP3QZ+y7xaeaW4GhFu3HvDKSMz0IK1HwF+TiKRpfg9JTJnJ7NePRXk+q1GWWYR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBhCYOVMSd7OJrWObgpI6b+rXie4ogblxw5Qw74UmBU=;
 b=CIdfkQ6H12Pm58sdyLUibJkoc0VlLewLyp8OrjUr+kI+h4kiBhIaVFSHZ1fxZVQeq8BqLiwcTdMXWbgH1yvbE7tr/N1II83plTaLLB+IVp8gOurJjriWblzm5xgiy3Hfj7OvN48dpKvW+ylM2d0Vg0XJB4meQ4vzNhGtsRUD1/TZzEK+zB/IYqC32kRP342GHzytaImJjtVKUxFWdCaybscgW7n/BvkEnOHk30XEFx9O9gcxn8xFKyV1hRROEWUb9HR0hXrF+5cikSm4QJXzVyt8rmhDut+n/v2YPNKMKaZwlk+CQQfKD1hn9rxKY5TaFyeyWpTZCw1C3vIz9Vtmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBhCYOVMSd7OJrWObgpI6b+rXie4ogblxw5Qw74UmBU=;
 b=KocGLOGhb0kKyIl8JisAPu/YJf51o4cy7Hk+hoSeJgsqVHTUvZDF/irJSYiMRNyqqeT6dvAGOuy31SR74r9FhPMOKTN3CzsQw+IvJt5M486JXzqx5Gj7eQW0Pn4npcv9keJy7sXE1N9UhW05TGgzBWWgkGNjreh9NfrJSpWdaEU=
Received: from TYZPR03MB5741.apcprd03.prod.outlook.com (2603:1096:400:72::8)
 by TYSPR03MB7911.apcprd03.prod.outlook.com (2603:1096:400:474::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 29 Jun
 2026 03:01:19 +0000
Received: from TYZPR03MB5741.apcprd03.prod.outlook.com
 ([fe80::fd68:2f22:b501:b771]) by TYZPR03MB5741.apcprd03.prod.outlook.com
 ([fe80::fd68:2f22:b501:b771%4]) with mapi id 15.21.0181.008; Mon, 29 Jun 2026
 03:01:19 +0000
From: =?utf-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
To: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "i@rong.moe" <i@rong.moe>
CC: =?utf-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
	"marcel@holtmann.org" <marcel@holtmann.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "patchwork-bot+bluetooth@kernel.org"
	<patchwork-bot+bluetooth@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
Thread-Topic: [PATCH] Bluetooth: btmtk: Disable remote wakeup for
 MT7922/MT7925
Thread-Index: AQHdBRLBhFiAz9gODkexykUa0FLDErYs+LQAgCMnkICAAJDJAIAAXb6AgAAzohmAA5qJAA==
Date: Mon, 29 Jun 2026 03:01:19 +0000
Message-ID: <99fb847b8fdedb1464798230407719912d6585c6.camel@mediatek.com>
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
	 <178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
	 <3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com>
	 <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
	 <CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
	 <fd8587e97a48e49332a4ad36e51e18739d000250.camel@mediatek.com>
	 <4e96132bcfb267af05c06dc277b5ba6895e3ddde.camel@rong.moe>
In-Reply-To: <4e96132bcfb267af05c06dc277b5ba6895e3ddde.camel@rong.moe>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5741:EE_|TYSPR03MB7911:EE_
x-ms-office365-filtering-correlation-id: 82eb461e-ba44-4de2-798e-08ded58ab190
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|38070700021|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: g0LsMujJtGxbSkKhXRtA29eZiLBZqtHAeY8AA41rBmvKzGe/6kmhz4iXcTXKm5wiC91SQce/c3Dp0VEGuPTS6XlLxSNC1yYN9rweFBbKCnLrJUvCdst1AyMNHpLnTbd5V0OFOgpCtBEtI0LIYl1CRhkjiEmQAcinfLnD2/kP0CUr+Vs522+rxT6aatzqRh1BtJd9nHRVtn2vGccnRpQV0r41eEVe+7go9+iL9EM3vcrPMj+PK/Ud0SjqXUjz5opPyIXrDboRcnON9BaMpqEr4srsq86pnKOMDMo57y62ALlcqqAGCd8ycUGSDrKyAh/LBjVUx2UrqjzRJ4xv+nfS/w2PXUssFDHZ7pK5v3b8lhtVsZt7UMcAum0W9IAaXdkFhjccn/tct0QykW5j17x8lWT7XbA4S2paoPj9Kf73+dBLuedLTLx90T6sMQCvo/kn+0gsETQeAyBUhsx6g2QKzWR2nLHpZ4/IzVd7S0ibi4y4ykxHOl5FsiPUdXnIO4SNTo91zGFOgZo16YCcEPZJHPx0gGWSLGTeQQyGbqLp3+vJASI214RCGGQJyav4e5bD/J8nsLgjig2+eXTAuXhYfLShTeMTxrykx7n6lbzzcLBzBukhkHFGulSzFezgC43yti1kwg6EImjdvhP6+TpbcHrPxkINcHYtWquUAyzWgi/PX6upvIBPHS6oiGtKtHGAi17H9aF4CeHfSM8/mCiWfvn++CjWdXwOa1sj/F5yuPE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5741.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGlCcGVlbFpJdUU3T1I2WWNha2NLT0tpaHd3L0tYai9mQjN6M09VRXNKUTlF?=
 =?utf-8?B?OXp5d0dEZnZrRnpIQnEwWWJDQ0t0YjRLaDlOUW5aMGVIRGxXa093YVRITHd6?=
 =?utf-8?B?a0RyVzAxdi9ZQmNGYW5EK05EVDN4dmpWNmFkTnY4bzZJMEtteE1GWlI2MnZN?=
 =?utf-8?B?V1RJTzBIMlR1Y1lNMXJQOUwrcmRBejRucU1HZSt5TFlQRVBJaUo5U1lKcXRW?=
 =?utf-8?B?QWdheEhTZnhtZWc3eDRMa0ZZa2dGQkpqQ1RUcmpoeDFFT3FwajBjUWIza1Vv?=
 =?utf-8?B?Tit2cHBseDE0anU1U1RFOThKV0xxMm9KVjN5Sm5SVzVCYzVqQjhYdmc0TGVh?=
 =?utf-8?B?b2loVUhZUmJtV2dnK2JnYmFmSytRMEtuVlZjSklkaWV0WkJ0UUJtTXpqQ3Vl?=
 =?utf-8?B?cWhucWNxT1hPSmx6NWpiTEI0bXlYUXY1bkh1WUNtWDdORlpVREFIRGZpaHJU?=
 =?utf-8?B?L21PNnc2dnEzRnpoSXA4UU9Yb2NNRE1BOExqZ3ZDUTJSQURiWFhOVzJXRlow?=
 =?utf-8?B?SkFieEVENHVWWGNaOHFlWmUwZnQ5aGFJdWN5VWs2R05uSmpkcGhqbHFRL3o4?=
 =?utf-8?B?UEZmNDFXdWw2Vy9hSnhLOUpkNjh6eVZBd2s4WDZhOHFwN3BPSVBSbVNSVm9h?=
 =?utf-8?B?YXlYWEE0eTByRXoySHhsWHBJUzVHSFRIOGJDR2tLMkI2dytGQmVDSkpnWng0?=
 =?utf-8?B?T0tJZW0yb0xqZ0tCazdtM3d6R2lFMEgrLzJVOU5tdHlEdmRvRFU3MkxobW8z?=
 =?utf-8?B?K3lyaTQxTjFtWGhXaDB4c3QrVU14NUY5TGxad3JmalhDUGEwaE4zQ3BGQjJM?=
 =?utf-8?B?R296U0VCRUFqazJBWEFrNFJHNGdTVlJNV3NZZmNwb1RXWXJ6cE1uMHRWK3c1?=
 =?utf-8?B?U1hzd2IzOSthZUxWeVduc3NQV3hhT3B1MzhlWmtuUHhEMzNubkxUSDdteGlD?=
 =?utf-8?B?ZlRQLzF2SHlKUWpUZzdNRis2bThBazFPRGlSZjBmZ0FVUWdHRFg4WUJabElh?=
 =?utf-8?B?dWIxK1h1VCszNGdRdEg3UnFBTzRXb2ZpcUNhOXVEVGxObXoxL0tQZzlCandG?=
 =?utf-8?B?bGZJM3hmNllJTnVxV0lOVFVjNFJpTGhXZldnazB2MnhETnJWSFlLRForSnpE?=
 =?utf-8?B?V0xEVVR2QlJWNTczU3hGZ09IUFMvNFU4NXc3NnJzRDBzbUdGNlVuM0RSMkZl?=
 =?utf-8?B?eUlTYyt2VUd5SHNMT0hjVjNkWU1Sbmc4TjloMS83SFVDSzVGdi81b3hyK3hN?=
 =?utf-8?B?b0o5WXoxN1ZPcCtkWEREMlRWVFpSUHFjYUMxUDNEdEd6djNrZXVWQmtxU0FQ?=
 =?utf-8?B?ZGxZdXQ1dzF2ZnQ4d1U1VktYMFZjc0l6bTVaODJOYUNER1RpWnRIcmRhZjNt?=
 =?utf-8?B?S1dkVTlrdmdlV0lHOTFsTHVMVFpOS0RMUE9lSTZXYVJrdnNkWllCMFRsS3V6?=
 =?utf-8?B?WXdHd042V0xOUmdRMEFMWVN5N3JpMEVMNldNU3lmdi8wczdmaTJ3TmVBOFRL?=
 =?utf-8?B?NThCQms2cmhseUw0UnlMeWcrU29sOGc0L1AwWlFWZFIyczZxc2dMalpDYzRD?=
 =?utf-8?B?ejBweG5uUTFzbkpPSDZ2MnpGN0s5MUw2QitCVHVHTkpOdFQ1QjVUSC9DN1Jk?=
 =?utf-8?B?SVhJK3ZUa2JTS2JJeWxOOUYzaDJMQ1hRUWdYV1AvTE1rTExXajg3QkdzUFB0?=
 =?utf-8?B?dTFSeXpYdFU5bVVZNUVrZDJoZUdhRGw0MHdZRXRjUjN1MUVpL1MxYVNJeTNo?=
 =?utf-8?B?YVJELzJjcU96Y1U3bTlrUnd4WE5kaTcwZjVzdVRORys1QlYwbU9NSWNSa0Zs?=
 =?utf-8?B?dkFEcWtocnRxNHl6KytINno0RXZkSTdlTTlXTkNXdHRBclAvWjJ4UVNhbXJC?=
 =?utf-8?B?dnFXejUwQTNGRG8rVjIzalBqaWdpMUNmSjhGSlRqQXJNUWRIYndKNUkrVy9T?=
 =?utf-8?B?VlFqOWlkb2tZVEM4U0plekMyNU1pUit4UHFTbkpxazhxNmIvL3gxMVZOdUNQ?=
 =?utf-8?B?WDFNdnN2czRRUnZaYVZUSFZKbkpwb2ZLNUxxYkFmbGNNeEhPVm5FcTV4dlRK?=
 =?utf-8?B?c1pyN0ZWK2QyQVVDNjZwTzNOUGRJcTJDZnR5Zkh0UXhheThFUlBwdVcyVWdv?=
 =?utf-8?B?bTE3dit1VFJORXA3a1NRQ3VVNWt5S0lxdVZlUEQ3azk1cWN1Si92dngvVVpm?=
 =?utf-8?B?anh2WkxqaHU2SGVURkRTYnd5TmU0T1c5cTFrckR4cDFhcE80azNEMHh2enBG?=
 =?utf-8?B?WnFlNm5uTzFnOVQ4NFRYNXlmNUI0bXVKYlZlNEJkOVlUbEpIYkFZU2RzV2F4?=
 =?utf-8?B?d0pHTmpMWXB6WXlQdmJRTUtIalduYWw0d1ZmclQrNnN6TWc1SVdOcDlHQUhO?=
 =?utf-8?Q?ye4rUhRe803NGXRY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6523774C964FC247B373DC322FD66B13@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gg6LPMD07xJojwbVfN2J0l+cdsECS2im6vJep/BTpfPC6ebZ+JbAJo3lp9GVH1JWL9FkqUWTk3NHhi3OadWscz/jmVab2b7XH6v0/ysCBVsqEaSZVFgJb6VzjUhWz29fqMydGoZgTrcejU1lUcNMekXTSLb4IG+mJYDsgAptBIGAWjr0qJiNtFRU4xae9HU/0V8W5N9Orw9g1ej9Sw/Wr5rNFpk8CM02yMFhchvH1UqODD7vGZtDidM8JryQ9JcYRmbLSPI0zZsKUPmbPU9W7paHXFZYVSNq0pYAi2KhElWfzEycdrU5AgVoNogo5pvlyXih7EC1d0ur4e/EG/1NBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5741.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82eb461e-ba44-4de2-798e-08ded58ab190
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 03:01:19.4171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJzDbkAZ6EMqw7V7f5N4YYcU7Q1/pkw52hKxW5M8jW99ybisyrEuiPDFV/3YRetJxOs6/rjsWgfUlBT8Pd3EaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_200130_472992_8FBB0F39 
X-CRM114-Status: GOOD (  32.72  )
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

SGkgUm9uZywNCg0KVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmcuIFdlIGhvcGUgdG8gZmlu
ZCBhIGJldHRlciB3YXkgdG8gaGFuZGxlDQp0aGlzIGlzc3VlLg0KDQoNCkhpIEx1aXosDQoNClJl
Z2FyZGluZyB0aGlzIGlzc3VlLCBNZWRpYVRlayBCbHVldG9vdGggdGVhbSBoYXMgYWxyZWFkeSBp
bml0aWFsZWQgYW4NCmludGVybmFsIGludmVzdGlnYXRpb24gZm9yIHByb2JsZW1hdGljIGNvbWJp
bmF0aW9uIGFuZCB3aWxsIHNlZWsNCmFzc2lzdGFuY2UgZnJvbSBBTUQgU09DIHRlYW0gdG8gaW52
ZXN0aWdhdGUgdGhlIHJvb3QgY2F1c2Ugb2YgdGhpcw0KaXNzdWUuDQoNCkhvd2V2ZXIsIHNpbmNl
IHRoaXMgY2hhbmdlIGhhcyBpbXBhY3Qgb24gTVRLIHByb2R1Y3RzLCBtYXkgSSBzdWJtaXQgYQ0K
cGF0Y2ggdG8gcmVtb3ZlIGl0IGZpcnN0PyANCg0KSWYgdGhlIGludmVzdGlnYXRpb24gZGV0ZXJt
aW5lcyB0aGUgaXNzdWUgbGllcyB3aXRoaW4gTVRLIEJUDQpkcml2ZXIvZmlybXdhcmUsIHdlJ2xs
IHN1Ym1pdCBhIHNlcGFyYXRlIHNvbHV0aW9uIHRvIGZpeCBpdC4NCg0KDQpPbiBTYXQsIDIwMjYt
MDYtMjcgYXQgMDM6NTYgKzA4MDAsIFJvbmcgWmhhbmcgd3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBl
bWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRp
bA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4g
DQo+IEhpIENocmlzLCBMdWl6LA0KPiANCj4gT24gRnJpLCAyMDI2LTA2LTI2IGF0IDE3OjU2ICsw
MDAwLCBDaHJpcyBMdSAo6Zm456ia5rOTKSB3cm90ZToNCj4gPiBIaSBSb25nIGFuZCBMdWl6LA0K
PiA+IA0KPiA+IE9uIEZyaSwgMjAyNi0wNi0yNiBhdCAxMjo1NCAtMDQwMCwgTHVpeiBBdWd1c3Rv
IHZvbiBEZW50eiB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIEZy
aSwgSnVuIDI2LCAyMDI2IGF0IDc6MTnigK9BTSBSb25nIFpoYW5nIDxpQHJvbmcubW9lPiB3cm90
ZToNCj4gPiA+ID4gDQo+ID4gPiA+IEhpIENocmlzLA0KPiA+ID4gPiANCj4gPiA+ID4g5LqOIDIw
MjblubQ25pyIMjbml6UgR01UKzA4OjAwIDEwOjQwOjU077yMIkNocmlzIEx1ICjpmbjnqJrms5Mp
Ig0KPiA+ID4gPiA8Q2hyaXMuTHVAbWVkaWF0ZWsuY29tPiDlhpnpgZPvvJoNCj4gPiA+ID4gPiBI
aSBMdWl6LA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IENvdWxkIHdlIHJldmVydCB0aGlzIGNoYW5n
ZT8NCj4gPiA+ID4gDQo+ID4gPiA+IFBsZWFzZSBkb24ndC4gVGhlIGZ1bmRhbWVudGFsIGdvYWwg
b2YgdGhlIHBhdGNoIGlzIHRvIG1ha2UNCj4gPiA+ID4gTVQ3OTIyL01UNzkyNSAqdXNhYmxlKiBv
biBhZmZlY3RlZCBwbGF0Zm9ybXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBNb3Jlb3ZlciwgYWxtb3N0
IGFsbCByZWNlbnQgQU1EIHBsYXRmb3JtcyBzaGlwIHdpdGgNCj4gPiA+ID4gTVQ3OTIyL01UNzky
NSwNCj4gPiA+ID4gcmV2ZXJ0aW5nIHRoaXMgcGF0Y2ggYWZmZWN0cyBxdWl0ZSBhIGxvdCBvZiB1
c2Vycy4gQWxtb3N0IGV2ZXJ5DQo+ID4gPiA+IEFNRA0KPiA+ID4gPiBwbGF0Zm9ybSBJJ3ZlIG1l
dCBzdWZmZXJzIGZyb20gdGhlIGlzc3VlLCBhbmQgdGhlcmUgYXJlIHBsZW50eQ0KPiA+ID4gPiBv
Zg0KPiA+ID4gPiBidWcgcmVwb3J0cy4NCj4gPiA+ID4gDQo+ID4gPiA+IEludGVsIHBsYXRmb3Jt
cyBuZXZlciBzaGlwIHdpdGggTVRLIFdMQU4gTklDcywgc28gSSBjYW4ndCB0ZWxsDQo+ID4gPiA+
IGlmDQo+ID4gPiA+IHRoZSBpc3N1ZSBpcyByZXByb2R1Y2libGUgb24gdGhlbS4NCj4gPiA+IA0K
PiA+IFdlIHN0aWxsIGhhdmUgbm9uLUFNRCBwbGF0Zm9ybXMgd2l0aCBNVDc5MjIvNzkyNSwgd2hl
cmUNCj4gPiAid2FrZXVwIGJ5IEJsdWV0b290aCIgaXMgYW4gZXNzZW50aWFsIGZlYXR1cmUuIElu
IG90aGVyIHdvcmQsIHRoaXMNCj4gPiBjaGFuZ2Ugd2lsbCBoYXZlIGEgc2VyaW91cyBpbXBhY3Qg
dG8gdGhlbS4NCj4gDQo+IE9oLCBwZXJoYXBzIEkgbWlzc2VkIHNvbWV0aGluZyBiZWZvcmUuIFlv
dXIgd29yZHMgd2VyZSBhIGJpdCB1bmNsZWFyDQo+IHRvDQo+IG1lIGF0IGZpcnN0IGdsYW5jZS4N
Cj4gDQo+IFlvdSBwcmV2aW91cyByZXBseSBzYWlkICJ3YWtlIG9uIEJsdWV0b290aCIuIEkgaW50
ZXJwcmV0ZWQgaXQgYXMgVVNCDQo+IHJlbW90ZSB3YWtldXAgdXBvbiBCbHVldG9vY2ggZGV2aWNl
IGNvbm5lY3Rpb24uDQo+IA0KPiAiV2FrZXVwIGJ5IEJsdWV0b290aCIgaXMgY2xlYXJlci4gWW91
IG1lYW50IHVzaW5nIHRoZSBCbHVldG9vdGgNCj4gaW50ZXJmYWNlIGFzIGEgd2FrZXVwIHNvdXJj
ZSB0byB3YWtlIHVwIHRoZSBzeXN0ZW0gZnJvbSBzbGVlcCwgcmlnaHQ/DQo+IA0KPiBIbW0sIGl0
IG1ha2VzIG1vcmUgc2Vuc2UgdG8gbWUuDQo+IA0KPiBNeSBwYXRjaCB3YXMgaW5zcGlyZWQgYnkg
Y29tbWl0IGY0MjkyZTJmYWY1MiAoIkJsdWV0b290aDogYnR1c2I6IE1ha2UNCj4gdGhlIENTUiBj
bG9uZSBjaGlwIGZvcmNlLXN1c3BlbmQgd29ya2Fyb3VuZCBtb3JlIGdlbmVyaWMiKS4gVGhlDQo+
IG1lbnRpb25lZCBjb21taXQgaXMgY29ycmVjdCBhcyB0aGUgcXVpcmt5IGNoaXBzIGNhbid0IHBl
cmZvcm0gcmVtb3RlDQo+IHdha2V1cCBhdCBhbGwuDQo+IA0KPiBJZiBNVDc5MjIvTVQ3OTI1IGNh
biByZWxpYWJseSB3YWtlIHVwIHRoZSBzeXN0ZW0gZnJvbSBzbGVlcCwgbXkgcGF0Y2gNCj4gY291
bGQgYmUgYSBidXJkZW4uIEkgd29uJ3QgaW5zaXN0IGFueW1vcmUgaWYgeW91J2QgbGlrZSB0byBy
ZXZlcnQgaXQuDQo+IA0KPiA+IA0KPiA+ID4gV2UgY2Fubm90IHJlYWxseSByZW1vdmUgaXQgYW55
bW9yZSwgc2luY2UgaXQgaGFzIGFscmVhZHkgYmVlbg0KPiA+ID4gcHVsbGVkLg0KPiA+ID4gVGhl
cmVmb3JlLCBJIHN0cm9uZ2x5IHByZWZlciB0aGF0IHRoZSBpc3N1ZSBpcyBmaXhlZCBzb21laG93
IG9yDQo+ID4gPiBpZg0KPiA+ID4gdGhlcmUgaXMgbm8gb3RoZXIgd2F5IHRoZW4gYSBwcm9wZXIg
cmV2ZXJ0IHBhdGNoIG11c3QgYmUgc2VudCwNCj4gPiA+IHNpbmNlDQo+ID4gPiBJDQo+ID4gPiBk
b24ndCBoYXZlIGFueSBoYXJkd2FyZSB3aXRoIHRoaXMgY29udHJvbGxlciBJIGNhbm5vdCByZWFs
bHkgdGVzdA0KPiA+ID4gdGhpcw0KPiA+ID4gbXlzZWxmLg0KPiA+ID4gDQo+ID4gR290wqAgaXQu
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU29ycnksIE1lZGlhVGVrIHdhc24ndCBhd2FyZSBzb21l
b25lIHN1Ym1pdHRlZCB0aGlzIGNoYW5nZQ0KPiA+ID4gPiA+IGFuZCBpdA0KPiA+ID4gPiA+IGhh
ZA0KPiA+ID4gPiA+IGFscmVhZHkgYmVlbiBtZXJnZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
TVRLIGJlbGlldmVzIHRoaXMgaXNzdWUgaXMgc3Ryb25nbHkgcmVsYXRlZCB0byB0aGUgcGxhdGZv
cm0ncw0KPiA+ID4gPiA+IFVTQg0KPiA+ID4gPiA+IGh1Yg0KPiA+ID4gPiA+IGJlaGF2aW9yLA0K
PiA+ID4gPiANCj4gPiA+ID4gU3RpbGwsIEkgYmVsaWV2ZSB0aGF0IHRoZXJlIGFyZSBzb21lIGlu
dGVyb3BlcmFiaWxpdHkgaXNzdWVzIGluDQo+ID4gPiA+IE1UNzkyMi9NVDc5MjUncyBoYXJkd2Fy
ZSBvciBmaXJtd2FyZSwgYXMgcmVpbml0aWFsaXppbmcgdGhlDQo+ID4gPiA+IFhIQ0kNCj4gPiA+
ID4gcm9vdCBodWIgKGJ5IGxvZ2ljYWxseSByZW1vdmluZyBpdCBmcm9tIHRoZSBQQ0kgYnVzIGFu
ZCBwcm9iaW5nDQo+ID4gPiA+IGl0DQo+ID4gPiA+IGFnYWluKSBkb2Vzbid0IG1ha2UgaXQgcmVj
b3ZlciBhdCBhbGwuDQo+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSBwcm9kdWN0IGxpbmVzIE1USyBk
aXJlY3RseSBzdXBwb3J0IGhhdmVuJ3QgcmVwb3J0ZWQgc3VjaA0KPiA+ID4gPiA+IGlzc3VlLg0K
PiA+ID4gPiANCj4gPiA+ID4gLi4ub3IgZGlkIHlvdSBtZWFuIG5vbmUgb2YgdGhlIGV4aXN0aW5n
IEFNRCBwbGF0Zm9ybXMgYXJlDQo+ID4gPiA+IHN1cHBvcnRlZA0KPiA+ID4gPiBieSBNVEs/DQo+
ID4gPiA+IA0KPiA+IEknbGwgcmVwb3J0IGl0IHRvIGNvcnJlc3BvbmRpbmcgZGVwYXJ0bWVudCB0
byBzZWUgaWYgdGhleSBoYXZlIHN1Y2gNCj4gPiBpc3N1ZS4gKEknbSBub3QgZnJvbSBCbHVldG9v
dGggd2l0aCBBTUQgcGxhdGZvcm0gc3VwcG9ydCB0ZWFtKQ0KPiA+IA0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IERpc2FibGUgd2FrZSBjYXBhYmlsaXR5IHdvdWxkIHNldmVyZWx5IGltcGFjdCB3YWtl
IG9uDQo+ID4gPiA+ID4gQmx1ZXRvb3RoDQo+ID4gPiA+ID4gb24NCj4gPiA+ID4gPiBNVEsncyBv
ZmZpY2lhbCBwcm9kdWN0IGxpbmVzLg0KPiA+ID4gPiANCj4gPiA+ID4gQ291bGQgeW91IGtpbmRs
eSBleHBsYWluICJNVEsncyBvZmZpY2lhbCBwcm9kdWN0IGxpbmVzIj8NCj4gPiA+ID4gDQo+ID4g
U29tZSBwcm9kdWN0cyBhcmUgbW9kdWxlIG1ha2VycyBzZWxsaW5nIG91ciBtb2R1bGVzIHRvIGRv
d25zdHJlYW0NCj4gPiBjdXN0b21lcnMgZGlyZWN0bHkuDQo+ID4gDQo+ID4gPiA+ID4gRnVydGhl
cm1vcmUsIHRoaXMgcGF0Y2ggbG9va3MgbGlrZSBhDQo+ID4gPiA+ID4gd29ya2Fyb3VuZC4gVGhl
cmUgc2hvdWxkIGJlIGEgYmV0dGVyIHdheSB0byBoYW5kbGUgdGhpcw0KPiA+ID4gPiA+IGlzc3Vl
LiBXZQ0KPiA+ID4gPiA+IGhvcGUNCj4gPiA+ID4gPiB0aGlzIGNoYW5nZSBjYW4gYmUgcmV2ZXJ0
ZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgaXNzdWUgaXMgc2V2ZXJlIG9uIGFmZmVjdGVkIHBs
YXRmb3JtcyBieSBtYWtpbmcgdGhlDQo+ID4gPiA+IEJsdWV0b290aA0KPiA+ID4gPiBpbnRlcmZh
Y2UgY29tcGxldGVseSBnb25lLiBJTUhPLCB3ZSBtdXN0IGZpZ3VyZSBvdXQgdGhlICJiZXR0ZXIN
Cj4gPiA+ID4gd2F5IiBiZWZvcmUgcmV2ZXJ0aW5nIGl0LCBvciBlbHNlIGl0J3MgbW9yZSBsaWtl
IGJ1cnlpbmcgeW91cg0KPiA+ID4gPiBoZWFkDQo+ID4gPiA+IGludG8gc2FuZCBieSBzaG91dGlu
ZyAid29ya3MgZmluZSBvbiBvdXIgcGxhdGZvcm1zIiAoVE0pLg0KPiA+ID4gPiANCj4gPiA+ID4g
VGhhdCBiZWluZyBzYWlkLCBJIHRoaW5rIHdlIGNhbiBuYXJyb3cgdGhlIHJhbmdlIG9mIHRoZSBx
dWlyaw0KPiA+ID4gPiBkb3duDQo+ID4gPiA+IHRvIEFNRCBwbGF0Zm9ybXMgb25seS4gRG9lcyBp
dCBtYWtlIHNlbnNlIHRvIHlvdT8gSWYgc28sIEkgd2lsbA0KPiA+ID4gPiBzdWJtaXQgYSBwYXRj
aCBmb3IgdGhpcy4NCj4gPiA+IA0KPiA+IEFzIEkgbWVudGlvbmVkIGFib3ZlLCB3ZSBoYXZlIG1h
bnkgcGxhdGZvcm1zIHVzaW5nIHRoZSBrZXJuZWwNCj4gPiBkcml2ZXIsDQo+ID4gbm90IGp1c3Qg
QU1ELA0KPiA+IA0KPiA+IElmIHRoaXMgY2hhbmdlIGNhbiBiZSBsaW1pdGVkIHRvIHNwZWNpZmlj
IHBsYXRmb3JtICwgaXQgd291bGQgYmUNCj4gPiB0aGUNCj4gPiBiZXN0IHdheSBzbyBmYXIuDQo+
IA0KPiBJIHBsYW4gdG8gc3VibWl0IGFub3RoZXIgcGF0Y2ggdG8gcHJvcGVybHkgZml4IGl0IG5l
eHQgd2Vlay4gSW4NCj4gZ2VuZXJhbCwNCj4gSSB3aWxsOg0KPiANCj4gLSBuYXJyb3cgdGhlIHF1
aXJrIGRvd24gdG8gQU1EIHBsYXRmb3JtcyBvbmx5DQo+IC0gZGlzYWJsZSBVU0IgcmVtb3RlIHdh
a2V1cCBmb3IgcnVudGltZSBhdXRvc3VzcGVuZCBvbmx5DQo+IC0gbGVhdmUgdGhlIHdha2V1cCBz
b3VyY2UgYXMgaXMsIHNvIHVzZXJzIGNhbiBlbmFibGUgIndha2V1cCBieQ0KPiBCbHVldG9vdGgi
IGV2ZW4gb24gQU1EIHBsYXRmb3JtcyBpZiB0aGV5IHJlYWxseSB3YW50IGl0DQo+IA0KPiBIb3Bl
ZnVsbHkgaXQgd2lsbCBtaW5pbWl6ZSB0aGUgaW1wYWN0IG9mIHRoZSB3b3JrYXJvdW5kLg0KPiAN
Cj4gVGhhbmtzLA0KPiBSb25nDQo+IA0KPiA+IA0KPiA+ID4gT2ssIHRoZW4geW91IGd1eXMgcGxl
YXNlIGNvb3JkaW5hdGUuIEkgZG9uJ3Qgd2FudCB0byBzdGFydA0KPiA+ID4gcmVxdWlyaW5nDQo+
ID4gPiBTaWduLU9mZi1CeSAoU09CKSBmcm9tIGRyaXZlciBhdXRob3JzIGJlY2F1c2UgdGhpcyBp
bnN0YW5jZSBzaG93cw0KPiA+ID4gdGhhdA0KPiA+ID4gcmVzcG9uc2UgdGltZSBjYW4gYmUgdmVy
eSBsb25nLiBUaGVyZWZvcmUsIHRoZSBiZXN0IHdheSBmb3J3YXJkDQo+ID4gPiBpbiBteQ0KPiA+
ID4gb3BpbmlvbiwgaXMgdG8gaGF2ZSB0aGUgaXNzdWUgZml4ZWQgaW4gYSB3YXkgdGhhdCB3b3Jr
cyBmb3IgYm90aA0KPiA+ID4gb2YNCj4gPiA+IHlvdS4NCj4gPiANCj4gPiBPZiBjb3Vyc2UsIE1l
ZGlhdGVrIEJUIHRlYW0gYWxzbyBhZ3JlZSB0aGF0IGFueSBpc3N1ZSBuZWVkIHRvIGJlDQo+ID4g
cmVzb2x2ZWQsIEhvd2V2ZXIsIG9yaWdpbmFsIGlzc3VlIGZvciB0aGlzIGNoYW5nZSByZXF1aXJl
cyBmdXJ0aGVyDQo+ID4gdmVyaWZpY2F0aW9uIG9mIEhhcmR3YXJlL2Zpcm13YXJlIGFuZCBldmVu
IFVTQiBiZWhhdmlvci4gQSBkZXZpY2UNCj4gPiB0aGF0DQo+ID4gY2FuIHJlcHJvZHVjZSB0aGUg
aXNzdWUgc3RhYmx5IGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGV4cGVyaW1lbnQNCj4gPiBhbmQN
Cj4gPiBpZGVudGlmeSB0aGUgcm9vdCBjYXVzZS4NCj4gPiANCj4gPiBBcyBtZW50aW9uZWQsIEkn
bGwgZGVsaXZlciBpbnRlcm5hbGx5IHRvIHJlbGF0ZSBzdXBwb3J0IHRlYW0uIElmDQo+ID4gdGhl
eQ0KPiA+IGhhdmUgc2ltaWxhciBzZXR0aW5ncywgTVRLIHdpbGwgYXR0ZW1wdCB0byByZXByb2R1
Y2UgaXQgYW5kIHByb3ZpZGUNCj4gPiBhbg0KPiA+IG9mZmljaWFsIHNvbHV0aW9uLg0KPiA+IA0K
PiA+IFRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIgaW5wdXQgYW5kIHVuZGVyc3RhbmRpbmcuDQo+
ID4gDQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IENocmlzIEx1DQoNClRoYW5rcywNCkNocmlzIEx1
DQoNCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83765E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/2+tkR1A93Xa4HO8cyG6mwUhlC2smAIty3tDXPTMFM=; b=icMr+JWHePt+4op73F/8G5Q+Xv
	BarseJJ/9di6OB9SaMC5f2wsa1j9EMur6Pr1xzcB5RtTeLchJgs1ywIM+BDO6P6XxQEZXOrEPjMTE
	8yvR85sxMnLztCkBVAyKx0Cwthna9rTGYJFamXz1DbTfo5t2ZYo3HFZp6g4XpcjaMQUI8JJItM+ak
	svkJta/tZDfVmPkngVw7fe77uA8Yc2cobDMhxRahDxt73Ncqr+1o5ueiFrU1Uz2Ee93kzJfbvBJnM
	sHposvBKUBv0BOt+giwKGKgr80qXNy/NWbj/gkPDiO6VVqCdtp/BC+2NFirliTNwiTDEHGg+86Cd1
	alik9P3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoYs-00000001goF-0sgx;
	Mon, 06 Jan 2025 14:58:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoOL-00000001dQC-1PWJ;
	Mon, 06 Jan 2025 14:47:42 +0000
X-UUID: 2a2c505ecc3d11ef82ff63e91e7eb18c-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=k/2+tkR1A93Xa4HO8cyG6mwUhlC2smAIty3tDXPTMFM=;
	b=C2fDAJRGEmMpQI6gPBEFGeI9u6jedYqY4FwDhG3w0kFBzK/KsRBzQmipqbj6GE2uqEFY0ye1993s6QDJaORyZ7fIjwEgSOD1mPBb/pIR4oINJa81ZOLgvxFjiKsCfYqTBZQj/Bytb46XSWjPw5YtLS/PnurolvEbDfSUKOzaCiU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:340110f0-fce8-4862-8b40-0f32f8c3259c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:4da56a19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2a2c505ecc3d11ef82ff63e91e7eb18c-20250106
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1678855160; Mon, 06 Jan 2025 07:47:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 22:47:31 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 22:47:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0cdANtCiXcnbwEJzTQvzpmeIfAqM+e4RKtGn9ErVOleXjaG1E+yX4mtlqTqW2uRNnkkwjj/PTu4z4EM/rja9w3LAAhdW5Mg1KVnvdFfECQlmWf4fBN/vHOmCcjRuqJzGAL41HUt23XnEaWZ7e6qIk5xFxe3xiee2dpvOT6MMPsIUhWmz29fZuV/LDqcG494cSnqhdPbSyiogrrH4srHL5igMhDmzRUzQGTvCKXLkMkLu/L0x5YNwIf/yF/Zn5zEtifqiUmwBVqgW/QFF5VfGC++c2W2qfT1/H50tgNVdAUXDUr2sxMetvPpL7I/zThrimK6ULUXwjlbuU9AVKLdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/2+tkR1A93Xa4HO8cyG6mwUhlC2smAIty3tDXPTMFM=;
 b=wpHkTCihHqL7PahJZFAel6VVQgdUs6cCSjEoyLyZQ4lLaR9a/htUU21hCDFWczkwD96zb21Fn9+7L3InHGVz41ILiZFizSzJHsZ4Jma1mq7fIUal9bOhFbg2NBblKSV8Y1jJ+DfGFTg31pni2Bz23+k8PydjDtMWESlM5m8FnvKNiN7qJ07PW7Oj/ai8HufgUZ8ryADOde6K+HnQ/+kT4RsNONQwhr4ANwntHn7FPZowe0fhpmvymwzN+YoKOt7cdnUa7o6ro7Ui/FtNlktD9ezLzxR35bsO3AKLRR3diSn5tmIRxTTLdzOfG4MY2Ur2DNobNTtMrnslRKrXwONYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/2+tkR1A93Xa4HO8cyG6mwUhlC2smAIty3tDXPTMFM=;
 b=vIQsmkFVM7ekyIUDlHVtCu/PCFPdb0dgJfQU5V5apaqJYFyqQWduaEEq0sw+IZnnFtDCK4p9at1UTtSRKARwtszsoF22mM2w0qjfv+ElbVIqrMVVmdw407WaUwWsWdTFDK0c3t9VgbSu/VJU3RbYUC6BcHnJzICJguugf3Cp4dY=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by SI2PR03MB6759.apcprd03.prod.outlook.com (2603:1096:4:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:47:28 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 14:47:28 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
Thread-Topic: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
Thread-Index: AQHbP66d60BnI5dyEEiV1ToVHZBmcLLJQT0AgEDTPoA=
Date: Mon, 6 Jan 2025 14:47:28 +0000
Message-ID: <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
	 <20241126025507.29605-2-chunfeng.yun@mediatek.com>
	 <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
In-Reply-To: <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|SI2PR03MB6759:EE_
x-ms-office365-filtering-correlation-id: 17b3ad4d-7605-429b-e0dd-08dd2e610ac0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUhQM0RMdEZGakp5MXRoTUZxY2ZuTThUcGtpNnlxV1Z0MkRlZUVYYTFSSktj?=
 =?utf-8?B?dGNNM1U5UE9ZZjVHYjI5MHRTcUdQNFFmRG9qRVprZm12bjhVYVpuV1VZSDht?=
 =?utf-8?B?OVBOUWZvNTBoTzNDYjk4Q29sd1RJNitjaEg4WUsvaWhWVlpLRE03c2lXYTNE?=
 =?utf-8?B?anZzOXc1aW96SUdQRW9lUExDWkl5S29RUHZMOUJxYkg4VWMxR0g4TDlpZDYx?=
 =?utf-8?B?enh1L3d1MVF5RFIwa2RSNHR1SlVhcFRxOG5sWnlVdit6Q2lIWFZ2dDBzZVQw?=
 =?utf-8?B?bGFPNlNtL090aEpMMHQ2bk1hVVd0VXQ1U2hBbWswZFdJazMzUjI0SHdVaDBF?=
 =?utf-8?B?QUxaQ3YxUDhCWC9WMFp2THY0cGkxaXJxWmhoSEt4R1NYbzdWWk8xQzBySkxo?=
 =?utf-8?B?eVpaeVBRNzRnKzdOT0tkTUhQaWFtRERWUlErWG1DbHdoUUZkWHJvUjM3OHlI?=
 =?utf-8?B?UEhFMndTb094S1cxTUxmMURxcFovOStFU3N5YitvSVNvYXpYbmdqd1FOK3dO?=
 =?utf-8?B?UVhNNFNIUFZnMUExbU9qQlMwTVFxSzJqR2xVUUIwbExNTG0xczhxVUVlTm5W?=
 =?utf-8?B?dVB0Q2NrWFdUcnNPTXorNnQ0bWpyNHp1SVlTK1ZiRTAxcHNMTXhRQ25LTXh0?=
 =?utf-8?B?bkNBTjNIRFNYL3p0dDVwMk9hYitlcEJISWhDRU5Jb3ZnaVlYTWhRYWVVTmNR?=
 =?utf-8?B?cGY5eEpWTUt3ZllhKyttMnl3QmJvbmxCTEZiNUNSL0tMOVJBMlF4SXFDbEhl?=
 =?utf-8?B?eDFhd0crNWVWNzVWR0FEMTZSUUZUQytJbmVoMFRhVWcwRVNPN3dwSEtFNUw1?=
 =?utf-8?B?VUxFUjVidmRrVU94MDFQd3pxVzFaTHN2cHBid09HcjJqM1RrbmEweFFBalFq?=
 =?utf-8?B?TVQvMUlwdVlQbFAyTTJZb1FtY1M1OWJCaUMvdWVpTUI3b2lGak1KVjNFZm1r?=
 =?utf-8?B?UlQ1SXZVM2RrY2V1aGZVbk5wQUljSDYvMUlkY3dvUzFaODIrMnd4c3JyZE1F?=
 =?utf-8?B?RG9uRjVnSy84aU5sNGM4dHdwOWJqWldhZXNyeW9VOHVYWGlHVVdjOFRwYkw1?=
 =?utf-8?B?eFRVcjJkWjJSdXBzYzJHQW9UdTcvRy9ZM29pTi9KNWRDNE9NVU5pTk5nN0Fn?=
 =?utf-8?B?aDJNMGR2dk5NbytScW1xWDE3QVJLSWMxVDVaakNzNExnc1E1NXpERjJJM3c2?=
 =?utf-8?B?WGl4TmR3a2dnMTJ2a2pFaGxPV1FoblV5UkllbE5sMHRmdEY4VW1oa0tOMDJv?=
 =?utf-8?B?K2IwN2tJVjlTb3RpM2JGOGN5RkVnckRFSk8zMUFaZ1BSMVFYc21QZTRTVSsx?=
 =?utf-8?B?Q0F4V0FNQ3ZJNXZSZzQxYnR0dkVFQjdDTGxXL2NBL2tocW9GSnVUelA0K1kz?=
 =?utf-8?B?Z0d5RCs2SXR5SWtYMytvbTdJQUpSMW1XbFVKNlAxamdGbUFlSjU3blRGMC8x?=
 =?utf-8?B?OTd2RStXT0s5cjA3RVBmeVc1WVlobHQxNFpjSGhEd2JvRWxIM0ZOcXoyZFhv?=
 =?utf-8?B?MTQ0OTVlaU1sWGNlTSttdWFUM1ZEMWVJOUxWakJPMHZoM1ovQmRJdzJqZU8z?=
 =?utf-8?B?b2J1ZlYyUDIrVG5ZVEVMUnlMemJaejZtcFQzSUxYSFZLYi9ibjZYM2txcEtX?=
 =?utf-8?B?TzlWWHBicnM4U045bUVuN1FOOUNST1RpU0NQZzBwbWY3NmZ2VHR4NDFkcWtp?=
 =?utf-8?B?WGpDYjlaT0NBcE5ZbDhpRnhkZE8xZ3JtVkNPem9OOS9WOXk3QTVKNUZBbEJ2?=
 =?utf-8?B?a1VjSmxUTTlLMEdrTXJXL3Vib1BJaXR6UTUxbWJsbCtxa05tNEtBRlJzUHZQ?=
 =?utf-8?B?cE5uanU4WXNISE8ycDJSTk1LOGh4WFRRZkt1VXFiU3RxdGJLY1gwQktvSW9p?=
 =?utf-8?B?L2VOZXMrV0FWV2c0K0kvb2grWXowdjYzNmpmV1JqbE04Zk82MUp3TDZCdC9N?=
 =?utf-8?Q?zhBcJmNF1fB47/f14EtZUPJFW/l+tyVK?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXZYNXVBU2dvMS9yK1lLRENadDMyR3BaenI5VHp5YmR6YWFMM0NoK0RUNFgr?=
 =?utf-8?B?TWh3QksvRm5vNm8yZVdPYnEwd2h3RjhIQnV3S2pablJIUGs1em13TmRTVUNJ?=
 =?utf-8?B?ZCtEWDRaQmNjQ2JBS0FCc2REeXJaMUVqZWxocmtSSGIrcjB3VXZZSzRxNXhN?=
 =?utf-8?B?UTVBTUVVdElpNUdycCtUT0YreUROMFllbHNsQVcxYUR5ekcrTFI2M09BWHNW?=
 =?utf-8?B?a1FDQlBVLytqcGdhNENKcSt5T0EyWFM4OVYwQmRpTmtGRVdqNks0MTJjOWpQ?=
 =?utf-8?B?ZE5WQU1kdVk3OWVqZ2RPQ0R6L1BxRlVqNDZsRS9KQXQzVFV2YUx4MnJRK3FG?=
 =?utf-8?B?ejZtTTFpY3dWdkhrcU95OXBTblhHanZva1JOZTVDczBqU0ZxRW5sNVcrWlgy?=
 =?utf-8?B?YzZKY0lHZzJvSWJvbEZ5U2hPWGxwd0pqYmVzNkVva2xIQmtBWDFrZmJqdkty?=
 =?utf-8?B?ZDZNRGJ5Qnhzc1U1cml0WXFtUVFCMzF0T0xOMXlqWjN6ejYwblg3ek9neDZn?=
 =?utf-8?B?QjlrdnllMFNwSlN6MTJwdGdTdjhERkFnTnZ4Uys5dXd2QmFnbHN1dzRaWjlp?=
 =?utf-8?B?LzlYVnR6RmR4RFAyU0hLL2ZIcTMrMGlheUtPS2JONVpsNUVUNlhTajVNQzNn?=
 =?utf-8?B?OStqY3pKUUlTU3JyY0R6azJVUnFlV2F2N0FsZ3BIWitaZUFBT2R4L0NxVks2?=
 =?utf-8?B?VWdlZDJlWTM3MUJCTWpQOWlpZmpHUngxeGdWSXFpLytaTGJ4dHcrN0pBeXM4?=
 =?utf-8?B?dWhMUXY4WnNIai9pUmFtWnd3eE1BSDR6ZUdQa1VhUzdNL2wzTk13c1VYOXNn?=
 =?utf-8?B?ZVJSeGYwbTVIbzBKaUgxaE15T3ZNdWxHWklDRWNUa0cvamdWcm5YbEE2WEJi?=
 =?utf-8?B?bW9abEV4U211MFM1eHRuQ0VBK3VyN0NLUkw5dUJxTmZkOUxzai9xQ2Z1NFQ2?=
 =?utf-8?B?Z1JtMzhqMWFDYjVDa3V0YWtZTTI4ZUowT0VHMTFRWHFLRkZoa25QaTRSNmNM?=
 =?utf-8?B?VU51K3ZQUFpvNGdKSUhRR0M2TVM4TWtGTUxNNHQxL0UycHNrNVpFTjc0SkRq?=
 =?utf-8?B?V3FPNmk5c2plVGFQdkxyNU1XVTRyMS9BMzY1bWp4c2dReENDYWF0eE9ZdGl2?=
 =?utf-8?B?UkpwYldJLzBUdENSY2h3STFpblAvSlU1cHowRGtqSkRWcnpFSFNDaENLUTZG?=
 =?utf-8?B?M01laWdieXhOTU90WktJOE9rVEY2Njc0UHRNSkdGV09rOWxhdGxjR1FkdGxm?=
 =?utf-8?B?L3NQUE1ORHFQUnFUSTBmOUFmOVNEMUhXdEZLSUd1blBVQkxFR21PcWJNbjFu?=
 =?utf-8?B?UHZLRzBhZW5iNmZDRTNucXNDNEpmOFJrZzluRGRWV0NNSXJvRlNtRExWYk5L?=
 =?utf-8?B?UzBhRXlwNllVTkhhR1VUL1RLc2c3K0Rkay9XaXh3emxZNENITVczVXJmM0pQ?=
 =?utf-8?B?Y2hIUm01THFvYTRXdHJ4elB5ZWxPemp0MlB6VzN1aDNKekxaUUV4b2JGMlBV?=
 =?utf-8?B?QnhoaXdOQ0xVZVNzSG9DbVNVV2pjTUovRlRDd2VNWWhRdE1nUGZNVjNxVVhm?=
 =?utf-8?B?a2FuQzBybUhYZVVkMU81VWdJb1NmQ3FsT21ENnRONTQwRTdncmhCR2t5R2dr?=
 =?utf-8?B?OEdBVXBKWFl4V1ovUnd4cEwxODhPRjJDNkk5NXIxa2FOeE44ckdTVEVOQkt3?=
 =?utf-8?B?SW1TclZDWDEvMXloSHpwUHhHMVRvSDFLYjlhblJldGp0a0srSC9hTlFMRTds?=
 =?utf-8?B?TXhnek90QmZiaEg4djlmZHJ0VkpLQjJ1RHplNlE0MkJqV2VtWTlzMnZaNW9J?=
 =?utf-8?B?MDY4QWtZZnpZZE5mUGw5eG1makdBRGhZeFE5VmhkUk5nMnNiaG1pVWwrdWxx?=
 =?utf-8?B?dWY3UHVybTJxODlhaXp2VXZ5Wk01S29uTndKcUt3TXBERlJoTWY3VjRBNXdl?=
 =?utf-8?B?ZzFZMUdmWDRsb2VXZDBJWWI2TVRFQjd4S2pIRGJDVlJVNzkvRnJIdEhlSmFm?=
 =?utf-8?B?Rm1Qc0VTRnk0RDhhSnNDckszcXZtWnYwN3IvblVxQ1dJMHlic3pDNHVQYnB6?=
 =?utf-8?B?aHJhL3ZlMklpd1Z2V0w0bTV2dUlaVkIrYlZxVDRaUzJEVlAvQnpCSm82Qkpi?=
 =?utf-8?B?RmxVcjBBckhPSmtTQTIrcXJaZFA1WFcxUm9iQStlUDFDQlBLY3ZDM1hyTVRx?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA943D3D014FF44E9DA4E7249389E4EB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b3ad4d-7605-429b-e0dd-08dd2e610ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 14:47:28.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wiso/ZPjXb0vJE6O9YfKUmii3tzHQmTsww9jFOhB8Q4z5PRIPHoob02EZxwww9HllUC2+8A9O+fuMvvVGEUGCuo1dKEAVkLX6xewGjgkPWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6759
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_064741_382886_89A6B2A9 
X-CRM114-Status: GOOD (  23.01  )
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

T24gVHVlLCAyMDI0LTExLTI2IGF0IDA5OjUwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNi8xMS8yNCAwMzo1NSwgQ2h1bmZlbmcg
WXVuIGhhIHNjcml0dG86DQo+ID4gVGhlcmUgYXJlIDIgVVNCIGNvbnRyb2xsZXJzIG9uIG10ODE5
NiwgZWFjaCBjb250cm9sbGVyJ3Mgd2FrZXVwDQo+ID4gY29udHJvbCBpcw0KPiA+IGRpZmZlcmVu
dCwgYWRkIHNvbWUgc3BlY2lmaWMgdmVyc2lvbnMgZm9yIHRoZW0uDQo+ID4gDQo+IA0KPiBJcyB0
aGVyZSBhbnkgTVRVMyBjb250cm9sbGVyIGluIE1UODE5NiwgbGlrZSBhbGwgb3RoZXIgTWVkaWFU
ZWsgU29Dcz8NClllcy4NCj4gDQo+IElmIHNvLCB0aGVuIHBsZWFzZSBqdXN0IGFkZCB0aGUgd2Fr
ZXVwIGNvbnRyb2wgdG8gdGhlIE1UVTMgZHJpdmVyLA0KPiBvdGhlcndpc2UNCj4gd2UgYXJlIGdv
aW5nIHRvIGR1cGxpY2F0ZSB0aGlzIGZvciB5ZXQgYW5vdGhlciBTb0MsIGxpa2Ugd2UndmUgZG9u
ZQ0KPiBmb3IgTVQ4MTkyLA0KPiBNVDgxOTUsIE1UODE4OCBhbmQgTVQ4MTg2IGFscmVhZHkuLi4N
CkV2ZW4gSSBhZGQgaXQgaW4gTVRVMyBkcml2ZXIsIEkgc3RpbGwgbmVlZCBhZGQgaXQgaW4geGhj
aS1tdGsgZHJpdmVyLA0Kc29tZSBwcm9qZWN0cyBvbmx5IHVzZSBob3N0IG1vZGU7DQoNCkkgY2Fu
IGFsc28gYWRkIGl0IGluIE1UVTMgZHJpdmVyIGFuZCBzZW5kIG91dCBuZXcgcGF0Y2hlcy4NCg0K
QnV0IGl0J3Mgbm90IGEgZ29vZCBpZGVhIHRvIGR1cGxpY2F0ZSBpdCBpbnRvIE1UVTMgZHJpdmVy
IGRpcmVjdGx5IGZvcg0Kc29tZSBTb0Mgd2hpY2ggaGFzIGxpbWl0YXRpb24gb24gZHVhbC1yb2xl
IHN3aXRjaCB3aGVuIHVzaW5nIHVwc3RyZWFtDQpkcml2ZXIuDQoNClRoYW5rcw0KDQo+IA0KPiBD
aGVlcnMsDQo+IEFuZ2Vsbw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3VzYi9ob3N0
L3hoY2ktbXRrLmMgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1tdGsuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS0NCj4gPiBtdGsuYw0KPiA+IGlu
ZGV4IDMyNTJlM2QyZDc5Yy4uMzEyMjM5MTJiMGI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1tdGsuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGsu
Yw0KPiA+IEBAIC0xMTMsNiArMTEzLDEyIEBADQo+ID4gICAjZGVmaW5lIFdDMV9JU19QXzk1ICAg
ICAgICAgQklUKDEyKQ0KPiA+ICAgI2RlZmluZSBXQzFfSVNfRU5fUDBfOTUgICAgICAgICAgICAg
QklUKDYpDQo+ID4gDQo+ID4gKy8qIG10ODE5NiAqLw0KPiA+ICsjZGVmaW5lIFBFUklfV0tfQ1RS
TDBfODE5NiAgIDB4MDgNCj4gPiArI2RlZmluZSBVV0tfVjFfN19DVFJMMl9NQVNLICAweDUNCj4g
PiArDQo+ID4gKyNkZWZpbmUgV0NQMV9JU19FTiAgICAgICAgICAgQklUKDcpIC8qIHBvcnQxIGVu
IGJpdCAqLw0KPiA+ICsNCj4gPiAgIC8qIG10MjcxMiBldGMgKi8NCj4gPiAgICNkZWZpbmUgUEVS
SV9TU1VTQl9TUE1fQ1RSTCAweDANCj4gPiAgICNkZWZpbmUgU1NDX0lQX1NMRUVQX0VOICAgICBC
SVQoNCkNCj4gPiBAQCAtMTI5LDYgKzEzNSw4IEBAIGVudW0gc3N1c2JfdXdrX3ZlcnMgew0KPiA+
ICAgICAgIFNTVVNCX1VXS19WMV80LCAgICAgICAgIC8qIG10ODE5NSBJUDEgKi8NCj4gPiAgICAg
ICBTU1VTQl9VV0tfVjFfNSwgICAgICAgICAvKiBtdDgxOTUgSVAyICovDQo+ID4gICAgICAgU1NV
U0JfVVdLX1YxXzYsICAgICAgICAgLyogbXQ4MTk1IElQMyAqLw0KPiA+ICsgICAgIFNTVVNCX1VX
S19WMV83LCAgICAgICAgIC8qIG10ODE5NiBJUDAgKi8NCj4gPiArICAgICBTU1VTQl9VV0tfVjFf
OCwgICAgICAgICAvKiBtdDgxOTYgSVAxICovDQo+ID4gICB9Ow0KPiA+IA0KPiA+ICAgLyoNCj4g
PiBAQCAtMzgxLDYgKzM4OSwxNiBAQCBzdGF0aWMgdm9pZCB1c2Jfd2FrZXVwX2lwX3NsZWVwX3Nl
dChzdHJ1Y3QNCj4gPiB4aGNpX2hjZF9tdGsgKm10aywgYm9vbCBlbmFibGUpDQo+ID4gICAgICAg
ICAgICAgICBtc2sgPSBXQzBfSVNfRU5fUDNfOTUgfCBXQzBfSVNfQ185NSgweDcpIHwNCj4gPiBX
QzBfSVNfUF85NTsNCj4gPiAgICAgICAgICAgICAgIHZhbCA9IGVuYWJsZSA/IChXQzBfSVNfRU5f
UDNfOTUgfCBXQzBfSVNfQ185NSgweDEpKSA6DQo+ID4gMDsNCj4gPiAgICAgICAgICAgICAgIGJy
ZWFrOw0KPiA+ICsgICAgIGNhc2UgU1NVU0JfVVdLX1YxXzc6DQo+ID4gKyAgICAgICAgICAgICBy
ZWcgPSBtdGstPnV3a19yZWdfYmFzZSArIFBFUklfV0tfQ1RSTDBfODE5NjsNCj4gPiArICAgICAg
ICAgICAgIG1zayA9IFVXS19WMV83X0NUUkwyX01BU0s7DQo+ID4gKyAgICAgICAgICAgICB2YWwg
PSBlbmFibGUgPyBtc2sgOiAwOw0KPiA+ICsgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAg
Y2FzZSBTU1VTQl9VV0tfVjFfODoNCj4gPiArICAgICAgICAgICAgIHJlZyA9IG10ay0+dXdrX3Jl
Z19iYXNlICsgUEVSSV9XS19DVFJMMF84MTk2Ow0KPiA+ICsgICAgICAgICAgICAgbXNrID0gV0NQ
MV9JU19FTjsNCj4gPiArICAgICAgICAgICAgIHZhbCA9IGVuYWJsZSA/IG1zayA6IDA7DQo+ID4g
KyAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICBjYXNlIFNTVVNCX1VXS19WMjoNCj4gPiAg
ICAgICAgICAgICAgIHJlZyA9IG10ay0+dXdrX3JlZ19iYXNlICsgUEVSSV9TU1VTQl9TUE1fQ1RS
TDsNCj4gPiAgICAgICAgICAgICAgIG1zayA9IFNTQ19JUF9TTEVFUF9FTiB8IFNTQ19TUE1fSU5U
X0VOOw0KPiANCj4gDQo+IA0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17278D58CC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESdbV9I9gdogdj9ozusuzRgVudGEX9CBvaEBUmqJbPQ=; b=KsILte083Ua9IWlaD4G+Jn+b2m
	Kfk+9XFM6wvKY6wHN5Ph9PtPh8KzHnWeQf7lNrwBLh7frgT9m4wOjWTPYCXHudAFYOnu3KmBZLNQe
	+BxIKwkoyVQ5r8E2+vnkTvxcP18U6DoQcf/pMrljHmSQsCR88wqzPlj2zvHwG1SNKT56eDR+832tD
	itJrDdiRlpaa/lGryQswEzmYdiL27zZ3fPkhwrOwtV2ej1owSMppCn9JyCBcR91ShLCaGIxcjX9/j
	Ejh2OjH39IgziEVsSuKEnYNiPAgAWl+G17HjDHdXE+nx8wr+ORvHgaQDg1THDMlH/Y9ww4KfjUizZ
	UZpNRptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4VzD-0000000FxGP-0wwM;
	Mon, 23 Mar 2026 03:29:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4VzA-0000000FxEv-3rDd;
	Mon, 23 Mar 2026 03:29:50 +0000
X-UUID: 88d39686266811f1a6de359d7043e138-20260322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ESdbV9I9gdogdj9ozusuzRgVudGEX9CBvaEBUmqJbPQ=;
	b=TF4dLSmZHa96K7206KXUkbuf0ydhYNjKsrJT8li7e6OTwUyUuJyhobPis4iwdkewGCYXNHdL3JW/Vd86s1obdNahLBwj/CRTEpZ2whce72ICrBt1b+WWDfO8tIyMZrrpIVDKi5zcMv4q36lY8ypRU89MdUGwia7ar1Ex9/B6t7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1cc8b5b4-e46e-4e36-9fa3-fa7c3ada5e7d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1b761794-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 88d39686266811f1a6de359d7043e138-20260322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1358282389; Sun, 22 Mar 2026 20:29:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 23 Mar 2026 11:29:41 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 23 Mar 2026 11:29:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY7ExhzxVfzTibcSGeRl2LEOPLSO9dqfTVb+nl2mC76ryxm2azmdJj+x82sHImBekQHOgGz++EUt73OBWMaD2OQ1XPII1ixL0mmFhITxST091CbTxRIhgth52JzTU4MM4vo5JfVtepbXMZI910S1tWFryTB1oz9t/OvxKerF6IAKYCE5v1K85bMzX677aWb6rou7f4yHwWnmHyFGv317kxnVox5O/y51JcUOa8GjlP8QthByO7QAqHVHBdk9BQKImohoV8/K3Vkwi4LZVtt9F7gCcEdmuVt3TUHQ4M0EIAIlb+I7EkuiCvvXAHMfTGH55iGb5CiE6/ShuRwCgej3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESdbV9I9gdogdj9ozusuzRgVudGEX9CBvaEBUmqJbPQ=;
 b=RUjaveOWQMeiiUFfcfgofD+AFXgpxgGO9ZwYRw2lbs+kTAsZXlF2SYgeCwZQrMUY366t/N9nRma8ldKopEiowdO9cuSmTWUtp+BThELY7Oq2qoY7E+lASbSfZ0vWKPbz6/ZyLAKr4tlmxaLanTfqJfgTtM2eEd8X4mE8ZAVHqDe1kfu8u54DwVAgW0ZtsWI+oqwKSbQPyuBcUzh3A1R1Oc4sxNvdmlj1GoOQRzhz69DrNNkYkqsyI0d0J0dLC/7QOpOBMTpfNwUEZqFoEzUZGS94lpT+ytjwo6yRYNtVy35N2RyTmObNyfqlmFpEKlf9ec6hKFiOVuNF8bsi/bfmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESdbV9I9gdogdj9ozusuzRgVudGEX9CBvaEBUmqJbPQ=;
 b=EF8axrftTRZO+tfkl+VYjNkXUhWzH81uruOsq/+Vkfq+YgTXSsnxiH5//uqVJjsbMsY2LmIRCjPqJsWdJgOrvfWcx8FgCe3vNbzvDgZbT/wbH/S0bhT5Gxbme9eQhwq0qCWrUigch5YkuKe/HWATK6d7zwn7+qpu9L09TX5gsH0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SE2PPF5C1DD1611.apcprd03.prod.outlook.com (2603:1096:108:1::49a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 03:29:37 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9723.028; Mon, 23 Mar 2026
 03:29:36 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 0/9] Enable video decoder & encoder for MT8189
Thread-Topic: [PATCH v8 0/9] Enable video decoder & encoder for MT8189
Thread-Index: AQHcuC7D9hPv3JhQdkCKwlSOIYvwkbW3ZW2AgAQUvgA=
Date: Mon, 23 Mar 2026 03:29:35 +0000
Message-ID: <e3513795d0a95afa0410f9e8533c5f4f43b3ec6b.camel@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
	 <38e0241fe56f9d3af2de57b6380368fdcf5acc64.camel@collabora.com>
In-Reply-To: <38e0241fe56f9d3af2de57b6380368fdcf5acc64.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SE2PPF5C1DD1611:EE_
x-ms-office365-filtering-correlation-id: e31027ba-6f7e-46fb-a3ec-08de888c6827
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: mJv/ogxVb2pTOAFgVTumfAErvnCl7hqztwRM+ppJYKwyLTnxG3EvCo8Qs1X+QjXb7kyD18IPn/O0VUmgbUVbTEVX4pzI9OqXykvOlrmUNlwbY+SpJA2zXuJGqAqNWC2fdp6bCHs3OQLRoC4EghGyFYqNA6vasTJ2u7PSC/I5r4Addjer/OVGSAnIN6PpTSr4gF1oB4on5+oi4Zh4g3BKqgyPcBJ8l90vubdkcVHUawfONKTP71rjL6mgM2LcjoXYudFThuXMzwEW7/8iWMJISYSahbzux0roR7dOMYuIfPr4StBCe+SSCD8DLnFvIQtnpvNPvVUCbbkNaC7q4PSWkfE6vOVLKM4zdYXXA8HddQif6XZ0qM+1GxZPX5A9g3Om1HlGyTPco+091XpnLQUCJDC1/ArB0sm+XjWxI99QbsCYcCULr6w8F3h4pEcaWH4C4LsqlgfYFTd253vADf7Rexvyli90izFj73I5Oae1qmimcg27BTvXFagHeQ4C8z5Y71WdB6hikcli2jsKrj/7HJFqhArNGp9nqrFlWhRPhuia4nQbCq6E7pDWV1CeDVp/usQ3pnddrV9EMxP7uB/rG8WJ+NGXphR9NByW1UZRYIio7vhihEdGkEhJ5gB23f/rNuENAJinvowuF/V3FFTSVR5cm0T2q05v6i4kB7Jqgsuds7RA8d3XlRgToFUs24M6+tQSpbi4aAc+j0hQyVL3ZT/lA+1rGP+R5wyfQmpMEY5OACZgstIjJ2C8O86miw6C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUFTNzNaOEFnUGhQcldkVGtYYjhmbG1GWXVIWUVXWWVwb3dYZEhrWXo0anc2?=
 =?utf-8?B?cEhiaVZXWDB0RlJLTjJPbkJPanEvNGlhNVd1VW01dFRqVHE5WFYrdnJYZ3BT?=
 =?utf-8?B?dXpWUmhuK1J4TzVobjhaR3lDbnRwcm05LzZadm8vV3hIejlRYXBvKzB0TXlB?=
 =?utf-8?B?MmY2UTVPemQwK3JxYmx3c1plT0diVDM2TWRBdVlUOEtkWVhmVDViRzgzRklt?=
 =?utf-8?B?NDBLaTZyQ083OWUwbnMvQkkrbHZGZGZTN1JncG1TTlJ1Z2FqQ2FmNVdkM3R5?=
 =?utf-8?B?SHVnWlVaTkJxb2tNcDlIMHBDWDYzZm54UE9ZeVJYZGpqZ09pNHQrL2I3TkI4?=
 =?utf-8?B?b3dIM0JrWkR5WWc2SVBaYXdMdE5VQzVMeGt2Tm5PeHZoZTdsbTAra09lSVor?=
 =?utf-8?B?VERrYVQ3WURCOUF2VWUxZjlrZUM2dktYSFF5dzRXRi8wdnlnODY1YUJtZ2xu?=
 =?utf-8?B?RnFnbUYvVStxS2NDMVA2V1hHMHN4UTJtOVlhckF0VityWWRNMksxaGNVTFJJ?=
 =?utf-8?B?N0duZER2djJ0d0U1eHUzRlhYcGM2dnQyUHNYZlRIMk41bUZzVk1xQ0NZcDJQ?=
 =?utf-8?B?U3o5Z1JiR2ZmaDVKVWlyMGF4Nk96Nk5oWWVzQi9SYmowNWtqWDdJc2g5eExB?=
 =?utf-8?B?N3hTdVZ3Y2FXNktpaktNOHJ5Qm9VRHpodVprTHh1Vy9HanQzUWNDQ2dKejVj?=
 =?utf-8?B?MHFXTEdNTzB1ZStUKzJBVU9GeUlST0ZrWEgxbmp5QXBmZUNuZEZlQTZ0ZnpW?=
 =?utf-8?B?bGdGbmZPNVI2cTFuRVFuTlRnanZaU1R3WjBmRGcxQ3UyWW9BTFQrMmsvNXVG?=
 =?utf-8?B?b1dXekk0N05YWWNuVW4vSktjVmE4Wnd5WE5HeTQ2UFdGcDlLZzNvRks1QVBn?=
 =?utf-8?B?dEg0N3RFM0pTMlVuNTM5QjlRV1cwREZYWWNUOWt0YUdyaW9NMG5FTWMyMHRo?=
 =?utf-8?B?bUxBc0NrTGZwdFhrenBiZkkyOEYxdWU2MzRoVFdNWWUrajR5K2ZDRFdKTVN0?=
 =?utf-8?B?WUxsYjhQWFRDeFF3QkJveG9vRHRWNHUzY3pUWG9qMkhOZ1dxRzVpNm9vbGJ0?=
 =?utf-8?B?aCt5bXAvbGtOWFpWZ01EaVhzVWVwd05sVkVNS1Nzd3NZeEliYlVBWERxSUtC?=
 =?utf-8?B?MkpxN09CWlhkT25zaGxPcmxPdGNaZ3UralQzNGs5L2s4ZWxhUDhqa3l1KzV5?=
 =?utf-8?B?b1FBU3JFdW5PUXNRczVXcnJzMjN0NWdhSFFXZ3YvcXFNcG5yaDRlRmhlUDlW?=
 =?utf-8?B?ZzFpbnQraWZ0ZmhncUhTWlphNUFOb205QStJV3dOdjU3bytsQkF5R0tYTXU2?=
 =?utf-8?B?RStaM3VTZGxndG8vMWhPdFFTWlBRcndDblNsVXNnVGZDbXdHRjZvL01tV1Ew?=
 =?utf-8?B?VHhualQwNFlPMUJEcm5wWFMxV2M1MlF6VWd5RjU2YnFmeEZnNWczaFFCUGRz?=
 =?utf-8?B?eXQ0WUtiV1VTNGZxWmwxbzlRZ01DVHgwYjA0NTdKV3NGN25rdmJMTjRBTWIw?=
 =?utf-8?B?WWdyOXk1Vms1emlRMzZJQ2h4eTFwYWJ0czAzempPL3BzV2EwdDZvTngzcERa?=
 =?utf-8?B?eHpkZnNJY0JIa0RndFlKMjZxQnNTc0ZVM2hCRFI2ZzZGU05tRTJTZnAvTjBw?=
 =?utf-8?B?VlRYYm8xb1RpaURFZjFvK2poYUh4NWZzdnJEeFkrRkJlVU4wN2xmeWFORDdj?=
 =?utf-8?B?OTc1OFJ0bnp1YWZza1R0ZWs2YTJlTFRWOThHVWNsZVZ5NU9GY3B1NnA3c2ts?=
 =?utf-8?B?WW5QWkVDTThoT3FDenEwd1RZOHlkZXQ2cktPMmZhYlNZWFRsUXhweGtFWXZV?=
 =?utf-8?B?Y3RVRng2ME5hTjVXWTdqN0xzVUROclpQUUwxNGNHeUQ0Q1FIZkczcE1WalVx?=
 =?utf-8?B?OENVK1c4M0lPWS9KODVseVRZZTJIUVdNdjFYakVScDh0ZVpIV0pIdlJJOUgw?=
 =?utf-8?B?V3lSenlFcGI1TVo2dDdHcUlySVpMbjlGc1g0K1VkTEhoTms5MHRwdExSL1B0?=
 =?utf-8?B?RzI5MVFuaUoweFN2ajA1YmJ3ZmpZUEd0RkxxTmhrZ0orckRidzFxUGRCM1NI?=
 =?utf-8?B?cjVDU1RhMjNLeWJpbUJJZE5QREMyRy9pR216UzBKaWV5VTF1SGJSa1N6Rmoy?=
 =?utf-8?B?SXlIeUkwWHJtUStKaHlVM25KRzFjRGVVSVZ3VmwxajROUVRXSU84MU5kamE2?=
 =?utf-8?B?QlFHUE5LVlJ6VUMzVEJ0OCtDRlI3S29USTBPNnVXS3Z3NVVoUWlXMGZraW9v?=
 =?utf-8?B?cjRuNVpWUG5yV0l5dmFJeWE4dVR2bjFmdlpxNEw0OFdJNUxienJTZmJ5eUtN?=
 =?utf-8?B?SkI5RDZjMTBiRlNDRjF4dnppU2VyOXEvVlhacGI1TXJabWswczV3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C85083326F0E894995975C7ACA18C074@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N6r37XBDpX/AhqqyYzvllh5TRHbXYWmSEeUzpMJTtQiM3ZUeYQS/vk6UZChuZigkXhf+dAW9pnrsDnU3Ol8BPa5gJPI54EytsigVfxkeTWzGfap9UxP5eJDu646RtiJVG8eLUn01WNohUR+6frv5nV1tfJd6XRSnTwSHvbl/7YEncoBIb8tB8+lUqltynv7WEaT/znAQIn7SeoegiEmgGwISuv9fr/0zlL36EG/7aN6GLZf7WN+sce47QPdztGi+Sz6Nt07YGOEFkTswC/EkmxPVX2ILuKPZF9UYEZSXqxFwKPeDA0EfBGN/mFMUm1n6YDu1TpT2kTVtt55HX97Jsw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31027ba-6f7e-46fb-a3ec-08de888c6827
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 03:29:35.7261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDCcpRqKmbC2umXI15DJClzV8TEgm0r1WPix0KXfvEH37Ea8qhe4hFdaatwdLXq1sothE+htegi4Bk8UUkRi2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF5C1DD1611
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_202948_986188_FBFB6F0C 
X-CRM114-Status: GOOD (  25.60  )
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

T24gRnJpLCAyMDI2LTAzLTIwIGF0IDA5OjEwIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBLeXJpZSwgWXVuZmVpLCBJcnVpLA0KPiANCj4gTGUgdmVuZHJlZGkgMjAgbWFycyAyMDI2
IMOgIDEzOjU5ICswODAwLCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gDQo+IA0KPiBbLi4uXQ0K
PiA+IFRoaXMgc2VyaWVzIHBhdGNoZXMgZGVwZW5kZW50IG9uOg0KPiA+IFsxXQ0KPiA+IA0KaHR0
cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1tZWRpYS9wYXRjaC8yMDI2
MDIxMTA1NDE0OS4yNzI0OS0yLXl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbS8NCj4gPiBbMl0NCj4g
PiANCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVkaWEvcGF0
Y2gvMjAyNjAzMDIwMzUyNDQuODk5NC0yLWlydWkud2FuZ0BtZWRpYXRlay5jb20vDQo+IA0KPiBX
aGlsZSB0aGlzIG9uZSBpcyBub3cgcmVhZHksIGl0IHN0aWxsIGNhbid0IGJlIG1lcmdlLCBiZWNh
dXNlIHRoZQ0KPiBvdGhlciBzZXJpZXMNCj4gaXQgZGVwZW5kcyBvbmUgaGF2ZSBub3QgYmVlbiB1
cGRhdGVkIHRvIHVzZSB0aGUgcGRhdGEgcHJvcGVybHkuIEluDQo+IGZhY3QsIGl0cw0KPiBxdWl0
ZSBsaWtlbHkgdGhhdCBzb21lIG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWUgbXVzdCBiZSBt
b3ZlZCB1cA0KPiB0aGUgY2hhaW4uDQo+IFRoaXMgdHlwZSBvZiBsaW5rZWQgc3VibWlzc2lvbiBp
cyBtYWtpbmcgbXkgbGlmZSBleHRyZW1lbHkgZGlmZmljdWx0LA0KPiBhbmQgY2F1c2VzDQo+IG1h
c3NpdmUgZGVsYXlzLg0KPiANCj4gQmFzaWNhbGx5LCBpbiBhIGNoYWluIG9mIDMgc2VyaWVzIChh
bmQgcHJvYmFibHkgNCBzaW5jZSB0aGUgZmlyc3Qgb25lDQo+IGRvZXMgbm90DQo+IGFwcGx5KSwg
dGhlIHJlZmFjdG9yaW5nIHRoYXQgY2F1c2VzIGFsbCB0aGUgc2VyaWVzIHRvIG5vdCBiZSBhY2Nl
cHRlZA0KPiBpcw0KPiBoYXBwZW5pbmcgaW4gdGhlIHRoaXJkIG9uZS4gQW5nZWxvIGFuZCBJIGhh
dmUgYmVlbiBjbGVhciBmb3Igd2Vla3MsDQo+IGlmIHlvdSBuZWVkDQo+IGEgY29uc3RhbnQgdmFs
dWUgZm9yIGEgcGxhdGZvcm0sIGl0IGdvZXMgaW4gdGhlIHBsYXRmb3JtIGRhdGEuIERvbid0DQo+
IGRvIHN3aXRjaA0KPiBvZiBzdHJjbXAgYXQgcnVudGltZSwgdGhlc2UgYXJlIGNvbnN0YW50cyBh
bmQgd2UgYWxyZWFkeSBkaWQgc3RyaW5nDQo+IG1hdGNoaW5nIHRvDQo+IGluIHRoZSBwcm9iZSB0
byBmaW5kIHRoaXMgcGRhdGEuIE9uY2UgdGhlIG1pc3NpbmcgZGF0YSBpcyBhZGRlZCwNCj4gc2lt
cGx5IG1ha2UgYQ0KPiBmaW5hbCBwYXRjaCBhZGRpbmcgdGhlIHBkYXRhIHN0cnVjdHVyZSBmb3Ig
dGhlIHBsYXRmb3JtLiBVc2UgdGhpcyB2OA0KPiBvZiB0aGUNCj4gTVQ4MTg5IHN1cHBvcnQgYXMg
cmVmZXJlbmNlLCBpdCBpcyBhcyBJIHNhaWQgcmVhZHksIGJ1dCBpdCBkb2VzIG5vdA0KPiBhcHBs
eSBkdWUgdG8NCj4gYnJva2VuIGRlcGVuZGVuY2llcy4NCj4gDQo+IEkgY2FuJ3QgZWFzaWx5IGZp
eCB0aGlzLCBzbyBwbGVhc2Ugd29yayB0b2dldGhlciwgc3luY2hyb25pemUgeW91cg0KPiBzdWJt
aXNzaW9ucw0KPiBzbyB0aGF0IHdlIGNhbiBnZXQgdGhlIE1UODE5NiBhbmQgTVQ4MTg5IHN1cHBv
cnQgZmluYWxseSBtZXJnZWQuDQo+IA0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQoNCkRlYXIgTmlj
b2xhcywNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBkZXRhaWxlZCBmZWVkYmFjayBh
bmQgcGF0aWVudCBndWlkYW5jZSBvbg0Kb3VyIHBhdGNoIHNlcmllcy4NCldlIGdyZWF0bHkgYXBw
cmVjaWF0ZSB0aGUgdGltZSBhbmQgZWZmb3J0IHlvdSBoYXZlIGRlZGljYXRlZCB0bw0KcmV2aWV3
aW5nIG91ciBzdWJtaXNzaW9ucy4NCldlIGZ1bGx5IHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyBy
ZWdhcmRpbmcgdGhlIGRlcGVuZGVuY3kgYW5kDQpzdHJ1Y3R1cmFsIGlzc3VlcyBiZXR3ZWVuIHRo
ZSBwYXRjaCBzZXJpZXMuDQoNCkFsbG93IG1lIHRvIGV4cGxhaW4gb3VyIGN1cnJlbnQgc2l0dWF0
aW9uIGFuZCBkZXZlbG9wbWVudCB0aW1lbGluZToNClRoZSBNVDgxOTYgcGxhdGZvcm0gZGV2ZWxv
cG1lbnQgd2FzIGluaXRpYXRlZCBlYXJsaWVyIHRoYW4gTVQ4MTg5LCBhbmQNCmR1cmluZyBpdHMg
ZGV2ZWxvcG1lbnQgY3ljbGUsDQpzZXZlcmFsIGNyaXRpY2FsIGJ1ZyBmaXhlcyB3ZXJlIGltcGxl
bWVudGVkIGluIHRoZSBNVDgxOTYgcGF0Y2hzZXQuDQpUaGVzZSBmaXhlcyBhcmUgZXNzZW50aWFs
DQpmb3IgdGhlIHN0YWJpbGl0eSBhbmQgcHJvcGVyIGZ1bmN0aW9uaW5nIG9mIHRoZSB2Y29kZWMg
ZHJpdmVyLg0KSWYgd2Ugd2VyZSB0byBieXBhc3MgdGhlIE1UODE5NiBwYXRjaGVzIGFuZCBkaXJl
Y3RseSByZWJhc2UgdGhlIE1UODE4OQ0KcGF0Y2hlcyBmb3IgdXBzdHJlYW0gc3VibWlzc2lvbiwN
CnRoZSB2Y29kZWMgZHJpdmVyIHdvdWxkIHVuZm9ydHVuYXRlbHkgaW5oZXJpdCB0aGVzZSB1bnJl
c29sdmVkIGJ1Z3MuIE9uDQp0aGUgb3RoZXIgaGFuZCwNCmlmIHdlIHdlcmUgdG8gaW5jb3Jwb3Jh
dGUgYWxsIHRoZSBidWcgZml4ZXMgZnJvbSBNVDgxOTYgaW50byB0aGUgTVQ4MTg5DQpwYXRjaHNl
dCwNCml0IHdvdWxkIGNyZWF0ZSBhIG1peHR1cmUgb2YgYm90aCBNVDgxOTYgYW5kIE1UODE4OSBj
aGFuZ2VzLCB3aGljaA0Kd291bGQgbm90IGJlIGEgY2xlYW4NCm9yIG1haW50YWluYWJsZSBzb2x1
dGlvbiBhbmQgZ29lcyBhZ2FpbnN0IHByb3BlciB1cHN0cmVhbSBwcmFjdGljZXMuDQoNCkdpdmVu
IHRoaXMgZGVwZW5kZW5jeSBjaGFpbiwgd2UgYmVsaWV2ZSB0aGUgbW9zdCBhcHByb3ByaWF0ZSBw
YXRoDQpmb3J3YXJkIGlzIHRvIHByaW9yaXRpemUNCmNvbXBsZXRpbmcgdGhlIE1UODE5NiBwYXRj
aCB1cHN0cmVhbSB3b3JrIGZpcnN0LiBPdXIgdGVhbSBpcyBmdWxseQ0KY29tbWl0dGVkIHRvIHB1
dHRpbmcgb3VyIGJlc3QgZWZmb3J0cw0KaW50byBleHBlZGl0aW5nIHRoZSBNVDgxOTYgcGF0Y2gg
c2VyaWVzIHJldmlldyBhbmQgcmV2aXNpb24gcHJvY2Vzcy4NCk9uY2UgdGhvc2UgcGF0Y2hlcyBh
cmUgc3VjY2Vzc2Z1bGx5IG1lcmdlZCwNCnRoZSBNVDgxODkgc2VyaWVzIGNhbiB0aGVuIHByb2Nl
ZWQgY2xlYW5seSB3aXRob3V0IHRoZXNlIHN0cnVjdHVyYWwNCmNvbmNlcm5zLg0KDQpXZSBzaW5j
ZXJlbHkgYXBwcmVjaWF0ZSB5b3VyIGV4cGVydGlzZSBhbmQgdGhlIGNvbnN0cnVjdGl2ZSBndWlk
YW5jZQ0KeW91IGhhdmUgcHJvdmlkZWQgdGhyb3VnaG91dCB0aGlzIHByb2Nlc3MuDQpZb3VyIGZl
ZWRiYWNrIGhhcyBiZWVuIGludmFsdWFibGUgaW4gaGVscGluZyB1cyB1bmRlcnN0YW5kIHRoZQ0K
ZXhwZWN0YXRpb25zIGFuZCBwcm9wZXIgdXBzdHJlYW0gcHJhY3RpY2VzLg0KV2UgY29tbWl0IHRv
IGRpbGlnZW50bHkgYWRkcmVzc2luZyBhbGwgcmV2aWV3IGNvbW1lbnRzIGFuZCB3b3JraW5nDQpj
bG9zZWx5IHdpdGggeW91IHRvIGVuc3VyZQ0Kb3VyIHBhdGNoZXMgbWVldCB0aGUgcmVxdWlyZWQg
c3RhbmRhcmRzLg0KDQpUaGFuayB5b3Ugb25jZSBhZ2FpbiBmb3IgeW91ciBwYXRpZW5jZSBhbmQg
c3VwcG9ydC4gV2UgbG9vayBmb3J3YXJkIHRvDQpjb250aW51aW5nIG91ciBjb2xsYWJvcmF0aW9u
DQphbmQgZGVsaXZlcmluZyBoaWdoLXF1YWxpdHkgcGF0Y2hlcyB0aGF0IGJlbmVmaXQgdGhlIGNv
bW11bml0eS4NCg0KQmVzdCByZWdhcmRzLA0KS3lyaWUNCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 03:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=; b=hBMZGPTOjc6MAnEnJqsviboZ6o
	bM6mCRCQL3IdSUlrdNmhDigeRZ5DfcNcrnuReyAxIFcFULOFDkZBT4Ku47XJwlpCsVL6dXklrTVvg
	4PL7CXC7lzATu4xdnSG5JlFwOuAqcwZPqTHyiy52TG4OAKBHcgUfKgmFNrA3ABr3yBzRZ+g/kmXZH
	gLEpAav2hXH4v7Nxe07uS+NODOrmbBQnxR/wXGR4z84K7tyKNLV7rrn7IZzJ85Kp1ni+VZefiXdSl
	7P+sNenJQ7bADCMQzDjEQm1GjLoEtHPWmyM8udB1/twmCCfWXLx7fFDKg4wYtHJ9rjmC18yBX6jV8
	v34y8ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7N3-000000082Gn-1HvV;
	Mon, 13 Jul 2026 03:30:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7N0-000000082G6-1VIq;
	Mon, 13 Jul 2026 03:30:15 +0000
X-UUID: 27739d907e6b11f1afed4741b24580c9-20260712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
	b=AdbfdH6GeY84Fpql9/8Hu7NDOgis47Jxad1G8MJqfjgfNG6BxYRv9AUUg+TunZ4qZBd+C4RSBSSMBYIMhGPhoMeW1eDCqbiEwTpQiR51ViZbovQmatzcZUWoISlStxg6lnFtAFiNvfVUBF4+0hpg6T7LWA2ZxuR6jOI/z04m5Ag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:caca6082-b3ed-4495-bcb4-4d1e9da607d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:0dad05f0-ff2f-4558-917b-20aef0550222,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27739d907e6b11f1afed4741b24580c9-20260712
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 812476811; Sun, 12 Jul 2026 20:30:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 11:30:08 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 11:30:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/hiYP9sKY4nGSWmy2DlS7hrMwcM+93VWSWJ8eAZMXYC6gH7B3KwF/omDItPLc0y6URNR+yaWQoP+p1zcF0/WyYUcY+d6hYzyI+3b/vEwjEICFfAwwD6XpkmRwqnOJFlfvAN51W673Dnh4+aj1nQs4wahDf48OkahDGVrq2ACYZ69BJ6BEMg24DUlhM+Eg0K9IDoj7BByS9RAqY0HYBllCIg7gCQxx4GfWmot05b+ttA/rWfPKmxvdm6zBFR8AJvIa0hH+oEFt7P0F605QN3cExiUd2yr33NkCBcFaO0PCDfH4YVNtz++Ne3zG6A5D6H9O+mZWGGCOoXch2aBW4jBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
 b=fEKJ6yD9V5h/qBNKQcRj8+cuB5NHv/COOgIgLQvqL380C4NiSSOILL4uEtUhcIpB7Y6Qe9P72+7yaBo7Qshf1R0mLmhV8DJAoxj68qCJGFNIbs7DN/ujWBVrVyoJxN3+M+Vjp/zPbnkWWwXw5MRgKLbot29pzKZuznwts7d7Nvngt+Lqmq9gYaOVQYcp88QHcvoNYQrkVRGrnmzCT1djpbHirVrHsfH83jvsoXTMESGapVNB9E5ilw+UAzEsEyw7Z1cshHoUZ22pOrsnDF6oEY/8rqFKM6BIp78mEGmtiH2KtSZp1hdIVNOKVYwatZNk5rAPRFEj0IEl3U9ajz5U9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
 b=NFsj4ERfrdFYQo8Bx2GikNqvAAWAzyPsYUFKCmvmimbb3xQW5HOTHGGFxFxY8PtG96MnJ3pnTIDnmEAphpUtw49/2noc4aNYjGSgOQnRo3rrrjUPWGNUjTwfuX0P0ElEnq54FpKzHy75foz8P5qV9p1IB+7cGV1qrjQIW6JD3Ro=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by SEZPR03MB7916.apcprd03.prod.outlook.com (2603:1096:101:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 03:30:05 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 03:30:05 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores' amounts
 setting
Thread-Topic: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores' amounts
 setting
Thread-Index: AQHdCfQqCQU/mTVgekickxRFo/sLj7Zo6KcAgAHy8AA=
Date: Mon, 13 Jul 2026 03:30:05 +0000
Message-ID: <05928d76a6cb103e1f4cafc38fd4ad4013b87c05.camel@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-2-kyrie.wu@mediatek.com>
	 <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
In-Reply-To: <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|SEZPR03MB7916:EE_
x-ms-office365-filtering-correlation-id: e013285f-0594-44c9-5df6-08dee08f0821
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|11063799006|4143699003|56012099006|921020|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 5Fam6Af1E5glAi/9Nb6DrtXDxG9loKZH9LVAmUT6ilXn6Jb80e31+ToE0ainJ94t7OhvQFAdL9g9OKGMAc/W1XOboz9AmaSsZ+i8dPHMpbDaIhn//b8tjwksyz7jBodhLQ78mavIkr4XAAfcuh8QCy0DidPEMx2MuYUMMHBG9owmSxlFt9y0UgQzwZbCDSllxxtelTOCy3wU7tmXsHmKj0K9+m6V5+paCvZ8lEPU5UaO77IfINgRKTMXIB8/OV4fW0a33Ezz3yeSjF/pLIlAUHFIqhZojGse6H2l7wU1eRn0i5R8tWN5JRuEqxYePmT5RABxuGnQaOFbizDJHVnE6+AXQ+i53zqwNF9dsp44nXJIkdpCnXfURXEQg0Ew3vrr5OgWEXQvnMvO49kfam1ai7CPpcle6h+K2J7EIEYQAkGveORRtFAjN6NAJpxU13tWEO7QvLSYNzmmvvuUBjWGORGr9wZBYPDionvTrA81lGSnYmbJEtbUaKdK4qDsdwD8cyz7YBkCD3Hh4/EZJuKtOdr5dyB5lih63SnjLDr5cMSy27iDsUhlmyR8r1Zm9diVB5PAejfxEjHwoV6xtq2IlIA0TMk7WhlTYQs/b8cDg5+T93XKJHh+rCyxUwfVZWmifA3GLv7AP7gKWjpNdbFan0WQilez5anUPCRA1JyryxKcXFAWc1uNoOxiMubSkT+Xn4kzCUui3+L0UDDvtqf/jHoFXjSOtj61rvYVFEO0dFV4mJJ7iIMDfRA9g+nbUFL0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(11063799006)(4143699003)(56012099006)(921020)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy9sZzFZdTRkaGxnb1F4ZzRxSUJIaElnMkk4Q3B2d2RlYnc5eUpTTXFVUVNo?=
 =?utf-8?B?cGs3MFVFelVHVDg5cktRdU51TFFUQTlmMlpVUXRCVjVGMW14bDYxY2JYWG5k?=
 =?utf-8?B?bDZ5MHl1SzRGOXJ0dUlTVEhMTVlPMXU5RVVpTEYycENlR0ZyL0xMdDRRZ2xM?=
 =?utf-8?B?bDB0b043bXpaTmhGM055RnhjTmZPaEN6bXZWYkNEZHBUK05Kc1E3MjRwYmN6?=
 =?utf-8?B?UEhmZWFIUUplTHpBQW92WjVvVHQxS0RJSVBvLzNmVVlaTWg4ZXB2MVFScFZt?=
 =?utf-8?B?c0FnM0FQVFhxM3JxeTgvNUZyenZVekJOM2FxTU9wTEo1UzJUQ2hCME9HSWpa?=
 =?utf-8?B?dlBKNUkwdE5MRnZKRVEwdEFTbU5PQ0NWcnF2aUg1blQvaWJTcnhwMXMwc090?=
 =?utf-8?B?MXBHaVF3WTEydWdadU14NlV0YkNQcitKVDJ2czY4ZVJhSXJWK2dXT1R3ZGFQ?=
 =?utf-8?B?TXpnSnU3bFcxdW16aTdEYjJhZ3J3UWcwcURpOCtRdW1nYlhYVFc5djlFcUwx?=
 =?utf-8?B?RHhmY1BtZHBBNzUrdjUxVjcyWU43clV5TmswZ3BhS3YraWpaNDVHSlhEanpR?=
 =?utf-8?B?QXhkVnRMMlRMN1hoSTFBRHQ3cjFYeGFpWXZHMjkweG93anErMmtmOVVmMjlY?=
 =?utf-8?B?Z0FmUDVadnNmS0xiZmdqVG5KUXNHWkp4M21XZlNLMDZQVHhKaVZQa21MdTNS?=
 =?utf-8?B?MEZlY21qTWtJMnhCRlRVYkxpZlRCMkNWYngvYmR4U2dKQWdWSWxxZTEwNEth?=
 =?utf-8?B?MDJKQjhybG9jS0p3dFA5U2xpOXg0SDR2WklTdnlodmp5Sy82Z2JMY0dMQlA2?=
 =?utf-8?B?VjZkVlVYNW9xOGs5eG9SbUJIbFJxWjZqMDM0VmdTZ2wyWXB0YllEZ2kxT0VS?=
 =?utf-8?B?Y1pITWFhb1hHQm1KOGdRa3J4Nm9XaFlzbHArcFo3bWp2c245ekhuV2xld1VP?=
 =?utf-8?B?UjBQRVlwN2NmQ1VkVmVCaVlsZU9vc2NWY0N3MDlHZWczRlRnK2Vzb25aZVNC?=
 =?utf-8?B?VWhnZVNOQnRMWURTYjE2L1VnS3ZjL0JCbjhaYnZnM1hIVTlyVmJqbHNkRjF0?=
 =?utf-8?B?NHcrVE1FejV6WW9zUnB0OUZ5anVIOXlWNjVSY3h0YmN4RWNDS2tTa3ZiTWFi?=
 =?utf-8?B?TjJjcHh3RzllS3hjcEJsakhHTXBCVXNreDk2dXdOUXl4MnNmSllkTU8vd2RP?=
 =?utf-8?B?T2VkVXdTM2VCVHh5YzEyb0pZaG5RRHhNU1FKNVZCU2lRL3d4eGhxeEZTNTVF?=
 =?utf-8?B?cEVXaFVGN1NzSDVtMjN3UHNka2lBSHJmanYzTi9sN2k4akxORkZJTlh4aUJF?=
 =?utf-8?B?bnRPZTJET0VCZ09aSmF0WDlpYkpzMUNvcW9KNU95bUtEYzJJd2JKREpNQk5s?=
 =?utf-8?B?N0NPQXhzZHFxc2piOWdHOVdnb2RzUExZTHlRL3VOU0k3SGc0cjQzdDdZcUNR?=
 =?utf-8?B?bndsM241OUZnV29XenpHYXF3TFNnRGJ5WXFmNmtubkZWUDk0dHE0VjZzbTBP?=
 =?utf-8?B?UUNWSkF0NWJyc2VVZjFkUm5Cb0srU3RHdkV0aFJreE5vcytmM2JuUitZTjVk?=
 =?utf-8?B?OU9qWXlrdzhENmZ4ajdURzQ5MmVrTURMb1VXZGZkK2p4aU1oZjdJSG5PK21H?=
 =?utf-8?B?UW1LcEJ4MzFYTGM4eFRDd0NvMkZUcTJYRGxzY003dVl6UjJvd0RoeGpMRnQ2?=
 =?utf-8?B?K1pNMWdhUjhOaFJ4bXpvV095MkNURDNXenV0ZTdIbXZMQXBKcncwdVN4bTBE?=
 =?utf-8?B?SGdnZmpTKzIxdlVoN2cxcitDR3V4VEdwT2dSdTV0Mm1YL1U1YTdDRXNESkZ4?=
 =?utf-8?B?TU40aTlSazI1QllOUEpyempLcENnV0VXSmZpMEM5VHJPbjlSMU1BbWFhUU43?=
 =?utf-8?B?UWs0bjJTRkxqdFAraWJCUHpqTWJUOUo4UHFOUTNDeU91ajNQci9Zb0liYWlB?=
 =?utf-8?B?NFQ5RlorN2Y3azdTS1FvQklZbjJ6V0JiSXdDYTlnKzdtMkZRRXk3NWdhcWxl?=
 =?utf-8?B?OGs1SkdZQitqNit5ai9BZlcyMHVZalkycU8vUkcvTWlkR1RTVHVQZXV2L2VN?=
 =?utf-8?B?dWFxRllFOCtkM3dNV1N5RGdrdW94VDJLa3FUTGUycFd2UHUwRFN3V1E1UXAz?=
 =?utf-8?B?THYxNXNzSmlCSEVIYVIvdkZGUDVjZTB5MmZIVmNkZldtRlc3U2VqUHEvT014?=
 =?utf-8?B?aGR3bmozQmM5V2Rvdkl0YkRmQkJTMlVPOG9wbjN6UVNpZnRNbm0vWU9lMGpx?=
 =?utf-8?B?NUxpdEFGSzBjTHZwcThGVTByRUEzeVZjV0VKMERrWlhIcnJ6MmU0aG9Dek1i?=
 =?utf-8?B?aVpsb0dtQ29ZNjEveERxWjd2cFczdjhLVzRWcEZ5UW00M1Q3U0pDUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BA5AF81C535D84FAC7B5E81F4347356@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qep/hw3lZAjH3DeshhBMlxHTkcnwPiZ+XR6wzsNq6AjUr1npCShEcgf4BXZIce55pS35P0H4Z5a6L/rfF65eK/Kd/Y6kQ4iAbzeHaBaOHxKBNAyf/llfy4s2wYrTWyn/vgIWU2g/3VsLVyWHI7WZlUjjiTJ3/WV5QfMeO7aDJO1QmF/NcMnaIgTLm5MsM8rREhMnDyUKcuF8YWJoLFr/2GAqRpnux8ziWeH76GiFcVhflSyNNob1X7CvbzE3YYGIOvwp6RmnTFpcFOaS5P6PnHG+jmIHW7anMyqdohORsEzS/LXCdXDZQjJvcqm7ScnxTHIbnl/LVgSBRcLweUchJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e013285f-0594-44c9-5df6-08dee08f0821
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 03:30:05.4089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFYVfcQamOsdgrPz3hQ8aU9ZwnB4AousNocW59pZquQD0BfPMaL9rOODLvZc5QQ61BsClDb1A9ef4bZyiRkKfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7916
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_203014_409361_3CDACEF8 
X-CRM114-Status: GOOD (  18.05  )
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

T24gU2F0LCAyMDI2LTA3LTExIGF0IDE3OjQzIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDAyIGp1aWxsZXQgMjAyNiDDoCAxNToyNiArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXTCoDoNCj4gPiBEaWZmZXJlbnQgSUNzIGhhdmUgZGlmZmVyZW50IGFt
b3VudHMgb2YgY29yZXMsDQo+ID4gdXNlIGEgdmFyaWFibGUgdG8gc2V0IHRoZSBjb3JlcycgYW1v
dW50cy4NCj4gPiANCj4gPiBGaXhlczogOTM0ZThiY2NhYzk1ICgibXRrLWpwZWdlbmM6IHN1cHBv
cnQganBlZ2VuYyBtdWx0aS1oYXJkd2FyZSIpDQo+ID4gRml4ZXM6IDBmYTQ5ZGY0MjIyZiAoIm1l
ZGlhOiBtdGstanBlZ2RlYzogc3VwcG9ydCBqcGVnZGVjIG11bHRpLQ0KPiA+IGhhcmR3YXJlIikN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA+IDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jwqDCoCB8IDggKysrKy0t
LQ0KPiA+IC0NCj4gPiDCoGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtf
anBlZ19jb3JlLmjCoMKgIHwgMiArKw0KPiA+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2RlY19ody5jIHwgMSArDQo+ID4gwqBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMgfCAxICsNCj4gPiDCoDQgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
Y29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfY29yZS5jDQo+ID4gaW5kZXggZDE0N2VjNDgzMDgxLi4xZTAxNGZkNjk4YWUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2Nv
cmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtf
anBlZ19jb3JlLmMNCj4gPiBAQCAtMTQ2Miw3ICsxNDYyLDcgQEAgc3RhdGljIGludCBtdGtfanBl
Z2VuY19nZXRfaHcoc3RydWN0DQo+ID4gbXRrX2pwZWdfY3R4ICpjdHgpDQo+ID4gwqAJaW50IGk7
DQo+ID4gwqANCj4gPiDCoAlzcGluX2xvY2tfaXJxc2F2ZSgmanBlZy0+aHdfbG9jaywgZmxhZ3Mp
Ow0KPiA+IC0JZm9yIChpID0gMDsgaSA8IE1US19KUEVHRU5DX0hXX01BWDsgaSsrKSB7DQo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50OyBpKyspIHsNCj4gPiDCoAkJY29t
cF9qcGVnID0ganBlZy0+ZW5jX2h3X2RldltpXTsNCj4gPiDCoAkJaWYgKGNvbXBfanBlZy0+aHdf
c3RhdGUgPT0gTVRLX0pQRUdfSFdfSURMRSkgew0KPiA+IMKgCQkJaHdfaWQgPSBpOw0KPiA+IEBA
IC0xNTA5LDcgKzE1MDksNyBAQCBzdGF0aWMgaW50IG10a19qcGVnZGVjX2dldF9odyhzdHJ1Y3QN
Cj4gPiBtdGtfanBlZ19jdHggKmN0eCkNCj4gPiDCoAlpbnQgaTsNCj4gPiDCoA0KPiA+IMKgCXNw
aW5fbG9ja19pcnFzYXZlKCZqcGVnLT5od19sb2NrLCBmbGFncyk7DQo+ID4gLQlmb3IgKGkgPSAw
OyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspIHsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBq
cGVnLT5tYXhfaHdfY291bnQ7IGkrKykgew0KPiA+IMKgCQljb21wX2pwZWcgPSBqcGVnLT5kZWNf
aHdfZGV2W2ldOw0KPiA+IMKgCQlpZiAoY29tcF9qcGVnLT5od19zdGF0ZSA9PSBNVEtfSlBFR19I
V19JRExFKSB7DQo+ID4gwqAJCQlod19pZCA9IGk7DQo+ID4gQEAgLTE1OTIsNyArMTU5Miw3IEBA
IHN0YXRpYyB2b2lkIG10a19qcGVnZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAq
d29yaykNCj4gPiDCoAkJanBlZ193b3JrKTsNCj4gPiDCoAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpq
cGVnID0gY3R4LT5qcGVnOw0KPiA+IMKgDQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdF
TkNfSFdfTUFYOyBpKyspDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50
OyBpKyspDQo+ID4gwqAJCWNvbXBfanBlZ1tpXSA9IGpwZWctPmVuY19od19kZXZbaV07DQo+ID4g
wqAJaSA9IDA7DQo+ID4gwqANCj4gPiBAQCAtMTY4Nyw3ICsxNjg3LDcgQEAgc3RhdGljIHZvaWQg
bXRrX2pwZWdkZWNfd29ya2VyKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+IMKg
CXN0cnVjdCBtdGtfanBlZ19mYiBmYjsNCj4gPiDCoAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+
IMKgDQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspDQo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50OyBpKyspDQo+ID4gwqAJCWNvbXBf
anBlZ1tpXSA9IGpwZWctPmRlY19od19kZXZbaV07DQo+ID4gwqAJaSA9IDA7DQo+ID4gwqANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2NvcmUuaA0KPiA+IGluZGV4IDAyZWQwZWQ1YjczNi4uNmJlNWNmMzBkZWExIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcv
bXRrX2pwZWdfY29yZS5oDQo+ID4gQEAgLTIxMiw2ICsyMTIsNyBAQCBzdHJ1Y3QgbXRrX2pwZWdk
ZWNfY29tcF9kZXYgew0KPiA+IMKgICogQHJlZ19kZWNiYXNlOglqcGcgZGVjb2RlIHJlZ2lzdGVy
IGJhc2UgYWRkcg0KPiA+IMKgICogQGRlY19od19kZXY6CWpwZyBkZWNvZGUgaGFyZHdhcmUgZGV2
aWNlDQo+ID4gwqAgKiBAaHdfaW5kZXg6CQlqcGcgaHcgaW5kZXgNCj4gPiArICogQG1heF9od19j
b3VudDoJanBlZyBody1jb3JlIGNvdW50DQo+ID4gwqAgKi8NCj4gPiDCoHN0cnVjdCBtdGtfanBl
Z19kZXYgew0KPiA+IMKgCXN0cnVjdCBtdXRleAkJbG9jazsNCj4gPiBAQCAtMjM0LDYgKzIzNSw3
IEBAIHN0cnVjdCBtdGtfanBlZ19kZXYgew0KPiA+IMKgCXZvaWQgX19pb21lbSAqcmVnX2RlY2Jh
c2VbTVRLX0pQRUdERUNfSFdfTUFYXTsNCj4gPiDCoAlzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9k
ZXYNCj4gPiAqZGVjX2h3X2RldltNVEtfSlBFR0RFQ19IV19NQVhdOw0KPiA+IMKgCWF0b21pY190
IGh3X2luZGV4Ow0KPiA+ICsJdTMyIG1heF9od19jb3VudDsNCj4gPiDCoH07DQo+ID4gwqANCj4g
PiDCoC8qKg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGluZGV4IDMyMzcyNzgxZGFmNS4uNDUz
NGNhZWIxMDRmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IEBAIC02NjQsNiArNjY0LDcg
QEAgc3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gwqAJbWFzdGVyX2Rldi0+ZGVjX2h3X2RldltpXSA9IGRldjsNCj4g
PiDCoAltYXN0ZXJfZGV2LT5yZWdfZGVjYmFzZVtpXSA9IGRldi0+cmVnX2Jhc2U7DQo+ID4gwqAJ
ZGV2LT5tYXN0ZXJfZGV2ID0gbWFzdGVyX2RldjsNCj4gPiArCW1hc3Rlcl9kZXYtPm1heF9od19j
b3VudCsrOw0KPiANCj4gSnVzdCBvbmUgcXVlc3Rpb24sIGNhbiB0aGUgbXRrX2pwZWdlbmNfd29y
a2VyKCkgc3RhcnRzIGJlZm9yZSBhbGwNCj4gY29yZXMgaGF2ZQ0KPiBiZWVuIHByb2JlZCA/DQo+
IA0KPiBOaWNvbGFzDQoNCkRlYXIgTmljb2xhcywNCg0KVGhhbmtzIGZvciB0aGUgcXVlc3Rpb24u
DQoNCm10a19qcGVnZW5jX3dvcmtlcigpIGlzIG5vdCBzdGFydGVkIGZyb20gdGhlIHByb2JlIHBh
dGguIEZvciB0aGUNCm11bHRpY29yZSBlbmNvZGVyLCB0aGUgd29ya2VyIGlzIG9ubHkgaW5pdGlh
bGl6ZWQgd2hlbiB1c2Vyc3BhY2UNCm9wZW5zIHRoZSB2aWRlbyBub2RlOg0KICAgIG10a19qcGVn
X29wZW4oKQ0KICAgICAgSU5JVF9XT1JLKCZjdHgtPmpwZWdfd29yaywganBlZy0+dmFyaWFudC0+
anBlZ193b3JrZXIpDQoNCkl0IGlzIHRoZW4gcXVldWVkIG9ubHkgdGhyb3VnaCB0aGUgVjRMMiBt
ZW0ybWVtIHJ1biBwYXRoOg0KICAgIHVzZXJzcGFjZSBRQlVGL1NUUkVBTU9ODQogICAgICAtPiB2
NGwyX20ybV90cnlfc2NoZWR1bGUoKQ0KICAgICAgLT4gLmRldmljZV9ydW4gPSBtdGtfanBlZ19t
dWx0aWNvcmVfZW5jX2RldmljZV9ydW4oKQ0KICAgICAgLT4gcXVldWVfd29yayhqcGVnLT53b3Jr
cXVldWUsICZjdHgtPmpwZWdfd29yaykNCiAgICAgIC0+IG10a19qcGVnZW5jX3dvcmtlcigpDQoN
ClNvIHRoZSB3b3JrZXIgY2FuIHJ1biBvbmx5IGFmdGVyIHRoZSB2aWRlbyBkZXZpY2UgaGFzIGJl
ZW4gcmVnaXN0ZXJlZMKgDQphbmQgYWZ0ZXIgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gb3BlbnMg
dGhlIGRldmljZSBhbmQgc3RhcnRzDQpzdHJlYW1pbmcgYnVmZmVycy4NCg0KVGhlIEpQRUcgaHcg
Y29yZSBwcm9iZSBpcyBwYXJ0IG9mIHRoZSBwbGF0Zm9ybSBkZXZpY2UgcHJvYmUgZmxvdyBkdXJp
bmcNCnN5c3RlbSBib290LiBUaGUgdXNlcnNwYWNlIG9wZW4vc3RyZWFtaW5nIHBhdGggaGFwcGVu
cyBsYXRlciwgYWZ0ZXIgdGhlDQpzeXN0ZW0gaGFzIGJvb3RlZCBhbmQgdGhlIHZpZGVvIG5vZGUg
aXMgYXZhaWxhYmxlLiBUaGVyZWZvcmUgd2UgZG8gbm90DQpoYXZlIGEgY2FzZSB3aGVyZSBtdGtf
anBlZ2VuY193b3JrZXIoKSBzdGFydHMgYmVmb3JlIHRoZSBKUEVHIGh3IHByb2JlDQpoYXMgY29t
cGxldGVkLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo+IA0KPiA+IMKgDQo+ID4gwqAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgZGV2KTsNCj4gPiDCoAlwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+
ZGV2KTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9q
cGVnL210a19qcGVnX2VuY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBpbmRleCBiNmY1YjIyNDlmMWYuLjI3NjVk
YWZhYjRhZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtMzg2LDYgKzM4Niw3IEBA
IHN0YXRpYyBpbnQgbXRrX2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiA+IMKgCW1hc3Rlcl9kZXYtPmVuY19od19kZXZbaV0gPSBkZXY7DQo+ID4g
wqAJbWFzdGVyX2Rldi0+cmVnX2VuY2Jhc2VbaV0gPSBkZXYtPnJlZ19iYXNlOw0KPiA+IMKgCWRl
di0+bWFzdGVyX2RldiA9IG1hc3Rlcl9kZXY7DQo+ID4gKwltYXN0ZXJfZGV2LT5tYXhfaHdfY291
bnQrKzsNCj4gPiDCoA0KPiA+IMKgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRldik7DQo+
ID4gwqAJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7DQoNCg==


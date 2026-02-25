Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F0EF5862
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEzPIk7BJrwRqy8OBWcCiseJpF3tBawXo56hziVKx9M=; b=UzKfTz0b6chxnz/CeYqLmNtlAv
	H5478OMUSYBrOae8HmTBwHX1cH0tVNHVOVeEc/CBZ8AfAQD8+RyBr5Daa4CcoKfCB+ZAyNxaWw08q
	edMbaF0VZdRpU9OgKsIHlvPKgIJRjHi0CzXjIsegAGiy0YzV4SY8uuokgas/TABJcXWcqnofkGr0w
	tSPKtk/A+9OeLiAxSwVERGhHKNGtA23Bb5DnfYHAqI47FqGy9mpLlndI90z3JatN1iVkk54SZfdEm
	Iv/cSpO6VpoKuKUdJoRCIEfJ9oER6+e5ybX4lrvfWUeFiNy3LatMAixYWWp9+ptFcUR+p6fSvB/9w
	Tpid+TRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8G8-00000003J51-1tSX;
	Wed, 25 Feb 2026 06:20:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8G6-00000003J4Y-0aZm;
	Wed, 25 Feb 2026 06:20:31 +0000
X-UUID: 118e2556121211f1a16f0188aa809bee-20260224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UEzPIk7BJrwRqy8OBWcCiseJpF3tBawXo56hziVKx9M=;
	b=hyCqajTsShggc0P04U+/wyMKJqd2xYrfUAVnEzZHW5CmJCS3R6vO2XmbHzGgeAbR6g1Pya8ziawH4XmVH73xmPgRRI9DfbmGjNtFbFmdtz1KyOk4FZdgwpf9vGII00H1BzTpxVzAqjG4de+3aUCJ96Z15SpKOYpmKoH84xCSd3o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:3a0a0c39-f1ea-4a9c-8984-0cd585b55053,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:5821fcf0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 118e2556121211f1a16f0188aa809bee-20260224
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1274537419; Tue, 24 Feb 2026 23:20:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 14:20:21 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 14:20:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUwvj0dX2o4npen+nCL9NCQ24FjPetxteUEeiCYnTvlXmmK14ubzGdRdTDtwVVbCwBVSuBEjaEBhtAQ9WjDYBDYQTGolPRJhHoeOsqTC0eP6tL6gzDkdLlhCZpt4tVYBsPmYKhj+1pwTeMGTxsFFozlKdRQNgFv8nNxPfydeqgFYj50e7+YhOM0wSVYAim5pey/Icxr+Haym6/pYOEFNVvpz4SioNcaBWGYS+PXpP1E/kMqaGpMd/JMjLntNzDbL1gCqID+mMRmFWveLvq4ZtnOaK553VjzOj2xuP2fA8m0xWo6BHPNg4+bVwRP1gn9cMkNGCNQxj+kaRFWyBkwELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEzPIk7BJrwRqy8OBWcCiseJpF3tBawXo56hziVKx9M=;
 b=B/MX0oLAlD8WXbEGscjP1TzFVKW2OpK1oOf/drdpF4clKf9bzewhV7kvpNWMVQMPKe4lOBHgplmvJOch3ixsMz7z/BVl7iX+h0Qy5y32+6NFWWgr6fB/yhh9Caj3K24bLxhmQgt35rHVi+5LKr1GwxZ2ZrEP+d3POiwAdlJqYlHQeev5x62TtExpkR+nT2xy/uNg+9QVcva5jZOSWiY47wRVyp9KGSiO4+EBFX7iHEOqiXyq7F/2X9Fdi00pixbV55F8u5gNSWexxTo0vE81TRWRZlhrnozFSxIoN0kuNVXx6G08YQQu5xmA7eSYQfat90ggg17n7aDLnBV5aK8kQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEzPIk7BJrwRqy8OBWcCiseJpF3tBawXo56hziVKx9M=;
 b=MFa0IUR6PB4DBilfi1HULEGApTxRkGdX0W9WDZ4rhKayTjgYOOF8rdRJTfXu8QxkLcPqfN1RDkuAPxQQfhFcv8sq9u66wD8qLIT15mcdK8YxFOeU8eOxjk1GzwssXsR1fjmQDdtIatMp0GuPdHSXMn5vJ7fZEoZxcmJ8hQ5/B1o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE3PR03MB9563.apcprd03.prod.outlook.com (2603:1096:101:2ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 06:20:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 06:20:15 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "bisson.gary@gmail.com" <bisson.gary@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Thread-Topic: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Thread-Index: AQHcigFOhpiQb/7pa0OpBjXmLS9eAbWTKZgA
Date: Wed, 25 Feb 2026 06:20:15 +0000
Message-ID: <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
In-Reply-To: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE3PR03MB9563:EE_
x-ms-office365-filtering-correlation-id: 48af14ab-cb1e-4dad-689d-08de7435f096
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|42112799006|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WDVXYVhENFpucU9RZlZYeDNNVXJ3WCtrZGtqUlMvWmNUMUtRK1ZwSWgyS01o?=
 =?utf-8?B?OXhTTXU0ODBsVlIyREhlZXMvcWNrR2RuUDA1eHNsUWs4VWQyYUVrK0RTVFJa?=
 =?utf-8?B?NlpXREh4V2RPb1d4RmFMODYzMzRsSXJEeDQ2VkdVclg3UXl4UUIzaC94QXl5?=
 =?utf-8?B?QjFpUWtrc0g4eHlxWVpyNnFMdC9RdGN1R3pkUmdtaFhuZ3hWREFuamg4NkxW?=
 =?utf-8?B?MkhtbFRsa0ZmMG9ZUmFjUEV1NDBNNTBvNEhsUUh2cTBSbnFrdFE1Y3RER3Y0?=
 =?utf-8?B?b08vMGpQYVpNaHdyek9oRWJLM0JlaCtNVDVJR3FVVUV4dFoyZTdlQXRodVpZ?=
 =?utf-8?B?QTlhRmE0MnNiS25jRXhjRk4xbVJ2ZmVYTmtQVmw0NktXK3AxOEM4cmxIYjBI?=
 =?utf-8?B?bjBwMDBFRzllcDNiUmwybnVVQUtmWlMvbHhiZUZQcHNRbGlBU3QvZ2lYQWUv?=
 =?utf-8?B?czN1NWI2ZktZTlNDa1ZRTUhJcThybzhqbTlBSnNzRTFxbVIzbGVQbS9iSUhZ?=
 =?utf-8?B?dXFXa2hyOVVFbWYvYURhd3RwRnV6R1lVMUpKcVVhQ2RsTFdCMll4ajhvVTFt?=
 =?utf-8?B?UnQvVmFpM1BMMlRnRmpmbkhTdm85TmRsZVg1blpIbmVKbzE5cTg5d0VQSTFo?=
 =?utf-8?B?eU5TYlpXRlo4YysyY1JNbkJvZFJTelJNK2dFcGE4NUdJU0s0WFozZ2EzQjVv?=
 =?utf-8?B?V3JVbW0xUGJUZis3bnM0S1BsY1FIVWZFU1pxVG4zdnlJYUZXSWtycnlPVTM4?=
 =?utf-8?B?UVNyUm1IUGRGZ3pnZ0NoN2kyQWE1ay81NEd6K1NQcjYyM1JQZnl0b0Y4VWZ3?=
 =?utf-8?B?OCtEU3lOZmI2d2F3Rno2dlNORjh0aElkeDlOaXM1NUQ3MGZqNnJlaDNGUlY5?=
 =?utf-8?B?ekVCTGNsbFlOd01RUTF2WjZudzFRazROZFZiTlErc1FBVUM4dm9GN05FYzNJ?=
 =?utf-8?B?Qjd6ek9RcXcxZnl1eUlDNjB3MVdZSXRNa3NLMnhuRFRMOEZ2MlJBUzUrY241?=
 =?utf-8?B?dWdnRVVkczl4eERWRjVHSUVEbUNZT0NYT2VsV2dnMjBML2hXWTdEQ3RoZk44?=
 =?utf-8?B?OW5KOUJrSWp4dFRqSGUranExVDFRMFRobEpQM2dmb2tCZ2x2NWFqU1JDTDVj?=
 =?utf-8?B?SHB0cW5JY2dkU3RYUXRPaEg1dnl0T3BjaHgzWnYreTg4eTZ0Rm95WjZzU3ky?=
 =?utf-8?B?Y0h0MkpwcVNwY2xSR0htVUl2eGtUREVaQ0NlbFlKUldqOHB6a0hZQU53VC9E?=
 =?utf-8?B?N1ZkMXJCR3V4aWkzbG9rL0NjQ2JEODRmYyt5blh6S1dGSEc4bWVRVGxDOWdr?=
 =?utf-8?B?U3BPSGFDNHhiK0oxdDl4K0JOMkhURm1CZ0Z1dmhGRU9ITGxIaitFZHVocWJY?=
 =?utf-8?B?ZlcxYTMvK1hZaE1QOElubHh1ZWdIWXgyV1R3YnhLbmo4THpUYzd6TVNER2J3?=
 =?utf-8?B?MVVqZzNQUDc5eE5hMWk5SFpxOW9IOHdUc2VKdWdQdWVKWDkwUi9ESWpQZklH?=
 =?utf-8?B?Rk5ialdzdzFzR3lld0dmakRKRk96ZVMzbWpJWUdtbzdUWHFZYjlYVnhTTTNM?=
 =?utf-8?B?OW9scktVeTJCeWVjOTVLYkszQ0hZd1NDZVI1STFMNk5NYm0wOENRcU1FcDRv?=
 =?utf-8?B?OXRqWTB1M0VaZ3NBWkxITkQ4c0M5UWdqYjBoT2kxa3hCUGx6VFh1QmxObzBS?=
 =?utf-8?B?ZFE0UTVVRGVvTDlidFo4T0RrSzVsUjJkMGZGUkVjcmpiQmdPZWFqdDV1R2xz?=
 =?utf-8?B?d2xOS3FnSmEwT3pjV3JVVEIxNzRDemlBeWhqaGdBOERXdnNwRDdsZUw3bzdm?=
 =?utf-8?B?ZmtMZ0RJbWtxdC9jU09iNitaaU9UZ0pNc0tTM01TSW5NY2lYdHNYTHA3WWIz?=
 =?utf-8?B?eGFaK3EvbGw5TUd0MmQ3bkNoS25WUndwTHg4U0lvV2dhWUYxY0FER0MxUzBY?=
 =?utf-8?B?OUhCbnltb3pPeS8vcXJhdzRnUXp5UkpZVGJTK29GcmhsM1kraVo3Vml1ZUxW?=
 =?utf-8?B?OWlIa2ZoQ2VIM0tYUFlCajUwNDN3M212Q3V6Y1pqODRNVEl1VFR0akZBN1R4?=
 =?utf-8?B?T2JzN2ZERUJUTWg1cWNLRE1kNWRGUHdoaDY5RnJSU1VIMEt2cVQ0d1VTTXNk?=
 =?utf-8?B?OHRMZFcvZk00ZEpTTFdpR2pPaU1ybUl1ZzBYZmwyUG10bFhMMTBLL1ozeC9L?=
 =?utf-8?Q?hU0KHubUdLWtm5+XdAnmies=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(42112799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WS9BZm1nRTZiNXpJVFBuZ3drNUlMc0ppUzIvVmJwWWx6N0hhajUzZ2hSSSs2?=
 =?utf-8?B?T1lnTTByWnBtM3lFWE5IRWlrOHM3dlcyVC9iNDJMKzFONmxCWFZ6L3gwVzJZ?=
 =?utf-8?B?TFQ3bDBOWkpCV1ZWNDYzc1pxeXVGWSsvblduTEVMbW8xSFFBZGZjZWJ3YXZ3?=
 =?utf-8?B?cC9xV3VXR1Y2N1NHeHZBOCtIQmxMS0RmTjRtcTVwcCtMMGg1dmpxcm16WEVF?=
 =?utf-8?B?ZEQrU2x2K2EwY05USjRGandLSjI0RG4xbi9CMTdvOXdwZ05ZZUZ0ZGN5cUR1?=
 =?utf-8?B?THZkbTFmVlBLVHdSSU15ZDZBNUprYkh3R0VXVGtEMGpWSk5sTWlUTEtsa2dW?=
 =?utf-8?B?TXRwV210cU9peFJ4YmNMQUhRYXZ2NjJIQ1NTTEljdlg4RUNhSHBqMUdMNkFH?=
 =?utf-8?B?MmJIRFY1Q0Q3V29DaFVNNjVWQTNoQWFyaVl6UHIvY0NsV0dkS2Q2U0s5RGdM?=
 =?utf-8?B?VW1FSVdqR0ZvVDNKS0tpTXplaVpTYmN2Y1UrQU9kWTAyK0toM3Y3OHRkVnE4?=
 =?utf-8?B?bVhqSVJRZTdwTnRPT2M1SElVYURZbW13ejBqR09vL0orMUZaaUZ0TnRDV1Rj?=
 =?utf-8?B?YVJLV0NPZzZkQWFEVGFDbkRPT2s0am9XUjMzaUM5RUZrRE1UaFgzNjh5bjdG?=
 =?utf-8?B?QVUxZjlmQW04MEJ0b3BtbmNvMytsMTdNT2pGRWtDdGM0cFpzL09mM25pWHlV?=
 =?utf-8?B?ZmYxMk5aazhiRGFVVGNhMm1ETWd0MmZ1clJsQkFzYU94UnZqSHNoZnhoM3dn?=
 =?utf-8?B?SVhxendLOGhQZzVpUFBVbTR5SFVxd3hTSklGQVcvRVZielJJbXNFaE5nekFT?=
 =?utf-8?B?clllZHEzWE5KSGswUmQzYmJEcXdRU0pPRUVWM3BFaGgrVCtBZEhOZFRsY090?=
 =?utf-8?B?Rm9hT3lJWjArR2xqQ3pNb1U3ckRib053bWpISE1PT0g0Z1ZQbGY0ZlJrbkpm?=
 =?utf-8?B?TEsvTVl5eFd0MVdxM2lyMTVWcnAvUkN3U0ttT1RZZ1ViK3oreHdUdGNaQUIv?=
 =?utf-8?B?dEY5ZzNURFUyTmRwMkdDTXBtWHNFQTBSWEJQdjlmSWp2Znovb2REaUdxUlJG?=
 =?utf-8?B?YlZpWFE3bFBLU0w3MFRrbm1kZ25xVHFkLzI4RVRYbk9uUmFDSTFkaEJML3BC?=
 =?utf-8?B?UmVZaFhlQWVNSEdoV3RZdW1iT003SEdsV0hqUEV1WGlVTHUxRjJReWZMRHp0?=
 =?utf-8?B?MC9mR0hBdHNHMVVYa2l0eTNEU0t4cUVHT0tVYndsUU1FcUJKY3N4bVRnTDlT?=
 =?utf-8?B?NTNxOFVVUTByNjY3Y1R5TVRVZ3h3V1J1UlJSeWhLTXlyanZPVGpUMjZ4Q0JJ?=
 =?utf-8?B?NFN3WGY2VVM1anR4d2JxYXdTUm1qa1JtUmwrR28xOC9ISDJkMFFCM2ovazJo?=
 =?utf-8?B?cklOOTlRdGtZU3R1SUZqaHlwb00rV0JQYmdxNDF5c1ROY28zT2J0UmJEV2VT?=
 =?utf-8?B?bFhOZ0c4a3ZiTFQvQVB1VUsrZUhXeXJJOWVONmJlemlVQ2RGRXcyZTB5d2Iw?=
 =?utf-8?B?V3ZzK1FOT3Ezc1VXdEUzUlkvVnJuTWtjRTRyUGpHZGN4RFdYLzdmdEM0RmRF?=
 =?utf-8?B?Q0xQa0t0UTJ2Vjk2blRlMzZRMDBlOU0zL0duYjFDQ01mVVlxeDRGNFhhbGF2?=
 =?utf-8?B?SHlQWGV4dStRcGlHODRQUlZNdTZOUkRmQW0vUzFMV1hOeVRYSFNjZHpLUmdH?=
 =?utf-8?B?Z3ZzQ0diNFM3cGhFUUpJdG5YZEpCTmtZejdlTUtyOHE3S1FRRmdOK2d0aHEy?=
 =?utf-8?B?QjRmRUJRUTN3dmJXNC90SSs1NW9GTDNoZG5ZL2pTMldqWXM1Qm9GTnpxODNK?=
 =?utf-8?B?ZmJIck5ETy94anlydlpWWk94eGVVeW9DdEU1QjJCRzRML3k5ckNNL0lCMDh6?=
 =?utf-8?B?TWxkWGlEcDdUOTlSaFR1MTk0ZmVOVFk2SzllZFU5czJVdzZiRjVMZTZTRXE1?=
 =?utf-8?B?NGJaODRsZE5pTklMQkpsWHpvY2VCaTg3YkpwS2I3bXdKQmY2aEQ5VG5hTnd4?=
 =?utf-8?B?cW1ERXFDVkZtWXNKTVZxM2xzUGFYRTI3bE1OcjlpbHBIeWZPTnk3Mm01UTdB?=
 =?utf-8?B?bXJCZzE5MWN6ZmhiUFpkK3c3emY5VlczUXhzT2w2QUVUOExUajd5SlNRRXZt?=
 =?utf-8?B?elJ0MG90azZMOWxxbkpIUndNTEJPeC9rS3plQ3pwMHJzMTFxWnYvcm50QWJH?=
 =?utf-8?B?VlJreFRFVEZha1FKdXk3SDNjREpzdkFmc29EbDJ6Y1I5QmxpbzVMczN1YnVH?=
 =?utf-8?B?Qm04MVl1NGdwdXM1TUl5UGZuK3l6bXUxT1M2dGl5MkFSV3VBRDU1Rmt5dUxo?=
 =?utf-8?B?TDNwaStVM05NT2dudlp2K3BRZCt5elBjTVc3TWhDOWVSUjQ0eU84UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28495818D3AFCE43A2DE2D136EE0BF30@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RZgiiEtVfMSprmqfZyCT3bTuR3Q55atmgvAMGATmo0szRxkBSbtZzZplwTMzwB7sLwLh8AuvtIAZlov/ZHEtfucPABS2nRCsUyxvOFbBn6AH8dkxOFZjFT8Q9VCsopMqDJDtTgCNtvvYR6zOfefqyUNyd4O6e3nX6EFa84AOwobO7C4V4XPFtXE6A1CzUtBai0JZrJ2WIXdOLqoAUioMnAaR5cBoFwz4Z6lfOK+UrHzXkLWqDQTBVT4/B0c30jptmXORUQaszAJrSpHEke8MBRUOv1hkjHsirk7/1DKynmYodpPCe6FK4RFtl8o/JYlgFypfJaltaSxB/gwnyboaxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48af14ab-cb1e-4dad-689d-08de7435f096
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 06:20:15.1565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4X9LNvnupdrFZBKBK/3fdpqGR0MYriNkrhbVnxQM9Xx7T/1sTdpIr0smRBIB1CHy+p1+R9PsY3d9Ng2fRU9BvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9563
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222030_197588_728058AC 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVHVlLCAyMDI2LTAxLTIwIGF0IDEyOjM2ICswMTAwLCBHYXJ5IEJpc3NvbiB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4N
Cj4gDQo+IA0KPiBTb21lIGJyaWRnZXMsIHN1Y2ggYXMgdGhlIFRJIFNONjVEU0k4MywgcmVxdWly
ZSB0aGUgSFMgY2xvY2sgdG8gYmUNCj4gcnVubmluZyBpbiBvcmRlciB0byBsb2NrIGl0cyBQTEwg
ZHVyaW5nIGl0cyBvd24gcHJlLWVuYWJsZSBmdW5jdGlvbi4NCj4gDQo+IFdpdGhvdXQgdGhpcyBj
aGFuZ2UsIHRoZSBicmlkZ2UgZ2l2ZXMgdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4gc242NWRzaTgz
IDE0LTAwMmM6IGZhaWxlZCB0byBsb2NrIFBMTCwgcmV0PS0xMTANCj4gc242NWRzaTgzIDE0LTAw
MmM6IFVuZXhwZWN0ZWQgbGluayBzdGF0dXMgMHgwMQ0KPiBzbjY1ZHNpODMgMTQtMDAyYzogcmVz
ZXQgdGhlIHBpcGUNCj4gDQo+IE1vdmUgdGhlIG5lY2Vzc2FyeSBmdW5jdGlvbnMgZnJvbSBlbmFi
bGUgdG8gcHJlLWVuYWJsZS4NCg0KTG9va3MgZ29vZCB0byBtZSwgYnV0IHRoaXMgY2hhbmdlIHRo
ZSBmbG93IGZvciBhbGwgU29DIGFuZCBwYW5lbCwNCnNvIEkgd291bGQgd2FpdCBmb3IgbW9yZSBT
b0MgYW5kIG1vcmUgcGFuZWwgdGVzdC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhcnkgQmlzc29uIDxiaXNzb24uZ2Fy
eUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBUZXN0ZWQgb24gVHVuZ3N0ZW41MTAgbW9kdWxlIHdpdGgg
c242NWRzaTgzICsgdG0wNzBqZGhnMzAgcGFuZWwuDQo+IA0KPiBMZWZ0IG10a19kc2lfc2V0X21v
ZGUoKSBhcyBwYXJ0IG9mIHRoZSBlbmFibGUgZnVuY3Rpb24gdG8gbWltaWMgd2hhdCBpcw0KPiBk
b25lIGluIHRoZSBTYW1zdW5nIERTSU0gZHJpdmVyIHdoaWNoIGlzIGtub3duIHRvIGJlIHdvcmtp
bmcgdGhlIFRJDQo+IGJyaWRnZS4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIHwgMzUgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCAwZTJiY2Q1ZjY3YjcuLmI1NjAyNDVk
MWJlOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IEBAIC02NzIsNiAr
NjcyLDIxIEBAIHN0YXRpYyBzMzIgbXRrX2RzaV9zd2l0Y2hfdG9fY21kX21vZGUoc3RydWN0IG10
a19kc2kgKmRzaSwgdTggaXJxX2ZsYWcsIHUzMiB0KQ0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+
ICtzdGF0aWMgdm9pZCBtdGtfZHNpX2xhbmVfcmVhZHkoc3RydWN0IG10a19kc2kgKmRzaSkNCj4g
K3sNCj4gKyAgICAgICBpZiAoIWRzaS0+bGFuZXNfcmVhZHkpIHsNCj4gKyAgICAgICAgICAgICAg
IGRzaS0+bGFuZXNfcmVhZHkgPSB0cnVlOw0KPiArICAgICAgICAgICAgICAgbXRrX2RzaV9yeHR4
X2NvbnRyb2woZHNpKTsNCj4gKyAgICAgICAgICAgICAgIHVzbGVlcF9yYW5nZSgzMCwgMTAwKTsN
Cj4gKyAgICAgICAgICAgICAgIG10a19kc2lfcmVzZXRfZHBoeShkc2kpOw0KPiArICAgICAgICAg
ICAgICAgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoZHNpKTsNCj4gKyAgICAgICAgICAgICAg
IG10a19kc2lfbGFuZTBfdWxwX21vZGVfbGVhdmUoZHNpKTsNCj4gKyAgICAgICAgICAgICAgIG10
a19kc2lfY2xrX2hzX21vZGUoZHNpLCAwKTsNCj4gKyAgICAgICAgICAgICAgIHVzbGVlcF9yYW5n
ZSgxMDAwLCAzMDAwKTsNCj4gKyAgICAgICAgICAgICAgIC8qIFRoZSByZWFjdGlvbiB0aW1lIGFm
dGVyIHB1bGxpbmcgdXAgdGhlIG1pcGkgc2lnbmFsIGZvciBkc2lfcnggKi8NCj4gKyAgICAgICB9
DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNp
ICpkc2kpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gZHNpLT5ob3N0LmRl
djsNCj4gQEAgLTcyNCw2ICs3MzksOCBAQCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1
Y3QgbXRrX2RzaSAqZHNpKQ0KPiAgICAgICAgIG10a19kc2lfc2V0X3ZtX2NtZChkc2kpOw0KPiAg
ICAgICAgIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoZHNpKTsNCj4gICAgICAgICBtdGtfZHNp
X3NldF9pbnRlcnJ1cHRfZW5hYmxlKGRzaSk7DQo+ICsgICAgICAgbXRrX2RzaV9sYW5lX3JlYWR5
KGRzaSk7DQo+ICsgICAgICAgbXRrX2RzaV9jbGtfaHNfbW9kZShkc2ksIDEpOw0KPiANCj4gICAg
ICAgICByZXR1cm4gMDsNCj4gIGVycl9kaXNhYmxlX2VuZ2luZV9jbGs6DQo+IEBAIC03NjksMzAg
Kzc4NiwxMiBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpk
c2kpDQo+ICAgICAgICAgZHNpLT5sYW5lc19yZWFkeSA9IGZhbHNlOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyB2b2lkIG10a19kc2lfbGFuZV9yZWFkeShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KPiAtew0K
PiAtICAgICAgIGlmICghZHNpLT5sYW5lc19yZWFkeSkgew0KPiAtICAgICAgICAgICAgICAgZHNp
LT5sYW5lc19yZWFkeSA9IHRydWU7DQo+IC0gICAgICAgICAgICAgICBtdGtfZHNpX3J4dHhfY29u
dHJvbChkc2kpOw0KPiAtICAgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDMwLCAxMDApOw0KPiAt
ICAgICAgICAgICAgICAgbXRrX2RzaV9yZXNldF9kcGh5KGRzaSk7DQo+IC0gICAgICAgICAgICAg
ICBtdGtfZHNpX2Nsa191bHBfbW9kZV9sZWF2ZShkc2kpOw0KPiAtICAgICAgICAgICAgICAgbXRr
X2RzaV9sYW5lMF91bHBfbW9kZV9sZWF2ZShkc2kpOw0KPiAtICAgICAgICAgICAgICAgbXRrX2Rz
aV9jbGtfaHNfbW9kZShkc2ksIDApOw0KPiAtICAgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDEw
MDAsIDMwMDApOw0KPiAtICAgICAgICAgICAgICAgLyogVGhlIHJlYWN0aW9uIHRpbWUgYWZ0ZXIg
cHVsbGluZyB1cCB0aGUgbWlwaSBzaWduYWwgZm9yIGRzaV9yeCAqLw0KPiAtICAgICAgIH0NCj4g
LX0NCj4gLQ0KPiAgc3RhdGljIHZvaWQgbXRrX291dHB1dF9kc2lfZW5hYmxlKHN0cnVjdCBtdGtf
ZHNpICpkc2kpDQo+ICB7DQo+ICAgICAgICAgaWYgKGRzaS0+ZW5hYmxlZCkNCj4gICAgICAgICAg
ICAgICAgIHJldHVybjsNCj4gDQo+IC0gICAgICAgbXRrX2RzaV9sYW5lX3JlYWR5KGRzaSk7DQo+
ICAgICAgICAgbXRrX2RzaV9zZXRfbW9kZShkc2kpOw0KPiAtICAgICAgIG10a19kc2lfY2xrX2hz
X21vZGUoZHNpLCAxKTsNCj4gLQ0KPiAgICAgICAgIG10a19kc2lfc3RhcnQoZHNpKTsNCj4gDQo+
ICAgICAgICAgZHNpLT5lbmFibGVkID0gdHJ1ZTsNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDog
OGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBkMDQwMjdjYjFlOA0KPiBjaGFuZ2UtaWQ6IDIw
MjYwMTIwLW10a2RzaS0yOWU0Yzg0ZTdiMzgNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4g
R2FyeSBCaXNzb24gPGJpc3Nvbi5nYXJ5QGdtYWlsLmNvbT4NCj4gDQo+IA0KDQo=


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFF4D4A615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbqeneCyzENE2ERP0bRUpxkmDc3lIR3aUa13fMUbETo=; b=xjY3Z/C0GcscQ7TIN5ysD3Rgzx
	PapyRuJ9TwreJ3TMGIQcdKZZEeDXY9Ut0xiT/uw9gUD0RsAq/MSGYdJhsqAxy5rmuvW8xgpyvM0so
	6KRAOWlbRNx3rhD5GcXPCL/zPE9TxJNYYsYzvJJRegsILQPR2Xw2ZzO1rw8m2yXXjOUwsFkRYyswj
	ZoOmyBqWeS+Myaxex014zNiwY6cg22vPRVTU0fnSJpUwOo93M5sUH/mBCf6igrYRUFg77cvLWvshN
	4LgEPANQ+e+Q9CVDGCio8FDBltZm/mJCIriY2uWFqdXF6f9aNth/tmZ0jsb8BjZ+9/V74tiRD0mPO
	sm3RbLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfog-0000000DpED-1bE1;
	Fri, 16 Jan 2026 09:08:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfod-0000000DpDK-2zmK;
	Fri, 16 Jan 2026 09:08:25 +0000
X-UUID: e4bcaae6f2ba11f09f706fa2197c6ceb-20260116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BbqeneCyzENE2ERP0bRUpxkmDc3lIR3aUa13fMUbETo=;
	b=D0pnBvNbf+TNzZHih6x8X9VIOVchuZjSp2kIi1H76RRZHH7M544/yk+rx2YaL7PxIAwwI85wm5iU/ofW58BzgzXiKJWqy7WeQGPw/DDHzm4welnuaMOnh7i78/7JwigIQSSPlWwS/iSaigbbZvrFYTg7uKqBGx1iPzE/MoSa9Ws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:a46393ac-50fc-4732-95df-42ee012c8a4e,IP:0,UR
	L:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:6
X-CID-META: VersionHash:5047765,CLOUDID:987996e8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4bcaae6f2ba11f09f706fa2197c6ceb-20260116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2039654506; Fri, 16 Jan 2026 02:08:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 17:08:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 17:08:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmWcx07K+2wl6DJ9ZSgaxaP8o/OjGc+5jx6vYUvhE3Pcpx/7YRH/NkSJNtb/ory0AA5bfO52zSLiktv4sb+HKYnIVCuhv8VXDyg0/hUsRmDZ/q/kSouqFWV2JC1KxOprcLgiUK+7IobPtCinBGvSUsAu/03fYpYpKPhcOKao1xorR8pXTxZDiUuUhwyv7dUNLd6lXmEMdjQq0RmeEbDV/z53cr+ntvbEKixnX/eihGBowp3PB9s35h5j8te0Z/wupCPxVlR6kM8L6AkSHlvXP4hL6UJEBruIo/D6+RVC5s5CPxg4I73vUlFPsYA4ZRcQZrpq1bOcpN1dhmouPC1iJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbqeneCyzENE2ERP0bRUpxkmDc3lIR3aUa13fMUbETo=;
 b=xbmB6fBgP/hZGy3zMK+JRp96FVBqQtd94X0FzFEy95P//bZCilzapjcSAbukUZ2gepSB1adAur9fpKs5srohnhoA/QnKkXjGy5XvyeIUsJRdpT0VGYEVTpObwvp2689mpdEA478M/eu9ViXIvMxrP9KnqVpJZWqnzCdLPAqo4Qqij8Jy2/x4kN8VYxgt2cXPk9rOJF2rV83Z2qPBHM+eYbWH7ixq0dVmPGLa+rF9bhgAGCvAyszby7ReE9CI0DJhfhrnZbSXFHQ+FZvKRtaLzAcUkxw6OEKYYXGpgW+DMtsjrdMe38qx/sVV6gzOWUqXbUoFi3SYNA+NY7pjaUNg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbqeneCyzENE2ERP0bRUpxkmDc3lIR3aUa13fMUbETo=;
 b=cLy6uFpCdKr+MFrpCzA4l0SrS/JMDGPGxsZMGNGiaoVsX/kTTnCgXuc4Q51O6A1CKuKPD79jTwrZA1mVy2oNMR0QBxQThpMXSl3EtA3TXVialex9rPHcc0hI66xoOCV7JvsSSKGUgCv3gtY+tr/Zh2WO5Z/vwP+b5w8z2rr1Nmc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7332.apcprd03.prod.outlook.com (2603:1096:400:431::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:08:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 09:08:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "wenst@chromium.org"
	<wenst@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: dpi: Find next bridge during probe
Thread-Topic: [PATCH] drm/mediatek: dpi: Find next bridge during probe
Thread-Index: AQHchTd1AsUUtTbSgU+92DJEyy+Q67VUhNYA
Date: Fri, 16 Jan 2026 09:08:10 +0000
Message-ID: <99775c7e312ef04f4a8bf5cdbf6c03b686a7319b.camel@mediatek.com>
References: <20260114092243.3914836-1-wenst@chromium.org>
In-Reply-To: <20260114092243.3914836-1-wenst@chromium.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7332:EE_
x-ms-office365-filtering-correlation-id: 8c9da25c-f545-4c29-95c0-08de54dec599
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZXk2V2Vwb3Y1ZXA0d0wrWnl6Vmp3RUFMYWlDcDdOeTM0NjhQZ01KWlU0bUVJ?=
 =?utf-8?B?R0Z4d1VZNHFsVHR2c002L1hMdkg1T0paNVNNQXhvRTlMdzRiaENJTEVoQml0?=
 =?utf-8?B?bXBqZTJoSWRYUDl2YjdDZGdUMnBJS29hN2V2OU9NTmIybmROOENVeTJlRGdD?=
 =?utf-8?B?VWhGOFQvN0JXRnc4TTg5dDVyak5wQXBIemY1RDRUSUMwbExaUUtqM0NuTDh1?=
 =?utf-8?B?dzBDb0NibFNaRnk4ci9MRmRPWDVuOHNuQmZOcG83SEtxZ2o4Ym00eFNyNUVG?=
 =?utf-8?B?VW1nMitsaVpVUlNLMENRMWpuMjFEYnd6TlBCeklTU3BWZEFqeThNNmVka0lo?=
 =?utf-8?B?ejE4endxdzlnQWI5ZDRMMzJjM0tGQ2xlYjN1SHY0dTZrbzFRdTdlaERUMUR5?=
 =?utf-8?B?T0l5U2ZITWdNWUZkK0MraWc1aDV6T01oUUNZUFhxVXZNM2ZHN2pYcjY1ZW5y?=
 =?utf-8?B?U1BSZ0Q3OEJnWFB2ZXU4MVZmaEJTMEQrdEk1Um1hOWI1WWpXNy8zbmNSOEVE?=
 =?utf-8?B?ZklJdkh2QTF2V2kvWC9DWmNXSEdjcEcrSWNxc3RmSUhSR0hSdGU2b0Rtc2hM?=
 =?utf-8?B?c3FoOWdVVlM0RGp6bWN5TmVOVlZudnlNdEtqZDNiOHJuZFZ6aVhNdFRtMkhO?=
 =?utf-8?B?U25ZRkNlc0paSWVHZHA2QU1ac1dUbG8xQkdSRUpyajRGRmhQTHFjclFYOHNO?=
 =?utf-8?B?ZTl0TGc2VHBTR1A3enlzM1VNbHp2UE0wSDIrdkNlMkdRMTREZmg3S0h2OFlr?=
 =?utf-8?B?TFJ6ZnBkNVhUa3Q2WTZhejluNHMvbnFNaFlReXgzRldhTWxkZzlEazN4YmQv?=
 =?utf-8?B?SXFTSWM2eHlORG0rRHFFK245c0xZdnJBVUVOYnJ5S3lUVjNMTVBjTzRXM05s?=
 =?utf-8?B?ZnFVNUJoa0N6dU5PSi8zTEdKd01RdlY3SXVCUkFzSEFWNUJzaWhxMkVlUDRO?=
 =?utf-8?B?Q29JYWZiWjBiWFp2QjlVQzJGbU81Tm9hOG9vOGxiTTQrcFVUcm8zdVhGaEhk?=
 =?utf-8?B?VnY0NXVNYnM4MzVybXBaUmVDYUlxa2dLbklVdndyVWVUS3ZkakxWbDNxalZD?=
 =?utf-8?B?ZjFPUUtDcXVrL0cxKy90ZGxyaFJSV2p4RWFiSmJjZ1VwWnBaMlkydWhZREtm?=
 =?utf-8?B?YWlmVi84QktzaGFjZ0sycVFLUFgxaHVVa0tKNTBoNVhPYWlDNk13Si9NS3N5?=
 =?utf-8?B?TkYwdVFDbmxSZkVCTFN1a1d2WmVBUnFFUXJSSkozdHhxV0dVd1cvMDhaSmNW?=
 =?utf-8?B?dzRjNzdXOW9Oby9hckFhUEFrUGNqSVllL3FnSmNCV2dKa09nd3NpUmVjMUdt?=
 =?utf-8?B?cXQ4QUdTdzNweDNQRkhFKzVUWG1OcWx4TWYyUEpFNCtrTDJKUVZSQUx3OWNn?=
 =?utf-8?B?bklOMVBvQjFRMDBYbi8xak1sdDZLQzN1NUZGY1A5VzdxUkhLd3BmaS9iQUlB?=
 =?utf-8?B?aTVyTmJxNFFieFB3Y05NMXBaZUxiRzREcG9JNTczT21XbXQ2UVlJdjhBYWZk?=
 =?utf-8?B?VERMQlpudGtHRjkzNWh4SWl0WklrVVNQTHcxWGZIaVFpWWliL3liZlZqVW00?=
 =?utf-8?B?SHpGbCtJMHE3eXVxVndZK2FpdTZZV0JFZDAzdW1FWmVDd2N1ME1CYWk5aVZB?=
 =?utf-8?B?K1RmSllpMHhlalNjd2JkbWw5R2U5YjlMQWt4d0JGZi9hUTV2a2NDSXdhSjVm?=
 =?utf-8?B?ckhLUGR0K3JQOFpENDMyWkN4M0Y0Wmo2YlJJR0UrdXNPWjhWWXZFUFpYd2hO?=
 =?utf-8?B?eU5FTWc5ai82VXZUbHhQK3hrR2h4Wi9KdGpER2xSQTJxQklRVzJaSEVxYXRk?=
 =?utf-8?B?ZXBCQ0R5emtjRkpTU1dzQy9MRGkrYXdPaVNDc0Y2SDZCbDZSYUttdGFoSDBW?=
 =?utf-8?B?UitNSUswS2dIT2J0RU5aMFlxdENSSkVYWFVoN2x5Tm13VzlueFhoQmgvdEY5?=
 =?utf-8?B?dTFIUkxOQ3U2TXhEak9sNDZ1YkdBWWJLeHJGbmt1WkptV3BMeEFnNmtVQ0Jr?=
 =?utf-8?B?UE9ma3NzNCtqV1QxWFpnMUIyTzdwK0dQNzM5NFRHYXg1NklGa1VTa04yalJ4?=
 =?utf-8?B?b3BQWEo0M0ROK2FaZzZHbW9HZWphUFZvNUJ0eGJCMk9KbkNXdFN2T3ZXVnh4?=
 =?utf-8?B?WFE0QUJVR0pOenk4ai83VUw0cWdMODBpZW5TZzJqWjdOWjI0YW1OL2RDaktu?=
 =?utf-8?Q?wzfr968ezNeZ/hvibWKx+80=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blFadTNsUmZaaHZ1LzI0azROeVo2cjlmd0dVN050blVPeDBLbTh4QnBHY2pG?=
 =?utf-8?B?dTdXeisrYy9aUUkyS1FITU5rOG1UdTlYL3hiN1ludVdTbEQ5TWZqcHhsYnY5?=
 =?utf-8?B?bWR4QlZsWUtFMXBiMlovdWR5KzQ5TmI1N3NtZ1k5SUM1WS9DZjJRMW1oNVlL?=
 =?utf-8?B?eDNmbENTbzgwWXV1N3hJRmFWblNLQ214eGJTN0JYVEx6c3BhTE83MWV1emEv?=
 =?utf-8?B?Q3gvaUlnVkJxL0Z1Ri9mN2pJRTI3RjAyY3J2d2RnYjVicnhRcUt1YWpXK29V?=
 =?utf-8?B?clI2WGZLdzlaalJlSktRazRTQ1BWcVV4cXBNZ3Q0Yk5aUmxRNTJob0prZE5j?=
 =?utf-8?B?OFJFL2w5c2dLNHRDZnhESHZCeTh1cmV1Q1hXcDVWR1dVcVpwT1RGUUcrT0Fo?=
 =?utf-8?B?aUhkanBSOXdnaStHbG5IaFhtc1c2dDlCRXY5dWJ3c0FWR09OVnZQbFltMDVj?=
 =?utf-8?B?Z2RWd0gzdlU3MXB5a3lSTEhVdkx1bWFScHgyMWhubC96MVFnVUpvRFQ0TzN5?=
 =?utf-8?B?akg5RnJMaC96TmFPcnI1MDg0T3dRNVZXVlQ5M3NsM2xmME91UjFLMkZOeW4z?=
 =?utf-8?B?RVYzSTNZL2ZnY0RXcit6ZDdXajAvOXVQdDV4ZyszUkg1Yk1jSndxY1IzcjFD?=
 =?utf-8?B?RHBsNWdJUWw0aXlnWXVIOVNtaVplMFpZVFd3OXdSM1FXZ1o1aDJURjRnZUZv?=
 =?utf-8?B?d2wxZkd1ZGpvbEEzZDFpYkRFbTJTeXBOUU41QVNIelNNQVNKVzNBcm01QUFE?=
 =?utf-8?B?bU1NNzhVdHNSakxIUkV4bEh6YWdHQVdEYVVnWlBiRStrdXZuODNrQUFJSE4y?=
 =?utf-8?B?OERndi9NTWdSZFNpcmNIRnB5MzlBdFh0ZExvR0ttdXdpQko1V1JZU0locyts?=
 =?utf-8?B?S0JUcHkvY085b1cxZkZ0NTFEd0dlNDRIN0xXTm9jTGNFQmdBYTRZMjJrT2tZ?=
 =?utf-8?B?NWVUOHRnQ1BWRHlPNGo4U1A5QmdaU0V1VWQra0ZSakxlRW4vU0dONit3WGRH?=
 =?utf-8?B?UFo0ZGk2NTloR3NENHBKS3JuYXl0NzF0VnZCaktpNmh4Z1cvTTdjcWF3bG9s?=
 =?utf-8?B?aDhFcm56bXk4Nm0vU2s4cExqMG0vYXMwbFpnRDBzNXVaMldMdUlHcWxiSVNO?=
 =?utf-8?B?QlorUGIzTnJ3ZStrbkJFMVY4RE1NZzdTNFE4UStQaE5vZTNpb2pEdEw5b0Q4?=
 =?utf-8?B?UU5CVXlRS1J1ckE0NnExaE04WXJaMGViaytBWGUzdEhIZC9WemhqNElvdnhh?=
 =?utf-8?B?a1VCNUxXMTkwVmxhV1pqTFN4R0h3T0lHbDY5WThmSi82ZDBKWGFVbFF2bGp1?=
 =?utf-8?B?VEUzRGZNTkx1elpPYjcyc2tXYmozTEtVTjFWeUZQT2JlQWZ6MUlSVjdDZzQ3?=
 =?utf-8?B?cnVxQ1dVQjB4bHJKM0NjUVJKaHpQbGo5aFlqKy9tZC9XQ2QvOVhDeEJKV0Qv?=
 =?utf-8?B?RERmSVRObWlBeTFiUSt6WlhscWlhUmdsYW1SNlVLdXdOUVVKbStYZjlDTVZh?=
 =?utf-8?B?alFhK3lYenl4cy9RZVM0cmgxMlB0ZjFBSGJWd2lINFplQmlyV3NVRHlUb29l?=
 =?utf-8?B?ZHdITFBERWNUVklMWEpZZ0hvNjE1TTZqNk9wZzZOcVFWSWwzYWRYSEF3QllX?=
 =?utf-8?B?OERhaStjOUhuNHc5bStYQWpVa1BmdHZVdFd0OHIveTZaUjY4WHB0K1lxTG05?=
 =?utf-8?B?WFozcFdTbnNndjI0STljVHIyKzlCYVM1TVhaQTgvTmJFaXFVSDJVTVQ4SlVU?=
 =?utf-8?B?cUR2ZERJalhvOUMyWVdvMWZZMCtjaEJxRFMyYlMyWGVFUUhnQkJoekYrcGJM?=
 =?utf-8?B?NlRtRlQySDFWMXJzbmxxaFo2bG1ITlJiLzhCMWV5b3F2bzdCWUFIbWZuTmpJ?=
 =?utf-8?B?azFSYnJWb29tN2RLZXM2NUVlRXY4b0Q2eWpzWEp5cDhRWloxZlgrV3ZlVHp5?=
 =?utf-8?B?UTQwSUY0VFUxa3p6aTBXeFdWQUtNUUN3YUFHb3NiSDNCd3p4VUNUZG9QeWla?=
 =?utf-8?B?VGVBS2owREtUMCtCZjBuenFHTE5UWVErTWl0OGVCU1J4aHRseGV0bVJ5MDFu?=
 =?utf-8?B?cmluYzhoeW1lWjV2OTM5cEVtSjBMMjBvK2ZnUVllcFJkSWMwSkhBUUsvVDJx?=
 =?utf-8?B?UkVJV3dFUVZvZzBuOEgxOHZZY3hoM3UzcnczdDVDelJML0NVcmpJYWc5N2pM?=
 =?utf-8?B?ZUhqcXBXKzVDNkwxcjRYdXZsejVKdTBiRmt4N1RDK2ZRYU5YazMyQnh0QXJh?=
 =?utf-8?B?M2VnR2Voc2Q4V21YMDMrczFqdms3ZExTNytwSWRBNGl0VWFZRXFyOWtMQXlK?=
 =?utf-8?B?MkRlOG1lVmpyYTlLVzBqLzNFcG15Nk92azRlbktob2NkdlluWWgzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D3D56736394C745A1C5B27B8305DB24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9da25c-f545-4c29-95c0-08de54dec599
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 09:08:10.7817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7UMLCqI4WEQZa2sabgEZ3aLPPSSiGjstLMYTtiis3Pb5UHeP8ohqIyHumtB598vIabCx5x0VEAT3NzLJ+X8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7332
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_010823_774469_BDD63A7A 
X-CRM114-Status: GOOD (  18.23  )
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDE3OjIyICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IFRyeWluZyB0byBmaW5kIHRoZSBuZXh0IGJyaWRnZSBhbmQgZGVmZXJyaW5nIHByb2JlIGluIHRo
ZSBicmlkZ2UgYXR0YWNoDQo+IGNhbGxiYWNrIGlzIG11Y2ggdG9vIGxhdGUuIEF0IHRoaXMgcG9p
bnQgdGhlIGRyaXZlciBoYXMgYWxyZWFkeSBmaW5pc2hlZA0KPiBwcm9iaW5nIGFuZCBpcyBub3cg
cnVubmluZyB0aGUgY29tcG9uZW50IGJpbmQgY29kZSBwYXRoLiBXaGF0J3MgZXZlbg0KPiB3b3Jz
ZSBpcyB0aGF0IGluIHRoZSBzcGVjaWZpYyBjYXNlIG9mIHRoZSBEU0kgaG9zdCBiZWluZyB0aGUg
bGFzdA0KPiBjb21wb25lbnQgdG8gYmUgYWRkZWQgYXMgcGFydCBvZiB0aGUgZHNpX2hvc3RfYXR0
YWNoIGNhbGxiYWNrLCB0aGUgY29kZQ0KPiBwYXRoIHRoYXQgdGhpcyBpcyBpbjoNCj4gDQo+ICAt
PiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCkNCj4gICAgIG10a19kcGlfYnJpZGdlX2F0dGFjaCgp
DQo+ICAgICBkcm1fYnJpZGdlX2F0dGFjaCgpDQo+ICAgICBtdGtfZHBpX2JpbmQoKQ0KPiAgICAg
Li4uDQo+ICAgICBjb21wb25lbnRfYWRkKCkNCj4gICAgIG10a19kc2lfaG9zdF9hdHRhY2goKQ0K
PiAgICAgYW54NzYyNV9hdHRhY2hfZHNpKCkNCj4gICAgIGFueDc2MjVfbGlua19icmlkZ2UoKSAt
IGRvbmVfcHJvYmluZyBjYWxsYmFjayBmb3Igb2ZfZHBfYXV4X3BvcHVsYXRlX2J1cygpDQo+ICAg
ICBvZl9kcF9hdXhfcG9wdWxhdGVfYnVzKCkNCj4gICAgIGFueDc2MjVfaTJjX3Byb2JlKCkNCj4g
DQo+IF9jYW5ub3RfIHJldHVybiBwcm9iZSBkZWZlcjoNCj4gDQo+ICAgICBhbng3NjI1IDQtMDA1
ODogW2RybTphbng3NjI1X2JyaWRnZV9hdHRhY2hdIGRybSBhdHRhY2gNCj4gICAgIG1lZGlhdGVr
LWRybSBtZWRpYXRlay1kcm0uMTUuYXV0bzogYm91bmQgMTQwMTQwMDAuZHNpIChvcHMgbXRrX2Rz
aV9jb21wb25lbnRfb3BzKQ0KPiAgICAgbWVkaWF0ZWstZHJtIG1lZGlhdGVrLWRybS4xNS5hdXRv
OiBlcnJvciAtRVBST0JFX0RFRkVSOiBmYWlsZWQgdG8gYXR0YWNoIGJyaWRnZSAvc29jL2RwaUAx
NDAxNTAwMCB0byBlbmNvZGVyIFRNRFMtMzcNCj4gICAgIFtkcm06bXRrX2RzaV9ob3N0X2F0dGFj
aF0gKkVSUk9SKiBmYWlsZWQgdG8gYWRkIGRzaV9ob3N0IGNvbXBvbmVudDogLTUxNw0KPiAgICAg
YW54NzYyNSA0LTAwNTg6IFtkcm06YW54NzYyNV9saW5rX2JyaWRnZV0gKkVSUk9SKiBmYWlsIHRv
IGF0dGFjaCBkc2kgdG8gaG9zdC4NCj4gICAgIHBhbmVsLXNpbXBsZS1kcC1hdXggYXV4LTQtMDA1
ODogRFAgQVVYIGRvbmVfcHJvYmluZygpIGNhbid0IGRlZmVyDQo+ICAgICBwYW5lbC1zaW1wbGUt
ZHAtYXV4IGF1eC00LTAwNTg6IHByb2JlIHdpdGggZHJpdmVyIHBhbmVsLXNpbXBsZS1kcC1hdXgg
ZmFpbGVkIHdpdGggZXJyb3IgLTIyDQo+ICAgICBhbng3NjI1IDQtMDA1ODogW2RybTphbng3NjI1
X2kyY19wcm9iZV0gcHJvYmUgZG9uZQ0KPiANCj4gVGhpcyByZXN1bHRzIGluIHRoZSB3aG9sZSBk
aXNwbGF5IGRyaXZlciBmYWlsaW5nIHRvIHByb2JlLg0KPiANCj4gUGVyaGFwcyB0aGlzIHdhcyBh
biBhdHRlbXB0IHRvIG1pcnJvciB0aGUgc3RydWN0dXJlIGluIHRoZSBEU0kgZHJpdmVyOw0KPiBi
dXQgaW4gdGhlIERTSSBkcml2ZXIgdGhlIG5leHQgYnJpZGdlIGlzIHJldHJpZXZlZCBpbiB0aGUg
RFNJIGF0dGFjaA0KPiBjYWxsYmFjaywgbm90IHRoZSBicmlkZ2UgYXR0YWNoIGNhbGxiYWNrLg0K
PiANCj4gTW92ZSB0aGUgY29kZSBmaW5kaW5nIHRoZSBuZXh0IGJyaWRnZSBiYWNrIHRvIHRoZSBw
cm9iZSBmdW5jdGlvbiBzbyB0aGF0DQo+IGRlZmVycmVkIHByb2Jpbmcgd29ya3MgY29ycmVjdGx5
LiBBbHNvIHJld29yayB0aGUgZmFsbGJhY2sgdG8gdGhlIG9sZCBPRg0KPiBncmFwaCBlbmRwb2lu
dCBudW1iZXJpbmcgc2NoZW1lIHNvIHRoYXQgZGVmZXJyZWQgcHJvYmluZyBsb2dzIGluIGJvdGgN
Cj4gY2FzZXMuDQo+IA0KPiBUaGlzIGlzc3VlIHdhcyBmb3VuZCBvbiBhbiBNVDgxODMgSmFjdXp6
aSBkZXZpY2Ugd2l0aCBhbiBleHRyYSBwYXRjaA0KPiBlbmFibGluZyB0aGUgRFBJLWJhc2VkIGV4
dGVybmFsIGRpc3BsYXkgcGlwZWxpbmUuIEFsc28gdGVzdGVkIG9uIGFuDQo+IE1UODE5MiBIYXlh
dG8gZGV2aWNlIHdpdGggYm90aCBEU0kgYW5kIERQSSBkaXNwbGF5IHBpcGVsaW5lcyBlbmFibGVk
Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4
ZXM6IDRjOTMyODQwZGIxZCAoImRybS9tZWRpYXRlazogSW1wbGVtZW50IE9GIGdyYXBocyBzdXBw
b3J0IGZvciBkaXNwbGF5IHBhdGhzIikNCj4gU2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2FpIDx3
ZW5zdEBjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyB8IDIzICsrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYw0KPiBpbmRleCA2MWNhYjMyZTIxM2EuLjUzMzYwYjVkMTJiYSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC04MzYsMjAgKzgzNiw2IEBAIHN0YXRp
YyBpbnQgbXRrX2RwaV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+
ICAJCQkJIGVudW0gZHJtX2JyaWRnZV9hdHRhY2hfZmxhZ3MgZmxhZ3MpDQo+ICB7DQo+ICAJc3Ry
dWN0IG10a19kcGkgKmRwaSA9IGJyaWRnZV90b19kcGkoYnJpZGdlKTsNCj4gLQlpbnQgcmV0Ow0K
PiAtDQo+IC0JZHBpLT5uZXh0X2JyaWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZHBpLT5k
ZXYsIGRwaS0+ZGV2LT5vZl9ub2RlLCAxLCAtMSk7DQo+IC0JaWYgKElTX0VSUihkcGktPm5leHRf
YnJpZGdlKSkgew0KPiAtCQlyZXQgPSBQVFJfRVJSKGRwaS0+bmV4dF9icmlkZ2UpOw0KPiAtCQlp
ZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiAtDQo+IC0JCS8q
IE9sZCBkZXZpY2V0cmVlIGhhcyBvbmx5IG9uZSBlbmRwb2ludCAqLw0KPiAtCQlkcGktPm5leHRf
YnJpZGdlID0gZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZShkcGktPmRldiwgZHBpLT5kZXYtPm9mX25v
ZGUsIDAsIDApOw0KPiAtCQlpZiAoSVNfRVJSKGRwaS0+bmV4dF9icmlkZ2UpKQ0KPiAtCQkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZHBpLT5kZXYsIFBUUl9FUlIoZHBpLT5uZXh0X2JyaWRnZSksDQo+
IC0JCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgYnJpZGdlXG4iKTsNCj4gLQl9DQo+ICANCj4gIAly
ZXR1cm4gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgZHBpLT5uZXh0X2JyaWRnZSwNCj4gIAkJ
CQkgJmRwaS0+YnJpZGdlLCBmbGFncyk7DQo+IEBAIC0xMzE5LDYgKzEzMDUsMTUgQEAgc3RhdGlj
IGludCBtdGtfZHBpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJaWYg
KGRwaS0+aXJxIDwgMCkNCj4gIAkJcmV0dXJuIGRwaS0+aXJxOw0KPiAgDQo+ICsJZHBpLT5uZXh0
X2JyaWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZHBpLT5kZXYsIGRwaS0+ZGV2LT5vZl9u
b2RlLCAxLCAtMSk7DQo+ICsJaWYgKElTX0VSUihkcGktPm5leHRfYnJpZGdlKSAmJiBQVFJfRVJS
KGRwaS0+bmV4dF9icmlkZ2UpID09IC1FTk9ERVYpIHsNCj4gKwkJLyogT2xkIGRldmljZXRyZWUg
aGFzIG9ubHkgb25lIGVuZHBvaW50ICovDQo+ICsJCWRwaS0+bmV4dF9icmlkZ2UgPSBkZXZtX2Ry
bV9vZl9nZXRfYnJpZGdlKGRwaS0+ZGV2LCBkcGktPmRldi0+b2Zfbm9kZSwgMCwgMCk7DQo+ICsJ
fQ0KPiArCWlmIChJU19FUlIoZHBpLT5uZXh0X2JyaWRnZSkpDQo+ICsJCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRwaS0+ZGV2LCBQVFJfRVJSKGRwaS0+bmV4dF9icmlkZ2UpLA0KPiArCQkJCSAgICAg
IkZhaWxlZCB0byBnZXQgYnJpZGdlXG4iKTsNCj4gKw0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsIGRwaSk7DQo+ICANCj4gIAlkcGktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2Rl
Ow0KDQo=


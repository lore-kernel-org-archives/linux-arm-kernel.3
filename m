Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEBDC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=; b=kD39gq5Q/ubzrvQ2sQFP3FtTWR
	6GWhsPiKV1e/oUR+B3soEBB+Fv22e8LEWvF9K0QmEG+J3LonAysHzKXNv8HWPOzsvmXEtH79Y5cIQ
	expih4xcGtEX5s/6UHISOXGZ+TUqX9LEMxqlWwfqVj5Uqwi8ULLN9yrVOkzrUNw/4+iOlsk/LtGam
	nZYKz3n5BCXDU25YXgUAtBMySHEi8MBxQPYdbomF6Oj4XCPCjbgiBFiS11odBLp9p69mb/bJcy/PJ
	7tyZT7lhsIHAduYWOSIOBgxZ6QHErtkuFXVzCQDu1xgxwFGlQACs9kNNA0SBeCQgtjMMKFiSIuDMq
	kCvtduGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHk3-00000008Qzw-3FZo;
	Tue, 21 Jan 2025 17:08:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHim-00000008Qnc-08g6;
	Tue, 21 Jan 2025 17:07:25 +0000
X-UUID: 2bc0d6a4d81a11ef9048ed6ed365623b-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=;
	b=aiIVmiGW4VP2RicDB/lT4uzxIUDfu4j+rX2JrXzUclMJCsjxeYJsR2utEEYR/SBjg16iY68K7D2+oLLzLd+zZCvPhcE/4qlfewzKGYtO4SpAIg0YLAQm9EQ6hXaQ/KecEzE3Qm80KDjV6aeNyp7elL37UnI08kIF2C+33mEkjEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:093668a4-cdab-4d18-a440-8afd30c5ba8b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:9e653d38-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2bc0d6a4d81a11ef9048ed6ed365623b-20250121
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 537535250; Tue, 21 Jan 2025 10:07:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 01:07:15 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 01:07:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUj2PxIcDCas3UdMdWp2C7Fofquu3UXAuj8zPY6X06S4gy+jk4Inun8Q02xxq94Q7YEyuOvpBnQd9yxKE5SkecZ8ymkJFc3VhjHAkZIKAPEBVCfum5fj9B5f5d9bTOnCFfHjskk2IyYOQxP0jQx2TrpkdMjH1ZRtzUB1ZmZW5JyvhTcqZZtUcOI0sfCIfQYRFXH5E4dIGkWFxWthU5vjOjbbM8ohNAi9WKdZHdGnIlVwC5ZBBlRw1ltC6y5+pxdYkrB5rGveMI87DgTtdrtQWDj2dBJwIO6nY6IPaKtls951AvtuojIOCZMqmI7QKIbc/UNL/C+J8k3XO6/HU6KzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=;
 b=cXpHLJJEcMSWyL+Bn60kXS12Lzn870TFirp0woYG69rFZybLy1VBP3Zh4NAvzxGvgq8lWIcNaetojGEi/neg8+4OlkBxcWqMg9bJerfcNM2eEOQIEl/PSi0m6eJ1JWRKqtvXzp0yHzQvUQqXEJ+/NzSeYMQkm1wITN1gbUyiANSj2ODAPdnrFClEgab6VS97lhCZu9fx3DRjqtoYFTybWYv6v/IiRRZDVs7+OVOe6X7+nzVDKFmRRK47Q98KhG9uQfK1s94RE4hzZXYN+Fvhv1tMq75l2HpwwZ3VVLJIDhWMvsg4XbB9HtVg19gfwNyfSDxltIreTEbkAuIma4yLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=;
 b=mD8cxfral1SHuciY4a/4eYkui+WAcR5kBBHiMW38DkAiSPvQQg75feNDGNoZXBVy9l8Io1ObRlEofgHktjVO9f5YtrwPQll786mfEW9REz4rBfFRT1d14pZ+T1AKF70grbqZ1E2+4ivGpbH5e8mIB0zPAa0gfYwI8+rVTRxeCRQ=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEYPR03MB8792.apcprd03.prod.outlook.com (2603:1096:101:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 17:07:08 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:07:08 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrF5tAYKZENUWonbDbyeckJbMP+LiAgArXxYCAAXEmgIAFRXCA
Date: Tue, 21 Jan 2025 17:07:08 +0000
Message-ID: <6265ffc5f94b03fbd45985d867e38c9e308074a4.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
	 <20250110123835.2719824-4-paul-pl.chen@mediatek.com>
	 <abadfae8-56f7-499c-83ff-7d79e3fe1f52@kernel.org>
	 <c1440608060e4b2fabf07ff5ac0a7fe49201ba9d.camel@mediatek.com>
	 <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
In-Reply-To: <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEYPR03MB8792:EE_
x-ms-office365-filtering-correlation-id: 04275c67-469c-4c2a-e3ba-08dd3a3e09b2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YU8xOUxzVWtDZWIwMzNrUFhkcTlhMzFiZUN0SmV4UlRBRjFQYmVYM3JJZGEz?=
 =?utf-8?B?MWg0cTdSdEQxelpzUVlKSkV0bW1Ya1ZOZ0s1QUozMFdnd0ZzNVV4blRvOE15?=
 =?utf-8?B?dEFnSWlQL1NPVU9GUzNHRjdnWW81elplNEw5OW1jbS8wWGNTb3NUMERLQ3RN?=
 =?utf-8?B?Wk05QkFlNFJYV21TQ1J4WDNjTXJ1clZqcm9FYkYydERaVWx3dVZvTW5Wa2cv?=
 =?utf-8?B?MytXS0dYRXV5Ym9vajBxclZWV2hZNlpFOWdkenkwdmRsOFVIQURzbi9uVCtZ?=
 =?utf-8?B?Wk9jN1E5cVQ2NzZaaXJyVnNwTE02aCtLNzE4Y1RhZzJURUNZRUhReUh1d0Js?=
 =?utf-8?B?Nk01QkJpSzFjN0djWWxHUU9MaFY5WUlzLzhURmk0ektkTXRROWxTMXB2em9M?=
 =?utf-8?B?OXhpRzZiL2lOakpENVZYNXdZeXA5ZTZtcEQ0bEhWbkJWUU5TeWZpOVh0K1ND?=
 =?utf-8?B?OElBeDFuaTJsRWhzTHlIRGFqdDNZNWhPVHkrUlRCVXBLclo1QVk5U3grTXVU?=
 =?utf-8?B?VTRmaHJ2YkJvRDh0cVd1V1N3WndXNE5ibElWMklxUFB0UjkrdWMzSnA2L09l?=
 =?utf-8?B?amh3NmFlbDU4RDd4Y0FaSUI0WFJ5RkNBenZaOVVKRDQyWi9zQ2djYUVjMmtl?=
 =?utf-8?B?cUdHK3dMaVdDYTZZdzRUL2h2aUZkUG9uakVLVUZvRTQ1MnlZc21XMERUbU81?=
 =?utf-8?B?R0dZTjhLaTJZcU9Wc0hPTTMwdmpUMFU1TklMandsNW1PcldONWxObDdRTGwz?=
 =?utf-8?B?ZkZadk0vYk5XQTU3L0wyN1pWNGtEK1VkQ2lvV3l5WUtqcjlIemlOaGVRazRz?=
 =?utf-8?B?a1lpcWxVVng1Y0hOK2FJd2ZxSUd1bEQyVndja2p1SFFVcnB6Q29VdysyTkg5?=
 =?utf-8?B?bFhZZHd5YzNrS1dlYUhtU2lOVjdBQ0gzMzVFSXp5L0wwcytvVnQyV2hQRVdV?=
 =?utf-8?B?VWF1VmJOc1VtL1lSaURKdVgrZ3ZRYWMxVW9uUzA2MU1FYjFCZ2daT1VKSzZE?=
 =?utf-8?B?d0srclpSY042d3AvdWhaYVVQOTlJYjlBWUtWbzc3eGRuQTNCR1JkSkwrYUl2?=
 =?utf-8?B?M0JmVGNCNVU2ZFRjT2p3WDE0U1pYakI2bzI5VXlQL2hZcmd0dVpxd2dCQXpH?=
 =?utf-8?B?RnpaY3g5b2JhV1U2ZDhJcm1RK2g4ejhjMHlFdFR4N2RZWEtQZDVvKzFEV0Ra?=
 =?utf-8?B?c0gxaFlxMSsrbWtvUkxhRlNPQXR3Tmw4ODk2TlNQUFdSNWd6S1AzelVGY1Fs?=
 =?utf-8?B?WWVSUFlEdkIzaWxtc2YxbExNOXh5ZWJnQ3Z4NFNYYnRDVXpxMkUvNE1leGcv?=
 =?utf-8?B?dEkvOWtSVnExQVJTWmlFWlZnL2llTnh5YmoySjhMTnpNdTlzRzZwVE1EVnZU?=
 =?utf-8?B?dXNJMjNZUFR2djVPT29yQmFWQm1sY2crbytXdlE2L3VGdjlEOEI4OWFlZFBw?=
 =?utf-8?B?ZXovSjZhZUJvOU5SS2E4NVdYS2p5c0JjbldLa2RFTmVkaVpLdy9CQmtsMzk1?=
 =?utf-8?B?OHhWSnRIYUxRbGxzM0lmQnF4WU91Y1BCRUhjZ044bENxUXQ2QzQxSlhseXhH?=
 =?utf-8?B?Y1pzOW5xNkM5bW9DeWZmamdpeFBzYWFwSnhNWklQdE5Kb2drQ1hLSi9saGhh?=
 =?utf-8?B?L09IM25NRmxDQitxbytFSHJwRVRUS3V4elRjWVVJeTR3d0ZQbHVmcEw3d2dM?=
 =?utf-8?B?VjhJc2QrdWRnRGJIMTlsREFxSFc1KytwOGxzaFR1dGVzL0xTNXEyL05GSVBh?=
 =?utf-8?B?VmJEOTgyQUwrTEN2aHJXNnhNVGFrT21ISmpPdHdySnJMZHJLdjl4Umdqbytx?=
 =?utf-8?B?NWovcWtDMTRodUh1dXkzZ3BEazZHK3JUNGorSXBCeExGR0w2ZCtwRU16dkJK?=
 =?utf-8?B?a3dHUFdjWWQ5cllxTFdFKzdQY3RzOVBZR1VjWU1jMEZ4cUgzY2RQY1pUOWlh?=
 =?utf-8?Q?JWjeLBG4UTK4qQtM4ZjTX3LJKfK54W9Y?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djRjMVBCY09NT3VDVk13ZVd3S1BLazVKUE91d29NaHgvTGg5QXlTdnp4V0M3?=
 =?utf-8?B?RkNabFlwanpodDNSYWt4dWVmK0FkZmNhaWRCMHE4WGZqSGtaZVZrSnJkblZs?=
 =?utf-8?B?S1I3TmxwRnFBQS9vdHNwSkxuT1Y2V2s1cjdKdm9Mb2RzTzhCQmpIU21idjZx?=
 =?utf-8?B?RVlTWHNWb3pWZHdkREd2eEtzSEdNVlI5RmV0U2thQjNsRlF1MXFlczQ3Tk5U?=
 =?utf-8?B?eUtYSmdycTBjcFhmUEE4ZkxyQm5WSmVIUGZzL3FaL0hiRm43Nld6aEVISWdV?=
 =?utf-8?B?NDZLb0pXVy9Jd0lYcEFoWmViM2tVTm4zbEIxa0xvVVdOOTQxNkk0elN4L2Rl?=
 =?utf-8?B?cDFjZFRobitSc09iRTg5VlJJVEdUV2xEdEhzNTNTSjIyTlJ0dDgwU28xRTVk?=
 =?utf-8?B?UUcvTzFOWmZsUFVoZEcxMjNYMGxBUjRpVUZvY2xVTFpmTTJOdlpTbFg2MWEx?=
 =?utf-8?B?L25zQlp1cFc5NEROeHQyZXZSM3NKOTlpZUZrNjllOWE0SW51cm8xZnRzc2N5?=
 =?utf-8?B?bm5hdVJGamhqeFVUTVZ4dlRwOU8vWWNPYkVvQ1Q2QUd1a09YRkFpdXNEQkhH?=
 =?utf-8?B?eWdEQmE4dEJONW1uM3ZJWjV6V3E2RXAwRFo4MGNPRzYrVElxTFpaRzNMYlZH?=
 =?utf-8?B?a0ZjaDZUREFnZEx6REh1Nkw2dkFDOUVwMXlYWDI4dVh2VHhmWE5tYm1XcSt1?=
 =?utf-8?B?SWlKN3pBR2NtMGJOREhMT01qYWtqVFBJTU50QnF6eGFxRHB3VE1sUlV5S0JP?=
 =?utf-8?B?ZnJKazBEV0ZZeXB2TXVac3VWbTBwc3JYa25GR2RxcWNVUlEwcFBXWGxGY21y?=
 =?utf-8?B?ZzVORGpvTVJZYkpDVWlZWWIvRVB0bUZGWnRqTlpVbmlpTWVYNGtPS2dicEhP?=
 =?utf-8?B?TjJkQzZNNDdmYW9rZUpUa2YrV2t2Nm4zTDB1TUpIK2xEUUZlNTRQQkJ4NGdm?=
 =?utf-8?B?MElvN21GQ2o0SFN2cEJ1TUVzSUZNekp4T2RQSVc5QXNBMks1Z3lMZmdCVUl4?=
 =?utf-8?B?UXRFMXQveERQT1lzRXpYKzVZcVhXdGtUYWhxdVRieUJZU3g1K2FrZms1UEtX?=
 =?utf-8?B?MFlUcnJlMDVjSGVpRjYvWkxCRUtyeWkzb0RQeE00elNDVlNTN0U0eThRMDly?=
 =?utf-8?B?MVk5L0ZvTFpybGNTcWMvUXNLVjdOMDZxNXFCejFVQnY3L3dhUzNZbDM2aS91?=
 =?utf-8?B?SnExSWQ5NlY5N05zZXprNVRocDlTUWt5bUlPdXBkU1J6blBsOU12K1pEbFk0?=
 =?utf-8?B?MGs0YXFUQXpvbjBXdm9ZSzNpYkNIRStTODNCUzh6ZVBxN3hxUnB6WWJ3ODhi?=
 =?utf-8?B?TzMzZzB4b2lWSFhrcWRiT1RUL0w0YVpDcGxtUWU1ZTR2SjhEVlNsUUFaR2ZF?=
 =?utf-8?B?cCtEb0NQWjQ0M0dpd2sybUpDblFqY0N2WlFqZ25SWDlnNFp1b0ZXUzVoaTlj?=
 =?utf-8?B?WHdOeGQyWHlmTEhHeklDaENPcHNPczNPTDh3Vm51c3RVZUt3ZkEwbnluY3RP?=
 =?utf-8?B?REhkZkxlQk1PTi9seVV5aUI3NnVNRWZKUEZrbGtiUW52aTdkUWx0SmEveFBV?=
 =?utf-8?B?Z0YvcU84V2RnM1ZrNEpoei9OYVIrSWFOVkk3MGVNR0RTVnVpMlBtdXNRTWYr?=
 =?utf-8?B?bTFSQTJlL2VmUFJoQ3hRdjM5UTE5dUpsMTE2YVFsZHNCSHR6dzZSWTQyM08w?=
 =?utf-8?B?NTdyYyt1Tko1eUtxOEhkUGNBVFR0NzVoeWJEVWVGTU1OZTZBQnZUMkc2dkZk?=
 =?utf-8?B?VWpUdDNKL0RYbG9Nemh3NUkxVkFhSy9xOVdlS2o3cFlBUTN1TjgwQno5M2Jz?=
 =?utf-8?B?ZElDMnVZYXAwNk9xWmtFREVHVTUxTUc0SFp6aTFpZ3RMVmdEZ1NRQ0o4em43?=
 =?utf-8?B?ZDJsQ1RSSTRQaXZORmtJSXBtKzBrc2lndWdXSU55dUw0VWJpMjQ5S3YwK0RH?=
 =?utf-8?B?OUU2bWt5UVNVZVNVTU1xZXg4c28zU25nTmlzZFAyNmZ1QStRTWEyZ05NNlBr?=
 =?utf-8?B?TFQ3UmdTTmNlbWdyOGNPdklMWitFNDNmbXYrNGdhR0RtSEJkMnJ4N0xjWG5o?=
 =?utf-8?B?eXhnbUNDdHliU0Z5Kzk3ZGlCbXpaaTY1ekpwTEJ2cVZnWFpzdS9nRlpyYnll?=
 =?utf-8?B?dUk3WDUycGdCRXAwV2hkSUcvKytSV2NOdURjQmh3ZmRCQ2VGWmVxM0k4RUlI?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00EB71C59F4CFB44AAE2C8695AA7E7B7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04275c67-469c-4c2a-e3ba-08dd3a3e09b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 17:07:08.0938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j42nxGIR7SrkwDZznUHE2j+R3jdXSz7BY9H99m7tBeUfQw4ntsqnazgNVIJwdHeqpSy/D37YAjU5NMwwQOJwRDGGxKWhH1N7uq6vYjG9FCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_090724_097128_FE2450B4 
X-CRM114-Status: GOOD (  26.76  )
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

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDA5OjM3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAvL3NuaXANCg0KPiBJIGRpZCBub3QgdGFsayBhYm91dCBkcml2ZXIuIEkgdGFsa2Vk
IGFib3V0IHRoaXMgcGF0Y2guIExvb2sgYXQgcGF0Y2gNCj4gdGl0bGUgLSBpdCBzdGFydHMgd2l0
aCBkdC1iaW5kaW5ncy4gSXMgaGVyZSBhbnl0aGluZyBhYm91dCBkcml2ZXI/DQo+IE5vLg0KPiBX
aHkgZG8gd2UgdGFsayBhYm91dCBkcml2ZXI/DQo+IA0KPiA+IGRpZmZlcmVudGx5IGZyb20gdHlw
aWNhbCBETUEgZHJpdmVycywgYW5kIHRoZXJlZm9yZSB3ZSBiZWxpZXZlIHRoYXQNCj4gPiB0aGUN
Cj4gPiBFWERNQSBkcml2ZXIgbWF5IG5vdCBiZSBzdWl0YWJsZSB0byBiZSBwbGFjZWQgdW5kZXIg
dGhlDQo+ID4gZHJpdmVyL21lZGlhdGVrL2RybSBkaXJlY3RvcnkuIFRoZSBtYWluIHJlYXNvbnMg
YXJlIGFzIGZvbGxvd3M6DQo+ID4gDQo+ID4gKDEpTm8gTWVtb3J5IEFsbG9jYXRpb24gd2l0aGlu
IEVYRE1BIEVuZ2luZToNCj4gPiBUaGUgRVhETUEgZW5naW5lIGRvZXMgbm90IHBlcmZvcm0gbWVt
b3J5IGFsbG9jYXRpb24gb3BlcmF0aW9ucw0KPiA+IGl0c2VsZi4NCj4gPiBJbnN0ZWFkLCBpdCBy
ZWxpZXMgb24gR0VNIChHcmFwaGljcyBFeGVjdXRpb24gTWFuYWdlcikgdG8gYWxsb2NhdGUNCj4g
PiBtZW1vcnkuVHJhZGl0aW9uYWwgRE1BIGRyaXZlcnMgb2Z0ZW4gaGFuZGxlIHRoZWlyIG93biBt
ZW1vcnkNCj4gPiBhbGxvY2F0aW9ucywgYnV0IGluIHRoZSBjYXNlIG9mIEVYRE1BLCBtZW1vcnkg
bWFuYWdlbWVudCBpcw0KPiA+IGRlbGVnYXRlZA0KPiA+IHRvIEdFTS4NCj4gPiANCj4gPiAoMilQ
cmltYXJ5IFRhc2sgb2YgRVhETUE6DQo+ID4gVGhlIG1haW4gZnVuY3Rpb24gb2YgRVhETUEgaXMg
dG8gdHJhbnNmZXIgYnVmZmVycyBhbGxvY2F0ZWQgYnkgR0VNDQo+ID4gdG8NCj4gPiB0aGUgc3Vi
c2VxdWVudCBkaXNwbGF5IHBpcGVsaW5lLg0KPiA+IEVYRE1BIHNlcnZlcyBhcyBhIGJyaWRnZSBi
ZXR3ZWVuIG1lbW9yeSBhbGxvY2F0ZWQgYnkgR0VNIGFuZCB0aGUNCj4gPiBkaXNwbGF5IGNvbXBv
bmVudHMsIHJhdGhlciB0aGFuIGFjdGluZyBhcyBhIGdlbmVyYWwtcHVycG9zZSBETUENCj4gPiBl
bmdpbmUuDQo+ID4gQmFzZWQgb24gdGhlIHBvaW50cyBhYm92ZSwgd2UgaGF2ZSBkZWNpZGVkIHRv
IHBsYWNlIHRoZSBFWERNQQ0KPiA+IGRyaXZlcg0KPiA+IHVuZGVyIHRoZSBEUk0gZGlzcGxheSBz
dWJzeXN0ZW0gcmF0aGVyIHRoYW4gdW5kZXIgdGhlIERNQQ0KPiA+IHN1YnN5c3RlbS4NCj4gDQo+
IA0KPiBJIGRvbid0IGNhcmUgaWYgaXQgdXNlcyBHRU0gb3Iga2VybmVsIGFsbG9jYXRvciBvciBl
dmVuIDNyZCBwYXJ0eQ0KPiBhbGxvY2F0b3IuIFRoZSBxdWVzdGlvbiBpczogd2hhdCBpcyB0aGlz
IGRldmljZT8gSWYgaXQgaXMgcGVyZm9ybWluZw0KPiBETUEsIHRoZW4gaXQgc2hvdWxkIGJlIHBs
YWNlZCBpbiAiZG1hIiBkaXJlY3RvcnkuIFRoZSByZG1hIHdhcyBwbGFjZWQNCj4gZGlmZmVyZW50
bHkgYnV0IGFzIHlvdSBjYW4gZWFzaWx5IGNoZWNrOiBpdCB3YXMgbmV2ZXIgYWNrZWQvcmV2aWV3
ZWQsDQo+IHNvDQo+IGRvbid0IHVzZSBpdCBhcyBhbiBleGFtcGxlLg0KPiANCj4gT2YgY291cnNl
IGlmIGl0IGRvZXMgbm90IHBlcmZvcm0gRE1BLCB0aGVuIGl0IHNob3VsZCBub3QgYmUgaW4gZG1h
LA0KPiBidXQNCj4gdGhlbiBJIGRvbid0IGFncmVlIG9uIHVzaW5nIGRtYS1jZWxscyBoZXJlIGFu
ZCBhbnl0aGluZyBsaWtlIHRoYXQgaW4NCj4gdGhlDQo+IGRyaXZlci4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQoNCkhpIEtyenlzenRvZiwNCg0KDQpUaGUgY3VycmVu
dCBwbGFjZW1lbnQgb2YgRVhETUEgdW5kZXIgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGluDQpNZWRp
YXRlaydzIGFyY2hpdGVjdHVyZSBpcyBwcmltYXJpbHkgZHVlIHRvIGl0cyBmdW5jdGlvbmFsIHJv
bGUgYXMgYQ0Kc3ViLWRldmljZSB3aXRoaW4gdGhlIGRpc3BsYXkgcGlwZWxpbmUuDQogDQpJbiBN
VDgxOTYgaGFyZHdhcmUgZGVzaWduLCB0aGUgc3ViLWRldmljZXMgaW4gZGlzcGxheSBwaXBlbGlu
ZSBmb2xsb3cgYQ0Kc2VxdWVuY2Ugb2Y6IEVYRE1BIC0+IEJMRU5ERVIgLT4gT1VUUFJPQyAtPiBQ
USAtPiBEVk8uDQogDQpJbiBNVDgxOTUgaGFyZHdhcmUgZGVzaWduLCB0aGUgc3ViLWRldmljZXMg
aW4gZGlzcGxheSBwaXBlbGluZSBmb2xsb3cgYQ0Kc2VxdWVuY2Ugb2Y6IE9WTCAtPiBQUSAtPkRT
SS4NCiANCkFzIHdlIHNlZSwgT1ZMIGhhcyBiZWVuIGRpdmlkZWQgaW50byB0aHJlZSBuZXcgaGFy
ZHdhcmUgSVBzIGluIE1UODE5Ni4NCk9WTCBhbmQgRVhETUEgYm90aCBoYXZlIHRoZSBhYmlsaXR5
IHRvIGZldGNoIGRhdGEgZGlyZWN0bHkgZnJvbSBEUkFNDQphbmQgY2FuIGJlIHJlZ2FyZGVkIGFz
IERNQSBjb250cm9sbGVyLg0KIA0KSSBhbHNvIGhhdmUgY29uZmlybWVkIHdpdGggdGhlIGhhcmR3
YXJlIGRlc2lnbmVyIHRoYXQgRVhETUEgaXMgYSBraW5kDQpvZiBETUEsIGJ1dCBpdCBpcyBzcGVj
aWFsbHkgZGVzaWduZWQgdG8gaGFuZGxlIHRoZSBncmFwaGljYWwgbGF5ZXIsIGFuZA0KaGFzIGJl
dHRlciBwZXJmb3JtYW5jZSB0aGFuIG9yZGluYXJ5IERNQS4NCiANClRoZXJlZm9yZSwgSSB0aGlu
ayB0aGF0IG1vdmluZyBFWERNQSBhbmQgT1ZMIGZyb20gdGhlIGRpc3BsYXkgZm9sZGVyIHRvDQp0
aGUgRE1BIGZvbGRlciwgb3Igb25seSBrZXBwaW5nIHRoZW0gaW4gdGhlIGRpc3BsYXkgZm9sZGVy
IGlzIGRlY2lkZWQNCmJ5IHRoZSB0d28gZGlmZmVyZW50IHZpZXdzIG9mIERNQSBhYmlsaXR5IG9y
IGRpc3BsYXkgc3ViLWRldmljZS4NCiANCldlIHdpbGwgZm9sbG93IHlvdXIgaW5zdHJ1Y3Rpb25z
IHRvIHB1dCBFWERNQSBvbiB0aGUgcGxhY2UgeW91IGRlY2lkZWQuDQoNCkJlc3QgcmVnYXJkcywN
ClBhdWwgQ2hlbg0K


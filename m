Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F07E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x+HBAbW+1H7Tfy8veIXdSJKtMiDJCuxfkhJNvcyovM=; b=i1Njo2qepbbQK3lYTsj1zmhdDG
	1zzObsvdQFlx6t2kCsQZ1Itsh3ZhRG96dvd3UWYQP2VJy396/0X7y9Gj5t4IqERxonJe1MMLd5D7Q
	xTRIdajurOVGPflpclOFDkMfx3fPTfm0XFlFGE/RpPEOJszpXziPKFFe3FJgYRXNn6M0DDQ59BkcH
	YSr9cL9OSrMn5G76it88e8RL1IKea+nwXH7i1eEbvrdS701lhiJ+Du2QmJMRmKfcAGZwS+SFZ0SG+
	kKnFjc1keu3+sq8ocJRmuEgHINF/JW/VLfFqyCsFlmmUc6ffkDfFsiTQaEsmkvzKuFAcEYykZRv9l
	I3V+Bwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSX9I-00000006lbV-0OlR;
	Tue, 31 Dec 2024 07:58:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSX87-00000006lSc-3Xl1;
	Tue, 31 Dec 2024 07:57:32 +0000
X-UUID: dfe49d34c74c11ef82ff63e91e7eb18c-20241231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4x+HBAbW+1H7Tfy8veIXdSJKtMiDJCuxfkhJNvcyovM=;
	b=ey2NKDDQRiTFvwhentWlellzSoJ5m19TeXbHPQgiL+iQ9YMEU9qOTl8+WKZnJBlMfI5qgsgrWJk4MfXPHouowVWxYXpIQ68+X7L2A0iHCG5b4KEvEOZy1M9Vn1vk3oyh+9W+G7uu+ec3JP/NjxO7diHZMvdH0ye9lW+x9mEzn9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bcbc7495-9dcf-4be5-b5e2-e043d8e003b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f1582019-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dfe49d34c74c11ef82ff63e91e7eb18c-20241231
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 568659431; Tue, 31 Dec 2024 00:57:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Dec 2024 15:57:23 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Dec 2024 15:57:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WixQg0IoHEiuYyLppqzc5cGkB4x9Tb8UAOts6Dbwvt+fdQUcJWvvk7myzO4IGOBPNYYK1MPQQlFnqGnGsqVrB7nCQnMsJb7qfmy0yrG7kwMWpgwj3cy+d1qUUs5qXgO09zlUy+Wnpmu7vHvEJDtBX/bvQ4QxtrQrKogYYLLqRrISRBghJJzMM/XaX/kPOX1gW3l1S/JFyMYmYnUS9xoDX2bXkeERj9eW70Rg7P0bZ8paP+JcIF6M8t62vzoW+UWEAfZIBWoZ8uO7sx9Jnt9iTv5jIIE4O4Jvl5VkEwl2Y7Xj7iY91wkKxwVxF1Q0iXfn7hfsFELEIbhEDsdG8wS1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x+HBAbW+1H7Tfy8veIXdSJKtMiDJCuxfkhJNvcyovM=;
 b=ubq9ymneZDNp8hZ4C1bxCRBP1ZewAHUDQFTmKdZlCRGXfb/LjkfETULwK2CQPhmDXfgeoC3m1B/vVoUB035pSOTYoIgpO/OWQ5SOuMtq8zp/ZOZXjIDbGJKQKVHEbuis12W/k5yRmvrmqtsOTr6kL3S6mRLv1elX4lMKPC3t98WS6SzYp18T/uHtVLs83ft7XvBF/R7pnHf7AtIVRnwgzpmDr/kzDiTaUi/faZKmuoO/3GAx30ZyNnizKsO46N3GroSWXPDbYzDsARe5Vn7gVgriZYEmjjf++ESWCzxR4UE2mKnHjip8JnBgtxugjfr7db0syluAPs5X08jBK5lZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x+HBAbW+1H7Tfy8veIXdSJKtMiDJCuxfkhJNvcyovM=;
 b=LXAnHiISaFGc8e02kWdUvGqfI3uSJoejLGVQNABNr9NumFHoGCGNfgWhD7beuak1XkptPdw5raoqWXXl7ewE0/x1Sl3LaL8xpYT68mwc5Uusm5JrQiB72C9MzJ76zNnYtR1wPX2NzA0Nw6K+RtNn9hPnYA34uHoYOsoklfXo7Z8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6701.apcprd03.prod.outlook.com (2603:1096:400:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 07:57:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 07:57:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, =?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?=
	<Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5nUmAgAZlb4CAAAMsAA==
Date: Tue, 31 Dec 2024 07:57:20 +0000
Message-ID: <b89b90b85e7c00889595bd8b8664d564ba8dc8ca.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
	 <351287f9e8a118babd225fb0e484976bef3db6c0.camel@mediatek.com>
	 <3c58790f-b1eb-4183-aafd-063dc5472b52@kernel.org>
In-Reply-To: <3c58790f-b1eb-4183-aafd-063dc5472b52@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6701:EE_
x-ms-office365-filtering-correlation-id: b112902c-c2ed-4dd5-849e-08dd2970c0ed
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WE5Pc0ZuMitEWTg1QWJLanZBM1Y3b1doWEh6ZWVYWHVCZngxSWVjQ0t0Q1dK?=
 =?utf-8?B?Q0sxTmZFWXk5THJ4VTlDcm1RTEpOT2FJQjBoU3RjcFZkVi9BWmtPdXpDU3A3?=
 =?utf-8?B?aHA3NHpKbHVMdTRJUFQ1dFRlWlZOaEVPckdDUUNzWXE4T3ZXMytvc2JzRDlK?=
 =?utf-8?B?ZE5JTGgyMXRYa1BIRHp0ZXdpSldKRWhYNXArcFNIK3dBK01EQWpuKzZXY1BP?=
 =?utf-8?B?anlnTzZTRjlmTVFBSlNtNmZrbE1CNk9FNkR4VU1MRm4yNXZURmhrVEZUenFU?=
 =?utf-8?B?cUFaY0pYWm1RQWc0YjVFY3MzNDRPQ3h0TTZjdWdJbU9iNkpKdU4zR2R5L0Fl?=
 =?utf-8?B?MkZScHJTUTBIZFBCcEhBWkU0ZTBzVHdqUXR0ZmNZZm4yMXU1VmhZVGRTMjVG?=
 =?utf-8?B?TmRadFIxdE85eHRaS0k2aDliWWk2ZXZqRTZpVHJVRWxFTDMvN1MvcGVWV0FD?=
 =?utf-8?B?b3ZYRU9MQkdLL1B5UzdOOHBKVnZ1RG5nU1VjMjI0bGpNVG03SXlKR3k2K21i?=
 =?utf-8?B?cWM4MGIyQTFnODhQVEhtajRiNVUxdENBYXcvT3o3Y05oZ3VBcnJDYTB2Tnoz?=
 =?utf-8?B?UnU2VjVhK0VjMEh6TXE4Rkp5YXdzZkZlU2Q4V2F4d2RNcjhVTGR5emI2N3pr?=
 =?utf-8?B?Q25sSy9uZjI3cmtjbTJ5em9WUzlWMjdMWWRmNy8yZlJLMVBOczRId0RyYWJ2?=
 =?utf-8?B?T0s1K1FiRzZKVC9uekVIWUN2c09pOG9wVlgrS0w3aC81d0NTWEc3NGpTYTlo?=
 =?utf-8?B?TUlQMkFldGx2U2kxZ2pBbkRkZ3pSNGpnZTBnSzhub0h3akMwQk83dlphRDNP?=
 =?utf-8?B?ZXM1SU9qdVplSktjWVFhcEllbWx2N3lpbEdqZVpnYnRyWkpNVXA5L1U3WkRD?=
 =?utf-8?B?NGpDUHpiTGxHU1pHZXkxSTlSWTF0R1ZZNGd2azA4cmFUd25rSW9HanEzZVpt?=
 =?utf-8?B?eWovWjh6ZUtDZ2pEOHBGRnUzRi9jeThOMFY2K1JyT2VOZ3RDTWVoTUdwU0Yz?=
 =?utf-8?B?blQyRWk3UHpXZGZyZnkxaHBaL1RCWnE5VXNXZ2ZVNW9OYXMzaC9VSzI2OWls?=
 =?utf-8?B?WExkbGs2VnZQTXpzbWxVOGJ2dGlyTWJaUmNNUWhlWmpBSEJnTlJ0QmVkRUdw?=
 =?utf-8?B?NEx0TmpobE8ycGIraG9YTUZIQ2pydGx2S3I0Z01Nc29Ub2g0N0doWXNPNGdK?=
 =?utf-8?B?SnUxbG9LTXRuby9ONkd3elpYMXZjNDYwYWg0WTdMRkRhQldWOXFQcG0zRno1?=
 =?utf-8?B?SjNlZU9VTk9LNGJ1K1lDaXoyc1g5VnlCWVl0MXAxS0pPWHhwTlI2Q3UyUEJW?=
 =?utf-8?B?QWs3K2gzaitmTHNGZWhXMm45SktqVGJLcHlHeGU3enpYNTFKaURaempDN1lw?=
 =?utf-8?B?T0Z4eElhK2dJUUh4Ky95R1ZyZFg1dkdJV29wK2prcnYyZ2VpcWlseVkwMlRZ?=
 =?utf-8?B?dE12VkVOK2FTMG82LzhuaXFUYVh0SmlqQW1HazFJNEMxMmEvaXpFck5XREQ4?=
 =?utf-8?B?VjFJV1JlaURmckZlQzNHNVFFMVhYUS9LektkR2lCZmFXSTRsdkI1dlZLNE1j?=
 =?utf-8?B?R1JuN1VSZnlieDA0VjNHUDhNOUNtMVA5OWtEUCtBYlM1K2JwL3JHQVNxOGta?=
 =?utf-8?B?QlljaEk5dXFPZlI5c3lhcDIvMnFORW1May9LN0xndC9UOTdrQzNHSUFjZ08y?=
 =?utf-8?B?L2hBUHBhU0cvT3l5QjJDT1NjMjVGTG52M1hFZ05icVFYTzJ5ZnVrSkRqUm4w?=
 =?utf-8?B?TFlsNU5SM0VRV2RNNU82Tjc3TTVHeUtCQ1BSZDgxY0FmRGhjK2lYYi8wME9l?=
 =?utf-8?B?NDh5blU5d3N1NUQvNEZLc1BpTnFyZ3BnUGpIUWtkK3hrK2hZZVFmWGJYTE16?=
 =?utf-8?B?ODZDNWptbUJINDU1RUtSaHhKYzBPdm02eUlrbStOc05MUnJPR2NCV3dET2Ir?=
 =?utf-8?Q?8wjd349GjmgdKYR1XaYOAXvj0H3x5cWO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2JCc3cyamFXTlB1NW5TRUw0enhVTkZQakIvUHBXM3hXZnVhWTIvVnhrbVlQ?=
 =?utf-8?B?eFVHTnFxcTRRcG5qMjkzWWJJVWNzVzhjMERWa3gxcDdSeGROdnlBdG9sVUY0?=
 =?utf-8?B?VzNDSG4xaS9KbHREWVdmb1FLa3NvZmxFVlN3ZHRWYmNvSTk3MnU4YjRoWFpI?=
 =?utf-8?B?UjlUbDdZS05Hem0xSzhXekp3Kzh1WTEwdW80c0crbnFyaWs4Q3dnY2ozaEJh?=
 =?utf-8?B?bFFDTEkxUFIrZ3NoZjMzSWdEWC9xeHJoOVVtelUxbTNZQWlkY0ZvYjMvWGx5?=
 =?utf-8?B?QmV0bDE1K2JzdXg2dzVFVnV2dnJEYThYS2I5REg4UHA0c0tQK1B1bEU0ZEN4?=
 =?utf-8?B?QXRJSk4vYkp6S2drZzYwZ0krQmJBTkZUT2h2ZEF2TFBzU25Dc3JDSHpGNlJR?=
 =?utf-8?B?Mlh0Y0p6dUdZcERaemZuZVNqeC9LdUdpdzdQcHpnbC94SGgvb1pHVEpwNEYz?=
 =?utf-8?B?U2ZKQ21GblJxTmpwMmVIVlRIeW9NRGwxVWJLK1EvUktDdHUzYTErWDIrUWxK?=
 =?utf-8?B?cyszenpwSzJFejVqRUx0S0RibXdSMENzMERoaU1HY2E1TS9uTTNRNXdHb3ZK?=
 =?utf-8?B?OURGQVdzSDlCd2VITVRxSVlRS1FvY2xLcUtNWGFrMVVqbThUYkpra3kvaU9K?=
 =?utf-8?B?bi9rU3NaUk80VDN2cVZ1ZVJOQ2VPMGc3QnhQZmhVQkQ3dk5tdlhhbVdOTWZj?=
 =?utf-8?B?cWEvb2FZZzBVOTQyTDdDM3dKL2FTYlZXS1dPUU12VUVnbGNVd0RqRVo2NjJq?=
 =?utf-8?B?bTU4T0Y3bkUzQjZKSys0ZHZUN084OW9EQ0JkMVNyVHBRYnFXNTBFcXVpckVX?=
 =?utf-8?B?MFZMaTNaVkd3aTdxYTFubG9IdzBCNE1VdjBTOE5RWFhUdjRMWmxNVGYzcnhM?=
 =?utf-8?B?L0JTc0ZOdzZya2NadmVUUlV5dmZiTDYwc2hTTUx1RzZ5SG9telB6UENVbkhC?=
 =?utf-8?B?NTk4ZmJsS3ZDWWVicXJyUFJyRC9qelRON1hTNVZQUUlva20rTjJ1ZkNLYnVF?=
 =?utf-8?B?OGdFOUFxQitCaHpJR010Tzk0M2hoZjN0ZXVXNGpobFRZY0xKcnRnQlNjV21Z?=
 =?utf-8?B?T0pqV1k5T2REalI5Z3IyaGFGbnZ6MjhqY0kxQUhlVjMyZm5Nek5ldVNJNXZr?=
 =?utf-8?B?bHdCaHo4MmtWWUhndlh2U3Q5QjRFS0RTdnVDY2RxSFNKUzNnejJqdVJQTVFU?=
 =?utf-8?B?ZlJIMDh3M3IwaURCWDIzVENYa0Q4MlRhSmQ2VmRRNjRHWVJ6U1NCNmtnUTEr?=
 =?utf-8?B?dUE1QUtCYXI5QnBBNmE2VlRJRjA1TER6emFWVFRINmc4SVliRVE2bmlGaEtY?=
 =?utf-8?B?T25QTW1GVm02VVBwNWFrRzRHcmRxZ3Q5cnZydVJXeFVia1BTQkZGN3krd0R2?=
 =?utf-8?B?OGxxSHMrYVJZWUZvVGltZ1cxWndBQkh2emN3RjFwNDlwTFZQZmV5QW1XUlQw?=
 =?utf-8?B?TTYxTHRFdmt0aWcxY3RRMTJYV09uN1dtUXM0MU5IbXVuY1phSzZiVk1qU3FV?=
 =?utf-8?B?bFlUOXhqNGx4MVdHZk1ML1RvQ0lDcUFDa3llVVJMMUc2WlpNUkp6VmhqSWRn?=
 =?utf-8?B?T0NWaENQQ2pYN2lEK05SWU1vVU1wdlpYR2NkOHNKRUJpMXluSXY0YXpTQ1FU?=
 =?utf-8?B?cnJCU1Q3VnI2RTROUjM4NkxlREtVMFdxQkViV2h0eDY3c2lXeEF2alhFSGpQ?=
 =?utf-8?B?d3ZrVGdPU05waExXc1VhSmZpSEM5dHl3VXZNK1RpeDM0clg0KzN6UUkwV1Zs?=
 =?utf-8?B?NzJNb0RqZVhVTndKTTBNczdOVGNZMzV1bnNleExQYUFXU2d4YndacGZCSmlv?=
 =?utf-8?B?RlVsV2ZkRmZYWWVJaGw4Y1NjTzdlMEFJc0lQTGZXeEhGai8rd3Fjb01QMjRP?=
 =?utf-8?B?T0psbThBeUszVlBBdm5yNGZLTi8wbER5MGR0OWpLRGh5RXpuQWxsZ043MWVT?=
 =?utf-8?B?UjZvQ3B1cEVJRnhvYU5YNHl6S2lMQmxzTFptZ1RFbjRJVEtqYmlSNTZCcGdI?=
 =?utf-8?B?RG9lNER5NXpSNG9SUGxCdkNNSU5lS3ZTQ0hFVlZENkdBUk1hTlhKa0VzWjhZ?=
 =?utf-8?B?bVI4citjNlNXUjNBUG13cTVXWXAvb3FVUGh2eEdnMjRLek4xZ3JnNVkyZlBr?=
 =?utf-8?Q?GkUHLWQHvSTqG7SKKjMEgQXYy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8596F3AD95928842A25788816354ED12@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b112902c-c2ed-4dd5-849e-08dd2970c0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 07:57:20.6090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXxBanaLTYislJs7t8YkZ52+z9mCMkP6aq73lIgksD2PwkQjqYeRO8sqYu6FAWMDbVbzo3Eo5cJjH4y+r1JoEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_235731_931901_97522516 
X-CRM114-Status: GOOD (  15.70  )
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

SGksIEtyenlzenRvZjoNCg0KT24gVHVlLCAyMDI0LTEyLTMxIGF0IDA4OjQ1ICswMTAwLCBLcnp5
c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDI3LzEyLzIwMjQgMDc6MDUs
IENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyNC0xMi0yNSBhdCAxNzow
MCArMDgwMCwgYm8ua29uZyB3cm90ZToNCj4gPiA+IEZyb206IEJvIEtvbmcgPEJvLktvbmdAbWVk
aWF0ZWsuY29tPg0KPiA+ID4gDQo+ID4gPiBBZGQgYSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZv
ciBNVDgxODggQUlFLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25nIDxCby5L
b25nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+IA0KPiA+IFtzbmlwXQ0KPiA+IA0KPiA+
ID4gK3N0YXRpYyB2b2lkIGFpZV9yZXNldF9vdXRwdXRfYnVmKHN0cnVjdCBtdGtfYWllX2RldiAq
ZmQsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYWllX2VucV9p
bmZvICphaWVfY2ZnKQ0KPiA+ID4gK3sNCj4gPiANCj4gPiBXaHkgY2xlYXIgb3V0cHV0IGJ1ZmZl
cj8NCj4gPiBDb3VsZCB5b3UgcG9pbnQgb3V0IHdoaWNoIHBsYWNlIGluIHRoZSBvdXRwdXQgYnVm
ZmVyIHRoYXQgaGFyZHdhcmUgZG9lcyBub3Qgd3JpdGUgZGF0YSBpbnRvIGJ1dCBzb2Z0d2FyZSB3
b3VsZCByZWFkIGl0Pw0KPiA+IA0KPiBQbGVhc2UgcmVzcG9uZCB3aXRoIG9uZSBlbWFpbCBkb2lu
ZyByZXZpZXcsIG5vdCAxMCBwZXIgZWFjaCBjb21tZW50Lg0KDQpTb3JyeSB0byBib3RoZXIgeW91
Lg0KSSB3b3VsZCB0cnkgdG8gcmVzcG9uZCBpbiBvbmUgZW1haWwuDQpFdmVuIHRob3VnaCBJIGhh
dmUgbmV3IGNvbW1lbnQgd2hlbiBzZWNvbmQgcmV2aWV3LCBJIHdvdWxkIG5vdCByZXNwb25kIHNv
IGZyZXF1ZW50bHkuDQoNCnJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KDQo=


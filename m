Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFB0EF48DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR+QrfFbz3r8wFZauerCPkU4Crfc2veiQ/iG3+6Ogcg=; b=dvFokZmjFPC6YTNuziaiZRFTtN
	a4N9Opf20FnRlxEH9uARAUkpqeBhEWhB4Vtayo9rWcZPuZMsuOs+2TCXpanvqKTIYJDBt14wPrFsF
	xOq+iw6MRNNgbvzLz7VvAnA0Kefm5WH6dPfvlvInZkYysSby9rmiBDydB8Pf/dZtJWfQ3yNvfiqzf
	9w1YVS24uVCKDVF8SgjxW29tHC4nTawg0YIDxu+9YnRwO6FmZ37cC56SH2ZWLughELwxIGJnLX5Oa
	mStqH8Czrn6eq9iCK02UweoATBHaiP5pPhnFlmbkSI7SPZjlD3+TMFX/XugCVqvamDvubnijqfiQN
	nHJYEDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkn-0000000375W-0oJC;
	Fri, 13 Feb 2026 07:38:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkj-0000000374z-3mlz;
	Fri, 13 Feb 2026 07:38:15 +0000
X-UUID: ef4fde8808ae11f1a16f0188aa809bee-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IR+QrfFbz3r8wFZauerCPkU4Crfc2veiQ/iG3+6Ogcg=;
	b=bk1FZtEccvjNy+X4p9U3+cbNCviXf1zHF9Abx3hIRq8ab9eImfxyWjvLnQyUrI4kiBVMByelBxIErH8fO0d/XpkAV0iXVzfgE4tv6bui+pwusqPedZ1gWiVdyN8KDDdqMrca3DTNUuAVoPPkCEv8M+91rCln43G+Jh6Pm6zaMC0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d67cee19-5187-401f-a6f0-0706b8c2418a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:05d3ea7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ef4fde8808ae11f1a16f0188aa809bee-20260213
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1799781035; Fri, 13 Feb 2026 00:38:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 15:38:03 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 15:38:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKRpdJH2rWi4V4l4ewUrL32FUVzmsne2yMeg7kiK0P2ZUFhieh9o1cY1kcoRnFm1Ccj1TMeK9EHD75YS3Ff8TZs6dEYGYrv7vA/tGVEx1geOkMyALmZEGlFwx4aCWl/n4Bj0KpUoJ36VJtNSo7bxR+n//jQyQFp6P8h8V4Vd6Ry+wJKu0HafYjQ7rh4R38k2GbtoCxH1NI914Z0UGx524ByCrH7wrXLiA+M6R+OTpXn6roJ1/o5tgxeOTDPY1oSrlNx/AprQ1sy480mHIZAaf7LLhP+b2Qfjp4hvXuP69oeaWaCLV11zlAiWYJbxiRXC8AkciPCGPmqKnvdDWuczGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR+QrfFbz3r8wFZauerCPkU4Crfc2veiQ/iG3+6Ogcg=;
 b=Cwlgi5cvoRKsMU9GU1BfANu2EkQKGAXKe1dzXZzFpyv+cAABetbKpsSp2kbNOgVq7BKPuG0+ChJjUBXZb92umyjQ/OlI9+Rd6dw/mk+UrC6b7/t7aOJj5+MHbCe79g7l6jOGMldwiRNgklG/VvuuIZrzJ1BNwfVww0YE8XXiGUGTrGNIRRCC6f7Lg5TC44mA8fQJ1eUr1wDkNCZx8L1PrIM4dl+HRDviRisoI7iXj8qG09TcJJ/mytzFG2svAjFWkSCfNee9nCWl+p4ktXAmmCUosOAVXohxjJXAF/RVMXzyUVHDHIjZBh60VMrRxQbNn87Ltyc5UJfGTMFctOdK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR+QrfFbz3r8wFZauerCPkU4Crfc2veiQ/iG3+6Ogcg=;
 b=a963mS/nHCrOEpYrTAW/d4+FF1zB9fB0U5ih+ESd0tGKhVsVJmQbXlxyXFnr95Qwy6HndNbgT4z9KXIW3crcmCsdFb/s6HAkXgJWah7u9uLGvPMNSmsYYZfIwsQmLTGh88ZK24Mu91MXc0/MDDYwzpFNWMd0jidjzFKmSrTh9Yc=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB6627.apcprd03.prod.outlook.com (2603:1096:101:82::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 13 Feb 2026 07:37:58 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310%5]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 07:37:58 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "krzk@kernel.org"
	<krzk@kernel.org>, =?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?=
	<Friday.Yang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v12 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
Thread-Topic: [PATCH v12 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
Thread-Index: AQHciTwN7pnPtZeGTkCx4qic151gKbWAZN+A
Date: Fri, 13 Feb 2026 07:37:57 +0000
Message-ID: <a22f53aa6f31ca840a59a125483cede48072c5c7.camel@mediatek.com>
References: <20260119120552.9325-1-friday.yang@mediatek.com>
	 <20260119120552.9325-3-friday.yang@mediatek.com>
In-Reply-To: <20260119120552.9325-3-friday.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB6627:EE_
x-ms-office365-filtering-correlation-id: c036edc2-6ac7-449a-0a3b-08de6ad2cef1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dXUvcVlHOGJkOHVlRXdaK1F6bEFyU2FBaDZKWDNrMllnc3BKN1NZRjhFU1JU?=
 =?utf-8?B?bFZ1WUs2TXFPZzM0NlZ0QTE4WFBZUXpkd3MxMlZHbFdpcEdKR0RhbTNJQnpI?=
 =?utf-8?B?aDNiUzBINFc5QWsrb0JwOXM5MmM5d1R4UGxZRkpVa2craFFpRTAxVEIwM2ti?=
 =?utf-8?B?YkQrU0htL3FIUC9Wak13eTRTSDRJRHN4QTFOQUExVWRBSXBXR1hTRzM2ZlpM?=
 =?utf-8?B?VmlNbnhYQmFMR1BYUTJTY0psc0pNVmNmc1A3c2V6OHU4VUhXcDQ2T0VSdnNn?=
 =?utf-8?B?WGNvdk8wQVlOT1ovNFgvcUFZQnRDWnErNDFmdmxMV25PNmc0SDAxelJvN0JS?=
 =?utf-8?B?WU9TOUR6UERDQjRhbnVFMjczYVZHS1Y5L3J3VWN0WWdYanM1eFRiQ1RzRjlB?=
 =?utf-8?B?NDlkcEYyRzh1SDYrZXpLb2s2dWtJQm1qTXlkanZmcWYyenNBTVJmdXlUSDBo?=
 =?utf-8?B?WUorc08zdkRqRmdoOE12d0Nma1JQZGVDU2RPYnN4QWdrNXViWVA0OUFFcWJn?=
 =?utf-8?B?dGVlaHpJcWdnV2NHRlBhVHRtUDYyaGN4WG5EOUdkTnN0M09GWjF5alFabElz?=
 =?utf-8?B?SjBzU3E4K25lT1Q0NnFMR1lQL2JwTVNBK3VlcFpwaWRxYjMxK2o1aG5HK0Jj?=
 =?utf-8?B?UVo3TkFEajhpOXdDZUlwb1V6OUVodDZOQ2x3L2hKb0pwNlNER3pKVkIvUDVa?=
 =?utf-8?B?TXdIdnZ1OWZ4bnppY1V5cURPSlZmdy9VTk91eFoySFRjSW05TnZ5OHdhbFND?=
 =?utf-8?B?Z25ob0NYS1krZDhVSTdWRTBQS3ZGOHNSTW9kRGhzOG1ZUG42ZFNzZklqOHhC?=
 =?utf-8?B?MGQyRWtHcjcyOEpvaHVwUHVvcEJMQTMrZmJqd3kwZUZIUG4zYTk1YVErZUt6?=
 =?utf-8?B?RWZwZCt4Y2VtZ0g5OXVKeEF0aEdkRVkxU2NGSzdnL3FBTjlraGh1RnNpamNu?=
 =?utf-8?B?WEJncm40OVM0eXc2QlI0alVCOS9vRFdBanIyY1I1VmNBT3FiT3U4Q3duU1lz?=
 =?utf-8?B?ZXYxUWlGWlZKdEZ0U3hMRUgwRGM5UXEwejYxRnhUMENQZ2pNZVJtYmFUOTVV?=
 =?utf-8?B?WlhyTlgvWjZrUjVUV0pCTHdqd2QyNjBSK25HVEdnRDcwSFVtMnh6L1ZEbGlF?=
 =?utf-8?B?MmhncW1PTUZuU3RseEpQVWFBWDZNcjhzdEVTaWZubkdwcGJpVm5nUnN6L3Bi?=
 =?utf-8?B?OS9ZYjBkNWthWncyek1GNy9xNmhxK09nWFNYYmFWS1pJUnRpMnBvVWtpR21S?=
 =?utf-8?B?cXN2MmJzQUw4WjAyQVA2d1FVMjMxZlRRLzFWOVpJSVllaEFXamZTbmk5WEh5?=
 =?utf-8?B?eVIvVmFKb1FlQ29GeFBoQ29TT3RKM2RDbHFId21lSVhMUDRKbU50emxOdUFM?=
 =?utf-8?B?YnlhUU1xcUprNkhTVlljVGk3c3VFaEhxYktRemU1YmhCbzlwYmJZS1ArU2NL?=
 =?utf-8?B?aXlzNFJWaTlUeFAxWm1LcWdXbzh0bFMrb0lnbFdiSUMzM2hZSDdlYmpkTW9T?=
 =?utf-8?B?K0J5TzVUdStPL1hJd0RlVGFFM0NCZm1nc2wxVURyWnI5cTVCM0x4cTdZQmVG?=
 =?utf-8?B?YVIwMmRyRkNXbUxwaFhTZjg2QjBDZWloMGQvQjQ3QVk2dzlYNDlkUXM3aldT?=
 =?utf-8?B?M1JQcE1SZ0t4NUZHMXQvb2ROanViTysyK0thUnRybHhaRzhpeit1R3lZSVEz?=
 =?utf-8?B?NnM1RFEwa0VQVmRTcGFuL0h2aFM4d0x0MzhkWVlzaS93VzJnVXB0OFh1T3pK?=
 =?utf-8?B?c2tyRERmSUt3WVZPZUF3T1dPQVlkTDRzSkxxSExJODRRcXYrT2x6b3Rua0wz?=
 =?utf-8?B?NWx6MnJxbE56STVEYVlDTUNUeFFkRVhleEROQlNueWozbkpXc1NhKysyQzE2?=
 =?utf-8?B?ZndWZTdkbTkzNGttSU5WUVRTVnhleTVjMndaTWp6aU4ydCs5bDRaK05McUtE?=
 =?utf-8?B?dCt4YVZIbkNCbGxjY1cyOFpKK2o5MUlIU2xKWC9hZG5UL21aU3YvRkhpaTFq?=
 =?utf-8?B?dlJ0WStOdDdZeHVlRDVrY1pGdkozdklobWpXeHZDc1ByMXZTN2VRR3ltdm9I?=
 =?utf-8?B?ejhsZVRuRWpMb3NrbXp4aWNwYzJJcXk4Uk5COE1iRk1Ea3hsOWgwN2lKYlNq?=
 =?utf-8?B?Nzk2NW1PMmlhYmlIUTdRNHhScTZ1UUp6MXJaQmV6S21WZ3c5RG9TMzVTMjl4?=
 =?utf-8?Q?HJEXqCgaRNj9O8lO40vN0R0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djJSNTRQakxjdFVDUEpPT1UxM09IL1lVKzVMd2k2YUlHV29NNVArWHV6czhp?=
 =?utf-8?B?bHpHRk95bTlnYlExUE1kUnF6aWpRNy9CMlQxaVJRbE1qSExqeXZTZDh0emlK?=
 =?utf-8?B?OEFURVRkR3l0T0piL0R1dG8vR2F1T01MenJHdDZGM2h0ZVd2eTZaQ3g1anpu?=
 =?utf-8?B?VmFjeTI3bzM3UDJkaGR6V3owaERtcFFHRmhPY2lJb2NtU0hKM1cwRUhuclY3?=
 =?utf-8?B?Wk1FRW56ZlM0YjlBczJoaDdVZ2dlT29JM0tYTjJIUFkzKzFYVUx5UHRMQ2lj?=
 =?utf-8?B?eEFGSVl6N3pBeFU4WkNodlB4RUhvNnRXUEMwakV0RGRCc0NDZ2tmRmlZVzRI?=
 =?utf-8?B?SkoyRDc4SU5kTFd0RllmSnJBUW9tT0R5RWdNZzhJYThvdUxHTU5CVEZsalN5?=
 =?utf-8?B?OEZleStPRE93YWJZRDVzVVY2c0VDWEdJay9kQWVzZkhBbFJBZmNYdllYY0pY?=
 =?utf-8?B?TU1wYU1wZi9NMmJlY2N5ZHlTdThlVldEelZJMzBPaUZpK0theWNKcUdpM1JI?=
 =?utf-8?B?S2lGbE5LdzIrOEVxK3ZaRjUzWnppZmI3OVF5ZDF0eFJtcUVLWHlSVDNKOHVB?=
 =?utf-8?B?Q3BVOXpJekJRbkJQMmZEZFhISGhlYnVXaUhUVXk1Z2E3ci9tcUFaVEFTeTRV?=
 =?utf-8?B?UHRKTTBDSjRyVEo2MnZVT2R3cHphRmliL2NjU0tBQmRnUmtFOHF6bnpSZ3Zw?=
 =?utf-8?B?MzZqU25JUTJFMHUrc0ZmMmFzcjVpaVhueURSZ3RGNzlXc2NZUzdlM1BYbCtn?=
 =?utf-8?B?RVVXNzdwYUI4ZUNMOVluZ1E0S05yV1FDZzRJTXRVN01IMHpRT2o2LzJpSU9Z?=
 =?utf-8?B?dGJNMjRQMWgzUTYycVkreEpJUlkxbnErV05GdXRsdUl5RUpka1p1d2lmV21E?=
 =?utf-8?B?c1J0UDdHNG56QVFzbnljSjVmSis4UktQaDVsS2VZekxNQWVaSXIyYk9yL0RZ?=
 =?utf-8?B?R0lBeDhxZDdoY2ZOVHdlWi9zTTVHTStsNVVvMHhVQXVlWjF2WmNGVWNURWtl?=
 =?utf-8?B?djhYNFhieGxyRFdkdG9OUi8rWnd5T3NBbzUrSWV0Zm05c3dOS2oxZVUveDhC?=
 =?utf-8?B?bm1aK09YN0pJL3drLzFQbUJXdnMyMTZET0Z5d0pXa3U4aEhRc0l3RDJORnlK?=
 =?utf-8?B?aVNONit3clB6anVDaFZaM2djNy9PcnUzalpsam84VFJGSWNUdFYvU2NCdXF3?=
 =?utf-8?B?QVB6bGhRMko4b0cwa3IzeTQ1Um1mQlY4T1FqNitMaUlUa2I5WkVITW1VTHR2?=
 =?utf-8?B?dmRzMzcwR0VRN3M5Z3RkZWJzWlB0MXE1UDVweUszbDRoZ0tiM2MxOHBPTHow?=
 =?utf-8?B?MHgwdlpJaXgvZ1FWQVd6YUdZdksya3ZaN1FEMHgxVDdtWWRtM1IwQnFYT1dO?=
 =?utf-8?B?QUJqY2ZvbjVpSVVMbm1tdGdlU3BIMVAraFMvNyt5T25veFdlNU5JWkxyS2J3?=
 =?utf-8?B?SGZBcFBVdUpwT3VCLzYvL2ZIZWRYTWFKMFBOZ05OVENZZG9aYytXNWZjY2Fi?=
 =?utf-8?B?Nys1YjljSVJxc2x2Y2p6bVVKT29TZUhzcVpzdGE1aVNCeHpFa0x6bll2Z2Ru?=
 =?utf-8?B?TERCaVBWb1B4eUZScUxMd28zS0NpQ2J3Vis1alNUVitPR3JhR3c2WXpmZlZ3?=
 =?utf-8?B?dG8vMjNlS0I5bTlVK2FxL0dPU3hVTDA4TTZqTGd3ZUpNUklDU1J0V0UycjhQ?=
 =?utf-8?B?QnREcmpxYVJyR3VDeDFDcm1DQklyWVJsODFQZ3VJUldETG5NZDRxV3ZJTnBh?=
 =?utf-8?B?T25IMlpSVzJmUGFkMXBTWDRCbEJUcGRkWDM5ajF4clNrRThpUkMvNE9OWWxj?=
 =?utf-8?B?MTd0NTlYQ1hmTWlxaDVYSnZrSlQ5VGxWcGhuM2pGQTRkckdOZFRSdlhrRnpR?=
 =?utf-8?B?b0lzMnZWVmFLNzd3My9FNHl4Uk03WHN0TlgvNVljbTB0QXMxb1JoOWtCcGZ2?=
 =?utf-8?B?ZU9sYnBucVNaYkV2MWtueDAyL3dKTGhSQ0liWmx0S0FoWmZ2QUdSc2pyMzZj?=
 =?utf-8?B?NWFVVnF4MDdaaVVUcndCdmNlSy91NXdoR1NlbVpScmd6anNBUEhxWUw0Z1ZR?=
 =?utf-8?B?U3Y1eFo0OG1HZndSU1ZVeGlXRnVzVUpWZmZuVUZtL0hyY1V5eWtxS2REbW0z?=
 =?utf-8?B?UWtWaVhNVzlSQStyQm1FMzNYcnZyUjVzL2ZYYkVNc2cvN09tTThneGlUckNs?=
 =?utf-8?B?SitkVWVzLzN4dG5UTkN1eXFJVk0vSnZpcnU5dWJRYUVNQ2FsTGo1QTQ4V1ZM?=
 =?utf-8?B?Tkh0MmYzaU1lRXpKTE9jT0tyVERSaGllT0hLM0FsdDJOM1JOTnNBN01vaVRO?=
 =?utf-8?B?R2tLUlljelltc2RYT3o4eUhwNHN2bk8zd3JDQWhXRk5nUkt3a1JzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A52E957A30F24297BD7DFD9F25184E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c036edc2-6ac7-449a-0a3b-08de6ad2cef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 07:37:57.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TfOisSdH3s0C1La3DmkfAdfNdyWEkejffj5iM5oYPVoWoK9aSMtYYfrSsUaijpN7p22YS3PFofePPvHG4bkEJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6627
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_233813_961864_8D2D645F 
X-CRM114-Status: GOOD (  17.38  )
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

T24gTW9uLCAyMDI2LTAxLTE5IGF0IDIwOjA1ICswODAwLCBGcmlkYXkgWWFuZyB3cm90ZToNCj4g
VG8gcHJldmVudCBoYW5kbGluZyBnbGl0Y2ggc2lnbmFscyBkdXJpbmcgTVRDTU9TIG9uL29mZiB0
cmFuc2l0aW9ucywNCj4gU01JIHJlcXVpcmVzIGNsYW1wIGFuZCByZXNldCBvcGVyYXRpb25zLiBQ
YXJzZSB0aGUgcmVzZXQgc2V0dGluZ3MgZm9yDQo+IFNNSSBMQVJCcyBhbmQgdGhlIGNsYW1wIHNl
dHRpbmdzIGZvciB0aGUgU01JIFN1Yi1Db21tb24uIFJlZ2lzdGVyDQo+IGdlbnBkIGNhbGxiYWNr
IGZvciB0aGUgU01JIExBUkJzIGxvY2F0ZWQgaW4gaW1hZ2UsIGNhbWVyYSBhbmQgSVBFDQo+IHN1
YnN5c3RlbXMsIGFuZCBhcHBseSByZXNldCBhbmQgY2xhbXAgb3BlcmF0aW9ucyB3aXRoaW4gdGhl
IGNhbGxiYWNrLg0KPiBUaGUgJ210a19zbWlfZGV2aWNlX2xpbmtfY29tbW9uJyBhbHJlYWR5IHBh
cnNlcyB0aGUgJ21lZGlhdGVrLHNtaScNCj4gcHJvcGVydHkuIEEgc2ltaWxhciBzdGVwIGlzIHJl
cXVpcmVkIHRvIG9idGFpbiB0aGUgU01JIENvbW1vbiByZWdtYXANCj4gZnJvbSB0aGUgJ21lZGlh
dGVrLHNtaScgcHJvcGVydHkgZm9yIHRoZSBjbGFtcCBmdW5jdGlvbi4gVG8NCj4gY2VudHJhbGl6
ZQ0KPiB0aGlzIHByb2Nlc3MgYW5kIGF2b2lkIHJlZHVuZGFudCBwYXJzaW5nLCB3ZSBhY2hpZXZl
IGl0IHRvZ2V0aGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJpZGF5IFlhbmcgPGZyaWRheS55
YW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lbW9yeS9tdGstc21pLmMgfCAx
NzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAtLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KW3NuaXBdDQoN
Cj4gIAlzbWlfY29tX2RldiA9ICZzbWlfY29tX3BkZXYtPmRldjsNCj4gQEAgLTYxMSwxMyArNjg4
LDM2IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9kZXZpY2VfbGlua19jb21tb24oc3RydWN0DQo+IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICoqY29tX2RlDQo+ICAJCQkgICAgICAgRExfRkxBR19Q
TV9SVU5USU1FIHwgRExfRkxBR19TVEFURUxFU1MpOw0KPiAgCWlmICghbGluaykgew0KPiAgCQlk
ZXZfZXJyKGRldiwgIlVuYWJsZSB0byBsaW5rIHNtaS1jb21tb24gZGV2XG4iKTsNCj4gLQkJcHV0
X2RldmljZSgmc21pX2NvbV9wZGV2LT5kZXYpOw0KPiAtCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwkJ
cmV0ID0gLUVOT0RFVjsNCj4gKwkJZ290byBlcnJfcHV0X2RldmljZTsNCj4gIAl9DQo+IA0KPiAg
CSpjb21fZGV2ID0gc21pX2NvbV9kZXY7DQo+IA0KPiArCWlmIChyZXF1aXJlX2NsYW1wKSB7DQo+
ICsJCWxhcmIgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwkJbGFyYl9nZW4gPSBsYXJiLT5s
YXJiX2dlbjsNCj4gKwkJbGFyYmlkID0gbGFyYi0+bGFyYmlkOw0KPiArCQlsYXJiLT5zbWlfY29t
bV9pbl9wb3J0X2lkID0gbGFyYl9nZW4tDQo+ID5jbGFtcF9wb3J0W2xhcmJpZF07DQo+ICsJCWxh
cmItPnNtaV9jb21tX3N5c2NvbiA9DQo+IHN5c2Nvbl9ub2RlX3RvX3JlZ21hcChzbWlfY29tX25v
ZGUpOw0KPiArCQlpZiAoSVNfRVJSKGxhcmItPnNtaV9jb21tX3N5c2NvbikpIHsNCj4gKwkJCWRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBzbWkgc3lzY29uIGZvciBsYXJiDQo+ICVkXG4iLCBs
YXJiaWQpOw0KPiArCQkJcmV0ID0gUFRSX0VSUihsYXJiLT5zbWlfY29tbV9zeXNjb24pOw0KPiAr
CQkJbGFyYi0+c21pX2NvbW1fc3lzY29uID0gTlVMTDsNCj4gKwkJCWdvdG8gZXJyX3JlbW92ZV9s
aW5rOw0KPiArCQl9DQo+ICsJfQ0KDQpzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuDQoNCkl0IGxv
b2tzIHN0cmFuZ2UgdG8gcHV0IHRoaXMgcGFydCBpbiB0aGlzIGRldmljZV9saW5rIGZ1bmN0aW9u
LiBJZiB3ZQ0Kd2FudCB0byBhdm9pZCByZS1wYXJzZSB0aGUgIm1lZGlhdGVrLHNtaSIgcGhhbmRs
ZSwgc2F2ZSB0aGUNCiJzbWlfY29tX25vZGUiIHRvIGEgdmFyaWFibGUsIHRoZW4gbW92ZSB0aGlz
IHBhcnQgaW50byB0aGUgYmVsb3cNCm10a19zbWlfbGFyYl9wYXJzZV9yZXNldC4NCg0KVGhhbmtz
Lg0K


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F6CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 03:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNuT4XaQZqN3TW/n7m1sr0Med1MMgJwPdqt1HJNp7fI=; b=qbgIjNnSunHKmkoOgn2y47mvnu
	scRwiOAMmY3mR4tqj0agiwF+pFC8Ajij6uDa1PPXrTra19WPpYulYBEXNHJfeS8MqU3itZydAvdeF
	XbfpZ4UQd1OAtPe5bp9xyflJKnGKNRtnToxSYfBvy2jy3JXPlu2jfzN/giLUPLnW4OqZGh2AQS330
	Y/0oLATujBZP9zII1VBBRO/B6erR6O0JRR0WYY4KUH0fgsLJkWRd1nJ/YLQMyAGIE0wTn05YbNhDa
	35F6hRrBegGQbUswKuEtwfdGwVe+u7ULj5NQ69uQ6aPZ1aN485Pah/RTMHnFoN2LGZtm3wjdWOGkg
	YZkYI9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHbr-00000007kek-1TAL;
	Fri, 21 Nov 2025 03:14:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHbo-00000007ke4-3VY7;
	Fri, 21 Nov 2025 03:14:53 +0000
X-UUID: 3b68e2a6c68811f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iNuT4XaQZqN3TW/n7m1sr0Med1MMgJwPdqt1HJNp7fI=;
	b=QGzk1nYF3AAkjvhdAP14ouD9u9EgBj7PQCq5SUFNX1bYD777teBtoqi6y9OUa22cp9w98mriDGrFoxqgAcndQRqgLBUZEaPQ2+OSXm2dg2JXxxdcq2RbzvjkGaRquVdkMehSDWCIwXGIywoUrSNZ+rGReuzWz7f475/WWtKwUCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e3f42ac0-e0ce-4fab-9b0e-d2017ae435ae,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f23be382-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b68e2a6c68811f0a52f393f94899d25-20251120
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2099447955; Thu, 20 Nov 2025 20:14:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 21 Nov 2025 11:14:43 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 21 Nov 2025 11:14:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS0j+j7bKzNtpqaVDbfNDdU20IsdKMTEYcDQcGnaLdNKlx2NJCvtBAWueeh9+L8dW/tmqZgh9fb1ypaO7L8CTKoNf38Bi9DRJWqkBBkQVNuoxVNWQe4rjgkp2LSArJR75d1Oyc71EriMxPr+FwKlDbUytoLlcEpqr8U+JCVXdCE+JO9nHtTwzCsfsASISecNPIV8jMur/3gUu++NWNNcHQRL/5fT/c+qODCnbFgDCcVeOM+CPfH89uRBLFI7vGliCDQw9Pve8qJ5D5FRRFSqg2HWhnponE/RelmlT1Z2pKd2ACgzbLaghIrUio3TCdtRZ2gCy+iKusy+OF/UnY7VDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNuT4XaQZqN3TW/n7m1sr0Med1MMgJwPdqt1HJNp7fI=;
 b=A5krKPBcUYE56Flq3rBwROSYeoXo3sYk91khiRNoPkmscpEo3hVZEauU79Vo+zEXkqq4RwDPdXKcZ3XLiIBmexEMdeaNEWPEHoFDH+akR4SD7xDWS6WUYzqvgRV9mVmm3nR0DfJcF3zGxL3HEt8Mbevz/xDalhyLw4L5/dhwsXQDmbZoxuFuSChJx0thivjh8KKpqt0sKwB0MMKt9mGjty5w2lK2xcqhFla8H5U+b9ElpMwMCFe/oU0StizGvEnVGzdRWUSoxJ+7ynOWoGTEReDRGeVQUNich9sirQU4E/9NCRHIReG+kr6uX4EqFvnvlb4FpJtqO/7SYfHvBlZ2kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNuT4XaQZqN3TW/n7m1sr0Med1MMgJwPdqt1HJNp7fI=;
 b=Q1GJ8LgpVGKP4kva+xrk9lsE2fN6D7cmFkK5Ift8bd7Bomyn0Bg50h5fI/ktfbZWz3juE7G4CPVoCZPQaj8mil/A8W61DysG/GUzJU2SYqgLp+gwoMw8va20jXxIU7YiPib4IftpPusl0HI2jyfn42ZrnH1AX1/4/8GfSXCQw7Y=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by TYSPR03MB8564.apcprd03.prod.outlook.com (2603:1096:405:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 03:14:41 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%2]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:14:40 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, =?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?=
	<Jh.Hsu@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] rtc: mt6397: Fix formatting of platform driver
 structure
Thread-Topic: [PATCH v2 3/5] rtc: mt6397: Fix formatting of platform driver
 structure
Thread-Index: AQHcWhffROg/3JwNV0+/06XbrQHFirT7kc8AgADj8oA=
Date: Fri, 21 Nov 2025 03:14:40 +0000
Message-ID: <e9d017e7acd19d301ec9cb1058181f3d772f7035.camel@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
	 <20251120121805.6775-4-ot_shunxi.zhang@mediatek.com>
	 <ca1bc81b-f4cf-4f3f-acf2-daa646762842@kernel.org>
In-Reply-To: <ca1bc81b-f4cf-4f3f-acf2-daa646762842@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|TYSPR03MB8564:EE_
x-ms-office365-filtering-correlation-id: 2f2f0ff3-efc3-45c2-3058-08de28ac1c5f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?TlJwaG1sWTJPNnJ6eGtmOHpzYUhkKzduWmVoMVJzSTNVYTBIZy9kaUk4RlFs?=
 =?utf-8?B?WFBsWEp0QUw5QUxqcGNhZ1Z3dnJrdk1td1UxY1htQ3huWXJYdFlCMFZxNy9Y?=
 =?utf-8?B?S2VpSDJvZGdPcnkvSUlISWhteWlvZTJRSjZoQ2Rkd0E1MEEwbGZRTXZTYVd3?=
 =?utf-8?B?VmZLZFN1b0UvWmN4aU1UbFErTHVGdGVDQXdSSFREMWFSY0FuN1FBbGFoMk9U?=
 =?utf-8?B?ZlhnbHJBekVMcDFxdC8wTXcxanppTXZzZnBrTm1SZG5oalBURmZDekpJZm9Y?=
 =?utf-8?B?UC9QWXU1M2xWbVgzYkh0ZVhCdSs4c2hwNkRudWx3YmJ6UmlqY1dXYU54Tyt1?=
 =?utf-8?B?WXdCWThLUGhCZWprSlYxaWM2RTNHTDZuRkFIdTFxWjQycWtSbzN3YS9jSHRq?=
 =?utf-8?B?WlErU1g1djJzOWxwbXpOR3EwWmFrM0NpWk5GTStaRnFkTVJxakxNV1hoMGpS?=
 =?utf-8?B?RC93NlNKMHRGS1ZqNUJwMXNxeVkyNTgxTVBtTHJqeXMzM2Jwc3NXb0hycnh1?=
 =?utf-8?B?c3BPY00vZ0dKWkw1QVB6OG9QTXkzVTNGUWlSbFFYNlhVVWJxWnB2cW96d01K?=
 =?utf-8?B?M20rVmIvQWJLOURsZjJRNkpjZFlIVXVkSXhNNjExa2J3cU8xQ1BuZDg0TjhU?=
 =?utf-8?B?SU5DRFZlZGxTZTY5UlNBVnUxVHJMRkJxUVNRYVRzVk5rY25Qd3dDTGJyZjk3?=
 =?utf-8?B?MnRhb0E4Sy9YWjhPTk56NGRnUUNxUzl4akNocE9PMHBLUnZtNTNFRTFBYktl?=
 =?utf-8?B?aGU1VTlDc09COHdnK3BJRDlWMEExK1hpby93aEg5VlMyb1k1ck5SSzJpanRX?=
 =?utf-8?B?YXc3U2laWkx1WVc4L1pJYmk4ZW9LaHhNTEZlZXZpUy9XVmFOa01VM1l4eUY0?=
 =?utf-8?B?Zk1HZURHY3JrVDRUMFBMaldvaUZ4QmtBRVlUNzFPRFB5OUhiOTRhcXZjM2s1?=
 =?utf-8?B?S3JWUHRIeFNGS2UyUmFrYUpSZWI0SEVxaXRtbHpHQUpyK0JiNDJZcU5DaEJN?=
 =?utf-8?B?ekZiSkVZUHdIdWRFVHhraFhDM2FVeE05VEoyQ21EdWxMaEJRQnVFNENlWVdC?=
 =?utf-8?B?SnQydjliVStEZVY5aytjYjE1TWVLSDRERTZwcEZiNXdxM0x1WE0wY00vV2dz?=
 =?utf-8?B?clJKVFRDOVZLOVhmR1QwVjcwOExKTHdTbTYySk50ZXpLZGlmQXRNODF2WUpr?=
 =?utf-8?B?OXh2SXNqQ1UxWGJqTEtHWk9WMkxqRG9acGZyTjRrMUVQYXArUXZMY2pOdkV3?=
 =?utf-8?B?L1FNL0R3dUYzVjM5ZGR4WFR1RDRNWFlaZWI2NmFGcUpYQ1RkblczbDkvRW5C?=
 =?utf-8?B?SFo2dGRBQVlNV1AydUgvZnZ4Q0NBSkV1cEw0VnJRV2FrU1JlaXU2b05GRDJ1?=
 =?utf-8?B?N3NGUHY5MW1TV1J2YzBGOHVFdWpsUFdXM0puKzdOSFNZc3VPejdMamZCOFov?=
 =?utf-8?B?c3B3QVVDVkZCYXhpM0I1dmhpYjhpOXJGaWkzaUFWRHN2K3Zkb2lMTkk5bXZ6?=
 =?utf-8?B?WUNtZHVTVVNlbHJwdWVBOG94MkgvYnkxR0N1NlNkQVk0aUZQTWR6b3ZQK0lJ?=
 =?utf-8?B?azJQd1oyWWpYTWd3aFRTSkxSeVhjRWdzcWozSWp2UlRUOFJzK0k0b3c2OVA5?=
 =?utf-8?B?V2piUDgzTzAzT0IwajNoUlA0MDkrOTBqSkJ5NGttRHZweUJaQnZrbG9MKzRl?=
 =?utf-8?B?TUZNajFjRXI5TUUxUmR4VW5DRU1vOCttQ2wxQVRhOEpzVnVXUm04K1VSQzVB?=
 =?utf-8?B?L1dnRG1USEFQYXlJQzNOcEE4dUJwcUt5SWJ3VDZpbHhSdGVMcmdQcE03cWdX?=
 =?utf-8?B?b0JieUdCaEJSWXFoY3EyMkpjTmlrQTBkMEZCUzE2d0txZnhKVXhPd0hMbzF6?=
 =?utf-8?B?R1dEdFBaUmJiVnBuTE9kdUcvRGo3UXVpenpUbDNrMHJ5WGhScmQvZVV3c0VV?=
 =?utf-8?B?LzJJYk5KK1FmQS9nSzQzSWJ4NGxIckFRS2t3WUpsY0x5UUViYzJtSE5tWHls?=
 =?utf-8?B?Z1lnTEQ2d2p5OEFpMDgwWGdXOWhWMnJLRWpZUHpTeU1rZWVVOTZ6SnhWcXZH?=
 =?utf-8?Q?CpfCAE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlQ5d1plZFF5SVpwc1JqYXhBRWtINzJnc3ArQ1pDZ0FyUDJ4YVhnVURDQTVS?=
 =?utf-8?B?elpGbWtrYnlhQnE1dDhNMkg1eUZ3UTR4OFB6VWFiQ0txS01YZXVTWEVVTFBz?=
 =?utf-8?B?bWFSUldocWFsS05kYkY4RlNyZ3ZFaVdUWjVsS1dqdUljTG5WQlBiWktBS01S?=
 =?utf-8?B?MU1PZWVna0NHMFdudndNWlB0Q2Vra0k4K0QyYU8yVHBwMEl6MnFGelFJcFRs?=
 =?utf-8?B?K2VNc0p6ZUJta1gyaG1yZFg1elNONDFmWWhMNFNyUVBLSzB4ZVE3VVZib0Iv?=
 =?utf-8?B?ZHY3aVEybit1RFptaVk2MjJ0VjROMmFKUTVFbFZxbTlPeHJ1cCt6ZTdOSmVk?=
 =?utf-8?B?TVZ5b1h4WVBsWndOT3g5bGs4L3JRcFNkclRQVnhrUlovMDQ2RFFmYzkvVFBj?=
 =?utf-8?B?ODBBTmlLalJvRnB0bTM4NWE3clkvQjFFVzZXeVF5WG96RGsrZUNIRGptOVBS?=
 =?utf-8?B?ZDZpZ29MTXJIZEE2MXB6MmhGNnNBcnY0NmhRd0dxVk54d2pkdlN2TVV4b21U?=
 =?utf-8?B?VGFEU2Vtc01SVzBPQk5vYXprNlU0bEczNXcrc2JIR2h5UCtkS29QcGpkYlk2?=
 =?utf-8?B?MXlkRFlja1pudjhtNlNueWlIbnJTbTFvQ2pNeVRaQzVNNjBDL0p6K2JNYzQz?=
 =?utf-8?B?YWxLdW1vME5kdnNiU3o0OW1PdmxkQVlWTmc3OEp2Wk5UOVBkZHZ2RFFLdS9r?=
 =?utf-8?B?VkRDVkc1eXRWUktlcUR3Y3UvZGhoSjExUVZUU05OQytZOFpsVStQM25oc0tt?=
 =?utf-8?B?eFNrQy9CSDNrUDVkUmFEalFYQWc0UEZZUjZwa29hUzF2ZHh6R1B5aVkwY3BL?=
 =?utf-8?B?WXR0NVE3bWViM0o5b2ZmL1RhRWZjUVROaFdmZG1PcC8xdW1pTWZzdFg5bEdz?=
 =?utf-8?B?R3ZmRHFmOGJ6WWMyNTMwSkRCbE1nYmtQSUpKRDlzMVN3Rm1YWnA2Z1hFOXNs?=
 =?utf-8?B?dWZIVVVYa0dIQi9WSWZldkY3cTRZS1BTQ1ZnZFgwSi84S1BqSVF6NWp3dmRO?=
 =?utf-8?B?Tm5kTloyYVdSNWpyTUw1NVRGSkI3OEdRQzUvcjIyajhJa2M5bk9yTXpNaUJG?=
 =?utf-8?B?T2FIajJIR2hMWHJmclFVR1h2dW1mM2EwSERoSmVTcWUwalRMdWVYd1Naa005?=
 =?utf-8?B?Z2JvZkF6LytWTEdnd0dEeWRpSytJSGo3bEJmcDY2M1REREk2bXRiNDc1Z3Bj?=
 =?utf-8?B?aFZTa0RVbllERVN6b2NXT1VaZkFOT2s5UUlNNFRmZlhkRVBBZnlDZFZhRjE3?=
 =?utf-8?B?VW0zNEM3VE1vYkNIK1UyWGwvREY4UytsU25IUU50SjFlYjZ1VnMwWGFKcHNh?=
 =?utf-8?B?TCtMWkhUTTlGV2hOdXQ1TGRTdHBYYTV4YXhhcVB6TGZyRElMWVhsZkVLRkZW?=
 =?utf-8?B?MEdrc2taWmp0Z3M1Z2F0d0UrTFJKNjFFV0lsWHFDMGkrQWgvaTRWQW1ZU0I1?=
 =?utf-8?B?dEcycnZ6bUtLT3dBUG9SU21CMzVna1U2Zy83NG1Jei9OaXpQVytPVDEzZ1Q1?=
 =?utf-8?B?RzIyY1JKQlJwaG1tM2VBZldsSDE0Qm1Ta29RZlNUSzFtak1rVkRkM1BlaERN?=
 =?utf-8?B?MkRhT2dpQ3R3bTJDTDRXNWpTMnIrdEUxK1Z4ci95OGw1dFYrSFU0NTRHZy9j?=
 =?utf-8?B?bk5EQU9KcURxRWlBRVU3Y0M5YWkrWWgvTTNMUG1RL3hnWUR6QStoTUVERzN0?=
 =?utf-8?B?bVdGZGNWVGgwMFVaTXgyMWNlNFYrVFZQUDZjVmJ5L0QwUm1pQ3BYNG1oMSs0?=
 =?utf-8?B?L3VPc0pLcWhycmYxbXpvNEdkR3I1b2ZrV2J3WmRRNWdkMjl2WW5jdDhGWXhF?=
 =?utf-8?B?T29zcXB1UTBuRjVxK0hNU083Wk80TkR4QUkxbU5ySGI1RFkya2Z1cFJZek1Z?=
 =?utf-8?B?MXYySGZycFhxWk5ibEJ2cXBSeCtGWFhBSGovb2lQa2p4cWJFUk8vejdvNmpy?=
 =?utf-8?B?U2t2NkI0MStjTzcyTmJWQWxMMGJUVzBUaFRxT3NINHNCeGtNYmY3Q3E4cXk0?=
 =?utf-8?B?b1ZvM0E2dEFWNUtwY0tPejVPM04xclNtcGVqM0tLdWxKcjFwSko1N3RtVXFu?=
 =?utf-8?B?RjI5aEtoRzFQM3lLR2o4THpJWDQ3TG9CcnRiNmtRTytKam1EYWd3UEZmU3Bl?=
 =?utf-8?B?NHlNTEMxVnk3Z0J6akNrazJ2VnRrZ1J5aDZUV1pvVkFkRUdZVTVZcWJtS2dv?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <346A39C0BF789A42A2A9DA6D607CDFA5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2f0ff3-efc3-45c2-3058-08de28ac1c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:14:40.8253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZxpehnByGYYL/IVpwozXqb9FZdt73I6AAlX2osPR+liBhZOBodqOl+zPaOUaQ3YIKw5xAPGkZkkVDvei4SMzmLRYe/M+aSKSs9ImY8EILU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_191452_894354_23911D91 
X-CRM114-Status: GOOD (  12.80  )
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE0OjM4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIwLzExLzIwMjUgMTM6MTcsIG90X3NodW54aS56aGFu
Z0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2h1bnhpIFpoYW5nIDxvdF9zaHVueGku
emhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFRoaXMgaXMgYSBjb3NtZXRpYyBjaGFuZ2Ug
dG8gaW1wcm92ZSBjb2RlIGNvbnNpc3RlbmN5Lg0KPiA+IA0KPiANCj4gQ2h1cm4uIERvbid0IHNl
bmQgaW5kaXZpZHVhbCBwYXRjaGVzIGxpa2UgdGhpcy4gRml4IGVudGlyZSBzdWJzeXN0ZW0NCj4g
cGxlYXNlLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KRGVhciBzaXIsDQpF
eGN1c2UgbWUsIGRvIHlvdSBtZWFuIHdlIHNob3VsZG4ndCBtYWtlIHRoZSAiZm9ybWF0dGluZyBj
aGFuZ2VzIiBhDQpzZXBhcmF0ZSBwYXRjaD8gDQpJZiBpdCBkb2Vzbid0IG5lZWQgdG8gbW9kaWZ5
LCBJIHdpbGwgcmVtb3ZlIHRoZSAiZm9tYXR0aW5nDQpjaGFuZ2VzInBhdGNoIGluIHRoZSBuZXh0
IHZlcnNpb24uDQoNCkJlc3QgUmVnYXJkcw0KU2h1bnhpIFpoYW5nDQo=


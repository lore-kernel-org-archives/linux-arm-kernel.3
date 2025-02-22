Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C819EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wG8veNcZAJLjJ1iEQZZOGl1w7NZbA8y4NsmNAFaQmTI=; b=42K+kp6N6k/fL7d9vA30kAQjOY
	kFnY69Cgg9/a+NHgLrj/heqQ4Vk/MrdHBAyUr+7+xvCvZwyxny/JeLhws8PfvSEqEF2aN9SAlSzzn
	zC0ETmRq2Hjg/UJcMJmBrZtD8kcPe4lfDrEzT8MdYD7XXAzsZWA6rRoiZx8bQkhElNuSNLmiXN1I0
	0IZZaS62SDtnJV2NkEXkCSlVyUDdPPSfIopB7Y7ybXk7ICLDlHr0ehzvTZRzTlekZYAHbViiJfSsL
	KyqjzECF3V9/B+o2Iil5MR+uIRdMwrusBZm2w6Y1nkO70bt5b01UwFqf9HFIV0NWuYIWLoUY/RY7v
	x0mwRHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkvH-00000007eci-2eMv;
	Sat, 22 Feb 2025 08:31:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkto-00000007eUl-0jvx;
	Sat, 22 Feb 2025 08:30:13 +0000
X-UUID: 379968e2f0f711ef83f2a1c9db70dae0-20250222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wG8veNcZAJLjJ1iEQZZOGl1w7NZbA8y4NsmNAFaQmTI=;
	b=B2lpF46mRW7SCyBh37YRC6zgBFW0uwoUYazKMTqgqMs6qm4n0oBIyp0HYUvnRWadgKy36d+9p0XoWnAv6QwiXY96iRh5Z3+7n4lYdyTB1w7uFW/2fFCiHx4PbiRLRx53aPtoJdbpS0QzLa7hoqvjvqQdFXa0U1fRBPCpiiZWfZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9f523450-87eb-4318-9ece-281d22b182fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:64c670b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 379968e2f0f711ef83f2a1c9db70dae0-20250222
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1527522221; Sat, 22 Feb 2025 01:30:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 22 Feb 2025 16:30:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 22 Feb 2025 16:30:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOfYstBudsCSsWhp0keLJrDEp48VmomKnM63j5DZGavguUTwW4YyCRqKvBcLPLxna/PDodfYcQAsh8mkqpeiNOoZk/2Rohp8NneO60QiLxh1aADnrGe6qHvrjKTfIVdEZ4EKkw7YNWSBXysV897jdT2+Efm2L45ux3oL7eVCx5sDtw3NXuNPZsdiR3PPcH6fHMnJ8QeFB8bQAyB5uneBbYlQFgfVWwkKXVFrALAhlxENtmxkF4Jz/9X/pKctdFTsUkWwRhyJYfVNuu5/X0jFCGSS4NV4sbs8rkSCquLkvvNe31N0yQcG/SaEPOJQ7l6QrsSX02vtOkOR2XCAjhRGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG8veNcZAJLjJ1iEQZZOGl1w7NZbA8y4NsmNAFaQmTI=;
 b=PCeLsy4YmFehS03mCT/n2zQKvE4jSuWptdM08m6UMuzIgLYwyeJZ0RiiZVmBXJWW3hNp2Tj5u+H/0+y7fSOyY484DVa7Vz7F17nsRRYAygFwb/5VfKpud8tx8xvzY0WPX2SQjYJ+U5lxrt5wifmvPwr+EhVvdeNStULNxqp+r+ICQmNgSLr1S3rdQPWcPypmFieShGg4aLUxPK4yJSeNMZECvvurjwLco92vGH/42gmgkH6GRHLqzMdzBxv5BZwJ0zsi3ddaebUpKaDX4l2dyV0V1xQgLHyr1pWRV3BQF+zjb5aGz34CkCnPTfUhQUft5KvnM2wLbBEnWrEQCEjzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG8veNcZAJLjJ1iEQZZOGl1w7NZbA8y4NsmNAFaQmTI=;
 b=V1QjprO2fnXNRUnWfy/1C1EVeQ3PsHf6SzCVloiF4e2Hckq9bDoPq2mI9VRSABooTRkmy5oo1Qt/hB/eLf++NW73NKzD7tA9yL5UmcHrdIm9t2YghpAlTXdyYzZtbg7Qtqt+Ku5PVtKIiPovZGm4J9URj9M8FDXj7Z4rjMR9wuk=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by TYZPR03MB7345.apcprd03.prod.outlook.com (2603:1096:400:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Sat, 22 Feb
 2025 08:30:00 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%7]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 08:30:00 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property
 to set disconnect threshold
Thread-Topic: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Thread-Index: AQHbZDNc/4kk1BQehk+0OCcaCvG0gbMVChuAgCl0dYCABB8VAIAQod+A
Date: Sat, 22 Feb 2025 08:30:00 +0000
Message-ID: <8eefe9902c884fe7a4a0d1f34c7b13c351b191e5.camel@mediatek.com>
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
	 <20250113-aerobics-tall-e570d8bbcf2c@spud>
	 <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>
	 <20250211-destiny-crablike-ab17a2814b7a@spud>
In-Reply-To: <20250211-destiny-crablike-ab17a2814b7a@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|TYZPR03MB7345:EE_
x-ms-office365-filtering-correlation-id: b34c0792-3672-4bd6-dfe0-08dd531b1909
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RWhQNDJZSUFqMlVzMUNHakdkQVB0MFRaeHYvR0RqN29xS2t2anMrNDhDRGRy?=
 =?utf-8?B?M05jRWFUN1RHSTlqd25xOStNT2hDdEFHeDBTQU9jcG14NUtCbFVYTnJQM0N5?=
 =?utf-8?B?RmRaQlpoYUNXMUV3ZmhZODFUKzNMcHpTNEYzRk9TYWswa1oxM0FwbFBtY1ZC?=
 =?utf-8?B?YnZIdkdMS2krVHljZnRRbkhDc0dNeERMSzF1MVhtZis5K1Nzc0tka0tuTnEz?=
 =?utf-8?B?cUZxODR6eGNnOVk0MFhTUVlyVitPQ3RueTRMbG5pQjBKZmY4cTBBbEpUR3ZG?=
 =?utf-8?B?ODkyajk3NmpENlQ0U29hK09SUW5TRGt3b3Q0SUdvVXNlNm15UmlwLzNXY1lL?=
 =?utf-8?B?UFpuMFFOYUFiQkY0SzdsTmkxbXlkTzFyUmxhZUVjcHhSYjI1Qzl1eDNDeE5w?=
 =?utf-8?B?aHAxWXRPMUc2MUM5KzBncEozNkZLbkRTamk3ZWZ1M1Q2YXg2WitiZkZ1aElV?=
 =?utf-8?B?S1VJYUlyS3JvS0dYNnBYRWdIang3K0xycVlPemZLajRqRCtYeFF5WEtTTjM3?=
 =?utf-8?B?dUZSVTNETWhITHdQeE1NTnRVcGQvMWlrYUlGNkNMWEowNG05ZlMyYkp4b1ZJ?=
 =?utf-8?B?NTlOaURCcWZFTmtSWUVwK3Y3Q3BGdVhKS0pFSHFHR3g4ZUY2TTRFS2c0RlVK?=
 =?utf-8?B?eWQ1RjF3dWJkSnNxRXo0Rm9tazFwU3lpdVdEck1XUWZlRk1WaFN0YnowNUZI?=
 =?utf-8?B?dWR6cExqcTJPeGdMQThIV28rZ1p4VlBRTW1qdE80cEpKTnhJMXovSFgreG52?=
 =?utf-8?B?SVlGWmt6YmVaOFR5YWQ4MExNRWgvdzU0b1c3RUVqTGQzZW56MjJTSkkvOWVO?=
 =?utf-8?B?d1d4QzBZT1dSOEZPQm5Va09xOHJUc281VjdhK2ZsU2N2bUUxaTc3Wm1UbkZW?=
 =?utf-8?B?cmNWNUNlczM3M1c0N3RZc29UbDdaQ0ZESDkreW94bFcxcnBUcUtIOU9UK0N0?=
 =?utf-8?B?czN0QnVudkhwS1JSaXdxVk1KU1cwRXlZaWkyZHRHaWZIU1IrQlFBUVNGaUNr?=
 =?utf-8?B?cEZOVUNZMUNmWVZJZjU1K1l5cXU3Zld5aTZKSExtbmJUWjgxSTFJMitleFps?=
 =?utf-8?B?VGtLd1RVUkFWTWI0a2tqSzJlNHViZUtXNFpzNGt3S1E1bnFFUGQvd2Z1WUFU?=
 =?utf-8?B?b2dqT0I1eXR2WUpVempicVZkc2VIUWRaZTg2N05kU2F1Z1VtcDN4ZmprcGlO?=
 =?utf-8?B?bDdYU1g3NjhONTJQZStFSXl2eTJja0Zxc0t5Njdud0lzZTZBS21LUXFuaVEz?=
 =?utf-8?B?N1VoR25WMHJBTWNhL3JIRFJFMmp4UWQ4VXcvVUx1ZnZ1SnJFak5FTVp4ME5H?=
 =?utf-8?B?d2swLzR0Zys5NjVMK0JyYlJlczlmY1RVOGhBWkZTb0tSOGxUUnBHQUN2dnZw?=
 =?utf-8?B?bjEwcHRyK01zWE50Sng5WUJRYmd5c0FtRXNpcXE1dTUvZytmbEY3R1dQL0Fj?=
 =?utf-8?B?SmxkTzlMOXBuVlVlUVl3S094bVRYZVlkSVYydFlEWFVpMEw1bStvL0t3OXVv?=
 =?utf-8?B?eFJhcEtwTWJUMUZ2aEIxMzM2S2lUR2lQa043WURXeVFvb0tLWTU5TmdUbURw?=
 =?utf-8?B?eWRWS2FDUXJZUG1lRyt4WDkwblBEM3c3UEphbVJYOVFIVWc5Rk5rYWFsa2I4?=
 =?utf-8?B?Vmk5ZVdZZEMwaFJsL2JtaGR6VjRUeUZ1QnlSWmdaUkRpMXN3cjdIRjloYjFF?=
 =?utf-8?B?Ukp1eS9qWnBKcks5Z01aY1VqekpIamJXNU9PSG5wVmlrOGZyM0tHTDlEMXJH?=
 =?utf-8?B?YjYwZVpjQlQ2UGFHUzBoUVhHZndKbkxOK2ZoQzRPQjJsY09oU0ZUcGxMVk5G?=
 =?utf-8?B?b1VHTVFqL3NLSHZtVXc4c3kwWlFFdXR2VzNQU1hURG4rOEh5TU85WWJOY054?=
 =?utf-8?B?endWM01NTVJ5RjY5Qm1VM3M5dWRDREMvM2ZNaG1OUGNnU2xYdDltVmVuL2xE?=
 =?utf-8?Q?kH0gIdQgV3BNbWA8Jt8bDsIUOI8dAQrs?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TSsvYlNiOVVqL1M1QWIyeDRRVnRGK3NvbVhOTWVTbFpEK1JwQjdJQk9xSkFJ?=
 =?utf-8?B?U1d4bnlDU3ZUbmlZSWJ5TWVRbjVXalk4TnJGQ2JxNHpGdmxpbEdkT3VHdWVr?=
 =?utf-8?B?QlNHci9QQlFvdFRWSlRBcVYrKzFkSWJ0NFNTWTI5TFVkZUZFSmtKRHhkY2Fk?=
 =?utf-8?B?bTRKS2t1NWxaR25ybmdva29jVDIzWENoL0Q1Qy9MQ2RvZk02OVpkeUN5TEZr?=
 =?utf-8?B?a1dkZHNMQU44eUJuNUttQXN5YmZYNFRXaXpwZFRnd051QTFLZWp0OGlxMEJx?=
 =?utf-8?B?ZGN6QlJtUWhCVGRqRzdzWDlGM2ZRdnRLYnR6Y2pEWHF2YTdYUE5vVEtDUDdn?=
 =?utf-8?B?WjY5TXRPVHVmNDRxYkVFaG5Jdm1MZUxQUGcvMmxwOGxuTXJDWXltaVRMang0?=
 =?utf-8?B?T2RibVVpcE5XMDM2SzNVWDkvUTBOTXdzRDVUckFYaStTT3lJd3krMFVuV2dw?=
 =?utf-8?B?Mk5ESVlNcUNlUGg4Y3dQdThreXdzRWw4TUtpdDArWEI3bE5kLzRTYnNXSFFk?=
 =?utf-8?B?b3ovZ3A4b3B6WTlhQ1l0bU40Tmx6cFhaT1NmU2dFa3BjT1hPWTFNVDl2ai9I?=
 =?utf-8?B?SnJYNU5aSWFkOHUwUDM3QjFxU2xQaGxRRXMzalZndlIrVnNBenBGSzRHMlJY?=
 =?utf-8?B?M1M5SE81c2VFQUJ1Rk1SbjFrcHUzZE9qUmFpdDZyR202SFAwK1p5cGNTUGR5?=
 =?utf-8?B?MHZUNDlOSzd3VzZQbzBhUEZzNG5MUGpxWkl4MWhGa1RkbTQxYlJuRkJEQ3FZ?=
 =?utf-8?B?MFZwSGtHODZGZWZ4N2E0M3llamRBZVN3TWJuNGE5dS9oRldMSFhCRXhaZXM1?=
 =?utf-8?B?NDZYdm5HeE15bXgvVFRSQm9RYTA5d2Q1U1N3elNBZzNNUDlmY3R4Rno4RjdE?=
 =?utf-8?B?ektkN2NLMzBCUGg3UnhYcGg0a1lXMVdGODBhQ29Lemp4TVhKQ0ordEpUR2ZZ?=
 =?utf-8?B?WGNJQTVTV1djYXc2R3BrenVzRFlYbysyRSs1Rk5GNGMzeUd1d0VBdE9YNENj?=
 =?utf-8?B?MElkMnZaUkZGL3NPTHR0aFAwS1lRcksxWHZueHFvaXh1WjY2TlFrTkkyelNy?=
 =?utf-8?B?Yk85S29xNDEvQUxqQVh6NUhXTmxDaGNjU3JEWHRwY09qcHlVR0J6ODdvYlZB?=
 =?utf-8?B?SXNDOWxwT1phcGNVU0FvUUpMekVQZHllc21HY3UvTUU4aXdKUWNUS29ubWo5?=
 =?utf-8?B?Ym1FTEJHakw1T3pCTk5xL1VvRjZLTm4zNzR0N3RjcURpb2FlakE2aE5ieHBP?=
 =?utf-8?B?a1JsOUpPRTVqWnVWK1g5eGRJcDZBQWVIbG1URFpWdmVsS2dtZkJObmttNjJD?=
 =?utf-8?B?Rjg0TzlNbTVqbFRudmp3OGtubGFIOWwzUjBJUEVFOVFCZ1VEb1JuZ0dNTUZR?=
 =?utf-8?B?bDZhS3NtQy93Mnc1MEVqQlh6MUJ0RjJFY3JuYXpUNlA1Yk4zK0I3QlovSW1E?=
 =?utf-8?B?YmJNU0Rsdk11K1VkSEdIbTNiVDRVQng5ay9rdWxoaHRXdC81Z2d4eHFKdWxF?=
 =?utf-8?B?TzhEWDU4andRMlJjR25MZlgxQ0xTdlM5ODE4MHpCUmlPTG5weVRvUTk2emF6?=
 =?utf-8?B?K2x5UDJMN1NpdnJkQk9hSXpxb3FqQ3BjdGhPdFpMblM3bm9qb2ovSnI2emR6?=
 =?utf-8?B?ZG1SZ1lqWHhycVB4cWVqM0poUnNxSjNzZGtLd0xjZjZLekQ5RVhYMExxUUVl?=
 =?utf-8?B?TUhZUFBpaDBUOEtEV0NsVWdoZURuMnZ2NEpQNDc1L3lJT2hrZnhKUGlaTDFM?=
 =?utf-8?B?bzQ3Qk5VU0RtWm9nQ25qem9FbTBrUXh6cFRTQ0Z6cXlrYVgyS3pXRkFrcGtJ?=
 =?utf-8?B?MkFqYU81bUpXU3hJRGZ3dEF1cVpaMkdxaTNic0wzYStGN1lSdG1VdFhJSVhI?=
 =?utf-8?B?VU43eHdUb2oyUDZVeVUzSlJGZGcrUHhtNnZ4ekl6K3JoWVJhdHZtT0I0Qk52?=
 =?utf-8?B?SVRPa0prVFRXdlM2L2JXV2VUeWZTMmhUSnBNUkJ5MDJtUERzSlpveVJBSVBx?=
 =?utf-8?B?VnlOb3dER3d4M3RmbTQzTWhRY2ZmWjFBZE9xMDBqSzlLOEwvK2VoUWh5T1RX?=
 =?utf-8?B?ZzRMMkU3SnhWRUQyVjM0MDBxSUNrQWNnOWtZWG1yUVZpNWFxRHgyMXRUQ0s1?=
 =?utf-8?B?WGZpVERhQ1RDNllFbmhFSXUxUjIrakowUGNCcTVWUThRaWpZNkxaVTJ1UWxw?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2CF9EAC7D17F14884DE70666B1468BA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34c0792-3672-4bd6-dfe0-08dd531b1909
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 08:30:00.5476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ORqKfJ09fgd74h2VJx77wz6MEhMJF1k/If/+PPipwcpYMROqNc3Q7GIVH+ODS+bYzrLATpP/f7Clgts/kroR6iF/+F/XkER/cQ71Y6scyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7345
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_003012_286641_ACD225AE 
X-CRM114-Status: GOOD (  22.36  )
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDE4OjMwICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFN1biwgRmViIDA5LCAyMDI1IGF0IDAzOjM0OjEyQU0gKzAwMDAsIENodW5mZW5nIFl1biAo
5LqR5pil5bOwKSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjUtMDEtMTMgYXQgMTg6MzAgKzAwMDAs
IENvbm9yIERvb2xleSB3cm90ZToNCj4gPiA+IE9uIFNhdCwgSmFuIDExLCAyMDI1IGF0IDEwOjE1
OjQxUE0gKzA4MDAsIENodW5mZW5nIFl1biB3cm90ZToNCj4gPiA+ID4gQWRkIGEgcHJvcGVydHkg
dG8gdHVuZSB1c2IyIHBoeSdzIGRpc2Nvbm5lY3QgdGhyZXNob2xkLg0KPiA+ID4gPiBBbmQgYWRk
IGEgY29tcGF0aWJsZSBmb3IgbXQ4MTk2Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiAtLS0N
Cj4gPiA+ID4gYmFzZWQgb24ga2VybmVsIDYuMTMtcmMxDQo+ID4gPiA+IA0KPiA+ID4gPiB0aGlz
IHByb3BlcnR5IGlzIHBvcnRpbmcgZnJvbSB0LXBoeSBkcml2ZXIsIGR1ZSB0byB0aGUgdTIgcGh5
DQo+ID4gPiA+IGFyZQ0KPiA+ID4gPiBzaW1pbGFyLg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWsseHNwaHkueWFtbCB8
IDgNCj4gPiA+ID4gKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiA+ID4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHhzcGh5Lnlh
bWwNCj4gPiA+ID4gaW5kZXggYTllMzEzOWZkNDIxLi4yZTAxMmQ1ZTFkYTEgMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWss
eHNwaHkueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L21lZGlhdGVrLHhzcGh5LnlhbWwNCj4gPiA+ID4gQEAgLTQ5LDYgKzQ5LDcgQEAgcHJv
cGVydGllczoNCj4gPiA+ID4gICAgICAgIC0gZW51bToNCj4gPiA+ID4gICAgICAgICAgICAtIG1l
ZGlhdGVrLG10MzYxMS14c3BoeQ0KPiA+ID4gPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQzNjEy
LXhzcGh5DQo+ID4gPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYteHNwaHkNCj4gPiA+
ID4gICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLHhzcGh5DQo+ID4gPiA+ICANCj4gPiA+ID4gICAg
cmVnOg0KPiA+ID4gPiBAQCAtMTI5LDYgKzEzMCwxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4g
PiA+ID4gICAgICAgICAgbWluaW11bTogMQ0KPiA+ID4gPiAgICAgICAgICBtYXhpbXVtOiA3DQo+
ID4gPiA+ICANCj4gPiA+ID4gKyAgICAgIG1lZGlhdGVrLGRpc2N0aDoNCj4gDQo+IEp1c3QgbWFr
ZSBpdCAiZGlzY29ubmVjdC10aHJlc2hvbGQiIHBsZWFzZS4NCk9oaGgsIE9rLCBJJ2xsIG1vZGlm
eSBpdA0KPiANCj4gPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ICsgICAgICAg
ICAgVGhlIHNlbGVjdGlvbiBvZiBkaXNjb25uZWN0IHRocmVzaG9sZCAoVTIgcGh5KQ0KPiA+ID4g
PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIN
Cj4gPiA+ID4gKyAgICAgICAgbWluaW11bTogMQ0KPiA+ID4gPiArICAgICAgICBtYXhpbXVtOiAx
NQ0KPiA+ID4gDQo+ID4gPiBXaGF0IHVuaXQgaXMgdGhpcz8gVW5pdGxlc3M/IEhvdyBhcmUgdGhl
IHZhbHVlcyBkZXRlcm1pbmVkPw0KPiA+IA0KPiA+IE5vIHVuaXQsIGl0J3MgYSBsZXZlbCwgbWF5
IGJlIHRyZWF0IGl0IGFzIGFuIGluZGV4IHRvIHNlbGVjdA0KPiA+IGRpZmZlcmVudA0KPiA+IHRo
cmVzaG9sZC4NCj4gDQo+IFNvIHRoaXMgaXMgYSByZWdpc3RlciB2YWx1ZSBvZiBzb21lIHNvcnQ/
IA0KWWVzLCB0aGUgYmlnIHZhbHVlIG1lYW5zIGhpZ2hlciB0aHJlc2hvbGQuDQo+IFdoYXQgaXMg
dGhlIGFjdHVhbCB0aHJlc2hvbGQNCj4gbWVhc3VyZWQgaW4/DQpJIHRoaW5rIHRoYXQgaXMgbVYg
aW4gZmFjdC4NCg0KVGhhbmtzDQoNCg0K


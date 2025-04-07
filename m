Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F808C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=; b=0WVivh+2iaX4OOduLBy1i/FZmI
	HDsEfC7G1v9y6+h3dpQylHmNeLXRsXw9cQMhb/nv+PlAHAyfYJVADmMRWaZc1X80oxHxLc3/BqZvM
	tnPVaD8obX2KNHBifcl8KzODuvZckRJKnvmIszhThvWP59/C38HwcId8v/WjAqsjzCp8tUGpMRY5b
	JuV8uSehH8LF/YjKBfujynYG2vu/FJYjIEYbryWJQBC+0jkf8lFwFDDdJ8mifmhI+HYzLMvn/yoxe
	VqWFSNMiTG1E5yZWrpiIV8l9W5gpH82DBOU2ICaoujRo/TuHx6ML2LNk64T0mKjOl2vRKZNM6SgjF
	vvd8kRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fwI-0000000GZ5D-3ARh;
	Mon, 07 Apr 2025 06:26:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fuX-0000000GYsg-3z0q;
	Mon, 07 Apr 2025 06:24:47 +0000
X-UUID: fc5a6782137811f083f2a1c9db70dae0-20250406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
	b=axzRchQyqmTh+fdCfsN7nfuQJqpmlCIKRlVn4lZ9UJ+H0oO883D2oUKg2pmuD+pInvWGvX+kJDSrKWGthWvmHuxqpmgJnUL93g0f3grZ5YBdF0LJZd4ZF8wxveX12ILk0q4IqMOlWF1k20cn6sHDYMioFzdF1YbTKz/c62+G2Io=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:037c57e5-8818-4b92-b51e-f8a6f753fe91,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:068a42c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc5a6782137811f083f2a1c9db70dae0-20250406
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 764477180; Sun, 06 Apr 2025 23:24:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 14:24:37 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 14:24:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vna8OJOaUzjxd2tCPky9plrIY5LM34kYF5xfA+Mbm3NMzU6N+66s46ZQTboJQgCfsrS2q9QxMEO8tIuaPyCiRHE63dlNH0d52O6YjTIqvwrycX30bZZ/bOrCAuZFoCLNC2H3sJ2tSLnx1JLycWAlDRyhm8d1HzoZJPpdJ+VZg57uuYVK3SH/GxtVkT1iDkpOwxRF3aksTQJ/N5npkzIoErdFoGiW+r12ovucLe6VeOzROLUIMHIiaWhalM7KvonpXarvBJCh04dH2bwaGLNpwTsj5XTrCt23LupJfW3o1QmBlHDduvASZc8QE3EMmMvq0GQrzYnrmvxiUfCUW8+Ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
 b=uVOoTh4fdiO5ubiK9NtrQYHsbIhbxsy60MWx42tUNSqam1vLBQ11ehIPZ8uMNzVILQHAAOUAzE1v8IEgjwhKbocPaYC7C4zCaXIH8aEch2Fdl8XfHpTyT2u/5FM4zoke08sz0/UTitk4WSFKa5dIa7mQKISdefU7RmoSTxQR6P95Oag0J2seR61BsJpcrOLZSAD+qA7Vri0Zkclg+zN+9TUZ+oMWfnZHD5TwqI7XOAHhw0889YmWCVcTIEIAko8KpvrnX7/w4x/hyJh8wk5a2j8HvAZNofADL1od0tLTrqufIiw+H86E+YoHuKSbhtpDxG+Q8JWIXkri5m5tjy8r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymrzhLw9Cfio1u+PtXzm7ClORBnpJIwo7MuDYnfPYD0=;
 b=u5bsS+p0X/fabuYPgjUC8Ve1Olh7DxHHHk9P5WRnnXqlt39GBBK9EkLwvQuHBkEGKjHnt/px02UgeI+US1dyJ4ARsD7CaHaK1CGXv6aMSwS+41dTJh2Qm7c3sBEDHL5d/uLaoVSmefo8vtaT3cFwgB+m/yjn30CeS9c6ynNM7a0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7893.apcprd03.prod.outlook.com (2603:1096:400:452::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 06:24:34 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 06:24:34 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND,V1,01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [RESEND,V1,01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Index: AQHbYv7iZciBiJhPPkyQCCByNSw0trMPn/QAgIilgAA=
Date: Mon, 7 Apr 2025 06:24:34 +0000
Message-ID: <545fcf458d79e1ad1e4a9f1b6b81f32504a6886a.camel@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
	 <20250110012749.30072-2-kyrie.wu@mediatek.com>
	 <e6019aea-b097-4a24-afd2-e1d638a5a8a7@kernel.org>
In-Reply-To: <e6019aea-b097-4a24-afd2-e1d638a5a8a7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7893:EE_
x-ms-office365-filtering-correlation-id: bccbb55b-e907-4ddc-1449-08dd759cdd1d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OTZGbkFIYWU0ZGxmTERaL1BSVm1lVGxYT3lBemc0TjVpencwUmNGcjF4aWpi?=
 =?utf-8?B?aTkrNUV0clkzTGVMZEpZdWpqYlhOcUd3K0tSOXhVbnJIeTIycFBVb1lHY1hN?=
 =?utf-8?B?Q0dRTlFrU00vdEYwdjFGUVpDRktTNzdyTG41VHoweUhWSGRNem9rUFlQY3Jo?=
 =?utf-8?B?V3NWMFl3OXY2blBwVkZ5T1FBK0drUVZmbWJXYVQ3NVZNcXg2dVRYTXFhVzV2?=
 =?utf-8?B?YVZaSWl1NGJoVHMzL2gyaDlvM05nK1N1Z3MyQk8xZWpjc0Fjb25PdzVncmxm?=
 =?utf-8?B?REdhU1hDc1NobG5uM3JzVDdNbVY2QkJhTkxZZW8vVkNXeWYvYm8xeVpDd0FB?=
 =?utf-8?B?WTQ2RG9MQnNTUzVJYk0xREs4VDh0bFY5eGdJRTlqVEJjVXdCTmJhZndGUXV1?=
 =?utf-8?B?TjczWnV2U0FDVU9jR3hkSlNZZEE4NU5CQzQ5SEl6S3FmSjlzV1lyVWJmU0dK?=
 =?utf-8?B?aEs4am91U3ZHVFJVQ1VROUVwSVJFZnErdWpnTEdQak9ac2RudEFxUjN3QVJX?=
 =?utf-8?B?ZTRMWkN6ZWRKOEhIZG1YTlZSSktCaGxpbEtFa1ZQZXczdEl2Um92aFhLc3dF?=
 =?utf-8?B?ZCtuUXBGaGVyL2VJcnJlVHNtNXNpcXhvYlVoV3R5U3hja2hoeXJ6WFQ0NTJi?=
 =?utf-8?B?eXZPWjk2by84U1VjcDF5THUyVlgvTnJjeXRoSVN1Ny9GYXN5Q2p0MWFTaGhq?=
 =?utf-8?B?eTJWRWp3VE9KR2hXTnhUbld2SG5ITnJrNkxJR0wrb2RrWVU3cXpVb0I5d3lZ?=
 =?utf-8?B?U1A5SmdIMlY3THBhQXVxMHV5NEJDakw4SmtIb0lHVEhoRXdRVmVLZVI1SDlW?=
 =?utf-8?B?ZWxpTFpLYWkwSFh2ZDJES3VxSzlxbm9SSWs1b21uVU1MTEpPaWpsTXZxOXYy?=
 =?utf-8?B?VHVIUjUrUnhub2U5eFB5bVNqSzJIaXZZZXRmd3ZJaGY1YjZIbzRCVllUUjN1?=
 =?utf-8?B?ck15cGdFMXpZaXZ0UnZlQ3g3dHk1cmthZDBqanM2cEQrV0hiSUwyNXp1RUQr?=
 =?utf-8?B?YUdkWVFoU0JQYTdhZUFudU10TnFsRkJEbWxpZmZJQmg4ci9ubkFkbldIR3ZU?=
 =?utf-8?B?Qit6bXpHbllpOTZmNUZEUEU0NWM4T0lqekk5QWoyWjAyb0gvZVU5WUZ6SnI3?=
 =?utf-8?B?ZzFMYSsyTldMV2V1aWg1Vmh4Y2JoTk54YmxxdVZreEppQldxcXEwcDBnTzlG?=
 =?utf-8?B?cWxkbUFWOWZvSjFka2d4QWJWT1dsMHBrNkFKWEJlWnc0Ty9lV08vY09IaEN2?=
 =?utf-8?B?SWhtYVg1YitjTldyb0xpRjlabGxqV2s2L1gwZzQrbEUvRlZwMGVSMFFadU5j?=
 =?utf-8?B?bkNxTXJRcGpxMWp1Q0NMZk5uYUpuL1dkWkJSOGpWM2xwZE01RlBEeUlsbDJN?=
 =?utf-8?B?SVR0ZElMQkRrZHFPMEdsUUxZdmFCR1p3RGEwUnpBZjhOTWpFVVVMT3pLME1B?=
 =?utf-8?B?VnVJSy9nV1h1ZGFySmJIU2xlK3o1dml6SHBIb0dHN1BteE5kQXFtUkxrVVha?=
 =?utf-8?B?T0dXbDNBREh2U2kwWWxEVy9tVXYwL3ZXVUtpVWlaVHoxTGd1UGV6T3hKY0c1?=
 =?utf-8?B?Z0xvNnVRY0lLVlZnUHR4L1pPdCtBTCszbEVaeXVEcEVwZ1lyTEM4OVpJUTR6?=
 =?utf-8?B?WlZTOWtIck1IRlFJSnRhNjNtQUNuTUdEVFVsRzFFV0lWYWZka1RGb0xFcWhN?=
 =?utf-8?B?MGt0clhmTnQxQVFzR1Zra1UycEk1VDNPekVxY0h4dnIvTEVPc1o3dHQrSDEy?=
 =?utf-8?B?NVBHZ0ZRQnA1L1IyU2twTm83SjJ5R0xDbTJxdEc4aU9LUTE1bnNFNHVXRzA0?=
 =?utf-8?B?NGtkU1BTMVMvM3ZJVmJQZWV2SGQyNzViSW8xTnUvYmF1UFh0MmNVakNnK3RW?=
 =?utf-8?B?VEo4Q1dPTFY0aVNlak1WUEtRQzZ0b2RsWDlnZm5PblJxS3ZndEtjN2c4Wk55?=
 =?utf-8?B?a2dXQ0czQS9icGRIck1MRjNJTUVwMm9aeXoxOElXVXdWSjQyMDB3alJLN09M?=
 =?utf-8?B?MlNra0hSVFZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tnp2M0JNNW9xKytCTVZTTk90UFBYSHRPQ1M3YnptcG5GVHFyQkJDZXpGdlVE?=
 =?utf-8?B?QXJTcE13QVZvUGpjN3VHWDZ0YldOUGY4VVpuRkFqVEZHYld4V1dYSnNjSU5n?=
 =?utf-8?B?aGQ2RUxvcTliNmMyN1d1Wlk5UzFycjlWdk1oWXlRb3B0MXg5bFhtMlQ5Znh4?=
 =?utf-8?B?aFRxSFdaSitnaE4wdExDVlAvSmQzZ0gwK05kZmRIVXB1a3RqazVEV1BmSlhn?=
 =?utf-8?B?YllqbXk2K2wzSUpCL1dFWHFxcjBYL0syRnBxQjQyT1k4ZHQxNXNXdko0Q0ZQ?=
 =?utf-8?B?WDVDaGQyWW1peG1LaWpWTmRCdy9Jdm5xa0lsQWRsclZWRWJKWVpDellxRjlB?=
 =?utf-8?B?YXpPVXVrcS9DVkpQNVdJWXZLWCt5b05reDhyZk9DT1RVdUs1RXF3emVsaGZu?=
 =?utf-8?B?dTdqUnBZNkpDdzhTd1pyL09kK004bWloY3FJM0haQ2RRdzBUNHhySHhTZ3ZL?=
 =?utf-8?B?dWs4ajhzUWlSYnJmRCtCNXF5WGczREJiSkhFZEZmNVcvMzczZWhOak1UQzYz?=
 =?utf-8?B?SFo2SGhCdG8wRkRtbUpqUFNtL3Rya3MxL3Z0UkthbXVSVGJEYWdRQng5Zm1r?=
 =?utf-8?B?L3ExWXBqV2p5WHlWZWJaYU1KSnJkMnVWV0krelgrNm1XaHlUZTNOamRZVmU2?=
 =?utf-8?B?OHVVdzVjN1BTWURuTTRkUi82Q3VBWWZzQzdQYjI0MkNjYUdMM0lnMitpNEQ5?=
 =?utf-8?B?UlN0VDFpQXFLaE9FSE9mYUhyVDNqdyszYnJXNUpqVGNEajkwNkh2RzM0QmdB?=
 =?utf-8?B?VVRjZEJvVnp2RW9oUGw4WmRRcDRtTHVORDRmZW83c01IVnlJaXNlci9MK1No?=
 =?utf-8?B?SXVvSEZiOXZON09ta3J1Qm41SFpkNzhEZjh1UkVGUGFkMXNEYlJRSnhnZi9a?=
 =?utf-8?B?U2VFVysrejlaU3Q5MjRNNUZvbEgxOGRmRWtUUnZ4dTlOU3JIeG13b1ZhVTNW?=
 =?utf-8?B?bW1rVnl1RU5zTjBLZ3dDVzl2M0ZGdWkyRjhHSTJBdDFoMEVhemdzSEltMnpT?=
 =?utf-8?B?UXkzOFBLVXhmVFFVTjdwZ0lDTWY2azNUTTVLMHdMQnptUksxZmp6L1FCaW1x?=
 =?utf-8?B?ZGNBQk5rdHdEQllmRTBkYmRkRDgzaklQdTMxcHBVTVNpVjk4cUQ4QVp5cVUw?=
 =?utf-8?B?cjRlNWhaMldnT2lPZE8yMGJjd0lQR3BZZWZrSzhybEszOFpqTXZMNXFadVcv?=
 =?utf-8?B?UjREeElGeEtQTlI3TVZ3VlVoWDd2TDJZZEl4YkExQXN0K0VLREpFZnV5Zy8r?=
 =?utf-8?B?dzIxMU1BZUkyM21mblV1UFF5MDV6Ym11NWRjY0k5OWk4U3VGc1lKbWRFVlhz?=
 =?utf-8?B?M0szTXh2NkFUQVlCekt1WmtnUDhDalV5NitpQlJ6b1FxbEpPOWE0MldrTDZY?=
 =?utf-8?B?TW40TTFzMmdQanNxVjRGYnU2RlAxbkJ6OVBYTlN5Tm93RzVLYmNKdXhUKzBF?=
 =?utf-8?B?T3NzQ1EvdU1aSE13cTBvOUhxZmRGWWVzSkxMMmVrSitKUWtZbFdRMUx6dUtQ?=
 =?utf-8?B?NUUxVUZMbnhoU0lVZlErVkw3VEo5QVJJakNURVdZaHRTdnJWK01POXBtNW9a?=
 =?utf-8?B?dWg1UWQwbmZSVDlSN0RoZkRTNmMxc2JrSjJERE1NbmJWVmJUb2hvTjRUYzJw?=
 =?utf-8?B?OGJhUnBJRWU2RUxaZHFkd1dNbEhxeFRoZ3AwejYwMDJmY2JCbHUrNjZQTmFR?=
 =?utf-8?B?S1d1WHhDYWZobU5SNk9wb3NvbWVybjNXSE5ZNVFiZjdPRGIyNzYwRUVLZUZn?=
 =?utf-8?B?VkNRS3lZVlI4QXFIc0luTTh5R09sWENUZ2YrNkJnYlF6enRDZmV3WDZtVWxM?=
 =?utf-8?B?eWNSU3FlbXB0cFh5YWt6b0NtZ0hubk9pano4bWNkMVNKY2dMOUsvU2pkclJM?=
 =?utf-8?B?RTlIOVR3VzU4TUlBck1GUmcrMjhhSjNSTUIvSlBKc1B4SEZrVWUyYlhNOG5k?=
 =?utf-8?B?MDdmT0pQdldEWTZSYmxxZ1dvVDN5VTM4ckVqTnM0cnI0WW1yUFZQQmpUNyt4?=
 =?utf-8?B?WG13TnpTRkNpUTZ0eVo0eENhNktjb3ZjWFpWdElvRWQvVlE1aUQ1enhDdWtl?=
 =?utf-8?B?L1F4Q3Y2WElENUZsWCtnZjlHQ3d6N1FTR1poU0syRkhPOUpCUGRseGVnTFls?=
 =?utf-8?Q?KJ2AiWzAKa3KXqQCDAZtW7y0F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05908A6CE8993F4FB779E56BEEE0FAA0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccbb55b-e907-4ddc-1449-08dd759cdd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 06:24:34.1454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sraQmrgShOquc6amvc8AUHYA8bBJevVovPx0CNJjOS2GiZOS50S8K6Y1p32+1OnrWYrFIhi+kaNEMLkWM293XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_232446_000584_0E102FCF 
X-CRM114-Status: GOOD (  10.73  )
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

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDA4OjQwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEwLzAxLzIwMjUgMDI6MjcsIGt5cmllLnd1IHdyb3Rl
Og0KPiA+IEFkZCBtZWRpYXRlayxtdDgxOTYtanBnZGVjIGNvbXBhdGlibGUgdG8gYmluZGluZyBk
b2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBreXJpZS53dSA8a3lyaWUud3VAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gTm8sIHdoeSBhcmUgeW91IHJlc2VuZGluZyB3aXRo
b3V0IGltcHJvdmluZyBhbnl0aGluZyBoZXJlPw0KPiANCj4gWW91IGdvdCBjb21tZW50cy4gUmVz
cG9uZCB0byB0aGVtLCBpbXBsZW1lbnQgdGhlbSwgbm90IHJlc2VuZCBzYW1lDQo+IHN0dWZmLg0K
PiANCj4gTkFLDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpEZWFyIEtyenlz
enRvZiwNCg0KVGhhbmtzIGZvciB5b3VyIGtpbmQgcmVtaW5kZXIuIEkgbWFkZSBhIG1pc3Rha2Ug
aW4gdGhlIFYxLCBzbyBJDQpyZXNlbmRlZCBpdC4gSSB3aWxsIGNvcnJlY3QgYWxsIHRoZSBjb21t
ZW50cyBpbiB0aGUgVjIuDQoNClRoYW5rIHlvdSENCg0KUmVnYXJkcywNCkt5cmllLg0K


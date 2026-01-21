Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A28D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 06:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HbCW3kgnVusmdM/lc66nIpiDFv+GFHRE55OhsIxr0s=; b=IKSx2Xbip/46MCtjuyx9nQTYrD
	/+bHy0/jfB5/pF1/gbljOoDvyzr/xI440rL8njFglmAzup+aS2CbukRzCDx/xGBZAf3binzPAXJV+
	/6pxKUTIfre7gM0XLmYD6fur14/rQHJPvtV4YlNoBhJeLJ9pUcdvEpheB3mJDZqvWwlGb03z+50qz
	fnn7QqCq5CSzZu9TI00o9X0uEr/rpM5fsMBLhO1rO4LVcs5EV+Fv+Pj0o8OAj1RUn8hrHhgB0XHno
	tvI4xDKaHG7sVsxT/pEFh+tqgM+m8izH5GiAk1rDhrOMv+OcTGX1sMXn9MX4rqowI9A5cTljjZOFK
	sCMjb4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRdG-00000004wRd-1Xpx;
	Wed, 21 Jan 2026 06:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRdD-00000004wRB-0HUQ;
	Wed, 21 Jan 2026 06:23:56 +0000
X-UUID: bfbc3b32f69111f0a16f0188aa809bee-20260120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3HbCW3kgnVusmdM/lc66nIpiDFv+GFHRE55OhsIxr0s=;
	b=jHfUvHVwjtiYqDCAVOXvOxvuXzLtvv5VWtvHC9plpaqqon9WfWxzvlYgxc0klQ991eDeFcBC9gJ16OsTZ0eFNqX0NUlXWxVHyDths5MNgHOTVkS672elsdXFeJ/xOzmPWUBnsOHAgGuW6iWDseguOCrCA9MHT+M5LciSHm9baiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:ee8c8c47-a0ae-4687-8200-cddd4b167ee4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:31c05f5a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bfbc3b32f69111f0a16f0188aa809bee-20260120
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 818579207; Tue, 20 Jan 2026 23:23:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 21 Jan 2026 14:23:47 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 21 Jan 2026 14:23:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNGZSWNDZgyH9L0K+Go2DGtl0ZddFKb4DxpcsXEdim+1EKcYQo9Gfa0fkANeR+w2DAyiZvjfEz1o7hQBOc+Wu0y4GfMvrKNoRyQ9Zk1wfLSUmUI5gffEHZb4Z6xz3VnLNYvB3i3EWER/0K7/u5YpVdh4tyf42Us7IqrIH1HLzAzUDA7nyCjtOykWE0E3GjiLuuPw73RgdLBqfT5iI5zfwlfj2r9EewB6ks81xxY4sbuXBCwO6x0YPMqjMl/vo5gSm4nA3CTUwzYHT9bzb2hve+zXF7WjO87dbpntFrA8b5wvsainx83Ceuugjp9wJDLzgP7MSw0xl7iUayWEVfUdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HbCW3kgnVusmdM/lc66nIpiDFv+GFHRE55OhsIxr0s=;
 b=M9n8klAjGQLIFI2sofeHdR5xGieyRRw0JsducaVgm+ytkIEhd70/LcRG9/fnJT2QK8LDYmHgcEFCwcadBdcjr+xLI9i+IRT8TTdbKBoKVTcpa9WecgdEfTKIj1hRs5WuG0JVjnN9UHfkpSICg/rEeRHPKKm5dEjlW6gFdXYa1sPiDV3yHt93R7nhL/qHJfrcVCO51R8rZOEQ/HRFJNw0u8xhnDok/paDCduBZEe0q5C5EupjdSgcO/DpqBG/vUEKJodyH0LLUvWE6AU2ynOsUccocJSwK/Ga5u866x+YFBxH5r+tedIu3Ggw1zGKUD18zH47LCSBiQIL8hwHTC9aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HbCW3kgnVusmdM/lc66nIpiDFv+GFHRE55OhsIxr0s=;
 b=gKZbCM2Fv+Hym/I/x9agFy6kxqHeeFcLHJT1g5zZZcKlPHT7SFU1AHYFuswLl6XltdPmWZ7qN56kJluiAI8F0T0KYH9QdjtoI0z8H7+pH+ugFAL24j8JExdlW9/mQhpGDNO8HGjDsxzV2o7F3xfegXtJ7981YhST/Ii2ryx13D0=
Received: from SI2PR03MB5690.apcprd03.prod.outlook.com (2603:1096:4:15d::13)
 by JH0PR03MB7855.apcprd03.prod.outlook.com (2603:1096:990:2d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 21 Jan
 2026 06:23:44 +0000
Received: from SI2PR03MB5690.apcprd03.prod.outlook.com
 ([fe80::7361:3cf0:b441:7d0e]) by SI2PR03MB5690.apcprd03.prod.outlook.com
 ([fe80::7361:3cf0:b441:7d0e%2]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:23:44 +0000
From: =?utf-8?B?WmhpeW9uZyBUYW8gKOmZtuW/l+WLhyk=?= <Zhiyong.Tao@mediatek.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: Project_Global_Digits_Upstream_Group
	<Project_Global_Digits_Upstream_Group@mediatek.com>, "fred2599@gmail.com"
	<fred2599@gmail.com>, =?utf-8?B?WWVuY2hpYSBDaGVuICjpmbPlvaXlmIkp?=
	<Yenchia.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Vasanth Reddy
	<Vasanth.Reddy@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?TGlndW8gWmhhbmcgKOW8oOeri+WbvSk=?=
	<Liguo.Zhang@mediatek.com>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Thread-Topic: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Thread-Index: AQHcfey/SO6Kleh1dki/LWqHFZdmJbVE6yeAgBdV9YA=
Date: Wed, 21 Jan 2026 06:23:43 +0000
Message-ID: <434e34f05bb5f87b59402811012e3a2f56f2182e.camel@mediatek.com>
References: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
	 <20260105024103.2027085-2-zhiyong.tao@mediatek.com>
	 <2026010643-ladybug-tiring-7f3c@gregkh>
In-Reply-To: <2026010643-ladybug-tiring-7f3c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5690:EE_|JH0PR03MB7855:EE_
x-ms-office365-filtering-correlation-id: 914893fb-a8fd-4a95-3a56-08de58b5a096
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d0JoYm00TnJvemJaN05BanJ4eG5GcnVqYmxiSUxEWHRQN3ZYaHZ1ZElKcEFu?=
 =?utf-8?B?UUlldlp5b3h5MjlUVjVBTVhiQ2pJbEVyOXFzajBtazNUWHg2SlAzZXIzelQz?=
 =?utf-8?B?M0VnMWVKclRqWkNVdklLYXdFWVdZa0NSODRVbmRmTFlYdWRBZ0ViTmZ6cHJD?=
 =?utf-8?B?MFZMQWlVaUtCdE1JNG83Z2xvczJITEpCSUNlOWEzODQ4OXBRSWJrMDdqNWRY?=
 =?utf-8?B?UXZvTW9Yem1hSEw1MjlCMlZpK0d0VFZqTHdBZUJseWQ2c1cyVjQrUnA0eDhO?=
 =?utf-8?B?WFQ5alhLYk5Nc04yMW1RSmdBQzlwNzBBZW1uMWNxNi9QQWxtRnZ3UXMrd2JN?=
 =?utf-8?B?VjIrMVpmQUFhTW5KNzNnOXFRZkU2aDRnaW5DTEZyRlJtbzdCL01POXNKbXBn?=
 =?utf-8?B?cm5saEg0TnJOcnBwTUFyRXdxSWgxb2xsS3B0Y0hQNEpIYXJ4N2lld0dWOWZB?=
 =?utf-8?B?K3RDZ1c1Q29yQU1TZEpHaDlzWVUyS25IL0xsdnZNZVM4cWpuWCtOWjhjd2Fq?=
 =?utf-8?B?UnVzaHpVaytyUjhEaC9RejEyNnNEQ010MkJVYjdub1RBYUNxUFZkcG52bDVp?=
 =?utf-8?B?VFNvK09JZURHOTV1VURSU3Vaa29JVmNhaHJjSWFuTnFIMHRmY2lrY1RaaGRo?=
 =?utf-8?B?NHh1dExDTUltdWszMEdXRTRjUUljN0FSZExLSkMybXdYcndWc29TZC9Wd1p3?=
 =?utf-8?B?WWY0T1p0TTJiYWU5dXNoaXVhU0tCWHZEcFh2YjZRK2VaMHF0clV6MDZCYWtR?=
 =?utf-8?B?UmNxYnlvOUlxejRMVFJoblFENG9XdjR3dUFxMk1GVXNwUGV6S2F0VHlISDdT?=
 =?utf-8?B?TFdZNzJUNGo0VWpzR29JRXFqOUd1WTA2NGZMWERyVHdMRVNMcWJNVzJFcklk?=
 =?utf-8?B?aVdUSGZBVDNsMmF2Q2ozMjJVZHFDZ09wTUc5SVVCbUlwWG5xSFdjcjhzTmEx?=
 =?utf-8?B?dnVkSzNoOTlpWmQyUk80MmhHUU1YRytrMHd2dVJvUmQraVlqMG96VS8veUVP?=
 =?utf-8?B?dk9wU3ptRFdqekFjUjY2ajNoZCs3M1czSEduWUx6emtDdmNDUW9WWUp6dDY5?=
 =?utf-8?B?dTJNTVB1a0J4R1RwQllIS0p1Z0VuN1lPMWI2Y1NUdzRQSWxFSHl1T2x1djhv?=
 =?utf-8?B?RWp0NUx0MGgzNGJtTEhtT0FXZzVYVmJOQVQwUlVkd0hKTFNRYlAwKyttSm1U?=
 =?utf-8?B?dU55ZEhzRjBnVlpEeGNMM2ZzRGx2NVBrSG1tblhHUWRzbGhOWVJXWFdmTnZi?=
 =?utf-8?B?ZmQrZUhZSWxkVFpadWpZSFZoZ2tNdVd6ZWZYMXEwWUM1ZmJPNWE2bTAvc2lK?=
 =?utf-8?B?MVJEbkRzMllLY3hEYnpEYzFqb1ZmS2xOMFlwQ3V3MEtGTXJGazhHUS85Um1Y?=
 =?utf-8?B?TVh4aytCYjIzUk16Um9FMGVNMjlEMUJVTVNtWlZWRHVTdkZpOEplZHU5VS96?=
 =?utf-8?B?TEk1dW1CYWdzL0xhVjJudDBtRHAxbjJLRHJOa0FBZGJKS3lpL1lOb0M4eDVX?=
 =?utf-8?B?aXRaK0swd25NWTU3L1NxL2QxQmdtWXRYUVhsQXFHd280TGc4ZXFtUFRoZlp0?=
 =?utf-8?B?L0JRY3NqYWRlUFU3R09BSkFSM3UwcjRCTUZFOEtwVzBvUk9qU0p0RGRlUHJr?=
 =?utf-8?B?S3ZpRDhjTHdka3EvL3U2YzBtaHkwM0Zabk0rdWZoRFBlZjNRVEN1RHhPS0hz?=
 =?utf-8?B?ZGxwc29mTjRPeSt4WkVTK3gxRmh2UVdGRHhsQWVsQTU2UFhyWW9FN1U4VVQw?=
 =?utf-8?B?ZnFSNFpHNGV6REtNS2tZOC9hVkZHSWdRTmZ5V3hwcVlvV01ZUlArZnhObDJT?=
 =?utf-8?B?QXlDMitWS2sxZ2tkTmowck1MbTBodGoxelhKOTZVS1NaZUFUTlhBQkxhRjhW?=
 =?utf-8?B?VWxyaW5ENmJhVUUxZXE3MWF3enoxeHMzM2NSbkdVbW4zelpGZUhhK1Q1Qkp0?=
 =?utf-8?B?YnJaaGZCUWdFeFJ3MDlZR3NDNGdGY3AwRzNaUEk1dWxZYmUwb3plNWtwK2RQ?=
 =?utf-8?B?RXY3QXhQNCtFbjZpcUpuOUsrSFNmR1BLS3cva0F6ZGd0YlYzSXlGZnc5enlY?=
 =?utf-8?B?T1ltWHNSRVhydStzZkJpamk0OUh1SFFvNWc1ejNpMlRzbkU5cjUzU3JPaDFs?=
 =?utf-8?B?c3FqRDNLVmtoMGxVVkZhVjJiYm5XckpYa2R3Yk91ckI2LzYxaHZDOFJDL1Jy?=
 =?utf-8?Q?TiWx/MazIyoCZIFjNloFlRQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5690.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUJuM0ZkU3loNlVmVG1tZ29SMGRBK2pBcS83YWlyenZ6OVV2NitvU05UaVZT?=
 =?utf-8?B?MzhpeERRdVhJQnJtZzh3TWJWSElBbmFTd0NtYmU5bE5GT3JiSDlSM2tValla?=
 =?utf-8?B?NllzUS8yd2dxK1lOZzJSVTVIbVcya3RuK0hFQTV1UEhjNjBUN3V5RVlNMUlq?=
 =?utf-8?B?YUZJUk1xMGpnS3RiaVprRGhjelpJQ0NNVmdxci9jSHpLZWJRcHR1ZFdaK1JG?=
 =?utf-8?B?WWxJZVFNc1NPWlAyUlFCRGRsVmg0aWlsYUdvS0VXWkQ5Rkt4WmUvMlM3Z2lq?=
 =?utf-8?B?NFo2YlkwOTVBOHI3d1R2ZHJYUzk4MTM5T2Jzc1JZWHE4aHZXQnFOejEwRDBv?=
 =?utf-8?B?b2tIUld1eXEwcHltdWtFWjVNNkE4d3BFbUJpUlZZcDdHUnBuNDNFMmtGWU1W?=
 =?utf-8?B?enhpajliZ0VFMjIzMUh5ajhTTXFMSGg2QlZiNTg0Qk9YamhCZTVpcENkcTA0?=
 =?utf-8?B?RkN4T283aFNIb1NTNGoyc2o1U0pRM2JFZHQvYTZTT3RxMGZxR0ZpMWlyMmhy?=
 =?utf-8?B?YUJ5MVRxOS9seDBhR0pHbWZVUkdvVnQ3cTllQjhRVHFhOUdYbm80MUR0cVY4?=
 =?utf-8?B?cDNEOUFSZVlFVjNPd3h1NVdUU2RMU0tCSW9NZ0VMS1czd3JTWDhSZ1VNWmdB?=
 =?utf-8?B?WWVPMHZqODhmcHlscUtJNU9vcC9EVVdMdkVNSkxCSUhMaUJ6WC95U2xhcUMw?=
 =?utf-8?B?SWlKWFk1cG9iVXNvdmtzWGRYUjArRFJqa0x3cHF1akZJVjEzMUhMTG5wNlIx?=
 =?utf-8?B?RmhiSlA5bTBEcEdKSmJrTUsydWRrVkI4RER5QTZjZTF4VnV1N1pNTUh2WXps?=
 =?utf-8?B?c3NURHFYT2RTL21XVStUU1dpaTFiL0dVVHZ0dXRvZXVqSGVmeHhLT1dTTGpV?=
 =?utf-8?B?R0x5czZiKzRHMkpDclY3TXNOSEVnYXVwcXJRYzVxVjZxWkFhMk9BTlRzSERp?=
 =?utf-8?B?dlllZjk5TGZ6MGlXZEFnOVM4MXZZWlptNHloNWhiSTg0eXk5RWl2UDVNSDVF?=
 =?utf-8?B?bjB1UzdNYTVvaCtneGkwckRJMDFlazJyY0U3eTdUMGpDcTBtQ2o3dWZQa0RC?=
 =?utf-8?B?VENCWk4vNlZ6OCtmMEtqa2FvK1dhMmJUN0JZRmpQKzV2SWJKb3hMVmpuVm9y?=
 =?utf-8?B?MEFmSlJMdDJpNy83dkhNdlRZN1MwVXh4VFJWZWdmV2Vhd0RrQy84aUFaWjkr?=
 =?utf-8?B?RTJHUFV0aU9IZDNvVDl0L3hvVHdqaWZzeG1zekp6enBidXFoZ3lMSVQvd0Mw?=
 =?utf-8?B?RUcxaFI1WnB2bks4dnRlbTR0SEJhTStsdXVTMDlYNXFDRThMcDJ1SDJrK09m?=
 =?utf-8?B?OURJc2lOTUpEcUovc1lBZkwraW1XSWF5aWxLbDBaaGR1OU5nM2NIY3IvN24x?=
 =?utf-8?B?Y3FORUh6SmdaNGlxNVlWdkJhOUpleDViWXBKV2FNUW1GQkJBTUdKVEdkS1VR?=
 =?utf-8?B?WG0rZWRueGU1dDlvRFRrRDdUSWJNL1BmblZSLzVhQXZJYlFHaVBuQUk1M1pS?=
 =?utf-8?B?Y3JXTFE2Q3JBNmlZUzVxV2lHdTNlYjJXM2xnSFlRTFhnNUplSkV6aFFJMkJk?=
 =?utf-8?B?SWtycEtCRis5bXZSWVlwZ2JSMmpGTUZybDY4MHNwZlR5MWZ4YWxSZjJnMTI4?=
 =?utf-8?B?d3hVTzNlVUxLalJvVncvalNSTU5qa0RsckpqYmh5Zkk5MXF0RUU0VFA3Vmk0?=
 =?utf-8?B?WHFMTEhEb3pKZzhEUXFxUG1xVjVpM0F1VjZsWnFFWmJXaWRmVWRlNnRNVE1I?=
 =?utf-8?B?Zm5sNTBwNjNDRnRDL2NDUkgrcTM3VVRLZm9KRjFaWWovUHFmb3d0bVRqSmJU?=
 =?utf-8?B?VTZWVUtzNFRqUldtTVQvaXpIUkNpNzZYZ0I0NXpQM3dDMEFiNWNOc2IvN1Js?=
 =?utf-8?B?YnFzamxKZ3hzNUdMRHhwcGdRM1BOc3hEVlN0aG9aMEFZZDBMRWpmNm9sc29j?=
 =?utf-8?B?eWdMOUwrenFEV3RjOFZ4ZWNJWW0wY0MydXJ3cGZJYjdiVlFpcWlWYkpncE1k?=
 =?utf-8?B?N3VnRGxOWGZ1STVIZ3BZN3o1WHYwLzBzT0VkVDZGZ0NvWXZiOHA4ZjhiaXZG?=
 =?utf-8?B?VURVMlhKVERDcGYyb1UwdCtoT3k2cG9yS2pLTWFKdkw5Y3dmNVRVMVU0WnZj?=
 =?utf-8?B?WEtXZE10djhwSDNscmhyQ0tEYnVwdm1VWWk4Ny9GUTlla3dTVXNPazRlNGJD?=
 =?utf-8?B?cXhNbUZ5TlRFanRQYmFmNTcvM3l5ek40elA5OHY2OTFSWWx6TEpWcFJQQTV1?=
 =?utf-8?B?TE1CV3k0bEZPN0VNc2JIZ2ZpbmZEQjJKOFdSK3VPaFBpMnQyTTdHZTRzcVdJ?=
 =?utf-8?B?ZzVKS1dxL3pBUW1RSnhjWkdRZ0ExenZlT2Z0VFU3dkhzM3Bodk0vM3phNXNl?=
 =?utf-8?Q?PVoo6SZPFO6VkCV0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28340CC88D141A469A1558D6ACC0B2D2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5690.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914893fb-a8fd-4a95-3a56-08de58b5a096
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:23:43.8943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yVkrVD6Kh52N/SbZQXSWu/So4+J2IqShVnKLHvsIloa3IrovcjiwEFIKi8NDa+bO1ndrcGRfrLqkRdS43aHkdqz74tyH/dBYacLBQNsYcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7855
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_222355_188310_3A7B712F 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDExOjAyICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBN
b24sIEphbiAwNSwgMjAyNiBhdCAxMDozOTo1NUFNICswODAwLCBaaGl5b25nIFRhbyB3cm90ZToN
Cj4gPiBGcm9tOiAiWmhpeW9uZy5UYW8iIDx6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+DQo+ID4g
DQo+ID4gQWRkIEFDUEkgc3VwcG9ydCB0byA4MjUwX210ayBkcml2ZXIuIFRoaXMgbWFrZXMgaXQg
cG9zc2libGUgdG8NCj4gPiB1c2UgVUFSVCBvbiBBUk0tYmFzZWQgZGVza3RvcHMgd2l0aCBFREsy
IFVFRkkgZmlybXdhcmUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWWVuY2hpYSBDaGVuIDx5
ZW5jaGlhLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoaXlvbmcuVGFv
IDx6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL3R0eS9z
ZXJpYWwvODI1MC84MjUwX210ay5jIHwgMjMgKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4g
VGhpcyBpcyBhIHJlc2VuZCBvZiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgcmlnaHQ/wqAgT3IgZGlk
IHNvbWV0aGluZw0KPiBjaGFuZ2U/DQo+IA0KPiBjb25mdXNlZCwNCj4gDQo+IGdyZWcgay1oDQoN
Cj09PiBIaSBHcmVnLA0KWWVzLCBwcmV2aW91c2x5IFllbmNoaWEgQ2hlbiBoZWxwZWQgdG8gc2Vu
ZCBvdXQgYSB2ZXJzaW9uLiBDdXJyZW50bHksDQp0aGlzIHNvbHV0aW9uIGlzIHNwZWNpZmljYWxs
eSBmb3IgdGhlIEdCMTAgcHJvamVjdCBhbmQgd2FzIG1hZGUgdG8NCnN1cHBvcnQgV2luZG93cyBB
Q1BJIHNldHRpbmdzLiANCg0KSW4gYWN0dWFsIGFwcGxpY2F0aW9uIHNjZW5hcmlvcywgdGhlIGFw
ZG1hIGNsayB3aWxsIG5vdCBiZSB0dXJuZWQgb2ZmDQppbiBub3JtYWwgbW9kZS4gSXQgaXMgb25s
eSB0dXJuZWQgb2ZmIGluIHRoZSBTU1BNIG1pY3JvcHJvY2Vzc29yIGFmdGVyDQplbnRlcmluZyBz
dGFuZGJ5LCBhbmQgd2hlbiByZXN1bWluZywgdGhlIGFwZG1hIGNsayBpcyByZS1lbmFibGVkIGJ5
DQpTU1BNLg0KDQpBcyBmb3Igb3RoZXIgTGludXggcHJvamVjdHMsIGFwZG1hIHN0aWxsIHVzZXMg
dGhlIERUUyBub2RlLg0KDQpUaGFua3MNCg0K


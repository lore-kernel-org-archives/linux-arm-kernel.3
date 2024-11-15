Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0253BD68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt2tAF2F6Mn29R/zZCSwlOyKfBCCBrWwqK1mXM1jCBU=; b=xkDKBv7D9vmAdeLbVbPiGJM0yu
	g59ehTP4mchlk78ZeLfMZHbC9W9L9b6Ae3pMhSPoPCDI2cpBBj9h6wDq0OmGs/IZeOO5sR9VLYV8N
	3ZcvTT2AUXGfSpOUUb+y63mBrtAv4zL+3oZzQ4i4sXvQ0MHF1XA3NfS/uAUyrM2SNVqdMqF2ddmcb
	h7L4XurCc9vC3jRDcgNSZYIxR8w/lhY5hhdqGAjC7qfiv1ENA2EEpMYaQMI2DGCldBrEYGi4aRmWM
	H8Gjiz3BbX98b+gJgUdF64wl6mI8+L3oZi43vQvogxLLR+Ev7qmszd2FlH+cQyCaoNlHNNy7ExPbU
	D9xrcyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxot-000000034lh-05kz;
	Fri, 15 Nov 2024 15:01:11 +0000
Received: from mx07-0063e101.pphosted.com ([205.220.184.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxmA-0000000346W-224j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:58:24 +0000
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFEpvmY003841;
	Fri, 15 Nov 2024 14:58:11 GMT
Received: from pnzpr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17011024.outbound.protection.outlook.com [40.93.132.24])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 42uwr1sv90-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 14:58:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMC14UP3BY18i7fBXZXkWDJM425fhEv2TX8QsuBmkHD9JYtXoOsx5YFAiM/fsDeBr7ibawT4WG/tALQZjDV6J3/43BP//pU+2ogPIlBV5rib4/KrtZZcQf05qpezBwjn+bWSWTFd7n2iTYNv2KV4iYNKswcvdERd6B1qqY2lbrSaXmEdZbS8yuaEAisoWSHXfa7laXmomBT1WrGvxpNFVTAEY4gKb+5Oof7AMGdVsKk2nAGr8/plcrU/Yt5ORyt5PiHGS2wJbsje9mBLRZeboT35thRQoDjpqRI5XPUlpyfj4xZ2Jq/KIYAaB3Se4W7dC5LRMFsKi6km8uYjgWBBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt2tAF2F6Mn29R/zZCSwlOyKfBCCBrWwqK1mXM1jCBU=;
 b=INwbQtj2ZWOn5lMyEZ9pk35heKnW+SV4Snd93cVSTY6PK253mqtFCLQd1vpt366qz1zt3mOmGE2jpmbOXpvbSvTQkRDkYzxq6chuVb+k3m75fiBvD9kuPpfpzLt6xMz1D9Ihm6TBjs6EjVdLB+PU7kSPdrXWr3xE94nwK6tDrXCmLZ2skstpkS9qCjGPqx2xMiDhMDGlX51P7ffB3LuKhL5z9B8EzD02r8qGTL4LkaUWqDo+A+0664Ym6z3YstDqgpclU8Ii+S5/TxAnBzq1NeEq3YySBuYsaFWzmNh1CbYsKCpRcFU06/0rKxTU/wLvRn4YwqI7NQLhG2suNc8r9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt2tAF2F6Mn29R/zZCSwlOyKfBCCBrWwqK1mXM1jCBU=;
 b=n4ZDlSM4dQRhajmiJaQVjV2pQxPLoIINeODCR0aJ+eD14ljl3cUsXeAXIZW0qOvi8hGrO1QsQvT8cMSq7FeQPf4ucf7oj0zF4Kf3Rbu5VPaCSjLw3UvxQUg/mw6TAGyop2Lh6hdY4aXR/23tGlumzahKeMob0JQdia3dRPY/+dM=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN3PR01MB9551.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 14:58:04 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 14:58:04 +0000
From: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "soc@lists.linux.dev"
	<soc@lists.linux.dev>
Subject: [PATCH v5 5/6] arm64: defconfig: Enable Blaize BLZP1600 platform
Thread-Topic: [PATCH v5 5/6] arm64: defconfig: Enable Blaize BLZP1600 platform
Thread-Index: AQHbN27FhKl2Q5Izw0itWuUuiDQrTA==
Date: Fri, 15 Nov 2024 14:58:04 +0000
Message-ID: <20241115-blaize-blzp1600_init_board_support-v5-5-c09094e63dc5@blaize.com>
References: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
In-Reply-To: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|PN3PR01MB9551:EE_
x-ms-office365-filtering-correlation-id: dbc035e2-bbc4-43f3-02df-08dd0585e86a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1RCdmlOQWd0Nnd1MmdmNEVvY3NpNUN5RHJhVk9sMUR6WkkzYXpRYzdBaVdL?=
 =?utf-8?B?dEk5cUlRNGFFQjR3S2RxMXd2eU5LK0ozeDNGVmptakd2dmE1N1JBdTh0a1lY?=
 =?utf-8?B?T0dzK1lMZWpEZEZ2dlVLKzZOcklSL2hHRlhVendiL2kzYnVDZzhQQVRuS0hu?=
 =?utf-8?B?TCtBaC9KUTdLSFJ2cWF4VEhWcGdXL1RQaEhrY1lLWnFhZTF2VTdKNGtHWWNX?=
 =?utf-8?B?TXpERHpaWmVBYmFFZHB4SWpDRW1wS29scEFiUkkxVEs2MktPby83TUtoOTRU?=
 =?utf-8?B?R2l1WnpBZ29hNFZqV1lRK0oyQmFFYms0c2xIdDkzZUo4c2ZXcVJISUQ1VDR2?=
 =?utf-8?B?MHg5VzNlREpPVWlkdUVuc2Y5RVVkQ3dtVzdWZmw0azBIOTByS0lRTGFmMEI5?=
 =?utf-8?B?TWo1cm5NYkV5YlBPbGJETWlmUG5yZWFDOXBieEp6NW50V0F4UWUrNE8xR2Mw?=
 =?utf-8?B?L1N4R0hHODlWc2FUODhGR2ZmUjg1ZmVIREJCWWh6QU4vUkM4SDI5cWM3a1Zu?=
 =?utf-8?B?QkFXQnVXZndsU3E0L01pQTU5d2FuWDNqc3QrL1YvK21BYThPYTBVbUU4SmZO?=
 =?utf-8?B?bE9EM1N1Ui9nUlFUKzBPdWduc1pQaVNleGZFa3ZNdGVMM3hPdkVsTXVFWXps?=
 =?utf-8?B?d2ZPbHFOOVJRV01ra0VOa21POWpiSFFLY3Z0eXBLbnl6V2FYR2ZXek1XR3ZD?=
 =?utf-8?B?MWR3dm5UNVFLWnVmMU9lSndwNUtWaExKZlNDUnIwaFJ2WjRXYzlPUmJNNEpD?=
 =?utf-8?B?NnF2a0wyeHgxM0pNS1RwM2Y2NE91Rlg2d3FlTkJjcmtkQ3E1SlpiTTVkUHJM?=
 =?utf-8?B?SmtuaW1OMndnYmxZeEJCaU43QkYzQTcyODhCMit1NCtYR1d6Y2ZZYWZvVm93?=
 =?utf-8?B?QzR0VzhIRE9xTFVHRm9NYmlLZ2t3TkYzQkRuSVNVbjcrOXJpWWpTZ1E1eEth?=
 =?utf-8?B?NDdsN2Rqa25ZVE4zLzFSL2ZHMXRZbC9GanQrMy9sR0kxb29YTDZMbVdEbHRn?=
 =?utf-8?B?YVNoUDFFOWNXNGV1SFI1R0IwVi9rZXNaQXNRUzFRRUMxUDlIMHdUc09jQ2J1?=
 =?utf-8?B?QTlPMDAraVp1cm1WRWhRL3lzbVhRWk9UZUc4cDgvcVJud093d2hoeTdPV2Yy?=
 =?utf-8?B?SFA5Mlh4YWYzRnRjUmo2NnRVMzVBQ2RIeW9udzdia1QvUlJkWHdBdThLT2ds?=
 =?utf-8?B?UncwamNCK3F1a1JtejhzblkzMy9VZHk0ajlnSnc3RGFvc28xdWthbDBYYWh2?=
 =?utf-8?B?ZkFYQThRTmdjSGNXcXpPMGxxVXBoVzI2SytuUnd2azNTRFJtMUdQci9JUllN?=
 =?utf-8?B?d1lxbjRmWUNDMk56dHNRcVFDOThhS2dDMWRpWUlFK05HNUM3QlpKa2RyVTY0?=
 =?utf-8?B?WFJSMFMxQWV3TUtOdUZvN2k0NnZkN1hISlVraWYzektyc05EQlpEK09nUlV4?=
 =?utf-8?B?dmoralA3QUFISzRIVk83Uzl2c2RYVnJkWXFhQlpnREpqZ2JoWXJnN29DbU1U?=
 =?utf-8?B?RFk3aGZ3RmxOY2ZxRjBuTnNIdGNYTjR4NHdzcVBTbEFhdDVGMGlOdFVVWkFa?=
 =?utf-8?B?R1d3L1BvNzlzSmNrMkhzRFBEVzR6TjVZMVUzd0pTUW41M0Jicjkzbnh2T3Jv?=
 =?utf-8?B?cjV3UTVWNGwyTGthcjBxSWR0QkhFMUh1cUE4MXVGQWd4eUpOMi85cmxOdmEr?=
 =?utf-8?B?bmRpN0d4TnQyMjQwb21DRjMvamVSYTJnckZmYXB1aTNzYlZXcktNeUFPWnVx?=
 =?utf-8?B?SzN6L2t3VEpka1A1dGY0RHpWenpUdWF4cVI5bnJGeWt3eEZWM0xIUkNTb28z?=
 =?utf-8?B?d3dGK0tiQXlCQ2R0WHhLYTZ3emFTNGR2U2RzcTVGU3I3czQydGtOMWlmaFRj?=
 =?utf-8?Q?jiV38FjMMPd5x?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGNBTDF1WFJCWWdUbEFTbEtySllpcHVva2czVFlJeVVnMUZwQytBRWdIZUhK?=
 =?utf-8?B?ZE5ZOG40eHRweUZGOVQ5T01JRUhsdnMvaXdBSmxkY3FsQXhwaGY4bEd2eXRE?=
 =?utf-8?B?K3pRQ0hINkczeFdUWDZ4SFAxYjg2QTlkbVNHc2k4V2ZTN0hJMjZXUDFzTlZp?=
 =?utf-8?B?UjBSQWFHR0NSN2ZjN1MxUVlyM3Zwelc4ZFlPeHBmQjd1Z1QzS1l2Wkg2Z2Jq?=
 =?utf-8?B?SHMxV3FCUVF3NHg3N2FyNDZucjlUdUdITTJTbDNFaS9BZm9CRUdQTGkzdFZK?=
 =?utf-8?B?ZWw5OXNNMzBEUS8vbG54c1NrMmhqS3UweDRBREZNcmJ0d3RiNk1xb3hLVDYv?=
 =?utf-8?B?RDdaRHdyWEp6eW1FbjIybE5jdzJjTVhnK0MxbVRoZUUyakt3WnMveCtqZ20w?=
 =?utf-8?B?R1N0WmtVR1JGak82UjY2OVluMDlkNGQwaUxiZVNld2t4bUQ2NlJEN2V1Sk5P?=
 =?utf-8?B?a3BURmN4Vy9meWg4OG9zS0JIZXlGMkpPR3k2Y3dVYnNoc2YvTkxtcTBDM0x6?=
 =?utf-8?B?WWR3amp5NVFyUWhLVkV4QWRUWGdlWnhDT1ZZWWpFWEcrMlVacW9uVDcvNENY?=
 =?utf-8?B?WTh0dFZWdG5PL0dJcENQQjhBbW9kVjNua1NpUXUwMmlKSDM2bmRGaGc0QkQr?=
 =?utf-8?B?ZjVPNXdFb0FnZXZnMy9kbHJkbmFVRk9yenVyU3M2cFJlaml4V2N2c2ZzaktI?=
 =?utf-8?B?dHF2TS9qWWxhcU8xMmljSjlmSGROZytkbFN2dWU5UHRnVW1ZYUU2MVlsMGRM?=
 =?utf-8?B?QTAxSWc5Yk12RjVDaE9NdDZPa0F6a2FtakxneHo0UXpxS3ZBRkVqK3laa1RS?=
 =?utf-8?B?WTdIMXFQOVJaZjBDTmlOR25WU0I1K2FJQmFxUHJVNm04cWZLaXIwcGUzZnR6?=
 =?utf-8?B?MWs1NXFuSnFDTFZpMFdaVElsUU9wNHc1dzhRNzB1clc2eE1sNnRQeS8wdjVh?=
 =?utf-8?B?WDFFa2RDU3lQMVc4SXZ4R1VIUVNPZEJLbnlzdmFCSmN1M1VwWUhxNVlhZ045?=
 =?utf-8?B?VXFsWVMyTGJESXBPaDZacjFCS01ldHJmR0ZRd1NjTmNyN0lMY2FRTmF6ckRQ?=
 =?utf-8?B?VSsrbnlubTMwc2dCSXVNRlVEMUdDY1YwZUJUNUphUDhHQ1BzWDNXT3FTTGJx?=
 =?utf-8?B?L2ppYzNzTnMvZHZNYUlIRXlLZWwvWkcxUWxoSlVGV1hOTkdJWStKU2E5dms5?=
 =?utf-8?B?QmU2cmNuUUhSOStPRXo1dXVXWU5jOUx5Y3BFRHVsQU4zeWNldHJRK2Uyb1Zt?=
 =?utf-8?B?UWtHK1lnclpUdTVWTW1rbS9WcDBLYlJWb2FBdzUxZUt0QWVDVzkxTldmVWtk?=
 =?utf-8?B?VjVjVGlXTVlzcEZuK0pxYmFacTEyNXpRY3Y4ZkhVUFBQT2dGTjFMek5WSW0v?=
 =?utf-8?B?bFBpZjNGaEVsUWdTYVE0RnhWYTFFMS85eW9oUmFaMWtXeFljWWRuRVpRRG52?=
 =?utf-8?B?OGRvYlVGYzBtbEhEa2FJTjNnRVhjU3B3OUVPbHhIbnppR0xPWXdxRUl0bmhv?=
 =?utf-8?B?b0hwVU1YMFBPbi9Sa1F0NGRIR1dGV3hBRGVySEwxekxicXk5VVVBcUl3bWlU?=
 =?utf-8?B?N09JMXVlNUFGUjVacnF2cFIwRzlQbzQwa2RtbHlaM3czQ1ZUVUpaNDZPdW5U?=
 =?utf-8?B?ZU1nQ2Jma0x1Z3ZiZXVncnF1T3pDcTNpeUU0UnpxRnhvYUMxOTIycUUrcXZD?=
 =?utf-8?B?bGdicjBQSlpIbmxQZCtQejRxUFZWdEtuR2oxa3podWhkaWQ3ZThDODVicFFF?=
 =?utf-8?B?UUx5Q3daOEtDcVp3MlRpbzhDeGNKY01JRzlQOEJXTTNNWHNmK1F0YTVMY0tw?=
 =?utf-8?B?Mmw2R1doN2VVRjFmSm5ITll4WWVwM0hCR3d2MzM5OFI3ZnJVbjVjM3hEQVph?=
 =?utf-8?B?ZFgwT2RTYUk2T2xrRFdidW9rWkx3OE10QlFEMVdOckVUTUFFZ2hmandZV2JL?=
 =?utf-8?B?M0NiK2drcTBUQ1g5cUNFVVY4alEvMU5wRFJYMzZUaVdQQWlTTE9oSWVYWjBi?=
 =?utf-8?B?NWlVbUp2Rm1YZkRsTGhaYzRadU1WSWdpUW1CM0VEUUNXbkFFQnR2Y1Z3dktq?=
 =?utf-8?B?bVFmNllSdE5JMDB1cTNpVW41S1FVOUxMQlRjS3ZoUGd1UTJXcnRtWXRQYW5I?=
 =?utf-8?B?R0NSWHZyRnNXQkx0N0ZvUzl0YitZbEVxUFVIUGxzUFo2LzF2TTN3clV6T0hw?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9236A13D4CCB1840BA283433BE0CA84E@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc035e2-bbc4-43f3-02df-08dd0585e86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 14:58:04.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U57ElxalgAf3i5NvUVMd3j46hfPf3AQa0oDasB9T749iDBazn3w5kHHQNrqwd9IfvluNjFuN3nzpe7+es+0WkMdCbfaznIWlj8FEIzWTHRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9551
X-Proofpoint-ORIG-GUID: SVIHUIXqbrB9pTBgjbHfPs0MIFeHzGfd
X-Proofpoint-GUID: SVIHUIXqbrB9pTBgjbHfPs0MIFeHzGfd
X-Authority-Analysis: v=2.4 cv=YMvNygGx c=1 sm=1 tr=0 ts=67376183 cx=c_pps a=RRW9qgVLUv3Tpt3ACdNssw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=Ts3c6zwUluyeuPI89lAA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Reason: orgsafe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_065822_827883_9AACBDAC 
X-CRM114-Status: GOOD (  11.92  )
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

RW5hYmxlIEFSQ0hfQkxBSVpFIHRvIHN1cHBvcnQgdGhlIEJMWlAxNjAwIFNvQyBhbmQgdGhlIENC
Mg0KZGV2ZWxvcG1lbnQgYm9hcmQuDQoNClNpZ25lZC1vZmYtYnk6IE5pa29sYW9zIFBhc2Fsb3Vr
b3MgPG5pa29sYW9zLnBhc2Fsb3Vrb3NAYmxhaXplLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvY29u
Zmlncy9kZWZjb25maWcgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0K
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2Nv
bmZpZ3MvZGVmY29uZmlnDQppbmRleCA1ZmRiZmVhN2E1YjI5NWM0NTY5ZjM0NzczMzk0ZmZlNmVk
YTc3OGU5Li40OTIxNjY5Zjg5YWUwYTg5ZTBjMTQ4OWEyYTQzNTliZTk2OThlNWEyIDEwMDY0NA0K
LS0tIGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KKysrIGIvYXJjaC9hcm02NC9jb25m
aWdzL2RlZmNvbmZpZw0KQEAgLTQ0LDYgKzQ0LDcgQEAgQ09ORklHX0FSQ0hfQkNNX0lQUk9DPXkN
CiBDT05GSUdfQVJDSF9CQ01CQ0E9eQ0KIENPTkZJR19BUkNIX0JSQ01TVEI9eQ0KIENPTkZJR19B
UkNIX0JFUkxJTj15DQorQ09ORklHX0FSQ0hfQkxBSVpFPXkNCiBDT05GSUdfQVJDSF9FWFlOT1M9
eQ0KIENPTkZJR19BUkNIX1NQQVJYNT15DQogQ09ORklHX0FSQ0hfSzM9eQ0KDQotLSANCjIuNDMu
MA0KDQo=


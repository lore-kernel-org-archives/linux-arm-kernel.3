Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CECDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+7YhoW9TE5jEZByvqe8GIS2QLULVfIBSI0Ij6H/Sfw=; b=Lqke27R/EVtCjzYvW7VvCAsItK
	Xf3ujdGrLh2utHbqSuKg2ra+vhJ1QXzUQ6sGPKwGpEnxPwrTJHLj85oLNPk6enSSP0JBw4vt5eXKb
	enGB/CCvGqll7XX281zfPl7oIhUFys6FZ8HSucATJWFPy//6b7s4NCsbO+FNHCyqkIrFNhq8ZnNaW
	MjWHW11go3GTRh9+UGProbQJO2a3jxxgTro/hROs8d1Vx91kiteeUJk01Vep3DnoXb0b6JFA8bSEC
	SYn1rlirFLc7HOskgo/m6azo2KjK7Qj8InnoWAGVL+3WSu8jPnfplyrcuvEQ6n47CVWHsJfyz7Sf8
	O0SBTe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBa5-00000006prO-2VaA;
	Wed, 10 Jun 2026 05:34:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBa3-00000006pqT-0sUj;
	Wed, 10 Jun 2026 05:34:24 +0000
X-UUID: 06d6d102648e11f1acbe4559397dec65-20260609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=h+7YhoW9TE5jEZByvqe8GIS2QLULVfIBSI0Ij6H/Sfw=;
	b=HsbVZVibRlvAnxpylf7bbAw/EFznh8ulGyc/wAhfSf8aaWyf/OPmuazeiI9CG2+IzSNvMb/NTAz2lNK1c6nLVmH6sB9PEHoHD/K2rI2G4dCymXONnk1BkEY314HsOSaqo1om/eFm21fwBPv40MlzipQ01ZEFqXhbvi0oRDlZh40=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:923c2b2d-0ee8-4c45-a198-41670926c64a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:dac19930-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 06d6d102648e11f1acbe4559397dec65-20260609
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 904158598; Tue, 09 Jun 2026 22:34:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Jun 2026 13:34:16 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Jun 2026 13:34:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo04MyGhEEq8fYo+mFcq3Me9vjWXPEy+ZRWHau5KDWed9Bt2TLluw+ZC6dAQq4zk0h4sKjiP32qpPxXsx489Vcy4ngicqIG3nmF6WD5DxGJmZ3pjmEm/RrsHfstDeBw4L4l9PsvTEXHHovEaFirrvE6jkf04kiEg6mZTW92JnE4v4l3RLg4mrS/hLz9qohwWwwAIOk0LR7Xjo9G7VwcIgSr5/uPD2XN6AIjvlp8nLwJHJr/0a38kI3jYwKbmjPz4m2HueC+phKxt/xY4WHfTRqm7gLZj6zUi15HfiS9z4LU8f6XosFrBtuJirF/rl4suH7mAr8VmGBfcolfapGc6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+7YhoW9TE5jEZByvqe8GIS2QLULVfIBSI0Ij6H/Sfw=;
 b=viMgvwA4Vtmbb+bIsK/SJCi1nPYePPbiAq9bUqkmVwbopvef4HS9ksFG/npdc4d4awJ88K0YJt5MUUkuX2mhYg1CuK00zo8+GWpnXSmAHUTFlOUzVZArX+TKG+5zEo0EHoA9wlWj0F8n+QqBItZj2wwMIP/3wg3poE0VKRjcJgix29QxyV410T1irDFebfcmesL9TjHHH9QCA5NxcVv3YvBfQAJFeYX6CGXR2GUChFofqd/6NWYxpavFFOjuzcVcX2+r1s7QAagrAUPY/cwsiXTRTVqKS7uwCx6d9Onp0weQF31iaPwZkCVBLNoRTu0r+Wx8UZAgFdUKN69bs/48DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+7YhoW9TE5jEZByvqe8GIS2QLULVfIBSI0Ij6H/Sfw=;
 b=WUBQf4bCaw9BNCNWS7qWZ6gNnQh4ldC7B3amtoS+KL4fpyOnuY5SePnzUEFZHLgOKhsiG3ZQraIP/sjJIUUxlHij40l5L3f5cZLLHA7TMYiQ5l/Be5x2Kj6Ez8mcAT8jYXEB992cgt77Ch8udU1mLMcE54b0/rqXWFUSfi0Vuao=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by TYNPR03MB10250.apcprd03.prod.outlook.com (2603:1096:405:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 05:34:13 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 05:34:13 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
	=?utf-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "bvanassche@acm.org" <bvanassche@acm.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
	=?utf-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?=
	<Alice.Chao@mediatek.com>
Subject: Re: [PATCH 2/2] ufs: mediatek: Implement get_hba_nortt callback for
 RTT capability
Thread-Topic: [PATCH 2/2] ufs: mediatek: Implement get_hba_nortt callback for
 RTT capability
Thread-Index: AQHc9/xLQSvNF7liEEiBLwm8hGNt1LY3RZAA
Date: Wed, 10 Jun 2026 05:34:13 +0000
Message-ID: <680b0c845682dced056e7e6b3bfee14cb0c959c6.camel@mediatek.com>
References: <20260609103856.676222-1-ed.tsai@mediatek.com>
	 <20260609103856.676222-3-ed.tsai@mediatek.com>
In-Reply-To: <20260609103856.676222-3-ed.tsai@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|TYNPR03MB10250:EE_
x-ms-office365-filtering-correlation-id: 72e76bc0-8ba4-434c-ccdd-08dec6b1e7d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: mtLKaYG4ew8iha0keeeln0nZZAH05BDyCvDcNvs49H1VIbDd9TajSy0+vMByCaBG+ozBqgRKNolV7/jWnmPah+r5bdSVX+LIxt8sLoM1gs/76C/bk5h+AT6znTS2x140DEuU6HFSnINHNYZFXqHn2fR5WwV+Gk0+17EtXhjjhG3WFVO0kBtLqmeG+pRpE38/Mcd+sX4HZAEfEJmDO2bFQcH6EXsBijPWG5ZW3lnRdhf/lpptWfxmg+4Vk207CiPNSaizKvwOQ/TMklHsV2pTghHKbDT10YPPm47UtC7OBopXdh0MGC15oco9E+VwOhc3ewZpIZ1vw2nhTO21rmE1RtkX3VK0iESUnGGlBaFoRwf4u0F3c9rIvYSjqSJzAA7eZ9r5LTDXAxrEtbXi6tcN6yBLuuBPcy7qe0ggvIwyab3XPERMVs/NdwHm+b7rJ7UbZYdL8B4T08e2I2ElO3kmmWGqzwLTHGzolBw4bxFqMz/5wb14OeMYbEAbTE2ueS4MqQ/s2rHHgRa8a273OQ7fNpWf0bNYobBShzYYnMIsPmgoeXfPdT/DZwqVRe4E9KxUxeIRKxMOvel0s6RuAuelI8AF9gZMPPmthfeOEEQDnGHcFvd7LYRVDhzX8/IbKzUxJQn8LW4WsFJ34QKbBYlzwpy0olClgYeanhJxPQFIgWy7SvC0DOE766+C9OM3hc+8sISDeNmdjFJlQNYlXQa/bVbkHtQUKBmDRLDJfZ6JYxsH5Iu7UOJ8JiCgNFUA7/Y2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3EycEdOb1MrRWV6NTBsR2xqbkVSWDJ5TzdJbzd1bWUzUlBzc01jNThIYjlC?=
 =?utf-8?B?cjdKQ0dHY0ZtMkFMU1Nwa3NYeEFLVno5NW5RMDExVks1ZFZkUWhsbEQxZ2Rh?=
 =?utf-8?B?dW9wZm53UE1hR1JCNFFlTWdBYkU0N1YyemNTMFJqcDNGNUR4bEJlRVFYa2JW?=
 =?utf-8?B?SGtlOC9Cekh5Q3RTWitBQm1USXpRa3VwbFYvb0NLcVo0bkZXNTBwWWpiM0Nt?=
 =?utf-8?B?V0c3NU15TlFMNDVoek9paStIQzdVd0g3QTkvZ29COUwwQ1d5NnBrc2QrU0FD?=
 =?utf-8?B?S3UzaTVqSWJJZ1NDbHpyVmFWQTVqajl5QVNYcm1adDhEZVFhNG9YQVl0Nkhx?=
 =?utf-8?B?SzJQODhwZHdKM0VvN3EzZnEvU2ZuQ1BJZWV3Z0VtNXlHUldpcEFHK3ZQU0Jz?=
 =?utf-8?B?M2w4Z0RiQ3lrMUJvRWF5VFZ0ZG9CZnEyaDZtc0RlNjE4RTN1V2RzNDFjUlBu?=
 =?utf-8?B?UUdXbldrYXA2cnp1bmk3VHEwRjlPOTI3YjVrZVE1OTRJdzV2MkYzTXVnb3Qw?=
 =?utf-8?B?cDI3MjFQZGlUVHYyTngxUzA5cGd4QXBtUFJVZE1tVVpmUDdMeVNqWXVsNlpl?=
 =?utf-8?B?VEpGR0h4RDVRcWtaNFlBNWlUM0tKUmYyeFhzS0J2ajcxZHh6U2ptVlAvRUY1?=
 =?utf-8?B?WitpS1R5OFJLSEtOSys1aENtN0lFQ0xWTXl6ZUFIaTRpT29Cc3hZN052TlNx?=
 =?utf-8?B?R2NKUW1ocWRMdnlLVkg2MVI0d3MwRjhqZ0lpMzFZRjM2VjE2S0J4dUgyOW9E?=
 =?utf-8?B?WEg4L1Q2TmxmRG9KeFBqWlZKUG0zQk56UDNmNFkvUCtTbG9YV1pVbDRzMTk1?=
 =?utf-8?B?Q0VxNjFuZEcyTlVjWlR3VjNPREpMVnA0aTR6VTBPUndCRFNqLzZpeFlVZlBN?=
 =?utf-8?B?bUQ5Ny9sTnRmMzRhclNYVzNzUkZRRnRLT0Z0alJNbEZRKytUN2Z3bzF3ZlUv?=
 =?utf-8?B?UVdhckpkdlIzZVpTWTNyTnJOaXBNV25adTlhQnNxZ0FVZUErVGVUSktjT2tC?=
 =?utf-8?B?L2hhN1dNMHhGbDdyYWNsdE8za3lkeEkzNFhjMloxVTkrc2pxU01RaHRIWi9w?=
 =?utf-8?B?dGRuMC9xZlJlREo3VlVNQU9ZVFdyM3hPait1ZWg4dCswREF5bVNKWDZ6bnZD?=
 =?utf-8?B?ckZ3T1ZvK0pRWEpDRGtjTk5xbDFZN1hIRVJmSTVBSkdRMVlRb3l0d2Vnd3Ir?=
 =?utf-8?B?YmpUSkh1NWdFN3g1QW84ZDNBdHg3QWtqMTYzWDNEWHBrNW8zMCs4NkUrbnUr?=
 =?utf-8?B?Q09NeUFveTQ2Z3d2clc4MzNUUUtpa256dUJUWjFVVFFOSU9xZnl1QWY1Sm1T?=
 =?utf-8?B?UTRub1FDaE12M0dyT09lNS82TTJRYlc1dDV5T21BdENRU2o2Nmo3TEdzbnMx?=
 =?utf-8?B?MUFYTDRzVG5DR1dCT2x0cE0ycXlqUTc4WTA5ZFlQbE02b2VBOG9EL0Ryc1lr?=
 =?utf-8?B?RmVzOTBiR1BhZnFLY2xiZEVaTENscDhDMEJnaFk2UzZPaWJkUVVzbHZpWXlZ?=
 =?utf-8?B?ZlR0NFZ2cGRESlBsVzBHQnhYM0VFWGtGQzVpZUhOU3VwTDNqM0VIZEg1NS9E?=
 =?utf-8?B?SWp1S2M2ak5ybWg2MU10TWdka0prVWdsZCtSelZVdkF0L1l5UkVUb0dUT05P?=
 =?utf-8?B?OGRvc0daVUZRRk5nMXBPalJKYXk5ejRDOHQ0OTBkRktsd3NDK1RRNlJoaVNR?=
 =?utf-8?B?MW1VeXZZTEl5ajdqMmllUlZ2VkwzY3hwenllWmwyZXg4YzRtQXJBdGJzSjlo?=
 =?utf-8?B?UnVyT1JrRUgvdm9CWmt0WDNDNHBMU2htbXNJa0YweDNWdGsxdUd6VzhMZWJL?=
 =?utf-8?B?dGJ1SnlEZURnbTA0aHdZNHF1a1hUWEVzZmtsVjhHQ3ZkcEwwUW9GOUF1WHUr?=
 =?utf-8?B?Wnh0cmliaTczQUh1eHhlTGlpaGRDMzZPNFRzTThVQVNZTktQZXphZWprWDZx?=
 =?utf-8?B?VEY0OVQxNVhrU1lHUlczS1dzaHM1bXZlaGp0QlhPdzgwUzJva284RmcvZGJr?=
 =?utf-8?B?azhzSFhlQnVrWWE4SGtLNjJhQ1RGZHVQbVE0cVZ5T3pDSXMwSUlsSFVSRlRK?=
 =?utf-8?B?UVp4OUs5WndPaS9DbzlMeFlIbDIzZ3MzOXJvRzBCRVl1QU5vdU9uQXVHOUlK?=
 =?utf-8?B?R2JzZ3J3dTZocFhpMWRWNmJOZkRkWDdZOVVjaVBuZjhKdmV5QzRkblM0OGo4?=
 =?utf-8?B?bkNqY1pWMStkWWtUMkllbFppTksyZFdXd0x1emZjVWExS0ZNMUlLQjlWYllk?=
 =?utf-8?B?cjNYUUxUMXFobWZIUDZXbHJVY0FCbVYrRStER25rNGlmQm42RHNaMVl5bm1Q?=
 =?utf-8?B?WVZkQmlrdHVkVmlKTURDZEpOY2lLdzYwZnRxbCt1V1FhbWFlRkRtL20zc2h5?=
 =?utf-8?Q?ROo1Sj4ov4izMm2E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEBC2416BD83A343850822331DFE6298@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AYyBdyjH1fdNVGy0XbyCVuBhXMdIR8ryhypKu5WPMNfh90H5wulafTvSg0bZuGN0Bn6i1jvh359WLPR1kaWb8lAsBGKGutgot3+P7WYdQ3doabzIcnF0SMyXkA30V0j4PDQQ3DIwkwR+eAlSsovWNOrrCxn2L9R0Hs8GNo7V0i3+O3YgU9NLVmXne/Hfgbe84xzWGI++9HYgrX1W2XoekwiGeskhRK9zQrzIvzazLsZDLTXhsno05SZQpXi6CenMlhWzIpCJB8NWxSIhkEaPI8qQojHG3q6cxHqATlayfcvm+kz9OJBsEFbUhneMbnMV/TvFrjrWL6MQv3Ijv/ekHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e76bc0-8ba4-434c-ccdd-08dec6b1e7d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 05:34:13.4193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3xZ0EOudbUjA/ypNyDnI6aQOwehZAXYg/noL5dSdLgDJs2AYtrAG1BI1MnQAvhn8PNLedi1f174RqjvhvtO5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB10250
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223423_250976_FF2E9C8A 
X-CRM114-Status: GOOD (  13.75  )
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

T24gVHVlLCAyMDI2LTA2LTA5IGF0IDE4OjM4ICswODAwLCBlZC50c2FpQG1lZGlhdGVrLmNvbSB3
cm90ZToNCj4gRnJvbTogRWQgVHNhaSA8ZWQudHNhaUBtZWRpYXRlay5jb20+DQo+IA0KPiBJbXBs
ZW1lbnQgdGhlIGdldF9oYmFfbm9ydHQgY2FsbGJhY2sgdG8gaGFuZGxlIHBsYXRmb3JtLXNwZWNp
ZmljIFJUVA0KPiBjYXBhYmlsaXR5IGRpZmZlcmVuY2VzOg0KPiANCj4gLSBGb3IgbGVnYWN5IHBs
YXRmb3JtcyBhbmQgSVAgdmVyc2lvbnMgYmVmb3JlIE1UNjk5NSBCMCwgdGhlIFJUVA0KPiDCoCBj
YXBhYmlsaXR5IGZyb20gaG9zdCBjb250cm9sbGVyIHJlZ2lzdGVyIGlzIHByb2JsZW1hdGljLCBz
byBsaW1pdA0KPiDCoCBpdCB0byAyIChNVEtfTUFYX05VTV9SVFRfTEVHQUNZKS4NCj4gDQo+IC0g
Rm9yIE1UNjk5NSBCMCBhbmQgbGF0ZXIgcGxhdGZvcm1zLCB0aGUgaXNzdWUgaXMgZml4ZWQgYW5k
IHRoZQ0KPiDCoCB2YWx1ZSBmcm9tIGhvc3QgY29udHJvbGxlciBjYXBhYmlsaXR5IHJlZ2lzdGVy
IGNhbiBiZSB1c2VkDQo+IGRpcmVjdGx5Lg0KPiANCj4gVGhpcyByZXBsYWNlcyB0aGUgcHJldmlv
dXMgbWF4X251bV9ydHQgZmllbGQgaW4gdWZzX2hiYV92YXJpYW50X29wcw0KPiB3aXRoIGR5bmFt
aWMgcGxhdGZvcm0tc3BlY2lmaWMgbG9naWMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZCBUc2Fp
IDxlZC50c2FpQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBQZXRlciBXYW5n
IDxwZXRlci53YW5nQG1lZGlhdGVrLmNvbT4NCg0K


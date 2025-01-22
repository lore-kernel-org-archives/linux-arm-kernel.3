Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570DDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYkgD0BlR2/mqqmLI7/yoD98dEwaL1oxAzSL9kubc68=; b=0pBXnNu926lZ+b35/RyVET/Opj
	luajDIJFDM8u5Py6/hnHOrSUjUKU+p2zTvyA4gxgpZgG3E2GUkASlja6iOPcrqZ3QOh/4nbKJVLHj
	cKhoJ2/sSh3WZt295w/QVlE7KWHrNJDpymzbIWMPR4Js0oZbTp+Fc3YuyKJuWFLNvkAlEbD+Z5isi
	M6HxRnqQpVl1gjk6WiHwvGz4wRpfM0GO2L/k8/cDel9QinhqjixCWOg5TthUSkIRt0XuESdJsdQMz
	qRN17Mw4RdX9IWH7f1sDd3nF9fpEX4PVgReG+C8L1qbDKyUSwMC09Zbahfets62zuOz13mJSrTBEm
	iwj7q1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tac8e-0000000AUcZ-0O3B;
	Wed, 22 Jan 2025 14:55:28 +0000
Received: from mail-db8eur05on20702.outbound.protection.outlook.com ([2a01:111:f403:2614::702] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tac7L-0000000AUWC-15dJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvsVVsHS+ilpQocOGKfaZBqbwIP88lTFKj7j0u44xktsDT9y3KiMLev2w0iIJrtQ0c7bA4rLTsDt85xE+Sby24NXgCyQZyi1IPgoeRgaodiXZgs0RC+mY925FBJD+HBd2a35RLGOLPED33Cr8zhYZCV9P/QausCBjK4nuBfsF9a1Z9ZhNYj0bXWpNDB7aBjkMdUs4KydGO5k4Yqc2qYX40Xl+/dM9ObI03L9f46gTkB1FTFsHHcZVxcR/wXepFAKoxVYT53MM+A2NOK1RYvPiPjo9ydi8liPIP6yv8+awNXFxcT96tiOWl3wHuxo6n2Wcu/JGOuCL+V/aDBtq4mfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYkgD0BlR2/mqqmLI7/yoD98dEwaL1oxAzSL9kubc68=;
 b=xoHkC+LsibF+Nbxj7HH2vX2Tj5kmG6ujwymL/ng5oRZ1OH/QkdlSAGYwAwSf09WBTMM4xwqDUiq25hbQuaLY5BvHGWpl3vpQ82w04A5yeQOLDN+JS4/yOxcIpVKdcGroAsGvRdTNNNdqhQlPXD5VINKazUjDrHUCfUwTzBm1kl6TRjZyxX3Oy7FpBrTxDzEOnQ59ps6SQsXYL3IOcagzFcoGS5BtMGaZyA+ubpg/1gNi7uFieQtYrDYk39s9X7w/n0kBYTO/EBTU/xSIgTqj9+4QqkUgl9DZCvK2QwSf1jqh0l3HOgK0CljeI2dEp4V5NWpIQNA5JL3kWacMHWvAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYkgD0BlR2/mqqmLI7/yoD98dEwaL1oxAzSL9kubc68=;
 b=dlHysYNobHfhdtSXtQFRvkwfwHT/DNNFJo6TCXiLyweYo8JR3TXNAzxCyFExPGGM65hfaFu/7Kt87vZUaD6vxcY71k07aIIL/pTOI7UpkTG8UdFlZNTUIJ4n22YT1VrRREfsnLKfyFpaYcnBTwgqU3K7DtPODDfp3qQPVHf4jdNrSz7iaEwS3V3KzhLl4fvEN4Nb16QqxcDBHWXBWo64NSTrI2HyTQZu/zjXMxwYIP40MYrXIfuzxKFsBHSgkSvUL8vvFEuJ1ZDaaw/3lTuk/jpti0euVVkuKp3mYmaZEFTf35ckRe3bj4GAwlizdz9V3YZZ6v+7Ob4S+h0kop1Cyg==
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by GV1P195MB1974.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:99::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 14:53:57 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%6]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 14:53:57 +0000
From: Daniel Schultz <D.Schultz@phytec.de>
To: Andrew Halaney <ahalaney@redhat.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: "vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com" <srk@ti.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Thread-Topic: [PATCH] arm64: defconfig: Enable PCI_J721E
Thread-Index: AQHa6Qd2oS2U0xRTQEWiDGK501qvM7Mj6NwA
Date: Wed, 22 Jan 2025 14:53:57 +0000
Message-ID: <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
In-Reply-To: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P195MB2484:EE_|GV1P195MB1974:EE_
x-ms-office365-filtering-correlation-id: 57934eb3-e8e7-46dd-199f-08dd3af49935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cmpLbUViVy81WFphWVh0dTBTQmFlSXNvbkRKQTBTN1hUUXdENjVUZWVoT21r?=
 =?utf-8?B?UUdQSCtxVHZhNy9Md0VLSVFTcmh0NndxQnEvVXU2REZvUytHbEVEcy9sRDM4?=
 =?utf-8?B?ZVpidFhoRTF2ZEo1TlpXY2RTMHJSRU00aTJISm9FR2Zjc1ZVTjd4cEI2dXda?=
 =?utf-8?B?NEZvZTFrODkvSS9Tc21wT2xNelAxTGsxZ2UzVTBEKzVzRk4yMndDbUVYR0NK?=
 =?utf-8?B?NzM5Rld2RW43N09tUUI2TUE1aWU0YllIdmFGN1hGaVAzczY3MTBCbmtLTm81?=
 =?utf-8?B?ZDFiNUxyM0taWlNVcjFyNEROR0lFTTRlM1FVRmNHN3BoOWtKL3N2OVZ0TWVy?=
 =?utf-8?B?UE9SN3hTNUFFZzNmK00vNm91L1NiKy83V2dLWXhXUC9TbmhuaXExRUxFaktE?=
 =?utf-8?B?NFlpQTBoSk4rdmhyQXlBaUtTR2JkZk5OOEgzSkZFcUxwR2o1QVNaczNEWUh0?=
 =?utf-8?B?T05saEFGVjBMN05mdXQ2bkJudEZsLy9RWUI5UlZiaU05ek91WXRFZDhNQXY0?=
 =?utf-8?B?d2JsYUFZcW5ydFhuVlY2TG0vYk1hQi85bjQ0YnA4MnBlV2FLN0syek0yZG9u?=
 =?utf-8?B?SEFReXZTSlB5WGtGc25LeE9HaW1wTkVUQlFxTmpGcVB2b1VGbUx1cSthZElK?=
 =?utf-8?B?azZtL1BvUHVOV0s3aUNoWVc0QWlneVpsWHpObGwxbkFxWm52T1pPOC9IZGdz?=
 =?utf-8?B?dDU2dGZEeG8rbjI0TUJlR1F4NTIwaHlDcE50THJUWWlPWXJQQ1hjb0RCUTFi?=
 =?utf-8?B?YUNFVEhzNDE1UGtGSVBnQlBGNHNzdm9Qa255ZFEwVVpUbTBQRmQ1RlJyM2tH?=
 =?utf-8?B?bHhMSTl4bVVHNUs4WnM4VEVTWGhZWTMwS0JBdDFtT0UwUUM4S3hrSlBXNFE5?=
 =?utf-8?B?cXcrSDBjeFc5V3RIYW00STVId3lEbnJCUEl6VUJtbElUai8vMmNrR21KV3Yy?=
 =?utf-8?B?WXQ1UlMrR2dNNmxwOUlFQUdtY0Y0QU9udzZDTytsVnYza3VEc3ZDbXp6dlJX?=
 =?utf-8?B?YlRpMDBmNFlaZnU0VFFZY1dGWkpvUm0wdm9MTkRlanovVlhXQUc3MTBoUFF0?=
 =?utf-8?B?MFdhdGJ4S1N0QmxQcUpjTUdnOE0zeGR1UnUyeVEwdVFWdDk5Y1hpNWdGUlFM?=
 =?utf-8?B?eDFYYW9CeWNkcHNPTTU2aVFNTDY4alQ4Q1BpeS9Mam0xRWF0dHBpZ1hVSmZO?=
 =?utf-8?B?Y0VqVE1STFp3VGpEcll5aVRSeWk1WHMrNnI2ZXE4dU9uUm05bTZjL1U4ZGEr?=
 =?utf-8?B?YkYweWdUTlNrQTNJTzA1MUJMT2JMeG90T3dKdXk0YWZweHdKdVR6NUlEU2Ni?=
 =?utf-8?B?a1hkRVF4SDcxUEY3aW9qdTd5dVAwbFlmUFIvVWl1cEtVdmV1ZUF3Zmx3Y1Jv?=
 =?utf-8?B?OTl5NUVsZ3dYZFMxQ1JOcmVPVVRObmlaUVBaYkNsRzdFMG5UQm5LWmdQLzNK?=
 =?utf-8?B?ZHZFSk02ZnBhVXVtZmhRbFJHbzc0NEdkeGEveVpKQmhIWjNuYzl1Q2YrNEVN?=
 =?utf-8?B?MWFpNDF1MmZHOGZJTGhaSTRqaXpzY1Z6S2gxNlVYcHJkenhoREYvRmFtUFZw?=
 =?utf-8?B?QThuRFpsYmxIV2RrbFp5ZzhrUEtnNDFpMjFNRXBnOGZET1pHaUZydjdrTWt0?=
 =?utf-8?B?VjIvK0YxaDJNa0ZSbVYvTkpsK3VXdlJ1c3pvRTNxNEd1VUsyWmdzaHZUZFRq?=
 =?utf-8?B?SXE4Yyt6bVYyTzJTUUxJdzUvWXdJelRYT0lwQU9JN01LTmQvRkhnVHpTQkVM?=
 =?utf-8?B?NDQwdjZmUFhkZCt5TGVBRWM4VzNHTUNxbUs2QWliMUNtU0xqZlBPSHFMUitQ?=
 =?utf-8?B?cDZQNWpJbnNjSFVYVWFHQ1FIWDd0T3R4emNJNjM5Qk9PczczMjFnKzJMRWx6?=
 =?utf-8?B?bFNxZDltU2pnK2lZcW1jYTB3V0V4YWxrTDB2bjdlOFVMK05zSDFKV0diNUxs?=
 =?utf-8?Q?eaidI6vkDq0YnlwH8qXQJJGO6cGrUWhP?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzdZSXBPYk9tN3VRQ0FsNDRSajIzL2krbjgvWDRweS9md3lIUTM4MFpnWWJy?=
 =?utf-8?B?T3owejdLSkc3RUtJVFV5citlbkNWc2ZzVjdOYVliRTd4dEMvWGp2eWNFd01L?=
 =?utf-8?B?SThHMHhOeUlQL2tsTlVuL1RudzNrRWF5aHV2T08rTGxKQ2xxNVM2a01HM1ox?=
 =?utf-8?B?ZnBXRmp6a09KeTE0ek1kRS9hbjlLeXBtQ2FkZTZRU0NkcklyMnVCdEVMQ2l4?=
 =?utf-8?B?Y1hpT2czZklOYkRDeDJhb0w3NWRWbWdBeTZvTDVENWtZRVZQWkcrc25VTVQz?=
 =?utf-8?B?d1krdWhtblB2Zm1wWmRUNTNwYm9ldWk2OTNIYVdDeWV3dENJN3lHQTJLcFRk?=
 =?utf-8?B?UmphWnNDTWdNSGZndklwL3ZNdVNuWkdhS1JHaTJWTkd6VS9OdVFRK1J5L09w?=
 =?utf-8?B?Uyt1dkZtMkZCOHFRZlpGNzIxTnV0eldrYWRPem5JL2pYQ0tUM3dET0JrREU3?=
 =?utf-8?B?QXF1SFVYWTB0MGJVTEdXWnhQNm1qUDdZVm5NOHYwVHNxamQwNklnL1ZleTNi?=
 =?utf-8?B?MDFlRE12SVQ4Nk1lWU4rMENnc2pwRWpxVHgzWHFYbjRPdnN1OFdhMW9KSm9p?=
 =?utf-8?B?MmcrT2Izdkxna1pYQWttUWtzRjV1RVBQL3RwVjR2YVhOV2lmVXpGcW8zQnBp?=
 =?utf-8?B?RGtSTDhPZmlPNFZsZ1doZzFGb3VmMWJUa0J1Nmo1c2laN2FQemN0MDdzY0pk?=
 =?utf-8?B?c2E4cTh3RGVDbEZuVmxmN09CTW9WOWRRSFdTU2JPUytySitvV1phTkgvaWZw?=
 =?utf-8?B?SG1rRGszREhaR2lQQ0JIMzNQSWdERGJRVDdCWUxpU2VoVjl5SWRxelJPVWdG?=
 =?utf-8?B?UHo3N2pKaDM4disxYU0zQVpSd29DLzFSNWFET3pFVldkYkFpQ1hKaG1QRDVu?=
 =?utf-8?B?NXN3Zm5iOTh3WCt4TVkyUEhSSFpUaVpwc1lhT0FnTWdoSG12SDNwcnlLdEpJ?=
 =?utf-8?B?RWIzUFJHdE1oT3JlR3grTUpDUXgwL21odERQeVE5ZnIvMXJWenZZUXBYekpT?=
 =?utf-8?B?VkU2R1F1YThwUzJndmVhdm9xbmRObXNJUFg2SnNuNXRRdWYzVjVGdnFheFBS?=
 =?utf-8?B?Zk91NTQyYzBERjBFVUV2ZXAxUEovYjZMd0hYVEcyTTVpMG5DM3psbU15UVBh?=
 =?utf-8?B?aGhmMVE0b0E3YzJjaG44S3BUQ3JIL1UrRC9ZaitrWDRwQVl1a1FlTy9UK0Jp?=
 =?utf-8?B?SWt2QktCQVlHN1RQQndIdDJMUW5aLzFJV0JDcEtvWmwzVkw1TjhGeDZlVFRE?=
 =?utf-8?B?cERSUHBqQ1ROMDF3V0pmR3U4OXpSQnhTc2NpZmR5NWxjU200RjNqT1VxK0dG?=
 =?utf-8?B?YXJBTzExOG9LNWNRUEhhQmpGelpMVFpkR1JJZFcrTkFtN2Y0bnVvMVVKYU5W?=
 =?utf-8?B?bkFZWjVQeE9seDVhZVBoMjdGTTFsQlVxK0lJaGpQYjdKVlBpS1IyM1M0d09t?=
 =?utf-8?B?ekRQcFduUG50RDhrc0ZQaDV5blhyb1F5REc2QTRYTVV5bFhPemtFTlZCS2dV?=
 =?utf-8?B?MUt1Zzl4bVVMSm8xZS9Sa2JSVmZ3dnhaTzlhYzZqSldwc2lNTytVK2pzM1pY?=
 =?utf-8?B?b0Q0bzQ3bTgxc3RiSkxiS1NVbC9ENWlkck42dElCa0tiNWlrZS8zY0p3Rlgr?=
 =?utf-8?B?cnc2WUxTdi80OHpJVHVFUDdtcm00MVV2UlA4ZnZQZVFUVitoNHZyZDNMZFFa?=
 =?utf-8?B?a08yeklDZmRuQ2hQY2taUHJ0RXpMUHRLT3JkYXN5QlNlMG5CRDZPcGxheWxn?=
 =?utf-8?B?Tys4UzVia1dnVlRha2VjUy93ZHJSRnZOTlFRWGJtY3FSOG9BZ1RFNXBXN0RV?=
 =?utf-8?B?NytyR3p2M3MwNFN3NE14NWQ3ak96dFo1a2ZlYWp5QjFMbEJwR28wRkpFS1VF?=
 =?utf-8?B?NXNXY2VSS0hDTHVmQlRuTTJ3N2ZNZE1vR3hESjZSRUJrbk5JSFlJOUE5b3l1?=
 =?utf-8?B?emw4ZWx3NTdkR055OWJZenZZOWxZMnp1T1pZR3JNSy9DbGlGS1ZMRVhxdnFZ?=
 =?utf-8?B?dndyRWJockkyandITkRHTUlSc2VyK1NLM0NpWVhNRDk2RWhpK05GOVZnVTI5?=
 =?utf-8?B?THNNU2xGa3g4WW1PY20zNVcvY0c0eGhXMHdhbWltcWFJY2V5ekVkblJsT05H?=
 =?utf-8?Q?pRys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BACC8DEAEF945141940413CC77EEA79E@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57934eb3-e8e7-46dd-199f-08dd3af49935
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 14:53:57.2938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/PyszLAgPa1wrZoESAQalEun1+fvBFh1i1FV2tVgyUgCC4Fr7vOUfPKYYvKctD1ydybpwNPYQi1S3J0ECdWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_065407_601421_A5FA0CE1 
X-CRM114-Status: GOOD (  15.07  )
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

Y2FuIHNvbWVvbmUgcGxlYXNlIGFwcGx5IHRoaXMgcGF0Y2g/IEl0J3MgYWN0dWFsbHkgcmVxdWly
ZWQgYnkgYWxsIFRJIA0KQU02IGRldmljZXMgd2l0aCBQQ0llLCBlLmcuIEFNNjR4Lg0KDQotIERh
bmllbA0KDQpPbiAwNy4wOC4yNCAyMjoxNSwgQW5kcmV3IEhhbGFuZXkgd3JvdGU6DQo+IEVuYWJs
ZSBQQ0lfSjcyMUUgZm9yIHVzYWdlIGluIGJvdGggaG9zdCBhbmQgZW5kcG9pbnQgbW9kZXMuDQo+
IFRoaXMgaXMgdXNlZCBieSBib2FyZHMgc3VjaCBhcyBUZXhhcyBJbnN0cnVtZW50J3MgU0stQU02
OSBhbmQNCj4gSjc4NFM0WEVWTS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEhhbGFuZXkg
PGFoYWxhbmV5QHJlZGhhdC5jb20+DQpUZXN0ZWQtQnk6IERhbmllbCBTY2h1bHR6IDxkLnNjaHVs
dHpAcGh5dGVjLmRlPg0KPiAtLS0NCj4gICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwg
MiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnDQo+IGluZGV4IDAxZGQyODZiYTdlZjAuLmU1MjIyZGJlZGQzODcgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCj4gKysrIGIvYXJjaC9hcm02NC9jb25m
aWdzL2RlZmNvbmZpZw0KPiBAQCAtMjI1LDYgKzIyNSw4IEBAIENPTkZJR19QQ0lFX1JDQVJfSE9T
VD15DQo+ICAgQ09ORklHX1BDSUVfUkNBUl9FUD15DQo+ICAgQ09ORklHX1BDSUVfUk9DS0NISVBf
SE9TVD1tDQo+ICAgQ09ORklHX1BDSV9YR0VORT15DQo+ICtDT05GSUdfUENJX0o3MjFFX0hPU1Q9
eQ0KPiArQ09ORklHX1BDSV9KNzIxRV9FUD15DQo+ICAgQ09ORklHX1BDSV9JTVg2X0hPU1Q9eQ0K
PiAgIENPTkZJR19QQ0lfTEFZRVJTQ0FQRT15DQo+ICAgQ09ORklHX1BDSV9ISVNJPXkNCj4NCj4g
LS0tDQo+IGJhc2UtY29tbWl0OiBlZWM1ZDg2ZDViYWM2YjNlOTcyZWI5YzE4OThhZjNjMDgzMDNj
NTJkDQo+IGNoYW5nZS1pZDogMjAyNDA4MDctcGNpLWo3MjFlLWRlZmNvbmZpZy03YmZiZDk1YjZm
OTMNCj4NCj4gQmVzdCByZWdhcmRzLA0K


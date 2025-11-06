Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbM3kvdixBtWiiHSbWhZ/syoZ3qYkFupMBys74rIPyk=; b=Aub1HadtbseVu2af92JBcLxSRo
	HAPk2/RgVMURO7pyq2qPwaMv74X+cdUY4kkOUOP8SwEJ51L1R/vP5uDoMLpIFNg6k7mCmqjyGmfVU
	SfXMN5k/Cb50ZZDyutWcK2dx3cmqjNJj6DiYuo2XekCtWZ6S8omHYVVwWA3a0V0zA0kxDr9+OOyB9
	AhrILLbcv7dY4o1/69UCfY5iiYGJBqcqXxYpVbnm+T8tOftGlPhkXs4BbUPSiUhKtfFai0qNyZyYS
	EAis0x6ZlHX6SuQYsq/+ElTHnyTYJ0AtDjetpadkysaXlaiF1TEmfsAA35eTEQqOq5PP1Bq5+uOoP
	4/vFk13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGski-0000000EtcW-081i;
	Thu, 06 Nov 2025 05:41:44 +0000
Received: from mail-koreacentralazon11023111.outbound.protection.outlook.com ([40.107.44.111] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGskc-0000000Etc0-2Hn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 05:41:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCXRo5BIDiVjS9WpNCS+LmX6Y+CYk1JZ4k+6l6I74oPP0Yw4tJ71W4zz7Vj4rguQOTw3gCmtulnHLQEeucGxy/A437CmYM2HzN7UJhUvoEb8MGdLwC9lgcziQIESBJtsfue2YYLNE1KFGYGoUZRTi21mkw+rzrEqBn1urHTKU/iYR+OOgt2rjD3YlLP3Zki4r0KDWeKGaFjrkW+1a1m++fuUDypHXtsMl2EDf4hq3NQDbG9x1EykOY1HG2k6OFaG+I2nravUfvgkDIkba0fR1aitqWIPffGIxC0AyesNgeQNL22kszBCCWPEKy2qC1zpThoSvxt+2hill5bWWIp+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbM3kvdixBtWiiHSbWhZ/syoZ3qYkFupMBys74rIPyk=;
 b=aHZ7GgsS8666S/En98MF5x9nEDFdY7dCXG0kzn0Q+xt/YWX7lYgZIwOpA5ELyeSJRFZoPYCaSBDx2w31HFhTsQCYxx3iBqV9ihE7edGG1IsL9UYR1GRZE/4r2E/tqNttDykWsIl9wiqykn8kkBHL/RA9ju/PgHFGcBCX4jqDby2ZoMC6XfgV9m3zroAJkfodyOUefw+3GmePM7ynYUDtus2CKsYesHVdcxjfgmV+5puBDOFh1nuqfhH+6B6JDEHfoh1XTk9NzICpUyaBABJiPiVyB3roZBs36LcCsMmZedACgW4sRKhCi6+UCGZjw5EEtAOCmN4T487K1pRGYgo/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbM3kvdixBtWiiHSbWhZ/syoZ3qYkFupMBys74rIPyk=;
 b=m17npzgoC4sQlF6qlGaxmasSxXnqReUYgDIPW1okeCof1+DLqmRJkh5d7I6ySlM8/hIp3rW92FKkf4HaLF1FkMp0Y1Nel1YRgYVgF3wEi42xPOKeBbZRc/KqXvn82U+j/BgAPvxBcIpbdqY0i9SLeH1LFj25iXeSIrOSnHxkUzu60xgezIOdvYIxNNs1L1J4WDywevmLNtGz4xTTQHS7cEv5n07Ah7jskzozni/0Ankd5hoQVUMthFVgAAziHxq/z0gY70rkZw9aGVK8wSwmJqL9yNVlltEMYoQXk2RhSTfdC8brla0GLGoivYFHaS8XvOrNg+0+eodDqq0Y0ttQaA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB5327.apcprd06.prod.outlook.com (2603:1096:101:6a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 05:41:29 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 05:41:29 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "taoren@meta.com" <taoren@meta.com>
Subject: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Topic: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Thread-Index: AQHcTJUB+TmCwKSgIEaeQsrh+oaRd7TiLi+AgAAZOmCAAAUCAIAC1hMQ
Date: Thu, 6 Nov 2025 05:41:29 +0000
Message-ID: <SEYPR06MB5134004879B45343D135FC4B9DC2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
 <20251104-victorious-crab-of-recreation-d10bf4@kuoka>
 <SEYPR06MB5134B91F5796311498D87BE29DC4A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <9ae116a5-ede1-427f-bdff-70f1a204a7d6@kernel.org>
In-Reply-To: <9ae116a5-ede1-427f-bdff-70f1a204a7d6@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB5327:EE_
x-ms-office365-filtering-correlation-id: 81782b0e-f909-4958-e47b-08de1cf72291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UTFnTVdXWEoyb25QVzBvSmdkUlpPTnI0ajZ5M3JJNWRzaHVJbStLRG5ZMmhN?=
 =?utf-8?B?dmFCc2QzOVJWVGxPL2p2Rm9WaDdEWDJYS0FpcysrckpTK2lxbFNzM2pNWWRz?=
 =?utf-8?B?QUxoS2tTYTlwWE5LRzdmNUM5dHBtY3RDY1NNWnUrMzdDcjhyVUpVSW1Yb01k?=
 =?utf-8?B?TjhxWVd0K3hDZG9iUVRZQXhGYkttM3pVbjk5enlSWXZJanFsRy9hUzdWK3h0?=
 =?utf-8?B?eVhJWGxpcStZRklTMVdzMDB5RExvbWlUV3FoT1Y1a2FwMnovbEt5a2dsSld1?=
 =?utf-8?B?UFk0RTRQLzM1Wkx1ZG9mZ3hnbTVJUmw1V2VLYlRMbFRoUVFrTW16dWFkWXpn?=
 =?utf-8?B?VURwN283QWpsMHFwWnJFQ2o3ZzBOYjF2NTJaRXZDYWQyZ1UxQXpTWUo4emhj?=
 =?utf-8?B?WVg4d0REc2M0UUFIa2lDZjVIZkNCdWl6OW9YU2tFR3UwS0pIb1E1MDgvMnVa?=
 =?utf-8?B?dFY2b3U2RXduMmphQUMrUzFOanZoWXJLVVd1Y2pGNFMrOUwxR0RCNXJOdUhX?=
 =?utf-8?B?MWIyL014SmN5b3BSaU9GMHErSEFlWldjdS8vTGdFT3FoY1o5V0R5MFBIQXVJ?=
 =?utf-8?B?cllPd0IyWko0M3p2QXN4SkgvTmovdGVKMGdIQzVsNFpUaHRleTh5SnZpMWRJ?=
 =?utf-8?B?bEo1aEY2c2xMeE9SbjRXeUZicWYwVnh6ZTE3MHZ4OXdTdzdtQmx1bHM2cFVE?=
 =?utf-8?B?U2EwZjVYUit1ZnBvQlF5aDBxbDZvaVhnRk9JWFlnS01CNDJFU0crdEhNaFhl?=
 =?utf-8?B?eWlxdjRVS3FOejV6bzJycDNEZkphbERXRy8wRmNaT3FyN3hnYms4a0pyZTRa?=
 =?utf-8?B?M1ZJUDU2WmZZa1hoYzczbWNBL01ibCt5Y1QzWi9QcTF1WkpEaS9OYlhoWkpl?=
 =?utf-8?B?Tys2YXZnam4xUzc5WWpSbU9IVlZWQ2lsa1YxdkM2VjFiWlZJTkpYeHVLQ1hs?=
 =?utf-8?B?dFI0QWZOUksxRlZhM1J2Z1BBYm0xMXN0azBCbWplYzZQYnp1WHd3cTdSc240?=
 =?utf-8?B?c05zMFNsRUdSVDNLcEUzQkRCQzcxSzNpMVA0Slg3dzkrOE51Q001V1VBTkRn?=
 =?utf-8?B?OTI3aWtLTHE4Nm5kMEt3N1VQb1RuUUx5K1pYSFJQeTcyc012T1YwK050NXJs?=
 =?utf-8?B?aEJpSWIvSVRIYTF1ZS9rSFdvM2FnSTRnMnhueUhSRE9aTm9aU0RHUkhkczI4?=
 =?utf-8?B?cDllTGFUck56SXNvdWxnVXFsY3lya1JOeHo5MTN6NzJ2Y1RXTGFRV1FiV1hQ?=
 =?utf-8?B?T2YvZ1M1MmRVZDV6SVJqTEFIZHExYWp6azRXUWhHRGZwblVrWlZFeGtIN1c4?=
 =?utf-8?B?cXl0QXRqZXV6Q05NRkNFVDNvWVE4TkdOUE5SZ1M4dXFtdm1vRmpVQTRnUHR3?=
 =?utf-8?B?NXpsUFlZVXpDQkExVkZOQXNBUWJlMUNzdTFLaCtISkZlakxaazF1VnpJaFhH?=
 =?utf-8?B?YnlpdG9FWDFReVlveTZiMEN5aWZTZFNXdmxwd3p2V1hMYk9DOHZNbmxFNHFp?=
 =?utf-8?B?dS9LbGdheUJhSHpXZmlRMU1na3RteFF2cThkbHo5OXk2bWd5VDJhQkV0bGh0?=
 =?utf-8?B?bDI0ZDYvNllPZDNRVHRWczN0d01udnZPcldUcTZJUEdiQ0hoMVo4VHoxT1Zk?=
 =?utf-8?B?dm1WaFNObzZhR0JmU3Y1Yk93d1BMTXAvQTFtVlZsczZscGdic0IvdG1lM0lu?=
 =?utf-8?B?Wmw4dk9TMmVSR0ovWm9PS1JsR28vZzVvajZESk5LaUhhczNDdXR2aXpIZG1l?=
 =?utf-8?B?VXhTNElwbWppTjhLdmVJVWFKb05rcU5OeWsyK1BpTDhJMU1JWEFGYjdGVkUv?=
 =?utf-8?B?VmxLUWNTVnpsUnNnOWRVcW9Ja3M4L0hvZTJVdXhNZ2FuUkdPejRKS0tKSVFP?=
 =?utf-8?B?MzBTbWxPWUozaEdpU01ETm1EWVYycG1LQ3ViaE50NjBuKzB4MVVJZ2lMUFZL?=
 =?utf-8?B?Zkp3VjhmS3JCcStWKzErOWVFVnZnOTlsSFVvTHFRRU5menhOemhpMHVWUTdU?=
 =?utf-8?B?cTdSQy8rRUJrSUxkaHdpMU1Gb25OMHR4Wm5NRWpaNHltak9qeURseTF5eWlG?=
 =?utf-8?Q?aphI6v?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUkwdWlDaCtXWDBZeCtFRGdJS1I0UWQrVHJUM1NwakNqc3VkOWVqcm56QWw4?=
 =?utf-8?B?WUcyN0JCZGY2K0xoNElzNlFURDRQZHNKdFd0OWRxY1hWL1l3bjJIaHZFdk54?=
 =?utf-8?B?OXlrZkx0eHE1bm5Hcmw5Y0FlSU5yL2Q1ditObVJwYlRwbWtyZS9pT1VPTlhm?=
 =?utf-8?B?S3p3anlMMTY3dGJ5eDdEWFpIRFZvcGxqTkpIeTZDeXRrSUpwQU11RjlqKzJJ?=
 =?utf-8?B?NVdYK0dUS0hNaHNmZEs1UDB1STNrL3Y4bHpDUEVzWVdscTJubEZVRGcvSzRI?=
 =?utf-8?B?bzRiMzZtQzErVXQrMUl6Mm85a1VubTRkVkJtV25jbkhtWHBDNlBzdjU5Q2RR?=
 =?utf-8?B?RXIxNzZGQUZCcUw1TWlvNDNpTDc5L0NadnBVRk9RUFJDWTY4UlBLaHU2VXVJ?=
 =?utf-8?B?ZVhsL3ljMERZeVZYQ2dUQlgwV2VpaXA3eWdPTFc5MDhwdHB4S1dlWTY3Y2g4?=
 =?utf-8?B?aXB4Q2wxM24ycXV3QVRIZlR4Y0NSdHdFN3B2Y1lzRkg5RzZOOWJYTXdIS1ph?=
 =?utf-8?B?N2hlSWc4R2lZMEU0dWlVdWttSXUremphMkRjSFhjcmdNMmdndjFiV0UyT0Ev?=
 =?utf-8?B?MDBQZDJKTkNYNjFrZWVHQ2hwWm5WUmNsWTR3UzU1QTJVa2ZaL3QreWtIRGdK?=
 =?utf-8?B?RWg5SldMTzhSRHB1WHVPNi96cGNEa1ZNWHFDVmRjejNpbUtKRUl2b3BQWW11?=
 =?utf-8?B?Q0tKZ3R4N1NHMnFMQ08rZlZ3b21nd0pDQituQk9ZSGkzWkVlc2JHNVhtLytz?=
 =?utf-8?B?cjdGa3UxNFkzQkM2R0xCcDBkdmJFZ1J5OXVlM1lVMENpalVqUkdtNnU0OG5k?=
 =?utf-8?B?Q1NnWFh4U3U3akQ3M29aSE1TL1RmOVZBanZBYklTUFpTc2srd29LakNCRGtS?=
 =?utf-8?B?Y08rRzJLdHc3blFVTUF1RkN5VXhvbklORVhhb0d3eGU2MUpaVEd1UzZNR3NB?=
 =?utf-8?B?SldxcDVaMXRaTzhPc3JjcHZVY0xYNWUzbnF2ZVdEdlhOQlY0anpZMUhXUlNN?=
 =?utf-8?B?RVZqSmJyZk11NlVkL3ZReUJIcHQzSEdEeG11S0tGdDF4dmQ3aWYyZFp5NE5o?=
 =?utf-8?B?R2pjZnVPcllpZVM1SjNOVmVZVjhCRXM4MnVmTUswcjBvdkNsMHYrVjlwc29x?=
 =?utf-8?B?RGRTN2dlUUo5Q3BTamNST2VrbnVsNTlRUkpZeiszTkt4N1U0TjZmbXEzQW95?=
 =?utf-8?B?V3BHZXA0SG9XSk4rYnZxbVdNMmw4NjNMMm5BSlNsVDRoTUE4SS9qMGw5QnVG?=
 =?utf-8?B?dkFRZXBrUWNxaGRjTjhqYmIxNngycmNTbWoxbHMwR2lObGxEcFRxQTl1azBj?=
 =?utf-8?B?RW5XT3kyOFAyQjlvcXNybDVYczZPVkhHSHpPN3RKaWlUOXkxeXdrbjhoMVBL?=
 =?utf-8?B?azJJNkwyNEVLS003eCtTOCtYZEZxck1YTlIwWitHR3VSeUpvdEJUeVpkMWhM?=
 =?utf-8?B?TGRPN1RHVHRqSWVqdFZ1V040b1YrRW5EaEQwLzVlWE5SMXhRMVlKcjY0bFpH?=
 =?utf-8?B?WWxqdkNSZjgyb2N1aGZINUZOaUwzYnVSYzZRRHV4WlczSmdybVJUaVUxMEk1?=
 =?utf-8?B?Z0VYWmRpZGtPL0Jtd2s1WHNNVGdTQlFZL1FhT0IwMzV5UmwzRXdMbm50QmF3?=
 =?utf-8?B?YitLdkJla3FxM3hzT1V5RWE4RG1ORHBlNmtWbzM3ZmpoUWpyeHlQMHllRE5x?=
 =?utf-8?B?aXloZDAvU1BlS1U0V0phY2laV0ZVKzZKSEJiQS9lR21ab3dYMEM1ZDBVMTJJ?=
 =?utf-8?B?S3djYk9MUkRIWE9QZk5KZ052dFVmakd1OWY2UENwdFVKMlBZRDQ1M1ZkRzEv?=
 =?utf-8?B?bWl6Z3J5QkxHdU5DS2ZJcHNsWFN3c0hBR1JnNlpWQWJsUXFXdm5PaUpOWlAy?=
 =?utf-8?B?d2ZtdDl6c3ExSTU1bFJwTk9IMmMxSUNkYVp0VjhCNks5VENLa1JTQzZhYlBW?=
 =?utf-8?B?K1hrbjFSOWUwNGp1dzNLN1pXbklDNDdjbHJZWVN4dUh0SWNJelRPcTdJbUx2?=
 =?utf-8?B?UXRMZXNqUDQ5VVRIa0RBZUdVMXRBdFFPVmNPMWtGNlFwdy9lOHVndC80NjRj?=
 =?utf-8?B?MWFJMFVSdWlmL3UrcGQzQ3dHRVVVNWc2M3YzbVkxdjlkYmxaa3VJWFliNG5i?=
 =?utf-8?B?L080Vmk4cmtoSkxEUVY3TDZoRmVTRlo3ZnNDZGpnMEViRnJyMUR3cjFYeTha?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81782b0e-f909-4958-e47b-08de1cf72291
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 05:41:29.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00znHqLk/bJQ/bw0QfkzCh3233tJRs8nYN+F4os+WZF5rO4JhWQCI91GxDhbwWCp7yfsKme1x6I35/S6Ow/Gn8t5kn7cwNkeC6BdSZru31Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_214141_574125_C657FECB 
X-CRM114-Status: GOOD (  18.88  )
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

PiA+Pj4gQ3JlYXRlIHRoZSBuZXcgY29tcGF0aWJsZXMgdG8gaWRlbnRpZnkgQVNUMjYwMCBNQUMw
LzEgYW5kIE1BQzMvNC4NCj4gPj4+IEFkZCBjb25kaXRpb25hbCBzY2hlbWEgY29uc3RyYWludHMg
Zm9yIEFzcGVlZCBBU1QyNjAwIE1BQyBjb250cm9sbGVyczoNCj4gPj4+IC0gRm9yICJhc3BlZWQs
YXN0MjYwMC1tYWMwMSIsIHJlcXVpcmUgcngvdHgtaW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGll
cw0KPiA+Pj4gICB3aXRoIDQ1cHMgc3RlcC4NCj4gPj4+IC0gRm9yICJhc3BlZWQsYXN0MjYwMC1t
YWMyMyIsIHJlcXVpcmUgcngvdHgtaW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGllcw0KPiA+Pj4g
ICB3aXRoIDI1MHBzIHN0ZXAuDQo+ID4+DQo+ID4+IFRoYXQgZGlmZmVyZW5jZSBkb2VzIG5vdCBq
dXN0aWZ5IGRpZmZlcmVudCBjb21wYXRpYmxlcy4gQmFzaWNhbGx5IHlvdQ0KPiA+PiBzYWlkIHRo
ZXkgaGF2ZSBzYW1lIHByb2dyYW1taW5nIG1vZGVsLCBqdXN0IGRpZmZlcmVudCBoYXJkd2FyZQ0K
PiA+PiBjaGFyYWN0ZXJpc3RpY3MsIHNvIHNhbWUgY29tcGF0aWJsZS4NCj4gPj4NCj4gPg0KPiA+
IFRoaXMgY2hhbmdlIHdhcyBvcmlnaW5hbGx5IGJhc2VkIG9uIGZlZWRiYWNrIGZyb20gYSBwcmV2
aW91cyByZXZpZXcNCj4gZGlzY3Vzc2lvbi4NCj4gPiBBdCB0aGF0IHRpbWUsIGFub3RoZXIgcmV2
aWV3ZXIgc3VnZ2VzdGVkIGludHJvZHVjaW5nIHNlcGFyYXRlDQo+ID4gY29tcGF0aWJsZXMgZm9y
DQo+ID4gTUFDMC8xIGFuZCBNQUMyLzMgb24gQVNUMjYwMCwgc2luY2UgdGhlIGRlbGF5IGNoYXJh
Y3RlcmlzdGljcyBkaWZmZXINCj4gPiBhbmQgdGhleSBtaWdodCBub3QgYmUgZnVsbHkgY29tcGF0
aWJsZS4NCj4gDQo+IA0KPiBZb3VyIGNvbW1pdCBtc2cgZG9lcyBub3QgcHJvdmlkZSBlbm91Z2gg
b2YgcmF0aW9uYWxlIGZvciB0aGF0Lg0KPiBEaWZmZXJlbmNlIGluIERUUyBwcm9wZXJ0aWVzIGlz
IHJhdGhlciBhIGNvdW50ZXIgYXJndW1lbnQgZm9yIGhhdmluZyBzZXBhcmF0ZQ0KPiBjb21wYXRp
Ymxlcy4gVGhhdCdzIHdoeSB5b3UgaGF2ZSB0aGVzZSBwcm9wZXJ0aWVzIC0gdG8gbWFyayB0aGUg
ZGlmZmVyZW5jZS4NCj4gDQoNCkFjdHVhbGx5LCBvbiB0aGUgQVNUMjYwMCB0aGVyZSBhcmUgdHdv
IGRpZXMsIGFuZCBlYWNoIGRpZSBoYXMgaXRzIG93biBNQUMuDQpUaGUgTUFDcyBvbiB0aGVzZSB0
d28gZGllcyBpbmRlZWQgaGF2ZSBkaWZmZXJlbnQgZGVsYXkgY29uZmlndXJhdGlvbnMuDQoNClBy
ZXZpb3VzbHksIHRoZSBkcml2ZXIgZGlkIG5vdCBjb25maWd1cmUgdGhlc2UgZGVsYXlzIOKAlCB0
aGV5IHdlcmUgc2V0IGVhcmxpZXIgZHVyaW5nIA0KdGhlIGJvb3Rsb2FkZXIgc3RhZ2UuIE5vdywg
SeKAmW0gcGxhbm5pbmcgdG8gdXNlIHRoZSBwcm9wZXJ0aWVzIGRlZmluZWQgaW4gDQpldGhlcm5l
dC1jb250cm9sbGVyLnlhbWwgdG8gY29uZmlndXJlIHRoZXNlIGRlbGF5cyBwcm9wZXJseSB3aXRo
aW4gdGhlIGRyaXZlci4NCg0KU2luY2UgdGhlc2UgbGVnYWN5IHNldHRpbmdzIGhhdmUgYmVlbiB1
c2VkIGZvciBxdWl0ZSBzb21lIHRpbWUsIEnigJlkIGxpa2UgdG8gZGVwcmVjYXRlIA0KdGhlIG9s
ZCBjb21wYXRpYmxlIGFuZCBjbGVhcmx5IGRpc3Rpbmd1aXNoIHRoYXQgdGhlIEFTVDI2MDAgY29u
dGFpbnMgdHdvIGRpZmZlcmVudCANCk1BQ3MuIEZ1dHVyZSBwbGF0Zm9ybXMgYmFzZWQgb24gdGhl
IEFTVDI2MDAgd2lsbCB1c2UgdGhlIG5ldyBjb21wYXRpYmxlcyB3aXRoIA0KdGhlIGNvcnJlY3Qg
UEhZIGFuZCBkZWxheSBjb25maWd1cmF0aW9ucy4NCg0KSW4gdGhlIG5leHQgcmV2aXNpb24sIEni
gJlsbCBhbHNvIGluY2x1ZGUgYSBkZXRhaWxlZCBkZXNjcmlwdGlvbiBleHBsYWluaW5nIHRoZSBy
ZWFzb24gZm9yIA0KdGhpcyBjaGFuZ2UuDQoNClRoYW5rcyBhZ2FpbiBmb3IgeW91ciByZXZpZXcu
DQoNClRoYW5rcywNCkphY2t5DQoNCg==


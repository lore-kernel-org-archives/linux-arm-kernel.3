Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05677C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAytpAStCJKiuOCJzw5oNMGnZrV9oJhIJw/gffo3bsg=; b=Yx3PsSGUaEhsRBvs4xaW7d+pNW
	DGt05XZiy0tGLjAuaNE9MV9RFrqIZhObafCuG5FxMMbA+78xce/Gt9i4CO94BvyqvgUzeb3r3SbVX
	0AoGvh+bZTSxGhgon685hsFZra74NhU2B13PUsoiSw0FFso1A+F1V2CtBvw/bYJF6j8eLKxmQMYzX
	mPnIlYHNH8N0RaRDiSfqRxLvzvrYP72uZ55VpI7eGIPI+fvjScZ9wX6lMwrTrP+OlcbZiFrftcwMU
	b1u7zxswRc3YcslYpEguMZemtZ8ZSPcqasIf2lkFQBMQTFA/S6nnzbh0ynsuRo9CyxW72m7k2Obse
	qe2Z0ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPFz-0000000HWDd-0QLU;
	Thu, 13 Aug 2026 06:49:39 +0000
Received: from mail-japaneastazon11022074.outbound.protection.outlook.com ([52.101.126.74] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPFw-0000000HWCS-2eWt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHN5kUaVU0bwx4ky9RKuuLXj3+kQzY+THSTzFRg2lmantT8YAD7Ojl5mpLouY5tVtJ5X7lAi4rxJDYy75zZH5MgigDf6WlEQJUTf2rlCkWzEtyDTm4zKht9V+FZr4HLg6wMPIcyyoMI72jS/PVOr2sZKwXgw2U3D9Kn4YKd+EnukBR7q2BLGzcT7SpeLA3TN3L5vcSj0j/HcxrFFPRUYCIOP5c04kPTXcZcfpcBf6XtzFTB3P/ZCkCp+RiJDLcW1kd45Tvj+zf3c3qy+ExuHtDDxLWrSgpSyt/m3/fZxgVdmStIemngnPiKv8pse2f6hT/zih17JoPW84Oy7VQbiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAytpAStCJKiuOCJzw5oNMGnZrV9oJhIJw/gffo3bsg=;
 b=DGcTtESCe/GlXb/8s3DSdxaAtFBJd8lbRdId4luVEdZVbGtKijhyV8sdl3B6JnpUc5rpqr9Ex7O0HicRdmXtNguR4R5jzfskPvT9uI1tirIDfJOPwAEFl7TgX6rc9Gg+eYtsZj50Q9uhF6igSwrw+4DgP7P3tOF0+6cvLCqT42DyZgojaE35swraVKtIv+iY+dyeEIoipXd4FFbxE9T8De/lU+1XJcvxpkhlG2Ga0g8o3eqJ9gz/wil7j0t0RUZq+g2+jK/vQmA8B+56ZM52b1onMsruUMf3YqoUuKoCIv76k1avs/sIg60GO+hehTuK6mENhph5q+rALw91l+/vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAytpAStCJKiuOCJzw5oNMGnZrV9oJhIJw/gffo3bsg=;
 b=RBIr4ilZuNcIBJdUuMeU0cEBdN6X43e+WKUohWYpDcg1QnFX1RHKcm3SL8LdAhGdKNsg6NMJ8dAZYSgPe/mW3LZalWY6C3Se4ba/1jeR36QVs9vALoHlF/sKm8A/GBaT4p5sXcpijiTHJYY5JJHcIxeQ4ae1oKhf8xwOHegiMh8=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by PUZPR04MB6843.apcprd04.prod.outlook.com
 (2603:1096:301:107::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 06:49:29 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 06:49:27 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v2 1/4] arm64/entry: Make debug_exception_enter/exit()
 noinstr
Thread-Topic: [RFC PATCH v2 1/4] arm64/entry: Make
 debug_exception_enter/exit() noinstr
Thread-Index: AQHdKu/iC2e7eLuM3kKrBa9eTn+jAA==
Date: Thu, 13 Aug 2026 06:49:27 +0000
Message-ID: <c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com>
References: <cover.1786603168.git.hongyan.xia@transsion.com>
In-Reply-To: <cover.1786603168.git.hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|PUZPR04MB6843:EE_
x-ms-office365-filtering-correlation-id: b177476f-804a-4a95-04a5-08def90704ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|38070700021|10067099003|6133799003|11063799006|56012099006;
x-microsoft-antispam-message-info: tdu829Iu7ILoVEqLb8xdFWubLIAVCPK8b1LA7vAMsXKoOIgJoN+C8ZJnPAUW1q7S68RTTYAgGkZ5SCZWfqhJFm5W7iqLbdwHJrPrbDcgDB6IFdGNdvto4aGyO4uNXeS2u7JaOx/W11BU5NnZ+BolaMjF1Dbf3Y8x+9azKV3MVbDlE5JIoft5bUOClrvjLjr4daCiaMjBX47hlUfBageBA77RQtpfBQUgPft7DhCRgiT8in7yRjS3QyEVcClqvVoAfb5Tq7YB004WCiBnYWzzx6rNohDTGd6O6xdZ7fnrDYA006Ko5hatZfqud452Su3Rsec1CyH2PklX6INC3OBFm5SUWTGtx4ZMsfGsqPv3Yy+abi0wGuRfD91BkMhRhThNObodQzJC1EQqtmpwdLfOtBxhWv7vJXvZoHE/JofEECqImloIcli0yDyj5CJyBCo/2MVj0XiPz0fk0onQ8UUw58Osn/T70taDdzz/aoCSYczDZZE4ODoKdrpKleOJU+NMbqpKPmttpgiybRcYqFQy4U2MqzbMeCFGFSUYmFqJdQKI6lY3pRWFaG0HrlFhZHaL71OdXa37vN4KOuSJB0VKJVkAUIZfaWAJvnh9ROcRL/nD1zOsv6TwOm7vqYW6a/2EWXShCz7rWPlmqV4JNjUEPP2ADIzfE0KGnS5EMMiFQ+xuT+gfOzBdFJZbMYcOOyGz4ymQcSx3l828YRrGaf3EqSWH50kKeswwhHVtquWdfN0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(10067099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnY3aGF3aFhEaXgwY0FEM09QNjk4eVlnL3FWenhKaUpDM25wdUlNblJyNTRU?=
 =?utf-8?B?cXB1Sm1UV1pQM0Q0RnZrUjAwYzlZYzZCNlBmck0vMENDTGNYSzJHVW9pTEEw?=
 =?utf-8?B?M1hqczZ5WFRYYWV5VGorcVM3cFVOa0ZnV3ZXMFNPQTk1WTF5Ylc5MklhVUF6?=
 =?utf-8?B?eTAyWWdzUDhWOENSdFNkZFVvRDV6K3pWUkJvd25sK3hZZkNSZTIvNSt4UEEr?=
 =?utf-8?B?dEhkREh3R0JrSWdhem9CY0ZUa25hditvYnRzbzR5YXhJVzZ3bi9lZVdCZi9z?=
 =?utf-8?B?RFd0cEw5S3BKUXNXRXd0YWJJNG13VU9pVjdRRVpvQUt0UjN1d0FUTlIxZnlk?=
 =?utf-8?B?aGsvL0NTWWNSTGVKYmpURE9QcmpPOVRwWXFlMXJNK2VpbFV3Z1BjeFl1RGFH?=
 =?utf-8?B?ZTRFeUd2L29NVkZNZGJ2ZlM1VE5iY1VZMEtQUWk5eXhYNzRoVGlsWnd3TTNk?=
 =?utf-8?B?elh6ZGFjcmJYUTVDV1JNNU1heVFadjFhZUNrRC9xWkxReGpFdTNJQ1NNT1dQ?=
 =?utf-8?B?M3pHR3VuU0E4SFB2WEJFUDNKcFFZamlzN0NFUWtzdDVQb2JjV29LWWFJVkZi?=
 =?utf-8?B?MU84NDV1NHRjV3JJMTBGZi8zYkVUUlBHK3hkaVJFYTdvRUszbnFENHlLY1dQ?=
 =?utf-8?B?OWVaeU95NENkb3B5UkYzYXB5bTcwYkNycGVkNXlBK2c5dXVOT2tDSHpIanY4?=
 =?utf-8?B?SU0yYWx6MUNtMW5YdWRxZHdFYzVKUG5NOFFJVkk0T1BQdEx4WE1Nd0dDSWd5?=
 =?utf-8?B?ek1WOGQ4ck1NdW42Nzk5VytoL3ZscnZOdGxacDdLak5xdWpkL1hvOWlrRmFR?=
 =?utf-8?B?T04zbk1LWlNSeXZhOVVvSlhSSTN3M0pPUWp0b3AyeS9JOTF3RUlxV0ZYMUVJ?=
 =?utf-8?B?ZzBTWDAzSTEyakljQVdYL3RBNW8vMDlyZlIvUFMydWxybXFac1VOVUxVZVdn?=
 =?utf-8?B?T2ZlemRYdmtQcllkbys0OEFHWDdNMWlqN25KcVQwTmJRc3I5TDFTYWlmVmhs?=
 =?utf-8?B?cjBLRnhaN0haREtOK3MxUkRRZFl6MG42WUZjRHloTHAyZVRSNjNxNzZUenJG?=
 =?utf-8?B?M2VxeWJ0K2l0cTBOejlxVTJRVlNWd0htMURwQ3dRUUlsTlpsSVRIR1RZTmdn?=
 =?utf-8?B?UVM0L3hmZzRqc05sVEFMSTE4SS9WeVJzYTN0K0Z3NEwzWWRTR0hJV1UzWHNy?=
 =?utf-8?B?am50aTA1NUk5bXVuWVZvTWY0Vlp5Vm1IOS9icTBYR3RnSFg4ckJtS01OV0lo?=
 =?utf-8?B?NGVtdUJraklZc3h5WWRsSDhja05HMUtBUjZyeGh1S29KNlN1ZFovODZiL254?=
 =?utf-8?B?OXlieVV4QTBnOVNRa1d3ZWZ4TnhZUkJtMElOM2JPcTVpS0VVWlJIT3dQMThY?=
 =?utf-8?B?NkhpMlNmbzRqb3RPYXF1MUlMM2JHV2JhaS9TeDUvaU9jUWpuL0x5blZyUXJT?=
 =?utf-8?B?U3VzajA2N1NXVG1qZldQdzM5cFkzR3NzcVhMTWZWb0g0MHdCNXRNYnFYanhT?=
 =?utf-8?B?TU9CdUVqYjFLdm5INHhwaURPWjZveHpWdURKZ3RXUnYyY1lsZGdXNm9reVBv?=
 =?utf-8?B?a2RWbjhLOFpGaVI1S2t4NUtFVFpFQ3lHdWoxN0hGOTZQVHBmRGRMSzE1QW5o?=
 =?utf-8?B?b1dJZHFkTlN1VWFUbmU1bHpwR3JKbUlFZ1JhWFJsc2xZaGFzazFzR2F6VGVF?=
 =?utf-8?B?Q2VqN09rK1F0NmlXalFIcW9XbFhrNHB6QkdzUHJabHJuUmJKSjIxQ05xQmhz?=
 =?utf-8?B?bXhZQVJpVVBUNTkya3hqbTJRU1VybnhOeHdWMWprcUtBaWtYRmFMWlhCOGJa?=
 =?utf-8?B?M0RyUjZyTFR2RDh3SW41b1RZczNZai93aU04RzhHS2NSeld1ZkFOZWlUMlZV?=
 =?utf-8?B?VHV0amQyMmVFYk01MktpMUdUOUVoRlFWWjdhSjByL0RvUXl5QStaeDRjc1Jt?=
 =?utf-8?B?VlJLWmdrZFNmcFQ4WTRYbXkyVkVyMk1uNFZpMWNxenAyOVpPUm85NzIxdjBS?=
 =?utf-8?B?TGkzblg3MXpZcGxzS3gxakFWNzRRQ2pHOHBqNXB6NDF3NzNqNlZ6ZVZ4cXZB?=
 =?utf-8?B?K2lTRWdrbUs2MldmL0J3U0J4U1M2WFFjSFlFVE5IWlZ1KzlhRml2QzJxa29R?=
 =?utf-8?B?NVdIdjFPcnBqVFFLRSsrSHhHZ2NtOUp2cFY4WGkyK21pdjIxSkVPczVkVG9o?=
 =?utf-8?B?dERDWHJ2WHpqVDk2TFJEN05HRVNiZ0ZJMVdMb3BCS0k5SlVMYXdqYjJlLzNs?=
 =?utf-8?B?NmdYeEhqVE1kWGdmeEZUTjl5RVJDTlpqUGlKcVlrcXdkdS8vLzJKVzM0WUxk?=
 =?utf-8?B?SjNiR2JuVTdnTlN6UFJsNFpHTVFjTzlHRk02bWF0M2Z3bWlkS3hDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b177476f-804a-4a95-04a5-08def90704ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:49:27.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9H6r0UDPnlbLPZsy8CGQkWKFqLEpiXw3gyQsKWVfDnf1W/A5BLvZwPkXyo6Y6ETYwIfz72Y3F63JC7UCMxa0vKiEDhZsp7cE8/qZXl/G3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_234936_682402_1A4E6B89 
X-CRM114-Status: GOOD (  13.99  )
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+CgpDb21taXQgODc5
YTY3NTRkM2QxMWUzMGFmMjRiN2RjNDg2ZjU2MTUxMGQ2MjY0MSByYW4gaW50byBhIGNyYXNoIGJl
Y2F1c2UKZGVidWdfZXhjZXB0aW9uX2VudGVyL2V4aXQoKSB0cmlnZ2VyZWQgcGFnZSBmYXVsdHMg
Y2F1c2VkIGJ5IHBlcmYgZHdhcmYKY2FsbCBncmFwaCB0cmFjaW5nLiBUaGF0IHBhdGNoIHdhcyBh
IGJhbmQtYWlkIG9uIHRvcC4KCkluc3RlYWQgb2YgdHJ5aW5nIHRvIGJhbmQtYWlkIGFsbCBwb3Nz
aWJsZSBwYXRocyB0aGF0IGNhbiBoYXBwZW4gZHVyaW5nCmluc3RydW1lbnRhdGlvbiBvciBwZXJm
IHRyYWNpbmcsIHNpbXBseSBmb3JjZS1pbmxpbmUgdGhlc2UgZnVuY3Rpb25zIGFuZAp1c2UgdGhl
IG5vdHJhY2UgdmFyaWFudCBvZiBwcmVlbXB0IGhhbmRsaW5nIHRvIGF2b2lkIGFsbCB0aGUgY29t
cGxleGl0eS4KCkRyb3AgdGhlIFJDVV9MT0NLREVQX1dBUk4oKTogYXJtNjRfZW50ZXJfZWwxX2Ri
ZygpIHJ1bnMgZmlyc3QgYW5kCmVudGVycyBOTUkgY29udGV4dCB2aWEgY3Rfbm1pX2VudGVyKCks
IHNvIFJDVSBpcyBhbHdheXMgd2F0Y2hpbmcgYnkgdGhlCnRpbWUgZGVidWdfZXhjZXB0aW9uX2Vu
dGVyKCkgcnVucy4KCkFsc28gbWFyayBfX3ByZWVtcHRfY291bnRfYWRkL3N1YigpIF9fYWx3YXlz
X2lubGluZSBzbyB0aGUgcHJlZW1wdApjb3VudCB1cGRhdGVzIGZvbGQgaW50byB0aGUgbm9pbnN0
ciBjYWxsZXJzIGluc3RlYWQgb2YgYmVjb21pbmcKb3V0bGluZWQgY2FsbHMgdG8gaW5zdHJ1bWVu
dGFibGUgdGV4dC4KClNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWFuLnhpYUB0cmFu
c3Npb24uY29tPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJlZW1wdC5oIHwgIDQgKyst
LQogYXJjaC9hcm02NC9rZXJuZWwvZW50cnktY29tbW9uLmMgfCAxMyArKysrLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcmVlbXB0LmggYi9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3ByZWVtcHQuaAppbmRleCA5MzJlYTRiNjIwNDIuLjMyNmYyMjFjM2Y1NiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcmVlbXB0LmgKKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wcmVlbXB0LmgKQEAgLTQxLDE0ICs0MSwxNCBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgdGVzdF9wcmVlbXB0X25lZWRfcmVzY2hlZCh2b2lkKQogCXJldHVybiAhY3VycmVudF90aHJl
YWRfaW5mbygpLT5wcmVlbXB0Lm5lZWRfcmVzY2hlZDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lk
IF9fcHJlZW1wdF9jb3VudF9hZGQoaW50IHZhbCkKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBfX3ByZWVtcHRfY291bnRfYWRkKGludCB2YWwpCiB7CiAJdTMyIHBjID0gUkVBRF9PTkNFKGN1
cnJlbnRfdGhyZWFkX2luZm8oKS0+cHJlZW1wdC5jb3VudCk7CiAJcGMgKz0gdmFsOwogCVdSSVRF
X09OQ0UoY3VycmVudF90aHJlYWRfaW5mbygpLT5wcmVlbXB0LmNvdW50LCBwYyk7CiB9CiAKLXN0
YXRpYyBpbmxpbmUgdm9pZCBfX3ByZWVtcHRfY291bnRfc3ViKGludCB2YWwpCitzdGF0aWMgX19h
bHdheXNfaW5saW5lIHZvaWQgX19wcmVlbXB0X2NvdW50X3N1YihpbnQgdmFsKQogewogCXUzMiBw
YyA9IFJFQURfT05DRShjdXJyZW50X3RocmVhZF9pbmZvKCktPnByZWVtcHQuY291bnQpOwogCXBj
IC09IHZhbDsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL2VudHJ5LWNvbW1vbi5jIGIv
YXJjaC9hcm02NC9rZXJuZWwvZW50cnktY29tbW9uLmMKaW5kZXggY2ViNGViMTEyMzJhLi5kNWMx
ZDZkZWZlMjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL2VudHJ5LWNvbW1vbi5jCisr
KyBiL2FyY2gvYXJtNjQva2VybmVsL2VudHJ5LWNvbW1vbi5jCkBAIC0yOTIsMjAgKzI5MiwxNSBA
QCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgZnBzaW1kX3N5c2NhbGxfZXhpdCh2b2lkKQog
ICogYWNjaWRlbnRhbGx5IHNjaGVkdWxlIGluIGV4Y2VwdGlvbiBjb250ZXh0IGFuZCBpdCB3aWxs
IGZvcmNlIGEgd2FybmluZwogICogaWYgd2Ugc29tZWhvdyBtYW5hZ2UgdG8gc2NoZWR1bGUgYnkg
YWNjaWRlbnQuCiAgKi8KLXN0YXRpYyB2b2lkIGRlYnVnX2V4Y2VwdGlvbl9lbnRlcihzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBkZWJ1Z19leGNlcHRp
b25fZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JcHJlZW1wdF9kaXNhYmxlKCk7Ci0K
LQkvKiBUaGlzIGNvZGUgaXMgYSBiaXQgZnJhZ2lsZS4gIFRlc3QgaXQuICovCi0JUkNVX0xPQ0tE
RVBfV0FSTighcmN1X2lzX3dhdGNoaW5nKCksICJleGNlcHRpb25fZW50ZXIgZGlkbid0IHdvcmsi
KTsKKwlwcmVlbXB0X2Rpc2FibGVfbm90cmFjZSgpOwogfQotTk9LUFJPQkVfU1lNQk9MKGRlYnVn
X2V4Y2VwdGlvbl9lbnRlcik7CiAKLXN0YXRpYyB2b2lkIGRlYnVnX2V4Y2VwdGlvbl9leGl0KHN0
cnVjdCBwdF9yZWdzICpyZWdzKQorc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGRlYnVnX2V4
Y2VwdGlvbl9leGl0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewotCXByZWVtcHRfZW5hYmxlX25v
X3Jlc2NoZWQoKTsKKwlwcmVlbXB0X2VuYWJsZV9ub19yZXNjaGVkX25vdHJhY2UoKTsKIH0KLU5P
S1BST0JFX1NZTUJPTChkZWJ1Z19leGNlcHRpb25fZXhpdCk7CiAKIFVOSEFORExFRChlbDF0LCA2
NCwgc3luYykKIFVOSEFORExFRChlbDF0LCA2NCwgaXJxKQotLSAKMi40Ny4zCgo=


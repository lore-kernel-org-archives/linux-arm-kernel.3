Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0991C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6BguF3YTV7VEaQXDkI9K9hhOUk6uAuZ9WClmyqYiZ4=; b=TVMDS095UpQ7Tc/ykoeTMRhSq2
	njkvJehfJaNVSOneR1Ysys3nSMPX3BGg7GyP5JUfVaELaxSlXLHv0j6QRzrhnymSl5VdrXNJVLPo3
	TJmtlZXWh4oS8V3GK45UIF/uTvl1qI1igxKAB5LIKQoBYdLuqMOz+SY63WNXgN/yC2ZRcv5iUme/3
	ySPB6Odk0H8tk71KvYA4YEfBw56LIzTAxOl29FPo0yGod1EI1BFkHMs5/r/ewEK5VkkoW7msUbfWy
	jBucKm3zf38b0VSRCP/CDYww1ZWy4pqraL6uZ7QEO46hfUB7vWPIiRRoXuiBAgNUNF78uJqe6Brwu
	mIBEusGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXwf-00000006F0a-1jaX;
	Fri, 03 Jul 2026 07:04:17 +0000
Received: from mail-northcentralusazon11013023.outbound.protection.outlook.com ([40.107.201.23] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXwY-00000006EyT-1UDJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 07:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIeVaoHRLYcdR0D9Yb3N9C2XzLh6HVRIeNS/d0GCw7DR7APzV/fN+n2pIN0Uv9y+uF3QUrwBgUk6rYp6gLuVodf+jQmgrVrTifnFly4ZL4WcCAytVhAYvb5yRmh1NYpxGRk8CCq+chUQplDM1tEASoOhAFYQjScyCyidhrel66eE4lbrTPUqqhQhBkeJ0xXA0HzNTJKoZtSs8zRfAauIyuO40j1NkqXXBzITeqaQceVKWis/lsH0Z+AwqhqD8+DuG9RsDATozkM9gNrjrCGUM9+ywQGWpBgdukF3KG0M29CLkZmyT9xRUCVo5OndQzmA+FJA/0NWLjTaQfYXMzg7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6BguF3YTV7VEaQXDkI9K9hhOUk6uAuZ9WClmyqYiZ4=;
 b=PdGI7TW05toSRGoqoYkeCD7w+GeSw0RDHVMDvn44yYIZbqbrBB5qYVp1Cg3PAqkme0lhQXnLhue31koLx5dUxtngeNpkuEhLj+q3BHkEBg9UbZW51gEzBM6NRj7RcD36sZVISrYNGzENULCxHOcUnseebhJM90ua+33bcBRCJKwn/4eGMGvs+6kPwphrTfrIWtac8vPvLyQCh34hkDwiwhxbC8JkJL0mYNhs+ZBERZQMzvDopenUxLrB8B36eUp+npgx/QpXu3MwjKTnqDH7hsavqlPCwYQSVV5KQnPmosc+yhJId8BxsSkhz4nTjuZ9bW46yppK7aDNuqX2sTGLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6BguF3YTV7VEaQXDkI9K9hhOUk6uAuZ9WClmyqYiZ4=;
 b=oCev8CPtLqZWZlLZ8yxnDf6iSyRbVhQW7uyaDNX7CdQAADuE94nf+9S0UDcqUWCemaIqYz9HfrZwthwYfU+duph2TQB8D0THfsZtXmJJPweUHOyFbfMfUpxEs6yEW9RKy3T3m2sv2VSkIgWOmcy9YqOesVsG7LHXxnsVYfsTBul3zuWt/DcDXaowyggqRz9POzJEW392EwBcQi/VZD6IOBXKmaveUlHNr9aI3Z4ZkeEhhMQYN0oU0PxrwuA8K5xWxxOs8JiQWittffv0osZGrNKFFdJOG1RsXFEqY56/UqunFdyVQER7TTnDm1uFyiWr0RyEQFtUt23X+GhZBlx8vA==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN4PR03MB989337.namprd03.prod.outlook.com (2603:10b6:806:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 07:04:03 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 07:04:03 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "dinguyen@kernel.org" <dinguyen@kernel.org>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2
 board
Thread-Topic: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2
 board
Thread-Index: AQHdCJS3eKbhTF393kOGxrO3eujj3LZXH+EAgAALkICAAAzEAIAAr76AgAC2g4CAAsSkAA==
Date: Fri, 3 Jul 2026 07:04:03 +0000
Message-ID: <b8ca3bd8-af8f-43e7-904c-1ac45512296b@altera.com>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <edf84080-a5e0-478c-9977-af2376cb71c5@lunn.ch>
 <347c50ed-234a-4f29-b63a-1e0010c6b09d@altera.com>
 <e4cf8d95-0467-4bdc-8e19-228ced3a8bbc@lunn.ch>
 <5a0c962e-1af0-4d6a-b871-d8a0b0197ff5@altera.com>
 <d70a6795-e1a2-43e2-b523-0fc668324674@lunn.ch>
In-Reply-To: <d70a6795-e1a2-43e2-b523-0fc668324674@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|SN4PR03MB989337:EE_
x-ms-office365-filtering-correlation-id: 20e9737d-221d-4d6d-ddb6-08ded8d14423
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|3023799007|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: Fc1P/TSngautZB+daHV3FCoIJcgP+KOAFnCWlvRIHLDiRgHHRik3jzSw933q4jGn8MZRJ0qjttvzFOKAIyA1hJqqNG7a3S3fgqid8B3mtc8tnK6VJcIDH63qZ7AhALpGNUbhOga0TfRBffZyqjGBwb9EuTNz71QXc9Vr4sR6M6p7pPyMHwtWyyvMSMHubA4lP7SHuwI91q8wjVAGjTz8JrH6fKa+lD2YZcJvjv76NfDB59VDODA8I6LvPrZIvQFsjfvj5tCKv4wp8wYgjkHdJUCDLncKU5as2s5WLVCnmOYRgFOMq1FbGJNwjZwJtO7UYD5OWBHORug2X6gxeMfgqGbDPdd0wPEfm5qIfJbDX1XhiSqVjxoi2VD7bT6XLAcnJqPyZ0Vs0HxrYvdylGoXE2KwLY5z4x+h/7Svle0Am6B30jFQrgHpOt1nKHsHagHlRPlycDiJGltTmhJbZEsG6HUj1/I32SVqsHxjjH9Zfnrpubda7BAIgpxYarQB0pjHhOdjQ73PKAdbRvYzXHbylSJQ2ubI3IZ+ILUcxKoa2qK6xMXf/EFv4ASAO7LzR45C/uZroJ1wkQPIsUnM3fUN7fitBTIaqwh9d0VmQvL7+RPyCoyODPMK9S9Livuu6PIZ977O4pvxng5Bl7iaZhqgW9wCw8bPjauabJxmnlWHFnydRLbxoPP4TRH6dTZdpm+DN+4fVRlnZbUziXh/9zeJJJBdn6b3u1sr4VjSikISjPU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(3023799007)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0tpWjNVQ3dpQk9vZmJYSC9Gc0NKT2dmWm1ReW5JckdMcjVsU3k5M0ZoY3lV?=
 =?utf-8?B?c01vWlNQSWVtVFVUYzUyR2JFd29pcWswRHJSUnlVbkdnd0phZ0N2Zmd4T05n?=
 =?utf-8?B?aHZaNDFZNXBOcGtxS1NIYWZjMlQ2SExTVERvOU1kYjZXK3liUVphaERMY0Fy?=
 =?utf-8?B?T0gyVUFZQlYvb1ltVzdveU10TEJ1cjJwREwyL3hVQ3dydHZuNVk3b3BhNVk1?=
 =?utf-8?B?dHg1Wm9Vd1JFaGpWQVdLMzhHTVdvVnA2MzY1a2FQQ2NnRVhVQTVUZGdFMVBC?=
 =?utf-8?B?b0xoUDBxckVpK0NBdmpjSzAxQiswUTIrTHNtMUZiYUIza3FtRHVIWS9jeEN2?=
 =?utf-8?B?L0ZCRkJNb1duTi85M1VqZGpyOVJWc0NSQUZOU3ZUbmkyVTBJWnhYTGlYRWFa?=
 =?utf-8?B?Z1M4ZWVaL0VZU2dPQnU4RTBCV0psWjF6dWlYYmh1c21aSEdFNUo5OFpTc3cv?=
 =?utf-8?B?L2hkQVNBWDJnMjNycWwwTmZkcndOQjVGb1hBb3dTcERPeEQ5dWhmeC83MGtB?=
 =?utf-8?B?Mko3K1ZvTExNYWhWRDZxTFhqdXRqRFJCRUtqL3dIMkpqa1Rac2RjUWgwa2Qw?=
 =?utf-8?B?WTUrSDBBQ3NSSElFSlRybmt4OHg2TzIwQVZRUnNSanFyeS9xMkZNQkJ3WmVL?=
 =?utf-8?B?UGZjMnZ4YzRjOVptbmdCNnlHRTQydkxRa2tTdFhpMmRpMEo1Ylc5MkN2dGZt?=
 =?utf-8?B?UDB5d25NYWNZUU1iMTBCaVF3QldyZHI3Tm1DZVVuN1Z2RnRncWJnY1l5akdk?=
 =?utf-8?B?elpMNFhjUVAzNWo3T3drNC85NkJWRC8vRHBSQVluMWdwaFpiWGpYem81Qm91?=
 =?utf-8?B?aHV6Ty9HMzNsU0pQUnNZdUtkWFNDdExvR3JjRWlCQWF1b1dVcEpyaWFTdzln?=
 =?utf-8?B?UjJEQnptMm5pVndOMVdXK1dRMjVwMHFpNi9McDhNZHo4cXNlS0tNbXpnYjRQ?=
 =?utf-8?B?TEtjemJPUU9TcUpaUjQ3TXlsbzN1clIrSTBJV1VlcFpKY3lDclh2L29jQ0hD?=
 =?utf-8?B?dnlyb1FBOVFWZElHMzdTYjZuZ0RNRkZ5WWJZQ3FJdEN2Sk91cFE5MXVWc3Iy?=
 =?utf-8?B?ajJDV1lZdUF3Z2hmZTJzS1l6dmE0MUJoa1VrckJkK3U1R0haY3VqVm9KK3M2?=
 =?utf-8?B?K0VZd2Vtc0g5dTd6YzlobkpENTF0alc4WFp6TUdpcEVMdytmODAwS3g3SkNt?=
 =?utf-8?B?RkQ0M2REbTFmL0MzNkJ1L2VHTFhWTXJmZGRkRlBxMnQrMjhtdkQyQ1p3WkhV?=
 =?utf-8?B?bTFUVUt1R2FDcytiaFU3bVNaNEpPN293RTVLZVhNaDZBODdMWXNEek5lTFJ3?=
 =?utf-8?B?NHVsaWxyUlVqa0JJRGlkZlVBRFJQUUNISEZXV1VnOXJkUWkvK1BUZHIwRy9L?=
 =?utf-8?B?WWNRcUtuK0pEMVJsTEt3TUorblQ1OHNLVjdoL2syMDcrTFptRklobGxwN09N?=
 =?utf-8?B?dTFCWFRhR28zMjZpb0w2dVhjVnhMcE94Zi8vYkZ6YmYzVXJLamxrZ3IxUW52?=
 =?utf-8?B?bjlEZjFBd3Vld3orK2ttY2l2bHJWeDJYS2NZQmNtbVRnYTlVUEN4L3E5RHIy?=
 =?utf-8?B?UTJWUS9yOEhFSi9yVFgwNWVFaFF1dGEzT2hiTkEyZHRYblZHOE1QRnZOS2NO?=
 =?utf-8?B?eFJNdVBUN3lUcHdDVkt5dWd0L2s5UTlnbkx2dmh0K09oODNyRTBSNGRVWDhr?=
 =?utf-8?B?ZmIvSlFJMDlxYkVxWlRYczllVjlES00xalZHS0RNWHQyZFRieU90UHh6OGt4?=
 =?utf-8?B?VDlkaVJvNHUzR2Y5ZHpzZHlOSXd1MUhjZldXOS91YVI4MEQ4a3FqOUpNWnFm?=
 =?utf-8?B?Y0RnQ1dOSGRLK3orSHp4TWNOVk5SLzNxS3lJenZjeEhzMm9tYUh1c2tTTjMr?=
 =?utf-8?B?WGI1aVVZQmVPeDBocWozTVZKRXU2MzhxQ0pIQmFaNkhXamdWTVZja0R4RXhR?=
 =?utf-8?B?Mm1Za1h4b05hd0poNVJ4bHU0Z3EyTDBzUk1sYi8yT0tlTnFXTUxoZldoazNy?=
 =?utf-8?B?cnhsV2FIeVIyUjdTMHBNQ2MvSHFOS3dwYmVCaTcyVXA1ZWQ3SVZCcU9uYXBU?=
 =?utf-8?B?TzlLMEVCV29VdmNFaDkxZk82R0oxdWg3QUlNUjhtQnpJekNMQmlKak85SHky?=
 =?utf-8?B?R00xUHpPMTNacTFrMmUza1M0cWZBemRJQXNLaUJXc0RSYStrcjJZOEduT1ZF?=
 =?utf-8?B?VkEweEsrRHc1N05sTlo5ZWluTG4yajFTRzBLdlJsaGg5UUppa2pDMmFPc0xE?=
 =?utf-8?B?RFI0SytVTVVTSDkvUitMYXBrVFoyVkY2MGJPdGhqUDAwYVIwVUx5Q09KNG5D?=
 =?utf-8?B?THNsUmZJalpGMHcxMHN4c1JjbDI3U2dSK2k5QmNncFJDd1pUQXUxZGt4cWgv?=
 =?utf-8?Q?Up/6QyvISC0tk5Xs4NYaZ2LA/AojfqpvUS1vVVwO8NCNy?=
x-ms-exchange-antispam-messagedata-1: VDvg8uCxH1WOqABa2SrOXQ6vtfSsBDyAdOU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DF5CE1F53B93C4E829A325D1439C8CF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e9737d-221d-4d6d-ddb6-08ded8d14423
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 07:04:03.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWw2oQWTXzxsDvB43hzN/36dNDIAO3MFpwIDS4KlgtTq73oHAsaqt50kG2w9g+XpuhNNyB21/4eESTG6+M/fLUHBDXWDH5WSGMDkrt164DWhQlWI9ETTwnh/vycouwmIeuJZkDWAcP/gT4f2j79KDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_000410_449971_7BB3A60B 
X-CRM114-Status: GOOD (  25.36  )
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

T24gMS83LzIwMjYgODo0NyBwbSwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+Pj4gIyBUaGVyZSBhcmUg
YSBzbWFsbCBudW1iZXIgb2YgY2FzZXMgd2hlcmUgdGhlIE1BQyBoYXMgaGFyZCBjb2RlZA0KPj4+
ICMgZGVsYXlzIHdoaWNoIGNhbm5vdCBiZSBkaXNhYmxlZC4gVGhlICdwaHktbW9kZScgb25seSBk
ZXNjcmliZXMgdGhlDQo+Pj4gIyBQQ0IuICBUaGUgaW5hYmlsaXR5IHRvIGRpc2FibGUgdGhlIGRl
bGF5cyBpbiB0aGUgTUFDIGRvZXMgbm90IGNoYW5nZQ0KPj4+ICMgdGhlIG1lYW5pbmcgb2YgJ3Bo
eS1tb2RlJy4gSXQgZG9lcyBob3dldmVyIG1lYW4gdGhhdCBhICdwaHktbW9kZScgb2YNCj4+PiAj
ICdyZ21paScgaXMgbm93IGludmFsaWQsIGl0IGNhbm5vdCBiZSBzdXBwb3J0ZWQsIHNpbmNlIGJv
dGggdGhlIFBDQg0KPj4+ICMgYW5kIHRoZSBNQUMgYW5kIFBIWSBhZGRpbmcgZGVsYXlzIGNhbm5v
dCByZXN1bHQgaW4gYSBmdW5jdGlvbmFsDQo+Pj4gIyBsaW5rLiBUaHVzIHRoZSBNQUMgc2hvdWxk
IHJlcG9ydCBhIGZhdGFsIGVycm9yIGZvciBhbnkgbW9kZXMgd2hpY2gNCj4+PiAjIGNhbm5vdCBi
ZSBzdXBwb3J0ZWQuIFdoZW4gdGhlIE1BQyBpbXBsZW1lbnRzIHRoZSBkZWxheSwgaXQgbXVzdA0K
Pj4+ICMgZW5zdXJlIHRoYXQgdGhlIFBIWSBkb2VzIG5vdCBhbHNvIGltcGxlbWVudCB0aGUgc2Ft
ZSBkZWxheS4gU28gaXQNCj4+PiAjIG11c3QgbW9kaWZ5IHRoZSBwaHktbW9kZSBpdCBwYXNzZXMg
dG8gdGhlIFBIWSwgcmVtb3ZpbmcgdGhlIGRlbGF5IGl0DQo+Pj4gIyBoYXMgYWRkZWQuIEZhaWx1
cmUgdG8gcmVtb3ZlIHRoZSBkZWxheSB3aWxsIHJlc3VsdCBpbiBhDQo+Pj4gIyBub24tZnVuY3Rp
b25pbmcgbGluay4NCj4+Pg0KPj4+ICAgICAgIEFuZHJldw0KPj4+DQo+Pj4gLS0tDQo+Pj4gcHct
Ym90OiBjcg0KPj4gSGkgQW5kcmV3LA0KPj4NCj4+IFRoZSBkZWxheXMgYXJlIHByb3ZpZGVkIGJ5
IHRoZSBGUEdBIEdNSUktdG8tUkdNSUkgY29udmVydGVyIHNvZnQgSVAsDQo+PiB3aGljaCBpcyBo
YXJkY29kZWQgaW4gdGhlIEZQR0EgYml0c3RyZWFtIGFuZCBjYW5ub3QgYmUgZGlzYWJsZWQgb3IN
Cj4+IG1vZGlmaWVkIGZyb20gdGhlIGRyaXZlciBzaWRlLg0KPj4NCj4+IFVzaW5nIHBoeS1tb2Rl
ID0gInJnbWlpIiBpcyBpbnRlbnRpb25hbCBoZXJlIOKAlCBpdCBwcmV2ZW50cyB0aGUgUEhZIGZy
b20NCj4+IGFkZGluZyBpdHMgb3duIGludGVybmFsIGRlbGF5cyBvbiB0b3AsIHNpbmNlIHRoZSBG
UEdBIGNvbnZlcnRlciBhbHJlYWR5DQo+PiBwcm92aWRlcyB0aGUgZnVsbCByZXF1aXJlZCBkZWxh
eS4gVGhpcyBpcyBjb25zaXN0ZW50IHdpdGggaG93IGFsbCBvdGhlcg0KPj4gQWdpbGV4NSBTb0NE
SyBib2FyZCB2YXJpYW50cyBhcmUgZGVzY3JpYmVkLCBhcyBzZWVuIGluIGNvbW1pdA0KPj4gYzU2
MzdlNWNlYjRiICgiYXJtNjQ6IGR0czogc29jZnBnYTogYWdpbGV4NTogRml4IHBoeS1tb2RlIHRv
IHJnbWlpIGFzIEhXDQo+PiBwcm92aWRlcyBjbG9jayBkZWxheSIpIGFscmVhZHkgaW4gRGluaCBO
Z3V5ZW4ncyB0cmVlLCB3aGljaCBhcHBsaWVzIHRoZQ0KPj4gc2FtZSByYXRpb25hbGUgYWNyb3Nz
IGFsbCBBZ2lsZXg1IGJvYXJkcy4NCj4gDQo+IEkndmUgYmVjb21lIG1vcmUgaW5zaXN0ZW50IHRo
YXQgZGVzaWducyBnZXQgdGhpcyBjb3JyZWN0LiBTbyBpIGRvbid0DQo+IGNhcmUgdG9vIG11Y2gg
YWJvdXQgcGFzdCBzeXN0ZW1zLiBNYW55IHZlbmRvcnMgYXJlIGhhdmluZyB0byBmaXggdXANCj4g
dGhlaXIgZHJpdmVycyBhbmQgRFQgaW4gb3JkZXIgdG8gbWFrZSBuZXcgYm9hcmRzIGNvbnNpc3Rl
bnQuDQo+IA0KPiBZb3UgY2FuIGxvb2sgYXQgeW91ciBzeXN0ZW0gYXMgdGhlIEZQR0EgYmVpbmcg
dGhlIE1BQywgYW5kIHRoZSBQSFkgaXMNCj4gdGhlIFBIWS4gVGhlIFBDQiBpcyBub3QgcHJvdmlk
aW5nIHRoZSBkZWxheSwgdGhlIE1BQyBpcy4gVGhpcyBleGFjdGx5DQo+IGZpdHMgdGhlIGRlc2Ny
aXB0aW9uIGFib3ZlLg0KPiANCj4gICAgICAgQW5kcmV3DQpIaSBBbmRyZXcsDQoNClRoYW5rIHlv
dSBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFdlIGFncmVlIHdpdGggeW91ciBmcmFtZXdvcmsgaW4g
DQpwcmluY2lwbGUsIGJ1dCB3b3VsZCBsaWtlIHRvIGV4cGxhaW4gd2h5IHBoeS1tb2RlID0gInJn
bWlpIiBpcyB0aGUgDQphcHByb3ByaWF0ZSBkZXNjcmlwdGlvbiBmb3IgdGhpcyBzcGVjaWZpYyBj
YXNlLg0KDQpBZnRlciBnZXR0aW5nIG1vcmUgaW5mb3JtYXRpb24gZnJvbSBodyB0ZWFtLCBmb3Ig
QWdpbGV4IHNwZWNpZmljIGRldmljZSwgDQp0aGUgUkdNSUkgdGltaW5nIGRlbGF5cyBvbiB0aGlz
IGJvYXJkIGFyZSBwcm92aWRlZCBieSBhbiBGUEdBIGRlbGF5IA0KY2hhaW4gKElucHV0L091dHB1
dCBEZWxheSBDaGFpbiBwcmltaXRpdmVzIGluIHRoZSBGUEdBIGZhYnJpYykuIFRoZSANCnJlYXNv
biBmb3IgdXNpbmcgdGhlIEZQR0EgcmF0aGVyIHRoYW4gdGhlIFBIWSBpcyB0aGF0IHRoZSBNYXJ2
ZWxsIFBIWSBvbiANCnRoaXMgYm9hcmQgb25seSBzdXBwb3J0cyAwbnMgb3IgMm5zIGRlbGF5IHN0
ZXBzIOKAlCB0b28gY29hcnNlIHRvIG1lZXQgdGhlIA0KUkdNSUkgdGltaW5nIHJlcXVpcmVtZW50
cy4gVGhlIEZQR0EgZGVsYXkgY2hhaW4gcHJvdmlkZXMgdXAgdG8gNjMgc3RlcHMgDQpvZiB+MC4x
bnMgcHJlY2lzaW9uLCB3aGljaCB0aGUgaGFyZHdhcmUgdGVhbSBoYXMgdHVuZWQgYXQgZGVzaWdu
IHRpbWUgdG8gDQphY2hpZXZlIGNvcnJlY3Qgc2lnbmFsIHRpbWluZy4NCg0KVGhpcyBkZWxheSBp
cyBmaXhlZCBpbiB0aGUgRlBHQSBiaXRzdHJlYW0gYW5kIGlzIGludmlzaWJsZSB0byB0aGUgTGlu
dXggDQpkcml2ZXIg4oCUIHRoZSBkcml2ZXIgY2Fubm90IHJlYWQsIG1vZGlmeSwgb3IgZXZlbiBk
ZXRlY3QgdGhlIGRlbGF5IHZhbHVlIA0KdGhhdCB3YXMgcHJvZ3JhbW1lZC4gVGhlIGRyaXZlciBo
YXMgbm8gd2F5IHRvIGtub3cgInRoZSBNQUMgaXMgcHJvdmlkaW5nIA0KWCBuYW5vc2Vjb25kcyBv
ZiBkZWxheS4iDQoNCkluIHRoaXMgc2l0dWF0aW9uLCB0aGUgb25seSBtZWFuaW5nZnVsIGFjdGlv
biB0aGUgZHJpdmVyIGNhbiB0YWtlIGlzIHRvIA0KaW5zdHJ1Y3QgdGhlIFBIWSBub3QgdG8gYWRk
IGl0cyBvd24gZGVsYXlzIOKAlCB3aGljaCBwaHktbW9kZSA9ICJyZ21paSIgDQphbHJlYWR5IGFj
aGlldmVzIGNvcnJlY3RseS4gQ2hhbmdpbmcgdG8gcGh5LW1vZGUgPSAicmdtaWktaWQiIGFuZCBo
YXZpbmcgDQp0aGUgZHJpdmVyIHN0cmlwIHRoZSBkZWxheSBiZWZvcmUgcGFzc2luZyB0byB0aGUg
UEhZIHdvdWxkIHByb2R1Y2UgdGhlIA0Kc2FtZSBoYXJkd2FyZSBiZWhhdmlvdXIgKFBIWSBhZGRz
IHplcm8gZGVsYXkpLCBidXQgd291bGQgYWRkIGRyaXZlciANCmNvbXBsZXhpdHkgd2l0aCBubyBw
cmFjdGljYWwgYmVuZWZpdCwgYW5kIHdvdWxkIG1pc3JlcHJlc2VudCB0aGUgRlBHQSANCmRlbGF5
IGFzIGEgZHJpdmVyLW1hbmFnZWQgTUFDIGRlbGF5IHdoZW4gaXQgaXMgYWN0dWFsbHkgYSBmaXhl
ZCwgDQpib2FyZC1sZXZlbCBoYXJkd2FyZSBjYWxpYnJhdGlvbi4NCg0KQ291bGQgeW91IGFkdmlz
ZSBpZiB5b3Ugc3RpbGwgcHJlZmVyIHRoZSByZ21paS1pZCBhcHByb2FjaCBnaXZlbiB0aGlzIA0K
Y29uc3RyYWludD8NCg0KQlIsDQpOYXppbQ0K


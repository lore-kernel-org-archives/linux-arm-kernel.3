Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02732D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjVj9rrjAucJZD7GLOnGmAjoolfWcgwC4VdjyJacLjo=; b=Z9E1KRCPJiLm7YGpYRrZFLku3j
	Y00vvTIZ2qGeBY6LLlB9612vG3Ya2HOq75zF2Vs+6+ilXg8Ynwm8fc4kYJRtlC1/zn/do/q1utCQa
	AwWaHDMuPj7KFegg1gUuOzGK7uZEMhy6rIUjparK7YjPFmgIYYaFmvoca0RyGN/pLHjmC9tRcSLBx
	2M2VhJhL6h8e0z+DFCBnGdnoiRqZX+gQrajtJ+Q+/Giwt4HCC5Rdc790yhiTzBQ3SSxJrxV9r5+ER
	wLbnLWU0a6qI2RjaOK12SK45p0n2uN3iN+TIogYFL1kruuyu1e7+5K8buv38K6MjoJOo/cyf481JS
	BVmA072A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsvK-0000000099S-03DF;
	Thu, 08 Jan 2026 16:31:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsvD-0000000096G-3Azb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCOMr7xoyhUasYcVFLcBbgNYjstuSwxm5IxnnrUO6pVCpyAX/6XXvTJ55CiJYQzMj+ZQbK6IxCvD53eeNJ6ujsWP/JAteQuDsFfstQeQnC1IJiHkqi8oWYT4XlXso3Scz4A+YJL2QTMuz98+L6xhE66BmdKilKz4nW7CVW+PZU19ynK1mdXypGer8tMjLQmQLmkwm42HvLNY+ltEGZ7Vrd2w7n5nApJJHVP2Z/4XPT2whX+wAu3J9zoyCxnZb/HY+H4trUTqNdlws9KFp+hahFTpeLVN7IzwGapXDh3FZHo3RqQr4yq31r1SAY2PBuFHf+tv00NsEBGmNSlRcc5tIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjVj9rrjAucJZD7GLOnGmAjoolfWcgwC4VdjyJacLjo=;
 b=ljR0VDMWfLzyVTTOR/62vQf2HkTDWbW39hDEH1uXzHxc64aQYwpjlHX/UkJYohLlTOZSmF3ROVCCuNQ6G85uxYTDjpwYhYZWkiCjgBi0pIK4PQhdna9dQr8x+a9QZls9F9yuolW3/F3dnhR60S134VYhOMtyiaY3AfjxtANjOj2aa0ziE31mMhYNgMBBAW3w/4PbMjZTwhN5r334ZGBeT82W8sG1fGmVzfmcMMSVq3UWjd4epGU6cbsoi+uythkiTWLuGzi7TA4HGQ5UGv/4qsIGYX2MPSHBuBVsNlITSYLJip2LxA6W8QRkhyVvIHDr4gMY8vwqKf73NbGDbsHZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.fr; dmarc=pass action=none header.from=phytec.fr;
 dkim=pass header.d=phytec.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjVj9rrjAucJZD7GLOnGmAjoolfWcgwC4VdjyJacLjo=;
 b=FfhOofSVWmq0ChKnZgZCwaW7B6lwHno99Ag/r3E3q10okFJM3PyeFhjQZyI4K9pyBkICktuqCYULW0oBEZdyniPI62rM772vWMG0DMut7y4g+RgSv1SvdMU/ChQXDQUnqOSMyb+315QO8rpM1qnkmm6m5eGIyxNnQ4LvFvhNnm0=
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:472::20)
 by AS8P195MB1125.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:31:31 +0000
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::6f68:e880:a341:452f]) by DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::6f68:e880:a341:452f%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 16:31:31 +0000
From: Christophe Parant <c.parant@phytec.fr>
To: "robh@kernel.org" <robh@kernel.org>
CC: "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
Thread-Topic: [PATCH RESEND v2 03/11] dt-bindings: arm: stm32: Modify
 STM32MP15x Phytec board items types
Thread-Index: AQHcardCA4jkgqRtikGcfueWeIeu/7UovleAgB/ktgA=
Date: Thu, 8 Jan 2026 16:31:31 +0000
Message-ID: <15d8e394bc7fd00f464b007a074acc5b1b6101dd.camel@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
			 <20251210101611.27008-4-c.parant@phytec.fr>
			 <20251211160013.GA1485420-robh@kernel.org>
		 <0ad7413a5252633b2a820db1cf2a10f7d658f6c6.camel@phytec.fr>
In-Reply-To: <0ad7413a5252633b2a820db1cf2a10f7d658f6c6.camel@phytec.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2197:EE_|AS8P195MB1125:EE_
x-ms-office365-filtering-correlation-id: 87a2b8c7-cd60-4c27-7ea1-08de4ed361a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K05xVkdZZGVWMjRHTGEyZk5TY09nZklMZGtIQTM0WjZPa0ZzeWNjSldneFlE?=
 =?utf-8?B?WlkwR2dwZ01ISlRKb0ZwcmJqbTJRQVNUNjNBWktVZzBwQTA4NWhUNzdLQmli?=
 =?utf-8?B?Vm43Q1Z1UnN1WC9SZDhxbitiQW1IbHdkVzVLb0wydXF3cTR3RUFmQlNUaWNh?=
 =?utf-8?B?QnhTM0EyK1BSZkRGcVZnOGtiWDJvVVZrTHFLQnR1M2ltbXdIbE9zQ0M4L2Nt?=
 =?utf-8?B?aGVLQlJSSDlocnlyR256K3RUaUsybWMxRndhbWpnNmRmamZjN0M2VFFrWHRn?=
 =?utf-8?B?azhHZFpTR0dyVXdaMUNSZ0FwSDJJbUdJR21EWWNWTzZLKzdmOHpIYWo0eks3?=
 =?utf-8?B?OVc1Q2VndkU0ZmVSdUxFNVpLQ2M5bWFsQWh5L2RrZkYxaStvUW8waXBSaEFj?=
 =?utf-8?B?ZmlyZlRFUVg1RmZsZzdMUHI0QVIwTDlWZUU4Z2JpSlhQMXpXZlVqQnNZV1k1?=
 =?utf-8?B?dk1XOXZaajFHSkZ5ZXpoMDBpTTgvWENPamtYWDVvZ0hJMkNKQks3Rk56UWh5?=
 =?utf-8?B?Y3JadWloUlFCVUp1SENVU1liNWxkeWQ0YlVMQmIyMTZLQkxQVlptYWMxUlA5?=
 =?utf-8?B?MHp4cHEvV3NMamFpZXY1ZzFRWFl2UDVYOE16SGxUMWhQalpKVGRXdlN0WER6?=
 =?utf-8?B?bW0reisyYlZHRGNOZU1YN2k5c0ZIMzNxOTVCV2gzaVEzUkhXbU1NeElXTEk1?=
 =?utf-8?B?NDA4OHQ5Vm41b0lNd3NlUW5KTytjM0l0dmV1em1manpjY3lkOFZibzB1RHlV?=
 =?utf-8?B?WThLNWphMUUvWk8zQzIvZ0t4S2pXVDJUT2VTN0tlOVZxWDRCUGJPVGJoTVg1?=
 =?utf-8?B?cm5TaWNXV3hpZ2V0MU5hM3BveWdhbEpsSEpnZVd6YXpUanRqZnNYWVpUYXlj?=
 =?utf-8?B?VUNGSExBV2QvcDZpUURISHNEdStsNENoa005R3NHSGt1QWJIRFdFbkxyWmE5?=
 =?utf-8?B?UXpKcEtRdnd5Z1JTYVBqbExGU3ZNQWlyM0ZkNFBrdy9FOC9ldlpwOUpEMjBk?=
 =?utf-8?B?VEdsRWI2MC9XckVhWUhxQkg3b0pzZmZsbXBsajBpTmliOFFHVWJDSGx0d2NZ?=
 =?utf-8?B?MHo3cHJTeDErVTZEQUI2RG54VTdDU3g4OS9FaFBzY00wYUQwdGhzMWJRV016?=
 =?utf-8?B?OWFiT3ZDb2ZXSitjRW1yOVViRUJneWEzbWdDLzFaNjNKTUw4Z2NmcUxOUSs2?=
 =?utf-8?B?eGJkeDhQR01vZ1k5K2ZBdnQ5Mnd2ZzRaNFNRdWUvRmY1b3lFN2dqSGhlUnVX?=
 =?utf-8?B?Sit5ZGdWdjhwK0FqK0FaT2xOYTRrM3NqamVscEQ4YWJPUmdaeHBDRm5UVS9E?=
 =?utf-8?B?V0tXb001SVpUSU0zTkVuOFA5YjltakVDT1pUbEZzcXlrYmlJeFlkQ0ozNHFE?=
 =?utf-8?B?RjIyek1rS01xZnNiMit5OHNRbndkNjVlSDBoeE1FR3p5S0d4ZUJ0R2hQT0ll?=
 =?utf-8?B?S2ZWY2tXeThJeE5aTEVYN1ovWVp1d3NhbU1XQnNGYlA5WTBsQjBxUlpaUzV5?=
 =?utf-8?B?a1ZjVkJ2SDBPSUtDanMxY0sxRkMxOERpc21xRUIrcUJNTmthcUpGdU14VGRS?=
 =?utf-8?B?OHBwVDJVUnFXYUtyTTl5UzlnZmVxK2gwMmhrYXgzZTdnTGtxT2h4SWZlM2M2?=
 =?utf-8?B?alpVUnhTL1lqdjNlVS93WjBNRmxlSEMvcXZFSlo1NWVGUi9SRkxrQ0t3dE1i?=
 =?utf-8?B?TVcyT25VbXpHZXdDZXB0d2g1MVo4bTRyQklNY09XNzlLQ1FPak5lY1N3RXFR?=
 =?utf-8?B?ZHAvSXdXcnZlR1l4SUZIa1o2cWY2WFl2djdJTzJKSXFvc05IMWUycVRzNXJP?=
 =?utf-8?B?TGQ0cG5ndFZ4aHZtTmpVLzVUa2VWM3VOQTFYdVEzZzRjUUZKaEd2T0pUTFZH?=
 =?utf-8?B?QXJ3ZDNhMnk1UExWZy8rMmpVbGJmdEN2bjRSZkhIYktXemhYcER5SGxQUmhN?=
 =?utf-8?B?czZXTTFlWGI0U3hLZE1NdCszWWFvdXQ4K2pJMSt4c29TNmdseU1nZFZBOG5I?=
 =?utf-8?B?TjJsVDg0ZUc5Z0RuTWV3TlJIV2FxaFl1WHJFNDhidUZWOE5zc2YrZGF1aVFT?=
 =?utf-8?Q?HpptpT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2197.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0NwV0l6Zjg3TW9RMVJVWCtKWDQ3TVlKUTIyUEY2emxyZUtxU3dxbjV5Z1FM?=
 =?utf-8?B?czNmUjVpVXRBWENvbWhuNWpjNElWTDFzbTZGWVJHSnNnbkRmZnhMckYzeTRM?=
 =?utf-8?B?Y0VYenZoZXZEcXNaek5HN1lvci9RWmkxbnJ6aTBXMWZTVlBaZzY0L2JLOU9G?=
 =?utf-8?B?cjI2ZnFVdXVKSXlrYkhWY2FPRWVpc2huZ0JUcmRhS3RGZmNPYzFBbkN0eDlV?=
 =?utf-8?B?NHJZSnNmUE5XK0NEd1dXU1YrU0Fsb1JPWldHR1NJSDJTQVNRK3hPMmFUZFZX?=
 =?utf-8?B?a0hLR2c4U2k1WEIwamNITnZmSDRzMVU4bWRtNFN5bm5PQmVPcEYyczR6WjVw?=
 =?utf-8?B?SWphYU9VbDhFZGlCekJDZHdiem1WT3U3cHQwR24zZjBwd3ZUVUUxN2haaGNn?=
 =?utf-8?B?RCtaVlRDbk95WmpYclN3VTFtV0NpZWoxdVdBWjFTbW9RZGs5SVBLaXNXNWE1?=
 =?utf-8?B?VVlvMUJuRi9JekE2YkhWNkZ2M3RKL2MzOUx0SW1OUWhNckFRdDc0U09XbTZG?=
 =?utf-8?B?QVlBOFU1T0MzZWRzK3hheGo4OU1oZVprNXhaQ3EzcjBjaGZPN2JtVzJkOVlE?=
 =?utf-8?B?ZTNiK0o0RVRHblpBREoyUzlEdGsxcFcvSGFXbVhXejgyL1NJVFFFZmZVTHha?=
 =?utf-8?B?S0x4aGJzelhnRHF4aTNNNXhzWmJhdVNMVURPbnRuQnVueHlpd0VIYmdiOFpw?=
 =?utf-8?B?dDM3Y2U3Qk9ZbmlobW5xNnBkN2d5N29GSkluMlFDbit3QVkvSm5qNVNCVmw2?=
 =?utf-8?B?bWJ0SThnUVNhRmVLdDJlRGN3YUFOeHF3QU1zcEZPZFRpd3BQM3cwME02L0l5?=
 =?utf-8?B?KzBqT1hMTm1SaUNvWW4zS2Y3UnB1OW9EQU5qZ2IzWVJGcDh5WUQzenlWWlUz?=
 =?utf-8?B?eDlGb2QrTU95d25tTlZuREVTNzE4SUM5c1p0OWl4K2dxYW1CL3ZFRldVU2gv?=
 =?utf-8?B?ZEJBQkFabDQxT0p3Q1pzOStDbWdmRjB5SUZxTCs3TTJDTmZobUdhYTYrMENm?=
 =?utf-8?B?M1Z5djVMZHVWczcwNGppdEZHQ0R4MjhoQkdvRjlVRE9MT2pVUndvTHdIeFNj?=
 =?utf-8?B?c1BaN2UrWVpCNUNJYitXZEFFS0szT3V0TjZZWW55cjdOOUNXRm9UR1BMZlB4?=
 =?utf-8?B?WUY4cFBMYXJjbmo1T1ZaTTJMb0RFdW5Ha0hVRkhoK0RGNWI1dm5lVTZRTWtL?=
 =?utf-8?B?b2dCMHFHUEVJdzBpTFUxSythUDB2S1pwOFlEQzl6ZWFVQVVGQ1llR1lGWnBr?=
 =?utf-8?B?RURWU1JBbFJsT1d5QnNlWUp6OHJSVEU2MnFpV0tFSEpyZXN2WXBwMHArcUpo?=
 =?utf-8?B?TkxMajhRaEg2WjZPWjRYVk1CaXAxNWNSWkxNZWlOS09IaGpqaW5GUXZkL1cx?=
 =?utf-8?B?RVU1R085WE9RNUpJQjJDbTZkSHpkWkdaV2ZMYkFZSTRwTjNFd1BZZ0RWanBi?=
 =?utf-8?B?VjFObERORnRUUWEwekR1cHRGT2I3VDFmYmF3Z0lOWHdpMTg1VEVhcDR4V2c2?=
 =?utf-8?B?azBSMkVpcFU0YTloRFE0QUlOQmt5Q3hhSFdIVnhIbmdyOTdEdjkzdm9SQlRv?=
 =?utf-8?B?ZmxGaTZSamk5T2hMVEVuVjZxNVNkK0kxNTI2NTE1YVUrQXgzOVFWVDZuNURo?=
 =?utf-8?B?dDVRYVFmamEycEl5WTBqemV0eTd1NDFIZDhFcmZRdVdCSFNQUHpGZk93MzJi?=
 =?utf-8?B?TjJTdzM5TW55TzVxK0ttS0JHemo5TEdVcWZSUzJwWEMzUm1rN1Bvdm9nckVX?=
 =?utf-8?B?amlldG5sMTNmVUladXh6ak5hb1VTazFMcFNiTFhTTis1aktEMEVFbHhJUWVz?=
 =?utf-8?B?NWwyTUxXZnlKOXk1VDJuOGVwZ2krd0d3a1JoRkg1ZVZzd1FaMTBqaDJ3Zita?=
 =?utf-8?B?VS91MmZETENSNFdBYm5BNThEYi91TXJodjIrSW9md2M4cVNxNDF0S2J1eFRJ?=
 =?utf-8?B?MHBmUk9DMGRFS0V6akRLWXBabmttdm45ZnhsSnhWUGxFZk9LL25RbUdTTzBU?=
 =?utf-8?B?ZTlUQXhXMEoyYm8rd2QzamhCek4zSHhQT3pPN1hXRDRkcFptaUt2SFEzQS9h?=
 =?utf-8?B?SEdYTlFOQ3lWaVY4M1NCMlNqMmtIRFpXZEFya0dDT3lpWFg2RWlCM1ZzL3hP?=
 =?utf-8?B?TTd4amxSYUxhajhYZ0JnTmROZUZHd2ZUME92Y3ZZemIzYVhhT00yMXozZG9Q?=
 =?utf-8?B?VWw0MFIvekdpeVBCK21ER3pvRGNaREdIdFdYNlZxd2xmZzlOOGJqWnZHYk9h?=
 =?utf-8?B?a2lFQlRhT1B4cDhUVnhtQmhDcXdoRDFVV0dwanN6Z29qZ2c3VlZObjZ5bndR?=
 =?utf-8?B?b29jSHB2OHgweWN5Q295Q1ovVG55OVRQTHp4VTBjOHoxQUszVGhHL25iRmU3?=
 =?utf-8?Q?fA2f+QZ87jzlQe+oQKeMXqRbJ8p081/Kmk6FwQioLb5yK?=
x-ms-exchange-antispam-messagedata-1: naSDnDtmKnSL8Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <00BAF59EF950524A82262104413B12A4@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a2b8c7-cd60-4c27-7ea1-08de4ed361a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 16:31:31.5902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NIl+gJml2rhoRZVY7whetiVIQJ/05mzJc7ahebl2CJ+N9s5Ri/fkpsalbsehlzcWBhplwMmVsGjiT8Zgq3UgGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_083139_966856_D9FD278B 
X-CRM114-Status: GOOD (  30.46  )
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

SGkgUm9iLA0KRGlkIHlvdSBzZWUgbXkgYW5zd2VyIGJlbG93ID8NClRoYW5rcyBmb3IgeW91IHRp
bWUuDQoNCkJlc3QgUmVnYXJkcywNCkNocmlzdG9waGUNCg0KTGUgdmVuZHJlZGkgMTkgZMOpY2Vt
YnJlIDIwMjUgw6AgMTA6MjggKzAxMDAsIENocmlzdG9waGUgUGFyYW50IGEgw6ljcml0wqA6DQo+
IEhpIFJvYiwNCj4gDQo+IExlIGpldWRpIDExIGTDqWNlbWJyZSAyMDI1IMOgIDEwOjAwIC0wNjAw
LCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOg0KPiA+IE9uIFdlZCwgRGVjIDEwLCAyMDI1IGF0IDEx
OjE2OjAzQU0gKzAxMDAsIENocmlzdG9waGUgUGFyYW50IHdyb3RlOg0KPiA+ID4gQXMgUGh5dGVj
IG1hbmFnZXMgZGlmZmVyZW50IFNvTSBjb25maWd1cmF0aW9ucyB3aXRoIGRpZmZlcmVudA0KPiA+
ID4gU1RNMzJNUDE1DQo+ID4gPiBTb0MgdmVyc2lvbnMsIG1vZGlmeSB0aGUgcGh5Qk9BUkQgYW5k
IFNvTSBjb21wYXRpYmxlIGl0ZW1zIHRvDQo+ID4gPiAiZW51bSINCj4gPiA+IGluc3RlYWQgb2Yg
ImNvbnN0Ii4NCj4gPiANCj4gPiBDaGFuZ2UgdG8gZW51bSB3aGVuIHlvdSBhZGQgYSAybmQgc3Ry
aW5nLiBJIGRvbid0IGZvbGxvdyB3aHkgeW91DQo+ID4gd291bGQgDQo+IE9rLCBJIHRob3VnaHQg
aXQgd2FzIHBvc3NpYmxlIHRvIHVzZSBlbnVtIGhlcmUgKGtpbmQgb2YgaW5mb3JtYXRpb24NCj4g
dGhhdCBvdGhlcnMgYm9hcmQgdmVyc2lvbnMgYXJlIGF2YWlsYWJsZSBidXQgbm90IHVwc3RyZWFt
IHlldCkuDQo+IEFzIEkgc2F3IGV4YW1wbGVzIGluIHRoZSBzYW1lIGZpbGUgd2hlcmUgZW51bSBp
cyB1c2VkIHdpdGggb25seSBvbmUNCj4gc3RyaW5nLiBGb3IgZXhhbXBsZTogInNlZWVkLHN0bTMy
bXAxNTdjLW9keXNzZXkiIG9yICJzdCxzdG0zMm1wMjM1Zi0NCj4gZGsiLg0KPiBCdXQgSSBjb3Vs
ZCBjaGFuZ2UgdG8gY29uc3QgaWYgdGhpcyBpcyBhbiBpc3N1ZSwgbm8gcHJvYmxlbS4NCj4gDQo+
ID4gZG8gdGhhdCBlaXRoZXIuIFlvdSBoYXZlIG1vcmUgdGhhbiAxIFNvTSBmb3Igc3RtMzJtcDE1
Nz8NCj4gWWVzIHdlIGhhdmUgc2V2ZXJhbCB2ZXJzaW9ucy4gSGVyZSwgd2Ugd291bGQgYWxzbyBs
aWtlIHRvIGFkZCBvdXINCj4gInBoeWNvcmUtc3RtMzJtcDEtNCIgd2hpY2ggaXMgZXF1aXBwZWQg
d2l0aCB0aGUgIkYiIHZlcnNpb24gb2YNCj4gc3RtMzJtcDE1NzogInN0bTMybXAxNTdmIiAod2hp
Y2ggaXMNCj4gYW5vdGhlciBib2FyZCBkZXZpY2UgdHJlZSkuDQo+IEJ1dCBkaWRuJ3Qgd2FudCB0
byBhZGQgaXQgbm93IGluIHRoaXMgcGF0Y2ggc2VyaWVzLg0KPiBXZSBhbHNvIGhhdmUgInBoeWNv
cmUtc3RtMzJtcDEtNiIgd2hpY2ggaXMgZXF1aXBwZWQgd2l0aA0KPiAic3RtMzJtcDE1M2EiLg0K
PiBUaGUgaWRlYSB3YXMgdG8ga2VlcCB0aGlzIERlc2NyaXB0aW9uIHNlY3Rpb24gZm9yIHRoZSAi
c3Qsc3RtMzJtcDE1NyINCj4gKGNvbnN0IGl0ZW1zKSBhbmQgd291bGQgbmVlZCBhbm90aGVyIHNl
Y3Rpb24gZm9yIHRoZSAic3Qsc3RtMzJtcDEzYSIuDQo+ID4gDQo+ID4gPiBUaGUgZGVzY3JpcHRp
b24gY29uY2VybnMgUEhZVEVDIFNvTSBlcXVpcHBlZCB3aXRoIFNUTTMyTVAxNTcNCj4gPiA+ICgi
c3Qsc3RtMzJtcDE1NyIgaXMgImNvbnN0IikuDQo+ID4gPiBBbHNvIGFkZCBjb21tZW50cyBpbiBm
cm9udCBvZiB0aGUgZW51bSBpdGVtcyB0byBiZSBhYmxlIHRvDQo+ID4gPiBpZGVudGlmeQ0KPiA+
ID4gdGhlDQo+ID4gPiBjb21wYXRpYmxlIHN0cmluZyB3aXRoIHRoZSBwaHlCT0FSRC9waHlDT1JF
IG5hbWVzLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFBhcmFudCA8
Yy5wYXJhbnRAcGh5dGVjLmZyPg0KPiA+ID4gLS0tDQo+ID4gPiDCoERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDgNCj4gPiA+ICsrKysrLS0N
Cj4gPiA+IC0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwNCj4gPiA+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sDQo+ID4gPiBp
bmRleCA0MDg1MzI1MDRhMjQuLmZiZDNkMzY0YzFmNyAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbA0KPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55
YW1sDQo+ID4gPiBAQCAtMTgyLDEwICsxODIsMTIgQEAgcHJvcGVydGllczoNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNlZWVkLHN0bTMybXAxNTdjLW9keXNzZXktc29tDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMTU3DQo+ID4gPiDC
oA0KPiA+ID4gLcKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUGh5dGVjIFNUTTMyTVAxIFNvTSBi
YXNlZCBCb2FyZHMNCj4gPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IFBoeXRlYyBTVE0z
Mk1QMTU3IFNvTSBiYXNlZCBCb2FyZHMNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgaXRlbXM6DQo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHBoeXRlYyxwaHljb3JlLXN0bTMybXAx
LTMNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogcGh5dGVjLHBoeWNvcmUtc3Rt
MzJtcDE1N2Mtc29tDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBoeXRlYyxwaHljb3JlLXN0bTMybXAxLTMgIyBw
aHlCT0FSRC1TYXJnYXMgd2l0aA0KPiA+ID4gcGh5Q09SRS1TVE0zMk1QMTU3QyBTb00NCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOg0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gcGh5dGVjLHBoeWNvcmUtc3RtMzJtcDE1N2Mtc29tICMgcGh5Q09SRS0NCj4gPiA+
IFNUTTMyTVAxNTdDIFNvTQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc3Qs
c3RtMzJtcDE1Nw0KPiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBV
bHRyYXRyb25payBTVE0zMk1QMSBTQkMgYmFzZWQgQm9hcmRzDQo+ID4gPiAtLSANCj4gPiA+IDIu
MzQuMQ0KPiA+ID4gDQoNCg==


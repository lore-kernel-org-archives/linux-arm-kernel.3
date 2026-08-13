Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6497BC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gaeVJJZKzYtxdsBNTpsC54/tTNVHeQsESaWM+gW090=; b=Oh22D4ZzBQ+Gsjd7WHKUnrMh8o
	DwEhu3tciTyU8mVlx4aafwxWp/sgxZ/CYax5+w2dmAAlFLL7hok6d0XWeH/TGrpM8iYA8kAGTXCAv
	BpNfUGxM8vKHYFB946IBJwJdxDzWJ+68pV6GQOR9jiiXJaMSOshyLW2Eo7hGSyPi/kvfvKnBcOpJA
	5sQ8i4ur7Gvz7VEQ178KrA4XmhcQsEiWwNDYZIbvja+ETvdPX+dMXpDxD+owqO6gmEwJnXaQkq2yL
	7EJlzgy4jhbMPlK6hLsADeQQOodKWxlhDq8C/LnszeMYJKKmWykCX7BzMDnbx2VSXpZg4HHovWUgT
	DoTuaH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGr-0000000HWjK-2Bnn;
	Thu, 13 Aug 2026 06:50:33 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGd-0000000HWYf-0O2m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeBDVCB7Jr33mwc7DZ1URrJf6KMQfcTBfaKaOCMc79SPSN09Ue1O3tW0YcunEKIFeTEWDbd5EMW2cB9aRC76a0p65sbJcqD9Ckboaj5z2nA9mc5GgQyD5JOI5OtvvuWOi2/6gkD9g0DeK+92RJEqEsxSWgdBvcFTg2Jb7NFyM/VKG6QkZ6hnsBalBfUZzkwFmLQXLOuijE0MQXxZo7wybrDuvt+HA9NKhJPD/DIzHclp0Vs+VW1F1PUEr66M0UBE9y9kSwylAkXHUx/7pJkGCT/Zd3O3gVaREJoXBKLT/ZB3PFDsOHXMkxc4CB48u0M4flwuQB9oMivDNHxeUYIosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gaeVJJZKzYtxdsBNTpsC54/tTNVHeQsESaWM+gW090=;
 b=kCpoP6Z25JBokrZoek2gqORXTIqzZuPS2vHOG8ZL6AFmqljNRrf7/ASfrDf74KDu19QfLY/ySMPy0ZkwpzqOl9Ff9LWl/NSp4akLM8J9A78rSmWdd3T1tCypd8jQkAZ4hXhcwCURUDqmSuWq3OiknM6mTrDNTQEdhqgEWRc7U0b6bFTg/9eMquSFmZY6dTMPz66H3439+4c9vhv2K3QLAlp1nohg/g2Ydgfc4a/4IKv3OIudg15FvBm/SyZhXctZHW88qFVSLFLEXvSHAprvNzpXRDHG1KXSFFxxwHVgdtdJFHY2YSQG5YRZf0H7Xgb4iXGM/fzwX8QviXAUcZn4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gaeVJJZKzYtxdsBNTpsC54/tTNVHeQsESaWM+gW090=;
 b=isxKm+a5ZEW6ocxmWUo3H6u/BGK+xaXpYvVIvWHCeQ1quhyARaetxhxBDBzRsaXd5nGFjjK9T5TF0CKdWIdiBRVoz4LMQR+6CbyLHRsk0h9Vk7J9NRAEnTpTKnXqod3KbGwqo5ZTQDcMjayRh4W17waukGPSOje+S8/FWaunFFg=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by PUZPR04MB6843.apcprd04.prod.outlook.com
 (2603:1096:301:107::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Thu, 13 Aug
 2026 06:50:15 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 06:50:15 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v2 4/4] Revert "arm64: kprobes: Allow reentering kprobes
 while single-stepping"
Thread-Topic: [RFC PATCH v2 4/4] Revert "arm64: kprobes: Allow reentering
 kprobes while single-stepping"
Thread-Index: AQHdKu/+4AqF3hf02UmFfH6RK8azng==
Date: Thu, 13 Aug 2026 06:50:15 +0000
Message-ID: <3af98e883046497ff9998e8f17fdff652570de13.1786603168.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: 20d23bf4-cd39-427b-f3e9-08def907216a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|38070700021|10067099003|6133799003|11063799006|3023799007|56012099006;
x-microsoft-antispam-message-info: YwmyVcmoOeBzpS0g6aesd6pBD53Mv66ifOYM0q5IIvweiq0TpGmPj3HnKX/hadfBBnP1hncuUAueUJquM+TzFRfCZiGLcrdsyisDlQWuZPkonJjnrpWozzMGSCl2RnOZNMfP3JL1JebEUBSMkWmUSmSGGjWlWZ6W1ynXW9xG2o50k8qj2N5G81M/pKqT9GAXmQ4s9yXRKaG8vfDQ7BWFa8Wym+M7X50bP57d29sa//GUO5lhUPy+cYyjsYhv5YL0Z7uLZmEdG3jSqiZ60oRhHnUdsCtRLX+v0MWL1eqhwauXyyjSIbn1MtrL/J7DZk6+a918SL4tEm38m6W8gZhxJr4xPNTA9AIf854EP/9lEgKdgDzji81tacMKY1Iq2EJO0kJ3kYz1rniYpjTuosWULMHKEykzaYTO4j8tIRQdEisen5wsveHwwRGSavZ8gjQpTWvAqKWaaeAOpRmxyGBKq0doWbQbXP8iedKGnv94YF5yf5CYpmmgyr4J3Tx4DOcRo35kEVjSLO2e0PgZ46hE2fO+JWmSaSEBbFuhkGPWpDVld2G0ahXGWRswgobLoFuen32q2UVzZO7SVdyec1d+iQUA5m6PsBbOKTLvsKgA6ARYK0bfDfDP4AcslspU7EXO+dwVFhg8/4jaJWjlCfmNPe5C/gaYKEisrQiPDQuRg3/LPbdkkClCrDZAv6ccejZm249LBtc/1PhS/R22tXLceA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(10067099003)(6133799003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VThBK0xubnl0S1ZUZndOSGJqcFJSb29QTEFtOENLY2orVC9FREpBM2tRZWFX?=
 =?utf-8?B?VDZrSk9Qc3F6UUdxMFI3cFZUUzVxOHlTQ2cxZWthMGl0WnhoYVRXWjlnUVZw?=
 =?utf-8?B?UlROdDFaWmVESk9neGlFWEljZWVUVVRoaTZ5TThVbmlEQk1qRXVGNkRaZ2Qw?=
 =?utf-8?B?WUJ1a3NsZyttRS9wRnRFN1gvQnQzY0hPaFFLZmZpVlNsZm1zRHN0R1QzNk94?=
 =?utf-8?B?Mjc1YTlqUEI3MmhSWlpweS9HZUJ3K2RPN0dMeGNRb1ljUEkyTUxnelMxeldW?=
 =?utf-8?B?eWpmRU9XbktjNFc1U1FLVzd2dWdVaU1HcDhHemg0M2FuSTdyd1BDOVNPSDc0?=
 =?utf-8?B?SHlIdzlDNi9pR1p5cUJmSFVqNXBKNnJFWVpBOTRNdklNa29KWDIrTHA4N1hE?=
 =?utf-8?B?elJPa2pSNXkvOXI4a0o2eFV2NFByMUNwOUF4OFAxY3FtSUM2Zk5BZ0x0QnZF?=
 =?utf-8?B?TDBwRzYyMVhHU3ZrOWRDZ2twcVdnVkdQM0NEU1hZeExDaUpqa0JnN0pBVFc0?=
 =?utf-8?B?cXMwR2FuRTNvNE81UVA0K0xwUVY3ZmVFaEFNZU00ck1KajdmSVBnMzFmOWhy?=
 =?utf-8?B?cm8wcDYrbzJySWpKYWhDU3NOYTRybGkwbnA0TUNpSm5FSHozYk14NzNJa3Bh?=
 =?utf-8?B?Tk1za29XQ3cvSjAwUHNrRTdNRU1VUkFBQk1VVndVYmVwTXBoRkhPY1REVXpt?=
 =?utf-8?B?M2QwUHZMc0hIRkJUYzZoOFdha1VvMXZzVVlxdjVoOXZNdW1nc296R3ZGWjZH?=
 =?utf-8?B?bE9HSHB4bGdVZUpzUThtcGVSalIyNnBvWUY5Y2Q1N01oMmNDMXVmRzRSMnRu?=
 =?utf-8?B?RmI2WU8zeEVzVXVmb2plRjA5V1pFNGhkcHZ4ZTMyNmR0Z3drT2ZPZkJKb3NL?=
 =?utf-8?B?azI2ZDFuTWh0TEdmMnpwL2NGYmo5VG5UL1E0eDRPTE81VlQvc2ZJVEFDcUZU?=
 =?utf-8?B?ZHB6Tm0wWHpVaWR2WmNhQmRVNWEvWHlFcFlvYXlRYlgzZld1M0F2NWxUNkwr?=
 =?utf-8?B?aCtUZzY5VHQwbngzbk5neGtUZXo2czRQY2xMTVdWN1pMRGVkTXNqRDR1MTk3?=
 =?utf-8?B?djZNN1NGTVpQelU4dEZ5ckdKWVhGRktodXllSk0yZjBpV1JxbFh1aGFZeXU5?=
 =?utf-8?B?VEFNbVlSeHoyZUg1ZHB1R2hUek1mQ2RKYjQ0SWF1UnRaOHlnZjh3UUtkYTdF?=
 =?utf-8?B?aTdibFRXaWx4VmhWY2NuY3RUNDFFK2RWYXhMNmhBdUFRZEwvcjgxa2kyUmR0?=
 =?utf-8?B?MStRWURvQzFDQlRCcUp0ZGVXbU1EdlhPaXJwWW0wd0tHZzlyaU9hbW1GSFJ6?=
 =?utf-8?B?WlBOSnlxdFk4aG1yZXJtY3d3R2lidWxhaVFaZWNUWVRDbjkvT2JLbm9YVVlw?=
 =?utf-8?B?QnVBbENiaHIzK0o3ZGJiaC9NS01UVEJpLzhjdlhmV05KSlZxdEdqNnVlbEtj?=
 =?utf-8?B?WS9JekpiM1ZoSWF5ZWtGTUtFUlVGdW5YYnZabjFxNXl6N1hZUFk2ejhYYS9o?=
 =?utf-8?B?Mi9BZnE2THR6N1hOVkRNMlVYbTc2amhMZGNpUTlUSjd3ZFZta0tOOTRxVGJ0?=
 =?utf-8?B?d0xId0w1WnRGczFOL1Vnei9FSEF6SFJsazk3YTVwaG05L0lVeE9Ic1JzMjNR?=
 =?utf-8?B?Snlnd05zblJwdGRaSXNPM3JxRnh5SFB1Mk9JdFdTUzlreWx2d2tubHBEMnZa?=
 =?utf-8?B?N1NTSjE1dGt6M1E4UCtwNXdFVC9NL2pGQS9yK3Myd0lGNWI2UVVUZFF3N1ht?=
 =?utf-8?B?c0h5Z0JVcWprNWlCSGJLdElwa1laZTduRWRpWVJjSDB1L2Y1WUVWc1ovRkMz?=
 =?utf-8?B?V09UUjNNaXlwamFxcVpiWHV6ZlFrNVNJSkRMUTRxR3I0SGdjclZVWUEzVWNp?=
 =?utf-8?B?dXNNalRIY01wcitKVDhROFFmUU03Z0pJaWdHbVJoczFKcng5dVJYSk5tbkw3?=
 =?utf-8?B?c05SaG1IeFZ1ZHJGN0o0YzEwNnJtNlV0YUtKZ1g5Tmd5QU1acTJHR3U3ZGIr?=
 =?utf-8?B?dWRNQ2hVc1pJbVpFRXJ1dXpEMUVrWjh3dENCWTdHNXA5NnNZWlFxVERaMEYx?=
 =?utf-8?B?VHd2ZnhRRnhyVmJPRmtzTE5sQWVKVFhRZzlid2VEYUwzVmdMNWlWVmROWWMz?=
 =?utf-8?B?OUNmc2FxeFZhcTMwQlY2eE5hQmNxNVh1Z24ySXpKRGhESng2VUpnd0FHekh1?=
 =?utf-8?B?Rlg0c2xQTHB3dHBYYnFGUEM1VjVxbFJRejY2V0RrQVBwVS9ZbHZ5WCt6eGV5?=
 =?utf-8?B?VGNLRDdHekhoNTltUE9CcFQ3UGFGOEhqSDFnb1ZFVEVoMmtDL1RrcE5TK3cr?=
 =?utf-8?B?VkNYeWd6NkF6TUJrSTdacXUra21YczRveXFEbWo1eUlGdUFIc0Mwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d23bf4-cd39-427b-f3e9-08def907216a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 06:50:15.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNuvk9soo9u8uV9eUJeysRZ4uZNQcY5D+VH6OrN6y/lH3rV7VZ0n5L2LkX835veY0c644+vDPZSgK8x0JAVYk9lTMM95lPk/TpuyT3plPPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_235019_155652_213A1625 
X-CRM114-Status: GOOD (  13.49  )
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+CgpXaXRoIHRoZSBk
ZWJ1ZyBleGNlcHRpb24gcGF0aCBub2luc3RyIGZyb20gdGhlIHZlY3RvcnMgZG93biB0byB0aGUK
a3Byb2JlIGhhbmRsZXJzLCBhbnkgS3Byb2JlIHJlZW50cnkgdW5kZXIgS1BST0JFX0hJVF9TUyBt
dXN0IGJlCmNvbnNpZGVyZWQgYSBidWcgbm93LiBUaGUgc3BlY2lhbCBjYXNlIGlzIG5vIGxvbmdl
ciBuZWVkZWQuCgpUaGlzIHJldmVydHMgY29tbWl0IDIzZjg1MWFjMDA3OGE5MDhiZjM0MjJkNjQ2
N2ViYzFkYjU4MjhjNDYuCgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lhbi54aWFA
dHJhbnNzaW9uLmNvbT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2twcm9iZXMuaCAgIHwg
IDYgLS0tLS0tCiBhcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIHwgMjMgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDI4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Byb2Jlcy5o
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rcHJvYmVzLmgKaW5kZXggYTY5NGY3ZDM0ZjQ1Li5i
ZmY4YmE5YzE2ODkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Byb2Jlcy5o
CisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Byb2Jlcy5oCkBAIC0yNiwxMiArMjYsNiBA
QAogc3RydWN0IHByZXZfa3Byb2JlIHsKIAlzdHJ1Y3Qga3Byb2JlICprcDsKIAl1bnNpZ25lZCBp
bnQgc3RhdHVzOwotCi0JLyoKLQkgKiBUaGUgb3JpZ2luYWwgREFJRiBzdGF0ZSBvZiB0aGUgb3V0
ZXIga3Byb2JlLCBzYXZlZCBoZXJlIGJlZm9yZQotCSAqIGEgbmVzdGVkIGtwcm9iZSBvdmVyd3Jp
dGVzIGtjYi0+c2F2ZWRfaXJxZmxhZyBkdXJpbmcgcmVlbnRyeS4KLQkgKi8KLQl1bnNpZ25lZCBs
b25nIHNhdmVkX2lycWZsYWc7CiB9OwogCiAvKiBwZXItY3B1IGtwcm9iZSBjb250cm9sIGJsb2Nr
ICovCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJj
aC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwppbmRleCA1ZWM1ZjRlZjk5ODUuLmFlNTE0
N2EwZGUzOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwor
KysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCkBAIC0xNzQsMjcgKzE3NCwx
MiBAQCBzdGF0aWMgdm9pZCBub2luc3RyIHNhdmVfcHJldmlvdXNfa3Byb2JlKHN0cnVjdCBrcHJv
YmVfY3RsYmxrICprY2IpCiB7CiAJa2NiLT5wcmV2X2twcm9iZS5rcCA9IGtwcm9iZV9ydW5uaW5n
KCk7CiAJa2NiLT5wcmV2X2twcm9iZS5zdGF0dXMgPSBrY2ItPmtwcm9iZV9zdGF0dXM7Ci0KLQkv
KgotCSAqIFNhdmUgdGhlIG91dGVyIGtwcm9iZSdzIG9yaWdpbmFsIERBSUYgZmxhZ3MgYmVmb3Jl
IHRoZSBuZXN0ZWQKLQkgKiBrcHJvYmUgY2FsbHMga3Byb2Jlc19zYXZlX2xvY2FsX2lycWZsYWco
KSBhbmQgb3ZlcndyaXRlcwotCSAqIGtjYi0+c2F2ZWRfaXJxZmxhZy4gV2l0aG91dCB0aGlzLCB0
aGUgb3V0ZXIga3Byb2JlIHdpbGwgcmVzdG9yZQotCSAqIHRoZSB3cm9uZyBEQUlGIHN0YXRlIGFu
ZCBsZWF2ZSBpbnRlcnJ1cHRzIHBlcm1hbmVudGx5IG1hc2tlZC4KLQkgKi8KLQlrY2ItPnByZXZf
a3Byb2JlLnNhdmVkX2lycWZsYWcgPSBrY2ItPnNhdmVkX2lycWZsYWc7CiB9CiAKIHN0YXRpYyB2
b2lkIG5vaW5zdHIgcmVzdG9yZV9wcmV2aW91c19rcHJvYmUoc3RydWN0IGtwcm9iZV9jdGxibGsg
KmtjYikKIHsKIAlfX3RoaXNfY3B1X3dyaXRlKGN1cnJlbnRfa3Byb2JlLCBrY2ItPnByZXZfa3By
b2JlLmtwKTsKIAlrY2ItPmtwcm9iZV9zdGF0dXMgPSBrY2ItPnByZXZfa3Byb2JlLnN0YXR1czsK
LQotCS8qCi0JICogUmVzdG9yZSB0aGUgb3V0ZXIga3Byb2JlJ3Mgc2F2ZWRfaXJxZmxhZyBzbyB0
aGF0IHdoZW4gaXRzCi0JICogc2luZ2xlLXN0ZXAgY29tcGxldGVzLCBrcHJvYmVzX3Jlc3RvcmVf
bG9jYWxfaXJxZmxhZygpIHVzZXMKLQkgKiB0aGUgY29ycmVjdCBvcmlnaW5hbCBEQUlGIHZhbHVl
LgotCSAqLwotCWtjYi0+c2F2ZWRfaXJxZmxhZyA9IGtjYi0+cHJldl9rcHJvYmUuc2F2ZWRfaXJx
ZmxhZzsKIH0KIAogc3RhdGljIHZvaWQgbm9pbnN0ciBzZXRfY3VycmVudF9rcHJvYmUoc3RydWN0
IGtwcm9iZSAqcCkKQEAgLTI1NSwxNiArMjQwLDEwIEBAIHN0YXRpYyBpbnQgbm9pbnN0ciByZWVu
dGVyX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwLAogCXN3aXRjaCAoa2NiLT5rcHJvYmVfc3RhdHVz
KSB7CiAJY2FzZSBLUFJPQkVfSElUX1NTRE9ORToKIAljYXNlIEtQUk9CRV9ISVRfQUNUSVZFOgot
CWNhc2UgS1BST0JFX0hJVF9TUzoKLQkJLyoKLQkJICogQSBwcm9iZSBjYW4gYmUgaGl0IHdoaWxl
IGFub3RoZXIga3Byb2JlIGlzIHByZXBhcmluZyBvcgotCQkgKiBleGVjdXRpbmcgaXRzIFhPTCBz
aW5nbGUtc3RlcCBpbnN0cnVjdGlvbi4gVGhpcyBpcyBzdGlsbCBhCi0JCSAqIHJlY292ZXJhYmxl
IG9uZS1sZXZlbCByZWVudHJ5LCBzbyBoYW5kbGUgaXQgaW4gdGhlIHNhbWUgd2F5IGFzCi0JCSAq
IHJlZW50cnkgZnJvbSBLUFJPQkVfSElUX0FDVElWRSBvciBLUFJPQkVfSElUX1NTRE9ORS4KLQkJ
ICovCiAJCWtwcm9iZXNfaW5jX25taXNzZWRfY291bnQocCk7CiAJCXNldHVwX3NpbmdsZXN0ZXAo
cCwgcmVncywga2NiLCAxKTsKIAkJYnJlYWs7CisJY2FzZSBLUFJPQkVfSElUX1NTOgogCWNhc2Ug
S1BST0JFX1JFRU5URVI6CiAJCXByX3dhcm4oIkZhaWxlZCB0byByZWNvdmVyIGZyb20gcmVlbnRl
cmVkIGtwcm9iZXMuXG4iKTsKIAkJZHVtcF9rcHJvYmUocCk7Ci0tIAoyLjQ3LjMKCg==


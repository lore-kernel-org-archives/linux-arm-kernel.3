Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F365C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuUHY1lgAfm5/BJEscR3j71+H980xGnX80yawVJrKwI=; b=KVwNYZdyNHDCgEZ3tyJh0h0NnL
	XaRX977Um23LAOJZSNRxLS33pd+CVMh3hmS4an4xME9OJQzguwfsfVcxIaNpPCp5HbgTL4vh1XVOZ
	82jgmQJ5xlCmsM4bEl+KlPeJZFxCsnAzrv5f7vBRJAd8Av/i7RYRsD+nxk2Nbr/Ezu2tKFONBv8Pn
	tjGQjDcjy3R9vZJ5LsZYIUK+WJ1+5Iz8Qc0sDzSuK/Zr2W030Qj/Cht0O/ctCNigD7fyGUpd2HVvF
	MUUtSCrbVDJ8/BgNGkYLXGAd5kl/6QKL+9muwm24IezAuBY7uEYvq2u5NEh6/ZVteYbzss0sPkOfM
	nccwlIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjZ9-0000000GFpk-2db4;
	Mon, 03 Aug 2026 03:42:15 +0000
Received: from mail-japaneastazon11022132.outbound.protection.outlook.com ([52.101.126.132] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjZ7-0000000GFow-2aNd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 03:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDaLhgMEd4prolTORaWYLm5auC3xOwoZCMy6QQccJpFE0mYDXIeVCyqNrpDKA+k47Ie/etnGRVgMQyzF/B3MJKZv8aPBrqIysYlFWWed6WOSIMrwcLpM1Lnh0gYQtLi0PszWaloHJ6thK/6OJDfJiB0C9z1maG2mVRDyDJl38Bl0EeTn2wwqjs2/WzL0NajuiLlXy5FUEcw448i/nlwlfuPQKeUnWCkHPxpjEbkQ3H4vCDFjQ/LhmWAX74h4leeUvMdvjm+ubyuaAzoj/ZxM9rQB8k3B+rnm9lhViRnIqXV2l5d+ZpD+ztKIKvKWzPmWr8l+ObNrr6qdzENs53pypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuUHY1lgAfm5/BJEscR3j71+H980xGnX80yawVJrKwI=;
 b=BV421Eeijx0Enw6fSSCGwoeS6WonlvVTy+VUyVlfNRxL/4k3R9Ocw7ADrL1jfa7LsArVOKeradqhYEuGZv7JsbinvBt1zXI8hOgyGcOFaRCBCHu5bTUsMAfteg6PdTLXHSNoMYzVCsYWXr7XEB8CQ8OTmahaMVBAmKiqTJ/Lw9R4mwaBCdUgnzmvgpDqcfjSA68f6OLrMQxZGg2JA9gJWKKN4UDs9DAKMEy8yW+Gn0jBEoT74DToenoiBTLhIZli6pVXRpMyK4Y20dJAISm8HWGYt9Q0Vg4AoGKWUG9OCAAQLdmvqJ6MHGxyr3fdvr1vTLEeiCkGi+yJ8tem2t0QEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuUHY1lgAfm5/BJEscR3j71+H980xGnX80yawVJrKwI=;
 b=fnD5rxpC7GU9PvpgirB6SW0yXx3MMhJKSZu09S6GZRN1ysd61EqFD2M2hKbiNDj+5c32oWR+iOBGqwFczH/8hBzrkkcYLbMq5y8BnTRcoqAZHMPmpdv50+WFOZcHwfurQX74yB79xeivfg8SjTvKsJRgGWH/vkdU6vb5VnF3iRU=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by KUXPR04MB9348.apcprd04.prod.outlook.com
 (2603:1096:d10:7f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 03:42:06 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 03:42:06 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Jiazi Li <jiazi.li@transsion.com>,
	Pu Hu <hupu@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 1/9] arm64/entry: Bound certain debug exception paths
 in instrumentation windows
Thread-Topic: [RFC PATCH 1/9] arm64/entry: Bound certain debug exception paths
 in instrumentation windows
Thread-Index: AQHdHcMFGBJ8XFLnCkSt77E101nvq7aHudUAgAP+kAA=
Date: Mon, 3 Aug 2026 03:42:06 +0000
Message-ID: <b1b75a31-24e7-49a4-88c8-bd0d0d441f97@transsion.com>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <38af667517b99785ccbc2075f53a364ba2acc73c.1785153469.git.hongyan.xia@transsion.com>
 <amy0HHNl4GIdQ6qu@J2N7QTR9R3>
In-Reply-To: <amy0HHNl4GIdQ6qu@J2N7QTR9R3>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|KUXPR04MB9348:EE_
x-ms-office365-filtering-correlation-id: 5a8d2197-f09b-443c-fe19-08def111306b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|5023799004|4143699003|11063799006|3023799007|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: y/8rlrfUeAvzKANXyl+6VnRfVv0FaaDhs5t0Puk6E8U99E/qUCiT0Sa/xK7z/ptlMf9IsriXyRjgQtwXz+g4ZDceHiJALfPw5dF2AoaQ9QnJYEqUV0VZ6DIUB+G/LKpc7i2NxEo4SgwHU9gchTMUDDkkmKi/fn55BnNJZAGgY8VoPrgousBKJBsmLMRwQoad5kFfiYr0okKZ0kYwVOf/gtk6j3oMJQparVqL5NVjBYblgbc6Kf03sDvJWivowH12C9mb0NpYkXZdsPaQg3s/AVywRJqFcmRWxI+TtE0q/xTa7+i+EerB9hB2aC4cMew/WkO/BD5xwnx8o1BbZtL+rPHeLidSaOUJnRRjLLJnChdjztjhnM7SQpbKmVgbbvkl52NB8NCr59aUWLrtfTGhvVpI0xDPfM1aSczxmgDT0L0MknodmRdRZOJamQi6lXsj3qbL7kIP14ejekWyN+ug5AbvENFPQ0sBZnu1YUlB0ACCmvcpJhRSKN91zx1lmhi3tWbIhhoAyjEJGbQ/q2eE/fYlStayZlxvAdyWjtZzTsgsYkSfks6oc34oAOpfeXrkjNRWYxOnatNHUTjIUo4PCtDQKfso5SH2JgmHSy9KD0tLovGvCskiVTC820h3f8rFJFW7G71WnfhMXG/SfHm/oOBWjmVNaCW1QXOYSM/FzjZN9QeC0aFp3+FgoXgZdPtzlZ/gSfQ6XlcrO9dUSxLb4kHBDYumd6rPK+N5TyKJLJw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(5023799004)(4143699003)(11063799006)(3023799007)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHBSaXNML0VXMlhYa1JET1AxczljMWU2VmZUbmY4bUpQbHB3QlRCaklWYzhp?=
 =?utf-8?B?TDI5WUJVa051V2tldFV0WFRucWxUcytXcEc5OHVLSEVFUVloUXp5MjRsQ2pR?=
 =?utf-8?B?aDUxbkwyV3QxdGNjSklPa240WjVQNUtJbERjdUkvUmhvcnN1ZjcyRVRXWFE3?=
 =?utf-8?B?T1FpMnQ3RTZwZjZ0MTBOd1FyaDhwUmpOQ3RtSG5jZ2dZMyszeHc5L1JCQ1Q3?=
 =?utf-8?B?Wm9QSFNidUpHc0QyRUF2aFpteXQwblZpVzFQZEdldWprMGZZYTZOMnRQREtp?=
 =?utf-8?B?ZmVsUnMxaWVpNTRWb2R3YVdRbzc4STlreGx6ZDZjdDhYRTM1VGFReUFQeUFz?=
 =?utf-8?B?OE53bFlqYUtvR2JwWnFWd2JyQ0VlZStoMFBNS053V0NQbHpYK05pNFlJSlFw?=
 =?utf-8?B?UWlJUzFGaFpLa3U5bVRtR1ByeS82ZXF1QXcrSUg2Z3YxSnNQNldhYmhFSXBW?=
 =?utf-8?B?UnlEa1ZUV0NXU0hjdHVISklVNUlZaklGVXlMb25zSTRkM3dnTXJmVDBJSHVV?=
 =?utf-8?B?ODdPd1ZHN05VSjhNeDJMb3VlTHZCdnlpWE9UaTZ1YU9aSGMxOU8wUFBNOVh4?=
 =?utf-8?B?QnV2ajBxQXlocFdIR0FvRGxxTitpcFY5QnlaRko3ZHVTNDZ6M3NhYWlIcVM4?=
 =?utf-8?B?U0kreXhKRGhRQXZNNkdBVGhVTXFXejc3TDhub3haTXg2RllwdGF5L3Jsdmxr?=
 =?utf-8?B?UnYzZ0xRZmFaM0VmRWdkVHhmVDBDeHFsTm14UVFZdlQzNWxLU09qRW4yZll6?=
 =?utf-8?B?Y28vMGNZMnpLMStBeXVpODQvaktxN1gyNDE1bEpOdEdkbVB3NVBmNURuYWFH?=
 =?utf-8?B?bDV3NXBubnIwU2NGaVZRbGFJczk4QXZleGNnR1hPZ0lOY0hsVEdYNkRFdGxq?=
 =?utf-8?B?M1dSNmk1UksrdFpmN0NoQjBUMmFVallKZ3Q5dlh6UzVVTURYVENqU0xGblFV?=
 =?utf-8?B?Q3hGOXBkdCtWS0xCaFdDbXd6VGY3ZEQvcndocitNNmJ5VC83ekpIWG9GZUla?=
 =?utf-8?B?U05oTUVWcGpSOVV4Vmh5YTh3TnNic2F4d1AxK2Y5Nks3NWZIbDRRV0xYVDE2?=
 =?utf-8?B?RFdtTlVUQU1KTHJJQ1ZhUkNWakxzZjNPc09LWWpuS1FEN3F3eTg1RzJFMjFN?=
 =?utf-8?B?SndhdjRDMlJ6T1lLVENsREV5S3ZaNmJLSlBjd2c3NE94aEhtbUtsSXBlRjdt?=
 =?utf-8?B?K1hkLzlQeVRsbDlwQlFEM2pzWEVFUm1NeGJESTJnalc5S29HTS9LdlcvVEJD?=
 =?utf-8?B?K0tuMmVmT2ZWaVBjemZBYWNkM2V6endseTdOTnVNbGptREZmOW1NL2I2bDA4?=
 =?utf-8?B?YURvWUkwaDBJMG9uWEY4dVdyTDh1cnRJalBkcE1TTG1JSkVBakQxVmJnRGZm?=
 =?utf-8?B?R05ZY3l6ZTcwMmkwM09UYXp5VjJSVXJYaitrbGpPQWFUR0R6bU1wOS9PZzJD?=
 =?utf-8?B?cm5KcTdROFRqRTJyOHlYRlozT0JTRnNYOW9OK080ZW9URS9mNXBiWHJuTTh2?=
 =?utf-8?B?anlCbVpodWcvL2FpVDB1Q2M0NnhZcXlFQktRSFBKOWo5WUVtS1dJWitiZ3pQ?=
 =?utf-8?B?VDkrdWYyTm9iR2o3c25TT3MxclpNK0I0YW1Ic1h2TzBBQyt4QTFNdzNCYmkv?=
 =?utf-8?B?MU1JV2pZSkQwL002clRlVk43REpJNWh0a1c2R1dnSUpUa0xzNURXM0U5MUlY?=
 =?utf-8?B?SE9BcVl1ZU0xM2tZdExreEp6a2ttSmMxcGgyNmVmOHIyMlE2bk5Lc2ZPMmI1?=
 =?utf-8?B?SlNONEJEdi9LQWNjLzIyMnNseHhMQnZRVE9TMWY2emMwLzBYb1BkWVJPQmJF?=
 =?utf-8?B?c0piOEY3eTNucU9ydmJmcHhPUC92K2h3SWtZRTRrNXQvVVVPaU1YNEZXN2Jh?=
 =?utf-8?B?ZU9vMGVWbGZVdFh2bkZSa000SjVmSEFOQ1FUeFVUK2FEY3lERE1nL3dGWUJX?=
 =?utf-8?B?dWIwZURtTVVwYytCcWdDTWpteHBGWnI2SnJzdzc1TzkxaHBHTVlEUGdnZGNI?=
 =?utf-8?B?RGxsSko1MUkvSUJhay9hLzkrTXRKOFBla2RISUxSeU5tT1F4dGpVdisvOXMr?=
 =?utf-8?B?emFIbkxrcmY2TU1wRGVkWE9OL2tLemNQY3BHYld0NS92WkwzLzN1WktJcTZ5?=
 =?utf-8?B?cDBUcm1UUEg5bU41Z2lDSTBuVlVGVWJwR3hUWWJhaGUvcGRLSktsSENmM0p4?=
 =?utf-8?B?TU45MHhWZ0hSNmJKa3EwYWhzUk43Witwb1ZuYWt6ejFWWjBqSmRVbVkwaDVT?=
 =?utf-8?B?R3RVS1BCNVlRSkw3czcxbXpvMW9SSXhqRUlLRkd5Y0FkdUpORWJ1S0x1T1pG?=
 =?utf-8?B?dVdwa1dFSkMzYWNaQzNia3piWWRMU3N2YnU2WldyNmZSdTNTM1YxYzBkZHlT?=
 =?utf-8?Q?a6ItNLWdodiaf3MA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5370D0CE634BAD438833183D8D84F942@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8d2197-f09b-443c-fe19-08def111306b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 03:42:06.1953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lH3SlV0Zl/qoUEgic1K2o0RlZGrDVcAOKtg/FC2KMHyYM+u9bN/Kke4Svvb/XXbSMjHQypMFMiceAufyxL7Tt2H1NxCCLU12aH5fviPpY3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR04MB9348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_204213_680784_2A9E4A51 
X-CRM114-Status: GOOD (  25.46  )
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

T24gNy8zMS8yMDI2IDEwOjQxIFBNLCBNYXJrIFJ1dGxhbmQgd3JvdGU6DQo+IE9uIE1vbiwgSnVs
IDI3LCAyMDI2IGF0IDEyOjI1OjM0UE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPj4gRnJv
bTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQo+Pg0KPj4gVGhlIGVs
MSBkZWJ1ZyBleGNlcHRpb24gaGFuZGxlcnMgYXJlIG5vaW5zdHIsIGJ1dCB0aGVpciBwYXlsb2Fk
IGNhbGxzDQo+PiAoZG9fYnJlYWtwb2ludCgpLCBkb193YXRjaHBvaW50KCksIHRyeV9zdGVwX3N1
c3BlbmRlZF9icmVha3BvaW50cygpDQo+PiBhbmQgdGhlIENvcnRleC1BNzYgZXJyYXR1bSBoYW5k
bGVyKSBhcmUgb3JkaW5hcnkgaW5zdHJ1bWVudGFibGUgY29kZS4NCj4+DQo+PiBNYXJrIHRoZSBi
b3VuZGFyaWVzIGV4cGxpY2l0bHkgd2l0aCBpbnN0cnVtZW50YXRpb25fYmVnaW4oKS9lbmQoKSwg
aW4NCj4+IHRoZSBzYW1lIHN0eWxlIGFzIHg4NiBleGNlcHRpb24gZW50cmllcy4NCj4+DQo+PiBU
aGUgQlJLIGhhbmRsZXJzIChkb19lbDFfYnJrNjQoKSwgZG9fZWwxX3NvZnRzdGVwKCkpIHdpbGwg
YmUgZGVhbHQgd2l0aA0KPj4gaW4gbGF0ZXIgcGF0Y2hlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBIb25neWFuIFhpYSA8aG9uZ3lhbi54aWFAdHJhbnNzaW9uLmNvbT4NCj4gDQo+IFBsZWFzZSBk
b24ndCBkbyB0aGlzLg0KPiANCj4gVGhlIGluc3RydW1lbnRhdGlvbl97YmVnaW4sZW5kfSgpIG1h
cmtlcnMgZG9uJ3QgZG8gYW55dGhpbmcgdXNlZnVsIG9uDQo+IGFybTY0IChzaW5jZSB3ZSBkb24n
dCB1c2Ugb2JqdG9vLCBldGMpLCBhbmQgYWRkaW5nIHRoZW0gdG8gYSBzdWJzZXQgb2YNCj4gYXJt
NjQncyBleGNlcHRpb24gZW50cnkgY29kZSBnaXZlcyB0aGUgbWlzbGVhZGluZyBpbXByZXNzaW9u
IHRoYXQgdGhlc2UNCj4gY2FzZXMgYXJlIGRpZmZlcmVudCBmcm9tIG90aGVyIGV4Y2VwdGlvbiBl
bnRyeSBjYXNlcy4NCg0KT2theS4gSSB0aGluayBpdCdzIGEgYml0IHVuY2xlYXIgd2hhdCB0aGUg
c2NvcGUgb2YgdGhpcyBzZXJpZXMgaXMuIFRoaXMgDQpzZXJpZXMgc3RhcnRlZCBvdXQgdHJ5aW5n
IHRvIG1ha2UgdGhlIHdob2xlIGRlYnVnX2V4Y2VwdGlvbigpIHBhdGggDQpub2luc3RyLCBub3Qg
anVzdCBLcHJvYmUuIFdpdGggbXkgcmVjZW50IGludm9sdmVtZW50IGluIEtwcm9iZSwgdGhlIA0K
S3Byb2JlIHBhcnQgaXMgaGFuZGxlZCBjYXJlZnVsbHkgd2hpbGUgb3RoZXIgcGF0aHMgYXJlIGhp
dCB3aXRoIGEgZ2lhbnQgDQppbnN0cnVjdGlvbnRhdGlvbl97YmVnaW4sZW5kfSgpIGhhbW1lci4N
Cg0KSSBjYW4gc2VlIHRoaXMgaXMgY29uZnVzaW5nLiBJJ2xsIGxpbWl0IHRoZSBzZXJpZXMgdG8g
anVzdCBLcHJvYmUgDQpub2luc3RyIGFuZCBtYWtlIHRoZSBjb21taXQgbWVzc2FnZXMgY2xlYXIu
IFRoaXMgc2hvdWxkIGFsc28gZHJvcCBhIGZldyANCnBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuDQoN
Cj4gDQo+IE1hcmsuDQo+IA0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtNjQva2VybmVsL2VudHJ5LWNv
bW1vbi5jIHwgMTkgKysrKysrKysrKysrKysrKystLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9rZXJuZWwvZW50cnktY29tbW9uLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9lbnRyeS1jb21t
b24uYw0KPj4gaW5kZXggY2ViNGViMTEyMzJhLi40NjY1MjljY2UxYzMgMTAwNjQ0DQo+PiAtLS0g
YS9hcmNoL2FybTY0L2tlcm5lbC9lbnRyeS1jb21tb24uYw0KPj4gKysrIGIvYXJjaC9hcm02NC9r
ZXJuZWwvZW50cnktY29tbW9uLmMNCj4+IEBAIC02LDYgKzYsNyBAQA0KPj4gICAgKi8NCj4+DQo+
PiAgICNpbmNsdWRlIDxsaW51eC9jb250ZXh0X3RyYWNraW5nLmg+DQo+PiArI2luY2x1ZGUgPGxp
bnV4L2luc3RydW1lbnRhdGlvbi5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvaXJxLWVudHJ5LWNv
bW1vbi5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgva2FzYW4uaD4NCj4+ICAgI2luY2x1ZGUgPGxp
bnV4L2xpbmthZ2UuaD4NCj4+IEBAIC0zODAsNyArMzgxLDkgQEAgc3RhdGljIHZvaWQgbm9pbnN0
ciBlbDFfYnJlYWtwdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3IpDQo+
Pg0KPj4gICAgICAgIHN0YXRlID0gYXJtNjRfZW50ZXJfZWwxX2RiZyhyZWdzKTsNCj4+ICAgICAg
ICBkZWJ1Z19leGNlcHRpb25fZW50ZXIocmVncyk7DQo+PiArICAgICBpbnN0cnVtZW50YXRpb25f
YmVnaW4oKTsNCj4+ICAgICAgICBkb19icmVha3BvaW50KGVzciwgcmVncyk7DQo+PiArICAgICBp
bnN0cnVtZW50YXRpb25fZW5kKCk7DQo+PiAgICAgICAgZGVidWdfZXhjZXB0aW9uX2V4aXQocmVn
cyk7DQo+PiAgICAgICAgYXJtNjRfZXhpdF9lbDFfZGJnKHJlZ3MsIHN0YXRlKTsNCj4+ICAgfQ0K
Pj4gQEAgLTM4OCw5ICszOTEsMTUgQEAgc3RhdGljIHZvaWQgbm9pbnN0ciBlbDFfYnJlYWtwdChz
dHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3IpDQo+PiAgIHN0YXRpYyB2b2lk
IG5vaW5zdHIgZWwxX3NvZnRzdHAoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcg
ZXNyKQ0KPj4gICB7DQo+PiAgICAgICAgaXJxZW50cnlfc3RhdGVfdCBzdGF0ZTsNCj4+ICsgICAg
IGJvb2wgaGFuZGxlZDsNCj4+DQo+PiAgICAgICAgc3RhdGUgPSBhcm02NF9lbnRlcl9lbDFfZGJn
KHJlZ3MpOw0KPj4gLSAgICAgaWYgKCFjb3J0ZXhfYTc2X2VycmF0dW1fMTQ2MzIyNV9kZWJ1Z19o
YW5kbGVyKHJlZ3MpKSB7DQo+PiArDQo+PiArICAgICBpbnN0cnVtZW50YXRpb25fYmVnaW4oKTsN
Cj4+ICsgICAgIGhhbmRsZWQgPSBjb3J0ZXhfYTc2X2VycmF0dW1fMTQ2MzIyNV9kZWJ1Z19oYW5k
bGVyKHJlZ3MpOw0KPj4gKyAgICAgaW5zdHJ1bWVudGF0aW9uX2VuZCgpOw0KPj4gKw0KPj4gKyAg
ICAgaWYgKCFoYW5kbGVkKSB7DQo+PiAgICAgICAgICAgICAgICBkZWJ1Z19leGNlcHRpb25fZW50
ZXIocmVncyk7DQo+PiAgICAgICAgICAgICAgICAvKg0KPj4gICAgICAgICAgICAgICAgICogQWZ0
ZXIgaGFuZGxpbmcgYSBicmVha3BvaW50LCB3ZSBzdXNwZW5kIHRoZSBicmVha3BvaW50DQo+PiBA
QCAtMzk4LDcgKzQwNywxMSBAQCBzdGF0aWMgdm9pZCBub2luc3RyIGVsMV9zb2Z0c3RwKHN0cnVj
dCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVzcikNCj4+ICAgICAgICAgICAgICAgICAq
IElmIHdlIGFyZSBzdGVwcGluZyBhIHN1c3BlbmRlZCBicmVha3BvaW50IHRoZXJlJ3Mgbm90aGlu
ZyBtb3JlIHRvIGRvOg0KPj4gICAgICAgICAgICAgICAgICogdGhlIHNpbmdsZS1zdGVwIGlzIGNv
bXBsZXRlLg0KPj4gICAgICAgICAgICAgICAgICovDQo+PiAtICAgICAgICAgICAgIGlmICghdHJ5
X3N0ZXBfc3VzcGVuZGVkX2JyZWFrcG9pbnRzKHJlZ3MpKQ0KPj4gKyAgICAgICAgICAgICBpbnN0
cnVtZW50YXRpb25fYmVnaW4oKTsNCj4+ICsgICAgICAgICAgICAgaGFuZGxlZCA9IHRyeV9zdGVw
X3N1c3BlbmRlZF9icmVha3BvaW50cyhyZWdzKTsNCj4+ICsgICAgICAgICAgICAgaW5zdHJ1bWVu
dGF0aW9uX2VuZCgpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICBpZiAoIWhhbmRsZWQpDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgIGRvX2VsMV9zb2Z0c3RlcChlc3IsIHJlZ3MpOw0KPj4gICAg
ICAgICAgICAgICAgZGVidWdfZXhjZXB0aW9uX2V4aXQocmVncyk7DQo+PiAgICAgICAgfQ0KPj4g
QEAgLTQxMyw3ICs0MjYsOSBAQCBzdGF0aWMgdm9pZCBub2luc3RyIGVsMV93YXRjaHB0KHN0cnVj
dCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVzcikNCj4+DQo+PiAgICAgICAgc3RhdGUg
PSBhcm02NF9lbnRlcl9lbDFfZGJnKHJlZ3MpOw0KPj4gICAgICAgIGRlYnVnX2V4Y2VwdGlvbl9l
bnRlcihyZWdzKTsNCj4+ICsgICAgIGluc3RydW1lbnRhdGlvbl9iZWdpbigpOw0KPj4gICAgICAg
IGRvX3dhdGNocG9pbnQoZmFyLCBlc3IsIHJlZ3MpOw0KPj4gKyAgICAgaW5zdHJ1bWVudGF0aW9u
X2VuZCgpOw0KPj4gICAgICAgIGRlYnVnX2V4Y2VwdGlvbl9leGl0KHJlZ3MpOw0KPj4gICAgICAg
IGFybTY0X2V4aXRfZWwxX2RiZyhyZWdzLCBzdGF0ZSk7DQo+PiAgIH0NCj4+IC0tDQo+PiAyLjQ3
LjMNCj4+DQoNCg==


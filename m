Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09098CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTMnW3DqKHnEXJbGJ3gQcHdCP8JB0FMoRa2g/dio4ao=; b=savBLJSZWAHUdeeh5ci2BjfoOB
	z6gJqOZ78Har9J/OLS1TeXbI+h4OybYyl6XerKUk4py5d3Zk8sCumG9EP1sUuhK6bmqqgmPhNHFaR
	lhu9+qzUCTWMa6m+1e3ebvNFOo+5Oa5xWpv891Sft+lAk/wAxqkaSMJGfVOc0dD9FSJiSOM721sRd
	WCP4JNvM6RRRH9nmH/PzqAy6qBDgoDTbAw+gTC8l2n/oVoXRLddNH+e6Lhgh9s9ne2r40o4Fkytit
	MjN6j8B1XQvgAPlMFi6Tu12qB/yLl8pkKWIqW8hcDQ7oJxrmd93XUK2KkNxZDSpsxJRGNSYPTiHm6
	OzFHAAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0K-00000006DgK-1Ksc;
	Thu, 14 May 2026 17:37:48 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0I-00000006Df7-0mRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPTEpQ7hdgMnUqP+21YYMJnuy7GG25bJHI3BKjl930LbqodNqAEbNEjjXo1ESkhYyoJAF28g5VQPbsJ/4Qg5B60GKuaYFAe5WG5KwvH5zhuPgeaf3Saa4IranV7VDfOSRmIu4eMXIwZ1RPO4a37Wx+E7IdmTHPZmd+xuXY6jVJ/Yqc+zvoWAa73lqzRYRQMNFipgHG+Hm3A6y7t+PQ7LN8XnDOzGlPlFAG82OI4EELw4CA/EjU5adljrndtA7zg1E0KpsS2AMvNTTsWGC13ZMrMHXMO209lFFqSK9yaCnYEzW5hpUYu5j3bm/mrwKPqT88JAtThzFns57ujlBhoKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTMnW3DqKHnEXJbGJ3gQcHdCP8JB0FMoRa2g/dio4ao=;
 b=ao2GTMbLOh0wSqYhSXqdwiVlrIDQk8UhNlSrqncRtwc4+IyOBfJebRKNfAkKRgR1ysprjwqAGxQmntKKnQF2DvCvUxFGbHNs+j1tTZqJbTPXbgF2rqbgor4NFgYdU175vJM3/z7ywagWxGmSh/obbyXAD+cfSasgHyR24G85bopkBXnGf4fDGpolBAW6FMiafn1e6mydabM9NszMBJVLoEJNcy9XmAEql2Sb8d1Da9bngSFSmba1+WVZUfqhgYyQmowQ/+h+Ssw1g2HVFHWtYxRopO7atIpl06WVbp9lcfsZOaFiFAner4MNQ9TPigke0PGj40Z5IVC6Z8QYAEjkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTMnW3DqKHnEXJbGJ3gQcHdCP8JB0FMoRa2g/dio4ao=;
 b=MX9lKUldCxBNQvPunuVdmTQ1TdCJKD0A40uYu9+N/8406ZHkucLqDhRSj15niNou96yc5r5Om+Qfv+MgUqDdqjeTkj31GOIu5HTnArG7ulWouD61GjNfMPkPpRnfkaynS11YkT932UnanFcoZ5qTvmSYmwIm1ijybi2I0Fkfmy2I/RF08tiTL8yzWB6qVOovbDOFV+oGo1tLlTMxxRL6CNK0mgG+1PpIDj46Spc2sUG5aOhayIA+2sSvGSo8i20eoZLNMCWzxMucZWgLpMJfFAOrGbKhtSSALRaCmdpG/yUk7Uyk2im0qYq/PnH8nozFySVqFhvP75If9lr3FHCZmA==
Received: from PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Thu, 14 May
 2026 17:37:38 +0000
Received: from PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009]) by PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009%4]) with mapi id 15.20.9891.021; Thu, 14 May 2026
 17:37:38 +0000
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Topic: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Index: AQHc4oidjgTu+I+rK0a55/7Ex9LQK7YMM0IAgAApeICAAOLtgIAAi/GA
Date: Thu, 14 May 2026 17:37:38 +0000
Message-ID: <5AF8DFBF-18EC-4C8A-84A0-F27298DB9BD0@nvidia.com>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
 <5325A2E7-4987-400A-A1B2-A5C3122D88D1@nvidia.com>
 <20260514-serious-bumblebee-of-prowess-b6bf2b@sudeepholla>
In-Reply-To: <20260514-serious-bumblebee-of-prowess-b6bf2b@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.500.181)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7183:EE_|IA0PPFF4B476A86:EE_
x-ms-office365-filtering-correlation-id: 2ed766ff-a1bc-4464-4d75-08deb1df7e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|38070700021|11063799003|4143699003;
x-microsoft-antispam-message-info: rGFSQYDiYxrX/MPXJkpN2hCf/97EX3HXWcnZX0cpHB0FHhHHLuRhuZWeiBX4hx9JZsNcSDzD7apzIw7oQ3zKC2bf+bkJb+6J4PzoE5W4AVQNc5//pMGiPQkS/NjlpZ3IpOnOtA0QpIxgm4nlffxqaXKzXcPSwb6f/I7cQXvQcInLhIagXmNMnyW/ppaUW7Y+w3OLjd9iZ9aX6Wuj1YM41TtmMZeQkHPh84zhmcQm4yQ8seVmshIRd+dt9rzsWseIpu3F9StCyhYQYdWSVA8ZRv9S5PgOk3B1oQJdTiYBw7dYkXPe+GRTSQf4PoswIcWcutPWECLd+YfpwNT+FHlCLhshpnduxk3tsj431G6nqFgZARB9lTDPEnVs3Pc/+f3/MLIX1LHhlknmOHPQFpXDuedjuP0g2LKTrrDtJc3IVzURF2QW5EZ+qKEHkDRrQ05zM/zLBu1o+0MWdByCERdkEAhlh9xsOa53Qk/WFYO1RhKpM86vlGIVX6GfvYb6NO3oBI8pWlisV7Gv6y0/7PYYdbN91mbWfIGBXj/Q6XC+DmqxAeNYGuHpPMDwLc16C4gFY0v6bw2TqzvZ1ljpor4hSunhLGjx2W2ZklRD6zdCQtvnF/SQZSrwUBe7MnwF+7J8/DGXWj8tbPvzKZJ1oB3RQ0cW+sLNHgKYkYTOeejHBjlnneFtQ0eMgWxlAhukXtjDzWgu1Iz9VLWaGn1tWEHbbVUgb5jnuxX8hjc6KVGXYKHD4IP0HlUqU4Dok4QkGHGy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7183.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38070700021)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akdFbTYyUHdzdjB6dnRMdkpBN3I5d0R6dFRjRGF1WHc2UlI2MXp5VHB1QklD?=
 =?utf-8?B?ZG1BajVZM3oyTDArTGxHQkdPakVEaWtNejMyM2c0L2hZNEZydm5TcTFKYWdx?=
 =?utf-8?B?YmFNUWhyS01xZm9CU29HQXg5SksxbERZNFZUVUJ2bi9wRnBwUU1vUFp5STZh?=
 =?utf-8?B?MjlBOHpEbHVXV1c5dDFCK3VLRUZJVmpuN1FIMkFtNzNpWUw5QzUrcm1YL041?=
 =?utf-8?B?ZmU4S3g5cXBlQXhVV2NXNjBReXAzUkpUMDVCT3pMZWttbFp5dXhoS1BTVjBs?=
 =?utf-8?B?aWJQR1BsRXRhZVR6YnRDQzkrUTNuRzJCaW9qRUNWbFNvZkdLWTZNKzJhV0VR?=
 =?utf-8?B?Si9uRU5mYWx4aDdQa0pYdWoreE5kTlFZSmhJaU5rM1Zwby9ubE5rNXN0a1o0?=
 =?utf-8?B?eUpLbUNYOUVreHNHU25NT0FJYWtLdk5ic2h5UC9Vbm1PTjR5RWpyWkZiaXRx?=
 =?utf-8?B?OUZ1dnIrWE9jcEJUeGJXd3NvZVFwQkI4TzdYOVRnVnNhMHZ0ZzUzSkhLRG1r?=
 =?utf-8?B?OXJpb2Z3Qlc5dXcwVkMrYWoyckVHWVJNdm5sajdZN2c3SUxvajBkUjk4MEpW?=
 =?utf-8?B?SU04WWo5bVNUMHB6Q1ZHeEdNL0hld2pVd2RZL1FFSWVJYktaektRWFIyYlp6?=
 =?utf-8?B?b1prc2lXOCtLYW90NStWSTdrcFV4QXJxMzJLaGlQUXZwQmN1bGl4NFc4OWRm?=
 =?utf-8?B?TWtpTDdwaXY1Tm5Yck9vcnFhUkVBVnJSc3lybDg4SkczKzNDYW5SV3AvUi8r?=
 =?utf-8?B?L0Y0Smdyb1RhMUtONll3R1ZsaVFGMDlRb0pmY283Wjl1dFNubml0V29pZ0pD?=
 =?utf-8?B?RWovalhCblRublZrQ3FXaEFieDV0endqMStEaEpOQjNjc1kyK1ozSkdKR3BY?=
 =?utf-8?B?Sk9JdFV6VEhuQTlYUzEwVDRuZG1Nd0VyN0ZmV1FIa1lXVkI5TjliYi9FZnFQ?=
 =?utf-8?B?L0VYTXlHcFgybmREUTZYRnk5T2lwQUdxMVFwTHV3STJZdG1ERlVJS1FZaTJT?=
 =?utf-8?B?WXREbk5pVDNHMGlQR0UzV0pGK1pJYkJLOXIwdEdaaUxpNzI0NzUzMjA4ejla?=
 =?utf-8?B?cnRwQjNBaVM5VjF6Yi9xUnBic0t0bzNzRmRTWThtNUY5ODBrblVYMGdjWDNs?=
 =?utf-8?B?WWVGczZvMm4xaVpwNENBZWJnTXZqazQ3Wmc0T1VJZVJtT1grcFJITUlFakVn?=
 =?utf-8?B?U3U5ZFIrd2NvajJUU3lGaDE1MWZyTE9VZVJJM20vUkNPd1dMREJQeEpQN2Rx?=
 =?utf-8?B?azJCU2V1Vlc3aWxvbENGNytZZDg3M1lqNGlNK09VbnRzYWtKb0lDaVRVdWkr?=
 =?utf-8?B?OXZvbW4vK3dDMVppanZMbk01UWRiRWtDcjNnRk05eTR2QmVSeTBmNVFPSDJm?=
 =?utf-8?B?clNOWWJ5enFuVkg3R3RvS3B1a3ZYU1oyT2NxSFJCOFhFM2pWREQyRkorVzA5?=
 =?utf-8?B?UW5XVUdjVDM0MW1BN2ZVNklBaGxlckpFcFprRzFVY0hIeXcxMTJaNTRMUHh0?=
 =?utf-8?B?UXRZbEc4aE1LN01qaitDSWF0OE95NTZXWWhpczRmNXNMNWM1QU40WHdOS0hD?=
 =?utf-8?B?NUh2R3N2TGgrRURSUUdXTVB1b0kvek9zUzlNOHJKYVRxanFSYjEyanNFb1l5?=
 =?utf-8?B?Q3Y0eHN5ZjVBeTVpaC9vRExJclY5VFJnbmE1NDdXWFFwQXFLL1hCVC8xZ2V3?=
 =?utf-8?B?MEEra3BaMjZkUzlwS2tQVGhDUTlQOFFZZ2Q4VzUxNXZCcXZvOUVwMmE4MlFI?=
 =?utf-8?B?SytiUzQzWjF0eXNjTnNzYXZkaVJBMzR1SVFKSW5UdnRDOXJCR2w2RkFVZWVu?=
 =?utf-8?B?TGljSC96Y1J5Z2I1SXEwelB2elhueTl6U2dIUHB0T2t4RjhtektiMlB2a0dm?=
 =?utf-8?B?dEZWSEl4UVRqbVA1SnV5c0Z3N0d3TTRxczBhWHFTbnVpTll0cVdkRHhXd3o2?=
 =?utf-8?B?VXVodmNPYkNSbDBrMlE4UlU3dS9sYndMdlZBeDIvK2xsdEptdWdFYU52bVhV?=
 =?utf-8?B?N1FyWDNyZTd1eWozWTVoL3pBUEl0d1hJYWhZS1c4MXBUczY4WFU4YTBnanVG?=
 =?utf-8?B?VkpYaFVlcVNEQW5MSkJHVmhtakNsd09lejYzUU5nOXBLTXc5QkNjb2VrdUJZ?=
 =?utf-8?B?K0xaeXRrempLQU0vWFRwcDduZ1dzQWVaeWxzSGtOcGEya2dDeDJiRXlwdFNT?=
 =?utf-8?B?ZTdlZWx4dmlSZmNBUW1FTnF3YzJiMXBmUzB2UktxTytJeGc0b0g2dTRhaEZp?=
 =?utf-8?B?dzhEanFBS0V2V2tYMnJUTnZiclRpeHdMQW11QTF4YUNLZDdWRHF5SWNKTzdB?=
 =?utf-8?B?ZGVBSUhEeFAydFJZNkM5RCtzZUZSTjBoZHBWZmdyNUNhaGdRWU5CZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15C1F4A9761B1E43AB18E74E66262995@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7183.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed766ff-a1bc-4464-4d75-08deb1df7e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 17:37:38.3376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JH+qR2WG1deF0cmUz1zBrdwncPAM6uCD4gBuDV4E6+XL7xdVuzxG05/tzSKaE75nRohTgj3bf18VkvLkHT075A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103746_224340_20A86236 
X-CRM114-Status: GOOD (  19.16  )
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

DQoNCj4gT24gTWF5IDE0LCAyMDI2LCBhdCAyOjE24oCvQU0sIFN1ZGVlcCBIb2xsYSA8c3VkZWVw
LmhvbGxhQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQg
MDc6NDg6MDVQTSArMDAwMCwgSmFtaWUgTmd1eWVuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBN
YXkgMTMsIDIwMjYsIGF0IDEwOjE14oCvQU0sIFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgTWF5IDEyLCAyMDI2IGF0IDA4OjI4
OjAwUE0gLTA3MDAsIEphbWllIE5ndXllbiB3cm90ZToNCj4+Pj4gX19mZmFfcGFydGl0aW9uX2lu
Zm9fZ2V0X3JlZ3MoKSB3YWxrcyB0aGUgcmVzcG9uc2Ugd2l0aCBhIGhhcmRjb2RlZA0KPj4+PiAy
NC1ieXRlIHN0cmlkZSAocmVncyArPSAzKSBldmVuIHRob3VnaCB0aGUgU1BNQyB0ZWxscyB1cyB0
aGUgYWN0dWFsDQo+Pj4+IHBlci1kZXNjcmlwdG9yIHNpemUgdmlhIFBBUlRJVElPTl9JTkZPX1Na
IGluIHgyWzYzOjQ4XS4gVGhlIHNpemUgaXMNCj4+Pj4gcmVhZCBpbnRvIGJ1Zl9zeiBhbmQgdGhl
biB0aHJvd24gYXdheS4NCj4+Pj4gDQo+Pj4+IFRoYXQgd29ya3Mgd2hpbGUgZXZlcnkgU1BNQyBy
ZXR1cm5zIHRoZSBGRi1BIHYxLjEgbGF5b3V0LCBidXQgaXQgZmFsbHMNCj4+Pj4gYXBhcnQgYWdh
aW5zdCBhIHYxLjMgU1BNQyByZXR1cm5pbmcgdGhlIDQ4LWJ5dGUgZGVzY3JpcHRvci4gVGhlIGxv
b3ANCj4+Pj4gc3RyaWRlcyBvdmVyIGhhbGYgYSBkZXNjcmlwdG9yIGF0IGEgdGltZSBhbmQgZW5k
cyB1cCBwYXJzaW5nIGV2ZXJ5DQo+Pj4+IG90aGVyIGVudHJ5IGZyb20gYSBzbGljZSBvZiB0d28g
YWRqYWNlbnQgb25lcy4NCj4+Pj4gDQo+Pj4+IFRoZSBGRi1BIHNwZWMgKHYxLjIsIHNlY3Rpb24g
MTguNSkgc2F5cyB0aGF0IHRoZSBwcm9kdWNlciBzaG91bGQNCj4+Pj4gcmVwb3J0IHRoZSBkZXNj
cmlwdG9yIHNpemUsIGFuZCB0aGUgY29uc3VtZXIgaXMgc3VwcG9zZWQgdG8gc3RyaWRlIGJ5DQo+
Pj4+IHRoYXQgc2l6ZSBhbmQgaWdub3JlIGFueSB0cmFpbGluZyBmaWVsZHMgaXQgZG9lc24ndCB1
bmRlcnN0YW5kLiBUaGUNCj4+Pj4gbm9uLVJFR1MgcGF0aCAoX19mZmFfcGFydGl0aW9uX2luZm9f
Z2V0KSBkb2VzIHRoaXMgYWxyZWFkeSwgYW5kIHRoZQ0KPj4+PiBSRUdTIHBhdGggc2hvdWxkIG1h
dGNoLg0KPj4+PiANCj4+Pj4gVXNlIGJ1Zl9zeiBmb3IgdGhlIHN0cmlkZSwgYW5kIGJhaWwgb3V0
IHdpdGggLUVQUk9UTyBpZiB0aGUgU1BNQw0KPj4+PiByZXBvcnRzIHNvbWV0aGluZyB3ZSBjYW4n
dCBzYWZlbHkgd2Fsay4NCj4+Pj4gDQo+Pj4gDQo+Pj4gQ2FuIHlvdSBjaGVjayBpZiB0aGUgaXNz
dWUgaXMgYWRkcmVzc2VkIGluIC1uZXh0IGJ5Og0KPj4+IENvbW1pdCAzOTc0ZWExOTM4NDAgKCJm
aXJtd2FyZTogYXJtX2ZmYTogQm91bmQgUEFSVElUSU9OX0lORk9fR0VUX1JFR1MgY29waWVzIikN
Cj4+IA0KPj4gVGhhbmtzIGZvciB0aGUgcG9pbnRlci4gIEkgdGVzdGVkIDM5NzRlYTE5Mzg0MCBv
biB0aGUgc2FtZSBoYXJkd2FyZQ0KPj4gdGhhdCByZXByb2R1Y2VzIHRoZSBidWcsIGJ1dCB0aGUg
ZGVzY3JpcHRvci1zdHJpZGUgaXNzdWUgaXMgc3RpbGwNCj4+IHByZXNlbnQuDQo+PiANCj4+IFRo
ZSByZWxldmFudCBsb29wIGF0IHRoZSBlbmQgb2YgX19mZmFfcGFydGl0aW9uX2luZm9fZ2V0X3Jl
Z3MoKQ0KPj4gc3RpbGwgaGFzOg0KPj4gDQo+PiBidWZfc3ogPSBQQVJUSVRJT05fSU5GT19TWihw
YXJ0aXRpb25faW5mby5hMik7DQo+PiBpZiAoYnVmX3N6ID4gc2l6ZW9mKCpidWZmZXIpKQ0KPj4g
YnVmX3N6ID0gc2l6ZW9mKCpidWZmZXIpOw0KPj4gLi4uDQo+PiBmb3IgKGlkeCA9IDA7IGlkeCA8
IG5yX2Rlc2M7IGlkeCsrLCBidWYrKykgew0KPj4gLi4uDQo+PiByZWdzICs9IDM7ICAvKiBidWcg
aXMgaGVyZSAqLw0KPj4gfQ0KPj4gDQo+PiBXaXRoIDQ4LWJ5dGUgZGVzY3JpcHRvcnMgdGhlIFNQ
TUMgcmV0dXJucyBucl9kZXNjID0gMiBwZXIgY2FsbCwNCj4gDQo+IFdlbGwgd2h5IGlzIHRoZSBm
aXJtd2FyZSBzZW5kaW5nIDQ4Ynl0ZSBlbnRyeSB3aGVuIDI0Ynl0ZSBpcyBleHBlY3RlZC4NCg0K
V2UncmUgc3RhcnRpbmcgdG8gdGVzdCB3aXRoIGEgdjEuMyBTUE1DIGltcGxlbWVudGF0aW9uLiAg
VUVGSSBicmluZ3MNCnVwIGl0cyBGRi1BIGRyaXZlciBmaXJzdCBhbmQgbmVnb3RpYXRlcyB2MS4z
LCB3aGljaCB0aGUgU1BNQyB0aGVuIG11c3QNCmtlZXAgZm9yIHRoZSBsaWZldGltZSBvZiB0aGUg
cHJpbWFyeSBWTSBwZXIgREVOMDA3N0EgdjEuMiBSRUwwIHNlY3Rpb24NCjEzLjIuMiBbMF06DQoN
CiAgICAiT25jZSBhbiBGRi1BIHZlcnNpb24gaGFzIGJlZW4gbmVnb3RpYXRlZCBiZXR3ZWVuIGEg
Y2FsbGVyIGFuZCBhDQogICAgIGNhbGxlZSwgdGhlIHZlcnNpb24gbWF5IG5vdCBiZSBjaGFuZ2Vk
IGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlDQogICAgIGNhbGxpbmcgY29tcG9uZW50LuKAnQ0KDQpX
aGVuIExpbnV4IGxhdGVyIGFza3MgZm9yIHYxLjIgdGhlIFNQTUMgc3RheXMgYXQgMS4zIGFuZCBl
bWl0cyB0aGUNCjQ4LWJ5dGUgdjEuMyBsYXlvdXQ6IERFTjAwNzdBIHYxLjMgQUxQNCBzZWN0aW9u
IDEzLjkgWzFdOiAiU2l6ZSBvZiBlYWNoDQpkZXNjcmlwdG9yIGlzIDQ4IGJ5dGVzIGFzIHBlciB0
aGUgRkYtQSB2MS4zIHNwZWPigJ0uDQoNClswXTogaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9k
b2N1bWVudGF0aW9uL2RlbjAwNzcvag0KWzFdOiBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2Rv
Y3VtZW50YXRpb24vZGVuMDA3Ny9vDQoNCj4gLS0gDQo+IFJlZ2FyZHMsDQo+IFN1ZGVlcA0KDQo=


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A698CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3flF4y8V7ol7/Q8e/ZCfxxXnMjqPMJVKGns3Tw1TqFA=; b=QiN3m3NEakLN4vJE+LH8F81V67
	3IeRvYdZ/SJrI6fpcXl50C+e8EtF5e4HZBgXcdOm5WdYIck+ZC+lPXlW6W+OAE1QF79r9ErMEkJoA
	7o9nLUgCA+yICMuwI+wqpF0M612Ckxp+9IiSOATwxdFGXStsb7MMa+PHw9Mau6ljeOSrDaTZBBS9k
	7sKubPFVN1KKRoBNWfzL1pN/7x6QUNeJ9N2/DLbi9Wi6LK5LwoGm+jFY8eP9bQnui/qXXHD24pDkk
	sQJG73ztL7zAYi1R96IGOv6RJD1QS2IzK8BniCui1U5Kw9hTXT00PJJiKT+Uxgir8Dd6ywHg5yKLJ
	kfEW+8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrBN-0000000EOFX-0UeD;
	Mon, 18 May 2026 06:10:29 +0000
Received: from mail-southcentralusazon11012036.outbound.protection.outlook.com ([40.93.195.36] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrBJ-0000000EOEH-0Pw8;
	Mon, 18 May 2026 06:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6iUe9i4mFm/3YiKkZbb1llDUK1W+sGr9p7v1vDuSAakpzkGjxxG1A2m4E5sk45x052zrP/Qy+zORRBAd5R5ZcFdxetV3Re5+cd9UEpOoN9lUFuO/4/CBQUsPI+6zYmMKGBwwLFZUPSmiHptiLTKXPkrU1zSsTJagbdPMN8bmiUnGVNnW8VvRmQrQuWZRYCmTApg0jA8E/Y2GPpfU/p+3HxNTxL988jJvLxqG/FKwNyrotZvP6enx0u7U4SpDc09W1znpujnd6ShS7SHmCeIg5PkfyU0rHfbSR//IkqhAe6ZVyCDEHVoXGpvsN5X9qWKZNJZI2hkx6ImxOLHutGnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3flF4y8V7ol7/Q8e/ZCfxxXnMjqPMJVKGns3Tw1TqFA=;
 b=eBl1zQ8tlpFLN7nEbRUMgiSZScVhavjc6mKXwOq+ad1Ics9OUn2qwrdXnR2WCulYQEdpOsswgFTRIdQcM94NZpfIRCzM+3xumS6m5L1HBelDMHFK3jjqjdLygM/Kar3/cX9CZ/NIcOVChPwf5PgswLhm9jOxBzM5UrW9vLpQi0kfUk24Q2wiR6t13luHIuvItH0GmTxg/fXaJrys1udd1AV00b9HhGmalE/w1a+3LEw3HtiVD8xAgMgwKfxd1taV/eiAV3WwTW9FeATzwm1ijQE5X3gmSPHtN1f/q7zJlhoLAzuovZ/Vai1nHhPgUpLFhueGfMJUj6HR1VUqVFNOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3flF4y8V7ol7/Q8e/ZCfxxXnMjqPMJVKGns3Tw1TqFA=;
 b=vRYso6dmjdhlBgdE07FZYy3rAfPYSHlXIfb16T2wQrziaJjkBD9FVVskvWMjRVPwi7frnBWN7BJjeJprn6eN9G/UVH+DnzPg+arOLM15NBhm7zUrc0o29dFOpgy4WDY6ACb/gVuoyxzxAmbKwyB2Im8iMKR3TgYVjQqCBO4f6OOkbGZKLU1CMbgrZHNlQgoMUQoMjAVdhYyNqqzT+6J8SF9Sftt5Rve3oyE9U1nJZrFfxma6Os2OJOAXFIWNrl9qPi6erG/nzHxm2Ht1FYgQduLX1ZnnDADlied1kI7vmivy+VyvChC/Qi8WAG7bJvXd8BYAurXKcjVGT9YnnSQa6w==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DS7PR11MB6101.namprd11.prod.outlook.com
 (2603:10b6:8:86::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 06:10:19 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::ad98:5674:dd4c:875d%6]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 06:10:19 +0000
From: <Manikandan.M@microchip.com>
To: <claudiu.beznea@tuxon.dev>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<linux@armlinux.org.uk>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<tytso@mit.edu>, <Aubin.Constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<Romain.Sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<Cristian.Birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
Thread-Topic: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
Thread-Index: AQHc3f5hiQrjI09J2EOEyCmbhs7ALLYQ4BwAgAJ95wA=
Date: Mon, 18 May 2026 06:10:19 +0000
Message-ID: <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-5-manikandan.m@microchip.com>
 <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
In-Reply-To: <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DS7PR11MB6101:EE_
x-ms-office365-filtering-correlation-id: 82658dff-d478-49f5-ea8d-08deb4a4237a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|11063799003|4143699003|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: dFYx3VANm0mUeOWOzxDmWllJCxif++Ml8mrr9RUaDixrFXgEm9CFWUyrqB2lvYy98XJrE4wjxcXWGJ1Ru8aoTCt2tXXOdYH/gZMDUqe66cIu76/xNI2XHjTVNmufsj6a33R0u/3lYb5RtsWxHTQYI7XpN/3npXMNr1/c2SfPy36cTed+7ytgb4YvvqHlRIB6p9gJamp4fMT1hW0JUXA31rUZ1uBHl8QG18QThzfs7kddxNLwKarAbaHTUlrwIV9Kro4rrxuHseXt0f9xLG1FQpMje94IO1oM1HphaPt35Dankwg3H4Pqs2ogEBbZg30Henoykq5zXsGW/p6kRmJVEl85oGy6kNRuxysvxIDDxbHm/PhXeJO1RLIO7ppSp+ye7qvlWp5rxrpemY5WJKo8KxDkxS7pWBwPKIcZmpuJ1wuMcvHFBCae3lZ90AnJaiqTd5VL3R/iw3M3I1L3ou8jax9vtN+bd65sg5/TYww1U/p+0omiI8VWjkyOax481om88JNpO2NW+GFZ6SGSNUNqxc9DgjemxFq43FLxZUD3esD5WXoFhjVNoLpqnz5kgLjRprCTtGVFo4BpQl9RuYUM+Hc5Eim8diN4IA3i6wGHT2k6nlTfXvy8h+L6Vw3m9rl7QDHUHszJDlcIkxB5Qv7Mz2ohZRu0GChTvNAaDGuM44oueH5WixOoCfqkIsBDxpomJCiR83xcSXTurw9S0Tit8KdC501FDFjSun/BYm+oJtU8wEhj1bqG9ECIx/tQH1ew
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpJUmk5eXNpVTVWcDVFa040L2NGOXJ1a2NmSCtJK1VrSTBUUVJ3ZEVMaXht?=
 =?utf-8?B?bUpKK3hnNVpIV0NZWVpHNWN5S3NFYTU1WWgzWHFHOFhHb3Nxb2VjcVdUbVdW?=
 =?utf-8?B?ak5MY21wSW1Qd0xwQ3VxdmdFQ1AzVVlpTENZVFFsOURWdTFLV2lLbkgxMFNU?=
 =?utf-8?B?czl1TGFIakF5ZkY1aEtUNkVTZmJLWmlYRXdQaG9CbVo5ZTM0b1M4UnNsNXJZ?=
 =?utf-8?B?bEJaMFYyRTN3Mm9TUVRiSUFxQXZRQmtxUHhqWG5rTkIxZ29wbjkrUk9vSjNr?=
 =?utf-8?B?VlhjeGxSS3l1blVjc0loMkFQWlFkQWRMS1AzaDhXTHcrV1N5bUVVMnAxM01S?=
 =?utf-8?B?NDYxUWJ2K0I0ckE1VzZzeTBBU3VaNTh0RlJGb1VpMWhtQzRIUXd1anJNRlNu?=
 =?utf-8?B?UHhhOVdTWHU2R1N1WmN3eGIyb2J2T0UwdVI2dnM0U3laSWFoMVd2U2Uwa2dt?=
 =?utf-8?B?OUpCL0JqVzVqSGVQYjgycXlHRmdPd2NtN0Q1OVdGUlMwdktsVVdnTU0vVVhk?=
 =?utf-8?B?eVhNRjZTUk53dHVZcnJTWWhGdVRUODVLM2FZRTFPZlRHcjJFSzJXSm14WFAy?=
 =?utf-8?B?WWxwVTJxemx6L2JNc0kzK000ZDBsZE41NHl0UXBMVWttaG4xUGF2Q0dkNG0r?=
 =?utf-8?B?ODdaYlQ0aUVsTi8zNHdvVGFRaTBnNkVmZUlEbnkyMHZ6bHcxMFNDNDdMRHBR?=
 =?utf-8?B?R0wvNElkTjdkUXRSMGIrc1R4cFd5Qnllc0tuUDgxRGNxdUFEZmxVTkY3eFRv?=
 =?utf-8?B?aFE3Q2xCWGFFaDBVM2pvRDMvTGFoNlNjN014SEJ1OWxUWTFHaUhCb0svV3FD?=
 =?utf-8?B?VzhTb0xEQ3QzWSttTjhNdEpqWFJQdjVoSWFjV0YzZlFWRXZMY3dSQWM1Z0Jj?=
 =?utf-8?B?MnRqeUdJU1I5OXllM29vT2FxTGFTOG9aSUlOcjhnanNxbXBWRUhQWGdyVHFJ?=
 =?utf-8?B?L05SR1RUTjNnU2ZNbkJ2d1U0d3ZIUWkzUVNlRTBQTWRmNkFhbldJeFNyYkFQ?=
 =?utf-8?B?N0pSVy9NYkZCdjlqQlp5aEFFY0hXWmF6MWJhL3AvQTVCT2JITEZFSmZjREZP?=
 =?utf-8?B?QXE5VUFoTmtZY2xRVzlvNnhVU2pudjdlU0YzaDlZRjg3YWJOWlViWnA3Qyto?=
 =?utf-8?B?SDNrSVMrdzdGZTB1dWRVaFVEbzZ6YUpSUDFYc3dBQldSdFdqRml1KzhTZnli?=
 =?utf-8?B?YXIrNm5IOVVaeE1pME44WHVieHhtNXJVZlg0SnlETlk1bGxNY0NVaTEvNThq?=
 =?utf-8?B?czRkOGFUTjZsN1hUWEsxTGNEa3N3WkJvdHk4WXZhTTRvdmdSc1M2UFgzZ0Zr?=
 =?utf-8?B?MjRrSXpLRXRSV01CdlAxOHpBZ1EvUXFKNTV1dzRqM3JrRCtnQ1o0V0R0N21s?=
 =?utf-8?B?eHR5WmhXYUkvaWoyWjI3WUh4Uk1sUWR1c1JpTEtZWGNiSUtSRldxRElLWUFI?=
 =?utf-8?B?SDQ4bU5zRHc0azQ4WUxhN2gvNmRPZXBJbVJ5aXVFOEZ2VTRoc2NzQkNMWXRH?=
 =?utf-8?B?b0RteW9wK2hkMDI3YitVSFhPb1ludzlSeHFBN09Vblh2UVVTNEY2Wm9mSDJn?=
 =?utf-8?B?b2g1UTBhRzVzcTdaTmIvNGJEeVRYS2VmcWJqV0pET05yM1huZGFWNUxJMkx1?=
 =?utf-8?B?U2dQcnRoVE1FNnJseDkrdWcwVm1RQWNPb25oTndWanlwWW9Ra1BHSzBUTFd5?=
 =?utf-8?B?SCtUK3dLM0hYR0JmR1dISFprbUtERkFQaWZwRDhFVUtGb29CQXRkUjRHaEt2?=
 =?utf-8?B?UTFXR2VBNDU5elhpTmZCaTk2MnZIVDFWb2V5R1NWWndpL0pFWGFqdlJSWjFz?=
 =?utf-8?B?MWpFTEJzYVNFalQyQTI0VkdzQys2bWVVTlYvNjNLb2tkM0ZRWWQxZFZXRmNY?=
 =?utf-8?B?NXRsTWxVN21DQVkrbGJnY1ZYUndnbXEyYk1jYTh1SzNNNTZlczN6NDZGZ2N2?=
 =?utf-8?B?NExGUGlQSmNhdy85Y1hDK2Q4VXZrUEMzN0xiRjNkWWxlMXorZk9vWmQ3VXZW?=
 =?utf-8?B?Ym84ODNlSml5UU1PUTlYMjZqNk4rUHNMYlhMZkpUWWVzbWZ0N29Sd3lHM3gz?=
 =?utf-8?B?OW5nQ2JuNHAxUFVFR1RxeFdMYnY4SXVpMHh6MVpDYU1RQ0NWVUdxRVFmUnZN?=
 =?utf-8?B?a2JWeWZrUjRvYXlPQWZZV1JlUWxTaFhwTGVlV09taTZtSE1oZnl1QnE3YzNv?=
 =?utf-8?B?dnh2NW5FTlRVL0VQZmdRSmg0OXpGWm9HUkZ5dUw2anVMalNjSEJQdituWXZk?=
 =?utf-8?B?UGZVZ0hzM2h6ZUdBWEJwR3Era2FxaWpFSHRCNXRmcDBZejBXTXFncU4wUko2?=
 =?utf-8?B?V0QxVTM5U2xUUjUrRGE3Z1lPeUtBUnN2dHdnN2pEMFpGVVRQQjNwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5120D9471FE12449EF9708052D37129@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82658dff-d478-49f5-ea8d-08deb4a4237a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:10:19.5914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbxbjIJwRY/cn3+0QLx3UciQn+Zw7iczWY8KfurFB/+yFkg6esVYA+78mW67P8YiFo88ZDXvjFJcVNdaRCYWEWT/7VAKGAl50suSKvpcjhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_231025_431406_135340A6 
X-CRM114-Status: GOOD (  20.05  )
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

SGkgQ2xhdWRpdSwNCg0KT24gMTYvMDUvMjYgOTozNyBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6
DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLCBNYW5p
a2FuZGFuLA0KPiANCj4gT24gNS83LzI2IDExOjQ4LCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3
cm90ZToNCj4+IEZyb206IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1pY3Jv
Y2hpcC5jb20+DQo+Pg0KPj4gQWRkIEkzQyBjb250cm9sbGVyIGZvciBzYW1hN2Q2NSBTb0MuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogRHVyYWkgTWFuaWNrYW0gS1IgPGR1cmFpLm1hbmlja2Fta3JA
bWljcm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
IDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MzoN
Cj4+IC0gUmVtb3ZlIGNsb2NrLW5hbWVzIHByb3BlcnR5IGFzIGRyaXZlciBlbmFibGVzIHRoZSBj
bGsgaW4gYnVsaw0KPj4NCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2Q2
NS5kdHNpIHwgOCArKysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtYTdk
NjUuZHRzaSANCj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL3NhbWE3ZDY1LmR0c2kN
Cj4+IGluZGV4IDY3MjUzYmJjMDhkZi4uZWMyMDA4NDhjMTUzIDEwMDY0NA0KPj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL3NhbWE3ZDY1LmR0c2kNCj4+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2Q2NS5kdHNpDQo+PiBAQCAtMTA1NSw1ICsxMDU1LDEz
IEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZThjMTEwMDAgew0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDA+Ow0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1jb250
cm9sbGVyOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsNCj4+ICsNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaTNjOiBpM2NAZTkwMDAwMDAgew0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2Ft
YTdkNjUtaTNjLWhjaSI7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHhlOTAwMDAwMCAweDMwMD47DQo+IA0KPiAgRnJvbSBtYW51YWwgYXQgWzFd
IEkgc2VlIHRoZSBzaXplIG9mIEkzQ0MgcmVnaW9uIGlzIDB4MTAwMC4gVW5sZXNzIHRoYXQgaXMN
Cj4gd3JvbmcgSSB0aGluayB3ZSBzaG91bGQgdXNlIDB4MTAwMCB0byBwcm9wZXJseSBkZXNjcmli
ZSBkZSBIVy4gUGxlYXNlIA0KPiBsZXQgbWUNCj4ga25vdyBhbmQgSSBjYW4gZG8gaXQgd2hpbGUg
YXBwbHlpbmcuDQo+IA0KDQpBY2NvcmRpbmcgdG8gVGFibGUgNzguNiAoUmVnaXN0ZXIgU3VtbWFy
eSksIHRoZSBJM0NDIHJlZ2lzdGVyIHNwYWNlIA0KZXh0ZW5kcyB1cCB0byBvZmZzZXQgMHgyNTgs
IElkZWFsbHkgdGhlIG1hcHBpbmcgc2hvdWxkIGhhdmUgYmVlbiAweDQwMCANCihuZXh0IHBvd2Vy
IG9mIDIgY29uc2lkZXJpbmcgdGhlIG1lbW9yeSByZWdpb24gYWxpZ25tZW50KSwgdXNpbmcgMHgx
MDAwIA0KaXMgYWxzbyBhY2NlcHRhYmxlLiBQbGVhc2UgYWR2aXNlIHdoaWNoIHZhbHVlIGlzIHBy
ZWZlcnJlZC4NCg0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUNCj4gDQo+IFsxXQ0KPiBodHRwczov
L3d3MS5taWNyb2NoaXAuY29tL2Rvd25sb2Fkcy9hZW1Eb2N1bWVudHMvZG9jdW1lbnRzL01QVTMy
L1Byb2R1Y3REb2N1bWVudHMvRGF0YVNoZWV0cy9TQU1BN0Q2LVNlcmllcy1EYXRhLVNoZWV0LURT
NjAwMDE4NTEucGRmDQo+IA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcG1j
IFBNQ19UWVBFX1BFUklQSEVSQUwgMTA1PiwgPCZwbWMgDQo+PiBQTUNfVFlQRV9HQ0sgMTA1PjsN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+PiDCoMKgwqDCoMKg
IH07DQo+PiDCoCB9Ow0KPiANCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFu
IE0uDQoNCg==


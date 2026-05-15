Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C9BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 05:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=; b=a2rAbEExSLuY/5g/piYR7stsih
	EHxbM3bdFFd8WveJJbqCbQXHaKK6HRK4AQ03VK8J7LH141qFvM5/suTdFYdFGxsEKyiNQdSDOejnT
	gfemgzSGvtYwzEjIyBuJP8ZcJj9ekB4xE8p6KO01K14S7t3HcQr9Z/BqRGhWzrTYH3ZdoYVdPGHNs
	ubYacAaBWZw8gHSGhy/DIgVjWyYaioc7sYQPXwkxbyMZKm8sFZGK9xxZoTwejw0a0I5IHkB5/TDLU
	TkPjOef3JesBjUGmNrsOFx/31LWL1Q62fEh8/9OQcpfrUb96TrJsPddSDYI/H3XlRpsQGceiFuSXD
	38aBSmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNklm-00000007NLB-1g6W;
	Fri, 15 May 2026 05:07:30 +0000
Received: from mail-eastusazon11011040.outbound.protection.outlook.com ([52.101.52.40] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNklj-00000007NKh-3kDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 05:07:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQW2Luls9iwORGo4InrdHlPsu8uOhl6NTALBez+I1u5XhhXkKu+CaDOanfGePx7KdYRUA4wihzbeWnSSp5R7HwbWdNKE8N+tiV/4Fkvk+nCgmE9W2MJ5SMqqrxx2kQPLBhVgNNzf7gS/0zvYz4yxg0uKHfS1CYNePjiB8w3ZeDlZv+NbeN5LY7RVdo+YqGcPAkb4P95M3CFbvWrdBhU3crMH7OE4UOs/3ejVbKTrr7EpOvgQ94OK5bszXqs9OTwRO9ZKfK25X7nu94BpqrV5B7akAEs7EcIbw2UhAUVdhsZHIki5GgGk6J7pRSrKuQnkERZyvophKEYlyR1kSzl/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=;
 b=giw+YSmfS1OKoQWVOiwr56IBuCWVU/HRoDlSmHfAn7SW552hcqmsT5qcgmQVoh4SuUd4xOXYRLuaMNZRxCKEmRnOktQHCNh+oL6aiUlJz7BdKuU8MIgoXiy0Kykg8ADQCfL3y2ZeZFeykYlW+eLhYSraRNVeyghp4I6lGvQAIs87PG9nECS0XgKm8orZyehcW/BkpXaeG6IRyqxMNuH2ulUsfUWqDt87cTJLPnyGlrBzMiX+W/BspM9Aa8JjOksAWkHm3r3r6uy1VyYDTnQJsBgDbIA9vJNKkSTzxZAhKlvNI/cUms3UOkH4CbYHm941dDlv6ym74qgEdAi9J2sF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=;
 b=k2tupvDo/pzYjlkmupIO8hf/DjFQ089U4m/2uOLWkbJR8PO945pn7e/PFoCsgqe03tje+GS+ypJABKeS3cfUJW4BqLUK/ZRpKyfs4UbLyClPgmiLM/dX70tKeIT/Vrel27ZTRUbpQubOP5QIeyV8lhP1L6TKl7X6NQgBnT85P/sbk+iUTFjlKFDouLOpDfGIbXoaSj7QP9uerv462YrjhyLGCsXI3D95NTDVk4Bd8mXlXkA6DlCY6HJXMXMB2M0uy8qP9RdCZPGhY3QoqHrmyH+fEBmo+D932yHe2b19nkgEhNaujF2sUZ5174n3DlFkOEwNIE+GQrlDLg2fu9Ahog==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH4PR03MB7700.namprd03.prod.outlook.com (2603:10b6:610:236::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 05:07:22 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:07:21 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Topic: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Index: AQHc41NcpAoBmAXoX0mFuOxhs2EIlbYNxfyAgADEyIA=
Date: Fri, 15 May 2026 05:07:21 +0000
Message-ID: <3b83d71e-7f1a-4d88-bc10-6628f8a9a57d@altera.com>
References: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
In-Reply-To: <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|CH4PR03MB7700:EE_
x-ms-office365-filtering-correlation-id: 82d14aa8-5629-4174-ddf1-08deb23fd889
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|55112099003|22082099003|56012099003|18002099003|4143699003|11063799003;
x-microsoft-antispam-message-info: nb9fn7wK6iwrMqGKzWtp04rdqAbiC54p+GtT/GNFRU52s/XA/UZBMYtJqWAOWJ3LnxWRIuZA4+s9Tj9RAaI/j/xi6sI9oKS0nDBg1l7L74JdXOd/wwmcf/pkN7E1orw8zW8dMxxIFpKsEVjK7NS10oUDnRITo+zRjUTXpgifX8ByU9AVbQgph9R5bPiPPXlCfAIrz+45x+Lm5y/LqG74749l/4DiQq1o06ySMFeA9zxX2LE7x0SRthviMn6xgxdYLwI9xRhYgAOrwf09HcN7wyLoaA4IdBTM051P5H3JYlrkD1ja1wBA/S1IowOyeZSW5MShjiq17nAX1Aoclx0+Y5t2IBzUH/KmrgWajDPTcwAu8fT8KHAvGagzbZOtjimI3/NdE7UHqCwwTWnNCZ/GEJOgUE1jPi9buBCO3SINkS7oo5DswRec85yCn5Q2/tUvoAY2v1vG9wjS7BESEEf7kdPM0uwup7l7r8TtX93pT7ZtbYExsUGPms5SaVZi+vwPk+t2AasVCHzBbfKTv5ZRPgzEMtjHEr5/ebYFT1v8xmKWyhbskc+VX+tBP8rfZ64ByqVi6LG3ZHeH0h/UC+N2Rngrkx/Pfv78ZZYYPHrzG7B8DiUZ6RSzxnsDIACX9XZU9501ZCsJ4X5DrOXBuFucL5pL2flQbIETrbN+3xoMMzvIuD2y7/SyWw62mZh314IR3HjWvLJydoVXKx3ZHsCvu6ZsplMpQEXZtbncThPiJRNq2vWua7E+jbQ4A+adBmkJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(55112099003)(22082099003)(56012099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWpLYVlvNzBOb3podXRKR0svSFV4UEttUmhYeFhvZjZMenlDR2sveGZFL3l1?=
 =?utf-8?B?YXRMWVg0dEs3b2FqV1NDd3htbVYydkQwWDE4em5uM3hjeVJyRmZpRXYxOS9t?=
 =?utf-8?B?YUxpTW00aVg1MlEzVkV5SWdseURhRTgxN0J2UHAxWU5YNkhsbzJqTnFhU0Q1?=
 =?utf-8?B?RGJ6Zy91VTc1c1BsWWd0eUdsNTl1Z2REeStVTitUell0OVBQM2NZVjgydVRt?=
 =?utf-8?B?ZUk2a2EyYzhmSGpvYS9aeGpYZ0p1OFg3bUNjT1IvODBsOFY0bEd2QlllN0RW?=
 =?utf-8?B?N3BFS2dIZ2QrZS8raStDTC9UQnBZT0hLNzNBSFptTW1BdTNmMzdmbFNwN29D?=
 =?utf-8?B?SjFWVERPcmd4VHA5RzlNalJjUzNoeTMwRHRDeXVzcDhnOFZDN003bzZUdk9r?=
 =?utf-8?B?WUlFT0pmUDA5SkpPODY2MDk0UiswbmIwRTBoQXE3cUxBZTdjNjlaMC8xZWVM?=
 =?utf-8?B?VHhOem5aR0VSRUhoUmx0QW9KaWtBaGVJTTV2aG5VWlF1ajg1c1hlZmVoN09s?=
 =?utf-8?B?UXlYRzIyaEtGQnhrWFE1emZsSC9wNjU2WHBPRm4rMmxVNWJHVDJPRWZWTSs0?=
 =?utf-8?B?NURRZDlzU2wyWi8vZ3ljT1lPWjk2NkttRzdCSGFsNjRjTnVjS05GUDZsUkY2?=
 =?utf-8?B?MGJ0UVhqWk9XZlRMNm1MOVY2cGRZUHczYTBwMk82eXJDZE9EZlJLa2dWa3VH?=
 =?utf-8?B?QkRhb1pxSlBEa0t3bm5WbXdHU0w1TFVlSWFEKzB5YkZJZUJKUXZPdTNFMTVv?=
 =?utf-8?B?aEZwUHFnTkVtY2hhSk52UUxhZkhwMDJlanRVK3FLWmpPbUFFT09kTUpYbE5v?=
 =?utf-8?B?U3VyQVErVXZYK2tuT3JtNW5PQ3owbURKQkswRVJMcitMWmlDVjhldFdqVGlB?=
 =?utf-8?B?ZTRRS3NJNU9hQWM5TThuYkNydmJPNSt1WmJBVVcydXYxMEF3VjlqSWpzNE1v?=
 =?utf-8?B?WkN0Wk9LdHp3K1ZDNjh6YlkvdG1qNXZQRU5XeHJkb2wrRU8vbEtMaUdQZlpH?=
 =?utf-8?B?cVBvY1l4QkVoRjV1aHRxSHlyU3o3ZHZtMEpLeUs1ZFpycUtLNDJRTVhMWWV1?=
 =?utf-8?B?Z3JqVnpQek96TFZrQWlnWkI3SjlONThZSWJRQStTUUY5MmVoUzFFZCtrSFZu?=
 =?utf-8?B?bStlbkh4MGtsQ1NKM0pHbnpna1E1SEUxZWhLQUthWHpOY3AwVFFPczI0U01C?=
 =?utf-8?B?Y2NoQ2xRczFya2EzcTZWaWZyRmVNTFgraUhQSEI4cHlnMTBIMERId2NHdGR5?=
 =?utf-8?B?TloxRmk1MGZNbW5qY0xYUEs0dHlkL0lkZFNHY0lHMUNzcTVKc3BJSmxZR0hO?=
 =?utf-8?B?QjM1L3V4dElRVXZRa3pEQytkUUQvY2JqUDdBWVAxekdjWmNNQXJBOXBsZlpq?=
 =?utf-8?B?Tk9zTEpGbElYU3dJN00ycmdNTDhhMm5mcFJXMjFzMGdUYVVMdWxmSHNsQi9J?=
 =?utf-8?B?aHFHYlVnQ1BHbmxBQjZDN1k2ZTlTR25pWW92N3JJcjRJQnA0Rm9sWGw2b2hG?=
 =?utf-8?B?VFQyalNDK0d1K010R2c5THQ4NTRHLzFkbFZjVXVLU0Y2UW9ub2E5ZmdPKzgx?=
 =?utf-8?B?a3QyZFBzdkkrZWk4dVd5MkNLa1RMSGdmaHNCb001NVEwWnQ4ZGpvU0pNREJ6?=
 =?utf-8?B?aWFZWFlJOGdpZVNJUkFuYXBKQW5uTG9zdG1rZDJ5ckIyRUlzOGdCYkdrZmRx?=
 =?utf-8?B?TU11ZWovNWdGdk9IbFU4Ynl0Q2pmc0swVnRwSHhGYVRWY2hmLysxSkZoWUxH?=
 =?utf-8?B?UEQwZXU3LzFyTjV5WC93bFVKaG1MMUs3Y2w2UklsQlp1SlZOWnR5TjRvY0pT?=
 =?utf-8?B?Q1ZDTW5zd0JJODRFczAwa0hIU2RqVHE3NGt6SG42N3pHM28rMDhwSXY0YUkz?=
 =?utf-8?B?VTVVQ1VDTGRSb2dUQjhRRWpvNmRBZHlCM2l4MmVwRjY2VTRnZUVRdnlKWnE2?=
 =?utf-8?B?b24rUndHT0o2TXJDTzRQajZPUjd5V2EzRzQ1amVicWtWTFVtSnN5dkh5WTZT?=
 =?utf-8?B?cHdydjZDM0RvSkJqZkZKYUtQanpSRXFWWjlsajZ3NWdQQVdoSG9EOGE5RzNR?=
 =?utf-8?B?VUNNS09Nc1gzaFlEL0VRU3pKTXFCV0RRcSt1bXpSMHQ2UzdVUFJYNDYxT0I3?=
 =?utf-8?B?eEIzc2xzV1BMbFdQallwUFdJWHZkR3l3cENLL0oyMTZwcFU3WjNFTU9nZklT?=
 =?utf-8?B?MmNIdTQ0aVlGYk8vckpXMUt6NDRBVkRRNHBXREc1ZnNpaEZNbkhuQjNzZWg5?=
 =?utf-8?B?dVVwUFBueTI0M1EzWTVHS2FkdVFpVDJJcnRBQzBGTGtibzIvUUxMckRLeTV4?=
 =?utf-8?B?VnJsb1J1ZHNBcEExTTNFUUJhdUNHWDVxUDl6K3JKQTdOMGdHYkg5ODFwQTAy?=
 =?utf-8?Q?GzfWvOXJfxU3u9LhesE7qNS6aHYVpRIbOXb1qZi448iWZ?=
x-ms-exchange-antispam-messagedata-1: D3tctVrcWKQAZw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2086AD7746C2944DB0B0B8D4BE090C2C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d14aa8-5629-4174-ddf1-08deb23fd889
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:07:21.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ0OsK942m88YDVb8WFRoeF6HtfnP5Xp07OFM0Hcy4Q+AQDiTluEYqj+NKw6JmV3x2DcDZNa/O75GqSFXadlJxy4E0fGO6Sqa+3nC6zyLWJPv8cEptf35CKVuU5tgY6ahgDV3zNW5F5Cs3LDFP+HeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_220727_934782_2312E4E5 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

T24gMTUvNS8yMDI2IDE6MjMgYW0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiBQbGVhc2UgZ2V0IGlu
dG8gdGhlIGhhYml0IG9mIGxvb2tpbmcgYXQgcHJldmlvdXMgY29tbW1pdHMgYW5kIHRoZWlyIA0K
PiBmb3JtYXR0aW5nLg0KPiANCj4gVGhpcyBjb21taXQgaGVhZGVyIHNob3VsZCBiZToNCj4gDQo+
IEVEQUMvYWx0ZXJhOiBHdWFyZCBTRFJBTSBpcnEyIHJldHJpZXZhbCBmb3IgQXJyaWExMCBvbmx5
DQo+IA0KPiBEaW5oDQpXaWxsIGJlIG1vcmUgYXdhcmUgbmV4dCB0aW1lLCB1cGRhdGVkIHRoaXMg
b24gdjMNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUxNTA1MDQ0NC4xMDM4MC0x
LW11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbS8NCg==


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5ADC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ch7xP+slovwM+pcB0H+k2l/ZUQs1hqqOWEvQHIJh2Ig=; b=dDlzSEiddZKhCYPFjkr7sgEy5U
	YvAFXqC9IPgbfmjS4HoKq8aRYlVwOe6gUVciZBmtEWtndo9wb4TJupYk4JdE3HgwLyKspq6yx1CtT
	t3IoD607w/tGm/T0JIoTpyX5pQJ6OD+RNe54lvPrahAAZAQ/EwVpxuaGj/7EtjYZ4pXeQc3REVJPH
	8JQwFX+8u090Xp2tsZSrkYX3lrru2cyhXIkGUnPiyAwAzVDVqSJUDVcgPON1BgTZT74f2oCJw8QRs
	a/H0vd57Br970Ga/ZioKWRD06sibkBP+I0xdJDuawemvMKOG+EUJIEyJhmt9kOquyTpnpvIzH73uW
	wchpojwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9wj-0000000G8Qw-2c7m;
	Thu, 16 Jul 2026 00:27:25 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9wb-0000000G8Pa-1mzC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 00:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opm2DgkKA0EAeMSYwVDcNu0LON1Qy1WmryW6/Hcbh97cdY+5Or2YOtRpTJ1Kft3C9s3ixmVoS9+XEbe609NGzgF4+uTvOhPt4sgv7bHvAUjSyd2sQT9mcOnysG5vPydJYMhW3fte8fBAhMLbVHTxErLbTeTm3fomcr4/DisM3VnO/VL7sAkwR19hSUOe1UFEDsF959vKyOT2mIrR+d177zMh+Szg4V5B1ZBp6fWvBR9SJdvELswJzJ7w+WcLqKKVPLGeEW9Nr1kxFUfenZmi3Mm3L2Q5uthMywDLr7SNRcLMnKilZG3fGsRsqDAqLJ4Sn0oU19xKwRMXDHQ6LsR3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch7xP+slovwM+pcB0H+k2l/ZUQs1hqqOWEvQHIJh2Ig=;
 b=TJwmUj5oXEZ4iLCiWuPR1U+TmqcP5Co4C5sZM2WvUXboXI5u0vw+oengkACueTULfuXVf+xzWWwlTXyA8CKwwbALSYdRwEQscxhi7azgWbprSaW8YIdhLcjRNyLaZ+SZ+mZhiGd7aqsBz3lM3LGRS9ZH8CBsYArcD6M754jiKtvvAVbhpPl9iYBcOLNlSI5f1W5TiXgG6xXOSf4Wz0Tk982WpHt4MStpFQXI7Us814h4UL50YbyjBBl35tQOeCHI9LUV543Y3JPm29JWyYR3dErFXgQfXN6u8t0HmVm9RBEE5AgLtRmTt69roiREa3+xX+4Xb8m+hEWFGURMC2Pt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ch7xP+slovwM+pcB0H+k2l/ZUQs1hqqOWEvQHIJh2Ig=;
 b=n+74UGuxrO7NXtTotCBPbEMD0Jx8fV7AbDR/IRuU83oW20Oy28yeSSzwTgDe/vFkRX4e+K1taBWfoJgDEEpZCMuUK77cRDHTiaIBH2vHYzIkX15kak+dqbwJD2fRtVfVJKanUP1yquHlEiabQdSkDOClYPVwl0MtefPXAMTsSvQ5qyuOcOSUdNdRtC5YZUrfd9AcrwgjWy0lZJbbbDJ5ygPmRJl1etmXHHDC6/SCj1tc4tRYsmeWsxPRKIsE2b6Sh7trfrdwG/zWpuRSFVljHtkWGHKmGtnSldza0uD0F/w/1zw685b87ICRZsraSdUJec38BFpHXoAu0qUW89xW8w==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TYCPR01MB11121.jpnprd01.prod.outlook.com
 (2603:1096:400:362::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 00:26:46 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 00:26:46 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: "james.morse@arm.com" <james.morse@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>
Subject: Re: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on
 restore
Thread-Topic: [PATCH v1 05/11] arm_mpam: Ensure MBWU counters are reset on
 restore
Thread-Index: AQHdFCDOGgMsxs/p9kaDstfIk2tWIbZuMPrKgAATNQCAAQaeag==
Date: Thu, 16 Jul 2026 00:26:46 +0000
Message-ID: <TY4PR01MB16930674F986639651CEE6C4A8BC72@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260710115546.29644-6-ben.horgan@arm.com>
 <OS9PR01MB16920A90EC44010A30A79A4728BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
 <0e4246f2-bcfc-4b08-9361-e87872c23672@arm.com>
In-Reply-To: <0e4246f2-bcfc-4b08-9361-e87872c23672@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-07-16T00:26:46.007Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TYCPR01MB11121:EE_
x-ms-office365-filtering-correlation-id: 3f665d9e-a1a0-485e-bf9c-08dee2d0eb95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|4143699003|22082099003|18002099003|1580799027|10067099003|38070700021;
x-microsoft-antispam-message-info: LFBVNnbcYpmblVBp0HmRTWeyREaTjc9+zf2+DLmOozwMUo4hFChONynAK76llpZDX1JH853O56aRfEEXz5UJeDvqHpwYpexrvCXcsMocptwcvzDQwXRE735FJNuIpRWuIoOFlMFt8X4PWGnlksfbBBuORgz7+OqFiLZXAq/gT4QokRLkUU0Jv1UGtY9ofGGLMLu3fpW/9Rph4Oevetn7DI8ni2mwJEhk8kTzwPOeHcGNRZMl6zM+Et3U3f1JnwhOHgAyb9y2J8UbNDyCHONaPNB3UUX92LpRXgj4dT6EbUs3mwlhx7glhsXhEqLa+SNUJbak8NnM9/o2n0Zj0yBS/l+lbZiaLN3DWTETit43hZR+c+8cKen269sii0JnN5gZekGxQDbFHItyhzbERSn8Lo1EycJBIuJvhgP288nj5GIVaugwLn5I2tmTEp8naznguZpht1LQBBnaKDA4rcSGw6cn9uH3zdJPxz66mhas0Ni5RAHYeDF3Gv6fH7f/VepyLnYsFq6W05XzKJNTz9Q8Nj1IN0D/s4wsDM3VQhJhGWCcO62QDdR67M8u54116c3qPWvuwH0ecXp6x5Id8nTxRs+EsHL3W4PFhNYhxtDzTn6abNRiq3pgJLtJlFdYjh20uH5RySr6sOLyhLwo+IBxSyRgHVeLysp57yMxBbYWNyUPt9suh+fIRE3jM7skk6QNErCEANkuCnfihXTFcWfFdlUNG56ZRkD3c66jh3P7wraEo4agCMmc0FT4SQyweBLA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(1580799027)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?RnR0ak9IRHMwSnhEREZZTEV1YVZQQnN0TTZqMGNaUklkVlgwWkYzVDVm?=
 =?iso-2022-jp?B?LzFhRU1SQzI0T2UxTGZwZXZSRDJLVHZHNWZ5SFROV0YxQWVwVXlWL3I3?=
 =?iso-2022-jp?B?VEF2V1VvdDlmSHd1Q1dmL2dlR0x2Umh2NEpLQkdFTUpRVENzVUtyWnd6?=
 =?iso-2022-jp?B?NjhXczFwcmFqbGdBaDB0bFNlR2d2cFlza0VwbngvRkdoYURab3UreFRr?=
 =?iso-2022-jp?B?QS9OZlhwRFM5RWhJWDBIQkk3QWRDaHVoZnFlQXJ4a1g0RFBhUllrOThD?=
 =?iso-2022-jp?B?M0tiSGhPS21xNVRhL1BucThLWS9ZaVJiTE5YMzFJL2Y1UFlKYnNPSnNu?=
 =?iso-2022-jp?B?NjR3djNhejljakxzYk1ERVBqeWJYMVFTU2laeC84cGErbjJGUFViQlp0?=
 =?iso-2022-jp?B?V0RPUUZvRkh3ZitxWFhYMG1GQ2p0RVZJemIvb3V0WW03REFsOFNGYXkz?=
 =?iso-2022-jp?B?M2lwMjZ2N2ZvR2FrTlRMUzRCMklsck5KcWp1N0pVVHArQm15WkFTWlZw?=
 =?iso-2022-jp?B?TEVMWHV1V3FoK3llcFVlRkhMQVlUa01CSFdrQlpSNkhCaUVUUTBlRHpU?=
 =?iso-2022-jp?B?OEUzd1VMRWhpUzZvMkFHYWJLRHY4NWJCTkRqa3k1RDU2ZmVDbWc2UU51?=
 =?iso-2022-jp?B?b1YxTUZ1Ni9LK2wwOURDbW4yS2hleEZmRjJrc0xtaDI1bmVvdHk4RDJn?=
 =?iso-2022-jp?B?QTBBemNNekR3dUlaL2VUSDZ3aTVDOW95RkhOZEUxUFhsQVQyNTNYbE5k?=
 =?iso-2022-jp?B?SjZGZDc0blhtS3VOUkYyVFpIc0U1QmcxcDh5RFE1aitESDhpSXdOUTMv?=
 =?iso-2022-jp?B?SFJWVFZKYWc5VXVEOXViODJVMXZnbW9lOG41VWZtMTRGMmxXZmZ4UWJo?=
 =?iso-2022-jp?B?ejVOcko1dG1PazNleEljK2NsYURoN1BFM0xabExTTjQvczk4ZVhCRmk2?=
 =?iso-2022-jp?B?T0ZFcVhYTC9EUmh6Z1pMNFovSm4rd0NMa0RoSzIrcG9kZGVDSVdUdjQ4?=
 =?iso-2022-jp?B?YnQ1K2h3amVTRzliWW8wU0xZUDJGQW5jdTkyMUZkbTBwbzJWWitNZ3lS?=
 =?iso-2022-jp?B?ZkdFZTRnbnpmKzZGdWhEd241TFd0RStucjd6WG1kTG8zM3pqWW9va05P?=
 =?iso-2022-jp?B?b1hKU1lvTmQwWnB5ZUgzWm5nTGt3YUV6WDVCblJZU28vQUlDU0JuaWVO?=
 =?iso-2022-jp?B?aCsreDk0dUd6b1ErNHh4TUJEMVgrY1B4Ri9RRmlNUWhsWmZXQ0pxbHM1?=
 =?iso-2022-jp?B?TkdRWnVxMjd2TW9aQjRIaGxwbEUyTW95MU1NUGhGREpveWlPUndIc0V1?=
 =?iso-2022-jp?B?RldMQU1Ock0vZkJSVE0vcFJEVitTanh6Ujk2YUdYM21ia0V1UE1NVjZ3?=
 =?iso-2022-jp?B?U1FtZGJFd0hnRDBpaS9TekJHVTUveDhXWlJIUFNKOXRraWxnTitkMEFj?=
 =?iso-2022-jp?B?M2diVXM5cExEaXU3Z1I0ZnZtZzRGQysyTk1hUlBuY01XaGVyQ0hYSlMx?=
 =?iso-2022-jp?B?YlVEalMrbnhwVitXdGJXVlJLOXMrQkZvVndlL3VaVDU4TlV4dktOejI2?=
 =?iso-2022-jp?B?SmpsUUxSanE4cmJVL1NHYWVQQXA3dkxZODczL1U3NU5LWm5zT1J5T1FN?=
 =?iso-2022-jp?B?d1lVaHMxYzg3amVmYXBGck5MYmRHYXloMVEwK2tCZ1dmbi9ySkFHeTE2?=
 =?iso-2022-jp?B?T09HcnpWbDN6TmlsVDNrQTFaNEE4a3Z1eDN6VU4zVmZQQ1VjR0N1SC9T?=
 =?iso-2022-jp?B?MU1CLzcvRmE5WkRwNENLRjJLQU1kYzc3ZnBYTHdOTjFGTU1La0YvWDMv?=
 =?iso-2022-jp?B?dVlpQzdWTEFpdU55bUlUUzcvTmhzbks5WFQ1R0dmU3ZiaThxZ05sVDZ1?=
 =?iso-2022-jp?B?NjNRNk5pTCtZL1ZEaVc1WXhnSmpZSUdGNWZ6VGR3QWs4Wk1TMVRGa0Nh?=
 =?iso-2022-jp?B?cEtkK1BtRmUxckFjTWhSYjVNczA3bHBqeEQ4V1lVWmw2VkFWRlFvVzNH?=
 =?iso-2022-jp?B?L1U3UkJFbThwdEsrVUlKODdsMjFUbVQrODZybzFVelBQRFB5TDdjbkp4?=
 =?iso-2022-jp?B?M2FCUndySzZuQ09rUmM2d0xqbkxyOWJPNzRQL1hyeXJoNnlMSC9OcHRa?=
 =?iso-2022-jp?B?L1pRTUdoc3J3c3FVN1NsMHFJclorQjVRT0h5YVRTS3pmbTRtNGhkQUQx?=
 =?iso-2022-jp?B?N1VIRlY2bFg1RVRid1FJdkpCUTlWUndGNStkQlBEMW8xTGhJVy92akxs?=
 =?iso-2022-jp?B?dHNCdHZaa2RoMEIwY3pnZEdTMWxsVzROL016WDlvbTR4czQ3c0RaWGZO?=
 =?iso-2022-jp?B?OTRJZFRKeTB6SVhla255MEJlYnFJL2JieGl6bUYyTG5kWHNOTXFkUE5W?=
 =?iso-2022-jp?B?SkNoTnVkUVNsRmNVT3dmcWROeXN6ZTlkYXZrZFdubGtlV0hYOTQ0NVFK?=
 =?iso-2022-jp?B?UFowV29IWTlpcUdZN0FBQWpXK1Q1ZEF4YWt0MzJ2VWtFQW4rNno4SXRw?=
 =?iso-2022-jp?B?MTV4TkE0TmFNMmZKS2hoU2ZXbW9mZTJEL0Rydz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q7y6kFHDX2RByJSe8AqX8B8VAxoYciEaCRUxWLJJZieCMXpstVs6bRoWnXTfJsyJFeZWiXn+LqJY/t7U1rboBAhQWnvXAqZdk12T8ntSp0PUbjs2NKEOZTSPP8PqnzmjHBW5h2yEevGxrqgeQt+gIvbcgbNUKsvmWiOA+OkXVTwtek9wElPVG9imyzdjftsOiTlhhbPrWS3iSQKijiXwS+5xDHx5jtbL0lbVKxhoa+Um+2xewrfwMikAezTF+DMOHZPeGGn9NTMoDXejnEJUjasIs/qGGtwpGDonhLdFitIeciVhJOQuOy5T3ZhJfWy7nlj5xVw6BsDFqtB6WXVeFg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f665d9e-a1a0-485e-bf9c-08dee2d0eb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 00:26:46.6377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oX5OEktMZ6TTvAuLVlHGfDMPV2kBFnIUJSVp2roQ2+ODckwoVEsXP3QobBX3fo4GFd0XPMcZpkDzqS35qXbeqBkppJ1owS7PpYwo/18HmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_172717_782612_839CA5CF 
X-CRM114-Status: GOOD (  11.29  )
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

Hello Ben,=0A=
=0A=
>>> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set=
 to=0A=
>>> zero in mpam_save_mbwu_state(). This is very likely to mean that the co=
nfig=0A=
>>> will mismatch when restoring and so the monitor will be reset. However,=
 the=0A=
>>> state may have been lost and so there are no guarantees. Ensure the res=
et=0A=
>>> happens by setting the reset_on_next_read and remove the unnecessary wr=
ites=0A=
>>>from mpam_save_mbwu_state().=0A=
>>>=0A=
>>> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power=
 management")=0A=
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>=0A=
>>> ---=0A=
>>>  drivers/resctrl/mpam_devices.c | 13 +++++++------=0A=
>>>  1 file changed, 7 insertions(+), 6 deletions(-)=0A=
>>>=0A=
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devi=
ces.c=0A=
>>> index b34e2a368516..222fc248067e 100644=0A=
>>> --- a/drivers/resctrl/mpam_devices.c=0A=
>>> +++ b/drivers/resctrl/mpam_devices.c=0A=
>>> @@ -1648,10 +1648,13 @@ static int mpam_restore_mbwu_state(void *_ris)=
=0A=
>>>          u64 val;=0A=
>>>          struct mon_read mwbu_arg;=0A=
>>>          struct mpam_msc_ris *ris =3D _ris;=0A=
>>> +       struct msmon_mbwu_state *mbwu_state;=0A=
>>>          struct mpam_msc *msc =3D ris->vmsc->msc;=0A=
>>>          struct mpam_class *class =3D ris->vmsc->comp->class;=0A=
>>>  =0A=
>>>          for (i =3D 0; i < ris->props.num_mbwu_mon; i++) {=0A=
>>> +               mbwu_state =3D &ris->mbwu_state[i];=0A=
>>> +=0A=
>>>                  if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))=0A=
>>>                          return -EIO;=0A=
>>>  =0A=
>>> @@ -1661,6 +1664,8 @@ static int mpam_restore_mbwu_state(void *_ris)=0A=
>>>                          mwbu_arg.type =3D mpam_msmon_choose_counter(cl=
ass);=0A=
>>>                          mwbu_arg.val =3D &val;=0A=
>>>  =0A=
>>> +                       mbwu_state->reset_on_next_read =3D true;=0A=
>>> +=0A=
>>>                          mpam_mon_sel_unlock(msc);=0A=
>>=0A=
>>         for (i =3D 0; i < ris->props.num_mbwu_mon; i++) {=0A=
>> +               mbwu_state =3D &ris->mbwu_state[i];=0A=
>> +=0A=
>>                 if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))=0A=
>>                         return -EIO;=0A=
>>=0A=
>> -               if (ris->mbwu_state[i].enabled) {=0A=
>> +               if (mbwu_state->enabled) {  //this line might need refac=
toring=0A=
>=0A=
>I'm unclear on what you are trying to point out in this email. Please can =
you explain.=0A=
>=0A=
>Thanks,=0A=
>=0A=
>Ben=0A=
=0A=
Inside the for loop, you introduced `mbwu_state =3D &ris->mbwu_state[i];` a=
 few lines earlier, =0A=
and then used `mbwu_state->reset_on_next_read =3D true;` shortly after.=0A=
Therefore, using mbwu_state->enabled and mbwu_state->cfg keeps =0A=
the whole block consistent and avoids repeating ris->mbwu_state[i] multiple=
 times. =0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
>>                         mwbu_arg.ris =3D ris;=0A=
>> -                       mwbu_arg.ctx =3D &ris->mbwu_state[i].cfg;=0A=
>> +                       mwbu_arg.ctx =3D &mbwu_state->cfg;  //and this l=
ine=0A=
>>                         mwbu_arg.type =3D mpam_msmon_choose_counter(clas=
s);=0A=
>>                         mwbu_arg.val =3D &val;=0A=
>> =0A=
>> +                       mbwu_state->reset_on_next_read =3D true;=0A=
>> +=0A=
>>                         mpam_mon_sel_unlock(msc);=0A=
>>=0A=
>>=0A=
>> Best regards,=0A=
>> Shaopeng TAN=0A=
>>=0A=
>>>                          __ris_msmon_read(&mwbu_arg);=0A=
>>> @@ -1696,15 +1701,11 @@ static int mpam_save_mbwu_state(void *arg)=0A=
>>>  =0A=
>>>                  cur_flt =3D mpam_read_monsel_reg(msc, CFG_MBWU_FLT);=
=0A=
>>>                  cur_ctl =3D mpam_read_monsel_reg(msc, CFG_MBWU_CTL);=
=0A=
>>> -               mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);=0A=
>>>  =0A=
>>> -               if (mpam_ris_has_mbwu_long_counter(ris)) {=0A=
>>> +               if (mpam_ris_has_mbwu_long_counter(ris))=0A=
>>>                          val =3D mpam_msc_read_mbwu_l(msc);=0A=
>>> -                       mpam_msc_zero_mbwu_l(msc);=0A=
>>> -               } else {=0A=
>>> +               else=0A=
>>>                          val =3D mpam_read_monsel_reg(msc, MBWU);=0A=
>>> -                       mpam_write_monsel_reg(msc, MBWU, 0);=0A=
>>> -               }=0A=
>>>  =0A=
>>>                  cfg->mon =3D i;=0A=
>>>                  cfg->pmg =3D FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);=
=0A=
>>> --=0A=
>>> 2.43.0=0A=
>=0A=
>=0A=


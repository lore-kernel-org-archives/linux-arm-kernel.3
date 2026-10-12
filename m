Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71673CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gifo5itGt3Raib+G+abPHyx6Zh2g3XusGtP55GBU8h4=; b=GEuYUfyhAAqJUjler9n+FCs8zn
	NXtgmw4i80lMMPVix7wKvx9DW3JqHCNjaT52hyvm7NIt8oU/SCuMLdGQPToQwOVVpB1SpROP9gYQt
	ry2/r/4xuA1yEmdYMEuSzwQwZIpXVSSzZiwrWeEg5D5VIc8hpS6OayULtCCbokNdCZfZoWDpzGY3o
	hq17qkgB9F+V2ooOjSpPpBEqx4FiTgNRGdnVGUOT6fgBiO4+VWGoUmiJJt4vK4pGnFMKf2VY7ydE9
	6lUURarm00ZYQusqHdbCBdiySsmhuZMonHHbnbThkDquJHjRExLsuPBi5jcu2zz6efOkzbML1VNjR
	q72mf4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEyY-0000000AQY4-2J7V;
	Mon, 12 Oct 2026 12:17:54 +0000
Received: from mail-japaneastazon11023078.outbound.protection.outlook.com ([52.101.127.78] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEyP-0000000AQLA-1Qtt;
	Mon, 12 Oct 2026 12:17:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hw88/Qs0mK5XyEnbyXMtcjTbdeJKc1gEvs/y8C2wuw61Zj6q91qrdsoKiHEDrPeBU/Z8I7NPuq0HCzQz4t2PgUJD392SHpCocNNsrNTBGle13MIpGFx5I7sfdOGP/1XkO5L7Zoy1WWUcMh7jET47zkU/vUyxiOaHtdlG+u6p732hME+aCg2Z3NeibvMFEfqbBZUhbXSEpTZO+nW+0zEjU8L/B5Qx6czn4eO3zZFSJhaC0ACMREbuk6gtTurm/QvQOOFKnRR+f/7y2hWBWiq6hN9zYjHUYujgj/DEFxX+k7awncjyNuSNkE+l3wj/e4hL+62sQWLXllkapM/wqf9I8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gifo5itGt3Raib+G+abPHyx6Zh2g3XusGtP55GBU8h4=;
 b=i6Z7QT0jnkqZoBqdMO79j76CND7tZVOE6jl+aXz8ie6jtzrX/2VANBQt394lbDKFH/8xfDvGvWQPEEvZzHBH7F9cQEHDEFQM3cfvq4K1bHQOvpgNm6L19apfglaio2wdK6ItddgrGGNqzwuhf1pm7kCTzhdjfBCsZeeTfAKaCXRZ2OVvwRW8ouGsOEEHVwGIWyRpHlRg5rf94kmLql/nvb6d4wVA/bUhTtbbEXwUPBmQb2yzDaWEOd7vGDqcKOh24xNuOP2T1+MG3X1+obfwEvb716SKplhm2SW7MmBC5DH0JmTCkG/wsFfbGGkWgcNbIjIREW+cHiHOrXAQXobfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gifo5itGt3Raib+G+abPHyx6Zh2g3XusGtP55GBU8h4=;
 b=cj8Ymfbr1cC7gmJLrhj0BmDG+tZrnb0ds0NjFVAhcyTf3sSwjVtGvWbeFxU0g8YXHJsjUUd/y9fXpsXfr08HLKDgEUkZgGA20NfARxvJkMJ0BxRS55kJ4wakxwnp6A5s69Mj7Vk6iNgdgfF7kUSavqA3IMgZTZRFBuwK3Xv4c5Kbud133qmVTI6W749nHulsLWc811hwlU85Z8mcJQee5BT4R20+aW8M5e7GHasnEERIVwhvYNWMeUOhGPThhld+Fpx0OXomX8V+DRZsdODG3bzOOmmdfRiF5xxjeTzwP6eD/CNpFtx6DDZ8ims39JawB74vo4u7x5qeOshA1LPTNA==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by SEZPR01MB5629.apcprd01.prod.exchangelabs.com
 (2603:1096:101:136::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:24 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:24 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 0/1] Enable touchscreen on UNIHIKER M10 V1.2
Thread-Topic: [PATCH v2 0/1] Enable touchscreen on UNIHIKER M10 V1.2
Thread-Index: AQHdWkOjTHXEX6bkiUSlzxUIK0olfQ==
Date: Mon, 12 Oct 2026 12:17:24 +0000
Message-ID: <20261012121723.53521-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|SEZPR01MB5629:EE_
x-ms-office365-filtering-correlation-id: eade289d-a98c-40f7-5699-08df285ac626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|5023799004|56012099006|261009223027099003|10067099003|18002099003;
x-microsoft-antispam-message-info: KaZMDsTlOCmtqqcke30QSPrJLXsPJXXc1n2h3wr+c9FUieHENKXyLu0SZcamt8Eq21LuxqNPc5Ah8c9DU4cH5H/0GuWEKP+HuYyEDmORW3tGg4MZMVM9nqc0VO1lf84Q3leD+dKQYlEOohPlWFAU0Her+wEAS0ExMH6v0u11Dbod0N+yZc3nOe6SXgoqOEIiB02W7M1prAc3bHI2da1RZQxSexmIJcYRnuIhFdOP1YcuGVEEuG0cRBGB1uU4+eUZP05+8QwzSYHellEEOQQkZjbalwEWFTtFuYbWaQbhUZxkOhnGDpx/Ldiz3ikjOtmhAW/uI2CNRyC1RXL96ryJwuWlxIJrSV+ZhJFy4N9MszYnGXOAxA7MeYde+4Bc8L0mFGNRj47W56/GLy24jLOPO3KbP6v6daazyXvvbOk909kDU2DIMDLUcn5tz4l38EiGd2Rmt9N2f9FbPznigDJEF0BFEnSgapxzn/TEwKmAc1xjjTaUYQevdqdpjgPGOtvOmdpyQBdbwPXT53GbzqlftPb4Iyi4UrrXiWUX8EjBFgs0WyEzO+3JkctE4zFU1ni7Nqu1nHfgj4i8Vt+i/zsWs7KNIejIEh3Agf2wmivOaf7otwDnw9d74Hirw0zOmS4Vh29+0mqxxN7MpdN5Hfzv64bvixnEg/i0b4NhiSkIJrs69wr3P+i9sq+PAN84rz3lny8PTDMdRrsDEycvyuXl1CWG4TQf/Ey+9xZGQFh/Xn8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(5023799004)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?d/Kbg1z0AFujsn8HYIeSRWIFwtkAhBf1ZUJbtrP2Ue7UhQ6SQ7Vv3Gh7B1?=
 =?iso-8859-1?Q?MnObUX/FKyFEuhSv3YU1IHhhJp7fA9RCZImTIDyjD9XGJKJHgbf/ln8Aky?=
 =?iso-8859-1?Q?VcxaUM5L+Zsh0p/pB0PZjKbwkmpjRZgbFG3Mt7AqsJKbitQbh3nrf7SzpQ?=
 =?iso-8859-1?Q?djerajByKZPn8QU4zKj6kwnHGtZ+KTKVOanVYFJimqZy4d1NzAmDBnzxcO?=
 =?iso-8859-1?Q?sPXP15n6atHZpDCA+uIY9gaTwCGD72ULoI5ImZQ6hOXYNH3iDvxNij6QhC?=
 =?iso-8859-1?Q?F4icytDOYJwIVuil3PEUQ0oXZOvZh9TEOy8MOT29imL6K5B8kotu0ITsn+?=
 =?iso-8859-1?Q?KCrDrobPLPtqMpVlOujLYUjM6YkozmQoPrLlr96jssOTuxwj+kAAc90ZB9?=
 =?iso-8859-1?Q?fLX5gUr1zasow7uaQOCmuQ00XdesFUq8PpMnREkNBJb6cDZbe0+ZxRbtyY?=
 =?iso-8859-1?Q?eXsrTdmN1dcs98XpliaV7GPXL165Yp7Sy4SeHVVn8Pcc7IMVvZ/iMszaB8?=
 =?iso-8859-1?Q?K6m+p+JzXQJvB9icoxP8LoAW3qHZm3zL3sGdKhzl7Wkxk5hCfIWU/bivCK?=
 =?iso-8859-1?Q?iZfxt0wUFOPYecEyUwiApzQX/bcAv8crepfAQ5IhzX8uGFxm24Q71880KK?=
 =?iso-8859-1?Q?oyonAYDA6rG4E9lpqlflGLzwHAP38ICWYyhDtjVW/JUcdFhD2RZvtceo7g?=
 =?iso-8859-1?Q?hURfzEPXuCu2n0B/mjBUlOo7masVpA/VnhX/P6zkQKPMziB6B5gIGc/rcH?=
 =?iso-8859-1?Q?DwTnTzZoqzaCmfXI/T0OzH/5xAeAzScnKNogsOAFfNsmv6sFhRCCXgYZyN?=
 =?iso-8859-1?Q?zxarRR3iy+3lrIpJgFX7gWTxnfC7Dp1CjV5Otnm041EHhGV/qr9VzNqQzZ?=
 =?iso-8859-1?Q?XWm3pn4gGFpGWb+VU+ROKnhbP2XhqdphZVK0+38lTO1kVejcKycQSHIaRz?=
 =?iso-8859-1?Q?80VhBL79Ua8cSVwHLDt4lLQgeAoA/l5b9TOI7GU39iR2/XF5rX6To2VTEz?=
 =?iso-8859-1?Q?6+QuB7lm/yKudaHUgiADoavrnWAtRQBOSH8ypcZQJJNfceU35yV09VkS8J?=
 =?iso-8859-1?Q?ZFN1drDPdj37NvtzXI/YNC60e4lXd66ybbh1AhBI++n2Gus0mLPzb7a9Wy?=
 =?iso-8859-1?Q?AeykZIchKsGCPEJAkYKX2IKQ55YBA7xJAWlIrWFtkJkIii1MLI/wUcVnm6?=
 =?iso-8859-1?Q?pvj3dLQ+ejcRN4UwcCrcO52hgfiFd5u/HmLmCnUzLqBYisKbySfoSwIOZQ?=
 =?iso-8859-1?Q?TeT1E6waucMmMcxgaM3UHYkdVpQNtWdG9B1uvvjgf2JhEY8iRLA6pjVxrB?=
 =?iso-8859-1?Q?cXyfd/4oaSnYoUKieGw7rz4GAeh4i1etiWcGA82Oto+sxRfA7/pWj7cKK9?=
 =?iso-8859-1?Q?K9qoP0Sa1PNDePk0xlp5IA1O66WiEsDBx5BxpnZEG1H8WYGIyF3hZKg4+r?=
 =?iso-8859-1?Q?U8ZgLjo9PLyZktncHoXjqJ7Al3xrxIaBJm+DrDiquHYh4EAUWKOkStcWoT?=
 =?iso-8859-1?Q?zJtDZ/DeRoj3urGQEUvZ33vLzgKgQoFBRazVv5Qew+3zg+XFu/fAbW7dBQ?=
 =?iso-8859-1?Q?kgbFJEsxJGtvVlpt2fYV1tghLcSr/UoFXXaYYzXiHYvCr5CjYgPfLXALpS?=
 =?iso-8859-1?Q?VrtXs5+edspD6hGol0Pz79xB83wR01MIujaLWOhPunuGg0JblVkw5AuZ6s?=
 =?iso-8859-1?Q?dlTytS/N+uEjmului/ar5v7YpKRoB0uAVadbxqoMyb9SOZiaVCgvsONf1G?=
 =?iso-8859-1?Q?yr9yE6dOYeL+2fSRNERejbuz/BjYzFXcOSN0o+TpU0Pfb1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eade289d-a98c-40f7-5699-08df285ac626
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:24.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtZFsjSw8iEYJagZLkF9CE1dmi1LjF6lkFdgKjGxVUpKOb9z7OCCxbO7HKyMluB4wNmDB704XF1knao2RQwHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_051745_383793_48FD0D98 
X-CRM114-Status: UNSURE (   6.83  )
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

Describe the onboard NS2009 at I2C2 address 0x48, with inverted Y and=0A=
the tested raw Z1 contact threshold of 150.=0A=
=0A=
This patch depends on the separate common I2C2 board patch and the=0A=
still-unmerged NS2009 vendor-prefix/binding series (now prepared as v3).=0A=
The driver is a runtime dependency. It does not depend on display support.=
=0A=
=0A=
Changes since v1:=0A=
- Normalize author/sender identity and preserve it in the patch body.=0A=
- Recheck against the expanded, closed NS2009 binding in an independent=0A=
  dependency validation tree.=0A=
=0A=
The DTS diff is unchanged. Prior physical operation was confirmed and=0A=
one capture recorded nine press/release pairs, 208 frames and no dropped=0A=
events. One invalid sample was recorded and is not hidden.=0A=
=0A=
Mizuno Miotsuki (1):=0A=
  arm64: dts: rockchip: Enable touchscreen on UNIHIKER M10 V1.2=0A=
=0A=
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 7 +++++++=0A=
 1 file changed, 7 insertions(+)=0A=
=0A=
=0A=
base-commit: d6c0b613da7796745d9ae71d0d0b87cb48ca25c6=0A=
-- =0A=
2.56.0=0A=
=0A=


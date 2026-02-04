Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D9E83045
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP6Hvx8RmNsEYPGB5iGvYVddlmMQl2l7YXBFvETGRiU=; b=chFgdwuQmxruySmdKQei/nYV5S
	JsicUeQO/THT/qLBdADVoRuIqamLOOAwYM8JIpS30xPVHzKb8LxeimSeSVyZoW6dWc1tVZyICYN21
	NxZeBIGAn/2b63f636V1vrY0i5FvjjrY4xFM+i0ZKpbqMx+BZoOZZDWNQyO21AHmuVEbVJ5qaCBck
	T9OTRI7w6cL6OMMGCh24kMLYYRoeu3KfUvAbeybXlGB4tEKNqubM835Rl5pXCH0TiidAvWdkZxWrR
	U+6XJsdQYdFpsrddp63Ro/XvGeC8d6svy+00qR9Lmv2T1Knl1mS9MkqvJdRn0W7Vxd1WGvftLTe3q
	x6RhRfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWmR-000000081dP-0OMr;
	Wed, 04 Feb 2026 06:54:27 +0000
Received: from mail-japaneastazon11022132.outbound.protection.outlook.com ([52.101.126.132] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWmN-000000081d2-3UVG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 06:54:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuZ2rBl/Ekctw4MLsFv5ttG3sBiS+V7yTjaEvnTdS1dlx7qrO1hmvKKdkE8/xxkV9Uz3K/aC52sSZJLvD67TGf6dh1r0yxOpntrVMTw6/KJ2OyMmYgDifoJUrav+oy2Khglt68UqzshKmxSx5F3A8BkUJu6AQVlLde4hq9Gb0CCBSOu2K4huKBPGID+XJm52WR7DnRPO7+7T/9KW24whZMfZ/GNk8wZ3vnqaE9kuO1KyFAWHivAseuCnmZJ4R9nwlX46aHGrQMWgd2TFoIAV6Qzo0WTkrQGixl5kQpViJ5kAxDWYsBdMBMSu/hm4vxaU/Nb5ml+l/T8ZStZMF+Us9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP6Hvx8RmNsEYPGB5iGvYVddlmMQl2l7YXBFvETGRiU=;
 b=IV+KE788hf4mirhI38mR830/AQ9HC7XBbRV/5GppP8V9zWIgED9C9eXNKVuTDRgrneZ3Jk7iJhRJIZlYEUERkLHuVir840ifqkegLc6juDB4cm0t1EigpkhGxPoTUiiW7C0Pfa6KZzn/g5mApc4eu5dpOoez8nIqwS6Zcf2dCs8tbyBM7nAIAqW5tpXfHkzZoIcgjPcs/1Ly66F2/8VypsJN51jSbNFBXOO1XNINbjRamcQ8GrHN31KVCBYbPZO7RkVsjjtid01Zom5Q6P7qceAVIePqugbXm26nTvtvQ8tfC5uYmc8QH44mhSWjqaLuu30s44J9IDyXtV/rEfSKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP6Hvx8RmNsEYPGB5iGvYVddlmMQl2l7YXBFvETGRiU=;
 b=BQ4Ynw6VsCM0fRyc5BQns603LaAZOJAHE4yzNhlP9NRHp+/BYR7bAir0Ya5RyglCcziegmepUZ918wW8yiBPmX4Lb/gt6v0mXnz5y0rR3X6Mus0o3mlrikz2VBUZw8dSa415KWlwPEkiXHWY+Oz40MZrQ5rOjRwxOgucne06T4ZELy0g3p+fNrrcNAqwKA7vpXHkfHGH7OuoT2CTUIHhs09ynWMrlTVVw6FwhUpDwnNRNQRjhnqKYcmgegrEh2efC8ununhOJ49QInvOjqF+t/xxO4LtUdhUdxo5B6sNYDo33eM8RmpbP+n1OLh0/IM9F4n/OnZhC0ypRFUvJl5xrw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB6507.apcprd06.prod.outlook.com (2603:1096:101:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 06:54:13 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:54:13 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>
CC: Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Linus Walleij <linusw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Thread-Topic: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Thread-Index: AQHcjBon++X4WP13bEy2OWyHfoxUrrVwK6aAgAH+4O8=
Date: Wed, 4 Feb 2026 06:54:13 +0000
Message-ID: <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
In-Reply-To: <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB6507:EE_
x-ms-office365-filtering-correlation-id: 2c84ad02-6e49-4d21-559d-08de63ba34e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vA1B7Zkf+n1EDNar3LoXej/E603Gaw/wMyoyY5h9R1TJMM8kBoh8pPCSLy?=
 =?iso-8859-1?Q?pq1GqJ1AlpJTdh1Whb/ps17BBSI22zY7e5RcQu/ovKEBL4Ajdd+fMRsRit?=
 =?iso-8859-1?Q?E1liJs7MC7jlXVIs19LEY7MpAQP5MMQRd4lW3mOJeCJ9+r4+EGWhLFDAck?=
 =?iso-8859-1?Q?IEWdI5tUqOH/Rmyz9xNuzTZBOPFVGWEm5umXMYumnXQTJbP48tninvFiNV?=
 =?iso-8859-1?Q?Baw0Q7TMf4ksaCq09pw0z3ozReAtDn2eQQ8Ph5bYLRz8Sw9ikPrdSkNNb4?=
 =?iso-8859-1?Q?Ujl1dltqCP880AiaL0pyswRDRl3emPwreW1k/EjARSBDyIJt1q+PsiEeFV?=
 =?iso-8859-1?Q?kh9161DfF2pkZkTCyr1L5NdwvCXnhBXAEhnZjgJsUAW57topndDdl4odKI?=
 =?iso-8859-1?Q?zBDCBEoImyJIcmv9MlkLKAVkOSBaH6WZ4zZJHFDC/GvxpCDQWDkn6PEUXJ?=
 =?iso-8859-1?Q?e1pee8QnRkr8BaUaH57NjurmGssLjBFo69HzDXvpyOoOBKiAaF2uv2cfIk?=
 =?iso-8859-1?Q?2mpBiNBeGql3Fi9aKJtVW5r3B0of4wsrMAx03YFo4UuHpc/XmU2rRnYD7p?=
 =?iso-8859-1?Q?hk3hdo9MJFe86DLK0sDvtaM8j1D9AwbdnClRO9c7ymqwpeJR5rjjkQ7Zip?=
 =?iso-8859-1?Q?YHrg9yfqpgVhsjRih7nKiFtWURXrC4sgAXSqY8pHHytkRbxEMFFAn1aKjD?=
 =?iso-8859-1?Q?Oty3x+4uWnhhV8D+Y+iSo/DEPZP36carirqMqSo8M4Tj6CYPq9xGUzOskB?=
 =?iso-8859-1?Q?Aj21FqJ9JNnPpPsd9zVi6CRNfwOo5vtXb0PrBXL/aucz6UJtCCrtBJ8Vpn?=
 =?iso-8859-1?Q?eFZ6hr6+Idps+rmFmzi7Zgm9TyQRgR+SNZzUbOd31vByWn5OmkDjjelmnK?=
 =?iso-8859-1?Q?YyxhoJs/kD3AMFreVRW9NiDplTOl0Y/fRFnaVuDKQ5K+HuGo4qLLcVJYYH?=
 =?iso-8859-1?Q?D45enVh6LX6Lvnw48fWYDe2yHRJGaDot19RMD7WLmLqglu09HNuf6Okm6A?=
 =?iso-8859-1?Q?IAXNz/4cQMwXBWcuXN/hwdnzwWI/eilvr5FXr2W/4TlUOQNEKQnly6KYwq?=
 =?iso-8859-1?Q?YVat8dLuKkEx8glq0d91CvjrG6d0jCCpA1+wEkLyHNqwpUI6m8ly6KMa1z?=
 =?iso-8859-1?Q?DmgT6cQXcMTxwu5IaaB4NQ22fB0NdDtTSvRUqTEWcOhMA6qvsparjjMwIX?=
 =?iso-8859-1?Q?gDXxX/bUdAmRRnyDsepSiDiahd/aZIdZGx0F1QQcg5dtv5QlJjFxGiGXzZ?=
 =?iso-8859-1?Q?NgdJAgU1ezDsZJDG0fCHlmsmP5gMVtRID18if6TMLo+UkRtMmQFC/WceDF?=
 =?iso-8859-1?Q?pUxS/GCPXwBbchPlbY/5NJwCD9Ym1XK5cqRKwbqMKQXF91TlzaCQS6tWxa?=
 =?iso-8859-1?Q?cPt2JG1Fsj7/t63vev/dvWwGr9jbL6Pzn50XV1tBwSTq2TqyM6t5wChb6v?=
 =?iso-8859-1?Q?33Lm3g9hShH/0FZ53+pgMzMc/+IjANmtUM/OOyTwhvbO/yz+vT3WbUPvWI?=
 =?iso-8859-1?Q?rNl/uC/qU8Zl58F53nxS/I4FNrwqEH8ubNFWG0aDlCzR6Fykzj6vwEAkIj?=
 =?iso-8859-1?Q?B1b/k3VWsM/V96aU5mQAbfzcQ8fwLgy3WbtT9GD9uH62DAOXEpAkCuWhz3?=
 =?iso-8859-1?Q?jkuULFtIqmXPSu7URGpPKceAI29YBjlJJZEXmg5/ETyd2RZsGdMQVb9Jqk?=
 =?iso-8859-1?Q?Znlk68OEveNn/dIoD1E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?e6A7H1NaVBM1BZ8monFe5HIPegwbsAQ+A5wR2jQSgTRleF20Hp4B/y9j15?=
 =?iso-8859-1?Q?Ht4jfS4W6FoKxjlJocKnoRlJbctY7vRPlVyRC6JaV3sYLzqJwLNrczcXFb?=
 =?iso-8859-1?Q?d69SkZvY3Z+UNqVUGWxxmeehUt8nVAyXPNKvlJ0PjQryuLQUOHco20ctA3?=
 =?iso-8859-1?Q?eW9JV9EEEG6QAHdQQS6R/LKfd4rxBNJQUgPaYnXmhC/Ckd3HX9FD+StThI?=
 =?iso-8859-1?Q?PSyQzG2XDDEJY+ryiWRrrcnY1MsN8icOyNCEA3jt5CPZKETe3VvAAFGBpw?=
 =?iso-8859-1?Q?cqboUAzXnD1GwDJ0Xt84Hs83mhrrlLqJgUgmvg62o73If5mtkMBrwQsCTK?=
 =?iso-8859-1?Q?oFv9Oyvqs5JNq8CAKAmOGYqr0ep6vKDBChrkx+sBdON5GmZ8TKfX5pKzkQ?=
 =?iso-8859-1?Q?B2DCYypakFTx1XmiQole4FtViq3apaJGQG40tO/uTSFCOGkL44ilM0mYZJ?=
 =?iso-8859-1?Q?+ykO9vE+XP7np5OZX2qMJDKVJnWHqW6227lTZQk98sPHqiYgl9QNZswTDz?=
 =?iso-8859-1?Q?OIg4tOn1QYrSqWdsE2kAJFR/26e+Ddg+ydbWEYEfYjT/ZTWeMkg17jAT1b?=
 =?iso-8859-1?Q?hOSeTIdHQUNrI+gv76HuFza3EjhguOaMfqpJpz3v3fts5q2uMNECYkddl5?=
 =?iso-8859-1?Q?VORtzIxj+SvxSf07dCv79YK9gyXs8jAZgGS3EqWx/41wWzdIRuw8pL9b74?=
 =?iso-8859-1?Q?7xdotzCSd8WXZ163DqQafBNjsW6MkwGSPjbdZh7JHsAqCEhxFvoRqE4jbf?=
 =?iso-8859-1?Q?VvMi1zr0x9mmEnNRSclk1Tm5oEn9rCRNzf/s2/lG5uglhPQzi/ywIiY1sJ?=
 =?iso-8859-1?Q?k9IB8+ci9kFQmKacQ+QGI9oqqOQY3WQ5vXMihJkKfW+I+icXbbYv5Xs2Ns?=
 =?iso-8859-1?Q?ztk4TCKny1IWpcRo3No6oG1pxjtxSd4VfADioOO/0vfKooH8mRvw7H55O8?=
 =?iso-8859-1?Q?Fexl+qMZ+4cEVm9hvzLsqRAPd/ZuignrjnsLXFCx2nfy1m9sfCWCfgEcT5?=
 =?iso-8859-1?Q?YNznXmUNkOiyFpKjcZkE3mD+PBqAqQBQorB1TDBkWS6KaCnHBONoXvANKQ?=
 =?iso-8859-1?Q?pVOyL18oLrWHxZ28YLAViekrVFjjFcDFzZZa4HzwqFwV6esOFW3q/g5WIU?=
 =?iso-8859-1?Q?OxjLNbt7ye02Ng973vqgM/PenjZ0qOcnxhIxvUm0V6VEUN7x2sOtYLJX1C?=
 =?iso-8859-1?Q?kUcEXGGDdRC97W0szkY4jMhpSzI2D5R0rhkbxj5waAt2wQScAGGktevE6e?=
 =?iso-8859-1?Q?DjNZpp9wfy5fo6OfC12SObm7UBS9h81FjfcxZTBf+8W9JzYCFsQ0rLdBEm?=
 =?iso-8859-1?Q?JjFEaApMxQn1IP/kW+sqWM0IhxAkt07o+P64JM0CZ3XaYLmNQ3hr+xFz4Y?=
 =?iso-8859-1?Q?RoywvrMR/PdKAJr+SJ4gS0E/J3b6VLKdUjIZqj7nTYN/sJRkeeSJZEXWJY?=
 =?iso-8859-1?Q?k+hOSnPDjLH/PrftcW8Yag8UPx8a1gsrFqzCFnsvZ6zOsWs3tCyQE7Qcnc?=
 =?iso-8859-1?Q?6FdHWRPl2SCkzmPUT+a01HgsCeN1P1bZewA7actFxChoeU4mrmYKSjQI3W?=
 =?iso-8859-1?Q?AxsbdglNTRtrp3y8rijdIVYvdSv/SyCPyZGtIsCCqhEjwre7WVvpfMk1DH?=
 =?iso-8859-1?Q?zXGXCDB0Mx+TM8hHSJG2LfeLORUutooqkap7m4hN7t3+IwCBCEl1dmmkwy?=
 =?iso-8859-1?Q?ntKZg9+F15031Ew/5UfpV902A3qVbCBuwvu94ugDXdXZpXD4KmI0sLhiQY?=
 =?iso-8859-1?Q?KH+FU5vsCv/z9TadAvCQ3NfF8n7w6uTxYOL7BChhzqYxxan+AVbDLVAJmI?=
 =?iso-8859-1?Q?yWgKAAfwsw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c84ad02-6e49-4d21-559d-08de63ba34e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 06:54:13.5264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmEF3gzchDRrHfe6UI+Tg7QFS8uMuAo/QZ0V60lRBYtDrNZhsTbj0xqAnSQ+hI0lVEI9qC5+1EsY5EB4Hnjt+2TIpqK9oHuebK4GuoiVD8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_225424_167487_7D39C09F 
X-CRM114-Status: UNSURE (   8.59  )
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

Hi Tony,=0A=
=0A=
This series proposes a set of changes to pinctrl-single motivated by=0A=
bit-per-mux SoC designs such as ASPEED AST2700 (per-pin DT encoding,=0A=
aligned pinconf offsets, and allowing probe to continue when the MMIO=0A=
region is already reserved).=0A=
=0A=
Linus reviewed the series and noted that he would prefer a custom=0A=
pinctrl driver using existing helpers and the pinmux =3D <...> DT=0A=
property, rather than extending pinctrl-single, and suggested that the=0A=
pinctrl-single maintainers review the approach before any merge=0A=
decision.=0A=
=0A=
I would appreciate your guidance on whether extending=0A=
pinctrl-single in this direction is acceptable, or if the preference is=0A=
to pursue a dedicated driver instead.=0A=
=0A=
Thanks for your time and review.=0A=
=0A=
Best regards,=0A=
Billy=0A=


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10B6C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5nt5+dz3fYgxJrQN1V9PPkioyCB5RsKUPc/mDhCeQw=; b=JjMq0EiBCxS70McqidP5lRFV8s
	5ANHRLDAhSg6B9e6ahntebL9PBMz2Z4giVlV9P+vJXtnpTPQ9IxY6bO9WqMB8AcM08jGOmdNbqoNw
	2oQJghYxdVHUS7XA95bTNqZ0rxMuCGsCZ/iTlx2bATO2H1HBXY9o/Qo5yDJdeRrKP1gXMRAGP1lCD
	ROu8ZIBN9BnfJYb9J5FHE7M+sLYjDfru7IRc1cPA1I4ky4DlKbgMVHtfcwFpwFlbA+qzImEkVeQ9P
	aB+aSTviZyAXXCekjCq0etSFrqtixTeeGgyIr9jyGvWhzSV3MCqxev3mI6yWZqPxVbKhVJ6PL+ZwS
	SZZRQQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyIg-00000006IPj-44vy;
	Mon, 17 Aug 2026 14:26:55 +0000
Received: from mail-northeuropeazon11020141.outbound.protection.outlook.com ([52.101.84.141] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyId-00000006IOh-3Tca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 14:26:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOAiuzxwa1cIuvANgRiHhHKWyNY48PR2MrReYAKNbMGdd+Qkhqhv8w9J4Xd4oUp7pVGad86sP3R3SbvERhb4Nvz74qFgMNOM+8Fq5OFOxAamGMe+Df9XdKA2TrfyLNK662fbMtMvmruO/ANsOq0SbmpZCD0yJ/PA0+ZC4/OgnlSVnCZATc8mxQoCpaJ4hceedyA/nb0VTchhxc72SIMXkzS50OwjbxrN048zzQGplRuY0Tz+rk5rmt7qKDc9YYXYyf6RweeqFW5Dv3a2F23AiMOJ+T8zdnyEnPNhltuU72zma9PbvbMEK7q9pcfKLWSw5h9kpRl+VE1cxMn+m9QT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5nt5+dz3fYgxJrQN1V9PPkioyCB5RsKUPc/mDhCeQw=;
 b=kI5l/yA61SwOO107OKDUac5SGHkbPkeQy7NtdO15TvQ7itFhWfwzOJB9z/5586cmHqv9o5yxB0UQKN3X0ZU/BPptoQdmjgYWRDdMG1zRNOHs92q8rrBza9Kfr/Z1Zko2v+YkcawPcXuLwaIsEdJyXALstBDgZG8QQwCf1bwBsbhjtq4dt17s1oo5ANtgRk/wAoTVtR1AYfgL3HSqXPupA8gt3Xb8HIP0hSEVbwB4mIDEo453ZP+6O91R1Jvpx7vlKDklT2Z0bgai8LNas5FUBe4ZuUNxdG2xkkB/RXgupKbnGwIv6FgocR53LBNAoC94XLrF9GUDExlKWDLIeTMLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nebius.com; dmarc=pass action=none header.from=nebius.com;
 dkim=pass header.d=nebius.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nebius.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5nt5+dz3fYgxJrQN1V9PPkioyCB5RsKUPc/mDhCeQw=;
 b=gr6iNne0po1Tnqfoa082aKo4ObWDPghymd2b/pr68SPWQKhNc+PMSj2u7I8TcozahK32NOxV/219+SE34QK53jyrJJPIKDoauGiemzyS9PATqoYUrGrpRFnkiQuxvjlY/f92m4R6MrjONvtu8jJSlXpr6ijF8Ko23SZMdcrKnj9/k70xcZm3lJkMb27L8QPOkSlokED5GQQBB10G6gxLRTu868hY3peveCTpNGI0semPTie+tC1MQVJmASvJ2rPxi6JZgk1RVgBpfSDNRCqC6GLUteRJ3CPBpIm9Pr69sI8mDieNjo00s2+yakXJAdDINnyrBky7B23U6HXvfmRISQ==
Received: from PA1P190MB2557.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:4fb::18)
 by AM4P190MB2580.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:6d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:26:46 +0000
Received: from PA1P190MB2557.EURP190.PROD.OUTLOOK.COM
 ([fe80::d0eb:eb62:7779:c6f0]) by PA1P190MB2557.EURP190.PROD.OUTLOOK.COM
 ([fe80::d0eb:eb62:7779:c6f0%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:26:46 +0000
From: Dmitry Malkin <dma@nebius.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg
 Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, NB-Core Team <NB-CoreTeam@nebius.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Thread-Topic: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Thread-Index: AQHdK9Pu+fg3Gt/XVU6V74nnaDIiLLad0o6AgAARZHGAADf9gIAD4JGAgAAmqgCAAC0lAQ==
Date: Mon, 17 Aug 2026 14:26:46 +0000
Message-ID: <PA1P190MB255719949EC777E6D2DB2606DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814174825.GC510472@nvidia.com>
 <PA1P190MB25573D7CFE42EF7DD2A8CDE8DBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814221103.GE510472@nvidia.com>
 <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260817114158.GA1175472@nvidia.com>
In-Reply-To: <20260817114158.GA1175472@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nebius.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA1P190MB2557:EE_|AM4P190MB2580:EE_
x-ms-office365-filtering-correlation-id: 659e357e-5497-4275-6bf2-08defc6b919b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10070799003|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: FJFcgp+1vY9ZC1L3loikKs6UBp8heVHqKcM4jl1hcULtxyM6Pusqu+WQfD9VpBdhnEdLJEVfGnJlNbjAwNO8reYnJpC7OtWI3EV5CE1ngSxEjYhctAWwCA5YgGwl/4PzjZGowuIUI+GXmgpJGDVR6vglfZnx3SrbPfxCQI2lxbXFrCsKO/goYAaSWeB2+KYwC47KILwbEC5ZRztYAMR9ASXEBGLZ2ZAfnIzwRBBYqX/0WeHKWWWNHBm+uhhV+byxBKLE4X2WWQ+u3Vmn2GMjon2/NaFfdp/JLYYCdudA/UE8kHr0yGRIrKBQsYp1Vu0GRWSO9mSBxraCKJKna6DrepJCIAL9mrhx+2LBY0w7XNEf6TErSgmCgq0Njv4JGImFnfuXgRQb7J7uKHzEbo6awah32KEwpmKPqNHDhxlo8zZ1ZX+XuQWmL0iKRXo7UdqRzCO7TWRHp6n9W1JsFo2vlyBmMWAf4FfY0JYns/QVWUbk+/edMSpryfjuHDy9sPraL/Mv4o7xYeAYvqtWFUmKZvgjxA5hxRY4anzMpZ49NU+vc9/sL5qmrU1ITgpUL5JzPDd3rQ3RpHbqsFOYodSXeuebns5rib3Ob6As+MwrHrVg4A3GikGDZZyFLZiSJxxo+OW7bQbwA0TofrxZDYiiJs+dttyw7bruu3xCM/6zIjO+JKJom6Pjgi4N0Ht5sCIIQYHTDt44XlYmkp3BngU0p6jMxVKltfFVt4/vbz9Xpn0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA1P190MB2557.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1F/MVdAQEzhOClPBmdM7QwHIlnaWUMGJlsMJJJJewKhISftzW/h/6RdAze?=
 =?iso-8859-1?Q?bvyyreI37Qdj9y0Fdz2xB9R0TQ8Xhkkm80fx/CBpbjC2MJMLYCk9E+/rKy?=
 =?iso-8859-1?Q?13CZkDoymQDItxJhmLUsbZ6QGUGdR/6Izy07n+bs+FJ6tLonbmNI+GGfM7?=
 =?iso-8859-1?Q?uq6QgMhIVlDSpYzIsW0CHzxkI2OuXT5vwymaIEeUZaAwUDJ0TtjZq/OASS?=
 =?iso-8859-1?Q?bqxi3DJrisjyxVnmEGhd+O6gtwbpe8fHnA4lGUIdTSeNM31X5Dd01KscE0?=
 =?iso-8859-1?Q?8zipAtYgUBOCvrRljH6Kr//0g5co52mU2c3B/UK2fi2zeoelozdhdrd2Ox?=
 =?iso-8859-1?Q?/RY6rKO/ApBKNGYg1VQI83Osi60YMyzqO+vcVaW3CBifRzppKQxPeNps1h?=
 =?iso-8859-1?Q?XVCch2G78PbsEWR0p+5II3zAt8yX8DBbMFgjYJH3Ixsrpwc2fGe1ubeNqY?=
 =?iso-8859-1?Q?Y+1SneokSqS/kGic/Sca+GUQlZcUiaEBr5UAmeB76PNvCkm+9HVbK9c8Vq?=
 =?iso-8859-1?Q?onfhch/xPD41aMP+8gKjvngwq01SICUI/3G53un9PxOmqpg3VtGdx5rDx0?=
 =?iso-8859-1?Q?UcOAvwOlQNqi+ofDt/72OGItM8+SbjynwI0hzotqn7jNiTv1o6XCo3+U26?=
 =?iso-8859-1?Q?vtKtjUpi/mdxYS5n7PhfWl8vKZVVTvg3zLDJLO27ycDvVEZSXolOoXy7nE?=
 =?iso-8859-1?Q?wGjd4/i8WW1/QJX0ikj/ncSU3eHYPjB6Qtjt2nN0BPQG5Ikj/xZCglRwlO?=
 =?iso-8859-1?Q?zdVaLljsP5SIw1VtXhvL1HGmkBiC30zsBGWrlrefOpVUfBXGBq/NhYOu9/?=
 =?iso-8859-1?Q?OctHNJtU/DLQCS0PbXTlPNOVUOH/OdD3ZBh+AFBFZK6hYxN0ri5amVEADs?=
 =?iso-8859-1?Q?ssrA0bAzI/LDOXfdrWfD1jMcQLILtZEniJ/Gl4EZ7s1F3y+eqiS4UhcuMl?=
 =?iso-8859-1?Q?rnLD+oPCBX8K41PV/Q6W+aZBBhbo5X1dSEpIJ5dIo9a1XrU8H/2+XlnvRr?=
 =?iso-8859-1?Q?u7KdJegxMd9/DZz4emAWRGXxbW0QuP1V7Z1PEh+CsRddW4Wmqkiiy1k9Ti?=
 =?iso-8859-1?Q?wERphO7TJjMHmJORAvRRMAOUD1H0+UVDeipk9Dmzlmiw1F8NqIWyRDHzDV?=
 =?iso-8859-1?Q?LahxuoVYrn+TJGoHJ17XfCIDma0A/u3JKnEO9DyiRJevGziAHijOW2yCUy?=
 =?iso-8859-1?Q?C19l6YWtT52ulsr1v7oAUbcdlUuN308q6pRJeJyoreK62OPh+RDMDH4xdO?=
 =?iso-8859-1?Q?MMuC0nkglv78et6paQTG+2Ypcj3Tp07pgG2e6re9Bm+Koa7QiczIJaxFTA?=
 =?iso-8859-1?Q?sF/yCsHE1AnADf4hjZ9GekwnOUlCOXwOhio7BTquZeGQnmFOsIRFeMKxnp?=
 =?iso-8859-1?Q?xGQeAo5NHPbGJDNHE3nhy+rX2+29eZZDHBe9onbgdeleMGVl0OELhexNAJ?=
 =?iso-8859-1?Q?2N6d25Ubp5rWqQnT+4q2xtXApNRT5ddA5QPOTFGVlEJp81jLCuAt/eE0Ah?=
 =?iso-8859-1?Q?YQ1GjXYMN4WSrYukCUkBD5C4hYyMoS8oYvA1y6RqrrYowL5fLaAT/vDWlr?=
 =?iso-8859-1?Q?Ks888sZfcmN1F649QGfJefQq36R2hhIK9Bv/yEac15ejATOvtnOkH6w14z?=
 =?iso-8859-1?Q?nHp+kRFn9HEu4SBYcRaROsbO1Og7I9DlC83mDs8L2iLdmUUFW6NInVc7Ng?=
 =?iso-8859-1?Q?Mpui3jZLEDwu+vZaRUkvzluGyuMR31n8+OGRwYPD9mGREPa2ecdXlCsfCv?=
 =?iso-8859-1?Q?G4dS5GV63p9WNg8JMg9Qb+lOyW4xVtGXtr13yPij1Co/s61BECWxDEjnnB?=
 =?iso-8859-1?Q?JGRwTxmiYyvW5pPpg9b0q2v+BoUjT3KMWig+JhHdX3a738lrQDo5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nebius.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA1P190MB2557.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 659e357e-5497-4275-6bf2-08defc6b919b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 14:26:46.7211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4eb23c52-f3a5-49bc-b555-0b061267a984
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTjhtX9PJS98Kvm0w7uHsqKrDbTPxM79EgvzezZ07B/Lb/7LDQ/mZ1XBhq8RmIee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P190MB2580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_072652_044263_C8029CE8 
X-CRM114-Status: UNSURE (   6.63  )
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

=0A=
> This kind of situation is very challenging to setup in the VM, and at=0A=
> this point you may as well include the switch to the VM too.=0A=
=0A=
Passing through the PCI switch would not help because the device without=0A=
a vDEVICE is the host Root Port. Neither the Root Port nor the switch=0A=
should be exposed to the VM.=0A=
=0A=
A multi-device IOMMU group is an intentional effect of using=0A=
'pci=3Dconfig_acs', and I would prefer to restore support for this=0A=
configuration upstream.=0A=
=0A=
Dmitry=


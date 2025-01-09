Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26D8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vVehu8Ue0xislto+ynCKBlrD1bzaYh0jTM2ZSUpHH4=; b=cW230lyvhJ8dFgBqNNzq/uT3hh
	Tnzn7N7Yaz+DkwqUF8WarLGYEAHIX2Y2cr9vfwKA2SUL8gY0Eo7HwuR3nxxf6Pd8Oz736qj6qlxdM
	VWYpvrSb5KgetmcI7ca3/E8MBKbGtm0F4pm6SpaAAyMCDlgQejaUgwxq0/39a8/TfjVLgEaAPVe02
	yKS1vvjDNJ7VTypg1c5ire5b8LNC3718rwkcuxo3QrBNVoyWuFOy0n4p6SSXbdNtOmwp23mahE6v9
	8qkErdrrlwZwM+qLPKpqe+IGEW/sJ9M8rpCegJNmYL5hPPN/7906skhuv6Y6TVzEl3yrceQjfWOGk
	tAgTnPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwf3-0000000Ctva-3sLh;
	Thu, 09 Jan 2025 17:49:37 +0000
Received: from mail-vi1eur02on20605.outbound.protection.outlook.com ([2a01:111:f403:2607::605] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwdq-0000000Cte9-1DHN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBeDDc20Du7b+yazVKvLzmaAVR9hHuUF1P8rM60MqntNYkW3n5tuzl+RF85JAUV90D9YI3KhtK27SPXvkR9poDZSPB5S7WOeH3AEGBOocSgE/ma173LENZ1ZhsLy3rjrDbG3buTR4ppTa/HwJ3Skil2naoCPEk/xhIrLGX5tWCvO1OnDRia5IRWX3p4Y1zgUVmhh0ajDtbDdSsnUYauJ37CJdH3fDMC6XFUcprBJf7mB0JZAj2sx2VMeL87NcgFB3GYYSisaqtGgO/x/HX6WoAr01bL9mXF5uqri24duE4crU6/AXjhTgH7dLw8EX6FC1WhzhML9ZKt7YCZQ437Rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vVehu8Ue0xislto+ynCKBlrD1bzaYh0jTM2ZSUpHH4=;
 b=bYL7tjrlqAnx6OY90xNDltIx/IAvgEzOoD84koxc3bRYOoWR1y72DGnG5HcbiSprTdHFUz3JirDfpGfLn4zsO7x7zNmZrEWidtEAIjm7ZoJLnHCwFwd51fk60LR0oz9wxbLakfw7P48+By6/QgSfC1T56+5XCbojfo/wJJBbSduOSm7IpFqn36MD5Sw0kTODuofcDVhuBWjG58SeywlzEoDCmY7WAtOt4BEqx2r8lK8/YlIlLd8XXfIlPEikd8MnvhBg6mUDOqM4VaEUMe20BWFCUZz37ORBTm66WOWMpsDf/dlPJblLzSaxDRugxwt9xcwia86x4mAHf9mmlYxfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vVehu8Ue0xislto+ynCKBlrD1bzaYh0jTM2ZSUpHH4=;
 b=QVhipLWCMBrqvJqBR8yU+WAyIM/in/v0rfjwiEqFfzS/bjV5M0OJG8m8S5U0HkNin6FrKAvKLcrB+5r81LVaDoH5nzstBztnTNhOEFIL4WtK7ZZ42UU/46OsCOwlmpWcLFeRxeJNKF22VERF7WLDR4W5tuoLsnRHub6Hy/UA8CM=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8948.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 17:48:17 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 17:48:17 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>
CC: "mike.leach@linaro.org" <mike.leach@linaro.org>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Thread-Topic: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Thread-Index: AQHbU8m8TEnYl8CikUKII/YDjzuo1bMOcL2AgAAEFQCAAAWKgIAAWPOAgAABdI0=
Date: Thu, 9 Jan 2025 17:48:17 +0000
Message-ID: <GV1PR08MB105212E5552EB50968383C6D6FB132@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
 <Z3+6kL7OGDX/pNul@e129823.arm.com>
 <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
 <Z4AJ0kc0DxVwhLlu@e129823.arm.com>
In-Reply-To: <Z4AJ0kc0DxVwhLlu@e129823.arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AS8PR08MB8948:EE_
x-ms-office365-filtering-correlation-id: e050679c-16f9-4180-ea38-08dd30d5cc61
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?5PqMr8rxSiNpY6SiyuETSG2blXP7i77oyKUxckXOC4Tr2PtwuzANzx4k6x?=
 =?iso-8859-1?Q?QV7NcFQ4UkHWwJDBhOkcYbkZ4i3OnLUfcqSguYuhvBWH4m/689AugRJXpD?=
 =?iso-8859-1?Q?xkcERuTjJL9fr3boMbw7BuZbsbU6HoJtf9oHGlBcwmRAyTTi9TH3vPms7U?=
 =?iso-8859-1?Q?E0vTuP16PRJ2/efs3Py9lxETeUf0oUY+Y3HM245y2IBe4ZEijLE8PXhf77?=
 =?iso-8859-1?Q?gQe5thnC7idHsfFAA9Dk2qmk0kVxGoFxtYEBN07GGVktGcNb+8w2MiZmeZ?=
 =?iso-8859-1?Q?zT3YupdERNeNHMfeDzU4AAa0soh1mfIV55qCKcwnDgjfyFQQgSByr/GPdS?=
 =?iso-8859-1?Q?EDZ5jeIJhrNNwp3y8meAGtQpzjjEwwAzaT++aDEcvLbqtWynlqnOz+r0su?=
 =?iso-8859-1?Q?YMJHrCGuhvr9cAss+9L8GX5KRNHiNN4kDAujRirL6Re+oLq3ccC5kCRM35?=
 =?iso-8859-1?Q?BwVwkt+YP3hmjAqeVDFScjbmGv/1eNaabF1g2qq18j6xRNqty6PXDTxAUs?=
 =?iso-8859-1?Q?ClFKXcEnANgbfuhRWxI+AJHCYJqwqgywIsc6P6NMd3n5KlVQ0BMMrkNCSP?=
 =?iso-8859-1?Q?2Yp4XwJta8w526ayC3Rd71cDkEb1Y4cvrtvUED0J+34pSSA7awUKm4NKJz?=
 =?iso-8859-1?Q?GIGdoTd2+ttZmQwnuGHE7sgXRc1sW0cscj4lsYLs/TB+8kRdph5hFUX/sJ?=
 =?iso-8859-1?Q?f07ghW6KZcHOHTFRhfPYv2Bffa8z2HQG/klhlFLbovzd4xyCYl0WLeK+fH?=
 =?iso-8859-1?Q?gARYzRivZJkJV1bXakG/vxAeQY3SDwcxfUQntEezziCyLOMDB8uqQlCt0W?=
 =?iso-8859-1?Q?d4rgIM+XQNcKprrPOz+evix82dIN7zq6ESeI8IIhqr0hu0Jzta8xYNrDs/?=
 =?iso-8859-1?Q?xrbqrKeBchxxR3zfQruTSofAcpj2JGmW368adR42nO9bQXYQ9ifQ7f2Qrr?=
 =?iso-8859-1?Q?+MadBJtNMmXFGEHGHgjV1LG6STK5xJogRqMmOukwlCPf049ahMzlFpE/bD?=
 =?iso-8859-1?Q?BQt6WkJCW4mXWHoWMyhoviegogkFeNLaw4b57icYFHt93G5MZ95hRys0c/?=
 =?iso-8859-1?Q?3lXjkH1rYI0zXXnDGk7WKVnX2m7opY055UOgpq9xJ32Rh0efHRT7qrXU3E?=
 =?iso-8859-1?Q?Fm2yuYZDMF1EKs69+r9EFmOBZzOMj+xyRpYc6+XfsTVzG60vSqmJtFtdb6?=
 =?iso-8859-1?Q?Sxa58cWuXudvqCi0JwI0dr0W1L7Uxp71OFUV4R5RSy6ZJS81JkHNFZ63nT?=
 =?iso-8859-1?Q?BxFUGH7p8N1f7yA1Okbx113k09PYWcecl5JRy4f2aJ9VeN0EH0v4728qTP?=
 =?iso-8859-1?Q?IbhzT1llntOxHI455X7iqsLg1bKPzkTdxjUKxezLDN2bc61LS+8vw9d0M0?=
 =?iso-8859-1?Q?at3wpNQYgX3oR3Znhc/JwXRVOWb2zDEcSVfMiP2kj1rL0Ut8eQXCjMsciT?=
 =?iso-8859-1?Q?cxT0CEwxkl10T1FEHy17fHP7/3oYZEFFuQkuIeA1WHmYXyxyvaE71z+6Hr?=
 =?iso-8859-1?Q?DHLOPbHOdrQB3DnRLIWjDN?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7LiDwVZXJ2QKJ7+1yhRB+86oc9Nw7MUIc2gJswkK9Aqxg6e4KeiYjs6CjT?=
 =?iso-8859-1?Q?0JAaLzSL6i6y4yl2naR1Ic7oehfeiuNm3y24uZM2YEbMD81KqHswagwN6y?=
 =?iso-8859-1?Q?GuSmyo/vrZN++q0ghXYcmS/fpJ2cRFlqcwagzsaja+sg5hYEnXlDhx1HXj?=
 =?iso-8859-1?Q?wF9VAxzx2z6yEAAU2KoGWesdIBR5X/3W2wQjvmCtbvOTvMozj+0ZsZId0F?=
 =?iso-8859-1?Q?MhJaDt0aPlDTi7+FZREx4v208I2XTed+0qfqGQn90WMKNNff8ZrPHkft3H?=
 =?iso-8859-1?Q?N7ucbOLv1LlIUGhu79cOYBOdk7zcwQzCYfpHZzgEMqHFJ4KxB7ZWti+s1c?=
 =?iso-8859-1?Q?KCOthQ/AqdrmSDrjqmx+NnSro2OifFeOG6UtR3ctsbJCIcrUuXxlWV45/X?=
 =?iso-8859-1?Q?C9c38szAPcs0o6dDJPvKSnWCniILYPFPubldSUOR1uLqd9ElafBBfnJfz2?=
 =?iso-8859-1?Q?eTTpsfWShPykBUN+JZ5zMHS3UGYg0zldUgouWyDRTrdLDSva9Mud1agSPA?=
 =?iso-8859-1?Q?3smakonb9qrKiIn6Xqn1CTpzUmcv54l3IfctdClztZTujN32QoMpef6HkU?=
 =?iso-8859-1?Q?2+4wUCobvij/iaTf6IT21mX+SqrkqkCJtjy9GPhCF+1DLYQ0E+VJdYZhNX?=
 =?iso-8859-1?Q?b2vOtn5NsqdV+B7KuePV86yClbz1v/KsEW5/z07VTmXCtDIjNaC0Czk+V1?=
 =?iso-8859-1?Q?tEbcDR5ylPnq1uB9iini4VbjOcp3XWOlQda/2nqK1v07cEha9fKS+v997K?=
 =?iso-8859-1?Q?45i3h4m1KB3Ik1+cE3D6cf6ADzpEHDJUsLmwUDsTkxcyAmVubIxn2R521g?=
 =?iso-8859-1?Q?brXGa53xuZ6wIcS1tmeBydmhbM0u7iz5ebpM8bbffpg9oX4vsOoDgzBFsv?=
 =?iso-8859-1?Q?1Fb8AUwWuDVcRI/gW3CO80XmZIb2w5ngG1KErKEGHOIl2rcH600rN5ZkQF?=
 =?iso-8859-1?Q?DS8QJNqLGYU00hbCsM1xs0eClJLh9Al2ccDJ3vXfJ2ueSRt1j403siUskJ?=
 =?iso-8859-1?Q?ZA/xMFb2HdfTRHut2S1Dc1HJUY653t/I+JVxLqGm+pHIczaifIA2WFLPCw?=
 =?iso-8859-1?Q?8jxgOeBOGoRrvHNkt3r5BtQwcTzf2nLdPY3qz6KecQ75I/4mYC6PClET/4?=
 =?iso-8859-1?Q?vARKvTkhISZebCid4ejrxZ3aJ4pMTtDqyRiTeaFWYDSlvvu5kO4r+dINIT?=
 =?iso-8859-1?Q?R6JRB7AYHHE6jop2dLz1qk8WnxLIC+jHXiI4yxpk6VCAGegDqV5wpTBpAp?=
 =?iso-8859-1?Q?TNJ+mmEntvE9WwmdbjkwMji6eMLcmxJew2zty+S9hVGhb0aNJVlFxxGUN9?=
 =?iso-8859-1?Q?ErzjM/4NeEOIHifh2JppOnDxkWXhaVbOCaehDogV8LEaxPBClZtjeojnOY?=
 =?iso-8859-1?Q?PPXJKo8Eh9+1DdS1GblCwAU73KSG7/4fZypOpnrIfvD1dN3Lb2W0W+arW0?=
 =?iso-8859-1?Q?LmPvCXDl6c35MC/TBzxKP5bGioLU3qRQ1t0QkP2iMtQsUG6IHL1+06Jk0y?=
 =?iso-8859-1?Q?MZaA1UUa/xbpHt2x3r/Muv8gGvJ7LBRJrVsfSgK7QtSUtx/mr2apj1puPc?=
 =?iso-8859-1?Q?HV9HaC6KzjrVFsZB3NnTDE2dLy6JrLkBDYaJ3fGzHlAvKQRI7LDI+8c8Ee?=
 =?iso-8859-1?Q?NWjG9wEUMd/XR+U1mE4f5AGaSY2jGc3bC9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e050679c-16f9-4180-ea38-08dd30d5cc61
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 17:48:17.1185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fma7tLnjSQDPPJs2uPsOHiameyC3QsJCFx6U0E+A5ZDul8j+ukiuIQepBw6TlLrnazl3LVBWUw6T2/FnymNa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8948
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_094822_326727_5C21DAB8 
X-CRM114-Status: GOOD (  25.29  )
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

> > On 09/01/2025 12:01, Yeoreum Yun wrote:=0A=
> > > Hi Suzuki,=0A=
> > >=0A=
> > > > Is it not better to have separate "configs" for perf and sysfs ?=0A=
> > > > And etmX driver can populate the "running" config, based on the=0A=
> > > > mode specific config. That way, the configs can be updated=0A=
> > > > independently without affecting the running config or the perf one.=
=0A=
> > > >=0A=
> > >=0A=
> > > That was i've tried but I've accepted Mike's opinion that=0A=
> > > it's enough to check whether CS_MODE_DISABLED via coresight_get_mode(=
)=0A=
> > > in *_store().=0A=
> > >=0A=
> > > "the .._store functions in sysfs should use coresight_get_mode() to e=
nsure=0A=
> > > this is set to CS_MODE_DISABLED before altering the config,=0A=
> > > which ensures that the trace system is inactive.=0A=
> > > We don't' really care about reading the config if trace is running."=
=0A=
> >=0A=
> > There are two issues with that :=0A=
> >=0A=
> > 1. Sprinkling the get_mode call in each sysfs stor function doesn't loo=
k=0A=
> > good to me.=0A=
> >=0A=
> > 2. Someone preparing for a sysfs session must not be prevented from doi=
ng so=0A=
> > just because there is a perf session running.=0A=
> >=0A=
> >=0A=
> > Suzuki=0A=
> >=0A=
>=0A=
> But, when separate the config, it doesn't show anymore the current=0A=
> configuration set by perf.=0A=
> I'm not sure this is okay.=0A=
> IMHO, If perf is enabled, since the configuration show the "perf",=0A=
> I think prohabit to modify config via sysfs while PERF_ENABLE seems valid=
.=0A=
> =0A=
> and about lossing session, I think this is up to user.=0A=
> That means to use sysfs, user shouldn't use perf to prevent loss=0A=
> its configuration.=0A=
>=0A=
> Am I missing something?=0A=
>=0A=
> Thanks=0A=
=0A=
And one more question.=0A=
When CS_SYSFS_ENABLE,  Is it valid to allow modification of "config"?=0A=
I think It seems valid to show the "current working configration".=0A=
If It allows to modificaiton the config value showed via sysfs and current =
applied be different.=0A=
=0A=
So, IMHO, It seems to valid to modify "config" only in CS_DISABLED.=0A=
=0A=
Am I missing something?=0A=
=0A=
Thanks.=0A=
=0A=
=0A=
=0A=


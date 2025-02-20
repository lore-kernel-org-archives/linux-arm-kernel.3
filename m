Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3429C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yYzKX0PK11JIQ3QKXpDA99bqvI4rHaDuEEuo6vH2Uo=; b=OPk7lW+pEhswR+Dag/iRBuhO2Y
	QMbetKo7xZV1//UAG3jiFYeRlfvafdppyivi9zx/e0gzHILe4pfqauUjlis0+btpi3FrvoYsgLF0l
	u5DIyJsniUHA7PTObQO0ycDJquLFjHFj5IVtRwG12nhHCHIny+lfMj8mZyJv5cIfShSIMiMHjnSOH
	gTtLqb8XwOcjk4JffPvcnRuzzbQVMpUQe5dmg96cr1OvVSJ14+1oZ7XdNgiiSoOrfYeFDI2VnkJlc
	HKxJL3JeV386Ez5cuefg/l2CXhcwSYZykoLVsow6APACe6x86Ney0Npdd/NlBPw+VGgGgWR8iHrNf
	JeOR+ShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBw0-00000002Xub-3IcW;
	Thu, 20 Feb 2025 19:10:08 +0000
Received: from mail-eastusazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d003::] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBuV-00000002Xd2-1JEb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 19:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNXhoAMYUOfdZv4m01Jhfx5Hatx0gIEJ39DMlMHAOXQUpJoXUXKTkLBTDyyVKUBFKmHy70aGxAfyQWx8UAYprRu99tuimr2Mi/JwxRe4LskIOhHKhoS9//8MmMKvQiTKkXRGWeN7wBIaylVtBxT+AZwlnI9oMW3sXYERUG8/T4oDcXldTVs9XOaljVVUGzW+FK08apSQPChWOGI7NoWLM0nHQdatrYH+FM/OGyYF4O4VRxcu++kQcgDglXasx0dM3roNSYLm4mPBOz9fSsdCiylcaiUiUBPj8Uvy5Knd5TdmBlu2tSkz5olqCjyqF3RAElp3jDb8/3jMgL6v/8J0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yYzKX0PK11JIQ3QKXpDA99bqvI4rHaDuEEuo6vH2Uo=;
 b=RFOhc0kxAVNUs86IJ2SAfdXdKwlF5kUvS0QB/ECuJr7C0BmuEklDgguqWgGVX5SMepeVyyutTmZwXvHLZeOzwnMfkHgVzyjLvGmgRBOd5LfyEUohTddjt7l7rIRCKAAD0wKbrILH19pFfJ6lqBEFGHQVnndACUyzMiSywz9nr8B1j+5FYj1HigVqCWJ3WSv3IOvTufnuHY+imep8nBf7T3JS+a7yOZMSrnb/9CIZ7aMkdzui0gmgFDSMPDF+Nt30QlkmIJJR2ASGdIFXalIWdeddAYLooHeVyroniixP6DcCATA61b3sjgnvP6SVbMBFNU9woOJdvd81MPOvKWKS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yYzKX0PK11JIQ3QKXpDA99bqvI4rHaDuEEuo6vH2Uo=;
 b=DwlxwCHk1dQupNXU7JzTWs5LoT06549Op61UeFgxy0Nh7z+o9YftH6/MzXmMcZZeQFaaMUf26U8LCuPsUnLEfD2BdwLv9jNxPcFcwBJfwgWMuMVN/Hi+pM66Kk8YUq1WYcyZ6xhQUHs1CwGjKWKy+jMCbIXOqmUkZypAK5hMvywxAxlfF+0W27fALBzFTazxfBG4J8awvMbuEeqga7fnEJcmRIUQTZyYHYd6exZ4D6rd28QUF3uqZ/6UizsOU/858l2RKKXVTPaB2+2XFDNqTJ5QXNlew6aNTaIr6Tyad1+04qQ9sgYWQFoStDiXAAYFOpj5vFlQZxL0b9RIPMFlxQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA1PR02MB8898.namprd02.prod.outlook.com (2603:10b6:208:38a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 19:08:29 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 19:08:29 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "eahariha@linux.microsoft.com"
	<eahariha@linux.microsoft.com>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "joro@8bytes.org"
	<joro@8bytes.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "jinankjain@linux.microsoft.com"
	<jinankjain@linux.microsoft.com>, "muminulrussell@gmail.com"
	<muminulrussell@gmail.com>, "skinsburskii@linux.microsoft.com"
	<skinsburskii@linux.microsoft.com>, "mukeshrathor@microsoft.com"
	<mukeshrathor@microsoft.com>
Subject: RE: [PATCH v2 2/3] hyperv: Change hv_root_partition into a function
Thread-Topic: [PATCH v2 2/3] hyperv: Change hv_root_partition into a function
Thread-Index: AQHbg8X2g5fV4Yu1ukCIC60YHbLA6bNQjcMA
Date: Thu, 20 Feb 2025 19:08:29 +0000
Message-ID: <SN6PR02MB4157059BFCFFDF16834E0167D4C42@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA1PR02MB8898:EE_
x-ms-office365-filtering-correlation-id: 5fef4950-50d3-4455-82ea-08dd51e1f643
x-ms-exchange-slblob-mailprops: CLk2x5OX5VZwo4mpOER2r1tzY7KfIDgGOMsrm4nDw7MC/LdPh8NHWEfkgnY+q1d7H00A3vTVMqL09fLsPd0wTQLcUgiy2vjV0jb0RShcve8O7M98kckeuVSsc/UTXhYthZvgmzPiNin5tIG4ybXkHiSlzhq3hOAAZJlhoE+11IaJ0pAbecyj213A6Fwe6E0/Tnd4DhrEsFIvXlGKpG/vatVbjCoGfrFHEjRp9sbgmM2WSQOM/tI0sJmUETEcDkq9TmvgRK4cDDgVhKecZRdJmUro6sxO0BwKwt5kuQoMTwJC9JVKba7NW8GACvBBro+H0q+dy567TgQknzrECL59wK8F1NwejiI6cQ/45NTlV48xbpg/oUb3u79myqHKVKRe6YmyrMdk0CvA7JEaVkaYYtmFuZlKzHO9F5EeyQk2ZxC0CngNUYDog3HRgA0PXoLIrfG+nXApm7uAGAud21fpGc3eCqge+/T6egU3Vw4mqzkZ+IllPJjvTK+3zMFh2omcDx+9B/DVaofUgu1Flo5Lykd9lOPaFvbE77Y4Ii7WEPdtM/F350mPbYvaJqX5bOAHCXQ3SbiEPSWHFsNIxIvYJ8BJIFWW4HhCLC0flccVA9mv58EQ6dtzl3hyntu+/RRpucYeGC+Wisyx9rn97hrn4xQP1lmJKhakuwiIfhPBEcQgrFmSlx0I7QzTYuBqYHi1KfnhvCz42cy9cEhQ+fGLFw==
x-microsoft-antispam: BCL:0;ARA:14566002|15080799006|461199028|8062599003|8060799006|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?hHkUUH9pxm7JvcU2DAO+/o0FaaulypR6ndzFJUSZlmKiN2AIZPJNPw9WZJWI?=
 =?us-ascii?Q?JF6QVjUegkfxTvh8buOq62KQmRvjP3SURJaCavJYMcR2MedYfnhxmE/1IN42?=
 =?us-ascii?Q?TVqXIFxcpndF0XzPLyrdd7bMHxhJyNU1tKLow3K/cilOkMdMough3D86GFL9?=
 =?us-ascii?Q?/vidKcx1tIlwTEw8xJxXlj16hzcCfUQYBvD7EUHlm/lsZ+E+SjholcVE+lXs?=
 =?us-ascii?Q?qLIIQOZLd1vuFAxdCxU1CebKM5/nX0nI5Af19Smez6MNYdODMcOLznOI0EoF?=
 =?us-ascii?Q?SM/YWB2ZrGuCD99exoL1ArEInDA/z2GM08/z2PvYr1cothKNZ8nZUCmB2Bt6?=
 =?us-ascii?Q?hxlo5TaR8Y+MrUgAg/8GlMwH9PyLH3EBS4O34xUk/WUo/kjIWd29IIJ2ejQx?=
 =?us-ascii?Q?ljoXnp18/Y23cHY0G+KTn7e8RqSsHVqw3IOa2dn9tOeC3ZRJFhqBioXVYDb+?=
 =?us-ascii?Q?xy/7HWWOVbwx6pyARYXI4bM65OFOnnJqRA593olRtluJ0IqSJFzSRXAjgmO7?=
 =?us-ascii?Q?7wMXZ3VorMJEDj8emsBGy+VeVKEvaVzYjcy6r2sEF0yYlGLNgmmangnJZVZF?=
 =?us-ascii?Q?aEeR+pMGoBes4lZB2rNqFJsNgfTXzFTIUDnQeraVAAPPqVajrYM9SRi+Oc9Y?=
 =?us-ascii?Q?CoFwwCeL2zAlntMRbKC5L0+WU3mYo0OqQrX3bS3IqmLZ7nJOEJEX3SJqYTX0?=
 =?us-ascii?Q?Et+Vofw29AByGwzwywDFDls1fQNSARE9iWFoEuu8VobhM4SjRf3xQFPJTMZH?=
 =?us-ascii?Q?KMeUO2Am3xCJp1w2ki6Fd6cWC4okEqRCPIhupnl+uVWGf25d0Yo5/sAd2Py5?=
 =?us-ascii?Q?jUGkpdHZjHiSjKjRAX2rG34kanqNN8DPXPePuxZ3JGcZz1xlFVgRuG0apZRS?=
 =?us-ascii?Q?abIKFtds7g4wSgepdYFPKplOFJF3S8GVUwnqagKPMOM+t6eK3Oav3P7cgzOB?=
 =?us-ascii?Q?eBFShBBtqtdGldZJ05LnqJlO4lCjPuy/U/unOw69176g6srsgSJ8okXrJNfP?=
 =?us-ascii?Q?6QTU2LeDkwwNPdPsARLfMbiayyGynFVTFHZlD3P4SQHqk6w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F0ZW0IU0NNaDTmI38pd+VbVjXa6UNdjuwGnvCyeRWElfF0zW6BbWlGtmLks3?=
 =?us-ascii?Q?A+h1hMK/3JvwMTQ7JG6+Op6gJb82w5C04+5Ru6ioSX7c9BaBjDSFTgueeJzO?=
 =?us-ascii?Q?dvD/Hv9HeruEXyZuz5s9NLPTfwQB3vW4DtOhuAwMHfJQYELpDUVaOuueBTtx?=
 =?us-ascii?Q?nDPXBWfygAx9bYlDtbo/lNkp9dAwykJpOHybx42sYOlIVcmergS3VbuZzak/?=
 =?us-ascii?Q?BJUYl7TPSkfNdXaO5I0x97vCyOkgip7SiALwCnwq4NzuTL2a7nlmuc5PHQ4s?=
 =?us-ascii?Q?9qZMLacf/0qSkiz5hault6q+JpIzkbh+vy8GHwFsRuTySJ4SfKhkh6RcV7cS?=
 =?us-ascii?Q?Edda93xoM0+gpUvofLJzXYLPBVp3PIz49t1jdQYKF9xiFGvyqVyxEivUdCPW?=
 =?us-ascii?Q?34VkLlaE8lmF9c4F/LZ7XdLQmGS1QCnVOPECbt1pU4HLYPL3iw3pxVjdiY1t?=
 =?us-ascii?Q?1sVERb/8Y48FujOA8cc/W0pt/XAgMl0xAZqD2dMA1iVagSrk5kGZhPa9cmpw?=
 =?us-ascii?Q?lVeTaMrwdsmjyBCJ1pkb4n6RjodqXiNrx4xBEZXm5SVleg4JcQgycxtdN5KJ?=
 =?us-ascii?Q?Yf/8AAQRCiuuIBUy/xQCKFT0dW+lYTCoEkzIA8FyiNkZXYaMeXrSzttvBpv4?=
 =?us-ascii?Q?9nPspykeHPj5a3y5taxKvNJrimCpCweQLpNHdAyTXz8hAye17hme4jkHIB+G?=
 =?us-ascii?Q?qMw7h1uDZDEDyEBhdiT5bj/GwJT9PHdndJB7rCMo/q0Lr2Nyw8DMwCi+Bavl?=
 =?us-ascii?Q?s+Eh+l797QTMhSxoO/cSRL9bFrmXEwwPL6DrIdaoMtbsLUf7Fc6IbrjLlZy/?=
 =?us-ascii?Q?oIf6WNtmEE+gaTpV6R+Mbjivr61O1vjRIn8OEqYEPYjaazNzFjlYdaXFhNdN?=
 =?us-ascii?Q?A9RfDeBm/i+mDeCRgqpYeJGRuGXy8SLmx/JDao0PfpoyxqPPGw4sKIhzFqFG?=
 =?us-ascii?Q?j2yXBE+Ks7mY3qXEGA098271svCRPzYS5WbTMDt2wK+q8DVv5p63ZZVkmvGQ?=
 =?us-ascii?Q?t0dfegPaUtBpISCmEEzfXyOHVYNp43YpNLjlAAl+Ejxaj5gA5/mT4xWw7hOL?=
 =?us-ascii?Q?fUavtba61gecLveR6bYtutsZ4db5rIWYJzzvL3YXhwXSolYnjHEvsIrtRAy4?=
 =?us-ascii?Q?aiUhJkNmvtXBSPYLkTG60mHIEO+KYX7ohJD3cX5/8YNusoAl3jYYMExLfu3j?=
 =?us-ascii?Q?k4pyg8TKeEpkQgdndIZhnh6Afg2U4IUjPlBHhoSULVFHdlqDbO7XgVmv9Rg?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fef4950-50d3-4455-82ea-08dd51e1f643
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 19:08:29.7396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_110835_355161_EA91C4FE 
X-CRM114-Status: GOOD (  13.19  )
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

From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>=20
> Introduce hv_current_partition_type to store the partition type
> as an enum.
>=20
> Right now this is limited to guest or root partition, but there will
> be other kinds in future and the enum is easily extensible.
>=20
> Set up hv_current_partition_type early in Hyper-V initialization with
> hv_identify_partition_type(). hv_root_partition() just queries this
> value, and shouldn't be called before that.
>=20
> Making this check into a function sets the stage for adding a config
> option to gate the compilation of root partition code. In particular,
> hv_root_partition() can be stubbed out always be false if root
> partition support isn't desired.
>=20
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

> ---
>  arch/arm64/hyperv/mshyperv.c       |  2 ++
>  arch/x86/hyperv/hv_init.c          | 10 ++++-----
>  arch/x86/kernel/cpu/mshyperv.c     | 24 ++------------------
>  drivers/clocksource/hyperv_timer.c |  4 ++--
>  drivers/hv/hv.c                    | 10 ++++-----
>  drivers/hv/hv_common.c             | 35 +++++++++++++++++++++++++-----
>  drivers/hv/vmbus_drv.c             |  2 +-
>  drivers/iommu/hyperv-iommu.c       |  4 ++--
>  include/asm-generic/mshyperv.h     | 15 +++++++++++--
>  9 files changed, 61 insertions(+), 45 deletions(-)
>=20

[snip]


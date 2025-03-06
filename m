Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B26C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT25yCgOyMkXEFigAmVoCDlKaoYjtM5GchMERP6bPx4=; b=M2GUMNDjVQbGNpzDy+Fmu+z9RQ
	FdTs4qJ9zoRGyKMh2BvVw7BdxrnYdwid2kXvaXBxQoW1q7XRAZbuIXFAB/FiH5N9/jCoQ7jkZaHLU
	rZ05EecCn3cz9Qjg+wq264Cz8vBYVvlZEXVSKg3P6ys1j90/gjdky5koq7tiMtORRFSQUPUsczhBG
	s6OSMDkYkTB1isvXFmKJ7NEwb0VrweKKNqTqTeNwZKcR5i4/cVesa6p8s3/VdL4fTGm6SgP1jG7w9
	RWVt0hVdwjNAk07aP+r3Kgd50RfwPXjs7ZQ9V5hVY6kRdjx5V1o+skLWRib3PJ+Ww3S+o7csDfZ22
	yDCvSP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqG0t-0000000BsLb-3xPe;
	Thu, 06 Mar 2025 18:32:07 +0000
Received: from mail-southcentralusazolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d114::] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFzH-0000000BsBq-2x65
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne0c2W6axgwuEOFdOfGjAjlYuWstPcsPzWwHs/Magz+zrsmmzNoDPAvcKZzvqBj3rfVqsOSToAUAbj4ErlZl6mOFORYdumzLY5azA5pKkpzw+6JwcW4Yq2NNwDs3Yxzyleg0CS7i0vJY0+qEfVP8mDGkXENp4vIKZG61bUcbhpg4sX4Bes3nW6JxMdv9+nJX1Es9ugBU9fNCXJplaGvkuSznTjWQI9+TWxkU2jhLCdp+bkI5gAKeM3i6F2B4/PFXWEvlYn/ZHXVqGZCKZ/ONNvF6QrIo2q6Aq4/Xpp4dR1k8kOEg4Vd9RRt35NPIAX8i020YR2M7ZsTdB24GjRNEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT25yCgOyMkXEFigAmVoCDlKaoYjtM5GchMERP6bPx4=;
 b=Wrsc2bD4wqLEgb+fz3F8dcslbmsyPkBLQINF8oBi8zBBwqqbCVQykf+c7IeUs2TS8jCbCaaWaOOZ9NKM6Se1M4JrNtc1kRlbnJdl9Gfnh6MbK8Ah/DyuDM5Hxmkfa9josfGIo7xGf65OuPVbrAMIuDwRySQyywSrgl4e2NAaINhcJOGLl7F1FPQ1a2MBZE/MqY8+Pk6IovUOQ2EhlQlIXfKHH13xRuRbXMF4PiUcnN12d8vk3xZrG24RMWENyukK0cR3lWkRcx3xqrYp+33vFiDo+o0q1o3o5DmZ2JtZMBgANwxaF1LeX5OqDitwwoCa0NrZiqmYQ0eZg3UAg8ULxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT25yCgOyMkXEFigAmVoCDlKaoYjtM5GchMERP6bPx4=;
 b=uufxKclH8PzQ9HWZ0v+wADWqXntkbFbB+qPAugauDMcv9ik8Ty3IltUzlVFx4qZGhIEgehw1hU8wT3hfav4VLv87Zte9uRnnG/dS1vRyOJ9eEmzH3ZfZ7TdQrg47WSmsxJsf00V1Ig8k+FznLxLYpiWTvFvQohK1jK+tndnedolO1RApislk2iBPqIW2YH/XqsV0qPZ2b56O0wPe3IXOFs/XrWDUXnzoo11RX3ntSJpP9uevXjMLi3+5WIcm2WBofAewTXw0SJ+dphP+Ubtg8VUaRvGWozFp25yPEhtIf9xyxczvgJhBUiLoT1t0XmuOyOZ9pT0k2KrFW9fthAf4bQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV3PR02MB10332.namprd02.prod.outlook.com (2603:10b6:408:1ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 18:30:21 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:30:21 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"joro@8bytes.org" <joro@8bytes.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
	"muminulrussell@gmail.com" <muminulrussell@gmail.com>,
	"skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
	"mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"apais@linux.microsoft.com" <apais@linux.microsoft.com>,
	"Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
	"stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "prapal@linux.microsoft.com"
	<prapal@linux.microsoft.com>, "muislam@microsoft.com"
	<muislam@microsoft.com>, "anrayabh@linux.microsoft.com"
	<anrayabh@linux.microsoft.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
Thread-Topic: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
Thread-Index: AQHbiKNsELlhg/nkb06Cn8BpRqwg0bNmdgqQ
Date: Thu, 6 Mar 2025 18:30:21 +0000
Message-ID: <SN6PR02MB4157CBBC2D186E1944E6773AD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV3PR02MB10332:EE_
x-ms-office365-filtering-correlation-id: cf623953-caed-4f16-f8ca-08dd5cdcf3e7
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|8062599003|461199028|15080799006|8060799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?qeKOayBOAVN6qWUjDLWfh8zV5UDLuA3GPJTkwRKtllgWxIKXLKNFU3WJv3Ai?=
 =?us-ascii?Q?zxc7lfna09h4tAJwIMc5lH9Qe0aPcrvTpcmqSt2FLq22Ay6tNv0ZtAnLdy3G?=
 =?us-ascii?Q?L3s7wttMwWvPYjM8kiXNMLHtAxBvttnExn/evx/sfJv36eirHuOZKQOHq8Ii?=
 =?us-ascii?Q?eAhJi2TfiZHDjquaG6lcV5I+0jFc4vu+qWKHUQV6jpd8rI1rLd6yWqhGRmAs?=
 =?us-ascii?Q?svjmrb8OKMwnQYqas60WoW77Mma7is8Kc8dVYcNwYmZRiT4pwbRV5vXFTr1v?=
 =?us-ascii?Q?nB181/5MRCN14NUcA5UOLCfdW7hfkuGLIKa8mF4c/NbuYK+OE3TTl/FoEy0k?=
 =?us-ascii?Q?qUvfC++cROdov42zPoanOczwGpYAHcXRJ/TY2ADJzganWDg9lHYgxDvB3iFa?=
 =?us-ascii?Q?3zG/0fMdMkO9uSQKqX9KhJtBOtjYlWnN/aVB40iD1GHY9kdPYvEvwD6hR7rj?=
 =?us-ascii?Q?HWhGb1yJYuiYugOoDpe+YK/A83zMU4n9FcPTVjfsqorbdMfzTi3RBexc73sL?=
 =?us-ascii?Q?KsEz9dccwu7A1NfgNq0IGZyc5swMhfNnQVn+SGc8f+YB0bVrbNPHbtkC4vSn?=
 =?us-ascii?Q?PuJ+KQ4LvGKutdKXe8+tZyB2sDz6+zDFVcCnqEKrOGewjzD/oSlbrPIxIYhn?=
 =?us-ascii?Q?pE5EpCot8LKGdS1Dy6sxVPjALnBzCKH5+DFMs6phr9UMZuKYleY7yCW4FxvK?=
 =?us-ascii?Q?yTpBczXA4bjvPVWFJwwcS/rKV45WWNkIEaFy4jSFHNJuuxWJ3sOy1mmGbcfl?=
 =?us-ascii?Q?Fay61VgylfJNxt/LMdj5pu/BkONvyGaVQU0N/8a4oSWVg1arMcPDHTyOdeFD?=
 =?us-ascii?Q?X0cyCXAbCdkx+QCGxxQ73air5Ox31EP0EaxXIGBtSxDL3kAjh+UZWUGXPAAi?=
 =?us-ascii?Q?eXAnFQ3rp9L7wIkecXxpZrmh3b64DV9Y/pqOUgXCcaU+KKpqQ9RgYePgNpqx?=
 =?us-ascii?Q?vvw303q3ND+Pzxg4y9yqwlD+9g0wsR2Rq5rvyKBVR8HpIZuUGTHFv4g5Lf+Z?=
 =?us-ascii?Q?cn10gqtdPRkf6maPdeVaIE7ZZQsxtqv0VdggX3zCJibgUr0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oGAkwqQ5d/FsB30KVkcwf4ORTSQYU8/meFtXilj0MRbsHr7WWn6ZMwtE1cew?=
 =?us-ascii?Q?r+vqh/auuw2VmtLtQeX5iYAbmIOh+M+WcRz1em6oNkg/Y7TXztIfqiQbOKxp?=
 =?us-ascii?Q?BkgvnDsP1lmlx+VJtzVkYcVS0FW5RXwk7I0BDGTHzLKmybpEZk8LedXAY/GB?=
 =?us-ascii?Q?ATOiPRj/CiBsILR1cmLH9aO3FkRGVspJx2fP2uizzPFSgrJwDdOSUeCiWtn2?=
 =?us-ascii?Q?89vNBYv44b91XqOMkRz+xiI9BeWZB7wdda0MoTnmIpgVLGwb8ol4FlOOnXgh?=
 =?us-ascii?Q?t5k6gJMySTIwp0YyQg2r9Fzo8kShzSO82o11pZVjDj1svvGbc+jiZWKWL9Zd?=
 =?us-ascii?Q?/yDkvxCTNhtt9lZN7k9ZW1hyMezkBD48Jh2fHdo1oJHx/UWp3GlynangiCvp?=
 =?us-ascii?Q?PoAxdpsNCPuhDz3ZES34v6yv6hJeOOYHRLxlWZzQPgi9mlyR0+Ae++Z2qhrS?=
 =?us-ascii?Q?OJnNXb+5j6HHUfWw6DLSh7bYPBeqmr8nYWsZnbgVqWk/lxXch9sbh8VHgEQx?=
 =?us-ascii?Q?C/a7vfPcbma6jReVw/fHhA6xz3gHBmAhqhy3kGIAn+9mQh0uShzKPQdamnt0?=
 =?us-ascii?Q?IJaEKDR4l3Oit5Lg56RMqLhbY5u1qV10WUM/gqy8iK+s5Ruzl1y5L5qCBfpo?=
 =?us-ascii?Q?CpUQ7S/2rMrjMNA9Rq4j9zt0xO2Pd25WrB2Bjv4mpuY14reHIAvcseuEhX1w?=
 =?us-ascii?Q?V/Im0h0y4aayDsCCfGhXO/W2iDKJKGyQTTEqqw4X/2255H+Qqxs3raQQNZbL?=
 =?us-ascii?Q?rET5/S/JFW39DxDCluPOGZtfoYeolt+gO+z796MPQA52PT3gmrAG29NDDZ2q?=
 =?us-ascii?Q?/bODToLiFsQ8T8Y70B8klRn6vv5HU1BsYvuOAIRqiISKVyrNc2XHuC51Tm5/?=
 =?us-ascii?Q?W6z70JbUBfE2MT1jei7234T65OmnkUlIW8JXVGP5qRvuNaTNxnE8z4xtJxfH?=
 =?us-ascii?Q?HjBQRXFGfPWj9q9d+vDR7iWavPdHf4fHJubWpMbt5xz9HalJidUMvXifSGGy?=
 =?us-ascii?Q?gqkIKNlZMptipawRcxu+Cy46c3UN/DftR8I99PInP6I/bAT4jEW9eqc4YYZo?=
 =?us-ascii?Q?ae6vkrB2F2fod4LPpYwE209a1R7uhjRXhv2e1+jlcZcD4TLjfX3JhBWRuLEj?=
 =?us-ascii?Q?7hI8X2fruy4DYECv2QOtdI5KxLvMsnaBto83GnwKObMJJbjypzxE6/jJSxzh?=
 =?us-ascii?Q?o2fmkf5b6DD7aGw8Rh6NZKeQ8Gz4VaqiXGPDMdUvTXoFHW0BgrMRSXtskog?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf623953-caed-4f16-f8ca-08dd5cdcf3e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 18:30:21.0691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_103027_760136_1E7DA028 
X-CRM114-Status: GOOD (  18.58  )
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

From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, Fe=
bruary 26, 2025 3:08 PM
>=20
> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>=20
> Extend the "ms_hyperv_info" structure to include a new field,
> "ext_features", for capturing extended Hyper-V features.
> Update the "ms_hyperv_init_platform" function to retrieve these features
> using the cpuid instruction and include them in the informational output.
>=20
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/x86/kernel/cpu/mshyperv.c | 6 ++++--
>  include/asm-generic/mshyperv.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyper=
v.c
> index 4f01f424ea5b..2c29dfd6de19 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -434,13 +434,15 @@ static void __init ms_hyperv_init_platform(void)
>  	 */
>  	ms_hyperv.features =3D cpuid_eax(HYPERV_CPUID_FEATURES);
>  	ms_hyperv.priv_high =3D cpuid_ebx(HYPERV_CPUID_FEATURES);
> +	ms_hyperv.ext_features =3D cpuid_ecx(HYPERV_CPUID_FEATURES);
>  	ms_hyperv.misc_features =3D cpuid_edx(HYPERV_CPUID_FEATURES);
>  	ms_hyperv.hints    =3D cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
>=20
>  	hv_max_functions_eax =3D cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTION=
S);
>=20
> -	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc=
 0x%x\n",
> -		ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
> +	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, ext 0x%x, hints =
0x%x, misc 0x%x\n",
> +		ms_hyperv.features, ms_hyperv.priv_high,
> +		ms_hyperv.ext_features, ms_hyperv.hints,
>  		ms_hyperv.misc_features);
>=20
>  	ms_hyperv.max_vp_index =3D cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyper=
v.h
> index dc4729dba9ef..c020d5d0ec2a 100644
> --- a/include/asm-generic/mshyperv.h
> +++ b/include/asm-generic/mshyperv.h
> @@ -36,6 +36,7 @@ enum hv_partition_type {
>  struct ms_hyperv_info {
>  	u32 features;
>  	u32 priv_high;
> +	u32 ext_features;
>  	u32 misc_features;
>  	u32 hints;
>  	u32 nested_features;
> --
> 2.34.1

Are any of the extended features available on arm64? This code is obviously=
 x86 specific,
so ms_hyperv.ext_features will be zero on arm64. From what I can see, ext_f=
eatures is
referenced only in Patch 10 of this series, and in code that is under #ifde=
f CONFIG_X86_64,
so that should be OK.

The pr_info() line will now be slightly different on x86 and arm64 since ar=
m64 won't have
the "ext" field, but I think that's OK too.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>


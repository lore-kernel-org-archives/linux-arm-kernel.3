Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9BdsOznYQJJw8ylIjIMJ29PBGqcltE3Hr9Jwn8aENk=; b=kJFi0lFa7CexF31CttLaHU3Hie
	kQJou9SjCg7huxPGvZ0c29mqDdHqwWitW+NYVqV7JnGZNjK8NutXXMd7YCrvaq7BWrFsRvQ/qhZwS
	gPL0Mb9+YNK+sn41qnuLR8APk2xrn2r1Mjz2YGiWWU97EB1365sqX5V4hFHjwG5mxUozFa4SGXKxq
	SwJdEsBAYtH3vDe1xiefwQCRRIgDhBtV7hvn28GScyB6QLb6vs7erUgkIFkOwAQ3F8oZxE7H/kt/O
	BAcRJKmTHAbiSApWTclbfD59YlpjSPycNR9D4ePV0Fsp7P/UtKCr5YRbT+0K+4hrdKINk2z8sldKH
	Wq2wFU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGfx-0000000Byod-463J;
	Thu, 06 Mar 2025 19:14:33 +0000
Received: from mail-westcentralusazolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d102::] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGeJ-0000000ByZ7-1z4o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7Hq5sbwCmjSb+Hi5J2DoNb+35Ln7GUx0bvs0DP7ULDuNlYiypRjv6QwDI029YdPJETk7uhZax/JjRqraG7YzOJmjOV/yg+A83cg5P41ZL6cRdUbn2TR8ly9JIC3L6Ttfjdd3cxE90O04dOEBLqleFzDg1jgeLSwcq651ZgiD4lWkaT5CSuAgwqgN23pQRkjjybAa+cclclE4t+ltBBIboZ/GGO6oB+lXLOzW8KJbFhZox1k/qmDZRY2fJ0qHsK2vuMhJaEjI5dJ60ncPHHhdqq6mcifacuZQMZF7jLi0jCdMG6mTnABnMt/GHObAEDjyEHDZVtRcHP7aNFZzs67xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9BdsOznYQJJw8ylIjIMJ29PBGqcltE3Hr9Jwn8aENk=;
 b=GM4gXCZIL3bV5I4tJgBzGudMeLFm6ca1ECAZK8wZg6+X4iT2fi8iSDf1DBYZgi0ZWD+4FbhZ3RJoDb+nDlrR26AuJ/F0WpOoQdJa5yobIkdCuPuiMTAxuQMO1qYWf45wgN5i19EZdA9lOBWGWlpCHCQGwoaFyFPuD6DVrsAAkqqSQfsqfVeZWmiU0kVb7KYzX82P7rfQcyKRbitKYkaLZZzlm1GZD4bxuMXKvUS1DI6S2dCinZdm8NCU9KhVAXT3JuJkp/gAzlGYfBw0S16DKGkfcl0GplaEDzU/jWwBgnPRcftVYS9BiRc1wWKSbvhCYxsqKJFjqIVmkfHrc6YygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9BdsOznYQJJw8ylIjIMJ29PBGqcltE3Hr9Jwn8aENk=;
 b=dJ+4cZJYubQQOFkTGUcB05QNt6Zy7R9hZg6wh57DexpwkpBxBvEgkyczdECA3Cq4pgihrFxtyvCT2zjukDUQcC5JZwHTnSGqNjudi9znzUfUZgo3+4mU/pxZXF/Bnp/E9BHjwtIdaImpp2H8pYaKLq0ncjqC3sSX2Tlid/AQ4rozWimtA/3sUSlcc9SMnAKEj7V0P7eb66IxSHjdkOnJdA7U1B0q6tAukhIDL4jhk/GTzZwTo8KAUOMTKnTEJ04lZjlO9svi2i70RBUwS6/rtKRcj+t4AwwuZlJTuZpiufCoy8M1eoNX3eeEc56ObkGD5SgrI4FJgaTEkVcJVTHfiw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY5PR02MB6770.namprd02.prod.outlook.com (2603:10b6:a03:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 19:12:44 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 19:12:44 +0000
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
Subject: RE: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
Thread-Topic: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
Thread-Index: AQHbiKNsTgi31KDW2kWTBMZWQdlZtrNmhezQ
Date: Thu, 6 Mar 2025 19:12:43 +0000
Message-ID: <SN6PR02MB4157A8F9C0DAB7AF7D50EDBBD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY5PR02MB6770:EE_
x-ms-office365-filtering-correlation-id: 927dfa73-a482-43d4-8e19-08dd5ce2df95
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|8060799006|8062599003|19110799003|15080799006|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?CNNejpw5jFYyZgYi9dpgSES2mEMtW6yUZrAN3rW+GzCN1u9e3J3xmZ7HJwrr?=
 =?us-ascii?Q?KZwFmGDPgkQovTEn2FqGGzLM0YIf7FDe9KaOoKO/AW/eoXPaOPlKEkTU704e?=
 =?us-ascii?Q?xVf7V8Wv5/UaC+eFTi06s0SiwczQGD0O5fMR17y9/DZDKg7BuPe6PR3e2jJ1?=
 =?us-ascii?Q?6jT+OcSIhgab2EjQhjq+vOLGJfYQWlMYVutM4a8OQPyU9j4MsnxyC5L/4hWY?=
 =?us-ascii?Q?hmwTOcPRipcmMH0YGMzpTMQIk7Zs0E2DjmK2Eg0BO1pptpt8UG964RA/dlAk?=
 =?us-ascii?Q?7SsDeQpxlRejVNBSaSb4pfs9JKdkXqVu6DneFlbVYqTKP4umzoiBITzFTME+?=
 =?us-ascii?Q?AqR22FqDA5duye0Nn/NBSUbAmbqSGC03mx/uyOJ8xMS79q3AIW8Qf8vLYNQl?=
 =?us-ascii?Q?+68xBFDi8w7Xk4dH3mefiizl7uize3+fM59JHSG/A2KXNvmYPHpcdmunW1px?=
 =?us-ascii?Q?ShhKPnDGREqQuLiYxcnN8Xk3xS5CprgXIjFSq8OrDUTrNWUxVtKuu6HOu16t?=
 =?us-ascii?Q?nIfwuuje/yqF7pXmT2Kb3BQbXnXZo8vybupZUOMdN51QXnnmDtjTfBPNoDhN?=
 =?us-ascii?Q?ry2g4ZP9pHCy8Bd2vlyySFhPo3vOXbIsDEwZE30lnXc5H2VITtInCchzOzeY?=
 =?us-ascii?Q?NMsN0KXWca4jbhWHeTc1HT2AFSD122xN3G8Fszh2sab5vWtr7RMWKvKx2bfy?=
 =?us-ascii?Q?zz27C+pPeeUCUYnFKDDJQJd9I1RN0kO5xOOKQqXuKuQTNRpSrH34MFRoZG94?=
 =?us-ascii?Q?XBZGFMrE73WC57rEOVBis0rMN4X6POfF9FSIBs5zSMBNGZoBIOaW2W+ItLJM?=
 =?us-ascii?Q?IcNuMuSdiEC+ftRRcKDO8KG2I4NPi6m7MtmUgZsU2tEB9TZFO4tAyJEsQstm?=
 =?us-ascii?Q?9WoEHChm9FY7Eb3vUoRnswIW+eRSRuKT8FlJiZdoOJsbOUWhbA4zD7tKPvnR?=
 =?us-ascii?Q?+ABBf7BdCQCLmKwd1Oj7RFMJRMCI7KNaIQWvJEObyfSOKrkMifNhFgtqlcc8?=
 =?us-ascii?Q?IyCJcdwYNcvA6U1FVBPIGCzqu4ig25hVChRj9BtFzNHPke0kQwzYRPO1XcET?=
 =?us-ascii?Q?orDvbh6b+htidwjVuwAAoKqvT7Golw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cNFAx+Kbnau2Uz8+WKaAnC8CHTkLpebw+mVk4GhqQZ7rPfGM6icIXf/hv/cQ?=
 =?us-ascii?Q?OpE5nZY82KWkhnUQqSjmogG7cb9Q+LGVZxu/4kRkbeewxjufzRB6HpIuIyv1?=
 =?us-ascii?Q?aJ4trpyhHYyAcaIg5a2FpYjh4HZQQ21TFqugNURy7LxZhnf84Ak/2BFLu0ym?=
 =?us-ascii?Q?dX2rOLAvaF4xR9eVahua/tBfGrD/DYRa5xEsXdVSBlxmTeAOCj2ZswlwahJr?=
 =?us-ascii?Q?RZOWUqAR4lvbCg4Fmc5C6Z89HZ1WO9QAKCYMDInkzcwgXK2IKuO7D34KVRrv?=
 =?us-ascii?Q?7ZvI0BvPnM4RjMy3xqxQqUrMpnYMJ5ligTFLufc46hodc7/OYvGqd43rZJ2d?=
 =?us-ascii?Q?4Ld4JmJ4yJjb3YGnCa8DAeJpxqtlhnQj+ap7QM3jxUysX/Qhb2CJxDVrgIdv?=
 =?us-ascii?Q?PkyCWnYi7E8VRRflNyZrEoLGtwf3KeNCPdcy0fdNGn4L/5Vc91134Z5yA8zp?=
 =?us-ascii?Q?iZmg5JbaFtrfnpMxI/lYJsOjKMF/msiWh9QfRDr9ZuZLZRsHpusgw97+WvmU?=
 =?us-ascii?Q?7hI268PW3iZLHH1ig7QKuYto00VkQOMTrZ4/Xt9oODWkl7B0fd72vWVAOknZ?=
 =?us-ascii?Q?QA1848idLR+SZvvj0+AqIqXnPY8VYcS3uxOPYUAIm37TxCtFNfdp6xH/x4MH?=
 =?us-ascii?Q?jnvcNRPB/VnDrdB0KO5UBust2uyRBdzQnq84JXdzG6Ak9o3MZmu6AHHQVLxq?=
 =?us-ascii?Q?QB/w1SDWX5kSf26Y1jz2YSadQK5YyDWvuQSEyGGrfpsXN6NbvOjNKzMi2N2K?=
 =?us-ascii?Q?1T8NVyRU6qMvaIz37aBPVBdVbEL9zh9SiU7F7mtbNBim7bk4Df5X3rALovS0?=
 =?us-ascii?Q?zueD64AdHEa/ibynLezjuhY4OBy/K+fWBT52pdqe42DI0A124m8De6BRpmE3?=
 =?us-ascii?Q?59MrLAWrtaoThWtPEHRdmUCIK0P4Q+RbhqaU1au2LCTk4PAZyEZuQwqmCus0?=
 =?us-ascii?Q?CgwKKcGjjz4tff4Df9wf1TvCnH5VdVO/CWKlozN0HaDRdZNEzDK3hWWb+qeJ?=
 =?us-ascii?Q?JT0naVO6geq3mXdrR8BDtiyeCpKjEPv/GRzhCxbASBCZAYX8ni57tSGSLLxg?=
 =?us-ascii?Q?LuqyegWwT6hCtaCNvUTuFTRQ+9FXk0dC6WwC9xd6/FMdYDXjGmQL75h3KJ6O?=
 =?us-ascii?Q?n0sPEpMe5o6tA3Zn2ovjZjXjYFJsUDcpkTtgQvQRJLZ9SVvll+h0QJrTIomb?=
 =?us-ascii?Q?1tXtBcbc6uSCHMeXH0mzWBF0n3j9zAoWPuJXJ42v9kf1gmg0Cgj/JWGDtCw?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 927dfa73-a482-43d4-8e19-08dd5ce2df95
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 19:12:43.9396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_111251_504792_4FDBC51A 
X-CRM114-Status: GOOD (  16.17  )
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
> Factor out the check for enabling auto eoi, to be reused in root
> partition code.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

>=20
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  drivers/hv/hv.c                | 12 +-----------
>  include/asm-generic/mshyperv.h | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index a38f84548bc2..308c8f279df8 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -313,17 +313,7 @@ void hv_synic_enable_regs(unsigned int cpu)
>=20
>  	shared_sint.vector =3D vmbus_interrupt;
>  	shared_sint.masked =3D false;
> -
> -	/*
> -	 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
> -	 * it doesn't provide a recommendation flag and AEOI must be disabled.
> -	 */
> -#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
> -	shared_sint.auto_eoi =3D
> -			!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
> -#else
> -	shared_sint.auto_eoi =3D 0;
> -#endif
> +	shared_sint.auto_eoi =3D hv_recommend_using_aeoi();
>  	hv_set_msr(HV_MSR_SINT0 + VMBUS_MESSAGE_SINT, shared_sint.as_uint64);
>=20
>  	/* Enable the global synic bit */
> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyper=
v.h
> index 258034dfd829..1f46d19a16aa 100644
> --- a/include/asm-generic/mshyperv.h
> +++ b/include/asm-generic/mshyperv.h
> @@ -77,6 +77,19 @@ extern u64 hv_do_fast_hypercall16(u16 control, u64 inp=
ut1, u64
> input2);
>  bool hv_isolation_type_snp(void);
>  bool hv_isolation_type_tdx(void);
>=20
> +/*
> + * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
> + * it doesn't provide a recommendation flag and AEOI must be disabled.
> + */
> +static inline bool hv_recommend_using_aeoi(void)
> +{
> +#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
> +	return !(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
> +#else
> +	return false;
> +#endif
> +}
> +
>  static inline struct hv_proximity_domain_info hv_numa_node_to_pxm_info(i=
nt node)
>  {
>  	struct hv_proximity_domain_info pxm_info =3D {};
> --
> 2.34.1



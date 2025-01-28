Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838D0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmwF8aTAKa3CjIOKgoqvxD4g/Cy1suZM+RTdGvpgk9A=; b=nAcyXsJJCF1zzxvt0cjVpWy3Nn
	BWwYmyqGMZx1Qp2WydhqDn1BVWmFIEThDQ+oZtNezs+bizBTyAcI1bhYiNAV2yojo7nSOT67WX3uN
	RacBVFv2bBUYwK2GADLPs8N/8FLWdsLfvL/XwXmcpmqm+ig6x1uYBec2FgHYDYEs4vOF3feTVaTBF
	22HUXxpzRT+iv3+ZwKgtVU9kni0AI7WXmFnXX27PLHTqvWKZXhdQgwC/+jBrga/whVT9s34vYDYXU
	Nubg1bQXaYhHTWVrga2X9saFAv4AQpH+9ZHDsptP4HpNkBY9aSu8M+uSSbfOOTynWLAfjvTFuN1mB
	C/IS/Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqd7-00000005d5m-3xMx;
	Tue, 28 Jan 2025 18:48:09 +0000
Received: from mail-mw2nam12olkn20827.outbound.protection.outlook.com ([2a01:111:f403:2805::827] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqbm-00000005ctK-1YrH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 18:46:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhHbD1pUwvd/1YlFpo3Ay+OBDMVRAGSKi10MKklBli7HS3s5HJ1UjjhIJL0GPoVKbHdkwAkGtdXOaaqOTiYtl9Tno9T3TUY5aBRDT5D4LL/9WF+dkREyFAJXh/9T3px3ELx0hVgPxpV4CBJHJWXBspU28Wxcdd/9HJ7xOG/va8nP/f1y6nw/qgGfncwOta77arFYACYqHXyDdpHa0Ec6Q70DrdcMFWbnu4YtdmuggMTtt01uUgSf/gqode7sfLMCoAvolCZFBzuPSTlk2AiLgNMphrhfxhk42YtLqPBqsgcvSTv3WbPDP5h3UnjITYJfIw+36+lOYVEc6JDvOLZNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmwF8aTAKa3CjIOKgoqvxD4g/Cy1suZM+RTdGvpgk9A=;
 b=IZ//P8gq5/qQk9xycvdG98FLhO4g6bhep+KX18p43DZLkSBeom5gtJW5oS2HFuSzO++muhWVfzQtHmOaQZjaz7H5U9BJ8dM0cuG4tltBdco5Bvebqm7FP+IB+zrdmAMPxtZ00SRN0QP6x7T9K0pNZ/CsPPNcEloABtnK3HmcBqD2Bg2hjM0z0Df46ymS83u3H22pkRFjXEeo92g9JfThUm++9nYUPWDgF9jhcVY2GhcynD+tH22bNYi2gxJOCdZ+0hHndRE17HCojb3qzW8suBiixz4agdHTYakyS82m1oUy+Pb38+ZI/oNFPxI5l5sTKYxtrVp+FqPRgvE4wVUl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmwF8aTAKa3CjIOKgoqvxD4g/Cy1suZM+RTdGvpgk9A=;
 b=p2LJM3Yi5W/s6ehUgL4xVsuvPpA/VMOUDdOpWBx6ESitDwG8QM4xNy/ZPb/6ynEwrPQdGA6Wzq2c81qjDC6bZeu4ucFFqmXQbZiz9OVWMwceYM5aLc831cGuBK6jw2qkm1eaQ15tdw3C+kNZuYL/7IJmsPjwkjF8NrUfneYfMJU24PEB/yNy/+U4B/v6a1oMDAWmqouuo0G7uqc0km/oVYJRYTuPIzmKxvdSpNsF6MR8oUFtJXASGwO6HKpInij63v44opOI3dcG6cxS4tOldSsBH/xPYS5wgjy/fswZd6wDMwvNcOoQDJZN5CYmPuhjIqLeZr7SANJieuSRFK1hfg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH7PR02MB10108.namprd02.prod.outlook.com (2603:10b6:510:2e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 18:46:41 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 18:46:41 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "wei.liu@kernel.org" <wei.liu@kernel.org>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "arnd@arndb.de"
	<arnd@arndb.de>, "jinankjain@linux.microsoft.com"
	<jinankjain@linux.microsoft.com>, "muminulrussell@gmail.com"
	<muminulrussell@gmail.com>, "skinsburskii@linux.microsoft.com"
	<skinsburskii@linux.microsoft.com>, "mukeshrathor@microsoft.com"
	<mukeshrathor@microsoft.com>
Subject: RE: [PATCH v2 2/2] hyperv: Move arch/x86/hyperv/hv_proc.c to
 drivers/hv
Thread-Topic: [PATCH v2 2/2] hyperv: Move arch/x86/hyperv/hv_proc.c to
 drivers/hv
Thread-Index: AQHbbTjLMVJraRuZWkyXzYUCDAxOb7Msjxzw
Date: Tue, 28 Jan 2025 18:46:41 +0000
Message-ID: <SN6PR02MB41576BF484537D5A2D33C6B1D4EF2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1737596851-29555-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1737596851-29555-3-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1737596851-29555-3-git-send-email-nunodasneves@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH7PR02MB10108:EE_
x-ms-office365-filtering-correlation-id: 955d4e97-12eb-42f9-ed39-08dd3fcc1ad5
x-microsoft-antispam: BCL:0;ARA:14566002|8062599003|19110799003|15080799006|8060799006|461199028|12121999004|440099028|3412199025|12091999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?vX6JmYH60rm6Wa+B5mzqXIKs9ip+ktQJVZ1KcenUUmp3XGeImyldODKi170j?=
 =?us-ascii?Q?4FnZ5pGG/45a8s7Hxb5nOPw+x94gh7AWdLIhVMuzMVC9IRR/LiE8qe04UYJ9?=
 =?us-ascii?Q?7YW36AZnGxCAI3rYo8Qlh1DL6Em3nrcsBRf8+OSdrorB4VMktAxsJ94xkpiL?=
 =?us-ascii?Q?okv+e649MVt79VzhmTmbb8G5v53c9Bu+mhsiiCuwm6Jei+UK60YnH3XMMu5S?=
 =?us-ascii?Q?OC3/lZFetbpBQ0CJZ2avGuCVZV9YW+Atqt0UPhoWH2x4HrpKlYxo4WEX+L7H?=
 =?us-ascii?Q?8r2iIxoHdg2L3cTaTK4sVqGuLTDrhSMa9oafZYBJC6gN24lWcru2ebBaxJ8t?=
 =?us-ascii?Q?agmknRA957Bw9RXbNyC+x07UZFBww9xySuIzMsg41bcrsi8GdygakjQ6Tqci?=
 =?us-ascii?Q?B6/vF0vZ5AlwqwTbTP+mFnACS2xCXzbwa35LmCvwXEoslYDQN24UD6iTjFyy?=
 =?us-ascii?Q?khhCrcS1t86//OBeYfdulNKLHe3CP4CJiPBETlbEenfQeVB9hgj3PmfOwrrQ?=
 =?us-ascii?Q?yMPuBs5B5ziI9ZYKHd2vS9RYGNMJDSjcsVQ9wOVof9YBTaTsC9i8irV8dtV0?=
 =?us-ascii?Q?9dijMxB2zXnvXiivhGHYJye6kdAU3Y2aUhj1vvZ8ZHCADnWNq7T47JbpElfK?=
 =?us-ascii?Q?pvpAGYu4wA6r75Y3e8RAxF4SQLV5IeWPNBfwQFPJZzSJxIlimivkOOk8ahjG?=
 =?us-ascii?Q?YlCcv3iTOM7UyCQMwP4iZeRqSSH59PSpC2T4Y+WQtjMlK3aqUJgpDBGLBMu3?=
 =?us-ascii?Q?Gmw0h5ejTe+z4lLd/CymG5aoqqYErpIMRJbb7ddEL3nLxBNf+l1SRkNT2jQF?=
 =?us-ascii?Q?+ekdSshUhnE/Qn70L1077h3Y+ACrpMfq+wUwE0SI3gjEtnr+wZQq1WaJs6ma?=
 =?us-ascii?Q?w2Oie371jTdGgH9kxZgspt6Guf+eGUb0TwBcTugnojU0qk1lTf1mo2dgo9Dw?=
 =?us-ascii?Q?3/lQOE/+26HWXwKSQWOu7MveSnXmzEqcP4y6wu9UzNSwwKtxMxY7l2W5j+yS?=
 =?us-ascii?Q?PPCA0Mn/cqmt4OgkKR3G5grBz/gtORYB/DEqG9iG5En+RlHpFu5SLHpTHvgk?=
 =?us-ascii?Q?+QMGf4aG1dhK589H3G3S8cpgvxl/Dh58EYXgP2GfAKVnYzS1lG8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wqmtzEAxp2OD18aq7Zt2g06qX0n2dH4H8HkV8SlPmuJvPqOTTQ+Eqd2dmyC5?=
 =?us-ascii?Q?99szsx1aYSyrR4PkqRyyHTfVhryfzWM21G3UxO4eHCtiP1mB7pCXsppvE8mn?=
 =?us-ascii?Q?vOUOSdQNVBx07az+w5wf8YpeqeEN+l8tI1tt0ZMLq/C13C5MaEiWDqQUeF1v?=
 =?us-ascii?Q?Woi3Wtw6Ymkbfy1scs+iBLzEJAGStImUutB7kS9+yrHQxt1OWNZaH158zA0D?=
 =?us-ascii?Q?YQDaPIq0ER60BWR8lu6zrdwo9A9NuMlU3trv9HT++t3wFKhKPomma3iRCseW?=
 =?us-ascii?Q?ODbdHcwWf663YTeVuMo/+/zYNpd+1lU64rbi2vOutI7QnHi6odpsimRluRx8?=
 =?us-ascii?Q?7YkxXvSdDbspStWehQAEAtlIJ2dkdYtA3i5crIsVov6eyx/qbSHYzIhsS3qT?=
 =?us-ascii?Q?SQUMlmhvhhoPWm+ZlzUHF9FPDorFwvWOArX6syVdZqQdouV5TFWP03UZA+uX?=
 =?us-ascii?Q?rXoFLe1FPbKNKPKBByJrM1efmYebVVsSQ1ahiogFn3Kmqp4atDjvnaJPkFZ/?=
 =?us-ascii?Q?dlqJ3EzVmj5CyB/z3snhQnUME0sdedUZyZ2T5plUwZqEk9yJYIALP2NTdMAI?=
 =?us-ascii?Q?7DguKejb4A0MUKVyZDpyH7Afpe9/XSFj7jPetl40f7n5DWIITEC7edy9Ftl3?=
 =?us-ascii?Q?QQPm1W9Io1wlQ1WVQ0+eVEtkfWCsxZSeFPp5bCf3PdS3t33kYMtD6m74DWhx?=
 =?us-ascii?Q?0bDhuHLuLk0If0a3XtN6OwrjhR/qOkE/H0noru6shilxFe56uAUNjO5XCMyS?=
 =?us-ascii?Q?oYXVoWUfLPRPFHrq2hqgtfDXJCJzHNc8Lj6555WzR5gsoTVYKJwL/psYiRPt?=
 =?us-ascii?Q?jrD+mgxLsn2tRaKkUGigW3jFqW4LcQnHorwHaNB83Ij13VGeRTyPkVeg6Oa3?=
 =?us-ascii?Q?Vj0yXx5UGkJSXBFsz46p0HvVgMk8jAmT5A9bJncnKWo3qwoMUdyEanhV4vzR?=
 =?us-ascii?Q?VDdDiJ8aqcXBfirJeQJqwnYmpJn+53Smn2UtC59fwv36uOJQmSY6r5IOxbeK?=
 =?us-ascii?Q?4DUYpwaEPTdHvvwOfRm2T/iFlZSEznBJqaR7ucH2k/MnHbaWiDcT2YYXyMb/?=
 =?us-ascii?Q?Fo/Gl12ppdtcDIsGYWgmgW9w7dl/lSvzjz0S6XnLft19utvIFQsspoiYsS0b?=
 =?us-ascii?Q?cvhE2KWOt+2oTRuXj789LDcr2bCDJntpqF78u7L5kfERFdfMQYOoY4UJlWjd?=
 =?us-ascii?Q?aNuALeAhm7iBq4ChI91T1ZwcFFkVqVAov6TBuPOjTdB95HxN8jXpf+Xde4o?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 955d4e97-12eb-42f9-ed39-08dd3fcc1ad5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 18:46:41.2430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB10108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_104646_416226_77CB0589 
X-CRM114-Status: GOOD (  16.58  )
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

From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, Ja=
nuary 22, 2025 5:48 PM
>=20
> These helpers are not specific to x86_64 and will be needed by common cod=
e.
> Remove some unnecessary #includes.
>=20
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/x86/hyperv/Makefile                  | 2 +-
>  arch/x86/include/asm/mshyperv.h           | 4 ----
>  drivers/hv/Makefile                       | 2 +-
>  {arch/x86/hyperv =3D> drivers/hv}/hv_proc.c | 4 ----
>  include/asm-generic/mshyperv.h            | 4 ++++
>  5 files changed, 6 insertions(+), 10 deletions(-)
>  rename {arch/x86/hyperv =3D> drivers/hv}/hv_proc.c (98%)
>=20
> diff --git a/arch/x86/hyperv/Makefile b/arch/x86/hyperv/Makefile
> index 3a1548054b48..d55f494f471d 100644
> --- a/arch/x86/hyperv/Makefile
> +++ b/arch/x86/hyperv/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y			:=3D hv_init.o mmu.o nested.o irqdomain.o ivm.o
> -obj-$(CONFIG_X86_64)	+=3D hv_apic.o hv_proc.o
> +obj-$(CONFIG_X86_64)	+=3D hv_apic.o
>  obj-$(CONFIG_HYPERV_VTL_MODE)	+=3D hv_vtl.o
>=20
>  ifdef CONFIG_X86_64
> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyp=
erv.h
> index 8d3ada3e8d0d..7dfca93ef048 100644
> --- a/arch/x86/include/asm/mshyperv.h
> +++ b/arch/x86/include/asm/mshyperv.h
> @@ -56,10 +56,6 @@ u64 hv_tdx_hypercall(u64 control, u64 param1, u64 para=
m2);
>  #define HV_AP_INIT_GPAT_DEFAULT		0x0007040600070406ULL
>  #define HV_AP_SEGMENT_LIMIT		0xffffffff
>=20
> -int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
> -int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
> -int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flag=
s);
> -
>  /*
>   * If the hypercall involves no input or output parameters, the hypervis=
or
>   * ignores the corresponding GPA pointer.
> diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
> index b992c0ed182b..9afcabb3fbd2 100644
> --- a/drivers/hv/Makefile
> +++ b/drivers/hv/Makefile
> @@ -13,4 +13,4 @@ hv_vmbus-$(CONFIG_HYPERV_TESTING)	+=3D hv_debugfs.o
>  hv_utils-y :=3D hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
>=20
>  # Code that must be built-in
> -obj-$(subst m,y,$(CONFIG_HYPERV)) +=3D hv_common.o
> +obj-$(subst m,y,$(CONFIG_HYPERV)) +=3D hv_common.o hv_proc.o
> diff --git a/arch/x86/hyperv/hv_proc.c b/drivers/hv/hv_proc.c
> similarity index 98%
> rename from arch/x86/hyperv/hv_proc.c
> rename to drivers/hv/hv_proc.c
> index ac4c834d4435..3e410489f480 100644
> --- a/arch/x86/hyperv/hv_proc.c
> +++ b/drivers/hv/hv_proc.c
> @@ -6,11 +6,7 @@
>  #include <linux/slab.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/minmax.h>
> -#include <asm/hypervisor.h>
>  #include <asm/mshyperv.h>
> -#include <asm/apic.h>
> -
> -#include <asm/trace/hyperv.h>
>=20
>  /*
>   * See struct hv_deposit_memory. The first u64 is partition ID, the rest
> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyper=
v.h
> index 98100466e0b2..faf5d27a76b1 100644
> --- a/include/asm-generic/mshyperv.h
> +++ b/include/asm-generic/mshyperv.h
> @@ -217,6 +217,10 @@ void *hv_alloc_hyperv_page(void);
>  void *hv_alloc_hyperv_zeroed_page(void);
>  void hv_free_hyperv_page(void *addr);
>=20
> +int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages);
> +int hv_call_add_logical_proc(int node, u32 lp_index, u32 acpi_id);
> +int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flag=
s);
> +
>  /**
>   * hv_cpu_number_to_vp_number() - Map CPU to VP.
>   * @cpu_number: CPU number in Linux terms
> --
> 2.34.1

Reviewed-by: Michael Kelley <mhklinux@outlook.com>


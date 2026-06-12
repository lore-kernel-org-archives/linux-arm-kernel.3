Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F0CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5aT4tkM4iVgKvx6jGN4RkQwvFk6bLKdjT//I8KvwEo=; b=LnumWRdDUuTSrXD0AA3bWOfrCz
	03f+E3UzAtU5Oebm8++SXnBYUJT/vGUfSPcL5BtK3zhnKZzdTtWI2q371Jz8ar2KnmJkCyg2YU1dN
	vxR9kTXsmN9sbI1IEk++IWLZWKauJeixv0IOMvs6iLnCm2wa9eKpmSKIv/2NQ4WPQDltP3FjBPrJV
	6kWh7l1F1Bnz0jiriyR+DSnl/KNIi4ResdLXgLqXlyOQa+NQVkUchKfqw9wWMmDej/QUgnsfZU7UH
	9JkbvOid66rYAFCHNxAgVqMwNIWzrLY7k5VbpxNpxYrb0IlfPiKjnvu9KUi6EOkRd1MtKJ6UIBPyW
	Ep6092MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Ao-0000000BBeI-3J3U;
	Fri, 12 Jun 2026 15:51:58 +0000
Received: from mail-eastusazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d100::1] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4Am-0000000BBds-29OJ;
	Fri, 12 Jun 2026 15:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXTzVGiBNA86ENHH8G1hAPZW5VafoydiFwxyiHFJgckqZw9Izp/XZS5SPIbtqqc4DB+Me+XV1R/Tc8ryNsGJjK9vNiO18oC4mgv/3JTNusydBfaT4gijdxAoudOuIU+afTZA4w/nEtgtcS3NX3eyP4O9YQStEx2U3HzZgbK9qG4gBraOJ2kRyA/IvY87CpvegPNUINeLsqaT7VQsKltHXzD0tajbkFozh8R7IKU6pok305OBK1yEJMLwjCpMiSj77J2z2bM5/FRSVvcgaerlCiTjfm4xNDO2LTr6zJN0Hl9AMxXaP/N/JYeqQR54b1Jt0ZZYYtP0b49xTNz/grbMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5aT4tkM4iVgKvx6jGN4RkQwvFk6bLKdjT//I8KvwEo=;
 b=c9t4gqJQSW7/af3BOdkGHymDdSKaDNjY0sLRqsmjLBekw/Se7fWjCFSwnyCw5t89VSPQD5fGYxnvP/HwDPREV9jMCVF4eF3GItlw3uKr2neCycTWbxx5K/kF3RttVUgzLITm7IJKbhTgB0t/DP/GkP2/2kT/Sd3+T5eUcPDKP8YCWTzDEHmH9yToKd2AmAqsAK98cxjv1cUrkwBfOheEySg8vB/Jm9A/UhU51KV0/ioawZ0VwyFi3vSNDPKIqjgyVZiBv9ZqIBWzJQDgJdPrRFEMKq0dP/qUVlqyMxwrZS/7/2J7DefviqwDpQTxZ5ZBj+mLmUqtfe4E6Yo12e44CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5aT4tkM4iVgKvx6jGN4RkQwvFk6bLKdjT//I8KvwEo=;
 b=L45RGv90s6qbF1pP4zySTDPFUhysaG29KGVdshErVgNGEGDGKt+M9r5StTmg6jBDYbcOgHN/Wv6bGvXr3EFJf3hE3az3fXrqMCSiqZUTSdlBZLvnZSaEJb6WO66oTyU7Mqz62fgSh3HDcx4cl9zR3gTJvPcYSdpQbwIuA2irpdvXZuDW8Ly/L5nUHE8QjDEuFljYW0tbYAWqYRg587hGudleVbdqCY8d+H8qHxBuLB1vghnwuUxWOBav148ULwCKDVMKfUGH5Q1pHXHWDjB/9+frS/kxLjuUQ8CVr6/Eu7/jSgQ6DO+Fr78c1zuoKg1RbUPIA2PkFqSuF9gvLr9YCA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB7078.namprd02.prod.outlook.com (2603:10b6:610:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 15:51:51 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:51:51 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>, "yeoreum.yun@arm.com"
	<yeoreum.yun@arm.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kevin.brodsky@arm.com"
	<kevin.brodsky@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH RFC 0/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
Thread-Topic: [PATCH RFC 0/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Thread-Index: AQKOA8X39m4tY91Ji20k4ddnJ9pPpLTY/WbA
Date: Fri, 12 Jun 2026 15:51:51 +0000
Message-ID: <SN6PR02MB41575CD5883C01FCB7F35E2DD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
In-Reply-To: <20260611133809.3854977-1-ruanjinjie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB7078:EE_
x-ms-office365-filtering-correlation-id: 9157891e-a0e6-4662-f432-08dec89a84f8
x-microsoft-antispam: BCL:0;ARA:14566002|19101099003|15080799012|19110799012|31061999003|8060799015|13091999003|8062599012|37011999003|51005399006|3412199025|440099028|102099032|40105399003|19061999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?IU+D0S7Le3TUv3ZIEy0WMwum551TCsDMh8Y2NTmxpZAu2aOWKvz5pDRti2g5?=
 =?us-ascii?Q?BQwCoJNy7DnukChYvcZ3ZHlzcK5DuL4hB9sJHzd9Eje0DoA5IhqHcfl7kEq4?=
 =?us-ascii?Q?h2nq3pCSJz9SCZH8gm/UiBOuZLNSUUUzDigwNB0dHTMazeUt6Yx0wqqbZ6JZ?=
 =?us-ascii?Q?eswu2k5o4oQDxOOLbJaUzSLYOEqx1rDEEAIhpGi97tXYOwHmlWEHsM1gqszI?=
 =?us-ascii?Q?TnsxhnHme+Sj5eDi8QFRjM/uMniGjF9JzhO2rF5v0sXQPzgp2qxvSeYL1ovM?=
 =?us-ascii?Q?KG91z65LYBnpeNoctCXyilA2y6ejwTkkvCxqVMI7x83GASwQ3TNdBdYuA0Dt?=
 =?us-ascii?Q?0S7W+SJge9uUXLBp/k2qJ2CBVdI1fxjRUe7CHtZGUdl/OZr/UnC1hwpupuA9?=
 =?us-ascii?Q?Rhe037FreLNIR4DmX0YslO6T8OtzpMfB6ShzXfEKE06WvsWHru8+fnmNeNnW?=
 =?us-ascii?Q?39tT5npF5p7799BVKnwfTIl11jktn97uM9hnZrZFU6hzVTKiG/VkxCy/Zhmi?=
 =?us-ascii?Q?JG9+amfupg8yoqqoz/Wte1ta0fAq4ptUxsr56Zz+fjnj+biTtLxzzi55FeFp?=
 =?us-ascii?Q?c/vg7d4N5Z/iyypYdC2Kl+M0DJl+LAgrsVzuwbQSCEQIfHMbuX00i6FHX0wE?=
 =?us-ascii?Q?JZ1OhXLBb7qhX8tvjdJImL/MNzIx5szMLhxsImwxque9MPw2HkBhmTH7LGkQ?=
 =?us-ascii?Q?qd+PXi0Clb9oOCdq7T+1a2wvhpRPgMHyjk5wq1g87lHEF/H+Esuumx2f6kPX?=
 =?us-ascii?Q?SsfCtAmmdQvdl7SuMtudlOvo9F+tnpr97kFDd/R5CFrU1FQcyzvoRwNxzgJg?=
 =?us-ascii?Q?aoue1ZBu+TKXyjhWl9wupD67ZP6Yn1iFNcxlzTjbiaSUl0kRnBZrJE6rR9Tv?=
 =?us-ascii?Q?CB/n4zgdKlc3TI7YtQAZ3viQ0EZE/ALm4Ao+zHRWhSCCRmLyov4XRzBIVpOn?=
 =?us-ascii?Q?qEzOfcwZys413ln1x+kV4KyKy7HOKCQDT8aUPi2comcf9EXh2jdYMw0HJ+7Y?=
 =?us-ascii?Q?Z7IG3cw38wC75EiTFg/6lZHfbA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Msi3MtqWWsVQ9ucSfcfGyFiL8QDE041KBo/XbkHw4OQ0keXJlAtopnl8lMfo?=
 =?us-ascii?Q?xuTZ9y4Z0IKvRjyyMxAfBSLQ0AfGtkLlAOFyy463hYHxjbx2yQ7Kp4id0DiR?=
 =?us-ascii?Q?qZ4WSv3VyAmjjW6hriTerjHgJ5G+FVaw9P8FUMnPmVqmsPaCXZsN3ws6QIlR?=
 =?us-ascii?Q?tcputxTP9DUlFIfWquoB5QBq+lfIMWbOESxWEE8Rzj8kmrLTYR4GUuCVRvBQ?=
 =?us-ascii?Q?mz0vtBh6jHoOAKFlwhM02iO7yLm5catzSreg5F0WOMwTsxCaWHmpvXVmcu5Y?=
 =?us-ascii?Q?Gh8k2+P4qj/ktvCsWcS6BpA0whyApVLpR+3gJ0tqyTlTzQnzesBghoLOCL5n?=
 =?us-ascii?Q?vDUICWaaST/NWjttR27n13NIiF6GF/SJ9kopozIwd8jy5TKQOSVNh7sDLvpt?=
 =?us-ascii?Q?WVXt1E2ZiMQIZhKyeUl3XHUS1mzTtKckhPXn+eM4CdgJ8tuXdUARjO8mEFzZ?=
 =?us-ascii?Q?zZWKZNsK+UeWcln4LMrpi1XawPhBi9Kk2l2NpAe5PlrKd3VXCq4FZOADa+D0?=
 =?us-ascii?Q?VzeR/IcSe48pXie6reMUSozTdSQ6woUBgUJAWtrdlsV7BxV+IF652U+M+NNO?=
 =?us-ascii?Q?de57H/2gpPuwtiO7orJUDeN7oHmWfwdvh+Ci/N4H2qYWgTHp54PoI9/OPfyX?=
 =?us-ascii?Q?fZakFEp56bKRESXGGqqofX2nQP0jVLkE2b10zl/XHQmtZLUzqeHl/5FM7P2Q?=
 =?us-ascii?Q?eoNPVNZjy6LXGH7pvum0IM2/X3IXH8Y99Ixsa6f2H5+pHLAvlfLC0UeyrcSs?=
 =?us-ascii?Q?sZWFxQRORjsyBXZpGv3WuhT1LTpUiBSR5av2stpp1NDKBds60t3EfjrGnjV1?=
 =?us-ascii?Q?ajgcO4O8uVvavYfDfNZiRbhROYFfab42aV6pH5nB9aQWouugJahrP+3Gke6D?=
 =?us-ascii?Q?0l6sq7/IYNy5Dv0iNdAtpS1ALE+r0LbNkWmez6QI4bg/xie9UDxw6xMjH97+?=
 =?us-ascii?Q?ONaj0gLJ99EnOYa58l4eCXnIO66c6bsbW5SAQNLHkeaaozK7wrA1lQXW5owu?=
 =?us-ascii?Q?5agMCTHynTi9SvZ7QF41SeF0BbhgsAwovHIQSW18pGqkiP2TmnrhwRIqjAze?=
 =?us-ascii?Q?Ifuiokp9fCiQf7HJHYX9P5DBtSxYegxDuF2BYA7QsPw+Lc1pj/y3l49BRdst?=
 =?us-ascii?Q?LPcgv/FepKx7m60Bs0tUM+EZNuwN8BJb74NjhmzO362eYLEDeFlLZ85eplG6?=
 =?us-ascii?Q?uwQ8ygW4FKhZM4biI4hambtXADabrqiFXp0uaM2XBQ1fSDrQ+843dIYqhXFC?=
 =?us-ascii?Q?4dm/FbeD1tbDqwQBwUDHUv9yVBtG9+FGT1PK4oF/A00zR9mZD3OxdmwVmGLj?=
 =?us-ascii?Q?FZa0pkmYgyZUvOdZI8NWQ/fsKuA9ZH3Yx3+ADG8qSLF8f4/qMe2Z7GX8dDk+?=
 =?us-ascii?Q?OdalN4Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9157891e-a0e6-4662-f432-08dec89a84f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:51:51.4152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_085156_581227_6830B31A 
X-CRM114-Status: GOOD (  14.21  )
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

From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:3=
8 AM
>=20
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
>=20
> Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
> to boot first constraint.
>=20
> And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating t=
he
> boot status at a per-CPU granularity during parallel bringup.
>=20
> Rework the global `secondary_data` accessed during early boot into
> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> enabling the early boot code in head.S to resolve each secondary CPU's
> logical ID concurrently.

I tested the series on an ARM64 VM running on Hyper-V in the Azure cloud.
Tested with 16 vCPUs in the VM and with 96 vCPUs in the VM. No issues.
I mainly wanted to make sure nothing expected happened with Hyper-V as
the host.

With 96 vCPUs, the secondary CPU startup time drops from ~140 milliseconds
to ~130 milliseconds. That improvement is not as dramatic as you saw on
QEMU, so I presume the difference is due to the hypervisor implementation
of the PSCI calls.

Tested-by: Michael Kelley <mhklinux@outlook.com>

>=20
> Jinjie Ruan (3):
>   cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
>   arm64: smp: Pass CPU ID to update_cpu_boot_status()
>   arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
>=20
>  arch/Kconfig                   |  4 ++++
>  arch/arm64/Kconfig             |  1 +
>  arch/arm64/include/asm/smp.h   | 14 +++++++++++---
>  arch/arm64/kernel/cpufeature.c |  2 +-
>  arch/arm64/kernel/head.S       | 23 ++++++++++++++++++++++
>  arch/arm64/kernel/smp.c        | 35 ++++++++++++++++++++++++++++++----
>  arch/arm64/mm/context.c        |  2 +-
>  arch/mips/Kconfig              |  1 +
>  arch/riscv/Kconfig             |  1 +
>  arch/x86/Kconfig               |  1 +
>  kernel/cpu.c                   |  6 +++++-
>  11 files changed, 80 insertions(+), 10 deletions(-)
>=20
> --
> 2.34.1
>=20



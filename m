Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDB6F3C25C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwcBc7L9XkoIvgS8x3SaMlaO6p2yTy/gP4Rj9VvTNYs=; b=y51jh3bYKQ4ZR/P4ARbBIlRuL8
	GFiJBFldCAbtinc9q0ilMUN8aYUJfh6wdmGhjORhgSSWp7gfCXh2z2Ngi0uu66YiPGr7iyNjv9gcv
	3HQyvJf9c7/gbE3kkdQsxn5ZNaRqHyJR7wLl4qEtmrbmJ6bbUMJebz5TQiNnjpFoJJ3CD+AXoifJJ
	G3A+iwCwu5y1qsSPgtMrPdWfL55SKpUf+SQRWVNEAbOuWl+0iTPPyaOKCUv2uw4z17EAOaIe0sxk/
	jBG0wnRYSzCiNYBymmlvskS6uokkqJYeB7iFAQrFhtRnVs1U/qo200sBipdwbXW5HtffYo1iU5a9K
	V4wUiw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzagP-00000007Ofd-2eif;
	Mon, 09 Mar 2026 13:30:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzagO-00000007OfG-0H2J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 13:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 135E26013C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 13:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D9DC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Mar 2026 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063002;
	bh=/UpE9x4v0F+CNAUIdLtq+XMTp7Kikc6ThmOhH3qFRSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l0dcdh/UsmikM8MhM7nnR9sFSwzhhnHrl5yw3ultKfrvKHqgLOPe7/BW9hdQAoOpy
	 2Jagib5TrJblrZ+MwYWhCwOlsEKFr5tiqHf2B4RgcY4YPgnSU/j6abw1W4rr/SrCtp
	 JquQI0E00Vm3CrfF9UO5M2Kd06qBxfeXDtxYUe19rW3uccesip9eGAdc4f877FcIYk
	 KuYxa3VsYebvqPtfvjUpPzU3BVa0qGHWfflqKVGSCTV4EblYvn7dvpEyvAon+iGnad
	 wTLQTTJDsWmUXfDWDAe+5vZIZcWeI+3fLilJuh1zyd8f083A0ym0NZLLJIWixwJek/
	 c9scmPFxwT/fQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b940f962a82so656060066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 06:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjFXqzpPlFihxNDSteW+8KTd5D2hwTcEPZuLsKnCfimuEPkBob0MRyaO2+e2yzTYcqkykWpH+2uRjxzGPFOhp9@lists.infradead.org
X-Gm-Message-State: AOJu0YzNuDSIcG0CQ/bW4uzx+iwd3y5fRgEwNOd8X7GLqrrru6/8b9lm
	h9WY8ouVyooz4c0oDtvvTT6uMangyW8M8S8ulJYLH9OyXRocs1p1OexapG1Cnuj5g3M2rcYe5hf
	TLAXlB6huPjlAcSYHKm6TT9j1nRv1h04=
X-Received: by 2002:a17:906:6a0c:b0:b8e:3d49:25db with SMTP id
 a640c23a62f3a-b942e00db25mr648759166b.54.1773063000939; Mon, 09 Mar 2026
 06:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260309041659.18815-1-fengchengwen@huawei.com> <20260309041659.18815-2-fengchengwen@huawei.com>
In-Reply-To: <20260309041659.18815-2-fengchengwen@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 9 Mar 2026 21:29:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Cy1OuReaoGotZvdvHWLic_ECESFVZgbvNpk2HVjPjuw@mail.gmail.com>
X-Gm-Features: AaiRm53999Ro86GVlT52rErQab9_tcwK7Kxxf4dLpRSgjEOSn5mzv7jn4vq_ISk
Message-ID: <CAAhV-H7Cy1OuReaoGotZvdvHWLic_ECESFVZgbvNpk2HVjPjuw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-acpi@vger.kernel.org, wei.huang2@amd.com, Eric.VanTassell@amd.com, 
	jonathan.cameron@huawei.com, wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, 
	liuyonglong@huawei.com, stable@vger.kernel.org, jeremy.linton@arm.com, 
	sunilvl@oss.qualcomm.com, chenhuacai@loongson.cn, wangliupu@loongson.cn, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Chengwen,

On Mon, Mar 9, 2026 at 12:17=E2=80=AFPM Chengwen Feng <fengchengwen@huawei.=
com> wrote:
>
> To unify the CPU ACPI ID retrieval interface across architectures,
> rename the existing get_acpi_id_for_cpu() function to
> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
Can we also rename cpu_acpi_id() to acpi_get_cpu_acpi_id() for x86?

Huacai

>
> This is a pure rename with no functional change, preparing for a
> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
> platforms.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> ---
>  arch/arm64/include/asm/acpi.h      |  4 ++--
>  arch/loongarch/include/asm/acpi.h  |  2 +-
>  arch/riscv/include/asm/acpi.h      |  2 +-
>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>  drivers/acpi/pptt.c                | 16 ++++++++--------
>  drivers/acpi/riscv/rhct.c          |  2 +-
>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>  7 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.=
h
> index c07a58b96329..202107aeb05b 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -114,7 +114,7 @@ static inline bool acpi_has_cpu_in_madt(void)
>  }
>
>  struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> +static inline u32 acpi_get_cpu_acpi_id(unsigned int cpu)
>  {
>         return  acpi_cpu_get_madt_gicc(cpu)->uid;
>  }
> @@ -125,7 +125,7 @@ static inline int get_cpu_for_acpi_id(u32 uid)
>
>         for (cpu =3D 0; cpu < nr_cpu_ids; cpu++)
>                 if (acpi_cpu_get_madt_gicc(cpu) &&
> -                   uid =3D=3D get_acpi_id_for_cpu(cpu))
> +                   uid =3D=3D acpi_get_cpu_acpi_id(cpu))
>                         return cpu;
>
>         return -EINVAL;
> diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/a=
sm/acpi.h
> index 7376840fa9f7..89c6c8f52cc3 100644
> --- a/arch/loongarch/include/asm/acpi.h
> +++ b/arch/loongarch/include/asm/acpi.h
> @@ -40,7 +40,7 @@ extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE=
_PIC];
>
>  extern int __init parse_acpi_topology(void);
>
> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> +static inline u32 acpi_get_cpu_acpi_id(unsigned int cpu)
>  {
>         return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
>  }
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.=
h
> index 6e13695120bc..1d23681b61b5 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -61,7 +61,7 @@ static inline void arch_fix_phys_package_id(int num, u3=
2 slot) { }
>
>  void acpi_init_rintc_map(void);
>  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> -static inline u32 get_acpi_id_for_cpu(int cpu)
> +static inline u32 acpi_get_cpu_acpi_id(int cpu)
>  {
>         return acpi_cpu_get_madt_rintc(cpu)->uid;
>  }
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.=
c
> index 130769e3a99c..c2eb4824d0f7 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -40,7 +40,7 @@ static inline int get_cpu_for_acpi_id(u32 uid)
>         int cpu;
>
>         for (cpu =3D 0; cpu < nr_cpu_ids; cpu++)
> -               if (uid =3D=3D get_acpi_id_for_cpu(cpu))
> +               if (uid =3D=3D acpi_get_cpu_acpi_id(cpu))
>                         return cpu;
>
>         return -EINVAL;
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index de5f8c018333..c1a8fba4c2b2 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -459,7 +459,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_he=
ader *table,
>  {
>         struct acpi_pptt_cache *found_cache;
>         struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
> -       u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>         struct cacheinfo *this_leaf;
>         unsigned int index =3D 0;
>         struct acpi_pptt_processor *cpu_node =3D NULL;
> @@ -546,7 +546,7 @@ static int topology_get_acpi_cpu_tag(struct acpi_tabl=
e_header *table,
>                                      unsigned int cpu, int level, int fla=
g)
>  {
>         struct acpi_pptt_processor *cpu_node;
> -       u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>
>         cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id);
>         if (cpu_node) {
> @@ -622,7 +622,7 @@ static int find_acpi_cpu_topology_tag(unsigned int cp=
u, int level, int flag)
>  static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>  {
>         struct acpi_table_header *table;
> -       u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>         struct acpi_pptt_processor *cpu_node =3D NULL;
>         int ret =3D -ENOENT;
>
> @@ -671,7 +671,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned in=
t *levels,
>
>         pr_debug("Cache Setup: find cache levels for CPU=3D%d\n", cpu);
>
> -       acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>         cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id);
>         if (!cpu_node)
>                 return -ENOENT;
> @@ -797,7 +797,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
>         if (!table)
>                 return -ENOENT;
>
> -       acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>         cpu_node =3D acpi_find_processor_node(table, acpi_cpu_id);
>         if (!cpu_node || !cpu_node->parent)
>                 return -ENOENT;
> @@ -872,7 +872,7 @@ static void acpi_pptt_get_child_cpus(struct acpi_tabl=
e_header *table_hdr,
>         cpumask_clear(cpus);
>
>         for_each_possible_cpu(cpu) {
> -               acpi_id =3D get_acpi_id_for_cpu(cpu);
> +               acpi_id =3D acpi_get_cpu_acpi_id(cpu);
>                 cpu_node =3D acpi_find_processor_node(table_hdr, acpi_id)=
;
>
>                 while (cpu_node) {
> @@ -966,7 +966,7 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>         for_each_possible_cpu(cpu) {
>                 bool empty;
>                 int level =3D 1;
> -               u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +               u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>                 struct acpi_pptt_cache *cache;
>                 struct acpi_pptt_processor *cpu_node;
>
> @@ -1030,7 +1030,7 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_i=
d, cpumask_t *cpus)
>         for_each_possible_cpu(cpu) {
>                 bool empty;
>                 int level =3D 1;
> -               u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +               u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>                 struct acpi_pptt_cache *cache;
>                 struct acpi_pptt_processor *cpu_node;
>
> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> index caa2c16e1697..c15ce8c13136 100644
> --- a/drivers/acpi/riscv/rhct.c
> +++ b/drivers/acpi/riscv/rhct.c
> @@ -44,7 +44,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,=
 unsigned int cpu, const
>         struct acpi_rhct_isa_string *isa_node;
>         struct acpi_table_rhct *rhct;
>         u32 *hart_info_node_offset;
> -       u32 acpi_cpu_id =3D get_acpi_id_for_cpu(cpu);
> +       u32 acpi_cpu_id =3D acpi_get_cpu_acpi_id(cpu);
>
>         BUG_ON(acpi_disabled);
>
> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/=
arm_cspmu.c
> index 34430b68f602..506b661c60fd 100644
> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> @@ -1115,7 +1115,7 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu=
 *cspmu)
>         if (affinity_flag =3D=3D ACPI_APMT_FLAGS_AFFINITY_PROC) {
>                 for_each_possible_cpu(cpu) {
>                         if (apmt_node->proc_affinity =3D=3D
> -                           get_acpi_id_for_cpu(cpu)) {
> +                           acpi_get_cpu_acpi_id(cpu)) {
>                                 cpumask_set_cpu(cpu, &cspmu->associated_c=
pus);
>                                 break;
>                         }
> --
> 2.17.1
>


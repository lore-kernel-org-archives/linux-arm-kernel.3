Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94078EEF31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptsXsrwpjPBC6+0C67kO0fMIbirFyi/qX12OIkLgHqk=; b=i1g1O5xaiBafcSLWUOFbll+Yz9
	4mXFmjK0xjAYCOt47NNuDzU5ZBS6DsWyNMkTIjQLJCqvFuL92yYUYhDeNURJC2RgT5WmC1u9q3ec7
	q+u3ei2nuRm9k7RPmqderdw99hK9GiTJEg4SFSpcGv9Kuvov2HICKT8rpnFfqwskQdOU47Fc46qRp
	Mcle33gnmaUgfI6ugWvbjIphDmNpl/GWmhRJ+WM5FRtIdHNm6D/G3EtB36/hutpY3rODiuEOgQgfc
	eRkJjsLwJAhidqOaj6O8lGYH0IRpsM/G6qz2NDZkyoBrWYg4NfcxIyX7nkzq7ioFTOCj6AhhPMXPE
	1WaS5rHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4SO-00000001Flt-3O5d;
	Thu, 05 Mar 2026 08:53:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4SL-00000001Fkc-3SvQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0C8A44728
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 08:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3308C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772700796;
	bh=lmLJav9SueX4fK6pxy1Dw2a7ykTqhKyyY2pLtA+wBdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YkeTrWCRVLa7ix2RFYXj14crYJE4Hvg5YXkZWR8rOp0mm6k9J/gdG0qaoNlGyOYxO
	 uUtgXEcN9msZDbC/ZkLxKm4j9PUKunGrbg+q6/WRWyAvB3xHk/ge6k0FkeAtRdTDJr
	 bdfbRBwWA7/ADYMr5uR3pPDAq9PQ5mui7Evy8xmR/EmXF7fCXgwqBfyoj9wK3Jtkku
	 qKAjiP2pKEcWovoLCG0ST1x6eciU3wsp2uwSaGCCyBAS1bROUWjiNJf4y9MRclQvGO
	 f7Vy3CWOGpUURdjBpQxvJxfro/Me4HafCtmpGNdvbRKlQvAOkXFvma8le2Nb24EWA2
	 1UU8yZCMGEvGA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66151557d0cso302185a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:53:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6p5dW5Xkp4XynC87ZMwSqQAKQhf4gJ+qwvS2IcRRqZPXZQPUWxFHemvt+NkoVkYGMuNY2FgYUFb9A8RPV+WRN@lists.infradead.org
X-Gm-Message-State: AOJu0YzO566YFVLgBdclXsnBMyun+3OCXyZRz499l4FCcKhDjtEvR6aw
	AHpUnfV2owTXdUg3bd5d/s0ecMU/IXyqKHlW9es2Coavh8rrtCKNQoep/rYS+tlA2BV0EjUbzT7
	FHK+Hmyw1gXpwyf2j93rvYHzgzTKrKuQ=
X-Received: by 2002:a05:6402:358d:b0:65f:bad8:9c6 with SMTP id
 4fb4d7f45d1cf-660efcb74femr2969453a12.12.1772700794653; Thu, 05 Mar 2026
 00:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20260303003625.39035-1-fengchengwen@huawei.com> <20260305083650.54611-1-fengchengwen@huawei.com>
In-Reply-To: <20260305083650.54611-1-fengchengwen@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Mar 2026 16:53:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
X-Gm-Features: AaiRm52KNe1sCTgdvwoUawx92IFVO7ock76aGC0FmUYpz_759-88tc4Qm9b9dQw
Message-ID: <CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Gospodarek <andrew.gospodarek@broadcom.com>, Eric Van Tassell <Eric.VanTassell@amd.com>, 
	Ajit Khaparde <ajit.khaparde@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, 
	linux-acpi@vger.kernel.org, wei.huang2@amd.com, jonathan.cameron@huawei.com, 
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, liuyonglong@huawei.com, 
	stable@vger.kernel.org, jeremy.linton@arm.com, sunilvl@ventanamicro.com, 
	sunilvl@oss.qualcomm.com, chenhuacai@loongson.cn, wangliupu@loongson.cn, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005317_897025_A2CC0EDA 
X-CRM114-Status: GOOD (  41.77  )
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

On Thu, Mar 5, 2026 at 4:37=E2=80=AFPM Chengwen Feng <fengchengwen@huawei.c=
om> wrote:
>
> Currently the pcie_tph_get_cpu_st() has an issue on ARM64 platform:
> 1. The pcie_tph_get_cpu_st() function directly uses cpu_uid as the input
>    parameter to call the PCI ACPI DSM method. According to the DSM
>    definition, the input value should be the ACPI Processor UID (see [1]
>    for details).
> 2. In the Broadcom driver implementation [2] (which invokes
>    pcie_tph_get_cpu_st()), cpu_uid is obtained via
>    cpumask_first(irq->cpu_mask) - this is the logical CPU ID of a CPU
>    core, generated and managed by kernel (e.g., [0,255] for a system
>    with 256 logical CPU cores).
> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>    MADT table, and this UID may not match the kernel's logical CPU ID.
>    As a result, the current implementation fails to retrieve the correct
>    CPU steer-tag in such cases.
> 4. The function works on AMD x86 platforms only because the logical CPU
>    ID is identical to the ACPI Processor UID on those systems.
>
> This commit fixes it by:
> 1. Introducing acpi_get_cpu_acpi_id() in all ACPI-enabled platforms.
>    This new API calls get_acpi_id_for_cpu() to retrieve the ACPI
>    Processor UID on arm64/riscv/loongarch arch, and it calls
>    cpu_acpi_id() on x86 arch.
> 2. Renaming pcie_tph_get_cpu_st()'s input parameter cpu_uid to cpu for
>    clarity, as the parameter now represents a logical CPU ID (not a
>    UID).
>
> [1] According to ECN_TPH-ST_Revision_20200924
>     (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
>     is defined as: "If the target is a processor, then this field
>     represents the ACPI Processor UID of the processor as specified in
>     the MADT. If the target is a processor container, then this field
>     represents the ACPI Processor UID of the processor container as
>     specified in the PPTT."
> [2] commit c214410c47d6e ("bnxt_en: Add TPH support in BNXT driver")
>
> Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>
> ---
> Changes in v2:
> - Add ECN _DSM reference doc name and its URL.
> - Separate implement acpi_get_cpu_acpi_id() in each arch which supports
>   ACPI.
> - Refine commit-log.
>
> ---
>  Documentation/PCI/tph.rst    |  4 ++--
>  arch/arm64/kernel/acpi.c     |  9 +++++++++
>  arch/loongarch/kernel/acpi.c |  9 +++++++++
>  arch/riscv/kernel/acpi.c     | 10 ++++++++++
>  arch/x86/kernel/cpu/common.c | 17 +++++++++++++++++
>  drivers/pci/tph.c            | 17 ++++++++++++-----
>  include/linux/acpi.h         | 10 ++++++++++
>  include/linux/pci-tph.h      |  4 ++--
>  8 files changed, 71 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/PCI/tph.rst b/Documentation/PCI/tph.rst
> index e8993be64fd6..b6cf22b9bd90 100644
> --- a/Documentation/PCI/tph.rst
> +++ b/Documentation/PCI/tph.rst
> @@ -79,10 +79,10 @@ To retrieve a Steering Tag for a target memory associ=
ated with a specific
>  CPU, use the following function::
>
>    int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type type,
> -                          unsigned int cpu_uid, u16 *tag);
> +                          unsigned int cpu, u16 *tag);
>
>  The `type` argument is used to specify the memory type, either volatile
> -or persistent, of the target memory. The `cpu_uid` argument specifies th=
e
> +or persistent, of the target memory. The `cpu` argument specifies the
>  CPU where the memory is associated to.
>
>  After the ST value is retrieved, the device driver can use the following
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..e7d4d9bd3036 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -29,6 +29,7 @@
>  #include <linux/suspend.h>
>  #include <linux/pgtable.h>
>
> +#include <acpi/acpi.h>
>  #include <acpi/ghes.h>
>  #include <acpi/processor.h>
>  #include <asm/cputype.h>
> @@ -458,3 +459,11 @@ int acpi_unmap_cpu(int cpu)
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_acpi_id(unsigned int cpu)
> +{
> +       if (cpu >=3D nr_cpu_ids || !cpu_possible(cpu))
> +               return -EINVAL;
> +       return get_acpi_id_for_cpu(cpu);
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_acpi_id);
> diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
> index 1367ca759468..db28747a18e8 100644
> --- a/arch/loongarch/kernel/acpi.c
> +++ b/arch/loongarch/kernel/acpi.c
> @@ -16,6 +16,7 @@
>  #include <linux/memblock.h>
>  #include <linux/of_fdt.h>
>  #include <linux/serial_core.h>
> +#include <asm/acpi.h>
>  #include <asm/io.h>
>  #include <asm/numa.h>
>  #include <asm/loongson.h>
> @@ -385,3 +386,11 @@ int acpi_unmap_cpu(int cpu)
>  EXPORT_SYMBOL(acpi_unmap_cpu);
>
>  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_acpi_id(unsigned int cpu)
> +{
> +       if (cpu >=3D nr_cpu_ids || !cpu_possible(cpu))
> +               return -EINVAL;
> +       return get_acpi_id_for_cpu(cpu);
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_acpi_id);
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 71698ee11621..287c25e79347 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -22,6 +22,8 @@
>  #include <linux/pci.h>
>  #include <linux/serial_core.h>
>
> +#include <asm/acpi.h>
> +
>  int acpi_noirq =3D 1;            /* skip ACPI IRQ initialization */
>  int acpi_disabled =3D 1;
>  EXPORT_SYMBOL(acpi_disabled);
> @@ -337,3 +339,11 @@ int raw_pci_write(unsigned int domain, unsigned int =
bus,
>  }
>
>  #endif /* CONFIG_PCI */
> +
> +int acpi_get_cpu_acpi_id(unsigned int cpu)
> +{
> +       if (cpu >=3D nr_cpu_ids || !cpu_possible(cpu))
> +               return -EINVAL;
> +       return get_acpi_id_for_cpu(cpu);
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_acpi_id);
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 1c3261cae40c..9b06c76d5c0c 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -28,6 +28,7 @@
>  #include <linux/stackprotector.h>
>  #include <linux/utsname.h>
>  #include <linux/efi.h>
> +#include <linux/acpi.h>
>
>  #include <asm/alternative.h>
>  #include <asm/cmdline.h>
> @@ -57,6 +58,7 @@
>  #include <asm/asm.h>
>  #include <asm/bugs.h>
>  #include <asm/cpu.h>
> +#include <asm/smp.h>
>  #include <asm/mce.h>
>  #include <asm/msr.h>
>  #include <asm/cacheinfo.h>
> @@ -2643,3 +2645,18 @@ void __init arch_cpu_finalize_init(void)
>          */
>         mem_encrypt_init();
>  }
> +
> +int acpi_get_cpu_acpi_id(unsigned int cpu)
> +{
> +       u32 acpi_id;
> +
> +       if (cpu >=3D nr_cpu_ids || !cpu_possible(cpu))
> +               return -EINVAL;
> +
> +       acpi_id =3D cpu_acpi_id(cpu);
> +       if (acpi_id =3D=3D CPU_ACPIID_INVALID)
> +               return -ENODEV;
> +
> +       return (int)acpi_id;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_acpi_id);
> diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
> index ca4f97be7538..3cd38972fcb1 100644
> --- a/drivers/pci/tph.c
> +++ b/drivers/pci/tph.c
> @@ -236,21 +236,28 @@ static int write_tag_to_st_table(struct pci_dev *pd=
ev, int index, u16 tag)
>   * with a specific CPU
>   * @pdev: PCI device
>   * @mem_type: target memory type (volatile or persistent RAM)
> - * @cpu_uid: associated CPU id
> + * @cpu: associated CPU id
>   * @tag: Steering Tag to be returned
>   *
>   * Return the Steering Tag for a target memory that is associated with a
> - * specific CPU as indicated by cpu_uid.
> + * specific CPU as indicated by cpu.
>   *
>   * Return: 0 if success, otherwise negative value (-errno)
>   */
>  int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type=
,
> -                       unsigned int cpu_uid, u16 *tag)
> +                       unsigned int cpu, u16 *tag)
>  {
>  #ifdef CONFIG_ACPI
> +       unsigned int cpu_uid;
>         struct pci_dev *rp;
>         acpi_handle rp_acpi_handle;
>         union st_info info;
> +       int ret;
> +
> +       ret =3D acpi_get_cpu_acpi_id(cpu);
Can we use get_acpi_id_for_cpu() directly? Then just x86 needs a wrapper.

Huacai

> +       if (ret < 0)
> +               return ret;
> +       cpu_uid =3D (unsigned int)ret;
>
>         rp =3D pcie_find_root_port(pdev);
>         if (!rp || !rp->bus || !rp->bus->bridge)
> @@ -265,9 +272,9 @@ int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tp=
h_mem_type mem_type,
>
>         *tag =3D tph_extract_tag(mem_type, pdev->tph_req_type, &info);
>
> -       pci_dbg(pdev, "get steering tag: mem_type=3D%s, cpu_uid=3D%d, tag=
=3D%#04x\n",
> +       pci_dbg(pdev, "get steering tag: mem_type=3D%s, cpu=3D%d, tag=3D%=
#04x\n",
>                 (mem_type =3D=3D TPH_MEM_TYPE_VM) ? "volatile" : "persist=
ent",
> -               cpu_uid, *tag);
> +               cpu, *tag);
>
>         return 0;
>  #else
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4d2f0bed7a06..426fb4dca333 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -324,6 +324,16 @@ int acpi_unmap_cpu(int cpu);
>
>  acpi_handle acpi_get_processor_handle(int cpu);
>
> +/*
> + * acpi_get_cpu_acpi_id() - Get ACPI Processor UID of a specified CPU fr=
om MADT table
> + * @cpu: Logical CPU number (0-based)
> + *
> + * Return: ACPI Processor ID of the CPU on success (non-negative);
> + *         -EINVAL if the CPU number is invalid or not possible;
> + *         -ENODEV if the ACPI ID of the CPU is invalid.
> + */
> +int acpi_get_cpu_acpi_id(unsigned int cpu);
> +
>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
>  int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr)=
;
>  #endif
> diff --git a/include/linux/pci-tph.h b/include/linux/pci-tph.h
> index ba28140ce670..be68cd17f2f8 100644
> --- a/include/linux/pci-tph.h
> +++ b/include/linux/pci-tph.h
> @@ -25,7 +25,7 @@ int pcie_tph_set_st_entry(struct pci_dev *pdev,
>                           unsigned int index, u16 tag);
>  int pcie_tph_get_cpu_st(struct pci_dev *dev,
>                         enum tph_mem_type mem_type,
> -                       unsigned int cpu_uid, u16 *tag);
> +                       unsigned int cpu, u16 *tag);
>  void pcie_disable_tph(struct pci_dev *pdev);
>  int pcie_enable_tph(struct pci_dev *pdev, int mode);
>  u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
> @@ -36,7 +36,7 @@ static inline int pcie_tph_set_st_entry(struct pci_dev =
*pdev,
>  { return -EINVAL; }
>  static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
>                                       enum tph_mem_type mem_type,
> -                                     unsigned int cpu_uid, u16 *tag)
> +                                     unsigned int cpu, u16 *tag)
>  { return -EINVAL; }
>  static inline void pcie_disable_tph(struct pci_dev *pdev) { }
>  static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
> --
> 2.17.1
>


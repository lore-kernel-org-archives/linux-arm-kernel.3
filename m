Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B87CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWjXlNDUIQbW3InLxRs4BIp0lkRYcWnfLe+WyK++yPQ=; b=1gzIJHgHwmxmKdwIHpYI0YDLi2
	LF0QFY26746akJ5s+iK+79imSgJbvgA2oDRkCUV51FvMDBsRCkOMU2/ZG2SlYm0GAP2lvmA3qhh7F
	f5/eA/ThkXQKFBrQoI6AeLblJ/Nn/AEQVRehnJzDQq3XLACkz3Ail5YEpOmlZXYEHOnRwWSt3nhA0
	7eVS/+zyq5JlCZkGmNyye4Q1g+vNTtmjPXejWzenYHM6K9jYFQBHpoCE/HnFs7PnV96Dhfwr1+sPV
	QBCrQQSLEy7YiAPuKIoIoNtsqTnJILHsA7+YnrQWcQJ/Xovl+l/w+nCbz9ZHem6mDnXcnTi4+GqUc
	L/cMp31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKUN-0000000GPPd-0wzk;
	Wed, 27 Aug 2025 18:03:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIhF-0000000G8Gd-44pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D99760267
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A2EC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756310905;
	bh=sByO5WXVMLJSSxDN3MeLMu9UcOAS25+M3YCbGrOAQ5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MMC4TSSSu0gXxL4Xcm7X3P68mdlGtOVNaOUXqEkqauTCJaC69a+L0bQxVQbRgtXGq
	 SkT3Gv2cksFGq/iw94AvcaWLpUkzhvcRSO98cLdogA9MEk9XrrrxUAu6EvNUWbM1H8
	 O2VsF5b44CPXlCRl+ByGwtG74gLqzixxneUbLtsiUlzsE6vLd3T2touX3/CnRUuzfw
	 hIsqZB4PBosbJ2oU9rQr1s6rJrJBpSRO5crWqj6pSKiCh2C3FXMCrSMnm0odlb9hDF
	 RsvTboBtoaKObT9D3An99UG9ksxMKJX+z5swvRAFAwYI/unEmKwDJK9tN+ega/V47n
	 zwMnGXkDh6scw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso602552a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmZWToLNW1ae2zhKPDXssa39eDNmrwL7APzhpy/VLcqm6BKWPNNE3rTvnIZKhddkAco27mQ6HhqSqgkJ924gok@lists.infradead.org
X-Gm-Message-State: AOJu0YxLkU/fjMr72xh/2+LZN/6t8AxA13hJ5PP5yySlCGE6nvW70oDs
	zYYFzGhPmhN6HDSRNMUa8xotDsw1VwqzFPdyh8Bp9gk9MRiYsSDJT0gvrBRR73uXDtDGpEtzjr5
	NUAASdNXr1T3xOZAaspata44Ec85mOQ==
X-Google-Smtp-Source: AGHT+IFqv6Ng7UWtLQz1bQpYXPMLfkZ5AljMlpdSdbuChrj1GMfasDer/vKIdWdJCxDi5ORdTh7uVMDCQ1ElScMXa1s=
X-Received: by 2002:a05:6402:27cc:b0:61c:91c1:37e2 with SMTP id
 4fb4d7f45d1cf-61c91c13befmr5963193a12.16.1756310903622; Wed, 27 Aug 2025
 09:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250822153048.2287-1-james.morse@arm.com> <20250822153048.2287-15-james.morse@arm.com>
In-Reply-To: <20250822153048.2287-15-james.morse@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 27 Aug 2025 11:08:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK5HZdyq_6rQibtmDE_H=gy+3aeCSCioA5MHR5+Gh_drQ@mail.gmail.com>
X-Gm-Features: Ac12FXwmDxRL-eFGpQpbfwfUyBdCUvSfzx1ak3V0nyRWrqa9LPLYA6NMV2maEUo
Message-ID: <CAL_JsqK5HZdyq_6rQibtmDE_H=gy+3aeCSCioA5MHR5+Gh_drQ@mail.gmail.com>
Subject: Re: [PATCH 14/33] arm_mpam: Add cpuhp callbacks to probe MSC hardware
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
	shameerali.kolothum.thodi@huawei.com, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com, dfustini@baylibre.com, 
	amitsinght@marvell.com, David Hildenbrand <david@redhat.com>, 
	Rex Nie <rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, 
	Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com, 
	baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
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

On Fri, Aug 22, 2025 at 10:32=E2=80=AFAM James Morse <james.morse@arm.com> =
wrote:
>
> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
>
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed.
>
> Later once MPAM is enabled, this cpuhp callback will be replaced by
> one that avoids the global list.
>
> Enabling a static key will also take the cpuhp lock, so can't be done
> from the cpuhp callback. Whenever a new MSC has been probed schedule
> work to test if all the MSCs have now been probed.
>
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 144 +++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |   8 +-
>  2 files changed, 147 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 5baf2a8786fb..9d6516f98acf 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -4,6 +4,7 @@
>  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
>
>  #include <linux/acpi.h>
> +#include <linux/atomic.h>
>  #include <linux/arm_mpam.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
> @@ -21,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>
>  #include <acpi/pcc.h>
>
> @@ -39,6 +41,16 @@ struct srcu_struct mpam_srcu;
>  /* MPAM isn't available until all the MSC have been probed. */
>  static u32 mpam_num_msc;
>
> +static int mpam_cpuhp_state;
> +static DEFINE_MUTEX(mpam_cpuhp_state_lock);
> +
> +/*
> + * mpam is enabled once all devices have been probed from CPU online cal=
lbacks,
> + * scheduled via this work_struct. If access to an MSC depends on a CPU =
that
> + * was not brought online at boot, this can happen surprisingly late.
> + */
> +static DECLARE_WORK(mpam_enable_work, &mpam_enable);
> +
>  /*
>   * An MSC is a physical container for controls and monitors, each identi=
fied by
>   * their RIS index. These share a base-address, interrupts and some MMIO
> @@ -78,6 +90,22 @@ LIST_HEAD(mpam_classes);
>  /* List of all objects that can be free()d after synchronise_srcu() */
>  static LLIST_HEAD(mpam_garbage);
>
> +static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
> +{
> +       WARN_ON_ONCE(reg > msc->mapped_hwpage_sz);
> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessib=
ility));

These either make __mpam_read_reg uninlined or add 2 checks to every
register read. Neither seems very good.

> +
> +       return readl_relaxed(msc->mapped_hwpage + reg);
> +}
> +
> +static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
> +{
> +       lockdep_assert_held_once(&msc->part_sel_lock);

Similar thing here.

> +       return __mpam_read_reg(msc, reg);
> +}
> +
> +#define mpam_read_partsel_reg(msc, reg)        _mpam_read_partsel_reg(ms=
c, MPAMF_##reg)
> +
>  #define init_garbage(x)        init_llist_node(&(x)->garbage.llist)
>
>  static struct mpam_vmsc *
> @@ -511,9 +539,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx=
,
>         return err;
>  }
>
> -static void mpam_discovery_complete(void)

It is annoying to review things which disappear in later patches...


> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
> +{
> +       u64 idr;
> +       int err;
> +
> +       lockdep_assert_held(&msc->probe_lock);
> +
> +       mutex_lock(&msc->part_sel_lock);
> +       idr =3D mpam_read_partsel_reg(msc, AIDR);

I don't think AIDR access depends on PART_SEL.

> +       if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) !=3D MPAM_ARCHITECTURE_V1) =
{
> +               pr_err_once("%s does not match MPAM architecture v1.x\n",
> +                           dev_name(&msc->pdev->dev));
> +               err =3D -EIO;
> +       } else {
> +               msc->probed =3D true;
> +               err =3D 0;
> +       }
> +       mutex_unlock(&msc->part_sel_lock);
> +
> +       return err;
> +}
> +
> +static int mpam_cpu_online(unsigned int cpu)
>  {
> -       pr_err("Discovered all MSC\n");
> +       return 0;
> +}
> +
> +/* Before mpam is enabled, try to probe new MSC */
> +static int mpam_discovery_cpu_online(unsigned int cpu)
> +{
> +       int err =3D 0;
> +       struct mpam_msc *msc;
> +       bool new_device_probed =3D false;
> +
> +       mutex_lock(&mpam_list_lock);
> +       list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
> +               if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +                       continue;
> +
> +               mutex_lock(&msc->probe_lock);
> +               if (!msc->probed)
> +                       err =3D mpam_msc_hw_probe(msc);
> +               mutex_unlock(&msc->probe_lock);
> +
> +               if (!err)
> +                       new_device_probed =3D true;
> +               else
> +                       break; // mpam_broken
> +       }
> +       mutex_unlock(&mpam_list_lock);
> +
> +       if (new_device_probed && !err)
> +               schedule_work(&mpam_enable_work);
> +
> +       return err;
> +}
> +
> +static int mpam_cpu_offline(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int onl=
ine),
> +                                         int (*offline)(unsigned int off=
line))
> +{
> +       mutex_lock(&mpam_cpuhp_state_lock);
> +       if (mpam_cpuhp_state) {
> +               cpuhp_remove_state(mpam_cpuhp_state);
> +               mpam_cpuhp_state =3D 0;
> +       }
> +
> +       mpam_cpuhp_state =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mpam=
:online",
> +                                            online, offline);
> +       if (mpam_cpuhp_state <=3D 0) {
> +               pr_err("Failed to register cpuhp callbacks");
> +               mpam_cpuhp_state =3D 0;
> +       }
> +       mutex_unlock(&mpam_cpuhp_state_lock);
>  }
>
>  static int mpam_dt_count_msc(void)
> @@ -772,7 +875,7 @@ static int mpam_msc_drv_probe(struct platform_device =
*pdev)
>         }
>
>         if (!err && fw_num_msc =3D=3D mpam_num_msc)
> -               mpam_discovery_complete();
> +               mpam_register_cpuhp_callbacks(&mpam_discovery_cpu_online,=
 NULL);
>
>         if (err && msc)
>                 mpam_msc_drv_remove(pdev);
> @@ -795,6 +898,41 @@ static struct platform_driver mpam_msc_driver =3D {
>         .remove =3D mpam_msc_drv_remove,
>  };
>
> +static void mpam_enable_once(void)
> +{
> +       mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
> +
> +       pr_info("MPAM enabled\n");
> +}
> +
> +/*
> + * Enable mpam once all devices have been probed.
> + * Scheduled by mpam_discovery_cpu_online() once all devices have been c=
reated.
> + * Also scheduled when new devices are probed when new CPUs come online.
> + */
> +void mpam_enable(struct work_struct *work)
> +{
> +       static atomic_t once;
> +       struct mpam_msc *msc;
> +       bool all_devices_probed =3D true;
> +
> +       /* Have we probed all the hw devices? */
> +       mutex_lock(&mpam_list_lock);
> +       list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
> +               mutex_lock(&msc->probe_lock);
> +               if (!msc->probed)
> +                       all_devices_probed =3D false;
> +               mutex_unlock(&msc->probe_lock);
> +
> +               if (!all_devices_probed)
> +                       break;
> +       }
> +       mutex_unlock(&mpam_list_lock);
> +
> +       if (all_devices_probed && !atomic_fetch_inc(&once))
> +               mpam_enable_once();
> +}
> +
>  /*
>   * MSC that are hidden under caches are not created as platform devices
>   * as there is no cache driver. Caches are also special-cased in
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_inter=
nal.h
> index 6e0982a1a9ac..a98cca08a2ef 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -49,6 +49,7 @@ struct mpam_msc {
>          * properties become read-only and the lists are protected by SRC=
U.
>          */
>         struct mutex            probe_lock;
> +       bool                    probed;
>         unsigned long           ris_idxs[128 / BITS_PER_LONG];
>         u32                     ris_max;
>
> @@ -59,14 +60,14 @@ struct mpam_msc {
>          * part_sel_lock protects access to the MSC hardware registers th=
at are
>          * affected by MPAMCFG_PART_SEL. (including the ID registers that=
 vary
>          * by RIS).
> -        * If needed, take msc->lock first.
> +        * If needed, take msc->probe_lock first.

Humm. I think this belongs in patch 10.

>          */
>         struct mutex            part_sel_lock;
>
>         /*
>          * mon_sel_lock protects access to the MSC hardware registers tha=
t are
>          * affeted by MPAMCFG_MON_SEL.
> -        * If needed, take msc->lock first.
> +        * If needed, take msc->probe_lock first.
>          */
>         struct mutex            outer_mon_sel_lock;
>         raw_spinlock_t          inner_mon_sel_lock;
> @@ -147,6 +148,9 @@ struct mpam_msc_ris {
>  extern struct srcu_struct mpam_srcu;
>  extern struct list_head mpam_classes;
>
> +/* Scheduled work callback to enable mpam once all MSC have been probed =
*/
> +void mpam_enable(struct work_struct *work);
> +
>  int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_lev=
el,
>                                    cpumask_t *affinity);
>
> --
> 2.20.1
>


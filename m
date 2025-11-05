Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A678DCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACs9ehJB3oUkzpqGylHL7GURPnmGaEVz6xiN6ORjiWI=; b=G2199P3i1XOPZ5aYcg49kvMF1x
	15lsUzjKqvJ/dbn4lXD+2DSSzO72o1cymUXmLVj5oA6ULV3KiDcDPScnfNFtV7JoVHFzJUwuRkeR+
	mIeL0aGPH3uySkZVnw1w0HgxFqUeNhHe6I6q9nK3Gl8UAdVz0AJsHf2Ccx+Yn1SsIrWIFwfrZJMy+
	Af1+vCE9PKxpPk7nnUASIJJcl+1D6RPwin02SD+udeOyVfKIMZIVpcuXwAPU1lYI/TFxAez3qLTSq
	6iyLj+Ijz5RZd6SvilQQAIjB5TmxAenI4i41UkKvDAs+1xzFBmLQv2JRzpW/b5MMv/AqvLaVVWNut
	tI1RlJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgBc-0000000E2zq-3xaW;
	Wed, 05 Nov 2025 16:16:40 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgBa-0000000E2zG-3OiE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:16:40 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-940d25b807bso278310739f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762359398; x=1762964198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACs9ehJB3oUkzpqGylHL7GURPnmGaEVz6xiN6ORjiWI=;
        b=ajHRc0wVPkNuz5nqlBs2FxwUlId49klVujo8FNxyqWqB3WAZkGGDJx67Gn4oGUeP6W
         XW2PXAphOW0MmUtAf9PZRy7wey6G6rVlL/2bhO8U4is8tXnmv/H5Elqm3BOT8Lr/b9PD
         rUhhFEnqmXsSteNi8DCv8mOF7LyXFXsGGEROL3qHwepgn3bkYlrch/QLdMB/q3SrVa7V
         pqLBJEu/XDPAEs8XpTQcsCTkVJRFq0FpB+VnLjIb7zGHnhmEnrD8PJnDck+UwMhRkFnp
         CDr0vDw4seVRs8cGYlw/PGt0bs+01kd9r5lOlF6BAov2JFS7vRB0/JML3o5jKygcItdw
         CSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359398; x=1762964198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACs9ehJB3oUkzpqGylHL7GURPnmGaEVz6xiN6ORjiWI=;
        b=nVLYw7ZOJkEC0HGVFoYf49Q1DP995c7Bma5J5aQz0OKpN9Y1loFLunJpK5bXgx9vVK
         bA24zADvi7YIdgYycyNuqvaZtuwJZOFl+6DrSbYuRZpv6Hz/F8QPO/uc03iWLsZMunwb
         a6jA03/Hce52Ev4EmxODCRITt3hS7sU40wyUuORm3QRy5dIjW5XB6LoJVgnU2B1zDNQj
         HaY3c36w0g3PpQRxIZbfxjAb0Mbl7HOXe4WG63Yp0V7jXlRr6fPGdKrSx8S0umPQsMe7
         ZfthMmAkfhcM3pocL1wbfuKsGm/Y1HoTg2HD6GqAqiWkwj4yqSDuZgVwLiPkBHeh63/4
         OMMg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmmZR9SSua0RHgireefy2qyoimQX0D3WUDCgKHULvfMKMgZwsb07B/Ew725ETnsbHSJm8BmPb3cTS4vQpwao3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3C2Zquxpu8EBFfqE65B6DRWkfO6HVL7nGCt0XqKYjp96hXraR
	2VTKvqdNfdjb6EXLWyS+o1DtOIiCMI/nigWNQU0dIyLW296Ja1fyqAfc67+KNYBQhbD17xtGW6M
	ym/uFiEiCaY8kzmXf0Nkuch+F4D1gTxIwj18BCGyd
X-Gm-Gg: ASbGnctSkOijIN7yYH49JZexGZsHvKEPS0sw2Tfai/AWJhrgr2ncIy52+RMJjzb3jgl
	rVSkR3hZbBNt2VBegxF3c4tKQuiBqc6XaOZdgccmto1rJ7RZY2LYY5f/EuXxmINWc+Ly6zS759C
	W1dnnbEn7tbBC+ZyaoaJqcnytO8Ojr2jH9fSIu8cbJgF+cBAFWxC201pXQhIDlXlSA1TNn7NBuQ
	IMWBMu9GfDf6duI5pMruri9nZ8Q9VC6a3J7mym57gGulmkGz4s3+JOzBwGXIGDQrQDVGLDP615v
	7xl7APBeKvgx2ECEbYbZ6BfksQ==
X-Google-Smtp-Source: AGHT+IFrsuFMA1TSlPF6UPOqwRKI3S1TVMUqjqGwbsvSlZ623YeZIKO2ZUxGfz3c2g6/ooCxqi5U/+HTdvc4VcOqieE=
X-Received: by 2002:a05:6e02:1805:b0:430:b994:3bd1 with SMTP id
 e9e14a558f8ab-433407698c4mr55204705ab.1.1762359397327; Wed, 05 Nov 2025
 08:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20251017185645.26604-1-james.morse@arm.com> <20251017185645.26604-21-james.morse@arm.com>
 <OSZPR01MB8798162B444DA35707A4E3798BFCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB8798162B444DA35707A4E3798BFCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 5 Nov 2025 17:16:24 +0100
X-Gm-Features: AWmQ_bn_GHMcQLM6dMy9FTsbSXlRMr5a1a_4wB6ts3RgPX1XxSVdyRM8ndMU0uE
Message-ID: <CALPaoChLKRQqjZO+O92WQ=MsWjV+q=hVE8=BXCOdkta6ZEXNMQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/29] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: James Morse <james.morse@arm.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, 
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>, 
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>, 
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, "dfustini@baylibre.com" <dfustini@baylibre.com>, 
	"amitsinght@marvell.com" <amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, 
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>, 
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, 
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081638_863833_8C2F4753 
X-CRM114-Status: GOOD (  35.22  )
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

On Mon, Oct 27, 2025 at 9:48=E2=80=AFAM Shaopeng Tan (Fujitsu)
<tan.shaopeng@fujitsu.com> wrote:
>
> Hello James,
>
> > When CPUs come online the MSC's original configuration should be restor=
ed.
> >
> > Add struct mpam_config to hold the configuration. This has a bitmap of
> > features that were modified. Once the maximum partid is known, allocate=
 a
> > configuration array for each component, and reprogram each RIS configur=
ation
> > from this.
> >
> > CC: Dave Martin <Dave.Martin@arm.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> > Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> > Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> > ---
> > Changes since v2:
> >  * Call mpam_init_reset_cfg() on alloated config as 0 is not longer cor=
rect.
> >  * init_garbage() on each config - the array has to be freed in one go,=
 but
> >    otherwise this looks weird.
> >  * Use struct initialiser in mpam_init_reset_cfg(),
> >  * Moved int err definition.
> >  * Removed srcu lock taking based on squinting at the only caller.
> >  * Moved config reset to mpam_reset_component_cfg() for re-use in
> >    mpam_reset_component_locked(), previous memset() was not enough
> > since zero
> >    no longer means reset.
> >
> > Changes since v1:
> >  * Switched entry_rcu to srcu versions.
> >
> > Changes since RFC:
> >  * Added a comment about the ordering around max_partid.
> >  * Allocate configurations after interrupts are registered to reduce ch=
urn.
> >  * Added mpam_assert_partid_sizes_fixed();
> >  * Make reset use an all-ones instead of zero config.
> > ---
> >  drivers/resctrl/mpam_devices.c  | 284
> > +++++++++++++++++++++++++++++---
> > drivers/resctrl/mpam_internal.h |  23 +++
> >  2 files changed, 287 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devi=
ces.c
> > index ab37ed1fb5de..e990ef67df5b 100644
> > --- a/drivers/resctrl/mpam_devices.c
> > +++ b/drivers/resctrl/mpam_devices.c
> > @@ -118,6 +118,17 @@ static inline void init_garbage(struct mpam_garbag=
e
> > *garbage)  {
> >       init_llist_node(&garbage->llist);
> >  }
> > +
> > +/*
> > + * Once mpam is enabled, new requestors cannot further reduce the
> > +available
> > + * partid. Assert that the size is fixed, and new requestors will be
> > +turned
> > + * away.
> > + */
> > +static void mpam_assert_partid_sizes_fixed(void)
> > +{
> > +     WARN_ON_ONCE(!partid_max_published);
> > +}
> > +
> >  static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)  {
> >       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
> > &msc->accessibility)); @@ -366,12 +377,16 @@ static void
> > mpam_class_destroy(struct mpam_class *class)
> >       add_to_garbage(class);
> >  }
> >
> > +static void __destroy_component_cfg(struct mpam_component *comp);
> > +
> >  static void mpam_comp_destroy(struct mpam_component *comp)  {
> >       struct mpam_class *class =3D comp->class;
> >
> >       lockdep_assert_held(&mpam_list_lock);
> >
> > +     __destroy_component_cfg(comp);
> > +
> >       list_del_rcu(&comp->class_list);
> >       add_to_garbage(comp);
> >
> > @@ -812,48 +827,102 @@ static void mpam_reset_msc_bitmap(struct
> > mpam_msc *msc, u16 reg, u16 wd)
> >       __mpam_write_reg(msc, reg, bm);
> >  }
> >
> > -static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid=
)
> > +/* Called via IPI. Call while holding an SRCU reference */ static void
> > +mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
> > +                                   struct mpam_config *cfg)
> >  {
> >       struct mpam_msc *msc =3D ris->vmsc->msc;
> >       struct mpam_props *rprops =3D &ris->props;
> >
> > -     WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
> > -
> >       mutex_lock(&msc->part_sel_lock);
> >       __mpam_part_sel(ris->ris_idx, partid, msc);
> >
> > -     if (mpam_has_feature(mpam_feat_cpor_part, rprops))
> > -             mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM,
> > rprops->cpbm_wd);
> > +     if (mpam_has_feature(mpam_feat_cpor_part, rprops) &&
> > +         mpam_has_feature(mpam_feat_cpor_part, cfg)) {
> > +             if (cfg->reset_cpbm)
> > +                     mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM,
> > +                                           rprops->cpbm_wd);
> > +             else
> > +                     mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
> > +     }
> >
> > -     if (mpam_has_feature(mpam_feat_mbw_part, rprops))
> > -             mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM,
> > rprops->mbw_pbm_bits);
> > +     if (mpam_has_feature(mpam_feat_mbw_part, rprops) &&
> > +         mpam_has_feature(mpam_feat_mbw_part, cfg)) {
> > +             if (cfg->reset_mbw_pbm)
> > +                     mpam_reset_msc_bitmap(msc,
> > MPAMCFG_MBW_PBM,
> > +                                           rprops->mbw_pbm_bits);
> > +             else
> > +                     mpam_write_partsel_reg(msc, MBW_PBM,
> > cfg->mbw_pbm);
> > +     }
> >
> > -     if (mpam_has_feature(mpam_feat_mbw_min, rprops))
> > +     if (mpam_has_feature(mpam_feat_mbw_min, rprops) &&
> > +         mpam_has_feature(mpam_feat_mbw_min, cfg))
> >               mpam_write_partsel_reg(msc, MBW_MIN, 0);
> >
> > -     if (mpam_has_feature(mpam_feat_mbw_max, rprops))
> > -             mpam_write_partsel_reg(msc, MBW_MAX,
> > MPAMCFG_MBW_MAX_MAX);
> > +     if (mpam_has_feature(mpam_feat_mbw_max, rprops) &&
> > +         mpam_has_feature(mpam_feat_mbw_max, cfg))
> > +             mpam_write_partsel_reg(msc, MBW_MAX, cfg->mbw_max);
> >
> >       mutex_unlock(&msc->part_sel_lock);
> >  }
> >
> > +struct reprogram_ris {
> > +     struct mpam_msc_ris *ris;
> > +     struct mpam_config *cfg;
> > +};
> > +
> > +/* Call with MSC lock held */
> > +static int mpam_reprogram_ris(void *_arg) {
> > +     u16 partid, partid_max;
> > +     struct reprogram_ris *arg =3D _arg;
> > +     struct mpam_msc_ris *ris =3D arg->ris;
> > +     struct mpam_config *cfg =3D arg->cfg;
> > +
> > +     if (ris->in_reset_state)
> > +             return 0;
> > +
> > +     spin_lock(&partid_max_lock);
> > +     partid_max =3D mpam_partid_max;
> > +     spin_unlock(&partid_max_lock);
> > +     for (partid =3D 0; partid <=3D partid_max + 1; partid++)
> > +             mpam_reprogram_ris_partid(ris, partid, cfg);
> > +
> > +     return 0;
> > +}
> > +
> > +static void mpam_init_reset_cfg(struct mpam_config *reset_cfg) {
> > +     *reset_cfg =3D (struct mpam_config) {
> > +             .cpbm =3D ~0,
> > +             .mbw_pbm =3D ~0,
> > +             .mbw_max =3D MPAMCFG_MBW_MAX_MAX,
>
> When rdtgroup_schemata_show() is called, the "cpbm" value is output to th=
e schema file.
> Since bitmap lengths are chip-dependent, I think we just need to reset th=
e bitmap length portion.
> Otherwise, 0xffffffff(u32) will be output from the schemata file.

When I apply additional patches to add the mpam_resctrl.c stuff I
notice this too:

# grep L3 schemata
L3:1=3Dffffffff
# cat info/L3/shareable_bits
ffff

I noticed that new groups also get a too-long cbm as long as any other
groups have a too-long cbm. Maybe this out-of-range value is bleeding
into new groups in __init_one_rdt_domain() when it calls
resctrl_arch_get_config() on all other groups.

-Peter


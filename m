Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2FAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=; b=m7kZ5lIXtsdkBKWmpHSOKVclb/
	pU3ZCUGers5z7VDzW2yCPFfEGLQH0fuzKN3Rh5VcrzvWRsBMHN6Icw43czBfmPJgFU3aIL4CgP7/7
	Rou0KS3Vh5KvltHeGwF7rKrzOrOaaZ+yUeOlwVO5lCkQTS2MJCBzyd/mbneDDb7rZue6Xt0xcTMOB
	e1uuq29friCX/jVyvLYRR1vts9oeZyTtnkyvc2/SC+iNv/Tef/7zBTDCR3rmJUQ1lQ59WKLrg/WYy
	fXg0OtZCr7XKSFZEVRlvv4TfKJWWnRsZXJx2x6UClk1vws5A9GmDFE09w7I6f/q6xuGMVk6AR5THE
	0MRn/RhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQrs-0000000GIrs-2pTi;
	Mon, 24 Aug 2026 09:21:26 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQro-0000000GIqj-1mUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:21:23 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-52d7ef16f91so14335561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787563275; cv=none;
        d=google.com; s=arc-20260327;
        b=Qcw2t8hVIJcpMgA00oseqWFCM0CGg0VLOrt9GVwvX659wQATYL0LpG/ck6+iMaOEgb
         xJgPDnokRlXD6rIMLLjwu0e12sl9vO5tPWGDefhO4auzdaufTMphxX+M8CT9nVT4a3Of
         r1nSH2KfFtThPsv4luzFKK4KWzuv7ORqXkXDAFXNe5MXA2YWEoM3daA5vLvPmwh1jLm8
         hkuL2Hqdrpqx9HEySp0WwlfPm+y0SmEuBbUfw1zG9b7maFMq/bZtrIpQ6ndiGzw1nHgm
         NGPIYxYp13Yqr0RMwQrUCL5+z5k8DirciLaFkfVQYeM/XqorsVsTzPbwqJ4dJBZhBdfd
         3QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        fh=UUGerDpm4njrXd/q02VBkfLW53REc7Nz2+5vhvWyfLk=;
        b=avReceNqfmbFf8pp+BtX9sDW52IYZ8o51+LkymlJmF32hBp8e0jPqNBOtVT1VcOE4A
         8mvGGAltnRMtPHAtkoahVrGe4BtQ+u0Hn/aj2LQrPF311gT+8e8suLeEN4G1b33F0yGC
         AF9N4e78TkBdZ0qAR4EUgmPlUV36nfZ1qIydG2wv3oruULSR8yGMGVnz5d8o4PaYTFWF
         86XLrEsLVx3PdSiNemT24D0RcopQ3c+Sudu0kS6sKNIn62bWKj3+uPsR5tGi38bjPH25
         oV4LtAGG/o4ffZwve1PlCT1KNkjW3XXCmF3WLTw0G2cWS3pLjmvCmQ82WfIE7jyzEpFg
         7Bfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787563275; x=1788168075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        b=K0g/nr59Zdw9CtEwt8sxfZYzOKxK5Zk0aNQvu9g/69vp587RpjM0li/wPTU08E/Xgb
         RVV2EeIlz0sJDRlAZeCkZpL4XqQoYYz9Pkwa/qL9q3p2lvOUGAxG9tyA/RDZMSAd4ErE
         Kb6TIsSi+2+IxOjkWtG3Rqn/7EUd+SUGYILyzKR4JlYPCXBgu1Z5h+u7BlybA20lyZzZ
         zBitFRwPqCKRmrj32fjH4HHveKBiOf6v6EL2UW0UiaKG0bqwAsMqhp0eXlMv3LyagOq/
         ZpLYMoTJGxgLL6dngGgGGtufCHe1K+u6D+ys8J/1Qr3M8RCL4U0iwPuP924GvQwRiEUF
         ZHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563275; x=1788168075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        b=LVO7bzAlD8xcN7rTdS6WlJpFb5xofdMdBKcnqpGiypzR8/jZCFzgVcMzccCCoti1/Z
         eu+7KR923VcWG9MnaKuYnCyjgesYb9zemBjvrI6Ct6/v2ka9DzeW0loqWIKKgQCElT2F
         WEn0L0/guISZxIKahMcmPXI0K5lwK5lyCHSvZj3dz9TZZQm/ROnB4kCGbdFM4kG90aLf
         EK/z+GjpWYsWRKxwWOzQ2PsVJQ72f4ngY9p8JR5ng/gHmFze/b75QRNdP1dc1PpTRxOQ
         N/QqfiFPIpaAUpXm7wgYEyDr05bu/r3lm9VgU1H9byame3+QtWwnQXJK774GQ1twZPqm
         sA5A==
X-Forwarded-Encrypted: i=1; AHgh+RoaQO2ADclF9fz5x5ywOHk1+o0mVrvc14/HjqTLifwWKplD7IzNhaHjU0L0MXyBrbMCQxNg6o20jepSZlTv9HWH@lists.infradead.org
X-Gm-Message-State: AFuF++nKDDlCa86WncASQ6qnnw0BelvyMD/eFxQ7q4MkwLfj2hlv2QxT
	mx5zRSXO2Dh4r/LX/m34dF7JsRzEoOxjMvbttwE9tz/d6zXWfucFLRBBdatacgTFgl4LNPMVgpP
	QelDG3Zq9OvcS0bKMdK8Z6exM8QoN10c=
X-Gm-Gg: AR+sD12D2TMNZpZPr5gGVoTwbJuoyGBUEIhwzTGLmJUbsnJvU4dLJ88CnkVOrJy2rJQ
	4RrptPYNdQFx7HTICqssSdUbTOtINQKSaEketxdu7gdJB9OgGWuyw3aXB5wrBlZnhO3Aob7M7tA
	SIz0sGM2O9JPxIU6cVpBspdEc6R2P4eokRQrcBPvIV3xr4wanu2ZDEL0kAeeD9dChtzoFbbTqE7
	8KauwzXCkhmzud4J18fikHeZSieURTNe2NtZ2Maerwo20rbywpUI6N+KJYsaO9V3gJGta51dTuL
	z7sQWSKzCHt7IRVCUuNpgkxaWgZqKSeYtGdZ7nJTdTiQXAzywLAS/gD9pQ==
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id
 d75a77b69052e-52e09b9c641mr167385421cf.10.1787563275220; Mon, 24 Aug 2026
 02:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072830.10028-1-seanwang1@lenovo.com> <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com> <aoX_jiuhv3dyMS-g@arm.com>
In-Reply-To: <aoX_jiuhv3dyMS-g@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Mon, 24 Aug 2026 17:21:03 +0800
X-Gm-Features: AcwNN1WASJD0Uyy8E8St9ZJzbOmEzEbrEYrP-LIm_bk-HpFm5Pmi7KhDCWL_9SI
Message-ID: <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
To: Beata Michalska <beata.michalska@arm.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_022120_573486_D5980775 
X-CRM114-Status: GOOD (  51.22  )
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

On Thu, Aug 20, 2026 at 3:11=E2=80=AFAM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Wed, Aug 12, 2026 at 01:02:37PM +0200, Beata Michalska wrote:
> > On Wed, Aug 12, 2026 at 07:34:52AM +0000, Sean Wang1 wrote:
> > > On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:
> > >
> > > > > --- a/arch/arm64/kernel/topology.c
> > > > > +++ b/arch/arm64/kernel/topology.c
> > > > > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> > > > >
> > > > >         /* Kick in AMU update but only if one has not happened al=
ready */
> > > > >         if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > > > > -
> > > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, c=
pu)))
> > > > > +
> > > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, c=
pu))
> > > > &&
> > > > > +           topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,=
 cpu))
> > > > >                 amu_scale_freq_tick();
> > > > I'm not entirely convinced you gained a lot by that.
> > > > It's one additional check per each enter_idle for case where AMUs a=
re the
> > > > source vs 2 additional check when it is not.
> > > > Will try to figure out smth less 'invasive'.
> > > >
> > >
> > > First, I think that the rcu_read_lock_sched()/unlock() in
> > > topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
> > > is called from do_idle() after local_irq_disable() at
> > > kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
> > > requirement. This means we can call rcu_dereference_sched() directly
> > > without explicit RCU lock.
> > In this particular case RCU locking is not required, though you are exp=
osing
> > an API that might be used in other curcumstances, so the least we could=
 do is
> > document that.
> > >
> > > I have two options to propose:
> > >
> > > Option A: Keep the helper, but drop the explicit RCU lock
> > >
> > >     bool topology_is_scale_freq_source(enum scale_freq_source source,
> > >                                        unsigned int cpu)
> > >     {
> > >         struct scale_freq_data *sfd;
> > >         sfd =3D rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> > >         return sfd && sfd->source =3D=3D source;
> > >     }
> > >
> > > Option B: Drop the helper entirely, check directly in arch_cpu_idle_e=
nter()
> > > If a generic exported helper feels too invasive, we can do the
> > > check locally within arch_cpu_idle_enter() without touching
> > > drivers/base/arch_topology.c at all:
> > >
> > >     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > >         time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_upd=
ate, cpu))) {
> > >         struct scale_freq_data *sfd;
> > >         sfd =3D rcu_dereference_sched(*this_cpu_ptr(&sft_data));
> > >         if (sfd && sfd->source =3D=3D SCALE_FREQ_SOURCE_ARCH)
> > >             amu_scale_freq_tick();
> > >     }
> > >
> > > This keeps the change entirely in arm64 code and avoids adding
> > > a new exported symbol. Which approach would you prefer?
> > I do not mind this additional helper. Besides, not my place to either m=
ind it
> > or not.
> > What I do mind is doing the check in the arch idle enter path. I would =
rather
> > see some notification triggered when the source gets changed so that
> > the previous sfd code can do some state transition that would avoid us =
having
> > to run the check in the first place.
> > Still pondering on that one.
> > Preferably I would drop that 'tick' call from there completely, but app=
arently
> > this was needed on some platforms to make AMU readings more reliable.
>
> How about smth between the lines of:
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb1..aff33836488c8 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -250,6 +250,22 @@ int arch_freq_get_on_cpu(int cpu)
>         return freq;
>  }
>
> +static int amu_fie_source_notifier(struct notifier_block *nb,
> +                                  unsigned long event,
> +                                  void *data)
> +{
> +       const struct cpumask *cpus =3D data;
> +
> +       if (event =3D=3D SCALE_FREQ_SOURCE_ARCH)
> +               cpumask_andnot(amu_fie_cpus, amu_fie_cpus, cpus);

Should we distinguish between events?

> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block amu_fie_nb =3D {
> +       .notifier_call =3D amu_fie_source_notifier,
> +};
> +
>  static void amu_fie_setup(const struct cpumask *cpus)
>  {
>         int cpu;
> @@ -274,6 +290,8 @@ static void amu_fie_setup(const struct cpumask *cpus)
>
>         topology_set_scale_freq_source(&amu_sfd, cpus);
>
> +       if (cpumask_weight(cpus) =3D=3D cpumask_weight(amu_fie_cpus))
> +               topology_register_scale_freq_source_notifier(&amu_fie_nb)=
;
>         pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
>                  cpumask_pr_args(cpus));
>  }
> @@ -339,9 +357,9 @@ static int cpuhp_topology_online(unsigned int cpu)
>         }
>
>         cpumask_set_cpu(cpu, amu_fie_cpus);
> -
>         topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> -
> +       if (cpumask_weight(amu_fie_cpus) =3D=3D 1)
> +               topology_register_scale_freq_source_notifier(&amu_fie_nb)=
;
>         pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
>
>         return 0;
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a3..096430a99ee00 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -22,11 +22,14 @@
>  #include <linux/rcupdate.h>
>  #include <linux/sched.h>
>  #include <linux/units.h>
> +#include <linux/notifier.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/hw_pressure.h>
>
>  static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
> +static struct blocking_notifier_head scale_freq_source_change =3D
> +       BLOCKING_NOTIFIER_INIT(scale_freq_source_change);
>  static struct cpumask scale_freq_counters_mask;
>  static bool scale_freq_invariant;
>  DEFINE_PER_CPU(unsigned long, capacity_freq_ref) =3D 0;
> @@ -67,6 +70,18 @@ static void update_scale_freq_invariant(bool status)
>         }
>  }
>
> +int topology_register_scale_freq_source_notifier(struct notifier_block *=
nb)
> +{
> +       return blocking_notifier_chain_register(&scale_freq_source_change=
, nb);
> +}
> +EXPORT_SYMBOL_GPL(topology_register_scale_freq_source_notifier);
> +
> +int topology_unregister_scale_freq_source_notifier(struct notifier_block=
 *nb)
> +{
> +       return blocking_notifier_chain_unregister(&scale_freq_source_chan=
ge, nb);
> +}
> +EXPORT_SYMBOL_GPL(topology_unregister_scale_freq_source_notifier);
> +
>  void topology_set_scale_freq_source(struct scale_freq_data *data,
>                                     const struct cpumask *cpus)
>  {
> @@ -95,6 +110,7 @@ void topology_set_scale_freq_source(struct scale_freq_=
data *data,
>         rcu_read_unlock();
>
>         update_scale_freq_invariant(true);
> +
>  }
>  EXPORT_SYMBOL_GPL(topology_set_scale_freq_source);
>
> @@ -102,8 +118,11 @@ void topology_clear_scale_freq_source(enum scale_fre=
q_source source,
>                                       const struct cpumask *cpus)
>  {
>         struct scale_freq_data *sfd;
> +       cpumask_var_t cleared_mask __free(free_cpumask_var) =3D CPUMASK_V=
AR_NULL;
>         int cpu;
>
> +       zalloc_cpumask_var(&cleared_mask, GFP_KERNEL);
> +
>         rcu_read_lock();
>
>         for_each_cpu(cpu, cpus) {
> @@ -112,6 +131,8 @@ void topology_clear_scale_freq_source(enum scale_freq=
_source source,
>                 if (sfd && sfd->source =3D=3D source) {
>                         rcu_assign_pointer(per_cpu(sft_data, cpu), NULL);
>                         cpumask_clear_cpu(cpu, &scale_freq_counters_mask)=
;
> +                       if (cpumask_available(cleared_mask))
> +                               cpumask_set_cpu(cpu, cleared_mask);
>                 }
>         }
>
> @@ -124,6 +145,10 @@ void topology_clear_scale_freq_source(enum scale_fre=
q_source source,
>         synchronize_rcu();
>
>         update_scale_freq_invariant(false);
> +
> +       if (cpumask_available(cleared_mask))
> +               blocking_notifier_call_chain(&scale_freq_source_change, s=
ource,
> +                                            cleared_mask);
>  }
>  EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
>
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.=
h
> index ebd7f8935f969..4c31fd6dff0ef 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -48,6 +48,8 @@ struct scale_freq_data {
>  void topology_scale_freq_tick(void);
>  void topology_set_scale_freq_source(struct scale_freq_data *data, const =
struct cpumask *cpus);
>  void topology_clear_scale_freq_source(enum scale_freq_source source, con=
st struct cpumask *cpus);
> +int topology_register_scale_freq_source_notifier(struct notifier_block *=
nb);
> +int topology_unregister_scale_freq_source_notifier(struct notifier_block=
 *nb);
>
>  DECLARE_PER_CPU(unsigned long, hw_pressure);
>
>
> ---
>
> This is just a rough idea, and needs ironing out the wrinkles, which are =
there,
> but that allows leaving the idle enter as is. I also believe this is the =
right
> approach for the interface itself, although I also see some drawbacks and
> potential issues (in its current state), especially that the functionalit=
y is
> being exposed to modules.
> Nevertheless, those are my two cents, untested, just sketched.

As an aside, could we verify the functionality of the AMU's
SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
To my knowledge, many chips currently have inaccurate errata in this counte=
r.
Alternatively, could we introduce a command line that allows users to
dynamically disable this feature?

Thanks!
>
> ---
> BR
> Beata
> >
> > >
> > > > Aside: I should have probably asked that earlier, but I am not sure=
 I do fully
> > > > understand the case we are trying to fix here.
> > > > The topology_set_scale_freq_source prefers arch source to others. S=
o if the
> > > > AMUs were chosen to server as the source for the freq scale - I do =
not see
> > > > why the sfd would be changed. That would require calling sequence c=
lear-set
> > > > to get a different source in place. I do understand the issue itsel=
f, though how
> > > > did we end up there in the first place ?
> > >
> > > The issue arises when topology_clear_scale_freq_source() is called
> > > with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
> > > scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
> > > to be used by modules or subsystems that need to replace the frequenc=
y
> > > invariance mechanism at runtime.
> > >
> > So this is the bit I was missing: external module that does the switch
> > willingly giving up on arch provided freq scale source.
> > The rest is clear. Thanks.
> >
> > ---
> > BR
> > Beata
> >
> > > After clearing, the tick path (topology_scale_freq_tick()) correctly
> > > skips the AMU update because sft_data is set to NULL. However, the
> > > idle path (arch_cpu_idle_enter()) bypasses this check by calling
> > > amu_scale_freq_tick() directly, so arch_freq_scale still gets
> > > modified by AMU counters.
> > >
> > > This creates an inconsistency: the tick path respects
> > > topology_clear_scale_freq_source() but the idle path does not.
> > >
> > > The goal of this patch is to make the idle path consistent with
> > > the tick path, ensuring that topology_clear_scale_freq_source()
> > > fully disables AMU updates across all paths.
>


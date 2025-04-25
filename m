Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740BBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQEaOfuvvVeuvSrF1uTd3hXLlI06wb8Sqqmzq7nvY+c=; b=oyuluRVAAsMQ4mL6sOTE772gPL
	6USMxX2n6imN1w5XFR3L43zJ7XBD63XjUfoOqa8P+4nkcK9FmNb/9K24H3JuunLVMHv7XtmPzfwUr
	D0BYOaTLFgUcEL2zl6WEHA7HK9LfAhF7xBLZC+yHmT8MZB4sd9nQwiscaw/n03uj9p+atbsa8CfVK
	8xEb6jC4vZtcIzyfGIORtq4xLn0pLYWA7v9abf5sDHrNofK5oMe8Cl8+HynGZpfDZrMib3SlMtPVB
	qV+5qS9Xk3BQxjq/bSP8byQYCpx2FNmkmFtMKlbLCi8WDGfRc6uqeGknTILNQ/ExQ44xrW/y3xB6d
	Js4Rdwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8RCz-000000010uk-3znO;
	Fri, 25 Apr 2025 22:07:45 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8RAY-000000010VH-1K8k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 22:05:15 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so9351746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745618713; x=1746223513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQEaOfuvvVeuvSrF1uTd3hXLlI06wb8Sqqmzq7nvY+c=;
        b=xG3UeSTZcq2N7CA9nt8RhH8ASmVSVjbKVteIUp3FOIR/xGZ+oCwpLquyKKzIuGC+6l
         UImCzXCr1wowTDj2BZ/9MqSrpO+ypYi8LvK/CHSNn2mJmm4T/X7Y/Ff9/TbXH5ag/M0S
         6F3zuQDWj0/fnApwpbK0BLlb/XG49Ioi3IMyfNiNK5pkWBCOXES8STmoCHTOhvayfKTa
         O8S6G9JdUwpkmq6CbhnTFnh2l6kBCOTqbSZneHh3gJQqOrWPppaOAMi40D6H/d62yuZn
         xFIknILNXiN0AtjEN7oo9FF/uuVzNVprd7bn39LJ8Uloeo1wSQzOsPVXoGXbokYDiMMf
         NiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618713; x=1746223513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQEaOfuvvVeuvSrF1uTd3hXLlI06wb8Sqqmzq7nvY+c=;
        b=eX/olT1vLt0ynOdDQIYzfQ0VaVwB6lnoGYILHZS+FlCao+5tGAWDUIUL0rgkM//fGf
         BNNtwMJ27hqnOYJODq8sviAaNBQ2Z9bdKHDUtxEnv9WEgzXJcUkMvzpwRzvTXygvig77
         vySS0PJStiTZnFzWs15UG4FTks07WfFzkYIQ9sg1MiMOWe2JdcORiGHtjsNxVoY3/2DG
         MsGYVBMCrr0mce1lCBMpDoPmIJ86n/1kJiP9/38xNCSL1/rohoDTgOrbOS7dc7OfiqxA
         jgV9sFF9RAHXe4oZKhbWNIc+HjfeK907p2S9A1gtrF82y9+OkwEZ3gUrrIgKmUHQfakE
         GryA==
X-Forwarded-Encrypted: i=1; AJvYcCUvuiFI6BHQvmrAjgkEog9jwaLcpL6Qdnm+a0uzEljNiMlZdhhFenfjpiPGH2Ou/9K1FIJbHa4FtlPt6T85tsyd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8r6QSz3NBFNsfHljFRIZSG0H5IevOivAH4g1YmvhH6ATRtgGV
	ESDyZvjvWDuQGAYAxKc2PUeRXRQd9NBkfsOa212Ga+L198ewY1w/KhbIfYTvQ8gFttD5ATvVN+K
	VURSF5nnQAtFWOi9gxJhr4pk9obFO/33LE8aCseRC5kapfb8/WRU=
X-Gm-Gg: ASbGnctDhxA2tyGlB54LVrT7iLWhasmQDWnZ4GoFNhYlXDUz/Bsd62hdaLw8NQfCrHe
	MVaOOs7VoDJqR1Bpa0DVWQV4ljGLkNmSfBwoWEbljC43ESEICQiG3k0573MZletCJIErItKdEMJ
	YTvl3GCEPyYrfHFqIUvV2P/k2Fy/rHrMaPFXJkFtM1mhyLUr6AqIU=
X-Google-Smtp-Source: AGHT+IHYoKpdXfXgFXrJBFZpzCn/mfe9TNWUjRlQbefBw50/jJUuWZ6Fd+u+VMhaEICt4nTBFSQrCy1qeuWBU1l52v0=
X-Received: by 2002:a05:6214:2504:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f4cb9edb99mr65920026d6.26.1745618712759; Fri, 25 Apr 2025
 15:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
In-Reply-To: <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 25 Apr 2025 15:05:01 -0700
X-Gm-Features: ATxdqUFPXkJDUxeyY_qhK-zlhKmqHCzSSlGClv2AG8Hfm8lv-9ZFAk_CP4I8Iok
Message-ID: <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_150514_362851_4EA948AD 
X-CRM114-Status: GOOD (  53.53  )
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

On Thu, Apr 24, 2025 at 9:16=E2=80=AFPM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/24/25 04:30, Yabin Cui wrote:
> > Similar to ETE, TRBE may lose its context when a CPU enters low
> > power state. To make things worse, if ETE state is restored without
> > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > source device with no enabled sink devices.
>
> Could you please provide some more details about when the cpu gets
> stuck e.g dmesg, traces etc. Also consider adding those details in
> the commit message as well to establish the problem, this patch is
> trying to address.

This is already the best I know. When experimenting TRBE locally
(on Pixel 9), if I don't save TRBE state across low power state, when
recording system wide ETM data using TRBE on a CPU core. In a
few seconds, the CPU state becomes unknown (no message in dmesg).
Since the core may hold locks needed by other cores, it soon locks
other cores and causes a watchdog reset. I found the coresight driver
always carefully enables sink before source, and disables sink after
source. I guess there is some risk in not doing so, like the CPU hang
here. Maybe you know why?


>
> >
> > This patch introduces support for "arm,coresight-loses-context-with-cpu=
"
> > in the TRBE driver. When present, TRBE registers are saved before
> > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > state is always saved after ETE state and restored after ETE state.
>
> The save and restore order here is
>
> 1. Save ETE
> 2. Save TRBE
> 3. Restore ETE
> 4. Restore TRBE
>
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >  .../coresight/coresight-etm4x-core.c          | 13 ++++-
> >  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
> >  include/linux/coresight.h                     |  6 +++
> >  3 files changed, 71 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drive=
rs/hwtracing/coresight/coresight-etm4x-core.c
> > index e5972f16abff..1bbaa1249206 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *=
drvdata)
> >  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >  {
> >       int ret =3D 0;
> > +     struct coresight_device *sink;
> >
> >       /* Save the TRFCR irrespective of whether the ETM is ON */
> >       if (drvdata->trfcr)
> > @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *d=
rvdata)
> >        * Save and restore the ETM Trace registers only if
> >        * the ETM is active.
> >        */
> > -     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> > +     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
> >               ret =3D __etm4_cpu_save(drvdata);
> > +             if (ret =3D=3D 0) {
> > +                     sink =3D coresight_get_percpu_sink(drvdata->cpu);
> > +                     if (sink && sink_ops(sink)->percpu_save)
> > +                             sink_ops(sink)->percpu_save(sink);
> > +             }
> > +     }
> >       return ret;
> >  }
> >
> > @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvd=
ata *drvdata)
> >
> >  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >  {
> > +     struct coresight_device *sink =3D coresight_get_percpu_sink(drvda=
ta->cpu);
> > +
> > +     if (sink && sink_ops(sink)->percpu_restore)
> > +             sink_ops(sink)->percpu_restore(sink);
>
> TRBE gets restored first which contradicts the order mentioned
> earlier in the commit message ?
>
An error in the commit message, should be:
To prevent CPU hangs, TRBE state is always saved after ETE state and
restored before ETE state.

>
> >       if (drvdata->trfcr)
> >               write_trfcr(drvdata->save_trfcr);
> >       if (drvdata->state_needs_restore)
> > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwt=
racing/coresight/coresight-trbe.c
> > index fff67aac8418..38bf46951a82 100644
> > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] =3D {
> >   */
> >  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES       256
> >
> > +struct trbe_save_state {
> > +     u64 trblimitr;
> > +     u64 trbbaser;
> > +     u64 trbptr;
> > +     u64 trbsr;
> > +};
>
> This seems to accommodate all required TRBE registers. Although this is
> very intuitive could you please also add a comment above this structure
> explaining the elements like other existing structures in the file ?

Will do in the v2 patch.
>
> > +
> >  /*
> >   * struct trbe_cpudata: TRBE instance specific data
> >   * @trbe_flag                - TRBE dirty/access flag support
> > @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] =3D {
> >   * @cpu                      - CPU this TRBE belongs to.
> >   * @mode             - Mode of current operation. (perf/disabled)
> >   * @drvdata          - TRBE specific drvdata
> > + * @state_needs_save - Need to save trace registers when entering cpu =
idle
> > + * @state_needs_restore      - Need to restore trace registers when ex=
iting cpu idle
> > + * @save_state               - Saved trace registers
> >   * @errata           - Bit map for the errata on this TRBE.
> >   */
> >  struct trbe_cpudata {
> > @@ -133,6 +143,9 @@ struct trbe_cpudata {
> >       enum cs_mode mode;
> >       struct trbe_buf *buf;
> >       struct trbe_drvdata *drvdata;
> > +     bool state_needs_save;
>
> This tracks whether coresight_loses_context_with_cpu() is supported
> on the CPU or not.
>
> > +     bool state_needs_restore;
>
> This tracks whether the state has been saved earlier and hence can
> be restored later on when required.

Will update the comment in the v2 patch.

>
> > +     struct trbe_save_state save_state;
> >       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> >  };
> >
> > @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq=
, void *dev)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static void arm_trbe_cpu_save(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
>
> Please move the above statement after the following conditional
> block. Because struct trbe_save_state is not going to be required
> if arm_trbe_cpu_save() returns prematurely from here.
>
Will do in the v2 patch.
> > +
> > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_need=
s_save)
> > +             return;> +
> > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > +     cpudata->state_needs_restore =3D true;
>
> This looks right.
>
> > +}
> > +
> > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
> Please move this assignment inside the block where these registers
> actually get restored after all checks are done.
>
Will do in the v2 patch.
> > +
> > +     if (cpudata->state_needs_restore) {
> > +             /*
> > +              * To avoid disruption of normal tracing, restore trace
> > +              * registers only when TRBE lost power (TRBLIMITR =3D=3D =
0).
> > +              */
>
> Although this sounds like a reasonable condition, but what happens
> when TRBE restoration is skipped ?
>
There are cases when a CPU fails to enter a low power state or only enters
a shallow low power state. So TRBE state may not be lost when calling
arm_trbe_cpu_restore(). In this case, if we write the TRBE registers, proba=
bly
we lose ETM data written between save and restore. This may not matter,
but could there be a race condition between this restore function and TRBE
interrupt handler (which could also write TRBE registers)? I can't think
this up very well. So I only restore registers when state is lost. If
the state isn't
lost, TRBE should stay in enabled mode, and continue receiving data from ET=
E.

> > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
>
>                         state =3D &cpudata->save_state
>
> > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1)=
;
> > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > +             }
> > +             cpudata->state_needs_restore =3D false;
>
> That means earlier captured state is dropped without a restoration.
>
> > +     }
> > +}
> > +
> >  static const struct coresight_ops_sink arm_trbe_sink_ops =3D {
> >       .enable         =3D arm_trbe_enable,
> >       .disable        =3D arm_trbe_disable,
> >       .alloc_buffer   =3D arm_trbe_alloc_buffer,
> >       .free_buffer    =3D arm_trbe_free_buffer,
> >       .update_buffer  =3D arm_trbe_update_buffer,
> > +     .percpu_save    =3D arm_trbe_cpu_save,
> > +     .percpu_restore =3D arm_trbe_cpu_restore,
>
> Why this percpu_* prefix ?
>
Added percpu_ prefix because it's only for percpu_sink
(coresight_get_percpu_sink).
Please let me know if you have a better name.
> >  };
> >
> >  static const struct coresight_ops arm_trbe_cs_ops =3D {
> > @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
> >       cpudata->trbe_flag =3D get_trbe_flag_update(trbidr);
> >       cpudata->cpu =3D cpu;
> >       cpudata->drvdata =3D drvdata;
> > +     cpudata->state_needs_save =3D coresight_loses_context_with_cpu(
> > +             &drvdata->pdev->dev);
> > +     cpudata->state_needs_restore =3D false;
>
> The init here looks good.
>
> >       return;
> >  cpu_clear:
> >       cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index d79a242b271d..fec375d02535 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -362,6 +362,10 @@ enum cs_mode {
> >   * @alloc_buffer:    initialises perf's ring buffer for trace collecti=
on.
> >   * @free_buffer:     release memory allocated in @get_config.
> >   * @update_buffer:   update buffer pointers after a trace session.
> > + * @percpu_save:     saves state when CPU enters idle state.
> > + *                   Only set for percpu sink.
> > + * @percpu_restore:  restores state when CPU exits idle state.
> > + *                   only set for percpu sink.
> >   */
> >  struct coresight_ops_sink {
> >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> >                             struct perf_output_handle *handle,
> >                             void *sink_config);
> > +     void (*percpu_save)(struct coresight_device *csdev);
> > +     void (*percpu_restore)(struct coresight_device *csdev);
>
> Again - why this percpu_* prefix ?
>
> >  };
> >
> >  /**


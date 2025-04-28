Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77734C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQ4H0gqqKh+ng1Q5TSOaQmHnCz9VVfiwg4NMCceo9OU=; b=YeWAtGVP6vBdYTVloggVXNbOKN
	VZ0bk8jGCnqeM5HudCB30ReWmQMdtP92zo7SjJh/RC9+z/Y5wBCLnvaseQ+BI7odYq8bQFEl9P/el
	uKT5cgovwPCd4z0Fp8j4oBrht1EF3kWPe8pEw65Babdv1AbfqPK7Sqw0o0xRBPTzM4NgTN8UFKnk4
	/2mxUQBk7mE9w4AgZEZs0JxAh9kzeZqkr1mNwcCtB4Kpf0gEvznhrey+++j6qEPFyLloI7OMzNPpm
	D6sz72D47KC+XT04mIhZKoLRw/9OWC1/lA/TwDUeP/1pGU/ESN6E3izqN5P0rwT7BZoAl6ttDcUe3
	RcBw0Jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MDz-00000005s8m-1e9f;
	Mon, 28 Apr 2025 11:00:35 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M7H-00000005r7I-1HYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:53:40 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3553389a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745837618; x=1746442418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ4H0gqqKh+ng1Q5TSOaQmHnCz9VVfiwg4NMCceo9OU=;
        b=gtW0UlnDruNwZBIU9IQX+/4pTrlZinbOG52ep1OZ0TKhc3T1/7Ej0nYna8+sQzgXty
         vEc3pMM2Np99q74jZOyeFaDLaGHmw9Jar5CHslZHXYjgkItxPzcaAQOJnDMxJ46idbnv
         2SsjPLmgWrxf+uuq0dfSVUd8JX3PpoRn4lf15dJPEeEBeVGwrQ0mhabHqqsx7DkzJkbS
         mwcMGi0errL5fw0AnHfmlvXe5RoBhUAQ/+yqc+FmZskzImnwmohj7cECriiOHQ4nDOjR
         FWlM5HmDLUB/FCNYPXd199WzGI6cxSPASKxWmPoYfrQkLx2pQdVfGIyhpCkZvfreiD4Z
         Tjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837618; x=1746442418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ4H0gqqKh+ng1Q5TSOaQmHnCz9VVfiwg4NMCceo9OU=;
        b=Q8r095MPkR/FmxZmeipeCfNEEmzskP1wM5iGpweMr83W99hHFt+De1VN/bsnAk8zxK
         zkIok6AqFOnuK0SiYMVYxDzzvqkTN35gF+kUMFaKYKZE7bdtkYSfDRBV+7btRdTyvw5p
         dAdgH0k2YcCvLtrjtUdzoC2Z+WUgSdSKH8UDM4npGPCOfb5wnFT2h47SnZdP8fyR941v
         uGg++pWAU3rMRCT6dfY9Xb5nfQWSsKNN6S/7zaz7c9MzY81xIbVDHrtuMkE1acS13rNK
         yET6czIwIKYag502vrfavniuOUtOBVE6y4Y8+G5RymYVifuNBlmp4dJ+ARRtmNu/vwQ+
         RXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnBqVQisro3gYGIETC5bT4R56BrlnebqKtiJdfeBZbK/LPcjiY8qF26bGqN8Tonn64vnLBdbdozfZvSiIh8DJH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0j4bp3t4GDQ39HEjxEapTgfEs0Kg8lnfGQma46EzNPbX6x+FE
	NHFr1kWmmz67dNNorD7gxg5rJ2CKUHEw4ql9QzICF9fvUqUXM+ppJ88Zcd7MwaI2xHKlii21qcF
	zymmqyCp53SSGE5W6mQEEZpK1zmcPBuCt7hYK/g==
X-Gm-Gg: ASbGncs9rHuGGiJCn7RMcUiDKy9gjecbETpRkobfCDpEBk3Wj6FNtAZ8FjWhBmY+gMd
	DgIh8YEHBO3UY+iidnXlzFK5Vx5QMvixiWHw2RzxgoIo+U8h7VE9l11aXS89FjXmyPzW9chlB5p
	IxYLMoanLGsuklIL0DH7qGnO4=
X-Google-Smtp-Source: AGHT+IGW39PFq1vNzpQcv+1EqlEOnsFYuMKw69GoGxeEownj7ws52uMpNUzai4ppvPMgAR0rPERZiDrYw8CoCiUEn8c=
X-Received: by 2002:a05:6a21:3398:b0:1f3:33c2:29c5 with SMTP id
 adf61e73a8af0-2045b6a2d55mr17932109637.7.1745837617881; Mon, 28 Apr 2025
 03:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
In-Reply-To: <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Apr 2025 11:53:26 +0100
X-Gm-Features: ATxdqUHw2fTALHJXvj7ywyjxl49T6cS5C9Tn0FNV7puTETCKCpBTALZ9W1rz2hY
Message-ID: <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Yabin Cui <yabinc@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_035339_369292_CFEC38DD 
X-CRM114-Status: GOOD (  58.16  )
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

Hi

On Fri, 25 Apr 2025 at 23:05, Yabin Cui <yabinc@google.com> wrote:
>
> On Thu, Apr 24, 2025 at 9:16=E2=80=AFPM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> > On 4/24/25 04:30, Yabin Cui wrote:
> > > Similar to ETE, TRBE may lose its context when a CPU enters low
> > > power state. To make things worse, if ETE state is restored without
> > > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > > source device with no enabled sink devices.
> >
> > Could you please provide some more details about when the cpu gets
> > stuck e.g dmesg, traces etc. Also consider adding those details in
> > the commit message as well to establish the problem, this patch is
> > trying to address.
>
> This is already the best I know. When experimenting TRBE locally
> (on Pixel 9), if I don't save TRBE state across low power state, when
> recording system wide ETM data using TRBE on a CPU core. In a
> few seconds, the CPU state becomes unknown (no message in dmesg).
> Since the core may hold locks needed by other cores, it soon locks
> other cores and causes a watchdog reset. I found the coresight driver
> always carefully enables sink before source, and disables sink after
> source. I guess there is some risk in not doing so, like the CPU hang
> here. Maybe you know why?
>
>
> >
> > >
> > > This patch introduces support for "arm,coresight-loses-context-with-c=
pu"
> > > in the TRBE driver. When present, TRBE registers are saved before
> > > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > > state is always saved after ETE state and restored after ETE state.
> >
> > The save and restore order here is
> >
> > 1. Save ETE
> > 2. Save TRBE
> > 3. Restore ETE
> > 4. Restore TRBE
> >
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > ---
> > >  .../coresight/coresight-etm4x-core.c          | 13 ++++-
> > >  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++=
++
> > >  include/linux/coresight.h                     |  6 +++
> > >  3 files changed, 71 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/dri=
vers/hwtracing/coresight/coresight-etm4x-core.c
> > > index e5972f16abff..1bbaa1249206 100644
> > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata=
 *drvdata)
> > >  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> > >  {
> > >       int ret =3D 0;
> > > +     struct coresight_device *sink;
> > >
> > >       /* Save the TRFCR irrespective of whether the ETM is ON */
> > >       if (drvdata->trfcr)
> > > @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata =
*drvdata)
> > >        * Save and restore the ETM Trace registers only if
> > >        * the ETM is active.
> > >        */
> > > -     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> > > +     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) =
{
> > >               ret =3D __etm4_cpu_save(drvdata);
> > > +             if (ret =3D=3D 0) {
> > > +                     sink =3D coresight_get_percpu_sink(drvdata->cpu=
);
> > > +                     if (sink && sink_ops(sink)->percpu_save)
> > > +                             sink_ops(sink)->percpu_save(sink);
> > > +             }
> > > +     }
> > >       return ret;
> > >  }
> > >
> > > @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_dr=
vdata *drvdata)
> > >
> > >  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> > >  {
> > > +     struct coresight_device *sink =3D coresight_get_percpu_sink(drv=
data->cpu);
> > > +
> > > +     if (sink && sink_ops(sink)->percpu_restore)
> > > +             sink_ops(sink)->percpu_restore(sink);
> >
> > TRBE gets restored first which contradicts the order mentioned
> > earlier in the commit message ?
> >
> An error in the commit message, should be:
> To prevent CPU hangs, TRBE state is always saved after ETE state and
> restored before ETE state.
>
> >
> > >       if (drvdata->trfcr)
> > >               write_trfcr(drvdata->save_trfcr);
> > >       if (drvdata->state_needs_restore)
> > > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/h=
wtracing/coresight/coresight-trbe.c
> > > index fff67aac8418..38bf46951a82 100644
> > > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > > @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] =3D {
> > >   */
> > >  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES       256
> > >
> > > +struct trbe_save_state {
> > > +     u64 trblimitr;
> > > +     u64 trbbaser;
> > > +     u64 trbptr;
> > > +     u64 trbsr;
> > > +};
> >
> > This seems to accommodate all required TRBE registers. Although this is
> > very intuitive could you please also add a comment above this structure
> > explaining the elements like other existing structures in the file ?
>
> Will do in the v2 patch.
> >
> > > +
> > >  /*
> > >   * struct trbe_cpudata: TRBE instance specific data
> > >   * @trbe_flag                - TRBE dirty/access flag support
> > > @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] =3D {
> > >   * @cpu                      - CPU this TRBE belongs to.
> > >   * @mode             - Mode of current operation. (perf/disabled)
> > >   * @drvdata          - TRBE specific drvdata
> > > + * @state_needs_save - Need to save trace registers when entering cp=
u idle
> > > + * @state_needs_restore      - Need to restore trace registers when =
exiting cpu idle
> > > + * @save_state               - Saved trace registers
> > >   * @errata           - Bit map for the errata on this TRBE.
> > >   */
> > >  struct trbe_cpudata {
> > > @@ -133,6 +143,9 @@ struct trbe_cpudata {
> > >       enum cs_mode mode;
> > >       struct trbe_buf *buf;
> > >       struct trbe_drvdata *drvdata;
> > > +     bool state_needs_save;
> >
> > This tracks whether coresight_loses_context_with_cpu() is supported
> > on the CPU or not.
> >
> > > +     bool state_needs_restore;
> >
> > This tracks whether the state has been saved earlier and hence can
> > be restored later on when required.
>
> Will update the comment in the v2 patch.
>
> >
> > > +     struct trbe_save_state save_state;
> > >       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> > >  };
> > >
> > > @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int i=
rq, void *dev)
> > >       return IRQ_HANDLED;
> > >  }
> > >
> > > +static void arm_trbe_cpu_save(struct coresight_device *csdev)
> > > +{
> > > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > > +     struct trbe_save_state *state =3D &cpudata->save_state;
> >
> > Please move the above statement after the following conditional
> > block. Because struct trbe_save_state is not going to be required
> > if arm_trbe_cpu_save() returns prematurely from here.
> >
> Will do in the v2 patch.
> > > +
> > > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_ne=
eds_save)
> > > +             return;> +
> > > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > > +     cpudata->state_needs_restore =3D true;
> >
> > This looks right.
> >
> > > +}
> > > +
> > > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > > +{
> > > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > > +     struct trbe_save_state *state =3D &cpudata->save_state;
> > Please move this assignment inside the block where these registers
> > actually get restored after all checks are done.
> >
> Will do in the v2 patch.
> > > +
> > > +     if (cpudata->state_needs_restore) {
> > > +             /*
> > > +              * To avoid disruption of normal tracing, restore trace
> > > +              * registers only when TRBE lost power (TRBLIMITR =3D=
=3D 0).
> > > +              */
> >
> > Although this sounds like a reasonable condition, but what happens
> > when TRBE restoration is skipped ?
> >
> There are cases when a CPU fails to enter a low power state or only enter=
s
> a shallow low power state. So TRBE state may not be lost when calling
> arm_trbe_cpu_restore(). In this case, if we write the TRBE registers, pro=
bably
> we lose ETM data written between save and restore. This may not matter,
> but could there be a race condition between this restore function and TRB=
E
> interrupt handler (which could also write TRBE registers)? I can't think
> this up very well. So I only restore registers when state is lost. If
> the state isn't
> lost, TRBE should stay in enabled mode, and continue receiving data from =
ETE.
>
> > > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
> >
> >                         state =3D &cpudata->save_state
> >
> > > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL=
1);
> > > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > > +             }
> > > +             cpudata->state_needs_restore =3D false;
> >
> > That means earlier captured state is dropped without a restoration.
> >
> > > +     }
> > > +}
> > > +
> > >  static const struct coresight_ops_sink arm_trbe_sink_ops =3D {
> > >       .enable         =3D arm_trbe_enable,
> > >       .disable        =3D arm_trbe_disable,
> > >       .alloc_buffer   =3D arm_trbe_alloc_buffer,
> > >       .free_buffer    =3D arm_trbe_free_buffer,
> > >       .update_buffer  =3D arm_trbe_update_buffer,
> > > +     .percpu_save    =3D arm_trbe_cpu_save,
> > > +     .percpu_restore =3D arm_trbe_cpu_restore,
> >
> > Why this percpu_* prefix ?
> >
> Added percpu_ prefix because it's only for percpu_sink
> (coresight_get_percpu_sink).
> Please let me know if you have a better name.
> > >  };
> > >
> > >  static const struct coresight_ops arm_trbe_cs_ops =3D {
> > > @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
> > >       cpudata->trbe_flag =3D get_trbe_flag_update(trbidr);
> > >       cpudata->cpu =3D cpu;
> > >       cpudata->drvdata =3D drvdata;
> > > +     cpudata->state_needs_save =3D coresight_loses_context_with_cpu(
> > > +             &drvdata->pdev->dev);
> > > +     cpudata->state_needs_restore =3D false;
> >
> > The init here looks good.
> >
> > >       return;
> > >  cpu_clear:
> > >       cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> > > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > > index d79a242b271d..fec375d02535 100644
> > > --- a/include/linux/coresight.h
> > > +++ b/include/linux/coresight.h
> > > @@ -362,6 +362,10 @@ enum cs_mode {
> > >   * @alloc_buffer:    initialises perf's ring buffer for trace collec=
tion.
> > >   * @free_buffer:     release memory allocated in @get_config.
> > >   * @update_buffer:   update buffer pointers after a trace session.
> > > + * @percpu_save:     saves state when CPU enters idle state.
> > > + *                   Only set for percpu sink.
> > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > + *                   only set for percpu sink.
> > >   */
> > >  struct coresight_ops_sink {
> > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode=
,
> > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > >                             struct perf_output_handle *handle,
> > >                             void *sink_config);
> > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > +     void (*percpu_restore)(struct coresight_device *csdev);
> >
> > Again - why this percpu_* prefix ?
> >
> > >  };
> > >
> > >  /**

I do not think this is the best approach.

The TRBE driver has its own power management registration functions,
so is it not possible for the save and restore should be handled
there, through a PM notifier, just as the ETM/ETE is?

Drop the unnecessary DT entry - TRBE is a per cpu architectural device
- if a TRBE is present, we know it will power down with the PE.

The CoreSight architecture permits an ETE to drive trace to an
external sink - so the TRBE might be present but unused, therefore
hooking into a source driver that may not be driving trace into the
device does not seem wise..

The TRBE PM can follow the model of the ETE / ETMv4 and save and
restore if currently in use.

This approach will isolate the changes to the TRBE driver where they should=
 be.

Regards

Mike


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


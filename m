Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3EAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiNWnQMtGrQqoGeghTFTaV+yI+YeCdjBAwSDvmoMUtU=; b=LD9OSoiQGvU4Z+7AWmIAabzuhF
	+kgHW2SKPiXaiZS/sElBhAE1Op9HA1SQk0le20S3UHXAAt4FxeBuxGWFrv9nt6VmVcC608qmqCGMF
	zvdvbrd4KOPb3icP4OQ0u56FZNketxxFNdnUUhE5Zzti6OZ+ve6xNHzmhhoBbKTGbqYfsM0RCo9rL
	yUJjlTTkZSMY+7OB+dJnFxeeqNGzqp2cuMf5rCkiK1nt//5Q1vr8CX9DOMJYT2WQfOOWtd3SbMRPi
	j/+bXVZY2e8KTSM1WIOBkiRkkE4chP47FqV7v3uN6aeiLxT1TiG8G5+86M8AUvqYvfZTEzSP5bEL4
	R+PuXkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81dC-0000000F4i0-18PK;
	Thu, 24 Apr 2025 18:49:06 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81ST-0000000F304-2kIC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:38:02 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6ecf0e07947so14431366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745519880; x=1746124680; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiNWnQMtGrQqoGeghTFTaV+yI+YeCdjBAwSDvmoMUtU=;
        b=Xte7sIvuGDxNVL2gAaPHP+UxXiWkGRcokqiBzCUZy0gsN5NZ7ZF8lmY3ni+DjTqwkB
         7LdIXjcTvx3B0lZn1V/+qNKs0Y0rYplsr/8afpM9pRbUZ8TcfntW3KQWske5tR1eT2xq
         mY+aFzUNadLcdmuXiID8sz/xkOhmMBLtSuPsbGZhraarY4EmuIa+QrdH3be1IxnFP0jC
         Ci0P9KvbrrKxph2jNJ9cCj+lO0jo6+Z4rQnKuHudeatm0Dqu3nE5R0MPzNOV3xo5HLOS
         o9rFBrb7XBVTa2GdqGu8w1XpfX+ZeYBJZH/AQF9lc6e0qQTX40Gwfk4pxmkug8Okksym
         TGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519880; x=1746124680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiNWnQMtGrQqoGeghTFTaV+yI+YeCdjBAwSDvmoMUtU=;
        b=p5W21CIShYxsKJBbRhJjE3QH21fCamLmNJr9sIXs/glrVfSqqaUa1GrCnGHNrW98dv
         /Z9ohXkhQwlzElV38bq/H1CsMESZnP2VfMz8b5h295nfG9Or7rhfYFOtuuGwnf7chqwS
         XWL+pQb4llxDVe3pFB30QpqW7W8cjDjbXScvO1nYQd3UEZb3IiaRlXS63hycNvhP4gSB
         7lS6JneYP1GstgG7t808evMzPfGKtmK2Aa3DwyI2ecXgyBFQeTzPYjVwgaA29NI8kgXh
         R3slEpH9/WC7HrawX/Ctjx3zkRzOLWA5oGjajtbbX51oJ3mABpj60iEHl/0Q9E1XMcdV
         9Xhw==
X-Forwarded-Encrypted: i=1; AJvYcCUJkJkM2l/cghYwDBN59rE/TRzImNX+8ZR2BvLs0plNwOdMLRwu4AA/E3rkeFMXufOM74TImgNhoihKsEhF2+yA@lists.infradead.org
X-Gm-Message-State: AOJu0YyYy5jlba61rSCQI6jHFoCBtHUwU2skbR6toJPJMDxdzFpz0sWa
	Q22oyjLi5atLAVJ6oxTBdaBtitfab+a8FCl6wXWbKzsY/RxfGAwqKxbrcHOXcTV4cG/g7m2SfYy
	rD/EgpO1g2Ay6Ux3xRl4C7VYgsLz+RDjSQTw=
X-Gm-Gg: ASbGncsAQJynKseaVaqF/8KtbMdjrJMFw5GQm6AdwZ+ybCou7kBV0u4Bn1QNBuC/7w7
	jGK0uAU1BMRj/AnVbFDAc5C7DVjFgsGU7Gm7Zk5TCxytyRA5V1Rqxx2UaybiXJCz/P/y/Bu4ycc
	Aefarwtq1ERvNnrhbL3CKGu8vas2kjEf+0s8oJ7MFX5KamWTc0hxlr0AY=
X-Google-Smtp-Source: AGHT+IEgzkCp19X1hUx0K4CNHyl42mitxUF8xCqnzHFeC6oinPUgS83/wR/eN1NJbe22i34g+1jituaQJixCrt2ksQg=
X-Received: by 2002:a05:6214:410f:b0:6f2:c94f:b12f with SMTP id
 6a1803df08f44-6f4c0f4aacamr56439356d6.3.1745519880182; Thu, 24 Apr 2025
 11:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
In-Reply-To: <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 24 Apr 2025 11:37:48 -0700
X-Gm-Features: ATxdqUHMGcMM17vbRPuI0DigfaqnG-L_XwvB6bYJEBYXEW-89TJMuPJWEmcjWvk
Message-ID: <CALJ9ZPM4+OtyzFHWxrOeNWdFyGy+xoLCch+bH8O3AJDgMFk61g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250424_113801_695422_F1EAF47E 
X-CRM114-Status: GOOD (  33.60  )
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

On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/24/25 04:30, Yabin Cui wrote:
> > Similar to ETE, TRBE may lose its context when a CPU enters low
> > power state. To make things worse, if ETE state is restored without
> > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > source device with no enabled sink devices.
> >
> > This patch introduces support for "arm,coresight-loses-context-with-cpu=
"
>
> But could "arm,coresight-loses-context-with-cpu" device tree property
> be associated wit TRBE devices ? OR this state save and restore needs
> to be handled in the firmware.

This property is handled by ETM/ETE driver. In ETM/ETE driver, the state ha=
s
options to be saved by firmware or by the driver. On my test device, which
is Pixel 9, the state is saved by the driver. I have also tested that TRBE =
state
can be saved by the TRBE driver.

>
> > in the TRBE driver. When present, TRBE registers are saved before
> > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > state is always saved after ETE state and restored after ETE state.
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
> > +     bool state_needs_restore;
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
> > +
> > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_need=
s_save)
> > +             return;
> > +
> > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > +     cpudata->state_needs_restore =3D true;
> > +}
> > +
> > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
> > +
> > +     if (cpudata->state_needs_restore) {
> > +             /*
> > +              * To avoid disruption of normal tracing, restore trace
> > +              * registers only when TRBE lost power (TRBLIMITR =3D=3D =
0).
> > +              */
> > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
> > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1)=
;
> > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > +             }
> > +             cpudata->state_needs_restore =3D false;
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
> >  };
> >
> >  /**


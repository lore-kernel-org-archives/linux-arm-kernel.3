Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0F6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4/rgL5TmiSafvDliAVjXLEcMVin7z50Ra+RTzNxxMQ=; b=V0rStoU3jl49RCb6KA/u93OCdU
	aNvvdb2LdrY48fjX55Q5rH1Vztqwec1MaLWrS8O0yGuU2Yz6FwF1vwkMhNxQKnqnQbusZyBezS/B5
	pcmP4/mtXxR/EuX0Ztaa5ofP0BI2NH1kIP+vnUhQEuRCqn0EXcWMOaYMDTbTUmDg9MZSQJ9wajbLd
	smiK629nll668p1ib3FMI/y9nkXvmN3H/GJI75mL+ZKun3YxLg4FxTepefhlDHKBCwx+Qg9Vq2F0K
	m1+cEwUrzRH4nEkO4PXLp61dG4uFtXhf5SLhB2DxihwzbB1J017Y2gscJXNJ+m4DkJLmvIOabVSg0
	Qbhu5EsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv7kD-00000003Zww-3SxE;
	Sat, 15 Aug 2026 06:19:49 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv7kB-00000003ZwB-0BTo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 06:19:48 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c10ed63c0so403901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 23:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786774785; cv=none;
        d=google.com; s=arc-20260327;
        b=K2wNH3IhYdTn78ZtD677qXli1ezzaFe5hCTlI1xQEksft30/hF1uN88K9JOyezbsmd
         kipIrLraUwIpT6RpmlyAoHwQPW/+0jTzovpsVS3FfqyF1h8HHHUs9R3Tml7o1YfdqdPG
         apdQ4mgOjtxrnHZREfx4fbwnn86Tdwbel9Cj4s0Np03Tt7LksfaIE6bUc0hZDKZnzomK
         YzfIKrrg+F/OGYzJt4H/LG6OTkYTMG6GUql1vMUtHHU0xyd1CryVicuGxiuOv6acACQ0
         YwqXXmIu54mARzLEpH1yzOUf/gRnL6CuyuMkm8ySBRZ6yW/2XRBiXoDjcBM/Ieh2iEUn
         iHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U4/rgL5TmiSafvDliAVjXLEcMVin7z50Ra+RTzNxxMQ=;
        fh=kbtvVNj8nd7/0xh0PdT5RG58TThOFGjXa3yLbA32/ew=;
        b=HaxAF8j7XrHDwJGO+stT6ocB0DEE2pjobwGL+ajJUd5oCx6k9OAIgf9uFGXxVHI9R3
         xa+sziMiIDZNiCd21xGAJMFcOGMgCZT6e1NUULNk6/vHnFzV7+911REV+pPbIyCWRiEB
         B/hAZFEa0x0HkW1VQHNPV+bK2Vg5oHAnfFKPqEjt9vLsYfciyul9QzQ/l5Nd+ste10RD
         s+U1C6+Sr3pq1JFVXDSsSjhMOP6GYu2/J30TIIVX9FS5CfzV5/12itqyDPKWILkruoM9
         a1Mi6wVjBC5opLbHlLceHmNNdQoi300usqrTG+eGwm/MA/zuHhawTqHkbiSxoTguyBqN
         a+Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786774785; x=1787379585; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4/rgL5TmiSafvDliAVjXLEcMVin7z50Ra+RTzNxxMQ=;
        b=HDpiXlPs+tiEtxCzeRkPzRucU40LYJ4QTMjKdsMapZN5/5KhNAFXFHVwA5ZnXgtdz+
         kM7cZc39CWl2OCYJl5/nZJrHZn3xktWrUNzKaUgjmFQQ86Pk5adxfUP0zygim4YjHkWk
         yAWG+dME7Iq0o+5eiIRBM/8umbwu+z+5k9YSsAX2zgUkwMi3138cCuIyB4CKikTulg3M
         68FpcPKU4VlZEG1sVLHOfz/Zzmzmp8rRY1lTb6DXhjcSf+gb1xAbe0F31Me14mSh2kPy
         os8No2Zz5dg3CP7WYwwKpQJWvfA4qDP9cKVjhtmqb3JoOFUFAGwmwySIy3KWx1PQMK3B
         XVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786774785; x=1787379585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4/rgL5TmiSafvDliAVjXLEcMVin7z50Ra+RTzNxxMQ=;
        b=dqg6UIAJqy1n5eoHYUqqZ1rIziduEycMy7z249ds1yK+KLsKD3aQApyaoPl4BD1J1X
         t/v4BxiM0KxHz4we1BTgrCzrJq0yeAreMfI7y5l7a7nx4PvxkwlwLRZDYn+EJ5dlueaY
         Pn/5gsT5P1/IrydRKhUYqfBW1voOzLxFMYEv9SPW0wRP2CJ4+RmzTFy6UFP4Tn2yOCFw
         cylPnAn9wVx3GnyaXw0tdqvE3v4+8GJChZLcnvk/157ms3Jp8xNpS9maQeKjacjWCjGq
         RDjIYlSOhWtdTcBcpDPk7exWdaB/gyF81QAhf73oDS2ZI21GWCUBczG9eHs4riNWArjD
         GvLg==
X-Forwarded-Encrypted: i=1; AHgh+Rriz6b3Dxnt0YjvZ+bv58FPuafR7oaJhW8U0djKkE10wsBFLjWqVgfK3hPEb3KVnqjkDFV5VtFVIGt2NgCwmsOn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6rVIHI1k97L4Xxon8zmgrsAwkmK05loaqw8Gr4LS5FBrf4T4p
	2iTaoS4psNUStm8aPuuclbiqIWj99A0PwvUuHt6svOqIsaRy5zU84ZdDYJoHKVtNh2Q9YmCCL2f
	KUMnCsRP6j8Zujt9DHkiQb9uj0yIV8wKhKchRmqAhzzKLpM9hUF1NeSnGRnM=
X-Gm-Gg: AR+sD11W7oV14KvqOCcfP6RCmlukl/SrqqbAUQi0+ReQ6rFJ5cPMMUnCfHG+8OAiD/7
	Hxr0gnM/phAfo1WPGP6z/Sh0aMl5rcr4ShlRNB9cvFSyeUTOVIxLuqMKqGvubsrJtDcP1EZa/pK
	dnMhvt4rUYX7G8m/q1MIlFwu25hoO50dj2I/ik9nheEUC33hKS8wveedfopKtFOXswLG63NafdN
	cc+U5K/vNEoDaUlFFfQGoXDA/UqZM/Asl81hIXV9eBVBuRycSt7eagGAnTmbSHhNbfw34imHJeE
	HQv0JNWmE6ORkJe6zDuRGYdsiYV3IHsw2ABlk8aUTrjO/A==
X-Received: by 2002:a05:622a:2597:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-52d8476b6c0mr33343981cf.8.1786774784176; Fri, 14 Aug 2026
 23:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260813064228.2799872-1-irogers@google.com> <cover.1691900000.git.irogers@google.com>
 <20260813073050.2823657-1-irogers@google.com> <700339f2-765f-4b2d-a80d-bd0a6822f91b@broadcom.com>
In-Reply-To: <700339f2-765f-4b2d-a80d-bd0a6822f91b@broadcom.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 14 Aug 2026 23:19:32 -0700
X-Gm-Features: AUfX_mxQL54J7NuX6sdmaRM-rIG6EZ-uSVfsRhTU7KLJOz2E99vKc0Kt-Qbsygc
Message-ID: <CAP-5=fUqXXRW7jFH77CCaHyOgzr09f1tmDJ+Kr2j53MOzk2vtg@mail.gmail.com>
Subject: Re: perf: Add Raspberry Pi BCM2835 AXI PMU driver
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_231947_185606_EDB5B5C3 
X-CRM114-Status: GOOD (  46.47  )
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

On Thu, Aug 13, 2026 at 10:31=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 8/13/26 00:30, Ian Rogers wrote:
> > This commit adds a new performance monitoring driver for the Raspberry =
Pi
> > AXI bus (BCM2835/2711), exposing system-level and VideoCore PMU hardwar=
e to
> > the Linux perf subsystem.
> >
> > Note on out-of-tree macro compatibility:
> > The inclusion of #if LINUX_VERSION_CODE < KERNEL_VERSION(6, 13, 0)
> > surrounding hrtimer_setup is intentionally maintained alongside
> > this patch to guarantee seamless out-of-tree compilation fallback
> > compatibility for Raspberry Pi Long Term Support (LTS) kernel variants.
>
> Upstream does not care about that, I appreciate the thought and mention,
> but that's a backporting job to ensure it works.

I agree, with the small caveat that this compatibility is needed if
you want to build and use the module on Raspberry Pi OS which uses LTS
kernels (the current one being v6.12). I'm testing on Raspberry Pi OS
and suspect others may do so as well. When Raspberry Pi OS switches to
v6.18, or if someone were to try to land this patch, then the patch
just needs this commit comment and the #if block removing. I believe
this to be a trivial alteration to the patch, and think for now the
compatibility is more useful for people trying to experiment.

> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/perf/rpi_axi_pmu.c | 2456 +++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 2456 insertions(+)
> >   create mode 100644 drivers/perf/rpi_axi_pmu.c
> >
> > diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
> > new file mode 100644
> > index 000000000000..d8efc8bb205f
> > --- /dev/null
> > +++ b/drivers/perf/rpi_axi_pmu.c
> > @@ -0,0 +1,2456 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/**
> > + * DOC: Raspberry Pi AXI Bus Performance Monitoring Unit (PMU) Driver
> > + *
> > + * This driver exposes the performance monitoring hardware on Raspberr=
y Pi
> > + * System-on-Chips to the Linux perf subsystem:
> > + * - Raspberry Pi 1, 2, 3, 4, Compute Modules 1-4, Zero, Zero W (SoCs =
BCM2835/2836/2837/2711).
> > + *
> > + * Architecture Overview:
> > + * ----------------------
> > + * The Broadcom AXI performance hardware provides up to two independen=
t monitors:
> > + * 1. System Monitor (MON__SYSTEM =3D 0):
> > + *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP,=
 HVS, PCIe/RP1).
> > + *    Directly memory-mapped via ARM physical IO memory space (MMIO).
> > + *    Read latency: ~10-20 nanoseconds (fast, atomic-safe, non-blockin=
g).
> > + *
> > + * 2. VPU Monitor (MON__VPU =3D 1):
> > + *    Monitors VideoCore VPU buses (VPU0/1 Data/Instruction L2/UC, SDR=
AM, etc.).
> > + *    Accessible through VideoCore firmware mailbox IPC (RPI_FIRMWARE_=
SET/GET_PERIPH_REG).
> > + *    Read latency: ~10-100 microseconds (IPC over VPU mailbox).
> > + *
> > + * Synchronization & Concurrency Model:
> > + * ------------------------------------
> > + * - Spinlock (pmu->lock):
> > + *   Protects active event array (events[]), event generation sequence=
 counters (event_gen[]),
> > + *   bus watcher allocation/refcounting, active_vpu_events counter, an=
d MMIO register updates
> > + *   (MON__SYSTEM) against SMP race conditions and ABA pointer recycli=
ng races.
> > + *
> > + * - Mutex (pmu->vpu_mutex):
> > + *   Serializes VideoCore Mailbox IPC transactions (MON__VPU) in proce=
ss context,
> > + *   preventing concurrent mailbox buffer corruption across multiple C=
PUs.
> > + *
> > + * - Cached Async VPU Reads & Multiplexing (MON__VPU):
> > + *   Polled periodically in process context by vpu_work when active_vp=
u_events > 0.
> > + *   Uses PERF_HES_UPTODATE state flag to safely establish counter bas=
elines during
> > + *   event rotation / multiplexing. User read() syscalls return cached=
 cumulative event counter
> > + *   instantly without blocking.
> > + */
>
> The patch description needs to go into details as to why both the MMIO
> and firmware interfaces are supported. The firmware interface requires
> you to play games with sleeping/non-sleeping context, I would really
> want to avoid that and just support the MMIO path exclusively, is that
> practical? If that means ditching support for Pi 1&2, that would be
> reasonable IMHO.

I agree that an MMIO-only path would be best, and for System-level
monitoring, it is exactly what we do. However, dropping the firmware
IPC path doesn't just ditch support for the Pi 1 & 2. The VideoCore
VPU monitoring requires the firmware mailbox interface on all SoCs up
through the Raspberry Pi 4 (BCM2711). Removing the firmware polling
thread would effectively kill all VPU performance profiling for the Pi
3, Pi 4, and Compute Modules 3/4.

The downstream vendor driver
(https://github.com/raspberrypi/linux/blob/rpi-6.18.y/drivers/perf/raspberr=
ypi_axi_monitor.c#L730)
similarly relies on this mailbox IPC bridging. My code in
rpi_axi_pmu__init does fall back to MMIO if the firmware node isn't
present, but  (as I understand things) physically mapping the VPU
blocks directly via MMIO on BCM2835-2711 hardware doesn't work. As
such the workqueue latency complexity is unfortunately a requirement
to support VPU profiling on anything older than a Pi 5.

> > +
> > +#include <linux/cpuhotplug.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/hrtimer.h>
> > +#include <linux/io.h>
> > +#include <linux/version.h>
> > +
> > +#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 13, 0)
> > +static inline void rpi_hrtimer_setup(struct hrtimer *timer,
> > +                                  enum hrtimer_restart (*function)(str=
uct hrtimer *),
> > +                                  clockid_t clock_id, enum hrtimer_mod=
e mode)
> > +{
> > +     hrtimer_init(timer, clock_id, mode);
> > +     timer->function =3D function;
> > +}
> > +#define hrtimer_setup rpi_hrtimer_setup
>  > +#endif> +#include <linux/lockdep.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/perf_event.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include <soc/bcm2835/raspberrypi-firmware.h>
> > +
> > +/* --- PLATFORM CONSTANTS & ENUMERATIONS --------------------------- *=
/
> > +
> > +/**
> > + * enum rpi_axi_chip - Supported Broadcom SoC generations
> > + * @CHIP_BCM2835: BCM2835 / BCM2836 / BCM2837 / BCM2711 (RPi 1-4, CM 1=
-4, Zero/W)
> > + */
> > +enum rpi_axi_chip {
> > +     CHIP_BCM2835 =3D 0,
> > +};
> > +
> > +enum monitor {
> > +     MON__SYSTEM =3D 0,
> > +     MON__VPU,
> > +     MON__MAX
> > +};
> > +
> > +/* Number of hardware bus watcher units per monitor */
> > +#define NUM_BUS_WATCHERS_PER_MONITOR 3
> > +
> > +/**
> > + * enum bcm2835_system_bus - AXI buses monitored by System Monitor on =
BCM2835-BCM2711 (RPi 1-4)
> > + * @BCM2835_SB__DMA_L2: DMA engine L2 cache interconnect bus
>
> Why the double underscore in the naming convention?

I'll change them to single underscores. In the perf tool we use double
underscores similar to how function names do, for example:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/parse-events.h#n57
But this doesn't appear to be kernel/driver style and so I'll use
single underscores.

> [snip]
>
> > +
> > +/* Hardware register offsets & control bitwise constants */
> > +#define GEN_CTRL                     0x00
> > +#define GEN_CTL_ENABLE_BIT           BIT(0)
> > +#define GEN_CTL_RESET_BIT            BIT(1)
> > +#define GEN_CTL_WATCH_BIT            BIT(2)
> > +
> > +#define BW_PITCH                     0x40
>
> Rather than pitch, maybe stride?

Done.

> > +#define BW0_CTRL                     0x40
> > +#define BW1_CTRL                     0x80
> > +#define BW2_CTRL                     0xc0
> > +
> > +#define BW_ATRANS_OFFSET             0x04
>
> That's confusing, so you are offsetting from the base of BW0_CTRL, that
> needs a comment to explain that offset choice.

Done.

> > +#define BW_ATWAIT_OFFSET             0x08
> > +#define BW_AMAX_OFFSET                       0x0c
> > +#define BW_WTRANS_OFFSET             0x10
> > +#define BW_WTWAIT_OFFSET             0x14
> > +#define BW_WMAX_OFFSET                       0x18
> > +#define BW_RTRANS_OFFSET             0x1c
> > +#define BW_RTWAIT_OFFSET             0x20
> > +#define BW_RMAX_OFFSET                       0x24
> > +
> > +#define BW_CTRL_RESET_BIT            BIT(31)
> > +#define BW_CTRL_ENABLE_BIT           BIT(30)
> > +#define BW_CTRL_ENABLE_ID_FILTER_BIT BIT(29)
> > +#define BW_CTRL_LIMIT_HALT_BIT               BIT(28)
> > +
> > +#define BW_CTRL_BUS_WATCH_SHIFT              0
> > +#define BW_CTRL_BUS_WATCH_MASK               GENMASK(5, 0)
> > +#define BW_CTRL_BUS_FILTER_SHIFT     8
> > +#define BW_CTRL_BUS_FILTER_MASK              GENMASK(12, 8)
> > +
> > +/*
> > + * RPI_AXI_PMU_TIMER_INTERVAL determines the background polling freque=
ncy
> > + * for VideoCore VPU Mailbox IPC counters.
> > + *
> > + * A balance is required:
> > + * - IPC Overhead: Polling overly fast (e.g., 10ms) generates excessiv=
e CPU
> > + *   wakeups and VideoCore IPC interrupts on older CPUs (Pi 1/2).
> > + * - Accuracy: Polling overly slow (e.g., 2000ms) causes short time-mu=
ltiplexed
> > + *   profiling sessions (under the interval) to mathematically strand =
residual
> > + *   counts since the mailbox cannot be queried synchronously inside p=
mu->read().
> > + *
> > + * 100ms (10 Hz) provides reasonably accurate profiling without heavy =
overhead.
> > + */
> > +#define RPI_AXI_PMU_TIMER_INTERVAL ms_to_ktime(100)
> > +
> > +static enum cpuhp_state rpi_axi_pmu_cpuhp_state;
> > +
> > +/* --- PMU API & CONFIG DECODING ---------------------------------- */
> > +
> > +#define PMU_NAME "rpi_axi_pmu"
> > +
> > +/**
> > + * config_to_filter() - Extracts AXI filter ID from perf event config
> > + * @config: 64-bit config value from struct perf_event_attr
> > + *
> > + * Return: Filter ID value (bits 10-14).
> > + */
> > +static int config_to_filter(__u64 config)
> > +{
> > +     return (config >> 10) & 0x1F;
>
> Can we have a definition for the shift and mask here?
>
> > +}
> > +
> > +/**
> > + * config_to_monitor() - Extracts Monitor ID from perf event config
> > + * @config: 64-bit config value from struct perf_event_attr
> > + *
> > + * Return: Monitor enum (bit 9: 0 =3D System, 1 =3D VPU).
> > + */
> > +static enum monitor config_to_monitor(__u64 config)
> > +{
> > +     return (config >> 9) & 1;
>
> Likewise.
>
> > +}
> > +
> > +/**
> > + * config_to_bus() - Extracts bus index from perf event config
> > + * @config: 64-bit config value from struct perf_event_attr
> > + *
> > + * Return: Bus index (bits 4-8).
> > + */
> > +static int config_to_bus(__u64 config)
> > +{
> > +     return (config >> 4) & 0x1F;
>
> Likewise
>
> > +}
> > +
> > +/**
> > + * config_to_counter() - Extracts metric counter type from perf event =
config
> > + * @config: 64-bit config value from struct perf_event_attr
> > + *
> > + * Return: Counter enum (bits 0-3).
> > + */
> > +static enum counter config_to_counter(__u64 config)
> > +{
> > +     return config & 0xF;
>
> And here as well.

For all, yes. Done.

> [snip]
>
> > +     for (int i =3D 0; i < MON__MAX; i++) {
> > +             rpi_axi_hw_events__init(&pmu->monitor[i].hw_events);
> > +
> > +             if (pmu->monitor[i].use_mailbox_interface) {
> > +                     struct resource *resource =3D platform_get_resour=
ce(pdev, IORESOURCE_MEM, i);
> > +
> > +                     if (!resource) {
> > +                             dev_err(dev, "Error reading mailbox resou=
rce %d\n", i);
> > +                             ret =3D -EINVAL;
> > +                             goto err_firmware_put;
> > +                     }
> > +                     pmu->monitor[i].mailbox =3D (u32)resource->start;
> > +             } else {
> > +                     struct resource *resource =3D platform_get_resour=
ce(pdev, IORESOURCE_MEM, i);
>
> Well you are fetching MMIO resources here, so you need a Device Tree
> description and you need to submit the Device Tree changes that describe
> these register ranges. Is it fair to assume only the RPi firmware path
> has been tested or did you also test with MMIO?

I tested with both, MMIO only on RPi 5 and firmware+MMIO for the
RPi400. I'm very ignorant of Device Tree YAML, but with AI help I can
generate, lint and test the file as an extra patch for the series.

> [snip]
> > +
> > +MODULE_LICENSE("GPL");
> Missing MODULE_AUTHOR() and MODULE_DESCRIPTION().

Done.

Thanks, the fixes will be incorporated into v12.
Ian

> --
> Florian
>


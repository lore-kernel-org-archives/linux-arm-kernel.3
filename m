Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D7C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 23:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFcodwmDIy+Gd4R7lV09KRPKxABL9MdXCvTTH0eN1Cc=; b=Y8POV+jBhl2JZXCKH9qr7a+N/3
	hAWpQQ4YHzeZXIzyYpbg8tIdScvTTU1fVtR8ydR1joc701QWvetEEZVmkEX0gsUeqFV2IRHEdQnXo
	ISm4pe0C9cpEa9VTfD4Dqf1h4S4q+HwKlUOhJqnKezmStR5J0MdLu/QQDp7kmNtNn7uG7sn1Hh10c
	axOWUFBFwtqOhZ9L5IriP2c1VF88qgFkFMTOSxf/8f7ZLLMV6ZWt9oXlqPY39XnIhdJNr0j3ZDjfP
	HVxuPd6rzLey4xyuvb8fuOD+fWdVAE6PNlRamq0GqnYkBoLHrlQny9XoQzh3NzJZV/uWDSZGlHNgC
	UheKXeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI2n-0000000H7QO-0uSG;
	Wed, 12 Aug 2026 23:07:33 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI2k-0000000H7Ph-30H4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 23:07:31 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c10e86e52so40321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 16:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786576049; cv=none;
        d=google.com; s=arc-20260327;
        b=H2WAVKml62hXs0/Hgtc+G/LQhgcaujSCYmUKJh5ohjwGMGb+KwvWs+k8uUhQT4e5RV
         907FfuLGGvfcxAb0ryFPIZWKTLOneykzqiT+dmkkoGrTFHjlWLNAOUeMhPx3XQEJvHbU
         E+/WOrbcWvof8MGJyNBlA3kObUxggVwf1OoRpUIpLFPryMa8BKNaNNVsGzG+poPW3tQB
         7QBAP9xHNeP8OJpV48d5Q3iAnDNrhdjn3e86IgglCrnO5cEOeTOvpiJuaTDbk/Px8rJb
         dZsGz5kaVl+0YK2Mjt7YLxtNZMsHTutuRKG68OSO00xrcuYWbAXg3A/f59PqnF8DSnP3
         4EIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFcodwmDIy+Gd4R7lV09KRPKxABL9MdXCvTTH0eN1Cc=;
        fh=9PwDbR+qmIsRHfIdLP4/kmXjaVKy56PkTSG2iXuJhA4=;
        b=KYTz5/7UUshCazjPkpMQ1UHS8L0j0LPzjKbdX4NztqGXTyjpDkdbTCwokM/VmQO5za
         xd7bNXuSZVDnZRrHbwtcf1JoIV5F5SmJAOBZQl9vOonSm0g6R6x4dhHC5V6DSiNkAEiq
         lZna/f3F571Q8W0GFXobLtCfy8S3KYUkUFIA6Inp2a61fM9utsHYJ1j3h3E22UiMlixW
         WUMBtolAlE7CuRfLQe2yjFhC7SYDppCY4RW1y6dL4AnOfW1BQz++hhx/2EOzpK8AE1vR
         7dmDHEAUv6rBX2Kwfzgyezbkzb3twILr020RNwfByBy0By1g+QMN7W3w4OPNVBOtwu4t
         k+ow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786576049; x=1787180849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFcodwmDIy+Gd4R7lV09KRPKxABL9MdXCvTTH0eN1Cc=;
        b=KBWggUtSeTi40LapeMqBqh54VtvmvF8HTMsE2af8I2FL8n7/GjCTubE3QBMBs5xojs
         PGzSxTKH5ahm7QyZHYbTnlt9IwfloHlGqBNIkfd/jzuxx+qs6ZFthFRDaYXX1IDWQ7CN
         L7QxsyJIbyHiJuMrO6t6Ldj10193b7n4TyeoDABu88qrxhadK25XyDMceSQwvvcGjSo/
         gEcZLqLvjwkvgEPcZpuuasVblHvUUB9hlilKVJKD5m2TyVcP/82uyttYyOB4x1UkUfAB
         fnJANzIlnt+bAw7AiHcl5k9Z80sZwt1mZ0mtRVHF4H6ePVtCx2FGIyyfwr8SuEVpNA5w
         9Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576049; x=1787180849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFcodwmDIy+Gd4R7lV09KRPKxABL9MdXCvTTH0eN1Cc=;
        b=niF/QauUKtfn1jJhUF/z/u01yBUIPZmA8BR2sR161VhKDESCZSi2dkCKBf5yHR1A0P
         tQ4e1SzlQwoIqJXjUATMuc8nQFLoJhp/clfFNfXk0I/korU15Z3WD6UQnL0gExsD5rrl
         XYyKND/Jw8388D32V64OnPyhc9K8NkUBn0DfsDxCWLS5WCXVgIswXNJqDplS+0DN9ezp
         16dk5IqhRPK4MIvU5Kputoasuf1qkNWInn60F9xN/+hAsXhlmxits+UvNFXSu7pperb8
         raryxxR9JlEfdTakboGZBx+hD+Svwk+VuuQGSjHXbPPt7Ll7shxST3vms2wTegcPA8vA
         gqtg==
X-Gm-Message-State: AOJu0YzS0Ug9U2olOTn9lOM36DjYLQOml0OTA+g8vF5wVNsLKalB6Q2O
	kam5NyBptmvsbT04fD9kDyUPffvHHc/X93Lx/NgHDFsgfmwh4R5l1G/U/LWKT5o84HiPEEzb2eW
	c42HzI8/YjRcMKxUKDLPBr/2j2IN4TKp7Mt3+FDGC
X-Gm-Gg: AR+sD13LU3IwWziAXzOqNsr6POwkImtWgL61Yb3HAYWnWFxMrw9v9Q5iAnLZIAwuRJi
	ad/foCcoX4hFXsZYXq5ftkNxHDXuV4/Hc/pXrSFzIkwPdzfisH9eZc3YudIgmyfGsQUYNh1nTh6
	IRVRLUvRapQpxqVLW7enelzZlHrylcCP73znUyK962tLA1B7y5fozW2ahp/eRtpzgHODqVXaiWm
	wxX6AnWlch8vt+JhrVvTmc8EM14yRYK1zX6ZOyf3vgQoA6LbmINkP0cCZWiQtKv57aC7Be9wOyE
	wUbj0vJIGg/Qb1f6QRlWt/003NXvjJMEfz2I3DVRCSDlJA==
X-Received: by 2002:a05:622a:8309:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-52d76e23471mr1528471cf.13.1786576048670; Wed, 12 Aug 2026
 16:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260812052417.2361040-1-irogers@google.com> <20260812230145.2644281-1-irogers@google.com>
In-Reply-To: <20260812230145.2644281-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Aug 2026 16:07:17 -0700
X-Gm-Features: AUfX_myXsv2K8Mqlk39c54O9OerfvDcM6ed2LHp_euFxlKHIDMHz8JbC7OpreR0
Message-ID: <CAP-5=fX_zxDai0A1mSEX-Q6os4drJLLh92o32rbdZsJ=C3YZoQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] perf: Add Raspberry Pi AXI PMU driver
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_160730_800594_32FE8A93 
X-CRM114-Status: GOOD (  25.88  )
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

On Wed, Aug 12, 2026 at 4:01=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> This patch series adds an uncore Performance Monitoring Unit (PMU) driver
> for Broadcom AXI system and VideoCore VPU performance monitors found on
> Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).
>
> Motivation & Background
> ------------------------
> Currently, Linux lacks a standard perf-API compatible driver for the
> Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prior
> out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
> kthreads, preventing integration with standard Linux perf tooling (`perf =
stat`,
> `perf list`, etc.).
>
> This driver implements standard `struct pmu` hardware uncore callbacks
> under `drivers/perf/`, exposing human-readable sysfs event aliases, unit
> scaling (`Bytes`), and bus filtering directly to user space.
>
> Key Architectural Improvements & Features
> ------------------------------------------
> 1. Standard Linux Perf Integration:
>    - Exposes uncore AXI interconnect events via `/sys/bus/event_source/de=
vices/rpi_axi_pmu/`.
>    - Supports event sampling and hardware counter accumulation (`local64_=
add`),
>      automatically managing 31-bit hardware counter wraparound across hig=
h-bandwidth
>      interconnect transfers.
>
> 2. CPU Hotplug Support (`cpuhp`):
>    - Registers dynamic CPU hotplug notifiers (`CPUHP_AP_ONLINE_DYN`).
>    - Automatically migrates PMU context (`perf_pmu_migrate_context`) to a=
n online
>      CPU core when a designated CPU goes offline, avoiding stale uncore s=
tate.
>
> 3. Hybrid Memory-Mapped & Mailbox Work Queue Architecture:
>    - System Monitor (MMIO): Performs fast atomic-safe memory reads (~15ns=
)
>      directly mapped over ARM physical memory space (`MON__SYSTEM`).
>    - VPU Monitor (Mailbox IPC): For Broadcom BCM2835-BCM2711 platforms (R=
Pi 1-4),
>      VideoCore VPU monitor IPC calls are offloaded to process context via=
 a dedicated
>      workqueue (`vpu_work`) and serialized under `vpu_mutex`. This avoids=
 atomic
>      sleeps or blocking in timer/interrupt context.
>
> 4. PREEMPT_RT & Safety Hardening:
>    - Uses HRTIMER_MODE_REL_SOFT for timer callbacks to execute in softirq=
 context,
>      ensuring spinlock acquisitions are 100% PREEMPT_RT safe.
>    - Sets suppress_bind_attrs =3D true to prevent unsafe manual sysfs unb=
inding while
>      active perf events exist.
>
> 5. SoC Generation Support:
>    - Patch 1 adds core driver support for Broadcom BCM2835-BCM2711 (RPi 1=
-4).
>    - Patch 2 expands support for Broadcom BCM2712 (Raspberry Pi 5), addin=
g PCIe RP1
>      Southbridge links, HEVC decoder, HVS display engine, and Cortex-A76 =
DSU L3
>      interconnect monitoring.
>
> Hardware Validation
> -------------------
> The driver has been validated on real hardware across multiple SoC genera=
tions:
> - Raspberry Pi 400 (BCM2711): Validated System L2, ARM CPU, and VideoCore=
 VPU
>   firmware mailbox IPC performance counters.
> - Raspberry Pi 5 (BCM2712): Validated live byte throughput across HVS dis=
play
>   refresh cycles, Cortex-A76 DSU L3 interconnect memory traffic, and PCIe=
 RP1
>   Southbridge transfers.
>
> Changes in v5
> -------------
> - Teardown UAF/Orphaning Fix: Reversed module exit logic, calling cpuhp_s=
tate_remove_instance()
>   *before* perf_pmu_unregister() to prevent accessing an unregistered PMU=
 in the offline
>   CPU handler during device removal, and to prevent event orphaning races=
 during hotplug.
> - VPU Hardware Watcher Leak Fix: In rpi_axi_pmu_del(), hardware disableme=
nt operations for VPU
>   bus watchers are now properly deferred to the vpu_work workqueue to avo=
id silently leaking
>   running hardware counters when the VPU monitor is no longer in use.
> - Grouped Event Start Bug Fix: Deprecated reliance on num_monitored =3D=
=3D 1 to initialize
>   the global bus watcher. Instead, use a dedicated monitor_running flag c=
orrectly to
>   start the global monitor when the first bus watcher gets enabled, mitig=
ating bugs when
>   adding grouped PMU events.
> - IPC Phantom Spikes Zero Fallback Fix: Modified rpi_axi_pmu_read_counter=
() to return U32_MAX
>   on IPC or MMIO hardware read failures, gracefully ignoring the delta ca=
lculation returning.
>   This fixes unsigned 31-bit huge spikes where delta (0 - old_count) & 0x=
7FFFFFFF occurred.
> - Code Comments: Added doc block comments inside rpi_axi_pmu_read(), rpi_=
axi_pmu_vpu_work_handler(),
>   and everywhere U32_MAX returns occur to document the explicit justifica=
tion for why U32_MAX indicates
>   failure (valid counters are 31-bit) and why the driver drops the sample=
 to avoid artificial spikes.
> - VPU Data Race Lockdep Fix: Rewrote locking hierarchy inside vpu_work_ha=
ndler(). PMU spinlock
>   is now correctly held across rpi_axi_pmu_enable_bus_watcher() unconditi=
onally since the function
>   touches active monitor registers directly via MMIO, dropping it purely =
for mailbox IPC reads.
> - Hrtimer Add/Del Forward Concurrency Warning Fix: rpi_axi_pmu_timer_hand=
ler() now executes
>   hrtimer_forward_now() *before* releasing the PMU spinlock, fully mitiga=
ting timer enqueue races
>   resulting from a simultaneous parallel pmu->add()/pmu->del().
> - VPU Start Asynchronous Latency: Added explicit schedule_work(&pmu->vpu_=
work) call inside
>   rpi_axi_pmu_start() when starting VPU-tracked events so they begin imme=
diately instead of
>   waiting for a 2-second timer interrupt period for short workloads.
> - Event Stop Read-Modify-Write Spinlock Protection: Moved event->hw.state=
 modifications inside
>   rpi_axi_pmu_stop() under the local CPU PMU irqsave spinlock to safeguar=
d atomic bitwise flags
>   against the timer handler or workqueue updates.
> - BCM2712 Pre-probe Initializer UAF race: Shifted perf_pmu_register() to =
the very end of
>   rpi_axi_pmu__init() to ensure all hardware structures and CPU HP bindin=
gs securely exist prior to
>   exposing the PMU to userspace tools preventing devres unregistration me=
mory faults.
> - BCM2712 ARM CPU L2 Event Correction: Corrected the bus index for the Co=
rtex-A76 Cores PMU event
>   aliases to bus=3D14 (BCM2712_SB__CPU_L2) to match architectural routing=
 specifications on the RPi 5.
> - BCM2712 JPEG Bus Monitor Visibility: Stopped improperly hiding the lega=
cy JPEG bus aliases in the
>   is_visible() callback on BCM2712 chips.
> - BCM2712 Custom Event Replacements: Created specific BCM2712 equivalents=
 for peripheral_rtrans/wtrans
>   and cpu_uc_rtrans/wtrans since raw bus mappings shifted structurally on=
 VideoCore VII.

Sorry, inadvertently added TAG=3Dagy. Will resend with this removed.

Thanks,
Ian

> Ian Rogers (2):
>   perf: Add Raspberry Pi BCM2835 AXI PMU driver
>   perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
>
>  drivers/perf/Kconfig       |   10 +
>  drivers/perf/Makefile      |    1 +
>  drivers/perf/rpi_axi_pmu.c | 2078 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2089 insertions(+)
>  create mode 100644 drivers/perf/rpi_axi_pmu.c
>
> --
> 2.55.0.679.g6767b8d81c-goog


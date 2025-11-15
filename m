Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B06CEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/FG4Wv2yzpc6XTk4ytRAyYbGsSHLi20bNidAtF6BPo=; b=boVV5LI11yMqOFNg1sF8JHf1TC
	ghBkCS4LD5LKDwtt2UA11IOUjFEAUbt0YRrsnto69+8RsGw815HTXDLI3inCSdaUg57p3boX1eUrH
	GU2HrBN/6NG+bcEbcFxhVkIXIpPf/lUV/Z3nf4UT943I3nC5LFbK6x1vE7u66/mfNThPuOd9nIOEG
	GMr3P71v0qT7XVofGjxFmMII/X4hWxUnX1KPUUCUPkCuZTAlt5aFe1OTW13yBVHrjljEp8+qHiwmT
	yvX7thBeJGfyb1vyFQYKKutnHzhOjbTkHknieZCetPIsEdUsABw3PpXLAHF0XAaKncNZUGnW/S/+a
	3jC29YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9P-0000000DbvG-0j57;
	Sat, 15 Nov 2025 09:00:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9M-0000000DbuS-2YPP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:00:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4775895d69cso14921355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197250; x=1763802050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/FG4Wv2yzpc6XTk4ytRAyYbGsSHLi20bNidAtF6BPo=;
        b=iGvynbGK7DXIPkiiLwXUC4A12jviXdogYsZ9IfPlVfXQ3ESMaG7vlQKKlmu7t3JBqm
         9JiqXAOzVOW4SbF9t3TDikrm74CleBzJIXGe0wHV0dbcib+S92fJ0387Ke5WM3Oxq+UJ
         E2DG8BtlXjVkxbRXZmZ0TremUhop6oxkoh6p1WCpijo9utyaDGQuaXC0v6co34vOExaK
         qwc7WNQzK/QsYqZZ0/C9UFT0m01IPyq/4+GsKJJ6CV/1ixXyE91UxA7BKbiozmKYBQyu
         fUv9jeGHSNsE12F7glD0W8hlJdXHC11WSGaRxobx7FiaM4Y06HQ8xD8grnK4JJRRu3Z1
         y3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197250; x=1763802050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/FG4Wv2yzpc6XTk4ytRAyYbGsSHLi20bNidAtF6BPo=;
        b=wISX3MclMRcc58+uhU8Jg/3SMQpCdTw7vRoIroiBO4pkVyKATVEkxtRp05xgW9Medw
         A87WhBLgXqtKd1qj6le+XO94kEJmfAYiWaqD72dxq6CGZt1L4czK3hHrazhhKWP5Ef0A
         dEHkSS3dbcwJKcrPbpesThpkksf29Ou0plpE4GdK1oesRuYq/h6xAUndyNHMuAGURuck
         wmUEAz48u2bD6Vppci7fGEiKkZCh8+XH9aq7bdYU5Q/jUJtG6A8yA3d8TaUX+l2hd2Wl
         JGfsEdXmyTq4XPmNCcz/8lr3BMOjP2IR8DGBb8KathjCWfu5uPiQo1LbrioM8yPMrusU
         +WdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr6C4bGAt6rsBqwWP051fHOvZK6z7uwWXDt08wVPet6FWjB7P0b88qME1PiX9xj9bT8ohl8rq2awSlWRxKzMMl@lists.infradead.org
X-Gm-Message-State: AOJu0YwBY0vGoaZFTvJXDm4C4BleZcyTnDeYVQPwc8szvH2gSaK1luRJ
	7XkSjPPYUpug50EnFqrJLyJDlTSGlpQ97n/7j1IxDC1ErZqp9V53e/G2
X-Gm-Gg: ASbGnctrFJNTeohtfUk8OGAF59tiVeym6tnbzFBoc4d+MTgJt2WeqVoL2/5FLf9SiY8
	e1H83WTnSOP/cGxiky7untjbEa3taDP9M4kszBInVYN75ZGan5zioz7uOlm+es/ZoShsJrWKMka
	nyhOLdEwJcAkafuzuP6WnDPvIOowMfX5ErBdjP1qY6cU8pXM8o8KMy80KixR7qoCb7orLSBTQ0/
	dPKcJvM2DommlEHoQT+XUC7D3j5fXwEreXVeXAfD5j5t0LX0g/WJgubFbxt1369zWl1QIvne6af
	VywcfkAcgDUMsewdNa8VcYdZv4YgAM0omGtsqHUypBULvVyMGqiEelVRfwzE4TD3xC+HRnju6NS
	qU9JisPVxXfWdQyblmMj/iF6cYanChWFT5Dd+TDqZORaCQI9q+H0jdl76QY8Mt0pq8mw7ci0XgT
	i6RwM4B1UpDNm0yAjys5AhNpZUPbLlSZTN6PRL3u7XqMaGYqA7s12q8S7DqGzMSv/OtJBr
X-Google-Smtp-Source: AGHT+IHKzYERexCacs/Q5yKJvm0zjIs4CrHo/8nTkrtDYu+DEwl/oT7LDhhSdgl1W/LCLyMV8AfECw==
X-Received: by 2002:a05:600c:c4aa:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-4778fea8cbemr51354805e9.24.1763197249912;
        Sat, 15 Nov 2025 01:00:49 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm200541545e9.9.2025.11.15.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] syscore: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:36 +0100
Message-ID: <20251115090044.3140331-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010052_708611_AF774F95 
X-CRM114-Status: GOOD (  15.65  )
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

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-syscore

for you to fetch changes up to a97fbc3ee3e2a536fafaff04f21f45472db71769:

  syscore: Pass context data to callbacks (2025-11-14 10:01:52 +0100)

This is a cross-arch/subsystem patch that is a prerequisite for several
subsequent changes that I plan on getting in after v6.19-rc1. This is
purely an API change, so no functional changes are intended.

I've done extensive build testing to make sure all files are covered,
but a last-minute build problem was reported two days ago. This was due
to a #ifdef block for a configuration symbol that wasn't covered. That's
now fixed, but it might be a good idea to give this an extra few days in
next before merging it, just in case there's something else I missed.

Thanks,
Thierry

----------------------------------------------------------------
syscore: Changes for v6.19-rc1

Add a parameter to syscore operations to allow passing contextual data,
which in turn enables refactoring of drivers to make them independent of
global data. This initially only contains the API changes along with the
updates for existing drivers. Subsequent work will make use of this to
improve drivers.

----------------------------------------------------------------
Thierry Reding (1):
      syscore: Pass context data to callbacks

 arch/arm/mach-exynos/mcpm-exynos.c        | 12 +++--
 arch/arm/mach-exynos/suspend.c            | 48 +++++++++++-------
 arch/arm/mach-pxa/generic.h               |  6 +--
 arch/arm/mach-pxa/irq.c                   | 10 ++--
 arch/arm/mach-pxa/mfp-pxa2xx.c            | 10 ++--
 arch/arm/mach-pxa/mfp-pxa3xx.c            | 10 ++--
 arch/arm/mach-pxa/pxa25x.c                |  4 +-
 arch/arm/mach-pxa/pxa27x.c                |  4 +-
 arch/arm/mach-pxa/pxa3xx.c                |  4 +-
 arch/arm/mach-pxa/smemc.c                 | 12 +++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        | 12 +++--
 arch/arm/mach-s5pv210/pm.c                | 10 ++--
 arch/arm/mach-versatile/integrator_ap.c   | 12 +++--
 arch/arm/mm/cache-b15-rac.c               | 12 +++--
 arch/loongarch/kernel/smp.c               | 12 +++--
 arch/mips/alchemy/common/dbdma.c          | 12 +++--
 arch/mips/alchemy/common/irq.c            | 24 ++++++---
 arch/mips/alchemy/common/usb.c            | 12 +++--
 arch/mips/pci/pci-alchemy.c               | 16 +++---
 arch/powerpc/platforms/cell/spu_base.c    | 10 ++--
 arch/powerpc/platforms/powermac/pic.c     | 12 +++--
 arch/powerpc/sysdev/fsl_lbc.c             | 12 +++--
 arch/powerpc/sysdev/fsl_pci.c             | 12 +++--
 arch/powerpc/sysdev/ipic.c                | 12 +++--
 arch/powerpc/sysdev/mpic.c                | 14 ++++--
 arch/powerpc/sysdev/mpic_timer.c          | 10 ++--
 arch/sh/mm/pmb.c                          | 10 ++--
 arch/x86/events/amd/ibs.c                 | 12 +++--
 arch/x86/hyperv/hv_init.c                 | 12 +++--
 arch/x86/kernel/amd_gart_64.c             | 10 ++--
 arch/x86/kernel/apic/apic.c               | 12 +++--
 arch/x86/kernel/apic/io_apic.c            | 17 +++++--
 arch/x86/kernel/cpu/aperfmperf.c          | 20 +++++---
 arch/x86/kernel/cpu/intel_epb.c           | 16 +++---
 arch/x86/kernel/cpu/mce/core.c            | 14 ++++--
 arch/x86/kernel/cpu/microcode/core.c      | 15 ++++--
 arch/x86/kernel/cpu/mtrr/legacy.c         | 12 +++--
 arch/x86/kernel/cpu/umwait.c              | 10 ++--
 arch/x86/kernel/i8237.c                   | 10 ++--
 arch/x86/kernel/i8259.c                   | 14 ++++--
 arch/x86/kernel/kvm.c                     | 12 +++--
 drivers/acpi/pci_link.c                   | 10 ++--
 drivers/acpi/sleep.c                      | 12 +++--
 drivers/base/firmware_loader/main.c       | 12 +++--
 drivers/base/syscore.c                    | 82 ++++++++++++++++---------------
 drivers/bus/mvebu-mbus.c                  | 16 +++---
 drivers/clk/at91/pmc.c                    | 12 +++--
 drivers/clk/imx/clk-vf610.c               | 12 +++--
 drivers/clk/ingenic/jz4725b-cgu.c         |  2 +-
 drivers/clk/ingenic/jz4740-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4755-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4760-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4770-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4780-cgu.c          |  2 +-
 drivers/clk/ingenic/pm.c                  | 14 ++++--
 drivers/clk/ingenic/pm.h                  |  2 +-
 drivers/clk/ingenic/tcu.c                 | 12 +++--
 drivers/clk/ingenic/x1000-cgu.c           |  2 +-
 drivers/clk/ingenic/x1830-cgu.c           |  2 +-
 drivers/clk/mvebu/common.c                | 12 +++--
 drivers/clk/rockchip/clk-rk3288.c         | 12 +++--
 drivers/clk/samsung/clk-s5pv210-audss.c   | 12 +++--
 drivers/clk/samsung/clk.c                 | 12 +++--
 drivers/clk/tegra/clk-tegra210.c          | 12 +++--
 drivers/clocksource/timer-armada-370-xp.c | 12 +++--
 drivers/cpuidle/cpuidle-psci.c            | 12 +++--
 drivers/gpio/gpio-mxc.c                   | 12 +++--
 drivers/gpio/gpio-pxa.c                   | 12 +++--
 drivers/gpio/gpio-sa1100.c                | 12 +++--
 drivers/hv/vmbus_drv.c                    | 14 ++++--
 drivers/iommu/amd/init.c                  | 16 +++---
 drivers/iommu/intel/iommu.c               | 12 +++--
 drivers/irqchip/exynos-combiner.c         | 14 ++++--
 drivers/irqchip/irq-armada-370-xp.c       | 12 +++--
 drivers/irqchip/irq-bcm7038-l1.c          | 12 +++--
 drivers/irqchip/irq-gic-v3-its.c          | 12 +++--
 drivers/irqchip/irq-i8259.c               | 12 +++--
 drivers/irqchip/irq-imx-gpcv2.c           | 16 +++---
 drivers/irqchip/irq-loongson-eiointc.c    | 12 +++--
 drivers/irqchip/irq-loongson-htpic.c      | 10 ++--
 drivers/irqchip/irq-loongson-htvec.c      | 12 +++--
 drivers/irqchip/irq-loongson-pch-lpc.c    | 12 +++--
 drivers/irqchip/irq-loongson-pch-pic.c    | 12 +++--
 drivers/irqchip/irq-mchp-eic.c            | 12 +++--
 drivers/irqchip/irq-mst-intc.c            | 12 +++--
 drivers/irqchip/irq-mtk-cirq.c            | 12 +++--
 drivers/irqchip/irq-renesas-rzg2l.c       | 12 +++--
 drivers/irqchip/irq-sa11x0.c              | 12 +++--
 drivers/irqchip/irq-sifive-plic.c         | 12 +++--
 drivers/irqchip/irq-sun6i-r.c             | 18 ++++---
 drivers/irqchip/irq-tegra.c               | 12 +++--
 drivers/irqchip/irq-vic.c                 | 12 +++--
 drivers/leds/trigger/ledtrig-cpu.c        | 14 ++++--
 drivers/macintosh/via-pmu.c               | 12 +++--
 drivers/power/reset/sc27xx-poweroff.c     | 10 ++--
 drivers/sh/clk/core.c                     | 10 ++--
 drivers/sh/intc/core.c                    | 12 +++--
 drivers/soc/bcm/brcmstb/biuctrl.c         | 12 +++--
 drivers/soc/tegra/pmc.c                   | 17 ++++---
 drivers/thermal/intel/intel_hfi.c         | 12 +++--
 drivers/xen/xen-acpi-processor.c          | 12 +++--
 include/linux/syscore_ops.h               | 15 ++++--
 kernel/cpu_pm.c                           | 12 +++--
 kernel/irq/generic-chip.c                 | 14 ++++--
 kernel/irq/pm.c                           | 11 +++--
 kernel/printk/printk.c                    | 11 +++--
 kernel/time/sched_clock.c                 | 22 +++++++--
 kernel/time/timekeeping.c                 | 22 +++++++--
 virt/kvm/kvm_main.c                       | 18 ++++---
 109 files changed, 898 insertions(+), 470 deletions(-)


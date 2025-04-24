Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1188CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Gp3+Ahd9oztFC0Ee90Z+LBETEK7lh7obhrs3g0E+vA=; b=c7uf8kEeaWhfW0FZjvWZqA5SXz
	HmvVfzZRq/noMTUmD3eAN19bIBAOxA+AIRetwVZwE2dbH14ENQzAgFiR2SbiCDt6kHhk2eDISfCLD
	RxWR+hp8A6ZUIVSXj8NVH3AQllvrfWG6pg+f0/jcxPfnQEzpiEYbzglQdlDH4i5FH6BjqxbM5rhpz
	yNLKNIs0ammZKiP4SRjIDazr/nVaeN3zfUA1VfFztn2ljlQfFbPeRnfHOpFmHaYYoxRAiZGQTj7Lc
	PAzfmo8eD+sRL+Bt7F4r+5exJ70vJKOqHq6jpWheeNJZgVANYLbBEToZ6CSaHtWJEcJONvVn61fs0
	hgY9Vysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4o-0000000EcZm-157w;
	Thu, 24 Apr 2025 16:05:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKl-0000000EKbG-3fyj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1374743f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504025; x=1746108825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Gp3+Ahd9oztFC0Ee90Z+LBETEK7lh7obhrs3g0E+vA=;
        b=Obfzr7jbeuFiARtthVCStkqTmII2jCdU+HCgM6qvtGV5bqCZEG7jQPA3G3c/RIIVXy
         GB305JsXrbZxyvNLclUZwngjnQET/C9zLtNXDMuegiLa7mPbxdFoH1JdjWoEmQZDM+Iw
         XBzER96aBbA1xafdXSVpK62GY4BxV+eFI/aBaOxctX+6vTDSSwH0V1acoTSI8yc7FP4X
         w3152er6y2YI+gCo/GXkhaXOV5AR6/7y/i92HmH/mXXgtB1WOPMTYMqXe3V0bIAxWyez
         Hs2FMzkT8pcm6AM+vc6TUdBAm7xyepPRQFTOMYsBvP8Bz7MJ2rubd+qAalNH6SGXTKA6
         rQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504025; x=1746108825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Gp3+Ahd9oztFC0Ee90Z+LBETEK7lh7obhrs3g0E+vA=;
        b=rrn4vrGObEnT+Rd24pkvyI65T0p7fVBZUoH3PTDdnhqsQT/ycKOG59FV7yb6qxsUr0
         0103cbS238kVuO0liYDe3U+D8olwc8NEtBajOQnezz8PAu1v6OjPCGyd2i+2gFBGBztu
         Bi8bLnihpGRYHGqeBusGf0BryBp9vLH7retS2x0GScF3xNIj7WQCCFOyA5b3CTgNkVtR
         lX/ZZWkf4IAGJUYvoXUKPkcdBieEZWtet1VTvrrbCLTbundWYNfhacHW9/NfkS6Hl48i
         tQ5n0P3GbGVXnKjyGf/n7IBXt7RzWmfEy+fDXXRsggSOX8CJDcCj1JzKTd/Kga9yVxup
         dtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWnuH6vo7j0MHYFglVWVVcF2dK3dKgw+bblKPillNc0MTmnbOWK7PqDsHEz7JU60xGHQr6MdCqOtrhGZZmt7Y7@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/BJShcQqPL5Bk0GjYObZXRu7vbFizWpy4ZWX1ROzrGnCUn/P
	VeHsrouq6gWQ2+cGeAu41vWxrfz2rolt2jv3dzbjBom3ULya+owQuim7PzxfZ/o=
X-Gm-Gg: ASbGnctSmnhrF22Xudk8aOlwmUuygoi9RddhBTQuSu/pxMx7x0Drpj1Y64mDd2krIB3
	QlH6TvUAB8iTt35k5Pr5TOzZpMwiWFfkccruyFJM1ZmJkEVG2W6X9EYRuJv0ZR5fNYEbSl/403P
	bV/yX7hGT4Y/trEMKicz79v5IAuqIAhHPjJuqlDPcajPXEWMwea5rOobim6Fp4Um3XgTtw+P61E
	/mpM/2ALSS/6s80123YYI2ZAkTnohOxqVdEa0wExHadepPkG/YvulH/HH6Vy4EbC7JodX7KaLCZ
	wYTNmFchCE69H+V1gjXIPkDHupsvQpSEHXQF87M3Lej6p7Bz989kk0AwYTvwZzG3f36fFmja4Et
	pthe4YrLq5Hx3pCJ0
X-Google-Smtp-Source: AGHT+IG84/KbH73HJzgia5gWQQPbSCf6KDXX629rg6dbolYAjXdYgdIHXLTmBvWlH/T2NybxvuuICA==
X-Received: by 2002:a05:6000:4304:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-3a06cfb31damr2275855f8f.58.1745504025160;
        Thu, 24 Apr 2025 07:13:45 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:44 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 00/34] Running Qualcomm's Gunyah Guests via KVM in EL1
Date: Thu, 24 Apr 2025 15:13:07 +0100
Message-Id: <20250424141341.841734-1-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071347_918837_2C42A0D6 
X-CRM114-Status: GOOD (  23.28  )
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

This series introduces the capability of running Gunyah guests via KVM on
Qualcomm SoCs shipped with Gunyah hypervisor [1] (e.g. RB3 Gen2).

The goal of this work is to port the existing Gunyah hypervisor support from a
standalone driver interface [2] to KVM, with the aim of leveraging as much of the
existing KVM infrastructure as possible to reduce duplication of effort around
memory management (e.g. guest_memfd), irqfd, and other core components.

In short, Gunyah is a Type-1 hypervisor, meaning that it runs independently of any
high-level OS kernel such as Linux and runs in a higher CPU privilege level than VMs.
Gunyah is shipped as firmware and guests typically talk with Gunyah via hypercalls.
KVM is designed to run as Type-2 hypervisor. This port allows KVM to run in EL1 and
serve as the interface for VM lifecycle management,while offloading virtualization
to Gunyah.

This series is heavily based on previous work from Elliot Berman and others,
available at:
https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

Many commits in this series are identical to or derived from previous work. To
preserve authorship and attribution, original `Author:` and `Signed-off-by:` tags
have been retained where appropriate, and occasionally `Reviewed-by:` lines were
kept as well.

While this series builds on much of the original Gunyah implementation, it drops
certain parts in favor of existing upstream features:
  - `gunyah_memfd` is dropped (currently using pinned anonymous pages — see below).
  - `gunyah_irqfd` is dropped in favor of KVM's irqfd.
  - Resource management, vCPU creation, and VM lifecycle are integrated directly
    into KVM’s architecture hooks.

At this stage, the port is functional but still **work in progress**. Notably:
  - Memory for guests is currently backed by **pinned anonymous pages**. This is a
    temporary solution: we intend to migrate to `guest_memfd`.
  - Memory compaction or swap must be avoided for now, as pages donated to Gunyah
    are no longer accessible from the host once mapped into the guest.
  - SMP boot is not available at the moment because Gunyah does not yet
    forward PSCI hypercalls to the host.
  - Virtio is not supported yet.

There is a lot of room for performance improvment. For example, ATM.
there is a lot of privilege level switching between EL1, EL2 (and
possible EL3). As well as context swicthing between guest kernel space
and guest userspace. For those interested, I have a compiled some slides
here to summarise the issues:
https://docs.google.com/presentation/d/1fL1TM1oxBrWFSL8KKw4jQtMDh7NOvyqbWWVu8iQxvoI/edit?usp=sharing

To test the port, a modified version of Qemu is needed. A version can be
found here:
https://github.com/karim-manaouil/qemu-for-gunyah

The series is based on linux-next as of today. A git tree is also
available here (gunyah-kvm branch):
https://github.com/karim-manaouil/linux-next

To test the guest, run (with the modified qemu):
./qemu-system-aarch64 \
	-enable-kvm \
	-machine virt,highmem=off \
	-cpu host \
	-smp 1 \
	-m 1G \
	-nographic \
	-kernel Image \
	-initrd initrd.img \
	-append "console=ttyAMA0 earlycon rdinit=/bin/sh"

Feedback Welcome!

[1] https://www.qualcomm.com/developer/blog/2024/08/learn-about-gunyah--qualcomm-s-open-source--lightweight-hypervis
[2] https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

Elliot Berman (20):
  docs: gunyah: Introduce Gunyah Hypervisor
  dt-bindings: Add binding for gunyah hypervisor
  gunyah: Common types and error codes for Gunyah hypercalls
  gunyah: Add hypercalls to identify Gunyah
  gunyah: Add hypervisor driver
  gunyah: Add hypercalls to send and receive messages
  gunyah: Add resource manager RPC core
  gunyah: Add VM lifecycle RPC
  gunyah: Translate gh_rm_hyp_resource into gunyah_resource
  gunyah: Add resource tickets
  gunyah: Add hypercalls for running a vCPU
  gunyah: Add hypercalls for demand paging
  gunyah: Add memory parcel RPC
  gunyah: Add interfaces to map memory into guest address space
  gunyah: Add platform ops on mem_lend/mem_reclaim
  gunyah: Add Qualcomm Gunyah platform ops
  gunyah: Share guest VM dtb configuration to Gunyah
  gunyah: Add RPC to enable demand paging
  gunyah: Add RPC to set VM boot context
  gunyah: Add hypercalls for sending doorbell

Karim Manaouil (14):
  KVM: Allow arch-specific vCPU allocation and freeing
  KVM: irqfd: Add architecture hooks for irqfd allocation and
    initialization
  KVM: irqfd: Allow KVM backends to override IRQ injection via set_irq
    callback
  KVM: Add weak stubs for irqchip-related functions for Gunyah builds
  KVM: Add KVM_SET_DTB_ADDRESS ioctl to pass guest DTB address from
    userspace
  KVM: gunyah: Add initial Gunyah backend support
  KVM: gunyah: Pin guest memory
  gunyah: Add basic VM lifecycle management
  gunyah: add proxy-scheduled vCPUs
  gunyah: Share memory parcels
  gunyah: Enable demand paging
  gunyah: allow userspace to set boot cpu context
  KVM: gunyah: Implement irqfd interface
  KVM: gunyah: enable KVM for Gunyah

 .../bindings/firmware/gunyah-hypervisor.yaml  |   82 +
 Documentation/virt/gunyah/index.rst           |  135 ++
 Documentation/virt/gunyah/message-queue.rst   |   68 +
 Documentation/virt/index.rst                  |    1 +
 arch/arm64/Kbuild                             |    1 +
 arch/arm64/gunyah/Makefile                    |    3 +
 arch/arm64/gunyah/gunyah_hypercall.c          |  279 +++
 arch/arm64/include/asm/gunyah.h               |   57 +
 arch/arm64/include/asm/kvm_host.h             |   10 +-
 arch/arm64/include/asm/virt.h                 |    7 +
 arch/arm64/kernel/cpufeature.c                |    4 +
 arch/arm64/kernel/image-vars.h                |    2 +-
 arch/arm64/kvm/Kconfig                        |   22 +-
 arch/arm64/kvm/Makefile                       |   14 +-
 arch/arm64/kvm/gunyah.c                       | 2085 +++++++++++++++++
 drivers/virt/Kconfig                          |    2 +
 drivers/virt/Makefile                         |    1 +
 drivers/virt/gunyah/Kconfig                   |   29 +
 drivers/virt/gunyah/Makefile                  |    7 +
 drivers/virt/gunyah/gunyah.c                  |   55 +
 drivers/virt/gunyah/gunyah_platform_hooks.c   |  117 +
 drivers/virt/gunyah/gunyah_qcom.c             |  220 ++
 drivers/virt/gunyah/rsc_mgr.c                 |  792 +++++++
 drivers/virt/gunyah/rsc_mgr_rpc.c             |  572 +++++
 include/kvm/arm_pmu.h                         |    2 +-
 include/linux/gunyah.h                        |  425 ++++
 include/linux/gunyah_rsc_mgr.h                |  182 ++
 include/linux/irqchip/arm-vgic-info.h         |    2 +-
 include/linux/kvm_host.h                      |    3 +
 include/linux/kvm_irqfd.h                     |    5 +
 include/linux/perf/arm_pmu.h                  |    2 +-
 include/uapi/linux/kvm.h                      |   14 +-
 virt/kvm/eventfd.c                            |   56 +-
 virt/kvm/kvm_main.c                           |   24 +-
 34 files changed, 5258 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 create mode 100644 Documentation/virt/gunyah/index.rst
 create mode 100644 Documentation/virt/gunyah/message-queue.rst
 create mode 100644 arch/arm64/gunyah/Makefile
 create mode 100644 arch/arm64/gunyah/gunyah_hypercall.c
 create mode 100644 arch/arm64/include/asm/gunyah.h
 create mode 100644 arch/arm64/kvm/gunyah.c
 create mode 100644 drivers/virt/gunyah/Kconfig
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/gunyah.c
 create mode 100644 drivers/virt/gunyah/gunyah_platform_hooks.c
 create mode 100644 drivers/virt/gunyah/gunyah_qcom.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr_rpc.c
 create mode 100644 include/linux/gunyah.h
 create mode 100644 include/linux/gunyah_rsc_mgr.h

-- 
2.39.5



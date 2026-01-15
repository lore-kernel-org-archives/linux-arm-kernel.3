Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB96D4116C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MASScfCP1EDzrcxDg5IdgyEQHS3BC9CGtRRE53o2vFY=; b=tZ3XpysznNzTkF9zaLjnyd+8JJ
	X7DtCouuS2D7VoVErOTKme/p/4nGoW+fKBBEu/I616PHnvZIlc2dtrn9gJcY+5uVx4mWaYShTr8kD
	jU2tq2tNNA4VppmDubu+l4xR3qeFld0B97ZYkDIMJLKRb/zeRiytkKhTOmNdL6zqaaYaa2ZGwi7Fp
	3HaFYdecoGYq8QR/HugM0CM6A26GMj3Wpk1+iRvX8vv1qvsmYW/cdU9dIuVLBsSIwqT5YmiAGnzbU
	1fguTjbuVydLQ4SDiu9oflBtCrWezfD1YYB+AqAeRcRNJCCcnsGsvhiXU5qzoBu6dB1apI7sXL2Go
	UJvooMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLJF-0000000CCak-1rGU;
	Thu, 15 Jan 2026 11:14:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLJC-0000000CCaH-06lX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:14:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b87003e998bso315829166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768475671; x=1769080471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MASScfCP1EDzrcxDg5IdgyEQHS3BC9CGtRRE53o2vFY=;
        b=FECgfN7eqwll+IYgza7lsC3lN9XFc71bhjbGyQ+pc4nQ+RnjjlYBnwQAPQZpR/OVqY
         T8IZdFIpI8OjFFvbRPSeHWUinO+D4fEK//2fnAIkvUg8Aw2qQutcCITKm65zetLo0b4O
         3V4HuMxqEhaQF033T+77sQ6xsZYxMwvjUw4SeZm5ljqPPNF0SNbt2BlwLLuvkOzTnuUV
         /mZ/1yt58+lFtuDp4Cd6t4+IVVqsdkc5IN8aSKMh4pCVdCVyNYrw75ShKLOT3Fp5q8zb
         9NkK4XAR2qna46oxbp/VQYhem6Q6/LOAeSTDNxM+47jja/21urX+PVv+oBHt9VGL/sEW
         aBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475671; x=1769080471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MASScfCP1EDzrcxDg5IdgyEQHS3BC9CGtRRE53o2vFY=;
        b=kjmeIUMJiozVVy3iV+JWxZ731ZFEosArqW4JXt+ASpOO4ylvX7UcLArnNV7/3p2dOO
         pCVlud5sLXhluObgs9+iupY3mOcxrV2J9JNNw4WloPfE46yVK4Suil27T8quPD9UG6+s
         lr557fAfBH79zNpnr2BeduOoqOsQO4EmXJAhxqANI3jYOcT+zSfhnvmPyPcmmjx2HXmL
         LiLY87WZAMjDs5e7LVlhbi1TjtOUPrnapyxEHuYuPtUHfaGQUvLV5inzE8V5Fiw/8Xwe
         qCa7QLyffBUnyYJCfZJPbCrzgerfsjV9eLoMMQD+XM4DGdCbUq8Ys3BxDyVP2H6CB8Y7
         XW1A==
X-Forwarded-Encrypted: i=1; AJvYcCVmx7WrCmjMDYRFw8Jdzcu7kFGnj5WfjtDsHxqGmA2/0HXvIDq/wFYDcT+ubzWlvmjbWOsWup0GgfRVCBQDCYv7@lists.infradead.org
X-Gm-Message-State: AOJu0YxGMVVGqq2Xti6+IiTqyT5g4KeHo8KiNwQuuStllmkOgQt/zmgC
	cJya5OBjoE+9JJwlbXwMnG5y5QCouaaZiniNf4UaTAiWAl08uDJ2aklyU8i+ve3hQhB8Wa98CfC
	czT6wh/WjydejGH7a63XKShvGyabz0NbFIyVJbwrR
X-Gm-Gg: AY/fxX6aDycr8b13NQ+M84FkQx3P0LgUtDAobOu27BBxbZAxnVGh/1FngJA84/WTq54
	5mOuJZVjKRRI3Cazjwb1ZqBm6BoB+01FntPKpXjWWrac0uoAzSlyjXYgkSMKrtDBv6emcEqYJah
	t9l/fMqWWSxT/jMEaAf9NYCHwiQXnNvOUYVmhLZGL7o7Sw7tIvOHRIDu5QwJGO5jKGyX9JMoKvU
	KxvAVm34k918n7ulvmPQFLT1Kcrsipn0YGZyUeKtkZymRnGteS5P7yMKk5+iLUG4lY5j1ekjeg+
	J3AoxhDbNgs5UdwTL9lRujwWtdo+jDDU5ZoH
X-Received: by 2002:a17:907:3f13:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b8777a7953dmr294862466b.2.1768475670767; Thu, 15 Jan 2026
 03:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20260112165914.4086692-1-ben.horgan@arm.com>
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 15 Jan 2026 12:14:19 +0100
X-Gm-Features: AZwV_QiEcqX9Z62pOe8axjpGIo-oG2d6Z-8Wh0LIfRSc7y-vQKSv9qD72xMgM5w
Message-ID: <CALPaoCh=brY6+_oJZXJLfpv_Qkz0i0RuPfuRa+TgXLu_xV6rsQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/47] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com, 
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com, 
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com, 
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com, 
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com, 
	reinette.chatre@intel.com, rohit.mathew@arm.com, scott@os.amperecomputing.com, 
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, 
	catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_031434_138217_C7D8DCE7 
X-CRM114-Status: GOOD (  39.94  )
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

Hi Ben,

On Mon, Jan 12, 2026 at 5:59=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> This new version of the mpam missing pieces has no major rework from the
> previous version. It's mainly small corrections and code tidying based on
> review and things I spotted along the way. To be able to merge this we ne=
ed
> review from more people and people to start testing on their platforms an=
d
> giving some Tested-by tags.
>
> Change list in patches.
>
> As mentioned in the cover letter for v2, one major departure from the
> previous snapshot branches referenced in the base driver series is that t=
he
> same MPAM setting are used for kernel-space and user-space. There are pro=
s
> and cons of choosing this policy but I think it is the best thing to star=
t
> with as there are AMD plans for adding a resctrl feature to allow a
> different closid/rmid configuration for user-space from kernel space. The
> AMD feature is called PLZA and is mentioned in this lpc slide deck[1]. Th=
is
> gives us a path forward to add support for having the EL1 and EL0 MPAM
> partid/pmg configuration differ from each other.
>
> From James' cover letter:
>
> This is the missing piece to make MPAM usable resctrl in user-space. This=
 has
> shed its debugfs code and the read/write 'event configuration' for the mo=
nitors
> to make the series smaller.
>
> This adds the arch code and KVM support first. I anticipate the whole thi=
ng
> going via arm64, but if goes via tip instead, the an immutable branch wit=
h those
> patches should be easy to do.
>
> Generally the resctrl glue code works by picking what MPAM features it ca=
n expose
> from the MPAM drive, then configuring the structs that back the resctrl h=
elpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L=
2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L=
3. MBWU
> counters are considerably more hairy, and depend on hueristics around the=
 topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages =
produced
> when enabling dynamic debug and booting with:
> | dyndbg=3D"file mpam_resctrl.c +pl"
>
> I've not found a platform that can test all the behaviours around the mon=
itors,
> so this is where I'd expect the most bugs.
>
> The MPAM spec that describes all the system and MMIO registers can be fou=
nd here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=3Den
> (Ignored the 'RETIRED' warning - that is just arm moving the documentatio=
n around.
>  This document has the best overview)
>
>
> Based on v6.19-rc5
> This series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v3
>
> v2 can be found at:
> https://lore.kernel.org/linux-arm-kernel/20251219181147.3404071-1-ben.hor=
gan@arm.com/
>
> rfc can be found at:
> https://lore.kernel.org/linux-arm-kernel/20251205215901.17772-1-james.mor=
se@arm.com/
>
> [1] https://lpc.events/event/19/contributions/2093/attachments/1958/4172/=
resctrl%20Microconference%20LPC%202025%20Tokyo.pdf
>
> Ben Horgan (10):
>   arm_mpam: Use non-atomic bitops when modifying feature bitmap
>   arm64/sysreg: Add MPAMSM_EL1 register
>   KVM: arm64: Preserve host MPAM configuration when changing traps
>   KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
>   arm64: mpam: Initialise and context switch the MPAMSM_EL1 register
>   KVM: arm64: Use kernel-space partid configuration for hypercalls
>   arm_mpam: resctrl: Add rmid index helpers
>   arm_mpam: resctrl: Add kunit test for rmid idx conversions
>   arm_mpam: resctrl: Wait for cacheinfo to be ready
>   arm_mpam: resctrl: Add kunit test for mbw min control generation
>
> Dave Martin (2):
>   arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
>   arm_mpam: resctrl: Add kunit test for control format conversions
>
> James Morse (30):
>   arm64: mpam: Context switch the MPAM registers
>   arm64: mpam: Re-initialise MPAM regs when CPU comes online
>   arm64: mpam: Advertise the CPUs MPAM limits to the driver
>   arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
>   arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG
>     values
>   KVM: arm64: Force guest EL1 to use user-space's partid configuration
>   arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
>   arm_mpam: resctrl: Sort the order of the domain lists
>   arm_mpam: resctrl: Pick the caches we will use as resctrl resources
>   arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
>   arm_mpam: resctrl: Add resctrl_arch_get_config()
>   arm_mpam: resctrl: Implement helpers to update configuration
>   arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
>   arm_mpam: resctrl: Add CDP emulation
>   arm_mpam: resctrl: Add support for 'MB' resource
>   arm_mpam: resctrl: Add support for csu counters
>   arm_mpam: resctrl: Pick classes for use as mbm counters
>   arm_mpam: resctrl: Pre-allocate free running monitors
>   arm_mpam: resctrl: Pre-allocate assignable monitors
>   arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
>   arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
>   arm_mpam: resctrl: Allow resctrl to allocate monitors
>   arm_mpam: resctrl: Add resctrl_arch_rmid_read() and
>     resctrl_arch_reset_rmid()
>   arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
>     resctrl_arch_reset_cntr()
>   arm_mpam: resctrl: Update the rmid reallocation limit
>   arm_mpam: resctrl: Add empty definitions for assorted resctrl
>     functions
>   arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
>   arm_mpam: resctrl: Call resctrl_init() on platforms that can support
>     resctrl
>   arm_mpam: Generate a configuration for min controls
>   arm_mpam: Quirk CMN-650's CSU NRDY behaviour
>
> Jiapeng Chong (1):
>   arm_mpam: Remove duplicate linux/srcu.h header
>
> Shanker Donthineni (4):
>   arm_mpam: Add quirk framework
>   arm_mpam: Add workaround for T241-MPAM-1
>   arm_mpam: Add workaround for T241-MPAM-4
>   arm_mpam: Add workaround for T241-MPAM-6
>
>  Documentation/arch/arm64/silicon-errata.rst |    9 +
>  arch/arm64/Kconfig                          |    6 +-
>  arch/arm64/include/asm/el2_setup.h          |    3 +-
>  arch/arm64/include/asm/mpam.h               |   98 +
>  arch/arm64/include/asm/resctrl.h            |    2 +
>  arch/arm64/include/asm/thread_info.h        |    3 +
>  arch/arm64/kernel/Makefile                  |    1 +
>  arch/arm64/kernel/cpufeature.c              |   21 +-
>  arch/arm64/kernel/mpam.c                    |   58 +
>  arch/arm64/kernel/process.c                 |    7 +
>  arch/arm64/kvm/hyp/include/hyp/switch.h     |   12 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c          |    8 +
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c          |   13 +
>  arch/arm64/kvm/sys_regs.c                   |    2 +
>  arch/arm64/tools/sysreg                     |    8 +
>  drivers/resctrl/Kconfig                     |    9 +-
>  drivers/resctrl/Makefile                    |    1 +
>  drivers/resctrl/mpam_devices.c              |  306 ++-
>  drivers/resctrl/mpam_internal.h             |  131 +-
>  drivers/resctrl/mpam_resctrl.c              | 1930 +++++++++++++++++++
>  drivers/resctrl/test_mpam_devices.c         |   66 +
>  drivers/resctrl/test_mpam_resctrl.c         |  426 ++++
>  include/linux/arm_mpam.h                    |   32 +
>  23 files changed, 3119 insertions(+), 33 deletions(-)
>  create mode 100644 arch/arm64/include/asm/mpam.h
>  create mode 100644 arch/arm64/include/asm/resctrl.h
>  create mode 100644 arch/arm64/kernel/mpam.c
>  create mode 100644 drivers/resctrl/mpam_resctrl.c
>  create mode 100644 drivers/resctrl/test_mpam_resctrl.c

Like before, I applied the patches and successfully booted a kernel on
a baremetal Google Cloud C4A instance. I was able to confirm that the
resources we expect were present and I was able to successfully run
the monitor assignment test cases I used to validate ABMC on AMD
systems. (Though I had to hack the driver to pretend there were less
MBWU monitors so that the counter assignment interfaces would become
available.)

My use cases only cover resctrl in the host, so I didn't try any of
the KVM integration, but I can at least say there wasn't any evidence
that it interfered with resctrl.

Tested-by: Peter Newman <peternewman@google.com>

Thanks,
-Peter


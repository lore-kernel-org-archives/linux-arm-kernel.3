Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2356EC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFDMwcUB+g0lr3+O0uNE+y+KlNYemC0Uyu3/6hhSiCE=; b=OPNkmNyYAXsx/tbiSisakAbcT2
	E4wcaQdqzuRc1HaRezGZXcKLASbCRq6dfmN2ScL1Yn7hKbk86IroTBXnV4WtaBO49uldyXUBJ9uxK
	eEZnfZgCAFCriPzCTH/T6ykuRfhBW6WhgMyJ2ncbWXBZonK9QlL6Z+fpedieiOVUCKulodVfaoLgQ
	s693v6MGMQWhaqMzlDX1STOzTaKUBJFr1hbqmQUEKfxOm9xU8P1ZLrnce4pSwrAFQTdykbsh0iYR/
	OfRYkfWvtPNwwtH5mcTALyI6eyY7pRHhLYMcfx254v5jsLCOPrWsbs0NyU6j3Eu/rlajM5wWHN+9E
	Y4uvU9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglpK-0000000EMts-1x1H;
	Fri, 16 Jan 2026 15:33:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglpI-0000000EMst-11ef
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:33:29 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c213419f5so1416561a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768577606; x=1769182406; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFDMwcUB+g0lr3+O0uNE+y+KlNYemC0Uyu3/6hhSiCE=;
        b=rEcuTnHOWXE+0bznCPKmFJdxOXxH2MsDxckAY5qwABabLEuD4uImgUvK5F4UHAPiKl
         rJXfskiMDy+fpJPsBYQmGwsGYwz8OrAZS59OCoO6AG/7W4UMOXpJeOYaPD3V80zUXg9s
         V0rAU05aBtKCydHI/mdGYbNo+DETw6S6BPZNUgucWeWpi068DkyRN4Bn4/Xrm4/OEzGT
         S8YUrDVvM1nmQ1fcXrE0ROHg6YV6u/ozyJb++YxQNVA1atJ3fWarhU5E3S4OdsnUYsHu
         f2wgQbHu4Gs1PW9dujPaIY2Om2hu0zK+4VDr6OZkOocKlPFBaK510ITLTEB95J0+5PPi
         5U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577606; x=1769182406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFDMwcUB+g0lr3+O0uNE+y+KlNYemC0Uyu3/6hhSiCE=;
        b=O0wIi50vON91CMVatDsCfiFvTIiyfJr++j9cMZ01TsBwVUaAX+GUcGFpzQp+RgytG7
         QeyB4ztnkL/BX8+2hftMrjuEpmaHr5CDlKtmCMJacARBOBaqPaQkm49Ec1mzfQnDK+XH
         49Rb/+C0yTTpQBnImVJoKkjOS2BwJxXh9eAnY2vi8Y+vjxSwyao3e+PDjnfj8SYHreGA
         1pYu2ftW7cd9/LVwuo/mNllAurRqqb3UaT++agJGQ4elF8izGE8hXFl3/DKKTcMr74Bu
         wsxFU/T4iwjU8c0tbG2rEdTHp8oXtSHX71Pm9sOgLnVWFT5i/MA/4c4qkoAH94geGZOX
         1X1g==
X-Gm-Message-State: AOJu0YzjBC25BDYaIo0Bmfj3IUWsUSxVJdcVBNA3gHgbLL4LiXquBVxO
	I7bkXSihhe7jKO8UGrWCHXYSo/S2MMzRQ0JpWIzVsfvAMf8jB9kOm8kBgZnO+y3CxpurZBsBYIE
	yJs2bxw==
X-Received: from pjbsh12.prod.google.com ([2002:a17:90b:524c:b0:34c:2156:9de7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5803:b0:32e:3829:a71c
 with SMTP id 98e67ed59e1d1-35272efcc92mr2558426a91.16.1768577606439; Fri, 16
 Jan 2026 07:33:26 -0800 (PST)
Date: Fri, 16 Jan 2026 07:32:47 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176857711424.940905.14821355548518788463.b4-ty@google.com>
Subject: Re: [PATCH v6 00/44] KVM: x86: Add support for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_073328_291897_B58A7762 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, 05 Dec 2025 16:16:36 -0800, Sean Christopherson wrote:
> This series is based on 'https://github.com/kvm-x86/linux next', but except
> for one minor conflict in perf should apply on Linus' tree once the KVM 6.19
> pull request lands.  I considered waiting until 6.19-rc1 to post this, but
> I've had this in a "ready" state for a few weeks and want to get it out there.
> 
> My hope/plan is that the perf changes will go through the tip tree with a
> stable tag/branch, and the KVM changes will go the kvm-x86 tree.
> 
> [...]

Applied the KVM patches to kvm-x86 pmu, thanks!

[14/44] KVM: Add a simplified wrapper for registering perf callbacks
        https://github.com/kvm-x86/linux/commit/4b24910c0569
[15/44] KVM: Add a simplified wrapper for registering perf callbacks
        [DROPPED - already merged (and then fixed)]
[16/44] KVM: x86/pmu: Start stubbing in mediated PMU support
        https://github.com/kvm-x86/linux/commit/3e51822b2fdf
[17/44] KVM: x86/pmu: Implement Intel mediated PMU requirements and constraints
        https://github.com/kvm-x86/linux/commit/bfee4f07d880
[18/44] KVM: x86/pmu: Implement AMD mediated PMU requirements
        https://github.com/kvm-x86/linux/commit/9ba0bb4ae76a
[19/44] KVM: x86/pmu: Register PMI handler for mediated vPMU
        https://github.com/kvm-x86/linux/commit/1c4ba7286afb
[20/44] KVM: x86/pmu: Disable RDPMC interception for compatible mediated vPMU
        https://github.com/kvm-x86/linux/commit/80624272129e
[21/44] KVM: x86/pmu: Load/save GLOBAL_CTRL via entry/exit fields for mediated PMU
        https://github.com/kvm-x86/linux/commit/d3ba32d1ff2a
[22/44] KVM: x86/pmu: Disable interception of select PMU MSRs for mediated vPMUs
        https://github.com/kvm-x86/linux/commit/2904df6692f4
[23/44] KVM: x86/pmu: Bypass perf checks when emulating mediated PMU counter accesses
        https://github.com/kvm-x86/linux/commit/0ea0d6314870
[24/44] KVM: x86/pmu: Introduce eventsel_hw to prepare for pmu event filtering
        https://github.com/kvm-x86/linux/commit/02918f007792
[25/44] KVM: x86/pmu: Reprogram mediated PMU event selectors on event filter updates
        https://github.com/kvm-x86/linux/commit/3db871fe185b
[26/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0 for mediated PMCs on AMD
        https://github.com/kvm-x86/linux/commit/a2f4ba534cc5
[27/44] KVM: x86/pmu: Load/put mediated PMU context when entering/exiting guest
        https://github.com/kvm-x86/linux/commit/56bb27369750
[28/44] KVM: x86/pmu: Disallow emulation in the fastpath if mediated PMCs are active
        https://github.com/kvm-x86/linux/commit/f7a65e58d643
[29/44] KVM: x86/pmu: Handle emulated instruction for mediated vPMU
        https://github.com/kvm-x86/linux/commit/283a5aa57b22
[30/44] KVM: nVMX: Add macros to simplify nested MSR interception setting
        https://github.com/kvm-x86/linux/commit/cb58327c4c8a
[31/44] KVM: nVMX: Disable PMU MSR interception as appropriate while running L2
        https://github.com/kvm-x86/linux/commit/88ebc2a3199c
[32/44] KVM: nSVM: Disable PMU MSR interception as appropriate while running L2
        https://github.com/kvm-x86/linux/commit/3b36160d9406
[33/44] KVM: x86/pmu: Expose enable_mediated_pmu parameter to user space
        https://github.com/kvm-x86/linux/commit/860bcb1021f5
[34/44] KVM: x86/pmu: Elide WRMSRs when loading guest PMCs if values already match
        https://github.com/kvm-x86/linux/commit/b0b6a8d3be16
[35/44] KVM: VMX: Drop intermediate "guest" field from msr_autostore
        https://github.com/kvm-x86/linux/commit/462f092dc55c
[36/44] KVM: nVMX: Don't update msr_autostore count when saving TSC for vmcs12
        https://github.com/kvm-x86/linux/commit/58f21a01417f
[37/44] KVM: VMX: Dedup code for removing MSR from VMCS's auto-load list
        https://github.com/kvm-x86/linux/commit/0bd29379114b
[38/44] KVM: VMX: Drop unused @entry_only param from add_atomic_switch_msr()
        https://github.com/kvm-x86/linux/commit/84ac00042a28
[39/44] KVM: VMX: Bug the VM if either MSR auto-load list is full
        https://github.com/kvm-x86/linux/commit/2ed57bb89976
[40/44] KVM: VMX: Set MSR index auto-load entry if and only if entry is "new"
        https://github.com/kvm-x86/linux/commit/0c4ff0866fc1
[41/44] KVM: VMX: Compartmentalize adding MSRs to host vs. guest auto-load list
        https://github.com/kvm-x86/linux/commit/2239d137a71d
[42/44] KVM: VMX: Dedup code for adding MSR to VMCS's auto list
        https://github.com/kvm-x86/linux/commit/c3d6a7210a4d
[43/44] KVM: VMX: Initialize vmcs01.VM_EXIT_MSR_STORE_ADDR with list address
        https://github.com/kvm-x86/linux/commit/9757a5aebcd6
[44/44] KVM: VMX: Add mediated PMU support for CPUs without "save perf global ctrl"
        https://github.com/kvm-x86/linux/commit/d374b89edbb9

--
https://github.com/kvm-x86/linux/tree/next


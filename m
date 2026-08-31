Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC69C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWf9mkSwfRVXKBbs/ZSrUfZDNaE25SAOAeW1d7fm9pw=; b=OkGc718YHN1kuc3B4/mAGabNr1
	lOQxCXOtOa7hrwlK2phy/lxpy60NGIWj8QL2z9vM19qvezOzXdF1nsEu94mXsHMv8oYJNb2gYmhIK
	sWs/tuM4xtpl6Fxplxw6PmEyYwm/U4zWhBhUvmaqoyzdzZuyz0S+wRslJmVWco8ksQS/NcdTf0nFL
	/E87q/4RCwLnZSjGC3VnxpIdOx0tw3kSgyaIg6ifGCAGRMGzTkyShplo20aDSNbUhsDNpuCMuvi4a
	BG7C7uNZHkXtAwdnUUZu87SiOrulZpkqL/5rTIHl49Gr3kcAzpyU6VD3V5jvIzNBh6mzQtlugpv8T
	ebv5ZRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17g8-0000000AN4b-2Zv2;
	Mon, 31 Aug 2026 19:28:24 +0000
Received: from out-164.mta0.migadu.com ([2001:41d0:1004:224b::a4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17g5-0000000AN4F-3gRf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 19:28:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QL9iDzTYCKrAUBeXvATSPUv4Y1G32BzzX2eraj3q3jQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788204499; v=1; x=1788809299;
 b=JAczOvTDbQe0ZkqNfTMSrIMx3MSozubSUzRXRoqNYxHlyH0lonUnPke909TM0v/GdScH5i4b
 nJIVOTwekyBQS7BoE7MH4rKhA/RCjfBSjueyK5AkmMtJEw55rt7g6GgvZtZqRFpCDsEevbLDBst
 KCYMEDw6EVi968XGgwilgXX8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9652764b27261a71;
	Mon, 31 Aug 2026 19:28:19 +0000
X-Mizu-Trace-ID: 9652764b27261a71
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1632e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 12:28:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHkWse2xEG3w2SRPjJ7UFTjvV2OJbAthF+1w+b7yCU5DacL414AdlacOZK8JigweEx61lcFVPmKQtDygix6tT6@lists.infradead.org
X-Gm-Message-State: AFuF++lpTbAbqHIwJ8deqnQqyzTvtQmaCMW8kU7r/luiiMJ4VXtFvTeQ
	q74btmSOrHaiyU+HCha/76oNTaj2IesxP9XoH+byknxJDjASnPk8VyFYv+3DbbaC0K8yZIlHTZF
	WQcZd1J1kyGZ3STkUTaKkI8pc7OpsBuOYYxkjQScQ
X-Received: by 2002:a05:6512:3b0d:b0:5b4:9dba:4ece with SMTP id
 2adb3069b0e04-5b5ff2ae0dcmr23112e87.12.1788204494566; Mon, 31 Aug 2026
 12:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 31 Aug 2026 20:27:38 +0100
X-Gmail-Original-Message-ID: <CA+EHjTycOnoVv6jCE2M5bVLG5m1MhnaWSNTpS8vJaWVDk1+S3g@mail.gmail.com>
X-Gm-Features: AcwNN1VeQcT49sFWxBpO5p7UEcrKsOyar9oNS5xestQbF8q3MfimLDxR9Ts3ohk
Message-ID: <CA+EHjTycOnoVv6jCE2M5bVLG5m1MhnaWSNTpS8vJaWVDk1+S3g@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: Confine protected VM vCPU state to EL2
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_122822_058690_54208075 
X-CRM114-Status: GOOD (  21.12  )
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

On Mon, 31 Aug 2026 at 17:34, Fuad Tabba <fuad.tabba@linux.dev> wrote:
...
>
> The kvmtool changes that go with this will be posted separately, and I
> will reply here with a link.

... and here they are:
https://lore.kernel.org/all/20260831192406.1341841-1-fuad.tabba@linux.dev/

Cheers,
/fuad

>
> Patch 1 is the HCR_EL2.VSE fix posted separately [2]. It is not part
> of this series; it is carried so the series applies as is and Sashiko
> can run on it.
>
> The KVM_ARM_PREFERRED_TARGET documentation fix [3] went out just ahead
> of this series. Nothing here needs it to apply, but patch 17 documents
> vCPU feature availability as something the capabilities report, while
> api.rst 4.83 still points userspace at a bitmap that has always been
> empty.
>
> The series is structured as follows:
>
>   01:     The HCR_EL2.VSE fix, posted separately.
>   02-03:  Capability allowlist and the PVTIME rejection.
>   04-05:  Per-exception-class entry handlers; EL2 owns a protected
>           vCPU's trap configuration.
>   06-08:  Timer state, system register reset and HVC handling at EL2.
>   09-10:  PSCI at EL2, and the KVM_ARM_VCPU_INIT and PSCI version
>           restrictions.
>   11-14:  Host PC adjustments blocked; an UNDEF at EL2 for exit
>           classes the host does not emulate; per-class state
>           marshalling; a protected guest's SError pended with
>           HCR_EL2.VSE.
>   15-16:  Host access to private state, and host power-on of a vCPU
>           EL2 holds powered off, rejected.
>   17:     Documentation.
>
> Still to come: selftests, self-hosted debug, SVE for protected guests,
> and much more, as separate series.
>
> Based on v7.3-rc1 (cee9395acd804).
>
> Cheers,
> /fuad
>
> P.S. Sashiko, bring it on!
>
> [1] https://lore.kernel.org/all/20260729131823.2021516-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/20260829071120.2522788-1-fuad.tabba@linux.dev/
> [3] https://lore.kernel.org/all/20260831162815.269851-1-fuad.tabba@linux.dev/
>
> Fuad Tabba (15):
>   KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
>   KVM: arm64: Advertise the capabilities that protected VMs support
>   KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
>   KVM: arm64: Skip fixed-feature state flush for protected vCPUs
>   KVM: arm64: Add system register reset framework for protected VMs
>   KVM: arm64: Implement HVC handling for protected guests at EL2
>   KVM: arm64: Handle PSCI calls for protected VMs at EL2
>   KVM: arm64: Restrict KVM_ARM_VCPU_INIT and PSCI version for protected
>     VMs
>   KVM: arm64: Prevent host PC adjustments for protected vCPUs
>   KVM: arm64: Inject an UNDEF at EL2 for unhandled protected guest exits
>   KVM: arm64: Add per-EC entry/exit state marshalling for protected
>     guests
>   KVM: arm64: Pend a protected guest's SError with HCR_EL2.VSE only
>   KVM: arm64: Reject host access to protected VM private state
>   KVM: arm64: Reject host power-on of a vCPU that EL2 holds powered off
>   KVM: arm64: Document the protected VM userspace API
>
> Marc Zyngier (2):
>   KVM: arm64: Introduce per-EC entry handlers for pKVM
>   KVM: arm64: Add {flush,sync}_hyp_timer_state() primitives
>
>  Documentation/virt/kvm/api.rst                |  22 +-
>  .../virt/kvm/arm/fw-pseudo-registers.rst      |   2 +
>  Documentation/virt/kvm/arm/pkvm.rst           | 141 ++++-
>  Documentation/virt/kvm/devices/vcpu.rst       |   4 +-
>  arch/arm64/include/asm/kvm_asm.h              |   1 +
>  arch/arm64/include/asm/kvm_host.h             |  21 +
>  arch/arm64/include/asm/kvm_pkvm.h             |  34 +-
>  arch/arm64/kvm/arm.c                          |  40 ++
>  arch/arm64/kvm/guest.c                        |  29 +
>  arch/arm64/kvm/hyp/exception.c                |  27 +-
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  18 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 564 +++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 401 ++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/switch.c              |  29 +-
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  91 ++-
>  arch/arm64/kvm/hypercalls.c                   |   7 +
>  arch/arm64/kvm/inject_fault.c                 |   5 +-
>  arch/arm64/kvm/pkvm.c                         |  21 +-
>  arch/arm64/kvm/psci.c                         |   3 +
>  19 files changed, 1378 insertions(+), 82 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.39.5
>


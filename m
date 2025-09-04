Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvXraad7M9/KAbsxZuVznw4PuxcMicz+ycPue4L1oEw=; b=ycYMEyLxwiu/fLfT+r/0FIQqUs
	JvxKPjJnrAxGJsML7Wddz+JPFqUXNnzRx1yIhsPFwCoZPvzqkc6ePZMCKem3oLZ7S/QfJxMILiav4
	WD9K6B0tBIxTC+LsfhM+yDBPfUziM8T4Fhmn8VbMKlCWj6+ZtZo9cbDPTKYS/h/61XSu4xIk6wMhp
	Hq8B6AgQls1xKjo2S6PgWj0RNvnQC6pmJDErq8DidGdvw8s2p4wATuw+fnAb31/OYGQxpQq9TgCjV
	qdKHmi+edNSAhVwq0jSfxJelLhlIP+5Yovax9uCgw5JkZZlIGXMaST4abo6BSPR87qIVSo8qIlPUp
	zbprhfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7T7-0000000Az7A-3XVE;
	Thu, 04 Sep 2025 10:45:30 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6MU-0000000AbBr-1e7a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:34:37 +0000
Date: Thu, 4 Sep 2025 00:57:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756978472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RvXraad7M9/KAbsxZuVznw4PuxcMicz+ycPue4L1oEw=;
	b=K8bnUM9oGvlHPCu5IwDqYoXJM87iFMrFkvivzsP9o3Vy9gVgb/OT6fLf2fWkv8V/AbMGxl
	BIY4MxwR8GbjJKHyV+16OnLGE1pKkw/lwbt0IGO1EefBFMy2ll5Ux4XEVfzNAYirgsx0CO
	VLT7Fiow1AaujU5PusHgs/OL8hEj+aE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 0/5] KVM: arm64: GICv5 legacy (GCIE_LEGACY) NV enablement
 and cleanup
Message-ID: <aLlGeLOE_PVsYDAU@linux.dev>
References: <20250828105925.3865158-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828105925.3865158-1-sascha.bischoff@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_023434_781683_5953D524 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Aug 28, 2025 at 10:59:41AM +0000, Sascha Bischoff wrote:
> Hi all,
> 
> This series enables nested virtualization for GICv3-based VMs on GICv5
> hosts (w/ FEAT_GCIE_LEGACY) in KVM/arm64. In addition, it adds a CPU
> capability to track support for FEAT_GCIE_LEGACY across all CPUs.
> 
> The series fixes ICC_SRE_EL2 access handling for GICv5 hosts (to match
> the updated bet1+ specification [1]), and extends nested
> virtualization support to vGICv3 guests running on compatible GICv5
> systems. With these changes, it becomes possible to run with
> kvm-arm.mode=nested, and these changes have been tested with three
> levels of nesting on simulated hardware (Arm FVP).
> 
> Previously, the presence of FEAT_GCIE_LEGACY was tracked in the GICv5
> driver via gic_kvm_info, and the probing logic could incorrectly
> enable legacy support if the boot CPU exposed the feature while others
> did not. This created the risk of mismatched configurations,
> particularly when late-onlining CPUs without FEAT_GCIE_LEGACY.
> 
> To address this, the series introduces a proper ARM64_HAS_GICV5_LEGACY
> CPU capability, and moves KVM to use cpus_have_final_cap() to ensure
> consistent system-wide enablement. With this, late-onlined but
> mismatched CPUs are cleanly rejected at bring-up.
> 
> Patch summary
> 
> KVM: arm64: allow ICC_SRE_EL2 accesses on a GICv5 host
>     Update handling to reflect the corrected GICv5 specification.
> 
> KVM: arm64: Enable nested for GICv5 host with FEAT_GCIE_LEGACY
>     Allow nested virtualization for vGICv3 guests on GICv5 hosts with
>     legacy support.
> 
> arm64: cpucaps: Add GICv5 Legacy vCPU interface (GCIE_LEGACY) capability
>     Introduce a new CPU capability that prevents mismatched
>     configurations.
> 
> KVM: arm64: Use ARM64_HAS_GICV5_LEGACY for GICv5 probing
>     Ensure probing is consistent across all CPUs by using cpucaps.
> 
> irqchip/gic-v5: Drop has_gcie_v3_compat from gic_kvm_info
>     Remove obsolete compatibility flag, as FEAT_GCIE_LEGACY is now a
>     CPU feature.
> 
> Comments and reviews are very welcome.
> 
> Thanks,
> Sascha
> 
> [1] https://developer.arm.com/documentation/aes0070/latest/
> 
> Sascha Bischoff (5):
>   KVM: arm64: Allow ICC_SRE_EL2 accesses on a GICv5 host
>   KVM: arm64: Enable nested for GICv5 host with FEAT_GCIE_LEGACY
>   arm64: cpucaps: Add GICv5 Legacy vCPU interface (GCIE_LEGACY)
>     capability
>   KVM: arm64: Use ARM64_HAS_GICV5_LEGACY for GICv5 probing
>   irqchip/gic-v5: Drop has_gcie_v3_compat from gic_kvm_info

For the series:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver


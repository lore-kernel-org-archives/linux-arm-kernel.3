Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC77C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdfZ1fe1QrL0AX4KvbpOw9db3IDwzYKM5tBhWJp0zHc=; b=qWDe+QDfglRVHIHf163qsGnhPX
	6Ehy1YtiXe8JHTRFKTCtIy/TDB12+z7EDJNNAMOWJjo3YoX4tPltULEk+3+vBQuE+G7ltYsdeKs9p
	K4t13CjMcVAEhsSIH0fpjczUiqAeQbLmWqFMqrJoXtcPDjWT0N+hd5dlVasajB8zmitem9U4m7Eca
	YxYXXyhKxBWAVsz2i6wWwD/EC2BAUDVQMbkJ9BM/rmedSTpI6GCLIH50LEKMvazQ15y+NYFUhRTCB
	P7aKxFU35BEsQZlOJYBVQklwJ6azJY+VMtwKH6YMp3iHMlrVSc/rr7T8YqUJ8T/5xpZ79lr9NvYex
	DS6EujWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjCq-0000000BBS4-0DQY;
	Thu, 26 Jun 2025 09:47:44 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiRo-0000000B4GT-0gJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750928348; x=1782464348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vz8yrG7TsUr+PK7JlGaU9k8zdE+Zt3hQF4t9uML7Scs=;
  b=iJhUcXn6nGwDWEBHZTIjWu0ece+aBVTNpIDw5Q5K0UTu0jxeWp6HEgtf
   6I1iOY2xfsEvWLK/e40jTKz5Wgq5+Bm7sgza0uHlqBEpS828sgw1nciDc
   mZXCnrFYT/omJRfIv10rpRIeLJ88QHQgiDCS0NmJtN8XvSRZb+zDkW0fh
   E7UvPgrHoUC1SbH7/q18IiYi8wQgU9LbdJxU+O8CKxXeyAqYjMPx0tcz2
   hHmAjyEwi/O4YdZbIjFNO9crcMREAtwFGWgOPhwnbIsnTWwf9OXCkhDUo
   J9eYAlWQv4Rks6bLz6E5WdpwkMYIXEpcYfJ6hJVV6Vj60EyTTvC2VgOAd
   A==;
X-CSE-ConnectionGUID: yNRD2BSQSam3ZEEuglQe0w==
X-CSE-MsgGUID: wRhyNthmR/mfUCxNntlHNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64649963"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="64649963"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:59:08 -0700
X-CSE-ConnectionGUID: PSt5q9rgRv23Z+qWHnxY4g==
X-CSE-MsgGUID: 1ZRIWUhETUuNPdnq4pMsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152632462"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:59:05 -0700
Message-ID: <bc7aea45-f254-4cbc-8dc0-5435417d8577@intel.com>
Date: Thu, 26 Jun 2025 16:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: x86: Provide a capability to disable
 APERF/MPERF read intercepts
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jim Mattson <jmattson@google.com>
References: <20250626001225.744268-1-seanjc@google.com>
 <20250626001225.744268-3-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250626001225.744268-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015908_252877_3C20F169 
X-CRM114-Status: GOOD (  20.68  )
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

On 6/26/2025 8:12 AM, Sean Christopherson wrote:
> From: Jim Mattson <jmattson@google.com>
> 
> Allow a guest to read the physical IA32_APERF and IA32_MPERF MSRs
> without interception.
> 
> The IA32_APERF and IA32_MPERF MSRs are not virtualized. Writes are not
> handled at all. The MSR values are not zeroed on vCPU creation, saved
> on suspend, or restored on resume. No accommodation is made for
> processor migration or for sharing a logical processor with other
> tasks. No adjustments are made for non-unit TSC multipliers. The MSRs
> do not account for time the same way as the comparable PMU events,
> whether the PMU is virtualized by the traditional emulation method or
> the new mediated pass-through approach.
> 
> Nonetheless, in a properly constrained environment, this capability
> can be combined with a guest CPUID table that advertises support for
> CPUID.6:ECX.APERFMPERF[bit 0] to induce a Linux guest to report the
> effective physical CPU frequency in /proc/cpuinfo. Moreover, there is
> no performance cost for this capability.
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>
> Link: https://lore.kernel.org/r/20250530185239.2335185-3-jmattson@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 23 +++++++++++++++++++++++
>   arch/x86/kvm/svm/nested.c      |  4 +++-
>   arch/x86/kvm/svm/svm.c         |  5 +++++
>   arch/x86/kvm/vmx/nested.c      |  6 ++++++
>   arch/x86/kvm/vmx/vmx.c         |  4 ++++
>   arch/x86/kvm/x86.c             |  6 +++++-
>   arch/x86/kvm/x86.h             |  5 +++++
>   include/uapi/linux/kvm.h       |  1 +
>   tools/include/uapi/linux/kvm.h |  1 +
>   9 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 43ed57e048a8..27ced3ee2b53 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7844,6 +7844,7 @@ Valid bits in args[0] are::
>     #define KVM_X86_DISABLE_EXITS_HLT              (1 << 1)
>     #define KVM_X86_DISABLE_EXITS_PAUSE            (1 << 2)
>     #define KVM_X86_DISABLE_EXITS_CSTATE           (1 << 3)
> +  #define KVM_X86_DISABLE_EXITS_APERFMPERF       (1 << 4)
>   
>   Enabling this capability on a VM provides userspace with a way to no
>   longer intercept some instructions for improved latency in some
> @@ -7854,6 +7855,28 @@ all such vmexits.
>   
>   Do not enable KVM_FEATURE_PV_UNHALT if you disable HLT exits.
>   
> +Virtualizing the ``IA32_APERF`` and ``IA32_MPERF`` MSRs requires more
> +than just disabling APERF/MPERF exits. While both Intel and AMD
> +document strict usage conditions for these MSRs--emphasizing that only
> +the ratio of their deltas over a time interval (T0 to T1) is
> +architecturally defined--simply passing through the MSRs can still
> +produce an incorrect ratio.
> +
> +This erroneous ratio can occur if, between T0 and T1:
> +
> +1. The vCPU thread migrates between logical processors.
> +2. Live migration or suspend/resume operations take place.
> +3. Another task shares the vCPU's logical processor.
> +4. C-states lower thean C0 are emulated (e.g., via HLT interception).

s/thean/than/

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>


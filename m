Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE2AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0pkfNxcyGkc2cKS3BDZMjvgfDEjqNJWS4Tq2bLjnwA=; b=gAKtym+eDSBv16PgaUz7POfXp3
	AZTqui1ZGMoCqkPMe9IuydOwyVqBFdVUGIImYYYXanIml0q/5FxeuvXlN3qWrDHP17mLoOlX2HXuR
	/1MsLgfG8ccYxuiXbU6JZwz5AUNLO4It4FgF9QOXwRF7xzWQt12VrlxTzmysjnSeXgtBWiJoyJhEm
	mxHHEdmNH34ln5uuIaVNt9UnvTz4lB4ZahxiTZlwUIFbNpnHwgFCqd9tV1Q8VHDkmQG5406Ns0t/f
	ayT7P7ipDf59qM04TTL20x9TDvxWMgvbopksvNmRmdMEuDJRFr4CRk4HKDteiHhAm+F6c1XMpmwe/
	QV0nCZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpsL-000000067ED-3tJ7;
	Fri, 01 Aug 2025 13:32:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpo2-000000066qc-3NEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 13:28:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED37416A3;
	Fri,  1 Aug 2025 06:28:07 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D58F3F66E;
	Fri,  1 Aug 2025 06:28:13 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:28:11 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] perf: arm_spe: Add support for SPE VM interface
Message-ID: <aIzA632hiAldjJQQ@raptor>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_062818_939110_137ABAD2 
X-CRM114-Status: GOOD (  31.89  )
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

Hi,

On Tue, Jul 01, 2025 at 04:31:56PM +0100, James Clark wrote:
> SPE can be used from within a guest as long as the driver adheres to the
> new VM interface spec [1]. Because the driver should behave correctly
> whether it's running in a guest or not, the first patches are marked as
> a fix. Furthermore, in future versions of the architecture the PE will
> be allowed to behave in the same way.
> 
> The last patch adds new behavior to make it easier for guests to be
> able to reserve large buffers. It's not strictly necessary, so it's not
> marked as a fix.

I had a look at the patches, and they all look ok to me, so for the series:

Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

I also tested the series by hacking SPE virtualization support in KVM:

- without these changes, the SPE driver gets into an infinite loop because it
  clears PMBSR_EL1.S before clearing PMBLIMITR_EL.E, and the hypervisor is
  allowed to ignore the write to PMBSR_EL1.

- with these changes, that doesn't happen.

- ran perf for about a day in a loop in a virtual machine and didn't notice
  anything out of the ordinary.

- ran perf for about a day in a loop on baremetal and similary everything looked
  alright.

- checked that the SPE driver correctly decodes the maximum buffer size for
  sizes 4M, 2M (2M is right at the boundary between the two encoding schemes)
  and 1M; that's also correctly reflected in
  /sys/devices/platform/<spe>/arm_spe_0/caps/max_buffer_size.

- checked that perf is not allowed to use a buffer larger than the maximum.

- checked that the SPE driver correctly detects a buffer size management event.

So:

Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>

While testing I noticed two things:

1. When perf tries to use a buffer larger than the maximum, the error is EINVAL
(22):

# cat /sys/devices/platform/spe/arm_spe_0/caps/max_buff_size
4194304
# perf record -ae arm_spe// -m,16M -- sleep 10
failed to mmap with 22 (Invalid argument)

(used 16M as the buffer size because what the driver ends up programming is half
that).

I would have expected to get back ENOMEM (12), that seems less ambiguous to me.
I had to hack the driver to print an error message to dmesg when the max buffer
size is exceed to make sure that's why I was seeing the error message in perf,
and it wasn't because of something else. I get that that's because .setup_aux()
can only return NULL on error, but feels like there's room for improvement here.

2. A hypervisor is allowed to inject a buffer size event even though the buffer
set by the guest is smaller than the maximum advertised. For example, this can
happen if there isn't enough memory to pin the buffer, or if the limit on pinned
memory is exceeded in the hypervisor (implementation specific behaviour, not
mandated in DEN0154, of course).

In this situation, when the SPE driver gets a buffer size management event
injected by the hypervisor, there is no way for the driver to communicate it to
the perf instance, and the profiled process continues executing even though
profiling has stopped.

That's not different from what happens today with buffer management events, but
unlike the other events, which aren't under the control of userspace, the buffer
size event is potentially recoverable if userspace restarts perf with a smaller
buffer.

Do you think there's something that can be done to improve this situation?

Thanks,
Alex

> 
> [1]: https://developer.arm.com/documentation/den0154/latest/
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (3):
>       perf: arm_spe: Add barrier before enabling profiling buffer
>       perf: arm_spe: Disable buffer before writing to PMBPTR_EL1 or PMBSR_EL1
>       perf: arm_spe: Add support for SPE VM interface
> 
>  arch/arm64/include/asm/sysreg.h |  1 +
>  arch/arm64/tools/sysreg         |  6 ++++-
>  drivers/perf/arm_spe_pmu.c      | 60 ++++++++++++++++++++++++++++++++---------
>  3 files changed, 54 insertions(+), 13 deletions(-)
> ---
> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250609-james-spe-vm-interface-2bb41e238072
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 


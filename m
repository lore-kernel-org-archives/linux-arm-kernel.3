Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E96E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 05:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzjW0WRwHutz7m5U6kusET8ShP4S41Chtpc64SA8Q60=; b=E6ya6r0x+51ic7ZjXP5jceAqyz
	tLps5sgFfuHQzTxEEaoSHAmGe62Gemn2/gSFjnWBDC1H3Z1knnBvO4XatJaCGjUpQwAHSPBWx6UCQ
	W27q/wp/PFG7UxY0J3ZRLJOc4ItsF6HaTxaTxtdmOsh5w+I+mabamg89Qntvh4sRHpVN8r9LYr4Rm
	r067WtItAlHo/wzGqqPfeNrtWeCtPFVxzp9WgHrkaZOcHDLM3yc15Zyg53LQ7GgUvJJgYdhZ2Cz0s
	Rzj0Zks8baociyveYF5gKdc42bbPltskHtSiagRKEbaB5vJZ82oX7xJC+RMVa2GWQpN1bDGA6QnOB
	rf/NpqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQgF-00000000b0x-07Xe;
	Fri, 06 Dec 2024 05:15:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQem-00000000ag9-2qvv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 05:13:37 +0000
Received: from [100.65.0.192] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3E44620ACD8D;
	Thu,  5 Dec 2024 21:13:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3E44620ACD8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733462015;
	bh=SzjW0WRwHutz7m5U6kusET8ShP4S41Chtpc64SA8Q60=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=p0sZCFI0tsDiifhEbWHqn2DoqZJRV/ZUxtoMpWcFIrU0eeD6kg1+0CTUscOkeovcU
	 +0J/3inAHktEmKoVWvAarzPCWSw5DgW9URIIDAJl143QZ5PCfTvu94e7Tp7SETBYEQ
	 ELCm01CjscFtlHT+1/uB9cUpALaaAQ3fJ47XdOIY=
Message-ID: <34cd1209-f9d3-4cdf-b7c1-7028a9abe46c@linux.microsoft.com>
Date: Thu, 5 Dec 2024 21:13:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 horms@kernel.org
Subject: Re: [PATCH v3 4/5] hyperv: Switch from hyperv-tlfs.h to
 hyperv/hvhdk.h
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1732577084-2122-5-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1732577084-2122-5-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_211336_797463_AE4085A5 
X-CRM114-Status: GOOD (  11.99  )
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

On 11/25/2024 3:24 PM, Nuno Das Neves wrote:
> Switch to using hvhdk.h everywhere in the kernel. This header
> includes all the new Hyper-V headers in include/hyperv, which form a
> superset of the definitions found in hyperv-tlfs.h.
> 
> This makes it easier to add new Hyper-V interfaces without being
> restricted to those in the TLFS doc (reflected in hyperv-tlfs.h).
> 
> To be more consistent with the original Hyper-V code, the names of
> some definitions are changed slightly. Update those where needed.
> 
> Update comments in mshyperv.h files to point to include/hyperv for
> adding new definitions.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/hv_core.c        |  2 +-
>  arch/arm64/hyperv/mshyperv.c       |  4 ++--
>  arch/arm64/include/asm/mshyperv.h  |  7 +++----
>  arch/x86/hyperv/hv_init.c          | 20 ++++++++++----------
>  arch/x86/hyperv/hv_proc.c          |  2 +-
>  arch/x86/hyperv/nested.c           |  2 +-
>  arch/x86/include/asm/kvm_host.h    |  2 +-
>  arch/x86/include/asm/mshyperv.h    |  2 +-
>  arch/x86/include/asm/svm.h         |  2 +-
>  arch/x86/kernel/cpu/mshyperv.c     |  2 +-
>  arch/x86/kvm/vmx/hyperv_evmcs.h    |  2 +-
>  arch/x86/kvm/vmx/vmx_onhyperv.h    |  2 +-
>  drivers/clocksource/hyperv_timer.c |  2 +-
>  drivers/hv/hv_balloon.c            |  4 ++--
>  drivers/hv/hv_common.c             |  2 +-
>  drivers/hv/hv_kvp.c                |  2 +-
>  drivers/hv/hv_snapshot.c           |  2 +-
>  drivers/hv/hyperv_vmbus.h          |  2 +-
>  include/asm-generic/mshyperv.h     |  7 +++----
>  include/clocksource/hyperv_timer.h |  2 +-
>  include/linux/hyperv.h             |  2 +-
>  net/vmw_vsock/hyperv_transport.c   |  6 +++---
>  22 files changed, 39 insertions(+), 41 deletions(-)

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>


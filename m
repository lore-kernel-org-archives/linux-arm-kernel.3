Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79700C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvrGzctpGGzu8oxKQw3tKpiz4XHwPltvrD9jJxe8Oa4=; b=BbwlUMh13wHYK2uxoo20Icm592
	l3EFdYWXLiayB0VX0unW8o8Ep8N4Dy8e6fMEbWMrWW/wBsP+Xesdh2XYzsYVK9ILYevh+VmNuAUjX
	OwTrp2p5CPfNrxf5EOGFFPT0bkao0pfZy5qDYprX2Ao5Oc66TjsUzyL0tvJt/sPALx3m09bkar7V1
	8p65DVGn7ofs1YCwIJClalE0HyJM+Qcz5MVBKD35E8WzW/Sz141ZYovvXzd0FsKUb9cpGwfAxOip8
	kpt90JSWSHYl+XknabWffewJD/seruOhPA35nt1UbJvSiUB4mk9MosT+Q8XlNae2Dxef2FkJWdaID
	99wtXgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TR2-0000000Dk4V-0bqs;
	Fri, 18 Sep 2026 07:55:04 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TQx-0000000Dk2N-2IP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:55:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=w1C6Uq5LGLS5v5+hUhhr7wym9SsyY1oKg1mT464GIeo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789718096; v=1; x=1790322896;
 b=cQTyQpN72GWh0vFSP2OSSt6OoeLakd/ZFjqWUqc1nDBXGR9zWWRQY06J5rh0UbilUNacd91L
 F3G0c+rlbShg36Rvo036m6CEVa69aFhh/lsy8ZZlyrfMz+5viDApJz7MxT8J9PiA6S061DCLYQJ
 YoLnqz8tCr2yoVDATrSIr4e0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id ea360a8e458d95f5;
	Fri, 18 Sep 2026 07:54:56 +0000
X-Mizu-Trace-ID: ea360a8e458d95f5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 15:54:48 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
	alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 04/10] crash_core: serialize crash header preparation
 against hotplug
Message-ID: <aqzuSJKR03zEOCan@fedora>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-5-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-5-chenwandun1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_005459_725048_2412459E 
X-CRM114-Status: GOOD (  21.69  )
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

On 09/02/26 at 03:31pm, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> crash_prepare_headers() counts memory ranges before populating the
> allocated crash_mem array. The weak implementation used by ARM64,
> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
> two-pass operation over system RAM resources. Concurrent memory hotplug
> can change range source between the two walks and make the populate
> pass overflow cmem->ranges.
> 
> Take device_hotplug_lock when preparing crash headers during
> kexec_file_load(). The x86 memory hotplug path already takes
> device_hotplug_lock, so call __crash_prepare_headers() directly
> to avoid recursive locking.
> 
> Sashiko reported this issue in [1].
> 
> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
> ---
>  arch/x86/kernel/crash.c    |  2 +-
>  include/linux/crash_core.h |  2 ++
>  kernel/crash_core.c        | 17 +++++++++++++++--
>  3 files changed, 18 insertions(+), 3 deletions(-)

LGTM,

Acked-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e681ec9cf1dc..284d78bc3fd0 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>  	 * memory resources.
>  	 */
> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>  		pr_err("unable to create new elfcorehdr");
>  		goto out;
>  	}
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index bc087124cd78..28e7a81cf263 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>  				       void **addr, unsigned long *sz);
>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			    unsigned long *nr_mem_ranges);
>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>  
>  struct kimage;
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 77285ae3ce60..3adee1ae120c 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/mm.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/memblock.h>
> +#include <linux/device.h>
>  #include <linux/kmemleak.h>
>  #include <linux/crash_core.h>
>  #include <linux/reboot.h>
> @@ -338,8 +339,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>  	return 0;
>  }
>  
> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> -			  unsigned long *nr_mem_ranges)
> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			    unsigned long *nr_mem_ranges)
>  {
>  	unsigned int max_nr_ranges;
>  	struct crash_mem *cmem;
> @@ -376,6 +377,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>  	return ret;
>  }
>  
> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			  unsigned long *nr_mem_ranges)
> +{
> +	int ret;
> +
> +	lock_device_hotplug();
> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
> +	unlock_device_hotplug();
> +
> +	return ret;
> +}
> +
>  /**
>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>   * @mem: mem->range contains an array of ranges sorted in ascending order
> -- 
> 2.43.0
> 


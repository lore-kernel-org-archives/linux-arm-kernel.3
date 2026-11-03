Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB862606B267
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ONPfeWYc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yr6YhMmW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T78d35XJuajsWSqCh0SR2r+hq2uCDOlT3TQl7sed1Eg=; b=ONPfeWYcoZtsDODzW2ntdcdCHt
	uFwgOnMd6mGR5XCaMM26AjOKVbNSzw53EjV4YA3lw+4lhwIoz1IWRdI3+VwBZwVJjxWJiLuZfTWz1
	gj0PBQ9qfiKFxT6kw1T7ps2pVkyq3ubu7IJ8Yxp9Tquf99a2o+Uni6LC1ht1A9rQqHfcadQj6EZOm
	lQD/yPrPoPvNx9A3KcU1SpSv5YXZNAexIutBi5DJO3Oj+hm3AsdFnq5lIZxGdWyHECgJH3Ra058k2
	SFh/YSKpyvaM1Fsz8ufKVxVC9MPPPYryZA+AIhJ20dsYv5bQKI2ZqDzwtyEjn5eN1hgke5jjz0/sO
	q8zIqcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG7z-00000002qxF-20sF;
	Tue, 03 Nov 2026 15:08:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG7w-00000002qwl-3HtU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:08:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 654401595;
	Tue,  3 Nov 2026 07:08:40 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBD7B3F673;
	Tue,  3 Nov 2026 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793718523; bh=9K8j3RHNpZl6x0R5Vf5Y5d+UFsTPvm4yCBERtbu40zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yr6YhMmWqlyf6ZrUzDb5//LGZUKtAumRbIUQdzdJIQv/2YrUiXvSJnNNaaIO3ApKa
	 xDDDO4R+bOeLEerrt6xuL6/DXLWwXdqnW2hNR6j0Yq9klEonxoRpGL/6hoeVavQ/gw
	 wNghATfBBV8snGfKZfCE5tLCXLJvdpebXmoB4ci4=
Date: Tue, 3 Nov 2026 15:08:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
Message-ID: <aun4-MXVMZNrmvGr@arm.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101171030.87343-1-zhaogongyi@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_070844_966889_161C99C6 
X-CRM114-Status: GOOD (  26.93  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:10:30AM +0800, Zhao Gongyi wrote:
> An arm64 syzkaller reproducer creates a FUSE character device with
> major:minor 1:1, so opening it uses the /dev/mem file operations. It
> maps one page from offset 0xfffffffffffff000 at user address zero.
> The next openat() with a NULL pathname triggers a synchronous external
> abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
> panicking the kernel.
> 
> valid_mmap_phys_addr_range() checks the exclusive end by adding the
> mapping size to the starting address. For this offset, the sum wraps
> to zero and passes the PHYS_MASK test, allowing an out-of-range PFN to
> reach remap_pfn_range(). The inclusive-end overflow check in
> mmap_mem_prepare() does not catch it because the end is ULONG_MAX.
> 
> Reject starting PFNs outside PHYS_MASK and compare the inclusive length
> against the remaining physical range without overflowing. This also
> allows mappings that end exactly at PHYS_MASK, which the old check
> incorrectly rejects.
> 
> Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> ---
> Tested on the base commit with QEMU TCG and 52-bit LPA2:
> the overflowing one-page mapping changes from success to -EINVAL,
> while the last valid one- and two-page mappings change from -EINVAL to
> success. A direct /dev/mem mmap followed by openat(NULL) panics before
> this change; with the change, mmap fails with -EINVAL and openat()
> returns -EFAULT.
> 
>  arch/arm64/mm/mmap.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 32e0771..d6286bc 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -61,7 +61,12 @@ int valid_phys_addr_range(phys_addr_t addr, size_t size)
>   */
>  int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
>  {
> -	return !(((pfn << PAGE_SHIFT) + size) & ~PHYS_MASK);
> +	const phys_addr_t max_addr = PHYS_MASK;
> +
> +	if (!size || pfn > (max_addr >> PAGE_SHIFT))
> +		return 0;
> +
> +	return size - 1 <= max_addr - (pfn << PAGE_SHIFT);
>  }

Can we write this as:

int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
{
        phys_addr_t limit = PHYS_MASK + 1;

        return size <= limit && pfn <= (limit - size) >> PAGE_SHIFT;
}

It would resemble the generic __access_ok() better where we need to
check for similar overflow. I find it easier to read.

(happy to make the change when applying)

-- 
Catalin


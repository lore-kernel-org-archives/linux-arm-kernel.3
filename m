Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28451C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQTW6kko3l1QQi4CrjFmnxLazuKyJeyp8e+1LMaThqU=; b=wD1jVQM8v9lMTMaOhE+52+lmI8
	e7QdrLN+OLj5W6zCAQ4K51Z2uERVCAMw8tzuJjtCtT1/GzojyvBpqPk9MjkjsdpU/yOnLqoOVWe7+
	yLv4Yodi+L0EmMBYoQLIv6+VckvT2pmBTl8l/6dRybhs1F1+S7a6yfBkpV1+tEU72H0yEdH8nsrZe
	BxG2UWiEQIIZ7Tl/MIAvAc589FbmqTHHsprz0CcwDUc5D6TToILoCgf03fI56rSqRTHu+vzxcbczf
	eKXWcNIhgdVNB5x3bs9fDx/XkyCvw8Mim0iz1B0d61TIRC+GRJG9/PHwEikajxYJOhuIwVtrNt9Lg
	6V8iVQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1sv-0000000AHnC-0roE;
	Wed, 19 Mar 2025 22:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1nc-0000000AH6v-2iO3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 22:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A205A437DC;
	Wed, 19 Mar 2025 22:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6922DC4CEE4;
	Wed, 19 Mar 2025 22:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422928;
	bh=xqfK+KqTEmnvRkw96spNfhu/mnuaNMYujybAAL7pUSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i12ijldI5N0ICNvlgfikLn9YZT+PfpoaQYGzVCqV5QVQakxF/kzqU2Lqv2CAB6IHV
	 oukxy6WIyS2CbLWL7kxfJdMzkQu7gqAxRZOAa1p2mfOrX+2GDDmeDGZqVjp/kO/OLY
	 lwEEla+OizUzPM7ncFgeV1l4jIsIX4q4G8RT1EJZzEiZKhwLbsiVu+L39WLQHfLziX
	 5bZhlsYi0RShAQ0VdBbdCe0vn/QJAWYr/WEw/0VnTz19eLmx/UXR9f4QnnLZ+9C87U
	 7MKDh9fs6qsNuxlXnfxJaI1+lKuR+cSMWr2KN6CCJDgb4WPeN3wUpXKgXYd3V8OUrd
	 1bYWGngG+fTXg==
Date: Wed, 19 Mar 2025 16:22:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Gavin Shan <gshan@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alistair Popple <apopple@nvidia.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sean Christopherson <seanjc@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>, Borislav Petkov <bp@alien8.de>,
	Zi Yan <ziy@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>,
	David Hildenbrand <david@redhat.com>,
	Yan Zhao <yan.y.zhao@intel.com>, Will Deacon <will@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 18/19] mm/arm64: Support large pfn mappings
Message-ID: <Z9tDjOk-JdV_fCY4@kbusch-mbp.dhcp.thefacebook.com>
References: <20240826204353.2228736-1-peterx@redhat.com>
 <20240826204353.2228736-19-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826204353.2228736-19-peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_152208_700859_C81B0998 
X-CRM114-Status: GOOD (  10.50  )
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

On Mon, Aug 26, 2024 at 04:43:52PM -0400, Peter Xu wrote:
> +#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> +#define pud_special(pte)	pte_special(pud_pte(pud))
> +#define pud_mkspecial(pte)	pte_pud(pte_mkspecial(pud_pte(pud)))
> +#endif

Sorry for such a late reply, but this looked a bit weird as I'm doing
some backporting. Not that I'm actually interested in this arch, so I
can't readily test this, but I believe the intention was to name the
macro argument "pud", not "pte".


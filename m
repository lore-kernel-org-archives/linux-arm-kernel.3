Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C155BD0BB58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 03:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=; b=Oql5A1dg3lzZck9jU3v2ZjxGd0
	3mQa6P8tF/ZS+NN6HmMvWJPLkkKaMhDeL2qLn8clCOkWItkqHSOaBM0+3HjxUWFPPpAD3gE2UjLlZ
	P/daaue+AXPwqaz82WMBdBbJ3d6vyh0sxZtl8a6MY9yGu+oIY4ljwRa/OdR96TgoVoBGglrMOr0K1
	yIA1x2GEDGcEMsvXzV2Yf4V+L67aTALj23rSsYBdD5EpTHP6CMLJxB3SIktyuVjEDQh5AfiPUe5nX
	+Is6v3hWF1PSfN0nAsQ6MG7hQ16kRS2noV4AlWDHD1OP8qCXWonKBJYcxOowKgFV8YCTumC5UO/Xy
	Pqdq4x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ohL-0000000Gd87-3CQf;
	Thu, 24 Oct 2024 03:39:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ofm-0000000Gcva-3w3d;
	Thu, 24 Oct 2024 03:38:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1729741060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nX8OPXDW2cthIEqTMyQQblZpQUeRm1tlYext1Oo30sTtYHYcktbP6QkNaRaRkvMdBZhtUx8VMyuOZ1yo+FGGeGS0iCscen2p3GnJ1SyL8u2H85tjngG+AQ708fA/Wbe6xOriUcybgk3FqcZLV5d+YhhpIyUQHTpiQ1V0GZwo2ow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729741060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=; 
	b=XjLhS44GYUwiRMfeiBLSXehbyRQHvo6kaknTjIG114GAewi+zh78rAsKEHBbblqZNUaD0HYnVdKY6QBZ6HfPRPHw1RR+8ptBY9I6yekRvVWAnJN/gZfNwiXZ1CivAP7+qd4eraONzUwIs+Q/hbulsRZ56dZh8+L2v3nWUBAIzd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729741060;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=;
	b=cQ8vcj5jczCZFZamwVhgcpKC2ZP4/1MdOILVTF2hjwXwseYRu8QXQXCHBGN8Z7WZ
	5WRt1sT0vEYnud2HTzfxLFosZXJPwKulFSBtZYX0ZqRX2NJ5tO7GS2OAuoHhYA9KkpX
	kVPN3Qtgq2O/ILYUE5VKlxxBj81B828bnHdKV/qo=
Received: by mx.zohomail.com with SMTPS id 1729741058928285.49991825731297;
	Wed, 23 Oct 2024 20:37:38 -0700 (PDT)
Message-ID: <03c316c7-5268-40cd-af1c-4c8454506ab2@collabora.com>
Date: Thu, 24 Oct 2024 06:37:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20241010182427.1434605-1-seanjc@google.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_203807_080282_588EA76A 
X-CRM114-Status: GOOD (  14.26  )
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

On 10/10/24 21:23, Sean Christopherson wrote:
> TL;DR: Eliminate KVM's long-standing (and heinous) behavior of essentially
> guessing which pfns are refcounted pages (see kvm_pfn_to_refcounted_page()).
> 
> Getting there requires "fixing" arch code that isn't obviously broken.
> Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
> stop marking pages/folios dirty/accessed based solely on the pfn that's
> stored in KVM's stage-2 page tables.
> 
> Instead of tracking which SPTEs correspond to refcounted pages, simply
> remove all of the code that operates on "struct page" based ona the pfn
> in stage-2 PTEs.  This is the back ~40-50% of the series.
>  
> For x86 in particular, which sets accessed/dirty status when that info
> would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
> in a SPTE, foregoing the updates provides very measurable performance
> improvements for related operations.  E.g. when clearing dirty bits as
> part of dirty logging, and zapping SPTEs to reconstitue huge pages when
> disabling dirty logging.
> 
> The front ~40% of the series is cleanups and prep work, and most of it is
> x86 focused (purely because x86 added the most special cases, *sigh*).
> E.g. several of the inputs to hva_to_pfn() (and it's myriad wrappers),
> can be removed by cleaning up and deduplicating x86 code.
> 
> v13:
>  - Rebased onto v6.12-rc2
>  - Collect reviews. [Alex and others]
>  - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
>    refcount. [Oliver]
>  - Fix a dangling comment. [Alex]
>  - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is (was?)
>    eliminated in v6.12.
>  - Drop check_user_page_hwpoison(). [Paolo]
>  - Drop the arm64 MTE fixes that went into 6.12.
>  - Slightly redo the guest_memfd interaction to account for 6.12 changes.

Thanks a lot for working on this patchset! I tested it with native
amdgpu/intel contexts and venus/virgl with dGPU and iGPU, no problems
spotted. Please merge sooner, this will unblock lots of new virtio-gpu
features.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry



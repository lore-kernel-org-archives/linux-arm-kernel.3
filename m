Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BF9CC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhQ5yirY83poEzPx8x3H8aN7RnWItIKkuGofgEQwLq8=; b=SSEzahP05dp5AJ3MkYj6yrb4f2
	+QLFqU1gPXscptz/oxKPT8BiqQ5AalYPmCMEeJMfbHwuhc+rIXD9oBZ9wtT9sTxZjHXxmpJMIW1as
	gFwoq1kEA8yjbMiouswWO8H0kIQwM4+xq9cft9bx3BGyqI1YyLLb66iFv81yRucSPBMcVmhFkW/rp
	wY3DtOlACaaN8HrHBAe99IZnaYIu/XgE4LoTfb1GnV5dpFp61PRk+WZKmJPuh8LIl+xmemYJPiFqF
	HoLMp4atLf/NaSVKySz70adKwec/L4aedRpeOD4M/uqqLpiPvL8TypAPR1icaIivZss+xR7yRK6dn
	hvrwPpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvjQ-0000000F8qn-32wY;
	Wed, 14 Oct 2026 09:57:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvjO-0000000F8qA-0flz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:57:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so32290195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791971824; x=1792576624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhQ5yirY83poEzPx8x3H8aN7RnWItIKkuGofgEQwLq8=;
        b=cJOWY+TCtv/Wzim1O4Gs4OSIwW+9BQxAs+nv6WXg6TYZtarNldHdIeYb+jyI7tU75N
         S9LuGpoUUocV8YC7dOIQW8E9u/HuHA0VTfiGRmzcRTaVdlaWM2rHnzUeuTbabwmv9aC5
         ihbOCe2FjR5d12MHxuKlETC87q/TZSAx35VK7bXv9wR6eUFPSQemFNNtwSsrH5evFG/Z
         BvTC48se5Md5iiVrtyQQNsoaI4AS974FJQltDTpIcp0FnHE6k/gnG7t2UlcfQRbLMmmG
         NFyC98V75xGvDuTxxYt1HT9MsFAYFtBVOc+JM1nugYqW06GJqvOqZ+UYECE4hE67Kue1
         nRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971824; x=1792576624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhQ5yirY83poEzPx8x3H8aN7RnWItIKkuGofgEQwLq8=;
        b=jPxZAkbodI9/V8oR0KbE7Z1Sxus7/2NPCxh8mpOnS/PmRO3SE7x57McbaO0fG3X6Rd
         r03qhG9JBn9K9w+RAWQ2YwwGUUoFSaLM+f3vuRpH0TwZb8YihBtS9EKGp0L2FTdgM82D
         qDfISTk5hO1Njl7+Pa/ht+PW7tn+OOcpSDxINrQqne28QvItLcWBTTg3lB/D4a0qS17o
         iMlin0pIproWNRhFkbIgI+pbm/02fYE/qSXhmXVRemunoGA30AKRhRCln8bf2LCWhqIp
         xphrjmoaij2kSCGt3+6Ru0nBTvuYVLx6Bs20cis+dTTL9O9sat/e2J6H6QtuhD3po0p/
         OpUg==
X-Forwarded-Encrypted: i=1; AKwUvBwZI9Ho42IUopSegr/o1LnZMoC5T5YBc1Laf6DiKeakbN1x33HUgO5phvCpFmb2os+i5DQ0k8Htk286AMl+0HC8@lists.infradead.org
X-Gm-Message-State: AFq9FYItL48/dvo3V9pYdLzn/1EwU3i5eR/rJNUM9/EmT63oJbN/Qjlk
	pzfzu5BJahW8we5pVcaPJMpQzOupSay1fSkv9L6KccCDg1tcesCokFVC
X-Gm-Gg: AYBFou1OEmn1QyZMXVaQGfl9CPQqtBkUOVnWX4LuTw5nhq15QN+XJCtbW+CW4mTxIl7
	8pzjTjOOHca/M94M4i9EVGN8HgxsPud6OdEQdGGXwu1iz1xKW0KPMfzjGmdrAU8ZnFdJMbk56Vn
	mQ0cy/EaGi36ClSWUv+Ich+2gyTKcccd653vUraFO+ZifUgY4bijPke0dut9nwhxSRsjrbGIMxx
	7cadhVR/MUkGGnnJCial2LCRLcWfXYGnmpJ4eL1FDquahWF6d0YmXy2ZqioKmz1ON4fNBUDJvWx
	RprZ9K9xhSwzFS5tUHNY73YeczDfUimqnKmoqY4+z6C0RM/ilqIscjqg1P/jSh4jP7HfczXqnTd
	s1M4vR1cFd360untmsSi93s8e5ZlkSxWS6Djpd/J92NHd7rAR4sSGxcmcRk1U+IfBcg8zjPaH7i
	tNbJjIhWXmkf6kwGH6S13nwCDmeNj8Cng3GlLLTsT66LFF5bKZVe53Uv2bLtGwaI7yqnDkL0/zx
	cCw+PpWOifiSqveOGtFvyeL0mCGChvyyWlQxp30Sibq1XCev5WXNSC0yUPPPqSaKZ6qfmmyaB1x
	FqPDo5SP58oid/BicUrlpHWdkU99so7Q/49O
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr311763425e9.15.1791971824195;
        Wed, 14 Oct 2026 02:57:04 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5257sm11206338f8f.42.2026.10.14.02.57.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:57:03 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ackerley Tng <ackerleytng@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
Date: Wed, 14 Oct 2026 09:57:02 +0000
Message-ID: <20261014095702.39676-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com> <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_025706_226593_873431FC 
X-CRM114-Status: GOOD (  24.16  )
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

Ackerley Tng <ackerleytng@google.com> writes:

> When the provider wants to revoke the page, the notifications/function
> calls flow this way, the last [ENTITY] in the chain actually does the
> zapping.
>
> + [PROVIDER] -> [KVM]
> + [PROVIDER] -> [DMABUF] -> [IOMMU]
> + [PROVIDER] -> [GUEST_MEMFD] -> [USERSPACE] (AFAICT this was not
>   implemented in the RFC.)

Thanks for going through it. I have just posted v2:

  https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/

It changes two of these chains. dma-buf is gone: iommufd attaches to
the provider file itself, through a small interface in mm. And
guest_memfd now maps the file into userspace from the provider's
frames, so a revoke also zaps the VMM's mapping:

  [PROVIDER] -> [GUEST_MEMFD] -> [KVM], [USERSPACE]
  [PROVIDER] -> [IOMMU]

> IIUC guest_memfd conversions was not illustrated in the RFC: what
> happens on a shared -> private conversion?

There are none yet. Only VMs of type KVM_X86_DEFAULT_VM can use a
provider, so all their memory is shared.

> Does your provider need to know if some memory was transitioned between
> shared/private states? The provider can be notified too, if
> necessary. If not, then isn't guest_memfd doing all the coordination
> better than going via the provider?

Our provider does not need to know, and I agree: once there is private
memory, guest_memfd converts the pages, so it should tell the others
what to zap.

I think the two models meet there, and the v2 cover letter now says so.
The iommufd side of v2 does not pin and keeps no references: it asks for
the frame behind each page, treats a page with no frame as a hole, and
maps again on a revoke. guest_memfd can offer that for its own file:
shared pages return their frames, private pages are holes, and
guest_memfd revokes a range whenever it converts it, in either
direction. That is your [GUEST_MEMFD] -> [IOMMU], and it should work for
folio-backed guest_memfd without memfd_pin_folios() or refcounts, as
long as guest_memfd also revokes a range before it frees its folios.

The one difference is that v2 also lets iommufd map a provider file
directly. Going through guest_memfd would add nothing without private
memory: it would only pass each revoke on. And memory that only devices
use, such as MMIO, does not go through guest_memfd at all. Both paths
would use the same iommufd code.

> Does the revocation model work for you? If it helps, I can rebuild the
> sample provider to illustrate how the revocation can be done.

Yes, the revocation model works for us. v2 replaces David's sample
with one that moves, donates and makes pages read-only, and a selftest
that checks the guest, the device and the VMM's mapping after each
change. It may be a good base if you want to try guest_memfd as the
provider for iommufd on top of it.

> 4. [DIRECTMAP] Kernel direct map.

Agreed, that is separate. The memory we have in mind is a range hidden
from the host with memmap=, so it is not in the direct map.

Thanks,
Fred


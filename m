Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2D4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uitRDkWW53iDM4jOjF4jr38Fhuk8vDR/4csWNguwm80=; b=ztDXoBPjMh1+FDQZDB2I1//q+A
	YYQKgGawyRt/2tixQ/INdPVbKuQxPhgZAIRvM4YgcmADP0q4d+J1HUZN+IeLt159ifFHmQBYbZNYu
	3o/8aWzFj+0fWx60iQOHh55IGLPKLJEgs5m71V4+0dCNHZFFrnerjkArC7Tne0FWYFz3gowRz3pQi
	cBnUoTywKAtvTtNcqHoxBN8zR1WtWOc+yKTsiKHl3tv4OUb9+3io0JP+wC5y1A301tPZ83Rg9TIVJ
	uZizKU/KINxDiWoOn1HpTwHay/tZfvHX+DhY8+c661e3f9kL1AQTpuZQCJzVteLYVl/ZJfV1wIkLc
	C6uJ1l6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvJV-0000000ECjA-1A0g;
	Wed, 15 Jul 2026 08:49:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvJT-0000000ECiZ-2VII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18172415D2;
	Wed, 15 Jul 2026 08:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0A91F00A3A;
	Wed, 15 Jul 2026 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784105395;
	bh=uitRDkWW53iDM4jOjF4jr38Fhuk8vDR/4csWNguwm80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTTQs1kHDnv24z6sGGe74snLCNDI9BRDFvqV3VvH2UoGiOAL18jl/9sh+xVdzeprE
	 1I+twMPVuuhWSHXX51WIqCtMvpOFG1qOBBPzoip6tGHXtDVeOpqTXBjTGbr2FFpnIL
	 VLc01Le+nkjUAgDNbODM6IGcg8S06zlb+7RQSxcYeiMc5NJMnP2mtFihcOshJLo2jd
	 RjH58YOIl7PvuElpdTUJ/Wo3VQWNhjtRfveKy0ovWEC/F3TlkTf3uxBggMtgPfUTEV
	 GphG0Hd5vZ2U8OEqG43VvUi77GxBwfakSQ5av4f0VkfQ7c6fn17j6XVxYnOK9x5h9g
	 u6AK2ovZnt79g==
Date: Wed, 15 Jul 2026 09:49:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v3 2/4] x86/mm/pat: acquire mmap lock on page
 table free to avoid ptdump UAF
Message-ID: <aldJG6vysez8HVJ4@lucifer>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714-series-vmap-race-fix-v3-2-b812eccfa0f9@kernel.org>
 <13fcd4d7-0efc-4aa5-9425-8f4fa05c8eee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13fcd4d7-0efc-4aa5-9425-8f4fa05c8eee@intel.com>
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

On Tue, Jul 14, 2026 at 10:29:51AM -0700, Dave Hansen wrote:
> On 7/14/26 10:24, Lorenzo Stoakes wrote:
> ...
> > Resolve the issue by acquiring the mmap read lock on init_mm which prevents
> > a concurrent ptdump as it acquires the write lock.
>
> The move over to locking on init_mm instead of current->mm fixes the
> earlier issues I saw with this. Thanks for doing that!

No worries! It's kinda laying foundations and then addressing things with other
patches in the series, which is why Mike's suggestion of combining all the
patches in one series was clearly the right way to go :)

>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
>

Thanks!

Cheers, Lorenzo


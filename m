Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F36CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=; b=Sf/L2566Tnx1m2OmAGSry23lU1
	yoMVuA4k5vYCpoVeGh2MCMSCVm2DHEQjM9S8/qQb9yCBsWT8kh5k4Gz2dor+3fiyZj1t+9ey2wI5P
	6i7CKzyZ3be2RM+z7X+erTkjOCUcprfeHv6o9X/Barw++l740KzwClhhWX0xwwxa4hYKW9yLMo645
	WDtK5+qpkj7t5rthHxrUHgxENotNxMp0L8h6vlO8K+k4e4JT4K+S0yEIbpzCXlVfI9jnkQk6ALoKc
	P0ImgoBiRR4NWBdmq221JDLhaXOxp6wAaMGdjjJnVZHsjz6JYbo6p6xDNrkMGxmo05N//iAGp3rEc
	dwFi1k1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa8y-0000000DQKE-1WMN;
	Wed, 05 Nov 2025 09:49:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa8x-0000000DQK2-0td2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Nov 2025 09:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=; b=oSxaDdSLXKOFET+zUySX/s06rh
	KtQC+so8PPhx0nnyF3FdqvRFm9I+YfYVjHQJ6qOAZUUN5qFT1xtVL2iFU9CNxdPHy7z2hV4oEdnZ1
	ZZW/d/SHQOj6jjgiTcl793UyIKrf8H2xyhtqlJo2t3GJn0DLedFqjO3UCNqvionzqX1vEOsfIScBX
	qwGFp/xuJeCua9PUxOOhOM5Dm1jF/dDOqTit9gnGQs4+C5C2d2fLl+5clgfvdI6ZLHNyuC/d5m8r5
	MtYV6+rm6d80EftFHJlYTSQjhJ1KHHUeVO7vb75Lx0OuN9zq2x5t1g4tCKEd0VwM3R/OkX+ksbDNA
	oMvGodvw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZHC-00000001n2m-46TL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:54:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so604932b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336166; x=1762940966; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=lZoD/CMawQ23bTgpo1eI2SRwnzebrr087lKWTiglZQeknTbZYYayfDzfifh5Y0IStL
         vd/6g7ZvqnMU44nawmXCWyMH6X/X9Ru9pDUHunjCOFs6A0kqLUaltyfzOoLdsV5wazft
         4gsdoeNEuwIJjOhJTJmO5CEXMu5qmn3faHWFkDOqFH59aVWcQFGP+QG8ojjD13Bf32ix
         qUbmEvBJmbRmQHxlT8OkMpek8vfc/Z3vuvbSzvr1SJJuD714r/nKZosK0/QUnIeG8UzI
         rxuM37SliMk5tf0DnwzL/7XOmZR5dP9ndxRY36TxdGg6FywJOLPKjLvNEAXqmsM7Cm67
         gAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336166; x=1762940966;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSkImeW26wxHMAXfbe7WvrT7t//6KWteMn9Q9gZQJTU=;
        b=hwrqbfBx9jMInbYB9B28Y8mYoliN8rLlv0kC8LH5l81IikcH+baS+N0LnjvKRNtoYz
         4aM9z6k0buzAzgTpuQR+DpeXfB7WiVJL3i4q0VL6H1GQwicFU/OWM16YQh69uhoORngn
         E8u3cl1p+how9NTnhaCipDvPoBcWOwjWlMdzc18KMvbjUWRr0smZiH84qJUvVRvFUGN2
         W26gknTfj1+PZBP/+EBe623IwPCp0jXcaoZe+c1ApX9lEl8XAWqBlO7awNrWwOlI2Vdc
         LsTnEAehmTZ6exjhI+kVUptqlJUwuxkS8FPQjgN9Mt8kRerFaaoGYhyESvuxGEATXHvO
         MLUw==
X-Forwarded-Encrypted: i=1; AJvYcCUrPFz7CDSyIhyDYw1TLuGxNAUtvxPxhv/xntPce16aNCwrOhAil7kwaYvPIKfoROau4Un5vD7TKKJMS6uWaYzz@lists.infradead.org
X-Gm-Message-State: AOJu0YxxcAPQwMeNteR+y/M3weYeVGTmjgdxvc/T3Gc3sTX7RaM0IEvj
	NauqwEMLcmPs66ArCWiQIgoVmmP5Ey/xC/3fSw8+gj8Afsf5qAVGXYiZ
X-Gm-Gg: ASbGncue8+VmFBlKC35amSQ71BZQfYi7/5cl/8jQQZMCH8Z332INUEMs6ZNcN0OkUku
	PsepZsS0dSvC78+82z4J38hdUdBjgEBsQDzGVnDXoFeSd3AJDBKm5edf2htU3N/ol61Csxl85Az
	g4+jobCtAThYNtXX3PohfbpGj7lrgflLqE+WvrI6xSg7qX07yy4QpZwPOP+C6313Z0Oj8l8UJ0I
	K+x/dRSjliFwDTgvTW6YNMyw7nqF6N+F5THdMZdeQX0Xygg20d+jA3LKxB+BGzXlaQIfUzESW9g
	VoDnAWPmBw0/QrhUrEnujMTOIpk51NCEqNSvLRradR8b1eDniwXs4m6iw4TJaUT6Y6F4FyR+sIe
	DVPZ18KYS4GPnIyuQO1ylIu9Cr4PZmT+6Sw0AErjrnnDyZh4GmVAADrWVTdOml/KXQcmyow==
X-Google-Smtp-Source: AGHT+IGvXEix8Ale69u5jY13ojKwbWl3rHLnPywsClHEKGLTCQBX8z03LTjZkKtfW5wInDfRAomLmQ==
X-Received: by 2002:a05:6a20:7283:b0:343:88b4:a722 with SMTP id adf61e73a8af0-34f862ff4a8mr3711914637.52.1762336166397;
        Wed, 05 Nov 2025 01:49:26 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f765f148sm5030694a12.24.2025.11.05.01.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:49:25 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with in_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-10-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 15:10:20 +0530
Message-ID: <87ldkk4y2j.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-10-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_085359_139401_19297FB7 
X-CRM114-Status: GOOD (  13.92  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
>
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 9 ---------
>  arch/powerpc/mm/book3s64/hash_tlb.c                | 2 +-
>  2 files changed, 1 insertion(+), 10 deletions(-)
>

This looks good to me.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


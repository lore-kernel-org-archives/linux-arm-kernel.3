Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D69D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 05:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=; b=koEfX8onfFNGdRCicvTFwqIhPy
	6kHjM2L2ejLuuInH8BQ6cR51daOJC1+bXnhWsp5GdDYfw2ArCW/ngSNc+bN/ujW9ANRTo0NB5saLL
	CoT14jNp8Fs9F/tYfMme29uwxTWsecc1gr169O/nCB8zeTOBZ06o816lidvYpjiHAxIksJ96jzZGH
	0mJWCBYw3Y4wJxJvBw46xE14P9cqYPu+o/5mIeguWJDZeCvKb1SQsVT+m/8hOHiklkSvTPO7XTl4B
	iChb7Nw0sO7tm1R4zqRjtjcZqk4NVGzbsJ3xNcB5k4XXPTl9geIqZJD44kcK5bkH1z9/eX1Tfgo35
	hiJjLC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNQg-00000004i0a-20J4;
	Tue, 16 Dec 2025 05:16:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNQd-00000004i09-3ijq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 05:16:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so183477b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 21:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862214; x=1766467014; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=dVDXeb+nOjAvLIGPTz0BCFpByECL2HfwLptuzQ7Ob5lT5P0nUMwpq9qAk0SO1OxNt3
         pzj+Iw5T88q01yXAJ0Sb8M6n111WUehLFd8Xl2j/j/wh79lyuvDSoJmSezDeNnji8aK2
         +6VZ9SXmPpv69fjOLqyGEjbOIyi88ShOQ0402KlLYqBkPSez17HCpmYUyh4ZwEzLAGar
         dSJeCUoMmyN7sGPMKEkAQ/7FACYwVi6odhfSFRmLhodAGD5ThIy82wCVOGRWHfiuo5G+
         TKKeGFuMKSTWLvGL6nH1jz+O3Uhj0gxk3hn2qkjBEEqLPfbkPA9cUB2ZYwbECvSSFzUg
         40Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862214; x=1766467014;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjD+cNbyJGOMAKpBo5e8LJBh9aFpu4/6uuuLCwZXOF0=;
        b=DGOKeW5tJkkyq0WdUgWPce33X4nJNwNPJGa6fJrdkMMO1v60RpVTsJsdcxbKg+eq/g
         /fJ+QO58AMt7gMSSum95wUS1ehPPe0RFu22bB55ynv0r4UhGvL+4kcL4+gX30l1IAEPW
         9Io/tM2PqlgTzf4Aoev2YQkgCgsE+88Zs7/K0ITGYN4aD1RerD4W/O4Qn9yQGDofIzMz
         iLXK54NC4PcRnyj9dzLM/4dbq2ww0LMHimmojlOk97wB09Q32yP4+IqM2ov1UpeVhAnp
         p76RRpxXe4sMBZVEZLTggpg4Un6JnK6ejFPXB4R9r2cuVO6NNLc6wLlEQBejnTstnzTU
         7WWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuzKPRoSGf0fcYYyY9h0VjgfmU1TN/HnzDUbNRmoljrYx2MGbXs4sMxcGRWoiLAnDnk2SUFz0jNyvoKEgOfqP4@lists.infradead.org
X-Gm-Message-State: AOJu0YzqpXtO/aZh3dRg3NHcUPRS5VNjpsTusNrPKPwbQNFYLxjKIhul
	hYW+TulkI+d/uM3l+sX3kEkhQeV+vpJI/UeX5UdrefQ+MBVm4hVZPUJO
X-Gm-Gg: AY/fxX65nPk36sxXW2s9mSi4rc6CU5ybfbTuX09WnkFsCNWLZrLWkHYZg9sM9ji25YS
	oIDQgALYSif+BWdJ5VZ9qeJosRNrcV98Q07thqTeH2ChcOqAy3RkjAbufiQgBiqpN8eTkJAz/MI
	a4H+b2K97QnK1WYZK7XyeT/mR4yv6xkRFfq0AWtwiosQUEB7U/ALUbwRcvI2iXqGKywgeeTGeMU
	Ft5slct+mUOJNvcxd/U5/CPVapcBd3jEc2EzEVELxdYxvffOaMTC3EGf2zwxgRDVA3pRyriBHSE
	wCoUPaxHMlgkKUxbWtPghh7Q+0wEJYxmKFPlgM5akrZbmplN6iPxOZVp9MOzjrlajFIyVaOi5Qv
	ZE847oDTgMglOhEgDRIWiYvEqhRFWL731D1k3SZkQm+a+hsneVMq5RmwIRVw3oD0AzqxPwcIUu6
	B7eouC
X-Google-Smtp-Source: AGHT+IFRNBpu36xO7SS++RmJSf+Yd0YivNXXnhzhZN3Px6CmR0fp7AX2KZRojw083jfNpLsrb718Lg==
X-Received: by 2002:a05:6a20:5491:b0:366:14b0:4b05 with SMTP id adf61e73a8af0-369afc00407mr13380900637.65.1765862214371;
        Mon, 15 Dec 2025 21:16:54 -0800 (PST)
Received: from dw-tp ([203.81.242.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c25a87487sm14064659a12.7.2025.12.15.21.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:16:53 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 03/14] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251215150323.2218608-4-kevin.brodsky@arm.com>
Date: Tue, 16 Dec 2025 10:44:45 +0530
Message-ID: <87345b6m9m.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_211655_932410_E0C86EB4 
X-CRM114-Status: GOOD (  15.93  )
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

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter. The
> radix_enabled() check is required in both as
> arch_flush_lazy_mmu_mode() will be called directly from the generic
> layer in a subsequent patch.
>
> Note: the additional this_cpu_ptr() and radix_enabled() calls on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Sorry I was away for a while. 

Thanks for taking care of the radix path as we had discussed previously
here [1]. 

[1]: https://lore.kernel.org/all/87jz044xn4.ritesh.list@gmail.com/

The change looks good to me. So, please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


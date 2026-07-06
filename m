Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32999C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNDWrM8Kf/Ycz9KWp3LxHj0yAPyLx4c78mcYsxXCYm0=; b=z40BJjms1rqVwh44hCIf6Ltrxt
	WwEBZ1ZU8gjUHgX3z0bbjKBy+yRoIIdnUdcSjmxLELX/w3Q/kIHMT05Zlcx49t/EyIXAn4G6tCkVa
	qEQZVxA7BLh3oE5Gqd9F33afDa2ZVdwfhi7nRNal0oKz5flL7Nuxo2ztnqFrY5/+ew2/T0/4vkuKC
	6fWE+ZzGlN/4eQhotFen/22YlRiScRtYBnNAe38jEX0KZ1e5omS3hdEOMgJA2RfQ/rV5aJtWSbQ8R
	KkrDCU9vjGF2mdW2rrJTUJoBwStSv4tg+y8wT/mAOiUTFoEyWgIKjnKNakgf4siAW4q9FcOIvHY3z
	BHOD7o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgidm-0000000CUdk-3onW;
	Mon, 06 Jul 2026 12:41:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgidk-0000000CUce-14te
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:41:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b77b150aso28267555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 05:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783341693; x=1783946493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNDWrM8Kf/Ycz9KWp3LxHj0yAPyLx4c78mcYsxXCYm0=;
        b=cQdGQ7cmNQeNwkgcvy0uODcfHmJj5jNrWiskBTqZ/aoK00y6Qz6xsn/PI3HLr0tGZc
         fiKfr/ut+A+i1iJ9eNF3ER7QqWVIIa5vN/cPw+sXYi7+RWgDIXY1u/8HAEUoy1ONOmfB
         KWsZgkRsZ6xzToYEYtcBXbzI5cTwCWiEHiclZBkPZIuWhr9uxw/KQaRdGg3i2CR22aoy
         ae4TbQB9DJEwIDbJSUzQ4GWVd+pfOy3PQOIU1V7couWtlWLgCsH82KhA1UqFx4/Hcvts
         gwSGweeP4ofzlXdDV+kBO0y95xPR2hxk58pKJd6DaxIav25sboycc/88JPFIwTLECWZo
         DwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341693; x=1783946493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNDWrM8Kf/Ycz9KWp3LxHj0yAPyLx4c78mcYsxXCYm0=;
        b=qYFv2Y2+quLQhQwNDgV0Vr1Snz7GxIQ/cFrlLIYgjLoUjjGUjC1HzzmtgpcuMQwtQW
         XikNbKOKJZchXq6Yr5v79O6uxzLk51c/VA1vSDINtIeHIuDxjS/SBZEDnBH57EjXt6jW
         KPe5CMUsicNdoe7Oa1YrufifwRqruflBOGMgyfCDpV40fpkTWXSA5CGektRrBPEGUz/j
         ubkd99bDJgfBPZwiObceGOca4YpLdBZ/q/gFIrw+hPVX/iDxYSEQfrdbg2AogJKQKITp
         A3kHb2Fl2dBOdHgJ9xL0vK5YYroSqwojlKhXWrHxS4l8tAhL/emTfhSJi6qm66dDit2g
         2oJw==
X-Gm-Message-State: AOJu0Ywt0MPXFSz8sGjIL/HReTok5MxVMOJr9RtlN8vB6z/F4601Y8Iu
	H8t/7hzwX4/V+fmBJsh6TpoMlHGobnmlChdqzPx2k7/vvsstYnP9Ta7wLC+2y09hPMthxHtt1Lk
	eGd95pg==
X-Gm-Gg: AfdE7clYChUrKa9IstL9nY+gwnsEugupVWcPrJMsMxYmW+HNyBDqvO6x73JFF+YXuP1
	XoKIo4zyUwXxoUGIg3Rinci8TnM1vznG7JuNlIXOeS/wSMsxxovkhL8D8ep1LXss6xMOriP9laM
	1RsAcikhOruaVvaQ5nKCUTLYvvbwHBPOe5PGiFghioU3GOtiv/n7pR98OjsCVlxZTfSHRvc9AlO
	iWKDFTR50dhzF/4PTeK1l/CYQGm0kD9EgQdCNJidUksQdDK9oWT7YKYRd4Gj1q4cyJq+yYgWaDU
	0w+/N9DO4GgZRFd5NoOj/ajoXhZZ9zpm8oDVAn4DByDoROUemeoQldb40P5wty4LHqkOaHFE7jw
	slPmMPkZ/5OVfMg0IxYUGNvJr4uwPfOacAwMTCcUDFUBPggrvl+YlQoKmB0scmp5/QW85IvSu31
	FZXztu+xHThZGT5zfBCbtA2vAllH2hANEOe7Mukxpg8GMs/54=
X-Received: by 2002:a05:600c:154e:b0:493:d216:ed96 with SMTP id 5b1f17b1804b1-493df0b6a8emr2959835e9.9.1783341693045;
        Mon, 06 Jul 2026 05:41:33 -0700 (PDT)
Received: from google.com (97.113.76.34.bc.googleusercontent.com. [34.76.113.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm326134815e9.3.2026.07.06.05.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:41:32 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:41:29 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the
 linear map
Message-ID: <akuieSDlbYdHnkCV@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
 <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_054136_312872_F5067D55 
X-CRM114-Status: GOOD (  18.18  )
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

Hi Mike, 

On Fri, Jun 19, 2026 at 02:40:40PM +0100, Ryan Roberts wrote:

>I don't think this is safe in general. Let's say we have a 2M region split into
>512 x 4K PTEs. It's possible that the first 1M is one object and the second 1M
>is another object. Different CPUs could set_memory_*() on those 2 objects
>concurrently. If one of them then calls this function, we could end up
>collapsing the whole 2M while the other is trying to modify the PTEs and they
>will race.
>
>Note that splitting _is_ safe (and protected by this lock) because you'd have 2
>objects backed by the same PMD, so they would both have to split before
>modifying the PTEs.
>
>I think you'd need to ensure mutual exclusion at a higher level if doing this;
>probably execmem is the place that can ensure that no objects within a 2M region
>are racily trying to modify their permissions?
>
>Thanks,
>Ryan

I wonder what do you think about enforcing mutual exclusion for permission 
changes to the ROX_CACHE block as Ryan sugest?                                          

Would it be appropriate to add locks (over `&execmem_cache.mutex`) to 
`execmem_force_rw` and `execmem_restore_rox`?
                                                                            
I see that x86 has a lock that wraps entire process of updating attributes 
(including spliting and collapsing pages):                                 
                                                                            
```                                                                        
         spin_lock(&cpa_lock);                                              
         ret = __change_page_attr(cpa, primary);                            
         spin_unlock(&cpa_lock);                                            
```                                                                        
As I understand it makes it safe already.                               
                                                                            
However, on ARM64 there is a split lock (which works fine for spliting) 
but for collapsing at least on my implementation it is not sufficient as
Ryan pointed out.    

Best regards
Adrian


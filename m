Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB83FD88DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 03:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO8RhD7fGikYRNYtDoD/8DClVqthT19fczPJykhciJA=; b=pCTk+XsPt0/al8FvGP9YovtXR/
	JG4kHiNmKt2B+EKSHUSUamL6EXyDsOioyEC3eoyouFGGrzm2bOYcS5WIJHFR42hrlSMNamta/fuxX
	ukx06ZocsYzhPj9fe4IM70PgOUTkOktpHmLkXXeccL1sj03FZQP34OQgWv9T/a78aEqzGqb1heC8Q
	H/xw0ggpeXhfnBXfLoDNV5stPNIIIgoGfn+1T/YJ8IQ3STG7oi5l4tIulPfF76LVei6y/xAgDFPBQ
	dlXx13ws8H1UP9gP8nBvp2KawDUQqspcVklzvMW/ZquaTmF6fF4trIbGGyIPUr64PrHKHMQj82QIt
	J/usGafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09qN-0000000AaSM-05f8;
	Wed, 11 Mar 2026 03:02:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09qK-0000000AaRc-2zzZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 03:02:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-829865a8471so6183539b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 20:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198159; x=1773802959; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vO8RhD7fGikYRNYtDoD/8DClVqthT19fczPJykhciJA=;
        b=VarAXYfXtzV9d6vdd7cx/DXmfEO8i7GvX2FuMCctz/ivE8M0BB7/yvGBddRHs5MnY7
         U6gV6cY8XgMs34qjCiuNDjAZ90oaRo5L+zQZIPH2TQwYvHqr3HsU70TH8YUNHpnZidSk
         rSh1w3neVgR4+rQV+PmyhgR9bUazJN4RddPTVrIip+wQoywi1mCnMHbHhi0Ed3999AkB
         UtC5tcMFCUMNEpS2Xci+k6azUOLXf2AAXyFNfHPSPEAQqBexaJHGQTnG96vVnJjgHO5d
         E6eQhbt5yJMAN0tYp3xp06geg/TMMvBR7nuunUSTV3qOfotG9CCb/0vbFH2pXy7FzGUm
         PJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198159; x=1773802959;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO8RhD7fGikYRNYtDoD/8DClVqthT19fczPJykhciJA=;
        b=gM9IwL2GOOhDTrW6RPAOX1zFbqgh2/d6kMaN5pqpqw4aiEyTUEzShhf9O3Wzv9MaDn
         +NHIepxUG6ZFnneqwJoP6peElB6HyYKf2mNZe1WeuAIs8OulMca2hcBUJ1KTkePYD2uK
         JKxK1OJH3JmADSgyNdodkKBvOu/Hr6A4iH91ywy/EvTPUyVubdR1OzoNTuKp63koX3Q1
         xnlnK/Lq/g8gbzrQcWZHuxLM5UNyx/xI0cfkXhTjsbKNxZBgKHudLHBS3eemyB1hpxRh
         z0jtFukVF9KQVdAxQ7FVBuyQ7J/girLVYWlYc+mGbkABf1/Xf9+39gPHPGv1/PXwdtkT
         M6pw==
X-Forwarded-Encrypted: i=1; AJvYcCVajY7hGcZqHXZy/taD+Xp/LvhFkU4SKwIZvAZqA+8KD1Q0vvsqIDRuQwSULQltJXqHC67nISTo/AceSX0FBAxP@lists.infradead.org
X-Gm-Message-State: AOJu0YwyRrHIRs9BscPSjvIO+GXEsxqvFIEd5tx1Y6oq4GhScszpAuQj
	k9gxoORCNtM0PPAlNjTu3ikYos+0WIL1qwEz4u2Uak1/jrkrgOAk1jxK
X-Gm-Gg: ATEYQzzfPGDMNc9sT+fpUvEOpYf7PPpgRcEDexUfDdRp7TIFjJjoImRKvTCrfdOFcEN
	ad+xyKJYz+JAHPRkCTKcclRyzotzCOub0hQq10nJD6hNyni9kvN6uz/4T3JzVc3NANOYNAvAvdW
	T+zd9ZTv1OM6lISGGfq5FspaIYsbfuvsfH6Q+wNFRieIPm3KoU8yVYf6v8e+aDJ5rV0YSRlsAtB
	gDwqO5zIXBB72gNqYJhSor/xSjo5ZsTWNbcKwYiHn75/UtjeTvtUEHliE6zFMi663IZufBBOEvm
	cVFYZars5lWS2ImgcB3x+kYIZ1PRVUkREqbe6AVPxx+XCvmr5e4RcTB7IhytfiYVHbu4VAH/Myd
	ZO8RdFyEgjNPs1r80oq3XQrQNW9zuKRyHoQfhGDUfsj9XP8Cq2TLazQMv+TlxnWUzKbkV6w+0vk
	a0fYQfSjKchpBuH/zbrQkdCA==
X-Received: by 2002:a05:6a21:38a:b0:398:778f:6973 with SMTP id adf61e73a8af0-398c60e5857mr818593637.40.1773198159334;
        Tue, 10 Mar 2026 20:02:39 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf2725csm548196a12.13.2026.03.10.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:02:38 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/4] mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
In-Reply-To: <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
Date: Wed, 11 Mar 2026 08:29:53 +0530
Message-ID: <zf4ft6ja.ritesh.list@gmail.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com> <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_200240_754321_716A4FB8 
X-CRM114-Status: GOOD (  12.27  )
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

Alexander Gordeev <agordeev@linux.ibm.com> writes:

> From: Tobias Huschle <huschle@linux.ibm.com>
>
> Unlike other architectures, s390 does not have means to
> distinguish kernel vs user page table entries - neither
> an entry itself, nor the address could be used for that.
> It is only the mm_struct that indicates whether an entry
> in question is mapped to a user space. So pass mm_struct
> to pxx_user_accessible_page() callbacks.
>
> [agordeev@linux.ibm.com: rephrased commit message, removed braces]
>
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
>  arch/powerpc/include/asm/pgtable.h           |  4 ++--

straightforward change for adding mm struct param in the page table
check calls. Also verified building different powerpc configs using ci.

The changes looks good to me. Please feel free to add:

Reviewed-by Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc



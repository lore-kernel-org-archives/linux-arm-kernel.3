Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E7C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjRcKycCgEIdRjuuH2tPItX4wlK7ZDllY3I75Ar7NjE=; b=mOR+3M/d+Na1XpbhKorvaQAVb9
	FdmL56nYsGvYO2tSgdLuXXyECry9S/F7UywCVqSV+qi25gIKSQmf5UT4cGn/yCup6VD+QFD+8Bt1O
	Ye20d4E7PkGC34sQ+vPIFwxbijRkgv9aQAuf/PvRzmp1/zE+o6aCoAo8lsQz4Gv/9c5Zkrzy4JvK1
	aXo+/ykGVi/S8Ah7KCwYcFJem5KXRd5CrqP4IELyCcW41zrU8eIQMLtp7ZMxHeUmHabGk6lF3v8r2
	nDDYnso+6yM8OmrB/sf/KWExNITCGMMigfsuoaL0rV3uSph7JtvlFZGp1deOjTTsHf2JxS+9H+siY
	sjwnA4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyBRI-0000000FUg5-0x9D;
	Sun, 23 Aug 2026 16:52:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyBRF-0000000FUfi-3Ehp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 16:52:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso27835355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787503972; x=1788108772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QjRcKycCgEIdRjuuH2tPItX4wlK7ZDllY3I75Ar7NjE=;
        b=EzvgKeHr4bge3mTNB/UL1w0TD+F7TMoW37xi+H4WterMQMIdyVfueyyv31wqFXwoyo
         bmxgODcD83ZsutE5Ys0NY45y0jeQAGNN2GHF6HlKZbPR+KW+8g6Jk5HeaCOlsKEs+z9H
         qejWNacnBm3vQECRIsGqjnUX20DA/9D9L7VH/gOQ+BXn/Koic3iIEMDh/uXO1wKrjBjo
         E1ftrHP0VDCOYQtH5lC8NaYqZ3CREojYJn8qT2N2J2t3+yzW2DBIA1IeQftGz0kV/XpA
         Lowe6akDdLO0zaAUAHQglM56awroynIpV6/Po4lsNdVmWXjMqNSgd9p/Io5f7on4na+y
         Kd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787503972; x=1788108772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QjRcKycCgEIdRjuuH2tPItX4wlK7ZDllY3I75Ar7NjE=;
        b=s0UFM+NeHz8Lg9K9hhNhmyHmt+UuTfcwfQMIPDXJzAuiOaPlv+rauw3nb1Z+ZzEokP
         j/yjR8YgVtLPZ4wCFx/cgMYQXFM78TWa1OuIdC0O+YGeZn7ywh9hSruj/u97fOdQT20S
         vCvH0qSRqMlA/0c4VgPoqdrt7/02sUwjzeTD8+93Mvkt1ByQ4GnIDPfGOrosWKBbUr7q
         ggT0lM0eyxP/KQqnV0GnGzz84Skp7JPoCxRmppMVRIyd8zY1GShDW5o1AMZZaeboDeh+
         tOsYfFRtbfOGnQQg722jnGz6rOhDveipy6eQbe7mgRXPL1q2gNrTYbhAXN+Widq4M+MT
         hzjw==
X-Forwarded-Encrypted: i=1; AHgh+RoLpmeJ3qJ9HwwZ+45VCO5+S9tN5cD9OlYnnDBDPcUzYkmCLeApz/aH1WgPV/NMSt39VOXm6SbBUia30/zHdrgi@lists.infradead.org
X-Gm-Message-State: AFuF++nBzOEJOQ8SuVX6nsLRhH97o+rkE2zHI+9ts5irtJ7zFAZ1D8K7
	P1Zj/YcJST12Ka3cToAj9AUewyfyGRl4f3/7Rt3d61DtKw899Z6crHxfzgksCHgqtw==
X-Gm-Gg: AR+sD10McYfJI8HvDNdrbA2zE4wcvh2qXt+AQTCgBe20MyEBD+q/X8o0M24c8GKqOG4
	vZUnBNwi7i8lHs2pLFUIUIe66Ipt59d+0luyyjX+1nAf37CttS4IdeQL/ynYs/EYUX1tGXiVGLF
	4JZYptdqvohjBeX18v77ZSMU48Wqipa4qkUoy4KQwSPqvvoI5KfP3sExOrtLQQm57gH4AtJE3X3
	Gr/YAF5ZMuLqFPjoaXKMU4PRESxPGs0BjkNkDqbQNPnjlm0TVVqSIK58PsiBIrpE+RHgrJcYycN
	gSfhaeBHvXOpx4Phhwjmq+89YCNZ1dtCr2rhlTh0jHROyuFOXrFx7aunggxtT9LRF3DxpfV3FrT
	qmx2EHFGrX8kPv3SHIzYyOsHiWN8iBpvRVz7y561+uJ/GrTs3DekzApZyrUQ40XdBHK4EJksMxY
	7KEOBEtJn0J1Ljz7aEL3qtmoGdEs2baCnPpDW/Oco8Pf2jjNvQiYXjtXk2ytLheYS6xWCWogmHk
	Lq4vBXj3mBXY1A8AbaMoGbl+qwSO/ZGqE7Bs1Lkr1xeFxLN
X-Received: by 2002:a05:600c:34c6:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-499c19cbbd7mr122720055e9.12.1787503971299;
        Sun, 23 Aug 2026 09:52:51 -0700 (PDT)
Received: from google.com (78.207.190.35.bc.googleusercontent.com. [35.190.207.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c33098besm53780005e9.0.2026.08.23.09.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 09:52:50 -0700 (PDT)
Date: Sun, 23 Aug 2026 16:52:47 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org
Subject: Re: [RFC PATCH 5/9] arm64: mm: Permit permissions changes on huge
 vmappings
Message-ID: <aoslX8cDCR647ebE@google.com>
References: <20260822135323.795946-11-ardb+git@google.com>
 <20260822135323.795946-16-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260822135323.795946-16-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_095253_852482_F47C223B 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Ard

On Sat, Aug 22, 2026 at 03:53:27PM +0200, Ard Biesheuvel wrote:
>From: Ard Biesheuvel <ardb@kernel.org>
>
>Allow permission changes on huge vmappings in cases where no splitting
>is needed (i.e., the region is aligned sufficiently), or when the system
>has support for splitting live mappings.
>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
> arch/arm64/mm/pageattr.c | 13 ++++++++++---
> 1 file changed, 10 insertions(+), 3 deletions(-)
>
>diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>index bbe98ac9ad8c..20ff9cb273c1 100644
>--- a/arch/arm64/mm/pageattr.c
>+++ b/arch/arm64/mm/pageattr.c
>@@ -169,8 +169,6 @@ static int change_memory_common(unsigned long addr, int numpages,
> 	 * we are operating on does not result in such splitting.
> 	 *
> 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>-	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>-	 * mappings are updated and splitting is never needed.
> 	 *
> 	 * So check whether the [addr, addr + size) interval is entirely
> 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
>@@ -179,7 +177,16 @@ static int change_memory_common(unsigned long addr, int numpages,
> 	if (!area ||
> 	    ((unsigned long)kasan_reset_tag((void *)end) >
> 	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
>-	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>+	    !(area->flags & VM_ALLOC))
>+               return -EINVAL;
>+
>+	/*
>+	 * Disallow VM_ALLOW_HUGE_VMAP mappings unless the region is PMD
>+	 * aligned, or splitting live huge mappings is supported.
>+	 */
>+	if ((area->flags & VM_ALLOW_HUGE_VMAP) &&
>+	   ((start % PMD_SIZE) || (size % PMD_SIZE)) &&

If I understand the intention here correctly, I don't think it is valid. Even   
if it is PMD-sized and PMD-aligned, it would still cause a split because  
the loop below is not using page order, but performs attribute changes 
page by page.                                                                     
                                                                             
Best regards,                                                               
Adrian


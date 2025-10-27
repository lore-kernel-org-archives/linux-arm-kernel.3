Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD66CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8OiplbvxRK3PGzaWxhrNct+/g/8F7ug0XbeVAkGeME=; b=iHltuC/3d0aQ0itNlBcy3HhBQt
	5gXTxOQtsdrSihyZMm/yCvHgR9xcHlWk+eJiQsXzQp1HkNs3bRiulRQRDUuF+X118Kv8K2Fp51PVk
	LDMKp3gm3+7hs1tyrg2leFEiuVjS4/47Bt13i9DPhRfKf04/GIGLWT93gB4DzYUBwcX5QTBUbkF7h
	8pspghEKEL7Y/8053Ji9CO+YtLyA8Bd17gdu5hDuUWl0JclLqrB3UvMLikhGLEeKmkb7VFolmUyaq
	Caxov9NUjnZBUdgeO25OjWkDi/kGBzENWWY7Y+Vb80BpuBso65J1fSMCiOUnNOJoVtA8sMDOyFlOt
	91Wjr4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIoR-0000000DN99-00Y5;
	Mon, 27 Oct 2025 08:42:47 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIoM-0000000DN3m-3Nt9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:42:45 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-89ef0cec908so279895485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554561; x=1762159361; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8OiplbvxRK3PGzaWxhrNct+/g/8F7ug0XbeVAkGeME=;
        b=EvaaCo3mriL9SrQviT1W4euHfD6FVY7h4XoLjh55L/KtjwQxQDnV/Re7/8D9HBC5Lk
         AA49uNztljff4P/H2E1/hRm7d1wEm6NlRL/qAA0PzHMAkA4Nd6d5PWnnUP8kHWvpihdE
         qZ+qRR0PJ2XREkRifrnO+92z62WPOt4vBTRV4IPEdJsObFbT8sdFtVTgkrsUM0P28ZHg
         iu/w46YMvUrkzy6ppkGqLxVDHsl2z6YKIBHeXQIIdV+oEWyFGg4k5otOzaBq+stF+3rD
         orpY3O3ZHdMHBGcvi2aQhUMUIBNz/Ay9vPxPpnNjsSPzgWgHmNROfyswex76PmNYphl9
         SkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554561; x=1762159361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8OiplbvxRK3PGzaWxhrNct+/g/8F7ug0XbeVAkGeME=;
        b=ot02fkHMBnU0MQzLJGkdtPx+cyf1v65BBPZPAItJQozYYM3dD37bFi/B2xGIidPMfw
         diEkWBTf4xEhUl5pbLS9UcHDUM+wvvhm0zQBHtBqd74pC4RGu1T3opt+Hs1jiiuYBvit
         0a5/W2jAzw3ZX76W3ejTca07pCqh/xaq8azOe6I8IzcjFOmg4iNgX96j1kOLoEnAeac+
         sc2eyYix6i9ysEnlMan1xO+FGACjOqQnTHt7z4jHKoESAh/vMdrnWH6uhJQMQVe+viSA
         ef4kVfguTCtt4/EBUOJFXFtjCFW6RE+oCLcGfF2nlTssp5BKDFjOoFYtFewOy2gJLGRw
         RN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5jERg5GMGN0MAFGDtfqK/cUHgQHUoKw0IQECe66xg/K9rbHiqNLbSq8ZFSEeyW3njgGgmZrlPCNwba7kZEn/i@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+yd7PjSpk7Ws2p17f7d1dir8wWCfHemvJEjMcGNYH4iHRddJ
	ONDQnThQXjL1Dg8z6ciGFa71IlsN0L+UWNSLse6YbiWPDnm7Qm5KHxP6c+N6F0ypI1JQVHIvzkL
	WpT+HGpGc5JmU06O80Dyy3Ep5Fc9kHwI=
X-Gm-Gg: ASbGncvck2ytQHx8lHZkORmevVyS5L6TmQj4HoF2Ho5KooQRC/n480TVv9Ac8HWnJou
	J+IghErk/VUAsgVhaqPtR+OlLZNLkeqWDGwpNuyuKHjkYglxCrVzMcJtiLb+4oGTHBBp1rgbtDS
	bpIITQgY08OCDKMSXu07Wy4MXrJNDXvK09BxBJgxRPgIUpfK+NmScmh/sP6TgsZO1R05aWUUCs9
	TO47Mlq1I3bRWdYve44P+7/Aasr5vXCt0L23Su/8sBcxUj9W2NfjmT6+LfP5m02MOgNzRjAQ6H3
	RMLzi1Mw1p2mrlPMGFOfHxM8T/k=
X-Google-Smtp-Source: AGHT+IFX+mR137xrvZDcqT/67/gVBqUrAWDajbuXrFM2dAwerxuXEYH48nepHi6uQYXhfp0Am9+yzl1UMhOb2c+aXlg=
X-Received: by 2002:a05:620a:294f:b0:8a4:6ac1:ae9 with SMTP id
 af79cd13be357-8a46ac112f4mr279316485a.3.1761554560864; Mon, 27 Oct 2025
 01:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251023013524.100517-1-ying.huang@linux.alibaba.com> <20251023013524.100517-3-ying.huang@linux.alibaba.com>
In-Reply-To: <20251023013524.100517-3-ying.huang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 27 Oct 2025 16:42:29 +0800
X-Gm-Features: AWmQ_bk9pI0TtC_0goeD9hHvk9ke19jrv2VrqxdCfcyf-qPwd6ST0IlyubPCsHY
Message-ID: <CAGsJ_4y46gUWNR_Gc8A12UkTPybR=dc-1vmH_f6WHEFih-CqnQ@mail.gmail.com>
Subject: Re: [PATCH -v3 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yin Fengwei <fengwei_yin@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014242_894155_28B34EFB 
X-CRM114-Status: GOOD (  22.60  )
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

On Thu, Oct 23, 2025 at 2:23=E2=80=AFPM Huang Ying <ying.huang@linux.alibab=
a.com> wrote:
>
> A multi-thread customer workload with large memory footprint uses
> fork()/exec() to run some external programs every tens seconds.  When
> running the workload on an arm64 server machine, it's observed that
> quite some CPU cycles are spent in the TLB flushing functions.  While
> running the workload on the x86_64 server machine, it's not.  This
> causes the performance on arm64 to be much worse than that on x86_64.
>
> During the workload running, after fork()/exec() write-protects all
> pages in the parent process, memory writing in the parent process
> will cause a write protection fault.  Then the page fault handler
> will make the PTE/PDE writable if the page can be reused, which is
> almost always true in the workload.  On arm64, to avoid the write
> protection fault on other CPUs, the page fault handler flushes the TLB
> globally with TLBI broadcast after changing the PTE/PDE.  However, this
> isn't always necessary.  Firstly, it's safe to leave some stale
> read-only TLB entries as long as they will be flushed finally.
> Secondly, it's quite possible that the original read-only PTE/PDEs
> aren't cached in remote TLB at all if the memory footprint is large.
> In fact, on x86_64, the page fault handler doesn't flush the remote
> TLB in this situation, which benefits the performance a lot.
>
> To improve the performance on arm64, make the write protection fault
> handler flush the TLB locally instead of globally via TLBI broadcast
> after making the PTE/PDE writable.  If there are stale read-only TLB
> entries in the remote CPUs, the page fault handler on these CPUs will
> regard the page fault as spurious and flush the stale TLB entries.
>
> To test the patchset, make the usemem.c from
> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-sc=
alability.git).
> support calling fork()/exec() periodically.  To mimic the behavior of
> the customer workload, run usemem with 4 threads, access 100GB memory,
> and call fork()/exec() every 40 seconds.  Test results show that with
> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
> flush functions reduces from ~50.5% to ~0.3% in perf profile.
>
> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  arch/arm64/include/asm/pgtable.h  | 14 +++++---
>  arch/arm64/include/asm/tlbflush.h | 56 +++++++++++++++++++++++++++++++
>  arch/arm64/mm/contpte.c           |  3 +-
>  arch/arm64/mm/fault.c             |  2 +-
>  4 files changed, 67 insertions(+), 8 deletions(-)
>

Many thanks to Ryan and Ying for providing such a clear explanation to me i=
n v2.
The patch looks very reasonable to me now.

Reviewed-by: Barry Song <baohua@kernel.org>

Thanks
Barry


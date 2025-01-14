Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B24CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1D6gYEoM2XnA7p/mZdXiYm6Q1A06yMI0y9WsArZB/I=; b=m8qi8pIA+A3gMcMbYIF7OcRzwg
	x+Eg3nt+/PDtvYDcMGAZkY4iL5wGep3VD2OqmjCt0ZIOM8bCKUbQdSOILGNz03J7VuzZIYfm+QRtp
	U8UZWv+Q5i0wP0rKolUDdTc3gFuE/XrF6lDEr3fSsNaoTczd3bIRZKfbz9arvikLIlhAuUBrEJ9cx
	hxg/NLs8aW6jNXf/kk/0PTjKyh4Lk1m9HON7XVDhwmE0ik977WviFA4fzbYiweDualojM7W4MxE7E
	+Bu/57Zby4+8SxmU/4aV5iM/lubFF/hjFEUVn2B4fLCdy/2B36x7ObOudfzUShBtwhUZd+qGmkUxC
	V5eOZwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXa0T-00000007Z8A-0wie;
	Tue, 14 Jan 2025 06:02:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZzC-00000007Yyo-0n5q;
	Tue, 14 Jan 2025 06:01:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2165cb60719so90865515ad.0;
        Mon, 13 Jan 2025 22:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736834469; x=1737439269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1D6gYEoM2XnA7p/mZdXiYm6Q1A06yMI0y9WsArZB/I=;
        b=OIqWC++VFAKVhiZyjD5fLU9eM95ve0KxBRXj9O1Jv4qlfIs2FNW4QzMrzZrz9mrELp
         Y6TcF7Iz9dlClydIENBPOfWEAaLrPNNxaKZ14Wl1uONbe4aIZUapQLIwTLP3FoGTkrFq
         2NJFFyzcjaOAm4ib9PyUdOxlHJeNIpBorSFJLyEbk/8q0w2zN4x48Xy3XYU2D+0cht/G
         oZsCteeOwfUq/HVawSZe9KdZDTPY7t1HIhm2AuuYbjnmYIkcjCydWdCOrRhDvGUzp8+7
         UlrAB93nNkPKAGHJkFOmdhF2TONNsjR8oeRsrfThP1uh2m6GdY2ymPZBQUSYWPQ4tJ4H
         NQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736834469; x=1737439269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1D6gYEoM2XnA7p/mZdXiYm6Q1A06yMI0y9WsArZB/I=;
        b=t8nlnwsURMt/jVYzcTkLfbpqZ5dHWqqkAjGBDIj4eeDsC+SaxTaU5Ymy00DG2utZw2
         sEC0SNiD553u3tWVelSRDfQyPV+Dos6gz8AvPBB51/pn76sX025C2HAo6aRpg9qI47pB
         BOlCI4Ka6X87sYbntTnA6CIJVRgWNA+zJ7t456ynwXoX7lXp453UvVdjC0bqiKbA1bRu
         wU4sK+e146tJKJG1GYn/T8d8kGoKbcHAwZ2aWU2p8ueYSFl1wNhtyfED7akr/moRZLcn
         BsHBiebeSK2qriE7kYL3gtHZK1Yu4+mO+1h6fVCjh7PvzdQG6pIaci8KB/7FCbikBvCP
         yJhw==
X-Forwarded-Encrypted: i=1; AJvYcCUypZgq/A7FEDzXYczBsrwOav3gjb+9VZtnv2DNj6H7NsX/2fmcHqjM+42odY8PjCMBt4r5TIy63opTLnATno7j@lists.infradead.org, AJvYcCVK04I0/q7hqaXHZ/aH/WRKWyqqXeJDBLNVm6og6TkUKZ8tliq8+RlBaVe1tVyh2clc9pOuIqOGP+sMTxs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6OFGK6SBJeNlkQmkgB1Vkp2ue1sKCC2bJ1kD+BC1u0+y51CPz
	wtMRmmXz5T2yCUw0tjmIJQ2Sdx8kUEbrgQY1BsBaJiRFXOch8Mwf
X-Gm-Gg: ASbGncvfsGy8tQIGPyCBNco88vdhL1P+vdOp78JyqcZnOYLnSOOroDKZTa88GQ87l3t
	lgi2+hfmJP1sZWvQdkTrJKp2494VSXgI6Q4kVW8YedvqZM2dexTXsy5DNrOgP2o9Jch+C9reUVf
	tq4LH6ShwQPsgl8SU4RSf5DA7Px60HFO7VCyVLO6fNdka63S4+bK/t91YjP0mTAKgvQKbR0cvl5
	evuOuwv3kDEWnHiUoneJjcAF4GHNOGJz/g3EhHgkCnc5NPF1laUhkgi0MterSACrBMx4KYdcBeE
	HUFd68+G
X-Google-Smtp-Source: AGHT+IEDHRmGK1uA7EjxC0SWT2vjWc7ySfaqXzxlqfNbOvSfJNPnY2oCVxBO6d5hzH1KmB/6COb9uA==
X-Received: by 2002:a17:903:41c5:b0:215:19ae:77bf with SMTP id d9443c01a7336-21a83f4ea67mr365135525ad.19.1736834469125;
        Mon, 13 Jan 2025 22:01:09 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26acadsm11013436a91.3.2025.01.13.22.01.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 22:01:08 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: baolin.wang@linux.alibaba.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v2 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap
Date: Tue, 14 Jan 2025 19:00:59 +1300
Message-Id: <20250114060059.14058-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250114040914.9986-1-21cnbao@gmail.com>
References: <20250114040914.9986-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_220110_231703_65DB68F1 
X-CRM114-Status: GOOD (  22.71  )
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

> > >               if (!pvmw.pte) {
> > > +                     lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
> >
> > You've checked lazyfree here, so can we remove the duplicate check in
> > unmap_huge_pmd_locked()? Then the code should be:
> >
> >                 if (lazyfree && unmap_huge_pmd_locked(...))
> >                         goto walk_done;
>
>
> right. it seems unmap_huge_pmd_locked() only handles lazyfree pmd-mapped
> thp. so i guess the code could be:
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index aea49f7125f1..c4c3a7896de4 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3131,11 +3131,10 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
>         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
>         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
>
> -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
> -
> -       return false;
> +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>
>  static void remap_page(struct folio *folio, unsigned long nr, int flags)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 02c4e4b2cd7b..72907eb1b8fe 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>         DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>         pte_t pteval;
>         struct page *subpage;
> -       bool anon_exclusive, lazyfree, ret = true;
> +       bool anon_exclusive, ret = true;
>         struct mmu_notifier_range range;
>         enum ttu_flags flags = (enum ttu_flags)(long)arg;
>         int nr_pages = 1;
> @@ -1724,18 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>                 }
>
>                 if (!pvmw.pte) {
> -                       lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
> -
> -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
> -                                                 folio))
> -                               goto walk_done;
> -                       /*
> -                        * unmap_huge_pmd_locked has either already marked
> -                        * the folio as swap-backed or decided to retain it
> -                        * due to GUP or speculative references.
> -                        */
> -                       if (lazyfree)
> +                       if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
> +                               if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
> +                                       goto walk_done;
> +                               /*
> +                                * unmap_huge_pmd_locked has either already marked
> +                                * the folio as swap-backed or decided to retain it
> +                                * due to GUP or speculative references.
> +                                */
>                                 goto walk_abort;
> +                       }
>
>                         if (flags & TTU_SPLIT_HUGE_PMD) {
>                                 /*
>
> >
> > >                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
> > >                                                 folio))
> > >                               goto walk_done;
> > > +                     /*
> > > +                      * unmap_huge_pmd_locked has either already marked
> > > +                      * the folio as swap-backed or decided to retain it
> > > +                      * due to GUP or speculative references.
> > > +                      */
> > > +                     if (lazyfree)
> > > +                             goto walk_abort;
> > > 
> > >                       if (flags & TTU_SPLIT_HUGE_PMD) {
> > >                               /*



The final diff is as follows.
Baolin, do you have any additional comments before I send out v3? 

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3d3ebdc002d5..47cc8c3f8f80 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	int ref_count, map_count;
 	pmd_t orig_pmd = *pmdp;
 
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
 		return false;
+	}
 
 	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
 
@@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	 *
 	 * The only folio refs must be one from isolation plus the rmap(s).
 	 */
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
-	    ref_count != map_count + 1) {
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
+		set_pmd_at(mm, addr, pmdp, orig_pmd);
+		return false;
+	}
+
+	if (ref_count != map_count + 1) {
 		set_pmd_at(mm, addr, pmdp, orig_pmd);
 		return false;
 	}
@@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 {
 	VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+	VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
 	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
 
-	if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
-		return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
-
-	return false;
+	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
 }
 
 static void remap_page(struct folio *folio, unsigned long nr, int flags)
diff --git a/mm/rmap.c b/mm/rmap.c
index 3ef659310797..72907eb1b8fe 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		if (!pvmw.pte) {
-			if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
-						  folio))
-				goto walk_done;
+			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
+				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
+					goto walk_done;
+				/*
+				 * unmap_huge_pmd_locked has either already marked
+				 * the folio as swap-backed or decided to retain it
+				 * due to GUP or speculative references.
+				 */
+				goto walk_abort;
+			}
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
-- 
2.39.3 (Apple Git-146)



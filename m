Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A259CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 04:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDmPn0Nf9DwhMNzLqfPhzr9P36pEvch2Q8c/oMsgpUY=; b=xyPUDNDO4rJx3IA6/H9Kv2JcUO
	q9HdIIvVt4d9psvmLFuNeHm8GOCO2yJbN6aMITWzXzrBAcJ4NK7LCTGsOabcF7A0Si1hixB6eW6c9
	MO/W1UDxseYTuiUmFWb7qBcdbSWi0rwBEfARojzRqpstmV40pBDVfw6ObMIdUKw3XURezfvNIrOeR
	GF4KdB9859cBrf/B+NZfTY94TpZd2uzKNT430idmIKhqSE7A8J2RaET1CdZhbuKWEubKrkRL/FKwY
	iVt2GaUtVv+snxEIYoKeRS7xCwOPeChF6DTaz1LcholTm998RK/kfQIflJPaHUYEcnnSQZPGdE5rb
	ENrc4OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJP8P-00000009t7c-23Br;
	Thu, 13 Nov 2025 04:40:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJP8N-00000009t7A-38tn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:40:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29555415c5fso4562795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 20:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763008834; x=1763613634; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDmPn0Nf9DwhMNzLqfPhzr9P36pEvch2Q8c/oMsgpUY=;
        b=ellZy+PbPPfzMiZWz29h7ppX5Ep610cfMavBlXi1cyeU9PJgGj+GFDaYfliWuyHdqP
         BtcFnNRPZOTh75i38/2SXIOA+/By4/kypOy5KhWo+w2hcKLlPMSKeGoqlUioxqhGXNHr
         r96vXh+i/KeuIF2kBta/6LXT+V+uJZFdebCQZSJBlpJSVZ9BLeEVFUlT+LzVa3H8amjB
         To7dmFlAXdLX6GUT4/2UqMp313QKm7wwlSW7qqkVgIdYLhnNdG32NN5C4o03AAMEj3La
         Vk4U2l6/wSyXRGDgmuqj8Sw2BhTdP7jxqlbkL5kPrV2i1KJRBp/gAhO+SVkMQdChXrMT
         RjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763008834; x=1763613634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDmPn0Nf9DwhMNzLqfPhzr9P36pEvch2Q8c/oMsgpUY=;
        b=BG+N+6ehbUWzvgE8CoxlicjoG9JFeDrU0DFSK2eOZVK0LgIHkDGZo7uRB5QcPz4wNS
         w6n3+Rl6MDiK2sQ7fQShV54cd4hYGesCOLEIuTmswIyyPdpQ2BATRUktucVJrkDoAGGq
         tnuK9S2Q4B45n7pZAxgaUiXNxSUqhCp+jSCixwlbDmQ8RU2epPiW8OIEgJbtHfz/7HuW
         IwFQMjIBYRyWxHv2mMyaFzo3npe68T4ypsYSMQVRPEXJJD2dyUpC/LtUqwXj5jOxco90
         sDBXyOXoHhdjc4JglRDjWgOxdegZ9GY1s003Pgl9pxN6qN7Dn9ymu2zlU785XcwdQQLY
         bVpA==
X-Forwarded-Encrypted: i=1; AJvYcCXxBOuGQfy8nVOSsFPOv/fbJ4aL4JA2PdRW76Gm4UZ1HTi8Cn6dTI8WbOuJVAyEZPN8T1oFbOFqYMeSfq94AdHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+xh+bdHO3NZkHBbPpZGv2dHHAHVngrYDgRIOx+xKDHWOeJOUl
	Ox0AJmST5T848CII3fEbXlDaf06gx899KOa3qqgcMw9lZLXZNLmY0pga
X-Gm-Gg: ASbGncu3DiWbDqJj35T1de7fqcLk/BqZ3rZKJ3OKpOMdwBCacQrHxB6bMbljVBUAF6B
	A8AoZ57uNRwKZ/2Zk7NvYU92aHrbvn1W5ZNowhnVC18bYmJb+eoinz4eIHEkUw8bEr3QHTKI2et
	McWdZJh/UcHc3isgIrsSeEYownJTosxYyX0dk8saPkvyYHxZmd+XUDAlHY9/RaIPFEQ9Jkgi5vf
	x0XXDuVJtC0LlS8N1JOMqhAsbvocUyfAogvGrYiiuhaWHjmLm+qJEUxfAKklq46vjx8JJrAeWpz
	mVpC8OyY8i7Ww6D78d/SIrd0NeKctduId7D/ntJHGpH00x90yJe4lz7ZIRbsuoCt8JNcUwmgUWZ
	MSzGPqbaFJh/5HptZR6FkF+cb6+m6Y6C9Ng4fkfgJP9iAHAVsFfhJwVmtDJAG9atHxi9KOcPtvr
	dcj/3kDwR9vKAvGeyaraKRHw==
X-Google-Smtp-Source: AGHT+IF0ZSMjJ2Lc8kz3EXKwlmPjL5NLaFbg0SkOYJJftW8mAPB0mC+cHp/6QWluZgrL5V9rxEgvaA==
X-Received: by 2002:a17:902:e788:b0:297:e69d:86ac with SMTP id d9443c01a7336-2984edc8d1bmr74152995ad.39.1763008834480;
        Wed, 12 Nov 2025 20:40:34 -0800 (PST)
Received: from localhost ([45.8.220.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm8683655ad.61.2025.11.12.20.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 20:40:33 -0800 (PST)
Date: Thu, 13 Nov 2025 12:40:30 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
	workflows@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/27] mm/ksw: Introduce KStackWatch debugging tool
Message-ID: <aRVhL91rSZXyZ83D@ndev>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
 <aRIh4pBs7KCDhQOp@casper.infradead.org>
 <aRLmGxKVvfl5N792@ndev>
 <aRTv0eHfX0j8vJOW@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRTv0eHfX0j8vJOW@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_204035_796627_D4BBFC39 
X-CRM114-Status: GOOD (  41.62  )
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

On Wed, Nov 12, 2025 at 08:36:33PM +0000, Matthew Wilcox wrote:
> [dropping all the individual email addresses; leaving only the
> mailing lists]
> 
> On Wed, Nov 12, 2025 at 10:14:29AM +0800, Jinchao Wang wrote:
> > On Mon, Nov 10, 2025 at 05:33:22PM +0000, Matthew Wilcox wrote:
> > > On Tue, Nov 11, 2025 at 12:35:55AM +0800, Jinchao Wang wrote:
> > > > Earlier this year, I debugged a stack corruption panic that revealed the
> > > > limitations of existing debugging tools. The bug persisted for 739 days
> > > > before being fixed (CVE-2025-22036), and my reproduction scenario
> > > > differed from the CVE report—highlighting how unpredictably these bugs
> > > > manifest.
> > > 
> > > Well, this demonstrates the dangers of keeping this problem siloed
> > > within your own exfat group.  The fix made in 1bb7ff4204b6 is wrong!
> > > It was fixed properly in 7375f22495e7 which lists its Fixes: as
> > > Linux-2.6.12-rc2, but that's simply the beginning of git history.
> > > It's actually been there since v2.4.6.4 where it's documented as simply:
> > > 
> > >       - some subtle fs/buffer.c race conditions (Andrew Morton, me)
> > > 
> > > As far as I can tell the changes made in 1bb7ff4204b6 should be
> > > reverted.
> > 
> > Thank you for the correction and the detailed history. I wasn't aware this
> > dated back to v2.4.6.4. I'm not part of the exfat group; I simply
> > encountered a bug that 1bb7ff4204b6 happened to resolve in my scenario.
> > The timeline actually illustrates the exact problem KStackWatch addresses:
> > a bug introduced in 2001, partially addressed in 2025, then properly fixed
> > months later. The 24-year gap suggests these silent stack corruptions are
> > extremely difficult to locate.
> 
> I think that's a misdiagnosis caused by not understanding the limited
> circumstances in which the problem occurs.  To hit this problem, you
> have to have a buffer_head allocated on the stack.  That doesn't happen
> in many places:
> 
> fs/buffer.c:    struct buffer_head tmp = {
> fs/direct-io.c: struct buffer_head map_bh = { 0, };
> fs/ext2/super.c:        struct buffer_head tmp_bh;
> fs/ext2/super.c:        struct buffer_head tmp_bh;
> fs/ext4/mballoc-test.c: struct buffer_head bitmap_bh;
> fs/ext4/mballoc-test.c: struct buffer_head gd_bh;
> fs/gfs2/bmap.c: struct buffer_head bh;
> fs/gfs2/bmap.c: struct buffer_head bh;
> fs/isofs/inode.c:       struct buffer_head dummy;
> fs/jfs/super.c: struct buffer_head tmp_bh;
> fs/jfs/super.c: struct buffer_head tmp_bh;
> fs/mpage.c:     struct buffer_head map_bh;
> fs/mpage.c:     struct buffer_head map_bh;
> 
> It's far more common for buffer_heads to be allocated from slab and
> attached to folios.  The other necessary condition to hit this problem
> is that get_block() has to actually read the data from disk.  That's
> not normal either!  Most filesystems just fill in the metadata about
> the block and defer the actual read to when the data is wanted.  That's
> the high-performance way to do it.
> 
> So our opportunity to catch this bug was highly limited by the fact that
> we just don't run the codepaths that would allow it to trigger.
> 
> > > > Initially, I enabled KASAN, but the bug did not reproduce. Reviewing the
> > > > code in __blk_flush_plug(), I found it difficult to trace all logic
> > > > paths due to indirect function calls through function pointers.
> > > 
> > > So why is the solution here not simply to fix KASAN instead of this
> > > giant patch series?
> > 
> > KASAN caught 7375f22495e7 because put_bh() accessed bh->b_count after
> > wait_on_buffer() of another thread returned—the stack was invalid.
> > In 1bb7ff4204b6 and my case, corruption occurred before the victim
> > function of another thread returned. The stack remained valid to KASAN,
> > so no warning triggered. This is timing-dependent, not a KASAN deficiency.
> 
> I agree that it's a narrow race window, but nevertheless KASAN did catch
> it with ntfs and not with exfat.  The KASAN documentation states that
> it can catch this kind of bug:
> 
> Generic KASAN supports finding bugs in all of slab, page_alloc, vmap, vmalloc,
> stack, and global memory.
> 
> Software Tag-Based KASAN supports slab, page_alloc, vmalloc, and stack memory.
> 
> Hardware Tag-Based KASAN supports slab, page_alloc, and non-executable vmalloc
> memory.
> 
> (hm, were you using hwkasan instead of swkasan, and that's why you
> couldn't see it?)
> 
You're right that these conditions are narrow. However, when these bugs
hit, they're severe and extremely difficult to debug. This year alone,
this specific buffer_head bug was hit at least twice: 1bb7ff4204b6 and my
case. Over 24 years, others likely encountered it but lacked tools to
pinpoint the root cause.

I used software KASAN for the exfat case, but the bug didn't reproduce,
likely due to timing changes from the overhead. More fundamentally, the
corruption was in-bounds within active stack frames, which KASAN cannot
detect by design.

Beyond buffer_head, I encountered another stack corruption bug in network
drivers this year. Without KStackWatch, I had to manually instrument the
code to locate where corruption occurred.

These issues may be more common than they appear. Given Linux's massive
user base combined with the kernel's huge codebase and the large volume of
driver code, both in-tree and out-of-tree, even narrow conditions will be
hit.

Since posting earlier versions, several developers have contacted me about
using KStackWatch for their own issues. KStackWatch fills a gap: it can
pinpoint in-bounds stack corruption with much lower overhead than KASAN.


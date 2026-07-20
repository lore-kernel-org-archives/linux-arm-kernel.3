Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6CEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J5yxovoCdxAOMOeUh6Y+dQmCs/UPya27GLpD3HBdBQ=; b=zX1GE6KU5jS8hlRjlNUGtc5M1G
	wp2/0qt5oeuvnUgeVuQPiT49hVLf5JWi5hHMgo4UGqHvn68iRvRuLfUyYisJNH5Z3wZQenle4aiAe
	+UQwgH9tPo1M7X5tFPfQ1+w6xDJ/aQQ76fdMcOC+zJUvv7lsWRnDz/gB0tNvk/7AWYApHKMMNqm+y
	rXSPC7j3PFuF6JYLE4ZEHTEKx8jBzFC0LZhSKvR8hP+1gr0efoQsxdj7l2XfsLOZ+5t3nes/2iVcX
	GFCT4cNQK0JC6Ogk6hfh12wuf0MXHEnAr0Q7eS50SUbOz0iYeKBr/HhrwZE7fZrOtavbVWqsmZvmv
	2aR3ecvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlobO-00000006u5v-03aW;
	Mon, 20 Jul 2026 14:04:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlobL-00000006u5Y-3SpW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:04:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4798bea72f9so5290800f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784556250; x=1785161050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9J5yxovoCdxAOMOeUh6Y+dQmCs/UPya27GLpD3HBdBQ=;
        b=GUTytd0HJquHv55Se7OD4rkWJjy1NoO3F8O89ez5lTKANgNzvpAwVNVzhmFXvxjgGD
         sWPLPnhMrC66I8t3dw2dXHaUJMYcKq6vRmkeIxRQCmMP3lVMJ4ci8hkVZxLEy2+Su4Fc
         CSGuCbJ8j5LTpvTGfIPzLT9qtrAXZJxAL/3EfNZbsDsHkMtchSwEs/Bq/4o+4MQPMxqH
         LcLKeqDeP5vJS1Xq1VMH6dbUFl1n2KJju/XPoi4ABkEu//v/LEL5cggqxV7zFmg17qiQ
         e9Hs2E8WgP4mN8ihQurMuWPLs6At/tMSBGR6hFdBZz9b+Y4vJu0Q0xdtlt0nzbWPCe+i
         kxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556250; x=1785161050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9J5yxovoCdxAOMOeUh6Y+dQmCs/UPya27GLpD3HBdBQ=;
        b=Vwzvt525ZgkF+oaIlwvfJAGg+tUpdWVgJayAHcGcWhaju7LW8QhdUOBPfFBd6899Xv
         zkFf8FzGhWsjgZwuDLh7I7ap0qmU9OaCpnvGlGyCnoXjZSoyiwk15aaGuEDmg0UzDyZa
         s6qd0vJ9e2ykD60HlbQCXQLYTSS4e509H9GCUbfF1/icSv6nwyj7d3wmEIlEkE6kklXM
         mog3yD4fpaL0mjj3+GOXv8j9agS9s3yO2N1Tcl753JvnZ8UbK5jOvel3CqRjIpOz76A+
         WI31YoAK/CbFbEl3jyGxsot4jHgmkgh9ynx9vobbHVNzCcbTjpQy3xyFl8jQhQthZkJP
         p0SA==
X-Forwarded-Encrypted: i=1; AHgh+RpjAK4ELXnyv3wGDSMfM+SgWPepXb60qMfbkUG52k4VNNqcY0gFTcRfYgnvVSzRgYINBoaj9qmlXEyr1+pp7ZIf@lists.infradead.org
X-Gm-Message-State: AOJu0YwUQKIifgikdFg1BuH1xG6e5KHHCxFexdzSHlsVvrzubq4Rwe4G
	u+hTU4VWx0wr4M/ewFid54pKB1k3qfD2VZWllp+lr4+lGxqAgtUIfLASDtAvJHe+DQ==
X-Gm-Gg: AfdE7ckChiYBH7FC8Vya8YLiJS0cwpHM7xOYIxzErIZiGJYJ9rR84x12pkuKfr89xRv
	EeTqdJEwDSycDrFjlDmHHIdH2wAOZ4zFVkPeoTTlQSMZo9t0TTpAtN/Q610NrJZMzA/105W6g1r
	VmBmkojAnDOUtg8dhQmq6/xoRwsT254YtUWGHgaNI6BIOPnaBvaRRwJG0RPt3hxM8UGUwVNtHau
	HWdx45yQ1EYF3IC0LaZ0W++hXqgV4x0J7MVuY+4r9hmK9k4TjHDZBFlGZcevMK41FdE/mgmZA5c
	CpDUIpAK1eTWg7LK0vjF4Nrj36t6JjsbEFA2Xw2y47C8I6cMp62T1VavoJs0N0oVJayyS0DUJnC
	leyt+zX7IMlq8jEyy1XZ+XJmlgy4NmUrMia6RmrMtmc55n8r1aoVaexmahfa+T1SP+1goNtK15y
	3jjcqqOXMjMheoz1hiI9kG/RMGwfuBnow4C1ZHSLcmXcooiiCOuzk=
X-Received: by 2002:a05:600c:1c16:b0:495:5022:71b9 with SMTP id 5b1f17b1804b1-495502272f2mr136915945e9.33.1784556249104;
        Mon, 20 Jul 2026 07:04:09 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm185090025e9.0.2026.07.20.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:04:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:04:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 18/18] KVM: arm64: Alloc simple_buffer_page using pKVM
 hyp allocator
Message-ID: <al4q05rBGvJzi3Vl@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-19-vdonnefort@google.com>
 <CA+EHjTxRFSW=9fAYvikL2t48ykaiGp7O3Mg6ddXdtFZrmWWaGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxRFSW=9fAYvikL2t48ykaiGp7O3Mg6ddXdtFZrmWWaGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070411_879615_661DB6C6 
X-CRM114-Status: GOOD (  16.66  )
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

On Wed, Jul 15, 2026 at 04:07:05PM +0100, Fuad Tabba wrote:
> On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> ...
> 
> > @@ -193,17 +211,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
> >                 if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
> >                         return false;
> >
> > -               /* Overflow bpages backing memory? */
> > -               if (nr_bpages < rb_desc->nr_page_va)
> > -                       return false;
> > -
> > -               if (cpu >= hyp_nr_cpus)
> > -                       return false;
> > -
> >                 if (cpu != rb_desc->cpu)
> >                         return false;
> 
> Sashiko flagged this. Nothing here bounds nr_page_va from below, so
> with nr_page_va == 0 on every CPU the bpage size sums to 0.
> hyp_alloc() still hands back a chunk, but bpages_backing_size is
> stored as 0, so when init_mm() fails on nr_page_va < 3 the free path
> takes its if (!size) return and never frees it. The host can repeat
> it. Would validating nr_page_va >= 3 here work?

simple_ring_buffer_init_mm() already validates nr_page_va. And on error, we do
seem to rollback properly and hyp_free().

So I don't believe there's anything to do here.

> 
> I don't think the rest of Sashiko's note holds: the zero-size path
> succeeds rather than hitting -ENOMEM. And it's only reachable from the
> host kernel, not userspace.
> 
> Cheers,
> /fuad


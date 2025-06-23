Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFFAC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=En0pq+jCzMYs3olwKBVBf+cE3fdHEMn7c2+JHjmC2Bc=; b=Y1FTtUcNPwlE3R+jKi6/39VREm
	++d4u/GcfbYKMW1YioGnbOwjSu/WibDuEiXpC5qpVQ5FZVaXCRVeT5ooB4ZCbcTm7goZpPNRyC5g0
	umjzHpPXc6aNE6mkoFO0XiN7RBrj8m35KB+aSHW8sWEbe0znSq3hoaSLoB7x6bbAF3b9cUGV+aqU4
	yNK7ioRIvdl8lJv2I2KoONr15DQWxLWsb8dJGGHA+BH304qJYbSiJp05JrVJBXB7UU1tCqk3MdZqh
	bUTNdeMjUQETRZmsiwoeUKkZQVb2MDiHkkvgXnLFrv7+VFC32Cgok0ExWkN7sieVhQL9lTj/NLN67
	4azntjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZaM-00000001bKp-2Pmm;
	Mon, 23 Jun 2025 05:19:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZY6-00000001bCu-0gBy;
	Mon, 23 Jun 2025 05:16:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso2886094a91.2;
        Sun, 22 Jun 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750655813; x=1751260613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En0pq+jCzMYs3olwKBVBf+cE3fdHEMn7c2+JHjmC2Bc=;
        b=kaPjan7BhjqnUI+Ini1our2Ft8mtat9jf9BIcbCt01FKxC2K9UsKLl90HTFpxfE37y
         543P/A+aZp2XSE/XUkSnuQ13dqu2tk49uT36mb53+qoN9FTjclIBl4kVboNIJTD911Yv
         p5xGLY+cJRrWZOTg8O21uHFFEWS5/D58q8M8dEAhlndY/ehGzT0Rcoociz//BjMj+7X4
         MvvHO0hD9HgDhAI3atYRivu9JkxDulOjS9VEryNV+xcrpEFU2pgVjm1x+SriZC+LNrod
         F683Qs95vstYoA+UO6Zw5M6spvNLeBi+rI+WMhKU63KhnXMWEce9EsfXizdH5QjxmbMb
         fSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655813; x=1751260613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En0pq+jCzMYs3olwKBVBf+cE3fdHEMn7c2+JHjmC2Bc=;
        b=sr4/TkeZqEYIeZCfgEjdcSG33e6OEm8KXDawGtk+eDwZroQgUe2QTp3kUHfhZ95Vlx
         /fNNcdoJTc4KVurK3b98Nj8KNZO5Sn2DCdHR+/eW19Ja0q9P1D4pkuH5MfAE/b9qyfBV
         Rst4GKbKfr9E+/KZS74dTuN0B1OJAhkQ3p0ZriJLeU59nS23HtoDU4QFd+LpNODXq8Al
         o4jUtSX5OA95uXmSJpmKW7YSBEBM7awEQowEWa7gdP0oA8+kRS3IdYt33bwK3N4xwt6h
         6rSontm+CpYCS1q+rpH+b33tZGAhPPwdqiE1ezu9GoZwF2CFVnix2sxWVZVOaxbaXb2x
         zthg==
X-Forwarded-Encrypted: i=1; AJvYcCWjOdteGPnJ95dEi6mmTjGSMGko6J3oOxjABhRNPs1eGYzyzovOjjtFO3NfXQllWM0ywoju/RebiTa988zF7fc=@lists.infradead.org, AJvYcCXxuP9msStdwe1Mb6Yca/8QAHsdAMC+EDcsFiw7m75ZFjyNJktN61DW+/ba8XVhpC/DVGp3mHxGdN+2LvI2cexA@lists.infradead.org
X-Gm-Message-State: AOJu0YwavriI4L8URnaUPZHoOxqnrBrsFm1XS4UKdJFohvG4bsQEghEL
	5bm9EmN9ylDiTDwcaoHv3DA6b0+hmlvae84ufIg1OhYsq/UViivsTIYJ
X-Gm-Gg: ASbGncsCcqEQu3SCX2zoOW03Ninylq3FdrTrj6nVn3DN5g606Ngmbs7RrRQjHo2Etp/
	7hDtpeF8rt6aEEjZiXm/ktecqN1gpHKp4RXFi8n1haemyi8+Fquj1+qvJ4Y76VuTVp0IO9cVRMo
	yEokgzCZZ7JPxTSj3QKypfoLAqEHYDuZla/vkuEMXy0p4j8M1ps1/ReQdB0TUo6SdZVaVFphK49
	1JFUf5qHrjXB/hqqtkrYa82UvSQGKgHpE2Cl0671ht7iTPgb523Hjz5Fksi3Q2FrIr1qxwZzt1L
	QwRdVIgfd/rYAZ/gRoCgAxfGmVBYNA0vR9bfeM7qpbTDx0GcRWmxi7G9DE+YVU9Rq1lV8oBN
X-Google-Smtp-Source: AGHT+IG9TUKXoeyvlp4X4lyFMSjBOFbruQUMqCiCZF+ohvgS9TLgNer/JkiWcjcRvc8wDgqad/VFHw==
X-Received: by 2002:a17:90b:390f:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-3159d6470dbmr17802629a91.10.1750655812825;
        Sun, 22 Jun 2025 22:16:52 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.21.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e06ce4bsm7136997a91.38.2025.06.22.22.16.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Jun 2025 22:16:52 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: nphamcs@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	andrew.yang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	hannes@cmpxchg.org,
	james.hsu@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	matthias.bgg@gmail.com,
	minchan@kernel.org,
	qun-wei.lin@mediatek.com,
	rppt@kernel.org,
	senozhatsky@chromium.org,
	sj@kernel.org
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Mon, 23 Jun 2025 17:16:42 +1200
Message-Id: <20250623051642.3645-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
References: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_221654_205449_15789C90 
X-CRM114-Status: GOOD (  30.87  )
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

Hi Nhat,

On Wed, Jun 18, 2025 at 2:21 AM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Sun, Jun 15, 2025 at 8:41 PM Barry Song <21cnbao@gmail.com> wrote:
> > >>
> > >> That seems unnecessary. There is an existing method for asynchronous
> > >> writeback, and pageout() is naturally fully set up to handle this.
> > >>
> > >> IMO the better way to do this is to make zswap_store() (and
> > >> zram_bio_write()?) asynchronous. Make those functions queue the work
> > >> and wake the compression daemon, and then have the daemon call
> > >> folio_end_writeback() / bio_endio() when it's done with it.
> >
> > > +1.
> >
> >
> > But,
> > How could this be possible for zswap? zswap_store() is only a frontend —
> > we still need its return value to determine whether __swap_writepage()
> > is required. Waiting for the result of zswap_store() is inherently a
> > synchronous step.
>
> Hmm, I might be misunderstanding either of you, but it sounds like
> what you're describing here does not contradict what Johannes is
> proposing?

It seems contradictory: Johannes proposes that zswap could behave like zRAM
by invoking `folio_end_writeback()` or `bio_endio()`, but this doesn’t align
with actual behavior since zswap_store might not end `swap_writeout()`—it may
still proceed to `__swap_writeback()` to complete the final steps.

Meanwhile, Qun-wei’s RFC has already explored using `folio_end_writeback()` and
`bio_endio()` at the end of `__swap_writepage()` for zRAM, though that approach
also has its own issues.

>
> >
> > My point is that folio_end_writeback() and bio_endio() can only be
> > called after the entire zswap_store() → __swap_writepage() sequence is
> > completed. That’s why both are placed in the new kcompressed.
>
> Hmm, how about:
>
> 1. Inside zswap_store(), we first obtain the obj_cgroup reference,
> check cgroup and pool limit, and grab a zswap pool reference (in
> effect, determining the slot allocator and compressor).
>
> 2. Next, we try to queue the work to kcompressd, saving the folio and
> the zswap pool (and whatever else we need for the continuation). If
> this fails, we can proceed with the old synchronous path.
>
> 3. In kcompressed daemon, we perform the continuation of
> zswap_store(): compression, slot allocation, storing, zswap's LRU
> modification, etc. If this fails, we check if the mem_cgroup enables
> writeback. If it's enabled, we can call __swap_writepage(). Ideally,
> if writeback is disabled, we should activate the page, but it might
> not be possible since shrink_folio_list() might already re-add the
> page to the inactive lru. Maybe some modification of pageout() and
> shrink_folio_list() can make this work, but I haven't thought too
> deeply about it :) If it's impossible, we can perform async
> compression only for cgroups that enable writeback for now. Once we
> fix zswap's handling of incompressible pages, we can revisit this
> decision (+ SJ).
>
> TLDR: move the work-queueing step forward a bit, into the middle of
> zswap_store().
>
> One benefit of this is we skip pages of cgroups that disable zswap, or
> when zswap pool is full.

I assume you meant something like the following:

bool try_to_sched_async_zswap_store()
{
	get_obj_cgroup_from_folio()
	if (err) goto xxx;
	zswap_check_limits();
	if (err) goto xxx;
	zswap_pool_current_get()
	if (err) goto xxx;
	   
	queue_folio_to_kcompressd(folio);
	return true;

xxx:
	error handler things;
	return false;
}

If this function returns true, it suggests that compression requests  
have been queued to kcompressd. Following that, in kcompressd():

int __zswap_store(folio)
{
	for(i=0;i<nr_pages;i++) {
		zswap_store_page();
		if (err) return err;
	}
	return 0;
}

kcompressd()
{
	while(folio_queue_is_not_empty) {
		folio = dequeue_folio();
		if (folio_queued_by_zswap(folio)) {
			if(!__zswap_store(folio))
				continue;
		}
		if ((zswap_store_page_fails && mem_cgroup_zswap_writeback_enabled()) ||
		    folio_queued_by_zram) {
			__swap_writepage();
		}
	}
}

In kswapd, we will need to do
int swap_writeout(struct folio *folio, struct swap_iocb **swap_plug)
{
	...
	if (try_to_sched_async_zswap_store(folio))
		return;
	if (is_sync_comp_blkdev(swap)) {
		queue_folio_to_kcompressd(folio);
		return;
	}
	__swap_writepage();
}

To be honest, I'm not sure if there's a flag that indicates whether the  
folio was queued by zswap or zram. If not, we may need to add a member  
associated with folio pointers in the queue between kswapd and kcompressd,  
since we need to identify zswap cases. Maybe we can reuse bit 0 of the  
folio pointer?

What I mean is: while queuing, if the folio is queued by zswap, we do  
`pointer |= BIT(0)`. Then in kcompressd, we restore the original folio  
with `folio = pointer & ~BIT(0)`. It's a bit ugly, but I’m not sure  
there’s a better approach.

Thanks
Barry


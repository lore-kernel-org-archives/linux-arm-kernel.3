Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69697C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=; b=IJij3gdi2r1BsbBs4qa2CkjrNW
	Hoh7BONKFJ+KtGEklAzFvfnRN28rSe7dKph0i3dWJT+HHTKV27pXyxyfg8Adsnu4gvmSCLwVHYeXO
	sBHg31hf2pPvzzjf68z+dtMvdIQMJDN8aIrEgUzxCd96GSPlh0Gk4QySrGcMJhUhsJbTQ+0YMWfF9
	ur6JJi/iFcwC1i24LSeDfI/lSEZUJNmyO1RDihOabyvygSI6emKHYfiNLKbFWnHimrwCjrR1/Fsg+
	BWy6cwBYVwx2BIBBgE7Ss/sjYVLYGs5jX2RfemQxoQ4z16Kqu0/hNl0F1GXbDeomlUKkiwPVjaHaQ
	vwO8RQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKB-0000000FL9X-3IzB;
	Wed, 02 Sep 2026 17:00:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oK6-0000000FKyI-1VUf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 17:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=; b=BeL/IgXDkChkiVh6vqvqVZp6pY
	P/XRsjrvJwvWGYpXl5gFfygLC0ZPooQNsp6eHVSmHyzzjb7RBGIJRiJFJbiSLjfpZUevyw9v4ES8T
	1HnqtpFtzHQyjE1ky+ZbEHw7JjIvKD5VEMw5sbPwzquHv3G18ygNasUovJ8lTNib54/+GPc1DJwfd
	6WYLCnAU2vnbRkogD7CaZsu2koM4C+WP9xooMIMbJmo+f0+z7enXq00ehuF2G1o7TFoFmaCF7u4Tp
	WvTKlNidXf0ubqRZD37MPZ/stAGnLjZ2T9A7ZBw18zS+HKcQDeTluWdpTrBogGCPXPHitq8rUZO0x
	+aSgseXg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1oK3-0000000CEkW-0N23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:00:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-482dbe4d247so572810f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368425; x=1788973225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=;
        b=cGAIhd2lST1o1KXdlG9Y5YQ3dYvsKuu9VgvPSLI9KqWrABRtBbxZGUQjAxjk//Q596
         wuHi17Us4nYMrDD+2Ts/NstGFtMG4nNeGjmFXccxBaBGX4zGA2gf3aKBY/yzyDlXnFsn
         POD9mn5cv8B/0mAYOqNJj5GA8iErq+DnrBStY7ktkzkS2UzaauZj9YYqJdGucvgSgOrp
         7DI6pNvfwvXXTMa7B6XQTfjbGAkGZf5wnydMpOz9+eDGYcPFhsnOdWzZAVI2mtN9DOqa
         AP/PaZsCjiJn1goQDXGRNmvHZACIXGLt82rMhJOCxR7T6wGBAKGothLb64Xv58T88zPO
         e1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368425; x=1788973225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=;
        b=duruWikyCb5pPfR9N+fV/sQOg0YXsFgsd3BQpoHoOR3LmV8ROD2Jr3zuzAU07o45Pc
         qo1Tjg7XVKkilhQp1qsc3wWJ3sepC6oHB8eR+IjDWJgfcLiVfqdCwIXmD88hyJkhzh2a
         WKIolexJzEaXKDlRcgyR/yJB+DVApB5FPgMZHXBtjhRdwF7UpA39xzg4MC6R0jx7HwAs
         XY8ZUWZTdpIulA6vM8A6Lr2tFzFm6rfOR+wXTPT85WL8JIqeMHeCSXSHONk5T2LebFNe
         +OTxC0P6KyjUFz6Yjuu8XciH3JI7YRXmn9kk7KfsdkQY/jYnAkflbVaeEJdp9wiBxJr9
         OwCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWHDRYNJ0BNPv7YN5gREjooRMn9DR/os0iRMXYiYYYyGRCE9PxAZNR5pjIBEVip/fpfC4ik/hrEgnqByAYDo4g@lists.infradead.org
X-Gm-Message-State: AFuF++kKDmz266pXeFnboimtffE0CWpdY0uidG5ye+wKC42lKY9DO9lk
	uKjKjHqiAh9G2+4eUOEnQtRgxWD2E8a3DW8h0sfcKtHAL6R9wtcL+h6+
X-Gm-Gg: AYBFou0yKAaeTwLfxR8cJC8t+aD0wGAZB5CknTxqsXO+hU17mJGP/uz8hsTO8baD/eu
	sWa6kwPP/RBREAZOZ4Ux/7bKFJPOck/wiizqDR1+vIT3SO0m+3ZX1ObL9WsVLZQCYvxdmkH7wWM
	d8UkA633GEGFyJXKT2bGK825uYrinzoRMkeAePgk3PvkgwY5hv5VEAt2TvXlVToQofOO4R/QyR0
	kViFTL1cMIjDim5ZecF4IhaX9/JHR2SbGEemXnh/5mjFgidY6+A2yYVGJJ6j3jDnia06ajaOVKV
	5CzV5SysSEo6ImCQWAxoVd/x5wl0a85HWYzMQwiGHIEsbMg/rhzjyJB9QiH8iVZ/kTsTz0AYalT
	Km80JMGD2dlDcublz4TOHDMB5opgEfbA0xmmm5FqNm7sE1dQyiKoU/kfrxihIdNa5vuSyJ+uDJy
	ljp8p8K6I23R9av6pXY4IQGbERw2jlUy1bJ75Dtik/afmyWieq5AplOWPrliZDSTMTjmOIJpRNB
	EH0CuqLsNc2vNI7oVE4/e9F20SJmGTpyWLWnQFJ4g0PTv74b5tPYM4JzwCWch9i18yIrjM4C3Z+
	8TYtJhLvQGO94tN9ac5CtEfSIMnIX94uwUg=
X-Received: by 2002:a5d:554c:0:b0:482:e6ec:4edb with SMTP id ffacd0b85a97d-48488f1b148mr8670058f8f.15.1788368421495;
        Wed, 02 Sep 2026 10:00:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-017-232.77.7.pool.telefonica.de. [77.7.17.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm7345851f8f.23.2026.09.02.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:00:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:58:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aphUkaF4mXlxAuCm@gmail.com>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_180027_315038_2D844BFF 
X-CRM114-Status: GOOD (  13.61  )
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

On Wed, Sep 02, 2026 at 10:08:58AM +0100, Anshuman Khandual wrote:
> No user-visiable failure was reported even without this change ?
> Missing TLBI as seen in QEMU is the only clue here ?A

This came out of an experiment to add warnings for architectural
details that QEMU does not normally model. The checker tracks guest
page-table writes and TLBIs using a shadow TLB.

It reported 3072 contiguous PTE transitions without an intervening
TLBI on the unpatched kernel, none with this change, and none for the
already-flushed write-protect control. Together with the code history,
that was the basis for the patch.

As noted in the testing section, no user-visible failure was
reproduced. 

I also tested an unpatched kernel on a Raspberry Pi 400.

The Cortex-A72's L1 data-TLB refill ratio was approximately 1:16 for
the 64K hugetlb mapping versus a forced-4K control, indicating that it
amalgamated the 16 contiguous PTEs. A contended test still completed
85,396 full-range permission changes and about 2.8 billion reads
without a fault or data mismatch.

> But you have not seen any real TLB conflicts even on custom QEMU ?

No. QEMU does not model the stage-1 Contiguous hint as a combined TLB
entry. The added checker only logged the page-table/TLBI sequence, it
did not change translation behaviour or inject TLB conflicts.

Thanks,
Karl


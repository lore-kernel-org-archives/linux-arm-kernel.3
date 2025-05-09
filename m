Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1658C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SdXRG7RMOcGcSkcOmgddaIl70trvrvcQZYo0G1lX58=; b=DZZ0xZmNUidwrwRrVwTpP+HoVs
	s+D8Del+ZFsLK73hPdY4gKBkQn+1GgZK3FpWtlyYE9Rz7ZQebze2fIIlMXCpdjaLZPp8EWWl/Dn6+
	+2iWlEPuM+GeznMi9GgS09dcqjDmKuBKpLh23vJMA+YwV7DCgbGq1v5phL/TyFYXlIUr9Lejru3t7
	IvDsDq95M0hPOKI34h+VtXeC8eJWbc5gtVXoeL0wMXoYsty+Q1fFkuDxCKxEFE3Cdv46OBRer5fr6
	Nzjexlz35D3kilwSkZmbZ7azm9GpPxpamTHpE7tahb5lvYIm/IsvpKfBofkACdI/1HuxJ40CpHsNL
	MWsnSpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxx-00000004uxQ-2KFn;
	Fri, 09 May 2025 21:09:09 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUgD-00000004tPr-0eos
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 20:50:51 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZvLk912xRz9spL;
	Fri,  9 May 2025 22:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1746823841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SdXRG7RMOcGcSkcOmgddaIl70trvrvcQZYo0G1lX58=;
	b=rG01sxaH+rCqVLlhWdLqiLaZzCT3l3yOBNy9rMw3G/0e1HhACjPeme2+mhhdloKhy+yuPn
	CFI5bkUTjkTrzGmxXiDFAwhv/cC3o/YsBKE1J9W0EgRrldxPShQvMfl4oNZz2vf4Bk0CCL
	4FYRofVykvh3SEKvljDUkRzmZZev29V7ravpCcR6IkdqEDBu0j7OeM+855TxVCUsoYQPCn
	C0x1FC/xU9/ZuRkDONc6t16fVmRc8ULeFSYHoWDUTjbwMIskQLbiIOu3ZNipzqx/+d/ME+
	iy7boEy+3xpOVC7yyYAuM94+4xBVMjHzLDXDk88D3GykyIAXUNobJT2z1NuSDw==
Date: Fri, 9 May 2025 22:50:32 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, 
	Dave Chinner <david@fromorbit.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, p.raghav@samsung.com
Subject: Re: [RFC PATCH v4 1/5] mm/readahead: Honour new_order in
 page_cache_ra_order()
Message-ID: <pskrpcu3lflo3pgeyfvnifcn7z2o6bsieaclntsbyvefs4ab3a@cyfnf36mccvi>
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-2-ryan.roberts@arm.com>
 <nepi5e74wtghvr6a6n26rdgqaa7tzitylyoamfnzoqu6s5gq4h@zqtve2irigd6>
 <22e4167a-6ed0-4bda-86b8-a11c984f0a71@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22e4167a-6ed0-4bda-86b8-a11c984f0a71@arm.com>
X-Rspamd-Queue-Id: 4ZvLk912xRz9spL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_135049_331122_2AB9CB22 
X-CRM114-Status: GOOD (  21.07  )
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

> >>  
> > 
> > So we always had a fallback to do_page_cache_ra() if the size of the
> > readahead is less than 4 pages (16k). I think this was there because we
> > were adding `2` to the new_order:
> 
> If this is the reason for the magic number 4, then it's a bug in itself IMHO. 4
> pages is only 16K when the page size is 4K; arm64 supports other page sizes. But
> additionally, it's not just ra->size that dictates the final order of the folio;
> it also depends on alignment in the file, EOF, etc.
> 

IIRC, initially we were not able to use order-1 folios[1], so we always
did a fallback for any order < 2 using do_page_cache_ra(). I think that
is where the magic order 2 (4 pages) is coming. Please someone can
correct me if I am wrong.

But we don't have that limitation for file-backed folios anymore, so the
fallback for ra->size < 4 is probably not needed. So the only time we do
a fallback is if we don't support large folios.

> If we remove the fallback condition completely, things will still work out. So
> unless someone can explain the reason for that condition (Matthew?), my vote
> would be to remove it entirely.

I am actually fine with removing the first part of this fallback condition.
But as I said, we still need to do a fallback if we don't support large folios.

--
Pankaj

[1] https://lore.kernel.org/all/ZH0GvxAdw1RO2Shr@casper.infradead.org/


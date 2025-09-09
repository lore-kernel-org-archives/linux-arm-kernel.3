Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A67CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDNbPtcfIaumxIyBJ2RGyPKbViivs7UqJ3a/5CcYXNc=; b=d3KgcvzhokAaLPxnkCo7KWG3F5
	u1KpCxyX2okrvFMlOkygq3rkwfdsZ0YNODIbnDJ61fVIB7fLVOwj+brM5fwTBrDtd4Ivm+4U18TST
	lpHiUpv2N9nztDdmysd43kE5o6spYTGi5S8Ven4ZryJVkVAFwg/zwgTqsSB5WjNjAu9mSu4AG4fdY
	0LbL31vP2Jm3ip+Tp1RB+Axy7bplnPFMtpCLGnW8hoI23VG7nQoadih7ptKoBRwVNliml6H2hj/oC
	PKE5iqRcgT266VomO+OSTZL7LO2j0zhsnpl28w0I18ceRwHojq5OyJnWFyh7Ql0qhh5kcSAhm7yMP
	7wvSiXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIg-00000004y1t-3DIJ;
	Tue, 09 Sep 2025 06:57:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpv2-00000004BLr-0Nyy;
	Tue, 09 Sep 2025 04:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05467449E2;
	Tue,  9 Sep 2025 04:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9D2C4CEF4;
	Tue,  9 Sep 2025 04:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757391922;
	bh=RrzY4SDc18Ci2TyOyhCgyGYX7hmnnBCU2e/pxbH8zRw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i9pJ18PLXuxKbzs/Iruw3PpLBgKXy9ssEffV+i7Q9gMAvoRB7kzd+iGGYRZ4Vjd4z
	 nsdDoX1b8RjqFfB2U020ZMoVgWz32DH/3KHr9yu4W24HNyAdp4ShFmw5Gwb3/8dyxq
	 YI0F046jfWbWEKO92OxW3X9LzuK+WjtFkn1xH7Gk=
Date: Mon, 8 Sep 2025 21:25:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>, Brendan Jackman
 <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>, Dennis Zhou
 <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org, Jason Gunthorpe
 <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner
 <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu
 <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Suren
 Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
Message-Id: <20250908212518.77671b31aaad2832c17eab07@linux-foundation.org>
In-Reply-To: <64fe4c61-f9cc-4a5a-9c33-07bd0f089e94@redhat.com>
References: <20250901150359.867252-1-david@redhat.com>
	<20250901150359.867252-20-david@redhat.com>
	<5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
	<20250905230006.GA1776@sol>
	<64fe4c61-f9cc-4a5a-9c33-07bd0f089e94@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_212524_162652_4899BB4A 
X-CRM114-Status: GOOD (  14.63  )
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

On Sat, 6 Sep 2025 08:57:37 +0200 David Hildenbrand <david@redhat.com> wrote:

> >> @@ -3024,6 +3025,7 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
> >>                  return 0;
> >>          }
> >> +       pages += *nr;
> >>          *nr += refs;
> >>          for (; refs; refs--)
> >>                  *(pages++) = page++;
> > 
> > Can this get folded in soon?  This bug is causing crashes in AF_ALG too.
> 
> Andrew immediately dropped the original patch, so it's gone from 
> mm-unstable and should be gone from next soon (today?).

I restored it once you sent out the fix.  It doesn't seem to be in
present -next but it should be there in the next one.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA6AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKQlPBogcw52MPx0HPf6gTPAdV2ZIbKmRy+k7i7XGCU=; b=a8pa1KoIBnA4kYg9991z9Pk8py
	V50gZaZ8GpmS3FNQxNmdnpj3UbIeQV4RnrXIlnLfKrpPvyDlWe0dtKMZKcWgFRndWsPW7Lp+eHi7j
	8048thsKXA02ffKOqGZLOXZ7V/2zmK3+uog9kkZU3kFVOcLgmvZWVLsOiW+DnTySu0Rop+LM6wwyY
	OjaDUyQMng1a7CEzgnygIQyfEeO9LCfY8KNbHmh0uUE5zL/VrTYlLYs19teWbfEoU3DR0bDaRJjcL
	How21yUQMCIAXCGbRt5aDFeIqj+g2yFOcWMcLp0aYFbfHYh3hytSaaF2i5RVy7rnTtrI0kr1IUkSm
	v+UX20Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8P-0000000Bwdg-0cl5;
	Thu, 13 Mar 2025 17:14:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsl5o-0000000Bl49-2N3r;
	Thu, 13 Mar 2025 16:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCF8AA476CC;
	Thu, 13 Mar 2025 16:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13F2C4CEDD;
	Thu, 13 Mar 2025 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741882051;
	bh=BQXFOxNso8FIR8jzDbLHKPtOvTBzr+ixEF9OdVlcvsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjKy5MzqzIf+Yh8yvIA5cYhQvCRvJOMZGRgCouhY4XQbqEPhgnpvqfobojD4k3n12
	 wPZl/IJFvxCMgknbhUHC+PUev3Ir7M5Nui+VNqJaWgxmhq8wH6oM576OYZdo8TCy3r
	 8jyrewO1JtE5lPWCVMoJCbFdZPhfzDPFlU5DxzBUq2kVXaupL89bbPA/R7b7owqkcP
	 9Xo/T9lSdTEOGxVaomzVn47eKegUTlGozpbyswaqQH7fTy1maVjz7LnbGNj+lF3JE9
	 A3L76Vy6ZidOs89C/z2g+3iPgSIemcEcrtz7AsPycCV8qmThcg/FZuqazBQ7P5ckJO
	 TOm/z9TRq2JZQ==
Date: Thu, 13 Mar 2025 09:07:29 -0700
From: Minchan Kim <minchan@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Qun-Wei Lin <qun-wei.lin@mediatek.com>,
	Jens Axboe <axboe@kernel.dk>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris Li <chrisl@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	"Huang, Ying" <ying.huang@intel.com>,
	Kairui Song <kasong@tencent.com>,
	Dan Schatzberg <schatzberg.dan@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <Z9MCwXzYDRJoTiIr@google.com>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com>
 <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
 <CAGsJ_4xwnVxn1odj=j+z0VXm1DRUmnhugnwCH-coqBLJweDu9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xwnVxn1odj=j+z0VXm1DRUmnhugnwCH-coqBLJweDu9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_090732_733313_3F73E45B 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, Mar 13, 2025 at 04:45:54PM +1300, Barry Song wrote:
> On Thu, Mar 13, 2025 at 4:09 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (25/03/12 11:11), Minchan Kim wrote:
> > > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > > This patch series introduces a new mechanism called kcompressd to
> > > > improve the efficiency of memory reclaiming in the operating system. The
> > > > main goal is to separate the tasks of page scanning and page compression
> > > > into distinct processes or threads, thereby reducing the load on the
> > > > kswapd thread and enhancing overall system performance under high memory
> > > > pressure conditions.
> > > >
> > > > Problem:
> > > >  In the current system, the kswapd thread is responsible for both
> > > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > > >  combined responsibility can lead to significant performance bottlenecks,
> > > >  especially under high memory pressure. The kswapd thread becomes a
> > > >  single point of contention, causing delays in memory reclaiming and
> > > >  overall system performance degradation.
> > >
> > > Isn't it general problem if backend for swap is slow(but synchronous)?
> > > I think zram need to support asynchrnous IO(can do introduce multiple
> > > threads to compress batched pages) and doesn't declare it's
> > > synchrnous device for the case.
> >
> > The current conclusion is that kcompressd will sit above zram,
> > because zram is not the only compressing swap backend we have.

Then, how handles the file IO case?

> 
> also. it is not good to hack zram to be aware of if it is kswapd
> , direct reclaim , proactive reclaim and block device with
> mounted filesystem.

Why shouldn't zram be aware of that instead of just introducing
queues in the zram with multiple compression threads?

> 
> so i am thinking sth as below
> 
> page_io.c
> 
> if (sync_device or zswap_enabled())
>    schedule swap_writepage to a separate per-node thread

I am not sure that's a good idea to mix a feature to solve different
layers. That wouldn't be only swap problem. Such an parallelism under
device  is common technique these days and it would help file IO cases.

Furthermore, it would open the chance for zram to try compress
multiple pages at once.


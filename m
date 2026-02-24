Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DF9F3C98F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6HIjG2LJvJkmpdiBYZp+8juPxd1La6DY5tF2b5RHDrc=; b=LTe9WfkK9lZmPv
	4Xdl5tTUZmBwAk6OMKAjpMquR6s9e84euJCGW0La9AvDDMaG3x5uVTXGJFmAQ6NCVw5rF5i4yab2u
	xEU3YEX/g/1nFrt1siQhI/J1mDr0iK3rGCHjrHgLXa5eBrADshoUD2mxK4ZY1bnBPZpUCYdkIxpXz
	U4BzZki7B0teuIO+nFsk4BZ7Q77YDFwGtRf1Nu74HrwZQ5CDnRLogupxYCIFxNNDlKNVsHaKAPoz2
	4nZlrzOTy/A4BZPNtwsso1sMO5uPHj+c5Q0rcM7JefKr03wq3f54ejTkVzPt2wiaLHJ0LjmKjQp0x
	1tQjmREwLwv3J7nc7jKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutp2-00000002HJc-2S5w;
	Tue, 24 Feb 2026 14:55:36 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutoz-00000002HJB-0nlv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:55:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3F4DA68BEB; Tue, 24 Feb 2026 15:55:29 +0100 (CET)
Date: Tue, 24 Feb 2026 15:55:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Eric Biggers <ebiggers@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted
 blk_status_t
Message-ID: <20260224145528.GA13793@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602230947.uNRsPyBn-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_065533_394565_BD4598A8 
X-CRM114-Status: GOOD (  15.67  )
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

It looks like some arm64 configs generate sparse warnings when using
cmpxchg on __bitwise types.  Any chance I could prod the arm64 maintainers
into looking into this?

On Mon, Feb 23, 2026 at 09:23:07AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
> date:   6 weeks ago
> config: arm64-randconfig-r134-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project d8f778935a5bf8a173a3c1d886fd736a4ef6cf05)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602230947.uNRsPyBn-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
> >> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t
> 
> vim +67 fs/crypto/bio.c
> 
>     61	
>     62	static void fscrypt_zeroout_range_end_io(struct bio *bio)
>     63	{
>     64		struct fscrypt_zero_done *done = bio->bi_private;
>     65	
>     66		if (bio->bi_status)
>   > 67			cmpxchg(&done->status, 0, bio->bi_status);
>     68		fscrypt_zeroout_range_done(done);
>     69		bio_put(bio);
>     70	}
>     71	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
---end quoted text---


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F1AE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD4px1JE4Hs8C37Ywe2qi4X3aSr37zS1Mt6jQs2kxto=; b=kdXAPrYsbZFK6JA3wsy6LeJMuI
	mwbTKeM8dHa+B0514UEyeIxG0RoMha2e98mTbfb29Y7YnItwIiZVQiLczHNFzPrhWF9ly8lMV8P5P
	d+f/06IKGV37adhzERXSaM2idKYKz6cfiguGyNK+7M03F5h2Gzvqqqe5r83IV9P/N7Yr7RuqqC3/0
	SQLm+CY2ZFdjlILYf7hK+z6qh3LMrHizDMRVXMQCUzxCC6K6/EkJJ3EWFiCJy1LeYT7qT6f0NmFRE
	4G72Pvt9Y6fEpc5uD5uz/cWZyUiBxNBZ22x058NcumBmuVCqb1mQ+4VIwn9krAjZcCngi/ypxspCT
	6wPY3hdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKDv-00000002XXC-2Lsu;
	Thu, 19 Dec 2024 17:22:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKBJ-00000002Wtu-3JTg;
	Thu, 19 Dec 2024 17:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hD4px1JE4Hs8C37Ywe2qi4X3aSr37zS1Mt6jQs2kxto=; b=jMA8lMwSy3+bHUFP+4fZVh7IPx
	FyB8T3nnJ+VnT7ZEnXN4F5h9lorBeRxAcY4z9Maf9ZBSgXjPacaS/BsCuz4mxMNgmCy3EixkzWxA8
	9nBGzEYRwL6XhZtK8PGvIXWpbtgGjKa8UuZdrgNUr1gstWSzlDEZ4zghJ4X+5rUW+ExR2CzI8b/1g
	YgjbYJKE2JG9e/5b3h6i12Q8gw4+bdp4OGw8Yz1qz6fCcq72C9V4mGlNHIwG/Qn1QQ04br8S23m9g
	PMS2zOscxtTixVnQcYQzt7oYvJcMlPkATcO7LstZ0mhOYVVLul4cf4Ep3YiuOjwMWaSE7gfJig0Rg
	0p7Jj9wg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKBE-00000004Vjs-3SFX;
	Thu, 19 Dec 2024 17:19:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A1A23004DE; Thu, 19 Dec 2024 18:19:21 +0100 (CET)
Date: Thu, 19 Dec 2024 18:19:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Message-ID: <20241219171920.GB26279@noisy.programming.kicks-ass.net>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219164425.2277022-2-kevin.brodsky@arm.com>
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

On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
> Besides the ptlock management at PTE/PMD level, all the
> pagetable_*_[cd]tor have the same implementation. Introduce common
> helpers for all levels to reduce the duplication.

Uff, I forgot to Cc you on the discussion here, sorry!:

  https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com

we now have two series doing more or less overlapping things :/

You can in fact trivially merge the all the implementations -- the
apparent non-common bit (ptlock_free) is a no-op for all those other
levels because they'll be having ptdesc->lock == NULL.


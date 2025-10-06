Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F7CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yzFRuVw5jG9+tZTouWObcHSWPMPv5iQ4dfIMCqJj6no=; b=PwUJ2sjK3s43hJ9tsjVqz1IFGA
	IupAKLZcv7Hun/tFeOcOEpAbGLytCOQc3FwRIOWV7eOif5kyhTkjelnQd6fWPaCSnLaKUb4uf0oIj
	nFf2EETIBtEnHcg+gad4uVq0hOBcQklOlD8zeujkJkOE10QKJ6/If0CyY05+VvKmcGiixux8+33qE
	5xxnz+pf0DmgkMRmSD+PhoVyIFWUemWEQbEEHR0A4tuRFJdO4NIpLRnM44MDgN3FYQdK7t3dCWK9i
	5P6OQU0cPiU1Ss3RdQWHUnmplwavDNZumPEWEpi6czD3Hz7EhP9mv1ubhRKwH1WKKaUIZFmTKZFQo
	szLP+44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5idz-0000000HOPR-0X2k;
	Mon, 06 Oct 2025 10:40:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5idt-0000000HOH4-0ijr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C1AC402FD;
	Mon,  6 Oct 2025 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F50AC4CEF5;
	Mon,  6 Oct 2025 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759747232;
	bh=hRUwo/egmKtYizinN+lZPyk5o+wDa0XBzri8/EfCHC0=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=yAPjTCl0sfEgwVZ3258/XsA75XTw/uTKdLn5Y2Gs00jqdpEuxNxfsOoN0aSZp6y4s
	 SMs3jjwnt9yWAV1ddqcczQWwVYbVwrg8FQyX8vDyXWt2BQE2DB6VwBHMbzeRTWpB1u
	 edk5Q2OhZ2XzlZeKoVwieYNZNYiLcnP+jqh+7AVo=
Subject: Patch "minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()" has been added to the 6.1-stable tree
To: David.Laight@ACULAB.COM,Jason@zx2c4.com,agk@redhat.com,airlied@gmail.com,akpm@linux-foundation.org,alexander.deucher@amd.com,amd-gfx@lists.freedesktop.org,andriy.shevchenko@linux.intel.com,arnd@kernel.org,asad.kamal@amd.com,axboe@kernel.dk,christian.koenig@amd.com,clm@fb.com,dan.carpenter@linaro.org,david.laight@aculab.com,dm-devel@lists.linux.dev,dmitry.torokhov@gmail.com,dri-devel@lists.freedesktop.org,dsterba@suse.com,farbere@amazon.com,gregkh@linuxfoundation.org,hch@infradead.org,jernej.skrabec@gmail.com,kenneth.feng@amd.com,kevinyang.wang@amd.com,lijo.lazar@amd.com,linus.walleij@linaro.org,linux-arm-kernel@lists.infradead.org,linux-sunxi@lists.linux.dev,linux@rasmusvillemoes.dk,lorenzo.stoakes@oracle.com,luc.vanoostenryck@gmail.com,mjguzik@gmail.com,mpatocka@redhat.com,pedro.falcato@gmail.com,pmladek@suse.com,rostedt@goodmis.org,samuel@sholland.org,senozhatsky@chromium.org,simona@ffwll.ch,snitzer@kernel.org,tglx@linutronix.de,wens@csie.org,willy@infradead.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 06 Oct 2025 12:39:12 +0200
In-Reply-To: <20251003121520.8176-9-farbere@amazon.com>
Message-ID: <2025100612-party-nineteen-6995@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_034033_452505_FE62B08D 
X-CRM114-Status: GOOD (  14.73  )
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


This is a note to let you know that I've just added the patch titled

    minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-183179-greg=kroah.com@vger.kernel.org Fri Oct  3 14:27:07 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 3 Oct 2025 12:15:17 +0000
Subject: minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <akpm@linux-foundation.org>, <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>, <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <stable@vger.
 kernel.org>, <farbere@amazon.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>, Dan Carpenter <dan.carpenter@linaro.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jens Axboe <axboe@kernel.dk>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, "Matthew Wilcox" <willy@infradead.org>, Pedro Falcato <pedro.falcato@gmail.com>
Message-ID: <20251003121520.8176-9-farbere@amazon.com>

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit a5743f32baec4728711bbc01d6ac2b33d4c67040 ]

Use BUILD_BUG_ON_MSG(statically_true(ulo > uhi), ...) for the sanity check
of the bounds in clamp().  Gives better error coverage and one less
expansion of the arguments.

Link: https://lkml.kernel.org/r/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/minmax.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -106,8 +106,7 @@
 	__auto_type uval = (val);						\
 	__auto_type ulo = (lo);							\
 	__auto_type uhi = (hi);							\
-	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
-			(lo) <= (hi), true),					\
+	BUILD_BUG_ON_MSG(statically_true(ulo > uhi),				\
 		"clamp() low limit " #lo " greater than high limit " #hi);	\
 	BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),				\
 		"clamp("#val", "#lo", "#hi") signedness error");		\


Patches currently in stable-queue which might be from farbere@amazon.com are

queue-6.1/minmax-improve-macro-expansion-and-type-checking.patch
queue-6.1/minmax.h-simplify-the-variants-of-clamp.patch
queue-6.1/minmax.h-move-all-the-clamp-definitions-after-the-min-max-ones.patch
queue-6.1/minmax-don-t-use-max-in-situations-that-want-a-c-constant-expression.patch
queue-6.1/minmax.h-remove-some-defines-that-are-only-expanded-once.patch
queue-6.1/minmax.h-use-build_bug_on_msg-for-the-lo-hi-test-in-clamp.patch
queue-6.1/minmax-simplify-min-max-clamp-implementation.patch
queue-6.1/minmax.h-add-whitespace-around-operators-and-after-commas.patch
queue-6.1/minmax-fix-up-min3-and-max3-too.patch
queue-6.1/minmax.h-reduce-the-define-expansion-of-min-max-and-clamp.patch
queue-6.1/minmax.h-update-some-comments.patch


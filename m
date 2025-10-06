Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AECCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=r9rTm5qASXa//QifUdzfODpRtWys30dUWuj9+fuIWAc=; b=0nc3zR5N301kcci1rH11dKIf1B
	6rFXzEzeRLq6S2gZz9j/fIPetcYSWlvgNgbxDowzyBJT5rW3rgrBfzsmIay3h7Iy9YDBjUdsBq/yM
	t3dzHT6vhU1JfVkCJly1d09V32yH10H7mQOFumstCsuPVUZddspq7kXOj3vI1ZOWfYT9Lzfvcg3Jq
	Yv3a6JvbYVhmUCrCTqUdmODJMkhCNMAA4B3jtoFKXABlkk7vKsF18YwjKChEK4yG+Pjlqrg22qv8d
	Gi1LvJ05AXGemJCqK4RrCHrvLmMG9nuXt0yS0A21KTZrq9tI77Nr5cNzuF1M2e1trZtYRCrDBoR4W
	WdEDL0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5idW-0000000HNu3-2H1N;
	Mon, 06 Oct 2025 10:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5idT-0000000HNt7-1zZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17AD944FED;
	Mon,  6 Oct 2025 10:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67220C4CEF5;
	Mon,  6 Oct 2025 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759747205;
	bh=Oy0x0l9dvNGSK/4iWDLpJJ1Oq4vRllDkRttPvYtvK6s=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=BgEg1mQyT0hghjEHgtGYQxEA2fduEpMljyfzV3idljRdylDHKJtAkLh+wuyonvVHi
	 GcYJNsfT/aLgxoeYajfgNfWwB8VzjV8t3kQFVQ1fCQ+7ZZ0S1xSdxfumUi/AoAvY7C
	 LL7WsXKp29k3/Mzn5uB16ooRAWKObnyTTCVpm9mw=
Subject: Patch "minmax: fix up min3() and max3() too" has been added to the 6.1-stable tree
To: David.Laight@ACULAB.COM,David.Laight@aculab.com,agk@redhat.com,airlied@gmail.com,akpm@linux-foundation.org,alexander.deucher@amd.com,amd-gfx@lists.freedesktop.org,andriy.shevchenko@linux.intel.com,arnd@kernel.org,asad.kamal@amd.com,christian.koenig@amd.com,clm@fb.com,dm-devel@lists.linux.dev,dmitry.torokhov@gmail.com,dri-devel@lists.freedesktop.org,dsterba@suse.com,farbere@amazon.com,gregkh@linuxfoundation.org,jernej.skrabec@gmail.com,kenneth.feng@amd.com,kevinyang.wang@amd.com,lijo.lazar@amd.com,linus.walleij@linaro.org,linux-arm-kernel@lists.infradead.org,linux-sunxi@lists.linux.dev,linux@rasmusvillemoes.dk,luc.vanoostenryck@gmail.com,mpatocka@redhat.com,pmladek@suse.com,rostedt@goodmis.org,samuel@sholland.org,senozhatsky@chromium.org,simona@ffwll.ch,snitzer@kernel.org,tglx@linutronix.de,torvalds@linux-foundation.org,wens@csie.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 06 Oct 2025 12:39:09 +0200
In-Reply-To: <20251003121520.8176-5-farbere@amazon.com>
Message-ID: <2025100609-exposable-subside-4c76@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_034007_708967_9297410B 
X-CRM114-Status: GOOD (  14.80  )
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

    minmax: fix up min3() and max3() too

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     minmax-fix-up-min3-and-max3-too.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-183175-greg=kroah.com@vger.kernel.org Fri Oct  3 14:17:52 2025
From: Eliav Farber <farbere@amazon.com>
Date: Fri, 3 Oct 2025 12:15:13 +0000
Subject: minmax: fix up min3() and max3() too
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <akpm@linux-foundation.org>, <lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>, <David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <stable@vger.
 kernel.org>, <farbere@amazon.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>
Message-ID: <20251003121520.8176-5-farbere@amazon.com>

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 21b136cc63d2a9ddd60d4699552b69c214b32964 ]

David Laight pointed out that we should deal with the min3() and max3()
mess too, which still does excessive expansion.

And our current macros are actually rather broken.

In particular, the macros did this:

  #define min3(x, y, z) min((typeof(x))min(x, y), z)
  #define max3(x, y, z) max((typeof(x))max(x, y), z)

and that not only is a nested expansion of possibly very complex
arguments with all that involves, the typing with that "typeof()" cast
is completely wrong.

For example, imagine what happens in max3() if 'x' happens to be a
'unsigned char', but 'y' and 'z' are 'unsigned long'.  The types are
compatible, and there's no warning - but the result is just random
garbage.

No, I don't think we've ever hit that issue in practice, but since we
now have sane infrastructure for doing this right, let's just use it.
It fixes any excessive expansion, and also avoids these kinds of broken
type issues.

Requested-by: David Laight <David.Laight@aculab.com>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/minmax.h |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -152,13 +152,20 @@
 #define umax(x, y)	\
 	__careful_cmp(max, (x) + 0u + 0ul + 0ull, (y) + 0u + 0ul + 0ull)
 
+#define __careful_op3(op, x, y, z, ux, uy, uz) ({			\
+	__auto_type ux = (x); __auto_type uy = (y);__auto_type uz = (z);\
+	BUILD_BUG_ON_MSG(!__types_ok3(x,y,z,ux,uy,uz),			\
+		#op"3("#x", "#y", "#z") signedness error");		\
+	__cmp(op, ux, __cmp(op, uy, uz)); })
+
 /**
  * min3 - return minimum of three values
  * @x: first value
  * @y: second value
  * @z: third value
  */
-#define min3(x, y, z) min((typeof(x))min(x, y), z)
+#define min3(x, y, z) \
+	__careful_op3(min, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * max3 - return maximum of three values
@@ -166,7 +173,8 @@
  * @y: second value
  * @z: third value
  */
-#define max3(x, y, z) max((typeof(x))max(x, y), z)
+#define max3(x, y, z) \
+	__careful_op3(max, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * min_not_zero - return the minimum that is _not_ zero, unless both are zero


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


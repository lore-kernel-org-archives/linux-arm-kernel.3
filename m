Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9F0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2eBQZSEUfZlDQZiXN53iOt6nRC/DBseX5vOoty0BeQ=; b=RWnfCNFGT/LWNiNA6O7Wl9Nq6E
	2wiafFt6PYIObzks9ZZVl641or7SBds2OL3NXsb8FzRQjqgpsjyanamnBwhnHzp82vMoB3SobTjFn
	4tp/Hb+xxvxojDBCESa2w9HZWLLOfQKj0MULDoCyJqJf5y1Zgy8eIwTN6tKd7ldNdOuz7nazghCfa
	2BVLJjIb8YbS9blnppN1xfINH8oRkY8VK/ak0qHnnHWAWQPCG2BzMhCTkcusdF5jdNPXIpf8wCgRG
	1HXE1v+i6u30W+RU1agj0A119CBPpNZKCfzuKQLZi4wZ4ilVk9i8alaTpFabJE+DV+n5f7uGHvJ7x
	mkzcdEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triyD-00000003kST-1mjS;
	Mon, 10 Mar 2025 19:39:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triwY-00000003kHm-24JE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:37:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8194A152B;
	Mon, 10 Mar 2025 12:37:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96A83F694;
	Mon, 10 Mar 2025 12:37:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 19:37:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kees Cook <kees@kernel.org>, Peter Collingbourne <pcc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] string: Disable read_word_at_a_time() optimizations if
 kernel MTE is enabled
Message-ID: <Z88_fFgr23_EtHMf@J2N7QTR9R3>
References: <20250308023314.3981455-1-pcc@google.com>
 <202503071927.1A795821A@keescook>
 <Z88jbhobIz2yWBbJ@arm.com>
 <Z88r5qFLOSo0itaq@J2N7QTR9R3.cambridge.arm.com>
 <Z88yC7Oaj9DGaswc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88yC7Oaj9DGaswc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_123742_623262_F177E548 
X-CRM114-Status: GOOD (  31.76  )
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

On Mon, Mar 10, 2025 at 06:40:11PM +0000, Catalin Marinas wrote:
> On Mon, Mar 10, 2025 at 06:13:58PM +0000, Mark Rutland wrote:
> > On Mon, Mar 10, 2025 at 05:37:50PM +0000, Catalin Marinas wrote:
> > > On Fri, Mar 07, 2025 at 07:36:31PM -0800, Kees Cook wrote:
> > > > On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> > > > > The optimized strscpy() and dentry_string_cmp() routines will read 8
> > > > > unaligned bytes at a time via the function read_word_at_a_time(), but
> > > > > this is incompatible with MTE which will fault on a partially invalid
> > > > > read. The attributes on read_word_at_a_time() that disable KASAN are
> > > > > invisible to the CPU so they have no effect on MTE. Let's fix the
> > > > > bug for now by disabling the optimizations if the kernel is built
> > > > > with HW tag-based KASAN and consider improvements for followup changes.
> > > > 
> > > > Why is faulting on a partially invalid read a problem? It's still
> > > > invalid, so ... it should fault, yes? What am I missing?
> > > 
> > > read_word_at_a_time() is used to read 8 bytes, potentially unaligned and
> > > beyond the end of string. The has_zero() function is then used to check
> > > where the string ends. For this uses, I think we can go with
> > > load_unaligned_zeropad() which handles a potential fault and pads the
> > > rest with zeroes.
> > 
> > If we only care about synchronous and asymmetric modes, that should be
> > possible, but that won't work in asynchronous mode. In asynchronous mode
> > the fault will accumulate into TFSR and will be detected later
> > asynchronously where it cannot be related to its source and fixed up.
> > 
> > That means that both read_word_at_a_time() and load_unaligned_zeropad()
> > are dodgy in async mode.
> 
> load_unaligned_zeropad() has a __mte_enable_tco_async() call to set
> PSTATE.TCO if in async mode, so that's covered. read_word_at_a_time() is
> indeed busted and I've had Vincezo's patches for a couple of years
> already, they just never made it to the list.

Sorry, I missed the __mte_{enable,disable}_tco_async() calls. So long as
we're happy to omit the check in that case, that's fine.

I was worried that ex_handler_load_unaligned_zeropad() might not do the
right thing in response to a tag check fault (e.g. access the wrong 8
bytes), but it looks as though that's ok due to the way it generates the
offset and the aligned pointer.

If load_unaligned_zeropad() is handed a string that starts with an
unexpected tag (and even if that starts off aligned),
ex_handler_load_unaligned_zeropad() will access that and cause another
tag check fault, which will be reported.

Mark.


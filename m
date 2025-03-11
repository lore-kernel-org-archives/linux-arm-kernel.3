Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA64C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCzU88gZbdraoeQ76IhkfFWGC2iSrwRLE1E9hkFtdVk=; b=IHBQbmXk4cVzpG/kFxaC+rEacu
	HtJ04ZpNosvadYE4Rcs6zduyQwhLx4mMPzSEQYBg5g+SqDexVfRCU1W7VS5CLQfdtDwmLeYGrbimt
	7GjXUqv1KEb8BwcZWoibF40Jb8Q9QOevGRljUoxbKIEYRXB5jf5dmSgPrcKMNFI2Nrnr5hgQmUa32
	JPUoM5ZAaVQufcBUPG9PdlHev2EU0JfrsCR6POtNkA399JGo3JMqxtEIkjWwlAwKZWXViG0w6icT/
	LNHe4XLOvtS5f22fZn7955Ox1qo85Old4SN62rP+5Xyk4yww1KTvaLNHdtLr7l1jzS1u2L2aT+AIo
	I/mLGqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryEy-00000005XmZ-1u6I;
	Tue, 11 Mar 2025 11:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryDK-00000005XZY-0uPC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:56:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2722A152B;
	Tue, 11 Mar 2025 04:56:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00443F673;
	Tue, 11 Mar 2025 04:55:53 -0700 (PDT)
Date: Tue, 11 Mar 2025 11:55:43 +0000
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
Message-ID: <Z9Akv6qQFfmYFReD@J2N7QTR9R3>
References: <20250308023314.3981455-1-pcc@google.com>
 <202503071927.1A795821A@keescook>
 <Z88jbhobIz2yWBbJ@arm.com>
 <Z88r5qFLOSo0itaq@J2N7QTR9R3.cambridge.arm.com>
 <Z88yC7Oaj9DGaswc@arm.com>
 <Z88_fFgr23_EtHMf@J2N7QTR9R3>
 <Z9AiUQdC4o0g8sxu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9AiUQdC4o0g8sxu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_045602_296965_2A6FAEBE 
X-CRM114-Status: GOOD (  23.11  )
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

On Tue, Mar 11, 2025 at 11:45:21AM +0000, Catalin Marinas wrote:
> On Mon, Mar 10, 2025 at 07:37:32PM +0000, Mark Rutland wrote:
> > I was worried that ex_handler_load_unaligned_zeropad() might not do the
> > right thing in response to a tag check fault (e.g. access the wrong 8
> > bytes), but it looks as though that's ok due to the way it generates the
> > offset and the aligned pointer.
> > 
> > If load_unaligned_zeropad() is handed a string that starts with an
> > unexpected tag (and even if that starts off aligned),
> > ex_handler_load_unaligned_zeropad() will access that and cause another
> > tag check fault, which will be reported.
> 
> Yes, it will report an async tag check fault on the
> exit_to_kernel_mode() path _if_ load_unaligned_zeropad() triggered the
> fault for other reasons (end of page).

Sorry, yes. The aligned case I mentioned shouldn't apply here.

> It's slightly inconsistent, we could set TCO for the async case in
> ex_handler_load_unaligned_zeropad() as well.

Yep, I think that'd be necessary for async mode.

> For sync checks, we'd get the first fault ending up in
> ex_handler_load_unaligned_zeropad() and a second tag check fault while
> processing the first. This ends up in do_tag_recovery and we disable
> tag checking after the report. Not ideal but not that bad.

Yep; that's what I was describing in the second paragraph above, though
I forgot to say that was assuming sync or asymm mode.

> We could adjust ex_handler_load_unaligned_zeropad() to return false if
> the pointer is already aligned but we need to check the semantics of
> load_unaligned_zeropad(), is it allowed to fault on the first byte?

IIUC today it's only expected to fault due to misalignment, and the
gneral expectation is that for a sequence of load_unaligned_zeropad()
calls, we should get at least one byte without faulting (for the NUL
terminator).

I reckon it'd be better to figure this out based on the ESR if possible.
Kristina's patches for MOPS would give us that.

Mark.


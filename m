Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yp0l85bXQW+hiHn+woGwFfqUS8VQ1BYFIR0j8PTGrc=; b=M89QfbBCbSx6qwQepfqtlQeF9i
	YbBm0H7qRUFTksm33XTUsdiclqj7KmR+S0dqKAiaGEzq28jQBvCJwbwsNyIsHSyqpa8faSA2DGKq0
	y1KbkVgTbWg/yvmtFhEZgSSz1SVRkYatRpw3dYR8v+cX4jVXMce2v09p4nWO552VuvDUwSwgdtf//
	eupxUVX3X6x6U5zRqqoKsaWHFS3IQPm9BFHyN149kndtkeShr+JWHPWGKJh8x//LaGuP7OCElKOEM
	jfVV1NiXicoMH3GWuNNZzI1Ky2OEmrj5jr3YunQnXi/DOritTk0RxmPqVF75t/1tAvXwNmd3T3veu
	8crOBSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tri4d-00000003eh3-29Wd;
	Mon, 10 Mar 2025 18:41:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tri2z-00000003eD7-04ZB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 931835C5A56;
	Mon, 10 Mar 2025 18:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3FFC4CEEC;
	Mon, 10 Mar 2025 18:40:13 +0000 (UTC)
Date: Mon, 10 Mar 2025 18:40:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <Z88yC7Oaj9DGaswc@arm.com>
References: <20250308023314.3981455-1-pcc@google.com>
 <202503071927.1A795821A@keescook>
 <Z88jbhobIz2yWBbJ@arm.com>
 <Z88r5qFLOSo0itaq@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88r5qFLOSo0itaq@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_114017_095083_94764515 
X-CRM114-Status: GOOD (  28.89  )
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

On Mon, Mar 10, 2025 at 06:13:58PM +0000, Mark Rutland wrote:
> On Mon, Mar 10, 2025 at 05:37:50PM +0000, Catalin Marinas wrote:
> > On Fri, Mar 07, 2025 at 07:36:31PM -0800, Kees Cook wrote:
> > > On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> > > > The optimized strscpy() and dentry_string_cmp() routines will read 8
> > > > unaligned bytes at a time via the function read_word_at_a_time(), but
> > > > this is incompatible with MTE which will fault on a partially invalid
> > > > read. The attributes on read_word_at_a_time() that disable KASAN are
> > > > invisible to the CPU so they have no effect on MTE. Let's fix the
> > > > bug for now by disabling the optimizations if the kernel is built
> > > > with HW tag-based KASAN and consider improvements for followup changes.
> > > 
> > > Why is faulting on a partially invalid read a problem? It's still
> > > invalid, so ... it should fault, yes? What am I missing?
> > 
> > read_word_at_a_time() is used to read 8 bytes, potentially unaligned and
> > beyond the end of string. The has_zero() function is then used to check
> > where the string ends. For this uses, I think we can go with
> > load_unaligned_zeropad() which handles a potential fault and pads the
> > rest with zeroes.
> 
> If we only care about synchronous and asymmetric modes, that should be
> possible, but that won't work in asynchronous mode. In asynchronous mode
> the fault will accumulate into TFSR and will be detected later
> asynchronously where it cannot be related to its source and fixed up.
> 
> That means that both read_word_at_a_time() and load_unaligned_zeropad()
> are dodgy in async mode.

load_unaligned_zeropad() has a __mte_enable_tco_async() call to set
PSTATE.TCO if in async mode, so that's covered. read_word_at_a_time() is
indeed busted and I've had Vincezo's patches for a couple of years
already, they just never made it to the list.

> Can we somehow hang this off ARCH_HAS_SUBPAGE_FAULTS?

We could, though that was mostly for user-space faults while in-kernel
we'd only need something similar if KASAN_HW_TAGS.

> ... and is there anything else that deliberately makes accesses that
> could straddle objects?

So far we only came across load_unaligned_zeropad() and
read_word_at_a_time(). I'm not aware of anything else.

-- 
Catalin


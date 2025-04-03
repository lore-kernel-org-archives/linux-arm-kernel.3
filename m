Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3ADC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z6Ozw6a1oopXE3rYf9mhE4KWwQr0zlpACDALsbmoq0=; b=OnlkYrnWRSH8tr0ONPw92Iouch
	Aas3UAmd8IEeQZBh+PIvhbnVS/pmL/QDOReydmHNwrkEGy/VkvbFw8FfObMd/p5QX0j7Fqml1BQHG
	lVurwnT8ZOnV9KRUrJBTZkhG1UMoMGlKT1UoNcYzDgocbJcKdbpUQvV019MrcFzTtznoBLGeEFH4t
	iunid8pp9t1OYrLWlyNV4SbiapPWeoDMr8ii0qVCe7pff5F3MbalEXL16orK8YyFIUgBF7MEot9nb
	H5M/T9gXLnNRiyajvyqfwumsWw4Pnoi/V7K3YfZ9+yjNC9YX6dYSrZ0uRY3J7sXEOJZkeD4Qds+Mm
	LIo0YlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hea-00000008XqR-49Ax;
	Thu, 03 Apr 2025 10:18:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HB3-00000008S0u-2b5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10C4668424;
	Thu,  3 Apr 2025 09:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A589C4CEE3;
	Thu,  3 Apr 2025 09:47:58 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:47:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 2/2] kasan: Add strscpy() test to trigger tag fault on
 arm64
Message-ID: <Z-5ZTNbc-sl51Rrt@arm.com>
References: <20250403000703.2584581-1-pcc@google.com>
 <20250403000703.2584581-3-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403000703.2584581-3-pcc@google.com>
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

On Wed, Apr 02, 2025 at 05:07:00PM -0700, Peter Collingbourne wrote:
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
> 
> When we invoke strscpy() with a maximum size of N bytes, it assumes
> that:
> - It can always read N bytes from the source.
> - It always write N bytes (zero-padded) to the destination.
> 
> On aarch64 with Memory Tagging Extension enabled if we pass an N that is
> bigger then the source buffer, it would previously trigger an MTE fault.
> 
> Implement a KASAN KUnit test that triggers the issue with the previous
> implementation of read_word_at_a_time() on aarch64 with MTE enabled.
> 
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Link: https://linux-review.googlesource.com/id/If88e396b9e7c058c1a4b5a252274120e77b1898a

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


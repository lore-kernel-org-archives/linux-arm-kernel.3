Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC122C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZubVSZQExbptxrd/hjltfN5YMq6waVeTFZU5Yipam4=; b=GvgL2ZegZJ54rZusdxzsuv+B53
	20P5A9eSh04ZIpDv4fQE36J7TTu8k9mb5ezOGze7+4UGKzCiJa8ARIO1GlvCcXnAYom9kaTWsyo/+
	dBs/l9P1nhZBLUe0HYLxLlWaqanjEKofahd/2K3xO1iWLLU8dXlOcfLlW+QOl4EUNGbX2Ogz/kQYm
	W3J89dHHksyGnWwKPu8XgUXq8DpCodd0NpntY0v2KPW5EO0HI6Ru4t7p59thfqfH1Yy0AxWeVKF/J
	6q8WaJ35vaCu+KMohKjjatfX4WqznJcwT8lQE0Lw88Y68u1gzSI0ndw1E8WTQNjUiPtgRJGVlU+k5
	dmyhN4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hcs-00000008Xdk-12L3;
	Thu, 03 Apr 2025 10:16:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HAc-00000008Rvg-0j0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F04F68429;
	Thu,  3 Apr 2025 09:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFF5C4CEE3;
	Thu,  3 Apr 2025 09:47:30 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:47:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 1/2] string: Add load_unaligned_zeropad() code path to
 sized_strscpy()
Message-ID: <Z-5ZMOqhca_Z6FV7@arm.com>
References: <20250403000703.2584581-1-pcc@google.com>
 <20250403000703.2584581-2-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403000703.2584581-2-pcc@google.com>
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

On Wed, Apr 02, 2025 at 05:06:59PM -0700, Peter Collingbourne wrote:
> The call to read_word_at_a_time() in sized_strscpy() is problematic
> with MTE because it may trigger a tag check fault when reading
> across a tag granule (16 bytes) boundary. To make this code
> MTE compatible, let's start using load_unaligned_zeropad()
> on architectures where it is available (i.e. architectures that
> define CONFIG_DCACHE_WORD_ACCESS). Because load_unaligned_zeropad()
> takes care of page boundaries as well as tag granule boundaries,
> also disable the code preventing crossing page boundaries when using
> load_unaligned_zeropad().
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> Cc: stable@vger.kernel.org

Up to you if you want to keep the panic behaviour on unmapped pages.
Either way:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D5CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RkKsfBvAvrj9eLwmZX9evSj0Ctu7w2pjv9sWxqPMck=; b=lPd//dGq6N3/HokNqGHPEjl5ce
	+//GbnXufMuK7kDBzpLq4Ll3kK0SABFUDyBJN2XJF/F8LgdK4drNKvrhFYUPvzk8ffhf6GM2pQ1ZZ
	saWJodWYz/rLgQnMrvS5d2EWaaTFZM+RmdBm4NUeSuWo0Rvc/3oyNSl/+Wi7208LGvuU3M0PBIQ/G
	pRiinVhj3H4/kfD/l2FsLPLIrVXw7nni0FUZ6a6fnsX7x5LSmE3anrP2LW6j/jg2c29q2PvTkmhAK
	eVpxicYbP05nEwK5xVXKPmbO/cQMvEjwjv2SYgwbANX8ZInyTzcHuIOjRMuxRqaG5fXNqmZAds3aQ
	pft3EXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGkd-00000008MAL-34hB;
	Wed, 12 Feb 2025 17:42:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGTw-00000008JJK-2pTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64B2A5C0556;
	Wed, 12 Feb 2025 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36236C4CEE2;
	Wed, 12 Feb 2025 17:25:01 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:24:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yury Khrustalev <yury.khrustalev@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-ID: <Z6zZanGRGd15770_@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092504_754597_3CE139EA 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, Jan 13, 2025 at 05:06:16PM +0000, Yury Khrustalev wrote:
> Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> 
> For context, this change will also allow for more consistent update of the
> Glibc manual which in turn will help with introducing memory protection
> keys on AArch64 targets.
[...]
> Yury Khrustalev (3):
>   mm/pkey: Add PKEY_UNRESTRICTED macro
>   selftests/mm: Use PKEY_UNRESTRICTED macro
>   selftests/powerpc: Use PKEY_UNRESTRICTED macro
> 
>  include/uapi/asm-generic/mman-common.h               | 1 +
>  tools/testing/selftests/mm/mseal_test.c              | 6 +++---
>  tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
>  tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
>  tools/testing/selftests/mm/protection_keys.c         | 2 +-
>  tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
>  tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
>  tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
>  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
>  10 files changed, 18 insertions(+), 16 deletions(-)

Andrew, Arnd - are you ok if I take these patches through the arm64
tree?

Thanks.

-- 
Catalin


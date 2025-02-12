Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47E6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+9dSbgU9McR8AFKLVmlCnxR0A7iHdMke/X+gv/pY4k=; b=f1tC08TvX0iOyYGHHn4XXAgXpc
	og5Tmbqpjj2c67IU4cMsqanWHRv4AluUb57mz6c8D6+8WZhT6+JU0n/cAwz+HrznJqXTwUAlHYEdx
	MxUmODZZkKMecZsxtv6rAewlP+Wrs0GqaaS8vyVBs3CIyQDBbVJCgd5gWL2aPQzNV84wFzIwoidGc
	RJTEAD/L2XV4YY1AvH+JCJOjE5wQKUIy5199S7YPA/Z3ZkOYl9rsKhRw8saM7pvbYSYEeD1RE7MHr
	v3010weIQUCNdfk7fupD2cvRQmhg7IQYs278XMrmgdKtvYi46asyeVOf41dkas7/AOgDuO8xWQiHn
	I5k9B+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKJb-00000008uCh-1mLG;
	Wed, 12 Feb 2025 21:30:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKI8-00000008txw-3mGX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 624265C623C;
	Wed, 12 Feb 2025 21:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A0BC4CEDF;
	Wed, 12 Feb 2025 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1739395747;
	bh=FNuraFRyLvUDzNAGJQHElNh8dikm+1tZHhcNvHqnA6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g25Zma8jRSe+HcXS14/PzbDN2QKhvyGISAuzT2nTIcyi0tzAmRIiqNVvrNFgRTdFY
	 7uSES7p8xqHyJhu1dnWAgQ66RboNYCKaRWkv7q9b9WRZV8cvb4OZZ1PAnjokgIQ+jB
	 A9e3YOA0hMF/EY4DR8hYmGquvFcPFjAowGvJdhHY=
Date: Wed, 12 Feb 2025 13:29:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, linux-arch@vger.kernel.org, Kevin Brodsky
 <kevin.brodsky@arm.com>, Joey Gouly <joey.gouly@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Sandipan Das <sandipan@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-Id: <20250212132906.fdf85ea62b3672cfc1115c09@linux-foundation.org>
In-Reply-To: <Z6zZanGRGd15770_@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
	<Z6zZanGRGd15770_@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_132908_996890_B6EC8A41 
X-CRM114-Status: GOOD (  15.92  )
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

On Wed, 12 Feb 2025 17:24:58 +0000 Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Mon, Jan 13, 2025 at 05:06:16PM +0000, Yury Khrustalev wrote:
> > Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> > 
> > For context, this change will also allow for more consistent update of the
> > Glibc manual which in turn will help with introducing memory protection
> > keys on AArch64 targets.
> [...]
> > Yury Khrustalev (3):
> >   mm/pkey: Add PKEY_UNRESTRICTED macro
> >   selftests/mm: Use PKEY_UNRESTRICTED macro
> >   selftests/powerpc: Use PKEY_UNRESTRICTED macro
> > 
> >  include/uapi/asm-generic/mman-common.h               | 1 +
> >  tools/testing/selftests/mm/mseal_test.c              | 6 +++---
> >  tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
> >  tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
> >  tools/testing/selftests/mm/protection_keys.c         | 2 +-
> >  tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
> >  tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
> >  tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
> >  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
> >  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
> >  10 files changed, 18 insertions(+), 16 deletions(-)
> 
> Andrew, Arnd - are you ok if I take these patches through the arm64
> tree?

Sure.


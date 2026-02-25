Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9833FD3762
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5wd1fZsmh9UNN8+BLmZOG2AsYoZQcf+cyz1/pxL0Ec=; b=hKocQKmTEg6esWBXYpMSWJZHC+
	Ur5AdRKiGrwY6R7nbCcyQCZqbB5+HNzKv/cgXQ+cq45Mg9KItRbmZRF55jRoNUpWo8GSx4wt7cV1N
	Nmgw3msMV8t1O9USdnwQ8VzcbJAaAXqluN+X/3+ouTXy6mdpQdTqHcoJbAjXums//aSxUU3RwM6os
	qEyMPhUyDh7T0b+r8SFLpkXZEP/FUEk3X/eJ39B+Hp1SFfB6VJUL0ihl/Zwe2y8NuIJGgsHQC7PcB
	3Yq1seeTAPK2iINajDP6k576+gilgrM3xDsWTh8mc7xU5pgVZ/8LHanRvBZac7y5aj+6dKUzwoOFI
	n84soN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHAg-00000004Q7Y-2ydg;
	Wed, 25 Feb 2026 15:51:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHAd-00000004Q6U-05cl;
	Wed, 25 Feb 2026 15:51:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6415B165C;
	Wed, 25 Feb 2026 07:51:19 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9613F62B;
	Wed, 25 Feb 2026 07:51:22 -0800 (PST)
Date: Wed, 25 Feb 2026 15:51:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: Do not map the shadow stack as THP
Message-ID: <aZ8aeHpn_KElP2jm@arm.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-6-catalin.marinas@arm.com>
 <5570c06d-fbc1-42c9-9b27-26211e8b033c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5570c06d-fbc1-42c9-9b27-26211e8b033c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_075127_100213_A0D01B99 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, Feb 25, 2026 at 01:02:36PM +0000, Mark Brown wrote:
> On Tue, Feb 24, 2026 at 05:57:57PM +0000, Catalin Marinas wrote:
> > The default shadow stack size allocated on first prctl() for the main
> > thread or subsequently on clone() is either half of RLIMIT_STACK or half
> > of a thread's stack size (for arm64). Both of these are likely to be
> > suitable for a THP allocation and the kernel is more aggressive in
> > creating such mappings. However, it does not make much sense to use a
> > huge page. It didn't make sense for the normal stacks either, see commit
> > c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE").
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks.

> The create THP and immediately splitting it pattern is very clear when
> checking the mm behaviour on new GCSs, this should help performance.

If the first access is a write, the kernel allocates a THP from the
start without subsequent splitting. Also since 6.13 (commit 1ced09e0331f
"mm: allocate THP on hugezeropage wp-fault"), we go for another THP on
write. It's still wasting memory and time to zero the full 2MB when
it's highly unlikely we'd ever use that much for a shadow stack.

-- 
Catalin


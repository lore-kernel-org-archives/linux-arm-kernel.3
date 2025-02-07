Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32EEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 04:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eVP2G6SlyKBrZMvJThe1P6q6E3wV599K7FNUTSvEDg=; b=MyR7sj8azbqRoXwsl5JNxGiCme
	8QzuQcRPugO6Xdi/zNymHUnWA/MvkFCooRkkzZrc7uoxMdB4DBixAFlIHMKqqVdJEk31Jcocw1hcJ
	dWxZpbMC7qkY6dDG8WqzlYyem+T139POzIq4JfT6foeyhCXgQzIXcQOiEErJAfe0esrwTRg0Gjebd
	Oj5wZCwF24wupfT6GtHsiORuPWbx/H5PrGpU3GtVkikhOuTw1xZ7nESbAmCarzBXvvcEL1OP8wYNQ
	PcLKNHyyz55ICQD2nbiPrL20rhHPNFpPzhbVncbtCSQNYrsWmCmIuTq4Zdt7jlFFqPEyvpRQ40rOL
	63WO/ccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGNM-00000008KIP-14h0;
	Fri, 07 Feb 2025 04:54:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGLx-00000008K9C-3J6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 04:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C94D5C5663;
	Fri,  7 Feb 2025 04:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AC9C4CED1;
	Fri,  7 Feb 2025 04:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738903952;
	bh=DHjArMeAK3MeqFPs8ewPHAdYTmkFt/+F2+q7rMjVEsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4hOTD940F1xlXDm0mc5K3mDWMF8PSxayTzbGZ7yFgncZQhreabSjsW/SPkrxvWyj
	 nSL6ezpoAY094IRO9xVo7ABLzhV1eguxz++lt/TzXCZ8K45nVXR4iXLQO5O5OvWp0K
	 ATK9xHVbtmFdnug59ERW+h66BXmzxYNeXv29CdAsmMdv00eYEe0sd6vVofADQf05te
	 lT0NWx4WrW5hPsI8JfAq6/8JcdwZWb3xVM2NWlDEGMKosdaJAlWafYQrvED6iGX8qh
	 kmzhADTz8zfNueFUjkLH68uqsQf0kpB9zw+24EnTrALzamINKTukN0O7a9JCGIPQDt
	 St5IHezNhourg==
Date: Thu, 6 Feb 2025 20:52:32 -0800
From: Kees Cook <kees@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 8/8] mm: Add basic tests for kpkeys_hardened_cred
Message-ID: <202502062024.BCB0DED1D5@keescook>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
 <20250203102809.1223255-9-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203102809.1223255-9-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_205233_916134_4080BA22 
X-CRM114-Status: GOOD (  24.87  )
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

On Mon, Feb 03, 2025 at 10:28:09AM +0000, Kevin Brodsky wrote:
> Add basic tests for the kpkeys_hardened_pgtables feature: try to
> perform a direct write to current->{cred,real_cred} and ensure it
> fails.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  mm/Makefile                    |  1 +
>  mm/kpkeys_hardened_cred_test.c | 42 ++++++++++++++++++++++++++++++++++

Current file naming convention[1] would be to name this as:

	mm/tests/kpkeys_hardened_cred_kunit.c

>  security/Kconfig.hardening     | 11 +++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 mm/kpkeys_hardened_cred_test.c
> 
> diff --git a/mm/Makefile b/mm/Makefile
> index f7263b7f45b8..2024226902d4 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -149,3 +149,4 @@ obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
>  obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
>  obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES) += kpkeys_hardened_pgtables.o
>  obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES_TEST) += kpkeys_hardened_pgtables_test.o
> +obj-$(CONFIG_KPKEYS_HARDENED_CRED_TEST) += kpkeys_hardened_cred_test.o

And for the Kconfig convention says[2] this should be:

	CONFIG_KPKEYS_HARDENED_CRED_KUNIT_TEST

> diff --git a/mm/kpkeys_hardened_cred_test.c b/mm/kpkeys_hardened_cred_test.c
> new file mode 100644
> index 000000000000..46048098f99d
> --- /dev/null
> +++ b/mm/kpkeys_hardened_cred_test.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <kunit/test.h>
> +#include <linux/sched.h>
> +
> +static void write_cred(struct kunit *test)
> +{
> +	long zero = 0;
> +	int ret;
> +
> +	ret = copy_to_kernel_nofault((unsigned long *)current->cred, &zero, sizeof(zero));
> +	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
> +			    "Write to current->cred wasn't prevented");
> +
> +	ret = copy_to_kernel_nofault((unsigned long *)current->real_cred, &zero, sizeof(zero));
> +	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
> +			    "Write to current->real_cred wasn't prevented");

This is a good negative test. I would include a positive test as well.
i.e. make sure you can run copy_from_kernel_nofault() to read it
successfully. Otherwise you don't know if you're just getting a bad
address -- we want to distinguish between them. (This is more true for
the next suggestion, since current->cred being broken would be much more
obvious.)

While current->cred is good and easy, I would like to see prepare_creds()
exercised too to get a new cred and validate that it is equally directly
readable and directly not writable, and then use the correct accessors
to perform a successful write to the cred, read back the change,
etc. (i.e. validate the expected behavior too.)

> +}
> +
> +static int kpkeys_hardened_cred_suite_init(struct kunit_suite *suite)
> +{
> +	if (!arch_kpkeys_enabled()) {
> +		pr_err("Cannot run kpkeys_hardened_cred tests: kpkeys are not supported\n");
> +		return 1;
> +	}

Instead of failing ("return 1") I think this should be a "skip" (it is
expected to not work if there is no support) in each test instead:

	if (!arch_kpkeys_enabled())
		kunit_skip(test, "kpkeys are not supported\n");

I'm very happy to see tests! :)

-Kees

[1] https://docs.kernel.org/dev-tools/kunit/style.html#test-file-and-module-names
[2] https://docs.kernel.org/dev-tools/kunit/style.html#test-kconfig-entries

-- 
Kees Cook


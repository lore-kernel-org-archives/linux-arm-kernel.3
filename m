Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89ACD4842
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeZSq8cTRPNkCJBMRm08kt9ICnIHjlA+S0LO9P37S5U=; b=FKa7bvE6snK+tK3ZlSxQfELpKs
	FWgSjVHfjkPl7KMceRTJcCP0hB6Rg2nszAdQZVB6iC/99RXRC+Adf/tzelhxcnosf6SFJ4f3pbzTh
	VUm7/rCllxXKKvicmdrV3D2mhN7izNn9JETtjdWbScPHjn/STf2ov8lZBorfd45X5djs2ZBxG0/r3
	4L2WklfckMq57Zz2c4WZHZlgguv+p0FddkcnX58s0rp/JxYK5+wS29Q5sZ6/thZVbej7l/AFobjRq
	1ynljlsF8pU7TjUktJkPLjKcm219a5CjKl0v6ZuLKHUqxO3GklnqI/69GJDbaZD4wth84xPl9A1sN
	HHAaT8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHrb-00000009VLQ-2zyS;
	Wed, 12 Nov 2025 20:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHrZ-00000009VL3-1ajs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 20:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 691A14070A;
	Wed, 12 Nov 2025 20:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C22C4CEF7;
	Wed, 12 Nov 2025 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762980883;
	bh=shLPokjsUpILOo1X8P8C8cncHvHe+SlOKxjkENPFbPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6oYEDCZaLs1q97C73mboQdwy54DSbOAzBgJt0e5c6NbKPH7F3vCJaSqEE6YxEeen
	 xNUFsLpNEFyeCyJGUXJHfd+n39G0W0A+9Wcs4qUcJn1eXEMOMA71Fq8mqWFQ+gi1Nh
	 ZjHRhCa0QcIfJ6k0MsNk11NKNnyB0UtJsmsYa/ptE/2fntLbnE9GxxXTg3ipvu9fle
	 EiufeUp/I/1hMMfGK9l48NlqRsHpDjDdHWdLFV9bRoKEFKNDQZifQTvmATwu6QfNDk
	 BNBfubcFe2UmRU7fxIaRyziQQWfp8du5Owu47JCA8UNAbcyZFWOjas5XtpbMon4Tb7
	 Hwj5S8XGdJuZQ==
Date: Wed, 12 Nov 2025 12:53:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [GIT PULL] libcrypto/arm64: Move kernel mode FP/SIMD buffer to
 the stack
Message-ID: <20251112205302.GB1760@sol>
References: <20251112093212.2392848-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112093212.2392848-2-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_125445_464262_3CC5FF9A 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, Nov 12, 2025 at 10:32:13AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Hi Eric,
> 
> (cc Catalin)
> 
> I have prepared a branch for libcrypto-next containing all the arm64 FP/SIMD
> changes that are needed to move the kernel mode FP/SIMD buffers to the stack.
> 
> I have created two stable tags [a] and [b] in my tree at [0], containing the
> changes as sent to and reviewed on the list, reordered to accommodate the task
> of merging this into libcrypto-next in a bisectable manner.
> 
>   [a] scoped-ksimd-for-arm-arm64
>   [b] arm64-fpsimd-on-stack-for-v6.19
>   
> On top of [a], two additional lib/crypto patches have been applied to update
> code that has already been queued up in libcrypto-next, moving it to the new
> scoped ksimd API as well. This is better than hiding the changes in a merge
> commit. The merge still resulted in a conflict on the old versions of the files
> that were moved, but this is resolved by simply deleting them.
> 
> Please pull. Or alternatively, if you prefer, recreate the following sequence
> directly on top of libcrypto-next (and resolve the conflict)
> 
>       Merge tag 'ardb/scoped-ksimd-for-arm-arm64'
>       lib/crypto: arm/blake2b: Move to scoped ksimd API
>       lib/crypto: arm64: Move remaining algorithms to scoped ksimd API
>       Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into arm64-fpsimd-on-stack-for-libcrypto
> 
> The following changes since commit f101371e1972df3d897bf2326eda3c28aca2e58c:
> 
>   Merge remote-tracking branch 'ebiggers/libcrypto-aes-gcm' into libcrypto-next (2025-11-11 11:08:57 -0800)
> 
> are available in the Git repository at:
> 
>   [0] git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-fpsimd-on-stack-for-libcrypto
> 
> for you to fetch changes up to 82ef0a6ac77cc0eaca1b5c2fc3436b18cda6ef83:
> 
>   Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into arm64-fpsimd-on-stack-for-libcrypto (2025-11-12 10:08:20 +0100)

I pulled these into a libcrypto-fpsimd-on-stack branch based on
2dbb6f4a25d38fcf (which is currently the last commit that I'm planning
for the "main" libcrypto pull request).

Then I updated the head of libcrypto-next to be the merge of
libcrypto-tests, libcrypto-aes-gcm, and libcrypto-fpsimd-on-stack.  I'll
send these as separate pull requests after the main libcrypto one.

In theory this should all work out.

Note: I changed "lib/crypto: arm64: Move remaining algorithms to scoped
ksimd API" to remove <asm/neon.h> from lib/crypto/arm64/polyval.h for
consistency with the other files, and to add braces around the for loop.

Thanks!

- Eric


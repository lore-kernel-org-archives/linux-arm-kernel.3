Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C2CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 23:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PaQVOtBKZE3v9ORGVLZ/S+YoMJKWkc3yXSMsI7A3wg=; b=Ew8H9y067xd5A/drRKO2vqzTd/
	Rr5KUPlwtfTS4S+fHTgApyW/BPeaUW7YHMPZUVZ+kXw15VvPQZ35Cs0DPv48BP0Pv2NCjgbrDSf4T
	zS/yIEsZO6Rs+pHa8p7nXot7wJhdSAzjMh3NJF6F4Y9pXbYsWCgRlQWT75lh5kUjVyu1e7vIqAJNy
	xp1927ySp1yIevGO3evSILE6bUryULK01cwi3+Hg83yavOlKjhQ13a6j0ld2wIDX3rwl5lRSqCSjj
	nMNzs/OYqVHfkwdCL1/QXrx0/lxCh+/+2QYL4pBf/NQu0GFWUOVakG3T/WTlt1K5DXrqABuDQsAxc
	ZA57NQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6LB-00000006X6B-0lDZ;
	Tue, 09 Jun 2026 23:58:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6L9-00000006X65-3HBI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 23:58:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C40796024D;
	Tue,  9 Jun 2026 23:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2C91F00893;
	Tue,  9 Jun 2026 23:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781049518;
	bh=+PaQVOtBKZE3v9ORGVLZ/S+YoMJKWkc3yXSMsI7A3wg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hhReSk+x6ouUTA9xwz11Y+27JuvrTzoLJ5ZoUhcDG7PLyadjp+0xl+vBNwoeyr4OK
	 lMJT6XwAdPgm/s9zn3abQumwSeTXk3piwwROO98ZKw9/C/MxGB6dSSXDnh/hgZnjRN
	 tE+u8mNOUulPyU2LhMWmq628VrwrwZRQsjo89j9rHHwil9lvJU+hyk20Cr7rPV+o9N
	 sr3subUJJH2esI1KuOKTfnYrPDERhcRNMW7wIIWdJM78cwDf49sxH2jl8Y8Z/3EJP2
	 Dm/HLqVc26XdBzUnP1QuQzOLjs/xFeavOfkoe3GkVey7GzwWJ/2fl+W5LoYOTPNS5V
	 cUZJSv/aAEA1w==
From: Nathan Chancellor <nathan@kernel.org>
To: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, 
 Han Shen <shenhan@google.com>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-kernel@vger.kernel.org, 
 Juergen Gross <jgross@suse.com>, Helge Deller <deller@gmx.de>, 
 Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
 Alice Ryhl <aliceryhl@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 xur@google.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260604195612.3757860-1-xur@google.com>
References: <20260604195612.3757860-1-xur@google.com>
Subject: Re: [PATCH v4 0/2] kconfig: Remove the architecture specific
 config for AutoFDO and Propeller
Message-Id: <178104915053.2707941.15376333963856993352.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:52:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=nathan@kernel.org;
 h=from:subject:message-id; bh=rAvYHKylJvOde9lz8ktIcXKIkv2Fmc9P1sfKuQRhZSo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaK1ZM8Nv8YIfWohNTAudH3/l32TL5u+S1u8pPT9vf6
 tlT+aV2YUcpC4MYF4OsmCJL9WPV44aGc84y3jg1CWYOKxPIEAYuTgGYyPTHDP+dbHqnmZ070Rjy
 wFz79/cEHY9rWn9O9ZvrPD+8NulX6n1jhv9pMQ32bJNNG1YdXjkhSGuCpNWFldOFr26PMrJZt1t
 i3W4eAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

On Thu, 04 Jun 2026 12:56:06 -0700, xur@google.com wrote:
> kconfig: Remove the architecture specific config for AutoFDO and Propeller
> 
> From: Rong Xu <xur@google.com>
> 
> ChangeLog:
>   V4: (1) updated docs for AutoFDO and Propeller
>       (2) moved .llvm_bb_addr_map sections grouping to the header file.
>       (3) use $(cc-option,...) for supported archs.
>   V3: (1) updated the base;
>       (2) changed vmlinux.lds.S for arm64 to avoid the warnings
>           from .llvm_bb_addr_map.
> 
> [...]

I took this series as is to move it along as a courtesy given the merge
window is approaching but I think it could have been organized better. I
would have done something like:

    Patch 1: Update AutoFDO documentation
    Patch 2: Update Propeller documentation
    Patch 3: Drop AutoFDO architecture specific configuration
    Patch 4: Factor out PROPELLER_DATA from x86 into vmlinux.lds.h
    Patch 5: Add PROPELLER_DATA to arm64's vmlinux.lds.S
    Patch 6: Drop Propeller architecture specific configuration and rely
             on compiler support alone

Try to stick to doing one thing per patch, it makes it much easier to
review and analyze in retrospect.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/2] kconfig: Remove the architecture specific config for AutoFDO
      https://git.kernel.org/kbuild/c/e88b2fe8b9993
[2/2] kconfig: Remove the architecture specific config for Propeller
      https://git.kernel.org/kbuild/c/2566fa7b2f240

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan




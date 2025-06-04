Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB891C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb1czdfy29BXnWFnYYwpe0HgjdonZh+TOYjzeKtPbZ0=; b=rqvQO+RIxQ1ODcytVzRtXjdC1y
	qYX9t9r/6Gm0po4nhP/7Lbrs9Kle4WoDJeoI41Oa1bFbxw40wbcgHtWctyqGylnLcDMGPg5wMhKhP
	mgu99uKFwFUuaTONglqHTM7EID1kmddjKbrGGNwfIyM2QmZyQaeX9IZBTQ8gs8PGyieJibZZvsGfa
	oeQIvLEdv5KKzYE9CY2oQ89h/a5/B0E5x/qPsO3/i9RRjc2Wdl75xw5Xat6lLD/ArYauXLCprrUuh
	dLkoQRanvTX6rHmZZDToBFprRs+PWT2PY7ZHwZFzSVQ8EZkSrerXhSZrUGdT8g9WdqgmXrE+Zu/md
	xQWHoZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiSX-0000000ClDo-39FH;
	Wed, 04 Jun 2025 07:22:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiQP-0000000CkxT-3L69
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:20:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFEBF1758;
	Wed,  4 Jun 2025 00:20:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEEAD3F5A1;
	Wed,  4 Jun 2025 00:20:33 -0700 (PDT)
Date: Wed, 4 Jun 2025 08:20:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] WARNING in do_sve_acc in Linux kernel v6.6
Message-ID: <aD_zu4GNfOKxXXQk@J2N7QTR9R3>
References: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_002037_918602_B9DB0A85 
X-CRM114-Status: GOOD (  26.83  )
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

On Wed, Jun 04, 2025 at 12:57:30PM +0800, Luka wrote:
> Dear Kernel Maintainers,
> 
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.6, corresponding to the following
> commit in the mainline repository:
> 
> Git Commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa (tag: v6.6)

For clarity, that's literally the v6.6 tag from 2023, not a recent
stable v6.6.y tag.

That also doesn't match the commit ID in the bug report linked below,
where the kernel reports itself as:

   6.6.30-android15-8-4k #1 dc911bbdaa9a863c41e12d277ee63ecb446e0526

... which implies that the kernel you're using is derived from the
v6.6.30 stable tag, i.e. commit:

  5697d159afef8c475f13a0b7b85f09bd4578106c (tag v6.6.30)

... in the upstream stable tree.

> This issue was discovered during the testing of the Android 15 AOSP
> kernel, which is based on Linux kernel version 6.6, specifically from
> the AOSP kernel branch:
> 
> AOSP kernel branch: android15-6.6
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6

The commit ID reported by the kernel in the linked bug report, i.e:

  dc911bbdaa9a863c41e12d277ee63ecb446e0526

... does not match anything in this tree, and the latest commits in that
branch are based on v6.6.87.

Is that a kernel you've built yourself, or something shipped by the
hardware vendor?

I suspect that this is whatever the vendor shipped, and you've guessed
as to what exactly it's built from?

> Although this kernel branch is used in Android 15 development, its
> base is aligned with the upstream Linux v6.6 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 15
> platform and identified that the root cause lies in the upstream
> codebase.
> 
> 
> Bug Location:  do_sve_acc+0x17c/0x3f4 arch/arm64/kernel/fpsimd.c:1479

Looking at this and the report, I believe that you're running an old
kernel, and hitting an issue which has already has a fix upstream, where
that fix has already been backported to stable trees and the
android15-6.6 branch.

Specifically, I believe you're hitting the issue fixed by upstream
commit:

  751ecf6afd65 ("arm64/sve: Discard stale CPU state when handling SVE traps")

... which was backported to the v6.6.y stable branch as commit:

  51d11ea0250d ("arm64/sve: Discard stale CPU state when handling SVE traps")

... landing in v6.6.61:

  f1ab3a1bcbbc (tag v6.6.61)

... which was merged into the android15-6.6 branch in commit:

  cf775c9332b1 ("Merge 6.6.61 into android15-6.6-lts")

... back in November 2024.

Mark.
 
> Bug Report: https://hastebin.com/share/calarosado.css
> 
> Entire Log: https://hastebin.com/share/efepocaxoh.perl
> 
> 
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
> 
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.
> 
> Best regards,
> Luka
> 


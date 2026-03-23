Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C6D58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMysBAfA/MI+JdBiU1XrjAImaqMDsQhB+XjDlmt8v8w=; b=EBclYUv5d2YNfZ8GY6hOAA81fA
	5JeMuhqmPSSUMd98CfItMzFN8ak5FV7wkaKL1bgEarExDB1aoeJfxW1Ueo5OeV+28uLP2EMXHhMav
	8gLsFSQAAqhaxGMraNZlEu79j+pX1whvfq5QlLsw8zh9pgqAUCMJYwzT0viVGMCrMI0oAquRk3X7k
	y1SzMeV3dYP8/Rl2RB4V0tF5fFAazoK9p9+kBTRuw8weaLohqp0QlyCJrCSk5M3GVMP5CuFFIjnea
	pLejHIZnhgI0e8cqOEnViop5RRJdEMILUo48qbvi8Dk5E9GZJmGm75smJaCWGUKwEhLhW4S6tKq7Z
	xT3KxOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nmP-000000004sk-09F5;
	Mon, 23 Mar 2026 22:29:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nmN-000000004sd-2PRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A441600AC;
	Mon, 23 Mar 2026 22:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C621BC4CEF7;
	Mon, 23 Mar 2026 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774304986;
	bh=wYGlFzTL5gzNqKe66BjkJuzWF5ZBkDGj2lJjld3GkPs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ACB3aBDMLm+j0kgUbd/TnDsPm4m2n9nBksojJNcAl+kPz4tV2JmUXAFeUSDmb3VHq
	 78p9M15ZisS41nGMO66ljL8/tFdLyMH41fdFxvdAPPHGhUNo7Z/XduWgrQjmxic5Cb
	 XkhgwkTL0C8URvW5BHokd8+5t33pYcNPKJQzk+yE=
Date: Mon, 23 Mar 2026 15:29:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Kees Cook <kees@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Jeff Xu <jeffxu@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Message-Id: <20260323152945.e3626b741d28e3db526d9413@linux-foundation.org>
In-Reply-To: <20260323214117.241216-1-osama.abdelkader@gmail.com>
References: <20260323214117.241216-1-osama.abdelkader@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 23 Mar 2026 22:41:16 +0100 Osama Abdelkader <osama.abdelkader@gmail.com> wrote:

> aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
> sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
> aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.
> 
> Unwind in reverse order: drop the sigpage when kuser setup fails, and
> kfree the vdso pagelist when either later step fails (only when
> CONFIG_COMPAT_VDSO allocated it).

Thanks.  AI review has flagged a couple of possible issues:
	https://sashiko.dev/#/patchset/20260323214117.241216-1-osama.abdelkader@gmail.com


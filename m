Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8531FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7UU8I9REpQpSgsvF2mEsjgGrjH9OWnIsIWxfgfvteM=; b=Y4xAdr3al0lvPkoAi6PnfQ73c+
	boH8IaLMG3ZTT6wgfNiYMAvuddWIemcfalUQWQgQ1M2UlETgtBw2eVcj70gnq8L/nTtLElxFd+ShW
	o/cwEk0j4ojBPYweefdS5SVnnGDypGlfbS2o5cQ4UjYmTYouod+48JbuKB5RFXfc7EmXAsxEiNgka
	uITp2HulkhzweXXuAv+qOOm7GVIXWRb15MrDV+Mn64NhYrjTUnanGWYsnQVVFYiHOSepJm5YLCEVU
	Nk358X0gEvciPEszyIu9eOYSr8vpikukUchTLsQVJ180BhH/x8ok7obly4Ykr0ggNO6ToJpSYlUeD
	0THDEkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmlV-00000002vf7-1n8x;
	Fri, 17 Jul 2026 17:54:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmlT-00000002vew-2XZi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:54:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5DAB60A6E;
	Fri, 17 Jul 2026 17:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EC91F000E9;
	Fri, 17 Jul 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784310862;
	bh=M7UU8I9REpQpSgsvF2mEsjgGrjH9OWnIsIWxfgfvteM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B7848+37HZJnPYVQhtr3V/8J7xCRJmicwb3gQEaRWadSFLpSslub6h4BZtdePT1/G
	 h9PVMxb78mP8gqhgEUPamf/kB4jDzu5ZYGnGtRxN1VAfBGGhkfrYPhYR6b7kcoBo25
	 j2QiRhjleoubLNMJ07TAdl3GsjbLjC9UvUgTtiOg5iCauVA/58w0oYGUYZjxCsUWVF
	 u2h/d0lId9H93mLMsmMu2LDmuQd1BLsolZifxMJsJgs/QA35si4PYF4A5B52Ichs6S
	 DEWT8cxQhYrIaFZ0qv133/+MZr8uj85CBk9JecHdbKPgBqfK7kUarU4LwZgE3BDPE4
	 2re7uMi/yQLHA==
Date: Fri, 17 Jul 2026 18:54:17 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <alpsSRyTU_mquZyA@willie-the-truck>
References: <20260716120640.6590-1-will@kernel.org>
 <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
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

On Thu, Jul 16, 2026 at 05:48:01PM +0100, Will Deacon wrote:
> On Thu, 16 Jul 2026 13:06:39 +0100, Will Deacon wrote:
> > When seccomp support was originally added to arm64 in a1ae65b21941
> > ("arm64: add seccomp support"), seccomp was erroneously called _before_
> > the ptrace syscall-enter-stop and therefore the tracer could trivially
> > manipulate the syscall register state after the seccomp check had
> > passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
> > seccomp after ptrace") by moving the seccomp check after the tracer has
> > run. Unfortunately, a decade later, that fix has been reported to be
> > incomplete.
> > 
> > [...]
> 
> Applied to arm64 (for-next/fixes), thanks!
> 
> [1/1] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
>       https://git.kernel.org/arm64/c/e057b9477232

Bah, I've had to revert this. I think Sashiko makes a good point here
that the seccomp interaction is still broken when the filter is
re-evaluated after the tracer stop, because that all happens inside
secure_computing() so we don't get a chance to update 'orig_x0':

https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org

I've got a v3 that takes a different approach, so I'll send that out
shortly. Jinjie, thanks for sending the selftests, but maybe we can
extend them to cover the loophole above as wel?

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D9BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/97G2qyjoswRRMUZIK+JcpWv+RMUAVgoKftZuJiNDM=; b=LZJBKrobuijRsTeBsatxsYuJYs
	j6PybX282/4EjNdWLv8LnrJxaiPSQFHGh8Y4umojznCnR78NTF8a/HuzOc1FXUbdFNUW6aXk7+E+L
	wxgtfmRG3WkgGZJKeqAmHFszxzt0MLhqfjSahV+yKNzUmZ3EfFGVEXpVe2WQQQ0Pgbi+7/yHjli3M
	Ge6JNNcCTgipLi06dxg3ADEWNNj4iHG8fL1SxpO7u7PhWvUsCdI2lVDJpV+00vcQ9k4L/+9QY9eaK
	rCgGWAKipD4at52WsF6bjn6+UGit9RIC6g6v32irD0mLwWamUMLm9bxD9xqJ5RBqETmLlqPUE3WSv
	uY0pB3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOyLD-00000006ww9-2Ss6;
	Sat, 21 Dec 2024 12:12:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOyJz-00000006wrL-27jq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 12:11:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D02F35C4547;
	Sat, 21 Dec 2024 12:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50311C4CECE;
	Sat, 21 Dec 2024 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734783061;
	bh=vqc1kqawWAiOMTPciBmIBIKH7ausH1SR0W1ohLeHgas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwhmiFW0wnyKUMx6NCsX/bVGcYBg9BiZrsK6xalHQcMR3j5rdvh6fYd0DQCURwutz
	 ArjOjqLLPZV5ik5XWsmf9vTO64Ufvo0fnhOPlYgcS50GPNWXNwZtcFLAAvdYuhjZQ7
	 lIbk5yBwVDP4/KTxxBUXaAyLIviJVajWct5Uxc84V8sJXKdsSuFQeQWX1MEZzqy4dk
	 yjpkyURGlAEiJK3bKNNTD08tpIZit9FdUUE0ua25Nsw5Pm+ZQShsyt5vF+NvsB8NQ1
	 jTGeFhn2DOJskE4Via6gWntJ1PaGgkRMW92kTA9huy2P+mCr6zmre/AHoJ57mYKMqM
	 UriVmfJvOz6Kw==
Date: Sat, 21 Dec 2024 12:10:55 +0000
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
Message-ID: <20241221121054.GA27495@willie-the-truck>
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-14-ardb+git@google.com>
 <20241221002906.GA2558963@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221002906.GA2558963@ax162>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_041103_595783_8F54074D 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, Dec 20, 2024 at 05:29:06PM -0700, Nathan Chancellor wrote:
> On Thu, Dec 12, 2024 at 09:18:48AM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Currently, the maximum supported physical address space can be
> > configured as either 48 bits or 52 bits. The only remaining difference
> > between these in practice is that the former omits the masking and
> > shifting required to construct TTBR and PTE values, which carry bits #48
> > and higher disjoint from the rest of the physical address.
> > 
> > The overhead of performing these additional calculations is negligible,
> > and so there is little reason to retain support for two different
> > configurations, and we can simply support whatever the hardware
> > supports.
> 
> I am seeing a boot failure after this change as commit 32d053d6f5e9
> ("arm64/mm: Drop configurable 48-bit physical address space limit") in
> next-20241220 with several distribution configurations that all set
> ARM64_VA_BITS_48. I can reproduce it on bare metal and in QEMU. Simply:

We dropped the patch yesterday, so hopefully things are better today.

Sorry for the bother and thanks for the report,

Will


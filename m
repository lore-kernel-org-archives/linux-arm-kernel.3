Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045AC107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qewt06xjfTb7I8vrKT9DfhdFth0gEb7T3n+ckoM4tsY=; b=Y6UxSjg3cRVsfY21QAWlJF3mPe
	rvu1Geuwy61TSU9zfafpxuEb0wTHsIEMrGlx3JRPKmDtfdaH4RUHC/l1QgQ6Z0Y91lGOLZj+pjYUf
	RvuRLMNgVyntFWnfmrY4BQSgAhm7uKwjz3bF6B/xM9GesE3ahGG5I8C9IiFAlCaO7MrzLDuSP/Ae6
	5We/1GkOwhoNxL8lM5KISyOnKgal43zWm1YuqABKgQy1jAHsCmm+aAZqgLlDVBhIOH5UyXHDSfXov
	6GKMnBYnsmCUPOqtxuD10AiFbQZbjIKuM2gpJD4jlDygtoGIARc7jwiVLZaTnONFGDYUVF0eJpLE/
	IgmKLM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18PB-000000016Ca-0wuH;
	Fri, 13 Mar 2026 19:42:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18P8-000000016B7-0qzH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:42:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D59821758;
	Fri, 13 Mar 2026 12:42:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D8F3F694;
	Fri, 13 Mar 2026 12:42:36 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:42:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] arm64: scs: Remove redundant save/restore of SCS SP on
 entry to/from EL0
Message-ID: <177343094464.934517.6175906198063441476.b4-ty@arm.com>
References: <20260313123220.29878-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313123220.29878-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_124238_308887_FA1EBBD7 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Fri, 13 Mar 2026 12:32:19 +0000, Will Deacon wrote:
> When returning to userspace, the SCS is empty and so the SCS SP just
> points to the base address of the SCS page.
> 
> Rather than saving and restoring this address in the current task, we
> can simply restore the SCS SP to point at the base of the stack on entry
> to EL1 from EL0.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: scs: Remove redundant save/restore of SCS SP on entry to/from EL0
      https://git.kernel.org/arm64/c/3ce8f5860ff4

-- 
Catalin


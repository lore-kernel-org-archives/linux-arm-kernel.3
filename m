Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC18CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JVgPi8y5pr9WU/dl+aDm2nZ18TubPQulEy77eIIoew=; b=4uJbL4jxvBJO0hqKQKSsUpE7kK
	FJ3nh4LuKJWx+ferNRXk0CDsqHk7uKgqj6mowHsnRNXv32JXVHdQ9+OPVdKAvE0cRFHr4FzVmRBC7
	njYtm3SG9f6eZhKYZdcVrPIuQnb5M/rQxproOJFYKp/9DSt1WGivc5f9dzn1QNOwUSM60rJvsWi8j
	SdkbisI//M5/OJ8qgv0qLnMF4aBr5Qt9cAaTbuVgUHJhGWJc8xfnFPg0wEceAenn4t6+hc0Srmp3C
	CSg6MK6qSUNv4lEZ13QVNdDDYftW55k9+rL3xElDjswFt6Ee4IiWHtPCWEb/207ymHgHmEOFAuaii
	CgdgXLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2e-00000007RDu-0CsE;
	Fri, 01 May 2026 16:48:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2b-00000007RAQ-1OWj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7240F176A;
	Fri,  1 May 2026 09:48:31 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F49F3FB3E;
	Fri,  1 May 2026 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654116; bh=0mhe5VO6bibA7BOMRyysUlyXRYgOpwf38PrIb8CTsm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOyG47tYx2GM+V815gcxteslVYvLCr/JT7YyNNg9OXp8pk8PfZ6816/nXtBk6i61O
	 03DNgK6VCRnQhXeO3jpN99bDGHeGw6krvxSPMbHG6doMc9rYTk7R2nXDCdf1tRNpvI
	 3w+rwseFvJS7G2ypiaSJaivkB1YzcHNpkHP41vO8=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] POE sigreturn fix and extra tests
Date: Fri,  1 May 2026 17:48:24 +0100
Message-ID: <177765401795.1247142.18437523935136255541.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094837_440445_C4879387 
X-CRM114-Status: GOOD (  10.09  )
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

On Mon, 27 Apr 2026 13:03:32 +0100, Kevin Brodsky wrote:
> Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
> avoid uaccess failures") introduced special handling for EL0 registers
> that impact uaccess. This did not however handle the case where a signal
> handler removes the relevant record (poe_context for POE) from the
> signal frame; this is clearly not typical behaviour but it is legal.
> That commit resulted in arbitrary data from the kernel stack being
> written to POR_EL0 in that case.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/5] arm64: signal: Preserve POR_EL0 if poe_context is missing
      https://git.kernel.org/arm64/c/030e8a40fff6

Will, if any objections, please shout.

-- 
Catalin


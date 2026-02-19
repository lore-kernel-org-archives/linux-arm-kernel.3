Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C652E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeOxfhE58M7g8Cq9p8xf0pHP+foo3Tes4aziK8/uikk=; b=cuHTLr7jT1UOjlhcMAuVgaqTt8
	sWA5wOxcOnQjRtD+MtzTuUJRIhl3ekh+knKeht0fxZyREPDtHzqCT0kxSFzTbXihxbxMjagp77l0P
	k029o0H0iiJ4QwL86de/0/+qb6gQ2WZBcZKOli7PgfawxeWBD5XPBdebb6HMVQDWPHX3vNJRJkyP2
	romsWM6IdtUWEkdS5fT4E9dddH8n9Ja8TJ8jkLhtckVOo7tVQWv/NaTnDK+BX1swTdgC42ijHVezu
	yUvAeiVn9oS7GfPeqj9O9qsOm7vxSJeQQP0nyApqJparPCGk0eC6ZQe8Hd7h0MfuLnlCrymH/+JLt
	PbogJTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt43y-0000000BOV2-2CSI;
	Thu, 19 Feb 2026 13:27:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt43v-0000000BOUH-1BEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A96F43760;
	Thu, 19 Feb 2026 13:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3E9C4CEF7;
	Thu, 19 Feb 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771507642;
	bh=UOmv4/E5nYy5BuX3+7GRvfIqjiGW59WAq5mvH6o1Cs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNOQaBTL7KMcBfgk1wXGWh+KUFICzxB6eyujlrmU/fF72X+OYUHyNEMo6hw8681ic
	 OApECaWkaXvQ4LcywazEtUD2FA5QnfcegHAPX56OO3xUe9JxZhpThbZMvSWvtXBjrP
	 R33bpr0AJcFrhkC9GYZDlKnB58RNiu6bxeydvrxJgGuXJAupJxa88SWtUYO+MpdaBn
	 uvM0ajf9GqW+DHOTV7G25FmOBzW3/pRlNleAECTAMJHJGdYUlutP+CICLYZGgrxBOl
	 aSYzRKHX1YL/+xTassE615sYOoqHCXDnGYgOtAsPwIOMRSetzrlgCKzm1wEIf34PEx
	 WHilAr9VQYjEA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v3] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
Date: Thu, 19 Feb 2026 13:27:12 +0000
Message-ID: <177150443271.2427273.4066606307827400858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216105432.2381873-1-arnd@kernel.org>
References: <20260216105432.2381873-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_052723_726579_21764FC0 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 16 Feb 2026 11:54:21 +0100, Arnd Bergmann wrote:
> gcc-16 warns about an instance that older compilers did not:
> 
> arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
> arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]
> 
> The issue here is that __pte_clear() does not actually use its second
> argument, but when CONFIG_ARM64_CONTPTE is enabled it still gets
> updated.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
      https://git.kernel.org/arm64/c/729a2e8e9ac4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


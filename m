Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22CCC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MJcwFyK0XSX6w15YBMBcFIl+olY41hzWRISD4eBExw=; b=d5TtuqIkC8ElzHgo8swpCLVaF6
	0h7gflaIWORuOT7sH8PJ+MLeOdjRjULGegMon7eE1vDT0Kv2NOIANbBpfKDhhPy98VpD9M4aFT1XE
	DvV4qUzpGCxzeBOkMHBRL6g5mgb+PkPM+vlEfXJgGCOx8jTxwHiWlB1A9OJ3SSHSBnGyYnQWDgUXd
	5dAz1x3KnCSHpmkeeT8lWCpCDDOyc7I6X50bNyl5NqzrJUqNpbNPKf245NUapEvjSQADFv8t4phQl
	Aq+Hp42yt/27MaduVmVoYhZi5q6NxRvFwghyCsAIwjzk44IxNPArjjAUZ/Xux4rK22PkCNvxBpEgy
	uAa+t7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPo0X-0000000EQaT-0ZDZ;
	Thu, 12 Jun 2025 19:54:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPliX-0000000E29e-0lI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44E5D5C67AD;
	Thu, 12 Jun 2025 17:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A16DC4CEF0;
	Thu, 12 Jun 2025 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749275;
	bh=H67rdJiIBIuzT3hLyIDtDtrf85zTgpnUrwpNkRv16WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6/VuU+sEbZhvI4MqJoho1sr38mqFEgf7E4wpshRVcfUQP2vQS/JF71WRspca7LT4
	 69yCeddn0NovXmTKNYwHRvkOyVUEUnGi8Kku7exZN9lkBtzTJuVgiSIPlAbQjYSX3W
	 TedWRiYXtT7PWgXzTLhqYZzBA/rJtnKFMON+NZf+RtfvAZg4Crn6bQ98BVWgzfVRt8
	 2VQdEDk7W6IFsZEzZGYM272j6VXIpKEz2vtgGE+AInHBsJ5kwWfOMYV0Klsn7iZiPI
	 EtRxlaj8dlpEc68F04FcCvr6aq99CaeG/NB0k9gZ1XdBefLvEfqEWyCyHrt/5Jl/k2
	 K+lSzxYw0fo/Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Dev Jain <dev.jain@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	david@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false warning
Date: Thu, 12 Jun 2025 18:27:46 +0100
Message-Id: <174974002001.2447691.5560596379050052913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250527082633.61073-1-dev.jain@arm.com>
References: <20250527082633.61073-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_102757_257431_D37AE259 
X-CRM114-Status: UNSURE (   7.94  )
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

On Tue, 27 May 2025 13:56:33 +0530, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller
> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
> a pmd_present() check in pud_free_pmd_page().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Restrict pagetable teardown to avoid false warning
      https://git.kernel.org/arm64/c/650768c512fa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


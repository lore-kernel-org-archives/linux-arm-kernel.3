Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQndw1t7iqKnhRoM624iPyJn99zmb0gXougK1XgPhTE=; b=A63qn1DiMABMX9Hp38onhzzuUb
	USPglil0LBXfSCIvTRuufT1OmS7o9/c30C1qhix72nzIXtvtML4rNgxCqr5tqpN42lsJRhCtC25nH
	6Rbx5jgUJSyedjjUSHDDwKa+bsmwbho6rXqDDQYMVyLClY75N7XKj71vM8hX/3ddnCrPeomrm22oW
	6bvoP9GC/q/oLgBZhPKi0cWnZJepyFJY+ZfwnV0fmxUES93tjB8XxTWrDfrPP1QCOudlVVF0NgwOI
	T8zpRTLhYbpveLfLAO0W1Gu3sF2/Q4tdrvPhQ+g5hXCSgqRojgNGH4AuWtRU7l7CU0h7fcobMieLW
	NEuyxvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZKS-00000009H48-1IQ5;
	Wed, 08 Jan 2025 16:54:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5D-00000009DEP-41V2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77B4FA41A96;
	Wed,  8 Jan 2025 16:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11C2C4CEDD;
	Wed,  8 Jan 2025 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354342;
	bh=G+OhP4NLoAgaXhZ7enFXOvNAN7ZyUayAl9a7Xpz75Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5T2lBCsApYDMkwX9SSQ9YxTFYWj2Zq7ekCarhFfeMI6/3itiCxlsGAVeiy7cdcvz
	 0upDJCMomK1Oc0zoXYf8bFSjI+L/jFCogatlyMpoiU0ROmbCyA9CXFJZApD4kxq1Nk
	 icbIiTB2ZaW1EjTYuowMNmeJbq1W55cbnhNgQpTMRMJWdJF0WmvMNX6QMznUVTFmtK
	 exnzovgeDLJVkG/iR+5/8FncIWdcBHpcF9fd5Vs+Nk1MLN7mp/dlXknbYorpXhpLQY
	 QDL35b9y7SJTA2ZZuohFTfqCM5XnAUjqRz6BwRGEoLAO8YQNBvGsALu4Xa5hCEbLLP
	 h3+WAP1WxWuLg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Rename pte_mkpresent() as pte_mkvalid()
Date: Wed,  8 Jan 2025 16:38:50 +0000
Message-Id: <173626845364.286028.7391336422738893247.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250107023016.829416-1-anshuman.khandual@arm.com>
References: <20250107023016.829416-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083904_056383_AA29FDF1 
X-CRM114-Status: UNSURE (   7.17  )
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

On Tue, 07 Jan 2025 08:00:16 +0530, Anshuman Khandual wrote:
> pte_present() is no longer synonymous with pte_valid() as it also tests for
> pte_present_invalid() as well. Hence pte_mkpresent() is misleading, because
> all that does is make an entry mapped, via setting PTE_VALID. Hence rename
> the helper as pte_mkvalid() which reflects its functionality appropriately.
> 
> 

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Rename pte_mkpresent() as pte_mkvalid()
      https://git.kernel.org/arm64/c/169226583097

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


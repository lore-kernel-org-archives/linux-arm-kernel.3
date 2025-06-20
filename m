Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462DDC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rTL3kFCrFaa9IxZnBsrs4JgRlRauZ+S+XApzTV65fI=; b=0nPZHCcSZJbBbuGdSp+/gz5lc7
	DwAR9gBFZMT0t/Hebk018dbwfrkG7Qj/f+z3sCIMMubrO4J200pOuymV+Qj0kYJc5czWozKfNzQmZ
	aVi6x1DpOdNpuAcP8gbGQdYVs7MIMHypLW5VBaqgCLc9tq5lLPir0tENfUZFU3OvSrbVFIWp8wEV6
	ejivYSldTh2zABexrBfvIdZzmuRMzpzXNlCWFqqCRxQK4OqlN+hfQveWVi4j4r3n3UZWzS9LnrpJz
	zxVnlmS7JlPzWfAB55c3TeTN8jLYwMrRB+aj4QQes371AIPiu+0UOq8H/DDKw8aJYZDKSDMERvrUt
	wDlQQyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbK6-0000000FcvC-2Bnl;
	Fri, 20 Jun 2025 12:58:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSayS-0000000FaRE-1IT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 12:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DF5F61C6E;
	Fri, 20 Jun 2025 12:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C142C4CEEE;
	Fri, 20 Jun 2025 12:36:00 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	andrea.porta@suse.com,
	jpoimboe@kernel.org,
	leitao@debian.org,
	linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	song@kernel.org
Subject: Re: [PATCH 0/2] arm64: stacktrace: Enable reliable stacktrace
Date: Fri, 20 Jun 2025 13:35:58 +0100
Message-Id: <175042293850.3925078.16138215907121902894.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521111000.2237470-1-mark.rutland@arm.com>
References: <20250521111000.2237470-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 21 May 2025 12:09:58 +0100, Mark Rutland wrote:
> These patches enable (basic) reliable stacktracing for arm64,
> terminating at exception boundaries as we do not yet have data necessary
> to determine whether or not the LR is live.
> 
> The key changes are in patch 2, which is derived from Song Liu's earlier
> patch:
> 
> [...]

Applied to arm64 (for-next/livepatch), thanks!

[1/2] arm64: stacktrace: Check kretprobe_find_ret_addr() return value
      https://git.kernel.org/arm64/c/beecfd6a88a6
[2/2] arm64: stacktrace: Implement arch_stack_walk_reliable()
      https://git.kernel.org/arm64/c/805f13e403cd

-- 
Catalin



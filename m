Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9252FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tk6w5Lo7mzFUjgVgHsJPYWUdnfOl2EP3ITEpy1dF+vM=; b=gH4Qe4XkVOZEZOhdD3n44KMrCx
	QPLU8ZeUvmtePLP0DTGFMopl8Vix/3KxA29gUb0F6+e9cGrve+mNSSUycoVq/JCRYu+ZdY30Q1HbK
	tdqvECi7v8O6FEx0eJyulniQe0iRP0ANgc0Of/13EYYEXlD33Z2pNpcpZUqeHoUzB0GU6CUP4SdsM
	s2YVbpEl3qaaust0jJXszr5sdIHMbADRU9zeK7Vl2EzGibO99zAj+7qiPPAzDD6GHltRt3bNdU0Rl
	qjUku7GABd3iuZleOg8yjaI7VJX6391Tbmcx3tWYTZRo8ejpAOgLPCEUdjY+q6K22isNHU9wmanUr
	wr0HI1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhOY-0000000FbGg-4310;
	Wed, 21 May 2025 11:13:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhKr-0000000Facu-1YEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:10:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7811515;
	Wed, 21 May 2025 04:09:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 868473F6A8;
	Wed, 21 May 2025 04:10:06 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: andrea.porta@suse.com,
	catalin.marinas@arm.com,
	jpoimboe@kernel.org,
	leitao@debian.org,
	linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org,
	mark.rutland@arm.com,
	mbenes@suse.cz,
	pmladek@suse.com,
	song@kernel.org,
	will@kernel.org
Subject: [PATCH 0/2] arm64: stacktrace: Enable reliable stacktrace
Date: Wed, 21 May 2025 12:09:58 +0100
Message-Id: <20250521111000.2237470-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_041009_450094_C5565E10 
X-CRM114-Status: UNSURE (   7.42  )
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

These patches enable (basic) reliable stacktracing for arm64,
terminating at exception boundaries as we do not yet have data necessary
to determine whether or not the LR is live.

The key changes are in patch 2, which is derived from Song Liu's earlier
patch:

  https://lore.kernel.org/all/20250320171559.3423224-2-song@kernel.org/

... with cleanups folded in, as discussed earlier:

  https://lore.kernel.org/all/aCs08i3u9C9MWy4M@J2N7QTR9R3/
  https://lore.kernel.org/all/CAPhsuW4UVkXdShpo2TvisPhr6S1jFPkS_BKXAjN9cT3=k5SAFg@mail.gmail.com/
  https://lore.kernel.org/all/20250520142845.GA18846@willie-the-truck/

... and due to those changes I've dropped prior Reviewed-by and
Tested-by tags, but kept everyone Cc'd.

Actual support for livepatching will have to come as as a follow-up, as
that requires additional support that Dylan Hatch is working on:

  https://lore.kernel.org/all/CADBMgpzPyW+EnB3A1Hr=LQGhuen4pUuJ0QYa44nH0qfQ9TFaSQ@mail.gmail.com/

Mark.

Mark Rutland (1):
  arm64: stacktrace: Check kretprobe_find_ret_addr() return value

Song Liu (1):
  arm64: stacktrace: Implement arch_stack_walk_reliable()

 arch/arm64/Kconfig             |  2 +-
 arch/arm64/kernel/stacktrace.c | 55 +++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.30.2



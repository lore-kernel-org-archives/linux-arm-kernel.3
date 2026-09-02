Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB324C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CO3LG25qSHhVLijk0TY0KKdaWHkAHnrz3sT1LudBzhk=; b=0ENKFMcL2HL58DZ+wyaFM6gaN8
	x5EeD45FYas8LTvHV5msvIVUshncbn0rIPV7RWJ0ohhxEQxY6TdWYuKqOoMmsVWvxu+bMmD621LR5
	UljAEMmwEw3QImQuCxF+LDmyWjUepmqzMbsmoItt2A8qYwzlpneTalVNxMGVnF7dkjpG7ndPNhulf
	5WNlGUUEynhRqR1rantBg2fzDx30fHvbh/Ku+6XFI2ES5Jtj8kwqIBOM0PcWsvhUdeaghiLEAddDu
	OGjM4qh+AoI3oIGKfRBSVGM/i3b991PAlEAKO4En8OL//XuUpLj28LpQ7FOO8XsBcGJLMMp1N4twv
	zMPWgr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCv-0000000EWCQ-2Szu;
	Wed, 02 Sep 2026 11:32:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCt-0000000EWBQ-0gaH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:32:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC7A82F;
	Wed,  2 Sep 2026 04:32:35 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8D183F85F;
	Wed,  2 Sep 2026 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788348759; bh=qx1oKdH0wHUPkUW+KQ/NyOiGBLOROyjuVV3j7qsQIEc=;
	h=From:To:Cc:Subject:Date:From;
	b=r8bJ0fZC2S8t0PJtEtQmFyFf6PisNnzlOsgsaQ5jEC8xqgUDJf0BaayS8E5ZZTR5U
	 Z+Kwz/GUtT+nnFcH5UsrLpFO0ztpD917KpAmvPDbfgghp9rfSH4eufqwWwgjRnQe5s
	 b3Ac5x+Syl5lt5bOqQ/w6aFTfKEuKeHzCJG8+THM=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 0/2] arm64: alternative: Remove optional 'cfg' parameter
Date: Wed,  2 Sep 2026 12:32:30 +0100
Message-Id: <20260902113232.314831-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_043243_247757_3DC3950F 
X-CRM114-Status: UNSURE (   7.92  )
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

These patches remove the optional 'cfg' parameter from alternative
macros.

Use of the 'cfg' parameter is less clear than ifdeffery or IS_ENABLED()
checks, and also doesn't allow the compiler to elide asm() blocks when
'cfg' is not selected, so it's preferable to avoid it.

Mark.

Mark Rutland (2):
  arm64: mte-kasan: Use IS_ENABLED() rather than ALTERNATIVE() 'cfg'
    parameter
  arm64: alternative: Remove 'cfg' parameter

 arch/arm64/include/asm/alternative-macros.h | 30 +++++++--------------
 arch/arm64/include/asm/mte-kasan.h          | 10 ++++---
 2 files changed, 16 insertions(+), 24 deletions(-)

-- 
2.30.2



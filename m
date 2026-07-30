Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F338FC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yU0WzbY4WfMch0AB2KU35VjgA1kUcdsd454/INoTRaY=; b=vGV875WXp/VW2LBQQ9sVXRbUPh
	7EUkSj5SX8oLZXOkNRQqwnt8mDJbOdP5fvMPBzXJKGUlFdnNVhwNG8gBMSNLEhIBeYMDd3E4oyAUm
	A2yAXcyTE+7qaCClrMJsWA8ClUt2Hr+OWB+qp1eXAwu28+Igq0Ss5Z7G1q6X8fuzxXdZRQ7oX+fzy
	vMGlD2EIEglzyQPh/C6rd9vh98WGSGyiR6h20l5lfSFilgJBxuASNYaHePQK1XjlUS+eYCLtTyNj0
	DyGSbS1mECL1avE8WiCdywceTHDd3nlKv5tCIdiUCzM6SUdNL8BBpk5ALplVj/mOLB+ZWVxvssysA
	Q4IGNaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQmq-0000000AakA-3QJU;
	Thu, 30 Jul 2026 13:27:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQmp-0000000Aajq-0BdW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:26:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BCF0600B1;
	Thu, 30 Jul 2026 13:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30C41F000E9;
	Thu, 30 Jul 2026 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418018;
	bh=yU0WzbY4WfMch0AB2KU35VjgA1kUcdsd454/INoTRaY=;
	h=From:To:Cc:Subject:Date;
	b=HmkyRqfVYgaHm7/fMz9RwL8Ca6ETpwm7KapTv6xElqHf0SnPq7/d5WinWPieiSIMF
	 IfCy+wbvBTrNwIaJAlRrp1IX3/LdgQ6SBPlP+HSPnMJou7yGQ0saV3u8YABC5f0g24
	 1fHjVS4Zm4nD4Jk8LAAsGA4XOEo6lM8jOvmcrPzSkBZO0HhQQC9Y9jl4yPJfWuVdvd
	 FeZ44xddXdhAMLl16XXE0Mgplc8LCMhYVOQ1d+Rp42omDnAmuSc35j/GCqyGjeDhjN
	 jzu8mGotfTbDuGM68I9xt4KHTTmrVkrfsoLqJYjrTRucmXsdnNNDGfz+xhfdcdjOOl
	 dzSDBXSybhtPw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 0/2] arm64: Fix handling of tracer updates to x0 on syscall entry
Date: Thu, 30 Jul 2026 14:26:49 +0100
Message-ID: <20260730132651.25993-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Hi all,

This is version 4 of the patch previously posted here:

v1: https://lore.kernel.org/r/20260714143600.23853-1-will@kernel.org
v2: https://lore.kernel.org/r/20260716120640.6590-1-will@kernel.org
v3: https://lore.kernel.org/r/20260717182758.17111-1-will@kernel.org

Changes since v3 include:

- Add an additional patch to pass orig_x0 as the first syscall argument
  for native tasks (Jinjie)
- Move WARN_ON_ONCE() after checking regs->syscallno (Sashiko)
- Add Tested-by from Jinjie.

Cheers,

Will

Cc: Kees Cook <kees@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>

--->8

Will Deacon (2):
  arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
  arm64: syscall: Pass 'orig_x0' as first argument to native system call

 arch/arm64/include/asm/syscall_wrapper.h | 13 ++++--
 arch/arm64/kernel/ptrace.c               | 50 ++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 4 deletions(-)

-- 
2.55.0.508.g3f0d502094-goog



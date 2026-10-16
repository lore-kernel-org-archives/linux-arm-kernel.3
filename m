Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622EBCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Pen9walkmj2UUnJ1DEhqGl/5qPfXJdBufqm0wWBySg=; b=aUGXerkmRf61fI
	KG9XpEh0ISxwjCoQooviJkysKrY2mCGuuyppWRctu9xfetVRa55zPYJn4hAMTlrwg2l5UVFB8Bx1A
	3JpxEji2nTIKKq64P63DDBcLNljEo65Pm7mOjx6u00TvBRg8IaNe1Z6tuFj5HSy+tzW7aUJU/RAvE
	2NGkiHRAmWI84KHXSpSx2avrCfnHnsYlgRWg22wtdStV7Nn3l1/jD9FNrUt7iJWF9DaoD2WLntQkn
	cSp3km6ypV1YHAXWJtX+b+acRkQrYtFH3eyzoDWLt9aUT0vOzvInhimrKJ12sGWNqRr9ZhR7r1Exc
	LSKQKCrkZnUzRM3a++2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlA9-00000003T1A-0MrZ;
	Fri, 16 Oct 2026 16:52:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl9w-00000003SxJ-0TFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:51:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D8F71516;
	Fri, 16 Oct 2026 09:51:51 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AEE63F7B4;
	Fri, 16 Oct 2026 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169514; bh=2bABSb/41IED0X+wtS7K7nZ+vu7Otf6PIXSlBZEEins=;
	h=From:To:Cc:Subject:Date:From;
	b=iowByFxoLj6vwmFUpLsVXl1bp4qeFWWFuI8oLQX6XuwgZepdj29x4yo75eADnbRhb
	 H7DD4IShYDKohRWiFbiJlDMknQM/W1nxNnOBZ/QYLkaH1E8yGg5JilHu/ubffCcOMM
	 M6IXsVGy9l0sDlVmu8iFCS7QHGMnTsmO694F05pA=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: insn: clean-up memory barrier generation
Date: Fri, 16 Oct 2026 17:51:38 +0100
Message-ID: <20261016165140.254791-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095156_229511_3F07DF30 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

This is a small follow-up from [0], taking Vladimir's comments into
account and going a bit further in cleaning-up DMB/DSB generation.

The first patch prepares for inlining and cleans-up the enum cases,
encoding the values directly and matching their numerical order.

The second patch inlines the barrier type check and the instruction
generation functions, allowing checking at compile time for invalid
barrier types (only non-deprecated types are allowed now) and safe
usage in alternative callbacks.

The "empty" switch-case statements with a default `BUILD_BUG` might
not be the best way to check for valid type, but I thought that
it might be a bit better than a three-/six-way && if, do let me know !

Thanks in advance,
Ada

[0]: https://lore.kernel.org/r/20260928133034.243541-1-ada.coupriediaz@arm.com 

Ada Couprie Diaz (2):
  arm64: insn: clean-up memory barrier types
  arm64: insn: make `aarch64_insn_gen_d{m,s}b()` alternative-safe

 arch/arm64/include/asm/insn.h | 68 +++++++++++++++++++++++++++--------
 arch/arm64/lib/insn.c         | 58 ------------------------------
 arch/arm64/net/bpf_jit.h      |  2 +-
 3 files changed, 55 insertions(+), 73 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DCCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xpx5CkQOHCvHAQgf9MC8TlaowIIcEO9NSXgbyaUUgM=; b=wrQhICofsQhZZeVfLcquiP7qDx
	pFtgulfp66TiYY6cxygouMPSChxR2LMOqxcXkV5f82BfLVH/0CPXscO+zrh3m3hOm0D+PdqJbmMGO
	NIj5fA6C3O9sWtvpyU2x7pGBSDGqC8L1b0VbGsDnB9U+B/FCEMgNKbJxQ3ZL5Ks/8X0Vpwn2zGt5G
	PreTjGfdKAVz02LX06PVH/bq4a4SKFYwGbt//XTEOY+U0aXAFmFQy7RETwZq+h5ZnQXsrz3vRkRrv
	ITUPr7K7V+Pr0zgFajZP7/+QbxWZbnlYOKOFoYJioDCmEAoYNvOiBIwwRd8SvBnuzPIFh7ByZvKs2
	JSqpo7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QAy-00000005FK8-2BuN;
	Thu, 16 Oct 2025 15:46:00 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QAv-00000005FIZ-10P6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:45:58 +0000
Received: from x415ea.. (unknown [49.214.10.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id EB2C0315FB;
	Thu, 16 Oct 2025 23:45:30 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v3 0/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
Date: Thu, 16 Oct 2025 23:44:00 +0800
Message-ID: <20251016154401.35799-1-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827014113.5852-1-b10902118@ntu.edu.tw>
References: <20250827014113.5852-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_084557_419628_B5C31AFC 
X-CRM114-Status: UNSURE (   9.53  )
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

After revisiting my patches a few weeks later, I have some additional
thoughts:

  1. Keep arm32 ptrace as it. Legacy APIs only need critical bug fix.
  2. For arm64 ptrace, the patch is not only a fix for 32-bit tracee
     but also a refactor that removes partially set state, making logic
	 clearer and preventing similar bugs.

The patch can be tested with the code in my previous mail:
https://lore.kernel.org/all/0fd573cc044584f00976c410955ed486@ntu.edu.tw/
---

Changes in v3:
- Remove patches for arm32 and compat ptrace
- Rewrite commit message
- Reformat the arg of the added function

Changes in v2:
- Fix username

Bill Tsui (1):
  arm64: ptrace: fix hw_break_set() to set addr and ctrl together

 arch/arm64/kernel/ptrace.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

-- 
2.51.0



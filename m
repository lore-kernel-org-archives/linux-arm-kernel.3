Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E391C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTJsX1jtVnDI+OvvRD7o4sxeNWkh0roTAn58RnhJfFU=; b=OV5KSIfqiSoE2vS3wrh0E1IBW0
	O1wKakPaIvTwgt0HFjR0nLE+n+uw/Z9rb1LVwelkHrUXiQm/01nq68sd0WMxCLNVNfzjp5CUojjy/
	AVRMF3OAPjYcgAfbtea48/jbNkG4+txsBhgzDR21c8nzK6NQCLwsUFGfQ/oUWupHl3isJ7WtKC3wK
	O22+uMyu0xkzKGa7pFr4xjq9tV/W34/KBzWDupC6zPeSEND29md6Z5ufyL2EIN3LlnoFW/RuxC+9y
	BPNnl0PX/PwRV4QMMdxvhFwZ92jcZ8ZC923OSsHEY9J86IdQEvlUPEMmhUx6uoaHF92Zpiu2OvwLl
	m0CGJnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Sj-00000007V6m-2eC2;
	Mon, 02 Jun 2025 13:44:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5QZ-00000007UuJ-1P8t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9672BA501F7;
	Mon,  2 Jun 2025 13:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A68BC4CEEB;
	Mon,  2 Jun 2025 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871730;
	bh=awCLTapDYtSLunhjJmur8jP9nvPrd0Ml3WwwNIr/xQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8trEMFFNU2PciE7wqR3jyQF70v8wlnypdjcFuhGrR50KHgO6yywiaxQOS/nsJAm4
	 DbZzlRsClJhuvI4iUurDptSom65I4dbTTFr24iyDs8T5/taK5yhTMBWH9tayQFCGBp
	 UVrj0VAo2BTjsbHNhNfL/BJCIUmTqraLmgWvRpS+/9gLi3jr2XdLSQkjJbapfUin4d
	 nsYaxu9Hn4qQDWwHa8ChbNDMUwtww5UuRFer7X+KUGZFVccIEis1WsH6rKe5n0kZ+8
	 eZ97bkziJSMRQwSRmNo8IBSbdGvw9SE3XLLnvKiGipQ9+eURuWJ7atKF2I2Rc5yt2t
	 E4FfLPc9sWhdQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Date: Mon,  2 Jun 2025 14:42:02 +0100
Message-Id: <174886496430.2938723.8299701252646132199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
References: <20250529073507.2984959-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_064211_455609_198556A3 
X-CRM114-Status: UNSURE (   8.01  )
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

On Thu, 29 May 2025 09:35:08 +0200, Ard Biesheuvel wrote:
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Disable LLD linker ASSERT()s for the time being
      https://git.kernel.org/arm64/c/e21560b7d33c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


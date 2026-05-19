Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5576CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQmOvPos882hivcElru/VLZpdKXi2WDI4lUV3z38/qw=; b=k7zYGpFNxWtM5OoS/PqvSOFGxM
	lJsqD9Pw5ze2dLPp/RhCrwKCDSgSy9389gJQvLM2wOH+f6iFezBxTErnZA8OI10fl5WfR8zvmqU/6
	UtOCicbUzbmYR3IeLQyIsoh2l6zQ3LilkxIqfiXRuaKl4uQnCJKAbpBhjrioMVEmis0N1MUrq4TWN
	b1/Ytyw/vk0ppyZRMwGEWsYyLubOD2vI4q9+6FeSrqv10Gj85pe7bjNHMcqZJBl30ClfjLo/kdtLf
	LzHXpSYnvUuQXtsSrGEB7LnFuowF58Fkq5g8hrrIL0/pCgyFOT9cNFqL1vvlW3B7rzTLwhvJaQ2Sj
	2BTI2exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJV-000000021cw-2RcP;
	Tue, 19 May 2026 15:24:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIv-0000000218p-44Xl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0EC6021D;
	Tue, 19 May 2026 15:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE9AC2BCB3;
	Tue, 19 May 2026 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204261;
	bh=g6wFFESjTSNXvwgWRPzOHxgpnotAl76JdKDkRbi+4R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWFjMppIquo3NagmRnyMy9vO9YkLJ8XlntsvQaJ0TA65U7XJY17dfQEvJMIK7DYiI
	 Kt7IE9gtQ+0w/dEnhXvSnX+j2Cm52HSDuOJOx9eZUueCQeDLmSoFE+/0ixgxFu0gwk
	 bL9R7Ka3NkwKe+2FV+Bt+ed0SLZO3HrOZPTf8uUuhUi9aFsMz9cadGBJqKMdfRJiMl
	 Xws10vXKsJ6/UdYoJyUd9LLjLrOFMEUomdONxfEd85FhvW5N6LjEjR1mn5Sd8bp+ET
	 DuMoWyCX9ql5BQSheWk1dRFqSJFKnnM98EuQ0xIZ4rba74EGF8p2gPT2k8JTRrjIae
	 sU4tmVfFf7j3A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated
Date: Tue, 19 May 2026 16:23:08 +0100
Message-ID: <177919003152.809113.14381397697687715929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326225755.50297-1-osama.abdelkader@gmail.com>
References: <20260326225755.50297-1-osama.abdelkader@gmail.com>
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

On Thu, 26 Mar 2026 23:57:52 +0100, Osama Abdelkader wrote:
> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
> from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
> consistently.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated
      https://git.kernel.org/arm64/c/7dc6922f7fdd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


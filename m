Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA6CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNbs7lMxJe0WpEfzvkFkz7bKbVbhuIqCKdgJ6nIjpBo=; b=mLdruLzgHZijH/UuI3x4Y/SKEH
	sIdxQYQvW+dy81Z1i/3MdiJKfO6QD0JJamPUw3V3iFakMrxph0VxFF4S1cwV67vkcP2zB8c8fsrtM
	j8ZOMnkHc8z2H5os47DKfI2TbPD/t2VNOBy1l4dD03N1XVNk8CX1fIs50fAS0h/2LvT6yh4HeWQ/5
	zGsEB9jQJG9UX9LyKNG/CR74JIHaY5Qexg3L5HQlKWNwX2fi2lkABuRoEGkefb1fPRd7xmMvJiVqT
	vyMXiPk1SXOid0cPSF1+JWdPk66XF5ZXbtEa87wEdMobAcXWoL/sUzS1vaszOr4KFfS1ohewwOaOj
	NZ6ofyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cSW-0000000Ek4o-4BQQ;
	Wed, 23 Oct 2024 14:35:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cPR-0000000EiND-0mJn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 292C6A44F62;
	Wed, 23 Oct 2024 14:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3D3C4CEC6;
	Wed, 23 Oct 2024 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693944;
	bh=ps2pio6F3j0r+hhv1BZ70KY2snpn9xRXWVZg2U276Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J81qSgJFpjyeoc3DxQxBaFqXCkgX1c4Xnj6oaUPijsX5rIj8FTS6q9TnRIXOeMTkT
	 b+NyqCgXd8FDTY1mONqj891mJxVlDdX/XvsDrRlBBO9Nd3zWS6sK8jV6YLv57IrZuX
	 1ZPVhOrCa+IkVwWM5ocB+N8Vtdx/+96W7jMin90GRF7TSLeshHhD2KFonlebT01jJr
	 JkIbO83Cobkxa2iqRhOA6mcVZHI0U1ENg97wRFcTfzjD9399mfXtsecEDhUHFV0M+7
	 Uiv63HJGzqUfw9pYLL+DrbSxpwJWHXiyirq4CZWD4ios92cAyDvm6ArWKVIUgPXZST
	 HLk+su6TPbfNQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <Kevin.Brodsky@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	pcc@google.com,
	dawei.li@shingroup.cn,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 13/17] arm64: set POR_EL0 for kernel threads
Date: Wed, 23 Oct 2024 10:31:52 -0400
Message-ID: <20241023143202.2981992-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143202.2981992-1-sashal@kernel.org>
References: <20241023143202.2981992-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.114
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073225_358409_6039D5B4 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Joey Gouly <joey.gouly@arm.com>

[ Upstream commit e3e85271330b18f487ab3032ea9ca0601efeafaf ]

Restrict kernel threads to only have RWX overlays for pkey 0.  This matches
what arch/x86 does, by defaulting to a restrictive PKRU.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Kevin Brodsky <Kevin.Brodsky@arm.com>
Link: https://lore.kernel.org/r/20241001133618.1547996-2-joey.gouly@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 044a7d7f1f6ad..048fe09da8a07 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -399,6 +399,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+
+		if (system_supports_poe())
+			p->thread.por_el0 = POR_EL0_INIT;
 	}
 	p->thread.cpu_context.pc = (unsigned long)ret_from_fork;
 	p->thread.cpu_context.sp = (unsigned long)childregs;
-- 
2.43.0



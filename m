Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C555C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5NUTZqzAT7G0+cA0KfILXXBU9RYvduWxSGC6dcAEBs=; b=mQB/o56z1MbPJcNHiyE6lHtYdI
	JHRCSae6rvUWrbO9UsauQ3MfqbVVojRoi37xOn24VwzJe0/wGopv3Hx4jxONjZJ88mqVPC47jkyvS
	TX6XA52VlbK/GqSdUthgWfyPaKbXBeiWeeLqZWG/WaftdqCNJwO02LExgWzk3g1dWo8wQIkIHALh9
	cLfd7Ms96nD5eOp7PXjJhhpAwlk5c7Xd2afBNAvjPXOw2FTD/0p3spYIxv32hGT8s9fzGhp+xmmOt
	EnGXsXds+CUs2vymOV2HI3YsrBnTNRxrU+/phZQnL0YwYOM6S6TsuqPddAEEgYgLYm6C5LiIa3bW9
	0p5jOY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1kb-00000001PiW-2ydl;
	Tue, 25 Feb 2025 20:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Hf-00000001Jkl-0V96
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64950611CA;
	Tue, 25 Feb 2025 20:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168F4C4CEDD;
	Tue, 25 Feb 2025 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514322;
	bh=a0GeMkZG0232HfnLCqIvdoB14J+eWwO/Z0Wqyt65dDA=;
	h=From:To:Cc:Subject:Date:From;
	b=f3+h1D30cfKH+jGQC4JV8nWNgvMQL/Dk8nM7aZvgejiGNC3fsZ9/5lfjB4A6et7BK
	 CAOmumytdSYhtJyLWeekzDJ1hg+doGRppbJ733+McuPb9YgKrTqfdJ0Cyg6c1qIULR
	 RjHxrc1ynskTRGo4tVO0Q+G14l8i7jRLeqjeKbo05tmcRAMYhy8LlrG+q08aotgjmY
	 O1JlDh8ORGy9nShGYHOoX60TBVycwizDuU8F7WBRtS7dqopy54H+Fd/9OuAKDqJQ1F
	 LzJZ8934ULkUsQUYQmkWt600M2TgwNkCQM8FW4Xcrdhb8wHtxN/KqSzLTdMWfC/8Jp
	 CmjKrU+BywIHg==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: soc@linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: imx: mark imx53_suspend_sz as unused
Date: Tue, 25 Feb 2025 21:11:52 +0100
Message-Id: <20250225201157.4190864-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Unused 'static const' variables cause a warning when building with
W=1, and imx53_suspend_sz has a definition for this as an
alternative when CONFIG_SUSPEND is disabled:

    In file included from arch/arm/mach-imx/cpu.c:9:
    arch/arm/mach-imx/common.h:101:18: error: 'imx53_suspend_sz' defined but not used [-Werror=unused-const-variable=]

It's still referenced though, so mark it as __maybe_unused, so
the one user can address the dummy copy and other files that include
the header don't produce a warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index 13f3068e9845..45c1a2a7b35f 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -98,7 +98,7 @@ extern const u32 imx53_suspend_sz;
 void imx6_suspend(void __iomem *ocram_vbase);
 #else
 static inline void imx53_suspend(void __iomem *ocram_vbase) {}
-static const u32 imx53_suspend_sz;
+static __maybe_unused const u32 imx53_suspend_sz;
 static inline void imx6_suspend(void __iomem *ocram_vbase) {}
 #endif
 
-- 
2.39.5



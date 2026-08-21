Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF2C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJQLFYQ/9DV4mfTcY3iE82GbowXg8Ttd7PcFZlNn8es=; b=C+XTSlc8KaSkKAij+tPgNcg+CL
	nWV0v0gJtoJcSYkgHGIqySdyRRn6fb+jVz5YQb6KDVloNfQ4ZMno8oVBq30vi2RmOUxjXi1b5jM2t
	wn3Xl+OsTZKMmq77o53FgIdsPketLfzhvbmHGTxr/M4sdF5dAzGjiNHfMx6G8tMRQqfFdBBlzpibG
	SWTGr55kiDp/70cVz7OIiz4iYovlSAKXlx3mHzlKiDCiTippNEklNTiMR0zmWQkBZC+a5aUaPYI39
	VBYMPfKF9cutY5SqYsgkaaf72QH2u2no8YLnM3jf8Y3o5sZlMVVpHE7pUSE8JOIPIqJbf7BCvTB33
	uBRT5zuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzS-0000000Cplx-14GK;
	Fri, 21 Aug 2026 08:52:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzO-0000000Cpjm-0c91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:52:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A3F4190F;
	Fri, 21 Aug 2026 08:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224A11F00A3A;
	Fri, 21 Aug 2026 08:52:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:24 +0200
Message-ID: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239869.git.geert+renesas@glider.be>
References: <cover.1787239869.git.geert+renesas@glider.be>
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm/mach-versatile/spc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 7c3191aa3e12d1f3..d3f84819532fa498 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -522,7 +522,7 @@ static struct clk_ops clk_spc_ops = {
 
 static struct clk *ve_spc_clk_register(struct device *cpu_dev)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_spc *spc;
 
 	spc = kzalloc_obj(*spc);
-- 
2.43.0



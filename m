Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB78C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g0vJUB3V8/avEMxRIHS560d3hB5D5XG4pLYSX6AmdEc=; b=fu5XAuv6wkJFeC2kL2/jgCv+GU
	7vrDzpGBxZNI/LevogrysK6xTFDRgEkdVjx7UgYqo4jdk+/+x2XkAGJ0DeBLKb5N9i/OSJFaj1WY+
	HzemzTeFgozKEOoJwqZox1J/q+1EYQxf5Xz7CJIaY6ImGUSZFIn+F2lbZmDwIVha1Z1uQAk9YDi+l
	geilJDtnY0QMSQx7t4Gaz7T5scJ3rv/4uiJvzfW7FC18z13oyk/BlUxKx7RkJxeF1JYuK/uILjer/
	AFLwCAmd6XVSClSxaLQoc/R6j/W2NylST5zZnHKLM2sc4w9eeMK2PypbOTYVzjrsekcrJ984fRZc4
	6FpsSGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfEe-00000005cAA-3wqI;
	Sat, 10 May 2025 08:07:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf1X-00000005aLJ-2dWS;
	Sat, 10 May 2025 07:53:33 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 194F525F3D;
	Sat, 10 May 2025 09:53:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZGqBqejas4K; Sat, 10 May 2025 09:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746863604; bh=oJREma6J7hcfGwjgy7lv6qM1wLUpD8zhJ0GVqc+khVo=;
	h=From:To:Cc:Subject:Date;
	b=Zh74CPPyoh9D7+lMgkqcxGni/Ama8qPHgkp8CW+MExpCgEMsNOSSq3jguj6UXSYWS
	 +GoYIvBxE4/jSnPisVLioL85+YADSekcrJkBZnhZxhR+XdMSCbWLHcTD0nYhMvvs/K
	 8XkNsERLGrZiWogGnos3dEi4+tedx6iFBsCPEEFBq2F4/7uE88ijMSJAdWy4o6Bb0n
	 dFql4uNyHQnAIGgyQDNeZ1jKb+ayS7oItIULNv25AwJ4qa5VH7Q7XWXooXN04aBiyA
	 DVW9ZjDp2EYcJznABxckPHr4meR5pN9gRASxxXIw7syioHbpcC4759kLhCyT4iADKO
	 PRSSA3DIuankw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks
Date: Sat, 10 May 2025 07:52:49 +0000
Message-ID: <20250510075248.34006-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_005332_086298_39BF31D0 
X-CRM114-Status: UNSURE (   7.13  )
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

This corrects the type and suppresses sparse warnings about passing
plain integers as NULL pointer.

Fixes: 621ba4d9f6db ("clk: rockchip: Support MMC clocks in GRF region")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505100302.YVtB1zhF-lkp@intel.com/
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 43d7ed5c3418..805ab4a6f7e0 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -622,7 +622,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 			clk = rockchip_clk_register_mmc(
 				list->name,
 				list->parent_names, list->num_parents,
-				0,
+				NULL,
 				grf, list->muxdiv_offset,
 				list->div_shift
 			);
-- 
2.49.0



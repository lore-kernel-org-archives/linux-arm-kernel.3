Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA5E10F2863
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV6HUjseCDt48IBQKFxLTQpo9Weag8I5tNPEelamU4M=; b=SZn+ounjrZ4nA+UC63p9QD/Z/B
	IyQkIas6RjsH/a0/++t5RJ5INn/myHGltrHx3/7q4NiGghrPo6EoCumXHcp4phpf+iNhkP0/q1OnZ
	HZgfW1H0cG/wmoId5f9x0x1codhkCLR4MJ7UVBZVXDaXV1BnwUSuSYoVxMt0lq1Ssfzcoa/bHveSm
	aNGDLKjevEiCUqES7jBCnPDEUOJNhFUI2wyVTajGFHXCe1ztJ2qwY3t5hxRXcGdbNDpOM7OAtRHY4
	qcVHPHfVHtoJ4AFGWdGbU3JSDWpyeb7za/cGZ51LsMBBgVJ3BXW4jyt0P6F949uSase0gKmuWPxT1
	ZTYnHwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPv-00000007tX6-3ZHk;
	Fri, 27 Mar 2026 17:56:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPr-00000007tU5-08MJ;
	Fri, 27 Mar 2026 17:56:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D281960145;
	Fri, 27 Mar 2026 17:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D908CC4AF09;
	Fri, 27 Mar 2026 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634173;
	bh=vEdr7EPXzpO1kaiix0EvAxi+W/Op3ANhnxGGu30cNiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mXyJXV4g4qysYi+mmyLXrAxwK05bu9xhANdW1jwCIgQAlR9qmyUMqmzGNlKxNoeqh
	 gZYCDSJsvhZ87sUtZEJqodSbljBNVnrqQu2S/85TnkzrS2me6nCuKcOauew0A73QL3
	 uzRgVt0+tfMOObhQat8QM876gkW2jztdXVT8+HXZxr4cIXVtolQREv1E9QTAoKXBQG
	 Cl7JYACYUy0mg0wVoPwHl1nZORuhx3ICeQv8y3H3nv5sBH6qU0MNthWv59y2UYBmeM
	 9LZFuDZi0flPbuY98HdbSwtK3imPEuqLGmxGRhpBDvd3j2QF7QaAn5KF72p4svw2aJ
	 3ABIbWDMEzeYQ==
From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH v1 6/7] clocksource/drivers/rockchip: Add rockchip timer module support
Date: Fri, 27 Mar 2026 18:55:31 +0100
Message-ID: <20260327175533.3044-11-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327175533.3044-1-daniel.lezcano@kernel.org>
References: <20260327175533.3044-1-daniel.lezcano@kernel.org>
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

Now the TIMER_PDEV_DECLARE() allows the driver to be compiled as a
module. Add the MODULE_DESCRIPTION and the MODULE_LICENSE left for the
one converting the driver as a module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
---
 drivers/clocksource/timer-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-rockchip.c b/drivers/clocksource/timer-rockchip.c
index 486bbffba464..61433b295882 100644
--- a/drivers/clocksource/timer-rockchip.c
+++ b/drivers/clocksource/timer-rockchip.c
@@ -271,3 +271,5 @@ static const struct of_device_id rk_timer_match_table[] = {
 };
 
 TIMER_PDEV_DECLARE(rk_timer, rk_timer_probe, NULL, rk_timer_match_table);
+MODULE_DESCRIPTION("Rockchip timer driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0



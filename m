Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CFBC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 02:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IezcPm/w1H51NUj483GCchWdwy2v1RZMRZdYjbHqVB8=; b=lqMf+aG5og/G3daRbVX4l267PY
	owPQYsmffy2PJeCavPrybnWHAfrpBGbN4nlfT3XZxKogT5nzqqlT8AAXV4HNmKV2R83mw8CZCA76Y
	tb6kdOzPHOElXsgltQTe37EfaIAJNqD0wonXVaxVr+mYdY9hRnmNo03CYFsHNYbmtJFv6IosCugc6
	VISIWRna8J9u5ELt/wJkBeKTmEmHHHo7Rqa6VJEMZEIu25iY1vGCk9zCUr/8/zBm6g76Ewn8BV9rR
	rr4sFrMrcUP1b0mxfK7saCr44FgwfuXlfHcBjZ5HSSNrC3I10nZxXgI+PGjnjV6cCJ+vwVSBe/Y+3
	qn+jaQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKWS-0000000Fo9W-0xlc;
	Mon, 24 Aug 2026 02:34:52 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyKWP-0000000Fo9D-17Ib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 02:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ie
	zcPm/w1H51NUj483GCchWdwy2v1RZMRZdYjbHqVB8=; b=lS5Y+NJNfcgAJkixPh
	c97MnDBxNJbL+oo+nUiQ7s0bFubzBeRHO0t0exQli0vLy0TLwsF1TXCJC7Iub2kz
	c6xi8kOR2RBXanGhFPLWJXvoiQYQ/BMhXuxuPiO+1Ya6cm4cSf5bmeEj0yKlBcPI
	m1QMmmbwiclR5Lt/AVENFe+Ko=
Received: from DESKTOP-93MEKVV.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3_RevrYtq2x_PRA--.43442S2;
	Mon, 24 Aug 2026 10:34:25 +0800 (CST)
From: Li Dou <li8d6kernel@163.com>
To: maz@kernel.org
Cc: tglx@kernel.org,
	radu@rendec.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	li8d6kernel@163.com
Subject: [PATCH] irqchip/gic-v3: Remove the ISB between AP0Rn and AP1Rn
Date: Mon, 24 Aug 2026 10:34:03 +0800
Message-ID: <20260824023403.1312-1-li8d6kernel@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_RevrYtq2x_PRA--.43442S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1UXrykKw17Kw1DCFy8Krg_yoW3KFc_ur
	WjqFsxWFZ2k3yrK3ZFkrnrZryFvas5Wr93WF12yFn3J34xuw4xur17ZFy5Jan8WFs2qr97
	GFZ8ur1IvrW7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRi8n5tUUUUU==
X-Originating-IP: [39.144.104.151]
X-CM-SenderInfo: dolyvlxnhu0vro6rljoofrz/xtbC3BEVjWqLrbHRBQAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_193449_749971_5DE7D0E6 
X-CRM114-Status: UNSURE (   8.14  )
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

ARM GICv3 specification says(in section 4.8.4 "System register access to
the Active Priorities registers"):

	an ISB is not required between each write to ICC_AP0R<n>_EL1,
	Secure ICC_AP1R<n>_EL1, and Non-secure ICC_AP1R<n>_EL1.

It means we can use one ISB after resetting AP0Rn and AP1Rn for context
synchronization. So just remove the previous one.

Signed-off-by: Li Dou <li8d6kernel@163.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..3c48f46abb25 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1205,8 +1205,6 @@ static void gic_cpu_sys_reg_init(void)
 		case 4:
 			write_gicreg(0, ICC_AP0R0_EL1);
 		}
-
-		isb();
 	}
 
 	switch(pribits) {
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0174C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=94jHfimcyTGNj19eLctJr1PkAqW2p2qN6qE8gkytu9A=; b=2+3naaoIJvSsstsyuifgp53fF4
	P2QvsM/WY4XwDQ1+wbV02VB2co1SQTyXr0qPXyvAQ7oARalHO6PRl4MQXaIsymSZsqcPy7detbLr8
	lqrmjx96jO7RY97Wl3A3j8cHtCaONTjpN524YuPG9jkHDgGls+VipZKeJJakuFLRStM1M97l131TE
	dGCrQ1polOAht8nB5ZVKwvcfb+JXOxU4mZi6E3+KT7HwINtTBeXem0830oCz/4gMbZDqs1bUeZa4n
	eYmq/HpAQ0jtr18vAd3hGIJCaF2v5wiVZ9/HSIJnezO91Pc/QzDz9ZJqm3Hi6N3P90yDrHB0hsGUS
	1GfjZ44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x06CR-00000006WDR-3sYP;
	Fri, 28 Aug 2026 23:41:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x06CQ-00000006WDG-39Sy;
	Fri, 28 Aug 2026 23:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7869D602CC;
	Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BEDDC2BCF4;
	Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787960489;
	bh=szZYi1/PWtC6cof6wC853VNeZydNhRJNJ58cnUeVUBE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mp85lLzu34Yt7/wEigYFyn1/zS7sT2T0FaXc9D3+kjgsvPUiWPrp9fDzIUcVTRQHH
	 ZOKK4EnjLIy2Dipzg0ljg4aMSB7NG/c9G6U9ADHnXXZppm5Q0/m1bbVh+xeWoCFA+m
	 OnX4YvG8E1zP/YgWRlEa/3NV3VXtXv7lxamaf3N5mLNCMsi7WicygD8tNIlYiQelkR
	 1C2Ge/ljJQix7g73oxbeZLQNDIcCjhusR/m6xM4t2YZq15vc+qb554DRPw+iLt4EGZ
	 XkwmNuO2uzficgy/UGU8/1DHkyF0XOVh2XKp6zFykvxzEoaWIQaaKgN1O3jE7u5/9b
	 uDnVI8Heu8uJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1325AC61DBD;
	Fri, 28 Aug 2026 23:41:29 +0000 (UTC)
From: Johan Jonker via B4 Relay <devnull+jbx6244.gmail.com@kernel.org>
Date: Sat, 29 Aug 2026 01:40:57 +0200
Subject: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260829-cpu-v1-1-33dca576db92@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIgckmoC/x2Myw5AMBAAf0X2rAn19ivi0NZiD0p2EYn4d+U4m
 cncIMiEAm10A+NJQqsPkMYRuNn4CRUNgUEnukxq3Si3HcoVaW0HbGxeZRBKawSVZePd/LWLkR3
 5ExvjSNe/7/rneQFSUuj+bgAAAA==
To: Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?H=C3=BCseyin_BIYIK?= <boogiepop@gmx.com>, 
 Johan Jonker <jbx6244@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787960488; l=1108;
 i=jbx6244@gmail.com; s=20260824; h=from:subject:message-id;
 bh=Q4ZSXnEGPX/xMD0x0AdrlN53Gm6CKYRCS3MOUSLsunY=;
 b=Vw6eld+44Gh/khFTRVcv/sOa5YWLdfmEdWq01JtLn4DNUXt+gABYGzH9ZTyfxX2eCa+C2CNu0
 VDZe77oCt0WAimJY5KI+u9V3ya0gu5smP2WQO5UaK52asUC0kxxqc/7
X-Developer-Key: i=jbx6244@gmail.com; a=ed25519;
 pk=MK5Flx1ndjAF0uwXdNm8VvvoghD4KWCNd2hQE8QGyl0=
X-Endpoint-Received: by B4 Relay for jbx6244@gmail.com/20260824 with
 auth_id=971
X-Original-From: Johan Jonker <jbx6244@gmail.com>
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
Reply-To: jbx6244@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hüseyin BIYIK <boogiepop@gmx.com>

RK3066a CPU1 fails to come online. Fix by using
a similar mailbox construction as in use with
other Rockchip SoCs.

Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/mach-rockchip/platsmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index f659d894bfae..d7d080c29f3c 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	if (ret < 0)
 		return ret;
 
-	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9) {
+	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9 ||
+	    of_machine_is_compatible("rockchip,rk3066a")) {
 		/*
 		 * We communicate with the bootrom to active the cpus other
 		 * than cpu0, after a blob of initialize code, they will

---
base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
change-id: 20260829-cpu-c518bde9b473

Best regards,
-- 
Johan Jonker <jbx6244@gmail.com>




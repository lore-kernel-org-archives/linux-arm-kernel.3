Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE46CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rIDIZltg3crcgCV0pjwrdHEPWCIgUFdpcpIpUKsfzYk=; b=qwiZjxZs5+FNJCE/Y9+zlrXMlZ
	r596GLd4yNGNaCX2aM1pcX7HqYte6hpANoyVFuX3n0gIXPVP4ATOHrI/SfIVgfAVMF/1MZusEi8xs
	pGyuSizU0rtJJYN3hfCclXU7+IUZ/2KxeKzMkKnUZ47E0KBqBrpkwhrkPv0VsQbxKsmbFR0qa5PYE
	bQOLfkScq7dOUTgE/VvOJm0C8QEYxS6EwEzTTCW8Ld6pNBSm6uKKriEal/jTTwPCl9mwfbxhqQ+XL
	ppT3cVdK/RZNWxzoNul1/wIA6w+uO9JBc3eqvCXHTQ/F/cHzZp2VYpPxmYJMneTUO85neirLk28Cf
	EaEhjGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGDz-0000000C1MA-1XT1;
	Mon, 11 May 2026 02:18:27 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGDw-0000000C1Lc-3LhK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:18:26 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-12c19d23b19so6331047c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 19:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778465903; x=1779070703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rIDIZltg3crcgCV0pjwrdHEPWCIgUFdpcpIpUKsfzYk=;
        b=N3pZXJ7sj34QdGwyKD7xlZx2RC/DlA64KAHktnro6KBAygHdOu2Q8Zdg7G7YModkOz
         3QtCo/lEJRPxAeP6BLKi+H7X1NXAMo6MwQ8rlWgEht86HjNVfvbvyc3P0z56ksnr60rk
         ud9zjvn7EH66JXpk27R+DZBNES/Yt0EnyNFbI1mpR70i9408ejXaoU2mjk89MTVs2WYv
         L4kG0DBWjMrMiSnzK5x80UH4Fx9hVJbIlBejIjws+pg3Q3YzbmkFED5kGaEA9rVR5fUz
         GVxiA7csXjD2URpu01oUwFVaY9JyxdztUjtnJoQpGbXizsJoBHuPyiTLJHs/xtBKCped
         3iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778465903; x=1779070703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIDIZltg3crcgCV0pjwrdHEPWCIgUFdpcpIpUKsfzYk=;
        b=Wae6HnLufeDDdYwEoF2YPnqP74aTtLWtLT6Q2v1TUSAQ+WgsWmEiyYgkrbtYT58h7Z
         uXklPKXGjoKDPwRW0CDBk7Zd+mskCa6qP299NF6qvjj94QiQp60WS/yZ9fHGkHp0w10G
         KD99Fvyd/amAJ/1Ko20V8NVpMYrGCQVvvC3SfIoD2jwQiG3zIkTwFyfAb6MGuR+llu/p
         uQUY1c4ocJEwhOQ4WVYDsAFLDvQy0DNrXcnL+PtMchSWG7Q1gDOwWh2nAfOBPIy0gAPi
         QKsRTLzHSZ0MtXa3XWdfl4SMaJIIZpCZygt0qgIx7tLeGJ1bojiED60/UvAXup+3ZSd1
         fbxg==
X-Gm-Message-State: AOJu0Yw9vp4bNib4HT2sDgWICf2Zqk+iFL6x0W5xsMEsMb1jcfKdL+ZU
	xZxh7H/f/FoLur0dLFijXM+Oq/OtAFRLAuru7oT0fN/HKphRYD0E69sj2C7KhOjDf8k=
X-Gm-Gg: Acq92OHxiypz9fH0KPRhU+2Bmgl2/B70FoIuDMViKxO8GLbqNqyUzhcQeqjRf3i07vY
	Xp/ULNUeDgd4dNzcjpjcmKd9JlEiDSDINAGoqWQA3TUxtzw7YyRlQa60kw8yxi47yUTvzpXHESv
	Z0JMpv5p+L5yT4gypIEwoXkT8i4uMSjaEC5aO3+VqHEjQDKLA4zUYwoXTxV9mybp/Ykt+yv0Zk9
	/cHBGwySa/PVG0qB0x5WrGCbhLhu77eyeMLqjK4iXDTIuThe2GvIo8NZaMrPyUcihyV66IAkEib
	IWVKq6XWe0kCXWWBOzxRHhSUuTlsJCkghvT8rj6whVFhgLh+K6ixy0T+7l+A+x8LIwAdG2nWYUc
	78se9aBQLdivVOSOckQJ7g87/I7RaLFGjxHpXHgJo6YOEuo+r49qnGXeMeLGr0L4O74Gq3PBWyt
	eEVUfCZUb21M5sP1sTl0GdYGAWertDHeYclmjeSInqaG9RQGPf4cMXkZnI8sFCxaiKw/f1KsLUl
	foZOCXky9OSCmP86BH/DtNkTAePw149pAv11qhv5sFXaN2IsxWUrBPT0UiQQJr4bAAzMUzsv0H+
	h5nBiOMGecgxT5YH9w==
X-Received: by 2002:a05:7022:123:b0:128:d375:f1cc with SMTP id a92af1059eb24-1319cc11ecbmr10668636c88.12.1778465903419;
        Sun, 10 May 2026 19:18:23 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm15313599c88.4.2026.05.10.19.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:18:22 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jiri Bohac <jbohac@suse.cz>
Subject: [PATCH] ARM: move the only use of machine_desc.reboot_mode into mach-omap2
Date: Sun, 10 May 2026 19:18:00 -0700
Message-ID: <20260511021806.180107-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_191824_845475_3B7B06ED 
X-CRM114-Status: GOOD (  14.93  )
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

struct machine_desc defines a reboot_mode field which is only set by
mach-omap2. Simplify the code and make it more generic by moving the
code to set reboot_mode from arch/arm/kernel/setup.c into mach-omap2.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/mach/arch.h    | 1 -
 arch/arm/kernel/setup.c             | 3 ---
 arch/arm/mach-omap2/board-generic.c | 6 ------
 arch/arm/mach-omap2/io.c            | 7 +++++++
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/arch.h
index 2b18a258204d..d4688cd1f080 100644
--- a/arch/arm/include/asm/mach/arch.h
+++ b/arch/arm/include/asm/mach/arch.h
@@ -40,7 +40,6 @@ struct machine_desc {
 	unsigned char		reserve_lp0 :1;	/* never has lp0	*/
 	unsigned char		reserve_lp1 :1;	/* never has lp1	*/
 	unsigned char		reserve_lp2 :1;	/* never has lp2	*/
-	enum reboot_mode	reboot_mode;	/* default restart mode	*/
 	unsigned		l2c_aux_val;	/* L2 cache aux value	*/
 	unsigned		l2c_aux_mask;	/* L2 cache aux mask	*/
 	void			(*l2c_write_sec)(unsigned long, unsigned);
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada0..6430646a46bf 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1123,9 +1123,6 @@ void __init setup_arch(char **cmdline_p)
 	machine_name = mdesc->name;
 	dump_stack_set_arch_desc("%s", mdesc->name);
 
-	if (mdesc->reboot_mode != REBOOT_HARD)
-		reboot_mode = mdesc->reboot_mode;
-
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	/* populate cmd_line too for later use, preserving boot_command_line */
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
index 68e0baad2bbf..fde6ccb3df6e 100644
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -246,12 +246,6 @@ DT_MACHINE_START(AM33XX_DT, "Generic AM33XX (Flattened Device Tree)")
 	.init_time	= omap_init_time_of,
 	.dt_compat	= am33xx_boards_compat,
 	.restart	= am33xx_restart,
-	/*
-	 * Historically am33xx supported only REBOOT_WARM even though default
-	 * reboot_mode was REBOOT_COLD. Reflect legacy de-facto behaviour in
-	 * SYSFS.
-	 */
-	.reboot_mode	= REBOOT_WARM,
 MACHINE_END
 #endif
 
diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
index 14ec3f78000b..26a12d083dce 100644
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -15,6 +15,7 @@
  */
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/reboot.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/clk.h>
@@ -546,6 +547,12 @@ void __init ti816x_init_early(void)
 #ifdef CONFIG_SOC_AM33XX
 void __init am33xx_init_early(void)
 {
+	/*
+	 * Historically am33xx supported only REBOOT_WARM even though default
+	 * reboot_mode was REBOOT_COLD. Reflect legacy de-facto behaviour in
+	 * SYSFS.
+	 */
+	reboot_mode = REBOOT_WARM;
 	omap2_set_globals_tap(AM335X_CLASS,
 			      AM33XX_L4_WK_IO_ADDRESS(AM33XX_TAP_BASE));
 	omap2_control_base_init();
-- 
2.43.0



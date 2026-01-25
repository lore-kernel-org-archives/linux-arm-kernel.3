Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A67E63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SMSLQYEowKtlwGJNzDliYeP380wRJJQbMzQMW4MHwE=; b=TN49LGNW4wNVM1Q3KCxIEKxO4x
	n8U681DIwkdDE4WiykRoYvF2Gw4QBqu6kjIrptELF0W/7w0ZnNjxcqFHMPZunN0w9nd6pmYdP56+e
	jnedF8WdUIZNhQBKcno+VRKmTG2r+vez1IbfJc+mbK1VES4yiXIt4TEkNORjg6jXN+z5cVJLyre9u
	6fm8iCuEVmUp1j2T0xN+J1pDTfVH92DhsJ77stcuRZzkg3Ludg2kLksNDlYBqgizdNYZwbdcpSNlc
	mmofAi0Nl6MfZ+UHzxN9O2quVvefkHyqXBnF52yXTE+GctwC55XsxanF4FvLcQWIAC9Vlie8f07hP
	v89dcaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BH-0000000BKHW-16av;
	Sun, 25 Jan 2026 16:41:43 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BE-0000000BKFg-2SqL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29f102b013fso34590375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359300; x=1769964100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SMSLQYEowKtlwGJNzDliYeP380wRJJQbMzQMW4MHwE=;
        b=g1DM2tPkEtTH0S6C2zmzZ+QcCH2eUuiofNJVOOidqAZjm3USqlrHiFbsp8sxId/Tdo
         BhHmpaWKGHN3C0HFkppG0xRAsD6gKUUYgljlgQLKqPcfQYWjeVub4xpX3c8sfruNlZo4
         Kabtu+YuskzBQKgvd1KEnRPOnHbh8GLH/MaBbHkJyCyYHCt4X4SjEiGkuiBW1+bJMd7O
         nblDLv3DzO+rQ/JvMLzERWSGMzkax2ZVn7iXtly8C2oi24iJS4yST8hThOMa18D7ivXm
         IBD09furgkEaFNwAcimtoWSbu5bvAY+KwOuRPRxq2Op4coHIsVFv4KJF1Q2d9FFedwRu
         t08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359300; x=1769964100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SMSLQYEowKtlwGJNzDliYeP380wRJJQbMzQMW4MHwE=;
        b=j491tPfI37gSKQbQSeETO/qYQIhc+P3VC1Jh9b7rNVzfvmmjMQsQODaAghF1WpruSW
         p9CvSmAvg32Y7Lvsfm+k5M7l8rpYlSXuKjWS9R4atLc2DVAYti3+J1FnmarDTFBmPFYX
         Ai5XHwZypEjeQYXhSvVZUHiUOXiCe4XLgH1wWkZY7Vfemv0I8/e1ZlzhfEqpm9wQbumY
         xors+RJDnyRqRSafqRIiH/HR87JvkY17O1eDNN+SerVeHTE86tVtByaS2p5yJbjt7sh9
         PIKMwdlFo0CH7C5Rj/hX/kqfHDzTgO7mGO/opwTvuJamoKDIWHbZTf6iHZrNt5ASk+hD
         0qWw==
X-Gm-Message-State: AOJu0Yx+OuO8wDcCKFjC9rhidEtlUg3zgLIzKB1NeAQNAOZ3L94NGw/u
	aN2lzpYDHAb46uHMc36ok/5S/AyDQKaoTYlTSzyiCO85LP46ocPKmH5m
X-Gm-Gg: AZuq6aJx/g6xhrOSS9FfkEMcI0RMoiB3BCa6XDV4Svq74PEAHWvHJ4s83QkiF7n1M3k
	abfjW3j2Ls7tTawU2zmOW3wQddK7/pn/JsWc5R+/8UCCF0EJ2d8ykcV3fAYC0lUAdhufH2TiVbk
	VQ5xle2lGxtMJlFR4V+z57JPEg48lWch8eIeejSKqNH99a7nsTTsd471PYUjTGUigbCbWuYDY/j
	ZMoVlXkCMPIa3QqSRK9gMpfjQPEJVkWH/vXjYTXtnMQng22qiiVi+tpVWjALRj8vrd2FGfFKci0
	m2o3djizFICfzqFphQQcLZkKprRFceFirxkQjcnnRoRd3YgQZCY5cixRE7nDGYwm6oFBjPsC3Yh
	CzHAEtSV4HAXr6uuPktmbc9lUJiwp+cwuYYkQusXPd0ZrZPGyoHqE3wEHF+HYkDft8jVzKsrc2M
	+DBuvpgY147q0x+DWyd6ICrfZsZRB9s8w=
X-Received: by 2002:a17:902:e5d0:b0:295:425a:350e with SMTP id d9443c01a7336-2a845240123mr16709775ad.8.1769359299626;
        Sun, 25 Jan 2026 08:41:39 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:39 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 6/9] ARM: entry: add tick_nohz_user_enter_prepare() if CONFIG_GENERIC_ENTRY
Date: Mon, 26 Jan 2026 00:40:13 +0800
Message-ID: <20260125164016.331257-7-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084140_623649_0A6E0209 
X-CRM114-Status: GOOD (  11.32  )
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

Starting from commit 47b8ff194c1fd73d58dc ("entry: Explicitly flush
pending rcuog wakeup before last rescheduling point"), if
CONFIG_GENERIC_ENTRY is enabled, tick_nohz_user_enter_prepare() should
be called before returning to user.

As for now, CONFIG_GENERIC_ENTRY is not available on ARM, so this commit
will not change the vmlinux.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 60e5c250da88..5de345e9146f 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/linkage.h>
+#include <linux/tick.h>
 #include <linux/rseq_entry.h>
 #include <linux/irq-entry-common.h>
 #include <linux/kstack_erase.h>
@@ -14,6 +15,8 @@
 asmlinkage __section(".entry.text")
 void arm_exit_to_user_mode_no_work_pending(void)
 {
+	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))
+		tick_nohz_user_enter_prepare();
 	rseq_irqentry_exit_to_user_mode();
 	exit_to_user_mode();
 #ifdef CONFIG_KSTACK_ERASE
-- 
2.51.0



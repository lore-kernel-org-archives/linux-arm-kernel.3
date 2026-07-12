Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A463CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsBZuNbKBWzgjiOqQ12i1N0POi8kQELijizTKDd75sE=; b=NdpM+/iPaqasZLNk9evcCTYIPY
	Ee/hYECoM+GAhZqkHKzCkVttNR+OxMG0grgs92DBqj/cBfuq7In7E+7HpHNyW2MEurr2lhbTAjDTr
	O4APuTTbXBB9MBWlGpEZSk83oj2HzS67L3+DyqxoA+wF5ddjIrnUyI4Swg2t7OgYdIhD9pgLRmuKf
	imxL+yjFeX5EtNk2ubrrZsnHGb8svCRUod/LdIQbPUFSz21bLzpK9z3r6GFfcNs8I6EnV4l+g5DeC
	JTDd5vqgO+1xOxtSHTRB18cXUQBphx45MJqIFafN16We/cH0H5515ME/aDqliQ4pyuHu3VkJ9665V
	d7zsnuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIu-00000007L47-0NgO;
	Sun, 12 Jul 2026 10:20:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIp-00000007L1S-3nKj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:20:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1559884f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851649; x=1784456449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QsBZuNbKBWzgjiOqQ12i1N0POi8kQELijizTKDd75sE=;
        b=n7SX9niayn59/LhFtvtsCjkDKnuMvAwhrUchJxnSHualsdYylX21DPj9vwIX2CR3sD
         RwSbmx/0AYlTdQfcG+hxm/5vrP7c92IU+JGDEFwngNLZWyXq3TV2+PTiTZiWyUvGNzCN
         ZtC5MOJfvJq5OKzxIj9CwzFXtzlSBY99JmmSEH1Vk0G1es4Ka7cCLFViw5b+iGfk1HXT
         BtRRzYJ9BIIZ/xcYpIBEX9PsFxvjGzUooYS3oVYiQyvVfkm9vRFENOza35UTlx4ForGp
         Dx5lnnVGS4sZ1jx7o84+J4VloyiEoUnH66++Te/B+SF24cDs4Mt/+kzUyOF2QJxjwepx
         2bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851649; x=1784456449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsBZuNbKBWzgjiOqQ12i1N0POi8kQELijizTKDd75sE=;
        b=BpjADS4xRwh0Ax8L56xNR2LQJmtPUFJXdyHsVItGe4N4QyvC4/tpgcicdxygybBaq9
         KMoC6D3zx8G9nPajNyE8a2/U+J19hReJRAtRssOx6r6dnyZT333oNmrtnM9VB4gF2o8p
         ViKm7N9sQAgJx1qURU45kIBlWdgJQRCL4oTqnbED6yruXYsWsT9nuwQ6mtTM7KZuDFQU
         1owN4lZo0C+gUnIcM0fp2oNlob7jfxgnG+MSLk+wLfLDDNeE+0r3Mbrznmsm+KKZsr40
         UaJ+Sw880j+O48up5jlVd7opSSGWLh4kIU/7dFeqTBiG/FRPfGnDC7BjWBeIMyRRVkUx
         Z2oA==
X-Forwarded-Encrypted: i=1; AHgh+RomnLk7d95CVUJ1vNuIi6b7hLgv8VKF1o0IaZQanrtmtOklfX8AaMVv+2nM+cY6j3Bzo/sCrrbtl4xWwRT8QG3r@lists.infradead.org
X-Gm-Message-State: AOJu0YybquzYCTEfmj0XCA8D11qONlxi7fr+ch+gZhO5qNS6YiZN9CmX
	i/wwG2tI9+SZKT5M49XRfCDjA4URqYdCRFb/6gKdLXyQ+wuKrqZA/BktLytKiK1finE=
X-Gm-Gg: AfdE7cn8yDrkLdtCxBj8ihZVtAHT60wlq+ptT8ZfKc2KX0yVLmqO6SRaGevYPbJQCUI
	Syiiu7uZkyMSE9NXqnYqpdmbvvvP646Dw9Pzj0HCz7d5LvZO5/2B9T3PqS47qzjW1G+yL1QJH2m
	uJSZYrlHMHT6dYqvCJFN6MZHnGvP0+oRmFuGZh3tKokI6k/POetyOltVhBPURiG9+pLUabzD5h4
	7hvFckvfkfGfJPTAYwXYLHS1mAimAYYSRMnIXeB1IOH+s61tanUZlyKZ9CI+AiI0il3bVR+D2Up
	uW0rUOVwRNiSruoHzoo9Pl0NmuLeZCn0EyyVQO+ICcwe1nx0l+0z4G9YhYYEp5oqkyf7QXT1gB2
	iPyHTwSfZb/6ZgPB+hDsnU9xG+sfPqjDNNNvPtz73Wlmxzq7J5ybPuKgFHSDNtJDpohbxblQFGb
	aQGT/2bp1Bw927SAaFE1MkIplZQKfwoSF8Uz19RDoWkI2sc2WlimAGJguTUJGyLmgZWJdbB9Yr/
	MfgFfeExmAbh2LhqOOVLUTUgsoe
X-Received: by 2002:a05:6000:4713:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47f2dc863cdmr5646096f8f.11.1783851649453;
        Sun, 12 Jul 2026 03:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:48 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:32 +0100
Subject: [PATCH v3 1/6] printk: sysctl: use unsigned int for printk_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=2135;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=oSSXLP7Jw1rIzHEsyC+huk83PWweBjE2sp/igTikZ4M=;
 b=x8nBiQHIvIKnAVgonaWo+uUY7v5twNS6bzsYUhVo0lss1zOJ5+lit0Q0af5u1hiyoIPREE9jR
 atWY6ieG3qeCEcg54Bgrfwiek8JNG5zWx6/EqttQlWhO1E78dykv/4H
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032052_221906_F49D1661 
X-CRM114-Status: GOOD (  15.28  )
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

As the printk_delay sysctl represents a duration in milliseconds,
let's set its type to be unsigned int.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/printk.h | 2 +-
 kernel/printk/printk.c | 4 ++--
 kernel/printk/sysctl.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..ea52dc72b73b64898f82a0319b01c27323b18dee 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -188,7 +188,7 @@ extern int __printk_ratelimit(const char *func);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
 
-extern int printk_delay_msec;
+extern unsigned int printk_delay_msec;
 extern int dmesg_restrict;
 
 extern void wake_up_klogd(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a41e7df10c29939a2abb55462859..31aabdf8248cc39c54ee11685d4a37deac1c174c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2117,14 +2117,14 @@ static u8 *__printk_recursion_counter(void)
 		local_irq_restore(flags);		\
 	} while (0)
 
-int printk_delay_msec __read_mostly;
+unsigned int printk_delay_msec __read_mostly;
 
 static inline void printk_delay(int level)
 {
 	boot_delay_msec(level);
 
 	if (unlikely(printk_delay_msec)) {
-		int m = printk_delay_msec;
+		unsigned int m = printk_delay_msec;
 
 		while (m--) {
 			mdelay(1);
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e9c0865c42e4af9cb6458d4402c0a..56c3db63b3f8c6c5fddc4e4de1f41c6102f0f4b1 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -44,9 +44,9 @@ static const struct ctl_table printk_sysctls[] = {
 	{
 		.procname	= "printk_delay",
 		.data		= &printk_delay_msec,
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(unsigned int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
+		.proc_handler	= proc_douintvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= (void *)&ten_thousand,
 	},

-- 
2.34.1



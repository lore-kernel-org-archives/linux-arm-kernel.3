Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31055CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65QPkXlxoBn1znpFptZPvrSc/q4l7OLH3BDyCKXpuCk=; b=n4KyPu950LnBMiRHu2jnSifuYe
	B3KD+dlIUPIzQQEp8OYGFjMktDXdOgDS6usYY3c6Ay2pFVVrAfVp12Rjda+RafaEP5qO1yhNItKWC
	s6H6P4NL0ICTj6stJh4vQwQ7Fo7Wo2J+UTp+Xkvwmt5eq8EAceH9humlIt3FKHv0Dtcen6zT9mQ/K
	qbSrsF9NCgXNWHTOsytwl9IJPM1SbnPIvPG1i0FhwKJyhiSrMzi4CTieoT3+WiODt7ssz/4KQKX6d
	Zut6+w7PoTZaew3uYiMiGQzNvWVcusHNmU2FovDrMVBrIwH+ZchT2/hW6rgSr3SPk2wJ0LwSFCC7m
	5j/+AW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpQD-00000009wtV-0fEq;
	Sun, 31 May 2026 23:18:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPu-00000009wkh-0uj7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:18:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so104634555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269480; x=1780874280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65QPkXlxoBn1znpFptZPvrSc/q4l7OLH3BDyCKXpuCk=;
        b=Yt8lP49168NLPn7T3Ombpe4cndyrHUhyDzUDe30+UQrzr+pAMTf6YZ2/SAw/52J+7G
         27oN6BB7NKOsHQGVCNTZcAZLjy2UKLFYMNoHyQIjC7v7mmfKu+8mke4GmRdCyVo3jI1Z
         oZ+2B7wagFidnVeLBh13/W9OfwF6c3pGLr0tORA1LJ6oPuZ0mXbs+Wtj8QE7u3sYC783
         4TZxPGQyqrmJtei2ZjHAKKTrghH6yQUAUUjgDP1BUckjP7XaXuFiytfgqpCVGCt6vprs
         7SC3bDO/eQNQ0qNIjQUlDQ2kzb1nsThaqHMGdceuL5eVigJwyi2+g3Mql5qGXBJhC5U0
         aZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269480; x=1780874280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65QPkXlxoBn1znpFptZPvrSc/q4l7OLH3BDyCKXpuCk=;
        b=pdk+hnHZfEDOkByEajnq56S7y063Pqn+Q7J+tsLrmWs0sRiAPhfg90rGRZF7e4uRGD
         aQZTVtvyVSwUhGsVCbPa8raOhPBLDTvLv0u9/fNiC9Pl5TwQYUVxlMvyBuk75l5YPLWb
         mr7fVbpdXKPIPVe/BsS75JsS+3RRotEoAsv3MrLYstnU8qbdCOshS5djiueYFVB9UcmD
         GJNmLh7oqP3OxkpfFb6I6+85gGhz/MtcDb/b9i6/A+icM4uaDqieoRRxLHMKakQ2hD04
         5xQoXioFAGKDZuuASL+o2aTUJZGe+a94vzVs0+FiFkyv+RPbr38ph8ZnEY9yVgz89ifx
         txiA==
X-Forwarded-Encrypted: i=1; AFNElJ8bYymkhZdx7ygrgPdK4rBT9rQxqgL4ljiv71gvPghanghO1MDCfKz/Xcv15bDHYfvzQLrV3oZrTQlBY7g5hXnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7o47bJ8jd7B7fN4xz0F5m40ZykfP71a9aW8QCcfE48rV+xwbG
	gNQKb5FdfHuvj/weku5fudRX/fg06EPZ2iAhtVBIHDGOhdTWMuwZTcpXaizz+jf7kUQ=
X-Gm-Gg: Acq92OEhIAA7ppUQAqq33p4EyG3Ma8n0LQ+p6swd/iMfuMy2w3M15WXwoF676p8UoXF
	7//3fXEAEGAcMHV2zCOiAK3o2OjD81zDuLuaBVq+Osr0Ft7HNmeDngmNk8sfCcfQUorj7+KAs6v
	1ZYO7ljl5pILeJh4XS147N4UqLYiwIsSx0oU1cQk/MrUQyJkBg9Yu7bl5N8eVwGCRDZAjWlo2qw
	pNruOU/yGW2px5c6ADVbSp1G3AyB7HELhtDApt5mF4V1dfARu5JmSEmfBKTr0TvsxSl+dgM6r2B
	CImVzWnSOUclNazTooynot0TyYRZzJ8E/SDho9kULbT37dLFfG3Vp0j7FY8fz42hqes74/c6m5O
	Vwz7TegvfkOFFSxptvJPP6k6fCa3+TFCRXaHjdTC27yBYh8bO90UX6u0M/H7xKumXFP3rF0fYZv
	nmuZjmuHLirRUIW0iDBi18SET9BlEdXjIpA0nfjZB/4kYiUV1cQmEkOdyXUBFsN6sO9FROo2V2z
	4XpVCb8zfQ8/M6uW3AYYWnum1vjzqPtltQzdAsSyB+wxk3eLg==
X-Received: by 2002:a05:6000:22c7:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-45ef6b0d5f3mr16986293f8f.13.1780269480458;
        Sun, 31 May 2026 16:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:59 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:40 +0100
Subject: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
In-Reply-To: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=2336;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=J0TSqvvk90SLybR+T1e1sTTGdTS3luxuOAEJPWZwCwc=;
 b=pLwcIzM8QLMrQYFp9ysGPIsBLbpYGr/QADoMsXS4xYve0tkQyYj8MwL5lG38y/JRyr/+m7k7Z
 dt3xNPGzPvaCCrZVvkxNqE0SfFMxQgzlLTNRPTyqg/O1adefKaVGgEH
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_161802_283045_B97FFD0B 
X-CRM114-Status: GOOD (  13.19  )
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

boot_delay has been deprecated in favour of an extended printk_delay,
let's update kernel-parameters to reflect the addition of printk_delay
and the deprecation of boot_delay.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 37b618d176f1c499f457f0d8b5679c29ee7ab177..0d6987a54a4f62a952664512fc8ddb18c6e70f5b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -655,11 +655,19 @@ Kernel parameters
 			See Documentation/block/cmdline-partition.rst
 
 	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if GENERIC_CALIBRATE_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+
+			This will soon be deprecated, please use printk_delay
+			instead.
 			Format: integer
 
 	bootconfig	[KNL,EARLY]
@@ -5483,6 +5491,19 @@ Kernel parameters
 	printk.time=	Show timing data prefixed to each printk message line
 			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
 
+	printk_delay=	[KNL,EARLY]
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+			Format: integer
+
 	proc_mem.force_override= [KNL]
 			Format: {always | ptrace | never}
 			Traditionally /proc/pid/mem allows memory permissions to be

-- 
2.34.1



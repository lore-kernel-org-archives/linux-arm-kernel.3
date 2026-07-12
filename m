Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13647C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=; b=h8HfzeZXd6mAe5nVftymHLYl5U
	gVA5AyIFtix8KC5mF9owHYdePMiiS6pIFQZ4TZNHbhO3qOncSQk+cUNYiC9Zd0lHC6S2AXXgSRdwc
	n5GO6gXxiCKKfZby7wlRxTl4ECcEOQiBAsRInWwhrW/NiakoXQJgcmNLXblMDt1laWtPeb6O/0eR4
	ORLLBMyrJR2v/VXJgSIXTW1hO/nhYIRs2R/fYqKZ/0SQinbdzepj8qt5Ggxt5/3JkJjwrrjTY6fld
	hMwmjbS9nGWtP5Ar/Rzpg0Olvca3H6IqQTz7oFdfC1Jvth88xTQBChw0eSAKClbFSSYPkqjP96+Tb
	7xqonZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJ5-00000007LCK-2O5z;
	Sun, 12 Jul 2026 10:21:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIx-00000007L5x-1cOg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:21:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1183052f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851658; x=1784456458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=DiGSLywN/SDD72EzeyN8Tz6Ux7rG5A/Pp2UO9mNfq7y1Xzk33v84fsZ+yrf2lKP0dT
         tN93AjCQcP8SbgHtP+xFIacP+Yy4q0VCKaACkCaHnG6gwAVa01lyK/3ow7L0zpcLQqYW
         jxA7zco/guTzkgVk/y3h0PcWOwj+8Z/+iMyQHgwE5aGbC61faBIcxsVdWhyk1Tzv8J/R
         NNzw+RbQGd6nGKiDVF1xeYcsO6TSRxte90Tx/rUFRgHvScYX2X8gYJOKc1IibzneWNmJ
         BexkVGoEzqEijXVWlW7mqTkGLGyi86JI9VGkq7/2puBAHoktsAUGuVy4feXagy5xB3dk
         tDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851658; x=1784456458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=c7z1ygQXKEuVB/x5tMeXxFB8amzYwxPQTIpQQ0XjxrBNyIiM6iLQ31CphsZEpOiw3c
         CuFJng5SBhXfgA/lg479g2Ad61xb7l81XwHFu8ir/TUBJD5NxJ4UBPIkQuJYGrZ/F2rg
         HZ+YoyFvb29qkAyeE9f8s20cn/dOWg6X+M+zHOYNbWQheJ2VKEONubMIF4xKbshYH7/e
         e1wbGMyF6d2y6QX905DBLwF1VHDtPVYLQ2kjk3HuKWpqi2vJw1Kim8LX8wGz3EwApbdu
         QXMrlulatFrhAGd3SSraxabWwppEmoBFoj/7I4VDu75sO1PFybdPG6RBRk4NC1Nf73s5
         3u2g==
X-Forwarded-Encrypted: i=1; AHgh+Rqjv1S8XUu2gWqyOMJzH9BvPhpdNookLZsAK0vguX+c//RZQmmfUZ44KPY0Kq/ODapUijLvbMKYnOXLAW/+pfSn@lists.infradead.org
X-Gm-Message-State: AOJu0YwoBI4J0/vkby/d9p2FyjXYGcdOooYCNYPZJTIrwH4wWm9882p8
	V6NLeC6WiPAgACUB1PWSdnm3muD6Kj3GgJAlvTKVFroBlcvFffz+OpBZ985IX00W4fA=
X-Gm-Gg: AfdE7cnYgsJZFIJFV3BPjnnKTpbd7I/ufQ5kNiqeNefG5uIvJVDIIJmWIp2nt46zl5t
	x2RhYreNLw+dfKTZSz32z+2KsQ3MwuOQII3I8axfyIKza0VI8+hcvtyGYtmNWwi8X7MMmBWU3ah
	+JO7z2XfjJUKjcqivdZ/L2F3UZnDvMBwuaTGBf7F3NpK9dkGcoqEx4ykuA8lN9h/7/TJzNuunxh
	YovdfPINWnag71SRuiWfnAhzxDvmAFzq5Rm3n+g+w7t3wBnL/l2V21dyIFbkkpXoM1Kt6mJybXl
	0LW3zF3cwqkehDe2Yc4d+O6Y5nAwHYDX9EYrFmYAEPi7ldVISQjr17lSnngOIyFmfryy+Vh36Gn
	ZOgNJ5+i5BahxDBHgOLPn1Jvj0ljZstvwvnm7oyrMsVRIUg4Mp9jZt+F2NSDZqtsHp9CZE0788m
	OE2BtbYO4fe5JuLy1k9Te6fD/iQFPb7H5Ftyqth/HrvCpH8FQMBVA5+tptmgZKVfsTS81vprLrC
	uXPFFdNyK8k63inH82NZQ1+QqamG83VRdE/lWU=
X-Received: by 2002:a05:6000:2011:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47f2dcd7487mr5749573f8f.30.1783851657812;
        Sun, 12 Jul 2026 03:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:57 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:37 +0100
Subject: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=2383;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
 b=d2X0BHuJ1CQWytJ0SAMIIKCGulICkuSxHkoRz5VTU3oDIwlYsespo8YnKmxdQHRuNbprslaM8
 uR4zOBiuOBHAxYnf8z9WGG4RYEgwLfDBxKehgKZ57nyiym/LudtIjxS
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032059_447407_4F2A05F9 
X-CRM114-Status: GOOD (  13.23  )
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

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -650,11 +650,19 @@ Kernel parameters
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
@@ -5468,6 +5476,19 @@ Kernel parameters
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
+			printk_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+			Format: integer
+
 	proc_mem.force_override= [KNL]
 			Format: {always | ptrace | never}
 			Traditionally /proc/pid/mem allows memory permissions to be

-- 
2.34.1



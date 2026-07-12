Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383D2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEbITgTEpDZxe5ZFo5f4LGGlEUTcfS1MEeyafnuEbDQ=; b=gbLQaViP3o8riSkUaRLtnM/0Ra
	VmKRCEcIi+iTrXV3KntELdy9T2ezZxALLzlGBgwiKRuHRIx0HIcG/S1eU/NgHGE1WjcN/iwACDVHN
	WObO598hsQJqC2PaOOcG2c5JBxBpeJ3e4F8lpkIOkfpHOaCTIA8k18BfsapQANKaOFKPqLiakbC5O
	1SfiirEqaCD1+KhxlCttv+0CIQk4pr3U3ipOtPN3zEdpnhYCBPKOl/PFxSTzdJ0bL1yfUfk4VsB+K
	Z1nz/dUZ80tw1OU6ChB7CjZlIuHX9MACdPkWUcNguBHLQ3+oWNW2butkKbZymaxyySSliYNv4nCPU
	u201OZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIz-00000007L7Y-11ud;
	Sun, 12 Jul 2026 10:21:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIr-00000007L1T-1UYD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:20:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f36a122fdso365002f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851651; x=1784456451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEbITgTEpDZxe5ZFo5f4LGGlEUTcfS1MEeyafnuEbDQ=;
        b=Mf600w96ldYQDeCRV1Ojz0JrTIPTfG2wHXKLPQrMikm8/poVuzIBPdV0Rl8varxx8H
         ulyYdfmIpvmT7MOqwgdyj+3kS3wm435sDL1rjR4xDPT4oboKIgcNDbtS065ZFzuts+I0
         5uecd2i/ai12ESmTP10uscDJBIYAUDBwLj1v3mzg2BuGCG59Z5TqgmVIU0FQjboY6xvk
         A2AQyq7oYF79zEDrlq4gQbGUUj5EWtF8mzWJROMSMRrW0oikgO08RUstPca8QZFzGoHo
         IZXkEJMtu/0lXX6p2vPfWxQQNYGNAI+UpCHdprNbwXJEG0RhWwbJrA8+iPZd3cHx5/Yg
         MCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851651; x=1784456451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEbITgTEpDZxe5ZFo5f4LGGlEUTcfS1MEeyafnuEbDQ=;
        b=MXOLq5c2GwwmKY+ZKgcGsjwBlokfbdVKGflU1b280DZ4Vv3ruZL3PvMqrfXBmlq9GJ
         5NaJMu1sToRAKNRUS8LxnjSLllgxWpme1U24kbyDD3XBA/LDkHQJSoLeyIjkBYWpUdpV
         1P1TP0wXtauClqxpyaJVpN8hlwwlZip1TrfcK6yt6loC1x1IjvYvboZBGkWzgKy/S6La
         2g7XOUkWiNOLAIXjgNJQ6lbVjywlgndQ/FZBbjHglkQtQopkXKWKYPk5vSax4rbYxXzW
         g3V3B5pflXnWwEPQUxa159fTdI3ITsdi/8iGMs7UQYRNQq4w73Z3b54DZCgtAzT00UwA
         E5rw==
X-Forwarded-Encrypted: i=1; AHgh+Rov1TNdfpRyskbZfTd0spfD3zlUEqTInQdrl15pTnavTjuR9wUr8h68u1NtqsEUemuDYABNogCiScqOHm2Zg6qu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywokw3BuFFZ7OkjeGktePomSyk0jQ0JxFipZD3vWvnMQGsV4jkg
	RcGXkR6yIPwN4cIo5Lw83RUPrXJZgIWNQ9bGPCpvPXuGbgX+F4w6EIUBg0WOE0e72oc=
X-Gm-Gg: AfdE7cmLHp60vijtzV5g6U3hAMH521bh3PP9S+vqbmoM3ewneqInj5YlP8aPKZTKqQW
	5RY4TQBsHikqfY7K3C4ou92bCzLucpOb2K8ZxkH936LCd0l397K5QX+b1qAIJJVnQ+bs+OzXP2o
	1dQPyjTqOQLwc7Tx5lF4xlcLLMBlYAVsnb+8D77/h6j27+MzaUVONmyZvpueNWdlEYuZhlZX+3X
	Z1ediRww+KrJq/fNvKEZU9Uq29oAF1ocLKjAHFHZppIvqPDzuwap9q+zzIgjIT4L6khff0MArRN
	c18rNEaLE3UaTk9wSJBOOLtAnZ5CyU2GFzUIit/uU8hmFMBFw2SCmZpwwfa5gzvwWjYh5S8HfjK
	hKWNKSouYrRggVpjpcLPlyMZ7DWWAeJUBJylAz63YAH/Qpcv585+4b4ihOdcyQfMAMWizbQ+hst
	wzqFe4Nsp6jyy+6ZKQRAysmQVY/9jx6GbNsl5jh24IqH46egubIb0+R/vx8viLF8R60Yl/Skuwz
	duFdukzTkwSws6TfQSW9CbjNEO7
X-Received: by 2002:a05:6000:381:b0:47e:4b05:2c8c with SMTP id ffacd0b85a97d-47f2dcdf16bmr5941928f8f.15.1783851651388;
        Sun, 12 Jul 2026 03:20:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:33 +0100
Subject: [PATCH v3 2/6] printk: add bounds checking to boot_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-2-574547b8f71b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=1714;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=P9s4hcVnWj9tTnGZZIC8g3yyXZe0SBB5hWMsufMT864=;
 b=C56SsQSM0G9++0Mvl1+EFh/6zQ8sQqd4MLbaB/EJJ10czH+MgpAwpdrT0cTcbOODbk+gvOJLF
 SMn+wTwDPCqArrjFNrKnXgbvdRhIhXUkCVLxl10G3JpSuARaONX7gZ2
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032053_439896_0AD2CD12 
X-CRM114-Status: GOOD (  15.88  )
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

As the boot_delay kernel parameter represents a duration in
milliseconds, let's set its type to be unsigned int and add
bounds checking.

Please note that the existing pr_debug will only be displayed
when boot_delay is non-zero:

 pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
          "HZ: %d, loops_per_msec: %llu\n",
          printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 31aabdf8248cc39c54ee11685d4a37deac1c174c..8be562c9be277670ba3209ed1f810fc87175848a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,19 +1291,22 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_BOOT_PRINTK_DELAY
 
-static int boot_delay; /* msecs delay after each printk during bootup */
+static unsigned int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
 static int __init boot_delay_setup(char *str)
 {
 	unsigned long lpj;
+	int boot_delay_val;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
+	get_option(&str, &boot_delay_val);
+	if (boot_delay_val < 0 || boot_delay_val > 10 * 1000)
+		return 0;
+
+	boot_delay = (unsigned int)boot_delay_val;
 
 	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
 		"HZ: %d, loops_per_msec: %llu\n",

-- 
2.34.1



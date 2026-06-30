Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0A4C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=; b=tYY+pN5L3W7SqCP5M8Q6wiE1tQ
	cBUeU70Sc3GD5mTivdwk9Qh8nABIfLfQVxfgHjpXnOg9P7yBRCcsoDvHJWWIb491TQvx0rdjjzyRA
	O+zAMvWL4b4/nG2BLb7XCDbiXHwaIVmT2hJKwKK2IyhSp2tHrYjNzAs8k1TKOpDQfgr+VOsYDiKF/
	x7zNMT3p0OrAp9MoS/CiLIPFbuxEEbzik7Z48jX48V7OjRpQCblhIol+zP9SaGdCHMT+7CNxXGKcu
	0V2mLscnrTDrrbwQ27/8ZCyGLTuBJicukVbHT41gDSFoDxvSPRYYNY+nOQ0+SkLYH5nTgwLLEHcVs
	yWIjSXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRo-0000000HTzu-240y;
	Tue, 30 Jun 2026 16:36:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRV-0000000HTpR-3Ye9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:36:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso29136555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837372; x=1783442172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=UtQWIA0cVyL+405mRNcedj6LmRn5jyPCVr3tqSxBYupASzTezX695Hn7A5gHnB3gni
         fPIJrTJgaR+Cv/aAc9ZUixSuch+yc58CtbT081kHHIE1rr9PTJtVUhZlKfQjBvBAtVBP
         xCSTjifsBEUBzFlqQCXsOj111IyShFsc4JSFwQNgHrkyPbgszSHgBQIpOagkHku/k5kk
         Syksqhk7/KQGZJ3wtszs5sSZWzSw2MYSK8BdJCEdPaZy8aQp97766gYwoJIWwq9eEYol
         1MQyLECiw6W03S44vp0mL40o/G1cod7xwxTH39pRW1dD9UaLAPUdA9gR3fPLbj+2vk+O
         LAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837372; x=1783442172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=LGaTKwQ+nFm/F6aSASmn3wXpAKWaUDY+7s4eZdG54fopOza7xvNPDe9YrGnThvQjTS
         QP0X0JZ99JXW0dk1r7G2FEd0Cf/Xj57tNQN4Kpz67S4XN6U5Ofd1sUC0v2OOJ2sraCvX
         YsQYZOvCrZpUABr3/mfE2GMJyObSq+jnxetw0ZHp/U24HuzKZnEAujXweBLjkoYb9jdE
         eX29Oeu6xj5vR8CkBsPK3ScdtMsRG2+oPX8h84ABuN5hUM3LW/k2e9ZERAEYgKbB3UvS
         5LNWpb9ddlUzN6KEYrsiWwyI27PhPWcUpOyhudWcyOcF78AOBMH+xJ4vDyV4zBBBIW6d
         j3Ig==
X-Forwarded-Encrypted: i=1; AFNElJ8mqOL45C5Bh0tThlNessgWFCc0Gm03FQh/J7Q+Yzgkip9ZXs/qj5kLgbGhMInP92p/gHyCrj27ZwXLyPHIndaA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxdmd03myP1BEQmsSXsScOOqMD9BR6RzmciUeoBbjjGgcX5+2/
	QYyX3fZ3LfaiE2xzuuYfgxiri+ANpGO/YxdLxtnXUFW7Fq3BBnlEdJ70NYB4N7tRfKE=
X-Gm-Gg: AfdE7ckadIs9GL4ovkfJlkVi9nW4Mw+sls0rmCEPcO3vMKUtKEVvovD6xdRtRWcW+Qe
	Lb+mi296uTbgsTZXlGf29GfFYRk7mDhF6EpQ7mWcXznLLcVmcqAF/000FV4XCyd67J7rKkhWnPC
	4LwNkuvg/IgejhPuSvbunVLeCPrHfL2wC8qgrEhkmG2TVs8uMdItsP1zpz9i/zWn+BfMSSUObST
	z6s9FgLlLb2SgkQ1rR1rCWqF3xZVgckfjyDutu/5dUTBy8XUnJYyI76eG6CSEg01VO5WelsyD/F
	qEwx5AOVGML1nEIJX7vuV0Gm53jN6dksgSevIn5pszCoGAgD15V/E5/iZ4WFiLursOpCCUpSgnK
	trqA5Fe1w0ssfR+p3rV468O6G4cuzH/H1JVybu7zAuJ7BP0XbqTziX4imGYd/Kvxrb4fEnrxI6o
	3hcZLM39TBG6s3RlLT45xqYRM9QY2Am2jUldntv19HDWDirZTc+KjVsyeRzCV1a0XHysRjrowIQ
	PMTPVIiahkIlUeG4yW8eHWBcwey
X-Received: by 2002:a05:600c:3b0a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493bc92bb20mr34808675e9.13.1782837371886;
        Tue, 30 Jun 2026 09:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:11 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:36:00 +0100
Subject: [PATCH v2 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-4-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
In-Reply-To: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
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
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=2383;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
 b=sOnrvPsO84DB97ORuTR1juL7r2Scn8EpMF3I6l/RvF7EoCDpqEEMlFajIZ/HKJT/YwxAr/2XU
 BP0Ae4MruK0CtpsU9u95RIYdHBzLEQVUODBhCas0gDrC1e6LVEiZTQM
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093613_915784_8F4FB326 
X-CRM114-Status: GOOD (  13.15  )
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



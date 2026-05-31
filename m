Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9C0CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jvVfxmpNQG/L7irzhFPgpD1+Jj3XJwtNjmfXwxZzw3k=; b=kTRdzEPY/G8kEf
	9IbNWmt/7rTuTzg0QdEPG+7RQmnMQwXSFk2m1QLclwB8ltkMr1jjLKUS1O9T3sRN3tSpiyHgsRb5y
	TtaPmnwwp1DOHq5rqkWcDaVepO5iEVFaUIU7p2JPjEy17ARN4Gt9CJGv4M5iJpkUMQiK9RQZVNjHv
	hIcBFkNBldpqlf5YLS10aG1YAatGQjCgvbU09l7kMOyAkAjm37GA7hBCXILhz8RrrDFvomwZcBwqE
	zfXyUxV8QIyI0DonpMeN02IvfnDEcvQSk8U4QjKSOd0rAasYUUx+HKOzZ7n2YZ6r369tqpPuPmOSO
	sEH7v1stRFNSHk9B1AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPr-00000009wjx-0mPh;
	Sun, 31 May 2026 23:17:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpPn-00000009wi3-21Pg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:17:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2559657f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269473; x=1780874273; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvVfxmpNQG/L7irzhFPgpD1+Jj3XJwtNjmfXwxZzw3k=;
        b=mPilKjdrlg20ZLyai3cLg1D4QIW1x+Es2VuhBremBaVAFNddTtqvhmgXznzUMUb+z4
         49ysXOtb4CzSvldMtdO6/qI7G8YSVvw+DRbEh3Wrb8iCuyGYCohT8BsOEuvtq+9tSrxS
         82n72BmF6gvTyMjTrnkznKVzcYjAdW9SIB0M6ZQH7VEyV1dmb9oZ1a9UA6tcm+sLYLlp
         CrIx9+xDbfAGcJW0vst5qbtPPIoeaeQaGtKb5GkJbV9NGQlK4o2GqpxrDio5A6IQSpbw
         2yAoxA8ZI4r/dRxfmRyyyKYC8BuVcL1heu6Ba6JEiaSDPWjLcYhRcFrCJSBHhJws85AO
         q7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269473; x=1780874273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvVfxmpNQG/L7irzhFPgpD1+Jj3XJwtNjmfXwxZzw3k=;
        b=W4fi75KpC15DpPPWVGHVuN0AwqgmgYvHUixD0JBDwRI0cPp48lfqIYRGxsYfZXh8Ol
         0DNUdzxI5FrVTrkLfXYzAw5hNoml2fBZLvKqPaJon1AW68HTnhxZsK6wXkj/aVU8sNIf
         Rl2ZT9A5Y1C3JEQh3NlkiC9hFLIghLy2R/6if36OLO/fQTQq4rBSM96Kp9S/oXwT5FLg
         WtOUZmqRaCSts32f/cfkiMuJeF1DSWRNUPITwoKTfMXCh6kqV0GyjZz4hM1iXxtWx3l8
         rUYUwdOTkXtmN7H1d2iWIIihsrz/ooAo7s0bMn4WtAM9tMmVu6jEia797phjzMnmTU/T
         uFDQ==
X-Forwarded-Encrypted: i=1; AFNElJ84aXruoWHgKN3SX4zUWqxu8ZL4UmvBCWk0oIuTTJ9SkMF5Lp603wlG7B120mao+hRdvZrFA/fJTfl1AvAJpD+s@lists.infradead.org
X-Gm-Message-State: AOJu0YyTT608SkQ6vqTU65cF6X7W7payBa6L2RZTFIN+lIJuXpEO4K38
	frAFKcoFGxHOy3lqDC07AqHNAi9HtbE8WPt4CPAA96sztZI+HCnehDC8jfz4qhy3LdA=
X-Gm-Gg: Acq92OGtP7a29HKyCgOVLqzT9BAvrjLVxHsQS0oX4Q9OAXwTeNfRhkJrcQVVGcfue9U
	jaD04/4H2SGOsfBqeGKoiE2Bjd2QPWlb1XIqCvy5O8NP/s3ezn3koRug6rxsbAUN3c2StpYAmY8
	RYzpTMYMQPRWp2KZ+QW7k7osazoyopdLJapL1X74LQj/F11M9dbffBi/9S+WHqolYVSQ51SPlG9
	EUZLUDoy66/x8t7zRO+UhTIb5G/YYeJ3aQkW2bCDNnRAtIzGZi2eYkni13maVoxa0C3H0uM5efb
	NKRRXcAXr/HxSWxREenl9hNSsRDBHRi9n0YHSWFagcmEkwwxLRzYfWCXXP+/FECQrg5n3zA9bJt
	Lo+47Wxw/EyDXyKEbtBNKwrry2hx5Y/zRRS9d/HAM34g6iGm4dgIxTDHSSIBYw4E4gEogHVhDIg
	pKlQ7/70xiDpZZQJe3fjerhww0aiGsoTDQke5a+gzJHPiyb8XmFv2A4Vo6cEW5Lq/oyI0YwRiJ/
	jBykI3b8luM08IaJggbbmdIEorJu6D5i7Krw4Qz7AZEqeyO+Q==
X-Received: by 2002:a05:6000:22c7:b0:452:c246:ab69 with SMTP id ffacd0b85a97d-45ef6b19d61mr16050820f8f.13.1780269473022;
        Sun, 31 May 2026 16:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:52 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH RFC 0/4] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Mon, 01 Jun 2026 00:17:36 +0100
Message-Id: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHBHGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZTUgqLU5MSS1Pik/PyS+JTUnMRKXXMjU0OzlERjCxPTRCWgVqC
 StMwKsLHRSkFuzkqxtbUAVnWPGWsAAAA=
X-Change-ID: 20260515-deprecate_boot_delay-72516da3845a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=3561;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=P5OF0xm/mrka6NiH8mLXOVcDYW5VpWJ664tJff57hhw=;
 b=jd4BdPXOYhA5C3VuBpHOxuYvDhRxj3UK3/Zy+o2fPRXdYrjLtNEoXK00YciKDgId74ES5IXcP
 mZ0yIKI8+zZAjR7XEjXvu4nEGfHk/dmjZPVgChukvcpwwrhQBkk/QyX
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_161755_703660_A31F231B 
X-CRM114-Status: GOOD (  20.99  )
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

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay
sysctl are two distinct mechanisms for providing similar functionality
which add a delay prior to each printed printk message.

boot_delay provides a kernel parameter for delaying printk output from
kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
configurable only via sysctl and thus is only used post boot.

However, since the introduction of nbcon and the legacy printer thread
for PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk. Thus, any printk delay added by
boot_delay/printk_delay continues to slow down the calling process but
may not have any impact to the rate in which records are emited to the
console, especially for slow consoles.

To address these issues, let's deprecate boot_delay, extend printk_delay
to be useable from kernel start and ensure that delays occur at the point
where console messages are printed rather than queued.

Please note that this patchset results in delays occuring after a message
is printed rather than, as it is now, before.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
Please see the following related work for additional context:

- https://lore.kernel.org/all/20260503214214.3475670-1-rdunlap@infradead.org/
- https://lore.kernel.org/all/20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk/

I've marked this as RFC as I haven't performed sufficient testing on nbcon
and I'm keen for feedback on the delays added to nbcon...

nbcon_emit_next_record describes @wctxt->ctxt.backlog as an indicator of
pending records in the ringbuffer. This is then later used by nbcon_emit_one
where a comment suggests '[returns] True, when a record has been printed and
there are still pending records.'. It's callers then use this to determine
if they should continue around their loops for another attempt at printing.
However, backlog is the return value from printk_get_next_message, which
returns true if the requested record was obtained, rather than an indication
that there are additional records beyond the one about to be printed.

For this work, I needed to know if a message was printed to the console, as
far as I can tell, if nbcon_emit_next_record returns true, then it indicates
that it still has context, and if it does, then if backlog is false there were no
messages to print, if backlog was true then a message was either printed or
suppressed. Therefore I used wctxt.len to determine if the message was suppressed
or not as printk_get_next_message will not the length accordinly.

---
Andrew Murray (4):
      printk: remove BOOT_PRINTK_DELAY config option
      printk: deprecate boot_delay in favour of printk_delay
      printk: nbcon: move printk_delay to console emiting code
      Documentation/kernel-parameters: add/update printk_delay/boot_delay

 Documentation/admin-guide/kernel-parameters.txt | 31 ++++++++--
 arch/arm/configs/bcm2835_defconfig              |  1 -
 include/linux/printk.h                          |  4 ++
 kernel/printk/nbcon.c                           | 13 +++-
 kernel/printk/printk.c                          | 82 +++++++++++++++----------
 lib/Kconfig.debug                               | 18 ------
 6 files changed, 93 insertions(+), 56 deletions(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260515-deprecate_boot_delay-72516da3845a

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>



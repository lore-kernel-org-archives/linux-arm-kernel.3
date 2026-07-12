Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9087BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ywwed8aXxKxDBaWayLD+SS1tm8T4pSkCOY1Pvt2MpoE=; b=g0aAB4vY9iy4bG
	ia/Qg5aiyE5YVxffh5ZmJy0yeFLEYn1aicj1X6ki8Tf/1bFDck6tKiApiwz49M2xtxMGaf2EcDFOE
	gr5WeMlXEVNP7neVkEjl4piaPwKBf2ISe/GFIQStIpFSSqk5IuNSill36cDtZTA8ZQw7WcCaXGrFs
	D4kIyd9JroX8WGRgAFLrLSZWs4N6ARlNcsoXPlqpbEumrv8C+ISuMUTf1F/2KnQllhkeQ3yb2JWDN
	q+q/MNqzh9/D+NA8m0ys3d61yvm7lzGf5lA+Ibg6UKklQt7gQsyutXezXdKcw9OztfKVnHUZJ8WTU
	eEw/QwSwxP4OmY948hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIt-00000007L43-3wUT;
	Sun, 12 Jul 2026 10:20:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirIp-00000007L1Q-3l0L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:20:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b1710405so10309945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851649; x=1784456449; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ywwed8aXxKxDBaWayLD+SS1tm8T4pSkCOY1Pvt2MpoE=;
        b=XHVJ59rWdxiL4UBqcM3Uy4BfeYsasp2QamQeoZ2bzvTOa31sKNK5r5AYOEyzB7YDXG
         hU9jRfkREfbmNwo7mQa1WJiOgWtI+KSs+twBubvevvADcLp/YEPov4u205ta2BfkhZrD
         4nUFwkLDhYeL+Cv11yZi0CwG2SM7aaEtX7CzfBJ95UXHKdOWAIrH/1dBCQOCYsyK7+WO
         r/whTBadv81FPOActwPP6gZZTvgCL6l4M/BCjPjuPTHBcaNss+dYil903/XxON7SpbZp
         SDjnLusiTkF39lhir1Cc7eJXZZSKVcX4GGr+whoISQCt4zLb/0QWidUxvOZkR/lSsa21
         DRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851649; x=1784456449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ywwed8aXxKxDBaWayLD+SS1tm8T4pSkCOY1Pvt2MpoE=;
        b=ZQldm87uhg1ZA8lQ7ldNhSd2qG8Q05t6jqWyEi7/uo0Ftq1tIgr8vNNY26wMH71UE5
         Ito6EOFtGZg7YeJYnufp/Qg4fpCMg8q+X749BPKv06EpCdmMbChgixNRfYtaGg9KaX9n
         N/KALztayn7UuQ+Nb7/oIygF2hgiAv47sg1M/Dd5N9C0jeRwx9SCK7qIlEmvXRp+QZIu
         iZ32/um/2bEICGG2ubS7fIQW4jneLZ1sBkfTatTd9awjZXwn7UXg6v4f4G3Hq9A5FYXQ
         z1VMf8WWYtq/IB5ocpMZ4AyxkYXvxLP6DHMtL1gQPHndpGb94JWsLTMN3KR5sFySIGYB
         nAOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR71xTexWtadBs7eZ2KPuKvhY7E1AKwGZGrteNQXD1P9cp129Pa6YU0KlEl5bvvIOrALDChPJKxXedFyercrdk@lists.infradead.org
X-Gm-Message-State: AOJu0YyWx5uHCl0LjlIkDJMZkPvqcX56u5P4M2ITJvb+7oh0XbN6xDQY
	PoUf2+2jES8fEHIxpjY7D4PUtSmMhlrnpGTBVP7psaKOkuS8uwBuJKayeVv9Daj4P7c=
X-Gm-Gg: AfdE7ck1beyJC+JqrK4oHbqM+2wHZwE6CKVbrRE2UcEOw74ll5YDueqS7suADzsyvsZ
	7959qn9LmERR0OHycVyf5uKjFwFSMlT36qDV4UuL1PVEa+JXHQk1et5GNxZdRIRXX9ENOIWK1ak
	DkZ0ATLSQrmByr9jOXMcgzWBCcQ+KVqeMN0HlaQynNDno032tZ1MAcObB9q++wUsGzNlruCI3La
	gnWVwQ+ctkN0M6HghX6NUEbEPCm47O3x7tMOsdUR22NOia7QCJBr56UHvcUdLEfsy8t10AWYBic
	bZ3qYZ1bi2c2BA3g1KfkEbYpgmCLF27UkK3YJwUG1OgyQOv0RtWMzYheDS3BZ5tR6lxFPioP1qy
	KvkD+fYLjJu9li9YhEFOh0anUo42idmjPJRWVHDBjk1/hQ8EMGblI0aRm6ySLu93TL8l2+GoFy+
	iL8QZeyjGBAeHjGjFUqeR7uD6ttBNd+jPbw1t61r82755A4PNj3oydWsczB9SmVXh2v3KRBEkhG
	xjiZ6GXLsgh8nUpQPbIqMXZU7G3
X-Received: by 2002:a05:600c:1f8c:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493f881d4ccmr48601465e9.18.1783851648251;
        Sun, 12 Jul 2026 03:20:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:47 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH v3 0/6] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Sun, 12 Jul 2026 11:20:31 +0100
Message-Id: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9qU2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0ND3YKizLyS7OSc1MS80gLd5KRU47SURJNEo6RkJaCegqLUtMwKsHn
 RsbW1ALRrum9fAAAA
X-Change-ID: 20260711-printkcleanup-cbe3fda4a2bc
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851646; l=3962;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=vzlM7EoA2wD/+foNKgYBRvz+A43IRugN/JdsYUaKQFM=;
 b=bF8W11xQvYTcKEkkriis3zgtTbb/moYjtKbeXde77fUfMSPcaO0TSgfTBgtqaU4Yd4XNarMmO
 avwao487GhgA/PMdcW2Ebo1/U62rJoo2hk8Yon3qQ/lTvrrtg6O2v+B
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032052_216960_40AD30D5 
X-CRM114-Status: GOOD (  18.64  )
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

---
Changes in v1:
- Rebased onto v7.2-rc2
- Moved emitted field from nbcon_write_context to nbcon_context
- Fixed comparison of char field that used > operator
- Used unsigned int and bounds checking for printk/boot delay
- Moved delays prior to allowing handover
- Added additional information into commit messages
- Link to v2: https://lore.kernel.org/lkml/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk

Changes in v2:
- Rebased onto v7.2-rc1
- Correctly handle negative values for printk_delay_msec (patch 2)
- Add missing newline in pr_warn (patch 2)
- Improved patch descriptions for (patches 2 and 3)
- Use new emitted flag in nbcon_context/nbcon_write_context in place of backlog && wctxt.len checks (patch 3)
- Use unsigned char for unsafe_takeover field instead of bool in nbcon_write_context (patch 3)
- Move printk_delay_msec and printk_delay from printk.h to internal.h (patch 3)
- Revert regression added in v1 to __nbcon_atomic_flush_pending_con (patch 3)
- Move printk_delay later in console_emit_next_record ensuring delay is always after emit (across nbcon/legacy) (patch 3)
- Fixed typo in documentation s/boot_delay/printk_delay/g in printk_delay= section (patch 4)
- Link to v1: https://lore.kernel.org/r/20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk

---
Andrew Murray (6):
      printk: sysctl: use unsigned int for printk_delay
      printk: add bounds checking to boot_delay
      printk: remove BOOT_PRINTK_DELAY config option
      printk: deprecate boot_delay in favour of printk_delay
      printk: nbcon: move printk_delay to console emiting code
      Documentation/kernel-parameters: add/update printk_delay/boot_delay

 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++--
 arch/arm/configs/bcm2835_defconfig              |  1 -
 include/linux/console.h                         |  5 +-
 include/linux/printk.h                          |  1 -
 kernel/printk/internal.h                        |  6 ++
 kernel/printk/nbcon.c                           | 13 ++++
 kernel/printk/printk.c                          | 89 ++++++++++++++++---------
 kernel/printk/sysctl.c                          |  4 +-
 lib/Kconfig.debug                               | 18 -----
 9 files changed, 108 insertions(+), 60 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260711-printkcleanup-cbe3fda4a2bc

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>



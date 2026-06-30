Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF99C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KlOvwkoIjqQ3dyIBe+7i8C6OqBUbb4KmOF29Y6QRtEg=; b=b7Uksp4TJ9Vvl9
	KvaeYsJ+npYnlpt3sUydc1bBbaghYxI3X4IibuOd1J1fpdtEMZpk0bcBuGdUiqx+twP3nXu68u56k
	ioK+ROWojzqCvi7oxTvq1DiYaZwaRYnRkb5BiuPr/oo53qH7ciCmKgBCm/pzW0e4B5raAVeyODogu
	LFR+UCgag6jrOERGroHNYWZezlOmEnmZm1miU5mI4n9ITLNmdjGWx2nG7v62BfRBY8RPB26ce3Xj7
	bTTeqESArXTIGCSPKHeANcQcqil78v5BA3A6qQGBnAYEIs/eMZ7oPKpuN7+OYLDqk/LvJp8E0Wq23
	Y1EV/21n4NbgNbN+KXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRX-0000000HTrb-0lo6;
	Tue, 30 Jun 2026 16:36:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webRS-0000000HTo5-0MIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:36:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so29196835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837367; x=1783442167; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlOvwkoIjqQ3dyIBe+7i8C6OqBUbb4KmOF29Y6QRtEg=;
        b=EkVzLnF+yA8g4I3LOAQS4BN6ycqb1XLoFu+dZrqtCXHv4dISdaH4q5UEiYG+JcyjpK
         6P0We6/8UKWwR6gCLHKLDRofDtvzb8Ybo4KbS4gMoTK9DnH25EDZ+7LeJNGCpYTx2knR
         cRwtrz/XbsDEzY9i16XQOqsYA2ho9lF1HOC8WSwHpOHk/HTzILHqWrxI7TMOHbOcjg4D
         P2z82SORICJgk3m0QvBJf+xXcKdZYdi/7eStaCqKAcfHXb8hU3UfqKrK7pxZuWElUddB
         MoTMfkayaPpyKi835zQvJlTKcsq2ICtzVPGrJVeJr7wCO6kPmdkKcBhczyCiQqTpGtZ0
         /diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837367; x=1783442167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlOvwkoIjqQ3dyIBe+7i8C6OqBUbb4KmOF29Y6QRtEg=;
        b=s+fNFWdatroG6s2FZPxJywLSzr2WXbmKGcrS25vpjtq0AC9zz2p+8uFiThuLfGQENI
         Ht9eCnls92Znt/VtTQe/nJy4K4WJsHezo6tpskCh4o5z7ueyk/74rJeTccwQabodzrlw
         Ib79Ek9ChqFU8Awk9BO6J9ZHS3cg5D5tEl+znMzqR0hZEr+IlBjW2qjB2GuJqYj6glET
         anM452fFl0zTvTqy7ptD7TNvkHQMTxRc74D+1ZOwc53PjcMRNyIH+o9K0D0EaZjJIJjj
         /AiY3alhkMNk6dao8T+uiyRAXJcLeT7El/iUIZh16Z5TlEiRM+hmhiV3Pn3nR2ftoGbs
         3k7g==
X-Forwarded-Encrypted: i=1; AFNElJ+TeEKexfNHT8rmFORICmmjm4ror4AiCf6MSRWMrYyTRDvu+AYsSZySbINnwXH/343jF8ORIHPUQp744IXkIIR9@lists.infradead.org
X-Gm-Message-State: AOJu0YweXT7vSx++8RhCwz5PdSqWg+5QKwTzmy9PYtBYI0rYFS13yftl
	DqDF3UMd+U3IGpaxCcb5zVQsMcWpJJhl9rUAa6QTDe/AXsZHlFcg4n9n3poBtMoDeQNWGAlTUJE
	HnqQ/MA07Nw==
X-Gm-Gg: AfdE7cmNdLQUwgO388Tq1fUiRoX9cnS5kpLQYiLSucihOnPHxlNWfQDG2obexdAghRW
	CrG3mvB4ktqQpK5q0fdaDgCviWzddgj5XK+rqDHBiLowCRCOMaN6gkUpHCTGBPN70CLpSd92kBR
	2SWQRVelZm/WZtf9KGJvfDL3GQj7LLWa+5SqsRcxWvyPGLdCZOlIC36Vb29IbttBFk8zDlQo61x
	SRFB3DS4rFcFqsh80XY2Dph7d+eUcdBdV7ZsMuEvI+CqBf3uH+YoL0mTX6kUInqSzqnKUDbbWM7
	mn5z41tuOjuD2na3e99yVNuBNS/tS7mZK32z9AcFpnr6etV0KPbNxAFdnsvWkHImiOWVzbzokbd
	rP1nwlDtO2+r/WKoosvM7WAAlgcmTjDJdHZ2mElhAaPVT/Ar7+wUw6GQksil8c3TKMEEh7Q+vuc
	0AuNuJBl73PGoyuRIMii7BuhXqTuQnI8U4Iwv8PPJYna4UZiX49g2G2oLWXNZeobZzMPOPbOtHG
	744Ku5Wmc0iX7qSXP7gny90wIrb
X-Received: by 2002:a05:600c:c16e:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493bda41fc3mr20284025e9.11.1782837367139;
        Tue, 30 Jun 2026 09:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:06 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/4] printk: nbcon: deprecate boot_delay in favour of
 printk_delay
Date: Tue, 30 Jun 2026 17:35:56 +0100
Message-Id: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzwQ2oC/22NQQ6DIBREr2JYFwMoaLryHo0xFH71pw0YQFNjv
 Hup3Xb5JjNvdhIhIERyLXYSYMWI3mUQl4KYSbsRKNrMRDChmOSSWpgDGJ1guHufBgsvvdFGSK6
 srtpaapKnufLA96m99ZknjMmH7XxZ+Tf9CRXj/4Urp4yaqja8bXgttOrSBKP3dgY3LuhK48vlS
 frjOD4CEMX/wwAAAA==
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
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=3474;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=ySXKBmJ/U8bqVEuShkxwbboi3HlloriRk6YpRGniIko=;
 b=O86itWXgtpUvHd6jHgcUSDYONHr8uM4FtjVKgxr5nMaMcbfYVqTugJVOlYcUmoahEOOuQHZO+
 MNX9KPA/fAIAGn9TedwW6ewrNcoYK9JZHvG/qKvgLYQ/JtsDREPeuXO
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_093610_395730_F251077E 
X-CRM114-Status: GOOD (  16.90  )
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
- https://lore.kernel.org/r/20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk (v1)

---
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
Andrew Murray (4):
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
 kernel/printk/printk.c                          | 84 +++++++++++++++----------
 lib/Kconfig.debug                               | 18 ------
 8 files changed, 101 insertions(+), 58 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260515-deprecate_boot_delay-72516da3845a

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>



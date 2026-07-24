Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49709C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuZr0SzwEmaEHP8VYIwWfef2g2YTiEiEHZ6M99Shj8M=; b=ZiHsy8KJcNW3mdGwMcNqtT8Rb/
	Dc/4s+88A76eTMfppmr0f6AgHa8tyGEVm/RQbY6lYtfiqHxgWxziipAvUnKI33QSeUdi0ZoiM8LKt
	CUY+nezRY1z4fQi8JEnmD9vHwh6We5QBc4JIvQAZ985POpPGDt0dyMy1lU7b2R+gnktbnKr50Le1z
	kQjj08I4+dU0oChBFPv6EnlEG80soNmE7E5cUN9HT8UDOTn2MsoE8DGGrRXtJJ/DYyJXbWXFRv+VG
	+P9iJNC/BD0w/QxS/ZjSL2UHmK3K8CI0KyQVLJRbprh+kqscJVIIbAzKDhko9QTkNOmCfAcd9DP9Z
	6jRe9sCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNa5-0000000HGQc-1XSx;
	Fri, 24 Jul 2026 21:37:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNa2-0000000HGQ2-16QU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 21:37:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso5135575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929036; x=1785533836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuZr0SzwEmaEHP8VYIwWfef2g2YTiEiEHZ6M99Shj8M=;
        b=nmUQBDWQOm/gTnukbhkbPkAwoS+wExwedY0KUAuPSdYJx7RNanZg9R6kXCZvM+ZyFh
         UzAJ+BmlNHWWp0Jeeb90QCh4csm1/kFUcmNQqYENOQAl+bro6XTz/irUW88Zl9B3OP3H
         SZbgAtfWUX6LBMk+rtgC5zW7J360S5iHLfBqAfLAfqYMFVXV+ZJvx4qZW8v3tEEvUxcQ
         5vHH0N/m4795dEotqNuU3IU52vvbgUckq0A7utWnjHqqyM5d0rQJaksZzbnE88SDVjAt
         mh9cmMkoVWi1lEFa1O4RUfGXvUe9ZUkdA36J9v/xAhV27J4wtgQ7I/VE49E0pq2Jjz/s
         rfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929036; x=1785533836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuZr0SzwEmaEHP8VYIwWfef2g2YTiEiEHZ6M99Shj8M=;
        b=Pp7CQijt1ljXWresRrSaKtsRdE/ZKi/lYl1j10eHf2WktFONr8LReIte2u9Ldhs+n9
         4jwSW6JdsGhNSCIvA05N1ctG1gDt4upDOpjRWzYSfaeYG+YLBy4c7kP5kj5j02V9Xiuc
         AWKEhHOgkiU4uUGIc9AaV9Fy5vh45PiWaWBfteBgyZ/RHRgM8GKap4wIgQQo9A+ZJJ9V
         EIG92AH5JE0oHLvClpli9+Oj1ZooSVvvARlqmXr0Qu57+lCHzwkU6qU5MSwuIp+UDrm9
         Gb128YgizozjPlmnwLPcPcgtlDvCnpP8PWztKkJFW60ytv//4lBERGvz9q49yuNreYbS
         jTUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4idCaUqGPD1JsBZaKopeueccvPe6vFKTp7iv4fvl4ZUY3X5oljxBTx+Ht+lr7NGg+Yzfj0hIB26J5mL3MD5xX@lists.infradead.org
X-Gm-Message-State: AOJu0YwASTIorI3pGGiJKVHkUujAvlmsjY4Frz1iJzzqfUHO222et8x4
	3Ile0Ljs6xwXYqwFY9PS8BVJfuXbkMKVxVyjf4vjhtbKys3nBS8m17H6
X-Gm-Gg: AR+sD12EpikCwxruDHm5effUmwTA9NN1cnqFVNmxi767C/IOSQzswW4p8X0HoYsuUUK
	uXjKvRvwIXfc8dmh6phYMglRUtz4WUl9jRVStmR61llfa1e7g6HevVaNFiao40VzyfJYeO62Hwn
	p4VMauH27f1JeOGyXSOasfIqG82yTfTClS25qIrY32SB1qFxOUK1U+FWEX2CHIEshyxCe9UI46q
	9WE8hq69e0D+tkseUJk1rLy0G7t6xcSpzCynhDRvKJ6SsR5XflnLVVQIWfzcdCcVbnBhnKL6CzM
	Nt2sKQM/pOuUyRHBH28Ny86eoIZnKKBKlLjDtv34cfQjPWbDFBiGGz+txAMUcmbE2fFUmGehONP
	OHJJgM/EZOxhUSUL2rKGOkLUjF3dfAkdjcwuAkeOs0HmJ6gOlKvC4DlOco9N3h4LxDXf+Ef9LOa
	g6MMGFL/3p82g94GsoB9naS/XFpQwcMTpCosFrWKB5KM77l/cIjLRgpctM6dyvmFT4bHlabiUyk
	ee3drM5sIFfN1hD/c59qBqM4yvM8hRCAkB0DE/9qz6q9YwwlVhp4dKi9id8/+ns49flefxDZeBv
	t5oabvueBE3qo66Y4TW7QTL7
X-Received: by 2002:a05:600c:46cc:b0:495:5e86:4e11 with SMTP id 5b1f17b1804b1-496b57177d7mr363715e9.12.1784929036022;
        Fri, 24 Jul 2026 14:37:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae93-f301-cdd9-d5ea-080d-9131.310.pool.telefonica.de. [2a02:3100:ae93:f301:cdd9:d5ea:80d:9131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b499cc49sm20754015e9.9.2026.07.24.14.37.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Jul 2026 14:37:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: [PATCH v2 1/2] serial: amba-pl011: unprepare console clock on unregister
Date: Fri, 24 Jul 2026 23:33:47 +0200
Message-Id: <20260724213348.77418-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260724213348.77418-1-kmehltretter@gmail.com>
References: <20260724213348.77418-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_143718_323887_D3202731 
X-CRM114-Status: GOOD (  14.25  )
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

pl011_console_setup() calls clk_prepare() on the UART clock, but the
console provides no matching teardown, so the clock is never unprepared
when the console is unregistered -- via the sysfs "console" attribute or
a driver unbind. Each re-registration prepares the clock again, leaking
one prepare reference per cycle.

Even where preparing the clock has no hardware effect, the stale
reference leaves the clock framework's prepare count unbalanced. For
providers with prepare/unprepare operations or runtime-PM integration,
it may also retain resources after the console is unregistered.

Add a console .exit() callback that clk_unprepare()s the clock,
balancing the clk_prepare() in pl011_console_setup().

Fixes: 4b4851c65d92 ("clk: amba-pl011: convert to clk_prepare()/clk_unprepare()")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 8ed91e1da22b..1aa43994a3cd 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2552,6 +2552,15 @@ static int pl011_console_setup(struct console *co, char *options)
 	return uart_set_options(&uap->port, co, baud, parity, bits, flow);
 }
 
+static int pl011_console_exit(struct console *co)
+{
+	struct uart_amba_port *uap = amba_ports[co->index];
+
+	clk_unprepare(uap->clk);
+
+	return 0;
+}
+
 /**
  *	pl011_console_match - non-standard console matching
  *	@co:	  registering console
@@ -2705,6 +2714,7 @@ static struct console amba_console = {
 	.name		= "ttyAMA",
 	.device		= uart_console_device,
 	.setup		= pl011_console_setup,
+	.exit		= pl011_console_exit,
 	.match		= pl011_console_match,
 	.write_atomic	= pl011_console_write_atomic,
 	.write_thread	= pl011_console_write_thread,
-- 
2.53.0



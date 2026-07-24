Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOnGh4nCACqtC0cvfPaQrFlO41pTulyeZNkgwFh3MsI=; b=S2tOELxiFQBvagP8CO9jDah4o4
	pV7Sm1BHmjQam4PmFXdGp7hfr4yJ8TW7qR+ivwgGC1F6FDvRFLYfaJAJoswcjO1/Ou5tRFRoXF428
	3NAix9Ar5SWaGYYjdq8CV5AXHwH79qbcPBgNV2T4qN4FsRM4MTd+JJQt0KOrTPHsBqtLpQyjMaA48
	L/Qrv5MnpPV2wFqCx5nIRutynZl4mTFWUzJ6nK1m+1PgBD1wySeAbvF+4/xrTKI6Ic88MR4UknF1x
	ctFgbMzm3sxTdINwpO2BVQKutSZOycZpGoErgaadq5dPlhe9ZQOYa1hvPyzr9s9OdDAjY7H+wp9Vz
	LNgbaYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNWz-0000000HGID-0DaH;
	Fri, 24 Jul 2026 21:34:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNWw-0000000HGHt-1tKu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 21:34:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954dff6536so6426245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928844; x=1785533644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOnGh4nCACqtC0cvfPaQrFlO41pTulyeZNkgwFh3MsI=;
        b=Vjgu0G7/Oi62EDFXN3OzQGnQOZBV6MHCCqGZmt4XT0oeRZJG7oXAXvAqYwYE1dRj0c
         QjNL9ZLXV5eOo81EiNXS3T790ZCnZ+DzEfFWjnKq22X3ijozpAMRNiG5c6dLFAtMIQcH
         sE53dNHiWB5v8zyT5aeE2xlp+upn5KZNJBZ5j6Vi6dNQ8ldOfLNPITGFF5R1q3GsB2JA
         IOw+7h12usg8ivXgdZ0OHZGxMxmC4C8fUw5NLBpaBELjTRf2+YT1kDqkaM7nKROE0etk
         MSB+oCsw4FF9P0aPOVd+olYzs7bqmlWuzApRuF3AM0Pv3hPAN2VRMOi49gJG4KygZ401
         YcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928844; x=1785533644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOnGh4nCACqtC0cvfPaQrFlO41pTulyeZNkgwFh3MsI=;
        b=Vc6pNDBVmyZTOxtwZzgt1goflWVTR6K9wHX2gCs0zimvxFfEsPT33rn5tprGny9bBm
         Hv+GtI9/ZuLHZQGXw0DUI4AgAuWzheufVu3f7a7tBHY9E2S9iyGnpCQj6MzvLCExklD1
         DYRSIZa9s4ScrqNgMSs9EYoVC/h5PdaGNo4RXMUbU4DB/FfeuPLUpGdsIPs7ykAju5WW
         CKtdO5e3GVP0lUPFlNqNimScHDTPLI7jVNrYbMYfrtiF933AUZva9RnNXELEWtBNBiN7
         54BZ8J8md1jYwAO4fUJyQKbgUri9FB4ExA0I0jm75/LwpxXm7pnpe3ChffnDU2HskvbX
         hgWA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1zdu7UusV8tQTSzEhW6aVWV2iUEoSjdM+7yrzA+hf6JC40NlNRKlFzIrTfDAkmLui8EYKG3rYOS5KgSH8mDoC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4O5XcgIMs4MWuyssGsiZ4Hg/ExJaNpOzu2wi62MdyX3jBPP3W
	ozN0OUAQZz7MGa38ZJ2EC1Fu6URedxbozbSUUqGQP+/TDg8ZFptaUH2Q
X-Gm-Gg: AR+sD11flLz0fD8NHOkrE4InjiR9yzQZnQGLw94XX7tctTCw9GeHoPiPbDs5j7AQEhJ
	cWRQwNO+QFPdDxwD6kDMyT4lxItYV8N8zHO7UGZA/lUT5MX5o6CQrEhTWkZ4aDAfRriZryQmrY2
	JoU90s/4v4KNwQVuHNlZzhg7BRVnuDJ8fvnhkbiSwMO93ceuKq2i7qGKEvMwl6L/0ArYkOY9jhb
	SwUs4TmiiJc0ORc3lZYZGzZByh9d3aklNns2q5OODF8DymeREPur8YpCf7yif4Edrd/DS8il7sh
	3hV7bBV4Fdn3dhFoevbRKEWyeijF4kA7vxzgzEKKmDlW8ALcDfTSZTwM388aeLZYN0hs1ACBOoK
	tq1L8PwcqvMu4JGO1q5XVKnI9Bheooo/xdwRTN8r2vR37d1Ch5SWXIW3m0mgdL+5UUppukSn1+8
	cMvwN37PA9qZULxxdrta58BlfZeDAYiJ2FQMXd2ccTsjREkTjMABuGLYIvVNDT3dPuPYgAUAaZj
	q1I/5OysED1DC44YuX+atl7V7wKqO53Yv8NzwmJPiOhpA6LKrqIZ5RTdz5y8O0gqN17KrwgUDGj
	TJ63nbfmgEKW2g==
X-Received: by 2002:a05:600c:870c:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-496b56f9749mr527725e9.15.1784928844090;
        Fri, 24 Jul 2026 14:34:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae93-f301-cdd9-d5ea-080d-9131.310.pool.telefonica.de. [2a02:3100:ae93:f301:cdd9:d5ea:80d:9131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b499cc49sm20754015e9.9.2026.07.24.14.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Jul 2026 14:34:03 -0700 (PDT)
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
Subject: [PATCH v2 0/2] serial: amba-pl011: fix console clock lifetime
Date: Fri, 24 Jul 2026 23:33:46 +0200
Message-Id: <20260724213348.77418-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_143406_529813_FD30A418 
X-CRM114-Status: GOOD (  12.36  )
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

Patch 1 fixes an independent bug: pl011_console_setup() prepares the UART
clock but nothing releases it when the console is unregistered, so the
clock's prepare count leaks one reference per unregister. It adds the
missing console .exit() and stands on its own.

Patch 2 fixes a PREEMPT_RT failure: pl011_console_write_atomic() runs in
nbcon atomic context but calls clk_enable(), which under RT can acquire a
sleeping lock. It keeps the clock enabled while the console is available
for output and releases it in .exit(); it depends on patch 1.

Changes in v2:
- Add suspend/resume management for the persistent clock reference.
- Keep the reference for no_console_suspend and RX-wakeup ports.
- Document the platform-dependent power impact.

Patch 1 is unchanged.

Tested in QEMU on raspi1ap, raspi2b, and RealView ARMv6 SMP, and on arm64
virt under PREEMPT_RT. Actual s2idle suspend/resume (RTC-wake) dropped and
restored the PL011 clock reference, balanced across repeated cycles, while
wake-capable and no_console_suspend cases kept it enabled. Strict clock
checking found no access while stopped, and RX behaved as expected.
Toggling /sys/class/tty/ttyAMA0/console showed the prepare-count leak
without patch 1 and a balanced count with it.

Full-platform-sleep and actual RX-wakeup were not exercised.

Karl Mehltretter (2):
  serial: amba-pl011: unprepare console clock on unregister
  serial: amba-pl011: keep console clock enabled for atomic writes

 drivers/tty/serial/amba-pl011.c | 53 ++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 11 deletions(-)

-- 
2.53.0


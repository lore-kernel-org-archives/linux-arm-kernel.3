Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6140CCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlkwSWzoA5MLDYVrt4WEMA112MFvqLN16uXgQLSqhvM=; b=3ES8GNx9+2QbYHss4n39q//iEB
	ibbazrGXLewiLtheWqMkkXjnNUqIwx8QaLd2MRUCelJnuhaGLUYiPTZjIqnEngrQ/hxxqgxvuBDKC
	ejt4+1JT/O00wzrHXvsVBuirVHiUFY+m9AnxDzr753kAHaUWUZgeKCAyf3W9TZorEsy9VY4I5gbCJ
	cpTUp6D+EyyoqHWftYGhmxxw6fP3FyXZ6moCPi/TsGMv9Su+PPlH64EuI7kGa6A4kN8KBqnJeVQUO
	LgSK3Zg7wuKLMLSjYPSMd1UygUSwQAMndI3ojNnyVYMFmbz87OIDRJ1rPN8uIkYIjmnkuzlaQZdEw
	uqQMEG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkY2-00000003PJg-2URw;
	Fri, 16 Oct 2026 16:12:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkY0-00000003PJ6-0AX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:12:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-487049569b6so5075f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167162; x=1792771962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlkwSWzoA5MLDYVrt4WEMA112MFvqLN16uXgQLSqhvM=;
        b=d6RzWiAVVg4g1GvNS7WmzZdx99+ASbTcK1BvWoWcclE6lWHUhu63hXwOlaiYU5jjvy
         BUNXi/MpQorwV3gsm40h8Ho0IRV292fsrz9jFwViKUhLj0jB76uyQGjzf4e1g+kAVwwo
         6Z72gPaDMFWNHvexdJFwKG2zSSNUwWmeo/VltY0q5rXf2SJSs4p6TLaUgCF1bVWzF9Yq
         UlYnxc5rs5zAuHTmVzguBehxnAbF+wG/aOHIaYwfa3XuPEOJSvfiqnDaxg7q58E+re1a
         r82EGXin5oz+tfdihkGfcY1P2uYBUIlQFJGWXqN6v8SyC/VbuE7H8XatQ5a517j3hWnZ
         DpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167162; x=1792771962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlkwSWzoA5MLDYVrt4WEMA112MFvqLN16uXgQLSqhvM=;
        b=H18Gd1hKhkOvMFKgt1Npnj8yH5+x9+t5/laXW6OU5hekPj5eHfT1k35bE9jxQ/HmDp
         4Bkp2anDrhEIps9zUy8GufVNNfz5Ph6yURw7Hp0tc8h1vb85J2w7BguCQ9YSjud/O11t
         A7pWcBxa/oyJI8A6JAPGWPTXvhzB83SgiXXbEg/zF3mieFukV8fpW5CRlaJH8LjA0XZ2
         xy8lXdjJLu/W4FWmYMzGsTVimn1TEgsTSZqlrRpyWXZufTgl0clBLMZZLOWJzoazs4t0
         pF6iGXnEAtvKwd5Tx0dXPA+zmnGkH2zAq+t2KNSoU7UIwbVwV6twdke5zFQeyPx96vOM
         bMhg==
X-Forwarded-Encrypted: i=1; AKwUvBwjvdurvYVfnzKCD69zkP6Tu3hPs7h43OxKFslXVJvLajIkdh9W/4QHnS4M46X5MMaIzhwsvaoDPcR5eacumpZn@lists.infradead.org
X-Gm-Message-State: AFq9FYLPUojkpgeNUyMZb0My5sZcIfuSkn15Cz/uitcqFL02+a4npOJ2
	yR+KrodGN1A9C/7RVCCEYdwkiHyyXCg9dR07yFSQqMQCFdQVgBt+JJ6B
X-Gm-Gg: AYBFou3LH03DJFW6wEZ2bWpIHvnYVhq/RQCIh2hZs5mH5nMUZsnAPOEFrotodw0FkCD
	w56YtYPiZieU8pKdcdKUJsBfSxGRdgQ3env1z0HFge/kbf8bC3oE60O1Fu0J5OkC9q5+0xpw4gY
	Ejc545UcLQuWztOE3JNhx+o6ARFYQ0pSVcdryNT15oPreT0LtfSNwW4rn4keOX/yV6vjm0SEp3R
	JjCa8Sj4yDi9AtS9l0Z0CTOFptQrc061FKYPQNMqpZF9UX7d9ECzEilp4z9RsD/zQSKReD6SUAd
	faOkrCeZWJko6igXgOgM903/CW0BYjrESjwsqd2Tu50LbH5BO8TOEo32F/6m5UQYA4/plkXFSg4
	aGs5+JW0Vh8dLw0DqCqkGz5fTZbHWX3cv1y4M8FZsilxKonuE20g2EXxC/Qt5ZQ6MFJfuKx6TQS
	IsLam96ynAPTMsmlaWBn5PZ4JkeO3inNhAGDoxFkhijDOyDYNqycNQs1VAsM75W9hSkXlnIEkHN
	tnwy5+gFiap5onvL8MuAwHKC5kelUMDNTgbCSeeWBHfhKn/RWfWzBEkw3mhJXQFpEQjJyHldIip
	6a8Sb1TflrJRp+fsaoMRoBPNSvCnB+XDbHULjP1K5NZiJE9YmS91CSPcI3Fs1/PeuXzq+Otjg/G
	k3Q==
X-Received: by 2002:a05:6000:4eb:b0:48d:f02c:eb68 with SMTP id ffacd0b85a97d-48e07bc4e8emr74849f8f.10.1792167161609;
        Fri, 16 Oct 2026 09:12:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm6366339f8f.38.2026.10.16.09.12.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 09:12:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pwm: atmel: Fix prescaler for periods of 2^32 clock cycles or more
Date: Fri, 16 Oct 2026 18:12:21 +0200
Message-Id: <20261016161221.16553-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_091244_108941_2A5F9BF9 
X-CRM114-Status: GOOD (  20.13  )
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

atmel_pwm_calculate_cprd_and_pres() keeps the period in clock cycles in
an unsigned long long but derives the prescaler from fls(cycles). fls()
takes an unsigned int, so the upper 32 bits are ignored.

On controllers that the driver configures with a 32-bit period register
(SAM9X60, SAM9X7) a request of 2^32 clock cycles or more therefore gets
prescaler 0 and a truncated CPRD. The request succeeds and sysfs
reports the requested period.

On a SAM9X75 (PWM clock 266.67 MHz) this affects periods from about
16.1 s on. Requesting 20 s with a 10 s duty cycle

  # echo 2 > /sys/class/pwm/pwmchip0/export
  # echo 20000000000 > /sys/class/pwm/pwmchip0/pwm2/period
  # echo 10000000000 > /sys/class/pwm/pwmchip0/pwm2/duty_cycle
  # echo 1 > /sys/class/pwm/pwmchip0/pwm2/enable

programs CPRE=0, CPRD=0x3de4355c and CDTY=0x9ef21aae. The channel runs
with a period of 3.9 s, measured from the period end flag in PWM_ISR.
With this duty cycle CDTY is above CPRD, so the output stays inactive
and an LED on it stays dark.

Use fls64() so that the prescaler is derived from the full 64-bit
value. The driver then programs CPRE=1, CPRD=0x9ef21aae and
CDTY=0x4f790d57. The measured period is 20.0 s and the LED is on for
10 s of every 20 s.

Controllers configured with a 16-bit period register are unaffected
for all representable periods. Some oversized requests of 2^32 clock
cycles or more now fail with -EINVAL instead of being programmed with
truncated values. Clamping such requests to the maximum possible
configuration is a pre-existing issue best addressed when converting
the driver to the waveform API.

The truncation was not reachable when it was introduced. The period
was an unsigned int in nanoseconds then, which limits it to about
4.29 s. Commit a9d887dc1c60 ("pwm: Convert period and duty cycle to
u64") made longer periods possible.

Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Keep only the Fixes tag for the commit that exposed the bug (Uwe).
- Clarify the pre-existing handling of oversized requests (Uwe).
- Add Microchip's confirmation of the data sheet error.
- Rebase onto v7.3-rc7.
- No code changes from v1.

v1: https://lore.kernel.org/r/20261003083036.21584-1-kmehltretter@gmail.com/

Notes:
    Found while testing a Rust port of this driver on a SAM9X75 Curiosity
    board. The port uses a 64-bit fls. Its registers differed from the C
    driver for long periods.

    Tested on that board with a v7.3-rc5-based kernel built with clang
    22.1.8. PC20 was routed to PWM2 (peripheral function C) in a local
    device tree. The blue LED is on that pin.

    - Without the patch there are 23 period ends in 90 s, 3.88 s to 3.93 s
      apart. The LED stays dark.
    - With the patch the period ends are 19.98 s to 20.01 s apart. The LED
      is on for 10 s of every 20 s.

    The SAM9X60 and SAM9X7 data sheets describe the channel counter as
    16 bit. That does not match the hardware.

    - The 20.0 s result needs CPRD=0x9ef21aae. All 32 bits are used.
    - Commit 0285827d546d ("pwm: atmel: Add support for controllers with
      32 bit counters") says 32 bit.
    - Microchip's Harmony PWM example for this board programs
      CPRD=133333333.

    Microchip support has confirmed that the data sheets are incorrect and
    will be corrected.

 drivers/pwm/pwm-atmel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index 86918523d821..574020d90a3b 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -195,7 +195,7 @@ static int atmel_pwm_calculate_cprd_and_pres(struct pwm_chip *chip,
 	 * So for each bit the number of clock cycles is wider divide the input
 	 * clock frequency by two using pres and shift cprd accordingly.
 	 */
-	shift = fls(cycles) - atmel_pwm->data->cfg.period_bits;
+	shift = fls64(cycles) - atmel_pwm->data->cfg.period_bits;
 
 	if (shift > PWM_MAX_PRES) {
 		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)


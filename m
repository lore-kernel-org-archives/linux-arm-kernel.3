Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A45FCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5XQ8GeFAuXLkcxtw6tW3UD4HNYETCz+1QlyPsmJftWg=; b=rzvJfQ5SXSgU3QTgYFC+6LjWSs
	sdeRAD5cPYVTDweuQLZ/fdV64n9LvhStOgmnf+PzlHRoTX40ZuNPUwZcCwjmxki/42N0cBNmesERK
	VZmeQav7DOkHn3pLLGoeXgDrOnQpYpqm2ALri7hDGuBrKTtqa2l4rWYhwSI3wdv9NP+/+rECksyn3
	J0lZlTRFC2H7uzHfYSiJ7+Y37OytU3/KTgC+cgDSEAtqNij0uJ2+w+efudJfgUdZkTWsHZ2M50xpK
	1tdGOoi8kA7x3z7f18rV9p8aZbrXmCESQWTUYDRUI1N+88JNxpr8VJLSwx/t68vvxnzAxj9RBaQmg
	5M5t8lwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCv8z-0000000DB8y-42gt;
	Sat, 03 Oct 2026 08:30:59 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCv8x-0000000DB8Q-2J3t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 08:30:56 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso3917285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791016253; x=1791621053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XQ8GeFAuXLkcxtw6tW3UD4HNYETCz+1QlyPsmJftWg=;
        b=rI4INbwqlmUk1UYBhKZPvg8jKUjN/PNget3asUqgBa2mmy2FKG5uwAOxezjVJVXZBo
         9ZFEyU+pJmDBfo4slOA+rIkNUGYIpvTXwkQH6hnDshLsDcItla3FDQWznH03+oAcu6zk
         slQDEFRARechQNnkdOPKsQA05r7N6AJkT6YxJ7ctXlgWKQgxKpqBSesFh3mkary4lRq+
         x1qpEus4E07fYJWvfaN+UL8JcO531ts7YeyhXTvi8PICiIYUWH+/MCFkmhK9ed76USV0
         WRXeST4mLAXUFBfNjhm310f1D6bauHiPkelNoHHGxjc7sKX1xxWXbVp/pszgkLKjGqnC
         3toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791016253; x=1791621053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XQ8GeFAuXLkcxtw6tW3UD4HNYETCz+1QlyPsmJftWg=;
        b=gV9Z0DtYSOtyOTxC8JMi2dKORtuhhl+NHwNtxkNd38Qac83qWodod9nyg+pLWyY2mP
         ruTp1MtBd1VWKGR8sKycMKXqkYeJHz+b5/L6PmZ68QyW4MUvVjClX3gxLZkIqCZTE50u
         bzJ2QWC8ZSOOPfwFp4xvApS+ihIkx/r7EY90EOFLx8JLuEpXofo7k96E5hHDZxCLnAwx
         ThEm55cx90WtGm8ROFJGTnMw9L/eNKdqYKmf+aWkkHdsqWh8CaOtH2SQmw30d/vxvoiQ
         sQGNp2GisyU1ik6WX2fZEIxrRxLgejcc2bJlWKGAPzjzOfGVsOn2fDr0DgCUikcBuwiB
         k8Gg==
X-Forwarded-Encrypted: i=1; AKwUvBz2u8I1NahU0uSvgTOBeBz9z/dY7fn5p+T2Z60GFwiVEW52Lzpit5iZAyH7jCWT9UOdgrg3l5Ynkpvw0PfRX3OQ@lists.infradead.org
X-Gm-Message-State: AFuF++mIJMeSROZ5sIt5p5KMRfUc9TiDFpMmYgGd4Yxc+GAJr1xNw5kF
	PdlM8el3U8MGT8tAsjNSmTHO+zm9RpWmc5X4w51XFBDq4kFUr93XX0pn
X-Gm-Gg: AYBFou1SgFGbHvwWOX5J77kKNrK+CuC1LOfwyCs5k5BslsATnFCbbPuvNxIPruD+9dP
	KEq1QcdF5BXf/BtVjcz8q79ft9ukyvvQw50B57LrK8yUbD9+nxb2ES7QS8VhkHO6CWO++LnyRva
	1HLMm5CdAMWjxCVGwUeJtwsA9f1PGZ9/iNK7RdSSvlBhyCUd5T1fqKJnevZnvtSGqnHzNrVTH0Z
	b7VefS5mGwGsKA/gPTfFqeT+neCxOYPt8wRviPLKn7A6F82v2psrS58ZXBw25zK9PjJzyQoeayJ
	ZxTnZk1ctydkvAzUZtOgpQO8jfeerXlt9RmYVDr8dqcQuigvN9palCl0amfDHU7u9Cj/gQe/g13
	2H02VZr2pmVWQeUSG8maKKtbXqHZ45KYisaQJjwuBnMfFQPTa3+/39LHkp/m/0oInWftfZQ6r4b
	kf3ahXrZTAcyhaOjiSq0DeMZi+R/T2O4fOp6XPyEUwAJ92rNwGbJdkZganKXnziO1/uUt/yn/00
	+vHzcnur6IsnrsGBWY7pDG20a2UM6HVeYsgQRfrGAybL89UPZDYYf34+82+4HfQUUlC9+Lvd/rT
	AiUZV5SGmf+l2oxNCdG1ewrfGLEaqfiLgfjrKpJxlR/haEhwUHN3MyhHjZubykLkxC9HQIfPjm+
	ucQ==
X-Received: by 2002:a05:600c:46d0:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a0275a28d5mr90096835e9.25.1791016253327;
        Sat, 03 Oct 2026 01:30:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0304407d2sm102442715e9.0.2026.10.03.01.30.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 01:30:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: atmel: Fix prescaler for periods of 2^32 clock cycles or more
Date: Sat,  3 Oct 2026 10:30:35 +0200
Message-Id: <20261003083036.21584-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_013055_644580_EF72D770 
X-CRM114-Status: GOOD (  18.18  )
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
for all representable periods. Some out-of-range requests of 2^32 clock
cycles or more were accepted and programmed with truncated values. They
now fail with -EINVAL.

The truncation was not reachable when it was introduced. The period
was an unsigned int in nanoseconds then, which limits it to about
4.29 s. Commit a9d887dc1c60 ("pwm: Convert period and duty cycle to
u64") made longer periods possible.

Fixes: 2101c878f767 ("pwm: atmel: Replace loop in prescale calculation by ad-hoc calculation")
Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

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
    
    I will report the data sheet text to Microchip.

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

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.39.5 (Apple Git-154)



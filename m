Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB25BF483F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxYw5y0oMDbij9HIoXO4SjbrHQlZ4oAoi5+oWu+ZDXY=; b=TqQUhVjUJdMHkPlwsMiXhJ9Tsl
	KGZB03hByfSswKtIdp7vgLeipHpR/P0hYVu8OsOaunCpSQnI6fpd+8BN/Q58rRStw25VNYe6fQVyd
	0ZsrUZjYbtecfkKwBmYUhLa5Bg+MSlBHx9baKV2NXQW7VzAHQ/xD9mZ+Ia9Gnyw//YfASJopoDOzd
	rCAzJsKXh1SZdwYuU/RdeSIxxtskRxMPttV/nvuSaa5LC7eLJTwmm3U1GCEII4T4ArtXLDbovPUmg
	TKaTQegV+GeDU7VhD7MK1gtovy2BkwDSfAmQetoa86YNaOyGxlqvkyU4+Rq/Q5fi698OE9YaJ0bhh
	c3KmLlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mol-000000000r4-0kM7;
	Mon, 23 Mar 2026 21:28:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4moi-000000000qI-3SkA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:28:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-483ad568d68so6658325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774301286; x=1774906086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxYw5y0oMDbij9HIoXO4SjbrHQlZ4oAoi5+oWu+ZDXY=;
        b=jPZTA1usRixky235t89K2HiTITyDdnKfdF1GO6esHz8N5eklnqRPQ4a18fOdI5CnaI
         B5kN5aMP2U2jCXfWc1u/jvicnneSTGOzIlj1ZM17ttB5Us+6FgA0pkQZDTfhn/5RQq6m
         IHvN65VQV8qcNL9HbPyRWYZQgL0xVQPwHGfgyvGIp3KzkYI4LbeqYEBW5tSiFj49aR72
         uJGcOHWAvenN3D1rU4OmZ5YWjQBs3NM/KKpayffNG5IgTacFbUgvcjooCigZmO0UOdnN
         pr5Y1kz/AbeGST0/86REjhS9VkslgRw7xTFJll0iMyiMosGWTK7ILXjirxKK+3s71ZWM
         Ic7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301286; x=1774906086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxYw5y0oMDbij9HIoXO4SjbrHQlZ4oAoi5+oWu+ZDXY=;
        b=faMPeXRNIekCxwzmzzF5z5CXqaHra5ac58b1gZJJDrE3U47bOZ42FNQ8JRKmYXu/JV
         dZnr1RcNK8JZyGlNbRA4ZxRL/8E+VEnUZLQpnIJL452hyOb0Qa456dO2AzyZ+S9vC72k
         ZUC30CTrs+/+y4uzrFQr3dAVmYch2j9xOMEyqFxydqk9Ghyj5Qfi3j1EeCwHnLUByIg+
         Md7HH67dRyGwHv+ktaH2CCj1pBRNtHV74PEa9lwFT1zsEfAtam8ACK/ChdqlocqCJ8Us
         KryxX3jGTVuHYgDEBcQyJoc/Fp06fqoukHtIc7hF8yDvIzovGvKzHUp5hhadGEVqgS3b
         Zk2w==
X-Forwarded-Encrypted: i=1; AJvYcCWMJCH9abo1orwVaLRKKyP22kCTc8czIl4dsp5cmERB5kxm7HsNMefxURA04u0IQY12Fmo1BoLY3H5Rgja0qTJw@lists.infradead.org
X-Gm-Message-State: AOJu0YzrFJll6gq8MNDRbdnuiYoKstI+AE0c0emG4QwBDsYpA7j4NMwI
	3zAW3OWZeKXrfLT79QHUvkR6H1eaGmPeK9M3GfTa8BUhrB1D1K5P9kqpH5DmEA==
X-Gm-Gg: ATEYQzw7KS1UkCJeAFq/QWm9gBj5Hsnernrj6tP7zfSSFZ9CpYnhqrDvfOgB0U5PiUf
	z2dBk6d8IUrpyPXHIDl/MK64sUPwSH3HrLYoUQKvv9LtN217zq+jh5MTwN4Qqd6tDxyGNsZpize
	K5d48GTJvx3sxN0r0Xw0Pz0C01W/OWoBbGiCPqY1kthkJvglNZUnBquPsl7hfWifqI48giD55Cc
	VHm1KclNpnv+WRHeWiX79NyMZz8O6zjgk03TU2DqCDwFPpIbt8bVtuuwiKwR37N75jmJYMR/xWG
	ceFcCMMlroA/pSbQ7pKlrGpWha7aMDSdWboSpQieC+MnrEAd59V/entTKwgptWklHtQklJN/3s+
	hs+/9HqtKxNXFdle0x92oFhp1dlRBnBAAyTEkDgrwjBJ81A/bAFawAj1slYFfo7S622M2WPLujr
	oyGE6EPHS0CabiNQ7XSMeBYP16OFZDG7Z1wVKknh7QxtKisYJ/vc7UXowj9iHIpqZNxIjK9HRt/
	A==
X-Received: by 2002:a05:6000:702:b0:439:c122:4fe3 with SMTP id ffacd0b85a97d-43b64243dd2mr12046889f8f.1.1774301285791;
        Mon, 23 Mar 2026 14:28:05 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm33386975f8f.17.2026.03.23.14.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:28:05 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 0/3] crypto: atmel-sha204a - multiple RNG fixes
Date: Mon, 23 Mar 2026 21:27:52 +0000
Message-Id: <20260323212755.687342-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_142808_880658_83C94455 
X-CRM114-Status: GOOD (  10.85  )
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

When testing the RNG functionality on the Atmel SHA204a hardware, I
found the following issues: rngtest reported failures and hexdump
reveiled only the first 8 bytes out of 32 provided actually entropy.

Having a closer look into it, I found a (small) memory leak, missing
to free work_data, miss-reading of the count field into the entropy
fields and parts of the 32 random bytes staying 0 due to reading the
slow i2c device.

The series proposes fixes and how fixed functionality can be/was
verified. Executing rngtest afterward showed a decent result, due
to the i2c bus a bit slow.

All setups require selecting the Atmel-sha204a as active RNG.
$ cat /sys/class/misc/hw_random/rng_available
    3f104000.rng 1-0064 none

$ echo 1-0064 > /sys/class/misc/hw_random/rng_current

$ cat /sys/class/misc/hw_random/rng_current
    1-0064

Testing RNG properties currently shows problematic results:
$ rngtest < /dev/hwrng
    rngtest 2.6
    Copyright (c) 2004 by Henrique de Moraes Holschuh
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    rngtest: starting FIPS tests...
    rngtest: bits received from input: 1040032
    rngtest: FIPS 140-2 successes: 0
    rngtest: FIPS 140-2 failures: 52
    rngtest: FIPS 140-2(2001-10-10) Monobit: 52
    rngtest: FIPS 140-2(2001-10-10) Poker: 52
    rngtest: FIPS 140-2(2001-10-10) Runs: 52
    rngtest: FIPS 140-2(2001-10-10) Long run: 52
    rngtest: FIPS 140-2(2001-10-10) Continuous run: 52
    rngtest: input channel speed: (min=7.631; avg=7.804; max=7.827)Kibits/s
    rngtest: FIPS tests speed: (min=32.273; avg=32.701; max=33.056)Mibits/s
    rngtest: Program run time: 130177956 microseconds

---
Lothar Rubusch (3):
  crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
  crypto: atmel-sha204a - fix truncated 32-byte blocking read
  crypto: atmel-sha204a - fix non-blocking read logic

 drivers/crypto/atmel-sha204a.c | 61 ++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 21 deletions(-)


base-commit: 5c52607c43c397b79a9852ce33fc61de58c3645c
-- 
2.53.0



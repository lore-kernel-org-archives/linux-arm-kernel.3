Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73389FF60E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kgfma63aNvj8LoqZ/8WsKQp6E4V/1m+2J06vQ5c8LKw=; b=FsSkzx8nVs1TFtszlolFBBHURf
	p/YOPjncnkXeY2pyokiv8IvH8gDWOOnkondOfhWwlUfB1Y0G9tjXkGMTRfT2tm5bmixSVBNGcfw07
	3LzKKZE/rimwSKEI0jzt3ebR3qlpgkiUmkT18OVIGc7Iat5187b6B6uT1+m4McqOAM7qBqVNPZYha
	yp2/Mw20qcETn5YtOfS/V7kjoTkheq6kMPb+3xmbqptqJuLpsei6KpzX4zrnCsiyt8bexndBEyIix
	LKIm5oWXyn7amrtFbD8UzODj2ziWo8jbnlu2VLrJaXUv6B8fZH4qJXKci8jWma2DrJZU9p3f8UWc+
	WF7f/1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULg-0000000CZhN-3vBH;
	Tue, 31 Mar 2026 08:21:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ULe-0000000CZfq-3pzG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:21:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso6510095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774945277; x=1775550077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgfma63aNvj8LoqZ/8WsKQp6E4V/1m+2J06vQ5c8LKw=;
        b=l22UhoqWEaTvckuAo3EwRpb5Czlb3Qit4CTBLcwgvPwb5a+tBAdBt146C7A0afv2Uh
         BOwGntrF1tEiAcsSq40ZVeDo+DuoLmOP5+cEYn8VxoTzVDUcM1f2BtdVejaRUI+9as4a
         XiVB9QA+K9YK+H4eIOOAMC9KHY66jO/608cr3AUjHlMdW1n8XA+ByAUNexTmTm59qeFJ
         X7yWaR3xYKgMCfkmPyRwYdriHBWqwQDXJgGVgAviqiqSUwQLlJUsylDQ9c+WgI4M2TWq
         u2LNSgPS72vZiCgp7U7wCAIzbblUWDWXUEwyfgTtv+rQ5kEZdeq4yYAdtkE29D7IspiD
         tuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945277; x=1775550077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgfma63aNvj8LoqZ/8WsKQp6E4V/1m+2J06vQ5c8LKw=;
        b=HOEejORQUEjuD8o9N7/2uKpp2BAusThzS14J5RwiQatHITbNqL0RaOBKHMwlpXzZtz
         VnnBn2ZECsoGULLTljcnsSeXMoVxUiNwZ6fPOy+ZDspYt80rlxZE86Cf3bKpV47rW4rm
         vVAaQiN2XoaKlVB462HqJdBwojRnLe08ul5nAzwB3hmTe65yq3O9+keRLL5XNQbJYb39
         xln5V/ef7hxVKkHkZC3jqhDcfIFVjTs1Al/zwvSmx9zFMIf02gBbo8rWu1bh3xgwhWSq
         LZrnAIjOPpR7ib1ce+BmHI2MDUfo2vdfDytOdUv3EMcwPR3jJdONGhJdIV7WLysrDyCO
         0CMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfl/SNf0EEIMfZMkV7G6832nr49iVqYfiqPiuuLV0oy5Jsbvk3XWSBZ2RoKS+As+3nGsY497n6Jz7oQp/pPwgY@lists.infradead.org
X-Gm-Message-State: AOJu0YwZNCdaP0uDoJkztQpVhxtBX3W0o6xCjWgQsLx7ABchMbUJdg6T
	wvdbY2RGESWpqvL3ffJ7XjeABkuZ6a+cUJf634mZ+vABeXne8gXP5Yug
X-Gm-Gg: ATEYQzxe072lDg3MogX68P55HlTbbE/dtV5u6AthbkFnOSz2uEZO358qYd6wO2Zz37P
	2g4h6fCkH7p83l9t132cMM//bP0cQWQOfJc2+72othe9yq8lLNKJbd7qzOA2hvzXvK0jLgG/7hV
	ijk/QaN+oU2ECXahzEwU9rPLvDEN2EporHJuP5a9AQiDWoqSf70hDm0au/dzMz13oUo3HMuHPoQ
	zl3aKk1dw8qTQVMsX2IIExUbnt4TKWT0wrpR+4HqfVOYsDGAv9hhPDtpFuQWOSQNlUjXZkImLw2
	7XyZ03z8ffN9/FFoWJgLClLkJoKRGlcF8TabjWb0vrkXFvbR5tw94/+f36s1LW8cVSziWdGodTd
	/WDUmVY0UQlE21fN/FgeQd4WhJ9Y6RY3FfzQRMWQR+cH2HOU2kWHbOOuEZRKU6TUbUZ5Z7jjAVf
	Aah5a/DsoH/naLkJyrvYA28jRZ/dKeysqnK47hpOuMpp9zavYSz9P/EN1CM3xReMo=
X-Received: by 2002:a05:600c:5251:b0:487:22de:25 with SMTP id 5b1f17b1804b1-487283d4939mr133907515e9.7.1774945276289;
        Tue, 31 Mar 2026 01:21:16 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm14542485e9.10.2026.03.31.01.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:21:15 -0700 (PDT)
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
Subject: [PATCH v2 0/3] crypto: atmel-sha204a - multiple RNG fixes
Date: Tue, 31 Mar 2026 08:21:02 +0000
Message-Id: <20260331082105.697468-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012118_967624_539504C8 
X-CRM114-Status: GOOD (  11.20  )
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

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v1 -> v2: Removal of C++ style comment (I saw it too late, sry for that)
---
Lothar Rubusch (3):
  crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
  crypto: atmel-sha204a - fix truncated 32-byte blocking read
  crypto: atmel-sha204a - fix non-blocking read logic

 drivers/crypto/atmel-sha204a.c | 61 ++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 21 deletions(-)


base-commit: 5c52607c43c397b79a9852ce33fc61de58c3645c
-- 
2.39.5



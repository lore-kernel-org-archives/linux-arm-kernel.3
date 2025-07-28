Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF8FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQRkEBKSX0KDbt2DjDVCCEOOHuJVKF3PYKVmG7o05vY=; b=bcRgSgQkbKJS1aAq3PEjaADdel
	DLTuTRHwNhQgEzkhA37LoBISXfnhELsd83RuLNya/sxmZP7fM9cjB1kj5SnRezXY0IW2PKeZx/4Y0
	lneR+EZc5T1yHlvmDNoAQjXC7Nx0wQy54J9uyugaruzSfrcvjsS0kVNrqIw+l+tGKjdzFrqg2a18L
	ljrg+ObDtl2kP55nNZsTZb1JY34orhiom3NMsOPQP/yZQxeyQW83ONLUhTQ/ph4QLGRpqVK3XWeWG
	c3L6zGyo9w31WcFhjjj3YxuaP1Q3AQBWZVuXNo1dRidfUlzMSe3OhACJ03/rd/0Pcq0CzYsM6jL2G
	XsvrGaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHVv-0000000DmJ3-0MKz;
	Mon, 28 Jul 2025 06:39:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1g-0000000DjGi-0sf4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:07:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4561607166aso27860805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682874; x=1754287674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQRkEBKSX0KDbt2DjDVCCEOOHuJVKF3PYKVmG7o05vY=;
        b=iSKauUMR0SC+eWlMWfilrnmFbLnj6K2W3xZcHLT4kQ3wxjch4XsfqXaWgex61BZmgI
         iKNb+ZGOQMl4euUJJt5+bkEE2v3tfsPIXcP/vT9f4xLb11CWZcf9tHSjU9RwoqsQGbtb
         0sYkSePLINyJrORWhMMJ50CFF0gBGI0QCCW3nCYy5Kre8kNJOpqtlTjxOY7MA0OO1KhQ
         i8UhQh0oKDisLzNwRhoGejEK9CkddF9xlUpP4C83prgVKPzGf2zXoZ7gMCTkaeR7ZKBv
         YpYI0modGNZfZu2whsiXjp6Hfm7UOSfVb6qcE9nZR7ZVgkuqiejTe7ACT56LauFt6nMj
         r8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682874; x=1754287674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQRkEBKSX0KDbt2DjDVCCEOOHuJVKF3PYKVmG7o05vY=;
        b=stxdLbAta6+D5DHpn4qUcC1z0SeJYTVvmNuLqKSZ0XFo32zcEmfEdxeoO0gl5rIHBY
         TkuMl0T2dkKQNRk91/OS6MnIb8nXps2tNj2utVKz5aAAjaZ95tC//T4Uq0Ha1KzksoiR
         iDyoYrYokoTTI8N+6z573O0hSYDomwIk5SxAgSxuZ/S8ECWqp6jvprqpsXQbc37+Ayvt
         BeOWk3Bltd3RIRF37WZPY4nc01On/MwWjiCHY0qjNzDsoPkHE2wVJK32HEoIzkCLbAiF
         5bw2IJOFvUHJdu8F8PeCPPTk0kTJiY5WJjQVenyWdfaNsovKnTlZSn31Pm55EIu6MbNA
         sQOg==
X-Forwarded-Encrypted: i=1; AJvYcCV0M7X8GBoxstJG6zpTXoie2AFMh7l8jR04P8XNT7Yl0J4OXXhN7fTDOcxQNBXI8y7e/0+5014ClEvjw2aUaZms@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmt+JkNxPTx6360Yn3vsvCupCcmFYrxI49i1XFxinH3e6B7V0P
	fubysvKT2TF+9RZLnYbkgMsXN+onLl9nmI3ppHMTq+gIb9X53XcyRFkJ
X-Gm-Gg: ASbGnct2JzZxmSE6j231AFa/Q+M2nLEQup/u1dBSwYKdQcsR0wXUk5sv1vz4J3w2RpE
	I9y4MuxVkxocsODoh/QDONZVPTs/yyQcrrmCVvdeqEk2pECGeT6rLpoUPU88wIMb4WvM5ICEs+e
	wstG78w2rXL5kK1iVQHhD3w+ybwuGRetEflLxgFc0XoTJHfAWPF5d46k4B8wvxq+L8GYFTOoKFj
	12Orpi5XCb3KorlyxfmjgDF+sFGranJ7XhdMFwCAxq7aOSD3wKvuadEgz5nEmknvwZLMYrmZmcd
	ebRnZrnMjcE7vbNUpkmRuW4UAYyDrML+mnJR+6N5Y9UNHO8nYCshC0HyxBV9jtIxZYs5aLUmSpm
	qPJg0rg+BEqlWAe/V5rY16OuizbOYwXtC3g==
X-Google-Smtp-Source: AGHT+IF3AC+lhboN+bDd3GTIQsZ/ijxMvRWFI70HfU8zkixbqEtidrdFYobTIDcSbPLWc1dA/skPGg==
X-Received: by 2002:a05:600c:1e2a:b0:456:2832:f98d with SMTP id 5b1f17b1804b1-45876556361mr80069655e9.27.1753682873906;
        Sun, 27 Jul 2025 23:07:53 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:53 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 0/9] sun8i-ce: small cleanups/refactoring
Date: Mon, 28 Jul 2025 09:06:52 +0300
Message-ID: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230756_249276_0ED0AB93 
X-CRM114-Status: GOOD (  10.41  )
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

This series includes only the refactoring commits from [1]. The batching
related changes were dropped since they are no longer relevant (batching
support in crypto_engine was retired in [2]).

This series includes various small cleanups and refactoring:
- move request-specific skcipher and hash data to request context,
  eliminating the need to allocate extra memory in the digest path
- make the hashing code more clear and modular
- reduce a bit of boilerplate/duplicated code

[1] https://lore.kernel.org/linux-crypto/20250626095813.83963-1-ovidiu.panait.oss@gmail.com/
[2] c470ffa6f486 ("crypto: engine - remove request batching support")

Ovidiu Panait (9):
  crypto: sun8i-ce - remove channel timeout field
  crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
  crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
  crypto: sun8i-ce - add a new function for dumping task descriptors
  crypto: sun8i-ce - move bounce_iv and backup_iv to request context
  crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
    sun8i_ce_cipher_do_one()
  crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
  crypto: sun8i-ce - save hash buffers and dma info to request context
  crytpo: sun8i-ce - factor out prepare/unprepare from
    sun8i_ce_hash_run()

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  85 +++++-------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  37 ++----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 124 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 137 insertions(+), 138 deletions(-)

-- 
2.50.0



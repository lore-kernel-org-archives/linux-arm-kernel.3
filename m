Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E88CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZGoofDL/+Drlf7goUQdD7nprWB1U8kykjfu61KEsJM=; b=s7GCIpMaKAHgKGSMKkvLQoRyXK
	EInW4P/TKFQ6oDHl+jFWa49AThQ9Rqc3xkzk+6wfHXrWHXW9ER+jc0FQiZtAPDmWMl0TOm7qK5nbn
	qWjwoa/8G55zlzurwLU+nCDPtW/A+RfNLWJhQsu3eoH9ik/NmUnyrOWd8q0/VIxHrQMkCmA1ug03t
	BlwheUdB238eA0p3xiBOlrMrm3iVhYOgZM2v9feC+vYTFT/+D/aJ8icihxLOXb9eLTJmKIYNF6kuJ
	T2QuDFfw9A0lkNq60KRRpNJyYS5JLq5wRPSUaiud9AbSpaqiOeXngcwo94GOw7SsFxBlTOMje0kvv
	aJDuwFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie9Q-0000000906F-1Oqq;
	Sun, 03 Aug 2025 19:13:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6p-00000008zVl-3MK8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4589968e001so23893535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248262; x=1754853062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZGoofDL/+Drlf7goUQdD7nprWB1U8kykjfu61KEsJM=;
        b=i9ELCGmXwTQqQMmC245bAhzwD9cesRJvDn4O0+zoBIdrANrgl6DGh7LCkuKtBP43He
         wk5MKtwLsGYNuu2VZVRFQjXgJH0IbOqaUcMDHSRbEt5BgxhUXOo1lUIWWKHGddKhdPH/
         +xwhv9AywQZPTTNIdNkGkvsB/WKBemI9nDjHv4yM3/tq9zy9lhMESvueL2bYJv6Ib9qL
         5PXnW6+q+8X+j86NRtcyIA11SwpDD2PdsZJDF/vvOsI+J0BsG9itjlE8fw17v/hA+Mu6
         iukXGAfn3bdsBa83jNGtJ9XKhq2v2cLei/3+b+exg2UMJcS9VwK7e8NO47SvE8ZgAVMR
         pd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248262; x=1754853062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZGoofDL/+Drlf7goUQdD7nprWB1U8kykjfu61KEsJM=;
        b=pA+Ze2kIUdIhKyPb2IhBao5I7oviKO4uf+GtndiBYLKh8fp/QLSSVRXP4qXNLhHxOd
         BIk4Qd2h8WBsLb8CcYhL7KVIHQS6q9LudJ1u3WwuileJvsBaPQBHyuiYcrW4XvAgKaVb
         yJ1I4ijcVCIjWA+hE3nznGHHC45oByGEL1XGygnDmgbaRjl+10yZqa/ylXK0AWOk4Whr
         V7ZRP06pZrE9p7xMEb/ddZZuLHi3Jqtej5C7/lXIh49u/HJraySyTYkxbVZMfbqqWLX3
         8dzPTX29LPFJtNIiSsKLFpK76pCdXh0MGhiCXH1R0t4H959K+le3zSZbACAwDMRyhiRI
         J+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYVTzMEQMiPCGjExdrYkW6NBvBrSnfpRWpqJ0Qk+KA2DgqXksiahQ8m29nJPP/VDvBuz0Xad21suLpoGgyNIfM@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxflv/EDMRV7+zI9q6dJ1vKpJYEIF1vbf6hVLFvwX+P3uQAqW
	KFBZG7NbgkNkdXEX7r6jp16FXhMEsTFSvG6B2dSLMstMkUVelJR61ZET
X-Gm-Gg: ASbGnctrncbvKgEip4I6ZDUw5/8JlWEDB+eVM/Io3M3c1HwG+It1GnlY9wMF94qGnV8
	/Ojl1xQFsdoRl6SzKHqYullWekJdP0w5X5aMHHs5rkdtxLOGpy3zJ/LOi44VP4tsZFSZO9Wo9gl
	sIiuRKGhK7F+yOT/BOgtvq6SnIEu3Ew+OOizC4Xab7bqrSLweu5GKQtgY3+ieMJoeSOwNyvh5kg
	/9gka9Oz6Q9r2yITvTEPbz5fM/SG430Yy6Q64KxaIWjxpWNR4OWozFjFIyF4aRJZ3qEoli1aue9
	MSnRX7EmR7rXpxS7J/1NYi26hH4Pr3SBcmWFR8399JZHA7tHWo3+/0MXsuJeUMi2cO7RwFrwNOu
	qtJvWLPh5vrWnsKZp4MJEkMqB9XJMEzbM7cxc0CEgMgLA
X-Google-Smtp-Source: AGHT+IGgUWvSHp1oHsFPRY5vogFzYlPyb+X50JGskmXxHEZQ3UsSNv66GsiHuM+9cfxnrA490qRp1w==
X-Received: by 2002:a05:600c:4703:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-458b69dd754mr58643285e9.14.1754248261562;
        Sun, 03 Aug 2025 12:11:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:01 -0700 (PDT)
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
Subject: [PATCH v2 0/9] sun8i-ce: small cleanups/refactoring
Date: Sun,  3 Aug 2025 22:10:20 +0300
Message-ID: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121103_843481_FB36A8DD 
X-CRM114-Status: GOOD (  11.79  )
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

Changes in v2:
   - fixed [-Wunused-but-set-variable] warning reported by kernel test robot

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
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  35 ++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 124 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 136 insertions(+), 137 deletions(-)

-- 
2.50.0



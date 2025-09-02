Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C81CA100E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edZLfiZt8B4p4uO3hUsASn2XOCnLkF3RAYMn9M9Bwpk=; b=2NgQ1J2Er2xfEszkk8QnEmvUZe
	p3yHzmE3trVVGDTwN/j3WOBwoPw74juRsnEsDvSXQlEDl/cPrYZNphe2pZLp2ymxBxgDLQAsSfsx2
	4kca3NkuSol1W5JExXS7/RomNc+9ahGK8hkyccLB5DTNr4KVvqa4rRzBQ70rFUVxUruSlvI92i4/b
	8cdbLK4jSrHpEDQER7/EUzDuFcRYFwUTv2xJVN4+FWdgeaANuc9Jm3wMnrlj80U/YLTIahS1uIH++
	f3VpRDKA5KYlpwnyUSltG3ZwNxyHpcLSApwQwtv+eKGJRdTs0aH3RfYRmlieEyXog03Z7+IdhOooe
	AnG9vBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYlw-00000002AKY-0Qnw;
	Tue, 02 Sep 2025 21:42:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyP-000000000w7-1QKg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:22:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso36403435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819375; x=1757424175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edZLfiZt8B4p4uO3hUsASn2XOCnLkF3RAYMn9M9Bwpk=;
        b=C2AyjmzSyvYs3YeL9HON6fsddYhTn+2sFGYxrAsbMUZboSC+W3O17qyaFKDVFIVYNc
         sWYR/mVWNzC6CHyKzbXH4R+G+myPFgkes2GRZqZ4pOYZjfX1HCiG06xHbM/Lj2uZ19/z
         WS7R4/+gIlv9MovXrTl0h+I2LfFamZgqmWP2jxoY742zR6cWaWdhtqHC4ijjem1o4AZ/
         u3jAdL3e/yfzRhVgv5Zb2cHIPldd3DMon8ug6FloA11RP3dIFaiJFdZ+nb4wDXiOBXBo
         BUMlqhDi0lnVY9EhliXPcriayhTI75i1HPHMJRke3/cQthaEm/vPhulmvh9rzc8lHgFx
         /wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819375; x=1757424175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edZLfiZt8B4p4uO3hUsASn2XOCnLkF3RAYMn9M9Bwpk=;
        b=LunkEPIsEU5huqcHJBkaXsJcekrcPOLSOpYgofZWgEEZnEaSxPdytQExITbBJmv5x2
         5QO95UGkMQ6mBfADA0N82Jie4REyVoWg6ojkl4MqFU9t++1WV0yjfcOs19eEjjj6JEQE
         fb8PrAH30h2NYyAT9jIhC3jSVJOsDxNYKVYAeFCwi7MaUwSb8g/Lj9h0J32M6h0vuEUm
         2bKuL/XWuSFZZSCDRlu++96SG96j0dUragArIsquYRiy8P8YsD7EaXV2bVTJB7qwJezk
         SCEX3uE26zZ81uAm/qY5VeG2ZjyPVB/JSqFzfHoF2ByQLKBUGxQ0/8P+GnlerAZ6YxHy
         jZEg==
X-Forwarded-Encrypted: i=1; AJvYcCU38b753Eui1D/pcTjOZRmoScrN0+7FN31yx0l20zTZm8dEhFOgsn4gwzaiL78UnTzXpps7pDtJdmWQRsVBn8BM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEfQPkrC/XHekYALogc8rJ+dX1qNiFltnrdGkxDjvgBnhasOpR
	lP7/Ia9YizwTRHzlHztSqRzGSPGsTuUXnQyX3vZ/1vwWO0AZew4WG9uj
X-Gm-Gg: ASbGncuuJvfzboYgv3+ZSV9CA5xpRkexImpdpsRmmKyk28YXV+UFBaHb7WQtTSmPVCR
	c6SREqdAep/q2uLm0tvD4QfWUlxsbkuBCJOSpetEZrv7Fagvm56QZ9Cadw+XhHNNiH/sX+EqpaR
	wUktS+CNQ6KYDOImSx7bP+rBssLd/z8m5fIW9+GS0xIzcY/viiQwNXRaDK+8svTE+uN6nHHXWF0
	tQ9HRCHnUgHZxjNvkarumxnCSYqAO5nziABEcFo1toK+AJ2Wcnm0bTDKR1syuviXH0gT61F/l4K
	V629Kv/oRoVjJofr3zqPfLfvElw+uca4AT1zNlyGk0M7D/J0asLSFybflIUajdlVI/KvKTpdap8
	6vjpBJ9GPoSKdGdBoNFZE+90YpPLqzQ1J38kALyBuEadM
X-Google-Smtp-Source: AGHT+IH7LkldeuIVl0roiAT8alXAPPPGwsjQFZhyThmF6wIdY2fazyGKGh4QM5al/Tpt7/lQ+R0tnw==
X-Received: by 2002:a05:600c:4ecd:b0:45b:876b:bccd with SMTP id 5b1f17b1804b1-45b876bc00dmr86469705e9.6.1756819375070;
        Tue, 02 Sep 2025 06:22:55 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:54 -0700 (PDT)
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
Subject: [PATCH v3 0/9] sun8i-ce: small cleanups/refactoring
Date: Tue,  2 Sep 2025 16:21:25 +0300
Message-ID: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062257_374786_C30A6E85 
X-CRM114-Status: GOOD (  13.55  )
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

Changes in v3:
   - dropped ____cacheline_aligned attributes from buffers used for
     to-device DMA only
   - set up proper alignment for ahash reqctx, in order to allow from-device DMA
     into reqctx buffer:
      * increased ahash reqsize by CRYPTO_DMA_PADDING
      * added __aligned(CRYPTO_DMA_ALIGN) attribute for the 'result' buffer
      * converted all ahash_request_ctx_dma() calls to ahash_request_ctx_dma()

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

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  85 +++++-----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  35 ++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 145 ++++++++++--------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
 6 files changed, 147 insertions(+), 147 deletions(-)

-- 
2.50.0



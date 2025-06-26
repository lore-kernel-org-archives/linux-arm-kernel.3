Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A63EC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CjO/ptLW3b4rtGhdm7irBfUpl4TyUoEIOLpVLAH9NO4=; b=NPFaf6icVBvsIrcgvV/z/i6SQF
	qWpethpHSwhhVhqbcE4VFqxp28H2rlhLukcMzVYjKyAcdkcApEUkOJ2+v17CC91/FAXnt2zT4QjhQ
	W6e4uwwXG1bfTLLDpiz2UnysLvdVlsTwSKFEx+a6kj9NdGnoOv6UCMVB2MFCaOiinR3w4fByMrvU6
	BB2gdZqXwTiW4uQ6AChL/NKiXB+gVW6A+7zrPJ2pQVoNgSkO6bYtHETgiqSv94JdjRHv3Zgf1Dm/g
	6L2G03TkS8ZmNv0I3KpLiuDykark17dXiMx1sIdAY/ZDYfDG3W5SjKLjf5H/oVzU8ACMDrgLfv4hG
	FpSX3q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgx-0000000BNwJ-0gMo;
	Thu, 26 Jun 2025 11:22:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjO3-0000000BDrf-1uCU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso176233766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931957; x=1751536757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjO/ptLW3b4rtGhdm7irBfUpl4TyUoEIOLpVLAH9NO4=;
        b=YXhVYPjP4mAdd+3AtOaF+xaPatYrgoyruL1jMrDhltz8xyAOt74bh73fS61rAYsKcN
         KN8RlYNpWlVmWySixVRV3TxIXd3QMbBJf9+Fxs1crUo47dymd/LN9w46GZQ9kFVllD8Q
         u6AzVqvEbUouSYPbYT3UKX+JcTJI2NJcO+op53b+O4VaLhYrWWVMSyGp+HW8Now7HiLr
         85zDVFaPJRo/pruERYcPFX9JrCviSPEaOkY9zNGLfVP9QbHpXKQhvjdDGxxaM6Y6Q7tt
         mVJa8Nkn15AGMkHCG7djr10GxiKDEyvtDKBaR1dOSPVbCUcQkv//gvSLcBwBNj/aCLWZ
         Uw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931957; x=1751536757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjO/ptLW3b4rtGhdm7irBfUpl4TyUoEIOLpVLAH9NO4=;
        b=t+p0KnQampTQfJtPvJi+LzLVl4N3Zl/mdydmadExRASjfDpGrX9Oc1Sun9E2WBFgf3
         ZULTCrw5sGioBCcamVQ3D9yj5NlN3TsStQJRSsBe0D6Cjpcx9ySycH5B1s2e3J8sZ7D8
         bFmNP74x3HA0N0Mzjx/Rrk5SY6AM9lTI7w9YWUrjjHDTa9SaVKw3kR7HwhBRx8y9act7
         ldsoZQslttOqwj5I3LxuBOXa+FmhKp6dp2fHgzEPOcahXWqhWsEomPagA3z1X/NtEUN1
         mfbOi84bweaKR1AxyUxsNpPxzxQIZuoNpBb7GozQcDcwUfB8dmtA4/vnDcYiC8RzzpSc
         +sxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJKbItfZ9TUWYpJaJuJQZSwVmIRIzDkwidk/yeb8pc1lypvtOYaQpfBulUFiuQqlM+F2CtrY/yzxbbCQa7BBkN@lists.infradead.org
X-Gm-Message-State: AOJu0YzuE4V1TtRiOb2ruvec3FA7RAmHfEfRXQXrJAm/NtNqHM88Qk5e
	rEUljUph2VSxW1BFpLurPlghga5uO8EQ6A6Zq7lwrAQ104kEF0iZJlid
X-Gm-Gg: ASbGncsXUcHAjdP1sWGWeS49Qtm3HuQowwNBanUwfm9+gWZfxqJUhN4KltajLeV+Bsx
	apPhYIQLR/bhw2MfOZven2YvXmIglxetv+zBlkhx8B6XYdMyLBuFGUQ54HaBReBlsjOArvCR4xp
	QnhnvJxFjwWhxFAVpW3I1hmYxyINk1n2fTocHDaR7mLy0Ml0DUOSJNE6DlvsmqPmfzz2YtTu3uu
	nTFp2IDUrLx0p0zz5JEccJ43OICpmoix57CoWWOeO+h1JSAJvW0z6NadWiLA5yXoD7e3rd23OHQ
	XeyKo6VFE1VcvOaCJjc75NYD4Y4t9jZanXPXZE9L3xxkqj2g7n8pYGCAW0f7zvr8UQ98awa1MTC
	8tACYKvT5mRw2RSERA8prhTXr
X-Google-Smtp-Source: AGHT+IFulE9JLwWYfiP6+EbStasn8y1TExIFDY+mxNKb98YrHL6j30fB+s7fixY8YLajpv4J85GFbg==
X-Received: by 2002:a17:906:cada:b0:ae0:54b9:dc17 with SMTP id a640c23a62f3a-ae0bea9382amr639642666b.11.1750931957054;
        Thu, 26 Jun 2025 02:59:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:16 -0700 (PDT)
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
Subject: [PATCH v2 00/10] crypto: sun8i-ce - implement request batching
Date: Thu, 26 Jun 2025 12:58:03 +0300
Message-ID: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025919_495888_935B218A 
X-CRM114-Status: GOOD (  10.18  )
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

The Allwinner crypto engine can process multiple requests at a time,
if they are chained together using the task descriptor's 'next' field.
Having multiple requests processed in one go can reduce the number
of interrupts generated and also improve throughput.

When compared to the existing non-batching implementation, the tcrypt
multibuffer benchmark shows an increase in throughput of ~85% for 16 byte
AES blocks (when testing with 8 data streams on the OrangePi Zero2 board).

Patches 1-9 perform refactoring work on the existing do_one_request()
callbacks, to make them more modular and easier to integrate with the
request batching workflow.

Patch 10 implements the actual request batching.

Changes in v2:
   - fixed [-Wformat-truncation=] warning reported by kernel test robot


Ovidiu Panait (10):
  crypto: sun8i-ce - remove channel timeout field
  crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
  crypto: sun8i-ce - move bounce_iv and backup_iv to request context
  crypto: sun8i-ce - save hash buffers and dma info to request context
  crytpo: sun8i-ce - factor out prepare/unprepare code from ahash
    do_one_request
  crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
    sun8i_ce_cipher_do_one()
  crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
  crypto: sun8i-ce - factor out public versions of finalize request
  crypto: sun8i-ce - add a new function for dumping task descriptors
  crypto: sun8i-ce - implement request batching

 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  90 +++++------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 152 ++++++++++++++----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 140 +++++++++-------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  84 +++++++++-
 6 files changed, 327 insertions(+), 141 deletions(-)

-- 
2.49.0



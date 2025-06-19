Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4445BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CCfcfq8X1qJYhuZKNPdQznstE+FhOnktsIaudCrihyE=; b=h1RGxILOHPaQz7puVV6gAZxjKp
	0PxY41qPe244sW1r59DBcXmjUgndJ7f2JTfNChJAe3YS9MPvn2rW9L4hw8xkIC6OYkUXY0ckC0uR+
	xCWoJcQU84fkHzE8MFW1kS82w1JHS3DGwQhDPv1VpM1JsrE+H2p61xf3VIpQxs/meMweyIW9MqmmA
	GMnMAz6/9aqbAAN52kV/CkhiVwMPKvPCP8A7oLmoY80jebJvF4wayNqNzrO031fLtUTf5LbcdICAH
	6cAn9fvV+rDwpUr9uGBUZWFhpyjMsY6/Pfx0A73CrScCDO5vIKJdhmczuoABNGq5bVLudGw58bkMo
	vmZzi9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTy-0000000DVOg-1Pz8;
	Thu, 19 Jun 2025 15:47:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJQ-0000000D2VX-3Rz6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ade4679fba7so144133066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335851; x=1750940651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCfcfq8X1qJYhuZKNPdQznstE+FhOnktsIaudCrihyE=;
        b=OJsWP785NA1h0hH00uEfyUAAjlqWafAbB+swB44RxnId0T/WHbgSJq2CGNUAxzTXIH
         /EE8tf3FUiRRTcl2GHkk1f4kTlGkUyBhE5KlkH6czzJodJ3dG7ekF6/cHzWzIS1a4GTp
         JuJhhJX3WFSBbSDamshdqobdsLQfqsDkzl5CzlbMwrAkKZ7rMZxUDmloWXFjb3tkOe+m
         C5cObvvOwuGqhUh4LPjVDDGpsoT+3GOhZd8Rkw7fTN4Ek3mSsKibMDQiQ3wwuA1tdO67
         dI+ZOSaZ2V8p7OyQdTWKhd5nbpzRu1JYdvYyQT+mEn+GpUkZHwCwCDIsNg3NYnPuaJpw
         MUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335851; x=1750940651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCfcfq8X1qJYhuZKNPdQznstE+FhOnktsIaudCrihyE=;
        b=TY/YBsvy5oARHdtN386jQgYcDDc/CaZjhbELGc57OOG6kFLiRXCbC7kD8/t4JyR5TB
         eQEhMZ8WzA9N9ORaqktTTYHHYZG9xkR5wmzVPdos2uoAqMjPi23E1Nm9cP52D1A2wPZs
         UQPlw3bpXe5ShWGO+3Z9InayEjUHe9kBo1je4A8Q0uIIW6dKFwXN1AtyNoNCw0O6m5hV
         /mAxcanEy1IbaEBaN1SSnxsJvJHTM6r5z6M/4iCKtA203s55rdUvZf5aGZfCwiqxTA8D
         zYvp9l5BP9qqstBQFV8Z62w6kuB8Hvg1JIv6GCLbRM93zDaK5fl2UVPbASG+kXn1A4SE
         nJTw==
X-Forwarded-Encrypted: i=1; AJvYcCWcvnSdMEP6VD6RQ2RqeHSI+ljUPQa8LhTiqTQK/qgTDl68voxcm9WAaEZbT7j6sJvGNZFOsWfFW84XjnjacuQY@lists.infradead.org
X-Gm-Message-State: AOJu0YwjR5+gXg06QUjim/+AiB3FWokghj43HP8llZALWvxERNjrb3JA
	ruH6V7qffctuJl7QoPbs1FANh7TLx4PUiP8yqpO7ofLGM/aFYr80rmwS
X-Gm-Gg: ASbGncv5s/9b1xx0bSLXh0wzMMbysN6UIedDYcKpFH7zVp14CaYkeKKaipzmP2vsl8v
	5jl8QVKASjonf/XzpI6gOUjYeiRRmIkNjhebpo0Pgtixon0skzM42IR/JtGQc19aI2xCYdob8R3
	xhnrrgySRiEf8sye7yNaNdZGqbhCZw6mi9B+P9oTdEhpXLas/XD1ctM6BpXCT7SkK1aRLnsFmsh
	eecvcbvpz5JgPG4N7KkzG3tJyIy1wSj7Pq9X+ZXOb5eS3UihdEdQBiJVn/VrUqeDRoQxd4oF8IG
	lg1Cyj05RBmoJaM2zClI2G7TgTGhdu78LzjSXfUeNUXuuiMl0Pjwz1UiegRCV1dIOS7BgJXUmfe
	u0rQD4elB9YSJQA==
X-Google-Smtp-Source: AGHT+IHUuqtHwS6ePSREPoIXcxb7Gs3mBMp2owjvf/lJwUZbFDI75gzoaIsc4V4vaYVxfg5C/ZKVLg==
X-Received: by 2002:a17:907:3dac:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-adfad364957mr2158168666b.1.1750335850583;
        Thu, 19 Jun 2025 05:24:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:10 -0700 (PDT)
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
Subject: [PATCH 00/10] crypto: sun8i-ce - implement request batching
Date: Thu, 19 Jun 2025 15:23:06 +0300
Message-ID: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052412_860551_2288A4C2 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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



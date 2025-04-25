Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF2C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l3BCALyVfXKt+WZYBHxbyWx+XxVRkGCfaI97XHpd+pY=; b=n8QF3XyldbAL6eZfjPkORcilvk
	++WP2drVeWgsK0PEct6WhTuUewCqzD6qIhyxOt+qiNSNrnzDgJVMKos3qOkSYeP+26SsSf2yUjrpw
	98LKfD7b/SzsVYkjsHK9zTjH3UE9FzSr/Wg5O/nZj641ZNJVRcZnyHlrj/hEf1z7FPq1fRPM55dzY
	5rskV6vwLOv2Msnd2eHXMc6mzFocKeyIDVBpzqkQ+mTA0/Knr0MnVlBnOPJmAT0qM/3t3Q6kyRvYd
	fwTG41MhWZjt3a6TjGhnOpeie8v/zcL3GbgiT0/eQqgLPReJJ8wnqYeTpUJBjJ/UVqM3pcLfePZVt
	B+xqbbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KUG-0000000HVYx-2GUa;
	Fri, 25 Apr 2025 14:57:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IRA-0000000H9zI-2Tg3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:45:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so336511466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585146; x=1746189946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3BCALyVfXKt+WZYBHxbyWx+XxVRkGCfaI97XHpd+pY=;
        b=cWNtdZt2iYfKSOKd3uYzC49Vn6CakOTJ71CqlhUTPPLvxlpLIgjyaI7wfnHppMyGc+
         en54ExfRW3JsoO2lQUd5cbYqtCET3PbRGGWYh91jiN422tTTWoXHaHyoOK3j0OfnFd1+
         XMouAbZ192da+lE9XTXg4jw1NmgW+d4OMUrgwLazz14X0ZKVaN0fYCLavre9/4l6SdnZ
         dGwleSmw5KYO68fNEYykUhzhXcDA/M3rw+A+9GgjXBvNsorYVzeXtoQYQmAmIjzl2URp
         4rWDq1TZ9rrk4tt8FEy4Y79l8U+x4Epjj1/5ChulEh4xVHK4skpd7aViQp6ks/qBHRYp
         xJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585146; x=1746189946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3BCALyVfXKt+WZYBHxbyWx+XxVRkGCfaI97XHpd+pY=;
        b=OkUMI4C8PWJDQh/9+hN+aGQGzg/2lm8EoMQ+zZJwKKgllcPjlHSulB02tqvvlGKqes
         tQm6yZMEMeh1wzPABKFPDU5Fsz2IcSTBpcJqdMrE2b9YSV4LSWS9Y34R+m6mq27/Fwzs
         T0ocHZZ+XNlRmZY7SkH5Mx/sUYgKO5PCAl2cZbDXzZzcH5U68LlQDRdcohjVed0oxrN3
         C8GCxc/NGrjcSmYbRTgbw+ouUCpqti5BRWt9FdqKQ24BpFpuY14iydStnnXohYE43sAT
         jfV16O/Lwizc/xZeqkjo5maK4bGYPMbwtfkPgy9vAqiZZqJcSiHFVI9HbX7GFHvXRtz8
         RfaA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpbjOdne/7ZkelzDmiHgKasaAQ+Rjlhv3A+CupIefWEv9YR34/AHAjHm7D2ZVB61GROmbwZok5fDJXIF1NeOd@lists.infradead.org
X-Gm-Message-State: AOJu0YyhyyUQBPatl7gkCNL8uD4cYfj9BGdywydDBMWDTgfOY1iHApfY
	uoboRhUWcll8dLScs4ITX+mrJ2ryKFyeCu+Cf52nVLPDAP63EvFG
X-Gm-Gg: ASbGncuTXPDOHzs4rrrhkqxUd/L2Y/IYLPsyEPnKhkIuXU6F/pUF7M5D1rjH5QFnGbi
	b22jYmUljdG4VSU+KL/HT2KBJdbHipasqiIGN+8o7Z4uSW+cCeeq7Z6D0wlev76wamvc/rbc5VZ
	AV5Ptyo1x+1BmX9ejxTthEoxt+qP7TlrTXM+eSkskNBKesR+EVsK6GCz6Hcd8SuiTwFG63MgFX3
	uED4YhouDDtZ5KeTg/oSxZvX7Ckz7b6yQiJjL4vVigCy9v37N/BVqVNyAWiVTYXLWIXYgFeLOnA
	sQX12pn8KCifc9Delvxw6eVR4z7gIEeS+BakY2oC11uCwBpLwUw1IddksZdAoP5Gu9M9gtvxUZd
	AY2Q=
X-Google-Smtp-Source: AGHT+IF6lACxg5XQV9zx3XY5JZvnZc0emetlxi1pM+qXxla8Kdp3t0Y/dF93JbbLv9LE6OFyvzm8+A==
X-Received: by 2002:a17:907:1c29:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ace7113336fmr191137166b.28.1745585146266;
        Fri, 25 Apr 2025 05:45:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:45 -0700 (PDT)
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
Subject: [PATCH 1/4] crypto: sun8i-ce-cipher - fix error handling in sun8i_ce_cipher_prepare()
Date: Fri, 25 Apr 2025 15:45:14 +0300
Message-ID: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054548_626345_0F20E019 
X-CRM114-Status: GOOD (  16.17  )
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

Fix two DMA cleanup issues on the error path in sun8i_ce_cipher_prepare():

1] If dma_map_sg() fails for areq->dst, the device driver would try to free
   DMA memory it has not allocated in the first place. To fix this, on the
   "theend_sgs" error path, call dma unmap only if the corresponding dma
   map was successful.

2] If the dma_map_single() call for the IV fails, the device driver would
   try to free an invalid DMA memory address on the "theend_iv" path:
   ------------[ cut here ]------------
   DMA-API: sun8i-ce 1904000.crypto: device driver tries to free an invalid DMA memory address
   WARNING: CPU: 2 PID: 69 at kernel/dma/debug.c:968 check_unmap+0x123c/0x1b90
   Modules linked in: skcipher_example(O+)
   CPU: 2 UID: 0 PID: 69 Comm: 1904000.crypto- Tainted: G           O        6.15.0-rc3+ #24 PREEMPT
   Tainted: [O]=OOT_MODULE
   Hardware name: OrangePi Zero2 (DT)
   pc : check_unmap+0x123c/0x1b90
   lr : check_unmap+0x123c/0x1b90
   ...
   Call trace:
    check_unmap+0x123c/0x1b90 (P)
    debug_dma_unmap_page+0xac/0xc0
    dma_unmap_page_attrs+0x1f4/0x5fc
    sun8i_ce_cipher_do_one+0x1bd4/0x1f40
    crypto_pump_work+0x334/0x6e0
    kthread_worker_fn+0x21c/0x438
    kthread+0x374/0x664
    ret_from_fork+0x10/0x20
   ---[ end trace 0000000000000000 ]---

To fix this, check for !dma_mapping_error() before calling
dma_unmap_single() on the "theend_iv" path.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 19b7fb4a93e8..05f67661553c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -275,13 +275,16 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	} else {
 		if (nr_sgs > 0)
 			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
+
+		if (nr_sgd > 0)
+			dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
 	}
 
 theend_iv:
 	if (areq->iv && ivsize > 0) {
-		if (rctx->addr_iv)
+		if (!dma_mapping_error(ce->dev, rctx->addr_iv))
 			dma_unmap_single(ce->dev, rctx->addr_iv, rctx->ivlen, DMA_TO_DEVICE);
+
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
 			memcpy(areq->iv, chan->backup_iv, ivsize);
-- 
2.48.1



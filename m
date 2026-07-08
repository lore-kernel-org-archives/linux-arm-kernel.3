Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=; b=2mtoL8770cC2JcmcMnaQxt9b0X
	Af0kHXzGp10QrwDdTti94j752TdfMDc4kaYJyTTR51YyzWxO4/HZzjM99MlTBVvGRveOxlKvp84pB
	3CzKh/drLtIOdao87TkYxcVRh1pgYIAmm7KmHo2rjuUptphmfF2mPqNTLqCZ5sObd/Fm+l6n6/UG8
	x2cHO3hDPi5Ek11hDz1wlK6K5SUQW6ulicV9wuOqUEyxRNdi5O9eZBsd8Od+Q3j+AiZr0Fxp5Y+PU
	cumyT/vsSIN8cYLALdjEtfz9nJzMGJJSY/GRBnn3yLpbIb6A0Zxocisikc8I3wczlrpjmORFwIfJR
	Rw2xnLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZL-0000000H1jJ-1kTo;
	Wed, 08 Jul 2026 11:35:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQZJ-0000000H1iC-381f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:35:58 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc84e77e78so4615675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510557; x=1784115357; darn=lists.infradead.org;
        h=mime-version:content-type:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=;
        b=W9stuC1K4Xy2OLko6guHAglKWQVkT3z70HPwxVStgB2yhxyZxPgGYIwajb12PoLbqR
         E7kaLLQzeOQysbOSnI40jV/1wgeapytOdCFJmPIke75NSDpvuQZKw+vjSWVasTnFoUTx
         a9SIkcz1+pZvAlVbEKVlyl4GHShAxLZxLnl21dTFyllKpMdaZwoQdiYD27NbaXUc9+q/
         jRp58qYreAiOelVHGjOFF4t9KAs7sne8lcjTDeg8anL6SUMr3oIq1D4S0LOWtVRLjuQv
         IWgxsYj505923CZeh0M0ve2oTJmMd6+1mTDL36sMF1WWds4s55swzGj+KVU7kmxdaPw9
         KkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510557; x=1784115357;
        h=mime-version:content-type:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Brmbfs6RPXs03BhYiS0ot6De5Oja1VZ3H8esF8uHn1Q=;
        b=LUa0FL0jEnSljbskGKOV9fL6JXaJmtj+BCe1Xku1dWy2HF8rln2zQupC1XGjT9HvQQ
         pvozka685gDfSJdODxLc3wNgBlWoA0XzWzsYYkfJUP+a/nMmeHv+X1OQc4tcgRPXEwcY
         2QfXveM62fr8X+Xwp29aiNNi7siYmWpbf8Y/MnpzahCEqCyK0B/3kjjVawGunf8Bqms+
         sPkxeqIa8Jo/qRqRA0zBi4ZDj11vyro8rfSlvVuZBjtwcdBfNSZYcpW5mKOGYxyleb3G
         M4dmbGv9i2XEqiAYtY5f+32/+dz9gBf23No30EBHB8QC1W2bXVMWCj3dZB2GCDmcPLTc
         fUjw==
X-Forwarded-Encrypted: i=1; AHgh+RrjlaZwfuXfcuxOjsYd2pYfXQBuImQS76obhjtWYL/xuBuiBOOfYideCyV+zGnNicd5cIvCfUfPP2jde3ihhvMm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr7sXjA9C+mutjC6MY6V/TWiaenE3MCP5Thc97+xOqAx+5e/wo
	0NBkwPeNz5nR53ElbgxSQatr2EVYBG6FeG4T+5FWVY/sFZwTmng/9t90z+AiR7BE2X4=
X-Gm-Gg: AfdE7clsdP8T9eY3ehlm7kInHYc++dC83eMHA0JF2C5W2DYC3YIJiCCuiUgUTN9SB6v
	DzXqPPfHkVmamb7bBIy1xrul/jupL62jZsAoVNQ1WVL/T5fsQIidpCm6lzmtof9gbYVfTNVSQG4
	7jHMu6FobaFDKRbRoTyNNnUuhDZK+GycvdAI2lm90nkkAGxjEhzmrI270OE4QFT8t0/njtcNncD
	dMVvIf0Z5gZy2+WVTYoPO6SKrQJo1ZhbhNtJ1o7sZTMu1UmwlnUbkoEud3W16e/lQQUcPhTxWml
	2rA+o7WMKH5o2xghBAOGkBg8yLwbu1E81ho99fS09jhcraHSMUAKgXP/6NpcsYP1Q4bhYazMT7c
	uaf7gBFsR7S1DIS8Vkgm+4uy6n5wsaiu9C7bSCxLB7/3Flr8lcHrQQfNrOHKFX46E0Jd+a5QOyo
	0ckIsJKw==
X-Received: by 2002:a17:903:2411:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2ccea394d5dmr21404765ad.12.1783510556811;
        Wed, 08 Jul 2026 04:35:56 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm26989615ad.76.2026.07.08.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:35:56 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: Fix DMA direction for NPU mailbox buffer
Date: Wed, 8 Jul 2026 19:35:29 +0800
Message-ID: <178351055214.98729.11403147818632027428@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043557_785289_69401F3C 
X-CRM114-Status: GOOD (  14.54  )
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

airoha_npu_send_msg() always maps the mailbox buffer with DMA_TO_DEVICE,
but some callers expect the NPU to write response data back into the
same buffer:

- airoha_npu_wlan_msg_get() (NPU_OP_GET): NPU writes response into
  the buffer, then the caller reads it via memcpy()
- airoha_npu_ppe_stats_setup() (NPU_OP_SET): NPU writes back
  npu_stats_addr field in the response

On non-cache-coherent architectures like EN7581 (Cortex-A53 without
hardware cache coherency for NPU DMA), DMA_TO_DEVICE unmap is a no-op
— it does not invalidate the CPU cache. If the NPU-written cache line
is still present in the CPU cache when the caller reads the buffer,
the CPU observes stale data instead of the NPU response.

This is a timing-sensitive bug: small mailbox buffers (~24 bytes)
typically fit in a single cache line and may survive in the cache
until the caller reads them, producing silent data corruption rather
than a crash. The bug is more likely to trigger when the caller reads
the response immediately after dma_unmap_single() without intervening
cache-evicting operations.

Fix by using DMA_BIDIRECTIONAL for both map and unmap, which ensures
dma_unmap_single() invalidates the CPU cache on non-coherent systems.
The mailbox buffers are small so there is no performance concern.

Fixes: c52918744ee1e49cea86622a2633b9782446428f ("net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 870d61fdd9c6..b679bed952de 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -168,7 +168,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	dma_addr_t dma_addr;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_TO_DEVICE);
+	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +191,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_TO_DEVICE);
+	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
 
 	return ret;
 }
-- 
2.51.0




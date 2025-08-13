Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E35FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=; b=RxDISgbQygAbV3o1W/qgyRE8c3
	bWInl1UBSWNTd9D4Mm9HsNI1cb1Z/4BrdIBFZrU9BTGJO7qpgJs07RPYqg9JlNoNmCnpB0j6cI7x2
	PDgNBKmX3XZdBYXraURGUkUDcfp7Nc/DIKiEJhsTzV4WeHiDzK+yOkE4yy/c1lMlFi9FZJm9qZxW0
	rWsEnjzns7cplrVNiWagV8wJhT1rm8ZRrbVRscfgj6UndjUdKybMay90jUr6x5ZwuOOSl1sACB/cU
	7efl5+wOnse+1+jdMAcuWAZiLfsU+6ac221jvZNhgUx61bDzRkJZ87jTtLbkRE+r7Ir1MGsFbasfp
	JQnUZBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4lB-0000000Cl5O-0nmk;
	Wed, 13 Aug 2025 06:14:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4aY-0000000CjQw-3Wnw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:03:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso9999417a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065033; x=1755669833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
        b=f9+jxTGJTa/0V1/INwq2wyLlPdUnLPQswyEZgxtybcpKJwGgW3rj+EI1R96dqglJFg
         bDYXpWIo7ybXp1Xy+AbFF9YacrYlNX8PQ2kr0qtTFLrP3vrNzk9B3xLmrtctflrVn/Kc
         811WXqpDv9bZnXEtzMw9C8OoZ0/qSiePsGEIHZTlEF0tUA+2JPUIaAbFRddrHF5ISTsQ
         JZ5grHjWklwQ9l+NPAkLZDLJ7WR0gD6FI2HaUkcz/JTGEJKZkj4OsvZtgLR1Ri/aI2e8
         RkzEHLEf7XGk4jYf+osnADCuQoft+pf7KiWOzmAaieKoLLxSdUdgPblgxcXINsLZtNpm
         J3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065033; x=1755669833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9RDpqZGncYw4GV9WsRoAupSSI2K1DVKB1tocQmYgMc=;
        b=DChwMHr3GY6REdJs39omkDpkl8bPbw9C0iQaT1JesD1gtMAHleVFmfVbDaV0BNgdKH
         Qbxgk6Fv/rhBTi53b5qyudRiX0uSDYHZReeuvK1bFUswlYIWjDWN9lZLIzBE9k8x7DYb
         vJiti8V+kKp9wOyR41dWQc3npFNUW4g01hEIiq31NHsLSMTbYqBSe9Qw7+WttC7VIRpZ
         enKJXavoX3uy8DdJDn8fNo6LayUsqkLcJg6I57fqWfkz7GEdKjzciRqLuxd+G5eQsC7l
         2pgkmbw0Xg09R4k+pA/oynRO0Hr+yEW6SIUBTOep1RVjn878OM4QgK05/Wsd7ZcUD3Wz
         AOPA==
X-Forwarded-Encrypted: i=1; AJvYcCW/EZbkCLnKf4eevkTygjwin+FoiCaFOX/b117QyE/PMZ14OGI0gAms5Tcm0pE8eAPf6my2mze2BK4J2I6S2PdJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ47oUAptIZdDIuZ1BCibJaWe/Klfa32xwH+lgxZpg4VPQNf8J
	tfd6YY+A0/cEV4bFCbO6ZV3M2kcN89Se9/DQ03ES4lt5+sllAbcPN8Npcw0KokXtXM4=
X-Gm-Gg: ASbGnctGfqCd/qRODqZxChmEuQW6To1A8IWE4NleE28LVuECgpfFWeo1FKCR9SBqZNU
	iEN6MajW/jS/luitlXkbjbQi75AFP8xfaLBakVA2SZ6z+bTJdW6VVX8KH/tPia/PAXRyryjRuto
	YxiP+EH4MsHa7k+0DXsIhXbxY44hktjEH6Df3V7dL14I4dwfVG2eBNKd0BAu4mn/Z940p0eMGvy
	9jncpHtKyAkEPSkKUxZTZpcSLigMw6JIDJJbtc+CPaBtEJT05Jx0rUpJO0NpaqTGFfrZjSkR+h9
	JFpwxS0VBbFD1Epzkm+KoogieE9u09TBBMoV+pM+fRALp5QLzYC7GKq5Sgtzdo/c/mo98DsndHH
	KzZknL+WraujuL/HDBpIsKy+gCm0cXqN0j2XlTRjkQLVgrs3FkROBZVCKxSgrse56ajkP6nW9qR
	o=
X-Google-Smtp-Source: AGHT+IHPDW4Qxib/c3fl/QvNCJB64Z5YGN/d1oTyw+2Hx0fudTx9zXp/j1zq+pONC9zrU1nldBcONA==
X-Received: by 2002:a05:6402:22cc:b0:618:534:550a with SMTP id 4fb4d7f45d1cf-6186c000f03mr916573a12.24.1755065033114;
        Tue, 12 Aug 2025 23:03:53 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:03:52 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
Date: Wed, 13 Aug 2025 08:02:51 +0200
Message-ID: <20250813060339.2977604-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_230354_875709_1373BE53 
X-CRM114-Status: GOOD (  11.23  )
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

Export the dma-buf heap functions to allow them to be used by the OP-TEE
driver. The OP-TEE driver wants to register and manage specific secure
DMA heaps with it.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0



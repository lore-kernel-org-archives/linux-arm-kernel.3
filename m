Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA3D59D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjtjqxP7XdUENHCexmCRFp1dqpJh3fEH6pKkpxM/TLo=; b=sbrHgmoESmXL1DAPNtFWWjOLPv
	JBp34s1RMUkFDx1EOssUHK3spACZe+KxPIoVFlftAMfwJlcoIWv5kYHGhi0dWoaJxFlR2gcYoiaAc
	6g4D7KtYKeMYu88I6TAm3CZhuy63ccWUvSm2A4b+Pp+DlsKTTckLjJH/1hJtdRiVyJ7CbCApTLI5S
	gn59PG58MtBCbLJPL20b+uSOuB7v/mCfdqA3H6V9VadvqI9mNIZZYE9k8axnUNkSQbO+Hkzv9FWfn
	+5tCi/P3AG5o66KoSqdtmv9UHHnzwlggKyuoUPGBGdHL4tBCJKFT6GhCEYQBBLBYMjZbO6X+rl2Eg
	pnsoaCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA6f-00000001549-0Gey;
	Fri, 12 Dec 2025 20:51:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA6c-0000000153p-2QIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:51:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7636c96b9aso268894866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 12:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765572673; x=1766177473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjtjqxP7XdUENHCexmCRFp1dqpJh3fEH6pKkpxM/TLo=;
        b=CgPIekOZCY+4P4W1sTbzhEJJOpCo3QCcKMuWkMHp+PXNvnk8dIJ9OSDuwF6qKQqkJO
         m4EQ+eovQIGfXzlNuT2FA60og6v/0rNER54OVGT5eRL79Fgc4VMjjqYVUyymh4eHn9Hp
         6a83TI1jY2xiWsULscPqCGpiJe/Zs18F96P/3Rh3SOVAcla06vVQI+LAv0qkADvvzsWr
         5m8xln22Nlgv96rPzI2tbSQmnm22j0OZn48jxKPytZP3NITxIHbNKclaq0n/vG83qJ58
         ScGXgGI2v6YOk+LxlxYPYDY+fcvLpwdXbmAJccZzyIppzTX7FC4J4DfiEatTtdji4PGa
         2tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765572673; x=1766177473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjtjqxP7XdUENHCexmCRFp1dqpJh3fEH6pKkpxM/TLo=;
        b=mcsJzjcaSK9S4poS2XobD1bRzFL27l2zqIqS7DFPiocgD3bu9kTepxMW8COUT3ebzM
         A5o/mnEEP06rhDXn59ylj6DM4HCGJYedF2z4DoOmo2ijdYVWQYSiaIksWCaq6WU/w8Je
         pWCjXUXDPP62Hnv53daWe0V6QOG0aiLLUidqiOFWrUlaRNGedEiDxd4sJmDndQwCCIFv
         N9OovdMipzJIdtmrPcCLIVibaNZv97p9jeCRM5uwAj0GZvGILz2f5JMbbcPYLD+6TsQ8
         JmipXgUuTX28lSSQgAYFVPOMLKKUl/t7qGZaIokly34gzan5yBqzVf8K0IydO+HyETkS
         UJAA==
X-Forwarded-Encrypted: i=1; AJvYcCVpISZwAExAfSwZz5JS4fY6EKFaa9YSYAIj578PGnGjfzHTYVTs5WrCtUh0UxecJK2c2zcglMK8RdPgh3DaoXjp@lists.infradead.org
X-Gm-Message-State: AOJu0YyehaUCjwJUL9I1OJH3d8JaPX8g661Q7A/c0jIwDtT9hwZt2p8O
	F+binQggsR/Gu5f8Es0G9NyjeTey20wp36CgSJ6u0eMp8r9jScb8zv2x
X-Gm-Gg: AY/fxX6N7APBRWTO+rYore3C+8nldOV4+4OpO+Yns7WF+vvvR6DQCh59hFC+tsvPd+L
	VMTEoUjvrpKuoExMX2RTSoZaYYvfpzUA//Ep7WG4kaSY4yVAgLGl7jshNFJRB2uXkmABGZYuDWe
	PpuIXw+N6YJL1AjKLWkbyji4zVCe8SUMWmPq+u/sa/Cc/1oWBIp90nNNDBB4YgHdo5f42tqOBHb
	GzV29ZlykrepuCJq73qMLHpzd+b4t2+wwevLIZzL+WAIzNwcwu+CunZXjgs3gTjBumawXR8DSqC
	qYGdsnQkeNbADT3ed3x3d7JU0PoVKtHgFjAOTZ3EGl+8m8JDwMNbKqVkgoIBZnEyBmPiPqJz0ii
	+YoYwFfhDzQx1lBNK5R+52Gi/GUSQgIlI1kcbOG7iqIT8fxuj4VyX2ef0NCKLLu3dHIKat0U/pM
	PaW1bRma6Vx2fjw/c=
X-Google-Smtp-Source: AGHT+IH0G8rGAjvaE42wch55hSIA5VimrXWt5TN/hh537MIqh383tSvfDzdlGbn8S/gXANm16as6JQ==
X-Received: by 2002:a17:907:2d93:b0:b73:7158:d9cd with SMTP id a640c23a62f3a-b7d23a22af7mr366919966b.52.1765572672256;
        Fri, 12 Dec 2025 12:51:12 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:1401:37b6:6a29:b0c5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa570167sm656400366b.57.2025.12.12.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 12:51:11 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] dmaengine: sun4i: fix resource leak on promise allocation failure
Date: Fri, 12 Dec 2025 21:50:22 +0100
Message-ID: <20251212205022.83482-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_125114_657793_E950A423 
X-CRM114-Status: GOOD (  10.66  )
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

When promise allocation fails in sun4i_dma_prep_dma_cyclic() or
sun4i_dma_prep_slave_sg(), the contract and already-allocated promises
are not freed, causing a resource leak.

Fix this by calling sun4i_dma_free_contract() to properly clean up
all resources before returning NULL on allocation failure.

This addresses the TODO comments that asked whether we should free
everything on error.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/dma/sun4i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 00d2fd38d17f..d81e705ae91f 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -861,7 +861,7 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 							plength, sconfig, dir);
 
 		if (!promise) {
-			/* TODO: should we free everything? */
+			sun4i_dma_free_contract(&contract->vd);
 			return NULL;
 		}
 		promise->cfg |= endpoints;
@@ -954,8 +954,10 @@ sun4i_dma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 							sg_dma_len(sg),
 							sconfig, dir);
 
-		if (!promise)
-			return NULL; /* TODO: should we free everything? */
+		if (!promise) {
+			sun4i_dma_free_contract(&contract->vd);
+			return NULL;
+		}
 
 		promise->cfg |= endpoints;
 		promise->para = para;
-- 
2.43.0



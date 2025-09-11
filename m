Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4590DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMt0VPE9nsvTEazWH1lgiwsk3x9NY1aluOH28YbXegk=; b=hEkDVvxUi9blmWDPWnHegBSWyu
	HkVN/yCj4c1WkTl6ifdj2Zk0ak1jDz7QmBwSLj1++w6nKtg9BeBg73z84QqfysDn6RZetpSX00Pzo
	efqvCfdxG2TEUzcri4AemSkxXt51iVMg8cFjQAT3K3soco6u97howK0V/T+Cf385fpEFNtaL19ONf
	dZWFqdjUsTZ00+ky9F1ynVGPsu1JwAFVsbKn1TRml+kpgqHWCFtlF+yTMTlyRGSTKMW6QXPHLtTOd
	dCPiZVunO5tXSciKnNP4kUIW1TnZoDz8SZkMrAOcO/oyRdwqZK33PcDwaY1J1nMGmHrjH4/KKX5Pq
	g9jZxfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhh0-00000003M3p-129P;
	Thu, 11 Sep 2025 13:50:30 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgx-00000003M05-0ujP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:28 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71d603a269cso5569777b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598626; x=1758203426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMt0VPE9nsvTEazWH1lgiwsk3x9NY1aluOH28YbXegk=;
        b=La86Si9Qa3keCy/comjXk0k6OdaMGj/S8GzBVS6/uCSs1K3B6tTCCYyik2kZp2W4Tw
         97xhZ8UU4yIGy5uoWk+XGdCQk/PKiWaEegYeTXgS7JdT/theP7c+WS6RS3afJEC569Hb
         OWoVNFa+3Ggy2xMuc4gKy277AiPY72/xNdhmsNzxN+34L0asA0lS0iDFR3pBGGLKdFWb
         BdYPmAD/uKKjoYaqaZgt78L+Sf8BB+3xcvmnz0xiHLmXRnNpsPyEcm2Ifd9h3zFqX9ag
         sTwSurFb7v9s6v12RTddvNieIgOqPOJna8xDTywqU57hC/poOgw6dBxzOWy6EA6o/sqQ
         6eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598626; x=1758203426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMt0VPE9nsvTEazWH1lgiwsk3x9NY1aluOH28YbXegk=;
        b=WdSrrPZX7n27YqLmh5wdGKxP6SuAwAllgQ4HNOgCT90+wRTtjkRo5ApHAXFirWkvWY
         h2YcXN0IoZuXG0ClM41FrOZTnxwvCxwfikrBEZ4KSgastgo97uwGL2UVDcQPwsCR7QF8
         cJeHTXWdsVpwDGYG6IUIaHtLoWjCoxJs0b1vdbiJi8LYBIZfhue/64ToYSxuDuk+KrGR
         DKHuexDw5gqsWXxLk4dApe7cGRJuSbxSYXUgHLNPRs7/kDf96YK6ccfSbaikWwNwwozN
         g/D4W70NC1qvEGuAIq2u1SIH297bbmXEq/t5w/T+Z7kVIJllxw22aQAtsaiGkPnNsYAW
         JzpA==
X-Forwarded-Encrypted: i=1; AJvYcCW7CjsifoUcRbjiJ8Fx613QidL3pk+tdHHKqVyo4OLPTFs4fuE+nkbIV/CTjJqYdJoVH1fgWpKA8AbTCdXRaTQx@lists.infradead.org
X-Gm-Message-State: AOJu0YyxZcuY5FY88IRLJgQkcLZdZR23tBCZWmfC+I7ECruudNk0cbvQ
	oMbhfhQSqtOy7CuYqqb+feozJG6Ph/z8rdS/R1QZf6r4VrOoRZ0l3xUoFng825XYUGY=
X-Gm-Gg: ASbGnct3m9C6lg4o86QpgLOvYLcPgVByWY2ena3qa7DKqtN+gFFOCeH3iEX4XfnJmGa
	i6BOY7h6udkXcBK2zbk3kZ+6z2lB+w6GZfHX/d/yQCBVo+GdZeKtZjpRxrayKuv9a91qftvFaGy
	T3SMssz//+B/6AOq70J2n+DSdo3lMlQ1Rr8LUXzkRPVkniwfwcbDNzewQlvE1N8URtlbsslRAar
	51ic6ZuMRsloQRsTZgXaR2602+vaI6lurCvdNUvPtxynUUQda5Jhi6Xg+y1rhCya7AzCS9GOVkx
	2KlYoaTycXOCUxhhPcIaf4hcauMJEQsnImw2bSKmL3QB7/mIa4eXEaz4FzgACVDwNYDkjt20sGd
	DSeokAQnZ90t9sduHfw9tAILJn4UJjWh00REVu0DJfem/mFBn69yvakQrWQ28/trosGN3Xs1TEm
	0=
X-Google-Smtp-Source: AGHT+IG0oRMoou++RsxpxUsUtwpzC5AT+90eCVdw6DARCJFWQoizSSi/Z2eS8ssSBxttr2gzHNfb5w==
X-Received: by 2002:a05:690c:7506:b0:72a:6e48:d7a9 with SMTP id 00721157ae682-72a6e49273amr160447507b3.10.1757598625802;
        Thu, 11 Sep 2025 06:50:25 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:24 -0700 (PDT)
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
Subject: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Date: Thu, 11 Sep 2025 15:49:43 +0200
Message-ID: <20250911135007.1275833-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065027_268698_6B5B1DCC 
X-CRM114-Status: GOOD (  11.76  )
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..8ab49924f8b7 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -11,6 +11,7 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/list.h>
 #include <linux/nospec.h>
 #include <linux/syscalls.h>
@@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0



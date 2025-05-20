Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C335C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=; b=k3KTIQ0g8Dp1xpu2H9iRbLdIFM
	5dUpzwHCMRjus7kuDBf+uqY0acCC/xx/KrWHHT1tP0bJ+fq33sE6uWgH4cpG9fygNcZZ+UEbxBxP9
	GM6Sgz7mbyZU4XuojnXX2e322wzOns3oXE8OgyxPeR8HkISuvKlcLhbOlEEVg7oMZth/ly9TvNlf3
	wSV8goexdfyj/5pze2yqw7ND1omc/o6p74bOeEwHVOeMekMynumDASrpDwRchIigdNNvBQ/CkfyJY
	acLkbK9LOwWLxNygYNgFhaamJUhNJDre3ZPabnG22VVSBX6NGeG7ZE7Vc+wFc6k1ybhLJs/zXytQB
	NJcWrGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP28-0000000DNLH-3rdC;
	Tue, 20 May 2025 15:37:36 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOph-0000000DKKs-3WKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:24:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-60119cd50b6so6951357a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754684; x=1748359484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=MGkNclLJP19nAVTwwFFkvG+4zRGusaWBmpnzYPTKmQ2MUd+tTFHnoX7GjwRPp0mZai
         jdMM3w++dcdfY27ukJ9OxtLX9B1sAnIDhluIBiWaWY+cOFhnDhBdTIEXnJO1igZSGxva
         k68Zs5Nhjqb5a/iqd8lHtqRTaL9QB7FWiZ3ZvR5srhKQ0gTikascyS7GOTJ6v6KmrQO6
         v4xjCrjsG/+fG8muiQng2qGuEyFXsjjaTnfZ1wY4Aq9vElMmKUykbdjmNrkrSuvn5v4I
         DkHDuEN0e4lxJ7Y7yi/V4UBLZG+CcX7JRQwp5TPQ/i1hVFYAaX/JF6yuJ9s6ekkUlkrd
         cILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754684; x=1748359484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=JlRSJxoUj961fRFwq+pergB4Epy+3lse0Uq2bTZzDS4hNeO55vKHQemu2GvZezAHvs
         LoYG0/M2t1gw7A/ORKhUdMs2pzS0Hng27Gs/HRVSoXxpAYE98Z4wQUSAVr/2t5WThH6S
         vky2ISW4tVi590No5tenshHqjTbly8zJ2DIq6g2ezPH3yJ4DJGgnzfieU6ThwfZKAjPx
         WHWHjrKL0XembQKYgRIOETQvR3hfAqKg+80/tpKElxcxmzqHDfSQhVgUwqB3y2vcU1Hv
         NIvUtVKKBTlQWEllfoJogcDWKG+tbMQn6iB+XD/aVaUhkQzfIaGHJqidehRMdKDmrwtG
         JwnA==
X-Forwarded-Encrypted: i=1; AJvYcCVOiPIRxek4AUu+HhFNuenAV+mksPgWrC9O3xYvA/tiCCFwv6qvDjMK3lFDxeHjlD/57yJpJSvCbvZbKbdBwmQ/@lists.infradead.org
X-Gm-Message-State: AOJu0YwEg+sLZkGBc9+rER4PSytmz8yvw5LLxEukyCTDF5iimHPHjkJq
	TbweB9R1dofQgWnaGZzKSng25FUiSLz+U3tw08T7qoazNP430EMdDZxxqiAFIpIk7cQ=
X-Gm-Gg: ASbGncvRLJHz9g3heVIIhqy/MyraDXRLbRPQj829xXDMcCMNgIiNMLjvU1r14sVoWjx
	thp0UFotclpEwHE5ed722lgRBp+LmcYync83ia/kNeugyOYXDya7aA6kPyLDrwqD/zdPt2q23Mc
	tYU8+0w6si5HASOovCpHryfHUgDn2M5pv9w8y0W0GJaGIhvlrFgzWG3phT4sbb9QBaqnKRi0i/6
	zNLPOCcF4FV1Pv5PNvkDHb+tqj/S74BOEMpsQF9lfNIFrIfNd7KQDkE2KPth6uUQX62FTOLZY94
	6fyIyPqF7mP5CWVNoR/GtViQYPBsf4wyGfNcvtWx5zDDsirDoGbnbVFIASVLBsYj0bxtsbPDaK7
	483ow+d/ottsXOWnVfMxt2D9+F6HJ
X-Google-Smtp-Source: AGHT+IHJnNS8PsiFV8EVtrc16G9fq8ki6tRPk/s/IIABC/OTj/P3BcTFh9xpStaXrxgzCYdbyyVt2g==
X-Received: by 2002:a17:906:22d1:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad53055f81cmr1041003666b.34.1747754684274;
        Tue, 20 May 2025 08:24:44 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:43 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 20 May 2025 17:16:45 +0200
Message-ID: <20250520152436.474778-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082445_876576_681DEEFE 
X-CRM114-Status: UNSURE (   9.72  )
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

Export the dma-buf heap functions declared in <linux/dma-heap.h>.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
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



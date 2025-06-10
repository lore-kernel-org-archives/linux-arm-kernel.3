Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FCC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=; b=Va13nLuKaw1dYlVO0wImeZ8fs9
	J2Wq6l+qREA73OnhG49nm3NHdGvECt9e21luUNKqiJ5wP825eYSSRvTIXsz8uG/I5s0yk5RsRiVAQ
	Y13ArMkWuNd3HxUlXJXvoUZHXeAiriJuie22PZqNLRgvG0v+dX63ilwjmxxgTUzEKKhOjMsrRbbS3
	RYjwiFbulOo4NYGM4o6YQ24lg58y7RMc2PG9N7SN3g5as8lRvUiZ9EPsQg+bF950nDbe9D2586GhL
	hbq9R1YXu3+mQUM/9GCpD6j9wL/WOCdjREuzhADFCJq+/OLI7/hoIiQq3L8rWyksH4N0cCciiOQZX
	7GFsPBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1B4-00000007MuL-0Ssx;
	Tue, 10 Jun 2025 15:46:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOypq-00000006vRz-3gZd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:16:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-adb2e9fd208so1007520866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561373; x=1750166173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=ds9CmxK34MZ2xAyeychjp/B8UYTStcASMXhMo90xzKltwHV3rzjcsr1XZxzH1L+0Bn
         mG/WjUmQcqCoepyV//gPeFReO8ZqrPDcL5IVnB0A8a/aHFNTBiLaj00TLN8vd72koQvg
         cjbv/hnuYyiGlJVccVTk1HVP+uP1EVu2F+epdkiPkJH8Z0fsTIE/mq1fFEV71tRwL2TG
         ixy95K89+B3CSKuWhETJ0iVnvbPf6wiJatcPF9VTQhj+HMfq7iIl1VLYt8ib4cKfyggV
         p5PXOetcrl0wzN3k8fdVmmTaYQ9p4jIbX4a4fExz53nFFlQqmfzIxilH1+lPZo6yWQSC
         TJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561373; x=1750166173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=ri41ChkUYS16Ja7ZAm8zqVI6+RqD6e0SWzqSxvc0CZnzpVy5pd/v83GWk/4s4F2k0G
         fxCquLElWM3w5H3DNhDdeTbKK7Vimbo7jtBQPNfJCdg4J7diH8fUG8XQJ8PSEksLarfq
         ssv0gbMIpSMWfs1QFyNRBtfJM0XEeOm2BKFpMKbwPEB+HwfGarDd9+MtTwomEckghemX
         uXXcx8hiqw1aIUCssMunCnLv2chN0bweiIwpQIaFiDYUYb/snlovg2F1ng6QBAkU5Cme
         /GPGoKEGoLDJYO41B/Yibgw0zPaCFpBhGvRfWOh4r7tIM3kf8O3qlemoO3j3o/XEEG34
         xzGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbiic140HyxXaivJEEwyfpLx0KkI94SneB/v2kxk59kpoZusaNM5Wo9hdcEgnbAPRFi8lULl+LEndsdHwQ2UdT@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9N0ungIHFwKMXJiBYgRKRuzIoDwnvbBxe6gima3G1CZHfey9
	jtMHpH/y8j7LWTIZauabzJOarqcdasKDBICzBKuFro4Bv5hnFQ+fnaUcw+dXdq5TQ9A=
X-Gm-Gg: ASbGncvOYmOMcCqsP0TMNk/fESiCraX4V0cTBe1fjfzZCEEL5ExHBXw/turZYDqyCBB
	Nd/q23BXb+yUd6q1rgWMj87vkvuJXNBiZ1/BYX4ifoyuoiYIr4VjkPiWoDPg4Lqy5OQCq9q1ODQ
	bMabW0tOHt1V4v0u2ITuVjYsoJ5DYb+U6KLYL75m6u0lBbai0PcS9L90KuMsp+TmwJjJA0jTF1w
	7d/E671gGcM0rVFCN0c7fEf+OutByWWoe30IMnCMtoAwDBrSuPSzMhoAixY48v25wG0lTTLr8JU
	eg5MFipzJDmjMxBd2s7EBJMBUxdxqrD7j3RAnFCAGLHSBFZKeXCHiFL66iQ5kLHZUGN2E4Aayge
	Ps6oJIehIWXA8cGMoxAJyS8DZbMRFCBo/zvE5MlA=
X-Google-Smtp-Source: AGHT+IFOBF4P1tAbssgL5dehUIWLuQRa8S7VHpp+Y5ehx9RZ7YktqSDlhzjcJArhhbW8+ISbCVgNJQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-ade1aa0fbdbmr1346195566b.9.1749561373268;
        Tue, 10 Jun 2025 06:16:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:12 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 10 Jun 2025 15:13:46 +0200
Message-ID: <20250610131600.2972232-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_061614_913771_22D6C247 
X-CRM114-Status: GOOD (  10.95  )
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



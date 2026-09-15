Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7F5C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=; b=uEuGEh6G3J4OEF2SLM/DQLFz8D
	sEg0kxchFHIwozeNxSfzCRm29gWCAojAtJb2AmRGLXkjOiNhTY9GGbQmpCH6ZdUHeT/umscf0fvAz
	KlH2vQZAux350gNaMExhtFwh5DoEMHqC/sk1tSr4MC+ahUhy4vuadId4r3hIrDqiFDNy26nTzqgdr
	Ntj9OBu2TFZkA6xFT4L/sKxI3coIa6PAcqOaUHVLLB18tOUf/ZrHYca0XkX+7vbbAq2MB+VdUKLnM
	Kxbb18JujmhJyFZEe+jnwTsOhK4oWNak7ZqcqcbYvphfF8yLecrHU7qcrV78mss3QliwnjfHJ3F5y
	e5Gop2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SrX-00000006ekG-3EFM;
	Tue, 15 Sep 2026 13:06:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SrL-00000006ei0-3K0l
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 13:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=; b=gY8P93siZMNDSfIyzi3y6yLuuH
	cmUEcNs5WprZTuUHVnkb3TTecz7UcHuG0tUCw8CBXc8LNhVf7QsNeJblu6ZmTzEC5yAJddIea4L+6
	grrb4yM2n4vCeqiX8UeVSyRgp+XQyPRCJ28IqzIkLI3KeqKymyjHOONN/mRVe1LYUGKLarEbU8405
	guVkAyUB+ZrHpRAzx9+5428cx0f/kTCwdHXOgJ2gu6okp4cNld+YnuMOeqqR+yqJJ9Vig26+6s2B2
	mUS3TVL+5ReQdWaOG8ZghhWMZD/R+CCvEN2Y3UsxVtf6w1TS+1ljb5ftGetwFkn+FFlCq1gdzbHFA
	8a+9FHEA==;
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SrI-00000006n3m-3PdE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:06:02 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc88a9d1so130394fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477558; x=1790082358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=;
        b=QTEE198ip1VuuEW9pk03Q/Y+jzblrXf/yDvu5PZAi3yOEbDMgHiQ8mMoK4qS7vanj+
         GMUJSXmIFsYdOYe8+nQhCm2q80ZkBuJblYw9BC1HcWaYyvcLuPTMacCVfOrj/rgPfQby
         VzFN+6q8mUUmTH7hUDKL0mxawN183z0d2xmYg0IOH+ZdRPi6GHD/nfFrU++ulnJN6FnG
         vzC0q5QzKxbmQN/FUwAOw47m14BhQ4dE0w1mpUzGrdAHUY6URl3m4FGhw3r3I96v17JZ
         JrFbOVHkSuQ0OTDmlKrqHAZDiR/0Wh6dMF5stL0kknRmvGn27373yeHM+psduqpZ+Fbr
         lBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477558; x=1790082358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLVpuIWDh64oOKbkDCist7rvO7Pgf4HJPnHhedxrwCU=;
        b=o0uDoyzRGmbv1Fm1znBPwznKfEpIb1K323MOrhW5l5yhqqtUD0SEI+PkrP6eazB5Gr
         sq0otZCwM8tcycUOacYCejcH0bNvE5g0qdpT+o42SB0tJE9zRA+eN7zCFI8xkuicruP3
         rCF4oiWyiBw49bCt3DlxrOKW9/pqkHLC7m4IYS3MAb61cD9nhdciNmPNXneSG8gerat6
         8EqEJy5x73ojqMR5M1wVyOpkG34jMvpnjcvdFVkQgehVS4hVMZLF+EI4ipFiAB3FUFw4
         0nMb04kxJ/hQ++uhBqKSaiOdh5x+YxjjsmD9puZlJQ+7ixK1gR9WeRUVUf7cUhiqNGgl
         hZsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFe9G1BrqeWXGtatxOvqvnBt7/3gxv9QBwPSzVV3gEsXcBu+Albk7zSX505hu28nk3DIE/VS0ZqQ14qw+YKEEu@lists.infradead.org
X-Gm-Message-State: AFuF++mdNo5fSIkjtUy+P/ORNgPsBA4iNMXe/1GDFNGQZeXM7dinUsxH
	lFkW8c47KTb+jnJv+4Bn4e5JVq/INUq7yeWfTLt8nFsY4kRgmNeEEG6g
X-Gm-Gg: AYBFou02SSh0d1hycJSPrr9Wons/8TJdnN1aLsuyHu+CNiyHue7Na3TJQZYpY6ZocF7
	rFPIltn/tvdnf4SzA32hT2YrxzUpcq2o/meH8oXwW3yorCF5QBWBUetzk0vYwfAgfVxUSIq5FCV
	gFx3G9zi552y4R1QIqc1V9St75F2HgoOwi5BnicVeMpvVdLzz31gSiJvzUZU4z7AtFnvGudmxxO
	at3p1armKaSwTI9ZHJ82luIZ/+1QuYVGjSLXJWJP3GOsLu49Hv3PeCN8mWMWTmXUsc+e8JH8EZo
	grWSEybz41C25g9nXpuCvyThc90jRh4lhOLVaBQdqumCna2qc7jBmKe4xghN/6Ik8ECIPIByzmz
	jaNS9q8WwyhkDBE0F2hdv3CRfjF6jN6//GN+UmtArkYcQBJyN/0gjab2GkF/+CrpzezsTHZuWXQ
	MTKRqrjottCZRpi9R1FXVCZg0/I5mVVP7dB9WVlAhtW8bL3ZmjV8HQlnHv1t9l+lIGLhlsP+aOV
	VB1PaymTwLCtAst
X-Received: by 2002:a05:6820:4b89:b0:6c1:7804:55ec with SMTP id 006d021491bc7-6c738db76c7mr560877eaf.44.1789477558330;
        Tue, 15 Sep 2026 06:05:58 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf11e6af6sm1299889eec.3.2026.09.15.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:05:56 -0700 (PDT)
From: NoNine <chenmin83@gmail.com>
X-Google-Original-From: NoNine <min.chen@siengine.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Tue, 15 Sep 2026 21:05:03 +0800
Message-ID: <20260915130503.645953-2-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915130503.645953-1-min.chen@siengine.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_140601_000977_30622531 
X-CRM114-Status: GOOD (  19.72  )
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

From: Min Chen <min.chen@siengine.com>

The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
with CPU stores.  The DMA API requires the caller to sync the buffer for
the device before the device writes into it, but the TMC driver only
ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
is therefore still dirty in cache when the ETR starts writing, and its
write-back lands on top of the trace data.

Add a sync_for_device() buffer operation and call it from
__tmc_etr_enable_hw() just before the TMC is enabled.  Only the flat
buffer implements it.  The ETR_SG and CATU data pages are synced by
dma_map_page() when they are allocated; their remaining corner case, a
barrier packet followed by a live-drain re-arm, is left for a separate
change.

Tested on an AD1000 EVB: five first windows on freshly allocated
buffers, including the first capture of a boot, all without the
previous all-zero-formatter-frame runs.

Signed-off-by: Min Chen <min.chen@siengine.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb2..bf1d6c6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -689,10 +689,29 @@ static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
 	return len;
 }
 
+/*
+ * tmc_etr_sync_flat_buf_for_device: Drop any CPU cache lines over the trace
+ * buffer before the ETR is allowed to write into it.  The buffer is allocated
+ * with dma_alloc_noncoherent(), which zeroes it with CPU stores, and the DMA
+ * API requires a sync for the device before the device writes into the
+ * memory.  Without it a non-coherent sink writes into memory while the zero
+ * fill is still dirty in cache, and the write-back lands on top of the trace
+ * data.
+ */
+static void tmc_etr_sync_flat_buf_for_device(struct etr_buf *etr_buf)
+{
+	struct etr_flat_buf *flat_buf = etr_buf->private;
+	struct device *real_dev = flat_buf->dev->parent;
+
+	dma_sync_single_for_device(real_dev, flat_buf->daddr, etr_buf->size,
+				   DMA_FROM_DEVICE);
+}
+
 static const struct etr_buf_operations etr_flat_buf_ops = {
 	.alloc = tmc_etr_alloc_flat_buf,
 	.free = tmc_etr_free_flat_buf,
 	.sync = tmc_etr_sync_flat_buf,
+	.sync_for_device = tmc_etr_sync_flat_buf_for_device,
 	.get_data = tmc_etr_get_data_flat_buf,
 };
 
@@ -1113,6 +1132,16 @@ static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
 	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 
 	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
+
+	/*
+	 * Hand the buffer over in a state the device can write into: drop
+	 * any dirty CPU cache lines first, or they get written back over
+	 * the trace data the ETR produces.  Only the flat buffer needs
+	 * this; the ETR_SG and CATU data pages are synced by
+	 * dma_map_page() when they are allocated.
+	 */
+	if (etr_buf->ops->sync_for_device)
+		etr_buf->ops->sync_for_device(etr_buf);
 	tmc_enable_hw(drvdata);
 
 	CS_LOCK(drvdata->base);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27..3dd17da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -277,6 +277,7 @@ struct etr_buf_operations {
 	int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
 		     int node, void **pages);
 	void (*sync)(struct etr_buf *etr_buf, u64 rrp, u64 rwp);
+	void (*sync_for_device)(struct etr_buf *etr_buf);
 	ssize_t (*get_data)(struct etr_buf *etr_buf, u64 offset, size_t len,
 			    char **bufpp);
 	void (*free)(struct etr_buf *etr_buf);
-- 
2.34.1


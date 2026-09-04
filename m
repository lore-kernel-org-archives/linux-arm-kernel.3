Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A88C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dq3xIFAwlAvi1lAvXdnWkfquBwSLlnUJa21+MBQhYcc=; b=UZ8zJyEOlTGrTkZDX2WiL/8ctF
	JY7a017pG/gM9Awdq0hO0X2KbUxMi8W7yxO/O8XbBAPTB31ZKN+Es5ZlMNNXeQsje1mTtSbIWOU7u
	ssNW3SAC0Sd5Io2Pa9F4v2QWxQVcDCX5MEDu+/DpXh6tpz0g8ecXRKMHfjL/pxAapMTCQ2wUFlDXy
	g1MnesCVsbq30XDETm+BtUUIALlcru/dvpBjbbY7IVrOJmqq2v9pVzK/zFVLcvY0uuszrl2hjPyZ6
	eg+bSUkqxR0UoaZDZl5E2Mqj/Yzbrr188NLf6pc1Arcwi8qqlcszNXv8POkbvIDYw4x9kv/dUV8bW
	RFiXTVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rp2-00000001mog-1vbl;
	Fri, 04 Sep 2026 11:11:04 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rp0-00000001mo4-2XkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:11:03 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7ee4399c3abso851915a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520261; x=1789125061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dq3xIFAwlAvi1lAvXdnWkfquBwSLlnUJa21+MBQhYcc=;
        b=SW5Nk4CopVB19EBl7NCAKs7Cudo13QAaGFrOiVETpo0vrA1K7TcakG+BooLux0evx+
         KUPcmX3sqH0JnnJhQ0EDYdX4scVI7uLginDlaak876UPl2QsO6x4EZt5k1dhxQHdCmLE
         y8xLrkK20h3udF4V0SiGkY0oFh9TlSoWj2/kP0F8a/yakk73GRzfvRVXcG1u7xOthnG5
         k6f8Za4T5lhwlskWhwiw0FH+Dia7sklJBmZ/6EYub/cWpTLjFuO42YUvcDPW1uTHT5bC
         C1EygfI71L61Bx5eBRuGTpAD0oQkUQoDGMjijH3of+cox+Jh2P8fKCsPHn6V9upxPm9V
         Zyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520261; x=1789125061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dq3xIFAwlAvi1lAvXdnWkfquBwSLlnUJa21+MBQhYcc=;
        b=tXfLJnbq5juCldADudOj4Uf8hCyMOytggoK4ytAiUdmE7B3KOsPzNUAmLCNgymSrjl
         RIlWVZRp4rqJ9jgb22/+cYPm6s7mxgJQMTr8bxLyMRMczNsX3O+kXyW0Iojpr3jmj8wS
         S9nU7xVEWVRY+P7ythzTto/dMxf+drMoJNs6JHmt+FCobsSaL2/vp9Y9wj9oVD4OqbwK
         hRL16+MAjJgHOSZugJsY47ORGzDONLJMj4ik+1OBSliZnpVPuc2izbuoZ2CdXrw1wyB3
         NL6eZQvQTDTfczg0jhUlTbp2JEPPSubEF3ODX55kr7nqNJMam0Gf85mXLaUc9i9J2mEE
         fsWw==
X-Forwarded-Encrypted: i=1; AKwUvBxkmpOajtHyk9MfXamUH4wG/B1upofsiXDJq9R8abGCm1c+4jtIeNuqqCzhvauuOSxzdOM0mthGLn4Fa2Vxfh29@lists.infradead.org
X-Gm-Message-State: AFuF++mRfG1u2C+Sf+0awJYGqhg6OFRHNPhHG1GJGZsl/3fYETfrnlmd
	PwKHMIsNI1sNQQSfu1jgnyVTmeug4wJ7l2zU3BM5M8MO8mdZo50ewq7G
X-Gm-Gg: AYBFou34yyA2BRgynY/O1Bv2vrA9/wsAHUnklt6OB38ftN5qztTp2PGBjdYuUmk37uf
	gevLvWwtuhqnrnQn1fCf+/lPvnfakCwfpqFFjs7pPHEI7Itz9ufR/JHEF5dMmtsmbS6jTkzKQIV
	yVmVHUOvIZW+Lwp5zujVFlJloc2UnoZG2WD/ybAI4+TphS+FkR4UuUzcOh/AXysu+qss660IgYq
	bgasT2Q+qNUkMXG6XqdxL1XBmQ1O289PjMQMbYnZU1FEgLXRrZxQWOI+Ln4zjuIjj+qujOuHjfl
	mNh7u0QW5RWe9S9tn0mM4UDxF6Tjdj63rT+y7u1yTAfeFE9LRpYQe0TT/x/r8Qfyxz/zfFJ4JAw
	LlPZ4t9ie+CwhMiKehHcs0buTX2IIW9dORxhcgLDTFdggm5Fnu51GdhuYdl/1BXZoGNr8sSD3SZ
	cjnmxIQjyvSIx8wMr9WrLUe5KIdpl0dhAq5fXGo2v5xqMbkRr34kWBlbwM7VGCNBGjdWilnSU9Q
	ozofiEltGXRvc8=
X-Received: by 2002:a05:6820:809:b0:6b7:83c5:fde9 with SMTP id 006d021491bc7-6b783c6033amr1310183eaf.42.1788520261294;
        Fri, 04 Sep 2026 04:11:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm8761646c88.2.2026.09.04.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:11:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] coresight: fix typos in comments
Date: Fri,  4 Sep 2026 16:40:51 +0530
Message-ID: <20260904111054.22485-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041102_654925_047B41EB 
X-CRM114-Status: GOOD (  21.90  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 6 +++---
 drivers/hwtracing/coresight/coresight-core.c       | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       | 2 +-
 include/linux/coresight.h                          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..59932f23b6ee 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -45,7 +45,7 @@ struct catu_etr_buf {
  *	------------------------------------
  *
  * Where bit[0] V indicates if the address is valid or not.
- * Each 4K table pages have upto 256 data page pointers, taking upto 2K
+ * Each 4K table pages have up to 256 data page pointers, taking up to 2K
  * size. There are two Link pointers, pointing to the previous and next
  * table pages respectively at the end of the 4K page. (i.e, entry 510
  * and 511).
@@ -202,7 +202,7 @@ catu_populate_table(struct tmc_sg_table *catu_table)
 		/*
 		 * The @offset is always 1M aligned here and we have an
 		 * empty table @table_ptr to fill. Each table can address
-		 * upto 1MB data buffer. The last table may have fewer
+		 * up to 1MB data buffer. The last table may have fewer
 		 * entries if the buffer size is not aligned.
 		 */
 		table_end = (offset + SZ_1M) < buf_size ?
@@ -263,7 +263,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
 	struct tmc_sg_table *catu_table;
 
 	/*
-	 * Each table can address upto 1MB and we can have
+	 * Each table can address up to 1MB and we can have
 	 * CATU_PAGES_PER_SYSPAGE tables in a system page.
 	 */
 	nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..bcc655933d35 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -200,7 +200,7 @@ struct coresight_device *coresight_get_source(struct coresight_path *path)
  * @src:	The source device of the trace path
  * @conn:	The connection of one outport
  *
- * Return false if the connection doesn't have a source binded or source of the
+ * Return false if the connection doesn't have a source bound or source of the
  * path matches the source binds to connection.
  */
 static bool coresight_blocks_source(struct coresight_device *src,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..8182a8298306 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -338,7 +338,7 @@ static void etm4_hisi_config_core_commit(bool enable)
 	 * bit 12 and 13 of HISI_HIP08_CORE_COMMIT_REG are used together
 	 * to set core-commit, 2'b00 means cpu is at full speed, 2'b01,
 	 * 2'b10, 2'b11 mean reduce pipeline speed, and 2'b01 means level-1
-	 * speed(minimun value). So bit 12 and 13 should be cleared together.
+	 * speed(minimum value). So bit 12 and 13 should be cleared together.
 	 */
 	val = read_sysreg_s(HISI_HIP08_CORE_COMMIT_REG);
 	val &= ~HISI_HIP08_CORE_COMMIT_MASK;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..91fc18947eb1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(tmc_alloc_sg_table);
 
 /*
  * tmc_sg_table_sync_data_range: Sync the data buffer written
- * by the device from @offset upto a @size bytes.
+ * by the device from @offset up to a @size bytes.
  */
 void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
 				  u64 offset, u64 size)
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2de..fc1a27c5a436 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -706,7 +706,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * wrapped and should be treated as limit.
 	 *
 	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
-	 * it may write upto 64bytes beyond the "LIMIT". The driver already
+	 * it may write up to 64bytes beyond the "LIMIT". The driver already
 	 * keeps a valid page next to the LIMIT and we could potentially
 	 * consume the trace data that may have been collected there. But we
 	 * cannot be really sure it is available, and the TRBPTR may not
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970e34..2137bc18ff93 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -320,7 +320,7 @@ struct coresight_device {
  * @nr_idx:		Number of entries already allocated.
  * @pfx:		Prefix pattern for device name.
  * @fwnode_list:	Array of fwnode_handles associated with each allocated
- *			index, upto nr_idx entries.
+ *			index, up to nr_idx entries.
  */
 struct coresight_dev_list {
 	struct list_head	node;
-- 
2.48.1



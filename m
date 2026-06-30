Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMc7IH1jEIo7aTQO6+OKWeTUOGgdg0YUEMVyYCucVMQ=; b=G6j/FRKNdcpnIoR6RHH10pYjEY
	03yQtfnHn15VHyRRW3siXwKhkQnaotIQqYFgbW9Gpb6ZkspIrBBJLZKSexpR9l+oDFlkFUw9HK7se
	nZApC8/ypzrpybcYuXkGRG4NnUNdEecV540nOk1h5B4rnyhBtHPpzGoPoBzmCjjzWRiAGLuOTejD0
	ChpPCmZ7V4SCNL0T806ZHOrBib+D5JBpSdpucf9rW5JQzjrEZ2uHDKV6To3alO859N6xH5QsdLLpo
	uXABfQo1WrS6ZkYwRId/wCBTOwKA5xMRaFpHQ9r8uXiI5h7WwfL1GFNQurMlQ+sNG3XFO9yCWiVkC
	N0ZC5ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVat-0000000GcIK-1Skc;
	Tue, 30 Jun 2026 10:21:31 +0000
Received: from mail-lj1-x24a.google.com ([2a00:1450:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVan-0000000GcF7-2psY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:26 +0000
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-399919e637bso22664581fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814883; x=1783419683; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kMc7IH1jEIo7aTQO6+OKWeTUOGgdg0YUEMVyYCucVMQ=;
        b=jdmvTpOe6Tb6VV6jHKWkdL3TJQmyD9c+YHPglCGV6UZ5o7S9uM2NAplAQhuILr73KK
         mj2F3qCf+QD+iwYBuDdh3LrlBIenRriRMP2bTFgiSo/0iwPimo/KEZmWYouBAQA4e6ib
         k944OC8s4Ym394mlOiXJsAwYUgHSbH+9JZz8XkIHQpFypXOeQnMGNDxxJtuW8G5QnUH2
         LeYoaERGN35QK5Ugc0yLbsUJmV0yDEHtgGfuHCm6XzE8GktIrsCQK/9XvyneNwPpdHcs
         qfaeC59U0QGtYbDcp92Q5sF20iKVnivGXxrLT/nwYtTHmYNreSbyGa9/2fUdppTWxwRJ
         pMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814883; x=1783419683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMc7IH1jEIo7aTQO6+OKWeTUOGgdg0YUEMVyYCucVMQ=;
        b=WKjEEQmaGl9v4R4EbIOoMT9pi6oumjvA3sRDuhoMJQX+ddyipNeRS1EDnIU1cGqeJb
         wDGO2RmVQ9YaGGvMt0LNlgU8QfZOZVMMWFVPBZVbippp5w6Zj+h9ciwWJbTTF8PWhcs/
         PYQ7qdJmJSHVgL2Cx7+oMt64WcpGNMyfobVhA3+sq+s25cp8VAVOyKKL+BOiPpo+Ahyz
         694wKX4sxu8wr9gHVtoQB2we2z3GFAEbRb888PAMm+iWSvz1QxTQJ3B0yhk+zoHuERsb
         dZJ0ZIWLKp/hXgvHmDGCBR8nE/YZAiVavdmjkWItviiCCeVripNDjmoMmmegYquK0Y6g
         NE+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3DoCEIlO2f1kR8xkL9I0dVr/i5XqYoYOML9wZlJDmHQfddLN3MFNBI/2tpShIaexwZF1S4r0axpktmP8a4k/f@lists.infradead.org
X-Gm-Message-State: AOJu0YwwDItm+odx2fYgg6h6NFE8u6D6zEu4yuMcO6mlohmqRb2eV+K4
	RiYvGB8ZAJovjoqmc9U/s8jtCOszJa6INPkZ8gggfVoUXALwLvutGWOQKbtxJQdP38Rwe/puu82
	37p0ZbberSADHmoMEwzzvp06n/xk6ZA==
X-Received: from ljvg16-n1.prod.google.com ([2002:a05:651c:2550:10b0:39b:23be:9b9d])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:651c:1603:b0:39b:f64:1af3 with SMTP id 38308e7fff4ca-39b28d2233fmr386661fa.8.1782814882959;
 Tue, 30 Jun 2026 03:21:22 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:55 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-4-sebastianene@google.com>
Subject: [PATCH v8 2/6] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_032125_735710_41BCCD98 
X-CRM114-Status: GOOD (  13.40  )
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

Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
memory access array and to comply with the FF-A spec instead of defaulting
to `sizeof(struct ffa_mem_region)`.
This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
flow.
Also, add sanity checks to ensure the calculated descriptor offsets do not
exceed `max_fragsize`.

Fixes: 113580530ee7 ("firmware: arm_ffa: Update memory descriptor to support v1.1 format")
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 20 +++++++++++++++-----
 include/linux/arm_ffa.h           |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 01301213896a..7c1b747797b4 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -713,19 +713,30 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	struct ffa_composite_mem_region *composite;
 	struct ffa_mem_region_addr_range *constituents;
 	struct ffa_mem_region_attributes *ep_mem_access;
-	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
+	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
+	u32 emad_end, emad_size = ffa_emad_size_get(drv_info->version);
 
 	mem_region->tag = args->tag;
 	mem_region->flags = args->flags;
 	mem_region->sender_id = drv_info->vm_id;
 	mem_region->attributes = ffa_memory_attributes_get(func_id);
+
+	ffa_mem_region_additional_setup(drv_info->version, mem_region);
 	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
 					       drv_info->version);
+	if (composite_offset + sizeof(*composite) > max_fragsize)
+		return -ENXIO;
 
 	for (idx = 0; idx < args->nattrs; idx++) {
-		ep_mem_access = buffer +
-			ffa_mem_desc_offset(buffer, idx, drv_info->version);
-		memset(ep_mem_access, 0, ffa_emad_size_get(drv_info->version));
+		ep_offset = ffa_mem_desc_offset(buffer, idx, drv_info->version);
+		if (check_add_overflow(ep_offset, emad_size, &emad_end))
+			return -ENXIO;
+
+		if (emad_end > max_fragsize)
+			return -ENXIO;
+
+		ep_mem_access = buffer + ep_offset;
+		memset(ep_mem_access, 0, emad_size);
 		ep_mem_access->receiver = args->attrs[idx].receiver;
 		ep_mem_access->attrs = args->attrs[idx].attrs;
 		ep_mem_access->composite_off = composite_offset;
@@ -735,7 +746,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	}
 	mem_region->handle = 0;
 	mem_region->ep_count = args->nattrs;
-	ffa_mem_region_additional_setup(drv_info->version, mem_region);
 
 	composite = buffer + composite_offset;
 	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 17eca3dfc59e..033c630b271b 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
 	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
 		offset += offsetof(struct ffa_mem_region, ep_mem_offset);
 	else
-		offset += sizeof(struct ffa_mem_region);
+		offset += buf->ep_mem_offset;
 
 	return offset;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog



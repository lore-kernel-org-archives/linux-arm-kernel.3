Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6364CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6pS+fRCyL3l4ecLcUFyDog+3129i4iHhu9NlGGm/nY=; b=desFPmuXfnNPswwqWu6+t5s94F
	ucVaTlDP8ut+iaX4IuQLm8jSUSO8fACO5tDj1fvalFmJGMF9bw+SxSa35zza4EpltwT+33JlxSJxm
	Z+2jVYLF7Xt5iazJQZOOSunybqxHLX0/fGLHjPse54CQZjlZhJ7FPCOKqxvJx0bIWdF51/wElqtW6
	/xXdDXdsBYgxKWO9dLaTKbR4gIS32K2aBJ7hcBtNXQfQ+eQVnes1fyai435dQs6qgKfP1gG1D4IXG
	C2zRdP70zgKIMMblQlAKVSXAXqOK9LCpNUrhnjOe0GsNlSfFP8tI3HXf6DzmrUkxJtqL0uzGDHB2b
	W8xvbEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnri-00000005lMe-1vZ0;
	Wed, 20 May 2026 20:50:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnra-00000005lHA-1Tsg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:49:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490261c79fcso10981585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310196; x=1779914996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6pS+fRCyL3l4ecLcUFyDog+3129i4iHhu9NlGGm/nY=;
        b=vGacY542pjdUDPoYqLt9orsDaJG7Ts+o7HoY3QPzrUUlznSzEUMNmaMDrJVsR6F39e
         7qLBVbg7SjhtNooWKo28qi+C6AQ/OLMQEI/TEC8WUma6sChMn/4O4fyHspThlaKhTFy4
         E8pFDVAMZbNo4kF+FH479TRaJcNTEUFLKB8p5rBUYNS8rAk2S+GrsjVDTVbx5Chriknk
         LJ5zlRPJ/GthofxPu2aP8KmdhOFoqcdF3kyi7bLbKCPnSpTMuDHpqX7M+0NQpFbPwZUn
         1dQ4199vXY1OCOjtOpb+zEovycetZx8wO0d+qzTfyMs+6yJeEhGxw6Xh1csifwZ9ifn8
         6qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310196; x=1779914996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6pS+fRCyL3l4ecLcUFyDog+3129i4iHhu9NlGGm/nY=;
        b=dcfWvQv7S7VhvW41IEpNkDoCbamxUBJvNRLsBe5tfubxk5G2yyDlIInkUnNbsH0XG0
         C10SDzaDwHkPYq5pNKGDXBiT5GQs3jVLOIeJJEy6TlRqxPh7A6q6j3vt5B769d2uawTu
         OrAAoKwJECG0v8Nh+x89M1OkTPDkNKD74deRQwZxKWvZ/NEPTVxOrJMf8STlTY5FTk0D
         t50ZEvzye72UpOARlpuSCrNA9ozc1FdgvOSWbGrUrSAHMedOqfQtY3pkGfXzE4tRGn1v
         myV8NKvR99D5KKVIA4QwsVtulQkxAi8U3tNWgjBsiGR1qnn8E+WPyyEIjqaq/SkASp0c
         O/3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9sj9suiPPakYrZeKrsPheVu0FqKJQ6a+ybATfpOf8+QO1fmDktvp7Sidys4NLmP5OFOAnQQiK2FXAitgtisWvW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6O7hdW6DMYnlhIiWg5qjrizRG/fvw5SZ94i5PX5A5Mbm59ERw
	bMVTrzTmmSRPE+XFV2Y3P9XZ4D4cIlWkOWYK13b6Cr4E2HNvEgVnJLQqLlgMvk1GjipRdMDkAbu
	1QH5lknychf5hyg==
X-Received: from wmfo22.prod.google.com ([2002:a05:600c:2e16:b0:489:d74d:f20])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c08b:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-49035f37f95mr624375e9.7.1779310196037;
 Wed, 20 May 2026 13:49:56 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:46 +0000
In-Reply-To: <20260520204948.2440882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-4-smostafa@google.com>
Subject: [PATCH v4 3/5] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134958_408820_5C25D1AE 
X-CRM114-Status: GOOD (  13.21  )
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

From: Sebastian Ene <sebastianene@google.com>

Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
memory access array and to comply with the FF-A spec instead of defaulting
to `sizeof(struct ffa_mem_region)`.
This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
flow.
Also, add sanity checks to ensure the calculated descriptor offsets do not
exceed `max_fragsize`.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 16 +++++++++++-----
 include/linux/arm_ffa.h           |  2 +-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b700b2e93e72..8573a7a6556e 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -685,19 +685,26 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	struct ffa_composite_mem_region *composite;
 	struct ffa_mem_region_addr_range *constituents;
 	struct ffa_mem_region_attributes *ep_mem_access;
-	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
+	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
+	u32 emad_size = ffa_emad_size_get(drv_info->version);
 
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
+		if (ep_offset + emad_size > max_fragsize)
+			return -ENXIO;
+		ep_mem_access = buffer + ep_offset;
+		memset(ep_mem_access, 0, emad_size);
 		ep_mem_access->receiver = args->attrs[idx].receiver;
 		ep_mem_access->attrs = args->attrs[idx].attrs;
 		ep_mem_access->composite_off = composite_offset;
@@ -707,7 +714,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	}
 	mem_region->handle = 0;
 	mem_region->ep_count = args->nattrs;
-	ffa_mem_region_additional_setup(drv_info->version, mem_region);
 
 	composite = buffer + composite_offset;
 	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 81e603839c4a..62d67dae8b70 100644
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
2.54.0.669.g59709faab0-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B5CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8YigvBWVl26/ICnVgR3tTUB4GzAA0/sj9E2gFe9QwE=; b=INswDdm8VbdEL+11+CgI+LKvUZ
	TgZxFHm8JyClNErxs+Led366NeyX1kxytv0jbvBPUqiVQbH26DjQAZ+juxel6p9SrZJsmX487610q
	/6E/D41cqYuEJEL8COEO+Dc99Xquqy8RZOeRv66m+faLrzF2VjCfpDys4t7YbBPoJ+BrpTvFziYXH
	1AqQQPZAKs2HdsLIvuvD5urUdVw/YmCCAN4qdf4ajcgZigV49EwtveUGmsEiR2zG8JPzAUS1V7I5V
	f2RVahUmq7kA1IwoeW5gM27ZQe4cvLyWaBw+tctmZw8g+AAYd5iHVPRV4PFtqxY4U1h+68F61gYoI
	bMGdTXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmT-00000004MCE-3kTh;
	Wed, 27 May 2026 15:02:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmR-00000004M8V-15Ra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd33b4921so77215125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894164; x=1780498964; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8YigvBWVl26/ICnVgR3tTUB4GzAA0/sj9E2gFe9QwE=;
        b=uKX3neVw8hOqTItoLl4l5+7Z1V/XQyk+IbceSxvL7oV76/HZUXtkhTwbokNezPLHRQ
         mlLJm/TPpE/UpwfM/NVkkK6B0VYTsnhMZ6WHAsFjlFwje2Xq47hr0cej3GtG1wAa8tp7
         unkbmJJRIsy8aSW7+zinBcnci9ILfWgLEi0EgF7F9gsZgREfWsnYnIv0DybCab/UiSfN
         XUyyJYQEJgzgzn4jRJB9gMMl2x3VMs6fNSDZSpHjNDCwLlVzQddP6TfjO8x9/wHAnheb
         IoFj9Tj9O9FzoSd6t9aIqqePVNqQwYCOPEWCcS48t8zkKlRyEMTRBe2ImSZ+CCuHVZQh
         gWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894164; x=1780498964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8YigvBWVl26/ICnVgR3tTUB4GzAA0/sj9E2gFe9QwE=;
        b=AdUJDpGwopp7ojtUFPC/HmMVS3sNyC0TB3hNy4adWSwlmoahZiVq0w0wFN3qrZOtAz
         TneqAGvwbG4Y4RwZcr1Raw5O5tdSLA+mnqx3umvVlaCR5KUuvE8+4jaRbU8qA9eyOh24
         yvQhAbA0Ytp2RlyHiueNiIhTkywZuizh7mM71e6iMw4A+WY59cDDIpPVPRwUv1P0iRNs
         iekks0JitPxZgl5g9qY7HaBQJ/uzzJDYDEEnWydDtYjpbd2hGgg4cNZjqkZteS2b47pd
         MzQxX4ioRDu8mwl824yb7ufM/ndAOdYTzF9DWFUAkK2nwnVLy+tQHQwUjHSWlskLxUYP
         Bpcg==
X-Forwarded-Encrypted: i=1; AFNElJ8WPCO+ngTUqlYyKYTVrt+qkTncermio5gHW+qjtWxFSst06Fx92RFB6tGR7N1t7olwdLfEaqtRtY7i79daw1Ls@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5tqlSLwUQtOKwjoBzZrE4ZcJ2Perg2Kgq69pnA0CPqzbCCVyU
	rtpmpbDI/1nlPdcY7J9tjZoZPTwjjirHebKJP70c5CvaPsbWAoGtB/1qqdHf5RUBfsFEFMsMKOG
	XX00uBZbxcSoMUg==
X-Received: from wrnc9.prod.google.com ([2002:adf:e749:0:b0:43c:fa78:503f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0c:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-49042489c30mr450538145e9.5.1779894163610;
 Wed, 27 May 2026 08:02:43 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:33 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-4-smostafa@google.com>
Subject: [PATCH v6 3/6] firmware: arm_ffa: Fix Endpoint Memory Access
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
X-CRM114-CacheID: sfid-20260527_080247_324713_A8A33F3C 
X-CRM114-Status: GOOD (  12.93  )
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
[@Mostafa Harden error checking]

Fixes: 113580530ee7 ("firmware: arm_ffa: Update memory descriptor to support v1.1 format")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 16 +++++++++++-----
 include/linux/arm_ffa.h           |  2 +-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 059e2aae7ca0..bed4bd48963f 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -703,19 +703,26 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
@@ -725,7 +732,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
2.54.0.746.g67dd491aae-goog



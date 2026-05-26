Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A730CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUC6GCpgb9EEQ0qn5/HP42C7vK2niyP/8gA1+StmENE=; b=LFes4wHaHgXF3Egw4w7rMAA5tr
	kb94DvKasVrEl0/Bnm1b8YzRxiNrDYKQaR83o/P/DfotNMXym9wkZRxhZmS3OnRZMVP52OcMQnZ0h
	4oIGXqQkc5Q8mKiSBiryTqgdUDh8kGajdNE1Dxg11+k52BuYkCmmXCG+VP7IZEU5CslKoUfTTya8k
	d98fWGOF4dWZDC4gVyAAhAQusPkKIx3P0uYfK/X7VHEskyKIhqLSUhefjkjsCfOgd24aTb+6JdTsI
	Kn4ZPoTovKZX9Fs0mO1G2Y0fk3D/vHIegTmRjRqRdrTBn6SAV9E+X6N/VawPq8Xr/n2BmrSR+iImi
	DnVBYa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZX-00000002Lcx-246S;
	Tue, 26 May 2026 15:19:59 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZP-00000002LXD-2SB3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-49045243094so62019555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808789; x=1780413589; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UUC6GCpgb9EEQ0qn5/HP42C7vK2niyP/8gA1+StmENE=;
        b=LsWOWPur/L3ULzYE+cOl2lj6AmEkrIK3lcLrsS67GonNIU1DYXdEc6UmeG+dCZIWl9
         HiwLKKQsDWEO0U+npQ8chT4XnWyCYQdsLLeq3NbNW1YsQS+bUq6kUPJHabASeoSaJiXY
         MwKtiLmRUPCEPD6FYGtRptOvNwghd1zW5jwXX+DJjgWHesAkW+K5t4nhiYcZvZjyRgIc
         qioNkyjXZYjgf8KixthIZ3NBVMZ7CLXcXwBptJ7RIDkEjGLcn+Ow9+Kuz6Uzk32HITJa
         zbKx25Q8pb8yvN8tpYhh1K1m/6QhDHp2DUrD/0JrCzDzHvbNujTJz+gYP4WOzFaRwgq4
         3THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808789; x=1780413589;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUC6GCpgb9EEQ0qn5/HP42C7vK2niyP/8gA1+StmENE=;
        b=Os7aYzqoNtoVRjr2F4lFT9R+tdM/Ox2/eBdLhXIQsfeUaFxnKQRoUzupmduNIQyLaG
         6o0q5z0fLQXGfiNkRaUSfkPX9wUALTjsMHQKuqxHe3Bx+vfd5spGu/YKz9tzg4p6QCVp
         boNLLb5CyjX2TZ5QwDGbYOUb/oqtNTzo2Es3VcdU7kt3GgNoVDfQ4reZE0KayeiLLcQY
         odJyPbbePpVX2D0pEvYI+f/guBY2fVj8F/leFXJIdWPmFuKQKZ4lR50VMhvEthwBE416
         I/y45vDahIUymslWZnBeHzfP4suj9qce2ahoxWzb9+0UK+AGy6R2fPJbwxm5v7dVNsmc
         gQow==
X-Forwarded-Encrypted: i=1; AFNElJ/prT7OxIWqnuWsS1FZrD/VDroBAlLGWfRBQRzFPXNY7MqWvI/7/V5k79RPE8141HkeADwM8z0fk1Mb9aRaGGd/@lists.infradead.org
X-Gm-Message-State: AOJu0YzaHiKA9REnDlpeNdnCt6TAGVF6s/naQLxc8f0jfCFfWfGRMJLO
	2vGLitdlirHpFjhqEs2ePmwoizZ/K13K/gJKpZ/0PWtv7f9QBO6jGXRK1hkcUI0N4Vk5p9FbSj1
	1fQK0vvA99LCIyw==
X-Received: from wmgb20.prod.google.com ([2002:a05:600c:1514:b0:48f:de5b:469b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3488:b0:490:6869:7d8b with SMTP id 5b1f17b1804b1-49068697e08mr140072435e9.15.1779808788818;
 Tue, 26 May 2026 08:19:48 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:31 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-4-smostafa@google.com>
Subject: [PATCH v5 3/6] firmware: arm_ffa: Fix Endpoint Memory Access
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
X-CRM114-CacheID: sfid-20260526_081951_641072_071E6011 
X-CRM114-Status: GOOD (  13.00  )
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



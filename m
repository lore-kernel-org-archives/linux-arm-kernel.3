Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E406CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSPN5hE9gskxSS4lEDSt/fOL7Hb/rZVNl7XMRMHJyec=; b=SmSjsRC05TiLmmlFc2YQ2XHNiM
	/lAhd+iCcXbKWYmwxF4Zns/xgMmf5QJYHqK3l36s+iQ4/5w70nfCrgPH5avF98fN+V/lTr5Urt3Kq
	HuADuEfxBYcYuyDPyVoQRWG7tNR5JFwtBPEDmA5t7DAUMdhEWxhTPEnjX8Acl4JxOF4yIKbZDBcUA
	wq35iHbBhh41ZsefkFArXmTpipWGeqkfI/w6M5YQqy2JgfixK/Bz/9a3c2JhfTi7jHBWSfDpqyaiz
	F191GS9yiAGsSbqFD4NgY3qPZ/CzUNxATzxPbqxjewkCBu5/YYbsy4FqRHBmDKtwToAr3glIkHORE
	wY4vxIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcM-0000000HVDI-02iz;
	Wed, 17 Jun 2026 14:51:50 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcJ-0000000HVB1-0Ugf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:48 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef63d1214so3858062f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707905; x=1782312705; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSPN5hE9gskxSS4lEDSt/fOL7Hb/rZVNl7XMRMHJyec=;
        b=VIxEYYV/gWtc26Lhg2giFRJ7cyMwH8UsRS4d8DzHcOs7xOAu7/NKKwvqiTpw9BBijS
         1tYf+s71FEITWPBTsHKmuOVWXoKUE/SQf8YR7bIch/X0AUayVTsQiU1jpyf5CWZwcKxX
         X8NkYvNTXaADIMmjwUejV25CaL+7fxAd6p4IAMT5+3rTT7KYZJpNKHaci06vAMdXUpiB
         YO8joEc9sR9xs40fY6jWmqjWScr+V1JMhCFy50jWb2NLx/6jMUhBkDL7xmLaf4I2QQZ6
         4vdSGtrKUZkCLTF713ieZtmrJ9pgWp6bDkF5nNHW8YgYhSbrhcr/HJ1q2j6g7o/SBN+w
         9JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707905; x=1782312705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSPN5hE9gskxSS4lEDSt/fOL7Hb/rZVNl7XMRMHJyec=;
        b=MkT8piKcv2wEWrGCpZ02+dFlL1OQm1BDAxNMiTqxQbxTT+GYyELab04/bNEprM6E90
         BU993w0+iR4kUVxoLGNqb/KLmUXVImAvhdYg5dO1o1M718aHn0CjjYFl1NWPj2BaIYDS
         xj8w+NkqhnnJatc6VBPRGJZJAMZBVbCfFC9HkxMZXZ2hCbSjCFNYSAOdfvrDJPtiZkpz
         cPROJiduyV6zNoH56IrXvCU26fdtnvoUGBNXeX1YzZQh1WUArtaARA/VipmhaRa76fpD
         qPtWERhJ9zG4bAxuftv9j5UP99dlkd0iGNfsDRI3BECTI3ljK3yop3HnxV2jOAJTJi+t
         bktg==
X-Forwarded-Encrypted: i=1; AFNElJ8wSKsG4IImXBbLzTks7VaXMTo/TzhGjjS8Mc5t0vGzD/kqAz6iFWxL86XfZUcvsBBi5Gf4fmn9Q9ZlDpYYZhJV@lists.infradead.org
X-Gm-Message-State: AOJu0YwnHmWr5VZUqv1/Z7HruEcr+FpE2S1vZ1mtlY9+DF4Npf0qkijU
	MUvIgbYU47JNJx4vRmB+a3Gu1o5OWjQ8Vf/y9kK9PuNjxJhfPRTIWziucLmspnEVLDIw/uQ/P3O
	Xb/43JW6WZEy/s/m70psEOR8tEMKMsA==
X-Received: from wmbgx24.prod.google.com ([2002:a05:600c:8598:b0:490:b0f1:3417])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f8f:b0:492:3670:85a7 with SMTP id 5b1f17b1804b1-4923677d803mr26521325e9.35.1781707904134;
 Wed, 17 Jun 2026 07:51:44 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:26 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-4-sebastianene@google.com>
Subject: [PATCH v7 3/7] firmware: arm_ffa: Fix Endpoint Memory Access
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
X-CRM114-CacheID: sfid-20260617_075147_180618_9A538282 
X-CRM114-Status: GOOD (  12.47  )
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
Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 20 +++++++++++++++-----
 include/linux/arm_ffa.h           |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 059e2aae7ca0..92edf397bcd2 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -703,19 +703,30 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
@@ -725,7 +736,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
2.54.0.1136.gdb2ca164c4-goog



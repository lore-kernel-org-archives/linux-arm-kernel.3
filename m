Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C17ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d24wrYQaXGsSCPSg2rGnw1RTPAIojJGcxLwZrJaJw28=; b=ajPQ4uMvcGIWtyJddflOxIcWD+
	raVzxXFUjuZkmPkVVk86RF5rGO6f9isGejsYiLSu3J+j9u0pGF3fxK1/kb47VS+tZPqKOK9Ck2irR
	fFgXB9yjmNyHHIilGNZVVLX5Xfw7aB23EPKXwc5GnJILoJGn9hOFRhNpO659gqziXKFzIxEMTUizB
	ZD1agBb2w7dsZ9P5yQFgvAMl46+6rVymNXP0ZYu+7KCuQwzX6X+3JDZX4cdtttX9ojU72t5Y/+d61
	eNn6pbJqAvaHhtB8AM3yytBjxOI+cOFyMzTU9l3G9JA87HIbXcMfJlZg+4libXgRErarNmBm1rA0a
	C3qWKNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTk-0000000Ghgi-0Hgz;
	Tue, 12 May 2026 12:44:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmTg-0000000GheM-0Ot5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:44:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48eb0da933fso2680755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778589885; x=1779194685; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d24wrYQaXGsSCPSg2rGnw1RTPAIojJGcxLwZrJaJw28=;
        b=YYiUd8Oxy6uAcgB1J2cZdsOqo9EIjBvNxxu0YQNsbw1lmVTX+gjHIqbqpsAwK8Bkq/
         TW/qOpfPHcodhbCalT4kJwDfIx8XDU0HPaJcNeCu7coDFz/rhqwHMFe2YsDgfZejTEH/
         KHYmn0qm59TvbLMePFjVwRcJfNHOAmAqfsHlBGXbOavD68Y0gUFtKdVVSJoy9zniaZGS
         vJtSMojhLbNQwQSZeRzE5UB5RJHtyF+aelMkFRObtnS/RAg6++pUepogIxP/GtPQEDlg
         kRYmEJ5ajYd6RmyUo/HNbXCHQw/x45zb84MdBuGQjVjvNZ2Phjsd4ojAET7aLbCc7c44
         Xd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589885; x=1779194685;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d24wrYQaXGsSCPSg2rGnw1RTPAIojJGcxLwZrJaJw28=;
        b=Goj2HiXdiHbvFRpXTCVyYmJdd37HUoG16LBSSGlBCKznCJrqm3pIPGtGJ1B8UXrLq7
         PPeGY7kzpj+HtHa0S/9YSvxy0dFDGLSRzcWl0NmMx9gJy2y7igdyohe4azWusNxDOlKp
         M5n84VhuiFoLZ9dqolW2sOTRoJCHf/UGiwuNycce/o7TAuFfgIeKNbz4wlK4hu5L3U/W
         mBixU5HmQval5aXCu2Uy22V+WMvM5hHOVhSFmOT/VgfuHpjNWWM7NSZAl19xf7dgTKW8
         jkNl7L6urMAM8CjcD9FslolXLsKBLdbDYszGIaLteRlbGfT5FPv5PJarxlKARzqVyaHc
         jMCw==
X-Forwarded-Encrypted: i=1; AFNElJ8cIZpOD6VQTWfpD4gl9Xb3zPuw0DbIntMNN4wpey3RxYL68PO2DV8edQ7yu0XA3dUlNxRFVdr2WUm5pjTYP8WU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvl38kFyEiSRKp4PZxnQBOls2/3+waGrgTk+nHgz1nDahSgxmQ
	UvNxpFNzqOEBqyqhw00liH4caUtUK5pilQWk79FhOk7alTnK9owyFFMQzg0azFs/Uon19Gf3B73
	aY82gZD5DCZNyVYTp5gnyeTmD+qJY7A==
X-Received: from wma11.prod.google.com ([2002:a05:600c:890b:b0:48a:5547:c79e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2b01:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48e978fc469mr17151565e9.19.1778589885365;
 Tue, 12 May 2026 05:44:45 -0700 (PDT)
Date: Tue, 12 May 2026 12:44:41 +0000
In-Reply-To: <20260512124442.1899107-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260512124442.1899107-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512124442.1899107-2-sebastianene@google.com>
Subject: [PATCH v3 1/2] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	sudeep.holla@kernel.org, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054448_154655_B78EFCB1 
X-CRM114-Status: GOOD (  13.49  )
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

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
 include/linux/arm_ffa.h           |  2 +-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index eb2782848283..56b166290b24 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -685,18 +685,25 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	struct ffa_composite_mem_region *composite;
 	struct ffa_mem_region_addr_range *constituents;
 	struct ffa_mem_region_attributes *ep_mem_access;
-	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
+	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
 
 	mem_region->tag = args->tag;
 	mem_region->flags = args->flags;
 	mem_region->sender_id = drv_info->vm_id;
 	mem_region->attributes = ffa_memory_attributes_get(func_id);
+
+	ffa_mem_region_additional_setup(drv_info->version, mem_region);
 	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
 					       drv_info->version);
+	if (composite_offset > max_fragsize - sizeof(struct ffa_composite_mem_region))
+		return -ENXIO;
 
 	for (idx = 0; idx < args->nattrs; idx++) {
-		ep_mem_access = buffer +
-			ffa_mem_desc_offset(buffer, idx, drv_info->version);
+		ep_offset = ffa_mem_desc_offset(buffer, idx, drv_info->version);
+		if (ep_offset > max_fragsize - sizeof(struct ffa_mem_region_attributes))
+			return -ENXIO;
+
+		ep_mem_access = buffer + ep_offset;
 		ep_mem_access->receiver = args->attrs[idx].receiver;
 		ep_mem_access->attrs = args->attrs[idx].attrs;
 		ep_mem_access->composite_off = composite_offset;
@@ -708,7 +715,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
2.54.0.563.g4f69b47b94-goog



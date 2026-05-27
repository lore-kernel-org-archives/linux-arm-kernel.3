Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3700CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uj7BV8+9rgP0MrIxwz4V0ep9E/T0g3B6x2bWAPAPVY=; b=AuB/uFl698r/w2iu4EoXlkCurl
	IcabFD0I4k9rhfkiwgL3kmKKjOWY5zEyvKF/wY+pQDmbmTgnsTG9fFdcAcdmaPLddw29E9YzRYRKy
	tzeiR0+24Hph1REhs0M92EzDAypTZ85syCNzifCHdHTyErNmaEEnVBrQXk4/t/Q8KvyjIwOxutn4E
	og+w8/d1h6hyuKAXQ8Zy6rVByQf5Sn27u7Uiw2EDAlnG3xie60J/m5bmqfbYKvKLQ+M0ZjINyJnGE
	6DkHS4ULjetK+PT84YGb3KU2KCk6QwCRt7tYAVRpyowKTGOMH8Mb7B0aRd9kGcFCFvdkCAKTbX9Vz
	ngpQ30Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmT-00000004MBv-3JV9;
	Wed, 27 May 2026 15:02:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmO-00000004M7H-15ML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:45 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4904ee02e72so39938775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894162; x=1780498962; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uj7BV8+9rgP0MrIxwz4V0ep9E/T0g3B6x2bWAPAPVY=;
        b=qSmebX4kS+T0TA47TiQ5ab5f3UkwfdbiCCWgI7oC3DjGO6n7R9QmOj9ZYUHwtmgyrh
         dpFfWATfAXexqvYi5WY8uf8tp8jDzxw9FpTU85+42CtT4OZQE4b108e73EN0Utpmxwwz
         jUcumO+g8jYLUx2O0iSCFX7PwmN8ewU/HfffoOTHV+EE1VrNma0X1K1O4frp46sfjGW4
         BeyJy+tPxYNktI/9bet+bNepOKQLlY2dcnuFgDJO6jXdnhYiqnbgRM0tUdgnhsMmtGv+
         xq8a0xheM7YFVsCTmtc+rzcdpA4BMaKLhg6zilGiOQMmb0klvv5wdRlZUXgqqvwyCgoQ
         YSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894162; x=1780498962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uj7BV8+9rgP0MrIxwz4V0ep9E/T0g3B6x2bWAPAPVY=;
        b=iUlJXaG/NN/sqsbFPoBncy67fhWconLvJwgf9Q9OcpFN2gmeaqVrCnk+X0zBB/DKYn
         4573FVU7U0RmmmyDi2lZqQkH7I8aQfTfsGzMGC+Ji2n9YcZzoNQ2Cej4a0ct8EO+UMYV
         hMQS/LkbxAMu9fUt04Xb0XiZmBTLoI/9VnIRYtFGmYvpXi8b8syEWlsNWspVHJp6GRri
         0bIY1cnOg7mLTFfChYI/H66rekf77k1WpEHTdfwOFg6BEb6BrHzQD7JjpH9qlj9AG3QH
         S2uLRqXxn74j5KUWu17Ayp12Lu4/V4qxVd+5dii+0xH3JGjC9ufyG8PQML+dmIaT+T40
         gcUw==
X-Forwarded-Encrypted: i=1; AFNElJ+gPz3BFbPnkNH6KbgutvS2JOQG4gRSi0ium6VWvBnGYfoMVn9BebBHZPuJ1doesY8hgqBd5B1gjtO6joHFuQM+@lists.infradead.org
X-Gm-Message-State: AOJu0YxJbEgidqeolnk2fmw9HAPnqub+FGQT62IVPpqx+j6s2sws+MnP
	Cnk6IOHXtNYzpgx+qKVKTNmDYP6c0ufrl1WDT1B8m7/KuS1wdGMn9ho1tVYlNTjbnh76i6lC5He
	btnZZQxo89+G9Og==
X-Received: from wmmu10.prod.google.com ([2002:a05:600c:ca:b0:490:5e18:ff1c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8499:20b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-4904248ad4cmr298003375e9.4.1779894162134;
 Wed, 27 May 2026 08:02:42 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:32 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-3-smostafa@google.com>
Subject: [PATCH v6 2/6] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080244_313640_0247CB97 
X-CRM114-Status: GOOD (  12.08  )
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

Sashiko (locally) reports multiple out-of-bound issues in
ffa_setup_and_transmit:
1) Writing ep_mem_access->reserved can write out of bounds for FFA
   versions < 1.2 as ffa_emad_size_get() returns 16 bytes in that case
   while reserved has an offset of 24.
   Instead of zeroing fields, memset the struct to zero first based on
   the FFA version.

2) Make sure there is enough size to write constituents.

While at it, convert the only sizeof() in the driver that uses a
type instead of variable.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Fixes: 111a833dc5cb ("firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..059e2aae7ca0 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -715,11 +715,10 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	for (idx = 0; idx < args->nattrs; idx++) {
 		ep_mem_access = buffer +
 			ffa_mem_desc_offset(buffer, idx, drv_info->version);
+		memset(ep_mem_access, 0, ffa_emad_size_get(drv_info->version));
 		ep_mem_access->receiver = args->attrs[idx].receiver;
 		ep_mem_access->attrs = args->attrs[idx].attrs;
 		ep_mem_access->composite_off = composite_offset;
-		ep_mem_access->flag = 0;
-		ep_mem_access->reserved = 0;
 		ffa_emad_impdef_value_init(drv_info->version,
 					   ep_mem_access->impdef_val,
 					   args->attrs[idx].impdef_val);
@@ -759,7 +758,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 			constituents = buffer;
 		}
 
-		if ((void *)constituents - buffer > max_fragsize) {
+		if ((void *)constituents + sizeof(*constituents) - buffer > max_fragsize) {
 			pr_err("Memory Region Fragment > Tx Buffer size\n");
 			return -EFAULT;
 		}
@@ -768,7 +767,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 		constituents->pg_cnt = args->sg->length / FFA_PAGE_SIZE;
 		constituents->reserved = 0;
 		constituents++;
-		frag_len += sizeof(struct ffa_mem_region_addr_range);
+		frag_len += sizeof(*constituents);
 	} while ((args->sg = sg_next(args->sg)));
 
 	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-- 
2.54.0.746.g67dd491aae-goog



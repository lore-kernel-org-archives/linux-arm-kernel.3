Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96029CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iM960fEPaAF4GKD2H7L6vb8i4u8uWo0JTw5z3e0opLs=; b=m/BIRQlAJvxLQOpZZ3N4nP77GF
	RkVr1Be8eo1sXE8ay9Cwz58WzyO4XgvXoNq9FbZ5VJ2RhqhmfLVsWfLDPIsx0xWdrnS66dKwpn4l1
	vBXhwRcvg9vAY3ca6snV4HfqHAiFT0VD+baR8VwyWHkGeOj9AgP5yk9EUc5uBjBGuTv08CyOfjWM1
	lGrux/6ciKhtq/W+toV0bvFcFhH+SJFPxDuSyxHXKdeRZfPW6Fjv9M55yE1IvJ+rLYBGEKYf+QivK
	tGzxU6kPhM7YQTytjOdxHtLwloGoicvbo8UiMjRpw7Z9DxQDFS1sdIfWxvVCwqvanZd4GcL2Q3KDo
	nUjLEhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZX-00000002Lcf-1eOM;
	Tue, 26 May 2026 15:19:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZN-00000002LWY-3D8J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:50 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44f65835b77so7761053f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808787; x=1780413587; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iM960fEPaAF4GKD2H7L6vb8i4u8uWo0JTw5z3e0opLs=;
        b=KWlZeAmIFyDaaGs+6fBJZT7keotZfRUCQYAOKjb0+Vz408AZYr5nQze4y4ylsdu5FZ
         d5A0VfFnhuaY3+p6IcUAOsZ/Aikv5rGU+HQ1B0ina8u+U3wSmuVCFLPoXhPab0trXEG5
         sPTFyDzfgO1jlqXAbEH3Ebb1riwm0ngPzAscdYm2Z5Ojjnn1z7sC9QzUNyQ5z9SJidxO
         1/5R/sBJ6XPg44FvtBt2Dy2fq9NAv1wzyTHsk5GVYt6mLOK11qkjmcGJoHdBvU8JW+/B
         q4vj46Rrp4liY6vb9GLi3MWiALjBPpUtucjUTF3giY9rwtIryUiY1YsuRAoYMKSuQRGJ
         /Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808787; x=1780413587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iM960fEPaAF4GKD2H7L6vb8i4u8uWo0JTw5z3e0opLs=;
        b=XLNhsDwsOmbQyQ5u0iJ3a5Gu2b4syVnEunQxxlxL48cl4Bc79cIihPeYfg5P7h5RYJ
         1KDVYmnoSasIKA7949mKwbxOGKZQl+RWVyOkjGioYhiTDDtKzALQzyGu84Pa0m9ndf+D
         P4jwYf+V5p3ZlsCY2uCtKlWwXU9hI7PkNjqYLyYv4zNHESkM4LGgbkjuJSdQzgomLwP0
         8XNOU9jrfi9TGbEbkWBO+WpgnsQjvpYMhJT6FTeLgA6yaM1YJ+mHKBOk9gJa6vd7TEpk
         uv8eOvjFE1SmTElgIlPWYZFky2jAJHpLIW862pcxqiXKufAEMf42Yt1ivsaJX/Bp2QEc
         e08w==
X-Forwarded-Encrypted: i=1; AFNElJ/KZtFO1x0nRU77lR42ZaMAcYge0KRVErR4tpDFzhPR0pWB0rmJ0SBYRj2Q1dNASouJGGXMtssD8PC1RKi6BM/5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo0d1T/spUlRiozElK2jWx0QG5/ASwPEoZjKU5UcOGl2YQINbO
	G0rMNmI52mjCSrXpBoIz/xRWObHgc04lAgjp+GWARicwV+jAxHV85cABnUNl01zsJDX2alPRHXK
	lXXmLadNmWUg4jA==
X-Received: from wmni10.prod.google.com ([2002:a05:600c:70a:b0:48a:5334:11e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c8:b0:490:601f:d783 with SMTP id 5b1f17b1804b1-490601fd8f3mr182526495e9.4.1779808787137;
 Tue, 26 May 2026 08:19:47 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:30 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-3-smostafa@google.com>
Subject: [PATCH v5 2/6] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081949_820566_DFF1C1C5 
X-CRM114-Status: GOOD (  11.82  )
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



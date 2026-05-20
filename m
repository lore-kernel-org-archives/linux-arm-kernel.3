Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF93DCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov2SNTUzKC8oN0Fvl8Z8REa9PXSOlA6pzj2Ni/hPKe8=; b=xdcO5DNy2UF+GbF6ZzcSVn1ROr
	SmdJVD5BnkobMK7LP1DqefX4pijieSyd9ITEjXVpwkw6PzU5CwV57RjImky15l0TTDjSSx+hHPMUE
	CVIIuqtBGE3oZBV0Q9ouYcTx33wXjr/mbV1VQOK05GXdwovLPlqBLtgONq9Ww9WM974dOUrtk8v8r
	txZCh+SpifCudZVD3meVLOlbzBYeEV2Ig73pQTz2E9yTKSiMN36QRYJTpWtI8kZSn1Nq31OenJHwh
	78cUnQEk0TOrjqFQ8xTYJOfRPr7KPpuzejDVzwD7uq2n/beX/5szlvYS1eKekqy7lC98nl+DFLUol
	ywwqj+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnri-00000005lMK-1Vtb;
	Wed, 20 May 2026 20:50:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnrZ-00000005lGn-0tjM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:49:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fd2b502e2so46231115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310195; x=1779914995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov2SNTUzKC8oN0Fvl8Z8REa9PXSOlA6pzj2Ni/hPKe8=;
        b=CLzDhYVUcf1ksss+p66mvm7t9Y7QH1KX3yjZkoaqx0XfXAuJiJOMOq9cypccegsbBh
         uYW+SkQV+KVVl+gW7vBRl72QMNaQ2JRCyxjMztpr3Qe/6dF+XlGgQ8dz0LRjUffh2R++
         w6vYNGjVy67j1NmllcS9HbXRXy3xo1UIgdW9wNbVjoozLzbjRsfMeafti0zBy+UV71yM
         r3MxRUBYUipQnGKyZZ5BntwFyqAin73VSB3bP6WqIEr7xnwu3upAsTYSMFvbiWYmW2lr
         w0lPadSVl+0Ml0ZW4b4rKQS9vt/i8X8Z8UwVlAsdeP6GMseFVkQKwOxvFTIAM08X7toP
         Q9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310195; x=1779914995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov2SNTUzKC8oN0Fvl8Z8REa9PXSOlA6pzj2Ni/hPKe8=;
        b=E6cOvBnfK3WkUZZkP8CaPqoJjc2x4usZ7EEMgkK0+vGvJzPg0ng8dddLKyDtc1oNWR
         tml44Sn9P8AbXpGO/hCjb8aVohMxscIX97UHL8vwWlK4uJftJBQ6QJf0KUmSpAbAc8uP
         puTlTeqFFC1q7yyqn2n3NvivRdbnyszt1Erq4PsVk+sUUoBfrEwuN+B64V77BYBKxV30
         IhY9JQ47adwW9l2ua1BaKQ0NiDlv9h9pqA7RwB1GBP95yu2ygY8PwdhO11KuHqJRXr8O
         qqGQYnb6acqVFngcA0QRKX9bfpu+Z1kbOm2xhKs/Pv6bpbd0xHJK9OHgjzulrF6hlZVg
         PlPg==
X-Forwarded-Encrypted: i=1; AFNElJ/1vagFzmEkYmTxAbX0LwhdXmHOYtlCLBpS0Q4fUsSk94cVdAevMQ4ckoq5qvGxgnFOUO8MOV6rXvXfPhBdddrX@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ+kQ7pTOMgaPP+KIFv72m7BORnL3CnRoVkyO/TG2X5ah0L0f3
	EhYAojVm6A2PbxIBH4XO5ZdluQ/tZB/f2S5HVnETCSuiv7VgeNVLxnrZdiE/U4MB8g4TFjHkL+G
	kVTUlaOY6d07h1Q==
X-Received: from wmrc10.prod.google.com ([2002:a05:600c:aca:b0:485:3a2f:2f7e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fe6321cdamr430534835e9.21.1779310195138;
 Wed, 20 May 2026 13:49:55 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:45 +0000
In-Reply-To: <20260520204948.2440882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-3-smostafa@google.com>
Subject: [PATCH v4 2/5] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134957_267969_FF7836E2 
X-CRM114-Status: GOOD (  12.11  )
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

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index eb2782848283..b700b2e93e72 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -697,11 +697,10 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
@@ -741,7 +740,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 			constituents = buffer;
 		}
 
-		if ((void *)constituents - buffer > max_fragsize) {
+		if ((void *)constituents + sizeof(*constituents) - buffer > max_fragsize) {
 			pr_err("Memory Region Fragment > Tx Buffer size\n");
 			return -EFAULT;
 		}
@@ -750,7 +749,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 		constituents->pg_cnt = args->sg->length / FFA_PAGE_SIZE;
 		constituents->reserved = 0;
 		constituents++;
-		frag_len += sizeof(struct ffa_mem_region_addr_range);
+		frag_len += sizeof(*constituents);
 	} while ((args->sg = sg_next(args->sg)));
 
 	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-- 
2.54.0.669.g59709faab0-goog



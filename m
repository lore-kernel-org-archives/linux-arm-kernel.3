Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AC5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=; b=TLyP4jm0EmHhsaxsay8QhMHDBU
	4LuG+AZClz94J/NunuFbLtftWw0gO9MxgjTG9fpF9rQMpWIAuepbIjQBg4M+ZnjwVMIhKyKUAAYOJ
	XsQfGAZVDQkX8cXkVI7DQSE05VFHqjLq9X9slIqK3NNEkFXY6bKiTleS6Atmin8vdKdTzSD9rMr3u
	BHb39/SRJd2izQEMHy9JZwheEr2WvifBAwiwz+SuKLmcQmTbYiC3QZIMK2RatBhqfujOHu1YIcgup
	LzO1YbsOg3XsdeMmVM7STuwhyTs0fvwQnumcw/nAW+4MmdrNNnA+4jU/WfX7J2WRNNv+7V5CmlD67
	6cfjotJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVat-0000000GcHz-0xCg;
	Tue, 30 Jun 2026 10:21:31 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVal-0000000GcEl-2RWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:21:24 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c126f9928f6so173457566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814881; x=1783419681; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=;
        b=CTlvXZzMypghAvKytqma6CdfGPlTGfUuMM2K5WVGJ4T2eaL3nMI/R3XNcQGmKMY0rv
         k5GFRAmg1bC2m5MkVdgFBIdAmLWTR4OwMIdUpL66qB/Fks3C5VwOEcfP4/glu1VnG5uS
         3vNzzueYps5a6WkbDQQ61+LR6xTBw8ntFROOf+RqQ81ARrZ7zBc2P9vw3nJYG1LrCtyY
         wv2hks8+Au8HAJg0Y8kWVgD6+HUXkAcp4E6MubxhR0xVdYax1YCoy3R1TOb/2Wdm7r1P
         9meTJeVeC0LZ91aTsE2KkUXjA8sjcy7Gz8CnHji6wN10m+twheCP01T9fgkloPEXJye5
         OdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814881; x=1783419681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=;
        b=HY1DTTGHz7lTzVDNpuKBdiZmcr9R5zv8QffFiX8Dlq/W2CNaHnwD98SxwO+/tnyeHC
         qM9d9m+mU9qNvnXOk3weLxuZBfO3jH6ObqAkms/sjjKGzggJGPQXrGMRNTvMiyc3PlXy
         RlRG4XRzqaQWt4KQ389Y8po3gNrj6AwJNIMYEpm6Dvnvp3pFtadcG96oYWJgCUpq3I2K
         KXiyEWOU+Bl8/q3YqvNFjsnajIYVd1QqsMTx5lQYl2mo2HWo4W0C0EqB58u6dkVMbWF9
         Y7kDIFWy4BqwDfj0jrdFlcMYqmgWKmGRqa12iDZrYVA4PJ9PygPgSyf2HgdKjSsxAfTc
         dOmg==
X-Forwarded-Encrypted: i=1; AHgh+RoJX1Fi0FJDwJpVARiVnE4EyWyUxnWnLFm+NJe5pI6giUFXPk/dxUodPHuIJw5V4tIk8HhPNNQ1cIkGfHBWi3s9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3m5CN4VYESAHbapyPSJ2h7VvEmEiwpXbKRUB/RlQRKWuCT6N1
	Imq5PjW6bRAkkScVYdnUB+Oh9uNUMxsO9VpIoLHkbuVa9qu9aYEiBRLu++hK0uCLjI592AtbAp/
	OOR9u7hDIj5HYQ42k3KOmUXcqsR1Ofg==
X-Received: from ejbgw23.prod.google.com ([2002:a17:906:f157:b0:c12:5da6:868c])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:fe46:b0:c12:8d49:48cd with SMTP id a640c23a62f3a-c128d4953fbmr93701066b.37.1782814880689;
 Tue, 30 Jun 2026 03:21:20 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:20:54 +0000
In-Reply-To: <20260630102058.3219867-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260630102058.3219867-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630102058.3219867-3-sebastianene@google.com>
Subject: [PATCH v8 1/6] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
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
X-CRM114-CacheID: sfid-20260630_032123_637633_F5CC7359 
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

From: Mostafa Saleh <smostafa@google.com>

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
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0f468362c288..01301213896a 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -725,11 +725,10 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
@@ -769,7 +768,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 			constituents = buffer;
 		}
 
-		if ((void *)constituents - buffer > max_fragsize) {
+		if ((void *)constituents + sizeof(*constituents) - buffer > max_fragsize) {
 			pr_err("Memory Region Fragment > Tx Buffer size\n");
 			return -EFAULT;
 		}
@@ -778,7 +777,7 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 		constituents->pg_cnt = args->sg->length / FFA_PAGE_SIZE;
 		constituents->reserved = 0;
 		constituents++;
-		frag_len += sizeof(struct ffa_mem_region_addr_range);
+		frag_len += sizeof(*constituents);
 	} while ((args->sg = sg_next(args->sg)));
 
 	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-- 
2.55.0.rc0.799.gd6f94ed593-goog



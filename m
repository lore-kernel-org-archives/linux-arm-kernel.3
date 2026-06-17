Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43462CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fif2f/B/gn5RkPcFE+VYhypuB1774zSDWaedB+gVp/0=; b=dDtJPDs8nT5QfN/A99zTT8f49O
	ZpDA92iP5+1M1JmeWmh3pyJu8i3lEn/l+iAeeltRiovED6aozilNy8g+roptLOlEzmfcYcmdFnBAT
	eAaa42duAvgYuUagVRorFzNOQVV+JOLdiYIC+vlY7r5OG1bpfv1rqUqcSpoO2oRAzzjCZk9XY2cyY
	05kaXmyFVAlt3WIr/FA4LGLkd9+IL+o4EG/bpTQphUMw6VVKy+G0QNDWIH3X0vC3v2nPgtY07H3pX
	QvARXN4LsdY39PiHsxZO+RLc6TaPRJk73UT27b/oeTPbODtLivxSo0Ym9p8crWmYYOsKIIYfeZYMU
	oH0o67Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcL-0000000HVD0-3mi9;
	Wed, 17 Jun 2026 14:51:49 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcG-0000000HV9u-3Hlu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:45 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bf2dfdc0582so595877066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707902; x=1782312702; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fif2f/B/gn5RkPcFE+VYhypuB1774zSDWaedB+gVp/0=;
        b=Ihjbt3RDFXvVFP8JYUV2zIqN0pklucerUpZHQ+XixWIflFtq61cGcGiZzI7wUix63C
         Ujkpo34R/RQzBd4mNMJwz/p4VJKK1eDekfr/zscXg9jjP1oQ3o+zWz/E37+z1mF3lYgM
         yfRCsHZB2DXQOoaGBBVFYWzORu3IzL5C+wnCN9XOnB1EH17H/2+QKPnxBMGzHMsjxKU+
         a/kLPsijnSbDPabNAgE/e4LeVxcEatd2pxbsF+okEzxeU0YxHnULOZ+63qiWbhJIvo5M
         8em8xs0qzL21SsTP62mSgZnogNoDqMeiWggRStAvUJn4GifiSjVysquUObCxAtL9SsES
         4MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707902; x=1782312702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fif2f/B/gn5RkPcFE+VYhypuB1774zSDWaedB+gVp/0=;
        b=nFa34os18o7boI23nxgPsnieGzokUyCC1k4Qs+G53oF+q567Ume5euxnMRfKZJEVnv
         nAsgBzJAvIs4KXqQ+WBSyWP6/YjbNSTtWbF+MNu4MGWkJvIrT++VMNfO6M5c3U182BGo
         9UNk7r28p0ybHuKbIsF4MHGGESmfzXBnYEE6yIokSkxVhyYfKi0vukQF16exgko3hmBF
         nlSNbEpHyycl/FZlwIXnPrD06yML7xOgcki96QmEM6c8/tLjrkMMaS/ts0DDT8Ocq63t
         hiR0FbKSNSsxVUtQ3cvJPJ+5sy5nuKedqzOi0Ebt0/mb/ZFZ9NZD2U+pFyJ58A7yvnCp
         ++LQ==
X-Forwarded-Encrypted: i=1; AFNElJ9K3pHghWNJramz4VtzXDH94RpBOWfYLd3PRz61vvg+Rr3duMLppxWRp+UzA2zWjA7+pyQlMMXcyFI5uPLmHGoN@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4Jho81zFDlEMFV4d0O8sEtifc6bQPRgJD4af+9UMlPWeY6QQ
	N/UNSgxWC8Qc1sITzhKi0+xwNJnt8SbMXkhX5lTyOEe9k71WkvbN54r1MOOwhlWcBAAs8YKKNbc
	CloMoeecOoffJat52w777+ngsvsWUIw==
X-Received: from ejbw3.prod.google.com ([2002:a17:906:1303:b0:b9d:975a:28a8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:209a:b0:bee:ec3b:6a93 with SMTP id a640c23a62f3a-c05d2182e75mr113081366b.2.1781707901976;
 Wed, 17 Jun 2026 07:51:41 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:25 +0000
In-Reply-To: <20260617145130.3729015-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-3-sebastianene@google.com>
Subject: [PATCH v7 2/7] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
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
X-CRM114-CacheID: sfid-20260617_075144_875520_8DCCA3B5 
X-CRM114-Status: GOOD (  11.12  )
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
2.54.0.1136.gdb2ca164c4-goog



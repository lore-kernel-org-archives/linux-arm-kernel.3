Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=; b=J2twbRWXYiMhfcl9me/XiqFZW7
	nLr7za9oi57mkF5gacQc4RMEB29pRcRcPwMzdR2dmkxSGX7ywnbdQnVEyb+3u3AYqxpbS6nETipWU
	P0unKxpAbFZqQ2r2HjYobFGMRmKPDB+L4m+strzX9SgBNwKYa6GL0pp98SErXjA9BbdoffjBIwFZq
	8Q1E0VyMt6ER4GTb0aleNG26XUgYuVeJ1p0cDCQ2BdVxFVdMQpszY8Ug9AbE4p3XczAD9r32zE1fs
	/U3riLbOfA70vE+G7OI5QYJCgcn6isoahmdVGfAdUS6qE8B9DKEovrCCJeFoXp9qNSrIHubkOTvgP
	L43iRTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEoz-00000004BaI-0t1k;
	Thu, 02 Jul 2026 10:39:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEow-00000004BYY-1lz7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:39:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493b0fe95b6so12380905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988740; x=1783593540; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=;
        b=uyDAqRJvX6ex+tp2WKLp5f0+yPTKVaqeEvpSsbrPj66phBhxtiVtsOKuzNMCN8vQUG
         KMK6MXqX4iLQG4FcpmPdO5FqhS3LJDTpjpnXiGgrzTNYE6EEsbHWABDDtAIiPxc/ZK2S
         gQFTavh3b1I8x0NOTlUGQ8GnYQUee9MzlIGjMjrJo/0LbY1TULfIdLFIJUi01aFRhNrV
         uDCSA/QF//3paiJ5DmvPsMEYuT/Xlx862SVMn4J5+pjvYUQRLMQ8IaUgXDA4rWuTdZ9q
         uZf7kCCiYBlceHWg5qXpRlx2ZbQqEOUIX2Nw2e0GAeLQ91UNlc82ib45vWwjIa4KuF85
         5qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988740; x=1783593540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3srY3du6pUShZyOw/nlifUO0efjUMM7goX5s1Ul3bUU=;
        b=p0p3JSWv4OqdZAaYaLt6lLbSwR5FMUrT9dxv5CWWguzGMfvsSJcL5w6JDyfmXELKrP
         3PLTVo9K62RCXKbgRTzFZJHurr5GF1ouy7bRVmdgSKDyJh19ZBB1DwrsHSoxZEdDog2u
         1AjkczG8Nc51z1HX68V6SQCqCeKlTRG3VtHKdwxmFFbvJQr90IxzKIS9OEKwRTPnbx0W
         +dSKGO//4vRPOk9y2k1/5WLxTHRZl9638791O6Uh6WMqWbdD+bm1Q2tOWIZU8Z/Xu1N+
         mH+NIYO+OGtNKpTazbZtgZXYi7jmG7Nsv8V6AL1dcH3zbGwAo3Q5VRg9POZhMvjFWdZU
         PMFA==
X-Forwarded-Encrypted: i=1; AFNElJ/gAAH+LObM+IfP5mpPSVpM155D8bLaL89BMNlUODUmQt4jsikVW1Pb40g0iHnwAWP+7QJczRNp4Ooxkg4KQCzN@lists.infradead.org
X-Gm-Message-State: AOJu0YytVRLw/Pgnnz1nhN2bBTqT91b+0MVdaaK4Kb9AYSe6Mvez69cg
	Bzo48v3bs6Bi6wRM31y/Mm8+jiuzb43LJ5TJpKwx7BxcqOJOv+cyWshgMIVARqO8/mYB7jONjDz
	nDZS+tXYuLeRm0gNzZ2XcF4RIBkxsOw==
X-Received: from wmpf36.prod.google.com ([2002:a05:600c:4924:b0:493:b275:289d])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6087:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-493c2b96d7emr80737895e9.26.1782988739807;
 Thu, 02 Jul 2026 03:38:59 -0700 (PDT)
Date: Thu,  2 Jul 2026 10:38:38 +0000
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260702103848.1647249-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260702103848.1647249-2-sebastianene@google.com>
Subject: [PATCH v9 1/6] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
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
X-CRM114-CacheID: sfid-20260702_033902_502590_B262F695 
X-CRM114-Status: GOOD (  12.35  )
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



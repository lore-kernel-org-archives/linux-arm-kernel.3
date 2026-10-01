Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FE3CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=; b=AL18lr2nKNHbfW9jCGfoOejA3d
	gKBNxLISHXkH94zZi8uUQXranWCHdeBCmXrpRA0BVIidGSquW7KrGYaFmRIp01F1LeG2ffRLy8rpW
	CjtAWsKEtas5aBgZvCiHyl3xGX+AUBp/rx8wK2QnhdoZcTI6Y9tmT5fhEtIV3Ux4rSrkCS0Hfbo2C
	XGdhFiv6g9bLT/1XRgz9641A4P82nh42xdlykHPcEmhYuot+RnggFtkKgfaVMpUhzYfsU2IcLL5IE
	Zqesf0UFPPgSkL0DmSAu6KnbrHXW2Ujd063PnGqWXsnBSQEhdePbUaH+URdbeqv4+NHfTUWCRp6PW
	yjWOudNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUD-00000008Gaf-2NyF;
	Thu, 01 Oct 2026 08:49:53 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCUB-00000008GYZ-10Ex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:49:52 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso9455335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844589; x=1791449389; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=bm8C9uStODPkFidJYp6GZJpjMOEEpdJsgdX5t35OzoZwrb3V1NSwjIB5OcLV6XGZn2
         VGrD2ZyoryRb0asLHjy0zNXR1ZJi7AM4wMevSz7gA7F3kil6hVyVApyK8H1w06qPn+1B
         926Yp2FW5pwL3FzAA0OQQaVcMtUJp+koNWhrCpvWI9O9uy6eKuOVmx/PzVuH+e2dRDHE
         OgzJgn29GKITbltiVznFnVI0e7vofTbQBmQuU6uu3KjSVeiXvPItQ8/JTIMhbbckSxZT
         NO8XeSKzzjLtf9oGHitopht0//ax7cAKTFkWWRMdRNypuQqQJDGkkZJwz60w8tzY4k4s
         X1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844589; x=1791449389;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=hlEcFB6KeuThT/6mr7e0RSpW1H2hAvr9bDhIkKc0PmHENUcpxwzMs8w4N4+K6dsSZz
         xGaWkquvp5QbIcM8hG/839vfs+CDrOYohAu4JKJse4dqvrJXMyiDf31ez4+6Um2OAem6
         VkUy+hgp0vpWx/znCBOGYrXn6Fhqk6iq2SHtvvSFI2EdeA5G2vdAcXxLmRj0b4bfFOjZ
         +G2mrlp9p66Y6blYgRzaj6TAULTtczhPpnB6hpee3P0gc0AfKdxcqITXE/4hP7WRAsRF
         ho20ajR+Ir+Y0alv69WMDimj2WbICRj/8qc2AoBxyMO3dt55C6qgsStDoiR1bgIc1ttB
         gpfg==
X-Forwarded-Encrypted: i=1; AKwUvBxy/xd6YaBuf02VTXLoIMb6//6aNN3+QRRLENRskBGWHfc2pxN+I+DNehKCG4l+b6ZJtnx1v3vyoypEBoo7YCaZ@lists.infradead.org
X-Gm-Message-State: AFuF++kblJDHcmPZHnuMCeBi097pMAZPMa9y2oK/wByvJ+LEmcVhmAJh
	t0lnK40/mfPs1KxNxdHFuTtNVXVYM8oZQfeMPLB62SMf8B2m9aKbJfctcQTUuzd/DDFHjofb4ZB
	lPRO1VI+6Hswqb+T+1DSG8A==
X-Received: from wmnj10.prod.google.com ([2002:a05:600c:74a:b0:4a0:1976:e6a3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c19:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-4a01adb2cb6mr85618915e9.2.1790844589150;
 Thu, 01 Oct 2026 01:49:49 -0700 (PDT)
Date: Thu,  1 Oct 2026 09:49:06 +0100
In-Reply-To: <20261001084909.2937943-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001084909.2937943-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084909.2937943-3-vdonnefort@google.com>
Subject: [PATCH v4 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014951_280689_58197D92 
X-CRM114-Status: GOOD (  11.27  )
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

kvm_define_hypevents.h is used to define the kernel-side structures for
hypervisor events. It doesn't need to be used anywhere else than in
hyp_trace.c.

Rename and move it to arch/arm64/kvm/

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 .../asm/kvm_define_hypevents.h => kvm/define_hypevents.h}       | 0
 arch/arm64/kvm/hyp_trace.c                                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)

diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
similarity index 100%
rename from arch/arm64/include/asm/kvm_define_hypevents.h
rename to arch/arm64/kvm/define_hypevents.h
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9644c424819b..8faaec899f92 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -402,7 +402,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
-#include <asm/kvm_define_hypevents.h>
+#include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog



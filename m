Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74AACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8iSqv7nsn+0/xw84T8G+e+uKy51ge38OdRp2we4P8U=; b=jQpHWhFdlyTVK7gSxJCtbGRKMV
	gHkrodUpqOmlak+CbFO79ljqjUO6q+fck0Dv/4ab53Z4P8ig3LR9oPZ0/l17scpeNKYUFFhvDiGr1
	KLr9/NOq36umcCqW32aBTjIkqtMga5gt+UwmRdMgf6OJziv8RYoFFtJXzx68VcPKOrJpnXfHZFVqP
	5Gngcnv8Ybj3m7Fehr3XVVy2Wg3t7w87nc+2MxOQVNAQdJ7boXUHtND8Rb6/nS2nMK3+NeSTk5oFT
	TAapJBL9KsjHFYqLR+uhWrJwh7+9CAgvN3oHrW0rtq2quSLLQBuV5mvoErVmY+zyx/BkgXBgcuq3q
	i6FzN6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwe-0000000GzL3-0hiN;
	Fri, 07 Nov 2025 09:39:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIw0-0000000GybE-3t4T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso2407985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508346; x=1763113146; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8iSqv7nsn+0/xw84T8G+e+uKy51ge38OdRp2we4P8U=;
        b=OrWqk/94X9xkBLi6m0ZG8hjdhQ7XL95kUAkpV1uxqV4Tsgqmu71BDmlF7GGSNgXesQ
         mr6OunvsaKbnO1di3PLZb2Yqg+3762Yg5TipMxGDuKXHMNn3KCwR3p4JObx9ijTt8ZaU
         4Eu9TQKBbg9WEyMFUhVto9pGYeDqn/4mbMu0y4GlQfBhviP53Xv7k01jaYIeoMrFN7BZ
         tsFeeafCJHZpk3mSbvq+giXj2NvMnQPWu+xyQuDC5p1bUhqHmqLHT+GKQ6Noa1vwAIJM
         aiSSaHR32dwHzsxpaJD5e+995PWtpx3QX6c0l5ZimScxclBR0izYI3E7fZ0RlH6+kmXQ
         S1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508346; x=1763113146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8iSqv7nsn+0/xw84T8G+e+uKy51ge38OdRp2we4P8U=;
        b=Ntw4r2mJRMewHnOLARTF2efMGG+6QLAjRID2+uVOrJqpZJvV+dW4EcumVIYPFfuIKr
         41A/gHFHpgd4S2OWu7PxLZZMtUPbPV6NdRDGuDp1hiY4r328YtzuO1G8Cefxf8Fr0qwp
         tfhRdVPc/HpjrwEhF8q1FBD+uSDhRtosb0juO5q5Bad41l5DjjbMXbX/XDi4OSzdxgr4
         aJG9eA3ViXwQz/CS47doZLOiqYlrdMYK3ziRj+RQHXtJhJblBhKHsN4SOJAVc4JgQhDS
         yAU5HAlDAVbQZNgDUrq3XCBCzhChUBwUK2xOIpu3GV0HvhxUT1DZr2PsgeNzEyQGtAfF
         U1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpTViL5Gh4PL1314djm0jwL1tajyfp8ZZDAcXeIWCPOSYbjVKEZbNplV25Z8qj7/3ysSDPT3cjjYqKjIqUbWZi@lists.infradead.org
X-Gm-Message-State: AOJu0YxcupJMOYx189jxKPB4CtyGflA+hZwsaI0zTexDIU0m3ZTYvH5x
	qcA3Cg0PsQ/7NNQM8+UcjjUYCWd+W8D85Z2R9Zlh7Rbq3If0JTmrxSJg5nIQ0oikcu+IBO9/hAa
	h+ve8Zh+YgNyhI3pMWz8INQ==
X-Google-Smtp-Source: AGHT+IHsR3qBiRucA8EKV6gtWcPn+2ggqqibNDj6Tp411vd1dft0CpDHY+pu14k+X5SUIXMeB/b4TqMhsuxDYA6Y
X-Received: from wmbju15.prod.google.com ([2002:a05:600c:56cf:b0:475:d898:b23c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3113:b0:471:3b5:aeac with SMTP id 5b1f17b1804b1-4776bcae3d2mr20603165e9.15.1762508346413;
 Fri, 07 Nov 2025 01:39:06 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:31 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-20-vdonnefort@google.com>
Subject: [PATCH v8 19/28] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_013909_048123_DBA9842C 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..75014dc7d82e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -239,7 +239,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 void *hyp_fixmap_map(phys_addr_t phys)
-- 
2.51.2.1041.gc1ab5b90ca-goog



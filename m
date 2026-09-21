Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63570C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMNXFwmnx5s7vUZ96ZeGip3cvNMdnWK8inpODzkfR5o=; b=U9Pl5Osn9kwLKG7jkzmeht6+93
	6k6MRCyN9LC0v4R9yB6rDBRwJnokvqCoGIrT5TmqGH8GbdFN1lBmkClruidHnRkLR3dSQ2d31mpNg
	YIy3GdOdEGuBJOiS1i+hm6dhFoYNTbwFy6CbHMEcSEqdwQAulLKVmL9vVaiyrje03NgZpUWZ4mdE1
	ZRh1bF1NSZpqrqor96+ElrdkbduNQJPX49eqW9EIrfc+UimhKVeJVGojoMUZvI95era0CaLLw+QdJ
	XAale3FuFy2cu/rCi07I4O9j+D9w5dbIMTLDQ7whvwd1hJ1XHQLjlvrmY5/8AY+YGXK//zV9rBRjk
	Y3K9i7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBi-00000002sMr-3OsL;
	Mon, 21 Sep 2026 16:48:18 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBc-00000002sKB-0oOS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:48:16 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so23628495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009287; x=1790614087; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMNXFwmnx5s7vUZ96ZeGip3cvNMdnWK8inpODzkfR5o=;
        b=cM+vuHPezWSpgjux2L+INUabjGH+YIi9DzeEygT+VnWmBquG02CF6q9Dwd+IvtY9Ga
         EbLzu1YUX/8VlAh51Jgo5S855pWef+JIOuDsjt0sCshVIsZidpcexHWVHNSOdaC7gco/
         XH0YQyRpFoRUbXjIowwc8loke81Ok+U0DEvedSaSIT0oc1tWvPYQIyM3lysYrdDUv5EE
         yNoQ8Jyr6AMpYghcDcAxFSTXTdeIQRsFbpZKFLlTtJCLSkyK+lQctBCDnnyp3RdQzN8k
         dC0Njdrq1weAGzvFHY8j7AJaW43fL5H52tJul0J8pTS9015AZUQ+uMGBKxFKjCY3KgGJ
         8Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009287; x=1790614087;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMNXFwmnx5s7vUZ96ZeGip3cvNMdnWK8inpODzkfR5o=;
        b=O2ZCbdr5QuCTrAQY3l6EiQBgZeZduQMi7IYwp8u1gperykQ+FlfotpfnvVGRqFEVD1
         eQug9u3GIOYWzEKGXPjC9Wh1rSoGZp6tBSUsGLywKQluoGMUhI2Kp2uK99eRGFLEIAxx
         Ga1lM3ddk1orBLsHOn5qtxaeWZKlpl+78Vs0KSg9kQvVd0pWa0qx3ntK8qwd7igiC7hZ
         pM+YaE14+as845GEIevWW0qpFWm60/I6c0y8c5YjT5tFPT9z3iAkRvbl3sf4XpEiCeGf
         /gGYdBGXVk+DrVUYop3sNytBt+k0AQU/WSFAIkgkf0eN+N3KkhLENPzYUH70wJCNmuG5
         t9cg==
X-Forwarded-Encrypted: i=1; AKwUvBwNBo4E5DuZJq7TLbMjp/jPj+kOw7VRLT6RRfQxyTk5f17oAz8ugyGPWQCozOHopn0YZ1MNp4oqdcmTUWN81+3y@lists.infradead.org
X-Gm-Message-State: AFuF++k8ibtsuGCTOb0f7RuVbjNTYopU0fw/eYNtYrthKegLDOBHt0MZ
	rjtCEPgNl7bqK6L9Gtk8+8yow4qPtfnzlMHx/2HgMLr2Wax6z4N/b0L2EYYn3xW7bHU+zIK5kt8
	zcwHvym5/TLInp2LhYqiwsHkZCg==
X-Received: from wmber9.prod.google.com ([2002:a05:600c:84c9:b0:499:b8f0:3186])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314a:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fce730865mr103151975e9.35.1790009286746;
 Mon, 21 Sep 2026 09:48:06 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:47:47 +0000
In-Reply-To: <20260921164748.2958578-1-snehalreddy@google.com>
Mime-Version: 1.0
References: <20260921164748.2958578-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921164748.2958578-2-snehalreddy@google.com>
Subject: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_094814_710457_8A1A8CBD 
X-CRM114-Status: GOOD (  10.54  )
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

FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
(0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
a subset of pages of a memory region without requiring the Relayer to
maintain intermediate transaction state.

Add the FFA_FN64_MEM_RECLAIM2 function ID definition to arm_ffa.h.

Link: https://support.arm.com/documentation/den0140/j
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..c78cfd72832a 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -78,6 +78,7 @@
 #define FFA_EL3_INTR_HANDLE		FFA_SMC_32(0x8C)
 #define FFA_MSG_SEND_DIRECT_REQ2	FFA_SMC_64(0x8D)
 #define FFA_MSG_SEND_DIRECT_RESP2	FFA_SMC_64(0x8E)
+#define FFA_FN64_MEM_RECLAIM2		FFA_SMC_64(0x91)
 
 /*
  * For some calls it is necessary to use SMC64 to pass or return 64-bit values.
-- 
2.55.0.1082.g2b9226bbc0-goog



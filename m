Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA0CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddUaiwuC2mzRcZAvCLVUB0QFXxr0juQKTwC4zCGP1k4=; b=YriQNKVB4cF5RkKPG7a26NSMnn
	zXKtLjkj0Ru76WnKpkzcEQHkLcciVqkQr6OrbHuJKGMpPivspdi2AVHv9XcJx/EDe7NpefuaeS1yl
	fJ2osnUuWFc2ZkPuk3OjXzCwVf+VIjxU/9FR3NEjwvncS/keLuWoNUh29Ovoarz3wZNvR+xpqmK2u
	bNVnMbpxyjFcWup4sM4c9xHkg58wsDaB6KRQIvRZL8V+JIYQTeCBOgVQFOFx60Qe60BhBXnRCjswX
	5N7mru34V5u0R+968+csXutE9j0x+OpYml46cMviUIXzJBDaMagQldB96V4OQ8RtZB1hQ5OkBC0vf
	CYHCbiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZt-0000000Dn8C-3D4U;
	Mon, 27 Oct 2025 11:39:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZm-0000000Dn3P-3or9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:39:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-471001b980eso27876245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761565189; x=1762169989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddUaiwuC2mzRcZAvCLVUB0QFXxr0juQKTwC4zCGP1k4=;
        b=oGsctJzYZ3pBsNcgzrHZhu/doFAWAswSagpP9Zk3rKenjDbMq8aMumMrmAbaPvurtp
         UAhHnwTCirz09Ct2fYv9gTiyjQ1lg5lr5qi1rmm1/YgnJolgjj7BSBy4yP9r0r0K5INY
         kmj1sXKY4NN/qUKjfTkg19RXzNeHwUhsCLF671tgGUdYDIDqzqmiN/4ZV7cgpwPj8WPw
         reYu3OR7pMqCPEGTb+C6LkzOqopqDg4TaXYEbWuxkxlezQB4MkAHrJXIZwd/kErO/yg0
         CC+a1XrGo8MFh3o937QqhUgrHohYt3UIsxJmdPW7qStyDX6rAG93o+eFkrDgHvs5LVfQ
         kOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565189; x=1762169989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddUaiwuC2mzRcZAvCLVUB0QFXxr0juQKTwC4zCGP1k4=;
        b=HXl1prLgkwgbikSdgaYSdEheRQBlOnOjgjugDuYUgVxPXxfufhDqYbqu5b41xbTK6l
         VPxL6pez1N7ztQJXBmbDOFvPj1L2q5T9o1iHxPSAv/zoUkVDR9kxXEddHn9WNhwzE9kT
         VHAfku568XSe55HAiadNVoK4r6W/vyrscsbDpPdgZe2/8qfzzhaOWu3bQf7eRVmJ1AXV
         NEpkTBKeNulMBtWx0sZO14ldGQR+++Glzs2xNHtBQCTKxy+ZdwJxDq37wl6i0bysqk0i
         /ID79/j8WOlEj1uXf3EwFXpjTf34dmszaHCOcTMUZTlMQjzoogn71OYpG0RlOs+1t2xm
         z3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW66K7C2R2fSWT4efqj+fGgxFVnK/TWTEmQH0q2sMfZTZBNl4bfX4mUvBDKyIM8xMz1YwDf32lETRf/n6bl0BSd@lists.infradead.org
X-Gm-Message-State: AOJu0YyE8lA2rrTfS6fH6Zckst58PXWXkOwgJ7Y3+hmsYan4fTKvRtRi
	SItMobkGEjZ4QsBD3c4AZvD1sT/Sokt2h77Ni6WBNMW7V0ZbaLvHi8FCnzb1wIZj+1l3WChdFmn
	tUQ==
X-Google-Smtp-Source: AGHT+IHxB/wvK7ZW88eLq2mPzfdrKraGlY3vUxwTIx9YmWHVo3e6D2tmb9cmbK2uH9d6WMiSxuo442zJjg==
X-Received: from wmcv7.prod.google.com ([2002:a05:600c:4287:b0:475:d94e:4d5d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5403:b0:475:e007:baf1
 with SMTP id 5b1f17b1804b1-475e007f163mr66110575e9.34.1761565188837; Mon, 27
 Oct 2025 04:39:48 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:39:43 +0000
In-Reply-To: <20251027113943.1282568-1-tabba@google.com>
Mime-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027113943.1282568-5-tabba@google.com>
Subject: [PATCH v1 4/4] KVM: arm64: Add compile-time type check for register
 in __vcpu_rmw_sys_reg()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043950_961678_77B16303 
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

Although it is less likely that the 'r' (register) and 'val' (value)
parameters in __vcpu_rmw_sys_reg() would be swapped, it is still
possible. The register ID is an int/enum, whereas the value is a u64, as
in other similar functions and macros. The cost of adding a compile-time
check to prevent this is minimal.

To prevent this class of bugs, add a compile-time type compatibility
check to prevent the 'r' parameter from having a 'u64' type.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2b7c8ba8802d..9758ba502ed5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1147,15 +1147,16 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		ctxt_sys_reg(ctxt, (r)) = __v;					\
 	} while (0)
 
-#define __vcpu_rmw_sys_reg(v, r, op, val)				\
-	do {								\
-		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 __v = ctxt_sys_reg(ctxt, (r));			\
-		__v op (val);						\
-		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
-									\
-		ctxt_sys_reg(ctxt, (r)) = __v;				\
+#define __vcpu_rmw_sys_reg(v, r, op, val)					\
+	do {									\
+		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;		\
+		u64 __v = ctxt_sys_reg(ctxt, (r));				\
+		BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(r), u64));\
+		__v op (val);							\
+		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)		\
+			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);		\
+										\
+		ctxt_sys_reg(ctxt, (r)) = __v;					\
 	} while (0)
 
 #define __vcpu_sys_reg(v,r)						\
-- 
2.51.1.838.g19442a804e-goog



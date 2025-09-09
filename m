Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC79CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsHbhKmZ1OiSK/41wYLgD6WQvQTZzuDhvBEA7U0ooi8=; b=st6N5TC39YzTNLtKcOJMiyy4XA
	VYtyNECasu9e6iwtVIG+/7oZ33gnN+eqG7o2HXiS2marZrGQjM4Hjs7HJSYeTTCrgBPIjTVdoPPEz
	wYNFSvnOx7Q9wdtPpz2WBXstxxw8zHdgD6dBEmcyX70RSgKa2LeQO+S34N5F6EUuBJ3DFygZMvCWY
	BPUbtsfG62cnnR9ptJt0JArprPRA8Ox1fwK8BzYjmyfU+DkFRt5cJy2r4KElDovxjopu5mtmQwl+j
	7xBWWIbL3IPTqKzkkD8Ofx/iQAgQ/P532IFBLKK8nnuikv/nbgssT9CMRsCXhbX1GFBk77s3NCdck
	spBYp0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuEd-00000005lgA-41E9;
	Tue, 09 Sep 2025 09:01:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiW-000000058se-32Yj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45ddbdb92c5so18425615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402679; x=1758007479; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WsHbhKmZ1OiSK/41wYLgD6WQvQTZzuDhvBEA7U0ooi8=;
        b=RmikJ4ikTDcS25D7YZt9ndk82MFaLOlW6B69hXUjG5L1Nr7VDO7yDJGGbnZuqVvND9
         36Bk8cxV2l9Hto+cCi8Cz6OVyxzgImk2iRCs5+aup9+u/BQdBX8Jf/4C56KZLW9Pw4O7
         6M2fMv3kei5hvX3c5Hx/eQci5m/ZnMPin4jBCOWj1omwckExQ6IA/motfJEUgpqD64Hg
         mBgBvx+59eybVmD0ZrH301oYy/JuCGBwJ175cFlulyhuLjShQfolszerNLEzWrqFmleA
         +dChpea8SfPlOzBGPva97PWoFBZlYiblJweo3gYa7E3wQohRfPvp+EEMd4Y1GBtCON0H
         8XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402679; x=1758007479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsHbhKmZ1OiSK/41wYLgD6WQvQTZzuDhvBEA7U0ooi8=;
        b=Vgg91U0TYtmtxo5XDsOiq5DlLxBoEAfMAgphizLyH5xAckS60x3Hy+sVCTAN0H63EB
         TUB8h0hCnHq+QIh3oqUm7xlpDayCGr2NwaVUmQNdm+68B0kPIQywoRX3FgIivkf6GrYu
         J2krAysXWfMo/eOF0Iwv6nh1V+8UMExS0ZHSLT4oWYV00RuTkZYapL5WfUmkknlZIJN4
         AsnQL8kLaor2D9fngaWnn3e0uLPHgiMn9P3geUCVX/0vxVV/F1FJ478zpQfNofB8nSqB
         6YPCLxZwa0pAlTHYNcJY9TrP9Sz4oKjiFEbiVYJUD8hA2B1CWYEN1Fx9Gtjq1Bhh8Itk
         8a+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAc6rMkH7oRhbAjMMHaY3kd1No2hGwm9onynJKS7IZ+NPxO2sxwHc7P7j8s7yEFMeoFmIXV6frjM14hSxN/rZA@lists.infradead.org
X-Gm-Message-State: AOJu0YxpbxewOsi5dIcOg3CPdBr1qQIKOYPYI5vPl08kSnzDYK0pA7zW
	ojomNGaNEWMugMkpvrY+oxKca4JqD36aIrbo5djXepmw1g+Qtzufy1ZT+zxSa5Kv/unIH8cGH0d
	3UA==
X-Google-Smtp-Source: AGHT+IEjHXd/BhJMwSGnT2Xvlzjm7L/RZRRvSSkROQ/d/q1T9xTETHpI4ZDw256azJRTjyVe9QNwUwT+Eg==
X-Received: from wrs22.prod.google.com ([2002:a05:6000:656:b0:3e7:4198:a820])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f46:0:b0:3d8:e1de:7e4f
 with SMTP id ffacd0b85a97d-3e642da5119mr7394196f8f.21.1757402678976; Tue, 09
 Sep 2025 00:24:38 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:28 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-2-tabba@google.com>
Subject: [PATCH v4 1/9] KVM: arm64: Add build-time check for duplicate
 DECLARE_REG use
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002440_765050_0587B732 
X-CRM114-Status: GOOD (  16.34  )
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

The DECLARE_REG() macro provides a convenient way to create a local
variable initialized from a cpu context in the hyp trap handlers.
However, a common error is to use the macro multiple times in the same
scope with the same register index, but for different logical purposes.

This results in valid C code that compiles without error, but introduces
subtle bugs where a developer expects two different variables to hold
values from two different registers, when in fact they are both sourced
from the same one.

To prevent this entire class of bugs, modify the DECLARE_REG() macro
to declare a dummy variable whose name is derived from the register
index. If the macro is used again with the same index in the same
scope, the compiler will fail with a "redeclaration of variable"
error, turning a subtle runtime bug into an obvious build-time failure.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note: I considered a more restrictive compile-time check to also enforce
that the register indexes are sequential and without gaps. However,
achieving this without requiring significant refactoring of all the call
sites results in too much churn. This patch catches most (or all) of the
related issues we have run into in practice.
---
 arch/arm64/kvm/hyp/include/nvhe/trap_handler.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
index 1e6d995968a1..ba5382c12787 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trap_handler.h
@@ -12,7 +12,8 @@
 #include <asm/kvm_host.h>
 
 #define cpu_reg(ctxt, r)	(ctxt)->regs.regs[r]
-#define DECLARE_REG(type, name, ctxt, reg)	\
+#define DECLARE_REG(type, name, ctxt, reg)					\
+				__always_unused int ___check_reg_ ## reg;	\
 				type name = (type)cpu_reg(ctxt, (reg))
 
 #endif /* __ARM64_KVM_NVHE_TRAP_HANDLER_H__ */
-- 
2.51.0.384.g4c02a37b29-goog



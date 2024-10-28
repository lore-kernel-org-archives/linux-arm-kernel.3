Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4494AD5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=; b=w7K1+dsFZ2QpYs7bf21wBY414h
	RFrlWC4F8ssQ7tUsa8FwdM1rTKDdSldCD3/hJ+nq/xXm4FLQB9tQdWA5CmZ1fVTtTY2/Je/4OMip8
	Dw27RipnDVCAOO6sM/Q/KjJurCDapf8DqaRSPrnwnu7gtB1uaqbOmUmVKKn2VgXBS6D/+4lvDKvGp
	F7W0iWt7VUNyaEzgunyG3YyXf6aEihCFvhyQigtzxXSR1EsSZ4hgZQbsoxeoVn8hxcO8AnczI22Yk
	90YS6OvqHQ2xi93z+U/3RE6ta2wqxMiqEAzNb4q4d6VCZUjPIif69XfYxjh418eIprvjc+Wh95dfU
	5DUdpKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YQg-0000000CXwU-3iOm;
	Mon, 28 Oct 2024 22:41:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5YP3-0000000CXqP-3LCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:40:03 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so70296841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730155200; x=1730760000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
        b=DhkFLEEEuXhwukDkenKAK4kosDyi2jAa7Rb9RLxFKyQ2oguGQtc0EJGTVvUwjz6nfC
         ksLsLVviTOAOyvp1MjbTKK5IPOJEAGr94EiuCPCO2pcDi3nU6AlCeUWjlUZsrDc8Mjop
         22oTHTuGRBp8yiu/qNC/XsPscc2rdRoceN62nzZ2ds/i/GpdG7p2SR0r9HwFMSThocoq
         jc4S4tczCr1ovNOr/e+2qYue6EkbXOL1GuffxWsWbHctAHOojDmqQqo8oThd7MFU31Qp
         sSFObU1rmfI+jo2duY7U5Z2vUJhBR5wv8KeT2jMfszQRwntVh6bQ21CzdIecKcWSnzPL
         PVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730155200; x=1730760000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
        b=bBML1cDpHouVWsZN1tE12cx5F/z5TbiR+KB+HbKwOci9zop9S4rEr0iSzyeb12Z8/V
         xt4V+5hf7Q+9J2hJFZOBl8+cwzZFkwcFhEMFOFzOVGmz+063W78A+oF6xhL4kQHZLr/y
         tU67J7kp/V/CRbu6+4McmSQ9+IPBRqvkUWhqCCuA7qJhkzAFl+iCjW6uysm6AZNsZL8F
         YsJfZ3rSQpA8588KXm5zXsGc+8YTyx+0EbCRfChrOddw/oay/sAkT61QGMgx0OPF9nhi
         YSBWNdCcooEUsd9VGtK6fYrpRJPirMGlozjNQ38RJ71gM4PPAvEc04LLvFGYNQQQLHAj
         9yCg==
X-Gm-Message-State: AOJu0YzhkZqUQE9jFyeWwOBMCbovb+H88LJEyZDTq75Nsvpwl/FTtSn7
	NISXEjFPPT0I8Ce3ozKfDoaM7upLldcKuba3llF1adQ0Mf+HNjJi0us4SmFyLcU=
X-Google-Smtp-Source: AGHT+IEqkiyR2pvRELICkbistcdpZC3pulGLc6gT6MbaAKcOnjYY7LJUVhv1Cjw5G5zRZ1aSLbUo9A==
X-Received: by 2002:a2e:4609:0:b0:2fc:9674:60b5 with SMTP id 38308e7fff4ca-2fcbdfc9295mr56280631fa.25.1730155200002;
        Mon, 28 Oct 2024 15:40:00 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451caa2sm12648561fa.36.2024.10.28.15.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:39:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:39:58 +0100
Subject: [PATCH 1/2] ARM: entry: Do a dummy read from VMAP shadow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-comments-in-switch-to-v1-1-7280d09671a8@linaro.org>
References: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org>
In-Reply-To: <20241028-comments-in-switch-to-v1-0-7280d09671a8@linaro.org>
To: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, 
 Clement LE GOFFIC <clement.legoffic@foss.st.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_154001_893939_20B74240 
X-CRM114-Status: GOOD (  12.70  )
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

When switching task, in addition to a dummy read from the new
VMAP stack, also do a dummy read from the VMAP stack's
corresponding KASAN shadow memory to sync things up in
the new MM context.

Cc: stable@vger.kernel.org
Fixes: a1c510d0adc6 ("ARM: implement support for vmap'ed stacks")
Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 1dfae1af8e31..ef6a657c8d13 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -25,6 +25,7 @@
 #include <asm/tls.h>
 #include <asm/system_info.h>
 #include <asm/uaccess-asm.h>
+#include <asm/kasan_def.h>
 
 #include "entry-header.S"
 #include <asm/probes.h>
@@ -561,6 +562,13 @@ ENTRY(__switch_to)
 	@ entries covering the vmalloc region.
 	@
 	ldr	r2, [ip]
+#ifdef CONFIG_KASAN_VMALLOC
+	@ Also dummy read from the KASAN shadow memory for the new stack if we
+	@ are using KASAN
+	mov_l	r2, KASAN_SHADOW_OFFSET
+	add	r2, r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT
+	ldr	r2, [r2]
+#endif
 #endif
 
 	@ When CONFIG_THREAD_INFO_IN_TASK=n, the update of SP itself is what

-- 
2.46.2



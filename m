Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB27D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6+NOPrIh4Bt07gXb1NnYdK/UawvL1MDSSHlM6jV428=; b=Qr+jYTN7bmjACmZP9YH/sF7pGI
	Id5RaJVCFU3vAj0WxQqrXOGEexmGhi+Hx/R6FVK72shhBJtp9J/cFYw0sdLQKVU7I8w05W+0yKn7B
	916NNtXK+Se85h4wzPq/iYneogeHJTw35nhwsb4YNl7vMZv1B0WSDi8VZUUbzRfgaUZ/NXz3D+S+g
	KlRCtEo7tmpbCRDpSfOny/3O8VjXdMmXxGkQnrZC+MTzdhUMwBODQw60LwhFMVir0bcbvwHx/05J2
	2o2NTUspYxMZPcD+JX+s9BAsDIrMACdZtjknUDSPQR2wCQQXgydGwGToVoqTuyeCBfjTMkGvyh/Ks
	fys0YdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Jae-00000009ds6-06SB;
	Fri, 08 Nov 2024 07:39:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9JYo-00000009dWg-3u5G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 07:37:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1929012e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731051457; x=1731656257; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6+NOPrIh4Bt07gXb1NnYdK/UawvL1MDSSHlM6jV428=;
        b=Op+mMihaypWz2bX1wNHMmIQjhEf9nIhLdKqQpuJ4+FnGrfuUk0Bs6NIc94FrVFO30q
         Ya5SQPsCvWp51A5K5D5qNWRPzv/VD+H3rbWXZnCt6fHIsAXWPKr/9R2DLfbH3Be2iUl/
         N+xzBJLK49X0oZofn1LSGL8p7pM8Bi/LCnS4VAYT6xNM56rkg2s1dCffetf9tVw7WEyQ
         2rsa88t1xcx5MoJQt13GO5lRN5DhSXBpa9wvRQAjFeeq4QOj6zhDuN+zfCL+udMFumSY
         Peg4vKfqNAZ7fyQRQPMdodGS6mclGOe51D38dkbRAVzDwj+0zkzJOKanLpJ3U71TaSPE
         tSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731051457; x=1731656257;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6+NOPrIh4Bt07gXb1NnYdK/UawvL1MDSSHlM6jV428=;
        b=cQzKhB4H6XgPbAILd84yFy0DbC9Pc74y11VNlZoPqSTlA0ZksoMXjYCDWN/rOM0sYq
         Snv3xCMIvpTjc2mxMLpnAxfFog3n1fLqnDdLulq9FOBedy01LPtnVF8/knKHt2uWG/AG
         6GQ546kF1IOjvt0J5/dOLAG54GhvyctVILo8uDeCywp9zjeZawNFF7UsQXVz4N0KNo2x
         b1vdAViRw8bQvdiSJJ378QsBUdvt1m8nUHwlqlzLO2T9UIMzIo/J4555NAENkW/joAeO
         vin+dXZHK65wGln8LI66OQYIxOoDYKbj0ycv+hg45TCwwAxQkWTOFq2CY/lQ2WHPT1zr
         h9tA==
X-Gm-Message-State: AOJu0YzTQXZYGPG3Sw6IGWGqPXSypgoKqAFzLHdhlnTiwJKpQd2V/hEZ
	vD6OndTf7WI+fiH1lrLk098OUnsR8zDG6tLvXXJ2cHZgX/Z8xkEV7+P4W7lCP6Y=
X-Google-Smtp-Source: AGHT+IEZfwO1BvsXunYs3RGuIPq3yZBvOtCJCFAMH7tkW12EQF+tYwgCG/Ju9xc9oYOfOT6HzBJmuQ==
X-Received: by 2002:a05:6512:2398:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53d862ee137mr795412e87.38.1731051456811;
        Thu, 07 Nov 2024 23:37:36 -0800 (PST)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826787c7sm508221e87.6.2024.11.07.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 23:37:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Nov 2024 08:37:36 +0100
Subject: [PATCH] ARM: cfi: Fix compilation corner case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL+/LWcC/x2MQQqAIBAAvxJ7bkErMvpKdFBbbQkslCIQ/550H
 IaZDIkiU4K5yRDp4cRnqCDbBuyugyfkrTJ0ohukFAodv3hYx2huj5p6IyZrrBwV1OSKVP2/W9Z
 SPg4SFB1eAAAA
To: Russell King <linux@armlinux.org.uk>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_233739_037339_CC244CEA 
X-CRM114-Status: GOOD (  14.10  )
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

When enabling expert mode CONFIG_EXPERT and using that power
user mode to disable the branch prediction hardening
!CONFIG_HARDEN_BRANCH_PREDICTOR, the picky assembly linker
in CLANG notices that some assembly in proc-v7.S does
not have corresponding C call sites, i.e. the prototypes
in proc-v7-bugs.c are enclosed in ifdef
CONFIG_HARDEN_BRANCH_PREDICTOR so this assembly:

SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)

Results in:

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_smc_switch_mm
>>> referenced by proc-v7.S:94 (.../arch/arm/mm/proc-v7.S:94)
>>> arch/arm/mm/proc-v7.o:(.text+0x108) in archive vmlinux.a

ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_hvc_switch_mm
>>> referenced by proc-v7.S:105 (.../arch/arm/mm/proc-v7.S:105)
>>> arch/arm/mm/proc-v7.o:(.text+0x124) in archive vmlinux.a

Fix this by adding an additional requirement that
CONFIG_HARDEN_BRANCH_PREDICTOR has to be enabled to compile
these assembly calls.

I suppose it wasn't a problem before because the linker is not
so picky that other assembly symbols are actually being
used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411041456.ZsoEiD7T-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/proc-v7.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 5fb9a6aecb00..2cd933342679 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -94,7 +94,7 @@ SYM_TYPED_FUNC_START(cpu_v7_dcache_clean_area)
 	ret	lr
 SYM_FUNC_END(cpu_v7_dcache_clean_area)
 
-#ifdef CONFIG_ARM_PSCI
+#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_HARDEN_BRANCH_PREDICTOR)
 	.arch_extension sec
 SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
 	stmfd	sp!, {r0 - r3}

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241107-fix-kcfi-bug-ae3b08cbc167

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>



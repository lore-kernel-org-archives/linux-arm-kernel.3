Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F72D374B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZ6t7ECEa6TXHskG0snKO3BunyXOALdoY4sWT/SldB4=; b=TpWN2RlsJfHcxJvvVBOWuh2GMM
	DjQTo/06uzujUfxQqYlSYZWo/tbTSq/q/sVXA4Qo+FTiSvGHqybh9ey3BcoWaQdc2zebkIkgNjr2W
	8QRYXdF/sgunVTRs8e+SVboSMba0iq2hYBgW0fYDE3JfP/CztC2sMr3aGqIw97ErWJs2cdm7r/LiW
	lidHABwDV2gmit4WgGyRnotz53gqtQk0dzh/TQjPENChNr9W7rQBc4x1BpihxsQBBiooupVIFVzHv
	8CkUJi6TQT4mOIKXYhgzva8I4eyqJt2IwMjLzyTqjLnb7pzkas5LdGSiZwSQhiy44NPPwyOI+p/re
	+LjMYBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vReeS-0000000AAFh-3kDE;
	Fri, 05 Dec 2025 22:51:48 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vReeQ-0000000AAFI-03a5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:51:47 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7c7595cde21so4795922a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 14:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764975104; x=1765579904; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZ6t7ECEa6TXHskG0snKO3BunyXOALdoY4sWT/SldB4=;
        b=1AkUgGTTZ0+m/1V79TzIlA9E8+dsqUahlDVeTr+kHkwl43+dq+mlzzW7gN1P+ADTuz
         tSVWmqTw8T7B34RBNL9bqkCS/7rigw/LhXPeVEYU/dUC/b9Om8QxmKchbv8Wd+j9BVa6
         6qGjWxVBLXJ2iLqrflu4JK6iUN/BwT8dedcE4+N0sACV0WSCc1Mf8fPbYi2jEoqy/NJ4
         TxaJOgZV4KKwEDR8cR/tatyedDyohRUGZLJUCh/18JSkiwLEXHRwL808qsVWkXYXfWLX
         SoDTW1BzK/5OuwZ0CzT93iUTS4pUednYJ9diu5LN7aRJHGZtHuHYk/JwaFWNlLcuub9D
         Cc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764975104; x=1765579904;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ6t7ECEa6TXHskG0snKO3BunyXOALdoY4sWT/SldB4=;
        b=cfHo5MdatQ+P+EdcItVNaTtwNkLTMxcguFyRepELZSt7vUziDUDg+I55ycLWxUmlsA
         +0eRSVq5ZgMqen1zxeYyoDPVpCjbTn0kkTXf385yWbAxJLaEiDHS4DQr9VUw6LoY/Xpv
         6ujLwl2W5ka21wuyrugkOBR3QeZFMVmjOU2YI/KKYh0qKMiZEtKBUOPfGTaCua1TAGFT
         2E41oLHFkfK5wsLZHjlb2xiFzEdhNbjkIc1yWQDs1Mfr7LkTBCYJh+eY11IlbXhvAi7r
         m2U08GOa8NLLu7k0pUIHNcqR+Wo43ORwVzP4eS1lejFjMgB6MqbD2GZN/7KQK1bqHCxr
         ipFg==
X-Gm-Message-State: AOJu0YwElc64afF2EwsmP1wlB5bC6glhtHk8Xxep6yc3n2LEaVg+KoX0
	k8UIvvTPG+XN+y6miNH7SqCTcnO5vMCKA/sRpN7UGmbyMB3N9nXjQElBaHNOzodPhk7QnFzmGoO
	9ngdwqRRMU0FBoG2yLQBprXH2lA==
X-Google-Smtp-Source: AGHT+IGtsCfXiK6Ca9aoNBk4FCPOxvVSHwXC29bCUXc+AJsis0zprJjFy5EwP7iFzoRRKCHwHGUL9V6/X/OhgFQ8rg==
X-Received: from ilbbk5.prod.google.com ([2002:a05:6e02:3285:b0:433:7ad9:4c25])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:178a:b0:659:9a49:9017 with SMTP id 006d021491bc7-6599a986298mr335711eaf.68.1764975104215;
 Fri, 05 Dec 2025 14:51:44 -0800 (PST)
Date: Fri, 05 Dec 2025 14:51:41 -0800
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPxhM2kC/42NvQ6CMBSFX8Xc2RJaUyxODrI66GgY+LnATbAlb
 UUJ4d2tfQKn85OT76zg0BI6OO1WsDiTI6NDEPsdNEOle2TUhgwiFTI9CsWcr+oRWUsu6kuTZ5O
 37F1ZzYTiHaIS8pA3EBCTxY4+Ef+ALOHJ8mtvxb24XqAMdiDnjV3i/czj7L+nmTPOcqlqzOssk yI998b0IyaNeUK5bdsXVem9KdoAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764975103; l=2094;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Ok8jTmdXZxogtxskwYzvmB15+ePBZ1aBYdxuQVq8go4=; b=+5fF9xjzd/gKfdwP8eCwDRuFOJpnnxJkpqF1OjNQdwbauu1LndafYJx35q8YJ0TDFXjqD60mE
 Rf4IC5n1OVHDQPc5ol2vyveK/sd6BcjvbO3xh/WRL1rUq+soDPpFDXv
X-Mailer: b4 0.12.3
Message-ID: <20251205-stable-disable-unit-ptr-warn-v2-1-cec53a8f736b@google.com>
Subject: [PATCH 6.1.y RESEND v2] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_145146_060152_5407C4FE 
X-CRM114-Status: GOOD (  10.94  )
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

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration") which incidentally removed the aforementioned warning.
Since there is no upstream equivalent, this patch just needs to be
applied to 6.1.

Disable this warning for sys_regs.o instead of backporting the patches
from 6.2+ that modified this code area.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- disable warning for TU instead of initialising the struct
- update commit message
- Link to v1: https://lore.kernel.org/all/20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com/
- Link to v1 resend (sent wrong diff, thanks Nathan): https://lore.kernel.org/all/20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com/
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 5e33c2d4645a..5fdb5331bfad 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,6 +24,9 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
+
 always-y := hyp_constants.h hyp-constants.s
 
 define rule_gen_hyp_constants

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250728-stable-disable-unit-ptr-warn-281fee82539c

Best regards,
--
Justin Stitt <justinstitt@google.com>



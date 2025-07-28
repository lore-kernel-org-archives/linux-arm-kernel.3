Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=slHkTPTO23OubaoGcLALPC4EFvq2t1/SJARmRLWq8ek=; b=4xtmE5xgtQ6ry2wp4zvLfkm+Et
	ou6HuZXAsW3uSdcOCnJLecClvkdv76g6TJzOW5eEqvhvTh/BNt4MGYb+owxe1bRU8TwVndzEoh7R7
	ZuTQ0gMfGs0Btb79mw+tLsVn0FoJjHoN23rM1K1yvDXPds9r9yTOqTtzqRfNuBU7J9tcaaeqll62y
	hm33CNWJETo+mzgGzXtrit5bdlImpqO70KcZCUiG3RwVe1HPMz+HnaaKFHDS7OgXdyqzZYRj3B7Fx
	M9qG1ID/6BKQnPHoCLzozKY3rpRA/T/cdvqp8GZdiT4/6WbFskt2r0XAjIsNs7A1teCL0MlA3nsCe
	PMtpzwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugV6r-0000000FRPP-0qIw;
	Mon, 28 Jul 2025 21:10:13 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugV4O-0000000FR9g-1KQ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 21:07:41 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-73e562462b5so3591187a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753736858; x=1754341658; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=slHkTPTO23OubaoGcLALPC4EFvq2t1/SJARmRLWq8ek=;
        b=UwpiTTw7H1Bl/yixt6tTEjjePevCa8HliRIplDJXzy+Yo3m4coxaYgCqHyxTyOFBOM
         FNZr7V3WwmBpqlU7R3+gMIW4XsRrP1AwujuqMef6pHAuybPKfKcLbkW3NI58yAXGb+Vx
         2p6YWjpam3BI2bMJ1jeN4sFnLYSkCB7hEtnWs4OfounRcRkoZCveDBl82JuWqsYltdxw
         NnHv1g1epzQ4oLwd+qvh/oqOAy6EMfJDPp1CcZ+43DSaO8eaU1JE2S4Nn6vr1xrSK16A
         tnuoK/qcnN9AoD+WaAB8hrTBPdcHpQX4PVvJO+Lp4juiw3Y5Gjs91GViqbCnXgie6YCL
         CLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753736858; x=1754341658;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slHkTPTO23OubaoGcLALPC4EFvq2t1/SJARmRLWq8ek=;
        b=qp57LWlZgAW3u+EkfTDpx1qIDa6kCjGeYRPRVPhaKCcgcIFHxMrl680DQKMAxwqxaU
         FKfDQ0Lig85/BsKsy3bhEqfv5QsGF1mKy4XO8KtA8Ypp1DVzG9dd8peMGoHE96eQwSEm
         VIaHKD0cSSEPnn7hgjrbU0Gryb9pSEUbhKjEpr8Mh58RM7iEe/RD01pd6tfenS4avDWE
         KiYFEAdb+zLB+zylG3oWSv9p8MgGqizhrG+hDHPyX0xWyTNIv4yCFEvezeWlKNLZR+Wj
         iMONcUZJ5N27nM2pwix2q+ZF2JT4vmLXmIZpYMdIFY1ZJUpoG3cpyeoNvl3BnZo0HA04
         4/aQ==
X-Gm-Message-State: AOJu0YxGMBXNpy1nb8SRBkxVppG/pSkOulwaSDYBSZDRsIOQoq7YaHO4
	grT2HFdhT4aHzbrjEZQ79r2d9Yd8QRw8T5rQiiIqjnXDwNU2gSSs00b0U6JUkt+p8TFDxoAZpms
	8yZJLBPNj4YtPVywkE3fnPdluxA==
X-Google-Smtp-Source: AGHT+IE47Z4A3+D9s5HwxzIu2gGt99OXTdaSbCqZ0hKtmsL0LHdSzeDVlhRw2PjDnFeNQYwtxQNiod7Q3hr1gALGAw==
X-Received: from otbca17.prod.google.com ([2002:a05:6830:6111:b0:73c:b634:7b70])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2641:b0:741:5d00:e86a with SMTP id 46e09a7af769-7415d00e9efmr3612294a34.8.1753736858551;
 Mon, 28 Jul 2025 14:07:38 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:07:36 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJfmh2gC/x3MQQqDQAxA0atI1o04EdtpryJdjBo1UKaSTFtFv
 HsHV5+3+TsYq7DBo9hB+Ssm75jhLgX0c4gTowzZQBU11Y08Wgrdi3EQO/uJknBJir+gEcm7kdl TU997yItFeZT13LdwLV25wfM4/t3NQ751AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753736857; l=1926;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=VYvyAPR2rjDj8OeNJRruAu8npV1N/RHzlGka234BYnk=; b=HlGzpA+TYc3ck5X9eKZ/5YyDluZ21Hq1Gvc/SoBUkfkiAD8EgpqAOtMwdmCUD0dG6UEsL7Jja
 ZVx2abnVmotBHZV+zPnLise4jybp/uEsKfEPTnW+S6eenOBCzZVTrLu
X-Mailer: b4 0.12.3
Message-ID: <20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com>
Subject: [PATCH 6.1.y] KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer
 warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_140740_358607_0D30717B 
X-CRM114-Status: GOOD (  11.52  )
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

|  ../arch/arm64/kvm/sys_regs.c:2978:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
|   2978 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
|        |                              ^~~~~

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration").

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
I've sent a similar patch for 5.15.
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



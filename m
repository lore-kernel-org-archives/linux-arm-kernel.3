Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EBFCD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lI2FhZeVSW/rDbtlOOBPVMTchx/8Z69t0suel1yDoGI=; b=PszsC53mnrCyP3F1Nck8HZ2LDB
	6sjMHTk3hfpbsW5Dr2k5WIK/38Wt3+pS8HVckQRS+Qq5AECHUNDc26z6YbyTtSDJgmX0x4nP4WOvd
	OcjNusDh5uQCx39OJGwLxyVEW3QhKD9sCBRxV9KSZVRw/pTSv5zzLpMRKwtFQdVIbaOEmQ/K8KQJi
	yyxDAzeUdQLMxeuFNeOLhqjA5eRoRuMMq+G9qkm18N8248Rj9lqpTgcuPXmfmFNnt0HDu1pVatzOp
	Sbad9+jyBA+Hbtqejc3NMG+O6jC/EpPSMZNjbrPlc9eRxrppEtIAoej1QgN2kjKGIf+ff0LC7Lh+t
	81Bf4Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZQ-0000000BSm0-3Wum;
	Fri, 12 Jun 2026 19:29:36 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZJ-0000000BSWk-0Koy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:30 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-486a24852ddso2048324b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292568; x=1781897368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lI2FhZeVSW/rDbtlOOBPVMTchx/8Z69t0suel1yDoGI=;
        b=wWjJ4Rud0Yn1BXkEnVYRf24O1p93mNih2lRmCeZnJACz0dGvULmkpr4U8c9p5ib9cH
         ybHSS/YJInYm4C3nhy7Yjo5ETtc9BQ1oiwPB/NZElMWR54YL7XXwUkNqCE4MXZcTT9vI
         MHgitfK3CHXsEd8JpxgxMT/aKoTKDVcX0I/Eur407RhxZyFc5Zq2gSZBXg7pkpDAZkGI
         /14nFZLMnrgLoadZTbIoCVl9FNgF4/a3tNzYlywo35QEu6q+XbnRCgRYpvFWBlx10Ywe
         TBX8wmsA7ftGFcQyJ5Ob82e0fgYAxwMqN+00qBJbtxfU8YfPmZtrGiuLjXMAh9wKFxm/
         oDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292568; x=1781897368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lI2FhZeVSW/rDbtlOOBPVMTchx/8Z69t0suel1yDoGI=;
        b=tOnOpYND7OzTxpcxzDVTsYSmKtVIXTFVI+5rfGh0AOl3VMC/SNo56puPl7j2dGPhSZ
         qL0EfgIT0Qcu3Oajwsw84BNjV/NgH0VL0XIsHrY8AFMGbJtCbZ2vl74tMTpB8pkXLlBQ
         4HeC8Gb4sofuFlhPFESbzuMoLxw7NcGUv6BLz3bE6gHfvtil7lSO0DR3sxV5HZc+ue4a
         +Pi/3Zp0sNKuSsENMq+fk0BaHWNPKrGJ7PfqNXu/LSzazFytK6TD1Aa+oKfp0phEAIzI
         oArmQuLFWNTtaHvhEdd9GsITZqzOJepiJLn3DH3J0q96WOwWEqztbXKFkm+bqGlK0TgP
         cFIA==
X-Forwarded-Encrypted: i=1; AFNElJ80unhuYJX1gmX4E1B4xQaVhVagLbKnFlT/xV1x0m92cCWDwp0iWFUccZwdfLhKbmI0OLM6hl0Zw0QXBUOVJCdY@lists.infradead.org
X-Gm-Message-State: AOJu0YxknGBRXAaaXwMIWUIVEl8r/IGEcKWbXpkHF4mGRMgWf2S4SmnC
	n8Tuc8ZwW48Ns+UoI7ulf/QFePCUb4SXMfxi1/AgphOn5AQPncwUVud/7+TBtgiEJdF9KSGaBvO
	NeQyWF5TKRXKBwySh+IOtHTG5YA==
X-Received: from iljq18.prod.google.com ([2002:a05:6e02:1072:b0:500:26db:d9ff])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1b2a:b0:485:467f:a306 with SMTP id 5614622812f47-4872f352d35mr2615199b6e.4.1781292567951;
 Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:07 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-20-coltonlewis@google.com>
Subject: [PATCH 19/21] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122929_129245_0CCFD54B 
X-CRM114-Status: GOOD (  13.89  )
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

Some selftests have a dependency on find_bit and weren't compiling
separately without it, so I've added it to the KVM library here using
the same method as files like rbtree.c.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89f..fa7a2746b1c13 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/io.c
 LIBKVM += lib/kvm_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..5534248c663f7
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../../../lib/find_bit.c"
-- 
2.54.0.1136.gdb2ca164c4-goog



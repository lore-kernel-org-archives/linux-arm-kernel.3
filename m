Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsCXtS0F1ozalP9OgDEtI+4ABXzVdG2gEkR2YSb8sls=; b=19LGS3ixLRlTTU8+0SEPJVn/FJ
	1K1ksdcdTe8B9fXnBOTS4QhIi9pBwjJVrd+tOepPQaslGmYqRlbmM4Sd5S4T+EWu9+fmp+VozGOaz
	yBou7kxGXOLXlvCtT28chevSrL/WYePxd8kZtwi73DKjQIM/RRW1+qFGmWnUGJb4PXraE7rPMgm+A
	mJIHsHQNmvEgUnjcyNxwJ090NYOfD6XaTfsYD4arBb5nt7PzdbVRa7bRfNYuzYAXE+LFzuEXo8f/U
	VKT9QjeIWMV0IYk46BUOuHjxHQw9uBbdjH/YHu+uIHtXX8CQxaCyE4/g90RFI9ywuncxHq7y5FDps
	oIB5rzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RE1-00000005rsr-1wIX;
	Mon, 07 Sep 2026 04:44:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RDz-00000005rs6-17Uz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:44:56 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-862815e2683so1599531b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756294; x=1789361094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsCXtS0F1ozalP9OgDEtI+4ABXzVdG2gEkR2YSb8sls=;
        b=kwTBlp/jnHx3ZFywGJHyzeqmtAqzs+DWEIi5GJx8W8ZlTXU5/C1YDprXJJE5HIBcio
         8Fj2g9TU86xe9AXHksQ9KjJhODoWsHbv4AbAMl3+XXLV5unHTPx72w8ibXgzFEayTi0x
         15vHwd1YHUnTTyl9wBumwaujX2bT1oHhAmrBJLvTHX7XExvYz2M75GZDUadB9L1mt8Tr
         j4omOcbOwV3ZjDgBhb7Llj1MxmjcItfaM41QSZHg63kGQ4OdLnjmTNxTX8URgnoksDyO
         fV3h1wGsIGro0Vzn3CsWA1Is0tYcQtlE/LaVUU317by/ETSzp9ERwBd8rKcPbEu50m1j
         S3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756294; x=1789361094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsCXtS0F1ozalP9OgDEtI+4ABXzVdG2gEkR2YSb8sls=;
        b=QMgAWsjwOngOK8DQSxENAEScqXMNE0J38RSJenwUrD87Vk6xQfESRFg61J3C1hK9Bs
         OeCHgoeabYpKieLLJfVmYUQU+I7LBvsFhIR8DeNYJlZ+wGqFOLGrpsWPkX4R7t4Z2sxD
         KXpqVunuX6PRYnhSKmPH0UkH8JQoI0KAkH7OYWi8y5VDSYms7rYcjYYX3WLJO2F5eixy
         CEsVUuVhteur9fuW4984r/JaGxBZ7nYggOgvkXQU9iiEeQRoxwcxJ86FI4sFTflBMZ4N
         1XY5BasYZqvsIX+TcQMjUTNUsvLJSL5L/wXmyTD3QHFdaEk9S/26fsooAUcKQx4y7vlr
         LCnQ==
X-Gm-Message-State: AFuF++lpyQEdM85ToarXJ47zzSU/nw0CRq5cuDA9D8cqHmYHYvjDRLdy
	CFInHZJ6ynSMl58lH8Z5qfHXS2VIuqjV+nNG2UIuyXXvmDIZUX7MPWWJ
X-Gm-Gg: AYBFou2qVTelrGdbX3k6bmSeSkZXRMAv5u7U6vnIL5uLEm4Sqqr7R7hzYfx5wL3pYJV
	Mlmq9a6n4/fitkHrElho0euXxhKf0apL7/M5BK3LqxRbMY3OnJAtBQdJgNMfn/Uy/YWOcBKdZMJ
	3yHzQSHR5z03QI5nRkzEZqMMk5fNZv+m21UezMyzmkErqSHLqBp/blFBDEDuNfxYT6UsRWlqSGT
	FmnKnvzazzfd9sIZo6biKH2ar6BjtiRgxcY06oYTL3UUsQdSswGPUjkmoacyWBNWQLFY9SG9oDC
	1TTdtcJtkBA90rW+Pe1eJStefK6UANKTe8dPDEwyhxUx8ouxJhiCotsfxfhSFvm0Klys3LvT4Ww
	k8dTlHlmKlPz9XfoQ9AqvGyCpXdkPe/cM8g5GUiGQ93otOlTBrJKZoZeuPzC/f0QkGFmvUuW5kf
	6C+xAoVtAmzFSxT6nheXP2/sLwSnIDbPwzCP9UBmcJQmj+X8gFCdyb9NP76z3XTbzB4rpnSHvsF
	bodMkfJwY3zxA==
X-Received: by 2002:a05:6a20:9630:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3da39ee15d0mr32834555637.11.1788756294346;
        Sun, 06 Sep 2026 21:44:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/3] selftests: kvm: fix typos in comments
Date: Mon,  7 Sep 2026 10:14:33 +0530
Message-ID: <20260907044434.4682-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214455_309160_C3B27F55 
X-CRM114-Status: GOOD (  14.11  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
index 7dc5f0b4f6ad..9da6dc5bcfe6 100644
--- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
+++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
@@ -387,7 +387,7 @@ static void guest_code_ss(int test_cnt)
 		 * Enable Single Step execution.  Note!  This _must_ be a bare
 		 * ucall as the ucall() path uses atomic operations to manage
 		 * the ucall structures, and the built-in "atomics" are usually
-		 * implemented via exclusive access instructions.  The exlusive
+		 * implemented via exclusive access instructions.  The exclusive
 		 * monitor is cleared on ERET, and so taking debug exceptions
 		 * during a LDREX=>STREX sequence will prevent forward progress
 		 * and hang the guest/test.
diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 5d96cdf382c4..a24becda9e62 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* hypercalls: Check the ARM64's psuedo-firmware bitmap register interface.
+/* hypercalls: Check the ARM64's pseudo-firmware bitmap register interface.
  *
  * The test validates the basic hypercall functionalities that are exposed
- * via the psuedo-firmware bitmap register. This includes the registers'
+ * via the pseudo-firmware bitmap register. This includes the registers'
  * read/write behavior before and after the VM has started, and if the
  * hypercalls are properly masked or unmasked to the guest when disabled or
  * enabled from the KVM userspace, respectively.


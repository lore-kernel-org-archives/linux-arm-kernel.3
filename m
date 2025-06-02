Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B2BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVB/n3He0PUlo5Tdl7uIOjIZvaOC3NNae41+U8BzpWw=; b=U/hkpJhp6w3A0mTTv9UTaOnjlt
	WRCHnY7/lo6OLKI7FxJe4iqB+oXJR79KqFuLv6EjkNE76Yg2QW4lG8KkHKDwW8l4F0ZRsaOED/c0u
	D64NxAaKEOyjfzQCdzL0zOzC7cEMGzZ2LrkZkB6RfgGQ9GjEngkgdwzsU08dG5EyrI65nRL3Qf9fk
	7UKglpqQYko0UDx9b6fOeBuNZdjvmkwQydOOLSSgy95V2KGos2LqmN6/mSyMuCI8qHdGG5NXcYJNT
	PwwlRqEXNeSz6gnUoPM+NhIJt8ladzKVPufDS7bUeUvHaZJhspA42rGJUSsAcIkG4UMaj5/gZ/5y0
	9sBpO9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAz1-00000008XTx-2fbZ;
	Mon, 02 Jun 2025 19:38:07 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqE-00000008UBi-0oYP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:03 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cfea700daso289641739f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892540; x=1749497340; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVB/n3He0PUlo5Tdl7uIOjIZvaOC3NNae41+U8BzpWw=;
        b=aGp56NSUw50yk+gfXRZ3vDhAoEFw0qy/iKbEBMatvFTW/MWfsAh7GR5ZE6njn5QYHK
         378V1HYMY1vEJDiLFYplnOrruilk3iCP4/UmtDGchgYFkBHs1RfFUa6ZVPUxCG5PAqev
         nA+Cjz9uH4HN87ojXyrlbnxeN0pLyBEHbaet1jp9Uu4v9frYeDRg4YQ6XZ+2AMzG+FL9
         wz0Gq3NkIzRFoQjKLQSKbpc7QGwgRu5YiNxHe8hY8wLKgZ+KT+Ut6Natu+WN0CskBfrD
         7o8T07MMz1kRDpDi/X5u5BeQoX3hdQEOU/j5CJaiYWgttR/a4Cyau5Gh/dCCRG0mRV+u
         qmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892540; x=1749497340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVB/n3He0PUlo5Tdl7uIOjIZvaOC3NNae41+U8BzpWw=;
        b=qPacqV1tf7nYw4aeceRoIS0HEL8O2OzI3Ozo17b/P1nzN/uXSkFy+3+6JN6zKY7bWX
         CEpCKop/VGOrER0247X0SYur1bUT9eeUOiDLWer0zyYqcxNpd9jJ4lzQnIdz6+FQVS2g
         6RG/SfwTrVUWIZbF4fk8xRSiQn3LLvZVTptNVw+NCeQ1k5MV71n4SY+t7JPlkYKzvma7
         vaBGO6QCsuqyGEGNdhyFQS7tmO6c9CXdbiB2Jp0RVauYSEjxZs3RdBRiHKp5A12nkdS7
         ZpAH2ibC7c/0BxAIiVGl7L/82bYZjoCkMNWq4oQF0jD6H2PCNfL+7zeluyLUqGNGDvqV
         HfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX40kEnLBliJmRjdw5AXyXXwNfofdbFuTtuFV6nRZ9TcSc2uS7PvUj8B70wgLSKPCW9slG/YBUjihs2DHzpE2MW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/J9xN6vdxgNnvw9N9mi/fEiM2HV6+QYewy8PPYKbpePvmyjzV
	g5/k6PkknjZVs2H1b2/hve/m2beb0uIQxD2bUwmy+stettuhTFr3hjDjyOZuBcj8wuXukslxajS
	g6/uMn/pMYFfstJlILrb7jkMI4A==
X-Google-Smtp-Source: AGHT+IGP8Tr9H87Uubq0BhuyNeY27JD5iCuR6Hrz2NAJX2PVsu7lMWY1S1KfCHmBz3Zd2wWiWUQw5wTiYh98OuafJw==
X-Received: from ilbby14.prod.google.com ([2002:a05:6e02:260e:b0:3dc:64a8:fc81])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1a25:b0:3dc:8b57:b770 with SMTP id e9e14a558f8ab-3dda3370d7cmr84711015ab.11.1748892540564;
 Mon, 02 Jun 2025 12:29:00 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:48 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-4-coltonlewis@google.com>
Subject: [PATCH 03/17] arm64: cpufeature: Add cpucap for PMICNTR
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122902_235451_EBD1095A 
X-CRM114-Status: GOOD (  11.75  )
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

Add a cpucap for FEAT_PMUv3_PMICNTR, meaning there is a dedicated
instruction counter as well as the cycle counter.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 arch/arm64/tools/cpucaps       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 578eea321a60..e798a706d8fb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2892,6 +2892,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
 	},
+	{
+		.desc = "PMU Dedicated Instruction Counter",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_PMICNTR,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR1_EL1, PMICNTR, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 5b196ba21629..6dd72fcdd612 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -47,6 +47,7 @@ HAS_LSE_ATOMICS
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_PAN
+HAS_PMICNTR
 HAS_PMUV3
 HAS_S1PIE
 HAS_S1POE
-- 
2.49.0.1204.g71687c7c1d-goog



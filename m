Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17491C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZuljOjVKEheANDj4X5NFu7CpRnHqZIPs2oP4fw0GcM8=; b=x868PAJ4uxJXQ1g8GaOJnBl/IM
	f0/toEDeDJnlMJdI9EupLMRdIGSAKQBiKyKnlQFvOHQpKwkUDOaamCtuRC/j1W6VokI2iXaMu4z/B
	9hi8KuNzXrhof70+HKfThfyRKUUh+WMNBulUhDCsuZH84QS2BZ4xvpT6YdJMnAHZaE+Qk2j0LgS3P
	7HI2M3j/1+bHl75K66+klrTmj8NoOmVmd7CWRipmSI3VTHYQOdHVXkK33BIpLGVLeAl5IEWsj0IZM
	owGwVnBG6y6uw3vBbf5BdHyhQ5byFy6blnod11QbKOVbSkWjwS2vhyVrhVU946isMnLI0hg20OW8p
	H4j9qiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCemA-0000000FZ0e-0D3T;
	Wed, 07 May 2025 13:25:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXX-0000000FWG5-42dd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-440668acbf3so8773345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623422; x=1747228222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuljOjVKEheANDj4X5NFu7CpRnHqZIPs2oP4fw0GcM8=;
        b=Z5DJyvX08tps6xeQdfL+cSVB7PvSEt7ehy6MVFLVVo1U1SN036PR+oGs3ZqqZtX5xb
         ZRp5x5duNgHeH4ZbxfUlDO0vD7XqUxa4ZYtF/hT8nfl7OvtzOajAQhQwelH+DD0fFaXS
         CIiOQYOJGg50wuVyq1t0L3UB7BBYH9cI5GAGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623422; x=1747228222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuljOjVKEheANDj4X5NFu7CpRnHqZIPs2oP4fw0GcM8=;
        b=O42NSjfqvPycWAnyMG6YsPrQoOQn7YdSCN5WMQxMT6zc4tD4QBGoEOJGhAy/K/CNYv
         f7YH5SjpuW2fgmnSx8E3zkNuWRfnnjTdJQGow5TStmAo3ku95xE1FmdEmJbWzQqWRryI
         LteTMSyiDuZVVDVSmTUIEdoUYgINdhOMDAUl6626Gx4mtBXUWuXLkyQugqF7m/+Kg/4u
         NwXNg8MG61agi6zXU8juP1aXtl+hTIIEwV2KBCmKAF1Y6umNxoiSWvuFjragfcmjESxx
         XD6yzHDRBp7iAaR7tT5sOH+176ivApXsBjaNV2gqf0wtd5ujFjC3jEjKQ/N+p95qVqb7
         8pqg==
X-Gm-Message-State: AOJu0YwE/YKtu+utG7DjwNiDMaM3Nfd+sD4Stybqk3EBiJgVcTQzvfF7
	7anHPFlhK8E3jlgbf5rJ+cJkMGa4o40VZXSekIffS+MaIeXPbzJf6KGKIzozfRGhltd3z9Npgb6
	UUA==
X-Gm-Gg: ASbGncs979DxkRw+byuelabJtYfZK+BfzchiLn1FbpDDOzRy/uQ1mSA5excl4B8j5YT
	2buxFgzzq8UunrMRyZtYA6PiwOD8RZOBcYFwVkB15/8+Qc0Lm5i5m3lMzF9zif8EHAE697Gl8kX
	IuuIFtuV0wqblHN0YMWJRsHfy5m76HkqynWpo6p+GYktdOoM9+QJ9/v5w0m4wBoj5zE4j3e+3lH
	V84F/EfT3lkjBhpOSuhXAvD6F1Gjncyqtdj7xdeYhCbMYZfcCdiOAJ2o7xedsg+QRwv5XeanKt6
	NBDGo5RfNHH7iv0xo/pmNdFwSeoPLDFHlR8qLRB3wAIRbnT7vHlejW1i
X-Google-Smtp-Source: AGHT+IGQdVONhAnziM5XOmvjkygUSVMeNIhGXDruc+oA+VZgUio51qlq4lW6/p72ELieysS4m556ZQ==
X-Received: by 2002:a05:600c:3d9b:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441d44ebb3dmr9248255e9.9.1746623422143;
        Wed, 07 May 2025 06:10:22 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:21 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH v2 0/4] mm: Avoid sharing high VMA flag bits
Date: Wed,  7 May 2025 15:09:56 +0200
Message-ID: <20250507131000.1204175-1-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061023_999182_7A87EF55 
X-CRM114-Status: GOOD (  16.98  )
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

While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR and
VM_SHADOW_STACK share the same bit on arm64. I think I gained enough confidence
now to call it a bug.

The first patch of this series is a straightforward attempt at fixing this
specific bug by changing the bit used by VM_UFFD_MINOR. I cc-ed stable on that
one and I expect it to not be all too controversial.

The rest of the series however is a more zealous refactoring and likely to be
more contentious... :) Since this bug looks like a near miss which could have
been quite severe in terms of security, I think it's worth trying to simplify
the high VMA flag bits code. I tried to consolidate around the current usage of
VM_HIGH_ARCH_* macros but I'm not sure if this is the preferred approach here. I
really don't feel strongly about those refactorings so this is more of a
platform for discussion for people with more mm background, I'll be more than
happy to respin a v2!

This series applies on v6.15-rc5.

v1 -> v2:
- Fixed a couple of typos in patch 4
- Added Mark Brown's Reviewed-by tag

Florent Revest (4):
  mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y &&
    ARM64_GCS=y
  mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
  mm: use VM_HIGH_ARCH_* macros consistently
  mm: consolidate VM_HIGH_ARCH_* macros into parametric macros

 arch/arm64/Kconfig   |  3 ---
 arch/powerpc/Kconfig |  1 -
 arch/x86/Kconfig     |  2 --
 include/linux/mm.h   | 51 ++++++++++++++++----------------------------
 mm/Kconfig           |  2 --
 5 files changed, 18 insertions(+), 41 deletions(-)

-- 
2.49.0.987.g0cc8ee98dc-goog



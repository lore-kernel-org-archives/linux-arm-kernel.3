Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B4D6392B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=; b=NGag73dvW1d1WQ/Swt+ANUpjN2
	p7x94g5jnFUwLTx4zGo3++1MsKSQY1KCRNq5ZTCQFTpzZMpRggdo6MG/ogaktC4LOzFHtVX6KZSXc
	fnp6iekjCxnebOm5x/By6K5P+Tlf7IW+IZfLZgBvVQ0ARz3eXzzqMy3u2KWKzYm7WSpZZ5SixsE5p
	xKbG83G6ScFAr5+ZXKVDxupLjrAARlLWF9oG2xBk0Ar8R/+pDdnJByrXZPcN4iVhFowEssmL4Zb38
	JpH38kjttguatQyl48K8m3qXIhBehK/ruW29XcEkTJdTLCEUGXcKqtIclSDzo4EOb7LgbbPwR1Qjt
	+uL8dYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiTh-0000000F8PP-3hNz;
	Wed, 20 Nov 2024 11:02:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKl-0000000F6V7-3KE7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4327bd6bd60so12909355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099997; x=1732704797; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=bJyUT2ONk36zP8DX8wOkoKTYrzuqOUOus4uMpdf596FkSu9dCwOUUif6xsAmphHNIL
         tj8qfi8emvoIMHcR9/VptzL45SQv8QGe6dL/tGOSCxkvoc6FUHCEKCWqP7zVL00J21+j
         +FQ5GX33TCi5D7NxW1nVg97ApSFU0BF47HE9pvlcc2Lnchdo6QEu1g65NTkc2NYVA6XG
         qi6UP8tvMrykejhqhooO7+fw03fQq1ibe0ou5ph1sBvP1JI5MGN/+y4gyhfotDd63kE4
         bupG0W+5oq/oIBMxPviwxlcNq/6eJKBRCPxrW8O8aCeI8tSoFGStaEkC+d/IWjnGjmen
         bdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099997; x=1732704797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=F/0g250Wvjry8ESiGG704fY1hIH1FmAkBQZPerqLjRGOaEa18wDCJ9LjJzAArLlRVW
         3wvSyxcTb4tvgt4sj9WZrEKpGHcdzkKAg1ZCWwmegISJQV0EbJKTnOnU0qHNQnqByAZB
         oy+/SVia/C4luuZPuXQQOnXUblbeTJwlAZCWizvdOJIHkauiX6IQpd/RrvPHzz2SmIUz
         aQAL3PR60PJOojZhqI5Lzp/HFgnZ3d9urmYQ/8Fcrvn8amusLMrTGHXYGhhQYb3xmfvJ
         fLBr7XNOBzyE/sUIs0wk1x1cGtXCRHRba7ii1Hq1X8CHXb82okXfEt441HDtsPNboIvo
         QpVw==
X-Forwarded-Encrypted: i=1; AJvYcCVJV/KrBlfJOW3WG+B1AL6IPWzYRDPUOoyP10B6hyUCDiV2lrEn1AYH8vYCCFKW0mWP2s8EghfMC4SS+RNAA1bN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdg6tzGyksxwdPoxVDjx7J0FPntkkwXmX8O435oTcez8Suyjxm
	p6hfDG6Ool/uIj/jToKv4H6oZBKQ0h/IZHhkb25y6kHVhcPvSbuap6itBbtGXP65Ju43fzYMSA=
	=
X-Google-Smtp-Source: AGHT+IESPaO4CPr0NA1Ub5Xw8vv27byiJYHr78DPp8A9WH6e7qfhaRGN7COXOiASlCtqkjlPzdISATeTEw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:1c21:b0:42f:8ce0:a546 with SMTP id
 5b1f17b1804b1-43348904911mr13335e9.0.1732099997594; Wed, 20 Nov 2024 02:53:17
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:51 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-10-tabba@google.com>
Subject: [PATCH v1 09/12] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025319_827156_FFDEBBE4 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

In hVHE mode, HCR_E2H should be set for both protected and
non-protected VMs. Since commit 23c9d58cb458 ("KVM: arm64: Fix
initializing traps in protected mode"), this has been fixed, and
the setting of the flag here is redundant.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ffa500b500f2..cede527a59d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	/* No support for AArch32. */
 	val |= HCR_RW;
 
-	if (has_hvhe())
-		val |= HCR_E2H;
-
 	/*
 	 * Always trap:
 	 * - Feature id registers: to control features exposed to guests
-- 
2.47.0.338.g60cca15819-goog



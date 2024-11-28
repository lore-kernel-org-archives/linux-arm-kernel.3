Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FCAD69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=; b=4yxkgQ9l/a/HHS1SzTWrQU02iU
	jiV6yvSDLoX0UyQVi2/VAT/yM7SaoTDThgpdyQ7slNU+vxFGpm4v1He6x7ycMfsMOeKaGHBiOHhXu
	5GvfOZFNTisxZvGWOMiBeEqzqjrmoV28jxAnF+zEbfa0tvhGWHkGNu28bQ/Kz+Q7164Ffm6oPzJt0
	pGVRprmPA2J6Yxc3GNBkmtg8oobHMT17ti6JwxhhRkoww4wx2Q39jHQ7H0+3X+xAkj+w833Im2PlK
	LqqC9XxY/gFwOuAAe1dAKKcsJXneukMcjoRE5Hkdfcwa90BLuWW/UKzMJzhq08C/ywffthaecpWwE
	/L3QXvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdtN-0000000FWet-0czU;
	Thu, 28 Nov 2024 12:45:09 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdk9-0000000FVOb-2adz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:38 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3823fe49055so426550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797335; x=1733402135; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=d0Crng/09BD5BRZ2O4abecWjGBnqylkGgSe3MM7fay9VBrtWY4SZHoFzl7XH2mwldR
         zJ7e0VU+Ty4zj6tSoikbG0uvqoiVpsXSxSdMwRwnRbA0JDdKxeSzT8yXbbZErzlZKltD
         pNvnRito4b3rdWRKGyn+rUXXlL30vxPy2zlrpgKheR5cXC3dnk4d7gmohoEZI/9+9q4+
         p3K9HqW1oqBlq7yujX5YePaxu442knXvdO7uonxhkq4eNQg0UR+paY0KqeEaAdlDyr3X
         KIHRkjCl12+k5pGig9ySpPQvwUVYpu/h+c9h9VnGrWx3gjYTLwQxuhoDYl2pAllqqWtG
         NEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797335; x=1733402135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUZZOxNVC1lLwStyPm7LTR4giJNaFKBwnVTKDXsGwgs=;
        b=cRfFNep5vrj2jz5V5qAQZwQSxCO4LxuwTMUYOK6y8MX3ApbGk+k4NMrEWmKY5Qsy98
         qBUJEt+dQjw6xCM1eL8n9xjeJAIJZIJjgdJ0TOVkYB0UkxkPKDSJ7ot9xuTGH8ENjXL1
         5dNlxSSzrQEdaLASuqoeG9zc/0r3kr/AGWi75OocGN8O5QVW/6tUuXz6N0AhR56zixZ1
         mMfVo5m92m6ylpkxCYV46krews6NUQIYosq+NOs0C+QNYEUZdq8at5PMUY5BLnmG7f5A
         9yengPX2akVjZgfnbMNjv2xq4sDOKZTkoGW1/XxP7awlz+EIzCaUBRgXOJuLtXbO0r/J
         Ilhw==
X-Forwarded-Encrypted: i=1; AJvYcCWlCYEjl5Zx/5qDZSvrQndn3P1uGfI6DRsEGX6MSJWj2sWap9Im3LMY5DKiU4P+SRB/fGt5NeNTIcaRU1clYohT@lists.infradead.org
X-Gm-Message-State: AOJu0YzbytbsUgg8y549llghbaYFlfZxVaF3QnZjcA5PtNj3fQKFN2oD
	HOFEhnyXU3kEV50P4wxQph4sfJYXFcOhCe6w+yFQi4/cO4+8yNBbAL7QkFnpgLWxCFn/h2FKhQ=
	=
X-Google-Smtp-Source: AGHT+IE/V3C/P7DNzcXS3lGwl583S3x3wQlwRkkO36vZH/VHuISUNxEAOit77rO5Ibvk9Y+foXKgNZfkuQ==
X-Received: from wrbfr9.prod.google.com ([2002:a05:6000:2a89:b0:385:cfa6:7962])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6c69:0:b0:382:59c1:ccdf
 with SMTP id ffacd0b85a97d-385c6edd378mr6228766f8f.46.1732797335666; Thu, 28
 Nov 2024 04:35:35 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:09 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-10-tabba@google.com>
Subject: [PATCH v3 09/15] KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043537_651043_D50E2DF1 
X-CRM114-Status: UNSURE (   9.00  )
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



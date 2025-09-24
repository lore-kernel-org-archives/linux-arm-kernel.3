Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29079CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XviAeY7lSeSaJCaNoApmoT1KMIq12BnZAiqMT/S5OY=; b=042jMlqelm8igVsM/pWEja5uQB
	KlUafNxEYI+UcL7W+HIEN/SeZTG9sTDP5XKIVPDL5H67WNJ1DL+VRVKcS5O2sfb8X+BvRLd2EPGUj
	Xit0zSbCziFwVEk3bnZHQ0aNKievHdLegIEHVLXS/VrEf2GNVGKzzsbY3++0qFQkxu0kKkiMdmWW2
	wDIb5N1gHpKPUx5b+a0QrF4OfLsO6hfUKf1P2lhpjz5GUw5ZsX4zfjvWYy/lWbs1hJbqhMytnta7e
	iFWO1/MImw66A/4x1froZtEL1w5dN0KpMPNeCwCTsedpnF1XUauUP5Erg4QSd67lhgaFGsGEkTlRw
	e7aBLnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP6-00000001FMX-0vYA;
	Wed, 24 Sep 2025 15:27:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP0-00000001FBS-2pUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45f2c1556aeso22656855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727648; x=1759332448; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XviAeY7lSeSaJCaNoApmoT1KMIq12BnZAiqMT/S5OY=;
        b=xYWYN5avWjRkS9aR5LWMVyw0i4x3y2uHTqjTp0XU5T4mGDGq0NgWDQYW8EGB3L3AWQ
         4/6RB/xYLQwuMgGpZmOz3A62rUXw2Hzdxr+V5TlKoXTJ30FglZFLFQYnVRsdjeI0kpD7
         IsbaevhY5Hb+ePq0ae74O+S2A6R9FDTnxKTMKuq7jK4JtQ/h8k2j5ISsH5+Ed1863tBr
         RniVGUKUw7LuxZxhpz5eyHcglcc9MvMoOTIgrU1RPJwzIc/Mz4tDkLkcXdekCvvVvL13
         uYcOfGdZe/Ko0ASrevzXA0ISa+ZHFXb/epYlc3bLuYSDIw1KQ17Ek4JP4V1TGPQmxOLE
         /iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727648; x=1759332448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XviAeY7lSeSaJCaNoApmoT1KMIq12BnZAiqMT/S5OY=;
        b=ofAcvpbfXKoLUj/HrleUEKacmdRzBy6VwmUYHEN6CnKolJHgar0RhADOfMuqzXRQpq
         7vvEOSyaPyCPfn48dGhgNirry5lXv+7NDqoCYWDkgOf8DFKiGDf6tIewPkIc2Gi0EuON
         qWhe9cCt7xObE2wlNVKhMzBrNzepSJkfZ3bRrSnluRKlJLjnOxiFxjX8F4RfiHWIXnmz
         dTU5Y2d2vkM7Ar6lPHI5Ti+XrLOybmZH30UTmS3elXDzJGugpfB7pnGkRAWHN4KQxd7A
         Dvfz78A6BipKz8BcNb03Xuxr5uSu6ql7PKPwdDyomU06C0gCq7BOntxbw/z2z6wl6MVs
         sD1A==
X-Forwarded-Encrypted: i=1; AJvYcCUMKCzmaKAdOEmpAvs6zrr7VCvIqZMfxuAmpXtZlMgUkkBQ50vUiCg2e+HkhaYnwvyRHmo5EH3vu8Z0fDrJBFUg@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOpK7EI3XLigI/6YDkOX+IYCPGqcNKzy4xiF/9PPfhmzpQt6G
	ig6/8IUnXy8A8Pxeqq8/go+j/d5JxMdxvGNHRPY6hBt/ui7yrXPWg/SZqdICsRBiDE7RlGatzA=
	=
X-Google-Smtp-Source: AGHT+IGGX7f3s3fIS7F6JjZ/EdBwQsTrzEkrdjWSZ27jkWwDpVAWC72cO2yCYMURkKd1dYsCB5YYDcSL
X-Received: from wmnp7.prod.google.com ([2002:a05:600c:2e87:b0:45d:e45e:96aa])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5297:b0:465:a51d:ab
 with SMTP id 5b1f17b1804b1-46e329bbf5amr2850725e9.15.1758727648403; Wed, 24
 Sep 2025 08:27:28 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:55 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=ardb@kernel.org;
 h=from:subject; bh=nKwv+wRF8AczbIGiloggDafTMLbsFJ1dEVBDncfmiHo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK7yEN/52J0oxlKw4rvHFWbdru73/z3MPftwrbj0RHO
 959ZjKxo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkz2tGhu18n7TLZn0/d9F9
 2enNSjr+8u+U1bwK/1jHv9rbdeyOnTbDP901L/M0p7qkTt3/xy4m0jykxOHNvlcxM6K+lAZurev R4gcA
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-12-ardb+git@google.com>
Subject: [PATCH v4 3/7] arm64/fpsimd: Don't warn when EFI execution context is preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082730_726552_9208CD37 
X-CRM114-Status: GOOD (  13.63  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Kernel mode FP/SIMD no longer requires preemption to be disabled, so
only warn on uses of FP/SIMD from preemptible context if the fallback
path is taken for cases where kernel mode NEON would not be allowed
otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..d26a02ea2bb9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1933,11 +1933,11 @@ void __efi_fpsimd_begin(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	WARN_ON(preemptible());
-
 	if (may_use_simd()) {
 		kernel_neon_begin();
 	} else {
+		WARN_ON(preemptible());
+
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
-- 
2.51.0.534.gc79095c0ca-goog



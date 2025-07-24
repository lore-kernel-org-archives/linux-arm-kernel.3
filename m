Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FFEC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYcAbkjc4Tkr2KyQs05DD+oyBfj2e0/3qety5W33Bjk=; b=jhz6mQfKR4ogJDzKW0hdtv3Epv
	rfwuohcmw2LBgkwQlOWJMb2mpjVvv4xQFYAZdvvwFVXVADaa3tU5pR7ZXL8YBzmxIUdoBll08KcGQ
	d8W5Fos4HQ6VQwhTyBU28smrVmt/+jdC1FLEjC/7O0Iat6XiSbwNcErADY/Qw2Ec3cJc63ycyLUo2
	TsKUBlnPTn7xtiUggB1C5B8q9Bnu+kyfryAgSSjlUgmMGM1QirJl7QTRWk1UusDjXsEuFwxAJTKGM
	qvD0y2XhVA1X95zFZanpe4TyU4OlfCQs8/UXZljdBBxk10QfHSiqsXmi34ub+SSjQT0g18OQelmku
	2VeZmKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0lm-00000008D0U-2V51;
	Thu, 24 Jul 2025 18:34:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezFT-000000081xd-18CA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 16:56:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-75b5be236deso1130071b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753376210; x=1753981010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYcAbkjc4Tkr2KyQs05DD+oyBfj2e0/3qety5W33Bjk=;
        b=VC2w51SMnB8Y4KxSxLj05nazNIqvW9IjqT17FhA7LmBbq9T70L+E+1NlzJjytjh4yx
         N0xCX+RLeIidNz1w0s7q2MbIdUCYgkuqcRDDrKMswImNwzX/igF4mLDtD3T+8nqvZS47
         cu9wsvzK9U02UhuT054wND56SrCgG5l/Ar3vOIYNgiV1q0ElVCDh8Al1dSr0Ktr3V+mF
         6HdJuBy4TY0OnFGuB/qIiufzWXh/seOIrAKXJQm/bN38m8mvnTmjPsEFVxUctymT/Zo2
         zYSERE+BW+6c4LwqrGRK0ErDgglQkaaMjdT4R0zE//uJI5GV7qWHFWov+xKlVA/63jpT
         aOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753376210; x=1753981010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYcAbkjc4Tkr2KyQs05DD+oyBfj2e0/3qety5W33Bjk=;
        b=tb+vhZwLo+iWDUIJfZYxzHvdHM2WZV6Wm/zHfwBS1sYxYrFXUj48oarR/P8EsMn78d
         ddQJS/KWHeIZu1unrr2lW/nmUVLPxrw5nY2kk9dqXwB+sphp9zGwZ+4NUlOUNNVOW0VU
         HnxmAiqtJjwOl6vrWg/PJMte3wVKzVzLuuMTxZ6AEMe5TGzMqgLlk6/w0gGhET56iAm0
         klJajko2X5ele+c65r3E5gHfKGjQ7aVshL9KYtMIt7+3iNRMVb+DuEt2WDLY2L5+bNoB
         E6cSPk2x7fggA2qS77ooCPJ5EZn4l7G7q0IGTnfbkRGVqxaFnNJkIVLfrlbbnHoaE6xL
         LM2A==
X-Forwarded-Encrypted: i=1; AJvYcCV/z0FEvyvnTcgIKy3POk5sMfflgKhSdbdbWmEc7BsXWI6vvfw4BFpuGRlOK+FAxaVpXtYsXrHhKQOjSBBYTVZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2HUMKwSUoKUtSi+LdC66Lv0xDUjxcPVqNHGsJD3F3eCjzyOI
	SXAP5MRgAQkMxrBs0AUuYVD2xmMkHODzVbpFd5F+9DkjFLt35o2KysZC
X-Gm-Gg: ASbGncsRT7+763qn27MAfvyEsIc6OacZNrQ+y3z/2ll+1dGrNeP79pqzFAnWks76796
	mJIgaTvorrlSZv9Rt/5vnDltGpc5f7f1H0p/twUm4zvRxFVXFqg/HbcWyDpq/jCRoKjzi4gEVR6
	SfUoT8bT77XqKULzwXSEchKVE5sKf6HoSXvLNi596e9iwbQRgsmgacfsooCD+uZziRnJMG78aoC
	KkojUoymY4czwthVQjoV1EPHJxQojwZ3Jblq7fbXu2Y6oo4s5Qe572YZlBd8CZiqzFc5Z+Ztu5n
	HaWenYFl0rL4LPRmfBXgf7XG1tHuPGyXIZx9NyT788ydHp3OMvzLpjyLw2Q2xxV86u0oaIHMGBf
	sTlFbV/wZLTDeejvdLyDC9mOcw/5wAdLekg==
X-Google-Smtp-Source: AGHT+IEx1SRGfdVyHhlPutv9dzQMR/t+xKkZ8lw/2GL680PVA3DqTsdXoJDkH0z2PXFFMimZ5OowSA==
X-Received: by 2002:a05:6a20:9c8b:b0:23d:4777:49c3 with SMTP id adf61e73a8af0-23d491bf059mr10760796637.32.1753376209985;
        Thu, 24 Jul 2025 09:56:49 -0700 (PDT)
Received: from archlinux ([2401:4900:6318:9e23:f078:c919:e302:8d2b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c1261e2sm1786314a12.66.2025.07.24.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 09:56:49 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
Date: Thu, 24 Jul 2025 22:26:39 +0530
Message-ID: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_095651_304623_6D5673B2 
X-CRM114-Status: GOOD (  10.53  )
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

The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
This patch changes the minimum allowed CPUs to 1, enabling single-core
non-SMP configurations.

Additionally, the default value for NR_CPUS is now conditional:
- Defaults to 1 if SMP is not selected (non-SMP systems)
- Defaults to 512 if SMP is enabled

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 arch/arm64/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 393d71124f5d..9b2970f7c5ec 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1528,9 +1528,10 @@ config SCHED_SMT
 	  places. If unsure say N here.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-4096)"
-	range 2 4096
-	default "512"
+	int "Maximum number of CPUs (1-4096)"
+	range 1 4096
+	default "1" if !SMP
+	default "512" if SMP
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"
-- 
2.50.1



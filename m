Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C58C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57IWby+qaE9u34TVQ+Hjf6+RWk1LSFPxd2VsjtgKr4Q=; b=NuQ4LH+yvODi6imEUOEtqB3gjf
	cR8TDAh/NyhhXZDIi9NNZxIpqnfia3xZkgIR91fBYbGa8p1R79H0ccqpvsbQ62CWO4zPLdbC/cYPF
	qahSivTY1LeGMpCqlMIZ+DYPwLA0I6xxYRbmQ4maFAqpUWlG0x2r9d59kFNJMgI6G5Ei5P/rGCl0h
	yPIPZkL1zvv8inEUlJ8gob5Bv3cFttQdmVBV0wcJnWmvPc6KsRMVncEXDsXPLCik+L4kk13ad+5Bb
	DZzfOrCYHihjroxHXja5XPz6Eo+NdJ3Sj3kxZ7AATSL6dqG71lLeoloPp5psAXcShY4U55ft6+e03
	Ef3xR8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLzm-0000000CprK-3tol;
	Tue, 06 May 2025 17:22:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOg-0000000C8EY-1JOQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf257158fso31207665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538305; x=1747143105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57IWby+qaE9u34TVQ+Hjf6+RWk1LSFPxd2VsjtgKr4Q=;
        b=Hq8abDxzVJS88msOIQcXUsY6P01E0oKIaMXc/iOXNdkoxSDDFt1uMLa5fqQd7KhNs/
         tBQifI4q9sNzSWQprdDRA2cWzAkHYiMqNVIlqUmyCxtX7+67dJsMRS4GOd4yya6QmBaQ
         L5aMDysprXTO8DIwyHOQV82Jf9hLNg33Gv05sJVS6QGVPnP/LVv/MwWbcQ/J3yv7+LWT
         bUYeOR9/NhelWdPwCfa8G9BgpVd6WVHSFBh7qIibTs91YumI1tX70BFs1kIBurmq0r4r
         Rbxw2o7jOxQXDMxRLPQ5YW1H8AI4vtZUOpll3f1JbgQQZ4holrrUwXphqj0LYs8vq52U
         AiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538305; x=1747143105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57IWby+qaE9u34TVQ+Hjf6+RWk1LSFPxd2VsjtgKr4Q=;
        b=JUzhf0GHpb00ijLlKKiFiN25p0OAStyfw/AwgtMlLmPqae3eg0XE2fAyznrELDt52R
         vdmIKV11iom2SJtDW1d3PHsLSOTRkqGHbESIeDZslGLUmdKfY58Vbx0CxheWEemesStu
         96r6RduIXjpg5oJuT3YqTkU22YO7/FplHVoT/F7P5uODNOi4gRuZ9BK1sAQdyKSuvk0k
         8dqm8OL1AMXYIR86ELU1dFFaUVVye+HQvYAjb1yyuTM8n2Gf7AneNJ7TSAL1VqknbTbS
         DMuOXj659beZWThtGrA40SzZlgToXTpPkxPDTiI8g3ZwUqs6HljksHHzAPHvZcB3a2qa
         2lYA==
X-Forwarded-Encrypted: i=1; AJvYcCXHDQNl0JGmfe0gFUYJs58yo+ThDLXQizrqB3TyHK7h3+MglkcW+uWa+w1Z2Fjz72d5CbSTfKaafj4kMh/9J7GJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyE+cGkm5SCPMo8Znf9bhF7GE+8mFVfUbzzh5nHc2Wf3y8Mzgxo
	DCuWO6Ye/H+tkQrBCKz8LNp4zCZSmoIGGEnkYTb43HEoxctgBtjV
X-Gm-Gg: ASbGncsRIWRhW8fplDYEOljs++bYAzkksubeSzj/unTdlghyDY1y7l+zPWuLUGXSex/
	fTrt90mlvW84DoIKVwUssd+KnFg51kUcSu5r1lZnuhRu3BttNMQ/PuQ7h3hGHO1oXGitvKPeJW3
	9Z/2PFKUDrPhmLbQV/DQaYqrF8ITJ99MQUNQ/lJtpQcai5AdpNjQCf9LpslqNlIpf94o0SC59uD
	JBqwpkO2ZlRMVDGzmSCKfVZTzTDbVdKkVf8I7kPVutrtv4WBHDq3o++9C0O1Ol1p75v1XAaEPYs
	zWSnPBdLarH+T/467FTgW/4HlUfZ96UzmavSSrutdF5hKtmROxgCBLxP7FrCJlEr8jGnh3kiSDg
	Bu+GOCYHV4oJPnVfmMF80dtDbVJXvifhq
X-Google-Smtp-Source: AGHT+IEvv1Z5THS5tibUElgI4dKx2y74bPajxwMQy9esgr3008eK8zCwSUNUF6GXyvYpOT2zFugfQw==
X-Received: by 2002:a05:600c:3d0c:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-441d03960bbmr35914845e9.0.1746538304676;
        Tue, 06 May 2025 06:31:44 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ee39esm168868705e9.21.2025.05.06.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] firmware: tegra: Fix IVC dependency problems
Date: Tue,  6 May 2025 15:31:16 +0200
Message-ID: <20250506133118.1011777-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063146_354825_EE144A43 
X-CRM114-Status: GOOD (  12.90  )
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

From: Thierry Reding <treding@nvidia.com>

The IVC code is library code that other drivers need to select if they
need that library. However, if the symbol is user-selectable this can
lead to conflicts.

Fix this by making the symbol only selectable for COMPILE_TEST and add
a select TEGRA_IVC to TEGRA_BPMP, which is currently the only user.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index cde1ab8bd9d1..91f2320c0d0f 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -2,7 +2,7 @@
 menu "Tegra firmware driver"
 
 config TEGRA_IVC
-	bool "Tegra IVC protocol"
+	bool "Tegra IVC protocol" if COMPILE_TEST
 	depends on ARCH_TEGRA
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
@@ -13,8 +13,9 @@ config TEGRA_IVC
 
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX && TEGRA_IVC
+	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
 	depends on !CPU_BIG_ENDIAN
+	select TEGRA_IVC
 	help
 	  BPMP (Boot and Power Management Processor) is designed to off-loading
 	  the PM functions which include clock/DVFS/thermal/power from the CPU.
-- 
2.49.0



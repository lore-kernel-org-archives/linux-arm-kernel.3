Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC0C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Ixc1THfJdnAMw/BKiEzGtjmAxEFef8cRNT447pbK/8=; b=Q7j+mEuc0Fn5pA
	jldvGfPN7Xyhy2k+EIScKVB3vrKk1DJSM+Hv3PEIqnDMzuHY5+LuNnxnlbM2n048yVSyCPupcT3Gd
	YdT2vjFW+xv1G4PsJjHTKmquVr998PYO0SWCwQha1BnQNK6fbcI3012sgxtxY49WJiLuLsGpQWYHy
	ioVTsPkOrRKhawpf0Gd03IRZ2yFoRaIJ/DcUi4UxFArk55QzMco8E7rWmbcTwMWniuMCw1EPNxMXz
	f6P+X7/DaT/EZr0ESQHx8vNE4iR001EyPtf7+/AgaDvXRyqPwdoiJDqcHmqRncSVb/toKwNmBpQ0A
	382V5NZVji4Y13hbwawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsqK-00000004R3I-4AXn;
	Tue, 11 Feb 2025 16:10:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thso1-00000004QOd-23gh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:14 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so9144842a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290092; x=1739894892; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ixc1THfJdnAMw/BKiEzGtjmAxEFef8cRNT447pbK/8=;
        b=FxUlkfIMoZXzutbeJljLiIq0ytrIZCHWACzuJp+v6nIVB6r/sM54534bvHFwBxtJ+d
         /OwELslJ3+yGM1PsF1PFVCtScWnpJoxGfcuYjzHbBs23lq32z1DCjjvP8IMdcGOBxWUZ
         J1CnG4jVJaVtNM5D6R5Fr/s8bTmtq/6u2kWYRlNOra2l2Bub9dsspdiKsAuhp6n7tss3
         lF9Thrm7boVsNWCHccNuu9246IkJnOSce24SKG/C+pYmTvrPz94NfAF2Y382ZY5pBZV9
         doC6TylNzuZ5aC20mTfUMqZRgH2BK2OwZnfUWvegtGRoXSBDB52q5aBmas5FEkikb0c6
         himg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290092; x=1739894892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ixc1THfJdnAMw/BKiEzGtjmAxEFef8cRNT447pbK/8=;
        b=Pqy2MMsO5a7Qz+Yj1PMtWUAJIHk+hxRznVq2S5ibRu4Et5XbydveFyPMwz3EK3zbDz
         njUDPe99eONrnyZQwdEPzvWm9s9nBOuel4vokjakNo+5JiJLBpTqmCkt0Z91nL/ZIpLs
         WJAfRfRrhOkvYzUAllISjCQmgxAO5t2qZCUOJr35Q1DRUM/vdtsKAHDcLEF8gzbZLG9B
         DwesP9Wczvycwo3O6jqQK8L6Lk+O7ntLjWx/Uzsb2OghqVol0FHfdxhKktUA4b9Euj7P
         2dgNXrc58ooN4ltXgHv993yA86ruSiEBGcZNiCq3mbvGJ+owmnnxPDgC6UL3okY2IyJR
         RGbw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ88e80BD55nvyNuBcjXaF1WsIKI56avN2B+4OTigkoKC+oRMb5DUIdPToEwtG6R5Mbb3g6qlc8pg6pB/rwsL2@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTSK/vq2T2IDuI1M8Bm8FShLk0ovsaaMyC1rX3jd5W+LpLHIM
	kFoAz9ZCYcybXR40O+C+IIojr7SyDEaZqJ3H8D69Pjd/nWVVug27
X-Gm-Gg: ASbGncsZKpo8GScg7xb9vEGaW96lTEQpoVBzDNFC3NpF62NA1hp1LPhIoDaAkIPxC/z
	4TfGbZIa0RD27h0OMmRpnOIlefJuwauAZzJt2aCPSG8SlHw2dsogeLH9s7klteqZztlV3PlKQ30
	LXuJfLz+xt7DX0SIpAO6SoMgGTM2RkRl9UggBoUmDGgCDh5x9OJf5MAdrq/wr1nUk+oJIGJhR9X
	2NhpEcOBm1g43UVDtdVEBnv+h3Ji6LXUe45Y7gZZirnY3AQel/ZZx8kfX4CvOVaO5ub8KuJnUzR
	e2ei0oy6PaDUrXq5gQ==
X-Google-Smtp-Source: AGHT+IGUgRw95Xr5p5dnLjRuf5lW7GFqBihDMP62NQd8lMGS3/Oqusjqad+1bvDfuQDFoX5VFLQOqw==
X-Received: by 2002:a17:90b:4f87:b0:2ee:d63f:d71 with SMTP id 98e67ed59e1d1-2fb63d16655mr547999a91.14.1739290091498;
        Tue, 11 Feb 2025 08:08:11 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Wed, 12 Feb 2025 00:07:21 +0800
Message-Id: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALl1q2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ND3cSCgpxU3eSC3FJd00TTROOURGNLEwtjJaCGgqLUtMwKsGHRsbW
 1APVHuVJcAAAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LhWKPpTipmLEivaGN54U0rIDOOw1aCiRMd+yRoDvpMg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xhx5X5ZyZ9c0S7S8AqLAss0fNOYSurIR8iI
 1MgMsTYRqiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t14QAKCRABygi3psUI
 JKa9D/0ZvnMJNLT9eidZ6vnHegswqc6/yypIZuzVV8rtSBXxbRzjGJ2KkBj/IQj+mPZZxNMjee3
 K6y3uflppl6Qk0nqnxz3f33yIT2zHfqbaAoupm9PZNcL2dKtKSgxv39VlhPOhXK7jzEtI9Hojro
 iFBcgFdET7U18wHHHaQsOZLO/t73mlZ9i3rCY+vOnSj2KH3rA/r47XNRvLhWy1YUuqPsYAwXFHU
 domqHN9pWbmcGQ/LEmW5vGmUUNXGT7YWhw7Sqy0/QK+i9LkI98ZeGFuQq0ux7JdXgtnFjzWcxJ5
 J58yhkWb6iKAztnK4Ize+k7BvofuhKI9r+8FjGtWz3VMkGESsOyDGA/RHLoBYQUj39dzm0aRU0m
 0dYlnRE68z7spsqs6d1kNelPcwraWYZY89hSEsN3KSHtAlVzJ+DTWrjzHBNvTbflHW+69I0qE8U
 FANVs+jYI7ZHnYrQdoEElMUCGWDDMWPymyYkeoD5YMauWBY7jc9I1jlJwIf8LeAabu+g3fgynFE
 soGVzcH9PLSSs/lMTJ6pY0enYGl1MabEouv0/Y4yX802RgdNm3laJTYQQclq2YHgx+r65IgGj3R
 +uzd+B2sylPAb5mKouwjhM8X0UXGxCRjiZArrhYKU8rz6lPdWhJmt7NUjTrlJUKiPGOPLvrSK7r
 fnhYnkPHdiYs23g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080813_534494_07658645 
X-CRM114-Status: GOOD (  10.90  )
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

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-5 prepares the driver to allow adding support for those 
older SoCs.
Patch 6-10 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (10):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU start
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 776 ++++++++++++++++++++++++-
 3 files changed, 752 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>



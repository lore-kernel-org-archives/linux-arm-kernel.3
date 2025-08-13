Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF95CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ScJXeGO5IweQbEuH9vxc5nxPkJnywpOyzMXLuxo14s4=; b=yCbgiu2QP7Jw+04I2UeWlzeDdg
	6HycwVx477ARJAA8cFvFDhBxBsoQxKZLt95FQSJvYeN8p8t4JxWimOQ3amJMHD/8SRNUtdd3zozMG
	z0gUPJvaXAy8dN4gwlpZbHXY35gwj4rs5vPV6AFI/2TzTxL7InZSJ5x5WtoGcQ++JX9v7i3tsxKau
	RFIAxyNiHW4e3e9k6GFuKMTilBliezO5yxnQqnVf5173SJwiYuOaBd3bLjeazYktGRS6SeaEJih+v
	0t6RVTL1pMv3ngR5RE/oSch2JynE/vQBN2m/gKBmFqac4W3SLEHL3IBRv/xrUX0jlBjnR5nuggZ/R
	ydYf0JEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBhI-0000000Dn73-2NwN;
	Wed, 13 Aug 2025 13:39:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFB-0000000DiuJ-1ZTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:10:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-242ff06b130so17409185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090616; x=1755695416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScJXeGO5IweQbEuH9vxc5nxPkJnywpOyzMXLuxo14s4=;
        b=AvUs+9BPeunWK+VXGAcQbOrVgkCp6K9vbiOVJ3hnJQwXygYLMeTsZSJA0pDRjn3Krb
         xtB5il0XVlL6CJGD9i2ttMiUuqr6K1vYIX8Sgbl3JeWyXOqievGSdxRhM3fkytRf+WsM
         zUi2BvU3PhfGhvTbB9CNmx7JzQuQ4Pza0TYsgfthpSwEkVa2Zb7BIHLu90+HgA9Hbckz
         G9IsHDCLlOj7ZBVKtCOELteHD1KK8lLiFrsja6yIhtC770iQ0MzhTfqxOUNGgtkZcEyQ
         Ca6V9fhp3v4u26yuVsitmvusxsYVR0ZO4BSqPMEKhfLMlb2JgBNsT5za1zVmesbU8ZE6
         jvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090616; x=1755695416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScJXeGO5IweQbEuH9vxc5nxPkJnywpOyzMXLuxo14s4=;
        b=aBBhrZWBM/lNZF36q6n53ugIrkO4wyJy1uVGOCdoOsrDB/Rww9W8ULtJ0QOJ4hrOXn
         jIW9Q+X9DPw9Xw1o9AHQylHYFAQsWkKIQ+b+0p1RZ+GoSsW6IBha2NJ7IerDiUSR24lm
         8aWRIG+xdGh0X7lpxzPvBfkg9PlMzpz8q6z7xD1LGFRgNRkyvoxhs5uLNxSHTW/4duHp
         0kDN6jkRQf/AoIN0tI/KS4fLiQUvRHIcn35047TLYDnbpVlgKglUdZUJ3O1cy04MMNky
         QSKFuK1zQm5HSAM0/Y5ef2gyDUtULlk0lpS93+DK0jW2CqOETkX9HG+wfT/JU3jaYxEB
         wzEA==
X-Forwarded-Encrypted: i=1; AJvYcCXZixfcy/6q0UHwMJvk9iVI3cltH2gLE4Mi15Yw2dsECYhSm01JDDSSOVU/PRQ0orO++heELGban8dqBxR8D3Er@lists.infradead.org
X-Gm-Message-State: AOJu0Yz77wRIeKMXcG5Puafwo0iKlEcyd3sSyDogqZRpHCqVbEtlkox7
	sIot1NXEEpd0QvnAYUaRXQdjKPoG1mkSSdoRUEASAHLz++LL6+GfrWfp
X-Gm-Gg: ASbGncvm13WokvpBiRF2bSYn98eB3PVq155yNSrcfPoONspt5GhS/xgVxLOenMNWW4Q
	ABInUpNC8Rd+jN7SVlnqWacg35JY7Q2jRx+3i31fqCOdEBBvjzz5kF5RpPc9JrVOxqBIkDGHCul
	agVpQeSykyzSbNQ7FUKj9M2HHHEGw7gRhMKVoakbyDDYXXfBMEutxAFk3bcOcoRmrAG/aaWJZYV
	R0tvaEew+isKR+Ea0m4Lt1h1t/lZNaLr6ac4pSlZBUravz/SsLu84uweTLjpVkUHnIultDCYVg2
	6I/PPoGVrKInDtmYLExheiEZFZjNucPCjM4pBeTs0XTO/D/Mbs+PopVRCnlnLYW/llPr5tSqamu
	xkU7BpVGLilmgpZOaFwf2I+Sanx36SV0=
X-Google-Smtp-Source: AGHT+IH33+Bx0AadFrZDKSUeKUgXROT5vWDMhH5ZAyjluyaTV5iWp5JdCqXwDtIfUbpUHGZSWzxXnA==
X-Received: by 2002:a17:903:350c:b0:240:99f7:6c10 with SMTP id d9443c01a7336-2430d0dc5a5mr54548855ad.1.1755090615667;
        Wed, 13 Aug 2025 06:10:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mateusz Majewski <m.majewski2@samsung.com>
Subject: [PATCH v7 0/7] Exynos Thermal code improvement
Date: Wed, 13 Aug 2025 18:39:44 +0530
Message-ID: <20250813131007.343402-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061017_414627_0C494D6A 
X-CRM114-Status: GOOD (  13.99  )
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

Hi All,

This patch series is a rework of my previous patch series [1],
where the code changes were not adequately justified.

In this new series, I have improved the commit subject
and commit message to better explain the changes.

v7: Integrated my RFC patch which improves the IRQ framework
    for all the SoC link below.
    [6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/

v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

I dont have any Arm64 device the test and verify
Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.
Build with clang with W=1 enable.

Please sare the feedback on this.

[5] https://lore.kernel.org/all/20250430123306.15072-1-linux.amoon@gmail.com/
[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (7):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
  thermal/drivers/exynos: Remove unused base_second mapping and
    references
  thermal/drivers/exynos: Handle temperature threshold IRQs with
    SoC-specific mapping
  thermal/drivers/exynos: Refactor IRQ clear logic using SoC-specific
    config

 drivers/thermal/samsung/exynos_tmu.c | 279 ++++++++++++++++-----------
 1 file changed, 163 insertions(+), 116 deletions(-)


base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
-- 
2.50.1



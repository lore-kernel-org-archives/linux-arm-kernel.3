Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2137C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NcMLg0bVur6QOZIc0MU6CnnrjgCDYQKJccLlapmx/J0=; b=tSAaDOeil9jl5MwEgK5iGQqdvc
	fqKC4qEuwk1PEZnGq93DHb7vbo+dXdArMgT8Cijso7icFboQROz5xsX+tYyB+YRJ1huSINhhw1ypR
	dwXLw5A+b9PJaT4dbaSL7iSjFqqLc5pM78ckZeJFsU2BFo8dC4ho/rAx+iGvpfIfUuShOo+SE2gQe
	lOAKK3AVrcrq6i78UetPZS3srV3KkB5Gsxr11JqA2HOBLbYmmFFcd6k3GnfLzB4KeVoIiFppjvFg2
	qRefv3s3LoEoTj/5FkcQOqP7/e5zHBXqHEjtT/BRG72k7yE9bpAuS/rdqH0Li2slA2VjuCmxlQVzj
	8bghYf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lrw-00000009S2K-2hGn;
	Thu, 10 Apr 2025 06:58:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lYC-00000009OVG-0jix
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:38:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af579e46b5dso377475a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267091; x=1744871891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NcMLg0bVur6QOZIc0MU6CnnrjgCDYQKJccLlapmx/J0=;
        b=RsmEr1b3/4Sirhh803ypsJ7WO8/UrIW2sPH5LWc/9FPm6QmwYPL81OzyFoUi94Oyaq
         djCScaYzVTYHYljF+CmkqXyrvodtjMeeLCF8AFEsEP+P2Zy3YYCLnXVLjUiGP8mWfZRH
         2fCpT2/nSbcaJxN8KjqkRzGBUigrK6DHGKeWPYiN5lSUbOPJqAJmh9iZaYkI7IWsBYFf
         g61vFpHG+myVxJ9/0iQer0m/bY4evkL0oRTZ+N5Yr4VfAos+ktFGvhWEw+7xRLVCCjCo
         Ck2oBza2s8dxY9EynweXq17jnFGNQ9VguTTH9tAyhPIm0oYO4SkztRQ5VIgiwK1NqKO8
         oGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267091; x=1744871891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcMLg0bVur6QOZIc0MU6CnnrjgCDYQKJccLlapmx/J0=;
        b=ftPuc6ZI0B/BwLQUuyIEDz48RrP9kzEg/MDKCCKU7OdpkLGLEf/CbQXMKc2VvZlfed
         0df6uwuxx7eRTUe4tvWcbOY2/xrHmo3XflFgh+1PJOTTr9oH/A9WW3+EIQHZ9qffwUtT
         5V5fJntv5t4J6IuY/cGpFNaHxspA84u5aXrCrKqY7MxVdTsPjddm3vJmjPkznL8KPndK
         zQWWtSc4GEwnKoVzKr0lktdfzguLADdQvP4DDiBTkdN0uLTsMx5UWWTVfizG+/GO5UGl
         DnmM4D5nRdIblDl7Vzy6iulZLxyUwogNvlGy5OYX/H6I7foxWtb+nIWJpZCHHOaCgD3v
         jh2g==
X-Forwarded-Encrypted: i=1; AJvYcCWTZkGrj+N/gmdJx1PyE4e/CfG8D+DPaQhK6nFiNMFwFyw/fX03LQxNA6H/fl9d24vnd8wWJH5R5P7RWRvUw/WD@lists.infradead.org
X-Gm-Message-State: AOJu0YylNK+8yH5afCC3TnEVUt96GhsBkiEpPLRpRCz0TbwNZ57NSG/b
	tQLDxBvJxBB12emw46otzCwxH278frIBgvjVS1ENv/aYL1FwjekF
X-Gm-Gg: ASbGnctXIUQ3HoIndWoAa39G5+GzqtnOIiGpfK7GC5Bsu74lsGO1j5Cv8t0eaiuOuUp
	csR2K6ePsYd8pTIqKHxXAutkXLX+KU/5BG2MyegBBuhq4yo++7ARavJMm1QdGZEvXkQHMA5DBAh
	KYtD+5WzOVJAJ+OXH5a7M6QfjmUbgdyJweVt5hO3t4I5a4j6+CclqEEcuq8BfhUIQdtrGvfLZQ5
	nPO6ct79Bfd1rPpiU2N1w8WxDg3y8eUabYToyhtG2J8lI4M/I0upuL6cPIlpCeIYqIAEIbpLcmL
	ybY7JeHacKBihGFrnJs8Q2iWgjAnrRD8eaVwzZJdO3rMhMbNUu7h0T8a23+7KoVB/g==
X-Google-Smtp-Source: AGHT+IEzlFiw9oXOTTn6w00Ry1p9p+Q6HRePqSFZX9x05obeKymI4HDix9H1LmUQm0dEJKoBbpGD3Q==
X-Received: by 2002:a17:90b:37c4:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-307e9b3cffcmr1923630a91.29.1744267090551;
        Wed, 09 Apr 2025 23:38:10 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:09 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v5 0/3] Exynos Thermal code improvement
Date: Thu, 10 Apr 2025 12:07:47 +0530
Message-ID: <20250410063754.5483-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233812_214906_9F437AAF 
X-CRM114-Status: GOOD (  12.25  )
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

v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

Tested on Odroid U3 amd XU4 SoC boards.
Build with clang with W=1 enable.

[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (3):
  drivers/thermal/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec
    clock
  drivers/thermal/exymos: Fixed the efuse min max value for exynos5422

 drivers/thermal/samsung/exynos_tmu.c | 62 ++++++++++++++++------------
 1 file changed, 35 insertions(+), 27 deletions(-)


base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.49.0



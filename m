Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A0FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wdSQcajlIK6tpma2Sr4n3i15ecfXz4VYvl04vQPW1MA=; b=kCraZD5npcxhEDwhxruKg2LEfS
	/MWMH+THT/0yUklQjcE7SNMedzphayrvZxgWBEFIlhuSC1nrZs35tVMXQHUqh6boDTV5l5qFoSXt3
	qHYesEsYPbxr4Umw+oCg4Tm3ZI9t5eWXkMwhMzBcfmwJDxNmA+Ect1nWVyFuoBnaMY+NSqtmsfMsy
	ZKQxaNSLP+Y2ni7//1K6u6R8M26/foy2IMp8a8zO0z9THNbeEK+0H0NcOkeANgJmWOiBJ/o6MjT3x
	i/GYo3g0xXUP9A01z5BPhnZkcDW0sxlynABELBtYmSkVgA3Ce/0SBHjLnKhQXpos+g/9By/DkQ0kH
	o5edyyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6er-0000000CqK2-01Mo;
	Wed, 30 Apr 2025 12:35:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6cu-0000000Cpz3-1GUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:33:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736a72220edso7297801b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016403; x=1746621203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdSQcajlIK6tpma2Sr4n3i15ecfXz4VYvl04vQPW1MA=;
        b=gUGc4QMXH6snZ+cpwFzXUDhLqKEhph261DaAbigIiSvrcDapBP5yyJcNDtr0j0HE3X
         1B5P1rKcBWr74bhGYNj3tcM41c7DALER4a6iQn77ztQeGmI6x9VdX285R3E8ZTGMSgbF
         6Wl3fcDkaDoJlBSk5fCBQOYDhmXx5cb5gTXjCFkWjFFgxWMDz44E8om5GZL7k3RmgnSL
         E628vfhFRYGxEkGqLtiV89fW/jnTyZqqvlLp0U5F10IjECnIv5ChvF+7AnG1qSl9jwNJ
         qR9HvD81C0PGEhQtvjDzT2yHONKDgHFB08sFNbTqv5a5UDCCIoiuF0k4WM5flRr5Hq9v
         xYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016403; x=1746621203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdSQcajlIK6tpma2Sr4n3i15ecfXz4VYvl04vQPW1MA=;
        b=HTJN7LE/ZJc6Unksrxju6WFgLjUDPM7bPJHB8VNz/SVpnTpBSZdnzkxUmCBZNXEBUU
         mIMTM2+f4FIb+ruZy5+3oQvGZTbkJjYjVr0fPkKX/6H2UX2kbFp5wVB/RrKj/1D2pGu2
         2v3ACAZXlZ4zzGNaPgixdWiT+IFF+wYT3mkNwmmN6EvCImu3EQM0fas4MdHoO5YAcDz1
         vAiAoam2LEg8Zo8XjtbSK865wa5Ef4e3Mt/pDSNNU4ZbyiphamB2AvISXpMoFblLm7kE
         eWZKIJ4oo/Se1StG4M5zSrVoGSkbgQoMOZvbQYCafWZdYyQeaw0DtJamW4A9AhU/Jv5r
         Q4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVGwzTgsb6+mMgFhXtl2gk7AR9HeP6SAxTCFGjwG5wmpO/rv/TVxncEHOku7yBh3FZFocNaK5ODZ0/hTKqVyEHk@lists.infradead.org
X-Gm-Message-State: AOJu0YyB3urfo2qEaXh2k5/83axPgaEAXtj3ut+VdsueXO1Kt/A/vvxb
	lueuYaUZC1wnaGuPuX1jd4ISUKyHC2vqFchpFb0lgi+ogPGPhnRp
X-Gm-Gg: ASbGncvfye3H3L2KZMR8jTlz3E1j+SlLhbY6gRzEG5oi2iKTo4n8jDbk0UEQgYvaLjU
	fauWNZ0jEBxebQRZCkiePTZhdFKsvM0TipT/RwppeIeyoDwe5+sQvbMwbwp3MAuJUkogWQlng5k
	lUV9YvpVzAPj/bNkvw/e5VnHDCwPDphcZqOIucg8v0ZcCa02XeCasCL5dQKsksB89sxZexgj7+3
	dIKG/3q3Q//n2JxFSdlFXwJlo8a2DkvlVGymKlDD0tWEezhoHDvTHmc58BnFIxKWgUv3q439nVJ
	f+Q/FV+SKBw+zeQP4W0qVlWrmDKl4//IfjC6V2GCRc1TlqLEAZ64Ig==
X-Google-Smtp-Source: AGHT+IHnOJsQBzhcQ9TpiZPoszqGigEVNYSAiSPMVGDgh4sokgxfVZhCYJ5Y/qEVZ0ImZ9OkSIKYNg==
X-Received: by 2002:aa7:88cb:0:b0:730:97a6:f04 with SMTP id d2e1a72fcca58-7403899a55bmr4461719b3a.7.1746016403161;
        Wed, 30 Apr 2025 05:33:23 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:22 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Exynos Thermal code improvement
Date: Wed, 30 Apr 2025 18:02:56 +0530
Message-ID: <20250430123306.15072-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_053324_338399_8EC81E94 
X-CRM114-Status: GOOD (  13.42  )
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

v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

Tested on Odroid U3 amd XU4 SoC boards.
Build with clang with W=1 enable.

[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (4):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422

 drivers/thermal/samsung/exynos_tmu.c | 100 ++++++++++-----------------
 1 file changed, 35 insertions(+), 65 deletions(-)


base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79226EF5848
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZthU/dBSxhU1jw5Zz5Kc0iDhp0uS8p8MD7uxvdSwEY4=; b=Ap6iZFLa5vYFv7uwGUWEGCKXym
	6nXPQgkI9LeDiZKqTVbiP0rCRd2livs1g9CNVf5ExKzZfHa5qfgswD0B2D/5z9XCmy3Szt8bKXVbm
	8bSXkKP4kzVMtyFNtMLlk/rcmbX9P+CXDxNcy18PgPvmhnLjsqj0pqEbrKVUcXcyjPgNvrnKvYPBc
	k/1jlfHw293bYwaM/iTF3ACD1If+hwLBZlV4IaP41itMI5CoSSCyPZXe39xUqp4Pt2DQcnotwgAhQ
	AOHEylakiEvbUhR5sn2T+Z1DCVs0tB4AKlxamLXBUi4jM1KJZDJk2jegyIYwO8oMrDzAgGDvkN5LL
	0xQeobkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKF3-00000004psg-3qJH;
	Sat, 14 Feb 2026 18:19:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKF1-00000004psK-1RWA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:19:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a9296b3926so12314285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093178; x=1771697978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZthU/dBSxhU1jw5Zz5Kc0iDhp0uS8p8MD7uxvdSwEY4=;
        b=E1PZgifBjm7p+sv9sn54mYks0hj1LLG8TtNHqoT8MhTxqAU4qpHqdF1LelVcH/nw5T
         aqoM1VsEOI8mLex1/OfYFvPRF3T7UsA8b4yRJYsZ+Een5ObyAl8WeyeWTwKkl4K+cYm/
         FHEQYxuN1jS1InVAnIc+tSgjdXxKRTHse3ol37gurKM7N0aaeVK0FD8lf7nBbL5Ur8+7
         dwpWTOKuecBlwrqQU8XH9uoZrQIXJ4pYv8DJSyws92g/WEEMN/F4NFVT6Ljm86Pd6WMZ
         EDwTZki6fDLZGfcql3VU/5Sf3nltLyite6iw6Aiuu4viEep29N6X9cCsoF+MVDi3hTho
         eJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093178; x=1771697978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZthU/dBSxhU1jw5Zz5Kc0iDhp0uS8p8MD7uxvdSwEY4=;
        b=nX8C9x1ZE7vm8Ju1YwVgzvrl6fYcFSSeCCoIZc42npeL1TtJyNCwFr/17m+CUMypHD
         2Zq7nMpAAZIdBCTXb32FbPe2lW2hzPmi2x+vXQrxtcjz2yrzDEPRC/G4PqFh5K9iV1tH
         C/mpGCnxW6qW58jO5hxjbmaYemNYxyFLFg66w6CCbPlxJHS8ylp1wKdr/UuylZ0573Cx
         YhCbtD6DLjip0ptUix0/YCliuxxD67etjiu0n/ya43mawTbq1BFKeTj84tdcYIb26e5Y
         s0qcD8qgC68748E8FUcAI80pIG+LK/VkVGaK3Sq+NEyE0kIQYSLKqH6pTbFwSShFifSK
         vTNg==
X-Forwarded-Encrypted: i=1; AJvYcCW2IrHqKkGctDahEQZmUeYs2SvnhsAEgwDSO3yCCvYNvByqpTT+GShMUB5+w30nSNB5J/bFjTL4Hz5NX/jvQVIz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw21j+dyu4OAadYlec+zgI/FWguC7wJlxUpx3DlXeYbtDUQWnWM
	G0bS5i93fWHwuW7TQKUAPt80V5YBsYx+TOlU095SXprJeV2JWdz05Oyv
X-Gm-Gg: AZuq6aLpZy4C++U2e/ttdkrT0o2ExAoA7yjvRj0WrjzjwVjs/Od7R3jra96UKVF0LEi
	nALM52kQ0Uqtdk/nG3EHwSlxhVPoiFPmwuTMcD+WNpkRo4Z4oRXftA6UNyvAipELAkN/sUk70J5
	zazBgxEFUY8+tmOSpCwJlIHwfHFQgQgHHDT33817OplTr6QDO6w02uNxbTBHpnhOxk+0PbL7Y4t
	kQ3Dq9N7Oaadg/ivqSVb5z9h71KmNLaTCA+gURZGKSna17VTpueXpH+wb/HzIUFD39B9rry69q9
	dLuKhgBgZfV9MyRJU4QYTIT3PmjKHo0HvxAPfdOm4TBh8lAq/+3FyMlwRlTVon5G6yuYRN+LFGx
	riWM5dcgcNeEgAJ9GsRk6YqPMNztSgfy93dhQogMdjnGQV7Kf6yFVPA/lKnEN2jaZeoobpRZg2R
	wSiZRwsWgjGYeO2c8tu1Y=
X-Received: by 2002:a17:903:37cc:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2ab505cf397mr61192685ad.39.1771093177563;
        Sat, 14 Feb 2026 10:19:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:36 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 0/9] Exynos Thermal code improvement
Date: Sat, 14 Feb 2026 23:48:57 +0530
Message-ID: <20260214181930.238981-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_101939_410285_EB04B52A 
X-CRM114-Status: GOOD (  14.12  )
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

v8: Refactor SoC-specific configuration to new exynos_tmu_soc_config
    structure which help clean up the callbacks.
    dropped the IRQ clean up patches, with new approach 
    it will be much eaasy for new SoC to be integrated
    and the code will be much better way managed in the future.
v7: Integrated my RFC patch which improves the IRQ framework
    for all the SoC link below.
v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

I dont have any Arm64 device the test and verify
Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.

Please sare the feedback on this.

[7] https://lore.kernel.org/all/20250813131007.343402-1-linux.amoon@gmail.com/
[6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/
[5] https://lore.kernel.org/all/20250430123306.15072-1-linux.amoon@gmail.com/
[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (9):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
  thermal/drivers/exynos: Remove unused base_second mapping and
    references
  thermal/drivers/exynos: Refactor SoC-specific configuration to new
    exynos_tmu_soc_config structure
  thermal/drivers/exynos: Relocate exynos_sensor_ops for forward
    declatition
  thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU
    probe
  thermal/drivers/exynos: Fix some coding style issue

 drivers/thermal/samsung/exynos_tmu.c | 501 +++++++++++++--------------
 1 file changed, 249 insertions(+), 252 deletions(-)


base-commit: 770aaedb461a055f79b971d538678942b6607894
-- 
2.50.1



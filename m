Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3268DC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ifs86+3yzusOqbHusfFJjo1uLj4OkYHhXzsQhWXXtVA=; b=nIYsxlqE16yP/03vNmEwBr7Na6
	YiBCYd0AyALtyAhSMymw/a2k1vE3/B9yWOLm1KyBBdBO+iXlCYAP7KUhI/95Ub/XydQVRoDtosBzX
	2Mtkz50efkSsXIx8Wj8/c5ojwpGDTLM37QbFJbQL17ffiK8ODi4CK4YgtVzpRdUz3QjUkSVPzs7cD
	5bW4Y1SgJG6+Yo6sseiWi+l27emBvz6gwv1+ybzRAuG75hR77dpk6EY01qtuYyyJZd6O/mT3FAYeC
	ZYaiDCpRnobDP+72b47sNQyZi4ngdhgq/Byuy+cFt5QmUEPGgyp/lnBZRVMNXOK6vflK5WLqzYBt9
	p6NAvm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lfr-00000001kKi-2Q3x;
	Sun, 13 Sep 2026 14:59:19 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lfp-00000001kKL-0vv2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:18 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b350c6920so868353a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311556; x=1789916356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifs86+3yzusOqbHusfFJjo1uLj4OkYHhXzsQhWXXtVA=;
        b=aNGAgf4vdT1hcj6jzFUC4oKk5YUVA+kXbGxeXUHdKjByVkQzlwrKFwB7AVr9LtoWGJ
         jJHP6pya5ySyu7OpkFeztnJEPJxcP8lTvWmLUys+RRSvdpTQ59UY4biq0dHJ63WLSgXa
         bf5Yh4KJlAXEojM5oK7fPlx+0evoWBaU/MCXb/NWSYGdLHi4Epaa8GcTffleJivad6E1
         GXFSOcDMZbmOPNos/USkP1Rmn3HtvDmSbfpqlvq9bkXIaKJcEQKg+7eGPjTrArp9JFw6
         y8H5kgr8lBXP8n6Zuh0aaalS09u70OEs9yTAtOjE0aCdEL34mqtKad3n7SS2xQvZkoOR
         XoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311556; x=1789916356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifs86+3yzusOqbHusfFJjo1uLj4OkYHhXzsQhWXXtVA=;
        b=QyhsC220imYBwgTa0Ax9BGt6YR+uLE8sPQwDg8saD2+UGkImwBYt/XDclWMrXYYDxy
         4K/W5X/diREueTbf+nLeJe6rWJZX4zsTk/ss3oH5zfkEjbGzfPfo1SmivwfUdW0zcxdR
         acsXcDs3aSQMkUpZQUSvrTzPfOXCHkBqcG+Plp1SRMfCgrRM03PS8ZajuvBVHZeunYBL
         DJtxxN91nrMTNQz2U7WTAasVe1O3rIbmuOtgg5xXlkqEgKO1IJ2MDKzWa4mEV6fS0YR7
         /XqdzREJAoY5qfMM88+FTZ9pnXmMONcdXTUz4f9GdPzzkH4FOjfBzCueLTXyAwDUAN3O
         nG1w==
X-Forwarded-Encrypted: i=1; AKwUvBynqxu/XSlk1J/P31gvwpe/CEj7LvPvrJzJLz+gjnCHBSAGAxZbYSP4gZ1/tJaU7McEQIUNiDg5DpYT9oTQdGQj@lists.infradead.org
X-Gm-Message-State: AFuF++ln0rG/rKS0MzqhwfZ07XJ/8RTMQXBSzRExhyUNUoxY2eYBjHGH
	WAmoGoBITQW/w1rOER/51t516AALtbIm4NdaCguYwC9TGWCd8pZk7jjc
X-Gm-Gg: AYBFou2M9IplCre8F3lO5M1uyeyLJR7Ek0ry01VrcEw8lZrs3NBlIHGEYKKEDX2w3JR
	GwEqcyHNwiyA3Bg9CFDEA52tIVqAZbjQdgUwcfhbzO6SS9nbH1Vpmv0PNmfTZjDazUDw9niki5M
	dPETE4w82tHmiE7aQNRuImn7bfI9iPVZPiFq4ZZ+53UMxefoRsRnhiDjzS66FORRLgbnCZKNsXO
	/J2aMHoJcn6mAKSdn9lgKw5PrcPQmd4gNaz4s3gVrtWs/QozAWBrHop/RoPF62pcBnCcliqXR2K
	91ylDY9ya57dftUKQ0KSvXSbkjWRW+aoSX+/HOFQ0RmTwDudJaAZIebAtscPwwECxcErUUWlx+5
	8HLh1vxvqRGtVm+ye/5h7JXZ2YCmeqApd8v1UyX/DTSTrer63Ba2pgFfkygGrfm8o7P4AOmVmu/
	RAScnsOz3+L/eN4O2qkB6Xx81xy0bshpQ7OlCM3HpLEvJZynxIjigXwPS7nVZ7r0QFrbpLwCYxv
	mn5Lv9SvmQ=
X-Received: by 2002:a17:90b:258c:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39dbc1d79aamr13876016a91.11.1789311556047;
        Sun, 13 Sep 2026 07:59:16 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:15 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 0/9] Exynos Thermal code improvement
Date: Sun, 13 Sep 2026 20:28:28 +0530
Message-ID: <20260913145905.9404-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075917_267122_895D162E 
X-CRM114-Status: GOOD (  15.98  )
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

This series performs a number of cleanups and refactoring changes to the
Samsung Exynos TMU driver.

The series starts with clock lifecycle and interrupt handling cleanups,
followed by improvements to triminfo clock handling and correction of
the Exynos5420 efuse trimming range.

The later patches simplify the TMU register mapping and refactor the
SoC-specific configuration into static variant data selected through
the device tree match table. Thermal zone operations are also moved
into the variant data, allowing the thermal zone registration to use
the SoC-specific configuration directly.

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

Please share the feedback on this.

[8] https://lore.kernel.org/all/20260214181930.238981-1-linux.amoon@gmail.com/
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
  thermal/drivers/exynos: Optimize clock lifecycle with devm helpers
  thermal/drivers/exynos: Drop invalid IRQF_SHARED flag from TMU
    interrupts
  thermal/drivers/exynos: Handle optional triminfo clock correctly
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5420
  thermal/drivers/exynos: Remove redundant base_second register resource
  thermal/drivers/exynos: Use SoC-specific variant data to TMU
    configuration
  thermal/drivers/exynos: Move thermal zone ops to variant data
  thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU
    probe
  thermal/drivers/exynos: Select thermal emulation support

 drivers/thermal/samsung/Kconfig      |   1 +
 drivers/thermal/samsung/exynos_tmu.c | 640 +++++++++++++++------------
 2 files changed, 348 insertions(+), 293 deletions(-)


base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
-- 
2.55.0



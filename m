Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9731BC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAqzrev3ql7m+gjCEjFJwn+RHOm49DDWKh/BDuvYgTQ=; b=E8GlPZsY/o0HTLESnSvS5Z1XoN
	+etwoT+0NXuP+tFazCFmOx5jITxGTQ0hIFGtQKfQ+e2uUhffAprC2Mi8754JNPUvlzrGJuniFKs4H
	INgLEm8JjX+i+ejg9BikGjiEF+uI5e9W/ru7LGuQIgWS301zBtQaVR/cOK9Xn8p/4YRgpzJ+yP8Vo
	+5DBfdq+GjKMJa7XTf0PR+kDvMjISE72Wus92qxGLichl3RwicVGaBwwoc6mcXjiqnIS7d0R9i+aW
	u6Bbsaej9zPHFjDjaQWQ7rzQscBmJ4jYoyaHA7xMQCNXFJkqmvszKYo1umPs0qTejiP2fLrNG3r+R
	YVdINYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgM-00000001kV3-0lCK;
	Sun, 13 Sep 2026 14:59:50 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgI-00000001kT0-0drD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:47 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so918346a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311585; x=1789916385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAqzrev3ql7m+gjCEjFJwn+RHOm49DDWKh/BDuvYgTQ=;
        b=Sj8OEnga/C8WzHAPtsJoS+wWLwhlAFbljI6EkClQqyDs8upH2Iq2Kzg/rFI4cCthTq
         pYxkIRPQjTTsxfdiCW24BkJYYJiNmdyGe2i3/ecBK9m+3wrKdvMjngVzyUg0hPAAbgrX
         3rWJYh687Dz3UggoG0J43A/TguTmHk+VrHzrOaO6cCm6z+4agltcHvwQxb+8I6eB0jsW
         xszpMmPNoUxSijOPKBjF869b8/R23GiVSq+pOLdME4T+Q36NvmLkkB5dO9hmj9zTRYFL
         F/FhLHcEgdnkwzRVAy07HeYiXBU/Vy7iZBrLLdRw2Huf18aHX6aKrbSqUTp3lQWrK0Sy
         x/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311585; x=1789916385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAqzrev3ql7m+gjCEjFJwn+RHOm49DDWKh/BDuvYgTQ=;
        b=GY1Ikls+LPB7+w1Z/7bRKcQoBTKLos0MtHggvWheeZ7Rw0UjhMdbCE80Nb4l0pLPxW
         O/838wj8itHe01qBaDkssk+AferN3Lms6K7Gk6ehFK9CvkOvggAx7MK/QVy8U7EmLXiF
         74/ZLys5pNqL6/dXDTKIl94bOhEpl5NWeNOMKSmdkj/MbY5cV3YIPbLKRviRzTK1TVID
         FvH8E/OboozfWRnq+5RcEG9SrpOkOdHeJqbV7efyLC+rqKSEyvvzUy2z1gJSJ/rio/+S
         M8tAyhyS9Uyn+wDhJ4vmdlSDenGY9nKVBJgotLi7o2ZRDsLJNib0M83ocflpBIRBhcxB
         TUjA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ7F8LHdzmE3YD8JhDa8eSZL+gkNV2QGy0xPCW2+WZ9fBIFF9FTJ3TQRY0E0B7YUh1OJcm9/Xr6PQ5OiYf35VB@lists.infradead.org
X-Gm-Message-State: AFuF++k3wi0rg7hsErw5e1aYFjUsc7bBh2EuuHdrl28Frie97xrtx/W8
	XllHcvuXgA5Oqh84KIh1HRFWNW24bDp0ZOlsmY5V/qYOgqdESgO9IHWkmBA06Q==
X-Gm-Gg: AYBFou38qlwDpHyTv5Uh5yXNSTwC2PfwUN3HD40Qu/7vgPqF3CquZ2rous+S0i2RoLZ
	bXtuPr+wQyp4D58YM56eHzX3KCScGWaQH5yXfKOr6+2MerFbB8l4Bhns+9pgh8iYqT5O+dZBB6Y
	VGvPi8LFjF17Iv6FFogI8idrZc/nmGdXh2O5eaYtvwX4WxHTpnzpQo/x/P/48m6YVnAMDz80hmE
	OZT4zJStK43rydWn7uM7OPdqLnS+r8RTGCgdOFtUhs4lB+yH6DyUa6qj/OO2sZVQjLf94oL9Lg2
	pLfcn3RF5CPRWgSMQk/8hLNW/1EeYWMZkxUyoI/DucnNr3LQYSoFDXpguDJhekL1AyQOJNqpzk1
	IKyFJSJImvr4qp6Faa5FWKnTmesYti/zQFbCHwWXVvYy93vmpQcDIXqHTjig/YaAQiW8fkWkMme
	8ld/2oUD2zzCRULSB92DYIMcKk3sUaQOzl4VsVzj1bEiqTt79nSzop3spjCbvPQABVbpX5C54u
X-Received: by 2002:a05:6a21:113:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3daed2bd99dmr28436060637.8.1789311585181;
        Sun, 13 Sep 2026 07:59:45 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:44 -0700 (PDT)
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
Subject: [PATCH v9 4/9] thermal/drivers/exynos: Fixed the efuse min max value for exynos5420
Date: Sun, 13 Sep 2026 20:28:32 +0530
Message-ID: <20260913145905.9404-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075946_196644_E7B2AB8B 
X-CRM114-Status: GOOD (  14.72  )
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

The Exynos5420 TMU uses a valid efuse range of 16 to 76 according to
the Exynos5422 user manual. The current driver incorrectly allows
values from 0 to 100 for Exynos5420 and Exynos5420_TRIMINFO.

Separate the Exynos5420 variants from Exynos4412, Exynos5250 and
Exynos5260 and use the correct 16 to 76 efuse range for them.

Keep the existing 40 to 100 range for Exynos4412, Exynos5250 and
Exynos5260.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a64b11e6acdc..a38b48e2236a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -886,6 +886,22 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	case SOC_ARCH_EXYNOS4412:
 	case SOC_ARCH_EXYNOS5250:
 	case SOC_ARCH_EXYNOS5260:
+		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
+		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
+		data->tmu_disable_low = exynos4412_tmu_disable_low;
+		data->tmu_disable_high = exynos4210_tmu_disable_high;
+		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
+		data->tmu_initialize = exynos4412_tmu_initialize;
+		data->tmu_control = exynos4210_tmu_control;
+		data->tmu_read = exynos4412_tmu_read;
+		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
+		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->gain = 8;
+		data->reference_voltage = 16;
+		data->efuse_value = 55;
+		data->min_efuse_value = 40;
+		data->max_efuse_value = 100;
+		break;
 	case SOC_ARCH_EXYNOS5420:
 	case SOC_ARCH_EXYNOS5420_TRIMINFO:
 		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
@@ -901,12 +917,9 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-			data->min_efuse_value = 40;
-		else
-			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+		/* Valid efuse range according to the Exynos5422 user manual. */
+		data->min_efuse_value = 16;
+		data->max_efuse_value = 76;
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.55.0



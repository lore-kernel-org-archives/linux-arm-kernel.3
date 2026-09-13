Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30721C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4idUXl5Bb6HMJGTVQ31rHFIN8Up+7p6vXg8EYrcuCCA=; b=ihPaLlY2Yxk7/CreceUes0jvrs
	ebgGrEZfgkIEUYfKSopxxkLVFAUA/k1F6roLg4YmuZmU+M8zNWFY6zuPb0B3KqMj1okVISv5vKjrs
	G1QDR+ZX35SgmZE+tIuz+gxUqTpItLXvJFWM8mJAqKEiU4ddYNEl3nPT1R4bAhPS5Z8sdKTkIXjle
	XT78vcck7UC8LALd4wSGvRG6KuVvEClxP6VHmVJG66GQ/klBzBWb2ade9kaukEAA1KJ+Jgae/v2QV
	JpYZFJR6e3YFilIv1mE9dD1mdQpsKVFhDS6xfUaIfn6vIlFVjnOadX0tbYSQIuNC4n7mJwLDvuZhg
	e8dWybmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgR-00000001kXd-1BLc;
	Sun, 13 Sep 2026 14:59:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgP-00000001kWS-1Tb3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2dd020a2e44so22232195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311592; x=1789916392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4idUXl5Bb6HMJGTVQ31rHFIN8Up+7p6vXg8EYrcuCCA=;
        b=Ke4Sf/h3lKQVPLZD+91a5FVWUkv1lFwom1tx9a5wjF1xQaQNnidoWLfDVpwG/LKiCr
         hDQ539ap8H8l30Qao+GGmHht+97ctHpWbelX1lnXpc/NAGS+9B7nHNukneOmCJCvhJlw
         Ki2UUlAhTS5BzhMUQJ+GEmea5T6/i2Al415F43pCQVY7APUyb2ig4VMakqpqLVwE5mp5
         AyoEQhlaL/YFLu1u8J2/XplfkBngfjQmARdPKHgQ+KcrZuhY6yeZj73WSddnBPENtdbb
         lGArdxOwMTZkkRMYW9CPTivHqJ8T9UjfrN9qhzKtv1aVZ60srRs23M6Eg4hU2/YpYOtH
         PkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311592; x=1789916392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4idUXl5Bb6HMJGTVQ31rHFIN8Up+7p6vXg8EYrcuCCA=;
        b=XVY/wC00ksXHmHDI+sYI5CG1kN5ytIerVPTHLTIIqcWcteZJYBWBPiL5pzIKP6KlbF
         04g+LX7545LlcSOlbjQj+wgv1cm9WMLiUgiGPvK1Ve1ln9ariQ56k+nRNIBi79e1Av5J
         EAwwD/EbuEEVQveARhmvllAMmWZ2hgOeV12+Z9tu/r0a5sn2ND7w2XeA9bwOfZTJpPV1
         n2YlvXddVqderdv5kPIpAWSlJkzEBcoEIyoEjmvM7QtYGENz3i9A6cHlQkLWXWyTsr5S
         6AbPASceUViU7BLqZN5hJyoWv3CndwBLTDZ77BZIl43z3YfQ9ry7ddRLxW2lQYhW5pZd
         XUzg==
X-Forwarded-Encrypted: i=1; AKwUvBweRCDxRMjD0uE4jTa1xhxKHhfMc0fNNmPrFh+ckfKSi9Yx3JUO4D31Rn3OtiNmM3kZj64cWZOM+1CxqZodjVPx@lists.infradead.org
X-Gm-Message-State: AFuF++nUSS++NVXPyGOoWSBtzpMgpsh4S/eDnh1ilpT9T7DeVJHqCuET
	uJdG6tbYyZl0/9YODPswaMRHcKjbcjfVi7++LAWeaAYmGEJYwPyl4Ts1
X-Gm-Gg: AYBFou2zKx+IkuDsBZzPyrD7wymXLABN5hzjlphTPzebRO6jQYoQW+6PfSohK9U58e5
	Bt4JzsnVpvMrilYsRcp0TCcjpnOcvy3kEy8+HZzAhlCILiHA4DvSStAyH59uNOZlej/IN/sd7N9
	osUBbxfO0XQ6TnVga3qSQ22i6ItBY/F0YAwIXmAT7Ew4cA8l67s2FL3DoqZ0WwNxpks59iy7Wi7
	g5XFL2ocaGVgI3oRlj7+x08LC/hujyBkb9wk9PJbpAXY8CvV5ADlLst4bt63+v5LXjC7E0Hl51d
	5ZZpxRJ/+bEC9FdJ+lAsZz9QiTmiQDr0MKX3tRIttj/7sWdxaRVE0ItNN9uC+hiTFnWN0ePkyP4
	hCVoyWrsBf0v5cSp6w87j3Y3AIuSt2ByDCKBXx/lf2e3DgN5MJ7NBnjR+SOImacDfoKoj16SBA2
	lHL83nRr9cig7+hGDPez4IZTbI4KGgqaYduoa4RSwwiw0hhJ4ySclyXxVBS5MHixz0B0n28FEqL
	9S23xYqrKE=
X-Received: by 2002:a17:90a:da8f:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39d9bc10072mr20891195a91.6.1789311592428;
        Sun, 13 Sep 2026 07:59:52 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:51 -0700 (PDT)
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
Subject: [PATCH v9 5/9] thermal/drivers/exynos: Remove redundant base_second register resource
Date: Sun, 13 Sep 2026 20:28:33 +0530
Message-ID: <20260913145905.9404-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075953_402885_DA25E2B8 
X-CRM114-Status: GOOD (  21.20  )
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

The Exynos5420 TRIMINFO register can be accessed through the main TMU
register space, so a separate register mapping is not required.

Remove the base_second member and the corresponding second resource
mapping from the driver. Access EXYNOS_TMU_REG_TRIMINFO through the
main TMU base address for all supported SoCs.

Also simplify the triminfo reload handling by directly using the
appropriate reload register for Exynos3250, Exynos4412 and Exynos5250.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 39 +++++-----------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a38b48e2236a..82cb4140646a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing triminfo registers.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -447,23 +445,17 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	unsigned int trim_info, ctrl;
 
 	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS4412 ||
 	    data->soc == SOC_ARCH_EXYNOS5250) {
-		if (data->soc == SOC_ARCH_EXYNOS3250) {
-			ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
-			ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
-			writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-		}
+		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
+		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
+		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
+	} else if (data->soc == SOC_ARCH_EXYNOS4412) {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
 	}
 
-	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
-		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
 
 	sanitize_temp_error(data, trim_info);
 }
@@ -965,25 +957,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 
 	data->cal_type = TYPE_ONE_POINT_TRIMMING;
 
-	/*
-	 * Check if the TMU shares some registers and then try to map the
-	 * memory of common registers.
-	 */
-	if (data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-		return 0;
-
-	if (of_address_to_resource(pdev->dev.of_node, 1, &res)) {
-		dev_err(&pdev->dev, "failed to get Resource 1\n");
-		return -ENODEV;
-	}
-
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.55.0



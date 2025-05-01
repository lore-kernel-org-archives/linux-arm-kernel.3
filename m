Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C777C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P1m7Y3z4d9rNoWAl6MknfdebV+lwfWdrXlwW8WNKhI=; b=bh8eqvpSJzt2DRNM2uGt4or5uJ
	MTqrA5nQGkGuSmgfVlKcgglMxps6NLiqK/M+wRLi0P7zRS0FcgT7a9uCZA2hJ1hiYWUei+C1OrfmZ
	rTaOGQIl0+40bcIhafeduLsCKWsI2lohgG2qlP13iNwAKeH89VipyLBK6K5gbBCUBzP37ZqtocBI1
	y2uYBT4UX40Qn8gfCRh5/kkyukW2QC46mhaXdOD3lqwuAfI5xW43vZzso36Cr8OXk+z2gTwfmF2dR
	o079G6+0etTqIcq3BE0xFuBoZxQmPJQzw4vKKVljz2asBWje0BYef15VHnltc3qAnVu6WhBEM6feM
	g7D/nu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX08-0000000GCqu-2Ypm;
	Thu, 01 May 2025 16:43:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWuX-0000000GBwc-0oav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:37:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1641435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117440; x=1746722240; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9P1m7Y3z4d9rNoWAl6MknfdebV+lwfWdrXlwW8WNKhI=;
        b=sKsHOdSLZhO1tuE8bGYBqY/CuISIbcptpNcBkISbuh0mbkP9MVwpDyFeR8aHoNyzkr
         NDDzT1mf1zsk1+Pnt5KieydnyrHTt093fm+IyiBoaZGe8eC3i2mic01NnAu1tiC6wwKK
         HnbERMj91xrRR6dM2uDy78zEt+LIydFCyTOO0ctfOAkjFazkwZEfoAHKeiI3qC3CBjBt
         ff4SAeo2gcysgda5osojY44DCPOXgAKEPIZykvI0PubHLPRfC4sc0+3o/ZuagRVPxEcd
         Lnfo0ITb4+rI1FU+1urPFXgJ0on1YyaDeNbVnsMP3l7JXnK0uRzQ5OA9osGhxFMc4oyZ
         IoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117440; x=1746722240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P1m7Y3z4d9rNoWAl6MknfdebV+lwfWdrXlwW8WNKhI=;
        b=QMtfTfjAtQmj4vqVrgWJPcJkx6QH95bbhVBP0hBhw1YNzWs4LcC9/W5VQaWwycNuNx
         h3FIcm0zDRAIJHH1nV5I21kgS/DlSZtz9KyQMAcgSIWzYrI8p3YELZNRpdYSE7sUOZtf
         /8PNBd+u7U9JpEfcbr7wyXmd9yLbgLmnEwHMvuGo3HbBFZq7jR8qkH3VJlVyMBjmjcRq
         6KJPhJFZZ3BL5IH8DH9RpTdz6zVe+V3FCH2dDVcEAJGyFiQ6JMwkevbnMWXU4prfi0AM
         emwKXcYB0/HAWP7ENJIcrGLxQ8W7nMZ9bAoY/oHmQ74Eqdsvmob2lHz5so6A4d/LpFcC
         sNYg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5vO+MI7pwbdK2DdMMt+XZT06OFyACgiFHxo/oE9mV25x/DoSO0Y96kDMUzYZ/lySN0gnzZaGXmrihhHoetFy@lists.infradead.org
X-Gm-Message-State: AOJu0YyYzapDpUpTbpAfG46cJlitJaUePcZbw5SChFj5lsDzo3+FwpyJ
	zD2ZuMwoC2rHRnBQqEYfSJMn0tZsZ1I59njpPHDe/TkhVZ+gBstuCSr2vTzi5pU=
X-Gm-Gg: ASbGnctFEMr+83Qr+xkQ/0Ej/pMMo/4Yrla93zuEJGSrZe8YifF8E3lqpWaJxiA5AsU
	g42GJopN5q8CCeSwAuqNgfjx6NejKaLx4aIikng0BgD8TMM6qw5VVlS/fAXzBPiXlrXgY55OH1Z
	1Sa2AobicZho37aHh9P0D3Eh3RYOyBLds2NUwG2ZjXZhhcF+cBTmHE3LWVsm9SGSqe2mCB6wTkv
	zQ0kEqoaq2blyA6KMIrQjtd6f0EzyKjbpvU0qTaiXB/1XdC3PV6xXd6qR+n5/X4WMD7GB4LstMq
	mYPB0gbZRhn6iCGSLfS02Q0//4sz+Du7a1zjY2VQ6zYKg3svGaHlmX9buOg=
X-Google-Smtp-Source: AGHT+IGPpDqg1uqE8LFEWwLX435f56VDxCANn/R7sh63I65f2yRV/LXQryCMvr0tRZXQRAMZb4Q3cA==
X-Received: by 2002:a05:600c:1da0:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441b2dfce81mr23814815e9.9.1746117439733;
        Thu, 01 May 2025 09:37:19 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:56 +0200
Subject: [PATCH RESEND v2 2/3] iommu: omap: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-2-5a3cab296972@linaro.org>
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wSaZtA4bRYZs1G8waYvshbkAD9TzfZ9GbMZQt0pldJQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M3dTz73g1hTqWpvm/RlUFFBhL88fh777FAU
 nRWt/u50OyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjNwAKCRDBN2bmhouD
 14/1D/9qJJTAa6KNC4lnTB/UEBpK84vmumCpWTc11C3ByO2evXS29s7m1n4ZeLfrGzcrMmdIgev
 SlymAyZt1pL0HRWKb2lPzosqnhTpPMroFJltOQ9ZFiF89RGR+52847bWlrO2T3QhduCvBENWNcy
 gJucPsQ8IV8FsulSEYNSyk7wZwOD/zeCQrJg48ra6dJp5RBwKVfeVxMUKVb5BQ2U02MJZXCzvRO
 LJCgJhHs0cGBC8XRiTjCH0pc3PDZTlbUt7WyCDORjp1UzLrN7p3y2+rACVlW3Fr7gmGIDq/tRv7
 h6De2LgeQeZ/Jk4wRgQauPk+kOxC70aMXic7LzQ9zoe+FxBirV+x7veEsey+NsrDVCcUbNJQzlr
 w0FaKE6Tht0oesmD+iI4sETbNNt55JdQ8i0l3MkG0PAmKwSnFWT3sfCl7+ZBowY0j8b84fZQF/f
 P2fhWwsYBcxldooG/RmK9pSJYh0zCpTf7gRLFpoGELfB2PTRsXnjbqJFKDI2GfKxaRcNl4vPFcW
 6T60C0sLDvFfESa810o+xYVTroMqojApfAcU661dCx5WcdE/EO2UtOnX1HVCENEXYpM6GxArbJS
 r1ta56HmrhLEoAqeIamYOzHSQIRL05dpIQPQJWm2Nlc3B4sySF5cuV6D30iUdELbH/fX2yQedfG
 3ZTINBZ555xaPXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093721_237626_65144527 
X-CRM114-Status: GOOD (  12.18  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 4448c0a512137c79195112eea25d762266c77bc3..30fdbabbc9c652990e6cd31d3c0a1a06633df9e6 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1127,18 +1127,12 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	obj->syscfg =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
+	obj->syscfg = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-mmuconfig",
+							   1, &obj->id);
 	if (IS_ERR(obj->syscfg))
 		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
 				     "ti,syscon-mmuconfig property is missing\n");
 
-	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
-				       &obj->id)) {
-		dev_err(&pdev->dev, "couldn't get the IOMMU instance id within subsystem\n");
-		return -EINVAL;
-	}
-
 	if (obj->id != 0 && obj->id != 1) {
 		dev_err(&pdev->dev, "invalid IOMMU instance id\n");
 		return -EINVAL;

-- 
2.45.2



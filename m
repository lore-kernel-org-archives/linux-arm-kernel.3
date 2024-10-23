Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BEBCDDE5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=; b=3qULeT9z+2nWPxRIG3qlC1KNkH
	JVILav2ndZBJdc1tSf91tD0nDuxOgNib4xZm4Z6IzykRwuz+rOarYNrje9wnaqFgP0SqmwcyX9JfK
	sJcYjOV+e4DuvnzI+pqouTH7+DRfCh4Iz4wEVtiQxVSJZF7UnswgNOH4b+SB14EzuPUe552tJtCNu
	7jz9fNzBxWGlJtPu21rm0PMr1YzgPZDhK3g5wWjldfbDULvpdXnRgDRBWNUHIbsyFAA6oIEUCM2Hj
	Z1NF5R9H18gQELUXvuE2l69wBXo3b2oNz9ueepePIa2a1AEuqHMEV3lMC5FLMQut0zmsSfjorn80A
	sfG5NO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YZp-0000000Dz9I-25gm;
	Wed, 23 Oct 2024 10:26:53 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YUQ-0000000Dxqo-05qM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:21:24 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-8377fd760b0so263644639f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729678876; x=1730283676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=;
        b=mJg6ShOfYOtupSJuxPsdwck0RvDfcrV8WCmHCX9SDrionN1uYWoEZ3ghZIp6fZ9mii
         V+Sr1haGEa2m/o0S8qdA8mgdF+6kexTnOKmjGliCQYwxXrRkKEJ15+XAoiXuhU5wo9QF
         wwAUm8/2qE/FrS7myXvBr/GMbKJe6Gfnom5Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678876; x=1730283676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd1HfFQMWC9g4f0GP0KU25BIxdhvF3UuIyAywYBFMAY=;
        b=d9Joc6pfUPm1pr77DJCEpoAdSIKc8KtIYM4YS8ysPJZ80Toacy5JpodY4pYz7bbvVs
         C3c+dgMIuP+tK4ipLMsq6/lqvIArLimqMp59h2APNGSJcK3oAmlVfybX44cWp2CQCqWl
         7w6PVGNsusrMnriPyeRKDNV2v9vVXhpRISadKiTxH02e8ZDZm1ofpxhK6Ko+DSieRnaM
         ighoiKzW+zWVOmorgDzfVur5tAOox25iiz4bkgQGTnJYiNU5h3v/jZZaLMW2qw4fYUs6
         UmvxT8uX3MpUUYRKrcf8NyI5PmY4bCLgDmxPrttjHL9MovhVOcGKMqZDSOZEdvnRxl5F
         Ngpg==
X-Forwarded-Encrypted: i=1; AJvYcCWEeCBYErn5UsHFwHLVLOmOchomSfmidKYeGLcDoJVyWjUhadS21rp6XZdspxxQyivq1mUJPiWlOJjps8+E1R6+@lists.infradead.org
X-Gm-Message-State: AOJu0YxPDqNVpz00Tyq5PUT7XCvxSnJnpYAru26Ts+iwvC5ESiSxmubD
	iMRwIO4uzPDrQIrTz06mP/4yIGTG/xHAEEklRbbTC9vVbyoL6e8t+2Vq+scYoA==
X-Google-Smtp-Source: AGHT+IE6QFForZlKyA0hU2+8la5Uo19ZimvhbDp1m01L+egZ+QO08x2ndnoyS7s4J9Oe9465zQjmlQ==
X-Received: by 2002:a05:6e02:219b:b0:3a3:9337:4cf4 with SMTP id e9e14a558f8ab-3a4d592cbe7mr20862945ab.4.1729678876040;
        Wed, 23 Oct 2024 03:21:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:eb47:48a4:644a:4aed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab583d9sm6526349a12.49.2024.10.23.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:21:15 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
Date: Wed, 23 Oct 2024 18:19:21 +0800
Message-ID: <20241023102059.512352-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032118_253450_74E824D3 
X-CRM114-Status: GOOD (  15.07  )
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

Fix two minor issues in the comments.

1. We balance VSRAM voltage based on the target VGPU voltage, so the
   comment likely refers to VGPU.
2. .attach_regulator() returns 0 on success and 1 if the regulator is
   not suitable. The context suggests a successful return value (0).

Fixes: c200774a6df4 ("soc: mediatek: Introduce mediatek-regulator-coupler driver")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/soc/mediatek/mtk-regulator-coupler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..16df12d1c2e0 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -74,7 +74,7 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return ret;
 
 	/*
-	 * If we're asked to set a voltage less than VSRAM min_uV, set
+	 * If we're asked to set a voltage less than VGPU min_uV, set
 	 * the minimum allowed voltage on VSRAM, as in this case it is
 	 * safe to ignore the max_spread parameter.
 	 */
@@ -108,7 +108,7 @@ static int mediatek_regulator_attach(struct regulator_coupler *coupler,
 	 * this means that this is surely not a GPU<->SRAM couple: in that
 	 * case, we may want to use another coupler implementation, if any,
 	 * or the generic one: the regulator core will keep walking through
-	 * the list of couplers when any .attach_regulator() cb returns 1.
+	 * the list of couplers when any .attach_regulator() cb returns 0.
 	 */
 	if (rdev->coupling_desc.n_coupled > 2)
 		return 1;
-- 
2.47.0.105.g07ac214952-goog



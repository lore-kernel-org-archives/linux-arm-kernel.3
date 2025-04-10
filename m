Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C894C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY9C2ohAdzqyv3wRnYpVxd1Yt/cF4tyWRl/ZSVb6rdo=; b=cbRdJ3JXBy4oHtDAbhx4diY0LE
	7Qja4VhRB8OP8qQuQKlE/XWNvbDuB17Oq0LXq/P7iji863FfvyRz38lWpmN+lcTiha+ND4USrIf/u
	PUO7qdO0l3+nqKHrHeriaDs3n4lP1swznEQ5oXf2vmS+hrclpoXr1+XZDwBKF4xp0vXh9e1pGA5w6
	4teN7Xjdv4p9LE0aHgsPL+a7NRBuyc1W4zFI2C6DU22CZKPs13u5jsda8MkdrdtSWwRCqAv2S360z
	sb4W7hcFOE5oo0jtN6hqLhK/6r6v++uWLeAO6Vht0X7/y8j2A9DpMj2+U/skXFim9ooqE6aMlH+rE
	BO4bHotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lvW-00000009Sea-19tH;
	Thu, 10 Apr 2025 07:02:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lYO-00000009OXb-2DvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:38:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22a976f3131so4219045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267103; x=1744871903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY9C2ohAdzqyv3wRnYpVxd1Yt/cF4tyWRl/ZSVb6rdo=;
        b=g7ZCw6bp8q2JTkGGCcnITSqB2zhS0MZ1EE6t3kGEdBApCIH1JknBG64CtgIH7cE3/0
         g7BHTfWUDPYycoyoU8usANG+60IQ/cilrVqz1Qgu9kqWr6CO4/MpsvIxTHEDECwbgKaL
         qIlsA12Ev1IciFtQxytwLvlEI/RA1uwKXT398N1O1R66IyaUzw7pgc8nslerO5BhsTWw
         /VypKx3cuaXIBGZYgsYje9weAjnE55m+yJdZI9ZAy/kMcVAwSmwG8yNKERNlDfUW+x1F
         KTpz6DYVjGulSMIpVOxFuuVFiNWRgR+ttrkcWgGT/BbHdoqzCfmcclRW89jenx6o2hpz
         ciGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267103; x=1744871903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY9C2ohAdzqyv3wRnYpVxd1Yt/cF4tyWRl/ZSVb6rdo=;
        b=NPqPglNX9vCsU5UTq20hdtx3LNROAVCFtdt945iTcSbEThGY1REEzxtYBPWks8bkxs
         tRkPAr+FWFgHrt4NLFJJaV6zByQNmFMbCJ+c+jYo2UwCZt534Gd3PN8EEvicRr0VECEx
         lOK9VG9/7A2+HRu4wExpSHKbcVtxFszmFT5G1aBWumacTYQllvBFMMm5RHPGWNmwWBeh
         AVa035E8xYTj1nNIld6tpEqq8Mi7PNZ/5LHzeZi7D1S3fHVlH+9cFRdCWoZxZTbvByrP
         nd7B+l2vwYhtDRFfj1Cz2qLBfvblITC5zwvDL8zfywlVVCNHr9EDn4r2nXQNQ+OilB7w
         mJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVH02LpJ8etalDVws3aIVNrZjHBPazn09v26L9GnOXK9o9mtdQFQtrdsHlpozfZyt+F+UVmWupSnq+WqiUnGTbI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MBKrhP8pANcYDmLjgX2cdQG5UyioLxRInRAt61jok7ULwXS5
	/G7Shqyh2Uk1sNt+lFnnfp1/XaZgzrBy2AbsyTGxjSdmsXBQg8l8
X-Gm-Gg: ASbGncvQgW+44LLzyRoSIhCUtKt+V6/RrJETf6qbrdoOQiTDYSeEIfhqqj4WYX+8/Ym
	ezvWTaer/vmplwup8G5ZOR9OOoTmCBWRJGsYd4o4vpUGgRPySiu7bv35UIDOrtALtPg8AAG+rXJ
	tk9m8119cquEkdwL1vY+ikUuBXJwMCJ2cR3Nl1FpTmWsql/OnkZsymu0X5Vf/Hx918R3mXTS9jb
	ou3xlPzXlbGm0cHdTZ5zEqFhsvROTr5bNoXeCdPH/R0EtbSCTXOexcADc2Q1YnoKd/vIXZCcB4y
	9F0f3s3LrLCEYM/IkNOkR0Nqh7LPHZw8vXuop2tu2eQMCfTcS2t7a5o=
X-Google-Smtp-Source: AGHT+IFesC5pq/Flznu9wGw7JQgIcSg+yrfPMnjQNGGmPdVTWxL+TEbq0QvSI6FgGfoZP8oQu6ZWLw==
X-Received: by 2002:a17:902:f709:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22be02d17d1mr13927735ad.6.1744267103249;
        Wed, 09 Apr 2025 23:38:23 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:22 -0700 (PDT)
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
Subject: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Thu, 10 Apr 2025 12:07:49 +0530
Message-ID: <20250410063754.5483-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410063754.5483-1-linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233824_579528_D747FF2B 
X-CRM114-Status: GOOD (  14.21  )
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3657920de000..ac3b9d2c900c 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
-- 
2.49.0



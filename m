Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB19C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T38zkrO9x36m4etdaLiyiX7JPZf+RzDpwj3Zgm9TBys=; b=wsuGDEZej/C+EEpIPcIyi4pyU3
	OuwQaWTSopygAr0z3BxnJCGQnIdZrzqJyLfRDWQuZcGH+a23BaMcxBiWMWyX+j7hh8HiPB8GF3O1Q
	p4ueRwRzdcc8fXJ8R4SMoHSXBQ/qJaf8r8zkr1DSNx8d+FMnshRZ1eHDD+Vmow8lnLSmJnevAEtjB
	VjpwU2e+ZqOCKLy+/clW5nAgZSgeW7vsLh5II/1dzBiAcGJA4+Cxc6dII/dDT7duuSxOHmI6yKeF3
	5UCVNgX9vP0k9NcUq1DKKRRojQA8Autaan7gP7UH4QrkJ9ai2mkaLOjGfQqSPPCqpOUzbn3lFMoZo
	gsVjT+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32XJ-0000000CA6f-3IJE;
	Fri, 11 Apr 2025 00:46:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Qs-0000000C9EV-2AfR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:39:47 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-310447fe59aso9111681fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331985; x=1744936785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T38zkrO9x36m4etdaLiyiX7JPZf+RzDpwj3Zgm9TBys=;
        b=UGCSUd8ijq4lypGtWDPN97yf5AP7ZdPHttbFXRXgKKl+A6HY+1Tbu6tX38nbtQgiG1
         mfLygTCifRFQ73TzDZHeqzbB276eRkoSOHHcnGKjt8q1DOQ6A+eyj1Ptqu7nx7XLbTRj
         OFsrwyI6j50qomi4LYw8Yjb9h96lOp/X9ijXDR65ECYUiSMUArT0/NcKc0PvfnF4dbqq
         UCdYb+a+wLWJpHs4hD8wR8/DVJOa4hrWkXqOS5Sli0zObqeuanHBZ8/1SuF/IzyfgoLH
         Oj0bCswKBdiuMKqHJFoMxZ4BsQG7UX0R1zTs073po0ImiroKLdRa0vvDi4p8yRMZ5Xkn
         Vj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331985; x=1744936785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T38zkrO9x36m4etdaLiyiX7JPZf+RzDpwj3Zgm9TBys=;
        b=DxgVn2dPjUspmMkeg//nGwqrDDUSTY5e3iU44yPs9S4ck34GnrEjpgKKoEwbgz9Luj
         kR8KOZmxp6ZcIPGXtI8gf7wR1mnjz13OoUX5Ecd5cTMgnvRlRo3IFQoE3x44Db67G+nb
         P4WkRAc8q1mfNG49N9sB4aW6PJZiAZgcANU0gUPu8q4LogMVss1HglmDFa+X8rbTOoQs
         8SHlp/e2wrFKqNITraShkm8ywKzTMQwgESFz+0WpBGwquXttCUY21oShIlrls3yuIRUT
         VOyVruQ6/dyTNQsCvNlDj0p1EQ3hgHyxIFgcaVX/MKSgQaQKzYe88HTd12SXHB3iIn3s
         wbbg==
X-Forwarded-Encrypted: i=1; AJvYcCWRp9YynsP9xT+0LEPqwpOFveMe5D9XvTVCjsVUUufipQgqxIaGR8zGkGoz+8eWCHMlykzTFTucio84HReCjsdx@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8+qunU/e42Z/QCQ0id4xa25hvC+rF/6z6BA9eeBcXbaeOpoL
	pmE/2wU+Y+tm9GEbDhQwelvc1BNITL8GhVmZo6VfxADCwxNKG/KR
X-Gm-Gg: ASbGncuz9mptNEAjGFbpDJeiZ1eTv8YpJ9VxPS6/Y9SkXB65ng1Xi+nLKBVrZivylAw
	cY3tn5nesCwhaFVkcog8KpzLalVUmzL0O2Vyh0QjnNNR65qx+PvLXaVM1WeIMQYazp1uiSgRt3B
	DWxvQHlb4pyOoTaw+5fYf5zd7Eud7ppE4wKglk9COp72XX1FPj91TbUt5r84AK3t3oY3T5fA7B0
	Hi3mLDu8QxeQTXLot5rQkH5ZiomUrHCq177QCiVmuTX0F6V0eA9VM7oJZDBzsOp+5xIWWMgqfV1
	Ah1xuTFEin+T3SV7k/6KyGykqQPs3/rWXxK3bBVKJjp7U4UllA==
X-Google-Smtp-Source: AGHT+IFbxnSm5FcYra/NhgQKMu+OkU4ccH3bURF6g7KgB4DcFLTWIFmK1C48nXnn+TaTiHuSf8qBLw==
X-Received: by 2002:a2e:ad86:0:b0:30c:1358:6400 with SMTP id 38308e7fff4ca-310499b4447mr1902191fa.5.1744331984565;
        Thu, 10 Apr 2025 17:39:44 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:44 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 2/6] thermal/drivers/sun8i: replace devm_reset_control_get to shared
Date: Fri, 11 Apr 2025 08:38:22 +0800
Message-ID: <20250411003827.782544-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173946_555441_B3A7F086 
X-CRM114-Status: GOOD (  12.81  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a common
reset line. We need to use devm_reset_control_get_shared() instead of
devm_reset_control_get()

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 1f3908a60..dc4055c9c 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -391,7 +391,7 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-- 
2.49.0



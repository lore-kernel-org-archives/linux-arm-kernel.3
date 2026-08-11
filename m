Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0498CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 04:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LrUl6Rt2aPXuIw2jqPUO685GtCJeqmwjEdB3yo7L8dg=; b=B4w/bYH6bqK7Ky0WU45V45elkP
	/ddoBdF0Zjv+ewwaiyb+0Uso5vrbF9CoYyJ0Ya4ub3+MPJoMTRFhjXx61WPJV25I9p4ZblYcToWjD
	I1LBvKGJFp8DoqmQGY0zVT6HAV7EbvDuRsjfkuWm+0wzHAKFGjn79pRzst01PeowzsEIVW6jkW9R6
	u1fUvjJGD10UvwDwHMpG4YJ7gqaGcnhQ2g19PX+ZqNBANp3pvI1fJ7WT07tGmKc2SkRq7axXjzcLp
	zroX93msd7Fj3OHhXsoeIlYSxY368q7cNQnFCJoTNu6Scmpy1KOkdsTOQjBd8inzaKjuuGSAHextz
	2nwMoNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdxt-0000000DFaS-3x8D;
	Tue, 11 Aug 2026 04:19:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdxs-0000000DFZs-0LDv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 04:19:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e04df8c46so2525592b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 21:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421987; x=1787026787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrUl6Rt2aPXuIw2jqPUO685GtCJeqmwjEdB3yo7L8dg=;
        b=SNF2qCRfNnqzlpHLurXoWWtJyXd3EutSJMSvGFAk/Ketrr6h+z8ivndhx/LOtXqzCG
         34v1+ax6kjMsDpy1PaDS4LI28vTAt9proMhepH+5VmKnkXigFARGO2srX+CgHgUAShq7
         xboc7h2sBlkT611Zp4soTpmddLTG1pHq03KEKsLB1O0AhxT9ogXpxM9l3nTZFwqHHIHO
         vt4vPC0zSY15A/Hhb4esYGxpi/2CJ9QBqLWLgZrTIvPvaEEjg0g2MtrLGreAnuexX/H9
         RwzC7V4vRfQmKA19hqJA0VB13HRVCcvaAX9kH2f8PFQpvJif0p42XYLUYBH3OspY/dzc
         i3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421987; x=1787026787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrUl6Rt2aPXuIw2jqPUO685GtCJeqmwjEdB3yo7L8dg=;
        b=HRFAa13fQ/uwc1tZ3Icv+a0aGuuq7+W4vJOixcxMd4EAa9Vngc+kj463y9FiMuEc//
         xgO5Zg5GTz2f2p4siLDqQIOzyM8ppQ1AjroTlUmhQ/a28jzEGt2CqsG6NddOObeiZUFX
         /m16D0Web/G77Ddmh+rsd8q+UuCBhMfwFIznDGeTzlbRhwfgIc61uOGlOzpSDYCC9oJj
         TQf9ZiKmdym+TWiQi86aHxvnMVq/PZcK/bhJ8a7sXg9uX2QGUDx8dwAspScqo0dV2f6w
         7Mq/0Fcj5m8BIYaNrI0t7EiKCTmcxaidfw42BQu7AnRBIeLFFoagir4hQVDFnx+6LAI2
         MyMg==
X-Forwarded-Encrypted: i=1; AHgh+Roqg2Cotn8Auadz7BK2H+i2S2q+ZW4XS2H7t8gFKX9OyXsIUvpAJUWWxWfOE1Szw9NKspocyUiVKJUp8+sjZnNq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7lvKyIweaWMDfXvz6luZQzzRnnDM7U2G0m7Gec+wJrDV2igkd
	iOGMeIXsTu9ZVLapvxBmcnl8dfTX0D1h42aZkXOlSBq6UIeAsRrJNj33
X-Gm-Gg: AR+sD11I2gbT7FhFVxAN0r+V6rsqVwKg7kFwFrUcUqsYpRo6NqlflctaMHI3jMzcksq
	/ByrSIkBDOWpp1/6Kom/JfNsCQ0jQva5sE0o4kl4hlOnKkJE12aUvCzvu9l2JFh88EMKqZL+O8w
	oh+x442kOOtgGEEqs32xxX+RflZ66sl44zKJQXov5yBe5zvHqmkeJGHxtyPCFXNvn4dZaL213Oz
	Yc3/wbGj3DaJ6QT171aEFYoEVJi9VQZBBPZf7Jms803yd65mzkojR432UGK5Mp9PS+4JGIbqFfq
	PovWFAhhKo70+z4dhh2sFnJvxFy+yeLEzPsLXh5vTEmmSSEIkZyIt+HKWVyxGMC2tRZ/lK7ap3k
	YYU7e880ojsD4kQ7sNSpgGYtrTVBWz9LCy40fNEdwh2WH2Sv3efMM5OkH4TKyIRvf5fbwN0RcPm
	xXkdqY23pOlF8auh4+PcTrEGp9z+7HoZJ/tk1ralVfB8enO5cugWcXKjrV6xDKwsvSyNDrFbsT7
	f3Wqr1XqWHxr0+4Jk4HiBQYVMfbuOL2fOLAQPcNfwDjafjc1qdEcayTkY8C2A6p4v2IW0jvBaRi
	W0Akpdc+WrHbmIzrzPrcp8eZiGA=
X-Received: by 2002:a05:6a00:8d8e:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84fa883163emr377386b3a.18.1786421987024;
        Mon, 10 Aug 2026 21:19:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9195371sm17687b3a.11.2026.08.10.21.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:19:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
Date: Tue, 11 Aug 2026 11:19:34 +0700
Message-ID: <20260811041934.7609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_211948_119428_EFF3AD40 
X-CRM114-Status: GOOD (  12.13  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 621f02a7f43b..6c942697e57f 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -893,6 +893,8 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0)
 		smmu_pmu->irq = irq;
 
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F1EC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bI9faRZSTIszr47oobd68OEMax5S7fpjoTSXLtSJlgU=; b=SAOQgwKqj2y9YtCq2+NPf2KMHr
	3EVO50oL5T/9aHhOp17Mdzom6NCIBEDa0SJACagNfkdlru5hktV4xgsWmcA327wqm2Qhy4HlolmRm
	2vLUSiOhFsLLSx8l5++ZnjzGTbUasGl+dTFeEZHLMCcbk/fUZKENwWzDTUZfAfMksQXl9hNzlrd02
	OzPNHs1S/Za/uJS/rU7wzNXMRe7Sryq7okCodPbvkfg4n6g9W/l+2vse6qordiMysvfo4u5kdOko0
	p6F+o7L/mUK2uxRTgBjntWhNYLKNnFuS71nh1dc/p1dAgivwwXFS+Jw/zEdDuyB9Pk2kgqgm61lVc
	s0COWucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIPy-0000000B2V4-0XCE;
	Mon, 10 Aug 2026 05:19:22 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIPw-0000000B2Uj-1R6Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:19:21 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1483253a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339159; x=1786943959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI9faRZSTIszr47oobd68OEMax5S7fpjoTSXLtSJlgU=;
        b=dE77lTi7FFZf4aFt3i5tPNw56kKbjOCbbBP2rBzl3/kMarNR+++AIu8EP88SMDJMXC
         HiQdYDB0jRKk7QJ92gzPtt3DYtOD/Iwlz6fDwr49Y03Rc2gYljCVK31rdge0gl+L6xE3
         oQwFYhsh9oPHxYYrbwS+hJVTwOQONHs8fqO+XBTCfOmUhF9Dq3GsUOrNxMqdcyatPmyu
         SWIznrVuKRq1CNW5jY2+MGzfqaEHe5hQl0mPB+6t9H2NYsXFxU/70AILx5xlXhOxrePb
         e5ErmPmuBWwYqnmwCA+BD4cq3JPQCTOnBIVWa6+7/uVVNwQpfraCHpAVpQhZWcuNoBMt
         aKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339159; x=1786943959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI9faRZSTIszr47oobd68OEMax5S7fpjoTSXLtSJlgU=;
        b=bsBgzoBREJT26V4Iu6dkyVH0OTfdXNdo3oHn1aAnoojQjHRPfGe3WOSv3TNFCywM9r
         kq9e7Ax+dZ8GGIofp3P80SIsI7McnDEzXR/LQLxmI7nE9nKUFxS7sZHPH5wt9pHNE3Gs
         2x9LfI7bPiL4T+6CHvxcdfR/rYqhoeqFT+hFkFMbv6vw8RmPqqmYm+Hzc6trgUfitdMk
         d2dm/s9y+Zb9XlhYOA1Jf30Lv0QKikTHKM3Mf+s8AOgwAxH48nbH/lVAhIGi5fcE3Aej
         p/tMaLhWEjnDcG94uKHQGX6YRFvMdM1B/ccCSOSzkNXhji+/SUEseL94vxiO+rB1gv0r
         Kz9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqSK7s3U+MT42fa3dHs7ljftnss/wCZT5f6QKkUbd3swxr16Bhg2f/T9i9Lr/rvTuoFoMb20lhkk2I+R8NfO1wJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzpOS9NuGJIVvZv0XZfs6ird3U7+4Sf2Hx0QbWDI3zn8B1C23sy
	cmscFOEt9bo7IixjfqtZeOHkTNBP2wmDVcFh5dFl9Fo9h4RLopsS41d3
X-Gm-Gg: AR+sD104vpoUA1OKx0ZQNXFoz5c5MqKSqLxFCbPwVVGrFblodYW4Pn3pBoAkJomK1Zo
	2mhOqbFUuBNsSAiVrbolAG6EtmilOSryAVnoOoIXAkIP03YjTfqIV5IyNnmGTlaHqkfo36ne5Md
	4uClOiOn6NYN/rk+25zAkkPJoOME4E+NCCuEV37lfKpi9igsmxD2C0Wbt51fTbHTJJxuS2IDM/X
	9WcMa4GaZIQkdGrFWA8HTg4mpd4LXXYZqGTmT/zrlyMq0mgs9fK0Mm0/i1m0QVF2Cwp9P6NqhUt
	U2JjTVcBXojJUcBb1gZPF99+ZAcKjxycAggm3UfCknm1DW87SXyD8OfAJbvaVD047jjirppm1V6
	k2qHPpUkdej5CWEzBrA0yTMB+0yeME95IKE0Og/YCnpzqsWRKjvjY1R/UQ7dV1qDVv91zJkDxuU
	8UjFtf3hx20V/nCv28JZieEW4ZG08am0+yJAl5Yfx1JA3oxn1DpiIF71CDC8exJzX7jlOFJSqME
	Hn6uezyzWjx9HMMPOAvsCy0YKTVx9TDTLGY3cZXUWS7RkHvYDowCl1zxHMvt1po3TBhuriFAcie
	J0q3
X-Received: by 2002:a05:6a00:14ca:b0:845:3fea:96c with SMTP id d2e1a72fcca58-84f2e017155mr42784063b3a.21.1786339159406;
        Sun, 09 Aug 2026 22:19:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51f429sm3175508b3a.34.2026.08.09.22.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:19:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:19:07 +0700
Message-ID: <20260810051907.27136-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_221920_385560_D7E59BA7 
X-CRM114-Status: GOOD (  13.11  )
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
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 632614013dc6..9301e1dab830 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -705,7 +705,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	int err, irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	if (irq > 0) {
-- 
2.43.0



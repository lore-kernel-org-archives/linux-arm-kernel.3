Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5540910AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p41Lx57tnZ476sTVP+oFeMhnz39TyHhAq6c0xIgcxwk=; b=M7HpiJERm3AULagBOEkw7GD4OJ
	ldRykh44SUSy02qBizVNZUlamrOsSRiRdJ4ErTua0l4SX3xGKfj6wZ2/b6lpqjmP/cKOusQaJDbju
	vedXOz7wtuMf/aTcqD7uWrAmVfSB5bgeteE+IlYXlb3/hdBfEnbDXKCDd/PgP+nh9Z/RYR38ZEdw/
	grP+WrF41jdt8y3w1dvi8L9FVgMw35sFOyOjFeI6TMLSx9+5bcWNE3nHCST4Lx7Yn5bErRupYiSOv
	xmX125f7rI5d0Qsrku9A28l4gwZewYodnuMISjSt5R2GRIbAx+AoZ3KDJKQscBS7uCJBaPjTqrm4W
	Y88zjNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qUp-000000067ZW-1VIX;
	Thu, 26 Mar 2026 19:35:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qUm-000000067Yz-1cUo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 19:35:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so962755f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774553754; x=1775158554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p41Lx57tnZ476sTVP+oFeMhnz39TyHhAq6c0xIgcxwk=;
        b=RGwvzHGRP/0e6k3aaX4TFUmq9Lmi89XNXeRynF36lqCeDtM5ZVqNtRgCk3BDUgoDEK
         pha6Cja/Hoz1worGwIBtI8GiKZl2sUdi4Nu+ZD52NBHzIcrrXXDLkxZ/vdeMqxo5OloU
         DILv05r2XYbaZrl4LnO8tR0aT6rbqgGUH6hY7vKqKiSyUrUl6ntjNGqeY/1NrrETKMCT
         sCrjfdpd3DdV3rXFJQDiBevtGCK47ySeikdRMcOPBvyDtsam2dCvyL+jmNWJpAPZzp3l
         vJOth21FNmdS2ptgf81ETHKwA0f4z+U9VPyDl7LLWdDo4dJgF+4Xln2e9BL9/s9kuqOE
         Qwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553754; x=1775158554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p41Lx57tnZ476sTVP+oFeMhnz39TyHhAq6c0xIgcxwk=;
        b=Bqez/ghrxRDRfN9vm4BVMpPpZ2TaMvqH7VnLTeDaY99v5CCvxZZQkFq98sLxb53VNn
         2cqv9uPbnxJIkoUREvaMr47Cv2xQqT7+d5pDvp/Jafar4DVEJlV6QbZhc+Dy7+UqDrQe
         Yep8nKx0fx6qhK7mTz5VoPO+rxYE6rM4KgNKP7nt1IR6nTyCMxEhfXqJmXg+f+z4IUgz
         8In4o753kKzAepVqzP0krNBvO5iiJ52GYVqkyx4/QB+SQOy701F1WTxXry5lyjMc5f+w
         xncHrC6j3iiv2U9Zb799/tjpiQ5vfbWNVwc9y5Ueof30Swa9vbQh77pcWPBJhaMfq0bd
         BQTA==
X-Forwarded-Encrypted: i=1; AJvYcCWLN3FZOrmuD9wLAoqTLdF/WLrOeRIc1aAFEMa44zz8ZU5kcFsiBnolKaTGzU1yirV/j9ak3ptcrL+lMeQ+DDo9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+6MUFlKxtEhtQRKynjrMcKZD7mDcs8LiCwIPgo2F3knzJ1L6S
	Fs2QzfeaxE0ERlrC5TEzI6JxEd3SZkazXh7rc9vbE6Una7AY5kJGDbRoRlCgR2c0P64=
X-Gm-Gg: ATEYQzwkFtCqOqZnARcPjryOBvmxWJlrj5DW6uu2/h4YxONCq3oiPaEeftyZoZ0YG+a
	YAS/LK8YXeQH/E4uQq3E0wX4UQrR9YuHMZbHyHGtdskS4hMkMjn9Vyh5hRLxTOdNXGi4yAv3JEY
	Km3aDgLxqkbG0jTo1fkhjBWbryvUQCfl3InM/gCfwfRlsDdxMXKTFtYgOqR3eyQc1ByGGxugU9S
	XgyEXwykBbqtfXB0ZKpa+DWIdkmrVvNiWHidV3jfHLtCLom0WO7ZyTg2PZkA7t0Hldy1ZHY08hU
	4aBYGfqmSpwYUI9oIal/2sd6nqnWFAyuim3H1K9TKGJ+yzzGb1FJKAFebd6lp5GChiJvzUua+Bz
	jrFOgMAvHorxw1AJwhaXHm0HSbggGDCffqXta3e11+QoHpMCGUE8XRxf5h7McfHFDvau+MDmOTY
	JJlvib237diYVjIom/vuZeF7pQcdzYl3x4lWobXWGZgUNY0G4sNgRP
X-Received: by 2002:a05:6000:2101:b0:43b:3c53:283d with SMTP id ffacd0b85a97d-43b97a5301emr3348932f8f.21.1774553753875;
        Thu, 26 Mar 2026 12:35:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df6d4sm9608520f8f.25.2026.03.26.12.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:35:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: at_hdmac: Drop unnecessary parentheses
Date: Thu, 26 Mar 2026 21:35:14 +0200
Message-ID: <20260326193514.2377083-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_123556_558614_D9FB3AF1 
X-CRM114-Status: GOOD (  11.00  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Drop unnecessary parentheses.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/dma/at_hdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 9c8c0fea8003..060c3c868af4 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -816,7 +816,7 @@ static void atdma_handle_chan_done(struct at_dma_chan *atchan, u32 pending,
 		} else {
 			vchan_cookie_complete(&desc->vd);
 			atchan->desc = NULL;
-			if (!(atc_chan_is_enabled(atchan)))
+			if (!atc_chan_is_enabled(atchan))
 				atc_dostart(atchan);
 		}
 	}
-- 
2.43.0



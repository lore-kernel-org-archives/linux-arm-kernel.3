Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B264C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBdiIrYChp+orSW8T5PetaX1/aYuZKLZbUVGp074V6E=; b=V+DKBAqDswy32EpyUl6EuH1dtV
	OFPrYiNlvBWOO7iLQvge4mnYxlduvAUyUzkk7f+ZyHJwQO6hCKs2xpxhyY2vjM/iABGAUB8SvwkgM
	MtcTpof9rF2ZKi8lwCEaasUDfeUKjJDtcZj/5iZH+Kxd1uVWtvfVE4k6y/DNyOIZMvgbrDUD51T3P
	RHaBGvqts07pI1aAWBn7MwMv4a1SWUDfbSETMKo7e3mcrKERvcYuWtOs7q129i8QnVBhCJ6RqYIO9
	SoePBcwp4WaDmAAi5WEFZgREcdGukhkxMaU5CllLUCP/mw15K+fSHh+mWHOHNCVDe6s0Lss0ZCFyY
	MhXng2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcQ-0000000B36F-2sVC;
	Mon, 10 Aug 2026 05:32:14 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcO-0000000B35Y-41WM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:32:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84eb992a881so905856b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339932; x=1786944732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBdiIrYChp+orSW8T5PetaX1/aYuZKLZbUVGp074V6E=;
        b=tD/PTyhDwWEi91AbJPOvX5d7cgDyuK1vujsrtyeOmY8VfSuVxYxMRkIZZgP+z0q6Dg
         kuaks7lvxciIUfY65T8MJBvCYbigRDy8oLzL5LISp+YnRqE21CuTJ3DZDfUqv3avqJo6
         Hy4tWXzkA7h5vT1Kkq7Vi0QTus/iUmxIFgJcRYtuakKpzYKLgdlxm2100k+2xGP0m6Kt
         vXmBf56wVDKVSN9EaPpsKy2KU1l2dEORlspbIU3B8yfNj+LmUBVjLnN4J29vNfwQD0xn
         z7wDbHmZEM4Gw4ApqQbhPSRRKt7UkuIDLpNewsId7F6JqpbhtRwLg2rtXRhQoNwvLCVq
         phBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339932; x=1786944732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBdiIrYChp+orSW8T5PetaX1/aYuZKLZbUVGp074V6E=;
        b=l4jxJLaQ7YKSB/6zL3iwH4xOPMfHlankxyF6UmzrqeiMwNHwh7y4lXpvYMzqg7Fgpe
         pZfFlSEYYawMq3rdWT4rTz+EnbGNyf9XJdqew8NYcwO15/7zlQopCJ2gb52DWighJjRj
         ATpkYVkDBLdMhqFGiL1vYODbzEPXG1b784BV324MRi6ER08u4ZeX5Hw6TArE3tc7aaVS
         bOjSv9hYSE7nWpu0hR6lrX1RJEXCMQhnKdl3IfziaJCjSLyvx3GySUdVHsExh3hHQ/pG
         k5K21KYj4zhd2xZp55IQIHWuD8ek0YeaOmFTzmM5mrg9Onrtfoh8PuryHS74PuUVcR+e
         TapQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp9O+MHmmCE9Mm4h5jjk3IzjA6plBcFg1nazZVe1pv38gm+MV1HyPa1IWEduYM9W8s9XRwh8jmlJK2220pLbGl@lists.infradead.org
X-Gm-Message-State: AOJu0YzjQ+8CDCkG6DsfAkduu66vNaPAeajVeoAcq/V/Vbv1pl/6fBJq
	t4d3aWbZV2Mzf4BlGeagQb9xvetJDCHYAVbVz9pJduF0JXw8DvMWTsMC
X-Gm-Gg: AR+sD10TpBReWGkoXQJ853T5wP//222UpfQcDdusGLgEcZZhgL4eaCXrUpPFV+vMG8c
	j9LphKt9wFYteIaFySIWwlhpg5OqGfeS8ixJpEkl1idLkLEWKFQXScUdLt7LyZEH4Ro16bg186+
	XKx736FJdaSG0aZWA+6Pcj39LejKLRbF+u7vdMQULVaEP/9WCM7/fwlRSWu19sZy3q+lhiAXyXQ
	z1/IgpYL5vu0ZdTeP11EalBJ2JWk3EyG/no7WJ+zQBzVYwbN4U7+ps+1vm57P/tPNJS09jA+UVs
	+Sx+Ve45CdwGiqIeMxhYDdH2YdzjdShMd/NZKV89OacCYF1kv5MGihgD637s9OALwiob9/LQjBs
	UvzC5jKlBwad4L787UyolvWiHSBl+HZbcCgX/50y2EU/oY399pkpJ8FzNvXfAjM5zcaMC4T9yl6
	9Ds9Y9O19W7nkQ8raLfn8MaE77QA/nir9ZQQgF6z2OlqL+VrmzHptD8Bd9tq7vjjKqr9u4eC0Pm
	hDXo/3SvlW2b7Q6Ynr5GeRT7GcLsQ8EI9nEDVd1H3Qd24fjb1h26/MfMl1huPm/UmVt20LXOWwL
	TQnG
X-Received: by 2002:a05:6a00:8d1:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-84f4fd9f82amr27371562b3a.5.1786339932030;
        Sun, 09 Aug 2026 22:32:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	robh@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] pinctrl: lynxpoint: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:40 +0700
Message-ID: <20260810053142.27938-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_223213_006164_7B1DC6B7 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..29df00c86250 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -777,6 +777,8 @@ static int lp_gpio_probe(struct platform_device *pdev)
 
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0



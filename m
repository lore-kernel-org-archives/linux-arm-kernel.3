Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87CAC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7j0GcJH+Tj+QIWl1wxKim6ikbz1e2bMUtiA5t3w5TnM=; b=i4rSnESqEEBXMirVGipcyv7rlV
	+UKheeCuz1PFV4hTxg7wpx0Jzd0PJfHG3jo1c44MAjOgW0nahUQgTG7HEo8B3bWbNLL19EQlA2YbX
	1gDryE6PghS7Twqq6jL4lirD63wWubuAlZjycq8yyLl6MeRgxQSq9nlLJMgg0XE2ZhvPyE814WAvf
	ByxyGZ3lxyAnCToj54r3aHcmvcIqUOYWAdQkLMRYq5A7emI6qDiGe5kry5iGJ1SfogZOthVXXNiKy
	VKMALVQqlHgmGsevCYYOgMOLX0BncFHEP+wuurZwTyChzMgyOYjyJV3aA/asRdWUNzqcBfzZ5bLQL
	MW0KoS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcM-0000000B34f-2W0O;
	Mon, 10 Aug 2026 05:32:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcK-0000000B33i-46Hb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:32:10 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1010303b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339928; x=1786944728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j0GcJH+Tj+QIWl1wxKim6ikbz1e2bMUtiA5t3w5TnM=;
        b=Bd7KTERCGA3kzdvsYT3v7h+bGxYp54Y6p/3oq/Hl0QAtFEVPq2PWhoaXyB0MDcnZ2Q
         ojL+8gp6d90tdpxIq5ayZF1piyA7AswCGnLaroZkn4sfYESHVzImj/J5IpIC3c51/XCG
         QMntnFW4zVc4XGg1PxYQcdMDKaEQVsAQskHxLRMag8OnMaJDpwj6HxS3OhVlUMe4i+OC
         v355bNIJdmCJV1W61+VEDdQCmpXmShIJ6uXLJGHitQDr5VuIHHCPkOg8oKuxhPAe5gJZ
         XgdQ8ovR23jPi76R/w22TYJqqfsZdh8eL19AmXML8LIQ44cmVD0w/rKrM7aeEeqXb+c2
         8TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339928; x=1786944728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j0GcJH+Tj+QIWl1wxKim6ikbz1e2bMUtiA5t3w5TnM=;
        b=HIwHTG/D1OHfSTnjIZ576XfGb86FXb6diXluT8896MMEd5OrMaMHYG+0AzxIlY/tMw
         yS3GGAiM1+c0bzJHh0uPq9y4KWjQvxWTNSjBF0MXumgiBrKKAwYHv/9tSibsB0psrv4A
         jp3QzdkRo6jobONoX91pj1EkcbZVSjwg0hIhfwMySS/S0xzkqCItynXQ5M7tuUcxQsGP
         r86JR1idUBVAqMq7ZEGXgYTrWjr6d/6YReNlOn4FsoapUVhldNXSTZ3T+exae2TBrtNG
         NbWWdUKqy7l4PCX/8Wv58HTkQL3f18AomNQAV5R1qQfqQdiIuhCxzLzJ0mSLTfg+g6nq
         IWQw==
X-Forwarded-Encrypted: i=1; AHgh+Rquorfl+zy5W9Oc8qCQhYjelS6AAj2MIrAFDaBZueoXgjR5ylYvr8o177NgrlnGt+kdiJQOjuFoXhBJJ29B8dgh@lists.infradead.org
X-Gm-Message-State: AOJu0YyOlKFBN9bvpkkKo+bIWh3dgL0b7hGFEjtqRcqNKdHnBIkkupcB
	lRtCluUZGvW/0aw46YhoirDdynbLcIzqrUedpyYx1umpBCdwoC449M4yGyhGAA==
X-Gm-Gg: AR+sD11lc8AQg40Cj2AqF3PH5t4awji93ZVU9JZUMMpO1MiiJCY4a3cJ26RzcogaR/f
	4ZiZvGGUXuTXJ/06A7XnhNmSTelIpt9tTosG0DbGgPLOUd6LJuFtimaePK5Gi464jcFiQU3WhNR
	Mu5JrDvhfQ94cFfMTMVpB6IrXTvPDsL7ReJN0Nwve98o4v8NbnDv4jsl2ACxOFkWBq5NEVy3014
	dXr0WSpL1CUjeVgW2MDrxNHJifOHpMw+gA8tmID08SpRChKLNT7tWkQmBxyMNC3RBcoMcIqYknp
	YGBY9VsWgux22S4d6tHbBqpDdVqAYf1VEG95W8eTYWJ0wXO72w0FTEJQLyLk+Z0vWcXQkDmG7oo
	4OB3BJISOVgOoN8pPeGypoAKdi+QUElVZ+DJP8UKZr87Mqh+T75glOaVuesVVJmmTXkoAg+hy9T
	MHQZdKzzPcHem8fSthG7p3pxG/4cu862V23tmytStvTMMqGg4xaROqBqyni599TDCpJWwO3Rd1c
	Yme2IMPT612NZZHsBn4grgM77TqchmmfwysOoLRRnVQOb8A/1iSv2Ap24XwKKFTdHDCldxYDhmd
	iufB
X-Received: by 2002:a05:6a00:997:b0:847:926a:7ae3 with SMTP id d2e1a72fcca58-84f4fe9f25cmr28746085b3a.20.1786339927978;
        Sun, 09 Aug 2026 22:32:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:07 -0700 (PDT)
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
Subject: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:39 +0700
Message-ID: <20260810053142.27938-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_223209_022636_9ABD78A0 
X-CRM114-Status: GOOD (  12.53  )
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
 drivers/pinctrl/pinctrl-keembay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 3241d3ae6219..0b65b186e3c1 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1497,8 +1497,10 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 		int irq;
 
 		irq = platform_get_irq_optional(pdev, i);
-		if (irq <= 0)
+		if (irq == -ENXIO)
 			continue;
+		if (irq < 0)
+			return irq;
 
 		girq->parents[i]	= irq;
 		kmb_irq->line	= girq->parents[i];
-- 
2.43.0



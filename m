Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4131C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=; b=ov6n9KLnno5M1K3Vneu+wY+X51
	2rEYn3PmtfAjWg8jbilwWYcwIkz6IbqTIcm2LcbGDW5jJxre/qrq3bk3lT1EBG12nCCMAL8axle4t
	RjWlobD0vVF0pqSlsE1P09FfnKUskJSfxNuXSIkTpW2c+qRQcNAgZ+u41rUtnLTVz/4IR8/btx7Ol
	hrtgfzVk+iTrGqnDTWax/kR52RKDh4fmGW8vIJp7nYtqINxPWbatSPtOnXnSiDGPw7c5BsURHh8Id
	slr9P7bmoQEWjb7mDS+7gmM2Ulx39mXFL0XraSz3y42txR9cGo3+aaz6MXysjZOMwoxaU2UaZbOxC
	K2CGqHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvK-00000007Wbb-0uE0;
	Fri, 07 Aug 2026 09:31:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvI-00000007War-1krb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:31:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cea3004256so40084925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786095087; x=1786699887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=Mul1XWj5sHD/+iN09E9dIAlDHtRLMoyd/4lEWjgTgisS3lk7669ld/aMHU9bKwUZAT
         qNqFpbZhxdweBLrmTr9nv9wbpRuDoS48hY2oHUnrRX8Muk2Xn1GyfcyIx6uuwvjx1lxT
         zyJRWE0uEUpEOS1k16Da9sVA7cXpeOP0AJNgxQ3Nw0R7vybyWMbB+AFQnuRJGhv7HiCq
         W7Mv6B43GVYuElif601cKdMHFZDPZ6zitkdkPlWXQYkDobbQP/JjX5HIsHDxy4PfNUF9
         wP9rHIlsu6+XbQEUR1O4+haqJPYmEcqolJqrNmPuNKzFCWC3ZSk3rsVd/6Do2fuW/feM
         swkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095087; x=1786699887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=scVr22yuVq7KbI3+oNw/+COdJ0VZhtaCyhQEIbICGKeZUvbD1cDX3+se1EHkll9r7r
         RaQXcmeGKbTaHDZtPdl1We6DNZ9ISyHGf8kKZIHwKyX8re1HbobbCG5qzThr7gVHxHOG
         z5+r9OF3u08Zg01QUl7m/uO2DoXLHolpJazsCWY8xD33n6b+ckpOU9z5wSRoo4M8HpUy
         +mcJhOrhY/iLC7ymnWPmy3IBp+z3Duc/PyhxUpz0jTbfSqgsFWZuASocz9VL+QE2qGgB
         Hb7puSH8q5dYRTLRdFlZTS7VWQR4jD6n2Il7axjpj6tpKf/3B6xj8Nvn7rdTFbkvnOaH
         ROhA==
X-Forwarded-Encrypted: i=1; AHgh+RqwQezI+alEEWTb0ZnJTpwu7VWDpiK6nUqNlP+7J4Yr7MXW5ifSDCmTwjv7hWVRVkV8sDK7i0LfHoYPUbgaJivg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx7LFlvbIypgnF0LMrFuZuXoJ/pTHLdbZPAvvSS06VWeLN0g+J
	8NA6KVNA8fza1hiZbYdjN0/ZBZUz9kk3cwfxR+wTPmxcMGsjbyfxyySm
X-Gm-Gg: AR+sD12NG6S7FJWYlRDQWx/eo8CDpEPYcfPfAmlTtWjUqge1kXmXLc8qHhK/147dsCq
	tWs4vqe92T6fhc3Wzrl1EMwM+1eBYf63t5jxYEUUQfbuFXnCp2tD8hUEhkhjRzjVkwFDs66dn+4
	6TPwfEDz84RSXmhUu+UO4eeaW2c/cnuhtSOjO4Yt/gIwdB/tFW91MKZtQezfXHtpIcyAjxvUNWo
	OFNgjIWr6iLpwrrAXrUvsGVW1wN8O+2eH01l9GN+I7/mbky/2iBYU8WiZCXsNGW9Zt/+byq4aS/
	8ISbIpmGsuHfRI2OfO4hUvCz7uI3MvxpjCCxguSXBFWGkuSUcZu26cp5kXwj+4vYhqFQbyCDLEL
	l5uJwnIL4L20nhabIP7g0eYObySmLQL7WDVVVDdFB/QPsNcjxzWiYQ4WltyiOPAjJ+HcA9SF+tx
	/Hkj6XS12Tv+neFdNa7TTvJK0ztMkqTPcUILJkmOCYlIdbtYM7lb72PrciJN4mFsiyxj1oZr+Z8
	8DOY3Dulss9WmQTmXFoT5XE+ffXrtTPyb/ndqtzUTcNmugArDCJGq0Dp18TChUZZsmdKYvBSEjF
	EwDx
X-Received: by 2002:a17:902:f60c:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d0ca7835a7mr253268835ad.16.1786095087520;
        Fri, 07 Aug 2026 02:31:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd8f1bsm6347525ad.25.2026.08.07.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:31:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] thermal/drivers/brcmstb_thermal: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:30:58 +0700
Message-ID: <20260807093058.42840-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807093058.42840-1-phucduc.bui@gmail.com>
References: <20260807093058.42840-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_023128_462477_4A3BC4DE 
X-CRM114-Status: GOOD (  13.96  )
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

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index a9ffa596f7c0..477d078ce326 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -350,7 +350,9 @@ static int brcmstb_thermal_probe(struct platform_device *pdev)
 	priv->thermal = thermal;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						brcmstb_tmon_irq_thread,
 						IRQF_ONESHOT,
-- 
2.43.0



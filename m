Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ABEC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZAoUJYms1QaVhptgTz8je2ALyqZ+PUtTYIx/F8896E=; b=OvmT2gTeuLQBprh7opF0/yyaJN
	Ck7ZGluPfhdaitYP5RcP1+BSZhVGS66xjfVlH6lDrn95HC/5IMvyhqovPQUsYzOHZkwEGhUKsmEff
	xTJWcUo5G88tBe5xwmtQj0J2Hr5TiNRFjRQaKBRufY234vpkCdENPjg5ZsT/CLdBV4pUQpAXuuVEp
	Xdf9vCXjUmH4CKollvbIQGuY/aXIukmFZA8PZ7yfYh6lu6ZHjomakmLKadx6+z3utlbVwpmuDVW4l
	5d6rbMZIDe8iGkTir41P29EKVi9UEYZME/aH0cO73DMC6dZtU4Djy2JgVHd+RW02XOmxH/1zNcZOu
	0JPpTU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc91O-00000008dNJ-0Eku;
	Wed, 16 Jul 2025 20:46:34 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7xR-00000008WFs-3Y4Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:38:27 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72c09f8369cso88756a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694705; x=1753299505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZAoUJYms1QaVhptgTz8je2ALyqZ+PUtTYIx/F8896E=;
        b=YxHn5fOJX1EfxNZCS5+gen+vWHagCr8jbTyprXHFRABaIbAHAV8/ZXrAc8CbapDP1/
         Kcmi95lZwFqwJ9+1JS+5wudzpwosI9q9tdDcWsN4gnxP3Uq+CvbWfiC+3NMBudjBa2ej
         QGbkCbc7/ormMetTugM2szFj/6W2NK7l/9tvawrq8wgyIUA8X2KwFDUJsiXo2eJyvG2X
         dxKz4KwaoPBhY86HD5zP0b5M43RYtJl2dw2n8soVLkIc4nYn+wDZ+vuesWWtPS/svfNU
         MC6QTJe5J560/jIYKGeC9IPtbZrzvytZgboYty9xvDr+oDMr/iYkhcTEe2anie2pGkCj
         qXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694705; x=1753299505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZAoUJYms1QaVhptgTz8je2ALyqZ+PUtTYIx/F8896E=;
        b=KC+PKF7ZUoTatxkFLQ/Lto9p7mT1Jy39gxuFCgewHykz/ZgadT5Aixzp08OZ0Oimab
         z2Exila2wt262fJUUffPewQmW+qV7KIi1HRs34K1tYFd+KYLZZlQWWGa+p+cgDiG3pwh
         2M2UuYmcgW64RKHbnajZVbwu5lYMkHKqRi+cluZGRy9sAETD9E8VoiOMLkb2CAEN5LmX
         U28C5EOBb4qA3ID9/FnevzZ9Ihffhne8Y7ssUkeyjpSN97afkv8HIXQndUpPU3YU0yCX
         nQkimoz5w7SPJo73tH7wSKNK6Wkgj2JvzzXdgo0nvte2obAL3JzSn/lLZ15/UiuS4uR0
         Dzpw==
X-Forwarded-Encrypted: i=1; AJvYcCWXteRuHv4Rd4MKfEBhiJZhEdB8mXYQ/IntkpQhFFCIOzbwWuEA8ayb0Fg2fnd9wk3827K3mToeROovM+5glTEN@lists.infradead.org
X-Gm-Message-State: AOJu0YzWeCC7dee96Qm4epZyCVNEq2HuPyb53mUJV3ESZbfb72kmhrXK
	jXhW+iz5eytDKoAyJoFXfiZLVXggyT0IakrV6CH7wXJlTcZtvuJMm+PI3cXrbBf1NPI=
X-Gm-Gg: ASbGncvxOAz8opjIz0FCt5g+jTE60qxE1xgpmCXAlM70Fy6qdJZXl8jDFTweS+IPWpU
	s5e7CJG/+AEdOiVaLwumADjlgEdW8oO2u5xMNSZ14OcGPx+0/+pAcewqISY2vtWO5rkon6aOYAs
	T81vrWQz0fXk+HW1Py41LiShXgDre5xJfQaRczENiops8joLYuQIx/2oImCjc8xLvnyaR+HVZbq
	BhreJgU1Ea9CwIYzmnRA9ssz2KhFs09eD+ZqaVmjmVfMhsEdV8IGc5iIcQtMWr9mEJYflAnm5I5
	qTMqK9Dq8oDweUDXjQEisrNs/S9d4d6CTHBhb01Hq+inzo2+vH3QvuqEQkvQ0BQb56XXPHam5O+
	xEUqLNnj4qFGjGFhr0SQLOWh+AhpzXA==
X-Google-Smtp-Source: AGHT+IGQe+9SacOULBoqYnLHIC+00g0T35D0fGvm1xJAYdkM18zC0nLDztSUBFlr9z1zvwzIUmVl4Q==
X-Received: by 2002:a05:6871:6017:b0:2c2:542b:bce4 with SMTP id 586e51a60fabf-2ffaf22e373mr3628465fac.8.1752694704743;
        Wed, 16 Jul 2025 12:38:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff116d66ebsm3755808fac.41.2025.07.16.12.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:38:24 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:38:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
Message-ID: <4787a3c4-9713-4b99-9b8a-7ba227e91d02@sabinyo.mountain>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752693640.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123825_896084_374010CB 
X-CRM114-Status: GOOD (  17.78  )
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

There are two issues to fix in this code:
1) If gicv5_alloc_lpi() fails the original code was checking the wrong
variable.  Fix the mixup between "ret" and "lpi".
2) If irq_domain_alloc_irqs_parent() fails, then clean up all the loop
iterations instead of just the current iteration.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 55360ae9f1f6..8cc8563e27d5 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 	device_id = its_dev->device_id;
 
 	for (i = 0; i < nr_irqs; i++) {
-		lpi = gicv5_alloc_lpi();
+		ret = gicv5_alloc_lpi();
 		if (ret < 0) {
 			pr_debug("Failed to find free LPI!\n");
 			goto out_eventid;
 		}
+		lpi = ret;
 
 		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
-		if (ret)
+		if (ret) {
+			gicv5_free_lpi(lpi);
 			goto out_free_lpi;
+		}
 
 		/*
 		 * Store eventid and deviceid into the hwirq for later use.
@@ -979,7 +982,12 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 	return 0;
 
 out_free_lpi:
-	gicv5_free_lpi(lpi);
+	while (--i >= 0) {
+		irqd = irq_domain_get_irq_data(domain, virq + i);
+		gicv5_free_lpi(irqd->parent_data->hwirq);
+		irq_domain_reset_irq_data(irqd);
+		irq_domain_free_irqs_parent(domain, virq + i, 1);
+	}
 out_eventid:
 	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
 	return ret;
-- 
2.47.2



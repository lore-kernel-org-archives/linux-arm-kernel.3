Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD25C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppg9NFBaFqyEViTmHd7vwh3QVG6vwbeyv4M1sjO9lQw=; b=G5YMEc/XPeMEwI1LWF0svVhhrG
	YFyOfBsLwGmvvVXwz0Vwpr2MdHXncXJyX2i2yi+GF6sJlTXhPsRtiGcL7p+S8P4/ScU7pgWNKJjBe
	S+Fi5cyYqNSjtogZpNeXPUROSvaj5gCIw2nGyuI1TbKG3xkM4Bl3+ufKyx14tsYxCpDfTjL5oHxy3
	dpZFu5ML6xFY2cJ1d/YJxwxlYOqaCfc4ypS+nwoHO//jMchuULndqi42471rrZZi9hlaKX8b50Kz/
	ttBmCvENldPBbfBfDL0ZqxICzf7+Kxe/ioXrDJLv+EH3CmiTA3+szai0XRibHmOCcDDOhMXPpjCO/
	lNTYErCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTm8-0000000AwxP-3s9W;
	Thu, 17 Jul 2025 18:56:12 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTcH-0000000Av1H-02Iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 18:46:02 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2ffa1b10918so835727fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752777960; x=1753382760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ppg9NFBaFqyEViTmHd7vwh3QVG6vwbeyv4M1sjO9lQw=;
        b=IMBuz4n+dBoL6iutttmelLZcC38K6R0fQcYuIrmFUsGEXE8K+kxRpIIpfW5OBxLfB0
         Pc1cXS1+ef9xjYjXsZijI+LqNUz7eKy6A9L3VrdWgm3j9JA2WDxVAbW8qM7iPjtEsD/k
         BFGp7FcT8jjqjKhrK/Kvqjjg4C3XB4W3H4saxC+AiM1aA58i3uRKqwgh7WpOZHfEagTq
         1T/cKa99Rjd4cHY3Whp/cSLvLK59w66f40z9M6YjwMj14UWz0hWWuHKRMXtErriQllKe
         JCmXzFPBmTHHcs75F7mxUI33B3ItfscS7c+m8n96+xWEoPXXLNgLRE8BjyhG+S+H8UPa
         LaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777960; x=1753382760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ppg9NFBaFqyEViTmHd7vwh3QVG6vwbeyv4M1sjO9lQw=;
        b=HDLRSYHi90LqRpIGO+sOAaRph6rv94+uRFpEFp3ajtEByaP/WZH1gEt4JGtT/+W6pC
         LgKTBzXmXZAFefUCt/Oa2rIK/oKLHBzBY54o8IzNOX4Hx60sffNo2JGgjPALZKAQahQh
         B8SH8//9HSb7PQ/cHUtrKbdXkb1Me3h61LxQ1ruLTZckckUfIgHI9Jrqb6te6WnZL+Fo
         rIkZ21etqHZ/O+BYGYvZgy2xGYOKo/7286D7vVdyuTRbf6l1c9zTampj+4SaFnVnXslU
         COX+eA60CBgywXuJzZJyWAvCEFY+saD8sUtp06jW7JiwfaPFPGlNvjOgzzlNRpsbDpZj
         plhA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQ4OAyieLTOsHUBGJXjclv6nLYFmCwpoTQ+5OO4Cw72Q6WPblRwpz0oZsizXFdsi4C027mDj6IlgHZ9JRDjVg@lists.infradead.org
X-Gm-Message-State: AOJu0YxcmoaIyr7f0h/f5Yuzhw3LCoZEv5L+ZSUBBiMW67qI5E07j3Mz
	ZHKrfI6JDvzUufEaAwF8OdWA0Rt4GVzxF4eQRy8n3xPXGertu9GXsPicAQt18OVcG+4sk1khgOL
	Jl+WP
X-Gm-Gg: ASbGncsS+8n9XnEVtqsGBzaQK+NtMVdtxfQKPDQyNHyacCJmeQ9rCGSFO34/W89dIMj
	15/5CAoYo212w5oGN+MpE7JDGppNDWUBi3x9sPQnc9V44PuzWIOsfKW9a3pT+gKI9z8U8qOPNo7
	PeO481xCAMRcIPnxZ737SYSVz0JOxYZFchY8LRbuUu/CsxlfxbHl5hVGy5NaSSdYz9aWFSmndW/
	VA4t7mB8BnEpdyT9MJoSWT7q5szIq4Z0b2c915B3MinkeN2RV5k0kHlbllfvj9qbljc7cLsGV/p
	2MX2aamyEFyEAzQLGZzYzln9UcdZRV6w1PiOeJqbfQYtMvfvISJY4NgA8AH0ImyceSuej0OSgKS
	2vOqWK6MpDUcr3le2mmKLkvVmqsEfWg==
X-Google-Smtp-Source: AGHT+IHxFpdmg1jv/EBACz/Mfw+u9EqxSDZacKqFZbISEkaUgQNdX2Tnthbd34XjvoUXtDcoFnV+Ag==
X-Received: by 2002:a05:6871:68c1:b0:297:24ad:402f with SMTP id 586e51a60fabf-2ffd0632288mr2506200fac.12.1752777959956;
        Thu, 17 Jul 2025 11:45:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1982:bb13:46f1:2e60])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff1127a238sm4687687fac.18.2025.07.17.11.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:45:59 -0700 (PDT)
Date: Thu, 17 Jul 2025 13:45:58 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
Message-ID: <c9ee3799-8b70-4109-aa13-2febaff9973c@sabinyo.mountain>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752777667.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114601_049045_1DBB9FC9 
X-CRM114-Status: GOOD (  18.06  )
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
2) Clean up from all the previous iterations and not just the current
iteration.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In v1 I had the wrong goto if gicv5_alloc_lpi() failed.  Also change
the label name from out_free_lpi to out_free_irqs.

 drivers/irqchip/irq-gic-v5-its.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 55360ae9f1f6..40e361d5499c 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 	device_id = its_dev->device_id;
 
 	for (i = 0; i < nr_irqs; i++) {
-		lpi = gicv5_alloc_lpi();
+		ret = gicv5_alloc_lpi();
 		if (ret < 0) {
 			pr_debug("Failed to find free LPI!\n");
-			goto out_eventid;
+			goto out_free_irqs;
 		}
+		lpi = ret;
 
 		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, &lpi);
-		if (ret)
-			goto out_free_lpi;
+		if (ret) {
+			gicv5_free_lpi(lpi);
+			goto out_free_irqs;
+		}
 
 		/*
 		 * Store eventid and deviceid into the hwirq for later use.
@@ -978,8 +981,13 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
 
 	return 0;
 
-out_free_lpi:
-	gicv5_free_lpi(lpi);
+out_free_irqs:
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



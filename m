Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A6C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Kli8pbDASdp0VjuYAnhnppe070gvFnPXsKo7o33PTM=; b=c0lXMyDWYvVltDK+SxsnIOllIq
	yTBaPJuA3pXUu3w/+hHDF7F3JpOKNrM12KcURlDsTxSn/Btc8ySJxGkJQmRixbOy4Xy6dHzypM0nU
	xm7RiMjSbuTkmivuXPTBJ+/pGJphuicUVgTawIB8j1WRQftgRm+IF4e2/Loqt9DBipIjN//a8OJcK
	1/4BKk2WkC0wN5gMuB3d/4M4yncMEkCjbzHPJ4agEMbyoKYk2HIyRqC1EDgT8+uCNn+DeaZgcOzPe
	knYupbOnVFVv5OMgpillgSXxi0iXFyrQabYQVRtpoNjgJvWV2Lg6O6TXnDnSqyxMdHK8736A81bd4
	0kjGJOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcI-0000000B33N-1l8H;
	Mon, 10 Aug 2026 05:32:06 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcF-0000000B32s-0wcK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:32:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2059046b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339922; x=1786944722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Kli8pbDASdp0VjuYAnhnppe070gvFnPXsKo7o33PTM=;
        b=eeIhqw0jEn7CM5EFgvxJXMdvcjXf4wwdD2ZkqhCHVlBioOf/eLN7Sdt4eLxWBvrJld
         BmBLSPU2O4o0SIEGHMzXKFUk3TrVRykgSGGvdWMAXKHMZu4BLJKu401dm4DYNXud1YyI
         PbYe5FOpoZRtDM8jnJEhcK8ZtQHRkYkGlhYkDp6HYyKSRrO4YaEuyR5jIC9sJ5j3wHB0
         5IXRNAQ5hsdc/IMpf2kFSxJNUUYFkQV8fB0ciVS99qgjKWEbRNUPIW5bWqWkQ44ItB0x
         MJanjN40UpMQwVe4v4crJV9NhFq78s4e2xUkv1CpFfgWSBI3U82rfhJwHCFWs3QXLbYk
         0F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339922; x=1786944722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kli8pbDASdp0VjuYAnhnppe070gvFnPXsKo7o33PTM=;
        b=h+yoA2YVWZHwKliZ5EEv1fQlfYHMfQL+OiAWGpJ93XLo7JI/0h750SR3520ht1O4T9
         eh3y79WUtqJDzAh9pTNdu5Gtl/6OR7wfgOS2lZFlOmiVVhe4odG5K0+5zgW3aNh25hsY
         bs8ZDnVkr9ycktiS2OXGPR+SVh4E+i2lbbUx3rfQz+HPYklfTQdKWccjS+/D8vdU1vUN
         1eR4WgW/cGf3x9q00SPujYqzU+wTDWjnv3Yrwg7ALHFE0Rz4xgLFb/3X0gKvljWKKrpS
         PYql3P8kamcUBu67bwCxSiOhGPuZts/ESJ/u8oLNzbUoU3dx9gsIUrmBcdIvihDdYZj5
         AbOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ8Uy2hTEfIYWCB23Li8LXkcDkkoU7Q/aAMCqs9pKWxLlyqWmpb99oxYY7ysfOKvOSMoU7JlhGgX5BdKP2XkpJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb5zwCtpV4nN5wVBpnVbCvla3yUpYyBiBblw5BDOoDGejbXFf1
	wbH67Zmc9Ctewqo+897JTupQwNP4ojbPI34V45IIrDIIwe3ucQfh+Ftx
X-Gm-Gg: AR+sD13ckdxQU2X2Iw4jJ8SkoKfnPIqv0AEVe2QYtQ3/yPeE8xFdzzOaPnBYO5QFDmY
	tgO7F403CcoVCkriSqtDZFtWWY8QQZMVDp6gOLpvQKStrtXL+Bdr9mY0xNHYeJTqQ0u9PByhsJ3
	xj3632c67WBrckrPzVba6ztBufbptOwCmOiphmjlZ5lhwkgWJSgqXPNpcacal1AQPEjynUkHVI9
	XnMVNhOvJfUH0ppe4ARLySZuErrflyY5JtMNULbc6lV2/Ct1o+WWzKSugmITQgtsu4UkoDHUuzF
	z75PaHgHvbZSMijwQ6pSEN3COO8CXOzxhRrz/+b7GF/U2zKJqeyQR8spMQeKB/ZuuJVtH9J5Ck9
	NxU6ojgYBQ7DktSAV2OXD1TzxYxCtwzxoksWsb2THfCudAS3fSandYzh4VvVqaxUnWa86Rxtg97
	rc8BRQVxd6xG6ISYV/DjfZY4oEIJ/RRWD6Fn6WbZuNGM0BEDIV1zA2YxODMGlQ6Z/Z7wxn+9DFf
	tsrMjjAqmM6ofnCxJr7AMU1zWIGtlPy/gZURT8ttT5CpLesKTBfFNAMCqV1TNaWnvt+7milgdET
	d9O+
X-Received: by 2002:a05:6a00:2d0c:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-84f2dfc8ed4mr42587816b3a.4.1786339922023;
        Sun, 09 Aug 2026 22:32:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:01 -0700 (PDT)
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
Subject: [PATCH 1/5] pinctrl: ocelot: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:38 +0700
Message-ID: <20260810053142.27938-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_223203_288913_12CAC791 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/pinctrl/pinctrl-ocelot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..02824da6bcdf 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2369,6 +2369,8 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->label = "ocelot-gpio";
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		girq = &gc->irq;
 		gpio_irq_chip_set_chip(girq, &ocelot_irqchip);
-- 
2.43.0



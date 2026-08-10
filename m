Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3990DC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqCy83cYqtfb3bIbmbQFkKP649F3cDpniFvDlQX5M8w=; b=MJ1/m3FHxqW71EzMuzAg52tzBS
	8lEONeKvyKz6i4TeP6ZLlCoj92o0S26wKOjiPYMHVNhdD6p51OeoOktLfblc6ds6fzamDx8sSMAAh
	k1yX2VnlqgEIGfRhn6AoKkjqqlKS2t0fOlSdDP+t9vlMIbsgjYu0Vvd5/mxdo83L2wnS5tOdOLT/V
	YSFc/G7c7hXmoJflTWmQQTiU1siRQGgtTwde4Yj+0Ry73DRnZb65ymmkGAzmERxSLf/aumbdGzqG2
	pmQKfknp2D3RlKAx7QZ12uSkJJpMrQE+7NuHIWZF5fHnJYD3cH8QEImHZVotjpxpjVy3mkVAc+KlT
	FAAWDK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcZ-0000000B3B6-3nJ0;
	Mon, 10 Aug 2026 05:32:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcX-0000000B39S-1AV5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:32:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84e27035206so85327b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339940; x=1786944740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqCy83cYqtfb3bIbmbQFkKP649F3cDpniFvDlQX5M8w=;
        b=a9pcs/xgW1U92rDQPLHyXrBtt6Ga7f3YcncgrEsmdr3uGdw3J6OgAqBq2gwLlLrvXP
         5Ig7D4DQEDe/LfDL9sU0sy2/s3D9Qh2U7HWn/wg937fWPFCNDouMbCmi7pilprh7s4/b
         qOA3M94OJtz239DlCDzIOXCKo7OO3i109a2vvMDGucAXN4kPWNpmO2CQgGkgfGFT+JVF
         wvNnzaZ6B0J3O5VbAKfrknOwVeTni31XrPNmAz8TqOtfDWM/SqulxaL+21+GhD7ZRYIs
         GNeZZjvLEu30ZIZ9KLWFtwzt0feYnUFdhIzXxZ5d+jLMI5uFyclWfm9e5dJpKjKV8p34
         /ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339940; x=1786944740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqCy83cYqtfb3bIbmbQFkKP649F3cDpniFvDlQX5M8w=;
        b=Z80hb4R4oXQ06PFD/zLJOuwIVcZk1/zR3T512o5zGTO6Ra9QGo6HLKAOygBN/9kzq+
         y6aITYJ9iCw+iHg7noqmXbW18sPp6VyQ5gNWHuOQzCdnbXhX/A+dvlIXDpkx/jM6RhVq
         PCzIbZ41w0MoFyYHcS/+fNFH8ClmJdkmjD0sRkW0hj7f4IpAscvvA+fCPrDDyBR7PgxY
         2JFmQ8F7DrbCrAhNgWuGNs9+AZYEWsswwoG9zXwwQ5Imuiy7atsQUDONSwzUBVHqk5qi
         bihwifjvg4kO9LeoiOnzMXbwJlEdJKoQueeTyTlkECMExbYcQPrZxVk8oMz1G3ETvZde
         iqmA==
X-Forwarded-Encrypted: i=1; AHgh+RpZO4AHDU3xm9NLnnlSfY577q+K7dbxza6dH+LJ2bRGqx8BoC3xyQOywv0zptjdphiozEzOu1+OQYH0P5L7Ix1s@lists.infradead.org
X-Gm-Message-State: AOJu0YzyVtbVFVQS4H9Jewb8lMgPiA5br8R3VS/SLq12K30BsaRlS6i4
	oocjsXWdcfIsfkSmMAkUq9KvjMrLFpEMK4fM5zoLTii4fi1dCSHcWykU
X-Gm-Gg: AR+sD10Z2h5PW802pKZEvaqmnGWiysUBZEoZnAOKvOhQTp23GL3ylH9Cj5cAVWeseH0
	FOMA+gtKlvP7pABkYm/HDYBwRTtrqpqR9SCB6JxJc1KFM8qSbW3TRCDhudK4A4bKLqxRSudXLRu
	CmVfyz8N5+prG8jHTVVCUdCVA5e1+EBMd2DkFjExnwRFCqBF1MSiw+r3F8mn5785YyRrL/MRjS3
	8qzc1HpenaI2ljjTtEGyjLJiEoUcNycZDP6SWybGVeOpWUwNpHOzyIPRxqszxlZM3LB7DY7Tr+y
	zcsJBHM33+sVa/+iU+KFa9wl6ojJyMqwd60mHUzZuQ136ALhFeC89T65JRRTgsPJ4Ud/f4fcaHF
	MvXY9mFnjkV/ElnQanhY3eLp7rZpUjFI5yxrk8q5neTDpmDod0usbGn2sdWeDRR7sIv3z5w5Nvl
	ULNY/wB0FKGUviaaU7vdfWOtzC/k0fCv/NkKu8TZSWt1yEZoQu331qcYR1yK8xY2jaAIZGgTNC2
	fL4w7XhvabwfchqoiuEbOoxwK024+RBj220MhCrUGS81sLVer45POzeowchAr0tfoZvlE8zLl15
	fl8o
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id d2e1a72fcca58-84f2dfcf7f5mr44878306b3a.6.1786339940416;
        Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:20 -0700 (PDT)
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
Subject: [PATCH 5/5] pinctrl: bcm: iproc-gpio: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:42 +0700
Message-ID: <20260810053142.27938-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_223221_323597_21F4AD9E 
X-CRM114-Status: GOOD (  12.66  )
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
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index e20f7dc79d43..025476e251c2 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -873,6 +873,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 
 	/* optional GPIO interrupt support */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0



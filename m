Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C386CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jR/AjpIRwYXk9oHrDaUFtlf2egH/aUGrOWWf2J37lM=; b=gbz/FQjEdy4O8PKX5ve+PRKjJy
	tCySqN4R8ZF6NSfl8YmnSCAyYjHKONISxJHuLtK+pO6yey/kEfdze51cXbfzK478PIPX+VDNw7enn
	kiktbUUXnhxJNFUgVn7DF77W7DYmmp0E8ya9llhSB7wkn3JjPOGgiprluaFHLWpezOTTdrvSDG7ns
	WWSNJq7EmrHHbfw4WzHAUXWKh1SqZa51jUkqzFb6uS4oAxKjdDVZrf2lnhAp9LYnyU8vJ7gwHdV5x
	Phmoe0590F3h+BrxaG0ZOw9Qh0YyeBxiGr98rE4iVf2I2GsXMLMRBGbczIc+MUUD3IIppaxRXiHRD
	GkcYQBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRB4-00000000DQZ-0rXj;
	Thu, 13 Aug 2026 08:52:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRB2-00000000DPu-0p5h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:52:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cbedf318752so1390184a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611159; x=1787215959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jR/AjpIRwYXk9oHrDaUFtlf2egH/aUGrOWWf2J37lM=;
        b=JkZb9lhQajV7toarAaEUHrUyIJLngRJRgmP0inRovUpMWIDKNFfKfcL+HEgsk1F1a0
         AdBnW30fj12Nm4NjtNpG+mQCpxfEVeqmDP5dxYpr811dViUromQUrMFcUz8YlTxYtOEJ
         OWohA+0J7ACNrM1KR5v4cqkfV/DnqV4BEOjT9SYkaGs8TTwnF/bHfE/j1ju/0YPwEZGC
         2Ff89dmk9N6azo88jTZeMTzMzXcvmF4XkgevnQGLtdtW5TnTSErD/cASNR86gYxpFb36
         QDvD/qxEP+Xbp3g7sQba3Re8oA0sGxxyEs+tGlrWLleJ98yy8t2k8skAQInDN04MixZ8
         mXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611159; x=1787215959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jR/AjpIRwYXk9oHrDaUFtlf2egH/aUGrOWWf2J37lM=;
        b=DK/G0RO6lAYaySNBC8xsUCLwPa5yyYEnYi9DHsEjDdEFIqkmi6gGo5hCBreMWEyoql
         T9S3Tlq3E3db3ajbbYDIaJg9yTEv+Hl3YRpe63ffpPWDOcQvsBU16xn2YTCAIIpvhFvT
         qROwIUWrt7mIzJnmzcf1+lVqIkzhYzNlaHEPvoiDsSZEK345pUdt5fn/vsr24g35+NV4
         GqM5EgyC4vEzYXSmdiI7/+oyTJiuomXdmLoSFNAyPfrESQjeXHNQ1VCN28NRp0aecgy7
         bTDS5a6Evaf7q4uVba/LgmIAmbxZWYCrFtrlyF0HPSDQnWH+Y803TlcaRQxRXb10Pr6u
         KQmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDSjYeQCETKCvJNdUwnFmgrk774VD5MvNniXNJUlY+adorzhHEyKagGDsG4uIMv/U9vYEbl+tI/tNghe6mWxA/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv6w+ecxMQPsM0cGTQRryNI3iFlIZ2KXVSkpaOKT0tg2ZtJtv2
	fViACWF8b6sGpxMGu5zys+o66ExpVY5ZAYvUlkyIx3KUpmYcuLYyRmJt
X-Gm-Gg: AR+sD10AS3mm4IGUPHJl7xAZRbY4MMPVWiltIComY0Z1H3qc1BGeBBGFTlqjJUli7qN
	LHcYryGbUyglsEpkuxhtpgY2nImipLldqA0/5q9bNyG7YAqxuI+8e/BOuOp6+rr2KnWcE+ZHWVS
	JSCntuoUYhzr7dZTrx0NNo0XN9MYG1riizX4xsxycT8vxvCCNY8ihVB13g4Vyk4zGmgLhy2kIZU
	384obc47QggbLV3yACHm3Lw0SpFGrJ20AbGz+mzzvd5pbMVERABsvsIm6xqUhg+jwVPSjhXZDFD
	HLBcIjJwhnTegGAunrj4lAJD36+3AVLnYKVaZIDdd8sJORqGFbsiM2bGY+++yo1YlKJd3xGX8YW
	h2S/Q9ZrG+ef/RRYOZpZTJyD4M28N8UU/0+o63TH3faPAY6IPCKMXIO+kBgaGOQiUCMtwLm0Dyo
	YoGWgjhQ4u2s1IFldVDjLLPnYSPYvOidROgcRQGMaGi5KNp6xcVrJdZaSivLH11V80CN3rWmVay
	tNBwUTf332wiIZJD/Ut6YVyuFGW2jiKYUwf9zrPJ3r7El8KkmlccQ8TbbyAc+5h2nTMduqf0EVz
	REj5uStnrXy3Wp4=
X-Received: by 2002:a05:6a20:6f02:b0:3cc:36a0:3ff6 with SMTP id adf61e73a8af0-3cc553971a7mr6274859637.19.1786611159290;
        Thu, 13 Aug 2026 01:52:39 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0223e31sm5465372eec.25.2026.08.13.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:52:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] i2c: brcmstb: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 15:52:12 +0700
Message-ID: <20260813085213.44001-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813085213.44001-1-phucduc.bui@gmail.com>
References: <20260813085213.44001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015240_242476_F9B63D94 
X-CRM114-Status: GOOD (  12.26  )
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
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 5fa30e8926c5..91525a36e575 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -648,6 +648,8 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 
 	/* Get the interrupt number */
 	dev->irq = platform_get_irq_optional(pdev, 0);
+	if (dev->irq < 0 && dev->irq != -ENXIO)
+		return dev->irq;
 
 	/* disable the bsc interrupt line */
 	brcmstb_i2c_enable_disable_irq(dev, INT_DISABLE);
-- 
2.43.0



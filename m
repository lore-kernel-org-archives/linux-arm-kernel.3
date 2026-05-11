Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FDECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=udHBpIJli3+EZkum4HEpk4t8YdfFn6QUTjZ7riwLiEg=; b=1BTg5xF5beTC0uOU0ERo2j9GrM
	xeqh7rYZ9lB2BIeqiHBNi3eUVuItCm6TG9oPvmcwTruLtSnc2tCyMTdeB5GFAb7DX0/rANFWo+aEB
	yUok6ObQCGzOWC4lX5Z5QEzkiQ57qtN+XYHF2RnjYKc8YpIm+Cn7NQbLfgAfyqCxYTkmIA8vl2vU9
	AgOxlWiXFKs6bq204JMVk1RJzEWm5C0JbVzXQwdPB4EupJNeR3EeggvYl4OM00hfcIC8mzLSmNCze
	KjAXQp7jwuIWCwHZ72LAZb0DRVKGPb47hl4w+4ZzdEugjsI3wIEWWUZc6nsjABiU0qLENGbAc9IYX
	vLBRjQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO5l-0000000D8Og-20S1;
	Mon, 11 May 2026 10:42:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO5j-0000000D8OH-07UJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:42:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44a786a9b8aso452061f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496145; x=1779100945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udHBpIJli3+EZkum4HEpk4t8YdfFn6QUTjZ7riwLiEg=;
        b=ZlLrqgc1xdO9nqMOhIN8W0KNp2I29x/iaHxG7z1OvkuWcaoqvg5wE5lyj5S9rSeGyE
         NIMwwK2Z1odLQ77kYJe65TSj3tnrfCkRihPxjh5OCyHiuPNq+LCBcKaALxbUp8Hnxga+
         u7EAiqC6hnVkoHEA2z5opnMSEOaU6cd3fEnqVIHMl8QLDH/vOvgdSxtIYTM6RafiSZFh
         LwKMUhzHMfHXddSEGVyUtw0Zm25HRVLp3wSpJjB9MAWRYvpXBJ7rB1HU5rYN+DPqDvSt
         1eSR1i5ekElgHnERMxBsA41Izir1xzQWJOovr+cSd6tV94KXiqYWHBLl+1RFYVqod5Px
         64yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496145; x=1779100945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udHBpIJli3+EZkum4HEpk4t8YdfFn6QUTjZ7riwLiEg=;
        b=nI9YzBos+kPDHzmjDKkwbDdD5W2WfpVavzPP1jkJEq+9yhMAo0j8aqfRsTX/CkVBb6
         dPGQizB04xSYQfB0TBq/tWVj+2ANgxgOjlU2tIy5gM17hm7TOT489EWt4qg8KQ7d/1qR
         c86a9WIRXg0CLCyLtCGBntCJ7Nwkz7ED+trd1xP9qujv1+ykn+nvbE0lduCLgUA/iZhU
         i1ctp7ryno1IuhZiqQM18I5R1r1MaPntDn8H11hPDEn52j6qiXZLzdP7pC25ysa8SDWH
         oksvsy81lhIp2WQFRbAw2sRkyfD7Q98DQE1j2cNGdTILX8VBCw8oE4mV8iShtm4XdKCz
         qRWw==
X-Forwarded-Encrypted: i=1; AFNElJ+mN/o1r9eX071UnuM9z3rhbZf3YEMjVTNOmMWPeD1X9TtlO3rGcWF8JGx71tVR8o6d5/Jn2hocR+jHOXcSzel9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+j6VMOj8WNFPBVkjZMKXw3ipqu8a62r1l+BrZUpgU5BL7Hrxh
	4qzF10puD9t674njRchcMYrdgqIJHxVL5NwEIK3N6QkSzd4Hkh8FfW/v
X-Gm-Gg: Acq92OEPzHxsgGMuJrOV03MWJzDKZO4dXgxNr2wE/lPZppGkQ8G2ZAsaH5zKY4I71pc
	My9AUpTK1Zgrx1Kx4Z6xQ55cDBSFmzzZ8mIhsCnd4/aKs2plYXCdUFLGNfnDjorn+mz5f3pBRF1
	Yz2Oq3TRSvvxhC1RkbA0kFyH9e+dtdk+qNQIxDg730Z9CnNuHGvXoR30DNVoEc5rCQ97jxY2pbk
	hjYr4hELu9Z12cRYWZdiqtkYgQxTaLnwEDd1QQkSb5nIYLlIbbMucqNoXStGDCPdSedELyJZWKM
	EJczWv1lxgzh2rC5599ZRJ3I44r+brzrzt7dUbwTeTjYdSNPgJhfriPphOSinLwS8G3ibEIZQIZ
	tNyAC4HOG7sztHqM308lWjrystOHckXK6CMot60rOnwYlhGMM3dAnV0MDQc9apD1yyZsY5cxefV
	OjqFaP1GBNeUlqsJb9CE5poVmsG9t9cRf82zqTWcE9AF3W
X-Received: by 2002:a05:6000:478a:b0:43e:a978:c25e with SMTP id ffacd0b85a97d-451a4c52575mr10340580f8f.1.1778496144582;
        Mon, 11 May 2026 03:42:24 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b00fsm26824651f8f.11.2026.05.11.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:24 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: daniel@thingy.jp,
	romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] rtc: msc313: fix NULL deref in shared IRQ handler at probe
Date: Mon, 11 May 2026 08:27:03 +0500
Message-Id: <20260511032703.48262-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_034227_100728_428DC5E3 
X-CRM114-Status: GOOD (  16.47  )
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

msc313_rtc_probe() calls devm_request_irq() with IRQF_SHARED and
&pdev->dev as the cookie, but platform_set_drvdata() is only called
later after the clock setup. With a shared IRQ line, another device
on the same line can trigger the handler in that window. The
handler does dev_get_drvdata() on the cookie, gets NULL, and
dereferences priv->rtc_base in interrupt context.

Pass priv as the cookie directly so the handler reads it from
dev_id without the lookup, removing the dependency on probe order.

Fixes: be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/rtc/rtc-msc313.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index 8d7737e0e..6ef9c4efd 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -160,7 +160,7 @@ static const struct rtc_class_ops msc313_rtc_ops = {
 
 static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
 {
-	struct msc313_rtc *priv = dev_get_drvdata(dev_id);
+	struct msc313_rtc *priv = dev_id;
 	u16 reg;
 
 	reg = readw(priv->rtc_base + REG_RTC_STATUS_INT);
@@ -206,7 +206,7 @@ static int msc313_rtc_probe(struct platform_device *pdev)
 	priv->rtc_dev->range_max = U32_MAX;
 
 	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
-			       dev_name(&pdev->dev), &pdev->dev);
+			       dev_name(&pdev->dev), priv);
 	if (ret) {
 		dev_err(dev, "Could not request IRQ\n");
 		return ret;
-- 
2.43.0



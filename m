Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B86BC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=; b=V8O2hlB7pOLkpP9gt0q4aJ+NM7
	R5VWb6EhwPYEBeloEKRMOkGGbjAsldMsCpfb81/71qPnd/ZuTlBYwE1z+dXgbfNRlW1mvzaZIy8NJ
	9nPT/ABxDcCn9FCCrUQjhehjvzs+DzieX38HCJMk7Yb0a2twity5xL/cEKNrpY9xJscvtZQLxj+Xp
	YbIaX+3ZLCjL/YZgyiGvkhFAdXhXc9OPnZ/30cfpRqfMy3zuaHK76EoF7s3QLymahgB9Tz34+ARph
	MiUlhmdjDqozXI0krSDgZoJ78Jcb9CzlWceh8uGOHe4PJehp9hlwxNod+2TPLwHyxqtLPGOTNn6ll
	EoUL7HQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUn-00000009Rre-1J6T;
	Wed, 23 Sep 2026 20:23:13 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUg-00000009Rne-19ID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:10 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2940ef15d3so183813066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194985; x=1790799785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=FxJwiGjXwButu4aH8IbypJkSLdLvEZYueGgsjRk0PleeyWw+8lM7cFMzWBr0g0JYwK
         4ZGs1y+tryFsRfA9nxPxmljmODBsdAo7EXFW5IhS0BYedBRH1s6okPGnQk3CWiaJAQkp
         WVnjFaWralFdyC5H2wDZj5Fy16DtMQvFIJUGHOw/9Vco0yQTdMFf1YLsp16P0cvegl6K
         Tt/tSwveRHHE02vn8Ms6Wal9o97Jf8g2BqmhzJ8xiMMyTSxfLhSBjfhzocwCSX2JiMwI
         ViZUHNgHi+dl5p2DOExcvTKuQVCcKBRX0LbZ8FHtNcvSRX7S14mdhYdQfug1Sj7N9Vtv
         vw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194985; x=1790799785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=Jv2kfNrwLnQxDDn6jC1ed5vHBARPcca/pUUELRLf2sGKzv0VMpbL5w+9CTuoeIYEQk
         YOE4lWrm01JH243zw8twHjUwTTF3Dcdy/fmHGA5gAhtnyDWzDawzSZB+lVG2zJCVWzuZ
         QVTVBGeOiEGs6e0LRU/iJZc9Z34mDKqHsaXVl8nT9TW05SzF/2XM+R5CFqkz5TXJa/UQ
         kbIYUbdBNVFVccX6ywKiSK32KHq6pkCfm+wTKJi6OYN6EJv5ebA3BGWF03H58COzQpAi
         fQjI/mMsSwLU+8y/uGRwXyx+iMVAXR7C227u5JePrQB6mNPtFGKX5kg3DpaZVzoKLq9n
         uXQg==
X-Forwarded-Encrypted: i=1; AKwUvBz0I2C1dljhAJw+y+GDkGyHxdpvuYbw2X3uFw3qUGV4P0JMsl1j7LWbKA80EwY9CfDK8oeVmH5CfZRWQhwukGqN@lists.infradead.org
X-Gm-Message-State: AFuF++kGURKmlLVoNrSHf+BtlY/mYK8IoxKpDcu0a2hRNNfQLNK7Pwj5
	3nAtV1GtxxjtmTgczSyDF2HhE3nGpnBrWRerr1JRaHsHwifkNBvbx8+h
X-Gm-Gg: AYBFou0MoB2TLmzCvuxi3l4gxSe8GH135Z4EVu3heW+lfNNeJt9o0aSBntMRCK1FMQr
	4f2j/brXvB8dKtFQ3J/rE33C/TPJc5bLyNHGCuQwAfiiQcD7ugMumcBXYJlu+O/i8gh1Dbr9Xf2
	Tocuq3ry7WbzEDqoePMAgzbeazF6PM22oyg+YCXyeYgQm50mbZMIF+cDNDqsX6yCcDGGpJj6HHS
	DhR3CW8r9Fo8gXcLh4aApJE2tMA+CD/sWTVkU4YvFaxGYvEV8b7G6joiNB1xKuidW8hgq2Ppeup
	xGOOfbEyNVoqoE+OXZJKsebaVT0Lwqziu2GJNE2TqIoYrznuPQ3YIDpzM+nFB69Zoi4P+F4iX67
	OHZB/BuwB6sYdVQG2Y2JgvzU/vwJHHQu9lR3fHHefyACIO5RH5jTNCyet8ocxhoVcH/WE36fc4X
	9focMghwn2NGUhvNN5xroCh7hykCc0peeA1NXeOSVfE1RPyNI9KheCJFJVILV9MISNUg47sHsOr
	YHSK8qMIimCbN1octGtvceLeECMoUy1Y2mjhvWzVyk=
X-Received: by 2002:a17:907:3c8f:b0:c29:f5d5:5a92 with SMTP id a640c23a62f3a-c2ac23ec44fmr24127066b.28.1790194984695;
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:04 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Wed, 23 Sep 2026 21:16:56 +0100
Message-ID: <20260923201701.43391-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132307_620734_25D39AA3 
X-CRM114-Status: GOOD (  12.39  )
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

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0



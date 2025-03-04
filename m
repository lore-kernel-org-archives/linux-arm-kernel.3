Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D44C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=; b=OUaiMuYInOQN4Jd2uteWHgJkdd
	thL7CdIN11Z07MA8S9zw5Yi6TXFbF8KPnFDdzj7igSP7Wk1HiWiAiV+XH9gXN6IFWt/ZH01VM82tF
	iSI6Yf5z/fvqd88VQDgKlZG+OqKwan0cUDXD69OsO2BuDdim5wuQv/3jWLq4E1kIB1PNe/r6oBxzx
	E1OGd8vodSZtPU6ZKEq4V7MlZqGjgkEyi8JLu+W5o65F/0bqxzQgV/a/cEGnCzH+ahaQDcuIEGuVk
	Xcab8syEHR5SMLMoncgJZp48tiJhZqA9G0bCmcGbyw+EhxChxEaQkr7GgeEpp+cFqBlEfFHBggOwC
	+I4V+xMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXGS-00000005tKa-2VhC;
	Tue, 04 Mar 2025 18:45:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViG-00000005YGc-0bYW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=; b=a92QYQKHhg1ZCOQDQpHjVTQsby
	qxVMOBS3v16UCiKJRR2D7A+3LZd3xQEKF9qkBPSYV02/Bqnrxwqr9Y56eptHt+grBNAzfCETrt2eh
	q3Tm3QKg6VD3USR4BqiUx++b5sPp+xGt6hLM2rr36bpKna4mgF39mUI/Nm7FWolv1KfdQwwiIcdOk
	Odx3xR8X80krg8Yz7YNBz+qGFiTFPCWqRMwlIAAE/57kYkXyPfKU3B4L1f5FOSEEsFLzptFXd+Fn+
	p+wWYdX3eGOoVyI6yNtrWqnhLu/be9WLwk6GX9E6/+ROfOTzb/S3osiXTE8UphTsWjlgHHjzWf7bX
	VmOEEJOg==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi5-00000002CxU-0z9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abf4cebb04dso643803666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=HTuCJfvYaW9iA83wrLWbMwOiDuSHeyh5f9M/YtpHhTlbmmxFU7cwQAzrGRKrd6Exy2
         y0vqpA0FEy+S/s3m7J55BNJYwvfWbfswWokElsu2AZXYM3AsI/hRSPBMd6uIOxQrMVcF
         Lyau/ot+g1MEs1OEp0DK36K7/Bfx4PLVVyvsY2iqS6AqvjVsaSknz6dAJ/hNyvLvuc8p
         fvp/dQqE9dr9uy31S8RJlbyfHg9XIDR8ewJRxNHfo73Q8Vy7ehEc9SthUahmTF0o9EHC
         LTR5BbZxcrnaIBbmnY0ZEx4qDXt3/dunkL3ZkIM9c1N4SNmMPqpzlm61GB/0gUWxtC3u
         lDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=XPxQf/EM+MiwhmV7Ugw44CsbHDd5sJC9qZ1G+/Ldzxsor8wMMhphLcBsXYzs6pzog+
         Et9IX7hPWzHbkMUIiZe4mEz5gvbVnoLDV0VQzZ7Y25c7Yz93DL+2XvTFeuAWKkgA9XpE
         XIIKId6wnsdS9doe9nNqbuzMfL2Y7u7NlPqc1uk87Q+k2Vsw7UYgFGfdE8D7+2Ddwvqz
         rgPszHwY0i6tVWezgJACJR/jI8NqL0ltA+mFytw9lm9pwkCgdZN6W5wkQYhrhMPIB8eP
         uMQLftz9winH0O9gND3iJP+FYL2qq4+ozjjLNXoWdiiPpCgEmDMSc2x88/nNqmC7arKE
         GbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcCByahVjmgUHxT/P/9ojRDxEM4Rzp7mt7Jp5slbzTsaCmtSMka6XmKD1pRebvOd2tqUOnILt0D/bZ6tDE/PBu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfydz9G8fb/iQrh1H/CwDAkg/cznYa/6MPHMhyJ+sgciqk8t2q
	Th+lvW+ETp8nYvt18PZ74M/RzT5BVPnOeu1KGD0SnNsE4UTYSgC3kLVqr+359Mc=
X-Gm-Gg: ASbGnctrMBBa+GMVuTbFNJXprYl2ZGNHnyQTYI5nsZX2z7I4YhEptAVCVzn9jW4qzMh
	mOYQJiuU+hZCpRNv5wh/VuW5vr0wwXjTHMsvX9ef6iBImlEzfoJngQaGGXphblk67t7hreWZV0h
	ZCxQYdSKn/vrh9AfLzjS/dIUegk+fmhdub40JU1iKmXxtkPgntkOrl/E2oxDnHOeaFEDq4V7FId
	AOEElPvtQKT8NrN6ZFScRBzJaIgbBmDWM4BtdPIwfgAUeRqMRPQd6QtI00xO9nctwFK5rKE6No2
	HnES+kaQ8UZquggeZUPuWeBiPZOROO3pmqylo/ewxcYLPD+Ey4PLcsV/rOqxsyQG5SLrU0cbmcG
	nO4n19u4IEDUjpwTIxQEGvjuHOJoE
X-Google-Smtp-Source: AGHT+IGsdjvAcycMp31oFEdsdwWFqJQmXbxtDBoL5DRz6SC3HgSNRmbkL1ZXNDzmFm2b5aF1OyYNnA==
X-Received: by 2002:a17:906:c150:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac1f0e60023mr427555766b.5.1741107934486;
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:33 +0000
Subject: [PATCH v2 05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-5-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170537_733674_93DA2774 
X-CRM114-Status: GOOD (  14.91  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136DEC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+ISf5AH2/7pdobx9Be9aGkppGjiD1ho1qi799jRs+Y=; b=zfnXav5BdPcuv39BsLwo/3Dmb4
	EgfCpuGMnyyAsT93Ybj966TX2BqxKyOu/uk23hlAVfQwoRsj+V0ZWu4mLZ/Hu8O6VfxhOSYrCtj5U
	i4PRwDBBv9dlYe2UdYopZ9uKx8pr5NMyTuTWyNM4eex+uUHOTm3b5qCQffoFfjn2AxDHgrltKt2pO
	peFtAorjvYxtL6ScF7POUXVhHz8RQ798Na4Ip0uWFIeVVKsnLqYQG/L7baWCf00sle0B5kOzlneiR
	abXSsgQa3dfO4kYBlX8tzAKbsjFfGFu2q88TFvAWGNfp4Z7umLpqWf2lrRTZboMi2MVAJfh1CE21B
	xgUGnjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5rX-0000000FqPG-3AJe;
	Wed, 12 Aug 2026 10:07:07 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5rU-0000000FqOE-33xk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:07:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c96c92c0980so462949a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529224; x=1787134024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+ISf5AH2/7pdobx9Be9aGkppGjiD1ho1qi799jRs+Y=;
        b=OrrdMyZQKvJuil3fY+P330UPTGmK9TQhDbL8TU5DiICAgL5Z1/Tx+IkUzwdGH3WDbX
         Po6ChgqRg6uNluEuwyMvyE+Wbd243CrnWLl3lalRmSOiMx2/xONNfcn4fbTsFaFbKLgY
         9jGp+MwGDgKUhdLp3ZQi1CCF/fbWBsjEfktR+vA1K4lloaWfyqupmigF2idfPyBKCQi/
         65m4f2bOvoPkUScfJsDDfV71ZhoiYQGOjzkI78FDWAgjCytJhQId3yI+Rm4FFk1ClIOZ
         QfVYR5dU3MiwbVKIfCqrJxF1dvxNzI8QiQ/QzkxgKn+7R5lvYM9zMZQwfh9R9dw+4Rhd
         ybSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529224; x=1787134024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+ISf5AH2/7pdobx9Be9aGkppGjiD1ho1qi799jRs+Y=;
        b=dWibjW+Fo2XbbdTF8zfOYgBRATTeUvVSb+XiIe+ftFyyhLr29iTiRFHqhAiIHBjF5Y
         BlrLq1qo7YGssxYCfh/GBaGgngRc8PpsDLMZpRwvJRxRvaItuTIxnd+ko+l98LfkmpTk
         kXZV9kMDUR/4/8jsktHUmH/Ldk/EUPUItsHFPj2RI084keW4Qw4UhnJBvb5Dl+uM6dGr
         f1qQF8INeyBhf9wL9eVVYPZiFYP3Sxa7qvMgVQvMJyRw13+4lIOGqewPnfyZZi3JtOD+
         vhBakWVvRrJF7xhsfuF12pz28POxHlvv4Fj+f94N9u60mXNWcH41IPvGMfV/qwkSNRbF
         zbzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLmk+3wF+lZ8dKoS8arPTzDnMhWdEy52TRAPB80ysKbYex5Av9HF33Tb0+QSV/d9EKM8vc4meHwV9DpNrufN5k@lists.infradead.org
X-Gm-Message-State: AOJu0YzB4HGzYmvIsizUW74/fZpTw56v4e9HB4VUQ0zTU0/z86Cp5m9B
	kaVMmeyq6lJIhzL1VpIHSTQuJP3IVvfdz/JlSN/TZ2D4nET2t6E0g6I=
X-Gm-Gg: AR+sD11PuBQuq7mrW/sMlfhj7MKgRL8VC401PQJGWVuaiZ70tCZA9DyXmdRnuzM+84i
	zWB8P/MZcuQ6ZhKFtaqskzjZm32Yf1CDgJfeBtLsJWAkrB/8Vo8iaK6YH9S0ktnj07yFQ+TqVmP
	PdkbDqc4uaL7NePqmTGPegKrhc+z6GCrR8LY+LA1ZjOijDW/EOV5QrcqaCZ3StiCJUD7YTIQxE4
	IAtXvOrtkALQyG+jQs42yclMG1jPqBvG6UtQzeAuuraOyaUmtVGQYBUx9uST6SGd4T8Wc+HKBnr
	3mvfVNcHl03MsRbPXNuzQbDTDN0RAoFBMYuvNWOC/I9tdylqtVu6EnKfraisi1NSJHOrm0pxLKL
	n2XUAzTKgFXkBvWBs8vArAYq3144Ohpzz4JC6X/HtGjR2rastjtfsvSMG3DQNm4bOOVW1j2BEY+
	TbHn+jLMxYzCTUJZoeYxZ6i03P0PpQzavj8+j58Mmq//p1hFTvrczzkI/0F/btCJUaL2i846jmj
	rR9EK3lpBbZ1dSqUg==
X-Received: by 2002:a05:6a21:6e95:b0:3b3:fc6:622d with SMTP id adf61e73a8af0-3cc3f868931mr3891421637.38.1786529223659;
        Wed, 12 Aug 2026 03:07:03 -0700 (PDT)
Received: from t-rex ([27.59.124.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm8581549eec.7.2026.08.12.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:07:03 -0700 (PDT)
From: kr494167@gmail.com
To: jassisinghbrar@gmail.com,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2 2/2] mailbox: cix: fix DT property name string typo and use dev_err_probe()
Date: Wed, 12 Aug 2026 15:36:23 +0530
Message-ID: <20260812100623.36939-2-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812100623.36939-1-kr494167@gmail.com>
References: <20260812084742.22081-1-kr494167@gmail.com>
 <20260812100623.36939-1-kr494167@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_030704_771282_B8C4C7F3 
X-CRM114-Status: GOOD (  14.53  )
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

cix_mbox_probe() logged property error messages referencing
"cix,mbox_dir" (with an underscore) instead of the actual DT property
string "cix,mbox-dir".

Fix the DT property string in error log messages and convert probe error
paths to dev_err_probe().

Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 615218c69eeb..fb5d7641ba90 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -585,19 +585,15 @@ static int cix_mbox_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
-	if (device_property_read_string(dev, "cix,mbox-dir", &dir_str)) {
-		dev_err(priv->dev, "cix,mbox_dir property not found\n");
-		return -EINVAL;
-	}
+	if (device_property_read_string(dev, "cix,mbox-dir", &dir_str))
+		return dev_err_probe(dev, -EINVAL, "cix,mbox-dir property not found\n");
 
 	if (!strcmp(dir_str, "tx"))
 		priv->dir = 0;
 	else if (!strcmp(dir_str, "rx"))
 		priv->dir = 1;
-	else {
-		dev_err(priv->dev, "cix,mbox_dir=%s is not expected\n", dir_str);
-		return -EINVAL;
-	}
+	else
+		return dev_err_probe(dev, -EINVAL, "cix,mbox-dir=%s is not expected\n", dir_str);
 
 	cix_mbox_init(priv);
 
@@ -611,9 +607,9 @@ static int cix_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 	ret = devm_mbox_controller_register(dev, &priv->mbox);
 	if (ret)
-		dev_err(dev, "Failed to register mailbox %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to register mailbox\n");
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id cix_mbox_dt_ids[] = {
-- 
2.55.0



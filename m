Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC364FCC9B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=; b=T+7YSYOOZu6WBqG93NqYcC4pgs
	SqIhYtvNSlU3taB4oe8GGHzoVwq3NQ1dzqvDTV8NwKXb3YtlPt4C4tqKXVW8sd3AYKYlp5bspyGiZ
	9h0VB5pLcCnC2T5OWWH7rpvic9hDGGLG0GFTXAvPnB2OcnCYU7b1DwAmTKQ+Ugb1H5Xuuo5X/vh9q
	BHOymOagWTrhA4MCvSq1eM2oo/sEO3rziHbtFTGHQqgK/Z8d2HVs6fBrDL/Xq+r3Mx6JjGc+URXMv
	uBPuhNMrZ4hzf1x0KH9dRu7+2W9hvoecx9RiApuCSZUgWbAPNQkWHCsTykzEsK36bfq86TWNwcFRP
	xGPbKwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CJZ-0000000AolE-1OVr;
	Wed, 11 Mar 2026 05:41:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CJW-0000000Aokd-29kX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 05:40:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-829a9d08644so2879683b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 22:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207658; x=1773812458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
        b=nlP1ffO2NUIx0jt6n02M2ukdWudQHd9Py3s87XhsQ3IpgXnMYl2o6Nai4ro7g8ja3n
         BO3vBgTD/2wRe8lvx7LOEqRvy1b3929NS8OjQjHrl8H+P3XxqMoX5SzGq3kNzYxxiNx+
         3+VMD715qMAsgy/H4s5XvwEAycfCJSL7xe/KKgxO6j3V6pTJeEa5ehmtOdakrQ7uIp0n
         K5C8MeemS+hLaqZcHAsJsNtTm3gwEZMfSGcISSSk7DhC/CDx02zzr+vfbiW7T6vCXrnJ
         AblMEkn0amPuOrqa4oJD8ETJ8C0IVUQg5lD/Mm0NfQ6RGYBOBU58PUQpiFHhAByt/7aX
         8D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207658; x=1773812458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
        b=D6+27wrC3/3KqE5LtRJqk/W14vRlXBmbx+QEUwxvTPQwSlph7nBIPIdG5zOlHg+L//
         pyEdJUz6oJdDcgpzQnU46HyNahj3qLbMuEfjulL7+pF6H+02WG3jnYOnyLxDODaanwU3
         ZRi+vvzzQY5t3qQdYeNGqTmf0b2q0LYKaIYWuZ0VJdn2H2JEcJitNEmwB0oyxWp3g5HJ
         1xGK+rZWOTZkul07kiH2XQEV6gkr/n7Ozd0UyfOJ12smUKNcFFwl5tm4/Tou81tUix+f
         BzWtTpYVBApzseuNy+3SefWmm00tIqLetsQDButSN8vfXma8vwbeNN1ICyUEKD9otqB7
         3vWg==
X-Forwarded-Encrypted: i=1; AJvYcCWGLP5aQmrgLm6mFs1DU4cK3wW4GCUjNUQJ/sfj/AS65wd8xqnrn3IazmyrCMGjsFHEf2x7+FCEbmTrDMaAUthm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39AvVjwR/iIuMaePlWn+E7s8AWB+1v4RO9wwPaAcpd6Ug9Y3O
	CiJjVjzTMO+liMYHH9fZvbtPEok6fDnuBU2zGuywcxy8AP8zt7wC2CI7
X-Gm-Gg: ATEYQzwKlqJd3lKS2QeOYN1VqEY1+XY2qsahZZxtzxltg927pQGC5t3AwtwgdjyLuWF
	nYOfpGDcZAbWlVyueZ53Uyg8zl7KCeJNV6inG5Ehxm1s3VV6ks9Xcu8vJOqFoqeYJDPhQDEIX3k
	5RjU1kvBHTFZJXzG6T7uGGDAWX/G4khIviYAGijbhp1YmInHLvvYBRUM3kkXPA9JvhndOEP7uGN
	TZqpb6otaNoClwrGwAnzrW+fNEXdymA67HhG0XLi72SlqzM5bhQSqI4qiXX+T9L8Dr/O7xW2V8F
	TMkoFYSQFv0hRDI2D1WhXol8Ao3fEA4LprUTCsSnQ1QW+J/KdS7FmSNhNbEUd5JfBUDbZUBz+Q3
	VXk2auHE9O7xuZ8pVm4WBn68M1+bskhRgH01sDArAFIMXLoCTEbXZs9C+1ODit4vVPqhbM3iYqn
	457AaH2xBqyb852KketdfLK0M4EHi6tLJqYLpyM+7n4CsZvv6cRZgVlg==
X-Received: by 2002:aa7:88d3:0:b0:828:d9a1:c604 with SMTP id d2e1a72fcca58-829f6e71531mr1386417b3a.12.1773207657593;
        Tue, 10 Mar 2026 22:40:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebff0sm1058168b3a.32.2026.03.10.22.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:40:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH] irqchip: stm32-exti: use kzalloc_flex
Date: Tue, 10 Mar 2026 22:40:38 -0700
Message-ID: <20260311054038.166293-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_224058_571768_8CCF0057 
X-CRM114-Status: GOOD (  12.91  )
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

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-stm32-exti.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..144120cadfa0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -45,8 +45,8 @@ struct stm32_exti_chip_data {
 struct stm32_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
+	struct stm32_exti_chip_data chips_data[];
 };
 
 static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
@@ -269,26 +269,20 @@ stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
 {
 	struct stm32_exti_host_data *host_data;
 
-	host_data = kzalloc_obj(*host_data);
+	host_data = kzalloc_flex(*host_data, chips_data, dd->bank_nr);
 	if (!host_data)
 		return NULL;
 
 	host_data->drv_data = dd;
-	host_data->chips_data = kzalloc_objs(struct stm32_exti_chip_data,
-					     dd->bank_nr);
-	if (!host_data->chips_data)
-		goto free_host_data;
 
 	host_data->base = of_iomap(node, 0);
 	if (!host_data->base) {
 		pr_err("%pOF: Unable to map registers\n", node);
-		goto free_chips_data;
+		goto free_host_data;
 	}
 
 	return host_data;
 
-free_chips_data:
-	kfree(host_data->chips_data);
 free_host_data:
 	kfree(host_data);
 
@@ -389,7 +383,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
 	kfree(host_data);
 	return ret;
 }
-- 
2.53.0



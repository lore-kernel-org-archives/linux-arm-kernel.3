Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDCFC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=; b=sd9Q4fgTBtjMOwIpFM0u82Rt++
	WaxPPg5AImG99BIu9c28XTjpA6kAWBwaX07+aemXV2tfQzcyKeLdFa8OjC/iJSpbCyQ6yQKnevpUy
	KGc7NdahrmDUTFt8WYiufMPmdufc0qT1dlaCd5YA/LeKikW/tO06IoXIBY7DjdvuTEtrpZVgCoVUM
	s2OIaMlAdnwNMPPyow5fKrPv5NvGCbzCpuF1sQlW5bcRySWFBeYtR6iIZVyqBQe22FUxuAn+FRRmD
	efkVOLJmK9dJv4Yw/GBEgvvMhPycIZ71IcQSL6yJjjlVoZdIOOH3h58ziJKUQ4VRbu5dld6XlklLU
	aCJI4opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyALp-0000000DXgI-12yH;
	Fri, 28 Mar 2025 14:06:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nd-0000000DQjd-0vfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so3960574a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=xzhTbMLAqih5DP0heQtUzbec6jymJti8bnL1gnpUouAhlgFCmbEdQlUEeRKQHF+CK2
         8N+AHnE5QrTNgTFgLmLUUkfZBCR+nIWD3eIckZ1gINZuuMlwz9tvZoBBlkjf/2JMNw6d
         sTpA2TK3/wFnX9Bzb/E2KdwQpXsaKMk0UJ3MIhzkvQk+pL8YH63K+GTPW7GKU6vSmLac
         0NCzdYEzyz+YVZLXrPXHB+7meii+qVGiK4gKhh7aWWkyd9nC+rB7T9zHtP30AodHVypH
         eT66eZhIti7YRtppOmPqv2l+oz3w7tJVO3pAb7zqxEev7A8zTocxZ0ZMYGCWByWSiQfR
         p4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=aXstbTko/fTxC5cz6JliwK7mmOdfEnUbY76wVrdYUmMP1OISSkqvdphlzdwiHE29HH
         FI2o690Ai8wyNVihxWMuTmcTI+evD5oldr/RqwQf40t70jt/Sg5pYLl5glGSHp0sz0hJ
         iIdNiDomYNQfg0i9Twlb+ci9uaTtwKyKqtckVrk+DuXmA/pEjzXcdPgXw7i1Gh0rj26l
         6Whgbu/1uRM+BbEhWBdyOSCemb+7csR3x1/dHwgbH/AD89h1gGrQyNWINeErD/SlGJC/
         O6+asFUDXyCflsR33Umqv6RQjAjawDiOui0l7nzWtzH6F7Li1i8c4WHddZ8nGZowf+qb
         N9Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUlHUUJEM2VCo1IOvb0nOLGoBwLYVlTv6iFwVMsg4K1ccmLPW91ivb5ZNBwqIX8jrggOaPI3t3h/fvis8PMGXFv@lists.infradead.org
X-Gm-Message-State: AOJu0YwmcjCjWj275vQwUBttiOJ2z/iuFPKRAqF66LbON+4lYJbFP70k
	vr+OKyp/oePi3qrHak5Pq4O0RDp57gZGafkgu7XWr56kEy/Fa+kDK+DNoulIUZ8=
X-Gm-Gg: ASbGnctRq9g45Sqpf+/YfT45fJqq/Wv2AQM+83SMY4mEVb7SdyxfxoyoNKa2hCXQ+Rk
	cpWmS9Dh5x4aEqcJmws5lw3ZK4CTzTOskq++XAUBccDpu3YVL51MfzbEfU4FN8Sp3QBUlPoZ8bf
	BwfiWu+IPPAvyT4lISnFX7nyI0lB41RlDwtZBtTRt6DOjOTTivTnJy/9yCFrzeAen3YFPXqGF8L
	F8Jb+H3ZV8HL2XbFEFIYvTF5rs7gshMhbgXkOzVXmnLFI18AelCZFjcB7l46Dv7ep2JPc3F7/fU
	wzFi2Au1LUew2Y5qM5XpyBQ9DYXXbLSbZmvGB0LwI+QZ3OPqEMSfGKuY/WLZ7Rnvnxc2kzgBWea
	iPC68zGPrecHMi1ZkX11hpl2uC3Wv
X-Google-Smtp-Source: AGHT+IH7/8CmVUYmY+VoEFkvACO8hVh6RcnR9A51bOSMoMHldWSTPOqvDoAP3eGhyaAbNPpxpMZqQg==
X-Received: by 2002:a05:6402:5109:b0:5e6:e842:f9eb with SMTP id 4fb4d7f45d1cf-5ed8ec1e7f5mr6687208a12.21.1743168663711;
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:05 +0000
Subject: [PATCH v2 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-19-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063105_260115_B0E4255A 
X-CRM114-Status: GOOD (  13.84  )
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog



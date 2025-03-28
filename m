Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E4C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=; b=K7nuOoIdV7NPaHpb6DOOH+ITfx
	SDvrslNzV/psGzSNp6ot6u/NV4VsBxdtNKAPCv8Bd24vluy0ATmQiTkQ6SEIIlefxotLQf/do8V5f
	zS0bpJO+G5yyP3KJx/h+LYFAQL8GhO51nkZkFqq8dv9f+FXZ3HvWafktlT/6MUx+wUavXW+M2gemC
	523g767IZh0UcI2l2YeIob6XoLonXwSA6AZBELK/inik65fcQlhnFHlE6NkZkJHGwdHXGsAtvgEKJ
	PwCbN2A2VNowFhjxg9SfqSTWrTu5I0ClFLEMqJsqT6cBAYvfDEGSk14+cuBECvPaX+dKtT/tFD+7q
	hT/dJNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAGh-0000000DWmY-0Wsi;
	Fri, 28 Mar 2025 14:01:07 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nb-0000000DQiM-2CoP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4054012a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=kSuPhoPnKGYBvB/XUCnis83rGRY5Rg8t6iPQRj80tpNOaSxTELBZ5oq8Wr9cmNx+ae
         eVRUs1/Fi3e2S9LDZqAhTcrW0OctHytYLL35rncZq3Z/gw6uihEcn5OjN4sAucYJ5Fzv
         4e70UtblwdT31R5tSOJQS0hu9nulJ7aWtgnPPpXXh3s4Bu/HXpFJ4HUeMCUyNd4Av/38
         Gc7lVhYRstlk3Mh6787JvFkni8ylZAH/hz1v9jgZqMPBZZRpCyKOH1eD1mJ2bytHPybQ
         ZZ0Ys9wgs023Ykjjx9kkpuhHQHQx0O1sB4kDHZKt4erySQI6ynJj8BVhhxcl6VsotNkx
         SehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=Dk0HM/gd75vyicQsMviYejPfMIKGt0I6+nKVhVijpoSaPt4tGMExwrzp9NmmY//LQa
         vpFme1SPlnOoe26TBYeGxR2LwfWibwP5OEo8XanGDAAv9W9qXh7hrjtGU663uCxnsAHC
         n6+Ps+7ttmM2gH0qj9ThMXyk+V9jIJKotrdkGn2Lwdxrfxy+3Pv5wHBHJRWdH/jkBJNb
         9Ni9mwzzHFYFsuzvzIc+gEL3QfJ3LLMNTn/ACeBkXnerHgrnC/9X/CGjnjLB04S8NCa2
         bWAZrYJPLnL1TKkpGsiS0i/hiniQ9frEErTMB5bGI8RkzI3DcLhvIGkev3hmhgnvBBTG
         fWkg==
X-Forwarded-Encrypted: i=1; AJvYcCVnXhMbg9LIcLVLf3vTiOr2FTGrX+3nhWcQLlVrsSO4RLc80lI18N1F05up8Znj0KKKU2cdQvokmNipUG44z8uj@lists.infradead.org
X-Gm-Message-State: AOJu0YypRvJLdvQAFEN8HY9WmhZXQ+mjruC6tUkq7Gxo3SDg28TBBDuP
	nBAbtAmnCWS9ZDQyvfbpAk5SHJso+rk6CUf0gfPNvApKX5sNDWTajgom0NxUuIU=
X-Gm-Gg: ASbGncseSYjczDRgAfYl3Lc3WB9J8wZe3BFLzFUH9RH1zfmRHCcP8KWCWaoswM5ggla
	JgiEYhdVFBxJwLIcbUPSLFigJGebMiNQKElafeja71K1tkh1T8GWXFa9tVV2j0pF4zJrRqZ93oZ
	oQSI/UEs1NmEfqHHSOOaZ4h0GY644Pok1QZsouqzr9or4h3w8mx8rxRCU5zCeKNJaqwXsRX1rPh
	/3K+4UxkjHlrtIArq7pJ2AptxwbXdY96iJ9uBtGaWENO6fjR5NbS9UYZrjgUliV4ApXF60BpCpU
	j4wz+hTZB09ezTZn3NrJfFTe+RSjMviil9n4ayCOIXqAKhi7ufNQi7WGmuPI66NaaMUPwX0AweA
	ig8dI4Z3EbDAXcfVk+PNfNwEtf/9C
X-Google-Smtp-Source: AGHT+IENTriv0ZKQDvxOFGqnTo7xSy+uELps+TAzZydZP4h3NfKqEFYmhwGmgFpAh/R37lkn+8E27g==
X-Received: by 2002:a05:6402:1ecd:b0:5e5:ba77:6f42 with SMTP id 4fb4d7f45d1cf-5edc44c9935mr2924122a12.4.1743168662019;
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:02 +0000
Subject: [PATCH v2 16/32] mfd: sec: don't ignore errors from sec_irq_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-16-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063103_565699_9FD09E38 
X-CRM114-Status: GOOD (  11.93  )
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

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog



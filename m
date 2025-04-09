Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11839C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=; b=f+Ab2jbmWKkkE8vPN4aim3bDhj
	Q3H7e1iHwko5yUw/+qODb44jTH+6rWRQZkY4XVnnaY3F6fo7U8Wrs2mCjF5/dQOgCH0mGWKDMYQSv
	qABceHZNBOyQmtirsMDiDY4tswY1nHhDiOxQ+I2q557mfmHt5+xmGuIeGN9t9mtY9inTmn/q9zojs
	vD/IjEKYkOcqLNxUHt0dT4Kk7GzFGhu9AQWW+EG5+3A7HeI0lcojClAhyVsIc6CyTa4zP07XHJU2r
	guhjR+a4PAJn9f4N2R2rK69T6AMHMgELdqKk8zndMI+Pz1nMZ9ivot7rC8FrZh0OiMiBauXiNIFs7
	PVv4FUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dQm-00000008el1-1ZAd;
	Wed, 09 Apr 2025 21:58:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAv-00000008SZo-0ehI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso26349766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=ZanQmqFXMpKtPottX9mrE31umlTqppUvc9xKfGN2mIvZ7f91iUmMHLSc/0Sra2rpxK
         eCkN/uq/H7+BZQJukXcmUsZpyfm2uKrjHEFEzeHGoXA4tHJDWq7KNDhUsR56Vl6Xh3xT
         XlqQ+1UODlyj8Ru5utLbuJ6NIukGY4842cJDkpm9kPCfSCSiqaJJcDERaksM+Punre04
         vPWawGIfqY1MQiKSLk/K2dXW8wDzAxC9nM37YvQf8dmBfDEfteeBItqF28sI0JDtGa1u
         V0Kj5Ad4T2R2T63EXAhCG1YVTPfwOMIM3kfrnQxRTVD9tbn7lbIU0Y5jXHM5GI3twDu8
         ufbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=vxnBbUCEQenfHsHbMeqLxw2H62Ays6nKgBTDNMWpjAVCkSuUq7ui+diK4xwj1q2AoU
         hYy2OdCH23UmDkpjZuLYDNpTtSot/gAFjt9l1zFYgmaGHwrnKed9eoaiJnN0yb4gCOzB
         /wu9c/F8twbSKrsfFxMaV5sJR91C30Tcq5iJGI9EicpFkwMD9GEquyjLKtckxNmH2lwa
         x7irQCxQKmDXHR15Ykg1VDi1KFC9q0IGO0bh3IXSXtsfkos8gbGWXuK5ayWa9ZboxvwN
         odc1930oBK7uDme56SqHEJk4XN+fJLTGNWUtjX35zj65uhQG6/DFjgWI6CvYxxXXQm+D
         ffbg==
X-Forwarded-Encrypted: i=1; AJvYcCWjkThKRI2ri6V0PRdTktBX1dio8Za6le13tXLteqisQ2RGfTD0gQPeGTuF+nhvxMCiu9SU/5Hcg8xWJ+6Tm6Y2@lists.infradead.org
X-Gm-Message-State: AOJu0YyHL9w9q0A/iK8WLLVYlP743ne5sdOcF/T6/uIJMppZmlkO4OaS
	BFCKozspozDbhLu5e8mzZMDn+vqtr3xdvMtN8tnCmTHqqhqczvr6Wb5DWQt8GYs=
X-Gm-Gg: ASbGncvGyFGF7+J5iCKTkccwPHp0siXzbt9gFgb1+icVde+h7vMB1sz42wSYL2gaihR
	lPFUFF+yNJpgzOvVHZh02/KxBgK5zE83HpRLn9K56xkrBjdlgibujdV/WKYYKaBOHpXnzz2rjsA
	4Bbe88oiCHh0HhuDuz2CEw95qSKLctOL3YhE7Ix9DFO64Jsic2rEunIhunaC50V070EXsijkEcd
	d8lguEWWNAYkEf8xK7bDXOrQCp121sv2l6jNJp1TeKkxbuDIdusJwXhrzYr104AasLLZKz99022
	j5KFMqEGajvGoF3MQFw4gzl9KCvdMXv/7RUhMKIlG0tCc1Lq1EZbi3ay4anoNEYStNmCNgJ1ueq
	dmVDFb0S3DCOMGZo5ignd4wbsiHjf/v0RQkrTAQ==
X-Google-Smtp-Source: AGHT+IH0zvKNuRDAGqLs83RwWCcDR6aym1X5YrwLki7lH6aKqe66Jq6ZWK7rMjqREavabKtC1MlIlw==
X-Received: by 2002:a17:907:3d87:b0:ac3:c59a:413e with SMTP id a640c23a62f3a-acabd4dc96dmr8505266b.55.1744231051490;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:25 +0100
Subject: [PATCH v4 04/32] mfd: sec-core: Drop non-existing forward
 declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-4-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133733_199221_55F89404 
X-CRM114-Status: GOOD (  10.01  )
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.604.gff1f9ca942-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B025DC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8ey9NMRGy4AiZwmJyOR1WiN+5ZFsdSP2HmllASZgf8=; b=SvgZuaISnVT20oCPyGPAgGqMvN
	MVc4BO6WtGlU8DacXRBpLssUKEOBOHg8+yB9p6dYn3dWvdv8RiTPcqBCEifpTVqMMHCOGIGi0M9Wx
	j5Nd8Sx6guiw9r0uS32BIOWBKbuHKJEyATkxrJr27kFLlGvzfWK2hc55QMlDklJhYTn4hmPYOvLr8
	006W1pjhmpda+WRj0CzIUZ3KPvvcvjHpZz/5JL7z/WDLQYjQm+YoIlY5lDfeCRISnGHRioYhbHsi+
	u5AMekuUy2FLddbEWe5c3X4zSarVQP5lmkhJOewMji4P+znEpW6DmvxJAYziigPBE7HJw8bo7Ezyr
	RfKTvDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY1m-00000009Md5-1zwf;
	Wed, 09 Jul 2025 16:52:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx4-000000090ej-1FRu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a5257748e1so4597487f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071953; x=1752676753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8ey9NMRGy4AiZwmJyOR1WiN+5ZFsdSP2HmllASZgf8=;
        b=i7xoDQdt8FZiERO0aWJW+q+U3V3QqmtiuSS4VkfTCXJu227fDw7RIzftQ2PHGAI6L5
         iDVQJuVBdLpFHTCKoDVd3fjJBZ1NF67zxIeA7FWDpejdv8wkEwhd3c/fNf1/RMG685Wo
         01bUJqxxPWd3r02hnpjJyBiiphQf5nD11mM2H0x7Qi5jRS6uMBOBn68MrtLVnjloKPCW
         7b0pG0YBKdJ+O1qJfHD4ZOHZsPstzfKJ/jz6BrVHWYBObFoPU2mx9sCV8FbUj0kbsZ1K
         M9Q7ay/MVgkoEy5m5HT+l9uGe7yM7GumWSnPqv/LNDNK8vWwFIlwp+q0hxD5vKOotr6a
         bCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071953; x=1752676753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ey9NMRGy4AiZwmJyOR1WiN+5ZFsdSP2HmllASZgf8=;
        b=nQQnzfp6zcYYNeAvDh2+CAv/NYUJ4Cz003S+E4OYqS0DVbHTLbm6j1pfoWdAq9jtf0
         Nm+yyox5rPlgFFzy4stXaKurQRWrqpmP/iIu3JVJ3AohieDAFrOuBcnkpdTwoIe9jkBF
         Uwi6DYzF0lRmW/CPX0NrhiUFhtV+aBQKQA+8bEbXwTeECghWyu6CJZf2DQ5O0oZSXC4A
         z8BQBFoMhcIS0YXxLQfsIwhBBOmSMxSQ92Ks/zl0YYiAqcT3f54XBFE5ofVu2LM6ek5R
         sIIgUv02VejF2oTJeHqBG6ycJBNGFNhhpWLKxjcUerasdF6NJDOyIvRQ44IHdnYuJjds
         Qkkg==
X-Forwarded-Encrypted: i=1; AJvYcCVKwtimV525BjykPslNpLCXsPPlgZ3LCx7pAYivHedHN5qJ3qGSqBeUuD6P7t2nWCx7EF2Aokxl7Vy/rpBWTFN8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Wmp18hNiRpTO7gnbYR33SpiEijgPZL1VjaW+8Wfs4kocFTJE
	9reNafkDwrZb7SWlwVcDmq0zZ0gnU8N+vVOvgePdQ7AtNcFzD2m8Md53eccpFIhiybU=
X-Gm-Gg: ASbGncsF66gUFkWibjtsAZL0iSiKKv70VrS+VMCf4L4O35y/bLM4ntZ7i24aTSWnoM4
	SLLY3linluYUoU4n82XEvCaTItbMXkz8ASNkh9hE2BG0hP3WFCUXT9jNGw7U20G6EDu4PsQibPR
	lznzo6jlU6EkNcX4+hSKxeeHjd2mlyti6hh4SRW90tUVnLAfmpaw3v6pOYY6AK1HjNnQrXpqqIE
	sbG5gHDiLg8DjPt/yO7xWYCdN3mga1kXHBYBvkEkjlsXfhL0qGyKyv0M9hP1vcAFd9aPPRbo/Xj
	gD2LjPDL5W7sg8/jyIiJjsZ2vt68F7+uLUc2XLDOlMGZnZJVKHLi/Hk=
X-Google-Smtp-Source: AGHT+IH3JCiCUC5c3XPIoOn/lwfsnlnFKxhmqDsjCf0hOTa7Cg0njC1QzAhTmTwKPyb++TonrRxASg==
X-Received: by 2002:a05:6000:40ca:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b5e451f6efmr2623517f8f.22.1752071952665;
        Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:03 +0200
Subject: [PATCH v2 07/12] pinctrl: ingenic: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RexboHfrKQGDmnvTaw3YKGHfHVL9lqQo9zvQU03k7E0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GW0/9aJ4zVPgkXtZsFWkirehUErNCokHOB
 GM4zjrDxK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 cgwSD/9/4lUKLCEf8Fa4AaNseE6CWV+E9Z14n3smQ5mQ/ks1VymZ+aeYTaSTOCsNxzGrQvwD/cS
 ggTqjv1l2MRMz0l4RWO/hxM0JeAhC1Hhd0sKiC5tCwYojVEdjThlxXid8ZmtKDwfHe/MjjmbXNP
 s3rT1zZqOzFOOsRda92Rs23PrEsdv+iJXSfocwFjngs2jFUhkTuETOAnxwTCqSfE/T9T0IC5I+S
 k4cOXqGjO7dJwFgOha+cGo/TuoraJMCjVIOfDkovwpSef/el199HneLeoy83qvc4wnMVFYz1Lo5
 Fim7dRjRvWRSKAo2+ap+ZA58nznsGsEeXRUacClWRUhxBPkXg4Hj1zB9XA/LrR4nK4UChs6wHm1
 JdqJfbaHEXn2ozdOb69Gw8DYGWEWqnDbR+zSVHuW5raVVf9ER8IMgW6wHyJsDoPccoG1uAW4luG
 c5ZGqi7MJcVnAZhOTu3MuEIZJ9OpZJc9lgjpZ3BUoOQZKEeec+YXCjhhXSc7gDQk04I4pyE2+JO
 rwkEP6vSDYZ5mXbF7GBhHFSAjzcG80VzO7tJHpmMX4T4Jq6tgeamAMW2P+BwwMrnW4jsf6Y2n6q
 4kM2iu24T1qrY0R0V/54Hxucotv8iIK8ArMfVwMO3fhHbHjmgg2EmdNcHt+cvTNUdKIYLGksuBL
 n96DY/nkn8jEC7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073914_351496_735186FC 
X-CRM114-Status: GOOD (  12.27  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 3c660471ec6911ee494f45d2ffc13c4dc496fd2e..79119cf20efcf8cc701647d9ff979c2b71bf7589 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4574,9 +4574,8 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 		const struct function_desc *function = &chip_info->functions[i];
 		const struct pinfunction *func = &function->func;
 
-		err = pinmux_generic_add_function(jzpc->pctl, func->name,
-						  func->groups, func->ngroups,
-						  function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
+						     function->data);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1



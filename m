Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=; b=RUVt84mp08JaSl0KPo9vokPOB1
	EOblW5hMNHNxoTznr4DTHN6eEvxmhCmvVueoBSlJ/OaNBTiQI38lc7Ww2ZpFeTO1FDnp987lLBJ8d
	QofmjUrm6uf+q+E8T2C00m1iIz11mOJzUM/CwyvEUfAv+4Mq/npdRWAPzfTpH6reSN2hWY9uTGIYy
	PstQLbyyfZrJU6O1WVlNWcPWCnxp73hls8bbY8ZhiUZJKWIGuKzxFDSH9bmyZcR8y22sleG2qh55B
	jCxxJFnDqxCLdbMHIaBw4CLhxn0lhebbVH4WabpPqVq8ETtFQlKy8XLhLToPr4VA6/3XJabf5BU4X
	BNmLDGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY8g-00000009NTO-3pcb;
	Wed, 09 Jul 2025 16:59:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx7-000000090gt-1A1E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450ce671a08so30130445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071956; x=1752676756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=l+zspEL/iXRZafcP5LluTlHMgRYN88kc1VUSewmVWikBhGOy0spX09H5a9ecnMV4xZ
         bKFpZDSfODhSvx13jp2Ep//z9Ut2q1X0uR/987G9153siwf0u6HI7A8rlnoyGooTXZLD
         XhOLf9wEDDals2ZWoTmw85X00ccHgUhNToBxQD2aEPBUoezt7nlR1ZReraQw4rzrGC6L
         pF4jU+oNdSF/JLPmW2bZ90JInOtPXIgIoE9rlo7iK+kGaizMGN695fXIQaj4Ydk6mHpT
         f+IXehQROdnhVBxUho55cZW+QJuGf5yKua8ZJAPeNUOimxMKiR2NMsBzsey7oe0GKbSS
         JdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071956; x=1752676756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=To6FxdrZtQALPqmw05poL437AvADdgO3dum8uK6ZbAMk7gJCGmmTxlGbH4PRP2akkn
         4aLeCH3xlLSwxQJKm/KgE8TiP1+JhwP2/G03w7WC73Uq1S43KT3Q8fpUSGucLwjTK/m8
         te7WvoVvRDnPhxKT/ydRo8U2UzXNyNkfET0/BOQspmSUxWIO8N/AHDQ6b4vlZpwaXjUJ
         dY7hw+j6yPIKLqNWEbHziXluhhvBgFIQAGPv/CCl6BJ/GtN63WYTICI5yqfgnCrkzQcf
         6yMykPx6Z4ie8YXtse7Y3gD7Xb2EN73i7uD9zVBrMY/XcFhkHIKN5KnyGxYJs+lu3+PK
         dRyw==
X-Forwarded-Encrypted: i=1; AJvYcCUZJZmqNptbnQSJ77jvX+1p/zf1OxoD+AmtlGuqq3a8gsqDE1jO1ESR3fvU3ywZ6heFy29y9Cv7q+pItCKIzpdK@lists.infradead.org
X-Gm-Message-State: AOJu0YwGUeCEWR4Q2S26YS2HpFrAnoBuLKt+dyMorNlMDmucQeqHZiON
	IrNuqweTYtBqhfnL1oUd5Vm3vO491IHZzAHhl0ylKqWCE03IDQlkpr332pn02gnZU6Y=
X-Gm-Gg: ASbGnctxyZ73CEiJlIUtT2ehy4t0mh2pFE0AdM9KPO+odle6WJlyWFC2kdKpQ0wa8pp
	XThNf4yNg4dPIhP9JuMjEkaGkQ5gGx+x9xLQc8vSBaUIjlpuoxfYiGZ5bKB4h1XnGnCx78QmXjw
	0+7qb7kBTWrMMbIv5e7W+p87RANq01br2UcDOslKQF8wcizF00nR+VWCnNc7+6FdOKXDQTfWz54
	UTnvSanw7SYd/KfIulPY3WHDj901I55e5BmwN/PyITH7RBDHaLcgNe0G0yc1R9aFs33n18ITj86
	u6pH5qA4r1gDE5iy+ZmeJDY/ff8tS4RLOGwG8TpA7APYDETlRycOCVw=
X-Google-Smtp-Source: AGHT+IGq6DlUYoApEugH6cDhO6AeupjgahOv4gDk9/vuNfa2ylaW/Guo/o9ndLeOYxtCCVeM7IgCyA==
X-Received: by 2002:a05:600c:4692:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454d56af9e0mr29208915e9.13.1752071955911;
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:06 +0200
Subject: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UdZ2DBMT7xZXebRXGSH+ALcw7tXi9xCLUU0Hy5OPvAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HRwoShqLTGfiStGORsuza7OvA2QrMSBi9l
 ChFmBizpqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cnosEACh6WbaTtFBq2fxmhuAoGjSt+Q6E5srezOcew+EQXK6B0xtC2/jrAK0kyIdTlCiI2Jpb3k
 muui8bz+61HhIfL3xVRg9x7DZmxPMEGBTLX0wgxKYWLoabpwPGZAEVTrRFObmGV0EF0Rcxdgqq8
 DO6+GW9hWm/5CFmta27hfXEkgVFGnBgWwOkdgCXjd7IqVBT9cHAFtwK0/7y4QakKJLNfOhHEcEB
 dz6FfKO18xUZ7x9h5Azd2WQPtOc9qC3zN1SqrF4iZfKL7gba49XoNAKSX2l+osa6BDjbL6nKInQ
 RsAckjuQxY3jcwhZoIdcsUpW4Br9HhwpeAsU57wYPkbp4V3K4D+ZJ36Lr422MaOevqy6GTmMOKO
 W7apzN2klYF6JSOjzeynE9221HkqjqEqSCLPAq/K2z6xzjDYDpjzvX+yG6UlMgCHuz5qretJjIY
 P9v4eiNvHWbfTnBNIkNvI0aw0kWzP/qJsenuHmmpR5l1XaV6O+ruecKbv9jpi47XhDD5N2gKVQA
 Ibq/uYr4pIV5r1VCgSDZ5Mq4JIialrRhxOSdKjWJZ7CLdkVuVnYNbj9f00oZ67TF8yghNdx/OzA
 Lw5AXW6E6RqHHrZwuRu88iGvgV0/k4Mgp7AIsiLAorpNJ8tIa02LLZe5E+sOzH53zortWOVYjQF
 /LwuyRHibnzRGZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073917_323544_C594A8C7 
X-CRM114-Status: GOOD (  11.74  )
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

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1



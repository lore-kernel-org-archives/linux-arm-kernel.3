Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C20AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=; b=pgKxN9CE1ANFoDJQV8ML9OwHGS
	vMvVrYwQW956j621wRCLxyBT3F0TEGdgBPsYiizCQJZT1lqoT3SHPpxKwXU5RoRSa/tTsJbAVAhZN
	zSRZzwHxihFU3AFnfLANsg1sYKFVuRuy0lebqXUyiBIybAIDOY5vbw+k4K8sRwHLxS0zorLdpe7v9
	zVt1sL4brwNOMOgmW9PQHcdqHHgBdN6pgluXyzJV89luGI3IXBCWknY9gv3ZQB6ugPqXgIRYVjpx1
	Aw7tNw318v3Ku5GbqS7RzKuWYDIoDO28m2IMoknCVvsq57++Nk6F/qrcxB5KQTjf9Dk6A4RL7pYVC
	uuMjgc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetQk-00000007EqU-3mOm;
	Thu, 24 Jul 2025 10:44:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesCD-000000071rq-0v4F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:25:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so409939f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349100; x=1753953900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=wx3eI2kNFs7+3nfPPkPTF3I/lqW6pLi0QsL7X9ut1T0B/454sO38idBKKYEf3WwFXa
         wywyaTapXpT9YcX99hLuAbeHKA/PJ8xOihdpznrbcffeLXX0ueKRAAs71nDPv1EvDnEC
         Y5bIYcDyyVIimF488kqU/dko/jClQJFOkKmnlARamlaApn7GsbBQEzKOnVxjlrdV5Iwa
         POHy0SXxgdlULjP4q2uLPLEBwiW1m/uzrVEY14SWgZBSqz9M2ODoaRHqAYm/W3Tv66hT
         lqKh6dF22zN9hXhB36jgjAE785xsIQAiN2rH/pH+z3G+MgUmYSIUoje17Mq6FLGRflIj
         Ep1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349100; x=1753953900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=L8WwzSgiL/2J6/GqdrvtXonDizlOIDk6gyFRpj95F5MNV7GlgXTyXRYM9muno8Jzz2
         dOs66Daxr6bXxlE3HeF/G6KwhLknOjOqIsgZ52migm0L4an3vjdVnoXxOB/VDv3UG9oy
         lZmWX/qSiGg+9S6aj54XTGUfYyq/dWgpLQgJXVSJRw5dX7swWhyIwWwlK7I65FanfVYr
         HfcOMo+uTD0gjvc5biDG0/EJp0ixbtQ+XZncRlD+h/4irtfBkF1gVHufw7fD2Hw3+Xh5
         sb4Zex/3MUP1Sv/nywNOPgoREquKnZbWLnxYCaV5gGXEBCZIcx0wythL2LPiJ61Ssvsq
         eNZA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Lv3cSCsXGkcP0IxB6jxFNDR02hu2Q/SiZy8gCH2OZb6C8tzRJBK+X/obhoaVjLY6TUB26tEKL4N0wpjFa1Bt@lists.infradead.org
X-Gm-Message-State: AOJu0YykCvo5CROz4d7dK4k8QauRdyqLV5cc8a8Q1Np+W6mxAG8hqOuT
	vWLok9MbZrWWf7PSiEQ8clmz3OGoCTU2NBr7TRRZC29lIqyV0vjM6CGl1uRQBXnz9TU=
X-Gm-Gg: ASbGnct2syibyUSwwuVDxoTr/qHv82ZRpgLbGs5134Qh23+YogodXzYjuhCwgYselmE
	99Lr5bB/PM3VhnrUlLZNBsPUguGVngiqO7eOzmalwUqwRsi1RR2QdiMX6IPusa1oTH5j9RlQxWg
	xbtxle+tqRu21AXUXL14hf8aTsn9K2qdLv1w1IvadspLV2jRGZjJ6XCt8yAw4VWOrZUcSgKqAof
	s/fLdsPoqCebwgwQOnsP+vLiCnudAtWXDB0CcrkCfXd4koSGFAIeHOhCe8Lr23L0kE4ghTASxxR
	+ituhcwH4U4BzPpYaNMPL6vUGHy5iBVjq5wS98UEwBY/JvAyMhpc4kTGsBUjp4lrUQJ9yw17e2d
	QHPI3h6EYnynNmezS
X-Google-Smtp-Source: AGHT+IFiU8ntOuIrsg7EJjoE+jgfBOjilWpCicMTZfx/w/wMWv+Cz6kJc3kzsI0KnGWbRP7+RQsGJQ==
X-Received: by 2002:a05:6000:2501:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3b768f2e43bmr4915869f8f.56.1753349099696;
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:41 +0200
Subject: [PATCH v3 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-13-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=V65C7Z+Y1YiPq0OHKNuy9LXqO2UhBPC3XEUxRkkrR4k=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiB+9ShUR1OAFnIEDQG3sNgilmhY7Ygh6t/KE+2iWaFhFUfQ
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJogfvUAAoJEBGnLqAUcddyCt4P/19R
 usVp59cB9gmeC6caTopbcbPlDN95WhxRPi8vVSM0eahgEj4xziYJs019xI4Vc/dhRXH9v/sv4w5
 5V/98wav2sHArJ6Fwyy4TwBH2Fi70PGrZodDBC+XRwDmAFxjjdb5ZC70EkBefPFgqgWBJLHFbYK
 ERwWpuTdOjV3bR68Y+BCsI8vh9Of0hQhF4gyJj6bIdvXvlKGmd/OXIrHJqeatSdBYMWebikfG2h
 Ow7xy/+iqq+i6p4tWOubxuQ+yrYyiPvnsRIQt7j74iJO9N8kHSdgg/wuwIOdNANPFp3EsoYL0kK
 qa1Qg1hHn2GdMMp3oOXDTybNepcTiMtdkbI4jPFrei5Wi/pAZRaEfYoCaBoD1AkhZwRaNOHQQH0
 ljr1wEhPIjnp+8blcIaYZq8yVYvpNFc2j8IExWEsIXNTWECihGJxSYq27Kekunrv/FpYmZEsi+E
 grHegZHLUs5t0APfof6gAM5Dk+slyYb/GNzK8F6racQqxoEnZy+zBj52YU4q+yNxNcwylSh1b3V
 i3FtgIvC0j4c004+Y+yGAVzok9hidlMxP6cap3zpbStLEDVEte286WULSaZ0EbdfNkU66NC+ACK
 G3w6qEcvTn8zHUugxupweSvuC6MxhTVRA8uH4BAoi3nN2mf0gl1xU6dJWdB8ZlrrKBCQUuVoGsp
 K1qEy
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022501_299539_84B7A51E 
X-CRM114-Status: GOOD (  12.49  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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



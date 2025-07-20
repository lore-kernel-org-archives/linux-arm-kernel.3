Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606AFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=; b=l1YsQ/JstFxGzhqulg8zD3Teus
	DYbT/mi20vc1+z0xBvbqbO5a0VakfV7624ce42iZv05M68zki8Q3bazu7PMSMXf0Fkrc6fIYf0CaR
	VetVGOcUxdOSrXTBixcA5BABjvYRL27ZL9uUsAsSVBExrJ+pH3T9oa8j5KhKqz5ElONm9Ukncvs1w
	wQwbTL+N3nbTDKvSVA4j4oKxv3RWjf+/qNnxr/dd3Sxel76nnJxDgk4NGR1PUBvOSJ6xA/jVYg1Y8
	m8iTrryIxUJ9q4CAJO+RYUGkMc/hnKJfnirbFYmDjDn0dn3WKm58zvm34OPq6/Ty1+R3KY+F4NdcC
	iDp5krFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda1N-0000000FfzZ-1kZD;
	Sun, 20 Jul 2025 19:48:29 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZsF-0000000FfLb-1fjI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:39:04 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2ffa81b41d7so1165436fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040342; x=1753645142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=KkG/f2IOOvXFpjvwatA7Q8NFt/1+k6kfYXoajH8bv7tkNCsYs+lePodoexDk1MWkmJ
         kFKV733Mx/mpRhIsQrOTHwgIqvi9TbLyIqh17cqEWnTbjzySpdzHYsvcjAZCI8exnNGf
         TfqRK8pARwo9HXmwIPv21GwjXm/o+xqr4/o3KVGe8rR/gq1Fhb72WqAv85DNOGi6P+aE
         ShT77OcKQpL+AJJlnfvc0m2mFSVTNEiz/r6IcjeHbLFbgWtDAdgP46jDRvLr6F4SzP0p
         IummsWgP0eOmRm5Ysqv0/1kazlAoahRPON1vNgckCc7Q51RYc0k7ytDAaD3oQWuMQF8Z
         nZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040342; x=1753645142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=jCwPFjAW56xP278f4snBJ3kcHQySZJblLUylsvw35+f7nGO0WoO4UhPvQ8eAuHijcm
         hvHxVUwYCe50HPAuy+Pp6eD+ksBCyF88iQYVUxn0J9Mgkm/WlP/cWSafo6nahO/YOSp+
         aJ9rQTwek+DqL+RkzTJuzrHYoKa8OYQ+yJQBKX9ArQyCpgH1tc2l/+3ifiQN9vKzAwoe
         53w1UgpgHeugPmZMCULB067LLZUADfyC1vYi34v75arWmIk+tFvIOnK3z1ixSCmh0eSv
         lNa3boYeocX7mEhGWpXLV7Lumfb03YBKvKt4KHbOjnuDgkty73w8JpfZFFXYXuneEItu
         G+7A==
X-Forwarded-Encrypted: i=1; AJvYcCUiZZny4wLlf4+0vpmFW/N8AkqftP81I5aE0cujuj3Y2H70jkRRE7VmwIsms/kOf+wF1NBYzr0iVo89ZvyWM+L7@lists.infradead.org
X-Gm-Message-State: AOJu0YzwQ/TvwkOU1cfPVufphcETXLMCr6mgsvkoC0XG0BL2y9T0Z4xB
	unZ07x2fyc7s3iBn6g1bMssmmBSxg46S9ox0uk9rHE4WrZt80B9vj/BnFFRMKsFlmAk=
X-Gm-Gg: ASbGnctv7ddlizkAvAQ5fznSiMAiS67tJT5XmH6QTOcgiVIi0qdKFZgCo29TVMpXeUo
	x+tMLCROB1fufpA5OUCjUb3hRApzlz/UFiMbWQh6JQ+lII2jYElSxcvxruYsVnLZMNXRSh9MT7P
	Git5MXnK7r/DORstzuUDTwRdDUhUyukZXlf0GKdrdqQI8uYz5EItwOdu6lsgXhqPjWSlBV8pYLt
	OWXHUmT6vj1ZbaePMsTVamQYl5GM+YwGTx0zo0I0MpgPiSop2Ejz7Im66/lXu6rKLnuqORDDKj/
	oasJuhRyA5iBytZMeLuFgBYgyHZFlyq2UkJliVYi4R7fqq1lk2kxsuOnMAeZpBB3FUZfABQOvQr
	a+9ZhJ/DZ9S8=
X-Google-Smtp-Source: AGHT+IH8XmyhhsiwXlgfzLZBUO70j3GY7Ll+3IavnthbKLQPwxSitZFNpac9MaQeewUcKGCyD5gWsw==
X-Received: by 2002:a05:6871:7383:b0:2d5:ba2d:80da with SMTP id 586e51a60fabf-2ffaf5c8720mr13188863fac.36.1753040342019;
        Sun, 20 Jul 2025 12:39:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-30103d1d804sm2810796fac.29.2025.07.20.12.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:01 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123903_437383_07944A57 
X-CRM114-Status: GOOD (  19.22  )
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

In SCMI the value of the pin is just another configuration option.  Add
this as an option in the pin_config_param enum and creating a mapping to
SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

Since this is an RFC patch, I'm going to comment that I think the SCMI
pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
enabling and disabling output on pins which can serve as both input and
output.  Enabling it is supposed to write a 1 and disabling it is
supposed to write a 0 but we use that side effect to write 1s and 0s.  I
did't change this because it would break userspace but I'd like to add a
PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
But in this patchset I just use PIN_CONFIG_OUTPUT.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c          | 3 +++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 383681041e4c..d1f2f971cd96 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -250,6 +250,9 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
+	case PIN_CONFIG_INPUT_VALUE:
+		*type = SCMI_PIN_INPUT_VALUE;
+		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860e..b37838171581 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VALUE: This is used in SCMI to read the value from the
+ *	pin.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -135,6 +137,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VALUE,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
-- 
2.47.2



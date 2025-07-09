Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF02C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEhkAhQ7XWV9vA1JBF0jvg0JcitdmGVoPDzkyvBxyAk=; b=F494CHpNsCkeYWFriTJhkRRHBT
	DXhziHVHAGYO+MM1rRqhFz9uX8n+QoItldudRBUO4jyjTBI8mxiyv7e5+UtMG+CnNkTU+QyANc2LP
	nbfM7YUYXWby+hS9mXeUBQxR47jvy295h6LTwNvOLARYAOdEdhIIK4w+Qca06rpei8px4Ku7Qi4lZ
	l5G9KqQ8VXQFiv37cfSBpl6vPfXAJdAy9BCsoU3hKhUP9OwCg3OleedMNaI9DRUBeNwf+ZCQ47ivj
	gbiOnVrrLwNeurhuMHwqh7mdLGC24hX2VQPbdNcr7NRZNzZJvznhDJ1amSIPCpwb1plsmxU8j4DHe
	kpCedrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZY6O-00000009NIj-0f3m;
	Wed, 09 Jul 2025 16:57:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx6-000000090g5-1uP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45348bff79fso60284635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071955; x=1752676755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEhkAhQ7XWV9vA1JBF0jvg0JcitdmGVoPDzkyvBxyAk=;
        b=1nKRI1jb6XbiytqiZNNVPaziJgIENzmnDRBWUxlDAYMtm8FyvHb1oiDpy/6ek6QLjQ
         a7tz1g98FxBbpYX8YSfo9QrY+2O6lRfR03PYmjZIsaha/YI8oQYhd9sYsg/EAZhX/fFO
         V0ZO9QE7uB01dNBVsqRW6d+F+b1E4gOSKKzvJklBkskjwvZdZ4T9au9Ziih5s/gh/rJ8
         8FZO1NI1DFAttRXokRkyyq6EWC7naZzt3R+NKmSgy0SEux383ymwQY+UbqROARIVLZtV
         u8MdkHUocCZZb1m9B25T8zyqkBbosMlBVNk0flsp9NmkAFBJEVhA2gSHzTTyxdsA41kj
         sJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071955; x=1752676755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEhkAhQ7XWV9vA1JBF0jvg0JcitdmGVoPDzkyvBxyAk=;
        b=EVW0ZYgAlWiNm4bwqXya5G/58L0s9J2CiRQXiLJ6rtmkK5qMPEjIgz8DoJKWVoYPg1
         A/PgpkXTi24YobC7iznzP5jkfP/EyqrOldLMZjtcp35duytCnoJpPz6p84uHlRDECHOs
         piQvKIvoXRQZjg9R06Qz2kOEwkJvCjdDFNP2mtQh9X++etLGKnBrB7YV/iOH4xuJF6jG
         Gy9s4WrypU8y8NvtfCWH42rgR3YJa3ziIXxVpZI8r+gLgHZIoCs5wMf3Nq9U+Fpk3pVP
         IqGFC11eTUHRy5xutBTHavIvwbuDuNJhckA0vGsC1Pp6bQYQNsbaaHeG8cXr+Q/gAp5E
         MP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwD3epAQ92kgiHL782viBAkFofnwzLtqgoJrbTBtco71XteNePnRm0t5RLRVHIsdc6BhosXi2TJxhQP455A3sJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzjOje/q0wFQuvVPX7r7b68AFuXzyvyL7tlDBrDaVJMUHTuMAnO
	t4s6WWlKrSGXk81p2ZaXnuC4Sc7+jiMEl5fnMS//2m08fAY6TWFPnCcl8ne3TBklN98=
X-Gm-Gg: ASbGncuLRvlF36XsJXnGUT8Kx3Od+9a0wdkQEsYsMiIdsYkK46mOc+Evdk57vYPVHPi
	L0xIHiS4708NaDISiOCCHmKWPaQ9CxddbezfhhSzQV9PzERZYV9j0QxLGBwTX6m/aOIGrWksb+e
	Erv0Jvylzyt84zPI/ZCgiyWGccrGlYwrPUe9r0m9h7rm3aoQ2JVmEhMKADGPLKO+7d+lCUy557Y
	X8MMGY+45YBhtmvbrh0kKhjgI4HWJ1HBupwEEHcSuTwdgB4OLPXq256+CAf/933pJeahhIM9Rlj
	BIKX+WgkMF6OsuQBQ/w20beMQ2MgtrCofilt7iBLm9iOkSycsFQqFoY=
X-Google-Smtp-Source: AGHT+IFZIszVirXuuB2kJyAOaIINTeVqcmXfUV5ejP9vG/aDdFHKzvJ6Yo2IT1W3q8TqT3uTQ5XECg==
X-Received: by 2002:a05:6000:5c9:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3b5e45783b2mr2334481f8f.55.1752071954787;
        Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:05 +0200
Subject: [PATCH v2 09/12] pinctrl: allow to mark pin functions as
 requestable GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zVlgZL/U2Xhv/ZLn0+R4Dl6vFZXIXPFUIiWP8hDpuFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HhG06VHv5d2HzKTBekOvO7J+15a8E6GR/S
 Xfai8QRifqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cqYXD/9SF97i4ulotjIEdNquN9gbyknM9vnQi/2h3j6FxcQjfDllE7DjiBomr727XidoviMRbvI
 J1/27diYsmHc8PcQSDFx4IpFNcxO6goG1QuQDIEurDaVh93dXHQvj+i3UNMwajcabcgTUccwiKR
 FG0i82torREvNdlZRYdcL9l49dsCzDbC4crKr3PY4iJ7DvnWrKbR/FjbgLqdTgqP2wu6bnclCUG
 eA8x8JeKC4KTbSSG6f/HeEH4L5KEi8TJTixW7vsjjh0MxL9n1Mbb/orCp5WaajIM9yrYzs4Hr2B
 RZzmdd13RJKJwIbN4p32znqSvazbWMoaq6POi98TLKkae5qfrVN1jgk3MBEqdv7SbaQjnzQ2RrG
 8EpiOafrvtKdBQzNNHi8S96iBwaOwPGVjos1VeoBobQHdyf0jXNgtDWFuDH8Xr/fx5UglSWWv31
 byWxp3PtURq2xIiE/mfM1dzianWVtzBD8gZUMW4VTT4nWI/5ZQ6LVHLcN8QnaCQlSHAgWTixjXh
 FJkF3+laxvl0I78uq2n8kJiaAASKee/mJb/5uRy0ogHC4jrDpPsSlqM2jq5aISf750FdfiLsYMP
 5FRJTXE9I5SYztymqUoTvuvJ7tMywODdqe6eiivNfYIBJMJrNUqxsiSjhCrjTdR9fBMdgMuNvYA
 yAgicnx5AxzWlcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073916_528024_92B2CA92 
X-CRM114-Status: GOOD (  23.14  )
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

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 37 +++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 8f2fe7ffc4f682cd966728f3c77c504489f7f8a0..c0d15817275c6c4638c789b7e91e510b35e6117b 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,19 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (ops->function_is_gpio && mux_setting)
+		func_is_gpio = ops->function_is_gpio(pctldev,
+						     mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +122,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +134,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -863,6 +876,26 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree,
+				     selector);
+	if (!function)
+		return false;
+
+	return function->func.flags & PINFUNCTION_FLAG_GPIO;
+
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index bdb5be1a636ead9695410824b5557937c5baa89a..ae6da930de1b6bf2afab24599b32114584e11198 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1



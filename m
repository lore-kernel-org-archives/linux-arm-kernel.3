Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C696CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=; b=t0PoREiYof4222uFe81HpHvWDA
	gk4sh6C/dEZ/gUbw5G0m19/QYj53JIdZnDdgc9HQ/nDvIQI2cnfFlB5TpfgyhVO9sNg68wHKqtAuY
	2Ruie4y+cPFi6Q6fDty1YvozFM5fmalViTzAOdHacL2z/EWWwzokWVuxuV4d7p6FMQM3J3kNj6VsV
	ZxASw7J3WA0Ui7VrzO8hKOqha3HB6gnQf7mzs0Rvulghzx9fVaLZ6gJLUCx8OzyPAQJP6ED70qxO1
	FNO5TNWqBB6irH4BfM3irnNL01DhYTtHuMvfBXwfsnUU6nHTTLD/fTwyMavlv69dTEVbDBpH+o6dp
	qqAcoKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSvj-00000000fzc-1BSa;
	Tue, 02 Sep 2025 15:28:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfq-0000000H4ZI-2KYI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so36398465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814381; x=1757419181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=1VtcbgbI9mzipwBP3u4J6jpiKCjvx6G4SVKgp+Lv6fGHDoB+oTnR3H9ucjhj+ywNlq
         pax1V5SB+fLdBEBfs1GUL3t45bMPhJezsBvVgqu6KVBNvJIQrHNGcjEx3wjIsugzAEXg
         7IobvfhIWNej7ohARcoa1QRiFE3XoA0QPxTEqjhaKXdlUa11uDHQef2SHWjHU2dDF6bz
         aMZmk96FyYPrxrq0T9HSn3DohnBl19sw3yiVoWk/pbNpYalzUFHXCanYh90M4/3Cyevf
         LFD0VXBDL1FRrlifUFBAyZE00PLB72pwrTSt69IpU651aj6ZtK9IK0KuaNMxZdwthRYW
         6FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814381; x=1757419181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=ZkhSJFzGd6tHO21uSH3UZQglCzlP8eBAyvBQjOSUMV0mtqiqE1fSriQrxhaJw9Becs
         HlBXayf0fLzbTXVkmw0lfaFWP24c3am5rtx4riEKiLq8r4bWKrx3Z/SjCXNAwRzOxstL
         J2AHhaBhS4YHsgb7H6jzrrtYNyrTBF1pMMO0GQJsv6S7H017WGdBoERJ5YQkiGJH7/hQ
         p8NZYjm+zrCQPdJjkfBdLXed6Ga8CXqPUGYe7yufncE6tOpMJOdq1xvs7tQ5b3ySXIzS
         wHjVZhVuxO/wvvhl52fKeCSk5rqqZSMuuA7c6hIx90Defs91sLd1ESeJsgC7rPKxj0Rr
         HtKw==
X-Forwarded-Encrypted: i=1; AJvYcCW0RazxaTuXKLRm+4kBSmJd66bZaoMeyiZY1n/I+Rq1AeKBZLxomVcqDHn6TrYp1V7MGVdKf0Ko7SodFp5ricWS@lists.infradead.org
X-Gm-Message-State: AOJu0YxF08fJhaBMh753O0vyzeClHzTSCKuK1ri4ghbxCw9P06d8JgVw
	oL54xCVTW1OZDIkqxfGP5ajkxnNn19M/t8XYxU8rH8xvZl8Chcs1S34Q6M7yuNh3Q14=
X-Gm-Gg: ASbGnctQJgDMdIwWmXLCp3Czd43RfnVUa1lVd7vvaHhAKV5ZLkI7+zH7FiEGHo2Uv0Z
	1u93EtLo8CFn+DavzZdivJAqXSClZE6kYxx2Nuq0gm2ZyGBMEAwX3qdY6OttwMSoE95qPMGz/uV
	VWMqdzVjrskUi8HaSswK60cPKdUoRoQuiKZP5MQj+J8A7ZTx/snZi9LMUOih9qQyAuR+6slREqj
	KxGo/ZzlI4LKUrVokkVYhRe7ebl5m4KPuOAFQXZNroEKTWrb7WpYTZFxtCsgPu7okhnzkAzY5MZ
	V9/PAYsXV3WkhSJeI3gl6tlWpGhgOyVI87rByEAqej1V2lJy5rejy683+TDhRMed1FOTqZQwEqf
	I9Al3Bpzlx0nwfhIC
X-Google-Smtp-Source: AGHT+IFFcOpY3Utnvjf65Nu64vvFfevq/JcfMRRsoKc8OiO51qRcKypbCk0ggH7PazTdXylK2/FTOg==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr85386745e9.4.1756814380994;
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:22 +0200
Subject: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7303;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ad/7ZtxydbTdpBCeQAT3xe1dzmeABB/N+TQC4QQw00Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUnI9ibVpJgIM2CXH34HKUqefNgJQqX111f
 6azmjUqEayJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 crI8EACxskT9dEpW5d6LUzgdawqMjxZwRmZyQMOCyV0IKvpVcaQ2Vv3Wr5Hht023kdnijctKCXS
 Ido3+4GIv8wSJdTZQ56I4KxofnDG2vyYeZPNpDoyiWLkH+yc6UQndbBmcs9JBrl+IY9DsH9KGE/
 I4eJI4ZEh7eJ8j56ofq+2BznQPdh9ksHXna1EzYROBLe+wzox6SnIpbHRCCYjjI4DqrN2w0Lsv4
 4LBel3uvwjLe/5Ye+Ku/OgrfFEs6SAN+1X51mLsUeCYW+41xXi4lXCOEUoxR5tWmdb7AswqeTan
 nZ/IaxxY4w2AiOPIGeq4RWgY0Ge5XCUYgxwKgj5SrSjWQ4cmuxOJtznbOquptEloM+cdwFGPrhl
 +hPVaXlKG7ES6gnoBDPkNzXJkRV5YOKTrNa4YXr623pJEa9WEywx9eeg19elGZ/gMFu0SZhm9ur
 8s6tHh7+0t1aqqLPm1w4pdFaLTigqMH3LYRExCoJs5YdGheFHXQ93HqhY2XswD7fr8MfhKExZ97
 /3cj20QdCk2vkJvJlzaItZ2Dy6RNKHd70azroEtYTGiKkMQZ5RX8H+I8Y8YuHHiVkMKHWEncfSu
 V22BPreBipqjNwOdGxc/fGEFSh+Dt9CpW55mvqzwcer+/Fo2Asl9/9tEusw0oLjMWt9BXfiibGC
 QB1qcz+eP8lWwfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045942_717749_C3DD85C9 
X-CRM114-Status: GOOD (  25.17  )
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 46 ++++++++++++++++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 +++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 07ec93f09334f8ba8f8cbde4c54fd6a894025ae6..3a8dd184ba3d670e01a890427e19af59b65eb813 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
+	mux_setting = desc->mux_setting;
+
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +123,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool gpio_ok = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,21 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (mux_setting) {
+			if (ops->function_is_gpio)
+				gpio_ok = ops->function_is_gpio(pctldev,
+								mux_setting->func);
+		} else {
+			gpio_ok = true;
+		}
+
+		if ((!gpio_range || ops->strict) && !gpio_ok &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -138,7 +157,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 			goto out;
 		}
 
-		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+		if ((gpio_range || ops->strict) && !gpio_ok && desc->gpio_owner) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
 				desc->name, desc->gpio_owner, owner);
@@ -861,6 +880,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ *
+ * Returns:
+ * True if given function is a GPIO, false otherwise.
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree, selector);
+	if (!function)
+		return false;
+
+	return function->func->flags & PINFUNCTION_FLAG_GPIO;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 653684290666d78fd725febb5f8bc987b66a1afb..4e826c1a5246cf8b1ac814c8c0df24c4e036edd2 100644
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



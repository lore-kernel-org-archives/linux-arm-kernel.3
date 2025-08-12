Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9620CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=; b=x+sEyDA92V9Np45ru0pFC4kA7U
	3dNbr9m+fbLowgIQoXpJ0xi8hWmEnXz25m8Wd8iZUFOw/mH2CR6LquymCPf+svQgCnH+CSEkd5G5G
	W2f5WkMQWVVr4YefZoEL8e08hh3pDQaMLnz2aRxNsS0FdAteTuTmsHYJtoTwI/66WvXVhsM7fhE3K
	bBctAkpelXGVXr4rkP0fOJbAbpjLaCrYprhfm6rxnDUyAs0Sg4eCcpln7P7HjpQWdILt5LrPeU0ZB
	fRRZokHnbEOjyEUwvzQqdnRtBqv/0d8ofjW2nku1nPS1PrCYOik9UJHec47h3Rdm36jSb+76H8lFd
	wpNUeptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFb-0000000Aj6R-0edq;
	Tue, 12 Aug 2025 12:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkM1-0000000AEpT-2tjL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=; b=hjErjAV5jH9J39dEgXVRMKGAkG
	HjXL5bqNdef8MEFT6Og0zMKAZFCTPkEBiOZylXa7BgFQJ0nu6dMxmmu7dhqJj+pSHXaUE+czoCE5n
	zLdd8An2NpiB2Q9npWx61W+IubxUmVrAfCB8ueWlWv8XWEQnwh+0p9dNl1ivOVDIPmTxTYCnK9NL3
	LqRbioswliwjYg7SkBeiFxrvP9XodCupLH0kPgZmsssOtDAksWJ3iJVivoeZwmmERvSsji9Y9D4PO
	NpEgCmuz4+XkvHqoxwh7pBWFL3gO9TVlCs64w+lWsIbOeHnf/lIRhA5EXz+hdDKtef5NNjlmRexa9
	8GkbpTPA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLy-0000000Fkty-2crt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b790dbb112so3183329f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987249; x=1755592049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=;
        b=q5m0WttIHdSUlV3t4zjq1cPT7zMFW7YWqhz67W+zjHYO0+n7RB6rihRi8IUw4otS5e
         vtdCO9LWaoFyNpI3Hf4c8LP6SagdG6iRp2pkn8zDW9hSNz6CcQNXRORJg6TrVICOR8uJ
         LJAY6KKmwWcu8DIK45KB/XFvOctOmPqd1I+/ygXL/zkQPBrmFBjzFeIimt7YoLZdx61Y
         PvZukrmKYsIss/rHqUuBs9HkB/8otAuYqiMl0YtuTPfR3qilKgE4W6UysB9f+pKqODz5
         qGKQ4C1hU9G2EHzaK6htd1QXdhboKMXBzPAySDTokAX4PQ2120GpPebu/7lXjdgv9/tr
         1+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987249; x=1755592049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNkdBhL4SofepKXOMLPV0ruEBSHstnzYJRcPgI9HdoA=;
        b=QnYgEHc9pN6ggIT34MvU7fgEYr1VS5CEC9HG7GnKimO++gwzdejLlKd8bCh7L/UeOz
         iWIS3WNofFEtaeaFuwjV+/7Civ59p9SwOE4nnjcj0K/QsxG9a/M2P0Fe9egCIZsfFcGA
         jKVxDbsFKO5hryEZN5TsWhN6ZFcYk3VB0wBS1A/ppz6hK7xKrbw5EA/unwlnlpr09n0P
         qNBtqUE4L6KYkcKeuU8zFqkykzc2Psk1WBGZDHMD9c+Lbpl8X2e8fFqV4Ei8ePek269C
         EPLjLyXqE7XFRWgsQVLaLxvWL5BzcT7gUS9Lr3liPmPV27KOXJ/fydeBRcff3vqBieCQ
         u/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIA4sDBzvq0sNDt8WVygHXdS7SqgvOEELoX58R4OhCnr0gnlKj5gksl2mPS0CugBiFilP9XC6FS9hucItzMbmX@lists.infradead.org
X-Gm-Message-State: AOJu0YyjUEWvpCWakHDqli68JdObmZY/go9mcCqQquhDFSVp30rpFRX+
	dr08Fh9ki7Ktko8YKswTqXN+Leehc6hzCgJ2NNXuXvJZzYfJ0nT/tzXH5VWKVHZYBD8=
X-Gm-Gg: ASbGncsDTXNWDqzN/iA+sBAXutAe97zmmj8p9lUlQDJYyFhS0k4eq9FtM8hkZe9RFtG
	cTA9AlYFi6nyvIPtx/nuUzhzHQH+D7bDwkGhhnhjztIG97awyPjVY1Qc8BJt1TznBP6/vtB9yZh
	lZYnc6hJh7Qhhn48i0blrI3OevCtxnpQKOvfo2O8U1LV/M4puf2/t6ANqgLxgsn+vHqNLdt50ME
	4Zyxy+cBoxRqA/4Hg+OhvDb3SodLj7Qu4it9xwLf7a57ECEZZIb178l27wB+P8ZgH9lOSdo6lkJ
	xrTPB79xia1yheG07WlTZQIN0Pjri2GIS7JRLJmcE7pelbFVRI6ozNQMzP6cFoe6IOdE077nm/e
	c15hFTOexeVeJBRo=
X-Google-Smtp-Source: AGHT+IF1aOctmbWm54Tz9TzOo9LheJ0g+HtTHoUDuTShXnMfH1+OQDhTbVjjMEL+NvcX3+PUPhfyHA==
X-Received: by 2002:a05:6000:24c3:b0:3b6:d95:a3a4 with SMTP id ffacd0b85a97d-3b910fd0076mr2224430f8f.4.1754987248840;
        Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:11 +0200
Subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6831;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=O5vQZ4MKE8bL3a5x2rEAk2QUL7J9Hk6iGEI+vVX0jVg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZe3Gk6A7K6BuZ6C7ogxwBSW/5+axg5EzCc
 cPcQp7eSOWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cr5pEADQKhyLMmGAMuIfT6I9nesZoE3YTWBvYFEsHrpHOXW7IcwofY+k/j4lTrHXWiFSH2aSHiH
 h09HksFuzIbVBj3KRssbgyxg1qec25nBDbuq+SG327Y8lzA/ElXT7l06ZMgLIhC6WbM+MwKsbmZ
 fK1xMMKfxJ/FbO2+CMtw2ZK1JEcpsOWRLy48UNMqhQvWhg47T3lFxxjxqJQK75Ga5zNGJif47oG
 SL4wNsfpGlfU1Ol5kRE1A6Bzp8ET/WvJ0S4SHCf9XLEdnkRFfckWCxKnsm3J7OlXIzUQl8D5ahM
 YhgYiQcXC3QYeQ26JOOa4soGndCYmSj48a5PTH+zGR7YM25kOINjlq/okZ0YsGLdZnNDudPbi4d
 ZxpU62lK0QknRASPsHd0k34j6edoSRowVsIJ/81b2ZyduahX2oGqZVO5b4nmaXxWQb14txOwfYf
 LB1eEbstCLY3GEBhgjPb0rvctBDxQxC1W/EPi2AVS0tNMSEte35/6dBiOunvTpLifOS7kV6UJ2C
 0SSFrUGBZGIudW/RB4Giyakl25Mz771OvscKs1Z6m7ebofkxHrHIoQRkKGeEVhs3DrKbP3VQcdk
 +XtwiXOJbfTT8I/2s/LLdvqGESE5IYGwSFp01drsYWOUm79oxdipIdgQjqexu/b1xGghJkJhzXt
 0MEwMGHjLVNQrqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092730_901788_40369C8E 
X-CRM114-Status: GOOD (  24.79  )
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
index 6f5e3ede972bbfa78e279790df359632e2d63485..1f99547deebe085e907a6fc5d66b01deb55cb41c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,18 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
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
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +121,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +133,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
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
@@ -861,6 +873,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88E0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2WJcuXshs43B8tgQ0eqFMBEBoYTyTVQjjLj/OzbqHU=; b=RMNgHvJQFK79/XFLTWG7exijUs
	jCPCaODtwxrPZkhEsyAesBw+jmDxjV3459rGF0dvAjVNf2GqKj7+M/QzJSOSt4JjD9aM4EvHSCvgA
	b8gy/qkxZw3AF+jef2WKeV7raM9dq9apl//qs69pbOCwiUFbjGhvlVH937WUoOkyu6I452d7EYqRY
	PoiZvaovNtOVdURAokRXHHFokR/fVuGnLG4Z78Uc/OazYrRCPSly2ho3KA0meBXMZkPbTBqfd/yvg
	kWXb21ns9Z1xSYSixNQvwlZDE2JKRjSMcWW9yOGnqgeubVwSkys4CKVjVSk0ZUAvbboRASC/6LHlp
	F4BfP40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtmm-00000002UCn-189i;
	Fri, 15 Aug 2025 12:43:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRN-0000000202D-3ga7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so7792535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248976; x=1755853776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2WJcuXshs43B8tgQ0eqFMBEBoYTyTVQjjLj/OzbqHU=;
        b=wqKtIHqeDizSFJoz5tzHDIL8HQJV6OcnOs5JW03Mw09+4txgwfYVCuWXoucl2ImbII
         bF9NGoku9c0bw2SXBufyhGDU8BLPCvMf1WXfg7RU9a1GdDJG1rpJa6fOcXXqov5NDeak
         yWQ/qJiiOw6OLffBcP+D2oF01oD1Lsll5gm/4grIbCzGYSfQZUO6BiJ8KslBGdMUSQLk
         X+QC9509UKXEeLXVmRXbALIRR8orkyWnnboxEJtfxnj42kYdmZviw9BpbFKR1Q7rlK7G
         GZuDsQOy4lELzCAMiYkomoPFbK4TA2JX1pZenL9OolxcZeINIF1EPY2twNkLicKE8D3i
         u5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248976; x=1755853776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2WJcuXshs43B8tgQ0eqFMBEBoYTyTVQjjLj/OzbqHU=;
        b=dKU2MK6op1KiSuTuUrSnCb7L0wqQDx+yaEB/PbrsctcD9QmosC0j6de+iWIgdCNnJp
         og7mWwT+pDWgMo29OCJpQP2jq6DKbyz/UIZhsuB7zW9cyRdOgi/FPJeujkM0r06JsW+j
         /O75jjGdyOLmn9BZloQpY0Z2NM0ZAp+uTEYt4r84XIGs3pHR61T0iwwASqWEPgIu0CNn
         jp1ren1PmgLdG/6kx4seTLP8sq+xiSXXle74X/QQKIFPcbwtNFCUzynh+fo9MVLDeKLU
         I7UAAizJq3pLCkGq4v1z8eCzPrPoS5OrVIWfClvKav/iPxzOulOVYU4TovL7ueHIjUYA
         wzUg==
X-Forwarded-Encrypted: i=1; AJvYcCX2hw/Svl3HRtTDv/pqN8mZkRc1ReRau+ssrmvQk8U23nnqqRk3jSI/N9tncwoxdrjWCg5A7/EZoiYkwifgdXpI@lists.infradead.org
X-Gm-Message-State: AOJu0YwTISc7D/JeVXEU0wQ4Jgwhor0KjzQ7QMQ1aKfSowoodO/WU/Cz
	7g87X/9nOhYYVClYwV93TokID01/ZkauUe1LLVOzg9z8wJYSc6IJ7Z4K62ipdfzuoBA=
X-Gm-Gg: ASbGncsliuLZM1nQW8wGn4p/oBW+ljw8XI1DrYaHKAtlN2NLyHdfUNDTLb0oIoCVLXl
	0l+0YMuhpo2EbGtFgXUyAYOKw0LP+0LSlufLEHz479HDoEmieuz0v1iN23MlNIq1LyeZVJ6IThY
	67UYGEfQsQMjX8XjSgTqTBh5saZES+aSJl+FByo5FYYxrNftW0nQIAb6SK7aCmnT0y/MIj8XBZU
	++ucaCNIh3P8ZEAvLDBDIs2ZLgICUrN+X7UmxE+Mzk+u8tepWkkeazOP8/AfRigmpNIY/OMhiDz
	pLH8NRvpaDwgLUDtaZn+onku92UzhHw/ZkzNKr1qzsJx0ecJ0mmqdyhMyvXRJ6mp79svL0p9gVH
	mFCtaWA79zEz6g0+TLyFnWI5VyUJo
X-Google-Smtp-Source: AGHT+IGtFuboeVNKDciYaG+Wue0vo4F6BgRJxWOmOLF1DSz5Cu3XHJ3qRVrOSZqH3ZFOO5JCnPO6Rw==
X-Received: by 2002:a05:600c:b90:b0:459:eeaf:d6c7 with SMTP id 5b1f17b1804b1-45a218578fbmr11412825e9.26.1755248976374;
        Fri, 15 Aug 2025 02:09:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:14 +0200
Subject: [PATCH v5 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-12-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WMZHoUXGJzQjV7RXxreXxMNKpdMVHjmxzsHXmgnkdQ4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5bgkY5AXm9FPgfoovthCOalkecv+3yu+Ic
 3T3XjvXPjqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 coJOD/4tMSbksBGkrhvSda2Cd3mhG3iDPTFzcr/DoZYk3If/6C4nByO6VnEq/0I0YP9wPf9KHgq
 Bwy5IGngCFqV4uov0W3dhUrQQuX7lBXzklakhg4DkwhyrQMiOPTf5wkfU8hHdYD9DgIoN7bpWg6
 ZN5X6ZOCsfRhMpnJaecsr/eHvdG6DfTknJ6uMp9uH7/zQ8dcIZarHD3m9ACV9y0tq+Q+hr9xkWs
 1AkVphL5gdR/HstzkuztJDlEnK74CtoCYvnxhPvb5XuLQaf3gtdiTCdAFWjKe4SLJVus/1fXdw6
 B0ODk7/3X+Zfvv/fAe2aRZl7a+glcMhswDoHmtaeJMQiKzO06Xwv0AzfEcx4mJO52khpixxxauS
 XKNNrjuHOeZyifJi9z6kmjbHp3zIEGXILQRqhhRK9T3JaCydQN3L6wIIwVbm16oo53i/w05bSBT
 iOLB6+laIvJGNGQeXDyL5me90VUhmVAKflPgknGK5ZQvlaVsojfdrW6QFT9M1Pk/+yQmZXH2xMD
 8LC/7eFAOzLR77etZjxow/DW6YGXP+u7RiF7Oqe+FonXjipug6doGLhu2t2pQkG4EKr8QjX5CPo
 /vbX8C0DRcZ1v+bRLvxw1aUfyPyto0eROYdnui3xAqZt7ky8XvlnT1WEOMVMOVIhvvZL2QZCKuA
 1gbeKaA6NUwwdvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020937_949590_4BBC4264 
X-CRM114-Status: GOOD (  24.24  )
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
 drivers/pinctrl/pinmux.c        | 39 +++++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6f5e3ede972bbfa78e279790df359632e2d63485..730108467bcc226622185b53a1590c683ff19afc 100644
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
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
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
@@ -861,6 +875,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
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



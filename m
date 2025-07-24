Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DC7C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5jy7FMB17gdI668HN3JzGKzFglxpgJCNGVffipaOyw=; b=3dKCRELNiTV0tRR7uqXO84SXE0
	jLh81xJ8/R6vyfOhFN1CfltEqa4L1dMOexKdmZ+cW2xc7Uoj5S8FLkewwgUjCQO0Bxr4FQLHstF8D
	Xlbwh0syfbDHeb+1TVKIX/gEuBcxM9EX+Du/uNXJG5bIu+9+U9ddyqtrAER27fEoFAu3sZVdonfvT
	UeBfIssMoulOPYU0Y7IwK1tdMjgJW5obQQNOL3J8xRA878X86ZZ4PEqUf9Kxr4EDB1BL/uCiNJkE9
	nc6iZM98p/94/WnmwFy5VrNTHsP9f+amhABLuiu8+tQFYPKbP0/kESXahw6Ch8VRmvcbkdZoTkjWH
	HnAvP3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetH2-00000007DUq-2IYI;
	Thu, 24 Jul 2025 10:34:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesC7-000000071np-1i7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a510432236so552361f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349094; x=1753953894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5jy7FMB17gdI668HN3JzGKzFglxpgJCNGVffipaOyw=;
        b=eb4GPcynwIYK7a7xZr6t2ZnpcK2wCVlkD1knSGTz8w+bxZdJUIHxXrUPqHA/6wRXli
         DI5X9FB12fSj1PuTNupy5Z4pZ8mWYj8pndVcB29LFC7P3OyANWja9bGcOVrNnQF85bGR
         Z8pgnUNN0No6AoyXqbAr/IVvBhlHvoLHMT3u2lNMuCkrbQkZzD6YolPRCCzbwcJrKNp1
         W5+ln+mk6t8XCNRt0viONmca0bxb6sRWbvH5NPb8mO45dn4Rh3iHo7nCYGj9JaTAeK1v
         wvW8EThfmLzA942noHMX1gtfTz8ULErYwYLBJkeGNgcH1khkmvzlnAxmnIUcqrRWflf2
         ZZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349094; x=1753953894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5jy7FMB17gdI668HN3JzGKzFglxpgJCNGVffipaOyw=;
        b=cOc3ljiydhkMpdYi9XifjpDRvb/3dUIrROoKDYtYQd8YBbvrtfpmIaax721cXtj/HH
         j1nXfrB04cExbIfwQmjbUuu1w0qj1c65oM6JxpS7WMY+Q2ToKqFTqyporXmPNPPTivkp
         5t/ayTul5qHa+8SnxNntj0GkI/WbKA7DoJBOVfUral4V/9BL21ndup0foYCmjvZpltfL
         JZ8ouVmKWhcAhZ9LOSw5enWtb91bBUVeAx3/Uv8iBIDjHhhAqT0sqnFVwI+zIg0jKaH7
         RD2z1OH0iMkYPLXU68ap+T5zaINlyQevzp/sUoEKYqVrVXYHjHCM+GroxPTFWH9z5Ued
         KwNw==
X-Forwarded-Encrypted: i=1; AJvYcCWLN243LZX+2Vp3IZjNx0Am4ywhi0rMG/UmOPtVOkAX6lvwnEvqKzXtpNRqOqhXIEVl6IB9BheCAOBKqFB6Kbor@lists.infradead.org
X-Gm-Message-State: AOJu0YwRdL4zLeqezm/FM10BiOuwGZmDqSm06nSZtbjfNMrVJQMnJiFO
	nUB2hHG9SR2N5zvMZoEkfArJdeaeq0FAu2bZaehPfs9zn3cHjoNpXbYLMx6XmQXA1+8=
X-Gm-Gg: ASbGncvbhDdyGZMFM+awDWHpjBEvatlhqo6Zo9VTNn8C4b9IxCNtRxYBRS5oVc+PQA8
	3+UJKVNQ6h38v1i12x+NoiJTGobty+aKOCD7sL5FlNBZOrIK8+b3RY0hknndWD3caUp4bnCYRCG
	f+f7mQwDaCWKe+1mDVsvmXrzn+vfnMjSsBjRVBUT5QGLLOMgssPkP5eOh4yXnNd1s1ExB2HYG3h
	y7IDXHdeQxCFJ8GoQiGUIBDXku8i1xNZXTmz8bL0VNZOuRjVco3Isv+p5w+EblBLhBhqp/jaI9R
	f9EuV/x1Kl2hga9T3UpvDp9zO/D3TJwTWNbzNnS31K6g3Zg6uWInIFrSR8nrbNmNCQcq3FlcSyQ
	EbW+0vC175paClOUl
X-Google-Smtp-Source: AGHT+IGhJyfvevuUxn7Mrz2g9JStwnKUJxidvVF1fFEfB5OFiSESNaULbrUyB//k2IPHfmXTYRwMsA==
X-Received: by 2002:a05:6000:381:b0:3b6:1174:a963 with SMTP id ffacd0b85a97d-3b768ef9875mr4641790f8f.25.1753349093605;
        Thu, 24 Jul 2025 02:24:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:37 +0200
Subject: [PATCH v3 09/15] pinctrl: constify pinmux_generic_get_function()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9514;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yj2Q1L9K6NJejTGGHJrC2G9OmfqlDfNvhlOKP1yyE00=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvTsC7nn58PRvz4VUiW5tswdqoIPkDAp4Ori
 PIKeY75H1yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70wAKCRARpy6gFHHX
 cqvhEACyUjForSjjcAir5Ga8pMJHaD+7dEFbCseHcndvNXKJFmjmLJwjrLZbY/IiZ9SkwNi2QVY
 QX1DT2gKNoREOw+v+55IGlaX/uDRHLCGFXzMGwRicTnLxyvBLSqzhxBplo6jVwizCMDnlH1joUp
 vVd3eVgKQoscn+KB6xsPUFD+cT/+ZEqYXHUZvKEtG8jZgSdrSMT91l9n1JoxHX9w93AZnjAyj4U
 c3JgSbb1P/+L4h50rrig3zmLFMuvDgXWbwN8bgua/tT1Fojdbhv6DLRMs+2+Xsh5uDaWsf54ckX
 BXuKlGwYB1Mm1Y+PJfbS8IZ3MvHm0MQ+ciVXy48c5hwFeVbSm5f5VZ3KHyRlpRpiRd0S5A1AH7I
 eTYhQ0NsV3VvSjcSCM7iTzQdtd8Kv2/hfk/S8iIgFo2s5Q76fQGl6/nQQL9u5fQwsCXb4zui3JB
 XeigQaDtbVia+4rGkM41xjg3IB7o0XF46XGvhiFfHKh68AOqUKz+PdJmcuFzVkBZ9Hrxtiu+rg2
 xjPZfIE0UOG4vBZ6JHVeqJbZuW2ENd6YQXrhzFrS4MD8dX6er0MvpO48YClyfwZAgIwTkZNtF9J
 HFNlX6eeYWQk7oA3J1TDHuQFde6bAAA3TiO+T1CatSI1aXHtcXalFkIO79zwR99pbtJHjXUhiag
 ThmPSwGCDv5hptw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022455_447721_5447434C 
X-CRM114-Status: GOOD (  14.94  )
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

With all users of struct function_desc limited to only accessing it using
the dedicated function and never modifying it, we can now constify the
return value of pinmux_generic_get_function() treewide.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/pinctrl-ingenic.c         | 2 +-
 drivers/pinctrl/pinctrl-keembay.c         | 2 +-
 drivers/pinctrl/pinctrl-single.c          | 4 ++--
 drivers/pinctrl/pinmux.c                  | 4 ++--
 drivers/pinctrl/pinmux.h                  | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index d5d42c9ad5fe9dcf7c25ad393688e714b02db678..9ed84479a5b43871861f46fe1326f1dfadc7f63c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -245,7 +245,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	struct imx_pin *pin;
 	unsigned int npins;
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index aa71e02b661c992c117418af910ae157c4f75fff..9a95577439a1b50607427756a713c8122c7c4af1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2446,7 +2446,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct airoha_pinctrl_func *func;
-	struct function_desc *desc;
+	const struct function_desc *desc;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 68710dab2aa3ff649bb0cf579122ecaa0c257fdf..ec0005246c19a156079807acddc93bcb767d1222 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -43,7 +43,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int selector, unsigned int group)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i, err;
 
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..18f0da58c96d4f0fad6535fd88e69fc8acf96a94 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -319,7 +319,7 @@ static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			       unsigned int selector, unsigned int group)
 {
 	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int *pinmux;
 	int i;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 0ee8554c5446c4167c9b0e6b9397a2507ca57419..f89f8ec06ac63227930a38dbc80f00333cc15b48 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4000,7 +4000,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		unsigned int selector, unsigned int group)
 {
 	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int i;
 	uintptr_t mode;
diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 060d64ff3d9f01ecd3374935af66b55c38f60d67..87d081226f45467d9c92cc9e8ea63d41fd2f0fcb 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -935,7 +935,7 @@ static int keembay_set_mux(struct pinctrl_dev *pctldev, unsigned int fun_sel,
 			   unsigned int grp_sel)
 {
 	struct keembay_pinctrl *kpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int val;
 	u8 pin_mode;
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cda6201b60f53e62f3f50b8641ec894106111e0..c9adf5fcb1c76445d4812de449edf09878771a46 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -336,7 +336,7 @@ static int pcs_get_function(struct pinctrl_dev *pctldev, unsigned pin,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pin_desc *pdesc = pin_desc_get(pctldev, pin);
 	const struct pinctrl_setting_mux *setting;
-	struct function_desc *function;
+	const struct function_desc *function;
 	unsigned fselector;
 
 	/* If pin is not described in DTS & enabled, mux_setting is NULL. */
@@ -360,7 +360,7 @@ static int pcs_set_mux(struct pinctrl_dev *pctldev, unsigned fselector,
 	unsigned group)
 {
 	struct pcs_device *pcs;
-	struct function_desc *function;
+	const struct function_desc *function;
 	struct pcs_function *func;
 	int i;
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 79814758a084570adea0ea1a3151d186f65d1d1f..62bd4aa53b2b22cb09eacfb05398205f2fe391b9 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -847,8 +847,8 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_groups);
  * @pctldev: pin controller device
  * @selector: function number
  */
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector)
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 {
 	struct function_desc *function;
 
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index bdb5be1a636ead9695410824b5557937c5baa89a..549ab10f7afbda32fadf4ad151401180bed2064f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -152,8 +152,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       const char * const **groups,
 				       unsigned int * const ngroups);
 
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector);
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector);
 
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 3d8492c917104afbf15c8f697ba4afabafa3a5cf..26826c8b5441b1a056900fdfc1d68c0c5cd3e6ba 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1120,7 +1120,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 {
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct rza1_mux_conf *mux_confs;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 7a0b268d3eb91a42911f372e66805291344f8750..7e9eff522204413c83779932cd702edc02ec2686 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -442,7 +442,7 @@ static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 			unsigned int group)
 {
 	struct rza2_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *grp;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a10ae0bf5bdd97c10ff4fe4b890a70744a97578..76d4ce78d0dece3bb95779d60f235ce85df25403 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -549,7 +549,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index a17b68b4c466e2ca91cb26a713a088e309d5e167..a60cdf8f3eef6e3f14e3fe19e7d57515d6b455fa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -162,7 +162,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector)
 {
 	struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;

-- 
2.48.1



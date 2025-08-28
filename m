Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9101CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4V6wSNUy+49WdVnDeUhgFQb5Ab581+KZPYX/SdZG0hY=; b=4CzDxjcLgdyCozxNrWo6JmkfQp
	YGjqu9xep29Ged94cWIdJH0Jl9bHyQ7p/+d1/uWR+Wt50TqDvF5uylYqyzVnB8tTe01ntEVIJz6LL
	Q7YpwHrs8EVkq4cOHjOecnSYo5LFG9NHznxHHsPe8LCyVwGJhQhThZcp4ZetgBWhhBiL+1N23S+yF
	x1kS2tZcafSVaGh2MsCwbJrqZgQInsI5qsllBofNqUpyq6sVgvlAiWJ5C9ofnas8f7esb5RjTLcTY
	5OkKZuI15vVHqW6pdD9G51ksG1jKQL9XOnwXddm9K8/YHaeNJiad7x6bXyY7Hdu/hDf7bR8z56SFs
	+6NAgCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkm0-00000003S4b-21yW;
	Thu, 28 Aug 2025 22:07:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3F-00000002BOu-1Kgz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so7052075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396836; x=1757001636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4V6wSNUy+49WdVnDeUhgFQb5Ab581+KZPYX/SdZG0hY=;
        b=HqbRDvAlN/JHfizrWGVcoPm2VtaQZ4rGC5Hj7wKdjZhXb6ULoIE0jsv6rQPw7E7ikk
         bsYAjrVk5KY0RciZOn2xND/RfRiOc5ImL9nG5PnUaECtrTWnooqqPt4UGPNudrW4Wjr8
         O/xDGd+7kpNSzYlwsaotzf2Cty6i6Ti8D0uG6zUmg4nxQZCu8x6dNAZjmCplp+MO6NRG
         m825PJZiHG+ejU0YBft27Aaq9Py659XWmz2pdhJ7eb9GdZn+hdgH7QrgM+BL4fOGg4LJ
         uyQCUrtxTZXkyvFCeLepW8FZ6HMMcIPZg6oromS8mBf96gCd1tw3+oC1SNdiX7Hk52TM
         gcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396836; x=1757001636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V6wSNUy+49WdVnDeUhgFQb5Ab581+KZPYX/SdZG0hY=;
        b=olzTr+Xhk9N/XfXXWQ+3evVexYndY4ztU5XIRuGrgbuiCdO/5uMKrSJiHdTsV9W6o3
         2Yxjoit8SMiPSS0g3En5ytSiCThRi8UckUpV2Et9GRphq6dFOp1Wc1wmqMQVnJHnYRIi
         uo7iKwgMSKxvwFMoNeuoOm5ewcG95AQGJvAKtjyKwQZV5WRBa0tfa1Gye6YgNQqUfM+y
         yqhBL80mNedIo/OMPR9DeUn4SOLyEbGrVhqTXaZrZi/h4exvm/cQBLUPl3LIDxE5f8HZ
         hKEXBIiiRlk0T6lYca3wKmlspHdhstlZctr/wSSwK9i3RVRR3lK4JtwFqXVKkPFOBluy
         AEOw==
X-Forwarded-Encrypted: i=1; AJvYcCXe3T6362TrV/8G5/06iJ55IV3pzXXHA341YpCLRDcsYmI/Kb5McgqkxCaeWJG1fznWK5p/Kjh0fkaDYIz42Sm4@lists.infradead.org
X-Gm-Message-State: AOJu0YxJtGY06GPjZ2vOk209gNfTO0Mg/Kfz7setW4apAS29zGfxLlE9
	SRbWtBT3tMYE44Tx80rnnZLHQcWWWsAuSYa/3S9mEAeOUacdaASxW1SO/jGPF5pPlJg=
X-Gm-Gg: ASbGnctIn2jpCGORuLfn09kSoKqmJsPIBJKc2QTwCR5dOvLqyytZ8GzoPHetYXtkZiX
	mu0zb3y72ve5FLj4uvDcRD0RjczWH3h4niFs95nimZBFcUv1VMonsl2UbtHy0Or7vrG+yvjzdDr
	nyDvscYw2yNfulfAyBDzRxqUQ93f5kI7RDeK02Yg5oOmtBOLihJ6MMzNRz8w76UyfijVYo09l36
	ipXL9GfPE2MgU4x52GG/BWNc7pv4rk7IEg6EzLsXMK81NI0w72pisk3iR2LGpoKcG4DTjYyb9dh
	b23WSybh+4oN0/fzs5FoXje7nywNs4FlhjG20cVXJxC2hHZW9b1rOlvYX3Y1SXWTJjHtNlUcUdX
	gcHrZGOUeL+mih/Cf9NM0Xd4eC3A4
X-Google-Smtp-Source: AGHT+IHZut1Ju+wLWOCu27g3oxlfbHJTRITLE2zpN7kI0OEVcWhxgfQH7OJfj9RiKp9cCo2WNd5OvQ==
X-Received: by 2002:a05:600c:4451:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45b517cba3bmr203142095e9.35.1756396835751;
        Thu, 28 Aug 2025 09:00:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:18 +0200
Subject: [PATCH v6 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-10-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=igWDVQ1i3GNsSU9QCM7MdJ/ZXZhmiW6JQ7gs50oMzMA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OShRzzi/YdGvFptLEfy7s0tzHayMhd9IJr
 CgF9D6e71aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 cmVED/9Q9pYZVO4h155fVXACsckZla46oeZ3SlqT+JLQkCr+sa3X74JqYGKATTim7Rw/256QGDE
 UsdtaqVKnvRWtNWRyAJOeDAiiQPlbb41DBHtaTf0thIPguu1czlk5YkMZsmyVrIfJoNl8sNKGum
 ptdDmj/ALJIL4u0sfh+jBCnArShidwSMfTM/CPNJVYDWNaIA0Dlbs6HCiBiFRH5KnR3JEDkPJji
 AwABByFBhrCDmOzAtgqm6bEM6pv+huWJR4v6dtuJCu+mALZYiXGzSBy2evcJooioUE1gjc469ab
 pj6GkhP1syujJ9WallzCnoFeasP30aEFKqpZLTv9saXaiecZ/IZd2DAzONow948O8he4tnFdBvx
 ze/phxq3+CZC9IusFa/Cj3dY/GwwVIa8UCraq5poM+av8PzrrdG/Tib4Akj8LEmYo07FtAzbi93
 uCxAfgccQ3wGTH6uedp1QjlKh/01q2kDQ6OrMt5aUKhEnSZKHfXjPJpm+ugFW3JA6HuRGt1QEVn
 o6s7TXD23ucx79L5J9DaEA+RhegqRSr242wmdbQPPZLxiMDbbur2keLH9zjrKxt/hS9k+6x888d
 9nCqr6XPvnaEOssyKEX+Fk5PXIjFLtWcYfD8hEPiozd2D25jPIdZh/mybWD9lAuNZtITpXYeZ5S
 DdHAOotTsdOPNzg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090037_434940_865DF946 
X-CRM114-Status: GOOD (  19.95  )
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

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 56bfbf4c3575355bdda59cf7471bbf5b9babff4a..ad3bb8475c0c29e15dfc7a8e4afdeadf5ec8aaed 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 2eed83f9f209cad79580082c274d4056231bd421..8fb3b65a1b775cf078d3c926af59480e9e09ab30 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2456,7 +2456,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..6f5e3ede972bbfa78e279790df359632e2d63485 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1



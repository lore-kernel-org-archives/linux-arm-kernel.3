Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F862C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=; b=a/tT8Cr/jykOVFg4qeMi2P51bV
	HpLakM5WdA1mCVD0N/5z8bMJL3mQJFfvJeB63341nJZQ0n3NMSEXmLoObRXGdcGltUF2tCs34b6uC
	MYSVLRvded9MGy+uqYOO0hVWF/ECTZLgZR1m30Ddf3Sl/Duuhn9Z+1dw13L+aruQLfFSIYO4I1Bse
	+HDAOQp7Dre604YyjF7Sf/nGv5/6wOwRDGHw0i8/YweUUB/8oMP3aY+givfMR13pCMPLLy68pAWSC
	s5mHdxjcjg/gUTjLXmzL3K6cN8zwJn/MaI9VEMsp+tpKlX+DTNCzwC95tZPXMTtzzuQLcUX1HRlWU
	BR2AjCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet9m-00000007CUF-3BJt;
	Thu, 24 Jul 2025 10:26:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesC2-000000071kr-0tRc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso474225f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349089; x=1753953889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=HMjzE8XrwzFLfYCO9nejZRf3kUjvzCrmYXUgdqACIDxJi8VygNC6oKb0QgcSv/Nlxl
         r5Qx4pHKT2KpuT7F4xHBfI8Pi9DfTXW/wS7SzRrUk/xcS1VZv7NWD5x5I9IY4raWq8ej
         4tGcybqgaR1SjbXj1x/Qijp586xpeN37fiu1+FCW0cAIkTNF9sk1HXsg1A+xkJU8xCBF
         h2UIjyouTgfWM6KgYc9Hw2w7n0MJJAP4+HJrLoopIP1f+SXycDn5SUBiy7ysjv4JNStx
         AD0cDp9ocZxsH3G4CR/N2lp2dY1ZT09WlxukHAMgJdliYEfPbR5r4ADBs/n09xtS6fXE
         eZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349089; x=1753953889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=UWswCnLYoU8kp5s9F6zR3Okk0+ZZlixr6unYWo/xre6Ltg9eAeje6Px7BM9msyW9os
         JQjAkZkdXdDef75EGA8cg23/m8VciGCPxjyrA089fS1gqINApHARs3maC7ieSoH2vYom
         rY3PSrbRZhjfn6xlUN0BObyxAvcQ6s5d9Qm9DkdNIR9ni8HS2Q78aiMr/IRhS3K/l8kf
         1kBJsxG1uhitAAdWO7OMkavqsEQ1J1BDHx1UZNE1fwgSNAFz8tJcxQQs9un+cbRGJ4Kk
         5+degrt/2T8vvIllB0k1QP/fni8sLV2AIVO4aGtvlM+2s6NaFQHju5nFFs18jtBDGfJl
         663Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW0PM0wYSq1DToWeOpjxeHpvn0e08PmIkdCccbLVVdm0R1IcsVNNUH7DlotG0ZsOOw/RNricToZHtGlPpPraSK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/OjSzVv6Yp8DZ90Hrl7OIbQ7tVW4DG406gh3kzmm+mGnQN1vV
	zGU8HXivaxYCW84lQ9DMU8ngwr5fq4H7/p3C0yZ+AfOznnZMuBWZWY0Lf/Wl08ZQoGQ=
X-Gm-Gg: ASbGnctOEFMOVnmTipJb9BE4KgjF6lb8FowzZRvsGvt/synhp//FwsbHR5SLbyrSPki
	SLcQ4oluickAKLerZaDsgzRmhivFhVwD/JIONiQ9ssKxMtVJW+em3p/z0UJD+Li1h3Vuw0pe9ca
	chr/DeC0WeY38FWHl3ZO1+TrCkWrmIIX8GU5yoUcqQB1HGLcz6tjO1pvUTCZFkiIcIZIEfW6Ftp
	EMmNgXi9AWoAnEALCNXjaMOskivKXiFdKjABE86L8BxVfkQzUzg/MU5DugGYvTnBgDVYiIZpgGQ
	Vs31TY0hkqHPLRqUD3btroMxkK3EBZdEhWpcHIrVgqmJj7TAeXSbAfAMe1tKUtc37bJPpofE5qH
	TqHqmUcqSTK1tutR/
X-Google-Smtp-Source: AGHT+IGnhvfYcdLRXAtdaLRr5gD7VJr0sJOuUbMg0+qJlR1rhLS/+bKPH6E6yrPyHszr9XJ/HYT2Sw==
X-Received: by 2002:a05:6000:4305:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b768f1647dmr5410021f8f.52.1753349088691;
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:34 +0200
Subject: [PATCH v3 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-6-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSXtvqkFaYJUjTRAJPRVMAk5wNil2YXVMOw
 MxVCTuRo8OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 cshfD/9SbpCGJDJ/Jk0sGpayxa0FhLlGvR6oERWTvgMhtUeHxUCFxBx6YMGv+BXEHcewihGh1jq
 BgX/VsRjvw6EKMEblPXX7xIezXGlJ1it6QRIJhD67eBZiCBfyPtBPG9wS5We7w//N3dzb7oZt23
 53GJbPsWFtg7q1VUNLX3nRrR9lnlbsEnSqSKbkHNbMJIoV9rji1HhGAgBmaT0ORciNHfcNGGFOM
 KVacjCtlplbn6eJG8vSzpRvU0cb7YHFFsvIt3ywpH+IOMdo3ZSw/Wzmf7YD7iS1WQr7Rsp7zxf1
 Bn6qiN7lKO4IVxgFPuQhiiUXjAt9OCjbJYlb8MVwCbTkLMFXcVVBQYHi/53LnDO9HvjWzsIdJ2z
 YumdZy8EhIhf3NCj7jIrdAyFYnm3sQqVn1h8YAvAXS1T2OS3QRcnjueogYTfGXBNCMutApRK/BB
 8kVNdJGs1FH2+2s1u2ZHJSTAdXTyuEtC0ZtlsPTZK8qnU4tIzC+eHoHw/59LtMzbTqMOdhc7kP6
 2mFiCpXau57p6nMR9D58vlXLXZ7hPCvcyk+otcV+5SypG0Z1wj6aCWzj9cpO8AnBNWF5hDbXS7E
 ygjMSNH5srKmYTV5/cOFe/eEPNtS6qromALeW2LQN/kc2GWO2J3B/x2YuLPBSsaK85Rbu8N5Cl2
 64ZSUQ7l7oryaNQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022450_288191_004ACE3C 
X-CRM114-Status: GOOD (  18.95  )
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

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1



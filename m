Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09D2CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=; b=SlozR0nmPXBwjAB42YoyF1EUtp
	BAD8mTfk5zQuxCKX/6+ZC60ULbaqg2xjuiN4MAagSrM8Dc6r+/yAN3mKMM6y4FuYErVx97NmuD3Wg
	5K1ys1X1I7TbHXV9Yd2ZawoLkHgNJeo+G4GpqIUqmXfDaeTK3IKsNDliY+q/uxn24G7FMSSsMzjf8
	LTZ/5ooBv0DHN9tY7N8g+VQmm+Wf1UfAE3ENWtgjDBFCp4p3g1N0nAefgSTl/0cEKAnKpGMOCcj7k
	FT9qoVgG1H0KIwRABKRV68S+GV0XqcTeUkIDeyojuEH+vWr8lvvhqc4uaz45pl8/eICm7s5lxMF/w
	2KfEjzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSt4-00000000fGS-0Csh;
	Tue, 02 Sep 2025 15:25:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfp-0000000H4Xi-03tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso2728361f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814379; x=1757419179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=GojQ+Ve8TfddTM6yFQk7rPZbDtVOSyp3amMQE7uSfwY0AfaHACzDwKfF4lKZyiZOlI
         Dx2pfsICrdNyzLtOqd3BhZBaqXZB4TUujpYT4AbGy/Bn6zk70ajAC09/C/nbdVQR1ecD
         In4W/5Euj3h4nSLvkgC79N0f6tgSvL/ZhYDafvjW1xs335OS+lYtka9BtmaZPt7TtbJ7
         mTWee3sXY1l5F4obO9CPUiAg0JE78jxwkoovZ7xuZ+cHpoFgCeAJ/yjEzDh2W982Cd1Z
         PJb8kKv64I0mXEvQEp1smS9UsP0NqFuCv69tXYT1o5TVIvXTBAlb3w1PYlmiAnq+nvE+
         TWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814379; x=1757419179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=AC4ucs2rfSz2mhw1CWEN1a9wikEsQmp1Ofu6X++J0J67S6eFmWft4XW1LvnCDwRB8f
         XBQ1aCbLr+eeS644bFH8uitM87Yh83lfEPp7G8daR9AawqCB/V2qD5EWQhOph1Q8H/M3
         TyPy5COmUiFIwWBFxA3QSDdCe/JCdj8Twj/6BZmuCbqeIwZ4QydVXRMXDdGQEbO5hOCN
         Cjha2FA1tN6lIEyb4wxNf4QSyPzkn/2NA4iNGt3ayLY/TWtwz4xOicjovPnxksWr4wss
         Y0EyacHYw8aB2knNjDgfBJpftPRGr6nuAL6imKz3/oWV3dHFqkG/Hw28A7pfdkxE1XR7
         c9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUA1lSAqAdjtqqGiMAP58RB0aWtPPTHfGz/C3Vz94FNOTePfHt/Y3d/dFoWxU6yEJ9u1gYHYofSalO4kOvKCkop@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhuetOmPnZ9sYpFoQE8hrrNWiPRXCeTAVQbe0YM40zIJK4Olz
	2lPuXKBL4g8baZA+zSrSqU165FGwO1sELDRylSmiljZQ+ZGvWicNPELAvooX65zAEy0=
X-Gm-Gg: ASbGncvyMRG5BIZ+b6ixwdRxmYkMLocvUasSOIedtSLkLjBqBt03P0Suv3JQ9pVC10G
	JRvysAgXGERBsNsqgLogqJFrqhmg/nLtuwzxoWsklwsW2VAOzs6gS7UNZmXSnbQaTXnIZq7OS4+
	++5wiiJSpRGvD1Ia3qKT88JH1IE4C8aP38Ogp/duWmwwifwoJPu58CXZErdNG4qDqJOsXv1Vd5z
	OZnneabOcwy4prBe4Si1knSbVqVk/vAeU+owh7X7S1ajgN/ZYYeEUF5g8E3jQkMjnyZfokEQCHy
	Z/x9wX46CzH2Yhw/GWPnZQGixH54LS9X216wtn6E65fgeO4RB5a9RFu5Xhf5MXV2La73VHmtIT4
	bQ4aukM+QrKMW0Yk/ycdTETCaY8E=
X-Google-Smtp-Source: AGHT+IFbemdBZVr4cSqFDknoZOXx6G9gv7/Y0ZwIrtmRmycK6XluzE7F7aIjOJthCpOln2BXwIsUdA==
X-Received: by 2002:a5d:5c84:0:b0:3d1:6d7a:ab19 with SMTP id ffacd0b85a97d-3d1de2c6bc9mr8102151f8f.20.1756814379349;
        Tue, 02 Sep 2025 04:59:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:21 +0200
Subject: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=32Zcb9hfB+ZeJyoy3uwQecPB9Xyi4ZVd3B+L7ZvFZiY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUCgQZBmoTxlTrj8gjD6XedHkrbIupwH0/A
 aWSRMyfc9OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 ciHxEACSn9uq6GCoE4OW0AyeoZN7IZ7Lwnvcc5CVALJn3LNwLkXQJla95ogJxXNn6INZUSqnzyZ
 sAv2J4r1nBu6cWS1jCNcbRwgOsUxCD7DOij9DTVk8vVeuUiyb3/nBCtlDSiKX+I+EJ6UBXABrJP
 2ulvPkXnmvHPxoFGDEuoV7ZOvRno5o2gmZUIT0hafWB6etSbvtGLzxA4akcilCxSVle3PTU7OoZ
 rJ8ecXISPikzFtKVSa8iwGbopUmzdfdyaqHjdni8ExsDN8TyDcZLKAkiWHxe+Wn+ovT37ULrXwY
 URy0PXM8ZdNugKFa87z/9zRKbtpRbfznmQOJUMdHJRA/3Ws1XTiF3r7m1C3mAvhJJki+yp8n8ns
 eekmGbBOSMUH+0H6ap2CxYRgxlOFFIARsBHSIK1O4ci5efShHfePBz1yk0YTqE0lMMxwIMBS9OW
 2ww1g3NSRKBROCGTk2V6dGLcOIKnRJgSX6OYWcbmQaifc54U1l44/0nmUnQFfIW8yZepxvX5WZr
 TMbqscKrQY9wJyUsRY/9W7iq0Cs9ZRlfqGO/8OWJ8flLXdJXpeZsEkmsdB6GYbixZ1cdyNpfVd7
 6AZzJLar5yCrsfEiPgfaRWSe/izLz5B8B2bE7q4Js+qhiJKPopM8A0/rJP6mJC4aBWYqvqM/qXZ
 qANi8Fe+TNoz+zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045941_087570_7FD64ADC 
X-CRM114-Status: GOOD (  18.52  )
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

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig       |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..f7594de4b1e9b95458c2c817e1158026a8006f64 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -8,6 +8,7 @@ config PINCTRL_MSM
 	depends on OF
 	select QCOM_SCM
 	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8DFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=; b=NZ04nWMI/25SVsDpyO88DU6eFH
	ZZPR83/KBmKgF24m1NXV75gvQh7572qJRa56fPq6E6WhLIk15Dhu1OCEm+Q+HR4nI6PBOy6Sq5h3c
	kOXLyKLEVRNC1CtAw5ZO1sTcgDpejv+V6b7d4J+FY4OZDWAeCSnV2HzeDERzmbnmDQ/oMdAfT1cXF
	DYBKeC/lVE11vTCMYIcgJ9LcdLb+tiMpE7C8deONRzzw3m36Vrxu+UgfE8qAVExKjIQ6ZCKvFaRVw
	thXxuJOh44IMF1jR3KfVwiNW/8GCdIWZl1ZadJSYQ9QICJNhGjK8x8sGcteGaFkZsOI9nRdiGWKyI
	qrckXfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetLt-00000007E53-1rCR;
	Thu, 24 Jul 2025 10:39:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesCA-000000071pX-0e3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso453896f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349097; x=1753953897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=yqYy1MH5m8o6s1qiaiQySqR2RGve10JdsO1KsNWwBLZ6JJEl9bQuHn+ldgeKpsE/WQ
         V2MxYjjJyrnJA3LEJll0qAzo2WciJfvJy+o8kmWvxxU+eSg74kDIclmbz1Csc0xGgMrq
         C/C0bjOJrnerV0HkY3gULkQ2H9T4cDc5ZCtjqvLoI3qZDRZfY1xno+Z2sTbbzg1V1q01
         hw7/Td8yhp7omG00JOS4SNgFNSFoYFrxuTj638E8xpcux5VwQwYy63qEVecQ8rf58aU4
         4SKY34U6nk7zVGiEAJuHJZxdYmnE/zSHUXwdsK1QVqzTkzJXCmry+U7rok0htITbhXVo
         T8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349097; x=1753953897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=gkYpQKA+9nybrpnWH0QbL2DmoefXCy4qFZ+JDNpw+Ocz1k5xX4lXHN4vFJq2OP5mGO
         41uD+Eq0746M8hxege6XwtJVQqwDmnReNaPl7YKQ1WIOhhPQ50STls9vRrrjJjHImGW2
         67kMyutFo9qY9btg50ZLMhiGFYfMhIj3s9chC15nSQzwi0KM3Zvvya3a+hQPEIDsehdr
         wHsxBpzTTgrk6pm9pm2uzdOiERLLXxjmQutEyvWkDpqQZ9H/V15OxRurcp0cdbQNy7vb
         w+HvGMb8Fo471cXltRA9Y/Vs7JVTD4YlI334s/x/YRf5K6uZFDiQ+4z0pNPhoz3TkA7n
         1jTw==
X-Forwarded-Encrypted: i=1; AJvYcCVX5fW7A0axembRmiSYSOviCcWK6j64ta1ANRiX/O/rIeolYRArKrWxA4Zld9t864DxYfm1uJuHE21Z4jxaZG2H@lists.infradead.org
X-Gm-Message-State: AOJu0YyheuTBEvir0Ll6rgIcVPd+RJARmdjgcac0qrHRU99ol+uaerbB
	qBccyWvHO/qiKcSHkG6eGDuHblSD4+coO5yCsEQkkEahPS7zEmlPEE/8pQ6aigqRWBM=
X-Gm-Gg: ASbGnctPDhr91Sr5h2KR7BInkRw+IM6sBYp7eUoMvR1kgbLzpOVIxRMAkG1LMJ72MHD
	TTzTj3aWeKa4q1A9re4oE8ti3YZmGy10c6r3cr+ngFhdUzNMahpw9w05KlQX5XU3ZTWyyWURRBB
	0ZjNOSi0aXCzHTWbz7XnlG8nRgPcoZi0DQ/2+6iae2Z/SUlMjVYBAMTzFBCzPFTBNMSOW6XxrSm
	Pe9bp9gi4qNYbLX+TPF92uciWW3c1Gf3+MkjwdmXgPqc0Jk3dGWHEJBnxzviV5irI8vDmL7Cwm0
	zjCKA1GWCFglEnBgCnaMOcNCmupK8zO0tYzVY7/AhNZvTDekTkf8MnU8WPR82aeee4p/qOCrCiM
	BouoYQ1mdknlQ/7O2
X-Google-Smtp-Source: AGHT+IFjtwksIDz+7DSsBWeS97i1ZBqpIGTXCOjdZdeq4tlTrWHKVCP+IvRPyXYuhcRL3QY2eNIWHQ==
X-Received: by 2002:a05:6000:208a:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b768eb077emr5529569f8f.7.1753349096652;
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:39 +0200
Subject: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j23TQRNjGh0BJR8XFxZqqg+wPRm63XTzB00GHcaNVhk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvTk7yHYlcFQMyWoiWjPshDZZtgzQDFYrODV
 Z1WZPc/WEyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70wAKCRARpy6gFHHX
 chVRD/9eeVGld+ATTL9+JqtQxPOrIZwlqhXFRCYZlyZazFTQwwHsY0fRCWqUY8zJDUpWJ58dICF
 jGX8CnvpX/qLEAuVRoRHPDvawkmoIZ7VML54qi6pmuB0YMtGcgUNj2YkriHA+g6fdE7LK+D3e78
 QQofwNaGv1MFuYFQE+hOnDOirVK6VIc8XhYsyL07YDN1qnaEDHtLkBZHefcIJryYxC6wlNBcz1p
 Cd3S05INSHpxvJstk5w7pofJEtTs0jl8bbzR8F2pN4QRtW6JfIKpD1otUHL+T6Ny7Qg0vUXNtW/
 Ibk72PLoLyTo/yGUQS0qBtRGzIeVRaxeAlbL3TC+oIXA8n8knMwcZsLnfQ8WJiygL6jWKA/bLkd
 XXXexkgPtnZPj/2q+WJTsC2+aVYV6F9bXeUOGEZG1tPatCwGN5qcsd9Fpdx+lRDxEmecZasPxgO
 IyNyAkCsvk2nERY1KT1vAZeJ+dgl63R3L79Rte7IK4nvIFxQeIP1p1hbSc7vOUV8Y8MTZg9RNKW
 pWMHGEJJmNENd2gZl/1mIBxCkfmnlDE8ymlKk6Rd+DK+e6X0sWBgvjj4so9LtIKeO8CmRsTNYoo
 4keB8r+QC7KS0dwAvoSEOFiNm3p4pkvhVsR7Oy+hpgrltAAF7eE9GT1MfhLfdxNVC0w1dagDftW
 5csm15vDv1NWXdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022458_234367_2456D022 
X-CRM114-Status: GOOD (  16.54  )
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
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



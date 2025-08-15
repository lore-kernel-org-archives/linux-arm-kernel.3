Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF84CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=; b=PyJYRdGJELST+uVGbl/p9tqOz6
	ZZjdz44b7qYOx1L9mOJnByKG60nm3MZAHMjq07+tIj9S1QBH3FgerCE+WHekNKPGKd0VLIXNjPRus
	AscW7qYP9xO2hTV0VSSLvzt/tZNOUgVcaZxJLRYYwmlGWZ7FQLv6WEA+GqH8Mk6+QUDQaegAveSJ0
	c63TAPIR/Kpf/wH7l1HmkUbf5ECgqFNJbTpK5bKg4aOe20xkcQGmoBvmZJogtoukWDYeQmGmw7XkC
	PIHtvCUYWVZzxO5Qh+lr4COlBn/XsqaMe8svDv9hxbOCdcZweWMzrlq1wX96nUxZi8/NErVrkAZ4o
	zvbK3Psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtkD-00000002U19-0pLB;
	Fri, 15 Aug 2025 12:41:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRM-0000000200m-0O5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b9170db547so1205710f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248975; x=1755853775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=HDlt9ySZzplqAscFY1NSP7LB7pRmOQWWn0qODEGEwulnaJsfvNL/fIp1DqGogHJejA
         VsR9qceeHtW6mJGXPPpUPnt+rs+fMQSl16OcVKdkaJV3ITlA2KcjLVx2lCIpMeh9u0Ay
         Sg4Z/t6H2MpGlnFBBeyZw9Wq4KaRJChNVbXEaHydC79BmjS/ruyPtTWF9PXrdSolTihI
         ntK8uZ/pLirsxiCQKdeun6yb/0ZIcllBkq4zGmVwKmwdxH3TdaIxMjC4qvC245rN27B4
         //zcvLGGui8tTLQ5dSnkz4tb+WV7pyOnzTRhaQrXpOMdgfEVmV7wJIpttX4un7i4/Gie
         bhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248975; x=1755853775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=LPrdR6SYwyMP9KTsFy1kmBZAtAq2LulA7zYdOHxlvNwX0DB4+z6VgZ8Qi1Mz8VCLCT
         jxxuoMsiahzOHAHfAH+0eC7reG+74vzCHsaD2WMTEIQcNQXMkOWY91gwBE3HfFt603xo
         EqRfpZRJh5gPamH5Pykh876UxBjxwqgwGQuwSRQ0UdrzK+E8bAz7LHbD18MFdXfiOezi
         C5GFouEt/7IrRK2gBCaN+Xg6McH+L7bMtf7uDudvF/i5dYpNs1OAXk1+Ux/Out7RqPmo
         zXedJ3F6jd4nfN/PJoiQGXe2r8t9rcQfkesHQWlB6rAj4YHItg9l7q319hqJyk/gJMPD
         TDfg==
X-Forwarded-Encrypted: i=1; AJvYcCVyIv+UdKvr82zoXLr9ghzVVbA0GbQo7TbLxaRqpq6xR7jpU3LjAnaurnGlkk8/+cO0bNnwcSbeVgmyf8h70F3v@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFoLaJR583CZoDIsyC4WVezVJFqxGnzqTxaMWqRHT0SXYtsow
	RsHGUfiGqW57Djhkkrh8wXR0Zc+jnRyYIjG6VCFS8NMR55Jq+yBcS3go1/ySjZ5AbWc=
X-Gm-Gg: ASbGncugqGZxl5U1n5ReM3Xz5rAwXQkhbxbW5vM92uDC4Cl+V7bwxqTCCtK3FywcNVZ
	8dgO6v7K133GLyM0hW7DWnJ2cWa6hZOjscr33vVjdhYfZXtJ+dxYTbFdnob46fwSTde0uWpXRez
	4ZmO1tLu1eXoEHwE8ugabICzsLS1rj1wg6B52XyHO4/HzUDY5KS28WyuAMulLCW2HoA7Z4Fy13T
	GwGSy6i2CK3TfGkmO5KD5JWvBapXMWmPMyHW1mdZAcsaaPCd8NDYAFhgx8frktUUSZMRkBCQbJ8
	YNeE9ldgmKw9PJbv3P8gIFPslSnvFziF/YxdfcA9G2EdzSGEAMXgKfDQsm2xfKapQ6eOGxWAozL
	hq5X1uaqxMw9ZBeumeQ==
X-Google-Smtp-Source: AGHT+IGsDrB/9NqsFs+GTJUXDyUWG89PIW79ggF9quCSnVgyfof3rlZDBIwDgG3UDAmjbKhep2/pmA==
X-Received: by 2002:a5d:5d0d:0:b0:3b9:13a4:722 with SMTP id ffacd0b85a97d-3bb4a1fa03cmr1100448f8f.6.1755248974639;
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:13 +0200
Subject: [PATCH v5 11/15] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-11-955de9fd91db@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=chxUZAtCU37mhXCr4qzhIIkekcZb+5ZpnLwzXbUTM0A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5lnBQ3Etsml5iw/SH8qzvKnyGoC4Hly5o3
 tnIDLJk12OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 csfPEADBEB0r5l4OpTTIJK9i5AuM4M/cyu/QvJFZPvHsnoQ9OThLsPCT7jshbC2wt9Pv2puSVX5
 T1Af8wLRGMDrEZDP79F4hdOml7iB4kmRVSgBGYOIXs9akwp0viAFXXfUTf0qk512LjP/Zeha8Qu
 2vBQJXCtlrnBVyrLAxCt7iywj/o0HrURUraqC1V/kL1ejTK5U51gBYfoAoeWQ5TUVJopb0tjbOA
 mkIQDFpPVtuvRc6JP3wWSfTDUEvSR/B8uIGUkyIDsqVTRzObzIFflNGPvWoIQj41zXagR0xgWTC
 tamCDJq4dBqsNR7YUMWTCgpLB9UMbZimR9r+Z5QhPEb1uEToQmLmIKQSH55KMosoRsheikmbyMj
 n/YfwJPK16Q1aEpo0CPIsJHHJDhsrEB4xWpq2w71ggoiJnPXLGtapH4altn+YIiCtNE2DsogjY4
 z1J5MTqicg8N2Wk959AZ2U0iqc7pHTgnC+caKBq76Wqv8S1/m+npVHP6elyJa3brBbDRDwVuFdr
 tJZsQOOHOmp0WRxh5N/07ZwrriHVtfhX1KD02OHuaiQrGtEyrp1/6LksZu/5fvUVpj92ttmQ1JL
 A+VFk+sgzNoH7ZCc3rGLtCq4/o+8RzkaRpoUSMtxA10w30Z31P8SZPwIDmMqECTzGYpEsEPiMNh
 4fdjFWUp2iXksfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020936_139075_2B12857C 
X-CRM114-Status: GOOD (  17.10  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

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



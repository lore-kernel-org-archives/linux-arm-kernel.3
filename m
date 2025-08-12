Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71551CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=; b=fkGkQG5IwRPLRIW8zvIzAT6wq8
	/YkLuikIAaFX3VuxvakbJKyC8dZMWkm1G9WYw6u1jGXUf00h5U3iG1sjRhvgc7Wmwt+DG8rttDpIa
	AETn+hoR7DP1ktdxZ5qDFEOX07nPUXHbNVisPo1ETavwgayZyumci5oPdRDdsW1/9tBsu00hceQXJ
	RZR6nqNyT9INaYwNuqqXv6mNv9QbDrNpv8prlpUzVSknlCtGJcgXA9qZqaU8hBKmn5JkfMLuAl4Qd
	bkJ3D8TXAAaFQfncJg7yvDyae4mHJ5hK8+C0l2/JCw9Xtrui5751dypRWBihwD8B4MMTaKPipGoX/
	XavswpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFQ-0000000AinZ-1eL4;
	Tue, 12 Aug 2025 12:37:00 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLx-0000000AEmB-02xZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:30 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so26171635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987247; x=1755592047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=qvp3q7A3u+bv8mkVyaPSr5zOYYXI1L+0bmzMESOsAb6gatoGoYoPxP+cbeiwHHB2bQ
         bk7SUDhJOoBNqXfTf7le0rqE7Yi3o33oL13xICw2lEH3ohlo7eFCXywNCpTFWRKN4sD3
         oNJjnyW9yyXw2JUX5w67n0yNN8v1OK2WhJWjgjTZSPZn+gx3VWF2bzncBQONbd079BwC
         4vRGJzWgqz8j9sYsWCV9wbN8OL7yZe4nFlggilAq2Uen4STaFGsIdf+IaA9y23Xxk+kR
         oRfFrIrJ8tAVX3C2Y/W3CsnhhArys+Nokiuod8oV83KNWmx1kyxYF6qFkSCIoEJZGJXV
         xNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987247; x=1755592047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=BbkwutpBB/rXK7N5+rv8SGdh8E2+f4YuSxeJJbehWCCvvssz+MkZn0yqeUoIvjNfoe
         EOHWjrJCSdYXaExOkb2QbDW6WCW3XueDAPqxVxiFmJR0ab+K+U1YJGmSzi60chPzsOHe
         LZUaRFusIm2d6zbfoVd+VqsxMy40R1U+WjYtE73Npj8Iz4CtWbdfDjhXOICNZfZZ2Qc1
         kvGnQoKi/Kc6/4FfjSxLTXjn6rJHT9e+KGjkuVKRbIc2SquQiURNY9KD+JhmDOrG7B5v
         VEejshG4tONUqqPXmXaLp4Wr4wxT6PxbqIfkQbdugUWWFOmEC+tao67AOZ/vfeLC/V6l
         voJg==
X-Forwarded-Encrypted: i=1; AJvYcCW7zckpmmbYpq3ECZYphF/Z//C00jz15TaUdLMufGQRlALRcfjjjw0Hvxb471aSW94lAAXlTQLLRQZtufo6UBEk@lists.infradead.org
X-Gm-Message-State: AOJu0YxD1EhCCEJgtWMqigE/3CPmfkUR//ut84prxlf9fDDCp++4cTSn
	V7wKhJd3U66JiCvGBeko5uNdPUUMu0sLKhgwGV1sL4KYOawaJuQj9g0YZ09I8rD7wKcuAkzOA54
	dqWw4
X-Gm-Gg: ASbGncsTU1eX5LVTNdwh0WU+N6Kz+WvGnE7OXkcpe0o6nOpsx5UDxdx9PXqBr4XtyVi
	0MQZw4h8xx2fWWSfGwVlZ827kttOO5pruKiAxOsiaoeePoHKTUw2YSi8DpiCRGD1oqMEDOLaHEF
	bpbGLrEyZT1yMfE4EwZSasVSGuQXP+gpCwC+KPu2If/EbzcaInEFq3BrDZxusiTW2peculz5Mk2
	r82zKKg3mDQc5lclIfnGe539La53+nR3fUgTmOJIlMshBlgIWMq4nzn4sfGmAStE2gg9gfum8+P
	N8unGHko9D3P40tdUkVcAT2UBkraIofIgUedWyOJdMoPyiKYfb/39sIy+9OCys2C5hL2SyQmcb6
	b4c+uDkCclFOaGFo=
X-Google-Smtp-Source: AGHT+IFwsqbb1rEd24wsckY1+KDaOixyeJmTQXPivaE2uZXRqBDhR+NeTCmIev7yq9yZGKWaYyUBJA==
X-Received: by 2002:a05:6000:310f:b0:3b7:7c3b:1073 with SMTP id ffacd0b85a97d-3b911014a84mr1715986f8f.52.1754987247118;
        Tue, 12 Aug 2025 01:27:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:10 +0200
Subject: [PATCH v4 11/15] pinctrl: qcom: use generic pin function helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-11-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=chxUZAtCU37mhXCr4qzhIIkekcZb+5ZpnLwzXbUTM0A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZTBy24+EiQ0I9n9YAoAtc9GJc+mIbjLJ4c
 dVv83dQyiCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cnS7D/42s+kq9cudWSpcHFuc0USVQTKWUm9m7Hr3iADyqxdii9U6wnmYgtkZeD/gBnn6eZBEVM8
 936OPO+6JoHACjR+Mrib1JBKvn+2EAhtvOxa2y8krmNl8HTrOwK24miaRuyQryIP2PDaUu9a/0v
 CCXeG9pcuY0VlCVndCfLAIvMBtoaf435NUcJbfRAUA1pqIBnAMgYNXixlJA8FtQj1cHIXYnoz12
 NRcDaJrJJQBNezG7RIxA0m4pc7nknsJMic4H6VJuhEEDURLIX11SZosiXspOqRzpyjWrifX9JKM
 Ir+XQCb4e9wFmhsQb0WJyDW4DxOxxVHaxO9vl7HLgXd9OcX+TbJm6dmibj6OQY3tPabfLIv5t5b
 91zGUu5y6bJ4d6/+OO0qmV6kzCOFxZBaFnx2uqKVn+ubzX7Vb20TGm0ArDrHQT8cG/W3iKRJf7D
 j/tojt9LnoVrmeBXBoFp75tWYfAtotKruu+kgi2o90mx5CL3RgXe+BHu8kcgoLmyby/jSygW3ei
 uD4SzRu96+iIJLTUjRzqRbv6WujNxkKHdcXIXO1VNvLuJ/rY5DhvLN9VFlnYGI0Pi1b4vN3ZwtG
 ZqR5bOzeHuNC/KkCJphUX/v8hHAqRSHlvHv1oCenO2VC8TSwJ/RtpstfLf8KL5mLGj+tYmim+md
 2lrEOwVF6POBJpQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012729_083063_829B07E9 
X-CRM114-Status: GOOD (  17.72  )
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



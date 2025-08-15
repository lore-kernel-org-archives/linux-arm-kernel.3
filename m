Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949CFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=; b=VnLAmJ18KfTHH1CHDyTTvn1S0h
	6qZ/y+FVdaYDEMWhMrohVbzBsEB0D/yyMw88W/kLIYwyBpNFIMphn9iHWM/mOnQOIjmEsH496ysyL
	WxDS5tPaj5Jrmai8UXSrq7fhmO2qWBKPKCiODdiTPBZYlqnSTpdM+yrfPvNOni9U5oN/0mEdvTGQK
	2/Ii+nzDZDzOOVbUMKrwpTQRRFmloxSmRsvmMUGMyMZPUjPDDZPv0YJbDrqQw7sDcfhRMoVYpMPrq
	GRCFaIHfGBT5RtdDhiv4CWoernpEd3sMqgXKedeQ/vFDhsjlhvVmpULdvhFKFJfBUH2Dc0MAAzTgC
	paI4FVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtUn-00000002Sde-1Jyg;
	Fri, 15 Aug 2025 12:25:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRD-00000001zvV-45Rg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso12357515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248966; x=1755853766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=16GPat0XtEPwf1qPj9rxPBswj53jdy9HwasFXY/iaXHU24BxTjNSGO9VLDUaxRHno1
         Xy9zx05lmvGFC6XPdKsQHi943/9/ZZGfAr6henJ4bGRw9XaRjuQfM8iCvl+BdCgOjO9o
         ows0w0V8nYxVYFxc2WDzdEBpKIp1Qo+3yqtBiNHAin0WABLEMJsCsTf8jpw8TYWQDTzA
         cdVXk2WRXf6m4Y5Cu8kpjzGNx1wBbipPzS8NIC3YERyqbL7fmgsdBq7vs2PaBYMop0Dc
         +J26fdbiGC/rhTMoH1kotPIjyELQyyhXgpIaF+7iJjvuv37XuwAYyEE9XOvnAdKrhYeu
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248966; x=1755853766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=Dy0b+AqXWirTEVRZpXax7rs7CyKJhgajLK+x8i9rmRBpimHCCMQGSeJ03mxkDlmbJQ
         RuDY6OyXwbMFeQ92VC13KJQoj3Z78RmRk+f2gW2ZMFfNClRqE3AgL98vVTqAH+aPh3jC
         XrVQ6wuNx/81BPJCPmnMvDy8E4qdeG2sH3ZNU7P8z0QUrPxME5NIIQONfaw50s16g9Fj
         A7OjcmnKWr/da5ORv+aB1Y3LoDcXU1sXLzdYx6bdyK+zcZT5LpDDrUpeW4igy3xvFg4M
         mjElpsRtxInGWf7iFX5E7vusJI2KoJCeqvA+pfXFw3Wh/dBMVx8K2XKLKivAjblupd0F
         rwag==
X-Forwarded-Encrypted: i=1; AJvYcCX3BbvnaIbUIQx9f3v80942H9ndLLTrC7tV84qV+q+p0XdVWU970KAB4SuX/evQwkACqph2Yl7vgPUWhOL66aqi@lists.infradead.org
X-Gm-Message-State: AOJu0YzjHrymx3HEsD12evVR09w6GkiLIcfUYXRmkfS28YRWAH5NgVvd
	YLF/Noi799tMDLnnxtHtpe8svXf6VoO0ZdFamH1fyV2x80l8wT8+PwpVv7SB4GOsbn0=
X-Gm-Gg: ASbGncv/BNXKbUkk+zY2jqIw0pd6YTSYLpv6+9a+q1IucKOnVqq/v5fkbzIkrCdLYrj
	A3gMEcSJwFFxDR3KOwyc6FTZ+zg4XoET0Vflx+xJO6VSmi/HxScd6zKjyoIusntdV0jTLDMBJP1
	2+vyNx4auCLFcluOVCjgdZ1EiilDno0zqLm2avwfE7V/XQfmu2tW6qd68M5gH7ol1pANzaKD3Qi
	3f1vUhANkuZf0+W3zh8y4u1tgim8xOkP+kVkqvN017ZfCI4AxvyyK1zz+HdSW+6nv4GPjnvVVTz
	+qi8h9lmVp99bLHEB1eRYa93dePKsJRmAHnZM/gaUDgeO1gd0fBc+jbmmKmNSMgrJ9yEy9rGpmw
	G0RPXWcQuhS9B3WObDg==
X-Google-Smtp-Source: AGHT+IGrKalxRH2emMVFhJl/BSNAcO1PZ0/C3WQ9SuFSJDnEC4sffp01HAuXZ7aewRxm96m4CMiqDw==
X-Received: by 2002:a05:600c:45c8:b0:459:d667:1842 with SMTP id 5b1f17b1804b1-45a2180461fmr14807625e9.12.1755248966340;
        Fri, 15 Aug 2025 02:09:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:08 +0200
Subject: [PATCH v5 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-6-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3rpCdQt6oBLFE3JhUek7wpG6X1F3lNHhRD
 1xBSnpghMSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 crmbEADXui3pd5txQPs5OswgHt+SSwhRPgY5VgbCuLzFGwr/2pud+3IwLJwQv32sg5biLycFPIS
 tgqKV2jg1ezhF3AuxuIS6nCEBUC25Q4ocf7Z5bIG1PaVNj4kx8CSRz3xaBNqzSIggrfzcGSDKRV
 vkfdoThbQz1qBjCZIGDtAxHee64mmlelkG9kaF77q9JSRcOTZX6A/dACXHIDwKOuyzV2Uvm1CQZ
 ElBeUIRyu4lx9a7VMF/jP6aewEJE2p1wugJvkvSI91B+YhvnkPrqA/QqGzYrxlHqflJy98WygLu
 VlPXlUsXqP5POoIbK6S3GDkQCnr22v9vHBTmkOmJ1H1flKtn+0JuYy8JwUFHe3h22Dl0ChZU1LS
 95/YKWnICS0nBiAFltHYmCDB1oIqxpBTQ16DUA5SSIcy+8aUUVJbvJafN7qVlBjOxUFIujaietr
 CGqK52H8fm5AmTAOmZ3WaCns5oKr+XuL+/h5SpO+GfhHrfeOF3DNb/EI2Y1jpV8t7GGsBzWu6W/
 Uo2gOtnoUPeWQEEW8J0qn9wdPXQc6uep1CXJVXcOOOZYG5XCIWOs+2CQm9FXoxOvfTaYa85+cwq
 t19ujQgkGk9zToTdGziHLee8zGBTKfXUwoa2g5obhZ0lJVJ7RLtUYDhq9oSn1tU9lVBWfPBWx/H
 CIIk4Htmm9oBG1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020928_042981_FF0FDE4F 
X-CRM114-Status: GOOD (  19.30  )
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



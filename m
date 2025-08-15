Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F60CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=je8Pqs7XauJbFGecB+/DZR6N/Q
	cJZbGj3aRFAQACwuRtoe3zo9qEsWm3BIekjPa9hhIhYEXDhmvL32ptm9zC3vT/zGkIWaNv144KKk8
	5Cgtf987TAg9HfM6cEiuZVN1LNsaOnmHUyBE/IYrIiXsCr5XXuT9fgQXu+I1WpJEh1iLkzi/OGJ9P
	MP7nGUb6NOiwirk9kpOiETtknPe9CSvYz0zmZSJ3UaUhFO2l8hInJ3rEspQNGKREdhbzjkEGUP/ud
	0omg31uxxxDuyASxgMfJHXFkJnB+RZ/HKmV/nDwUqq9mDCplcC54PFVVoHmJFqAIhMY4WxXMSkZAe
	lZ3amRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtZv-00000002T6E-0XDG;
	Fri, 15 Aug 2025 12:30:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRH-00000001zxY-1S70
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso11723215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248970; x=1755853770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=yyEx3/XDNpg5X621+UxM6nKtbg5ECE2EJkViZwAwRHS0R3d8Jrq/z+SekJ2nqzq2pw
         QQaIXmIKqNID1tq86o4kRqpyCvcDdc5W3Jknfe6ERznMUbFI0+Iu3IqoAz9ifkYWzhL/
         3PJkqamX2FNV30gQnqIv2uE9iRBArQP070DaEQ3tp7w4/y4A6MTptaMUNotvOUHhqU0e
         2OhX+rzXD2UB5t5nxOd16TN9e1sM/ibnMB50gyUWRJx5YbS1XKMNOaLRi45dQAwVagrU
         mAuFN9bwxryo5pvEaDLUukF/xJOfUY0NLnjBY1iDIMQWo8ojaQipjBtBWv64/Z9BRvNX
         QcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248970; x=1755853770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=M4MYwyGjkbYaX1uWj0ccNQlwXxJvtgsxEMpxu+wAhCxZF/UH1cwIaBRmi28XW8kWMK
         y8hADF0sZnKFOHIy5q+p+JxngLPMmbrvFJwuUD8FuBBv6wlpGvrNXTHskuNB4eaGtwMg
         hPYAOOGZ/NqCSzK824e359yTS5twvx2nPx5Bbi49H7BO1j49RZWXRfGhQKoj3KkDwn++
         6YhLZbh9c7mZsLbPl+IDqjzAKRbeH4i4mPxCZoaAb2EQsxiSwiGMQVHEhT2I0TDkj8Lf
         jYQ4IJReWCh34xygPcEjipY2C4678iIS3GTZIO9MyT9giUl8ked+QrxrNoso/PKAjQj9
         RjMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgDaZLRapfQSuBp30jZKFRyuQnLUMJWirRG+9PsGvKlEvEsRRWuuTM7+D6e3XYoqEsyDwyq/qb3cRDw+HE19cX@lists.infradead.org
X-Gm-Message-State: AOJu0YycEqfT4GGU4Z3WNS/IK7MnRnLptEMr/vs8S3GRn7Sl66vDkck4
	H1/emlmOVfZqbq3qiBznbmM/5Qjm3vvaXWBB7DK0RVOxr1kASYjNWqSYqnJmTkPGxjs=
X-Gm-Gg: ASbGncspg9W542IMqmy0ctR6wfQ3kXdBgKZIrevTq+AlLLf6TUgbbheutYDKwX01DpZ
	l6fok9uX738G6FK/U3f7Z5/wCXTKbCD/SmgqyURY+jzhArAqmkTOcO1Fsn1wZECk4pyNz+a1jBM
	t3VtkMwMCwJLh9Jr6YwuWsH9d14wWI+UupbB0Sh9FHlN20yiHTFjna2mH4+f+PmgvJ76NOtQZor
	ea4F3xlK5SYhcobq5/8Hwqv6sSHjELy6eDMIEUsAZiQWWJOROXARiTp+bBmNm+3C05WLucoPkaE
	3MFjm+1gPvfa+i7QvTClz35dHERrQXorESUb/kYZCTnKTaWygssJ3IxFiolnW105FHrDZ5Z8og2
	xAzc6l9wf02Cvoc8rRQ==
X-Google-Smtp-Source: AGHT+IEuSRLd3B0h4SE3RR2S2yHycoqFTSLj7jDNuZgFZPq4txV7qE0+ov1t4k8bQpePbvf3meSvDg==
X-Received: by 2002:a05:600c:5286:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45a21e7f2e8mr9560235e9.7.1755248969664;
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:10 +0200
Subject: [PATCH v5 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-8-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk4AelBkHWJWZSjBIznNV8JlLBDYLHWXKinX
 +GiHJ5uogmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 codHEACM4UcW4XmQxoTdvJG0sbAVF+QyQHCaGbqkMyiyny6aH7RK2tq8Xl6yZSAoDRX9DIkdLsV
 cjvfs0JZcnSCGBsxTN0eEICrrspOHQJRa0Wz7f9MKd9Mfp7PkVGQBphWEZafv185lvBfoQYn10/
 KMtkOfMe5hOMHj/bH0r2Pc+DV6X5sEMdx/LSX4oRC8+cpTqF3s+mMLqSOrQN1alY6PnM/461gt2
 eI0f1lIQyiWLUH6ciwIJP9DWMIWGmXQP+TPp+em65RkBCAYoqFmoeyXOlz2RCO8St5K6+fuqAFp
 5nFyEPiGfSr/wntSpNNNoZNz0fVOdELEgqJ0275bDqBW5cek9dhFtaO6MFMvPn1FGP7wpac46ie
 ZX0acGHA+eBIISkExKYmPTBWlX4UNY3tLCaHgedPbnTVe/8blQMS+jtcmlT8N0vTDcLPocFUqVm
 m98XIN8qONHj6xwZHnc05CyexQgealE1ZYeYBYHkpC/2FWyUzIpZ0dnN2HiEpj8H2J0+PoZ1l8A
 ZguDBgwMeJJF1j0ZYFn4ZZKDu8zgJoZeGsNcp1BnOb0+ALnGFfMwsfTeOg4e6NiqXThqwizkUXp
 0ln7J9lak+xaWe5YElclyG7HeWIY7RLTvgOSJd+mhwsTItLmpI417ypQDquLMvaUrdEKVlQwWyM
 1H1INlqKY1Feo3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020931_383742_C3E47B7A 
X-CRM114-Status: GOOD (  19.89  )
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

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. We're working towards reducing the usage
of struct function_desc in pinctrl drivers - they should only be created
by pinmux core and accessed by drivers using
pinmux_generic_get_function(). This driver uses the data pointer so in
order to stop using struct function_desc, we need to provide an
alternative that also wraps the mux mode which is passed to pinctrl core
as user data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 6aefcbc31309995ec1e235416b40aab3e4a073a9..e78c8b3ec245aad56e3e74a26d27c41ba4a98281 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -135,6 +135,11 @@ struct keembay_pin_soc {
 	const struct pinctrl_pin_desc *pins;
 };
 
+struct keembay_pinfunction {
+	struct pinfunction func;
+	u8 mux_mode;
+};
+
 static const struct pinctrl_pin_desc keembay_pins[] = {
 	KEEMBAY_PIN_DESC(0, "GPIO0",
 			 KEEMBAY_MUX(0x0, "I2S0_M0"),
@@ -1556,13 +1561,13 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *functions)
+				 struct keembay_pinfunction *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
 	for (i = 0; i < kpc->nfuncs; i++) {
-		struct function_desc *func = &functions[i];
+		struct keembay_pinfunction *func = &functions[i];
 		const char **group_names;
 		unsigned int grp_idx = 0;
 		int j;
@@ -1588,14 +1593,14 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++)
 		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
-					       functions[i].data);
+					       &functions[i].mux_mode);
 
 	return 0;
 }
 
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
-	struct function_desc *keembay_funcs, *new_funcs;
+	struct keembay_pinfunction *keembay_funcs, *new_funcs;
 	int i;
 
 	/*
@@ -1614,7 +1619,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		struct keembay_mux_desc *mux;
 
 		for (mux = pdesc->drv_data; mux->name; mux++) {
-			struct function_desc *fdesc;
+			struct keembay_pinfunction *fdesc;
 
 			/* Check if we already have function for this mux */
 			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
@@ -1628,7 +1633,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
-				fdesc->data = &mux->mode;
+				fdesc->mux_mode = mux->mode;
 				kpc->nfuncs++;
 			}
 		}

-- 
2.48.1



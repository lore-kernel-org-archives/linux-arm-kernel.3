Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB70CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=js75rXRf50JWxV9n+9MaWMprkb
	Jo34MqBC4cB3MCYD2JcBK9k6CUQsOnPxkTVzSIImWpW1vlHNbm5deyNVr4KBC3zvydNjqUQWk8tuR
	28Jj9NonXYApg0SAQNRegI3867x0ZIwJth19PqU3Lj6+E2ngvwgFXdgwh4j2zTHLXReVdKsIwb110
	Ea5J+mMRT3Wjz+SMWZOIydcMc6jQKEyGA4xjdR3kc18rrUIe9EVsE1yR4l0OOhJULLjb6nzfsYnoE
	hWbMpmy0rvO7cPAHDUHCFeVVFfVqPxdHiDzMGZ1ajrl+AN4gOtGyMWaULEYrS6jg/AvoYeC2hdzbc
	6LVdLXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urklz-00000003S3y-1kIL;
	Thu, 28 Aug 2025 22:07:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3B-00000002BMX-46S0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b629c8035so7085045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396832; x=1757001632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=slcKjOqmbt/W2Ax1YxYz4G1awe3n8/MHrloJ01GTzKCHH6QpbS3WWlh4lOHszHO4kN
         11AhbfQONXUmwEKI+6eNm5xtIbFhs6gv2UkI4PzH30Ff+UDBwjbnfLcHxCGsDbtYV9dG
         HFWW/XX71YRjGsXIzWl+sH1H+LXlCIMnPPlq9gx9r7O7xDbkj1wwpsCz5YPchjhhBrgJ
         4acl4vPdPkBf2X/u01/w93Wcu6kwoXC10kKAUK7mnTiEt1liqj3vXDgNKOUfzwfK7oMD
         zGZ2Emv25AJh6FHYWHzEP3lrYWnLlArDdb6xG5iDkfgLhYXkHTd71Rw9w7Er9N8gRVV3
         +rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396832; x=1757001632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=bmqa4dr8Zwm75ieieZaYh6E3kVvZYcHXokvt9FUSgUGXxCjSOWlVgJQ9+0W3aiyOD1
         pcmLftXzNq0jSNpomOE+aoVrBzY52lchISJtd9vvPMCtOJjkvuZG4LWkk5AergnxQuk3
         IOzMHmio6yydSCqRP3hEIXeT7j0vHblsdK4uyXsHe9kWovtyGutz7Ntp/s+PNGlu/9YK
         73nZFrhUHy2eb/SGXInUWBntAWP+NWbMG5ToDrFLi29h4Ig8gm0wkP7uIky8l+CFaiQr
         Oc8dMfA8Z1HPKAS8v7GMJEBsm9CUr0y+DpnL4MQl+rCquIMTcBV9Sxsspv26bd0/HBU2
         O+WA==
X-Forwarded-Encrypted: i=1; AJvYcCVpKWSB3QcIzj1X4zC0rbjMBeIOzkbkT2p9tPDaaBdRZqn46k3MU0WIFIMsngzKt2X221NOH1Eba09c7DzEMl0p@lists.infradead.org
X-Gm-Message-State: AOJu0YzcnWGw9X9YIRb8bjPro5OFPVXU82WRFKnqdz6iNW8mnsEKaCiq
	VOZUkQwZKXzMoiSsHlZgcjoXKQntPnOLvOU02C4prYKwBzQoc3FI2lFKxUZ7VmYifz4=
X-Gm-Gg: ASbGnctIWWb+oXQ1Ud4ZrrntlRcT/yPWGS6zn8LVlpG4IKB1jix1RggWf9UrBba3wai
	YdjcXPXFqNdt4bNdJe9NdSnNGJBZKRvNCbV2oKf8JQ/x/ZCwV2zGv7KitysYWoCCM5ftVhHumYW
	vZYFg8iUg3LuIXWHubfuDxz5TLvFK7IkDObmrWCBHZUveYQhSPDaRb1GU3gz8WHl2mXeB4Sezux
	ocl8EiLffGfSyqDXlq01pzNrgc4PnFCmpEEl4HTCvodIpXtRh/CBd86qvZvUEh1rpOorW0OeG9+
	NMCUcwN/oFhelFs9IuEIDVuSyTcIKUucWYIp+K/oG8fD0TXPFv0vFOYci3C038njYyFNYUwO5G/
	JZimPefgqO4L2dEMiUpdB4DEVOqkzhzUknCGOz6U=
X-Google-Smtp-Source: AGHT+IHLEb+XALx3SQT5OlVRvtOHeQcEx93SoK5JAJJrN3hgR1oVUvTEfB3KUoR77aDoDBkXnhfeRQ==
X-Received: by 2002:a05:600c:45c8:b0:45b:627a:60c7 with SMTP id 5b1f17b1804b1-45b627a62e6mr140635195e9.6.1756396832146;
        Thu, 28 Aug 2025 09:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:16 +0200
Subject: [PATCH v6 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-8-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OqeB42/YsplOuPBdejGDZ/d5WKJRcg95WZ
 LR104xQjUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 ct8cD/0ZuQK3BRMs5wFLGQuOWZuN0q36r1G7AhQcVy4P7PCRDLcyiRs/WAoNUAxuaMt/WwFIkRO
 hROoXg0+TORn04NnzEVYQhTRbqJnwFISsG27ucFDhABh7y5SOZAAEGAgDlmr87Wj7BXyliVSG4F
 pveiULJuhiooGFP3u3dmVo4/fksZ2iNxe1F6Shfa02B1qtZrPp80GW8KrPmkyWiXmvnBdpr6jft
 smrDNxHL4z1e1B4Q4Vm11l1dWwpD09tf229YOZsHkOJHC+PLAI54oiNWw/e3RbsyJ9xoXCKZL4b
 3UAlirH9CoqoulHfkqYeck+FpiINai8UDbl757HTSOvr5y/NC1SKghf5Sqs1Ltlko+1rCexnQy6
 d3sz1GFWgtO1sMkKdFszISAXPg1mPITBS0afAMVUs+Ubz8zwNQEQHc6Fr1/RryMhvKlD4Ic3qds
 DStKOup5b4+KcfB+dmW2pXus3SYVlmgIVpnuwfPi8aNU6bFwKc08EPXn9LYBDNrVpAl8PKyaXFs
 hMuv74QQ0Rb/0y/urOvaoYVoZZjlzgU5L3OYCWXSaoHyHqC1lFGH3PA3jpMY8wKOJdDOr+Ugx+d
 jppbIfhciMtsHe9+7bBfnwJ2MhpzRZXMsMGY8dnba+fJOj7cYEgnMUFWpcChK9su76J4X0jsLs1
 +9KYwX3UDLTLIwg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090034_046649_5F478FFF 
X-CRM114-Status: GOOD (  20.24  )
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



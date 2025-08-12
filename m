Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=cOUDrsaj6QYxVgH3VWXaawCqSD
	sy/VMdQVlWYLFAh15J13gwAhbz3NIEGOTLYaK9bKl2pAm5DQEcIT+EaR3a0x+k9aF8b6LMdcoHmnU
	dA38CgHETA2k99G2U0UVKV4yMUuvQTZCoQLu46OMkh9u++jUSQAE5w9Hq4rxqrQHrLrryv7kVcRxK
	Dz5T1O4sZdPiY9Vl95D8pyjV7nMJHvmd2tSWqSljEvhe6TW19c4uqYdqq4Ip6G1FYrj+qgPYITtdH
	uxz8qs4GR21x+UhaKvAzhm8eNwOuvjuUXPXD2kiEsDfRgdDa/pEPSYQM8kz/FA/fmOQIZNQt6n+zb
	Cjol6v8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFP-0000000Aile-0TAu;
	Tue, 12 Aug 2025 12:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLv-0000000AElS-28eD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 08:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=; b=m56Q08fDLs+lqBDKqK0y1y7QvO
	nEfx6JdME5cutllN6VDXK/Dfj5sPI57evk5xkpmBaZz/d6ygFh6c3KZ6aHnFxk8hERgT+kZmugOzU
	xnNZQPQep0kHk8SIaWagnvmAvO32umMEI1jRWG3v8asXbdtftgtwU5Bij1gXLRpzcTgC41Gz5uHiN
	szkJk0kMpgiAe94+p2HWVfGsH2Vw0YGMefRaODQGoSHum4WbjI4zHHDSG+imbZn+YCJ0S9sTMWt43
	IvBrtMxUTXkjVYWQBfVA6qG0JNxurtZk8cQy67mnH9ySp0FT6IA2teI761Yoiq0n/rd3pza6eDcOo
	PH5wlOSA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLs-0000000Fksk-13ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b78a034f17so3938208f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987242; x=1755592042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=iJV4RhOJdfXAq+2bm+WNBsTpuO1TaHDdCNc5RSqmKZG/Jtu7rFDxQ1KavKkuIy5coP
         eHODzdWzWjTSdBdtqc1zVUg9c2kfCBrYrmF1Frzrma4DXvu8Ws5oa0+vE99YbwYy/DyL
         Yg0hPKcKtBJcQMnBca0T9iDR+L4fuGSRD03GHaUtrfFORVQj8aLrvRkxGaWI9YWQwS5r
         CyGOkn9AP4Nec/h8+U4GndjtQAgnyi4ZU6xFIcCX/YKw8oQS3wSggyzOKURabq91GHba
         7vf3QOqDSgeI1cdNkaUf5ugS8SLfMXQPqF07yCyA54FdZfJ/MjOZgeOO5FM0/ZAbDHqj
         HceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987242; x=1755592042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=W/SK9Hg1gZGj2TsCydsinZgO/nHw6TXoN4plQI5FB/g1U/veGGRlGdjalh81nu4D+A
         HZTKxvUVG57IWaYRV+rt7YzpAfyqvtNgpC8iJZai6QAtyNYF3uDmcdETQAarpL3phdl/
         N437G1inavzFUaokPwVI0oIna4rk5xNH6V5rJoJzpWWUP2Fhq1/8GikYG60Q1sachGcs
         0FYxpNMD9qyUNvx138PqjL2+aMEUZ65/gftWGFC+MbbbpoHA1/akXy2mi1B/JuhEofmn
         +RJiYJlLLPzOqqiirRycdBmYW2+ZscmuQzvTcCARpzoZae2/oyo0JurdcNX+rWRI0O04
         EhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeO9Vt3LOarKrgklKdqOVDLaao4HH5IfgSF+FSUBiLARaWO6yrWghZo+gB5V29a5SZW97QJc6PYOXgArn2ZkE5@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnvoL5MkQyM+MkwGi60zR/c4DA8g9eyUukLSeUC2aL/ohiv13
	uh/vqc2OpkTzpTo1M9nLh5SJ6EkReY1euKvvGAGoOxf3+H6vLaN68nonPRYpFPXlvGE=
X-Gm-Gg: ASbGnctYLT6jZU2lU0hHgTLsza1fujsQbaOq3WFMm22MlVXC7jqCwYWMdOS01uEmJMc
	GTmIFx0rK1v3U9nyj4KqzLkExHfo8Tkq6m3fxy/Gr+hzKJC4MItBMsiRBGQuipuVRutfbP6xjOc
	JvzGHdTZWORK23qdXu6QGXPNYsEOoE3G9MmststDwY+YMYDwCoHIY7z/JsZeQ9899mbV3JmxodD
	I6KB9GPsGCDK6htlcXWzYic00McuUgtj219ClhLJtEL9JH0XYUtayQMRh5MbajLXmBgXU9xR5w4
	GLUzDXmUDT+UBTzcl85M+KSSwbNo+e0GV6oDQYcyuPpyhnWjUyuh0VMp34fyX2+7aoiRWYm0PxM
	yFV0yFMhN9nFaPDk=
X-Google-Smtp-Source: AGHT+IE7RzdqszohpjnIT7cc2wTKSAeG24gAzL3U1lbvOrOc1qeSqca8LmuxQAuRcX6HqNeYGrkvjg==
X-Received: by 2002:a05:6000:2003:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3b900b83ccdmr10680009f8f.52.1754987242087;
        Tue, 12 Aug 2025 01:27:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:07 +0200
Subject: [PATCH v4 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-8-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrY8MuBbR5f3WyoubwUxwTmfyIcSpxQ7Ha5S
 zLVYHlj+CuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cuHpEADDsPkguck9xZ93DDbHm+dAkW+gxRyBIFKg7MoqDE8bGz/PJcKk/1pqyE282dOw68stYlV
 vWEOPXQXbw6Kn/H8LprolH4tci+fdlUYSuFCVbwEZHEr12487UwAWk0X+B2HpqF5xcBnOdVh3aO
 XhnFfIkuVErPutmqWZP/8HbQNkc5ASjwIqSDD14dJHZf0wFw7eyA4KvYcWH472lCJ/KpQZgrFK1
 oL4rj410zLawPhIN0OT0AIYF1gECMQZsfoW6aXo0YqgMWt4z7/gVDJgbhpgs0nSWqB1/ri5wVg+
 9O17SbdM3avEKfy6ioY37j4RypySOqOaDC2cNt+/8RhGVM77rMBmEvMYESdtX9Sp3nySjpOPaeg
 5kQTLr7RSho6OQIM4GK8qciMCFnF9AcggpTOOw3GFWJKKWHUQOAdfJbiPyF56YUp13+rw2d52Zq
 qcBjz8+t3mIvEpCUr02fqA1yaeFZfjR/CmIlvEpkYCvBxW9o60l+SL7i4LNbQYppZQsZv7V6qwU
 59JLUvYSuDw2Z8OkViH9CzlRqd3PH3Z8ufgkHBFZX/jrwufWqycyN17bhs5PxI7xzO/JMD2q3rE
 Oyh+AdI+WlSwIi+nk/ccSPXY5Ru6x6NE9iJr8R11FGaDLpiRT1xMit6Vk9/CGA3AUU8FVayq/hP
 2n/7CMV5EcQpTVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_092724_634226_613A6235 
X-CRM114-Status: GOOD (  20.68  )
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



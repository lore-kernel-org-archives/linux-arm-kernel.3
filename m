Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C53C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=; b=umTTL8wONA/cwZDfZdVGhPGHZu
	j/pDbspr6Gmn7S5I4G7UXl4zkp3DfONkQPRYMYbs3g58T2e/WtLBqyqvK5ueJ8UQFgwlD8WK/j/QG
	Dgk4Iq0v74jN4X2OYjIB9qmudnEt8MArzKHbYag2r6yYqa0fgpCMzjFXA2mi5AaEnybHT3lMFqCYu
	04sv+iCyuHE6ckUreWB6oDGJlT8vtdgTyRsdr0BqSxL3D/rCrAWT8pPnHlcXWuWL8RT47DC/alNYx
	w3ZTT1JpO7BFaQEUgda10tVemiIgLE6nuf4U8Uwpeet/uIRn+QMYgYKuxarIgt0CzVDemdK+fxk1E
	pnTmNh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhj8-00000002rpT-1x0l;
	Thu, 28 Aug 2025 18:52:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf2z-00000002BF7-0sYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso714210f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396820; x=1757001620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=oO+UY7a6k0BCzpetseXsM8SbqX1NRmIATc2/hfnuw+V0TpT040tO04awQOp79GHKgw
         VnBaNmMiY9n4910ntUEWVZ8aNkbuz7939PAFfGbw9+9hVV+Uct3BW9NSZ+xOqblieuZJ
         1EEnuOjrz+xY/AamCtEfyssRQ7pjrAArd/CXloSJyx4nJMCkJZDLmYlWCXAXhWMq0NBj
         gpbvMyyPebpl1rYmRAuXKBjWp8LENwIjf8V81pMguBWkNcEmtwrAcAt9NbJxeowKNWEt
         2RQMAeU6ZBfkNkAzxjchGaXQHnjKdpBbI2SS3qBMpVM9/UWDdqTE7qSAES9W+HmAP7mR
         1rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396820; x=1757001620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=BUPtPZ1Jf7sQHmqhgORfFEQEgsINGN8o8SUdY+FbTv1bbcv4trucULq2R1QM97YmCt
         49l8f5fl36ST4LJ7LomlwPBh8dP+uR4PUZ+oJrqh8Qp28jWXmFUXx3beWaUuBDkPMBGu
         hPISrJ8NBQdDexjvQRpStgFdUcHsBfO/8IQoK5EvkHpTzHuOsqr0FjHikmV1oBgx69pC
         nPHDLqrqrxWXND/ukY7NkeLqRgnuR+d1T7TN7dixcak49ucvzD7cFDNNG1nwOQeJmEgN
         Enq8tHDnXH6V5R7ut2Azd9xCeycFg7Q/gR4/LpE2uB7GjCpd9swQKPi59Qgt9Xd07eWa
         kA/A==
X-Forwarded-Encrypted: i=1; AJvYcCXV0U0Vt0h7mV/5zfjX1b1Uxwhv8h4bCNk9ImLYuuzh7C9fjqlariCGUtK1EbkY2NVAq3PhHo8AkMpl+zQzvMF4@lists.infradead.org
X-Gm-Message-State: AOJu0YyMxFiiYEl8gZe9it8ZsW/I/rLoMGyItIAtwLqvqTAZla17fukx
	ktGH+got3io2hf2q5UE91xxJ8fgUlrWJWhXIbkjx5TrCL1xpNXzqkwXk9TiEhnmJkhU=
X-Gm-Gg: ASbGncs/xqvzm087tYCUrm9OrehXYWNCoXWWYM46X/W82XLcc1zwt2bC9NtuVbDZbDR
	k3qvVWQJE4bVmOw4Rcgzh4Qgiw207j9b9iguFuz5EulwMGb7J/qz9vM/TLK2NufR4Ql4ZuX/akr
	IZ+xmdRGebmTwmdjktJ0lqFk7A1S8Cd48ODSlGUCJl33FaJ3wTswsa/FCsyZtzdTXDkpNM4S1UO
	+ISOY8xmfObUj90tiSwR5lMR6LDTEyacAV8qgDpBr2fTkJXc2ZjjN00C+immdFl2niZFRH8aBwP
	73/nwTO6SByMp/okVQBqfEsHqKuA5oXaU/jroAhYu8CM5qCinqitt8mFb38iQ65SeatGIe5IBRf
	Nb9g2VIkJ8mVFIZNV0G+lpBkKyE/W
X-Google-Smtp-Source: AGHT+IGxgL+toNcQZblo3toDDSWKpb6dbnh0R937eyOGP2RNV3U+4rRZ/V56bRaM+9Yqm9EW7dA7Gw==
X-Received: by 2002:a05:6000:178d:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3cc22e34cb4mr6129720f8f.28.1756396819645;
        Thu, 28 Aug 2025 09:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:09 +0200
Subject: [PATCH v6 01/15] devres: provide devm_kmemdup_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-1-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yGM1a+aC0va5PQYzRl7VigwSABEcy8VUGQM8wt+k8EA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0M6t7kDqohITUHpArt8wxM4j/l0nGheDDz/
 lBgFuEny5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DAAKCRARpy6gFHHX
 crcbD/96BbYP4iAKgagx1b/SaoRaFXAC/EdEogLQkCvckdWVvEIEZ8Tcr1z720z6HyB9Ba31VkK
 eV5egMTpHafq/h0riC+6rAxWG3Yb1N/W+bFOh4kMVYLEP4i6IAEsBd9d9XUucbCaHWNolzNAw82
 KKUmo7USlAk0HC27fCTmsZZnqVRo1e8oWsvdTBS1A1+6PVPpCUSvm8ucDBKt8GmuW/iEtFk+zVu
 b+E6wZwWpt/ugBke2tciQKiYcaYz+BmGjgcg/giMss8x6aCa9LvzL/lM+jf0Hyci1OQ/2DEGscb
 XmSsXN1ycObeXq3vKKy+Ea9IqGk80HW/jaOM38tf8YRVVWwPk34YZuNAqtJb46r7OOTSfPm14/6
 2cW7KPby1U2qNtkIA6h33Dpoe+sVrnKNdSv3GL5K+/UYB9FJRAjQ5KwjtDLN4mgzhSMN0Tlg/mR
 7gu+PUHHkiTRA32ftkWqtc99guGN5R3eXkDZesJ6GxqMxW9BzbtLDo/EYtmtBSUyF2GwKSoNY4N
 ncnsxtMEjMPpqpcblxpETio3cmc/R16fhYa6nyINj58teXPUV+yzA3zyK4zNHhFsQJD5m+I1Yv8
 kObDI+zPGcSSuBJ8TtNtSrQsJjKKYZ68meo80Zv7c2jEmrvZbjqJqin3Iuc+Bew/4ZuXumx0Oak
 S/KoHAtfm3cEDcQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090021_267697_0A1ABEAA 
X-CRM114-Status: GOOD (  14.10  )
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

Provide a function similar to devm_strdup_const() but for copying blocks
of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/devres.c         | 21 +++++++++++++++++++++
 include/linux/device/devres.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index ff55e1bcfa30057849a352c577bd32f1aa196532..c948c88d395607ff511ffa6eb0a75b7847ab9239 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -1117,6 +1117,27 @@ void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devm_kmemdup);
 
+/**
+ * devm_kmemdup_const - conditionally duplicate and manage a region of memory
+ *
+ * @dev: Device this memory belongs to
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ */
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return devm_kmemdup(dev, src, len, gfp);
+}
+EXPORT_SYMBOL_GPL(devm_kmemdup_const);
+
 struct pages_devres {
 	unsigned long addr;
 	unsigned int order;
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff4468a41f37b5d5fd679d4ff11997..8c5f57e0d613492fd0b2ec97dd384181608192fc 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -80,6 +80,8 @@ void devm_kfree(struct device *dev, const void *p);
 
 void * __realloc_size(3)
 devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp);
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp);
 static inline void *devm_kmemdup_array(struct device *dev, const void *src,
 				       size_t n, size_t size, gfp_t flags)
 {

-- 
2.48.1



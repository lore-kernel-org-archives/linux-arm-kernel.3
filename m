Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D469ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frWO1MUM1iHp10hYQSMpeWUCufaMLUNxXxOHMSOr6+E=; b=c8m1DTU7RbAP2Q/e4g6mmbj8gE
	TKBAX7l/bvu7OEqWj7p86jn1FSuG3kz2PK+v40qnPglOoZKB5V12lL6dE+XRlXEIH7HraLBR1P7sI
	S85yH4lvfbDDvMl/hjFzwDywZsh18vzmp0+iB918jn7z0sQpzDpouQpvfAEh7eAEvFk0f+lbPr86N
	kxMqCL6pPgO0wpfJbpSPqcAKj0n33BTwLBOPfM1c+Hma8ZTTHWwt/RCod0pFJgzo45sLtvZiCrfQT
	3hqI+7hS8GOxnWBA0Afgo6ofRV1Cicpb+EuRWOK8ieTHoXGii9WEWJ0mtmif2664kq1sbfNT3l6Vw
	VQB77KWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSSC-00000000WwQ-0PZd;
	Tue, 02 Sep 2025 14:57:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfY-0000000H4IR-0UBA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso15501965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814363; x=1757419163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frWO1MUM1iHp10hYQSMpeWUCufaMLUNxXxOHMSOr6+E=;
        b=xPw0arnvpA4Sqe449qJ+OwcNMnLxLOjBgfcTNky5mynkdI9JK3/3yHjCBxL8Zwu1AK
         i+xxxSGav6tCquxeU21hIglA/1a5MWR6SxmOtJr3B7rD/hZgMi7CAPXt7VlqcQOfJV53
         E4RayDejWDyEq6eR6Ewa+TszmJv2PDql7f5IVi6UciLONE7WPuC521PwSb+xtFX9sdmt
         dqYnOvKCZFeRgVe1A+J9r3paWoLcmqb2US34Cupf/C/HdMDmMSfqKTBzYIIrD3uD70aN
         1SSSe0lJ0xi501fggLMEqqmLvUOn8+Q1gtlfm0kS1dfoDybryg7nlih//8j3SHBOF/wx
         TAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814363; x=1757419163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frWO1MUM1iHp10hYQSMpeWUCufaMLUNxXxOHMSOr6+E=;
        b=ZaWCIY1xeDHIh8TyUgehdwAF/XblMF1b2xUAZiRV+89wT9xv1KOF/eHYDQPC3YuWMQ
         SxdHJF/X75Tm5+S5Ulr0gQbx6Z4eW6acqqUuACwqfwTBUjpyVzq2MFgXiQDChdfBHy/m
         GB3uPBAZeQ1MSUXNChp9XmFTTboln66QXOmWNh5OJxg9eMUvah1AkXs3BCzFIFtmNrSr
         u5n3rAYEEgvzo3p/mDGjIONHOoHoV/5N6DOQ0NYHxhicOhGRZSZwFEOxn6USHif4puEY
         7SgJteokmgSCJGIgI/NjMMzqtvHnjeVeAEEkzq4MFYo51qgf1KIYXRkXbmhlD0oSTk9r
         QFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3leLVFN8IpbD+N3SVFy+rH/PU1MoAl/E/Kfvn+fP2+AysqayAwJsqmSMjlgmLKDO3XgUgcud+yUWaLxuf/39n@lists.infradead.org
X-Gm-Message-State: AOJu0YzJukYlzx4LM/OV/2YWS9pD+VN0VdzKlB9SV0hmiCWGiXTT6YFJ
	Kfb+ioa3cC9r4ZTaQXOTz+9peDnlBEMkOqw7AKARf9JU9IpfiKGoxY0wedU7IRVUo2Y=
X-Gm-Gg: ASbGncsvmDl8zx2w34Lny4BRiTJl3eWPZ5tYdRj4w8km4LlzYL8gkNdQ902UWZq0d63
	WkKEhKBDYlC/DO9ukrw+YZzbOKzWw6/QR618X6nv8Crd52DLGfiHl+AhTqY7wheMhWPw/eRwyK8
	gzP8va2i3y3E0BRCJKalyNatUoJfXsgbXw1u28MoqYvUSAreDovmy9CyY4U5WjDm2c3GHjdVaop
	7QlAMjIeXHkOMg+HpdZ7AV+g+WOOkndMkZVF8Keae85C51k3Ug3dif3e5LOgNGIT+lpavOcb8gr
	ajj3kVNS1N0Sp8gF4A5oq61nRzpQvuOUS4mzqUBGElNh4dvxcieeqj9RodtI1wEr81oBjdS9hR7
	HRQND6UZaNwkj15fqPRxrL2T6WFY=
X-Google-Smtp-Source: AGHT+IH0xKJNlyv4ZyEJNfQNwTyZdVQINH+cdoHboUNYQ9kgUCTDaVU74ZUCabwWO02Je54HFp0TUA==
X-Received: by 2002:a05:600c:3541:b0:45b:8adf:cf2c with SMTP id 5b1f17b1804b1-45b8adfd08cmr65485875e9.26.1756814362526;
        Tue, 02 Sep 2025 04:59:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:11 +0200
Subject: [PATCH v7 02/16] devres: provide devm_kmemdup_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-2-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/fPVmazhQjlUCOZ/s2UWyZhfkrmgQ0oqqeO6j82ecPA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwSqkj5THulrOPioeZfQvwHNm2obXZdlx73n
 rLgQ+gp18SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 cicBEACBSsEN+zHGYUqQzH0L1fVuUR4Uyab1CeLWPuBlfFDOeIdpOAiAwQMbodQXN0tUpDtsdfE
 td+XDUygwggIWKTi8v2mOwA6u592fDxYytsIYAIKlwnxlylnU1dq0YsxtPM2jn0E12ksyZRhxRZ
 fUAmR0hg5A/YXoadpFnbYagOSaf2hU+jiUmL4f4K+ypadqW1bAlVSzT6gI1r0pMJYfh7/3yX0PY
 YG5m0U1+PTJ7m3EfG8+corSJRAS78Sh2FtPt6tkxA7SvyTZCtkF+9hE6cIDbwl+EePrpvN350H7
 EFf+SVimrXeowCmoBm3yNNB1NmuPdUpEfzD5NZKO5RNzpC43CqCeDbSGBcJ0mJbKZ25CxZfucRO
 qSqYqC705VQLTtzvva16XMEqe9r+MoAoLj8CRWuiZqQ9X6/Q5UsCNHlK1x3nPumfgoDNaUvz45z
 Ag5VkkTMHChrka1WySas247IzRPM0u0mdh6XwAooEFp1tu73+eXbgiljzYdlNrgwFRfTawxE8Yj
 leay7ODBWo8jv5tzc2mdo2FJx7d3gfD7s0sqbn6ynztvSoE77DkPLxqZJOW+LO43En0NrOYz7w0
 5QL1qvQD9C/lNGCMdrGAQxAR68tpaPC8h6+FTYhcH0YAaO+EbJVergnm02z7RlL4YUSmUYKfxPq
 1bB7j/qtQY97tcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045924_164839_54F53B16 
X-CRM114-Status: GOOD (  14.51  )
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
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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



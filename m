Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F752C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=; b=MmBml2GbL09A8dw4X9bWUtiTOQ
	3ZnCS8fI4SovA9ZHk+nTz/j/DWyFBvqwm7U8jSPGtZCDIRss9YDM/E2B+9Dy4Yh7lKsQ0NWhacDh5
	VxFLs/gg6faijP0ZTTgSZq0dzosrMByB/cHA5+XJof1awqkfCusdrIA6JXnohhbc6u/vbJmhnGPLR
	aF8avEAAjrZBKPs0ZOWJRQnBrOy8niv80UVXX/quRfR0ruDb8a77JdIcx3XpWzSjT2PFZBVYiU5hT
	3EGtJ6n9kyVZ6++1azkovIxrNlcc59DHYWH/OX3Ek508QHDRQAESiXtgpPPFR4HfE7dBsk/04y7LK
	0wSxRJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesxh-00000007B7H-2rx5;
	Thu, 24 Jul 2025 10:14:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesBt-000000071dQ-3sbA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so588785f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349080; x=1753953880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=bIi+F/zADXa+PI3EWkRtqqGAeRlSwSH5O+SSCxO5cK1VbqohPXCLHqCYebDoTS7dBj
         WZyKMms7Wm7YIb/luNp44NGoOoqo4cEyZxsWTHHU83D07qwDxH6M0PiNIEL1HdmHawtc
         Pz42DtCdPJnVYwdKtw0l/u/TmIR9xxG9bv4PZBIFEDr7iOE4WgBpYgswQliKT+bnq3Vo
         wdBMC1AdxtSxBkfj8EIvo5hjUfGyMD1RkNWJZROoobHZgnuEA7+e5fcH74BqdWh8zSo6
         v/0YuqU2X25d59kznLWo7suQSiwyY0i7OIlS06JR4B0ThKKCW8fIrYVtu59BeSNzh/rp
         jzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349080; x=1753953880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=YfQA2e5UStk5f9jeTfSjwEN8RSdEI3BNN3FsA1FastrI4P0PsoFqIUxUS/ohqJg7YQ
         ZgihNi3OjWtjEwzh6uZFfziJjC7z3UtlFnAKUuVt+lvRjvDkrOR2Ld9EEL0ur5CQeuX2
         5oeWtzk+lrfWyLeQJceUF/EKlZvw6134EmmFfYl1iNmwzMjUlCvnbjr2KgURTExM9VaZ
         oS3WMgbp7tmkR7VdghcNEjv8iaD9yQi3qTRT6ks2wNlYjccnjTeBLpBquOYj5VLSep3Q
         qyQwpbVzL0NCMYFNSCRc7ACKPW8UNePlHVp5i3NPiI8SLppjCDf6vgMFkfa5WD/VsybG
         VPMw==
X-Forwarded-Encrypted: i=1; AJvYcCVMt/jObm89yrXLp+AWWpqClaerqHZaAv3UYFcrkHZIrZXpOh+udCRwWDpSxw1ThbmfBqG/Wr5zwDxDumeNfz7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ok8rZaAJlBvRMEAT+uW+wKkLn8u8n0D3z842m00/7PQFdMnD
	fSedkwMh0jpUSxhAahubTY0dOqg1VZ3Bg6BDwwvSA6VfBNFwc5TTHp3jXIMLItcXlow=
X-Gm-Gg: ASbGnctJRog4tAWHQ0qsNOQaf+Lzz1+pTkip05TQ5zewD9ge2A5HIDtclq3A2hJ3hzu
	yBcFr4nABshLMbeVJ5MTfSufEErhJYij0PWThxSHtgOzzzMtxK3yTLPNZj+VjHBjvixA3miyJqt
	agiL/KcV9PweQzlTo9aMBLmVXZ9oPaWez2sRghibKfDvQbXXlJeCq/P1a5i15ZS3dNzWR+3GsXi
	UHMLc+S3sHfb1cIQq86nsb98AU24uoVASWXNub+pPI/+adZ2ckAhukFknyr4CC8nJ1MazCdFZ0d
	wm+kTQaRO1b3rPzaf1VSm4SFGYOGIeGE6UhHAmsJjBfPfIJzbXneA0ZLcfshG7eynMjfSjHJKxC
	fAwx74RANwJTYmGQT
X-Google-Smtp-Source: AGHT+IFLTaYRX3oZKktSwmTl5BxHaXO7YP006jDq4+wHGsPABKDqUOqQk5SOHVzh8IhrpobqFVAPGA==
X-Received: by 2002:a05:6000:248a:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b768ef3913mr4552377f8f.32.1753349080240;
        Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:29 +0200
Subject: [PATCH v3 01/15] lib: provide kmemdup_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4C1RHZTMKgGSo3gXRAvPeC6y45wc3aHImSFGh2Fz1QE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRcDL9XPXeHv8dyMY2ypjsvbwhNFFTJNmoy
 2AX+ZslnGaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 ch0XD/9I+1OijkQL+cye+ZruBlaR1Ib2UfMF0QEOwEw0hfteX9fTl34LlB1334pIq4xxhDMyq4m
 FZH5qMf22U1fVmLVGDs7Py/y1aFeIly97+9z4U2zlOSQ6KH68lmB8I8pmA79F94Ls0nxwl9MXi9
 A2WDTXvSoAA2nloXBT8D/2nv/HDVzSpY55mNCZn0QeI+lQwBhC02oOwDN3xg+aXfkSCzERHNLUX
 6ccd3tZpTYjYcyaEzdS3Pr8xvrq/CKlcGx/7UWQO0XPKWcYr7NDzBhcuZ/Xnciwnmf+4bHDTfsj
 N+QXyPhCYpNecz+o9HYMzcZ49hkbaDDcHRzqJ1QAqMopPXRH2Y+uuN5IlTCvLCP0CxYJrSNK1Ir
 +t/tUQDIsNKH0oe60hktWfTdSPocCQ+A/e6joTSg7q7rwlh3PeajuYoz9tdr1v4bN3ZCgNI5NSy
 vb6WLdiiC8zV317SlA2fotQFgGqmCmNXHZ1MxIG8WdADW1csMF44skaq6TtMIu6B0JzqQVnJSCL
 4ZhGqhYsud6CNJbYGa9BIZ+m3Kq6EysSbLmBPCEpH0cgs5Pui2X2PUIf6BHelaLNyHV0ckYn+Vx
 XUDG95SjgAiMT6Kq5zHT8VPY91QJwnLtOaPEAM/z3cF8qGMdmWR5fJT0BUlU6e7t3nqhfPtV96G
 w8wHIy7JPNlWP+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022442_049711_3C0155E8 
X-CRM114-Status: GOOD (  13.70  )
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

Provide a function similar to strdup_const() but for copying blocks of
memory that are likely to be placed in .rodata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h |  1 +
 mm/util.c              | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..1a86d61de91204563e4179938c4dfc77108e03aa 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -304,6 +304,7 @@ extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 #define kmemdup(...)	alloc_hooks(kmemdup_noprof(__VA_ARGS__))
 
+extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
 extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
diff --git a/mm/util.c b/mm/util.c
index f814e6a59ab1d354b8cd04ebf3903626f6b23a6c..f4df9194b0c69c27ff06e6ba1d1137c559035470 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -142,6 +142,27 @@ void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL(kmemdup_noprof);
 
+/**
+ * kmemdup_const - conditionally duplicate a region of memory
+ *
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ *
+ * Note: the returned address must not be passed to kfree(), the caller must
+ * use kfree_const() instead.
+ */
+const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return kmemdup(src, len, gfp);
+}
+
 /**
  * kmemdup_array - duplicate a given array.
  *

-- 
2.48.1



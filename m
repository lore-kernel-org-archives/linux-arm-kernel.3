Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2694ECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTgIYPzRiaE3tZSZCUJbaKi97GRLZz5syZCli9/nEr0=; b=GDQi2IfbhSeUlG595ExhjBd9h2
	zQgWSTT9nOek8Y5ycUWqKSMAmpg+eUYEfGe+PCjbDHOffJbuLQgcM0qgYXjtucm4iPggmElDQdLbw
	2KIJICAbhEyN/p+Sk9XuZFKqegJdZr5UVkyXfGUFXOA0fwQiMq5kP5/zxNlG41ujLkdO3UGzPpLnc
	s8USFbjG5SOY9nPKuZvcR3P08iOI6BdqXcqQ4q/8joOVNqZXKWLfPTLJ+RXOi/0k1nR+ip+eb5pYt
	/AI8xi28jgBonXi9ZAbDLt05dF3Ir5v0ZrrzjD4r2OHPFx5p/vKeY2SBs8ARZtM5fDhvqBZ5MZSNT
	+7DeCCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEw-0000000Ai5O-3EHy;
	Tue, 12 Aug 2025 12:36:30 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLf-0000000AEc7-3OFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:12 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-459e7ea3ebeso19553315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987230; x=1755592030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTgIYPzRiaE3tZSZCUJbaKi97GRLZz5syZCli9/nEr0=;
        b=IxSfOVFknrpG1XmVWC0noUerxJBVLV8lFcv1qNkwf+M/dp89FyEHXqNNodeJ3OSa0l
         y1b06Eu+rMAaJKgU7Jp0/9VEHJF3wTyAfeg8K9pMMywPdsbHjv4pY8O7JtH7cQbUPOWi
         YRJW29s7NmAvXa72ucfYe9+EuTJ26ugmAX32FPL8U0K5gR/eVqLYG/3FReHdW9kfrRij
         yLSBFcyuJ1OkYUP/Iblo6iU9G21nvvzb0ym3JmzUFTFlraEmABSzoH5IEZR7ACkoX3zh
         UhKKKENnUWxxz2nxnbWF60nm6hDIxmwazstrpUBSvxPIqnf+K+vTIXE9xNxFMQ7l/ZKV
         DOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987230; x=1755592030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTgIYPzRiaE3tZSZCUJbaKi97GRLZz5syZCli9/nEr0=;
        b=f9DWkykuS0LX+hQwlYU0Ba1OE5ozrT2nZw21olN19stYjYdpnBc+2voIgPYM7BQRky
         UPhGx9yU40sDchyxzP/tlPwfsskVUWsCYiPhfqZg7ke0UiLQAhbVU8s5BTzmsSTgNVMn
         0uYGNB68AKl+ZjzsQk9NrAtSikhdcHnsPZGE0QTzJgzYSdqzZm0q2a565iQ/sbqCdCok
         aLXmjs8Cr3qsiv4sAtBXpN0MbUGU5tkkvwLUgayAZRr7+bqHtllPcwxcDt1PsKqzxpkh
         1EJg1i3+yQ75arwCBzCL3imM2Fu3BIPTuAefezitaGzw82fPC1DCnTJkZGHs8Fs7+vcZ
         AF+A==
X-Forwarded-Encrypted: i=1; AJvYcCUx/l04ln7az3wTBEEmhtMwebQP6a57zyKFQCZ/DNthVTO4FH7CnZsZgkqd9BZXW12UasozMExxHXcbsTqjhlH1@lists.infradead.org
X-Gm-Message-State: AOJu0YzP/QZtSoXCDg57WrcSb5fdPF4a5p6S7iIaB8Gi/MggdbGLHNZr
	XabFbgebtN9KtaoF6LpxMZwGPTVhE7lwHG9KL15dnp4dPENgvuZqeQYxvmgqJYUCsG8=
X-Gm-Gg: ASbGncuHuGohtYnzM+Nxyumo0aa8pTi6hDHBF2fyWWHP6V3iqc2P1Tn+hfv+MQ6zcIF
	XIc0IIIXmLrao31ZbyY8mygEtnEOSeJ1pZE8xI4ADk7u3pakM4IwUaxE2VjKLe4hed+HgjL9ZCK
	JIQ74VOxGIupWI4bJRfXT2fJ9OCVIE0BzenwRU7GTqjFznczkNUSrg6vvunhZ27DyfqZQLLFQ3b
	AdW4I0m1StERpd80kYqV1mxg76B4ydXPqxEQJmDfPAoEIhvv+1T86tAB6jo/fqzHdn2aL8h2dnQ
	fut1mVZFirW6KoKJOZ5s8HT8/nJ0wSZoVNBJFiYsKFYC7DSi+Q9kM6qgzR4FoIWYpTxRxPOGzKU
	NX3/Jkx/12UjfOf0=
X-Google-Smtp-Source: AGHT+IH2gcGBdQpuT3RXzrIq10+dePuK4J44tZFpcWvxuc+mjI/75XhCe1aSLOq9Ow+V0+SkeWNRig==
X-Received: by 2002:a05:600c:1f0d:b0:459:df07:6da4 with SMTP id 5b1f17b1804b1-45a10b9b16cmr23623335e9.5.1754987229745;
        Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:00 +0200
Subject: [PATCH v4 01/15] devres: provide devm_kmemdup_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Igk+yDN8BP1JkTjLlRhKQ7SRJ5My7JH94ZAwq+/yocg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrWHo270jKNT7TR30vMTLvJtquAQ8DkFhjQc
 ewt3zLD8DaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61gAKCRARpy6gFHHX
 cjXuEADPonktCGWYlKywp9d3HO63lp5DL98Fa5df96en6tECd7hEXtS99i9LAByEf9gB+XIzpYT
 bn7HKsMznjan6cqY/js2/PmDrnfrTaS8GMTWnnVOxndSGotuSFmQ3zk2ssQIvblDxvtxEK/VfWs
 Xorx6opZLXirGk7awxEDwydn2R24ZBfAv4HNzCaPxdZDR5jPuBK3Y2Sz9Z7zxOLkgCA/dFSI/VC
 EiaB0QwENlBXLbDTWm+FBJKFkgyLBaaelM7rRmgWagtEkB6QDH4aDB2BeQn46Fwrx5thDVEjHzS
 fyE7pWZD/eVoSgnClKMYjtwFSECf860vmV3a0SYw2OQWjdtR6GDu3H9s05ASNdUyHuSY4YiLG9n
 JVpnETaTHpb9lSDi3vb0asDKaLIcBMaBkG4dWOWsNqs5Z91/qSP1KRMVbnpNI91WMeQ2as7u3Cd
 m8zJYNga6cC9JfwhC+54Q4ijTmVTGa6tqyxkNqWlsEm7M5jjCpIRR07fAODaqKv3MIgXA//89QS
 iCwpz0h208VuntqHpkRusRFTEDihMX9aqBRpvGkYLphyCcDXTK5bT1bOhByWDi4UnlmkZGRK8C5
 Ciga46g5hgKGVQM1Nkkit1mjBI1xoc0CaHoC4+KXTbzTIormwWsZBSPMKWcYUwOzlpENKo0Z34/
 nBWlmLjGY27IFaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012711_864213_AD7EFF8F 
X-CRM114-Status: GOOD (  14.66  )
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



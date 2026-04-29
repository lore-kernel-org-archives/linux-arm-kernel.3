Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24FDFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=; b=UDvwNM3kOOKG4ymdEiQBdQtU9V
	DdL1wdGkdWhNLiXrv9Tn0tp3l9+pDaRFr+ljAfxnT0IYzEia0C9Vjjik1xPNgSProYmeE9fYHfCmV
	kYLJv/cDOMLuzua4Xs2spjEGxwcpriBKwRx0QZcUgUrQOWjhFsQdRcyLX+tbgorW7Yob+gJWWjTvJ
	R2NRDp/UxhaqMRxiyaW6b/+cUbxofiWYl3/xPKF+RO44BXI2RMGouqgWL7vaLdz+Y7KpbiSnKdXt1
	CpNn8h/YBZAQbeJaJLpbb9qhAwg3lMX6Y5l2IZLuzK9fPkgoc8eTZgfwX2g5Wof4+GTXjoA3j0ljT
	tsP6AF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHysr-000000034kW-0hvj;
	Wed, 29 Apr 2026 06:58:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyso-000000034j1-3qY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:58:56 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82cf636dac8so5271533b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445934; x=1778050734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=nsEJ5mB/HDCQXlzzAn9y5EsmXCnjyr8VV63WScD0hcMSUjJKj3EqpqeK4JEXoFuxFj
         uc871exGbBnMLI+nmVIo3hX5d94AL3B807EVbmn9GbXjc6nQCBLQPg/YjDlr004ax6Jz
         /wLg7yK+nOZYq05EV18fTZ6ePdNMnNtTW5DJiwDR9chq+abKSBLyIa5VjUaH08EvGEiP
         thxRkq+VGCBrpnyNWPqwc0XjA8Sbt8+ZZaPTYjO7tPwMkjPZpPtL1PpLtd1Bpq2cNa90
         EWth8KBzj6cXE5ZtbRp0lMGCJlkDS80lefKXgTuS5U1qiU5P0zuDcQu6iXlmjxvpw51v
         l+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445934; x=1778050734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y02uBvZORLsA6xImd4974JLfXXgs5mmuCn2J28MpgzI=;
        b=Cwm+zRnJ1w9byii2ubu0aNNieQ/zcRZ39LIy7l9JfZAdHempm9/g4bk33T+n4It8e/
         20FfKCC/Vi1j3l18gMQGiFQwWQ8huZ/pM28dSZzyvMUWX/8qpTJXTyxv2MNqDCeAk3C6
         8qr2hedol06KkeZqmuehjDYKz/Gki/Us2fS2fZ92XIskfMY7aOYk0VqS5VwRR+RmLkrr
         1znQndoyYFgFffEWfrnmJLM41xG8OhjHhyS3+Vit7w/AIVobNR4DS9+iEiLs+Hmdn7V/
         dtDvblW9uw/iX3mpSOz+WD3i4bgpD8PWyNYsai+zIunSsLVe99nx0erFa01yKXrHkCEB
         U+PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dK1QnFnm6PYX2NU02SLd3h7b7vWTFk6r7SBW434Ozrq5fOSpG3AqCfPMFJavVtlf2Vtw6yu9HJD+7fnIBiXJk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1nppc+VGirLpQjj4xGbsfx4XiGIXOiVfwLdwEdssq+x3CqfXw
	qftvg6T4le0HvejtU8tdszsGJA5lnB9cHYiGoJ8wThmfzKf5U94nfFlA
X-Gm-Gg: AeBDieu1dtZkkcKNmMY8JWCokr4wEh97CNBiZEofrNIl9RImW0Qxht64lif1fd0gQ9g
	GLc2W+6qzy+n6IzAfRn/cfTBpRLim/nHkxLzCm60cKlpQjtCJJ/DPHXI1rTrnnSujbWeOA/Eka+
	hbfdMdCMSNgS2ABNg3hwY2SF/PiSdifnfqMYUNMa17GX3+D4sQuox2XCyfg/0mUo55aDt5Nf/90
	zfjcFWomo8Xq/mh74G8YC7xpTTDp8L5S7NKQwh1xaQYwFazJJU0bMGTFRIZle4YUfEOwNFaY0Je
	UDhHQABJE545s8dU299SeVYTFx+CHEKVrGBcyQ2NiL6MH9d52yNnOwSslIih3uPhkHwPAZ9NU0J
	z8p6ZBlodTAWUQV3EZZ1EmS0Y5A4RHrnpZkIEx0biZvpKoXWkT+sNnhanXdkrplBjCcScwC5Wrz
	qRzffrDbX/5DXpi2g13jHKl6/1rmCNgY/SXEWZkIgtXVJ8sxyk
X-Received: by 2002:a05:6a00:2d85:b0:82c:dd31:b83d with SMTP id d2e1a72fcca58-834ddc5879cmr6667128b3a.38.1777445934284;
        Tue, 28 Apr 2026 23:58:54 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:58:53 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 01/11] of: reserved_mem: fix region count for nodes with multiple reg entries
Date: Wed, 29 Apr 2026 14:58:21 +0800
Message-ID: <20260429065831.1510858-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235854_965174_8D7EDB4F 
X-CRM114-Status: GOOD (  20.44  )
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

When a reserved-memory node contains multiple reg entries (e.g.,
reg = <base1 size1>, <base2 size2>), the count used for
total_reserved_mem_cnt is wrong in two places:

1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
   many regions it reserved in memblock. The caller in
   fdt_scan_reserved_mem() then increments count by just 1.

2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
   only reads the first reg entry. Subsequent entries are never
   initialized via fdt_init_reserved_mem_node(), so their metadata is
   lost.

Fix both issues:
 - Make __reserved_mem_reserve_reg() return the actual number of
   regions successfully reserved. Update the caller to accumulate
   the returned count.
 - Rewrite fdt_scan_reserved_mem_late() to use
   of_flat_dt_get_addr_size_prop() and iterate all reg entries,
   initializing each one via fdt_init_reserved_mem_node().

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 37 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..9d1b0193864c 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -129,6 +129,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 
 /*
  * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
+ *
+ * Returns: number of regions successfully reserved, or negative error code
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
@@ -137,6 +139,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	int i, len, err;
 	const __be32 *prop;
 	bool nomap;
+	int reserved_count = 0;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop)
@@ -160,12 +163,13 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 			fdt_fixup_reserved_mem_node(node, base, size);
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
+			reserved_count++;
 		} else {
 			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 			       uname, &base, (unsigned long)(size / SZ_1M));
 		}
 	}
-	return 0;
+	return reserved_count;
 }
 
 /*
@@ -275,25 +279,32 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		u64 b, s;
+		int i, len;
+		const __be32 *prop;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
+		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
+		if (!prop)
 			continue;
 
 		ret = fdt_validate_reserved_mem_node(child, NULL);
 		if (ret && ret != -ENODEV)
 			continue;
 
-		base = b;
-		size = s;
+		uname = fdt_get_name(fdt, child, NULL);
+		for (i = 0; i < len; i++) {
+			u64 b, s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
+			of_flat_dt_read_addr_size(prop, i, &b, &s);
+
+			base = b;
+			size = s;
+
+			if (size)
+				fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
@@ -331,16 +342,16 @@ int __init fdt_scan_reserved_mem(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		int err;
+		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+		ret = __reserved_mem_reserve_reg(child, uname);
+		if (ret > 0)
+			count += ret;
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
@@ -348,7 +359,7 @@ int __init fdt_scan_reserved_mem(void)
 		 * or marked as no-map. This is done to avoid dynamically
 		 * allocating from one of the statically-placed regions.
 		 */
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
+		if (ret == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
 			dynamic_nodes[dynamic_nodes_cnt] = child;
 			dynamic_nodes_cnt++;
 		}
-- 
2.43.0



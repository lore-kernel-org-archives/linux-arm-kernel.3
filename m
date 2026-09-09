Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE94C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMNRBrD0F/WKo6JW8olq+4AA/+XHmQzaw6FHgnonGCI=; b=szZuOfpG7sKtklyM8Mipx8nsjq
	S/ufQyWCU3SaBAaRS5zTzbU1fyOLNPMvIfeXrtmD3jXR8N1vLNdoxJG6LoGVL3FMnytPpx/UVCu4U
	AnySsJYYn3BbU3+ekBCqL+rgoQq5epZlJ2Zhs704m9okMoszKoQAIbjztdf844uH/Kb4bLPrtLSri
	rxNLpLBm2Ze4kHInOgwDhyuB5byWr5f1W4slvU8Xl3/hcNYVrl5bOeD+aC/5ZXQVb3haWoREI2avR
	FW/nDmKUN1J6wdK1Ww1UdRKGhcb7ZqQ/ggfq9B0o/t1xzRpP7vX4uoVO+6qQ0tldeeel12WDmmTx0
	SWbxnhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JJ-0000000AVC2-0HXK;
	Wed, 09 Sep 2026 00:37:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JF-0000000AVAT-38R0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-39682983a0fso5743594a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914225; x=1789519025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMNRBrD0F/WKo6JW8olq+4AA/+XHmQzaw6FHgnonGCI=;
        b=RJnDoiHCFjOymB11PDl+k+WZ90Oaxsb2kYnxEts0cyvMHoB8SZ5seXDfK+DM5awODM
         GJtIq4lbpYYvjwpY8MSiuzFk3BYfzoyduB5TwMVCwxVfC+tp6UmSicy5yguRVeHKZEeL
         FhnEE3jx1dloaj4bMCaRpF+Z++fta2NKbUyWG3xFQ0K7c6pQ6gJYXlzHS7aSYu/a/3EI
         9wuC/lW7ACU3uZtMkIDz+7bJN/+2tJ20A2Q597GJd5LV+G5lyG698Qa7Ca+Vtug4oRy1
         tuQliP7z+bnUuM/FrQVfRtZk/aPxwbuuU8TasgqD699GuU19d48DLFe/f/xwuttLue0J
         LHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914225; x=1789519025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMNRBrD0F/WKo6JW8olq+4AA/+XHmQzaw6FHgnonGCI=;
        b=jlgWgAzyBs/in4ZUveWLDB5PMW8bdzHQh31lOyJI+nEd8Os2weGqAgz7xLXmnMIVlY
         /2gMa5eKKsNf0fqkDNJ8XxYMdkA8yyMeYq0V3qmkSf3FGM/O5Vdz+w7t+3goFqQgS4ND
         GtbBI9TGfYfBg7IocUEdzcJq+mzGPyftkxJD7r7TjUhGVknqN6ONYLbL+Ck7FxuRGuy+
         +71YnWghfuGwx9Khc6bG9QG3JR1MzEkfKH4J96queoWk6oy4M+OT8CPnPNb49WNodDGc
         ufwYK1l2njpOYndFgpdpGPxCTWtLXsOpR0bbNFf+fjVdg7o4AyOlMAtLLshqPYD725zj
         i3Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzEGVdaJsObCZMjVnKIlafzrR1HEHsY/+s5EPFM7mkOezUc03iwpUxIFN7s7NwzVKShjHSgPesyxNZG59UsF0xz@lists.infradead.org
X-Gm-Message-State: AFuF++kwhOnKN0NOH8Da/k592LrOUCNzphbWQg2GMfEf5qGEyrzzvr4X
	zobmNsIW6mn1YHv9A3LkcegFeF2HZn0oj29i7gYtoWfq9BcAMFf6kZiy
X-Gm-Gg: AYBFou1xSpvn76pW2bUJ9UAawvXmHX9zOZf3xZ1k7ZcsStD4FTEA6ZEOIWR4lhscyHf
	hyrTbZZshsx0L+TqiT9gO25tcSXHOfWvNK7it9ZNwAb13kmyRftM19fpt613pbvqS7KHm5H602t
	cxct3I7ll67GMO3Smqye4Dge40Dfb673QFZ48ZKNEPw2a7yIT1HCKQWUlHbYXRJPqcGwP1v+wy7
	z3A2B2WyZElrwCRWJfSznW65OP7s2cipmGYpRwdoObIV/P2vkv8aq4EhRntdVkMwkCuqGf0zLlV
	VK2ro644bE4UdNhsr6MeGFB+GuUje+qjJfOAjr4fERrTrDbETGpC4BIi5ZJ0FkZMzXj38gHxEYM
	JDkhJtGnrjsoM2LPmjp1GQVn7AsNUe0X3RKYSx7n4zOLoZK7IWnLluSCjitZUQS9heFmQz08VXq
	cxhZwLPKTZ7cvyMTb2arsMcMBfeutSmaBEY3fs9TdaCYdQvBath/o3viUF5QFmF+L20y9TXJ8=
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr46556851a91.13.1788914224691;
        Tue, 08 Sep 2026 17:37:04 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm29006878a91.15.2026.09.08.17.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/9] crash_dump: Fix potential double free and UAF of keys_header
Date: Wed,  9 Sep 2026 08:36:43 +0800
Message-ID: <20260909003657.1570544-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173705_856397_14CB0718 
X-CRM114-Status: GOOD (  23.08  )
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

If kexec_add_buffer somehow fails, keys_header will be freed. Depending
on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
following two problems if the crash_load_dm_crypt_keys is called again,
  1. Double free of keys_header if reuse=false
  2. UAF of keys_header if reuse=true

To address these problems and also make it easier to reason about the
code, keep two invariants,
  1. keys_header will always be freed at the end of kexec_file_load
     syscall except during kdump image unloading for CPU/memory
     hot-plugging support
  2. There will always be valid keys_header if reuse=true

Since dm-crypt keys are sensitive data, always wiping keys_header
can also potentially reduce attack surface.

For ARM64, because of commit 108aa503657e ("arm64: kexec_file: try more
regions if loading segments fails"), keys_header should be freed before
retry.

Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 arch/arm64/kernel/kexec_image.c |  1 +
 include/linux/kexec.h           |  6 +++
 kernel/crash_dump_dm_crypt.c    | 68 ++++++++++++++++++++++++---------
 kernel/kexec_file.c             |  2 +
 4 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..1a0ca54adc9a 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -110,6 +110,7 @@ static void *image_load(struct kimage *image,
 		image->nr_segments -= 1;
 		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		crash_dm_crypt_cleanup(image);
 	}
 
 	if (ret) {
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0af8ae4fdd08..82ee550e3cd0 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
 static inline void set_kexec_sig_enforced(void) {}
 #endif
 
+#ifdef CONFIG_CRASH_DM_CRYPT
+void crash_dm_crypt_cleanup(struct kimage *image);
+#else
+static inline void crash_dm_crypt_cleanup(struct kimage *image) {}
+#endif
+
 #endif /* !defined(__ASSEBMLY__) */
 
 #endif /* LINUX_KEXEC_H */
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index c685497cd470..f638fb4b8554 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 	return r;
 }
 
-static void get_keys_from_kdump_reserved_memory(void)
+static int get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
+	size_t keys_header_size;
 
-	arch_kexec_unprotect_crashkres();
+	keys_header_size = get_keys_header_size(key_count);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header)
+		return -ENOMEM;
 
+	arch_kexec_unprotect_crashkres();
 	keys_header_loaded = kmap_local_page(pfn_to_page(
 		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
 
-	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
+	memcpy(keys_header, keys_header_loaded, keys_header_size);
 	kunmap_local(keys_header_loaded);
 	arch_kexec_protect_crashkres();
+
+	return 0;
 }
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
@@ -286,17 +293,28 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
 static ssize_t config_keys_reuse_store(struct config_item *item,
 					   const char *page, size_t count)
 {
+	bool val;
+	int r;
+
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		kexec_dprintk(
 			"dm-crypt keys haven't be saved to crash-reserved memory\n");
 		return -EINVAL;
 	}
 
-	if (kstrtobool(page, &is_dm_key_reused))
+	if (kstrtobool(page, &val) || !val)
 		return -EINVAL;
 
-	if (is_dm_key_reused)
-		get_keys_from_kdump_reserved_memory();
+	if (is_dm_key_reused) {
+		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
+	} else {
+		r = get_keys_from_kdump_reserved_memory();
+		if (r) {
+			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
+			return r;
+		}
+		is_dm_key_reused = true;
+	}
 
 	return count;
 }
@@ -369,9 +387,6 @@ static int build_keys_header(void)
 	struct config_key *key;
 	int i, r;
 
-	if (keys_header != NULL)
-		kvfree(keys_header);
-
 	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
 	if (!keys_header)
 		return -ENOMEM;
@@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		.top_down = false,
 		.random = true,
 	};
-	int r;
-
+	int r = 0;
 
 	if (key_count <= 0) {
 		kexec_dprintk("No dm-crypt keys\n");
@@ -424,14 +438,17 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	}
 
 	if (!is_dm_key_reused) {
-		image->dm_crypt_keys_addr = 0;
 		r = build_keys_header();
-		if (r) {
-			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
-			return r;
-		}
+		if (r)
+			goto out;
 	}
 
+	/*
+	 * keys_header will be copied to reserver memory later and then be
+	 * cleaned up by calling crash_dm_crypt_cleanup at the end of
+	 * kexec_file_load syscall or during re-try load_other_segments for
+	 * ARM64
+	 */
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
 
@@ -441,18 +458,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
 		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
-		kvfree((void *)kbuf.buffer);
-		return r;
+		goto out;
 	}
+
 	image->dm_crypt_keys_addr = kbuf.mem;
 	image->dm_crypt_keys_sz = kbuf.bufsz;
 	kexec_dprintk(
 		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.bufsz, kbuf.memsz);
 
+out:
+	is_dm_key_reused = false;
 	return r;
 }
 
+void crash_dm_crypt_cleanup(struct kimage *image)
+{
+	/*
+	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
+	 * keys_header from being cleaned up during unloading when
+	 * is_dm_key_reused=true
+	 */
+	if (!is_dm_key_reused) {
+		kfree_sensitive(keys_header);
+		keys_header = NULL;
+	}
+}
+
 static int __init configfs_dmcrypt_keys_init(void)
 {
 	int ret;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..5609301db0bf 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -140,6 +140,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	kfree(image->image_loader_data);
 	image->image_loader_data = NULL;
 
+	crash_dm_crypt_cleanup(image);
+
 	kexec_file_dbg_print = false;
 }
 
-- 
2.55.0



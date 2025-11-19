Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8409ACF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=; b=MOx2biLuuL63JgtUapnpCfPqo9
	lwxZY0MMEoX7faBa9dHNtvZqGvggXT1l3emaqgjB9aw8w0V+LDsbtqDnFRRiZ+ZXvevsG918FK9E5
	iGB134iUWQxgzqtQ6OMyxdSyo7FJ5Ur//IRxpXMyw40dkKtJCnvVo+qmGjWxwNg12F3TzWW48a0hU
	muHAnZE/Srxb7iwnGNT480qm9MiuZndSuMWzOqOmpz3hlQE9ycIELoTfEU8rikVcUE7QjTMUZNDON
	YfFnapUCRclfOohEiimyD4PntFTELRchCEFIS22MlwolnyEH7+ZLf1SaTn44BTKUKi70nmTuqKVd8
	fTb1P7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNd-00000003WhA-2Jl1;
	Wed, 19 Nov 2025 15:46:01 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNS-00000003WQT-1YTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:52 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5589478f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567148; x=1764171948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=ES7hBCOY6ckzXARoebTOrCC/0eQy1Ghd4DdROpYwHr6FyUGoB1HXpvTZA0FETUf+TX
         lY5SusStYrSHSJEs7uXdSIZ0Hn5TQmflOSMQtAYwzaieXlTeIBU4h4QXYTuro1vGDDCY
         FDClvkxVJK/7QlQggW/STdpKXM3UbQf5BhjPOL0ZLW5W9yD3vIN22BKdDluyveBv+E4F
         Z+1rWnmKBxl79qnLE7LNaVgwBt/MFfsUtxnJRPQQeEYVUj/cXgEZImdQQkHRIvXAq/+l
         FILFlspwMBYduKG9nhBFfpj4CIt7YCJnsoAfdFjcApbQr+fI3Wz/wxtB8wjji8tgjJHX
         VAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567148; x=1764171948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=OD6ahwaYmQWMB1KBk/uZMWqZECtci9lJWanLPjlVfxsimyqE+i0GEuN3gO6ao+Ls6N
         mRz1fpDMacr4YsCnbUF6HSMSdBxlc05lipxc+aou+8D/CyLIBv0r05V0tYZ9R17xlRbg
         DhAsjrN/YgdPob6xaDZ5yXZ0LjMGeL90XEcQkzntq04jNkZ5aoYL4Z9TUU7TBEAa6FYQ
         T6VIzu0McBxJlcaVjslZjMjp8kCMbjceI/1YJ0/Kf7L6wKo35FDOUFo7NGneNvh5YQe3
         3PSVWeRB1AewCM5blIZSpI5dblA5YaAcoS+suTcFWIdoKMU9ZL1ZLFRf4YKZqOYuwvvG
         zz3w==
X-Forwarded-Encrypted: i=1; AJvYcCVLgsTxE00HxMyeJodG2t4k8JuYe3Gaec7KTGkiRSZnbFPzZoDFgOKHu994XQJgClUpICc7Z4XQgrIADEb54Uh/@lists.infradead.org
X-Gm-Message-State: AOJu0YzzC9jX3MhBUzdtCPPBehoMiYxrdydtvW5riV521w9B1UEvspr7
	ZItB9eJE/Dz3oXzPIQgDgjITaGEMR0WJRC7zQOHRVqIGPrGJ/gbd4QSViirgGEAbq30=
X-Gm-Gg: ASbGncsX/6nB63KfxSdTr9ViyBBZ93JVE9BceM5Pj9jBOR8p/GWmHOAKjoqsrjm0aaZ
	vQu09cAX+nc4w4dMNVmAIoROL8qtmTOSpbqyN19p+nSXOy+pvhnHhI7ZzmgTHCHUwjhGOwLa+5K
	U67CVVVBqRZZ0KYOLVSzA46gptgXXQfsJFc092dKaNFXhKJpc03n+HKeHIlsLbBaVrXfBZeujSO
	L9bqYkC0CguLa42HUd9DVdzJqIPxPfip4lSsPvBu4DLsEcOrRLBUsQggQw6wS3DBhoQUdvzdvqm
	zLO/vMsIysKEPe35ptTunOXE0uhP1FFF61dnL8/28bQyn7iFiirOF8pXX1rybRAJwK+LCfu5kWC
	/uvsL5B6mNPw2htoBy8cHDWgKQRgnxU66kkkNyn7R014ixyL9hCga6EbdynALq9fuDR6/LnkSSM
	JIiALTiUTZsUvCsaEV3J8=
X-Google-Smtp-Source: AGHT+IG3jCLeDmXIRQk0s6Z/im1uj+pkHlGcqCZtyflKDhFiJA87zd6Y92IL7f4uFHeiMPUMai5jbg==
X-Received: by 2002:a05:6000:64a:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42b59378468mr19534486f8f.40.1763567148170;
        Wed, 19 Nov 2025 07:45:48 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:47 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Date: Wed, 19 Nov 2025 17:44:19 +0200
Message-ID: <20251119154427.1033475-19-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074550_477308_D86D9DFA 
X-CRM114-Status: GOOD (  16.77  )
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

This memblock flag indicates that a specific block is registered
into an inspection table.
The block can be marked for inspection using memblock_mark_inspect()
and cleared with memblock_clear_inspect()

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/memblock.h |  7 +++++++
 mm/memblock.c            | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 221118b5a16e..c3e55a4475cf 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -51,6 +51,10 @@ extern unsigned long long max_possible_pfn;
  * memory reservations yet, so we get scratch memory from the previous
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
+ * @MEMBLOCK_INSPECT: memory region is annotated in kernel memory inspection
+ * table. This means a dedicated entry will be created for this region which
+ * will contain the memory's address and size. This allows kernel inspectors
+ * to retrieve the memory.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -61,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
+	MEMBLOCK_INSPECT	= 0x80,	/* memory selected for kernel inspection */
 };
 
 /**
@@ -149,6 +154,8 @@ unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
 bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
+int memblock_mark_inspect(phys_addr_t base, phys_addr_t size);
+int memblock_clear_inspect(phys_addr_t base, phys_addr_t size);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index e23e16618e9b..a5df5ab286e5 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -17,6 +17,7 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_KEXEC_HANDOVER
 #include <linux/libfdt.h>
@@ -1016,6 +1017,40 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
 	return 0;
 }
 
+/**
+ * memblock_mark_inspect - Mark inspectable memory with flag MEMBLOCK_INSPECT.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_inspect(phys_addr_t base, phys_addr_t size)
+{
+	int ret;
+
+	ret = memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_INSPECT);
+	if (ret)
+		return ret;
+
+	meminspect_lock_register_pa(base, size);
+
+	return 0;
+}
+
+/**
+ * memblock_clear_inspect - Clear flag MEMBLOCK_INSPECT for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_inspect(phys_addr_t base, phys_addr_t size)
+{
+	meminspect_lock_unregister_pa(base, size);
+
+	return memblock_setclr_flag(&memblock.memory, base, size, 0, MEMBLOCK_INSPECT);
+}
+
 /**
  * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
  * @base: the base phys addr of the region
@@ -2704,6 +2739,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_INSPECT)] = "INSPECT",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0



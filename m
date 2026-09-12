Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F068C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwiXawn/cOlpKopFTshA1Oy47KkInxpQCTdPgG/ctyc=; b=P4b28bpbzdRn8fy3IZNpOwX3G7
	jJaj9OBB3XqSmjAZQf/3GjgoDzO97vj5DugQWFAM47nG7cubbm2Ubyc6gG0XvdpdhLwyChEKvPoGc
	g1mKZ9pF+8ChPEzcZweGVpLZb+w7tOpJheIT1kIhxW2pvOZLAaAkJcDYwvnRr5pAd33+sz80/Soa3
	2JmpB0Cd+5YdPCKTsra03kIEugDkMFuOyarXdZ4H962oYfVGD7mpCXDTlBoQiF7RAgJ5E5KI0LqDT
	9F8DK5ekTb+c5vUtjBlWVXabwfC12JQ3JQzJchxWRXEg8O3JO5UACnqpSwx4CSWvy/SB4jS0PqZ+G
	j1f0x8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpX-000000017uZ-2lOB;
	Sat, 12 Sep 2026 19:56:07 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpR-000000017sA-2KSQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:56:03 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso10924395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242960; x=1789847760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwiXawn/cOlpKopFTshA1Oy47KkInxpQCTdPgG/ctyc=;
        b=dIKATs5DOwgWm32RG0u3GO3jSo+mqIGywUagl6yMcwj4MOwEIK9wq1su3jTlYnOrgY
         fSXO/J3cEhEzmGqg/3YfvaYyvmOxhN0rzdWrvNDUe7dQvV3wGVbRs6oDD2JEhQD3j0bm
         QIef/3jH8oV6ufAXr1fha83N75xBwnyLpKQZS+XEwCib8QpcGSZj1hZSeHP7Lhd0Bz7Q
         lWTlsjAyW19aKC3luLdYs1+cTHNs20tL5gODUMLkDtyn/HLfI0w0q2r5uD4/RtjONj84
         3VwsrzbRvsry/hVfakAR7EN2ZipT0D308ae0CPDXGy5u1DFojhJd+hxpsRyblTN17Mjd
         JRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242960; x=1789847760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwiXawn/cOlpKopFTshA1Oy47KkInxpQCTdPgG/ctyc=;
        b=ZoAIU0aMj9Kp4H/HlrtHJJpvr9t2slFpWf4uXwuE4g91eQgbDY1AOyl2QNTrDv5OdQ
         OmZT7+casP9AMaVs51cdn9I64AlupABDltZtyZtdFl/H8lgCcMZYO/8ko3YTfVtkuMRv
         3C2tBSpQSfTg/bds65TD/DTfphYNCaDSnix7d8QjKC7ndA6sGNX6qaNnqS4NZMBwfEcZ
         Obd7SXTUONCFbjVM1w52tap62OBgjFvcMqhh2EEitPgB3yOwykuROcJk/8JIf3jcU4fi
         MCnJ7yrjOJtTxaWlYj+ghFLeDnKSyuJ1DNYRohj/qOvQG6oNqQR9JIk6k1dDvlgtbo7f
         e1HQ==
X-Forwarded-Encrypted: i=1; AKwUvByyYMLo9r6xZVg40qEsvwzYHDYmDit7L09+YwSRFGV0bT2UH6g6pyifFjF6eNQO5BxO297gBxDbdEbTWzXpCDd3@lists.infradead.org
X-Gm-Message-State: AFuF++k3CqdDeSBhswgUL1ILhbfayJIKAmT1LE8wlWbF3xakUD6axlg5
	NJgkfT1z98qBN+D0HUaa7cQLpH9dgFYvX1rYbkQKeXYn7rruEcUIKm8o
X-Gm-Gg: AYBFou3V/Hi9LK3wzmkEKSnBMffF85uFz4hnFuhfMX4KNOQjbxqK4XWtjAm+UzG4ruq
	98VmDu5Xu/19Zqb3sGNXh3O41VPSpXOjkIKMuNqbHw0GRqnq4ivqnDYPP+LHtlh4Zq29nZyNTMJ
	hKxVnZ5L8eD3Vo2k7JRQ4Ec/6BaoHqNSZ25KF6AXu0m7dsRhmmO2I8fmGeQk+mf6Ib+dc+oS6su
	Bqi+uLPGntzppKG0CI3POzJw2uQu557hcfneV3E7Qo779qG1eQAbUUpHhUvnKBpZWIkkfKoWKFa
	ssh82wfhJrUxPrb7sMWvwKvH3padm4ZZN0dfnEECjnenbnuqmfpkim4p7K7ZfYW+/9BsxYQV//d
	F92CkQh1jBe62GQu1KIW44PibJtkR5+2UWmSBMbA3EWtPB8tlqvgl3OLtORvZ14gC+48ZxjTwYF
	uEx/D+xTlTEI8B6Wic0okdL7aQoDqDF91KkUVNiwer8JDIUiHTTUem8q5r7K7r6Y034CY0ImK0s
	BriySQUQOiuXTjrv1GoHAMKgm+4c6Zan4mL07arJa0eCYICoC8YE+5yXJTkGEIy4pB1WISImVBO
	Pyh9aIIZ6AE1KbFs5HsBhaISRhFoorcRP84N6EOiI1DgSvK0+h9oKPw5ga+rsOqn+NUdA1CFdeE
	q/JyD+fA=
X-Received: by 2002:a05:600c:8b38:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49e619a1e56mr222951175e9.2.1789242959747;
        Sat, 12 Sep 2026 12:55:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:55:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
Date: Sat, 12 Sep 2026 21:55:49 +0200
Message-Id: <20260912195552.76673-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_125601_613910_AF5EE6DB 
X-CRM114-Status: GOOD (  14.63  )
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

populate_cache_leaves() advances its bounds-checking index once per
cache level, but split instruction/data caches consume two entries.
CLIDR-based allocation supplies enough entries. Early allocation from
the device tree can supply fewer and expose an out-of-bounds write.

Count each written leaf and stop before a split level that does not
fit. This prepares ARM for DT-based early allocation and matches
commit 875d742cf532 ("arm64: cacheinfo: Avoid out-of-bounds write to
cacheinfo array").

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The overrun was reproduced with KASAN on QEMU virt, cortex-a15, using
a device tree whose cpu nodes carry only d-cache-size, so one leaf.
With patch 4 alone the boot reports a slab-out-of-bounds write in
populate_cache_leaves(). With this patch the boot is clean.

 arch/arm/kernel/cacheinfo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index e1469b641780..860eeb03cfe5 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -151,7 +151,7 @@ int populate_cache_leaves(unsigned int cpu)
 	unsigned int level, idx;
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	struct cacheinfo *infos = this_cpu_ci->info_list;
 	unsigned int arch = cpu_architecture();
 
 	/* CLIDR is not present before ARMv7/v7m */
@@ -159,13 +159,15 @@ int populate_cache_leaves(unsigned int cpu)
 		return -EOPNOTSUPP;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
-	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+	     idx < this_cpu_ci->num_leaves; level++) {
 		type = get_cache_type(level);
 		if (type == CACHE_TYPE_SEPARATE) {
-			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			if (idx + 1 >= this_cpu_ci->num_leaves)
+				break;
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_DATA, level);
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_INST, level);
 		} else {
-			ci_leaf_init(this_leaf++, type, level);
+			ci_leaf_init(&infos[idx++], type, level);
 		}
 	}
 
-- 
2.53.0



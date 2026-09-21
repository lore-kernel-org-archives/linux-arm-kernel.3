Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA16C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbepAso+XoZVkbrUUQwUCzv4bigxo9mSvnxXnLcpRMk=; b=h0htKD7DtGGHRWmcPMdi3pwKmx
	yP45xSPi+kJ6mGoj8s2YPXk2yHm2yGVgCUiwLNvKxrcee6faZ4a1c+GgZCO0KppIl4UX8MqUtvDnl
	t7K6KNz8pA8pqY5CZtKbB95MueTjrtNqeAHdstO2keV5UvHyhE22+SZRZVfLFO/0E1rnlhbLI/3Dk
	AqreG1pz7IWKi/OL+Eh7Nj1PN1mznAaO5VrDkhbgfAz5wlu54RSk/BNg0zc2szZg+9oH9U5PalwjJ
	PsZYpMRo0lbs9v/0T//XeTsVY+D953JehKBhlIt4dSTTQeTaReAG1REio4zuYdN/oofnkh5Mbetbf
	5QqkkMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4q-00000000z6Z-2Xy0;
	Mon, 21 Sep 2026 06:00:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4o-00000000z5e-2UMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:00:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so12599315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970425; x=1790575225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbepAso+XoZVkbrUUQwUCzv4bigxo9mSvnxXnLcpRMk=;
        b=StphgReQqC//zUEamSySiGfSBR9Gd710hZCNQAPT9lSR97N0D0Yicy8lu4agSpKLXU
         w1QAklrCcN50Not2FJbf1CK8OvWFamS+ETTfi1WGGdtuWbtYjgdBWDcCD35lF7Dvtibz
         BLw/A1zY+GsZV+LozIL/drCcSUb5+/oZRzRTFzDJcc4erfv4zHE7FjVZKGXmXQgAjSC7
         i9ii3sBQieDrJaGphaEWYgcr+dkkDgYjtJJWzYujPezubebuPVsxDLmFAW1xjSRNGE2a
         mFtos5Nkbwm56ZpHrvkn1f/jjl9AKOAQj4fPTXpfKMrCRBnb4DnUB2YPbNt2K0QolDyB
         XHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970425; x=1790575225;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbepAso+XoZVkbrUUQwUCzv4bigxo9mSvnxXnLcpRMk=;
        b=bYfwyvLkK1KWKWmc54EmEVSRebOn6VPUGgjeB+sqPEmMs4i2U62u/3ib4mWRxYqPlD
         7DLrXhMix+TkiLU+daRUYGSTUH+046Cur/YKCcFFpYZxyUF/Tq1j7ZRmOKnDa1mbZD+e
         vNZKyiEm7VuAK0dP9qFXRjvpTSGdnYFfdul3cZhNlVnCRRj0kpzvOwkr4YerUf015gOb
         KXe5ET5hH85ev6565mKnUydPjpej+56tEF0fRAzE3pZ/pWbjUZwF6S2k7IDr7Ah5Q9kW
         Y23/wy7t5uJ43yqPBmY/exl3qSwoU2/tzUGBVuX7QBfSaS/HvcwbnFTtRkITFJ5LCnmB
         XWKA==
X-Forwarded-Encrypted: i=1; AKwUvBxU2ufxzKb110J3Q4/4bIKsK7wwntuIY08qYT9uECQtajRhIJRyXqTWRjLjQUDpgU8J8+xUOV3T7O4zAsIRSepV@lists.infradead.org
X-Gm-Message-State: AFuF++kKrtzg2IW8dCbBlnN2THDmIwk3vA5UWaZiWdTl+lw3HjZY6+8T
	TP5SmVbk1TI+ZyOZHHOnZe7NTYZqWxSUREJmJDFd1FbEC/n5t+6KjaLR
X-Gm-Gg: AYBFou0N7fzT+sd4uOECFmCL/Ng2SyC4AbNsezi7/n48RQPrpDUqykzDMWNvWJC+Uh8
	BTWevQPV11cmaTy+qENhjg8u9qpLVEQqzlCt0uHI3nXwXAedEryCv63WkU/mI2mXd5Xdg3x42nA
	PxetsfX87tFDwqtAFzweEUAvau6u+Ndh/7xD3EQj6stvj+VgSAUnYvZBgHZKDXMHiecwc/VYKw5
	fCHRQyr2v/Nv2rwRh0FUG9Y2c33+LK5VtwtX95s+jCGumH4tkF7vnSLBMkE0xO++wtep9EQ+ng8
	joi+dbOgaMiDisWqjbOSNkGIpJyTWsN/aZF5ZqtJCT1oqctmgStySuUXMyE+IR24CI/cA/BdqbE
	Xg9QOLLqch4u3R8WKld45koNdQxB8obRtwIbGEz9cqkeUqK1BwdoLEAATj9HoiVOpDQXJcSkOyu
	V8QTnHVSj6GI8OLDz9F5xyGuwDTpacHNtmN6y834zj/oWQ9kJOTEQlUWBuwmXhkAyOawPtr1RT+
	WQ9jgMzcUsEnYd4yGGmYe5vk6Arl+BVwWFbzYrkvXsHCMfvY/+0g+3kaLq4wJ2wNZikBEzKmUDy
	Oib6+sRI+Oj+l1qpaJBd/oiYcK6c2cJbcQWchXTjJh0EOK4KoZw2agClOWj3n+ex18DDkYK+zQ=
	=
X-Received: by 2002:a05:600c:1382:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-49fc574f42bmr125925475e9.19.1789970424498;
        Sun, 20 Sep 2026 23:00:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:24 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
Date: Mon, 21 Sep 2026 08:00:10 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-1@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230030_791054_D6C0EFF6 
X-CRM114-Status: GOOD (  15.07  )
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
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-2-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

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
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935


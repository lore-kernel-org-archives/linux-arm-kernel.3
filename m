Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2E3C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdaDi91QTKJpghjSNCi+hMWuT0eZZ+v0mEr89udI5Ug=; b=bG2e9DuzIveX4CVnB9GIddwDjw
	NWDs3AZcbEtVu6S2wur8U4e3q+JFAF5t0IcQNi+/BKsMAGHlKxiKAcpiccuPsbnB5rorXy1hACocz
	gGepXj4kb9qVfXTrWixTl3U0l06P4eG6QxXAe1DnzlgK0hwKbyriHRe7r8faXL927CZ/00sfHd4nv
	4PvvFvtz7GQ9VnuHtHedJFZYgNv+Emw5Ag+/s5Q94Nc1lElbdKqy8YgzRAkftNVhejW5gTjlf+kh2
	dyDFqFGVtNLiu6Eviq7oy1knnBdxRIbWPTz8+Y4IfC1O8KJjYKUPTCyoZ8Jy+bducKOcwXEDmaqod
	cgl5LJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X5D-00000000zBn-3wUc;
	Mon, 21 Sep 2026 06:00:55 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4w-00000000z5h-1i02
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:00:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so12599655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970428; x=1790575228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdaDi91QTKJpghjSNCi+hMWuT0eZZ+v0mEr89udI5Ug=;
        b=qp5/xlFk8Gzn/lO7UC3L0oz6HEkdCYm2jByKyKXsUZYSNMncTK72XyqxRbqKa6INEN
         bJy3RxrLbP/ebA9zLp3+AG8UKurwaWV1ZORwPQuFrpNiKa9lfGFzftjdBOGJiig9A9/T
         n2xA313LQ4hqo8gtoh2oKc7dM+u0ra43yw8n7groHReBqTsSPEKsEl8g3ChYMhgL5KTj
         AAGtH/Ml9WoTxerE4pfzKAOdYTtciNL1I0RVAD9BhE9ts7oSX/0mplNiFlgOP+GQTmag
         AzeApPsaoe/8kwW1TWGN6g0tCFjqVvI6xFg5qlLpzX4V3ntEOAhbs9zGtBwSD3IL97EZ
         uorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970428; x=1790575228;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdaDi91QTKJpghjSNCi+hMWuT0eZZ+v0mEr89udI5Ug=;
        b=G0Aqn7DQ9fAUa0KLqzd1gRvHAy2o1SnElckB22CTrbRVzkLpvsyfCR/dAT6eUUoLYF
         zRYTjMP9Naong4y4VkGsLp5uX4uCYGdeRYqhdxoZn6BXTUyp0KRubbJgYXscQb6IoeMI
         WZcsuC2VCvGC0NBXseaiY2cCi4nzDJi7aTrTvePcx4y7gcagYoYBjjE6Q8cnZmLZGLh1
         bVkQqIvkRVBxdtO80LWCjKMJX+/8IhFm3nCeNF51axO8eLMo54clt7ruVemSQEI6rlsp
         bxpmprBFHzK5wpK5XYqCC/sRPbMySVB0T4chLOoElED2U3RGQHxtKyEOdPrwepLyDwwb
         ZWiw==
X-Forwarded-Encrypted: i=1; AKwUvBxk6QHLPNOUAu4G3s3VcruhXI3bOBvHsbBMvXhSR3CLNqPm+0QuEr1ndmJtDtgAH3FH4lv3hBl6eLeB73kZ+2Bp@lists.infradead.org
X-Gm-Message-State: AFuF++nK7HdVlVtrGEsohcnafbfizXyFVBfsiDiD90sU/qAXBA3baDyp
	6e1KLBTeW6n33sVq6J83vHxV/bfgKhdVCqXbeFpldDyrJAEdAb25TIiW
X-Gm-Gg: AYBFou3Zg0KHUR7Gew2eOkt20mgVB0bt6oDlH6FeLCOMtZfeSLuLsZSKuIzZgjwIyu0
	7Wn5Hg4P6eBasUUk74/EQIMEkX2eqG8v4iIwO+nD4EnLy0sJPqvIdMdlTfB3ONEE+Ttz53VitJg
	sXjJ9rTx5LEucSiege6QVdT8ESoRuI8H1AdBgNh1v4HtBWvEW8lbhO4kj3qG6Znk1VSm6389V7l
	G8vwjnlaj+hu9Refp/hSAyGylnvztQ7zkbM48/jwsGmIrpSqab9XTclzf2MSNVXibpyuELdP7xK
	UAQskMlwzh8mxBdXMmzjRvyR6/Lf8Nn/Bygxbn2dsEoHyUZe8FdlzkHWcnFkGgVWcNXKx+I6m+m
	2PBcE8soR4+MJgXuCdgIOLMl6NlR/kFH/SUycjt3QhenNyMz8P0BilZHKrAaRycgcmOGiGMRpud
	XXZT8oJEPVAbTiw1r2wnnRwsSCNggihxmhz7fRVUQ+maeEn8UKyjWa2bDXWUt0P3BDpq+NM41GS
	eT9v6fT1226UbZXYAnfh965eE3Zl/X1QllyxzOGKX89lIbozPJHdkYWkkL6quwZaW8W88E0v8s4
	j+ePyQ0vE4g84WXwHRtpzwI66A77dQf/YlPcUwF7TM0dsSHWcxx0LR+NLlfFCD2Wn1SER3yJa9J
	ZN98=
X-Received: by 2002:a05:600c:46cb:b0:49e:660a:935e with SMTP id 5b1f17b1804b1-49fc586827cmr115985055e9.29.1789970427187;
        Sun, 20 Sep 2026 23:00:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:26 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
Date: Mon, 21 Sep 2026 08:00:12 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-3@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230039_000006_4CABB235 
X-CRM114-Status: GOOD (  17.27  )
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

ARM1176 and ARM11 MPCore can be reported as ARMv7 by
cpu_architecture() even though they lack CLIDR. populate_cache_leaves()
therefore needs the CTR-format check used by detect_cache_level().

DT-based early allocation bypasses init_cache_level(), so its check
no longer protects populate_cache_leaves(). A combined ARMv6/ARMv7
SMP kernel can reach this path on BCM2835, whose DT describes its
caches.

Share the CLIDR capability check between detection and population.
Return -ENOENT from population when CLIDR is unavailable, preserving
the existing absence of cacheinfo and avoiding a new topology warning.

Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-4-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

Reproduced on QEMU realview-eb-mpcore (ARM11 MPCore, reported as ARMv7
by cpu_architecture()) with a device tree carrying i-cache-size and
d-cache-size on the cpu nodes like bcm2835.dtsi: with patch 4 and
without this patch populate_cache_leaves() reads CLIDR, which QEMU
returns as zero, so every leaf becomes CACHE_TYPE_NOCACHE. Real ARM11
does not implement the register. With this patch the read is skipped,
the boot is silent and cacheinfo stays absent as before the series.

 arch/arm/kernel/cacheinfo.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index 31591c947254..993c8a134786 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -80,19 +80,21 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
 	this_leaf->type = type;
 }
 
-static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
+static bool clidr_present(void)
 {
-	unsigned int ctype, level, leaves;
-	u32 ctr, format;
-
 	/* CLIDR is not present before ARMv7/v7m */
 	if (cpu_architecture() < CPU_ARCH_ARMv7)
-		return -EOPNOTSUPP;
+		return false;
 
 	/* Don't try reading CLIDR if CTR declares old format */
-	ctr = read_cpuid_cachetype();
-	format = FIELD_GET(CTR_FORMAT_MASK, ctr);
-	if (format != CTR_FORMAT_ARMV7)
+	return FIELD_GET(CTR_FORMAT_MASK, read_cpuid_cachetype()) == CTR_FORMAT_ARMV7;
+}
+
+static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
+{
+	unsigned int ctype, level, leaves;
+
+	if (!clidr_present())
 		return -EOPNOTSUPP;
 
 	for (level = 1, leaves = 0; level <= MAX_CACHE_LEVEL; level++) {
@@ -150,11 +152,10 @@ int populate_cache_leaves(unsigned int cpu)
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *infos = this_cpu_ci->info_list;
-	unsigned int arch = cpu_architecture();
 
-	/* CLIDR is not present before ARMv7/v7m */
-	if (arch < CPU_ARCH_ARMv7)
-		return -EOPNOTSUPP;
+	/* The device tree can describe caches CLIDR cannot fill in. */
+	if (!clidr_present())
+		return -ENOENT;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
 	     idx < this_cpu_ci->num_leaves; level++) {


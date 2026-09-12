Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11EC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv5Y9hzbKwVTvwjYbkj7A4OWiAYcXcebXQ5vuapgDoU=; b=FXM6uWtz1CaBofO2Jr4ltWeOH4
	XPqZaDZUC9WNhT8gCaISDjqTDJkgIr60eXKy6tlGdod+Fa1Hjxgg12IqjvfE7BPVqAsLSrKFAg/th
	TdDFDYN2tsg159R8UzQt1EO30UkrHG8vjL1XfK05d0w36lzQnPc+YUUD5pED4NyiVZ+hPmJ/tudU1
	vF9rOOLedBOjydNTVZO+lhx9GHQpY4x13ZavxaFm3Ql4oVzIPildFDrldTXamWjtlJ9NGHDA6emyA
	AkyESBAxNprmqbySbDV10G//4FfeyV7BDjfqvDM02TnYqSeiVwsS/gUEov/KKh2UrJ1zAcr3QVf3a
	LnKLCuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpX-000000017vA-3kLU;
	Sat, 12 Sep 2026 19:56:07 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpU-000000017sk-0A1G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:56:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3434545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242962; x=1789847762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv5Y9hzbKwVTvwjYbkj7A4OWiAYcXcebXQ5vuapgDoU=;
        b=dI5WFb3/rgWWohsO4q0C0P/XZdTL8yXI1cGKXngAK3xTdYedHqJG+ATpPBFxmIlwNt
         NB8gmfKQgk+rNSVa894T8+ntTJ2RpcxtqT4I5c7AU7GCUG4NxEo4dlFxbxz4yX/gIPg3
         CCwfKiEpwx/m70Pom6RBFlrBp0J90lPRdZWsiZvCqi7TBHIXPAYRnsPjnFqQf7B3kfd5
         slI3l/iqnnTn4TqUj32vi/5cS/0vjvFqq3bL0aUkfO6qUnJ6JbzS29dCNH9s6an13IPe
         Uyws22TZeNdoonUUgefmnJEzkFOSUkrOww/KgSkBeMy2vSzw9Ho5pmy2+kz+hwB/o0eG
         3YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242962; x=1789847762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv5Y9hzbKwVTvwjYbkj7A4OWiAYcXcebXQ5vuapgDoU=;
        b=BtRbZ3li0peURKltfylQ6/mkch2aVhgKW21oFmmKofl12BaQ3s8BCcZO1NUio7eNlZ
         Yyo9p0tevqcyqG/bwgh28dOIiSGQItX2h2qLhebSpy5DI4W5gaYYuJ/yMTLsn9UAWusV
         2Supp89nb69LJ3HjdVqG1/pQSC81yRPWAqqGXqOlJoRefiX8cwnGM48yq+ep8+W6WN8w
         2C70CxYaZSoVEoEBLmfqGThF15oNOhd0rIZFl+sbozuEzXPhrEemcl44/iGBoW7Mx4Fd
         x4PDET0d2VEihQbylj8FNbxhTPpyi80v+42h3ZZTuKs594o74PtBi5DDM3A24rD1hBwo
         sdfA==
X-Forwarded-Encrypted: i=1; AKwUvBxIExwmcspPx/OMNUN1qjwwQcr/7eMPoRJ5fvIG2ZM9dU688a1MMAsm17zH1+X775+vxdeEJZIpf6BCp8DEaUQU@lists.infradead.org
X-Gm-Message-State: AFuF++mJcvmV4pWbKu1qxRFE0RdoGS0B2EiNtboN3YKYSHyYeg2vcTat
	rMcTihjWNSi4QNL8Mi9OPiad8FXn4Rp6RKkVFmkN1tu44l7tDalZSe7w
X-Gm-Gg: AYBFou2Q/UpxOYHktvnPHcWfpiCwTQMVyA38YWFt71j1HaLHE/7OqgseFS9Bq8AZykq
	iApcr0c4VnxDr8U8LsmNCOODOTFBZDA+j2VOGfmM1OgotjOaYb7GXT4yIXcLh1jLLrrlAzLF4Ba
	Kox0V1W/x/zDIEhqqm0kHdXc+unD1d5Fwv4rR7369/GdjBI/6zQbOupOk4SLnwPx8UcJkDUmrhq
	hbfo4jUmnDWBbWFHxNkY1oqdn7a6eqkKciyvSanhuZdMbaO+tCVpME3wqWjNTU7kwURVclaTwda
	6ZjxivnXSBZt0b1DLGLfAFG8/EuTYqYnEudIt68zcdqgv7f2jV9L/2/Cv6e2nHrUzh7gOE7/5WI
	07EIwcKLOf+SpkW5tRYM4/WZaCmU/TQWVen3zUD4nqIBu9NXqc3T+zNMzkxghVhqcFMRZ+j8WQQ
	lFiC+YSNjElxzeKLZMpaF06y8JYP4bj917FoGr1AfKjIpUqBEMHSiR7zD2nFiQhHtRY1+NE9ej+
	8HIygTGR73lOfl1U7ZDlNtiiijmmUjyDRt+MvseuQdC/CviQymIrs7xO8Uw61arY3ztEs6nnKyb
	kIOhaY5y4HDM5O+sV7EOaRPTthMHkAqe3AgQwhEpCS6r6MF2x89oLa9tfYo3YpnhbcmJQkZTL6G
	6yHX3Bhw=
X-Received: by 2002:a05:600d:4452:20b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49e6198c2aemr79301175e9.11.1789242962176;
        Sat, 12 Sep 2026 12:56:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.56.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:56:01 -0700 (PDT)
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
Subject: [PATCH 3/4] ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
Date: Sat, 12 Sep 2026 21:55:51 +0200
Message-Id: <20260912195552.76673-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_125604_114110_DC6124E3 
X-CRM114-Status: GOOD (  16.98  )
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
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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
-- 
2.53.0



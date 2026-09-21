Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB153C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro+FMNk45PgRPb4vSmer/o4ptFIHYgVUebCic5ooA+w=; b=4ZecT2hDV1tUDhiPv1jaRa/E2h
	rbAfAllNvwe2omxkKe8uTmUgaOYKkp943K/EExKAAG96tWJ2MjtvDtMirXZkyQrS4Wkqcp0GOIcbd
	rHwulE28hLGN/y/9yX6n3JJZUY/PrMg72+fe4fH5cL8wLfdVYpGpz/i/TpnPBaqH51uWDNB2K/Yxk
	sM1r8fIv+KU3BxTH71UnqRVQSVzyNYV7r6i94NMdOoTZ0hko6/63suVjESjoIKcWeMKNvSgT5OQCB
	cLormkHUb2/g9e257DxSdtJ4tbErI3Tm5/pD6C5twtIk1EDKDBnl4OqztwjiUBYQ6lOX9VpQiarz0
	NGj+BDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X5D-00000000zB7-39yo;
	Mon, 21 Sep 2026 06:00:55 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4q-00000000z5g-0tg5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:00:34 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12720445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970426; x=1790575226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ro+FMNk45PgRPb4vSmer/o4ptFIHYgVUebCic5ooA+w=;
        b=GguVxjV5R9/GfYeV5QeX/NgmR5l1U3krUuDfmYUUXZHMP+C7M5J7XGyCLEMUoOtj0U
         15PaebsUvFeVXGMphbGD1bZ8Hf8rcAp7JHIj3EAMYUCEzeEYIndvMw4TAzZPXKCBq+We
         fq8/I6fz+zRQgxqrffVCaJ9nKBahrYx58JOwlYY9+Pb7rUmKqvocSsxfT7do5Gy9yx8z
         rYzgbRcvw0rsLd8nLbdfBezMsN01hpWwFseBezJLv15ZrOfeRaY5VXmweu3dpgohSCMM
         hFcEA/M/NDwioRQ9qnAuPhjs9ljBQPKJ6lq4WMTxtEbfYenJBUz91vbuupbjxSkkyg8t
         uPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970426; x=1790575226;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro+FMNk45PgRPb4vSmer/o4ptFIHYgVUebCic5ooA+w=;
        b=kbdUXFksWIpA0HefN2eKqFTxgPmf1ezdtrh9nSWRJFSoLwIMulm9++NKGqZss65nh0
         OYN79B5u6EGHvPppaNNI08ArDT3ns7z3WjXZLZeScWz9FC4/GIkw2EeV/yOCT+5egBkf
         ZXTG68i9wXvWTi7bcG1kCy30t5Ts2yQUMqFUNWDBUCXkgN6tOwqyAIQ6wmW1FKPJwrKk
         Z7k9B3huWfR+o76zgMMI+3Ir1EXT9SKc6haZFtuVzXiqgXLwg4vgpADm/W6Pr3mefB5W
         vpPxRE8oKQRTuI80Pf0TMQbgj50TbfsC2ZLe781bS+JWWAZRrLhhsxpFEK4hqrb3YUrp
         96CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjJRzI/XGtNJ2BqdPMKB19bfyd21+uzBXdOlVfOI9kFw6K0sc69AOMi2QIbTnyoCoBivYMP4hmIZzmNSmhcxyv@lists.infradead.org
X-Gm-Message-State: AFuF++n/MyCcUpfzw+aPulGO5xoJ4dNcDaeNiodlPfTLRGLwv5ngIhkS
	6RrEKoA32IEEYLLzLhqhtbF4zSYLol3xWw/+p8gRszM8p5kfRc3wg8ItVH9wSQ==
X-Gm-Gg: AYBFou0Gy9Dt1i6pJIN+Tc6L1fuF6rq4M49d86yO62pASYNRpsF2CfZindeI/TEPMG8
	t6mDja+IGx88bk6rKy568qcA7ems28GWfGW25zH72kAbNpctYtkp2OPskSn38gMZDMMr7wlBZWA
	fgO72tfi+gpOWThaKg/VJIUHRWM8jTrlvod4JtxiQPwf7rvoy4xgPvv4AeknsCje8tKYUowcEbY
	VQyQk3LFPMDCg9KDGueWcKotBWOXP8Ecmn/AGMiyII9/1eUdD60B1IL3DktyOLBL8iNYe5SGi1N
	jN2hG5//HOv41+Q1IQwH+bGnPh4oaiZeXkBvcvQ/GGxdl2f40ZWzT0zBC123Ph86PPTUAflpSRT
	Zi9gmL0TX2X3HCuRcg+Mtrg4SwfRfZ3gNcA4uHQsLDWOS6wKimIVSpaSq3oPEZ5Tacvt4c3OEwo
	8Qp1HNIlC8KCuP8hSPeZECwAk05bD14KazL6QDWEZnw5sspiN9l7IMQ5D27c9dcs/icD84YswuG
	OKuk4jr0nay8NJZc6fzfFfY2tnEUAdlgYO4SXAEumquzRjO3zUvIZM84S8oySqK+QwHuMzNyIJD
	+cj7XntFYAefnzQwmZpiaVvMuNecZ/a6f99d0ZeTFPSjv6E3cbX/Ww4b0fkJW/ACcRVTrpNBzRm
	CvEY6kg4HYqnQ
X-Received: by 2002:a05:600c:6305:b0:49f:c2ef:cfb9 with SMTP id 5b1f17b1804b1-49fc56719a8mr103694715e9.4.1789970425753;
        Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ARM: cacheinfo: count external caches in early_cache_level()
Date: Mon, 21 Sep 2026 08:00:11 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-2@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230032_806935_E1E7242D 
X-CRM114-Status: GOOD (  14.89  )
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

early_cache_level() counts only caches described by CLIDR. An external
PL310 is absent from CLIDR, and its arm,pl310-cache compatible is not
accepted by init_of_cache_level(), so early allocation falls back to
an incomplete count. init_cache_level() later adds the DT-described
L2, forcing reallocation on the secondary CPU with interrupts disabled.
This defeats early allocation on PREEMPT_RT.

Use init_cache_level() for early sizing too, so the initial allocation
includes external caches described by the device tree.

Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-3-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

Without this patch, patch 4 keeps the warning on QEMU vexpress-a9
(4 Cortex-A9, PL310): the early size is 2 leaves, init_cache_level()
wants 3, and init_level_allocate_ci() reallocates on the secondary
CPU. With it the warning is gone and the cache sysfs tree is unchanged
(L1 data, L1 instruction, L2 unified shared by all CPUs).

 arch/arm/kernel/cacheinfo.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index 860eeb03cfe5..31591c947254 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -111,13 +111,6 @@ static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
 	return 0;
 }
 
-int early_cache_level(unsigned int cpu)
-{
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-
-	return detect_cache_level(&this_cpu_ci->num_levels, &this_cpu_ci->num_leaves);
-}
-
 int init_cache_level(unsigned int cpu)
 {
 	unsigned int level, leaves;
@@ -146,6 +139,11 @@ int init_cache_level(unsigned int cpu)
 	return 0;
 }
 
+int early_cache_level(unsigned int cpu)
+{
+	return init_cache_level(cpu);
+}
+
 int populate_cache_leaves(unsigned int cpu)
 {
 	unsigned int level, idx;


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F8BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 04:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYysfUoaHnSD8dBiZzut53a8nZV60l3gC+2HnKebsJM=; b=LNBIlh25zzvcD3kTXQTmRc49EF
	WFo16svHl93ew4jistTiP1XZ3CkpfOUuoBaiCjrLPZus8imhZU8l5U6GLkTmcQZ8N81ZLjRGUQryO
	b+oRg1ZayKa03ljRAYIQfP8X7rb7r0XR3wvPf4uAWjvuq5GXjGO4ZCWBQVYnAffi++xXwx0Tm98ge
	gLw4qz7UHHeJc+YpAcja2/i5Em25aDq0JfpNRg46wpJH5nw00vgbWQjw6+BKwk3Yi9wMJwBpXQUNK
	/MX6SDR7dpUSiEAPMLgy28h85EnjDM1czCf0lwgwESacvAvt6TK6pkwbqMRevjobBj6yun061JwAq
	WoxOQ6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpJtH-000000031sc-0aG2;
	Tue, 04 Mar 2025 04:28:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpJrh-000000031l1-1g5E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 04:26:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-390dd362848so4048676f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 20:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741062403; x=1741667203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYysfUoaHnSD8dBiZzut53a8nZV60l3gC+2HnKebsJM=;
        b=ASnVZJ9rIdr2g7snlr1mVbKj4iMMRnQ2gwgz5IOzPrHCz9XcXxrosGc6xoYCwmJFPi
         9kYqCwM5T/uTkq47+gBREG2obCLjAfQ8mAu/IR2C5l+LOQgBGCcejZLrsF9IrCDuKWLy
         UUrIiZEjoU1LxQA45hiu9t0tQIvD3+zZ2jXkktIe/ZV1GncS0vfFIu6zJelX3dVQSBBX
         gSxliTC660Jj1KKIThMSzLN+TgO3Zf0IQCQvGB1O2dxHjWMpx1l77iP2CHEWUpdgO0/i
         tmcJvRj8WWUmNQTbzj4ca9aHpk52+z/e5fLUB0mpbzsngznzzTt6wcVScnZabPsShIlY
         lEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741062403; x=1741667203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYysfUoaHnSD8dBiZzut53a8nZV60l3gC+2HnKebsJM=;
        b=HOHbDCKspZRuqFAxTbd9MNcR8e3LeJiomYpyPA8lpmtyR8RAI9T/MA6YyJVBv2jgZa
         J/nqIv+q9hWCxBBArdREFoja650hLL/OdidHXGnsSiKmIBUXk08sLT0gV2lNHEH1MKJ6
         IqZ855lr50UkN2bHoKJEsFlNom9sYYRsiOt8jRWGC+RGcxqQkJDx3YlhI7HJAJKfLgNf
         d6wunR1rgdyu0tcrUf/v4SedrEjgJ0kA8nUvojy2Fq/H/DulNnWitaE2bddrhi3Y/dM2
         1M//SotYt7Xq4WfhcFURRgmhuvEhpbDwnMNBtyc8Uyz/x0jyziqdJzxhwXm/PTdmhFty
         3QBA==
X-Forwarded-Encrypted: i=1; AJvYcCUqIbw7FtOal16Y73xkOjjHG2ctmWEUBSF6WHSMc9ijz0p7szQ36P45iPeKSyJCB6wiCbGpsA5WzIQz0dZgmQR3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp36hhl1yXYpgFyHHFV5C1aPqck5fGy+ixrB0YT3teD8vACW4U
	fQwdxAWOZwrcD6KfY9wr2O2fQG6ZXtegGxAMGpnJsan4U+wblddr
X-Gm-Gg: ASbGnctCDPzBPWa2z/dKB9fPgFg5gBpSds+LSTjhI6v4qbX2juUGVPO4WCCfGKbXiuZ
	/OJUKvMdfcxIgKeLZTmd+H2hlRZTQud8rsM8jaBfxaKB+0U0D2+kKIw71doF97oUqgF5XMnTU/W
	B76Tu/C0ydfeQlYv278k/r4WEmcd9kQcWkpLM9tj6EzCTylI8qzBu8+agiQwMULflHQcNMJDnTY
	EI4Ypog9hk2oI/FatfqpVvepbdPQz/ne6gLGQWbAJpcUowdsaBQK1aJdDP/5T+SPve5YIl2RxMa
	SQltUrnnWNyvCvyiyH3uCfYvSkikNspYSYwXe9EZf3T5he5c46eCyhZnkLNXOdrZ41QXapYQRhf
	yizA=
X-Google-Smtp-Source: AGHT+IHwDTMuHwhkr1EJ8ws5Ep+PgNnf6Rh8kDrc61+J9hDNNtk114bN6civNP+cpSSOYWZ+gvbmEg==
X-Received: by 2002:a5d:64aa:0:b0:390:f4f9:8396 with SMTP id ffacd0b85a97d-390f4f98481mr10679310f8f.28.1741062403116;
        Mon, 03 Mar 2025 20:26:43 -0800 (PST)
Received: from Sahara-HP.. (bba-86-97-172-234.alshamil.net.ae. [86.97.172.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47960b6sm16732712f8f.17.2025.03.03.20.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 20:26:42 -0800 (PST)
From: kpark3469@gmail.com
To: ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	keun-o.park@katim.com
Subject: [PATCH v2] arm64: kaslr: warning linear region randomization on failure
Date: Tue,  4 Mar 2025 08:26:34 +0400
Message-Id: <20250304042634.591375-1-kpark3469@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
References: <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_202645_440046_F00F88CD 
X-CRM114-Status: GOOD (  15.39  )
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

From: Keuno Park <keun-o.park@katim.com>

On systems using 4KB pages and having 39 VA_BITS, linear_region_size
gets 256GiB space. It was observed that some SoCs such as Qualcomm
QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
value to have minus as the variable range is s64, so that all the
calculations for randomizing linear address space are skipped.
As a result of this, the kernel's linear region is not randomized.
For hotplug memory users, kernel needs to inform that linear region
is not randomized. However, if CONFIG_MEMORY_HOTPLUG is turned off,
then kernel tries to fall back to the legacy way to randomize linear
region.

Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
Signed-off-by: Keuno Park <keun-o.park@katim.com>
---
 arch/arm64/mm/init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9c0b8d9558fc..848790a9e75e 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -290,6 +290,17 @@ void __init arm64_memblock_init(void)
 		s64 range = linear_region_size -
 			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
 
+		if (range < 0) {
+			if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
+				WARN(true, "linear region is not randomized due to bigger parange\n");
+			} else {
+				pr_warn("falling back to the range considering on-boot DRAM size\n");
+				range = linear_region_size -
+					(memblock_end_of_DRAM() -
+					 memblock_start_of_DRAM());
+			}
+		}
+
 		/*
 		 * If the size of the linear region exceeds, by a sufficient
 		 * margin, the size of the region that the physical memory can
-- 
2.34.1



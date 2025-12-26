Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9394E8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ietD9HqJ7J3E+f0491dnZq0rlaTb/buis2UihkMu59I=; b=gtd6IgBFYpOh5M
	VJFQe8vGiV1Y2Y3iCl5npLmVLFFE2V0j51wWNl5Y8b2LZDeoDBKgAbON4C3khiovPcrAvsWfBNSSM
	TT39WLgEOJJ0utNmTc5S0IWGyxblio+BDubUSXexIz24Q3IevQGIcM9kSi8qOjKS3MiRLDEpBD77l
	NUxEKBjmBAk0ra/nEXSICNjpC9bzJdez/z+IXxoypFwTTW/YPeKLtbT3wMAsPpVlFbOPOle+uC21O
	ODqSZ50qQvULpuZmefKihh4l17rWrVG7+B9B3NWBzhfEPUy7NKhbTr+s4kLNgPqdJSwji8Rxs8L1J
	41/sIA6h/BaD7s0RDbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgi-00000001X5z-2EDL;
	Fri, 26 Dec 2025 22:53:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgf-00000001X5T-47CO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:53:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0eaf55d58so49804615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789613; x=1767394413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietD9HqJ7J3E+f0491dnZq0rlaTb/buis2UihkMu59I=;
        b=iF4YKgMZ9i17yg1SvffS9keJ0Vs88DA0c7TH/zNU+0JnAZT2eDwLtfV20aiMGy+vuG
         nfz/NnoZ3fBZF5NPlNxs6Ad28cmVJKNUsnSS009WFX+LljSX4xodLPPjoVoDCGMZH5jJ
         pknD6bzlKZSb6CfwGzkE0BQ6mzy3PxtfoWhDJ4eDhImUpBxsdb7/XFE0Jnj7nWNKAIhW
         Z7EMXUz4MaMJ7tuL94wKJ9MQ+BNZ9m7jBKWJoi75f+6RaUEIqk1jdF/OnbN/ym/h8YjW
         jn2AWPtAdag3fmRdTQp1vgdivhe/ZYsi0C9E0KENCnHRl54SP3oLURBcFx6IQcEnX9Zu
         S5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789613; x=1767394413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ietD9HqJ7J3E+f0491dnZq0rlaTb/buis2UihkMu59I=;
        b=bD+073ryQkFbWANI6eN4JmajhaV8cNfxXIYf/6lxocBlLqKf7M2OsGGEvrJQdq8M3z
         Cd4prFSknxrCGAKk4ZuZze1VXTvhJhXQTv46DU6o2K/5itg41TPGYHRDiqvifRoiHiSS
         nS1GtAZd6j/hlFuyCZyD/ADbnY6GCF09og83VHbvUDQYyYaEiTXHOdQ8gqdQyV+5flrQ
         Vx0NTe7RprvuYFmwxMXN3KM91WiXWPDWJZoaHoFyusSXYgH6YG7Xt1IdrXx3jR1nvF0z
         KGOUs29qxsYJ9B+/cBz8jaGKPus3ws8XhaOkbGvrrUWsD5uQI3JW17CZiSpZrjCePhXo
         36DA==
X-Forwarded-Encrypted: i=1; AJvYcCUYEKedKBn95J7OjbPTUfMn1bZrsMuUTLymoBSyJP2sIYhSLur49gjs5tAa6hqyrEVjX+Z+8jeLi+MXtUS7rnhE@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhlC7TBIZTDn8ZfKh/UPVLaWZ581OuL3oqsbmicrkEylqCvaw
	yOyFy+8VrUcy01uTNFdsRdEC6/YH2C78Z140Gdq4Xki+MNw0l4pXjr8beqOthpdn
X-Gm-Gg: AY/fxX7mJZ+Y85CAL+slohc9scrONlWJC8SrCt2zwYvucXkMf0vofOt0Uvjz68NvZen
	DauwOtCEXaaoYvxFxh1zP32pM2VwljckU9x7K+iN49hp4x7AauPXUPKZ1UEojiPdRoBwpNhXrcK
	0StGwi6shdc29xjV42Qnk7+olP5qoTsLBoEcSg7NEN+nJCkiTGY8S/8s9MwABoKNe7AobIYX0Nv
	Zr4WTZTt7d0ndMM29MOec/Ay2kRtWOxftyShMT/Q4+gzmf+iIU8MAGDS2d4+bEwq1hWAbt5N0wU
	bzt9pw3dgeSg4fQJ481yOIUc5xB1/PMDYXKfLaWeiVJBIKtqoAfEOUbBz2smnSRu3cCbit0FWTE
	07D2AbKJ4jA3UkK8KhA3h/9a+g0RRl/c25e/EJUX0b80mvtNG6UJd6dYo5hmTzdQQYfEWl6UIJ0
	u6MuOhGl16qGR4
X-Google-Smtp-Source: AGHT+IE9oZQXckIJDcXvuEcMulX/ZaTRdgyK2lgHN5sr4Zh2/8KW3byPESPfAHlQDRzMXfnr9Ddibw==
X-Received: by 2002:a17:90b:2b46:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-34e90d6d322mr21171859a91.8.1766789612867;
        Fri, 26 Dec 2025 14:53:32 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:32 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/8] arm64: Provide dcache_clean_poc_nosync helper
Date: Sat, 27 Dec 2025 11:52:42 +1300
Message-ID: <20251226225254.46197-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145334_043627_8298D70C 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_clean_poc_nosync does not wait for the data cache clean to
complete. Later, we wait for completion of all scatter-gather entries
together.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 28ab96e808ef..9b6d0a62cf3d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
 extern long caches_clean_inval_user_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 503567c864fd..4a7c7e03785d 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -178,6 +178,21 @@ SYM_FUNC_START(__pi_dcache_clean_poc)
 SYM_FUNC_END(__pi_dcache_clean_poc)
 SYM_FUNC_ALIAS(dcache_clean_poc, __pi_dcache_clean_poc)
 
+/*
+ *	dcache_clean_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end).
+ * 	not necessarily cleaned to the PoC till an explicit dsb sy afterward.
+ *
+ *	- start   - virtual start address of region
+ *	- end     - virtual end address of region
+ */
+SYM_FUNC_START(__pi_dcache_clean_poc_nosync)
+	dcache_by_line_op_nosync cvac, x0, x1, x2, x3
+	ret
+SYM_FUNC_END(__pi_dcache_clean_poc_nosync)
+SYM_FUNC_ALIAS(dcache_clean_poc_nosync, __pi_dcache_clean_poc_nosync)
+
 /*
  *	dcache_clean_pop(start, end)
  *
-- 
2.43.0



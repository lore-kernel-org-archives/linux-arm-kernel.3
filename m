Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FDBFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=; b=sKzGFUIIr6jSi+hLNkndBSrP1+
	uSxUMQaE66KwjRdhvtbGLhvs3SiSQeEvRMYBxY9qrPGUiIJGytkeUMT0Yrqghp6ccIP9I4+fCC8Yr
	T0YnH7kjAFdCoyWoRj4x3qm8xh7Gfpgip/n0BM3Gpm+twhjjFsDqCvTN11fk9sF/xNIh54xn2w1iA
	tioJmFd8YoDrGLdBoIBXjC53zm8iGio6OCRYX82ArNG+SK+P5xgfjEIEFq2Z0xXNsUchpfdjS8E5l
	N4yPgNMAq+GUsHZkCux1C3vgwq439bAuWX9NnHaJwG5Z+U/GPGVIPnMDgrw6kQXgIlhWrBhwV3H1d
	OkHnzLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytB-0000000350S-0G2k;
	Wed, 29 Apr 2026 06:59:17 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyt8-000000034xF-27ru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:15 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso388903b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445954; x=1778050754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=lWDtM2vHiQQlMFyiLLA0Fg2Cus5hSRhQE/4f6o04wtPwDftX2mCqU5QA65tuCahrZu
         gb1VAMIX+kmEuGZWQEx1hGrtIIimXwrtxsWh0F87GInAATF8XicgmdAN+nx4km/i7HC0
         LF/xXrzqGs1dzaT8iBr5e0OJpXORtay3eafEmAp/4KQvJZiHdGA+mpD6xdBZWWYlfxuA
         48XyScf/t+mZL35mUJR6xBNB3GFZpoXdg7mE4Cad6jvnmmiTdCUxO8+AbXbCzfINq7Ak
         LDBmg4Pbk9n+4pnwSmSs5OfuMcvu4j95CsbJr1evKr7WnlpkHVm3YaPQ0ayKZRL5awXz
         IBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445954; x=1778050754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=HneShyPztuzc+re4Ca4KkRwE04LliSGqy5pO1FDOJjkp48cus91VZUcnoevkEN5ob8
         GYobQb1wzu2mRfRPYAkK0JfmDcLwQz1oQ8b0l4BiuuqevJoAZD/TryY7pKGbhF5JH874
         a3eleVv9VuXtI0VylJzj+WTrwxtah30hohn3V3W2SFcqrR5Fd2EbeGnAbv/M8zQc6pN5
         J4SKNtp4CYZnI82vMhVDwLz3W7FmQJktQomFPsdql/R5E0DNjbhie6QpyIkCgq+Q6Jwz
         dDHYMmFX6HVI1gO3+YzXM3AFD4Ujhl/MG4jUDfNyM6xKbBoq78yMEJbS+/WmA2qKfeyf
         kUJA==
X-Forwarded-Encrypted: i=1; AFNElJ/rnhwNaguhF0W3JUQv9m8XINjQagp6gtw7DtLXHa+bz9nF5+9ruIFgvShXIIj5ciAKcS9o1ka8ZgHw+aqjfxG6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkg52h3dGbKZl0Y3OC3Oxi9l8yHEkKmBzx6row4e4/rS3PJw44
	sxqTw1AMgBwmpYmZa4oAwxvtdaD313dBC38f9TBKTMTw/d5eTBDtWJTE
X-Gm-Gg: AeBDiet7jRJ+ct6IHQRTQPGrUuqTeLmjIW6EHrlvoGbOBPp5/ABSzktBcGz6tGoBbnh
	14Vim0x8O3mLvNQnvrmeaCaCd9s9dZXWfq4ZXwmCfh5kQsEJKpr/J1c0H4VvOZoK96lwZFAApsI
	ghqgMpDF7S4xxiMIveDW7k5F9FQNbbsygGgeux4ABYNRYDY/rp3Z55wcN8yYxtC2tn+z2mPmWFr
	IpBczb41Yte0Cf+DU9e5gBtkN8EmjlBuh1MPDC9Q0/S5mggxPIfU5AZvQ6RFDtn81ddxQ+6C75u
	7myG4IboZ61nkLmfIHrSU4J7mdkPNnbno7M/Vk2FDu+RS1rmQMv8oFwYX3rpZHZOOiJlDCzNmUz
	ivRZO93wsjsCBouACMfWMHw18nsa4vGT25eAB57cv8fnLtSgKoO1QNMBJt2muB5lHDXciOojdGE
	AGpLb6BEPJ0TttfMG833E+3mcSvg/HrCy9Vv02bTthFHJrS/BWmeMixQkGmcU=
X-Received: by 2002:a05:6a00:94e8:b0:82f:65d:33ad with SMTP id d2e1a72fcca58-834ebb751bdmr1807155b3a.15.1777445953880;
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
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
Subject: [PATCH 03/11] of: reserved_mem: avoid unconditional save of reg entries in fdt_scan_reserved_mem_late()
Date: Wed, 29 Apr 2026 14:58:23 +0800
Message-ID: <20260429065831.1510858-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235914_550992_EEF45102 
X-CRM114-Status: GOOD (  15.83  )
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

fdt_scan_reserved_mem_late() iterates all reg entries of every
/reserved-memory child and unconditionally initialises each via
fdt_init_reserved_mem_node(), while fdt_scan_reserved_mem() in the
first pass may have rejected individual entries in
early_init_dt_reserve_memory() (e.g. outside physical memory or, on
the no-map path, overlapping an existing reservation).

When a single node mixes failing and succeeding reg entries, the
first-pass counter only accounts for the successful ones, and the
second-pass save then overflows into the wrong slots: the failing
entry may be written to reserved_mem[] while the succeeding one is
dropped by the "not enough space" guard in fdt_init_reserved_mem_node().
The stored entry does not correspond to any real memblock reservation
and misleads consumers such as of_reserved_mem_lookup().

Mirror early_init_dt_reserve_memory()'s preconditions in the
per-reg-entry save loop:

 - skip the entry if it does not overlap memblock.memory;
 - for nomap entries, skip if the region is already reserved.

This keeps reserved_mem[] strictly consistent with the regions that
were actually reserved.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 03c676052dab..807b222fce5f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -288,6 +288,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		const char *uname;
 		int i, len;
 		const __be32 *prop;
+		bool nomap;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
@@ -301,6 +302,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		if (ret && ret != -ENODEV)
 			continue;
 
+		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
 		uname = fdt_get_name(fdt, child, NULL);
 		for (i = 0; i < len; i++) {
 			u64 b, s;
@@ -310,8 +312,23 @@ void __init fdt_scan_reserved_mem_late(void)
 			base = b;
 			size = s;
 
-			if (size)
-				fdt_init_reserved_mem_node(child, uname, base, size);
+			if (!size)
+				continue;
+
+			/*
+			 * Save only entries that were successfully reserved
+			 * in the first pass. Mirrors the preconditions in
+			 * early_init_dt_reserve_memory() so that a per-reg
+			 * entry failure (outside RAM, or nomap rejected due
+			 * to an existing reservation) does not leave a
+			 * ghost slot in reserved_mem[].
+			 */
+			if (!memblock_overlaps_region(&memblock.memory, base, size))
+				continue;
+			if (nomap && memblock_is_region_reserved(base, size))
+				continue;
+
+			fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
-- 
2.43.0



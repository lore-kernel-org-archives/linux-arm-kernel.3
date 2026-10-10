Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F78BCA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=; b=GR5OV9SImWPJgJwGL/wk3BcMt/
	L9oM4d8+N6roJ1jV1hiFZ72SLwvr3cDRPKWr6GBQnMknT1ucLhH+XJG4CIeoE0dA/dlWyBibeSF52
	oP38wne2LAwgwoVBdmETwaz9e6q9evLJRVebtAw76PLgVMovhNlGqQ8VxS6b7g72RPC7e5dNG7qwD
	z5g5nzcL1KT+6Ir5MWogR8holRw8Z4WTSyGMB/scPsZLSk6TrVZmz64pdP2/fWMrtvlnZYfV5lbDc
	DaR24Fo6WL/JdKtc6MD75xf4dghk9u/0Lf+KuhkrjygClkqnExvblhM0e7elFLjZa27MsfImazjaq
	+Y16ahNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgp-000000083Eo-2TQQ;
	Sat, 10 Oct 2026 13:00:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgj-000000083Bt-3U60
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so5042945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637232; x=1792242032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=qwcp9zm+XCoHEr7/9eCcueMXoHUJC6LZeRr6QjiY1tdi2j7Rx4Xq7AJ02K3s4QwhRi
         AEPHNmMPt35ZqXhd6O0wp2pFEWYDoZbCqXDDfrg9IdejbgMhP8dOrA19gG65K6wcqW08
         s0U0JuqnJa3dlZDG8zyDwXZnuU0QBc/PrR4aYRQ2lORFxPZRfkMBL8odTRikLr35OxBz
         QBm3dVGs8p9414v0tqj7dwBfG51G64yCSZ5yw4gGbzab6hUZrATzp8JkpxnrZXB7Kijz
         Y9Zz1UjdgzKhlb293FS25KDHwnDLYxjB7qDmd3jI1xwozTOFpTB6F0eq69eWYC+Dcd2+
         qiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637232; x=1792242032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=qKvYGcj1dVmJdRGR2I4OSycCxOOQH7Sm/mCiGH5ZS6D7Raqwu1Wf5cSYyB+VO7a1x/
         HXdaBqFhhCrTVjaxkCJd2cMf+hUI9S1mHIm45cL5DQSDSJ/wUAzOxBuFOro+duCEIsq4
         O3xirKxEyHlHP1crGyetzfWEG+LCPdqh0UtUueHmnzC6oifV+1cpq7HPXRf+cPQUnnZ0
         J2FihwHjPQn2J+/E9QmV+oOLh+CKCqIQEqH5pu9OH5XKlzBC8MgL16tCIMddch0I0UZY
         S/PaZ1REtFuWXE/7UOKD+Rc5PkkZd4hY1Y/xO+0ZnZcMJBAl2pBpcEMwC3OVSnuHsm4B
         c3og==
X-Gm-Message-State: AFq9FYLkmog+0STEzvUFEodqActewB72dYtZD778YqDtyn+KlmgrjujU
	syAYDjsNLFe6kEJz2sMON7QEgLCVkzuHAsl5UM3UgeScytYn0UMjHJMO7HuXv+QfmNtcxA==
X-Gm-Gg: AYBFou2+z/wWy9BsS8pTK4orBRhyMvyGzVR3D7bGd1DbfIVOWp+hKPhvu6B5pTyr781
	Is4q8ArRJAwshPT9D1I+yzxE+kWNYFRuHl6IFsb4Do/PYAyxPqgvtaLmJ3j2dGGfAkkguMvOo3U
	e1ImQ+zWy4D2U8f7vIC/FyKSe3J7Y+Meo7mnypPTlfg6xBu8TC7+H7eHGKJho1IaPPdD0UfexPG
	jBeeuRHpUKGWK4Tl1041O1hgqDAeyRMgkeFmXxOffdZptkrzL93gtrex8hxoxbLi9RunFd+lqYw
	lLofSFDyGy4eRHp73NyGQdoILhdASRWj7AgndD41syptLqh01X73f0BldrPq9v0CWa+cxbkIkr6
	UiIL5aOWSanNwplrCvrC1zb619DM7J46Tc37iD7W8vwjFGgYQWpkwhTsv9WKR1/x4fKmXuBHbc0
	migcrZN5GuzRFXhMaPg/VbMPWkH59zdoaHaubDNFhwvCa9m3WhAnoe0TfCPx4Y9hrnTUavfYTMQ
	P/BbLklzSn8xET/XBJH1lxqg7Y01PEoyJ5fKBDKOtZScOvMpFTkzxDnlyMgN3+HqN+yuYYB1alP
	TcbVrzLe8fAVnB5DM0UU8X9Lw45rD7jKYKSTJh0uMFJN0IQrqAehpyg2nw8mJe82sWTSdXb1
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a18e4a988dmr80690785e9.13.1791637231769;
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 13:59:40 +0100
Message-ID: <20261010130024.177503-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060033_907675_A6E362FE 
X-CRM114-Status: GOOD (  23.28  )
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

Provide the optional lock used by the tested ZX279128S workaround. Lock-
off experiments hung the board; the proposed API remains subject to
maintainer review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/include/asm/outercache.h | 22 +++++++++
 arch/arm/mm/Kconfig               | 14 ++++++
 arch/arm/mm/cache-l2x0.c          | 81 +++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/arch/arm/include/asm/outercache.h b/arch/arm/include/asm/outercache.h
index 3364637755..cf9552aaac 100644
--- a/arch/arm/include/asm/outercache.h
+++ b/arch/arm/include/asm/outercache.h
@@ -117,4 +117,26 @@ static inline void outer_resume(void) { }
 
 #endif
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/**
+ * outer_io_lock - serialize a device read with outer cache maintenance
+ *
+ * On some SoCs a device read that is still outstanding while an outer
+ * cache range or sync operation is issued deadlocks the interconnect.
+ * Drivers for devices behind such a bus take this lock around their
+ * register reads.  It is a no-op unless the platform enabled it.
+ *
+ * Returns the saved interrupt flags to pass to outer_io_unlock().
+ */
+unsigned long outer_io_lock(void);
+void outer_io_unlock(unsigned long flags);
+#else
+static inline unsigned long outer_io_lock(void)
+{
+	return 0;
+}
+
+static inline void outer_io_unlock(unsigned long flags) { }
+#endif
+
 #endif	/* __ASM_OUTERCACHE_H */
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 6574659dfb..871c38b435 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -1015,6 +1015,20 @@ config CACHE_L2X0
 	help
 	  This option enables the L2x0 PrimeCell.
 
+config CACHE_L2X0_IO_LOCK
+	bool "Serialize device reads with L2C-310 maintenance operations"
+	depends on CACHE_L2X0
+	help
+	  On some SoCs, for example the ZTE/Sanechips ZX279128S, issuing an
+	  L2C-310 range or sync operation while a CPU read from a PCIe
+	  endpoint is still outstanding deadlocks the interconnect.  This
+	  option lets the L2C-310 maintenance operations take a spinlock
+	  that drivers also hold around their device reads, through
+	  outer_io_lock()/outer_io_unlock().  It is only active when the
+	  cache controller node has the "zte,l2c-io-read-lock" property.
+
+	  If unsure, say N.
+
 config CACHE_L2X0_PMU
 	bool "L2x0 performance monitor support" if CACHE_L2X0
 	depends on PERF_EVENTS
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 4708671600..35cc2eaf85 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -48,6 +48,7 @@ struct l2x0_regs l2x0_saved_regs;
 
 static bool l2x0_bresp_disable;
 static bool l2x0_flz_disable;
+static bool l2x0_io_lock_enable __initdata;
 
 /*
  * Common code for all cache controllers.
@@ -778,6 +779,81 @@ static const struct l2c_init_data l2c310_init_fns __initconst = {
 	},
 };
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/*
+ * On some SoCs (e.g. the ZTE/Sanechips ZX279128S) a CPU read from a PCIe
+ * endpoint that is still outstanding when an L2C maintenance or sync
+ * operation is issued deadlocks the interconnect: both CPUs stall and only
+ * a watchdog reset recovers.  The vendor kernel avoids this by holding one
+ * spinlock around the L2C operations and around the drivers' device reads.
+ * Do the same when the cache node asks for it.  Drivers take the lock
+ * around their device reads with outer_io_lock()/outer_io_unlock().
+ */
+static DEFINE_RAW_SPINLOCK(l2x0_io_lock);
+static struct outer_cache_fns l2x0_io_fns __ro_after_init;
+static bool l2x0_io_lock_active __ro_after_init;
+
+unsigned long outer_io_lock(void)
+{
+	unsigned long flags = 0;
+
+	if (l2x0_io_lock_active)
+		raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	return flags;
+}
+EXPORT_SYMBOL_GPL(outer_io_lock);
+
+void outer_io_unlock(unsigned long flags)
+{
+	if (l2x0_io_lock_active)
+		raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+EXPORT_SYMBOL_GPL(outer_io_unlock);
+
+#define L2C_IO_LOCKED_RANGE_OP(op)					\
+static void l2c_io_locked_##op(unsigned long start, unsigned long end)	\
+{									\
+	unsigned long flags;						\
+									\
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);			\
+	l2x0_io_fns.op(start, end);					\
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);		\
+}
+
+L2C_IO_LOCKED_RANGE_OP(inv_range)
+L2C_IO_LOCKED_RANGE_OP(clean_range)
+L2C_IO_LOCKED_RANGE_OP(flush_range)
+
+static void l2c_io_locked_sync(void)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	l2x0_io_fns.sync();
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	l2x0_io_fns = *fns;
+	if (fns->inv_range)
+		fns->inv_range = l2c_io_locked_inv_range;
+	if (fns->clean_range)
+		fns->clean_range = l2c_io_locked_clean_range;
+	if (fns->flush_range)
+		fns->flush_range = l2c_io_locked_flush_range;
+	if (fns->sync)
+		fns->sync = l2c_io_locked_sync;
+	l2x0_io_lock_active = true;
+	pr_info("L2C: serializing device reads with maintenance operations\n");
+}
+#else
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	pr_warn("L2C: io read lock requested but CONFIG_CACHE_L2X0_IO_LOCK is disabled\n");
+}
+#endif
+
 static int __init __l2c_init(const struct l2c_init_data *data,
 			     u32 aux_val, u32 aux_mask, u32 cache_id, bool nosync)
 {
@@ -859,6 +935,8 @@ static int __init __l2c_init(const struct l2c_init_data *data,
 		pr_info("L2C: disabling outer sync\n");
 		fns.sync = NULL;
 	}
+	if (l2x0_io_lock_enable)
+		l2c_io_lock_install(&fns);
 
 	/*
 	 * Check if l2x0 controller is already enabled.  If we are booting
@@ -1198,6 +1276,9 @@ static void __init l2c310_of_parse(const struct device_node *np,
 	if (of_property_read_bool(np, "arm,full-line-zero-disable"))
 		l2x0_flz_disable = true;
 
+	if (of_property_read_bool(np, "zte,l2c-io-read-lock"))
+		l2x0_io_lock_enable = true;
+
 	prefetch = l2x0_saved_regs.prefetch_ctrl;
 
 	ret = of_property_read_u32(np, "arm,double-linefill", &val);
-- 
2.55.0



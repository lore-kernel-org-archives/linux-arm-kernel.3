Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8473DC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD8i7EiY62NttVrLxOz1ueFjHSn35LIMgqveexLCttY=; b=dBP+TQADa02RzPMe7eL+Pvc/q3
	ZQhRrnxIWbk8AoG+3kxtYa29d/+F3jjPj5VfQKasuobCAUUb1JFq5+D5ZklR16JQsmuHoKw8Rb7GP
	JMv2AI+TRMrX3+acwmc5fyntc035In7TInH2GRjWmduk1Rms+Y/gHcUGRC08eKjreN1DA73mBsgYi
	pcyBQJTdhz1SV/sfwq39jn/Sb1ivq+gJ5tiwEIuwCTJRyBtxXXYqv8InmdhDW6ljYieRMSpfENyWE
	pVMt4flXOyFPdNYMTp+Z/yhGRPbccPBwNNR1PgaYEJc2MUW2kg0YxY/XWukxTlBbT5AS1jfIu7z6b
	wpALAwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxo-0000000CPF3-0qIL;
	Mon, 10 Aug 2026 16:35:00 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSxl-0000000CPBe-1lST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:34:58 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a1f8959ff2so2414133a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379695; x=1786984495; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GD8i7EiY62NttVrLxOz1ueFjHSn35LIMgqveexLCttY=;
        b=MubUkaeVX8XL2Tx7i7Nj3rtjuKU/fRv7Lo7sftC8jVbwuLByIMiPxiYyBke6hR0wCb
         IVDugrKy7uFU4UNW2XHg638WQLxUvGaF2QMHrUAa3uejgjnBdDz6D4ta5VF9bcBau0ug
         GqSZFAUVA7QOGGhc434wuJI43opm0Nx6MtelMH8ZqjIIVgHBCdigkQRO/GJtzrgGt+aT
         seUvSeaR0LeHpmjSvVet7GF7i5ijb6YJ02kDjYPC44BmnnLyI1llsmTJ+H5oup5x5MgL
         dQ1CHy9GV+s19rYubYfwHO3GvgTQn/WEG4zmKrgY7aql1q7DP9eJwZtkKUGf50jBN2Lu
         1NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379695; x=1786984495;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GD8i7EiY62NttVrLxOz1ueFjHSn35LIMgqveexLCttY=;
        b=NtP2t66CpVyosRmH27XfxLgry6Vl8U1CneyLnxev+WloJvPw0vp/XpNrx8uPEl5I+6
         azsskQhyFBcJiEltfvCpSHlEA0tlKkY4wKmSRhCJ/SR+pxjEvqLPyRNAujIJcoFKlRjf
         9YTaU3XuULrOF2zi/M0UcYM0dvlllMRumDdzmD38VUl3zAZXcGOLZwEm4M2yDER6QLCn
         d35gdiDCznv20tyiqFO/OvJJcnhe4Ws/pUSacF8slLk1VymJXWARuY5Rl+CB9XjjVJS+
         XUIcTKO7/qlbqcVdrHxRxlA5iuAskjXFmzWF/jLe1ELK4YnNZi6w/mtUHYkhBXmf/AtJ
         UA8A==
X-Forwarded-Encrypted: i=1; AHgh+RqTONez3DozEbaYS3pqEB46ZYwbjnbH6WG+VnrU/WS/jEjlkdHkabJhYB5fsEjAZ7sMICCED0AxS9NZ3d8Jj4Rj@lists.infradead.org
X-Gm-Message-State: AOJu0YxLTQTejd5SgYKHmwo/7Jp1oL88EqD5gNz6tEcZzDsP7KQW6kmI
	d5matQjI65Ed44N4f5wKoGTnmD2L3X/CV3aSaw/h+axAFIagZcIsnQ4ggf/JXN1Ha7ATTqTK9KE
	vkng3jbHtbVd87/bOCA==
X-Received: from edqn11.prod.google.com ([2002:aa7:c68b:0:b0:69c:d99c:ff0f])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:22e6:b0:6a1:8ec4:65f5 with SMTP id 4fb4d7f45d1cf-6a18ec46810mr12302806a12.21.1786379694823;
 Mon, 10 Aug 2026 09:34:54 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:14 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-5-tarunsahu@google.com>
Subject: [PATCH 4/4] powerpc/ps3: use put_device() on device_register()
 failure in ps3_system_bus_device_register
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093457_503976_4E20622A 
X-CRM114-Status: GOOD (  14.15  )
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

When device_register() fails, calling put_device() ensures that the
device reference count drops to 0, which invokes the release callback
ps3_system_bus_release_device() to cleanly free the device and its
associated driver core resources.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 2 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 9109c218a060..8d0c77db1764 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -90,14 +90,12 @@ static int __init ps3_register_lpm_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
 
-
-fail_register:
 fail_rights:
 fail_read_repo:
 	kfree(dev);
@@ -121,6 +119,12 @@ static int __init ps3_setup_gelic_device(
 		struct ps3_dma_region d_region;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	BUG_ON(repo->bus_type != PS3_BUS_TYPE_SB);
@@ -164,13 +168,12 @@ static int __init ps3_setup_gelic_device(
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return result;
 
-fail_device_register:
 fail_dma_init:
 fail_find_interrupt:
 	kfree(p);
@@ -192,6 +195,12 @@ static int __init ps3_setup_uhc_device(
 	u64 bus_addr;
 	u64 len;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	BUG_ON(repo->bus_type != PS3_BUS_TYPE_SB);
@@ -252,13 +261,12 @@ static int __init ps3_setup_uhc_device(
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return result;
 
-fail_device_register:
 fail_mmio_init:
 fail_dma_init:
 fail_find_reg:
@@ -291,6 +299,12 @@ static int __init ps3_setup_vuart_device(enum ps3_match_id match_id,
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d: match_id %u, port %u\n", __func__, __LINE__,
 		match_id, port_number);
 
@@ -308,15 +322,10 @@ static int __init ps3_setup_vuart_device(enum ps3_match_id match_id,
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d fail\n", __func__, __LINE__);
-	return result;
 }
 
 static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
@@ -327,6 +336,12 @@ static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
 	u64 port, blk_size, num_blocks;
 	unsigned int num_regions, i;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->sbd).
+	 * sbd must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct ps3_storage_device, sbd) != 0);
+
 	pr_debug(" -> %s:%u: match_id %u\n", __func__, __LINE__, match_id);
 
 	result = ps3_repository_read_stor_dev_info(repo->bus_index,
@@ -395,13 +410,12 @@ static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
 	if (result) {
 		pr_debug("%s:%u ps3_system_bus_device_register failed\n",
 			 __func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%u\n", __func__, __LINE__);
 	return 0;
 
-fail_device_register:
 fail_read_region:
 fail_find_interrupt:
 	kfree(p);
@@ -445,6 +459,12 @@ static int __init ps3_register_sound_devices(void)
 		struct ps3_mmio_region m_region;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(*p);
@@ -461,15 +481,10 @@ static int __init ps3_register_sound_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 static int __init ps3_register_graphics_devices(void)
@@ -479,6 +494,12 @@ static int __init ps3_register_graphics_devices(void)
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(struct layout);
@@ -495,16 +516,11 @@ static int __init ps3_register_graphics_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 static int __init ps3_register_ramdisk_device(void)
@@ -514,6 +530,12 @@ static int __init ps3_register_ramdisk_device(void)
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(struct layout);
@@ -530,16 +552,11 @@ static int __init ps3_register_ramdisk_device(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 /**
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 0537a678a32f..0918c74d3e19 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -774,6 +774,8 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 	pr_debug("%s:%d add %s\n", __func__, __LINE__, dev_name(&dev->core));
 
 	result = device_register(&dev->core);
+	if (result)
+		put_device(&dev->core);
 	return result;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog



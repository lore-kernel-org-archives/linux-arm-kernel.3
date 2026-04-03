Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBBCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEt3hSd9EKLTT0Wo55fxgtHBJYKHT3uVPRy+V8bzYNY=; b=ICH909j9jiN6/xTfS50eSjPTLd
	9/VMyWlc0Nr+ti2sxP/Qpg7sRhcodyj7UsE1+ynWFgyGl5FkXxRbQls+2SJG8ejQ/H/TA49umuyij
	kFwSwREdPFKyvHJEIq5S/LyI7efgI9t3w4myzhQHWDRapYsNTZUGNIESg0AUURcWxHfi2X3H7pHo3
	ai9AWuVwFzXcH4JhLrrzOcy8Hfneafxk09shFWMLhmgBAnwmwqVqg27QgSiKffzoLJyAEuPiakDKb
	csoFwsejAB5o8zSd5Gxil6mh1vs1IK6qZURpbb97xn7ryBXrPyX+LlKJSlCEK6K4PAXDmDkrYqQCV
	aQGDI62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Slc-00000000zfG-1kZB;
	Fri, 03 Apr 2026 00:52:08 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Sla-00000000zdk-0MLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 00:52:07 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-128e4d0cc48so1698068c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 17:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177525; x=1775782325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEt3hSd9EKLTT0Wo55fxgtHBJYKHT3uVPRy+V8bzYNY=;
        b=muFsHxv3n5hL+QY621UR+sxd3m00sG6HpTjntR+mzsXT6M+0eRpQTB1r+BmA4iYJzm
         pVzlmvXwVkLgHxDC5k6uqA6S/r18woEt962V5A19A+muqQecad+Lm4pafcp2TVTBueSC
         ch1Ckr22fTBzWPq+W1JQ8cFfk6IrzFdek7m8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177525; x=1775782325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VEt3hSd9EKLTT0Wo55fxgtHBJYKHT3uVPRy+V8bzYNY=;
        b=YfrnHfsvOxplXtgFd+9FjOGBmdj+Zmsstw3rnSZ4elFvI+0GgeP85eQ0mSzrqK5PzQ
         Lv2BCOhwPd+eJPMH0N0ddyBhRys1MOy5KFG0n19nom9JofIxR1GCJMiI6GDFGiPkoTvU
         cprHPuq4ZTe0AqNEta6gEqYtqTHBpRMYha33ScszVl/vhCKGzohkClMfdskMgXKkvQsR
         ylShy6Vg3jGc+0YjUvafczA7nRzKjm9SH3W6Idbl5ahZFqIe9cR8zszAgBmz2yWO3/d+
         Xx0KVI6Qh8geXDYl83tBWuy7RTYIlUvd6QS4m3ZtQE+WkjdRlN5XU91MFZniAQz98dqa
         qnCw==
X-Forwarded-Encrypted: i=1; AJvYcCXzHkuk2csiZBuF3FbUs1zR/MK91bJy2CzKUDbyQgM5oq89zqrgwLORJUyoUmBxcf49r4FTlCF/prorxn0JLVG9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+2qsJwe2PFd55D1239T5wFv1d0rgEhqh+puoIJu5jGdeamrVa
	7fFwFQ/wWKH8egE4Pa/OvQn7HsLChEzrNZ2At+dr66qlW6+MZ7eEDOsHEyGiPJQI/A==
X-Gm-Gg: ATEYQzwpYITkkd4hc7wvLiR4gv03M0W43CV8CLRBdtQHe83ov8wBvXuwizKsPdhPVI3
	I7tp5mLNGVqwNnh2IvdA2htk5cd+/Vm1QxFQFpSEuv0i6MwFW+CvFuLumoAMitcHjadmLikTgjq
	2fZQJpAh+AZoFFpwMYzv89Rqy5419qSZNRPAFv+95f5D19KKBcTHSVeSLsT2e1OaapBqVwAG3PB
	3tGMR+FyFYIjmifA4Xyq4qpK+ymVA51e0Ndkk2uKDa1s0cwY2Z7orfaiAZ8ojvTp8dgvTg77Qwh
	vfG5QJG1u8nWe6apOqSNZQrW1Vx6NdoTne5HDm9I+e/rTeMaggq3ZT+11bSBnGTcngt5i/LWWwI
	ZoSfT6LZtCzohjShTfBl2TQAA8IE/oluDXmJWhRCwpLcengItIPU9MMkNXfoPKKx+SxUXIKEilL
	Mc61JcojMGvwAwh6gdLMyp3R3mBXosdktwhO2X5BsldoFXtaYCziUqXUWlKnSNdi3x9ddzfm9A2
	2Xaue56fLc=
X-Received: by 2002:a05:7022:423:b0:119:e56b:91ec with SMTP id a92af1059eb24-12bfb75ee38mr560487c88.29.1775177525063;
        Thu, 02 Apr 2026 17:52:05 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:52:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	chleroy@kernel.org,
	david@kernel.org,
	driver-core@lists.linux.dev,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	maz@kernel.org,
	miko.lenczewski@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	osalvador@suse.de,
	oupton@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	will@kernel.org,
	yangyicong@hisilicon.com,
	yeoreum.yun@arm.com
Subject: [PATCH v3 9/9] driver core: Replace dev->offline + ->offline_disabled with DEV_FLAGs
Date: Thu,  2 Apr 2026 17:49:55 -0700
Message-ID: <20260402174925.v3.9.I897d478b4a9361d79cd5073207c1062fd4d0d0e4@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403005005.30424-1-dianders@chromium.org>
References: <20260403005005.30424-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_175206_140458_7315B2A0 
X-CRM114-Status: GOOD (  22.35  )
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

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "offline" and "offline_disabled" over
to the "flags" field so modifications are safe.

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Toshi Kani <toshi.kani@hp.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

Changes in v3:
- New

 arch/arm64/kernel/cpufeature.c                |  2 +-
 .../platforms/pseries/hotplug-memory.c        |  4 ++--
 drivers/acpi/scan.c                           |  3 ++-
 drivers/base/core.c                           | 19 ++++++++++---------
 drivers/base/cpu.c                            |  4 ++--
 drivers/base/memory.c                         |  2 +-
 include/linux/device.h                        |  9 ++++-----
 kernel/cpu.c                                  |  4 ++--
 8 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32c2dbcc0c64..f6f7c35b7a93 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -4042,7 +4042,7 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
 	 */
 	lucky_winner = cpu_32bit ? cpu : cpumask_any_and(cpu_32bit_el0_mask,
 							 cpu_active_mask);
-	get_cpu_device(lucky_winner)->offline_disabled = true;
+	set_bit(DEV_FLAG_OFFLINE_DISABLED, &get_cpu_device(lucky_winner)->flags);
 	setup_elf_hwcaps(compat_elf_hwcaps);
 	elf_hwcap_fixup();
 	pr_info("Asymmetric 32-bit EL0 support detected on CPU %u; CPU hot-unplug disabled on CPU %u\n",
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index b2f14db59034..d9a0a75ada46 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -213,9 +213,9 @@ static int dlpar_change_lmb_state(struct drmem_lmb *lmb, bool online)
 		return -EINVAL;
 	}
 
-	if (online && mem_block->dev.offline)
+	if (online && test_bit(DEV_FLAG_OFFLINE, &mem_block->dev.flags))
 		rc = device_online(&mem_block->dev);
-	else if (!online && !mem_block->dev.offline)
+	else if (!online && !test_bit(DEV_FLAG_OFFLINE, &mem_block->dev.flags))
 		rc = device_offline(&mem_block->dev);
 	else
 		rc = 0;
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index e8cdbdb46fdb..f2707b704468 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -122,7 +122,8 @@ bool acpi_scan_is_offline(struct acpi_device *adev, bool uevent)
 	mutex_lock_nested(&adev->physical_node_lock, SINGLE_DEPTH_NESTING);
 
 	list_for_each_entry(pn, &adev->physical_node_list, node)
-		if (device_supports_offline(pn->dev) && !pn->dev->offline) {
+		if (device_supports_offline(pn->dev) &&
+		    !test_bit(DEV_FLAG_OFFLINE, &pn->dev->flags)) {
 			if (uevent)
 				kobject_uevent_env(&pn->dev->kobj, KOBJ_CHANGE, envp);
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index a87bd40499b6..63d724ece384 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2789,7 +2789,7 @@ static ssize_t online_show(struct device *dev, struct device_attribute *attr,
 	bool val;
 
 	device_lock(dev);
-	val = !dev->offline;
+	val = !test_bit(DEV_FLAG_OFFLINE, &dev->flags);
 	device_unlock(dev);
 	return sysfs_emit(buf, "%u\n", val);
 }
@@ -2914,7 +2914,7 @@ static int device_add_attrs(struct device *dev)
 	if (error)
 		goto err_remove_type_groups;
 
-	if (device_supports_offline(dev) && !dev->offline_disabled) {
+	if (device_supports_offline(dev) && !test_bit(DEV_FLAG_OFFLINE_DISABLED, &dev->flags)) {
 		error = device_create_file(dev, &dev_attr_online);
 		if (error)
 			goto err_remove_dev_groups;
@@ -4179,7 +4179,8 @@ static int device_check_offline(struct device *dev, void *not_used)
 	if (ret)
 		return ret;
 
-	return device_supports_offline(dev) && !dev->offline ? -EBUSY : 0;
+	return device_supports_offline(dev) &&
+	       !test_bit(DEV_FLAG_OFFLINE, &dev->flags) ? -EBUSY : 0;
 }
 
 /**
@@ -4197,7 +4198,7 @@ int device_offline(struct device *dev)
 {
 	int ret;
 
-	if (dev->offline_disabled)
+	if (test_bit(DEV_FLAG_OFFLINE_DISABLED, &dev->flags))
 		return -EPERM;
 
 	ret = device_for_each_child(dev, NULL, device_check_offline);
@@ -4206,13 +4207,13 @@ int device_offline(struct device *dev)
 
 	device_lock(dev);
 	if (device_supports_offline(dev)) {
-		if (dev->offline) {
+		if (test_bit(DEV_FLAG_OFFLINE, &dev->flags)) {
 			ret = 1;
 		} else {
 			ret = dev->bus->offline(dev);
 			if (!ret) {
 				kobject_uevent(&dev->kobj, KOBJ_OFFLINE);
-				dev->offline = true;
+				set_bit(DEV_FLAG_OFFLINE, &dev->flags);
 			}
 		}
 	}
@@ -4237,11 +4238,11 @@ int device_online(struct device *dev)
 
 	device_lock(dev);
 	if (device_supports_offline(dev)) {
-		if (dev->offline) {
+		if (test_bit(DEV_FLAG_OFFLINE, &dev->flags)) {
 			ret = dev->bus->online(dev);
 			if (!ret) {
 				kobject_uevent(&dev->kobj, KOBJ_ONLINE);
-				dev->offline = false;
+				clear_bit(DEV_FLAG_OFFLINE, &dev->flags);
 			}
 		} else {
 			ret = 1;
@@ -4715,7 +4716,7 @@ static int device_attrs_change_owner(struct device *dev, kuid_t kuid,
 	if (error)
 		return error;
 
-	if (device_supports_offline(dev) && !dev->offline_disabled) {
+	if (device_supports_offline(dev) && !test_bit(DEV_FLAG_OFFLINE_DISABLED, &dev->flags)) {
 		/* Change online device attributes of @dev to @kuid/@kgid. */
 		error = sysfs_file_change_owner(kobj, dev_attr_online.attr.name,
 						kuid, kgid);
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 875abdc9942e..e4e6a399def4 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -422,8 +422,8 @@ int register_cpu(struct cpu *cpu, int num)
 	cpu->dev.id = num;
 	cpu->dev.bus = &cpu_subsys;
 	cpu->dev.release = cpu_device_release;
-	cpu->dev.offline_disabled = !cpu->hotpluggable;
-	cpu->dev.offline = !cpu_online(num);
+	assign_bit(DEV_FLAG_OFFLINE_DISABLED, &cpu->dev.flags, !cpu->hotpluggable);
+	assign_bit(DEV_FLAG_OFFLINE, &cpu->dev.flags, !cpu_online(num));
 	cpu->dev.of_node = of_get_cpu_node(num, NULL);
 	cpu->dev.groups = common_cpu_attr_groups;
 	if (cpu->hotpluggable)
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index a3091924918b..7f42727dde81 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -697,7 +697,7 @@ static int __add_memory_block(struct memory_block *memory)
 	memory->dev.id = memory->start_section_nr / sections_per_block;
 	memory->dev.release = memory_block_release;
 	memory->dev.groups = memory_memblk_attr_groups;
-	memory->dev.offline = memory->state == MEM_OFFLINE;
+	assign_bit(DEV_FLAG_OFFLINE, &memory->dev.flags, memory->state == MEM_OFFLINE);
 
 	ret = device_register(&memory->dev);
 	if (ret) {
diff --git a/include/linux/device.h b/include/linux/device.h
index f6ca067bacca..fd53aa04cad9 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -484,6 +484,8 @@ struct device_physical_location {
  *		architecture supports non-coherent devices.
  * @DEV_FLAG_OF_NODE_REUSED: Set if the device-tree node is shared with an
  *		ancestor device.
+ * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
+ * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
@@ -494,6 +496,8 @@ enum struct_device_flags {
 	DEV_FLAG_STATE_SYNCED,
 	DEV_FLAG_DMA_COHERENT,
 	DEV_FLAG_OF_NODE_REUSED,
+	DEV_FLAG_OFFLINE_DISABLED,
+	DEV_FLAG_OFFLINE,
 };
 
 /**
@@ -571,8 +575,6 @@ enum struct_device_flags {
  *              should be set by the subsystem / bus driver that discovered
  *              the device.
  *
- * @offline_disabled: If set, the device is permanently online.
- * @offline:	Set after successful invocation of bus type's .offline().
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -677,9 +679,6 @@ struct device {
 
 	enum device_removable	removable;
 
-	bool			offline_disabled:1;
-	bool			offline:1;
-
 	unsigned long		flags;
 };
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..15a873ad8025 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2639,7 +2639,7 @@ static void cpuhp_offline_cpu_device(unsigned int cpu)
 {
 	struct device *dev = get_cpu_device(cpu);
 
-	dev->offline = true;
+	set_bit(DEV_FLAG_OFFLINE, &dev->flags);
 	/* Tell user space about the state change */
 	kobject_uevent(&dev->kobj, KOBJ_OFFLINE);
 }
@@ -2648,7 +2648,7 @@ static void cpuhp_online_cpu_device(unsigned int cpu)
 {
 	struct device *dev = get_cpu_device(cpu);
 
-	dev->offline = false;
+	clear_bit(DEV_FLAG_OFFLINE, &dev->flags);
 	/* Tell user space about the state change */
 	kobject_uevent(&dev->kobj, KOBJ_ONLINE);
 }
-- 
2.53.0.1213.gd9a14994de-goog



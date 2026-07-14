Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC44C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rar/kdWXc0FAws5pLlRcMXbbvccLEgPpbnHbobO2LGA=; b=Be5SgCW3vyDGCEIadd/TH2EOpf
	T39jt30uyjsXsr2sPJ6MyWOGgngHD8L/aFE4rVnFGBG7VAj9w8z1WI3x6/CD/KfCIffSzo8prbHkv
	flcnoSRZHJ62mnR6UIDX+C+A2uLIJF6Hd1QnTlttG78laeQnmiQAhd2KpPa9tZpUb1cv5a7AgLE1n
	xN5lelahLL7co04Rd2VMqra+qT/fDFaCB6BVZAuwWrIkOENfzo4wdoY0xAOxh19PBHZu31nqBY8Rd
	9h7vzufeQIqSVSg2Hx+qfHzfX9NwDr4qDI9O/iIHAG8s1YYK10WmIp+QhdYh9dBWJG4hZFsZwceXK
	2uYDONEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMa-0000000Cgqa-35mb;
	Tue, 14 Jul 2026 16:52:08 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMT-0000000Cgic-0fmi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784047914;
	bh=y+nMsMtnPzeoRMm6XOGdcqLiE1JJKdTJFdXgVfqhtcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AfRCxkVhMPXaeJ4X2pakjBoLYVMtENgqh6kslhbd+3AQg3WfIGgBcX2hDtINAVg+v
	 Hw6tnma1FmLBkiT/Ldj7crCME1oCD5BjCY6CJbbzBhJYmNVDVsdn5FyukoGu1QvVSV
	 BKkbdrDrb2bAHn8Ii1Z7+wIuZQYUY5Pu5/df8wFo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 14 Jul 2026 18:51:50 +0200
Subject: [PATCH 3/3] driver core: Constify the signature of
 device_show/store_*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-sysfs-const-attr-dev_ext_attr-v1-3-6b2c0435d621@weissschuh.net>
References: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
In-Reply-To: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Yushan Wang <wangyushan12@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784047913; l=5833;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=y+nMsMtnPzeoRMm6XOGdcqLiE1JJKdTJFdXgVfqhtcg=;
 b=CE/PLEPjEk9Clk2ILAqAI/VCFiwwgxAk66fuzdwrBCBYf62zj4nI5gb6xVcT3JfCfpR44koSU
 BdRAPrwT0zcBc20cdAFo7P5079v7q7Z6w6civBd2ZOcqPBwj5qITrGA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095201_367179_80A43B49 
X-CRM114-Status: GOOD (  13.02  )
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

Prepare for the constification of 'struct dev_ext_attribute' by changing
the signature of the standard callback functions.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/perf/hv-24x7.c |  2 +-
 drivers/base/core.c         | 30 +++++++++++++++---------------
 include/linux/device.h      | 14 +++++++-------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index abb4cfb11fcc..c0abac00e026 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -462,7 +462,7 @@ static struct attribute *device_str_attr_create_(char *name, char *str)
 	attr->var = str;
 	attr->attr.attr.name = name;
 	attr->attr.attr.mode = 0444;
-	attr->attr.show = device_show_string;
+	attr->attr.show_const = device_show_string;
 
 	return &attr->attr.attr;
 }
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..649b8a126920 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2513,13 +2513,13 @@ static const struct sysfs_ops dev_sysfs_ops = {
 	.store	= dev_attr_store,
 };
 
-#define to_ext_attr(x) container_of(x, struct dev_ext_attribute, attr)
+#define to_ext_attr(x) container_of_const(x, struct dev_ext_attribute, attr)
 
 ssize_t device_store_ulong(struct device *dev,
-			   struct device_attribute *attr,
+			   const struct device_attribute *attr,
 			   const char *buf, size_t size)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 	int ret;
 	unsigned long new;
 
@@ -2533,19 +2533,19 @@ ssize_t device_store_ulong(struct device *dev,
 EXPORT_SYMBOL_GPL(device_store_ulong);
 
 ssize_t device_show_ulong(struct device *dev,
-			  struct device_attribute *attr,
+			  const struct device_attribute *attr,
 			  char *buf)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 	return sysfs_emit(buf, "%lx\n", *(unsigned long *)(ea->var));
 }
 EXPORT_SYMBOL_GPL(device_show_ulong);
 
 ssize_t device_store_int(struct device *dev,
-			 struct device_attribute *attr,
+			 const struct device_attribute *attr,
 			 const char *buf, size_t size)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 	int ret;
 	long new;
 
@@ -2562,19 +2562,19 @@ ssize_t device_store_int(struct device *dev,
 EXPORT_SYMBOL_GPL(device_store_int);
 
 ssize_t device_show_int(struct device *dev,
-			struct device_attribute *attr,
+			const struct device_attribute *attr,
 			char *buf)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 
 	return sysfs_emit(buf, "%d\n", *(int *)(ea->var));
 }
 EXPORT_SYMBOL_GPL(device_show_int);
 
-ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
+ssize_t device_store_bool(struct device *dev, const struct device_attribute *attr,
 			  const char *buf, size_t size)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 
 	if (kstrtobool(buf, ea->var) < 0)
 		return -EINVAL;
@@ -2583,19 +2583,19 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 }
 EXPORT_SYMBOL_GPL(device_store_bool);
 
-ssize_t device_show_bool(struct device *dev, struct device_attribute *attr,
+ssize_t device_show_bool(struct device *dev, const struct device_attribute *attr,
 			 char *buf)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 
 	return sysfs_emit(buf, "%d\n", *(bool *)(ea->var));
 }
 EXPORT_SYMBOL_GPL(device_show_bool);
 
 ssize_t device_show_string(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+			   const struct device_attribute *attr, char *buf)
 {
-	struct dev_ext_attribute *ea = to_ext_attr(attr);
+	const struct dev_ext_attribute *ea = to_ext_attr(attr);
 
 	return sysfs_emit(buf, "%s\n", (char *)ea->var);
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index 7b2baffdd2f5..61e2b98b38a4 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -127,19 +127,19 @@ struct dev_ext_attribute {
 	void *var;
 };
 
-ssize_t device_show_ulong(struct device *dev, struct device_attribute *attr,
+ssize_t device_show_ulong(struct device *dev, const struct device_attribute *attr,
 			  char *buf);
-ssize_t device_store_ulong(struct device *dev, struct device_attribute *attr,
+ssize_t device_store_ulong(struct device *dev, const struct device_attribute *attr,
 			   const char *buf, size_t count);
-ssize_t device_show_int(struct device *dev, struct device_attribute *attr,
+ssize_t device_show_int(struct device *dev, const struct device_attribute *attr,
 			char *buf);
-ssize_t device_store_int(struct device *dev, struct device_attribute *attr,
+ssize_t device_store_int(struct device *dev, const struct device_attribute *attr,
 			 const char *buf, size_t count);
-ssize_t device_show_bool(struct device *dev, struct device_attribute *attr,
+ssize_t device_show_bool(struct device *dev, const struct device_attribute *attr,
 			char *buf);
-ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
+ssize_t device_store_bool(struct device *dev, const struct device_attribute *attr,
 			 const char *buf, size_t count);
-ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
+ssize_t device_show_string(struct device *dev, const struct device_attribute *attr,
 			   char *buf);
 
 typedef ssize_t __device_show_handler_const(struct device *dev, const struct device_attribute *attr,

-- 
2.55.0



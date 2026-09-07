Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3636C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6tgaHbVtiWTh3fQBGQAiRrlbsazgMdvtDokO7aUJ4I=; b=y9wVjGvbqgB6StITHQHETIgS+j
	uzGyNqhgomFpF2//a54UrP2m8s6ehT/SzXyBf7PpNSHBgfLpQjvABFFRKIwlb8BWp24BJ14E0O8tN
	ccSgV8XG6bKCWBBSTElGjv2lUxe9r9UkSMzML45kGnsy4fGnEsxPEbQcV7Uch6YIYekMFgy0yAzG1
	RqoMH8t+Ergzi6B/osRXhMbqaI7cBGHuzZdmstaBQIHUPkVPFfpjJh5cZ3uphkJGKz5v/66uJ/W++
	BfS82Ge+cnYTM+yDjHfmFtT/AaVLG6FugDXQvKzJ4p6+tUY7eDjODfwWBalfN8y/+MWiYPJJdLOxN
	ObRxpzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAZ-00000005xTp-3N9V;
	Mon, 07 Sep 2026 05:45:29 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAS-00000005xP9-1h2n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788759912;
	bh=jHaxIQ3pA1eeWIle1Pk9J90EZmpff5RsKw2PfaVnl9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SfWSK/ahn06kZntBnbhT0gYtxboxUyXFW9sznUoNgaeOlkScL/EVWj5kKaLRsnxwj
	 qMTCIvjn1ZFkBsUI621/mshp8jAEz3LFaTdQTx92ltJp+/r/7ijQnRwI9imYQl/R3l
	 jWF+lfEnUxnVx74sACHqIQFXMyfW7+dmRlk0kr4s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 07 Sep 2026 07:45:03 +0200
Subject: [PATCH v2 3/3] driver core: Constify the signature of
 device_show/store_*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-sysfs-const-attr-dev_ext_attr-v2-3-bf53afe57071@weissschuh.net>
References: <20260907-sysfs-const-attr-dev_ext_attr-v2-0-bf53afe57071@weissschuh.net>
In-Reply-To: <20260907-sysfs-const-attr-dev_ext_attr-v2-0-bf53afe57071@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759912; l=5954;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jHaxIQ3pA1eeWIle1Pk9J90EZmpff5RsKw2PfaVnl9A=;
 b=HSiLRH38g3xSkpGb5oIKBJaK+SOmvIEuNwqO/eqdT7KHt7JaySzEjU5t5xVPUxSbcL/2oSJ8q
 Vg+/kfFlctnBza+sS9aoCZ//ve+6Dyrc1y3gZ5QVZWXlD8L1tbcV9W2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224520_607708_FAE000A0 
X-CRM114-Status: GOOD (  14.66  )
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

Migrate the hv-24x7 driver in the same commit. It is the only user to
manually assign one of the standard callbacks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/perf/hv-24x7.c |  2 +-
 drivers/base/core.c         | 30 +++++++++++++++---------------
 include/linux/device.h      | 14 +++++++-------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index b0eedf185960..3e094dc7d76b 100644
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
index 4c0c373998a1..5daa88fa724a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2517,13 +2517,13 @@ static const struct sysfs_ops dev_sysfs_ops = {
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
 
@@ -2537,19 +2537,19 @@ ssize_t device_store_ulong(struct device *dev,
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
 
@@ -2566,19 +2566,19 @@ ssize_t device_store_int(struct device *dev,
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
@@ -2587,19 +2587,19 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
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
index aee79fd6b32b..90cdd77458bb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -129,19 +129,19 @@ struct dev_ext_attribute {
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



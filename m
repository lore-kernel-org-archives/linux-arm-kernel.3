Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B9FD69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+T3F2Nl6CPd7nc0Cq13dF3/6pp1DpiqY/aDudXd1Xck=; b=lA/6zhnMku8mxte5k6u7vtOezl
	Zq+JxPaUCUJhiNj8gxpcrpgTz/p4UWx46CtrIuF/ZEkJmOjrpYZXhI3IbynxUtJNodkUa6cWa+gyd
	SEWnYwNDE6W177YdQ6DYcvLQx0IvyHMx8PmtMhBhpFkSpExEA5hI8KOObRepbH6xRTOc83++lLT2w
	1YtNnW9JYXMuvY5/TDVsAQcEoWKBn1HMtGOAlk+l36AfKGK4TnNCbr0/xllqwU9p2CwnZZFOakrfr
	pYafuBCFu9cEfGi7fFS1Fjl585gEOZggVucINmJD8SMxIUwFTKQ0ZS3/+KvjokAEdhn+OgjGphQ8z
	uZT+bKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgIn-0000000FrhZ-0yh4;
	Thu, 28 Nov 2024 15:19:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgCY-0000000FqWh-2474
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:13:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0405F1476;
	Thu, 28 Nov 2024 07:13:36 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583663F66E;
	Thu, 28 Nov 2024 07:13:04 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	apatel@ventanamicro.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	s.abdollahi22@imperial.ac.uk
Subject: [PATCH kvmtool 3/4] arm64: Use the kernel header image_size when loading into memory
Date: Thu, 28 Nov 2024 15:12:45 +0000
Message-ID: <20241128151246.10858-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128151246.10858-1-alexandru.elisei@arm.com>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071306_616160_7F435518 
X-CRM114-Status: GOOD (  24.33  )
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

The field 'image_size' from the kernel header encodes the kernel size when
loaded in memory. This includes the BSS section which gets zeroed early
during boot (for example, in early_map_kernel() in Linux v6.12), section
which is not reflected in the file size.

kvmtool, after loading the kernel image into memory, uses the file size,
not the image size, to compute the end of the kernel to check for overlaps.
As a result, kvmtool doesn't detect when the DTB or initrd overlap with the
in memory kernel image as long as they don't overlap with the file, and
this leads to Linux silently overwriting the DTB or the initrd with zeroes
during boot.

This kind of issue, when it happens, is not trivial to debug. kvmtool
already reads the image header to get the kernel offset, so expand on that
to also read the image size, and use it instead of the file size for memory
layout calculations.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/aarch32/include/kvm/kvm-arch.h |  2 +
 arm/aarch64/include/kvm/kvm-arch.h |  5 +-
 arm/aarch64/kvm.c                  | 80 +++++++++++++++++++++++-------
 arm/kvm.c                          | 15 ++++--
 4 files changed, 78 insertions(+), 24 deletions(-)

diff --git a/arm/aarch32/include/kvm/kvm-arch.h b/arm/aarch32/include/kvm/kvm-arch.h
index 467fb09175b8..07d711e2f4c1 100644
--- a/arm/aarch32/include/kvm/kvm-arch.h
+++ b/arm/aarch32/include/kvm/kvm-arch.h
@@ -4,8 +4,10 @@
 #include <linux/sizes.h>
 
 #define kvm__arch_get_kern_offset(...)	0x8000
+#define kvm__arch_get_kernel_size(...)	0
 
 struct kvm;
+static inline void kvm__arch_read_kernel_header(struct kvm *kvm, int fd) {}
 static inline void kvm__arch_enable_mte(struct kvm *kvm) {}
 
 #define MAX_PAGE_SIZE	SZ_4K
diff --git a/arm/aarch64/include/kvm/kvm-arch.h b/arm/aarch64/include/kvm/kvm-arch.h
index 02d09a413831..97ab42485158 100644
--- a/arm/aarch64/include/kvm/kvm-arch.h
+++ b/arm/aarch64/include/kvm/kvm-arch.h
@@ -4,7 +4,10 @@
 #include <linux/sizes.h>
 
 struct kvm;
-unsigned long long kvm__arch_get_kern_offset(struct kvm *kvm, int fd);
+void kvm__arch_read_kernel_header(struct kvm *kvm, int fd);
+unsigned long long kvm__arch_get_kern_offset(struct kvm *kvm);
+u64 kvm__arch_get_kernel_size(struct kvm *kvm);
+
 int kvm__arch_get_ipa_limit(struct kvm *kvm);
 void kvm__arch_enable_mte(struct kvm *kvm);
 
diff --git a/arm/aarch64/kvm.c b/arm/aarch64/kvm.c
index 54200c9eec9d..6fcc828cbe01 100644
--- a/arm/aarch64/kvm.c
+++ b/arm/aarch64/kvm.c
@@ -8,6 +8,8 @@
 
 #include <kvm/util.h>
 
+static struct arm64_image_header *kernel_header;
+
 int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 {
 	struct kvm *kvm = opt->ptr;
@@ -57,50 +59,82 @@ u64 kvm__arch_default_ram_address(void)
 	return ARM_MEMORY_AREA;
 }
 
+void kvm__arch_read_kernel_header(struct kvm *kvm, int fd)
+{
+	const char *debug_str;
+	off_t cur_offset;
+	ssize_t size;
+
+	if (kvm->cfg.arch.aarch32_guest)
+		return;
+
+	kernel_header = malloc(sizeof(*kernel_header));
+	if (!kernel_header)
+		return;
+
+	cur_offset = lseek(fd, 0, SEEK_CUR);
+	if (cur_offset == (off_t)-1 || lseek(fd, 0, SEEK_SET) == (off_t)-1) {
+		debug_str = "Failed to seek in kernel image file";
+		goto fail;
+	}
+
+	size = xread(fd, kernel_header, sizeof(*kernel_header));
+	if (size < 0 || (size_t)size < sizeof(*kernel_header))
+		die("Failed to read kernel image header");
+
+	lseek(fd, cur_offset, SEEK_SET);
+
+	if (memcmp(&kernel_header->magic, ARM64_IMAGE_MAGIC, sizeof(kernel_header->magic))) {
+		debug_str = "Kernel image magic not matching";
+		kernel_header = NULL;
+		goto fail;
+	}
+
+	return;
+
+fail:
+	pr_debug("%s, using defaults", debug_str);
+}
+
 /*
  * Return the TEXT_OFFSET value that the guest kernel expects. Note
  * that pre-3.17 kernels expose this value using the native endianness
  * instead of Little-Endian. BE kernels of this vintage may fail to
  * boot. See Documentation/arm64/booting.rst in your local kernel tree.
  */
-unsigned long long kvm__arch_get_kern_offset(struct kvm *kvm, int fd)
+unsigned long long kvm__arch_get_kern_offset(struct kvm *kvm)
 {
-	struct arm64_image_header header;
-	off_t cur_offset;
-	ssize_t size;
 	const char *debug_str;
 
 	/* the 32bit kernel offset is a well known value */
 	if (kvm->cfg.arch.aarch32_guest)
 		return 0x8000;
 
-	cur_offset = lseek(fd, 0, SEEK_CUR);
-	if (cur_offset == (off_t)-1 ||
-	    lseek(fd, 0, SEEK_SET) == (off_t)-1) {
-		debug_str = "Failed to seek in kernel image file";
+	if (!kernel_header) {
+		debug_str = "Kernel header is missing";
 		goto default_offset;
 	}
 
-	size = xread(fd, &header, sizeof(header));
-	if (size < 0 || (size_t)size < sizeof(header))
-		die("Failed to read kernel image header");
-
-	lseek(fd, cur_offset, SEEK_SET);
-
-	if (memcmp(&header.magic, ARM64_IMAGE_MAGIC, sizeof(header.magic))) {
-		debug_str = "Kernel image magic not matching";
+	if (!le64_to_cpu(kernel_header->image_size)) {
+		debug_str = "Image size is 0";
 		goto default_offset;
 	}
 
-	if (le64_to_cpu(header.image_size))
-		return le64_to_cpu(header.text_offset);
+	return le64_to_cpu(kernel_header->text_offset);
 
-	debug_str = "Image size is 0";
 default_offset:
 	pr_debug("%s, assuming TEXT_OFFSET to be 0x80000", debug_str);
 	return 0x80000;
 }
 
+u64 kvm__arch_get_kernel_size(struct kvm *kvm)
+{
+	if (kvm->cfg.arch.aarch32_guest || !kernel_header)
+		return 0;
+
+	return le64_to_cpu(kernel_header->image_size);
+}
+
 int kvm__arch_get_ipa_limit(struct kvm *kvm)
 {
 	int ret;
@@ -160,3 +194,11 @@ void kvm__arch_enable_mte(struct kvm *kvm)
 
 	pr_debug("MTE capability enabled");
 }
+
+static int kvm__arch_free_kernel_header(struct kvm *kvm)
+{
+	free(kernel_header);
+
+	return 0;
+}
+late_exit(kvm__arch_free_kernel_header);
diff --git a/arm/kvm.c b/arm/kvm.c
index 4beae69e1fb3..9013be489aff 100644
--- a/arm/kvm.c
+++ b/arm/kvm.c
@@ -104,6 +104,7 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	void *pos, *kernel_end, *limit;
 	unsigned long guest_addr;
 	ssize_t file_size;
+	u64 kernel_size;
 
 	/*
 	 * Linux requires the initrd and dtb to be mapped inside lowmem,
@@ -111,7 +112,9 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	 */
 	limit = kvm->ram_start + min(kvm->ram_size, (u64)SZ_256M);
 
-	pos = kvm->ram_start + kvm__arch_get_kern_offset(kvm, fd_kernel);
+	kvm__arch_read_kernel_header(kvm, fd_kernel);
+
+	pos = kvm->ram_start + kvm__arch_get_kern_offset(kvm);
 	kvm->arch.kern_guest_start = host_to_guest_flat(kvm, pos);
 	if (!kvm->arch.kern_guest_start)
 			die("guest memory too small to contain the kernel");
@@ -122,9 +125,13 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 
 		die_perror("kernel read");
 	}
-	kernel_end = pos + file_size;
-	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
-		 kvm->arch.kern_guest_start, file_size);
+
+	kernel_size = kvm__arch_get_kernel_size(kvm);
+	if (!kernel_size || kernel_size < (u64)file_size)
+		kernel_size = file_size;
+	kernel_end = pos + kernel_size;
+	pr_debug("Loaded kernel to 0x%llx (%llu bytes)",
+		 kvm->arch.kern_guest_start, kernel_size);
 
 	/*
 	 * Now load backwards from the end of memory so the kernel
-- 
2.47.0



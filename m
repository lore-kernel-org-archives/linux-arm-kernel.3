Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA4AD69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK3Nkue3E9l96ccgGBA2HI0JWBWWh+L0buXvK8xEbgA=; b=dJ4AA+WhcTxujnFgRbXkzJNQXB
	DHxZ/QJdseEPgSoBFY0slWDkay52YXLESEzIpTzkio0PJNtJVT42pGEbmMJ9LZMws02NhzcUNPnZP
	0Z3snP8Q/gOjRK94Ib37ld+j6t5V1hrr+st9XxBU19IqHNurnqBZMXDhSQD59ocTeTii328tFdRaA
	oKmILTeXakYxPV78SplelS+c3Wandf/Vx2FyH0T38/0nuDQLdFNNtexosNVK6PHE8k6tf/6yDt7UX
	wFzSr3IhC+WEb2a0EsaCgNZXeLp6MCFOsM4yNAdv2og2dyxcvty0SuBDqfTVInkEJoTDn/rCzNUX1
	fA3nllMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgJk-0000000FrtG-3QAy;
	Thu, 28 Nov 2024 15:20:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgCb-0000000FqYF-0B3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:13:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397BD1474;
	Thu, 28 Nov 2024 07:13:38 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88DF13F66E;
	Thu, 28 Nov 2024 07:13:06 -0800 (PST)
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
Subject: [RFC PATCH kvmtool 4/4] arm64: Increase the payload memory region size to 512MB
Date: Thu, 28 Nov 2024 15:12:46 +0000
Message-ID: <20241128151246.10858-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128151246.10858-1-alexandru.elisei@arm.com>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071309_167241_80E92C9B 
X-CRM114-Status: GOOD (  18.99  )
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

kvmtool uses the same memory map for 64bit and 32bit guests, where it
copies the kernel, the initrd and DTB in the bottom 256MB.

The restriction on placing everything in the bottom 256MB comes from the
aarch32 boot protocol, where the kernel, DTB and initrd must be placed in a
region covered by the low-memory mapping. The size of the lowmem region
varies based on the kernel-userspace split, which is a Kconfig option, and
on the vmalloc area size, which can be specified by the user on the kernel
command line. Hence kvmtool's choice of using the bottom 256MB as a
reasonable compromise which has worked well so far.

Sina has reported in private that they were unable to create a 64bit
virtual machine with a 351MB initrd, and that's due to the 256MB
restriction placed on the arm64 payload layout.

This restriction is not found in the arm64 boot protocol: booting.rst in
the Linux v6.12 source tree specifies that the kernel and initrd must be
placed in the same 32GB window. There is also a mention of kernels prior
to v4.2 requiring the DTB to be placed within a 512MB region starting at
the kernel image minus the kernel offset.

Increase the payload region size to 512MB for arm64, which will provide
maximum compatibility with Linux guests, while allowing for larger initrds
or kernel images. This means that the gap between the DTB (or initrd, if
present) and the kernel is larger now.

For 32 bit guests, the payload region size has been kept unchanged, because
it has proven adequate so far.

Reported-by: Abdollahi Sina <s.abdollahi22@imperial.ac.uk>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/aarch32/include/kvm/kvm-arch.h | 5 +++--
 arm/aarch64/include/kvm/kvm-arch.h | 2 ++
 arm/aarch64/kvm.c                  | 8 ++++++++
 arm/kvm.c                          | 6 ++++--
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arm/aarch32/include/kvm/kvm-arch.h b/arm/aarch32/include/kvm/kvm-arch.h
index 07d711e2f4c1..0333cf4355ac 100644
--- a/arm/aarch32/include/kvm/kvm-arch.h
+++ b/arm/aarch32/include/kvm/kvm-arch.h
@@ -3,8 +3,9 @@
 
 #include <linux/sizes.h>
 
-#define kvm__arch_get_kern_offset(...)	0x8000
-#define kvm__arch_get_kernel_size(...)	0
+#define kvm__arch_get_kern_offset(...)		0x8000
+#define kvm__arch_get_kernel_size(...)		0
+#define kvm__arch_get_payload_region_size(...)	SZ_256M
 
 struct kvm;
 static inline void kvm__arch_read_kernel_header(struct kvm *kvm, int fd) {}
diff --git a/arm/aarch64/include/kvm/kvm-arch.h b/arm/aarch64/include/kvm/kvm-arch.h
index 97ab42485158..2d1a4ed8cea4 100644
--- a/arm/aarch64/include/kvm/kvm-arch.h
+++ b/arm/aarch64/include/kvm/kvm-arch.h
@@ -8,6 +8,8 @@ void kvm__arch_read_kernel_header(struct kvm *kvm, int fd);
 unsigned long long kvm__arch_get_kern_offset(struct kvm *kvm);
 u64 kvm__arch_get_kernel_size(struct kvm *kvm);
 
+u64 kvm__arch_get_payload_region_size(struct kvm *kvm);
+
 int kvm__arch_get_ipa_limit(struct kvm *kvm);
 void kvm__arch_enable_mte(struct kvm *kvm);
 
diff --git a/arm/aarch64/kvm.c b/arm/aarch64/kvm.c
index 6fcc828cbe01..98b24375ee98 100644
--- a/arm/aarch64/kvm.c
+++ b/arm/aarch64/kvm.c
@@ -135,6 +135,14 @@ u64 kvm__arch_get_kernel_size(struct kvm *kvm)
 	return le64_to_cpu(kernel_header->image_size);
 }
 
+u64 kvm__arch_get_payload_region_size(struct kvm *kvm)
+{
+	if (kvm->cfg.arch.aarch32_guest)
+		return SZ_256M;
+
+	return SZ_512M;
+}
+
 int kvm__arch_get_ipa_limit(struct kvm *kvm)
 {
 	int ret;
diff --git a/arm/kvm.c b/arm/kvm.c
index 9013be489aff..7b2b49e21498 100644
--- a/arm/kvm.c
+++ b/arm/kvm.c
@@ -103,14 +103,16 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 {
 	void *pos, *kernel_end, *limit;
 	unsigned long guest_addr;
+	u64 payload_region_size;
 	ssize_t file_size;
 	u64 kernel_size;
 
+	payload_region_size = kvm__arch_get_payload_region_size(kvm);
 	/*
-	 * Linux requires the initrd and dtb to be mapped inside lowmem,
+	 * Linux for arm requires the initrd and dtb to be mapped inside lowmem,
 	 * so we can't just place them at the top of memory.
 	 */
-	limit = kvm->ram_start + min(kvm->ram_size, (u64)SZ_256M);
+	limit = kvm->ram_start + min(kvm->ram_size, payload_region_size);
 
 	kvm__arch_read_kernel_header(kvm, fd_kernel);
 
-- 
2.47.0



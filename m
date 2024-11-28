Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C2DD69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4hNU5uuBVp50YMK6Fwi6NLJ79S5FP9BmJaPApE0uEw=; b=TZbOhNb3ZYC0YVti+BNyTCqcQL
	DjDvx+ok1fegoHfdSfSDOMF9FMbZJB6FIpmpeXgN7ws96kAnONVA/7R/eNru7VSxIavGNGCGxu/d8
	7D+85Yc+4Nq59TSBR/RhcsMRm6GuW7T4264Iq8NzIlzobBlxyvGqFdSnwdKOTAtj5SzfJxloqymGL
	YvqRYVVtX2awASnN6/6AdWsCNn1sb3ugv2u8lBOeetqMRWfKKpWKl3j1A4YrDq5pPt8Xs/NzRVpqp
	coCAosPnsh9dnWpyTa7E6FY9RqB5ywH4uv5pBIurlPTLmtiuZkDoPPg36ftrCBpmE4DoMY51Mn37m
	DrB283bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGs-0000000FrJC-3xxo;
	Thu, 28 Nov 2024 15:17:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgCU-0000000FqVQ-2ICf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:13:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A32211476;
	Thu, 28 Nov 2024 07:13:31 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 001953F66E;
	Thu, 28 Nov 2024 07:12:59 -0800 (PST)
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
Subject: [PATCH kvmtool 1/4] arm: Fix off-by-one errors when computing payload memory layout
Date: Thu, 28 Nov 2024 15:12:43 +0000
Message-ID: <20241128151246.10858-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128151246.10858-1-alexandru.elisei@arm.com>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071302_629630_28E26BA1 
X-CRM114-Status: GOOD (  13.53  )
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

In kvm__arch_load_kernel_image(), 'limit' is computed to be the topmost
byte address where the payload can reside.

In all the read_file() calls, the maximum size of the file being read is
computed as limit - pos, which is incorrect: either limit is inclusive, and
it should be limit - pos + 1, or the maximum size is correct and limit is
incorrectly computed as inclusive.

After reserving space for the DTB, 'limit' is updated to point at the first
byte of the DTB. Which is in contradiction with the way it is initially
calculated, because in theory this makes it possible for the initrd (which
is copied below the DTB) to overwrite the first byte of the DTB. That's
only avoided by accident, and not by design, because, as explained above,
the size of the initrd is smaller by 1 byte (read_file() has the size
parameter limit - pos, instead of limit - pos + 1).

Let's get rid of this confusion and compute 'limit' as exclusive from the
start.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arm/kvm.c b/arm/kvm.c
index 9f9582326401..da0430c40c36 100644
--- a/arm/kvm.c
+++ b/arm/kvm.c
@@ -109,7 +109,7 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	 * Linux requires the initrd and dtb to be mapped inside lowmem,
 	 * so we can't just place them at the top of memory.
 	 */
-	limit = kvm->ram_start + min(kvm->ram_size, (u64)SZ_256M) - 1;
+	limit = kvm->ram_start + min(kvm->ram_size, (u64)SZ_256M);
 
 	pos = kvm->ram_start + kvm__arch_get_kern_offset(kvm, fd_kernel);
 	kvm->arch.kern_guest_start = host_to_guest_flat(kvm, pos);
@@ -139,7 +139,7 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	kvm->arch.dtb_guest_start = guest_addr;
 	pr_debug("Placing fdt at 0x%llx - 0x%llx",
 		 kvm->arch.dtb_guest_start,
-		 host_to_guest_flat(kvm, limit));
+		 host_to_guest_flat(kvm, limit - 1));
 	limit = pos;
 
 	/* ... and finally the initrd, if we have one. */
-- 
2.47.0



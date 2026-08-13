Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=; b=cc6x/l6eTGZX+PbgmD5rcyNwWy
	aBNKZAbWV53HIDTFnB7foByMTIk16fiG1I4lGtDEmyCczljCe/Jf3xYOXOVb5TycwP97LR0Rlwl7u
	TCBVDoQWJY5X6syCnJ4eyh+ZhHuEWJN26DBmGhMiejLBfywchTizGLQXdo+KRNwqzZpnFA2yyCWQZ
	VoyjuDP0abkhPz9YxFUphDAOYF9jLroqAYi5CIc/1iXInvR2PtazVGHYPnSNaBjpToDDDgJVYTdaX
	oFOTRVEbpxPxcy2s+ctyi2nw/tFHU554lTKXP8xAciHjVdh9AEaodvNfbXYRf1ND0E3FCjLI40toT
	/RpALU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPX1-0000000HYxm-17hJ;
	Thu, 13 Aug 2026 07:07:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPWx-0000000HYwb-2ClP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786604829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
	b=TnNuaafElWVYHCDAM7L+/RujLtS3yIv/FAEoDYpXVaor3Qc+GGING/AVqUTKmsgt8N8+59
	KiyT45y96SaRpcqfrFSpguSbyDYwzcQhz+hWtDm4AFUoa5A27JgqN6DEL5UaD0vM3XiJWS
	CAS9amGJl6dIwkn1ep6RlqOJm1/wijU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-CSGMbOL-PK2oZns5GG5NcQ-1; Thu, 13 Aug 2026 03:07:07 -0400
X-MC-Unique: CSGMbOL-PK2oZns5GG5NcQ-1
X-Mimecast-MFC-AGG-ID: CSGMbOL-PK2oZns5GG5NcQ_1786604827
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so6757855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604827; x=1787209627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JiBEcYiE+KLh8+0hM55F9Ni/cU6OIiWXkgr39dKJ+1Q=;
        b=gK+Tfd5RjFEDii02m/lE3v+65IwtNp3R7IG2sLC7pNQJ/53A/phvRW1hR6Gc2N/pMp
         bRcHEnRvmZ5XhtUCHw87ttHxM1oAtdSvs41Cx2+BWMccjRi+i4rTF8KJxMbm7Z607n3l
         n4ZFZ17t3jyiUVjExtEOtyFcNlh3ssK/1t3JCs3W/sMJ6qkStkvhq9W2OWTni5KAZOCG
         nx1jDD2okmNecNXhKcTjHcK8Flx7JANA1GMKJLJZ/Oowh8DgwPnCn/1Ka78fy+IKBIzi
         Y4W4dUhTHyC+CSid+BBKY0RD5pyj2pPCt/EL0bDVnEoPWw5E2lWC8qANg1r4V5KiapxA
         gFsA==
X-Gm-Message-State: AOJu0YwSOn8dd6PcjGEJp7ULch3fqzyMIaTUqH3CqNN8U+2z3mMTdZmT
	VzdetZ911JAFii5+mVF44UZAPKVE5ro0RJOiGg4CIGZmYoYI3uVfmtD/uWjrI6U+1dWDgsfvCPF
	gImoQG7so54cl9Xks88bIfyYR7mfkzF4YH9fEsO1LdGF2pl1uK1n5VZwgYHAVZ7rxfT48spZr7V
	Yi
X-Gm-Gg: AR+sD12yPtovwUIndXpig6hNQJjEf29ZZr4NRm/spDE+CNyKya/GGS0B23E5MB651mR
	qedT8BsFiItN+l0jcPgymP+qGwP0+N9QeAl9PLQFmPsUUM++dAC2xgMiRMxj9iwZXrbFk9G+PKk
	C/yb4uroApp+Mp/mf3csFO8PnDTQ/LHEJCiqX88FCqHT1m4jVFomisoUxxvlM7nNBnkSWuoJVJQ
	pAZ9txaqKqWCzelA8N9frA2rmBKs9MJQOz2+nAxbt6g9EpZeQD0hcNTsmBoakGOnOSbTES71p1V
	Exe6EQYMG0ez90u+xYQlNSjKr0aWproHLD98RYQ9dbRKZTrdzhmKNThS0ot8UigyhoPKuie1MmA
	FnVi4N5JKd/bQj3JO
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123865ad.20.1786604826434;
        Thu, 13 Aug 2026 00:07:06 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2d37e8a4f49mr38123275ad.20.1786604825987;
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
Received: from [127.0.0.1] ([115.110.157.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c48e438sm4877315ad.60.2026.08.13.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:07:05 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Thu, 13 Aug 2026 12:36:29 +0530
Subject: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
MIME-Version: 1.0
Message-Id: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dyCzJzEvMxK3bS0JIPkZEujZGNDYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQC+l4AzbAAAAA==
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q4j777LERwjQgiFJJU2qGQCw-eGh2W57Zm83C7Flc8M_1786604827
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_000711_660574_183C0544 
X-CRM114-Status: GOOD (  14.99  )
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

Several kexec_file_load() image probe functions return -EINVAL when
they do not recognize the image format.  A probe function that rejects
an image should return -ENOEXEC to indicate that the image is not a
recognized executable format.  -EINVAL implies a problem with the
syscall parameters, not with image recognition.

kexec_image_probe_default() iterates through registered loaders and
returns the last probe's error code to the caller.  That error
propagates as the kexec_file_load() return value to userspace.
Returning -EINVAL from a probe when no loader matches is semantically
incorrect and misleads userspace about the nature of the failure.

Return -ENOEXEC from all probe functions and their helpers when the
image format is not recognized.

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
branch: next-20260812
base commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
---
 arch/arm64/kernel/kexec_image.c   | 4 ++--
 arch/loongarch/kernel/kexec_efi.c | 4 ++--
 arch/riscv/kernel/kexec_image.c   | 4 ++--
 kernel/kexec_elf.c                | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..101259874d44 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -25,10 +25,10 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 		(const struct arm64_image_header *)(kernel_buf);
 
 	if (!h || (kernel_len < sizeof(*h)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	if (memcmp(&h->magic, ARM64_IMAGE_MAGIC, sizeof(h->magic)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index 5ee78ebb1546..28a1d0420ba3 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -24,12 +24,12 @@ static int efi_kexec_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (!h || (kernel_len < sizeof(*h))) {
 		kexec_dprintk("No LoongArch image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	if (!loongarch_header_check_dos_sig(h)) {
 		kexec_dprintk("No LoongArch PE image header.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return 0;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..963a25f5b55b 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -20,7 +20,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
 
 	if (!h || kernel_len < sizeof(*h))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	/* According to Documentation/arch/riscv/boot-image-header.rst,
 	 * use "magic2" field to check when version >= 0.2.
@@ -28,7 +28,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 
 	if (h->version >= RISCV_HEADER_VERSION &&
 	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
-		return -EINVAL;
+		return -ENOEXEC;
 
 	return 0;
 }
diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index 3a5c25b2adc9..89a444a00693 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -172,7 +172,7 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
@@ -236,7 +236,7 @@ static int elf_read_phdr(const char *buf, size_t len,
 
 	default:
 		pr_debug("Unknown ELF class.\n");
-		return -EINVAL;
+		return -ENOEXEC;
 	}
 
 	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;

---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A32606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=du9Bg9Li;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+w20grm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z0QcCagBfVLi6rEpBGcIxe8EgJb3rLzqWMHXP0cL7/s=; b=du9Bg9Li7U6mnI1lx1mYC9Z28I
	FjH5ku5bQTVfRp98k3fgaJhdrr+52G567C2ISaVFz+MlzXoKSLSsjdyTGQo/SsQiXHiUsPNbYKuC4
	j+yUIFOe57VfA05pWI3zM8k2PRa3NvJY6Ordzpz5g3wyr1yz8yH3TnzsGh6m4FeYnrMEwjnDEIU8H
	C5LlCrIM3+48O7j4fgUc9V1WScmzZrBJOL8jftF31fRsreBw98gSmogLfWNKkdkCUeG8Xd+5pV/5c
	zy2RINdPPtPkdJPVPHYDg3+5LHBWVUGi2reDQZKXw6IY3IGgPfwOjNdwtE6ZXnbMuWCKwBxsnuvpt
	HubgZcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnQ-0000000Ccqr-48S0;
	Fri, 06 Nov 2026 14:20:00 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnM-0000000Ccjf-08d6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:57 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so5808355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974793; x=1794579593; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0QcCagBfVLi6rEpBGcIxe8EgJb3rLzqWMHXP0cL7/s=;
        b=F+w20grmZ51fyOXxzIUHjKlBJuuTTq1qAkbc1LEW5QnqghOPanDVRk19YVaA6NUe2x
         5Yw7QeA0RcYzoWaODEzRvwm/3npyvM8HDtlmm57vafbDvZ1jgq64WuDmY49/DdfypiOo
         geeQvM9gc/gaYlYhtSyTOgcgYl9mR2PBV0pgOCmF7scdfcnptNTFGxbrREXw13N3sx+5
         Bk/i9KXSoJ1GBEq+OPB0eIFYJMuEkDWsMIG90NhnViqOAW+Sf+ndUDjFkn0m20fySaYu
         UGy+t/5LHSWUSLhqcHZ/xSeptnlAEAhZdVcS9yxdtPGV4Xh3u871ewURNIazIpNlcWTz
         7zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974793; x=1794579593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0QcCagBfVLi6rEpBGcIxe8EgJb3rLzqWMHXP0cL7/s=;
        b=QQKiZBj/r8l+Pj0UOWdlUCIFEd7Nd5YYywIXbsTY40P1pt4ajsUQcmTRrpN8+Y7GLa
         i9MQit/Tuwyp8/NcZ9D+alMFdN/gzbjug+OIc+4CxvU+ug+ty50c+pL4w1awc6esmNNs
         kRzJlRMTFd768Bx9sEJOIzJq+9V8uRWa+fQjidAXs2SvpIaCQCANlnojv8nCwC9GoZhO
         uBTKGfu2qqeP4VUNdWRWfMJpzU0AUN9C1cVeNPyAwLOby9OArCo4Q9rqMECN72WXeHVq
         E+GnNFPEw5+wnGw1dbOXRQcs45w7wR9mJZajlYpOcSA5fCOhZYzZWGw4X33Iqlx+VfGS
         PaBQ==
X-Gm-Message-State: APuU4Z+pnoWI7Own3cErZoJVLwhDYbmQYz4bPoZ0ZgdKbB6dgT9cIPle
	fv3pb3vVmmxYS9cK24xCsLdczE2YV2ujArt3hF7ptdS+/C9I41CHGgLGHEWM9mxkExR58dXAHw=
	=
X-Received: from wmpo22.prod.google.com ([2002:a05:600c:3396:b0:4a1:8e4a:36d3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b02:b0:4b6:267a:dd6e
 with SMTP id 5b1f17b1804b1-4b6ded49a38mr49076685e9.28.1793974793491; Fri, 06
 Nov 2026 06:19:53 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:40 +0100
In-Reply-To: <20261106141936.2744481-7-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261106141936.2744481-7-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-10-ardb+git@google.com>
Subject: [PATCH 3/5] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061956_100465_F312D3DD 
X-CRM114-Status: GOOD (  14.27  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Refactor efi_cache_sync_image() so that it is not in charge of calling
efi_remap_image(), which is really the wrong way around.

Instead, call efi_remap_image() from the primary zboot procedure, where
it is more straight-forward to obtain the code size from the loaded
image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/efi.h           |  3 +++
 drivers/firmware/efi/libstub/arm64.c   |  2 --
 drivers/firmware/efi/libstub/efistub.h |  4 ++++
 drivers/firmware/efi/libstub/zboot.c   | 23 +++++++++++++++++++-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..da6afd4a7a27 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -151,4 +151,7 @@ efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f);
 
 void efi_icache_sync(unsigned long start, unsigned long end);
 
+// temporary resolution for efistub_get_code_size()
+#define efistub_get_code_size(image_info) ({ extern u32 code_size; code_size; })
+
 #endif /* _ASM_EFI_H */
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..7ab634e37cf1 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -112,8 +112,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 unsigned long __weak primary_entry_offset(void)
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 1955cdb5139a..89cd2ae57a3c 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1270,4 +1270,8 @@ void arch_accept_memory(phys_addr_t start, phys_addr_t end);
 efi_status_t efi_zboot_decompress_init(unsigned long *alloc_size);
 efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen);
 
+#ifndef efistub_get_code_size
+#define efistub_get_code_size(image_info)	0
+#endif
+
 #endif
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 97ae706c034a..27f6661253c0 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -36,6 +36,26 @@ const struct efi_image_info * __weak zboot_get_image_info(unsigned long image_ba
 	return NULL;
 }
 
+static efi_status_t efi_zboot_remap_image(const struct efi_image_info *image_info,
+					  unsigned long image_base,
+					  unsigned long image_size)
+{
+	unsigned long code_size = efistub_get_code_size(image_info);
+	efi_status_t status;
+
+	if (code_size) {
+		efi_cache_sync_image(image_base, code_size);
+
+		status = efi_remap_image(image_base, image_size, code_size);
+		if (status != EFI_SUCCESS)
+			return status;
+	} else {
+		efi_cache_sync_image(image_base, image_size);
+	}
+
+	return EFI_SUCCESS;
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -103,7 +123,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+	         efi_stub_common(handle, image, image_base, cmdline_ptr,
 				 image_info);
 
 error:
-- 
2.56.0.455.g6c5a503b38-goog



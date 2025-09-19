Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5D6CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2uPr5tRXP/hZXMndHpWASprs+At28VaxqR7vlo3oA8=; b=mipgiCNWe9MsdhTcrzYVMSxFrW
	jzLIWnBPh9fuxfVyEVA2DyiLelho1k4TGsy2kiK9LIWaTHGwZBgWr9NkOZqUhfMbFpUbri9JCfOrl
	mK0ND0XATNjjkhOupQVttwjs1q0VEYqvLtRUCBLmEQzHszPaDxZZu0qsXzGmsbUQq5ErhreIk5ScQ
	yiARlgCnmRSxLhUfY/LtoOdQka0d0VLpEXrx9fob+wDHvcsRGEZo4XE/JMzkcM/c3d74ImsN/pC03
	bKlboSVxTYeZiiLzuiGA20FwVPcFNXKfnzjwU6nWagwvIZWRM/We5ZZGYj62oyD1+yMk+fXk9fJuP
	WUFsIZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9I-00000002oWJ-1UAd;
	Fri, 19 Sep 2025 12:23:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9F-00000002oUw-0Rlo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:23:34 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-469e82ad756so663355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758284611; x=1758889411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2uPr5tRXP/hZXMndHpWASprs+At28VaxqR7vlo3oA8=;
        b=URGLQkorL3+bpsPd9Q/ILLonKQ3V6/XuhJU7amB278aQJYDQm2rfNMESwZnnIJEiL4
         ugjKNyXP9IAjUTXF+83DM4RK+G5Oo9qamg6mh5i7MadIqANlvHk4okmXfmSwY0J47x39
         KSRh63RFhuBWZAsVhcm0Q3k9Wuxte5S98HtITGOkmOifsfuAT9Zi0rHit+JB2RCBprhy
         EhELyNEwNl7G67nrNdHRFktGZ+RrDk0tHyPEEQogJuBLMC/6HUsdT8O/fiRKrbXxkC+U
         506dTSwr5utxUcNGiQt8+IbdATA+ORIpB5+75GUDNoJvlACfdqf1V+gUQwaRk/Sbh/d3
         Poyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284611; x=1758889411;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i2uPr5tRXP/hZXMndHpWASprs+At28VaxqR7vlo3oA8=;
        b=luc0G6BBxMTpOCzD4gVDr/0xV03mqaS9enGDCkibBKzcUy25m4NJXpmOPZmZFEBcrR
         9mAgh/0F68e5VpgwOYCepZzR3AFDoWsfG4d2phlj1C9W3DpPj6qC0ixW8u6lwltyYGtD
         lF2rWbH+HPdV5nmNmuTNaVh5IJJzipcIbtBhstmBSY+6r7tEZvlsIz+I4FurZWPvAkZu
         pB79vyy0TEuRNU9XghHKb62GUCrcLbwif0gOZQzbKIxldalUZW8kpn2ZtiiXJk1+ZMGx
         KbdO72C3df27jwIRjWwKXAyVUSRPCaI2lqHlDZI0k3Degeylav+CSNa+Wruefx1CjL+G
         RbTw==
X-Gm-Message-State: AOJu0YzPXWaF9IxShSgmQw2ZdMXRmBIne+ZQcDkj3X2zuWoygxT8yVwe
	qvkXW2cNKKXTqYDsBP5IV6qHpn7bHDWnIKTXhyoJgwHoNXMB/GoriXgVSe6HgnyblRJFF0jBech
	FvaMfEfQs2mzbvn6nUl9G4Oz93RKCDROM4CBVruJm9++6WxklWAVOnvgqWfeTApWYhg98LlB3Lj
	mYC2ickkLLwLDL0WpZqvNfAPACEt64OsIY3a9KthHMKoW2XnmRliqtjkHr2n/Y
X-Google-Smtp-Source: AGHT+IG9GaXAZcjoq+ISPuOX7adIMdWJfDgiabm1SFO2WPOJbmJQLNLDFi21OpBUSrPr+CFdPSZdvz2oMtje
X-Received: from wmbbi11.prod.google.com ([2002:a05:600c:3d8b:b0:45b:7580:5aa])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4714:b0:45b:615c:cd2
 with SMTP id 5b1f17b1804b1-467e6b64fb2mr29795115e9.8.1758284611101; Fri, 19
 Sep 2025 05:23:31 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:23:20 +0000
In-Reply-To: <20250919122321.946462-1-abarnas@google.com>
Mime-Version: 1.0
References: <20250919122321.946462-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919122321.946462-2-abarnas@google.com>
Subject: [PATCH 1/2] arch: arm64: Fail module loading if dynamic SCS patching fails
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_052333_165821_F41E645D 
X-CRM114-Status: GOOD (  17.86  )
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

Disallow a module to load if SCS dynamic patching fails for its code. For
module loading, instead of running a dry-run to check for patching errors,
try to run patching in the first run and propagate any errors so module
loading will fail.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/include/asm/scs.h      |  2 +-
 arch/arm64/kernel/module.c        |  6 ++++--
 arch/arm64/kernel/pi/map_kernel.c |  2 +-
 arch/arm64/kernel/pi/patch-scs.c  | 15 +++++++++++----
 arch/arm64/kernel/pi/pi.h         |  2 +-
 5 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
index a76f9b387a26..ffcfcda87f10 100644
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@ -53,7 +53,7 @@ enum {
 	EDYNSCS_INVALID_CFA_OPCODE		=3D 4,
 };
=20
-int __pi_scs_patch(const u8 eh_frame[], int size);
+int __pi_scs_patch(const u8 eh_frame[], int size, bool is_module);
=20
 #endif /* __ASSEMBLY __ */
=20
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 40148d2725ce..5d6d228c6156 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -484,10 +484,12 @@ int module_finalize(const Elf_Ehdr *hdr,
 	if (scs_is_dynamic()) {
 		s =3D find_section(hdr, sechdrs, ".init.eh_frame");
 		if (s) {
-			ret =3D __pi_scs_patch((void *)s->sh_addr, s->sh_size);
-			if (ret)
+			ret =3D __pi_scs_patch((void *)s->sh_addr, s->sh_size, true);
+			if (ret) {
 				pr_err("module %s: error occurred during dynamic SCS patching (%d)\n",
 				       me->name, ret);
+				return -ENOEXEC;
+			}
 		}
 	}
=20
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_k=
ernel.c
index 0f4bd7771859..7187eda9e8a5 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -98,7 +98,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_of=
fset, int root_level)
=20
 		if (enable_scs) {
 			scs_patch(__eh_frame_start + va_offset,
-				  __eh_frame_end - __eh_frame_start);
+				  __eh_frame_end - __eh_frame_start, false);
 			asm("ic ialluis");
=20
 			dynamic_scs_is_enabled =3D true;
diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-=
scs.c
index 55d0cd64ef71..78266fb1fa61 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -225,7 +225,7 @@ static int scs_handle_fde_frame(const struct eh_frame *=
frame,
 	return 0;
 }
=20
-int scs_patch(const u8 eh_frame[], int size)
+int scs_patch(const u8 eh_frame[], int size, bool is_module)
 {
 	int code_alignment_factor =3D 1;
 	bool fde_use_sdata8 =3D false;
@@ -276,12 +276,19 @@ int scs_patch(const u8 eh_frame[], int size)
 				return EDYNSCS_INVALID_CIE_SDATA_SIZE;
 			}
 		} else {
+			/*
+			 * For loadable module instead of running a dry run try
+			 * to patch scs instruction in place and trigger error
+			 * if failed, to prevent module loading.
+			 */
 			ret =3D scs_handle_fde_frame(frame, code_alignment_factor,
-						   fde_use_sdata8, true);
+						   fde_use_sdata8, !is_module);
 			if (ret)
 				return ret;
-			scs_handle_fde_frame(frame, code_alignment_factor,
-					     fde_use_sdata8, false);
+
+			if (!is_module)
+				scs_handle_fde_frame(frame, code_alignment_factor,
+						     fde_use_sdata8, false);
 		}
=20
 		p +=3D sizeof(frame->size) + frame->size;
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index 46cafee7829f..4ccbba24fadc 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -27,7 +27,7 @@ extern pgd_t init_pg_dir[], init_pg_end[];
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
 void relocate_kernel(u64 offset);
-int scs_patch(const u8 eh_frame[], int size);
+int scs_patch(const u8 eh_frame[], int size, bool is_module);
=20
 void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 	       int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
--=20
2.51.0.534.gc79095c0ca-goog



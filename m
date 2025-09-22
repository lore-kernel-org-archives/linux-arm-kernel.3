Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE57CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUR5XlhmBsWXkvLElhn0cMkxqmlD65gTww2Sp2iyBR8=; b=NwDJA29cmsmYkmkjdCuethcNix
	Ik5cFpxYPtkqwIkOIhCLLRGoo2aOT0WPzKVuOQhMKcOFQlqw01eO9Oq4Mp99SGuYAV79DoK/sYvs6
	jmgz7GkwQtthFdQoJ1co1jxJtbDCepTZWM1sW/r3xI0aNN6m/eV30/3EyRlvaVDTZynakwodibNzw
	H5iOQqXaWJfm+MX2R2NdcmA19VxeCHTQ9qKb1NRbyWHLXiA88p8wD2Q/xmLsxpiYf3nPAq2/Sv7gi
	LolndkjnRsYHUamw+FcJ1ILkOvswAh7Un1ZXjzbSULt6Zqrmtn4q9tHHxG8U8Jz7b/7Ev2aArIBKa
	X4if4Xsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDp-0000000APY2-0vPs;
	Mon, 22 Sep 2025 13:04:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDj-0000000APW5-45HW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dUR5XlhmBsWXkvLElhn0cMkxqmlD65gTww2Sp2iyBR8=; b=fdRqUX/KQLfsUSWyjID5lRRSPm
	DfXmkZ8xrkoS0H/oiRI8PWs3eElwHSOcXuFiAcHTqJP3xUudnJ/ZoXKgVaAVTsh2DEOMTZSxLhMml
	KKu060S+2YlrSYzvIwPr5Wn8dyLJkpY+bjDYpZaqECnhN1uzHHD5G2ZIhoqF5IviFvnqeadeh5EBX
	bJZIEgSAW1q3XYYnlwCEtA9Xf4Yv6MS5kjp+J0YpxTK2yIC1HjLRcHBej0tT13PvYGe9ZDmRQE81+
	436LDKau211XbOcnhcdcn6Fe4pDyCjmrvwImtMNo/Of3Y6hPOK6K63xXVb4rX8WubccbefgpUTgOb
	ABgzhWRQ==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDh-00000008Hol-0TY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:04:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3ee12ab7f33so1899999f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758546280; x=1759151080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUR5XlhmBsWXkvLElhn0cMkxqmlD65gTww2Sp2iyBR8=;
        b=xnMe4PGLmXsDB5ayJ8uNaZmoPeXPYDwuN3aM5tJtE/tsBwV/ja3y+WjndYfCpj2BD8
         2WUId+9VTtw44WnABWWurbWkToqMsbLqg921gcOiBzOPc/abDs5JhxEOWTXT+TRYKPub
         o1vO7/4pSvnxrsKd3MvSSJ/UpeNMd+gMmbN824gXTafOGVRc3IquRfBzxlPfb1qSU+EM
         Jsqz2JuTVMo58zOre0UW7DFm4DhQ1HjUjAo5fhcJHN/nQ6TA/PkMXwHx72d6nxOXAXaS
         N1b5ewFzx/MGBQt0DUXRDsW8XkoltWwS+J48lUsM14z4PyTRw58RkSTXedtbo0TFVb79
         8YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546280; x=1759151080;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUR5XlhmBsWXkvLElhn0cMkxqmlD65gTww2Sp2iyBR8=;
        b=tcoOm7UYF5QbPyCGrKAkniELvy33FUOk46n0vOXJTRN1IXoUgP1U7nhLKv2Ts4dwMK
         ityrnkUyuTozo5El1vCClCHFFGsCGfj52jD3Vrh9EAWDJXlFsh6FLxONQookqPXotAGh
         ibsqSkamhv+j1mB15xSisSkxz9W7ARgpNtQrJypSm1cmXQSI6F3lF1ihV+vGHagwXf7w
         Jz6CJKvOdIIm+J2YH8ImA8cUGd9VMyggEWi6r+/TrpoObMahrumNSwk0ScoMzESE4X4n
         jIM63U2+2EJsL0UhyuLRWXe3JOnWN9QCxXZki/AOhp2slvqy8uYaRQe+3DoCSPiRh+IK
         jvsA==
X-Gm-Message-State: AOJu0YzrlHxmIibNOHI7cmPe63YFztbeRFzBbbQwVtLpSRo1LUL/bfzb
	pPG+2VXu1lnZUWIJnAZdiRVLcBZ/6egq2Q8L/v4xxkqgRA0kliJhSB89dWaQPTvunRsragcluG+
	tbvv99gvNy3oiOMLmCn4/eM4uV5I68uMHfLlVFNpP0WWJsM4vw781Ria6mVuJ+hUqqmgYJUf8fP
	ZxAJd910FhfjQGFUSKVkhzWJkceoX9veCp+QPX8s1silXkTHgiMIVJeYnKKVUY
X-Google-Smtp-Source: AGHT+IEtBKpSpcNG7WXoHemURXbK3vDWac5r7lnyDOiYg4Vglm5g7x0+IvtA9rmKqvE/dsv0G1maA9DGUunn
X-Received: from wrhb2.prod.google.com ([2002:adf:c742:0:b0:3df:3aeb:c0a8])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c05:b0:3ee:11d1:29dd
 with SMTP id ffacd0b85a97d-3ee83da00e7mr9797391f8f.35.1758546278683; Mon, 22
 Sep 2025 06:04:38 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:04:26 +0000
In-Reply-To: <20250922130427.2904977-1-abarnas@google.com>
Mime-Version: 1.0
References: <20250922130427.2904977-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922130427.2904977-2-abarnas@google.com>
Subject: [PATCH v2 1/2] arch: arm64: Fail module loading if dynamic SCS
 patching fails
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_140441_333116_E65210B5 
X-CRM114-Status: GOOD (  18.51  )
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
 arch/arm64/kernel/module.c        | 12 ++++++++++--
 arch/arm64/kernel/pi/map_kernel.c |  2 +-
 arch/arm64/kernel/pi/patch-scs.c  | 10 ++++++----
 arch/arm64/kernel/pi/pi.h         |  2 +-
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
index a76f9b387a26..c59f6324f2bb 100644
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@ -53,7 +53,7 @@ enum {
 	EDYNSCS_INVALID_CFA_OPCODE		=3D 4,
 };
=20
-int __pi_scs_patch(const u8 eh_frame[], int size);
+int __pi_scs_patch(const u8 eh_frame[], int size, bool skip_dry_run);
=20
 #endif /* __ASSEMBLY __ */
=20
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 40148d2725ce..d32ab7dd86a8 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -484,10 +484,18 @@ int module_finalize(const Elf_Ehdr *hdr,
 	if (scs_is_dynamic()) {
 		s =3D find_section(hdr, sechdrs, ".init.eh_frame");
 		if (s) {
-			ret =3D __pi_scs_patch((void *)s->sh_addr, s->sh_size);
-			if (ret)
+			/*
+			 * Because we can reject modules that are malformed
+			 * so SCS patching fails, skip dry run and try to patch
+			 * it in place. If patching fails, the module would not
+			 * be loaded anyway.
+			 */
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
index 55d0cd64ef71..bbe7d30ed12b 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -225,7 +225,7 @@ static int scs_handle_fde_frame(const struct eh_frame *=
frame,
 	return 0;
 }
=20
-int scs_patch(const u8 eh_frame[], int size)
+int scs_patch(const u8 eh_frame[], int size, bool skip_dry_run)
 {
 	int code_alignment_factor =3D 1;
 	bool fde_use_sdata8 =3D false;
@@ -277,11 +277,13 @@ int scs_patch(const u8 eh_frame[], int size)
 			}
 		} else {
 			ret =3D scs_handle_fde_frame(frame, code_alignment_factor,
-						   fde_use_sdata8, true);
+						   fde_use_sdata8, !skip_dry_run);
 			if (ret)
 				return ret;
-			scs_handle_fde_frame(frame, code_alignment_factor,
-					     fde_use_sdata8, false);
+
+			if (!skip_dry_run)
+				scs_handle_fde_frame(frame, code_alignment_factor,
+						     fde_use_sdata8, false);
 		}
=20
 		p +=3D sizeof(frame->size) + frame->size;
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index 46cafee7829f..220da972cce1 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -27,7 +27,7 @@ extern pgd_t init_pg_dir[], init_pg_end[];
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
 void relocate_kernel(u64 offset);
-int scs_patch(const u8 eh_frame[], int size);
+int scs_patch(const u8 eh_frame[], int size, bool skip_dry_run);
=20
 void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 	       int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
--=20
2.51.0.534.gc79095c0ca-goog



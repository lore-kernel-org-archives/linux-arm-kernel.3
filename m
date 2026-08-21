Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF10C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpYJaQfkL/fXy91zs4mgPaYnWE9uvAuTxt0XGGUcMwU=; b=AJr7CZZL/hJpBTfvKlACl8mr7M
	jopiZqMnyuaVipAF2YdRztWZMxUpA6+6xFeLeCxLk4vKJahz+kLCqTxsNxjnfrLV37EtbeZj2jtnn
	haNOcvi2uRsCPltL3yeIvdzfo7hJ4q4QT5XZ99f7ho8+KkZVup5mNCWPO8HKmrFS2q9NEr4Cljj71
	KL6pyrLNEHbE1skrn1t3EgTmWXSCb5B7wJzML7R4Yk2stFRXqxsoJC4R0cZef9vXQ8h1TvGD+0wf0
	XxG1slsEmvzQG618KEDMgXL/Dc9it7pqnceuQycyoj2NNl7Ao2FA9PQ9CMRza5oA13BgkELElVocM
	etylfjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdd-0000000DSXE-2q9M;
	Fri, 21 Aug 2026 13:50:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPdZ-0000000DSV0-1XjV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpYJaQfkL/fXy91zs4mgPaYnWE9uvAuTxt0XGGUcMwU=;
	b=N4cT5YSi54d0WaPOkOQ9bigNNc3SdHIDhXvYF+jRio2Q6CMvou/sYLIiOH2dcFD5OZ2CuZ
	PioMTaoAUlawczLN1kQxZ8zIIERaG1kMg44JR1W3YsERoSLKAKw9ybK4EQj8kBt8oIkSON
	jVPC5PVwziTUB3kGnPYgcCqKb4UH2xU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-R6Z8eSeyPcWasOm8RQNaMA-1; Fri, 21 Aug 2026 09:50:23 -0400
X-MC-Unique: R6Z8eSeyPcWasOm8RQNaMA-1
X-Mimecast-MFC-AGG-ID: R6Z8eSeyPcWasOm8RQNaMA_1787320222
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1156864a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320222; x=1787925022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpYJaQfkL/fXy91zs4mgPaYnWE9uvAuTxt0XGGUcMwU=;
        b=nHo6vL0hJ3BRzfpfEHz0YSYWXKMD04XQvWRYycBSzRHKS5kXSz6rq/HwcRb+R6jCIM
         wIYfgIU9GeCPOWI8ttga3Ry/b9V1mYyMwJ05B9YOrRatL8TSdO3/N6LetAY8CW9G1jJd
         TwWEn++dwSo4HrLc4fCk0ztk2g5PRN3UYO5w/2egGJRlGHF2hByh3OLMBmBvgUAyxeGh
         bYP0dY9kyKETBrXZAbGleJh2phzahSdxHB2zsDlsaF6Q4kMIAcw4Ecko2z28Rmoli/ER
         ZrLuueMZECyOl4QHTbjTTS2A86g5poU0vetrG7cPq9HWHBH/daQi4oKIqfswRzXtDijI
         5cGg==
X-Gm-Message-State: AFuF++kU+56/AkShOqGHAaxw1DGPA+XfOJ1202qzPEVML2Kpx3mDAIR1
	d4gSMuSijKZVlo4Fdd5+fB5KCCoHPv4Bt+BnQnrdz2+6hy2LA9yyVUAw9lQ3b4FDAY2Q3yyVRZM
	qB3NecrVWBGqQUeFsU9XiwkdRtyYQIYJxXeqE2SsDjn+MZBK2bIAKfWfGvUMUt46UU679+HQHn7
	lm
X-Gm-Gg: AR+sD13v4mJZoHVdFF5MLmZqOpJKTLAg/Pumx9GS5fTGuQXHh8INXrlHc4Mx/u2TIrl
	MkiKFRFOVFkUNdbd3tIXDPVcg2Yg6b8q+jRAkE7PcM0P4Hqox5FEWqlUL7yTlnAf1bEsOwy6teZ
	keKoI6Lu9+gAPNRNqRQzhoP91AY72wOK5LpxArtqHMjM09MldmHXkEj3Eln7XxyYQcOLPFe9Ye2
	7oclwXNK7DTs/E/IFeDcPVwtONeqiwhsiiZ8kBpzq4XUeFzfMLWevvx9ghMulyHiwyMLN5c7BJt
	fmkjyb3o5aNz3cpYweBhF6PdLblYnizuCFCBNshNa9/Q0SKSKk9oAUZMwhTHBgoC0XmNF9opNtQ
	9/eO7QX7b5RjR4YbQXX/oX/ccbWZBfxFc
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr10527510a91.16.1787320221495;
        Fri, 21 Aug 2026 06:50:21 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr10527444a91.16.1787320220942;
        Fri, 21 Aug 2026 06:50:20 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:20 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Date: Fri, 21 Aug 2026 19:19:57 +0530
Subject: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
MIME-Version: 1.0
Message-Id: <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
In-Reply-To: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
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
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>, 
 Bradley Morgan <include@grrlz.net>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a1wVLZVeVdtmbxvbrpucPf7wrVgJK10Upe_BB4oGmy8_1787320222
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065025_473663_CD73CC7E 
X-CRM114-Status: GOOD (  15.26  )
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
Reviewed-by: Philipp Rudo <prudo@redhat.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Bradley Morgan <include@grrlz.net>
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

-- 
Git-155)



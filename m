Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C535CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz82D6BOYc+hOsftCgRBc9qqs8ilQdlP6vhzKVwGwAc=; b=D9mKGlkJm5Oqs9QaRwquH/Bldn
	W2Rw/S53r1Enx7ySQ1RtN+jLXfNdz6KaGGM+NljIIUqufLK4GQzzvP0dhC6vto+Vnzoldp8E4whxy
	r+febxtu5YQiFTzorGOau7r419mMWGImbdfhBdiZTgRdpZQ0As1d5EYzK2U8bkm3kqdoejfpA4iGm
	H/UMxxb1E4yFJdTu2CXAKPBjH3HP5+u3VRRmPy2757e8OjMJCuN0WvM3ts/q9kFosR59WI9eF7AsN
	oyXtN34Jpp0bZMfKVvKtYZ59rceRE6VanOl8cG/ij+jWWdwr8PzyaohQJ58R1lxjRtZsmsC2WagjE
	bFVpX2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEDG-0000000FF6Z-28y3;
	Wed, 27 Aug 2025 11:21:10 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDbx-0000000F6O4-2IxE;
	Wed, 27 Aug 2025 10:42:38 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61caa266828so2063805a12.1;
        Wed, 27 Aug 2025 03:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756291356; x=1756896156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz82D6BOYc+hOsftCgRBc9qqs8ilQdlP6vhzKVwGwAc=;
        b=ZVRc1qEy+Ss1Ps6EQ/ALKIDMxuVmAij+JDYtNXi7cWtwIhKnileQamIMReT9U6DPP/
         7fUw2Xop+HlOdPixtGtpqSD/uhsUZF/5AMROmMvNLZrKN0pyA98hGBE4aCpL1j/DnRG7
         13xDAkJsOrLhGR6Ngzpm/aP+VCo8/20NMb9elihPhNgc+mHyltRhBTMfhFLKG7w7hocS
         nEyJ+T34OtS7UYNhEWwn1nuWXlOn0fYndpfYZRisBPMwJ5ozEJFKowkGJK0t30aojaAf
         a7+Zj7XbBE7A35Jy/vaXz9V5SmhpqAb8zfLnBggYjNtP1SrsWvV6rxdsPw51tkaxaqLn
         ll8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWet3jfxjwjr9dTmQUYLWv6yTDuINFvE/mYPQX3u3Km6D/dvjwihMh34Tfo0JYHP5TSXrSQda8cQTi1FA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/JIbNlF3xR0JOVus5A2wHBLQz1GtuhyIgFr4RwC3jIGMfrlID
	Yza3kHOcwWtDMdUSpDiHsgkPp54NPI82CUj9+ReMQe6uzKS5VqCWV2x5
X-Gm-Gg: ASbGncvNG6a0VSfYdJrHXkX175cgtAB4bsaE5fRevokp5MQso8ONDVBQxEIVhGGAM/3
	ViT4VCqKAUnka/N8J0UyH0GGFh95gQHrheUOBv66nC0Gep4LHMUJoPV/iyc2xr6W87VradvSZ1p
	cBdsiRpwSN//XJ7QHYD7oBFPrz9TPQR+Lh//ov3N8b8DEDgp/LmPo8FiMAZFR5VV/ML8x8i5Ejd
	4Fm7D8iIZS7ts72+ykspODM3diEifEdJWkvm5r4+5MWx2IQ0ygHVD+Hg89AM+odFbOwtjw8CC+e
	WtbuPYG9C26hrwXn/tQZBV+enJSP0K5KBJELT3/jwUmCiZHPGJJQfsiPP002HgJXuHVsp/IZfkx
	3dY6Vu1vQjpvuvBOmu1A4d5A=
X-Google-Smtp-Source: AGHT+IEYI41/g63i4kVWPeSOO7OZr1ZHqICmy0ei+m3f2f0i5tZ7DszcfvtA7dEeGXLX8TV7bTpnew==
X-Received: by 2002:a05:6402:5111:b0:61c:9970:a860 with SMTP id 4fb4d7f45d1cf-61c9970aca7mr3662005a12.21.1756291356044;
        Wed, 27 Aug 2025 03:42:36 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3119f79asm8721745a12.5.2025.08.27.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:42:35 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 Aug 2025 03:42:22 -0700
Subject: [PATCH 2/3] riscv: kexec: Initialize kexec_buf struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-kbuf_all-v1-2-1df9882bb01a@debian.org>
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
In-Reply-To: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <bhe@redhat.com>, Coiby Xu <coxu@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695; i=leitao@debian.org;
 h=from:subject:message-id; bh=IQ8+TZrjuX8E+tz3NRY5WCQpnNUScYml/MBeP7a4Wmc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoruEX/cLWQmBEx19TP+43KNp8/V/9NjghgKQHY
 biMCHC9P2KJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaK7hFwAKCRA1o5Of/Hh3
 bZGzEACTv4Ns6J18i5vlqvkPmMxPbS8OBx9r2ReDTMJxi756yor2IOcJDgdV/O8CKL55E9CRL0r
 nv/XIqSPzCN6gLyLBoSlVRa3b8tTWp+amtioyjKmntVPKgpvv7gXyFFkQivC5YMH7cuC9iA5/iD
 fXa6VZP+rjMAIHij//GwyA3rb4qVjkioYseCO6N80FvE5HcA3ySipv02Mg0/XvQshQ6Jrhyf2+3
 EhFY0r0GAOFiZb4PidqHVyMFum1AhhFW1b0Ly97AofCw5ToGm7KT81vsRvFEkzKynizg8UcagMZ
 G+7iI0xmcgtEYDi6EEc87GX96VC16Q0b3hHY8B4Q0ccaU8SPq9cNYDtsjCmk/F2pK4mOsNqV5ML
 ftkUDrSYiS3PbB1iHE/s3yYfpEm3WcpOx53IQLXjBCesYQbvLwBn/31zd0JzrKpJPfgjJxqlDlG
 DkU4We+SpE1VBkKIFA4ZaP+FsQLNUBAJQg29JTcxUIb+TRyLdDhcXGf/Ls1Iugmu0fqvYZQJEdZ
 frSwQybk7ZO5+ZUGrIh78SpVDG0rTGydc9HSFEKrFS3ewQL8h+T5R6DJY2MP44Ji7iWbgyUTd5f
 c3n2NrWCCumDrX+3wBnhGTzxP+lM9I1ZjmJF4PF5HD5KX1gWD02qdTpSk2AOf8miz9alFrvMbPL
 ShqGSeZDkQoYvcQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_034237_617290_D949B450 
X-CRM114-Status: GOOD (  14.59  )
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

The kexec_buf structure was previously declared without initialization.
commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
added a field that is always read but not consistently populated by all
architectures. This un-initialized field will contain garbage.

This is also triggering a UBSAN warning when the uninitialized data was
accessed:

	------------[ cut here ]------------
	UBSAN: invalid-load in ./include/linux/kexec.h:210:10
	load of value 252 is not a valid value for type '_Bool'

Zero-initializing kexec_buf at declaration ensures all fields are
cleanly set, preventing future instances of uninitialized memory being
used.

Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/riscv/kernel/kexec_elf.c          | 4 ++--
 arch/riscv/kernel/kexec_image.c        | 2 +-
 arch/riscv/kernel/machine_kexec_file.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 56444c7bd34eb..531d348db84d7 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -28,7 +28,7 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 	int i;
 	int ret = 0;
 	size_t size;
-	struct kexec_buf kbuf;
+	struct kexec_buf kbuf = {};
 	const struct elf_phdr *phdr;
 
 	kbuf.image = image;
@@ -66,7 +66,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 {
 	int i;
 	int ret;
-	struct kexec_buf kbuf;
+	struct kexec_buf kbuf = {};
 	const struct elf_phdr *phdr;
 	unsigned long lowest_paddr = ULONG_MAX;
 	unsigned long lowest_vaddr = ULONG_MAX;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 26a81774a78a3..8f2eb900910b1 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -41,7 +41,7 @@ static void *image_load(struct kimage *image,
 	struct riscv_image_header *h;
 	u64 flags;
 	bool be_image, be_kernel;
-	struct kexec_buf kbuf;
+	struct kexec_buf kbuf = {};
 	int ret;
 
 	/* Check Image header */
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index e36104af2e247..b9eb41b0a9751 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -261,7 +261,7 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 	int ret;
 	void *fdt;
 	unsigned long initrd_pbase = 0UL;
-	struct kexec_buf kbuf;
+	struct kexec_buf kbuf = {};
 	char *modified_cmdline = NULL;
 
 	kbuf.image = image;

-- 
2.47.3



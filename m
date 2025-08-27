Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD44CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X/wDuwMGXHolRz+V9ennd5Bffj6ymv9Jrzy1lUthU8=; b=EMtRbMvhyqTE4VriKM2FW+DyxO
	p+SE7UTw2tv8jYPfnMVXVn6FqmGIgEYCWjn/Fyt34WkuVeuau/Kh1i0O0nSM8GwxbwTG9VyyhhOuo
	tqIPFkng/bF/it8ove6U+WhPrBd2+QkNPfwqVIxB4AKkGKIXbPu0W1keIg7GHPA9ERjhhCCO+ooZr
	7Y8dAjAw0JBBDB/PaDRGe4FQ82MLVlTuVpCUzLdD+p2D6Q1jRLGdFmXTh5Jh0RkXt0v/YmcPW4kNH
	qFsGGE94hHh2D6xTYKa+lFNA3ev/pCM2JrDMQwnA3AJsyJpK0huFPaB7FRGE/Zws2FiPttulFdaLv
	YXLbQiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFx-0000000FFeF-4Blo;
	Wed, 27 Aug 2025 11:23:58 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDbz-0000000F6OR-24QU;
	Wed, 27 Aug 2025 10:42:40 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a16441so1039589466b.2;
        Wed, 27 Aug 2025 03:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756291358; x=1756896158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6X/wDuwMGXHolRz+V9ennd5Bffj6ymv9Jrzy1lUthU8=;
        b=CicPtQBZip8No8E3LsIWmJ6p1Esa9wP+7wI/zKDHugtdXQ5IQ4gANXHDMOvLyNbFwt
         fOm5YrXgpUbOA/+S86Cpef4DhlHzFh9GWWoNIjqf8qh8lu0r8/mN6gfbjNCxpAFpzl/m
         WSNPKAbzama06oTKL14zlX2fPye3+OAFxDpCimlS9rF/oZg3Hs8SGzxkTcLQ88NtvS5N
         +3I0hYC4qqGEvPIT6Aa5b3UKsTZXmE87g4XLD8ntqErat00RprQZMBAGqJCwkO+Ehd0P
         HRR45fIMUXpnHVNhswNgJKuPfklTr9tTfAKHyiJwEeBr5aQuz2hdtpgoczHSgjUAOGKu
         vFVw==
X-Forwarded-Encrypted: i=1; AJvYcCUe9AhPg4AWFinywwxw5TgIUaz6Jz91Ru5AiDWi+SW/bB7F8zAdYgabwmRm4JsMjpPPBucasId9B0vLiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlDx0+1xlsDb6WflByhdRjuntYXXrJNZjCG6YXjaDL7EGjHe/6
	GBmhy7kmJjjaRX1/Wv2gIgdvj4LPWSFAS0QwHsxXIw9EmjNOwZ7ovlJQ
X-Gm-Gg: ASbGncurhLbPb4wkur4/nGhdoBbIcKk9+OnJ4BUPdQ8ChoRByL/ZTC0u6t/qQXB5dMx
	C2vVvTvQnoRgMNG8VdT/OfayEBar6GDb1rXCMl+bmksEBv+kwpnTc5LUnHoA/FT/RHTAoC4mLwn
	9pxipqyeYOqfkj3Dw8/Cf5QkBW9g1a52WqW6d05wTz+dTmtR/rTWcgZtbGw9V4RQ7qp4fpiddqq
	tUyrSKMHSPs/AoQ9rB0MXIv0swd4RSRjZTQ9KtHvZHl05pbqJCmyOJn2zKwhi9TY5TveLYPauOs
	Odzg7eGfIHuW4JSmVs7fU9cybhBApqJwaUVcam0lI1dKGmUJ/eXTgNJL+kyclwlh+pmXET7q9kc
	CIq8E3usbhC0j6XBOhzG5Uuk=
X-Google-Smtp-Source: AGHT+IEt7HUfyMYn7wwTTBfAgAlW9baMBm2buHWzgRksugd2fL7uEBallbmWq6FW+jaBEaqaNP9fhw==
X-Received: by 2002:a17:907:934c:b0:add:fe17:e970 with SMTP id a640c23a62f3a-afe28fbaffcmr1737084966b.14.1756291357601;
        Wed, 27 Aug 2025 03:42:37 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afea4b5eafcsm365786666b.9.2025.08.27.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:42:37 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 Aug 2025 03:42:23 -0700
Subject: [PATCH 3/3] s390: kexec: Initialize kexec_buf struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-kbuf_all-v1-3-1df9882bb01a@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880; i=leitao@debian.org;
 h=from:subject:message-id; bh=GxK8Y/l6QMpHsSC5/lKRcWUThT3tPFQypyafdn6KEZQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoruEXRx0x/sg5L8lF842+++ptuDPjC3oj8dadJ
 uKgX0JY7+mJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaK7hFwAKCRA1o5Of/Hh3
 bf5WEACRmffaU59y0c07C3h33TU9GzbJO9HOZxapXThAtEqn33XPo4si1FFGv6sTYNargSr6Lzs
 MJosdJiWDHRZaXSxFawvJvBq5XBTfFYs+4tW2EiAU19diAu5I3J5dfl8lqww3GI6zzZIrB5wA4B
 r71V3ZUJK3cZ8l4gTpGp2zWNvG7Q+121ozv4yRD5kfazvucI93HIth7LZcXGKfNkpz+1aW8Y+Bo
 CECDcsH4Z4ZHW/73m7w0ThVouXFEkSIxWhyzVtYPFMWF/MmktJ0t7niZfKNMTRyu++v37nlGcmY
 uWpa1o6LmJUU93AJFkXojU93ztyTZZ2RC7FupVqYsQy5ZqvoIJ37Zd7oPpAULS1x5FX2xzbe7s4
 PYhfG2kBSlHriVV/gT/wRX6SMyVLWK0NQOszrjhZoQUHCkTPzfBdtRkf06wYGOoZHY8VV70IOSX
 fxXgT6OPXyi7xResv3bkLI4vLyEvNWjbQXsAOX3L/ZLQwvYKEpMDSd2eaoO2TSKIBnuQnArR846
 uDq8NSU+HoTOGc4chbxXxwQZH2qpGuNnndVelTsFCmtlb9I7yVtrk/qCAN/9fdHnGjVmU9f6grm
 TWCAnmqakjCXdNYLT+OhBxkDcorfJgKFH/44W4AXsfhUTjdTaRNM+uGkGeRohC2Vx/EUGQTChd+
 UYUwpwtf+a6rOTg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_034239_563534_055DF10C 
X-CRM114-Status: GOOD (  13.38  )
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
 arch/s390/kernel/kexec_elf.c          | 2 +-
 arch/s390/kernel/kexec_image.c        | 2 +-
 arch/s390/kernel/machine_kexec_file.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kernel/kexec_elf.c b/arch/s390/kernel/kexec_elf.c
index 4d364de437992..143e34a4eca57 100644
--- a/arch/s390/kernel/kexec_elf.c
+++ b/arch/s390/kernel/kexec_elf.c
@@ -16,7 +16,7 @@
 static int kexec_file_add_kernel_elf(struct kimage *image,
 				     struct s390_load_data *data)
 {
-	struct kexec_buf buf;
+	struct kexec_buf buf = {};
 	const Elf_Ehdr *ehdr;
 	const Elf_Phdr *phdr;
 	Elf_Addr entry;
diff --git a/arch/s390/kernel/kexec_image.c b/arch/s390/kernel/kexec_image.c
index a32ce8bea745c..9a439175723ca 100644
--- a/arch/s390/kernel/kexec_image.c
+++ b/arch/s390/kernel/kexec_image.c
@@ -16,7 +16,7 @@
 static int kexec_file_add_kernel_image(struct kimage *image,
 				       struct s390_load_data *data)
 {
-	struct kexec_buf buf;
+	struct kexec_buf buf = {};
 
 	buf.image = image;
 
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index c2bac14dd668a..a36d7311c6683 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -129,7 +129,7 @@ static int kexec_file_update_purgatory(struct kimage *image,
 static int kexec_file_add_purgatory(struct kimage *image,
 				    struct s390_load_data *data)
 {
-	struct kexec_buf buf;
+	struct kexec_buf buf = {};
 	int ret;
 
 	buf.image = image;
@@ -152,7 +152,7 @@ static int kexec_file_add_purgatory(struct kimage *image,
 static int kexec_file_add_initrd(struct kimage *image,
 				 struct s390_load_data *data)
 {
-	struct kexec_buf buf;
+	struct kexec_buf buf = {};
 	int ret;
 
 	buf.image = image;
@@ -184,7 +184,7 @@ static int kexec_file_add_ipl_report(struct kimage *image,
 {
 	__u32 *lc_ipl_parmblock_ptr;
 	unsigned int len, ncerts;
-	struct kexec_buf buf;
+	struct kexec_buf buf = {};
 	unsigned long addr;
 	void *ptr, *end;
 	int ret;

-- 
2.47.3



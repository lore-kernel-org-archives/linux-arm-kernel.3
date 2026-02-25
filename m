Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31B0EFB7F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=; b=V5K7NncGExePivQCsrd7HZ8gn6
	HuxbCvUpJHFAHYQUlglGEgnixRWdKCiwrwZqyqeRYvIPBHDzGki1GKHmhTjSNO2RcM9qIszUf7+28
	M/iJt94xDUqwY8Y9IKk0Tgmn8Roz9J2qaCi+JK7osOQ0N0r0/t6urjDvk9pWrWeW1OwDdQjS5QCLQ
	+rdjc4u7HuvPTWDfEat9KU9xA9yR1nIUfF5B49KB47ZEYXvn68muTvaKrI2Lli+C7cVO4RZ6v7+G8
	g//MwMaEmNHBucsEeUio+X7OnS7ai/i4iQXXMN60hGhk2Lb4Ec1/msS7z2CouE/veMxF6Lddo1yh5
	xgDS4BSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80C-00000003H57-1Hym;
	Wed, 25 Feb 2026 06:04:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv80A-00000003H3m-2C5c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
	b=EwXXLidMqBPl8XnzVq4unr7dkJWjevZ1tclrWmdPURaDSZJdWJ5aIe+gYhPlVmxsT+1Pjg
	k4htwANqGGwJrnG+qdLfgb27glStA+s7RinLVlnXRjmpdu6w/vTMktE4EYxPOEdnVP6o6a
	3PYtrrijLM7bacTyf72787e0KcJ25xg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-yTsqvp27My2bRZOdnDFscQ-1; Wed, 25 Feb 2026 01:03:59 -0500
X-MC-Unique: yTsqvp27My2bRZOdnDFscQ-1
X-Mimecast-MFC-AGG-ID: yTsqvp27My2bRZOdnDFscQ_1771999438
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824a0ea2025so2786702b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 22:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999438; x=1772604238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
        b=nCRK8JitgY5RfXc7utrFSg0/5/4bUYFLq+Apf4ZXPkpnI+Z33rwx59Dr7fRBkbixpJ
         2ju/VKKJdGWXzzr6U7KzZGHDovoOaAhnr20fI+GwlXCE8UG8oxmULISt9LSBvvRVY65r
         Y6r8IGUefBJrbWa5B5S9XBpow/n8FANjzbkElh7zBu2pZINrxsl7QYxMOArKXQpq0DUT
         /lSkJ9tF/u8WJ+HI0miu9z2LI9w0YqHrZyH20dipWgIJwNdmxSHPFyd/+Ex4eEvCT3rI
         flIvAEi6ov9cdVGjxfHtdT3kTmDnivAVrLn70RLSCOFQW+XBeKn+cU0ZiQGNa/MPuWyq
         H7xw==
X-Forwarded-Encrypted: i=1; AJvYcCVkujdvDnSxP+m/1InlkhQrejRbrI6UjV5YbT0V/yYFLq8S5Q/UNbIl7eIUjnb7h7l7g+4NtJScv3fXgJHnQSPX@lists.infradead.org
X-Gm-Message-State: AOJu0YwxY1cJ1sW9nJdewP8oImDZmquMA6bHYHVB7tn7/A8MfnHRCvbX
	PH+xJtIA/1gJA/+7kt3MnRdbVvwcjKuuZj7gdpe9qwZRHVFbGc6flufYaBUpF1rBo+2/LfVoWKP
	lfk9VHP+P7tU/KcX3a/7odtwYvDi8FWuaiFn/tu+GxLMwcTcYgz8wFU8pk6idR855XioRJxerwH
	v7
X-Gm-Gg: ATEYQzxhE/iRS7T8CVF0ebk1WgG2dD63YhjJlFNGBlHw5Ak/N/8ahCxB4dGR3o3RYT0
	VuR1CjuEJCywN0qo/N/35qnJ7adM78ngEsieb+5wk9ZtuAR4i9iC+irVODbNQXVFh49yqhf7qHr
	G1Nk85HTSrIjVBJbvyXf5UxxDzBXEdNG/LTrxR4jd1QRw38gFgPRY5IjX3YBhnLkQztl1vp7/AK
	Mh7RRgLKMXGeM43dkRLAAbGe4umCz3uNQG66ibhksn+Bg90oN+icEFgAJyvZi4Rd2SOw51ChFjC
	HAEyNmG3Ap+btF2isCN0RknMkx5Q8/Jeb/ww/psok7DwCrWo09kUWffwbAYYIXbi4XrW/geJln1
	wyEe3JWqpAGg2
X-Received: by 2002:a05:6a00:4c82:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-82724a3529bmr1223064b3a.29.1771999437882;
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
X-Received: by 2002:a05:6a00:4c82:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-82724a3529bmr1223028b3a.29.1771999437424;
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8fdb81sm13000482b3a.64.2026.02.24.22.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v5 1/3] crash_dump/dm-crypt: Don't print in arch-specific code
Date: Wed, 25 Feb 2026 14:03:44 +0800
Message-ID: <20260225060347.718905-2-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DB_ysmw_rNIvYDZ3mzHDiuFY9mj7ojQV7QciLjbaooI_1771999438
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_220402_653951_A74EE6CD 
X-CRM114-Status: GOOD (  16.49  )
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

When the vmcore dumping target is not a LUKS-encrypted target, it's
expected that there is no dm-crypt key thus no need to return -ENOENT.
Also print more logs in crash_load_dm_crypt_keys. The benefit is
arch-specific code can be more succinct.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/x86/kernel/kexec-bzimage64.c | 6 +-----
 kernel/crash_dump_dm_crypt.c      | 7 +++++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 5630c7dca1f3..7e980ea49d8d 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -525,12 +525,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		if (ret)
 			return ERR_PTR(ret);
 		ret = crash_load_dm_crypt_keys(image);
-		if (ret == -ENOENT) {
-			kexec_dprintk("No dm crypt key to load\n");
-		} else if (ret) {
-			pr_err("Failed to load dm crypt keys\n");
+		if (ret)
 			return ERR_PTR(ret);
-		}
 		if (image->dm_crypt_keys_addr &&
 		    cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN >
 			    header->cmdline_size) {
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 1f4067fbdb94..2f7b42b09673 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -414,14 +414,16 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 
 	if (key_count <= 0) {
 		kexec_dprintk("No dm-crypt keys\n");
-		return -ENOENT;
+		return 0;
 	}
 
 	if (!is_dm_key_reused) {
 		image->dm_crypt_keys_addr = 0;
 		r = build_keys_header();
-		if (r)
+		if (r) {
+			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
 			return r;
+		}
 	}
 
 	kbuf.buffer = keys_header;
@@ -432,6 +434,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
+		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
 		kvfree((void *)kbuf.buffer);
 		return r;
 	}
-- 
2.53.0



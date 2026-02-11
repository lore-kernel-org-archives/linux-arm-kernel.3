Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C28EB5976
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=; b=DM7wXjhxBolhD3xW8JjWlTWybC
	Inp0/B9JFJdqH7ek75uNZR/Dgg7l70noZrmBRunkdC4h4h4XdEPK1gEXocSCgyw2IkbkJberAyY8b
	fobe/EaRhPrSWo3PDRNZZdUPfXfLQYTcHT7yxJRLF4i6f/5iVxKpLUNB51ZVdXpFBqF7MrMQWuZR8
	oS/y6+mtCxsMJ7r+nJXv+iPngr5r/AB+9NlDrRVFL3hWRZ/lpIZXc9exG1gNjrEor6ZHfpM64XzXF
	IDIADcY9JVe+3SYUtEk4pxBFqY2FQo9tD5XN90cJ4TtcScYhvEdiiNSE800kveOGwvJlNwVPsftTX
	vD1cyzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5WD-00000000O0R-09xr;
	Wed, 11 Feb 2026 08:24:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5W9-00000000NzR-3DGr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 08:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
	b=HGM0BIZ2j8v/Ckvo+ZUTjfoTeR8qZyKRQafo3MM46cOEZ8By7cR3hnNBDkpdpoh2T0WAIR
	1g2NCUsh7869SpDqdOch7vkAT3334XDhQqnXin9TR45qtZtSYB8+qsOoH59cseIazlnfKY
	8SaT6h7U1jMjbxPyHOUaGPv74O4pNPE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-YOQ9FhueN3iSCYQ-FD8RMQ-1; Wed, 11 Feb 2026 03:24:11 -0500
X-MC-Unique: YOQ9FhueN3iSCYQ-FD8RMQ-1
X-Mimecast-MFC-AGG-ID: YOQ9FhueN3iSCYQ-FD8RMQ_1770798250
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad6045810so15371755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 00:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798250; x=1771403050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
        b=JcHi9l+Zt1NTNi96F4bw0HG8modRR2VyRyizRuvtfMfb8Sq1OFfVcXxjz2/6S35HAS
         gaoYA6MM31zdIAs23VAXVuQiFcxCbL1dfnIf+Y1fQdSRqXvbeZnLKkBHi2qPR9Qzs5A5
         En995N01rlJUrMpjxw4Yll2k73BX+VQt/u7iLCU/yKC24NpFtvgY4/4djbhswcAms0cU
         KsWPRNcURm8bQSytpdItCm4EfOQ7YHto36oEYxCOS8TZ1zMz5b4vPYZG4l7jf5MFDg9A
         aOs6bt/FViIAxrt2QZipNwjXhDbdJkZh//ZrZUhLt+nJEU3CKtV883eLgN4VqTNWODiq
         CBqA==
X-Forwarded-Encrypted: i=1; AJvYcCX9KftT+dd8GNxp5avu3kKXmiJWCcdB1XB1yqyEX4GW+dhA7nZCte4qsc0sKeAeYmaXaEuV9FS+MHLMJAMicvb2@lists.infradead.org
X-Gm-Message-State: AOJu0YxO1w7E1hxRJilYHHUSQAkomNfH+Hhityc7LcoH2MYU5ZASlcjf
	tVgvkR9Nws64XM3VX9HWVHywOEZ3BnzvLJlYCJZpqBg4WiTGQhyD95yn0RvUlrQ+RMJmW7zAuf/
	gTfP71NsLZ51ZNBJIROYWj61D0UDrd+jQrgdVYW4THQSW0Mkk5TrphWlqpTFH1JrxV6FhZeNGi8
	ro
X-Gm-Gg: AZuq6aIOu1W/ETxNf/z1kFw0aGBLfUZD/neasG3R3RCIKNrLDipwUUd8oVLkVybch2k
	1AvWh6AbpKgBtGjd++QmFNldo91h0gva2V9JumiJQuDE0RYXKworjlpAHooWIPhwYx6UVmf8Y/5
	as0c/V2kjC+/ZD115skyB9p9Q7BLv7RF9USL0uk58UTAfhjDYF9FwZj4Pnyay00n3zCqcO8mYqD
	GnJlvgXYFwGdkHcknK3seeqvaXkCB9fcZct9AOf3o6rpuNTv3imZYSFowpagPmL+p+2LbHmvZSq
	WahtQqzMXZEM2S/tA6e+5SBhowyGaYjpSzIoa+Xvmlvxn9Fmx/JZltpma0tqSe+upcJ+PPQzI8z
	1GjV8mHYrT1bl
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr203049325ad.39.1770798250252;
        Wed, 11 Feb 2026 00:24:10 -0800 (PST)
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr203049015ad.39.1770798249724;
        Wed, 11 Feb 2026 00:24:09 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964c62sm14460265ad.55.2026.02.11.00.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:24:09 -0800 (PST)
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
Subject: [PATCH v4 1/2] crash_dump/dm-crypt: Don't print in arch-specific code
Date: Wed, 11 Feb 2026 16:23:59 +0800
Message-ID: <20260211082401.2407853-2-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211082401.2407853-1-coxu@redhat.com>
References: <20260211082401.2407853-1-coxu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mS5A5crc6ct6IdsnH3beyvJkLn4Cz5eCYNfGN9DEaWg_1770798250
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_002413_873301_AA75B6AE 
X-CRM114-Status: GOOD (  16.26  )
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
index 7508d0ccc740..d20cf976d01a 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -518,12 +518,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
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
index 401423ba477d..478dacb0625c 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -405,14 +405,16 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 
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
@@ -423,6 +425,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
+		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
 		kvfree((void *)kbuf.buffer);
 		return r;
 	}
-- 
2.53.0



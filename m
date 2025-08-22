Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA3CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=; b=W4/nuEU+d8I6YGeGGi//mT7UDP
	chKNlePtpxk0Ixk3qizXRj520LUNJgXvjBp0RWnawS3aELnoFtDHmYHVV/Jtnx9ls6AkTXEktjiWs
	zfnwyam7k6x/kOOnsk3+DyaRRoEZHkUk2QobHvaTqwQwHJQAPxACLUjaLTPPkk/Rm1gsQHDc8dYj8
	kxTSEwA9Co4oPtZjsZSKiUTBJ1I1Rn3Xfx4GiDAiytdfkjyNNIhbWX80Wud7fb2vvFE2obEUULJ1t
	rpaQVtzPgjh1CLNZXSE01xOT7pu1Nf8dtlpk2g1zDk6RIxSIFmyP9iRLlY7drb305AA4/D1FxO7oD
	5YDfDzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG1-00000002MxX-0eB9;
	Fri, 22 Aug 2025 11:48:33 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJF1-00000001UU3-3hj1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 04:19:05 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b477029ea5eso1596239a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755836343; x=1756441143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=;
        b=ac5GZDc+gDev+ngE4SD6HMEG0DQcYOq5n2dtElSiGeXR4vtJkURh5pIuGoCOQE703n
         6xv7eCgPwz1Df5gJBVVETocEJAXW3tH40MbBB6/mVoXzX7Kw1X6w33qEvNR9y708KR0+
         XUKhunbUDxm98kLXFy5UIlF1Jaml4ikQE6InClgcjh388i7Ygt2yf5Og053hMlh8WxI5
         dVpv9LAPvuDXoO6v1CKI6a3yHltba4SYXeBKmvng/XiMjdwpeih3Xi1e8ez7faRc9fDb
         6dwb1z7rkY6d/DyB1KikMBa1F5Jpj/9SvMLXV9KiJFpOyEYhOG4bbe9LIfVuyIZW173i
         fLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755836343; x=1756441143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/PtowZWncD7g5yzTgjrgtYoRGlVEb75A6E0NAaBaiE=;
        b=odeDt3nxdgXD31SdT4TgE9XIRrY5Dn+05FiT2GRcJqsq8ScN6kwTrKNPlELopoSfRw
         q7J+G34nK60/W0p5SPLd641WoqgOBCP7dv7LAluNQidtv1Bhz7cFtAM6Y1H+Q57cWcsN
         f6rn9E8D/E6HwXEB2hSDlaKZV6zQY87UJFuWQlgvocc8h9HP6/RHr3ZRHeUbj2W3qnP0
         x8b//6SxsJUz0JMRI+Jp/86RaSYw+w/aGzXx9qtswe0EPoj/nmMSLFoKY6+mOFen4THr
         XyveKy3nGtCSx8ZYTwYpKJqPl6CrDC/OwqHgjZj0V3p9Heh4zEAo/FjlTK064ekEf7Ou
         mlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAJWQ93UKtc94r/f3wHfUKFzm+yQbcbAEc6059BNOiGdvD4nHIsZfSrp/7shbdHI4CVR0b8jewylq1x0cJPGq+@lists.infradead.org
X-Gm-Message-State: AOJu0YzHSDQyHEJBiS2TOb2uut9/Yc6MkqXVzkCEbsBERFkVobq08Txh
	hUwbXsYDaP48Q1bmEBhIsB1mvOymyHajeBorycnZkNMbm+xpwys/h7vM
X-Gm-Gg: ASbGnctBovqCh/lVdQHcst2oQoLemvkZVpuMf7FxytBi0Um4cw/EiF/gaactdZubQsX
	6dhsHfXSpKlRiGsI8oZ9vvZh0sIOGc/51RZ1uwdmjMXEGY6kd+5I5v4cCHU8QdwJ28BaEM8eot5
	EkpG68I3HbvfhfWXQZ0qK6mbzZS722i9QEXK9g7P+y81WuLxreX8glq22F8zNZEtYhMtSoUzLni
	3gN7ILtlCnqKS4iNAhnCfylT9QIFaLNoJi3h9N4w6kNMNkJBYYpLtXNheoQoKetKUrcXFmE/PoS
	Mj7x6ddJ0ozEtd6kqgVzg9dr9QGd26nMQPdqK2rDHt+qCRc0DSOWa/IvH2cQe9fOxTNdYWb7tM0
	Q0fgJHK9c2v8jltGltNhNHs9SgyoLwmviXpS9TWXr6bAZh+EiTNaQZ7zC1XXo0g==
X-Google-Smtp-Source: AGHT+IHNKJplTG9Jy38Tlom7qmiWaoZeBRK6WRgraG0jbKbTwm9Axuv3DgJMIKeBlkJFFWOqnZNZLg==
X-Received: by 2002:a17:902:db0c:b0:240:483:dc3a with SMTP id d9443c01a7336-2462edee860mr24421865ad.12.1755836343119;
        Thu, 21 Aug 2025 21:19:03 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:ba38:b533:dcf5:1e7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d1375a3sm9534559b3a.43.2025.08.21.21.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 21:19:02 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH 1/3] arm64: mm: Cast start/end markers to char *, not u64
Date: Thu, 21 Aug 2025 21:15:36 -0700
Message-ID: <20250822041538.467514-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822041538.467514-1-CFSworks@gmail.com>
References: <20250822041538.467514-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_211903_935232_F0F41DFE 
X-CRM114-Status: GOOD (  15.54  )
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

There are a few memset() calls in map_kernel.c that cast marker-symbol
addresses to u64 in order to perform pointer subtraction (range size
computation).

Cast them with (char *) instead, aligning with idiomatic C pointer
arithmetic.

This patch provably has no effect at runtime: I have verified that
.text of vmlinux is identical after this change.

Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm64/kernel/pi/map_kernel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 0f4bd7771859..2b3047860230 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -179,7 +179,7 @@ static void __init remap_idmap_for_lpa2(void)
 	 * Don't bother with the FDT, we no longer need it after this.
 	 */
 	memset(init_idmap_pg_dir, 0,
-	       (u64)init_idmap_pg_end - (u64)init_idmap_pg_dir);
+	       (char *)init_idmap_pg_end - (char *)init_idmap_pg_dir);
 
 	create_init_idmap(init_idmap_pg_dir, mask);
 	dsb(ishst);
@@ -188,7 +188,7 @@ static void __init remap_idmap_for_lpa2(void)
 	set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
 
 	/* wipe the temporary ID map from memory */
-	memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
+	memset(init_pg_dir, 0, (char *)init_pg_end - (char *)init_pg_dir);
 }
 
 static void __init map_fdt(u64 fdt)
@@ -242,7 +242,7 @@ asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
 	map_fdt((u64)fdt);
 
 	/* Clear BSS and the initial page tables */
-	memset(__bss_start, 0, (u64)init_pg_end - (u64)__bss_start);
+	memset(__bss_start, 0, (char *)init_pg_end - (char *)__bss_start);
 
 	/* Parse the command line for CPU feature overrides */
 	chosen = fdt_path_offset(fdt, chosen_str);
-- 
2.49.1



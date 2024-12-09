Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A60E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38xYmCBd/yHxA60HebMv1KUqXIVUks1klr7bSBDZuX8=; b=z6rtdXutU56Hj16W7w/LkcBcbS
	BO9uWmIe/3hEko0jiEk8Nb4tMsFuP6mZwzfKRthaMzhltnF8HT/eC41F7fjJ6nCd09GbFeiLbScwV
	J0I7qtM2p6ENsUc23pabvJDVZ+kFFx5e1evwHmwgqqIPaIpLUIWz5q8e10olkJa9gz62ozKKZ3anu
	RQArU/xx1SbQcaWCY9l/qcmy3RirJIFnufrKjjsYdvC7SyVjNBzZr4ESsPYBHmLS4Z8izG4qg2DSp
	0h00+zapxtL95vYqu8ANZx6RCkGkybZxNM7yyxYKHhxWuczvGg4IpVhzYj6s/yo/XJby1s1GlO/r4
	K7c4if9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbP2-00000007OF9-0Gu9;
	Mon, 09 Dec 2024 10:54:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbNe-00000007O0G-3Uip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:52:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2165cb60719so3843205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733741565; x=1734346365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38xYmCBd/yHxA60HebMv1KUqXIVUks1klr7bSBDZuX8=;
        b=cGSEOLC+uMy4Zld2i/eU3dp+06d/CLOG1jHMYc0rQppTTvWHJuV+yOUxfR7H64/aYr
         BDIadkK7rlO2FWvG9TvQMNTOxm2RD6IGiNuaF5LTXeE/PdRNi0GGLyW7KYT5HuPzuOMI
         9yd1nhlpTW9KEvaDH/Boh50VKfIO8vaYKJ32eN5ReiSZ9iYFcvAiqkYK5RbDQzJ/vVVe
         2O9hm/Gi/dKgdUkPDR70BASjPlI6KUhGHk+2ZhBCR4I+Cy+VI8aSICeJxBmiqW+6B70Q
         cdcV6RfMUCTJMEW+P0tWL433L2pDw1hp4cd/4QIuRlji2GbNdpqBD6xpp4halx8XCzcF
         sulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741565; x=1734346365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38xYmCBd/yHxA60HebMv1KUqXIVUks1klr7bSBDZuX8=;
        b=gZ+/3v7qa2JLRgs5EbZmdZw8c3b4NQqz21aSiXXBHvsb6ZhFrb8Gn3GGGML1df7mrB
         S3iTj6pxzySrWyq6Uwu3h9MPTosPNJTfOxPoe8Ev6BjNAEeyX5OfkN9Mh6sfe8nf7Q/C
         6VAzXR1UHcZWxOYctOGozvYoyH+cZvZiLO8OoOff1PUxUOiRK1AlfySTlekZ3RjbXo6O
         2pZZL0w+bf3P/8dnQawrT6IIFTSElWZ32B5bF3025sqKYjGBmfhJvSnmPLTWTVxUI/6/
         fAXq2Lr+ejcYrwxleoFTUTK2DC2JUMUmVxAHNf/bIThLCX0DsVIu+edaEDNc2WzwduWP
         C9rQ==
X-Gm-Message-State: AOJu0Yy3c5Y9BDENWgk9cig08KLbkYu4ZKrv0gEMzJaYRGQ0EJV4fmK9
	kSxv71HOz/O80F7TyML6/5Fm4sNS1IQY7JXSx+DgHS9+VNA/XE/F
X-Gm-Gg: ASbGncvXL7Yx+n4f5Psdl1kjh2EnD5rX4yxAWKU7epcv68OGRgEgnu3bVhHjikDAFsI
	jwkMiTku/3AbHfwigaJbMLU4Qmh+4Ek2yqfajSWCnv5GqYI28Qfs6DjGyLlIkAh7js5g13zUCE5
	X0KbCmH5RwTl8r+On4n1TbqYqE4tfPddmPmrwcBxbTHnPFuxnzERXHpxgXNg0OJFRHkdErnui19
	UTVGExCVOuOd/OK8BtxwAeK73GhH8QDCuBf0bVRsNHI/jeaAcVOpgof
X-Google-Smtp-Source: AGHT+IEreUug5wTKCz/c7KcglP+tWMz1wYrXf0knBCV2E6EAZCfQHAEP6KSMVBU1yeGylgbEmynL9g==
X-Received: by 2002:a17:903:1ca:b0:215:6489:cfb8 with SMTP id d9443c01a7336-21669fd0edamr442795ad.10.1733741565013;
        Mon, 09 Dec 2024 02:52:45 -0800 (PST)
Received: from ownia.localdomain ([45.8.186.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9f5bsm69928815ad.132.2024.12.09.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:52:44 -0800 (PST)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Weizhao Ouyang <o451686892@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: abi: fix SVCR detection
Date: Mon,  9 Dec 2024 18:52:37 +0800
Message-ID: <20241209105237.10498-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_025246_867039_973C9E61 
X-CRM114-Status: GOOD (  11.14  )
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

When using svcr_in to check ZA and Streaming Mode, we should make sure
that the value in x2 is correct, otherwise it may trigger an Illegal
instruction if FEAT_SVE and !FEAT_SME.

Fixes: 43e3f85523e4 ("kselftest/arm64: Add SME support to syscall ABI test")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 tools/testing/selftests/arm64/abi/syscall-abi-asm.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/syscall-abi-asm.S b/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
index df3230fdac39..98cde4f37abf 100644
--- a/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
+++ b/tools/testing/selftests/arm64/abi/syscall-abi-asm.S
@@ -81,9 +81,9 @@ do_syscall:
 	stp	x27, x28, [sp, #96]
 
 	// Set SVCR if we're doing SME
-	cbz	x1, 1f
 	adrp	x2, svcr_in
 	ldr	x2, [x2, :lo12:svcr_in]
+	cbz	x1, 1f
 	msr	S3_3_C4_C2_2, x2
 1:
 
-- 
2.45.2



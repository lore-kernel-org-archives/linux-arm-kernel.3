Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E80D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y+JXE3B5KawPF65U6HSOHR3FL9VUAcwuxe0IMh5c68A=; b=d77FQ94fVlfOSj3wXK7KmV3sTF
	y+OhJkMn3TmcfrFrBYok1aiqWkg1xjNxLda+gq3oNjuDhZQcNOMAJ5Q06E97iHyuWCaXZ92lZZND7
	icVKTFbCFo9IaAJfrDbDoureqSoYKGMrz5lNUb4SQ3aeQFWEQ7GWtPWnFWfy8MzSYTn6FaeJfwHh4
	n9zvpVlP/5d/LZKRYVXfjE/Zu/zCzkycONcNXWB1kQgeb+e7DP5jxP451gItKs07MrmUm2vAL9YzF
	MD6YgWKtoZFSYpYst+NXBI+FK1i0jLzv28i0PacYbeuYLPhczfBYBbBO5JlVZy9sYs/RFxHCP/fGB
	EAOWuCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3Jl-000000046KA-0XRJ;
	Fri, 15 Nov 2024 20:53:25 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3Ip-000000046FT-3SdU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 20:52:28 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-460ad0440ddso12112281cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731703946; x=1732308746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+JXE3B5KawPF65U6HSOHR3FL9VUAcwuxe0IMh5c68A=;
        b=D/FWRsMpv7FyLVLlK5x2uVOtosG2v7nvHWKDr8fq6Gj8vL7TAmdHN4VGjE9WZ50a1T
         4/9xTwLnXhaRYwDBTwQhB6o8YuPjOILq9QZKhCMD4cwKSACun1QHG4T6Kqbh0qP62MnV
         IP8Uw7PgsIPSjlB6+8hC/pA6Ud8mje/ZgODBJQNvj4cQcMH4CLyM1Vi7+a3B6dXkVHiI
         1Dtyo2CWvmYE2qiEaR+VxcKrf9Jet29mWNbZ/IjUlxIhvRLqYerizSnniM8bWPbfziSE
         rAkvcISfDkeMrwPHSifY+cNSI0KNrk92Z5Bb2fGy+T4frL79wHBzHSEeNZmvozTqmLm6
         yfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731703946; x=1732308746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+JXE3B5KawPF65U6HSOHR3FL9VUAcwuxe0IMh5c68A=;
        b=xJwTLQtUf7eOGP5ZJLC8wVtAzf6UvKZ44XAgmoeYNBrjbmmcxv20mhpkfTEtr1h1XG
         8UCHpir9GfC6atLEY1sLuSMUKnEVQ9HnQaH6SZ5aKR6cgLSJxTNe/6X40KDpS7tyqITj
         ZNdo8Uw/LAHidcPb1FEkJwIqOwxwrIK9zIrcvhOoDO1MkghKk+nImq1rk+tpZKqayUMh
         /0yG4wqmMxYOnW5CWH/twHiLv1mLjBLGM27u+9Ie3ugnLo9ZYtRkANH9uggoWaMPmd34
         hT7y9RI3AdGgB+C/jFPOBiRSl58JvEQjSs0laV4ZER/CoyaA93xkvRsaO+E16Bq5GWNZ
         xVbw==
X-Gm-Message-State: AOJu0Yz3jKmpnxe2H4jIJ/D6SKk0iecEDsZI11hRt8tdQ3ws7Zp7HOIr
	DclHWwWd2lvaFMmCZ+8ABhYD/Jc/gm3BixHgrAfXX3j66dwjS29u
X-Google-Smtp-Source: AGHT+IHVkVw3cryn3SiPFqi2l6cxFQ6DtPK1Y2TsQd3PF5Xv4T1JOhWcXgQAcOPV7Er2j8fGRO+liQ==
X-Received: by 2002:ac8:5791:0:b0:463:54f1:ec3b with SMTP id d75a77b69052e-46363e0c9bbmr49897901cf.17.1731703946129;
        Fri, 15 Nov 2024 12:52:26 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4635ab5da6bsm23831271cf.80.2024.11.15.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 12:52:25 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: uaccess: Restrict user access to kernel memory in __copy_user_flushcache()
Date: Fri, 15 Nov 2024 14:52:07 -0600
Message-Id: <20241115205206.17678-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_125227_863834_8BCFC101 
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

From: Zichen Xie <zichenxie0106@gmail.com>

raw_copy_from_user() do not call access_ok(), so this code allowed
userspace to access any virtual memory address. Change it to
copy_from_user().

Fixes: 9e94fdade4d8 ("arm64: uaccess: simplify __copy_user_flushcache()")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/lib/uaccess_flushcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/lib/uaccess_flushcache.c b/arch/arm64/lib/uaccess_flushcache.c
index 7510d1a23124..fb138a3934db 100644
--- a/arch/arm64/lib/uaccess_flushcache.c
+++ b/arch/arm64/lib/uaccess_flushcache.c
@@ -24,7 +24,7 @@ unsigned long __copy_user_flushcache(void *to, const void __user *from,
 {
 	unsigned long rc;
 
-	rc = raw_copy_from_user(to, from, n);
+	rc = copy_from_user(to, from, n);
 
 	/* See above */
 	dcache_clean_pop((unsigned long)to, (unsigned long)to + n - rc);
-- 
2.34.1



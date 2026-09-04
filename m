Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBD8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzeoz6MkP/xVBAuo5DlGmmGabrcP5zC90RAVfVgH1jw=; b=sN4IW8CM+zp3K4qs0okmJpp9r0
	EmTqdoLjoysNS9f/vFEAO2xLugQGKrp2hpGjm9z8p5wtsUwVmwywTqEX+tGyYi6K6ANri7fZKQOqJ
	faEoGAauMbEtxbsStTTTbEb7GwMVbanpgGLdkLu/2DMJ/pBbU13XMXGN8GT1nhttrjNV3pdH9YcHg
	nSXAQJZNYNCIWES+SCiDT3rlES5mflJ44CBlJfMnhAOz7pu9W8NUewWTpruD6PFYpcsAs/DvJRGSi
	KCyAsYj3aedqtiPZTZ5BZVIwWfIXWnpLhUDfsgSS0eHoaRR/DQVZSLLR8jheB+NUvXV/Sy0kP8Gzs
	1+6AskAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S37-00000001oYU-0At9;
	Fri, 04 Sep 2026 11:25:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S34-00000001oX7-0Joj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:25:35 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso999380a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521133; x=1789125933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzeoz6MkP/xVBAuo5DlGmmGabrcP5zC90RAVfVgH1jw=;
        b=GwSDcKoox+/BO5M3kKQMpYAsluViWBqEb+FUWq6Z6am7ONUfhHe16f/hc9fxWB4e4K
         ZkoK1VVi6bOlFsgozej3XLeUFWpU3Z/0cGW0D2m8lv/S/pkD+3mUBk9K9Jd8OZrGg/qv
         Mi5isn42BG6hXhYUW1oUfmC9oRj5zkS034mAypq9b1hFSV32OoycCgQ4P3M6Q01Wlfx5
         mXCQ8Lsyu27qKabW8NzzykiJB7GYoce0FasFAHNUF1rkeoyu3JlgSCJ4z5WIWmrD/75o
         cwmafRiK7AWV4OXo3M/0XIOXRMYSY08piKd2jq6cCWh986tjngJguPU18l9MkQ70jm6j
         0AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521133; x=1789125933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzeoz6MkP/xVBAuo5DlGmmGabrcP5zC90RAVfVgH1jw=;
        b=k7xxiVkuPhzBquVWNrz1e9XG4Y1P/X9+DLWngK+wizah85dx6ZScVtE9Cn1t8hbRgF
         ATL/LtTumLeZ3fBzr4g402Jv+VACh2tCPX3upAMfLajf/iKJgQF8tasGtK2Of0aFPvBf
         vz8gRT7J7vAiaRODRPaYUwqTtcxOLxylD+Qlxlt24dRTLLa4bP5639z/CTXs+Ryahj1I
         eFiQoOKPNH24x27JnuHcbkQaOj4mZRd3DK6GoPEC72GPy2VQZSzNpK8LKBDq3CnZArti
         NOxZPAyY4xYvApzKdHG+fBaESdi21QZQvpYs1WuK7d9/vdo8BGppseyVjyOQsHahF7mO
         lt3g==
X-Forwarded-Encrypted: i=1; AKwUvBwbrieEx/Oj+yG2z/OUVHBtBlcW8HOEqlYlZWsQJR3wC3NwjAiO7VjGemyNFKn20zjjWR+p4zmuwREoIV6JLDeB@lists.infradead.org
X-Gm-Message-State: AFuF++k81xqK7e1lMnN/0zzYIW1FaeZ7WEjkexnrbzgZC2ECIVF4xZlA
	8lUoYjNhd8Hmz+tG0tCoHSFNizwTtOw8pY2i/4tQnHvEzULsHB2WWto/
X-Gm-Gg: AYBFou2JpJVuZmic0/Bc9uVqelAd2LEpRrmFQnihsgFIpfJsgsMe3+IOETPmVj/ha2D
	5+FoalmM9M3EbMoFIQU+nqn+5JLOHekn9dQB1dEdI8mHkAC65LejcrZss2A0V7OnXaw6KAaRXsW
	ydVxbgBFFuXD7kJtYZUGr8DgUktrIJ1v8VhOvwSSFjMpjVWusSzPUnJkMeU4ac3Q6MEqZ7D5rBl
	xj/Z18o9dAmjwHS7hR3bpb7LLf8QlIh2tIaLsvY6eapUnAv25iMXFT95SjZwfyKAgYx9sYMLMYn
	bPtFFTg3Q317/Tox/1e5ZABN6BdmPS1x4/iGj9H0kDSOZXjAOfPTmceWywugNzOy88G1JnVSLnw
	MpUqpOlZdhmxHYojqf/T6XLbETqWqasVo+BYmEPsChX0PU7nxc//S+4cGlf2IfJzULGH3Jbckze
	BNVoA5mRHcs9yjvP8h3uVWCNFdckyNBz/RKMx3V9f2uAHbwbqrnM3XL9Dv+J+oGjAk1p3N9GyVQ
	ZnDn8AmqRm6PEvFoL4mK4WxrTE=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr7172844a91.18.1788521133139;
        Fri, 04 Sep 2026 04:25:33 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:25:32 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: fix repeated word 'there' in comment
Date: Fri,  4 Sep 2026 16:55:18 +0530
Message-ID: <20260904112522.1426-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112522.1426-1-hemanth.selam@gmail.com>
References: <20260904112522.1426-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_042534_114008_3EBFFC9F 
X-CRM114-Status: GOOD (  13.43  )
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

Drop the second 'there', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 23b87b5ef7f1..2a6b6e29c118 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -1288,7 +1288,7 @@ static __init void prepare_page_table(void)
 	/*
 	 * Skip over the KASan shadow area. KASAN_SHADOW_END is sometimes
 	 * equal to MODULES_VADDR and then we exit the pmd clearing. If we
-	 * are using a thumb-compiled kernel, there there will be 8MB more
+	 * are using a thumb-compiled kernel, there will be 8MB more
 	 * to clear as KASan always offset to 16 MB below MODULES_VADDR.
 	 */
 	for (addr = KASAN_SHADOW_END; addr < MODULES_VADDR; addr += PMD_SIZE)
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5403EC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73ZeTEaj8KHhHEVAJJ3P+PdsqfWnK5wqTCpbWEuQreI=; b=B+13cs8+yALrlfxL8CQ5U7AeI9
	CsGgvRBo7tXonwsn124VlZ2JjZ3p4siHzpRctZ5kvGeKZ2zAG51C5rfWJHr1+DaNQYTrlnhkGzF9x
	1xJUuwoeTUMDt516IfIMuJEdG9JqJGSfxAIK7scAM66v8WY9k93BXvi9L2+B3PDK0Rn96Eg9tJkhP
	i21ufCg3ecY65fiojNuLDRD8pgV+NFeb3pEqdToTAetW+Vqy/Blti/KUjV9jz3PqDbjFQnpwAZUjF
	FCoeXuTfz/h9Hia2oPSqb5t4NihJOn3qccKIr/RlCWKNnpOSks1ahy2CEaSN+6mqFRIimvKw+mSM6
	JTv/00jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9SC-0000000FbpG-2qKt;
	Fri, 24 Jul 2026 06:32:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9S9-0000000Fbog-2kZy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:32:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f703a9d05so52682f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 23:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784874731; x=1785479531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73ZeTEaj8KHhHEVAJJ3P+PdsqfWnK5wqTCpbWEuQreI=;
        b=QJm6bti3g1VYyAEvWe1WpmewLaCU5DeEVTc3WvOkYs1EbeqPQDcO32Y9oftTb+zkIl
         v1Wo6biw772SEHjYG2W89tFU0HSFNaPJePJdKcUUIq6FfmxTzLTrzZ65pqyZsveEFJxM
         35zsofHc3dyyF6gA4KVgNB3bKv3HeWLn3Dxec1PptWKWcvG6FThzBa+bfkH6gJ8Ebz3b
         bxOMY83UUImoLJJiSOL6QoAlxZ07x3gWgi1u8RJiyAYTsj5gc1sB1CdCSmuhJ4h3epPl
         n9V05IYEi0/pkO8qrue8ErOpKQx1EbUkqbUUDlyAs26Jj2dU5+/H/TnVgawTIggvLxXo
         08NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784874731; x=1785479531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73ZeTEaj8KHhHEVAJJ3P+PdsqfWnK5wqTCpbWEuQreI=;
        b=EEGuKOkxb5mxnnOY+ytfnxyO+aIUXpeAPNV674K4QpGHLpL+BYNRAOULJ1kr8+xBhU
         4vCYn1VSmhUS4tBOtZRt9icodlt0h6BTFzcDtNwoEMTwB8ZqLFUxM7NiWI4+IIBbF1HZ
         ZB13VHZ0gipBChsmCLD4KUDrwkqMcX2EE8fSLYye7oN7nZgfS9UbcsmjVA/UC07iY2R4
         ZHL3mqNyOeMKKAvYYxjnB2GasM/EXFBdgG5s8qUGOm7RYgk+k2pjE4K35ZzyO2DW2WVe
         QZhrw0iPzwCcM/COAe0f3t3/kqUhPVQvBtHwlT2pxdjiHpnPmnYRnnofaVP2KjDRN1RJ
         g+BA==
X-Gm-Message-State: AOJu0YzEi/2VtKxb879cG+zpYOLCWdqcg29YQK9PNdmNMcqUGUgUWYJv
	inEnHS5wINk1wjteODLNG27nM3vGnaoMgind3ZGTPFezgizfD1vpu7F50jUaLTjQ
X-Gm-Gg: AR+sD10I4THMtwX/hpGClAkH8FLkU2RLwCQoPrvMq1hGGiKmaXVDhIbqckPrddrpnC3
	6RBWezG01t9p0zpPmiVBNlEbj1JKxEdzq3mQd8B7LJqN4fp7GUm4u1OheiPaREF6ELXTO4Tsd9/
	Wt/WEojS50LjxbPpt9BK1RhgnsKcjmdWEjpFa7Cidv7Eku5WxeA1Ra9NbYArybC6K9JKOuaFGng
	2Ir82ovbqrxKsjQpN+f6m3IF8m/Kxs5fcnGO1DVd1e2nRxj0l+x4ADSIVqZfudSW9Ugykb0TRT2
	EAvxFa1GBCWnUQy8+hbca7t3wnaZ9OhFQEPlM3GKTKmfBr0b2/rcFqJE1KzCHAj8M9vGXDqH4P0
	+5/bptlvj3ieK1VAYgIKnpB2OL4HytXUE8XpeckPR89S4BntVd6T/LJ2i5EvTVhI8fkGE0Rav5w
	OCZijp67AIjfx6+ICeSgDNlKV3WHARk42O38waSHj+F8DP1vJvL81fW1AGMYCaYlaYM2zz4h9O6
	EaeOJPZJPtz5jCjzVgEVQq8J2OvHJ9T7aSnlFC8odvl
X-Received: by 2002:a05:6000:310e:b0:47f:8b94:19d5 with SMTP id ffacd0b85a97d-47f8dcc4039mr7731901f8f.57.1784874730787;
        Thu, 23 Jul 2026 23:32:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-086-196.77.7.pool.telefonica.de. [77.7.86.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm23428862f8f.7.2026.07.23.23.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jul 2026 23:32:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Cernekee <cernekee@gmail.com>,
	Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH] ARM: set MAX_PHYSMEM_BITS to 32 for !LPAE
Date: Fri, 24 Jul 2026 08:30:48 +0200
Message-Id: <20260724063048.12565-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_233213_701405_426FEE6F 
X-CRM114-Status: GOOD (  10.42  )
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

The default MAX_PHYSMEM_BITS of 36 was introduced for LPAE platforms,
but also applies to non-LPAE ARM, which has 32-bit physical addresses.
With GET_FREE_REGION and CONFIG_WERROR, this causes:

  error: conversion from 'long long unsigned int' to 'resource_size_t'
  changes value from '68719476735' to '4294967295'

Use a 36-bit default only for LPAE builds.

Fixes: db57f88e4ccb ("ARM: 8411/1: Add default SPARSEMEM settings")
Assisted-by: Claude:claude-fable-5
---
 arch/arm/include/asm/sparsemem.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/include/asm/sparsemem.h b/arch/arm/include/asm/sparsemem.h
index 421e3415338a..6b512be3a34a 100644
--- a/arch/arm/include/asm/sparsemem.h
+++ b/arch/arm/include/asm/sparsemem.h
@@ -19,7 +19,11 @@
  * These can be overridden in your mach/memory.h.
  */
 #if !defined(MAX_PHYSMEM_BITS) || !defined(SECTION_SIZE_BITS)
+#ifdef CONFIG_ARM_LPAE
 #define MAX_PHYSMEM_BITS	36
+#else
+#define MAX_PHYSMEM_BITS	32
+#endif
 #define SECTION_SIZE_BITS	28
 #endif
 
-- 
2.53.0


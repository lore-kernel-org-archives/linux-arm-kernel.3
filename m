Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4239CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k5W9L+tF2EoqaA4TJvMBGBc+NCvpRbc4OONWCg5ABzk=; b=BSd7DDeqZLS7Mmzh3mS/C3dUOJ
	7i5mkviuxG+8vGrywO30RjAZdiDwwfb1KI9GC/QmEfTNVsCpn1LnHNQgJ7vuZDCZJpQdVFxh1mLL0
	Q2fae9bp1l3EdQrqoUpU5p26+r8qifIFcl/Lpz/cqyDAxAiehyDXmwro7sMMjxy1gLW08VVt/MBH1
	QsjLJXyNUQT4wqu/jkocY/gdWGXQsf/TWyiA559nHcNONBoVmVQd1KiDf7fh1lJC9SE8AWOJpOyv4
	WnbdHcnBQZ1ZU3NPlX77sOFaoCnAS+NooNCysZIrBd+r9wBNT7NjgF86ScqqojMKRUckmWlU+Iih9
	z2v/+ypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6dAF-00000004mkZ-3TDl;
	Wed, 08 Oct 2025 23:01:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6dAD-00000004mju-2W0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 23:01:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-269640c2d4bso459475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1759964500; x=1760569300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5W9L+tF2EoqaA4TJvMBGBc+NCvpRbc4OONWCg5ABzk=;
        b=UwvX7+A9R+1VZOnqrcHDwxzMltfGOijW3pmT38JTO7V5Owo3zAK3FLYM2s3lwaUjmK
         qtG1UDwCDnT4vkUmVZx4K6WR0ObWOe56/yGFMu2KFPbaquL35gFb1goWttZKodw9ow6w
         Ib+CKvOQRUeBE23bEDAwnOeHhtmXL2KORgHNSXttIS49NkbIx48+gv3MQOe1tMPqkOzI
         +WZcZW6faoqRe4UelCtGBqYw0r+1YzCUuZmEgELn/BngdgyESki6dg6YL5PnWS/X8WTQ
         /epPASx6r5c/mBSfzWASZRYJB6oseVpgVZoJo6IKFlcynadcnrWFZzXGCw07uOgrkPVx
         2xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759964500; x=1760569300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5W9L+tF2EoqaA4TJvMBGBc+NCvpRbc4OONWCg5ABzk=;
        b=T6kPEuAQmIyHpw2nYXrwRshCnsFlbM+105rfh4YXd8ZAgQfko+42OifV12vgLhNUoz
         gB3ePu704HxkfaaBRTkrNd7MG+sKQuwhpgQBZslZFv11v4/9p+Xlmaz3HBD8wgUhYOta
         m7OIAgZq/f7Puv3JS6qwXGtUqon7y7Uw4m90yqyGPhC42k+EI33WBxRiENiipQMu2IHW
         TdSABX4xGb4gnURHIT7D1dEQXNL2/I3aNGOC2j5ry4+YIRoN41o3hGo6LjxiZ7VnMml7
         w9QJB4/tRtRKPUsgrHUoX0emisOCWfwXCzYOKHwnp4Ok1H3Fpczg+J5QO7j0Cbu4QUGN
         bj7g==
X-Forwarded-Encrypted: i=1; AJvYcCW9UGIkOGFhKXp/7yHTqWWf6O5diJ2ieMosoW8lke3uEY+Q9oFWYS/8MLhyn5X1yULRvZaBml2Xy0zZoHpj8zkl@lists.infradead.org
X-Gm-Message-State: AOJu0YwlbfzyDf2t0A47Kr57QSm8N0yjB4Ho2D73PrKkCCYqupzZoWvu
	RvvECDiVanR/Sbr4/MPCwkhfHfeJTjlCyZCrfaEw8nVXSXq/kgHyTyHDARgaBd+DfdOrSRvwbNX
	T3lNQ
X-Gm-Gg: ASbGncsywf5HPPpQCVHBw5ViZehhbrK6ECLcsUjoR8xgYOftGsJszf4FB1CIT5acQxZ
	RqLqh5qPhsrpm3Zxc7cr6VtDiQqfp5WJX3UP9hD41mpWpsz6xFvEk8fv7at/XRmcFz6KoQXvfZS
	07AZFoOM/SQxsY0CzL3hNF+A6RkHNkJac0D8BvdYl80GWzG+8ZHwJCVVER9j3mRnycZGNBphMD2
	0wuWEhPNFWmOuP/wQ8MopJwbufhvoIRqmImp04YJrEoLo65kqgMbwt1Be9hLfARgF+tw6Ni2cSU
	usptD7vZDFCcYMId2Op/hHoZLaeqhp1DFqax3/zUsjI7JFCH/C8Tw5joqOXOnedJNCCmmkNmtU3
	Qr7V6JmPu5xVD0X0sj1YsEJ/Krix4tcUtP5MIchVvzFpMqdiQtho=
X-Google-Smtp-Source: AGHT+IFVVBtilcvc90xqLx+h6jSzncMmGexTkEe1GC3NSmpRBJuGJpD3gOwtWgqftuAK7NSnheQ2AA==
X-Received: by 2002:a17:902:da87:b0:269:8407:499a with SMTP id d9443c01a7336-2902723ba15mr40415545ad.1.1759964500330;
        Wed, 08 Oct 2025 16:01:40 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::4:3b5a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e18557sm8361635ad.39.2025.10.08.16.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:01:39 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-team@fb.com
Subject: [PATCH] arm64: remove unused ARCH_PFN_OFFSET
Date: Wed,  8 Oct 2025 16:01:30 -0700
Message-ID: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_160141_876903_B1E65A4B 
X-CRM114-Status: GOOD (  10.62  )
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

From: Omar Sandoval <osandov@fb.com>

This is only relevant to the FLATMEM memory model, which isn't an option
since commit 782276b4d0ad ("arm64: Force SPARSEMEM_VMEMMAP as the only
memory management model").

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 arch/arm64/include/asm/memory.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index f1505c4acb38..585a46a122fe 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -392,7 +392,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
  *  virt_to_page(x)	convert a _valid_ virtual address to struct page *
  *  virt_addr_valid(x)	indicates whether a virtual address is valid
  */
-#define ARCH_PFN_OFFSET		((unsigned long)PHYS_PFN_OFFSET)
 
 #if defined(CONFIG_DEBUG_VIRTUAL)
 #define page_to_virt(x)	({						\
-- 
2.51.0



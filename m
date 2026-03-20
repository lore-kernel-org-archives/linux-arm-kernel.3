Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739041098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry+R/ZaKd/jQkpCgufXe2UFucnecXTxYuVWEy5sRefU=; b=FEvXh1o77E0F+KXPspqr6fgmHj
	oQli7DLLaNmWgKeiWj+9tVgiP0pZw1zNIvLFb4g7lmDO1oIkNhMjmy59SQHcUgESaGx4z+0nuc21G
	bretrmApBWAETefvoGeSt7Zpm9yykNh9zXV8yXGXypQaaPfWvkzrL8T952s9/QFNfnUU7W5jNrNy9
	EzXFO+BC2dQX2Lx1OYOdmmKgKJ5Uc47mCFUqa2/UY7tnZT+rpcaSdEyE9xSW02xLNir+EiME4K62O
	6JA7b13ReN7inp37LU1EIpR2pXw/pjuJNbAugQ+/IzBjq4FUD5JuXBd1bD4/vKI16i9LjZeZA67eK
	xHp/PweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKe-0000000CyZN-3vkq;
	Fri, 20 Mar 2026 15:00:12 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKW-0000000CyPM-25pN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48542d5aa9eso5235235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018802; x=1774623602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ry+R/ZaKd/jQkpCgufXe2UFucnecXTxYuVWEy5sRefU=;
        b=sTa5udqc69DgTk1RwGWqG/GdLbeO2wSPoKlwtykKv1ByFtRhE6WjpKhGC4IANFClrK
         yAUzmadUUG8pCSthR11rttHU/ChXwfJ2v0eLhi0i7u2yiTzDIY8ZqXs19H4AVlCVFLSA
         vepyWAkj0QiciMaiRZKGOLQ55mfHuT+balzymdtjxyIOyDoXA8BfKnyj3WlxllzX7i5l
         DmRiATWZJ87R0p4osfSEh5iBm3itABXKy1lDekH71iyjDWqJAjqIPDRAZV/yGXnuHtEx
         oA63f/p3W1l+WYZedPIRU6g74VjUZF+Ii9EFUejTQkMTm23Uc8dt/+I3Jpa5ajuk9ITM
         x/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018802; x=1774623602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ry+R/ZaKd/jQkpCgufXe2UFucnecXTxYuVWEy5sRefU=;
        b=I9k2iXgafKJkAHdfuaahEoSc4Z1Bu4M+9B7I/zHWThlKCaE4BDlUAM+9N1IQcrABCe
         DyC2wmNvPHxpTI23LNZa61xAq3f7RV3RuRxI9pLJu3y3fQ3pLTAxMwdAvvtIrq9WOaRz
         ZVQcI7ZOK+t4ZEHrLiWPbCiV9hB2NSmHFVDwiEJ9xcArN44XFtreNR/piQ8xSLkUxLQR
         gnpsG+o6IB+/KrFElM6b2WEbg8+C6QE4vX2u5jp1DBtXFUHLD0BpVlr44GbE4dF3t2sq
         T4YuycQ/ceNFzC+PYJB3isTqCIyQlTe4CkNzHiHsnR2tGFbjpiUhiD6+go62o3yNWoGw
         i8Ag==
X-Gm-Message-State: AOJu0YwyLVq6CQYMcK3IC+NLKuRfRUR/B0iy5zy+r7341KuOy5fOyhrC
	uw99wQiU4M+n+BRoVkwAqGCtHU+AB/0jawzPOs2/GKOVeITlqkCoP5OdpA3fPcZiQFnI9FzpPA=
	=
X-Received: from wmow21.prod.google.com ([2002:a05:600c:4755:b0:485:6976:d608])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b07:b0:485:3abe:ab86
 with SMTP id 5b1f17b1804b1-486fedab424mr52152315e9.4.1774018802093; Fri, 20
 Mar 2026 08:00:02 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:39 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=ardb@kernel.org;
 h=from:subject; bh=xcKv0iq0nxsp6X5JaqW8GiHsewOrGWIHuRHfq8YpCzU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwp0GtsN3TltOPrsrt2BdV3b6jJx5clvuzr38q3frW
 8FZxnvfdpSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJPI5mZLgfK623XG9/YMbb
 zItORtx3L8xmzvydcsxi1tbtaxmY5YsY/uk8vmXq83RThfOLXVyap3xeyITYpEfoRW/XPHlqWdE nE14A
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-19-ardb+git@google.com>
Subject: [PATCH v3 04/13] arm64: mm: Remove bogus stop condition from
 map_mem() loop
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080004_551895_A1624D50 
X-CRM114-Status: GOOD (  11.31  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The memblock API guarantees that start is not greater than or equal to
end, so there is no need to test it. And if were, it is doubtful that
breaking out of the loop would be a reasonable course of action here
(rather than attempting to map the remaining regions)

So let's drop this check.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7f7d63009440..652fe2c52b5a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1157,8 +1157,6 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.53.0.959.g497ff81fa9-goog



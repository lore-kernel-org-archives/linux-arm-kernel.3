Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90682D74EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dus1eDjKV8+fyJlWa6CeOHr5Q8TfY7EJ7ksMCXuuvE8=; b=wPpdLD1jiCG+tYQNsyb72kyl9R
	Yak3QcUeJfkW5tj/iumMklq1d3WCZDogEv6+6YhHChI1+znZh4xbI11G2mxi9aBlNbhBnmc0Ltnus
	0NvoMhFQeP3EJnDwscQtgsKVPyhuyHXlvoVYt77I5PkcDCMdAaud3LrvQDwL05r73jzGv2OQTJO5/
	KNfiNMBO4AW3OwIOLWjWcKlwW/p9pP8V/lTTrOAuKRZ62L45smVh6Bv4RDHRg3+zRk4l2bMf6CCXj
	TGwLc0D96tIaBAs+j10q1G/neWZN+TSWXM3trm6nYdEwUWU60NVPKCK4wkkiRyktIqmJP0pnzSNSH
	40hU4c1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsr-0000000CC67-3FZw;
	Mon, 26 Jan 2026 09:27:45 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsk-0000000CC0R-0h5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so36939825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419656; x=1770024456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dus1eDjKV8+fyJlWa6CeOHr5Q8TfY7EJ7ksMCXuuvE8=;
        b=de2rqMVVW5htAVj6l3p33SlDR7eLmUR04NsNb0Zt0tTwq2xKURBZ+L7tmCZsja0hHh
         OmIn30fspM9P2i7HfIaaQSr6pXmHkjYYYS0+UwI6tNVGLiw8pIifS581BLpqhYxwymzi
         frB/cPkR2fiUQVO9GhtT9ZDQengjT1v3H7Sccs7UpNPxIaI2KPH5Mms/fH/df0Q9GNHR
         8pnDlTtNUi8wkGiUBAyfgu1bphjBJ7/jld5o68nAkbDpjsbuiC6aaqE1KQmp6tg+qA6R
         03bOmbrIBB+RKEi1ugL7fCiGiRjXbCkJvF7h7KjDGTVfRxZ87r13rV208no/5Oqy27jq
         /PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419656; x=1770024456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dus1eDjKV8+fyJlWa6CeOHr5Q8TfY7EJ7ksMCXuuvE8=;
        b=BGicvXOplPYynjydeS/hzDUiNhLNcdpR4rsIYIBmmW8rosj7C0yuWxoJFaacPqqO/r
         ASGtEEGVU0/cXvGHgyQY4/Efr3YNLsjSINVdpZ1kpRcC5D1GjsgvA14B0y0qJtdi+Q2o
         AjiMl2JUphjiWrYm/zz5s00HnwwjFBsDoOew3x6y7nnuiOKOvdNGiobOS/jYD/VJ3eDs
         KYgQetIvGhBCiJ7gZBuq0SHHDAa43vdhzJrWVWCK8t6S/vcPMxcFfRroEcHbCgfFUCqr
         IURcGGvcClDuBijWnD5OSUIqrsog3vpZmdRsXPc+Yw7UjoumxjyEuq42+3pU3umNn4dV
         dPcA==
X-Gm-Message-State: AOJu0YxDM3J8Y2EjJABYvCDBaHtANUeGn+CIYZ+aPzy0k01xUAr0JkV+
	cBoLBl+y2c9TQRLzSw42WATjElZyhob+GZor0OSH+2dSEKnKTFgnMODzMcGyy9HYWIrCAcVCCQ=
	=
X-Received: from wmlf14.prod.google.com ([2002:a7b:c8ce:0:b0:480:4a03:7b6b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:528d:b0:477:54cd:200e
 with SMTP id 5b1f17b1804b1-4805ce3f893mr62195305e9.1.1769419656709; Mon, 26
 Jan 2026 01:27:36 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:37 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=ardb@kernel.org;
 h=from:subject; bh=AbBNGoFlUmz8DhotcNagR6+hcZWJ6aqvLIQOSvGP0oY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2Ctw67qkcsYnkz6HVyaIFV/R/hlm+kvXoVE7kZW7Y
 APXosqOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJEbfxn+R/2O9dR21crak6f7
 +c5MiwrF2xnXXYI4zDR6lOzKa4V2MPzTu6eudlBgRo3JnMb/EVvfGrmcsfoU/mC9Z4jaodsrJ+x jAwA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-18-ardb+git@google.com>
Subject: [PATCH v2 06/10] arm64: mm: Remove bogus stop condition from
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
X-CRM114-CacheID: sfid-20260126_012738_398737_1A73D3FA 
X-CRM114-Status: GOOD (  12.25  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d7faa98f427c..377bdc4d84a1 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1158,8 +1158,6 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.52.0.457.g6b5491de43-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5684CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADUQ++mlFIW7e7IV4zrfNK16oe25OrryHFNLylPLx9Q=; b=XCs7j3LjLiI8Ls3J9hSS7GVgqN
	/syy8vqpkyZ50PLP12G6VF3vpPH6n63srXlfuMdzHH10A6488eXRdiljx6dURRsXnViu3QL6BCH96
	9/Qo2GZo4Co+lxb3mpYZgMwBPJHEov3OEBPQhXc8jJeWMsF6wJ3GryURDcqZN2VBiZRfTht/grd+J
	WylDlSZw6fyfsvWcuURQ669hrEE9nge2TN+ccd0cl9+HvgpuqBTvgspdRBMUednLTklBDESSAxomT
	Lze4rVXVIzITgxZmf9/DP7eVVxExU6QZaltQ3IE5BFpJESItyWo9D6OqnrvikkGgzbLS5U4aZx3c2
	fxCwROpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj9-00000007bfI-3NrL;
	Fri, 29 May 2026 15:02:23 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyj6-00000007bdZ-46xe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45e2f74da10so12738940f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066939; x=1780671739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADUQ++mlFIW7e7IV4zrfNK16oe25OrryHFNLylPLx9Q=;
        b=jNlgPZ4TJJsd6PhTenlxYrv9xGtWlLOU0BgUpKeD2tZ4o5dC644MWlV2RUAeenhbhG
         WoD7iY1Gz1Ao7/Mzb29bJuAI8YRrDdJXl2o7u4slUMW1dRiSEknhwMpm7nYvejAy7DkK
         8WvvkThVy5ewzhSWr21x+14RZL2UmrpQPgbvqW2cogQlw6cVFVF/+LfNWe0IFbMqBadO
         jNpy8fyudcao/z8HGrCkBiBnYBFtCdA5TEPY4lnZsdTl+Rtslf9YjFR9LYSzj8taOFtc
         Q3D65uaSSouZci/5zvhvn1Cw/UOD/EKHv1C/wsPzesbHnEdYW7bBAT8fMNhRXeRcDOJ5
         kAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066939; x=1780671739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADUQ++mlFIW7e7IV4zrfNK16oe25OrryHFNLylPLx9Q=;
        b=KJTdLWfzV8RI0M9lgSdlNFW73IgOo2wTCdUA6BFxNaJtiLKKpJOlvF5k0fbpSK96kO
         bGEnRfkGtU2RvOuxPJYW4Vt67PoGGm8gvylVCqVlFwKRxmUsCRgJPP2nTgJ1baeZFaN2
         +oyntscZvAMZw7P/3WAzWYu4/oSpaH55oE2FjLw9zYdbLYE4sEynLQ8FURZSY8O9RbiZ
         1vBx9OtzF5Yo8mxVZLkZpUCDXhnE7REBCi15rMGonLlXdAkxG1hLaDrO2tJY+l2nuIrX
         KGRhA7cUzF5CXIBEav+pAJNDsHLqpU8G/OVLtXbzCNSUE0dwEppnIpCFAISd+WBIsj73
         DZsw==
X-Gm-Message-State: AOJu0YxIHdQ4SxLzQplTmAMAx/SzbPA6I/5prK7TFKQ7GakQeT7i6R7t
	xII4uXkJUoOyNihvf/lF+gaJtfDL823Ds0M0Gj1NThzZSOL1sKYRcI8UTxISE/T7XUQgUfJqTRy
	MG7Tzf574wFC4Zjre+R3Dot7GMefzj6qNYUHTkNau6d05RWB4DrtVrQUFN2P+aouAEB4+Z5sH1b
	OkjQbLOi9BmeUp+2UZEQNnmBZnUS7cDEdPvRW29KmjjFNv
X-Received: from wmco20.prod.google.com ([2002:a05:600c:a314:b0:48e:9137:b54d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4616:b0:490:8470:31f7
 with SMTP id 5b1f17b1804b1-4909c0b0175mr35812255e9.20.1780066938306; Fri, 29
 May 2026 08:02:18 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:52 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021; i=ardb@kernel.org;
 h=from:subject; bh=xJBQ0hvsJWcxX3OF+aBCCahIM1cYmsTmsethYm+trqI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVcJX97Dz7W+MMlK2LNwkUx18YdWxeHbuRF3RixVzy
 2VZWh91lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIncsWH4K15aydfEzd4bZFBo
 IRJ1wOPhL4sFl+slZr0uKIyeuuzbIoZ/xqFpXiaXjdJOHT9lXb/2g8g/3TdHPNLmFe0v7lp74/s mHgA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-18-ardb+git@google.com>
Subject: [PATCH v7 01/15] arm64: mm: Remove bogus stop condition from
 map_mem() loop
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080221_023178_F61AF7CC 
X-CRM114-Status: GOOD (  12.29  )
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
end, so there is no need to test it. And if it were, it is doubtful that
breaking out of the loop would be a reasonable course of action here
(rather than attempting to map the remaining regions)

So let's drop this check.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..112fa4a3b0eb 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1173,8 +1173,6 @@ static void __init map_mem(pgd_t *pgdp)
 
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
-- 
2.54.0.823.g6e5bcc1fc9-goog



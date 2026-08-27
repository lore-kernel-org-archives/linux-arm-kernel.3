Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B89C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JXhY5FIxYmRIyBNqCNy2Mkq7WbLcOyerPMehnqIVrrY=; b=WErWZpn5Epk1DGNbqli1fERd7p
	v+kj8VHewhPnIR3L4SsC5EQfNCqjwRy4kU063sc56AIdCuIgF8AZvsrdFn8QuV9Bn9U4snDp+HXsd
	XLQ5HGLVQ3kwTrygxzpPskND5xlDX0eIWVCMyDK9MOGOxLTXUb9UXYEMeimvpPi9KfNm97rDfmOFL
	OwUVGe4KqPm9kNxmdIh8aaQlcydgWy5yEvcm24qs4F3fzbO0eLxYveqLYUSpYuW86nsdAYdM4PNcY
	+PI3EBVTLVfpnrduthj0C5hn4oh4BAa2ht79nn/pUYeLOvQwAfrsNENNemLO3uT2glUGGPP8K9Veh
	3ZD45Olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDQ-00000004OTj-2j5v;
	Thu, 27 Aug 2026 16:44:36 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDN-00000004OSl-1XUE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:34 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso12176f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849071; x=1788453871; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXhY5FIxYmRIyBNqCNy2Mkq7WbLcOyerPMehnqIVrrY=;
        b=NzC6qwNCua6jKrlAG6uTAHv24s1U0WyBIg1mMfszliuMYdiVN/sz1197aSjnuoxR63
         5nBsSN3D8QIMwCpac0q/SWU28JZ8Q2dLVKWcHHGA/M8rwTgj2N+DUwCdav8PERcEbgoo
         LCAZPE1Bg7Q3+2bpVmc/fIYGuEQx5EbPtHVoodj30yS5Sjw95SvjX9griPEwBFsK99Mx
         /4y7RU9Noy3B3trmQhnDNGVGLfNIVGLrwcZ4hw3ut1xcqN3haC5L9xIqhbsmRaw7pK1x
         BWDEEDkz6MGfRrm0hbGIWjsb7n1PNTKmQMN47UMAFck8gCPrQZUJ02KD1UedAiidqGuu
         Y1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849071; x=1788453871;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXhY5FIxYmRIyBNqCNy2Mkq7WbLcOyerPMehnqIVrrY=;
        b=dwJqEkfJL6f6J1y7BfesEU6rkaub/y/Vwi5ix9VukE8iEWMi2gGL2hDw3Q2IPIsOHW
         rui8+nlcNu4hGZZJpd/ROAEW9btFlWfr9FtR1xVrMIFc9+2P3w9Fpm/7lUsEx6ZqlyJw
         9g9TbDaWGkA+mSt4s4HxejxXxeU6hHIMYjM5pQTwl0b893v1xWKg0gxDYM562ASa/aAZ
         fH4lC1ShDlAXt6RNMGbm8+W9i2WAx0CANCQhyUvWC6eLWYEiE9h1a0O2upuXxgDrOjLz
         2H1m93gOoD1dcUHknNcZjKdJ+4+V/WZOOw+FD4aCatoH4mlOc7bdmXFW6VPGOae/XkAt
         mgmA==
X-Gm-Message-State: AFuF++kZAiAY8LccFTN1h1hcU8ykBfjYo7XnuFerwVzTuP/KfviwWJ6Z
	35Esjak/s07fuVhgSalvTPgX2hSKKYr+NOMHfxG7KLFs7FQz5hHgmgd/n0SwIZRB6Yi0H6Pxrg=
	=
X-Received: from wmql11.prod.google.com ([2002:a05:600c:4f0b:b0:49b:2006:9521])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c30a:0:b0:49b:8c63:dfdf
 with SMTP id 5b1f17b1804b1-49b91c5749fmr2308405e9.15.1787849070540; Thu, 27
 Aug 2026 09:44:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:10 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=ardb@kernel.org;
 h=from:subject; bh=XUloMLRvD65MS8q2DriEUBZ9uHb1RahsmJYT7z5cG10=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZtTuOV5JlpnrJizO3SIa5RP/t4Tn/ifHNOsnDx+fP
 HTx0dWVHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi2+QYGXbGcpgrLuq5fD6X
 +2rW/cMbDn/8/pzb5/+S7cdf2hydNf0II8NPvaYrbJ+rDfaHVGrc4Nj9nsk1dV3NbkUZ/r+/KkR j77IDAA==
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-6-ardb+git@google.com>
Subject: [RFC PATCH v2 0/4] arm64: mm: Map fixmap page tables read-only
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094433_434324_A6106E5B 
X-CRM114-Status: GOOD (  10.48  )
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

This v2 now covers intermediate level page tables as well as the PTE
level page table for the fixmap. The latter is a special case, as it

a) is only accessed via the kernel image's mapping, and never via the
   linear map (except for ptdump etc)

b) must be accessible via a read-write mapping, as all manipulation of
   read-only page table descriptors relies on the fixmap itself

and so it is treated separately. The intermediate page tables may be
shared with other mappings in the upper kernel/vmalloc region, so they
must be updatable using the ordinary APIs.

Build tested and boot tested on a Lenovo Yoga C630 using 16k pages.

v1: https://lore.kernel.org/all/20260805104042.1107678-2-ardb+git@google.com/

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (4):
  arm64: mm: Map fixmap PTE tables r/o in the linear map
  arm64: mm: Use fault handler to permit swapper_pg_dir updates
  arm64: mm: Create r/o page table region that permits updates
  arm64: mm: Move fixmap intermediate page tables into .rodata

 arch/arm64/include/asm/fixmap.h  |  4 ++
 arch/arm64/include/asm/linkage.h |  1 +
 arch/arm64/include/asm/pgtable.h | 55 ++++++++------------
 arch/arm64/kernel/vmlinux.lds.S  |  6 +++
 arch/arm64/mm/fixmap.c           | 12 +++--
 arch/arm64/mm/mmu.c              | 48 +++++++++++++----
 6 files changed, 78 insertions(+), 48 deletions(-)

-- 
2.55.0.887.g758fc8c411-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56835CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlzHm3Kh9CNZ+/mVoBH+InGWftCSKC7MyW//Z6cIkFM=; b=iz1fO3IgB8ejiUH/1irSSXhw94
	fMC32k4VPxzPWAbrxoRgqMB9/hg+h6/v0Sw/pTE3vA2MufVI2pkMynRBLOeZ5PWmOkVyvXtQ+kAdG
	nrjmAvv7Fy2+sh6ZG/hnamktkDXL8NsTX82dtFDX6nOXfrFI6tafZ17/4XjtOGj1PSQKYoZhgfC9p
	wS0LiO5Wyx8BcEnYQP9d3m0s9GfinKrl3lICdvpCpTSf1EAMr6sShSZ0uCsyKtPyb4Q5bg570peVy
	5eFWeRKv3ELoFgyc0lmJ66nWAQVhHDFwm68qYJiWMBWwPz9KV+BVmTcaDXa2RIY7Nw/WlimHjY9JT
	sachnWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bt-00000008fYl-0sPW;
	Thu, 04 Sep 2025 03:26:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyDL-000000081Rf-3ETB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:52:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7722c8d2694so489169b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756947154; x=1757551954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlzHm3Kh9CNZ+/mVoBH+InGWftCSKC7MyW//Z6cIkFM=;
        b=jFlLdPxkx18eAfVXJO4sSafejhA4yv7v5XqVDxopTIr6J+EXqkp5lvpZZIAx/ztEgP
         nA7+75iMyKDJvls/DcEbNlAQZVkFJoUFpBV/2YmvxqCeRO6OAHx7xNm2nsBKjOOHIz7M
         GZTQB130r3baQ5cRihA7zNy3xgtMO1lzSG8X7wD+K7+85EBpPVm4ApJnH8Ei99VfInBc
         H6ojRyp5vwq+OHaX+pyIYTeDmdRoab0iKyaQRINEIVVFlRRL2Tu4GSmQFltEmd0Izf0B
         JSl+tym9nQDJqLbrKd5nNWKIbjXj6jM4tKloOQAiynRUTO+AP/rhKsfMPLOsCtOaUaL5
         FOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756947154; x=1757551954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlzHm3Kh9CNZ+/mVoBH+InGWftCSKC7MyW//Z6cIkFM=;
        b=f87ySsiCH04B99pkEZQUDDcJovnKw0DlEcrW0PNLdDVErGJ2lT44v64rLBrxXbY6UD
         7C8pDYtTyJy8YQ38KhZ6BLLBfHKQJ89xxLxY25DDChezLZpGpoZS1KkYw4VPKhhuyj9a
         6UzfsHhbMHNGOXZfuVbGCcj8u5F5rZQ9r5u/8k0FeBt7NnxolWXDgUzDcWWSQNKZh9zc
         eRS65Ti3ogrgK1ABJVrd74DcYSr4XEcx+Gz+wExhhd/oXOhvJbkxzadqpF3pL+8OAUkZ
         DOaILDINW/eHIqF/UsmjwoBNJgbiaGI9I3fuB0Pzgadvd5HOlgjBKwXBiDKOCT/RAwwU
         fCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMtpG7I3343ZIYfDsnN0m8k80OujF/kTH0xBreG49KQJZwurTwLpeWDsP3zm/DjCfknGYnKxIpwiILRxAMfV++@lists.infradead.org
X-Gm-Message-State: AOJu0YygvF2mvA2EIaRlznCdmMKlMbfBV3s69NCSlMd+MKDX3Vpt8e4L
	JQQIVrbNTyjxTvj1HWFDLlTS641bOeaWRjd1CI61z2uGwqp/+F23jw+6JyCMRSfkDP0=
X-Gm-Gg: ASbGncuYXCga2JfeDRocCBFwNu8ewUyVtS55cIbgXO0km1QE+whyV9qFipyVdWKFH43
	i9Eprv6B0+P+Bx8xJPWoUGHfkSRaKAjRSxMWtYl4Z9dTn1FsqU950A3bXKzkIgzGYM2wJl5snea
	LFjR3QNNuN6BQS1CCBdi8oVLKEeFhiY0qst6wypTKOYCe/s1AHC3xO800Cs1Ng23uZAT6+EWZg6
	ywQCn/MXRzm6IWMCNKJq7bciHyoMO+ilICsLLA991vG8ADdL0boTP9xmahv94xzg1yCGyBwIdda
	tRTVw0NCqj8Jvs8PrNraiv4LGKHjp68aRfrfDSO/rreIvtawrsDrAQ0SkUhsap9fUSlTelP3exz
	dZAqSkGgz1nqcQlwTDu9xuvTQQA9ZR9zdPg92EyLgcDI+SbpNszh50A4XNqqq
X-Google-Smtp-Source: AGHT+IESdzN7NSlqFScq8JWi82u0rrP72/Z26WNaGKK1m4GOUMXTi122NfAezDcYWcVvXHFHb7fKYQ==
X-Received: by 2002:a05:6a20:7484:b0:235:4a12:6adb with SMTP id adf61e73a8af0-243d6f04727mr24529715637.33.1756947154482;
        Wed, 03 Sep 2025 17:52:34 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:882:283c:10f0:c999])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28b3849sm15748931a12.31.2025.09.03.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:52:33 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Type correctness cleanup for ARM64 MMU initialization
Date: Wed,  3 Sep 2025 17:52:06 -0700
Message-ID: <20250904005209.1494370-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_175235_806368_EEAE579A 
X-CRM114-Status: GOOD (  13.99  )
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


Hello list,

This is a small series of type correctness and readability improvements for
ARM64's MMU initialization code. When I first encountered this code, the heavy
use of u64 to represent both virtual and physical addresses made it difficult
to understand where the demarcations were. I made most of the changes in this
series while troubleshooting a different problem (fixed in a separate patch) to
make that boundary a little clearer. I am submitting it now in the hopes that
this will improve maintainability and readability for others.

While nothing in this series represents a change in behavior, it is not merely
cosmetic: I believe these changes better align with the kernel's code
standards, type discipline, and common C idioms.

Happy Thursday,
Sam

Changes v1->v2:
- Correct an incorrect comment in map_fdt(), which is only called when the MMU
  has an idmap installed; it casts a static array to a physical address
  ("Stack is idmapped" -> "We're idmapped when called")

Sam Edwards (3):
  arm64: mm: Cast start/end markers to char *, not u64
  arm64: mm: Make map_fdt() return mapped pointer
  arm64: mm: Represent physical memory with phys_addr_t and
    resource_size_t

 arch/arm64/kernel/pi/map_kernel.c | 41 ++++++++++++++++---------------
 arch/arm64/kernel/pi/map_range.c  | 20 +++++++++------
 arch/arm64/kernel/pi/pi.h         |  9 ++++---
 arch/arm64/mm/init.c              |  6 ++---
 arch/arm64/mm/mmu.c               | 17 +++++++------
 5 files changed, 50 insertions(+), 43 deletions(-)

-- 
2.49.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF66FC6171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=; b=FkdEaB+3iIm4CCUR1HfAIc2oSq
	ON5PBb7EPpUkXiZKH7R2nuYVVtzIMqeHMjd2neSHlYZYew94ZqZK3cf/yv5xRhV4so5kYeq3l4KJy
	zJehVo3xbmDyif0pBJD+h9VCxK+PYH0mEiu8wSc44TIVqbNFPeo111O1ivC46E4yGB78zBwM1nq25
	j1hvT8pHp2XiOyOH4J3ly6x0MBGZLJkCpltdFnOyhfM0jjGs3Rvul4CKPeVtvDJHlPubBOgEMu7VE
	i0McKdn0SfyrkG40BuItXyG0SRHrqkIqrXDIRUK5E/uM0ofpUtUkkD0akAn+KtzeYihtCSmpll9kX
	dOMkWzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxId-000000097AJ-4BVq;
	Sat, 03 Jan 2026 08:47:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIa-0000000979c-1lMW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:47:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7f216280242so132328b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430067; x=1768034867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=cyb3PRFutmc0WwAKdP6FmqGs6KNUtLEG3/dp27VoQpv6uBKpZ1TyeovSwWILbdyj/q
         X1kzeo8QlDTFbdhQwnx8RchR7PRbl4TaJVhLaavqCn8PU8E2U9f1vQVBqDA4UCG1z7CA
         Bd9Sp5+zt+IPxsmZA8MjAxb7Y0MwMNkjwBqTfIoUu00ZNASH9Xmn7b/95QizLfpA6VJ/
         IyzQzOuo2lEv0eSxUH7BrKzahbUGSbDO2QUWv1HeNNplM0EZxKyjQieNkmGCzSVVCd8o
         37oZHUkU0r5j0yWxSamsh0twrZz28YX/CMOgrpzycEK6CZz/TKZJUsS3YCpL+VlYzTrr
         tj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430067; x=1768034867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLfzaNCKblQsWrgVFWjAAIDp8UyGda/a68IUZKqrEfs=;
        b=NMuODckFZRhMqLm+Ux0LpeIUF1v9X+AEjbXS60zjX+xhuvv9TBFoYFSLrK/2QyE1sZ
         UMUxRgyp+392eSyZ1LMr5LjFj3Vk+IIMpDj2LYAhQrzDmnSwmApsrN49pbVrM+IDQASg
         x/A97/LmlDLaM2Ix8gQRmtgozjxaB7TdmrPp3oetIotITdt1064AVMmDLpZPlFzEbnO9
         TzH45div4KukNd5AdyXSxJ0dhkH9vHK3x0v6/4TkgOJwgoNXQUnwhq8GotWC5mbVgYgK
         CMLRSzwEUvEe72hj6Xg6EFKvh6ohe83ifNAmvkTjzaneLOaRoFPRFxTSqZPx50bwgys9
         wBzg==
X-Forwarded-Encrypted: i=1; AJvYcCXfGbKDxtQGT8b3kqB4I0Cv9/QyLcFDGm1yvG1fOf9/k9YRdUdhDE+dE7tM3ZNi+CQ8tsvTR8pSHfqpn3nP5JzG@lists.infradead.org
X-Gm-Message-State: AOJu0YxjkV3ELg9wPwJE7O+8eiP1qhUf/JEBf7/grEuzwIIgSD1KqJjF
	qNluLTSmV/2GF6TPZH2xw2zwRyCx7QrQ6X3L/4cT/fgzVjq9q0aWU5kF
X-Gm-Gg: AY/fxX5dDeHa+ACmHO8gydnQmusUy68rA+H+7lPyZ/NjGovXjiQXUpx90YJDS/jIJVZ
	RElvGwRl6cZAvYYObJ4R3DxhW/e2B9OA7Dyae5WvF6QnofixTaZd4bx8z+G4IdB3YRsgDjQep9q
	Ppmr+hIDl96s9P8mB5JDqKO1258uF6ql6BJRoNW62e1+ZpUbWRDW3cbve08wViYGowqh9YCwNDp
	dKYC1gbVDDnLBGeaLQXQxL4pURo/9FsLVfoAyh1NrDaIRaH7WGNrJMEFEDEmS3TXE3Mgdoczduw
	wtpkk8mK2DbgGzDob2MLiah2FonPOPh++kAwiIs2mRxs82zQLZIWSTKDZqlCSTrfNRBKfnWFOgd
	mW2n5dCqDKtk1xzp4FIa6vB9f1kFevNcGsadaABzGk1Eq98p4bGL1Ix6t9La083btWxLecVXylm
	Kt/vhE3fu7bWY6dtIc22qtl+DfYuwhEymhS6g=
X-Google-Smtp-Source: AGHT+IFlp8qcq2QazAOf3KnrJVHQQLc5fUVTVkMNEtXBSYaNUnUycb5/s395woDebt+kaXn7KmVKuQ==
X-Received: by 2002:a05:6a00:4ace:b0:7e8:3fcb:9afb with SMTP id d2e1a72fcca58-8148ba19ccdmr1341264b3a.17.1767430067508;
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:47:47 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 0/5] uprobes: transition from kmap_atomic to kmap_local_page
Date: Sat,  3 Jan 2026 16:42:38 +0800
Message-ID: <20260103084243.195125-1-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004748_483248_B029FFDA 
X-CRM114-Status: GOOD (  10.45  )
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

The use of kmap_atomic/kunmap_atomic is deprecated. The purpose of
kmap-like functions is to create temporary mappings.

kmap_atomic() typically disables preemption, while kmap_local_page()
allows preemption.

According to the documentation, kmap_atomic() is primarily necessary
for contexts that cannot sleep.

> kmap_atomic() may also be used by interrupt contexts, since it does
> not sleep and the callers too may not sleep until after
> kunmap_atomic() is called.

> kunmap_atomic() may implicitly depend on the side effects of atomic
> mappings, i.e. disabling page faults or preemption, or both. In that
> case, explicit calls to pagefault_disable() or preempt_disable() or
> both must be made in conjunction with the use of kmap_local_page().

Link: https://docs.kernel.org/mm/highmem.html#temporary-virtual-mappings
Link: https://lwn.net/Articles/836144/

Keke Ming (5):
  riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
  uprobes: use kmap_local_page() for temporary page mappings

 arch/arm/probes/uprobes/core.c     |  4 ++--
 arch/arm64/kernel/probes/uprobes.c |  4 ++--
 arch/mips/kernel/uprobes.c         |  4 ++--
 arch/riscv/kernel/probes/uprobes.c |  4 ++--
 kernel/events/uprobes.c            | 12 ++++++------
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0



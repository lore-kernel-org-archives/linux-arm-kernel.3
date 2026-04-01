Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BA410FCAE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 21:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYPEpP1b00lX0zsw7xL3leAQo4zY3t6/Feqga7nFICY=; b=xBEXqCJeSAyjnhbO+3xk04A9FF
	h7xKQsoN/N7NyOTZ5KDGni8XxESrY4oI0OBcU2l9Gs7AVLJGTjXkbTgvhN37Lf/n2bAAL9/ZJGF6L
	1uAaOWm0LhAB+iv2zb94mkcB0K6habDI7P++Fcok1g3gEN/8tH8t+Gp/kXoGgvNTQc8RrupmaQajj
	gRRSXTIl/K+hb6vtMLf2BuZXZkP3nQ8DuJKCCLbcxDQoyz2+D7J0q/9x8SgYL72O2Ew8GTMACMR8B
	pavRBUcyjOMufSdyHLR9UQ2fdIzJ5OkFpTuQgmbsdqwXMMgwyUF16V7W4o+pyR2gXmMTMHUo+V9ia
	N3mSSPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8374-0000000G71W-2OUn;
	Wed, 01 Apr 2026 21:28:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8371-0000000G70f-0xif
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 21:28:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so97435a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 14:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078910; x=1775683710; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYPEpP1b00lX0zsw7xL3leAQo4zY3t6/Feqga7nFICY=;
        b=KI1kpBTYDYtWsEnZP8m0+DYCykmgr69874HNdiigw2tvkkHq6wbas3XsgNVgsvkZuw
         X5Mbt4gCeQ0z96+WAwmluzQ/63icMDO1Gbs5/jvzE6KYC9TRn/258rljbVDrIP3X6Dqs
         PTJx0aKg+ZjqDUXR5phTnFo5b1uGzUxRw+ORUDvYpFij/RQKTrwDiDomXnQgPark110y
         nMkKXaNNyFum6SDhULpBFLEhiuz5hVh49vTfAWRuLyEd+gjOBhK3GjRWwpADddErhbkT
         LwobFK3YpiYpnJQ+2XJXSMq6jZF+qcoAEYuV2HNvojYt5DX049tU5tGlBWhCWvK7GSZr
         fYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078910; x=1775683710;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYPEpP1b00lX0zsw7xL3leAQo4zY3t6/Feqga7nFICY=;
        b=QbRRBXIpoPuwO/LeePC5Uom8vYBcoUGDDZqSw8+SbdDA8QlS57QGgAINLY8+WYmpD5
         bvPUzFPGGwRUGOufbZ6UupcUDKw8UvkNUk3ERS3t3SDbMrb1haMJGpFIwttl6zOdnh4s
         3hAYITWrtQElJsSFOI574LN4X7YdZqzsGWW+wXLuB/nVMrPE/3pm9RdiLAHxILWhMGtn
         6yymkT0rYb05utukblRDEewkZ9934zDE9OzGcUBLhaWDdidV4HF84+K6S713mnlsDo+n
         0erSkIu0EVjMw5pjTwT1J6yALElKoPEoYPSMyaPhQB1x/idh5RKjcI2u+poH9hz3pVaI
         uA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcGt/RhZ7J2KGz46DuLukjrPrupzlwde3M51vvPdAoQH2y7mVy9GhbvQqn7d5bXxNxhCgecp4zEk64uXsNh/L6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wC6+FCjJsSShXSlxgFx4mqHKtYyiYUayDHD2WqmTD+e5/Q1k
	1ZcvG0SuHs+bPJlfQbvF2v9mef+DZ+AzuAAmAhfBvgdbLJ7HDxU9sJS72nCn0uHyPmph750G1PT
	YwJUbkJ8=
X-Gm-Gg: ATEYQzzkNrmqCl0ghJ1cu5HHWeohyqJozfZY/pEvSbrbkvKgmzwHJVOpyPKrtd+5Tee
	mpKPL16/jpA67R7veNHbnZi8+38QOY3QtBtzcvaA+4OJaZxgqa6NjOzLYC4MdpQPVexptH9NY6N
	dhRpoVx+hEfHBBK6jZnDcr2++TIUOh1Ke8Hwb1IEuqffkHkEySZrG4/ilZTu5Tjsu+W0gUzwHEV
	eCt2LQGMTI0Y+cSJCkH5aBD3gbZ4OE22Tp1sH37Uks75ijX8P4wunCrYrRMlfO6oKwAKwbdgrmS
	3/I6yBkUVfngTH0TFb5aX4mzomy0f+N4CrRDSKWblWQPYxGjJuqBtiyD+WuttG8ptPODTVJkyPl
	xUVNZmTA8exu7n0iF9a4gDMnWcbwHfWs/utejf0kewETzG3MkBaHh1ZTP1+KSPDBwYVUavuxUn8
	/EcM3hEFMeSrQCT7XDD+nt1n7M6UIISQ==
X-Received: by 2002:a17:90b:3f0b:b0:35d:9f7c:142c with SMTP id 98e67ed59e1d1-35dc7052e98mr4367414a91.26.1775078910328;
        Wed, 01 Apr 2026 14:28:30 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e519dsm5918706a91.2.2026.04.01.14.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:28:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: soc/omap updates for v7.1
Date: Wed, 01 Apr 2026 14:28:29 -0700
Message-ID: <7hzf3mtloi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_142831_557200_FCE17556 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/soc-signed

for you to fetch changes up to 9ceb17ccd15ea32f19c9066f5f1b340d8340bd0b:

  ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4 (2026-03-30 14:21:20 -0700)

----------------------------------------------------------------
ARM: soc/omap updates for v7.1

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX

Julian Braha (1):
      ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4

Randy Dunlap (1):
      ARM: omap: fix all kernel-doc warnings

Thorsten Blum (1):
      ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo

 arch/arm/mach-omap1/clock_data.c           | 4 ++--
 arch/arm/mach-omap2/Kconfig                | 1 -
 arch/arm/mach-omap2/id.c                   | 3 ++-
 include/linux/platform_data/voltage-omap.h | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)


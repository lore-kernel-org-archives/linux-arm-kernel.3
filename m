Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F93D3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wPf0uRSSpLnYqlIzkS0rsVgXmQgHOpdy048dooCSMY=; b=jZbI27E/AcyWcEOOEhfItyIUMD
	C+mWk5eMsVLRo2Rc+o+GwH/uy9E3QVECtJDKq9dum32qKWC1xFB2jSTj0Zgy2bX6JWARbJZEfsOpq
	lbayPtFcWpESdObj45I6KAF6BQE42VqpyS9ZsKH9SAHaIjdQQlaogE8GNFKrIXBtzzjlpxwJGjYDd
	P1wNbdj82ZbmXD0OCG8VpDnZjGqc20GI4MCK0aXQp2oCHvXoBf/pEVIkJYvwMhJdsgFjnUoXg5mWK
	njcd3AGjI+uzakhtF457AFsf/zBhM+vlPhSwzJG8yCvdG9vf4ewlc3NCUZ0TbfrMJ0u4eW4tPOMoF
	FaiUin0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VbK-0000000C1xy-02vM;
	Mon, 28 Oct 2024 19:40:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VBJ-0000000BySx-34CR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:13:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so3538648a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730142816; x=1730747616; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+wPf0uRSSpLnYqlIzkS0rsVgXmQgHOpdy048dooCSMY=;
        b=B9sPgOpONu7i7Nt6g2Kpq3+HAIBZ926oDYCIQmhlM1bbjRVe6TbngKvNMMRjfwwRsl
         x64DayWlzCsBEYTj8P7wRwhDeaiZYkJmNen+1CX/tSWV8Rw392xrG//3wjlAeOgJyfIw
         r7nerYXpCBWOG1XDXsKR2Vtkz491V8sjgwpkswCthkf5t+ZuwxwNmNK89LuGl6k2xeDk
         P9z1GLUwmmNtKm2Bc7rrkwgn074B98jjj0TC8EvzYP9OahPrDjT4Rnt6lipW2Gn6qxco
         c5cCeeZ/Px86wDOoG+h6Zxyqz6Dmxw6O2ElkfFSs2PCFzjX0HXipa8KZgdcd0qE96a7P
         65hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142816; x=1730747616;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wPf0uRSSpLnYqlIzkS0rsVgXmQgHOpdy048dooCSMY=;
        b=t/bgPzJ4F/FfNvXYJ6ZZ4WISxlzsASy3zDLZtiZi1/gN6fKz2UManu0J8FnZQuQCaD
         uIVHVZtbNNttXeCKBB7H5TrtmADFdfxfKC8k7Ehhx64i6nTCsmOVb9NPLuG8AplAfVzA
         FJGoLBQpEogYhT3/PLxxMV58vzFKBjt5TmYtWncMTc64VzesEBxt5nPjsTe/HxZiY8/z
         BYWZcZpAG14lWkGVcrFXmf5qUrc4c9kjJ+LSRR88/y5pgl1ykAnR6p37bvgchACe5q15
         pS2Gxp2YVm+/AfuRRclu8s3RMkWKZJyjEzXA9CiqEwQTZEXoSgkFYnt0Fbvlv3g6WrbS
         kCGg==
X-Forwarded-Encrypted: i=1; AJvYcCXVdcM7aewRoFtFgjZJH4yWXj5xJpjvkLF0XDju6SQNBbrQHYluRt+eduRByQNW8Q9qufFB3F6FQKY6nsH/VjPf@lists.infradead.org
X-Gm-Message-State: AOJu0YxI7iprnlO4AtxjPEnpcPtiEJj8xD9JJjOCDsFKjMwrwVrrSdF2
	H/77SBVhIfMUkmsfMwHI8tiwOKY9KDqGPnEo/eTLuKhRZQiQqa8xGfXvr38HBaM1Iu07I8zngVJ
	M
X-Google-Smtp-Source: AGHT+IFT0QsLglj7KqKVyRTssBDkhBvc7PAxyM32RvptNPj9rARQb/YwzMROUFbw0zyiVLU6YmQjwA==
X-Received: by 2002:a17:90b:2552:b0:2e2:bd4b:ac2c with SMTP id 98e67ed59e1d1-2e8f11bad5fmr11585576a91.31.1730142816110;
        Mon, 28 Oct 2024 12:13:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771a82sm7683102a91.55.2024.10.28.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:13:35 -0700 (PDT)
Message-ID: <671fe25f.170a0220.f4c16.cb33@mx.google.com>
Date: Mon, 28 Oct 2024 12:13:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc5-145-g1bf329c696cf
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc5-145-g1bf329c696cf)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_121338_050007_1678EFF8 
X-CRM114-Status: UNSURE (   4.18  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc5-145-g1bf32=
9c696cf)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc5-145-g1bf329c696cf/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc5-145-g1bf329c696cf
Git Commit: 1bf329c696cf80000f1098bcdc23534e6fe14fe2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
Built: 1 unique architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>


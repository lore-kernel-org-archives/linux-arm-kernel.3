Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C5BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=; b=kSAyDnbqoPJngj9w3NVjlX9h99
	/NSGOYShaSrEt7saQEZnPHjCz8krqEr8zydwldQ2lMHW4O4V/bUuV068/9aPeuYOCtzWpMmDY+7CT
	0KQCgkNpS19uTNBlk94todVdCHYKD95HoqJ7cyS2tjd3Oj24L9TC35cOnCBKJJbtQznT/7JyOX872
	6rrL5h6ww3sLI8SWQcI0ZhW+FtxH1lJQUarTPbEAEb02BS4hhfDxezaH/KK5rURcXbzRz5hSj3QTr
	GJFra599i6uyMOTSWon0JCSNjLALbwyoAqH77MJPt/fr445sfr5BJdDPi8oLz+AhUly5zKJ5fEVE4
	zLdkzbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVu4-00000005Mjn-3mFN;
	Sun, 17 Aug 2025 05:26:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVrQ-00000005Mbk-1poA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:23:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e43ee62b8so1152751b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408195; x=1756012995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=F9mo3K/aXmMMpPzoMOI08+oWA/VLU/4sX0HbzMjZn/vJUnTvutjzlnlBrhbyARkcUV
         3wwpxGoZlZ+D3tVFiExfNisaDWlHDKN7UaakKzlpnHipTXyQwHkeh0WhpkXPg8RVkF4d
         uc6/IiPUF3Vz8kQ1SQeo+5wJshMhkwUwlNcUliIbfCK69FikLb/4dlz3di4DHcm7wmsQ
         W64QyQXn7ApzTo2DUqhC3tmhyABer+gDCWQotSHvqhAWkuRNK0SkL8iMw4Vb04c6s0DG
         fyYgCUq2bv/jeUEGDKKYQnUx//Zbc1UQI6VkU98cS27DWwrVBlwloilAjeeg47DTgibl
         3Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408195; x=1756012995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=G3wfHeS5CHQ/r5ORwyI/JgqV170E3/P4g7ca6MxXpVHMP1BJc81KtWr4iOIU/nxK8k
         X648JRY2/ytzMIkzAjuDEeJDm63A/VDy/AxDGTOnVmqlCj+E+/Xuib+SMcF0Ip8EqPTN
         9/Wd4WCuYisNFOg6mRSZNcCSIg1vtOlQDxdurDRxJ4aXFYJi7UT71obQ9OK+LkMvi9Qa
         VJUCXTMMfoh7sbk7JU3PXRcorzy57TrS4v71PXCjyBJN0rqEyRN5hWmwi0AgCzkxoogJ
         H4x/ioyDWQDue4z47t/qDPrsRlQFgoqrf6zm6lW2tT3zOUL6RuEiu6n5avnG/5bvHOM5
         7jEA==
X-Gm-Message-State: AOJu0YyY+kdOR3iGQA3KCbOS2yh3O2Jz3DX9zCVOqBZ9IsKEibobo/rS
	bHrU9HiG7ms2pu+EhYZLWmOl3bu7zrxLyMru5bRtGnRHrBS8dm/WdhIR
X-Gm-Gg: ASbGncsi3nVh9zNd/yMIEQU+zOv0ZzF2U7gkxiCWjUL2wQu45k1wQEPy3qaX5Ai0K2w
	lv9JXRXkstCqzWJqg3y9sJcRzGQK3QIevvJTFNBP6JCGxVs0+9TCqymACQJGYPjlDUFjbrBgiDG
	K/R4PcyvFk2FnfuFxF0WbFtPhoAftQdbGWlu6VqTuCSDsT8qocOHVoH1fveZpH85sh/qdvGKCSy
	PYEjQUAuWW4dzjrGGbZ7Rsd6KU3QjtvuFe9A/qHCw++cAv0r3P5PkxP+hc7RJYpb5D8XoRJTQ3i
	eUkuwRi1Le/plams/V1MvDfmFQjAD7FE0LS8pA2jhAJS124tjjnv4gXVXXpIFsSmUPARYbLDayy
	83hTWp6TGx0pPh6NX6HRdcDjC4ii0GFy1uAbojf2LYD0mVLRGPIKp
X-Google-Smtp-Source: AGHT+IFVbgdeT/QfwgQykch+QhrWI4zgFHqFV8jB8otfCty8P30FG2RsqWRDOf9aMTlgNZpyP1+N3A==
X-Received: by 2002:a05:6a00:3cd5:b0:769:93fb:210a with SMTP id d2e1a72fcca58-76e4484dee1mr10276988b3a.21.1755408195517;
        Sat, 16 Aug 2025 22:23:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4556670csm4405906b3a.79.2025.08.16.22.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:23:15 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Sat, 16 Aug 2025 22:22:44 -0700
Message-Id: <20250817052244.8822-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222316_498255_D079D2DC 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Hi all,

This small series makes cosmetic style cleanups in the arm64 kselftests
to improve readability and suppress checkpatch warnings. These changes
are purely cosmetic and do not affect functionality.

Changes in this series:
  * Suppress unnecessary checkpatch warning in a comment
  * Add parentheses around sizeof for clarity
  * Remove redundant blank line

---

Vivek Yadav (3):
  kselftest/arm64: Remove extra blank line
  kselftest/arm64: Supress warning and improve readability
  kselftest/arm64: Add parentheses around sizeof for clarity

 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/fp-stress.c    | 4 ++--
 tools/testing/selftests/arm64/fp/sve-ptrace.c   | 2 +-
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 8 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.25.1



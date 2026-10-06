Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AABCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=; b=0+Imm1MvrR8rKDIbR2Iyz/O7zk
	lWjmatxRNOe/16MCGIKm81UgxgyMkhq/UNAKEbzsjZNRzt41+tPhjrq/YKF0PmQFWsDwAVBcXyEtJ
	IB6RTFJP34WGqa5kUikaQwjOtXWI6B67t+TcyPj3jzO7EKxzzRlBdMlChXB45e0I59G/c40CuXu7/
	xLGjqBORZbk5MWr33Wh5HJvBZpNdEQ8tUqZ+Ghg2HcFk1W20+dHnrrEexPd9iTxHJ5ocNSoGadiQJ
	2LUajFszMSSoUn1TEiS2uMKq4AkkxJV8eeCVenzjVCD1OKzpKu4yx6eEJkIwFSWE7cXwRCLxDTP4Q
	Xzv8AyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyNV-000000006db-3ykj;
	Tue, 06 Oct 2026 06:10:17 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyNT-000000006dA-1xzF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:10:16 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-917a97b39e8so4012116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267014; x=1791871814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=rgOg75Kx4lvziQLfL9Z1jM17YvXeuMR/7Uaz+cud6yGoyFiWdl16Kks7JIytvFddez
         egGRzOms6RSrmSJaAjppRjV/S54TmbLLUQ2N4Ey0mtzmZT4winh19T0Eoay04fO5cvvo
         0g2a9r4MzMEpJtbT/fMOnL6VBWkuUVysvBXzHi5wA5L76I/pfHq1nOcHgzjertxCDAsO
         rEvtxpzH+DGwuXI/9GIj3/4VPIGV8G4LqocaM4n1LDpypjtqpU3sCjqDp6Xe2/QQnSWg
         WIaDhn4YvW73/rISPLTHlZ7wUZr9xmAiaDQEDvyhIxTFQlnC6jkIaw3jSLstieyHQMA4
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267014; x=1791871814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIXWXKVD7GsrdCHKFaXi1XwMsOECWaVXag6r6s+wajM=;
        b=CtN2OqW5amx4JX1YjR3BmtwW0yy9VVdISMg1O7wQWTVRBXjXYd0Ub5CxuRCAPUQn3t
         5yrhzApdZFt8Q7EaoVwYjn/cFCxoxUC6SdytnCFermJNG5ntVGu6CDpml/N1YLPnrTy7
         PhPOLdTrDv2mjJhy2ycXG8OEi4mAOmPV+3PcgFjC7FAqymI1OrsCWqRiBa/Cle0KBUdX
         dF+XZhLtG36nEIsKoWu0ZcGvoVU+1bUMplIeBFk1vBj2pQWDNUYn44XMdTPwNb/DEn+O
         0DeqKbjCYT03GotsHASXrIfkY8b2bvh15TRH9i7tD4JxvbcwzU8bXU/uautxe+UL2lJ+
         Uudg==
X-Gm-Message-State: AFq9FYIpz+CEaiXkmM+i+vdkCVf6JeJyLJy10vGXk2L4FDBURxyegDOP
	YrRxC+rnfXGpEBSwl8YJwUPBLb7UKGfF0D5gW/CT663RaNwFeJaYWvGpLFLhC3ON
X-Gm-Gg: AYBFou1fEZ2tYGA/18aGbsivUMwcv3MqNIjeusO1blThhhkXDqnSsql41kC9XFQS+Xi
	xbo+Olt2eeuvvSx3Kaym/8nv09r1LxEUVTb6j3k9j6pYzZlWnsBRt/YYa1+KGD9jrsUlZSPO7Da
	K4Jgc674EX1P61ffM0pYzOWLzrulgGzdu6lHgs2kR6FM9Da8uXy9MV32deuBkzunx/UTYF91pjI
	ZV+b0FvhplBSWNmWMc8g8hvEmCzApVDa/2Lv3ZT9So8upcuiCiV2HU6Fx5LNmBR2UhjDXD6O9sU
	ZcBK5Ad5zl2LHo2B4vO1Vg01TR/j2kmvUHvhXcILstQKxcTcAeYO2GFK29RcgFphn4XDqvc8GUK
	pbUtOQ87C22R7BGrGwel+cCkGD6skSNITsesfDCBC2qolreTg0JYSeLojM3mVL1w9KfbubGEXbi
	7SuLvXXeWX2RtHznUCUa4Vp7PG60U+QaLlm+RKgV2fuo+OWdzI31MDl3slvZ/3bcdVyUDEar+1w
	edWklL5RFR6TBes8FP5h/M=
X-Received: by 2002:a05:693c:639c:10b0:351:1272:e21f with SMTP id 5a478bee46e88-3514e2b0177mr353517eec.28.1791266514578;
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f73fcsm4442054eec.10.2026.10.05.23.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: tegra: fix typo "fuction" in comment
Date: Tue,  6 Oct 2026 11:31:48 +0530
Message-ID: <20261006060149.44677-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_231015_536917_2A52333E 
X-CRM114-Status: GOOD (  13.59  )
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

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-tegra/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index b21f51b8e19e..d7bc21bdb519 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -257,7 +257,7 @@ static int tegra_sleep_core(unsigned long v2p)
  * tegra_lp1_iram_hook
  *
  * Hooking the address of LP1 reset vector and SDRAM self-refresh code in
- * SDRAM. These codes not be copied to IRAM in this fuction. We need to
+ * SDRAM. These codes not be copied to IRAM in this function. We need to
  * copy these code to IRAM before LP0/LP1 suspend and restore the content
  * of IRAM after resume.
  */
-- 
2.47.3



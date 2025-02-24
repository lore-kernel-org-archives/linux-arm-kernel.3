Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24972C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 06:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VmWnaoXiw9bvC988XKjb1pxIMeweo2f9aT4aiVIQmfU=; b=hWPoLIm8WY/BFT
	6XWi/ptAIfsSPIABCLEQ9Y+pFjRScoiTfe5dkhjvYLZ7RiwCTtzETAa0k7lQ/aj4tXvJZrIBEANit
	F9PFON0Zo56IJcuYMdl6a7SQB5IUoBT7arXwKgKTi6g+i8gy1MxB5dc6GoqGSiebiazy8lhpcL3Kb
	iHQtZShZRni7n2vuongGQFZJg7EWM9tu4wlkCZNkEdIBTjltd/SJokWbwBWwitgA23512OhgytmSz
	zRjpPCGziRoGeUOzcKd/pNiKnHWhH0nuLZExrTZ9cvZIL1h7lWFJ3eSIoRsb0MORV+FnrepSlpQGD
	2Eyb7bo++5CjOflPxU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRrm-0000000CRIZ-3fHo;
	Mon, 24 Feb 2025 06:22:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRqE-0000000CRCw-1ZUV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 06:21:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so9226886a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740378080; x=1740982880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmWnaoXiw9bvC988XKjb1pxIMeweo2f9aT4aiVIQmfU=;
        b=dnJ2osL2FRs+4rNjRUaPUYdN5mdwRSU5k7YEAfGKavB/+YFkfpP5JgeDSy70XCmGkd
         85RT8K2fSc2MgtnVa3B+610sJ5xZMriyYh0WFYJasBm6o2IsSSG+Np22gBcf1Xar8GTk
         OCsplWZ2yjJ/a5pTwA+YqdnxwmXV4vXw3X+RGw6DNuhTcmY1FvKoC6u3dIY4FnX+kXpC
         jEI5t2IgAkbUFlitY7D8R2b0BfWxhuP2MxUZZHSrDp43/tkWnMR2jCG0i6Gk4NnWdqxq
         g8FjOkMj36nhv+YiRS1/P/L4WRgi0Yvi3KARwIE7IhlVZmnX69jI58dKcLuHEGC2BCeG
         Lx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740378080; x=1740982880;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmWnaoXiw9bvC988XKjb1pxIMeweo2f9aT4aiVIQmfU=;
        b=fOteAE66ZlNG2pHQxeCev2txFmzFWca3mh/p7iApHV7bvX/FrkCed9Tosg6AKxVj7t
         DGYZHJha4K1uc4MZKHNBWTCJ2KKbJW/tLHirXWv+wFdEJ8kcSCPxLAPsIHHfVNag06H/
         69msv9UoSDoyh/Aj3KQo56y7AJM/9Y2wB251ckQEuPZHn5KfZR1rodJVdjX0UNObA1HR
         /AzCVel4Vdl8tZl/EwWUaRetxEOuC/Dzx8FsNWUwIqWuwVWs9eTu3NkVONc9U46rk9qy
         QEgP9pXDumqjMB2IcngM2GSTTveWc62h7i0IWLZIIYtOy5B+WABN56Nxmh1LNGeMtdPQ
         aSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVNH5rmMIWoHCKtfx9gmAEiiwRpoL1JDFfqFbMOoBUxcnwk4OCMhiEpPoWb2cF5R7RNDkeVFJGet4TJrplsjLBp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Wgr7WBbHZTWO2iyhsD/SLslXFzvdfap0K891Oae30/L10Nc0
	Mvm781Q9hcjI8omAqzQuh+sRA81Hl5rFjjOLnZ4vsAjARCmr/u9jldfBUtOKyOo=
X-Gm-Gg: ASbGncsI9aqBoeXPyDSCdmUFeRtp4nHPA4Q6Y5IldidyWnyTVGNv0mxZ042RKLX90zI
	4eDK95edkh/p9d9mq3ufPc4sNuV1a7SFHAsbY2Kan6nkfulJX+4WH5Fh9nYAO7D865/8ZYu2uiY
	CC1L8OXWq/geuJBCrMhlh0zcZXUznlm9YAjSvRhpLcGis6u7AN3GfHIlTP4DMS2ydCm/5zGfsX8
	7sfSh39lUAGIannvMD3NQ+U2sd9QAsSXMa21Q2NJlHxkgLSXA3fkqJ0FMVc2EmWGPfJ3+eDRmgb
	V2Bsluy14h3vA15W0OLG81L51w==
X-Google-Smtp-Source: AGHT+IHsjFhFKXCpBbExhxMEiZqvYYVtXiZHd3OZG0pPrvCmize50lMccoY+FNwAAW55lD57cHl6Eg==
X-Received: by 2002:a17:907:a317:b0:ab7:46c4:a7be with SMTP id a640c23a62f3a-abbeda28000mr1446440766b.2.1740378080123;
        Sun, 23 Feb 2025 22:21:20 -0800 (PST)
Received: from Sahara-HP.. ([2a00:f29:201:83e5:28ef:beb3:776d:dc6c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322d0sm2195183766b.13.2025.02.23.22.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 22:21:19 -0800 (PST)
From: Keun-O Park <kpark3469@gmail.com>
To: ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	Keuno Park <keun-o.park@katim.com>
Subject: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
Date: Mon, 24 Feb 2025 10:21:11 +0400
Message-Id: <20250224062111.66528-1-kpark3469@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_222122_494765_A3BF912D 
X-CRM114-Status: GOOD (  11.96  )
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
Reply-To: keun-o.park@katim.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Keuno Park <keun-o.park@katim.com>

On systems using 4KB pages and having 39 VA_BITS, linear_region_size
gets 256GiB space. It was observed that some SoCs such as Qualcomm
QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
value to have minus as the variable range is s64, so that all the
calculations for randomizing linear address space are skpped.
As a result of this, the kernel's linear region is not randomized.
For this case, this patch sets the range by calculating memblock
DRAM range to randomize the linear region of kernel.

Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
Signed-off-by: Keuno Park <keun-o.park@katim.com>
---
 arch/arm64/mm/init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9c0b8d9558fc..2ee657e2d60f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -290,6 +290,11 @@ void __init arm64_memblock_init(void)
 		s64 range = linear_region_size -
 			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
 
+		if (range < 0) {
+			range = linear_region_size -
+				(memblock_end_of_DRAM() - memblock_start_of_DRAM());
+		}
+
 		/*
 		 * If the size of the linear region exceeds, by a sufficient
 		 * margin, the size of the region that the physical memory can
-- 
2.34.1



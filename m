Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161D9D74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDodzdvyFbknC8FIp1mljLdhQ9A1IRI/HhNeyykhxII=; b=oURFb/fqU3uqWm
	mujMHFeRtZ3qHXfmZ/5hO1ktKm0U2zTpOSU1KF34KXne9pbnXPZoA3cX9Vzs9P+skSt9qEuJR1c9u
	LN2ltgWCO7yHeflI2zLrWL+cxL7pD52vjrADduzJK4xr7pz4/9moK3IX5lCi+xfwZLKkxPjhX45o5
	ylJ5qyh6LnDagtAx5IS0DkDHGJy7B2SD0S1JddAMV+GwTffFNhKn6Z3BtoRpjgPpidzbxZd766Xrz
	D6XLSJof4gO5GsuUrPuEPM80iPxeuiwK17AfT9jFJMith8cAdSJlQAaTC1wXiifxFEogdtx7uulV8
	f9eaJSyP2EpZhVsgpx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTB7-00000009ebo-1IvZ;
	Fri, 19 Dec 2025 05:37:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTB5-00000009eav-1NeN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a137692691so16206585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122643; x=1766727443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDodzdvyFbknC8FIp1mljLdhQ9A1IRI/HhNeyykhxII=;
        b=mfTcEcjQjKtPJ/ePbgO7yJjjHP2Hu/qlnm1aH/YRKbK8MnZtba1KC3d5WCzgHXht8i
         qwurxUp8vsFGpxv0Hd1Bt9UO9VyqsmkB6qmY53T3jUCYN2764ydmnZoEl9m0f3Vg5Qh/
         yDoP4Nc2h6nTV6aWfxiiVRw1Z8clhFiITJXCPxZCp6k4HQOm4nJdnX3rnUUNjWXIdv//
         BVYJuAe27Ng5kOKnvbVL2NDVd76MN6cI0GV0KlTi0jyCh7puZTm63mkZa4qUQCFy9Dkd
         awNxPaOFcfxQinKs+e806U2NeQjK+jGmPYpmwcjDeODvz5WNRJRYi+fyYu9TIiRTO0zS
         tAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122643; x=1766727443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDodzdvyFbknC8FIp1mljLdhQ9A1IRI/HhNeyykhxII=;
        b=VSUmuxQP42qdy8woIcBH4wqV+uWayzcJhDlEqtxk+4J3dGpEBCNfHGAnw3R+kq1twR
         D5wsJhLl5+cry9BSsThi6GrfrLtqs/T8gb03m3cHZduUORdLpHwDZNeOzh8e8PzgqDMM
         hFx9zoWZ2YVj8dGHahKNWkVM0VfwBehwvmIFtN3M4c/rqTyyTR/U4O07TGW6JT2A/n+U
         7er0udaPZyk9ceSeSRJpqw9XSdFQmX4ghSKjt6EfqZkKis1QWsAZ6q7XtadbgDpQpoTp
         KDDnbI5H/7E7uq4xWHMqwxg8yjR4hbYTSD9xIWuOPzYRVAhskL8inkRNmnpy+lD+BVZ2
         VbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCk8q4A2x0gi24bDeybCFZprytKaeuvndgPuxi6stmmxGYoYzfL+CuYf6zGyBojiAS7U3DEYTs5GnSdZun+axJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxPe1aDoRzvVwl6l5If0XTAVL/xkmGYieG1MGZLk364yFCxjVHf
	f1G2iclNf1yo7iGZXwbqgOSFykJQv8eWC+uJf7IcWKU60kLpaYrPJEEo
X-Gm-Gg: AY/fxX4C+khO1lNwFKRKHk/BhAi/Q+1RobfuzK6WwvnplpWo5b0v7uu4207rEuWAi5D
	nB4wYXdCQaj8RKz15W4+db3SJczRuQx+Hq7XaHPA66QbJiT0/Q6FzOAHHi83o5JlsN+2Tl8PvH3
	ONTASsMK1g8rYy3XWK618TxHBXlNcgXCz82+r10DumPzfkDV1G0vtVFyB/jbT0yZ83zwtMCc+tC
	rKEksSSf69LAqR9U4hVjHSX0r8/K95F4IEXq9qXotstqDdXb5COgUYWJ/D4figmLWVhRzdTzvzi
	xNBRXz/15GsJz5kOKYb0kRj4dzV3JuR9diwX0G8f2R3pg4GnpTtY/akaDkfXbl0SGaELJ0ou4Oo
	Hb15p3I2ja09cysY52nAm9Km6GLWb9ME9etkrXm2qEpCDHy2KyF6oPw/2bsKEtTusrfLNykjdRy
	S0xGjVRITbpk1QjRVivYA=
X-Google-Smtp-Source: AGHT+IGzuZJ82GUInMpHHsz5Jh8P3tFch3LI3d67HGTpBsqXEpuwzDvEBW/+nSfCKMrEedniTwbWSg==
X-Received: by 2002:a17:903:1a67:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-2a2f23265b7mr14068335ad.22.1766122642560;
        Thu, 18 Dec 2025 21:37:22 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:21 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 2/6] arm64: Provide dcache_clean_poc_nosync helper
Date: Fri, 19 Dec 2025 13:36:54 +0800
Message-Id: <20251219053658.84978-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213723_418066_FE3E3559 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

dcache_clean_poc_nosync does not wait for the data cache clean to
complete. Later, we wait for completion of all scatter-gather entries
together.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 28ab96e808ef..9b6d0a62cf3d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
 extern long caches_clean_inval_user_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 503567c864fd..4a7c7e03785d 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -178,6 +178,21 @@ SYM_FUNC_START(__pi_dcache_clean_poc)
 SYM_FUNC_END(__pi_dcache_clean_poc)
 SYM_FUNC_ALIAS(dcache_clean_poc, __pi_dcache_clean_poc)
 
+/*
+ *	dcache_clean_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end).
+ * 	not necessarily cleaned to the PoC till an explicit dsb sy afterward.
+ *
+ *	- start   - virtual start address of region
+ *	- end     - virtual end address of region
+ */
+SYM_FUNC_START(__pi_dcache_clean_poc_nosync)
+	dcache_by_line_op_nosync cvac, x0, x1, x2, x3
+	ret
+SYM_FUNC_END(__pi_dcache_clean_poc_nosync)
+SYM_FUNC_ALIAS(dcache_clean_poc_nosync, __pi_dcache_clean_poc_nosync)
+
 /*
  *	dcache_clean_pop(start, end)
  *
-- 
2.39.3 (Apple Git-146)



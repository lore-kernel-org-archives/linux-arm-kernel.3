Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B74ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/S6efZZ4K7dF7U3Asoh4JvvsYEjTKzfYacmuEWma94=; b=HZHuJP17WRRgNQITCuCm0MwBss
	wtJOWUUHY0vCzxyUGmk4xLSySZEwa6WtfruzDkBcXOo/vNZofLxHi0GJIck+lcHeqp6gIElZtNWYs
	2c8KeWLjm5bdFJFzkBJ4FPDbLCKyaoeM1tF8YQKzA5HGbBTtp1NdShK1JhOTfe34bJrqqH1Jh65RU
	ZxzqnLr5PESog4Zs+59LKk6wsorFeaZGIClX0LRyeM8O2JZTmLPt72+ciarq0jY+hXMoNneYYRwLq
	gY35KCTZclp91HpK7L5TPEPgB7TDrzsBCD5cxL7FXrh9cfIiWQK6qrCItPDp42Uj4BWeMNWomLIZG
	yh+i8+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGauq-0000000DUf2-3ID8;
	Wed, 05 Nov 2025 10:39:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGauo-0000000DUeU-0SoW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 10:38:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29627a41299so1412765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 02:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762339137; x=1762943937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/S6efZZ4K7dF7U3Asoh4JvvsYEjTKzfYacmuEWma94=;
        b=PmtooBQx2DF4057lslreV/ADpKajToj3280B8i3CWqQKKy98pJr6lo/+K7OYKdWi5h
         SSYw8AeQ1F9rxnJDwaZuJWUtkLcHNFzZ6D+l9t9e5UR2ou33F6NmOPMo+ssYFluuFW4S
         2GQLMNkJuu4WwqZssvM09Il+EushAbbeD7YYGDoIu04cj3QP0+h81lDZzXF4oK2hfprh
         n63XjjcYpR9H5RUAnSHxGIISeUN/FPPtParjQUMmFAqNn8R6zVr1csSBA8u33AfEGjta
         Hcn1ZPNmGNZSwtCdaLXhj1eCqbyPXKsDAWHznA7DQogG2fHAsaGqiZdyJbBT03x2p7cK
         b4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762339137; x=1762943937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/S6efZZ4K7dF7U3Asoh4JvvsYEjTKzfYacmuEWma94=;
        b=Qb+rywImAgu/sCtmQqLv1A6rY5wA15LlrTSpG3qYwazsgu1sbAowfB90iZ4D+4pY7q
         SBbEeXU0ZkLEBXHXSgidFbdnQv3ye/9DeY4ssrGDJbxJsKLxZzpr/H6O2Hrr8COHN3qV
         pKwprYNM8WUF1kKrZmLyInHsYYRJhs3WbqWXe7eQ6jVtlgbz7O31G3oH0mf5rWmwWWLc
         6CKsUxugHZ82PIOLbdjw48vZgtXwGT1k90GIsNGdBN7pU45HrY/fxHk4xLh0KJWVCYeI
         qL2TdJp2zsKtrvBk6X8T4J0G6EIkuX3Txiyubh/Ub/RSckMW8Ac65M0ZiDxfsgxWy0j6
         RvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVzJuwEPOaggRDHKtDsOZxDLCzEkuChRrmS4L1pM8ZFX8CgZt7RQCOb9kg/Ax/v8g5NJG4qfbxlDrJRFR3AuO1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8olywKEYner6wmWKMABPKr7+CpTEYle/oCHWA83xBIDLVPgUC
	mi7GG/+vUlvZnMNSfbVqFvbzpzJ2271PWNqxBtMPAe3ZjmLkviiGRLTj
X-Gm-Gg: ASbGncuwmE5oYsmBRFMJnOnIdRogeojVEem1hjjjiVHaDxxYNavXpx+xOAjlzagubnI
	cpH6MVbnIbm/5Cz0ElNgBmU/fRCOhtenszqFRyh6xQYLtYHo7zOcScv/UD85LUyf1fhTODnhi7t
	8zhuOzktREEGb5CxKZTwQlV6bWEvVBus59zh6dGg6Z/q82pxcHcCrxuNo0sVD6Czj6I2UWUSdnF
	EiI2ZRzqJCO4laLy734JtVkT7IHbOZELJY65jLcFtjgETJjJ9cZRC6Qz85AgKR18ESS3jfyL/dN
	FRLzFOw/rTN1lqmKE4ioUDUGZQrprv3S/Qrmd+TVKCiE4DQh9QjnBv5og6JZZ5XUnGFNpBx/Q8N
	5TxUH2mG8aA0mfiQhHOYuhJPScnjfg3Oo79YtCo61zsoR695leeP8o4h10tV41sGxQlFJ1FkuZ0
	0r0lYKMS4Q9af5PE0NOEI6k+N2AQ==
X-Google-Smtp-Source: AGHT+IERJ8x6dB87v0+vrC6avWuudxSP9V12t0ZqiVo7ZsMsgz/1En6MknMu8HdtX/Ne7QYJ2ADiaA==
X-Received: by 2002:a17:902:ecc6:b0:295:512d:d19a with SMTP id d9443c01a7336-2962ad4701emr20819755ad.5.1762339137120;
        Wed, 05 Nov 2025 02:38:57 -0800 (PST)
Received: from localhost.localdomain ([163.125.181.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ad53896c4dsm4857704b3a.36.2025.11.05.02.38.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Nov 2025 02:38:56 -0800 (PST)
From: Yicong Yang <yangyccccc@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	yangyccccc@gmail.com
Subject: [PATCH v2 -next] arch_topology: Provide a stub topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY
Date: Wed,  5 Nov 2025 18:38:49 +0800
Message-ID: <20251105103849.4093-1-yangyccccc@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_023858_147397_D492A864 
X-CRM114-Status: GOOD (  12.35  )
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

The arm_pmu driver is using topology_core_has_smt() for retrieving
the SMT implementation which depends on CONFIG_GENERIC_ARCH_TOPOLOGY.
The config is optional on arm platforms so provide a
!CONFIG_GENERIC_ARCH_TOPOLOGY stub for topology_core_has_smt().

Fixes: c3d78c34ad00 ("perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yicong Yang <yangyccccc@gmail.com>
---
Change since v1:
- use a stub rather than guard the user with #ifdef block.
Link: https://lore.kernel.org/all/20251104134004.6964-1-yangyccccc@gmail.com/

 include/linux/arch_topology.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index daa1af2e8204..0c2a8b846c20 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -100,6 +100,10 @@ static inline bool topology_core_has_smt(int cpu)
 	return cpu_topology[cpu].thread_id != -1;
 }
 
-#endif
+#else
+
+static inline bool topology_core_has_smt(int cpu) { return false; }
+
+#endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */
 
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.50.1 (Apple Git-155)



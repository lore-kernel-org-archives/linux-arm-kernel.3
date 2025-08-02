Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4055C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G63QXIxj+Dtjk0K95q+UoQIrd3RUwOdJawqBP/rtSGw=; b=DzwsKUon5fgYqjwiDrv1FII1+t
	1bbL565QggGOG3KBEUFlNBoWnk5ddvxC8auL6ZPDLoIjHEbQzfjBWIjNrfHtoRG2Yvr3lVjFnDhEt
	0ygIZ7hvqoG5vJ3GMAbIhRESQJqrVwCG7RQ1n2FkxeQBUzAKIRxtOK/G2BX7jlwDJE4LnvgGAyn6E
	KgPzsCCaJvMmG5WcvtYS72tnIUPu+x6WwPhqruQ0V9gxM/pa4cdDZ67VIRF18WHlydp3pAXUnLRpY
	Hn/tn48ybuPm/wElNXYJ3UHHO+T/4wueZPjcRfSX9ZDt8rbQ4jlMR1XK6sroKYI4tQ2laRzvQKdI6
	klUziLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui9fa-00000007YDI-3nnF;
	Sat, 02 Aug 2025 10:40:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui9d0-00000007Y3X-0O2Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 10:38:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24041a39005so12122215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754131089; x=1754735889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G63QXIxj+Dtjk0K95q+UoQIrd3RUwOdJawqBP/rtSGw=;
        b=jmSw5iz4v8QXSUDzyuRItg0tinrnu3u+7Ib+ipHnmUKrOx+thD34YS3iTCWogQnNUj
         OA37Zbr7gc4WK7UcqATb7DezVZgCce2I5+qsGK7FEZeZeKEK5P2sCuCYr2beqc6+2c/6
         a5zjBeb5H3Qcxf5ZgqXkRXRl+V8fvE5PcLN0hU6QtD1O9aRJMxPmnwLAOghesOiP3wFr
         9cs6CfbXtlEVK40OKnSJwgUwOpzoqaCYuKF+80slNEwPw3OHdxlVUpPSj5TMq0C6D338
         Ej6Qu4FrytHBYqm56yORUR8rjmVDrZbVdo7ZDlq/L4z8XoQdRkF2tMQ4hdzcdM1Ss09b
         fwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754131089; x=1754735889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G63QXIxj+Dtjk0K95q+UoQIrd3RUwOdJawqBP/rtSGw=;
        b=pSNpBWVw3RLsT9OOijJVwWigivKSPZHJK4pR2Gft9rnOctkzhpVhB+REkumm/MruuG
         LqhYQct9kuVJuls6mUrabnVY3djkm+D7ijqAyKImXgLE6ZqDXXmT2DM36grJrhozzdTn
         dKtVqR689LnvTGXQalKsO7u8k7dOE0lyLq9/l2/mPcBv8p1JQq9OeKyNHi7WDSQJAMTV
         d0kHaG6HbvQEC0DfAOb9f7s+ER/nS5MUEySxA0UV5GmUgRbR71+0tJGPwU8HYmgIDVi3
         BsOX5ay7D9ignaWcgbjpDY+wBYUnaGvHGaYTX3vXvVXZ5FUWsdxAyMwo5lp5z82iRQHi
         ZWmw==
X-Gm-Message-State: AOJu0Yy733VIu1Rajw5QDdPlsVpdQYqEBH+HMzddonyv+BRmrMbyuFNo
	DH1ZEzmIcC+JmvvoBjGZt7Y6zixvufuhYLGPkfFxACT7lTnboBmagpevuSAaJzV30BegeMpU9+l
	Ch91xwki150BtFMNWsKLwruWrqlVvHk6fbzb9Cf+3tZDnvxuKxGsPIh4DPlJJ1ZpZvCjIix/npg
	CDW24vhhC6pg==
X-Gm-Gg: ASbGncv7LUmTUtunsfVJdOPdAU22NzTJFHeuMjP9GggU8PWYQ1GXuBFecaJZ9UYH7uy
	AAU9U/LKG3s/jKEAQOUwpdUErtSVKE8HIy2cDQbaKnZXlOpZl40z5K3Pv33KPIWmyGw4T0IZd20
	8gG8LZOtRiwJaA/XXPPmvxFpzZEKKi0YUhApI5P2pFIXK+LI2/9fheFNRgy+LTPWHSOT5I6XTNs
	JB0qhKykHVy0SBVIAQjIO/uqeI4v7ABaZUszu+SvRZqSo0JjsA01YffaE1FXnDMHQOle5mMg+8U
	OBL/fwVv4R7VlBjBk5epOUUeJXKYuPpXWS18raX99dGCjgcNnygZ4VYfOR4tsJNAZdBPZIiOmgF
	E0EeqBlt1gaal0zZvUD8qbkQpcK2nj0iT0LgY2H02zMbs3IyV90Qjr6nNgnls
X-Google-Smtp-Source: AGHT+IET2miJQcQuyN4A48qXGASFh6PFQlmTNZHqpeRrnOMmptg7WMuDBI8s0Bnz8/+S9PgeZ151wg==
X-Received: by 2002:a17:902:ea10:b0:240:3c62:6194 with SMTP id d9443c01a7336-24246f6a8famr37337425ad.20.1754131088712;
        Sat, 02 Aug 2025 03:38:08 -0700 (PDT)
Received: from zenbook (1-162-100-196.dynamic-ip.hinet.net. [1.162.100.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aca205sm63963445ad.193.2025.08.02.03.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 03:38:08 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] KVM: arm64: ptdump: Fix exec attribute printing
Date: Sat,  2 Aug 2025 18:40:21 +0800
Message-ID: <20250802104021.3076621-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_033814_411903_67B795B3 
X-CRM114-Status: GOOD (  11.04  )
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

Currently the guest stage-2 page table dump has the executable attribute
printed in reverse, showing "X" for a non-executable region and showing
" " for an executable one. This is caused by misjudgement of which
string gets printed for the executable and non-executable case. Fix it
by swapping the two strings.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/ptdump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index 098416d7e5c25..99fc13f1c11fb 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -44,8 +44,8 @@ static const struct ptdump_prot_bits stage2_pte_bits[] = {
 	}, {
 		.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN | PTE_VALID,
 		.val	= PTE_VALID,
-		.set	= " ",
-		.clear	= "X",
+		.set	= "X",
+		.clear	= " ",
 	}, {
 		.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
 		.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF | PTE_VALID,
-- 
2.50.1



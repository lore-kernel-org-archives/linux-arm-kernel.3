Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80256C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCGL317mUr/viDiHdvHr/Nh+V34QOpSJDtpLpPCiKc0=; b=Oh4F9s0mzq1idpLSbJPTWbCr86
	+Mdg9SZyLjafL5g+Pq0/cwRfJL2AKxnTD7+gyT7APfp3E40+1a4h5zZy2VthpgIdPznq4ZrjM4dx0
	KoxDQ8qka8HdgGmfjj+z1cBHLpIDRXW/3xlQbfu1kxdrUVvjS4uPTJ+sgVmCwqD8yuZ40jSBA/ftx
	md6FmuamoR0kU3exARD2UMw62XNf7mTZ6glWUR2L97p7rcd8d8zvUUKkCfoglw7royRqj/x58YRLA
	+Vw+btCODV337WwgT6jxA+3eE9JwLL7/BxAHzgxdnuASjkOQpTFDgnRoePkYOtq1AUMWGH+C/JBsA
	cOuuMMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDV-0000000BuVY-3J0T;
	Fri, 26 Jun 2026 21:36:05 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDA-0000000BuGd-0woy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c8018f11fbso12536115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509743; x=1783114543; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qCGL317mUr/viDiHdvHr/Nh+V34QOpSJDtpLpPCiKc0=;
        b=LWenNCwoYHe0WkuZYe5yYUAx02pJDtyFB7wfH8WeVFR2+E9RZTmvL+4gO71CMD2hpL
         R5baZl373o66HYDKbsTpR6/Oc9Z5pKrcKa4TLOkHJ3Gqn7973n1czaSzZEXPTB0IfWZO
         c3C+cGIpP2vZ33OrQN2SJIBotQiqOCqnz8WBxluCA5bTjQKaUG/Tp5TWtbVANLklTBOu
         b61pI2rEDWuYUGbkW9jDQxn3wKv8Keev5kRYarrcQry6cvOZolPVzzJU3+0EBohSsoWP
         v2OFW3kkw/vVSZ5sLsCb3Zzu3iaXRxMQu+7JnGfFVzXRBZ0takYzkvIT/wBRvjfJNUa1
         9IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509743; x=1783114543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCGL317mUr/viDiHdvHr/Nh+V34QOpSJDtpLpPCiKc0=;
        b=VrPrDjtKvS1SlLZX9eC/PvlNrWbUYKWlSDgdZKaLxzXcR6zmqRXLelDA/t2yoWfb61
         u5p/ykngSX/ISmjUDzlZ9OE0TJ+/idaduRfHO+v3xY3kvEvHm/98LPE+a/7ou2RytNgt
         vfFL+oXnUA2oWdg1kDbWuFCcMJwYfxkK56SooS9hBs8dboPeVAN3PmqhzYAKD6ccwviy
         xz6P0m/z6pT9i4CFjBXCIr0lRQzrzL+TP3q8/yhpI6NmOAr/BzfDeqkilGEoyqn/4kDZ
         ewn9LPnuiSjj+672DovbTm5+JBOg9m79PZucZtEv7h5s4p7yD3stTZzSeoxvfYZ7wwDS
         JjOA==
X-Forwarded-Encrypted: i=1; AHgh+RpmMJK5ZMtJOOULs3PZu/d0F1hcuwgJV+Uha1n832irVZAVP6layx2SErXHilCmsoImdGPunvY55GEFZsHYxskV@lists.infradead.org
X-Gm-Message-State: AOJu0YwwqKC4nGNcJIUdM5bMLDfsgsHo98cKhD+p+ucBc/jclQA/Nx5l
	/HWzDCP5Amu0QL6ybJLeoHVrGFUc6xOLKbItjkrFWhxfMIEveNY6lj4ICtVvk+IQxPH2gNr3Vf/
	PCVkTdQ==
X-Received: from plbv21.prod.google.com ([2002:a17:903:44d5:b0:2c7:f68a:7995])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce87:b0:2c0:3400:5c34
 with SMTP id d9443c01a7336-2c7fc75a558mr80368325ad.3.1782509742779; Fri, 26
 Jun 2026 14:35:42 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:18 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-6-seanjc@google.com>
Subject: [PATCH v8 05/20] KVM: selftests: Seed libc's RNG before using it to
 generate a seed for KVM's pRNG
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_143544_265846_00717950 
X-CRM114-Status: UNSURE (   9.99  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Seed the RNG used by random() using the de facto standard method of
srand(time(0)), so that a different seed is actually used in each test run.
E.g. without seeding the RNG, literally every test on x86 will use
0x6b8b4567 to seed the KVM RNG.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1016865d3f7a..277166ab1aa9 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -15,6 +15,7 @@
 #include <sys/resource.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <time.h>
 #include <unistd.h>
 #include <linux/kernel.h>
 
@@ -2284,6 +2285,7 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	sigaction(SIGILL, &sig_sa, NULL);
 	sigaction(SIGFPE, &sig_sa, NULL);
 
+	srandom(time(0));
 	kvm_seed_rng(random());
 
 	kvm_selftest_arch_init();
-- 
2.55.0.rc0.799.gd6f94ed593-goog



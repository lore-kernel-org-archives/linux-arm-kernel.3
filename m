Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAC9CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Gdhr42TK7HaiENwXEe169i/UA5JDaTAaZr1cyLBuko=; b=wNTGWyep/BquLRzp8IXb+jbe5l
	/9PEnl1XezwqltYSZpuvq+Z6y06BV7jCiw+UUQKnOH6Vjn0Rn1C14xGwOhq9baCN7eDnAoD8p7t9+
	EaUImy5kim9TmwbDO6xwlH50QkvW/89rPlb2lYZTIuGFDTq7hOCnUGwiT4x6nimBj1YCo9HMqaTcG
	sFWaBZj9Vzaac3gwpE2FvO+QSuF7ucnEwLaxaI/QIETkyZ63kb0MKroavCxmgdAne7OsO7BdxUsDn
	tRSUBFr+NdXFYhi8QscvZKVu6P75zkJ4ygSnhN5efaNdLSBTlxHiqcM46DgTvtEKTxii1XhgtpPB5
	k+nX/bZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7G-0000000BnfG-1BLa;
	Sat, 13 Jun 2026 00:20:50 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC76-0000000BnXU-35ew
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:41 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so1479566a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310040; x=1781914840; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5Gdhr42TK7HaiENwXEe169i/UA5JDaTAaZr1cyLBuko=;
        b=Qm3jJSMdd8EZ2GS/t+5sXq+ZHandPhlEDCm/3KA2ZVXs9lMMIyCVHCgppJvMHHlHLe
         yKuDqjzuS2OvR3eQ19k2lZawF8ELWB8C26wgM0jCwh0ez2au4RoJgm1cA7MQ+9wa9WBj
         tQzv6oDC4bfZzZhmW94J1aZHb2KfagUaNOzD8JWwHkdfDr3mcvhlJZpiFwdvCrEUynkH
         uA8YU8z5U65qQVOufGspkAR2UzFY4NBS0W7Mqgnb7taQowYiudGr2e6QrwTLIFSRhbl9
         sE1NmI9AgGhEVs0bPaccaPj2AXFgdHARrZ18zB7k1DbKeykH9zDlV3qdUhJHXINXvNw4
         wrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310040; x=1781914840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Gdhr42TK7HaiENwXEe169i/UA5JDaTAaZr1cyLBuko=;
        b=grGqk7IhHC0imVR9Ik5CSkhutq/HGgYokk1RFNmKVU9CyXurtHL5tvV/jqsHImkKiv
         8PJB1T3FLCczOkiXKMgreX6AqbqcEzztbvyBVcyMMAN4GSfiBIN82mIeDb3bUM+rLreU
         UHT+uo2gdy2vlZlRAFWmC3r+zDJrHkIK/oSNFETEOlDznsOmrG9kvkIIk5UFaVEwhUZC
         yK3ujJ08uDtyIgJl01Wuu2XY4xU01M1GOnPG1Q5l9aSt3m20FOhexsrdyyf/JwMO0Vj+
         Kjb4wR8a6wDL18wVqg/9oPJokZg4iSdX2r7/BkGV/YyM95W3eFaOS3sk12orYdyZA+6I
         XWNw==
X-Forwarded-Encrypted: i=1; AFNElJ9v7RgcGwA5EAz8qXUag5Gn3oJPneEDuor/PPvFO65LvBN11R9ZDLr6N0kXQgi8GYCZXZ299vYv7qP0dxYLHbyy@lists.infradead.org
X-Gm-Message-State: AOJu0YwBknr0Jq1y2Oxj0ObHvOC9nl2JxeZbmD2YuMiDSE8xcrHZPoAt
	w/0QvWtmUEZ98wnMQGQECGztZNk75PVCUyqODZHxpWayh7iJZJbJnEI4WCeRlqkeY0aCgyGoUuB
	oluVkKg==
X-Received: from pggg6.prod.google.com ([2002:a63:2006:0:b0:c82:798f:628b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfd0:b0:369:2e00:1ff0
 with SMTP id 98e67ed59e1d1-37a024176dbmr5248980a91.6.1781310039710; Fri, 12
 Jun 2026 17:20:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:16 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-6-seanjc@google.com>
Subject: [PATCH v7 05/20] KVM: selftests: Seed libc's RNG before using it to
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
X-CRM114-CacheID: sfid-20260612_172040_775046_80339852 
X-CRM114-Status: UNSURE (   9.01  )
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
 tools/testing/selftests/kvm/lib/kvm_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1016865d3f7a..2e08d9fcefc7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2284,6 +2284,7 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	sigaction(SIGILL, &sig_sa, NULL);
 	sigaction(SIGFPE, &sig_sa, NULL);
 
+	srandom(time(0));
 	kvm_seed_rng(random());
 
 	kvm_selftest_arch_init();
-- 
2.54.0.1136.gdb2ca164c4-goog



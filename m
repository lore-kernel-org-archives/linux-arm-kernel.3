Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66160CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/6C0dAUyoLQyauQofbYRj/vzpgwi+DjfoZxlhTk298=; b=h1wgBrTIK+KZmqBn9UziBp6Yc2
	OjsvtwRoTd/6SDgG2IAKkukA4qyXgzP5TwQMWTG/TFomiRqiY3M0jRXw9N3IDJFiskCwSDBKha7b6
	ySLX9+6Uo/8TNmE6cjvgztdKttcO9ZFJt+btAhnmwnAH4c9TO0AoOZ+4V5rdLcx/mx6P25XpD2Foz
	bUuRU3rNPMqBuVaM7HILWrsEkp14TLsUMPwQ8rT96fktMt4GZpadMh6/oeK3Pht82JBTsjyP87jMT
	8mGdq1Nz0IwDIsnNTx0SJdyJOsjNxywr9JtNPIlFbkrbUWuhR43IYiOmtp37VoMrdfT40bao33wGc
	nJzHOSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVhr-0000000F5Cm-0hW1;
	Mon, 08 Sep 2025 06:50:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVdm-0000000F3Fp-27ax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 06:46:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-25634c5ebdeso7156345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 23:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1757313972; x=1757918772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/6C0dAUyoLQyauQofbYRj/vzpgwi+DjfoZxlhTk298=;
        b=HP6ek6WBhjF1bjAgT/qwEEBfBDaDho2kV0bYeUsyJcWqPAx1gl9cvAAcoJG4WlPENk
         hoJ7tiY0uWq1XoQduLJE1iXiz1DbOc4bEPWs6hByoeTh32X9AB2koLTBkmk+6OTGyn9T
         isJ5krCBEYl/BGAm156lJJjzCI36/o6uLnaogB+CXPOSWgnFvMUNkAtawaB78fjp62Fp
         qZVI2BFGMd7xxrXN4OXqcDJggFUJ4JYejnrs4D6dbbnsi1KCNMrif7Polcn5q9RwMx+x
         DLe0YwnUwUN+zVl2UDivDuQ5cV+Ak/9OvjcUC4YXEQ3ulww2By5fXvGt8I5tnXydROcZ
         FUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757313972; x=1757918772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/6C0dAUyoLQyauQofbYRj/vzpgwi+DjfoZxlhTk298=;
        b=X9iji/4UYN2PmFuKfJUtmIenbVCU8vkHBBVk7D4mZlsq0fwqCuBgIOprR+Rh7Z6cbt
         3SjoXEDh8XtATyyzpPt8BjZ60U/5LsS6IPRvnR8jTqZRUqaIGKz1aQjveozrOkcl7hht
         BdZaHyBH0tMqoL5eExcGTUBEaMiuSA/8xx5vFIdSI3bBKCd6g4VWssevFF6oY4pkMDFP
         JfXaJPtA56JzYAEFYemvUxgCazjzgKWyWz3IfPsFyJ6zdyUd82ASj4KsDVGlwpW0ZTpd
         b2ELu6wr2LDqikzOaVb/4t/RZQTzK8jxpZu6sDDmwoK7Xd2RnTIIWFyVU6ksY/0KsNXW
         8CvQ==
X-Gm-Message-State: AOJu0Yzb/2XuUU58LUNcPmUqK5tm04/N9Vp2alz5oPS6OyajIEaVZRbU
	mfKRahD7kjj4m4JJhgwW8ynP1YSvsbIeKScq1Phrr5MIfT4z3pNz8vuUkx1BYpOGw1DTctt2xQO
	xfSKXB9edCRYFDxPghPFOZ/r6rfajbu7zB1sBaGtZ3ko9cjI4RNPdY23/VDFdNUFVq9eXawKXcA
	0DEG51rVHgzw==
X-Gm-Gg: ASbGncvQwrmELBBYFn4EchPiFG7BqjKCjiVbT86eiFrzc7+4/YkhDz7dfHfR2opv841
	dFWzw03zVmutAtJa2ep4qFMs5RY7+a/b7ECj705BvrtGDCI086N/Y8J0U4reAokwLSdrEz/xd1l
	3cJLvf0rP0IBnxmbBdy9aO+5dj50us5aGaPt7XzjEYm3SA+wTPeYEgJbi5unhOv5pxuh34T4bi8
	9EoAlzJ6eWj9kd6nXvNpx9jsR494NAc5Zgcr7OG1sszHCqGCbg9iv+BQthz1M3fhlgW0lNYZ1bA
	FSs2mEt1k2vi/C1jlZbrXVghrVQvstPzLn1CA8VBV4rjWmjH+n591uP3Jb/Z0KW3psCoIJ+MDt+
	Yh/G0T4EkH29J6r69cIlHBkkuFchCcrX+LHKwy2+tmDEUlwF/s0Lrq0rdPIDd7EJAayC3KYc=
X-Google-Smtp-Source: AGHT+IEQZar8WBAOm85u+suoluGDr+DTtstTbqs6dfovDku4FTi9XGSytpEOzcrDiccqig50y3evvA==
X-Received: by 2002:a17:902:f64e:b0:24c:be1f:c1f7 with SMTP id d9443c01a7336-25170e4187fmr86761255ad.39.1757313972470;
        Sun, 07 Sep 2025 23:46:12 -0700 (PDT)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5236338fcasm1574671a12.35.2025.09.07.23.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:46:12 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2] KVM: arm64: Remove stage 2 read fault check
Date: Mon,  8 Sep 2025 14:48:06 +0800
Message-ID: <20250908064806.4093081-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_234614_847823_2066CB84 
X-CRM114-Status: GOOD (  12.01  )
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

In the non-NV case, read permission is always granted when mapping
stage-2, so checking for it doesn't bring much. On the other hand,
shadow stage-2 for NV guests could potentially have non-readable
mappings when we align the permissions with those that L1 set for L2, we
shouldn't be checking for read faults in this case either.

So just remove this check.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---

Changes in v2, thanks to those listed in the Suggested-by tags:
  - remove the read fault check instead of skipping it for NV
  - Link to v1: https://lore.kernel.org/kvmarm/20250822031853.2007437-1-r09922117@csie.ntu.edu.tw/

---
 arch/arm64/kvm/mmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5c..fb239cd9f7a67 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1508,11 +1508,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
 	VM_BUG_ON(write_fault && exec_fault);
 
-	if (fault_is_perm && !write_fault && !exec_fault) {
-		kvm_err("Unexpected L2 read permission error\n");
-		return -EFAULT;
-	}
-
 	if (!is_protected_kvm_enabled())
 		memcache = &vcpu->arch.mmu_page_cache;
 	else
-- 
2.50.1


